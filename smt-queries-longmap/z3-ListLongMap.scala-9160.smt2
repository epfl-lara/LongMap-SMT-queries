; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109936 () Bool)

(assert start!109936)

(declare-fun b_free!29235 () Bool)

(declare-fun b_next!29235 () Bool)

(assert (=> start!109936 (= b_free!29235 (not b_next!29235))))

(declare-fun tp!102846 () Bool)

(declare-fun b_and!47377 () Bool)

(assert (=> start!109936 (= tp!102846 b_and!47377)))

(declare-fun res!865089 () Bool)

(declare-fun e!742818 () Bool)

(assert (=> start!109936 (=> (not res!865089) (not e!742818))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109936 (= res!865089 (validMask!0 mask!2175))))

(assert (=> start!109936 e!742818))

(declare-fun tp_is_empty!34875 () Bool)

(assert (=> start!109936 tp_is_empty!34875))

(assert (=> start!109936 true))

(declare-datatypes ((V!51603 0))(
  ( (V!51604 (val!17512 Int)) )
))
(declare-datatypes ((ValueCell!16539 0))(
  ( (ValueCellFull!16539 (v!20124 V!51603)) (EmptyCell!16539) )
))
(declare-datatypes ((array!86760 0))(
  ( (array!86761 (arr!41874 (Array (_ BitVec 32) ValueCell!16539)) (size!42424 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86760)

(declare-fun e!742815 () Bool)

(declare-fun array_inv!31675 (array!86760) Bool)

(assert (=> start!109936 (and (array_inv!31675 _values!1445) e!742815)))

(declare-datatypes ((array!86762 0))(
  ( (array!86763 (arr!41875 (Array (_ BitVec 32) (_ BitVec 64))) (size!42425 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86762)

(declare-fun array_inv!31676 (array!86762) Bool)

(assert (=> start!109936 (array_inv!31676 _keys!1741)))

(assert (=> start!109936 tp!102846))

(declare-fun b!1302325 () Bool)

(declare-fun e!742816 () Bool)

(assert (=> b!1302325 (= e!742816 tp_is_empty!34875)))

(declare-fun b!1302326 () Bool)

(declare-fun res!865086 () Bool)

(assert (=> b!1302326 (=> (not res!865086) (not e!742818))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1302326 (= res!865086 (and (= (size!42424 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42425 _keys!1741) (size!42424 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1302327 () Bool)

(declare-fun e!742817 () Bool)

(declare-fun e!742814 () Bool)

(assert (=> b!1302327 (= e!742817 e!742814)))

(declare-fun res!865082 () Bool)

(assert (=> b!1302327 (=> (not res!865082) (not e!742814))))

(declare-fun minValue!1387 () V!51603)

(declare-fun zeroValue!1387 () V!51603)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22592 0))(
  ( (tuple2!22593 (_1!11307 (_ BitVec 64)) (_2!11307 V!51603)) )
))
(declare-datatypes ((List!29720 0))(
  ( (Nil!29717) (Cons!29716 (h!30925 tuple2!22592) (t!43308 List!29720)) )
))
(declare-datatypes ((ListLongMap!20249 0))(
  ( (ListLongMap!20250 (toList!10140 List!29720)) )
))
(declare-fun contains!8270 (ListLongMap!20249 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!6099 (array!86762 array!86760 (_ BitVec 32) (_ BitVec 32) V!51603 V!51603 (_ BitVec 32) Int) ListLongMap!20249)

(assert (=> b!1302327 (= res!865082 (not (contains!8270 (getCurrentListMapNoExtraKeys!6099 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205)))))

(declare-fun b!1302328 () Bool)

(declare-fun res!865087 () Bool)

(assert (=> b!1302328 (=> (not res!865087) (not e!742818))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1302328 (= res!865087 (not (validKeyInArray!0 (select (arr!41875 _keys!1741) from!2144))))))

(declare-fun b!1302329 () Bool)

(declare-fun res!865085 () Bool)

(assert (=> b!1302329 (=> (not res!865085) (not e!742818))))

(declare-datatypes ((List!29721 0))(
  ( (Nil!29718) (Cons!29717 (h!30926 (_ BitVec 64)) (t!43309 List!29721)) )
))
(declare-fun arrayNoDuplicates!0 (array!86762 (_ BitVec 32) List!29721) Bool)

(assert (=> b!1302329 (= res!865085 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29718))))

(declare-fun b!1302330 () Bool)

(declare-fun res!865088 () Bool)

(assert (=> b!1302330 (=> (not res!865088) (not e!742818))))

(assert (=> b!1302330 (= res!865088 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42425 _keys!1741))))))

(declare-fun b!1302331 () Bool)

(assert (=> b!1302331 (= e!742814 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!1205)))))

(declare-fun b!1302332 () Bool)

(declare-fun res!865090 () Bool)

(assert (=> b!1302332 (=> (not res!865090) (not e!742818))))

(declare-fun getCurrentListMap!5165 (array!86762 array!86760 (_ BitVec 32) (_ BitVec 32) V!51603 V!51603 (_ BitVec 32) Int) ListLongMap!20249)

(assert (=> b!1302332 (= res!865090 (contains!8270 (getCurrentListMap!5165 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1302333 () Bool)

(declare-fun e!742813 () Bool)

(declare-fun mapRes!53895 () Bool)

(assert (=> b!1302333 (= e!742815 (and e!742813 mapRes!53895))))

(declare-fun condMapEmpty!53895 () Bool)

(declare-fun mapDefault!53895 () ValueCell!16539)

(assert (=> b!1302333 (= condMapEmpty!53895 (= (arr!41874 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16539)) mapDefault!53895)))))

(declare-fun mapNonEmpty!53895 () Bool)

(declare-fun tp!102845 () Bool)

(assert (=> mapNonEmpty!53895 (= mapRes!53895 (and tp!102845 e!742816))))

(declare-fun mapKey!53895 () (_ BitVec 32))

(declare-fun mapValue!53895 () ValueCell!16539)

(declare-fun mapRest!53895 () (Array (_ BitVec 32) ValueCell!16539))

(assert (=> mapNonEmpty!53895 (= (arr!41874 _values!1445) (store mapRest!53895 mapKey!53895 mapValue!53895))))

(declare-fun b!1302334 () Bool)

(assert (=> b!1302334 (= e!742813 tp_is_empty!34875)))

(declare-fun b!1302335 () Bool)

(assert (=> b!1302335 (= e!742818 (not e!742817))))

(declare-fun res!865084 () Bool)

(assert (=> b!1302335 (=> res!865084 e!742817)))

(assert (=> b!1302335 (= res!865084 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1302335 (not (contains!8270 (ListLongMap!20250 Nil!29717) k0!1205))))

(declare-datatypes ((Unit!43111 0))(
  ( (Unit!43112) )
))
(declare-fun lt!582571 () Unit!43111)

(declare-fun emptyContainsNothing!207 ((_ BitVec 64)) Unit!43111)

(assert (=> b!1302335 (= lt!582571 (emptyContainsNothing!207 k0!1205))))

(declare-fun mapIsEmpty!53895 () Bool)

(assert (=> mapIsEmpty!53895 mapRes!53895))

(declare-fun b!1302336 () Bool)

(declare-fun res!865081 () Bool)

(assert (=> b!1302336 (=> (not res!865081) (not e!742818))))

(assert (=> b!1302336 (= res!865081 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42425 _keys!1741))))))

(declare-fun b!1302337 () Bool)

(declare-fun res!865083 () Bool)

(assert (=> b!1302337 (=> (not res!865083) (not e!742818))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86762 (_ BitVec 32)) Bool)

(assert (=> b!1302337 (= res!865083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!109936 res!865089) b!1302326))

(assert (= (and b!1302326 res!865086) b!1302337))

(assert (= (and b!1302337 res!865083) b!1302329))

(assert (= (and b!1302329 res!865085) b!1302330))

(assert (= (and b!1302330 res!865088) b!1302332))

(assert (= (and b!1302332 res!865090) b!1302336))

(assert (= (and b!1302336 res!865081) b!1302328))

(assert (= (and b!1302328 res!865087) b!1302335))

(assert (= (and b!1302335 (not res!865084)) b!1302327))

(assert (= (and b!1302327 res!865082) b!1302331))

(assert (= (and b!1302333 condMapEmpty!53895) mapIsEmpty!53895))

(assert (= (and b!1302333 (not condMapEmpty!53895)) mapNonEmpty!53895))

(get-info :version)

(assert (= (and mapNonEmpty!53895 ((_ is ValueCellFull!16539) mapValue!53895)) b!1302325))

(assert (= (and b!1302333 ((_ is ValueCellFull!16539) mapDefault!53895)) b!1302334))

(assert (= start!109936 b!1302333))

(declare-fun m!1193109 () Bool)

(assert (=> b!1302327 m!1193109))

(assert (=> b!1302327 m!1193109))

(declare-fun m!1193111 () Bool)

(assert (=> b!1302327 m!1193111))

(declare-fun m!1193113 () Bool)

(assert (=> b!1302337 m!1193113))

(declare-fun m!1193115 () Bool)

(assert (=> start!109936 m!1193115))

(declare-fun m!1193117 () Bool)

(assert (=> start!109936 m!1193117))

(declare-fun m!1193119 () Bool)

(assert (=> start!109936 m!1193119))

(declare-fun m!1193121 () Bool)

(assert (=> b!1302335 m!1193121))

(declare-fun m!1193123 () Bool)

(assert (=> b!1302335 m!1193123))

(declare-fun m!1193125 () Bool)

(assert (=> mapNonEmpty!53895 m!1193125))

(declare-fun m!1193127 () Bool)

(assert (=> b!1302329 m!1193127))

(declare-fun m!1193129 () Bool)

(assert (=> b!1302328 m!1193129))

(assert (=> b!1302328 m!1193129))

(declare-fun m!1193131 () Bool)

(assert (=> b!1302328 m!1193131))

(declare-fun m!1193133 () Bool)

(assert (=> b!1302332 m!1193133))

(assert (=> b!1302332 m!1193133))

(declare-fun m!1193135 () Bool)

(assert (=> b!1302332 m!1193135))

(check-sat tp_is_empty!34875 (not b!1302329) (not b!1302332) (not b!1302335) (not mapNonEmpty!53895) (not b_next!29235) b_and!47377 (not b!1302337) (not start!109936) (not b!1302327) (not b!1302328))
(check-sat b_and!47377 (not b_next!29235))
(get-model)

(declare-fun d!141437 () Bool)

(declare-fun e!742846 () Bool)

(assert (=> d!141437 e!742846))

(declare-fun res!865123 () Bool)

(assert (=> d!141437 (=> res!865123 e!742846)))

(declare-fun lt!582584 () Bool)

(assert (=> d!141437 (= res!865123 (not lt!582584))))

(declare-fun lt!582583 () Bool)

(assert (=> d!141437 (= lt!582584 lt!582583)))

(declare-fun lt!582586 () Unit!43111)

(declare-fun e!742845 () Unit!43111)

(assert (=> d!141437 (= lt!582586 e!742845)))

(declare-fun c!124945 () Bool)

(assert (=> d!141437 (= c!124945 lt!582583)))

(declare-fun containsKey!724 (List!29720 (_ BitVec 64)) Bool)

(assert (=> d!141437 (= lt!582583 (containsKey!724 (toList!10140 (ListLongMap!20250 Nil!29717)) k0!1205))))

(assert (=> d!141437 (= (contains!8270 (ListLongMap!20250 Nil!29717) k0!1205) lt!582584)))

(declare-fun b!1302383 () Bool)

(declare-fun lt!582585 () Unit!43111)

(assert (=> b!1302383 (= e!742845 lt!582585)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!470 (List!29720 (_ BitVec 64)) Unit!43111)

(assert (=> b!1302383 (= lt!582585 (lemmaContainsKeyImpliesGetValueByKeyDefined!470 (toList!10140 (ListLongMap!20250 Nil!29717)) k0!1205))))

(declare-datatypes ((Option!754 0))(
  ( (Some!753 (v!20126 V!51603)) (None!752) )
))
(declare-fun isDefined!509 (Option!754) Bool)

(declare-fun getValueByKey!702 (List!29720 (_ BitVec 64)) Option!754)

(assert (=> b!1302383 (isDefined!509 (getValueByKey!702 (toList!10140 (ListLongMap!20250 Nil!29717)) k0!1205))))

(declare-fun b!1302384 () Bool)

(declare-fun Unit!43115 () Unit!43111)

(assert (=> b!1302384 (= e!742845 Unit!43115)))

(declare-fun b!1302385 () Bool)

(assert (=> b!1302385 (= e!742846 (isDefined!509 (getValueByKey!702 (toList!10140 (ListLongMap!20250 Nil!29717)) k0!1205)))))

(assert (= (and d!141437 c!124945) b!1302383))

(assert (= (and d!141437 (not c!124945)) b!1302384))

(assert (= (and d!141437 (not res!865123)) b!1302385))

(declare-fun m!1193165 () Bool)

(assert (=> d!141437 m!1193165))

(declare-fun m!1193167 () Bool)

(assert (=> b!1302383 m!1193167))

(declare-fun m!1193169 () Bool)

(assert (=> b!1302383 m!1193169))

(assert (=> b!1302383 m!1193169))

(declare-fun m!1193171 () Bool)

(assert (=> b!1302383 m!1193171))

(assert (=> b!1302385 m!1193169))

(assert (=> b!1302385 m!1193169))

(assert (=> b!1302385 m!1193171))

(assert (=> b!1302335 d!141437))

(declare-fun d!141439 () Bool)

(assert (=> d!141439 (not (contains!8270 (ListLongMap!20250 Nil!29717) k0!1205))))

(declare-fun lt!582589 () Unit!43111)

(declare-fun choose!1912 ((_ BitVec 64)) Unit!43111)

(assert (=> d!141439 (= lt!582589 (choose!1912 k0!1205))))

(assert (=> d!141439 (= (emptyContainsNothing!207 k0!1205) lt!582589)))

(declare-fun bs!37086 () Bool)

(assert (= bs!37086 d!141439))

(assert (=> bs!37086 m!1193121))

(declare-fun m!1193173 () Bool)

(assert (=> bs!37086 m!1193173))

(assert (=> b!1302335 d!141439))

(declare-fun d!141441 () Bool)

(assert (=> d!141441 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!109936 d!141441))

(declare-fun d!141443 () Bool)

(assert (=> d!141443 (= (array_inv!31675 _values!1445) (bvsge (size!42424 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!109936 d!141443))

(declare-fun d!141445 () Bool)

(assert (=> d!141445 (= (array_inv!31676 _keys!1741) (bvsge (size!42425 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!109936 d!141445))

(declare-fun b!1302396 () Bool)

(declare-fun e!742858 () Bool)

(declare-fun call!64116 () Bool)

(assert (=> b!1302396 (= e!742858 call!64116)))

(declare-fun d!141447 () Bool)

(declare-fun res!865131 () Bool)

(declare-fun e!742855 () Bool)

(assert (=> d!141447 (=> res!865131 e!742855)))

(assert (=> d!141447 (= res!865131 (bvsge #b00000000000000000000000000000000 (size!42425 _keys!1741)))))

(assert (=> d!141447 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29718) e!742855)))

(declare-fun bm!64113 () Bool)

(declare-fun c!124948 () Bool)

(assert (=> bm!64113 (= call!64116 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124948 (Cons!29717 (select (arr!41875 _keys!1741) #b00000000000000000000000000000000) Nil!29718) Nil!29718)))))

(declare-fun b!1302397 () Bool)

(declare-fun e!742856 () Bool)

(declare-fun contains!8272 (List!29721 (_ BitVec 64)) Bool)

(assert (=> b!1302397 (= e!742856 (contains!8272 Nil!29718 (select (arr!41875 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1302398 () Bool)

(assert (=> b!1302398 (= e!742858 call!64116)))

(declare-fun b!1302399 () Bool)

(declare-fun e!742857 () Bool)

(assert (=> b!1302399 (= e!742857 e!742858)))

(assert (=> b!1302399 (= c!124948 (validKeyInArray!0 (select (arr!41875 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1302400 () Bool)

(assert (=> b!1302400 (= e!742855 e!742857)))

(declare-fun res!865132 () Bool)

(assert (=> b!1302400 (=> (not res!865132) (not e!742857))))

(assert (=> b!1302400 (= res!865132 (not e!742856))))

(declare-fun res!865130 () Bool)

(assert (=> b!1302400 (=> (not res!865130) (not e!742856))))

(assert (=> b!1302400 (= res!865130 (validKeyInArray!0 (select (arr!41875 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!141447 (not res!865131)) b!1302400))

(assert (= (and b!1302400 res!865130) b!1302397))

(assert (= (and b!1302400 res!865132) b!1302399))

(assert (= (and b!1302399 c!124948) b!1302398))

(assert (= (and b!1302399 (not c!124948)) b!1302396))

(assert (= (or b!1302398 b!1302396) bm!64113))

(declare-fun m!1193175 () Bool)

(assert (=> bm!64113 m!1193175))

(declare-fun m!1193177 () Bool)

(assert (=> bm!64113 m!1193177))

(assert (=> b!1302397 m!1193175))

(assert (=> b!1302397 m!1193175))

(declare-fun m!1193179 () Bool)

(assert (=> b!1302397 m!1193179))

(assert (=> b!1302399 m!1193175))

(assert (=> b!1302399 m!1193175))

(declare-fun m!1193181 () Bool)

(assert (=> b!1302399 m!1193181))

(assert (=> b!1302400 m!1193175))

(assert (=> b!1302400 m!1193175))

(assert (=> b!1302400 m!1193181))

(assert (=> b!1302329 d!141447))

(declare-fun b!1302409 () Bool)

(declare-fun e!742867 () Bool)

(declare-fun e!742866 () Bool)

(assert (=> b!1302409 (= e!742867 e!742866)))

(declare-fun c!124951 () Bool)

(assert (=> b!1302409 (= c!124951 (validKeyInArray!0 (select (arr!41875 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1302410 () Bool)

(declare-fun e!742865 () Bool)

(declare-fun call!64119 () Bool)

(assert (=> b!1302410 (= e!742865 call!64119)))

(declare-fun d!141449 () Bool)

(declare-fun res!865138 () Bool)

(assert (=> d!141449 (=> res!865138 e!742867)))

(assert (=> d!141449 (= res!865138 (bvsge #b00000000000000000000000000000000 (size!42425 _keys!1741)))))

(assert (=> d!141449 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!742867)))

(declare-fun bm!64116 () Bool)

(assert (=> bm!64116 (= call!64119 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1302411 () Bool)

(assert (=> b!1302411 (= e!742866 e!742865)))

(declare-fun lt!582597 () (_ BitVec 64))

(assert (=> b!1302411 (= lt!582597 (select (arr!41875 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!582596 () Unit!43111)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86762 (_ BitVec 64) (_ BitVec 32)) Unit!43111)

(assert (=> b!1302411 (= lt!582596 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!582597 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86762 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1302411 (arrayContainsKey!0 _keys!1741 lt!582597 #b00000000000000000000000000000000)))

(declare-fun lt!582598 () Unit!43111)

(assert (=> b!1302411 (= lt!582598 lt!582596)))

(declare-fun res!865137 () Bool)

(declare-datatypes ((SeekEntryResult!10022 0))(
  ( (MissingZero!10022 (index!42459 (_ BitVec 32))) (Found!10022 (index!42460 (_ BitVec 32))) (Intermediate!10022 (undefined!10834 Bool) (index!42461 (_ BitVec 32)) (x!115676 (_ BitVec 32))) (Undefined!10022) (MissingVacant!10022 (index!42462 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86762 (_ BitVec 32)) SeekEntryResult!10022)

(assert (=> b!1302411 (= res!865137 (= (seekEntryOrOpen!0 (select (arr!41875 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10022 #b00000000000000000000000000000000)))))

(assert (=> b!1302411 (=> (not res!865137) (not e!742865))))

(declare-fun b!1302412 () Bool)

(assert (=> b!1302412 (= e!742866 call!64119)))

(assert (= (and d!141449 (not res!865138)) b!1302409))

(assert (= (and b!1302409 c!124951) b!1302411))

(assert (= (and b!1302409 (not c!124951)) b!1302412))

(assert (= (and b!1302411 res!865137) b!1302410))

(assert (= (or b!1302410 b!1302412) bm!64116))

(assert (=> b!1302409 m!1193175))

(assert (=> b!1302409 m!1193175))

(assert (=> b!1302409 m!1193181))

(declare-fun m!1193183 () Bool)

(assert (=> bm!64116 m!1193183))

(assert (=> b!1302411 m!1193175))

(declare-fun m!1193185 () Bool)

(assert (=> b!1302411 m!1193185))

(declare-fun m!1193187 () Bool)

(assert (=> b!1302411 m!1193187))

(assert (=> b!1302411 m!1193175))

(declare-fun m!1193189 () Bool)

(assert (=> b!1302411 m!1193189))

(assert (=> b!1302337 d!141449))

(declare-fun d!141451 () Bool)

(assert (=> d!141451 (= (validKeyInArray!0 (select (arr!41875 _keys!1741) from!2144)) (and (not (= (select (arr!41875 _keys!1741) from!2144) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41875 _keys!1741) from!2144) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1302328 d!141451))

(declare-fun d!141453 () Bool)

(declare-fun e!742869 () Bool)

(assert (=> d!141453 e!742869))

(declare-fun res!865139 () Bool)

(assert (=> d!141453 (=> res!865139 e!742869)))

(declare-fun lt!582600 () Bool)

(assert (=> d!141453 (= res!865139 (not lt!582600))))

(declare-fun lt!582599 () Bool)

(assert (=> d!141453 (= lt!582600 lt!582599)))

(declare-fun lt!582602 () Unit!43111)

(declare-fun e!742868 () Unit!43111)

(assert (=> d!141453 (= lt!582602 e!742868)))

(declare-fun c!124952 () Bool)

(assert (=> d!141453 (= c!124952 lt!582599)))

(assert (=> d!141453 (= lt!582599 (containsKey!724 (toList!10140 (getCurrentListMapNoExtraKeys!6099 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!141453 (= (contains!8270 (getCurrentListMapNoExtraKeys!6099 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!582600)))

(declare-fun b!1302413 () Bool)

(declare-fun lt!582601 () Unit!43111)

(assert (=> b!1302413 (= e!742868 lt!582601)))

(assert (=> b!1302413 (= lt!582601 (lemmaContainsKeyImpliesGetValueByKeyDefined!470 (toList!10140 (getCurrentListMapNoExtraKeys!6099 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> b!1302413 (isDefined!509 (getValueByKey!702 (toList!10140 (getCurrentListMapNoExtraKeys!6099 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1302414 () Bool)

(declare-fun Unit!43116 () Unit!43111)

(assert (=> b!1302414 (= e!742868 Unit!43116)))

(declare-fun b!1302415 () Bool)

(assert (=> b!1302415 (= e!742869 (isDefined!509 (getValueByKey!702 (toList!10140 (getCurrentListMapNoExtraKeys!6099 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141453 c!124952) b!1302413))

(assert (= (and d!141453 (not c!124952)) b!1302414))

(assert (= (and d!141453 (not res!865139)) b!1302415))

(declare-fun m!1193191 () Bool)

(assert (=> d!141453 m!1193191))

(declare-fun m!1193193 () Bool)

(assert (=> b!1302413 m!1193193))

(declare-fun m!1193195 () Bool)

(assert (=> b!1302413 m!1193195))

(assert (=> b!1302413 m!1193195))

(declare-fun m!1193197 () Bool)

(assert (=> b!1302413 m!1193197))

(assert (=> b!1302415 m!1193195))

(assert (=> b!1302415 m!1193195))

(assert (=> b!1302415 m!1193197))

(assert (=> b!1302327 d!141453))

(declare-fun b!1302440 () Bool)

(declare-fun e!742890 () Bool)

(declare-fun e!742886 () Bool)

(assert (=> b!1302440 (= e!742890 e!742886)))

(declare-fun c!124962 () Bool)

(assert (=> b!1302440 (= c!124962 (bvslt from!2144 (size!42425 _keys!1741)))))

(declare-fun b!1302441 () Bool)

(declare-fun lt!582622 () ListLongMap!20249)

(declare-fun isEmpty!1057 (ListLongMap!20249) Bool)

(assert (=> b!1302441 (= e!742886 (isEmpty!1057 lt!582622))))

(declare-fun b!1302442 () Bool)

(declare-fun e!742885 () ListLongMap!20249)

(assert (=> b!1302442 (= e!742885 (ListLongMap!20250 Nil!29717))))

(declare-fun b!1302443 () Bool)

(assert (=> b!1302443 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42425 _keys!1741)))))

(assert (=> b!1302443 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42424 _values!1445)))))

(declare-fun e!742884 () Bool)

(declare-fun apply!1019 (ListLongMap!20249 (_ BitVec 64)) V!51603)

(declare-fun get!21148 (ValueCell!16539 V!51603) V!51603)

(declare-fun dynLambda!3426 (Int (_ BitVec 64)) V!51603)

(assert (=> b!1302443 (= e!742884 (= (apply!1019 lt!582622 (select (arr!41875 _keys!1741) from!2144)) (get!21148 (select (arr!41874 _values!1445) from!2144) (dynLambda!3426 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!141455 () Bool)

(declare-fun e!742888 () Bool)

(assert (=> d!141455 e!742888))

(declare-fun res!865148 () Bool)

(assert (=> d!141455 (=> (not res!865148) (not e!742888))))

(assert (=> d!141455 (= res!865148 (not (contains!8270 lt!582622 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!141455 (= lt!582622 e!742885)))

(declare-fun c!124963 () Bool)

(assert (=> d!141455 (= c!124963 (bvsge from!2144 (size!42425 _keys!1741)))))

(assert (=> d!141455 (validMask!0 mask!2175)))

(assert (=> d!141455 (= (getCurrentListMapNoExtraKeys!6099 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!582622)))

(declare-fun b!1302444 () Bool)

(declare-fun e!742889 () Bool)

(assert (=> b!1302444 (= e!742889 (validKeyInArray!0 (select (arr!41875 _keys!1741) from!2144)))))

(assert (=> b!1302444 (bvsge from!2144 #b00000000000000000000000000000000)))

(declare-fun b!1302445 () Bool)

(assert (=> b!1302445 (= e!742888 e!742890)))

(declare-fun c!124964 () Bool)

(assert (=> b!1302445 (= c!124964 e!742889)))

(declare-fun res!865150 () Bool)

(assert (=> b!1302445 (=> (not res!865150) (not e!742889))))

(assert (=> b!1302445 (= res!865150 (bvslt from!2144 (size!42425 _keys!1741)))))

(declare-fun b!1302446 () Bool)

(assert (=> b!1302446 (= e!742890 e!742884)))

(assert (=> b!1302446 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42425 _keys!1741)))))

(declare-fun res!865151 () Bool)

(assert (=> b!1302446 (= res!865151 (contains!8270 lt!582622 (select (arr!41875 _keys!1741) from!2144)))))

(assert (=> b!1302446 (=> (not res!865151) (not e!742884))))

(declare-fun bm!64119 () Bool)

(declare-fun call!64122 () ListLongMap!20249)

(assert (=> bm!64119 (= call!64122 (getCurrentListMapNoExtraKeys!6099 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1302447 () Bool)

(declare-fun e!742887 () ListLongMap!20249)

(assert (=> b!1302447 (= e!742887 call!64122)))

(declare-fun b!1302448 () Bool)

(assert (=> b!1302448 (= e!742885 e!742887)))

(declare-fun c!124961 () Bool)

(assert (=> b!1302448 (= c!124961 (validKeyInArray!0 (select (arr!41875 _keys!1741) from!2144)))))

(declare-fun b!1302449 () Bool)

(declare-fun lt!582621 () Unit!43111)

(declare-fun lt!582620 () Unit!43111)

(assert (=> b!1302449 (= lt!582621 lt!582620)))

(declare-fun lt!582617 () (_ BitVec 64))

(declare-fun lt!582623 () (_ BitVec 64))

(declare-fun lt!582619 () V!51603)

(declare-fun lt!582618 () ListLongMap!20249)

(declare-fun +!4467 (ListLongMap!20249 tuple2!22592) ListLongMap!20249)

(assert (=> b!1302449 (not (contains!8270 (+!4467 lt!582618 (tuple2!22593 lt!582623 lt!582619)) lt!582617))))

(declare-fun addStillNotContains!464 (ListLongMap!20249 (_ BitVec 64) V!51603 (_ BitVec 64)) Unit!43111)

(assert (=> b!1302449 (= lt!582620 (addStillNotContains!464 lt!582618 lt!582623 lt!582619 lt!582617))))

(assert (=> b!1302449 (= lt!582617 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1302449 (= lt!582619 (get!21148 (select (arr!41874 _values!1445) from!2144) (dynLambda!3426 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1302449 (= lt!582623 (select (arr!41875 _keys!1741) from!2144))))

(assert (=> b!1302449 (= lt!582618 call!64122)))

(assert (=> b!1302449 (= e!742887 (+!4467 call!64122 (tuple2!22593 (select (arr!41875 _keys!1741) from!2144) (get!21148 (select (arr!41874 _values!1445) from!2144) (dynLambda!3426 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1302450 () Bool)

(declare-fun res!865149 () Bool)

(assert (=> b!1302450 (=> (not res!865149) (not e!742888))))

(assert (=> b!1302450 (= res!865149 (not (contains!8270 lt!582622 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1302451 () Bool)

(assert (=> b!1302451 (= e!742886 (= lt!582622 (getCurrentListMapNoExtraKeys!6099 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448)))))

(assert (= (and d!141455 c!124963) b!1302442))

(assert (= (and d!141455 (not c!124963)) b!1302448))

(assert (= (and b!1302448 c!124961) b!1302449))

(assert (= (and b!1302448 (not c!124961)) b!1302447))

(assert (= (or b!1302449 b!1302447) bm!64119))

(assert (= (and d!141455 res!865148) b!1302450))

(assert (= (and b!1302450 res!865149) b!1302445))

(assert (= (and b!1302445 res!865150) b!1302444))

(assert (= (and b!1302445 c!124964) b!1302446))

(assert (= (and b!1302445 (not c!124964)) b!1302440))

(assert (= (and b!1302446 res!865151) b!1302443))

(assert (= (and b!1302440 c!124962) b!1302451))

(assert (= (and b!1302440 (not c!124962)) b!1302441))

(declare-fun b_lambda!23231 () Bool)

(assert (=> (not b_lambda!23231) (not b!1302443)))

(declare-fun t!43312 () Bool)

(declare-fun tb!11393 () Bool)

(assert (=> (and start!109936 (= defaultEntry!1448 defaultEntry!1448) t!43312) tb!11393))

(declare-fun result!23801 () Bool)

(assert (=> tb!11393 (= result!23801 tp_is_empty!34875)))

(assert (=> b!1302443 t!43312))

(declare-fun b_and!47381 () Bool)

(assert (= b_and!47377 (and (=> t!43312 result!23801) b_and!47381)))

(declare-fun b_lambda!23233 () Bool)

(assert (=> (not b_lambda!23233) (not b!1302449)))

(assert (=> b!1302449 t!43312))

(declare-fun b_and!47383 () Bool)

(assert (= b_and!47381 (and (=> t!43312 result!23801) b_and!47383)))

(declare-fun m!1193199 () Bool)

(assert (=> b!1302449 m!1193199))

(declare-fun m!1193201 () Bool)

(assert (=> b!1302449 m!1193201))

(declare-fun m!1193203 () Bool)

(assert (=> b!1302449 m!1193203))

(declare-fun m!1193205 () Bool)

(assert (=> b!1302449 m!1193205))

(assert (=> b!1302449 m!1193201))

(declare-fun m!1193207 () Bool)

(assert (=> b!1302449 m!1193207))

(declare-fun m!1193209 () Bool)

(assert (=> b!1302449 m!1193209))

(assert (=> b!1302449 m!1193129))

(assert (=> b!1302449 m!1193207))

(declare-fun m!1193211 () Bool)

(assert (=> b!1302449 m!1193211))

(assert (=> b!1302449 m!1193203))

(declare-fun m!1193213 () Bool)

(assert (=> d!141455 m!1193213))

(assert (=> d!141455 m!1193115))

(declare-fun m!1193215 () Bool)

(assert (=> b!1302441 m!1193215))

(declare-fun m!1193217 () Bool)

(assert (=> bm!64119 m!1193217))

(assert (=> b!1302448 m!1193129))

(assert (=> b!1302448 m!1193129))

(assert (=> b!1302448 m!1193131))

(assert (=> b!1302446 m!1193129))

(assert (=> b!1302446 m!1193129))

(declare-fun m!1193219 () Bool)

(assert (=> b!1302446 m!1193219))

(assert (=> b!1302451 m!1193217))

(assert (=> b!1302444 m!1193129))

(assert (=> b!1302444 m!1193129))

(assert (=> b!1302444 m!1193131))

(declare-fun m!1193221 () Bool)

(assert (=> b!1302450 m!1193221))

(assert (=> b!1302443 m!1193129))

(declare-fun m!1193223 () Bool)

(assert (=> b!1302443 m!1193223))

(assert (=> b!1302443 m!1193201))

(assert (=> b!1302443 m!1193201))

(assert (=> b!1302443 m!1193207))

(assert (=> b!1302443 m!1193209))

(assert (=> b!1302443 m!1193129))

(assert (=> b!1302443 m!1193207))

(assert (=> b!1302327 d!141455))

(declare-fun d!141457 () Bool)

(declare-fun e!742892 () Bool)

(assert (=> d!141457 e!742892))

(declare-fun res!865152 () Bool)

(assert (=> d!141457 (=> res!865152 e!742892)))

(declare-fun lt!582625 () Bool)

(assert (=> d!141457 (= res!865152 (not lt!582625))))

(declare-fun lt!582624 () Bool)

(assert (=> d!141457 (= lt!582625 lt!582624)))

(declare-fun lt!582627 () Unit!43111)

(declare-fun e!742891 () Unit!43111)

(assert (=> d!141457 (= lt!582627 e!742891)))

(declare-fun c!124965 () Bool)

(assert (=> d!141457 (= c!124965 lt!582624)))

(assert (=> d!141457 (= lt!582624 (containsKey!724 (toList!10140 (getCurrentListMap!5165 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!141457 (= (contains!8270 (getCurrentListMap!5165 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!582625)))

(declare-fun b!1302454 () Bool)

(declare-fun lt!582626 () Unit!43111)

(assert (=> b!1302454 (= e!742891 lt!582626)))

(assert (=> b!1302454 (= lt!582626 (lemmaContainsKeyImpliesGetValueByKeyDefined!470 (toList!10140 (getCurrentListMap!5165 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> b!1302454 (isDefined!509 (getValueByKey!702 (toList!10140 (getCurrentListMap!5165 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1302455 () Bool)

(declare-fun Unit!43117 () Unit!43111)

(assert (=> b!1302455 (= e!742891 Unit!43117)))

(declare-fun b!1302456 () Bool)

(assert (=> b!1302456 (= e!742892 (isDefined!509 (getValueByKey!702 (toList!10140 (getCurrentListMap!5165 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141457 c!124965) b!1302454))

(assert (= (and d!141457 (not c!124965)) b!1302455))

(assert (= (and d!141457 (not res!865152)) b!1302456))

(declare-fun m!1193225 () Bool)

(assert (=> d!141457 m!1193225))

(declare-fun m!1193227 () Bool)

(assert (=> b!1302454 m!1193227))

(declare-fun m!1193229 () Bool)

(assert (=> b!1302454 m!1193229))

(assert (=> b!1302454 m!1193229))

(declare-fun m!1193231 () Bool)

(assert (=> b!1302454 m!1193231))

(assert (=> b!1302456 m!1193229))

(assert (=> b!1302456 m!1193229))

(assert (=> b!1302456 m!1193231))

(assert (=> b!1302332 d!141457))

(declare-fun b!1302499 () Bool)

(declare-fun e!742922 () ListLongMap!20249)

(declare-fun call!64143 () ListLongMap!20249)

(assert (=> b!1302499 (= e!742922 call!64143)))

(declare-fun b!1302500 () Bool)

(declare-fun e!742920 () Unit!43111)

(declare-fun Unit!43118 () Unit!43111)

(assert (=> b!1302500 (= e!742920 Unit!43118)))

(declare-fun b!1302501 () Bool)

(declare-fun e!742925 () Bool)

(declare-fun lt!582693 () ListLongMap!20249)

(assert (=> b!1302501 (= e!742925 (= (apply!1019 lt!582693 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun bm!64134 () Bool)

(declare-fun call!64138 () Bool)

(assert (=> bm!64134 (= call!64138 (contains!8270 lt!582693 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1302502 () Bool)

(declare-fun res!865173 () Bool)

(declare-fun e!742928 () Bool)

(assert (=> b!1302502 (=> (not res!865173) (not e!742928))))

(declare-fun e!742929 () Bool)

(assert (=> b!1302502 (= res!865173 e!742929)))

(declare-fun c!124978 () Bool)

(assert (=> b!1302502 (= c!124978 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1302503 () Bool)

(declare-fun e!742930 () Bool)

(assert (=> b!1302503 (= e!742928 e!742930)))

(declare-fun c!124980 () Bool)

(assert (=> b!1302503 (= c!124980 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1302504 () Bool)

(declare-fun e!742923 () Bool)

(assert (=> b!1302504 (= e!742923 (= (apply!1019 lt!582693 (select (arr!41875 _keys!1741) from!2144)) (get!21148 (select (arr!41874 _values!1445) from!2144) (dynLambda!3426 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1302504 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42424 _values!1445)))))

(assert (=> b!1302504 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42425 _keys!1741)))))

(declare-fun b!1302505 () Bool)

(assert (=> b!1302505 (= e!742930 e!742925)))

(declare-fun res!865172 () Bool)

(declare-fun call!64142 () Bool)

(assert (=> b!1302505 (= res!865172 call!64142)))

(assert (=> b!1302505 (=> (not res!865172) (not e!742925))))

(declare-fun b!1302506 () Bool)

(assert (=> b!1302506 (= e!742929 (not call!64138))))

(declare-fun b!1302507 () Bool)

(assert (=> b!1302507 (= e!742930 (not call!64142))))

(declare-fun b!1302508 () Bool)

(declare-fun e!742919 () ListLongMap!20249)

(assert (=> b!1302508 (= e!742919 call!64143)))

(declare-fun b!1302509 () Bool)

(declare-fun e!742931 () ListLongMap!20249)

(declare-fun call!64141 () ListLongMap!20249)

(assert (=> b!1302509 (= e!742931 (+!4467 call!64141 (tuple2!22593 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun bm!64135 () Bool)

(assert (=> bm!64135 (= call!64142 (contains!8270 lt!582693 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1302510 () Bool)

(declare-fun c!124979 () Bool)

(assert (=> b!1302510 (= c!124979 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1302510 (= e!742922 e!742919)))

(declare-fun bm!64136 () Bool)

(declare-fun call!64140 () ListLongMap!20249)

(declare-fun call!64139 () ListLongMap!20249)

(assert (=> bm!64136 (= call!64140 call!64139)))

(declare-fun bm!64137 () Bool)

(declare-fun call!64137 () ListLongMap!20249)

(assert (=> bm!64137 (= call!64137 call!64140)))

(declare-fun b!1302511 () Bool)

(declare-fun e!742924 () Bool)

(assert (=> b!1302511 (= e!742924 (validKeyInArray!0 (select (arr!41875 _keys!1741) from!2144)))))

(declare-fun bm!64138 () Bool)

(assert (=> bm!64138 (= call!64139 (getCurrentListMapNoExtraKeys!6099 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1302512 () Bool)

(declare-fun e!742926 () Bool)

(assert (=> b!1302512 (= e!742926 e!742923)))

(declare-fun res!865171 () Bool)

(assert (=> b!1302512 (=> (not res!865171) (not e!742923))))

(assert (=> b!1302512 (= res!865171 (contains!8270 lt!582693 (select (arr!41875 _keys!1741) from!2144)))))

(assert (=> b!1302512 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42425 _keys!1741)))))

(declare-fun d!141459 () Bool)

(assert (=> d!141459 e!742928))

(declare-fun res!865174 () Bool)

(assert (=> d!141459 (=> (not res!865174) (not e!742928))))

(assert (=> d!141459 (= res!865174 (or (bvsge from!2144 (size!42425 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42425 _keys!1741)))))))

(declare-fun lt!582682 () ListLongMap!20249)

(assert (=> d!141459 (= lt!582693 lt!582682)))

(declare-fun lt!582687 () Unit!43111)

(assert (=> d!141459 (= lt!582687 e!742920)))

(declare-fun c!124981 () Bool)

(declare-fun e!742927 () Bool)

(assert (=> d!141459 (= c!124981 e!742927)))

(declare-fun res!865175 () Bool)

(assert (=> d!141459 (=> (not res!865175) (not e!742927))))

(assert (=> d!141459 (= res!865175 (bvslt from!2144 (size!42425 _keys!1741)))))

(assert (=> d!141459 (= lt!582682 e!742931)))

(declare-fun c!124982 () Bool)

(assert (=> d!141459 (= c!124982 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!141459 (validMask!0 mask!2175)))

(assert (=> d!141459 (= (getCurrentListMap!5165 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!582693)))

(declare-fun c!124983 () Bool)

(declare-fun bm!64139 () Bool)

(assert (=> bm!64139 (= call!64141 (+!4467 (ite c!124982 call!64139 (ite c!124983 call!64140 call!64137)) (ite (or c!124982 c!124983) (tuple2!22593 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22593 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1302513 () Bool)

(assert (=> b!1302513 (= e!742927 (validKeyInArray!0 (select (arr!41875 _keys!1741) from!2144)))))

(declare-fun b!1302514 () Bool)

(declare-fun e!742921 () Bool)

(assert (=> b!1302514 (= e!742929 e!742921)))

(declare-fun res!865179 () Bool)

(assert (=> b!1302514 (= res!865179 call!64138)))

(assert (=> b!1302514 (=> (not res!865179) (not e!742921))))

(declare-fun bm!64140 () Bool)

(assert (=> bm!64140 (= call!64143 call!64141)))

(declare-fun b!1302515 () Bool)

(declare-fun lt!582684 () Unit!43111)

(assert (=> b!1302515 (= e!742920 lt!582684)))

(declare-fun lt!582677 () ListLongMap!20249)

(assert (=> b!1302515 (= lt!582677 (getCurrentListMapNoExtraKeys!6099 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!582680 () (_ BitVec 64))

(assert (=> b!1302515 (= lt!582680 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!582673 () (_ BitVec 64))

(assert (=> b!1302515 (= lt!582673 (select (arr!41875 _keys!1741) from!2144))))

(declare-fun lt!582685 () Unit!43111)

(declare-fun addStillContains!1107 (ListLongMap!20249 (_ BitVec 64) V!51603 (_ BitVec 64)) Unit!43111)

(assert (=> b!1302515 (= lt!582685 (addStillContains!1107 lt!582677 lt!582680 zeroValue!1387 lt!582673))))

(assert (=> b!1302515 (contains!8270 (+!4467 lt!582677 (tuple2!22593 lt!582680 zeroValue!1387)) lt!582673)))

(declare-fun lt!582683 () Unit!43111)

(assert (=> b!1302515 (= lt!582683 lt!582685)))

(declare-fun lt!582672 () ListLongMap!20249)

(assert (=> b!1302515 (= lt!582672 (getCurrentListMapNoExtraKeys!6099 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!582681 () (_ BitVec 64))

(assert (=> b!1302515 (= lt!582681 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!582676 () (_ BitVec 64))

(assert (=> b!1302515 (= lt!582676 (select (arr!41875 _keys!1741) from!2144))))

(declare-fun lt!582678 () Unit!43111)

(declare-fun addApplyDifferent!561 (ListLongMap!20249 (_ BitVec 64) V!51603 (_ BitVec 64)) Unit!43111)

(assert (=> b!1302515 (= lt!582678 (addApplyDifferent!561 lt!582672 lt!582681 minValue!1387 lt!582676))))

(assert (=> b!1302515 (= (apply!1019 (+!4467 lt!582672 (tuple2!22593 lt!582681 minValue!1387)) lt!582676) (apply!1019 lt!582672 lt!582676))))

(declare-fun lt!582691 () Unit!43111)

(assert (=> b!1302515 (= lt!582691 lt!582678)))

(declare-fun lt!582688 () ListLongMap!20249)

(assert (=> b!1302515 (= lt!582688 (getCurrentListMapNoExtraKeys!6099 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!582674 () (_ BitVec 64))

(assert (=> b!1302515 (= lt!582674 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!582686 () (_ BitVec 64))

(assert (=> b!1302515 (= lt!582686 (select (arr!41875 _keys!1741) from!2144))))

(declare-fun lt!582689 () Unit!43111)

(assert (=> b!1302515 (= lt!582689 (addApplyDifferent!561 lt!582688 lt!582674 zeroValue!1387 lt!582686))))

(assert (=> b!1302515 (= (apply!1019 (+!4467 lt!582688 (tuple2!22593 lt!582674 zeroValue!1387)) lt!582686) (apply!1019 lt!582688 lt!582686))))

(declare-fun lt!582675 () Unit!43111)

(assert (=> b!1302515 (= lt!582675 lt!582689)))

(declare-fun lt!582690 () ListLongMap!20249)

(assert (=> b!1302515 (= lt!582690 (getCurrentListMapNoExtraKeys!6099 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!582692 () (_ BitVec 64))

(assert (=> b!1302515 (= lt!582692 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!582679 () (_ BitVec 64))

(assert (=> b!1302515 (= lt!582679 (select (arr!41875 _keys!1741) from!2144))))

(assert (=> b!1302515 (= lt!582684 (addApplyDifferent!561 lt!582690 lt!582692 minValue!1387 lt!582679))))

(assert (=> b!1302515 (= (apply!1019 (+!4467 lt!582690 (tuple2!22593 lt!582692 minValue!1387)) lt!582679) (apply!1019 lt!582690 lt!582679))))

(declare-fun b!1302516 () Bool)

(assert (=> b!1302516 (= e!742921 (= (apply!1019 lt!582693 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun b!1302517 () Bool)

(declare-fun res!865178 () Bool)

(assert (=> b!1302517 (=> (not res!865178) (not e!742928))))

(assert (=> b!1302517 (= res!865178 e!742926)))

(declare-fun res!865177 () Bool)

(assert (=> b!1302517 (=> res!865177 e!742926)))

(assert (=> b!1302517 (= res!865177 (not e!742924))))

(declare-fun res!865176 () Bool)

(assert (=> b!1302517 (=> (not res!865176) (not e!742924))))

(assert (=> b!1302517 (= res!865176 (bvslt from!2144 (size!42425 _keys!1741)))))

(declare-fun b!1302518 () Bool)

(assert (=> b!1302518 (= e!742919 call!64137)))

(declare-fun b!1302519 () Bool)

(assert (=> b!1302519 (= e!742931 e!742922)))

(assert (=> b!1302519 (= c!124983 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!141459 c!124982) b!1302509))

(assert (= (and d!141459 (not c!124982)) b!1302519))

(assert (= (and b!1302519 c!124983) b!1302499))

(assert (= (and b!1302519 (not c!124983)) b!1302510))

(assert (= (and b!1302510 c!124979) b!1302508))

(assert (= (and b!1302510 (not c!124979)) b!1302518))

(assert (= (or b!1302508 b!1302518) bm!64137))

(assert (= (or b!1302499 bm!64137) bm!64136))

(assert (= (or b!1302499 b!1302508) bm!64140))

(assert (= (or b!1302509 bm!64136) bm!64138))

(assert (= (or b!1302509 bm!64140) bm!64139))

(assert (= (and d!141459 res!865175) b!1302513))

(assert (= (and d!141459 c!124981) b!1302515))

(assert (= (and d!141459 (not c!124981)) b!1302500))

(assert (= (and d!141459 res!865174) b!1302517))

(assert (= (and b!1302517 res!865176) b!1302511))

(assert (= (and b!1302517 (not res!865177)) b!1302512))

(assert (= (and b!1302512 res!865171) b!1302504))

(assert (= (and b!1302517 res!865178) b!1302502))

(assert (= (and b!1302502 c!124978) b!1302514))

(assert (= (and b!1302502 (not c!124978)) b!1302506))

(assert (= (and b!1302514 res!865179) b!1302516))

(assert (= (or b!1302514 b!1302506) bm!64134))

(assert (= (and b!1302502 res!865173) b!1302503))

(assert (= (and b!1302503 c!124980) b!1302505))

(assert (= (and b!1302503 (not c!124980)) b!1302507))

(assert (= (and b!1302505 res!865172) b!1302501))

(assert (= (or b!1302505 b!1302507) bm!64135))

(declare-fun b_lambda!23235 () Bool)

(assert (=> (not b_lambda!23235) (not b!1302504)))

(assert (=> b!1302504 t!43312))

(declare-fun b_and!47385 () Bool)

(assert (= b_and!47383 (and (=> t!43312 result!23801) b_and!47385)))

(declare-fun m!1193233 () Bool)

(assert (=> b!1302515 m!1193233))

(declare-fun m!1193235 () Bool)

(assert (=> b!1302515 m!1193235))

(declare-fun m!1193237 () Bool)

(assert (=> b!1302515 m!1193237))

(declare-fun m!1193239 () Bool)

(assert (=> b!1302515 m!1193239))

(declare-fun m!1193241 () Bool)

(assert (=> b!1302515 m!1193241))

(declare-fun m!1193243 () Bool)

(assert (=> b!1302515 m!1193243))

(declare-fun m!1193245 () Bool)

(assert (=> b!1302515 m!1193245))

(assert (=> b!1302515 m!1193109))

(declare-fun m!1193247 () Bool)

(assert (=> b!1302515 m!1193247))

(assert (=> b!1302515 m!1193239))

(assert (=> b!1302515 m!1193233))

(declare-fun m!1193249 () Bool)

(assert (=> b!1302515 m!1193249))

(assert (=> b!1302515 m!1193243))

(declare-fun m!1193251 () Bool)

(assert (=> b!1302515 m!1193251))

(declare-fun m!1193253 () Bool)

(assert (=> b!1302515 m!1193253))

(declare-fun m!1193255 () Bool)

(assert (=> b!1302515 m!1193255))

(declare-fun m!1193257 () Bool)

(assert (=> b!1302515 m!1193257))

(declare-fun m!1193259 () Bool)

(assert (=> b!1302515 m!1193259))

(assert (=> b!1302515 m!1193257))

(declare-fun m!1193261 () Bool)

(assert (=> b!1302515 m!1193261))

(assert (=> b!1302515 m!1193129))

(declare-fun m!1193263 () Bool)

(assert (=> b!1302509 m!1193263))

(declare-fun m!1193265 () Bool)

(assert (=> bm!64134 m!1193265))

(assert (=> b!1302511 m!1193129))

(assert (=> b!1302511 m!1193129))

(assert (=> b!1302511 m!1193131))

(assert (=> bm!64138 m!1193109))

(declare-fun m!1193267 () Bool)

(assert (=> b!1302516 m!1193267))

(assert (=> d!141459 m!1193115))

(assert (=> b!1302504 m!1193201))

(assert (=> b!1302504 m!1193207))

(assert (=> b!1302504 m!1193209))

(assert (=> b!1302504 m!1193129))

(assert (=> b!1302504 m!1193129))

(declare-fun m!1193269 () Bool)

(assert (=> b!1302504 m!1193269))

(assert (=> b!1302504 m!1193201))

(assert (=> b!1302504 m!1193207))

(assert (=> b!1302512 m!1193129))

(assert (=> b!1302512 m!1193129))

(declare-fun m!1193271 () Bool)

(assert (=> b!1302512 m!1193271))

(declare-fun m!1193273 () Bool)

(assert (=> b!1302501 m!1193273))

(declare-fun m!1193275 () Bool)

(assert (=> bm!64135 m!1193275))

(assert (=> b!1302513 m!1193129))

(assert (=> b!1302513 m!1193129))

(assert (=> b!1302513 m!1193131))

(declare-fun m!1193277 () Bool)

(assert (=> bm!64139 m!1193277))

(assert (=> b!1302332 d!141459))

(declare-fun mapIsEmpty!53901 () Bool)

(declare-fun mapRes!53901 () Bool)

(assert (=> mapIsEmpty!53901 mapRes!53901))

(declare-fun b!1302526 () Bool)

(declare-fun e!742936 () Bool)

(assert (=> b!1302526 (= e!742936 tp_is_empty!34875)))

(declare-fun b!1302527 () Bool)

(declare-fun e!742937 () Bool)

(assert (=> b!1302527 (= e!742937 tp_is_empty!34875)))

(declare-fun mapNonEmpty!53901 () Bool)

(declare-fun tp!102855 () Bool)

(assert (=> mapNonEmpty!53901 (= mapRes!53901 (and tp!102855 e!742936))))

(declare-fun mapRest!53901 () (Array (_ BitVec 32) ValueCell!16539))

(declare-fun mapValue!53901 () ValueCell!16539)

(declare-fun mapKey!53901 () (_ BitVec 32))

(assert (=> mapNonEmpty!53901 (= mapRest!53895 (store mapRest!53901 mapKey!53901 mapValue!53901))))

(declare-fun condMapEmpty!53901 () Bool)

(declare-fun mapDefault!53901 () ValueCell!16539)

(assert (=> mapNonEmpty!53895 (= condMapEmpty!53901 (= mapRest!53895 ((as const (Array (_ BitVec 32) ValueCell!16539)) mapDefault!53901)))))

(assert (=> mapNonEmpty!53895 (= tp!102845 (and e!742937 mapRes!53901))))

(assert (= (and mapNonEmpty!53895 condMapEmpty!53901) mapIsEmpty!53901))

(assert (= (and mapNonEmpty!53895 (not condMapEmpty!53901)) mapNonEmpty!53901))

(assert (= (and mapNonEmpty!53901 ((_ is ValueCellFull!16539) mapValue!53901)) b!1302526))

(assert (= (and mapNonEmpty!53895 ((_ is ValueCellFull!16539) mapDefault!53901)) b!1302527))

(declare-fun m!1193279 () Bool)

(assert (=> mapNonEmpty!53901 m!1193279))

(declare-fun b_lambda!23237 () Bool)

(assert (= b_lambda!23233 (or (and start!109936 b_free!29235) b_lambda!23237)))

(declare-fun b_lambda!23239 () Bool)

(assert (= b_lambda!23235 (or (and start!109936 b_free!29235) b_lambda!23239)))

(declare-fun b_lambda!23241 () Bool)

(assert (= b_lambda!23231 (or (and start!109936 b_free!29235) b_lambda!23241)))

(check-sat (not b!1302450) (not b!1302501) (not b!1302511) (not d!141439) (not b!1302449) (not b!1302515) (not b!1302443) (not b_lambda!23241) (not b!1302456) tp_is_empty!34875 (not b!1302444) (not b!1302509) (not bm!64134) b_and!47385 (not d!141437) (not bm!64139) (not d!141453) (not b!1302413) (not b_lambda!23237) (not b!1302454) (not b_lambda!23239) (not d!141459) (not b!1302516) (not b!1302451) (not b!1302446) (not bm!64116) (not b!1302448) (not b!1302409) (not bm!64119) (not b_next!29235) (not b!1302513) (not b!1302512) (not b!1302441) (not bm!64138) (not d!141455) (not b!1302385) (not b!1302397) (not mapNonEmpty!53901) (not b!1302400) (not b!1302399) (not b!1302504) (not b!1302411) (not b!1302383) (not d!141457) (not bm!64135) (not bm!64113) (not b!1302415))
(check-sat b_and!47385 (not b_next!29235))
(get-model)

(declare-fun d!141461 () Bool)

(declare-fun e!742940 () Bool)

(assert (=> d!141461 e!742940))

(declare-fun res!865184 () Bool)

(assert (=> d!141461 (=> (not res!865184) (not e!742940))))

(declare-fun lt!582704 () ListLongMap!20249)

(assert (=> d!141461 (= res!865184 (contains!8270 lt!582704 (_1!11307 (tuple2!22593 lt!582623 lt!582619))))))

(declare-fun lt!582705 () List!29720)

(assert (=> d!141461 (= lt!582704 (ListLongMap!20250 lt!582705))))

(declare-fun lt!582702 () Unit!43111)

(declare-fun lt!582703 () Unit!43111)

(assert (=> d!141461 (= lt!582702 lt!582703)))

(assert (=> d!141461 (= (getValueByKey!702 lt!582705 (_1!11307 (tuple2!22593 lt!582623 lt!582619))) (Some!753 (_2!11307 (tuple2!22593 lt!582623 lt!582619))))))

(declare-fun lemmaContainsTupThenGetReturnValue!348 (List!29720 (_ BitVec 64) V!51603) Unit!43111)

(assert (=> d!141461 (= lt!582703 (lemmaContainsTupThenGetReturnValue!348 lt!582705 (_1!11307 (tuple2!22593 lt!582623 lt!582619)) (_2!11307 (tuple2!22593 lt!582623 lt!582619))))))

(declare-fun insertStrictlySorted!477 (List!29720 (_ BitVec 64) V!51603) List!29720)

(assert (=> d!141461 (= lt!582705 (insertStrictlySorted!477 (toList!10140 lt!582618) (_1!11307 (tuple2!22593 lt!582623 lt!582619)) (_2!11307 (tuple2!22593 lt!582623 lt!582619))))))

(assert (=> d!141461 (= (+!4467 lt!582618 (tuple2!22593 lt!582623 lt!582619)) lt!582704)))

(declare-fun b!1302532 () Bool)

(declare-fun res!865185 () Bool)

(assert (=> b!1302532 (=> (not res!865185) (not e!742940))))

(assert (=> b!1302532 (= res!865185 (= (getValueByKey!702 (toList!10140 lt!582704) (_1!11307 (tuple2!22593 lt!582623 lt!582619))) (Some!753 (_2!11307 (tuple2!22593 lt!582623 lt!582619)))))))

(declare-fun b!1302533 () Bool)

(declare-fun contains!8273 (List!29720 tuple2!22592) Bool)

(assert (=> b!1302533 (= e!742940 (contains!8273 (toList!10140 lt!582704) (tuple2!22593 lt!582623 lt!582619)))))

(assert (= (and d!141461 res!865184) b!1302532))

(assert (= (and b!1302532 res!865185) b!1302533))

(declare-fun m!1193281 () Bool)

(assert (=> d!141461 m!1193281))

(declare-fun m!1193283 () Bool)

(assert (=> d!141461 m!1193283))

(declare-fun m!1193285 () Bool)

(assert (=> d!141461 m!1193285))

(declare-fun m!1193287 () Bool)

(assert (=> d!141461 m!1193287))

(declare-fun m!1193289 () Bool)

(assert (=> b!1302532 m!1193289))

(declare-fun m!1193291 () Bool)

(assert (=> b!1302533 m!1193291))

(assert (=> b!1302449 d!141461))

(declare-fun d!141463 () Bool)

(declare-fun e!742942 () Bool)

(assert (=> d!141463 e!742942))

(declare-fun res!865186 () Bool)

(assert (=> d!141463 (=> res!865186 e!742942)))

(declare-fun lt!582707 () Bool)

(assert (=> d!141463 (= res!865186 (not lt!582707))))

(declare-fun lt!582706 () Bool)

(assert (=> d!141463 (= lt!582707 lt!582706)))

(declare-fun lt!582709 () Unit!43111)

(declare-fun e!742941 () Unit!43111)

(assert (=> d!141463 (= lt!582709 e!742941)))

(declare-fun c!124984 () Bool)

(assert (=> d!141463 (= c!124984 lt!582706)))

(assert (=> d!141463 (= lt!582706 (containsKey!724 (toList!10140 (+!4467 lt!582618 (tuple2!22593 lt!582623 lt!582619))) lt!582617))))

(assert (=> d!141463 (= (contains!8270 (+!4467 lt!582618 (tuple2!22593 lt!582623 lt!582619)) lt!582617) lt!582707)))

(declare-fun b!1302534 () Bool)

(declare-fun lt!582708 () Unit!43111)

(assert (=> b!1302534 (= e!742941 lt!582708)))

(assert (=> b!1302534 (= lt!582708 (lemmaContainsKeyImpliesGetValueByKeyDefined!470 (toList!10140 (+!4467 lt!582618 (tuple2!22593 lt!582623 lt!582619))) lt!582617))))

(assert (=> b!1302534 (isDefined!509 (getValueByKey!702 (toList!10140 (+!4467 lt!582618 (tuple2!22593 lt!582623 lt!582619))) lt!582617))))

(declare-fun b!1302535 () Bool)

(declare-fun Unit!43119 () Unit!43111)

(assert (=> b!1302535 (= e!742941 Unit!43119)))

(declare-fun b!1302536 () Bool)

(assert (=> b!1302536 (= e!742942 (isDefined!509 (getValueByKey!702 (toList!10140 (+!4467 lt!582618 (tuple2!22593 lt!582623 lt!582619))) lt!582617)))))

(assert (= (and d!141463 c!124984) b!1302534))

(assert (= (and d!141463 (not c!124984)) b!1302535))

(assert (= (and d!141463 (not res!865186)) b!1302536))

(declare-fun m!1193293 () Bool)

(assert (=> d!141463 m!1193293))

(declare-fun m!1193295 () Bool)

(assert (=> b!1302534 m!1193295))

(declare-fun m!1193297 () Bool)

(assert (=> b!1302534 m!1193297))

(assert (=> b!1302534 m!1193297))

(declare-fun m!1193299 () Bool)

(assert (=> b!1302534 m!1193299))

(assert (=> b!1302536 m!1193297))

(assert (=> b!1302536 m!1193297))

(assert (=> b!1302536 m!1193299))

(assert (=> b!1302449 d!141463))

(declare-fun d!141465 () Bool)

(assert (=> d!141465 (not (contains!8270 (+!4467 lt!582618 (tuple2!22593 lt!582623 lt!582619)) lt!582617))))

(declare-fun lt!582712 () Unit!43111)

(declare-fun choose!1913 (ListLongMap!20249 (_ BitVec 64) V!51603 (_ BitVec 64)) Unit!43111)

(assert (=> d!141465 (= lt!582712 (choose!1913 lt!582618 lt!582623 lt!582619 lt!582617))))

(declare-fun e!742945 () Bool)

(assert (=> d!141465 e!742945))

(declare-fun res!865189 () Bool)

(assert (=> d!141465 (=> (not res!865189) (not e!742945))))

(assert (=> d!141465 (= res!865189 (not (contains!8270 lt!582618 lt!582617)))))

(assert (=> d!141465 (= (addStillNotContains!464 lt!582618 lt!582623 lt!582619 lt!582617) lt!582712)))

(declare-fun b!1302540 () Bool)

(assert (=> b!1302540 (= e!742945 (not (= lt!582623 lt!582617)))))

(assert (= (and d!141465 res!865189) b!1302540))

(assert (=> d!141465 m!1193203))

(assert (=> d!141465 m!1193203))

(assert (=> d!141465 m!1193205))

(declare-fun m!1193301 () Bool)

(assert (=> d!141465 m!1193301))

(declare-fun m!1193303 () Bool)

(assert (=> d!141465 m!1193303))

(assert (=> b!1302449 d!141465))

(declare-fun d!141467 () Bool)

(declare-fun e!742946 () Bool)

(assert (=> d!141467 e!742946))

(declare-fun res!865190 () Bool)

(assert (=> d!141467 (=> (not res!865190) (not e!742946))))

(declare-fun lt!582715 () ListLongMap!20249)

(assert (=> d!141467 (= res!865190 (contains!8270 lt!582715 (_1!11307 (tuple2!22593 (select (arr!41875 _keys!1741) from!2144) (get!21148 (select (arr!41874 _values!1445) from!2144) (dynLambda!3426 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!582716 () List!29720)

(assert (=> d!141467 (= lt!582715 (ListLongMap!20250 lt!582716))))

(declare-fun lt!582713 () Unit!43111)

(declare-fun lt!582714 () Unit!43111)

(assert (=> d!141467 (= lt!582713 lt!582714)))

(assert (=> d!141467 (= (getValueByKey!702 lt!582716 (_1!11307 (tuple2!22593 (select (arr!41875 _keys!1741) from!2144) (get!21148 (select (arr!41874 _values!1445) from!2144) (dynLambda!3426 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!753 (_2!11307 (tuple2!22593 (select (arr!41875 _keys!1741) from!2144) (get!21148 (select (arr!41874 _values!1445) from!2144) (dynLambda!3426 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!141467 (= lt!582714 (lemmaContainsTupThenGetReturnValue!348 lt!582716 (_1!11307 (tuple2!22593 (select (arr!41875 _keys!1741) from!2144) (get!21148 (select (arr!41874 _values!1445) from!2144) (dynLambda!3426 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11307 (tuple2!22593 (select (arr!41875 _keys!1741) from!2144) (get!21148 (select (arr!41874 _values!1445) from!2144) (dynLambda!3426 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!141467 (= lt!582716 (insertStrictlySorted!477 (toList!10140 call!64122) (_1!11307 (tuple2!22593 (select (arr!41875 _keys!1741) from!2144) (get!21148 (select (arr!41874 _values!1445) from!2144) (dynLambda!3426 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11307 (tuple2!22593 (select (arr!41875 _keys!1741) from!2144) (get!21148 (select (arr!41874 _values!1445) from!2144) (dynLambda!3426 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!141467 (= (+!4467 call!64122 (tuple2!22593 (select (arr!41875 _keys!1741) from!2144) (get!21148 (select (arr!41874 _values!1445) from!2144) (dynLambda!3426 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!582715)))

(declare-fun b!1302541 () Bool)

(declare-fun res!865191 () Bool)

(assert (=> b!1302541 (=> (not res!865191) (not e!742946))))

(assert (=> b!1302541 (= res!865191 (= (getValueByKey!702 (toList!10140 lt!582715) (_1!11307 (tuple2!22593 (select (arr!41875 _keys!1741) from!2144) (get!21148 (select (arr!41874 _values!1445) from!2144) (dynLambda!3426 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!753 (_2!11307 (tuple2!22593 (select (arr!41875 _keys!1741) from!2144) (get!21148 (select (arr!41874 _values!1445) from!2144) (dynLambda!3426 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1302542 () Bool)

(assert (=> b!1302542 (= e!742946 (contains!8273 (toList!10140 lt!582715) (tuple2!22593 (select (arr!41875 _keys!1741) from!2144) (get!21148 (select (arr!41874 _values!1445) from!2144) (dynLambda!3426 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!141467 res!865190) b!1302541))

(assert (= (and b!1302541 res!865191) b!1302542))

(declare-fun m!1193305 () Bool)

(assert (=> d!141467 m!1193305))

(declare-fun m!1193307 () Bool)

(assert (=> d!141467 m!1193307))

(declare-fun m!1193309 () Bool)

(assert (=> d!141467 m!1193309))

(declare-fun m!1193311 () Bool)

(assert (=> d!141467 m!1193311))

(declare-fun m!1193313 () Bool)

(assert (=> b!1302541 m!1193313))

(declare-fun m!1193315 () Bool)

(assert (=> b!1302542 m!1193315))

(assert (=> b!1302449 d!141467))

(declare-fun d!141469 () Bool)

(declare-fun c!124987 () Bool)

(assert (=> d!141469 (= c!124987 ((_ is ValueCellFull!16539) (select (arr!41874 _values!1445) from!2144)))))

(declare-fun e!742949 () V!51603)

(assert (=> d!141469 (= (get!21148 (select (arr!41874 _values!1445) from!2144) (dynLambda!3426 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)) e!742949)))

(declare-fun b!1302547 () Bool)

(declare-fun get!21149 (ValueCell!16539 V!51603) V!51603)

(assert (=> b!1302547 (= e!742949 (get!21149 (select (arr!41874 _values!1445) from!2144) (dynLambda!3426 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1302548 () Bool)

(declare-fun get!21150 (ValueCell!16539 V!51603) V!51603)

(assert (=> b!1302548 (= e!742949 (get!21150 (select (arr!41874 _values!1445) from!2144) (dynLambda!3426 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141469 c!124987) b!1302547))

(assert (= (and d!141469 (not c!124987)) b!1302548))

(assert (=> b!1302547 m!1193201))

(assert (=> b!1302547 m!1193207))

(declare-fun m!1193317 () Bool)

(assert (=> b!1302547 m!1193317))

(assert (=> b!1302548 m!1193201))

(assert (=> b!1302548 m!1193207))

(declare-fun m!1193319 () Bool)

(assert (=> b!1302548 m!1193319))

(assert (=> b!1302449 d!141469))

(declare-fun d!141471 () Bool)

(declare-fun e!742950 () Bool)

(assert (=> d!141471 e!742950))

(declare-fun res!865192 () Bool)

(assert (=> d!141471 (=> (not res!865192) (not e!742950))))

(declare-fun lt!582719 () ListLongMap!20249)

(assert (=> d!141471 (= res!865192 (contains!8270 lt!582719 (_1!11307 (tuple2!22593 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun lt!582720 () List!29720)

(assert (=> d!141471 (= lt!582719 (ListLongMap!20250 lt!582720))))

(declare-fun lt!582717 () Unit!43111)

(declare-fun lt!582718 () Unit!43111)

(assert (=> d!141471 (= lt!582717 lt!582718)))

(assert (=> d!141471 (= (getValueByKey!702 lt!582720 (_1!11307 (tuple2!22593 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!753 (_2!11307 (tuple2!22593 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!141471 (= lt!582718 (lemmaContainsTupThenGetReturnValue!348 lt!582720 (_1!11307 (tuple2!22593 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11307 (tuple2!22593 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!141471 (= lt!582720 (insertStrictlySorted!477 (toList!10140 call!64141) (_1!11307 (tuple2!22593 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11307 (tuple2!22593 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!141471 (= (+!4467 call!64141 (tuple2!22593 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) lt!582719)))

(declare-fun b!1302549 () Bool)

(declare-fun res!865193 () Bool)

(assert (=> b!1302549 (=> (not res!865193) (not e!742950))))

(assert (=> b!1302549 (= res!865193 (= (getValueByKey!702 (toList!10140 lt!582719) (_1!11307 (tuple2!22593 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!753 (_2!11307 (tuple2!22593 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1302550 () Bool)

(assert (=> b!1302550 (= e!742950 (contains!8273 (toList!10140 lt!582719) (tuple2!22593 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(assert (= (and d!141471 res!865192) b!1302549))

(assert (= (and b!1302549 res!865193) b!1302550))

(declare-fun m!1193321 () Bool)

(assert (=> d!141471 m!1193321))

(declare-fun m!1193323 () Bool)

(assert (=> d!141471 m!1193323))

(declare-fun m!1193325 () Bool)

(assert (=> d!141471 m!1193325))

(declare-fun m!1193327 () Bool)

(assert (=> d!141471 m!1193327))

(declare-fun m!1193329 () Bool)

(assert (=> b!1302549 m!1193329))

(declare-fun m!1193331 () Bool)

(assert (=> b!1302550 m!1193331))

(assert (=> b!1302509 d!141471))

(declare-fun d!141473 () Bool)

(assert (=> d!141473 (= (validKeyInArray!0 (select (arr!41875 _keys!1741) #b00000000000000000000000000000000)) (and (not (= (select (arr!41875 _keys!1741) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41875 _keys!1741) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1302399 d!141473))

(declare-fun d!141475 () Bool)

(assert (=> d!141475 (isDefined!509 (getValueByKey!702 (toList!10140 (getCurrentListMapNoExtraKeys!6099 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun lt!582723 () Unit!43111)

(declare-fun choose!1914 (List!29720 (_ BitVec 64)) Unit!43111)

(assert (=> d!141475 (= lt!582723 (choose!1914 (toList!10140 (getCurrentListMapNoExtraKeys!6099 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun e!742953 () Bool)

(assert (=> d!141475 e!742953))

(declare-fun res!865196 () Bool)

(assert (=> d!141475 (=> (not res!865196) (not e!742953))))

(declare-fun isStrictlySorted!871 (List!29720) Bool)

(assert (=> d!141475 (= res!865196 (isStrictlySorted!871 (toList!10140 (getCurrentListMapNoExtraKeys!6099 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))

(assert (=> d!141475 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!470 (toList!10140 (getCurrentListMapNoExtraKeys!6099 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) lt!582723)))

(declare-fun b!1302553 () Bool)

(assert (=> b!1302553 (= e!742953 (containsKey!724 (toList!10140 (getCurrentListMapNoExtraKeys!6099 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (= (and d!141475 res!865196) b!1302553))

(assert (=> d!141475 m!1193195))

(assert (=> d!141475 m!1193195))

(assert (=> d!141475 m!1193197))

(declare-fun m!1193333 () Bool)

(assert (=> d!141475 m!1193333))

(declare-fun m!1193335 () Bool)

(assert (=> d!141475 m!1193335))

(assert (=> b!1302553 m!1193191))

(assert (=> b!1302413 d!141475))

(declare-fun d!141477 () Bool)

(declare-fun isEmpty!1058 (Option!754) Bool)

(assert (=> d!141477 (= (isDefined!509 (getValueByKey!702 (toList!10140 (getCurrentListMapNoExtraKeys!6099 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)) (not (isEmpty!1058 (getValueByKey!702 (toList!10140 (getCurrentListMapNoExtraKeys!6099 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))))

(declare-fun bs!37087 () Bool)

(assert (= bs!37087 d!141477))

(assert (=> bs!37087 m!1193195))

(declare-fun m!1193337 () Bool)

(assert (=> bs!37087 m!1193337))

(assert (=> b!1302413 d!141477))

(declare-fun b!1302562 () Bool)

(declare-fun e!742958 () Option!754)

(assert (=> b!1302562 (= e!742958 (Some!753 (_2!11307 (h!30925 (toList!10140 (getCurrentListMapNoExtraKeys!6099 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))))

(declare-fun b!1302565 () Bool)

(declare-fun e!742959 () Option!754)

(assert (=> b!1302565 (= e!742959 None!752)))

(declare-fun b!1302564 () Bool)

(assert (=> b!1302564 (= e!742959 (getValueByKey!702 (t!43308 (toList!10140 (getCurrentListMapNoExtraKeys!6099 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(declare-fun d!141479 () Bool)

(declare-fun c!124992 () Bool)

(assert (=> d!141479 (= c!124992 (and ((_ is Cons!29716) (toList!10140 (getCurrentListMapNoExtraKeys!6099 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11307 (h!30925 (toList!10140 (getCurrentListMapNoExtraKeys!6099 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(assert (=> d!141479 (= (getValueByKey!702 (toList!10140 (getCurrentListMapNoExtraKeys!6099 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!742958)))

(declare-fun b!1302563 () Bool)

(assert (=> b!1302563 (= e!742958 e!742959)))

(declare-fun c!124993 () Bool)

(assert (=> b!1302563 (= c!124993 (and ((_ is Cons!29716) (toList!10140 (getCurrentListMapNoExtraKeys!6099 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (not (= (_1!11307 (h!30925 (toList!10140 (getCurrentListMapNoExtraKeys!6099 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205))))))

(assert (= (and d!141479 c!124992) b!1302562))

(assert (= (and d!141479 (not c!124992)) b!1302563))

(assert (= (and b!1302563 c!124993) b!1302564))

(assert (= (and b!1302563 (not c!124993)) b!1302565))

(declare-fun m!1193339 () Bool)

(assert (=> b!1302564 m!1193339))

(assert (=> b!1302413 d!141479))

(assert (=> b!1302448 d!141451))

(declare-fun d!141481 () Bool)

(assert (=> d!141481 (= (isDefined!509 (getValueByKey!702 (toList!10140 (ListLongMap!20250 Nil!29717)) k0!1205)) (not (isEmpty!1058 (getValueByKey!702 (toList!10140 (ListLongMap!20250 Nil!29717)) k0!1205))))))

(declare-fun bs!37088 () Bool)

(assert (= bs!37088 d!141481))

(assert (=> bs!37088 m!1193169))

(declare-fun m!1193341 () Bool)

(assert (=> bs!37088 m!1193341))

(assert (=> b!1302385 d!141481))

(declare-fun b!1302566 () Bool)

(declare-fun e!742960 () Option!754)

(assert (=> b!1302566 (= e!742960 (Some!753 (_2!11307 (h!30925 (toList!10140 (ListLongMap!20250 Nil!29717))))))))

(declare-fun b!1302569 () Bool)

(declare-fun e!742961 () Option!754)

(assert (=> b!1302569 (= e!742961 None!752)))

(declare-fun b!1302568 () Bool)

(assert (=> b!1302568 (= e!742961 (getValueByKey!702 (t!43308 (toList!10140 (ListLongMap!20250 Nil!29717))) k0!1205))))

(declare-fun d!141483 () Bool)

(declare-fun c!124994 () Bool)

(assert (=> d!141483 (= c!124994 (and ((_ is Cons!29716) (toList!10140 (ListLongMap!20250 Nil!29717))) (= (_1!11307 (h!30925 (toList!10140 (ListLongMap!20250 Nil!29717)))) k0!1205)))))

(assert (=> d!141483 (= (getValueByKey!702 (toList!10140 (ListLongMap!20250 Nil!29717)) k0!1205) e!742960)))

(declare-fun b!1302567 () Bool)

(assert (=> b!1302567 (= e!742960 e!742961)))

(declare-fun c!124995 () Bool)

(assert (=> b!1302567 (= c!124995 (and ((_ is Cons!29716) (toList!10140 (ListLongMap!20250 Nil!29717))) (not (= (_1!11307 (h!30925 (toList!10140 (ListLongMap!20250 Nil!29717)))) k0!1205))))))

(assert (= (and d!141483 c!124994) b!1302566))

(assert (= (and d!141483 (not c!124994)) b!1302567))

(assert (= (and b!1302567 c!124995) b!1302568))

(assert (= (and b!1302567 (not c!124995)) b!1302569))

(declare-fun m!1193343 () Bool)

(assert (=> b!1302568 m!1193343))

(assert (=> b!1302385 d!141483))

(declare-fun b!1302570 () Bool)

(declare-fun e!742968 () Bool)

(declare-fun e!742964 () Bool)

(assert (=> b!1302570 (= e!742968 e!742964)))

(declare-fun c!124997 () Bool)

(assert (=> b!1302570 (= c!124997 (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42425 _keys!1741)))))

(declare-fun b!1302571 () Bool)

(declare-fun lt!582729 () ListLongMap!20249)

(assert (=> b!1302571 (= e!742964 (isEmpty!1057 lt!582729))))

(declare-fun b!1302572 () Bool)

(declare-fun e!742963 () ListLongMap!20249)

(assert (=> b!1302572 (= e!742963 (ListLongMap!20250 Nil!29717))))

(declare-fun b!1302573 () Bool)

(assert (=> b!1302573 (and (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42425 _keys!1741)))))

(assert (=> b!1302573 (and (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42424 _values!1445)))))

(declare-fun e!742962 () Bool)

(assert (=> b!1302573 (= e!742962 (= (apply!1019 lt!582729 (select (arr!41875 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))) (get!21148 (select (arr!41874 _values!1445) (bvadd from!2144 #b00000000000000000000000000000001)) (dynLambda!3426 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!141485 () Bool)

(declare-fun e!742966 () Bool)

(assert (=> d!141485 e!742966))

(declare-fun res!865197 () Bool)

(assert (=> d!141485 (=> (not res!865197) (not e!742966))))

(assert (=> d!141485 (= res!865197 (not (contains!8270 lt!582729 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!141485 (= lt!582729 e!742963)))

(declare-fun c!124998 () Bool)

(assert (=> d!141485 (= c!124998 (bvsge (bvadd from!2144 #b00000000000000000000000000000001) (size!42425 _keys!1741)))))

(assert (=> d!141485 (validMask!0 mask!2175)))

(assert (=> d!141485 (= (getCurrentListMapNoExtraKeys!6099 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448) lt!582729)))

(declare-fun b!1302574 () Bool)

(declare-fun e!742967 () Bool)

(assert (=> b!1302574 (= e!742967 (validKeyInArray!0 (select (arr!41875 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))))))

(assert (=> b!1302574 (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1302575 () Bool)

(assert (=> b!1302575 (= e!742966 e!742968)))

(declare-fun c!124999 () Bool)

(assert (=> b!1302575 (= c!124999 e!742967)))

(declare-fun res!865199 () Bool)

(assert (=> b!1302575 (=> (not res!865199) (not e!742967))))

(assert (=> b!1302575 (= res!865199 (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42425 _keys!1741)))))

(declare-fun b!1302576 () Bool)

(assert (=> b!1302576 (= e!742968 e!742962)))

(assert (=> b!1302576 (and (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42425 _keys!1741)))))

(declare-fun res!865200 () Bool)

(assert (=> b!1302576 (= res!865200 (contains!8270 lt!582729 (select (arr!41875 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))))))

(assert (=> b!1302576 (=> (not res!865200) (not e!742962))))

(declare-fun call!64144 () ListLongMap!20249)

(declare-fun bm!64141 () Bool)

(assert (=> bm!64141 (= call!64144 (getCurrentListMapNoExtraKeys!6099 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1302577 () Bool)

(declare-fun e!742965 () ListLongMap!20249)

(assert (=> b!1302577 (= e!742965 call!64144)))

(declare-fun b!1302578 () Bool)

(assert (=> b!1302578 (= e!742963 e!742965)))

(declare-fun c!124996 () Bool)

(assert (=> b!1302578 (= c!124996 (validKeyInArray!0 (select (arr!41875 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))))))

(declare-fun b!1302579 () Bool)

(declare-fun lt!582728 () Unit!43111)

(declare-fun lt!582727 () Unit!43111)

(assert (=> b!1302579 (= lt!582728 lt!582727)))

(declare-fun lt!582726 () V!51603)

(declare-fun lt!582724 () (_ BitVec 64))

(declare-fun lt!582730 () (_ BitVec 64))

(declare-fun lt!582725 () ListLongMap!20249)

(assert (=> b!1302579 (not (contains!8270 (+!4467 lt!582725 (tuple2!22593 lt!582730 lt!582726)) lt!582724))))

(assert (=> b!1302579 (= lt!582727 (addStillNotContains!464 lt!582725 lt!582730 lt!582726 lt!582724))))

(assert (=> b!1302579 (= lt!582724 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1302579 (= lt!582726 (get!21148 (select (arr!41874 _values!1445) (bvadd from!2144 #b00000000000000000000000000000001)) (dynLambda!3426 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1302579 (= lt!582730 (select (arr!41875 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001)))))

(assert (=> b!1302579 (= lt!582725 call!64144)))

(assert (=> b!1302579 (= e!742965 (+!4467 call!64144 (tuple2!22593 (select (arr!41875 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001)) (get!21148 (select (arr!41874 _values!1445) (bvadd from!2144 #b00000000000000000000000000000001)) (dynLambda!3426 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1302580 () Bool)

(declare-fun res!865198 () Bool)

(assert (=> b!1302580 (=> (not res!865198) (not e!742966))))

(assert (=> b!1302580 (= res!865198 (not (contains!8270 lt!582729 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1302581 () Bool)

(assert (=> b!1302581 (= e!742964 (= lt!582729 (getCurrentListMapNoExtraKeys!6099 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1448)))))

(assert (= (and d!141485 c!124998) b!1302572))

(assert (= (and d!141485 (not c!124998)) b!1302578))

(assert (= (and b!1302578 c!124996) b!1302579))

(assert (= (and b!1302578 (not c!124996)) b!1302577))

(assert (= (or b!1302579 b!1302577) bm!64141))

(assert (= (and d!141485 res!865197) b!1302580))

(assert (= (and b!1302580 res!865198) b!1302575))

(assert (= (and b!1302575 res!865199) b!1302574))

(assert (= (and b!1302575 c!124999) b!1302576))

(assert (= (and b!1302575 (not c!124999)) b!1302570))

(assert (= (and b!1302576 res!865200) b!1302573))

(assert (= (and b!1302570 c!124997) b!1302581))

(assert (= (and b!1302570 (not c!124997)) b!1302571))

(declare-fun b_lambda!23243 () Bool)

(assert (=> (not b_lambda!23243) (not b!1302573)))

(assert (=> b!1302573 t!43312))

(declare-fun b_and!47387 () Bool)

(assert (= b_and!47385 (and (=> t!43312 result!23801) b_and!47387)))

(declare-fun b_lambda!23245 () Bool)

(assert (=> (not b_lambda!23245) (not b!1302579)))

(assert (=> b!1302579 t!43312))

(declare-fun b_and!47389 () Bool)

(assert (= b_and!47387 (and (=> t!43312 result!23801) b_and!47389)))

(declare-fun m!1193345 () Bool)

(assert (=> b!1302579 m!1193345))

(declare-fun m!1193347 () Bool)

(assert (=> b!1302579 m!1193347))

(declare-fun m!1193349 () Bool)

(assert (=> b!1302579 m!1193349))

(declare-fun m!1193351 () Bool)

(assert (=> b!1302579 m!1193351))

(assert (=> b!1302579 m!1193347))

(assert (=> b!1302579 m!1193207))

(declare-fun m!1193353 () Bool)

(assert (=> b!1302579 m!1193353))

(declare-fun m!1193355 () Bool)

(assert (=> b!1302579 m!1193355))

(assert (=> b!1302579 m!1193207))

(declare-fun m!1193357 () Bool)

(assert (=> b!1302579 m!1193357))

(assert (=> b!1302579 m!1193349))

(declare-fun m!1193359 () Bool)

(assert (=> d!141485 m!1193359))

(assert (=> d!141485 m!1193115))

(declare-fun m!1193361 () Bool)

(assert (=> b!1302571 m!1193361))

(declare-fun m!1193363 () Bool)

(assert (=> bm!64141 m!1193363))

(assert (=> b!1302578 m!1193355))

(assert (=> b!1302578 m!1193355))

(declare-fun m!1193365 () Bool)

(assert (=> b!1302578 m!1193365))

(assert (=> b!1302576 m!1193355))

(assert (=> b!1302576 m!1193355))

(declare-fun m!1193367 () Bool)

(assert (=> b!1302576 m!1193367))

(assert (=> b!1302581 m!1193363))

(assert (=> b!1302574 m!1193355))

(assert (=> b!1302574 m!1193355))

(assert (=> b!1302574 m!1193365))

(declare-fun m!1193369 () Bool)

(assert (=> b!1302580 m!1193369))

(assert (=> b!1302573 m!1193355))

(declare-fun m!1193371 () Bool)

(assert (=> b!1302573 m!1193371))

(assert (=> b!1302573 m!1193347))

(assert (=> b!1302573 m!1193347))

(assert (=> b!1302573 m!1193207))

(assert (=> b!1302573 m!1193353))

(assert (=> b!1302573 m!1193355))

(assert (=> b!1302573 m!1193207))

(assert (=> b!1302451 d!141485))

(assert (=> b!1302415 d!141477))

(assert (=> b!1302415 d!141479))

(declare-fun d!141487 () Bool)

(declare-fun e!742970 () Bool)

(assert (=> d!141487 e!742970))

(declare-fun res!865201 () Bool)

(assert (=> d!141487 (=> res!865201 e!742970)))

(declare-fun lt!582732 () Bool)

(assert (=> d!141487 (= res!865201 (not lt!582732))))

(declare-fun lt!582731 () Bool)

(assert (=> d!141487 (= lt!582732 lt!582731)))

(declare-fun lt!582734 () Unit!43111)

(declare-fun e!742969 () Unit!43111)

(assert (=> d!141487 (= lt!582734 e!742969)))

(declare-fun c!125000 () Bool)

(assert (=> d!141487 (= c!125000 lt!582731)))

(assert (=> d!141487 (= lt!582731 (containsKey!724 (toList!10140 lt!582622) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!141487 (= (contains!8270 lt!582622 #b1000000000000000000000000000000000000000000000000000000000000000) lt!582732)))

(declare-fun b!1302582 () Bool)

(declare-fun lt!582733 () Unit!43111)

(assert (=> b!1302582 (= e!742969 lt!582733)))

(assert (=> b!1302582 (= lt!582733 (lemmaContainsKeyImpliesGetValueByKeyDefined!470 (toList!10140 lt!582622) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1302582 (isDefined!509 (getValueByKey!702 (toList!10140 lt!582622) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1302583 () Bool)

(declare-fun Unit!43120 () Unit!43111)

(assert (=> b!1302583 (= e!742969 Unit!43120)))

(declare-fun b!1302584 () Bool)

(assert (=> b!1302584 (= e!742970 (isDefined!509 (getValueByKey!702 (toList!10140 lt!582622) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141487 c!125000) b!1302582))

(assert (= (and d!141487 (not c!125000)) b!1302583))

(assert (= (and d!141487 (not res!865201)) b!1302584))

(declare-fun m!1193373 () Bool)

(assert (=> d!141487 m!1193373))

(declare-fun m!1193375 () Bool)

(assert (=> b!1302582 m!1193375))

(declare-fun m!1193377 () Bool)

(assert (=> b!1302582 m!1193377))

(assert (=> b!1302582 m!1193377))

(declare-fun m!1193379 () Bool)

(assert (=> b!1302582 m!1193379))

(assert (=> b!1302584 m!1193377))

(assert (=> b!1302584 m!1193377))

(assert (=> b!1302584 m!1193379))

(assert (=> b!1302450 d!141487))

(declare-fun d!141489 () Bool)

(declare-fun e!742972 () Bool)

(assert (=> d!141489 e!742972))

(declare-fun res!865202 () Bool)

(assert (=> d!141489 (=> res!865202 e!742972)))

(declare-fun lt!582736 () Bool)

(assert (=> d!141489 (= res!865202 (not lt!582736))))

(declare-fun lt!582735 () Bool)

(assert (=> d!141489 (= lt!582736 lt!582735)))

(declare-fun lt!582738 () Unit!43111)

(declare-fun e!742971 () Unit!43111)

(assert (=> d!141489 (= lt!582738 e!742971)))

(declare-fun c!125001 () Bool)

(assert (=> d!141489 (= c!125001 lt!582735)))

(assert (=> d!141489 (= lt!582735 (containsKey!724 (toList!10140 lt!582693) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!141489 (= (contains!8270 lt!582693 #b1000000000000000000000000000000000000000000000000000000000000000) lt!582736)))

(declare-fun b!1302585 () Bool)

(declare-fun lt!582737 () Unit!43111)

(assert (=> b!1302585 (= e!742971 lt!582737)))

(assert (=> b!1302585 (= lt!582737 (lemmaContainsKeyImpliesGetValueByKeyDefined!470 (toList!10140 lt!582693) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1302585 (isDefined!509 (getValueByKey!702 (toList!10140 lt!582693) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1302586 () Bool)

(declare-fun Unit!43121 () Unit!43111)

(assert (=> b!1302586 (= e!742971 Unit!43121)))

(declare-fun b!1302587 () Bool)

(assert (=> b!1302587 (= e!742972 (isDefined!509 (getValueByKey!702 (toList!10140 lt!582693) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141489 c!125001) b!1302585))

(assert (= (and d!141489 (not c!125001)) b!1302586))

(assert (= (and d!141489 (not res!865202)) b!1302587))

(declare-fun m!1193381 () Bool)

(assert (=> d!141489 m!1193381))

(declare-fun m!1193383 () Bool)

(assert (=> b!1302585 m!1193383))

(declare-fun m!1193385 () Bool)

(assert (=> b!1302585 m!1193385))

(assert (=> b!1302585 m!1193385))

(declare-fun m!1193387 () Bool)

(assert (=> b!1302585 m!1193387))

(assert (=> b!1302587 m!1193385))

(assert (=> b!1302587 m!1193385))

(assert (=> b!1302587 m!1193387))

(assert (=> bm!64135 d!141489))

(assert (=> b!1302400 d!141473))

(assert (=> b!1302511 d!141451))

(declare-fun d!141491 () Bool)

(declare-fun res!865207 () Bool)

(declare-fun e!742977 () Bool)

(assert (=> d!141491 (=> res!865207 e!742977)))

(assert (=> d!141491 (= res!865207 (and ((_ is Cons!29716) (toList!10140 (ListLongMap!20250 Nil!29717))) (= (_1!11307 (h!30925 (toList!10140 (ListLongMap!20250 Nil!29717)))) k0!1205)))))

(assert (=> d!141491 (= (containsKey!724 (toList!10140 (ListLongMap!20250 Nil!29717)) k0!1205) e!742977)))

(declare-fun b!1302592 () Bool)

(declare-fun e!742978 () Bool)

(assert (=> b!1302592 (= e!742977 e!742978)))

(declare-fun res!865208 () Bool)

(assert (=> b!1302592 (=> (not res!865208) (not e!742978))))

(assert (=> b!1302592 (= res!865208 (and (or (not ((_ is Cons!29716) (toList!10140 (ListLongMap!20250 Nil!29717)))) (bvsle (_1!11307 (h!30925 (toList!10140 (ListLongMap!20250 Nil!29717)))) k0!1205)) ((_ is Cons!29716) (toList!10140 (ListLongMap!20250 Nil!29717))) (bvslt (_1!11307 (h!30925 (toList!10140 (ListLongMap!20250 Nil!29717)))) k0!1205)))))

(declare-fun b!1302593 () Bool)

(assert (=> b!1302593 (= e!742978 (containsKey!724 (t!43308 (toList!10140 (ListLongMap!20250 Nil!29717))) k0!1205))))

(assert (= (and d!141491 (not res!865207)) b!1302592))

(assert (= (and b!1302592 res!865208) b!1302593))

(declare-fun m!1193389 () Bool)

(assert (=> b!1302593 m!1193389))

(assert (=> d!141437 d!141491))

(declare-fun d!141493 () Bool)

(declare-fun e!742979 () Bool)

(assert (=> d!141493 e!742979))

(declare-fun res!865209 () Bool)

(assert (=> d!141493 (=> (not res!865209) (not e!742979))))

(declare-fun lt!582741 () ListLongMap!20249)

(assert (=> d!141493 (= res!865209 (contains!8270 lt!582741 (_1!11307 (ite (or c!124982 c!124983) (tuple2!22593 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22593 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun lt!582742 () List!29720)

(assert (=> d!141493 (= lt!582741 (ListLongMap!20250 lt!582742))))

(declare-fun lt!582739 () Unit!43111)

(declare-fun lt!582740 () Unit!43111)

(assert (=> d!141493 (= lt!582739 lt!582740)))

(assert (=> d!141493 (= (getValueByKey!702 lt!582742 (_1!11307 (ite (or c!124982 c!124983) (tuple2!22593 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22593 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (Some!753 (_2!11307 (ite (or c!124982 c!124983) (tuple2!22593 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22593 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!141493 (= lt!582740 (lemmaContainsTupThenGetReturnValue!348 lt!582742 (_1!11307 (ite (or c!124982 c!124983) (tuple2!22593 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22593 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11307 (ite (or c!124982 c!124983) (tuple2!22593 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22593 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!141493 (= lt!582742 (insertStrictlySorted!477 (toList!10140 (ite c!124982 call!64139 (ite c!124983 call!64140 call!64137))) (_1!11307 (ite (or c!124982 c!124983) (tuple2!22593 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22593 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11307 (ite (or c!124982 c!124983) (tuple2!22593 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22593 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!141493 (= (+!4467 (ite c!124982 call!64139 (ite c!124983 call!64140 call!64137)) (ite (or c!124982 c!124983) (tuple2!22593 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22593 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) lt!582741)))

(declare-fun b!1302594 () Bool)

(declare-fun res!865210 () Bool)

(assert (=> b!1302594 (=> (not res!865210) (not e!742979))))

(assert (=> b!1302594 (= res!865210 (= (getValueByKey!702 (toList!10140 lt!582741) (_1!11307 (ite (or c!124982 c!124983) (tuple2!22593 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22593 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (Some!753 (_2!11307 (ite (or c!124982 c!124983) (tuple2!22593 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22593 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(declare-fun b!1302595 () Bool)

(assert (=> b!1302595 (= e!742979 (contains!8273 (toList!10140 lt!582741) (ite (or c!124982 c!124983) (tuple2!22593 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22593 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (= (and d!141493 res!865209) b!1302594))

(assert (= (and b!1302594 res!865210) b!1302595))

(declare-fun m!1193391 () Bool)

(assert (=> d!141493 m!1193391))

(declare-fun m!1193393 () Bool)

(assert (=> d!141493 m!1193393))

(declare-fun m!1193395 () Bool)

(assert (=> d!141493 m!1193395))

(declare-fun m!1193397 () Bool)

(assert (=> d!141493 m!1193397))

(declare-fun m!1193399 () Bool)

(assert (=> b!1302594 m!1193399))

(declare-fun m!1193401 () Bool)

(assert (=> b!1302595 m!1193401))

(assert (=> bm!64139 d!141493))

(assert (=> d!141459 d!141441))

(declare-fun d!141495 () Bool)

(declare-fun e!742981 () Bool)

(assert (=> d!141495 e!742981))

(declare-fun res!865211 () Bool)

(assert (=> d!141495 (=> res!865211 e!742981)))

(declare-fun lt!582744 () Bool)

(assert (=> d!141495 (= res!865211 (not lt!582744))))

(declare-fun lt!582743 () Bool)

(assert (=> d!141495 (= lt!582744 lt!582743)))

(declare-fun lt!582746 () Unit!43111)

(declare-fun e!742980 () Unit!43111)

(assert (=> d!141495 (= lt!582746 e!742980)))

(declare-fun c!125002 () Bool)

(assert (=> d!141495 (= c!125002 lt!582743)))

(assert (=> d!141495 (= lt!582743 (containsKey!724 (toList!10140 lt!582693) (select (arr!41875 _keys!1741) from!2144)))))

(assert (=> d!141495 (= (contains!8270 lt!582693 (select (arr!41875 _keys!1741) from!2144)) lt!582744)))

(declare-fun b!1302596 () Bool)

(declare-fun lt!582745 () Unit!43111)

(assert (=> b!1302596 (= e!742980 lt!582745)))

(assert (=> b!1302596 (= lt!582745 (lemmaContainsKeyImpliesGetValueByKeyDefined!470 (toList!10140 lt!582693) (select (arr!41875 _keys!1741) from!2144)))))

(assert (=> b!1302596 (isDefined!509 (getValueByKey!702 (toList!10140 lt!582693) (select (arr!41875 _keys!1741) from!2144)))))

(declare-fun b!1302597 () Bool)

(declare-fun Unit!43122 () Unit!43111)

(assert (=> b!1302597 (= e!742980 Unit!43122)))

(declare-fun b!1302598 () Bool)

(assert (=> b!1302598 (= e!742981 (isDefined!509 (getValueByKey!702 (toList!10140 lt!582693) (select (arr!41875 _keys!1741) from!2144))))))

(assert (= (and d!141495 c!125002) b!1302596))

(assert (= (and d!141495 (not c!125002)) b!1302597))

(assert (= (and d!141495 (not res!865211)) b!1302598))

(assert (=> d!141495 m!1193129))

(declare-fun m!1193403 () Bool)

(assert (=> d!141495 m!1193403))

(assert (=> b!1302596 m!1193129))

(declare-fun m!1193405 () Bool)

(assert (=> b!1302596 m!1193405))

(assert (=> b!1302596 m!1193129))

(declare-fun m!1193407 () Bool)

(assert (=> b!1302596 m!1193407))

(assert (=> b!1302596 m!1193407))

(declare-fun m!1193409 () Bool)

(assert (=> b!1302596 m!1193409))

(assert (=> b!1302598 m!1193129))

(assert (=> b!1302598 m!1193407))

(assert (=> b!1302598 m!1193407))

(assert (=> b!1302598 m!1193409))

(assert (=> b!1302512 d!141495))

(declare-fun d!141497 () Bool)

(declare-fun res!865212 () Bool)

(declare-fun e!742982 () Bool)

(assert (=> d!141497 (=> res!865212 e!742982)))

(assert (=> d!141497 (= res!865212 (and ((_ is Cons!29716) (toList!10140 (getCurrentListMap!5165 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11307 (h!30925 (toList!10140 (getCurrentListMap!5165 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(assert (=> d!141497 (= (containsKey!724 (toList!10140 (getCurrentListMap!5165 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!742982)))

(declare-fun b!1302599 () Bool)

(declare-fun e!742983 () Bool)

(assert (=> b!1302599 (= e!742982 e!742983)))

(declare-fun res!865213 () Bool)

(assert (=> b!1302599 (=> (not res!865213) (not e!742983))))

(assert (=> b!1302599 (= res!865213 (and (or (not ((_ is Cons!29716) (toList!10140 (getCurrentListMap!5165 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) (bvsle (_1!11307 (h!30925 (toList!10140 (getCurrentListMap!5165 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)) ((_ is Cons!29716) (toList!10140 (getCurrentListMap!5165 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (bvslt (_1!11307 (h!30925 (toList!10140 (getCurrentListMap!5165 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(declare-fun b!1302600 () Bool)

(assert (=> b!1302600 (= e!742983 (containsKey!724 (t!43308 (toList!10140 (getCurrentListMap!5165 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(assert (= (and d!141497 (not res!865212)) b!1302599))

(assert (= (and b!1302599 res!865213) b!1302600))

(declare-fun m!1193411 () Bool)

(assert (=> b!1302600 m!1193411))

(assert (=> d!141457 d!141497))

(assert (=> bm!64138 d!141455))

(assert (=> b!1302513 d!141451))

(assert (=> d!141439 d!141437))

(declare-fun d!141499 () Bool)

(assert (=> d!141499 (not (contains!8270 (ListLongMap!20250 Nil!29717) k0!1205))))

(assert (=> d!141499 true))

(declare-fun _$29!195 () Unit!43111)

(assert (=> d!141499 (= (choose!1912 k0!1205) _$29!195)))

(declare-fun bs!37089 () Bool)

(assert (= bs!37089 d!141499))

(assert (=> bs!37089 m!1193121))

(assert (=> d!141439 d!141499))

(declare-fun d!141501 () Bool)

(declare-fun get!21151 (Option!754) V!51603)

(assert (=> d!141501 (= (apply!1019 lt!582693 #b0000000000000000000000000000000000000000000000000000000000000000) (get!21151 (getValueByKey!702 (toList!10140 lt!582693) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37090 () Bool)

(assert (= bs!37090 d!141501))

(declare-fun m!1193413 () Bool)

(assert (=> bs!37090 m!1193413))

(assert (=> bs!37090 m!1193413))

(declare-fun m!1193415 () Bool)

(assert (=> bs!37090 m!1193415))

(assert (=> b!1302516 d!141501))

(declare-fun d!141503 () Bool)

(declare-fun e!742985 () Bool)

(assert (=> d!141503 e!742985))

(declare-fun res!865214 () Bool)

(assert (=> d!141503 (=> res!865214 e!742985)))

(declare-fun lt!582748 () Bool)

(assert (=> d!141503 (= res!865214 (not lt!582748))))

(declare-fun lt!582747 () Bool)

(assert (=> d!141503 (= lt!582748 lt!582747)))

(declare-fun lt!582750 () Unit!43111)

(declare-fun e!742984 () Unit!43111)

(assert (=> d!141503 (= lt!582750 e!742984)))

(declare-fun c!125003 () Bool)

(assert (=> d!141503 (= c!125003 lt!582747)))

(assert (=> d!141503 (= lt!582747 (containsKey!724 (toList!10140 lt!582693) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!141503 (= (contains!8270 lt!582693 #b0000000000000000000000000000000000000000000000000000000000000000) lt!582748)))

(declare-fun b!1302601 () Bool)

(declare-fun lt!582749 () Unit!43111)

(assert (=> b!1302601 (= e!742984 lt!582749)))

(assert (=> b!1302601 (= lt!582749 (lemmaContainsKeyImpliesGetValueByKeyDefined!470 (toList!10140 lt!582693) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1302601 (isDefined!509 (getValueByKey!702 (toList!10140 lt!582693) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1302602 () Bool)

(declare-fun Unit!43123 () Unit!43111)

(assert (=> b!1302602 (= e!742984 Unit!43123)))

(declare-fun b!1302603 () Bool)

(assert (=> b!1302603 (= e!742985 (isDefined!509 (getValueByKey!702 (toList!10140 lt!582693) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141503 c!125003) b!1302601))

(assert (= (and d!141503 (not c!125003)) b!1302602))

(assert (= (and d!141503 (not res!865214)) b!1302603))

(declare-fun m!1193417 () Bool)

(assert (=> d!141503 m!1193417))

(declare-fun m!1193419 () Bool)

(assert (=> b!1302601 m!1193419))

(assert (=> b!1302601 m!1193413))

(assert (=> b!1302601 m!1193413))

(declare-fun m!1193421 () Bool)

(assert (=> b!1302601 m!1193421))

(assert (=> b!1302603 m!1193413))

(assert (=> b!1302603 m!1193413))

(assert (=> b!1302603 m!1193421))

(assert (=> bm!64134 d!141503))

(declare-fun d!141505 () Bool)

(declare-fun isEmpty!1059 (List!29720) Bool)

(assert (=> d!141505 (= (isEmpty!1057 lt!582622) (isEmpty!1059 (toList!10140 lt!582622)))))

(declare-fun bs!37091 () Bool)

(assert (= bs!37091 d!141505))

(declare-fun m!1193423 () Bool)

(assert (=> bs!37091 m!1193423))

(assert (=> b!1302441 d!141505))

(declare-fun d!141507 () Bool)

(assert (=> d!141507 (= (apply!1019 lt!582693 #b1000000000000000000000000000000000000000000000000000000000000000) (get!21151 (getValueByKey!702 (toList!10140 lt!582693) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37092 () Bool)

(assert (= bs!37092 d!141507))

(assert (=> bs!37092 m!1193385))

(assert (=> bs!37092 m!1193385))

(declare-fun m!1193425 () Bool)

(assert (=> bs!37092 m!1193425))

(assert (=> b!1302501 d!141507))

(declare-fun d!141509 () Bool)

(declare-fun e!742986 () Bool)

(assert (=> d!141509 e!742986))

(declare-fun res!865215 () Bool)

(assert (=> d!141509 (=> (not res!865215) (not e!742986))))

(declare-fun lt!582753 () ListLongMap!20249)

(assert (=> d!141509 (= res!865215 (contains!8270 lt!582753 (_1!11307 (tuple2!22593 lt!582681 minValue!1387))))))

(declare-fun lt!582754 () List!29720)

(assert (=> d!141509 (= lt!582753 (ListLongMap!20250 lt!582754))))

(declare-fun lt!582751 () Unit!43111)

(declare-fun lt!582752 () Unit!43111)

(assert (=> d!141509 (= lt!582751 lt!582752)))

(assert (=> d!141509 (= (getValueByKey!702 lt!582754 (_1!11307 (tuple2!22593 lt!582681 minValue!1387))) (Some!753 (_2!11307 (tuple2!22593 lt!582681 minValue!1387))))))

(assert (=> d!141509 (= lt!582752 (lemmaContainsTupThenGetReturnValue!348 lt!582754 (_1!11307 (tuple2!22593 lt!582681 minValue!1387)) (_2!11307 (tuple2!22593 lt!582681 minValue!1387))))))

(assert (=> d!141509 (= lt!582754 (insertStrictlySorted!477 (toList!10140 lt!582672) (_1!11307 (tuple2!22593 lt!582681 minValue!1387)) (_2!11307 (tuple2!22593 lt!582681 minValue!1387))))))

(assert (=> d!141509 (= (+!4467 lt!582672 (tuple2!22593 lt!582681 minValue!1387)) lt!582753)))

(declare-fun b!1302604 () Bool)

(declare-fun res!865216 () Bool)

(assert (=> b!1302604 (=> (not res!865216) (not e!742986))))

(assert (=> b!1302604 (= res!865216 (= (getValueByKey!702 (toList!10140 lt!582753) (_1!11307 (tuple2!22593 lt!582681 minValue!1387))) (Some!753 (_2!11307 (tuple2!22593 lt!582681 minValue!1387)))))))

(declare-fun b!1302605 () Bool)

(assert (=> b!1302605 (= e!742986 (contains!8273 (toList!10140 lt!582753) (tuple2!22593 lt!582681 minValue!1387)))))

(assert (= (and d!141509 res!865215) b!1302604))

(assert (= (and b!1302604 res!865216) b!1302605))

(declare-fun m!1193427 () Bool)

(assert (=> d!141509 m!1193427))

(declare-fun m!1193429 () Bool)

(assert (=> d!141509 m!1193429))

(declare-fun m!1193431 () Bool)

(assert (=> d!141509 m!1193431))

(declare-fun m!1193433 () Bool)

(assert (=> d!141509 m!1193433))

(declare-fun m!1193435 () Bool)

(assert (=> b!1302604 m!1193435))

(declare-fun m!1193437 () Bool)

(assert (=> b!1302605 m!1193437))

(assert (=> b!1302515 d!141509))

(declare-fun d!141511 () Bool)

(declare-fun e!742987 () Bool)

(assert (=> d!141511 e!742987))

(declare-fun res!865217 () Bool)

(assert (=> d!141511 (=> (not res!865217) (not e!742987))))

(declare-fun lt!582757 () ListLongMap!20249)

(assert (=> d!141511 (= res!865217 (contains!8270 lt!582757 (_1!11307 (tuple2!22593 lt!582680 zeroValue!1387))))))

(declare-fun lt!582758 () List!29720)

(assert (=> d!141511 (= lt!582757 (ListLongMap!20250 lt!582758))))

(declare-fun lt!582755 () Unit!43111)

(declare-fun lt!582756 () Unit!43111)

(assert (=> d!141511 (= lt!582755 lt!582756)))

(assert (=> d!141511 (= (getValueByKey!702 lt!582758 (_1!11307 (tuple2!22593 lt!582680 zeroValue!1387))) (Some!753 (_2!11307 (tuple2!22593 lt!582680 zeroValue!1387))))))

(assert (=> d!141511 (= lt!582756 (lemmaContainsTupThenGetReturnValue!348 lt!582758 (_1!11307 (tuple2!22593 lt!582680 zeroValue!1387)) (_2!11307 (tuple2!22593 lt!582680 zeroValue!1387))))))

(assert (=> d!141511 (= lt!582758 (insertStrictlySorted!477 (toList!10140 lt!582677) (_1!11307 (tuple2!22593 lt!582680 zeroValue!1387)) (_2!11307 (tuple2!22593 lt!582680 zeroValue!1387))))))

(assert (=> d!141511 (= (+!4467 lt!582677 (tuple2!22593 lt!582680 zeroValue!1387)) lt!582757)))

(declare-fun b!1302606 () Bool)

(declare-fun res!865218 () Bool)

(assert (=> b!1302606 (=> (not res!865218) (not e!742987))))

(assert (=> b!1302606 (= res!865218 (= (getValueByKey!702 (toList!10140 lt!582757) (_1!11307 (tuple2!22593 lt!582680 zeroValue!1387))) (Some!753 (_2!11307 (tuple2!22593 lt!582680 zeroValue!1387)))))))

(declare-fun b!1302607 () Bool)

(assert (=> b!1302607 (= e!742987 (contains!8273 (toList!10140 lt!582757) (tuple2!22593 lt!582680 zeroValue!1387)))))

(assert (= (and d!141511 res!865217) b!1302606))

(assert (= (and b!1302606 res!865218) b!1302607))

(declare-fun m!1193439 () Bool)

(assert (=> d!141511 m!1193439))

(declare-fun m!1193441 () Bool)

(assert (=> d!141511 m!1193441))

(declare-fun m!1193443 () Bool)

(assert (=> d!141511 m!1193443))

(declare-fun m!1193445 () Bool)

(assert (=> d!141511 m!1193445))

(declare-fun m!1193447 () Bool)

(assert (=> b!1302606 m!1193447))

(declare-fun m!1193449 () Bool)

(assert (=> b!1302607 m!1193449))

(assert (=> b!1302515 d!141511))

(assert (=> b!1302515 d!141455))

(declare-fun d!141513 () Bool)

(declare-fun e!742988 () Bool)

(assert (=> d!141513 e!742988))

(declare-fun res!865219 () Bool)

(assert (=> d!141513 (=> (not res!865219) (not e!742988))))

(declare-fun lt!582761 () ListLongMap!20249)

(assert (=> d!141513 (= res!865219 (contains!8270 lt!582761 (_1!11307 (tuple2!22593 lt!582692 minValue!1387))))))

(declare-fun lt!582762 () List!29720)

(assert (=> d!141513 (= lt!582761 (ListLongMap!20250 lt!582762))))

(declare-fun lt!582759 () Unit!43111)

(declare-fun lt!582760 () Unit!43111)

(assert (=> d!141513 (= lt!582759 lt!582760)))

(assert (=> d!141513 (= (getValueByKey!702 lt!582762 (_1!11307 (tuple2!22593 lt!582692 minValue!1387))) (Some!753 (_2!11307 (tuple2!22593 lt!582692 minValue!1387))))))

(assert (=> d!141513 (= lt!582760 (lemmaContainsTupThenGetReturnValue!348 lt!582762 (_1!11307 (tuple2!22593 lt!582692 minValue!1387)) (_2!11307 (tuple2!22593 lt!582692 minValue!1387))))))

(assert (=> d!141513 (= lt!582762 (insertStrictlySorted!477 (toList!10140 lt!582690) (_1!11307 (tuple2!22593 lt!582692 minValue!1387)) (_2!11307 (tuple2!22593 lt!582692 minValue!1387))))))

(assert (=> d!141513 (= (+!4467 lt!582690 (tuple2!22593 lt!582692 minValue!1387)) lt!582761)))

(declare-fun b!1302608 () Bool)

(declare-fun res!865220 () Bool)

(assert (=> b!1302608 (=> (not res!865220) (not e!742988))))

(assert (=> b!1302608 (= res!865220 (= (getValueByKey!702 (toList!10140 lt!582761) (_1!11307 (tuple2!22593 lt!582692 minValue!1387))) (Some!753 (_2!11307 (tuple2!22593 lt!582692 minValue!1387)))))))

(declare-fun b!1302609 () Bool)

(assert (=> b!1302609 (= e!742988 (contains!8273 (toList!10140 lt!582761) (tuple2!22593 lt!582692 minValue!1387)))))

(assert (= (and d!141513 res!865219) b!1302608))

(assert (= (and b!1302608 res!865220) b!1302609))

(declare-fun m!1193451 () Bool)

(assert (=> d!141513 m!1193451))

(declare-fun m!1193453 () Bool)

(assert (=> d!141513 m!1193453))

(declare-fun m!1193455 () Bool)

(assert (=> d!141513 m!1193455))

(declare-fun m!1193457 () Bool)

(assert (=> d!141513 m!1193457))

(declare-fun m!1193459 () Bool)

(assert (=> b!1302608 m!1193459))

(declare-fun m!1193461 () Bool)

(assert (=> b!1302609 m!1193461))

(assert (=> b!1302515 d!141513))

(declare-fun d!141515 () Bool)

(declare-fun e!742989 () Bool)

(assert (=> d!141515 e!742989))

(declare-fun res!865221 () Bool)

(assert (=> d!141515 (=> (not res!865221) (not e!742989))))

(declare-fun lt!582765 () ListLongMap!20249)

(assert (=> d!141515 (= res!865221 (contains!8270 lt!582765 (_1!11307 (tuple2!22593 lt!582674 zeroValue!1387))))))

(declare-fun lt!582766 () List!29720)

(assert (=> d!141515 (= lt!582765 (ListLongMap!20250 lt!582766))))

(declare-fun lt!582763 () Unit!43111)

(declare-fun lt!582764 () Unit!43111)

(assert (=> d!141515 (= lt!582763 lt!582764)))

(assert (=> d!141515 (= (getValueByKey!702 lt!582766 (_1!11307 (tuple2!22593 lt!582674 zeroValue!1387))) (Some!753 (_2!11307 (tuple2!22593 lt!582674 zeroValue!1387))))))

(assert (=> d!141515 (= lt!582764 (lemmaContainsTupThenGetReturnValue!348 lt!582766 (_1!11307 (tuple2!22593 lt!582674 zeroValue!1387)) (_2!11307 (tuple2!22593 lt!582674 zeroValue!1387))))))

(assert (=> d!141515 (= lt!582766 (insertStrictlySorted!477 (toList!10140 lt!582688) (_1!11307 (tuple2!22593 lt!582674 zeroValue!1387)) (_2!11307 (tuple2!22593 lt!582674 zeroValue!1387))))))

(assert (=> d!141515 (= (+!4467 lt!582688 (tuple2!22593 lt!582674 zeroValue!1387)) lt!582765)))

(declare-fun b!1302610 () Bool)

(declare-fun res!865222 () Bool)

(assert (=> b!1302610 (=> (not res!865222) (not e!742989))))

(assert (=> b!1302610 (= res!865222 (= (getValueByKey!702 (toList!10140 lt!582765) (_1!11307 (tuple2!22593 lt!582674 zeroValue!1387))) (Some!753 (_2!11307 (tuple2!22593 lt!582674 zeroValue!1387)))))))

(declare-fun b!1302611 () Bool)

(assert (=> b!1302611 (= e!742989 (contains!8273 (toList!10140 lt!582765) (tuple2!22593 lt!582674 zeroValue!1387)))))

(assert (= (and d!141515 res!865221) b!1302610))

(assert (= (and b!1302610 res!865222) b!1302611))

(declare-fun m!1193463 () Bool)

(assert (=> d!141515 m!1193463))

(declare-fun m!1193465 () Bool)

(assert (=> d!141515 m!1193465))

(declare-fun m!1193467 () Bool)

(assert (=> d!141515 m!1193467))

(declare-fun m!1193469 () Bool)

(assert (=> d!141515 m!1193469))

(declare-fun m!1193471 () Bool)

(assert (=> b!1302610 m!1193471))

(declare-fun m!1193473 () Bool)

(assert (=> b!1302611 m!1193473))

(assert (=> b!1302515 d!141515))

(declare-fun d!141517 () Bool)

(assert (=> d!141517 (= (apply!1019 lt!582672 lt!582676) (get!21151 (getValueByKey!702 (toList!10140 lt!582672) lt!582676)))))

(declare-fun bs!37093 () Bool)

(assert (= bs!37093 d!141517))

(declare-fun m!1193475 () Bool)

(assert (=> bs!37093 m!1193475))

(assert (=> bs!37093 m!1193475))

(declare-fun m!1193477 () Bool)

(assert (=> bs!37093 m!1193477))

(assert (=> b!1302515 d!141517))

(declare-fun d!141519 () Bool)

(assert (=> d!141519 (contains!8270 (+!4467 lt!582677 (tuple2!22593 lt!582680 zeroValue!1387)) lt!582673)))

(declare-fun lt!582769 () Unit!43111)

(declare-fun choose!1915 (ListLongMap!20249 (_ BitVec 64) V!51603 (_ BitVec 64)) Unit!43111)

(assert (=> d!141519 (= lt!582769 (choose!1915 lt!582677 lt!582680 zeroValue!1387 lt!582673))))

(assert (=> d!141519 (contains!8270 lt!582677 lt!582673)))

(assert (=> d!141519 (= (addStillContains!1107 lt!582677 lt!582680 zeroValue!1387 lt!582673) lt!582769)))

(declare-fun bs!37094 () Bool)

(assert (= bs!37094 d!141519))

(assert (=> bs!37094 m!1193257))

(assert (=> bs!37094 m!1193257))

(assert (=> bs!37094 m!1193261))

(declare-fun m!1193479 () Bool)

(assert (=> bs!37094 m!1193479))

(declare-fun m!1193481 () Bool)

(assert (=> bs!37094 m!1193481))

(assert (=> b!1302515 d!141519))

(declare-fun d!141521 () Bool)

(assert (=> d!141521 (= (apply!1019 lt!582690 lt!582679) (get!21151 (getValueByKey!702 (toList!10140 lt!582690) lt!582679)))))

(declare-fun bs!37095 () Bool)

(assert (= bs!37095 d!141521))

(declare-fun m!1193483 () Bool)

(assert (=> bs!37095 m!1193483))

(assert (=> bs!37095 m!1193483))

(declare-fun m!1193485 () Bool)

(assert (=> bs!37095 m!1193485))

(assert (=> b!1302515 d!141521))

(declare-fun d!141523 () Bool)

(assert (=> d!141523 (= (apply!1019 (+!4467 lt!582672 (tuple2!22593 lt!582681 minValue!1387)) lt!582676) (get!21151 (getValueByKey!702 (toList!10140 (+!4467 lt!582672 (tuple2!22593 lt!582681 minValue!1387))) lt!582676)))))

(declare-fun bs!37096 () Bool)

(assert (= bs!37096 d!141523))

(declare-fun m!1193487 () Bool)

(assert (=> bs!37096 m!1193487))

(assert (=> bs!37096 m!1193487))

(declare-fun m!1193489 () Bool)

(assert (=> bs!37096 m!1193489))

(assert (=> b!1302515 d!141523))

(declare-fun d!141525 () Bool)

(assert (=> d!141525 (= (apply!1019 (+!4467 lt!582688 (tuple2!22593 lt!582674 zeroValue!1387)) lt!582686) (get!21151 (getValueByKey!702 (toList!10140 (+!4467 lt!582688 (tuple2!22593 lt!582674 zeroValue!1387))) lt!582686)))))

(declare-fun bs!37097 () Bool)

(assert (= bs!37097 d!141525))

(declare-fun m!1193491 () Bool)

(assert (=> bs!37097 m!1193491))

(assert (=> bs!37097 m!1193491))

(declare-fun m!1193493 () Bool)

(assert (=> bs!37097 m!1193493))

(assert (=> b!1302515 d!141525))

(declare-fun d!141527 () Bool)

(assert (=> d!141527 (= (apply!1019 (+!4467 lt!582688 (tuple2!22593 lt!582674 zeroValue!1387)) lt!582686) (apply!1019 lt!582688 lt!582686))))

(declare-fun lt!582772 () Unit!43111)

(declare-fun choose!1916 (ListLongMap!20249 (_ BitVec 64) V!51603 (_ BitVec 64)) Unit!43111)

(assert (=> d!141527 (= lt!582772 (choose!1916 lt!582688 lt!582674 zeroValue!1387 lt!582686))))

(declare-fun e!742992 () Bool)

(assert (=> d!141527 e!742992))

(declare-fun res!865225 () Bool)

(assert (=> d!141527 (=> (not res!865225) (not e!742992))))

(assert (=> d!141527 (= res!865225 (contains!8270 lt!582688 lt!582686))))

(assert (=> d!141527 (= (addApplyDifferent!561 lt!582688 lt!582674 zeroValue!1387 lt!582686) lt!582772)))

(declare-fun b!1302616 () Bool)

(assert (=> b!1302616 (= e!742992 (not (= lt!582686 lt!582674)))))

(assert (= (and d!141527 res!865225) b!1302616))

(declare-fun m!1193495 () Bool)

(assert (=> d!141527 m!1193495))

(assert (=> d!141527 m!1193243))

(assert (=> d!141527 m!1193245))

(declare-fun m!1193497 () Bool)

(assert (=> d!141527 m!1193497))

(assert (=> d!141527 m!1193243))

(assert (=> d!141527 m!1193237))

(assert (=> b!1302515 d!141527))

(declare-fun d!141529 () Bool)

(assert (=> d!141529 (= (apply!1019 (+!4467 lt!582672 (tuple2!22593 lt!582681 minValue!1387)) lt!582676) (apply!1019 lt!582672 lt!582676))))

(declare-fun lt!582773 () Unit!43111)

(assert (=> d!141529 (= lt!582773 (choose!1916 lt!582672 lt!582681 minValue!1387 lt!582676))))

(declare-fun e!742993 () Bool)

(assert (=> d!141529 e!742993))

(declare-fun res!865226 () Bool)

(assert (=> d!141529 (=> (not res!865226) (not e!742993))))

(assert (=> d!141529 (= res!865226 (contains!8270 lt!582672 lt!582676))))

(assert (=> d!141529 (= (addApplyDifferent!561 lt!582672 lt!582681 minValue!1387 lt!582676) lt!582773)))

(declare-fun b!1302617 () Bool)

(assert (=> b!1302617 (= e!742993 (not (= lt!582676 lt!582681)))))

(assert (= (and d!141529 res!865226) b!1302617))

(declare-fun m!1193499 () Bool)

(assert (=> d!141529 m!1193499))

(assert (=> d!141529 m!1193239))

(assert (=> d!141529 m!1193241))

(declare-fun m!1193501 () Bool)

(assert (=> d!141529 m!1193501))

(assert (=> d!141529 m!1193239))

(assert (=> d!141529 m!1193251))

(assert (=> b!1302515 d!141529))

(declare-fun d!141531 () Bool)

(declare-fun e!742995 () Bool)

(assert (=> d!141531 e!742995))

(declare-fun res!865227 () Bool)

(assert (=> d!141531 (=> res!865227 e!742995)))

(declare-fun lt!582775 () Bool)

(assert (=> d!141531 (= res!865227 (not lt!582775))))

(declare-fun lt!582774 () Bool)

(assert (=> d!141531 (= lt!582775 lt!582774)))

(declare-fun lt!582777 () Unit!43111)

(declare-fun e!742994 () Unit!43111)

(assert (=> d!141531 (= lt!582777 e!742994)))

(declare-fun c!125004 () Bool)

(assert (=> d!141531 (= c!125004 lt!582774)))

(assert (=> d!141531 (= lt!582774 (containsKey!724 (toList!10140 (+!4467 lt!582677 (tuple2!22593 lt!582680 zeroValue!1387))) lt!582673))))

(assert (=> d!141531 (= (contains!8270 (+!4467 lt!582677 (tuple2!22593 lt!582680 zeroValue!1387)) lt!582673) lt!582775)))

(declare-fun b!1302618 () Bool)

(declare-fun lt!582776 () Unit!43111)

(assert (=> b!1302618 (= e!742994 lt!582776)))

(assert (=> b!1302618 (= lt!582776 (lemmaContainsKeyImpliesGetValueByKeyDefined!470 (toList!10140 (+!4467 lt!582677 (tuple2!22593 lt!582680 zeroValue!1387))) lt!582673))))

(assert (=> b!1302618 (isDefined!509 (getValueByKey!702 (toList!10140 (+!4467 lt!582677 (tuple2!22593 lt!582680 zeroValue!1387))) lt!582673))))

(declare-fun b!1302619 () Bool)

(declare-fun Unit!43124 () Unit!43111)

(assert (=> b!1302619 (= e!742994 Unit!43124)))

(declare-fun b!1302620 () Bool)

(assert (=> b!1302620 (= e!742995 (isDefined!509 (getValueByKey!702 (toList!10140 (+!4467 lt!582677 (tuple2!22593 lt!582680 zeroValue!1387))) lt!582673)))))

(assert (= (and d!141531 c!125004) b!1302618))

(assert (= (and d!141531 (not c!125004)) b!1302619))

(assert (= (and d!141531 (not res!865227)) b!1302620))

(declare-fun m!1193503 () Bool)

(assert (=> d!141531 m!1193503))

(declare-fun m!1193505 () Bool)

(assert (=> b!1302618 m!1193505))

(declare-fun m!1193507 () Bool)

(assert (=> b!1302618 m!1193507))

(assert (=> b!1302618 m!1193507))

(declare-fun m!1193509 () Bool)

(assert (=> b!1302618 m!1193509))

(assert (=> b!1302620 m!1193507))

(assert (=> b!1302620 m!1193507))

(assert (=> b!1302620 m!1193509))

(assert (=> b!1302515 d!141531))

(declare-fun d!141533 () Bool)

(assert (=> d!141533 (= (apply!1019 (+!4467 lt!582690 (tuple2!22593 lt!582692 minValue!1387)) lt!582679) (get!21151 (getValueByKey!702 (toList!10140 (+!4467 lt!582690 (tuple2!22593 lt!582692 minValue!1387))) lt!582679)))))

(declare-fun bs!37098 () Bool)

(assert (= bs!37098 d!141533))

(declare-fun m!1193511 () Bool)

(assert (=> bs!37098 m!1193511))

(assert (=> bs!37098 m!1193511))

(declare-fun m!1193513 () Bool)

(assert (=> bs!37098 m!1193513))

(assert (=> b!1302515 d!141533))

(declare-fun d!141535 () Bool)

(assert (=> d!141535 (= (apply!1019 (+!4467 lt!582690 (tuple2!22593 lt!582692 minValue!1387)) lt!582679) (apply!1019 lt!582690 lt!582679))))

(declare-fun lt!582778 () Unit!43111)

(assert (=> d!141535 (= lt!582778 (choose!1916 lt!582690 lt!582692 minValue!1387 lt!582679))))

(declare-fun e!742996 () Bool)

(assert (=> d!141535 e!742996))

(declare-fun res!865228 () Bool)

(assert (=> d!141535 (=> (not res!865228) (not e!742996))))

(assert (=> d!141535 (= res!865228 (contains!8270 lt!582690 lt!582679))))

(assert (=> d!141535 (= (addApplyDifferent!561 lt!582690 lt!582692 minValue!1387 lt!582679) lt!582778)))

(declare-fun b!1302621 () Bool)

(assert (=> b!1302621 (= e!742996 (not (= lt!582679 lt!582692)))))

(assert (= (and d!141535 res!865228) b!1302621))

(declare-fun m!1193515 () Bool)

(assert (=> d!141535 m!1193515))

(assert (=> d!141535 m!1193233))

(assert (=> d!141535 m!1193235))

(declare-fun m!1193517 () Bool)

(assert (=> d!141535 m!1193517))

(assert (=> d!141535 m!1193233))

(assert (=> d!141535 m!1193255))

(assert (=> b!1302515 d!141535))

(declare-fun d!141537 () Bool)

(assert (=> d!141537 (= (apply!1019 lt!582688 lt!582686) (get!21151 (getValueByKey!702 (toList!10140 lt!582688) lt!582686)))))

(declare-fun bs!37099 () Bool)

(assert (= bs!37099 d!141537))

(declare-fun m!1193519 () Bool)

(assert (=> bs!37099 m!1193519))

(assert (=> bs!37099 m!1193519))

(declare-fun m!1193521 () Bool)

(assert (=> bs!37099 m!1193521))

(assert (=> b!1302515 d!141537))

(declare-fun d!141539 () Bool)

(declare-fun e!742998 () Bool)

(assert (=> d!141539 e!742998))

(declare-fun res!865229 () Bool)

(assert (=> d!141539 (=> res!865229 e!742998)))

(declare-fun lt!582780 () Bool)

(assert (=> d!141539 (= res!865229 (not lt!582780))))

(declare-fun lt!582779 () Bool)

(assert (=> d!141539 (= lt!582780 lt!582779)))

(declare-fun lt!582782 () Unit!43111)

(declare-fun e!742997 () Unit!43111)

(assert (=> d!141539 (= lt!582782 e!742997)))

(declare-fun c!125005 () Bool)

(assert (=> d!141539 (= c!125005 lt!582779)))

(assert (=> d!141539 (= lt!582779 (containsKey!724 (toList!10140 lt!582622) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!141539 (= (contains!8270 lt!582622 #b0000000000000000000000000000000000000000000000000000000000000000) lt!582780)))

(declare-fun b!1302622 () Bool)

(declare-fun lt!582781 () Unit!43111)

(assert (=> b!1302622 (= e!742997 lt!582781)))

(assert (=> b!1302622 (= lt!582781 (lemmaContainsKeyImpliesGetValueByKeyDefined!470 (toList!10140 lt!582622) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1302622 (isDefined!509 (getValueByKey!702 (toList!10140 lt!582622) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1302623 () Bool)

(declare-fun Unit!43125 () Unit!43111)

(assert (=> b!1302623 (= e!742997 Unit!43125)))

(declare-fun b!1302624 () Bool)

(assert (=> b!1302624 (= e!742998 (isDefined!509 (getValueByKey!702 (toList!10140 lt!582622) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141539 c!125005) b!1302622))

(assert (= (and d!141539 (not c!125005)) b!1302623))

(assert (= (and d!141539 (not res!865229)) b!1302624))

(declare-fun m!1193523 () Bool)

(assert (=> d!141539 m!1193523))

(declare-fun m!1193525 () Bool)

(assert (=> b!1302622 m!1193525))

(declare-fun m!1193527 () Bool)

(assert (=> b!1302622 m!1193527))

(assert (=> b!1302622 m!1193527))

(declare-fun m!1193529 () Bool)

(assert (=> b!1302622 m!1193529))

(assert (=> b!1302624 m!1193527))

(assert (=> b!1302624 m!1193527))

(assert (=> b!1302624 m!1193529))

(assert (=> d!141455 d!141539))

(assert (=> d!141455 d!141441))

(declare-fun d!141541 () Bool)

(declare-fun res!865230 () Bool)

(declare-fun e!742999 () Bool)

(assert (=> d!141541 (=> res!865230 e!742999)))

(assert (=> d!141541 (= res!865230 (and ((_ is Cons!29716) (toList!10140 (getCurrentListMapNoExtraKeys!6099 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11307 (h!30925 (toList!10140 (getCurrentListMapNoExtraKeys!6099 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(assert (=> d!141541 (= (containsKey!724 (toList!10140 (getCurrentListMapNoExtraKeys!6099 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!742999)))

(declare-fun b!1302625 () Bool)

(declare-fun e!743000 () Bool)

(assert (=> b!1302625 (= e!742999 e!743000)))

(declare-fun res!865231 () Bool)

(assert (=> b!1302625 (=> (not res!865231) (not e!743000))))

(assert (=> b!1302625 (= res!865231 (and (or (not ((_ is Cons!29716) (toList!10140 (getCurrentListMapNoExtraKeys!6099 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) (bvsle (_1!11307 (h!30925 (toList!10140 (getCurrentListMapNoExtraKeys!6099 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)) ((_ is Cons!29716) (toList!10140 (getCurrentListMapNoExtraKeys!6099 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (bvslt (_1!11307 (h!30925 (toList!10140 (getCurrentListMapNoExtraKeys!6099 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(declare-fun b!1302626 () Bool)

(assert (=> b!1302626 (= e!743000 (containsKey!724 (t!43308 (toList!10140 (getCurrentListMapNoExtraKeys!6099 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(assert (= (and d!141541 (not res!865230)) b!1302625))

(assert (= (and b!1302625 res!865231) b!1302626))

(declare-fun m!1193531 () Bool)

(assert (=> b!1302626 m!1193531))

(assert (=> d!141453 d!141541))

(declare-fun b!1302627 () Bool)

(declare-fun e!743003 () Bool)

(declare-fun e!743002 () Bool)

(assert (=> b!1302627 (= e!743003 e!743002)))

(declare-fun c!125006 () Bool)

(assert (=> b!1302627 (= c!125006 (validKeyInArray!0 (select (arr!41875 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1302628 () Bool)

(declare-fun e!743001 () Bool)

(declare-fun call!64145 () Bool)

(assert (=> b!1302628 (= e!743001 call!64145)))

(declare-fun d!141543 () Bool)

(declare-fun res!865233 () Bool)

(assert (=> d!141543 (=> res!865233 e!743003)))

(assert (=> d!141543 (= res!865233 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!42425 _keys!1741)))))

(assert (=> d!141543 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175) e!743003)))

(declare-fun bm!64142 () Bool)

(assert (=> bm!64142 (= call!64145 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1302629 () Bool)

(assert (=> b!1302629 (= e!743002 e!743001)))

(declare-fun lt!582784 () (_ BitVec 64))

(assert (=> b!1302629 (= lt!582784 (select (arr!41875 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!582783 () Unit!43111)

(assert (=> b!1302629 (= lt!582783 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!582784 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1302629 (arrayContainsKey!0 _keys!1741 lt!582784 #b00000000000000000000000000000000)))

(declare-fun lt!582785 () Unit!43111)

(assert (=> b!1302629 (= lt!582785 lt!582783)))

(declare-fun res!865232 () Bool)

(assert (=> b!1302629 (= res!865232 (= (seekEntryOrOpen!0 (select (arr!41875 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1741 mask!2175) (Found!10022 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1302629 (=> (not res!865232) (not e!743001))))

(declare-fun b!1302630 () Bool)

(assert (=> b!1302630 (= e!743002 call!64145)))

(assert (= (and d!141543 (not res!865233)) b!1302627))

(assert (= (and b!1302627 c!125006) b!1302629))

(assert (= (and b!1302627 (not c!125006)) b!1302630))

(assert (= (and b!1302629 res!865232) b!1302628))

(assert (= (or b!1302628 b!1302630) bm!64142))

(declare-fun m!1193533 () Bool)

(assert (=> b!1302627 m!1193533))

(assert (=> b!1302627 m!1193533))

(declare-fun m!1193535 () Bool)

(assert (=> b!1302627 m!1193535))

(declare-fun m!1193537 () Bool)

(assert (=> bm!64142 m!1193537))

(assert (=> b!1302629 m!1193533))

(declare-fun m!1193539 () Bool)

(assert (=> b!1302629 m!1193539))

(declare-fun m!1193541 () Bool)

(assert (=> b!1302629 m!1193541))

(assert (=> b!1302629 m!1193533))

(declare-fun m!1193543 () Bool)

(assert (=> b!1302629 m!1193543))

(assert (=> bm!64116 d!141543))

(assert (=> b!1302444 d!141451))

(declare-fun d!141545 () Bool)

(assert (=> d!141545 (= (apply!1019 lt!582622 (select (arr!41875 _keys!1741) from!2144)) (get!21151 (getValueByKey!702 (toList!10140 lt!582622) (select (arr!41875 _keys!1741) from!2144))))))

(declare-fun bs!37100 () Bool)

(assert (= bs!37100 d!141545))

(assert (=> bs!37100 m!1193129))

(declare-fun m!1193545 () Bool)

(assert (=> bs!37100 m!1193545))

(assert (=> bs!37100 m!1193545))

(declare-fun m!1193547 () Bool)

(assert (=> bs!37100 m!1193547))

(assert (=> b!1302443 d!141545))

(assert (=> b!1302443 d!141469))

(assert (=> b!1302409 d!141473))

(declare-fun d!141547 () Bool)

(declare-fun lt!582788 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!645 (List!29721) (InoxSet (_ BitVec 64)))

(assert (=> d!141547 (= lt!582788 (select (content!645 Nil!29718) (select (arr!41875 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun e!743009 () Bool)

(assert (=> d!141547 (= lt!582788 e!743009)))

(declare-fun res!865238 () Bool)

(assert (=> d!141547 (=> (not res!865238) (not e!743009))))

(assert (=> d!141547 (= res!865238 ((_ is Cons!29717) Nil!29718))))

(assert (=> d!141547 (= (contains!8272 Nil!29718 (select (arr!41875 _keys!1741) #b00000000000000000000000000000000)) lt!582788)))

(declare-fun b!1302635 () Bool)

(declare-fun e!743008 () Bool)

(assert (=> b!1302635 (= e!743009 e!743008)))

(declare-fun res!865239 () Bool)

(assert (=> b!1302635 (=> res!865239 e!743008)))

(assert (=> b!1302635 (= res!865239 (= (h!30926 Nil!29718) (select (arr!41875 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1302636 () Bool)

(assert (=> b!1302636 (= e!743008 (contains!8272 (t!43309 Nil!29718) (select (arr!41875 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!141547 res!865238) b!1302635))

(assert (= (and b!1302635 (not res!865239)) b!1302636))

(declare-fun m!1193549 () Bool)

(assert (=> d!141547 m!1193549))

(assert (=> d!141547 m!1193175))

(declare-fun m!1193551 () Bool)

(assert (=> d!141547 m!1193551))

(assert (=> b!1302636 m!1193175))

(declare-fun m!1193553 () Bool)

(assert (=> b!1302636 m!1193553))

(assert (=> b!1302397 d!141547))

(assert (=> bm!64119 d!141485))

(declare-fun d!141549 () Bool)

(assert (=> d!141549 (= (isDefined!509 (getValueByKey!702 (toList!10140 (getCurrentListMap!5165 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)) (not (isEmpty!1058 (getValueByKey!702 (toList!10140 (getCurrentListMap!5165 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))))

(declare-fun bs!37101 () Bool)

(assert (= bs!37101 d!141549))

(assert (=> bs!37101 m!1193229))

(declare-fun m!1193555 () Bool)

(assert (=> bs!37101 m!1193555))

(assert (=> b!1302456 d!141549))

(declare-fun e!743010 () Option!754)

(declare-fun b!1302637 () Bool)

(assert (=> b!1302637 (= e!743010 (Some!753 (_2!11307 (h!30925 (toList!10140 (getCurrentListMap!5165 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))))

(declare-fun b!1302640 () Bool)

(declare-fun e!743011 () Option!754)

(assert (=> b!1302640 (= e!743011 None!752)))

(declare-fun b!1302639 () Bool)

(assert (=> b!1302639 (= e!743011 (getValueByKey!702 (t!43308 (toList!10140 (getCurrentListMap!5165 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(declare-fun d!141551 () Bool)

(declare-fun c!125007 () Bool)

(assert (=> d!141551 (= c!125007 (and ((_ is Cons!29716) (toList!10140 (getCurrentListMap!5165 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11307 (h!30925 (toList!10140 (getCurrentListMap!5165 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(assert (=> d!141551 (= (getValueByKey!702 (toList!10140 (getCurrentListMap!5165 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!743010)))

(declare-fun b!1302638 () Bool)

(assert (=> b!1302638 (= e!743010 e!743011)))

(declare-fun c!125008 () Bool)

(assert (=> b!1302638 (= c!125008 (and ((_ is Cons!29716) (toList!10140 (getCurrentListMap!5165 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (not (= (_1!11307 (h!30925 (toList!10140 (getCurrentListMap!5165 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205))))))

(assert (= (and d!141551 c!125007) b!1302637))

(assert (= (and d!141551 (not c!125007)) b!1302638))

(assert (= (and b!1302638 c!125008) b!1302639))

(assert (= (and b!1302638 (not c!125008)) b!1302640))

(declare-fun m!1193557 () Bool)

(assert (=> b!1302639 m!1193557))

(assert (=> b!1302456 d!141551))

(declare-fun d!141553 () Bool)

(assert (=> d!141553 (isDefined!509 (getValueByKey!702 (toList!10140 (ListLongMap!20250 Nil!29717)) k0!1205))))

(declare-fun lt!582789 () Unit!43111)

(assert (=> d!141553 (= lt!582789 (choose!1914 (toList!10140 (ListLongMap!20250 Nil!29717)) k0!1205))))

(declare-fun e!743012 () Bool)

(assert (=> d!141553 e!743012))

(declare-fun res!865240 () Bool)

(assert (=> d!141553 (=> (not res!865240) (not e!743012))))

(assert (=> d!141553 (= res!865240 (isStrictlySorted!871 (toList!10140 (ListLongMap!20250 Nil!29717))))))

(assert (=> d!141553 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!470 (toList!10140 (ListLongMap!20250 Nil!29717)) k0!1205) lt!582789)))

(declare-fun b!1302641 () Bool)

(assert (=> b!1302641 (= e!743012 (containsKey!724 (toList!10140 (ListLongMap!20250 Nil!29717)) k0!1205))))

(assert (= (and d!141553 res!865240) b!1302641))

(assert (=> d!141553 m!1193169))

(assert (=> d!141553 m!1193169))

(assert (=> d!141553 m!1193171))

(declare-fun m!1193559 () Bool)

(assert (=> d!141553 m!1193559))

(declare-fun m!1193561 () Bool)

(assert (=> d!141553 m!1193561))

(assert (=> b!1302641 m!1193165))

(assert (=> b!1302383 d!141553))

(assert (=> b!1302383 d!141481))

(assert (=> b!1302383 d!141483))

(declare-fun b!1302642 () Bool)

(declare-fun e!743016 () Bool)

(declare-fun call!64146 () Bool)

(assert (=> b!1302642 (= e!743016 call!64146)))

(declare-fun d!141555 () Bool)

(declare-fun res!865242 () Bool)

(declare-fun e!743013 () Bool)

(assert (=> d!141555 (=> res!865242 e!743013)))

(assert (=> d!141555 (= res!865242 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!42425 _keys!1741)))))

(assert (=> d!141555 (= (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124948 (Cons!29717 (select (arr!41875 _keys!1741) #b00000000000000000000000000000000) Nil!29718) Nil!29718)) e!743013)))

(declare-fun bm!64143 () Bool)

(declare-fun c!125009 () Bool)

(assert (=> bm!64143 (= call!64146 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!125009 (Cons!29717 (select (arr!41875 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!124948 (Cons!29717 (select (arr!41875 _keys!1741) #b00000000000000000000000000000000) Nil!29718) Nil!29718)) (ite c!124948 (Cons!29717 (select (arr!41875 _keys!1741) #b00000000000000000000000000000000) Nil!29718) Nil!29718))))))

(declare-fun b!1302643 () Bool)

(declare-fun e!743014 () Bool)

(assert (=> b!1302643 (= e!743014 (contains!8272 (ite c!124948 (Cons!29717 (select (arr!41875 _keys!1741) #b00000000000000000000000000000000) Nil!29718) Nil!29718) (select (arr!41875 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1302644 () Bool)

(assert (=> b!1302644 (= e!743016 call!64146)))

(declare-fun b!1302645 () Bool)

(declare-fun e!743015 () Bool)

(assert (=> b!1302645 (= e!743015 e!743016)))

(assert (=> b!1302645 (= c!125009 (validKeyInArray!0 (select (arr!41875 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1302646 () Bool)

(assert (=> b!1302646 (= e!743013 e!743015)))

(declare-fun res!865243 () Bool)

(assert (=> b!1302646 (=> (not res!865243) (not e!743015))))

(assert (=> b!1302646 (= res!865243 (not e!743014))))

(declare-fun res!865241 () Bool)

(assert (=> b!1302646 (=> (not res!865241) (not e!743014))))

(assert (=> b!1302646 (= res!865241 (validKeyInArray!0 (select (arr!41875 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!141555 (not res!865242)) b!1302646))

(assert (= (and b!1302646 res!865241) b!1302643))

(assert (= (and b!1302646 res!865243) b!1302645))

(assert (= (and b!1302645 c!125009) b!1302644))

(assert (= (and b!1302645 (not c!125009)) b!1302642))

(assert (= (or b!1302644 b!1302642) bm!64143))

(assert (=> bm!64143 m!1193533))

(declare-fun m!1193563 () Bool)

(assert (=> bm!64143 m!1193563))

(assert (=> b!1302643 m!1193533))

(assert (=> b!1302643 m!1193533))

(declare-fun m!1193565 () Bool)

(assert (=> b!1302643 m!1193565))

(assert (=> b!1302645 m!1193533))

(assert (=> b!1302645 m!1193533))

(assert (=> b!1302645 m!1193535))

(assert (=> b!1302646 m!1193533))

(assert (=> b!1302646 m!1193533))

(assert (=> b!1302646 m!1193535))

(assert (=> bm!64113 d!141555))

(declare-fun d!141557 () Bool)

(declare-fun e!743018 () Bool)

(assert (=> d!141557 e!743018))

(declare-fun res!865244 () Bool)

(assert (=> d!141557 (=> res!865244 e!743018)))

(declare-fun lt!582791 () Bool)

(assert (=> d!141557 (= res!865244 (not lt!582791))))

(declare-fun lt!582790 () Bool)

(assert (=> d!141557 (= lt!582791 lt!582790)))

(declare-fun lt!582793 () Unit!43111)

(declare-fun e!743017 () Unit!43111)

(assert (=> d!141557 (= lt!582793 e!743017)))

(declare-fun c!125010 () Bool)

(assert (=> d!141557 (= c!125010 lt!582790)))

(assert (=> d!141557 (= lt!582790 (containsKey!724 (toList!10140 lt!582622) (select (arr!41875 _keys!1741) from!2144)))))

(assert (=> d!141557 (= (contains!8270 lt!582622 (select (arr!41875 _keys!1741) from!2144)) lt!582791)))

(declare-fun b!1302647 () Bool)

(declare-fun lt!582792 () Unit!43111)

(assert (=> b!1302647 (= e!743017 lt!582792)))

(assert (=> b!1302647 (= lt!582792 (lemmaContainsKeyImpliesGetValueByKeyDefined!470 (toList!10140 lt!582622) (select (arr!41875 _keys!1741) from!2144)))))

(assert (=> b!1302647 (isDefined!509 (getValueByKey!702 (toList!10140 lt!582622) (select (arr!41875 _keys!1741) from!2144)))))

(declare-fun b!1302648 () Bool)

(declare-fun Unit!43126 () Unit!43111)

(assert (=> b!1302648 (= e!743017 Unit!43126)))

(declare-fun b!1302649 () Bool)

(assert (=> b!1302649 (= e!743018 (isDefined!509 (getValueByKey!702 (toList!10140 lt!582622) (select (arr!41875 _keys!1741) from!2144))))))

(assert (= (and d!141557 c!125010) b!1302647))

(assert (= (and d!141557 (not c!125010)) b!1302648))

(assert (= (and d!141557 (not res!865244)) b!1302649))

(assert (=> d!141557 m!1193129))

(declare-fun m!1193567 () Bool)

(assert (=> d!141557 m!1193567))

(assert (=> b!1302647 m!1193129))

(declare-fun m!1193569 () Bool)

(assert (=> b!1302647 m!1193569))

(assert (=> b!1302647 m!1193129))

(assert (=> b!1302647 m!1193545))

(assert (=> b!1302647 m!1193545))

(declare-fun m!1193571 () Bool)

(assert (=> b!1302647 m!1193571))

(assert (=> b!1302649 m!1193129))

(assert (=> b!1302649 m!1193545))

(assert (=> b!1302649 m!1193545))

(assert (=> b!1302649 m!1193571))

(assert (=> b!1302446 d!141557))

(declare-fun d!141559 () Bool)

(assert (=> d!141559 (isDefined!509 (getValueByKey!702 (toList!10140 (getCurrentListMap!5165 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun lt!582794 () Unit!43111)

(assert (=> d!141559 (= lt!582794 (choose!1914 (toList!10140 (getCurrentListMap!5165 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun e!743019 () Bool)

(assert (=> d!141559 e!743019))

(declare-fun res!865245 () Bool)

(assert (=> d!141559 (=> (not res!865245) (not e!743019))))

(assert (=> d!141559 (= res!865245 (isStrictlySorted!871 (toList!10140 (getCurrentListMap!5165 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))

(assert (=> d!141559 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!470 (toList!10140 (getCurrentListMap!5165 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) lt!582794)))

(declare-fun b!1302650 () Bool)

(assert (=> b!1302650 (= e!743019 (containsKey!724 (toList!10140 (getCurrentListMap!5165 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (= (and d!141559 res!865245) b!1302650))

(assert (=> d!141559 m!1193229))

(assert (=> d!141559 m!1193229))

(assert (=> d!141559 m!1193231))

(declare-fun m!1193573 () Bool)

(assert (=> d!141559 m!1193573))

(declare-fun m!1193575 () Bool)

(assert (=> d!141559 m!1193575))

(assert (=> b!1302650 m!1193225))

(assert (=> b!1302454 d!141559))

(assert (=> b!1302454 d!141549))

(assert (=> b!1302454 d!141551))

(declare-fun d!141561 () Bool)

(assert (=> d!141561 (= (apply!1019 lt!582693 (select (arr!41875 _keys!1741) from!2144)) (get!21151 (getValueByKey!702 (toList!10140 lt!582693) (select (arr!41875 _keys!1741) from!2144))))))

(declare-fun bs!37102 () Bool)

(assert (= bs!37102 d!141561))

(assert (=> bs!37102 m!1193129))

(assert (=> bs!37102 m!1193407))

(assert (=> bs!37102 m!1193407))

(declare-fun m!1193577 () Bool)

(assert (=> bs!37102 m!1193577))

(assert (=> b!1302504 d!141561))

(assert (=> b!1302504 d!141469))

(declare-fun d!141563 () Bool)

(assert (=> d!141563 (arrayContainsKey!0 _keys!1741 lt!582597 #b00000000000000000000000000000000)))

(declare-fun lt!582797 () Unit!43111)

(declare-fun choose!13 (array!86762 (_ BitVec 64) (_ BitVec 32)) Unit!43111)

(assert (=> d!141563 (= lt!582797 (choose!13 _keys!1741 lt!582597 #b00000000000000000000000000000000))))

(assert (=> d!141563 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!141563 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!582597 #b00000000000000000000000000000000) lt!582797)))

(declare-fun bs!37103 () Bool)

(assert (= bs!37103 d!141563))

(assert (=> bs!37103 m!1193187))

(declare-fun m!1193579 () Bool)

(assert (=> bs!37103 m!1193579))

(assert (=> b!1302411 d!141563))

(declare-fun d!141565 () Bool)

(declare-fun res!865250 () Bool)

(declare-fun e!743024 () Bool)

(assert (=> d!141565 (=> res!865250 e!743024)))

(assert (=> d!141565 (= res!865250 (= (select (arr!41875 _keys!1741) #b00000000000000000000000000000000) lt!582597))))

(assert (=> d!141565 (= (arrayContainsKey!0 _keys!1741 lt!582597 #b00000000000000000000000000000000) e!743024)))

(declare-fun b!1302655 () Bool)

(declare-fun e!743025 () Bool)

(assert (=> b!1302655 (= e!743024 e!743025)))

(declare-fun res!865251 () Bool)

(assert (=> b!1302655 (=> (not res!865251) (not e!743025))))

(assert (=> b!1302655 (= res!865251 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!42425 _keys!1741)))))

(declare-fun b!1302656 () Bool)

(assert (=> b!1302656 (= e!743025 (arrayContainsKey!0 _keys!1741 lt!582597 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!141565 (not res!865250)) b!1302655))

(assert (= (and b!1302655 res!865251) b!1302656))

(assert (=> d!141565 m!1193175))

(declare-fun m!1193581 () Bool)

(assert (=> b!1302656 m!1193581))

(assert (=> b!1302411 d!141565))

(declare-fun b!1302670 () Bool)

(declare-fun e!743034 () SeekEntryResult!10022)

(declare-fun e!743032 () SeekEntryResult!10022)

(assert (=> b!1302670 (= e!743034 e!743032)))

(declare-fun lt!582806 () (_ BitVec 64))

(declare-fun lt!582805 () SeekEntryResult!10022)

(assert (=> b!1302670 (= lt!582806 (select (arr!41875 _keys!1741) (index!42461 lt!582805)))))

(declare-fun c!125018 () Bool)

(assert (=> b!1302670 (= c!125018 (= lt!582806 (select (arr!41875 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1302671 () Bool)

(assert (=> b!1302671 (= e!743032 (Found!10022 (index!42461 lt!582805)))))

(declare-fun b!1302672 () Bool)

(assert (=> b!1302672 (= e!743034 Undefined!10022)))

(declare-fun b!1302673 () Bool)

(declare-fun e!743033 () SeekEntryResult!10022)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!86762 (_ BitVec 32)) SeekEntryResult!10022)

(assert (=> b!1302673 (= e!743033 (seekKeyOrZeroReturnVacant!0 (x!115676 lt!582805) (index!42461 lt!582805) (index!42461 lt!582805) (select (arr!41875 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175))))

(declare-fun b!1302674 () Bool)

(assert (=> b!1302674 (= e!743033 (MissingZero!10022 (index!42461 lt!582805)))))

(declare-fun d!141567 () Bool)

(declare-fun lt!582804 () SeekEntryResult!10022)

(assert (=> d!141567 (and (or ((_ is Undefined!10022) lt!582804) (not ((_ is Found!10022) lt!582804)) (and (bvsge (index!42460 lt!582804) #b00000000000000000000000000000000) (bvslt (index!42460 lt!582804) (size!42425 _keys!1741)))) (or ((_ is Undefined!10022) lt!582804) ((_ is Found!10022) lt!582804) (not ((_ is MissingZero!10022) lt!582804)) (and (bvsge (index!42459 lt!582804) #b00000000000000000000000000000000) (bvslt (index!42459 lt!582804) (size!42425 _keys!1741)))) (or ((_ is Undefined!10022) lt!582804) ((_ is Found!10022) lt!582804) ((_ is MissingZero!10022) lt!582804) (not ((_ is MissingVacant!10022) lt!582804)) (and (bvsge (index!42462 lt!582804) #b00000000000000000000000000000000) (bvslt (index!42462 lt!582804) (size!42425 _keys!1741)))) (or ((_ is Undefined!10022) lt!582804) (ite ((_ is Found!10022) lt!582804) (= (select (arr!41875 _keys!1741) (index!42460 lt!582804)) (select (arr!41875 _keys!1741) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!10022) lt!582804) (= (select (arr!41875 _keys!1741) (index!42459 lt!582804)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10022) lt!582804) (= (select (arr!41875 _keys!1741) (index!42462 lt!582804)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!141567 (= lt!582804 e!743034)))

(declare-fun c!125019 () Bool)

(assert (=> d!141567 (= c!125019 (and ((_ is Intermediate!10022) lt!582805) (undefined!10834 lt!582805)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!86762 (_ BitVec 32)) SeekEntryResult!10022)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!141567 (= lt!582805 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!41875 _keys!1741) #b00000000000000000000000000000000) mask!2175) (select (arr!41875 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175))))

(assert (=> d!141567 (validMask!0 mask!2175)))

(assert (=> d!141567 (= (seekEntryOrOpen!0 (select (arr!41875 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) lt!582804)))

(declare-fun b!1302669 () Bool)

(declare-fun c!125017 () Bool)

(assert (=> b!1302669 (= c!125017 (= lt!582806 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1302669 (= e!743032 e!743033)))

(assert (= (and d!141567 c!125019) b!1302672))

(assert (= (and d!141567 (not c!125019)) b!1302670))

(assert (= (and b!1302670 c!125018) b!1302671))

(assert (= (and b!1302670 (not c!125018)) b!1302669))

(assert (= (and b!1302669 c!125017) b!1302674))

(assert (= (and b!1302669 (not c!125017)) b!1302673))

(declare-fun m!1193583 () Bool)

(assert (=> b!1302670 m!1193583))

(assert (=> b!1302673 m!1193175))

(declare-fun m!1193585 () Bool)

(assert (=> b!1302673 m!1193585))

(assert (=> d!141567 m!1193175))

(declare-fun m!1193587 () Bool)

(assert (=> d!141567 m!1193587))

(declare-fun m!1193589 () Bool)

(assert (=> d!141567 m!1193589))

(declare-fun m!1193591 () Bool)

(assert (=> d!141567 m!1193591))

(assert (=> d!141567 m!1193115))

(assert (=> d!141567 m!1193587))

(assert (=> d!141567 m!1193175))

(declare-fun m!1193593 () Bool)

(assert (=> d!141567 m!1193593))

(declare-fun m!1193595 () Bool)

(assert (=> d!141567 m!1193595))

(assert (=> b!1302411 d!141567))

(declare-fun mapIsEmpty!53902 () Bool)

(declare-fun mapRes!53902 () Bool)

(assert (=> mapIsEmpty!53902 mapRes!53902))

(declare-fun b!1302675 () Bool)

(declare-fun e!743035 () Bool)

(assert (=> b!1302675 (= e!743035 tp_is_empty!34875)))

(declare-fun b!1302676 () Bool)

(declare-fun e!743036 () Bool)

(assert (=> b!1302676 (= e!743036 tp_is_empty!34875)))

(declare-fun mapNonEmpty!53902 () Bool)

(declare-fun tp!102856 () Bool)

(assert (=> mapNonEmpty!53902 (= mapRes!53902 (and tp!102856 e!743035))))

(declare-fun mapRest!53902 () (Array (_ BitVec 32) ValueCell!16539))

(declare-fun mapValue!53902 () ValueCell!16539)

(declare-fun mapKey!53902 () (_ BitVec 32))

(assert (=> mapNonEmpty!53902 (= mapRest!53901 (store mapRest!53902 mapKey!53902 mapValue!53902))))

(declare-fun condMapEmpty!53902 () Bool)

(declare-fun mapDefault!53902 () ValueCell!16539)

(assert (=> mapNonEmpty!53901 (= condMapEmpty!53902 (= mapRest!53901 ((as const (Array (_ BitVec 32) ValueCell!16539)) mapDefault!53902)))))

(assert (=> mapNonEmpty!53901 (= tp!102855 (and e!743036 mapRes!53902))))

(assert (= (and mapNonEmpty!53901 condMapEmpty!53902) mapIsEmpty!53902))

(assert (= (and mapNonEmpty!53901 (not condMapEmpty!53902)) mapNonEmpty!53902))

(assert (= (and mapNonEmpty!53902 ((_ is ValueCellFull!16539) mapValue!53902)) b!1302675))

(assert (= (and mapNonEmpty!53901 ((_ is ValueCellFull!16539) mapDefault!53902)) b!1302676))

(declare-fun m!1193597 () Bool)

(assert (=> mapNonEmpty!53902 m!1193597))

(declare-fun b_lambda!23247 () Bool)

(assert (= b_lambda!23243 (or (and start!109936 b_free!29235) b_lambda!23247)))

(declare-fun b_lambda!23249 () Bool)

(assert (= b_lambda!23245 (or (and start!109936 b_free!29235) b_lambda!23249)))

(check-sat (not d!141521) (not b!1302534) (not b!1302579) (not b!1302568) (not b!1302571) tp_is_empty!34875 (not d!141559) (not b!1302536) (not d!141561) (not d!141535) (not b!1302641) (not b!1302605) (not b!1302549) (not b!1302584) (not b!1302576) (not b!1302553) (not b!1302618) (not d!141533) (not b!1302573) (not d!141475) (not b!1302645) (not b!1302624) (not b!1302639) (not b!1302607) (not bm!64141) (not b!1302650) (not bm!64143) (not b!1302606) (not b!1302603) (not b!1302604) (not b!1302580) (not d!141487) (not b!1302622) (not b!1302574) (not b!1302626) (not b!1302542) (not b!1302578) (not b!1302629) (not b!1302627) (not b!1302646) (not d!141509) b_and!47389 (not d!141477) (not d!141567) (not b!1302608) (not b!1302532) (not b_lambda!23237) (not b!1302593) (not d!141493) (not b_lambda!23239) (not d!141557) (not d!141511) (not b!1302600) (not b!1302620) (not b!1302547) (not b!1302594) (not d!141471) (not d!141545) (not d!141505) (not d!141501) (not mapNonEmpty!53902) (not b!1302595) (not d!141547) (not b!1302601) (not d!141539) (not b_lambda!23241) (not d!141503) (not d!141467) (not b!1302656) (not d!141563) (not b!1302550) (not b!1302649) (not b_next!29235) (not d!141549) (not d!141523) (not d!141513) (not d!141489) (not b!1302636) (not b!1302598) (not d!141481) (not d!141461) (not d!141519) (not d!141463) (not b!1302587) (not b!1302533) (not b!1302647) (not d!141465) (not b_lambda!23247) (not d!141537) (not b!1302582) (not b!1302610) (not d!141531) (not b!1302611) (not b!1302581) (not b!1302609) (not d!141507) (not b_lambda!23249) (not d!141525) (not d!141517) (not b!1302548) (not d!141485) (not b!1302643) (not d!141499) (not d!141529) (not b!1302541) (not d!141515) (not b!1302596) (not b!1302673) (not b!1302564) (not b!1302585) (not d!141553) (not d!141527) (not d!141495) (not bm!64142))
(check-sat b_and!47389 (not b_next!29235))

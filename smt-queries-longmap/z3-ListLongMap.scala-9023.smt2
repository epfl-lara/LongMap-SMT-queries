; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108900 () Bool)

(assert start!108900)

(declare-fun b_free!28413 () Bool)

(declare-fun b_next!28413 () Bool)

(assert (=> start!108900 (= b_free!28413 (not b_next!28413))))

(declare-fun tp!100354 () Bool)

(declare-fun b_and!46487 () Bool)

(assert (=> start!108900 (= tp!100354 b_and!46487)))

(declare-fun b!1286415 () Bool)

(declare-fun res!854520 () Bool)

(declare-fun e!734747 () Bool)

(assert (=> b!1286415 (=> (not res!854520) (not e!734747))))

(declare-datatypes ((array!85154 0))(
  ( (array!85155 (arr!41079 (Array (_ BitVec 32) (_ BitVec 64))) (size!41629 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85154)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85154 (_ BitVec 32)) Bool)

(assert (=> b!1286415 (= res!854520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1286416 () Bool)

(declare-fun e!734746 () Bool)

(declare-fun tp_is_empty!34053 () Bool)

(assert (=> b!1286416 (= e!734746 tp_is_empty!34053)))

(declare-fun b!1286417 () Bool)

(declare-datatypes ((Unit!42526 0))(
  ( (Unit!42527) )
))
(declare-fun e!734744 () Unit!42526)

(declare-fun lt!577257 () Unit!42526)

(assert (=> b!1286417 (= e!734744 lt!577257)))

(declare-datatypes ((V!50507 0))(
  ( (V!50508 (val!17101 Int)) )
))
(declare-datatypes ((tuple2!21928 0))(
  ( (tuple2!21929 (_1!10975 (_ BitVec 64)) (_2!10975 V!50507)) )
))
(declare-datatypes ((List!29113 0))(
  ( (Nil!29110) (Cons!29109 (h!30318 tuple2!21928) (t!42667 List!29113)) )
))
(declare-datatypes ((ListLongMap!19585 0))(
  ( (ListLongMap!19586 (toList!9808 List!29113)) )
))
(declare-fun lt!577253 () ListLongMap!19585)

(declare-fun call!62920 () ListLongMap!19585)

(assert (=> b!1286417 (= lt!577253 call!62920)))

(declare-fun call!62918 () Unit!42526)

(assert (=> b!1286417 (= lt!577257 call!62918)))

(declare-fun call!62916 () Bool)

(assert (=> b!1286417 call!62916))

(declare-fun minValue!1387 () V!50507)

(declare-fun zeroValue!1387 () V!50507)

(declare-fun c!124174 () Bool)

(declare-fun c!124172 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun bm!62913 () Bool)

(declare-fun lt!577255 () ListLongMap!19585)

(declare-fun call!62921 () Unit!42526)

(declare-fun lt!577251 () ListLongMap!19585)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!30 ((_ BitVec 64) (_ BitVec 64) V!50507 ListLongMap!19585) Unit!42526)

(assert (=> bm!62913 (= call!62921 (lemmaInListMapAfterAddingDiffThenInBefore!30 k0!1205 (ite (or c!124174 c!124172) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!124174 c!124172) zeroValue!1387 minValue!1387) (ite c!124174 lt!577255 (ite c!124172 lt!577251 lt!577253))))))

(declare-fun b!1286418 () Bool)

(declare-fun res!854519 () Bool)

(assert (=> b!1286418 (=> (not res!854519) (not e!734747))))

(declare-datatypes ((ValueCell!16128 0))(
  ( (ValueCellFull!16128 (v!19703 V!50507)) (EmptyCell!16128) )
))
(declare-datatypes ((array!85156 0))(
  ( (array!85157 (arr!41080 (Array (_ BitVec 32) ValueCell!16128)) (size!41630 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85156)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1286418 (= res!854519 (and (= (size!41630 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41629 _keys!1741) (size!41630 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun bm!62914 () Bool)

(assert (=> bm!62914 (= call!62918 call!62921)))

(declare-fun b!1286419 () Bool)

(declare-fun res!854526 () Bool)

(assert (=> b!1286419 (=> (not res!854526) (not e!734747))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun contains!7924 (ListLongMap!19585 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4885 (array!85154 array!85156 (_ BitVec 32) (_ BitVec 32) V!50507 V!50507 (_ BitVec 32) Int) ListLongMap!19585)

(assert (=> b!1286419 (= res!854526 (contains!7924 (getCurrentListMap!4885 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!854518 () Bool)

(assert (=> start!108900 (=> (not res!854518) (not e!734747))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108900 (= res!854518 (validMask!0 mask!2175))))

(assert (=> start!108900 e!734747))

(assert (=> start!108900 tp_is_empty!34053))

(assert (=> start!108900 true))

(declare-fun e!734742 () Bool)

(declare-fun array_inv!31149 (array!85156) Bool)

(assert (=> start!108900 (and (array_inv!31149 _values!1445) e!734742)))

(declare-fun array_inv!31150 (array!85154) Bool)

(assert (=> start!108900 (array_inv!31150 _keys!1741)))

(assert (=> start!108900 tp!100354))

(declare-fun b!1286420 () Bool)

(declare-fun mapRes!52637 () Bool)

(assert (=> b!1286420 (= e!734742 (and e!734746 mapRes!52637))))

(declare-fun condMapEmpty!52637 () Bool)

(declare-fun mapDefault!52637 () ValueCell!16128)

(assert (=> b!1286420 (= condMapEmpty!52637 (= (arr!41080 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16128)) mapDefault!52637)))))

(declare-fun bm!62915 () Bool)

(declare-fun call!62919 () ListLongMap!19585)

(declare-fun getCurrentListMapNoExtraKeys!5944 (array!85154 array!85156 (_ BitVec 32) (_ BitVec 32) V!50507 V!50507 (_ BitVec 32) Int) ListLongMap!19585)

(assert (=> bm!62915 (= call!62919 (getCurrentListMapNoExtraKeys!5944 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1286421 () Bool)

(declare-fun c!124173 () Bool)

(declare-fun lt!577252 () Bool)

(assert (=> b!1286421 (= c!124173 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!577252))))

(declare-fun e!734741 () Unit!42526)

(assert (=> b!1286421 (= e!734741 e!734744)))

(declare-fun b!1286422 () Bool)

(declare-fun e!734739 () Unit!42526)

(declare-fun lt!577249 () Unit!42526)

(assert (=> b!1286422 (= e!734739 lt!577249)))

(assert (=> b!1286422 (= lt!577255 call!62919)))

(declare-fun lt!577250 () ListLongMap!19585)

(declare-fun +!4314 (ListLongMap!19585 tuple2!21928) ListLongMap!19585)

(assert (=> b!1286422 (= lt!577250 (+!4314 lt!577255 (tuple2!21929 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!577258 () Unit!42526)

(assert (=> b!1286422 (= lt!577258 (lemmaInListMapAfterAddingDiffThenInBefore!30 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!577250))))

(declare-fun call!62917 () Bool)

(assert (=> b!1286422 call!62917))

(assert (=> b!1286422 (= lt!577249 call!62921)))

(assert (=> b!1286422 (contains!7924 lt!577255 k0!1205)))

(declare-fun b!1286423 () Bool)

(assert (=> b!1286423 (= e!734739 e!734741)))

(assert (=> b!1286423 (= c!124172 (and (not lt!577252) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1286424 () Bool)

(declare-fun res!854523 () Bool)

(assert (=> b!1286424 (=> (not res!854523) (not e!734747))))

(assert (=> b!1286424 (= res!854523 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41629 _keys!1741))))))

(declare-fun b!1286425 () Bool)

(declare-fun res!854522 () Bool)

(assert (=> b!1286425 (=> (not res!854522) (not e!734747))))

(assert (=> b!1286425 (= res!854522 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41629 _keys!1741))))))

(declare-fun b!1286426 () Bool)

(declare-fun res!854525 () Bool)

(assert (=> b!1286426 (=> (not res!854525) (not e!734747))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1286426 (= res!854525 (validKeyInArray!0 (select (arr!41079 _keys!1741) from!2144)))))

(declare-fun b!1286427 () Bool)

(declare-fun res!854524 () Bool)

(assert (=> b!1286427 (=> (not res!854524) (not e!734747))))

(declare-datatypes ((List!29114 0))(
  ( (Nil!29111) (Cons!29110 (h!30319 (_ BitVec 64)) (t!42668 List!29114)) )
))
(declare-fun arrayNoDuplicates!0 (array!85154 (_ BitVec 32) List!29114) Bool)

(assert (=> b!1286427 (= res!854524 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29111))))

(declare-fun b!1286428 () Bool)

(assert (=> b!1286428 call!62916))

(declare-fun lt!577256 () Unit!42526)

(assert (=> b!1286428 (= lt!577256 call!62918)))

(assert (=> b!1286428 (= lt!577251 call!62920)))

(assert (=> b!1286428 (= e!734741 lt!577256)))

(declare-fun mapIsEmpty!52637 () Bool)

(assert (=> mapIsEmpty!52637 mapRes!52637))

(declare-fun b!1286429 () Bool)

(declare-fun e!734743 () Bool)

(assert (=> b!1286429 (= e!734743 true)))

(declare-fun lt!577247 () V!50507)

(assert (=> b!1286429 (not (contains!7924 (+!4314 (ListLongMap!19586 Nil!29110) (tuple2!21929 (select (arr!41079 _keys!1741) from!2144) lt!577247)) k0!1205))))

(declare-fun lt!577248 () Unit!42526)

(declare-fun addStillNotContains!337 (ListLongMap!19585 (_ BitVec 64) V!50507 (_ BitVec 64)) Unit!42526)

(assert (=> b!1286429 (= lt!577248 (addStillNotContains!337 (ListLongMap!19586 Nil!29110) (select (arr!41079 _keys!1741) from!2144) lt!577247 k0!1205))))

(declare-fun get!20856 (ValueCell!16128 V!50507) V!50507)

(declare-fun dynLambda!3411 (Int (_ BitVec 64)) V!50507)

(assert (=> b!1286429 (= lt!577247 (get!20856 (select (arr!41080 _values!1445) from!2144) (dynLambda!3411 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!62916 () Bool)

(assert (=> bm!62916 (= call!62920 call!62919)))

(declare-fun mapNonEmpty!52637 () Bool)

(declare-fun tp!100355 () Bool)

(declare-fun e!734745 () Bool)

(assert (=> mapNonEmpty!52637 (= mapRes!52637 (and tp!100355 e!734745))))

(declare-fun mapValue!52637 () ValueCell!16128)

(declare-fun mapRest!52637 () (Array (_ BitVec 32) ValueCell!16128))

(declare-fun mapKey!52637 () (_ BitVec 32))

(assert (=> mapNonEmpty!52637 (= (arr!41080 _values!1445) (store mapRest!52637 mapKey!52637 mapValue!52637))))

(declare-fun bm!62917 () Bool)

(assert (=> bm!62917 (= call!62917 (contains!7924 (ite c!124174 lt!577250 (ite c!124172 lt!577251 lt!577253)) k0!1205))))

(declare-fun b!1286430 () Bool)

(assert (=> b!1286430 (= e!734745 tp_is_empty!34053)))

(declare-fun bm!62918 () Bool)

(assert (=> bm!62918 (= call!62916 call!62917)))

(declare-fun b!1286431 () Bool)

(assert (=> b!1286431 (= e!734747 (not e!734743))))

(declare-fun res!854521 () Bool)

(assert (=> b!1286431 (=> res!854521 e!734743)))

(assert (=> b!1286431 (= res!854521 (= k0!1205 (select (arr!41079 _keys!1741) from!2144)))))

(assert (=> b!1286431 (not (contains!7924 (ListLongMap!19586 Nil!29110) k0!1205))))

(declare-fun lt!577254 () Unit!42526)

(declare-fun emptyContainsNothing!5 ((_ BitVec 64)) Unit!42526)

(assert (=> b!1286431 (= lt!577254 (emptyContainsNothing!5 k0!1205))))

(declare-fun lt!577246 () Unit!42526)

(assert (=> b!1286431 (= lt!577246 e!734739)))

(assert (=> b!1286431 (= c!124174 (and (not lt!577252) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1286431 (= lt!577252 (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1286432 () Bool)

(declare-fun Unit!42528 () Unit!42526)

(assert (=> b!1286432 (= e!734744 Unit!42528)))

(assert (= (and start!108900 res!854518) b!1286418))

(assert (= (and b!1286418 res!854519) b!1286415))

(assert (= (and b!1286415 res!854520) b!1286427))

(assert (= (and b!1286427 res!854524) b!1286425))

(assert (= (and b!1286425 res!854522) b!1286419))

(assert (= (and b!1286419 res!854526) b!1286424))

(assert (= (and b!1286424 res!854523) b!1286426))

(assert (= (and b!1286426 res!854525) b!1286431))

(assert (= (and b!1286431 c!124174) b!1286422))

(assert (= (and b!1286431 (not c!124174)) b!1286423))

(assert (= (and b!1286423 c!124172) b!1286428))

(assert (= (and b!1286423 (not c!124172)) b!1286421))

(assert (= (and b!1286421 c!124173) b!1286417))

(assert (= (and b!1286421 (not c!124173)) b!1286432))

(assert (= (or b!1286428 b!1286417) bm!62916))

(assert (= (or b!1286428 b!1286417) bm!62914))

(assert (= (or b!1286428 b!1286417) bm!62918))

(assert (= (or b!1286422 bm!62916) bm!62915))

(assert (= (or b!1286422 bm!62914) bm!62913))

(assert (= (or b!1286422 bm!62918) bm!62917))

(assert (= (and b!1286431 (not res!854521)) b!1286429))

(assert (= (and b!1286420 condMapEmpty!52637) mapIsEmpty!52637))

(assert (= (and b!1286420 (not condMapEmpty!52637)) mapNonEmpty!52637))

(get-info :version)

(assert (= (and mapNonEmpty!52637 ((_ is ValueCellFull!16128) mapValue!52637)) b!1286430))

(assert (= (and b!1286420 ((_ is ValueCellFull!16128) mapDefault!52637)) b!1286416))

(assert (= start!108900 b!1286420))

(declare-fun b_lambda!23115 () Bool)

(assert (=> (not b_lambda!23115) (not b!1286429)))

(declare-fun t!42666 () Bool)

(declare-fun tb!11357 () Bool)

(assert (=> (and start!108900 (= defaultEntry!1448 defaultEntry!1448) t!42666) tb!11357))

(declare-fun result!23713 () Bool)

(assert (=> tb!11357 (= result!23713 tp_is_empty!34053)))

(assert (=> b!1286429 t!42666))

(declare-fun b_and!46489 () Bool)

(assert (= b_and!46487 (and (=> t!42666 result!23713) b_and!46489)))

(declare-fun m!1179489 () Bool)

(assert (=> b!1286427 m!1179489))

(declare-fun m!1179491 () Bool)

(assert (=> b!1286422 m!1179491))

(declare-fun m!1179493 () Bool)

(assert (=> b!1286422 m!1179493))

(declare-fun m!1179495 () Bool)

(assert (=> b!1286422 m!1179495))

(declare-fun m!1179497 () Bool)

(assert (=> b!1286426 m!1179497))

(assert (=> b!1286426 m!1179497))

(declare-fun m!1179499 () Bool)

(assert (=> b!1286426 m!1179499))

(declare-fun m!1179501 () Bool)

(assert (=> mapNonEmpty!52637 m!1179501))

(declare-fun m!1179503 () Bool)

(assert (=> start!108900 m!1179503))

(declare-fun m!1179505 () Bool)

(assert (=> start!108900 m!1179505))

(declare-fun m!1179507 () Bool)

(assert (=> start!108900 m!1179507))

(declare-fun m!1179509 () Bool)

(assert (=> b!1286419 m!1179509))

(assert (=> b!1286419 m!1179509))

(declare-fun m!1179511 () Bool)

(assert (=> b!1286419 m!1179511))

(declare-fun m!1179513 () Bool)

(assert (=> bm!62913 m!1179513))

(declare-fun m!1179515 () Bool)

(assert (=> b!1286415 m!1179515))

(declare-fun m!1179517 () Bool)

(assert (=> b!1286429 m!1179517))

(declare-fun m!1179519 () Bool)

(assert (=> b!1286429 m!1179519))

(assert (=> b!1286429 m!1179497))

(declare-fun m!1179521 () Bool)

(assert (=> b!1286429 m!1179521))

(declare-fun m!1179523 () Bool)

(assert (=> b!1286429 m!1179523))

(declare-fun m!1179525 () Bool)

(assert (=> b!1286429 m!1179525))

(assert (=> b!1286429 m!1179497))

(assert (=> b!1286429 m!1179523))

(assert (=> b!1286429 m!1179519))

(assert (=> b!1286429 m!1179517))

(declare-fun m!1179527 () Bool)

(assert (=> b!1286429 m!1179527))

(declare-fun m!1179529 () Bool)

(assert (=> bm!62915 m!1179529))

(declare-fun m!1179531 () Bool)

(assert (=> bm!62917 m!1179531))

(assert (=> b!1286431 m!1179497))

(declare-fun m!1179533 () Bool)

(assert (=> b!1286431 m!1179533))

(declare-fun m!1179535 () Bool)

(assert (=> b!1286431 m!1179535))

(check-sat (not b_lambda!23115) (not b!1286419) (not b!1286426) (not bm!62915) (not mapNonEmpty!52637) tp_is_empty!34053 (not b_next!28413) (not b!1286427) (not start!108900) (not bm!62917) (not b!1286429) (not b!1286431) (not b!1286415) (not bm!62913) (not b!1286422) b_and!46489)
(check-sat b_and!46489 (not b_next!28413))

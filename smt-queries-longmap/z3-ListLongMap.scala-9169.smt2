; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110166 () Bool)

(assert start!110166)

(declare-fun b_free!29289 () Bool)

(declare-fun b_next!29289 () Bool)

(assert (=> start!110166 (= b_free!29289 (not b_next!29289))))

(declare-fun tp!103024 () Bool)

(declare-fun b_and!47469 () Bool)

(assert (=> start!110166 (= tp!103024 b_and!47469)))

(declare-fun mapNonEmpty!53993 () Bool)

(declare-fun mapRes!53993 () Bool)

(declare-fun tp!103025 () Bool)

(declare-fun e!744037 () Bool)

(assert (=> mapNonEmpty!53993 (= mapRes!53993 (and tp!103025 e!744037))))

(declare-datatypes ((V!51675 0))(
  ( (V!51676 (val!17539 Int)) )
))
(declare-datatypes ((ValueCell!16566 0))(
  ( (ValueCellFull!16566 (v!20158 V!51675)) (EmptyCell!16566) )
))
(declare-fun mapRest!53993 () (Array (_ BitVec 32) ValueCell!16566))

(declare-fun mapKey!53993 () (_ BitVec 32))

(declare-datatypes ((array!86872 0))(
  ( (array!86873 (arr!41925 (Array (_ BitVec 32) ValueCell!16566)) (size!42475 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86872)

(declare-fun mapValue!53993 () ValueCell!16566)

(assert (=> mapNonEmpty!53993 (= (arr!41925 _values!1445) (store mapRest!53993 mapKey!53993 mapValue!53993))))

(declare-fun b!1304421 () Bool)

(declare-fun res!866319 () Bool)

(declare-fun e!744039 () Bool)

(assert (=> b!1304421 (=> (not res!866319) (not e!744039))))

(declare-datatypes ((array!86874 0))(
  ( (array!86875 (arr!41926 (Array (_ BitVec 32) (_ BitVec 64))) (size!42476 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86874)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86874 (_ BitVec 32)) Bool)

(assert (=> b!1304421 (= res!866319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1304422 () Bool)

(declare-fun res!866317 () Bool)

(assert (=> b!1304422 (=> (not res!866317) (not e!744039))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1304422 (= res!866317 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42476 _keys!1741))))))

(declare-fun b!1304423 () Bool)

(declare-fun res!866320 () Bool)

(assert (=> b!1304423 (=> (not res!866320) (not e!744039))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1304423 (= res!866320 (not (validKeyInArray!0 (select (arr!41926 _keys!1741) from!2144))))))

(declare-fun b!1304424 () Bool)

(declare-fun e!744038 () Bool)

(declare-fun e!744041 () Bool)

(assert (=> b!1304424 (= e!744038 e!744041)))

(declare-fun res!866312 () Bool)

(assert (=> b!1304424 (=> (not res!866312) (not e!744041))))

(declare-fun minValue!1387 () V!51675)

(declare-fun zeroValue!1387 () V!51675)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22638 0))(
  ( (tuple2!22639 (_1!11330 (_ BitVec 64)) (_2!11330 V!51675)) )
))
(declare-datatypes ((List!29758 0))(
  ( (Nil!29755) (Cons!29754 (h!30963 tuple2!22638) (t!43356 List!29758)) )
))
(declare-datatypes ((ListLongMap!20295 0))(
  ( (ListLongMap!20296 (toList!10163 List!29758)) )
))
(declare-fun contains!8303 (ListLongMap!20295 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!6121 (array!86874 array!86872 (_ BitVec 32) (_ BitVec 32) V!51675 V!51675 (_ BitVec 32) Int) ListLongMap!20295)

(assert (=> b!1304424 (= res!866312 (not (contains!8303 (getCurrentListMapNoExtraKeys!6121 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205)))))

(declare-fun b!1304425 () Bool)

(declare-fun res!866314 () Bool)

(assert (=> b!1304425 (=> (not res!866314) (not e!744039))))

(assert (=> b!1304425 (= res!866314 (and (= (size!42475 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42476 _keys!1741) (size!42475 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1304426 () Bool)

(declare-fun tp_is_empty!34929 () Bool)

(assert (=> b!1304426 (= e!744037 tp_is_empty!34929)))

(declare-fun b!1304427 () Bool)

(declare-fun e!744040 () Bool)

(assert (=> b!1304427 (= e!744040 tp_is_empty!34929)))

(declare-fun b!1304429 () Bool)

(declare-fun e!744036 () Bool)

(assert (=> b!1304429 (= e!744036 (and e!744040 mapRes!53993))))

(declare-fun condMapEmpty!53993 () Bool)

(declare-fun mapDefault!53993 () ValueCell!16566)

(assert (=> b!1304429 (= condMapEmpty!53993 (= (arr!41925 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16566)) mapDefault!53993)))))

(declare-fun b!1304430 () Bool)

(declare-fun res!866315 () Bool)

(assert (=> b!1304430 (=> (not res!866315) (not e!744039))))

(declare-fun getCurrentListMap!5181 (array!86874 array!86872 (_ BitVec 32) (_ BitVec 32) V!51675 V!51675 (_ BitVec 32) Int) ListLongMap!20295)

(assert (=> b!1304430 (= res!866315 (contains!8303 (getCurrentListMap!5181 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1304431 () Bool)

(assert (=> b!1304431 (= e!744039 (not e!744038))))

(declare-fun res!866313 () Bool)

(assert (=> b!1304431 (=> res!866313 e!744038)))

(assert (=> b!1304431 (= res!866313 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1304431 (not (contains!8303 (ListLongMap!20296 Nil!29755) k0!1205))))

(declare-datatypes ((Unit!43194 0))(
  ( (Unit!43195) )
))
(declare-fun lt!583782 () Unit!43194)

(declare-fun emptyContainsNothing!226 ((_ BitVec 64)) Unit!43194)

(assert (=> b!1304431 (= lt!583782 (emptyContainsNothing!226 k0!1205))))

(declare-fun mapIsEmpty!53993 () Bool)

(assert (=> mapIsEmpty!53993 mapRes!53993))

(declare-fun b!1304432 () Bool)

(assert (=> b!1304432 (= e!744041 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!1205)))))

(declare-fun b!1304433 () Bool)

(declare-fun res!866311 () Bool)

(assert (=> b!1304433 (=> (not res!866311) (not e!744039))))

(declare-datatypes ((List!29759 0))(
  ( (Nil!29756) (Cons!29755 (h!30964 (_ BitVec 64)) (t!43357 List!29759)) )
))
(declare-fun arrayNoDuplicates!0 (array!86874 (_ BitVec 32) List!29759) Bool)

(assert (=> b!1304433 (= res!866311 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29756))))

(declare-fun b!1304428 () Bool)

(declare-fun res!866318 () Bool)

(assert (=> b!1304428 (=> (not res!866318) (not e!744039))))

(assert (=> b!1304428 (= res!866318 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42476 _keys!1741))))))

(declare-fun res!866316 () Bool)

(assert (=> start!110166 (=> (not res!866316) (not e!744039))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110166 (= res!866316 (validMask!0 mask!2175))))

(assert (=> start!110166 e!744039))

(assert (=> start!110166 tp_is_empty!34929))

(assert (=> start!110166 true))

(declare-fun array_inv!31703 (array!86872) Bool)

(assert (=> start!110166 (and (array_inv!31703 _values!1445) e!744036)))

(declare-fun array_inv!31704 (array!86874) Bool)

(assert (=> start!110166 (array_inv!31704 _keys!1741)))

(assert (=> start!110166 tp!103024))

(assert (= (and start!110166 res!866316) b!1304425))

(assert (= (and b!1304425 res!866314) b!1304421))

(assert (= (and b!1304421 res!866319) b!1304433))

(assert (= (and b!1304433 res!866311) b!1304428))

(assert (= (and b!1304428 res!866318) b!1304430))

(assert (= (and b!1304430 res!866315) b!1304422))

(assert (= (and b!1304422 res!866317) b!1304423))

(assert (= (and b!1304423 res!866320) b!1304431))

(assert (= (and b!1304431 (not res!866313)) b!1304424))

(assert (= (and b!1304424 res!866312) b!1304432))

(assert (= (and b!1304429 condMapEmpty!53993) mapIsEmpty!53993))

(assert (= (and b!1304429 (not condMapEmpty!53993)) mapNonEmpty!53993))

(get-info :version)

(assert (= (and mapNonEmpty!53993 ((_ is ValueCellFull!16566) mapValue!53993)) b!1304426))

(assert (= (and b!1304429 ((_ is ValueCellFull!16566) mapDefault!53993)) b!1304427))

(assert (= start!110166 b!1304429))

(declare-fun m!1195381 () Bool)

(assert (=> b!1304430 m!1195381))

(assert (=> b!1304430 m!1195381))

(declare-fun m!1195383 () Bool)

(assert (=> b!1304430 m!1195383))

(declare-fun m!1195385 () Bool)

(assert (=> b!1304433 m!1195385))

(declare-fun m!1195387 () Bool)

(assert (=> b!1304423 m!1195387))

(assert (=> b!1304423 m!1195387))

(declare-fun m!1195389 () Bool)

(assert (=> b!1304423 m!1195389))

(declare-fun m!1195391 () Bool)

(assert (=> b!1304424 m!1195391))

(assert (=> b!1304424 m!1195391))

(declare-fun m!1195393 () Bool)

(assert (=> b!1304424 m!1195393))

(declare-fun m!1195395 () Bool)

(assert (=> b!1304431 m!1195395))

(declare-fun m!1195397 () Bool)

(assert (=> b!1304431 m!1195397))

(declare-fun m!1195399 () Bool)

(assert (=> start!110166 m!1195399))

(declare-fun m!1195401 () Bool)

(assert (=> start!110166 m!1195401))

(declare-fun m!1195403 () Bool)

(assert (=> start!110166 m!1195403))

(declare-fun m!1195405 () Bool)

(assert (=> mapNonEmpty!53993 m!1195405))

(declare-fun m!1195407 () Bool)

(assert (=> b!1304421 m!1195407))

(check-sat tp_is_empty!34929 (not start!110166) b_and!47469 (not mapNonEmpty!53993) (not b!1304433) (not b!1304424) (not b!1304430) (not b!1304421) (not b!1304423) (not b!1304431) (not b_next!29289))
(check-sat b_and!47469 (not b_next!29289))
(get-model)

(declare-fun b!1304481 () Bool)

(declare-fun e!744070 () Bool)

(declare-fun e!744071 () Bool)

(assert (=> b!1304481 (= e!744070 e!744071)))

(declare-fun lt!583792 () (_ BitVec 64))

(assert (=> b!1304481 (= lt!583792 (select (arr!41926 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!583794 () Unit!43194)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86874 (_ BitVec 64) (_ BitVec 32)) Unit!43194)

(assert (=> b!1304481 (= lt!583794 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!583792 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86874 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1304481 (arrayContainsKey!0 _keys!1741 lt!583792 #b00000000000000000000000000000000)))

(declare-fun lt!583793 () Unit!43194)

(assert (=> b!1304481 (= lt!583793 lt!583794)))

(declare-fun res!866355 () Bool)

(declare-datatypes ((SeekEntryResult!10027 0))(
  ( (MissingZero!10027 (index!42479 (_ BitVec 32))) (Found!10027 (index!42480 (_ BitVec 32))) (Intermediate!10027 (undefined!10839 Bool) (index!42481 (_ BitVec 32)) (x!115861 (_ BitVec 32))) (Undefined!10027) (MissingVacant!10027 (index!42482 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86874 (_ BitVec 32)) SeekEntryResult!10027)

(assert (=> b!1304481 (= res!866355 (= (seekEntryOrOpen!0 (select (arr!41926 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10027 #b00000000000000000000000000000000)))))

(assert (=> b!1304481 (=> (not res!866355) (not e!744071))))

(declare-fun d!141815 () Bool)

(declare-fun res!866356 () Bool)

(declare-fun e!744072 () Bool)

(assert (=> d!141815 (=> res!866356 e!744072)))

(assert (=> d!141815 (= res!866356 (bvsge #b00000000000000000000000000000000 (size!42476 _keys!1741)))))

(assert (=> d!141815 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!744072)))

(declare-fun b!1304482 () Bool)

(declare-fun call!64272 () Bool)

(assert (=> b!1304482 (= e!744070 call!64272)))

(declare-fun bm!64269 () Bool)

(assert (=> bm!64269 (= call!64272 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1304483 () Bool)

(assert (=> b!1304483 (= e!744072 e!744070)))

(declare-fun c!125225 () Bool)

(assert (=> b!1304483 (= c!125225 (validKeyInArray!0 (select (arr!41926 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1304484 () Bool)

(assert (=> b!1304484 (= e!744071 call!64272)))

(assert (= (and d!141815 (not res!866356)) b!1304483))

(assert (= (and b!1304483 c!125225) b!1304481))

(assert (= (and b!1304483 (not c!125225)) b!1304482))

(assert (= (and b!1304481 res!866355) b!1304484))

(assert (= (or b!1304484 b!1304482) bm!64269))

(declare-fun m!1195437 () Bool)

(assert (=> b!1304481 m!1195437))

(declare-fun m!1195439 () Bool)

(assert (=> b!1304481 m!1195439))

(declare-fun m!1195441 () Bool)

(assert (=> b!1304481 m!1195441))

(assert (=> b!1304481 m!1195437))

(declare-fun m!1195443 () Bool)

(assert (=> b!1304481 m!1195443))

(declare-fun m!1195445 () Bool)

(assert (=> bm!64269 m!1195445))

(assert (=> b!1304483 m!1195437))

(assert (=> b!1304483 m!1195437))

(declare-fun m!1195447 () Bool)

(assert (=> b!1304483 m!1195447))

(assert (=> b!1304421 d!141815))

(declare-fun d!141817 () Bool)

(declare-fun e!744077 () Bool)

(assert (=> d!141817 e!744077))

(declare-fun res!866359 () Bool)

(assert (=> d!141817 (=> res!866359 e!744077)))

(declare-fun lt!583805 () Bool)

(assert (=> d!141817 (= res!866359 (not lt!583805))))

(declare-fun lt!583806 () Bool)

(assert (=> d!141817 (= lt!583805 lt!583806)))

(declare-fun lt!583804 () Unit!43194)

(declare-fun e!744078 () Unit!43194)

(assert (=> d!141817 (= lt!583804 e!744078)))

(declare-fun c!125228 () Bool)

(assert (=> d!141817 (= c!125228 lt!583806)))

(declare-fun containsKey!729 (List!29758 (_ BitVec 64)) Bool)

(assert (=> d!141817 (= lt!583806 (containsKey!729 (toList!10163 (ListLongMap!20296 Nil!29755)) k0!1205))))

(assert (=> d!141817 (= (contains!8303 (ListLongMap!20296 Nil!29755) k0!1205) lt!583805)))

(declare-fun b!1304491 () Bool)

(declare-fun lt!583803 () Unit!43194)

(assert (=> b!1304491 (= e!744078 lt!583803)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!475 (List!29758 (_ BitVec 64)) Unit!43194)

(assert (=> b!1304491 (= lt!583803 (lemmaContainsKeyImpliesGetValueByKeyDefined!475 (toList!10163 (ListLongMap!20296 Nil!29755)) k0!1205))))

(declare-datatypes ((Option!759 0))(
  ( (Some!758 (v!20160 V!51675)) (None!757) )
))
(declare-fun isDefined!514 (Option!759) Bool)

(declare-fun getValueByKey!707 (List!29758 (_ BitVec 64)) Option!759)

(assert (=> b!1304491 (isDefined!514 (getValueByKey!707 (toList!10163 (ListLongMap!20296 Nil!29755)) k0!1205))))

(declare-fun b!1304492 () Bool)

(declare-fun Unit!43198 () Unit!43194)

(assert (=> b!1304492 (= e!744078 Unit!43198)))

(declare-fun b!1304493 () Bool)

(assert (=> b!1304493 (= e!744077 (isDefined!514 (getValueByKey!707 (toList!10163 (ListLongMap!20296 Nil!29755)) k0!1205)))))

(assert (= (and d!141817 c!125228) b!1304491))

(assert (= (and d!141817 (not c!125228)) b!1304492))

(assert (= (and d!141817 (not res!866359)) b!1304493))

(declare-fun m!1195449 () Bool)

(assert (=> d!141817 m!1195449))

(declare-fun m!1195451 () Bool)

(assert (=> b!1304491 m!1195451))

(declare-fun m!1195453 () Bool)

(assert (=> b!1304491 m!1195453))

(assert (=> b!1304491 m!1195453))

(declare-fun m!1195455 () Bool)

(assert (=> b!1304491 m!1195455))

(assert (=> b!1304493 m!1195453))

(assert (=> b!1304493 m!1195453))

(assert (=> b!1304493 m!1195455))

(assert (=> b!1304431 d!141817))

(declare-fun d!141819 () Bool)

(assert (=> d!141819 (not (contains!8303 (ListLongMap!20296 Nil!29755) k0!1205))))

(declare-fun lt!583809 () Unit!43194)

(declare-fun choose!1928 ((_ BitVec 64)) Unit!43194)

(assert (=> d!141819 (= lt!583809 (choose!1928 k0!1205))))

(assert (=> d!141819 (= (emptyContainsNothing!226 k0!1205) lt!583809)))

(declare-fun bs!37152 () Bool)

(assert (= bs!37152 d!141819))

(assert (=> bs!37152 m!1195395))

(declare-fun m!1195457 () Bool)

(assert (=> bs!37152 m!1195457))

(assert (=> b!1304431 d!141819))

(declare-fun d!141821 () Bool)

(declare-fun e!744079 () Bool)

(assert (=> d!141821 e!744079))

(declare-fun res!866360 () Bool)

(assert (=> d!141821 (=> res!866360 e!744079)))

(declare-fun lt!583812 () Bool)

(assert (=> d!141821 (= res!866360 (not lt!583812))))

(declare-fun lt!583813 () Bool)

(assert (=> d!141821 (= lt!583812 lt!583813)))

(declare-fun lt!583811 () Unit!43194)

(declare-fun e!744080 () Unit!43194)

(assert (=> d!141821 (= lt!583811 e!744080)))

(declare-fun c!125229 () Bool)

(assert (=> d!141821 (= c!125229 lt!583813)))

(assert (=> d!141821 (= lt!583813 (containsKey!729 (toList!10163 (getCurrentListMapNoExtraKeys!6121 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!141821 (= (contains!8303 (getCurrentListMapNoExtraKeys!6121 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!583812)))

(declare-fun b!1304494 () Bool)

(declare-fun lt!583810 () Unit!43194)

(assert (=> b!1304494 (= e!744080 lt!583810)))

(assert (=> b!1304494 (= lt!583810 (lemmaContainsKeyImpliesGetValueByKeyDefined!475 (toList!10163 (getCurrentListMapNoExtraKeys!6121 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> b!1304494 (isDefined!514 (getValueByKey!707 (toList!10163 (getCurrentListMapNoExtraKeys!6121 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1304495 () Bool)

(declare-fun Unit!43199 () Unit!43194)

(assert (=> b!1304495 (= e!744080 Unit!43199)))

(declare-fun b!1304496 () Bool)

(assert (=> b!1304496 (= e!744079 (isDefined!514 (getValueByKey!707 (toList!10163 (getCurrentListMapNoExtraKeys!6121 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141821 c!125229) b!1304494))

(assert (= (and d!141821 (not c!125229)) b!1304495))

(assert (= (and d!141821 (not res!866360)) b!1304496))

(declare-fun m!1195459 () Bool)

(assert (=> d!141821 m!1195459))

(declare-fun m!1195461 () Bool)

(assert (=> b!1304494 m!1195461))

(declare-fun m!1195463 () Bool)

(assert (=> b!1304494 m!1195463))

(assert (=> b!1304494 m!1195463))

(declare-fun m!1195465 () Bool)

(assert (=> b!1304494 m!1195465))

(assert (=> b!1304496 m!1195463))

(assert (=> b!1304496 m!1195463))

(assert (=> b!1304496 m!1195465))

(assert (=> b!1304424 d!141821))

(declare-fun lt!583831 () ListLongMap!20295)

(declare-fun b!1304521 () Bool)

(declare-fun e!744097 () Bool)

(assert (=> b!1304521 (= e!744097 (= lt!583831 (getCurrentListMapNoExtraKeys!6121 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun b!1304522 () Bool)

(declare-fun e!744100 () Bool)

(assert (=> b!1304522 (= e!744100 (validKeyInArray!0 (select (arr!41926 _keys!1741) from!2144)))))

(assert (=> b!1304522 (bvsge from!2144 #b00000000000000000000000000000000)))

(declare-fun b!1304523 () Bool)

(declare-fun e!744099 () Bool)

(declare-fun e!744098 () Bool)

(assert (=> b!1304523 (= e!744099 e!744098)))

(assert (=> b!1304523 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42476 _keys!1741)))))

(declare-fun res!866369 () Bool)

(assert (=> b!1304523 (= res!866369 (contains!8303 lt!583831 (select (arr!41926 _keys!1741) from!2144)))))

(assert (=> b!1304523 (=> (not res!866369) (not e!744098))))

(declare-fun b!1304524 () Bool)

(declare-fun isEmpty!1066 (ListLongMap!20295) Bool)

(assert (=> b!1304524 (= e!744097 (isEmpty!1066 lt!583831))))

(declare-fun b!1304525 () Bool)

(declare-fun e!744095 () Bool)

(assert (=> b!1304525 (= e!744095 e!744099)))

(declare-fun c!125240 () Bool)

(assert (=> b!1304525 (= c!125240 e!744100)))

(declare-fun res!866370 () Bool)

(assert (=> b!1304525 (=> (not res!866370) (not e!744100))))

(assert (=> b!1304525 (= res!866370 (bvslt from!2144 (size!42476 _keys!1741)))))

(declare-fun b!1304526 () Bool)

(declare-fun e!744101 () ListLongMap!20295)

(declare-fun call!64275 () ListLongMap!20295)

(assert (=> b!1304526 (= e!744101 call!64275)))

(declare-fun bm!64272 () Bool)

(assert (=> bm!64272 (= call!64275 (getCurrentListMapNoExtraKeys!6121 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun d!141823 () Bool)

(assert (=> d!141823 e!744095))

(declare-fun res!866371 () Bool)

(assert (=> d!141823 (=> (not res!866371) (not e!744095))))

(assert (=> d!141823 (= res!866371 (not (contains!8303 lt!583831 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!744096 () ListLongMap!20295)

(assert (=> d!141823 (= lt!583831 e!744096)))

(declare-fun c!125239 () Bool)

(assert (=> d!141823 (= c!125239 (bvsge from!2144 (size!42476 _keys!1741)))))

(assert (=> d!141823 (validMask!0 mask!2175)))

(assert (=> d!141823 (= (getCurrentListMapNoExtraKeys!6121 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!583831)))

(declare-fun b!1304527 () Bool)

(declare-fun res!866372 () Bool)

(assert (=> b!1304527 (=> (not res!866372) (not e!744095))))

(assert (=> b!1304527 (= res!866372 (not (contains!8303 lt!583831 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1304528 () Bool)

(assert (=> b!1304528 (= e!744099 e!744097)))

(declare-fun c!125238 () Bool)

(assert (=> b!1304528 (= c!125238 (bvslt from!2144 (size!42476 _keys!1741)))))

(declare-fun b!1304529 () Bool)

(assert (=> b!1304529 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42476 _keys!1741)))))

(assert (=> b!1304529 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42475 _values!1445)))))

(declare-fun apply!1024 (ListLongMap!20295 (_ BitVec 64)) V!51675)

(declare-fun get!21177 (ValueCell!16566 V!51675) V!51675)

(declare-fun dynLambda!3431 (Int (_ BitVec 64)) V!51675)

(assert (=> b!1304529 (= e!744098 (= (apply!1024 lt!583831 (select (arr!41926 _keys!1741) from!2144)) (get!21177 (select (arr!41925 _values!1445) from!2144) (dynLambda!3431 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1304530 () Bool)

(assert (=> b!1304530 (= e!744096 e!744101)))

(declare-fun c!125241 () Bool)

(assert (=> b!1304530 (= c!125241 (validKeyInArray!0 (select (arr!41926 _keys!1741) from!2144)))))

(declare-fun b!1304531 () Bool)

(declare-fun lt!583834 () Unit!43194)

(declare-fun lt!583828 () Unit!43194)

(assert (=> b!1304531 (= lt!583834 lt!583828)))

(declare-fun lt!583832 () V!51675)

(declare-fun lt!583833 () (_ BitVec 64))

(declare-fun lt!583829 () ListLongMap!20295)

(declare-fun lt!583830 () (_ BitVec 64))

(declare-fun +!4485 (ListLongMap!20295 tuple2!22638) ListLongMap!20295)

(assert (=> b!1304531 (not (contains!8303 (+!4485 lt!583829 (tuple2!22639 lt!583830 lt!583832)) lt!583833))))

(declare-fun addStillNotContains!482 (ListLongMap!20295 (_ BitVec 64) V!51675 (_ BitVec 64)) Unit!43194)

(assert (=> b!1304531 (= lt!583828 (addStillNotContains!482 lt!583829 lt!583830 lt!583832 lt!583833))))

(assert (=> b!1304531 (= lt!583833 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1304531 (= lt!583832 (get!21177 (select (arr!41925 _values!1445) from!2144) (dynLambda!3431 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1304531 (= lt!583830 (select (arr!41926 _keys!1741) from!2144))))

(assert (=> b!1304531 (= lt!583829 call!64275)))

(assert (=> b!1304531 (= e!744101 (+!4485 call!64275 (tuple2!22639 (select (arr!41926 _keys!1741) from!2144) (get!21177 (select (arr!41925 _values!1445) from!2144) (dynLambda!3431 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1304532 () Bool)

(assert (=> b!1304532 (= e!744096 (ListLongMap!20296 Nil!29755))))

(assert (= (and d!141823 c!125239) b!1304532))

(assert (= (and d!141823 (not c!125239)) b!1304530))

(assert (= (and b!1304530 c!125241) b!1304531))

(assert (= (and b!1304530 (not c!125241)) b!1304526))

(assert (= (or b!1304531 b!1304526) bm!64272))

(assert (= (and d!141823 res!866371) b!1304527))

(assert (= (and b!1304527 res!866372) b!1304525))

(assert (= (and b!1304525 res!866370) b!1304522))

(assert (= (and b!1304525 c!125240) b!1304523))

(assert (= (and b!1304525 (not c!125240)) b!1304528))

(assert (= (and b!1304523 res!866369) b!1304529))

(assert (= (and b!1304528 c!125238) b!1304521))

(assert (= (and b!1304528 (not c!125238)) b!1304524))

(declare-fun b_lambda!23307 () Bool)

(assert (=> (not b_lambda!23307) (not b!1304529)))

(declare-fun t!43361 () Bool)

(declare-fun tb!11403 () Bool)

(assert (=> (and start!110166 (= defaultEntry!1448 defaultEntry!1448) t!43361) tb!11403))

(declare-fun result!23831 () Bool)

(assert (=> tb!11403 (= result!23831 tp_is_empty!34929)))

(assert (=> b!1304529 t!43361))

(declare-fun b_and!47473 () Bool)

(assert (= b_and!47469 (and (=> t!43361 result!23831) b_and!47473)))

(declare-fun b_lambda!23309 () Bool)

(assert (=> (not b_lambda!23309) (not b!1304531)))

(assert (=> b!1304531 t!43361))

(declare-fun b_and!47475 () Bool)

(assert (= b_and!47473 (and (=> t!43361 result!23831) b_and!47475)))

(declare-fun m!1195467 () Bool)

(assert (=> b!1304527 m!1195467))

(declare-fun m!1195469 () Bool)

(assert (=> b!1304524 m!1195469))

(assert (=> b!1304522 m!1195387))

(assert (=> b!1304522 m!1195387))

(assert (=> b!1304522 m!1195389))

(declare-fun m!1195471 () Bool)

(assert (=> d!141823 m!1195471))

(assert (=> d!141823 m!1195399))

(assert (=> b!1304530 m!1195387))

(assert (=> b!1304530 m!1195387))

(assert (=> b!1304530 m!1195389))

(declare-fun m!1195473 () Bool)

(assert (=> bm!64272 m!1195473))

(assert (=> b!1304523 m!1195387))

(assert (=> b!1304523 m!1195387))

(declare-fun m!1195475 () Bool)

(assert (=> b!1304523 m!1195475))

(assert (=> b!1304521 m!1195473))

(declare-fun m!1195477 () Bool)

(assert (=> b!1304531 m!1195477))

(declare-fun m!1195479 () Bool)

(assert (=> b!1304531 m!1195479))

(declare-fun m!1195481 () Bool)

(assert (=> b!1304531 m!1195481))

(declare-fun m!1195483 () Bool)

(assert (=> b!1304531 m!1195483))

(declare-fun m!1195485 () Bool)

(assert (=> b!1304531 m!1195485))

(declare-fun m!1195487 () Bool)

(assert (=> b!1304531 m!1195487))

(assert (=> b!1304531 m!1195387))

(assert (=> b!1304531 m!1195477))

(assert (=> b!1304531 m!1195479))

(assert (=> b!1304531 m!1195485))

(declare-fun m!1195489 () Bool)

(assert (=> b!1304531 m!1195489))

(assert (=> b!1304529 m!1195477))

(assert (=> b!1304529 m!1195479))

(assert (=> b!1304529 m!1195481))

(assert (=> b!1304529 m!1195479))

(assert (=> b!1304529 m!1195387))

(declare-fun m!1195491 () Bool)

(assert (=> b!1304529 m!1195491))

(assert (=> b!1304529 m!1195387))

(assert (=> b!1304529 m!1195477))

(assert (=> b!1304424 d!141823))

(declare-fun d!141825 () Bool)

(assert (=> d!141825 (= (validKeyInArray!0 (select (arr!41926 _keys!1741) from!2144)) (and (not (= (select (arr!41926 _keys!1741) from!2144) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41926 _keys!1741) from!2144) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1304423 d!141825))

(declare-fun b!1304545 () Bool)

(declare-fun e!744110 () Bool)

(declare-fun call!64278 () Bool)

(assert (=> b!1304545 (= e!744110 call!64278)))

(declare-fun b!1304546 () Bool)

(declare-fun e!744113 () Bool)

(declare-fun contains!8305 (List!29759 (_ BitVec 64)) Bool)

(assert (=> b!1304546 (= e!744113 (contains!8305 Nil!29756 (select (arr!41926 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1304547 () Bool)

(assert (=> b!1304547 (= e!744110 call!64278)))

(declare-fun b!1304548 () Bool)

(declare-fun e!744111 () Bool)

(declare-fun e!744112 () Bool)

(assert (=> b!1304548 (= e!744111 e!744112)))

(declare-fun res!866381 () Bool)

(assert (=> b!1304548 (=> (not res!866381) (not e!744112))))

(assert (=> b!1304548 (= res!866381 (not e!744113))))

(declare-fun res!866380 () Bool)

(assert (=> b!1304548 (=> (not res!866380) (not e!744113))))

(assert (=> b!1304548 (= res!866380 (validKeyInArray!0 (select (arr!41926 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun d!141827 () Bool)

(declare-fun res!866379 () Bool)

(assert (=> d!141827 (=> res!866379 e!744111)))

(assert (=> d!141827 (= res!866379 (bvsge #b00000000000000000000000000000000 (size!42476 _keys!1741)))))

(assert (=> d!141827 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29756) e!744111)))

(declare-fun b!1304549 () Bool)

(assert (=> b!1304549 (= e!744112 e!744110)))

(declare-fun c!125244 () Bool)

(assert (=> b!1304549 (= c!125244 (validKeyInArray!0 (select (arr!41926 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun bm!64275 () Bool)

(assert (=> bm!64275 (= call!64278 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125244 (Cons!29755 (select (arr!41926 _keys!1741) #b00000000000000000000000000000000) Nil!29756) Nil!29756)))))

(assert (= (and d!141827 (not res!866379)) b!1304548))

(assert (= (and b!1304548 res!866380) b!1304546))

(assert (= (and b!1304548 res!866381) b!1304549))

(assert (= (and b!1304549 c!125244) b!1304545))

(assert (= (and b!1304549 (not c!125244)) b!1304547))

(assert (= (or b!1304545 b!1304547) bm!64275))

(assert (=> b!1304546 m!1195437))

(assert (=> b!1304546 m!1195437))

(declare-fun m!1195493 () Bool)

(assert (=> b!1304546 m!1195493))

(assert (=> b!1304548 m!1195437))

(assert (=> b!1304548 m!1195437))

(assert (=> b!1304548 m!1195447))

(assert (=> b!1304549 m!1195437))

(assert (=> b!1304549 m!1195437))

(assert (=> b!1304549 m!1195447))

(assert (=> bm!64275 m!1195437))

(declare-fun m!1195495 () Bool)

(assert (=> bm!64275 m!1195495))

(assert (=> b!1304433 d!141827))

(declare-fun d!141829 () Bool)

(assert (=> d!141829 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!110166 d!141829))

(declare-fun d!141831 () Bool)

(assert (=> d!141831 (= (array_inv!31703 _values!1445) (bvsge (size!42475 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!110166 d!141831))

(declare-fun d!141833 () Bool)

(assert (=> d!141833 (= (array_inv!31704 _keys!1741) (bvsge (size!42476 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!110166 d!141833))

(declare-fun d!141835 () Bool)

(declare-fun e!744114 () Bool)

(assert (=> d!141835 e!744114))

(declare-fun res!866382 () Bool)

(assert (=> d!141835 (=> res!866382 e!744114)))

(declare-fun lt!583837 () Bool)

(assert (=> d!141835 (= res!866382 (not lt!583837))))

(declare-fun lt!583838 () Bool)

(assert (=> d!141835 (= lt!583837 lt!583838)))

(declare-fun lt!583836 () Unit!43194)

(declare-fun e!744115 () Unit!43194)

(assert (=> d!141835 (= lt!583836 e!744115)))

(declare-fun c!125245 () Bool)

(assert (=> d!141835 (= c!125245 lt!583838)))

(assert (=> d!141835 (= lt!583838 (containsKey!729 (toList!10163 (getCurrentListMap!5181 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!141835 (= (contains!8303 (getCurrentListMap!5181 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!583837)))

(declare-fun b!1304550 () Bool)

(declare-fun lt!583835 () Unit!43194)

(assert (=> b!1304550 (= e!744115 lt!583835)))

(assert (=> b!1304550 (= lt!583835 (lemmaContainsKeyImpliesGetValueByKeyDefined!475 (toList!10163 (getCurrentListMap!5181 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> b!1304550 (isDefined!514 (getValueByKey!707 (toList!10163 (getCurrentListMap!5181 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1304551 () Bool)

(declare-fun Unit!43200 () Unit!43194)

(assert (=> b!1304551 (= e!744115 Unit!43200)))

(declare-fun b!1304552 () Bool)

(assert (=> b!1304552 (= e!744114 (isDefined!514 (getValueByKey!707 (toList!10163 (getCurrentListMap!5181 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141835 c!125245) b!1304550))

(assert (= (and d!141835 (not c!125245)) b!1304551))

(assert (= (and d!141835 (not res!866382)) b!1304552))

(declare-fun m!1195497 () Bool)

(assert (=> d!141835 m!1195497))

(declare-fun m!1195499 () Bool)

(assert (=> b!1304550 m!1195499))

(declare-fun m!1195501 () Bool)

(assert (=> b!1304550 m!1195501))

(assert (=> b!1304550 m!1195501))

(declare-fun m!1195503 () Bool)

(assert (=> b!1304550 m!1195503))

(assert (=> b!1304552 m!1195501))

(assert (=> b!1304552 m!1195501))

(assert (=> b!1304552 m!1195503))

(assert (=> b!1304430 d!141835))

(declare-fun b!1304595 () Bool)

(declare-fun e!744150 () ListLongMap!20295)

(declare-fun call!64294 () ListLongMap!20295)

(assert (=> b!1304595 (= e!744150 call!64294)))

(declare-fun b!1304596 () Bool)

(declare-fun e!744143 () ListLongMap!20295)

(declare-fun e!744148 () ListLongMap!20295)

(assert (=> b!1304596 (= e!744143 e!744148)))

(declare-fun c!125262 () Bool)

(assert (=> b!1304596 (= c!125262 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1304597 () Bool)

(assert (=> b!1304597 (= e!744148 call!64294)))

(declare-fun b!1304598 () Bool)

(declare-fun e!744153 () Unit!43194)

(declare-fun lt!583900 () Unit!43194)

(assert (=> b!1304598 (= e!744153 lt!583900)))

(declare-fun lt!583904 () ListLongMap!20295)

(assert (=> b!1304598 (= lt!583904 (getCurrentListMapNoExtraKeys!6121 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583890 () (_ BitVec 64))

(assert (=> b!1304598 (= lt!583890 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583891 () (_ BitVec 64))

(assert (=> b!1304598 (= lt!583891 (select (arr!41926 _keys!1741) from!2144))))

(declare-fun lt!583899 () Unit!43194)

(declare-fun addStillContains!1112 (ListLongMap!20295 (_ BitVec 64) V!51675 (_ BitVec 64)) Unit!43194)

(assert (=> b!1304598 (= lt!583899 (addStillContains!1112 lt!583904 lt!583890 zeroValue!1387 lt!583891))))

(assert (=> b!1304598 (contains!8303 (+!4485 lt!583904 (tuple2!22639 lt!583890 zeroValue!1387)) lt!583891)))

(declare-fun lt!583897 () Unit!43194)

(assert (=> b!1304598 (= lt!583897 lt!583899)))

(declare-fun lt!583888 () ListLongMap!20295)

(assert (=> b!1304598 (= lt!583888 (getCurrentListMapNoExtraKeys!6121 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583887 () (_ BitVec 64))

(assert (=> b!1304598 (= lt!583887 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583901 () (_ BitVec 64))

(assert (=> b!1304598 (= lt!583901 (select (arr!41926 _keys!1741) from!2144))))

(declare-fun lt!583898 () Unit!43194)

(declare-fun addApplyDifferent!566 (ListLongMap!20295 (_ BitVec 64) V!51675 (_ BitVec 64)) Unit!43194)

(assert (=> b!1304598 (= lt!583898 (addApplyDifferent!566 lt!583888 lt!583887 minValue!1387 lt!583901))))

(assert (=> b!1304598 (= (apply!1024 (+!4485 lt!583888 (tuple2!22639 lt!583887 minValue!1387)) lt!583901) (apply!1024 lt!583888 lt!583901))))

(declare-fun lt!583894 () Unit!43194)

(assert (=> b!1304598 (= lt!583894 lt!583898)))

(declare-fun lt!583886 () ListLongMap!20295)

(assert (=> b!1304598 (= lt!583886 (getCurrentListMapNoExtraKeys!6121 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583896 () (_ BitVec 64))

(assert (=> b!1304598 (= lt!583896 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583883 () (_ BitVec 64))

(assert (=> b!1304598 (= lt!583883 (select (arr!41926 _keys!1741) from!2144))))

(declare-fun lt!583893 () Unit!43194)

(assert (=> b!1304598 (= lt!583893 (addApplyDifferent!566 lt!583886 lt!583896 zeroValue!1387 lt!583883))))

(assert (=> b!1304598 (= (apply!1024 (+!4485 lt!583886 (tuple2!22639 lt!583896 zeroValue!1387)) lt!583883) (apply!1024 lt!583886 lt!583883))))

(declare-fun lt!583902 () Unit!43194)

(assert (=> b!1304598 (= lt!583902 lt!583893)))

(declare-fun lt!583903 () ListLongMap!20295)

(assert (=> b!1304598 (= lt!583903 (getCurrentListMapNoExtraKeys!6121 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!583895 () (_ BitVec 64))

(assert (=> b!1304598 (= lt!583895 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!583889 () (_ BitVec 64))

(assert (=> b!1304598 (= lt!583889 (select (arr!41926 _keys!1741) from!2144))))

(assert (=> b!1304598 (= lt!583900 (addApplyDifferent!566 lt!583903 lt!583895 minValue!1387 lt!583889))))

(assert (=> b!1304598 (= (apply!1024 (+!4485 lt!583903 (tuple2!22639 lt!583895 minValue!1387)) lt!583889) (apply!1024 lt!583903 lt!583889))))

(declare-fun b!1304599 () Bool)

(declare-fun res!866402 () Bool)

(declare-fun e!744154 () Bool)

(assert (=> b!1304599 (=> (not res!866402) (not e!744154))))

(declare-fun e!744142 () Bool)

(assert (=> b!1304599 (= res!866402 e!744142)))

(declare-fun res!866407 () Bool)

(assert (=> b!1304599 (=> res!866407 e!744142)))

(declare-fun e!744145 () Bool)

(assert (=> b!1304599 (= res!866407 (not e!744145))))

(declare-fun res!866408 () Bool)

(assert (=> b!1304599 (=> (not res!866408) (not e!744145))))

(assert (=> b!1304599 (= res!866408 (bvslt from!2144 (size!42476 _keys!1741)))))

(declare-fun b!1304600 () Bool)

(declare-fun e!744149 () Bool)

(assert (=> b!1304600 (= e!744142 e!744149)))

(declare-fun res!866409 () Bool)

(assert (=> b!1304600 (=> (not res!866409) (not e!744149))))

(declare-fun lt!583885 () ListLongMap!20295)

(assert (=> b!1304600 (= res!866409 (contains!8303 lt!583885 (select (arr!41926 _keys!1741) from!2144)))))

(assert (=> b!1304600 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42476 _keys!1741)))))

(declare-fun b!1304601 () Bool)

(declare-fun e!744151 () Bool)

(assert (=> b!1304601 (= e!744151 (= (apply!1024 lt!583885 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun b!1304602 () Bool)

(declare-fun e!744146 () Bool)

(assert (=> b!1304602 (= e!744146 (validKeyInArray!0 (select (arr!41926 _keys!1741) from!2144)))))

(declare-fun b!1304603 () Bool)

(declare-fun e!744152 () Bool)

(declare-fun call!64293 () Bool)

(assert (=> b!1304603 (= e!744152 (not call!64293))))

(declare-fun b!1304604 () Bool)

(declare-fun res!866405 () Bool)

(assert (=> b!1304604 (=> (not res!866405) (not e!744154))))

(assert (=> b!1304604 (= res!866405 e!744152)))

(declare-fun c!125258 () Bool)

(assert (=> b!1304604 (= c!125258 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1304605 () Bool)

(declare-fun e!744147 () Bool)

(declare-fun call!64296 () Bool)

(assert (=> b!1304605 (= e!744147 (not call!64296))))

(declare-fun b!1304606 () Bool)

(declare-fun c!125263 () Bool)

(assert (=> b!1304606 (= c!125263 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1304606 (= e!744148 e!744150)))

(declare-fun bm!64290 () Bool)

(declare-fun call!64299 () ListLongMap!20295)

(assert (=> bm!64290 (= call!64299 (getCurrentListMapNoExtraKeys!6121 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1304607 () Bool)

(declare-fun Unit!43201 () Unit!43194)

(assert (=> b!1304607 (= e!744153 Unit!43201)))

(declare-fun d!141837 () Bool)

(assert (=> d!141837 e!744154))

(declare-fun res!866403 () Bool)

(assert (=> d!141837 (=> (not res!866403) (not e!744154))))

(assert (=> d!141837 (= res!866403 (or (bvsge from!2144 (size!42476 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42476 _keys!1741)))))))

(declare-fun lt!583884 () ListLongMap!20295)

(assert (=> d!141837 (= lt!583885 lt!583884)))

(declare-fun lt!583892 () Unit!43194)

(assert (=> d!141837 (= lt!583892 e!744153)))

(declare-fun c!125259 () Bool)

(assert (=> d!141837 (= c!125259 e!744146)))

(declare-fun res!866401 () Bool)

(assert (=> d!141837 (=> (not res!866401) (not e!744146))))

(assert (=> d!141837 (= res!866401 (bvslt from!2144 (size!42476 _keys!1741)))))

(assert (=> d!141837 (= lt!583884 e!744143)))

(declare-fun c!125261 () Bool)

(assert (=> d!141837 (= c!125261 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!141837 (validMask!0 mask!2175)))

(assert (=> d!141837 (= (getCurrentListMap!5181 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!583885)))

(declare-fun bm!64291 () Bool)

(declare-fun call!64298 () ListLongMap!20295)

(declare-fun call!64297 () ListLongMap!20295)

(assert (=> bm!64291 (= call!64298 call!64297)))

(declare-fun b!1304608 () Bool)

(assert (=> b!1304608 (= e!744145 (validKeyInArray!0 (select (arr!41926 _keys!1741) from!2144)))))

(declare-fun b!1304609 () Bool)

(assert (=> b!1304609 (= e!744149 (= (apply!1024 lt!583885 (select (arr!41926 _keys!1741) from!2144)) (get!21177 (select (arr!41925 _values!1445) from!2144) (dynLambda!3431 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1304609 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42475 _values!1445)))))

(assert (=> b!1304609 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42476 _keys!1741)))))

(declare-fun b!1304610 () Bool)

(assert (=> b!1304610 (= e!744150 call!64298)))

(declare-fun call!64295 () ListLongMap!20295)

(declare-fun bm!64292 () Bool)

(assert (=> bm!64292 (= call!64295 (+!4485 (ite c!125261 call!64299 (ite c!125262 call!64297 call!64298)) (ite (or c!125261 c!125262) (tuple2!22639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun bm!64293 () Bool)

(assert (=> bm!64293 (= call!64296 (contains!8303 lt!583885 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1304611 () Bool)

(assert (=> b!1304611 (= e!744147 e!744151)))

(declare-fun res!866406 () Bool)

(assert (=> b!1304611 (= res!866406 call!64296)))

(assert (=> b!1304611 (=> (not res!866406) (not e!744151))))

(declare-fun b!1304612 () Bool)

(assert (=> b!1304612 (= e!744143 (+!4485 call!64295 (tuple2!22639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun bm!64294 () Bool)

(assert (=> bm!64294 (= call!64297 call!64299)))

(declare-fun b!1304613 () Bool)

(declare-fun e!744144 () Bool)

(assert (=> b!1304613 (= e!744152 e!744144)))

(declare-fun res!866404 () Bool)

(assert (=> b!1304613 (= res!866404 call!64293)))

(assert (=> b!1304613 (=> (not res!866404) (not e!744144))))

(declare-fun b!1304614 () Bool)

(assert (=> b!1304614 (= e!744144 (= (apply!1024 lt!583885 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun bm!64295 () Bool)

(assert (=> bm!64295 (= call!64293 (contains!8303 lt!583885 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!64296 () Bool)

(assert (=> bm!64296 (= call!64294 call!64295)))

(declare-fun b!1304615 () Bool)

(assert (=> b!1304615 (= e!744154 e!744147)))

(declare-fun c!125260 () Bool)

(assert (=> b!1304615 (= c!125260 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!141837 c!125261) b!1304612))

(assert (= (and d!141837 (not c!125261)) b!1304596))

(assert (= (and b!1304596 c!125262) b!1304597))

(assert (= (and b!1304596 (not c!125262)) b!1304606))

(assert (= (and b!1304606 c!125263) b!1304595))

(assert (= (and b!1304606 (not c!125263)) b!1304610))

(assert (= (or b!1304595 b!1304610) bm!64291))

(assert (= (or b!1304597 bm!64291) bm!64294))

(assert (= (or b!1304597 b!1304595) bm!64296))

(assert (= (or b!1304612 bm!64294) bm!64290))

(assert (= (or b!1304612 bm!64296) bm!64292))

(assert (= (and d!141837 res!866401) b!1304602))

(assert (= (and d!141837 c!125259) b!1304598))

(assert (= (and d!141837 (not c!125259)) b!1304607))

(assert (= (and d!141837 res!866403) b!1304599))

(assert (= (and b!1304599 res!866408) b!1304608))

(assert (= (and b!1304599 (not res!866407)) b!1304600))

(assert (= (and b!1304600 res!866409) b!1304609))

(assert (= (and b!1304599 res!866402) b!1304604))

(assert (= (and b!1304604 c!125258) b!1304613))

(assert (= (and b!1304604 (not c!125258)) b!1304603))

(assert (= (and b!1304613 res!866404) b!1304614))

(assert (= (or b!1304613 b!1304603) bm!64295))

(assert (= (and b!1304604 res!866405) b!1304615))

(assert (= (and b!1304615 c!125260) b!1304611))

(assert (= (and b!1304615 (not c!125260)) b!1304605))

(assert (= (and b!1304611 res!866406) b!1304601))

(assert (= (or b!1304611 b!1304605) bm!64293))

(declare-fun b_lambda!23311 () Bool)

(assert (=> (not b_lambda!23311) (not b!1304609)))

(assert (=> b!1304609 t!43361))

(declare-fun b_and!47477 () Bool)

(assert (= b_and!47475 (and (=> t!43361 result!23831) b_and!47477)))

(declare-fun m!1195505 () Bool)

(assert (=> b!1304601 m!1195505))

(assert (=> d!141837 m!1195399))

(assert (=> b!1304602 m!1195387))

(assert (=> b!1304602 m!1195387))

(assert (=> b!1304602 m!1195389))

(declare-fun m!1195507 () Bool)

(assert (=> bm!64293 m!1195507))

(assert (=> b!1304608 m!1195387))

(assert (=> b!1304608 m!1195387))

(assert (=> b!1304608 m!1195389))

(declare-fun m!1195509 () Bool)

(assert (=> bm!64292 m!1195509))

(declare-fun m!1195511 () Bool)

(assert (=> b!1304612 m!1195511))

(declare-fun m!1195513 () Bool)

(assert (=> bm!64295 m!1195513))

(declare-fun m!1195515 () Bool)

(assert (=> b!1304614 m!1195515))

(declare-fun m!1195517 () Bool)

(assert (=> b!1304598 m!1195517))

(declare-fun m!1195519 () Bool)

(assert (=> b!1304598 m!1195519))

(assert (=> b!1304598 m!1195391))

(declare-fun m!1195521 () Bool)

(assert (=> b!1304598 m!1195521))

(declare-fun m!1195523 () Bool)

(assert (=> b!1304598 m!1195523))

(declare-fun m!1195525 () Bool)

(assert (=> b!1304598 m!1195525))

(declare-fun m!1195527 () Bool)

(assert (=> b!1304598 m!1195527))

(declare-fun m!1195529 () Bool)

(assert (=> b!1304598 m!1195529))

(assert (=> b!1304598 m!1195527))

(declare-fun m!1195531 () Bool)

(assert (=> b!1304598 m!1195531))

(declare-fun m!1195533 () Bool)

(assert (=> b!1304598 m!1195533))

(assert (=> b!1304598 m!1195523))

(assert (=> b!1304598 m!1195387))

(declare-fun m!1195535 () Bool)

(assert (=> b!1304598 m!1195535))

(declare-fun m!1195537 () Bool)

(assert (=> b!1304598 m!1195537))

(declare-fun m!1195539 () Bool)

(assert (=> b!1304598 m!1195539))

(declare-fun m!1195541 () Bool)

(assert (=> b!1304598 m!1195541))

(declare-fun m!1195543 () Bool)

(assert (=> b!1304598 m!1195543))

(assert (=> b!1304598 m!1195531))

(declare-fun m!1195545 () Bool)

(assert (=> b!1304598 m!1195545))

(assert (=> b!1304598 m!1195517))

(assert (=> b!1304600 m!1195387))

(assert (=> b!1304600 m!1195387))

(declare-fun m!1195547 () Bool)

(assert (=> b!1304600 m!1195547))

(assert (=> b!1304609 m!1195479))

(assert (=> b!1304609 m!1195477))

(assert (=> b!1304609 m!1195387))

(assert (=> b!1304609 m!1195387))

(declare-fun m!1195549 () Bool)

(assert (=> b!1304609 m!1195549))

(assert (=> b!1304609 m!1195477))

(assert (=> b!1304609 m!1195479))

(assert (=> b!1304609 m!1195481))

(assert (=> bm!64290 m!1195391))

(assert (=> b!1304430 d!141837))

(declare-fun condMapEmpty!53999 () Bool)

(declare-fun mapDefault!53999 () ValueCell!16566)

(assert (=> mapNonEmpty!53993 (= condMapEmpty!53999 (= mapRest!53993 ((as const (Array (_ BitVec 32) ValueCell!16566)) mapDefault!53999)))))

(declare-fun e!744160 () Bool)

(declare-fun mapRes!53999 () Bool)

(assert (=> mapNonEmpty!53993 (= tp!103025 (and e!744160 mapRes!53999))))

(declare-fun b!1304622 () Bool)

(declare-fun e!744159 () Bool)

(assert (=> b!1304622 (= e!744159 tp_is_empty!34929)))

(declare-fun mapIsEmpty!53999 () Bool)

(assert (=> mapIsEmpty!53999 mapRes!53999))

(declare-fun b!1304623 () Bool)

(assert (=> b!1304623 (= e!744160 tp_is_empty!34929)))

(declare-fun mapNonEmpty!53999 () Bool)

(declare-fun tp!103034 () Bool)

(assert (=> mapNonEmpty!53999 (= mapRes!53999 (and tp!103034 e!744159))))

(declare-fun mapKey!53999 () (_ BitVec 32))

(declare-fun mapValue!53999 () ValueCell!16566)

(declare-fun mapRest!53999 () (Array (_ BitVec 32) ValueCell!16566))

(assert (=> mapNonEmpty!53999 (= mapRest!53993 (store mapRest!53999 mapKey!53999 mapValue!53999))))

(assert (= (and mapNonEmpty!53993 condMapEmpty!53999) mapIsEmpty!53999))

(assert (= (and mapNonEmpty!53993 (not condMapEmpty!53999)) mapNonEmpty!53999))

(assert (= (and mapNonEmpty!53999 ((_ is ValueCellFull!16566) mapValue!53999)) b!1304622))

(assert (= (and mapNonEmpty!53993 ((_ is ValueCellFull!16566) mapDefault!53999)) b!1304623))

(declare-fun m!1195551 () Bool)

(assert (=> mapNonEmpty!53999 m!1195551))

(declare-fun b_lambda!23313 () Bool)

(assert (= b_lambda!23309 (or (and start!110166 b_free!29289) b_lambda!23313)))

(declare-fun b_lambda!23315 () Bool)

(assert (= b_lambda!23307 (or (and start!110166 b_free!29289) b_lambda!23315)))

(declare-fun b_lambda!23317 () Bool)

(assert (= b_lambda!23311 (or (and start!110166 b_free!29289) b_lambda!23317)))

(check-sat (not bm!64295) (not d!141821) (not d!141835) (not b!1304522) (not b!1304609) (not bm!64290) (not b!1304521) (not bm!64275) (not b!1304496) (not b!1304494) (not b!1304550) (not b!1304598) (not b_lambda!23317) tp_is_empty!34929 (not b!1304548) (not b!1304552) (not d!141819) (not b!1304608) (not b!1304491) (not b!1304612) (not b_next!29289) (not b!1304600) (not d!141817) (not bm!64292) (not d!141837) (not b!1304549) (not b_lambda!23313) (not b!1304546) (not b!1304602) (not b!1304614) (not b_lambda!23315) (not d!141823) (not bm!64272) (not b!1304483) (not b!1304531) (not b!1304523) (not b!1304481) (not bm!64269) (not b!1304530) (not b!1304493) (not mapNonEmpty!53999) (not b!1304524) (not b!1304529) (not bm!64293) (not b!1304527) (not b!1304601) b_and!47477)
(check-sat b_and!47477 (not b_next!29289))
(get-model)

(declare-fun d!141839 () Bool)

(declare-fun e!744161 () Bool)

(assert (=> d!141839 e!744161))

(declare-fun res!866410 () Bool)

(assert (=> d!141839 (=> res!866410 e!744161)))

(declare-fun lt!583907 () Bool)

(assert (=> d!141839 (= res!866410 (not lt!583907))))

(declare-fun lt!583908 () Bool)

(assert (=> d!141839 (= lt!583907 lt!583908)))

(declare-fun lt!583906 () Unit!43194)

(declare-fun e!744162 () Unit!43194)

(assert (=> d!141839 (= lt!583906 e!744162)))

(declare-fun c!125264 () Bool)

(assert (=> d!141839 (= c!125264 lt!583908)))

(assert (=> d!141839 (= lt!583908 (containsKey!729 (toList!10163 lt!583885) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!141839 (= (contains!8303 lt!583885 #b0000000000000000000000000000000000000000000000000000000000000000) lt!583907)))

(declare-fun b!1304624 () Bool)

(declare-fun lt!583905 () Unit!43194)

(assert (=> b!1304624 (= e!744162 lt!583905)))

(assert (=> b!1304624 (= lt!583905 (lemmaContainsKeyImpliesGetValueByKeyDefined!475 (toList!10163 lt!583885) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1304624 (isDefined!514 (getValueByKey!707 (toList!10163 lt!583885) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1304625 () Bool)

(declare-fun Unit!43202 () Unit!43194)

(assert (=> b!1304625 (= e!744162 Unit!43202)))

(declare-fun b!1304626 () Bool)

(assert (=> b!1304626 (= e!744161 (isDefined!514 (getValueByKey!707 (toList!10163 lt!583885) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141839 c!125264) b!1304624))

(assert (= (and d!141839 (not c!125264)) b!1304625))

(assert (= (and d!141839 (not res!866410)) b!1304626))

(declare-fun m!1195553 () Bool)

(assert (=> d!141839 m!1195553))

(declare-fun m!1195555 () Bool)

(assert (=> b!1304624 m!1195555))

(declare-fun m!1195557 () Bool)

(assert (=> b!1304624 m!1195557))

(assert (=> b!1304624 m!1195557))

(declare-fun m!1195559 () Bool)

(assert (=> b!1304624 m!1195559))

(assert (=> b!1304626 m!1195557))

(assert (=> b!1304626 m!1195557))

(assert (=> b!1304626 m!1195559))

(assert (=> bm!64295 d!141839))

(declare-fun d!141841 () Bool)

(declare-fun get!21178 (Option!759) V!51675)

(assert (=> d!141841 (= (apply!1024 lt!583885 #b0000000000000000000000000000000000000000000000000000000000000000) (get!21178 (getValueByKey!707 (toList!10163 lt!583885) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37153 () Bool)

(assert (= bs!37153 d!141841))

(assert (=> bs!37153 m!1195557))

(assert (=> bs!37153 m!1195557))

(declare-fun m!1195561 () Bool)

(assert (=> bs!37153 m!1195561))

(assert (=> b!1304614 d!141841))

(declare-fun d!141843 () Bool)

(assert (=> d!141843 (= (apply!1024 lt!583903 lt!583889) (get!21178 (getValueByKey!707 (toList!10163 lt!583903) lt!583889)))))

(declare-fun bs!37154 () Bool)

(assert (= bs!37154 d!141843))

(declare-fun m!1195563 () Bool)

(assert (=> bs!37154 m!1195563))

(assert (=> bs!37154 m!1195563))

(declare-fun m!1195565 () Bool)

(assert (=> bs!37154 m!1195565))

(assert (=> b!1304598 d!141843))

(declare-fun d!141845 () Bool)

(assert (=> d!141845 (= (apply!1024 (+!4485 lt!583886 (tuple2!22639 lt!583896 zeroValue!1387)) lt!583883) (apply!1024 lt!583886 lt!583883))))

(declare-fun lt!583911 () Unit!43194)

(declare-fun choose!1929 (ListLongMap!20295 (_ BitVec 64) V!51675 (_ BitVec 64)) Unit!43194)

(assert (=> d!141845 (= lt!583911 (choose!1929 lt!583886 lt!583896 zeroValue!1387 lt!583883))))

(declare-fun e!744165 () Bool)

(assert (=> d!141845 e!744165))

(declare-fun res!866413 () Bool)

(assert (=> d!141845 (=> (not res!866413) (not e!744165))))

(assert (=> d!141845 (= res!866413 (contains!8303 lt!583886 lt!583883))))

(assert (=> d!141845 (= (addApplyDifferent!566 lt!583886 lt!583896 zeroValue!1387 lt!583883) lt!583911)))

(declare-fun b!1304630 () Bool)

(assert (=> b!1304630 (= e!744165 (not (= lt!583883 lt!583896)))))

(assert (= (and d!141845 res!866413) b!1304630))

(declare-fun m!1195567 () Bool)

(assert (=> d!141845 m!1195567))

(assert (=> d!141845 m!1195537))

(assert (=> d!141845 m!1195527))

(assert (=> d!141845 m!1195529))

(declare-fun m!1195569 () Bool)

(assert (=> d!141845 m!1195569))

(assert (=> d!141845 m!1195527))

(assert (=> b!1304598 d!141845))

(declare-fun d!141847 () Bool)

(declare-fun e!744168 () Bool)

(assert (=> d!141847 e!744168))

(declare-fun res!866418 () Bool)

(assert (=> d!141847 (=> (not res!866418) (not e!744168))))

(declare-fun lt!583923 () ListLongMap!20295)

(assert (=> d!141847 (= res!866418 (contains!8303 lt!583923 (_1!11330 (tuple2!22639 lt!583896 zeroValue!1387))))))

(declare-fun lt!583920 () List!29758)

(assert (=> d!141847 (= lt!583923 (ListLongMap!20296 lt!583920))))

(declare-fun lt!583921 () Unit!43194)

(declare-fun lt!583922 () Unit!43194)

(assert (=> d!141847 (= lt!583921 lt!583922)))

(assert (=> d!141847 (= (getValueByKey!707 lt!583920 (_1!11330 (tuple2!22639 lt!583896 zeroValue!1387))) (Some!758 (_2!11330 (tuple2!22639 lt!583896 zeroValue!1387))))))

(declare-fun lemmaContainsTupThenGetReturnValue!353 (List!29758 (_ BitVec 64) V!51675) Unit!43194)

(assert (=> d!141847 (= lt!583922 (lemmaContainsTupThenGetReturnValue!353 lt!583920 (_1!11330 (tuple2!22639 lt!583896 zeroValue!1387)) (_2!11330 (tuple2!22639 lt!583896 zeroValue!1387))))))

(declare-fun insertStrictlySorted!482 (List!29758 (_ BitVec 64) V!51675) List!29758)

(assert (=> d!141847 (= lt!583920 (insertStrictlySorted!482 (toList!10163 lt!583886) (_1!11330 (tuple2!22639 lt!583896 zeroValue!1387)) (_2!11330 (tuple2!22639 lt!583896 zeroValue!1387))))))

(assert (=> d!141847 (= (+!4485 lt!583886 (tuple2!22639 lt!583896 zeroValue!1387)) lt!583923)))

(declare-fun b!1304635 () Bool)

(declare-fun res!866419 () Bool)

(assert (=> b!1304635 (=> (not res!866419) (not e!744168))))

(assert (=> b!1304635 (= res!866419 (= (getValueByKey!707 (toList!10163 lt!583923) (_1!11330 (tuple2!22639 lt!583896 zeroValue!1387))) (Some!758 (_2!11330 (tuple2!22639 lt!583896 zeroValue!1387)))))))

(declare-fun b!1304636 () Bool)

(declare-fun contains!8306 (List!29758 tuple2!22638) Bool)

(assert (=> b!1304636 (= e!744168 (contains!8306 (toList!10163 lt!583923) (tuple2!22639 lt!583896 zeroValue!1387)))))

(assert (= (and d!141847 res!866418) b!1304635))

(assert (= (and b!1304635 res!866419) b!1304636))

(declare-fun m!1195571 () Bool)

(assert (=> d!141847 m!1195571))

(declare-fun m!1195573 () Bool)

(assert (=> d!141847 m!1195573))

(declare-fun m!1195575 () Bool)

(assert (=> d!141847 m!1195575))

(declare-fun m!1195577 () Bool)

(assert (=> d!141847 m!1195577))

(declare-fun m!1195579 () Bool)

(assert (=> b!1304635 m!1195579))

(declare-fun m!1195581 () Bool)

(assert (=> b!1304636 m!1195581))

(assert (=> b!1304598 d!141847))

(declare-fun d!141849 () Bool)

(assert (=> d!141849 (= (apply!1024 (+!4485 lt!583886 (tuple2!22639 lt!583896 zeroValue!1387)) lt!583883) (get!21178 (getValueByKey!707 (toList!10163 (+!4485 lt!583886 (tuple2!22639 lt!583896 zeroValue!1387))) lt!583883)))))

(declare-fun bs!37155 () Bool)

(assert (= bs!37155 d!141849))

(declare-fun m!1195583 () Bool)

(assert (=> bs!37155 m!1195583))

(assert (=> bs!37155 m!1195583))

(declare-fun m!1195585 () Bool)

(assert (=> bs!37155 m!1195585))

(assert (=> b!1304598 d!141849))

(assert (=> b!1304598 d!141823))

(declare-fun d!141851 () Bool)

(assert (=> d!141851 (= (apply!1024 lt!583886 lt!583883) (get!21178 (getValueByKey!707 (toList!10163 lt!583886) lt!583883)))))

(declare-fun bs!37156 () Bool)

(assert (= bs!37156 d!141851))

(declare-fun m!1195587 () Bool)

(assert (=> bs!37156 m!1195587))

(assert (=> bs!37156 m!1195587))

(declare-fun m!1195589 () Bool)

(assert (=> bs!37156 m!1195589))

(assert (=> b!1304598 d!141851))

(declare-fun d!141853 () Bool)

(declare-fun e!744169 () Bool)

(assert (=> d!141853 e!744169))

(declare-fun res!866420 () Bool)

(assert (=> d!141853 (=> (not res!866420) (not e!744169))))

(declare-fun lt!583927 () ListLongMap!20295)

(assert (=> d!141853 (= res!866420 (contains!8303 lt!583927 (_1!11330 (tuple2!22639 lt!583890 zeroValue!1387))))))

(declare-fun lt!583924 () List!29758)

(assert (=> d!141853 (= lt!583927 (ListLongMap!20296 lt!583924))))

(declare-fun lt!583925 () Unit!43194)

(declare-fun lt!583926 () Unit!43194)

(assert (=> d!141853 (= lt!583925 lt!583926)))

(assert (=> d!141853 (= (getValueByKey!707 lt!583924 (_1!11330 (tuple2!22639 lt!583890 zeroValue!1387))) (Some!758 (_2!11330 (tuple2!22639 lt!583890 zeroValue!1387))))))

(assert (=> d!141853 (= lt!583926 (lemmaContainsTupThenGetReturnValue!353 lt!583924 (_1!11330 (tuple2!22639 lt!583890 zeroValue!1387)) (_2!11330 (tuple2!22639 lt!583890 zeroValue!1387))))))

(assert (=> d!141853 (= lt!583924 (insertStrictlySorted!482 (toList!10163 lt!583904) (_1!11330 (tuple2!22639 lt!583890 zeroValue!1387)) (_2!11330 (tuple2!22639 lt!583890 zeroValue!1387))))))

(assert (=> d!141853 (= (+!4485 lt!583904 (tuple2!22639 lt!583890 zeroValue!1387)) lt!583927)))

(declare-fun b!1304637 () Bool)

(declare-fun res!866421 () Bool)

(assert (=> b!1304637 (=> (not res!866421) (not e!744169))))

(assert (=> b!1304637 (= res!866421 (= (getValueByKey!707 (toList!10163 lt!583927) (_1!11330 (tuple2!22639 lt!583890 zeroValue!1387))) (Some!758 (_2!11330 (tuple2!22639 lt!583890 zeroValue!1387)))))))

(declare-fun b!1304638 () Bool)

(assert (=> b!1304638 (= e!744169 (contains!8306 (toList!10163 lt!583927) (tuple2!22639 lt!583890 zeroValue!1387)))))

(assert (= (and d!141853 res!866420) b!1304637))

(assert (= (and b!1304637 res!866421) b!1304638))

(declare-fun m!1195591 () Bool)

(assert (=> d!141853 m!1195591))

(declare-fun m!1195593 () Bool)

(assert (=> d!141853 m!1195593))

(declare-fun m!1195595 () Bool)

(assert (=> d!141853 m!1195595))

(declare-fun m!1195597 () Bool)

(assert (=> d!141853 m!1195597))

(declare-fun m!1195599 () Bool)

(assert (=> b!1304637 m!1195599))

(declare-fun m!1195601 () Bool)

(assert (=> b!1304638 m!1195601))

(assert (=> b!1304598 d!141853))

(declare-fun d!141855 () Bool)

(assert (=> d!141855 (= (apply!1024 (+!4485 lt!583888 (tuple2!22639 lt!583887 minValue!1387)) lt!583901) (apply!1024 lt!583888 lt!583901))))

(declare-fun lt!583928 () Unit!43194)

(assert (=> d!141855 (= lt!583928 (choose!1929 lt!583888 lt!583887 minValue!1387 lt!583901))))

(declare-fun e!744170 () Bool)

(assert (=> d!141855 e!744170))

(declare-fun res!866422 () Bool)

(assert (=> d!141855 (=> (not res!866422) (not e!744170))))

(assert (=> d!141855 (= res!866422 (contains!8303 lt!583888 lt!583901))))

(assert (=> d!141855 (= (addApplyDifferent!566 lt!583888 lt!583887 minValue!1387 lt!583901) lt!583928)))

(declare-fun b!1304639 () Bool)

(assert (=> b!1304639 (= e!744170 (not (= lt!583901 lt!583887)))))

(assert (= (and d!141855 res!866422) b!1304639))

(declare-fun m!1195603 () Bool)

(assert (=> d!141855 m!1195603))

(assert (=> d!141855 m!1195539))

(assert (=> d!141855 m!1195517))

(assert (=> d!141855 m!1195519))

(declare-fun m!1195605 () Bool)

(assert (=> d!141855 m!1195605))

(assert (=> d!141855 m!1195517))

(assert (=> b!1304598 d!141855))

(declare-fun d!141857 () Bool)

(declare-fun e!744171 () Bool)

(assert (=> d!141857 e!744171))

(declare-fun res!866423 () Bool)

(assert (=> d!141857 (=> res!866423 e!744171)))

(declare-fun lt!583931 () Bool)

(assert (=> d!141857 (= res!866423 (not lt!583931))))

(declare-fun lt!583932 () Bool)

(assert (=> d!141857 (= lt!583931 lt!583932)))

(declare-fun lt!583930 () Unit!43194)

(declare-fun e!744172 () Unit!43194)

(assert (=> d!141857 (= lt!583930 e!744172)))

(declare-fun c!125265 () Bool)

(assert (=> d!141857 (= c!125265 lt!583932)))

(assert (=> d!141857 (= lt!583932 (containsKey!729 (toList!10163 (+!4485 lt!583904 (tuple2!22639 lt!583890 zeroValue!1387))) lt!583891))))

(assert (=> d!141857 (= (contains!8303 (+!4485 lt!583904 (tuple2!22639 lt!583890 zeroValue!1387)) lt!583891) lt!583931)))

(declare-fun b!1304640 () Bool)

(declare-fun lt!583929 () Unit!43194)

(assert (=> b!1304640 (= e!744172 lt!583929)))

(assert (=> b!1304640 (= lt!583929 (lemmaContainsKeyImpliesGetValueByKeyDefined!475 (toList!10163 (+!4485 lt!583904 (tuple2!22639 lt!583890 zeroValue!1387))) lt!583891))))

(assert (=> b!1304640 (isDefined!514 (getValueByKey!707 (toList!10163 (+!4485 lt!583904 (tuple2!22639 lt!583890 zeroValue!1387))) lt!583891))))

(declare-fun b!1304641 () Bool)

(declare-fun Unit!43203 () Unit!43194)

(assert (=> b!1304641 (= e!744172 Unit!43203)))

(declare-fun b!1304642 () Bool)

(assert (=> b!1304642 (= e!744171 (isDefined!514 (getValueByKey!707 (toList!10163 (+!4485 lt!583904 (tuple2!22639 lt!583890 zeroValue!1387))) lt!583891)))))

(assert (= (and d!141857 c!125265) b!1304640))

(assert (= (and d!141857 (not c!125265)) b!1304641))

(assert (= (and d!141857 (not res!866423)) b!1304642))

(declare-fun m!1195607 () Bool)

(assert (=> d!141857 m!1195607))

(declare-fun m!1195609 () Bool)

(assert (=> b!1304640 m!1195609))

(declare-fun m!1195611 () Bool)

(assert (=> b!1304640 m!1195611))

(assert (=> b!1304640 m!1195611))

(declare-fun m!1195613 () Bool)

(assert (=> b!1304640 m!1195613))

(assert (=> b!1304642 m!1195611))

(assert (=> b!1304642 m!1195611))

(assert (=> b!1304642 m!1195613))

(assert (=> b!1304598 d!141857))

(declare-fun d!141859 () Bool)

(assert (=> d!141859 (contains!8303 (+!4485 lt!583904 (tuple2!22639 lt!583890 zeroValue!1387)) lt!583891)))

(declare-fun lt!583935 () Unit!43194)

(declare-fun choose!1930 (ListLongMap!20295 (_ BitVec 64) V!51675 (_ BitVec 64)) Unit!43194)

(assert (=> d!141859 (= lt!583935 (choose!1930 lt!583904 lt!583890 zeroValue!1387 lt!583891))))

(assert (=> d!141859 (contains!8303 lt!583904 lt!583891)))

(assert (=> d!141859 (= (addStillContains!1112 lt!583904 lt!583890 zeroValue!1387 lt!583891) lt!583935)))

(declare-fun bs!37157 () Bool)

(assert (= bs!37157 d!141859))

(assert (=> bs!37157 m!1195523))

(assert (=> bs!37157 m!1195523))

(assert (=> bs!37157 m!1195525))

(declare-fun m!1195615 () Bool)

(assert (=> bs!37157 m!1195615))

(declare-fun m!1195617 () Bool)

(assert (=> bs!37157 m!1195617))

(assert (=> b!1304598 d!141859))

(declare-fun d!141861 () Bool)

(declare-fun e!744173 () Bool)

(assert (=> d!141861 e!744173))

(declare-fun res!866424 () Bool)

(assert (=> d!141861 (=> (not res!866424) (not e!744173))))

(declare-fun lt!583939 () ListLongMap!20295)

(assert (=> d!141861 (= res!866424 (contains!8303 lt!583939 (_1!11330 (tuple2!22639 lt!583887 minValue!1387))))))

(declare-fun lt!583936 () List!29758)

(assert (=> d!141861 (= lt!583939 (ListLongMap!20296 lt!583936))))

(declare-fun lt!583937 () Unit!43194)

(declare-fun lt!583938 () Unit!43194)

(assert (=> d!141861 (= lt!583937 lt!583938)))

(assert (=> d!141861 (= (getValueByKey!707 lt!583936 (_1!11330 (tuple2!22639 lt!583887 minValue!1387))) (Some!758 (_2!11330 (tuple2!22639 lt!583887 minValue!1387))))))

(assert (=> d!141861 (= lt!583938 (lemmaContainsTupThenGetReturnValue!353 lt!583936 (_1!11330 (tuple2!22639 lt!583887 minValue!1387)) (_2!11330 (tuple2!22639 lt!583887 minValue!1387))))))

(assert (=> d!141861 (= lt!583936 (insertStrictlySorted!482 (toList!10163 lt!583888) (_1!11330 (tuple2!22639 lt!583887 minValue!1387)) (_2!11330 (tuple2!22639 lt!583887 minValue!1387))))))

(assert (=> d!141861 (= (+!4485 lt!583888 (tuple2!22639 lt!583887 minValue!1387)) lt!583939)))

(declare-fun b!1304644 () Bool)

(declare-fun res!866425 () Bool)

(assert (=> b!1304644 (=> (not res!866425) (not e!744173))))

(assert (=> b!1304644 (= res!866425 (= (getValueByKey!707 (toList!10163 lt!583939) (_1!11330 (tuple2!22639 lt!583887 minValue!1387))) (Some!758 (_2!11330 (tuple2!22639 lt!583887 minValue!1387)))))))

(declare-fun b!1304645 () Bool)

(assert (=> b!1304645 (= e!744173 (contains!8306 (toList!10163 lt!583939) (tuple2!22639 lt!583887 minValue!1387)))))

(assert (= (and d!141861 res!866424) b!1304644))

(assert (= (and b!1304644 res!866425) b!1304645))

(declare-fun m!1195619 () Bool)

(assert (=> d!141861 m!1195619))

(declare-fun m!1195621 () Bool)

(assert (=> d!141861 m!1195621))

(declare-fun m!1195623 () Bool)

(assert (=> d!141861 m!1195623))

(declare-fun m!1195625 () Bool)

(assert (=> d!141861 m!1195625))

(declare-fun m!1195627 () Bool)

(assert (=> b!1304644 m!1195627))

(declare-fun m!1195629 () Bool)

(assert (=> b!1304645 m!1195629))

(assert (=> b!1304598 d!141861))

(declare-fun d!141863 () Bool)

(assert (=> d!141863 (= (apply!1024 (+!4485 lt!583903 (tuple2!22639 lt!583895 minValue!1387)) lt!583889) (get!21178 (getValueByKey!707 (toList!10163 (+!4485 lt!583903 (tuple2!22639 lt!583895 minValue!1387))) lt!583889)))))

(declare-fun bs!37158 () Bool)

(assert (= bs!37158 d!141863))

(declare-fun m!1195631 () Bool)

(assert (=> bs!37158 m!1195631))

(assert (=> bs!37158 m!1195631))

(declare-fun m!1195633 () Bool)

(assert (=> bs!37158 m!1195633))

(assert (=> b!1304598 d!141863))

(declare-fun d!141865 () Bool)

(assert (=> d!141865 (= (apply!1024 lt!583888 lt!583901) (get!21178 (getValueByKey!707 (toList!10163 lt!583888) lt!583901)))))

(declare-fun bs!37159 () Bool)

(assert (= bs!37159 d!141865))

(declare-fun m!1195635 () Bool)

(assert (=> bs!37159 m!1195635))

(assert (=> bs!37159 m!1195635))

(declare-fun m!1195637 () Bool)

(assert (=> bs!37159 m!1195637))

(assert (=> b!1304598 d!141865))

(declare-fun d!141867 () Bool)

(assert (=> d!141867 (= (apply!1024 (+!4485 lt!583903 (tuple2!22639 lt!583895 minValue!1387)) lt!583889) (apply!1024 lt!583903 lt!583889))))

(declare-fun lt!583940 () Unit!43194)

(assert (=> d!141867 (= lt!583940 (choose!1929 lt!583903 lt!583895 minValue!1387 lt!583889))))

(declare-fun e!744174 () Bool)

(assert (=> d!141867 e!744174))

(declare-fun res!866426 () Bool)

(assert (=> d!141867 (=> (not res!866426) (not e!744174))))

(assert (=> d!141867 (= res!866426 (contains!8303 lt!583903 lt!583889))))

(assert (=> d!141867 (= (addApplyDifferent!566 lt!583903 lt!583895 minValue!1387 lt!583889) lt!583940)))

(declare-fun b!1304646 () Bool)

(assert (=> b!1304646 (= e!744174 (not (= lt!583889 lt!583895)))))

(assert (= (and d!141867 res!866426) b!1304646))

(declare-fun m!1195639 () Bool)

(assert (=> d!141867 m!1195639))

(assert (=> d!141867 m!1195541))

(assert (=> d!141867 m!1195531))

(assert (=> d!141867 m!1195533))

(declare-fun m!1195641 () Bool)

(assert (=> d!141867 m!1195641))

(assert (=> d!141867 m!1195531))

(assert (=> b!1304598 d!141867))

(declare-fun d!141869 () Bool)

(assert (=> d!141869 (= (apply!1024 (+!4485 lt!583888 (tuple2!22639 lt!583887 minValue!1387)) lt!583901) (get!21178 (getValueByKey!707 (toList!10163 (+!4485 lt!583888 (tuple2!22639 lt!583887 minValue!1387))) lt!583901)))))

(declare-fun bs!37160 () Bool)

(assert (= bs!37160 d!141869))

(declare-fun m!1195643 () Bool)

(assert (=> bs!37160 m!1195643))

(assert (=> bs!37160 m!1195643))

(declare-fun m!1195645 () Bool)

(assert (=> bs!37160 m!1195645))

(assert (=> b!1304598 d!141869))

(declare-fun d!141871 () Bool)

(declare-fun e!744175 () Bool)

(assert (=> d!141871 e!744175))

(declare-fun res!866427 () Bool)

(assert (=> d!141871 (=> (not res!866427) (not e!744175))))

(declare-fun lt!583944 () ListLongMap!20295)

(assert (=> d!141871 (= res!866427 (contains!8303 lt!583944 (_1!11330 (tuple2!22639 lt!583895 minValue!1387))))))

(declare-fun lt!583941 () List!29758)

(assert (=> d!141871 (= lt!583944 (ListLongMap!20296 lt!583941))))

(declare-fun lt!583942 () Unit!43194)

(declare-fun lt!583943 () Unit!43194)

(assert (=> d!141871 (= lt!583942 lt!583943)))

(assert (=> d!141871 (= (getValueByKey!707 lt!583941 (_1!11330 (tuple2!22639 lt!583895 minValue!1387))) (Some!758 (_2!11330 (tuple2!22639 lt!583895 minValue!1387))))))

(assert (=> d!141871 (= lt!583943 (lemmaContainsTupThenGetReturnValue!353 lt!583941 (_1!11330 (tuple2!22639 lt!583895 minValue!1387)) (_2!11330 (tuple2!22639 lt!583895 minValue!1387))))))

(assert (=> d!141871 (= lt!583941 (insertStrictlySorted!482 (toList!10163 lt!583903) (_1!11330 (tuple2!22639 lt!583895 minValue!1387)) (_2!11330 (tuple2!22639 lt!583895 minValue!1387))))))

(assert (=> d!141871 (= (+!4485 lt!583903 (tuple2!22639 lt!583895 minValue!1387)) lt!583944)))

(declare-fun b!1304647 () Bool)

(declare-fun res!866428 () Bool)

(assert (=> b!1304647 (=> (not res!866428) (not e!744175))))

(assert (=> b!1304647 (= res!866428 (= (getValueByKey!707 (toList!10163 lt!583944) (_1!11330 (tuple2!22639 lt!583895 minValue!1387))) (Some!758 (_2!11330 (tuple2!22639 lt!583895 minValue!1387)))))))

(declare-fun b!1304648 () Bool)

(assert (=> b!1304648 (= e!744175 (contains!8306 (toList!10163 lt!583944) (tuple2!22639 lt!583895 minValue!1387)))))

(assert (= (and d!141871 res!866427) b!1304647))

(assert (= (and b!1304647 res!866428) b!1304648))

(declare-fun m!1195647 () Bool)

(assert (=> d!141871 m!1195647))

(declare-fun m!1195649 () Bool)

(assert (=> d!141871 m!1195649))

(declare-fun m!1195651 () Bool)

(assert (=> d!141871 m!1195651))

(declare-fun m!1195653 () Bool)

(assert (=> d!141871 m!1195653))

(declare-fun m!1195655 () Bool)

(assert (=> b!1304647 m!1195655))

(declare-fun m!1195657 () Bool)

(assert (=> b!1304648 m!1195657))

(assert (=> b!1304598 d!141871))

(declare-fun d!141873 () Bool)

(assert (=> d!141873 (= (validKeyInArray!0 (select (arr!41926 _keys!1741) #b00000000000000000000000000000000)) (and (not (= (select (arr!41926 _keys!1741) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41926 _keys!1741) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1304483 d!141873))

(declare-fun d!141875 () Bool)

(declare-fun e!744176 () Bool)

(assert (=> d!141875 e!744176))

(declare-fun res!866429 () Bool)

(assert (=> d!141875 (=> (not res!866429) (not e!744176))))

(declare-fun lt!583948 () ListLongMap!20295)

(assert (=> d!141875 (= res!866429 (contains!8303 lt!583948 (_1!11330 (tuple2!22639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun lt!583945 () List!29758)

(assert (=> d!141875 (= lt!583948 (ListLongMap!20296 lt!583945))))

(declare-fun lt!583946 () Unit!43194)

(declare-fun lt!583947 () Unit!43194)

(assert (=> d!141875 (= lt!583946 lt!583947)))

(assert (=> d!141875 (= (getValueByKey!707 lt!583945 (_1!11330 (tuple2!22639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!758 (_2!11330 (tuple2!22639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!141875 (= lt!583947 (lemmaContainsTupThenGetReturnValue!353 lt!583945 (_1!11330 (tuple2!22639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11330 (tuple2!22639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!141875 (= lt!583945 (insertStrictlySorted!482 (toList!10163 call!64295) (_1!11330 (tuple2!22639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11330 (tuple2!22639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!141875 (= (+!4485 call!64295 (tuple2!22639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) lt!583948)))

(declare-fun b!1304649 () Bool)

(declare-fun res!866430 () Bool)

(assert (=> b!1304649 (=> (not res!866430) (not e!744176))))

(assert (=> b!1304649 (= res!866430 (= (getValueByKey!707 (toList!10163 lt!583948) (_1!11330 (tuple2!22639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!758 (_2!11330 (tuple2!22639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1304650 () Bool)

(assert (=> b!1304650 (= e!744176 (contains!8306 (toList!10163 lt!583948) (tuple2!22639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(assert (= (and d!141875 res!866429) b!1304649))

(assert (= (and b!1304649 res!866430) b!1304650))

(declare-fun m!1195659 () Bool)

(assert (=> d!141875 m!1195659))

(declare-fun m!1195661 () Bool)

(assert (=> d!141875 m!1195661))

(declare-fun m!1195663 () Bool)

(assert (=> d!141875 m!1195663))

(declare-fun m!1195665 () Bool)

(assert (=> d!141875 m!1195665))

(declare-fun m!1195667 () Bool)

(assert (=> b!1304649 m!1195667))

(declare-fun m!1195669 () Bool)

(assert (=> b!1304650 m!1195669))

(assert (=> b!1304612 d!141875))

(assert (=> b!1304530 d!141825))

(declare-fun d!141877 () Bool)

(declare-fun isEmpty!1067 (Option!759) Bool)

(assert (=> d!141877 (= (isDefined!514 (getValueByKey!707 (toList!10163 (getCurrentListMapNoExtraKeys!6121 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)) (not (isEmpty!1067 (getValueByKey!707 (toList!10163 (getCurrentListMapNoExtraKeys!6121 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))))

(declare-fun bs!37161 () Bool)

(assert (= bs!37161 d!141877))

(assert (=> bs!37161 m!1195463))

(declare-fun m!1195671 () Bool)

(assert (=> bs!37161 m!1195671))

(assert (=> b!1304496 d!141877))

(declare-fun e!744182 () Option!759)

(declare-fun b!1304661 () Bool)

(assert (=> b!1304661 (= e!744182 (getValueByKey!707 (t!43356 (toList!10163 (getCurrentListMapNoExtraKeys!6121 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(declare-fun d!141879 () Bool)

(declare-fun c!125270 () Bool)

(assert (=> d!141879 (= c!125270 (and ((_ is Cons!29754) (toList!10163 (getCurrentListMapNoExtraKeys!6121 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11330 (h!30963 (toList!10163 (getCurrentListMapNoExtraKeys!6121 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(declare-fun e!744181 () Option!759)

(assert (=> d!141879 (= (getValueByKey!707 (toList!10163 (getCurrentListMapNoExtraKeys!6121 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!744181)))

(declare-fun b!1304660 () Bool)

(assert (=> b!1304660 (= e!744181 e!744182)))

(declare-fun c!125271 () Bool)

(assert (=> b!1304660 (= c!125271 (and ((_ is Cons!29754) (toList!10163 (getCurrentListMapNoExtraKeys!6121 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (not (= (_1!11330 (h!30963 (toList!10163 (getCurrentListMapNoExtraKeys!6121 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205))))))

(declare-fun b!1304662 () Bool)

(assert (=> b!1304662 (= e!744182 None!757)))

(declare-fun b!1304659 () Bool)

(assert (=> b!1304659 (= e!744181 (Some!758 (_2!11330 (h!30963 (toList!10163 (getCurrentListMapNoExtraKeys!6121 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))))

(assert (= (and d!141879 c!125270) b!1304659))

(assert (= (and d!141879 (not c!125270)) b!1304660))

(assert (= (and b!1304660 c!125271) b!1304661))

(assert (= (and b!1304660 (not c!125271)) b!1304662))

(declare-fun m!1195673 () Bool)

(assert (=> b!1304661 m!1195673))

(assert (=> b!1304496 d!141879))

(declare-fun d!141881 () Bool)

(assert (=> d!141881 (not (contains!8303 (+!4485 lt!583829 (tuple2!22639 lt!583830 lt!583832)) lt!583833))))

(declare-fun lt!583951 () Unit!43194)

(declare-fun choose!1931 (ListLongMap!20295 (_ BitVec 64) V!51675 (_ BitVec 64)) Unit!43194)

(assert (=> d!141881 (= lt!583951 (choose!1931 lt!583829 lt!583830 lt!583832 lt!583833))))

(declare-fun e!744185 () Bool)

(assert (=> d!141881 e!744185))

(declare-fun res!866433 () Bool)

(assert (=> d!141881 (=> (not res!866433) (not e!744185))))

(assert (=> d!141881 (= res!866433 (not (contains!8303 lt!583829 lt!583833)))))

(assert (=> d!141881 (= (addStillNotContains!482 lt!583829 lt!583830 lt!583832 lt!583833) lt!583951)))

(declare-fun b!1304666 () Bool)

(assert (=> b!1304666 (= e!744185 (not (= lt!583830 lt!583833)))))

(assert (= (and d!141881 res!866433) b!1304666))

(assert (=> d!141881 m!1195485))

(assert (=> d!141881 m!1195485))

(assert (=> d!141881 m!1195489))

(declare-fun m!1195675 () Bool)

(assert (=> d!141881 m!1195675))

(declare-fun m!1195677 () Bool)

(assert (=> d!141881 m!1195677))

(assert (=> b!1304531 d!141881))

(declare-fun d!141883 () Bool)

(declare-fun e!744186 () Bool)

(assert (=> d!141883 e!744186))

(declare-fun res!866434 () Bool)

(assert (=> d!141883 (=> (not res!866434) (not e!744186))))

(declare-fun lt!583955 () ListLongMap!20295)

(assert (=> d!141883 (= res!866434 (contains!8303 lt!583955 (_1!11330 (tuple2!22639 (select (arr!41926 _keys!1741) from!2144) (get!21177 (select (arr!41925 _values!1445) from!2144) (dynLambda!3431 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!583952 () List!29758)

(assert (=> d!141883 (= lt!583955 (ListLongMap!20296 lt!583952))))

(declare-fun lt!583953 () Unit!43194)

(declare-fun lt!583954 () Unit!43194)

(assert (=> d!141883 (= lt!583953 lt!583954)))

(assert (=> d!141883 (= (getValueByKey!707 lt!583952 (_1!11330 (tuple2!22639 (select (arr!41926 _keys!1741) from!2144) (get!21177 (select (arr!41925 _values!1445) from!2144) (dynLambda!3431 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!758 (_2!11330 (tuple2!22639 (select (arr!41926 _keys!1741) from!2144) (get!21177 (select (arr!41925 _values!1445) from!2144) (dynLambda!3431 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!141883 (= lt!583954 (lemmaContainsTupThenGetReturnValue!353 lt!583952 (_1!11330 (tuple2!22639 (select (arr!41926 _keys!1741) from!2144) (get!21177 (select (arr!41925 _values!1445) from!2144) (dynLambda!3431 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11330 (tuple2!22639 (select (arr!41926 _keys!1741) from!2144) (get!21177 (select (arr!41925 _values!1445) from!2144) (dynLambda!3431 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!141883 (= lt!583952 (insertStrictlySorted!482 (toList!10163 call!64275) (_1!11330 (tuple2!22639 (select (arr!41926 _keys!1741) from!2144) (get!21177 (select (arr!41925 _values!1445) from!2144) (dynLambda!3431 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11330 (tuple2!22639 (select (arr!41926 _keys!1741) from!2144) (get!21177 (select (arr!41925 _values!1445) from!2144) (dynLambda!3431 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!141883 (= (+!4485 call!64275 (tuple2!22639 (select (arr!41926 _keys!1741) from!2144) (get!21177 (select (arr!41925 _values!1445) from!2144) (dynLambda!3431 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!583955)))

(declare-fun b!1304667 () Bool)

(declare-fun res!866435 () Bool)

(assert (=> b!1304667 (=> (not res!866435) (not e!744186))))

(assert (=> b!1304667 (= res!866435 (= (getValueByKey!707 (toList!10163 lt!583955) (_1!11330 (tuple2!22639 (select (arr!41926 _keys!1741) from!2144) (get!21177 (select (arr!41925 _values!1445) from!2144) (dynLambda!3431 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!758 (_2!11330 (tuple2!22639 (select (arr!41926 _keys!1741) from!2144) (get!21177 (select (arr!41925 _values!1445) from!2144) (dynLambda!3431 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1304668 () Bool)

(assert (=> b!1304668 (= e!744186 (contains!8306 (toList!10163 lt!583955) (tuple2!22639 (select (arr!41926 _keys!1741) from!2144) (get!21177 (select (arr!41925 _values!1445) from!2144) (dynLambda!3431 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!141883 res!866434) b!1304667))

(assert (= (and b!1304667 res!866435) b!1304668))

(declare-fun m!1195679 () Bool)

(assert (=> d!141883 m!1195679))

(declare-fun m!1195681 () Bool)

(assert (=> d!141883 m!1195681))

(declare-fun m!1195683 () Bool)

(assert (=> d!141883 m!1195683))

(declare-fun m!1195685 () Bool)

(assert (=> d!141883 m!1195685))

(declare-fun m!1195687 () Bool)

(assert (=> b!1304667 m!1195687))

(declare-fun m!1195689 () Bool)

(assert (=> b!1304668 m!1195689))

(assert (=> b!1304531 d!141883))

(declare-fun d!141885 () Bool)

(declare-fun e!744187 () Bool)

(assert (=> d!141885 e!744187))

(declare-fun res!866436 () Bool)

(assert (=> d!141885 (=> (not res!866436) (not e!744187))))

(declare-fun lt!583959 () ListLongMap!20295)

(assert (=> d!141885 (= res!866436 (contains!8303 lt!583959 (_1!11330 (tuple2!22639 lt!583830 lt!583832))))))

(declare-fun lt!583956 () List!29758)

(assert (=> d!141885 (= lt!583959 (ListLongMap!20296 lt!583956))))

(declare-fun lt!583957 () Unit!43194)

(declare-fun lt!583958 () Unit!43194)

(assert (=> d!141885 (= lt!583957 lt!583958)))

(assert (=> d!141885 (= (getValueByKey!707 lt!583956 (_1!11330 (tuple2!22639 lt!583830 lt!583832))) (Some!758 (_2!11330 (tuple2!22639 lt!583830 lt!583832))))))

(assert (=> d!141885 (= lt!583958 (lemmaContainsTupThenGetReturnValue!353 lt!583956 (_1!11330 (tuple2!22639 lt!583830 lt!583832)) (_2!11330 (tuple2!22639 lt!583830 lt!583832))))))

(assert (=> d!141885 (= lt!583956 (insertStrictlySorted!482 (toList!10163 lt!583829) (_1!11330 (tuple2!22639 lt!583830 lt!583832)) (_2!11330 (tuple2!22639 lt!583830 lt!583832))))))

(assert (=> d!141885 (= (+!4485 lt!583829 (tuple2!22639 lt!583830 lt!583832)) lt!583959)))

(declare-fun b!1304669 () Bool)

(declare-fun res!866437 () Bool)

(assert (=> b!1304669 (=> (not res!866437) (not e!744187))))

(assert (=> b!1304669 (= res!866437 (= (getValueByKey!707 (toList!10163 lt!583959) (_1!11330 (tuple2!22639 lt!583830 lt!583832))) (Some!758 (_2!11330 (tuple2!22639 lt!583830 lt!583832)))))))

(declare-fun b!1304670 () Bool)

(assert (=> b!1304670 (= e!744187 (contains!8306 (toList!10163 lt!583959) (tuple2!22639 lt!583830 lt!583832)))))

(assert (= (and d!141885 res!866436) b!1304669))

(assert (= (and b!1304669 res!866437) b!1304670))

(declare-fun m!1195691 () Bool)

(assert (=> d!141885 m!1195691))

(declare-fun m!1195693 () Bool)

(assert (=> d!141885 m!1195693))

(declare-fun m!1195695 () Bool)

(assert (=> d!141885 m!1195695))

(declare-fun m!1195697 () Bool)

(assert (=> d!141885 m!1195697))

(declare-fun m!1195699 () Bool)

(assert (=> b!1304669 m!1195699))

(declare-fun m!1195701 () Bool)

(assert (=> b!1304670 m!1195701))

(assert (=> b!1304531 d!141885))

(declare-fun d!141887 () Bool)

(declare-fun e!744188 () Bool)

(assert (=> d!141887 e!744188))

(declare-fun res!866438 () Bool)

(assert (=> d!141887 (=> res!866438 e!744188)))

(declare-fun lt!583962 () Bool)

(assert (=> d!141887 (= res!866438 (not lt!583962))))

(declare-fun lt!583963 () Bool)

(assert (=> d!141887 (= lt!583962 lt!583963)))

(declare-fun lt!583961 () Unit!43194)

(declare-fun e!744189 () Unit!43194)

(assert (=> d!141887 (= lt!583961 e!744189)))

(declare-fun c!125272 () Bool)

(assert (=> d!141887 (= c!125272 lt!583963)))

(assert (=> d!141887 (= lt!583963 (containsKey!729 (toList!10163 (+!4485 lt!583829 (tuple2!22639 lt!583830 lt!583832))) lt!583833))))

(assert (=> d!141887 (= (contains!8303 (+!4485 lt!583829 (tuple2!22639 lt!583830 lt!583832)) lt!583833) lt!583962)))

(declare-fun b!1304671 () Bool)

(declare-fun lt!583960 () Unit!43194)

(assert (=> b!1304671 (= e!744189 lt!583960)))

(assert (=> b!1304671 (= lt!583960 (lemmaContainsKeyImpliesGetValueByKeyDefined!475 (toList!10163 (+!4485 lt!583829 (tuple2!22639 lt!583830 lt!583832))) lt!583833))))

(assert (=> b!1304671 (isDefined!514 (getValueByKey!707 (toList!10163 (+!4485 lt!583829 (tuple2!22639 lt!583830 lt!583832))) lt!583833))))

(declare-fun b!1304672 () Bool)

(declare-fun Unit!43204 () Unit!43194)

(assert (=> b!1304672 (= e!744189 Unit!43204)))

(declare-fun b!1304673 () Bool)

(assert (=> b!1304673 (= e!744188 (isDefined!514 (getValueByKey!707 (toList!10163 (+!4485 lt!583829 (tuple2!22639 lt!583830 lt!583832))) lt!583833)))))

(assert (= (and d!141887 c!125272) b!1304671))

(assert (= (and d!141887 (not c!125272)) b!1304672))

(assert (= (and d!141887 (not res!866438)) b!1304673))

(declare-fun m!1195703 () Bool)

(assert (=> d!141887 m!1195703))

(declare-fun m!1195705 () Bool)

(assert (=> b!1304671 m!1195705))

(declare-fun m!1195707 () Bool)

(assert (=> b!1304671 m!1195707))

(assert (=> b!1304671 m!1195707))

(declare-fun m!1195709 () Bool)

(assert (=> b!1304671 m!1195709))

(assert (=> b!1304673 m!1195707))

(assert (=> b!1304673 m!1195707))

(assert (=> b!1304673 m!1195709))

(assert (=> b!1304531 d!141887))

(declare-fun d!141889 () Bool)

(declare-fun c!125275 () Bool)

(assert (=> d!141889 (= c!125275 ((_ is ValueCellFull!16566) (select (arr!41925 _values!1445) from!2144)))))

(declare-fun e!744192 () V!51675)

(assert (=> d!141889 (= (get!21177 (select (arr!41925 _values!1445) from!2144) (dynLambda!3431 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)) e!744192)))

(declare-fun b!1304678 () Bool)

(declare-fun get!21179 (ValueCell!16566 V!51675) V!51675)

(assert (=> b!1304678 (= e!744192 (get!21179 (select (arr!41925 _values!1445) from!2144) (dynLambda!3431 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1304679 () Bool)

(declare-fun get!21180 (ValueCell!16566 V!51675) V!51675)

(assert (=> b!1304679 (= e!744192 (get!21180 (select (arr!41925 _values!1445) from!2144) (dynLambda!3431 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141889 c!125275) b!1304678))

(assert (= (and d!141889 (not c!125275)) b!1304679))

(assert (=> b!1304678 m!1195477))

(assert (=> b!1304678 m!1195479))

(declare-fun m!1195711 () Bool)

(assert (=> b!1304678 m!1195711))

(assert (=> b!1304679 m!1195477))

(assert (=> b!1304679 m!1195479))

(declare-fun m!1195713 () Bool)

(assert (=> b!1304679 m!1195713))

(assert (=> b!1304531 d!141889))

(assert (=> d!141837 d!141829))

(declare-fun d!141891 () Bool)

(declare-fun e!744193 () Bool)

(assert (=> d!141891 e!744193))

(declare-fun res!866439 () Bool)

(assert (=> d!141891 (=> (not res!866439) (not e!744193))))

(declare-fun lt!583967 () ListLongMap!20295)

(assert (=> d!141891 (= res!866439 (contains!8303 lt!583967 (_1!11330 (ite (or c!125261 c!125262) (tuple2!22639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun lt!583964 () List!29758)

(assert (=> d!141891 (= lt!583967 (ListLongMap!20296 lt!583964))))

(declare-fun lt!583965 () Unit!43194)

(declare-fun lt!583966 () Unit!43194)

(assert (=> d!141891 (= lt!583965 lt!583966)))

(assert (=> d!141891 (= (getValueByKey!707 lt!583964 (_1!11330 (ite (or c!125261 c!125262) (tuple2!22639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (Some!758 (_2!11330 (ite (or c!125261 c!125262) (tuple2!22639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!141891 (= lt!583966 (lemmaContainsTupThenGetReturnValue!353 lt!583964 (_1!11330 (ite (or c!125261 c!125262) (tuple2!22639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11330 (ite (or c!125261 c!125262) (tuple2!22639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!141891 (= lt!583964 (insertStrictlySorted!482 (toList!10163 (ite c!125261 call!64299 (ite c!125262 call!64297 call!64298))) (_1!11330 (ite (or c!125261 c!125262) (tuple2!22639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (_2!11330 (ite (or c!125261 c!125262) (tuple2!22639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(assert (=> d!141891 (= (+!4485 (ite c!125261 call!64299 (ite c!125262 call!64297 call!64298)) (ite (or c!125261 c!125262) (tuple2!22639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) lt!583967)))

(declare-fun b!1304680 () Bool)

(declare-fun res!866440 () Bool)

(assert (=> b!1304680 (=> (not res!866440) (not e!744193))))

(assert (=> b!1304680 (= res!866440 (= (getValueByKey!707 (toList!10163 lt!583967) (_1!11330 (ite (or c!125261 c!125262) (tuple2!22639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))) (Some!758 (_2!11330 (ite (or c!125261 c!125262) (tuple2!22639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))))

(declare-fun b!1304681 () Bool)

(assert (=> b!1304681 (= e!744193 (contains!8306 (toList!10163 lt!583967) (ite (or c!125261 c!125262) (tuple2!22639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22639 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (= (and d!141891 res!866439) b!1304680))

(assert (= (and b!1304680 res!866440) b!1304681))

(declare-fun m!1195715 () Bool)

(assert (=> d!141891 m!1195715))

(declare-fun m!1195717 () Bool)

(assert (=> d!141891 m!1195717))

(declare-fun m!1195719 () Bool)

(assert (=> d!141891 m!1195719))

(declare-fun m!1195721 () Bool)

(assert (=> d!141891 m!1195721))

(declare-fun m!1195723 () Bool)

(assert (=> b!1304680 m!1195723))

(declare-fun m!1195725 () Bool)

(assert (=> b!1304681 m!1195725))

(assert (=> bm!64292 d!141891))

(declare-fun d!141893 () Bool)

(declare-fun res!866445 () Bool)

(declare-fun e!744198 () Bool)

(assert (=> d!141893 (=> res!866445 e!744198)))

(assert (=> d!141893 (= res!866445 (and ((_ is Cons!29754) (toList!10163 (getCurrentListMap!5181 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11330 (h!30963 (toList!10163 (getCurrentListMap!5181 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(assert (=> d!141893 (= (containsKey!729 (toList!10163 (getCurrentListMap!5181 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!744198)))

(declare-fun b!1304686 () Bool)

(declare-fun e!744199 () Bool)

(assert (=> b!1304686 (= e!744198 e!744199)))

(declare-fun res!866446 () Bool)

(assert (=> b!1304686 (=> (not res!866446) (not e!744199))))

(assert (=> b!1304686 (= res!866446 (and (or (not ((_ is Cons!29754) (toList!10163 (getCurrentListMap!5181 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) (bvsle (_1!11330 (h!30963 (toList!10163 (getCurrentListMap!5181 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)) ((_ is Cons!29754) (toList!10163 (getCurrentListMap!5181 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (bvslt (_1!11330 (h!30963 (toList!10163 (getCurrentListMap!5181 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(declare-fun b!1304687 () Bool)

(assert (=> b!1304687 (= e!744199 (containsKey!729 (t!43356 (toList!10163 (getCurrentListMap!5181 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(assert (= (and d!141893 (not res!866445)) b!1304686))

(assert (= (and b!1304686 res!866446) b!1304687))

(declare-fun m!1195727 () Bool)

(assert (=> b!1304687 m!1195727))

(assert (=> d!141835 d!141893))

(declare-fun d!141895 () Bool)

(declare-fun e!744200 () Bool)

(assert (=> d!141895 e!744200))

(declare-fun res!866447 () Bool)

(assert (=> d!141895 (=> res!866447 e!744200)))

(declare-fun lt!583970 () Bool)

(assert (=> d!141895 (= res!866447 (not lt!583970))))

(declare-fun lt!583971 () Bool)

(assert (=> d!141895 (= lt!583970 lt!583971)))

(declare-fun lt!583969 () Unit!43194)

(declare-fun e!744201 () Unit!43194)

(assert (=> d!141895 (= lt!583969 e!744201)))

(declare-fun c!125276 () Bool)

(assert (=> d!141895 (= c!125276 lt!583971)))

(assert (=> d!141895 (= lt!583971 (containsKey!729 (toList!10163 lt!583831) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!141895 (= (contains!8303 lt!583831 #b1000000000000000000000000000000000000000000000000000000000000000) lt!583970)))

(declare-fun b!1304688 () Bool)

(declare-fun lt!583968 () Unit!43194)

(assert (=> b!1304688 (= e!744201 lt!583968)))

(assert (=> b!1304688 (= lt!583968 (lemmaContainsKeyImpliesGetValueByKeyDefined!475 (toList!10163 lt!583831) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1304688 (isDefined!514 (getValueByKey!707 (toList!10163 lt!583831) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1304689 () Bool)

(declare-fun Unit!43205 () Unit!43194)

(assert (=> b!1304689 (= e!744201 Unit!43205)))

(declare-fun b!1304690 () Bool)

(assert (=> b!1304690 (= e!744200 (isDefined!514 (getValueByKey!707 (toList!10163 lt!583831) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141895 c!125276) b!1304688))

(assert (= (and d!141895 (not c!125276)) b!1304689))

(assert (= (and d!141895 (not res!866447)) b!1304690))

(declare-fun m!1195729 () Bool)

(assert (=> d!141895 m!1195729))

(declare-fun m!1195731 () Bool)

(assert (=> b!1304688 m!1195731))

(declare-fun m!1195733 () Bool)

(assert (=> b!1304688 m!1195733))

(assert (=> b!1304688 m!1195733))

(declare-fun m!1195735 () Bool)

(assert (=> b!1304688 m!1195735))

(assert (=> b!1304690 m!1195733))

(assert (=> b!1304690 m!1195733))

(assert (=> b!1304690 m!1195735))

(assert (=> b!1304527 d!141895))

(declare-fun d!141897 () Bool)

(assert (=> d!141897 (arrayContainsKey!0 _keys!1741 lt!583792 #b00000000000000000000000000000000)))

(declare-fun lt!583974 () Unit!43194)

(declare-fun choose!13 (array!86874 (_ BitVec 64) (_ BitVec 32)) Unit!43194)

(assert (=> d!141897 (= lt!583974 (choose!13 _keys!1741 lt!583792 #b00000000000000000000000000000000))))

(assert (=> d!141897 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!141897 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!583792 #b00000000000000000000000000000000) lt!583974)))

(declare-fun bs!37162 () Bool)

(assert (= bs!37162 d!141897))

(assert (=> bs!37162 m!1195441))

(declare-fun m!1195737 () Bool)

(assert (=> bs!37162 m!1195737))

(assert (=> b!1304481 d!141897))

(declare-fun d!141899 () Bool)

(declare-fun res!866452 () Bool)

(declare-fun e!744206 () Bool)

(assert (=> d!141899 (=> res!866452 e!744206)))

(assert (=> d!141899 (= res!866452 (= (select (arr!41926 _keys!1741) #b00000000000000000000000000000000) lt!583792))))

(assert (=> d!141899 (= (arrayContainsKey!0 _keys!1741 lt!583792 #b00000000000000000000000000000000) e!744206)))

(declare-fun b!1304695 () Bool)

(declare-fun e!744207 () Bool)

(assert (=> b!1304695 (= e!744206 e!744207)))

(declare-fun res!866453 () Bool)

(assert (=> b!1304695 (=> (not res!866453) (not e!744207))))

(assert (=> b!1304695 (= res!866453 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!42476 _keys!1741)))))

(declare-fun b!1304696 () Bool)

(assert (=> b!1304696 (= e!744207 (arrayContainsKey!0 _keys!1741 lt!583792 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!141899 (not res!866452)) b!1304695))

(assert (= (and b!1304695 res!866453) b!1304696))

(assert (=> d!141899 m!1195437))

(declare-fun m!1195739 () Bool)

(assert (=> b!1304696 m!1195739))

(assert (=> b!1304481 d!141899))

(declare-fun b!1304709 () Bool)

(declare-fun e!744216 () SeekEntryResult!10027)

(assert (=> b!1304709 (= e!744216 Undefined!10027)))

(declare-fun lt!583983 () SeekEntryResult!10027)

(declare-fun b!1304710 () Bool)

(declare-fun e!744215 () SeekEntryResult!10027)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!86874 (_ BitVec 32)) SeekEntryResult!10027)

(assert (=> b!1304710 (= e!744215 (seekKeyOrZeroReturnVacant!0 (x!115861 lt!583983) (index!42481 lt!583983) (index!42481 lt!583983) (select (arr!41926 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175))))

(declare-fun b!1304711 () Bool)

(assert (=> b!1304711 (= e!744215 (MissingZero!10027 (index!42481 lt!583983)))))

(declare-fun b!1304712 () Bool)

(declare-fun c!125285 () Bool)

(declare-fun lt!583982 () (_ BitVec 64))

(assert (=> b!1304712 (= c!125285 (= lt!583982 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!744214 () SeekEntryResult!10027)

(assert (=> b!1304712 (= e!744214 e!744215)))

(declare-fun b!1304713 () Bool)

(assert (=> b!1304713 (= e!744214 (Found!10027 (index!42481 lt!583983)))))

(declare-fun b!1304714 () Bool)

(assert (=> b!1304714 (= e!744216 e!744214)))

(assert (=> b!1304714 (= lt!583982 (select (arr!41926 _keys!1741) (index!42481 lt!583983)))))

(declare-fun c!125283 () Bool)

(assert (=> b!1304714 (= c!125283 (= lt!583982 (select (arr!41926 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun d!141901 () Bool)

(declare-fun lt!583981 () SeekEntryResult!10027)

(assert (=> d!141901 (and (or ((_ is Undefined!10027) lt!583981) (not ((_ is Found!10027) lt!583981)) (and (bvsge (index!42480 lt!583981) #b00000000000000000000000000000000) (bvslt (index!42480 lt!583981) (size!42476 _keys!1741)))) (or ((_ is Undefined!10027) lt!583981) ((_ is Found!10027) lt!583981) (not ((_ is MissingZero!10027) lt!583981)) (and (bvsge (index!42479 lt!583981) #b00000000000000000000000000000000) (bvslt (index!42479 lt!583981) (size!42476 _keys!1741)))) (or ((_ is Undefined!10027) lt!583981) ((_ is Found!10027) lt!583981) ((_ is MissingZero!10027) lt!583981) (not ((_ is MissingVacant!10027) lt!583981)) (and (bvsge (index!42482 lt!583981) #b00000000000000000000000000000000) (bvslt (index!42482 lt!583981) (size!42476 _keys!1741)))) (or ((_ is Undefined!10027) lt!583981) (ite ((_ is Found!10027) lt!583981) (= (select (arr!41926 _keys!1741) (index!42480 lt!583981)) (select (arr!41926 _keys!1741) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!10027) lt!583981) (= (select (arr!41926 _keys!1741) (index!42479 lt!583981)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10027) lt!583981) (= (select (arr!41926 _keys!1741) (index!42482 lt!583981)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!141901 (= lt!583981 e!744216)))

(declare-fun c!125284 () Bool)

(assert (=> d!141901 (= c!125284 (and ((_ is Intermediate!10027) lt!583983) (undefined!10839 lt!583983)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!86874 (_ BitVec 32)) SeekEntryResult!10027)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!141901 (= lt!583983 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!41926 _keys!1741) #b00000000000000000000000000000000) mask!2175) (select (arr!41926 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175))))

(assert (=> d!141901 (validMask!0 mask!2175)))

(assert (=> d!141901 (= (seekEntryOrOpen!0 (select (arr!41926 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) lt!583981)))

(assert (= (and d!141901 c!125284) b!1304709))

(assert (= (and d!141901 (not c!125284)) b!1304714))

(assert (= (and b!1304714 c!125283) b!1304713))

(assert (= (and b!1304714 (not c!125283)) b!1304712))

(assert (= (and b!1304712 c!125285) b!1304711))

(assert (= (and b!1304712 (not c!125285)) b!1304710))

(assert (=> b!1304710 m!1195437))

(declare-fun m!1195741 () Bool)

(assert (=> b!1304710 m!1195741))

(declare-fun m!1195743 () Bool)

(assert (=> b!1304714 m!1195743))

(declare-fun m!1195745 () Bool)

(assert (=> d!141901 m!1195745))

(assert (=> d!141901 m!1195437))

(declare-fun m!1195747 () Bool)

(assert (=> d!141901 m!1195747))

(assert (=> d!141901 m!1195399))

(declare-fun m!1195749 () Bool)

(assert (=> d!141901 m!1195749))

(declare-fun m!1195751 () Bool)

(assert (=> d!141901 m!1195751))

(assert (=> d!141901 m!1195437))

(assert (=> d!141901 m!1195745))

(declare-fun m!1195753 () Bool)

(assert (=> d!141901 m!1195753))

(assert (=> b!1304481 d!141901))

(assert (=> b!1304549 d!141873))

(declare-fun d!141903 () Bool)

(assert (=> d!141903 (isDefined!514 (getValueByKey!707 (toList!10163 (getCurrentListMapNoExtraKeys!6121 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun lt!583986 () Unit!43194)

(declare-fun choose!1932 (List!29758 (_ BitVec 64)) Unit!43194)

(assert (=> d!141903 (= lt!583986 (choose!1932 (toList!10163 (getCurrentListMapNoExtraKeys!6121 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun e!744219 () Bool)

(assert (=> d!141903 e!744219))

(declare-fun res!866456 () Bool)

(assert (=> d!141903 (=> (not res!866456) (not e!744219))))

(declare-fun isStrictlySorted!873 (List!29758) Bool)

(assert (=> d!141903 (= res!866456 (isStrictlySorted!873 (toList!10163 (getCurrentListMapNoExtraKeys!6121 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))

(assert (=> d!141903 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!475 (toList!10163 (getCurrentListMapNoExtraKeys!6121 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) lt!583986)))

(declare-fun b!1304717 () Bool)

(assert (=> b!1304717 (= e!744219 (containsKey!729 (toList!10163 (getCurrentListMapNoExtraKeys!6121 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (= (and d!141903 res!866456) b!1304717))

(assert (=> d!141903 m!1195463))

(assert (=> d!141903 m!1195463))

(assert (=> d!141903 m!1195465))

(declare-fun m!1195755 () Bool)

(assert (=> d!141903 m!1195755))

(declare-fun m!1195757 () Bool)

(assert (=> d!141903 m!1195757))

(assert (=> b!1304717 m!1195459))

(assert (=> b!1304494 d!141903))

(assert (=> b!1304494 d!141877))

(assert (=> b!1304494 d!141879))

(declare-fun d!141905 () Bool)

(assert (=> d!141905 (= (apply!1024 lt!583831 (select (arr!41926 _keys!1741) from!2144)) (get!21178 (getValueByKey!707 (toList!10163 lt!583831) (select (arr!41926 _keys!1741) from!2144))))))

(declare-fun bs!37163 () Bool)

(assert (= bs!37163 d!141905))

(assert (=> bs!37163 m!1195387))

(declare-fun m!1195759 () Bool)

(assert (=> bs!37163 m!1195759))

(assert (=> bs!37163 m!1195759))

(declare-fun m!1195761 () Bool)

(assert (=> bs!37163 m!1195761))

(assert (=> b!1304529 d!141905))

(assert (=> b!1304529 d!141889))

(declare-fun b!1304718 () Bool)

(declare-fun e!744220 () Bool)

(declare-fun e!744221 () Bool)

(assert (=> b!1304718 (= e!744220 e!744221)))

(declare-fun lt!583987 () (_ BitVec 64))

(assert (=> b!1304718 (= lt!583987 (select (arr!41926 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!583989 () Unit!43194)

(assert (=> b!1304718 (= lt!583989 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!583987 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1304718 (arrayContainsKey!0 _keys!1741 lt!583987 #b00000000000000000000000000000000)))

(declare-fun lt!583988 () Unit!43194)

(assert (=> b!1304718 (= lt!583988 lt!583989)))

(declare-fun res!866457 () Bool)

(assert (=> b!1304718 (= res!866457 (= (seekEntryOrOpen!0 (select (arr!41926 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1741 mask!2175) (Found!10027 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1304718 (=> (not res!866457) (not e!744221))))

(declare-fun d!141907 () Bool)

(declare-fun res!866458 () Bool)

(declare-fun e!744222 () Bool)

(assert (=> d!141907 (=> res!866458 e!744222)))

(assert (=> d!141907 (= res!866458 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!42476 _keys!1741)))))

(assert (=> d!141907 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175) e!744222)))

(declare-fun b!1304719 () Bool)

(declare-fun call!64300 () Bool)

(assert (=> b!1304719 (= e!744220 call!64300)))

(declare-fun bm!64297 () Bool)

(assert (=> bm!64297 (= call!64300 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1304720 () Bool)

(assert (=> b!1304720 (= e!744222 e!744220)))

(declare-fun c!125286 () Bool)

(assert (=> b!1304720 (= c!125286 (validKeyInArray!0 (select (arr!41926 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1304721 () Bool)

(assert (=> b!1304721 (= e!744221 call!64300)))

(assert (= (and d!141907 (not res!866458)) b!1304720))

(assert (= (and b!1304720 c!125286) b!1304718))

(assert (= (and b!1304720 (not c!125286)) b!1304719))

(assert (= (and b!1304718 res!866457) b!1304721))

(assert (= (or b!1304721 b!1304719) bm!64297))

(declare-fun m!1195763 () Bool)

(assert (=> b!1304718 m!1195763))

(declare-fun m!1195765 () Bool)

(assert (=> b!1304718 m!1195765))

(declare-fun m!1195767 () Bool)

(assert (=> b!1304718 m!1195767))

(assert (=> b!1304718 m!1195763))

(declare-fun m!1195769 () Bool)

(assert (=> b!1304718 m!1195769))

(declare-fun m!1195771 () Bool)

(assert (=> bm!64297 m!1195771))

(assert (=> b!1304720 m!1195763))

(assert (=> b!1304720 m!1195763))

(declare-fun m!1195773 () Bool)

(assert (=> b!1304720 m!1195773))

(assert (=> bm!64269 d!141907))

(assert (=> d!141819 d!141817))

(declare-fun d!141909 () Bool)

(assert (=> d!141909 (not (contains!8303 (ListLongMap!20296 Nil!29755) k0!1205))))

(assert (=> d!141909 true))

(declare-fun _$29!201 () Unit!43194)

(assert (=> d!141909 (= (choose!1928 k0!1205) _$29!201)))

(declare-fun bs!37164 () Bool)

(assert (= bs!37164 d!141909))

(assert (=> bs!37164 m!1195395))

(assert (=> d!141819 d!141909))

(declare-fun b!1304722 () Bool)

(declare-fun e!744223 () Bool)

(declare-fun call!64301 () Bool)

(assert (=> b!1304722 (= e!744223 call!64301)))

(declare-fun b!1304723 () Bool)

(declare-fun e!744226 () Bool)

(assert (=> b!1304723 (= e!744226 (contains!8305 (ite c!125244 (Cons!29755 (select (arr!41926 _keys!1741) #b00000000000000000000000000000000) Nil!29756) Nil!29756) (select (arr!41926 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1304724 () Bool)

(assert (=> b!1304724 (= e!744223 call!64301)))

(declare-fun b!1304725 () Bool)

(declare-fun e!744224 () Bool)

(declare-fun e!744225 () Bool)

(assert (=> b!1304725 (= e!744224 e!744225)))

(declare-fun res!866461 () Bool)

(assert (=> b!1304725 (=> (not res!866461) (not e!744225))))

(assert (=> b!1304725 (= res!866461 (not e!744226))))

(declare-fun res!866460 () Bool)

(assert (=> b!1304725 (=> (not res!866460) (not e!744226))))

(assert (=> b!1304725 (= res!866460 (validKeyInArray!0 (select (arr!41926 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!141911 () Bool)

(declare-fun res!866459 () Bool)

(assert (=> d!141911 (=> res!866459 e!744224)))

(assert (=> d!141911 (= res!866459 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!42476 _keys!1741)))))

(assert (=> d!141911 (= (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125244 (Cons!29755 (select (arr!41926 _keys!1741) #b00000000000000000000000000000000) Nil!29756) Nil!29756)) e!744224)))

(declare-fun b!1304726 () Bool)

(assert (=> b!1304726 (= e!744225 e!744223)))

(declare-fun c!125287 () Bool)

(assert (=> b!1304726 (= c!125287 (validKeyInArray!0 (select (arr!41926 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!64298 () Bool)

(assert (=> bm!64298 (= call!64301 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!125287 (Cons!29755 (select (arr!41926 _keys!1741) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!125244 (Cons!29755 (select (arr!41926 _keys!1741) #b00000000000000000000000000000000) Nil!29756) Nil!29756)) (ite c!125244 (Cons!29755 (select (arr!41926 _keys!1741) #b00000000000000000000000000000000) Nil!29756) Nil!29756))))))

(assert (= (and d!141911 (not res!866459)) b!1304725))

(assert (= (and b!1304725 res!866460) b!1304723))

(assert (= (and b!1304725 res!866461) b!1304726))

(assert (= (and b!1304726 c!125287) b!1304722))

(assert (= (and b!1304726 (not c!125287)) b!1304724))

(assert (= (or b!1304722 b!1304724) bm!64298))

(assert (=> b!1304723 m!1195763))

(assert (=> b!1304723 m!1195763))

(declare-fun m!1195775 () Bool)

(assert (=> b!1304723 m!1195775))

(assert (=> b!1304725 m!1195763))

(assert (=> b!1304725 m!1195763))

(assert (=> b!1304725 m!1195773))

(assert (=> b!1304726 m!1195763))

(assert (=> b!1304726 m!1195763))

(assert (=> b!1304726 m!1195773))

(assert (=> bm!64298 m!1195763))

(declare-fun m!1195777 () Bool)

(assert (=> bm!64298 m!1195777))

(assert (=> bm!64275 d!141911))

(declare-fun d!141913 () Bool)

(declare-fun e!744227 () Bool)

(assert (=> d!141913 e!744227))

(declare-fun res!866462 () Bool)

(assert (=> d!141913 (=> res!866462 e!744227)))

(declare-fun lt!583992 () Bool)

(assert (=> d!141913 (= res!866462 (not lt!583992))))

(declare-fun lt!583993 () Bool)

(assert (=> d!141913 (= lt!583992 lt!583993)))

(declare-fun lt!583991 () Unit!43194)

(declare-fun e!744228 () Unit!43194)

(assert (=> d!141913 (= lt!583991 e!744228)))

(declare-fun c!125288 () Bool)

(assert (=> d!141913 (= c!125288 lt!583993)))

(assert (=> d!141913 (= lt!583993 (containsKey!729 (toList!10163 lt!583885) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!141913 (= (contains!8303 lt!583885 #b1000000000000000000000000000000000000000000000000000000000000000) lt!583992)))

(declare-fun b!1304727 () Bool)

(declare-fun lt!583990 () Unit!43194)

(assert (=> b!1304727 (= e!744228 lt!583990)))

(assert (=> b!1304727 (= lt!583990 (lemmaContainsKeyImpliesGetValueByKeyDefined!475 (toList!10163 lt!583885) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1304727 (isDefined!514 (getValueByKey!707 (toList!10163 lt!583885) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1304728 () Bool)

(declare-fun Unit!43206 () Unit!43194)

(assert (=> b!1304728 (= e!744228 Unit!43206)))

(declare-fun b!1304729 () Bool)

(assert (=> b!1304729 (= e!744227 (isDefined!514 (getValueByKey!707 (toList!10163 lt!583885) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141913 c!125288) b!1304727))

(assert (= (and d!141913 (not c!125288)) b!1304728))

(assert (= (and d!141913 (not res!866462)) b!1304729))

(declare-fun m!1195779 () Bool)

(assert (=> d!141913 m!1195779))

(declare-fun m!1195781 () Bool)

(assert (=> b!1304727 m!1195781))

(declare-fun m!1195783 () Bool)

(assert (=> b!1304727 m!1195783))

(assert (=> b!1304727 m!1195783))

(declare-fun m!1195785 () Bool)

(assert (=> b!1304727 m!1195785))

(assert (=> b!1304729 m!1195783))

(assert (=> b!1304729 m!1195783))

(assert (=> b!1304729 m!1195785))

(assert (=> bm!64293 d!141913))

(declare-fun d!141915 () Bool)

(declare-fun lt!583996 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!647 (List!29759) (InoxSet (_ BitVec 64)))

(assert (=> d!141915 (= lt!583996 (select (content!647 Nil!29756) (select (arr!41926 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun e!744234 () Bool)

(assert (=> d!141915 (= lt!583996 e!744234)))

(declare-fun res!866468 () Bool)

(assert (=> d!141915 (=> (not res!866468) (not e!744234))))

(assert (=> d!141915 (= res!866468 ((_ is Cons!29755) Nil!29756))))

(assert (=> d!141915 (= (contains!8305 Nil!29756 (select (arr!41926 _keys!1741) #b00000000000000000000000000000000)) lt!583996)))

(declare-fun b!1304734 () Bool)

(declare-fun e!744233 () Bool)

(assert (=> b!1304734 (= e!744234 e!744233)))

(declare-fun res!866467 () Bool)

(assert (=> b!1304734 (=> res!866467 e!744233)))

(assert (=> b!1304734 (= res!866467 (= (h!30964 Nil!29756) (select (arr!41926 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1304735 () Bool)

(assert (=> b!1304735 (= e!744233 (contains!8305 (t!43357 Nil!29756) (select (arr!41926 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!141915 res!866468) b!1304734))

(assert (= (and b!1304734 (not res!866467)) b!1304735))

(declare-fun m!1195787 () Bool)

(assert (=> d!141915 m!1195787))

(assert (=> d!141915 m!1195437))

(declare-fun m!1195789 () Bool)

(assert (=> d!141915 m!1195789))

(assert (=> b!1304735 m!1195437))

(declare-fun m!1195791 () Bool)

(assert (=> b!1304735 m!1195791))

(assert (=> b!1304546 d!141915))

(assert (=> b!1304608 d!141825))

(assert (=> b!1304548 d!141873))

(declare-fun d!141917 () Bool)

(assert (=> d!141917 (= (apply!1024 lt!583885 (select (arr!41926 _keys!1741) from!2144)) (get!21178 (getValueByKey!707 (toList!10163 lt!583885) (select (arr!41926 _keys!1741) from!2144))))))

(declare-fun bs!37165 () Bool)

(assert (= bs!37165 d!141917))

(assert (=> bs!37165 m!1195387))

(declare-fun m!1195793 () Bool)

(assert (=> bs!37165 m!1195793))

(assert (=> bs!37165 m!1195793))

(declare-fun m!1195795 () Bool)

(assert (=> bs!37165 m!1195795))

(assert (=> b!1304609 d!141917))

(assert (=> b!1304609 d!141889))

(declare-fun e!744237 () Bool)

(declare-fun lt!584000 () ListLongMap!20295)

(declare-fun b!1304736 () Bool)

(assert (=> b!1304736 (= e!744237 (= lt!584000 (getCurrentListMapNoExtraKeys!6121 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun b!1304737 () Bool)

(declare-fun e!744240 () Bool)

(assert (=> b!1304737 (= e!744240 (validKeyInArray!0 (select (arr!41926 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))))))

(assert (=> b!1304737 (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1304738 () Bool)

(declare-fun e!744239 () Bool)

(declare-fun e!744238 () Bool)

(assert (=> b!1304738 (= e!744239 e!744238)))

(assert (=> b!1304738 (and (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42476 _keys!1741)))))

(declare-fun res!866469 () Bool)

(assert (=> b!1304738 (= res!866469 (contains!8303 lt!584000 (select (arr!41926 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))))))

(assert (=> b!1304738 (=> (not res!866469) (not e!744238))))

(declare-fun b!1304739 () Bool)

(assert (=> b!1304739 (= e!744237 (isEmpty!1066 lt!584000))))

(declare-fun b!1304740 () Bool)

(declare-fun e!744235 () Bool)

(assert (=> b!1304740 (= e!744235 e!744239)))

(declare-fun c!125291 () Bool)

(assert (=> b!1304740 (= c!125291 e!744240)))

(declare-fun res!866470 () Bool)

(assert (=> b!1304740 (=> (not res!866470) (not e!744240))))

(assert (=> b!1304740 (= res!866470 (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42476 _keys!1741)))))

(declare-fun b!1304741 () Bool)

(declare-fun e!744241 () ListLongMap!20295)

(declare-fun call!64302 () ListLongMap!20295)

(assert (=> b!1304741 (= e!744241 call!64302)))

(declare-fun bm!64299 () Bool)

(assert (=> bm!64299 (= call!64302 (getCurrentListMapNoExtraKeys!6121 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun d!141919 () Bool)

(assert (=> d!141919 e!744235))

(declare-fun res!866471 () Bool)

(assert (=> d!141919 (=> (not res!866471) (not e!744235))))

(assert (=> d!141919 (= res!866471 (not (contains!8303 lt!584000 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!744236 () ListLongMap!20295)

(assert (=> d!141919 (= lt!584000 e!744236)))

(declare-fun c!125290 () Bool)

(assert (=> d!141919 (= c!125290 (bvsge (bvadd from!2144 #b00000000000000000000000000000001) (size!42476 _keys!1741)))))

(assert (=> d!141919 (validMask!0 mask!2175)))

(assert (=> d!141919 (= (getCurrentListMapNoExtraKeys!6121 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448) lt!584000)))

(declare-fun b!1304742 () Bool)

(declare-fun res!866472 () Bool)

(assert (=> b!1304742 (=> (not res!866472) (not e!744235))))

(assert (=> b!1304742 (= res!866472 (not (contains!8303 lt!584000 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1304743 () Bool)

(assert (=> b!1304743 (= e!744239 e!744237)))

(declare-fun c!125289 () Bool)

(assert (=> b!1304743 (= c!125289 (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42476 _keys!1741)))))

(declare-fun b!1304744 () Bool)

(assert (=> b!1304744 (and (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42476 _keys!1741)))))

(assert (=> b!1304744 (and (bvsge (bvadd from!2144 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!2144 #b00000000000000000000000000000001) (size!42475 _values!1445)))))

(assert (=> b!1304744 (= e!744238 (= (apply!1024 lt!584000 (select (arr!41926 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))) (get!21177 (select (arr!41925 _values!1445) (bvadd from!2144 #b00000000000000000000000000000001)) (dynLambda!3431 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1304745 () Bool)

(assert (=> b!1304745 (= e!744236 e!744241)))

(declare-fun c!125292 () Bool)

(assert (=> b!1304745 (= c!125292 (validKeyInArray!0 (select (arr!41926 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001))))))

(declare-fun b!1304746 () Bool)

(declare-fun lt!584003 () Unit!43194)

(declare-fun lt!583997 () Unit!43194)

(assert (=> b!1304746 (= lt!584003 lt!583997)))

(declare-fun lt!583998 () ListLongMap!20295)

(declare-fun lt!583999 () (_ BitVec 64))

(declare-fun lt!584002 () (_ BitVec 64))

(declare-fun lt!584001 () V!51675)

(assert (=> b!1304746 (not (contains!8303 (+!4485 lt!583998 (tuple2!22639 lt!583999 lt!584001)) lt!584002))))

(assert (=> b!1304746 (= lt!583997 (addStillNotContains!482 lt!583998 lt!583999 lt!584001 lt!584002))))

(assert (=> b!1304746 (= lt!584002 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1304746 (= lt!584001 (get!21177 (select (arr!41925 _values!1445) (bvadd from!2144 #b00000000000000000000000000000001)) (dynLambda!3431 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1304746 (= lt!583999 (select (arr!41926 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001)))))

(assert (=> b!1304746 (= lt!583998 call!64302)))

(assert (=> b!1304746 (= e!744241 (+!4485 call!64302 (tuple2!22639 (select (arr!41926 _keys!1741) (bvadd from!2144 #b00000000000000000000000000000001)) (get!21177 (select (arr!41925 _values!1445) (bvadd from!2144 #b00000000000000000000000000000001)) (dynLambda!3431 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1304747 () Bool)

(assert (=> b!1304747 (= e!744236 (ListLongMap!20296 Nil!29755))))

(assert (= (and d!141919 c!125290) b!1304747))

(assert (= (and d!141919 (not c!125290)) b!1304745))

(assert (= (and b!1304745 c!125292) b!1304746))

(assert (= (and b!1304745 (not c!125292)) b!1304741))

(assert (= (or b!1304746 b!1304741) bm!64299))

(assert (= (and d!141919 res!866471) b!1304742))

(assert (= (and b!1304742 res!866472) b!1304740))

(assert (= (and b!1304740 res!866470) b!1304737))

(assert (= (and b!1304740 c!125291) b!1304738))

(assert (= (and b!1304740 (not c!125291)) b!1304743))

(assert (= (and b!1304738 res!866469) b!1304744))

(assert (= (and b!1304743 c!125289) b!1304736))

(assert (= (and b!1304743 (not c!125289)) b!1304739))

(declare-fun b_lambda!23319 () Bool)

(assert (=> (not b_lambda!23319) (not b!1304744)))

(assert (=> b!1304744 t!43361))

(declare-fun b_and!47479 () Bool)

(assert (= b_and!47477 (and (=> t!43361 result!23831) b_and!47479)))

(declare-fun b_lambda!23321 () Bool)

(assert (=> (not b_lambda!23321) (not b!1304746)))

(assert (=> b!1304746 t!43361))

(declare-fun b_and!47481 () Bool)

(assert (= b_and!47479 (and (=> t!43361 result!23831) b_and!47481)))

(declare-fun m!1195797 () Bool)

(assert (=> b!1304742 m!1195797))

(declare-fun m!1195799 () Bool)

(assert (=> b!1304739 m!1195799))

(declare-fun m!1195801 () Bool)

(assert (=> b!1304737 m!1195801))

(assert (=> b!1304737 m!1195801))

(declare-fun m!1195803 () Bool)

(assert (=> b!1304737 m!1195803))

(declare-fun m!1195805 () Bool)

(assert (=> d!141919 m!1195805))

(assert (=> d!141919 m!1195399))

(assert (=> b!1304745 m!1195801))

(assert (=> b!1304745 m!1195801))

(assert (=> b!1304745 m!1195803))

(declare-fun m!1195807 () Bool)

(assert (=> bm!64299 m!1195807))

(assert (=> b!1304738 m!1195801))

(assert (=> b!1304738 m!1195801))

(declare-fun m!1195809 () Bool)

(assert (=> b!1304738 m!1195809))

(assert (=> b!1304736 m!1195807))

(declare-fun m!1195811 () Bool)

(assert (=> b!1304746 m!1195811))

(assert (=> b!1304746 m!1195479))

(declare-fun m!1195813 () Bool)

(assert (=> b!1304746 m!1195813))

(declare-fun m!1195815 () Bool)

(assert (=> b!1304746 m!1195815))

(declare-fun m!1195817 () Bool)

(assert (=> b!1304746 m!1195817))

(declare-fun m!1195819 () Bool)

(assert (=> b!1304746 m!1195819))

(assert (=> b!1304746 m!1195801))

(assert (=> b!1304746 m!1195811))

(assert (=> b!1304746 m!1195479))

(assert (=> b!1304746 m!1195817))

(declare-fun m!1195821 () Bool)

(assert (=> b!1304746 m!1195821))

(assert (=> b!1304744 m!1195811))

(assert (=> b!1304744 m!1195479))

(assert (=> b!1304744 m!1195813))

(assert (=> b!1304744 m!1195479))

(assert (=> b!1304744 m!1195801))

(declare-fun m!1195823 () Bool)

(assert (=> b!1304744 m!1195823))

(assert (=> b!1304744 m!1195801))

(assert (=> b!1304744 m!1195811))

(assert (=> bm!64272 d!141919))

(assert (=> bm!64290 d!141823))

(declare-fun d!141921 () Bool)

(declare-fun e!744242 () Bool)

(assert (=> d!141921 e!744242))

(declare-fun res!866473 () Bool)

(assert (=> d!141921 (=> res!866473 e!744242)))

(declare-fun lt!584006 () Bool)

(assert (=> d!141921 (= res!866473 (not lt!584006))))

(declare-fun lt!584007 () Bool)

(assert (=> d!141921 (= lt!584006 lt!584007)))

(declare-fun lt!584005 () Unit!43194)

(declare-fun e!744243 () Unit!43194)

(assert (=> d!141921 (= lt!584005 e!744243)))

(declare-fun c!125293 () Bool)

(assert (=> d!141921 (= c!125293 lt!584007)))

(assert (=> d!141921 (= lt!584007 (containsKey!729 (toList!10163 lt!583831) (select (arr!41926 _keys!1741) from!2144)))))

(assert (=> d!141921 (= (contains!8303 lt!583831 (select (arr!41926 _keys!1741) from!2144)) lt!584006)))

(declare-fun b!1304748 () Bool)

(declare-fun lt!584004 () Unit!43194)

(assert (=> b!1304748 (= e!744243 lt!584004)))

(assert (=> b!1304748 (= lt!584004 (lemmaContainsKeyImpliesGetValueByKeyDefined!475 (toList!10163 lt!583831) (select (arr!41926 _keys!1741) from!2144)))))

(assert (=> b!1304748 (isDefined!514 (getValueByKey!707 (toList!10163 lt!583831) (select (arr!41926 _keys!1741) from!2144)))))

(declare-fun b!1304749 () Bool)

(declare-fun Unit!43207 () Unit!43194)

(assert (=> b!1304749 (= e!744243 Unit!43207)))

(declare-fun b!1304750 () Bool)

(assert (=> b!1304750 (= e!744242 (isDefined!514 (getValueByKey!707 (toList!10163 lt!583831) (select (arr!41926 _keys!1741) from!2144))))))

(assert (= (and d!141921 c!125293) b!1304748))

(assert (= (and d!141921 (not c!125293)) b!1304749))

(assert (= (and d!141921 (not res!866473)) b!1304750))

(assert (=> d!141921 m!1195387))

(declare-fun m!1195825 () Bool)

(assert (=> d!141921 m!1195825))

(assert (=> b!1304748 m!1195387))

(declare-fun m!1195827 () Bool)

(assert (=> b!1304748 m!1195827))

(assert (=> b!1304748 m!1195387))

(assert (=> b!1304748 m!1195759))

(assert (=> b!1304748 m!1195759))

(declare-fun m!1195829 () Bool)

(assert (=> b!1304748 m!1195829))

(assert (=> b!1304750 m!1195387))

(assert (=> b!1304750 m!1195759))

(assert (=> b!1304750 m!1195759))

(assert (=> b!1304750 m!1195829))

(assert (=> b!1304523 d!141921))

(declare-fun d!141923 () Bool)

(declare-fun res!866474 () Bool)

(declare-fun e!744244 () Bool)

(assert (=> d!141923 (=> res!866474 e!744244)))

(assert (=> d!141923 (= res!866474 (and ((_ is Cons!29754) (toList!10163 (ListLongMap!20296 Nil!29755))) (= (_1!11330 (h!30963 (toList!10163 (ListLongMap!20296 Nil!29755)))) k0!1205)))))

(assert (=> d!141923 (= (containsKey!729 (toList!10163 (ListLongMap!20296 Nil!29755)) k0!1205) e!744244)))

(declare-fun b!1304751 () Bool)

(declare-fun e!744245 () Bool)

(assert (=> b!1304751 (= e!744244 e!744245)))

(declare-fun res!866475 () Bool)

(assert (=> b!1304751 (=> (not res!866475) (not e!744245))))

(assert (=> b!1304751 (= res!866475 (and (or (not ((_ is Cons!29754) (toList!10163 (ListLongMap!20296 Nil!29755)))) (bvsle (_1!11330 (h!30963 (toList!10163 (ListLongMap!20296 Nil!29755)))) k0!1205)) ((_ is Cons!29754) (toList!10163 (ListLongMap!20296 Nil!29755))) (bvslt (_1!11330 (h!30963 (toList!10163 (ListLongMap!20296 Nil!29755)))) k0!1205)))))

(declare-fun b!1304752 () Bool)

(assert (=> b!1304752 (= e!744245 (containsKey!729 (t!43356 (toList!10163 (ListLongMap!20296 Nil!29755))) k0!1205))))

(assert (= (and d!141923 (not res!866474)) b!1304751))

(assert (= (and b!1304751 res!866475) b!1304752))

(declare-fun m!1195831 () Bool)

(assert (=> b!1304752 m!1195831))

(assert (=> d!141817 d!141923))

(declare-fun d!141925 () Bool)

(declare-fun isEmpty!1068 (List!29758) Bool)

(assert (=> d!141925 (= (isEmpty!1066 lt!583831) (isEmpty!1068 (toList!10163 lt!583831)))))

(declare-fun bs!37166 () Bool)

(assert (= bs!37166 d!141925))

(declare-fun m!1195833 () Bool)

(assert (=> bs!37166 m!1195833))

(assert (=> b!1304524 d!141925))

(declare-fun d!141927 () Bool)

(declare-fun e!744246 () Bool)

(assert (=> d!141927 e!744246))

(declare-fun res!866476 () Bool)

(assert (=> d!141927 (=> res!866476 e!744246)))

(declare-fun lt!584010 () Bool)

(assert (=> d!141927 (= res!866476 (not lt!584010))))

(declare-fun lt!584011 () Bool)

(assert (=> d!141927 (= lt!584010 lt!584011)))

(declare-fun lt!584009 () Unit!43194)

(declare-fun e!744247 () Unit!43194)

(assert (=> d!141927 (= lt!584009 e!744247)))

(declare-fun c!125294 () Bool)

(assert (=> d!141927 (= c!125294 lt!584011)))

(assert (=> d!141927 (= lt!584011 (containsKey!729 (toList!10163 lt!583831) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!141927 (= (contains!8303 lt!583831 #b0000000000000000000000000000000000000000000000000000000000000000) lt!584010)))

(declare-fun b!1304753 () Bool)

(declare-fun lt!584008 () Unit!43194)

(assert (=> b!1304753 (= e!744247 lt!584008)))

(assert (=> b!1304753 (= lt!584008 (lemmaContainsKeyImpliesGetValueByKeyDefined!475 (toList!10163 lt!583831) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1304753 (isDefined!514 (getValueByKey!707 (toList!10163 lt!583831) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1304754 () Bool)

(declare-fun Unit!43208 () Unit!43194)

(assert (=> b!1304754 (= e!744247 Unit!43208)))

(declare-fun b!1304755 () Bool)

(assert (=> b!1304755 (= e!744246 (isDefined!514 (getValueByKey!707 (toList!10163 lt!583831) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!141927 c!125294) b!1304753))

(assert (= (and d!141927 (not c!125294)) b!1304754))

(assert (= (and d!141927 (not res!866476)) b!1304755))

(declare-fun m!1195835 () Bool)

(assert (=> d!141927 m!1195835))

(declare-fun m!1195837 () Bool)

(assert (=> b!1304753 m!1195837))

(declare-fun m!1195839 () Bool)

(assert (=> b!1304753 m!1195839))

(assert (=> b!1304753 m!1195839))

(declare-fun m!1195841 () Bool)

(assert (=> b!1304753 m!1195841))

(assert (=> b!1304755 m!1195839))

(assert (=> b!1304755 m!1195839))

(assert (=> b!1304755 m!1195841))

(assert (=> d!141823 d!141927))

(assert (=> d!141823 d!141829))

(declare-fun d!141929 () Bool)

(declare-fun res!866477 () Bool)

(declare-fun e!744248 () Bool)

(assert (=> d!141929 (=> res!866477 e!744248)))

(assert (=> d!141929 (= res!866477 (and ((_ is Cons!29754) (toList!10163 (getCurrentListMapNoExtraKeys!6121 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11330 (h!30963 (toList!10163 (getCurrentListMapNoExtraKeys!6121 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(assert (=> d!141929 (= (containsKey!729 (toList!10163 (getCurrentListMapNoExtraKeys!6121 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!744248)))

(declare-fun b!1304756 () Bool)

(declare-fun e!744249 () Bool)

(assert (=> b!1304756 (= e!744248 e!744249)))

(declare-fun res!866478 () Bool)

(assert (=> b!1304756 (=> (not res!866478) (not e!744249))))

(assert (=> b!1304756 (= res!866478 (and (or (not ((_ is Cons!29754) (toList!10163 (getCurrentListMapNoExtraKeys!6121 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) (bvsle (_1!11330 (h!30963 (toList!10163 (getCurrentListMapNoExtraKeys!6121 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)) ((_ is Cons!29754) (toList!10163 (getCurrentListMapNoExtraKeys!6121 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (bvslt (_1!11330 (h!30963 (toList!10163 (getCurrentListMapNoExtraKeys!6121 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(declare-fun b!1304757 () Bool)

(assert (=> b!1304757 (= e!744249 (containsKey!729 (t!43356 (toList!10163 (getCurrentListMapNoExtraKeys!6121 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(assert (= (and d!141929 (not res!866477)) b!1304756))

(assert (= (and b!1304756 res!866478) b!1304757))

(declare-fun m!1195843 () Bool)

(assert (=> b!1304757 m!1195843))

(assert (=> d!141821 d!141929))

(assert (=> b!1304521 d!141919))

(declare-fun d!141931 () Bool)

(assert (=> d!141931 (= (isDefined!514 (getValueByKey!707 (toList!10163 (ListLongMap!20296 Nil!29755)) k0!1205)) (not (isEmpty!1067 (getValueByKey!707 (toList!10163 (ListLongMap!20296 Nil!29755)) k0!1205))))))

(declare-fun bs!37167 () Bool)

(assert (= bs!37167 d!141931))

(assert (=> bs!37167 m!1195453))

(declare-fun m!1195845 () Bool)

(assert (=> bs!37167 m!1195845))

(assert (=> b!1304493 d!141931))

(declare-fun b!1304760 () Bool)

(declare-fun e!744251 () Option!759)

(assert (=> b!1304760 (= e!744251 (getValueByKey!707 (t!43356 (toList!10163 (ListLongMap!20296 Nil!29755))) k0!1205))))

(declare-fun d!141933 () Bool)

(declare-fun c!125295 () Bool)

(assert (=> d!141933 (= c!125295 (and ((_ is Cons!29754) (toList!10163 (ListLongMap!20296 Nil!29755))) (= (_1!11330 (h!30963 (toList!10163 (ListLongMap!20296 Nil!29755)))) k0!1205)))))

(declare-fun e!744250 () Option!759)

(assert (=> d!141933 (= (getValueByKey!707 (toList!10163 (ListLongMap!20296 Nil!29755)) k0!1205) e!744250)))

(declare-fun b!1304759 () Bool)

(assert (=> b!1304759 (= e!744250 e!744251)))

(declare-fun c!125296 () Bool)

(assert (=> b!1304759 (= c!125296 (and ((_ is Cons!29754) (toList!10163 (ListLongMap!20296 Nil!29755))) (not (= (_1!11330 (h!30963 (toList!10163 (ListLongMap!20296 Nil!29755)))) k0!1205))))))

(declare-fun b!1304761 () Bool)

(assert (=> b!1304761 (= e!744251 None!757)))

(declare-fun b!1304758 () Bool)

(assert (=> b!1304758 (= e!744250 (Some!758 (_2!11330 (h!30963 (toList!10163 (ListLongMap!20296 Nil!29755))))))))

(assert (= (and d!141933 c!125295) b!1304758))

(assert (= (and d!141933 (not c!125295)) b!1304759))

(assert (= (and b!1304759 c!125296) b!1304760))

(assert (= (and b!1304759 (not c!125296)) b!1304761))

(declare-fun m!1195847 () Bool)

(assert (=> b!1304760 m!1195847))

(assert (=> b!1304493 d!141933))

(assert (=> b!1304522 d!141825))

(declare-fun d!141935 () Bool)

(assert (=> d!141935 (isDefined!514 (getValueByKey!707 (toList!10163 (ListLongMap!20296 Nil!29755)) k0!1205))))

(declare-fun lt!584012 () Unit!43194)

(assert (=> d!141935 (= lt!584012 (choose!1932 (toList!10163 (ListLongMap!20296 Nil!29755)) k0!1205))))

(declare-fun e!744252 () Bool)

(assert (=> d!141935 e!744252))

(declare-fun res!866479 () Bool)

(assert (=> d!141935 (=> (not res!866479) (not e!744252))))

(assert (=> d!141935 (= res!866479 (isStrictlySorted!873 (toList!10163 (ListLongMap!20296 Nil!29755))))))

(assert (=> d!141935 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!475 (toList!10163 (ListLongMap!20296 Nil!29755)) k0!1205) lt!584012)))

(declare-fun b!1304762 () Bool)

(assert (=> b!1304762 (= e!744252 (containsKey!729 (toList!10163 (ListLongMap!20296 Nil!29755)) k0!1205))))

(assert (= (and d!141935 res!866479) b!1304762))

(assert (=> d!141935 m!1195453))

(assert (=> d!141935 m!1195453))

(assert (=> d!141935 m!1195455))

(declare-fun m!1195849 () Bool)

(assert (=> d!141935 m!1195849))

(declare-fun m!1195851 () Bool)

(assert (=> d!141935 m!1195851))

(assert (=> b!1304762 m!1195449))

(assert (=> b!1304491 d!141935))

(assert (=> b!1304491 d!141931))

(assert (=> b!1304491 d!141933))

(assert (=> b!1304602 d!141825))

(declare-fun d!141937 () Bool)

(assert (=> d!141937 (= (isDefined!514 (getValueByKey!707 (toList!10163 (getCurrentListMap!5181 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)) (not (isEmpty!1067 (getValueByKey!707 (toList!10163 (getCurrentListMap!5181 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))))

(declare-fun bs!37168 () Bool)

(assert (= bs!37168 d!141937))

(assert (=> bs!37168 m!1195501))

(declare-fun m!1195853 () Bool)

(assert (=> bs!37168 m!1195853))

(assert (=> b!1304552 d!141937))

(declare-fun b!1304765 () Bool)

(declare-fun e!744254 () Option!759)

(assert (=> b!1304765 (= e!744254 (getValueByKey!707 (t!43356 (toList!10163 (getCurrentListMap!5181 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) k0!1205))))

(declare-fun c!125297 () Bool)

(declare-fun d!141939 () Bool)

(assert (=> d!141939 (= c!125297 (and ((_ is Cons!29754) (toList!10163 (getCurrentListMap!5181 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (= (_1!11330 (h!30963 (toList!10163 (getCurrentListMap!5181 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205)))))

(declare-fun e!744253 () Option!759)

(assert (=> d!141939 (= (getValueByKey!707 (toList!10163 (getCurrentListMap!5181 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) e!744253)))

(declare-fun b!1304764 () Bool)

(assert (=> b!1304764 (= e!744253 e!744254)))

(declare-fun c!125298 () Bool)

(assert (=> b!1304764 (= c!125298 (and ((_ is Cons!29754) (toList!10163 (getCurrentListMap!5181 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))) (not (= (_1!11330 (h!30963 (toList!10163 (getCurrentListMap!5181 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)))) k0!1205))))))

(declare-fun b!1304766 () Bool)

(assert (=> b!1304766 (= e!744254 None!757)))

(declare-fun b!1304763 () Bool)

(assert (=> b!1304763 (= e!744253 (Some!758 (_2!11330 (h!30963 (toList!10163 (getCurrentListMap!5181 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))))

(assert (= (and d!141939 c!125297) b!1304763))

(assert (= (and d!141939 (not c!125297)) b!1304764))

(assert (= (and b!1304764 c!125298) b!1304765))

(assert (= (and b!1304764 (not c!125298)) b!1304766))

(declare-fun m!1195855 () Bool)

(assert (=> b!1304765 m!1195855))

(assert (=> b!1304552 d!141939))

(declare-fun d!141941 () Bool)

(declare-fun e!744255 () Bool)

(assert (=> d!141941 e!744255))

(declare-fun res!866480 () Bool)

(assert (=> d!141941 (=> res!866480 e!744255)))

(declare-fun lt!584015 () Bool)

(assert (=> d!141941 (= res!866480 (not lt!584015))))

(declare-fun lt!584016 () Bool)

(assert (=> d!141941 (= lt!584015 lt!584016)))

(declare-fun lt!584014 () Unit!43194)

(declare-fun e!744256 () Unit!43194)

(assert (=> d!141941 (= lt!584014 e!744256)))

(declare-fun c!125299 () Bool)

(assert (=> d!141941 (= c!125299 lt!584016)))

(assert (=> d!141941 (= lt!584016 (containsKey!729 (toList!10163 lt!583885) (select (arr!41926 _keys!1741) from!2144)))))

(assert (=> d!141941 (= (contains!8303 lt!583885 (select (arr!41926 _keys!1741) from!2144)) lt!584015)))

(declare-fun b!1304767 () Bool)

(declare-fun lt!584013 () Unit!43194)

(assert (=> b!1304767 (= e!744256 lt!584013)))

(assert (=> b!1304767 (= lt!584013 (lemmaContainsKeyImpliesGetValueByKeyDefined!475 (toList!10163 lt!583885) (select (arr!41926 _keys!1741) from!2144)))))

(assert (=> b!1304767 (isDefined!514 (getValueByKey!707 (toList!10163 lt!583885) (select (arr!41926 _keys!1741) from!2144)))))

(declare-fun b!1304768 () Bool)

(declare-fun Unit!43209 () Unit!43194)

(assert (=> b!1304768 (= e!744256 Unit!43209)))

(declare-fun b!1304769 () Bool)

(assert (=> b!1304769 (= e!744255 (isDefined!514 (getValueByKey!707 (toList!10163 lt!583885) (select (arr!41926 _keys!1741) from!2144))))))

(assert (= (and d!141941 c!125299) b!1304767))

(assert (= (and d!141941 (not c!125299)) b!1304768))

(assert (= (and d!141941 (not res!866480)) b!1304769))

(assert (=> d!141941 m!1195387))

(declare-fun m!1195857 () Bool)

(assert (=> d!141941 m!1195857))

(assert (=> b!1304767 m!1195387))

(declare-fun m!1195859 () Bool)

(assert (=> b!1304767 m!1195859))

(assert (=> b!1304767 m!1195387))

(assert (=> b!1304767 m!1195793))

(assert (=> b!1304767 m!1195793))

(declare-fun m!1195861 () Bool)

(assert (=> b!1304767 m!1195861))

(assert (=> b!1304769 m!1195387))

(assert (=> b!1304769 m!1195793))

(assert (=> b!1304769 m!1195793))

(assert (=> b!1304769 m!1195861))

(assert (=> b!1304600 d!141941))

(declare-fun d!141943 () Bool)

(assert (=> d!141943 (isDefined!514 (getValueByKey!707 (toList!10163 (getCurrentListMap!5181 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun lt!584017 () Unit!43194)

(assert (=> d!141943 (= lt!584017 (choose!1932 (toList!10163 (getCurrentListMap!5181 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun e!744257 () Bool)

(assert (=> d!141943 e!744257))

(declare-fun res!866481 () Bool)

(assert (=> d!141943 (=> (not res!866481) (not e!744257))))

(assert (=> d!141943 (= res!866481 (isStrictlySorted!873 (toList!10163 (getCurrentListMap!5181 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))))

(assert (=> d!141943 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!475 (toList!10163 (getCurrentListMap!5181 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205) lt!584017)))

(declare-fun b!1304770 () Bool)

(assert (=> b!1304770 (= e!744257 (containsKey!729 (toList!10163 (getCurrentListMap!5181 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (= (and d!141943 res!866481) b!1304770))

(assert (=> d!141943 m!1195501))

(assert (=> d!141943 m!1195501))

(assert (=> d!141943 m!1195503))

(declare-fun m!1195863 () Bool)

(assert (=> d!141943 m!1195863))

(declare-fun m!1195865 () Bool)

(assert (=> d!141943 m!1195865))

(assert (=> b!1304770 m!1195497))

(assert (=> b!1304550 d!141943))

(assert (=> b!1304550 d!141937))

(assert (=> b!1304550 d!141939))

(declare-fun d!141945 () Bool)

(assert (=> d!141945 (= (apply!1024 lt!583885 #b1000000000000000000000000000000000000000000000000000000000000000) (get!21178 (getValueByKey!707 (toList!10163 lt!583885) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37169 () Bool)

(assert (= bs!37169 d!141945))

(assert (=> bs!37169 m!1195783))

(assert (=> bs!37169 m!1195783))

(declare-fun m!1195867 () Bool)

(assert (=> bs!37169 m!1195867))

(assert (=> b!1304601 d!141945))

(declare-fun condMapEmpty!54000 () Bool)

(declare-fun mapDefault!54000 () ValueCell!16566)

(assert (=> mapNonEmpty!53999 (= condMapEmpty!54000 (= mapRest!53999 ((as const (Array (_ BitVec 32) ValueCell!16566)) mapDefault!54000)))))

(declare-fun e!744259 () Bool)

(declare-fun mapRes!54000 () Bool)

(assert (=> mapNonEmpty!53999 (= tp!103034 (and e!744259 mapRes!54000))))

(declare-fun b!1304771 () Bool)

(declare-fun e!744258 () Bool)

(assert (=> b!1304771 (= e!744258 tp_is_empty!34929)))

(declare-fun mapIsEmpty!54000 () Bool)

(assert (=> mapIsEmpty!54000 mapRes!54000))

(declare-fun b!1304772 () Bool)

(assert (=> b!1304772 (= e!744259 tp_is_empty!34929)))

(declare-fun mapNonEmpty!54000 () Bool)

(declare-fun tp!103035 () Bool)

(assert (=> mapNonEmpty!54000 (= mapRes!54000 (and tp!103035 e!744258))))

(declare-fun mapValue!54000 () ValueCell!16566)

(declare-fun mapKey!54000 () (_ BitVec 32))

(declare-fun mapRest!54000 () (Array (_ BitVec 32) ValueCell!16566))

(assert (=> mapNonEmpty!54000 (= mapRest!53999 (store mapRest!54000 mapKey!54000 mapValue!54000))))

(assert (= (and mapNonEmpty!53999 condMapEmpty!54000) mapIsEmpty!54000))

(assert (= (and mapNonEmpty!53999 (not condMapEmpty!54000)) mapNonEmpty!54000))

(assert (= (and mapNonEmpty!54000 ((_ is ValueCellFull!16566) mapValue!54000)) b!1304771))

(assert (= (and mapNonEmpty!53999 ((_ is ValueCellFull!16566) mapDefault!54000)) b!1304772))

(declare-fun m!1195869 () Bool)

(assert (=> mapNonEmpty!54000 m!1195869))

(declare-fun b_lambda!23323 () Bool)

(assert (= b_lambda!23319 (or (and start!110166 b_free!29289) b_lambda!23323)))

(declare-fun b_lambda!23325 () Bool)

(assert (= b_lambda!23321 (or (and start!110166 b_free!29289) b_lambda!23325)))

(check-sat (not d!141855) (not d!141915) (not d!141897) (not b!1304757) (not d!141895) (not d!141849) (not b_lambda!23317) (not d!141901) (not b!1304750) (not b!1304649) tp_is_empty!34929 (not d!141875) (not b!1304725) (not b_lambda!23325) (not b!1304650) (not b!1304673) (not b_lambda!23323) (not d!141921) (not d!141839) (not bm!64299) (not d!141945) (not b!1304681) (not d!141903) (not d!141931) (not b!1304760) (not b_next!29289) (not b!1304626) (not b!1304748) (not b!1304661) (not b!1304688) (not b!1304767) (not b!1304648) (not b!1304769) (not d!141881) (not b!1304647) (not b_lambda!23313) (not b!1304669) (not d!141925) (not d!141847) (not d!141909) (not b!1304765) (not d!141887) (not d!141937) (not b!1304755) (not b!1304752) (not d!141863) (not d!141935) (not b!1304696) (not b!1304690) (not d!141891) (not b_lambda!23315) (not d!141943) (not b!1304739) (not b!1304635) (not d!141883) (not b!1304687) (not b!1304718) (not d!141917) b_and!47481 (not b!1304717) (not b!1304638) (not d!141865) (not bm!64297) (not b!1304727) (not b!1304671) (not b!1304762) (not b!1304753) (not d!141859) (not d!141857) (not b!1304642) (not b!1304624) (not b!1304737) (not b!1304640) (not b!1304742) (not d!141885) (not d!141913) (not d!141877) (not b!1304670) (not b!1304668) (not d!141843) (not b!1304644) (not d!141851) (not b!1304744) (not d!141841) (not b!1304745) (not d!141869) (not b!1304678) (not b!1304735) (not d!141941) (not b!1304729) (not d!141871) (not b!1304746) (not b!1304636) (not b!1304738) (not d!141905) (not b!1304720) (not b!1304726) (not mapNonEmpty!54000) (not d!141853) (not b!1304680) (not d!141927) (not b!1304679) (not d!141861) (not d!141919) (not d!141845) (not b!1304637) (not b!1304667) (not b!1304736) (not d!141867) (not b!1304710) (not b!1304645) (not bm!64298) (not b!1304723) (not b!1304770))
(check-sat b_and!47481 (not b_next!29289))

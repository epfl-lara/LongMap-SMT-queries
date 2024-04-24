; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97284 () Bool)

(assert start!97284)

(declare-fun b!1105246 () Bool)

(declare-fun e!631011 () Bool)

(declare-datatypes ((array!71629 0))(
  ( (array!71630 (arr!34465 (Array (_ BitVec 32) (_ BitVec 64))) (size!35002 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71629)

(assert (=> b!1105246 (= e!631011 (and (bvsle #b00000000000000000000000000000000 (size!35002 _keys!1208)) (bvsge (size!35002 _keys!1208) #b01111111111111111111111111111111)))))

(declare-fun b!1105247 () Bool)

(declare-fun res!737002 () Bool)

(assert (=> b!1105247 (=> (not res!737002) (not e!631011))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1105247 (= res!737002 (validKeyInArray!0 k0!934))))

(declare-fun b!1105248 () Bool)

(declare-fun res!737006 () Bool)

(assert (=> b!1105248 (=> (not res!737006) (not e!631011))))

(declare-datatypes ((List!24071 0))(
  ( (Nil!24068) (Cons!24067 (h!25285 (_ BitVec 64)) (t!34328 List!24071)) )
))
(declare-fun arrayNoDuplicates!0 (array!71629 (_ BitVec 32) List!24071) Bool)

(assert (=> b!1105248 (= res!737006 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24068))))

(declare-fun b!1105249 () Bool)

(declare-fun res!736999 () Bool)

(assert (=> b!1105249 (=> (not res!736999) (not e!631011))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!41577 0))(
  ( (V!41578 (val!13725 Int)) )
))
(declare-datatypes ((ValueCell!12959 0))(
  ( (ValueCellFull!12959 (v!16353 V!41577)) (EmptyCell!12959) )
))
(declare-datatypes ((array!71631 0))(
  ( (array!71632 (arr!34466 (Array (_ BitVec 32) ValueCell!12959)) (size!35003 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71631)

(assert (=> b!1105249 (= res!736999 (and (= (size!35003 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35002 _keys!1208) (size!35003 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1105250 () Bool)

(declare-fun res!737007 () Bool)

(assert (=> b!1105250 (=> (not res!737007) (not e!631011))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1105250 (= res!737007 (= (select (arr!34465 _keys!1208) i!673) k0!934))))

(declare-fun res!737000 () Bool)

(assert (=> start!97284 (=> (not res!737000) (not e!631011))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97284 (= res!737000 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35002 _keys!1208))))))

(assert (=> start!97284 e!631011))

(declare-fun array_inv!26574 (array!71629) Bool)

(assert (=> start!97284 (array_inv!26574 _keys!1208)))

(assert (=> start!97284 true))

(declare-fun e!631008 () Bool)

(declare-fun array_inv!26575 (array!71631) Bool)

(assert (=> start!97284 (and (array_inv!26575 _values!996) e!631008)))

(declare-fun b!1105251 () Bool)

(declare-fun e!631007 () Bool)

(declare-fun mapRes!42811 () Bool)

(assert (=> b!1105251 (= e!631008 (and e!631007 mapRes!42811))))

(declare-fun condMapEmpty!42811 () Bool)

(declare-fun mapDefault!42811 () ValueCell!12959)

(assert (=> b!1105251 (= condMapEmpty!42811 (= (arr!34466 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12959)) mapDefault!42811)))))

(declare-fun b!1105252 () Bool)

(declare-fun res!737005 () Bool)

(assert (=> b!1105252 (=> (not res!737005) (not e!631011))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71629 (_ BitVec 32)) Bool)

(assert (=> b!1105252 (= res!737005 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!42811 () Bool)

(declare-fun tp!81731 () Bool)

(declare-fun e!631010 () Bool)

(assert (=> mapNonEmpty!42811 (= mapRes!42811 (and tp!81731 e!631010))))

(declare-fun mapKey!42811 () (_ BitVec 32))

(declare-fun mapRest!42811 () (Array (_ BitVec 32) ValueCell!12959))

(declare-fun mapValue!42811 () ValueCell!12959)

(assert (=> mapNonEmpty!42811 (= (arr!34466 _values!996) (store mapRest!42811 mapKey!42811 mapValue!42811))))

(declare-fun b!1105253 () Bool)

(declare-fun res!737001 () Bool)

(assert (=> b!1105253 (=> (not res!737001) (not e!631011))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1105253 (= res!737001 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!42811 () Bool)

(assert (=> mapIsEmpty!42811 mapRes!42811))

(declare-fun b!1105254 () Bool)

(declare-fun tp_is_empty!27337 () Bool)

(assert (=> b!1105254 (= e!631007 tp_is_empty!27337)))

(declare-fun b!1105255 () Bool)

(assert (=> b!1105255 (= e!631010 tp_is_empty!27337)))

(declare-fun b!1105256 () Bool)

(declare-fun res!737003 () Bool)

(assert (=> b!1105256 (=> (not res!737003) (not e!631011))))

(assert (=> b!1105256 (= res!737003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!71630 (store (arr!34465 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35002 _keys!1208)) mask!1564))))

(declare-fun b!1105257 () Bool)

(declare-fun res!737004 () Bool)

(assert (=> b!1105257 (=> (not res!737004) (not e!631011))))

(assert (=> b!1105257 (= res!737004 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35002 _keys!1208))))))

(assert (= (and start!97284 res!737000) b!1105253))

(assert (= (and b!1105253 res!737001) b!1105249))

(assert (= (and b!1105249 res!736999) b!1105252))

(assert (= (and b!1105252 res!737005) b!1105248))

(assert (= (and b!1105248 res!737006) b!1105257))

(assert (= (and b!1105257 res!737004) b!1105247))

(assert (= (and b!1105247 res!737002) b!1105250))

(assert (= (and b!1105250 res!737007) b!1105256))

(assert (= (and b!1105256 res!737003) b!1105246))

(assert (= (and b!1105251 condMapEmpty!42811) mapIsEmpty!42811))

(assert (= (and b!1105251 (not condMapEmpty!42811)) mapNonEmpty!42811))

(get-info :version)

(assert (= (and mapNonEmpty!42811 ((_ is ValueCellFull!12959) mapValue!42811)) b!1105255))

(assert (= (and b!1105251 ((_ is ValueCellFull!12959) mapDefault!42811)) b!1105254))

(assert (= start!97284 b!1105251))

(declare-fun m!1025533 () Bool)

(assert (=> b!1105253 m!1025533))

(declare-fun m!1025535 () Bool)

(assert (=> b!1105248 m!1025535))

(declare-fun m!1025537 () Bool)

(assert (=> b!1105256 m!1025537))

(declare-fun m!1025539 () Bool)

(assert (=> b!1105256 m!1025539))

(declare-fun m!1025541 () Bool)

(assert (=> start!97284 m!1025541))

(declare-fun m!1025543 () Bool)

(assert (=> start!97284 m!1025543))

(declare-fun m!1025545 () Bool)

(assert (=> b!1105252 m!1025545))

(declare-fun m!1025547 () Bool)

(assert (=> b!1105247 m!1025547))

(declare-fun m!1025549 () Bool)

(assert (=> mapNonEmpty!42811 m!1025549))

(declare-fun m!1025551 () Bool)

(assert (=> b!1105250 m!1025551))

(check-sat (not b!1105253) tp_is_empty!27337 (not b!1105247) (not b!1105256) (not start!97284) (not b!1105248) (not b!1105252) (not mapNonEmpty!42811))
(check-sat)
(get-model)

(declare-fun d!131315 () Bool)

(assert (=> d!131315 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1105247 d!131315))

(declare-fun bm!46392 () Bool)

(declare-fun call!46395 () Bool)

(assert (=> bm!46392 (= call!46395 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!71630 (store (arr!34465 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35002 _keys!1208)) mask!1564))))

(declare-fun b!1105338 () Bool)

(declare-fun e!631049 () Bool)

(assert (=> b!1105338 (= e!631049 call!46395)))

(declare-fun b!1105339 () Bool)

(declare-fun e!631050 () Bool)

(assert (=> b!1105339 (= e!631050 e!631049)))

(declare-fun c!109392 () Bool)

(assert (=> b!1105339 (= c!109392 (validKeyInArray!0 (select (arr!34465 (array!71630 (store (arr!34465 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35002 _keys!1208))) #b00000000000000000000000000000000)))))

(declare-fun b!1105340 () Bool)

(declare-fun e!631048 () Bool)

(assert (=> b!1105340 (= e!631048 call!46395)))

(declare-fun d!131317 () Bool)

(declare-fun res!737067 () Bool)

(assert (=> d!131317 (=> res!737067 e!631050)))

(assert (=> d!131317 (= res!737067 (bvsge #b00000000000000000000000000000000 (size!35002 (array!71630 (store (arr!34465 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35002 _keys!1208)))))))

(assert (=> d!131317 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!71630 (store (arr!34465 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35002 _keys!1208)) mask!1564) e!631050)))

(declare-fun b!1105341 () Bool)

(assert (=> b!1105341 (= e!631049 e!631048)))

(declare-fun lt!495615 () (_ BitVec 64))

(assert (=> b!1105341 (= lt!495615 (select (arr!34465 (array!71630 (store (arr!34465 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35002 _keys!1208))) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!36237 0))(
  ( (Unit!36238) )
))
(declare-fun lt!495613 () Unit!36237)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71629 (_ BitVec 64) (_ BitVec 32)) Unit!36237)

(assert (=> b!1105341 (= lt!495613 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71630 (store (arr!34465 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35002 _keys!1208)) lt!495615 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!71629 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1105341 (arrayContainsKey!0 (array!71630 (store (arr!34465 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35002 _keys!1208)) lt!495615 #b00000000000000000000000000000000)))

(declare-fun lt!495614 () Unit!36237)

(assert (=> b!1105341 (= lt!495614 lt!495613)))

(declare-fun res!737066 () Bool)

(declare-datatypes ((SeekEntryResult!9877 0))(
  ( (MissingZero!9877 (index!41879 (_ BitVec 32))) (Found!9877 (index!41880 (_ BitVec 32))) (Intermediate!9877 (undefined!10689 Bool) (index!41881 (_ BitVec 32)) (x!99278 (_ BitVec 32))) (Undefined!9877) (MissingVacant!9877 (index!41882 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71629 (_ BitVec 32)) SeekEntryResult!9877)

(assert (=> b!1105341 (= res!737066 (= (seekEntryOrOpen!0 (select (arr!34465 (array!71630 (store (arr!34465 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35002 _keys!1208))) #b00000000000000000000000000000000) (array!71630 (store (arr!34465 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35002 _keys!1208)) mask!1564) (Found!9877 #b00000000000000000000000000000000)))))

(assert (=> b!1105341 (=> (not res!737066) (not e!631048))))

(assert (= (and d!131317 (not res!737067)) b!1105339))

(assert (= (and b!1105339 c!109392) b!1105341))

(assert (= (and b!1105339 (not c!109392)) b!1105338))

(assert (= (and b!1105341 res!737066) b!1105340))

(assert (= (or b!1105340 b!1105338) bm!46392))

(declare-fun m!1025593 () Bool)

(assert (=> bm!46392 m!1025593))

(declare-fun m!1025595 () Bool)

(assert (=> b!1105339 m!1025595))

(assert (=> b!1105339 m!1025595))

(declare-fun m!1025597 () Bool)

(assert (=> b!1105339 m!1025597))

(assert (=> b!1105341 m!1025595))

(declare-fun m!1025599 () Bool)

(assert (=> b!1105341 m!1025599))

(declare-fun m!1025601 () Bool)

(assert (=> b!1105341 m!1025601))

(assert (=> b!1105341 m!1025595))

(declare-fun m!1025603 () Bool)

(assert (=> b!1105341 m!1025603))

(assert (=> b!1105256 d!131317))

(declare-fun bm!46393 () Bool)

(declare-fun call!46396 () Bool)

(assert (=> bm!46393 (= call!46396 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1105342 () Bool)

(declare-fun e!631052 () Bool)

(assert (=> b!1105342 (= e!631052 call!46396)))

(declare-fun b!1105343 () Bool)

(declare-fun e!631053 () Bool)

(assert (=> b!1105343 (= e!631053 e!631052)))

(declare-fun c!109393 () Bool)

(assert (=> b!1105343 (= c!109393 (validKeyInArray!0 (select (arr!34465 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1105344 () Bool)

(declare-fun e!631051 () Bool)

(assert (=> b!1105344 (= e!631051 call!46396)))

(declare-fun d!131319 () Bool)

(declare-fun res!737069 () Bool)

(assert (=> d!131319 (=> res!737069 e!631053)))

(assert (=> d!131319 (= res!737069 (bvsge #b00000000000000000000000000000000 (size!35002 _keys!1208)))))

(assert (=> d!131319 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!631053)))

(declare-fun b!1105345 () Bool)

(assert (=> b!1105345 (= e!631052 e!631051)))

(declare-fun lt!495618 () (_ BitVec 64))

(assert (=> b!1105345 (= lt!495618 (select (arr!34465 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!495616 () Unit!36237)

(assert (=> b!1105345 (= lt!495616 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!495618 #b00000000000000000000000000000000))))

(assert (=> b!1105345 (arrayContainsKey!0 _keys!1208 lt!495618 #b00000000000000000000000000000000)))

(declare-fun lt!495617 () Unit!36237)

(assert (=> b!1105345 (= lt!495617 lt!495616)))

(declare-fun res!737068 () Bool)

(assert (=> b!1105345 (= res!737068 (= (seekEntryOrOpen!0 (select (arr!34465 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9877 #b00000000000000000000000000000000)))))

(assert (=> b!1105345 (=> (not res!737068) (not e!631051))))

(assert (= (and d!131319 (not res!737069)) b!1105343))

(assert (= (and b!1105343 c!109393) b!1105345))

(assert (= (and b!1105343 (not c!109393)) b!1105342))

(assert (= (and b!1105345 res!737068) b!1105344))

(assert (= (or b!1105344 b!1105342) bm!46393))

(declare-fun m!1025605 () Bool)

(assert (=> bm!46393 m!1025605))

(declare-fun m!1025607 () Bool)

(assert (=> b!1105343 m!1025607))

(assert (=> b!1105343 m!1025607))

(declare-fun m!1025609 () Bool)

(assert (=> b!1105343 m!1025609))

(assert (=> b!1105345 m!1025607))

(declare-fun m!1025611 () Bool)

(assert (=> b!1105345 m!1025611))

(declare-fun m!1025613 () Bool)

(assert (=> b!1105345 m!1025613))

(assert (=> b!1105345 m!1025607))

(declare-fun m!1025615 () Bool)

(assert (=> b!1105345 m!1025615))

(assert (=> b!1105252 d!131319))

(declare-fun d!131321 () Bool)

(assert (=> d!131321 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1105253 d!131321))

(declare-fun d!131323 () Bool)

(assert (=> d!131323 (= (array_inv!26574 _keys!1208) (bvsge (size!35002 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!97284 d!131323))

(declare-fun d!131325 () Bool)

(assert (=> d!131325 (= (array_inv!26575 _values!996) (bvsge (size!35003 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!97284 d!131325))

(declare-fun b!1105356 () Bool)

(declare-fun e!631063 () Bool)

(declare-fun e!631065 () Bool)

(assert (=> b!1105356 (= e!631063 e!631065)))

(declare-fun res!737078 () Bool)

(assert (=> b!1105356 (=> (not res!737078) (not e!631065))))

(declare-fun e!631062 () Bool)

(assert (=> b!1105356 (= res!737078 (not e!631062))))

(declare-fun res!737077 () Bool)

(assert (=> b!1105356 (=> (not res!737077) (not e!631062))))

(assert (=> b!1105356 (= res!737077 (validKeyInArray!0 (select (arr!34465 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!46396 () Bool)

(declare-fun call!46399 () Bool)

(declare-fun c!109396 () Bool)

(assert (=> bm!46396 (= call!46399 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!109396 (Cons!24067 (select (arr!34465 _keys!1208) #b00000000000000000000000000000000) Nil!24068) Nil!24068)))))

(declare-fun b!1105357 () Bool)

(declare-fun e!631064 () Bool)

(assert (=> b!1105357 (= e!631065 e!631064)))

(assert (=> b!1105357 (= c!109396 (validKeyInArray!0 (select (arr!34465 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1105358 () Bool)

(assert (=> b!1105358 (= e!631064 call!46399)))

(declare-fun b!1105359 () Bool)

(assert (=> b!1105359 (= e!631064 call!46399)))

(declare-fun d!131327 () Bool)

(declare-fun res!737076 () Bool)

(assert (=> d!131327 (=> res!737076 e!631063)))

(assert (=> d!131327 (= res!737076 (bvsge #b00000000000000000000000000000000 (size!35002 _keys!1208)))))

(assert (=> d!131327 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24068) e!631063)))

(declare-fun b!1105360 () Bool)

(declare-fun contains!6438 (List!24071 (_ BitVec 64)) Bool)

(assert (=> b!1105360 (= e!631062 (contains!6438 Nil!24068 (select (arr!34465 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!131327 (not res!737076)) b!1105356))

(assert (= (and b!1105356 res!737077) b!1105360))

(assert (= (and b!1105356 res!737078) b!1105357))

(assert (= (and b!1105357 c!109396) b!1105358))

(assert (= (and b!1105357 (not c!109396)) b!1105359))

(assert (= (or b!1105358 b!1105359) bm!46396))

(assert (=> b!1105356 m!1025607))

(assert (=> b!1105356 m!1025607))

(assert (=> b!1105356 m!1025609))

(assert (=> bm!46396 m!1025607))

(declare-fun m!1025617 () Bool)

(assert (=> bm!46396 m!1025617))

(assert (=> b!1105357 m!1025607))

(assert (=> b!1105357 m!1025607))

(assert (=> b!1105357 m!1025609))

(assert (=> b!1105360 m!1025607))

(assert (=> b!1105360 m!1025607))

(declare-fun m!1025619 () Bool)

(assert (=> b!1105360 m!1025619))

(assert (=> b!1105248 d!131327))

(declare-fun mapNonEmpty!42820 () Bool)

(declare-fun mapRes!42820 () Bool)

(declare-fun tp!81740 () Bool)

(declare-fun e!631071 () Bool)

(assert (=> mapNonEmpty!42820 (= mapRes!42820 (and tp!81740 e!631071))))

(declare-fun mapValue!42820 () ValueCell!12959)

(declare-fun mapKey!42820 () (_ BitVec 32))

(declare-fun mapRest!42820 () (Array (_ BitVec 32) ValueCell!12959))

(assert (=> mapNonEmpty!42820 (= mapRest!42811 (store mapRest!42820 mapKey!42820 mapValue!42820))))

(declare-fun b!1105367 () Bool)

(assert (=> b!1105367 (= e!631071 tp_is_empty!27337)))

(declare-fun condMapEmpty!42820 () Bool)

(declare-fun mapDefault!42820 () ValueCell!12959)

(assert (=> mapNonEmpty!42811 (= condMapEmpty!42820 (= mapRest!42811 ((as const (Array (_ BitVec 32) ValueCell!12959)) mapDefault!42820)))))

(declare-fun e!631070 () Bool)

(assert (=> mapNonEmpty!42811 (= tp!81731 (and e!631070 mapRes!42820))))

(declare-fun mapIsEmpty!42820 () Bool)

(assert (=> mapIsEmpty!42820 mapRes!42820))

(declare-fun b!1105368 () Bool)

(assert (=> b!1105368 (= e!631070 tp_is_empty!27337)))

(assert (= (and mapNonEmpty!42811 condMapEmpty!42820) mapIsEmpty!42820))

(assert (= (and mapNonEmpty!42811 (not condMapEmpty!42820)) mapNonEmpty!42820))

(assert (= (and mapNonEmpty!42820 ((_ is ValueCellFull!12959) mapValue!42820)) b!1105367))

(assert (= (and mapNonEmpty!42811 ((_ is ValueCellFull!12959) mapDefault!42820)) b!1105368))

(declare-fun m!1025621 () Bool)

(assert (=> mapNonEmpty!42820 m!1025621))

(check-sat (not bm!46392) (not b!1105360) (not bm!46393) tp_is_empty!27337 (not b!1105341) (not mapNonEmpty!42820) (not b!1105343) (not b!1105357) (not bm!46396) (not b!1105339) (not b!1105356) (not b!1105345))
(check-sat)

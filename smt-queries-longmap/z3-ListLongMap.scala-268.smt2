; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4408 () Bool)

(assert start!4408)

(declare-fun b_free!1197 () Bool)

(declare-fun b_next!1197 () Bool)

(assert (=> start!4408 (= b_free!1197 (not b_next!1197))))

(declare-fun tp!5026 () Bool)

(declare-fun b_and!2017 () Bool)

(assert (=> start!4408 (= tp!5026 b_and!2017)))

(declare-fun b!34023 () Bool)

(declare-fun e!21601 () Bool)

(assert (=> b!34023 (= e!21601 (not false))))

(declare-fun lt!12570 () (_ BitVec 32))

(declare-datatypes ((array!2317 0))(
  ( (array!2318 (arr!1107 (Array (_ BitVec 32) (_ BitVec 64))) (size!1208 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2317)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2317 (_ BitVec 32)) Bool)

(assert (=> b!34023 (arrayForallSeekEntryOrOpenFound!0 lt!12570 _keys!1833 mask!2294)))

(declare-datatypes ((Unit!766 0))(
  ( (Unit!767) )
))
(declare-fun lt!12567 () Unit!766)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!2317 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!766)

(assert (=> b!34023 (= lt!12567 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1833 mask!2294 #b00000000000000000000000000000000 lt!12570))))

(declare-datatypes ((SeekEntryResult!136 0))(
  ( (MissingZero!136 (index!2666 (_ BitVec 32))) (Found!136 (index!2667 (_ BitVec 32))) (Intermediate!136 (undefined!948 Bool) (index!2668 (_ BitVec 32)) (x!6872 (_ BitVec 32))) (Undefined!136) (MissingVacant!136 (index!2669 (_ BitVec 32))) )
))
(declare-fun lt!12568 () SeekEntryResult!136)

(get-info :version)

(assert (=> b!34023 (and ((_ is Found!136) lt!12568) (= (index!2667 lt!12568) lt!12570))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2317 (_ BitVec 32)) SeekEntryResult!136)

(assert (=> b!34023 (= lt!12568 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun lt!12569 () Unit!766)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!2317 (_ BitVec 32)) Unit!766)

(assert (=> b!34023 (= lt!12569 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!12570 _keys!1833 mask!2294))))

(declare-datatypes ((V!1893 0))(
  ( (V!1894 (val!802 Int)) )
))
(declare-datatypes ((tuple2!1304 0))(
  ( (tuple2!1305 (_1!663 (_ BitVec 64)) (_2!663 V!1893)) )
))
(declare-datatypes ((List!893 0))(
  ( (Nil!890) (Cons!889 (h!1456 tuple2!1304) (t!3596 List!893)) )
))
(declare-datatypes ((ListLongMap!881 0))(
  ( (ListLongMap!882 (toList!456 List!893)) )
))
(declare-fun lt!12572 () ListLongMap!881)

(declare-fun contains!401 (ListLongMap!881 (_ BitVec 64)) Bool)

(assert (=> b!34023 (contains!401 lt!12572 (select (arr!1107 _keys!1833) lt!12570))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!576 0))(
  ( (ValueCellFull!576 (v!1896 V!1893)) (EmptyCell!576) )
))
(declare-datatypes ((array!2319 0))(
  ( (array!2320 (arr!1108 (Array (_ BitVec 32) ValueCell!576)) (size!1209 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2319)

(declare-fun lt!12571 () Unit!766)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1893)

(declare-fun minValue!1443 () V!1893)

(declare-fun lemmaValidKeyInArrayIsInListMap!68 (array!2317 array!2319 (_ BitVec 32) (_ BitVec 32) V!1893 V!1893 (_ BitVec 32) Int) Unit!766)

(assert (=> b!34023 (= lt!12571 (lemmaValidKeyInArrayIsInListMap!68 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12570 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!2317 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!34023 (= lt!12570 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!34024 () Bool)

(declare-fun res!20648 () Bool)

(declare-fun e!21602 () Bool)

(assert (=> b!34024 (=> (not res!20648) (not e!21602))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!34024 (= res!20648 (validKeyInArray!0 k0!1304))))

(declare-fun b!34025 () Bool)

(declare-fun e!21603 () Bool)

(declare-fun tp_is_empty!1551 () Bool)

(assert (=> b!34025 (= e!21603 tp_is_empty!1551)))

(declare-fun b!34026 () Bool)

(declare-fun e!21604 () Bool)

(declare-fun mapRes!1870 () Bool)

(assert (=> b!34026 (= e!21604 (and e!21603 mapRes!1870))))

(declare-fun condMapEmpty!1870 () Bool)

(declare-fun mapDefault!1870 () ValueCell!576)

(assert (=> b!34026 (= condMapEmpty!1870 (= (arr!1108 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!576)) mapDefault!1870)))))

(declare-fun b!34027 () Bool)

(declare-fun res!20647 () Bool)

(assert (=> b!34027 (=> (not res!20647) (not e!21602))))

(assert (=> b!34027 (= res!20647 (and (= (size!1209 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1208 _keys!1833) (size!1209 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!34028 () Bool)

(declare-fun e!21600 () Bool)

(assert (=> b!34028 (= e!21600 tp_is_empty!1551)))

(declare-fun b!34022 () Bool)

(declare-fun res!20645 () Bool)

(assert (=> b!34022 (=> (not res!20645) (not e!21601))))

(declare-fun arrayContainsKey!0 (array!2317 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!34022 (= res!20645 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun res!20643 () Bool)

(assert (=> start!4408 (=> (not res!20643) (not e!21602))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4408 (= res!20643 (validMask!0 mask!2294))))

(assert (=> start!4408 e!21602))

(assert (=> start!4408 true))

(assert (=> start!4408 tp!5026))

(declare-fun array_inv!777 (array!2319) Bool)

(assert (=> start!4408 (and (array_inv!777 _values!1501) e!21604)))

(declare-fun array_inv!778 (array!2317) Bool)

(assert (=> start!4408 (array_inv!778 _keys!1833)))

(assert (=> start!4408 tp_is_empty!1551))

(declare-fun b!34029 () Bool)

(assert (=> b!34029 (= e!21602 e!21601)))

(declare-fun res!20646 () Bool)

(assert (=> b!34029 (=> (not res!20646) (not e!21601))))

(assert (=> b!34029 (= res!20646 (not (contains!401 lt!12572 k0!1304)))))

(declare-fun getCurrentListMap!281 (array!2317 array!2319 (_ BitVec 32) (_ BitVec 32) V!1893 V!1893 (_ BitVec 32) Int) ListLongMap!881)

(assert (=> b!34029 (= lt!12572 (getCurrentListMap!281 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun mapIsEmpty!1870 () Bool)

(assert (=> mapIsEmpty!1870 mapRes!1870))

(declare-fun b!34030 () Bool)

(declare-fun res!20649 () Bool)

(assert (=> b!34030 (=> (not res!20649) (not e!21602))))

(declare-datatypes ((List!894 0))(
  ( (Nil!891) (Cons!890 (h!1457 (_ BitVec 64)) (t!3597 List!894)) )
))
(declare-fun arrayNoDuplicates!0 (array!2317 (_ BitVec 32) List!894) Bool)

(assert (=> b!34030 (= res!20649 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!891))))

(declare-fun b!34031 () Bool)

(declare-fun res!20644 () Bool)

(assert (=> b!34031 (=> (not res!20644) (not e!21602))))

(assert (=> b!34031 (= res!20644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1870 () Bool)

(declare-fun tp!5025 () Bool)

(assert (=> mapNonEmpty!1870 (= mapRes!1870 (and tp!5025 e!21600))))

(declare-fun mapValue!1870 () ValueCell!576)

(declare-fun mapKey!1870 () (_ BitVec 32))

(declare-fun mapRest!1870 () (Array (_ BitVec 32) ValueCell!576))

(assert (=> mapNonEmpty!1870 (= (arr!1108 _values!1501) (store mapRest!1870 mapKey!1870 mapValue!1870))))

(assert (= (and start!4408 res!20643) b!34027))

(assert (= (and b!34027 res!20647) b!34031))

(assert (= (and b!34031 res!20644) b!34030))

(assert (= (and b!34030 res!20649) b!34024))

(assert (= (and b!34024 res!20648) b!34029))

(assert (= (and b!34029 res!20646) b!34022))

(assert (= (and b!34022 res!20645) b!34023))

(assert (= (and b!34026 condMapEmpty!1870) mapIsEmpty!1870))

(assert (= (and b!34026 (not condMapEmpty!1870)) mapNonEmpty!1870))

(assert (= (and mapNonEmpty!1870 ((_ is ValueCellFull!576) mapValue!1870)) b!34028))

(assert (= (and b!34026 ((_ is ValueCellFull!576) mapDefault!1870)) b!34025))

(assert (= start!4408 b!34026))

(declare-fun m!27379 () Bool)

(assert (=> mapNonEmpty!1870 m!27379))

(declare-fun m!27381 () Bool)

(assert (=> b!34023 m!27381))

(declare-fun m!27383 () Bool)

(assert (=> b!34023 m!27383))

(declare-fun m!27385 () Bool)

(assert (=> b!34023 m!27385))

(declare-fun m!27387 () Bool)

(assert (=> b!34023 m!27387))

(declare-fun m!27389 () Bool)

(assert (=> b!34023 m!27389))

(declare-fun m!27391 () Bool)

(assert (=> b!34023 m!27391))

(assert (=> b!34023 m!27385))

(declare-fun m!27393 () Bool)

(assert (=> b!34023 m!27393))

(declare-fun m!27395 () Bool)

(assert (=> b!34023 m!27395))

(declare-fun m!27397 () Bool)

(assert (=> b!34031 m!27397))

(declare-fun m!27399 () Bool)

(assert (=> b!34022 m!27399))

(declare-fun m!27401 () Bool)

(assert (=> b!34024 m!27401))

(declare-fun m!27403 () Bool)

(assert (=> start!4408 m!27403))

(declare-fun m!27405 () Bool)

(assert (=> start!4408 m!27405))

(declare-fun m!27407 () Bool)

(assert (=> start!4408 m!27407))

(declare-fun m!27409 () Bool)

(assert (=> b!34030 m!27409))

(declare-fun m!27411 () Bool)

(assert (=> b!34029 m!27411))

(declare-fun m!27413 () Bool)

(assert (=> b!34029 m!27413))

(check-sat (not b!34031) (not b!34023) tp_is_empty!1551 (not start!4408) (not b_next!1197) (not b!34024) (not mapNonEmpty!1870) (not b!34030) b_and!2017 (not b!34029) (not b!34022))
(check-sat b_and!2017 (not b_next!1197))
(get-model)

(declare-fun b!34072 () Bool)

(declare-fun e!21634 () Bool)

(declare-fun call!2726 () Bool)

(assert (=> b!34072 (= e!21634 call!2726)))

(declare-fun b!34073 () Bool)

(declare-fun e!21635 () Bool)

(declare-fun contains!403 (List!894 (_ BitVec 64)) Bool)

(assert (=> b!34073 (= e!21635 (contains!403 Nil!891 (select (arr!1107 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!34074 () Bool)

(assert (=> b!34074 (= e!21634 call!2726)))

(declare-fun b!34075 () Bool)

(declare-fun e!21633 () Bool)

(declare-fun e!21632 () Bool)

(assert (=> b!34075 (= e!21633 e!21632)))

(declare-fun res!20677 () Bool)

(assert (=> b!34075 (=> (not res!20677) (not e!21632))))

(assert (=> b!34075 (= res!20677 (not e!21635))))

(declare-fun res!20679 () Bool)

(assert (=> b!34075 (=> (not res!20679) (not e!21635))))

(assert (=> b!34075 (= res!20679 (validKeyInArray!0 (select (arr!1107 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!34076 () Bool)

(assert (=> b!34076 (= e!21632 e!21634)))

(declare-fun c!3920 () Bool)

(assert (=> b!34076 (= c!3920 (validKeyInArray!0 (select (arr!1107 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun d!5223 () Bool)

(declare-fun res!20678 () Bool)

(assert (=> d!5223 (=> res!20678 e!21633)))

(assert (=> d!5223 (= res!20678 (bvsge #b00000000000000000000000000000000 (size!1208 _keys!1833)))))

(assert (=> d!5223 (= (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!891) e!21633)))

(declare-fun bm!2723 () Bool)

(assert (=> bm!2723 (= call!2726 (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!3920 (Cons!890 (select (arr!1107 _keys!1833) #b00000000000000000000000000000000) Nil!891) Nil!891)))))

(assert (= (and d!5223 (not res!20678)) b!34075))

(assert (= (and b!34075 res!20679) b!34073))

(assert (= (and b!34075 res!20677) b!34076))

(assert (= (and b!34076 c!3920) b!34072))

(assert (= (and b!34076 (not c!3920)) b!34074))

(assert (= (or b!34072 b!34074) bm!2723))

(declare-fun m!27451 () Bool)

(assert (=> b!34073 m!27451))

(assert (=> b!34073 m!27451))

(declare-fun m!27453 () Bool)

(assert (=> b!34073 m!27453))

(assert (=> b!34075 m!27451))

(assert (=> b!34075 m!27451))

(declare-fun m!27455 () Bool)

(assert (=> b!34075 m!27455))

(assert (=> b!34076 m!27451))

(assert (=> b!34076 m!27451))

(assert (=> b!34076 m!27455))

(assert (=> bm!2723 m!27451))

(declare-fun m!27457 () Bool)

(assert (=> bm!2723 m!27457))

(assert (=> b!34030 d!5223))

(declare-fun b!34085 () Bool)

(declare-fun e!21643 () Bool)

(declare-fun call!2729 () Bool)

(assert (=> b!34085 (= e!21643 call!2729)))

(declare-fun d!5225 () Bool)

(declare-fun res!20685 () Bool)

(declare-fun e!21644 () Bool)

(assert (=> d!5225 (=> res!20685 e!21644)))

(assert (=> d!5225 (= res!20685 (bvsge #b00000000000000000000000000000000 (size!1208 _keys!1833)))))

(assert (=> d!5225 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!21644)))

(declare-fun b!34086 () Bool)

(declare-fun e!21642 () Bool)

(assert (=> b!34086 (= e!21643 e!21642)))

(declare-fun lt!12598 () (_ BitVec 64))

(assert (=> b!34086 (= lt!12598 (select (arr!1107 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12599 () Unit!766)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2317 (_ BitVec 64) (_ BitVec 32)) Unit!766)

(assert (=> b!34086 (= lt!12599 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!12598 #b00000000000000000000000000000000))))

(assert (=> b!34086 (arrayContainsKey!0 _keys!1833 lt!12598 #b00000000000000000000000000000000)))

(declare-fun lt!12597 () Unit!766)

(assert (=> b!34086 (= lt!12597 lt!12599)))

(declare-fun res!20684 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2317 (_ BitVec 32)) SeekEntryResult!136)

(assert (=> b!34086 (= res!20684 (= (seekEntryOrOpen!0 (select (arr!1107 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!136 #b00000000000000000000000000000000)))))

(assert (=> b!34086 (=> (not res!20684) (not e!21642))))

(declare-fun b!34087 () Bool)

(assert (=> b!34087 (= e!21644 e!21643)))

(declare-fun c!3923 () Bool)

(assert (=> b!34087 (= c!3923 (validKeyInArray!0 (select (arr!1107 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!34088 () Bool)

(assert (=> b!34088 (= e!21642 call!2729)))

(declare-fun bm!2726 () Bool)

(assert (=> bm!2726 (= call!2729 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(assert (= (and d!5225 (not res!20685)) b!34087))

(assert (= (and b!34087 c!3923) b!34086))

(assert (= (and b!34087 (not c!3923)) b!34085))

(assert (= (and b!34086 res!20684) b!34088))

(assert (= (or b!34088 b!34085) bm!2726))

(assert (=> b!34086 m!27451))

(declare-fun m!27459 () Bool)

(assert (=> b!34086 m!27459))

(declare-fun m!27461 () Bool)

(assert (=> b!34086 m!27461))

(assert (=> b!34086 m!27451))

(declare-fun m!27463 () Bool)

(assert (=> b!34086 m!27463))

(assert (=> b!34087 m!27451))

(assert (=> b!34087 m!27451))

(assert (=> b!34087 m!27455))

(declare-fun m!27465 () Bool)

(assert (=> bm!2726 m!27465))

(assert (=> b!34031 d!5225))

(declare-fun d!5227 () Bool)

(assert (=> d!5227 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!4408 d!5227))

(declare-fun d!5229 () Bool)

(assert (=> d!5229 (= (array_inv!777 _values!1501) (bvsge (size!1209 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!4408 d!5229))

(declare-fun d!5231 () Bool)

(assert (=> d!5231 (= (array_inv!778 _keys!1833) (bvsge (size!1208 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!4408 d!5231))

(declare-fun d!5233 () Bool)

(declare-fun lt!12602 () (_ BitVec 32))

(assert (=> d!5233 (and (or (bvslt lt!12602 #b00000000000000000000000000000000) (bvsge lt!12602 (size!1208 _keys!1833)) (and (bvsge lt!12602 #b00000000000000000000000000000000) (bvslt lt!12602 (size!1208 _keys!1833)))) (bvsge lt!12602 #b00000000000000000000000000000000) (bvslt lt!12602 (size!1208 _keys!1833)) (= (select (arr!1107 _keys!1833) lt!12602) k0!1304))))

(declare-fun e!21647 () (_ BitVec 32))

(assert (=> d!5233 (= lt!12602 e!21647)))

(declare-fun c!3926 () Bool)

(assert (=> d!5233 (= c!3926 (= (select (arr!1107 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5233 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1208 _keys!1833)) (bvslt (size!1208 _keys!1833) #b01111111111111111111111111111111))))

(assert (=> d!5233 (= (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) lt!12602)))

(declare-fun b!34093 () Bool)

(assert (=> b!34093 (= e!21647 #b00000000000000000000000000000000)))

(declare-fun b!34094 () Bool)

(assert (=> b!34094 (= e!21647 (arrayScanForKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5233 c!3926) b!34093))

(assert (= (and d!5233 (not c!3926)) b!34094))

(declare-fun m!27467 () Bool)

(assert (=> d!5233 m!27467))

(assert (=> d!5233 m!27451))

(declare-fun m!27469 () Bool)

(assert (=> b!34094 m!27469))

(assert (=> b!34023 d!5233))

(declare-fun b!34108 () Bool)

(declare-fun e!21656 () SeekEntryResult!136)

(declare-fun lt!12613 () SeekEntryResult!136)

(assert (=> b!34108 (= e!21656 (MissingZero!136 (index!2668 lt!12613)))))

(declare-fun b!34109 () Bool)

(declare-fun e!21655 () SeekEntryResult!136)

(assert (=> b!34109 (= e!21655 Undefined!136)))

(declare-fun b!34110 () Bool)

(declare-fun e!21654 () SeekEntryResult!136)

(assert (=> b!34110 (= e!21654 (Found!136 (index!2668 lt!12613)))))

(declare-fun b!34111 () Bool)

(declare-fun lt!12612 () SeekEntryResult!136)

(assert (=> b!34111 (= e!21656 (ite ((_ is MissingVacant!136) lt!12612) (MissingZero!136 (index!2669 lt!12612)) lt!12612))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2317 (_ BitVec 32)) SeekEntryResult!136)

(assert (=> b!34111 (= lt!12612 (seekKeyOrZeroReturnVacant!0 (x!6872 lt!12613) (index!2668 lt!12613) (index!2668 lt!12613) k0!1304 _keys!1833 mask!2294))))

(declare-fun b!34112 () Bool)

(assert (=> b!34112 (= e!21655 e!21654)))

(declare-fun lt!12611 () (_ BitVec 64))

(assert (=> b!34112 (= lt!12611 (select (arr!1107 _keys!1833) (index!2668 lt!12613)))))

(declare-fun c!3935 () Bool)

(assert (=> b!34112 (= c!3935 (= lt!12611 k0!1304))))

(declare-fun b!34107 () Bool)

(declare-fun c!3934 () Bool)

(assert (=> b!34107 (= c!3934 (= lt!12611 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!34107 (= e!21654 e!21656)))

(declare-fun d!5235 () Bool)

(declare-fun lt!12614 () SeekEntryResult!136)

(assert (=> d!5235 (and (or ((_ is MissingVacant!136) lt!12614) (not ((_ is Found!136) lt!12614)) (and (bvsge (index!2667 lt!12614) #b00000000000000000000000000000000) (bvslt (index!2667 lt!12614) (size!1208 _keys!1833)))) (not ((_ is MissingVacant!136) lt!12614)) (or (not ((_ is Found!136) lt!12614)) (= (select (arr!1107 _keys!1833) (index!2667 lt!12614)) k0!1304)))))

(assert (=> d!5235 (= lt!12614 e!21655)))

(declare-fun c!3933 () Bool)

(assert (=> d!5235 (= c!3933 (and ((_ is Intermediate!136) lt!12613) (undefined!948 lt!12613)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2317 (_ BitVec 32)) SeekEntryResult!136)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!5235 (= lt!12613 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1304 mask!2294) k0!1304 _keys!1833 mask!2294))))

(assert (=> d!5235 (validMask!0 mask!2294)))

(assert (=> d!5235 (= (seekEntry!0 k0!1304 _keys!1833 mask!2294) lt!12614)))

(assert (= (and d!5235 c!3933) b!34109))

(assert (= (and d!5235 (not c!3933)) b!34112))

(assert (= (and b!34112 c!3935) b!34110))

(assert (= (and b!34112 (not c!3935)) b!34107))

(assert (= (and b!34107 c!3934) b!34108))

(assert (= (and b!34107 (not c!3934)) b!34111))

(declare-fun m!27471 () Bool)

(assert (=> b!34111 m!27471))

(declare-fun m!27473 () Bool)

(assert (=> b!34112 m!27473))

(declare-fun m!27475 () Bool)

(assert (=> d!5235 m!27475))

(declare-fun m!27477 () Bool)

(assert (=> d!5235 m!27477))

(assert (=> d!5235 m!27477))

(declare-fun m!27479 () Bool)

(assert (=> d!5235 m!27479))

(assert (=> d!5235 m!27403))

(assert (=> b!34023 d!5235))

(declare-fun d!5237 () Bool)

(declare-fun e!21659 () Bool)

(assert (=> d!5237 e!21659))

(declare-fun res!20688 () Bool)

(assert (=> d!5237 (=> (not res!20688) (not e!21659))))

(assert (=> d!5237 (= res!20688 (and (bvsge lt!12570 #b00000000000000000000000000000000) (bvslt lt!12570 (size!1208 _keys!1833))))))

(declare-fun lt!12617 () Unit!766)

(declare-fun choose!219 (array!2317 array!2319 (_ BitVec 32) (_ BitVec 32) V!1893 V!1893 (_ BitVec 32) Int) Unit!766)

(assert (=> d!5237 (= lt!12617 (choose!219 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12570 defaultEntry!1504))))

(assert (=> d!5237 (validMask!0 mask!2294)))

(assert (=> d!5237 (= (lemmaValidKeyInArrayIsInListMap!68 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12570 defaultEntry!1504) lt!12617)))

(declare-fun b!34115 () Bool)

(assert (=> b!34115 (= e!21659 (contains!401 (getCurrentListMap!281 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) (select (arr!1107 _keys!1833) lt!12570)))))

(assert (= (and d!5237 res!20688) b!34115))

(declare-fun m!27481 () Bool)

(assert (=> d!5237 m!27481))

(assert (=> d!5237 m!27403))

(assert (=> b!34115 m!27413))

(assert (=> b!34115 m!27385))

(assert (=> b!34115 m!27413))

(assert (=> b!34115 m!27385))

(declare-fun m!27483 () Bool)

(assert (=> b!34115 m!27483))

(assert (=> b!34023 d!5237))

(declare-fun d!5239 () Bool)

(declare-fun e!21665 () Bool)

(assert (=> d!5239 e!21665))

(declare-fun res!20691 () Bool)

(assert (=> d!5239 (=> res!20691 e!21665)))

(declare-fun lt!12628 () Bool)

(assert (=> d!5239 (= res!20691 (not lt!12628))))

(declare-fun lt!12627 () Bool)

(assert (=> d!5239 (= lt!12628 lt!12627)))

(declare-fun lt!12629 () Unit!766)

(declare-fun e!21664 () Unit!766)

(assert (=> d!5239 (= lt!12629 e!21664)))

(declare-fun c!3938 () Bool)

(assert (=> d!5239 (= c!3938 lt!12627)))

(declare-fun containsKey!34 (List!893 (_ BitVec 64)) Bool)

(assert (=> d!5239 (= lt!12627 (containsKey!34 (toList!456 lt!12572) (select (arr!1107 _keys!1833) lt!12570)))))

(assert (=> d!5239 (= (contains!401 lt!12572 (select (arr!1107 _keys!1833) lt!12570)) lt!12628)))

(declare-fun b!34122 () Bool)

(declare-fun lt!12626 () Unit!766)

(assert (=> b!34122 (= e!21664 lt!12626)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!31 (List!893 (_ BitVec 64)) Unit!766)

(assert (=> b!34122 (= lt!12626 (lemmaContainsKeyImpliesGetValueByKeyDefined!31 (toList!456 lt!12572) (select (arr!1107 _keys!1833) lt!12570)))))

(declare-datatypes ((Option!76 0))(
  ( (Some!75 (v!1898 V!1893)) (None!74) )
))
(declare-fun isDefined!32 (Option!76) Bool)

(declare-fun getValueByKey!70 (List!893 (_ BitVec 64)) Option!76)

(assert (=> b!34122 (isDefined!32 (getValueByKey!70 (toList!456 lt!12572) (select (arr!1107 _keys!1833) lt!12570)))))

(declare-fun b!34123 () Bool)

(declare-fun Unit!770 () Unit!766)

(assert (=> b!34123 (= e!21664 Unit!770)))

(declare-fun b!34124 () Bool)

(assert (=> b!34124 (= e!21665 (isDefined!32 (getValueByKey!70 (toList!456 lt!12572) (select (arr!1107 _keys!1833) lt!12570))))))

(assert (= (and d!5239 c!3938) b!34122))

(assert (= (and d!5239 (not c!3938)) b!34123))

(assert (= (and d!5239 (not res!20691)) b!34124))

(assert (=> d!5239 m!27385))

(declare-fun m!27485 () Bool)

(assert (=> d!5239 m!27485))

(assert (=> b!34122 m!27385))

(declare-fun m!27487 () Bool)

(assert (=> b!34122 m!27487))

(assert (=> b!34122 m!27385))

(declare-fun m!27489 () Bool)

(assert (=> b!34122 m!27489))

(assert (=> b!34122 m!27489))

(declare-fun m!27491 () Bool)

(assert (=> b!34122 m!27491))

(assert (=> b!34124 m!27385))

(assert (=> b!34124 m!27489))

(assert (=> b!34124 m!27489))

(assert (=> b!34124 m!27491))

(assert (=> b!34023 d!5239))

(declare-fun d!5241 () Bool)

(declare-fun lt!12635 () SeekEntryResult!136)

(assert (=> d!5241 (and ((_ is Found!136) lt!12635) (= (index!2667 lt!12635) lt!12570))))

(assert (=> d!5241 (= lt!12635 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun lt!12634 () Unit!766)

(declare-fun choose!0 ((_ BitVec 64) (_ BitVec 32) array!2317 (_ BitVec 32)) Unit!766)

(assert (=> d!5241 (= lt!12634 (choose!0 k0!1304 lt!12570 _keys!1833 mask!2294))))

(assert (=> d!5241 (validMask!0 mask!2294)))

(assert (=> d!5241 (= (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!12570 _keys!1833 mask!2294) lt!12634)))

(declare-fun bs!1317 () Bool)

(assert (= bs!1317 d!5241))

(assert (=> bs!1317 m!27387))

(declare-fun m!27493 () Bool)

(assert (=> bs!1317 m!27493))

(assert (=> bs!1317 m!27403))

(assert (=> b!34023 d!5241))

(declare-fun b!34125 () Bool)

(declare-fun e!21667 () Bool)

(declare-fun call!2730 () Bool)

(assert (=> b!34125 (= e!21667 call!2730)))

(declare-fun d!5243 () Bool)

(declare-fun res!20693 () Bool)

(declare-fun e!21668 () Bool)

(assert (=> d!5243 (=> res!20693 e!21668)))

(assert (=> d!5243 (= res!20693 (bvsge lt!12570 (size!1208 _keys!1833)))))

(assert (=> d!5243 (= (arrayForallSeekEntryOrOpenFound!0 lt!12570 _keys!1833 mask!2294) e!21668)))

(declare-fun b!34126 () Bool)

(declare-fun e!21666 () Bool)

(assert (=> b!34126 (= e!21667 e!21666)))

(declare-fun lt!12637 () (_ BitVec 64))

(assert (=> b!34126 (= lt!12637 (select (arr!1107 _keys!1833) lt!12570))))

(declare-fun lt!12638 () Unit!766)

(assert (=> b!34126 (= lt!12638 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!12637 lt!12570))))

(assert (=> b!34126 (arrayContainsKey!0 _keys!1833 lt!12637 #b00000000000000000000000000000000)))

(declare-fun lt!12636 () Unit!766)

(assert (=> b!34126 (= lt!12636 lt!12638)))

(declare-fun res!20692 () Bool)

(assert (=> b!34126 (= res!20692 (= (seekEntryOrOpen!0 (select (arr!1107 _keys!1833) lt!12570) _keys!1833 mask!2294) (Found!136 lt!12570)))))

(assert (=> b!34126 (=> (not res!20692) (not e!21666))))

(declare-fun b!34127 () Bool)

(assert (=> b!34127 (= e!21668 e!21667)))

(declare-fun c!3939 () Bool)

(assert (=> b!34127 (= c!3939 (validKeyInArray!0 (select (arr!1107 _keys!1833) lt!12570)))))

(declare-fun b!34128 () Bool)

(assert (=> b!34128 (= e!21666 call!2730)))

(declare-fun bm!2727 () Bool)

(assert (=> bm!2727 (= call!2730 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!12570 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(assert (= (and d!5243 (not res!20693)) b!34127))

(assert (= (and b!34127 c!3939) b!34126))

(assert (= (and b!34127 (not c!3939)) b!34125))

(assert (= (and b!34126 res!20692) b!34128))

(assert (= (or b!34128 b!34125) bm!2727))

(assert (=> b!34126 m!27385))

(declare-fun m!27495 () Bool)

(assert (=> b!34126 m!27495))

(declare-fun m!27497 () Bool)

(assert (=> b!34126 m!27497))

(assert (=> b!34126 m!27385))

(declare-fun m!27499 () Bool)

(assert (=> b!34126 m!27499))

(assert (=> b!34127 m!27385))

(assert (=> b!34127 m!27385))

(declare-fun m!27501 () Bool)

(assert (=> b!34127 m!27501))

(declare-fun m!27503 () Bool)

(assert (=> bm!2727 m!27503))

(assert (=> b!34023 d!5243))

(declare-fun d!5245 () Bool)

(assert (=> d!5245 (arrayForallSeekEntryOrOpenFound!0 lt!12570 _keys!1833 mask!2294)))

(declare-fun lt!12641 () Unit!766)

(declare-fun choose!38 (array!2317 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!766)

(assert (=> d!5245 (= lt!12641 (choose!38 _keys!1833 mask!2294 #b00000000000000000000000000000000 lt!12570))))

(assert (=> d!5245 (validMask!0 mask!2294)))

(assert (=> d!5245 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1833 mask!2294 #b00000000000000000000000000000000 lt!12570) lt!12641)))

(declare-fun bs!1318 () Bool)

(assert (= bs!1318 d!5245))

(assert (=> bs!1318 m!27383))

(declare-fun m!27505 () Bool)

(assert (=> bs!1318 m!27505))

(assert (=> bs!1318 m!27403))

(assert (=> b!34023 d!5245))

(declare-fun d!5247 () Bool)

(declare-fun res!20698 () Bool)

(declare-fun e!21673 () Bool)

(assert (=> d!5247 (=> res!20698 e!21673)))

(assert (=> d!5247 (= res!20698 (= (select (arr!1107 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5247 (= (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) e!21673)))

(declare-fun b!34133 () Bool)

(declare-fun e!21674 () Bool)

(assert (=> b!34133 (= e!21673 e!21674)))

(declare-fun res!20699 () Bool)

(assert (=> b!34133 (=> (not res!20699) (not e!21674))))

(assert (=> b!34133 (= res!20699 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1208 _keys!1833)))))

(declare-fun b!34134 () Bool)

(assert (=> b!34134 (= e!21674 (arrayContainsKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5247 (not res!20698)) b!34133))

(assert (= (and b!34133 res!20699) b!34134))

(assert (=> d!5247 m!27451))

(declare-fun m!27507 () Bool)

(assert (=> b!34134 m!27507))

(assert (=> b!34022 d!5247))

(declare-fun d!5249 () Bool)

(assert (=> d!5249 (= (validKeyInArray!0 k0!1304) (and (not (= k0!1304 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1304 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!34024 d!5249))

(declare-fun d!5251 () Bool)

(declare-fun e!21676 () Bool)

(assert (=> d!5251 e!21676))

(declare-fun res!20700 () Bool)

(assert (=> d!5251 (=> res!20700 e!21676)))

(declare-fun lt!12644 () Bool)

(assert (=> d!5251 (= res!20700 (not lt!12644))))

(declare-fun lt!12643 () Bool)

(assert (=> d!5251 (= lt!12644 lt!12643)))

(declare-fun lt!12645 () Unit!766)

(declare-fun e!21675 () Unit!766)

(assert (=> d!5251 (= lt!12645 e!21675)))

(declare-fun c!3940 () Bool)

(assert (=> d!5251 (= c!3940 lt!12643)))

(assert (=> d!5251 (= lt!12643 (containsKey!34 (toList!456 lt!12572) k0!1304))))

(assert (=> d!5251 (= (contains!401 lt!12572 k0!1304) lt!12644)))

(declare-fun b!34135 () Bool)

(declare-fun lt!12642 () Unit!766)

(assert (=> b!34135 (= e!21675 lt!12642)))

(assert (=> b!34135 (= lt!12642 (lemmaContainsKeyImpliesGetValueByKeyDefined!31 (toList!456 lt!12572) k0!1304))))

(assert (=> b!34135 (isDefined!32 (getValueByKey!70 (toList!456 lt!12572) k0!1304))))

(declare-fun b!34136 () Bool)

(declare-fun Unit!771 () Unit!766)

(assert (=> b!34136 (= e!21675 Unit!771)))

(declare-fun b!34137 () Bool)

(assert (=> b!34137 (= e!21676 (isDefined!32 (getValueByKey!70 (toList!456 lt!12572) k0!1304)))))

(assert (= (and d!5251 c!3940) b!34135))

(assert (= (and d!5251 (not c!3940)) b!34136))

(assert (= (and d!5251 (not res!20700)) b!34137))

(declare-fun m!27509 () Bool)

(assert (=> d!5251 m!27509))

(declare-fun m!27511 () Bool)

(assert (=> b!34135 m!27511))

(declare-fun m!27513 () Bool)

(assert (=> b!34135 m!27513))

(assert (=> b!34135 m!27513))

(declare-fun m!27515 () Bool)

(assert (=> b!34135 m!27515))

(assert (=> b!34137 m!27513))

(assert (=> b!34137 m!27513))

(assert (=> b!34137 m!27515))

(assert (=> b!34029 d!5251))

(declare-fun b!34180 () Bool)

(declare-fun e!21708 () Bool)

(assert (=> b!34180 (= e!21708 (validKeyInArray!0 (select (arr!1107 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun bm!2742 () Bool)

(declare-fun call!2747 () ListLongMap!881)

(declare-fun getCurrentListMapNoExtraKeys!25 (array!2317 array!2319 (_ BitVec 32) (_ BitVec 32) V!1893 V!1893 (_ BitVec 32) Int) ListLongMap!881)

(assert (=> bm!2742 (= call!2747 (getCurrentListMapNoExtraKeys!25 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!34181 () Bool)

(declare-fun e!21711 () Bool)

(declare-fun e!21715 () Bool)

(assert (=> b!34181 (= e!21711 e!21715)))

(declare-fun res!20722 () Bool)

(declare-fun call!2749 () Bool)

(assert (=> b!34181 (= res!20722 call!2749)))

(assert (=> b!34181 (=> (not res!20722) (not e!21715))))

(declare-fun b!34182 () Bool)

(declare-fun e!21703 () ListLongMap!881)

(declare-fun call!2746 () ListLongMap!881)

(declare-fun +!56 (ListLongMap!881 tuple2!1304) ListLongMap!881)

(assert (=> b!34182 (= e!21703 (+!56 call!2746 (tuple2!1305 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))

(declare-fun b!34183 () Bool)

(declare-fun e!21710 () Unit!766)

(declare-fun lt!12692 () Unit!766)

(assert (=> b!34183 (= e!21710 lt!12692)))

(declare-fun lt!12693 () ListLongMap!881)

(assert (=> b!34183 (= lt!12693 (getCurrentListMapNoExtraKeys!25 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12695 () (_ BitVec 64))

(assert (=> b!34183 (= lt!12695 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12706 () (_ BitVec 64))

(assert (=> b!34183 (= lt!12706 (select (arr!1107 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12691 () Unit!766)

(declare-fun addStillContains!23 (ListLongMap!881 (_ BitVec 64) V!1893 (_ BitVec 64)) Unit!766)

(assert (=> b!34183 (= lt!12691 (addStillContains!23 lt!12693 lt!12695 zeroValue!1443 lt!12706))))

(assert (=> b!34183 (contains!401 (+!56 lt!12693 (tuple2!1305 lt!12695 zeroValue!1443)) lt!12706)))

(declare-fun lt!12705 () Unit!766)

(assert (=> b!34183 (= lt!12705 lt!12691)))

(declare-fun lt!12700 () ListLongMap!881)

(assert (=> b!34183 (= lt!12700 (getCurrentListMapNoExtraKeys!25 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12701 () (_ BitVec 64))

(assert (=> b!34183 (= lt!12701 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12699 () (_ BitVec 64))

(assert (=> b!34183 (= lt!12699 (select (arr!1107 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12707 () Unit!766)

(declare-fun addApplyDifferent!23 (ListLongMap!881 (_ BitVec 64) V!1893 (_ BitVec 64)) Unit!766)

(assert (=> b!34183 (= lt!12707 (addApplyDifferent!23 lt!12700 lt!12701 minValue!1443 lt!12699))))

(declare-fun apply!38 (ListLongMap!881 (_ BitVec 64)) V!1893)

(assert (=> b!34183 (= (apply!38 (+!56 lt!12700 (tuple2!1305 lt!12701 minValue!1443)) lt!12699) (apply!38 lt!12700 lt!12699))))

(declare-fun lt!12690 () Unit!766)

(assert (=> b!34183 (= lt!12690 lt!12707)))

(declare-fun lt!12696 () ListLongMap!881)

(assert (=> b!34183 (= lt!12696 (getCurrentListMapNoExtraKeys!25 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12704 () (_ BitVec 64))

(assert (=> b!34183 (= lt!12704 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12702 () (_ BitVec 64))

(assert (=> b!34183 (= lt!12702 (select (arr!1107 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12710 () Unit!766)

(assert (=> b!34183 (= lt!12710 (addApplyDifferent!23 lt!12696 lt!12704 zeroValue!1443 lt!12702))))

(assert (=> b!34183 (= (apply!38 (+!56 lt!12696 (tuple2!1305 lt!12704 zeroValue!1443)) lt!12702) (apply!38 lt!12696 lt!12702))))

(declare-fun lt!12708 () Unit!766)

(assert (=> b!34183 (= lt!12708 lt!12710)))

(declare-fun lt!12698 () ListLongMap!881)

(assert (=> b!34183 (= lt!12698 (getCurrentListMapNoExtraKeys!25 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12703 () (_ BitVec 64))

(assert (=> b!34183 (= lt!12703 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12697 () (_ BitVec 64))

(assert (=> b!34183 (= lt!12697 (select (arr!1107 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> b!34183 (= lt!12692 (addApplyDifferent!23 lt!12698 lt!12703 minValue!1443 lt!12697))))

(assert (=> b!34183 (= (apply!38 (+!56 lt!12698 (tuple2!1305 lt!12703 minValue!1443)) lt!12697) (apply!38 lt!12698 lt!12697))))

(declare-fun b!34184 () Bool)

(assert (=> b!34184 (= e!21711 (not call!2749))))

(declare-fun b!34185 () Bool)

(declare-fun e!21709 () Bool)

(assert (=> b!34185 (= e!21709 (validKeyInArray!0 (select (arr!1107 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!34186 () Bool)

(declare-fun e!21704 () Bool)

(declare-fun e!21714 () Bool)

(assert (=> b!34186 (= e!21704 e!21714)))

(declare-fun c!3956 () Bool)

(assert (=> b!34186 (= c!3956 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!2743 () Bool)

(declare-fun call!2748 () ListLongMap!881)

(declare-fun call!2751 () ListLongMap!881)

(assert (=> bm!2743 (= call!2748 call!2751)))

(declare-fun b!34187 () Bool)

(declare-fun c!3955 () Bool)

(assert (=> b!34187 (= c!3955 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!21713 () ListLongMap!881)

(declare-fun e!21712 () ListLongMap!881)

(assert (=> b!34187 (= e!21713 e!21712)))

(declare-fun b!34188 () Bool)

(declare-fun res!20723 () Bool)

(assert (=> b!34188 (=> (not res!20723) (not e!21704))))

(declare-fun e!21705 () Bool)

(assert (=> b!34188 (= res!20723 e!21705)))

(declare-fun res!20719 () Bool)

(assert (=> b!34188 (=> res!20719 e!21705)))

(assert (=> b!34188 (= res!20719 (not e!21709))))

(declare-fun res!20724 () Bool)

(assert (=> b!34188 (=> (not res!20724) (not e!21709))))

(assert (=> b!34188 (= res!20724 (bvslt #b00000000000000000000000000000000 (size!1208 _keys!1833)))))

(declare-fun b!34189 () Bool)

(declare-fun e!21706 () Bool)

(assert (=> b!34189 (= e!21714 e!21706)))

(declare-fun res!20726 () Bool)

(declare-fun call!2750 () Bool)

(assert (=> b!34189 (= res!20726 call!2750)))

(assert (=> b!34189 (=> (not res!20726) (not e!21706))))

(declare-fun b!34190 () Bool)

(assert (=> b!34190 (= e!21703 e!21713)))

(declare-fun c!3957 () Bool)

(assert (=> b!34190 (= c!3957 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!34191 () Bool)

(assert (=> b!34191 (= e!21712 call!2748)))

(declare-fun b!34192 () Bool)

(declare-fun res!20727 () Bool)

(assert (=> b!34192 (=> (not res!20727) (not e!21704))))

(assert (=> b!34192 (= res!20727 e!21711)))

(declare-fun c!3958 () Bool)

(assert (=> b!34192 (= c!3958 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!34193 () Bool)

(assert (=> b!34193 (= e!21714 (not call!2750))))

(declare-fun b!34194 () Bool)

(declare-fun call!2745 () ListLongMap!881)

(assert (=> b!34194 (= e!21712 call!2745)))

(declare-fun bm!2745 () Bool)

(assert (=> bm!2745 (= call!2751 call!2747)))

(declare-fun b!34195 () Bool)

(assert (=> b!34195 (= e!21713 call!2745)))

(declare-fun c!3954 () Bool)

(declare-fun bm!2746 () Bool)

(assert (=> bm!2746 (= call!2746 (+!56 (ite c!3954 call!2747 (ite c!3957 call!2751 call!2748)) (ite (or c!3954 c!3957) (tuple2!1305 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1305 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(declare-fun bm!2747 () Bool)

(declare-fun lt!12694 () ListLongMap!881)

(assert (=> bm!2747 (= call!2749 (contains!401 lt!12694 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!34196 () Bool)

(declare-fun Unit!772 () Unit!766)

(assert (=> b!34196 (= e!21710 Unit!772)))

(declare-fun bm!2748 () Bool)

(assert (=> bm!2748 (= call!2745 call!2746)))

(declare-fun b!34197 () Bool)

(declare-fun e!21707 () Bool)

(declare-fun get!579 (ValueCell!576 V!1893) V!1893)

(declare-fun dynLambda!155 (Int (_ BitVec 64)) V!1893)

(assert (=> b!34197 (= e!21707 (= (apply!38 lt!12694 (select (arr!1107 _keys!1833) #b00000000000000000000000000000000)) (get!579 (select (arr!1108 _values!1501) #b00000000000000000000000000000000) (dynLambda!155 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!34197 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1209 _values!1501)))))

(assert (=> b!34197 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1208 _keys!1833)))))

(declare-fun bm!2744 () Bool)

(assert (=> bm!2744 (= call!2750 (contains!401 lt!12694 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!5253 () Bool)

(assert (=> d!5253 e!21704))

(declare-fun res!20720 () Bool)

(assert (=> d!5253 (=> (not res!20720) (not e!21704))))

(assert (=> d!5253 (= res!20720 (or (bvsge #b00000000000000000000000000000000 (size!1208 _keys!1833)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1208 _keys!1833)))))))

(declare-fun lt!12709 () ListLongMap!881)

(assert (=> d!5253 (= lt!12694 lt!12709)))

(declare-fun lt!12711 () Unit!766)

(assert (=> d!5253 (= lt!12711 e!21710)))

(declare-fun c!3953 () Bool)

(assert (=> d!5253 (= c!3953 e!21708)))

(declare-fun res!20721 () Bool)

(assert (=> d!5253 (=> (not res!20721) (not e!21708))))

(assert (=> d!5253 (= res!20721 (bvslt #b00000000000000000000000000000000 (size!1208 _keys!1833)))))

(assert (=> d!5253 (= lt!12709 e!21703)))

(assert (=> d!5253 (= c!3954 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!5253 (validMask!0 mask!2294)))

(assert (=> d!5253 (= (getCurrentListMap!281 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) lt!12694)))

(declare-fun b!34198 () Bool)

(assert (=> b!34198 (= e!21705 e!21707)))

(declare-fun res!20725 () Bool)

(assert (=> b!34198 (=> (not res!20725) (not e!21707))))

(assert (=> b!34198 (= res!20725 (contains!401 lt!12694 (select (arr!1107 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!34198 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1208 _keys!1833)))))

(declare-fun b!34199 () Bool)

(assert (=> b!34199 (= e!21715 (= (apply!38 lt!12694 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1443))))

(declare-fun b!34200 () Bool)

(assert (=> b!34200 (= e!21706 (= (apply!38 lt!12694 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1443))))

(assert (= (and d!5253 c!3954) b!34182))

(assert (= (and d!5253 (not c!3954)) b!34190))

(assert (= (and b!34190 c!3957) b!34195))

(assert (= (and b!34190 (not c!3957)) b!34187))

(assert (= (and b!34187 c!3955) b!34194))

(assert (= (and b!34187 (not c!3955)) b!34191))

(assert (= (or b!34194 b!34191) bm!2743))

(assert (= (or b!34195 bm!2743) bm!2745))

(assert (= (or b!34195 b!34194) bm!2748))

(assert (= (or b!34182 bm!2745) bm!2742))

(assert (= (or b!34182 bm!2748) bm!2746))

(assert (= (and d!5253 res!20721) b!34180))

(assert (= (and d!5253 c!3953) b!34183))

(assert (= (and d!5253 (not c!3953)) b!34196))

(assert (= (and d!5253 res!20720) b!34188))

(assert (= (and b!34188 res!20724) b!34185))

(assert (= (and b!34188 (not res!20719)) b!34198))

(assert (= (and b!34198 res!20725) b!34197))

(assert (= (and b!34188 res!20723) b!34192))

(assert (= (and b!34192 c!3958) b!34181))

(assert (= (and b!34192 (not c!3958)) b!34184))

(assert (= (and b!34181 res!20722) b!34199))

(assert (= (or b!34181 b!34184) bm!2747))

(assert (= (and b!34192 res!20727) b!34186))

(assert (= (and b!34186 c!3956) b!34189))

(assert (= (and b!34186 (not c!3956)) b!34193))

(assert (= (and b!34189 res!20726) b!34200))

(assert (= (or b!34189 b!34193) bm!2744))

(declare-fun b_lambda!1715 () Bool)

(assert (=> (not b_lambda!1715) (not b!34197)))

(declare-fun t!3601 () Bool)

(declare-fun tb!691 () Bool)

(assert (=> (and start!4408 (= defaultEntry!1504 defaultEntry!1504) t!3601) tb!691))

(declare-fun result!1183 () Bool)

(assert (=> tb!691 (= result!1183 tp_is_empty!1551)))

(assert (=> b!34197 t!3601))

(declare-fun b_and!2021 () Bool)

(assert (= b_and!2017 (and (=> t!3601 result!1183) b_and!2021)))

(declare-fun m!27517 () Bool)

(assert (=> b!34182 m!27517))

(assert (=> b!34185 m!27451))

(assert (=> b!34185 m!27451))

(assert (=> b!34185 m!27455))

(assert (=> b!34198 m!27451))

(assert (=> b!34198 m!27451))

(declare-fun m!27519 () Bool)

(assert (=> b!34198 m!27519))

(declare-fun m!27521 () Bool)

(assert (=> b!34199 m!27521))

(declare-fun m!27523 () Bool)

(assert (=> bm!2747 m!27523))

(declare-fun m!27525 () Bool)

(assert (=> b!34183 m!27525))

(declare-fun m!27527 () Bool)

(assert (=> b!34183 m!27527))

(declare-fun m!27529 () Bool)

(assert (=> b!34183 m!27529))

(declare-fun m!27531 () Bool)

(assert (=> b!34183 m!27531))

(declare-fun m!27533 () Bool)

(assert (=> b!34183 m!27533))

(declare-fun m!27535 () Bool)

(assert (=> b!34183 m!27535))

(declare-fun m!27537 () Bool)

(assert (=> b!34183 m!27537))

(declare-fun m!27539 () Bool)

(assert (=> b!34183 m!27539))

(declare-fun m!27541 () Bool)

(assert (=> b!34183 m!27541))

(declare-fun m!27543 () Bool)

(assert (=> b!34183 m!27543))

(assert (=> b!34183 m!27539))

(declare-fun m!27545 () Bool)

(assert (=> b!34183 m!27545))

(declare-fun m!27547 () Bool)

(assert (=> b!34183 m!27547))

(declare-fun m!27549 () Bool)

(assert (=> b!34183 m!27549))

(assert (=> b!34183 m!27451))

(declare-fun m!27551 () Bool)

(assert (=> b!34183 m!27551))

(assert (=> b!34183 m!27525))

(declare-fun m!27553 () Bool)

(assert (=> b!34183 m!27553))

(declare-fun m!27555 () Bool)

(assert (=> b!34183 m!27555))

(assert (=> b!34183 m!27547))

(assert (=> b!34183 m!27553))

(declare-fun m!27557 () Bool)

(assert (=> bm!2744 m!27557))

(declare-fun m!27559 () Bool)

(assert (=> bm!2746 m!27559))

(assert (=> b!34180 m!27451))

(assert (=> b!34180 m!27451))

(assert (=> b!34180 m!27455))

(declare-fun m!27561 () Bool)

(assert (=> b!34200 m!27561))

(assert (=> bm!2742 m!27535))

(assert (=> d!5253 m!27403))

(assert (=> b!34197 m!27451))

(declare-fun m!27563 () Bool)

(assert (=> b!34197 m!27563))

(declare-fun m!27565 () Bool)

(assert (=> b!34197 m!27565))

(assert (=> b!34197 m!27565))

(declare-fun m!27567 () Bool)

(assert (=> b!34197 m!27567))

(declare-fun m!27569 () Bool)

(assert (=> b!34197 m!27569))

(assert (=> b!34197 m!27451))

(assert (=> b!34197 m!27567))

(assert (=> b!34029 d!5253))

(declare-fun mapNonEmpty!1876 () Bool)

(declare-fun mapRes!1876 () Bool)

(declare-fun tp!5035 () Bool)

(declare-fun e!21721 () Bool)

(assert (=> mapNonEmpty!1876 (= mapRes!1876 (and tp!5035 e!21721))))

(declare-fun mapRest!1876 () (Array (_ BitVec 32) ValueCell!576))

(declare-fun mapKey!1876 () (_ BitVec 32))

(declare-fun mapValue!1876 () ValueCell!576)

(assert (=> mapNonEmpty!1876 (= mapRest!1870 (store mapRest!1876 mapKey!1876 mapValue!1876))))

(declare-fun mapIsEmpty!1876 () Bool)

(assert (=> mapIsEmpty!1876 mapRes!1876))

(declare-fun condMapEmpty!1876 () Bool)

(declare-fun mapDefault!1876 () ValueCell!576)

(assert (=> mapNonEmpty!1870 (= condMapEmpty!1876 (= mapRest!1870 ((as const (Array (_ BitVec 32) ValueCell!576)) mapDefault!1876)))))

(declare-fun e!21720 () Bool)

(assert (=> mapNonEmpty!1870 (= tp!5025 (and e!21720 mapRes!1876))))

(declare-fun b!34209 () Bool)

(assert (=> b!34209 (= e!21721 tp_is_empty!1551)))

(declare-fun b!34210 () Bool)

(assert (=> b!34210 (= e!21720 tp_is_empty!1551)))

(assert (= (and mapNonEmpty!1870 condMapEmpty!1876) mapIsEmpty!1876))

(assert (= (and mapNonEmpty!1870 (not condMapEmpty!1876)) mapNonEmpty!1876))

(assert (= (and mapNonEmpty!1876 ((_ is ValueCellFull!576) mapValue!1876)) b!34209))

(assert (= (and mapNonEmpty!1870 ((_ is ValueCellFull!576) mapDefault!1876)) b!34210))

(declare-fun m!27571 () Bool)

(assert (=> mapNonEmpty!1876 m!27571))

(declare-fun b_lambda!1717 () Bool)

(assert (= b_lambda!1715 (or (and start!4408 b_free!1197) b_lambda!1717)))

(check-sat (not b!34135) (not d!5245) (not d!5235) (not b!34185) tp_is_empty!1551 (not bm!2746) (not b!34197) (not b_next!1197) (not b!34180) (not bm!2723) (not d!5237) (not d!5239) (not b!34087) (not bm!2726) (not b!34111) (not b!34126) b_and!2021 (not b!34115) (not bm!2742) (not b!34075) (not b!34124) (not d!5253) (not b!34127) (not b!34200) (not b!34198) (not mapNonEmpty!1876) (not b!34137) (not b!34094) (not bm!2747) (not d!5251) (not b_lambda!1717) (not bm!2744) (not b!34182) (not d!5241) (not b!34122) (not b!34073) (not b!34199) (not bm!2727) (not b!34183) (not b!34134) (not b!34076) (not b!34086))
(check-sat b_and!2021 (not b_next!1197))

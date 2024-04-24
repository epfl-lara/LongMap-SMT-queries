; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!986 () Bool)

(assert start!986)

(declare-fun b_free!337 () Bool)

(declare-fun b_next!337 () Bool)

(assert (=> start!986 (= b_free!337 (not b_next!337))))

(declare-fun tp!1247 () Bool)

(declare-fun b_and!487 () Bool)

(assert (=> start!986 (= tp!1247 b_and!487)))

(declare-fun mapIsEmpty!599 () Bool)

(declare-fun mapRes!599 () Bool)

(assert (=> mapIsEmpty!599 mapRes!599))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun b!8456 () Bool)

(declare-datatypes ((array!745 0))(
  ( (array!746 (arr!359 (Array (_ BitVec 32) (_ BitVec 64))) (size!421 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!745)

(declare-fun e!4808 () Bool)

(declare-fun lt!1766 () (_ BitVec 32))

(assert (=> b!8456 (= e!4808 (or (not (= (size!421 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250))) (bvsgt #b00000000000000000000000000000000 (size!421 _keys!1806)) (and (bvsge lt!1766 #b00000000000000000000000000000000) (bvsle lt!1766 (size!421 _keys!1806)))))))

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!745 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!8456 (= lt!1766 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!8457 () Bool)

(declare-fun e!4810 () Bool)

(declare-fun e!4806 () Bool)

(assert (=> b!8457 (= e!4810 (and e!4806 mapRes!599))))

(declare-fun condMapEmpty!599 () Bool)

(declare-datatypes ((V!731 0))(
  ( (V!732 (val!213 Int)) )
))
(declare-datatypes ((ValueCell!191 0))(
  ( (ValueCellFull!191 (v!1306 V!731)) (EmptyCell!191) )
))
(declare-datatypes ((array!747 0))(
  ( (array!748 (arr!360 (Array (_ BitVec 32) ValueCell!191)) (size!422 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!747)

(declare-fun mapDefault!599 () ValueCell!191)

(assert (=> b!8457 (= condMapEmpty!599 (= (arr!360 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!191)) mapDefault!599)))))

(declare-fun b!8458 () Bool)

(declare-fun res!7969 () Bool)

(declare-fun e!4807 () Bool)

(assert (=> b!8458 (=> (not res!7969) (not e!4807))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!745 (_ BitVec 32)) Bool)

(assert (=> b!8458 (= res!7969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!8459 () Bool)

(declare-fun res!7970 () Bool)

(assert (=> b!8459 (=> (not res!7970) (not e!4807))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!8459 (= res!7970 (validKeyInArray!0 k0!1278))))

(declare-fun b!8460 () Bool)

(declare-fun e!4809 () Bool)

(declare-fun tp_is_empty!415 () Bool)

(assert (=> b!8460 (= e!4809 tp_is_empty!415)))

(declare-fun res!7972 () Bool)

(assert (=> start!986 (=> (not res!7972) (not e!4807))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!986 (= res!7972 (validMask!0 mask!2250))))

(assert (=> start!986 e!4807))

(assert (=> start!986 tp!1247))

(assert (=> start!986 true))

(declare-fun array_inv!265 (array!747) Bool)

(assert (=> start!986 (and (array_inv!265 _values!1492) e!4810)))

(assert (=> start!986 tp_is_empty!415))

(declare-fun array_inv!266 (array!745) Bool)

(assert (=> start!986 (array_inv!266 _keys!1806)))

(declare-fun b!8461 () Bool)

(declare-fun res!7971 () Bool)

(assert (=> b!8461 (=> (not res!7971) (not e!4807))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!731)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!731)

(declare-datatypes ((tuple2!238 0))(
  ( (tuple2!239 (_1!119 (_ BitVec 64)) (_2!119 V!731)) )
))
(declare-datatypes ((List!249 0))(
  ( (Nil!246) (Cons!245 (h!811 tuple2!238) (t!2388 List!249)) )
))
(declare-datatypes ((ListLongMap!243 0))(
  ( (ListLongMap!244 (toList!137 List!249)) )
))
(declare-fun contains!113 (ListLongMap!243 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!96 (array!745 array!747 (_ BitVec 32) (_ BitVec 32) V!731 V!731 (_ BitVec 32) Int) ListLongMap!243)

(assert (=> b!8461 (= res!7971 (contains!113 (getCurrentListMap!96 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!8462 () Bool)

(assert (=> b!8462 (= e!4806 tp_is_empty!415)))

(declare-fun mapNonEmpty!599 () Bool)

(declare-fun tp!1246 () Bool)

(assert (=> mapNonEmpty!599 (= mapRes!599 (and tp!1246 e!4809))))

(declare-fun mapKey!599 () (_ BitVec 32))

(declare-fun mapRest!599 () (Array (_ BitVec 32) ValueCell!191))

(declare-fun mapValue!599 () ValueCell!191)

(assert (=> mapNonEmpty!599 (= (arr!360 _values!1492) (store mapRest!599 mapKey!599 mapValue!599))))

(declare-fun b!8463 () Bool)

(declare-fun e!4811 () Bool)

(assert (=> b!8463 (= e!4811 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!8464 () Bool)

(declare-fun res!7973 () Bool)

(assert (=> b!8464 (=> (not res!7973) (not e!4807))))

(assert (=> b!8464 (= res!7973 (and (= (size!422 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!421 _keys!1806) (size!422 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!8465 () Bool)

(declare-fun res!7974 () Bool)

(assert (=> b!8465 (=> (not res!7974) (not e!4807))))

(declare-datatypes ((List!250 0))(
  ( (Nil!247) (Cons!246 (h!812 (_ BitVec 64)) (t!2389 List!250)) )
))
(declare-fun arrayNoDuplicates!0 (array!745 (_ BitVec 32) List!250) Bool)

(assert (=> b!8465 (= res!7974 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!247))))

(declare-fun b!8466 () Bool)

(assert (=> b!8466 (= e!4807 (not e!4808))))

(declare-fun res!7975 () Bool)

(assert (=> b!8466 (=> res!7975 e!4808)))

(declare-fun arrayContainsKey!0 (array!745 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!8466 (= res!7975 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(assert (=> b!8466 e!4811))

(declare-fun c!620 () Bool)

(assert (=> b!8466 (= c!620 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!165 0))(
  ( (Unit!166) )
))
(declare-fun lt!1767 () Unit!165)

(declare-fun lemmaKeyInListMapIsInArray!63 (array!745 array!747 (_ BitVec 32) (_ BitVec 32) V!731 V!731 (_ BitVec 64) Int) Unit!165)

(assert (=> b!8466 (= lt!1767 (lemmaKeyInListMapIsInArray!63 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!8467 () Bool)

(assert (=> b!8467 (= e!4811 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(assert (= (and start!986 res!7972) b!8464))

(assert (= (and b!8464 res!7973) b!8458))

(assert (= (and b!8458 res!7969) b!8465))

(assert (= (and b!8465 res!7974) b!8461))

(assert (= (and b!8461 res!7971) b!8459))

(assert (= (and b!8459 res!7970) b!8466))

(assert (= (and b!8466 c!620) b!8467))

(assert (= (and b!8466 (not c!620)) b!8463))

(assert (= (and b!8466 (not res!7975)) b!8456))

(assert (= (and b!8457 condMapEmpty!599) mapIsEmpty!599))

(assert (= (and b!8457 (not condMapEmpty!599)) mapNonEmpty!599))

(get-info :version)

(assert (= (and mapNonEmpty!599 ((_ is ValueCellFull!191) mapValue!599)) b!8460))

(assert (= (and b!8457 ((_ is ValueCellFull!191) mapDefault!599)) b!8462))

(assert (= start!986 b!8457))

(declare-fun m!5205 () Bool)

(assert (=> b!8466 m!5205))

(declare-fun m!5207 () Bool)

(assert (=> b!8466 m!5207))

(declare-fun m!5209 () Bool)

(assert (=> mapNonEmpty!599 m!5209))

(declare-fun m!5211 () Bool)

(assert (=> b!8465 m!5211))

(assert (=> b!8467 m!5205))

(declare-fun m!5213 () Bool)

(assert (=> b!8461 m!5213))

(assert (=> b!8461 m!5213))

(declare-fun m!5215 () Bool)

(assert (=> b!8461 m!5215))

(declare-fun m!5217 () Bool)

(assert (=> start!986 m!5217))

(declare-fun m!5219 () Bool)

(assert (=> start!986 m!5219))

(declare-fun m!5221 () Bool)

(assert (=> start!986 m!5221))

(declare-fun m!5223 () Bool)

(assert (=> b!8459 m!5223))

(declare-fun m!5225 () Bool)

(assert (=> b!8458 m!5225))

(declare-fun m!5227 () Bool)

(assert (=> b!8456 m!5227))

(check-sat (not b!8467) (not start!986) (not b!8466) (not b!8458) (not b!8456) (not b!8461) (not b!8465) (not b_next!337) (not mapNonEmpty!599) b_and!487 (not b!8459) tp_is_empty!415)
(check-sat b_and!487 (not b_next!337))
(get-model)

(declare-fun d!861 () Bool)

(declare-fun res!8022 () Bool)

(declare-fun e!4858 () Bool)

(assert (=> d!861 (=> res!8022 e!4858)))

(assert (=> d!861 (= res!8022 (= (select (arr!359 _keys!1806) #b00000000000000000000000000000000) k0!1278))))

(assert (=> d!861 (= (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000) e!4858)))

(declare-fun b!8544 () Bool)

(declare-fun e!4859 () Bool)

(assert (=> b!8544 (= e!4858 e!4859)))

(declare-fun res!8023 () Bool)

(assert (=> b!8544 (=> (not res!8023) (not e!4859))))

(assert (=> b!8544 (= res!8023 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!421 _keys!1806)))))

(declare-fun b!8545 () Bool)

(assert (=> b!8545 (= e!4859 (arrayContainsKey!0 _keys!1806 k0!1278 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!861 (not res!8022)) b!8544))

(assert (= (and b!8544 res!8023) b!8545))

(declare-fun m!5277 () Bool)

(assert (=> d!861 m!5277))

(declare-fun m!5279 () Bool)

(assert (=> b!8545 m!5279))

(assert (=> b!8467 d!861))

(declare-fun bm!209 () Bool)

(declare-fun call!212 () Bool)

(assert (=> bm!209 (= call!212 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1806 mask!2250))))

(declare-fun b!8555 () Bool)

(declare-fun e!4867 () Bool)

(assert (=> b!8555 (= e!4867 call!212)))

(declare-fun b!8556 () Bool)

(declare-fun e!4868 () Bool)

(assert (=> b!8556 (= e!4868 e!4867)))

(declare-fun c!629 () Bool)

(assert (=> b!8556 (= c!629 (validKeyInArray!0 (select (arr!359 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!8557 () Bool)

(declare-fun e!4866 () Bool)

(assert (=> b!8557 (= e!4867 e!4866)))

(declare-fun lt!1787 () (_ BitVec 64))

(assert (=> b!8557 (= lt!1787 (select (arr!359 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!1786 () Unit!165)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!745 (_ BitVec 64) (_ BitVec 32)) Unit!165)

(assert (=> b!8557 (= lt!1786 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1806 lt!1787 #b00000000000000000000000000000000))))

(assert (=> b!8557 (arrayContainsKey!0 _keys!1806 lt!1787 #b00000000000000000000000000000000)))

(declare-fun lt!1788 () Unit!165)

(assert (=> b!8557 (= lt!1788 lt!1786)))

(declare-fun res!8028 () Bool)

(declare-datatypes ((SeekEntryResult!34 0))(
  ( (MissingZero!34 (index!2255 (_ BitVec 32))) (Found!34 (index!2256 (_ BitVec 32))) (Intermediate!34 (undefined!846 Bool) (index!2257 (_ BitVec 32)) (x!2730 (_ BitVec 32))) (Undefined!34) (MissingVacant!34 (index!2258 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!745 (_ BitVec 32)) SeekEntryResult!34)

(assert (=> b!8557 (= res!8028 (= (seekEntryOrOpen!0 (select (arr!359 _keys!1806) #b00000000000000000000000000000000) _keys!1806 mask!2250) (Found!34 #b00000000000000000000000000000000)))))

(assert (=> b!8557 (=> (not res!8028) (not e!4866))))

(declare-fun d!863 () Bool)

(declare-fun res!8029 () Bool)

(assert (=> d!863 (=> res!8029 e!4868)))

(assert (=> d!863 (= res!8029 (bvsge #b00000000000000000000000000000000 (size!421 _keys!1806)))))

(assert (=> d!863 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250) e!4868)))

(declare-fun b!8554 () Bool)

(assert (=> b!8554 (= e!4866 call!212)))

(assert (= (and d!863 (not res!8029)) b!8556))

(assert (= (and b!8556 c!629) b!8557))

(assert (= (and b!8556 (not c!629)) b!8555))

(assert (= (and b!8557 res!8028) b!8554))

(assert (= (or b!8554 b!8555) bm!209))

(declare-fun m!5281 () Bool)

(assert (=> bm!209 m!5281))

(assert (=> b!8556 m!5277))

(assert (=> b!8556 m!5277))

(declare-fun m!5283 () Bool)

(assert (=> b!8556 m!5283))

(assert (=> b!8557 m!5277))

(declare-fun m!5285 () Bool)

(assert (=> b!8557 m!5285))

(declare-fun m!5287 () Bool)

(assert (=> b!8557 m!5287))

(assert (=> b!8557 m!5277))

(declare-fun m!5289 () Bool)

(assert (=> b!8557 m!5289))

(assert (=> b!8458 d!863))

(declare-fun d!865 () Bool)

(assert (=> d!865 (= (validKeyInArray!0 k0!1278) (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!8459 d!865))

(declare-fun b!8568 () Bool)

(declare-fun e!4877 () Bool)

(declare-fun e!4878 () Bool)

(assert (=> b!8568 (= e!4877 e!4878)))

(declare-fun c!632 () Bool)

(assert (=> b!8568 (= c!632 (validKeyInArray!0 (select (arr!359 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun bm!212 () Bool)

(declare-fun call!215 () Bool)

(assert (=> bm!212 (= call!215 (arrayNoDuplicates!0 _keys!1806 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!632 (Cons!246 (select (arr!359 _keys!1806) #b00000000000000000000000000000000) Nil!247) Nil!247)))))

(declare-fun b!8569 () Bool)

(declare-fun e!4879 () Bool)

(assert (=> b!8569 (= e!4879 e!4877)))

(declare-fun res!8037 () Bool)

(assert (=> b!8569 (=> (not res!8037) (not e!4877))))

(declare-fun e!4880 () Bool)

(assert (=> b!8569 (= res!8037 (not e!4880))))

(declare-fun res!8038 () Bool)

(assert (=> b!8569 (=> (not res!8038) (not e!4880))))

(assert (=> b!8569 (= res!8038 (validKeyInArray!0 (select (arr!359 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!8570 () Bool)

(assert (=> b!8570 (= e!4878 call!215)))

(declare-fun b!8571 () Bool)

(declare-fun contains!114 (List!250 (_ BitVec 64)) Bool)

(assert (=> b!8571 (= e!4880 (contains!114 Nil!247 (select (arr!359 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!8572 () Bool)

(assert (=> b!8572 (= e!4878 call!215)))

(declare-fun d!867 () Bool)

(declare-fun res!8036 () Bool)

(assert (=> d!867 (=> res!8036 e!4879)))

(assert (=> d!867 (= res!8036 (bvsge #b00000000000000000000000000000000 (size!421 _keys!1806)))))

(assert (=> d!867 (= (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!247) e!4879)))

(assert (= (and d!867 (not res!8036)) b!8569))

(assert (= (and b!8569 res!8038) b!8571))

(assert (= (and b!8569 res!8037) b!8568))

(assert (= (and b!8568 c!632) b!8572))

(assert (= (and b!8568 (not c!632)) b!8570))

(assert (= (or b!8572 b!8570) bm!212))

(assert (=> b!8568 m!5277))

(assert (=> b!8568 m!5277))

(assert (=> b!8568 m!5283))

(assert (=> bm!212 m!5277))

(declare-fun m!5291 () Bool)

(assert (=> bm!212 m!5291))

(assert (=> b!8569 m!5277))

(assert (=> b!8569 m!5277))

(assert (=> b!8569 m!5283))

(assert (=> b!8571 m!5277))

(assert (=> b!8571 m!5277))

(declare-fun m!5293 () Bool)

(assert (=> b!8571 m!5293))

(assert (=> b!8465 d!867))

(declare-fun d!869 () Bool)

(declare-fun lt!1791 () (_ BitVec 32))

(assert (=> d!869 (and (or (bvslt lt!1791 #b00000000000000000000000000000000) (bvsge lt!1791 (size!421 _keys!1806)) (and (bvsge lt!1791 #b00000000000000000000000000000000) (bvslt lt!1791 (size!421 _keys!1806)))) (bvsge lt!1791 #b00000000000000000000000000000000) (bvslt lt!1791 (size!421 _keys!1806)) (= (select (arr!359 _keys!1806) lt!1791) k0!1278))))

(declare-fun e!4883 () (_ BitVec 32))

(assert (=> d!869 (= lt!1791 e!4883)))

(declare-fun c!635 () Bool)

(assert (=> d!869 (= c!635 (= (select (arr!359 _keys!1806) #b00000000000000000000000000000000) k0!1278))))

(assert (=> d!869 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!421 _keys!1806)) (bvslt (size!421 _keys!1806) #b01111111111111111111111111111111))))

(assert (=> d!869 (= (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000) lt!1791)))

(declare-fun b!8577 () Bool)

(assert (=> b!8577 (= e!4883 #b00000000000000000000000000000000)))

(declare-fun b!8578 () Bool)

(assert (=> b!8578 (= e!4883 (arrayScanForKey!0 _keys!1806 k0!1278 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!869 c!635) b!8577))

(assert (= (and d!869 (not c!635)) b!8578))

(declare-fun m!5295 () Bool)

(assert (=> d!869 m!5295))

(assert (=> d!869 m!5277))

(declare-fun m!5297 () Bool)

(assert (=> b!8578 m!5297))

(assert (=> b!8456 d!869))

(declare-fun d!871 () Bool)

(declare-fun e!4889 () Bool)

(assert (=> d!871 e!4889))

(declare-fun res!8041 () Bool)

(assert (=> d!871 (=> res!8041 e!4889)))

(declare-fun lt!1802 () Bool)

(assert (=> d!871 (= res!8041 (not lt!1802))))

(declare-fun lt!1800 () Bool)

(assert (=> d!871 (= lt!1802 lt!1800)))

(declare-fun lt!1803 () Unit!165)

(declare-fun e!4888 () Unit!165)

(assert (=> d!871 (= lt!1803 e!4888)))

(declare-fun c!638 () Bool)

(assert (=> d!871 (= c!638 lt!1800)))

(declare-fun containsKey!7 (List!249 (_ BitVec 64)) Bool)

(assert (=> d!871 (= lt!1800 (containsKey!7 (toList!137 (getCurrentListMap!96 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(assert (=> d!871 (= (contains!113 (getCurrentListMap!96 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278) lt!1802)))

(declare-fun b!8585 () Bool)

(declare-fun lt!1801 () Unit!165)

(assert (=> b!8585 (= e!4888 lt!1801)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!7 (List!249 (_ BitVec 64)) Unit!165)

(assert (=> b!8585 (= lt!1801 (lemmaContainsKeyImpliesGetValueByKeyDefined!7 (toList!137 (getCurrentListMap!96 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(declare-datatypes ((Option!19 0))(
  ( (Some!18 (v!1309 V!731)) (None!17) )
))
(declare-fun isDefined!8 (Option!19) Bool)

(declare-fun getValueByKey!13 (List!249 (_ BitVec 64)) Option!19)

(assert (=> b!8585 (isDefined!8 (getValueByKey!13 (toList!137 (getCurrentListMap!96 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(declare-fun b!8586 () Bool)

(declare-fun Unit!169 () Unit!165)

(assert (=> b!8586 (= e!4888 Unit!169)))

(declare-fun b!8587 () Bool)

(assert (=> b!8587 (= e!4889 (isDefined!8 (getValueByKey!13 (toList!137 (getCurrentListMap!96 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278)))))

(assert (= (and d!871 c!638) b!8585))

(assert (= (and d!871 (not c!638)) b!8586))

(assert (= (and d!871 (not res!8041)) b!8587))

(declare-fun m!5299 () Bool)

(assert (=> d!871 m!5299))

(declare-fun m!5301 () Bool)

(assert (=> b!8585 m!5301))

(declare-fun m!5303 () Bool)

(assert (=> b!8585 m!5303))

(assert (=> b!8585 m!5303))

(declare-fun m!5305 () Bool)

(assert (=> b!8585 m!5305))

(assert (=> b!8587 m!5303))

(assert (=> b!8587 m!5303))

(assert (=> b!8587 m!5305))

(assert (=> b!8461 d!871))

(declare-fun bm!227 () Bool)

(declare-fun call!231 () ListLongMap!243)

(declare-fun call!235 () ListLongMap!243)

(assert (=> bm!227 (= call!231 call!235)))

(declare-fun b!8630 () Bool)

(declare-fun e!4916 () Bool)

(declare-fun lt!1869 () ListLongMap!243)

(declare-fun apply!23 (ListLongMap!243 (_ BitVec 64)) V!731)

(assert (=> b!8630 (= e!4916 (= (apply!23 lt!1869 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1434))))

(declare-fun b!8631 () Bool)

(declare-fun e!4918 () Bool)

(assert (=> b!8631 (= e!4918 (= (apply!23 lt!1869 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1434))))

(declare-fun bm!228 () Bool)

(declare-fun call!236 () ListLongMap!243)

(declare-fun call!230 () ListLongMap!243)

(assert (=> bm!228 (= call!236 call!230)))

(declare-fun b!8632 () Bool)

(declare-fun e!4921 () Bool)

(assert (=> b!8632 (= e!4921 e!4916)))

(declare-fun res!8065 () Bool)

(declare-fun call!234 () Bool)

(assert (=> b!8632 (= res!8065 call!234)))

(assert (=> b!8632 (=> (not res!8065) (not e!4916))))

(declare-fun b!8633 () Bool)

(declare-fun e!4919 () ListLongMap!243)

(declare-fun e!4925 () ListLongMap!243)

(assert (=> b!8633 (= e!4919 e!4925)))

(declare-fun c!654 () Bool)

(assert (=> b!8633 (= c!654 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!8634 () Bool)

(declare-fun e!4923 () ListLongMap!243)

(assert (=> b!8634 (= e!4923 call!231)))

(declare-fun bm!229 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!7 (array!745 array!747 (_ BitVec 32) (_ BitVec 32) V!731 V!731 (_ BitVec 32) Int) ListLongMap!243)

(assert (=> bm!229 (= call!230 (getCurrentListMapNoExtraKeys!7 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun bm!230 () Bool)

(declare-fun call!232 () ListLongMap!243)

(assert (=> bm!230 (= call!232 call!236)))

(declare-fun e!4928 () Bool)

(declare-fun b!8635 () Bool)

(declare-fun get!163 (ValueCell!191 V!731) V!731)

(declare-fun dynLambda!45 (Int (_ BitVec 64)) V!731)

(assert (=> b!8635 (= e!4928 (= (apply!23 lt!1869 (select (arr!359 _keys!1806) #b00000000000000000000000000000000)) (get!163 (select (arr!360 _values!1492) #b00000000000000000000000000000000) (dynLambda!45 defaultEntry!1495 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!8635 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!422 _values!1492)))))

(assert (=> b!8635 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!421 _keys!1806)))))

(declare-fun b!8636 () Bool)

(declare-fun e!4924 () Bool)

(assert (=> b!8636 (= e!4924 e!4928)))

(declare-fun res!8064 () Bool)

(assert (=> b!8636 (=> (not res!8064) (not e!4928))))

(assert (=> b!8636 (= res!8064 (contains!113 lt!1869 (select (arr!359 _keys!1806) #b00000000000000000000000000000000)))))

(assert (=> b!8636 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!421 _keys!1806)))))

(declare-fun b!8637 () Bool)

(declare-fun e!4926 () Bool)

(assert (=> b!8637 (= e!4926 e!4921)))

(declare-fun c!655 () Bool)

(assert (=> b!8637 (= c!655 (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!231 () Bool)

(assert (=> bm!231 (= call!234 (contains!113 lt!1869 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!656 () Bool)

(declare-fun bm!232 () Bool)

(declare-fun +!10 (ListLongMap!243 tuple2!238) ListLongMap!243)

(assert (=> bm!232 (= call!235 (+!10 (ite c!656 call!230 (ite c!654 call!236 call!232)) (ite (or c!656 c!654) (tuple2!239 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1434) (tuple2!239 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1434))))))

(declare-fun b!8638 () Bool)

(declare-fun e!4927 () Bool)

(declare-fun call!233 () Bool)

(assert (=> b!8638 (= e!4927 (not call!233))))

(declare-fun b!8639 () Bool)

(assert (=> b!8639 (= e!4927 e!4918)))

(declare-fun res!8066 () Bool)

(assert (=> b!8639 (= res!8066 call!233)))

(assert (=> b!8639 (=> (not res!8066) (not e!4918))))

(declare-fun b!8640 () Bool)

(declare-fun res!8063 () Bool)

(assert (=> b!8640 (=> (not res!8063) (not e!4926))))

(assert (=> b!8640 (= res!8063 e!4924)))

(declare-fun res!8062 () Bool)

(assert (=> b!8640 (=> res!8062 e!4924)))

(declare-fun e!4920 () Bool)

(assert (=> b!8640 (= res!8062 (not e!4920))))

(declare-fun res!8067 () Bool)

(assert (=> b!8640 (=> (not res!8067) (not e!4920))))

(assert (=> b!8640 (= res!8067 (bvslt #b00000000000000000000000000000000 (size!421 _keys!1806)))))

(declare-fun b!8641 () Bool)

(declare-fun e!4922 () Bool)

(assert (=> b!8641 (= e!4922 (validKeyInArray!0 (select (arr!359 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!8642 () Bool)

(declare-fun res!8060 () Bool)

(assert (=> b!8642 (=> (not res!8060) (not e!4926))))

(assert (=> b!8642 (= res!8060 e!4927)))

(declare-fun c!653 () Bool)

(assert (=> b!8642 (= c!653 (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!233 () Bool)

(assert (=> bm!233 (= call!233 (contains!113 lt!1869 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!873 () Bool)

(assert (=> d!873 e!4926))

(declare-fun res!8061 () Bool)

(assert (=> d!873 (=> (not res!8061) (not e!4926))))

(assert (=> d!873 (= res!8061 (or (bvsge #b00000000000000000000000000000000 (size!421 _keys!1806)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!421 _keys!1806)))))))

(declare-fun lt!1852 () ListLongMap!243)

(assert (=> d!873 (= lt!1869 lt!1852)))

(declare-fun lt!1868 () Unit!165)

(declare-fun e!4917 () Unit!165)

(assert (=> d!873 (= lt!1868 e!4917)))

(declare-fun c!652 () Bool)

(assert (=> d!873 (= c!652 e!4922)))

(declare-fun res!8068 () Bool)

(assert (=> d!873 (=> (not res!8068) (not e!4922))))

(assert (=> d!873 (= res!8068 (bvslt #b00000000000000000000000000000000 (size!421 _keys!1806)))))

(assert (=> d!873 (= lt!1852 e!4919)))

(assert (=> d!873 (= c!656 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!873 (validMask!0 mask!2250)))

(assert (=> d!873 (= (getCurrentListMap!96 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) lt!1869)))

(declare-fun b!8643 () Bool)

(assert (=> b!8643 (= e!4920 (validKeyInArray!0 (select (arr!359 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!8644 () Bool)

(assert (=> b!8644 (= e!4921 (not call!234))))

(declare-fun b!8645 () Bool)

(declare-fun lt!1859 () Unit!165)

(assert (=> b!8645 (= e!4917 lt!1859)))

(declare-fun lt!1866 () ListLongMap!243)

(assert (=> b!8645 (= lt!1866 (getCurrentListMapNoExtraKeys!7 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!1849 () (_ BitVec 64))

(assert (=> b!8645 (= lt!1849 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!1862 () (_ BitVec 64))

(assert (=> b!8645 (= lt!1862 (select (arr!359 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!1865 () Unit!165)

(declare-fun addStillContains!8 (ListLongMap!243 (_ BitVec 64) V!731 (_ BitVec 64)) Unit!165)

(assert (=> b!8645 (= lt!1865 (addStillContains!8 lt!1866 lt!1849 zeroValue!1434 lt!1862))))

(assert (=> b!8645 (contains!113 (+!10 lt!1866 (tuple2!239 lt!1849 zeroValue!1434)) lt!1862)))

(declare-fun lt!1864 () Unit!165)

(assert (=> b!8645 (= lt!1864 lt!1865)))

(declare-fun lt!1861 () ListLongMap!243)

(assert (=> b!8645 (= lt!1861 (getCurrentListMapNoExtraKeys!7 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!1863 () (_ BitVec 64))

(assert (=> b!8645 (= lt!1863 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!1856 () (_ BitVec 64))

(assert (=> b!8645 (= lt!1856 (select (arr!359 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!1860 () Unit!165)

(declare-fun addApplyDifferent!8 (ListLongMap!243 (_ BitVec 64) V!731 (_ BitVec 64)) Unit!165)

(assert (=> b!8645 (= lt!1860 (addApplyDifferent!8 lt!1861 lt!1863 minValue!1434 lt!1856))))

(assert (=> b!8645 (= (apply!23 (+!10 lt!1861 (tuple2!239 lt!1863 minValue!1434)) lt!1856) (apply!23 lt!1861 lt!1856))))

(declare-fun lt!1855 () Unit!165)

(assert (=> b!8645 (= lt!1855 lt!1860)))

(declare-fun lt!1851 () ListLongMap!243)

(assert (=> b!8645 (= lt!1851 (getCurrentListMapNoExtraKeys!7 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!1858 () (_ BitVec 64))

(assert (=> b!8645 (= lt!1858 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!1848 () (_ BitVec 64))

(assert (=> b!8645 (= lt!1848 (select (arr!359 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!1853 () Unit!165)

(assert (=> b!8645 (= lt!1853 (addApplyDifferent!8 lt!1851 lt!1858 zeroValue!1434 lt!1848))))

(assert (=> b!8645 (= (apply!23 (+!10 lt!1851 (tuple2!239 lt!1858 zeroValue!1434)) lt!1848) (apply!23 lt!1851 lt!1848))))

(declare-fun lt!1850 () Unit!165)

(assert (=> b!8645 (= lt!1850 lt!1853)))

(declare-fun lt!1857 () ListLongMap!243)

(assert (=> b!8645 (= lt!1857 (getCurrentListMapNoExtraKeys!7 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!1867 () (_ BitVec 64))

(assert (=> b!8645 (= lt!1867 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!1854 () (_ BitVec 64))

(assert (=> b!8645 (= lt!1854 (select (arr!359 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> b!8645 (= lt!1859 (addApplyDifferent!8 lt!1857 lt!1867 minValue!1434 lt!1854))))

(assert (=> b!8645 (= (apply!23 (+!10 lt!1857 (tuple2!239 lt!1867 minValue!1434)) lt!1854) (apply!23 lt!1857 lt!1854))))

(declare-fun b!8646 () Bool)

(assert (=> b!8646 (= e!4925 call!231)))

(declare-fun b!8647 () Bool)

(declare-fun Unit!170 () Unit!165)

(assert (=> b!8647 (= e!4917 Unit!170)))

(declare-fun b!8648 () Bool)

(assert (=> b!8648 (= e!4919 (+!10 call!235 (tuple2!239 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1434)))))

(declare-fun b!8649 () Bool)

(declare-fun c!651 () Bool)

(assert (=> b!8649 (= c!651 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!8649 (= e!4925 e!4923)))

(declare-fun b!8650 () Bool)

(assert (=> b!8650 (= e!4923 call!232)))

(assert (= (and d!873 c!656) b!8648))

(assert (= (and d!873 (not c!656)) b!8633))

(assert (= (and b!8633 c!654) b!8646))

(assert (= (and b!8633 (not c!654)) b!8649))

(assert (= (and b!8649 c!651) b!8634))

(assert (= (and b!8649 (not c!651)) b!8650))

(assert (= (or b!8634 b!8650) bm!230))

(assert (= (or b!8646 bm!230) bm!228))

(assert (= (or b!8646 b!8634) bm!227))

(assert (= (or b!8648 bm!228) bm!229))

(assert (= (or b!8648 bm!227) bm!232))

(assert (= (and d!873 res!8068) b!8641))

(assert (= (and d!873 c!652) b!8645))

(assert (= (and d!873 (not c!652)) b!8647))

(assert (= (and d!873 res!8061) b!8640))

(assert (= (and b!8640 res!8067) b!8643))

(assert (= (and b!8640 (not res!8062)) b!8636))

(assert (= (and b!8636 res!8064) b!8635))

(assert (= (and b!8640 res!8063) b!8642))

(assert (= (and b!8642 c!653) b!8639))

(assert (= (and b!8642 (not c!653)) b!8638))

(assert (= (and b!8639 res!8066) b!8631))

(assert (= (or b!8639 b!8638) bm!233))

(assert (= (and b!8642 res!8060) b!8637))

(assert (= (and b!8637 c!655) b!8632))

(assert (= (and b!8637 (not c!655)) b!8644))

(assert (= (and b!8632 res!8065) b!8630))

(assert (= (or b!8632 b!8644) bm!231))

(declare-fun b_lambda!343 () Bool)

(assert (=> (not b_lambda!343) (not b!8635)))

(declare-fun t!2392 () Bool)

(declare-fun tb!139 () Bool)

(assert (=> (and start!986 (= defaultEntry!1495 defaultEntry!1495) t!2392) tb!139))

(declare-fun result!219 () Bool)

(assert (=> tb!139 (= result!219 tp_is_empty!415)))

(assert (=> b!8635 t!2392))

(declare-fun b_and!493 () Bool)

(assert (= b_and!487 (and (=> t!2392 result!219) b_and!493)))

(assert (=> d!873 m!5217))

(declare-fun m!5307 () Bool)

(assert (=> b!8645 m!5307))

(declare-fun m!5309 () Bool)

(assert (=> b!8645 m!5309))

(declare-fun m!5311 () Bool)

(assert (=> b!8645 m!5311))

(declare-fun m!5313 () Bool)

(assert (=> b!8645 m!5313))

(declare-fun m!5315 () Bool)

(assert (=> b!8645 m!5315))

(declare-fun m!5317 () Bool)

(assert (=> b!8645 m!5317))

(declare-fun m!5319 () Bool)

(assert (=> b!8645 m!5319))

(assert (=> b!8645 m!5317))

(declare-fun m!5321 () Bool)

(assert (=> b!8645 m!5321))

(assert (=> b!8645 m!5313))

(declare-fun m!5323 () Bool)

(assert (=> b!8645 m!5323))

(declare-fun m!5325 () Bool)

(assert (=> b!8645 m!5325))

(declare-fun m!5327 () Bool)

(assert (=> b!8645 m!5327))

(declare-fun m!5329 () Bool)

(assert (=> b!8645 m!5329))

(assert (=> b!8645 m!5277))

(assert (=> b!8645 m!5311))

(declare-fun m!5331 () Bool)

(assert (=> b!8645 m!5331))

(declare-fun m!5333 () Bool)

(assert (=> b!8645 m!5333))

(declare-fun m!5335 () Bool)

(assert (=> b!8645 m!5335))

(assert (=> b!8645 m!5335))

(declare-fun m!5337 () Bool)

(assert (=> b!8645 m!5337))

(assert (=> b!8641 m!5277))

(assert (=> b!8641 m!5277))

(assert (=> b!8641 m!5283))

(declare-fun m!5339 () Bool)

(assert (=> b!8648 m!5339))

(declare-fun m!5341 () Bool)

(assert (=> b!8630 m!5341))

(assert (=> bm!229 m!5321))

(declare-fun m!5343 () Bool)

(assert (=> bm!231 m!5343))

(assert (=> b!8636 m!5277))

(assert (=> b!8636 m!5277))

(declare-fun m!5345 () Bool)

(assert (=> b!8636 m!5345))

(declare-fun m!5347 () Bool)

(assert (=> b!8631 m!5347))

(declare-fun m!5349 () Bool)

(assert (=> bm!232 m!5349))

(assert (=> b!8643 m!5277))

(assert (=> b!8643 m!5277))

(assert (=> b!8643 m!5283))

(declare-fun m!5351 () Bool)

(assert (=> bm!233 m!5351))

(assert (=> b!8635 m!5277))

(assert (=> b!8635 m!5277))

(declare-fun m!5353 () Bool)

(assert (=> b!8635 m!5353))

(declare-fun m!5355 () Bool)

(assert (=> b!8635 m!5355))

(assert (=> b!8635 m!5355))

(declare-fun m!5357 () Bool)

(assert (=> b!8635 m!5357))

(declare-fun m!5359 () Bool)

(assert (=> b!8635 m!5359))

(assert (=> b!8635 m!5357))

(assert (=> b!8461 d!873))

(declare-fun d!875 () Bool)

(assert (=> d!875 (= (validMask!0 mask!2250) (and (or (= mask!2250 #b00000000000000000000000000000111) (= mask!2250 #b00000000000000000000000000001111) (= mask!2250 #b00000000000000000000000000011111) (= mask!2250 #b00000000000000000000000000111111) (= mask!2250 #b00000000000000000000000001111111) (= mask!2250 #b00000000000000000000000011111111) (= mask!2250 #b00000000000000000000000111111111) (= mask!2250 #b00000000000000000000001111111111) (= mask!2250 #b00000000000000000000011111111111) (= mask!2250 #b00000000000000000000111111111111) (= mask!2250 #b00000000000000000001111111111111) (= mask!2250 #b00000000000000000011111111111111) (= mask!2250 #b00000000000000000111111111111111) (= mask!2250 #b00000000000000001111111111111111) (= mask!2250 #b00000000000000011111111111111111) (= mask!2250 #b00000000000000111111111111111111) (= mask!2250 #b00000000000001111111111111111111) (= mask!2250 #b00000000000011111111111111111111) (= mask!2250 #b00000000000111111111111111111111) (= mask!2250 #b00000000001111111111111111111111) (= mask!2250 #b00000000011111111111111111111111) (= mask!2250 #b00000000111111111111111111111111) (= mask!2250 #b00000001111111111111111111111111) (= mask!2250 #b00000011111111111111111111111111) (= mask!2250 #b00000111111111111111111111111111) (= mask!2250 #b00001111111111111111111111111111) (= mask!2250 #b00011111111111111111111111111111) (= mask!2250 #b00111111111111111111111111111111)) (bvsle mask!2250 #b00111111111111111111111111111111)))))

(assert (=> start!986 d!875))

(declare-fun d!877 () Bool)

(assert (=> d!877 (= (array_inv!265 _values!1492) (bvsge (size!422 _values!1492) #b00000000000000000000000000000000))))

(assert (=> start!986 d!877))

(declare-fun d!879 () Bool)

(assert (=> d!879 (= (array_inv!266 _keys!1806) (bvsge (size!421 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> start!986 d!879))

(assert (=> b!8466 d!861))

(declare-fun d!881 () Bool)

(declare-fun e!4931 () Bool)

(assert (=> d!881 e!4931))

(declare-fun c!659 () Bool)

(assert (=> d!881 (= c!659 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!1872 () Unit!165)

(declare-fun choose!141 (array!745 array!747 (_ BitVec 32) (_ BitVec 32) V!731 V!731 (_ BitVec 64) Int) Unit!165)

(assert (=> d!881 (= lt!1872 (choose!141 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(assert (=> d!881 (validMask!0 mask!2250)))

(assert (=> d!881 (= (lemmaKeyInListMapIsInArray!63 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495) lt!1872)))

(declare-fun b!8657 () Bool)

(assert (=> b!8657 (= e!4931 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!8658 () Bool)

(assert (=> b!8658 (= e!4931 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!881 c!659) b!8657))

(assert (= (and d!881 (not c!659)) b!8658))

(declare-fun m!5361 () Bool)

(assert (=> d!881 m!5361))

(assert (=> d!881 m!5217))

(assert (=> b!8657 m!5205))

(assert (=> b!8466 d!881))

(declare-fun mapIsEmpty!608 () Bool)

(declare-fun mapRes!608 () Bool)

(assert (=> mapIsEmpty!608 mapRes!608))

(declare-fun condMapEmpty!608 () Bool)

(declare-fun mapDefault!608 () ValueCell!191)

(assert (=> mapNonEmpty!599 (= condMapEmpty!608 (= mapRest!599 ((as const (Array (_ BitVec 32) ValueCell!191)) mapDefault!608)))))

(declare-fun e!4937 () Bool)

(assert (=> mapNonEmpty!599 (= tp!1246 (and e!4937 mapRes!608))))

(declare-fun b!8665 () Bool)

(declare-fun e!4936 () Bool)

(assert (=> b!8665 (= e!4936 tp_is_empty!415)))

(declare-fun mapNonEmpty!608 () Bool)

(declare-fun tp!1262 () Bool)

(assert (=> mapNonEmpty!608 (= mapRes!608 (and tp!1262 e!4936))))

(declare-fun mapKey!608 () (_ BitVec 32))

(declare-fun mapValue!608 () ValueCell!191)

(declare-fun mapRest!608 () (Array (_ BitVec 32) ValueCell!191))

(assert (=> mapNonEmpty!608 (= mapRest!599 (store mapRest!608 mapKey!608 mapValue!608))))

(declare-fun b!8666 () Bool)

(assert (=> b!8666 (= e!4937 tp_is_empty!415)))

(assert (= (and mapNonEmpty!599 condMapEmpty!608) mapIsEmpty!608))

(assert (= (and mapNonEmpty!599 (not condMapEmpty!608)) mapNonEmpty!608))

(assert (= (and mapNonEmpty!608 ((_ is ValueCellFull!191) mapValue!608)) b!8665))

(assert (= (and mapNonEmpty!599 ((_ is ValueCellFull!191) mapDefault!608)) b!8666))

(declare-fun m!5363 () Bool)

(assert (=> mapNonEmpty!608 m!5363))

(declare-fun b_lambda!345 () Bool)

(assert (= b_lambda!343 (or (and start!986 b_free!337) b_lambda!345)))

(check-sat (not b!8578) (not b!8557) (not d!873) (not b!8587) (not b!8657) (not b!8648) (not bm!229) (not b!8545) (not b_next!337) (not b!8556) (not bm!212) (not b!8568) (not b!8630) (not b!8571) (not bm!209) b_and!493 (not b!8585) (not bm!232) (not b!8643) (not b!8635) (not b!8645) (not b!8636) (not b!8641) (not b!8631) (not d!881) (not mapNonEmpty!608) (not b!8569) (not d!871) (not b_lambda!345) (not bm!231) (not bm!233) tp_is_empty!415)
(check-sat b_and!493 (not b_next!337))

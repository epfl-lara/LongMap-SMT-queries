; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4516 () Bool)

(assert start!4516)

(declare-fun b_free!1261 () Bool)

(declare-fun b_next!1261 () Bool)

(assert (=> start!4516 (= b_free!1261 (not b_next!1261))))

(declare-fun tp!5224 () Bool)

(declare-fun b_and!2075 () Bool)

(assert (=> start!4516 (= tp!5224 b_and!2075)))

(declare-fun mapNonEmpty!1972 () Bool)

(declare-fun mapRes!1972 () Bool)

(declare-fun tp!5223 () Bool)

(declare-fun e!22229 () Bool)

(assert (=> mapNonEmpty!1972 (= mapRes!1972 (and tp!5223 e!22229))))

(declare-datatypes ((V!1979 0))(
  ( (V!1980 (val!834 Int)) )
))
(declare-datatypes ((ValueCell!608 0))(
  ( (ValueCellFull!608 (v!1930 V!1979)) (EmptyCell!608) )
))
(declare-datatypes ((array!2427 0))(
  ( (array!2428 (arr!1160 (Array (_ BitVec 32) ValueCell!608)) (size!1261 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2427)

(declare-fun mapKey!1972 () (_ BitVec 32))

(declare-fun mapValue!1972 () ValueCell!608)

(declare-fun mapRest!1972 () (Array (_ BitVec 32) ValueCell!608))

(assert (=> mapNonEmpty!1972 (= (arr!1160 _values!1501) (store mapRest!1972 mapKey!1972 mapValue!1972))))

(declare-fun b!35194 () Bool)

(declare-fun res!21385 () Bool)

(declare-fun e!22230 () Bool)

(assert (=> b!35194 (=> (not res!21385) (not e!22230))))

(declare-datatypes ((array!2429 0))(
  ( (array!2430 (arr!1161 (Array (_ BitVec 32) (_ BitVec 64))) (size!1262 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2429)

(declare-datatypes ((List!918 0))(
  ( (Nil!915) (Cons!914 (h!1481 (_ BitVec 64)) (t!3619 List!918)) )
))
(declare-fun arrayNoDuplicates!0 (array!2429 (_ BitVec 32) List!918) Bool)

(assert (=> b!35194 (= res!21385 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!915))))

(declare-fun mapIsEmpty!1972 () Bool)

(assert (=> mapIsEmpty!1972 mapRes!1972))

(declare-fun b!35195 () Bool)

(declare-fun e!22231 () Bool)

(declare-datatypes ((SeekEntryResult!149 0))(
  ( (MissingZero!149 (index!2718 (_ BitVec 32))) (Found!149 (index!2719 (_ BitVec 32))) (Intermediate!149 (undefined!961 Bool) (index!2720 (_ BitVec 32)) (x!6993 (_ BitVec 32))) (Undefined!149) (MissingVacant!149 (index!2721 (_ BitVec 32))) )
))
(declare-fun lt!12904 () SeekEntryResult!149)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!35195 (= e!22231 (not (validKeyInArray!0 (select (arr!1161 _keys!1833) (index!2719 lt!12904)))))))

(declare-fun b!35196 () Bool)

(assert (=> b!35196 (= e!22230 e!22231)))

(declare-fun res!21391 () Bool)

(assert (=> b!35196 (=> (not res!21391) (not e!22231))))

(get-info :version)

(assert (=> b!35196 (= res!21391 (and ((_ is Found!149) lt!12904) (bvsge (index!2719 lt!12904) #b00000000000000000000000000000000) (bvslt (index!2719 lt!12904) (size!1262 _keys!1833))))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2429 (_ BitVec 32)) SeekEntryResult!149)

(assert (=> b!35196 (= lt!12904 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!35197 () Bool)

(declare-fun res!21386 () Bool)

(assert (=> b!35197 (=> (not res!21386) (not e!22230))))

(declare-fun arrayContainsKey!0 (array!2429 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!35197 (= res!21386 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!35198 () Bool)

(declare-fun e!22228 () Bool)

(declare-fun e!22233 () Bool)

(assert (=> b!35198 (= e!22228 (and e!22233 mapRes!1972))))

(declare-fun condMapEmpty!1972 () Bool)

(declare-fun mapDefault!1972 () ValueCell!608)

(assert (=> b!35198 (= condMapEmpty!1972 (= (arr!1160 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!608)) mapDefault!1972)))))

(declare-fun b!35199 () Bool)

(declare-fun tp_is_empty!1615 () Bool)

(assert (=> b!35199 (= e!22233 tp_is_empty!1615)))

(declare-fun b!35200 () Bool)

(declare-fun res!21392 () Bool)

(assert (=> b!35200 (=> (not res!21392) (not e!22230))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2429 (_ BitVec 32)) Bool)

(assert (=> b!35200 (= res!21392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!35201 () Bool)

(declare-fun res!21388 () Bool)

(assert (=> b!35201 (=> (not res!21388) (not e!22230))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!35201 (= res!21388 (and (= (size!1261 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1262 _keys!1833) (size!1261 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!35202 () Bool)

(declare-fun res!21389 () Bool)

(assert (=> b!35202 (=> (not res!21389) (not e!22230))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1979)

(declare-fun minValue!1443 () V!1979)

(declare-datatypes ((tuple2!1322 0))(
  ( (tuple2!1323 (_1!672 (_ BitVec 64)) (_2!672 V!1979)) )
))
(declare-datatypes ((List!919 0))(
  ( (Nil!916) (Cons!915 (h!1482 tuple2!1322) (t!3620 List!919)) )
))
(declare-datatypes ((ListLongMap!893 0))(
  ( (ListLongMap!894 (toList!462 List!919)) )
))
(declare-fun contains!411 (ListLongMap!893 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!283 (array!2429 array!2427 (_ BitVec 32) (_ BitVec 32) V!1979 V!1979 (_ BitVec 32) Int) ListLongMap!893)

(assert (=> b!35202 (= res!21389 (not (contains!411 (getCurrentListMap!283 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!35203 () Bool)

(assert (=> b!35203 (= e!22229 tp_is_empty!1615)))

(declare-fun b!35204 () Bool)

(declare-fun res!21387 () Bool)

(assert (=> b!35204 (=> (not res!21387) (not e!22230))))

(assert (=> b!35204 (= res!21387 (validKeyInArray!0 k0!1304))))

(declare-fun res!21390 () Bool)

(assert (=> start!4516 (=> (not res!21390) (not e!22230))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4516 (= res!21390 (validMask!0 mask!2294))))

(assert (=> start!4516 e!22230))

(assert (=> start!4516 true))

(assert (=> start!4516 tp!5224))

(declare-fun array_inv!793 (array!2427) Bool)

(assert (=> start!4516 (and (array_inv!793 _values!1501) e!22228)))

(declare-fun array_inv!794 (array!2429) Bool)

(assert (=> start!4516 (array_inv!794 _keys!1833)))

(assert (=> start!4516 tp_is_empty!1615))

(assert (= (and start!4516 res!21390) b!35201))

(assert (= (and b!35201 res!21388) b!35200))

(assert (= (and b!35200 res!21392) b!35194))

(assert (= (and b!35194 res!21385) b!35204))

(assert (= (and b!35204 res!21387) b!35202))

(assert (= (and b!35202 res!21389) b!35197))

(assert (= (and b!35197 res!21386) b!35196))

(assert (= (and b!35196 res!21391) b!35195))

(assert (= (and b!35198 condMapEmpty!1972) mapIsEmpty!1972))

(assert (= (and b!35198 (not condMapEmpty!1972)) mapNonEmpty!1972))

(assert (= (and mapNonEmpty!1972 ((_ is ValueCellFull!608) mapValue!1972)) b!35203))

(assert (= (and b!35198 ((_ is ValueCellFull!608) mapDefault!1972)) b!35199))

(assert (= start!4516 b!35198))

(declare-fun m!28215 () Bool)

(assert (=> start!4516 m!28215))

(declare-fun m!28217 () Bool)

(assert (=> start!4516 m!28217))

(declare-fun m!28219 () Bool)

(assert (=> start!4516 m!28219))

(declare-fun m!28221 () Bool)

(assert (=> b!35197 m!28221))

(declare-fun m!28223 () Bool)

(assert (=> b!35200 m!28223))

(declare-fun m!28225 () Bool)

(assert (=> b!35194 m!28225))

(declare-fun m!28227 () Bool)

(assert (=> b!35204 m!28227))

(declare-fun m!28229 () Bool)

(assert (=> mapNonEmpty!1972 m!28229))

(declare-fun m!28231 () Bool)

(assert (=> b!35196 m!28231))

(declare-fun m!28233 () Bool)

(assert (=> b!35195 m!28233))

(assert (=> b!35195 m!28233))

(declare-fun m!28235 () Bool)

(assert (=> b!35195 m!28235))

(declare-fun m!28237 () Bool)

(assert (=> b!35202 m!28237))

(assert (=> b!35202 m!28237))

(declare-fun m!28239 () Bool)

(assert (=> b!35202 m!28239))

(check-sat (not b!35197) (not b_next!1261) (not b!35196) (not b!35195) tp_is_empty!1615 (not mapNonEmpty!1972) (not b!35202) (not b!35200) (not b!35194) (not start!4516) b_and!2075 (not b!35204))
(check-sat b_and!2075 (not b_next!1261))
(get-model)

(declare-fun b!35279 () Bool)

(declare-fun e!22277 () Bool)

(declare-fun call!2767 () Bool)

(assert (=> b!35279 (= e!22277 call!2767)))

(declare-fun d!5261 () Bool)

(declare-fun res!21445 () Bool)

(declare-fun e!22278 () Bool)

(assert (=> d!5261 (=> res!21445 e!22278)))

(assert (=> d!5261 (= res!21445 (bvsge #b00000000000000000000000000000000 (size!1262 _keys!1833)))))

(assert (=> d!5261 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!22278)))

(declare-fun b!35280 () Bool)

(declare-fun e!22276 () Bool)

(assert (=> b!35280 (= e!22278 e!22276)))

(declare-fun c!3981 () Bool)

(assert (=> b!35280 (= c!3981 (validKeyInArray!0 (select (arr!1161 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun bm!2764 () Bool)

(assert (=> bm!2764 (= call!2767 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun b!35281 () Bool)

(assert (=> b!35281 (= e!22276 e!22277)))

(declare-fun lt!12917 () (_ BitVec 64))

(assert (=> b!35281 (= lt!12917 (select (arr!1161 _keys!1833) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!781 0))(
  ( (Unit!782) )
))
(declare-fun lt!12919 () Unit!781)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2429 (_ BitVec 64) (_ BitVec 32)) Unit!781)

(assert (=> b!35281 (= lt!12919 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!12917 #b00000000000000000000000000000000))))

(assert (=> b!35281 (arrayContainsKey!0 _keys!1833 lt!12917 #b00000000000000000000000000000000)))

(declare-fun lt!12918 () Unit!781)

(assert (=> b!35281 (= lt!12918 lt!12919)))

(declare-fun res!21446 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2429 (_ BitVec 32)) SeekEntryResult!149)

(assert (=> b!35281 (= res!21446 (= (seekEntryOrOpen!0 (select (arr!1161 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!149 #b00000000000000000000000000000000)))))

(assert (=> b!35281 (=> (not res!21446) (not e!22277))))

(declare-fun b!35282 () Bool)

(assert (=> b!35282 (= e!22276 call!2767)))

(assert (= (and d!5261 (not res!21445)) b!35280))

(assert (= (and b!35280 c!3981) b!35281))

(assert (= (and b!35280 (not c!3981)) b!35282))

(assert (= (and b!35281 res!21446) b!35279))

(assert (= (or b!35279 b!35282) bm!2764))

(declare-fun m!28293 () Bool)

(assert (=> b!35280 m!28293))

(assert (=> b!35280 m!28293))

(declare-fun m!28295 () Bool)

(assert (=> b!35280 m!28295))

(declare-fun m!28297 () Bool)

(assert (=> bm!2764 m!28297))

(assert (=> b!35281 m!28293))

(declare-fun m!28299 () Bool)

(assert (=> b!35281 m!28299))

(declare-fun m!28301 () Bool)

(assert (=> b!35281 m!28301))

(assert (=> b!35281 m!28293))

(declare-fun m!28303 () Bool)

(assert (=> b!35281 m!28303))

(assert (=> b!35200 d!5261))

(declare-fun d!5263 () Bool)

(assert (=> d!5263 (= (validKeyInArray!0 (select (arr!1161 _keys!1833) (index!2719 lt!12904))) (and (not (= (select (arr!1161 _keys!1833) (index!2719 lt!12904)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1161 _keys!1833) (index!2719 lt!12904)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!35195 d!5263))

(declare-fun d!5265 () Bool)

(assert (=> d!5265 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!4516 d!5265))

(declare-fun d!5267 () Bool)

(assert (=> d!5267 (= (array_inv!793 _values!1501) (bvsge (size!1261 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!4516 d!5267))

(declare-fun d!5269 () Bool)

(assert (=> d!5269 (= (array_inv!794 _keys!1833) (bvsge (size!1262 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!4516 d!5269))

(declare-fun d!5271 () Bool)

(assert (=> d!5271 (= (validKeyInArray!0 k0!1304) (and (not (= k0!1304 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1304 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!35204 d!5271))

(declare-fun b!35293 () Bool)

(declare-fun e!22288 () Bool)

(declare-fun call!2770 () Bool)

(assert (=> b!35293 (= e!22288 call!2770)))

(declare-fun d!5273 () Bool)

(declare-fun res!21453 () Bool)

(declare-fun e!22290 () Bool)

(assert (=> d!5273 (=> res!21453 e!22290)))

(assert (=> d!5273 (= res!21453 (bvsge #b00000000000000000000000000000000 (size!1262 _keys!1833)))))

(assert (=> d!5273 (= (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!915) e!22290)))

(declare-fun b!35294 () Bool)

(declare-fun e!22289 () Bool)

(assert (=> b!35294 (= e!22289 e!22288)))

(declare-fun c!3984 () Bool)

(assert (=> b!35294 (= c!3984 (validKeyInArray!0 (select (arr!1161 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!35295 () Bool)

(declare-fun e!22287 () Bool)

(declare-fun contains!413 (List!918 (_ BitVec 64)) Bool)

(assert (=> b!35295 (= e!22287 (contains!413 Nil!915 (select (arr!1161 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun bm!2767 () Bool)

(assert (=> bm!2767 (= call!2770 (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!3984 (Cons!914 (select (arr!1161 _keys!1833) #b00000000000000000000000000000000) Nil!915) Nil!915)))))

(declare-fun b!35296 () Bool)

(assert (=> b!35296 (= e!22288 call!2770)))

(declare-fun b!35297 () Bool)

(assert (=> b!35297 (= e!22290 e!22289)))

(declare-fun res!21455 () Bool)

(assert (=> b!35297 (=> (not res!21455) (not e!22289))))

(assert (=> b!35297 (= res!21455 (not e!22287))))

(declare-fun res!21454 () Bool)

(assert (=> b!35297 (=> (not res!21454) (not e!22287))))

(assert (=> b!35297 (= res!21454 (validKeyInArray!0 (select (arr!1161 _keys!1833) #b00000000000000000000000000000000)))))

(assert (= (and d!5273 (not res!21453)) b!35297))

(assert (= (and b!35297 res!21454) b!35295))

(assert (= (and b!35297 res!21455) b!35294))

(assert (= (and b!35294 c!3984) b!35293))

(assert (= (and b!35294 (not c!3984)) b!35296))

(assert (= (or b!35293 b!35296) bm!2767))

(assert (=> b!35294 m!28293))

(assert (=> b!35294 m!28293))

(assert (=> b!35294 m!28295))

(assert (=> b!35295 m!28293))

(assert (=> b!35295 m!28293))

(declare-fun m!28305 () Bool)

(assert (=> b!35295 m!28305))

(assert (=> bm!2767 m!28293))

(declare-fun m!28307 () Bool)

(assert (=> bm!2767 m!28307))

(assert (=> b!35297 m!28293))

(assert (=> b!35297 m!28293))

(assert (=> b!35297 m!28295))

(assert (=> b!35194 d!5273))

(declare-fun b!35310 () Bool)

(declare-fun e!22298 () SeekEntryResult!149)

(declare-fun e!22297 () SeekEntryResult!149)

(assert (=> b!35310 (= e!22298 e!22297)))

(declare-fun lt!12930 () (_ BitVec 64))

(declare-fun lt!12929 () SeekEntryResult!149)

(assert (=> b!35310 (= lt!12930 (select (arr!1161 _keys!1833) (index!2720 lt!12929)))))

(declare-fun c!3991 () Bool)

(assert (=> b!35310 (= c!3991 (= lt!12930 k0!1304))))

(declare-fun b!35311 () Bool)

(declare-fun e!22299 () SeekEntryResult!149)

(declare-fun lt!12928 () SeekEntryResult!149)

(assert (=> b!35311 (= e!22299 (ite ((_ is MissingVacant!149) lt!12928) (MissingZero!149 (index!2721 lt!12928)) lt!12928))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2429 (_ BitVec 32)) SeekEntryResult!149)

(assert (=> b!35311 (= lt!12928 (seekKeyOrZeroReturnVacant!0 (x!6993 lt!12929) (index!2720 lt!12929) (index!2720 lt!12929) k0!1304 _keys!1833 mask!2294))))

(declare-fun b!35312 () Bool)

(declare-fun c!3993 () Bool)

(assert (=> b!35312 (= c!3993 (= lt!12930 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!35312 (= e!22297 e!22299)))

(declare-fun b!35313 () Bool)

(assert (=> b!35313 (= e!22299 (MissingZero!149 (index!2720 lt!12929)))))

(declare-fun b!35314 () Bool)

(assert (=> b!35314 (= e!22298 Undefined!149)))

(declare-fun d!5275 () Bool)

(declare-fun lt!12931 () SeekEntryResult!149)

(assert (=> d!5275 (and (or ((_ is MissingVacant!149) lt!12931) (not ((_ is Found!149) lt!12931)) (and (bvsge (index!2719 lt!12931) #b00000000000000000000000000000000) (bvslt (index!2719 lt!12931) (size!1262 _keys!1833)))) (not ((_ is MissingVacant!149) lt!12931)) (or (not ((_ is Found!149) lt!12931)) (= (select (arr!1161 _keys!1833) (index!2719 lt!12931)) k0!1304)))))

(assert (=> d!5275 (= lt!12931 e!22298)))

(declare-fun c!3992 () Bool)

(assert (=> d!5275 (= c!3992 (and ((_ is Intermediate!149) lt!12929) (undefined!961 lt!12929)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2429 (_ BitVec 32)) SeekEntryResult!149)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!5275 (= lt!12929 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1304 mask!2294) k0!1304 _keys!1833 mask!2294))))

(assert (=> d!5275 (validMask!0 mask!2294)))

(assert (=> d!5275 (= (seekEntry!0 k0!1304 _keys!1833 mask!2294) lt!12931)))

(declare-fun b!35315 () Bool)

(assert (=> b!35315 (= e!22297 (Found!149 (index!2720 lt!12929)))))

(assert (= (and d!5275 c!3992) b!35314))

(assert (= (and d!5275 (not c!3992)) b!35310))

(assert (= (and b!35310 c!3991) b!35315))

(assert (= (and b!35310 (not c!3991)) b!35312))

(assert (= (and b!35312 c!3993) b!35313))

(assert (= (and b!35312 (not c!3993)) b!35311))

(declare-fun m!28309 () Bool)

(assert (=> b!35310 m!28309))

(declare-fun m!28311 () Bool)

(assert (=> b!35311 m!28311))

(declare-fun m!28313 () Bool)

(assert (=> d!5275 m!28313))

(declare-fun m!28315 () Bool)

(assert (=> d!5275 m!28315))

(assert (=> d!5275 m!28315))

(declare-fun m!28317 () Bool)

(assert (=> d!5275 m!28317))

(assert (=> d!5275 m!28215))

(assert (=> b!35196 d!5275))

(declare-fun d!5277 () Bool)

(declare-fun e!22304 () Bool)

(assert (=> d!5277 e!22304))

(declare-fun res!21458 () Bool)

(assert (=> d!5277 (=> res!21458 e!22304)))

(declare-fun lt!12940 () Bool)

(assert (=> d!5277 (= res!21458 (not lt!12940))))

(declare-fun lt!12942 () Bool)

(assert (=> d!5277 (= lt!12940 lt!12942)))

(declare-fun lt!12941 () Unit!781)

(declare-fun e!22305 () Unit!781)

(assert (=> d!5277 (= lt!12941 e!22305)))

(declare-fun c!3996 () Bool)

(assert (=> d!5277 (= c!3996 lt!12942)))

(declare-fun containsKey!36 (List!919 (_ BitVec 64)) Bool)

(assert (=> d!5277 (= lt!12942 (containsKey!36 (toList!462 (getCurrentListMap!283 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(assert (=> d!5277 (= (contains!411 (getCurrentListMap!283 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304) lt!12940)))

(declare-fun b!35322 () Bool)

(declare-fun lt!12943 () Unit!781)

(assert (=> b!35322 (= e!22305 lt!12943)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!33 (List!919 (_ BitVec 64)) Unit!781)

(assert (=> b!35322 (= lt!12943 (lemmaContainsKeyImpliesGetValueByKeyDefined!33 (toList!462 (getCurrentListMap!283 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-datatypes ((Option!78 0))(
  ( (Some!77 (v!1933 V!1979)) (None!76) )
))
(declare-fun isDefined!34 (Option!78) Bool)

(declare-fun getValueByKey!72 (List!919 (_ BitVec 64)) Option!78)

(assert (=> b!35322 (isDefined!34 (getValueByKey!72 (toList!462 (getCurrentListMap!283 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-fun b!35323 () Bool)

(declare-fun Unit!783 () Unit!781)

(assert (=> b!35323 (= e!22305 Unit!783)))

(declare-fun b!35324 () Bool)

(assert (=> b!35324 (= e!22304 (isDefined!34 (getValueByKey!72 (toList!462 (getCurrentListMap!283 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304)))))

(assert (= (and d!5277 c!3996) b!35322))

(assert (= (and d!5277 (not c!3996)) b!35323))

(assert (= (and d!5277 (not res!21458)) b!35324))

(declare-fun m!28319 () Bool)

(assert (=> d!5277 m!28319))

(declare-fun m!28321 () Bool)

(assert (=> b!35322 m!28321))

(declare-fun m!28323 () Bool)

(assert (=> b!35322 m!28323))

(assert (=> b!35322 m!28323))

(declare-fun m!28325 () Bool)

(assert (=> b!35322 m!28325))

(assert (=> b!35324 m!28323))

(assert (=> b!35324 m!28323))

(assert (=> b!35324 m!28325))

(assert (=> b!35202 d!5277))

(declare-fun b!35367 () Bool)

(declare-fun e!22344 () ListLongMap!893)

(declare-fun call!2789 () ListLongMap!893)

(declare-fun +!57 (ListLongMap!893 tuple2!1322) ListLongMap!893)

(assert (=> b!35367 (= e!22344 (+!57 call!2789 (tuple2!1323 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))

(declare-fun b!35368 () Bool)

(declare-fun res!21484 () Bool)

(declare-fun e!22332 () Bool)

(assert (=> b!35368 (=> (not res!21484) (not e!22332))))

(declare-fun e!22337 () Bool)

(assert (=> b!35368 (= res!21484 e!22337)))

(declare-fun res!21485 () Bool)

(assert (=> b!35368 (=> res!21485 e!22337)))

(declare-fun e!22343 () Bool)

(assert (=> b!35368 (= res!21485 (not e!22343))))

(declare-fun res!21480 () Bool)

(assert (=> b!35368 (=> (not res!21480) (not e!22343))))

(assert (=> b!35368 (= res!21480 (bvslt #b00000000000000000000000000000000 (size!1262 _keys!1833)))))

(declare-fun b!35370 () Bool)

(declare-fun e!22338 () Bool)

(declare-fun e!22339 () Bool)

(assert (=> b!35370 (= e!22338 e!22339)))

(declare-fun res!21478 () Bool)

(declare-fun call!2786 () Bool)

(assert (=> b!35370 (= res!21478 call!2786)))

(assert (=> b!35370 (=> (not res!21478) (not e!22339))))

(declare-fun b!35371 () Bool)

(declare-fun e!22342 () ListLongMap!893)

(assert (=> b!35371 (= e!22344 e!22342)))

(declare-fun c!4014 () Bool)

(assert (=> b!35371 (= c!4014 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!35372 () Bool)

(assert (=> b!35372 (= e!22338 (not call!2786))))

(declare-fun b!35373 () Bool)

(declare-fun call!2790 () ListLongMap!893)

(assert (=> b!35373 (= e!22342 call!2790)))

(declare-fun bm!2782 () Bool)

(declare-fun call!2788 () Bool)

(declare-fun lt!12995 () ListLongMap!893)

(assert (=> bm!2782 (= call!2788 (contains!411 lt!12995 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!35374 () Bool)

(declare-fun e!22340 () Unit!781)

(declare-fun lt!13003 () Unit!781)

(assert (=> b!35374 (= e!22340 lt!13003)))

(declare-fun lt!12993 () ListLongMap!893)

(declare-fun getCurrentListMapNoExtraKeys!27 (array!2429 array!2427 (_ BitVec 32) (_ BitVec 32) V!1979 V!1979 (_ BitVec 32) Int) ListLongMap!893)

(assert (=> b!35374 (= lt!12993 (getCurrentListMapNoExtraKeys!27 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12999 () (_ BitVec 64))

(assert (=> b!35374 (= lt!12999 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12991 () (_ BitVec 64))

(assert (=> b!35374 (= lt!12991 (select (arr!1161 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!13004 () Unit!781)

(declare-fun addStillContains!25 (ListLongMap!893 (_ BitVec 64) V!1979 (_ BitVec 64)) Unit!781)

(assert (=> b!35374 (= lt!13004 (addStillContains!25 lt!12993 lt!12999 zeroValue!1443 lt!12991))))

(assert (=> b!35374 (contains!411 (+!57 lt!12993 (tuple2!1323 lt!12999 zeroValue!1443)) lt!12991)))

(declare-fun lt!12998 () Unit!781)

(assert (=> b!35374 (= lt!12998 lt!13004)))

(declare-fun lt!13000 () ListLongMap!893)

(assert (=> b!35374 (= lt!13000 (getCurrentListMapNoExtraKeys!27 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!13008 () (_ BitVec 64))

(assert (=> b!35374 (= lt!13008 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12997 () (_ BitVec 64))

(assert (=> b!35374 (= lt!12997 (select (arr!1161 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12992 () Unit!781)

(declare-fun addApplyDifferent!25 (ListLongMap!893 (_ BitVec 64) V!1979 (_ BitVec 64)) Unit!781)

(assert (=> b!35374 (= lt!12992 (addApplyDifferent!25 lt!13000 lt!13008 minValue!1443 lt!12997))))

(declare-fun apply!40 (ListLongMap!893 (_ BitVec 64)) V!1979)

(assert (=> b!35374 (= (apply!40 (+!57 lt!13000 (tuple2!1323 lt!13008 minValue!1443)) lt!12997) (apply!40 lt!13000 lt!12997))))

(declare-fun lt!12994 () Unit!781)

(assert (=> b!35374 (= lt!12994 lt!12992)))

(declare-fun lt!12989 () ListLongMap!893)

(assert (=> b!35374 (= lt!12989 (getCurrentListMapNoExtraKeys!27 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12988 () (_ BitVec 64))

(assert (=> b!35374 (= lt!12988 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12990 () (_ BitVec 64))

(assert (=> b!35374 (= lt!12990 (select (arr!1161 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!13005 () Unit!781)

(assert (=> b!35374 (= lt!13005 (addApplyDifferent!25 lt!12989 lt!12988 zeroValue!1443 lt!12990))))

(assert (=> b!35374 (= (apply!40 (+!57 lt!12989 (tuple2!1323 lt!12988 zeroValue!1443)) lt!12990) (apply!40 lt!12989 lt!12990))))

(declare-fun lt!12996 () Unit!781)

(assert (=> b!35374 (= lt!12996 lt!13005)))

(declare-fun lt!13002 () ListLongMap!893)

(assert (=> b!35374 (= lt!13002 (getCurrentListMapNoExtraKeys!27 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!13006 () (_ BitVec 64))

(assert (=> b!35374 (= lt!13006 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!13001 () (_ BitVec 64))

(assert (=> b!35374 (= lt!13001 (select (arr!1161 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> b!35374 (= lt!13003 (addApplyDifferent!25 lt!13002 lt!13006 minValue!1443 lt!13001))))

(assert (=> b!35374 (= (apply!40 (+!57 lt!13002 (tuple2!1323 lt!13006 minValue!1443)) lt!13001) (apply!40 lt!13002 lt!13001))))

(declare-fun b!35375 () Bool)

(declare-fun e!22336 () Bool)

(assert (=> b!35375 (= e!22337 e!22336)))

(declare-fun res!21479 () Bool)

(assert (=> b!35375 (=> (not res!21479) (not e!22336))))

(assert (=> b!35375 (= res!21479 (contains!411 lt!12995 (select (arr!1161 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!35375 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1262 _keys!1833)))))

(declare-fun bm!2783 () Bool)

(declare-fun call!2785 () ListLongMap!893)

(assert (=> bm!2783 (= call!2785 (getCurrentListMapNoExtraKeys!27 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!35376 () Bool)

(declare-fun Unit!784 () Unit!781)

(assert (=> b!35376 (= e!22340 Unit!784)))

(declare-fun bm!2784 () Bool)

(declare-fun c!4012 () Bool)

(declare-fun call!2787 () ListLongMap!893)

(declare-fun call!2791 () ListLongMap!893)

(assert (=> bm!2784 (= call!2789 (+!57 (ite c!4012 call!2785 (ite c!4014 call!2787 call!2791)) (ite (or c!4012 c!4014) (tuple2!1323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1323 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(declare-fun b!35369 () Bool)

(declare-fun e!22334 () ListLongMap!893)

(assert (=> b!35369 (= e!22334 call!2791)))

(declare-fun d!5279 () Bool)

(assert (=> d!5279 e!22332))

(declare-fun res!21477 () Bool)

(assert (=> d!5279 (=> (not res!21477) (not e!22332))))

(assert (=> d!5279 (= res!21477 (or (bvsge #b00000000000000000000000000000000 (size!1262 _keys!1833)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1262 _keys!1833)))))))

(declare-fun lt!13009 () ListLongMap!893)

(assert (=> d!5279 (= lt!12995 lt!13009)))

(declare-fun lt!13007 () Unit!781)

(assert (=> d!5279 (= lt!13007 e!22340)))

(declare-fun c!4009 () Bool)

(declare-fun e!22341 () Bool)

(assert (=> d!5279 (= c!4009 e!22341)))

(declare-fun res!21483 () Bool)

(assert (=> d!5279 (=> (not res!21483) (not e!22341))))

(assert (=> d!5279 (= res!21483 (bvslt #b00000000000000000000000000000000 (size!1262 _keys!1833)))))

(assert (=> d!5279 (= lt!13009 e!22344)))

(assert (=> d!5279 (= c!4012 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!5279 (validMask!0 mask!2294)))

(assert (=> d!5279 (= (getCurrentListMap!283 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) lt!12995)))

(declare-fun b!35377 () Bool)

(declare-fun e!22335 () Bool)

(declare-fun e!22333 () Bool)

(assert (=> b!35377 (= e!22335 e!22333)))

(declare-fun res!21482 () Bool)

(assert (=> b!35377 (= res!21482 call!2788)))

(assert (=> b!35377 (=> (not res!21482) (not e!22333))))

(declare-fun b!35378 () Bool)

(assert (=> b!35378 (= e!22341 (validKeyInArray!0 (select (arr!1161 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!35379 () Bool)

(assert (=> b!35379 (= e!22333 (= (apply!40 lt!12995 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1443))))

(declare-fun b!35380 () Bool)

(declare-fun c!4013 () Bool)

(assert (=> b!35380 (= c!4013 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!35380 (= e!22342 e!22334)))

(declare-fun bm!2785 () Bool)

(assert (=> bm!2785 (= call!2791 call!2787)))

(declare-fun b!35381 () Bool)

(declare-fun get!603 (ValueCell!608 V!1979) V!1979)

(declare-fun dynLambda!153 (Int (_ BitVec 64)) V!1979)

(assert (=> b!35381 (= e!22336 (= (apply!40 lt!12995 (select (arr!1161 _keys!1833) #b00000000000000000000000000000000)) (get!603 (select (arr!1160 _values!1501) #b00000000000000000000000000000000) (dynLambda!153 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!35381 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1261 _values!1501)))))

(assert (=> b!35381 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1262 _keys!1833)))))

(declare-fun b!35382 () Bool)

(declare-fun res!21481 () Bool)

(assert (=> b!35382 (=> (not res!21481) (not e!22332))))

(assert (=> b!35382 (= res!21481 e!22338)))

(declare-fun c!4011 () Bool)

(assert (=> b!35382 (= c!4011 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!35383 () Bool)

(assert (=> b!35383 (= e!22332 e!22335)))

(declare-fun c!4010 () Bool)

(assert (=> b!35383 (= c!4010 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!2786 () Bool)

(assert (=> bm!2786 (= call!2786 (contains!411 lt!12995 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!35384 () Bool)

(assert (=> b!35384 (= e!22335 (not call!2788))))

(declare-fun bm!2787 () Bool)

(assert (=> bm!2787 (= call!2790 call!2789)))

(declare-fun b!35385 () Bool)

(assert (=> b!35385 (= e!22343 (validKeyInArray!0 (select (arr!1161 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!35386 () Bool)

(assert (=> b!35386 (= e!22334 call!2790)))

(declare-fun bm!2788 () Bool)

(assert (=> bm!2788 (= call!2787 call!2785)))

(declare-fun b!35387 () Bool)

(assert (=> b!35387 (= e!22339 (= (apply!40 lt!12995 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1443))))

(assert (= (and d!5279 c!4012) b!35367))

(assert (= (and d!5279 (not c!4012)) b!35371))

(assert (= (and b!35371 c!4014) b!35373))

(assert (= (and b!35371 (not c!4014)) b!35380))

(assert (= (and b!35380 c!4013) b!35386))

(assert (= (and b!35380 (not c!4013)) b!35369))

(assert (= (or b!35386 b!35369) bm!2785))

(assert (= (or b!35373 bm!2785) bm!2788))

(assert (= (or b!35373 b!35386) bm!2787))

(assert (= (or b!35367 bm!2788) bm!2783))

(assert (= (or b!35367 bm!2787) bm!2784))

(assert (= (and d!5279 res!21483) b!35378))

(assert (= (and d!5279 c!4009) b!35374))

(assert (= (and d!5279 (not c!4009)) b!35376))

(assert (= (and d!5279 res!21477) b!35368))

(assert (= (and b!35368 res!21480) b!35385))

(assert (= (and b!35368 (not res!21485)) b!35375))

(assert (= (and b!35375 res!21479) b!35381))

(assert (= (and b!35368 res!21484) b!35382))

(assert (= (and b!35382 c!4011) b!35370))

(assert (= (and b!35382 (not c!4011)) b!35372))

(assert (= (and b!35370 res!21478) b!35387))

(assert (= (or b!35370 b!35372) bm!2786))

(assert (= (and b!35382 res!21481) b!35383))

(assert (= (and b!35383 c!4010) b!35377))

(assert (= (and b!35383 (not c!4010)) b!35384))

(assert (= (and b!35377 res!21482) b!35379))

(assert (= (or b!35377 b!35384) bm!2782))

(declare-fun b_lambda!1707 () Bool)

(assert (=> (not b_lambda!1707) (not b!35381)))

(declare-fun t!3624 () Bool)

(declare-fun tb!689 () Bool)

(assert (=> (and start!4516 (= defaultEntry!1504 defaultEntry!1504) t!3624) tb!689))

(declare-fun result!1189 () Bool)

(assert (=> tb!689 (= result!1189 tp_is_empty!1615)))

(assert (=> b!35381 t!3624))

(declare-fun b_and!2081 () Bool)

(assert (= b_and!2075 (and (=> t!3624 result!1189) b_and!2081)))

(assert (=> b!35378 m!28293))

(assert (=> b!35378 m!28293))

(assert (=> b!35378 m!28295))

(declare-fun m!28327 () Bool)

(assert (=> bm!2786 m!28327))

(assert (=> b!35375 m!28293))

(assert (=> b!35375 m!28293))

(declare-fun m!28329 () Bool)

(assert (=> b!35375 m!28329))

(assert (=> b!35385 m!28293))

(assert (=> b!35385 m!28293))

(assert (=> b!35385 m!28295))

(declare-fun m!28331 () Bool)

(assert (=> b!35387 m!28331))

(declare-fun m!28333 () Bool)

(assert (=> bm!2783 m!28333))

(declare-fun m!28335 () Bool)

(assert (=> b!35381 m!28335))

(declare-fun m!28337 () Bool)

(assert (=> b!35381 m!28337))

(assert (=> b!35381 m!28293))

(declare-fun m!28339 () Bool)

(assert (=> b!35381 m!28339))

(assert (=> b!35381 m!28335))

(assert (=> b!35381 m!28337))

(declare-fun m!28341 () Bool)

(assert (=> b!35381 m!28341))

(assert (=> b!35381 m!28293))

(assert (=> d!5279 m!28215))

(declare-fun m!28343 () Bool)

(assert (=> bm!2782 m!28343))

(declare-fun m!28345 () Bool)

(assert (=> b!35379 m!28345))

(declare-fun m!28347 () Bool)

(assert (=> b!35367 m!28347))

(declare-fun m!28349 () Bool)

(assert (=> b!35374 m!28349))

(declare-fun m!28351 () Bool)

(assert (=> b!35374 m!28351))

(assert (=> b!35374 m!28333))

(declare-fun m!28353 () Bool)

(assert (=> b!35374 m!28353))

(declare-fun m!28355 () Bool)

(assert (=> b!35374 m!28355))

(declare-fun m!28357 () Bool)

(assert (=> b!35374 m!28357))

(assert (=> b!35374 m!28353))

(declare-fun m!28359 () Bool)

(assert (=> b!35374 m!28359))

(declare-fun m!28361 () Bool)

(assert (=> b!35374 m!28361))

(declare-fun m!28363 () Bool)

(assert (=> b!35374 m!28363))

(assert (=> b!35374 m!28349))

(declare-fun m!28365 () Bool)

(assert (=> b!35374 m!28365))

(declare-fun m!28367 () Bool)

(assert (=> b!35374 m!28367))

(declare-fun m!28369 () Bool)

(assert (=> b!35374 m!28369))

(declare-fun m!28371 () Bool)

(assert (=> b!35374 m!28371))

(declare-fun m!28373 () Bool)

(assert (=> b!35374 m!28373))

(declare-fun m!28375 () Bool)

(assert (=> b!35374 m!28375))

(assert (=> b!35374 m!28351))

(declare-fun m!28377 () Bool)

(assert (=> b!35374 m!28377))

(assert (=> b!35374 m!28293))

(assert (=> b!35374 m!28371))

(declare-fun m!28379 () Bool)

(assert (=> bm!2784 m!28379))

(assert (=> b!35202 d!5279))

(declare-fun d!5281 () Bool)

(declare-fun res!21490 () Bool)

(declare-fun e!22349 () Bool)

(assert (=> d!5281 (=> res!21490 e!22349)))

(assert (=> d!5281 (= res!21490 (= (select (arr!1161 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5281 (= (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) e!22349)))

(declare-fun b!35394 () Bool)

(declare-fun e!22350 () Bool)

(assert (=> b!35394 (= e!22349 e!22350)))

(declare-fun res!21491 () Bool)

(assert (=> b!35394 (=> (not res!21491) (not e!22350))))

(assert (=> b!35394 (= res!21491 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1262 _keys!1833)))))

(declare-fun b!35395 () Bool)

(assert (=> b!35395 (= e!22350 (arrayContainsKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5281 (not res!21490)) b!35394))

(assert (= (and b!35394 res!21491) b!35395))

(assert (=> d!5281 m!28293))

(declare-fun m!28381 () Bool)

(assert (=> b!35395 m!28381))

(assert (=> b!35197 d!5281))

(declare-fun mapIsEmpty!1981 () Bool)

(declare-fun mapRes!1981 () Bool)

(assert (=> mapIsEmpty!1981 mapRes!1981))

(declare-fun b!35403 () Bool)

(declare-fun e!22356 () Bool)

(assert (=> b!35403 (= e!22356 tp_is_empty!1615)))

(declare-fun mapNonEmpty!1981 () Bool)

(declare-fun tp!5239 () Bool)

(declare-fun e!22355 () Bool)

(assert (=> mapNonEmpty!1981 (= mapRes!1981 (and tp!5239 e!22355))))

(declare-fun mapKey!1981 () (_ BitVec 32))

(declare-fun mapValue!1981 () ValueCell!608)

(declare-fun mapRest!1981 () (Array (_ BitVec 32) ValueCell!608))

(assert (=> mapNonEmpty!1981 (= mapRest!1972 (store mapRest!1981 mapKey!1981 mapValue!1981))))

(declare-fun condMapEmpty!1981 () Bool)

(declare-fun mapDefault!1981 () ValueCell!608)

(assert (=> mapNonEmpty!1972 (= condMapEmpty!1981 (= mapRest!1972 ((as const (Array (_ BitVec 32) ValueCell!608)) mapDefault!1981)))))

(assert (=> mapNonEmpty!1972 (= tp!5223 (and e!22356 mapRes!1981))))

(declare-fun b!35402 () Bool)

(assert (=> b!35402 (= e!22355 tp_is_empty!1615)))

(assert (= (and mapNonEmpty!1972 condMapEmpty!1981) mapIsEmpty!1981))

(assert (= (and mapNonEmpty!1972 (not condMapEmpty!1981)) mapNonEmpty!1981))

(assert (= (and mapNonEmpty!1981 ((_ is ValueCellFull!608) mapValue!1981)) b!35402))

(assert (= (and mapNonEmpty!1972 ((_ is ValueCellFull!608) mapDefault!1981)) b!35403))

(declare-fun m!28383 () Bool)

(assert (=> mapNonEmpty!1981 m!28383))

(declare-fun b_lambda!1709 () Bool)

(assert (= b_lambda!1707 (or (and start!4516 b_free!1261) b_lambda!1709)))

(check-sat (not b!35280) (not bm!2764) (not b!35295) (not bm!2767) (not bm!2784) (not b!35381) tp_is_empty!1615 (not b!35379) (not b!35395) (not bm!2782) (not b!35375) (not b!35385) (not b!35374) (not b!35322) (not bm!2786) (not b_lambda!1709) (not bm!2783) b_and!2081 (not b_next!1261) (not b!35367) (not b!35387) (not b!35324) (not mapNonEmpty!1981) (not d!5275) (not b!35378) (not d!5279) (not b!35311) (not b!35281) (not b!35297) (not d!5277) (not b!35294))
(check-sat b_and!2081 (not b_next!1261))

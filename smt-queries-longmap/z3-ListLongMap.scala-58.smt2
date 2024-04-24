; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!860 () Bool)

(assert start!860)

(declare-fun b_free!253 () Bool)

(declare-fun b_next!253 () Bool)

(assert (=> start!860 (= b_free!253 (not b_next!253))))

(declare-fun tp!988 () Bool)

(declare-fun b_and!399 () Bool)

(assert (=> start!860 (= tp!988 b_and!399)))

(declare-fun b!7117 () Bool)

(declare-fun res!7248 () Bool)

(declare-fun e!3941 () Bool)

(assert (=> b!7117 (=> (not res!7248) (not e!3941))))

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!7117 (= res!7248 (validKeyInArray!0 k0!1278))))

(declare-fun b!7118 () Bool)

(declare-fun res!7249 () Bool)

(assert (=> b!7118 (=> (not res!7249) (not e!3941))))

(declare-datatypes ((array!585 0))(
  ( (array!586 (arr!281 (Array (_ BitVec 32) (_ BitVec 64))) (size!343 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!585)

(declare-datatypes ((List!190 0))(
  ( (Nil!187) (Cons!186 (h!752 (_ BitVec 64)) (t!2325 List!190)) )
))
(declare-fun arrayNoDuplicates!0 (array!585 (_ BitVec 32) List!190) Bool)

(assert (=> b!7118 (= res!7249 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!187))))

(declare-fun b!7119 () Bool)

(declare-fun res!7246 () Bool)

(assert (=> b!7119 (=> (not res!7246) (not e!3941))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!585 (_ BitVec 32)) Bool)

(assert (=> b!7119 (= res!7246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!7120 () Bool)

(declare-fun e!3939 () Bool)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!7120 (= e!3939 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!467 () Bool)

(declare-fun mapRes!467 () Bool)

(declare-fun tp!989 () Bool)

(declare-fun e!3937 () Bool)

(assert (=> mapNonEmpty!467 (= mapRes!467 (and tp!989 e!3937))))

(declare-datatypes ((V!619 0))(
  ( (V!620 (val!171 Int)) )
))
(declare-datatypes ((ValueCell!149 0))(
  ( (ValueCellFull!149 (v!1262 V!619)) (EmptyCell!149) )
))
(declare-fun mapRest!467 () (Array (_ BitVec 32) ValueCell!149))

(declare-datatypes ((array!587 0))(
  ( (array!588 (arr!282 (Array (_ BitVec 32) ValueCell!149)) (size!344 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!587)

(declare-fun mapKey!467 () (_ BitVec 32))

(declare-fun mapValue!467 () ValueCell!149)

(assert (=> mapNonEmpty!467 (= (arr!282 _values!1492) (store mapRest!467 mapKey!467 mapValue!467))))

(declare-fun b!7121 () Bool)

(declare-fun arrayContainsKey!0 (array!585 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!7121 (= e!3939 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!7122 () Bool)

(assert (=> b!7122 (= e!3941 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(assert (=> b!7122 e!3939))

(declare-fun c!512 () Bool)

(assert (=> b!7122 (= c!512 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!619)

(declare-fun zeroValue!1434 () V!619)

(declare-datatypes ((Unit!135 0))(
  ( (Unit!136) )
))
(declare-fun lt!1428 () Unit!135)

(declare-fun lemmaKeyInListMapIsInArray!50 (array!585 array!587 (_ BitVec 32) (_ BitVec 32) V!619 V!619 (_ BitVec 64) Int) Unit!135)

(assert (=> b!7122 (= lt!1428 (lemmaKeyInListMapIsInArray!50 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun res!7247 () Bool)

(assert (=> start!860 (=> (not res!7247) (not e!3941))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!860 (= res!7247 (validMask!0 mask!2250))))

(assert (=> start!860 e!3941))

(assert (=> start!860 tp!988))

(assert (=> start!860 true))

(declare-fun e!3938 () Bool)

(declare-fun array_inv!203 (array!587) Bool)

(assert (=> start!860 (and (array_inv!203 _values!1492) e!3938)))

(declare-fun tp_is_empty!331 () Bool)

(assert (=> start!860 tp_is_empty!331))

(declare-fun array_inv!204 (array!585) Bool)

(assert (=> start!860 (array_inv!204 _keys!1806)))

(declare-fun b!7123 () Bool)

(declare-fun res!7245 () Bool)

(assert (=> b!7123 (=> (not res!7245) (not e!3941))))

(assert (=> b!7123 (= res!7245 (and (= (size!344 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!343 _keys!1806) (size!344 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!7124 () Bool)

(declare-fun e!3936 () Bool)

(assert (=> b!7124 (= e!3938 (and e!3936 mapRes!467))))

(declare-fun condMapEmpty!467 () Bool)

(declare-fun mapDefault!467 () ValueCell!149)

(assert (=> b!7124 (= condMapEmpty!467 (= (arr!282 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!149)) mapDefault!467)))))

(declare-fun b!7125 () Bool)

(assert (=> b!7125 (= e!3936 tp_is_empty!331)))

(declare-fun mapIsEmpty!467 () Bool)

(assert (=> mapIsEmpty!467 mapRes!467))

(declare-fun b!7126 () Bool)

(declare-fun res!7244 () Bool)

(assert (=> b!7126 (=> (not res!7244) (not e!3941))))

(declare-datatypes ((tuple2!180 0))(
  ( (tuple2!181 (_1!90 (_ BitVec 64)) (_2!90 V!619)) )
))
(declare-datatypes ((List!191 0))(
  ( (Nil!188) (Cons!187 (h!753 tuple2!180) (t!2326 List!191)) )
))
(declare-datatypes ((ListLongMap!185 0))(
  ( (ListLongMap!186 (toList!108 List!191)) )
))
(declare-fun contains!82 (ListLongMap!185 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!67 (array!585 array!587 (_ BitVec 32) (_ BitVec 32) V!619 V!619 (_ BitVec 32) Int) ListLongMap!185)

(assert (=> b!7126 (= res!7244 (contains!82 (getCurrentListMap!67 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!7127 () Bool)

(assert (=> b!7127 (= e!3937 tp_is_empty!331)))

(assert (= (and start!860 res!7247) b!7123))

(assert (= (and b!7123 res!7245) b!7119))

(assert (= (and b!7119 res!7246) b!7118))

(assert (= (and b!7118 res!7249) b!7126))

(assert (= (and b!7126 res!7244) b!7117))

(assert (= (and b!7117 res!7248) b!7122))

(assert (= (and b!7122 c!512) b!7121))

(assert (= (and b!7122 (not c!512)) b!7120))

(assert (= (and b!7124 condMapEmpty!467) mapIsEmpty!467))

(assert (= (and b!7124 (not condMapEmpty!467)) mapNonEmpty!467))

(get-info :version)

(assert (= (and mapNonEmpty!467 ((_ is ValueCellFull!149) mapValue!467)) b!7127))

(assert (= (and b!7124 ((_ is ValueCellFull!149) mapDefault!467)) b!7125))

(assert (= start!860 b!7124))

(declare-fun m!4253 () Bool)

(assert (=> b!7121 m!4253))

(declare-fun m!4255 () Bool)

(assert (=> b!7119 m!4255))

(declare-fun m!4257 () Bool)

(assert (=> b!7117 m!4257))

(declare-fun m!4259 () Bool)

(assert (=> start!860 m!4259))

(declare-fun m!4261 () Bool)

(assert (=> start!860 m!4261))

(declare-fun m!4263 () Bool)

(assert (=> start!860 m!4263))

(assert (=> b!7122 m!4253))

(declare-fun m!4265 () Bool)

(assert (=> b!7122 m!4265))

(declare-fun m!4267 () Bool)

(assert (=> mapNonEmpty!467 m!4267))

(declare-fun m!4269 () Bool)

(assert (=> b!7118 m!4269))

(declare-fun m!4271 () Bool)

(assert (=> b!7126 m!4271))

(assert (=> b!7126 m!4271))

(declare-fun m!4273 () Bool)

(assert (=> b!7126 m!4273))

(check-sat (not b!7117) (not start!860) (not b!7118) (not b!7121) (not b!7119) tp_is_empty!331 (not b!7122) (not mapNonEmpty!467) (not b!7126) b_and!399 (not b_next!253))
(check-sat b_and!399 (not b_next!253))
(get-model)

(declare-fun d!791 () Bool)

(declare-fun res!7290 () Bool)

(declare-fun e!3985 () Bool)

(assert (=> d!791 (=> res!7290 e!3985)))

(assert (=> d!791 (= res!7290 (bvsge #b00000000000000000000000000000000 (size!343 _keys!1806)))))

(assert (=> d!791 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250) e!3985)))

(declare-fun b!7202 () Bool)

(declare-fun e!3984 () Bool)

(assert (=> b!7202 (= e!3985 e!3984)))

(declare-fun c!521 () Bool)

(assert (=> b!7202 (= c!521 (validKeyInArray!0 (select (arr!281 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun bm!155 () Bool)

(declare-fun call!158 () Bool)

(assert (=> bm!155 (= call!158 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1806 mask!2250))))

(declare-fun b!7203 () Bool)

(assert (=> b!7203 (= e!3984 call!158)))

(declare-fun b!7204 () Bool)

(declare-fun e!3986 () Bool)

(assert (=> b!7204 (= e!3984 e!3986)))

(declare-fun lt!1441 () (_ BitVec 64))

(assert (=> b!7204 (= lt!1441 (select (arr!281 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!1442 () Unit!135)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!585 (_ BitVec 64) (_ BitVec 32)) Unit!135)

(assert (=> b!7204 (= lt!1442 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1806 lt!1441 #b00000000000000000000000000000000))))

(assert (=> b!7204 (arrayContainsKey!0 _keys!1806 lt!1441 #b00000000000000000000000000000000)))

(declare-fun lt!1443 () Unit!135)

(assert (=> b!7204 (= lt!1443 lt!1442)))

(declare-fun res!7291 () Bool)

(declare-datatypes ((SeekEntryResult!32 0))(
  ( (MissingZero!32 (index!2247 (_ BitVec 32))) (Found!32 (index!2248 (_ BitVec 32))) (Intermediate!32 (undefined!844 Bool) (index!2249 (_ BitVec 32)) (x!2596 (_ BitVec 32))) (Undefined!32) (MissingVacant!32 (index!2250 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!585 (_ BitVec 32)) SeekEntryResult!32)

(assert (=> b!7204 (= res!7291 (= (seekEntryOrOpen!0 (select (arr!281 _keys!1806) #b00000000000000000000000000000000) _keys!1806 mask!2250) (Found!32 #b00000000000000000000000000000000)))))

(assert (=> b!7204 (=> (not res!7291) (not e!3986))))

(declare-fun b!7205 () Bool)

(assert (=> b!7205 (= e!3986 call!158)))

(assert (= (and d!791 (not res!7290)) b!7202))

(assert (= (and b!7202 c!521) b!7204))

(assert (= (and b!7202 (not c!521)) b!7203))

(assert (= (and b!7204 res!7291) b!7205))

(assert (= (or b!7205 b!7203) bm!155))

(declare-fun m!4319 () Bool)

(assert (=> b!7202 m!4319))

(assert (=> b!7202 m!4319))

(declare-fun m!4321 () Bool)

(assert (=> b!7202 m!4321))

(declare-fun m!4323 () Bool)

(assert (=> bm!155 m!4323))

(assert (=> b!7204 m!4319))

(declare-fun m!4325 () Bool)

(assert (=> b!7204 m!4325))

(declare-fun m!4327 () Bool)

(assert (=> b!7204 m!4327))

(assert (=> b!7204 m!4319))

(declare-fun m!4329 () Bool)

(assert (=> b!7204 m!4329))

(assert (=> b!7119 d!791))

(declare-fun d!793 () Bool)

(assert (=> d!793 (= (validKeyInArray!0 k0!1278) (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!7117 d!793))

(declare-fun d!795 () Bool)

(declare-fun e!3992 () Bool)

(assert (=> d!795 e!3992))

(declare-fun res!7294 () Bool)

(assert (=> d!795 (=> res!7294 e!3992)))

(declare-fun lt!1455 () Bool)

(assert (=> d!795 (= res!7294 (not lt!1455))))

(declare-fun lt!1452 () Bool)

(assert (=> d!795 (= lt!1455 lt!1452)))

(declare-fun lt!1453 () Unit!135)

(declare-fun e!3991 () Unit!135)

(assert (=> d!795 (= lt!1453 e!3991)))

(declare-fun c!524 () Bool)

(assert (=> d!795 (= c!524 lt!1452)))

(declare-fun containsKey!5 (List!191 (_ BitVec 64)) Bool)

(assert (=> d!795 (= lt!1452 (containsKey!5 (toList!108 (getCurrentListMap!67 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(assert (=> d!795 (= (contains!82 (getCurrentListMap!67 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278) lt!1455)))

(declare-fun b!7212 () Bool)

(declare-fun lt!1454 () Unit!135)

(assert (=> b!7212 (= e!3991 lt!1454)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!5 (List!191 (_ BitVec 64)) Unit!135)

(assert (=> b!7212 (= lt!1454 (lemmaContainsKeyImpliesGetValueByKeyDefined!5 (toList!108 (getCurrentListMap!67 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(declare-datatypes ((Option!17 0))(
  ( (Some!16 (v!1265 V!619)) (None!15) )
))
(declare-fun isDefined!6 (Option!17) Bool)

(declare-fun getValueByKey!11 (List!191 (_ BitVec 64)) Option!17)

(assert (=> b!7212 (isDefined!6 (getValueByKey!11 (toList!108 (getCurrentListMap!67 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(declare-fun b!7213 () Bool)

(declare-fun Unit!141 () Unit!135)

(assert (=> b!7213 (= e!3991 Unit!141)))

(declare-fun b!7214 () Bool)

(assert (=> b!7214 (= e!3992 (isDefined!6 (getValueByKey!11 (toList!108 (getCurrentListMap!67 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278)))))

(assert (= (and d!795 c!524) b!7212))

(assert (= (and d!795 (not c!524)) b!7213))

(assert (= (and d!795 (not res!7294)) b!7214))

(declare-fun m!4331 () Bool)

(assert (=> d!795 m!4331))

(declare-fun m!4333 () Bool)

(assert (=> b!7212 m!4333))

(declare-fun m!4335 () Bool)

(assert (=> b!7212 m!4335))

(assert (=> b!7212 m!4335))

(declare-fun m!4337 () Bool)

(assert (=> b!7212 m!4337))

(assert (=> b!7214 m!4335))

(assert (=> b!7214 m!4335))

(assert (=> b!7214 m!4337))

(assert (=> b!7126 d!795))

(declare-fun bm!170 () Bool)

(declare-fun call!175 () Bool)

(declare-fun lt!1501 () ListLongMap!185)

(assert (=> bm!170 (= call!175 (contains!82 lt!1501 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!7257 () Bool)

(declare-fun e!4019 () Bool)

(declare-fun e!4025 () Bool)

(assert (=> b!7257 (= e!4019 e!4025)))

(declare-fun res!7313 () Bool)

(assert (=> b!7257 (=> (not res!7313) (not e!4025))))

(assert (=> b!7257 (= res!7313 (contains!82 lt!1501 (select (arr!281 _keys!1806) #b00000000000000000000000000000000)))))

(assert (=> b!7257 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!343 _keys!1806)))))

(declare-fun bm!171 () Bool)

(declare-fun call!177 () ListLongMap!185)

(declare-fun getCurrentListMapNoExtraKeys!5 (array!585 array!587 (_ BitVec 32) (_ BitVec 32) V!619 V!619 (_ BitVec 32) Int) ListLongMap!185)

(assert (=> bm!171 (= call!177 (getCurrentListMapNoExtraKeys!5 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun b!7258 () Bool)

(declare-fun res!7315 () Bool)

(declare-fun e!4024 () Bool)

(assert (=> b!7258 (=> (not res!7315) (not e!4024))))

(assert (=> b!7258 (= res!7315 e!4019)))

(declare-fun res!7314 () Bool)

(assert (=> b!7258 (=> res!7314 e!4019)))

(declare-fun e!4022 () Bool)

(assert (=> b!7258 (= res!7314 (not e!4022))))

(declare-fun res!7320 () Bool)

(assert (=> b!7258 (=> (not res!7320) (not e!4022))))

(assert (=> b!7258 (= res!7320 (bvslt #b00000000000000000000000000000000 (size!343 _keys!1806)))))

(declare-fun b!7259 () Bool)

(declare-fun e!4031 () Bool)

(assert (=> b!7259 (= e!4024 e!4031)))

(declare-fun c!537 () Bool)

(assert (=> b!7259 (= c!537 (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!172 () Bool)

(declare-fun call!173 () ListLongMap!185)

(declare-fun call!176 () ListLongMap!185)

(assert (=> bm!172 (= call!173 call!176)))

(declare-fun b!7260 () Bool)

(declare-fun e!4029 () ListLongMap!185)

(declare-fun call!179 () ListLongMap!185)

(declare-fun +!8 (ListLongMap!185 tuple2!180) ListLongMap!185)

(assert (=> b!7260 (= e!4029 (+!8 call!179 (tuple2!181 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1434)))))

(declare-fun b!7261 () Bool)

(declare-fun e!4028 () Unit!135)

(declare-fun lt!1503 () Unit!135)

(assert (=> b!7261 (= e!4028 lt!1503)))

(declare-fun lt!1510 () ListLongMap!185)

(assert (=> b!7261 (= lt!1510 (getCurrentListMapNoExtraKeys!5 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!1504 () (_ BitVec 64))

(assert (=> b!7261 (= lt!1504 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!1502 () (_ BitVec 64))

(assert (=> b!7261 (= lt!1502 (select (arr!281 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!1515 () Unit!135)

(declare-fun addStillContains!6 (ListLongMap!185 (_ BitVec 64) V!619 (_ BitVec 64)) Unit!135)

(assert (=> b!7261 (= lt!1515 (addStillContains!6 lt!1510 lt!1504 zeroValue!1434 lt!1502))))

(assert (=> b!7261 (contains!82 (+!8 lt!1510 (tuple2!181 lt!1504 zeroValue!1434)) lt!1502)))

(declare-fun lt!1505 () Unit!135)

(assert (=> b!7261 (= lt!1505 lt!1515)))

(declare-fun lt!1500 () ListLongMap!185)

(assert (=> b!7261 (= lt!1500 (getCurrentListMapNoExtraKeys!5 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!1509 () (_ BitVec 64))

(assert (=> b!7261 (= lt!1509 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!1513 () (_ BitVec 64))

(assert (=> b!7261 (= lt!1513 (select (arr!281 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!1518 () Unit!135)

(declare-fun addApplyDifferent!6 (ListLongMap!185 (_ BitVec 64) V!619 (_ BitVec 64)) Unit!135)

(assert (=> b!7261 (= lt!1518 (addApplyDifferent!6 lt!1500 lt!1509 minValue!1434 lt!1513))))

(declare-fun apply!21 (ListLongMap!185 (_ BitVec 64)) V!619)

(assert (=> b!7261 (= (apply!21 (+!8 lt!1500 (tuple2!181 lt!1509 minValue!1434)) lt!1513) (apply!21 lt!1500 lt!1513))))

(declare-fun lt!1520 () Unit!135)

(assert (=> b!7261 (= lt!1520 lt!1518)))

(declare-fun lt!1516 () ListLongMap!185)

(assert (=> b!7261 (= lt!1516 (getCurrentListMapNoExtraKeys!5 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!1512 () (_ BitVec 64))

(assert (=> b!7261 (= lt!1512 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!1517 () (_ BitVec 64))

(assert (=> b!7261 (= lt!1517 (select (arr!281 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!1511 () Unit!135)

(assert (=> b!7261 (= lt!1511 (addApplyDifferent!6 lt!1516 lt!1512 zeroValue!1434 lt!1517))))

(assert (=> b!7261 (= (apply!21 (+!8 lt!1516 (tuple2!181 lt!1512 zeroValue!1434)) lt!1517) (apply!21 lt!1516 lt!1517))))

(declare-fun lt!1514 () Unit!135)

(assert (=> b!7261 (= lt!1514 lt!1511)))

(declare-fun lt!1521 () ListLongMap!185)

(assert (=> b!7261 (= lt!1521 (getCurrentListMapNoExtraKeys!5 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!1519 () (_ BitVec 64))

(assert (=> b!7261 (= lt!1519 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!1506 () (_ BitVec 64))

(assert (=> b!7261 (= lt!1506 (select (arr!281 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> b!7261 (= lt!1503 (addApplyDifferent!6 lt!1521 lt!1519 minValue!1434 lt!1506))))

(assert (=> b!7261 (= (apply!21 (+!8 lt!1521 (tuple2!181 lt!1519 minValue!1434)) lt!1506) (apply!21 lt!1521 lt!1506))))

(declare-fun b!7262 () Bool)

(declare-fun e!4020 () Bool)

(assert (=> b!7262 (= e!4031 e!4020)))

(declare-fun res!7319 () Bool)

(declare-fun call!178 () Bool)

(assert (=> b!7262 (= res!7319 call!178)))

(assert (=> b!7262 (=> (not res!7319) (not e!4020))))

(declare-fun b!7263 () Bool)

(declare-fun e!4021 () Bool)

(assert (=> b!7263 (= e!4021 (validKeyInArray!0 (select (arr!281 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!7264 () Bool)

(declare-fun e!4027 () ListLongMap!185)

(declare-fun call!174 () ListLongMap!185)

(assert (=> b!7264 (= e!4027 call!174)))

(declare-fun b!7265 () Bool)

(declare-fun e!4030 () ListLongMap!185)

(assert (=> b!7265 (= e!4030 call!173)))

(declare-fun d!797 () Bool)

(assert (=> d!797 e!4024))

(declare-fun res!7316 () Bool)

(assert (=> d!797 (=> (not res!7316) (not e!4024))))

(assert (=> d!797 (= res!7316 (or (bvsge #b00000000000000000000000000000000 (size!343 _keys!1806)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!343 _keys!1806)))))))

(declare-fun lt!1507 () ListLongMap!185)

(assert (=> d!797 (= lt!1501 lt!1507)))

(declare-fun lt!1508 () Unit!135)

(assert (=> d!797 (= lt!1508 e!4028)))

(declare-fun c!541 () Bool)

(assert (=> d!797 (= c!541 e!4021)))

(declare-fun res!7317 () Bool)

(assert (=> d!797 (=> (not res!7317) (not e!4021))))

(assert (=> d!797 (= res!7317 (bvslt #b00000000000000000000000000000000 (size!343 _keys!1806)))))

(assert (=> d!797 (= lt!1507 e!4029)))

(declare-fun c!540 () Bool)

(assert (=> d!797 (= c!540 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!797 (validMask!0 mask!2250)))

(assert (=> d!797 (= (getCurrentListMap!67 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) lt!1501)))

(declare-fun b!7266 () Bool)

(declare-fun Unit!142 () Unit!135)

(assert (=> b!7266 (= e!4028 Unit!142)))

(declare-fun b!7267 () Bool)

(declare-fun res!7321 () Bool)

(assert (=> b!7267 (=> (not res!7321) (not e!4024))))

(declare-fun e!4023 () Bool)

(assert (=> b!7267 (= res!7321 e!4023)))

(declare-fun c!542 () Bool)

(assert (=> b!7267 (= c!542 (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!7268 () Bool)

(assert (=> b!7268 (= e!4029 e!4027)))

(declare-fun c!538 () Bool)

(assert (=> b!7268 (= c!538 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!173 () Bool)

(assert (=> bm!173 (= call!178 (contains!82 lt!1501 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!7269 () Bool)

(assert (=> b!7269 (= e!4031 (not call!178))))

(declare-fun bm!174 () Bool)

(assert (=> bm!174 (= call!179 (+!8 (ite c!540 call!177 (ite c!538 call!176 call!173)) (ite (or c!540 c!538) (tuple2!181 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1434) (tuple2!181 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1434))))))

(declare-fun b!7270 () Bool)

(declare-fun c!539 () Bool)

(assert (=> b!7270 (= c!539 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!7270 (= e!4027 e!4030)))

(declare-fun bm!175 () Bool)

(assert (=> bm!175 (= call!174 call!179)))

(declare-fun b!7271 () Bool)

(assert (=> b!7271 (= e!4023 (not call!175))))

(declare-fun b!7272 () Bool)

(declare-fun get!133 (ValueCell!149 V!619) V!619)

(declare-fun dynLambda!43 (Int (_ BitVec 64)) V!619)

(assert (=> b!7272 (= e!4025 (= (apply!21 lt!1501 (select (arr!281 _keys!1806) #b00000000000000000000000000000000)) (get!133 (select (arr!282 _values!1492) #b00000000000000000000000000000000) (dynLambda!43 defaultEntry!1495 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!7272 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!344 _values!1492)))))

(assert (=> b!7272 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!343 _keys!1806)))))

(declare-fun b!7273 () Bool)

(declare-fun e!4026 () Bool)

(assert (=> b!7273 (= e!4026 (= (apply!21 lt!1501 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1434))))

(declare-fun b!7274 () Bool)

(assert (=> b!7274 (= e!4023 e!4026)))

(declare-fun res!7318 () Bool)

(assert (=> b!7274 (= res!7318 call!175)))

(assert (=> b!7274 (=> (not res!7318) (not e!4026))))

(declare-fun b!7275 () Bool)

(assert (=> b!7275 (= e!4020 (= (apply!21 lt!1501 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1434))))

(declare-fun b!7276 () Bool)

(assert (=> b!7276 (= e!4022 (validKeyInArray!0 (select (arr!281 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun bm!176 () Bool)

(assert (=> bm!176 (= call!176 call!177)))

(declare-fun b!7277 () Bool)

(assert (=> b!7277 (= e!4030 call!174)))

(assert (= (and d!797 c!540) b!7260))

(assert (= (and d!797 (not c!540)) b!7268))

(assert (= (and b!7268 c!538) b!7264))

(assert (= (and b!7268 (not c!538)) b!7270))

(assert (= (and b!7270 c!539) b!7277))

(assert (= (and b!7270 (not c!539)) b!7265))

(assert (= (or b!7277 b!7265) bm!172))

(assert (= (or b!7264 bm!172) bm!176))

(assert (= (or b!7264 b!7277) bm!175))

(assert (= (or b!7260 bm!176) bm!171))

(assert (= (or b!7260 bm!175) bm!174))

(assert (= (and d!797 res!7317) b!7263))

(assert (= (and d!797 c!541) b!7261))

(assert (= (and d!797 (not c!541)) b!7266))

(assert (= (and d!797 res!7316) b!7258))

(assert (= (and b!7258 res!7320) b!7276))

(assert (= (and b!7258 (not res!7314)) b!7257))

(assert (= (and b!7257 res!7313) b!7272))

(assert (= (and b!7258 res!7315) b!7267))

(assert (= (and b!7267 c!542) b!7274))

(assert (= (and b!7267 (not c!542)) b!7271))

(assert (= (and b!7274 res!7318) b!7273))

(assert (= (or b!7274 b!7271) bm!170))

(assert (= (and b!7267 res!7321) b!7259))

(assert (= (and b!7259 c!537) b!7262))

(assert (= (and b!7259 (not c!537)) b!7269))

(assert (= (and b!7262 res!7319) b!7275))

(assert (= (or b!7262 b!7269) bm!173))

(declare-fun b_lambda!335 () Bool)

(assert (=> (not b_lambda!335) (not b!7272)))

(declare-fun t!2329 () Bool)

(declare-fun tb!135 () Bool)

(assert (=> (and start!860 (= defaultEntry!1495 defaultEntry!1495) t!2329) tb!135))

(declare-fun result!207 () Bool)

(assert (=> tb!135 (= result!207 tp_is_empty!331)))

(assert (=> b!7272 t!2329))

(declare-fun b_and!405 () Bool)

(assert (= b_and!399 (and (=> t!2329 result!207) b_and!405)))

(assert (=> b!7257 m!4319))

(assert (=> b!7257 m!4319))

(declare-fun m!4339 () Bool)

(assert (=> b!7257 m!4339))

(declare-fun m!4341 () Bool)

(assert (=> b!7260 m!4341))

(declare-fun m!4343 () Bool)

(assert (=> b!7272 m!4343))

(declare-fun m!4345 () Bool)

(assert (=> b!7272 m!4345))

(assert (=> b!7272 m!4343))

(declare-fun m!4347 () Bool)

(assert (=> b!7272 m!4347))

(assert (=> b!7272 m!4319))

(declare-fun m!4349 () Bool)

(assert (=> b!7272 m!4349))

(assert (=> b!7272 m!4319))

(assert (=> b!7272 m!4345))

(declare-fun m!4351 () Bool)

(assert (=> bm!171 m!4351))

(declare-fun m!4353 () Bool)

(assert (=> b!7275 m!4353))

(assert (=> b!7263 m!4319))

(assert (=> b!7263 m!4319))

(assert (=> b!7263 m!4321))

(declare-fun m!4355 () Bool)

(assert (=> b!7273 m!4355))

(declare-fun m!4357 () Bool)

(assert (=> b!7261 m!4357))

(declare-fun m!4359 () Bool)

(assert (=> b!7261 m!4359))

(assert (=> b!7261 m!4351))

(declare-fun m!4361 () Bool)

(assert (=> b!7261 m!4361))

(declare-fun m!4363 () Bool)

(assert (=> b!7261 m!4363))

(declare-fun m!4365 () Bool)

(assert (=> b!7261 m!4365))

(declare-fun m!4367 () Bool)

(assert (=> b!7261 m!4367))

(declare-fun m!4369 () Bool)

(assert (=> b!7261 m!4369))

(declare-fun m!4371 () Bool)

(assert (=> b!7261 m!4371))

(declare-fun m!4373 () Bool)

(assert (=> b!7261 m!4373))

(declare-fun m!4375 () Bool)

(assert (=> b!7261 m!4375))

(assert (=> b!7261 m!4371))

(declare-fun m!4377 () Bool)

(assert (=> b!7261 m!4377))

(declare-fun m!4379 () Bool)

(assert (=> b!7261 m!4379))

(declare-fun m!4381 () Bool)

(assert (=> b!7261 m!4381))

(assert (=> b!7261 m!4381))

(declare-fun m!4383 () Bool)

(assert (=> b!7261 m!4383))

(assert (=> b!7261 m!4379))

(declare-fun m!4385 () Bool)

(assert (=> b!7261 m!4385))

(assert (=> b!7261 m!4319))

(assert (=> b!7261 m!4363))

(declare-fun m!4387 () Bool)

(assert (=> bm!170 m!4387))

(declare-fun m!4389 () Bool)

(assert (=> bm!174 m!4389))

(declare-fun m!4391 () Bool)

(assert (=> bm!173 m!4391))

(assert (=> d!797 m!4259))

(assert (=> b!7276 m!4319))

(assert (=> b!7276 m!4319))

(assert (=> b!7276 m!4321))

(assert (=> b!7126 d!797))

(declare-fun d!799 () Bool)

(declare-fun res!7326 () Bool)

(declare-fun e!4036 () Bool)

(assert (=> d!799 (=> res!7326 e!4036)))

(assert (=> d!799 (= res!7326 (= (select (arr!281 _keys!1806) #b00000000000000000000000000000000) k0!1278))))

(assert (=> d!799 (= (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000) e!4036)))

(declare-fun b!7284 () Bool)

(declare-fun e!4037 () Bool)

(assert (=> b!7284 (= e!4036 e!4037)))

(declare-fun res!7327 () Bool)

(assert (=> b!7284 (=> (not res!7327) (not e!4037))))

(assert (=> b!7284 (= res!7327 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!343 _keys!1806)))))

(declare-fun b!7285 () Bool)

(assert (=> b!7285 (= e!4037 (arrayContainsKey!0 _keys!1806 k0!1278 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!799 (not res!7326)) b!7284))

(assert (= (and b!7284 res!7327) b!7285))

(assert (=> d!799 m!4319))

(declare-fun m!4393 () Bool)

(assert (=> b!7285 m!4393))

(assert (=> b!7121 d!799))

(declare-fun d!801 () Bool)

(assert (=> d!801 (= (validMask!0 mask!2250) (and (or (= mask!2250 #b00000000000000000000000000000111) (= mask!2250 #b00000000000000000000000000001111) (= mask!2250 #b00000000000000000000000000011111) (= mask!2250 #b00000000000000000000000000111111) (= mask!2250 #b00000000000000000000000001111111) (= mask!2250 #b00000000000000000000000011111111) (= mask!2250 #b00000000000000000000000111111111) (= mask!2250 #b00000000000000000000001111111111) (= mask!2250 #b00000000000000000000011111111111) (= mask!2250 #b00000000000000000000111111111111) (= mask!2250 #b00000000000000000001111111111111) (= mask!2250 #b00000000000000000011111111111111) (= mask!2250 #b00000000000000000111111111111111) (= mask!2250 #b00000000000000001111111111111111) (= mask!2250 #b00000000000000011111111111111111) (= mask!2250 #b00000000000000111111111111111111) (= mask!2250 #b00000000000001111111111111111111) (= mask!2250 #b00000000000011111111111111111111) (= mask!2250 #b00000000000111111111111111111111) (= mask!2250 #b00000000001111111111111111111111) (= mask!2250 #b00000000011111111111111111111111) (= mask!2250 #b00000000111111111111111111111111) (= mask!2250 #b00000001111111111111111111111111) (= mask!2250 #b00000011111111111111111111111111) (= mask!2250 #b00000111111111111111111111111111) (= mask!2250 #b00001111111111111111111111111111) (= mask!2250 #b00011111111111111111111111111111) (= mask!2250 #b00111111111111111111111111111111)) (bvsle mask!2250 #b00111111111111111111111111111111)))))

(assert (=> start!860 d!801))

(declare-fun d!803 () Bool)

(assert (=> d!803 (= (array_inv!203 _values!1492) (bvsge (size!344 _values!1492) #b00000000000000000000000000000000))))

(assert (=> start!860 d!803))

(declare-fun d!805 () Bool)

(assert (=> d!805 (= (array_inv!204 _keys!1806) (bvsge (size!343 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> start!860 d!805))

(assert (=> b!7122 d!799))

(declare-fun d!807 () Bool)

(declare-fun e!4040 () Bool)

(assert (=> d!807 e!4040))

(declare-fun c!545 () Bool)

(assert (=> d!807 (= c!545 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!1524 () Unit!135)

(declare-fun choose!139 (array!585 array!587 (_ BitVec 32) (_ BitVec 32) V!619 V!619 (_ BitVec 64) Int) Unit!135)

(assert (=> d!807 (= lt!1524 (choose!139 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(assert (=> d!807 (validMask!0 mask!2250)))

(assert (=> d!807 (= (lemmaKeyInListMapIsInArray!50 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495) lt!1524)))

(declare-fun b!7290 () Bool)

(assert (=> b!7290 (= e!4040 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!7291 () Bool)

(assert (=> b!7291 (= e!4040 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!807 c!545) b!7290))

(assert (= (and d!807 (not c!545)) b!7291))

(declare-fun m!4395 () Bool)

(assert (=> d!807 m!4395))

(assert (=> d!807 m!4259))

(assert (=> b!7290 m!4253))

(assert (=> b!7122 d!807))

(declare-fun b!7302 () Bool)

(declare-fun e!4051 () Bool)

(declare-fun call!182 () Bool)

(assert (=> b!7302 (= e!4051 call!182)))

(declare-fun b!7303 () Bool)

(assert (=> b!7303 (= e!4051 call!182)))

(declare-fun b!7304 () Bool)

(declare-fun e!4050 () Bool)

(assert (=> b!7304 (= e!4050 e!4051)))

(declare-fun c!548 () Bool)

(assert (=> b!7304 (= c!548 (validKeyInArray!0 (select (arr!281 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun bm!179 () Bool)

(assert (=> bm!179 (= call!182 (arrayNoDuplicates!0 _keys!1806 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!548 (Cons!186 (select (arr!281 _keys!1806) #b00000000000000000000000000000000) Nil!187) Nil!187)))))

(declare-fun b!7305 () Bool)

(declare-fun e!4049 () Bool)

(assert (=> b!7305 (= e!4049 e!4050)))

(declare-fun res!7336 () Bool)

(assert (=> b!7305 (=> (not res!7336) (not e!4050))))

(declare-fun e!4052 () Bool)

(assert (=> b!7305 (= res!7336 (not e!4052))))

(declare-fun res!7335 () Bool)

(assert (=> b!7305 (=> (not res!7335) (not e!4052))))

(assert (=> b!7305 (= res!7335 (validKeyInArray!0 (select (arr!281 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun d!809 () Bool)

(declare-fun res!7334 () Bool)

(assert (=> d!809 (=> res!7334 e!4049)))

(assert (=> d!809 (= res!7334 (bvsge #b00000000000000000000000000000000 (size!343 _keys!1806)))))

(assert (=> d!809 (= (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!187) e!4049)))

(declare-fun b!7306 () Bool)

(declare-fun contains!83 (List!190 (_ BitVec 64)) Bool)

(assert (=> b!7306 (= e!4052 (contains!83 Nil!187 (select (arr!281 _keys!1806) #b00000000000000000000000000000000)))))

(assert (= (and d!809 (not res!7334)) b!7305))

(assert (= (and b!7305 res!7335) b!7306))

(assert (= (and b!7305 res!7336) b!7304))

(assert (= (and b!7304 c!548) b!7303))

(assert (= (and b!7304 (not c!548)) b!7302))

(assert (= (or b!7303 b!7302) bm!179))

(assert (=> b!7304 m!4319))

(assert (=> b!7304 m!4319))

(assert (=> b!7304 m!4321))

(assert (=> bm!179 m!4319))

(declare-fun m!4397 () Bool)

(assert (=> bm!179 m!4397))

(assert (=> b!7305 m!4319))

(assert (=> b!7305 m!4319))

(assert (=> b!7305 m!4321))

(assert (=> b!7306 m!4319))

(assert (=> b!7306 m!4319))

(declare-fun m!4399 () Bool)

(assert (=> b!7306 m!4399))

(assert (=> b!7118 d!809))

(declare-fun mapIsEmpty!476 () Bool)

(declare-fun mapRes!476 () Bool)

(assert (=> mapIsEmpty!476 mapRes!476))

(declare-fun mapNonEmpty!476 () Bool)

(declare-fun tp!1004 () Bool)

(declare-fun e!4057 () Bool)

(assert (=> mapNonEmpty!476 (= mapRes!476 (and tp!1004 e!4057))))

(declare-fun mapRest!476 () (Array (_ BitVec 32) ValueCell!149))

(declare-fun mapValue!476 () ValueCell!149)

(declare-fun mapKey!476 () (_ BitVec 32))

(assert (=> mapNonEmpty!476 (= mapRest!467 (store mapRest!476 mapKey!476 mapValue!476))))

(declare-fun b!7313 () Bool)

(assert (=> b!7313 (= e!4057 tp_is_empty!331)))

(declare-fun condMapEmpty!476 () Bool)

(declare-fun mapDefault!476 () ValueCell!149)

(assert (=> mapNonEmpty!467 (= condMapEmpty!476 (= mapRest!467 ((as const (Array (_ BitVec 32) ValueCell!149)) mapDefault!476)))))

(declare-fun e!4058 () Bool)

(assert (=> mapNonEmpty!467 (= tp!989 (and e!4058 mapRes!476))))

(declare-fun b!7314 () Bool)

(assert (=> b!7314 (= e!4058 tp_is_empty!331)))

(assert (= (and mapNonEmpty!467 condMapEmpty!476) mapIsEmpty!476))

(assert (= (and mapNonEmpty!467 (not condMapEmpty!476)) mapNonEmpty!476))

(assert (= (and mapNonEmpty!476 ((_ is ValueCellFull!149) mapValue!476)) b!7313))

(assert (= (and mapNonEmpty!467 ((_ is ValueCellFull!149) mapDefault!476)) b!7314))

(declare-fun m!4401 () Bool)

(assert (=> mapNonEmpty!476 m!4401))

(declare-fun b_lambda!337 () Bool)

(assert (= b_lambda!335 (or (and start!860 b_free!253) b_lambda!337)))

(check-sat (not bm!173) (not b!7276) (not mapNonEmpty!476) (not b!7273) b_and!405 (not d!797) (not b!7214) (not b!7261) (not bm!170) (not bm!174) (not b!7257) (not b!7275) (not b_lambda!337) (not b!7304) (not b!7263) (not b!7285) (not b!7260) (not b!7305) (not bm!179) (not b_next!253) (not b!7212) (not b!7290) (not bm!155) (not b!7204) (not d!807) (not b!7272) tp_is_empty!331 (not b!7202) (not b!7306) (not d!795) (not bm!171))
(check-sat b_and!405 (not b_next!253))

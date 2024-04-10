; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!862 () Bool)

(assert start!862)

(declare-fun b_free!255 () Bool)

(declare-fun b_next!255 () Bool)

(assert (=> start!862 (= b_free!255 (not b_next!255))))

(declare-fun tp!995 () Bool)

(declare-fun b_and!401 () Bool)

(assert (=> start!862 (= tp!995 b_and!401)))

(declare-fun b!7150 () Bool)

(declare-fun e!3958 () Bool)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!7150 (= e!3958 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!7151 () Bool)

(declare-fun res!7266 () Bool)

(declare-fun e!3959 () Bool)

(assert (=> b!7151 (=> (not res!7266) (not e!3959))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!7151 (= res!7266 (validKeyInArray!0 k0!1278))))

(declare-fun b!7152 () Bool)

(declare-fun e!3954 () Bool)

(declare-fun tp_is_empty!333 () Bool)

(assert (=> b!7152 (= e!3954 tp_is_empty!333)))

(declare-fun b!7153 () Bool)

(declare-fun res!7263 () Bool)

(assert (=> b!7153 (=> (not res!7263) (not e!3959))))

(declare-datatypes ((array!597 0))(
  ( (array!598 (arr!287 (Array (_ BitVec 32) (_ BitVec 64))) (size!349 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!597)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!597 (_ BitVec 32)) Bool)

(assert (=> b!7153 (= res!7263 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun mapIsEmpty!470 () Bool)

(declare-fun mapRes!470 () Bool)

(assert (=> mapIsEmpty!470 mapRes!470))

(declare-fun b!7154 () Bool)

(declare-fun arrayContainsKey!0 (array!597 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!7154 (= e!3958 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!470 () Bool)

(declare-fun tp!994 () Bool)

(declare-fun e!3956 () Bool)

(assert (=> mapNonEmpty!470 (= mapRes!470 (and tp!994 e!3956))))

(declare-datatypes ((V!621 0))(
  ( (V!622 (val!172 Int)) )
))
(declare-datatypes ((ValueCell!150 0))(
  ( (ValueCellFull!150 (v!1263 V!621)) (EmptyCell!150) )
))
(declare-fun mapRest!470 () (Array (_ BitVec 32) ValueCell!150))

(declare-datatypes ((array!599 0))(
  ( (array!600 (arr!288 (Array (_ BitVec 32) ValueCell!150)) (size!350 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!599)

(declare-fun mapKey!470 () (_ BitVec 32))

(declare-fun mapValue!470 () ValueCell!150)

(assert (=> mapNonEmpty!470 (= (arr!288 _values!1492) (store mapRest!470 mapKey!470 mapValue!470))))

(declare-fun b!7156 () Bool)

(assert (=> b!7156 (= e!3956 tp_is_empty!333)))

(declare-fun b!7157 () Bool)

(declare-fun res!7264 () Bool)

(assert (=> b!7157 (=> (not res!7264) (not e!3959))))

(declare-datatypes ((List!194 0))(
  ( (Nil!191) (Cons!190 (h!756 (_ BitVec 64)) (t!2329 List!194)) )
))
(declare-fun arrayNoDuplicates!0 (array!597 (_ BitVec 32) List!194) Bool)

(assert (=> b!7157 (= res!7264 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!191))))

(declare-fun b!7158 () Bool)

(assert (=> b!7158 (= e!3959 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(assert (=> b!7158 e!3958))

(declare-fun c!515 () Bool)

(assert (=> b!7158 (= c!515 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!621)

(declare-datatypes ((Unit!137 0))(
  ( (Unit!138) )
))
(declare-fun lt!1431 () Unit!137)

(declare-fun zeroValue!1434 () V!621)

(declare-fun lemmaKeyInListMapIsInArray!50 (array!597 array!599 (_ BitVec 32) (_ BitVec 32) V!621 V!621 (_ BitVec 64) Int) Unit!137)

(assert (=> b!7158 (= lt!1431 (lemmaKeyInListMapIsInArray!50 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!7159 () Bool)

(declare-fun e!3957 () Bool)

(assert (=> b!7159 (= e!3957 (and e!3954 mapRes!470))))

(declare-fun condMapEmpty!470 () Bool)

(declare-fun mapDefault!470 () ValueCell!150)

(assert (=> b!7159 (= condMapEmpty!470 (= (arr!288 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!150)) mapDefault!470)))))

(declare-fun b!7160 () Bool)

(declare-fun res!7265 () Bool)

(assert (=> b!7160 (=> (not res!7265) (not e!3959))))

(declare-datatypes ((tuple2!184 0))(
  ( (tuple2!185 (_1!92 (_ BitVec 64)) (_2!92 V!621)) )
))
(declare-datatypes ((List!195 0))(
  ( (Nil!192) (Cons!191 (h!757 tuple2!184) (t!2330 List!195)) )
))
(declare-datatypes ((ListLongMap!189 0))(
  ( (ListLongMap!190 (toList!110 List!195)) )
))
(declare-fun contains!84 (ListLongMap!189 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!69 (array!597 array!599 (_ BitVec 32) (_ BitVec 32) V!621 V!621 (_ BitVec 32) Int) ListLongMap!189)

(assert (=> b!7160 (= res!7265 (contains!84 (getCurrentListMap!69 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun res!7262 () Bool)

(assert (=> start!862 (=> (not res!7262) (not e!3959))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!862 (= res!7262 (validMask!0 mask!2250))))

(assert (=> start!862 e!3959))

(assert (=> start!862 tp!995))

(assert (=> start!862 true))

(declare-fun array_inv!211 (array!599) Bool)

(assert (=> start!862 (and (array_inv!211 _values!1492) e!3957)))

(assert (=> start!862 tp_is_empty!333))

(declare-fun array_inv!212 (array!597) Bool)

(assert (=> start!862 (array_inv!212 _keys!1806)))

(declare-fun b!7155 () Bool)

(declare-fun res!7267 () Bool)

(assert (=> b!7155 (=> (not res!7267) (not e!3959))))

(assert (=> b!7155 (= res!7267 (and (= (size!350 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!349 _keys!1806) (size!350 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(assert (= (and start!862 res!7262) b!7155))

(assert (= (and b!7155 res!7267) b!7153))

(assert (= (and b!7153 res!7263) b!7157))

(assert (= (and b!7157 res!7264) b!7160))

(assert (= (and b!7160 res!7265) b!7151))

(assert (= (and b!7151 res!7266) b!7158))

(assert (= (and b!7158 c!515) b!7154))

(assert (= (and b!7158 (not c!515)) b!7150))

(assert (= (and b!7159 condMapEmpty!470) mapIsEmpty!470))

(assert (= (and b!7159 (not condMapEmpty!470)) mapNonEmpty!470))

(get-info :version)

(assert (= (and mapNonEmpty!470 ((_ is ValueCellFull!150) mapValue!470)) b!7156))

(assert (= (and b!7159 ((_ is ValueCellFull!150) mapDefault!470)) b!7152))

(assert (= start!862 b!7159))

(declare-fun m!4275 () Bool)

(assert (=> b!7154 m!4275))

(declare-fun m!4277 () Bool)

(assert (=> b!7160 m!4277))

(assert (=> b!7160 m!4277))

(declare-fun m!4279 () Bool)

(assert (=> b!7160 m!4279))

(declare-fun m!4281 () Bool)

(assert (=> mapNonEmpty!470 m!4281))

(declare-fun m!4283 () Bool)

(assert (=> b!7153 m!4283))

(assert (=> b!7158 m!4275))

(declare-fun m!4285 () Bool)

(assert (=> b!7158 m!4285))

(declare-fun m!4287 () Bool)

(assert (=> b!7157 m!4287))

(declare-fun m!4289 () Bool)

(assert (=> start!862 m!4289))

(declare-fun m!4291 () Bool)

(assert (=> start!862 m!4291))

(declare-fun m!4293 () Bool)

(assert (=> start!862 m!4293))

(declare-fun m!4295 () Bool)

(assert (=> b!7151 m!4295))

(check-sat (not b!7151) (not mapNonEmpty!470) (not b!7160) (not start!862) (not b!7154) b_and!401 (not b!7153) (not b!7158) (not b!7157) tp_is_empty!333 (not b_next!255))
(check-sat b_and!401 (not b_next!255))
(get-model)

(declare-fun d!791 () Bool)

(declare-fun res!7290 () Bool)

(declare-fun e!3982 () Bool)

(assert (=> d!791 (=> res!7290 e!3982)))

(assert (=> d!791 (= res!7290 (= (select (arr!287 _keys!1806) #b00000000000000000000000000000000) k0!1278))))

(assert (=> d!791 (= (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000) e!3982)))

(declare-fun b!7198 () Bool)

(declare-fun e!3983 () Bool)

(assert (=> b!7198 (= e!3982 e!3983)))

(declare-fun res!7291 () Bool)

(assert (=> b!7198 (=> (not res!7291) (not e!3983))))

(assert (=> b!7198 (= res!7291 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!349 _keys!1806)))))

(declare-fun b!7199 () Bool)

(assert (=> b!7199 (= e!3983 (arrayContainsKey!0 _keys!1806 k0!1278 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!791 (not res!7290)) b!7198))

(assert (= (and b!7198 res!7291) b!7199))

(declare-fun m!4319 () Bool)

(assert (=> d!791 m!4319))

(declare-fun m!4321 () Bool)

(assert (=> b!7199 m!4321))

(assert (=> b!7158 d!791))

(declare-fun d!793 () Bool)

(declare-fun e!3986 () Bool)

(assert (=> d!793 e!3986))

(declare-fun c!521 () Bool)

(assert (=> d!793 (= c!521 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!1437 () Unit!137)

(declare-fun choose!138 (array!597 array!599 (_ BitVec 32) (_ BitVec 32) V!621 V!621 (_ BitVec 64) Int) Unit!137)

(assert (=> d!793 (= lt!1437 (choose!138 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(assert (=> d!793 (validMask!0 mask!2250)))

(assert (=> d!793 (= (lemmaKeyInListMapIsInArray!50 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495) lt!1437)))

(declare-fun b!7204 () Bool)

(assert (=> b!7204 (= e!3986 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!7205 () Bool)

(assert (=> b!7205 (= e!3986 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!793 c!521) b!7204))

(assert (= (and d!793 (not c!521)) b!7205))

(declare-fun m!4323 () Bool)

(assert (=> d!793 m!4323))

(assert (=> d!793 m!4289))

(assert (=> b!7204 m!4275))

(assert (=> b!7158 d!793))

(assert (=> b!7154 d!791))

(declare-fun d!795 () Bool)

(assert (=> d!795 (= (validKeyInArray!0 k0!1278) (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!7151 d!795))

(declare-fun d!797 () Bool)

(assert (=> d!797 (= (validMask!0 mask!2250) (and (or (= mask!2250 #b00000000000000000000000000000111) (= mask!2250 #b00000000000000000000000000001111) (= mask!2250 #b00000000000000000000000000011111) (= mask!2250 #b00000000000000000000000000111111) (= mask!2250 #b00000000000000000000000001111111) (= mask!2250 #b00000000000000000000000011111111) (= mask!2250 #b00000000000000000000000111111111) (= mask!2250 #b00000000000000000000001111111111) (= mask!2250 #b00000000000000000000011111111111) (= mask!2250 #b00000000000000000000111111111111) (= mask!2250 #b00000000000000000001111111111111) (= mask!2250 #b00000000000000000011111111111111) (= mask!2250 #b00000000000000000111111111111111) (= mask!2250 #b00000000000000001111111111111111) (= mask!2250 #b00000000000000011111111111111111) (= mask!2250 #b00000000000000111111111111111111) (= mask!2250 #b00000000000001111111111111111111) (= mask!2250 #b00000000000011111111111111111111) (= mask!2250 #b00000000000111111111111111111111) (= mask!2250 #b00000000001111111111111111111111) (= mask!2250 #b00000000011111111111111111111111) (= mask!2250 #b00000000111111111111111111111111) (= mask!2250 #b00000001111111111111111111111111) (= mask!2250 #b00000011111111111111111111111111) (= mask!2250 #b00000111111111111111111111111111) (= mask!2250 #b00001111111111111111111111111111) (= mask!2250 #b00011111111111111111111111111111) (= mask!2250 #b00111111111111111111111111111111)) (bvsle mask!2250 #b00111111111111111111111111111111)))))

(assert (=> start!862 d!797))

(declare-fun d!799 () Bool)

(assert (=> d!799 (= (array_inv!211 _values!1492) (bvsge (size!350 _values!1492) #b00000000000000000000000000000000))))

(assert (=> start!862 d!799))

(declare-fun d!801 () Bool)

(assert (=> d!801 (= (array_inv!212 _keys!1806) (bvsge (size!349 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> start!862 d!801))

(declare-fun d!803 () Bool)

(declare-fun e!3992 () Bool)

(assert (=> d!803 e!3992))

(declare-fun res!7294 () Bool)

(assert (=> d!803 (=> res!7294 e!3992)))

(declare-fun lt!1448 () Bool)

(assert (=> d!803 (= res!7294 (not lt!1448))))

(declare-fun lt!1446 () Bool)

(assert (=> d!803 (= lt!1448 lt!1446)))

(declare-fun lt!1447 () Unit!137)

(declare-fun e!3991 () Unit!137)

(assert (=> d!803 (= lt!1447 e!3991)))

(declare-fun c!524 () Bool)

(assert (=> d!803 (= c!524 lt!1446)))

(declare-fun containsKey!5 (List!195 (_ BitVec 64)) Bool)

(assert (=> d!803 (= lt!1446 (containsKey!5 (toList!110 (getCurrentListMap!69 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(assert (=> d!803 (= (contains!84 (getCurrentListMap!69 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278) lt!1448)))

(declare-fun b!7212 () Bool)

(declare-fun lt!1449 () Unit!137)

(assert (=> b!7212 (= e!3991 lt!1449)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!5 (List!195 (_ BitVec 64)) Unit!137)

(assert (=> b!7212 (= lt!1449 (lemmaContainsKeyImpliesGetValueByKeyDefined!5 (toList!110 (getCurrentListMap!69 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(declare-datatypes ((Option!17 0))(
  ( (Some!16 (v!1265 V!621)) (None!15) )
))
(declare-fun isDefined!6 (Option!17) Bool)

(declare-fun getValueByKey!11 (List!195 (_ BitVec 64)) Option!17)

(assert (=> b!7212 (isDefined!6 (getValueByKey!11 (toList!110 (getCurrentListMap!69 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(declare-fun b!7213 () Bool)

(declare-fun Unit!141 () Unit!137)

(assert (=> b!7213 (= e!3991 Unit!141)))

(declare-fun b!7214 () Bool)

(assert (=> b!7214 (= e!3992 (isDefined!6 (getValueByKey!11 (toList!110 (getCurrentListMap!69 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278)))))

(assert (= (and d!803 c!524) b!7212))

(assert (= (and d!803 (not c!524)) b!7213))

(assert (= (and d!803 (not res!7294)) b!7214))

(declare-fun m!4325 () Bool)

(assert (=> d!803 m!4325))

(declare-fun m!4327 () Bool)

(assert (=> b!7212 m!4327))

(declare-fun m!4329 () Bool)

(assert (=> b!7212 m!4329))

(assert (=> b!7212 m!4329))

(declare-fun m!4331 () Bool)

(assert (=> b!7212 m!4331))

(assert (=> b!7214 m!4329))

(assert (=> b!7214 m!4329))

(assert (=> b!7214 m!4331))

(assert (=> b!7160 d!803))

(declare-fun b!7257 () Bool)

(declare-fun c!539 () Bool)

(assert (=> b!7257 (= c!539 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!4025 () ListLongMap!189)

(declare-fun e!4024 () ListLongMap!189)

(assert (=> b!7257 (= e!4025 e!4024)))

(declare-fun b!7258 () Bool)

(declare-fun e!4021 () Bool)

(declare-fun lt!1505 () ListLongMap!189)

(declare-fun apply!21 (ListLongMap!189 (_ BitVec 64)) V!621)

(assert (=> b!7258 (= e!4021 (= (apply!21 lt!1505 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1434))))

(declare-fun call!172 () ListLongMap!189)

(declare-fun bm!167 () Bool)

(declare-fun c!538 () Bool)

(declare-fun call!173 () ListLongMap!189)

(declare-fun c!541 () Bool)

(declare-fun call!170 () ListLongMap!189)

(declare-fun call!175 () ListLongMap!189)

(declare-fun +!8 (ListLongMap!189 tuple2!184) ListLongMap!189)

(assert (=> bm!167 (= call!175 (+!8 (ite c!538 call!170 (ite c!541 call!173 call!172)) (ite (or c!538 c!541) (tuple2!185 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1434) (tuple2!185 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1434))))))

(declare-fun b!7259 () Bool)

(declare-fun res!7319 () Bool)

(declare-fun e!4027 () Bool)

(assert (=> b!7259 (=> (not res!7319) (not e!4027))))

(declare-fun e!4029 () Bool)

(assert (=> b!7259 (= res!7319 e!4029)))

(declare-fun c!540 () Bool)

(assert (=> b!7259 (= c!540 (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!7260 () Bool)

(declare-fun e!4023 () Bool)

(declare-fun call!171 () Bool)

(assert (=> b!7260 (= e!4023 (not call!171))))

(declare-fun b!7261 () Bool)

(declare-fun e!4022 () Bool)

(declare-fun get!133 (ValueCell!150 V!621) V!621)

(declare-fun dynLambda!43 (Int (_ BitVec 64)) V!621)

(assert (=> b!7261 (= e!4022 (= (apply!21 lt!1505 (select (arr!287 _keys!1806) #b00000000000000000000000000000000)) (get!133 (select (arr!288 _values!1492) #b00000000000000000000000000000000) (dynLambda!43 defaultEntry!1495 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!7261 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!350 _values!1492)))))

(assert (=> b!7261 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!349 _keys!1806)))))

(declare-fun b!7262 () Bool)

(declare-fun call!176 () Bool)

(assert (=> b!7262 (= e!4029 (not call!176))))

(declare-fun b!7263 () Bool)

(declare-fun call!174 () ListLongMap!189)

(assert (=> b!7263 (= e!4025 call!174)))

(declare-fun b!7264 () Bool)

(declare-fun e!4028 () Bool)

(assert (=> b!7264 (= e!4029 e!4028)))

(declare-fun res!7321 () Bool)

(assert (=> b!7264 (= res!7321 call!176)))

(assert (=> b!7264 (=> (not res!7321) (not e!4028))))

(declare-fun d!805 () Bool)

(assert (=> d!805 e!4027))

(declare-fun res!7314 () Bool)

(assert (=> d!805 (=> (not res!7314) (not e!4027))))

(assert (=> d!805 (= res!7314 (or (bvsge #b00000000000000000000000000000000 (size!349 _keys!1806)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!349 _keys!1806)))))))

(declare-fun lt!1506 () ListLongMap!189)

(assert (=> d!805 (= lt!1505 lt!1506)))

(declare-fun lt!1513 () Unit!137)

(declare-fun e!4019 () Unit!137)

(assert (=> d!805 (= lt!1513 e!4019)))

(declare-fun c!537 () Bool)

(declare-fun e!4020 () Bool)

(assert (=> d!805 (= c!537 e!4020)))

(declare-fun res!7316 () Bool)

(assert (=> d!805 (=> (not res!7316) (not e!4020))))

(assert (=> d!805 (= res!7316 (bvslt #b00000000000000000000000000000000 (size!349 _keys!1806)))))

(declare-fun e!4031 () ListLongMap!189)

(assert (=> d!805 (= lt!1506 e!4031)))

(assert (=> d!805 (= c!538 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!805 (validMask!0 mask!2250)))

(assert (=> d!805 (= (getCurrentListMap!69 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) lt!1505)))

(declare-fun bm!168 () Bool)

(assert (=> bm!168 (= call!171 (contains!84 lt!1505 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!7265 () Bool)

(assert (=> b!7265 (= e!4027 e!4023)))

(declare-fun c!542 () Bool)

(assert (=> b!7265 (= c!542 (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!7266 () Bool)

(declare-fun e!4030 () Bool)

(assert (=> b!7266 (= e!4030 (validKeyInArray!0 (select (arr!287 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun bm!169 () Bool)

(assert (=> bm!169 (= call!176 (contains!84 lt!1505 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!170 () Bool)

(assert (=> bm!170 (= call!174 call!175)))

(declare-fun b!7267 () Bool)

(assert (=> b!7267 (= e!4024 call!172)))

(declare-fun b!7268 () Bool)

(declare-fun lt!1504 () Unit!137)

(assert (=> b!7268 (= e!4019 lt!1504)))

(declare-fun lt!1503 () ListLongMap!189)

(declare-fun getCurrentListMapNoExtraKeys!5 (array!597 array!599 (_ BitVec 32) (_ BitVec 32) V!621 V!621 (_ BitVec 32) Int) ListLongMap!189)

(assert (=> b!7268 (= lt!1503 (getCurrentListMapNoExtraKeys!5 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!1501 () (_ BitVec 64))

(assert (=> b!7268 (= lt!1501 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!1511 () (_ BitVec 64))

(assert (=> b!7268 (= lt!1511 (select (arr!287 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!1510 () Unit!137)

(declare-fun addStillContains!6 (ListLongMap!189 (_ BitVec 64) V!621 (_ BitVec 64)) Unit!137)

(assert (=> b!7268 (= lt!1510 (addStillContains!6 lt!1503 lt!1501 zeroValue!1434 lt!1511))))

(assert (=> b!7268 (contains!84 (+!8 lt!1503 (tuple2!185 lt!1501 zeroValue!1434)) lt!1511)))

(declare-fun lt!1508 () Unit!137)

(assert (=> b!7268 (= lt!1508 lt!1510)))

(declare-fun lt!1498 () ListLongMap!189)

(assert (=> b!7268 (= lt!1498 (getCurrentListMapNoExtraKeys!5 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!1514 () (_ BitVec 64))

(assert (=> b!7268 (= lt!1514 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!1512 () (_ BitVec 64))

(assert (=> b!7268 (= lt!1512 (select (arr!287 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!1500 () Unit!137)

(declare-fun addApplyDifferent!6 (ListLongMap!189 (_ BitVec 64) V!621 (_ BitVec 64)) Unit!137)

(assert (=> b!7268 (= lt!1500 (addApplyDifferent!6 lt!1498 lt!1514 minValue!1434 lt!1512))))

(assert (=> b!7268 (= (apply!21 (+!8 lt!1498 (tuple2!185 lt!1514 minValue!1434)) lt!1512) (apply!21 lt!1498 lt!1512))))

(declare-fun lt!1497 () Unit!137)

(assert (=> b!7268 (= lt!1497 lt!1500)))

(declare-fun lt!1502 () ListLongMap!189)

(assert (=> b!7268 (= lt!1502 (getCurrentListMapNoExtraKeys!5 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!1496 () (_ BitVec 64))

(assert (=> b!7268 (= lt!1496 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!1507 () (_ BitVec 64))

(assert (=> b!7268 (= lt!1507 (select (arr!287 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!1495 () Unit!137)

(assert (=> b!7268 (= lt!1495 (addApplyDifferent!6 lt!1502 lt!1496 zeroValue!1434 lt!1507))))

(assert (=> b!7268 (= (apply!21 (+!8 lt!1502 (tuple2!185 lt!1496 zeroValue!1434)) lt!1507) (apply!21 lt!1502 lt!1507))))

(declare-fun lt!1509 () Unit!137)

(assert (=> b!7268 (= lt!1509 lt!1495)))

(declare-fun lt!1515 () ListLongMap!189)

(assert (=> b!7268 (= lt!1515 (getCurrentListMapNoExtraKeys!5 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!1494 () (_ BitVec 64))

(assert (=> b!7268 (= lt!1494 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!1499 () (_ BitVec 64))

(assert (=> b!7268 (= lt!1499 (select (arr!287 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> b!7268 (= lt!1504 (addApplyDifferent!6 lt!1515 lt!1494 minValue!1434 lt!1499))))

(assert (=> b!7268 (= (apply!21 (+!8 lt!1515 (tuple2!185 lt!1494 minValue!1434)) lt!1499) (apply!21 lt!1515 lt!1499))))

(declare-fun b!7269 () Bool)

(declare-fun e!4026 () Bool)

(assert (=> b!7269 (= e!4026 e!4022)))

(declare-fun res!7315 () Bool)

(assert (=> b!7269 (=> (not res!7315) (not e!4022))))

(assert (=> b!7269 (= res!7315 (contains!84 lt!1505 (select (arr!287 _keys!1806) #b00000000000000000000000000000000)))))

(assert (=> b!7269 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!349 _keys!1806)))))

(declare-fun b!7270 () Bool)

(assert (=> b!7270 (= e!4028 (= (apply!21 lt!1505 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1434))))

(declare-fun bm!171 () Bool)

(assert (=> bm!171 (= call!173 call!170)))

(declare-fun b!7271 () Bool)

(assert (=> b!7271 (= e!4023 e!4021)))

(declare-fun res!7320 () Bool)

(assert (=> b!7271 (= res!7320 call!171)))

(assert (=> b!7271 (=> (not res!7320) (not e!4021))))

(declare-fun bm!172 () Bool)

(assert (=> bm!172 (= call!170 (getCurrentListMapNoExtraKeys!5 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun b!7272 () Bool)

(assert (=> b!7272 (= e!4031 e!4025)))

(assert (=> b!7272 (= c!541 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!7273 () Bool)

(assert (=> b!7273 (= e!4024 call!174)))

(declare-fun b!7274 () Bool)

(declare-fun res!7318 () Bool)

(assert (=> b!7274 (=> (not res!7318) (not e!4027))))

(assert (=> b!7274 (= res!7318 e!4026)))

(declare-fun res!7313 () Bool)

(assert (=> b!7274 (=> res!7313 e!4026)))

(assert (=> b!7274 (= res!7313 (not e!4030))))

(declare-fun res!7317 () Bool)

(assert (=> b!7274 (=> (not res!7317) (not e!4030))))

(assert (=> b!7274 (= res!7317 (bvslt #b00000000000000000000000000000000 (size!349 _keys!1806)))))

(declare-fun b!7275 () Bool)

(assert (=> b!7275 (= e!4031 (+!8 call!175 (tuple2!185 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1434)))))

(declare-fun b!7276 () Bool)

(declare-fun Unit!142 () Unit!137)

(assert (=> b!7276 (= e!4019 Unit!142)))

(declare-fun bm!173 () Bool)

(assert (=> bm!173 (= call!172 call!173)))

(declare-fun b!7277 () Bool)

(assert (=> b!7277 (= e!4020 (validKeyInArray!0 (select (arr!287 _keys!1806) #b00000000000000000000000000000000)))))

(assert (= (and d!805 c!538) b!7275))

(assert (= (and d!805 (not c!538)) b!7272))

(assert (= (and b!7272 c!541) b!7263))

(assert (= (and b!7272 (not c!541)) b!7257))

(assert (= (and b!7257 c!539) b!7273))

(assert (= (and b!7257 (not c!539)) b!7267))

(assert (= (or b!7273 b!7267) bm!173))

(assert (= (or b!7263 bm!173) bm!171))

(assert (= (or b!7263 b!7273) bm!170))

(assert (= (or b!7275 bm!171) bm!172))

(assert (= (or b!7275 bm!170) bm!167))

(assert (= (and d!805 res!7316) b!7277))

(assert (= (and d!805 c!537) b!7268))

(assert (= (and d!805 (not c!537)) b!7276))

(assert (= (and d!805 res!7314) b!7274))

(assert (= (and b!7274 res!7317) b!7266))

(assert (= (and b!7274 (not res!7313)) b!7269))

(assert (= (and b!7269 res!7315) b!7261))

(assert (= (and b!7274 res!7318) b!7259))

(assert (= (and b!7259 c!540) b!7264))

(assert (= (and b!7259 (not c!540)) b!7262))

(assert (= (and b!7264 res!7321) b!7270))

(assert (= (or b!7264 b!7262) bm!169))

(assert (= (and b!7259 res!7319) b!7265))

(assert (= (and b!7265 c!542) b!7271))

(assert (= (and b!7265 (not c!542)) b!7260))

(assert (= (and b!7271 res!7320) b!7258))

(assert (= (or b!7271 b!7260) bm!168))

(declare-fun b_lambda!335 () Bool)

(assert (=> (not b_lambda!335) (not b!7261)))

(declare-fun t!2332 () Bool)

(declare-fun tb!135 () Bool)

(assert (=> (and start!862 (= defaultEntry!1495 defaultEntry!1495) t!2332) tb!135))

(declare-fun result!207 () Bool)

(assert (=> tb!135 (= result!207 tp_is_empty!333)))

(assert (=> b!7261 t!2332))

(declare-fun b_and!405 () Bool)

(assert (= b_and!401 (and (=> t!2332 result!207) b_and!405)))

(assert (=> b!7269 m!4319))

(assert (=> b!7269 m!4319))

(declare-fun m!4333 () Bool)

(assert (=> b!7269 m!4333))

(declare-fun m!4335 () Bool)

(assert (=> b!7270 m!4335))

(declare-fun m!4337 () Bool)

(assert (=> bm!168 m!4337))

(declare-fun m!4339 () Bool)

(assert (=> b!7268 m!4339))

(declare-fun m!4341 () Bool)

(assert (=> b!7268 m!4341))

(declare-fun m!4343 () Bool)

(assert (=> b!7268 m!4343))

(declare-fun m!4345 () Bool)

(assert (=> b!7268 m!4345))

(declare-fun m!4347 () Bool)

(assert (=> b!7268 m!4347))

(declare-fun m!4349 () Bool)

(assert (=> b!7268 m!4349))

(declare-fun m!4351 () Bool)

(assert (=> b!7268 m!4351))

(declare-fun m!4353 () Bool)

(assert (=> b!7268 m!4353))

(declare-fun m!4355 () Bool)

(assert (=> b!7268 m!4355))

(declare-fun m!4357 () Bool)

(assert (=> b!7268 m!4357))

(declare-fun m!4359 () Bool)

(assert (=> b!7268 m!4359))

(assert (=> b!7268 m!4357))

(declare-fun m!4361 () Bool)

(assert (=> b!7268 m!4361))

(declare-fun m!4363 () Bool)

(assert (=> b!7268 m!4363))

(assert (=> b!7268 m!4347))

(declare-fun m!4365 () Bool)

(assert (=> b!7268 m!4365))

(assert (=> b!7268 m!4349))

(declare-fun m!4367 () Bool)

(assert (=> b!7268 m!4367))

(assert (=> b!7268 m!4361))

(declare-fun m!4369 () Bool)

(assert (=> b!7268 m!4369))

(assert (=> b!7268 m!4319))

(declare-fun m!4371 () Bool)

(assert (=> b!7275 m!4371))

(declare-fun m!4373 () Bool)

(assert (=> b!7261 m!4373))

(assert (=> b!7261 m!4319))

(declare-fun m!4375 () Bool)

(assert (=> b!7261 m!4375))

(assert (=> b!7261 m!4319))

(declare-fun m!4377 () Bool)

(assert (=> b!7261 m!4377))

(assert (=> b!7261 m!4373))

(assert (=> b!7261 m!4377))

(declare-fun m!4379 () Bool)

(assert (=> b!7261 m!4379))

(assert (=> b!7266 m!4319))

(assert (=> b!7266 m!4319))

(declare-fun m!4381 () Bool)

(assert (=> b!7266 m!4381))

(declare-fun m!4383 () Bool)

(assert (=> bm!169 m!4383))

(assert (=> b!7277 m!4319))

(assert (=> b!7277 m!4319))

(assert (=> b!7277 m!4381))

(declare-fun m!4385 () Bool)

(assert (=> b!7258 m!4385))

(assert (=> bm!172 m!4339))

(assert (=> d!805 m!4289))

(declare-fun m!4387 () Bool)

(assert (=> bm!167 m!4387))

(assert (=> b!7160 d!805))

(declare-fun b!7290 () Bool)

(declare-fun e!4043 () Bool)

(declare-fun call!179 () Bool)

(assert (=> b!7290 (= e!4043 call!179)))

(declare-fun b!7291 () Bool)

(declare-fun e!4040 () Bool)

(declare-fun e!4042 () Bool)

(assert (=> b!7291 (= e!4040 e!4042)))

(declare-fun res!7330 () Bool)

(assert (=> b!7291 (=> (not res!7330) (not e!4042))))

(declare-fun e!4041 () Bool)

(assert (=> b!7291 (= res!7330 (not e!4041))))

(declare-fun res!7329 () Bool)

(assert (=> b!7291 (=> (not res!7329) (not e!4041))))

(assert (=> b!7291 (= res!7329 (validKeyInArray!0 (select (arr!287 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun bm!176 () Bool)

(declare-fun c!545 () Bool)

(assert (=> bm!176 (= call!179 (arrayNoDuplicates!0 _keys!1806 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!545 (Cons!190 (select (arr!287 _keys!1806) #b00000000000000000000000000000000) Nil!191) Nil!191)))))

(declare-fun b!7292 () Bool)

(declare-fun contains!85 (List!194 (_ BitVec 64)) Bool)

(assert (=> b!7292 (= e!4041 (contains!85 Nil!191 (select (arr!287 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!7293 () Bool)

(assert (=> b!7293 (= e!4043 call!179)))

(declare-fun b!7294 () Bool)

(assert (=> b!7294 (= e!4042 e!4043)))

(assert (=> b!7294 (= c!545 (validKeyInArray!0 (select (arr!287 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun d!807 () Bool)

(declare-fun res!7328 () Bool)

(assert (=> d!807 (=> res!7328 e!4040)))

(assert (=> d!807 (= res!7328 (bvsge #b00000000000000000000000000000000 (size!349 _keys!1806)))))

(assert (=> d!807 (= (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!191) e!4040)))

(assert (= (and d!807 (not res!7328)) b!7291))

(assert (= (and b!7291 res!7329) b!7292))

(assert (= (and b!7291 res!7330) b!7294))

(assert (= (and b!7294 c!545) b!7293))

(assert (= (and b!7294 (not c!545)) b!7290))

(assert (= (or b!7293 b!7290) bm!176))

(assert (=> b!7291 m!4319))

(assert (=> b!7291 m!4319))

(assert (=> b!7291 m!4381))

(assert (=> bm!176 m!4319))

(declare-fun m!4389 () Bool)

(assert (=> bm!176 m!4389))

(assert (=> b!7292 m!4319))

(assert (=> b!7292 m!4319))

(declare-fun m!4391 () Bool)

(assert (=> b!7292 m!4391))

(assert (=> b!7294 m!4319))

(assert (=> b!7294 m!4319))

(assert (=> b!7294 m!4381))

(assert (=> b!7157 d!807))

(declare-fun bm!179 () Bool)

(declare-fun call!182 () Bool)

(assert (=> bm!179 (= call!182 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1806 mask!2250))))

(declare-fun b!7303 () Bool)

(declare-fun e!4052 () Bool)

(declare-fun e!4051 () Bool)

(assert (=> b!7303 (= e!4052 e!4051)))

(declare-fun lt!1524 () (_ BitVec 64))

(assert (=> b!7303 (= lt!1524 (select (arr!287 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!1522 () Unit!137)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!597 (_ BitVec 64) (_ BitVec 32)) Unit!137)

(assert (=> b!7303 (= lt!1522 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1806 lt!1524 #b00000000000000000000000000000000))))

(assert (=> b!7303 (arrayContainsKey!0 _keys!1806 lt!1524 #b00000000000000000000000000000000)))

(declare-fun lt!1523 () Unit!137)

(assert (=> b!7303 (= lt!1523 lt!1522)))

(declare-fun res!7335 () Bool)

(declare-datatypes ((SeekEntryResult!30 0))(
  ( (MissingZero!30 (index!2239 (_ BitVec 32))) (Found!30 (index!2240 (_ BitVec 32))) (Intermediate!30 (undefined!842 Bool) (index!2241 (_ BitVec 32)) (x!2594 (_ BitVec 32))) (Undefined!30) (MissingVacant!30 (index!2242 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!597 (_ BitVec 32)) SeekEntryResult!30)

(assert (=> b!7303 (= res!7335 (= (seekEntryOrOpen!0 (select (arr!287 _keys!1806) #b00000000000000000000000000000000) _keys!1806 mask!2250) (Found!30 #b00000000000000000000000000000000)))))

(assert (=> b!7303 (=> (not res!7335) (not e!4051))))

(declare-fun d!809 () Bool)

(declare-fun res!7336 () Bool)

(declare-fun e!4050 () Bool)

(assert (=> d!809 (=> res!7336 e!4050)))

(assert (=> d!809 (= res!7336 (bvsge #b00000000000000000000000000000000 (size!349 _keys!1806)))))

(assert (=> d!809 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250) e!4050)))

(declare-fun b!7304 () Bool)

(assert (=> b!7304 (= e!4051 call!182)))

(declare-fun b!7305 () Bool)

(assert (=> b!7305 (= e!4052 call!182)))

(declare-fun b!7306 () Bool)

(assert (=> b!7306 (= e!4050 e!4052)))

(declare-fun c!548 () Bool)

(assert (=> b!7306 (= c!548 (validKeyInArray!0 (select (arr!287 _keys!1806) #b00000000000000000000000000000000)))))

(assert (= (and d!809 (not res!7336)) b!7306))

(assert (= (and b!7306 c!548) b!7303))

(assert (= (and b!7306 (not c!548)) b!7305))

(assert (= (and b!7303 res!7335) b!7304))

(assert (= (or b!7304 b!7305) bm!179))

(declare-fun m!4393 () Bool)

(assert (=> bm!179 m!4393))

(assert (=> b!7303 m!4319))

(declare-fun m!4395 () Bool)

(assert (=> b!7303 m!4395))

(declare-fun m!4397 () Bool)

(assert (=> b!7303 m!4397))

(assert (=> b!7303 m!4319))

(declare-fun m!4399 () Bool)

(assert (=> b!7303 m!4399))

(assert (=> b!7306 m!4319))

(assert (=> b!7306 m!4319))

(assert (=> b!7306 m!4381))

(assert (=> b!7153 d!809))

(declare-fun condMapEmpty!476 () Bool)

(declare-fun mapDefault!476 () ValueCell!150)

(assert (=> mapNonEmpty!470 (= condMapEmpty!476 (= mapRest!470 ((as const (Array (_ BitVec 32) ValueCell!150)) mapDefault!476)))))

(declare-fun e!4057 () Bool)

(declare-fun mapRes!476 () Bool)

(assert (=> mapNonEmpty!470 (= tp!994 (and e!4057 mapRes!476))))

(declare-fun b!7314 () Bool)

(assert (=> b!7314 (= e!4057 tp_is_empty!333)))

(declare-fun mapIsEmpty!476 () Bool)

(assert (=> mapIsEmpty!476 mapRes!476))

(declare-fun mapNonEmpty!476 () Bool)

(declare-fun tp!1004 () Bool)

(declare-fun e!4058 () Bool)

(assert (=> mapNonEmpty!476 (= mapRes!476 (and tp!1004 e!4058))))

(declare-fun mapRest!476 () (Array (_ BitVec 32) ValueCell!150))

(declare-fun mapKey!476 () (_ BitVec 32))

(declare-fun mapValue!476 () ValueCell!150)

(assert (=> mapNonEmpty!476 (= mapRest!470 (store mapRest!476 mapKey!476 mapValue!476))))

(declare-fun b!7313 () Bool)

(assert (=> b!7313 (= e!4058 tp_is_empty!333)))

(assert (= (and mapNonEmpty!470 condMapEmpty!476) mapIsEmpty!476))

(assert (= (and mapNonEmpty!470 (not condMapEmpty!476)) mapNonEmpty!476))

(assert (= (and mapNonEmpty!476 ((_ is ValueCellFull!150) mapValue!476)) b!7313))

(assert (= (and mapNonEmpty!470 ((_ is ValueCellFull!150) mapDefault!476)) b!7314))

(declare-fun m!4401 () Bool)

(assert (=> mapNonEmpty!476 m!4401))

(declare-fun b_lambda!337 () Bool)

(assert (= b_lambda!335 (or (and start!862 b_free!255) b_lambda!337)))

(check-sat (not b!7275) (not bm!168) (not b!7277) (not bm!176) (not d!793) (not mapNonEmpty!476) (not bm!169) (not d!803) b_and!405 (not b!7270) (not b!7199) (not b!7269) (not b!7268) (not b!7261) (not b!7212) (not b!7258) (not b!7291) (not bm!179) (not d!805) (not b!7294) (not b_lambda!337) (not b!7292) (not b!7306) (not b!7214) tp_is_empty!333 (not b_next!255) (not bm!172) (not b!7204) (not b!7266) (not b!7303) (not bm!167))
(check-sat b_and!405 (not b_next!255))

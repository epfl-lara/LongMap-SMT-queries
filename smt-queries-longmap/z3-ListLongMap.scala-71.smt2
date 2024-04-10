; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!960 () Bool)

(assert start!960)

(declare-fun b_free!333 () Bool)

(declare-fun b_next!333 () Bool)

(assert (=> start!960 (= b_free!333 (not b_next!333))))

(declare-fun tp!1231 () Bool)

(declare-fun b_and!481 () Bool)

(assert (=> start!960 (= tp!1231 b_and!481)))

(declare-fun b!8257 () Bool)

(declare-fun e!4679 () Bool)

(declare-fun tp_is_empty!411 () Bool)

(assert (=> b!8257 (= e!4679 tp_is_empty!411)))

(declare-fun b!8258 () Bool)

(declare-fun e!4684 () Bool)

(declare-fun mapRes!590 () Bool)

(assert (=> b!8258 (= e!4684 (and e!4679 mapRes!590))))

(declare-fun condMapEmpty!590 () Bool)

(declare-datatypes ((V!725 0))(
  ( (V!726 (val!211 Int)) )
))
(declare-datatypes ((ValueCell!189 0))(
  ( (ValueCellFull!189 (v!1303 V!725)) (EmptyCell!189) )
))
(declare-datatypes ((array!751 0))(
  ( (array!752 (arr!363 (Array (_ BitVec 32) ValueCell!189)) (size!425 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!751)

(declare-fun mapDefault!590 () ValueCell!189)

(assert (=> b!8258 (= condMapEmpty!590 (= (arr!363 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!189)) mapDefault!590)))))

(declare-fun mapIsEmpty!590 () Bool)

(assert (=> mapIsEmpty!590 mapRes!590))

(declare-fun b!8259 () Bool)

(declare-fun e!4685 () Bool)

(declare-fun e!4683 () Bool)

(assert (=> b!8259 (= e!4685 (not e!4683))))

(declare-fun res!7881 () Bool)

(assert (=> b!8259 (=> res!7881 e!4683)))

(declare-datatypes ((array!753 0))(
  ( (array!754 (arr!364 (Array (_ BitVec 32) (_ BitVec 64))) (size!426 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!753)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!753 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!8259 (= res!7881 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(declare-fun e!4682 () Bool)

(assert (=> b!8259 e!4682))

(declare-fun c!581 () Bool)

(assert (=> b!8259 (= c!581 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((Unit!159 0))(
  ( (Unit!160) )
))
(declare-fun lt!1661 () Unit!159)

(declare-fun minValue!1434 () V!725)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!725)

(declare-fun lemmaKeyInListMapIsInArray!60 (array!753 array!751 (_ BitVec 32) (_ BitVec 32) V!725 V!725 (_ BitVec 64) Int) Unit!159)

(assert (=> b!8259 (= lt!1661 (lemmaKeyInListMapIsInArray!60 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!8260 () Bool)

(declare-fun res!7876 () Bool)

(assert (=> b!8260 (=> (not res!7876) (not e!4685))))

(declare-datatypes ((List!249 0))(
  ( (Nil!246) (Cons!245 (h!811 (_ BitVec 64)) (t!2386 List!249)) )
))
(declare-fun arrayNoDuplicates!0 (array!753 (_ BitVec 32) List!249) Bool)

(assert (=> b!8260 (= res!7876 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!246))))

(declare-fun b!8261 () Bool)

(declare-fun e!4681 () Bool)

(assert (=> b!8261 (= e!4681 tp_is_empty!411)))

(declare-fun res!7878 () Bool)

(assert (=> start!960 (=> (not res!7878) (not e!4685))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!960 (= res!7878 (validMask!0 mask!2250))))

(assert (=> start!960 e!4685))

(assert (=> start!960 tp!1231))

(assert (=> start!960 true))

(declare-fun array_inv!269 (array!751) Bool)

(assert (=> start!960 (and (array_inv!269 _values!1492) e!4684)))

(assert (=> start!960 tp_is_empty!411))

(declare-fun array_inv!270 (array!753) Bool)

(assert (=> start!960 (array_inv!270 _keys!1806)))

(declare-fun b!8262 () Bool)

(declare-fun res!7880 () Bool)

(assert (=> b!8262 (=> (not res!7880) (not e!4685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!753 (_ BitVec 32)) Bool)

(assert (=> b!8262 (= res!7880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun mapNonEmpty!590 () Bool)

(declare-fun tp!1232 () Bool)

(assert (=> mapNonEmpty!590 (= mapRes!590 (and tp!1232 e!4681))))

(declare-fun mapKey!590 () (_ BitVec 32))

(declare-fun mapRest!590 () (Array (_ BitVec 32) ValueCell!189))

(declare-fun mapValue!590 () ValueCell!189)

(assert (=> mapNonEmpty!590 (= (arr!363 _values!1492) (store mapRest!590 mapKey!590 mapValue!590))))

(declare-fun b!8263 () Bool)

(assert (=> b!8263 (= e!4682 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!8264 () Bool)

(assert (=> b!8264 (= e!4683 (or (not (= (size!426 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250))) (bvsle #b00000000000000000000000000000000 (size!426 _keys!1806))))))

(declare-fun lt!1662 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!753 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!8264 (= lt!1662 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!8265 () Bool)

(declare-fun res!7879 () Bool)

(assert (=> b!8265 (=> (not res!7879) (not e!4685))))

(assert (=> b!8265 (= res!7879 (and (= (size!425 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!426 _keys!1806) (size!425 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!8266 () Bool)

(assert (=> b!8266 (= e!4682 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!8267 () Bool)

(declare-fun res!7877 () Bool)

(assert (=> b!8267 (=> (not res!7877) (not e!4685))))

(declare-datatypes ((tuple2!238 0))(
  ( (tuple2!239 (_1!119 (_ BitVec 64)) (_2!119 V!725)) )
))
(declare-datatypes ((List!250 0))(
  ( (Nil!247) (Cons!246 (h!812 tuple2!238) (t!2387 List!250)) )
))
(declare-datatypes ((ListLongMap!243 0))(
  ( (ListLongMap!244 (toList!137 List!250)) )
))
(declare-fun contains!112 (ListLongMap!243 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!96 (array!753 array!751 (_ BitVec 32) (_ BitVec 32) V!725 V!725 (_ BitVec 32) Int) ListLongMap!243)

(assert (=> b!8267 (= res!7877 (contains!112 (getCurrentListMap!96 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!8268 () Bool)

(declare-fun res!7882 () Bool)

(assert (=> b!8268 (=> (not res!7882) (not e!4685))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!8268 (= res!7882 (validKeyInArray!0 k0!1278))))

(assert (= (and start!960 res!7878) b!8265))

(assert (= (and b!8265 res!7879) b!8262))

(assert (= (and b!8262 res!7880) b!8260))

(assert (= (and b!8260 res!7876) b!8267))

(assert (= (and b!8267 res!7877) b!8268))

(assert (= (and b!8268 res!7882) b!8259))

(assert (= (and b!8259 c!581) b!8263))

(assert (= (and b!8259 (not c!581)) b!8266))

(assert (= (and b!8259 (not res!7881)) b!8264))

(assert (= (and b!8258 condMapEmpty!590) mapIsEmpty!590))

(assert (= (and b!8258 (not condMapEmpty!590)) mapNonEmpty!590))

(get-info :version)

(assert (= (and mapNonEmpty!590 ((_ is ValueCellFull!189) mapValue!590)) b!8261))

(assert (= (and b!8258 ((_ is ValueCellFull!189) mapDefault!590)) b!8257))

(assert (= start!960 b!8258))

(declare-fun m!5069 () Bool)

(assert (=> b!8259 m!5069))

(declare-fun m!5071 () Bool)

(assert (=> b!8259 m!5071))

(declare-fun m!5073 () Bool)

(assert (=> b!8260 m!5073))

(declare-fun m!5075 () Bool)

(assert (=> b!8262 m!5075))

(assert (=> b!8263 m!5069))

(declare-fun m!5077 () Bool)

(assert (=> mapNonEmpty!590 m!5077))

(declare-fun m!5079 () Bool)

(assert (=> b!8268 m!5079))

(declare-fun m!5081 () Bool)

(assert (=> b!8267 m!5081))

(assert (=> b!8267 m!5081))

(declare-fun m!5083 () Bool)

(assert (=> b!8267 m!5083))

(declare-fun m!5085 () Bool)

(assert (=> b!8264 m!5085))

(declare-fun m!5087 () Bool)

(assert (=> start!960 m!5087))

(declare-fun m!5089 () Bool)

(assert (=> start!960 m!5089))

(declare-fun m!5091 () Bool)

(assert (=> start!960 m!5091))

(check-sat (not b!8264) (not mapNonEmpty!590) (not b!8268) (not b!8263) (not start!960) (not b!8267) tp_is_empty!411 b_and!481 (not b!8262) (not b_next!333) (not b!8259) (not b!8260))
(check-sat b_and!481 (not b_next!333))
(get-model)

(declare-fun d!837 () Bool)

(declare-fun res!7908 () Bool)

(declare-fun e!4711 () Bool)

(assert (=> d!837 (=> res!7908 e!4711)))

(assert (=> d!837 (= res!7908 (= (select (arr!364 _keys!1806) #b00000000000000000000000000000000) k0!1278))))

(assert (=> d!837 (= (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000) e!4711)))

(declare-fun b!8309 () Bool)

(declare-fun e!4712 () Bool)

(assert (=> b!8309 (= e!4711 e!4712)))

(declare-fun res!7909 () Bool)

(assert (=> b!8309 (=> (not res!7909) (not e!4712))))

(assert (=> b!8309 (= res!7909 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!426 _keys!1806)))))

(declare-fun b!8310 () Bool)

(assert (=> b!8310 (= e!4712 (arrayContainsKey!0 _keys!1806 k0!1278 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!837 (not res!7908)) b!8309))

(assert (= (and b!8309 res!7909) b!8310))

(declare-fun m!5117 () Bool)

(assert (=> d!837 m!5117))

(declare-fun m!5119 () Bool)

(assert (=> b!8310 m!5119))

(assert (=> b!8259 d!837))

(declare-fun d!839 () Bool)

(declare-fun e!4715 () Bool)

(assert (=> d!839 e!4715))

(declare-fun c!587 () Bool)

(assert (=> d!839 (= c!587 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!1671 () Unit!159)

(declare-fun choose!139 (array!753 array!751 (_ BitVec 32) (_ BitVec 32) V!725 V!725 (_ BitVec 64) Int) Unit!159)

(assert (=> d!839 (= lt!1671 (choose!139 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(assert (=> d!839 (validMask!0 mask!2250)))

(assert (=> d!839 (= (lemmaKeyInListMapIsInArray!60 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495) lt!1671)))

(declare-fun b!8315 () Bool)

(assert (=> b!8315 (= e!4715 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!8316 () Bool)

(assert (=> b!8316 (= e!4715 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!839 c!587) b!8315))

(assert (= (and d!839 (not c!587)) b!8316))

(declare-fun m!5121 () Bool)

(assert (=> d!839 m!5121))

(assert (=> d!839 m!5087))

(assert (=> b!8315 m!5069))

(assert (=> b!8259 d!839))

(assert (=> b!8263 d!837))

(declare-fun d!841 () Bool)

(assert (=> d!841 (= (validKeyInArray!0 k0!1278) (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!8268 d!841))

(declare-fun b!8327 () Bool)

(declare-fun e!4724 () Bool)

(declare-fun call!185 () Bool)

(assert (=> b!8327 (= e!4724 call!185)))

(declare-fun b!8328 () Bool)

(declare-fun e!4725 () Bool)

(declare-fun contains!114 (List!249 (_ BitVec 64)) Bool)

(assert (=> b!8328 (= e!4725 (contains!114 Nil!246 (select (arr!364 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!8329 () Bool)

(assert (=> b!8329 (= e!4724 call!185)))

(declare-fun bm!182 () Bool)

(declare-fun c!590 () Bool)

(assert (=> bm!182 (= call!185 (arrayNoDuplicates!0 _keys!1806 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!590 (Cons!245 (select (arr!364 _keys!1806) #b00000000000000000000000000000000) Nil!246) Nil!246)))))

(declare-fun b!8330 () Bool)

(declare-fun e!4726 () Bool)

(assert (=> b!8330 (= e!4726 e!4724)))

(assert (=> b!8330 (= c!590 (validKeyInArray!0 (select (arr!364 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!8331 () Bool)

(declare-fun e!4727 () Bool)

(assert (=> b!8331 (= e!4727 e!4726)))

(declare-fun res!7917 () Bool)

(assert (=> b!8331 (=> (not res!7917) (not e!4726))))

(assert (=> b!8331 (= res!7917 (not e!4725))))

(declare-fun res!7916 () Bool)

(assert (=> b!8331 (=> (not res!7916) (not e!4725))))

(assert (=> b!8331 (= res!7916 (validKeyInArray!0 (select (arr!364 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun d!843 () Bool)

(declare-fun res!7918 () Bool)

(assert (=> d!843 (=> res!7918 e!4727)))

(assert (=> d!843 (= res!7918 (bvsge #b00000000000000000000000000000000 (size!426 _keys!1806)))))

(assert (=> d!843 (= (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!246) e!4727)))

(assert (= (and d!843 (not res!7918)) b!8331))

(assert (= (and b!8331 res!7916) b!8328))

(assert (= (and b!8331 res!7917) b!8330))

(assert (= (and b!8330 c!590) b!8329))

(assert (= (and b!8330 (not c!590)) b!8327))

(assert (= (or b!8329 b!8327) bm!182))

(assert (=> b!8328 m!5117))

(assert (=> b!8328 m!5117))

(declare-fun m!5123 () Bool)

(assert (=> b!8328 m!5123))

(assert (=> bm!182 m!5117))

(declare-fun m!5125 () Bool)

(assert (=> bm!182 m!5125))

(assert (=> b!8330 m!5117))

(assert (=> b!8330 m!5117))

(declare-fun m!5127 () Bool)

(assert (=> b!8330 m!5127))

(assert (=> b!8331 m!5117))

(assert (=> b!8331 m!5117))

(assert (=> b!8331 m!5127))

(assert (=> b!8260 d!843))

(declare-fun d!845 () Bool)

(declare-fun lt!1674 () (_ BitVec 32))

(assert (=> d!845 (and (or (bvslt lt!1674 #b00000000000000000000000000000000) (bvsge lt!1674 (size!426 _keys!1806)) (and (bvsge lt!1674 #b00000000000000000000000000000000) (bvslt lt!1674 (size!426 _keys!1806)))) (bvsge lt!1674 #b00000000000000000000000000000000) (bvslt lt!1674 (size!426 _keys!1806)) (= (select (arr!364 _keys!1806) lt!1674) k0!1278))))

(declare-fun e!4730 () (_ BitVec 32))

(assert (=> d!845 (= lt!1674 e!4730)))

(declare-fun c!593 () Bool)

(assert (=> d!845 (= c!593 (= (select (arr!364 _keys!1806) #b00000000000000000000000000000000) k0!1278))))

(assert (=> d!845 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!426 _keys!1806)) (bvslt (size!426 _keys!1806) #b01111111111111111111111111111111))))

(assert (=> d!845 (= (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000) lt!1674)))

(declare-fun b!8336 () Bool)

(assert (=> b!8336 (= e!4730 #b00000000000000000000000000000000)))

(declare-fun b!8337 () Bool)

(assert (=> b!8337 (= e!4730 (arrayScanForKey!0 _keys!1806 k0!1278 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!845 c!593) b!8336))

(assert (= (and d!845 (not c!593)) b!8337))

(declare-fun m!5129 () Bool)

(assert (=> d!845 m!5129))

(assert (=> d!845 m!5117))

(declare-fun m!5131 () Bool)

(assert (=> b!8337 m!5131))

(assert (=> b!8264 d!845))

(declare-fun bm!185 () Bool)

(declare-fun call!188 () Bool)

(assert (=> bm!185 (= call!188 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1806 mask!2250))))

(declare-fun b!8347 () Bool)

(declare-fun e!4738 () Bool)

(assert (=> b!8347 (= e!4738 call!188)))

(declare-fun b!8348 () Bool)

(declare-fun e!4739 () Bool)

(assert (=> b!8348 (= e!4739 e!4738)))

(declare-fun c!596 () Bool)

(assert (=> b!8348 (= c!596 (validKeyInArray!0 (select (arr!364 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!8349 () Bool)

(declare-fun e!4737 () Bool)

(assert (=> b!8349 (= e!4738 e!4737)))

(declare-fun lt!1682 () (_ BitVec 64))

(assert (=> b!8349 (= lt!1682 (select (arr!364 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!1683 () Unit!159)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!753 (_ BitVec 64) (_ BitVec 32)) Unit!159)

(assert (=> b!8349 (= lt!1683 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1806 lt!1682 #b00000000000000000000000000000000))))

(assert (=> b!8349 (arrayContainsKey!0 _keys!1806 lt!1682 #b00000000000000000000000000000000)))

(declare-fun lt!1681 () Unit!159)

(assert (=> b!8349 (= lt!1681 lt!1683)))

(declare-fun res!7923 () Bool)

(declare-datatypes ((SeekEntryResult!31 0))(
  ( (MissingZero!31 (index!2243 (_ BitVec 32))) (Found!31 (index!2244 (_ BitVec 32))) (Intermediate!31 (undefined!843 Bool) (index!2245 (_ BitVec 32)) (x!2709 (_ BitVec 32))) (Undefined!31) (MissingVacant!31 (index!2246 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!753 (_ BitVec 32)) SeekEntryResult!31)

(assert (=> b!8349 (= res!7923 (= (seekEntryOrOpen!0 (select (arr!364 _keys!1806) #b00000000000000000000000000000000) _keys!1806 mask!2250) (Found!31 #b00000000000000000000000000000000)))))

(assert (=> b!8349 (=> (not res!7923) (not e!4737))))

(declare-fun b!8346 () Bool)

(assert (=> b!8346 (= e!4737 call!188)))

(declare-fun d!847 () Bool)

(declare-fun res!7924 () Bool)

(assert (=> d!847 (=> res!7924 e!4739)))

(assert (=> d!847 (= res!7924 (bvsge #b00000000000000000000000000000000 (size!426 _keys!1806)))))

(assert (=> d!847 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250) e!4739)))

(assert (= (and d!847 (not res!7924)) b!8348))

(assert (= (and b!8348 c!596) b!8349))

(assert (= (and b!8348 (not c!596)) b!8347))

(assert (= (and b!8349 res!7923) b!8346))

(assert (= (or b!8346 b!8347) bm!185))

(declare-fun m!5133 () Bool)

(assert (=> bm!185 m!5133))

(assert (=> b!8348 m!5117))

(assert (=> b!8348 m!5117))

(assert (=> b!8348 m!5127))

(assert (=> b!8349 m!5117))

(declare-fun m!5135 () Bool)

(assert (=> b!8349 m!5135))

(declare-fun m!5137 () Bool)

(assert (=> b!8349 m!5137))

(assert (=> b!8349 m!5117))

(declare-fun m!5139 () Bool)

(assert (=> b!8349 m!5139))

(assert (=> b!8262 d!847))

(declare-fun d!849 () Bool)

(assert (=> d!849 (= (validMask!0 mask!2250) (and (or (= mask!2250 #b00000000000000000000000000000111) (= mask!2250 #b00000000000000000000000000001111) (= mask!2250 #b00000000000000000000000000011111) (= mask!2250 #b00000000000000000000000000111111) (= mask!2250 #b00000000000000000000000001111111) (= mask!2250 #b00000000000000000000000011111111) (= mask!2250 #b00000000000000000000000111111111) (= mask!2250 #b00000000000000000000001111111111) (= mask!2250 #b00000000000000000000011111111111) (= mask!2250 #b00000000000000000000111111111111) (= mask!2250 #b00000000000000000001111111111111) (= mask!2250 #b00000000000000000011111111111111) (= mask!2250 #b00000000000000000111111111111111) (= mask!2250 #b00000000000000001111111111111111) (= mask!2250 #b00000000000000011111111111111111) (= mask!2250 #b00000000000000111111111111111111) (= mask!2250 #b00000000000001111111111111111111) (= mask!2250 #b00000000000011111111111111111111) (= mask!2250 #b00000000000111111111111111111111) (= mask!2250 #b00000000001111111111111111111111) (= mask!2250 #b00000000011111111111111111111111) (= mask!2250 #b00000000111111111111111111111111) (= mask!2250 #b00000001111111111111111111111111) (= mask!2250 #b00000011111111111111111111111111) (= mask!2250 #b00000111111111111111111111111111) (= mask!2250 #b00001111111111111111111111111111) (= mask!2250 #b00011111111111111111111111111111) (= mask!2250 #b00111111111111111111111111111111)) (bvsle mask!2250 #b00111111111111111111111111111111)))))

(assert (=> start!960 d!849))

(declare-fun d!851 () Bool)

(assert (=> d!851 (= (array_inv!269 _values!1492) (bvsge (size!425 _values!1492) #b00000000000000000000000000000000))))

(assert (=> start!960 d!851))

(declare-fun d!853 () Bool)

(assert (=> d!853 (= (array_inv!270 _keys!1806) (bvsge (size!426 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> start!960 d!853))

(declare-fun d!855 () Bool)

(declare-fun e!4745 () Bool)

(assert (=> d!855 e!4745))

(declare-fun res!7927 () Bool)

(assert (=> d!855 (=> res!7927 e!4745)))

(declare-fun lt!1694 () Bool)

(assert (=> d!855 (= res!7927 (not lt!1694))))

(declare-fun lt!1695 () Bool)

(assert (=> d!855 (= lt!1694 lt!1695)))

(declare-fun lt!1693 () Unit!159)

(declare-fun e!4744 () Unit!159)

(assert (=> d!855 (= lt!1693 e!4744)))

(declare-fun c!599 () Bool)

(assert (=> d!855 (= c!599 lt!1695)))

(declare-fun containsKey!6 (List!250 (_ BitVec 64)) Bool)

(assert (=> d!855 (= lt!1695 (containsKey!6 (toList!137 (getCurrentListMap!96 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(assert (=> d!855 (= (contains!112 (getCurrentListMap!96 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278) lt!1694)))

(declare-fun b!8356 () Bool)

(declare-fun lt!1692 () Unit!159)

(assert (=> b!8356 (= e!4744 lt!1692)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!6 (List!250 (_ BitVec 64)) Unit!159)

(assert (=> b!8356 (= lt!1692 (lemmaContainsKeyImpliesGetValueByKeyDefined!6 (toList!137 (getCurrentListMap!96 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(declare-datatypes ((Option!18 0))(
  ( (Some!17 (v!1305 V!725)) (None!16) )
))
(declare-fun isDefined!7 (Option!18) Bool)

(declare-fun getValueByKey!12 (List!250 (_ BitVec 64)) Option!18)

(assert (=> b!8356 (isDefined!7 (getValueByKey!12 (toList!137 (getCurrentListMap!96 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(declare-fun b!8357 () Bool)

(declare-fun Unit!163 () Unit!159)

(assert (=> b!8357 (= e!4744 Unit!163)))

(declare-fun b!8358 () Bool)

(assert (=> b!8358 (= e!4745 (isDefined!7 (getValueByKey!12 (toList!137 (getCurrentListMap!96 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278)))))

(assert (= (and d!855 c!599) b!8356))

(assert (= (and d!855 (not c!599)) b!8357))

(assert (= (and d!855 (not res!7927)) b!8358))

(declare-fun m!5141 () Bool)

(assert (=> d!855 m!5141))

(declare-fun m!5143 () Bool)

(assert (=> b!8356 m!5143))

(declare-fun m!5145 () Bool)

(assert (=> b!8356 m!5145))

(assert (=> b!8356 m!5145))

(declare-fun m!5147 () Bool)

(assert (=> b!8356 m!5147))

(assert (=> b!8358 m!5145))

(assert (=> b!8358 m!5145))

(assert (=> b!8358 m!5147))

(assert (=> b!8267 d!855))

(declare-fun b!8401 () Bool)

(declare-fun e!4782 () Unit!159)

(declare-fun Unit!164 () Unit!159)

(assert (=> b!8401 (= e!4782 Unit!164)))

(declare-fun b!8402 () Bool)

(declare-fun e!4776 () ListLongMap!243)

(declare-fun call!206 () ListLongMap!243)

(assert (=> b!8402 (= e!4776 call!206)))

(declare-fun b!8403 () Bool)

(declare-fun e!4775 () ListLongMap!243)

(declare-fun call!205 () ListLongMap!243)

(assert (=> b!8403 (= e!4775 call!205)))

(declare-fun b!8404 () Bool)

(declare-fun e!4772 () Bool)

(declare-fun e!4783 () Bool)

(assert (=> b!8404 (= e!4772 e!4783)))

(declare-fun res!7950 () Bool)

(declare-fun call!209 () Bool)

(assert (=> b!8404 (= res!7950 call!209)))

(assert (=> b!8404 (=> (not res!7950) (not e!4783))))

(declare-fun bm!200 () Bool)

(declare-fun call!208 () ListLongMap!243)

(declare-fun call!207 () ListLongMap!243)

(assert (=> bm!200 (= call!208 call!207)))

(declare-fun b!8405 () Bool)

(declare-fun e!4774 () Bool)

(assert (=> b!8405 (= e!4774 (validKeyInArray!0 (select (arr!364 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!8406 () Bool)

(declare-fun res!7953 () Bool)

(declare-fun e!4773 () Bool)

(assert (=> b!8406 (=> (not res!7953) (not e!4773))))

(assert (=> b!8406 (= res!7953 e!4772)))

(declare-fun c!616 () Bool)

(assert (=> b!8406 (= c!616 (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!8407 () Bool)

(declare-fun lt!1749 () Unit!159)

(assert (=> b!8407 (= e!4782 lt!1749)))

(declare-fun lt!1755 () ListLongMap!243)

(declare-fun getCurrentListMapNoExtraKeys!6 (array!753 array!751 (_ BitVec 32) (_ BitVec 32) V!725 V!725 (_ BitVec 32) Int) ListLongMap!243)

(assert (=> b!8407 (= lt!1755 (getCurrentListMapNoExtraKeys!6 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!1751 () (_ BitVec 64))

(assert (=> b!8407 (= lt!1751 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!1757 () (_ BitVec 64))

(assert (=> b!8407 (= lt!1757 (select (arr!364 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!1746 () Unit!159)

(declare-fun addStillContains!7 (ListLongMap!243 (_ BitVec 64) V!725 (_ BitVec 64)) Unit!159)

(assert (=> b!8407 (= lt!1746 (addStillContains!7 lt!1755 lt!1751 zeroValue!1434 lt!1757))))

(declare-fun +!9 (ListLongMap!243 tuple2!238) ListLongMap!243)

(assert (=> b!8407 (contains!112 (+!9 lt!1755 (tuple2!239 lt!1751 zeroValue!1434)) lt!1757)))

(declare-fun lt!1752 () Unit!159)

(assert (=> b!8407 (= lt!1752 lt!1746)))

(declare-fun lt!1760 () ListLongMap!243)

(assert (=> b!8407 (= lt!1760 (getCurrentListMapNoExtraKeys!6 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!1748 () (_ BitVec 64))

(assert (=> b!8407 (= lt!1748 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!1742 () (_ BitVec 64))

(assert (=> b!8407 (= lt!1742 (select (arr!364 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!1750 () Unit!159)

(declare-fun addApplyDifferent!7 (ListLongMap!243 (_ BitVec 64) V!725 (_ BitVec 64)) Unit!159)

(assert (=> b!8407 (= lt!1750 (addApplyDifferent!7 lt!1760 lt!1748 minValue!1434 lt!1742))))

(declare-fun apply!22 (ListLongMap!243 (_ BitVec 64)) V!725)

(assert (=> b!8407 (= (apply!22 (+!9 lt!1760 (tuple2!239 lt!1748 minValue!1434)) lt!1742) (apply!22 lt!1760 lt!1742))))

(declare-fun lt!1747 () Unit!159)

(assert (=> b!8407 (= lt!1747 lt!1750)))

(declare-fun lt!1741 () ListLongMap!243)

(assert (=> b!8407 (= lt!1741 (getCurrentListMapNoExtraKeys!6 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!1744 () (_ BitVec 64))

(assert (=> b!8407 (= lt!1744 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!1754 () (_ BitVec 64))

(assert (=> b!8407 (= lt!1754 (select (arr!364 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!1753 () Unit!159)

(assert (=> b!8407 (= lt!1753 (addApplyDifferent!7 lt!1741 lt!1744 zeroValue!1434 lt!1754))))

(assert (=> b!8407 (= (apply!22 (+!9 lt!1741 (tuple2!239 lt!1744 zeroValue!1434)) lt!1754) (apply!22 lt!1741 lt!1754))))

(declare-fun lt!1761 () Unit!159)

(assert (=> b!8407 (= lt!1761 lt!1753)))

(declare-fun lt!1745 () ListLongMap!243)

(assert (=> b!8407 (= lt!1745 (getCurrentListMapNoExtraKeys!6 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!1756 () (_ BitVec 64))

(assert (=> b!8407 (= lt!1756 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!1743 () (_ BitVec 64))

(assert (=> b!8407 (= lt!1743 (select (arr!364 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> b!8407 (= lt!1749 (addApplyDifferent!7 lt!1745 lt!1756 minValue!1434 lt!1743))))

(assert (=> b!8407 (= (apply!22 (+!9 lt!1745 (tuple2!239 lt!1756 minValue!1434)) lt!1743) (apply!22 lt!1745 lt!1743))))

(declare-fun b!8408 () Bool)

(assert (=> b!8408 (= e!4772 (not call!209))))

(declare-fun b!8409 () Bool)

(declare-fun e!4779 () Bool)

(declare-fun e!4784 () Bool)

(assert (=> b!8409 (= e!4779 e!4784)))

(declare-fun res!7954 () Bool)

(assert (=> b!8409 (=> (not res!7954) (not e!4784))))

(declare-fun lt!1758 () ListLongMap!243)

(assert (=> b!8409 (= res!7954 (contains!112 lt!1758 (select (arr!364 _keys!1806) #b00000000000000000000000000000000)))))

(assert (=> b!8409 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!426 _keys!1806)))))

(declare-fun b!8411 () Bool)

(declare-fun c!617 () Bool)

(assert (=> b!8411 (= c!617 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!8411 (= e!4776 e!4775)))

(declare-fun b!8412 () Bool)

(declare-fun e!4781 () Bool)

(declare-fun e!4780 () Bool)

(assert (=> b!8412 (= e!4781 e!4780)))

(declare-fun res!7946 () Bool)

(declare-fun call!203 () Bool)

(assert (=> b!8412 (= res!7946 call!203)))

(assert (=> b!8412 (=> (not res!7946) (not e!4780))))

(declare-fun b!8413 () Bool)

(assert (=> b!8413 (= e!4775 call!206)))

(declare-fun bm!201 () Bool)

(assert (=> bm!201 (= call!203 (contains!112 lt!1758 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!8414 () Bool)

(declare-fun e!4778 () ListLongMap!243)

(declare-fun call!204 () ListLongMap!243)

(assert (=> b!8414 (= e!4778 (+!9 call!204 (tuple2!239 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1434)))))

(declare-fun bm!202 () Bool)

(assert (=> bm!202 (= call!207 (getCurrentListMapNoExtraKeys!6 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun bm!203 () Bool)

(assert (=> bm!203 (= call!209 (contains!112 lt!1758 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!8415 () Bool)

(assert (=> b!8415 (= e!4783 (= (apply!22 lt!1758 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1434))))

(declare-fun bm!204 () Bool)

(assert (=> bm!204 (= call!205 call!208)))

(declare-fun b!8416 () Bool)

(declare-fun res!7947 () Bool)

(assert (=> b!8416 (=> (not res!7947) (not e!4773))))

(assert (=> b!8416 (= res!7947 e!4779)))

(declare-fun res!7952 () Bool)

(assert (=> b!8416 (=> res!7952 e!4779)))

(declare-fun e!4777 () Bool)

(assert (=> b!8416 (= res!7952 (not e!4777))))

(declare-fun res!7951 () Bool)

(assert (=> b!8416 (=> (not res!7951) (not e!4777))))

(assert (=> b!8416 (= res!7951 (bvslt #b00000000000000000000000000000000 (size!426 _keys!1806)))))

(declare-fun c!614 () Bool)

(declare-fun bm!205 () Bool)

(declare-fun c!613 () Bool)

(assert (=> bm!205 (= call!204 (+!9 (ite c!614 call!207 (ite c!613 call!208 call!205)) (ite (or c!614 c!613) (tuple2!239 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1434) (tuple2!239 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1434))))))

(declare-fun b!8417 () Bool)

(assert (=> b!8417 (= e!4777 (validKeyInArray!0 (select (arr!364 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!8418 () Bool)

(assert (=> b!8418 (= e!4780 (= (apply!22 lt!1758 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1434))))

(declare-fun b!8419 () Bool)

(assert (=> b!8419 (= e!4778 e!4776)))

(assert (=> b!8419 (= c!613 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!8420 () Bool)

(declare-fun get!160 (ValueCell!189 V!725) V!725)

(declare-fun dynLambda!44 (Int (_ BitVec 64)) V!725)

(assert (=> b!8420 (= e!4784 (= (apply!22 lt!1758 (select (arr!364 _keys!1806) #b00000000000000000000000000000000)) (get!160 (select (arr!363 _values!1492) #b00000000000000000000000000000000) (dynLambda!44 defaultEntry!1495 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!8420 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!425 _values!1492)))))

(assert (=> b!8420 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!426 _keys!1806)))))

(declare-fun d!857 () Bool)

(assert (=> d!857 e!4773))

(declare-fun res!7948 () Bool)

(assert (=> d!857 (=> (not res!7948) (not e!4773))))

(assert (=> d!857 (= res!7948 (or (bvsge #b00000000000000000000000000000000 (size!426 _keys!1806)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!426 _keys!1806)))))))

(declare-fun lt!1740 () ListLongMap!243)

(assert (=> d!857 (= lt!1758 lt!1740)))

(declare-fun lt!1759 () Unit!159)

(assert (=> d!857 (= lt!1759 e!4782)))

(declare-fun c!612 () Bool)

(assert (=> d!857 (= c!612 e!4774)))

(declare-fun res!7949 () Bool)

(assert (=> d!857 (=> (not res!7949) (not e!4774))))

(assert (=> d!857 (= res!7949 (bvslt #b00000000000000000000000000000000 (size!426 _keys!1806)))))

(assert (=> d!857 (= lt!1740 e!4778)))

(assert (=> d!857 (= c!614 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!857 (validMask!0 mask!2250)))

(assert (=> d!857 (= (getCurrentListMap!96 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) lt!1758)))

(declare-fun b!8410 () Bool)

(assert (=> b!8410 (= e!4773 e!4781)))

(declare-fun c!615 () Bool)

(assert (=> b!8410 (= c!615 (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!206 () Bool)

(assert (=> bm!206 (= call!206 call!204)))

(declare-fun b!8421 () Bool)

(assert (=> b!8421 (= e!4781 (not call!203))))

(assert (= (and d!857 c!614) b!8414))

(assert (= (and d!857 (not c!614)) b!8419))

(assert (= (and b!8419 c!613) b!8402))

(assert (= (and b!8419 (not c!613)) b!8411))

(assert (= (and b!8411 c!617) b!8413))

(assert (= (and b!8411 (not c!617)) b!8403))

(assert (= (or b!8413 b!8403) bm!204))

(assert (= (or b!8402 bm!204) bm!200))

(assert (= (or b!8402 b!8413) bm!206))

(assert (= (or b!8414 bm!200) bm!202))

(assert (= (or b!8414 bm!206) bm!205))

(assert (= (and d!857 res!7949) b!8405))

(assert (= (and d!857 c!612) b!8407))

(assert (= (and d!857 (not c!612)) b!8401))

(assert (= (and d!857 res!7948) b!8416))

(assert (= (and b!8416 res!7951) b!8417))

(assert (= (and b!8416 (not res!7952)) b!8409))

(assert (= (and b!8409 res!7954) b!8420))

(assert (= (and b!8416 res!7947) b!8406))

(assert (= (and b!8406 c!616) b!8404))

(assert (= (and b!8406 (not c!616)) b!8408))

(assert (= (and b!8404 res!7950) b!8415))

(assert (= (or b!8404 b!8408) bm!203))

(assert (= (and b!8406 res!7953) b!8410))

(assert (= (and b!8410 c!615) b!8412))

(assert (= (and b!8410 (not c!615)) b!8421))

(assert (= (and b!8412 res!7946) b!8418))

(assert (= (or b!8412 b!8421) bm!201))

(declare-fun b_lambda!339 () Bool)

(assert (=> (not b_lambda!339) (not b!8420)))

(declare-fun t!2391 () Bool)

(declare-fun tb!137 () Bool)

(assert (=> (and start!960 (= defaultEntry!1495 defaultEntry!1495) t!2391) tb!137))

(declare-fun result!213 () Bool)

(assert (=> tb!137 (= result!213 tp_is_empty!411)))

(assert (=> b!8420 t!2391))

(declare-fun b_and!485 () Bool)

(assert (= b_and!481 (and (=> t!2391 result!213) b_and!485)))

(declare-fun m!5149 () Bool)

(assert (=> b!8415 m!5149))

(declare-fun m!5151 () Bool)

(assert (=> b!8414 m!5151))

(declare-fun m!5153 () Bool)

(assert (=> bm!201 m!5153))

(assert (=> b!8405 m!5117))

(assert (=> b!8405 m!5117))

(assert (=> b!8405 m!5127))

(declare-fun m!5155 () Bool)

(assert (=> b!8407 m!5155))

(declare-fun m!5157 () Bool)

(assert (=> b!8407 m!5157))

(declare-fun m!5159 () Bool)

(assert (=> b!8407 m!5159))

(declare-fun m!5161 () Bool)

(assert (=> b!8407 m!5161))

(declare-fun m!5163 () Bool)

(assert (=> b!8407 m!5163))

(declare-fun m!5165 () Bool)

(assert (=> b!8407 m!5165))

(declare-fun m!5167 () Bool)

(assert (=> b!8407 m!5167))

(declare-fun m!5169 () Bool)

(assert (=> b!8407 m!5169))

(declare-fun m!5171 () Bool)

(assert (=> b!8407 m!5171))

(assert (=> b!8407 m!5163))

(declare-fun m!5173 () Bool)

(assert (=> b!8407 m!5173))

(assert (=> b!8407 m!5171))

(declare-fun m!5175 () Bool)

(assert (=> b!8407 m!5175))

(declare-fun m!5177 () Bool)

(assert (=> b!8407 m!5177))

(declare-fun m!5179 () Bool)

(assert (=> b!8407 m!5179))

(assert (=> b!8407 m!5159))

(assert (=> b!8407 m!5155))

(declare-fun m!5181 () Bool)

(assert (=> b!8407 m!5181))

(assert (=> b!8407 m!5117))

(declare-fun m!5183 () Bool)

(assert (=> b!8407 m!5183))

(declare-fun m!5185 () Bool)

(assert (=> b!8407 m!5185))

(assert (=> d!857 m!5087))

(declare-fun m!5187 () Bool)

(assert (=> b!8418 m!5187))

(assert (=> b!8417 m!5117))

(assert (=> b!8417 m!5117))

(assert (=> b!8417 m!5127))

(assert (=> b!8409 m!5117))

(assert (=> b!8409 m!5117))

(declare-fun m!5189 () Bool)

(assert (=> b!8409 m!5189))

(declare-fun m!5191 () Bool)

(assert (=> bm!203 m!5191))

(assert (=> b!8420 m!5117))

(declare-fun m!5193 () Bool)

(assert (=> b!8420 m!5193))

(declare-fun m!5195 () Bool)

(assert (=> b!8420 m!5195))

(assert (=> b!8420 m!5117))

(declare-fun m!5197 () Bool)

(assert (=> b!8420 m!5197))

(assert (=> b!8420 m!5195))

(assert (=> b!8420 m!5193))

(declare-fun m!5199 () Bool)

(assert (=> b!8420 m!5199))

(assert (=> bm!202 m!5165))

(declare-fun m!5201 () Bool)

(assert (=> bm!205 m!5201))

(assert (=> b!8267 d!857))

(declare-fun mapNonEmpty!596 () Bool)

(declare-fun mapRes!596 () Bool)

(declare-fun tp!1241 () Bool)

(declare-fun e!4789 () Bool)

(assert (=> mapNonEmpty!596 (= mapRes!596 (and tp!1241 e!4789))))

(declare-fun mapRest!596 () (Array (_ BitVec 32) ValueCell!189))

(declare-fun mapKey!596 () (_ BitVec 32))

(declare-fun mapValue!596 () ValueCell!189)

(assert (=> mapNonEmpty!596 (= mapRest!590 (store mapRest!596 mapKey!596 mapValue!596))))

(declare-fun mapIsEmpty!596 () Bool)

(assert (=> mapIsEmpty!596 mapRes!596))

(declare-fun b!8431 () Bool)

(declare-fun e!4790 () Bool)

(assert (=> b!8431 (= e!4790 tp_is_empty!411)))

(declare-fun b!8430 () Bool)

(assert (=> b!8430 (= e!4789 tp_is_empty!411)))

(declare-fun condMapEmpty!596 () Bool)

(declare-fun mapDefault!596 () ValueCell!189)

(assert (=> mapNonEmpty!590 (= condMapEmpty!596 (= mapRest!590 ((as const (Array (_ BitVec 32) ValueCell!189)) mapDefault!596)))))

(assert (=> mapNonEmpty!590 (= tp!1232 (and e!4790 mapRes!596))))

(assert (= (and mapNonEmpty!590 condMapEmpty!596) mapIsEmpty!596))

(assert (= (and mapNonEmpty!590 (not condMapEmpty!596)) mapNonEmpty!596))

(assert (= (and mapNonEmpty!596 ((_ is ValueCellFull!189) mapValue!596)) b!8430))

(assert (= (and mapNonEmpty!590 ((_ is ValueCellFull!189) mapDefault!596)) b!8431))

(declare-fun m!5203 () Bool)

(assert (=> mapNonEmpty!596 m!5203))

(declare-fun b_lambda!341 () Bool)

(assert (= b_lambda!339 (or (and start!960 b_free!333) b_lambda!341)))

(check-sat (not bm!202) (not b!8407) (not bm!185) (not b!8328) b_and!485 (not bm!203) (not b_lambda!341) (not b!8330) (not b!8356) (not b!8315) tp_is_empty!411 (not b!8415) (not d!839) (not b!8405) (not b_next!333) (not d!855) (not bm!205) (not b!8349) (not bm!201) (not b!8409) (not b!8420) (not b!8358) (not b!8414) (not b!8348) (not b!8310) (not d!857) (not b!8337) (not bm!182) (not b!8331) (not b!8417) (not b!8418) (not mapNonEmpty!596))
(check-sat b_and!485 (not b_next!333))

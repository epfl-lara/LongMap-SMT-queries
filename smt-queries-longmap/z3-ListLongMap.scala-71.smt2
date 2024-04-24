; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!958 () Bool)

(assert start!958)

(declare-fun b_free!331 () Bool)

(declare-fun b_next!331 () Bool)

(assert (=> start!958 (= b_free!331 (not b_next!331))))

(declare-fun tp!1226 () Bool)

(declare-fun b_and!479 () Bool)

(assert (=> start!958 (= tp!1226 b_and!479)))

(declare-fun res!7859 () Bool)

(declare-fun e!4662 () Bool)

(assert (=> start!958 (=> (not res!7859) (not e!4662))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!958 (= res!7859 (validMask!0 mask!2250))))

(assert (=> start!958 e!4662))

(assert (=> start!958 tp!1226))

(assert (=> start!958 true))

(declare-datatypes ((V!723 0))(
  ( (V!724 (val!210 Int)) )
))
(declare-datatypes ((ValueCell!188 0))(
  ( (ValueCellFull!188 (v!1302 V!723)) (EmptyCell!188) )
))
(declare-datatypes ((array!733 0))(
  ( (array!734 (arr!354 (Array (_ BitVec 32) ValueCell!188)) (size!416 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!733)

(declare-fun e!4661 () Bool)

(declare-fun array_inv!261 (array!733) Bool)

(assert (=> start!958 (and (array_inv!261 _values!1492) e!4661)))

(declare-fun tp_is_empty!409 () Bool)

(assert (=> start!958 tp_is_empty!409))

(declare-datatypes ((array!735 0))(
  ( (array!736 (arr!355 (Array (_ BitVec 32) (_ BitVec 64))) (size!417 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!735)

(declare-fun array_inv!262 (array!735) Bool)

(assert (=> start!958 (array_inv!262 _keys!1806)))

(declare-fun b!8221 () Bool)

(declare-fun e!4663 () Bool)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!735 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!8221 (= e!4663 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!587 () Bool)

(declare-fun mapRes!587 () Bool)

(declare-fun tp!1225 () Bool)

(declare-fun e!4658 () Bool)

(assert (=> mapNonEmpty!587 (= mapRes!587 (and tp!1225 e!4658))))

(declare-fun mapKey!587 () (_ BitVec 32))

(declare-fun mapRest!587 () (Array (_ BitVec 32) ValueCell!188))

(declare-fun mapValue!587 () ValueCell!188)

(assert (=> mapNonEmpty!587 (= (arr!354 _values!1492) (store mapRest!587 mapKey!587 mapValue!587))))

(declare-fun b!8222 () Bool)

(declare-fun res!7861 () Bool)

(assert (=> b!8222 (=> (not res!7861) (not e!4662))))

(declare-datatypes ((List!245 0))(
  ( (Nil!242) (Cons!241 (h!807 (_ BitVec 64)) (t!2382 List!245)) )
))
(declare-fun arrayNoDuplicates!0 (array!735 (_ BitVec 32) List!245) Bool)

(assert (=> b!8222 (= res!7861 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!242))))

(declare-fun mapIsEmpty!587 () Bool)

(assert (=> mapIsEmpty!587 mapRes!587))

(declare-fun b!8223 () Bool)

(declare-fun res!7856 () Bool)

(assert (=> b!8223 (=> (not res!7856) (not e!4662))))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!8223 (= res!7856 (and (= (size!416 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!417 _keys!1806) (size!416 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!8224 () Bool)

(declare-fun e!4660 () Bool)

(assert (=> b!8224 (= e!4660 (or (not (= (size!417 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250))) (bvsle #b00000000000000000000000000000000 (size!417 _keys!1806))))))

(declare-fun lt!1655 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!735 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!8224 (= lt!1655 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!8225 () Bool)

(assert (=> b!8225 (= e!4658 tp_is_empty!409)))

(declare-fun b!8226 () Bool)

(declare-fun res!7855 () Bool)

(assert (=> b!8226 (=> (not res!7855) (not e!4662))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!8226 (= res!7855 (validKeyInArray!0 k0!1278))))

(declare-fun b!8227 () Bool)

(declare-fun res!7857 () Bool)

(assert (=> b!8227 (=> (not res!7857) (not e!4662))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!735 (_ BitVec 32)) Bool)

(assert (=> b!8227 (= res!7857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!8228 () Bool)

(assert (=> b!8228 (= e!4662 (not e!4660))))

(declare-fun res!7860 () Bool)

(assert (=> b!8228 (=> res!7860 e!4660)))

(assert (=> b!8228 (= res!7860 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(assert (=> b!8228 e!4663))

(declare-fun c!578 () Bool)

(assert (=> b!8228 (= c!578 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!723)

(declare-fun zeroValue!1434 () V!723)

(declare-datatypes ((Unit!159 0))(
  ( (Unit!160) )
))
(declare-fun lt!1656 () Unit!159)

(declare-fun lemmaKeyInListMapIsInArray!61 (array!735 array!733 (_ BitVec 32) (_ BitVec 32) V!723 V!723 (_ BitVec 64) Int) Unit!159)

(assert (=> b!8228 (= lt!1656 (lemmaKeyInListMapIsInArray!61 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!8229 () Bool)

(assert (=> b!8229 (= e!4663 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!8230 () Bool)

(declare-fun e!4659 () Bool)

(assert (=> b!8230 (= e!4659 tp_is_empty!409)))

(declare-fun b!8231 () Bool)

(declare-fun res!7858 () Bool)

(assert (=> b!8231 (=> (not res!7858) (not e!4662))))

(declare-datatypes ((tuple2!234 0))(
  ( (tuple2!235 (_1!117 (_ BitVec 64)) (_2!117 V!723)) )
))
(declare-datatypes ((List!246 0))(
  ( (Nil!243) (Cons!242 (h!808 tuple2!234) (t!2383 List!246)) )
))
(declare-datatypes ((ListLongMap!239 0))(
  ( (ListLongMap!240 (toList!135 List!246)) )
))
(declare-fun contains!110 (ListLongMap!239 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!94 (array!735 array!733 (_ BitVec 32) (_ BitVec 32) V!723 V!723 (_ BitVec 32) Int) ListLongMap!239)

(assert (=> b!8231 (= res!7858 (contains!110 (getCurrentListMap!94 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!8232 () Bool)

(assert (=> b!8232 (= e!4661 (and e!4659 mapRes!587))))

(declare-fun condMapEmpty!587 () Bool)

(declare-fun mapDefault!587 () ValueCell!188)

(assert (=> b!8232 (= condMapEmpty!587 (= (arr!354 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!188)) mapDefault!587)))))

(assert (= (and start!958 res!7859) b!8223))

(assert (= (and b!8223 res!7856) b!8227))

(assert (= (and b!8227 res!7857) b!8222))

(assert (= (and b!8222 res!7861) b!8231))

(assert (= (and b!8231 res!7858) b!8226))

(assert (= (and b!8226 res!7855) b!8228))

(assert (= (and b!8228 c!578) b!8221))

(assert (= (and b!8228 (not c!578)) b!8229))

(assert (= (and b!8228 (not res!7860)) b!8224))

(assert (= (and b!8232 condMapEmpty!587) mapIsEmpty!587))

(assert (= (and b!8232 (not condMapEmpty!587)) mapNonEmpty!587))

(get-info :version)

(assert (= (and mapNonEmpty!587 ((_ is ValueCellFull!188) mapValue!587)) b!8225))

(assert (= (and b!8232 ((_ is ValueCellFull!188) mapDefault!587)) b!8230))

(assert (= start!958 b!8232))

(declare-fun m!5045 () Bool)

(assert (=> b!8224 m!5045))

(declare-fun m!5047 () Bool)

(assert (=> mapNonEmpty!587 m!5047))

(declare-fun m!5049 () Bool)

(assert (=> b!8222 m!5049))

(declare-fun m!5051 () Bool)

(assert (=> b!8231 m!5051))

(assert (=> b!8231 m!5051))

(declare-fun m!5053 () Bool)

(assert (=> b!8231 m!5053))

(declare-fun m!5055 () Bool)

(assert (=> start!958 m!5055))

(declare-fun m!5057 () Bool)

(assert (=> start!958 m!5057))

(declare-fun m!5059 () Bool)

(assert (=> start!958 m!5059))

(declare-fun m!5061 () Bool)

(assert (=> b!8226 m!5061))

(declare-fun m!5063 () Bool)

(assert (=> b!8228 m!5063))

(declare-fun m!5065 () Bool)

(assert (=> b!8228 m!5065))

(declare-fun m!5067 () Bool)

(assert (=> b!8227 m!5067))

(assert (=> b!8221 m!5063))

(check-sat (not start!958) (not b!8227) (not b!8222) b_and!479 (not mapNonEmpty!587) (not b!8224) (not b!8228) tp_is_empty!409 (not b!8221) (not b_next!331) (not b!8231) (not b!8226))
(check-sat b_and!479 (not b_next!331))
(get-model)

(declare-fun d!837 () Bool)

(declare-fun res!7909 () Bool)

(declare-fun e!4715 () Bool)

(assert (=> d!837 (=> res!7909 e!4715)))

(assert (=> d!837 (= res!7909 (bvsge #b00000000000000000000000000000000 (size!417 _keys!1806)))))

(assert (=> d!837 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250) e!4715)))

(declare-fun b!8313 () Bool)

(declare-fun e!4714 () Bool)

(declare-fun call!185 () Bool)

(assert (=> b!8313 (= e!4714 call!185)))

(declare-fun b!8314 () Bool)

(declare-fun e!4713 () Bool)

(assert (=> b!8314 (= e!4715 e!4713)))

(declare-fun c!587 () Bool)

(assert (=> b!8314 (= c!587 (validKeyInArray!0 (select (arr!355 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun bm!182 () Bool)

(assert (=> bm!182 (= call!185 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1806 mask!2250))))

(declare-fun b!8315 () Bool)

(assert (=> b!8315 (= e!4713 call!185)))

(declare-fun b!8316 () Bool)

(assert (=> b!8316 (= e!4713 e!4714)))

(declare-fun lt!1676 () (_ BitVec 64))

(assert (=> b!8316 (= lt!1676 (select (arr!355 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!1677 () Unit!159)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!735 (_ BitVec 64) (_ BitVec 32)) Unit!159)

(assert (=> b!8316 (= lt!1677 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1806 lt!1676 #b00000000000000000000000000000000))))

(assert (=> b!8316 (arrayContainsKey!0 _keys!1806 lt!1676 #b00000000000000000000000000000000)))

(declare-fun lt!1675 () Unit!159)

(assert (=> b!8316 (= lt!1675 lt!1677)))

(declare-fun res!7908 () Bool)

(declare-datatypes ((SeekEntryResult!33 0))(
  ( (MissingZero!33 (index!2251 (_ BitVec 32))) (Found!33 (index!2252 (_ BitVec 32))) (Intermediate!33 (undefined!845 Bool) (index!2253 (_ BitVec 32)) (x!2711 (_ BitVec 32))) (Undefined!33) (MissingVacant!33 (index!2254 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!735 (_ BitVec 32)) SeekEntryResult!33)

(assert (=> b!8316 (= res!7908 (= (seekEntryOrOpen!0 (select (arr!355 _keys!1806) #b00000000000000000000000000000000) _keys!1806 mask!2250) (Found!33 #b00000000000000000000000000000000)))))

(assert (=> b!8316 (=> (not res!7908) (not e!4714))))

(assert (= (and d!837 (not res!7909)) b!8314))

(assert (= (and b!8314 c!587) b!8316))

(assert (= (and b!8314 (not c!587)) b!8315))

(assert (= (and b!8316 res!7908) b!8313))

(assert (= (or b!8313 b!8315) bm!182))

(declare-fun m!5117 () Bool)

(assert (=> b!8314 m!5117))

(assert (=> b!8314 m!5117))

(declare-fun m!5119 () Bool)

(assert (=> b!8314 m!5119))

(declare-fun m!5121 () Bool)

(assert (=> bm!182 m!5121))

(assert (=> b!8316 m!5117))

(declare-fun m!5123 () Bool)

(assert (=> b!8316 m!5123))

(declare-fun m!5125 () Bool)

(assert (=> b!8316 m!5125))

(assert (=> b!8316 m!5117))

(declare-fun m!5127 () Bool)

(assert (=> b!8316 m!5127))

(assert (=> b!8227 d!837))

(declare-fun d!839 () Bool)

(declare-fun res!7918 () Bool)

(declare-fun e!4725 () Bool)

(assert (=> d!839 (=> res!7918 e!4725)))

(assert (=> d!839 (= res!7918 (bvsge #b00000000000000000000000000000000 (size!417 _keys!1806)))))

(assert (=> d!839 (= (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!242) e!4725)))

(declare-fun b!8327 () Bool)

(declare-fun e!4727 () Bool)

(declare-fun e!4724 () Bool)

(assert (=> b!8327 (= e!4727 e!4724)))

(declare-fun c!590 () Bool)

(assert (=> b!8327 (= c!590 (validKeyInArray!0 (select (arr!355 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun bm!185 () Bool)

(declare-fun call!188 () Bool)

(assert (=> bm!185 (= call!188 (arrayNoDuplicates!0 _keys!1806 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!590 (Cons!241 (select (arr!355 _keys!1806) #b00000000000000000000000000000000) Nil!242) Nil!242)))))

(declare-fun b!8328 () Bool)

(assert (=> b!8328 (= e!4725 e!4727)))

(declare-fun res!7916 () Bool)

(assert (=> b!8328 (=> (not res!7916) (not e!4727))))

(declare-fun e!4726 () Bool)

(assert (=> b!8328 (= res!7916 (not e!4726))))

(declare-fun res!7917 () Bool)

(assert (=> b!8328 (=> (not res!7917) (not e!4726))))

(assert (=> b!8328 (= res!7917 (validKeyInArray!0 (select (arr!355 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!8329 () Bool)

(assert (=> b!8329 (= e!4724 call!188)))

(declare-fun b!8330 () Bool)

(assert (=> b!8330 (= e!4724 call!188)))

(declare-fun b!8331 () Bool)

(declare-fun contains!112 (List!245 (_ BitVec 64)) Bool)

(assert (=> b!8331 (= e!4726 (contains!112 Nil!242 (select (arr!355 _keys!1806) #b00000000000000000000000000000000)))))

(assert (= (and d!839 (not res!7918)) b!8328))

(assert (= (and b!8328 res!7917) b!8331))

(assert (= (and b!8328 res!7916) b!8327))

(assert (= (and b!8327 c!590) b!8330))

(assert (= (and b!8327 (not c!590)) b!8329))

(assert (= (or b!8330 b!8329) bm!185))

(assert (=> b!8327 m!5117))

(assert (=> b!8327 m!5117))

(assert (=> b!8327 m!5119))

(assert (=> bm!185 m!5117))

(declare-fun m!5129 () Bool)

(assert (=> bm!185 m!5129))

(assert (=> b!8328 m!5117))

(assert (=> b!8328 m!5117))

(assert (=> b!8328 m!5119))

(assert (=> b!8331 m!5117))

(assert (=> b!8331 m!5117))

(declare-fun m!5131 () Bool)

(assert (=> b!8331 m!5131))

(assert (=> b!8222 d!839))

(declare-fun d!841 () Bool)

(declare-fun res!7923 () Bool)

(declare-fun e!4732 () Bool)

(assert (=> d!841 (=> res!7923 e!4732)))

(assert (=> d!841 (= res!7923 (= (select (arr!355 _keys!1806) #b00000000000000000000000000000000) k0!1278))))

(assert (=> d!841 (= (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000) e!4732)))

(declare-fun b!8336 () Bool)

(declare-fun e!4733 () Bool)

(assert (=> b!8336 (= e!4732 e!4733)))

(declare-fun res!7924 () Bool)

(assert (=> b!8336 (=> (not res!7924) (not e!4733))))

(assert (=> b!8336 (= res!7924 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!417 _keys!1806)))))

(declare-fun b!8337 () Bool)

(assert (=> b!8337 (= e!4733 (arrayContainsKey!0 _keys!1806 k0!1278 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!841 (not res!7923)) b!8336))

(assert (= (and b!8336 res!7924) b!8337))

(assert (=> d!841 m!5117))

(declare-fun m!5133 () Bool)

(assert (=> b!8337 m!5133))

(assert (=> b!8228 d!841))

(declare-fun d!843 () Bool)

(declare-fun e!4736 () Bool)

(assert (=> d!843 e!4736))

(declare-fun c!593 () Bool)

(assert (=> d!843 (= c!593 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!1680 () Unit!159)

(declare-fun choose!140 (array!735 array!733 (_ BitVec 32) (_ BitVec 32) V!723 V!723 (_ BitVec 64) Int) Unit!159)

(assert (=> d!843 (= lt!1680 (choose!140 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(assert (=> d!843 (validMask!0 mask!2250)))

(assert (=> d!843 (= (lemmaKeyInListMapIsInArray!61 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495) lt!1680)))

(declare-fun b!8342 () Bool)

(assert (=> b!8342 (= e!4736 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!8343 () Bool)

(assert (=> b!8343 (= e!4736 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!843 c!593) b!8342))

(assert (= (and d!843 (not c!593)) b!8343))

(declare-fun m!5135 () Bool)

(assert (=> d!843 m!5135))

(assert (=> d!843 m!5055))

(assert (=> b!8342 m!5063))

(assert (=> b!8228 d!843))

(assert (=> b!8221 d!841))

(declare-fun d!845 () Bool)

(declare-fun lt!1683 () (_ BitVec 32))

(assert (=> d!845 (and (or (bvslt lt!1683 #b00000000000000000000000000000000) (bvsge lt!1683 (size!417 _keys!1806)) (and (bvsge lt!1683 #b00000000000000000000000000000000) (bvslt lt!1683 (size!417 _keys!1806)))) (bvsge lt!1683 #b00000000000000000000000000000000) (bvslt lt!1683 (size!417 _keys!1806)) (= (select (arr!355 _keys!1806) lt!1683) k0!1278))))

(declare-fun e!4739 () (_ BitVec 32))

(assert (=> d!845 (= lt!1683 e!4739)))

(declare-fun c!596 () Bool)

(assert (=> d!845 (= c!596 (= (select (arr!355 _keys!1806) #b00000000000000000000000000000000) k0!1278))))

(assert (=> d!845 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!417 _keys!1806)) (bvslt (size!417 _keys!1806) #b01111111111111111111111111111111))))

(assert (=> d!845 (= (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000) lt!1683)))

(declare-fun b!8348 () Bool)

(assert (=> b!8348 (= e!4739 #b00000000000000000000000000000000)))

(declare-fun b!8349 () Bool)

(assert (=> b!8349 (= e!4739 (arrayScanForKey!0 _keys!1806 k0!1278 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!845 c!596) b!8348))

(assert (= (and d!845 (not c!596)) b!8349))

(declare-fun m!5137 () Bool)

(assert (=> d!845 m!5137))

(assert (=> d!845 m!5117))

(declare-fun m!5139 () Bool)

(assert (=> b!8349 m!5139))

(assert (=> b!8224 d!845))

(declare-fun d!847 () Bool)

(assert (=> d!847 (= (validKeyInArray!0 k0!1278) (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!8226 d!847))

(declare-fun d!849 () Bool)

(declare-fun e!4745 () Bool)

(assert (=> d!849 e!4745))

(declare-fun res!7927 () Bool)

(assert (=> d!849 (=> res!7927 e!4745)))

(declare-fun lt!1693 () Bool)

(assert (=> d!849 (= res!7927 (not lt!1693))))

(declare-fun lt!1695 () Bool)

(assert (=> d!849 (= lt!1693 lt!1695)))

(declare-fun lt!1692 () Unit!159)

(declare-fun e!4744 () Unit!159)

(assert (=> d!849 (= lt!1692 e!4744)))

(declare-fun c!599 () Bool)

(assert (=> d!849 (= c!599 lt!1695)))

(declare-fun containsKey!6 (List!246 (_ BitVec 64)) Bool)

(assert (=> d!849 (= lt!1695 (containsKey!6 (toList!135 (getCurrentListMap!94 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(assert (=> d!849 (= (contains!110 (getCurrentListMap!94 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278) lt!1693)))

(declare-fun b!8356 () Bool)

(declare-fun lt!1694 () Unit!159)

(assert (=> b!8356 (= e!4744 lt!1694)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!6 (List!246 (_ BitVec 64)) Unit!159)

(assert (=> b!8356 (= lt!1694 (lemmaContainsKeyImpliesGetValueByKeyDefined!6 (toList!135 (getCurrentListMap!94 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(declare-datatypes ((Option!18 0))(
  ( (Some!17 (v!1305 V!723)) (None!16) )
))
(declare-fun isDefined!7 (Option!18) Bool)

(declare-fun getValueByKey!12 (List!246 (_ BitVec 64)) Option!18)

(assert (=> b!8356 (isDefined!7 (getValueByKey!12 (toList!135 (getCurrentListMap!94 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(declare-fun b!8357 () Bool)

(declare-fun Unit!163 () Unit!159)

(assert (=> b!8357 (= e!4744 Unit!163)))

(declare-fun b!8358 () Bool)

(assert (=> b!8358 (= e!4745 (isDefined!7 (getValueByKey!12 (toList!135 (getCurrentListMap!94 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278)))))

(assert (= (and d!849 c!599) b!8356))

(assert (= (and d!849 (not c!599)) b!8357))

(assert (= (and d!849 (not res!7927)) b!8358))

(declare-fun m!5141 () Bool)

(assert (=> d!849 m!5141))

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

(assert (=> b!8231 d!849))

(declare-fun b!8401 () Bool)

(declare-fun e!4775 () Bool)

(declare-fun e!4782 () Bool)

(assert (=> b!8401 (= e!4775 e!4782)))

(declare-fun res!7947 () Bool)

(assert (=> b!8401 (=> (not res!7947) (not e!4782))))

(declare-fun lt!1741 () ListLongMap!239)

(assert (=> b!8401 (= res!7947 (contains!110 lt!1741 (select (arr!355 _keys!1806) #b00000000000000000000000000000000)))))

(assert (=> b!8401 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!417 _keys!1806)))))

(declare-fun b!8402 () Bool)

(declare-fun e!4774 () ListLongMap!239)

(declare-fun call!203 () ListLongMap!239)

(assert (=> b!8402 (= e!4774 call!203)))

(declare-fun b!8403 () Bool)

(declare-fun e!4780 () Bool)

(declare-fun call!206 () Bool)

(assert (=> b!8403 (= e!4780 (not call!206))))

(declare-fun b!8404 () Bool)

(declare-fun e!4783 () Bool)

(assert (=> b!8404 (= e!4783 e!4780)))

(declare-fun c!616 () Bool)

(assert (=> b!8404 (= c!616 (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!8405 () Bool)

(declare-fun e!4778 () ListLongMap!239)

(declare-fun e!4781 () ListLongMap!239)

(assert (=> b!8405 (= e!4778 e!4781)))

(declare-fun c!617 () Bool)

(assert (=> b!8405 (= c!617 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!8406 () Bool)

(declare-fun res!7948 () Bool)

(assert (=> b!8406 (=> (not res!7948) (not e!4783))))

(assert (=> b!8406 (= res!7948 e!4775)))

(declare-fun res!7951 () Bool)

(assert (=> b!8406 (=> res!7951 e!4775)))

(declare-fun e!4784 () Bool)

(assert (=> b!8406 (= res!7951 (not e!4784))))

(declare-fun res!7950 () Bool)

(assert (=> b!8406 (=> (not res!7950) (not e!4784))))

(assert (=> b!8406 (= res!7950 (bvslt #b00000000000000000000000000000000 (size!417 _keys!1806)))))

(declare-fun b!8407 () Bool)

(declare-fun call!205 () ListLongMap!239)

(declare-fun +!9 (ListLongMap!239 tuple2!234) ListLongMap!239)

(assert (=> b!8407 (= e!4778 (+!9 call!205 (tuple2!235 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1434)))))

(declare-fun b!8408 () Bool)

(declare-fun e!4776 () Unit!159)

(declare-fun Unit!164 () Unit!159)

(assert (=> b!8408 (= e!4776 Unit!164)))

(declare-fun b!8409 () Bool)

(declare-fun e!4773 () Bool)

(declare-fun apply!22 (ListLongMap!239 (_ BitVec 64)) V!723)

(assert (=> b!8409 (= e!4773 (= (apply!22 lt!1741 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1434))))

(declare-fun c!612 () Bool)

(declare-fun call!209 () ListLongMap!239)

(declare-fun call!207 () ListLongMap!239)

(declare-fun bm!200 () Bool)

(assert (=> bm!200 (= call!205 (+!9 (ite c!612 call!207 (ite c!617 call!209 call!203)) (ite (or c!612 c!617) (tuple2!235 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1434) (tuple2!235 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1434))))))

(declare-fun b!8410 () Bool)

(declare-fun e!4779 () Bool)

(declare-fun call!204 () Bool)

(assert (=> b!8410 (= e!4779 (not call!204))))

(declare-fun b!8411 () Bool)

(declare-fun call!208 () ListLongMap!239)

(assert (=> b!8411 (= e!4781 call!208)))

(declare-fun b!8412 () Bool)

(declare-fun e!4772 () Bool)

(assert (=> b!8412 (= e!4772 (= (apply!22 lt!1741 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1434))))

(declare-fun bm!202 () Bool)

(assert (=> bm!202 (= call!204 (contains!110 lt!1741 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!203 () Bool)

(assert (=> bm!203 (= call!209 call!207)))

(declare-fun b!8413 () Bool)

(declare-fun e!4777 () Bool)

(assert (=> b!8413 (= e!4777 (validKeyInArray!0 (select (arr!355 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!8414 () Bool)

(assert (=> b!8414 (= e!4779 e!4773)))

(declare-fun res!7953 () Bool)

(assert (=> b!8414 (= res!7953 call!204)))

(assert (=> b!8414 (=> (not res!7953) (not e!4773))))

(declare-fun b!8415 () Bool)

(declare-fun lt!1754 () Unit!159)

(assert (=> b!8415 (= e!4776 lt!1754)))

(declare-fun lt!1759 () ListLongMap!239)

(declare-fun getCurrentListMapNoExtraKeys!6 (array!735 array!733 (_ BitVec 32) (_ BitVec 32) V!723 V!723 (_ BitVec 32) Int) ListLongMap!239)

(assert (=> b!8415 (= lt!1759 (getCurrentListMapNoExtraKeys!6 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!1751 () (_ BitVec 64))

(assert (=> b!8415 (= lt!1751 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!1756 () (_ BitVec 64))

(assert (=> b!8415 (= lt!1756 (select (arr!355 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!1761 () Unit!159)

(declare-fun addStillContains!7 (ListLongMap!239 (_ BitVec 64) V!723 (_ BitVec 64)) Unit!159)

(assert (=> b!8415 (= lt!1761 (addStillContains!7 lt!1759 lt!1751 zeroValue!1434 lt!1756))))

(assert (=> b!8415 (contains!110 (+!9 lt!1759 (tuple2!235 lt!1751 zeroValue!1434)) lt!1756)))

(declare-fun lt!1749 () Unit!159)

(assert (=> b!8415 (= lt!1749 lt!1761)))

(declare-fun lt!1755 () ListLongMap!239)

(assert (=> b!8415 (= lt!1755 (getCurrentListMapNoExtraKeys!6 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!1750 () (_ BitVec 64))

(assert (=> b!8415 (= lt!1750 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!1748 () (_ BitVec 64))

(assert (=> b!8415 (= lt!1748 (select (arr!355 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!1747 () Unit!159)

(declare-fun addApplyDifferent!7 (ListLongMap!239 (_ BitVec 64) V!723 (_ BitVec 64)) Unit!159)

(assert (=> b!8415 (= lt!1747 (addApplyDifferent!7 lt!1755 lt!1750 minValue!1434 lt!1748))))

(assert (=> b!8415 (= (apply!22 (+!9 lt!1755 (tuple2!235 lt!1750 minValue!1434)) lt!1748) (apply!22 lt!1755 lt!1748))))

(declare-fun lt!1745 () Unit!159)

(assert (=> b!8415 (= lt!1745 lt!1747)))

(declare-fun lt!1753 () ListLongMap!239)

(assert (=> b!8415 (= lt!1753 (getCurrentListMapNoExtraKeys!6 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!1758 () (_ BitVec 64))

(assert (=> b!8415 (= lt!1758 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!1746 () (_ BitVec 64))

(assert (=> b!8415 (= lt!1746 (select (arr!355 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!1743 () Unit!159)

(assert (=> b!8415 (= lt!1743 (addApplyDifferent!7 lt!1753 lt!1758 zeroValue!1434 lt!1746))))

(assert (=> b!8415 (= (apply!22 (+!9 lt!1753 (tuple2!235 lt!1758 zeroValue!1434)) lt!1746) (apply!22 lt!1753 lt!1746))))

(declare-fun lt!1744 () Unit!159)

(assert (=> b!8415 (= lt!1744 lt!1743)))

(declare-fun lt!1740 () ListLongMap!239)

(assert (=> b!8415 (= lt!1740 (getCurrentListMapNoExtraKeys!6 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!1742 () (_ BitVec 64))

(assert (=> b!8415 (= lt!1742 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!1752 () (_ BitVec 64))

(assert (=> b!8415 (= lt!1752 (select (arr!355 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> b!8415 (= lt!1754 (addApplyDifferent!7 lt!1740 lt!1742 minValue!1434 lt!1752))))

(assert (=> b!8415 (= (apply!22 (+!9 lt!1740 (tuple2!235 lt!1742 minValue!1434)) lt!1752) (apply!22 lt!1740 lt!1752))))

(declare-fun bm!204 () Bool)

(assert (=> bm!204 (= call!207 (getCurrentListMapNoExtraKeys!6 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun b!8416 () Bool)

(assert (=> b!8416 (= e!4774 call!208)))

(declare-fun b!8417 () Bool)

(declare-fun res!7952 () Bool)

(assert (=> b!8417 (=> (not res!7952) (not e!4783))))

(assert (=> b!8417 (= res!7952 e!4779)))

(declare-fun c!613 () Bool)

(assert (=> b!8417 (= c!613 (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!8418 () Bool)

(declare-fun get!160 (ValueCell!188 V!723) V!723)

(declare-fun dynLambda!44 (Int (_ BitVec 64)) V!723)

(assert (=> b!8418 (= e!4782 (= (apply!22 lt!1741 (select (arr!355 _keys!1806) #b00000000000000000000000000000000)) (get!160 (select (arr!354 _values!1492) #b00000000000000000000000000000000) (dynLambda!44 defaultEntry!1495 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!8418 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!416 _values!1492)))))

(assert (=> b!8418 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!417 _keys!1806)))))

(declare-fun b!8419 () Bool)

(assert (=> b!8419 (= e!4780 e!4772)))

(declare-fun res!7949 () Bool)

(assert (=> b!8419 (= res!7949 call!206)))

(assert (=> b!8419 (=> (not res!7949) (not e!4772))))

(declare-fun d!851 () Bool)

(assert (=> d!851 e!4783))

(declare-fun res!7954 () Bool)

(assert (=> d!851 (=> (not res!7954) (not e!4783))))

(assert (=> d!851 (= res!7954 (or (bvsge #b00000000000000000000000000000000 (size!417 _keys!1806)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!417 _keys!1806)))))))

(declare-fun lt!1757 () ListLongMap!239)

(assert (=> d!851 (= lt!1741 lt!1757)))

(declare-fun lt!1760 () Unit!159)

(assert (=> d!851 (= lt!1760 e!4776)))

(declare-fun c!614 () Bool)

(assert (=> d!851 (= c!614 e!4777)))

(declare-fun res!7946 () Bool)

(assert (=> d!851 (=> (not res!7946) (not e!4777))))

(assert (=> d!851 (= res!7946 (bvslt #b00000000000000000000000000000000 (size!417 _keys!1806)))))

(assert (=> d!851 (= lt!1757 e!4778)))

(assert (=> d!851 (= c!612 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!851 (validMask!0 mask!2250)))

(assert (=> d!851 (= (getCurrentListMap!94 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) lt!1741)))

(declare-fun bm!201 () Bool)

(assert (=> bm!201 (= call!203 call!209)))

(declare-fun b!8420 () Bool)

(assert (=> b!8420 (= e!4784 (validKeyInArray!0 (select (arr!355 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun bm!205 () Bool)

(assert (=> bm!205 (= call!206 (contains!110 lt!1741 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!8421 () Bool)

(declare-fun c!615 () Bool)

(assert (=> b!8421 (= c!615 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!8421 (= e!4781 e!4774)))

(declare-fun bm!206 () Bool)

(assert (=> bm!206 (= call!208 call!205)))

(assert (= (and d!851 c!612) b!8407))

(assert (= (and d!851 (not c!612)) b!8405))

(assert (= (and b!8405 c!617) b!8411))

(assert (= (and b!8405 (not c!617)) b!8421))

(assert (= (and b!8421 c!615) b!8416))

(assert (= (and b!8421 (not c!615)) b!8402))

(assert (= (or b!8416 b!8402) bm!201))

(assert (= (or b!8411 bm!201) bm!203))

(assert (= (or b!8411 b!8416) bm!206))

(assert (= (or b!8407 bm!203) bm!204))

(assert (= (or b!8407 bm!206) bm!200))

(assert (= (and d!851 res!7946) b!8413))

(assert (= (and d!851 c!614) b!8415))

(assert (= (and d!851 (not c!614)) b!8408))

(assert (= (and d!851 res!7954) b!8406))

(assert (= (and b!8406 res!7950) b!8420))

(assert (= (and b!8406 (not res!7951)) b!8401))

(assert (= (and b!8401 res!7947) b!8418))

(assert (= (and b!8406 res!7948) b!8417))

(assert (= (and b!8417 c!613) b!8414))

(assert (= (and b!8417 (not c!613)) b!8410))

(assert (= (and b!8414 res!7953) b!8409))

(assert (= (or b!8414 b!8410) bm!202))

(assert (= (and b!8417 res!7952) b!8404))

(assert (= (and b!8404 c!616) b!8419))

(assert (= (and b!8404 (not c!616)) b!8403))

(assert (= (and b!8419 res!7949) b!8412))

(assert (= (or b!8419 b!8403) bm!205))

(declare-fun b_lambda!339 () Bool)

(assert (=> (not b_lambda!339) (not b!8418)))

(declare-fun t!2387 () Bool)

(declare-fun tb!137 () Bool)

(assert (=> (and start!958 (= defaultEntry!1495 defaultEntry!1495) t!2387) tb!137))

(declare-fun result!213 () Bool)

(assert (=> tb!137 (= result!213 tp_is_empty!409)))

(assert (=> b!8418 t!2387))

(declare-fun b_and!485 () Bool)

(assert (= b_and!479 (and (=> t!2387 result!213) b_and!485)))

(declare-fun m!5149 () Bool)

(assert (=> bm!202 m!5149))

(assert (=> b!8413 m!5117))

(assert (=> b!8413 m!5117))

(assert (=> b!8413 m!5119))

(declare-fun m!5151 () Bool)

(assert (=> b!8409 m!5151))

(assert (=> b!8401 m!5117))

(assert (=> b!8401 m!5117))

(declare-fun m!5153 () Bool)

(assert (=> b!8401 m!5153))

(declare-fun m!5155 () Bool)

(assert (=> b!8418 m!5155))

(assert (=> b!8418 m!5155))

(declare-fun m!5157 () Bool)

(assert (=> b!8418 m!5157))

(declare-fun m!5159 () Bool)

(assert (=> b!8418 m!5159))

(assert (=> b!8418 m!5157))

(assert (=> b!8418 m!5117))

(assert (=> b!8418 m!5117))

(declare-fun m!5161 () Bool)

(assert (=> b!8418 m!5161))

(declare-fun m!5163 () Bool)

(assert (=> bm!204 m!5163))

(declare-fun m!5165 () Bool)

(assert (=> bm!205 m!5165))

(declare-fun m!5167 () Bool)

(assert (=> b!8407 m!5167))

(declare-fun m!5169 () Bool)

(assert (=> b!8412 m!5169))

(declare-fun m!5171 () Bool)

(assert (=> bm!200 m!5171))

(declare-fun m!5173 () Bool)

(assert (=> b!8415 m!5173))

(assert (=> b!8415 m!5173))

(declare-fun m!5175 () Bool)

(assert (=> b!8415 m!5175))

(assert (=> b!8415 m!5163))

(declare-fun m!5177 () Bool)

(assert (=> b!8415 m!5177))

(declare-fun m!5179 () Bool)

(assert (=> b!8415 m!5179))

(declare-fun m!5181 () Bool)

(assert (=> b!8415 m!5181))

(declare-fun m!5183 () Bool)

(assert (=> b!8415 m!5183))

(declare-fun m!5185 () Bool)

(assert (=> b!8415 m!5185))

(declare-fun m!5187 () Bool)

(assert (=> b!8415 m!5187))

(declare-fun m!5189 () Bool)

(assert (=> b!8415 m!5189))

(assert (=> b!8415 m!5187))

(declare-fun m!5191 () Bool)

(assert (=> b!8415 m!5191))

(assert (=> b!8415 m!5181))

(declare-fun m!5193 () Bool)

(assert (=> b!8415 m!5193))

(declare-fun m!5195 () Bool)

(assert (=> b!8415 m!5195))

(assert (=> b!8415 m!5185))

(declare-fun m!5197 () Bool)

(assert (=> b!8415 m!5197))

(assert (=> b!8415 m!5117))

(declare-fun m!5199 () Bool)

(assert (=> b!8415 m!5199))

(declare-fun m!5201 () Bool)

(assert (=> b!8415 m!5201))

(assert (=> b!8420 m!5117))

(assert (=> b!8420 m!5117))

(assert (=> b!8420 m!5119))

(assert (=> d!851 m!5055))

(assert (=> b!8231 d!851))

(declare-fun d!853 () Bool)

(assert (=> d!853 (= (validMask!0 mask!2250) (and (or (= mask!2250 #b00000000000000000000000000000111) (= mask!2250 #b00000000000000000000000000001111) (= mask!2250 #b00000000000000000000000000011111) (= mask!2250 #b00000000000000000000000000111111) (= mask!2250 #b00000000000000000000000001111111) (= mask!2250 #b00000000000000000000000011111111) (= mask!2250 #b00000000000000000000000111111111) (= mask!2250 #b00000000000000000000001111111111) (= mask!2250 #b00000000000000000000011111111111) (= mask!2250 #b00000000000000000000111111111111) (= mask!2250 #b00000000000000000001111111111111) (= mask!2250 #b00000000000000000011111111111111) (= mask!2250 #b00000000000000000111111111111111) (= mask!2250 #b00000000000000001111111111111111) (= mask!2250 #b00000000000000011111111111111111) (= mask!2250 #b00000000000000111111111111111111) (= mask!2250 #b00000000000001111111111111111111) (= mask!2250 #b00000000000011111111111111111111) (= mask!2250 #b00000000000111111111111111111111) (= mask!2250 #b00000000001111111111111111111111) (= mask!2250 #b00000000011111111111111111111111) (= mask!2250 #b00000000111111111111111111111111) (= mask!2250 #b00000001111111111111111111111111) (= mask!2250 #b00000011111111111111111111111111) (= mask!2250 #b00000111111111111111111111111111) (= mask!2250 #b00001111111111111111111111111111) (= mask!2250 #b00011111111111111111111111111111) (= mask!2250 #b00111111111111111111111111111111)) (bvsle mask!2250 #b00111111111111111111111111111111)))))

(assert (=> start!958 d!853))

(declare-fun d!855 () Bool)

(assert (=> d!855 (= (array_inv!261 _values!1492) (bvsge (size!416 _values!1492) #b00000000000000000000000000000000))))

(assert (=> start!958 d!855))

(declare-fun d!857 () Bool)

(assert (=> d!857 (= (array_inv!262 _keys!1806) (bvsge (size!417 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> start!958 d!857))

(declare-fun condMapEmpty!596 () Bool)

(declare-fun mapDefault!596 () ValueCell!188)

(assert (=> mapNonEmpty!587 (= condMapEmpty!596 (= mapRest!587 ((as const (Array (_ BitVec 32) ValueCell!188)) mapDefault!596)))))

(declare-fun e!4790 () Bool)

(declare-fun mapRes!596 () Bool)

(assert (=> mapNonEmpty!587 (= tp!1225 (and e!4790 mapRes!596))))

(declare-fun mapIsEmpty!596 () Bool)

(assert (=> mapIsEmpty!596 mapRes!596))

(declare-fun b!8430 () Bool)

(declare-fun e!4789 () Bool)

(assert (=> b!8430 (= e!4789 tp_is_empty!409)))

(declare-fun mapNonEmpty!596 () Bool)

(declare-fun tp!1241 () Bool)

(assert (=> mapNonEmpty!596 (= mapRes!596 (and tp!1241 e!4789))))

(declare-fun mapRest!596 () (Array (_ BitVec 32) ValueCell!188))

(declare-fun mapValue!596 () ValueCell!188)

(declare-fun mapKey!596 () (_ BitVec 32))

(assert (=> mapNonEmpty!596 (= mapRest!587 (store mapRest!596 mapKey!596 mapValue!596))))

(declare-fun b!8431 () Bool)

(assert (=> b!8431 (= e!4790 tp_is_empty!409)))

(assert (= (and mapNonEmpty!587 condMapEmpty!596) mapIsEmpty!596))

(assert (= (and mapNonEmpty!587 (not condMapEmpty!596)) mapNonEmpty!596))

(assert (= (and mapNonEmpty!596 ((_ is ValueCellFull!188) mapValue!596)) b!8430))

(assert (= (and mapNonEmpty!587 ((_ is ValueCellFull!188) mapDefault!596)) b!8431))

(declare-fun m!5203 () Bool)

(assert (=> mapNonEmpty!596 m!5203))

(declare-fun b_lambda!341 () Bool)

(assert (= b_lambda!339 (or (and start!958 b_free!331) b_lambda!341)))

(check-sat (not b!8316) (not b!8358) (not b!8418) (not bm!202) (not b!8401) (not b!8412) (not b!8337) (not b_lambda!341) (not bm!204) (not b!8415) (not bm!205) (not d!843) (not b!8314) (not b!8349) (not b!8331) (not bm!200) (not mapNonEmpty!596) (not bm!185) (not b!8342) (not b!8356) (not d!851) tp_is_empty!409 (not d!849) (not bm!182) (not b!8413) b_and!485 (not b!8407) (not b!8328) (not b!8409) (not b!8420) (not b_next!331) (not b!8327))
(check-sat b_and!485 (not b_next!331))

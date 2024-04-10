; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110388 () Bool)

(assert start!110388)

(declare-fun mapNonEmpty!54094 () Bool)

(declare-fun mapRes!54094 () Bool)

(declare-fun tp!103174 () Bool)

(declare-fun e!745187 () Bool)

(assert (=> mapNonEmpty!54094 (= mapRes!54094 (and tp!103174 e!745187))))

(declare-fun mapKey!54094 () (_ BitVec 32))

(declare-datatypes ((V!51747 0))(
  ( (V!51748 (val!17566 Int)) )
))
(declare-datatypes ((ValueCell!16593 0))(
  ( (ValueCellFull!16593 (v!20192 V!51747)) (EmptyCell!16593) )
))
(declare-datatypes ((array!86980 0))(
  ( (array!86981 (arr!41973 (Array (_ BitVec 32) ValueCell!16593)) (size!42523 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!86980)

(declare-fun mapRest!54094 () (Array (_ BitVec 32) ValueCell!16593))

(declare-fun mapValue!54094 () ValueCell!16593)

(assert (=> mapNonEmpty!54094 (= (arr!41973 _values!1354) (store mapRest!54094 mapKey!54094 mapValue!54094))))

(declare-fun b!1306256 () Bool)

(declare-fun e!745184 () Bool)

(declare-fun tp_is_empty!34983 () Bool)

(assert (=> b!1306256 (= e!745184 tp_is_empty!34983)))

(declare-fun b!1306257 () Bool)

(declare-fun res!867203 () Bool)

(declare-fun e!745188 () Bool)

(assert (=> b!1306257 (=> (not res!867203) (not e!745188))))

(declare-datatypes ((array!86982 0))(
  ( (array!86983 (arr!41974 (Array (_ BitVec 32) (_ BitVec 64))) (size!42524 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!86982)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86982 (_ BitVec 32)) Bool)

(assert (=> b!1306257 (= res!867203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54094 () Bool)

(assert (=> mapIsEmpty!54094 mapRes!54094))

(declare-fun b!1306258 () Bool)

(assert (=> b!1306258 (= e!745188 (and (bvsle #b00000000000000000000000000000000 (size!42524 _keys!1628)) (bvsge (size!42524 _keys!1628) #b01111111111111111111111111111111)))))

(declare-fun b!1306259 () Bool)

(declare-fun e!745186 () Bool)

(assert (=> b!1306259 (= e!745186 (and e!745184 mapRes!54094))))

(declare-fun condMapEmpty!54094 () Bool)

(declare-fun mapDefault!54094 () ValueCell!16593)

(assert (=> b!1306259 (= condMapEmpty!54094 (= (arr!41973 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16593)) mapDefault!54094)))))

(declare-fun b!1306260 () Bool)

(assert (=> b!1306260 (= e!745187 tp_is_empty!34983)))

(declare-fun b!1306261 () Bool)

(declare-fun res!867205 () Bool)

(assert (=> b!1306261 (=> (not res!867205) (not e!745188))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1306261 (= res!867205 (and (= (size!42523 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42524 _keys!1628) (size!42523 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun res!867204 () Bool)

(assert (=> start!110388 (=> (not res!867204) (not e!745188))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110388 (= res!867204 (validMask!0 mask!2040))))

(assert (=> start!110388 e!745188))

(assert (=> start!110388 true))

(declare-fun array_inv!31733 (array!86980) Bool)

(assert (=> start!110388 (and (array_inv!31733 _values!1354) e!745186)))

(declare-fun array_inv!31734 (array!86982) Bool)

(assert (=> start!110388 (array_inv!31734 _keys!1628)))

(assert (= (and start!110388 res!867204) b!1306261))

(assert (= (and b!1306261 res!867205) b!1306257))

(assert (= (and b!1306257 res!867203) b!1306258))

(assert (= (and b!1306259 condMapEmpty!54094) mapIsEmpty!54094))

(assert (= (and b!1306259 (not condMapEmpty!54094)) mapNonEmpty!54094))

(get-info :version)

(assert (= (and mapNonEmpty!54094 ((_ is ValueCellFull!16593) mapValue!54094)) b!1306260))

(assert (= (and b!1306259 ((_ is ValueCellFull!16593) mapDefault!54094)) b!1306256))

(assert (= start!110388 b!1306259))

(declare-fun m!1197361 () Bool)

(assert (=> mapNonEmpty!54094 m!1197361))

(declare-fun m!1197363 () Bool)

(assert (=> b!1306257 m!1197363))

(declare-fun m!1197365 () Bool)

(assert (=> start!110388 m!1197365))

(declare-fun m!1197367 () Bool)

(assert (=> start!110388 m!1197367))

(declare-fun m!1197369 () Bool)

(assert (=> start!110388 m!1197369))

(check-sat (not b!1306257) (not start!110388) (not mapNonEmpty!54094) tp_is_empty!34983)
(check-sat)
(get-model)

(declare-fun b!1306288 () Bool)

(declare-fun e!745212 () Bool)

(declare-fun call!64626 () Bool)

(assert (=> b!1306288 (= e!745212 call!64626)))

(declare-fun b!1306289 () Bool)

(declare-fun e!745211 () Bool)

(assert (=> b!1306289 (= e!745211 e!745212)))

(declare-fun c!125541 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1306289 (= c!125541 (validKeyInArray!0 (select (arr!41974 _keys!1628) #b00000000000000000000000000000000)))))

(declare-fun b!1306290 () Bool)

(declare-fun e!745210 () Bool)

(assert (=> b!1306290 (= e!745210 call!64626)))

(declare-fun b!1306291 () Bool)

(assert (=> b!1306291 (= e!745212 e!745210)))

(declare-fun lt!584904 () (_ BitVec 64))

(assert (=> b!1306291 (= lt!584904 (select (arr!41974 _keys!1628) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43268 0))(
  ( (Unit!43269) )
))
(declare-fun lt!584905 () Unit!43268)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86982 (_ BitVec 64) (_ BitVec 32)) Unit!43268)

(assert (=> b!1306291 (= lt!584905 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1628 lt!584904 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86982 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1306291 (arrayContainsKey!0 _keys!1628 lt!584904 #b00000000000000000000000000000000)))

(declare-fun lt!584906 () Unit!43268)

(assert (=> b!1306291 (= lt!584906 lt!584905)))

(declare-fun res!867220 () Bool)

(declare-datatypes ((SeekEntryResult!10032 0))(
  ( (MissingZero!10032 (index!42499 (_ BitVec 32))) (Found!10032 (index!42500 (_ BitVec 32))) (Intermediate!10032 (undefined!10844 Bool) (index!42501 (_ BitVec 32)) (x!116008 (_ BitVec 32))) (Undefined!10032) (MissingVacant!10032 (index!42502 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86982 (_ BitVec 32)) SeekEntryResult!10032)

(assert (=> b!1306291 (= res!867220 (= (seekEntryOrOpen!0 (select (arr!41974 _keys!1628) #b00000000000000000000000000000000) _keys!1628 mask!2040) (Found!10032 #b00000000000000000000000000000000)))))

(assert (=> b!1306291 (=> (not res!867220) (not e!745210))))

(declare-fun bm!64623 () Bool)

(assert (=> bm!64623 (= call!64626 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1628 mask!2040))))

(declare-fun d!142233 () Bool)

(declare-fun res!867219 () Bool)

(assert (=> d!142233 (=> res!867219 e!745211)))

(assert (=> d!142233 (= res!867219 (bvsge #b00000000000000000000000000000000 (size!42524 _keys!1628)))))

(assert (=> d!142233 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040) e!745211)))

(assert (= (and d!142233 (not res!867219)) b!1306289))

(assert (= (and b!1306289 c!125541) b!1306291))

(assert (= (and b!1306289 (not c!125541)) b!1306288))

(assert (= (and b!1306291 res!867220) b!1306290))

(assert (= (or b!1306290 b!1306288) bm!64623))

(declare-fun m!1197381 () Bool)

(assert (=> b!1306289 m!1197381))

(assert (=> b!1306289 m!1197381))

(declare-fun m!1197383 () Bool)

(assert (=> b!1306289 m!1197383))

(assert (=> b!1306291 m!1197381))

(declare-fun m!1197385 () Bool)

(assert (=> b!1306291 m!1197385))

(declare-fun m!1197387 () Bool)

(assert (=> b!1306291 m!1197387))

(assert (=> b!1306291 m!1197381))

(declare-fun m!1197389 () Bool)

(assert (=> b!1306291 m!1197389))

(declare-fun m!1197391 () Bool)

(assert (=> bm!64623 m!1197391))

(assert (=> b!1306257 d!142233))

(declare-fun d!142235 () Bool)

(assert (=> d!142235 (= (validMask!0 mask!2040) (and (or (= mask!2040 #b00000000000000000000000000000111) (= mask!2040 #b00000000000000000000000000001111) (= mask!2040 #b00000000000000000000000000011111) (= mask!2040 #b00000000000000000000000000111111) (= mask!2040 #b00000000000000000000000001111111) (= mask!2040 #b00000000000000000000000011111111) (= mask!2040 #b00000000000000000000000111111111) (= mask!2040 #b00000000000000000000001111111111) (= mask!2040 #b00000000000000000000011111111111) (= mask!2040 #b00000000000000000000111111111111) (= mask!2040 #b00000000000000000001111111111111) (= mask!2040 #b00000000000000000011111111111111) (= mask!2040 #b00000000000000000111111111111111) (= mask!2040 #b00000000000000001111111111111111) (= mask!2040 #b00000000000000011111111111111111) (= mask!2040 #b00000000000000111111111111111111) (= mask!2040 #b00000000000001111111111111111111) (= mask!2040 #b00000000000011111111111111111111) (= mask!2040 #b00000000000111111111111111111111) (= mask!2040 #b00000000001111111111111111111111) (= mask!2040 #b00000000011111111111111111111111) (= mask!2040 #b00000000111111111111111111111111) (= mask!2040 #b00000001111111111111111111111111) (= mask!2040 #b00000011111111111111111111111111) (= mask!2040 #b00000111111111111111111111111111) (= mask!2040 #b00001111111111111111111111111111) (= mask!2040 #b00011111111111111111111111111111) (= mask!2040 #b00111111111111111111111111111111)) (bvsle mask!2040 #b00111111111111111111111111111111)))))

(assert (=> start!110388 d!142235))

(declare-fun d!142237 () Bool)

(assert (=> d!142237 (= (array_inv!31733 _values!1354) (bvsge (size!42523 _values!1354) #b00000000000000000000000000000000))))

(assert (=> start!110388 d!142237))

(declare-fun d!142239 () Bool)

(assert (=> d!142239 (= (array_inv!31734 _keys!1628) (bvsge (size!42524 _keys!1628) #b00000000000000000000000000000000))))

(assert (=> start!110388 d!142239))

(declare-fun b!1306299 () Bool)

(declare-fun e!745217 () Bool)

(assert (=> b!1306299 (= e!745217 tp_is_empty!34983)))

(declare-fun b!1306298 () Bool)

(declare-fun e!745218 () Bool)

(assert (=> b!1306298 (= e!745218 tp_is_empty!34983)))

(declare-fun mapNonEmpty!54100 () Bool)

(declare-fun mapRes!54100 () Bool)

(declare-fun tp!103180 () Bool)

(assert (=> mapNonEmpty!54100 (= mapRes!54100 (and tp!103180 e!745218))))

(declare-fun mapValue!54100 () ValueCell!16593)

(declare-fun mapRest!54100 () (Array (_ BitVec 32) ValueCell!16593))

(declare-fun mapKey!54100 () (_ BitVec 32))

(assert (=> mapNonEmpty!54100 (= mapRest!54094 (store mapRest!54100 mapKey!54100 mapValue!54100))))

(declare-fun mapIsEmpty!54100 () Bool)

(assert (=> mapIsEmpty!54100 mapRes!54100))

(declare-fun condMapEmpty!54100 () Bool)

(declare-fun mapDefault!54100 () ValueCell!16593)

(assert (=> mapNonEmpty!54094 (= condMapEmpty!54100 (= mapRest!54094 ((as const (Array (_ BitVec 32) ValueCell!16593)) mapDefault!54100)))))

(assert (=> mapNonEmpty!54094 (= tp!103174 (and e!745217 mapRes!54100))))

(assert (= (and mapNonEmpty!54094 condMapEmpty!54100) mapIsEmpty!54100))

(assert (= (and mapNonEmpty!54094 (not condMapEmpty!54100)) mapNonEmpty!54100))

(assert (= (and mapNonEmpty!54100 ((_ is ValueCellFull!16593) mapValue!54100)) b!1306298))

(assert (= (and mapNonEmpty!54094 ((_ is ValueCellFull!16593) mapDefault!54100)) b!1306299))

(declare-fun m!1197393 () Bool)

(assert (=> mapNonEmpty!54100 m!1197393))

(check-sat (not b!1306289) tp_is_empty!34983 (not bm!64623) (not b!1306291) (not mapNonEmpty!54100))
(check-sat)

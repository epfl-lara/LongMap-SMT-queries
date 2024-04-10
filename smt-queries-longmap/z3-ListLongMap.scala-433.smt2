; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8128 () Bool)

(assert start!8128)

(declare-fun b!51266 () Bool)

(declare-fun b_free!1589 () Bool)

(declare-fun b_next!1589 () Bool)

(assert (=> b!51266 (= b_free!1589 (not b_next!1589))))

(declare-fun tp!6847 () Bool)

(declare-fun b_and!2799 () Bool)

(assert (=> b!51266 (= tp!6847 b_and!2799)))

(declare-fun b!51265 () Bool)

(declare-fun b_free!1591 () Bool)

(declare-fun b_next!1591 () Bool)

(assert (=> b!51265 (= b_free!1591 (not b_next!1591))))

(declare-fun tp!6848 () Bool)

(declare-fun b_and!2801 () Bool)

(assert (=> b!51265 (= tp!6848 b_and!2801)))

(declare-fun mapIsEmpty!2283 () Bool)

(declare-fun mapRes!2283 () Bool)

(assert (=> mapIsEmpty!2283 mapRes!2283))

(declare-fun b!51264 () Bool)

(declare-fun e!33236 () Bool)

(declare-fun e!33238 () Bool)

(declare-fun mapRes!2284 () Bool)

(assert (=> b!51264 (= e!33236 (and e!33238 mapRes!2284))))

(declare-fun condMapEmpty!2283 () Bool)

(declare-datatypes ((V!2595 0))(
  ( (V!2596 (val!1150 Int)) )
))
(declare-datatypes ((array!3339 0))(
  ( (array!3340 (arr!1595 (Array (_ BitVec 32) (_ BitVec 64))) (size!1821 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!762 0))(
  ( (ValueCellFull!762 (v!2188 V!2595)) (EmptyCell!762) )
))
(declare-datatypes ((array!3341 0))(
  ( (array!3342 (arr!1596 (Array (_ BitVec 32) ValueCell!762)) (size!1822 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!432 0))(
  ( (LongMapFixedSize!433 (defaultEntry!1930 Int) (mask!5734 (_ BitVec 32)) (extraKeys!1821 (_ BitVec 32)) (zeroValue!1848 V!2595) (minValue!1848 V!2595) (_size!265 (_ BitVec 32)) (_keys!3544 array!3339) (_values!1913 array!3341) (_vacant!265 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!256 0))(
  ( (Cell!257 (v!2189 LongMapFixedSize!432)) )
))
(declare-datatypes ((LongMap!256 0))(
  ( (LongMap!257 (underlying!139 Cell!256)) )
))
(declare-fun thiss!992 () LongMap!256)

(declare-fun mapDefault!2284 () ValueCell!762)

(assert (=> b!51264 (= condMapEmpty!2283 (= (arr!1596 (_values!1913 (v!2189 (underlying!139 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!762)) mapDefault!2284)))))

(declare-fun mapNonEmpty!2283 () Bool)

(declare-fun tp!6850 () Bool)

(declare-fun e!33237 () Bool)

(assert (=> mapNonEmpty!2283 (= mapRes!2283 (and tp!6850 e!33237))))

(declare-fun mapRest!2283 () (Array (_ BitVec 32) ValueCell!762))

(declare-fun mapKey!2284 () (_ BitVec 32))

(declare-fun newMap!16 () LongMapFixedSize!432)

(declare-fun mapValue!2283 () ValueCell!762)

(assert (=> mapNonEmpty!2283 (= (arr!1596 (_values!1913 newMap!16)) (store mapRest!2283 mapKey!2284 mapValue!2283))))

(declare-fun e!33231 () Bool)

(declare-fun e!33227 () Bool)

(declare-fun tp_is_empty!2211 () Bool)

(declare-fun array_inv!979 (array!3339) Bool)

(declare-fun array_inv!980 (array!3341) Bool)

(assert (=> b!51265 (= e!33227 (and tp!6848 tp_is_empty!2211 (array_inv!979 (_keys!3544 newMap!16)) (array_inv!980 (_values!1913 newMap!16)) e!33231))))

(declare-fun e!33235 () Bool)

(assert (=> b!51266 (= e!33235 (and tp!6847 tp_is_empty!2211 (array_inv!979 (_keys!3544 (v!2189 (underlying!139 thiss!992)))) (array_inv!980 (_values!1913 (v!2189 (underlying!139 thiss!992)))) e!33236))))

(declare-fun res!29356 () Bool)

(declare-fun e!33229 () Bool)

(assert (=> start!8128 (=> (not res!29356) (not e!33229))))

(declare-fun valid!147 (LongMap!256) Bool)

(assert (=> start!8128 (= res!29356 (valid!147 thiss!992))))

(assert (=> start!8128 e!33229))

(declare-fun e!33228 () Bool)

(assert (=> start!8128 e!33228))

(assert (=> start!8128 true))

(assert (=> start!8128 e!33227))

(declare-fun b!51267 () Bool)

(declare-fun e!33232 () Bool)

(assert (=> b!51267 (= e!33231 (and e!33232 mapRes!2283))))

(declare-fun condMapEmpty!2284 () Bool)

(declare-fun mapDefault!2283 () ValueCell!762)

(assert (=> b!51267 (= condMapEmpty!2284 (= (arr!1596 (_values!1913 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!762)) mapDefault!2283)))))

(declare-fun b!51268 () Bool)

(assert (=> b!51268 (= e!33238 tp_is_empty!2211)))

(declare-fun b!51269 () Bool)

(declare-fun e!33234 () Bool)

(assert (=> b!51269 (= e!33234 e!33235)))

(declare-fun b!51270 () Bool)

(declare-fun res!29358 () Bool)

(assert (=> b!51270 (=> (not res!29358) (not e!33229))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!51270 (= res!29358 (validMask!0 (mask!5734 (v!2189 (underlying!139 thiss!992)))))))

(declare-fun b!51271 () Bool)

(assert (=> b!51271 (= e!33229 (and (= (size!1822 (_values!1913 (v!2189 (underlying!139 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5734 (v!2189 (underlying!139 thiss!992))))) (= (size!1821 (_keys!3544 (v!2189 (underlying!139 thiss!992)))) (size!1822 (_values!1913 (v!2189 (underlying!139 thiss!992))))) (bvsge (mask!5734 (v!2189 (underlying!139 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1821 (v!2189 (underlying!139 thiss!992))) #b00000000000000000000000000000000) (bvsgt (extraKeys!1821 (v!2189 (underlying!139 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!51272 () Bool)

(declare-fun res!29355 () Bool)

(assert (=> b!51272 (=> (not res!29355) (not e!33229))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!51272 (= res!29355 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1821 (_keys!3544 (v!2189 (underlying!139 thiss!992)))))))))

(declare-fun b!51273 () Bool)

(assert (=> b!51273 (= e!33228 e!33234)))

(declare-fun b!51274 () Bool)

(assert (=> b!51274 (= e!33237 tp_is_empty!2211)))

(declare-fun b!51275 () Bool)

(declare-fun res!29359 () Bool)

(assert (=> b!51275 (=> (not res!29359) (not e!33229))))

(assert (=> b!51275 (= res!29359 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5734 newMap!16)) (_size!265 (v!2189 (underlying!139 thiss!992)))))))

(declare-fun mapNonEmpty!2284 () Bool)

(declare-fun tp!6849 () Bool)

(declare-fun e!33230 () Bool)

(assert (=> mapNonEmpty!2284 (= mapRes!2284 (and tp!6849 e!33230))))

(declare-fun mapRest!2284 () (Array (_ BitVec 32) ValueCell!762))

(declare-fun mapKey!2283 () (_ BitVec 32))

(declare-fun mapValue!2284 () ValueCell!762)

(assert (=> mapNonEmpty!2284 (= (arr!1596 (_values!1913 (v!2189 (underlying!139 thiss!992)))) (store mapRest!2284 mapKey!2283 mapValue!2284))))

(declare-fun b!51276 () Bool)

(assert (=> b!51276 (= e!33230 tp_is_empty!2211)))

(declare-fun b!51277 () Bool)

(declare-fun res!29357 () Bool)

(assert (=> b!51277 (=> (not res!29357) (not e!33229))))

(declare-fun valid!148 (LongMapFixedSize!432) Bool)

(assert (=> b!51277 (= res!29357 (valid!148 newMap!16))))

(declare-fun b!51278 () Bool)

(assert (=> b!51278 (= e!33232 tp_is_empty!2211)))

(declare-fun mapIsEmpty!2284 () Bool)

(assert (=> mapIsEmpty!2284 mapRes!2284))

(assert (= (and start!8128 res!29356) b!51272))

(assert (= (and b!51272 res!29355) b!51277))

(assert (= (and b!51277 res!29357) b!51275))

(assert (= (and b!51275 res!29359) b!51270))

(assert (= (and b!51270 res!29358) b!51271))

(assert (= (and b!51264 condMapEmpty!2283) mapIsEmpty!2284))

(assert (= (and b!51264 (not condMapEmpty!2283)) mapNonEmpty!2284))

(get-info :version)

(assert (= (and mapNonEmpty!2284 ((_ is ValueCellFull!762) mapValue!2284)) b!51276))

(assert (= (and b!51264 ((_ is ValueCellFull!762) mapDefault!2284)) b!51268))

(assert (= b!51266 b!51264))

(assert (= b!51269 b!51266))

(assert (= b!51273 b!51269))

(assert (= start!8128 b!51273))

(assert (= (and b!51267 condMapEmpty!2284) mapIsEmpty!2283))

(assert (= (and b!51267 (not condMapEmpty!2284)) mapNonEmpty!2283))

(assert (= (and mapNonEmpty!2283 ((_ is ValueCellFull!762) mapValue!2283)) b!51274))

(assert (= (and b!51267 ((_ is ValueCellFull!762) mapDefault!2283)) b!51278))

(assert (= b!51265 b!51267))

(assert (= start!8128 b!51265))

(declare-fun m!44187 () Bool)

(assert (=> b!51277 m!44187))

(declare-fun m!44189 () Bool)

(assert (=> start!8128 m!44189))

(declare-fun m!44191 () Bool)

(assert (=> mapNonEmpty!2283 m!44191))

(declare-fun m!44193 () Bool)

(assert (=> b!51265 m!44193))

(declare-fun m!44195 () Bool)

(assert (=> b!51265 m!44195))

(declare-fun m!44197 () Bool)

(assert (=> b!51270 m!44197))

(declare-fun m!44199 () Bool)

(assert (=> mapNonEmpty!2284 m!44199))

(declare-fun m!44201 () Bool)

(assert (=> b!51266 m!44201))

(declare-fun m!44203 () Bool)

(assert (=> b!51266 m!44203))

(check-sat (not b!51270) b_and!2801 b_and!2799 (not b!51266) (not mapNonEmpty!2283) (not b!51265) (not b!51277) (not start!8128) (not b_next!1591) (not mapNonEmpty!2284) (not b_next!1589) tp_is_empty!2211)
(check-sat b_and!2799 b_and!2801 (not b_next!1589) (not b_next!1591))
(get-model)

(declare-fun d!10305 () Bool)

(assert (=> d!10305 (= (validMask!0 (mask!5734 (v!2189 (underlying!139 thiss!992)))) (and (or (= (mask!5734 (v!2189 (underlying!139 thiss!992))) #b00000000000000000000000000000111) (= (mask!5734 (v!2189 (underlying!139 thiss!992))) #b00000000000000000000000000001111) (= (mask!5734 (v!2189 (underlying!139 thiss!992))) #b00000000000000000000000000011111) (= (mask!5734 (v!2189 (underlying!139 thiss!992))) #b00000000000000000000000000111111) (= (mask!5734 (v!2189 (underlying!139 thiss!992))) #b00000000000000000000000001111111) (= (mask!5734 (v!2189 (underlying!139 thiss!992))) #b00000000000000000000000011111111) (= (mask!5734 (v!2189 (underlying!139 thiss!992))) #b00000000000000000000000111111111) (= (mask!5734 (v!2189 (underlying!139 thiss!992))) #b00000000000000000000001111111111) (= (mask!5734 (v!2189 (underlying!139 thiss!992))) #b00000000000000000000011111111111) (= (mask!5734 (v!2189 (underlying!139 thiss!992))) #b00000000000000000000111111111111) (= (mask!5734 (v!2189 (underlying!139 thiss!992))) #b00000000000000000001111111111111) (= (mask!5734 (v!2189 (underlying!139 thiss!992))) #b00000000000000000011111111111111) (= (mask!5734 (v!2189 (underlying!139 thiss!992))) #b00000000000000000111111111111111) (= (mask!5734 (v!2189 (underlying!139 thiss!992))) #b00000000000000001111111111111111) (= (mask!5734 (v!2189 (underlying!139 thiss!992))) #b00000000000000011111111111111111) (= (mask!5734 (v!2189 (underlying!139 thiss!992))) #b00000000000000111111111111111111) (= (mask!5734 (v!2189 (underlying!139 thiss!992))) #b00000000000001111111111111111111) (= (mask!5734 (v!2189 (underlying!139 thiss!992))) #b00000000000011111111111111111111) (= (mask!5734 (v!2189 (underlying!139 thiss!992))) #b00000000000111111111111111111111) (= (mask!5734 (v!2189 (underlying!139 thiss!992))) #b00000000001111111111111111111111) (= (mask!5734 (v!2189 (underlying!139 thiss!992))) #b00000000011111111111111111111111) (= (mask!5734 (v!2189 (underlying!139 thiss!992))) #b00000000111111111111111111111111) (= (mask!5734 (v!2189 (underlying!139 thiss!992))) #b00000001111111111111111111111111) (= (mask!5734 (v!2189 (underlying!139 thiss!992))) #b00000011111111111111111111111111) (= (mask!5734 (v!2189 (underlying!139 thiss!992))) #b00000111111111111111111111111111) (= (mask!5734 (v!2189 (underlying!139 thiss!992))) #b00001111111111111111111111111111) (= (mask!5734 (v!2189 (underlying!139 thiss!992))) #b00011111111111111111111111111111) (= (mask!5734 (v!2189 (underlying!139 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!5734 (v!2189 (underlying!139 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!51270 d!10305))

(declare-fun d!10307 () Bool)

(assert (=> d!10307 (= (array_inv!979 (_keys!3544 newMap!16)) (bvsge (size!1821 (_keys!3544 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!51265 d!10307))

(declare-fun d!10309 () Bool)

(assert (=> d!10309 (= (array_inv!980 (_values!1913 newMap!16)) (bvsge (size!1822 (_values!1913 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!51265 d!10309))

(declare-fun d!10311 () Bool)

(declare-fun res!29381 () Bool)

(declare-fun e!33280 () Bool)

(assert (=> d!10311 (=> (not res!29381) (not e!33280))))

(declare-fun simpleValid!37 (LongMapFixedSize!432) Bool)

(assert (=> d!10311 (= res!29381 (simpleValid!37 newMap!16))))

(assert (=> d!10311 (= (valid!148 newMap!16) e!33280)))

(declare-fun b!51330 () Bool)

(declare-fun res!29382 () Bool)

(assert (=> b!51330 (=> (not res!29382) (not e!33280))))

(declare-fun arrayCountValidKeys!0 (array!3339 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!51330 (= res!29382 (= (arrayCountValidKeys!0 (_keys!3544 newMap!16) #b00000000000000000000000000000000 (size!1821 (_keys!3544 newMap!16))) (_size!265 newMap!16)))))

(declare-fun b!51331 () Bool)

(declare-fun res!29383 () Bool)

(assert (=> b!51331 (=> (not res!29383) (not e!33280))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3339 (_ BitVec 32)) Bool)

(assert (=> b!51331 (= res!29383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3544 newMap!16) (mask!5734 newMap!16)))))

(declare-fun b!51332 () Bool)

(declare-datatypes ((List!1332 0))(
  ( (Nil!1329) (Cons!1328 (h!1908 (_ BitVec 64)) (t!4366 List!1332)) )
))
(declare-fun arrayNoDuplicates!0 (array!3339 (_ BitVec 32) List!1332) Bool)

(assert (=> b!51332 (= e!33280 (arrayNoDuplicates!0 (_keys!3544 newMap!16) #b00000000000000000000000000000000 Nil!1329))))

(assert (= (and d!10311 res!29381) b!51330))

(assert (= (and b!51330 res!29382) b!51331))

(assert (= (and b!51331 res!29383) b!51332))

(declare-fun m!44223 () Bool)

(assert (=> d!10311 m!44223))

(declare-fun m!44225 () Bool)

(assert (=> b!51330 m!44225))

(declare-fun m!44227 () Bool)

(assert (=> b!51331 m!44227))

(declare-fun m!44229 () Bool)

(assert (=> b!51332 m!44229))

(assert (=> b!51277 d!10311))

(declare-fun d!10313 () Bool)

(assert (=> d!10313 (= (valid!147 thiss!992) (valid!148 (v!2189 (underlying!139 thiss!992))))))

(declare-fun bs!2376 () Bool)

(assert (= bs!2376 d!10313))

(declare-fun m!44231 () Bool)

(assert (=> bs!2376 m!44231))

(assert (=> start!8128 d!10313))

(declare-fun d!10315 () Bool)

(assert (=> d!10315 (= (array_inv!979 (_keys!3544 (v!2189 (underlying!139 thiss!992)))) (bvsge (size!1821 (_keys!3544 (v!2189 (underlying!139 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!51266 d!10315))

(declare-fun d!10317 () Bool)

(assert (=> d!10317 (= (array_inv!980 (_values!1913 (v!2189 (underlying!139 thiss!992)))) (bvsge (size!1822 (_values!1913 (v!2189 (underlying!139 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!51266 d!10317))

(declare-fun mapIsEmpty!2293 () Bool)

(declare-fun mapRes!2293 () Bool)

(assert (=> mapIsEmpty!2293 mapRes!2293))

(declare-fun b!51340 () Bool)

(declare-fun e!33286 () Bool)

(assert (=> b!51340 (= e!33286 tp_is_empty!2211)))

(declare-fun condMapEmpty!2293 () Bool)

(declare-fun mapDefault!2293 () ValueCell!762)

(assert (=> mapNonEmpty!2284 (= condMapEmpty!2293 (= mapRest!2284 ((as const (Array (_ BitVec 32) ValueCell!762)) mapDefault!2293)))))

(assert (=> mapNonEmpty!2284 (= tp!6849 (and e!33286 mapRes!2293))))

(declare-fun b!51339 () Bool)

(declare-fun e!33285 () Bool)

(assert (=> b!51339 (= e!33285 tp_is_empty!2211)))

(declare-fun mapNonEmpty!2293 () Bool)

(declare-fun tp!6865 () Bool)

(assert (=> mapNonEmpty!2293 (= mapRes!2293 (and tp!6865 e!33285))))

(declare-fun mapRest!2293 () (Array (_ BitVec 32) ValueCell!762))

(declare-fun mapValue!2293 () ValueCell!762)

(declare-fun mapKey!2293 () (_ BitVec 32))

(assert (=> mapNonEmpty!2293 (= mapRest!2284 (store mapRest!2293 mapKey!2293 mapValue!2293))))

(assert (= (and mapNonEmpty!2284 condMapEmpty!2293) mapIsEmpty!2293))

(assert (= (and mapNonEmpty!2284 (not condMapEmpty!2293)) mapNonEmpty!2293))

(assert (= (and mapNonEmpty!2293 ((_ is ValueCellFull!762) mapValue!2293)) b!51339))

(assert (= (and mapNonEmpty!2284 ((_ is ValueCellFull!762) mapDefault!2293)) b!51340))

(declare-fun m!44233 () Bool)

(assert (=> mapNonEmpty!2293 m!44233))

(declare-fun mapIsEmpty!2294 () Bool)

(declare-fun mapRes!2294 () Bool)

(assert (=> mapIsEmpty!2294 mapRes!2294))

(declare-fun b!51342 () Bool)

(declare-fun e!33288 () Bool)

(assert (=> b!51342 (= e!33288 tp_is_empty!2211)))

(declare-fun condMapEmpty!2294 () Bool)

(declare-fun mapDefault!2294 () ValueCell!762)

(assert (=> mapNonEmpty!2283 (= condMapEmpty!2294 (= mapRest!2283 ((as const (Array (_ BitVec 32) ValueCell!762)) mapDefault!2294)))))

(assert (=> mapNonEmpty!2283 (= tp!6850 (and e!33288 mapRes!2294))))

(declare-fun b!51341 () Bool)

(declare-fun e!33287 () Bool)

(assert (=> b!51341 (= e!33287 tp_is_empty!2211)))

(declare-fun mapNonEmpty!2294 () Bool)

(declare-fun tp!6866 () Bool)

(assert (=> mapNonEmpty!2294 (= mapRes!2294 (and tp!6866 e!33287))))

(declare-fun mapRest!2294 () (Array (_ BitVec 32) ValueCell!762))

(declare-fun mapValue!2294 () ValueCell!762)

(declare-fun mapKey!2294 () (_ BitVec 32))

(assert (=> mapNonEmpty!2294 (= mapRest!2283 (store mapRest!2294 mapKey!2294 mapValue!2294))))

(assert (= (and mapNonEmpty!2283 condMapEmpty!2294) mapIsEmpty!2294))

(assert (= (and mapNonEmpty!2283 (not condMapEmpty!2294)) mapNonEmpty!2294))

(assert (= (and mapNonEmpty!2294 ((_ is ValueCellFull!762) mapValue!2294)) b!51341))

(assert (= (and mapNonEmpty!2283 ((_ is ValueCellFull!762) mapDefault!2294)) b!51342))

(declare-fun m!44235 () Bool)

(assert (=> mapNonEmpty!2294 m!44235))

(check-sat (not b!51330) (not b!51331) b_and!2801 (not b!51332) (not b_next!1591) (not d!10311) (not d!10313) b_and!2799 (not b_next!1589) (not mapNonEmpty!2293) tp_is_empty!2211 (not mapNonEmpty!2294))
(check-sat b_and!2799 b_and!2801 (not b_next!1589) (not b_next!1591))
(get-model)

(declare-fun b!51351 () Bool)

(declare-fun res!29395 () Bool)

(declare-fun e!33291 () Bool)

(assert (=> b!51351 (=> (not res!29395) (not e!33291))))

(assert (=> b!51351 (= res!29395 (and (= (size!1822 (_values!1913 newMap!16)) (bvadd (mask!5734 newMap!16) #b00000000000000000000000000000001)) (= (size!1821 (_keys!3544 newMap!16)) (size!1822 (_values!1913 newMap!16))) (bvsge (_size!265 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!265 newMap!16) (bvadd (mask!5734 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun d!10319 () Bool)

(declare-fun res!29392 () Bool)

(assert (=> d!10319 (=> (not res!29392) (not e!33291))))

(assert (=> d!10319 (= res!29392 (validMask!0 (mask!5734 newMap!16)))))

(assert (=> d!10319 (= (simpleValid!37 newMap!16) e!33291)))

(declare-fun b!51353 () Bool)

(declare-fun res!29393 () Bool)

(assert (=> b!51353 (=> (not res!29393) (not e!33291))))

(declare-fun size!1825 (LongMapFixedSize!432) (_ BitVec 32))

(assert (=> b!51353 (= res!29393 (= (size!1825 newMap!16) (bvadd (_size!265 newMap!16) (bvsdiv (bvadd (extraKeys!1821 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!51352 () Bool)

(declare-fun res!29394 () Bool)

(assert (=> b!51352 (=> (not res!29394) (not e!33291))))

(assert (=> b!51352 (= res!29394 (bvsge (size!1825 newMap!16) (_size!265 newMap!16)))))

(declare-fun b!51354 () Bool)

(assert (=> b!51354 (= e!33291 (and (bvsge (extraKeys!1821 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!1821 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!265 newMap!16) #b00000000000000000000000000000000)))))

(assert (= (and d!10319 res!29392) b!51351))

(assert (= (and b!51351 res!29395) b!51352))

(assert (= (and b!51352 res!29394) b!51353))

(assert (= (and b!51353 res!29393) b!51354))

(declare-fun m!44237 () Bool)

(assert (=> d!10319 m!44237))

(declare-fun m!44239 () Bool)

(assert (=> b!51353 m!44239))

(assert (=> b!51352 m!44239))

(assert (=> d!10311 d!10319))

(declare-fun b!51363 () Bool)

(declare-fun e!33298 () Bool)

(declare-fun call!3934 () Bool)

(assert (=> b!51363 (= e!33298 call!3934)))

(declare-fun bm!3931 () Bool)

(assert (=> bm!3931 (= call!3934 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3544 newMap!16) (mask!5734 newMap!16)))))

(declare-fun b!51364 () Bool)

(declare-fun e!33299 () Bool)

(declare-fun e!33300 () Bool)

(assert (=> b!51364 (= e!33299 e!33300)))

(declare-fun c!6878 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!51364 (= c!6878 (validKeyInArray!0 (select (arr!1595 (_keys!3544 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!10321 () Bool)

(declare-fun res!29401 () Bool)

(assert (=> d!10321 (=> res!29401 e!33299)))

(assert (=> d!10321 (= res!29401 (bvsge #b00000000000000000000000000000000 (size!1821 (_keys!3544 newMap!16))))))

(assert (=> d!10321 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3544 newMap!16) (mask!5734 newMap!16)) e!33299)))

(declare-fun b!51365 () Bool)

(assert (=> b!51365 (= e!33300 call!3934)))

(declare-fun b!51366 () Bool)

(assert (=> b!51366 (= e!33300 e!33298)))

(declare-fun lt!21160 () (_ BitVec 64))

(assert (=> b!51366 (= lt!21160 (select (arr!1595 (_keys!3544 newMap!16)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!1425 0))(
  ( (Unit!1426) )
))
(declare-fun lt!21159 () Unit!1425)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3339 (_ BitVec 64) (_ BitVec 32)) Unit!1425)

(assert (=> b!51366 (= lt!21159 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3544 newMap!16) lt!21160 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!3339 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!51366 (arrayContainsKey!0 (_keys!3544 newMap!16) lt!21160 #b00000000000000000000000000000000)))

(declare-fun lt!21158 () Unit!1425)

(assert (=> b!51366 (= lt!21158 lt!21159)))

(declare-fun res!29400 () Bool)

(declare-datatypes ((SeekEntryResult!222 0))(
  ( (MissingZero!222 (index!3010 (_ BitVec 32))) (Found!222 (index!3011 (_ BitVec 32))) (Intermediate!222 (undefined!1034 Bool) (index!3012 (_ BitVec 32)) (x!9354 (_ BitVec 32))) (Undefined!222) (MissingVacant!222 (index!3013 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3339 (_ BitVec 32)) SeekEntryResult!222)

(assert (=> b!51366 (= res!29400 (= (seekEntryOrOpen!0 (select (arr!1595 (_keys!3544 newMap!16)) #b00000000000000000000000000000000) (_keys!3544 newMap!16) (mask!5734 newMap!16)) (Found!222 #b00000000000000000000000000000000)))))

(assert (=> b!51366 (=> (not res!29400) (not e!33298))))

(assert (= (and d!10321 (not res!29401)) b!51364))

(assert (= (and b!51364 c!6878) b!51366))

(assert (= (and b!51364 (not c!6878)) b!51365))

(assert (= (and b!51366 res!29400) b!51363))

(assert (= (or b!51363 b!51365) bm!3931))

(declare-fun m!44241 () Bool)

(assert (=> bm!3931 m!44241))

(declare-fun m!44243 () Bool)

(assert (=> b!51364 m!44243))

(assert (=> b!51364 m!44243))

(declare-fun m!44245 () Bool)

(assert (=> b!51364 m!44245))

(assert (=> b!51366 m!44243))

(declare-fun m!44247 () Bool)

(assert (=> b!51366 m!44247))

(declare-fun m!44249 () Bool)

(assert (=> b!51366 m!44249))

(assert (=> b!51366 m!44243))

(declare-fun m!44251 () Bool)

(assert (=> b!51366 m!44251))

(assert (=> b!51331 d!10321))

(declare-fun d!10323 () Bool)

(declare-fun res!29402 () Bool)

(declare-fun e!33301 () Bool)

(assert (=> d!10323 (=> (not res!29402) (not e!33301))))

(assert (=> d!10323 (= res!29402 (simpleValid!37 (v!2189 (underlying!139 thiss!992))))))

(assert (=> d!10323 (= (valid!148 (v!2189 (underlying!139 thiss!992))) e!33301)))

(declare-fun b!51367 () Bool)

(declare-fun res!29403 () Bool)

(assert (=> b!51367 (=> (not res!29403) (not e!33301))))

(assert (=> b!51367 (= res!29403 (= (arrayCountValidKeys!0 (_keys!3544 (v!2189 (underlying!139 thiss!992))) #b00000000000000000000000000000000 (size!1821 (_keys!3544 (v!2189 (underlying!139 thiss!992))))) (_size!265 (v!2189 (underlying!139 thiss!992)))))))

(declare-fun b!51368 () Bool)

(declare-fun res!29404 () Bool)

(assert (=> b!51368 (=> (not res!29404) (not e!33301))))

(assert (=> b!51368 (= res!29404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3544 (v!2189 (underlying!139 thiss!992))) (mask!5734 (v!2189 (underlying!139 thiss!992)))))))

(declare-fun b!51369 () Bool)

(assert (=> b!51369 (= e!33301 (arrayNoDuplicates!0 (_keys!3544 (v!2189 (underlying!139 thiss!992))) #b00000000000000000000000000000000 Nil!1329))))

(assert (= (and d!10323 res!29402) b!51367))

(assert (= (and b!51367 res!29403) b!51368))

(assert (= (and b!51368 res!29404) b!51369))

(declare-fun m!44253 () Bool)

(assert (=> d!10323 m!44253))

(declare-fun m!44255 () Bool)

(assert (=> b!51367 m!44255))

(declare-fun m!44257 () Bool)

(assert (=> b!51368 m!44257))

(declare-fun m!44259 () Bool)

(assert (=> b!51369 m!44259))

(assert (=> d!10313 d!10323))

(declare-fun b!51380 () Bool)

(declare-fun e!33310 () Bool)

(declare-fun contains!622 (List!1332 (_ BitVec 64)) Bool)

(assert (=> b!51380 (= e!33310 (contains!622 Nil!1329 (select (arr!1595 (_keys!3544 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!51381 () Bool)

(declare-fun e!33311 () Bool)

(declare-fun call!3937 () Bool)

(assert (=> b!51381 (= e!33311 call!3937)))

(declare-fun b!51382 () Bool)

(assert (=> b!51382 (= e!33311 call!3937)))

(declare-fun b!51383 () Bool)

(declare-fun e!33313 () Bool)

(assert (=> b!51383 (= e!33313 e!33311)))

(declare-fun c!6881 () Bool)

(assert (=> b!51383 (= c!6881 (validKeyInArray!0 (select (arr!1595 (_keys!3544 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!10325 () Bool)

(declare-fun res!29412 () Bool)

(declare-fun e!33312 () Bool)

(assert (=> d!10325 (=> res!29412 e!33312)))

(assert (=> d!10325 (= res!29412 (bvsge #b00000000000000000000000000000000 (size!1821 (_keys!3544 newMap!16))))))

(assert (=> d!10325 (= (arrayNoDuplicates!0 (_keys!3544 newMap!16) #b00000000000000000000000000000000 Nil!1329) e!33312)))

(declare-fun bm!3934 () Bool)

(assert (=> bm!3934 (= call!3937 (arrayNoDuplicates!0 (_keys!3544 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6881 (Cons!1328 (select (arr!1595 (_keys!3544 newMap!16)) #b00000000000000000000000000000000) Nil!1329) Nil!1329)))))

(declare-fun b!51384 () Bool)

(assert (=> b!51384 (= e!33312 e!33313)))

(declare-fun res!29411 () Bool)

(assert (=> b!51384 (=> (not res!29411) (not e!33313))))

(assert (=> b!51384 (= res!29411 (not e!33310))))

(declare-fun res!29413 () Bool)

(assert (=> b!51384 (=> (not res!29413) (not e!33310))))

(assert (=> b!51384 (= res!29413 (validKeyInArray!0 (select (arr!1595 (_keys!3544 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!10325 (not res!29412)) b!51384))

(assert (= (and b!51384 res!29413) b!51380))

(assert (= (and b!51384 res!29411) b!51383))

(assert (= (and b!51383 c!6881) b!51382))

(assert (= (and b!51383 (not c!6881)) b!51381))

(assert (= (or b!51382 b!51381) bm!3934))

(assert (=> b!51380 m!44243))

(assert (=> b!51380 m!44243))

(declare-fun m!44261 () Bool)

(assert (=> b!51380 m!44261))

(assert (=> b!51383 m!44243))

(assert (=> b!51383 m!44243))

(assert (=> b!51383 m!44245))

(assert (=> bm!3934 m!44243))

(declare-fun m!44263 () Bool)

(assert (=> bm!3934 m!44263))

(assert (=> b!51384 m!44243))

(assert (=> b!51384 m!44243))

(assert (=> b!51384 m!44245))

(assert (=> b!51332 d!10325))

(declare-fun d!10327 () Bool)

(declare-fun lt!21163 () (_ BitVec 32))

(assert (=> d!10327 (and (bvsge lt!21163 #b00000000000000000000000000000000) (bvsle lt!21163 (bvsub (size!1821 (_keys!3544 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!33318 () (_ BitVec 32))

(assert (=> d!10327 (= lt!21163 e!33318)))

(declare-fun c!6886 () Bool)

(assert (=> d!10327 (= c!6886 (bvsge #b00000000000000000000000000000000 (size!1821 (_keys!3544 newMap!16))))))

(assert (=> d!10327 (and (bvsle #b00000000000000000000000000000000 (size!1821 (_keys!3544 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1821 (_keys!3544 newMap!16)) (size!1821 (_keys!3544 newMap!16))))))

(assert (=> d!10327 (= (arrayCountValidKeys!0 (_keys!3544 newMap!16) #b00000000000000000000000000000000 (size!1821 (_keys!3544 newMap!16))) lt!21163)))

(declare-fun b!51393 () Bool)

(assert (=> b!51393 (= e!33318 #b00000000000000000000000000000000)))

(declare-fun bm!3937 () Bool)

(declare-fun call!3940 () (_ BitVec 32))

(assert (=> bm!3937 (= call!3940 (arrayCountValidKeys!0 (_keys!3544 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1821 (_keys!3544 newMap!16))))))

(declare-fun b!51394 () Bool)

(declare-fun e!33319 () (_ BitVec 32))

(assert (=> b!51394 (= e!33318 e!33319)))

(declare-fun c!6887 () Bool)

(assert (=> b!51394 (= c!6887 (validKeyInArray!0 (select (arr!1595 (_keys!3544 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!51395 () Bool)

(assert (=> b!51395 (= e!33319 call!3940)))

(declare-fun b!51396 () Bool)

(assert (=> b!51396 (= e!33319 (bvadd #b00000000000000000000000000000001 call!3940))))

(assert (= (and d!10327 c!6886) b!51393))

(assert (= (and d!10327 (not c!6886)) b!51394))

(assert (= (and b!51394 c!6887) b!51396))

(assert (= (and b!51394 (not c!6887)) b!51395))

(assert (= (or b!51396 b!51395) bm!3937))

(declare-fun m!44265 () Bool)

(assert (=> bm!3937 m!44265))

(assert (=> b!51394 m!44243))

(assert (=> b!51394 m!44243))

(assert (=> b!51394 m!44245))

(assert (=> b!51330 d!10327))

(declare-fun mapIsEmpty!2295 () Bool)

(declare-fun mapRes!2295 () Bool)

(assert (=> mapIsEmpty!2295 mapRes!2295))

(declare-fun b!51398 () Bool)

(declare-fun e!33321 () Bool)

(assert (=> b!51398 (= e!33321 tp_is_empty!2211)))

(declare-fun condMapEmpty!2295 () Bool)

(declare-fun mapDefault!2295 () ValueCell!762)

(assert (=> mapNonEmpty!2293 (= condMapEmpty!2295 (= mapRest!2293 ((as const (Array (_ BitVec 32) ValueCell!762)) mapDefault!2295)))))

(assert (=> mapNonEmpty!2293 (= tp!6865 (and e!33321 mapRes!2295))))

(declare-fun b!51397 () Bool)

(declare-fun e!33320 () Bool)

(assert (=> b!51397 (= e!33320 tp_is_empty!2211)))

(declare-fun mapNonEmpty!2295 () Bool)

(declare-fun tp!6867 () Bool)

(assert (=> mapNonEmpty!2295 (= mapRes!2295 (and tp!6867 e!33320))))

(declare-fun mapRest!2295 () (Array (_ BitVec 32) ValueCell!762))

(declare-fun mapValue!2295 () ValueCell!762)

(declare-fun mapKey!2295 () (_ BitVec 32))

(assert (=> mapNonEmpty!2295 (= mapRest!2293 (store mapRest!2295 mapKey!2295 mapValue!2295))))

(assert (= (and mapNonEmpty!2293 condMapEmpty!2295) mapIsEmpty!2295))

(assert (= (and mapNonEmpty!2293 (not condMapEmpty!2295)) mapNonEmpty!2295))

(assert (= (and mapNonEmpty!2295 ((_ is ValueCellFull!762) mapValue!2295)) b!51397))

(assert (= (and mapNonEmpty!2293 ((_ is ValueCellFull!762) mapDefault!2295)) b!51398))

(declare-fun m!44267 () Bool)

(assert (=> mapNonEmpty!2295 m!44267))

(declare-fun mapIsEmpty!2296 () Bool)

(declare-fun mapRes!2296 () Bool)

(assert (=> mapIsEmpty!2296 mapRes!2296))

(declare-fun b!51400 () Bool)

(declare-fun e!33323 () Bool)

(assert (=> b!51400 (= e!33323 tp_is_empty!2211)))

(declare-fun condMapEmpty!2296 () Bool)

(declare-fun mapDefault!2296 () ValueCell!762)

(assert (=> mapNonEmpty!2294 (= condMapEmpty!2296 (= mapRest!2294 ((as const (Array (_ BitVec 32) ValueCell!762)) mapDefault!2296)))))

(assert (=> mapNonEmpty!2294 (= tp!6866 (and e!33323 mapRes!2296))))

(declare-fun b!51399 () Bool)

(declare-fun e!33322 () Bool)

(assert (=> b!51399 (= e!33322 tp_is_empty!2211)))

(declare-fun mapNonEmpty!2296 () Bool)

(declare-fun tp!6868 () Bool)

(assert (=> mapNonEmpty!2296 (= mapRes!2296 (and tp!6868 e!33322))))

(declare-fun mapValue!2296 () ValueCell!762)

(declare-fun mapRest!2296 () (Array (_ BitVec 32) ValueCell!762))

(declare-fun mapKey!2296 () (_ BitVec 32))

(assert (=> mapNonEmpty!2296 (= mapRest!2294 (store mapRest!2296 mapKey!2296 mapValue!2296))))

(assert (= (and mapNonEmpty!2294 condMapEmpty!2296) mapIsEmpty!2296))

(assert (= (and mapNonEmpty!2294 (not condMapEmpty!2296)) mapNonEmpty!2296))

(assert (= (and mapNonEmpty!2296 ((_ is ValueCellFull!762) mapValue!2296)) b!51399))

(assert (= (and mapNonEmpty!2294 ((_ is ValueCellFull!762) mapDefault!2296)) b!51400))

(declare-fun m!44269 () Bool)

(assert (=> mapNonEmpty!2296 m!44269))

(check-sat (not b!51384) (not b!51353) (not bm!3934) (not b!51380) (not b!51394) (not d!10319) (not bm!3931) (not bm!3937) (not d!10323) (not b!51364) b_and!2801 (not mapNonEmpty!2295) (not b!51368) (not b!51367) b_and!2799 (not b!51369) (not b!51383) (not b!51366) (not b_next!1591) (not b_next!1589) tp_is_empty!2211 (not mapNonEmpty!2296) (not b!51352))
(check-sat b_and!2799 b_and!2801 (not b_next!1589) (not b_next!1591))
(get-model)

(declare-fun d!10329 () Bool)

(assert (=> d!10329 (= (size!1825 newMap!16) (bvadd (_size!265 newMap!16) (bvsdiv (bvadd (extraKeys!1821 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!51353 d!10329))

(declare-fun b!51401 () Bool)

(declare-fun e!33324 () Bool)

(declare-fun call!3941 () Bool)

(assert (=> b!51401 (= e!33324 call!3941)))

(declare-fun bm!3938 () Bool)

(assert (=> bm!3938 (= call!3941 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3544 newMap!16) (mask!5734 newMap!16)))))

(declare-fun b!51402 () Bool)

(declare-fun e!33325 () Bool)

(declare-fun e!33326 () Bool)

(assert (=> b!51402 (= e!33325 e!33326)))

(declare-fun c!6888 () Bool)

(assert (=> b!51402 (= c!6888 (validKeyInArray!0 (select (arr!1595 (_keys!3544 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!10331 () Bool)

(declare-fun res!29415 () Bool)

(assert (=> d!10331 (=> res!29415 e!33325)))

(assert (=> d!10331 (= res!29415 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1821 (_keys!3544 newMap!16))))))

(assert (=> d!10331 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3544 newMap!16) (mask!5734 newMap!16)) e!33325)))

(declare-fun b!51403 () Bool)

(assert (=> b!51403 (= e!33326 call!3941)))

(declare-fun b!51404 () Bool)

(assert (=> b!51404 (= e!33326 e!33324)))

(declare-fun lt!21166 () (_ BitVec 64))

(assert (=> b!51404 (= lt!21166 (select (arr!1595 (_keys!3544 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!21165 () Unit!1425)

(assert (=> b!51404 (= lt!21165 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3544 newMap!16) lt!21166 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!51404 (arrayContainsKey!0 (_keys!3544 newMap!16) lt!21166 #b00000000000000000000000000000000)))

(declare-fun lt!21164 () Unit!1425)

(assert (=> b!51404 (= lt!21164 lt!21165)))

(declare-fun res!29414 () Bool)

(assert (=> b!51404 (= res!29414 (= (seekEntryOrOpen!0 (select (arr!1595 (_keys!3544 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3544 newMap!16) (mask!5734 newMap!16)) (Found!222 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!51404 (=> (not res!29414) (not e!33324))))

(assert (= (and d!10331 (not res!29415)) b!51402))

(assert (= (and b!51402 c!6888) b!51404))

(assert (= (and b!51402 (not c!6888)) b!51403))

(assert (= (and b!51404 res!29414) b!51401))

(assert (= (or b!51401 b!51403) bm!3938))

(declare-fun m!44271 () Bool)

(assert (=> bm!3938 m!44271))

(declare-fun m!44273 () Bool)

(assert (=> b!51402 m!44273))

(assert (=> b!51402 m!44273))

(declare-fun m!44275 () Bool)

(assert (=> b!51402 m!44275))

(assert (=> b!51404 m!44273))

(declare-fun m!44277 () Bool)

(assert (=> b!51404 m!44277))

(declare-fun m!44279 () Bool)

(assert (=> b!51404 m!44279))

(assert (=> b!51404 m!44273))

(declare-fun m!44281 () Bool)

(assert (=> b!51404 m!44281))

(assert (=> bm!3931 d!10331))

(declare-fun d!10333 () Bool)

(assert (=> d!10333 (= (validKeyInArray!0 (select (arr!1595 (_keys!3544 newMap!16)) #b00000000000000000000000000000000)) (and (not (= (select (arr!1595 (_keys!3544 newMap!16)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1595 (_keys!3544 newMap!16)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!51394 d!10333))

(assert (=> b!51352 d!10329))

(assert (=> b!51384 d!10333))

(assert (=> b!51383 d!10333))

(declare-fun d!10335 () Bool)

(declare-fun lt!21167 () (_ BitVec 32))

(assert (=> d!10335 (and (bvsge lt!21167 #b00000000000000000000000000000000) (bvsle lt!21167 (bvsub (size!1821 (_keys!3544 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!33327 () (_ BitVec 32))

(assert (=> d!10335 (= lt!21167 e!33327)))

(declare-fun c!6889 () Bool)

(assert (=> d!10335 (= c!6889 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1821 (_keys!3544 newMap!16))))))

(assert (=> d!10335 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1821 (_keys!3544 newMap!16))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!1821 (_keys!3544 newMap!16)) (size!1821 (_keys!3544 newMap!16))))))

(assert (=> d!10335 (= (arrayCountValidKeys!0 (_keys!3544 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1821 (_keys!3544 newMap!16))) lt!21167)))

(declare-fun b!51405 () Bool)

(assert (=> b!51405 (= e!33327 #b00000000000000000000000000000000)))

(declare-fun bm!3939 () Bool)

(declare-fun call!3942 () (_ BitVec 32))

(assert (=> bm!3939 (= call!3942 (arrayCountValidKeys!0 (_keys!3544 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1821 (_keys!3544 newMap!16))))))

(declare-fun b!51406 () Bool)

(declare-fun e!33328 () (_ BitVec 32))

(assert (=> b!51406 (= e!33327 e!33328)))

(declare-fun c!6890 () Bool)

(assert (=> b!51406 (= c!6890 (validKeyInArray!0 (select (arr!1595 (_keys!3544 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!51407 () Bool)

(assert (=> b!51407 (= e!33328 call!3942)))

(declare-fun b!51408 () Bool)

(assert (=> b!51408 (= e!33328 (bvadd #b00000000000000000000000000000001 call!3942))))

(assert (= (and d!10335 c!6889) b!51405))

(assert (= (and d!10335 (not c!6889)) b!51406))

(assert (= (and b!51406 c!6890) b!51408))

(assert (= (and b!51406 (not c!6890)) b!51407))

(assert (= (or b!51408 b!51407) bm!3939))

(declare-fun m!44283 () Bool)

(assert (=> bm!3939 m!44283))

(assert (=> b!51406 m!44273))

(assert (=> b!51406 m!44273))

(assert (=> b!51406 m!44275))

(assert (=> bm!3937 d!10335))

(declare-fun b!51409 () Bool)

(declare-fun e!33329 () Bool)

(assert (=> b!51409 (= e!33329 (contains!622 (ite c!6881 (Cons!1328 (select (arr!1595 (_keys!3544 newMap!16)) #b00000000000000000000000000000000) Nil!1329) Nil!1329) (select (arr!1595 (_keys!3544 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!51410 () Bool)

(declare-fun e!33330 () Bool)

(declare-fun call!3943 () Bool)

(assert (=> b!51410 (= e!33330 call!3943)))

(declare-fun b!51411 () Bool)

(assert (=> b!51411 (= e!33330 call!3943)))

(declare-fun b!51412 () Bool)

(declare-fun e!33332 () Bool)

(assert (=> b!51412 (= e!33332 e!33330)))

(declare-fun c!6891 () Bool)

(assert (=> b!51412 (= c!6891 (validKeyInArray!0 (select (arr!1595 (_keys!3544 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!10337 () Bool)

(declare-fun res!29417 () Bool)

(declare-fun e!33331 () Bool)

(assert (=> d!10337 (=> res!29417 e!33331)))

(assert (=> d!10337 (= res!29417 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1821 (_keys!3544 newMap!16))))))

(assert (=> d!10337 (= (arrayNoDuplicates!0 (_keys!3544 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6881 (Cons!1328 (select (arr!1595 (_keys!3544 newMap!16)) #b00000000000000000000000000000000) Nil!1329) Nil!1329)) e!33331)))

(declare-fun bm!3940 () Bool)

(assert (=> bm!3940 (= call!3943 (arrayNoDuplicates!0 (_keys!3544 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!6891 (Cons!1328 (select (arr!1595 (_keys!3544 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!6881 (Cons!1328 (select (arr!1595 (_keys!3544 newMap!16)) #b00000000000000000000000000000000) Nil!1329) Nil!1329)) (ite c!6881 (Cons!1328 (select (arr!1595 (_keys!3544 newMap!16)) #b00000000000000000000000000000000) Nil!1329) Nil!1329))))))

(declare-fun b!51413 () Bool)

(assert (=> b!51413 (= e!33331 e!33332)))

(declare-fun res!29416 () Bool)

(assert (=> b!51413 (=> (not res!29416) (not e!33332))))

(assert (=> b!51413 (= res!29416 (not e!33329))))

(declare-fun res!29418 () Bool)

(assert (=> b!51413 (=> (not res!29418) (not e!33329))))

(assert (=> b!51413 (= res!29418 (validKeyInArray!0 (select (arr!1595 (_keys!3544 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!10337 (not res!29417)) b!51413))

(assert (= (and b!51413 res!29418) b!51409))

(assert (= (and b!51413 res!29416) b!51412))

(assert (= (and b!51412 c!6891) b!51411))

(assert (= (and b!51412 (not c!6891)) b!51410))

(assert (= (or b!51411 b!51410) bm!3940))

(assert (=> b!51409 m!44273))

(assert (=> b!51409 m!44273))

(declare-fun m!44285 () Bool)

(assert (=> b!51409 m!44285))

(assert (=> b!51412 m!44273))

(assert (=> b!51412 m!44273))

(assert (=> b!51412 m!44275))

(assert (=> bm!3940 m!44273))

(declare-fun m!44287 () Bool)

(assert (=> bm!3940 m!44287))

(assert (=> b!51413 m!44273))

(assert (=> b!51413 m!44273))

(assert (=> b!51413 m!44275))

(assert (=> bm!3934 d!10337))

(declare-fun b!51414 () Bool)

(declare-fun res!29422 () Bool)

(declare-fun e!33333 () Bool)

(assert (=> b!51414 (=> (not res!29422) (not e!33333))))

(assert (=> b!51414 (= res!29422 (and (= (size!1822 (_values!1913 (v!2189 (underlying!139 thiss!992)))) (bvadd (mask!5734 (v!2189 (underlying!139 thiss!992))) #b00000000000000000000000000000001)) (= (size!1821 (_keys!3544 (v!2189 (underlying!139 thiss!992)))) (size!1822 (_values!1913 (v!2189 (underlying!139 thiss!992))))) (bvsge (_size!265 (v!2189 (underlying!139 thiss!992))) #b00000000000000000000000000000000) (bvsle (_size!265 (v!2189 (underlying!139 thiss!992))) (bvadd (mask!5734 (v!2189 (underlying!139 thiss!992))) #b00000000000000000000000000000001))))))

(declare-fun d!10339 () Bool)

(declare-fun res!29419 () Bool)

(assert (=> d!10339 (=> (not res!29419) (not e!33333))))

(assert (=> d!10339 (= res!29419 (validMask!0 (mask!5734 (v!2189 (underlying!139 thiss!992)))))))

(assert (=> d!10339 (= (simpleValid!37 (v!2189 (underlying!139 thiss!992))) e!33333)))

(declare-fun b!51416 () Bool)

(declare-fun res!29420 () Bool)

(assert (=> b!51416 (=> (not res!29420) (not e!33333))))

(assert (=> b!51416 (= res!29420 (= (size!1825 (v!2189 (underlying!139 thiss!992))) (bvadd (_size!265 (v!2189 (underlying!139 thiss!992))) (bvsdiv (bvadd (extraKeys!1821 (v!2189 (underlying!139 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!51415 () Bool)

(declare-fun res!29421 () Bool)

(assert (=> b!51415 (=> (not res!29421) (not e!33333))))

(assert (=> b!51415 (= res!29421 (bvsge (size!1825 (v!2189 (underlying!139 thiss!992))) (_size!265 (v!2189 (underlying!139 thiss!992)))))))

(declare-fun b!51417 () Bool)

(assert (=> b!51417 (= e!33333 (and (bvsge (extraKeys!1821 (v!2189 (underlying!139 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1821 (v!2189 (underlying!139 thiss!992))) #b00000000000000000000000000000011) (bvsge (_vacant!265 (v!2189 (underlying!139 thiss!992))) #b00000000000000000000000000000000)))))

(assert (= (and d!10339 res!29419) b!51414))

(assert (= (and b!51414 res!29422) b!51415))

(assert (= (and b!51415 res!29421) b!51416))

(assert (= (and b!51416 res!29420) b!51417))

(assert (=> d!10339 m!44197))

(declare-fun m!44289 () Bool)

(assert (=> b!51416 m!44289))

(assert (=> b!51415 m!44289))

(assert (=> d!10323 d!10339))

(declare-fun d!10341 () Bool)

(declare-fun lt!21170 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!59 (List!1332) (InoxSet (_ BitVec 64)))

(assert (=> d!10341 (= lt!21170 (select (content!59 Nil!1329) (select (arr!1595 (_keys!3544 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!33338 () Bool)

(assert (=> d!10341 (= lt!21170 e!33338)))

(declare-fun res!29427 () Bool)

(assert (=> d!10341 (=> (not res!29427) (not e!33338))))

(assert (=> d!10341 (= res!29427 ((_ is Cons!1328) Nil!1329))))

(assert (=> d!10341 (= (contains!622 Nil!1329 (select (arr!1595 (_keys!3544 newMap!16)) #b00000000000000000000000000000000)) lt!21170)))

(declare-fun b!51422 () Bool)

(declare-fun e!33339 () Bool)

(assert (=> b!51422 (= e!33338 e!33339)))

(declare-fun res!29428 () Bool)

(assert (=> b!51422 (=> res!29428 e!33339)))

(assert (=> b!51422 (= res!29428 (= (h!1908 Nil!1329) (select (arr!1595 (_keys!3544 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!51423 () Bool)

(assert (=> b!51423 (= e!33339 (contains!622 (t!4366 Nil!1329) (select (arr!1595 (_keys!3544 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!10341 res!29427) b!51422))

(assert (= (and b!51422 (not res!29428)) b!51423))

(declare-fun m!44291 () Bool)

(assert (=> d!10341 m!44291))

(assert (=> d!10341 m!44243))

(declare-fun m!44293 () Bool)

(assert (=> d!10341 m!44293))

(assert (=> b!51423 m!44243))

(declare-fun m!44295 () Bool)

(assert (=> b!51423 m!44295))

(assert (=> b!51380 d!10341))

(declare-fun d!10343 () Bool)

(assert (=> d!10343 (= (validMask!0 (mask!5734 newMap!16)) (and (or (= (mask!5734 newMap!16) #b00000000000000000000000000000111) (= (mask!5734 newMap!16) #b00000000000000000000000000001111) (= (mask!5734 newMap!16) #b00000000000000000000000000011111) (= (mask!5734 newMap!16) #b00000000000000000000000000111111) (= (mask!5734 newMap!16) #b00000000000000000000000001111111) (= (mask!5734 newMap!16) #b00000000000000000000000011111111) (= (mask!5734 newMap!16) #b00000000000000000000000111111111) (= (mask!5734 newMap!16) #b00000000000000000000001111111111) (= (mask!5734 newMap!16) #b00000000000000000000011111111111) (= (mask!5734 newMap!16) #b00000000000000000000111111111111) (= (mask!5734 newMap!16) #b00000000000000000001111111111111) (= (mask!5734 newMap!16) #b00000000000000000011111111111111) (= (mask!5734 newMap!16) #b00000000000000000111111111111111) (= (mask!5734 newMap!16) #b00000000000000001111111111111111) (= (mask!5734 newMap!16) #b00000000000000011111111111111111) (= (mask!5734 newMap!16) #b00000000000000111111111111111111) (= (mask!5734 newMap!16) #b00000000000001111111111111111111) (= (mask!5734 newMap!16) #b00000000000011111111111111111111) (= (mask!5734 newMap!16) #b00000000000111111111111111111111) (= (mask!5734 newMap!16) #b00000000001111111111111111111111) (= (mask!5734 newMap!16) #b00000000011111111111111111111111) (= (mask!5734 newMap!16) #b00000000111111111111111111111111) (= (mask!5734 newMap!16) #b00000001111111111111111111111111) (= (mask!5734 newMap!16) #b00000011111111111111111111111111) (= (mask!5734 newMap!16) #b00000111111111111111111111111111) (= (mask!5734 newMap!16) #b00001111111111111111111111111111) (= (mask!5734 newMap!16) #b00011111111111111111111111111111) (= (mask!5734 newMap!16) #b00111111111111111111111111111111)) (bvsle (mask!5734 newMap!16) #b00111111111111111111111111111111)))))

(assert (=> d!10319 d!10343))

(declare-fun b!51424 () Bool)

(declare-fun e!33340 () Bool)

(assert (=> b!51424 (= e!33340 (contains!622 Nil!1329 (select (arr!1595 (_keys!3544 (v!2189 (underlying!139 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!51425 () Bool)

(declare-fun e!33341 () Bool)

(declare-fun call!3944 () Bool)

(assert (=> b!51425 (= e!33341 call!3944)))

(declare-fun b!51426 () Bool)

(assert (=> b!51426 (= e!33341 call!3944)))

(declare-fun b!51427 () Bool)

(declare-fun e!33343 () Bool)

(assert (=> b!51427 (= e!33343 e!33341)))

(declare-fun c!6892 () Bool)

(assert (=> b!51427 (= c!6892 (validKeyInArray!0 (select (arr!1595 (_keys!3544 (v!2189 (underlying!139 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!10345 () Bool)

(declare-fun res!29430 () Bool)

(declare-fun e!33342 () Bool)

(assert (=> d!10345 (=> res!29430 e!33342)))

(assert (=> d!10345 (= res!29430 (bvsge #b00000000000000000000000000000000 (size!1821 (_keys!3544 (v!2189 (underlying!139 thiss!992))))))))

(assert (=> d!10345 (= (arrayNoDuplicates!0 (_keys!3544 (v!2189 (underlying!139 thiss!992))) #b00000000000000000000000000000000 Nil!1329) e!33342)))

(declare-fun bm!3941 () Bool)

(assert (=> bm!3941 (= call!3944 (arrayNoDuplicates!0 (_keys!3544 (v!2189 (underlying!139 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!6892 (Cons!1328 (select (arr!1595 (_keys!3544 (v!2189 (underlying!139 thiss!992)))) #b00000000000000000000000000000000) Nil!1329) Nil!1329)))))

(declare-fun b!51428 () Bool)

(assert (=> b!51428 (= e!33342 e!33343)))

(declare-fun res!29429 () Bool)

(assert (=> b!51428 (=> (not res!29429) (not e!33343))))

(assert (=> b!51428 (= res!29429 (not e!33340))))

(declare-fun res!29431 () Bool)

(assert (=> b!51428 (=> (not res!29431) (not e!33340))))

(assert (=> b!51428 (= res!29431 (validKeyInArray!0 (select (arr!1595 (_keys!3544 (v!2189 (underlying!139 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!10345 (not res!29430)) b!51428))

(assert (= (and b!51428 res!29431) b!51424))

(assert (= (and b!51428 res!29429) b!51427))

(assert (= (and b!51427 c!6892) b!51426))

(assert (= (and b!51427 (not c!6892)) b!51425))

(assert (= (or b!51426 b!51425) bm!3941))

(declare-fun m!44297 () Bool)

(assert (=> b!51424 m!44297))

(assert (=> b!51424 m!44297))

(declare-fun m!44299 () Bool)

(assert (=> b!51424 m!44299))

(assert (=> b!51427 m!44297))

(assert (=> b!51427 m!44297))

(declare-fun m!44301 () Bool)

(assert (=> b!51427 m!44301))

(assert (=> bm!3941 m!44297))

(declare-fun m!44303 () Bool)

(assert (=> bm!3941 m!44303))

(assert (=> b!51428 m!44297))

(assert (=> b!51428 m!44297))

(assert (=> b!51428 m!44301))

(assert (=> b!51369 d!10345))

(declare-fun d!10347 () Bool)

(assert (=> d!10347 (arrayContainsKey!0 (_keys!3544 newMap!16) lt!21160 #b00000000000000000000000000000000)))

(declare-fun lt!21173 () Unit!1425)

(declare-fun choose!13 (array!3339 (_ BitVec 64) (_ BitVec 32)) Unit!1425)

(assert (=> d!10347 (= lt!21173 (choose!13 (_keys!3544 newMap!16) lt!21160 #b00000000000000000000000000000000))))

(assert (=> d!10347 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!10347 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3544 newMap!16) lt!21160 #b00000000000000000000000000000000) lt!21173)))

(declare-fun bs!2377 () Bool)

(assert (= bs!2377 d!10347))

(assert (=> bs!2377 m!44249))

(declare-fun m!44305 () Bool)

(assert (=> bs!2377 m!44305))

(assert (=> b!51366 d!10347))

(declare-fun d!10349 () Bool)

(declare-fun res!29436 () Bool)

(declare-fun e!33348 () Bool)

(assert (=> d!10349 (=> res!29436 e!33348)))

(assert (=> d!10349 (= res!29436 (= (select (arr!1595 (_keys!3544 newMap!16)) #b00000000000000000000000000000000) lt!21160))))

(assert (=> d!10349 (= (arrayContainsKey!0 (_keys!3544 newMap!16) lt!21160 #b00000000000000000000000000000000) e!33348)))

(declare-fun b!51433 () Bool)

(declare-fun e!33349 () Bool)

(assert (=> b!51433 (= e!33348 e!33349)))

(declare-fun res!29437 () Bool)

(assert (=> b!51433 (=> (not res!29437) (not e!33349))))

(assert (=> b!51433 (= res!29437 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1821 (_keys!3544 newMap!16))))))

(declare-fun b!51434 () Bool)

(assert (=> b!51434 (= e!33349 (arrayContainsKey!0 (_keys!3544 newMap!16) lt!21160 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!10349 (not res!29436)) b!51433))

(assert (= (and b!51433 res!29437) b!51434))

(assert (=> d!10349 m!44243))

(declare-fun m!44307 () Bool)

(assert (=> b!51434 m!44307))

(assert (=> b!51366 d!10349))

(declare-fun b!51447 () Bool)

(declare-fun e!33356 () SeekEntryResult!222)

(declare-fun lt!21182 () SeekEntryResult!222)

(assert (=> b!51447 (= e!33356 (Found!222 (index!3012 lt!21182)))))

(declare-fun b!51448 () Bool)

(declare-fun e!33357 () SeekEntryResult!222)

(assert (=> b!51448 (= e!33357 Undefined!222)))

(declare-fun b!51449 () Bool)

(declare-fun e!33358 () SeekEntryResult!222)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3339 (_ BitVec 32)) SeekEntryResult!222)

(assert (=> b!51449 (= e!33358 (seekKeyOrZeroReturnVacant!0 (x!9354 lt!21182) (index!3012 lt!21182) (index!3012 lt!21182) (select (arr!1595 (_keys!3544 newMap!16)) #b00000000000000000000000000000000) (_keys!3544 newMap!16) (mask!5734 newMap!16)))))

(declare-fun d!10351 () Bool)

(declare-fun lt!21180 () SeekEntryResult!222)

(assert (=> d!10351 (and (or ((_ is Undefined!222) lt!21180) (not ((_ is Found!222) lt!21180)) (and (bvsge (index!3011 lt!21180) #b00000000000000000000000000000000) (bvslt (index!3011 lt!21180) (size!1821 (_keys!3544 newMap!16))))) (or ((_ is Undefined!222) lt!21180) ((_ is Found!222) lt!21180) (not ((_ is MissingZero!222) lt!21180)) (and (bvsge (index!3010 lt!21180) #b00000000000000000000000000000000) (bvslt (index!3010 lt!21180) (size!1821 (_keys!3544 newMap!16))))) (or ((_ is Undefined!222) lt!21180) ((_ is Found!222) lt!21180) ((_ is MissingZero!222) lt!21180) (not ((_ is MissingVacant!222) lt!21180)) (and (bvsge (index!3013 lt!21180) #b00000000000000000000000000000000) (bvslt (index!3013 lt!21180) (size!1821 (_keys!3544 newMap!16))))) (or ((_ is Undefined!222) lt!21180) (ite ((_ is Found!222) lt!21180) (= (select (arr!1595 (_keys!3544 newMap!16)) (index!3011 lt!21180)) (select (arr!1595 (_keys!3544 newMap!16)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!222) lt!21180) (= (select (arr!1595 (_keys!3544 newMap!16)) (index!3010 lt!21180)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!222) lt!21180) (= (select (arr!1595 (_keys!3544 newMap!16)) (index!3013 lt!21180)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!10351 (= lt!21180 e!33357)))

(declare-fun c!6900 () Bool)

(assert (=> d!10351 (= c!6900 (and ((_ is Intermediate!222) lt!21182) (undefined!1034 lt!21182)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3339 (_ BitVec 32)) SeekEntryResult!222)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!10351 (= lt!21182 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1595 (_keys!3544 newMap!16)) #b00000000000000000000000000000000) (mask!5734 newMap!16)) (select (arr!1595 (_keys!3544 newMap!16)) #b00000000000000000000000000000000) (_keys!3544 newMap!16) (mask!5734 newMap!16)))))

(assert (=> d!10351 (validMask!0 (mask!5734 newMap!16))))

(assert (=> d!10351 (= (seekEntryOrOpen!0 (select (arr!1595 (_keys!3544 newMap!16)) #b00000000000000000000000000000000) (_keys!3544 newMap!16) (mask!5734 newMap!16)) lt!21180)))

(declare-fun b!51450 () Bool)

(declare-fun c!6901 () Bool)

(declare-fun lt!21181 () (_ BitVec 64))

(assert (=> b!51450 (= c!6901 (= lt!21181 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!51450 (= e!33356 e!33358)))

(declare-fun b!51451 () Bool)

(assert (=> b!51451 (= e!33358 (MissingZero!222 (index!3012 lt!21182)))))

(declare-fun b!51452 () Bool)

(assert (=> b!51452 (= e!33357 e!33356)))

(assert (=> b!51452 (= lt!21181 (select (arr!1595 (_keys!3544 newMap!16)) (index!3012 lt!21182)))))

(declare-fun c!6899 () Bool)

(assert (=> b!51452 (= c!6899 (= lt!21181 (select (arr!1595 (_keys!3544 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!10351 c!6900) b!51448))

(assert (= (and d!10351 (not c!6900)) b!51452))

(assert (= (and b!51452 c!6899) b!51447))

(assert (= (and b!51452 (not c!6899)) b!51450))

(assert (= (and b!51450 c!6901) b!51451))

(assert (= (and b!51450 (not c!6901)) b!51449))

(assert (=> b!51449 m!44243))

(declare-fun m!44309 () Bool)

(assert (=> b!51449 m!44309))

(assert (=> d!10351 m!44237))

(declare-fun m!44311 () Bool)

(assert (=> d!10351 m!44311))

(declare-fun m!44313 () Bool)

(assert (=> d!10351 m!44313))

(declare-fun m!44315 () Bool)

(assert (=> d!10351 m!44315))

(declare-fun m!44317 () Bool)

(assert (=> d!10351 m!44317))

(assert (=> d!10351 m!44243))

(declare-fun m!44319 () Bool)

(assert (=> d!10351 m!44319))

(assert (=> d!10351 m!44243))

(assert (=> d!10351 m!44317))

(declare-fun m!44321 () Bool)

(assert (=> b!51452 m!44321))

(assert (=> b!51366 d!10351))

(declare-fun d!10353 () Bool)

(declare-fun lt!21183 () (_ BitVec 32))

(assert (=> d!10353 (and (bvsge lt!21183 #b00000000000000000000000000000000) (bvsle lt!21183 (bvsub (size!1821 (_keys!3544 (v!2189 (underlying!139 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun e!33359 () (_ BitVec 32))

(assert (=> d!10353 (= lt!21183 e!33359)))

(declare-fun c!6902 () Bool)

(assert (=> d!10353 (= c!6902 (bvsge #b00000000000000000000000000000000 (size!1821 (_keys!3544 (v!2189 (underlying!139 thiss!992))))))))

(assert (=> d!10353 (and (bvsle #b00000000000000000000000000000000 (size!1821 (_keys!3544 (v!2189 (underlying!139 thiss!992))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1821 (_keys!3544 (v!2189 (underlying!139 thiss!992)))) (size!1821 (_keys!3544 (v!2189 (underlying!139 thiss!992))))))))

(assert (=> d!10353 (= (arrayCountValidKeys!0 (_keys!3544 (v!2189 (underlying!139 thiss!992))) #b00000000000000000000000000000000 (size!1821 (_keys!3544 (v!2189 (underlying!139 thiss!992))))) lt!21183)))

(declare-fun b!51453 () Bool)

(assert (=> b!51453 (= e!33359 #b00000000000000000000000000000000)))

(declare-fun bm!3942 () Bool)

(declare-fun call!3945 () (_ BitVec 32))

(assert (=> bm!3942 (= call!3945 (arrayCountValidKeys!0 (_keys!3544 (v!2189 (underlying!139 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1821 (_keys!3544 (v!2189 (underlying!139 thiss!992))))))))

(declare-fun b!51454 () Bool)

(declare-fun e!33360 () (_ BitVec 32))

(assert (=> b!51454 (= e!33359 e!33360)))

(declare-fun c!6903 () Bool)

(assert (=> b!51454 (= c!6903 (validKeyInArray!0 (select (arr!1595 (_keys!3544 (v!2189 (underlying!139 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!51455 () Bool)

(assert (=> b!51455 (= e!33360 call!3945)))

(declare-fun b!51456 () Bool)

(assert (=> b!51456 (= e!33360 (bvadd #b00000000000000000000000000000001 call!3945))))

(assert (= (and d!10353 c!6902) b!51453))

(assert (= (and d!10353 (not c!6902)) b!51454))

(assert (= (and b!51454 c!6903) b!51456))

(assert (= (and b!51454 (not c!6903)) b!51455))

(assert (= (or b!51456 b!51455) bm!3942))

(declare-fun m!44323 () Bool)

(assert (=> bm!3942 m!44323))

(assert (=> b!51454 m!44297))

(assert (=> b!51454 m!44297))

(assert (=> b!51454 m!44301))

(assert (=> b!51367 d!10353))

(assert (=> b!51364 d!10333))

(declare-fun b!51457 () Bool)

(declare-fun e!33361 () Bool)

(declare-fun call!3946 () Bool)

(assert (=> b!51457 (= e!33361 call!3946)))

(declare-fun bm!3943 () Bool)

(assert (=> bm!3943 (= call!3946 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3544 (v!2189 (underlying!139 thiss!992))) (mask!5734 (v!2189 (underlying!139 thiss!992)))))))

(declare-fun b!51458 () Bool)

(declare-fun e!33362 () Bool)

(declare-fun e!33363 () Bool)

(assert (=> b!51458 (= e!33362 e!33363)))

(declare-fun c!6904 () Bool)

(assert (=> b!51458 (= c!6904 (validKeyInArray!0 (select (arr!1595 (_keys!3544 (v!2189 (underlying!139 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!10355 () Bool)

(declare-fun res!29439 () Bool)

(assert (=> d!10355 (=> res!29439 e!33362)))

(assert (=> d!10355 (= res!29439 (bvsge #b00000000000000000000000000000000 (size!1821 (_keys!3544 (v!2189 (underlying!139 thiss!992))))))))

(assert (=> d!10355 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3544 (v!2189 (underlying!139 thiss!992))) (mask!5734 (v!2189 (underlying!139 thiss!992)))) e!33362)))

(declare-fun b!51459 () Bool)

(assert (=> b!51459 (= e!33363 call!3946)))

(declare-fun b!51460 () Bool)

(assert (=> b!51460 (= e!33363 e!33361)))

(declare-fun lt!21186 () (_ BitVec 64))

(assert (=> b!51460 (= lt!21186 (select (arr!1595 (_keys!3544 (v!2189 (underlying!139 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!21185 () Unit!1425)

(assert (=> b!51460 (= lt!21185 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3544 (v!2189 (underlying!139 thiss!992))) lt!21186 #b00000000000000000000000000000000))))

(assert (=> b!51460 (arrayContainsKey!0 (_keys!3544 (v!2189 (underlying!139 thiss!992))) lt!21186 #b00000000000000000000000000000000)))

(declare-fun lt!21184 () Unit!1425)

(assert (=> b!51460 (= lt!21184 lt!21185)))

(declare-fun res!29438 () Bool)

(assert (=> b!51460 (= res!29438 (= (seekEntryOrOpen!0 (select (arr!1595 (_keys!3544 (v!2189 (underlying!139 thiss!992)))) #b00000000000000000000000000000000) (_keys!3544 (v!2189 (underlying!139 thiss!992))) (mask!5734 (v!2189 (underlying!139 thiss!992)))) (Found!222 #b00000000000000000000000000000000)))))

(assert (=> b!51460 (=> (not res!29438) (not e!33361))))

(assert (= (and d!10355 (not res!29439)) b!51458))

(assert (= (and b!51458 c!6904) b!51460))

(assert (= (and b!51458 (not c!6904)) b!51459))

(assert (= (and b!51460 res!29438) b!51457))

(assert (= (or b!51457 b!51459) bm!3943))

(declare-fun m!44325 () Bool)

(assert (=> bm!3943 m!44325))

(assert (=> b!51458 m!44297))

(assert (=> b!51458 m!44297))

(assert (=> b!51458 m!44301))

(assert (=> b!51460 m!44297))

(declare-fun m!44327 () Bool)

(assert (=> b!51460 m!44327))

(declare-fun m!44329 () Bool)

(assert (=> b!51460 m!44329))

(assert (=> b!51460 m!44297))

(declare-fun m!44331 () Bool)

(assert (=> b!51460 m!44331))

(assert (=> b!51368 d!10355))

(declare-fun mapIsEmpty!2297 () Bool)

(declare-fun mapRes!2297 () Bool)

(assert (=> mapIsEmpty!2297 mapRes!2297))

(declare-fun b!51462 () Bool)

(declare-fun e!33365 () Bool)

(assert (=> b!51462 (= e!33365 tp_is_empty!2211)))

(declare-fun condMapEmpty!2297 () Bool)

(declare-fun mapDefault!2297 () ValueCell!762)

(assert (=> mapNonEmpty!2295 (= condMapEmpty!2297 (= mapRest!2295 ((as const (Array (_ BitVec 32) ValueCell!762)) mapDefault!2297)))))

(assert (=> mapNonEmpty!2295 (= tp!6867 (and e!33365 mapRes!2297))))

(declare-fun b!51461 () Bool)

(declare-fun e!33364 () Bool)

(assert (=> b!51461 (= e!33364 tp_is_empty!2211)))

(declare-fun mapNonEmpty!2297 () Bool)

(declare-fun tp!6869 () Bool)

(assert (=> mapNonEmpty!2297 (= mapRes!2297 (and tp!6869 e!33364))))

(declare-fun mapKey!2297 () (_ BitVec 32))

(declare-fun mapRest!2297 () (Array (_ BitVec 32) ValueCell!762))

(declare-fun mapValue!2297 () ValueCell!762)

(assert (=> mapNonEmpty!2297 (= mapRest!2295 (store mapRest!2297 mapKey!2297 mapValue!2297))))

(assert (= (and mapNonEmpty!2295 condMapEmpty!2297) mapIsEmpty!2297))

(assert (= (and mapNonEmpty!2295 (not condMapEmpty!2297)) mapNonEmpty!2297))

(assert (= (and mapNonEmpty!2297 ((_ is ValueCellFull!762) mapValue!2297)) b!51461))

(assert (= (and mapNonEmpty!2295 ((_ is ValueCellFull!762) mapDefault!2297)) b!51462))

(declare-fun m!44333 () Bool)

(assert (=> mapNonEmpty!2297 m!44333))

(declare-fun mapIsEmpty!2298 () Bool)

(declare-fun mapRes!2298 () Bool)

(assert (=> mapIsEmpty!2298 mapRes!2298))

(declare-fun b!51464 () Bool)

(declare-fun e!33367 () Bool)

(assert (=> b!51464 (= e!33367 tp_is_empty!2211)))

(declare-fun condMapEmpty!2298 () Bool)

(declare-fun mapDefault!2298 () ValueCell!762)

(assert (=> mapNonEmpty!2296 (= condMapEmpty!2298 (= mapRest!2296 ((as const (Array (_ BitVec 32) ValueCell!762)) mapDefault!2298)))))

(assert (=> mapNonEmpty!2296 (= tp!6868 (and e!33367 mapRes!2298))))

(declare-fun b!51463 () Bool)

(declare-fun e!33366 () Bool)

(assert (=> b!51463 (= e!33366 tp_is_empty!2211)))

(declare-fun mapNonEmpty!2298 () Bool)

(declare-fun tp!6870 () Bool)

(assert (=> mapNonEmpty!2298 (= mapRes!2298 (and tp!6870 e!33366))))

(declare-fun mapRest!2298 () (Array (_ BitVec 32) ValueCell!762))

(declare-fun mapKey!2298 () (_ BitVec 32))

(declare-fun mapValue!2298 () ValueCell!762)

(assert (=> mapNonEmpty!2298 (= mapRest!2296 (store mapRest!2298 mapKey!2298 mapValue!2298))))

(assert (= (and mapNonEmpty!2296 condMapEmpty!2298) mapIsEmpty!2298))

(assert (= (and mapNonEmpty!2296 (not condMapEmpty!2298)) mapNonEmpty!2298))

(assert (= (and mapNonEmpty!2298 ((_ is ValueCellFull!762) mapValue!2298)) b!51463))

(assert (= (and mapNonEmpty!2296 ((_ is ValueCellFull!762) mapDefault!2298)) b!51464))

(declare-fun m!44335 () Bool)

(assert (=> mapNonEmpty!2298 m!44335))

(check-sat (not bm!3939) (not b!51424) (not b!51404) (not b!51427) (not bm!3942) (not b!51423) (not b!51458) (not b!51409) (not b!51413) (not b!51402) (not mapNonEmpty!2298) (not b!51434) (not b!51415) b_and!2801 (not d!10339) (not d!10341) (not bm!3943) (not b!51416) (not bm!3938) (not b!51449) (not d!10347) (not bm!3940) (not bm!3941) (not d!10351) b_and!2799 (not mapNonEmpty!2297) (not b!51428) (not b_next!1591) (not b!51412) (not b!51454) (not b_next!1589) tp_is_empty!2211 (not b!51406) (not b!51460))
(check-sat b_and!2799 b_and!2801 (not b_next!1589) (not b_next!1591))

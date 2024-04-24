; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23256 () Bool)

(assert start!23256)

(declare-fun b!244252 () Bool)

(declare-fun b_free!6535 () Bool)

(declare-fun b_next!6535 () Bool)

(assert (=> b!244252 (= b_free!6535 (not b_next!6535))))

(declare-fun tp!22831 () Bool)

(declare-fun b_and!13533 () Bool)

(assert (=> b!244252 (= tp!22831 b_and!13533)))

(declare-fun b!244251 () Bool)

(declare-fun res!119780 () Bool)

(declare-fun e!158493 () Bool)

(assert (=> b!244251 (=> (not res!119780) (not e!158493))))

(declare-fun e!158497 () Bool)

(assert (=> b!244251 (= res!119780 e!158497)))

(declare-fun res!119768 () Bool)

(assert (=> b!244251 (=> res!119768 e!158497)))

(declare-fun e!158501 () Bool)

(assert (=> b!244251 (= res!119768 e!158501)))

(declare-fun res!119777 () Bool)

(assert (=> b!244251 (=> (not res!119777) (not e!158501))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!244251 (= res!119777 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun mapIsEmpty!10849 () Bool)

(declare-fun mapRes!10849 () Bool)

(assert (=> mapIsEmpty!10849 mapRes!10849))

(declare-fun e!158489 () Bool)

(declare-fun tp_is_empty!6397 () Bool)

(declare-fun e!158495 () Bool)

(declare-datatypes ((V!8177 0))(
  ( (V!8178 (val!3243 Int)) )
))
(declare-datatypes ((ValueCell!2855 0))(
  ( (ValueCellFull!2855 (v!5293 V!8177)) (EmptyCell!2855) )
))
(declare-datatypes ((array!12085 0))(
  ( (array!12086 (arr!5737 (Array (_ BitVec 32) ValueCell!2855)) (size!6079 (_ BitVec 32))) )
))
(declare-datatypes ((array!12087 0))(
  ( (array!12088 (arr!5738 (Array (_ BitVec 32) (_ BitVec 64))) (size!6080 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3610 0))(
  ( (LongMapFixedSize!3611 (defaultEntry!4522 Int) (mask!10621 (_ BitVec 32)) (extraKeys!4259 (_ BitVec 32)) (zeroValue!4363 V!8177) (minValue!4363 V!8177) (_size!1854 (_ BitVec 32)) (_keys!6634 array!12087) (_values!4505 array!12085) (_vacant!1854 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3610)

(declare-fun array_inv!3773 (array!12087) Bool)

(declare-fun array_inv!3774 (array!12085) Bool)

(assert (=> b!244252 (= e!158495 (and tp!22831 tp_is_empty!6397 (array_inv!3773 (_keys!6634 thiss!1504)) (array_inv!3774 (_values!4505 thiss!1504)) e!158489))))

(declare-fun b!244253 () Bool)

(declare-fun e!158505 () Bool)

(declare-fun e!158490 () Bool)

(assert (=> b!244253 (= e!158505 e!158490)))

(declare-fun res!119775 () Bool)

(assert (=> b!244253 (=> (not res!119775) (not e!158490))))

(declare-datatypes ((SeekEntryResult!1046 0))(
  ( (MissingZero!1046 (index!6354 (_ BitVec 32))) (Found!1046 (index!6355 (_ BitVec 32))) (Intermediate!1046 (undefined!1858 Bool) (index!6356 (_ BitVec 32)) (x!24332 (_ BitVec 32))) (Undefined!1046) (MissingVacant!1046 (index!6357 (_ BitVec 32))) )
))
(declare-fun lt!122499 () SeekEntryResult!1046)

(assert (=> b!244253 (= res!119775 (or (= lt!122499 (MissingZero!1046 index!297)) (= lt!122499 (MissingVacant!1046 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12087 (_ BitVec 32)) SeekEntryResult!1046)

(assert (=> b!244253 (= lt!122499 (seekEntryOrOpen!0 key!932 (_keys!6634 thiss!1504) (mask!10621 thiss!1504)))))

(declare-fun b!244254 () Bool)

(declare-fun res!119783 () Bool)

(assert (=> b!244254 (=> (not res!119783) (not e!158493))))

(assert (=> b!244254 (= res!119783 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6080 (_keys!6634 thiss!1504)))))))

(declare-fun b!244255 () Bool)

(declare-fun e!158500 () Bool)

(assert (=> b!244255 (= e!158497 e!158500)))

(declare-fun res!119766 () Bool)

(assert (=> b!244255 (=> (not res!119766) (not e!158500))))

(assert (=> b!244255 (= res!119766 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!244256 () Bool)

(declare-fun res!119782 () Bool)

(assert (=> b!244256 (= res!119782 (= (select (arr!5738 (_keys!6634 thiss!1504)) (index!6357 lt!122499)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!158494 () Bool)

(assert (=> b!244256 (=> (not res!119782) (not e!158494))))

(declare-fun b!244257 () Bool)

(declare-fun res!119772 () Bool)

(declare-fun e!158496 () Bool)

(assert (=> b!244257 (=> (not res!119772) (not e!158496))))

(declare-fun call!22767 () Bool)

(assert (=> b!244257 (= res!119772 call!22767)))

(declare-fun e!158492 () Bool)

(assert (=> b!244257 (= e!158492 e!158496)))

(declare-fun b!244258 () Bool)

(declare-fun res!119767 () Bool)

(assert (=> b!244258 (=> (not res!119767) (not e!158493))))

(declare-datatypes ((List!3580 0))(
  ( (Nil!3577) (Cons!3576 (h!4233 (_ BitVec 64)) (t!8581 List!3580)) )
))
(declare-fun arrayNoDuplicates!0 (array!12087 (_ BitVec 32) List!3580) Bool)

(assert (=> b!244258 (= res!119767 (arrayNoDuplicates!0 (_keys!6634 thiss!1504) #b00000000000000000000000000000000 Nil!3577))))

(declare-fun b!244259 () Bool)

(declare-fun e!158502 () Bool)

(assert (=> b!244259 (= e!158489 (and e!158502 mapRes!10849))))

(declare-fun condMapEmpty!10849 () Bool)

(declare-fun mapDefault!10849 () ValueCell!2855)

(assert (=> b!244259 (= condMapEmpty!10849 (= (arr!5737 (_values!4505 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2855)) mapDefault!10849)))))

(declare-fun bm!22763 () Bool)

(declare-fun call!22766 () Bool)

(declare-fun arrayContainsKey!0 (array!12087 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22763 (= call!22766 (arrayContainsKey!0 (_keys!6634 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!244260 () Bool)

(declare-fun e!158488 () Bool)

(get-info :version)

(assert (=> b!244260 (= e!158488 ((_ is Undefined!1046) lt!122499))))

(declare-fun b!244261 () Bool)

(declare-fun e!158491 () Bool)

(assert (=> b!244261 (= e!158491 tp_is_empty!6397)))

(declare-fun b!244262 () Bool)

(declare-datatypes ((Unit!7518 0))(
  ( (Unit!7519) )
))
(declare-fun e!158504 () Unit!7518)

(declare-fun Unit!7520 () Unit!7518)

(assert (=> b!244262 (= e!158504 Unit!7520)))

(declare-fun lt!122501 () Unit!7518)

(declare-fun lemmaArrayContainsKeyThenInListMap!181 (array!12087 array!12085 (_ BitVec 32) (_ BitVec 32) V!8177 V!8177 (_ BitVec 64) (_ BitVec 32) Int) Unit!7518)

(assert (=> b!244262 (= lt!122501 (lemmaArrayContainsKeyThenInListMap!181 (_keys!6634 thiss!1504) (_values!4505 thiss!1504) (mask!10621 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4522 thiss!1504)))))

(assert (=> b!244262 false))

(declare-fun b!244263 () Bool)

(declare-fun e!158499 () Bool)

(assert (=> b!244263 (= e!158499 e!158493)))

(declare-fun res!119769 () Bool)

(assert (=> b!244263 (=> (not res!119769) (not e!158493))))

(assert (=> b!244263 (= res!119769 (and (bvslt (size!6080 (_keys!6634 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6080 (_keys!6634 thiss!1504)))))))

(declare-fun lt!122497 () Unit!7518)

(assert (=> b!244263 (= lt!122497 e!158504)))

(declare-fun c!40774 () Bool)

(assert (=> b!244263 (= c!40774 (arrayContainsKey!0 (_keys!6634 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!244264 () Bool)

(declare-fun Unit!7521 () Unit!7518)

(assert (=> b!244264 (= e!158504 Unit!7521)))

(declare-fun b!244265 () Bool)

(declare-fun e!158498 () Unit!7518)

(declare-fun lt!122498 () Unit!7518)

(assert (=> b!244265 (= e!158498 lt!122498)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!357 (array!12087 array!12085 (_ BitVec 32) (_ BitVec 32) V!8177 V!8177 (_ BitVec 64) Int) Unit!7518)

(assert (=> b!244265 (= lt!122498 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!357 (_keys!6634 thiss!1504) (_values!4505 thiss!1504) (mask!10621 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) key!932 (defaultEntry!4522 thiss!1504)))))

(declare-fun c!40775 () Bool)

(assert (=> b!244265 (= c!40775 ((_ is MissingZero!1046) lt!122499))))

(assert (=> b!244265 e!158492))

(declare-fun b!244266 () Bool)

(assert (=> b!244266 (= e!158494 (not call!22766))))

(declare-fun b!244267 () Bool)

(declare-fun res!119778 () Bool)

(assert (=> b!244267 (=> (not res!119778) (not e!158493))))

(declare-fun noDuplicate!102 (List!3580) Bool)

(assert (=> b!244267 (= res!119778 (noDuplicate!102 Nil!3577))))

(declare-fun b!244268 () Bool)

(declare-fun res!119773 () Bool)

(assert (=> b!244268 (=> (not res!119773) (not e!158493))))

(declare-fun contains!1744 (List!3580 (_ BitVec 64)) Bool)

(assert (=> b!244268 (= res!119773 (not (contains!1744 Nil!3577 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!22764 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22764 (= call!22767 (inRange!0 (ite c!40775 (index!6354 lt!122499) (index!6357 lt!122499)) (mask!10621 thiss!1504)))))

(declare-fun b!244270 () Bool)

(assert (=> b!244270 (= e!158490 e!158499)))

(declare-fun res!119779 () Bool)

(assert (=> b!244270 (=> (not res!119779) (not e!158499))))

(assert (=> b!244270 (= res!119779 (inRange!0 index!297 (mask!10621 thiss!1504)))))

(declare-fun lt!122500 () Unit!7518)

(assert (=> b!244270 (= lt!122500 e!158498)))

(declare-fun c!40776 () Bool)

(declare-datatypes ((tuple2!4708 0))(
  ( (tuple2!4709 (_1!2365 (_ BitVec 64)) (_2!2365 V!8177)) )
))
(declare-datatypes ((List!3581 0))(
  ( (Nil!3578) (Cons!3577 (h!4234 tuple2!4708) (t!8582 List!3581)) )
))
(declare-datatypes ((ListLongMap!3623 0))(
  ( (ListLongMap!3624 (toList!1827 List!3581)) )
))
(declare-fun contains!1745 (ListLongMap!3623 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1359 (array!12087 array!12085 (_ BitVec 32) (_ BitVec 32) V!8177 V!8177 (_ BitVec 32) Int) ListLongMap!3623)

(assert (=> b!244270 (= c!40776 (contains!1745 (getCurrentListMap!1359 (_keys!6634 thiss!1504) (_values!4505 thiss!1504) (mask!10621 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4522 thiss!1504)) key!932))))

(declare-fun b!244271 () Bool)

(declare-fun res!119771 () Bool)

(assert (=> b!244271 (=> (not res!119771) (not e!158496))))

(assert (=> b!244271 (= res!119771 (= (select (arr!5738 (_keys!6634 thiss!1504)) (index!6354 lt!122499)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!119774 () Bool)

(assert (=> start!23256 (=> (not res!119774) (not e!158505))))

(declare-fun valid!1428 (LongMapFixedSize!3610) Bool)

(assert (=> start!23256 (= res!119774 (valid!1428 thiss!1504))))

(assert (=> start!23256 e!158505))

(assert (=> start!23256 e!158495))

(assert (=> start!23256 true))

(declare-fun b!244269 () Bool)

(declare-fun Unit!7522 () Unit!7518)

(assert (=> b!244269 (= e!158498 Unit!7522)))

(declare-fun lt!122496 () Unit!7518)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!365 (array!12087 array!12085 (_ BitVec 32) (_ BitVec 32) V!8177 V!8177 (_ BitVec 64) Int) Unit!7518)

(assert (=> b!244269 (= lt!122496 (lemmaInListMapThenSeekEntryOrOpenFindsIt!365 (_keys!6634 thiss!1504) (_values!4505 thiss!1504) (mask!10621 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) key!932 (defaultEntry!4522 thiss!1504)))))

(assert (=> b!244269 false))

(declare-fun b!244272 () Bool)

(declare-fun c!40777 () Bool)

(assert (=> b!244272 (= c!40777 ((_ is MissingVacant!1046) lt!122499))))

(assert (=> b!244272 (= e!158492 e!158488)))

(declare-fun b!244273 () Bool)

(assert (=> b!244273 (= e!158501 (contains!1744 Nil!3577 key!932))))

(declare-fun b!244274 () Bool)

(declare-fun res!119781 () Bool)

(assert (=> b!244274 (=> (not res!119781) (not e!158493))))

(assert (=> b!244274 (= res!119781 (not (contains!1744 Nil!3577 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!244275 () Bool)

(assert (=> b!244275 (= e!158502 tp_is_empty!6397)))

(declare-fun b!244276 () Bool)

(declare-fun res!119770 () Bool)

(assert (=> b!244276 (=> (not res!119770) (not e!158505))))

(assert (=> b!244276 (= res!119770 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!244277 () Bool)

(assert (=> b!244277 (= e!158496 (not call!22766))))

(declare-fun b!244278 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!244278 (= e!158493 (not (validKeyInArray!0 key!932)))))

(declare-fun mapNonEmpty!10849 () Bool)

(declare-fun tp!22830 () Bool)

(assert (=> mapNonEmpty!10849 (= mapRes!10849 (and tp!22830 e!158491))))

(declare-fun mapRest!10849 () (Array (_ BitVec 32) ValueCell!2855))

(declare-fun mapValue!10849 () ValueCell!2855)

(declare-fun mapKey!10849 () (_ BitVec 32))

(assert (=> mapNonEmpty!10849 (= (arr!5737 (_values!4505 thiss!1504)) (store mapRest!10849 mapKey!10849 mapValue!10849))))

(declare-fun b!244279 () Bool)

(assert (=> b!244279 (= e!158500 (not (contains!1744 Nil!3577 key!932)))))

(declare-fun b!244280 () Bool)

(assert (=> b!244280 (= e!158488 e!158494)))

(declare-fun res!119776 () Bool)

(assert (=> b!244280 (= res!119776 call!22767)))

(assert (=> b!244280 (=> (not res!119776) (not e!158494))))

(assert (= (and start!23256 res!119774) b!244276))

(assert (= (and b!244276 res!119770) b!244253))

(assert (= (and b!244253 res!119775) b!244270))

(assert (= (and b!244270 c!40776) b!244269))

(assert (= (and b!244270 (not c!40776)) b!244265))

(assert (= (and b!244265 c!40775) b!244257))

(assert (= (and b!244265 (not c!40775)) b!244272))

(assert (= (and b!244257 res!119772) b!244271))

(assert (= (and b!244271 res!119771) b!244277))

(assert (= (and b!244272 c!40777) b!244280))

(assert (= (and b!244272 (not c!40777)) b!244260))

(assert (= (and b!244280 res!119776) b!244256))

(assert (= (and b!244256 res!119782) b!244266))

(assert (= (or b!244257 b!244280) bm!22764))

(assert (= (or b!244277 b!244266) bm!22763))

(assert (= (and b!244270 res!119779) b!244263))

(assert (= (and b!244263 c!40774) b!244262))

(assert (= (and b!244263 (not c!40774)) b!244264))

(assert (= (and b!244263 res!119769) b!244267))

(assert (= (and b!244267 res!119778) b!244268))

(assert (= (and b!244268 res!119773) b!244274))

(assert (= (and b!244274 res!119781) b!244251))

(assert (= (and b!244251 res!119777) b!244273))

(assert (= (and b!244251 (not res!119768)) b!244255))

(assert (= (and b!244255 res!119766) b!244279))

(assert (= (and b!244251 res!119780) b!244258))

(assert (= (and b!244258 res!119767) b!244254))

(assert (= (and b!244254 res!119783) b!244278))

(assert (= (and b!244259 condMapEmpty!10849) mapIsEmpty!10849))

(assert (= (and b!244259 (not condMapEmpty!10849)) mapNonEmpty!10849))

(assert (= (and mapNonEmpty!10849 ((_ is ValueCellFull!2855) mapValue!10849)) b!244261))

(assert (= (and b!244259 ((_ is ValueCellFull!2855) mapDefault!10849)) b!244275))

(assert (= b!244252 b!244259))

(assert (= start!23256 b!244252))

(declare-fun m!262463 () Bool)

(assert (=> b!244270 m!262463))

(declare-fun m!262465 () Bool)

(assert (=> b!244270 m!262465))

(assert (=> b!244270 m!262465))

(declare-fun m!262467 () Bool)

(assert (=> b!244270 m!262467))

(declare-fun m!262469 () Bool)

(assert (=> b!244269 m!262469))

(declare-fun m!262471 () Bool)

(assert (=> b!244262 m!262471))

(declare-fun m!262473 () Bool)

(assert (=> bm!22763 m!262473))

(declare-fun m!262475 () Bool)

(assert (=> mapNonEmpty!10849 m!262475))

(declare-fun m!262477 () Bool)

(assert (=> b!244252 m!262477))

(declare-fun m!262479 () Bool)

(assert (=> b!244252 m!262479))

(declare-fun m!262481 () Bool)

(assert (=> b!244256 m!262481))

(declare-fun m!262483 () Bool)

(assert (=> b!244274 m!262483))

(declare-fun m!262485 () Bool)

(assert (=> b!244253 m!262485))

(assert (=> b!244263 m!262473))

(declare-fun m!262487 () Bool)

(assert (=> b!244279 m!262487))

(declare-fun m!262489 () Bool)

(assert (=> b!244271 m!262489))

(declare-fun m!262491 () Bool)

(assert (=> bm!22764 m!262491))

(declare-fun m!262493 () Bool)

(assert (=> start!23256 m!262493))

(declare-fun m!262495 () Bool)

(assert (=> b!244258 m!262495))

(declare-fun m!262497 () Bool)

(assert (=> b!244278 m!262497))

(declare-fun m!262499 () Bool)

(assert (=> b!244265 m!262499))

(declare-fun m!262501 () Bool)

(assert (=> b!244267 m!262501))

(declare-fun m!262503 () Bool)

(assert (=> b!244268 m!262503))

(assert (=> b!244273 m!262487))

(check-sat (not b!244258) (not start!23256) (not bm!22764) (not mapNonEmpty!10849) (not b!244270) (not b!244279) (not b!244273) tp_is_empty!6397 (not b!244253) (not b_next!6535) (not b!244278) (not b!244263) (not b!244268) (not bm!22763) (not b!244265) (not b!244269) (not b!244274) (not b!244267) (not b!244262) b_and!13533 (not b!244252))
(check-sat b_and!13533 (not b_next!6535))
(get-model)

(declare-fun b!244473 () Bool)

(declare-fun e!158621 () SeekEntryResult!1046)

(declare-fun lt!122545 () SeekEntryResult!1046)

(assert (=> b!244473 (= e!158621 (Found!1046 (index!6356 lt!122545)))))

(declare-fun b!244474 () Bool)

(declare-fun e!158622 () SeekEntryResult!1046)

(assert (=> b!244474 (= e!158622 e!158621)))

(declare-fun lt!122544 () (_ BitVec 64))

(assert (=> b!244474 (= lt!122544 (select (arr!5738 (_keys!6634 thiss!1504)) (index!6356 lt!122545)))))

(declare-fun c!40809 () Bool)

(assert (=> b!244474 (= c!40809 (= lt!122544 key!932))))

(declare-fun d!60181 () Bool)

(declare-fun lt!122546 () SeekEntryResult!1046)

(assert (=> d!60181 (and (or ((_ is Undefined!1046) lt!122546) (not ((_ is Found!1046) lt!122546)) (and (bvsge (index!6355 lt!122546) #b00000000000000000000000000000000) (bvslt (index!6355 lt!122546) (size!6080 (_keys!6634 thiss!1504))))) (or ((_ is Undefined!1046) lt!122546) ((_ is Found!1046) lt!122546) (not ((_ is MissingZero!1046) lt!122546)) (and (bvsge (index!6354 lt!122546) #b00000000000000000000000000000000) (bvslt (index!6354 lt!122546) (size!6080 (_keys!6634 thiss!1504))))) (or ((_ is Undefined!1046) lt!122546) ((_ is Found!1046) lt!122546) ((_ is MissingZero!1046) lt!122546) (not ((_ is MissingVacant!1046) lt!122546)) (and (bvsge (index!6357 lt!122546) #b00000000000000000000000000000000) (bvslt (index!6357 lt!122546) (size!6080 (_keys!6634 thiss!1504))))) (or ((_ is Undefined!1046) lt!122546) (ite ((_ is Found!1046) lt!122546) (= (select (arr!5738 (_keys!6634 thiss!1504)) (index!6355 lt!122546)) key!932) (ite ((_ is MissingZero!1046) lt!122546) (= (select (arr!5738 (_keys!6634 thiss!1504)) (index!6354 lt!122546)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1046) lt!122546) (= (select (arr!5738 (_keys!6634 thiss!1504)) (index!6357 lt!122546)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!60181 (= lt!122546 e!158622)))

(declare-fun c!40810 () Bool)

(assert (=> d!60181 (= c!40810 (and ((_ is Intermediate!1046) lt!122545) (undefined!1858 lt!122545)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12087 (_ BitVec 32)) SeekEntryResult!1046)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60181 (= lt!122545 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10621 thiss!1504)) key!932 (_keys!6634 thiss!1504) (mask!10621 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!60181 (validMask!0 (mask!10621 thiss!1504))))

(assert (=> d!60181 (= (seekEntryOrOpen!0 key!932 (_keys!6634 thiss!1504) (mask!10621 thiss!1504)) lt!122546)))

(declare-fun b!244475 () Bool)

(declare-fun e!158620 () SeekEntryResult!1046)

(assert (=> b!244475 (= e!158620 (MissingZero!1046 (index!6356 lt!122545)))))

(declare-fun b!244476 () Bool)

(assert (=> b!244476 (= e!158622 Undefined!1046)))

(declare-fun b!244477 () Bool)

(declare-fun c!40808 () Bool)

(assert (=> b!244477 (= c!40808 (= lt!122544 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!244477 (= e!158621 e!158620)))

(declare-fun b!244478 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12087 (_ BitVec 32)) SeekEntryResult!1046)

(assert (=> b!244478 (= e!158620 (seekKeyOrZeroReturnVacant!0 (x!24332 lt!122545) (index!6356 lt!122545) (index!6356 lt!122545) key!932 (_keys!6634 thiss!1504) (mask!10621 thiss!1504)))))

(assert (= (and d!60181 c!40810) b!244476))

(assert (= (and d!60181 (not c!40810)) b!244474))

(assert (= (and b!244474 c!40809) b!244473))

(assert (= (and b!244474 (not c!40809)) b!244477))

(assert (= (and b!244477 c!40808) b!244475))

(assert (= (and b!244477 (not c!40808)) b!244478))

(declare-fun m!262589 () Bool)

(assert (=> b!244474 m!262589))

(declare-fun m!262591 () Bool)

(assert (=> d!60181 m!262591))

(declare-fun m!262593 () Bool)

(assert (=> d!60181 m!262593))

(declare-fun m!262595 () Bool)

(assert (=> d!60181 m!262595))

(declare-fun m!262597 () Bool)

(assert (=> d!60181 m!262597))

(declare-fun m!262599 () Bool)

(assert (=> d!60181 m!262599))

(assert (=> d!60181 m!262597))

(declare-fun m!262601 () Bool)

(assert (=> d!60181 m!262601))

(declare-fun m!262603 () Bool)

(assert (=> b!244478 m!262603))

(assert (=> b!244253 d!60181))

(declare-fun d!60183 () Bool)

(declare-fun res!119896 () Bool)

(declare-fun e!158627 () Bool)

(assert (=> d!60183 (=> res!119896 e!158627)))

(assert (=> d!60183 (= res!119896 (= (select (arr!5738 (_keys!6634 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60183 (= (arrayContainsKey!0 (_keys!6634 thiss!1504) key!932 #b00000000000000000000000000000000) e!158627)))

(declare-fun b!244483 () Bool)

(declare-fun e!158628 () Bool)

(assert (=> b!244483 (= e!158627 e!158628)))

(declare-fun res!119897 () Bool)

(assert (=> b!244483 (=> (not res!119897) (not e!158628))))

(assert (=> b!244483 (= res!119897 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6080 (_keys!6634 thiss!1504))))))

(declare-fun b!244484 () Bool)

(assert (=> b!244484 (= e!158628 (arrayContainsKey!0 (_keys!6634 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60183 (not res!119896)) b!244483))

(assert (= (and b!244483 res!119897) b!244484))

(declare-fun m!262605 () Bool)

(assert (=> d!60183 m!262605))

(declare-fun m!262607 () Bool)

(assert (=> b!244484 m!262607))

(assert (=> b!244263 d!60183))

(declare-fun d!60185 () Bool)

(assert (=> d!60185 (contains!1745 (getCurrentListMap!1359 (_keys!6634 thiss!1504) (_values!4505 thiss!1504) (mask!10621 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4522 thiss!1504)) key!932)))

(declare-fun lt!122549 () Unit!7518)

(declare-fun choose!1147 (array!12087 array!12085 (_ BitVec 32) (_ BitVec 32) V!8177 V!8177 (_ BitVec 64) (_ BitVec 32) Int) Unit!7518)

(assert (=> d!60185 (= lt!122549 (choose!1147 (_keys!6634 thiss!1504) (_values!4505 thiss!1504) (mask!10621 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4522 thiss!1504)))))

(assert (=> d!60185 (validMask!0 (mask!10621 thiss!1504))))

(assert (=> d!60185 (= (lemmaArrayContainsKeyThenInListMap!181 (_keys!6634 thiss!1504) (_values!4505 thiss!1504) (mask!10621 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4522 thiss!1504)) lt!122549)))

(declare-fun bs!8899 () Bool)

(assert (= bs!8899 d!60185))

(assert (=> bs!8899 m!262465))

(assert (=> bs!8899 m!262465))

(assert (=> bs!8899 m!262467))

(declare-fun m!262609 () Bool)

(assert (=> bs!8899 m!262609))

(assert (=> bs!8899 m!262593))

(assert (=> b!244262 d!60185))

(declare-fun d!60187 () Bool)

(assert (=> d!60187 (= (array_inv!3773 (_keys!6634 thiss!1504)) (bvsge (size!6080 (_keys!6634 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!244252 d!60187))

(declare-fun d!60189 () Bool)

(assert (=> d!60189 (= (array_inv!3774 (_values!4505 thiss!1504)) (bvsge (size!6079 (_values!4505 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!244252 d!60189))

(declare-fun b!244501 () Bool)

(declare-fun lt!122554 () SeekEntryResult!1046)

(assert (=> b!244501 (and (bvsge (index!6354 lt!122554) #b00000000000000000000000000000000) (bvslt (index!6354 lt!122554) (size!6080 (_keys!6634 thiss!1504))))))

(declare-fun res!119908 () Bool)

(assert (=> b!244501 (= res!119908 (= (select (arr!5738 (_keys!6634 thiss!1504)) (index!6354 lt!122554)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!158638 () Bool)

(assert (=> b!244501 (=> (not res!119908) (not e!158638))))

(declare-fun bm!22781 () Bool)

(declare-fun call!22784 () Bool)

(declare-fun c!40815 () Bool)

(assert (=> bm!22781 (= call!22784 (inRange!0 (ite c!40815 (index!6354 lt!122554) (index!6357 lt!122554)) (mask!10621 thiss!1504)))))

(declare-fun b!244502 () Bool)

(declare-fun e!158639 () Bool)

(assert (=> b!244502 (= e!158639 ((_ is Undefined!1046) lt!122554))))

(declare-fun b!244504 () Bool)

(declare-fun call!22785 () Bool)

(assert (=> b!244504 (= e!158638 (not call!22785))))

(declare-fun bm!22782 () Bool)

(assert (=> bm!22782 (= call!22785 (arrayContainsKey!0 (_keys!6634 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!244505 () Bool)

(declare-fun e!158640 () Bool)

(assert (=> b!244505 (= e!158640 e!158639)))

(declare-fun c!40816 () Bool)

(assert (=> b!244505 (= c!40816 ((_ is MissingVacant!1046) lt!122554))))

(declare-fun b!244506 () Bool)

(declare-fun e!158637 () Bool)

(assert (=> b!244506 (= e!158637 (not call!22785))))

(declare-fun b!244507 () Bool)

(assert (=> b!244507 (= e!158640 e!158638)))

(declare-fun res!119909 () Bool)

(assert (=> b!244507 (= res!119909 call!22784)))

(assert (=> b!244507 (=> (not res!119909) (not e!158638))))

(declare-fun b!244508 () Bool)

(declare-fun res!119907 () Bool)

(assert (=> b!244508 (=> (not res!119907) (not e!158637))))

(assert (=> b!244508 (= res!119907 call!22784)))

(assert (=> b!244508 (= e!158639 e!158637)))

(declare-fun d!60191 () Bool)

(assert (=> d!60191 e!158640))

(assert (=> d!60191 (= c!40815 ((_ is MissingZero!1046) lt!122554))))

(assert (=> d!60191 (= lt!122554 (seekEntryOrOpen!0 key!932 (_keys!6634 thiss!1504) (mask!10621 thiss!1504)))))

(declare-fun lt!122555 () Unit!7518)

(declare-fun choose!1148 (array!12087 array!12085 (_ BitVec 32) (_ BitVec 32) V!8177 V!8177 (_ BitVec 64) Int) Unit!7518)

(assert (=> d!60191 (= lt!122555 (choose!1148 (_keys!6634 thiss!1504) (_values!4505 thiss!1504) (mask!10621 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) key!932 (defaultEntry!4522 thiss!1504)))))

(assert (=> d!60191 (validMask!0 (mask!10621 thiss!1504))))

(assert (=> d!60191 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!357 (_keys!6634 thiss!1504) (_values!4505 thiss!1504) (mask!10621 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) key!932 (defaultEntry!4522 thiss!1504)) lt!122555)))

(declare-fun b!244503 () Bool)

(declare-fun res!119906 () Bool)

(assert (=> b!244503 (=> (not res!119906) (not e!158637))))

(assert (=> b!244503 (= res!119906 (= (select (arr!5738 (_keys!6634 thiss!1504)) (index!6357 lt!122554)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!244503 (and (bvsge (index!6357 lt!122554) #b00000000000000000000000000000000) (bvslt (index!6357 lt!122554) (size!6080 (_keys!6634 thiss!1504))))))

(assert (= (and d!60191 c!40815) b!244507))

(assert (= (and d!60191 (not c!40815)) b!244505))

(assert (= (and b!244507 res!119909) b!244501))

(assert (= (and b!244501 res!119908) b!244504))

(assert (= (and b!244505 c!40816) b!244508))

(assert (= (and b!244505 (not c!40816)) b!244502))

(assert (= (and b!244508 res!119907) b!244503))

(assert (= (and b!244503 res!119906) b!244506))

(assert (= (or b!244507 b!244508) bm!22781))

(assert (= (or b!244504 b!244506) bm!22782))

(declare-fun m!262611 () Bool)

(assert (=> b!244503 m!262611))

(declare-fun m!262613 () Bool)

(assert (=> bm!22781 m!262613))

(declare-fun m!262615 () Bool)

(assert (=> b!244501 m!262615))

(assert (=> bm!22782 m!262473))

(assert (=> d!60191 m!262485))

(declare-fun m!262617 () Bool)

(assert (=> d!60191 m!262617))

(assert (=> d!60191 m!262593))

(assert (=> b!244265 d!60191))

(declare-fun d!60193 () Bool)

(declare-fun lt!122558 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!163 (List!3580) (InoxSet (_ BitVec 64)))

(assert (=> d!60193 (= lt!122558 (select (content!163 Nil!3577) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!158646 () Bool)

(assert (=> d!60193 (= lt!122558 e!158646)))

(declare-fun res!119915 () Bool)

(assert (=> d!60193 (=> (not res!119915) (not e!158646))))

(assert (=> d!60193 (= res!119915 ((_ is Cons!3576) Nil!3577))))

(assert (=> d!60193 (= (contains!1744 Nil!3577 #b1000000000000000000000000000000000000000000000000000000000000000) lt!122558)))

(declare-fun b!244513 () Bool)

(declare-fun e!158645 () Bool)

(assert (=> b!244513 (= e!158646 e!158645)))

(declare-fun res!119914 () Bool)

(assert (=> b!244513 (=> res!119914 e!158645)))

(assert (=> b!244513 (= res!119914 (= (h!4233 Nil!3577) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!244514 () Bool)

(assert (=> b!244514 (= e!158645 (contains!1744 (t!8581 Nil!3577) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!60193 res!119915) b!244513))

(assert (= (and b!244513 (not res!119914)) b!244514))

(declare-fun m!262619 () Bool)

(assert (=> d!60193 m!262619))

(declare-fun m!262621 () Bool)

(assert (=> d!60193 m!262621))

(declare-fun m!262623 () Bool)

(assert (=> b!244514 m!262623))

(assert (=> b!244274 d!60193))

(declare-fun d!60195 () Bool)

(declare-fun lt!122559 () Bool)

(assert (=> d!60195 (= lt!122559 (select (content!163 Nil!3577) key!932))))

(declare-fun e!158648 () Bool)

(assert (=> d!60195 (= lt!122559 e!158648)))

(declare-fun res!119917 () Bool)

(assert (=> d!60195 (=> (not res!119917) (not e!158648))))

(assert (=> d!60195 (= res!119917 ((_ is Cons!3576) Nil!3577))))

(assert (=> d!60195 (= (contains!1744 Nil!3577 key!932) lt!122559)))

(declare-fun b!244515 () Bool)

(declare-fun e!158647 () Bool)

(assert (=> b!244515 (= e!158648 e!158647)))

(declare-fun res!119916 () Bool)

(assert (=> b!244515 (=> res!119916 e!158647)))

(assert (=> b!244515 (= res!119916 (= (h!4233 Nil!3577) key!932))))

(declare-fun b!244516 () Bool)

(assert (=> b!244516 (= e!158647 (contains!1744 (t!8581 Nil!3577) key!932))))

(assert (= (and d!60195 res!119917) b!244515))

(assert (= (and b!244515 (not res!119916)) b!244516))

(assert (=> d!60195 m!262619))

(declare-fun m!262625 () Bool)

(assert (=> d!60195 m!262625))

(declare-fun m!262627 () Bool)

(assert (=> b!244516 m!262627))

(assert (=> b!244273 d!60195))

(declare-fun d!60197 () Bool)

(declare-fun lt!122560 () Bool)

(assert (=> d!60197 (= lt!122560 (select (content!163 Nil!3577) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!158650 () Bool)

(assert (=> d!60197 (= lt!122560 e!158650)))

(declare-fun res!119919 () Bool)

(assert (=> d!60197 (=> (not res!119919) (not e!158650))))

(assert (=> d!60197 (= res!119919 ((_ is Cons!3576) Nil!3577))))

(assert (=> d!60197 (= (contains!1744 Nil!3577 #b0000000000000000000000000000000000000000000000000000000000000000) lt!122560)))

(declare-fun b!244517 () Bool)

(declare-fun e!158649 () Bool)

(assert (=> b!244517 (= e!158650 e!158649)))

(declare-fun res!119918 () Bool)

(assert (=> b!244517 (=> res!119918 e!158649)))

(assert (=> b!244517 (= res!119918 (= (h!4233 Nil!3577) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!244518 () Bool)

(assert (=> b!244518 (= e!158649 (contains!1744 (t!8581 Nil!3577) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!60197 res!119919) b!244517))

(assert (= (and b!244517 (not res!119918)) b!244518))

(assert (=> d!60197 m!262619))

(declare-fun m!262629 () Bool)

(assert (=> d!60197 m!262629))

(declare-fun m!262631 () Bool)

(assert (=> b!244518 m!262631))

(assert (=> b!244268 d!60197))

(declare-fun d!60199 () Bool)

(assert (=> d!60199 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!244278 d!60199))

(declare-fun d!60201 () Bool)

(declare-fun res!119927 () Bool)

(declare-fun e!158659 () Bool)

(assert (=> d!60201 (=> res!119927 e!158659)))

(assert (=> d!60201 (= res!119927 (bvsge #b00000000000000000000000000000000 (size!6080 (_keys!6634 thiss!1504))))))

(assert (=> d!60201 (= (arrayNoDuplicates!0 (_keys!6634 thiss!1504) #b00000000000000000000000000000000 Nil!3577) e!158659)))

(declare-fun b!244529 () Bool)

(declare-fun e!158660 () Bool)

(assert (=> b!244529 (= e!158659 e!158660)))

(declare-fun res!119928 () Bool)

(assert (=> b!244529 (=> (not res!119928) (not e!158660))))

(declare-fun e!158661 () Bool)

(assert (=> b!244529 (= res!119928 (not e!158661))))

(declare-fun res!119926 () Bool)

(assert (=> b!244529 (=> (not res!119926) (not e!158661))))

(assert (=> b!244529 (= res!119926 (validKeyInArray!0 (select (arr!5738 (_keys!6634 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!22785 () Bool)

(declare-fun call!22788 () Bool)

(declare-fun c!40819 () Bool)

(assert (=> bm!22785 (= call!22788 (arrayNoDuplicates!0 (_keys!6634 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!40819 (Cons!3576 (select (arr!5738 (_keys!6634 thiss!1504)) #b00000000000000000000000000000000) Nil!3577) Nil!3577)))))

(declare-fun b!244530 () Bool)

(assert (=> b!244530 (= e!158661 (contains!1744 Nil!3577 (select (arr!5738 (_keys!6634 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!244531 () Bool)

(declare-fun e!158662 () Bool)

(assert (=> b!244531 (= e!158660 e!158662)))

(assert (=> b!244531 (= c!40819 (validKeyInArray!0 (select (arr!5738 (_keys!6634 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!244532 () Bool)

(assert (=> b!244532 (= e!158662 call!22788)))

(declare-fun b!244533 () Bool)

(assert (=> b!244533 (= e!158662 call!22788)))

(assert (= (and d!60201 (not res!119927)) b!244529))

(assert (= (and b!244529 res!119926) b!244530))

(assert (= (and b!244529 res!119928) b!244531))

(assert (= (and b!244531 c!40819) b!244533))

(assert (= (and b!244531 (not c!40819)) b!244532))

(assert (= (or b!244533 b!244532) bm!22785))

(assert (=> b!244529 m!262605))

(assert (=> b!244529 m!262605))

(declare-fun m!262633 () Bool)

(assert (=> b!244529 m!262633))

(assert (=> bm!22785 m!262605))

(declare-fun m!262635 () Bool)

(assert (=> bm!22785 m!262635))

(assert (=> b!244530 m!262605))

(assert (=> b!244530 m!262605))

(declare-fun m!262637 () Bool)

(assert (=> b!244530 m!262637))

(assert (=> b!244531 m!262605))

(assert (=> b!244531 m!262605))

(assert (=> b!244531 m!262633))

(assert (=> b!244258 d!60201))

(declare-fun d!60203 () Bool)

(declare-fun res!119933 () Bool)

(declare-fun e!158667 () Bool)

(assert (=> d!60203 (=> res!119933 e!158667)))

(assert (=> d!60203 (= res!119933 ((_ is Nil!3577) Nil!3577))))

(assert (=> d!60203 (= (noDuplicate!102 Nil!3577) e!158667)))

(declare-fun b!244538 () Bool)

(declare-fun e!158668 () Bool)

(assert (=> b!244538 (= e!158667 e!158668)))

(declare-fun res!119934 () Bool)

(assert (=> b!244538 (=> (not res!119934) (not e!158668))))

(assert (=> b!244538 (= res!119934 (not (contains!1744 (t!8581 Nil!3577) (h!4233 Nil!3577))))))

(declare-fun b!244539 () Bool)

(assert (=> b!244539 (= e!158668 (noDuplicate!102 (t!8581 Nil!3577)))))

(assert (= (and d!60203 (not res!119933)) b!244538))

(assert (= (and b!244538 res!119934) b!244539))

(declare-fun m!262639 () Bool)

(assert (=> b!244538 m!262639))

(declare-fun m!262641 () Bool)

(assert (=> b!244539 m!262641))

(assert (=> b!244267 d!60203))

(declare-fun d!60205 () Bool)

(declare-fun res!119941 () Bool)

(declare-fun e!158671 () Bool)

(assert (=> d!60205 (=> (not res!119941) (not e!158671))))

(declare-fun simpleValid!251 (LongMapFixedSize!3610) Bool)

(assert (=> d!60205 (= res!119941 (simpleValid!251 thiss!1504))))

(assert (=> d!60205 (= (valid!1428 thiss!1504) e!158671)))

(declare-fun b!244546 () Bool)

(declare-fun res!119942 () Bool)

(assert (=> b!244546 (=> (not res!119942) (not e!158671))))

(declare-fun arrayCountValidKeys!0 (array!12087 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!244546 (= res!119942 (= (arrayCountValidKeys!0 (_keys!6634 thiss!1504) #b00000000000000000000000000000000 (size!6080 (_keys!6634 thiss!1504))) (_size!1854 thiss!1504)))))

(declare-fun b!244547 () Bool)

(declare-fun res!119943 () Bool)

(assert (=> b!244547 (=> (not res!119943) (not e!158671))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12087 (_ BitVec 32)) Bool)

(assert (=> b!244547 (= res!119943 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6634 thiss!1504) (mask!10621 thiss!1504)))))

(declare-fun b!244548 () Bool)

(assert (=> b!244548 (= e!158671 (arrayNoDuplicates!0 (_keys!6634 thiss!1504) #b00000000000000000000000000000000 Nil!3577))))

(assert (= (and d!60205 res!119941) b!244546))

(assert (= (and b!244546 res!119942) b!244547))

(assert (= (and b!244547 res!119943) b!244548))

(declare-fun m!262643 () Bool)

(assert (=> d!60205 m!262643))

(declare-fun m!262645 () Bool)

(assert (=> b!244546 m!262645))

(declare-fun m!262647 () Bool)

(assert (=> b!244547 m!262647))

(assert (=> b!244548 m!262495))

(assert (=> start!23256 d!60205))

(declare-fun d!60207 () Bool)

(assert (=> d!60207 (= (inRange!0 index!297 (mask!10621 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10621 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!244270 d!60207))

(declare-fun d!60209 () Bool)

(declare-fun e!158677 () Bool)

(assert (=> d!60209 e!158677))

(declare-fun res!119946 () Bool)

(assert (=> d!60209 (=> res!119946 e!158677)))

(declare-fun lt!122571 () Bool)

(assert (=> d!60209 (= res!119946 (not lt!122571))))

(declare-fun lt!122570 () Bool)

(assert (=> d!60209 (= lt!122571 lt!122570)))

(declare-fun lt!122572 () Unit!7518)

(declare-fun e!158676 () Unit!7518)

(assert (=> d!60209 (= lt!122572 e!158676)))

(declare-fun c!40822 () Bool)

(assert (=> d!60209 (= c!40822 lt!122570)))

(declare-fun containsKey!278 (List!3581 (_ BitVec 64)) Bool)

(assert (=> d!60209 (= lt!122570 (containsKey!278 (toList!1827 (getCurrentListMap!1359 (_keys!6634 thiss!1504) (_values!4505 thiss!1504) (mask!10621 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4522 thiss!1504))) key!932))))

(assert (=> d!60209 (= (contains!1745 (getCurrentListMap!1359 (_keys!6634 thiss!1504) (_values!4505 thiss!1504) (mask!10621 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4522 thiss!1504)) key!932) lt!122571)))

(declare-fun b!244555 () Bool)

(declare-fun lt!122569 () Unit!7518)

(assert (=> b!244555 (= e!158676 lt!122569)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!226 (List!3581 (_ BitVec 64)) Unit!7518)

(assert (=> b!244555 (= lt!122569 (lemmaContainsKeyImpliesGetValueByKeyDefined!226 (toList!1827 (getCurrentListMap!1359 (_keys!6634 thiss!1504) (_values!4505 thiss!1504) (mask!10621 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4522 thiss!1504))) key!932))))

(declare-datatypes ((Option!293 0))(
  ( (Some!292 (v!5297 V!8177)) (None!291) )
))
(declare-fun isDefined!227 (Option!293) Bool)

(declare-fun getValueByKey!287 (List!3581 (_ BitVec 64)) Option!293)

(assert (=> b!244555 (isDefined!227 (getValueByKey!287 (toList!1827 (getCurrentListMap!1359 (_keys!6634 thiss!1504) (_values!4505 thiss!1504) (mask!10621 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4522 thiss!1504))) key!932))))

(declare-fun b!244556 () Bool)

(declare-fun Unit!7530 () Unit!7518)

(assert (=> b!244556 (= e!158676 Unit!7530)))

(declare-fun b!244557 () Bool)

(assert (=> b!244557 (= e!158677 (isDefined!227 (getValueByKey!287 (toList!1827 (getCurrentListMap!1359 (_keys!6634 thiss!1504) (_values!4505 thiss!1504) (mask!10621 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4522 thiss!1504))) key!932)))))

(assert (= (and d!60209 c!40822) b!244555))

(assert (= (and d!60209 (not c!40822)) b!244556))

(assert (= (and d!60209 (not res!119946)) b!244557))

(declare-fun m!262649 () Bool)

(assert (=> d!60209 m!262649))

(declare-fun m!262651 () Bool)

(assert (=> b!244555 m!262651))

(declare-fun m!262653 () Bool)

(assert (=> b!244555 m!262653))

(assert (=> b!244555 m!262653))

(declare-fun m!262655 () Bool)

(assert (=> b!244555 m!262655))

(assert (=> b!244557 m!262653))

(assert (=> b!244557 m!262653))

(assert (=> b!244557 m!262655))

(assert (=> b!244270 d!60209))

(declare-fun b!244600 () Bool)

(declare-fun e!158714 () ListLongMap!3623)

(declare-fun call!22807 () ListLongMap!3623)

(assert (=> b!244600 (= e!158714 call!22807)))

(declare-fun b!244601 () Bool)

(declare-fun e!158711 () Bool)

(declare-fun lt!122631 () ListLongMap!3623)

(declare-fun apply!228 (ListLongMap!3623 (_ BitVec 64)) V!8177)

(assert (=> b!244601 (= e!158711 (= (apply!228 lt!122631 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4363 thiss!1504)))))

(declare-fun b!244602 () Bool)

(declare-fun e!158709 () Bool)

(declare-fun e!158713 () Bool)

(assert (=> b!244602 (= e!158709 e!158713)))

(declare-fun res!119965 () Bool)

(declare-fun call!22806 () Bool)

(assert (=> b!244602 (= res!119965 call!22806)))

(assert (=> b!244602 (=> (not res!119965) (not e!158713))))

(declare-fun b!244603 () Bool)

(declare-fun res!119967 () Bool)

(declare-fun e!158707 () Bool)

(assert (=> b!244603 (=> (not res!119967) (not e!158707))))

(declare-fun e!158710 () Bool)

(assert (=> b!244603 (= res!119967 e!158710)))

(declare-fun res!119969 () Bool)

(assert (=> b!244603 (=> res!119969 e!158710)))

(declare-fun e!158712 () Bool)

(assert (=> b!244603 (= res!119969 (not e!158712))))

(declare-fun res!119973 () Bool)

(assert (=> b!244603 (=> (not res!119973) (not e!158712))))

(assert (=> b!244603 (= res!119973 (bvslt #b00000000000000000000000000000000 (size!6080 (_keys!6634 thiss!1504))))))

(declare-fun bm!22800 () Bool)

(declare-fun call!22805 () ListLongMap!3623)

(declare-fun call!22809 () ListLongMap!3623)

(assert (=> bm!22800 (= call!22805 call!22809)))

(declare-fun d!60211 () Bool)

(assert (=> d!60211 e!158707))

(declare-fun res!119966 () Bool)

(assert (=> d!60211 (=> (not res!119966) (not e!158707))))

(assert (=> d!60211 (= res!119966 (or (bvsge #b00000000000000000000000000000000 (size!6080 (_keys!6634 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6080 (_keys!6634 thiss!1504))))))))

(declare-fun lt!122632 () ListLongMap!3623)

(assert (=> d!60211 (= lt!122631 lt!122632)))

(declare-fun lt!122638 () Unit!7518)

(declare-fun e!158716 () Unit!7518)

(assert (=> d!60211 (= lt!122638 e!158716)))

(declare-fun c!40840 () Bool)

(declare-fun e!158715 () Bool)

(assert (=> d!60211 (= c!40840 e!158715)))

(declare-fun res!119971 () Bool)

(assert (=> d!60211 (=> (not res!119971) (not e!158715))))

(assert (=> d!60211 (= res!119971 (bvslt #b00000000000000000000000000000000 (size!6080 (_keys!6634 thiss!1504))))))

(declare-fun e!158704 () ListLongMap!3623)

(assert (=> d!60211 (= lt!122632 e!158704)))

(declare-fun c!40837 () Bool)

(assert (=> d!60211 (= c!40837 (and (not (= (bvand (extraKeys!4259 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4259 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!60211 (validMask!0 (mask!10621 thiss!1504))))

(assert (=> d!60211 (= (getCurrentListMap!1359 (_keys!6634 thiss!1504) (_values!4505 thiss!1504) (mask!10621 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4522 thiss!1504)) lt!122631)))

(declare-fun b!244604 () Bool)

(assert (=> b!244604 (= e!158707 e!158709)))

(declare-fun c!40835 () Bool)

(assert (=> b!244604 (= c!40835 (not (= (bvand (extraKeys!4259 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!244605 () Bool)

(declare-fun lt!122624 () Unit!7518)

(assert (=> b!244605 (= e!158716 lt!122624)))

(declare-fun lt!122622 () ListLongMap!3623)

(declare-fun getCurrentListMapNoExtraKeys!544 (array!12087 array!12085 (_ BitVec 32) (_ BitVec 32) V!8177 V!8177 (_ BitVec 32) Int) ListLongMap!3623)

(assert (=> b!244605 (= lt!122622 (getCurrentListMapNoExtraKeys!544 (_keys!6634 thiss!1504) (_values!4505 thiss!1504) (mask!10621 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4522 thiss!1504)))))

(declare-fun lt!122619 () (_ BitVec 64))

(assert (=> b!244605 (= lt!122619 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122621 () (_ BitVec 64))

(assert (=> b!244605 (= lt!122621 (select (arr!5738 (_keys!6634 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122623 () Unit!7518)

(declare-fun addStillContains!204 (ListLongMap!3623 (_ BitVec 64) V!8177 (_ BitVec 64)) Unit!7518)

(assert (=> b!244605 (= lt!122623 (addStillContains!204 lt!122622 lt!122619 (zeroValue!4363 thiss!1504) lt!122621))))

(declare-fun +!655 (ListLongMap!3623 tuple2!4708) ListLongMap!3623)

(assert (=> b!244605 (contains!1745 (+!655 lt!122622 (tuple2!4709 lt!122619 (zeroValue!4363 thiss!1504))) lt!122621)))

(declare-fun lt!122629 () Unit!7518)

(assert (=> b!244605 (= lt!122629 lt!122623)))

(declare-fun lt!122635 () ListLongMap!3623)

(assert (=> b!244605 (= lt!122635 (getCurrentListMapNoExtraKeys!544 (_keys!6634 thiss!1504) (_values!4505 thiss!1504) (mask!10621 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4522 thiss!1504)))))

(declare-fun lt!122618 () (_ BitVec 64))

(assert (=> b!244605 (= lt!122618 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122630 () (_ BitVec 64))

(assert (=> b!244605 (= lt!122630 (select (arr!5738 (_keys!6634 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122636 () Unit!7518)

(declare-fun addApplyDifferent!204 (ListLongMap!3623 (_ BitVec 64) V!8177 (_ BitVec 64)) Unit!7518)

(assert (=> b!244605 (= lt!122636 (addApplyDifferent!204 lt!122635 lt!122618 (minValue!4363 thiss!1504) lt!122630))))

(assert (=> b!244605 (= (apply!228 (+!655 lt!122635 (tuple2!4709 lt!122618 (minValue!4363 thiss!1504))) lt!122630) (apply!228 lt!122635 lt!122630))))

(declare-fun lt!122625 () Unit!7518)

(assert (=> b!244605 (= lt!122625 lt!122636)))

(declare-fun lt!122617 () ListLongMap!3623)

(assert (=> b!244605 (= lt!122617 (getCurrentListMapNoExtraKeys!544 (_keys!6634 thiss!1504) (_values!4505 thiss!1504) (mask!10621 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4522 thiss!1504)))))

(declare-fun lt!122637 () (_ BitVec 64))

(assert (=> b!244605 (= lt!122637 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122626 () (_ BitVec 64))

(assert (=> b!244605 (= lt!122626 (select (arr!5738 (_keys!6634 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122620 () Unit!7518)

(assert (=> b!244605 (= lt!122620 (addApplyDifferent!204 lt!122617 lt!122637 (zeroValue!4363 thiss!1504) lt!122626))))

(assert (=> b!244605 (= (apply!228 (+!655 lt!122617 (tuple2!4709 lt!122637 (zeroValue!4363 thiss!1504))) lt!122626) (apply!228 lt!122617 lt!122626))))

(declare-fun lt!122633 () Unit!7518)

(assert (=> b!244605 (= lt!122633 lt!122620)))

(declare-fun lt!122628 () ListLongMap!3623)

(assert (=> b!244605 (= lt!122628 (getCurrentListMapNoExtraKeys!544 (_keys!6634 thiss!1504) (_values!4505 thiss!1504) (mask!10621 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4522 thiss!1504)))))

(declare-fun lt!122634 () (_ BitVec 64))

(assert (=> b!244605 (= lt!122634 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122627 () (_ BitVec 64))

(assert (=> b!244605 (= lt!122627 (select (arr!5738 (_keys!6634 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!244605 (= lt!122624 (addApplyDifferent!204 lt!122628 lt!122634 (minValue!4363 thiss!1504) lt!122627))))

(assert (=> b!244605 (= (apply!228 (+!655 lt!122628 (tuple2!4709 lt!122634 (minValue!4363 thiss!1504))) lt!122627) (apply!228 lt!122628 lt!122627))))

(declare-fun bm!22801 () Bool)

(assert (=> bm!22801 (= call!22809 (getCurrentListMapNoExtraKeys!544 (_keys!6634 thiss!1504) (_values!4505 thiss!1504) (mask!10621 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4522 thiss!1504)))))

(declare-fun b!244606 () Bool)

(declare-fun e!158705 () Bool)

(assert (=> b!244606 (= e!158705 e!158711)))

(declare-fun res!119968 () Bool)

(declare-fun call!22804 () Bool)

(assert (=> b!244606 (= res!119968 call!22804)))

(assert (=> b!244606 (=> (not res!119968) (not e!158711))))

(declare-fun call!22808 () ListLongMap!3623)

(declare-fun bm!22802 () Bool)

(declare-fun c!40839 () Bool)

(declare-fun call!22803 () ListLongMap!3623)

(assert (=> bm!22802 (= call!22808 (+!655 (ite c!40837 call!22809 (ite c!40839 call!22805 call!22803)) (ite (or c!40837 c!40839) (tuple2!4709 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4363 thiss!1504)) (tuple2!4709 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4363 thiss!1504)))))))

(declare-fun bm!22803 () Bool)

(assert (=> bm!22803 (= call!22804 (contains!1745 lt!122631 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!244607 () Bool)

(declare-fun e!158706 () ListLongMap!3623)

(assert (=> b!244607 (= e!158706 call!22807)))

(declare-fun b!244608 () Bool)

(assert (=> b!244608 (= e!158715 (validKeyInArray!0 (select (arr!5738 (_keys!6634 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!22804 () Bool)

(assert (=> bm!22804 (= call!22803 call!22805)))

(declare-fun b!244609 () Bool)

(assert (=> b!244609 (= e!158713 (= (apply!228 lt!122631 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4363 thiss!1504)))))

(declare-fun b!244610 () Bool)

(declare-fun e!158708 () Bool)

(assert (=> b!244610 (= e!158710 e!158708)))

(declare-fun res!119970 () Bool)

(assert (=> b!244610 (=> (not res!119970) (not e!158708))))

(assert (=> b!244610 (= res!119970 (contains!1745 lt!122631 (select (arr!5738 (_keys!6634 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!244610 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6080 (_keys!6634 thiss!1504))))))

(declare-fun bm!22805 () Bool)

(assert (=> bm!22805 (= call!22806 (contains!1745 lt!122631 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!244611 () Bool)

(assert (=> b!244611 (= e!158705 (not call!22804))))

(declare-fun b!244612 () Bool)

(declare-fun get!2952 (ValueCell!2855 V!8177) V!8177)

(declare-fun dynLambda!571 (Int (_ BitVec 64)) V!8177)

(assert (=> b!244612 (= e!158708 (= (apply!228 lt!122631 (select (arr!5738 (_keys!6634 thiss!1504)) #b00000000000000000000000000000000)) (get!2952 (select (arr!5737 (_values!4505 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!571 (defaultEntry!4522 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!244612 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6079 (_values!4505 thiss!1504))))))

(assert (=> b!244612 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6080 (_keys!6634 thiss!1504))))))

(declare-fun b!244613 () Bool)

(declare-fun c!40836 () Bool)

(assert (=> b!244613 (= c!40836 (and (not (= (bvand (extraKeys!4259 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4259 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!244613 (= e!158714 e!158706)))

(declare-fun b!244614 () Bool)

(declare-fun res!119972 () Bool)

(assert (=> b!244614 (=> (not res!119972) (not e!158707))))

(assert (=> b!244614 (= res!119972 e!158705)))

(declare-fun c!40838 () Bool)

(assert (=> b!244614 (= c!40838 (not (= (bvand (extraKeys!4259 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!22806 () Bool)

(assert (=> bm!22806 (= call!22807 call!22808)))

(declare-fun b!244615 () Bool)

(assert (=> b!244615 (= e!158706 call!22803)))

(declare-fun b!244616 () Bool)

(assert (=> b!244616 (= e!158704 (+!655 call!22808 (tuple2!4709 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4363 thiss!1504))))))

(declare-fun b!244617 () Bool)

(declare-fun Unit!7531 () Unit!7518)

(assert (=> b!244617 (= e!158716 Unit!7531)))

(declare-fun b!244618 () Bool)

(assert (=> b!244618 (= e!158709 (not call!22806))))

(declare-fun b!244619 () Bool)

(assert (=> b!244619 (= e!158704 e!158714)))

(assert (=> b!244619 (= c!40839 (and (not (= (bvand (extraKeys!4259 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4259 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!244620 () Bool)

(assert (=> b!244620 (= e!158712 (validKeyInArray!0 (select (arr!5738 (_keys!6634 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!60211 c!40837) b!244616))

(assert (= (and d!60211 (not c!40837)) b!244619))

(assert (= (and b!244619 c!40839) b!244600))

(assert (= (and b!244619 (not c!40839)) b!244613))

(assert (= (and b!244613 c!40836) b!244607))

(assert (= (and b!244613 (not c!40836)) b!244615))

(assert (= (or b!244607 b!244615) bm!22804))

(assert (= (or b!244600 bm!22804) bm!22800))

(assert (= (or b!244600 b!244607) bm!22806))

(assert (= (or b!244616 bm!22800) bm!22801))

(assert (= (or b!244616 bm!22806) bm!22802))

(assert (= (and d!60211 res!119971) b!244608))

(assert (= (and d!60211 c!40840) b!244605))

(assert (= (and d!60211 (not c!40840)) b!244617))

(assert (= (and d!60211 res!119966) b!244603))

(assert (= (and b!244603 res!119973) b!244620))

(assert (= (and b!244603 (not res!119969)) b!244610))

(assert (= (and b!244610 res!119970) b!244612))

(assert (= (and b!244603 res!119967) b!244614))

(assert (= (and b!244614 c!40838) b!244606))

(assert (= (and b!244614 (not c!40838)) b!244611))

(assert (= (and b!244606 res!119968) b!244601))

(assert (= (or b!244606 b!244611) bm!22803))

(assert (= (and b!244614 res!119972) b!244604))

(assert (= (and b!244604 c!40835) b!244602))

(assert (= (and b!244604 (not c!40835)) b!244618))

(assert (= (and b!244602 res!119965) b!244609))

(assert (= (or b!244602 b!244618) bm!22805))

(declare-fun b_lambda!8037 () Bool)

(assert (=> (not b_lambda!8037) (not b!244612)))

(declare-fun t!8587 () Bool)

(declare-fun tb!2961 () Bool)

(assert (=> (and b!244252 (= (defaultEntry!4522 thiss!1504) (defaultEntry!4522 thiss!1504)) t!8587) tb!2961))

(declare-fun result!5221 () Bool)

(assert (=> tb!2961 (= result!5221 tp_is_empty!6397)))

(assert (=> b!244612 t!8587))

(declare-fun b_and!13539 () Bool)

(assert (= b_and!13533 (and (=> t!8587 result!5221) b_and!13539)))

(assert (=> d!60211 m!262593))

(declare-fun m!262657 () Bool)

(assert (=> bm!22803 m!262657))

(declare-fun m!262659 () Bool)

(assert (=> b!244601 m!262659))

(declare-fun m!262661 () Bool)

(assert (=> b!244612 m!262661))

(declare-fun m!262663 () Bool)

(assert (=> b!244612 m!262663))

(declare-fun m!262665 () Bool)

(assert (=> b!244612 m!262665))

(assert (=> b!244612 m!262605))

(assert (=> b!244612 m!262661))

(assert (=> b!244612 m!262605))

(declare-fun m!262667 () Bool)

(assert (=> b!244612 m!262667))

(assert (=> b!244612 m!262663))

(declare-fun m!262669 () Bool)

(assert (=> bm!22805 m!262669))

(declare-fun m!262671 () Bool)

(assert (=> b!244609 m!262671))

(declare-fun m!262673 () Bool)

(assert (=> b!244605 m!262673))

(declare-fun m!262675 () Bool)

(assert (=> b!244605 m!262675))

(declare-fun m!262677 () Bool)

(assert (=> b!244605 m!262677))

(declare-fun m!262679 () Bool)

(assert (=> b!244605 m!262679))

(declare-fun m!262681 () Bool)

(assert (=> b!244605 m!262681))

(assert (=> b!244605 m!262605))

(declare-fun m!262683 () Bool)

(assert (=> b!244605 m!262683))

(assert (=> b!244605 m!262679))

(declare-fun m!262685 () Bool)

(assert (=> b!244605 m!262685))

(declare-fun m!262687 () Bool)

(assert (=> b!244605 m!262687))

(declare-fun m!262689 () Bool)

(assert (=> b!244605 m!262689))

(declare-fun m!262691 () Bool)

(assert (=> b!244605 m!262691))

(declare-fun m!262693 () Bool)

(assert (=> b!244605 m!262693))

(assert (=> b!244605 m!262687))

(declare-fun m!262695 () Bool)

(assert (=> b!244605 m!262695))

(assert (=> b!244605 m!262675))

(declare-fun m!262697 () Bool)

(assert (=> b!244605 m!262697))

(declare-fun m!262699 () Bool)

(assert (=> b!244605 m!262699))

(declare-fun m!262701 () Bool)

(assert (=> b!244605 m!262701))

(assert (=> b!244605 m!262683))

(declare-fun m!262703 () Bool)

(assert (=> b!244605 m!262703))

(declare-fun m!262705 () Bool)

(assert (=> b!244616 m!262705))

(declare-fun m!262707 () Bool)

(assert (=> bm!22802 m!262707))

(assert (=> b!244608 m!262605))

(assert (=> b!244608 m!262605))

(assert (=> b!244608 m!262633))

(assert (=> b!244610 m!262605))

(assert (=> b!244610 m!262605))

(declare-fun m!262709 () Bool)

(assert (=> b!244610 m!262709))

(assert (=> b!244620 m!262605))

(assert (=> b!244620 m!262605))

(assert (=> b!244620 m!262633))

(assert (=> bm!22801 m!262691))

(assert (=> b!244270 d!60211))

(declare-fun d!60213 () Bool)

(declare-fun e!158719 () Bool)

(assert (=> d!60213 e!158719))

(declare-fun res!119979 () Bool)

(assert (=> d!60213 (=> (not res!119979) (not e!158719))))

(declare-fun lt!122644 () SeekEntryResult!1046)

(assert (=> d!60213 (= res!119979 ((_ is Found!1046) lt!122644))))

(assert (=> d!60213 (= lt!122644 (seekEntryOrOpen!0 key!932 (_keys!6634 thiss!1504) (mask!10621 thiss!1504)))))

(declare-fun lt!122643 () Unit!7518)

(declare-fun choose!1149 (array!12087 array!12085 (_ BitVec 32) (_ BitVec 32) V!8177 V!8177 (_ BitVec 64) Int) Unit!7518)

(assert (=> d!60213 (= lt!122643 (choose!1149 (_keys!6634 thiss!1504) (_values!4505 thiss!1504) (mask!10621 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) key!932 (defaultEntry!4522 thiss!1504)))))

(assert (=> d!60213 (validMask!0 (mask!10621 thiss!1504))))

(assert (=> d!60213 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!365 (_keys!6634 thiss!1504) (_values!4505 thiss!1504) (mask!10621 thiss!1504) (extraKeys!4259 thiss!1504) (zeroValue!4363 thiss!1504) (minValue!4363 thiss!1504) key!932 (defaultEntry!4522 thiss!1504)) lt!122643)))

(declare-fun b!244627 () Bool)

(declare-fun res!119978 () Bool)

(assert (=> b!244627 (=> (not res!119978) (not e!158719))))

(assert (=> b!244627 (= res!119978 (inRange!0 (index!6355 lt!122644) (mask!10621 thiss!1504)))))

(declare-fun b!244628 () Bool)

(assert (=> b!244628 (= e!158719 (= (select (arr!5738 (_keys!6634 thiss!1504)) (index!6355 lt!122644)) key!932))))

(assert (=> b!244628 (and (bvsge (index!6355 lt!122644) #b00000000000000000000000000000000) (bvslt (index!6355 lt!122644) (size!6080 (_keys!6634 thiss!1504))))))

(assert (= (and d!60213 res!119979) b!244627))

(assert (= (and b!244627 res!119978) b!244628))

(assert (=> d!60213 m!262485))

(declare-fun m!262711 () Bool)

(assert (=> d!60213 m!262711))

(assert (=> d!60213 m!262593))

(declare-fun m!262713 () Bool)

(assert (=> b!244627 m!262713))

(declare-fun m!262715 () Bool)

(assert (=> b!244628 m!262715))

(assert (=> b!244269 d!60213))

(assert (=> b!244279 d!60195))

(assert (=> bm!22763 d!60183))

(declare-fun d!60215 () Bool)

(assert (=> d!60215 (= (inRange!0 (ite c!40775 (index!6354 lt!122499) (index!6357 lt!122499)) (mask!10621 thiss!1504)) (and (bvsge (ite c!40775 (index!6354 lt!122499) (index!6357 lt!122499)) #b00000000000000000000000000000000) (bvslt (ite c!40775 (index!6354 lt!122499) (index!6357 lt!122499)) (bvadd (mask!10621 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!22764 d!60215))

(declare-fun mapIsEmpty!10858 () Bool)

(declare-fun mapRes!10858 () Bool)

(assert (=> mapIsEmpty!10858 mapRes!10858))

(declare-fun b!244635 () Bool)

(declare-fun e!158725 () Bool)

(assert (=> b!244635 (= e!158725 tp_is_empty!6397)))

(declare-fun b!244636 () Bool)

(declare-fun e!158724 () Bool)

(assert (=> b!244636 (= e!158724 tp_is_empty!6397)))

(declare-fun condMapEmpty!10858 () Bool)

(declare-fun mapDefault!10858 () ValueCell!2855)

(assert (=> mapNonEmpty!10849 (= condMapEmpty!10858 (= mapRest!10849 ((as const (Array (_ BitVec 32) ValueCell!2855)) mapDefault!10858)))))

(assert (=> mapNonEmpty!10849 (= tp!22830 (and e!158724 mapRes!10858))))

(declare-fun mapNonEmpty!10858 () Bool)

(declare-fun tp!22846 () Bool)

(assert (=> mapNonEmpty!10858 (= mapRes!10858 (and tp!22846 e!158725))))

(declare-fun mapValue!10858 () ValueCell!2855)

(declare-fun mapKey!10858 () (_ BitVec 32))

(declare-fun mapRest!10858 () (Array (_ BitVec 32) ValueCell!2855))

(assert (=> mapNonEmpty!10858 (= mapRest!10849 (store mapRest!10858 mapKey!10858 mapValue!10858))))

(assert (= (and mapNonEmpty!10849 condMapEmpty!10858) mapIsEmpty!10858))

(assert (= (and mapNonEmpty!10849 (not condMapEmpty!10858)) mapNonEmpty!10858))

(assert (= (and mapNonEmpty!10858 ((_ is ValueCellFull!2855) mapValue!10858)) b!244635))

(assert (= (and mapNonEmpty!10849 ((_ is ValueCellFull!2855) mapDefault!10858)) b!244636))

(declare-fun m!262717 () Bool)

(assert (=> mapNonEmpty!10858 m!262717))

(declare-fun b_lambda!8039 () Bool)

(assert (= b_lambda!8037 (or (and b!244252 b_free!6535) b_lambda!8039)))

(check-sat (not bm!22801) (not b!244608) (not b!244518) (not d!60185) (not d!60197) (not b!244538) (not b!244548) (not b!244539) (not b!244557) (not d!60195) (not bm!22805) (not b!244555) (not b_lambda!8039) (not b!244605) (not b!244530) (not b!244478) (not b!244601) (not d!60181) (not bm!22785) (not b!244609) (not d!60193) (not b!244516) (not b!244546) (not d!60211) b_and!13539 (not b!244484) (not b!244547) (not d!60213) (not d!60209) (not mapNonEmpty!10858) tp_is_empty!6397 (not b!244529) (not b!244616) (not b!244531) (not b_next!6535) (not d!60205) (not b!244514) (not b!244612) (not bm!22781) (not b!244610) (not bm!22802) (not bm!22782) (not b!244627) (not b!244620) (not d!60191) (not bm!22803))
(check-sat b_and!13539 (not b_next!6535))

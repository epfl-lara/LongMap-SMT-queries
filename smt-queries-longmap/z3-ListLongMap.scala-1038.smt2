; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21914 () Bool)

(assert start!21914)

(declare-fun b!222474 () Bool)

(declare-fun b_free!5977 () Bool)

(declare-fun b_next!5977 () Bool)

(assert (=> b!222474 (= b_free!5977 (not b_next!5977))))

(declare-fun tp!21072 () Bool)

(declare-fun b_and!12889 () Bool)

(assert (=> b!222474 (= tp!21072 b_and!12889)))

(declare-fun b!222459 () Bool)

(declare-fun e!144569 () Bool)

(declare-fun e!144565 () Bool)

(assert (=> b!222459 (= e!144569 e!144565)))

(declare-fun res!109219 () Bool)

(assert (=> b!222459 (=> (not res!109219) (not e!144565))))

(declare-datatypes ((SeekEntryResult!809 0))(
  ( (MissingZero!809 (index!5406 (_ BitVec 32))) (Found!809 (index!5407 (_ BitVec 32))) (Intermediate!809 (undefined!1621 Bool) (index!5408 (_ BitVec 32)) (x!23029 (_ BitVec 32))) (Undefined!809) (MissingVacant!809 (index!5409 (_ BitVec 32))) )
))
(declare-fun lt!112706 () SeekEntryResult!809)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!222459 (= res!109219 (or (= lt!112706 (MissingZero!809 index!297)) (= lt!112706 (MissingVacant!809 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7433 0))(
  ( (V!7434 (val!2964 Int)) )
))
(declare-datatypes ((ValueCell!2576 0))(
  ( (ValueCellFull!2576 (v!4985 V!7433)) (EmptyCell!2576) )
))
(declare-datatypes ((array!10919 0))(
  ( (array!10920 (arr!5179 (Array (_ BitVec 32) ValueCell!2576)) (size!5512 (_ BitVec 32))) )
))
(declare-datatypes ((array!10921 0))(
  ( (array!10922 (arr!5180 (Array (_ BitVec 32) (_ BitVec 64))) (size!5513 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3052 0))(
  ( (LongMapFixedSize!3053 (defaultEntry!4185 Int) (mask!10005 (_ BitVec 32)) (extraKeys!3922 (_ BitVec 32)) (zeroValue!4026 V!7433) (minValue!4026 V!7433) (_size!1575 (_ BitVec 32)) (_keys!6239 array!10921) (_values!4168 array!10919) (_vacant!1575 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3052)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10921 (_ BitVec 32)) SeekEntryResult!809)

(assert (=> b!222459 (= lt!112706 (seekEntryOrOpen!0 key!932 (_keys!6239 thiss!1504) (mask!10005 thiss!1504)))))

(declare-fun b!222461 () Bool)

(declare-fun res!109215 () Bool)

(declare-fun e!144564 () Bool)

(assert (=> b!222461 (=> (not res!109215) (not e!144564))))

(declare-datatypes ((List!3208 0))(
  ( (Nil!3205) (Cons!3204 (h!3852 (_ BitVec 64)) (t!8159 List!3208)) )
))
(declare-fun noDuplicate!69 (List!3208) Bool)

(assert (=> b!222461 (= res!109215 (noDuplicate!69 Nil!3205))))

(declare-fun b!222462 () Bool)

(declare-fun res!109213 () Bool)

(assert (=> b!222462 (=> (not res!109213) (not e!144564))))

(declare-fun e!144560 () Bool)

(assert (=> b!222462 (= res!109213 e!144560)))

(declare-fun res!109214 () Bool)

(assert (=> b!222462 (=> res!109214 e!144560)))

(declare-fun e!144575 () Bool)

(assert (=> b!222462 (= res!109214 e!144575)))

(declare-fun res!109208 () Bool)

(assert (=> b!222462 (=> (not res!109208) (not e!144575))))

(assert (=> b!222462 (= res!109208 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!222463 () Bool)

(declare-datatypes ((Unit!6623 0))(
  ( (Unit!6624) )
))
(declare-fun e!144559 () Unit!6623)

(declare-fun Unit!6625 () Unit!6623)

(assert (=> b!222463 (= e!144559 Unit!6625)))

(declare-fun lt!112710 () Unit!6623)

(declare-fun lemmaArrayContainsKeyThenInListMap!58 (array!10921 array!10919 (_ BitVec 32) (_ BitVec 32) V!7433 V!7433 (_ BitVec 64) (_ BitVec 32) Int) Unit!6623)

(assert (=> b!222463 (= lt!112710 (lemmaArrayContainsKeyThenInListMap!58 (_keys!6239 thiss!1504) (_values!4168 thiss!1504) (mask!10005 thiss!1504) (extraKeys!3922 thiss!1504) (zeroValue!4026 thiss!1504) (minValue!4026 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4185 thiss!1504)))))

(assert (=> b!222463 false))

(declare-fun mapNonEmpty!9928 () Bool)

(declare-fun mapRes!9928 () Bool)

(declare-fun tp!21073 () Bool)

(declare-fun e!144568 () Bool)

(assert (=> mapNonEmpty!9928 (= mapRes!9928 (and tp!21073 e!144568))))

(declare-fun mapRest!9928 () (Array (_ BitVec 32) ValueCell!2576))

(declare-fun mapValue!9928 () ValueCell!2576)

(declare-fun mapKey!9928 () (_ BitVec 32))

(assert (=> mapNonEmpty!9928 (= (arr!5179 (_values!4168 thiss!1504)) (store mapRest!9928 mapKey!9928 mapValue!9928))))

(declare-fun bm!20750 () Bool)

(declare-fun call!20753 () Bool)

(declare-fun c!36972 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20750 (= call!20753 (inRange!0 (ite c!36972 (index!5406 lt!112706) (index!5409 lt!112706)) (mask!10005 thiss!1504)))))

(declare-fun b!222464 () Bool)

(declare-fun e!144567 () Bool)

(get-info :version)

(assert (=> b!222464 (= e!144567 ((_ is Undefined!809) lt!112706))))

(declare-fun b!222465 () Bool)

(declare-fun e!144562 () Bool)

(declare-fun e!144561 () Bool)

(assert (=> b!222465 (= e!144562 (and e!144561 mapRes!9928))))

(declare-fun condMapEmpty!9928 () Bool)

(declare-fun mapDefault!9928 () ValueCell!2576)

(assert (=> b!222465 (= condMapEmpty!9928 (= (arr!5179 (_values!4168 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2576)) mapDefault!9928)))))

(declare-fun b!222466 () Bool)

(declare-fun res!109207 () Bool)

(assert (=> b!222466 (=> (not res!109207) (not e!144564))))

(declare-fun contains!1494 (List!3208 (_ BitVec 64)) Bool)

(assert (=> b!222466 (= res!109207 (not (contains!1494 Nil!3205 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!222467 () Bool)

(declare-fun c!36973 () Bool)

(assert (=> b!222467 (= c!36973 ((_ is MissingVacant!809) lt!112706))))

(declare-fun e!144563 () Bool)

(assert (=> b!222467 (= e!144563 e!144567)))

(declare-fun b!222460 () Bool)

(declare-fun e!144566 () Bool)

(assert (=> b!222460 (= e!144566 (not (contains!1494 Nil!3205 key!932)))))

(declare-fun res!109222 () Bool)

(assert (=> start!21914 (=> (not res!109222) (not e!144569))))

(declare-fun valid!1237 (LongMapFixedSize!3052) Bool)

(assert (=> start!21914 (= res!109222 (valid!1237 thiss!1504))))

(assert (=> start!21914 e!144569))

(declare-fun e!144574 () Bool)

(assert (=> start!21914 e!144574))

(assert (=> start!21914 true))

(declare-fun b!222468 () Bool)

(declare-fun res!109211 () Bool)

(assert (=> b!222468 (= res!109211 (= (select (arr!5180 (_keys!6239 thiss!1504)) (index!5409 lt!112706)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!144571 () Bool)

(assert (=> b!222468 (=> (not res!109211) (not e!144571))))

(declare-fun b!222469 () Bool)

(declare-fun res!109210 () Bool)

(declare-fun e!144558 () Bool)

(assert (=> b!222469 (=> (not res!109210) (not e!144558))))

(assert (=> b!222469 (= res!109210 (= (select (arr!5180 (_keys!6239 thiss!1504)) (index!5406 lt!112706)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!222470 () Bool)

(declare-fun tp_is_empty!5839 () Bool)

(assert (=> b!222470 (= e!144561 tp_is_empty!5839)))

(declare-fun b!222471 () Bool)

(declare-fun Unit!6626 () Unit!6623)

(assert (=> b!222471 (= e!144559 Unit!6626)))

(declare-fun mapIsEmpty!9928 () Bool)

(assert (=> mapIsEmpty!9928 mapRes!9928))

(declare-fun b!222472 () Bool)

(declare-fun res!109218 () Bool)

(assert (=> b!222472 (=> (not res!109218) (not e!144569))))

(assert (=> b!222472 (= res!109218 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!222473 () Bool)

(assert (=> b!222473 (= e!144560 e!144566)))

(declare-fun res!109216 () Bool)

(assert (=> b!222473 (=> (not res!109216) (not e!144566))))

(assert (=> b!222473 (= res!109216 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun array_inv!3399 (array!10921) Bool)

(declare-fun array_inv!3400 (array!10919) Bool)

(assert (=> b!222474 (= e!144574 (and tp!21072 tp_is_empty!5839 (array_inv!3399 (_keys!6239 thiss!1504)) (array_inv!3400 (_values!4168 thiss!1504)) e!144562))))

(declare-fun b!222475 () Bool)

(declare-fun e!144573 () Unit!6623)

(declare-fun Unit!6627 () Unit!6623)

(assert (=> b!222475 (= e!144573 Unit!6627)))

(declare-fun lt!112705 () Unit!6623)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!218 (array!10921 array!10919 (_ BitVec 32) (_ BitVec 32) V!7433 V!7433 (_ BitVec 64) Int) Unit!6623)

(assert (=> b!222475 (= lt!112705 (lemmaInListMapThenSeekEntryOrOpenFindsIt!218 (_keys!6239 thiss!1504) (_values!4168 thiss!1504) (mask!10005 thiss!1504) (extraKeys!3922 thiss!1504) (zeroValue!4026 thiss!1504) (minValue!4026 thiss!1504) key!932 (defaultEntry!4185 thiss!1504)))))

(assert (=> b!222475 false))

(declare-fun b!222476 () Bool)

(assert (=> b!222476 (= e!144568 tp_is_empty!5839)))

(declare-fun b!222477 () Bool)

(assert (=> b!222477 (= e!144564 false)))

(declare-fun lt!112711 () Bool)

(declare-fun arrayNoDuplicates!0 (array!10921 (_ BitVec 32) List!3208) Bool)

(assert (=> b!222477 (= lt!112711 (arrayNoDuplicates!0 (_keys!6239 thiss!1504) #b00000000000000000000000000000000 Nil!3205))))

(declare-fun b!222478 () Bool)

(declare-fun lt!112707 () Unit!6623)

(assert (=> b!222478 (= e!144573 lt!112707)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!212 (array!10921 array!10919 (_ BitVec 32) (_ BitVec 32) V!7433 V!7433 (_ BitVec 64) Int) Unit!6623)

(assert (=> b!222478 (= lt!112707 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!212 (_keys!6239 thiss!1504) (_values!4168 thiss!1504) (mask!10005 thiss!1504) (extraKeys!3922 thiss!1504) (zeroValue!4026 thiss!1504) (minValue!4026 thiss!1504) key!932 (defaultEntry!4185 thiss!1504)))))

(assert (=> b!222478 (= c!36972 ((_ is MissingZero!809) lt!112706))))

(assert (=> b!222478 e!144563))

(declare-fun bm!20751 () Bool)

(declare-fun call!20754 () Bool)

(declare-fun arrayContainsKey!0 (array!10921 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20751 (= call!20754 (arrayContainsKey!0 (_keys!6239 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!222479 () Bool)

(declare-fun e!144572 () Bool)

(assert (=> b!222479 (= e!144572 e!144564)))

(declare-fun res!109221 () Bool)

(assert (=> b!222479 (=> (not res!109221) (not e!144564))))

(assert (=> b!222479 (= res!109221 (and (bvslt (size!5513 (_keys!6239 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!5513 (_keys!6239 thiss!1504)))))))

(declare-fun lt!112708 () Unit!6623)

(assert (=> b!222479 (= lt!112708 e!144559)))

(declare-fun c!36970 () Bool)

(assert (=> b!222479 (= c!36970 (arrayContainsKey!0 (_keys!6239 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!222480 () Bool)

(assert (=> b!222480 (= e!144565 e!144572)))

(declare-fun res!109220 () Bool)

(assert (=> b!222480 (=> (not res!109220) (not e!144572))))

(assert (=> b!222480 (= res!109220 (inRange!0 index!297 (mask!10005 thiss!1504)))))

(declare-fun lt!112709 () Unit!6623)

(assert (=> b!222480 (= lt!112709 e!144573)))

(declare-fun c!36971 () Bool)

(declare-datatypes ((tuple2!4312 0))(
  ( (tuple2!4313 (_1!2167 (_ BitVec 64)) (_2!2167 V!7433)) )
))
(declare-datatypes ((List!3209 0))(
  ( (Nil!3206) (Cons!3205 (h!3853 tuple2!4312) (t!8160 List!3209)) )
))
(declare-datatypes ((ListLongMap!3227 0))(
  ( (ListLongMap!3228 (toList!1629 List!3209)) )
))
(declare-fun contains!1495 (ListLongMap!3227 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1161 (array!10921 array!10919 (_ BitVec 32) (_ BitVec 32) V!7433 V!7433 (_ BitVec 32) Int) ListLongMap!3227)

(assert (=> b!222480 (= c!36971 (contains!1495 (getCurrentListMap!1161 (_keys!6239 thiss!1504) (_values!4168 thiss!1504) (mask!10005 thiss!1504) (extraKeys!3922 thiss!1504) (zeroValue!4026 thiss!1504) (minValue!4026 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4185 thiss!1504)) key!932))))

(declare-fun b!222481 () Bool)

(assert (=> b!222481 (= e!144567 e!144571)))

(declare-fun res!109212 () Bool)

(assert (=> b!222481 (= res!109212 call!20753)))

(assert (=> b!222481 (=> (not res!109212) (not e!144571))))

(declare-fun b!222482 () Bool)

(assert (=> b!222482 (= e!144558 (not call!20754))))

(declare-fun b!222483 () Bool)

(assert (=> b!222483 (= e!144575 (contains!1494 Nil!3205 key!932))))

(declare-fun b!222484 () Bool)

(declare-fun res!109217 () Bool)

(assert (=> b!222484 (=> (not res!109217) (not e!144558))))

(assert (=> b!222484 (= res!109217 call!20753)))

(assert (=> b!222484 (= e!144563 e!144558)))

(declare-fun b!222485 () Bool)

(declare-fun res!109209 () Bool)

(assert (=> b!222485 (=> (not res!109209) (not e!144564))))

(assert (=> b!222485 (= res!109209 (not (contains!1494 Nil!3205 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!222486 () Bool)

(assert (=> b!222486 (= e!144571 (not call!20754))))

(assert (= (and start!21914 res!109222) b!222472))

(assert (= (and b!222472 res!109218) b!222459))

(assert (= (and b!222459 res!109219) b!222480))

(assert (= (and b!222480 c!36971) b!222475))

(assert (= (and b!222480 (not c!36971)) b!222478))

(assert (= (and b!222478 c!36972) b!222484))

(assert (= (and b!222478 (not c!36972)) b!222467))

(assert (= (and b!222484 res!109217) b!222469))

(assert (= (and b!222469 res!109210) b!222482))

(assert (= (and b!222467 c!36973) b!222481))

(assert (= (and b!222467 (not c!36973)) b!222464))

(assert (= (and b!222481 res!109212) b!222468))

(assert (= (and b!222468 res!109211) b!222486))

(assert (= (or b!222484 b!222481) bm!20750))

(assert (= (or b!222482 b!222486) bm!20751))

(assert (= (and b!222480 res!109220) b!222479))

(assert (= (and b!222479 c!36970) b!222463))

(assert (= (and b!222479 (not c!36970)) b!222471))

(assert (= (and b!222479 res!109221) b!222461))

(assert (= (and b!222461 res!109215) b!222485))

(assert (= (and b!222485 res!109209) b!222466))

(assert (= (and b!222466 res!109207) b!222462))

(assert (= (and b!222462 res!109208) b!222483))

(assert (= (and b!222462 (not res!109214)) b!222473))

(assert (= (and b!222473 res!109216) b!222460))

(assert (= (and b!222462 res!109213) b!222477))

(assert (= (and b!222465 condMapEmpty!9928) mapIsEmpty!9928))

(assert (= (and b!222465 (not condMapEmpty!9928)) mapNonEmpty!9928))

(assert (= (and mapNonEmpty!9928 ((_ is ValueCellFull!2576) mapValue!9928)) b!222476))

(assert (= (and b!222465 ((_ is ValueCellFull!2576) mapDefault!9928)) b!222470))

(assert (= b!222474 b!222465))

(assert (= start!21914 b!222474))

(declare-fun m!246727 () Bool)

(assert (=> b!222469 m!246727))

(declare-fun m!246729 () Bool)

(assert (=> b!222459 m!246729))

(declare-fun m!246731 () Bool)

(assert (=> b!222483 m!246731))

(declare-fun m!246733 () Bool)

(assert (=> mapNonEmpty!9928 m!246733))

(declare-fun m!246735 () Bool)

(assert (=> bm!20750 m!246735))

(declare-fun m!246737 () Bool)

(assert (=> b!222474 m!246737))

(declare-fun m!246739 () Bool)

(assert (=> b!222474 m!246739))

(declare-fun m!246741 () Bool)

(assert (=> b!222466 m!246741))

(declare-fun m!246743 () Bool)

(assert (=> b!222480 m!246743))

(declare-fun m!246745 () Bool)

(assert (=> b!222480 m!246745))

(assert (=> b!222480 m!246745))

(declare-fun m!246747 () Bool)

(assert (=> b!222480 m!246747))

(declare-fun m!246749 () Bool)

(assert (=> b!222477 m!246749))

(assert (=> b!222460 m!246731))

(declare-fun m!246751 () Bool)

(assert (=> b!222463 m!246751))

(declare-fun m!246753 () Bool)

(assert (=> b!222468 m!246753))

(declare-fun m!246755 () Bool)

(assert (=> b!222478 m!246755))

(declare-fun m!246757 () Bool)

(assert (=> b!222479 m!246757))

(declare-fun m!246759 () Bool)

(assert (=> start!21914 m!246759))

(assert (=> bm!20751 m!246757))

(declare-fun m!246761 () Bool)

(assert (=> b!222485 m!246761))

(declare-fun m!246763 () Bool)

(assert (=> b!222475 m!246763))

(declare-fun m!246765 () Bool)

(assert (=> b!222461 m!246765))

(check-sat (not bm!20750) (not b!222460) (not bm!20751) (not mapNonEmpty!9928) (not b!222459) (not b!222478) (not b!222461) (not b!222483) (not b!222463) (not b!222475) (not b!222480) tp_is_empty!5839 (not b!222479) b_and!12889 (not b_next!5977) (not b!222477) (not start!21914) (not b!222474) (not b!222485) (not b!222466))
(check-sat b_and!12889 (not b_next!5977))

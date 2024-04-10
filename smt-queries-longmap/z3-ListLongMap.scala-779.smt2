; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18438 () Bool)

(assert start!18438)

(declare-fun b!182933 () Bool)

(declare-fun b_free!4515 () Bool)

(declare-fun b_next!4515 () Bool)

(assert (=> b!182933 (= b_free!4515 (not b_next!4515))))

(declare-fun tp!16310 () Bool)

(declare-fun b_and!11081 () Bool)

(assert (=> b!182933 (= tp!16310 b_and!11081)))

(declare-fun b!182927 () Bool)

(declare-fun res!86601 () Bool)

(declare-fun e!120440 () Bool)

(assert (=> b!182927 (=> (not res!86601) (not e!120440))))

(declare-datatypes ((V!5363 0))(
  ( (V!5364 (val!2188 Int)) )
))
(declare-datatypes ((ValueCell!1800 0))(
  ( (ValueCellFull!1800 (v!4089 V!5363)) (EmptyCell!1800) )
))
(declare-datatypes ((array!7763 0))(
  ( (array!7764 (arr!3671 (Array (_ BitVec 32) (_ BitVec 64))) (size!3983 (_ BitVec 32))) )
))
(declare-datatypes ((array!7765 0))(
  ( (array!7766 (arr!3672 (Array (_ BitVec 32) ValueCell!1800)) (size!3984 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2508 0))(
  ( (LongMapFixedSize!2509 (defaultEntry!3742 Int) (mask!8795 (_ BitVec 32)) (extraKeys!3479 (_ BitVec 32)) (zeroValue!3583 V!5363) (minValue!3583 V!5363) (_size!1303 (_ BitVec 32)) (_keys!5657 array!7763) (_values!3725 array!7765) (_vacant!1303 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2508)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3410 0))(
  ( (tuple2!3411 (_1!1716 (_ BitVec 64)) (_2!1716 V!5363)) )
))
(declare-datatypes ((List!2329 0))(
  ( (Nil!2326) (Cons!2325 (h!2954 tuple2!3410) (t!7193 List!2329)) )
))
(declare-datatypes ((ListLongMap!2327 0))(
  ( (ListLongMap!2328 (toList!1179 List!2329)) )
))
(declare-fun contains!1264 (ListLongMap!2327 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!827 (array!7763 array!7765 (_ BitVec 32) (_ BitVec 32) V!5363 V!5363 (_ BitVec 32) Int) ListLongMap!2327)

(assert (=> b!182927 (= res!86601 (contains!1264 (getCurrentListMap!827 (_keys!5657 thiss!1248) (_values!3725 thiss!1248) (mask!8795 thiss!1248) (extraKeys!3479 thiss!1248) (zeroValue!3583 thiss!1248) (minValue!3583 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3742 thiss!1248)) key!828))))

(declare-fun b!182928 () Bool)

(declare-fun res!86600 () Bool)

(assert (=> b!182928 (=> (not res!86600) (not e!120440))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!182928 (= res!86600 (validMask!0 (mask!8795 thiss!1248)))))

(declare-fun mapIsEmpty!7358 () Bool)

(declare-fun mapRes!7358 () Bool)

(assert (=> mapIsEmpty!7358 mapRes!7358))

(declare-fun b!182929 () Bool)

(declare-fun e!120439 () Bool)

(declare-fun tp_is_empty!4287 () Bool)

(assert (=> b!182929 (= e!120439 tp_is_empty!4287)))

(declare-fun res!86603 () Bool)

(declare-fun e!120435 () Bool)

(assert (=> start!18438 (=> (not res!86603) (not e!120435))))

(declare-fun valid!1039 (LongMapFixedSize!2508) Bool)

(assert (=> start!18438 (= res!86603 (valid!1039 thiss!1248))))

(assert (=> start!18438 e!120435))

(declare-fun e!120436 () Bool)

(assert (=> start!18438 e!120436))

(assert (=> start!18438 true))

(declare-fun b!182930 () Bool)

(declare-fun e!120434 () Bool)

(declare-fun e!120437 () Bool)

(assert (=> b!182930 (= e!120434 (and e!120437 mapRes!7358))))

(declare-fun condMapEmpty!7358 () Bool)

(declare-fun mapDefault!7358 () ValueCell!1800)

(assert (=> b!182930 (= condMapEmpty!7358 (= (arr!3672 (_values!3725 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1800)) mapDefault!7358)))))

(declare-fun b!182931 () Bool)

(declare-fun res!86602 () Bool)

(assert (=> b!182931 (=> (not res!86602) (not e!120440))))

(declare-datatypes ((List!2330 0))(
  ( (Nil!2327) (Cons!2326 (h!2955 (_ BitVec 64)) (t!7194 List!2330)) )
))
(declare-fun arrayNoDuplicates!0 (array!7763 (_ BitVec 32) List!2330) Bool)

(assert (=> b!182931 (= res!86602 (arrayNoDuplicates!0 (_keys!5657 thiss!1248) #b00000000000000000000000000000000 Nil!2327))))

(declare-fun b!182932 () Bool)

(declare-fun res!86599 () Bool)

(assert (=> b!182932 (=> (not res!86599) (not e!120435))))

(assert (=> b!182932 (= res!86599 (not (= key!828 (bvneg key!828))))))

(declare-fun array_inv!2373 (array!7763) Bool)

(declare-fun array_inv!2374 (array!7765) Bool)

(assert (=> b!182933 (= e!120436 (and tp!16310 tp_is_empty!4287 (array_inv!2373 (_keys!5657 thiss!1248)) (array_inv!2374 (_values!3725 thiss!1248)) e!120434))))

(declare-fun b!182934 () Bool)

(declare-fun res!86597 () Bool)

(assert (=> b!182934 (=> (not res!86597) (not e!120440))))

(assert (=> b!182934 (= res!86597 (and (= (size!3984 (_values!3725 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8795 thiss!1248))) (= (size!3983 (_keys!5657 thiss!1248)) (size!3984 (_values!3725 thiss!1248))) (bvsge (mask!8795 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3479 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3479 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!7358 () Bool)

(declare-fun tp!16309 () Bool)

(assert (=> mapNonEmpty!7358 (= mapRes!7358 (and tp!16309 e!120439))))

(declare-fun mapKey!7358 () (_ BitVec 32))

(declare-fun mapValue!7358 () ValueCell!1800)

(declare-fun mapRest!7358 () (Array (_ BitVec 32) ValueCell!1800))

(assert (=> mapNonEmpty!7358 (= (arr!3672 (_values!3725 thiss!1248)) (store mapRest!7358 mapKey!7358 mapValue!7358))))

(declare-fun b!182935 () Bool)

(assert (=> b!182935 (= e!120435 e!120440)))

(declare-fun res!86598 () Bool)

(assert (=> b!182935 (=> (not res!86598) (not e!120440))))

(declare-datatypes ((SeekEntryResult!614 0))(
  ( (MissingZero!614 (index!4626 (_ BitVec 32))) (Found!614 (index!4627 (_ BitVec 32))) (Intermediate!614 (undefined!1426 Bool) (index!4628 (_ BitVec 32)) (x!19932 (_ BitVec 32))) (Undefined!614) (MissingVacant!614 (index!4629 (_ BitVec 32))) )
))
(declare-fun lt!90421 () SeekEntryResult!614)

(get-info :version)

(assert (=> b!182935 (= res!86598 (and (not ((_ is Undefined!614) lt!90421)) (not ((_ is MissingVacant!614) lt!90421)) (not ((_ is MissingZero!614) lt!90421)) ((_ is Found!614) lt!90421)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7763 (_ BitVec 32)) SeekEntryResult!614)

(assert (=> b!182935 (= lt!90421 (seekEntryOrOpen!0 key!828 (_keys!5657 thiss!1248) (mask!8795 thiss!1248)))))

(declare-fun b!182936 () Bool)

(assert (=> b!182936 (= e!120437 tp_is_empty!4287)))

(declare-fun b!182937 () Bool)

(declare-fun res!86604 () Bool)

(assert (=> b!182937 (=> (not res!86604) (not e!120440))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7763 (_ BitVec 32)) Bool)

(assert (=> b!182937 (= res!86604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5657 thiss!1248) (mask!8795 thiss!1248)))))

(declare-fun b!182938 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!182938 (= e!120440 (not (validKeyInArray!0 key!828)))))

(assert (= (and start!18438 res!86603) b!182932))

(assert (= (and b!182932 res!86599) b!182935))

(assert (= (and b!182935 res!86598) b!182927))

(assert (= (and b!182927 res!86601) b!182928))

(assert (= (and b!182928 res!86600) b!182934))

(assert (= (and b!182934 res!86597) b!182937))

(assert (= (and b!182937 res!86604) b!182931))

(assert (= (and b!182931 res!86602) b!182938))

(assert (= (and b!182930 condMapEmpty!7358) mapIsEmpty!7358))

(assert (= (and b!182930 (not condMapEmpty!7358)) mapNonEmpty!7358))

(assert (= (and mapNonEmpty!7358 ((_ is ValueCellFull!1800) mapValue!7358)) b!182929))

(assert (= (and b!182930 ((_ is ValueCellFull!1800) mapDefault!7358)) b!182936))

(assert (= b!182933 b!182930))

(assert (= start!18438 b!182933))

(declare-fun m!210551 () Bool)

(assert (=> b!182928 m!210551))

(declare-fun m!210553 () Bool)

(assert (=> b!182938 m!210553))

(declare-fun m!210555 () Bool)

(assert (=> b!182927 m!210555))

(assert (=> b!182927 m!210555))

(declare-fun m!210557 () Bool)

(assert (=> b!182927 m!210557))

(declare-fun m!210559 () Bool)

(assert (=> mapNonEmpty!7358 m!210559))

(declare-fun m!210561 () Bool)

(assert (=> b!182933 m!210561))

(declare-fun m!210563 () Bool)

(assert (=> b!182933 m!210563))

(declare-fun m!210565 () Bool)

(assert (=> start!18438 m!210565))

(declare-fun m!210567 () Bool)

(assert (=> b!182931 m!210567))

(declare-fun m!210569 () Bool)

(assert (=> b!182935 m!210569))

(declare-fun m!210571 () Bool)

(assert (=> b!182937 m!210571))

(check-sat tp_is_empty!4287 (not b!182931) (not start!18438) (not b!182927) (not b!182938) (not b!182933) b_and!11081 (not b!182928) (not b_next!4515) (not mapNonEmpty!7358) (not b!182937) (not b!182935))
(check-sat b_and!11081 (not b_next!4515))
(get-model)

(declare-fun d!54665 () Bool)

(assert (=> d!54665 (= (validKeyInArray!0 key!828) (and (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!828 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!182938 d!54665))

(declare-fun d!54667 () Bool)

(declare-fun res!86635 () Bool)

(declare-fun e!120464 () Bool)

(assert (=> d!54667 (=> (not res!86635) (not e!120464))))

(declare-fun simpleValid!173 (LongMapFixedSize!2508) Bool)

(assert (=> d!54667 (= res!86635 (simpleValid!173 thiss!1248))))

(assert (=> d!54667 (= (valid!1039 thiss!1248) e!120464)))

(declare-fun b!182981 () Bool)

(declare-fun res!86636 () Bool)

(assert (=> b!182981 (=> (not res!86636) (not e!120464))))

(declare-fun arrayCountValidKeys!0 (array!7763 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!182981 (= res!86636 (= (arrayCountValidKeys!0 (_keys!5657 thiss!1248) #b00000000000000000000000000000000 (size!3983 (_keys!5657 thiss!1248))) (_size!1303 thiss!1248)))))

(declare-fun b!182982 () Bool)

(declare-fun res!86637 () Bool)

(assert (=> b!182982 (=> (not res!86637) (not e!120464))))

(assert (=> b!182982 (= res!86637 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5657 thiss!1248) (mask!8795 thiss!1248)))))

(declare-fun b!182983 () Bool)

(assert (=> b!182983 (= e!120464 (arrayNoDuplicates!0 (_keys!5657 thiss!1248) #b00000000000000000000000000000000 Nil!2327))))

(assert (= (and d!54667 res!86635) b!182981))

(assert (= (and b!182981 res!86636) b!182982))

(assert (= (and b!182982 res!86637) b!182983))

(declare-fun m!210595 () Bool)

(assert (=> d!54667 m!210595))

(declare-fun m!210597 () Bool)

(assert (=> b!182981 m!210597))

(assert (=> b!182982 m!210571))

(assert (=> b!182983 m!210567))

(assert (=> start!18438 d!54667))

(declare-fun d!54669 () Bool)

(declare-fun e!120469 () Bool)

(assert (=> d!54669 e!120469))

(declare-fun res!86640 () Bool)

(assert (=> d!54669 (=> res!86640 e!120469)))

(declare-fun lt!90435 () Bool)

(assert (=> d!54669 (= res!86640 (not lt!90435))))

(declare-fun lt!90434 () Bool)

(assert (=> d!54669 (= lt!90435 lt!90434)))

(declare-datatypes ((Unit!5540 0))(
  ( (Unit!5541) )
))
(declare-fun lt!90436 () Unit!5540)

(declare-fun e!120470 () Unit!5540)

(assert (=> d!54669 (= lt!90436 e!120470)))

(declare-fun c!32784 () Bool)

(assert (=> d!54669 (= c!32784 lt!90434)))

(declare-fun containsKey!218 (List!2329 (_ BitVec 64)) Bool)

(assert (=> d!54669 (= lt!90434 (containsKey!218 (toList!1179 (getCurrentListMap!827 (_keys!5657 thiss!1248) (_values!3725 thiss!1248) (mask!8795 thiss!1248) (extraKeys!3479 thiss!1248) (zeroValue!3583 thiss!1248) (minValue!3583 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3742 thiss!1248))) key!828))))

(assert (=> d!54669 (= (contains!1264 (getCurrentListMap!827 (_keys!5657 thiss!1248) (_values!3725 thiss!1248) (mask!8795 thiss!1248) (extraKeys!3479 thiss!1248) (zeroValue!3583 thiss!1248) (minValue!3583 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3742 thiss!1248)) key!828) lt!90435)))

(declare-fun b!182990 () Bool)

(declare-fun lt!90433 () Unit!5540)

(assert (=> b!182990 (= e!120470 lt!90433)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!166 (List!2329 (_ BitVec 64)) Unit!5540)

(assert (=> b!182990 (= lt!90433 (lemmaContainsKeyImpliesGetValueByKeyDefined!166 (toList!1179 (getCurrentListMap!827 (_keys!5657 thiss!1248) (_values!3725 thiss!1248) (mask!8795 thiss!1248) (extraKeys!3479 thiss!1248) (zeroValue!3583 thiss!1248) (minValue!3583 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3742 thiss!1248))) key!828))))

(declare-datatypes ((Option!220 0))(
  ( (Some!219 (v!4091 V!5363)) (None!218) )
))
(declare-fun isDefined!167 (Option!220) Bool)

(declare-fun getValueByKey!214 (List!2329 (_ BitVec 64)) Option!220)

(assert (=> b!182990 (isDefined!167 (getValueByKey!214 (toList!1179 (getCurrentListMap!827 (_keys!5657 thiss!1248) (_values!3725 thiss!1248) (mask!8795 thiss!1248) (extraKeys!3479 thiss!1248) (zeroValue!3583 thiss!1248) (minValue!3583 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3742 thiss!1248))) key!828))))

(declare-fun b!182991 () Bool)

(declare-fun Unit!5542 () Unit!5540)

(assert (=> b!182991 (= e!120470 Unit!5542)))

(declare-fun b!182992 () Bool)

(assert (=> b!182992 (= e!120469 (isDefined!167 (getValueByKey!214 (toList!1179 (getCurrentListMap!827 (_keys!5657 thiss!1248) (_values!3725 thiss!1248) (mask!8795 thiss!1248) (extraKeys!3479 thiss!1248) (zeroValue!3583 thiss!1248) (minValue!3583 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3742 thiss!1248))) key!828)))))

(assert (= (and d!54669 c!32784) b!182990))

(assert (= (and d!54669 (not c!32784)) b!182991))

(assert (= (and d!54669 (not res!86640)) b!182992))

(declare-fun m!210599 () Bool)

(assert (=> d!54669 m!210599))

(declare-fun m!210601 () Bool)

(assert (=> b!182990 m!210601))

(declare-fun m!210603 () Bool)

(assert (=> b!182990 m!210603))

(assert (=> b!182990 m!210603))

(declare-fun m!210605 () Bool)

(assert (=> b!182990 m!210605))

(assert (=> b!182992 m!210603))

(assert (=> b!182992 m!210603))

(assert (=> b!182992 m!210605))

(assert (=> b!182927 d!54669))

(declare-fun bm!18472 () Bool)

(declare-fun call!18477 () Bool)

(declare-fun lt!90491 () ListLongMap!2327)

(assert (=> bm!18472 (= call!18477 (contains!1264 lt!90491 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!183035 () Bool)

(declare-fun e!120501 () Bool)

(declare-fun apply!157 (ListLongMap!2327 (_ BitVec 64)) V!5363)

(assert (=> b!183035 (= e!120501 (= (apply!157 lt!90491 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3583 thiss!1248)))))

(declare-fun bm!18473 () Bool)

(declare-fun call!18476 () ListLongMap!2327)

(declare-fun call!18478 () ListLongMap!2327)

(assert (=> bm!18473 (= call!18476 call!18478)))

(declare-fun b!183036 () Bool)

(declare-fun c!32799 () Bool)

(assert (=> b!183036 (= c!32799 (and (not (= (bvand (extraKeys!3479 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3479 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!120509 () ListLongMap!2327)

(declare-fun e!120499 () ListLongMap!2327)

(assert (=> b!183036 (= e!120509 e!120499)))

(declare-fun b!183037 () Bool)

(declare-fun e!120505 () Bool)

(assert (=> b!183037 (= e!120505 (validKeyInArray!0 (select (arr!3671 (_keys!5657 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183038 () Bool)

(declare-fun e!120497 () Bool)

(declare-fun call!18481 () Bool)

(assert (=> b!183038 (= e!120497 (not call!18481))))

(declare-fun b!183039 () Bool)

(declare-fun res!86665 () Bool)

(declare-fun e!120507 () Bool)

(assert (=> b!183039 (=> (not res!86665) (not e!120507))))

(declare-fun e!120506 () Bool)

(assert (=> b!183039 (= res!86665 e!120506)))

(declare-fun res!86667 () Bool)

(assert (=> b!183039 (=> res!86667 e!120506)))

(declare-fun e!120500 () Bool)

(assert (=> b!183039 (= res!86667 (not e!120500))))

(declare-fun res!86662 () Bool)

(assert (=> b!183039 (=> (not res!86662) (not e!120500))))

(assert (=> b!183039 (= res!86662 (bvslt #b00000000000000000000000000000000 (size!3983 (_keys!5657 thiss!1248))))))

(declare-fun b!183040 () Bool)

(declare-fun call!18480 () ListLongMap!2327)

(assert (=> b!183040 (= e!120499 call!18480)))

(declare-fun bm!18474 () Bool)

(declare-fun call!18479 () ListLongMap!2327)

(assert (=> bm!18474 (= call!18480 call!18479)))

(declare-fun b!183042 () Bool)

(declare-fun e!120508 () Bool)

(assert (=> b!183042 (= e!120508 (= (apply!157 lt!90491 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3583 thiss!1248)))))

(declare-fun bm!18475 () Bool)

(assert (=> bm!18475 (= call!18481 (contains!1264 lt!90491 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!183043 () Bool)

(declare-fun e!120504 () Bool)

(assert (=> b!183043 (= e!120504 (not call!18477))))

(declare-fun b!183044 () Bool)

(assert (=> b!183044 (= e!120509 call!18480)))

(declare-fun b!183045 () Bool)

(assert (=> b!183045 (= e!120497 e!120508)))

(declare-fun res!86660 () Bool)

(assert (=> b!183045 (= res!86660 call!18481)))

(assert (=> b!183045 (=> (not res!86660) (not e!120508))))

(declare-fun b!183046 () Bool)

(declare-fun e!120502 () Bool)

(declare-fun get!2102 (ValueCell!1800 V!5363) V!5363)

(declare-fun dynLambda!500 (Int (_ BitVec 64)) V!5363)

(assert (=> b!183046 (= e!120502 (= (apply!157 lt!90491 (select (arr!3671 (_keys!5657 thiss!1248)) #b00000000000000000000000000000000)) (get!2102 (select (arr!3672 (_values!3725 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!500 (defaultEntry!3742 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!183046 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3984 (_values!3725 thiss!1248))))))

(assert (=> b!183046 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3983 (_keys!5657 thiss!1248))))))

(declare-fun bm!18476 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!190 (array!7763 array!7765 (_ BitVec 32) (_ BitVec 32) V!5363 V!5363 (_ BitVec 32) Int) ListLongMap!2327)

(assert (=> bm!18476 (= call!18478 (getCurrentListMapNoExtraKeys!190 (_keys!5657 thiss!1248) (_values!3725 thiss!1248) (mask!8795 thiss!1248) (extraKeys!3479 thiss!1248) (zeroValue!3583 thiss!1248) (minValue!3583 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3742 thiss!1248)))))

(declare-fun b!183047 () Bool)

(assert (=> b!183047 (= e!120504 e!120501)))

(declare-fun res!86664 () Bool)

(assert (=> b!183047 (= res!86664 call!18477)))

(assert (=> b!183047 (=> (not res!86664) (not e!120501))))

(declare-fun b!183048 () Bool)

(assert (=> b!183048 (= e!120500 (validKeyInArray!0 (select (arr!3671 (_keys!5657 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183049 () Bool)

(assert (=> b!183049 (= e!120507 e!120504)))

(declare-fun c!32801 () Bool)

(assert (=> b!183049 (= c!32801 (not (= (bvand (extraKeys!3479 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!183050 () Bool)

(declare-fun e!120498 () ListLongMap!2327)

(assert (=> b!183050 (= e!120498 e!120509)))

(declare-fun c!32802 () Bool)

(assert (=> b!183050 (= c!32802 (and (not (= (bvand (extraKeys!3479 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3479 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!183051 () Bool)

(assert (=> b!183051 (= e!120506 e!120502)))

(declare-fun res!86666 () Bool)

(assert (=> b!183051 (=> (not res!86666) (not e!120502))))

(assert (=> b!183051 (= res!86666 (contains!1264 lt!90491 (select (arr!3671 (_keys!5657 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!183051 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3983 (_keys!5657 thiss!1248))))))

(declare-fun d!54671 () Bool)

(assert (=> d!54671 e!120507))

(declare-fun res!86661 () Bool)

(assert (=> d!54671 (=> (not res!86661) (not e!120507))))

(assert (=> d!54671 (= res!86661 (or (bvsge #b00000000000000000000000000000000 (size!3983 (_keys!5657 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3983 (_keys!5657 thiss!1248))))))))

(declare-fun lt!90486 () ListLongMap!2327)

(assert (=> d!54671 (= lt!90491 lt!90486)))

(declare-fun lt!90498 () Unit!5540)

(declare-fun e!120503 () Unit!5540)

(assert (=> d!54671 (= lt!90498 e!120503)))

(declare-fun c!32797 () Bool)

(assert (=> d!54671 (= c!32797 e!120505)))

(declare-fun res!86663 () Bool)

(assert (=> d!54671 (=> (not res!86663) (not e!120505))))

(assert (=> d!54671 (= res!86663 (bvslt #b00000000000000000000000000000000 (size!3983 (_keys!5657 thiss!1248))))))

(assert (=> d!54671 (= lt!90486 e!120498)))

(declare-fun c!32798 () Bool)

(assert (=> d!54671 (= c!32798 (and (not (= (bvand (extraKeys!3479 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3479 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54671 (validMask!0 (mask!8795 thiss!1248))))

(assert (=> d!54671 (= (getCurrentListMap!827 (_keys!5657 thiss!1248) (_values!3725 thiss!1248) (mask!8795 thiss!1248) (extraKeys!3479 thiss!1248) (zeroValue!3583 thiss!1248) (minValue!3583 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3742 thiss!1248)) lt!90491)))

(declare-fun b!183041 () Bool)

(declare-fun lt!90502 () Unit!5540)

(assert (=> b!183041 (= e!120503 lt!90502)))

(declare-fun lt!90499 () ListLongMap!2327)

(assert (=> b!183041 (= lt!90499 (getCurrentListMapNoExtraKeys!190 (_keys!5657 thiss!1248) (_values!3725 thiss!1248) (mask!8795 thiss!1248) (extraKeys!3479 thiss!1248) (zeroValue!3583 thiss!1248) (minValue!3583 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3742 thiss!1248)))))

(declare-fun lt!90497 () (_ BitVec 64))

(assert (=> b!183041 (= lt!90497 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90492 () (_ BitVec 64))

(assert (=> b!183041 (= lt!90492 (select (arr!3671 (_keys!5657 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90496 () Unit!5540)

(declare-fun addStillContains!133 (ListLongMap!2327 (_ BitVec 64) V!5363 (_ BitVec 64)) Unit!5540)

(assert (=> b!183041 (= lt!90496 (addStillContains!133 lt!90499 lt!90497 (zeroValue!3583 thiss!1248) lt!90492))))

(declare-fun +!277 (ListLongMap!2327 tuple2!3410) ListLongMap!2327)

(assert (=> b!183041 (contains!1264 (+!277 lt!90499 (tuple2!3411 lt!90497 (zeroValue!3583 thiss!1248))) lt!90492)))

(declare-fun lt!90483 () Unit!5540)

(assert (=> b!183041 (= lt!90483 lt!90496)))

(declare-fun lt!90493 () ListLongMap!2327)

(assert (=> b!183041 (= lt!90493 (getCurrentListMapNoExtraKeys!190 (_keys!5657 thiss!1248) (_values!3725 thiss!1248) (mask!8795 thiss!1248) (extraKeys!3479 thiss!1248) (zeroValue!3583 thiss!1248) (minValue!3583 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3742 thiss!1248)))))

(declare-fun lt!90490 () (_ BitVec 64))

(assert (=> b!183041 (= lt!90490 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90500 () (_ BitVec 64))

(assert (=> b!183041 (= lt!90500 (select (arr!3671 (_keys!5657 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90488 () Unit!5540)

(declare-fun addApplyDifferent!133 (ListLongMap!2327 (_ BitVec 64) V!5363 (_ BitVec 64)) Unit!5540)

(assert (=> b!183041 (= lt!90488 (addApplyDifferent!133 lt!90493 lt!90490 (minValue!3583 thiss!1248) lt!90500))))

(assert (=> b!183041 (= (apply!157 (+!277 lt!90493 (tuple2!3411 lt!90490 (minValue!3583 thiss!1248))) lt!90500) (apply!157 lt!90493 lt!90500))))

(declare-fun lt!90489 () Unit!5540)

(assert (=> b!183041 (= lt!90489 lt!90488)))

(declare-fun lt!90487 () ListLongMap!2327)

(assert (=> b!183041 (= lt!90487 (getCurrentListMapNoExtraKeys!190 (_keys!5657 thiss!1248) (_values!3725 thiss!1248) (mask!8795 thiss!1248) (extraKeys!3479 thiss!1248) (zeroValue!3583 thiss!1248) (minValue!3583 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3742 thiss!1248)))))

(declare-fun lt!90494 () (_ BitVec 64))

(assert (=> b!183041 (= lt!90494 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90485 () (_ BitVec 64))

(assert (=> b!183041 (= lt!90485 (select (arr!3671 (_keys!5657 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90501 () Unit!5540)

(assert (=> b!183041 (= lt!90501 (addApplyDifferent!133 lt!90487 lt!90494 (zeroValue!3583 thiss!1248) lt!90485))))

(assert (=> b!183041 (= (apply!157 (+!277 lt!90487 (tuple2!3411 lt!90494 (zeroValue!3583 thiss!1248))) lt!90485) (apply!157 lt!90487 lt!90485))))

(declare-fun lt!90481 () Unit!5540)

(assert (=> b!183041 (= lt!90481 lt!90501)))

(declare-fun lt!90484 () ListLongMap!2327)

(assert (=> b!183041 (= lt!90484 (getCurrentListMapNoExtraKeys!190 (_keys!5657 thiss!1248) (_values!3725 thiss!1248) (mask!8795 thiss!1248) (extraKeys!3479 thiss!1248) (zeroValue!3583 thiss!1248) (minValue!3583 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3742 thiss!1248)))))

(declare-fun lt!90482 () (_ BitVec 64))

(assert (=> b!183041 (= lt!90482 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90495 () (_ BitVec 64))

(assert (=> b!183041 (= lt!90495 (select (arr!3671 (_keys!5657 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!183041 (= lt!90502 (addApplyDifferent!133 lt!90484 lt!90482 (minValue!3583 thiss!1248) lt!90495))))

(assert (=> b!183041 (= (apply!157 (+!277 lt!90484 (tuple2!3411 lt!90482 (minValue!3583 thiss!1248))) lt!90495) (apply!157 lt!90484 lt!90495))))

(declare-fun call!18475 () ListLongMap!2327)

(declare-fun bm!18477 () Bool)

(assert (=> bm!18477 (= call!18479 (+!277 (ite c!32798 call!18478 (ite c!32802 call!18476 call!18475)) (ite (or c!32798 c!32802) (tuple2!3411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3583 thiss!1248)) (tuple2!3411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3583 thiss!1248)))))))

(declare-fun b!183052 () Bool)

(declare-fun res!86659 () Bool)

(assert (=> b!183052 (=> (not res!86659) (not e!120507))))

(assert (=> b!183052 (= res!86659 e!120497)))

(declare-fun c!32800 () Bool)

(assert (=> b!183052 (= c!32800 (not (= (bvand (extraKeys!3479 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!183053 () Bool)

(assert (=> b!183053 (= e!120498 (+!277 call!18479 (tuple2!3411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3583 thiss!1248))))))

(declare-fun bm!18478 () Bool)

(assert (=> bm!18478 (= call!18475 call!18476)))

(declare-fun b!183054 () Bool)

(assert (=> b!183054 (= e!120499 call!18475)))

(declare-fun b!183055 () Bool)

(declare-fun Unit!5543 () Unit!5540)

(assert (=> b!183055 (= e!120503 Unit!5543)))

(assert (= (and d!54671 c!32798) b!183053))

(assert (= (and d!54671 (not c!32798)) b!183050))

(assert (= (and b!183050 c!32802) b!183044))

(assert (= (and b!183050 (not c!32802)) b!183036))

(assert (= (and b!183036 c!32799) b!183040))

(assert (= (and b!183036 (not c!32799)) b!183054))

(assert (= (or b!183040 b!183054) bm!18478))

(assert (= (or b!183044 bm!18478) bm!18473))

(assert (= (or b!183044 b!183040) bm!18474))

(assert (= (or b!183053 bm!18473) bm!18476))

(assert (= (or b!183053 bm!18474) bm!18477))

(assert (= (and d!54671 res!86663) b!183037))

(assert (= (and d!54671 c!32797) b!183041))

(assert (= (and d!54671 (not c!32797)) b!183055))

(assert (= (and d!54671 res!86661) b!183039))

(assert (= (and b!183039 res!86662) b!183048))

(assert (= (and b!183039 (not res!86667)) b!183051))

(assert (= (and b!183051 res!86666) b!183046))

(assert (= (and b!183039 res!86665) b!183052))

(assert (= (and b!183052 c!32800) b!183045))

(assert (= (and b!183052 (not c!32800)) b!183038))

(assert (= (and b!183045 res!86660) b!183042))

(assert (= (or b!183045 b!183038) bm!18475))

(assert (= (and b!183052 res!86659) b!183049))

(assert (= (and b!183049 c!32801) b!183047))

(assert (= (and b!183049 (not c!32801)) b!183043))

(assert (= (and b!183047 res!86664) b!183035))

(assert (= (or b!183047 b!183043) bm!18472))

(declare-fun b_lambda!7183 () Bool)

(assert (=> (not b_lambda!7183) (not b!183046)))

(declare-fun t!7198 () Bool)

(declare-fun tb!2825 () Bool)

(assert (=> (and b!182933 (= (defaultEntry!3742 thiss!1248) (defaultEntry!3742 thiss!1248)) t!7198) tb!2825))

(declare-fun result!4753 () Bool)

(assert (=> tb!2825 (= result!4753 tp_is_empty!4287)))

(assert (=> b!183046 t!7198))

(declare-fun b_and!11085 () Bool)

(assert (= b_and!11081 (and (=> t!7198 result!4753) b_and!11085)))

(declare-fun m!210607 () Bool)

(assert (=> b!183051 m!210607))

(assert (=> b!183051 m!210607))

(declare-fun m!210609 () Bool)

(assert (=> b!183051 m!210609))

(assert (=> b!183048 m!210607))

(assert (=> b!183048 m!210607))

(declare-fun m!210611 () Bool)

(assert (=> b!183048 m!210611))

(assert (=> b!183037 m!210607))

(assert (=> b!183037 m!210607))

(assert (=> b!183037 m!210611))

(declare-fun m!210613 () Bool)

(assert (=> bm!18475 m!210613))

(declare-fun m!210615 () Bool)

(assert (=> b!183035 m!210615))

(declare-fun m!210617 () Bool)

(assert (=> b!183042 m!210617))

(assert (=> d!54671 m!210551))

(declare-fun m!210619 () Bool)

(assert (=> bm!18472 m!210619))

(declare-fun m!210621 () Bool)

(assert (=> b!183053 m!210621))

(declare-fun m!210623 () Bool)

(assert (=> bm!18477 m!210623))

(declare-fun m!210625 () Bool)

(assert (=> b!183041 m!210625))

(declare-fun m!210627 () Bool)

(assert (=> b!183041 m!210627))

(declare-fun m!210629 () Bool)

(assert (=> b!183041 m!210629))

(declare-fun m!210631 () Bool)

(assert (=> b!183041 m!210631))

(declare-fun m!210633 () Bool)

(assert (=> b!183041 m!210633))

(declare-fun m!210635 () Bool)

(assert (=> b!183041 m!210635))

(declare-fun m!210637 () Bool)

(assert (=> b!183041 m!210637))

(declare-fun m!210639 () Bool)

(assert (=> b!183041 m!210639))

(declare-fun m!210641 () Bool)

(assert (=> b!183041 m!210641))

(declare-fun m!210643 () Bool)

(assert (=> b!183041 m!210643))

(assert (=> b!183041 m!210639))

(declare-fun m!210645 () Bool)

(assert (=> b!183041 m!210645))

(assert (=> b!183041 m!210607))

(declare-fun m!210647 () Bool)

(assert (=> b!183041 m!210647))

(declare-fun m!210649 () Bool)

(assert (=> b!183041 m!210649))

(assert (=> b!183041 m!210643))

(declare-fun m!210651 () Bool)

(assert (=> b!183041 m!210651))

(assert (=> b!183041 m!210627))

(assert (=> b!183041 m!210635))

(declare-fun m!210653 () Bool)

(assert (=> b!183041 m!210653))

(declare-fun m!210655 () Bool)

(assert (=> b!183041 m!210655))

(assert (=> bm!18476 m!210625))

(declare-fun m!210657 () Bool)

(assert (=> b!183046 m!210657))

(declare-fun m!210659 () Bool)

(assert (=> b!183046 m!210659))

(assert (=> b!183046 m!210607))

(declare-fun m!210661 () Bool)

(assert (=> b!183046 m!210661))

(assert (=> b!183046 m!210607))

(assert (=> b!183046 m!210659))

(assert (=> b!183046 m!210657))

(declare-fun m!210663 () Bool)

(assert (=> b!183046 m!210663))

(assert (=> b!182927 d!54671))

(declare-fun b!183070 () Bool)

(declare-fun e!120518 () SeekEntryResult!614)

(declare-fun e!120517 () SeekEntryResult!614)

(assert (=> b!183070 (= e!120518 e!120517)))

(declare-fun lt!90510 () (_ BitVec 64))

(declare-fun lt!90509 () SeekEntryResult!614)

(assert (=> b!183070 (= lt!90510 (select (arr!3671 (_keys!5657 thiss!1248)) (index!4628 lt!90509)))))

(declare-fun c!32809 () Bool)

(assert (=> b!183070 (= c!32809 (= lt!90510 key!828))))

(declare-fun b!183071 () Bool)

(declare-fun c!32810 () Bool)

(assert (=> b!183071 (= c!32810 (= lt!90510 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!120516 () SeekEntryResult!614)

(assert (=> b!183071 (= e!120517 e!120516)))

(declare-fun b!183072 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7763 (_ BitVec 32)) SeekEntryResult!614)

(assert (=> b!183072 (= e!120516 (seekKeyOrZeroReturnVacant!0 (x!19932 lt!90509) (index!4628 lt!90509) (index!4628 lt!90509) key!828 (_keys!5657 thiss!1248) (mask!8795 thiss!1248)))))

(declare-fun d!54673 () Bool)

(declare-fun lt!90511 () SeekEntryResult!614)

(assert (=> d!54673 (and (or ((_ is Undefined!614) lt!90511) (not ((_ is Found!614) lt!90511)) (and (bvsge (index!4627 lt!90511) #b00000000000000000000000000000000) (bvslt (index!4627 lt!90511) (size!3983 (_keys!5657 thiss!1248))))) (or ((_ is Undefined!614) lt!90511) ((_ is Found!614) lt!90511) (not ((_ is MissingZero!614) lt!90511)) (and (bvsge (index!4626 lt!90511) #b00000000000000000000000000000000) (bvslt (index!4626 lt!90511) (size!3983 (_keys!5657 thiss!1248))))) (or ((_ is Undefined!614) lt!90511) ((_ is Found!614) lt!90511) ((_ is MissingZero!614) lt!90511) (not ((_ is MissingVacant!614) lt!90511)) (and (bvsge (index!4629 lt!90511) #b00000000000000000000000000000000) (bvslt (index!4629 lt!90511) (size!3983 (_keys!5657 thiss!1248))))) (or ((_ is Undefined!614) lt!90511) (ite ((_ is Found!614) lt!90511) (= (select (arr!3671 (_keys!5657 thiss!1248)) (index!4627 lt!90511)) key!828) (ite ((_ is MissingZero!614) lt!90511) (= (select (arr!3671 (_keys!5657 thiss!1248)) (index!4626 lt!90511)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!614) lt!90511) (= (select (arr!3671 (_keys!5657 thiss!1248)) (index!4629 lt!90511)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54673 (= lt!90511 e!120518)))

(declare-fun c!32811 () Bool)

(assert (=> d!54673 (= c!32811 (and ((_ is Intermediate!614) lt!90509) (undefined!1426 lt!90509)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7763 (_ BitVec 32)) SeekEntryResult!614)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54673 (= lt!90509 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8795 thiss!1248)) key!828 (_keys!5657 thiss!1248) (mask!8795 thiss!1248)))))

(assert (=> d!54673 (validMask!0 (mask!8795 thiss!1248))))

(assert (=> d!54673 (= (seekEntryOrOpen!0 key!828 (_keys!5657 thiss!1248) (mask!8795 thiss!1248)) lt!90511)))

(declare-fun b!183073 () Bool)

(assert (=> b!183073 (= e!120518 Undefined!614)))

(declare-fun b!183074 () Bool)

(assert (=> b!183074 (= e!120516 (MissingZero!614 (index!4628 lt!90509)))))

(declare-fun b!183075 () Bool)

(assert (=> b!183075 (= e!120517 (Found!614 (index!4628 lt!90509)))))

(assert (= (and d!54673 c!32811) b!183073))

(assert (= (and d!54673 (not c!32811)) b!183070))

(assert (= (and b!183070 c!32809) b!183075))

(assert (= (and b!183070 (not c!32809)) b!183071))

(assert (= (and b!183071 c!32810) b!183074))

(assert (= (and b!183071 (not c!32810)) b!183072))

(declare-fun m!210665 () Bool)

(assert (=> b!183070 m!210665))

(declare-fun m!210667 () Bool)

(assert (=> b!183072 m!210667))

(declare-fun m!210669 () Bool)

(assert (=> d!54673 m!210669))

(assert (=> d!54673 m!210551))

(declare-fun m!210671 () Bool)

(assert (=> d!54673 m!210671))

(declare-fun m!210673 () Bool)

(assert (=> d!54673 m!210673))

(declare-fun m!210675 () Bool)

(assert (=> d!54673 m!210675))

(declare-fun m!210677 () Bool)

(assert (=> d!54673 m!210677))

(assert (=> d!54673 m!210675))

(assert (=> b!182935 d!54673))

(declare-fun b!183086 () Bool)

(declare-fun e!120527 () Bool)

(declare-fun call!18484 () Bool)

(assert (=> b!183086 (= e!120527 call!18484)))

(declare-fun b!183087 () Bool)

(declare-fun e!120528 () Bool)

(declare-fun e!120530 () Bool)

(assert (=> b!183087 (= e!120528 e!120530)))

(declare-fun res!86676 () Bool)

(assert (=> b!183087 (=> (not res!86676) (not e!120530))))

(declare-fun e!120529 () Bool)

(assert (=> b!183087 (= res!86676 (not e!120529))))

(declare-fun res!86674 () Bool)

(assert (=> b!183087 (=> (not res!86674) (not e!120529))))

(assert (=> b!183087 (= res!86674 (validKeyInArray!0 (select (arr!3671 (_keys!5657 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!54675 () Bool)

(declare-fun res!86675 () Bool)

(assert (=> d!54675 (=> res!86675 e!120528)))

(assert (=> d!54675 (= res!86675 (bvsge #b00000000000000000000000000000000 (size!3983 (_keys!5657 thiss!1248))))))

(assert (=> d!54675 (= (arrayNoDuplicates!0 (_keys!5657 thiss!1248) #b00000000000000000000000000000000 Nil!2327) e!120528)))

(declare-fun bm!18481 () Bool)

(declare-fun c!32814 () Bool)

(assert (=> bm!18481 (= call!18484 (arrayNoDuplicates!0 (_keys!5657 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!32814 (Cons!2326 (select (arr!3671 (_keys!5657 thiss!1248)) #b00000000000000000000000000000000) Nil!2327) Nil!2327)))))

(declare-fun b!183088 () Bool)

(declare-fun contains!1266 (List!2330 (_ BitVec 64)) Bool)

(assert (=> b!183088 (= e!120529 (contains!1266 Nil!2327 (select (arr!3671 (_keys!5657 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183089 () Bool)

(assert (=> b!183089 (= e!120530 e!120527)))

(assert (=> b!183089 (= c!32814 (validKeyInArray!0 (select (arr!3671 (_keys!5657 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183090 () Bool)

(assert (=> b!183090 (= e!120527 call!18484)))

(assert (= (and d!54675 (not res!86675)) b!183087))

(assert (= (and b!183087 res!86674) b!183088))

(assert (= (and b!183087 res!86676) b!183089))

(assert (= (and b!183089 c!32814) b!183086))

(assert (= (and b!183089 (not c!32814)) b!183090))

(assert (= (or b!183086 b!183090) bm!18481))

(assert (=> b!183087 m!210607))

(assert (=> b!183087 m!210607))

(assert (=> b!183087 m!210611))

(assert (=> bm!18481 m!210607))

(declare-fun m!210679 () Bool)

(assert (=> bm!18481 m!210679))

(assert (=> b!183088 m!210607))

(assert (=> b!183088 m!210607))

(declare-fun m!210681 () Bool)

(assert (=> b!183088 m!210681))

(assert (=> b!183089 m!210607))

(assert (=> b!183089 m!210607))

(assert (=> b!183089 m!210611))

(assert (=> b!182931 d!54675))

(declare-fun d!54677 () Bool)

(declare-fun res!86681 () Bool)

(declare-fun e!120538 () Bool)

(assert (=> d!54677 (=> res!86681 e!120538)))

(assert (=> d!54677 (= res!86681 (bvsge #b00000000000000000000000000000000 (size!3983 (_keys!5657 thiss!1248))))))

(assert (=> d!54677 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5657 thiss!1248) (mask!8795 thiss!1248)) e!120538)))

(declare-fun b!183099 () Bool)

(declare-fun e!120539 () Bool)

(declare-fun e!120537 () Bool)

(assert (=> b!183099 (= e!120539 e!120537)))

(declare-fun lt!90520 () (_ BitVec 64))

(assert (=> b!183099 (= lt!90520 (select (arr!3671 (_keys!5657 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90518 () Unit!5540)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7763 (_ BitVec 64) (_ BitVec 32)) Unit!5540)

(assert (=> b!183099 (= lt!90518 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5657 thiss!1248) lt!90520 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7763 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!183099 (arrayContainsKey!0 (_keys!5657 thiss!1248) lt!90520 #b00000000000000000000000000000000)))

(declare-fun lt!90519 () Unit!5540)

(assert (=> b!183099 (= lt!90519 lt!90518)))

(declare-fun res!86682 () Bool)

(assert (=> b!183099 (= res!86682 (= (seekEntryOrOpen!0 (select (arr!3671 (_keys!5657 thiss!1248)) #b00000000000000000000000000000000) (_keys!5657 thiss!1248) (mask!8795 thiss!1248)) (Found!614 #b00000000000000000000000000000000)))))

(assert (=> b!183099 (=> (not res!86682) (not e!120537))))

(declare-fun b!183100 () Bool)

(declare-fun call!18487 () Bool)

(assert (=> b!183100 (= e!120539 call!18487)))

(declare-fun bm!18484 () Bool)

(assert (=> bm!18484 (= call!18487 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5657 thiss!1248) (mask!8795 thiss!1248)))))

(declare-fun b!183101 () Bool)

(assert (=> b!183101 (= e!120538 e!120539)))

(declare-fun c!32817 () Bool)

(assert (=> b!183101 (= c!32817 (validKeyInArray!0 (select (arr!3671 (_keys!5657 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!183102 () Bool)

(assert (=> b!183102 (= e!120537 call!18487)))

(assert (= (and d!54677 (not res!86681)) b!183101))

(assert (= (and b!183101 c!32817) b!183099))

(assert (= (and b!183101 (not c!32817)) b!183100))

(assert (= (and b!183099 res!86682) b!183102))

(assert (= (or b!183102 b!183100) bm!18484))

(assert (=> b!183099 m!210607))

(declare-fun m!210683 () Bool)

(assert (=> b!183099 m!210683))

(declare-fun m!210685 () Bool)

(assert (=> b!183099 m!210685))

(assert (=> b!183099 m!210607))

(declare-fun m!210687 () Bool)

(assert (=> b!183099 m!210687))

(declare-fun m!210689 () Bool)

(assert (=> bm!18484 m!210689))

(assert (=> b!183101 m!210607))

(assert (=> b!183101 m!210607))

(assert (=> b!183101 m!210611))

(assert (=> b!182937 d!54677))

(declare-fun d!54679 () Bool)

(assert (=> d!54679 (= (array_inv!2373 (_keys!5657 thiss!1248)) (bvsge (size!3983 (_keys!5657 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!182933 d!54679))

(declare-fun d!54681 () Bool)

(assert (=> d!54681 (= (array_inv!2374 (_values!3725 thiss!1248)) (bvsge (size!3984 (_values!3725 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!182933 d!54681))

(declare-fun d!54683 () Bool)

(assert (=> d!54683 (= (validMask!0 (mask!8795 thiss!1248)) (and (or (= (mask!8795 thiss!1248) #b00000000000000000000000000000111) (= (mask!8795 thiss!1248) #b00000000000000000000000000001111) (= (mask!8795 thiss!1248) #b00000000000000000000000000011111) (= (mask!8795 thiss!1248) #b00000000000000000000000000111111) (= (mask!8795 thiss!1248) #b00000000000000000000000001111111) (= (mask!8795 thiss!1248) #b00000000000000000000000011111111) (= (mask!8795 thiss!1248) #b00000000000000000000000111111111) (= (mask!8795 thiss!1248) #b00000000000000000000001111111111) (= (mask!8795 thiss!1248) #b00000000000000000000011111111111) (= (mask!8795 thiss!1248) #b00000000000000000000111111111111) (= (mask!8795 thiss!1248) #b00000000000000000001111111111111) (= (mask!8795 thiss!1248) #b00000000000000000011111111111111) (= (mask!8795 thiss!1248) #b00000000000000000111111111111111) (= (mask!8795 thiss!1248) #b00000000000000001111111111111111) (= (mask!8795 thiss!1248) #b00000000000000011111111111111111) (= (mask!8795 thiss!1248) #b00000000000000111111111111111111) (= (mask!8795 thiss!1248) #b00000000000001111111111111111111) (= (mask!8795 thiss!1248) #b00000000000011111111111111111111) (= (mask!8795 thiss!1248) #b00000000000111111111111111111111) (= (mask!8795 thiss!1248) #b00000000001111111111111111111111) (= (mask!8795 thiss!1248) #b00000000011111111111111111111111) (= (mask!8795 thiss!1248) #b00000000111111111111111111111111) (= (mask!8795 thiss!1248) #b00000001111111111111111111111111) (= (mask!8795 thiss!1248) #b00000011111111111111111111111111) (= (mask!8795 thiss!1248) #b00000111111111111111111111111111) (= (mask!8795 thiss!1248) #b00001111111111111111111111111111) (= (mask!8795 thiss!1248) #b00011111111111111111111111111111) (= (mask!8795 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8795 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!182928 d!54683))

(declare-fun condMapEmpty!7364 () Bool)

(declare-fun mapDefault!7364 () ValueCell!1800)

(assert (=> mapNonEmpty!7358 (= condMapEmpty!7364 (= mapRest!7358 ((as const (Array (_ BitVec 32) ValueCell!1800)) mapDefault!7364)))))

(declare-fun e!120545 () Bool)

(declare-fun mapRes!7364 () Bool)

(assert (=> mapNonEmpty!7358 (= tp!16309 (and e!120545 mapRes!7364))))

(declare-fun b!183110 () Bool)

(assert (=> b!183110 (= e!120545 tp_is_empty!4287)))

(declare-fun mapIsEmpty!7364 () Bool)

(assert (=> mapIsEmpty!7364 mapRes!7364))

(declare-fun b!183109 () Bool)

(declare-fun e!120544 () Bool)

(assert (=> b!183109 (= e!120544 tp_is_empty!4287)))

(declare-fun mapNonEmpty!7364 () Bool)

(declare-fun tp!16319 () Bool)

(assert (=> mapNonEmpty!7364 (= mapRes!7364 (and tp!16319 e!120544))))

(declare-fun mapValue!7364 () ValueCell!1800)

(declare-fun mapRest!7364 () (Array (_ BitVec 32) ValueCell!1800))

(declare-fun mapKey!7364 () (_ BitVec 32))

(assert (=> mapNonEmpty!7364 (= mapRest!7358 (store mapRest!7364 mapKey!7364 mapValue!7364))))

(assert (= (and mapNonEmpty!7358 condMapEmpty!7364) mapIsEmpty!7364))

(assert (= (and mapNonEmpty!7358 (not condMapEmpty!7364)) mapNonEmpty!7364))

(assert (= (and mapNonEmpty!7364 ((_ is ValueCellFull!1800) mapValue!7364)) b!183109))

(assert (= (and mapNonEmpty!7358 ((_ is ValueCellFull!1800) mapDefault!7364)) b!183110))

(declare-fun m!210691 () Bool)

(assert (=> mapNonEmpty!7364 m!210691))

(declare-fun b_lambda!7185 () Bool)

(assert (= b_lambda!7183 (or (and b!182933 b_free!4515) b_lambda!7185)))

(check-sat tp_is_empty!4287 (not b!183048) (not b!183051) (not bm!18481) (not bm!18477) (not b!182990) (not bm!18476) (not b_lambda!7185) (not mapNonEmpty!7364) (not b!182992) (not b!183041) (not b!182983) (not b!182981) (not b!183072) (not bm!18475) (not d!54671) b_and!11085 (not b_next!4515) (not b!183035) (not b!182982) (not b!183087) (not b!183053) (not b!183089) (not b!183046) (not bm!18484) (not d!54669) (not b!183042) (not b!183037) (not d!54673) (not b!183088) (not d!54667) (not b!183101) (not bm!18472) (not b!183099))
(check-sat b_and!11085 (not b_next!4515))

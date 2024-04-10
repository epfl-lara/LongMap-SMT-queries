; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17882 () Bool)

(assert start!17882)

(declare-fun b!178405 () Bool)

(declare-fun b_free!4407 () Bool)

(declare-fun b_next!4407 () Bool)

(assert (=> b!178405 (= b_free!4407 (not b_next!4407))))

(declare-fun tp!15934 () Bool)

(declare-fun b_and!10923 () Bool)

(assert (=> b!178405 (= tp!15934 b_and!10923)))

(declare-fun b!178404 () Bool)

(declare-fun e!117598 () Bool)

(declare-datatypes ((V!5219 0))(
  ( (V!5220 (val!2134 Int)) )
))
(declare-datatypes ((ValueCell!1746 0))(
  ( (ValueCellFull!1746 (v!4018 V!5219)) (EmptyCell!1746) )
))
(declare-datatypes ((array!7517 0))(
  ( (array!7518 (arr!3563 (Array (_ BitVec 32) (_ BitVec 64))) (size!3869 (_ BitVec 32))) )
))
(declare-datatypes ((array!7519 0))(
  ( (array!7520 (arr!3564 (Array (_ BitVec 32) ValueCell!1746)) (size!3870 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2400 0))(
  ( (LongMapFixedSize!2401 (defaultEntry!3669 Int) (mask!8629 (_ BitVec 32)) (extraKeys!3406 (_ BitVec 32)) (zeroValue!3510 V!5219) (minValue!3510 V!5219) (_size!1249 (_ BitVec 32)) (_keys!5546 array!7517) (_values!3652 array!7519) (_vacant!1249 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2400)

(assert (=> b!178404 (= e!117598 (and (= (size!3870 (_values!3652 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8629 thiss!1248))) (= (size!3869 (_keys!5546 thiss!1248)) (size!3870 (_values!3652 thiss!1248))) (bvsge (mask!8629 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3406 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun e!117597 () Bool)

(declare-fun tp_is_empty!4179 () Bool)

(declare-fun e!117595 () Bool)

(declare-fun array_inv!2289 (array!7517) Bool)

(declare-fun array_inv!2290 (array!7519) Bool)

(assert (=> b!178405 (= e!117597 (and tp!15934 tp_is_empty!4179 (array_inv!2289 (_keys!5546 thiss!1248)) (array_inv!2290 (_values!3652 thiss!1248)) e!117595))))

(declare-fun b!178406 () Bool)

(declare-fun e!117599 () Bool)

(assert (=> b!178406 (= e!117599 tp_is_empty!4179)))

(declare-fun mapIsEmpty!7145 () Bool)

(declare-fun mapRes!7145 () Bool)

(assert (=> mapIsEmpty!7145 mapRes!7145))

(declare-fun b!178407 () Bool)

(declare-fun res!84524 () Bool)

(assert (=> b!178407 (=> (not res!84524) (not e!117598))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3318 0))(
  ( (tuple2!3319 (_1!1670 (_ BitVec 64)) (_2!1670 V!5219)) )
))
(declare-datatypes ((List!2264 0))(
  ( (Nil!2261) (Cons!2260 (h!2883 tuple2!3318) (t!7102 List!2264)) )
))
(declare-datatypes ((ListLongMap!2245 0))(
  ( (ListLongMap!2246 (toList!1138 List!2264)) )
))
(declare-fun contains!1208 (ListLongMap!2245 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!790 (array!7517 array!7519 (_ BitVec 32) (_ BitVec 32) V!5219 V!5219 (_ BitVec 32) Int) ListLongMap!2245)

(assert (=> b!178407 (= res!84524 (not (contains!1208 (getCurrentListMap!790 (_keys!5546 thiss!1248) (_values!3652 thiss!1248) (mask!8629 thiss!1248) (extraKeys!3406 thiss!1248) (zeroValue!3510 thiss!1248) (minValue!3510 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3669 thiss!1248)) key!828)))))

(declare-fun b!178408 () Bool)

(declare-fun res!84528 () Bool)

(assert (=> b!178408 (=> (not res!84528) (not e!117598))))

(assert (=> b!178408 (= res!84528 (not (= key!828 (bvneg key!828))))))

(declare-fun b!178409 () Bool)

(declare-fun res!84526 () Bool)

(assert (=> b!178409 (=> (not res!84526) (not e!117598))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!178409 (= res!84526 (validMask!0 (mask!8629 thiss!1248)))))

(declare-fun b!178410 () Bool)

(declare-fun e!117596 () Bool)

(assert (=> b!178410 (= e!117596 tp_is_empty!4179)))

(declare-fun mapNonEmpty!7145 () Bool)

(declare-fun tp!15935 () Bool)

(assert (=> mapNonEmpty!7145 (= mapRes!7145 (and tp!15935 e!117599))))

(declare-fun mapRest!7145 () (Array (_ BitVec 32) ValueCell!1746))

(declare-fun mapValue!7145 () ValueCell!1746)

(declare-fun mapKey!7145 () (_ BitVec 32))

(assert (=> mapNonEmpty!7145 (= (arr!3564 (_values!3652 thiss!1248)) (store mapRest!7145 mapKey!7145 mapValue!7145))))

(declare-fun res!84525 () Bool)

(assert (=> start!17882 (=> (not res!84525) (not e!117598))))

(declare-fun valid!1005 (LongMapFixedSize!2400) Bool)

(assert (=> start!17882 (= res!84525 (valid!1005 thiss!1248))))

(assert (=> start!17882 e!117598))

(assert (=> start!17882 e!117597))

(assert (=> start!17882 true))

(declare-fun b!178411 () Bool)

(assert (=> b!178411 (= e!117595 (and e!117596 mapRes!7145))))

(declare-fun condMapEmpty!7145 () Bool)

(declare-fun mapDefault!7145 () ValueCell!1746)

(assert (=> b!178411 (= condMapEmpty!7145 (= (arr!3564 (_values!3652 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1746)) mapDefault!7145)))))

(declare-fun b!178412 () Bool)

(declare-fun res!84527 () Bool)

(assert (=> b!178412 (=> (not res!84527) (not e!117598))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!575 0))(
  ( (MissingZero!575 (index!4468 (_ BitVec 32))) (Found!575 (index!4469 (_ BitVec 32))) (Intermediate!575 (undefined!1387 Bool) (index!4470 (_ BitVec 32)) (x!19543 (_ BitVec 32))) (Undefined!575) (MissingVacant!575 (index!4471 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7517 (_ BitVec 32)) SeekEntryResult!575)

(assert (=> b!178412 (= res!84527 ((_ is Undefined!575) (seekEntryOrOpen!0 key!828 (_keys!5546 thiss!1248) (mask!8629 thiss!1248))))))

(assert (= (and start!17882 res!84525) b!178408))

(assert (= (and b!178408 res!84528) b!178412))

(assert (= (and b!178412 res!84527) b!178407))

(assert (= (and b!178407 res!84524) b!178409))

(assert (= (and b!178409 res!84526) b!178404))

(assert (= (and b!178411 condMapEmpty!7145) mapIsEmpty!7145))

(assert (= (and b!178411 (not condMapEmpty!7145)) mapNonEmpty!7145))

(assert (= (and mapNonEmpty!7145 ((_ is ValueCellFull!1746) mapValue!7145)) b!178406))

(assert (= (and b!178411 ((_ is ValueCellFull!1746) mapDefault!7145)) b!178410))

(assert (= b!178405 b!178411))

(assert (= start!17882 b!178405))

(declare-fun m!206797 () Bool)

(assert (=> mapNonEmpty!7145 m!206797))

(declare-fun m!206799 () Bool)

(assert (=> b!178412 m!206799))

(declare-fun m!206801 () Bool)

(assert (=> b!178409 m!206801))

(declare-fun m!206803 () Bool)

(assert (=> b!178407 m!206803))

(assert (=> b!178407 m!206803))

(declare-fun m!206805 () Bool)

(assert (=> b!178407 m!206805))

(declare-fun m!206807 () Bool)

(assert (=> start!17882 m!206807))

(declare-fun m!206809 () Bool)

(assert (=> b!178405 m!206809))

(declare-fun m!206811 () Bool)

(assert (=> b!178405 m!206811))

(check-sat b_and!10923 (not b!178405) (not mapNonEmpty!7145) tp_is_empty!4179 (not start!17882) (not b!178412) (not b!178407) (not b_next!4407) (not b!178409))
(check-sat b_and!10923 (not b_next!4407))
(get-model)

(declare-fun d!53945 () Bool)

(declare-fun res!84550 () Bool)

(declare-fun e!117621 () Bool)

(assert (=> d!53945 (=> (not res!84550) (not e!117621))))

(declare-fun simpleValid!158 (LongMapFixedSize!2400) Bool)

(assert (=> d!53945 (= res!84550 (simpleValid!158 thiss!1248))))

(assert (=> d!53945 (= (valid!1005 thiss!1248) e!117621)))

(declare-fun b!178446 () Bool)

(declare-fun res!84551 () Bool)

(assert (=> b!178446 (=> (not res!84551) (not e!117621))))

(declare-fun arrayCountValidKeys!0 (array!7517 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!178446 (= res!84551 (= (arrayCountValidKeys!0 (_keys!5546 thiss!1248) #b00000000000000000000000000000000 (size!3869 (_keys!5546 thiss!1248))) (_size!1249 thiss!1248)))))

(declare-fun b!178447 () Bool)

(declare-fun res!84552 () Bool)

(assert (=> b!178447 (=> (not res!84552) (not e!117621))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7517 (_ BitVec 32)) Bool)

(assert (=> b!178447 (= res!84552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5546 thiss!1248) (mask!8629 thiss!1248)))))

(declare-fun b!178448 () Bool)

(declare-datatypes ((List!2265 0))(
  ( (Nil!2262) (Cons!2261 (h!2884 (_ BitVec 64)) (t!7105 List!2265)) )
))
(declare-fun arrayNoDuplicates!0 (array!7517 (_ BitVec 32) List!2265) Bool)

(assert (=> b!178448 (= e!117621 (arrayNoDuplicates!0 (_keys!5546 thiss!1248) #b00000000000000000000000000000000 Nil!2262))))

(assert (= (and d!53945 res!84550) b!178446))

(assert (= (and b!178446 res!84551) b!178447))

(assert (= (and b!178447 res!84552) b!178448))

(declare-fun m!206829 () Bool)

(assert (=> d!53945 m!206829))

(declare-fun m!206831 () Bool)

(assert (=> b!178446 m!206831))

(declare-fun m!206833 () Bool)

(assert (=> b!178447 m!206833))

(declare-fun m!206835 () Bool)

(assert (=> b!178448 m!206835))

(assert (=> start!17882 d!53945))

(declare-fun d!53947 () Bool)

(assert (=> d!53947 (= (validMask!0 (mask!8629 thiss!1248)) (and (or (= (mask!8629 thiss!1248) #b00000000000000000000000000000111) (= (mask!8629 thiss!1248) #b00000000000000000000000000001111) (= (mask!8629 thiss!1248) #b00000000000000000000000000011111) (= (mask!8629 thiss!1248) #b00000000000000000000000000111111) (= (mask!8629 thiss!1248) #b00000000000000000000000001111111) (= (mask!8629 thiss!1248) #b00000000000000000000000011111111) (= (mask!8629 thiss!1248) #b00000000000000000000000111111111) (= (mask!8629 thiss!1248) #b00000000000000000000001111111111) (= (mask!8629 thiss!1248) #b00000000000000000000011111111111) (= (mask!8629 thiss!1248) #b00000000000000000000111111111111) (= (mask!8629 thiss!1248) #b00000000000000000001111111111111) (= (mask!8629 thiss!1248) #b00000000000000000011111111111111) (= (mask!8629 thiss!1248) #b00000000000000000111111111111111) (= (mask!8629 thiss!1248) #b00000000000000001111111111111111) (= (mask!8629 thiss!1248) #b00000000000000011111111111111111) (= (mask!8629 thiss!1248) #b00000000000000111111111111111111) (= (mask!8629 thiss!1248) #b00000000000001111111111111111111) (= (mask!8629 thiss!1248) #b00000000000011111111111111111111) (= (mask!8629 thiss!1248) #b00000000000111111111111111111111) (= (mask!8629 thiss!1248) #b00000000001111111111111111111111) (= (mask!8629 thiss!1248) #b00000000011111111111111111111111) (= (mask!8629 thiss!1248) #b00000000111111111111111111111111) (= (mask!8629 thiss!1248) #b00000001111111111111111111111111) (= (mask!8629 thiss!1248) #b00000011111111111111111111111111) (= (mask!8629 thiss!1248) #b00000111111111111111111111111111) (= (mask!8629 thiss!1248) #b00001111111111111111111111111111) (= (mask!8629 thiss!1248) #b00011111111111111111111111111111) (= (mask!8629 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8629 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!178409 d!53947))

(declare-fun d!53949 () Bool)

(assert (=> d!53949 (= (array_inv!2289 (_keys!5546 thiss!1248)) (bvsge (size!3869 (_keys!5546 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!178405 d!53949))

(declare-fun d!53951 () Bool)

(assert (=> d!53951 (= (array_inv!2290 (_values!3652 thiss!1248)) (bvsge (size!3870 (_values!3652 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!178405 d!53951))

(declare-fun d!53953 () Bool)

(declare-fun e!117626 () Bool)

(assert (=> d!53953 e!117626))

(declare-fun res!84555 () Bool)

(assert (=> d!53953 (=> res!84555 e!117626)))

(declare-fun lt!88162 () Bool)

(assert (=> d!53953 (= res!84555 (not lt!88162))))

(declare-fun lt!88163 () Bool)

(assert (=> d!53953 (= lt!88162 lt!88163)))

(declare-datatypes ((Unit!5444 0))(
  ( (Unit!5445) )
))
(declare-fun lt!88165 () Unit!5444)

(declare-fun e!117627 () Unit!5444)

(assert (=> d!53953 (= lt!88165 e!117627)))

(declare-fun c!31965 () Bool)

(assert (=> d!53953 (= c!31965 lt!88163)))

(declare-fun containsKey!203 (List!2264 (_ BitVec 64)) Bool)

(assert (=> d!53953 (= lt!88163 (containsKey!203 (toList!1138 (getCurrentListMap!790 (_keys!5546 thiss!1248) (_values!3652 thiss!1248) (mask!8629 thiss!1248) (extraKeys!3406 thiss!1248) (zeroValue!3510 thiss!1248) (minValue!3510 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3669 thiss!1248))) key!828))))

(assert (=> d!53953 (= (contains!1208 (getCurrentListMap!790 (_keys!5546 thiss!1248) (_values!3652 thiss!1248) (mask!8629 thiss!1248) (extraKeys!3406 thiss!1248) (zeroValue!3510 thiss!1248) (minValue!3510 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3669 thiss!1248)) key!828) lt!88162)))

(declare-fun b!178455 () Bool)

(declare-fun lt!88164 () Unit!5444)

(assert (=> b!178455 (= e!117627 lt!88164)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!151 (List!2264 (_ BitVec 64)) Unit!5444)

(assert (=> b!178455 (= lt!88164 (lemmaContainsKeyImpliesGetValueByKeyDefined!151 (toList!1138 (getCurrentListMap!790 (_keys!5546 thiss!1248) (_values!3652 thiss!1248) (mask!8629 thiss!1248) (extraKeys!3406 thiss!1248) (zeroValue!3510 thiss!1248) (minValue!3510 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3669 thiss!1248))) key!828))))

(declare-datatypes ((Option!205 0))(
  ( (Some!204 (v!4020 V!5219)) (None!203) )
))
(declare-fun isDefined!152 (Option!205) Bool)

(declare-fun getValueByKey!199 (List!2264 (_ BitVec 64)) Option!205)

(assert (=> b!178455 (isDefined!152 (getValueByKey!199 (toList!1138 (getCurrentListMap!790 (_keys!5546 thiss!1248) (_values!3652 thiss!1248) (mask!8629 thiss!1248) (extraKeys!3406 thiss!1248) (zeroValue!3510 thiss!1248) (minValue!3510 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3669 thiss!1248))) key!828))))

(declare-fun b!178456 () Bool)

(declare-fun Unit!5446 () Unit!5444)

(assert (=> b!178456 (= e!117627 Unit!5446)))

(declare-fun b!178457 () Bool)

(assert (=> b!178457 (= e!117626 (isDefined!152 (getValueByKey!199 (toList!1138 (getCurrentListMap!790 (_keys!5546 thiss!1248) (_values!3652 thiss!1248) (mask!8629 thiss!1248) (extraKeys!3406 thiss!1248) (zeroValue!3510 thiss!1248) (minValue!3510 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3669 thiss!1248))) key!828)))))

(assert (= (and d!53953 c!31965) b!178455))

(assert (= (and d!53953 (not c!31965)) b!178456))

(assert (= (and d!53953 (not res!84555)) b!178457))

(declare-fun m!206837 () Bool)

(assert (=> d!53953 m!206837))

(declare-fun m!206839 () Bool)

(assert (=> b!178455 m!206839))

(declare-fun m!206841 () Bool)

(assert (=> b!178455 m!206841))

(assert (=> b!178455 m!206841))

(declare-fun m!206843 () Bool)

(assert (=> b!178455 m!206843))

(assert (=> b!178457 m!206841))

(assert (=> b!178457 m!206841))

(assert (=> b!178457 m!206843))

(assert (=> b!178407 d!53953))

(declare-fun b!178500 () Bool)

(declare-fun e!117664 () Bool)

(declare-fun lt!88228 () ListLongMap!2245)

(declare-fun apply!144 (ListLongMap!2245 (_ BitVec 64)) V!5219)

(assert (=> b!178500 (= e!117664 (= (apply!144 lt!88228 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3510 thiss!1248)))))

(declare-fun bm!18043 () Bool)

(declare-fun call!18049 () ListLongMap!2245)

(declare-fun call!18050 () ListLongMap!2245)

(assert (=> bm!18043 (= call!18049 call!18050)))

(declare-fun bm!18044 () Bool)

(declare-fun call!18052 () Bool)

(assert (=> bm!18044 (= call!18052 (contains!1208 lt!88228 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!178501 () Bool)

(declare-fun e!117658 () Bool)

(declare-fun call!18047 () Bool)

(assert (=> b!178501 (= e!117658 (not call!18047))))

(declare-fun b!178502 () Bool)

(declare-fun e!117663 () ListLongMap!2245)

(assert (=> b!178502 (= e!117663 call!18049)))

(declare-fun d!53955 () Bool)

(declare-fun e!117654 () Bool)

(assert (=> d!53955 e!117654))

(declare-fun res!84574 () Bool)

(assert (=> d!53955 (=> (not res!84574) (not e!117654))))

(assert (=> d!53955 (= res!84574 (or (bvsge #b00000000000000000000000000000000 (size!3869 (_keys!5546 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3869 (_keys!5546 thiss!1248))))))))

(declare-fun lt!88222 () ListLongMap!2245)

(assert (=> d!53955 (= lt!88228 lt!88222)))

(declare-fun lt!88213 () Unit!5444)

(declare-fun e!117666 () Unit!5444)

(assert (=> d!53955 (= lt!88213 e!117666)))

(declare-fun c!31980 () Bool)

(declare-fun e!117656 () Bool)

(assert (=> d!53955 (= c!31980 e!117656)))

(declare-fun res!84578 () Bool)

(assert (=> d!53955 (=> (not res!84578) (not e!117656))))

(assert (=> d!53955 (= res!84578 (bvslt #b00000000000000000000000000000000 (size!3869 (_keys!5546 thiss!1248))))))

(declare-fun e!117665 () ListLongMap!2245)

(assert (=> d!53955 (= lt!88222 e!117665)))

(declare-fun c!31981 () Bool)

(assert (=> d!53955 (= c!31981 (and (not (= (bvand (extraKeys!3406 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3406 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!53955 (validMask!0 (mask!8629 thiss!1248))))

(assert (=> d!53955 (= (getCurrentListMap!790 (_keys!5546 thiss!1248) (_values!3652 thiss!1248) (mask!8629 thiss!1248) (extraKeys!3406 thiss!1248) (zeroValue!3510 thiss!1248) (minValue!3510 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3669 thiss!1248)) lt!88228)))

(declare-fun b!178503 () Bool)

(declare-fun e!117661 () Bool)

(assert (=> b!178503 (= e!117661 (not call!18052))))

(declare-fun b!178504 () Bool)

(declare-fun res!84575 () Bool)

(assert (=> b!178504 (=> (not res!84575) (not e!117654))))

(declare-fun e!117660 () Bool)

(assert (=> b!178504 (= res!84575 e!117660)))

(declare-fun res!84581 () Bool)

(assert (=> b!178504 (=> res!84581 e!117660)))

(declare-fun e!117662 () Bool)

(assert (=> b!178504 (= res!84581 (not e!117662))))

(declare-fun res!84577 () Bool)

(assert (=> b!178504 (=> (not res!84577) (not e!117662))))

(assert (=> b!178504 (= res!84577 (bvslt #b00000000000000000000000000000000 (size!3869 (_keys!5546 thiss!1248))))))

(declare-fun b!178505 () Bool)

(declare-fun e!117659 () Bool)

(assert (=> b!178505 (= e!117661 e!117659)))

(declare-fun res!84582 () Bool)

(assert (=> b!178505 (= res!84582 call!18052)))

(assert (=> b!178505 (=> (not res!84582) (not e!117659))))

(declare-fun b!178506 () Bool)

(declare-fun e!117655 () Bool)

(declare-fun get!2035 (ValueCell!1746 V!5219) V!5219)

(declare-fun dynLambda!487 (Int (_ BitVec 64)) V!5219)

(assert (=> b!178506 (= e!117655 (= (apply!144 lt!88228 (select (arr!3563 (_keys!5546 thiss!1248)) #b00000000000000000000000000000000)) (get!2035 (select (arr!3564 (_values!3652 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!487 (defaultEntry!3669 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!178506 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3870 (_values!3652 thiss!1248))))))

(assert (=> b!178506 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3869 (_keys!5546 thiss!1248))))))

(declare-fun bm!18045 () Bool)

(declare-fun call!18048 () ListLongMap!2245)

(declare-fun call!18051 () ListLongMap!2245)

(assert (=> bm!18045 (= call!18048 call!18051)))

(declare-fun b!178507 () Bool)

(assert (=> b!178507 (= e!117660 e!117655)))

(declare-fun res!84576 () Bool)

(assert (=> b!178507 (=> (not res!84576) (not e!117655))))

(assert (=> b!178507 (= res!84576 (contains!1208 lt!88228 (select (arr!3563 (_keys!5546 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!178507 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3869 (_keys!5546 thiss!1248))))))

(declare-fun bm!18046 () Bool)

(declare-fun call!18046 () ListLongMap!2245)

(declare-fun getCurrentListMapNoExtraKeys!177 (array!7517 array!7519 (_ BitVec 32) (_ BitVec 32) V!5219 V!5219 (_ BitVec 32) Int) ListLongMap!2245)

(assert (=> bm!18046 (= call!18046 (getCurrentListMapNoExtraKeys!177 (_keys!5546 thiss!1248) (_values!3652 thiss!1248) (mask!8629 thiss!1248) (extraKeys!3406 thiss!1248) (zeroValue!3510 thiss!1248) (minValue!3510 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3669 thiss!1248)))))

(declare-fun bm!18047 () Bool)

(assert (=> bm!18047 (= call!18047 (contains!1208 lt!88228 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!18048 () Bool)

(assert (=> bm!18048 (= call!18051 call!18046)))

(declare-fun b!178508 () Bool)

(declare-fun lt!88218 () Unit!5444)

(assert (=> b!178508 (= e!117666 lt!88218)))

(declare-fun lt!88210 () ListLongMap!2245)

(assert (=> b!178508 (= lt!88210 (getCurrentListMapNoExtraKeys!177 (_keys!5546 thiss!1248) (_values!3652 thiss!1248) (mask!8629 thiss!1248) (extraKeys!3406 thiss!1248) (zeroValue!3510 thiss!1248) (minValue!3510 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3669 thiss!1248)))))

(declare-fun lt!88230 () (_ BitVec 64))

(assert (=> b!178508 (= lt!88230 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88211 () (_ BitVec 64))

(assert (=> b!178508 (= lt!88211 (select (arr!3563 (_keys!5546 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88214 () Unit!5444)

(declare-fun addStillContains!120 (ListLongMap!2245 (_ BitVec 64) V!5219 (_ BitVec 64)) Unit!5444)

(assert (=> b!178508 (= lt!88214 (addStillContains!120 lt!88210 lt!88230 (zeroValue!3510 thiss!1248) lt!88211))))

(declare-fun +!261 (ListLongMap!2245 tuple2!3318) ListLongMap!2245)

(assert (=> b!178508 (contains!1208 (+!261 lt!88210 (tuple2!3319 lt!88230 (zeroValue!3510 thiss!1248))) lt!88211)))

(declare-fun lt!88229 () Unit!5444)

(assert (=> b!178508 (= lt!88229 lt!88214)))

(declare-fun lt!88225 () ListLongMap!2245)

(assert (=> b!178508 (= lt!88225 (getCurrentListMapNoExtraKeys!177 (_keys!5546 thiss!1248) (_values!3652 thiss!1248) (mask!8629 thiss!1248) (extraKeys!3406 thiss!1248) (zeroValue!3510 thiss!1248) (minValue!3510 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3669 thiss!1248)))))

(declare-fun lt!88224 () (_ BitVec 64))

(assert (=> b!178508 (= lt!88224 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88217 () (_ BitVec 64))

(assert (=> b!178508 (= lt!88217 (select (arr!3563 (_keys!5546 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88212 () Unit!5444)

(declare-fun addApplyDifferent!120 (ListLongMap!2245 (_ BitVec 64) V!5219 (_ BitVec 64)) Unit!5444)

(assert (=> b!178508 (= lt!88212 (addApplyDifferent!120 lt!88225 lt!88224 (minValue!3510 thiss!1248) lt!88217))))

(assert (=> b!178508 (= (apply!144 (+!261 lt!88225 (tuple2!3319 lt!88224 (minValue!3510 thiss!1248))) lt!88217) (apply!144 lt!88225 lt!88217))))

(declare-fun lt!88220 () Unit!5444)

(assert (=> b!178508 (= lt!88220 lt!88212)))

(declare-fun lt!88227 () ListLongMap!2245)

(assert (=> b!178508 (= lt!88227 (getCurrentListMapNoExtraKeys!177 (_keys!5546 thiss!1248) (_values!3652 thiss!1248) (mask!8629 thiss!1248) (extraKeys!3406 thiss!1248) (zeroValue!3510 thiss!1248) (minValue!3510 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3669 thiss!1248)))))

(declare-fun lt!88221 () (_ BitVec 64))

(assert (=> b!178508 (= lt!88221 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88219 () (_ BitVec 64))

(assert (=> b!178508 (= lt!88219 (select (arr!3563 (_keys!5546 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88226 () Unit!5444)

(assert (=> b!178508 (= lt!88226 (addApplyDifferent!120 lt!88227 lt!88221 (zeroValue!3510 thiss!1248) lt!88219))))

(assert (=> b!178508 (= (apply!144 (+!261 lt!88227 (tuple2!3319 lt!88221 (zeroValue!3510 thiss!1248))) lt!88219) (apply!144 lt!88227 lt!88219))))

(declare-fun lt!88223 () Unit!5444)

(assert (=> b!178508 (= lt!88223 lt!88226)))

(declare-fun lt!88231 () ListLongMap!2245)

(assert (=> b!178508 (= lt!88231 (getCurrentListMapNoExtraKeys!177 (_keys!5546 thiss!1248) (_values!3652 thiss!1248) (mask!8629 thiss!1248) (extraKeys!3406 thiss!1248) (zeroValue!3510 thiss!1248) (minValue!3510 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3669 thiss!1248)))))

(declare-fun lt!88216 () (_ BitVec 64))

(assert (=> b!178508 (= lt!88216 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88215 () (_ BitVec 64))

(assert (=> b!178508 (= lt!88215 (select (arr!3563 (_keys!5546 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!178508 (= lt!88218 (addApplyDifferent!120 lt!88231 lt!88216 (minValue!3510 thiss!1248) lt!88215))))

(assert (=> b!178508 (= (apply!144 (+!261 lt!88231 (tuple2!3319 lt!88216 (minValue!3510 thiss!1248))) lt!88215) (apply!144 lt!88231 lt!88215))))

(declare-fun b!178509 () Bool)

(assert (=> b!178509 (= e!117665 (+!261 call!18050 (tuple2!3319 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3510 thiss!1248))))))

(declare-fun b!178510 () Bool)

(declare-fun c!31978 () Bool)

(assert (=> b!178510 (= c!31978 (and (not (= (bvand (extraKeys!3406 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3406 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!117657 () ListLongMap!2245)

(assert (=> b!178510 (= e!117657 e!117663)))

(declare-fun c!31983 () Bool)

(declare-fun bm!18049 () Bool)

(assert (=> bm!18049 (= call!18050 (+!261 (ite c!31981 call!18046 (ite c!31983 call!18051 call!18048)) (ite (or c!31981 c!31983) (tuple2!3319 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3510 thiss!1248)) (tuple2!3319 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3510 thiss!1248)))))))

(declare-fun b!178511 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!178511 (= e!117656 (validKeyInArray!0 (select (arr!3563 (_keys!5546 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!178512 () Bool)

(assert (=> b!178512 (= e!117662 (validKeyInArray!0 (select (arr!3563 (_keys!5546 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!178513 () Bool)

(assert (=> b!178513 (= e!117654 e!117658)))

(declare-fun c!31982 () Bool)

(assert (=> b!178513 (= c!31982 (not (= (bvand (extraKeys!3406 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!178514 () Bool)

(declare-fun res!84580 () Bool)

(assert (=> b!178514 (=> (not res!84580) (not e!117654))))

(assert (=> b!178514 (= res!84580 e!117661)))

(declare-fun c!31979 () Bool)

(assert (=> b!178514 (= c!31979 (not (= (bvand (extraKeys!3406 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!178515 () Bool)

(declare-fun Unit!5447 () Unit!5444)

(assert (=> b!178515 (= e!117666 Unit!5447)))

(declare-fun b!178516 () Bool)

(assert (=> b!178516 (= e!117665 e!117657)))

(assert (=> b!178516 (= c!31983 (and (not (= (bvand (extraKeys!3406 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3406 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!178517 () Bool)

(assert (=> b!178517 (= e!117657 call!18049)))

(declare-fun b!178518 () Bool)

(assert (=> b!178518 (= e!117663 call!18048)))

(declare-fun b!178519 () Bool)

(assert (=> b!178519 (= e!117658 e!117664)))

(declare-fun res!84579 () Bool)

(assert (=> b!178519 (= res!84579 call!18047)))

(assert (=> b!178519 (=> (not res!84579) (not e!117664))))

(declare-fun b!178520 () Bool)

(assert (=> b!178520 (= e!117659 (= (apply!144 lt!88228 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3510 thiss!1248)))))

(assert (= (and d!53955 c!31981) b!178509))

(assert (= (and d!53955 (not c!31981)) b!178516))

(assert (= (and b!178516 c!31983) b!178517))

(assert (= (and b!178516 (not c!31983)) b!178510))

(assert (= (and b!178510 c!31978) b!178502))

(assert (= (and b!178510 (not c!31978)) b!178518))

(assert (= (or b!178502 b!178518) bm!18045))

(assert (= (or b!178517 bm!18045) bm!18048))

(assert (= (or b!178517 b!178502) bm!18043))

(assert (= (or b!178509 bm!18048) bm!18046))

(assert (= (or b!178509 bm!18043) bm!18049))

(assert (= (and d!53955 res!84578) b!178511))

(assert (= (and d!53955 c!31980) b!178508))

(assert (= (and d!53955 (not c!31980)) b!178515))

(assert (= (and d!53955 res!84574) b!178504))

(assert (= (and b!178504 res!84577) b!178512))

(assert (= (and b!178504 (not res!84581)) b!178507))

(assert (= (and b!178507 res!84576) b!178506))

(assert (= (and b!178504 res!84575) b!178514))

(assert (= (and b!178514 c!31979) b!178505))

(assert (= (and b!178514 (not c!31979)) b!178503))

(assert (= (and b!178505 res!84582) b!178520))

(assert (= (or b!178505 b!178503) bm!18044))

(assert (= (and b!178514 res!84580) b!178513))

(assert (= (and b!178513 c!31982) b!178519))

(assert (= (and b!178513 (not c!31982)) b!178501))

(assert (= (and b!178519 res!84579) b!178500))

(assert (= (or b!178519 b!178501) bm!18047))

(declare-fun b_lambda!7083 () Bool)

(assert (=> (not b_lambda!7083) (not b!178506)))

(declare-fun t!7104 () Bool)

(declare-fun tb!2799 () Bool)

(assert (=> (and b!178405 (= (defaultEntry!3669 thiss!1248) (defaultEntry!3669 thiss!1248)) t!7104) tb!2799))

(declare-fun result!4671 () Bool)

(assert (=> tb!2799 (= result!4671 tp_is_empty!4179)))

(assert (=> b!178506 t!7104))

(declare-fun b_and!10927 () Bool)

(assert (= b_and!10923 (and (=> t!7104 result!4671) b_and!10927)))

(declare-fun m!206845 () Bool)

(assert (=> b!178512 m!206845))

(assert (=> b!178512 m!206845))

(declare-fun m!206847 () Bool)

(assert (=> b!178512 m!206847))

(declare-fun m!206849 () Bool)

(assert (=> bm!18044 m!206849))

(declare-fun m!206851 () Bool)

(assert (=> bm!18047 m!206851))

(declare-fun m!206853 () Bool)

(assert (=> b!178500 m!206853))

(declare-fun m!206855 () Bool)

(assert (=> b!178509 m!206855))

(assert (=> b!178511 m!206845))

(assert (=> b!178511 m!206845))

(assert (=> b!178511 m!206847))

(declare-fun m!206857 () Bool)

(assert (=> b!178508 m!206857))

(declare-fun m!206859 () Bool)

(assert (=> b!178508 m!206859))

(declare-fun m!206861 () Bool)

(assert (=> b!178508 m!206861))

(declare-fun m!206863 () Bool)

(assert (=> b!178508 m!206863))

(declare-fun m!206865 () Bool)

(assert (=> b!178508 m!206865))

(declare-fun m!206867 () Bool)

(assert (=> b!178508 m!206867))

(assert (=> b!178508 m!206859))

(declare-fun m!206869 () Bool)

(assert (=> b!178508 m!206869))

(declare-fun m!206871 () Bool)

(assert (=> b!178508 m!206871))

(declare-fun m!206873 () Bool)

(assert (=> b!178508 m!206873))

(declare-fun m!206875 () Bool)

(assert (=> b!178508 m!206875))

(assert (=> b!178508 m!206863))

(declare-fun m!206877 () Bool)

(assert (=> b!178508 m!206877))

(assert (=> b!178508 m!206873))

(declare-fun m!206879 () Bool)

(assert (=> b!178508 m!206879))

(declare-fun m!206881 () Bool)

(assert (=> b!178508 m!206881))

(declare-fun m!206883 () Bool)

(assert (=> b!178508 m!206883))

(assert (=> b!178508 m!206867))

(declare-fun m!206885 () Bool)

(assert (=> b!178508 m!206885))

(declare-fun m!206887 () Bool)

(assert (=> b!178508 m!206887))

(assert (=> b!178508 m!206845))

(assert (=> b!178506 m!206845))

(declare-fun m!206889 () Bool)

(assert (=> b!178506 m!206889))

(declare-fun m!206891 () Bool)

(assert (=> b!178506 m!206891))

(declare-fun m!206893 () Bool)

(assert (=> b!178506 m!206893))

(assert (=> b!178506 m!206891))

(assert (=> b!178506 m!206893))

(declare-fun m!206895 () Bool)

(assert (=> b!178506 m!206895))

(assert (=> b!178506 m!206845))

(assert (=> b!178507 m!206845))

(assert (=> b!178507 m!206845))

(declare-fun m!206897 () Bool)

(assert (=> b!178507 m!206897))

(declare-fun m!206899 () Bool)

(assert (=> bm!18049 m!206899))

(declare-fun m!206901 () Bool)

(assert (=> b!178520 m!206901))

(assert (=> bm!18046 m!206869))

(assert (=> d!53955 m!206801))

(assert (=> b!178407 d!53955))

(declare-fun b!178535 () Bool)

(declare-fun e!117675 () SeekEntryResult!575)

(assert (=> b!178535 (= e!117675 Undefined!575)))

(declare-fun lt!88240 () SeekEntryResult!575)

(declare-fun b!178536 () Bool)

(declare-fun e!117673 () SeekEntryResult!575)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7517 (_ BitVec 32)) SeekEntryResult!575)

(assert (=> b!178536 (= e!117673 (seekKeyOrZeroReturnVacant!0 (x!19543 lt!88240) (index!4470 lt!88240) (index!4470 lt!88240) key!828 (_keys!5546 thiss!1248) (mask!8629 thiss!1248)))))

(declare-fun b!178537 () Bool)

(declare-fun e!117674 () SeekEntryResult!575)

(assert (=> b!178537 (= e!117674 (Found!575 (index!4470 lt!88240)))))

(declare-fun d!53957 () Bool)

(declare-fun lt!88238 () SeekEntryResult!575)

(assert (=> d!53957 (and (or ((_ is Undefined!575) lt!88238) (not ((_ is Found!575) lt!88238)) (and (bvsge (index!4469 lt!88238) #b00000000000000000000000000000000) (bvslt (index!4469 lt!88238) (size!3869 (_keys!5546 thiss!1248))))) (or ((_ is Undefined!575) lt!88238) ((_ is Found!575) lt!88238) (not ((_ is MissingZero!575) lt!88238)) (and (bvsge (index!4468 lt!88238) #b00000000000000000000000000000000) (bvslt (index!4468 lt!88238) (size!3869 (_keys!5546 thiss!1248))))) (or ((_ is Undefined!575) lt!88238) ((_ is Found!575) lt!88238) ((_ is MissingZero!575) lt!88238) (not ((_ is MissingVacant!575) lt!88238)) (and (bvsge (index!4471 lt!88238) #b00000000000000000000000000000000) (bvslt (index!4471 lt!88238) (size!3869 (_keys!5546 thiss!1248))))) (or ((_ is Undefined!575) lt!88238) (ite ((_ is Found!575) lt!88238) (= (select (arr!3563 (_keys!5546 thiss!1248)) (index!4469 lt!88238)) key!828) (ite ((_ is MissingZero!575) lt!88238) (= (select (arr!3563 (_keys!5546 thiss!1248)) (index!4468 lt!88238)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!575) lt!88238) (= (select (arr!3563 (_keys!5546 thiss!1248)) (index!4471 lt!88238)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!53957 (= lt!88238 e!117675)))

(declare-fun c!31991 () Bool)

(assert (=> d!53957 (= c!31991 (and ((_ is Intermediate!575) lt!88240) (undefined!1387 lt!88240)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7517 (_ BitVec 32)) SeekEntryResult!575)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!53957 (= lt!88240 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8629 thiss!1248)) key!828 (_keys!5546 thiss!1248) (mask!8629 thiss!1248)))))

(assert (=> d!53957 (validMask!0 (mask!8629 thiss!1248))))

(assert (=> d!53957 (= (seekEntryOrOpen!0 key!828 (_keys!5546 thiss!1248) (mask!8629 thiss!1248)) lt!88238)))

(declare-fun b!178538 () Bool)

(declare-fun c!31990 () Bool)

(declare-fun lt!88239 () (_ BitVec 64))

(assert (=> b!178538 (= c!31990 (= lt!88239 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!178538 (= e!117674 e!117673)))

(declare-fun b!178539 () Bool)

(assert (=> b!178539 (= e!117673 (MissingZero!575 (index!4470 lt!88240)))))

(declare-fun b!178540 () Bool)

(assert (=> b!178540 (= e!117675 e!117674)))

(assert (=> b!178540 (= lt!88239 (select (arr!3563 (_keys!5546 thiss!1248)) (index!4470 lt!88240)))))

(declare-fun c!31992 () Bool)

(assert (=> b!178540 (= c!31992 (= lt!88239 key!828))))

(assert (= (and d!53957 c!31991) b!178535))

(assert (= (and d!53957 (not c!31991)) b!178540))

(assert (= (and b!178540 c!31992) b!178537))

(assert (= (and b!178540 (not c!31992)) b!178538))

(assert (= (and b!178538 c!31990) b!178539))

(assert (= (and b!178538 (not c!31990)) b!178536))

(declare-fun m!206903 () Bool)

(assert (=> b!178536 m!206903))

(declare-fun m!206905 () Bool)

(assert (=> d!53957 m!206905))

(declare-fun m!206907 () Bool)

(assert (=> d!53957 m!206907))

(declare-fun m!206909 () Bool)

(assert (=> d!53957 m!206909))

(assert (=> d!53957 m!206905))

(declare-fun m!206911 () Bool)

(assert (=> d!53957 m!206911))

(declare-fun m!206913 () Bool)

(assert (=> d!53957 m!206913))

(assert (=> d!53957 m!206801))

(declare-fun m!206915 () Bool)

(assert (=> b!178540 m!206915))

(assert (=> b!178412 d!53957))

(declare-fun condMapEmpty!7151 () Bool)

(declare-fun mapDefault!7151 () ValueCell!1746)

(assert (=> mapNonEmpty!7145 (= condMapEmpty!7151 (= mapRest!7145 ((as const (Array (_ BitVec 32) ValueCell!1746)) mapDefault!7151)))))

(declare-fun e!117681 () Bool)

(declare-fun mapRes!7151 () Bool)

(assert (=> mapNonEmpty!7145 (= tp!15935 (and e!117681 mapRes!7151))))

(declare-fun b!178547 () Bool)

(declare-fun e!117680 () Bool)

(assert (=> b!178547 (= e!117680 tp_is_empty!4179)))

(declare-fun mapNonEmpty!7151 () Bool)

(declare-fun tp!15944 () Bool)

(assert (=> mapNonEmpty!7151 (= mapRes!7151 (and tp!15944 e!117680))))

(declare-fun mapValue!7151 () ValueCell!1746)

(declare-fun mapKey!7151 () (_ BitVec 32))

(declare-fun mapRest!7151 () (Array (_ BitVec 32) ValueCell!1746))

(assert (=> mapNonEmpty!7151 (= mapRest!7145 (store mapRest!7151 mapKey!7151 mapValue!7151))))

(declare-fun mapIsEmpty!7151 () Bool)

(assert (=> mapIsEmpty!7151 mapRes!7151))

(declare-fun b!178548 () Bool)

(assert (=> b!178548 (= e!117681 tp_is_empty!4179)))

(assert (= (and mapNonEmpty!7145 condMapEmpty!7151) mapIsEmpty!7151))

(assert (= (and mapNonEmpty!7145 (not condMapEmpty!7151)) mapNonEmpty!7151))

(assert (= (and mapNonEmpty!7151 ((_ is ValueCellFull!1746) mapValue!7151)) b!178547))

(assert (= (and mapNonEmpty!7145 ((_ is ValueCellFull!1746) mapDefault!7151)) b!178548))

(declare-fun m!206917 () Bool)

(assert (=> mapNonEmpty!7151 m!206917))

(declare-fun b_lambda!7085 () Bool)

(assert (= b_lambda!7083 (or (and b!178405 b_free!4407) b_lambda!7085)))

(check-sat (not bm!18047) (not b!178446) (not b!178511) (not d!53955) (not bm!18049) (not bm!18046) tp_is_empty!4179 (not b!178520) (not b_next!4407) (not b!178512) (not b!178448) (not b!178457) b_and!10927 (not b!178508) (not b!178506) (not b!178507) (not b!178455) (not b!178536) (not b!178500) (not b!178447) (not mapNonEmpty!7151) (not d!53957) (not d!53953) (not b!178509) (not b_lambda!7085) (not d!53945) (not bm!18044))
(check-sat b_and!10927 (not b_next!4407))
(get-model)

(declare-fun d!53959 () Bool)

(declare-fun e!117682 () Bool)

(assert (=> d!53959 e!117682))

(declare-fun res!84583 () Bool)

(assert (=> d!53959 (=> res!84583 e!117682)))

(declare-fun lt!88241 () Bool)

(assert (=> d!53959 (= res!84583 (not lt!88241))))

(declare-fun lt!88242 () Bool)

(assert (=> d!53959 (= lt!88241 lt!88242)))

(declare-fun lt!88244 () Unit!5444)

(declare-fun e!117683 () Unit!5444)

(assert (=> d!53959 (= lt!88244 e!117683)))

(declare-fun c!31993 () Bool)

(assert (=> d!53959 (= c!31993 lt!88242)))

(assert (=> d!53959 (= lt!88242 (containsKey!203 (toList!1138 lt!88228) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53959 (= (contains!1208 lt!88228 #b0000000000000000000000000000000000000000000000000000000000000000) lt!88241)))

(declare-fun b!178549 () Bool)

(declare-fun lt!88243 () Unit!5444)

(assert (=> b!178549 (= e!117683 lt!88243)))

(assert (=> b!178549 (= lt!88243 (lemmaContainsKeyImpliesGetValueByKeyDefined!151 (toList!1138 lt!88228) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!178549 (isDefined!152 (getValueByKey!199 (toList!1138 lt!88228) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!178550 () Bool)

(declare-fun Unit!5448 () Unit!5444)

(assert (=> b!178550 (= e!117683 Unit!5448)))

(declare-fun b!178551 () Bool)

(assert (=> b!178551 (= e!117682 (isDefined!152 (getValueByKey!199 (toList!1138 lt!88228) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53959 c!31993) b!178549))

(assert (= (and d!53959 (not c!31993)) b!178550))

(assert (= (and d!53959 (not res!84583)) b!178551))

(declare-fun m!206919 () Bool)

(assert (=> d!53959 m!206919))

(declare-fun m!206921 () Bool)

(assert (=> b!178549 m!206921))

(declare-fun m!206923 () Bool)

(assert (=> b!178549 m!206923))

(assert (=> b!178549 m!206923))

(declare-fun m!206925 () Bool)

(assert (=> b!178549 m!206925))

(assert (=> b!178551 m!206923))

(assert (=> b!178551 m!206923))

(assert (=> b!178551 m!206925))

(assert (=> bm!18044 d!53959))

(declare-fun d!53961 () Bool)

(declare-fun res!84588 () Bool)

(declare-fun e!117688 () Bool)

(assert (=> d!53961 (=> res!84588 e!117688)))

(assert (=> d!53961 (= res!84588 (and ((_ is Cons!2260) (toList!1138 (getCurrentListMap!790 (_keys!5546 thiss!1248) (_values!3652 thiss!1248) (mask!8629 thiss!1248) (extraKeys!3406 thiss!1248) (zeroValue!3510 thiss!1248) (minValue!3510 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3669 thiss!1248)))) (= (_1!1670 (h!2883 (toList!1138 (getCurrentListMap!790 (_keys!5546 thiss!1248) (_values!3652 thiss!1248) (mask!8629 thiss!1248) (extraKeys!3406 thiss!1248) (zeroValue!3510 thiss!1248) (minValue!3510 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3669 thiss!1248))))) key!828)))))

(assert (=> d!53961 (= (containsKey!203 (toList!1138 (getCurrentListMap!790 (_keys!5546 thiss!1248) (_values!3652 thiss!1248) (mask!8629 thiss!1248) (extraKeys!3406 thiss!1248) (zeroValue!3510 thiss!1248) (minValue!3510 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3669 thiss!1248))) key!828) e!117688)))

(declare-fun b!178556 () Bool)

(declare-fun e!117689 () Bool)

(assert (=> b!178556 (= e!117688 e!117689)))

(declare-fun res!84589 () Bool)

(assert (=> b!178556 (=> (not res!84589) (not e!117689))))

(assert (=> b!178556 (= res!84589 (and (or (not ((_ is Cons!2260) (toList!1138 (getCurrentListMap!790 (_keys!5546 thiss!1248) (_values!3652 thiss!1248) (mask!8629 thiss!1248) (extraKeys!3406 thiss!1248) (zeroValue!3510 thiss!1248) (minValue!3510 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3669 thiss!1248))))) (bvsle (_1!1670 (h!2883 (toList!1138 (getCurrentListMap!790 (_keys!5546 thiss!1248) (_values!3652 thiss!1248) (mask!8629 thiss!1248) (extraKeys!3406 thiss!1248) (zeroValue!3510 thiss!1248) (minValue!3510 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3669 thiss!1248))))) key!828)) ((_ is Cons!2260) (toList!1138 (getCurrentListMap!790 (_keys!5546 thiss!1248) (_values!3652 thiss!1248) (mask!8629 thiss!1248) (extraKeys!3406 thiss!1248) (zeroValue!3510 thiss!1248) (minValue!3510 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3669 thiss!1248)))) (bvslt (_1!1670 (h!2883 (toList!1138 (getCurrentListMap!790 (_keys!5546 thiss!1248) (_values!3652 thiss!1248) (mask!8629 thiss!1248) (extraKeys!3406 thiss!1248) (zeroValue!3510 thiss!1248) (minValue!3510 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3669 thiss!1248))))) key!828)))))

(declare-fun b!178557 () Bool)

(assert (=> b!178557 (= e!117689 (containsKey!203 (t!7102 (toList!1138 (getCurrentListMap!790 (_keys!5546 thiss!1248) (_values!3652 thiss!1248) (mask!8629 thiss!1248) (extraKeys!3406 thiss!1248) (zeroValue!3510 thiss!1248) (minValue!3510 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3669 thiss!1248)))) key!828))))

(assert (= (and d!53961 (not res!84588)) b!178556))

(assert (= (and b!178556 res!84589) b!178557))

(declare-fun m!206927 () Bool)

(assert (=> b!178557 m!206927))

(assert (=> d!53953 d!53961))

(declare-fun b!178570 () Bool)

(declare-fun e!117698 () SeekEntryResult!575)

(assert (=> b!178570 (= e!117698 Undefined!575)))

(declare-fun e!117697 () SeekEntryResult!575)

(declare-fun b!178571 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!178571 (= e!117697 (seekKeyOrZeroReturnVacant!0 (bvadd (x!19543 lt!88240) #b00000000000000000000000000000001) (nextIndex!0 (index!4470 lt!88240) (x!19543 lt!88240) (mask!8629 thiss!1248)) (index!4470 lt!88240) key!828 (_keys!5546 thiss!1248) (mask!8629 thiss!1248)))))

(declare-fun b!178572 () Bool)

(assert (=> b!178572 (= e!117697 (MissingVacant!575 (index!4470 lt!88240)))))

(declare-fun lt!88250 () SeekEntryResult!575)

(declare-fun d!53963 () Bool)

(assert (=> d!53963 (and (or ((_ is Undefined!575) lt!88250) (not ((_ is Found!575) lt!88250)) (and (bvsge (index!4469 lt!88250) #b00000000000000000000000000000000) (bvslt (index!4469 lt!88250) (size!3869 (_keys!5546 thiss!1248))))) (or ((_ is Undefined!575) lt!88250) ((_ is Found!575) lt!88250) (not ((_ is MissingVacant!575) lt!88250)) (not (= (index!4471 lt!88250) (index!4470 lt!88240))) (and (bvsge (index!4471 lt!88250) #b00000000000000000000000000000000) (bvslt (index!4471 lt!88250) (size!3869 (_keys!5546 thiss!1248))))) (or ((_ is Undefined!575) lt!88250) (ite ((_ is Found!575) lt!88250) (= (select (arr!3563 (_keys!5546 thiss!1248)) (index!4469 lt!88250)) key!828) (and ((_ is MissingVacant!575) lt!88250) (= (index!4471 lt!88250) (index!4470 lt!88240)) (= (select (arr!3563 (_keys!5546 thiss!1248)) (index!4471 lt!88250)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!53963 (= lt!88250 e!117698)))

(declare-fun c!32001 () Bool)

(assert (=> d!53963 (= c!32001 (bvsge (x!19543 lt!88240) #b01111111111111111111111111111110))))

(declare-fun lt!88249 () (_ BitVec 64))

(assert (=> d!53963 (= lt!88249 (select (arr!3563 (_keys!5546 thiss!1248)) (index!4470 lt!88240)))))

(assert (=> d!53963 (validMask!0 (mask!8629 thiss!1248))))

(assert (=> d!53963 (= (seekKeyOrZeroReturnVacant!0 (x!19543 lt!88240) (index!4470 lt!88240) (index!4470 lt!88240) key!828 (_keys!5546 thiss!1248) (mask!8629 thiss!1248)) lt!88250)))

(declare-fun b!178573 () Bool)

(declare-fun e!117696 () SeekEntryResult!575)

(assert (=> b!178573 (= e!117698 e!117696)))

(declare-fun c!32000 () Bool)

(assert (=> b!178573 (= c!32000 (= lt!88249 key!828))))

(declare-fun b!178574 () Bool)

(assert (=> b!178574 (= e!117696 (Found!575 (index!4470 lt!88240)))))

(declare-fun b!178575 () Bool)

(declare-fun c!32002 () Bool)

(assert (=> b!178575 (= c!32002 (= lt!88249 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!178575 (= e!117696 e!117697)))

(assert (= (and d!53963 c!32001) b!178570))

(assert (= (and d!53963 (not c!32001)) b!178573))

(assert (= (and b!178573 c!32000) b!178574))

(assert (= (and b!178573 (not c!32000)) b!178575))

(assert (= (and b!178575 c!32002) b!178572))

(assert (= (and b!178575 (not c!32002)) b!178571))

(declare-fun m!206929 () Bool)

(assert (=> b!178571 m!206929))

(assert (=> b!178571 m!206929))

(declare-fun m!206931 () Bool)

(assert (=> b!178571 m!206931))

(declare-fun m!206933 () Bool)

(assert (=> d!53963 m!206933))

(declare-fun m!206935 () Bool)

(assert (=> d!53963 m!206935))

(assert (=> d!53963 m!206915))

(assert (=> d!53963 m!206801))

(assert (=> b!178536 d!53963))

(declare-fun d!53965 () Bool)

(declare-fun e!117699 () Bool)

(assert (=> d!53965 e!117699))

(declare-fun res!84590 () Bool)

(assert (=> d!53965 (=> res!84590 e!117699)))

(declare-fun lt!88251 () Bool)

(assert (=> d!53965 (= res!84590 (not lt!88251))))

(declare-fun lt!88252 () Bool)

(assert (=> d!53965 (= lt!88251 lt!88252)))

(declare-fun lt!88254 () Unit!5444)

(declare-fun e!117700 () Unit!5444)

(assert (=> d!53965 (= lt!88254 e!117700)))

(declare-fun c!32003 () Bool)

(assert (=> d!53965 (= c!32003 lt!88252)))

(assert (=> d!53965 (= lt!88252 (containsKey!203 (toList!1138 lt!88228) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53965 (= (contains!1208 lt!88228 #b1000000000000000000000000000000000000000000000000000000000000000) lt!88251)))

(declare-fun b!178576 () Bool)

(declare-fun lt!88253 () Unit!5444)

(assert (=> b!178576 (= e!117700 lt!88253)))

(assert (=> b!178576 (= lt!88253 (lemmaContainsKeyImpliesGetValueByKeyDefined!151 (toList!1138 lt!88228) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!178576 (isDefined!152 (getValueByKey!199 (toList!1138 lt!88228) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!178577 () Bool)

(declare-fun Unit!5449 () Unit!5444)

(assert (=> b!178577 (= e!117700 Unit!5449)))

(declare-fun b!178578 () Bool)

(assert (=> b!178578 (= e!117699 (isDefined!152 (getValueByKey!199 (toList!1138 lt!88228) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53965 c!32003) b!178576))

(assert (= (and d!53965 (not c!32003)) b!178577))

(assert (= (and d!53965 (not res!84590)) b!178578))

(declare-fun m!206937 () Bool)

(assert (=> d!53965 m!206937))

(declare-fun m!206939 () Bool)

(assert (=> b!178576 m!206939))

(declare-fun m!206941 () Bool)

(assert (=> b!178576 m!206941))

(assert (=> b!178576 m!206941))

(declare-fun m!206943 () Bool)

(assert (=> b!178576 m!206943))

(assert (=> b!178578 m!206941))

(assert (=> b!178578 m!206941))

(assert (=> b!178578 m!206943))

(assert (=> bm!18047 d!53965))

(declare-fun d!53967 () Bool)

(declare-fun e!117701 () Bool)

(assert (=> d!53967 e!117701))

(declare-fun res!84591 () Bool)

(assert (=> d!53967 (=> res!84591 e!117701)))

(declare-fun lt!88255 () Bool)

(assert (=> d!53967 (= res!84591 (not lt!88255))))

(declare-fun lt!88256 () Bool)

(assert (=> d!53967 (= lt!88255 lt!88256)))

(declare-fun lt!88258 () Unit!5444)

(declare-fun e!117702 () Unit!5444)

(assert (=> d!53967 (= lt!88258 e!117702)))

(declare-fun c!32004 () Bool)

(assert (=> d!53967 (= c!32004 lt!88256)))

(assert (=> d!53967 (= lt!88256 (containsKey!203 (toList!1138 lt!88228) (select (arr!3563 (_keys!5546 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!53967 (= (contains!1208 lt!88228 (select (arr!3563 (_keys!5546 thiss!1248)) #b00000000000000000000000000000000)) lt!88255)))

(declare-fun b!178579 () Bool)

(declare-fun lt!88257 () Unit!5444)

(assert (=> b!178579 (= e!117702 lt!88257)))

(assert (=> b!178579 (= lt!88257 (lemmaContainsKeyImpliesGetValueByKeyDefined!151 (toList!1138 lt!88228) (select (arr!3563 (_keys!5546 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!178579 (isDefined!152 (getValueByKey!199 (toList!1138 lt!88228) (select (arr!3563 (_keys!5546 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!178580 () Bool)

(declare-fun Unit!5450 () Unit!5444)

(assert (=> b!178580 (= e!117702 Unit!5450)))

(declare-fun b!178581 () Bool)

(assert (=> b!178581 (= e!117701 (isDefined!152 (getValueByKey!199 (toList!1138 lt!88228) (select (arr!3563 (_keys!5546 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!53967 c!32004) b!178579))

(assert (= (and d!53967 (not c!32004)) b!178580))

(assert (= (and d!53967 (not res!84591)) b!178581))

(assert (=> d!53967 m!206845))

(declare-fun m!206945 () Bool)

(assert (=> d!53967 m!206945))

(assert (=> b!178579 m!206845))

(declare-fun m!206947 () Bool)

(assert (=> b!178579 m!206947))

(assert (=> b!178579 m!206845))

(declare-fun m!206949 () Bool)

(assert (=> b!178579 m!206949))

(assert (=> b!178579 m!206949))

(declare-fun m!206951 () Bool)

(assert (=> b!178579 m!206951))

(assert (=> b!178581 m!206845))

(assert (=> b!178581 m!206949))

(assert (=> b!178581 m!206949))

(assert (=> b!178581 m!206951))

(assert (=> b!178507 d!53967))

(declare-fun b!178592 () Bool)

(declare-fun e!117712 () Bool)

(declare-fun e!117711 () Bool)

(assert (=> b!178592 (= e!117712 e!117711)))

(declare-fun c!32007 () Bool)

(assert (=> b!178592 (= c!32007 (validKeyInArray!0 (select (arr!3563 (_keys!5546 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!53969 () Bool)

(declare-fun res!84600 () Bool)

(declare-fun e!117713 () Bool)

(assert (=> d!53969 (=> res!84600 e!117713)))

(assert (=> d!53969 (= res!84600 (bvsge #b00000000000000000000000000000000 (size!3869 (_keys!5546 thiss!1248))))))

(assert (=> d!53969 (= (arrayNoDuplicates!0 (_keys!5546 thiss!1248) #b00000000000000000000000000000000 Nil!2262) e!117713)))

(declare-fun b!178593 () Bool)

(declare-fun call!18055 () Bool)

(assert (=> b!178593 (= e!117711 call!18055)))

(declare-fun b!178594 () Bool)

(assert (=> b!178594 (= e!117711 call!18055)))

(declare-fun bm!18052 () Bool)

(assert (=> bm!18052 (= call!18055 (arrayNoDuplicates!0 (_keys!5546 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!32007 (Cons!2261 (select (arr!3563 (_keys!5546 thiss!1248)) #b00000000000000000000000000000000) Nil!2262) Nil!2262)))))

(declare-fun b!178595 () Bool)

(declare-fun e!117714 () Bool)

(declare-fun contains!1209 (List!2265 (_ BitVec 64)) Bool)

(assert (=> b!178595 (= e!117714 (contains!1209 Nil!2262 (select (arr!3563 (_keys!5546 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!178596 () Bool)

(assert (=> b!178596 (= e!117713 e!117712)))

(declare-fun res!84598 () Bool)

(assert (=> b!178596 (=> (not res!84598) (not e!117712))))

(assert (=> b!178596 (= res!84598 (not e!117714))))

(declare-fun res!84599 () Bool)

(assert (=> b!178596 (=> (not res!84599) (not e!117714))))

(assert (=> b!178596 (= res!84599 (validKeyInArray!0 (select (arr!3563 (_keys!5546 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!53969 (not res!84600)) b!178596))

(assert (= (and b!178596 res!84599) b!178595))

(assert (= (and b!178596 res!84598) b!178592))

(assert (= (and b!178592 c!32007) b!178594))

(assert (= (and b!178592 (not c!32007)) b!178593))

(assert (= (or b!178594 b!178593) bm!18052))

(assert (=> b!178592 m!206845))

(assert (=> b!178592 m!206845))

(assert (=> b!178592 m!206847))

(assert (=> bm!18052 m!206845))

(declare-fun m!206953 () Bool)

(assert (=> bm!18052 m!206953))

(assert (=> b!178595 m!206845))

(assert (=> b!178595 m!206845))

(declare-fun m!206955 () Bool)

(assert (=> b!178595 m!206955))

(assert (=> b!178596 m!206845))

(assert (=> b!178596 m!206845))

(assert (=> b!178596 m!206847))

(assert (=> b!178448 d!53969))

(declare-fun d!53971 () Bool)

(declare-fun get!2036 (Option!205) V!5219)

(assert (=> d!53971 (= (apply!144 lt!88228 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2036 (getValueByKey!199 (toList!1138 lt!88228) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7324 () Bool)

(assert (= bs!7324 d!53971))

(assert (=> bs!7324 m!206941))

(assert (=> bs!7324 m!206941))

(declare-fun m!206957 () Bool)

(assert (=> bs!7324 m!206957))

(assert (=> b!178500 d!53971))

(declare-fun b!178621 () Bool)

(declare-fun e!117730 () ListLongMap!2245)

(declare-fun call!18058 () ListLongMap!2245)

(assert (=> b!178621 (= e!117730 call!18058)))

(declare-fun d!53973 () Bool)

(declare-fun e!117731 () Bool)

(assert (=> d!53973 e!117731))

(declare-fun res!84609 () Bool)

(assert (=> d!53973 (=> (not res!84609) (not e!117731))))

(declare-fun lt!88277 () ListLongMap!2245)

(assert (=> d!53973 (= res!84609 (not (contains!1208 lt!88277 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!117733 () ListLongMap!2245)

(assert (=> d!53973 (= lt!88277 e!117733)))

(declare-fun c!32019 () Bool)

(assert (=> d!53973 (= c!32019 (bvsge #b00000000000000000000000000000000 (size!3869 (_keys!5546 thiss!1248))))))

(assert (=> d!53973 (validMask!0 (mask!8629 thiss!1248))))

(assert (=> d!53973 (= (getCurrentListMapNoExtraKeys!177 (_keys!5546 thiss!1248) (_values!3652 thiss!1248) (mask!8629 thiss!1248) (extraKeys!3406 thiss!1248) (zeroValue!3510 thiss!1248) (minValue!3510 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3669 thiss!1248)) lt!88277)))

(declare-fun b!178622 () Bool)

(declare-fun e!117732 () Bool)

(declare-fun e!117729 () Bool)

(assert (=> b!178622 (= e!117732 e!117729)))

(assert (=> b!178622 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3869 (_keys!5546 thiss!1248))))))

(declare-fun res!84612 () Bool)

(assert (=> b!178622 (= res!84612 (contains!1208 lt!88277 (select (arr!3563 (_keys!5546 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!178622 (=> (not res!84612) (not e!117729))))

(declare-fun b!178623 () Bool)

(declare-fun e!117735 () Bool)

(assert (=> b!178623 (= e!117732 e!117735)))

(declare-fun c!32017 () Bool)

(assert (=> b!178623 (= c!32017 (bvslt #b00000000000000000000000000000000 (size!3869 (_keys!5546 thiss!1248))))))

(declare-fun b!178624 () Bool)

(assert (=> b!178624 (= e!117733 e!117730)))

(declare-fun c!32018 () Bool)

(assert (=> b!178624 (= c!32018 (validKeyInArray!0 (select (arr!3563 (_keys!5546 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!178625 () Bool)

(assert (=> b!178625 (= e!117731 e!117732)))

(declare-fun c!32016 () Bool)

(declare-fun e!117734 () Bool)

(assert (=> b!178625 (= c!32016 e!117734)))

(declare-fun res!84611 () Bool)

(assert (=> b!178625 (=> (not res!84611) (not e!117734))))

(assert (=> b!178625 (= res!84611 (bvslt #b00000000000000000000000000000000 (size!3869 (_keys!5546 thiss!1248))))))

(declare-fun b!178626 () Bool)

(assert (=> b!178626 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3869 (_keys!5546 thiss!1248))))))

(assert (=> b!178626 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3870 (_values!3652 thiss!1248))))))

(assert (=> b!178626 (= e!117729 (= (apply!144 lt!88277 (select (arr!3563 (_keys!5546 thiss!1248)) #b00000000000000000000000000000000)) (get!2035 (select (arr!3564 (_values!3652 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!487 (defaultEntry!3669 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!178627 () Bool)

(declare-fun isEmpty!451 (ListLongMap!2245) Bool)

(assert (=> b!178627 (= e!117735 (isEmpty!451 lt!88277))))

(declare-fun b!178628 () Bool)

(assert (=> b!178628 (= e!117733 (ListLongMap!2246 Nil!2261))))

(declare-fun b!178629 () Bool)

(assert (=> b!178629 (= e!117735 (= lt!88277 (getCurrentListMapNoExtraKeys!177 (_keys!5546 thiss!1248) (_values!3652 thiss!1248) (mask!8629 thiss!1248) (extraKeys!3406 thiss!1248) (zeroValue!3510 thiss!1248) (minValue!3510 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3669 thiss!1248))))))

(declare-fun b!178630 () Bool)

(assert (=> b!178630 (= e!117734 (validKeyInArray!0 (select (arr!3563 (_keys!5546 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!178630 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!178631 () Bool)

(declare-fun lt!88278 () Unit!5444)

(declare-fun lt!88273 () Unit!5444)

(assert (=> b!178631 (= lt!88278 lt!88273)))

(declare-fun lt!88275 () (_ BitVec 64))

(declare-fun lt!88274 () (_ BitVec 64))

(declare-fun lt!88279 () ListLongMap!2245)

(declare-fun lt!88276 () V!5219)

(assert (=> b!178631 (not (contains!1208 (+!261 lt!88279 (tuple2!3319 lt!88275 lt!88276)) lt!88274))))

(declare-fun addStillNotContains!79 (ListLongMap!2245 (_ BitVec 64) V!5219 (_ BitVec 64)) Unit!5444)

(assert (=> b!178631 (= lt!88273 (addStillNotContains!79 lt!88279 lt!88275 lt!88276 lt!88274))))

(assert (=> b!178631 (= lt!88274 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!178631 (= lt!88276 (get!2035 (select (arr!3564 (_values!3652 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!487 (defaultEntry!3669 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!178631 (= lt!88275 (select (arr!3563 (_keys!5546 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!178631 (= lt!88279 call!18058)))

(assert (=> b!178631 (= e!117730 (+!261 call!18058 (tuple2!3319 (select (arr!3563 (_keys!5546 thiss!1248)) #b00000000000000000000000000000000) (get!2035 (select (arr!3564 (_values!3652 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!487 (defaultEntry!3669 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!18055 () Bool)

(assert (=> bm!18055 (= call!18058 (getCurrentListMapNoExtraKeys!177 (_keys!5546 thiss!1248) (_values!3652 thiss!1248) (mask!8629 thiss!1248) (extraKeys!3406 thiss!1248) (zeroValue!3510 thiss!1248) (minValue!3510 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3669 thiss!1248)))))

(declare-fun b!178632 () Bool)

(declare-fun res!84610 () Bool)

(assert (=> b!178632 (=> (not res!84610) (not e!117731))))

(assert (=> b!178632 (= res!84610 (not (contains!1208 lt!88277 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53973 c!32019) b!178628))

(assert (= (and d!53973 (not c!32019)) b!178624))

(assert (= (and b!178624 c!32018) b!178631))

(assert (= (and b!178624 (not c!32018)) b!178621))

(assert (= (or b!178631 b!178621) bm!18055))

(assert (= (and d!53973 res!84609) b!178632))

(assert (= (and b!178632 res!84610) b!178625))

(assert (= (and b!178625 res!84611) b!178630))

(assert (= (and b!178625 c!32016) b!178622))

(assert (= (and b!178625 (not c!32016)) b!178623))

(assert (= (and b!178622 res!84612) b!178626))

(assert (= (and b!178623 c!32017) b!178629))

(assert (= (and b!178623 (not c!32017)) b!178627))

(declare-fun b_lambda!7087 () Bool)

(assert (=> (not b_lambda!7087) (not b!178626)))

(assert (=> b!178626 t!7104))

(declare-fun b_and!10929 () Bool)

(assert (= b_and!10927 (and (=> t!7104 result!4671) b_and!10929)))

(declare-fun b_lambda!7089 () Bool)

(assert (=> (not b_lambda!7089) (not b!178631)))

(assert (=> b!178631 t!7104))

(declare-fun b_and!10931 () Bool)

(assert (= b_and!10929 (and (=> t!7104 result!4671) b_and!10931)))

(assert (=> b!178624 m!206845))

(assert (=> b!178624 m!206845))

(assert (=> b!178624 m!206847))

(assert (=> b!178622 m!206845))

(assert (=> b!178622 m!206845))

(declare-fun m!206959 () Bool)

(assert (=> b!178622 m!206959))

(declare-fun m!206961 () Bool)

(assert (=> b!178627 m!206961))

(assert (=> b!178631 m!206891))

(assert (=> b!178631 m!206893))

(assert (=> b!178631 m!206895))

(declare-fun m!206963 () Bool)

(assert (=> b!178631 m!206963))

(assert (=> b!178631 m!206845))

(assert (=> b!178631 m!206891))

(declare-fun m!206965 () Bool)

(assert (=> b!178631 m!206965))

(declare-fun m!206967 () Bool)

(assert (=> b!178631 m!206967))

(assert (=> b!178631 m!206963))

(declare-fun m!206969 () Bool)

(assert (=> b!178631 m!206969))

(assert (=> b!178631 m!206893))

(assert (=> b!178630 m!206845))

(assert (=> b!178630 m!206845))

(assert (=> b!178630 m!206847))

(declare-fun m!206971 () Bool)

(assert (=> bm!18055 m!206971))

(declare-fun m!206973 () Bool)

(assert (=> d!53973 m!206973))

(assert (=> d!53973 m!206801))

(assert (=> b!178626 m!206891))

(assert (=> b!178626 m!206893))

(assert (=> b!178626 m!206895))

(assert (=> b!178626 m!206845))

(assert (=> b!178626 m!206845))

(declare-fun m!206975 () Bool)

(assert (=> b!178626 m!206975))

(assert (=> b!178626 m!206891))

(assert (=> b!178626 m!206893))

(assert (=> b!178629 m!206971))

(declare-fun m!206977 () Bool)

(assert (=> b!178632 m!206977))

(assert (=> bm!18046 d!53973))

(declare-fun b!178641 () Bool)

(declare-fun e!117744 () Bool)

(declare-fun e!117742 () Bool)

(assert (=> b!178641 (= e!117744 e!117742)))

(declare-fun lt!88286 () (_ BitVec 64))

(assert (=> b!178641 (= lt!88286 (select (arr!3563 (_keys!5546 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88287 () Unit!5444)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7517 (_ BitVec 64) (_ BitVec 32)) Unit!5444)

(assert (=> b!178641 (= lt!88287 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5546 thiss!1248) lt!88286 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7517 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!178641 (arrayContainsKey!0 (_keys!5546 thiss!1248) lt!88286 #b00000000000000000000000000000000)))

(declare-fun lt!88288 () Unit!5444)

(assert (=> b!178641 (= lt!88288 lt!88287)))

(declare-fun res!84618 () Bool)

(assert (=> b!178641 (= res!84618 (= (seekEntryOrOpen!0 (select (arr!3563 (_keys!5546 thiss!1248)) #b00000000000000000000000000000000) (_keys!5546 thiss!1248) (mask!8629 thiss!1248)) (Found!575 #b00000000000000000000000000000000)))))

(assert (=> b!178641 (=> (not res!84618) (not e!117742))))

(declare-fun d!53975 () Bool)

(declare-fun res!84617 () Bool)

(declare-fun e!117743 () Bool)

(assert (=> d!53975 (=> res!84617 e!117743)))

(assert (=> d!53975 (= res!84617 (bvsge #b00000000000000000000000000000000 (size!3869 (_keys!5546 thiss!1248))))))

(assert (=> d!53975 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5546 thiss!1248) (mask!8629 thiss!1248)) e!117743)))

(declare-fun b!178642 () Bool)

(assert (=> b!178642 (= e!117743 e!117744)))

(declare-fun c!32022 () Bool)

(assert (=> b!178642 (= c!32022 (validKeyInArray!0 (select (arr!3563 (_keys!5546 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!178643 () Bool)

(declare-fun call!18061 () Bool)

(assert (=> b!178643 (= e!117742 call!18061)))

(declare-fun bm!18058 () Bool)

(assert (=> bm!18058 (= call!18061 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5546 thiss!1248) (mask!8629 thiss!1248)))))

(declare-fun b!178644 () Bool)

(assert (=> b!178644 (= e!117744 call!18061)))

(assert (= (and d!53975 (not res!84617)) b!178642))

(assert (= (and b!178642 c!32022) b!178641))

(assert (= (and b!178642 (not c!32022)) b!178644))

(assert (= (and b!178641 res!84618) b!178643))

(assert (= (or b!178643 b!178644) bm!18058))

(assert (=> b!178641 m!206845))

(declare-fun m!206979 () Bool)

(assert (=> b!178641 m!206979))

(declare-fun m!206981 () Bool)

(assert (=> b!178641 m!206981))

(assert (=> b!178641 m!206845))

(declare-fun m!206983 () Bool)

(assert (=> b!178641 m!206983))

(assert (=> b!178642 m!206845))

(assert (=> b!178642 m!206845))

(assert (=> b!178642 m!206847))

(declare-fun m!206985 () Bool)

(assert (=> bm!18058 m!206985))

(assert (=> b!178447 d!53975))

(declare-fun d!53977 () Bool)

(assert (=> d!53977 (= (validKeyInArray!0 (select (arr!3563 (_keys!5546 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3563 (_keys!5546 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3563 (_keys!5546 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!178511 d!53977))

(declare-fun b!178655 () Bool)

(declare-fun res!84629 () Bool)

(declare-fun e!117747 () Bool)

(assert (=> b!178655 (=> (not res!84629) (not e!117747))))

(declare-fun size!3873 (LongMapFixedSize!2400) (_ BitVec 32))

(assert (=> b!178655 (= res!84629 (= (size!3873 thiss!1248) (bvadd (_size!1249 thiss!1248) (bvsdiv (bvadd (extraKeys!3406 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!178653 () Bool)

(declare-fun res!84627 () Bool)

(assert (=> b!178653 (=> (not res!84627) (not e!117747))))

(assert (=> b!178653 (= res!84627 (and (= (size!3870 (_values!3652 thiss!1248)) (bvadd (mask!8629 thiss!1248) #b00000000000000000000000000000001)) (= (size!3869 (_keys!5546 thiss!1248)) (size!3870 (_values!3652 thiss!1248))) (bvsge (_size!1249 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1249 thiss!1248) (bvadd (mask!8629 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!178656 () Bool)

(assert (=> b!178656 (= e!117747 (and (bvsge (extraKeys!3406 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3406 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1249 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun d!53979 () Bool)

(declare-fun res!84630 () Bool)

(assert (=> d!53979 (=> (not res!84630) (not e!117747))))

(assert (=> d!53979 (= res!84630 (validMask!0 (mask!8629 thiss!1248)))))

(assert (=> d!53979 (= (simpleValid!158 thiss!1248) e!117747)))

(declare-fun b!178654 () Bool)

(declare-fun res!84628 () Bool)

(assert (=> b!178654 (=> (not res!84628) (not e!117747))))

(assert (=> b!178654 (= res!84628 (bvsge (size!3873 thiss!1248) (_size!1249 thiss!1248)))))

(assert (= (and d!53979 res!84630) b!178653))

(assert (= (and b!178653 res!84627) b!178654))

(assert (= (and b!178654 res!84628) b!178655))

(assert (= (and b!178655 res!84629) b!178656))

(declare-fun m!206987 () Bool)

(assert (=> b!178655 m!206987))

(assert (=> d!53979 m!206801))

(assert (=> b!178654 m!206987))

(assert (=> d!53945 d!53979))

(assert (=> d!53955 d!53947))

(declare-fun b!178675 () Bool)

(declare-fun e!117762 () Bool)

(declare-fun e!117758 () Bool)

(assert (=> b!178675 (= e!117762 e!117758)))

(declare-fun res!84639 () Bool)

(declare-fun lt!88293 () SeekEntryResult!575)

(assert (=> b!178675 (= res!84639 (and ((_ is Intermediate!575) lt!88293) (not (undefined!1387 lt!88293)) (bvslt (x!19543 lt!88293) #b01111111111111111111111111111110) (bvsge (x!19543 lt!88293) #b00000000000000000000000000000000) (bvsge (x!19543 lt!88293) #b00000000000000000000000000000000)))))

(assert (=> b!178675 (=> (not res!84639) (not e!117758))))

(declare-fun b!178676 () Bool)

(assert (=> b!178676 (and (bvsge (index!4470 lt!88293) #b00000000000000000000000000000000) (bvslt (index!4470 lt!88293) (size!3869 (_keys!5546 thiss!1248))))))

(declare-fun res!84637 () Bool)

(assert (=> b!178676 (= res!84637 (= (select (arr!3563 (_keys!5546 thiss!1248)) (index!4470 lt!88293)) key!828))))

(declare-fun e!117759 () Bool)

(assert (=> b!178676 (=> res!84637 e!117759)))

(assert (=> b!178676 (= e!117758 e!117759)))

(declare-fun b!178678 () Bool)

(declare-fun e!117761 () SeekEntryResult!575)

(assert (=> b!178678 (= e!117761 (Intermediate!575 true (toIndex!0 key!828 (mask!8629 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!178679 () Bool)

(assert (=> b!178679 (and (bvsge (index!4470 lt!88293) #b00000000000000000000000000000000) (bvslt (index!4470 lt!88293) (size!3869 (_keys!5546 thiss!1248))))))

(declare-fun res!84638 () Bool)

(assert (=> b!178679 (= res!84638 (= (select (arr!3563 (_keys!5546 thiss!1248)) (index!4470 lt!88293)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!178679 (=> res!84638 e!117759)))

(declare-fun b!178680 () Bool)

(declare-fun e!117760 () SeekEntryResult!575)

(assert (=> b!178680 (= e!117760 (Intermediate!575 false (toIndex!0 key!828 (mask!8629 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!178681 () Bool)

(assert (=> b!178681 (= e!117761 e!117760)))

(declare-fun c!32031 () Bool)

(declare-fun lt!88294 () (_ BitVec 64))

(assert (=> b!178681 (= c!32031 (or (= lt!88294 key!828) (= (bvadd lt!88294 lt!88294) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!178682 () Bool)

(assert (=> b!178682 (= e!117760 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8629 thiss!1248)) #b00000000000000000000000000000000 (mask!8629 thiss!1248)) key!828 (_keys!5546 thiss!1248) (mask!8629 thiss!1248)))))

(declare-fun b!178683 () Bool)

(assert (=> b!178683 (and (bvsge (index!4470 lt!88293) #b00000000000000000000000000000000) (bvslt (index!4470 lt!88293) (size!3869 (_keys!5546 thiss!1248))))))

(assert (=> b!178683 (= e!117759 (= (select (arr!3563 (_keys!5546 thiss!1248)) (index!4470 lt!88293)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!53981 () Bool)

(assert (=> d!53981 e!117762))

(declare-fun c!32030 () Bool)

(assert (=> d!53981 (= c!32030 (and ((_ is Intermediate!575) lt!88293) (undefined!1387 lt!88293)))))

(assert (=> d!53981 (= lt!88293 e!117761)))

(declare-fun c!32029 () Bool)

(assert (=> d!53981 (= c!32029 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!53981 (= lt!88294 (select (arr!3563 (_keys!5546 thiss!1248)) (toIndex!0 key!828 (mask!8629 thiss!1248))))))

(assert (=> d!53981 (validMask!0 (mask!8629 thiss!1248))))

(assert (=> d!53981 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8629 thiss!1248)) key!828 (_keys!5546 thiss!1248) (mask!8629 thiss!1248)) lt!88293)))

(declare-fun b!178677 () Bool)

(assert (=> b!178677 (= e!117762 (bvsge (x!19543 lt!88293) #b01111111111111111111111111111110))))

(assert (= (and d!53981 c!32029) b!178678))

(assert (= (and d!53981 (not c!32029)) b!178681))

(assert (= (and b!178681 c!32031) b!178680))

(assert (= (and b!178681 (not c!32031)) b!178682))

(assert (= (and d!53981 c!32030) b!178677))

(assert (= (and d!53981 (not c!32030)) b!178675))

(assert (= (and b!178675 res!84639) b!178676))

(assert (= (and b!178676 (not res!84637)) b!178679))

(assert (= (and b!178679 (not res!84638)) b!178683))

(assert (=> b!178682 m!206905))

(declare-fun m!206989 () Bool)

(assert (=> b!178682 m!206989))

(assert (=> b!178682 m!206989))

(declare-fun m!206991 () Bool)

(assert (=> b!178682 m!206991))

(declare-fun m!206993 () Bool)

(assert (=> b!178683 m!206993))

(assert (=> b!178679 m!206993))

(assert (=> d!53981 m!206905))

(declare-fun m!206995 () Bool)

(assert (=> d!53981 m!206995))

(assert (=> d!53981 m!206801))

(assert (=> b!178676 m!206993))

(assert (=> d!53957 d!53981))

(declare-fun d!53983 () Bool)

(declare-fun lt!88300 () (_ BitVec 32))

(declare-fun lt!88299 () (_ BitVec 32))

(assert (=> d!53983 (= lt!88300 (bvmul (bvxor lt!88299 (bvlshr lt!88299 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!53983 (= lt!88299 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!53983 (and (bvsge (mask!8629 thiss!1248) #b00000000000000000000000000000000) (let ((res!84640 (let ((h!2885 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!19562 (bvmul (bvxor h!2885 (bvlshr h!2885 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!19562 (bvlshr x!19562 #b00000000000000000000000000001101)) (mask!8629 thiss!1248)))))) (and (bvslt res!84640 (bvadd (mask!8629 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!84640 #b00000000000000000000000000000000))))))

(assert (=> d!53983 (= (toIndex!0 key!828 (mask!8629 thiss!1248)) (bvand (bvxor lt!88300 (bvlshr lt!88300 #b00000000000000000000000000001101)) (mask!8629 thiss!1248)))))

(assert (=> d!53957 d!53983))

(assert (=> d!53957 d!53947))

(declare-fun d!53985 () Bool)

(assert (=> d!53985 (= (apply!144 lt!88228 (select (arr!3563 (_keys!5546 thiss!1248)) #b00000000000000000000000000000000)) (get!2036 (getValueByKey!199 (toList!1138 lt!88228) (select (arr!3563 (_keys!5546 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7325 () Bool)

(assert (= bs!7325 d!53985))

(assert (=> bs!7325 m!206845))

(assert (=> bs!7325 m!206949))

(assert (=> bs!7325 m!206949))

(declare-fun m!206997 () Bool)

(assert (=> bs!7325 m!206997))

(assert (=> b!178506 d!53985))

(declare-fun d!53987 () Bool)

(declare-fun c!32034 () Bool)

(assert (=> d!53987 (= c!32034 ((_ is ValueCellFull!1746) (select (arr!3564 (_values!3652 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!117765 () V!5219)

(assert (=> d!53987 (= (get!2035 (select (arr!3564 (_values!3652 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!487 (defaultEntry!3669 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!117765)))

(declare-fun b!178688 () Bool)

(declare-fun get!2037 (ValueCell!1746 V!5219) V!5219)

(assert (=> b!178688 (= e!117765 (get!2037 (select (arr!3564 (_values!3652 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!487 (defaultEntry!3669 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!178689 () Bool)

(declare-fun get!2038 (ValueCell!1746 V!5219) V!5219)

(assert (=> b!178689 (= e!117765 (get!2038 (select (arr!3564 (_values!3652 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!487 (defaultEntry!3669 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53987 c!32034) b!178688))

(assert (= (and d!53987 (not c!32034)) b!178689))

(assert (=> b!178688 m!206891))

(assert (=> b!178688 m!206893))

(declare-fun m!206999 () Bool)

(assert (=> b!178688 m!206999))

(assert (=> b!178689 m!206891))

(assert (=> b!178689 m!206893))

(declare-fun m!207001 () Bool)

(assert (=> b!178689 m!207001))

(assert (=> b!178506 d!53987))

(declare-fun b!178698 () Bool)

(declare-fun e!117770 () (_ BitVec 32))

(declare-fun call!18064 () (_ BitVec 32))

(assert (=> b!178698 (= e!117770 call!18064)))

(declare-fun b!178699 () Bool)

(declare-fun e!117771 () (_ BitVec 32))

(assert (=> b!178699 (= e!117771 e!117770)))

(declare-fun c!32040 () Bool)

(assert (=> b!178699 (= c!32040 (validKeyInArray!0 (select (arr!3563 (_keys!5546 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18061 () Bool)

(assert (=> bm!18061 (= call!18064 (arrayCountValidKeys!0 (_keys!5546 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3869 (_keys!5546 thiss!1248))))))

(declare-fun b!178700 () Bool)

(assert (=> b!178700 (= e!117770 (bvadd #b00000000000000000000000000000001 call!18064))))

(declare-fun d!53989 () Bool)

(declare-fun lt!88303 () (_ BitVec 32))

(assert (=> d!53989 (and (bvsge lt!88303 #b00000000000000000000000000000000) (bvsle lt!88303 (bvsub (size!3869 (_keys!5546 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!53989 (= lt!88303 e!117771)))

(declare-fun c!32039 () Bool)

(assert (=> d!53989 (= c!32039 (bvsge #b00000000000000000000000000000000 (size!3869 (_keys!5546 thiss!1248))))))

(assert (=> d!53989 (and (bvsle #b00000000000000000000000000000000 (size!3869 (_keys!5546 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3869 (_keys!5546 thiss!1248)) (size!3869 (_keys!5546 thiss!1248))))))

(assert (=> d!53989 (= (arrayCountValidKeys!0 (_keys!5546 thiss!1248) #b00000000000000000000000000000000 (size!3869 (_keys!5546 thiss!1248))) lt!88303)))

(declare-fun b!178701 () Bool)

(assert (=> b!178701 (= e!117771 #b00000000000000000000000000000000)))

(assert (= (and d!53989 c!32039) b!178701))

(assert (= (and d!53989 (not c!32039)) b!178699))

(assert (= (and b!178699 c!32040) b!178700))

(assert (= (and b!178699 (not c!32040)) b!178698))

(assert (= (or b!178700 b!178698) bm!18061))

(assert (=> b!178699 m!206845))

(assert (=> b!178699 m!206845))

(assert (=> b!178699 m!206847))

(declare-fun m!207003 () Bool)

(assert (=> bm!18061 m!207003))

(assert (=> b!178446 d!53989))

(declare-fun d!53991 () Bool)

(declare-fun isEmpty!452 (Option!205) Bool)

(assert (=> d!53991 (= (isDefined!152 (getValueByKey!199 (toList!1138 (getCurrentListMap!790 (_keys!5546 thiss!1248) (_values!3652 thiss!1248) (mask!8629 thiss!1248) (extraKeys!3406 thiss!1248) (zeroValue!3510 thiss!1248) (minValue!3510 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3669 thiss!1248))) key!828)) (not (isEmpty!452 (getValueByKey!199 (toList!1138 (getCurrentListMap!790 (_keys!5546 thiss!1248) (_values!3652 thiss!1248) (mask!8629 thiss!1248) (extraKeys!3406 thiss!1248) (zeroValue!3510 thiss!1248) (minValue!3510 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3669 thiss!1248))) key!828))))))

(declare-fun bs!7326 () Bool)

(assert (= bs!7326 d!53991))

(assert (=> bs!7326 m!206841))

(declare-fun m!207005 () Bool)

(assert (=> bs!7326 m!207005))

(assert (=> b!178457 d!53991))

(declare-fun b!178710 () Bool)

(declare-fun e!117776 () Option!205)

(assert (=> b!178710 (= e!117776 (Some!204 (_2!1670 (h!2883 (toList!1138 (getCurrentListMap!790 (_keys!5546 thiss!1248) (_values!3652 thiss!1248) (mask!8629 thiss!1248) (extraKeys!3406 thiss!1248) (zeroValue!3510 thiss!1248) (minValue!3510 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3669 thiss!1248)))))))))

(declare-fun b!178712 () Bool)

(declare-fun e!117777 () Option!205)

(assert (=> b!178712 (= e!117777 (getValueByKey!199 (t!7102 (toList!1138 (getCurrentListMap!790 (_keys!5546 thiss!1248) (_values!3652 thiss!1248) (mask!8629 thiss!1248) (extraKeys!3406 thiss!1248) (zeroValue!3510 thiss!1248) (minValue!3510 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3669 thiss!1248)))) key!828))))

(declare-fun d!53993 () Bool)

(declare-fun c!32045 () Bool)

(assert (=> d!53993 (= c!32045 (and ((_ is Cons!2260) (toList!1138 (getCurrentListMap!790 (_keys!5546 thiss!1248) (_values!3652 thiss!1248) (mask!8629 thiss!1248) (extraKeys!3406 thiss!1248) (zeroValue!3510 thiss!1248) (minValue!3510 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3669 thiss!1248)))) (= (_1!1670 (h!2883 (toList!1138 (getCurrentListMap!790 (_keys!5546 thiss!1248) (_values!3652 thiss!1248) (mask!8629 thiss!1248) (extraKeys!3406 thiss!1248) (zeroValue!3510 thiss!1248) (minValue!3510 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3669 thiss!1248))))) key!828)))))

(assert (=> d!53993 (= (getValueByKey!199 (toList!1138 (getCurrentListMap!790 (_keys!5546 thiss!1248) (_values!3652 thiss!1248) (mask!8629 thiss!1248) (extraKeys!3406 thiss!1248) (zeroValue!3510 thiss!1248) (minValue!3510 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3669 thiss!1248))) key!828) e!117776)))

(declare-fun b!178711 () Bool)

(assert (=> b!178711 (= e!117776 e!117777)))

(declare-fun c!32046 () Bool)

(assert (=> b!178711 (= c!32046 (and ((_ is Cons!2260) (toList!1138 (getCurrentListMap!790 (_keys!5546 thiss!1248) (_values!3652 thiss!1248) (mask!8629 thiss!1248) (extraKeys!3406 thiss!1248) (zeroValue!3510 thiss!1248) (minValue!3510 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3669 thiss!1248)))) (not (= (_1!1670 (h!2883 (toList!1138 (getCurrentListMap!790 (_keys!5546 thiss!1248) (_values!3652 thiss!1248) (mask!8629 thiss!1248) (extraKeys!3406 thiss!1248) (zeroValue!3510 thiss!1248) (minValue!3510 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3669 thiss!1248))))) key!828))))))

(declare-fun b!178713 () Bool)

(assert (=> b!178713 (= e!117777 None!203)))

(assert (= (and d!53993 c!32045) b!178710))

(assert (= (and d!53993 (not c!32045)) b!178711))

(assert (= (and b!178711 c!32046) b!178712))

(assert (= (and b!178711 (not c!32046)) b!178713))

(declare-fun m!207007 () Bool)

(assert (=> b!178712 m!207007))

(assert (=> b!178457 d!53993))

(assert (=> b!178512 d!53977))

(declare-fun d!53995 () Bool)

(assert (=> d!53995 (isDefined!152 (getValueByKey!199 (toList!1138 (getCurrentListMap!790 (_keys!5546 thiss!1248) (_values!3652 thiss!1248) (mask!8629 thiss!1248) (extraKeys!3406 thiss!1248) (zeroValue!3510 thiss!1248) (minValue!3510 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3669 thiss!1248))) key!828))))

(declare-fun lt!88306 () Unit!5444)

(declare-fun choose!952 (List!2264 (_ BitVec 64)) Unit!5444)

(assert (=> d!53995 (= lt!88306 (choose!952 (toList!1138 (getCurrentListMap!790 (_keys!5546 thiss!1248) (_values!3652 thiss!1248) (mask!8629 thiss!1248) (extraKeys!3406 thiss!1248) (zeroValue!3510 thiss!1248) (minValue!3510 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3669 thiss!1248))) key!828))))

(declare-fun e!117780 () Bool)

(assert (=> d!53995 e!117780))

(declare-fun res!84643 () Bool)

(assert (=> d!53995 (=> (not res!84643) (not e!117780))))

(declare-fun isStrictlySorted!339 (List!2264) Bool)

(assert (=> d!53995 (= res!84643 (isStrictlySorted!339 (toList!1138 (getCurrentListMap!790 (_keys!5546 thiss!1248) (_values!3652 thiss!1248) (mask!8629 thiss!1248) (extraKeys!3406 thiss!1248) (zeroValue!3510 thiss!1248) (minValue!3510 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3669 thiss!1248)))))))

(assert (=> d!53995 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!151 (toList!1138 (getCurrentListMap!790 (_keys!5546 thiss!1248) (_values!3652 thiss!1248) (mask!8629 thiss!1248) (extraKeys!3406 thiss!1248) (zeroValue!3510 thiss!1248) (minValue!3510 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3669 thiss!1248))) key!828) lt!88306)))

(declare-fun b!178716 () Bool)

(assert (=> b!178716 (= e!117780 (containsKey!203 (toList!1138 (getCurrentListMap!790 (_keys!5546 thiss!1248) (_values!3652 thiss!1248) (mask!8629 thiss!1248) (extraKeys!3406 thiss!1248) (zeroValue!3510 thiss!1248) (minValue!3510 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3669 thiss!1248))) key!828))))

(assert (= (and d!53995 res!84643) b!178716))

(assert (=> d!53995 m!206841))

(assert (=> d!53995 m!206841))

(assert (=> d!53995 m!206843))

(declare-fun m!207009 () Bool)

(assert (=> d!53995 m!207009))

(declare-fun m!207011 () Bool)

(assert (=> d!53995 m!207011))

(assert (=> b!178716 m!206837))

(assert (=> b!178455 d!53995))

(assert (=> b!178455 d!53991))

(assert (=> b!178455 d!53993))

(declare-fun d!53997 () Bool)

(declare-fun e!117783 () Bool)

(assert (=> d!53997 e!117783))

(declare-fun res!84648 () Bool)

(assert (=> d!53997 (=> (not res!84648) (not e!117783))))

(declare-fun lt!88316 () ListLongMap!2245)

(assert (=> d!53997 (= res!84648 (contains!1208 lt!88316 (_1!1670 (ite (or c!31981 c!31983) (tuple2!3319 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3510 thiss!1248)) (tuple2!3319 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3510 thiss!1248))))))))

(declare-fun lt!88318 () List!2264)

(assert (=> d!53997 (= lt!88316 (ListLongMap!2246 lt!88318))))

(declare-fun lt!88317 () Unit!5444)

(declare-fun lt!88315 () Unit!5444)

(assert (=> d!53997 (= lt!88317 lt!88315)))

(assert (=> d!53997 (= (getValueByKey!199 lt!88318 (_1!1670 (ite (or c!31981 c!31983) (tuple2!3319 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3510 thiss!1248)) (tuple2!3319 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3510 thiss!1248))))) (Some!204 (_2!1670 (ite (or c!31981 c!31983) (tuple2!3319 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3510 thiss!1248)) (tuple2!3319 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3510 thiss!1248))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!105 (List!2264 (_ BitVec 64) V!5219) Unit!5444)

(assert (=> d!53997 (= lt!88315 (lemmaContainsTupThenGetReturnValue!105 lt!88318 (_1!1670 (ite (or c!31981 c!31983) (tuple2!3319 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3510 thiss!1248)) (tuple2!3319 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3510 thiss!1248)))) (_2!1670 (ite (or c!31981 c!31983) (tuple2!3319 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3510 thiss!1248)) (tuple2!3319 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3510 thiss!1248))))))))

(declare-fun insertStrictlySorted!108 (List!2264 (_ BitVec 64) V!5219) List!2264)

(assert (=> d!53997 (= lt!88318 (insertStrictlySorted!108 (toList!1138 (ite c!31981 call!18046 (ite c!31983 call!18051 call!18048))) (_1!1670 (ite (or c!31981 c!31983) (tuple2!3319 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3510 thiss!1248)) (tuple2!3319 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3510 thiss!1248)))) (_2!1670 (ite (or c!31981 c!31983) (tuple2!3319 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3510 thiss!1248)) (tuple2!3319 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3510 thiss!1248))))))))

(assert (=> d!53997 (= (+!261 (ite c!31981 call!18046 (ite c!31983 call!18051 call!18048)) (ite (or c!31981 c!31983) (tuple2!3319 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3510 thiss!1248)) (tuple2!3319 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3510 thiss!1248)))) lt!88316)))

(declare-fun b!178721 () Bool)

(declare-fun res!84649 () Bool)

(assert (=> b!178721 (=> (not res!84649) (not e!117783))))

(assert (=> b!178721 (= res!84649 (= (getValueByKey!199 (toList!1138 lt!88316) (_1!1670 (ite (or c!31981 c!31983) (tuple2!3319 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3510 thiss!1248)) (tuple2!3319 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3510 thiss!1248))))) (Some!204 (_2!1670 (ite (or c!31981 c!31983) (tuple2!3319 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3510 thiss!1248)) (tuple2!3319 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3510 thiss!1248)))))))))

(declare-fun b!178722 () Bool)

(declare-fun contains!1210 (List!2264 tuple2!3318) Bool)

(assert (=> b!178722 (= e!117783 (contains!1210 (toList!1138 lt!88316) (ite (or c!31981 c!31983) (tuple2!3319 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3510 thiss!1248)) (tuple2!3319 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3510 thiss!1248)))))))

(assert (= (and d!53997 res!84648) b!178721))

(assert (= (and b!178721 res!84649) b!178722))

(declare-fun m!207013 () Bool)

(assert (=> d!53997 m!207013))

(declare-fun m!207015 () Bool)

(assert (=> d!53997 m!207015))

(declare-fun m!207017 () Bool)

(assert (=> d!53997 m!207017))

(declare-fun m!207019 () Bool)

(assert (=> d!53997 m!207019))

(declare-fun m!207021 () Bool)

(assert (=> b!178721 m!207021))

(declare-fun m!207023 () Bool)

(assert (=> b!178722 m!207023))

(assert (=> bm!18049 d!53997))

(declare-fun d!53999 () Bool)

(assert (=> d!53999 (= (apply!144 lt!88228 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2036 (getValueByKey!199 (toList!1138 lt!88228) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7327 () Bool)

(assert (= bs!7327 d!53999))

(assert (=> bs!7327 m!206923))

(assert (=> bs!7327 m!206923))

(declare-fun m!207025 () Bool)

(assert (=> bs!7327 m!207025))

(assert (=> b!178520 d!53999))

(declare-fun d!54001 () Bool)

(assert (=> d!54001 (= (apply!144 lt!88231 lt!88215) (get!2036 (getValueByKey!199 (toList!1138 lt!88231) lt!88215)))))

(declare-fun bs!7328 () Bool)

(assert (= bs!7328 d!54001))

(declare-fun m!207027 () Bool)

(assert (=> bs!7328 m!207027))

(assert (=> bs!7328 m!207027))

(declare-fun m!207029 () Bool)

(assert (=> bs!7328 m!207029))

(assert (=> b!178508 d!54001))

(assert (=> b!178508 d!53973))

(declare-fun d!54003 () Bool)

(declare-fun e!117784 () Bool)

(assert (=> d!54003 e!117784))

(declare-fun res!84650 () Bool)

(assert (=> d!54003 (=> (not res!84650) (not e!117784))))

(declare-fun lt!88320 () ListLongMap!2245)

(assert (=> d!54003 (= res!84650 (contains!1208 lt!88320 (_1!1670 (tuple2!3319 lt!88221 (zeroValue!3510 thiss!1248)))))))

(declare-fun lt!88322 () List!2264)

(assert (=> d!54003 (= lt!88320 (ListLongMap!2246 lt!88322))))

(declare-fun lt!88321 () Unit!5444)

(declare-fun lt!88319 () Unit!5444)

(assert (=> d!54003 (= lt!88321 lt!88319)))

(assert (=> d!54003 (= (getValueByKey!199 lt!88322 (_1!1670 (tuple2!3319 lt!88221 (zeroValue!3510 thiss!1248)))) (Some!204 (_2!1670 (tuple2!3319 lt!88221 (zeroValue!3510 thiss!1248)))))))

(assert (=> d!54003 (= lt!88319 (lemmaContainsTupThenGetReturnValue!105 lt!88322 (_1!1670 (tuple2!3319 lt!88221 (zeroValue!3510 thiss!1248))) (_2!1670 (tuple2!3319 lt!88221 (zeroValue!3510 thiss!1248)))))))

(assert (=> d!54003 (= lt!88322 (insertStrictlySorted!108 (toList!1138 lt!88227) (_1!1670 (tuple2!3319 lt!88221 (zeroValue!3510 thiss!1248))) (_2!1670 (tuple2!3319 lt!88221 (zeroValue!3510 thiss!1248)))))))

(assert (=> d!54003 (= (+!261 lt!88227 (tuple2!3319 lt!88221 (zeroValue!3510 thiss!1248))) lt!88320)))

(declare-fun b!178723 () Bool)

(declare-fun res!84651 () Bool)

(assert (=> b!178723 (=> (not res!84651) (not e!117784))))

(assert (=> b!178723 (= res!84651 (= (getValueByKey!199 (toList!1138 lt!88320) (_1!1670 (tuple2!3319 lt!88221 (zeroValue!3510 thiss!1248)))) (Some!204 (_2!1670 (tuple2!3319 lt!88221 (zeroValue!3510 thiss!1248))))))))

(declare-fun b!178724 () Bool)

(assert (=> b!178724 (= e!117784 (contains!1210 (toList!1138 lt!88320) (tuple2!3319 lt!88221 (zeroValue!3510 thiss!1248))))))

(assert (= (and d!54003 res!84650) b!178723))

(assert (= (and b!178723 res!84651) b!178724))

(declare-fun m!207031 () Bool)

(assert (=> d!54003 m!207031))

(declare-fun m!207033 () Bool)

(assert (=> d!54003 m!207033))

(declare-fun m!207035 () Bool)

(assert (=> d!54003 m!207035))

(declare-fun m!207037 () Bool)

(assert (=> d!54003 m!207037))

(declare-fun m!207039 () Bool)

(assert (=> b!178723 m!207039))

(declare-fun m!207041 () Bool)

(assert (=> b!178724 m!207041))

(assert (=> b!178508 d!54003))

(declare-fun d!54005 () Bool)

(declare-fun e!117785 () Bool)

(assert (=> d!54005 e!117785))

(declare-fun res!84652 () Bool)

(assert (=> d!54005 (=> (not res!84652) (not e!117785))))

(declare-fun lt!88324 () ListLongMap!2245)

(assert (=> d!54005 (= res!84652 (contains!1208 lt!88324 (_1!1670 (tuple2!3319 lt!88216 (minValue!3510 thiss!1248)))))))

(declare-fun lt!88326 () List!2264)

(assert (=> d!54005 (= lt!88324 (ListLongMap!2246 lt!88326))))

(declare-fun lt!88325 () Unit!5444)

(declare-fun lt!88323 () Unit!5444)

(assert (=> d!54005 (= lt!88325 lt!88323)))

(assert (=> d!54005 (= (getValueByKey!199 lt!88326 (_1!1670 (tuple2!3319 lt!88216 (minValue!3510 thiss!1248)))) (Some!204 (_2!1670 (tuple2!3319 lt!88216 (minValue!3510 thiss!1248)))))))

(assert (=> d!54005 (= lt!88323 (lemmaContainsTupThenGetReturnValue!105 lt!88326 (_1!1670 (tuple2!3319 lt!88216 (minValue!3510 thiss!1248))) (_2!1670 (tuple2!3319 lt!88216 (minValue!3510 thiss!1248)))))))

(assert (=> d!54005 (= lt!88326 (insertStrictlySorted!108 (toList!1138 lt!88231) (_1!1670 (tuple2!3319 lt!88216 (minValue!3510 thiss!1248))) (_2!1670 (tuple2!3319 lt!88216 (minValue!3510 thiss!1248)))))))

(assert (=> d!54005 (= (+!261 lt!88231 (tuple2!3319 lt!88216 (minValue!3510 thiss!1248))) lt!88324)))

(declare-fun b!178725 () Bool)

(declare-fun res!84653 () Bool)

(assert (=> b!178725 (=> (not res!84653) (not e!117785))))

(assert (=> b!178725 (= res!84653 (= (getValueByKey!199 (toList!1138 lt!88324) (_1!1670 (tuple2!3319 lt!88216 (minValue!3510 thiss!1248)))) (Some!204 (_2!1670 (tuple2!3319 lt!88216 (minValue!3510 thiss!1248))))))))

(declare-fun b!178726 () Bool)

(assert (=> b!178726 (= e!117785 (contains!1210 (toList!1138 lt!88324) (tuple2!3319 lt!88216 (minValue!3510 thiss!1248))))))

(assert (= (and d!54005 res!84652) b!178725))

(assert (= (and b!178725 res!84653) b!178726))

(declare-fun m!207043 () Bool)

(assert (=> d!54005 m!207043))

(declare-fun m!207045 () Bool)

(assert (=> d!54005 m!207045))

(declare-fun m!207047 () Bool)

(assert (=> d!54005 m!207047))

(declare-fun m!207049 () Bool)

(assert (=> d!54005 m!207049))

(declare-fun m!207051 () Bool)

(assert (=> b!178725 m!207051))

(declare-fun m!207053 () Bool)

(assert (=> b!178726 m!207053))

(assert (=> b!178508 d!54005))

(declare-fun d!54007 () Bool)

(assert (=> d!54007 (= (apply!144 (+!261 lt!88227 (tuple2!3319 lt!88221 (zeroValue!3510 thiss!1248))) lt!88219) (get!2036 (getValueByKey!199 (toList!1138 (+!261 lt!88227 (tuple2!3319 lt!88221 (zeroValue!3510 thiss!1248)))) lt!88219)))))

(declare-fun bs!7329 () Bool)

(assert (= bs!7329 d!54007))

(declare-fun m!207055 () Bool)

(assert (=> bs!7329 m!207055))

(assert (=> bs!7329 m!207055))

(declare-fun m!207057 () Bool)

(assert (=> bs!7329 m!207057))

(assert (=> b!178508 d!54007))

(declare-fun d!54009 () Bool)

(declare-fun e!117786 () Bool)

(assert (=> d!54009 e!117786))

(declare-fun res!84654 () Bool)

(assert (=> d!54009 (=> (not res!84654) (not e!117786))))

(declare-fun lt!88328 () ListLongMap!2245)

(assert (=> d!54009 (= res!84654 (contains!1208 lt!88328 (_1!1670 (tuple2!3319 lt!88224 (minValue!3510 thiss!1248)))))))

(declare-fun lt!88330 () List!2264)

(assert (=> d!54009 (= lt!88328 (ListLongMap!2246 lt!88330))))

(declare-fun lt!88329 () Unit!5444)

(declare-fun lt!88327 () Unit!5444)

(assert (=> d!54009 (= lt!88329 lt!88327)))

(assert (=> d!54009 (= (getValueByKey!199 lt!88330 (_1!1670 (tuple2!3319 lt!88224 (minValue!3510 thiss!1248)))) (Some!204 (_2!1670 (tuple2!3319 lt!88224 (minValue!3510 thiss!1248)))))))

(assert (=> d!54009 (= lt!88327 (lemmaContainsTupThenGetReturnValue!105 lt!88330 (_1!1670 (tuple2!3319 lt!88224 (minValue!3510 thiss!1248))) (_2!1670 (tuple2!3319 lt!88224 (minValue!3510 thiss!1248)))))))

(assert (=> d!54009 (= lt!88330 (insertStrictlySorted!108 (toList!1138 lt!88225) (_1!1670 (tuple2!3319 lt!88224 (minValue!3510 thiss!1248))) (_2!1670 (tuple2!3319 lt!88224 (minValue!3510 thiss!1248)))))))

(assert (=> d!54009 (= (+!261 lt!88225 (tuple2!3319 lt!88224 (minValue!3510 thiss!1248))) lt!88328)))

(declare-fun b!178727 () Bool)

(declare-fun res!84655 () Bool)

(assert (=> b!178727 (=> (not res!84655) (not e!117786))))

(assert (=> b!178727 (= res!84655 (= (getValueByKey!199 (toList!1138 lt!88328) (_1!1670 (tuple2!3319 lt!88224 (minValue!3510 thiss!1248)))) (Some!204 (_2!1670 (tuple2!3319 lt!88224 (minValue!3510 thiss!1248))))))))

(declare-fun b!178728 () Bool)

(assert (=> b!178728 (= e!117786 (contains!1210 (toList!1138 lt!88328) (tuple2!3319 lt!88224 (minValue!3510 thiss!1248))))))

(assert (= (and d!54009 res!84654) b!178727))

(assert (= (and b!178727 res!84655) b!178728))

(declare-fun m!207059 () Bool)

(assert (=> d!54009 m!207059))

(declare-fun m!207061 () Bool)

(assert (=> d!54009 m!207061))

(declare-fun m!207063 () Bool)

(assert (=> d!54009 m!207063))

(declare-fun m!207065 () Bool)

(assert (=> d!54009 m!207065))

(declare-fun m!207067 () Bool)

(assert (=> b!178727 m!207067))

(declare-fun m!207069 () Bool)

(assert (=> b!178728 m!207069))

(assert (=> b!178508 d!54009))

(declare-fun d!54011 () Bool)

(assert (=> d!54011 (= (apply!144 (+!261 lt!88227 (tuple2!3319 lt!88221 (zeroValue!3510 thiss!1248))) lt!88219) (apply!144 lt!88227 lt!88219))))

(declare-fun lt!88333 () Unit!5444)

(declare-fun choose!953 (ListLongMap!2245 (_ BitVec 64) V!5219 (_ BitVec 64)) Unit!5444)

(assert (=> d!54011 (= lt!88333 (choose!953 lt!88227 lt!88221 (zeroValue!3510 thiss!1248) lt!88219))))

(declare-fun e!117789 () Bool)

(assert (=> d!54011 e!117789))

(declare-fun res!84658 () Bool)

(assert (=> d!54011 (=> (not res!84658) (not e!117789))))

(assert (=> d!54011 (= res!84658 (contains!1208 lt!88227 lt!88219))))

(assert (=> d!54011 (= (addApplyDifferent!120 lt!88227 lt!88221 (zeroValue!3510 thiss!1248) lt!88219) lt!88333)))

(declare-fun b!178732 () Bool)

(assert (=> b!178732 (= e!117789 (not (= lt!88219 lt!88221)))))

(assert (= (and d!54011 res!84658) b!178732))

(assert (=> d!54011 m!206863))

(declare-fun m!207071 () Bool)

(assert (=> d!54011 m!207071))

(assert (=> d!54011 m!206863))

(assert (=> d!54011 m!206877))

(assert (=> d!54011 m!206865))

(declare-fun m!207073 () Bool)

(assert (=> d!54011 m!207073))

(assert (=> b!178508 d!54011))

(declare-fun d!54013 () Bool)

(assert (=> d!54013 (= (apply!144 (+!261 lt!88225 (tuple2!3319 lt!88224 (minValue!3510 thiss!1248))) lt!88217) (get!2036 (getValueByKey!199 (toList!1138 (+!261 lt!88225 (tuple2!3319 lt!88224 (minValue!3510 thiss!1248)))) lt!88217)))))

(declare-fun bs!7330 () Bool)

(assert (= bs!7330 d!54013))

(declare-fun m!207075 () Bool)

(assert (=> bs!7330 m!207075))

(assert (=> bs!7330 m!207075))

(declare-fun m!207077 () Bool)

(assert (=> bs!7330 m!207077))

(assert (=> b!178508 d!54013))

(declare-fun d!54015 () Bool)

(declare-fun e!117790 () Bool)

(assert (=> d!54015 e!117790))

(declare-fun res!84659 () Bool)

(assert (=> d!54015 (=> res!84659 e!117790)))

(declare-fun lt!88334 () Bool)

(assert (=> d!54015 (= res!84659 (not lt!88334))))

(declare-fun lt!88335 () Bool)

(assert (=> d!54015 (= lt!88334 lt!88335)))

(declare-fun lt!88337 () Unit!5444)

(declare-fun e!117791 () Unit!5444)

(assert (=> d!54015 (= lt!88337 e!117791)))

(declare-fun c!32047 () Bool)

(assert (=> d!54015 (= c!32047 lt!88335)))

(assert (=> d!54015 (= lt!88335 (containsKey!203 (toList!1138 (+!261 lt!88210 (tuple2!3319 lt!88230 (zeroValue!3510 thiss!1248)))) lt!88211))))

(assert (=> d!54015 (= (contains!1208 (+!261 lt!88210 (tuple2!3319 lt!88230 (zeroValue!3510 thiss!1248))) lt!88211) lt!88334)))

(declare-fun b!178733 () Bool)

(declare-fun lt!88336 () Unit!5444)

(assert (=> b!178733 (= e!117791 lt!88336)))

(assert (=> b!178733 (= lt!88336 (lemmaContainsKeyImpliesGetValueByKeyDefined!151 (toList!1138 (+!261 lt!88210 (tuple2!3319 lt!88230 (zeroValue!3510 thiss!1248)))) lt!88211))))

(assert (=> b!178733 (isDefined!152 (getValueByKey!199 (toList!1138 (+!261 lt!88210 (tuple2!3319 lt!88230 (zeroValue!3510 thiss!1248)))) lt!88211))))

(declare-fun b!178734 () Bool)

(declare-fun Unit!5451 () Unit!5444)

(assert (=> b!178734 (= e!117791 Unit!5451)))

(declare-fun b!178735 () Bool)

(assert (=> b!178735 (= e!117790 (isDefined!152 (getValueByKey!199 (toList!1138 (+!261 lt!88210 (tuple2!3319 lt!88230 (zeroValue!3510 thiss!1248)))) lt!88211)))))

(assert (= (and d!54015 c!32047) b!178733))

(assert (= (and d!54015 (not c!32047)) b!178734))

(assert (= (and d!54015 (not res!84659)) b!178735))

(declare-fun m!207079 () Bool)

(assert (=> d!54015 m!207079))

(declare-fun m!207081 () Bool)

(assert (=> b!178733 m!207081))

(declare-fun m!207083 () Bool)

(assert (=> b!178733 m!207083))

(assert (=> b!178733 m!207083))

(declare-fun m!207085 () Bool)

(assert (=> b!178733 m!207085))

(assert (=> b!178735 m!207083))

(assert (=> b!178735 m!207083))

(assert (=> b!178735 m!207085))

(assert (=> b!178508 d!54015))

(declare-fun d!54017 () Bool)

(assert (=> d!54017 (= (apply!144 lt!88227 lt!88219) (get!2036 (getValueByKey!199 (toList!1138 lt!88227) lt!88219)))))

(declare-fun bs!7331 () Bool)

(assert (= bs!7331 d!54017))

(declare-fun m!207087 () Bool)

(assert (=> bs!7331 m!207087))

(assert (=> bs!7331 m!207087))

(declare-fun m!207089 () Bool)

(assert (=> bs!7331 m!207089))

(assert (=> b!178508 d!54017))

(declare-fun d!54019 () Bool)

(assert (=> d!54019 (= (apply!144 lt!88225 lt!88217) (get!2036 (getValueByKey!199 (toList!1138 lt!88225) lt!88217)))))

(declare-fun bs!7332 () Bool)

(assert (= bs!7332 d!54019))

(declare-fun m!207091 () Bool)

(assert (=> bs!7332 m!207091))

(assert (=> bs!7332 m!207091))

(declare-fun m!207093 () Bool)

(assert (=> bs!7332 m!207093))

(assert (=> b!178508 d!54019))

(declare-fun d!54021 () Bool)

(assert (=> d!54021 (contains!1208 (+!261 lt!88210 (tuple2!3319 lt!88230 (zeroValue!3510 thiss!1248))) lt!88211)))

(declare-fun lt!88340 () Unit!5444)

(declare-fun choose!954 (ListLongMap!2245 (_ BitVec 64) V!5219 (_ BitVec 64)) Unit!5444)

(assert (=> d!54021 (= lt!88340 (choose!954 lt!88210 lt!88230 (zeroValue!3510 thiss!1248) lt!88211))))

(assert (=> d!54021 (contains!1208 lt!88210 lt!88211)))

(assert (=> d!54021 (= (addStillContains!120 lt!88210 lt!88230 (zeroValue!3510 thiss!1248) lt!88211) lt!88340)))

(declare-fun bs!7333 () Bool)

(assert (= bs!7333 d!54021))

(assert (=> bs!7333 m!206867))

(assert (=> bs!7333 m!206867))

(assert (=> bs!7333 m!206885))

(declare-fun m!207095 () Bool)

(assert (=> bs!7333 m!207095))

(declare-fun m!207097 () Bool)

(assert (=> bs!7333 m!207097))

(assert (=> b!178508 d!54021))

(declare-fun d!54023 () Bool)

(assert (=> d!54023 (= (apply!144 (+!261 lt!88231 (tuple2!3319 lt!88216 (minValue!3510 thiss!1248))) lt!88215) (apply!144 lt!88231 lt!88215))))

(declare-fun lt!88341 () Unit!5444)

(assert (=> d!54023 (= lt!88341 (choose!953 lt!88231 lt!88216 (minValue!3510 thiss!1248) lt!88215))))

(declare-fun e!117792 () Bool)

(assert (=> d!54023 e!117792))

(declare-fun res!84660 () Bool)

(assert (=> d!54023 (=> (not res!84660) (not e!117792))))

(assert (=> d!54023 (= res!84660 (contains!1208 lt!88231 lt!88215))))

(assert (=> d!54023 (= (addApplyDifferent!120 lt!88231 lt!88216 (minValue!3510 thiss!1248) lt!88215) lt!88341)))

(declare-fun b!178737 () Bool)

(assert (=> b!178737 (= e!117792 (not (= lt!88215 lt!88216)))))

(assert (= (and d!54023 res!84660) b!178737))

(assert (=> d!54023 m!206873))

(declare-fun m!207099 () Bool)

(assert (=> d!54023 m!207099))

(assert (=> d!54023 m!206873))

(assert (=> d!54023 m!206875))

(assert (=> d!54023 m!206881))

(declare-fun m!207101 () Bool)

(assert (=> d!54023 m!207101))

(assert (=> b!178508 d!54023))

(declare-fun d!54025 () Bool)

(assert (=> d!54025 (= (apply!144 (+!261 lt!88225 (tuple2!3319 lt!88224 (minValue!3510 thiss!1248))) lt!88217) (apply!144 lt!88225 lt!88217))))

(declare-fun lt!88342 () Unit!5444)

(assert (=> d!54025 (= lt!88342 (choose!953 lt!88225 lt!88224 (minValue!3510 thiss!1248) lt!88217))))

(declare-fun e!117793 () Bool)

(assert (=> d!54025 e!117793))

(declare-fun res!84661 () Bool)

(assert (=> d!54025 (=> (not res!84661) (not e!117793))))

(assert (=> d!54025 (= res!84661 (contains!1208 lt!88225 lt!88217))))

(assert (=> d!54025 (= (addApplyDifferent!120 lt!88225 lt!88224 (minValue!3510 thiss!1248) lt!88217) lt!88342)))

(declare-fun b!178738 () Bool)

(assert (=> b!178738 (= e!117793 (not (= lt!88217 lt!88224)))))

(assert (= (and d!54025 res!84661) b!178738))

(assert (=> d!54025 m!206859))

(declare-fun m!207103 () Bool)

(assert (=> d!54025 m!207103))

(assert (=> d!54025 m!206859))

(assert (=> d!54025 m!206861))

(assert (=> d!54025 m!206887))

(declare-fun m!207105 () Bool)

(assert (=> d!54025 m!207105))

(assert (=> b!178508 d!54025))

(declare-fun d!54027 () Bool)

(assert (=> d!54027 (= (apply!144 (+!261 lt!88231 (tuple2!3319 lt!88216 (minValue!3510 thiss!1248))) lt!88215) (get!2036 (getValueByKey!199 (toList!1138 (+!261 lt!88231 (tuple2!3319 lt!88216 (minValue!3510 thiss!1248)))) lt!88215)))))

(declare-fun bs!7334 () Bool)

(assert (= bs!7334 d!54027))

(declare-fun m!207107 () Bool)

(assert (=> bs!7334 m!207107))

(assert (=> bs!7334 m!207107))

(declare-fun m!207109 () Bool)

(assert (=> bs!7334 m!207109))

(assert (=> b!178508 d!54027))

(declare-fun d!54029 () Bool)

(declare-fun e!117794 () Bool)

(assert (=> d!54029 e!117794))

(declare-fun res!84662 () Bool)

(assert (=> d!54029 (=> (not res!84662) (not e!117794))))

(declare-fun lt!88344 () ListLongMap!2245)

(assert (=> d!54029 (= res!84662 (contains!1208 lt!88344 (_1!1670 (tuple2!3319 lt!88230 (zeroValue!3510 thiss!1248)))))))

(declare-fun lt!88346 () List!2264)

(assert (=> d!54029 (= lt!88344 (ListLongMap!2246 lt!88346))))

(declare-fun lt!88345 () Unit!5444)

(declare-fun lt!88343 () Unit!5444)

(assert (=> d!54029 (= lt!88345 lt!88343)))

(assert (=> d!54029 (= (getValueByKey!199 lt!88346 (_1!1670 (tuple2!3319 lt!88230 (zeroValue!3510 thiss!1248)))) (Some!204 (_2!1670 (tuple2!3319 lt!88230 (zeroValue!3510 thiss!1248)))))))

(assert (=> d!54029 (= lt!88343 (lemmaContainsTupThenGetReturnValue!105 lt!88346 (_1!1670 (tuple2!3319 lt!88230 (zeroValue!3510 thiss!1248))) (_2!1670 (tuple2!3319 lt!88230 (zeroValue!3510 thiss!1248)))))))

(assert (=> d!54029 (= lt!88346 (insertStrictlySorted!108 (toList!1138 lt!88210) (_1!1670 (tuple2!3319 lt!88230 (zeroValue!3510 thiss!1248))) (_2!1670 (tuple2!3319 lt!88230 (zeroValue!3510 thiss!1248)))))))

(assert (=> d!54029 (= (+!261 lt!88210 (tuple2!3319 lt!88230 (zeroValue!3510 thiss!1248))) lt!88344)))

(declare-fun b!178739 () Bool)

(declare-fun res!84663 () Bool)

(assert (=> b!178739 (=> (not res!84663) (not e!117794))))

(assert (=> b!178739 (= res!84663 (= (getValueByKey!199 (toList!1138 lt!88344) (_1!1670 (tuple2!3319 lt!88230 (zeroValue!3510 thiss!1248)))) (Some!204 (_2!1670 (tuple2!3319 lt!88230 (zeroValue!3510 thiss!1248))))))))

(declare-fun b!178740 () Bool)

(assert (=> b!178740 (= e!117794 (contains!1210 (toList!1138 lt!88344) (tuple2!3319 lt!88230 (zeroValue!3510 thiss!1248))))))

(assert (= (and d!54029 res!84662) b!178739))

(assert (= (and b!178739 res!84663) b!178740))

(declare-fun m!207111 () Bool)

(assert (=> d!54029 m!207111))

(declare-fun m!207113 () Bool)

(assert (=> d!54029 m!207113))

(declare-fun m!207115 () Bool)

(assert (=> d!54029 m!207115))

(declare-fun m!207117 () Bool)

(assert (=> d!54029 m!207117))

(declare-fun m!207119 () Bool)

(assert (=> b!178739 m!207119))

(declare-fun m!207121 () Bool)

(assert (=> b!178740 m!207121))

(assert (=> b!178508 d!54029))

(declare-fun d!54031 () Bool)

(declare-fun e!117795 () Bool)

(assert (=> d!54031 e!117795))

(declare-fun res!84664 () Bool)

(assert (=> d!54031 (=> (not res!84664) (not e!117795))))

(declare-fun lt!88348 () ListLongMap!2245)

(assert (=> d!54031 (= res!84664 (contains!1208 lt!88348 (_1!1670 (tuple2!3319 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3510 thiss!1248)))))))

(declare-fun lt!88350 () List!2264)

(assert (=> d!54031 (= lt!88348 (ListLongMap!2246 lt!88350))))

(declare-fun lt!88349 () Unit!5444)

(declare-fun lt!88347 () Unit!5444)

(assert (=> d!54031 (= lt!88349 lt!88347)))

(assert (=> d!54031 (= (getValueByKey!199 lt!88350 (_1!1670 (tuple2!3319 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3510 thiss!1248)))) (Some!204 (_2!1670 (tuple2!3319 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3510 thiss!1248)))))))

(assert (=> d!54031 (= lt!88347 (lemmaContainsTupThenGetReturnValue!105 lt!88350 (_1!1670 (tuple2!3319 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3510 thiss!1248))) (_2!1670 (tuple2!3319 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3510 thiss!1248)))))))

(assert (=> d!54031 (= lt!88350 (insertStrictlySorted!108 (toList!1138 call!18050) (_1!1670 (tuple2!3319 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3510 thiss!1248))) (_2!1670 (tuple2!3319 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3510 thiss!1248)))))))

(assert (=> d!54031 (= (+!261 call!18050 (tuple2!3319 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3510 thiss!1248))) lt!88348)))

(declare-fun b!178741 () Bool)

(declare-fun res!84665 () Bool)

(assert (=> b!178741 (=> (not res!84665) (not e!117795))))

(assert (=> b!178741 (= res!84665 (= (getValueByKey!199 (toList!1138 lt!88348) (_1!1670 (tuple2!3319 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3510 thiss!1248)))) (Some!204 (_2!1670 (tuple2!3319 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3510 thiss!1248))))))))

(declare-fun b!178742 () Bool)

(assert (=> b!178742 (= e!117795 (contains!1210 (toList!1138 lt!88348) (tuple2!3319 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3510 thiss!1248))))))

(assert (= (and d!54031 res!84664) b!178741))

(assert (= (and b!178741 res!84665) b!178742))

(declare-fun m!207123 () Bool)

(assert (=> d!54031 m!207123))

(declare-fun m!207125 () Bool)

(assert (=> d!54031 m!207125))

(declare-fun m!207127 () Bool)

(assert (=> d!54031 m!207127))

(declare-fun m!207129 () Bool)

(assert (=> d!54031 m!207129))

(declare-fun m!207131 () Bool)

(assert (=> b!178741 m!207131))

(declare-fun m!207133 () Bool)

(assert (=> b!178742 m!207133))

(assert (=> b!178509 d!54031))

(declare-fun condMapEmpty!7152 () Bool)

(declare-fun mapDefault!7152 () ValueCell!1746)

(assert (=> mapNonEmpty!7151 (= condMapEmpty!7152 (= mapRest!7151 ((as const (Array (_ BitVec 32) ValueCell!1746)) mapDefault!7152)))))

(declare-fun e!117797 () Bool)

(declare-fun mapRes!7152 () Bool)

(assert (=> mapNonEmpty!7151 (= tp!15944 (and e!117797 mapRes!7152))))

(declare-fun b!178743 () Bool)

(declare-fun e!117796 () Bool)

(assert (=> b!178743 (= e!117796 tp_is_empty!4179)))

(declare-fun mapNonEmpty!7152 () Bool)

(declare-fun tp!15945 () Bool)

(assert (=> mapNonEmpty!7152 (= mapRes!7152 (and tp!15945 e!117796))))

(declare-fun mapValue!7152 () ValueCell!1746)

(declare-fun mapRest!7152 () (Array (_ BitVec 32) ValueCell!1746))

(declare-fun mapKey!7152 () (_ BitVec 32))

(assert (=> mapNonEmpty!7152 (= mapRest!7151 (store mapRest!7152 mapKey!7152 mapValue!7152))))

(declare-fun mapIsEmpty!7152 () Bool)

(assert (=> mapIsEmpty!7152 mapRes!7152))

(declare-fun b!178744 () Bool)

(assert (=> b!178744 (= e!117797 tp_is_empty!4179)))

(assert (= (and mapNonEmpty!7151 condMapEmpty!7152) mapIsEmpty!7152))

(assert (= (and mapNonEmpty!7151 (not condMapEmpty!7152)) mapNonEmpty!7152))

(assert (= (and mapNonEmpty!7152 ((_ is ValueCellFull!1746) mapValue!7152)) b!178743))

(assert (= (and mapNonEmpty!7151 ((_ is ValueCellFull!1746) mapDefault!7152)) b!178744))

(declare-fun m!207135 () Bool)

(assert (=> mapNonEmpty!7152 m!207135))

(declare-fun b_lambda!7091 () Bool)

(assert (= b_lambda!7089 (or (and b!178405 b_free!4407) b_lambda!7091)))

(declare-fun b_lambda!7093 () Bool)

(assert (= b_lambda!7087 (or (and b!178405 b_free!4407) b_lambda!7093)))

(check-sat (not b!178624) (not b_lambda!7093) (not d!53965) (not b!178642) (not b!178728) (not b!178596) (not d!54001) (not b!178627) (not b!178727) (not b!178632) (not b!178630) (not b!178722) (not b!178725) (not d!54003) (not b!178557) (not d!53963) (not d!54007) (not d!54029) (not d!53971) (not bm!18061) (not b!178733) (not d!54021) (not d!54011) (not b!178655) (not b!178549) (not d!54013) (not b!178629) (not d!53979) (not d!53959) (not b!178741) (not b!178579) (not b!178739) (not b!178740) (not b_lambda!7091) (not b!178581) (not bm!18055) (not d!54031) (not d!53973) (not b!178592) (not b!178641) (not b!178688) (not d!53999) (not bm!18058) (not b!178699) (not d!53985) (not b!178716) (not b!178626) (not d!53967) (not b!178721) (not b!178712) b_and!10931 (not d!54017) (not b!178631) (not b!178735) (not d!54009) (not b!178723) (not b!178682) (not d!54023) tp_is_empty!4179 (not d!54015) (not b!178571) (not b!178689) (not d!54027) (not b!178578) (not b!178724) (not b!178595) (not b!178551) (not bm!18052) (not d!54005) (not d!53991) (not b_next!4407) (not mapNonEmpty!7152) (not d!53995) (not b_lambda!7085) (not d!54025) (not d!54019) (not d!53981) (not d!53997) (not b!178742) (not b!178576) (not b!178622) (not b!178654) (not b!178726))
(check-sat b_and!10931 (not b_next!4407))

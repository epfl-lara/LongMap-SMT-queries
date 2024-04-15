; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18256 () Bool)

(assert start!18256)

(declare-fun b!181232 () Bool)

(declare-fun b_free!4477 () Bool)

(declare-fun b_next!4477 () Bool)

(assert (=> b!181232 (= b_free!4477 (not b_next!4477))))

(declare-fun tp!16178 () Bool)

(declare-fun b_and!10999 () Bool)

(assert (=> b!181232 (= tp!16178 b_and!10999)))

(declare-fun b!181231 () Bool)

(declare-fun e!119359 () Bool)

(declare-fun e!119358 () Bool)

(assert (=> b!181231 (= e!119359 e!119358)))

(declare-fun res!85776 () Bool)

(assert (=> b!181231 (=> (not res!85776) (not e!119358))))

(declare-datatypes ((SeekEntryResult!608 0))(
  ( (MissingZero!608 (index!4602 (_ BitVec 32))) (Found!608 (index!4603 (_ BitVec 32))) (Intermediate!608 (undefined!1420 Bool) (index!4604 (_ BitVec 32)) (x!19811 (_ BitVec 32))) (Undefined!608) (MissingVacant!608 (index!4605 (_ BitVec 32))) )
))
(declare-fun lt!89501 () SeekEntryResult!608)

(get-info :version)

(assert (=> b!181231 (= res!85776 (and (not ((_ is Undefined!608) lt!89501)) (not ((_ is MissingVacant!608) lt!89501)) (not ((_ is MissingZero!608) lt!89501)) ((_ is Found!608) lt!89501)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!5313 0))(
  ( (V!5314 (val!2169 Int)) )
))
(declare-datatypes ((ValueCell!1781 0))(
  ( (ValueCellFull!1781 (v!4059 V!5313)) (EmptyCell!1781) )
))
(declare-datatypes ((array!7657 0))(
  ( (array!7658 (arr!3622 (Array (_ BitVec 32) (_ BitVec 64))) (size!3933 (_ BitVec 32))) )
))
(declare-datatypes ((array!7659 0))(
  ( (array!7660 (arr!3623 (Array (_ BitVec 32) ValueCell!1781)) (size!3934 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2470 0))(
  ( (LongMapFixedSize!2471 (defaultEntry!3716 Int) (mask!8736 (_ BitVec 32)) (extraKeys!3453 (_ BitVec 32)) (zeroValue!3557 V!5313) (minValue!3557 V!5313) (_size!1284 (_ BitVec 32)) (_keys!5617 array!7657) (_values!3699 array!7659) (_vacant!1284 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2470)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7657 (_ BitVec 32)) SeekEntryResult!608)

(assert (=> b!181231 (= lt!89501 (seekEntryOrOpen!0 key!828 (_keys!5617 thiss!1248) (mask!8736 thiss!1248)))))

(declare-fun mapNonEmpty!7284 () Bool)

(declare-fun mapRes!7284 () Bool)

(declare-fun tp!16179 () Bool)

(declare-fun e!119360 () Bool)

(assert (=> mapNonEmpty!7284 (= mapRes!7284 (and tp!16179 e!119360))))

(declare-fun mapRest!7284 () (Array (_ BitVec 32) ValueCell!1781))

(declare-fun mapKey!7284 () (_ BitVec 32))

(declare-fun mapValue!7284 () ValueCell!1781)

(assert (=> mapNonEmpty!7284 (= (arr!3623 (_values!3699 thiss!1248)) (store mapRest!7284 mapKey!7284 mapValue!7284))))

(declare-fun tp_is_empty!4249 () Bool)

(declare-fun e!119361 () Bool)

(declare-fun e!119357 () Bool)

(declare-fun array_inv!2341 (array!7657) Bool)

(declare-fun array_inv!2342 (array!7659) Bool)

(assert (=> b!181232 (= e!119361 (and tp!16178 tp_is_empty!4249 (array_inv!2341 (_keys!5617 thiss!1248)) (array_inv!2342 (_values!3699 thiss!1248)) e!119357))))

(declare-fun b!181233 () Bool)

(declare-fun res!85778 () Bool)

(assert (=> b!181233 (=> (not res!85778) (not e!119358))))

(declare-datatypes ((tuple2!3360 0))(
  ( (tuple2!3361 (_1!1691 (_ BitVec 64)) (_2!1691 V!5313)) )
))
(declare-datatypes ((List!2304 0))(
  ( (Nil!2301) (Cons!2300 (h!2927 tuple2!3360) (t!7149 List!2304)) )
))
(declare-datatypes ((ListLongMap!2269 0))(
  ( (ListLongMap!2270 (toList!1150 List!2304)) )
))
(declare-fun contains!1236 (ListLongMap!2269 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!783 (array!7657 array!7659 (_ BitVec 32) (_ BitVec 32) V!5313 V!5313 (_ BitVec 32) Int) ListLongMap!2269)

(assert (=> b!181233 (= res!85778 (contains!1236 (getCurrentListMap!783 (_keys!5617 thiss!1248) (_values!3699 thiss!1248) (mask!8736 thiss!1248) (extraKeys!3453 thiss!1248) (zeroValue!3557 thiss!1248) (minValue!3557 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3716 thiss!1248)) key!828))))

(declare-fun b!181234 () Bool)

(declare-fun res!85775 () Bool)

(assert (=> b!181234 (=> (not res!85775) (not e!119358))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!181234 (= res!85775 (validMask!0 (mask!8736 thiss!1248)))))

(declare-fun b!181236 () Bool)

(declare-fun res!85777 () Bool)

(assert (=> b!181236 (=> (not res!85777) (not e!119359))))

(assert (=> b!181236 (= res!85777 (not (= key!828 (bvneg key!828))))))

(declare-fun b!181237 () Bool)

(assert (=> b!181237 (= e!119358 (and (= (size!3934 (_values!3699 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8736 thiss!1248))) (= (size!3933 (_keys!5617 thiss!1248)) (size!3934 (_values!3699 thiss!1248))) (bvslt (mask!8736 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!7284 () Bool)

(assert (=> mapIsEmpty!7284 mapRes!7284))

(declare-fun b!181238 () Bool)

(declare-fun e!119363 () Bool)

(assert (=> b!181238 (= e!119357 (and e!119363 mapRes!7284))))

(declare-fun condMapEmpty!7284 () Bool)

(declare-fun mapDefault!7284 () ValueCell!1781)

(assert (=> b!181238 (= condMapEmpty!7284 (= (arr!3623 (_values!3699 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1781)) mapDefault!7284)))))

(declare-fun b!181239 () Bool)

(assert (=> b!181239 (= e!119360 tp_is_empty!4249)))

(declare-fun res!85779 () Bool)

(assert (=> start!18256 (=> (not res!85779) (not e!119359))))

(declare-fun valid!1044 (LongMapFixedSize!2470) Bool)

(assert (=> start!18256 (= res!85779 (valid!1044 thiss!1248))))

(assert (=> start!18256 e!119359))

(assert (=> start!18256 e!119361))

(assert (=> start!18256 true))

(declare-fun b!181235 () Bool)

(assert (=> b!181235 (= e!119363 tp_is_empty!4249)))

(assert (= (and start!18256 res!85779) b!181236))

(assert (= (and b!181236 res!85777) b!181231))

(assert (= (and b!181231 res!85776) b!181233))

(assert (= (and b!181233 res!85778) b!181234))

(assert (= (and b!181234 res!85775) b!181237))

(assert (= (and b!181238 condMapEmpty!7284) mapIsEmpty!7284))

(assert (= (and b!181238 (not condMapEmpty!7284)) mapNonEmpty!7284))

(assert (= (and mapNonEmpty!7284 ((_ is ValueCellFull!1781) mapValue!7284)) b!181239))

(assert (= (and b!181238 ((_ is ValueCellFull!1781) mapDefault!7284)) b!181235))

(assert (= b!181232 b!181238))

(assert (= start!18256 b!181232))

(declare-fun m!208695 () Bool)

(assert (=> b!181233 m!208695))

(assert (=> b!181233 m!208695))

(declare-fun m!208697 () Bool)

(assert (=> b!181233 m!208697))

(declare-fun m!208699 () Bool)

(assert (=> mapNonEmpty!7284 m!208699))

(declare-fun m!208701 () Bool)

(assert (=> b!181231 m!208701))

(declare-fun m!208703 () Bool)

(assert (=> start!18256 m!208703))

(declare-fun m!208705 () Bool)

(assert (=> b!181232 m!208705))

(declare-fun m!208707 () Bool)

(assert (=> b!181232 m!208707))

(declare-fun m!208709 () Bool)

(assert (=> b!181234 m!208709))

(check-sat tp_is_empty!4249 b_and!10999 (not b!181234) (not b!181232) (not b!181233) (not b_next!4477) (not b!181231) (not start!18256) (not mapNonEmpty!7284))
(check-sat b_and!10999 (not b_next!4477))
(get-model)

(declare-fun d!54281 () Bool)

(declare-fun res!85816 () Bool)

(declare-fun e!119408 () Bool)

(assert (=> d!54281 (=> (not res!85816) (not e!119408))))

(declare-fun simpleValid!168 (LongMapFixedSize!2470) Bool)

(assert (=> d!54281 (= res!85816 (simpleValid!168 thiss!1248))))

(assert (=> d!54281 (= (valid!1044 thiss!1248) e!119408)))

(declare-fun b!181300 () Bool)

(declare-fun res!85817 () Bool)

(assert (=> b!181300 (=> (not res!85817) (not e!119408))))

(declare-fun arrayCountValidKeys!0 (array!7657 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!181300 (= res!85817 (= (arrayCountValidKeys!0 (_keys!5617 thiss!1248) #b00000000000000000000000000000000 (size!3933 (_keys!5617 thiss!1248))) (_size!1284 thiss!1248)))))

(declare-fun b!181301 () Bool)

(declare-fun res!85818 () Bool)

(assert (=> b!181301 (=> (not res!85818) (not e!119408))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7657 (_ BitVec 32)) Bool)

(assert (=> b!181301 (= res!85818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5617 thiss!1248) (mask!8736 thiss!1248)))))

(declare-fun b!181302 () Bool)

(declare-datatypes ((List!2305 0))(
  ( (Nil!2302) (Cons!2301 (h!2928 (_ BitVec 64)) (t!7152 List!2305)) )
))
(declare-fun arrayNoDuplicates!0 (array!7657 (_ BitVec 32) List!2305) Bool)

(assert (=> b!181302 (= e!119408 (arrayNoDuplicates!0 (_keys!5617 thiss!1248) #b00000000000000000000000000000000 Nil!2302))))

(assert (= (and d!54281 res!85816) b!181300))

(assert (= (and b!181300 res!85817) b!181301))

(assert (= (and b!181301 res!85818) b!181302))

(declare-fun m!208743 () Bool)

(assert (=> d!54281 m!208743))

(declare-fun m!208745 () Bool)

(assert (=> b!181300 m!208745))

(declare-fun m!208747 () Bool)

(assert (=> b!181301 m!208747))

(declare-fun m!208749 () Bool)

(assert (=> b!181302 m!208749))

(assert (=> start!18256 d!54281))

(declare-fun d!54283 () Bool)

(declare-fun e!119414 () Bool)

(assert (=> d!54283 e!119414))

(declare-fun res!85821 () Bool)

(assert (=> d!54283 (=> res!85821 e!119414)))

(declare-fun lt!89516 () Bool)

(assert (=> d!54283 (= res!85821 (not lt!89516))))

(declare-fun lt!89519 () Bool)

(assert (=> d!54283 (= lt!89516 lt!89519)))

(declare-datatypes ((Unit!5483 0))(
  ( (Unit!5484) )
))
(declare-fun lt!89518 () Unit!5483)

(declare-fun e!119413 () Unit!5483)

(assert (=> d!54283 (= lt!89518 e!119413)))

(declare-fun c!32489 () Bool)

(assert (=> d!54283 (= c!32489 lt!89519)))

(declare-fun containsKey!211 (List!2304 (_ BitVec 64)) Bool)

(assert (=> d!54283 (= lt!89519 (containsKey!211 (toList!1150 (getCurrentListMap!783 (_keys!5617 thiss!1248) (_values!3699 thiss!1248) (mask!8736 thiss!1248) (extraKeys!3453 thiss!1248) (zeroValue!3557 thiss!1248) (minValue!3557 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3716 thiss!1248))) key!828))))

(assert (=> d!54283 (= (contains!1236 (getCurrentListMap!783 (_keys!5617 thiss!1248) (_values!3699 thiss!1248) (mask!8736 thiss!1248) (extraKeys!3453 thiss!1248) (zeroValue!3557 thiss!1248) (minValue!3557 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3716 thiss!1248)) key!828) lt!89516)))

(declare-fun b!181309 () Bool)

(declare-fun lt!89517 () Unit!5483)

(assert (=> b!181309 (= e!119413 lt!89517)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!160 (List!2304 (_ BitVec 64)) Unit!5483)

(assert (=> b!181309 (= lt!89517 (lemmaContainsKeyImpliesGetValueByKeyDefined!160 (toList!1150 (getCurrentListMap!783 (_keys!5617 thiss!1248) (_values!3699 thiss!1248) (mask!8736 thiss!1248) (extraKeys!3453 thiss!1248) (zeroValue!3557 thiss!1248) (minValue!3557 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3716 thiss!1248))) key!828))))

(declare-datatypes ((Option!213 0))(
  ( (Some!212 (v!4062 V!5313)) (None!211) )
))
(declare-fun isDefined!161 (Option!213) Bool)

(declare-fun getValueByKey!207 (List!2304 (_ BitVec 64)) Option!213)

(assert (=> b!181309 (isDefined!161 (getValueByKey!207 (toList!1150 (getCurrentListMap!783 (_keys!5617 thiss!1248) (_values!3699 thiss!1248) (mask!8736 thiss!1248) (extraKeys!3453 thiss!1248) (zeroValue!3557 thiss!1248) (minValue!3557 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3716 thiss!1248))) key!828))))

(declare-fun b!181310 () Bool)

(declare-fun Unit!5485 () Unit!5483)

(assert (=> b!181310 (= e!119413 Unit!5485)))

(declare-fun b!181311 () Bool)

(assert (=> b!181311 (= e!119414 (isDefined!161 (getValueByKey!207 (toList!1150 (getCurrentListMap!783 (_keys!5617 thiss!1248) (_values!3699 thiss!1248) (mask!8736 thiss!1248) (extraKeys!3453 thiss!1248) (zeroValue!3557 thiss!1248) (minValue!3557 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3716 thiss!1248))) key!828)))))

(assert (= (and d!54283 c!32489) b!181309))

(assert (= (and d!54283 (not c!32489)) b!181310))

(assert (= (and d!54283 (not res!85821)) b!181311))

(declare-fun m!208751 () Bool)

(assert (=> d!54283 m!208751))

(declare-fun m!208753 () Bool)

(assert (=> b!181309 m!208753))

(declare-fun m!208755 () Bool)

(assert (=> b!181309 m!208755))

(assert (=> b!181309 m!208755))

(declare-fun m!208757 () Bool)

(assert (=> b!181309 m!208757))

(assert (=> b!181311 m!208755))

(assert (=> b!181311 m!208755))

(assert (=> b!181311 m!208757))

(assert (=> b!181233 d!54283))

(declare-fun b!181354 () Bool)

(declare-fun e!119449 () Unit!5483)

(declare-fun lt!89564 () Unit!5483)

(assert (=> b!181354 (= e!119449 lt!89564)))

(declare-fun lt!89582 () ListLongMap!2269)

(declare-fun getCurrentListMapNoExtraKeys!173 (array!7657 array!7659 (_ BitVec 32) (_ BitVec 32) V!5313 V!5313 (_ BitVec 32) Int) ListLongMap!2269)

(assert (=> b!181354 (= lt!89582 (getCurrentListMapNoExtraKeys!173 (_keys!5617 thiss!1248) (_values!3699 thiss!1248) (mask!8736 thiss!1248) (extraKeys!3453 thiss!1248) (zeroValue!3557 thiss!1248) (minValue!3557 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3716 thiss!1248)))))

(declare-fun lt!89574 () (_ BitVec 64))

(assert (=> b!181354 (= lt!89574 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89570 () (_ BitVec 64))

(assert (=> b!181354 (= lt!89570 (select (arr!3622 (_keys!5617 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89565 () Unit!5483)

(declare-fun addStillContains!128 (ListLongMap!2269 (_ BitVec 64) V!5313 (_ BitVec 64)) Unit!5483)

(assert (=> b!181354 (= lt!89565 (addStillContains!128 lt!89582 lt!89574 (zeroValue!3557 thiss!1248) lt!89570))))

(declare-fun +!269 (ListLongMap!2269 tuple2!3360) ListLongMap!2269)

(assert (=> b!181354 (contains!1236 (+!269 lt!89582 (tuple2!3361 lt!89574 (zeroValue!3557 thiss!1248))) lt!89570)))

(declare-fun lt!89573 () Unit!5483)

(assert (=> b!181354 (= lt!89573 lt!89565)))

(declare-fun lt!89584 () ListLongMap!2269)

(assert (=> b!181354 (= lt!89584 (getCurrentListMapNoExtraKeys!173 (_keys!5617 thiss!1248) (_values!3699 thiss!1248) (mask!8736 thiss!1248) (extraKeys!3453 thiss!1248) (zeroValue!3557 thiss!1248) (minValue!3557 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3716 thiss!1248)))))

(declare-fun lt!89581 () (_ BitVec 64))

(assert (=> b!181354 (= lt!89581 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89579 () (_ BitVec 64))

(assert (=> b!181354 (= lt!89579 (select (arr!3622 (_keys!5617 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89580 () Unit!5483)

(declare-fun addApplyDifferent!128 (ListLongMap!2269 (_ BitVec 64) V!5313 (_ BitVec 64)) Unit!5483)

(assert (=> b!181354 (= lt!89580 (addApplyDifferent!128 lt!89584 lt!89581 (minValue!3557 thiss!1248) lt!89579))))

(declare-fun apply!152 (ListLongMap!2269 (_ BitVec 64)) V!5313)

(assert (=> b!181354 (= (apply!152 (+!269 lt!89584 (tuple2!3361 lt!89581 (minValue!3557 thiss!1248))) lt!89579) (apply!152 lt!89584 lt!89579))))

(declare-fun lt!89567 () Unit!5483)

(assert (=> b!181354 (= lt!89567 lt!89580)))

(declare-fun lt!89576 () ListLongMap!2269)

(assert (=> b!181354 (= lt!89576 (getCurrentListMapNoExtraKeys!173 (_keys!5617 thiss!1248) (_values!3699 thiss!1248) (mask!8736 thiss!1248) (extraKeys!3453 thiss!1248) (zeroValue!3557 thiss!1248) (minValue!3557 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3716 thiss!1248)))))

(declare-fun lt!89566 () (_ BitVec 64))

(assert (=> b!181354 (= lt!89566 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89585 () (_ BitVec 64))

(assert (=> b!181354 (= lt!89585 (select (arr!3622 (_keys!5617 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89571 () Unit!5483)

(assert (=> b!181354 (= lt!89571 (addApplyDifferent!128 lt!89576 lt!89566 (zeroValue!3557 thiss!1248) lt!89585))))

(assert (=> b!181354 (= (apply!152 (+!269 lt!89576 (tuple2!3361 lt!89566 (zeroValue!3557 thiss!1248))) lt!89585) (apply!152 lt!89576 lt!89585))))

(declare-fun lt!89575 () Unit!5483)

(assert (=> b!181354 (= lt!89575 lt!89571)))

(declare-fun lt!89578 () ListLongMap!2269)

(assert (=> b!181354 (= lt!89578 (getCurrentListMapNoExtraKeys!173 (_keys!5617 thiss!1248) (_values!3699 thiss!1248) (mask!8736 thiss!1248) (extraKeys!3453 thiss!1248) (zeroValue!3557 thiss!1248) (minValue!3557 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3716 thiss!1248)))))

(declare-fun lt!89572 () (_ BitVec 64))

(assert (=> b!181354 (= lt!89572 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89569 () (_ BitVec 64))

(assert (=> b!181354 (= lt!89569 (select (arr!3622 (_keys!5617 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!181354 (= lt!89564 (addApplyDifferent!128 lt!89578 lt!89572 (minValue!3557 thiss!1248) lt!89569))))

(assert (=> b!181354 (= (apply!152 (+!269 lt!89578 (tuple2!3361 lt!89572 (minValue!3557 thiss!1248))) lt!89569) (apply!152 lt!89578 lt!89569))))

(declare-fun d!54285 () Bool)

(declare-fun e!119445 () Bool)

(assert (=> d!54285 e!119445))

(declare-fun res!85845 () Bool)

(assert (=> d!54285 (=> (not res!85845) (not e!119445))))

(assert (=> d!54285 (= res!85845 (or (bvsge #b00000000000000000000000000000000 (size!3933 (_keys!5617 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3933 (_keys!5617 thiss!1248))))))))

(declare-fun lt!89568 () ListLongMap!2269)

(declare-fun lt!89583 () ListLongMap!2269)

(assert (=> d!54285 (= lt!89568 lt!89583)))

(declare-fun lt!89577 () Unit!5483)

(assert (=> d!54285 (= lt!89577 e!119449)))

(declare-fun c!32505 () Bool)

(declare-fun e!119453 () Bool)

(assert (=> d!54285 (= c!32505 e!119453)))

(declare-fun res!85846 () Bool)

(assert (=> d!54285 (=> (not res!85846) (not e!119453))))

(assert (=> d!54285 (= res!85846 (bvslt #b00000000000000000000000000000000 (size!3933 (_keys!5617 thiss!1248))))))

(declare-fun e!119444 () ListLongMap!2269)

(assert (=> d!54285 (= lt!89583 e!119444)))

(declare-fun c!32507 () Bool)

(assert (=> d!54285 (= c!32507 (and (not (= (bvand (extraKeys!3453 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3453 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54285 (validMask!0 (mask!8736 thiss!1248))))

(assert (=> d!54285 (= (getCurrentListMap!783 (_keys!5617 thiss!1248) (_values!3699 thiss!1248) (mask!8736 thiss!1248) (extraKeys!3453 thiss!1248) (zeroValue!3557 thiss!1248) (minValue!3557 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3716 thiss!1248)) lt!89568)))

(declare-fun b!181355 () Bool)

(declare-fun e!119442 () Bool)

(assert (=> b!181355 (= e!119442 (= (apply!152 lt!89568 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3557 thiss!1248)))))

(declare-fun bm!18310 () Bool)

(declare-fun call!18313 () Bool)

(assert (=> bm!18310 (= call!18313 (contains!1236 lt!89568 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!18311 () Bool)

(declare-fun call!18319 () ListLongMap!2269)

(declare-fun call!18318 () ListLongMap!2269)

(assert (=> bm!18311 (= call!18319 call!18318)))

(declare-fun b!181356 () Bool)

(declare-fun e!119446 () Bool)

(declare-fun call!18314 () Bool)

(assert (=> b!181356 (= e!119446 (not call!18314))))

(declare-fun b!181357 () Bool)

(declare-fun res!85848 () Bool)

(assert (=> b!181357 (=> (not res!85848) (not e!119445))))

(declare-fun e!119443 () Bool)

(assert (=> b!181357 (= res!85848 e!119443)))

(declare-fun res!85840 () Bool)

(assert (=> b!181357 (=> res!85840 e!119443)))

(declare-fun e!119452 () Bool)

(assert (=> b!181357 (= res!85840 (not e!119452))))

(declare-fun res!85844 () Bool)

(assert (=> b!181357 (=> (not res!85844) (not e!119452))))

(assert (=> b!181357 (= res!85844 (bvslt #b00000000000000000000000000000000 (size!3933 (_keys!5617 thiss!1248))))))

(declare-fun b!181358 () Bool)

(declare-fun e!119451 () Bool)

(assert (=> b!181358 (= e!119451 (not call!18313))))

(declare-fun b!181359 () Bool)

(declare-fun e!119448 () Bool)

(declare-fun get!2073 (ValueCell!1781 V!5313) V!5313)

(declare-fun dynLambda!486 (Int (_ BitVec 64)) V!5313)

(assert (=> b!181359 (= e!119448 (= (apply!152 lt!89568 (select (arr!3622 (_keys!5617 thiss!1248)) #b00000000000000000000000000000000)) (get!2073 (select (arr!3623 (_values!3699 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!486 (defaultEntry!3716 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!181359 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3934 (_values!3699 thiss!1248))))))

(assert (=> b!181359 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3933 (_keys!5617 thiss!1248))))))

(declare-fun b!181360 () Bool)

(assert (=> b!181360 (= e!119443 e!119448)))

(declare-fun res!85841 () Bool)

(assert (=> b!181360 (=> (not res!85841) (not e!119448))))

(assert (=> b!181360 (= res!85841 (contains!1236 lt!89568 (select (arr!3622 (_keys!5617 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!181360 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3933 (_keys!5617 thiss!1248))))))

(declare-fun b!181361 () Bool)

(declare-fun call!18317 () ListLongMap!2269)

(assert (=> b!181361 (= e!119444 (+!269 call!18317 (tuple2!3361 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3557 thiss!1248))))))

(declare-fun b!181362 () Bool)

(declare-fun res!85843 () Bool)

(assert (=> b!181362 (=> (not res!85843) (not e!119445))))

(assert (=> b!181362 (= res!85843 e!119451)))

(declare-fun c!32503 () Bool)

(assert (=> b!181362 (= c!32503 (not (= (bvand (extraKeys!3453 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!181363 () Bool)

(declare-fun c!32506 () Bool)

(assert (=> b!181363 (= c!32506 (and (not (= (bvand (extraKeys!3453 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3453 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!119441 () ListLongMap!2269)

(declare-fun e!119447 () ListLongMap!2269)

(assert (=> b!181363 (= e!119441 e!119447)))

(declare-fun b!181364 () Bool)

(declare-fun Unit!5486 () Unit!5483)

(assert (=> b!181364 (= e!119449 Unit!5486)))

(declare-fun b!181365 () Bool)

(declare-fun e!119450 () Bool)

(assert (=> b!181365 (= e!119450 (= (apply!152 lt!89568 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3557 thiss!1248)))))

(declare-fun b!181366 () Bool)

(declare-fun call!18315 () ListLongMap!2269)

(assert (=> b!181366 (= e!119447 call!18315)))

(declare-fun b!181367 () Bool)

(declare-fun call!18316 () ListLongMap!2269)

(assert (=> b!181367 (= e!119441 call!18316)))

(declare-fun b!181368 () Bool)

(assert (=> b!181368 (= e!119451 e!119442)))

(declare-fun res!85842 () Bool)

(assert (=> b!181368 (= res!85842 call!18313)))

(assert (=> b!181368 (=> (not res!85842) (not e!119442))))

(declare-fun bm!18312 () Bool)

(assert (=> bm!18312 (= call!18314 (contains!1236 lt!89568 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!181369 () Bool)

(assert (=> b!181369 (= e!119447 call!18316)))

(declare-fun b!181370 () Bool)

(assert (=> b!181370 (= e!119446 e!119450)))

(declare-fun res!85847 () Bool)

(assert (=> b!181370 (= res!85847 call!18314)))

(assert (=> b!181370 (=> (not res!85847) (not e!119450))))

(declare-fun c!32502 () Bool)

(declare-fun bm!18313 () Bool)

(assert (=> bm!18313 (= call!18317 (+!269 (ite c!32507 call!18318 (ite c!32502 call!18319 call!18315)) (ite (or c!32507 c!32502) (tuple2!3361 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3557 thiss!1248)) (tuple2!3361 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3557 thiss!1248)))))))

(declare-fun b!181371 () Bool)

(assert (=> b!181371 (= e!119444 e!119441)))

(assert (=> b!181371 (= c!32502 (and (not (= (bvand (extraKeys!3453 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3453 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!181372 () Bool)

(assert (=> b!181372 (= e!119445 e!119446)))

(declare-fun c!32504 () Bool)

(assert (=> b!181372 (= c!32504 (not (= (bvand (extraKeys!3453 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18314 () Bool)

(assert (=> bm!18314 (= call!18318 (getCurrentListMapNoExtraKeys!173 (_keys!5617 thiss!1248) (_values!3699 thiss!1248) (mask!8736 thiss!1248) (extraKeys!3453 thiss!1248) (zeroValue!3557 thiss!1248) (minValue!3557 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3716 thiss!1248)))))

(declare-fun b!181373 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!181373 (= e!119452 (validKeyInArray!0 (select (arr!3622 (_keys!5617 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18315 () Bool)

(assert (=> bm!18315 (= call!18315 call!18319)))

(declare-fun bm!18316 () Bool)

(assert (=> bm!18316 (= call!18316 call!18317)))

(declare-fun b!181374 () Bool)

(assert (=> b!181374 (= e!119453 (validKeyInArray!0 (select (arr!3622 (_keys!5617 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!54285 c!32507) b!181361))

(assert (= (and d!54285 (not c!32507)) b!181371))

(assert (= (and b!181371 c!32502) b!181367))

(assert (= (and b!181371 (not c!32502)) b!181363))

(assert (= (and b!181363 c!32506) b!181369))

(assert (= (and b!181363 (not c!32506)) b!181366))

(assert (= (or b!181369 b!181366) bm!18315))

(assert (= (or b!181367 bm!18315) bm!18311))

(assert (= (or b!181367 b!181369) bm!18316))

(assert (= (or b!181361 bm!18311) bm!18314))

(assert (= (or b!181361 bm!18316) bm!18313))

(assert (= (and d!54285 res!85846) b!181374))

(assert (= (and d!54285 c!32505) b!181354))

(assert (= (and d!54285 (not c!32505)) b!181364))

(assert (= (and d!54285 res!85845) b!181357))

(assert (= (and b!181357 res!85844) b!181373))

(assert (= (and b!181357 (not res!85840)) b!181360))

(assert (= (and b!181360 res!85841) b!181359))

(assert (= (and b!181357 res!85848) b!181362))

(assert (= (and b!181362 c!32503) b!181368))

(assert (= (and b!181362 (not c!32503)) b!181358))

(assert (= (and b!181368 res!85842) b!181355))

(assert (= (or b!181368 b!181358) bm!18310))

(assert (= (and b!181362 res!85843) b!181372))

(assert (= (and b!181372 c!32504) b!181370))

(assert (= (and b!181372 (not c!32504)) b!181356))

(assert (= (and b!181370 res!85847) b!181365))

(assert (= (or b!181370 b!181356) bm!18312))

(declare-fun b_lambda!7129 () Bool)

(assert (=> (not b_lambda!7129) (not b!181359)))

(declare-fun t!7151 () Bool)

(declare-fun tb!2807 () Bool)

(assert (=> (and b!181232 (= (defaultEntry!3716 thiss!1248) (defaultEntry!3716 thiss!1248)) t!7151) tb!2807))

(declare-fun result!4715 () Bool)

(assert (=> tb!2807 (= result!4715 tp_is_empty!4249)))

(assert (=> b!181359 t!7151))

(declare-fun b_and!11005 () Bool)

(assert (= b_and!10999 (and (=> t!7151 result!4715) b_and!11005)))

(declare-fun m!208759 () Bool)

(assert (=> b!181359 m!208759))

(declare-fun m!208761 () Bool)

(assert (=> b!181359 m!208761))

(assert (=> b!181359 m!208761))

(declare-fun m!208763 () Bool)

(assert (=> b!181359 m!208763))

(assert (=> b!181359 m!208759))

(declare-fun m!208765 () Bool)

(assert (=> b!181359 m!208765))

(declare-fun m!208767 () Bool)

(assert (=> b!181359 m!208767))

(assert (=> b!181359 m!208765))

(declare-fun m!208769 () Bool)

(assert (=> b!181354 m!208769))

(declare-fun m!208771 () Bool)

(assert (=> b!181354 m!208771))

(assert (=> b!181354 m!208761))

(declare-fun m!208773 () Bool)

(assert (=> b!181354 m!208773))

(declare-fun m!208775 () Bool)

(assert (=> b!181354 m!208775))

(declare-fun m!208777 () Bool)

(assert (=> b!181354 m!208777))

(declare-fun m!208779 () Bool)

(assert (=> b!181354 m!208779))

(declare-fun m!208781 () Bool)

(assert (=> b!181354 m!208781))

(declare-fun m!208783 () Bool)

(assert (=> b!181354 m!208783))

(declare-fun m!208785 () Bool)

(assert (=> b!181354 m!208785))

(declare-fun m!208787 () Bool)

(assert (=> b!181354 m!208787))

(declare-fun m!208789 () Bool)

(assert (=> b!181354 m!208789))

(declare-fun m!208791 () Bool)

(assert (=> b!181354 m!208791))

(declare-fun m!208793 () Bool)

(assert (=> b!181354 m!208793))

(assert (=> b!181354 m!208777))

(assert (=> b!181354 m!208785))

(declare-fun m!208795 () Bool)

(assert (=> b!181354 m!208795))

(assert (=> b!181354 m!208769))

(assert (=> b!181354 m!208773))

(declare-fun m!208797 () Bool)

(assert (=> b!181354 m!208797))

(declare-fun m!208799 () Bool)

(assert (=> b!181354 m!208799))

(assert (=> b!181373 m!208761))

(assert (=> b!181373 m!208761))

(declare-fun m!208801 () Bool)

(assert (=> b!181373 m!208801))

(assert (=> d!54285 m!208709))

(assert (=> bm!18314 m!208793))

(assert (=> b!181374 m!208761))

(assert (=> b!181374 m!208761))

(assert (=> b!181374 m!208801))

(declare-fun m!208803 () Bool)

(assert (=> bm!18312 m!208803))

(declare-fun m!208805 () Bool)

(assert (=> bm!18310 m!208805))

(assert (=> b!181360 m!208761))

(assert (=> b!181360 m!208761))

(declare-fun m!208807 () Bool)

(assert (=> b!181360 m!208807))

(declare-fun m!208809 () Bool)

(assert (=> b!181355 m!208809))

(declare-fun m!208811 () Bool)

(assert (=> b!181365 m!208811))

(declare-fun m!208813 () Bool)

(assert (=> bm!18313 m!208813))

(declare-fun m!208815 () Bool)

(assert (=> b!181361 m!208815))

(assert (=> b!181233 d!54285))

(declare-fun d!54287 () Bool)

(assert (=> d!54287 (= (array_inv!2341 (_keys!5617 thiss!1248)) (bvsge (size!3933 (_keys!5617 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!181232 d!54287))

(declare-fun d!54289 () Bool)

(assert (=> d!54289 (= (array_inv!2342 (_values!3699 thiss!1248)) (bvsge (size!3934 (_values!3699 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!181232 d!54289))

(declare-fun b!181389 () Bool)

(declare-fun c!32514 () Bool)

(declare-fun lt!89593 () (_ BitVec 64))

(assert (=> b!181389 (= c!32514 (= lt!89593 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!119462 () SeekEntryResult!608)

(declare-fun e!119460 () SeekEntryResult!608)

(assert (=> b!181389 (= e!119462 e!119460)))

(declare-fun b!181390 () Bool)

(declare-fun e!119461 () SeekEntryResult!608)

(assert (=> b!181390 (= e!119461 e!119462)))

(declare-fun lt!89592 () SeekEntryResult!608)

(assert (=> b!181390 (= lt!89593 (select (arr!3622 (_keys!5617 thiss!1248)) (index!4604 lt!89592)))))

(declare-fun c!32515 () Bool)

(assert (=> b!181390 (= c!32515 (= lt!89593 key!828))))

(declare-fun d!54291 () Bool)

(declare-fun lt!89594 () SeekEntryResult!608)

(assert (=> d!54291 (and (or ((_ is Undefined!608) lt!89594) (not ((_ is Found!608) lt!89594)) (and (bvsge (index!4603 lt!89594) #b00000000000000000000000000000000) (bvslt (index!4603 lt!89594) (size!3933 (_keys!5617 thiss!1248))))) (or ((_ is Undefined!608) lt!89594) ((_ is Found!608) lt!89594) (not ((_ is MissingZero!608) lt!89594)) (and (bvsge (index!4602 lt!89594) #b00000000000000000000000000000000) (bvslt (index!4602 lt!89594) (size!3933 (_keys!5617 thiss!1248))))) (or ((_ is Undefined!608) lt!89594) ((_ is Found!608) lt!89594) ((_ is MissingZero!608) lt!89594) (not ((_ is MissingVacant!608) lt!89594)) (and (bvsge (index!4605 lt!89594) #b00000000000000000000000000000000) (bvslt (index!4605 lt!89594) (size!3933 (_keys!5617 thiss!1248))))) (or ((_ is Undefined!608) lt!89594) (ite ((_ is Found!608) lt!89594) (= (select (arr!3622 (_keys!5617 thiss!1248)) (index!4603 lt!89594)) key!828) (ite ((_ is MissingZero!608) lt!89594) (= (select (arr!3622 (_keys!5617 thiss!1248)) (index!4602 lt!89594)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!608) lt!89594) (= (select (arr!3622 (_keys!5617 thiss!1248)) (index!4605 lt!89594)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54291 (= lt!89594 e!119461)))

(declare-fun c!32516 () Bool)

(assert (=> d!54291 (= c!32516 (and ((_ is Intermediate!608) lt!89592) (undefined!1420 lt!89592)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7657 (_ BitVec 32)) SeekEntryResult!608)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54291 (= lt!89592 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8736 thiss!1248)) key!828 (_keys!5617 thiss!1248) (mask!8736 thiss!1248)))))

(assert (=> d!54291 (validMask!0 (mask!8736 thiss!1248))))

(assert (=> d!54291 (= (seekEntryOrOpen!0 key!828 (_keys!5617 thiss!1248) (mask!8736 thiss!1248)) lt!89594)))

(declare-fun b!181391 () Bool)

(assert (=> b!181391 (= e!119462 (Found!608 (index!4604 lt!89592)))))

(declare-fun b!181392 () Bool)

(assert (=> b!181392 (= e!119460 (MissingZero!608 (index!4604 lt!89592)))))

(declare-fun b!181393 () Bool)

(assert (=> b!181393 (= e!119461 Undefined!608)))

(declare-fun b!181394 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7657 (_ BitVec 32)) SeekEntryResult!608)

(assert (=> b!181394 (= e!119460 (seekKeyOrZeroReturnVacant!0 (x!19811 lt!89592) (index!4604 lt!89592) (index!4604 lt!89592) key!828 (_keys!5617 thiss!1248) (mask!8736 thiss!1248)))))

(assert (= (and d!54291 c!32516) b!181393))

(assert (= (and d!54291 (not c!32516)) b!181390))

(assert (= (and b!181390 c!32515) b!181391))

(assert (= (and b!181390 (not c!32515)) b!181389))

(assert (= (and b!181389 c!32514) b!181392))

(assert (= (and b!181389 (not c!32514)) b!181394))

(declare-fun m!208817 () Bool)

(assert (=> b!181390 m!208817))

(declare-fun m!208819 () Bool)

(assert (=> d!54291 m!208819))

(assert (=> d!54291 m!208709))

(declare-fun m!208821 () Bool)

(assert (=> d!54291 m!208821))

(declare-fun m!208823 () Bool)

(assert (=> d!54291 m!208823))

(declare-fun m!208825 () Bool)

(assert (=> d!54291 m!208825))

(assert (=> d!54291 m!208823))

(declare-fun m!208827 () Bool)

(assert (=> d!54291 m!208827))

(declare-fun m!208829 () Bool)

(assert (=> b!181394 m!208829))

(assert (=> b!181231 d!54291))

(declare-fun d!54293 () Bool)

(assert (=> d!54293 (= (validMask!0 (mask!8736 thiss!1248)) (and (or (= (mask!8736 thiss!1248) #b00000000000000000000000000000111) (= (mask!8736 thiss!1248) #b00000000000000000000000000001111) (= (mask!8736 thiss!1248) #b00000000000000000000000000011111) (= (mask!8736 thiss!1248) #b00000000000000000000000000111111) (= (mask!8736 thiss!1248) #b00000000000000000000000001111111) (= (mask!8736 thiss!1248) #b00000000000000000000000011111111) (= (mask!8736 thiss!1248) #b00000000000000000000000111111111) (= (mask!8736 thiss!1248) #b00000000000000000000001111111111) (= (mask!8736 thiss!1248) #b00000000000000000000011111111111) (= (mask!8736 thiss!1248) #b00000000000000000000111111111111) (= (mask!8736 thiss!1248) #b00000000000000000001111111111111) (= (mask!8736 thiss!1248) #b00000000000000000011111111111111) (= (mask!8736 thiss!1248) #b00000000000000000111111111111111) (= (mask!8736 thiss!1248) #b00000000000000001111111111111111) (= (mask!8736 thiss!1248) #b00000000000000011111111111111111) (= (mask!8736 thiss!1248) #b00000000000000111111111111111111) (= (mask!8736 thiss!1248) #b00000000000001111111111111111111) (= (mask!8736 thiss!1248) #b00000000000011111111111111111111) (= (mask!8736 thiss!1248) #b00000000000111111111111111111111) (= (mask!8736 thiss!1248) #b00000000001111111111111111111111) (= (mask!8736 thiss!1248) #b00000000011111111111111111111111) (= (mask!8736 thiss!1248) #b00000000111111111111111111111111) (= (mask!8736 thiss!1248) #b00000001111111111111111111111111) (= (mask!8736 thiss!1248) #b00000011111111111111111111111111) (= (mask!8736 thiss!1248) #b00000111111111111111111111111111) (= (mask!8736 thiss!1248) #b00001111111111111111111111111111) (= (mask!8736 thiss!1248) #b00011111111111111111111111111111) (= (mask!8736 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8736 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!181234 d!54293))

(declare-fun condMapEmpty!7293 () Bool)

(declare-fun mapDefault!7293 () ValueCell!1781)

(assert (=> mapNonEmpty!7284 (= condMapEmpty!7293 (= mapRest!7284 ((as const (Array (_ BitVec 32) ValueCell!1781)) mapDefault!7293)))))

(declare-fun e!119467 () Bool)

(declare-fun mapRes!7293 () Bool)

(assert (=> mapNonEmpty!7284 (= tp!16179 (and e!119467 mapRes!7293))))

(declare-fun mapIsEmpty!7293 () Bool)

(assert (=> mapIsEmpty!7293 mapRes!7293))

(declare-fun mapNonEmpty!7293 () Bool)

(declare-fun tp!16194 () Bool)

(declare-fun e!119468 () Bool)

(assert (=> mapNonEmpty!7293 (= mapRes!7293 (and tp!16194 e!119468))))

(declare-fun mapKey!7293 () (_ BitVec 32))

(declare-fun mapRest!7293 () (Array (_ BitVec 32) ValueCell!1781))

(declare-fun mapValue!7293 () ValueCell!1781)

(assert (=> mapNonEmpty!7293 (= mapRest!7284 (store mapRest!7293 mapKey!7293 mapValue!7293))))

(declare-fun b!181401 () Bool)

(assert (=> b!181401 (= e!119468 tp_is_empty!4249)))

(declare-fun b!181402 () Bool)

(assert (=> b!181402 (= e!119467 tp_is_empty!4249)))

(assert (= (and mapNonEmpty!7284 condMapEmpty!7293) mapIsEmpty!7293))

(assert (= (and mapNonEmpty!7284 (not condMapEmpty!7293)) mapNonEmpty!7293))

(assert (= (and mapNonEmpty!7293 ((_ is ValueCellFull!1781) mapValue!7293)) b!181401))

(assert (= (and mapNonEmpty!7284 ((_ is ValueCellFull!1781) mapDefault!7293)) b!181402))

(declare-fun m!208831 () Bool)

(assert (=> mapNonEmpty!7293 m!208831))

(declare-fun b_lambda!7131 () Bool)

(assert (= b_lambda!7129 (or (and b!181232 b_free!4477) b_lambda!7131)))

(check-sat (not b!181355) (not b!181309) (not b!181374) (not b!181302) b_and!11005 (not d!54281) (not b!181354) (not b!181311) (not b!181359) (not b!181394) (not d!54285) (not b!181301) tp_is_empty!4249 (not b!181360) (not mapNonEmpty!7293) (not bm!18312) (not b_lambda!7131) (not b!181373) (not bm!18310) (not b!181300) (not d!54283) (not bm!18314) (not b_next!4477) (not bm!18313) (not d!54291) (not b!181361) (not b!181365))
(check-sat b_and!11005 (not b_next!4477))

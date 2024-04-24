; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23222 () Bool)

(assert start!23222)

(declare-fun b!243822 () Bool)

(declare-fun b_free!6529 () Bool)

(declare-fun b_next!6529 () Bool)

(assert (=> b!243822 (= b_free!6529 (not b_next!6529))))

(declare-fun tp!22810 () Bool)

(declare-fun b_and!13525 () Bool)

(assert (=> b!243822 (= tp!22810 b_and!13525)))

(declare-fun b!243812 () Bool)

(declare-fun res!119531 () Bool)

(declare-fun e!158219 () Bool)

(assert (=> b!243812 (=> (not res!119531) (not e!158219))))

(declare-datatypes ((List!3575 0))(
  ( (Nil!3572) (Cons!3571 (h!4228 (_ BitVec 64)) (t!8574 List!3575)) )
))
(declare-fun contains!1740 (List!3575 (_ BitVec 64)) Bool)

(assert (=> b!243812 (= res!119531 (not (contains!1740 Nil!3572 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!243813 () Bool)

(declare-datatypes ((Unit!7505 0))(
  ( (Unit!7506) )
))
(declare-fun e!158226 () Unit!7505)

(declare-fun Unit!7507 () Unit!7505)

(assert (=> b!243813 (= e!158226 Unit!7507)))

(declare-fun bm!22715 () Bool)

(declare-fun call!22718 () Bool)

(declare-datatypes ((V!8169 0))(
  ( (V!8170 (val!3240 Int)) )
))
(declare-datatypes ((ValueCell!2852 0))(
  ( (ValueCellFull!2852 (v!5288 V!8169)) (EmptyCell!2852) )
))
(declare-datatypes ((array!12071 0))(
  ( (array!12072 (arr!5731 (Array (_ BitVec 32) ValueCell!2852)) (size!6073 (_ BitVec 32))) )
))
(declare-datatypes ((array!12073 0))(
  ( (array!12074 (arr!5732 (Array (_ BitVec 32) (_ BitVec 64))) (size!6074 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3604 0))(
  ( (LongMapFixedSize!3605 (defaultEntry!4515 Int) (mask!10610 (_ BitVec 32)) (extraKeys!4252 (_ BitVec 32)) (zeroValue!4356 V!8169) (minValue!4356 V!8169) (_size!1851 (_ BitVec 32)) (_keys!6626 array!12073) (_values!4498 array!12071) (_vacant!1851 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3604)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12073 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22715 (= call!22718 (arrayContainsKey!0 (_keys!6626 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!243815 () Bool)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!243815 (= e!158219 (or (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6074 (_keys!6626 thiss!1504)))))))

(declare-fun b!243816 () Bool)

(declare-fun e!158228 () Bool)

(declare-fun tp_is_empty!6391 () Bool)

(assert (=> b!243816 (= e!158228 tp_is_empty!6391)))

(declare-fun b!243817 () Bool)

(declare-fun e!158230 () Bool)

(assert (=> b!243817 (= e!158230 (not call!22718))))

(declare-fun b!243818 () Bool)

(declare-fun e!158214 () Unit!7505)

(declare-fun lt!122338 () Unit!7505)

(assert (=> b!243818 (= e!158214 lt!122338)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!355 (array!12073 array!12071 (_ BitVec 32) (_ BitVec 32) V!8169 V!8169 (_ BitVec 64) Int) Unit!7505)

(assert (=> b!243818 (= lt!122338 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!355 (_keys!6626 thiss!1504) (_values!4498 thiss!1504) (mask!10610 thiss!1504) (extraKeys!4252 thiss!1504) (zeroValue!4356 thiss!1504) (minValue!4356 thiss!1504) key!932 (defaultEntry!4515 thiss!1504)))))

(declare-fun c!40702 () Bool)

(declare-datatypes ((SeekEntryResult!1043 0))(
  ( (MissingZero!1043 (index!6342 (_ BitVec 32))) (Found!1043 (index!6343 (_ BitVec 32))) (Intermediate!1043 (undefined!1855 Bool) (index!6344 (_ BitVec 32)) (x!24311 (_ BitVec 32))) (Undefined!1043) (MissingVacant!1043 (index!6345 (_ BitVec 32))) )
))
(declare-fun lt!122339 () SeekEntryResult!1043)

(get-info :version)

(assert (=> b!243818 (= c!40702 ((_ is MissingZero!1043) lt!122339))))

(declare-fun e!158223 () Bool)

(assert (=> b!243818 e!158223))

(declare-fun b!243819 () Bool)

(declare-fun res!119528 () Bool)

(assert (=> b!243819 (=> (not res!119528) (not e!158219))))

(declare-fun e!158231 () Bool)

(assert (=> b!243819 (= res!119528 e!158231)))

(declare-fun res!119538 () Bool)

(assert (=> b!243819 (=> res!119538 e!158231)))

(declare-fun e!158215 () Bool)

(assert (=> b!243819 (= res!119538 e!158215)))

(declare-fun res!119526 () Bool)

(assert (=> b!243819 (=> (not res!119526) (not e!158215))))

(assert (=> b!243819 (= res!119526 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!243820 () Bool)

(declare-fun e!158221 () Bool)

(assert (=> b!243820 (= e!158221 (not call!22718))))

(declare-fun b!243821 () Bool)

(declare-fun e!158224 () Bool)

(assert (=> b!243821 (= e!158224 tp_is_empty!6391)))

(declare-fun e!158229 () Bool)

(declare-fun e!158218 () Bool)

(declare-fun array_inv!3769 (array!12073) Bool)

(declare-fun array_inv!3770 (array!12071) Bool)

(assert (=> b!243822 (= e!158229 (and tp!22810 tp_is_empty!6391 (array_inv!3769 (_keys!6626 thiss!1504)) (array_inv!3770 (_values!4498 thiss!1504)) e!158218))))

(declare-fun b!243823 () Bool)

(declare-fun e!158220 () Bool)

(assert (=> b!243823 (= e!158220 ((_ is Undefined!1043) lt!122339))))

(declare-fun b!243824 () Bool)

(declare-fun e!158216 () Bool)

(declare-fun e!158225 () Bool)

(assert (=> b!243824 (= e!158216 e!158225)))

(declare-fun res!119524 () Bool)

(assert (=> b!243824 (=> (not res!119524) (not e!158225))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!243824 (= res!119524 (inRange!0 index!297 (mask!10610 thiss!1504)))))

(declare-fun lt!122340 () Unit!7505)

(assert (=> b!243824 (= lt!122340 e!158214)))

(declare-fun c!40701 () Bool)

(declare-datatypes ((tuple2!4704 0))(
  ( (tuple2!4705 (_1!2363 (_ BitVec 64)) (_2!2363 V!8169)) )
))
(declare-datatypes ((List!3576 0))(
  ( (Nil!3573) (Cons!3572 (h!4229 tuple2!4704) (t!8575 List!3576)) )
))
(declare-datatypes ((ListLongMap!3619 0))(
  ( (ListLongMap!3620 (toList!1825 List!3576)) )
))
(declare-fun contains!1741 (ListLongMap!3619 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1357 (array!12073 array!12071 (_ BitVec 32) (_ BitVec 32) V!8169 V!8169 (_ BitVec 32) Int) ListLongMap!3619)

(assert (=> b!243824 (= c!40701 (contains!1741 (getCurrentListMap!1357 (_keys!6626 thiss!1504) (_values!4498 thiss!1504) (mask!10610 thiss!1504) (extraKeys!4252 thiss!1504) (zeroValue!4356 thiss!1504) (minValue!4356 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4515 thiss!1504)) key!932))))

(declare-fun mapNonEmpty!10837 () Bool)

(declare-fun mapRes!10837 () Bool)

(declare-fun tp!22809 () Bool)

(assert (=> mapNonEmpty!10837 (= mapRes!10837 (and tp!22809 e!158224))))

(declare-fun mapKey!10837 () (_ BitVec 32))

(declare-fun mapValue!10837 () ValueCell!2852)

(declare-fun mapRest!10837 () (Array (_ BitVec 32) ValueCell!2852))

(assert (=> mapNonEmpty!10837 (= (arr!5731 (_values!4498 thiss!1504)) (store mapRest!10837 mapKey!10837 mapValue!10837))))

(declare-fun call!22719 () Bool)

(declare-fun bm!22716 () Bool)

(assert (=> bm!22716 (= call!22719 (inRange!0 (ite c!40702 (index!6342 lt!122339) (index!6345 lt!122339)) (mask!10610 thiss!1504)))))

(declare-fun b!243814 () Bool)

(declare-fun res!119525 () Bool)

(assert (=> b!243814 (=> (not res!119525) (not e!158219))))

(declare-fun arrayNoDuplicates!0 (array!12073 (_ BitVec 32) List!3575) Bool)

(assert (=> b!243814 (= res!119525 (arrayNoDuplicates!0 (_keys!6626 thiss!1504) #b00000000000000000000000000000000 Nil!3572))))

(declare-fun res!119539 () Bool)

(declare-fun e!158217 () Bool)

(assert (=> start!23222 (=> (not res!119539) (not e!158217))))

(declare-fun valid!1426 (LongMapFixedSize!3604) Bool)

(assert (=> start!23222 (= res!119539 (valid!1426 thiss!1504))))

(assert (=> start!23222 e!158217))

(assert (=> start!23222 e!158229))

(assert (=> start!23222 true))

(declare-fun b!243825 () Bool)

(declare-fun Unit!7508 () Unit!7505)

(assert (=> b!243825 (= e!158214 Unit!7508)))

(declare-fun lt!122335 () Unit!7505)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!363 (array!12073 array!12071 (_ BitVec 32) (_ BitVec 32) V!8169 V!8169 (_ BitVec 64) Int) Unit!7505)

(assert (=> b!243825 (= lt!122335 (lemmaInListMapThenSeekEntryOrOpenFindsIt!363 (_keys!6626 thiss!1504) (_values!4498 thiss!1504) (mask!10610 thiss!1504) (extraKeys!4252 thiss!1504) (zeroValue!4356 thiss!1504) (minValue!4356 thiss!1504) key!932 (defaultEntry!4515 thiss!1504)))))

(assert (=> b!243825 false))

(declare-fun b!243826 () Bool)

(assert (=> b!243826 (= e!158215 (contains!1740 Nil!3572 key!932))))

(declare-fun b!243827 () Bool)

(declare-fun res!119533 () Bool)

(assert (=> b!243827 (= res!119533 (= (select (arr!5732 (_keys!6626 thiss!1504)) (index!6345 lt!122339)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!243827 (=> (not res!119533) (not e!158230))))

(declare-fun b!243828 () Bool)

(declare-fun c!40700 () Bool)

(assert (=> b!243828 (= c!40700 ((_ is MissingVacant!1043) lt!122339))))

(assert (=> b!243828 (= e!158223 e!158220)))

(declare-fun b!243829 () Bool)

(declare-fun Unit!7509 () Unit!7505)

(assert (=> b!243829 (= e!158226 Unit!7509)))

(declare-fun lt!122336 () Unit!7505)

(declare-fun lemmaArrayContainsKeyThenInListMap!179 (array!12073 array!12071 (_ BitVec 32) (_ BitVec 32) V!8169 V!8169 (_ BitVec 64) (_ BitVec 32) Int) Unit!7505)

(assert (=> b!243829 (= lt!122336 (lemmaArrayContainsKeyThenInListMap!179 (_keys!6626 thiss!1504) (_values!4498 thiss!1504) (mask!10610 thiss!1504) (extraKeys!4252 thiss!1504) (zeroValue!4356 thiss!1504) (minValue!4356 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4515 thiss!1504)))))

(assert (=> b!243829 false))

(declare-fun b!243830 () Bool)

(assert (=> b!243830 (= e!158217 e!158216)))

(declare-fun res!119527 () Bool)

(assert (=> b!243830 (=> (not res!119527) (not e!158216))))

(assert (=> b!243830 (= res!119527 (or (= lt!122339 (MissingZero!1043 index!297)) (= lt!122339 (MissingVacant!1043 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12073 (_ BitVec 32)) SeekEntryResult!1043)

(assert (=> b!243830 (= lt!122339 (seekEntryOrOpen!0 key!932 (_keys!6626 thiss!1504) (mask!10610 thiss!1504)))))

(declare-fun mapIsEmpty!10837 () Bool)

(assert (=> mapIsEmpty!10837 mapRes!10837))

(declare-fun b!243831 () Bool)

(assert (=> b!243831 (= e!158218 (and e!158228 mapRes!10837))))

(declare-fun condMapEmpty!10837 () Bool)

(declare-fun mapDefault!10837 () ValueCell!2852)

(assert (=> b!243831 (= condMapEmpty!10837 (= (arr!5731 (_values!4498 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2852)) mapDefault!10837)))))

(declare-fun b!243832 () Bool)

(assert (=> b!243832 (= e!158220 e!158230)))

(declare-fun res!119535 () Bool)

(assert (=> b!243832 (= res!119535 call!22719)))

(assert (=> b!243832 (=> (not res!119535) (not e!158230))))

(declare-fun b!243833 () Bool)

(assert (=> b!243833 (= e!158225 e!158219)))

(declare-fun res!119532 () Bool)

(assert (=> b!243833 (=> (not res!119532) (not e!158219))))

(assert (=> b!243833 (= res!119532 (and (bvslt (size!6074 (_keys!6626 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6074 (_keys!6626 thiss!1504)))))))

(declare-fun lt!122337 () Unit!7505)

(assert (=> b!243833 (= lt!122337 e!158226)))

(declare-fun c!40699 () Bool)

(assert (=> b!243833 (= c!40699 (arrayContainsKey!0 (_keys!6626 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!243834 () Bool)

(declare-fun res!119536 () Bool)

(assert (=> b!243834 (=> (not res!119536) (not e!158221))))

(assert (=> b!243834 (= res!119536 call!22719)))

(assert (=> b!243834 (= e!158223 e!158221)))

(declare-fun b!243835 () Bool)

(declare-fun e!158222 () Bool)

(assert (=> b!243835 (= e!158231 e!158222)))

(declare-fun res!119537 () Bool)

(assert (=> b!243835 (=> (not res!119537) (not e!158222))))

(assert (=> b!243835 (= res!119537 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!243836 () Bool)

(assert (=> b!243836 (= e!158222 (not (contains!1740 Nil!3572 key!932)))))

(declare-fun b!243837 () Bool)

(declare-fun res!119523 () Bool)

(assert (=> b!243837 (=> (not res!119523) (not e!158219))))

(declare-fun noDuplicate!99 (List!3575) Bool)

(assert (=> b!243837 (= res!119523 (noDuplicate!99 Nil!3572))))

(declare-fun b!243838 () Bool)

(declare-fun res!119530 () Bool)

(assert (=> b!243838 (=> (not res!119530) (not e!158221))))

(assert (=> b!243838 (= res!119530 (= (select (arr!5732 (_keys!6626 thiss!1504)) (index!6342 lt!122339)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!243839 () Bool)

(declare-fun res!119529 () Bool)

(assert (=> b!243839 (=> (not res!119529) (not e!158217))))

(assert (=> b!243839 (= res!119529 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!243840 () Bool)

(declare-fun res!119534 () Bool)

(assert (=> b!243840 (=> (not res!119534) (not e!158219))))

(assert (=> b!243840 (= res!119534 (not (contains!1740 Nil!3572 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!23222 res!119539) b!243839))

(assert (= (and b!243839 res!119529) b!243830))

(assert (= (and b!243830 res!119527) b!243824))

(assert (= (and b!243824 c!40701) b!243825))

(assert (= (and b!243824 (not c!40701)) b!243818))

(assert (= (and b!243818 c!40702) b!243834))

(assert (= (and b!243818 (not c!40702)) b!243828))

(assert (= (and b!243834 res!119536) b!243838))

(assert (= (and b!243838 res!119530) b!243820))

(assert (= (and b!243828 c!40700) b!243832))

(assert (= (and b!243828 (not c!40700)) b!243823))

(assert (= (and b!243832 res!119535) b!243827))

(assert (= (and b!243827 res!119533) b!243817))

(assert (= (or b!243834 b!243832) bm!22716))

(assert (= (or b!243820 b!243817) bm!22715))

(assert (= (and b!243824 res!119524) b!243833))

(assert (= (and b!243833 c!40699) b!243829))

(assert (= (and b!243833 (not c!40699)) b!243813))

(assert (= (and b!243833 res!119532) b!243837))

(assert (= (and b!243837 res!119523) b!243812))

(assert (= (and b!243812 res!119531) b!243840))

(assert (= (and b!243840 res!119534) b!243819))

(assert (= (and b!243819 res!119526) b!243826))

(assert (= (and b!243819 (not res!119538)) b!243835))

(assert (= (and b!243835 res!119537) b!243836))

(assert (= (and b!243819 res!119528) b!243814))

(assert (= (and b!243814 res!119525) b!243815))

(assert (= (and b!243831 condMapEmpty!10837) mapIsEmpty!10837))

(assert (= (and b!243831 (not condMapEmpty!10837)) mapNonEmpty!10837))

(assert (= (and mapNonEmpty!10837 ((_ is ValueCellFull!2852) mapValue!10837)) b!243821))

(assert (= (and b!243831 ((_ is ValueCellFull!2852) mapDefault!10837)) b!243816))

(assert (= b!243822 b!243831))

(assert (= start!23222 b!243822))

(declare-fun m!262213 () Bool)

(assert (=> b!243836 m!262213))

(declare-fun m!262215 () Bool)

(assert (=> b!243822 m!262215))

(declare-fun m!262217 () Bool)

(assert (=> b!243822 m!262217))

(declare-fun m!262219 () Bool)

(assert (=> b!243833 m!262219))

(assert (=> bm!22715 m!262219))

(declare-fun m!262221 () Bool)

(assert (=> b!243837 m!262221))

(declare-fun m!262223 () Bool)

(assert (=> b!243812 m!262223))

(declare-fun m!262225 () Bool)

(assert (=> b!243824 m!262225))

(declare-fun m!262227 () Bool)

(assert (=> b!243824 m!262227))

(assert (=> b!243824 m!262227))

(declare-fun m!262229 () Bool)

(assert (=> b!243824 m!262229))

(declare-fun m!262231 () Bool)

(assert (=> bm!22716 m!262231))

(assert (=> b!243826 m!262213))

(declare-fun m!262233 () Bool)

(assert (=> b!243838 m!262233))

(declare-fun m!262235 () Bool)

(assert (=> b!243830 m!262235))

(declare-fun m!262237 () Bool)

(assert (=> b!243840 m!262237))

(declare-fun m!262239 () Bool)

(assert (=> b!243829 m!262239))

(declare-fun m!262241 () Bool)

(assert (=> mapNonEmpty!10837 m!262241))

(declare-fun m!262243 () Bool)

(assert (=> b!243827 m!262243))

(declare-fun m!262245 () Bool)

(assert (=> b!243814 m!262245))

(declare-fun m!262247 () Bool)

(assert (=> start!23222 m!262247))

(declare-fun m!262249 () Bool)

(assert (=> b!243825 m!262249))

(declare-fun m!262251 () Bool)

(assert (=> b!243818 m!262251))

(check-sat (not b!243814) (not b!243833) (not b!243829) (not b!243837) (not b!243840) (not b!243826) (not bm!22715) (not b_next!6529) b_and!13525 (not b!243836) tp_is_empty!6391 (not b!243812) (not b!243825) (not b!243818) (not b!243822) (not mapNonEmpty!10837) (not bm!22716) (not start!23222) (not b!243830) (not b!243824))
(check-sat b_and!13525 (not b_next!6529))
(get-model)

(declare-fun b!244027 () Bool)

(declare-fun c!40735 () Bool)

(declare-fun lt!122384 () (_ BitVec 64))

(assert (=> b!244027 (= c!40735 (= lt!122384 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!158348 () SeekEntryResult!1043)

(declare-fun e!158346 () SeekEntryResult!1043)

(assert (=> b!244027 (= e!158348 e!158346)))

(declare-fun b!244028 () Bool)

(declare-fun lt!122383 () SeekEntryResult!1043)

(assert (=> b!244028 (= e!158346 (MissingZero!1043 (index!6344 lt!122383)))))

(declare-fun b!244029 () Bool)

(assert (=> b!244029 (= e!158348 (Found!1043 (index!6344 lt!122383)))))

(declare-fun b!244030 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12073 (_ BitVec 32)) SeekEntryResult!1043)

(assert (=> b!244030 (= e!158346 (seekKeyOrZeroReturnVacant!0 (x!24311 lt!122383) (index!6344 lt!122383) (index!6344 lt!122383) key!932 (_keys!6626 thiss!1504) (mask!10610 thiss!1504)))))

(declare-fun d!60145 () Bool)

(declare-fun lt!122385 () SeekEntryResult!1043)

(assert (=> d!60145 (and (or ((_ is Undefined!1043) lt!122385) (not ((_ is Found!1043) lt!122385)) (and (bvsge (index!6343 lt!122385) #b00000000000000000000000000000000) (bvslt (index!6343 lt!122385) (size!6074 (_keys!6626 thiss!1504))))) (or ((_ is Undefined!1043) lt!122385) ((_ is Found!1043) lt!122385) (not ((_ is MissingZero!1043) lt!122385)) (and (bvsge (index!6342 lt!122385) #b00000000000000000000000000000000) (bvslt (index!6342 lt!122385) (size!6074 (_keys!6626 thiss!1504))))) (or ((_ is Undefined!1043) lt!122385) ((_ is Found!1043) lt!122385) ((_ is MissingZero!1043) lt!122385) (not ((_ is MissingVacant!1043) lt!122385)) (and (bvsge (index!6345 lt!122385) #b00000000000000000000000000000000) (bvslt (index!6345 lt!122385) (size!6074 (_keys!6626 thiss!1504))))) (or ((_ is Undefined!1043) lt!122385) (ite ((_ is Found!1043) lt!122385) (= (select (arr!5732 (_keys!6626 thiss!1504)) (index!6343 lt!122385)) key!932) (ite ((_ is MissingZero!1043) lt!122385) (= (select (arr!5732 (_keys!6626 thiss!1504)) (index!6342 lt!122385)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1043) lt!122385) (= (select (arr!5732 (_keys!6626 thiss!1504)) (index!6345 lt!122385)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!158347 () SeekEntryResult!1043)

(assert (=> d!60145 (= lt!122385 e!158347)))

(declare-fun c!40734 () Bool)

(assert (=> d!60145 (= c!40734 (and ((_ is Intermediate!1043) lt!122383) (undefined!1855 lt!122383)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12073 (_ BitVec 32)) SeekEntryResult!1043)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60145 (= lt!122383 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10610 thiss!1504)) key!932 (_keys!6626 thiss!1504) (mask!10610 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!60145 (validMask!0 (mask!10610 thiss!1504))))

(assert (=> d!60145 (= (seekEntryOrOpen!0 key!932 (_keys!6626 thiss!1504) (mask!10610 thiss!1504)) lt!122385)))

(declare-fun b!244031 () Bool)

(assert (=> b!244031 (= e!158347 Undefined!1043)))

(declare-fun b!244032 () Bool)

(assert (=> b!244032 (= e!158347 e!158348)))

(assert (=> b!244032 (= lt!122384 (select (arr!5732 (_keys!6626 thiss!1504)) (index!6344 lt!122383)))))

(declare-fun c!40733 () Bool)

(assert (=> b!244032 (= c!40733 (= lt!122384 key!932))))

(assert (= (and d!60145 c!40734) b!244031))

(assert (= (and d!60145 (not c!40734)) b!244032))

(assert (= (and b!244032 c!40733) b!244029))

(assert (= (and b!244032 (not c!40733)) b!244027))

(assert (= (and b!244027 c!40735) b!244028))

(assert (= (and b!244027 (not c!40735)) b!244030))

(declare-fun m!262333 () Bool)

(assert (=> b!244030 m!262333))

(declare-fun m!262335 () Bool)

(assert (=> d!60145 m!262335))

(assert (=> d!60145 m!262335))

(declare-fun m!262337 () Bool)

(assert (=> d!60145 m!262337))

(declare-fun m!262339 () Bool)

(assert (=> d!60145 m!262339))

(declare-fun m!262341 () Bool)

(assert (=> d!60145 m!262341))

(declare-fun m!262343 () Bool)

(assert (=> d!60145 m!262343))

(declare-fun m!262345 () Bool)

(assert (=> d!60145 m!262345))

(declare-fun m!262347 () Bool)

(assert (=> b!244032 m!262347))

(assert (=> b!243830 d!60145))

(declare-fun d!60147 () Bool)

(declare-fun lt!122388 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!162 (List!3575) (InoxSet (_ BitVec 64)))

(assert (=> d!60147 (= lt!122388 (select (content!162 Nil!3572) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!158353 () Bool)

(assert (=> d!60147 (= lt!122388 e!158353)))

(declare-fun res!119647 () Bool)

(assert (=> d!60147 (=> (not res!119647) (not e!158353))))

(assert (=> d!60147 (= res!119647 ((_ is Cons!3571) Nil!3572))))

(assert (=> d!60147 (= (contains!1740 Nil!3572 #b1000000000000000000000000000000000000000000000000000000000000000) lt!122388)))

(declare-fun b!244037 () Bool)

(declare-fun e!158354 () Bool)

(assert (=> b!244037 (= e!158353 e!158354)))

(declare-fun res!119646 () Bool)

(assert (=> b!244037 (=> res!119646 e!158354)))

(assert (=> b!244037 (= res!119646 (= (h!4228 Nil!3572) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!244038 () Bool)

(assert (=> b!244038 (= e!158354 (contains!1740 (t!8574 Nil!3572) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!60147 res!119647) b!244037))

(assert (= (and b!244037 (not res!119646)) b!244038))

(declare-fun m!262349 () Bool)

(assert (=> d!60147 m!262349))

(declare-fun m!262351 () Bool)

(assert (=> d!60147 m!262351))

(declare-fun m!262353 () Bool)

(assert (=> b!244038 m!262353))

(assert (=> b!243840 d!60147))

(declare-fun d!60149 () Bool)

(declare-fun lt!122389 () Bool)

(assert (=> d!60149 (= lt!122389 (select (content!162 Nil!3572) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!158355 () Bool)

(assert (=> d!60149 (= lt!122389 e!158355)))

(declare-fun res!119649 () Bool)

(assert (=> d!60149 (=> (not res!119649) (not e!158355))))

(assert (=> d!60149 (= res!119649 ((_ is Cons!3571) Nil!3572))))

(assert (=> d!60149 (= (contains!1740 Nil!3572 #b0000000000000000000000000000000000000000000000000000000000000000) lt!122389)))

(declare-fun b!244039 () Bool)

(declare-fun e!158356 () Bool)

(assert (=> b!244039 (= e!158355 e!158356)))

(declare-fun res!119648 () Bool)

(assert (=> b!244039 (=> res!119648 e!158356)))

(assert (=> b!244039 (= res!119648 (= (h!4228 Nil!3572) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!244040 () Bool)

(assert (=> b!244040 (= e!158356 (contains!1740 (t!8574 Nil!3572) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!60149 res!119649) b!244039))

(assert (= (and b!244039 (not res!119648)) b!244040))

(assert (=> d!60149 m!262349))

(declare-fun m!262355 () Bool)

(assert (=> d!60149 m!262355))

(declare-fun m!262357 () Bool)

(assert (=> b!244040 m!262357))

(assert (=> b!243812 d!60149))

(declare-fun d!60151 () Bool)

(assert (=> d!60151 (= (array_inv!3769 (_keys!6626 thiss!1504)) (bvsge (size!6074 (_keys!6626 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!243822 d!60151))

(declare-fun d!60153 () Bool)

(assert (=> d!60153 (= (array_inv!3770 (_values!4498 thiss!1504)) (bvsge (size!6073 (_values!4498 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!243822 d!60153))

(declare-fun d!60155 () Bool)

(declare-fun res!119656 () Bool)

(declare-fun e!158359 () Bool)

(assert (=> d!60155 (=> (not res!119656) (not e!158359))))

(declare-fun simpleValid!250 (LongMapFixedSize!3604) Bool)

(assert (=> d!60155 (= res!119656 (simpleValid!250 thiss!1504))))

(assert (=> d!60155 (= (valid!1426 thiss!1504) e!158359)))

(declare-fun b!244047 () Bool)

(declare-fun res!119657 () Bool)

(assert (=> b!244047 (=> (not res!119657) (not e!158359))))

(declare-fun arrayCountValidKeys!0 (array!12073 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!244047 (= res!119657 (= (arrayCountValidKeys!0 (_keys!6626 thiss!1504) #b00000000000000000000000000000000 (size!6074 (_keys!6626 thiss!1504))) (_size!1851 thiss!1504)))))

(declare-fun b!244048 () Bool)

(declare-fun res!119658 () Bool)

(assert (=> b!244048 (=> (not res!119658) (not e!158359))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12073 (_ BitVec 32)) Bool)

(assert (=> b!244048 (= res!119658 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6626 thiss!1504) (mask!10610 thiss!1504)))))

(declare-fun b!244049 () Bool)

(assert (=> b!244049 (= e!158359 (arrayNoDuplicates!0 (_keys!6626 thiss!1504) #b00000000000000000000000000000000 Nil!3572))))

(assert (= (and d!60155 res!119656) b!244047))

(assert (= (and b!244047 res!119657) b!244048))

(assert (= (and b!244048 res!119658) b!244049))

(declare-fun m!262359 () Bool)

(assert (=> d!60155 m!262359))

(declare-fun m!262361 () Bool)

(assert (=> b!244047 m!262361))

(declare-fun m!262363 () Bool)

(assert (=> b!244048 m!262363))

(assert (=> b!244049 m!262245))

(assert (=> start!23222 d!60155))

(declare-fun d!60157 () Bool)

(declare-fun res!119663 () Bool)

(declare-fun e!158364 () Bool)

(assert (=> d!60157 (=> res!119663 e!158364)))

(assert (=> d!60157 (= res!119663 ((_ is Nil!3572) Nil!3572))))

(assert (=> d!60157 (= (noDuplicate!99 Nil!3572) e!158364)))

(declare-fun b!244054 () Bool)

(declare-fun e!158365 () Bool)

(assert (=> b!244054 (= e!158364 e!158365)))

(declare-fun res!119664 () Bool)

(assert (=> b!244054 (=> (not res!119664) (not e!158365))))

(assert (=> b!244054 (= res!119664 (not (contains!1740 (t!8574 Nil!3572) (h!4228 Nil!3572))))))

(declare-fun b!244055 () Bool)

(assert (=> b!244055 (= e!158365 (noDuplicate!99 (t!8574 Nil!3572)))))

(assert (= (and d!60157 (not res!119663)) b!244054))

(assert (= (and b!244054 res!119664) b!244055))

(declare-fun m!262365 () Bool)

(assert (=> b!244054 m!262365))

(declare-fun m!262367 () Bool)

(assert (=> b!244055 m!262367))

(assert (=> b!243837 d!60157))

(declare-fun d!60159 () Bool)

(assert (=> d!60159 (contains!1741 (getCurrentListMap!1357 (_keys!6626 thiss!1504) (_values!4498 thiss!1504) (mask!10610 thiss!1504) (extraKeys!4252 thiss!1504) (zeroValue!4356 thiss!1504) (minValue!4356 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4515 thiss!1504)) key!932)))

(declare-fun lt!122392 () Unit!7505)

(declare-fun choose!1144 (array!12073 array!12071 (_ BitVec 32) (_ BitVec 32) V!8169 V!8169 (_ BitVec 64) (_ BitVec 32) Int) Unit!7505)

(assert (=> d!60159 (= lt!122392 (choose!1144 (_keys!6626 thiss!1504) (_values!4498 thiss!1504) (mask!10610 thiss!1504) (extraKeys!4252 thiss!1504) (zeroValue!4356 thiss!1504) (minValue!4356 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4515 thiss!1504)))))

(assert (=> d!60159 (validMask!0 (mask!10610 thiss!1504))))

(assert (=> d!60159 (= (lemmaArrayContainsKeyThenInListMap!179 (_keys!6626 thiss!1504) (_values!4498 thiss!1504) (mask!10610 thiss!1504) (extraKeys!4252 thiss!1504) (zeroValue!4356 thiss!1504) (minValue!4356 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4515 thiss!1504)) lt!122392)))

(declare-fun bs!8895 () Bool)

(assert (= bs!8895 d!60159))

(assert (=> bs!8895 m!262227))

(assert (=> bs!8895 m!262227))

(assert (=> bs!8895 m!262229))

(declare-fun m!262369 () Bool)

(assert (=> bs!8895 m!262369))

(assert (=> bs!8895 m!262341))

(assert (=> b!243829 d!60159))

(declare-fun d!60161 () Bool)

(declare-fun e!158368 () Bool)

(assert (=> d!60161 e!158368))

(declare-fun res!119670 () Bool)

(assert (=> d!60161 (=> (not res!119670) (not e!158368))))

(declare-fun lt!122398 () SeekEntryResult!1043)

(assert (=> d!60161 (= res!119670 ((_ is Found!1043) lt!122398))))

(assert (=> d!60161 (= lt!122398 (seekEntryOrOpen!0 key!932 (_keys!6626 thiss!1504) (mask!10610 thiss!1504)))))

(declare-fun lt!122397 () Unit!7505)

(declare-fun choose!1145 (array!12073 array!12071 (_ BitVec 32) (_ BitVec 32) V!8169 V!8169 (_ BitVec 64) Int) Unit!7505)

(assert (=> d!60161 (= lt!122397 (choose!1145 (_keys!6626 thiss!1504) (_values!4498 thiss!1504) (mask!10610 thiss!1504) (extraKeys!4252 thiss!1504) (zeroValue!4356 thiss!1504) (minValue!4356 thiss!1504) key!932 (defaultEntry!4515 thiss!1504)))))

(assert (=> d!60161 (validMask!0 (mask!10610 thiss!1504))))

(assert (=> d!60161 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!363 (_keys!6626 thiss!1504) (_values!4498 thiss!1504) (mask!10610 thiss!1504) (extraKeys!4252 thiss!1504) (zeroValue!4356 thiss!1504) (minValue!4356 thiss!1504) key!932 (defaultEntry!4515 thiss!1504)) lt!122397)))

(declare-fun b!244060 () Bool)

(declare-fun res!119669 () Bool)

(assert (=> b!244060 (=> (not res!119669) (not e!158368))))

(assert (=> b!244060 (= res!119669 (inRange!0 (index!6343 lt!122398) (mask!10610 thiss!1504)))))

(declare-fun b!244061 () Bool)

(assert (=> b!244061 (= e!158368 (= (select (arr!5732 (_keys!6626 thiss!1504)) (index!6343 lt!122398)) key!932))))

(assert (=> b!244061 (and (bvsge (index!6343 lt!122398) #b00000000000000000000000000000000) (bvslt (index!6343 lt!122398) (size!6074 (_keys!6626 thiss!1504))))))

(assert (= (and d!60161 res!119670) b!244060))

(assert (= (and b!244060 res!119669) b!244061))

(assert (=> d!60161 m!262235))

(declare-fun m!262371 () Bool)

(assert (=> d!60161 m!262371))

(assert (=> d!60161 m!262341))

(declare-fun m!262373 () Bool)

(assert (=> b!244060 m!262373))

(declare-fun m!262375 () Bool)

(assert (=> b!244061 m!262375))

(assert (=> b!243825 d!60161))

(declare-fun d!60163 () Bool)

(declare-fun lt!122399 () Bool)

(assert (=> d!60163 (= lt!122399 (select (content!162 Nil!3572) key!932))))

(declare-fun e!158369 () Bool)

(assert (=> d!60163 (= lt!122399 e!158369)))

(declare-fun res!119672 () Bool)

(assert (=> d!60163 (=> (not res!119672) (not e!158369))))

(assert (=> d!60163 (= res!119672 ((_ is Cons!3571) Nil!3572))))

(assert (=> d!60163 (= (contains!1740 Nil!3572 key!932) lt!122399)))

(declare-fun b!244062 () Bool)

(declare-fun e!158370 () Bool)

(assert (=> b!244062 (= e!158369 e!158370)))

(declare-fun res!119671 () Bool)

(assert (=> b!244062 (=> res!119671 e!158370)))

(assert (=> b!244062 (= res!119671 (= (h!4228 Nil!3572) key!932))))

(declare-fun b!244063 () Bool)

(assert (=> b!244063 (= e!158370 (contains!1740 (t!8574 Nil!3572) key!932))))

(assert (= (and d!60163 res!119672) b!244062))

(assert (= (and b!244062 (not res!119671)) b!244063))

(assert (=> d!60163 m!262349))

(declare-fun m!262377 () Bool)

(assert (=> d!60163 m!262377))

(declare-fun m!262379 () Bool)

(assert (=> b!244063 m!262379))

(assert (=> b!243826 d!60163))

(assert (=> b!243836 d!60163))

(declare-fun bm!22733 () Bool)

(declare-fun call!22736 () Bool)

(assert (=> bm!22733 (= call!22736 (arrayContainsKey!0 (_keys!6626 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun call!22737 () Bool)

(declare-fun c!40740 () Bool)

(declare-fun lt!122404 () SeekEntryResult!1043)

(declare-fun bm!22734 () Bool)

(assert (=> bm!22734 (= call!22737 (inRange!0 (ite c!40740 (index!6342 lt!122404) (index!6345 lt!122404)) (mask!10610 thiss!1504)))))

(declare-fun b!244080 () Bool)

(declare-fun e!158382 () Bool)

(assert (=> b!244080 (= e!158382 (not call!22736))))

(declare-fun b!244081 () Bool)

(declare-fun e!158381 () Bool)

(declare-fun e!158380 () Bool)

(assert (=> b!244081 (= e!158381 e!158380)))

(declare-fun c!40741 () Bool)

(assert (=> b!244081 (= c!40741 ((_ is MissingVacant!1043) lt!122404))))

(declare-fun b!244082 () Bool)

(declare-fun res!119681 () Bool)

(declare-fun e!158379 () Bool)

(assert (=> b!244082 (=> (not res!119681) (not e!158379))))

(assert (=> b!244082 (= res!119681 call!22737)))

(assert (=> b!244082 (= e!158380 e!158379)))

(declare-fun d!60165 () Bool)

(assert (=> d!60165 e!158381))

(assert (=> d!60165 (= c!40740 ((_ is MissingZero!1043) lt!122404))))

(assert (=> d!60165 (= lt!122404 (seekEntryOrOpen!0 key!932 (_keys!6626 thiss!1504) (mask!10610 thiss!1504)))))

(declare-fun lt!122405 () Unit!7505)

(declare-fun choose!1146 (array!12073 array!12071 (_ BitVec 32) (_ BitVec 32) V!8169 V!8169 (_ BitVec 64) Int) Unit!7505)

(assert (=> d!60165 (= lt!122405 (choose!1146 (_keys!6626 thiss!1504) (_values!4498 thiss!1504) (mask!10610 thiss!1504) (extraKeys!4252 thiss!1504) (zeroValue!4356 thiss!1504) (minValue!4356 thiss!1504) key!932 (defaultEntry!4515 thiss!1504)))))

(assert (=> d!60165 (validMask!0 (mask!10610 thiss!1504))))

(assert (=> d!60165 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!355 (_keys!6626 thiss!1504) (_values!4498 thiss!1504) (mask!10610 thiss!1504) (extraKeys!4252 thiss!1504) (zeroValue!4356 thiss!1504) (minValue!4356 thiss!1504) key!932 (defaultEntry!4515 thiss!1504)) lt!122405)))

(declare-fun b!244083 () Bool)

(assert (=> b!244083 (= e!158381 e!158382)))

(declare-fun res!119683 () Bool)

(assert (=> b!244083 (= res!119683 call!22737)))

(assert (=> b!244083 (=> (not res!119683) (not e!158382))))

(declare-fun b!244084 () Bool)

(assert (=> b!244084 (= e!158379 (not call!22736))))

(declare-fun b!244085 () Bool)

(assert (=> b!244085 (= e!158380 ((_ is Undefined!1043) lt!122404))))

(declare-fun b!244086 () Bool)

(assert (=> b!244086 (and (bvsge (index!6342 lt!122404) #b00000000000000000000000000000000) (bvslt (index!6342 lt!122404) (size!6074 (_keys!6626 thiss!1504))))))

(declare-fun res!119684 () Bool)

(assert (=> b!244086 (= res!119684 (= (select (arr!5732 (_keys!6626 thiss!1504)) (index!6342 lt!122404)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!244086 (=> (not res!119684) (not e!158382))))

(declare-fun b!244087 () Bool)

(declare-fun res!119682 () Bool)

(assert (=> b!244087 (=> (not res!119682) (not e!158379))))

(assert (=> b!244087 (= res!119682 (= (select (arr!5732 (_keys!6626 thiss!1504)) (index!6345 lt!122404)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!244087 (and (bvsge (index!6345 lt!122404) #b00000000000000000000000000000000) (bvslt (index!6345 lt!122404) (size!6074 (_keys!6626 thiss!1504))))))

(assert (= (and d!60165 c!40740) b!244083))

(assert (= (and d!60165 (not c!40740)) b!244081))

(assert (= (and b!244083 res!119683) b!244086))

(assert (= (and b!244086 res!119684) b!244080))

(assert (= (and b!244081 c!40741) b!244082))

(assert (= (and b!244081 (not c!40741)) b!244085))

(assert (= (and b!244082 res!119681) b!244087))

(assert (= (and b!244087 res!119682) b!244084))

(assert (= (or b!244083 b!244082) bm!22734))

(assert (= (or b!244080 b!244084) bm!22733))

(assert (=> bm!22733 m!262219))

(declare-fun m!262381 () Bool)

(assert (=> b!244087 m!262381))

(assert (=> d!60165 m!262235))

(declare-fun m!262383 () Bool)

(assert (=> d!60165 m!262383))

(assert (=> d!60165 m!262341))

(declare-fun m!262385 () Bool)

(assert (=> b!244086 m!262385))

(declare-fun m!262387 () Bool)

(assert (=> bm!22734 m!262387))

(assert (=> b!243818 d!60165))

(declare-fun bm!22737 () Bool)

(declare-fun call!22740 () Bool)

(declare-fun c!40744 () Bool)

(assert (=> bm!22737 (= call!22740 (arrayNoDuplicates!0 (_keys!6626 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!40744 (Cons!3571 (select (arr!5732 (_keys!6626 thiss!1504)) #b00000000000000000000000000000000) Nil!3572) Nil!3572)))))

(declare-fun b!244098 () Bool)

(declare-fun e!158392 () Bool)

(declare-fun e!158394 () Bool)

(assert (=> b!244098 (= e!158392 e!158394)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!244098 (= c!40744 (validKeyInArray!0 (select (arr!5732 (_keys!6626 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!60167 () Bool)

(declare-fun res!119691 () Bool)

(declare-fun e!158393 () Bool)

(assert (=> d!60167 (=> res!119691 e!158393)))

(assert (=> d!60167 (= res!119691 (bvsge #b00000000000000000000000000000000 (size!6074 (_keys!6626 thiss!1504))))))

(assert (=> d!60167 (= (arrayNoDuplicates!0 (_keys!6626 thiss!1504) #b00000000000000000000000000000000 Nil!3572) e!158393)))

(declare-fun b!244099 () Bool)

(assert (=> b!244099 (= e!158394 call!22740)))

(declare-fun b!244100 () Bool)

(assert (=> b!244100 (= e!158394 call!22740)))

(declare-fun b!244101 () Bool)

(assert (=> b!244101 (= e!158393 e!158392)))

(declare-fun res!119692 () Bool)

(assert (=> b!244101 (=> (not res!119692) (not e!158392))))

(declare-fun e!158391 () Bool)

(assert (=> b!244101 (= res!119692 (not e!158391))))

(declare-fun res!119693 () Bool)

(assert (=> b!244101 (=> (not res!119693) (not e!158391))))

(assert (=> b!244101 (= res!119693 (validKeyInArray!0 (select (arr!5732 (_keys!6626 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!244102 () Bool)

(assert (=> b!244102 (= e!158391 (contains!1740 Nil!3572 (select (arr!5732 (_keys!6626 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!60167 (not res!119691)) b!244101))

(assert (= (and b!244101 res!119693) b!244102))

(assert (= (and b!244101 res!119692) b!244098))

(assert (= (and b!244098 c!40744) b!244100))

(assert (= (and b!244098 (not c!40744)) b!244099))

(assert (= (or b!244100 b!244099) bm!22737))

(declare-fun m!262389 () Bool)

(assert (=> bm!22737 m!262389))

(declare-fun m!262391 () Bool)

(assert (=> bm!22737 m!262391))

(assert (=> b!244098 m!262389))

(assert (=> b!244098 m!262389))

(declare-fun m!262393 () Bool)

(assert (=> b!244098 m!262393))

(assert (=> b!244101 m!262389))

(assert (=> b!244101 m!262389))

(assert (=> b!244101 m!262393))

(assert (=> b!244102 m!262389))

(assert (=> b!244102 m!262389))

(declare-fun m!262395 () Bool)

(assert (=> b!244102 m!262395))

(assert (=> b!243814 d!60167))

(declare-fun d!60169 () Bool)

(assert (=> d!60169 (= (inRange!0 index!297 (mask!10610 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10610 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!243824 d!60169))

(declare-fun d!60171 () Bool)

(declare-fun e!158400 () Bool)

(assert (=> d!60171 e!158400))

(declare-fun res!119696 () Bool)

(assert (=> d!60171 (=> res!119696 e!158400)))

(declare-fun lt!122415 () Bool)

(assert (=> d!60171 (= res!119696 (not lt!122415))))

(declare-fun lt!122414 () Bool)

(assert (=> d!60171 (= lt!122415 lt!122414)))

(declare-fun lt!122417 () Unit!7505)

(declare-fun e!158399 () Unit!7505)

(assert (=> d!60171 (= lt!122417 e!158399)))

(declare-fun c!40747 () Bool)

(assert (=> d!60171 (= c!40747 lt!122414)))

(declare-fun containsKey!277 (List!3576 (_ BitVec 64)) Bool)

(assert (=> d!60171 (= lt!122414 (containsKey!277 (toList!1825 (getCurrentListMap!1357 (_keys!6626 thiss!1504) (_values!4498 thiss!1504) (mask!10610 thiss!1504) (extraKeys!4252 thiss!1504) (zeroValue!4356 thiss!1504) (minValue!4356 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4515 thiss!1504))) key!932))))

(assert (=> d!60171 (= (contains!1741 (getCurrentListMap!1357 (_keys!6626 thiss!1504) (_values!4498 thiss!1504) (mask!10610 thiss!1504) (extraKeys!4252 thiss!1504) (zeroValue!4356 thiss!1504) (minValue!4356 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4515 thiss!1504)) key!932) lt!122415)))

(declare-fun b!244109 () Bool)

(declare-fun lt!122416 () Unit!7505)

(assert (=> b!244109 (= e!158399 lt!122416)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!225 (List!3576 (_ BitVec 64)) Unit!7505)

(assert (=> b!244109 (= lt!122416 (lemmaContainsKeyImpliesGetValueByKeyDefined!225 (toList!1825 (getCurrentListMap!1357 (_keys!6626 thiss!1504) (_values!4498 thiss!1504) (mask!10610 thiss!1504) (extraKeys!4252 thiss!1504) (zeroValue!4356 thiss!1504) (minValue!4356 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4515 thiss!1504))) key!932))))

(declare-datatypes ((Option!292 0))(
  ( (Some!291 (v!5292 V!8169)) (None!290) )
))
(declare-fun isDefined!226 (Option!292) Bool)

(declare-fun getValueByKey!286 (List!3576 (_ BitVec 64)) Option!292)

(assert (=> b!244109 (isDefined!226 (getValueByKey!286 (toList!1825 (getCurrentListMap!1357 (_keys!6626 thiss!1504) (_values!4498 thiss!1504) (mask!10610 thiss!1504) (extraKeys!4252 thiss!1504) (zeroValue!4356 thiss!1504) (minValue!4356 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4515 thiss!1504))) key!932))))

(declare-fun b!244110 () Bool)

(declare-fun Unit!7516 () Unit!7505)

(assert (=> b!244110 (= e!158399 Unit!7516)))

(declare-fun b!244111 () Bool)

(assert (=> b!244111 (= e!158400 (isDefined!226 (getValueByKey!286 (toList!1825 (getCurrentListMap!1357 (_keys!6626 thiss!1504) (_values!4498 thiss!1504) (mask!10610 thiss!1504) (extraKeys!4252 thiss!1504) (zeroValue!4356 thiss!1504) (minValue!4356 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4515 thiss!1504))) key!932)))))

(assert (= (and d!60171 c!40747) b!244109))

(assert (= (and d!60171 (not c!40747)) b!244110))

(assert (= (and d!60171 (not res!119696)) b!244111))

(declare-fun m!262397 () Bool)

(assert (=> d!60171 m!262397))

(declare-fun m!262399 () Bool)

(assert (=> b!244109 m!262399))

(declare-fun m!262401 () Bool)

(assert (=> b!244109 m!262401))

(assert (=> b!244109 m!262401))

(declare-fun m!262403 () Bool)

(assert (=> b!244109 m!262403))

(assert (=> b!244111 m!262401))

(assert (=> b!244111 m!262401))

(assert (=> b!244111 m!262403))

(assert (=> b!243824 d!60171))

(declare-fun b!244154 () Bool)

(declare-fun e!158433 () Bool)

(declare-fun e!158429 () Bool)

(assert (=> b!244154 (= e!158433 e!158429)))

(declare-fun res!119715 () Bool)

(assert (=> b!244154 (=> (not res!119715) (not e!158429))))

(declare-fun lt!122475 () ListLongMap!3619)

(assert (=> b!244154 (= res!119715 (contains!1741 lt!122475 (select (arr!5732 (_keys!6626 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!244154 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6074 (_keys!6626 thiss!1504))))))

(declare-fun bm!22752 () Bool)

(declare-fun call!22755 () ListLongMap!3619)

(declare-fun call!22759 () ListLongMap!3619)

(assert (=> bm!22752 (= call!22755 call!22759)))

(declare-fun b!244155 () Bool)

(declare-fun e!158437 () ListLongMap!3619)

(declare-fun call!22758 () ListLongMap!3619)

(assert (=> b!244155 (= e!158437 call!22758)))

(declare-fun b!244156 () Bool)

(declare-fun call!22760 () ListLongMap!3619)

(assert (=> b!244156 (= e!158437 call!22760)))

(declare-fun b!244157 () Bool)

(declare-fun res!119723 () Bool)

(declare-fun e!158435 () Bool)

(assert (=> b!244157 (=> (not res!119723) (not e!158435))))

(declare-fun e!158434 () Bool)

(assert (=> b!244157 (= res!119723 e!158434)))

(declare-fun c!40764 () Bool)

(assert (=> b!244157 (= c!40764 (not (= (bvand (extraKeys!4252 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!244158 () Bool)

(declare-fun c!40763 () Bool)

(assert (=> b!244158 (= c!40763 (and (not (= (bvand (extraKeys!4252 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4252 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!158432 () ListLongMap!3619)

(assert (=> b!244158 (= e!158432 e!158437)))

(declare-fun d!60173 () Bool)

(assert (=> d!60173 e!158435))

(declare-fun res!119720 () Bool)

(assert (=> d!60173 (=> (not res!119720) (not e!158435))))

(assert (=> d!60173 (= res!119720 (or (bvsge #b00000000000000000000000000000000 (size!6074 (_keys!6626 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6074 (_keys!6626 thiss!1504))))))))

(declare-fun lt!122464 () ListLongMap!3619)

(assert (=> d!60173 (= lt!122475 lt!122464)))

(declare-fun lt!122462 () Unit!7505)

(declare-fun e!158427 () Unit!7505)

(assert (=> d!60173 (= lt!122462 e!158427)))

(declare-fun c!40762 () Bool)

(declare-fun e!158438 () Bool)

(assert (=> d!60173 (= c!40762 e!158438)))

(declare-fun res!119717 () Bool)

(assert (=> d!60173 (=> (not res!119717) (not e!158438))))

(assert (=> d!60173 (= res!119717 (bvslt #b00000000000000000000000000000000 (size!6074 (_keys!6626 thiss!1504))))))

(declare-fun e!158430 () ListLongMap!3619)

(assert (=> d!60173 (= lt!122464 e!158430)))

(declare-fun c!40761 () Bool)

(assert (=> d!60173 (= c!40761 (and (not (= (bvand (extraKeys!4252 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4252 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!60173 (validMask!0 (mask!10610 thiss!1504))))

(assert (=> d!60173 (= (getCurrentListMap!1357 (_keys!6626 thiss!1504) (_values!4498 thiss!1504) (mask!10610 thiss!1504) (extraKeys!4252 thiss!1504) (zeroValue!4356 thiss!1504) (minValue!4356 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4515 thiss!1504)) lt!122475)))

(declare-fun b!244159 () Bool)

(declare-fun apply!227 (ListLongMap!3619 (_ BitVec 64)) V!8169)

(declare-fun get!2949 (ValueCell!2852 V!8169) V!8169)

(declare-fun dynLambda!570 (Int (_ BitVec 64)) V!8169)

(assert (=> b!244159 (= e!158429 (= (apply!227 lt!122475 (select (arr!5732 (_keys!6626 thiss!1504)) #b00000000000000000000000000000000)) (get!2949 (select (arr!5731 (_values!4498 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!570 (defaultEntry!4515 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!244159 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6073 (_values!4498 thiss!1504))))))

(assert (=> b!244159 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6074 (_keys!6626 thiss!1504))))))

(declare-fun bm!22753 () Bool)

(declare-fun call!22757 () ListLongMap!3619)

(assert (=> bm!22753 (= call!22760 call!22757)))

(declare-fun bm!22754 () Bool)

(declare-fun call!22761 () Bool)

(assert (=> bm!22754 (= call!22761 (contains!1741 lt!122475 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!244160 () Bool)

(declare-fun e!158428 () Bool)

(declare-fun e!158439 () Bool)

(assert (=> b!244160 (= e!158428 e!158439)))

(declare-fun res!119716 () Bool)

(assert (=> b!244160 (= res!119716 call!22761)))

(assert (=> b!244160 (=> (not res!119716) (not e!158439))))

(declare-fun b!244161 () Bool)

(assert (=> b!244161 (= e!158439 (= (apply!227 lt!122475 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4356 thiss!1504)))))

(declare-fun b!244162 () Bool)

(declare-fun e!158436 () Bool)

(assert (=> b!244162 (= e!158436 (validKeyInArray!0 (select (arr!5732 (_keys!6626 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!244163 () Bool)

(declare-fun call!22756 () Bool)

(assert (=> b!244163 (= e!158434 (not call!22756))))

(declare-fun b!244164 () Bool)

(declare-fun lt!122470 () Unit!7505)

(assert (=> b!244164 (= e!158427 lt!122470)))

(declare-fun lt!122466 () ListLongMap!3619)

(declare-fun getCurrentListMapNoExtraKeys!543 (array!12073 array!12071 (_ BitVec 32) (_ BitVec 32) V!8169 V!8169 (_ BitVec 32) Int) ListLongMap!3619)

(assert (=> b!244164 (= lt!122466 (getCurrentListMapNoExtraKeys!543 (_keys!6626 thiss!1504) (_values!4498 thiss!1504) (mask!10610 thiss!1504) (extraKeys!4252 thiss!1504) (zeroValue!4356 thiss!1504) (minValue!4356 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4515 thiss!1504)))))

(declare-fun lt!122469 () (_ BitVec 64))

(assert (=> b!244164 (= lt!122469 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122481 () (_ BitVec 64))

(assert (=> b!244164 (= lt!122481 (select (arr!5732 (_keys!6626 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122468 () Unit!7505)

(declare-fun addStillContains!203 (ListLongMap!3619 (_ BitVec 64) V!8169 (_ BitVec 64)) Unit!7505)

(assert (=> b!244164 (= lt!122468 (addStillContains!203 lt!122466 lt!122469 (zeroValue!4356 thiss!1504) lt!122481))))

(declare-fun +!654 (ListLongMap!3619 tuple2!4704) ListLongMap!3619)

(assert (=> b!244164 (contains!1741 (+!654 lt!122466 (tuple2!4705 lt!122469 (zeroValue!4356 thiss!1504))) lt!122481)))

(declare-fun lt!122483 () Unit!7505)

(assert (=> b!244164 (= lt!122483 lt!122468)))

(declare-fun lt!122476 () ListLongMap!3619)

(assert (=> b!244164 (= lt!122476 (getCurrentListMapNoExtraKeys!543 (_keys!6626 thiss!1504) (_values!4498 thiss!1504) (mask!10610 thiss!1504) (extraKeys!4252 thiss!1504) (zeroValue!4356 thiss!1504) (minValue!4356 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4515 thiss!1504)))))

(declare-fun lt!122467 () (_ BitVec 64))

(assert (=> b!244164 (= lt!122467 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122478 () (_ BitVec 64))

(assert (=> b!244164 (= lt!122478 (select (arr!5732 (_keys!6626 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122472 () Unit!7505)

(declare-fun addApplyDifferent!203 (ListLongMap!3619 (_ BitVec 64) V!8169 (_ BitVec 64)) Unit!7505)

(assert (=> b!244164 (= lt!122472 (addApplyDifferent!203 lt!122476 lt!122467 (minValue!4356 thiss!1504) lt!122478))))

(assert (=> b!244164 (= (apply!227 (+!654 lt!122476 (tuple2!4705 lt!122467 (minValue!4356 thiss!1504))) lt!122478) (apply!227 lt!122476 lt!122478))))

(declare-fun lt!122480 () Unit!7505)

(assert (=> b!244164 (= lt!122480 lt!122472)))

(declare-fun lt!122482 () ListLongMap!3619)

(assert (=> b!244164 (= lt!122482 (getCurrentListMapNoExtraKeys!543 (_keys!6626 thiss!1504) (_values!4498 thiss!1504) (mask!10610 thiss!1504) (extraKeys!4252 thiss!1504) (zeroValue!4356 thiss!1504) (minValue!4356 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4515 thiss!1504)))))

(declare-fun lt!122479 () (_ BitVec 64))

(assert (=> b!244164 (= lt!122479 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122473 () (_ BitVec 64))

(assert (=> b!244164 (= lt!122473 (select (arr!5732 (_keys!6626 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122477 () Unit!7505)

(assert (=> b!244164 (= lt!122477 (addApplyDifferent!203 lt!122482 lt!122479 (zeroValue!4356 thiss!1504) lt!122473))))

(assert (=> b!244164 (= (apply!227 (+!654 lt!122482 (tuple2!4705 lt!122479 (zeroValue!4356 thiss!1504))) lt!122473) (apply!227 lt!122482 lt!122473))))

(declare-fun lt!122463 () Unit!7505)

(assert (=> b!244164 (= lt!122463 lt!122477)))

(declare-fun lt!122474 () ListLongMap!3619)

(assert (=> b!244164 (= lt!122474 (getCurrentListMapNoExtraKeys!543 (_keys!6626 thiss!1504) (_values!4498 thiss!1504) (mask!10610 thiss!1504) (extraKeys!4252 thiss!1504) (zeroValue!4356 thiss!1504) (minValue!4356 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4515 thiss!1504)))))

(declare-fun lt!122471 () (_ BitVec 64))

(assert (=> b!244164 (= lt!122471 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122465 () (_ BitVec 64))

(assert (=> b!244164 (= lt!122465 (select (arr!5732 (_keys!6626 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!244164 (= lt!122470 (addApplyDifferent!203 lt!122474 lt!122471 (minValue!4356 thiss!1504) lt!122465))))

(assert (=> b!244164 (= (apply!227 (+!654 lt!122474 (tuple2!4705 lt!122471 (minValue!4356 thiss!1504))) lt!122465) (apply!227 lt!122474 lt!122465))))

(declare-fun c!40760 () Bool)

(declare-fun bm!22755 () Bool)

(assert (=> bm!22755 (= call!22757 (+!654 (ite c!40761 call!22759 (ite c!40760 call!22755 call!22758)) (ite (or c!40761 c!40760) (tuple2!4705 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4356 thiss!1504)) (tuple2!4705 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4356 thiss!1504)))))))

(declare-fun bm!22756 () Bool)

(assert (=> bm!22756 (= call!22756 (contains!1741 lt!122475 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!244165 () Bool)

(assert (=> b!244165 (= e!158435 e!158428)))

(declare-fun c!40765 () Bool)

(assert (=> b!244165 (= c!40765 (not (= (bvand (extraKeys!4252 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!244166 () Bool)

(declare-fun e!158431 () Bool)

(assert (=> b!244166 (= e!158431 (= (apply!227 lt!122475 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4356 thiss!1504)))))

(declare-fun bm!22757 () Bool)

(assert (=> bm!22757 (= call!22759 (getCurrentListMapNoExtraKeys!543 (_keys!6626 thiss!1504) (_values!4498 thiss!1504) (mask!10610 thiss!1504) (extraKeys!4252 thiss!1504) (zeroValue!4356 thiss!1504) (minValue!4356 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4515 thiss!1504)))))

(declare-fun b!244167 () Bool)

(declare-fun res!119719 () Bool)

(assert (=> b!244167 (=> (not res!119719) (not e!158435))))

(assert (=> b!244167 (= res!119719 e!158433)))

(declare-fun res!119721 () Bool)

(assert (=> b!244167 (=> res!119721 e!158433)))

(assert (=> b!244167 (= res!119721 (not e!158436))))

(declare-fun res!119718 () Bool)

(assert (=> b!244167 (=> (not res!119718) (not e!158436))))

(assert (=> b!244167 (= res!119718 (bvslt #b00000000000000000000000000000000 (size!6074 (_keys!6626 thiss!1504))))))

(declare-fun b!244168 () Bool)

(assert (=> b!244168 (= e!158428 (not call!22761))))

(declare-fun b!244169 () Bool)

(declare-fun Unit!7517 () Unit!7505)

(assert (=> b!244169 (= e!158427 Unit!7517)))

(declare-fun b!244170 () Bool)

(assert (=> b!244170 (= e!158434 e!158431)))

(declare-fun res!119722 () Bool)

(assert (=> b!244170 (= res!119722 call!22756)))

(assert (=> b!244170 (=> (not res!119722) (not e!158431))))

(declare-fun b!244171 () Bool)

(assert (=> b!244171 (= e!158430 (+!654 call!22757 (tuple2!4705 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4356 thiss!1504))))))

(declare-fun bm!22758 () Bool)

(assert (=> bm!22758 (= call!22758 call!22755)))

(declare-fun b!244172 () Bool)

(assert (=> b!244172 (= e!158438 (validKeyInArray!0 (select (arr!5732 (_keys!6626 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!244173 () Bool)

(assert (=> b!244173 (= e!158430 e!158432)))

(assert (=> b!244173 (= c!40760 (and (not (= (bvand (extraKeys!4252 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4252 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!244174 () Bool)

(assert (=> b!244174 (= e!158432 call!22760)))

(assert (= (and d!60173 c!40761) b!244171))

(assert (= (and d!60173 (not c!40761)) b!244173))

(assert (= (and b!244173 c!40760) b!244174))

(assert (= (and b!244173 (not c!40760)) b!244158))

(assert (= (and b!244158 c!40763) b!244156))

(assert (= (and b!244158 (not c!40763)) b!244155))

(assert (= (or b!244156 b!244155) bm!22758))

(assert (= (or b!244174 bm!22758) bm!22752))

(assert (= (or b!244174 b!244156) bm!22753))

(assert (= (or b!244171 bm!22752) bm!22757))

(assert (= (or b!244171 bm!22753) bm!22755))

(assert (= (and d!60173 res!119717) b!244172))

(assert (= (and d!60173 c!40762) b!244164))

(assert (= (and d!60173 (not c!40762)) b!244169))

(assert (= (and d!60173 res!119720) b!244167))

(assert (= (and b!244167 res!119718) b!244162))

(assert (= (and b!244167 (not res!119721)) b!244154))

(assert (= (and b!244154 res!119715) b!244159))

(assert (= (and b!244167 res!119719) b!244157))

(assert (= (and b!244157 c!40764) b!244170))

(assert (= (and b!244157 (not c!40764)) b!244163))

(assert (= (and b!244170 res!119722) b!244166))

(assert (= (or b!244170 b!244163) bm!22756))

(assert (= (and b!244157 res!119723) b!244165))

(assert (= (and b!244165 c!40765) b!244160))

(assert (= (and b!244165 (not c!40765)) b!244168))

(assert (= (and b!244160 res!119716) b!244161))

(assert (= (or b!244160 b!244168) bm!22754))

(declare-fun b_lambda!8033 () Bool)

(assert (=> (not b_lambda!8033) (not b!244159)))

(declare-fun t!8580 () Bool)

(declare-fun tb!2959 () Bool)

(assert (=> (and b!243822 (= (defaultEntry!4515 thiss!1504) (defaultEntry!4515 thiss!1504)) t!8580) tb!2959))

(declare-fun result!5215 () Bool)

(assert (=> tb!2959 (= result!5215 tp_is_empty!6391)))

(assert (=> b!244159 t!8580))

(declare-fun b_and!13531 () Bool)

(assert (= b_and!13525 (and (=> t!8580 result!5215) b_and!13531)))

(declare-fun m!262405 () Bool)

(assert (=> b!244159 m!262405))

(declare-fun m!262407 () Bool)

(assert (=> b!244159 m!262407))

(assert (=> b!244159 m!262405))

(declare-fun m!262409 () Bool)

(assert (=> b!244159 m!262409))

(assert (=> b!244159 m!262389))

(assert (=> b!244159 m!262407))

(assert (=> b!244159 m!262389))

(declare-fun m!262411 () Bool)

(assert (=> b!244159 m!262411))

(declare-fun m!262413 () Bool)

(assert (=> bm!22754 m!262413))

(declare-fun m!262415 () Bool)

(assert (=> bm!22756 m!262415))

(declare-fun m!262417 () Bool)

(assert (=> b!244161 m!262417))

(declare-fun m!262419 () Bool)

(assert (=> bm!22757 m!262419))

(assert (=> b!244154 m!262389))

(assert (=> b!244154 m!262389))

(declare-fun m!262421 () Bool)

(assert (=> b!244154 m!262421))

(assert (=> d!60173 m!262341))

(declare-fun m!262423 () Bool)

(assert (=> b!244171 m!262423))

(assert (=> b!244172 m!262389))

(assert (=> b!244172 m!262389))

(assert (=> b!244172 m!262393))

(declare-fun m!262425 () Bool)

(assert (=> b!244166 m!262425))

(declare-fun m!262427 () Bool)

(assert (=> b!244164 m!262427))

(declare-fun m!262429 () Bool)

(assert (=> b!244164 m!262429))

(declare-fun m!262431 () Bool)

(assert (=> b!244164 m!262431))

(declare-fun m!262433 () Bool)

(assert (=> b!244164 m!262433))

(declare-fun m!262435 () Bool)

(assert (=> b!244164 m!262435))

(declare-fun m!262437 () Bool)

(assert (=> b!244164 m!262437))

(declare-fun m!262439 () Bool)

(assert (=> b!244164 m!262439))

(declare-fun m!262441 () Bool)

(assert (=> b!244164 m!262441))

(declare-fun m!262443 () Bool)

(assert (=> b!244164 m!262443))

(declare-fun m!262445 () Bool)

(assert (=> b!244164 m!262445))

(declare-fun m!262447 () Bool)

(assert (=> b!244164 m!262447))

(declare-fun m!262449 () Bool)

(assert (=> b!244164 m!262449))

(declare-fun m!262451 () Bool)

(assert (=> b!244164 m!262451))

(assert (=> b!244164 m!262389))

(assert (=> b!244164 m!262449))

(declare-fun m!262453 () Bool)

(assert (=> b!244164 m!262453))

(assert (=> b!244164 m!262429))

(declare-fun m!262455 () Bool)

(assert (=> b!244164 m!262455))

(assert (=> b!244164 m!262433))

(assert (=> b!244164 m!262419))

(assert (=> b!244164 m!262441))

(declare-fun m!262457 () Bool)

(assert (=> bm!22755 m!262457))

(assert (=> b!244162 m!262389))

(assert (=> b!244162 m!262389))

(assert (=> b!244162 m!262393))

(assert (=> b!243824 d!60173))

(declare-fun d!60175 () Bool)

(declare-fun res!119728 () Bool)

(declare-fun e!158444 () Bool)

(assert (=> d!60175 (=> res!119728 e!158444)))

(assert (=> d!60175 (= res!119728 (= (select (arr!5732 (_keys!6626 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60175 (= (arrayContainsKey!0 (_keys!6626 thiss!1504) key!932 #b00000000000000000000000000000000) e!158444)))

(declare-fun b!244181 () Bool)

(declare-fun e!158445 () Bool)

(assert (=> b!244181 (= e!158444 e!158445)))

(declare-fun res!119729 () Bool)

(assert (=> b!244181 (=> (not res!119729) (not e!158445))))

(assert (=> b!244181 (= res!119729 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6074 (_keys!6626 thiss!1504))))))

(declare-fun b!244182 () Bool)

(assert (=> b!244182 (= e!158445 (arrayContainsKey!0 (_keys!6626 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60175 (not res!119728)) b!244181))

(assert (= (and b!244181 res!119729) b!244182))

(assert (=> d!60175 m!262389))

(declare-fun m!262459 () Bool)

(assert (=> b!244182 m!262459))

(assert (=> bm!22715 d!60175))

(assert (=> b!243833 d!60175))

(declare-fun d!60177 () Bool)

(assert (=> d!60177 (= (inRange!0 (ite c!40702 (index!6342 lt!122339) (index!6345 lt!122339)) (mask!10610 thiss!1504)) (and (bvsge (ite c!40702 (index!6342 lt!122339) (index!6345 lt!122339)) #b00000000000000000000000000000000) (bvslt (ite c!40702 (index!6342 lt!122339) (index!6345 lt!122339)) (bvadd (mask!10610 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!22716 d!60177))

(declare-fun b!244190 () Bool)

(declare-fun e!158450 () Bool)

(assert (=> b!244190 (= e!158450 tp_is_empty!6391)))

(declare-fun mapIsEmpty!10846 () Bool)

(declare-fun mapRes!10846 () Bool)

(assert (=> mapIsEmpty!10846 mapRes!10846))

(declare-fun condMapEmpty!10846 () Bool)

(declare-fun mapDefault!10846 () ValueCell!2852)

(assert (=> mapNonEmpty!10837 (= condMapEmpty!10846 (= mapRest!10837 ((as const (Array (_ BitVec 32) ValueCell!2852)) mapDefault!10846)))))

(assert (=> mapNonEmpty!10837 (= tp!22809 (and e!158450 mapRes!10846))))

(declare-fun mapNonEmpty!10846 () Bool)

(declare-fun tp!22825 () Bool)

(declare-fun e!158451 () Bool)

(assert (=> mapNonEmpty!10846 (= mapRes!10846 (and tp!22825 e!158451))))

(declare-fun mapValue!10846 () ValueCell!2852)

(declare-fun mapRest!10846 () (Array (_ BitVec 32) ValueCell!2852))

(declare-fun mapKey!10846 () (_ BitVec 32))

(assert (=> mapNonEmpty!10846 (= mapRest!10837 (store mapRest!10846 mapKey!10846 mapValue!10846))))

(declare-fun b!244189 () Bool)

(assert (=> b!244189 (= e!158451 tp_is_empty!6391)))

(assert (= (and mapNonEmpty!10837 condMapEmpty!10846) mapIsEmpty!10846))

(assert (= (and mapNonEmpty!10837 (not condMapEmpty!10846)) mapNonEmpty!10846))

(assert (= (and mapNonEmpty!10846 ((_ is ValueCellFull!2852) mapValue!10846)) b!244189))

(assert (= (and mapNonEmpty!10837 ((_ is ValueCellFull!2852) mapDefault!10846)) b!244190))

(declare-fun m!262461 () Bool)

(assert (=> mapNonEmpty!10846 m!262461))

(declare-fun b_lambda!8035 () Bool)

(assert (= b_lambda!8033 (or (and b!243822 b_free!6529) b_lambda!8035)))

(check-sat (not b!244166) (not b!244049) (not b!244109) (not b!244030) (not b!244182) b_and!13531 (not b!244162) (not b!244047) (not b!244048) (not mapNonEmpty!10846) tp_is_empty!6391 (not b!244171) (not b!244101) (not b!244055) (not d!60155) (not bm!22757) (not bm!22755) (not b!244159) (not b!244164) (not bm!22754) (not b!244111) (not b!244161) (not d!60159) (not b!244063) (not d!60145) (not b_lambda!8035) (not b!244102) (not b!244038) (not b!244172) (not b!244040) (not bm!22737) (not d!60171) (not d!60161) (not d!60149) (not bm!22733) (not b!244154) (not bm!22756) (not b!244054) (not b!244098) (not bm!22734) (not d!60165) (not b_next!6529) (not d!60147) (not d!60163) (not b!244060) (not d!60173))
(check-sat b_and!13531 (not b_next!6529))

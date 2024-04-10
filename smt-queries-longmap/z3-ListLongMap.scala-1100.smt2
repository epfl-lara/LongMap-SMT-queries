; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22566 () Bool)

(assert start!22566)

(declare-fun b!235950 () Bool)

(declare-fun b_free!6351 () Bool)

(declare-fun b_next!6351 () Bool)

(assert (=> b!235950 (= b_free!6351 (not b_next!6351))))

(declare-fun tp!22225 () Bool)

(declare-fun b_and!13283 () Bool)

(assert (=> b!235950 (= tp!22225 b_and!13283)))

(declare-fun mapNonEmpty!10520 () Bool)

(declare-fun mapRes!10520 () Bool)

(declare-fun tp!22226 () Bool)

(declare-fun e!153244 () Bool)

(assert (=> mapNonEmpty!10520 (= mapRes!10520 (and tp!22226 e!153244))))

(declare-datatypes ((V!7931 0))(
  ( (V!7932 (val!3151 Int)) )
))
(declare-datatypes ((ValueCell!2763 0))(
  ( (ValueCellFull!2763 (v!5180 V!7931)) (EmptyCell!2763) )
))
(declare-fun mapRest!10520 () (Array (_ BitVec 32) ValueCell!2763))

(declare-fun mapValue!10520 () ValueCell!2763)

(declare-datatypes ((array!11687 0))(
  ( (array!11688 (arr!5554 (Array (_ BitVec 32) ValueCell!2763)) (size!5891 (_ BitVec 32))) )
))
(declare-datatypes ((array!11689 0))(
  ( (array!11690 (arr!5555 (Array (_ BitVec 32) (_ BitVec 64))) (size!5892 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3426 0))(
  ( (LongMapFixedSize!3427 (defaultEntry!4385 Int) (mask!10366 (_ BitVec 32)) (extraKeys!4122 (_ BitVec 32)) (zeroValue!4226 V!7931) (minValue!4226 V!7931) (_size!1762 (_ BitVec 32)) (_keys!6463 array!11689) (_values!4368 array!11687) (_vacant!1762 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3426)

(declare-fun mapKey!10520 () (_ BitVec 32))

(assert (=> mapNonEmpty!10520 (= (arr!5554 (_values!4368 thiss!1504)) (store mapRest!10520 mapKey!10520 mapValue!10520))))

(declare-fun b!235945 () Bool)

(declare-fun res!115725 () Bool)

(declare-fun e!153243 () Bool)

(assert (=> b!235945 (=> (not res!115725) (not e!153243))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4644 0))(
  ( (tuple2!4645 (_1!2333 (_ BitVec 64)) (_2!2333 V!7931)) )
))
(declare-datatypes ((List!3550 0))(
  ( (Nil!3547) (Cons!3546 (h!4198 tuple2!4644) (t!8527 List!3550)) )
))
(declare-datatypes ((ListLongMap!3557 0))(
  ( (ListLongMap!3558 (toList!1794 List!3550)) )
))
(declare-fun contains!1672 (ListLongMap!3557 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1322 (array!11689 array!11687 (_ BitVec 32) (_ BitVec 32) V!7931 V!7931 (_ BitVec 32) Int) ListLongMap!3557)

(assert (=> b!235945 (= res!115725 (not (contains!1672 (getCurrentListMap!1322 (_keys!6463 thiss!1504) (_values!4368 thiss!1504) (mask!10366 thiss!1504) (extraKeys!4122 thiss!1504) (zeroValue!4226 thiss!1504) (minValue!4226 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4385 thiss!1504)) key!932)))))

(declare-fun b!235946 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!235946 (= e!153243 (not (validMask!0 (mask!10366 thiss!1504))))))

(declare-fun b!235947 () Bool)

(declare-fun e!153242 () Bool)

(declare-fun tp_is_empty!6213 () Bool)

(assert (=> b!235947 (= e!153242 tp_is_empty!6213)))

(declare-fun b!235948 () Bool)

(declare-fun e!153241 () Bool)

(assert (=> b!235948 (= e!153241 (and e!153242 mapRes!10520))))

(declare-fun condMapEmpty!10520 () Bool)

(declare-fun mapDefault!10520 () ValueCell!2763)

(assert (=> b!235948 (= condMapEmpty!10520 (= (arr!5554 (_values!4368 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2763)) mapDefault!10520)))))

(declare-fun b!235949 () Bool)

(assert (=> b!235949 (= e!153244 tp_is_empty!6213)))

(declare-fun res!115728 () Bool)

(declare-fun e!153240 () Bool)

(assert (=> start!22566 (=> (not res!115728) (not e!153240))))

(declare-fun valid!1354 (LongMapFixedSize!3426) Bool)

(assert (=> start!22566 (= res!115728 (valid!1354 thiss!1504))))

(assert (=> start!22566 e!153240))

(declare-fun e!153238 () Bool)

(assert (=> start!22566 e!153238))

(assert (=> start!22566 true))

(declare-fun array_inv!3665 (array!11689) Bool)

(declare-fun array_inv!3666 (array!11687) Bool)

(assert (=> b!235950 (= e!153238 (and tp!22225 tp_is_empty!6213 (array_inv!3665 (_keys!6463 thiss!1504)) (array_inv!3666 (_values!4368 thiss!1504)) e!153241))))

(declare-fun mapIsEmpty!10520 () Bool)

(assert (=> mapIsEmpty!10520 mapRes!10520))

(declare-fun b!235951 () Bool)

(assert (=> b!235951 (= e!153240 e!153243)))

(declare-fun res!115727 () Bool)

(assert (=> b!235951 (=> (not res!115727) (not e!153243))))

(declare-datatypes ((SeekEntryResult!998 0))(
  ( (MissingZero!998 (index!6162 (_ BitVec 32))) (Found!998 (index!6163 (_ BitVec 32))) (Intermediate!998 (undefined!1810 Bool) (index!6164 (_ BitVec 32)) (x!23836 (_ BitVec 32))) (Undefined!998) (MissingVacant!998 (index!6165 (_ BitVec 32))) )
))
(declare-fun lt!119278 () SeekEntryResult!998)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!235951 (= res!115727 (or (= lt!119278 (MissingZero!998 index!297)) (= lt!119278 (MissingVacant!998 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11689 (_ BitVec 32)) SeekEntryResult!998)

(assert (=> b!235951 (= lt!119278 (seekEntryOrOpen!0 key!932 (_keys!6463 thiss!1504) (mask!10366 thiss!1504)))))

(declare-fun b!235952 () Bool)

(declare-fun res!115726 () Bool)

(assert (=> b!235952 (=> (not res!115726) (not e!153240))))

(assert (=> b!235952 (= res!115726 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!22566 res!115728) b!235952))

(assert (= (and b!235952 res!115726) b!235951))

(assert (= (and b!235951 res!115727) b!235945))

(assert (= (and b!235945 res!115725) b!235946))

(assert (= (and b!235948 condMapEmpty!10520) mapIsEmpty!10520))

(assert (= (and b!235948 (not condMapEmpty!10520)) mapNonEmpty!10520))

(get-info :version)

(assert (= (and mapNonEmpty!10520 ((_ is ValueCellFull!2763) mapValue!10520)) b!235949))

(assert (= (and b!235948 ((_ is ValueCellFull!2763) mapDefault!10520)) b!235947))

(assert (= b!235950 b!235948))

(assert (= start!22566 b!235950))

(declare-fun m!256893 () Bool)

(assert (=> start!22566 m!256893))

(declare-fun m!256895 () Bool)

(assert (=> b!235946 m!256895))

(declare-fun m!256897 () Bool)

(assert (=> b!235945 m!256897))

(assert (=> b!235945 m!256897))

(declare-fun m!256899 () Bool)

(assert (=> b!235945 m!256899))

(declare-fun m!256901 () Bool)

(assert (=> b!235951 m!256901))

(declare-fun m!256903 () Bool)

(assert (=> b!235950 m!256903))

(declare-fun m!256905 () Bool)

(assert (=> b!235950 m!256905))

(declare-fun m!256907 () Bool)

(assert (=> mapNonEmpty!10520 m!256907))

(check-sat (not b!235945) (not b_next!6351) (not start!22566) tp_is_empty!6213 (not b!235951) b_and!13283 (not b!235950) (not b!235946) (not mapNonEmpty!10520))
(check-sat b_and!13283 (not b_next!6351))
(get-model)

(declare-fun d!59319 () Bool)

(declare-fun res!115747 () Bool)

(declare-fun e!153268 () Bool)

(assert (=> d!59319 (=> (not res!115747) (not e!153268))))

(declare-fun simpleValid!235 (LongMapFixedSize!3426) Bool)

(assert (=> d!59319 (= res!115747 (simpleValid!235 thiss!1504))))

(assert (=> d!59319 (= (valid!1354 thiss!1504) e!153268)))

(declare-fun b!235983 () Bool)

(declare-fun res!115748 () Bool)

(assert (=> b!235983 (=> (not res!115748) (not e!153268))))

(declare-fun arrayCountValidKeys!0 (array!11689 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!235983 (= res!115748 (= (arrayCountValidKeys!0 (_keys!6463 thiss!1504) #b00000000000000000000000000000000 (size!5892 (_keys!6463 thiss!1504))) (_size!1762 thiss!1504)))))

(declare-fun b!235984 () Bool)

(declare-fun res!115749 () Bool)

(assert (=> b!235984 (=> (not res!115749) (not e!153268))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11689 (_ BitVec 32)) Bool)

(assert (=> b!235984 (= res!115749 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6463 thiss!1504) (mask!10366 thiss!1504)))))

(declare-fun b!235985 () Bool)

(declare-datatypes ((List!3552 0))(
  ( (Nil!3549) (Cons!3548 (h!4200 (_ BitVec 64)) (t!8531 List!3552)) )
))
(declare-fun arrayNoDuplicates!0 (array!11689 (_ BitVec 32) List!3552) Bool)

(assert (=> b!235985 (= e!153268 (arrayNoDuplicates!0 (_keys!6463 thiss!1504) #b00000000000000000000000000000000 Nil!3549))))

(assert (= (and d!59319 res!115747) b!235983))

(assert (= (and b!235983 res!115748) b!235984))

(assert (= (and b!235984 res!115749) b!235985))

(declare-fun m!256925 () Bool)

(assert (=> d!59319 m!256925))

(declare-fun m!256927 () Bool)

(assert (=> b!235983 m!256927))

(declare-fun m!256929 () Bool)

(assert (=> b!235984 m!256929))

(declare-fun m!256931 () Bool)

(assert (=> b!235985 m!256931))

(assert (=> start!22566 d!59319))

(declare-fun b!235998 () Bool)

(declare-fun c!39288 () Bool)

(declare-fun lt!119290 () (_ BitVec 64))

(assert (=> b!235998 (= c!39288 (= lt!119290 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!153277 () SeekEntryResult!998)

(declare-fun e!153276 () SeekEntryResult!998)

(assert (=> b!235998 (= e!153277 e!153276)))

(declare-fun b!235999 () Bool)

(declare-fun lt!119289 () SeekEntryResult!998)

(assert (=> b!235999 (= e!153277 (Found!998 (index!6164 lt!119289)))))

(declare-fun d!59321 () Bool)

(declare-fun lt!119288 () SeekEntryResult!998)

(assert (=> d!59321 (and (or ((_ is Undefined!998) lt!119288) (not ((_ is Found!998) lt!119288)) (and (bvsge (index!6163 lt!119288) #b00000000000000000000000000000000) (bvslt (index!6163 lt!119288) (size!5892 (_keys!6463 thiss!1504))))) (or ((_ is Undefined!998) lt!119288) ((_ is Found!998) lt!119288) (not ((_ is MissingZero!998) lt!119288)) (and (bvsge (index!6162 lt!119288) #b00000000000000000000000000000000) (bvslt (index!6162 lt!119288) (size!5892 (_keys!6463 thiss!1504))))) (or ((_ is Undefined!998) lt!119288) ((_ is Found!998) lt!119288) ((_ is MissingZero!998) lt!119288) (not ((_ is MissingVacant!998) lt!119288)) (and (bvsge (index!6165 lt!119288) #b00000000000000000000000000000000) (bvslt (index!6165 lt!119288) (size!5892 (_keys!6463 thiss!1504))))) (or ((_ is Undefined!998) lt!119288) (ite ((_ is Found!998) lt!119288) (= (select (arr!5555 (_keys!6463 thiss!1504)) (index!6163 lt!119288)) key!932) (ite ((_ is MissingZero!998) lt!119288) (= (select (arr!5555 (_keys!6463 thiss!1504)) (index!6162 lt!119288)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!998) lt!119288) (= (select (arr!5555 (_keys!6463 thiss!1504)) (index!6165 lt!119288)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!153275 () SeekEntryResult!998)

(assert (=> d!59321 (= lt!119288 e!153275)))

(declare-fun c!39289 () Bool)

(assert (=> d!59321 (= c!39289 (and ((_ is Intermediate!998) lt!119289) (undefined!1810 lt!119289)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11689 (_ BitVec 32)) SeekEntryResult!998)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59321 (= lt!119289 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10366 thiss!1504)) key!932 (_keys!6463 thiss!1504) (mask!10366 thiss!1504)))))

(assert (=> d!59321 (validMask!0 (mask!10366 thiss!1504))))

(assert (=> d!59321 (= (seekEntryOrOpen!0 key!932 (_keys!6463 thiss!1504) (mask!10366 thiss!1504)) lt!119288)))

(declare-fun b!236000 () Bool)

(assert (=> b!236000 (= e!153275 e!153277)))

(assert (=> b!236000 (= lt!119290 (select (arr!5555 (_keys!6463 thiss!1504)) (index!6164 lt!119289)))))

(declare-fun c!39287 () Bool)

(assert (=> b!236000 (= c!39287 (= lt!119290 key!932))))

(declare-fun b!236001 () Bool)

(assert (=> b!236001 (= e!153276 (MissingZero!998 (index!6164 lt!119289)))))

(declare-fun b!236002 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11689 (_ BitVec 32)) SeekEntryResult!998)

(assert (=> b!236002 (= e!153276 (seekKeyOrZeroReturnVacant!0 (x!23836 lt!119289) (index!6164 lt!119289) (index!6164 lt!119289) key!932 (_keys!6463 thiss!1504) (mask!10366 thiss!1504)))))

(declare-fun b!236003 () Bool)

(assert (=> b!236003 (= e!153275 Undefined!998)))

(assert (= (and d!59321 c!39289) b!236003))

(assert (= (and d!59321 (not c!39289)) b!236000))

(assert (= (and b!236000 c!39287) b!235999))

(assert (= (and b!236000 (not c!39287)) b!235998))

(assert (= (and b!235998 c!39288) b!236001))

(assert (= (and b!235998 (not c!39288)) b!236002))

(declare-fun m!256933 () Bool)

(assert (=> d!59321 m!256933))

(assert (=> d!59321 m!256933))

(declare-fun m!256935 () Bool)

(assert (=> d!59321 m!256935))

(declare-fun m!256937 () Bool)

(assert (=> d!59321 m!256937))

(declare-fun m!256939 () Bool)

(assert (=> d!59321 m!256939))

(declare-fun m!256941 () Bool)

(assert (=> d!59321 m!256941))

(assert (=> d!59321 m!256895))

(declare-fun m!256943 () Bool)

(assert (=> b!236000 m!256943))

(declare-fun m!256945 () Bool)

(assert (=> b!236002 m!256945))

(assert (=> b!235951 d!59321))

(declare-fun d!59323 () Bool)

(assert (=> d!59323 (= (array_inv!3665 (_keys!6463 thiss!1504)) (bvsge (size!5892 (_keys!6463 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!235950 d!59323))

(declare-fun d!59325 () Bool)

(assert (=> d!59325 (= (array_inv!3666 (_values!4368 thiss!1504)) (bvsge (size!5891 (_values!4368 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!235950 d!59325))

(declare-fun d!59327 () Bool)

(declare-fun e!153283 () Bool)

(assert (=> d!59327 e!153283))

(declare-fun res!115752 () Bool)

(assert (=> d!59327 (=> res!115752 e!153283)))

(declare-fun lt!119301 () Bool)

(assert (=> d!59327 (= res!115752 (not lt!119301))))

(declare-fun lt!119302 () Bool)

(assert (=> d!59327 (= lt!119301 lt!119302)))

(declare-datatypes ((Unit!7268 0))(
  ( (Unit!7269) )
))
(declare-fun lt!119299 () Unit!7268)

(declare-fun e!153282 () Unit!7268)

(assert (=> d!59327 (= lt!119299 e!153282)))

(declare-fun c!39292 () Bool)

(assert (=> d!59327 (= c!39292 lt!119302)))

(declare-fun containsKey!262 (List!3550 (_ BitVec 64)) Bool)

(assert (=> d!59327 (= lt!119302 (containsKey!262 (toList!1794 (getCurrentListMap!1322 (_keys!6463 thiss!1504) (_values!4368 thiss!1504) (mask!10366 thiss!1504) (extraKeys!4122 thiss!1504) (zeroValue!4226 thiss!1504) (minValue!4226 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4385 thiss!1504))) key!932))))

(assert (=> d!59327 (= (contains!1672 (getCurrentListMap!1322 (_keys!6463 thiss!1504) (_values!4368 thiss!1504) (mask!10366 thiss!1504) (extraKeys!4122 thiss!1504) (zeroValue!4226 thiss!1504) (minValue!4226 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4385 thiss!1504)) key!932) lt!119301)))

(declare-fun b!236010 () Bool)

(declare-fun lt!119300 () Unit!7268)

(assert (=> b!236010 (= e!153282 lt!119300)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!210 (List!3550 (_ BitVec 64)) Unit!7268)

(assert (=> b!236010 (= lt!119300 (lemmaContainsKeyImpliesGetValueByKeyDefined!210 (toList!1794 (getCurrentListMap!1322 (_keys!6463 thiss!1504) (_values!4368 thiss!1504) (mask!10366 thiss!1504) (extraKeys!4122 thiss!1504) (zeroValue!4226 thiss!1504) (minValue!4226 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4385 thiss!1504))) key!932))))

(declare-datatypes ((Option!276 0))(
  ( (Some!275 (v!5182 V!7931)) (None!274) )
))
(declare-fun isDefined!211 (Option!276) Bool)

(declare-fun getValueByKey!270 (List!3550 (_ BitVec 64)) Option!276)

(assert (=> b!236010 (isDefined!211 (getValueByKey!270 (toList!1794 (getCurrentListMap!1322 (_keys!6463 thiss!1504) (_values!4368 thiss!1504) (mask!10366 thiss!1504) (extraKeys!4122 thiss!1504) (zeroValue!4226 thiss!1504) (minValue!4226 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4385 thiss!1504))) key!932))))

(declare-fun b!236011 () Bool)

(declare-fun Unit!7270 () Unit!7268)

(assert (=> b!236011 (= e!153282 Unit!7270)))

(declare-fun b!236012 () Bool)

(assert (=> b!236012 (= e!153283 (isDefined!211 (getValueByKey!270 (toList!1794 (getCurrentListMap!1322 (_keys!6463 thiss!1504) (_values!4368 thiss!1504) (mask!10366 thiss!1504) (extraKeys!4122 thiss!1504) (zeroValue!4226 thiss!1504) (minValue!4226 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4385 thiss!1504))) key!932)))))

(assert (= (and d!59327 c!39292) b!236010))

(assert (= (and d!59327 (not c!39292)) b!236011))

(assert (= (and d!59327 (not res!115752)) b!236012))

(declare-fun m!256947 () Bool)

(assert (=> d!59327 m!256947))

(declare-fun m!256949 () Bool)

(assert (=> b!236010 m!256949))

(declare-fun m!256951 () Bool)

(assert (=> b!236010 m!256951))

(assert (=> b!236010 m!256951))

(declare-fun m!256953 () Bool)

(assert (=> b!236010 m!256953))

(assert (=> b!236012 m!256951))

(assert (=> b!236012 m!256951))

(assert (=> b!236012 m!256953))

(assert (=> b!235945 d!59327))

(declare-fun b!236055 () Bool)

(declare-fun e!153321 () Bool)

(declare-fun lt!119356 () ListLongMap!3557)

(declare-fun apply!212 (ListLongMap!3557 (_ BitVec 64)) V!7931)

(assert (=> b!236055 (= e!153321 (= (apply!212 lt!119356 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4226 thiss!1504)))))

(declare-fun b!236056 () Bool)

(declare-fun res!115771 () Bool)

(declare-fun e!153314 () Bool)

(assert (=> b!236056 (=> (not res!115771) (not e!153314))))

(declare-fun e!153310 () Bool)

(assert (=> b!236056 (= res!115771 e!153310)))

(declare-fun res!115779 () Bool)

(assert (=> b!236056 (=> res!115779 e!153310)))

(declare-fun e!153318 () Bool)

(assert (=> b!236056 (= res!115779 (not e!153318))))

(declare-fun res!115778 () Bool)

(assert (=> b!236056 (=> (not res!115778) (not e!153318))))

(assert (=> b!236056 (= res!115778 (bvslt #b00000000000000000000000000000000 (size!5892 (_keys!6463 thiss!1504))))))

(declare-fun bm!21942 () Bool)

(declare-fun call!21950 () ListLongMap!3557)

(declare-fun getCurrentListMapNoExtraKeys!534 (array!11689 array!11687 (_ BitVec 32) (_ BitVec 32) V!7931 V!7931 (_ BitVec 32) Int) ListLongMap!3557)

(assert (=> bm!21942 (= call!21950 (getCurrentListMapNoExtraKeys!534 (_keys!6463 thiss!1504) (_values!4368 thiss!1504) (mask!10366 thiss!1504) (extraKeys!4122 thiss!1504) (zeroValue!4226 thiss!1504) (minValue!4226 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4385 thiss!1504)))))

(declare-fun b!236057 () Bool)

(declare-fun e!153315 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!236057 (= e!153315 (validKeyInArray!0 (select (arr!5555 (_keys!6463 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!236058 () Bool)

(declare-fun e!153313 () ListLongMap!3557)

(declare-fun call!21951 () ListLongMap!3557)

(declare-fun +!639 (ListLongMap!3557 tuple2!4644) ListLongMap!3557)

(assert (=> b!236058 (= e!153313 (+!639 call!21951 (tuple2!4645 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4226 thiss!1504))))))

(declare-fun b!236059 () Bool)

(declare-fun e!153311 () ListLongMap!3557)

(assert (=> b!236059 (= e!153313 e!153311)))

(declare-fun c!39305 () Bool)

(assert (=> b!236059 (= c!39305 (and (not (= (bvand (extraKeys!4122 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4122 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!236060 () Bool)

(declare-fun res!115773 () Bool)

(assert (=> b!236060 (=> (not res!115773) (not e!153314))))

(declare-fun e!153320 () Bool)

(assert (=> b!236060 (= res!115773 e!153320)))

(declare-fun c!39307 () Bool)

(assert (=> b!236060 (= c!39307 (not (= (bvand (extraKeys!4122 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!236061 () Bool)

(assert (=> b!236061 (= e!153318 (validKeyInArray!0 (select (arr!5555 (_keys!6463 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!236062 () Bool)

(declare-fun e!153316 () Unit!7268)

(declare-fun lt!119360 () Unit!7268)

(assert (=> b!236062 (= e!153316 lt!119360)))

(declare-fun lt!119362 () ListLongMap!3557)

(assert (=> b!236062 (= lt!119362 (getCurrentListMapNoExtraKeys!534 (_keys!6463 thiss!1504) (_values!4368 thiss!1504) (mask!10366 thiss!1504) (extraKeys!4122 thiss!1504) (zeroValue!4226 thiss!1504) (minValue!4226 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4385 thiss!1504)))))

(declare-fun lt!119361 () (_ BitVec 64))

(assert (=> b!236062 (= lt!119361 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119355 () (_ BitVec 64))

(assert (=> b!236062 (= lt!119355 (select (arr!5555 (_keys!6463 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119353 () Unit!7268)

(declare-fun addStillContains!188 (ListLongMap!3557 (_ BitVec 64) V!7931 (_ BitVec 64)) Unit!7268)

(assert (=> b!236062 (= lt!119353 (addStillContains!188 lt!119362 lt!119361 (zeroValue!4226 thiss!1504) lt!119355))))

(assert (=> b!236062 (contains!1672 (+!639 lt!119362 (tuple2!4645 lt!119361 (zeroValue!4226 thiss!1504))) lt!119355)))

(declare-fun lt!119368 () Unit!7268)

(assert (=> b!236062 (= lt!119368 lt!119353)))

(declare-fun lt!119367 () ListLongMap!3557)

(assert (=> b!236062 (= lt!119367 (getCurrentListMapNoExtraKeys!534 (_keys!6463 thiss!1504) (_values!4368 thiss!1504) (mask!10366 thiss!1504) (extraKeys!4122 thiss!1504) (zeroValue!4226 thiss!1504) (minValue!4226 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4385 thiss!1504)))))

(declare-fun lt!119365 () (_ BitVec 64))

(assert (=> b!236062 (= lt!119365 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119349 () (_ BitVec 64))

(assert (=> b!236062 (= lt!119349 (select (arr!5555 (_keys!6463 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119350 () Unit!7268)

(declare-fun addApplyDifferent!188 (ListLongMap!3557 (_ BitVec 64) V!7931 (_ BitVec 64)) Unit!7268)

(assert (=> b!236062 (= lt!119350 (addApplyDifferent!188 lt!119367 lt!119365 (minValue!4226 thiss!1504) lt!119349))))

(assert (=> b!236062 (= (apply!212 (+!639 lt!119367 (tuple2!4645 lt!119365 (minValue!4226 thiss!1504))) lt!119349) (apply!212 lt!119367 lt!119349))))

(declare-fun lt!119352 () Unit!7268)

(assert (=> b!236062 (= lt!119352 lt!119350)))

(declare-fun lt!119347 () ListLongMap!3557)

(assert (=> b!236062 (= lt!119347 (getCurrentListMapNoExtraKeys!534 (_keys!6463 thiss!1504) (_values!4368 thiss!1504) (mask!10366 thiss!1504) (extraKeys!4122 thiss!1504) (zeroValue!4226 thiss!1504) (minValue!4226 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4385 thiss!1504)))))

(declare-fun lt!119354 () (_ BitVec 64))

(assert (=> b!236062 (= lt!119354 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119351 () (_ BitVec 64))

(assert (=> b!236062 (= lt!119351 (select (arr!5555 (_keys!6463 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119363 () Unit!7268)

(assert (=> b!236062 (= lt!119363 (addApplyDifferent!188 lt!119347 lt!119354 (zeroValue!4226 thiss!1504) lt!119351))))

(assert (=> b!236062 (= (apply!212 (+!639 lt!119347 (tuple2!4645 lt!119354 (zeroValue!4226 thiss!1504))) lt!119351) (apply!212 lt!119347 lt!119351))))

(declare-fun lt!119364 () Unit!7268)

(assert (=> b!236062 (= lt!119364 lt!119363)))

(declare-fun lt!119358 () ListLongMap!3557)

(assert (=> b!236062 (= lt!119358 (getCurrentListMapNoExtraKeys!534 (_keys!6463 thiss!1504) (_values!4368 thiss!1504) (mask!10366 thiss!1504) (extraKeys!4122 thiss!1504) (zeroValue!4226 thiss!1504) (minValue!4226 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4385 thiss!1504)))))

(declare-fun lt!119357 () (_ BitVec 64))

(assert (=> b!236062 (= lt!119357 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119366 () (_ BitVec 64))

(assert (=> b!236062 (= lt!119366 (select (arr!5555 (_keys!6463 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!236062 (= lt!119360 (addApplyDifferent!188 lt!119358 lt!119357 (minValue!4226 thiss!1504) lt!119366))))

(assert (=> b!236062 (= (apply!212 (+!639 lt!119358 (tuple2!4645 lt!119357 (minValue!4226 thiss!1504))) lt!119366) (apply!212 lt!119358 lt!119366))))

(declare-fun b!236063 () Bool)

(declare-fun Unit!7271 () Unit!7268)

(assert (=> b!236063 (= e!153316 Unit!7271)))

(declare-fun bm!21943 () Bool)

(declare-fun call!21948 () Bool)

(assert (=> bm!21943 (= call!21948 (contains!1672 lt!119356 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!39309 () Bool)

(declare-fun call!21945 () ListLongMap!3557)

(declare-fun call!21949 () ListLongMap!3557)

(declare-fun bm!21944 () Bool)

(assert (=> bm!21944 (= call!21951 (+!639 (ite c!39309 call!21950 (ite c!39305 call!21945 call!21949)) (ite (or c!39309 c!39305) (tuple2!4645 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4226 thiss!1504)) (tuple2!4645 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4226 thiss!1504)))))))

(declare-fun bm!21945 () Bool)

(assert (=> bm!21945 (= call!21949 call!21945)))

(declare-fun bm!21946 () Bool)

(declare-fun call!21946 () ListLongMap!3557)

(assert (=> bm!21946 (= call!21946 call!21951)))

(declare-fun b!236064 () Bool)

(declare-fun e!153317 () ListLongMap!3557)

(assert (=> b!236064 (= e!153317 call!21946)))

(declare-fun b!236065 () Bool)

(declare-fun e!153319 () Bool)

(assert (=> b!236065 (= e!153319 (not call!21948))))

(declare-fun b!236066 () Bool)

(assert (=> b!236066 (= e!153314 e!153319)))

(declare-fun c!39310 () Bool)

(assert (=> b!236066 (= c!39310 (not (= (bvand (extraKeys!4122 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!236067 () Bool)

(declare-fun e!153322 () Bool)

(assert (=> b!236067 (= e!153319 e!153322)))

(declare-fun res!115774 () Bool)

(assert (=> b!236067 (= res!115774 call!21948)))

(assert (=> b!236067 (=> (not res!115774) (not e!153322))))

(declare-fun b!236068 () Bool)

(declare-fun e!153312 () Bool)

(declare-fun get!2853 (ValueCell!2763 V!7931) V!7931)

(declare-fun dynLambda!555 (Int (_ BitVec 64)) V!7931)

(assert (=> b!236068 (= e!153312 (= (apply!212 lt!119356 (select (arr!5555 (_keys!6463 thiss!1504)) #b00000000000000000000000000000000)) (get!2853 (select (arr!5554 (_values!4368 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!555 (defaultEntry!4385 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!236068 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5891 (_values!4368 thiss!1504))))))

(assert (=> b!236068 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5892 (_keys!6463 thiss!1504))))))

(declare-fun b!236069 () Bool)

(assert (=> b!236069 (= e!153310 e!153312)))

(declare-fun res!115776 () Bool)

(assert (=> b!236069 (=> (not res!115776) (not e!153312))))

(assert (=> b!236069 (= res!115776 (contains!1672 lt!119356 (select (arr!5555 (_keys!6463 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!236069 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5892 (_keys!6463 thiss!1504))))))

(declare-fun d!59329 () Bool)

(assert (=> d!59329 e!153314))

(declare-fun res!115772 () Bool)

(assert (=> d!59329 (=> (not res!115772) (not e!153314))))

(assert (=> d!59329 (= res!115772 (or (bvsge #b00000000000000000000000000000000 (size!5892 (_keys!6463 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5892 (_keys!6463 thiss!1504))))))))

(declare-fun lt!119359 () ListLongMap!3557)

(assert (=> d!59329 (= lt!119356 lt!119359)))

(declare-fun lt!119348 () Unit!7268)

(assert (=> d!59329 (= lt!119348 e!153316)))

(declare-fun c!39308 () Bool)

(assert (=> d!59329 (= c!39308 e!153315)))

(declare-fun res!115775 () Bool)

(assert (=> d!59329 (=> (not res!115775) (not e!153315))))

(assert (=> d!59329 (= res!115775 (bvslt #b00000000000000000000000000000000 (size!5892 (_keys!6463 thiss!1504))))))

(assert (=> d!59329 (= lt!119359 e!153313)))

(assert (=> d!59329 (= c!39309 (and (not (= (bvand (extraKeys!4122 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4122 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59329 (validMask!0 (mask!10366 thiss!1504))))

(assert (=> d!59329 (= (getCurrentListMap!1322 (_keys!6463 thiss!1504) (_values!4368 thiss!1504) (mask!10366 thiss!1504) (extraKeys!4122 thiss!1504) (zeroValue!4226 thiss!1504) (minValue!4226 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4385 thiss!1504)) lt!119356)))

(declare-fun bm!21947 () Bool)

(assert (=> bm!21947 (= call!21945 call!21950)))

(declare-fun b!236070 () Bool)

(assert (=> b!236070 (= e!153322 (= (apply!212 lt!119356 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4226 thiss!1504)))))

(declare-fun b!236071 () Bool)

(assert (=> b!236071 (= e!153320 e!153321)))

(declare-fun res!115777 () Bool)

(declare-fun call!21947 () Bool)

(assert (=> b!236071 (= res!115777 call!21947)))

(assert (=> b!236071 (=> (not res!115777) (not e!153321))))

(declare-fun b!236072 () Bool)

(assert (=> b!236072 (= e!153311 call!21946)))

(declare-fun b!236073 () Bool)

(assert (=> b!236073 (= e!153317 call!21949)))

(declare-fun b!236074 () Bool)

(declare-fun c!39306 () Bool)

(assert (=> b!236074 (= c!39306 (and (not (= (bvand (extraKeys!4122 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4122 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!236074 (= e!153311 e!153317)))

(declare-fun b!236075 () Bool)

(assert (=> b!236075 (= e!153320 (not call!21947))))

(declare-fun bm!21948 () Bool)

(assert (=> bm!21948 (= call!21947 (contains!1672 lt!119356 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!59329 c!39309) b!236058))

(assert (= (and d!59329 (not c!39309)) b!236059))

(assert (= (and b!236059 c!39305) b!236072))

(assert (= (and b!236059 (not c!39305)) b!236074))

(assert (= (and b!236074 c!39306) b!236064))

(assert (= (and b!236074 (not c!39306)) b!236073))

(assert (= (or b!236064 b!236073) bm!21945))

(assert (= (or b!236072 bm!21945) bm!21947))

(assert (= (or b!236072 b!236064) bm!21946))

(assert (= (or b!236058 bm!21947) bm!21942))

(assert (= (or b!236058 bm!21946) bm!21944))

(assert (= (and d!59329 res!115775) b!236057))

(assert (= (and d!59329 c!39308) b!236062))

(assert (= (and d!59329 (not c!39308)) b!236063))

(assert (= (and d!59329 res!115772) b!236056))

(assert (= (and b!236056 res!115778) b!236061))

(assert (= (and b!236056 (not res!115779)) b!236069))

(assert (= (and b!236069 res!115776) b!236068))

(assert (= (and b!236056 res!115771) b!236060))

(assert (= (and b!236060 c!39307) b!236071))

(assert (= (and b!236060 (not c!39307)) b!236075))

(assert (= (and b!236071 res!115777) b!236055))

(assert (= (or b!236071 b!236075) bm!21948))

(assert (= (and b!236060 res!115773) b!236066))

(assert (= (and b!236066 c!39310) b!236067))

(assert (= (and b!236066 (not c!39310)) b!236065))

(assert (= (and b!236067 res!115774) b!236070))

(assert (= (or b!236067 b!236065) bm!21943))

(declare-fun b_lambda!7911 () Bool)

(assert (=> (not b_lambda!7911) (not b!236068)))

(declare-fun t!8530 () Bool)

(declare-fun tb!2937 () Bool)

(assert (=> (and b!235950 (= (defaultEntry!4385 thiss!1504) (defaultEntry!4385 thiss!1504)) t!8530) tb!2937))

(declare-fun result!5133 () Bool)

(assert (=> tb!2937 (= result!5133 tp_is_empty!6213)))

(assert (=> b!236068 t!8530))

(declare-fun b_and!13287 () Bool)

(assert (= b_and!13283 (and (=> t!8530 result!5133) b_and!13287)))

(declare-fun m!256955 () Bool)

(assert (=> bm!21943 m!256955))

(declare-fun m!256957 () Bool)

(assert (=> bm!21942 m!256957))

(declare-fun m!256959 () Bool)

(assert (=> bm!21948 m!256959))

(declare-fun m!256961 () Bool)

(assert (=> b!236070 m!256961))

(declare-fun m!256963 () Bool)

(assert (=> b!236062 m!256963))

(declare-fun m!256965 () Bool)

(assert (=> b!236062 m!256965))

(declare-fun m!256967 () Bool)

(assert (=> b!236062 m!256967))

(assert (=> b!236062 m!256957))

(declare-fun m!256969 () Bool)

(assert (=> b!236062 m!256969))

(assert (=> b!236062 m!256963))

(declare-fun m!256971 () Bool)

(assert (=> b!236062 m!256971))

(declare-fun m!256973 () Bool)

(assert (=> b!236062 m!256973))

(declare-fun m!256975 () Bool)

(assert (=> b!236062 m!256975))

(declare-fun m!256977 () Bool)

(assert (=> b!236062 m!256977))

(declare-fun m!256979 () Bool)

(assert (=> b!236062 m!256979))

(declare-fun m!256981 () Bool)

(assert (=> b!236062 m!256981))

(assert (=> b!236062 m!256979))

(declare-fun m!256983 () Bool)

(assert (=> b!236062 m!256983))

(declare-fun m!256985 () Bool)

(assert (=> b!236062 m!256985))

(assert (=> b!236062 m!256973))

(declare-fun m!256987 () Bool)

(assert (=> b!236062 m!256987))

(declare-fun m!256989 () Bool)

(assert (=> b!236062 m!256989))

(assert (=> b!236062 m!256987))

(declare-fun m!256991 () Bool)

(assert (=> b!236062 m!256991))

(declare-fun m!256993 () Bool)

(assert (=> b!236062 m!256993))

(assert (=> d!59329 m!256895))

(declare-fun m!256995 () Bool)

(assert (=> bm!21944 m!256995))

(declare-fun m!256997 () Bool)

(assert (=> b!236068 m!256997))

(declare-fun m!256999 () Bool)

(assert (=> b!236068 m!256999))

(declare-fun m!257001 () Bool)

(assert (=> b!236068 m!257001))

(assert (=> b!236068 m!256997))

(assert (=> b!236068 m!256983))

(assert (=> b!236068 m!256999))

(assert (=> b!236068 m!256983))

(declare-fun m!257003 () Bool)

(assert (=> b!236068 m!257003))

(assert (=> b!236057 m!256983))

(assert (=> b!236057 m!256983))

(declare-fun m!257005 () Bool)

(assert (=> b!236057 m!257005))

(declare-fun m!257007 () Bool)

(assert (=> b!236055 m!257007))

(assert (=> b!236069 m!256983))

(assert (=> b!236069 m!256983))

(declare-fun m!257009 () Bool)

(assert (=> b!236069 m!257009))

(assert (=> b!236061 m!256983))

(assert (=> b!236061 m!256983))

(assert (=> b!236061 m!257005))

(declare-fun m!257011 () Bool)

(assert (=> b!236058 m!257011))

(assert (=> b!235945 d!59329))

(declare-fun d!59331 () Bool)

(assert (=> d!59331 (= (validMask!0 (mask!10366 thiss!1504)) (and (or (= (mask!10366 thiss!1504) #b00000000000000000000000000000111) (= (mask!10366 thiss!1504) #b00000000000000000000000000001111) (= (mask!10366 thiss!1504) #b00000000000000000000000000011111) (= (mask!10366 thiss!1504) #b00000000000000000000000000111111) (= (mask!10366 thiss!1504) #b00000000000000000000000001111111) (= (mask!10366 thiss!1504) #b00000000000000000000000011111111) (= (mask!10366 thiss!1504) #b00000000000000000000000111111111) (= (mask!10366 thiss!1504) #b00000000000000000000001111111111) (= (mask!10366 thiss!1504) #b00000000000000000000011111111111) (= (mask!10366 thiss!1504) #b00000000000000000000111111111111) (= (mask!10366 thiss!1504) #b00000000000000000001111111111111) (= (mask!10366 thiss!1504) #b00000000000000000011111111111111) (= (mask!10366 thiss!1504) #b00000000000000000111111111111111) (= (mask!10366 thiss!1504) #b00000000000000001111111111111111) (= (mask!10366 thiss!1504) #b00000000000000011111111111111111) (= (mask!10366 thiss!1504) #b00000000000000111111111111111111) (= (mask!10366 thiss!1504) #b00000000000001111111111111111111) (= (mask!10366 thiss!1504) #b00000000000011111111111111111111) (= (mask!10366 thiss!1504) #b00000000000111111111111111111111) (= (mask!10366 thiss!1504) #b00000000001111111111111111111111) (= (mask!10366 thiss!1504) #b00000000011111111111111111111111) (= (mask!10366 thiss!1504) #b00000000111111111111111111111111) (= (mask!10366 thiss!1504) #b00000001111111111111111111111111) (= (mask!10366 thiss!1504) #b00000011111111111111111111111111) (= (mask!10366 thiss!1504) #b00000111111111111111111111111111) (= (mask!10366 thiss!1504) #b00001111111111111111111111111111) (= (mask!10366 thiss!1504) #b00011111111111111111111111111111) (= (mask!10366 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10366 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!235946 d!59331))

(declare-fun mapNonEmpty!10526 () Bool)

(declare-fun mapRes!10526 () Bool)

(declare-fun tp!22235 () Bool)

(declare-fun e!153327 () Bool)

(assert (=> mapNonEmpty!10526 (= mapRes!10526 (and tp!22235 e!153327))))

(declare-fun mapRest!10526 () (Array (_ BitVec 32) ValueCell!2763))

(declare-fun mapKey!10526 () (_ BitVec 32))

(declare-fun mapValue!10526 () ValueCell!2763)

(assert (=> mapNonEmpty!10526 (= mapRest!10520 (store mapRest!10526 mapKey!10526 mapValue!10526))))

(declare-fun mapIsEmpty!10526 () Bool)

(assert (=> mapIsEmpty!10526 mapRes!10526))

(declare-fun condMapEmpty!10526 () Bool)

(declare-fun mapDefault!10526 () ValueCell!2763)

(assert (=> mapNonEmpty!10520 (= condMapEmpty!10526 (= mapRest!10520 ((as const (Array (_ BitVec 32) ValueCell!2763)) mapDefault!10526)))))

(declare-fun e!153328 () Bool)

(assert (=> mapNonEmpty!10520 (= tp!22226 (and e!153328 mapRes!10526))))

(declare-fun b!236084 () Bool)

(assert (=> b!236084 (= e!153327 tp_is_empty!6213)))

(declare-fun b!236085 () Bool)

(assert (=> b!236085 (= e!153328 tp_is_empty!6213)))

(assert (= (and mapNonEmpty!10520 condMapEmpty!10526) mapIsEmpty!10526))

(assert (= (and mapNonEmpty!10520 (not condMapEmpty!10526)) mapNonEmpty!10526))

(assert (= (and mapNonEmpty!10526 ((_ is ValueCellFull!2763) mapValue!10526)) b!236084))

(assert (= (and mapNonEmpty!10520 ((_ is ValueCellFull!2763) mapDefault!10526)) b!236085))

(declare-fun m!257013 () Bool)

(assert (=> mapNonEmpty!10526 m!257013))

(declare-fun b_lambda!7913 () Bool)

(assert (= b_lambda!7911 (or (and b!235950 b_free!6351) b_lambda!7913)))

(check-sat (not d!59329) (not d!59321) (not b_next!6351) (not b!236061) tp_is_empty!6213 (not b!236012) (not bm!21943) (not bm!21948) (not d!59319) (not b!236062) (not b!236068) (not b!236070) (not b_lambda!7913) (not bm!21942) (not b!236057) b_and!13287 (not b!236002) (not b!236069) (not b!235983) (not b!236058) (not b!235985) (not b!235984) (not b!236055) (not bm!21944) (not mapNonEmpty!10526) (not d!59327) (not b!236010))
(check-sat b_and!13287 (not b_next!6351))

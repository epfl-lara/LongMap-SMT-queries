; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22700 () Bool)

(assert start!22700)

(declare-fun b!236925 () Bool)

(declare-fun b_free!6367 () Bool)

(declare-fun b_next!6367 () Bool)

(assert (=> b!236925 (= b_free!6367 (not b_next!6367))))

(declare-fun tp!22285 () Bool)

(declare-fun b_and!13327 () Bool)

(assert (=> b!236925 (= tp!22285 b_and!13327)))

(declare-fun b!236923 () Bool)

(declare-fun e!153853 () Bool)

(declare-fun tp_is_empty!6229 () Bool)

(assert (=> b!236923 (= e!153853 tp_is_empty!6229)))

(declare-fun b!236924 () Bool)

(declare-fun e!153852 () Bool)

(declare-fun e!153855 () Bool)

(declare-fun mapRes!10555 () Bool)

(assert (=> b!236924 (= e!153852 (and e!153855 mapRes!10555))))

(declare-fun condMapEmpty!10555 () Bool)

(declare-datatypes ((V!7953 0))(
  ( (V!7954 (val!3159 Int)) )
))
(declare-datatypes ((ValueCell!2771 0))(
  ( (ValueCellFull!2771 (v!5192 V!7953)) (EmptyCell!2771) )
))
(declare-datatypes ((array!11723 0))(
  ( (array!11724 (arr!5569 (Array (_ BitVec 32) ValueCell!2771)) (size!5908 (_ BitVec 32))) )
))
(declare-datatypes ((array!11725 0))(
  ( (array!11726 (arr!5570 (Array (_ BitVec 32) (_ BitVec 64))) (size!5909 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3442 0))(
  ( (LongMapFixedSize!3443 (defaultEntry!4398 Int) (mask!10399 (_ BitVec 32)) (extraKeys!4135 (_ BitVec 32)) (zeroValue!4239 V!7953) (minValue!4239 V!7953) (_size!1770 (_ BitVec 32)) (_keys!6485 array!11725) (_values!4381 array!11723) (_vacant!1770 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3442)

(declare-fun mapDefault!10555 () ValueCell!2771)

(assert (=> b!236924 (= condMapEmpty!10555 (= (arr!5569 (_values!4381 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2771)) mapDefault!10555)))))

(declare-fun e!153856 () Bool)

(declare-fun array_inv!3659 (array!11725) Bool)

(declare-fun array_inv!3660 (array!11723) Bool)

(assert (=> b!236925 (= e!153856 (and tp!22285 tp_is_empty!6229 (array_inv!3659 (_keys!6485 thiss!1504)) (array_inv!3660 (_values!4381 thiss!1504)) e!153852))))

(declare-fun res!116148 () Bool)

(declare-fun e!153854 () Bool)

(assert (=> start!22700 (=> (not res!116148) (not e!153854))))

(declare-fun valid!1373 (LongMapFixedSize!3442) Bool)

(assert (=> start!22700 (= res!116148 (valid!1373 thiss!1504))))

(assert (=> start!22700 e!153854))

(assert (=> start!22700 e!153856))

(assert (=> start!22700 true))

(declare-fun b!236926 () Bool)

(declare-fun e!153857 () Bool)

(assert (=> b!236926 (= e!153854 e!153857)))

(declare-fun res!116149 () Bool)

(assert (=> b!236926 (=> (not res!116149) (not e!153857))))

(declare-datatypes ((SeekEntryResult!976 0))(
  ( (MissingZero!976 (index!6074 (_ BitVec 32))) (Found!976 (index!6075 (_ BitVec 32))) (Intermediate!976 (undefined!1788 Bool) (index!6076 (_ BitVec 32)) (x!23884 (_ BitVec 32))) (Undefined!976) (MissingVacant!976 (index!6077 (_ BitVec 32))) )
))
(declare-fun lt!119842 () SeekEntryResult!976)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!236926 (= res!116149 (or (= lt!119842 (MissingZero!976 index!297)) (= lt!119842 (MissingVacant!976 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11725 (_ BitVec 32)) SeekEntryResult!976)

(assert (=> b!236926 (= lt!119842 (seekEntryOrOpen!0 key!932 (_keys!6485 thiss!1504) (mask!10399 thiss!1504)))))

(declare-fun b!236927 () Bool)

(declare-fun res!116146 () Bool)

(assert (=> b!236927 (=> (not res!116146) (not e!153854))))

(assert (=> b!236927 (= res!116146 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!10555 () Bool)

(declare-fun tp!22284 () Bool)

(assert (=> mapNonEmpty!10555 (= mapRes!10555 (and tp!22284 e!153853))))

(declare-fun mapKey!10555 () (_ BitVec 32))

(declare-fun mapRest!10555 () (Array (_ BitVec 32) ValueCell!2771))

(declare-fun mapValue!10555 () ValueCell!2771)

(assert (=> mapNonEmpty!10555 (= (arr!5569 (_values!4381 thiss!1504)) (store mapRest!10555 mapKey!10555 mapValue!10555))))

(declare-fun b!236928 () Bool)

(assert (=> b!236928 (= e!153855 tp_is_empty!6229)))

(declare-fun b!236929 () Bool)

(declare-fun res!116145 () Bool)

(assert (=> b!236929 (=> (not res!116145) (not e!153857))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!236929 (= res!116145 (validMask!0 (mask!10399 thiss!1504)))))

(declare-fun mapIsEmpty!10555 () Bool)

(assert (=> mapIsEmpty!10555 mapRes!10555))

(declare-fun b!236930 () Bool)

(declare-fun res!116147 () Bool)

(assert (=> b!236930 (=> (not res!116147) (not e!153857))))

(declare-datatypes ((tuple2!4580 0))(
  ( (tuple2!4581 (_1!2301 (_ BitVec 64)) (_2!2301 V!7953)) )
))
(declare-datatypes ((List!3478 0))(
  ( (Nil!3475) (Cons!3474 (h!4128 tuple2!4580) (t!8453 List!3478)) )
))
(declare-datatypes ((ListLongMap!3495 0))(
  ( (ListLongMap!3496 (toList!1763 List!3478)) )
))
(declare-fun contains!1659 (ListLongMap!3495 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1295 (array!11725 array!11723 (_ BitVec 32) (_ BitVec 32) V!7953 V!7953 (_ BitVec 32) Int) ListLongMap!3495)

(assert (=> b!236930 (= res!116147 (not (contains!1659 (getCurrentListMap!1295 (_keys!6485 thiss!1504) (_values!4381 thiss!1504) (mask!10399 thiss!1504) (extraKeys!4135 thiss!1504) (zeroValue!4239 thiss!1504) (minValue!4239 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4398 thiss!1504)) key!932)))))

(declare-fun b!236931 () Bool)

(assert (=> b!236931 (= e!153857 (and (= (size!5908 (_values!4381 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10399 thiss!1504))) (= (size!5909 (_keys!6485 thiss!1504)) (size!5908 (_values!4381 thiss!1504))) (bvslt (mask!10399 thiss!1504) #b00000000000000000000000000000000)))))

(assert (= (and start!22700 res!116148) b!236927))

(assert (= (and b!236927 res!116146) b!236926))

(assert (= (and b!236926 res!116149) b!236930))

(assert (= (and b!236930 res!116147) b!236929))

(assert (= (and b!236929 res!116145) b!236931))

(assert (= (and b!236924 condMapEmpty!10555) mapIsEmpty!10555))

(assert (= (and b!236924 (not condMapEmpty!10555)) mapNonEmpty!10555))

(get-info :version)

(assert (= (and mapNonEmpty!10555 ((_ is ValueCellFull!2771) mapValue!10555)) b!236923))

(assert (= (and b!236924 ((_ is ValueCellFull!2771) mapDefault!10555)) b!236928))

(assert (= b!236925 b!236924))

(assert (= start!22700 b!236925))

(declare-fun m!257909 () Bool)

(assert (=> b!236930 m!257909))

(assert (=> b!236930 m!257909))

(declare-fun m!257911 () Bool)

(assert (=> b!236930 m!257911))

(declare-fun m!257913 () Bool)

(assert (=> mapNonEmpty!10555 m!257913))

(declare-fun m!257915 () Bool)

(assert (=> b!236926 m!257915))

(declare-fun m!257917 () Bool)

(assert (=> start!22700 m!257917))

(declare-fun m!257919 () Bool)

(assert (=> b!236929 m!257919))

(declare-fun m!257921 () Bool)

(assert (=> b!236925 m!257921))

(declare-fun m!257923 () Bool)

(assert (=> b!236925 m!257923))

(check-sat (not mapNonEmpty!10555) (not b_next!6367) (not start!22700) (not b!236930) tp_is_empty!6229 (not b!236925) b_and!13327 (not b!236926) (not b!236929))
(check-sat b_and!13327 (not b_next!6367))
(get-model)

(declare-fun d!59589 () Bool)

(declare-fun e!153905 () Bool)

(assert (=> d!59589 e!153905))

(declare-fun res!116182 () Bool)

(assert (=> d!59589 (=> res!116182 e!153905)))

(declare-fun lt!119860 () Bool)

(assert (=> d!59589 (= res!116182 (not lt!119860))))

(declare-fun lt!119857 () Bool)

(assert (=> d!59589 (= lt!119860 lt!119857)))

(declare-datatypes ((Unit!7275 0))(
  ( (Unit!7276) )
))
(declare-fun lt!119859 () Unit!7275)

(declare-fun e!153904 () Unit!7275)

(assert (=> d!59589 (= lt!119859 e!153904)))

(declare-fun c!39496 () Bool)

(assert (=> d!59589 (= c!39496 lt!119857)))

(declare-fun containsKey!265 (List!3478 (_ BitVec 64)) Bool)

(assert (=> d!59589 (= lt!119857 (containsKey!265 (toList!1763 (getCurrentListMap!1295 (_keys!6485 thiss!1504) (_values!4381 thiss!1504) (mask!10399 thiss!1504) (extraKeys!4135 thiss!1504) (zeroValue!4239 thiss!1504) (minValue!4239 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4398 thiss!1504))) key!932))))

(assert (=> d!59589 (= (contains!1659 (getCurrentListMap!1295 (_keys!6485 thiss!1504) (_values!4381 thiss!1504) (mask!10399 thiss!1504) (extraKeys!4135 thiss!1504) (zeroValue!4239 thiss!1504) (minValue!4239 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4398 thiss!1504)) key!932) lt!119860)))

(declare-fun b!236992 () Bool)

(declare-fun lt!119858 () Unit!7275)

(assert (=> b!236992 (= e!153904 lt!119858)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!213 (List!3478 (_ BitVec 64)) Unit!7275)

(assert (=> b!236992 (= lt!119858 (lemmaContainsKeyImpliesGetValueByKeyDefined!213 (toList!1763 (getCurrentListMap!1295 (_keys!6485 thiss!1504) (_values!4381 thiss!1504) (mask!10399 thiss!1504) (extraKeys!4135 thiss!1504) (zeroValue!4239 thiss!1504) (minValue!4239 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4398 thiss!1504))) key!932))))

(declare-datatypes ((Option!280 0))(
  ( (Some!279 (v!5195 V!7953)) (None!278) )
))
(declare-fun isDefined!214 (Option!280) Bool)

(declare-fun getValueByKey!274 (List!3478 (_ BitVec 64)) Option!280)

(assert (=> b!236992 (isDefined!214 (getValueByKey!274 (toList!1763 (getCurrentListMap!1295 (_keys!6485 thiss!1504) (_values!4381 thiss!1504) (mask!10399 thiss!1504) (extraKeys!4135 thiss!1504) (zeroValue!4239 thiss!1504) (minValue!4239 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4398 thiss!1504))) key!932))))

(declare-fun b!236993 () Bool)

(declare-fun Unit!7277 () Unit!7275)

(assert (=> b!236993 (= e!153904 Unit!7277)))

(declare-fun b!236994 () Bool)

(assert (=> b!236994 (= e!153905 (isDefined!214 (getValueByKey!274 (toList!1763 (getCurrentListMap!1295 (_keys!6485 thiss!1504) (_values!4381 thiss!1504) (mask!10399 thiss!1504) (extraKeys!4135 thiss!1504) (zeroValue!4239 thiss!1504) (minValue!4239 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4398 thiss!1504))) key!932)))))

(assert (= (and d!59589 c!39496) b!236992))

(assert (= (and d!59589 (not c!39496)) b!236993))

(assert (= (and d!59589 (not res!116182)) b!236994))

(declare-fun m!257957 () Bool)

(assert (=> d!59589 m!257957))

(declare-fun m!257959 () Bool)

(assert (=> b!236992 m!257959))

(declare-fun m!257961 () Bool)

(assert (=> b!236992 m!257961))

(assert (=> b!236992 m!257961))

(declare-fun m!257963 () Bool)

(assert (=> b!236992 m!257963))

(assert (=> b!236994 m!257961))

(assert (=> b!236994 m!257961))

(assert (=> b!236994 m!257963))

(assert (=> b!236930 d!59589))

(declare-fun b!237037 () Bool)

(declare-fun e!153942 () ListLongMap!3495)

(declare-fun call!22024 () ListLongMap!3495)

(assert (=> b!237037 (= e!153942 call!22024)))

(declare-fun b!237038 () Bool)

(declare-fun res!116204 () Bool)

(declare-fun e!153936 () Bool)

(assert (=> b!237038 (=> (not res!116204) (not e!153936))))

(declare-fun e!153938 () Bool)

(assert (=> b!237038 (= res!116204 e!153938)))

(declare-fun c!39509 () Bool)

(assert (=> b!237038 (= c!39509 (not (= (bvand (extraKeys!4135 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!237039 () Bool)

(declare-fun e!153939 () ListLongMap!3495)

(assert (=> b!237039 (= e!153939 e!153942)))

(declare-fun c!39512 () Bool)

(assert (=> b!237039 (= c!39512 (and (not (= (bvand (extraKeys!4135 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4135 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!237040 () Bool)

(declare-fun e!153940 () Bool)

(declare-fun call!22025 () Bool)

(assert (=> b!237040 (= e!153940 (not call!22025))))

(declare-fun b!237041 () Bool)

(declare-fun e!153935 () Bool)

(assert (=> b!237041 (= e!153938 e!153935)))

(declare-fun res!116207 () Bool)

(declare-fun call!22022 () Bool)

(assert (=> b!237041 (= res!116207 call!22022)))

(assert (=> b!237041 (=> (not res!116207) (not e!153935))))

(declare-fun b!237042 () Bool)

(declare-fun e!153933 () Bool)

(assert (=> b!237042 (= e!153940 e!153933)))

(declare-fun res!116206 () Bool)

(assert (=> b!237042 (= res!116206 call!22025)))

(assert (=> b!237042 (=> (not res!116206) (not e!153933))))

(declare-fun bm!22017 () Bool)

(declare-fun call!22020 () ListLongMap!3495)

(declare-fun call!22023 () ListLongMap!3495)

(assert (=> bm!22017 (= call!22020 call!22023)))

(declare-fun d!59591 () Bool)

(assert (=> d!59591 e!153936))

(declare-fun res!116208 () Bool)

(assert (=> d!59591 (=> (not res!116208) (not e!153936))))

(assert (=> d!59591 (= res!116208 (or (bvsge #b00000000000000000000000000000000 (size!5909 (_keys!6485 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5909 (_keys!6485 thiss!1504))))))))

(declare-fun lt!119908 () ListLongMap!3495)

(declare-fun lt!119912 () ListLongMap!3495)

(assert (=> d!59591 (= lt!119908 lt!119912)))

(declare-fun lt!119916 () Unit!7275)

(declare-fun e!153937 () Unit!7275)

(assert (=> d!59591 (= lt!119916 e!153937)))

(declare-fun c!39513 () Bool)

(declare-fun e!153941 () Bool)

(assert (=> d!59591 (= c!39513 e!153941)))

(declare-fun res!116205 () Bool)

(assert (=> d!59591 (=> (not res!116205) (not e!153941))))

(assert (=> d!59591 (= res!116205 (bvslt #b00000000000000000000000000000000 (size!5909 (_keys!6485 thiss!1504))))))

(assert (=> d!59591 (= lt!119912 e!153939)))

(declare-fun c!39510 () Bool)

(assert (=> d!59591 (= c!39510 (and (not (= (bvand (extraKeys!4135 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4135 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59591 (validMask!0 (mask!10399 thiss!1504))))

(assert (=> d!59591 (= (getCurrentListMap!1295 (_keys!6485 thiss!1504) (_values!4381 thiss!1504) (mask!10399 thiss!1504) (extraKeys!4135 thiss!1504) (zeroValue!4239 thiss!1504) (minValue!4239 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4398 thiss!1504)) lt!119908)))

(declare-fun b!237043 () Bool)

(declare-fun e!153943 () ListLongMap!3495)

(declare-fun call!22026 () ListLongMap!3495)

(assert (=> b!237043 (= e!153943 call!22026)))

(declare-fun b!237044 () Bool)

(declare-fun lt!119924 () Unit!7275)

(assert (=> b!237044 (= e!153937 lt!119924)))

(declare-fun lt!119915 () ListLongMap!3495)

(declare-fun getCurrentListMapNoExtraKeys!531 (array!11725 array!11723 (_ BitVec 32) (_ BitVec 32) V!7953 V!7953 (_ BitVec 32) Int) ListLongMap!3495)

(assert (=> b!237044 (= lt!119915 (getCurrentListMapNoExtraKeys!531 (_keys!6485 thiss!1504) (_values!4381 thiss!1504) (mask!10399 thiss!1504) (extraKeys!4135 thiss!1504) (zeroValue!4239 thiss!1504) (minValue!4239 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4398 thiss!1504)))))

(declare-fun lt!119909 () (_ BitVec 64))

(assert (=> b!237044 (= lt!119909 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119919 () (_ BitVec 64))

(assert (=> b!237044 (= lt!119919 (select (arr!5570 (_keys!6485 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119917 () Unit!7275)

(declare-fun addStillContains!191 (ListLongMap!3495 (_ BitVec 64) V!7953 (_ BitVec 64)) Unit!7275)

(assert (=> b!237044 (= lt!119917 (addStillContains!191 lt!119915 lt!119909 (zeroValue!4239 thiss!1504) lt!119919))))

(declare-fun +!642 (ListLongMap!3495 tuple2!4580) ListLongMap!3495)

(assert (=> b!237044 (contains!1659 (+!642 lt!119915 (tuple2!4581 lt!119909 (zeroValue!4239 thiss!1504))) lt!119919)))

(declare-fun lt!119914 () Unit!7275)

(assert (=> b!237044 (= lt!119914 lt!119917)))

(declare-fun lt!119907 () ListLongMap!3495)

(assert (=> b!237044 (= lt!119907 (getCurrentListMapNoExtraKeys!531 (_keys!6485 thiss!1504) (_values!4381 thiss!1504) (mask!10399 thiss!1504) (extraKeys!4135 thiss!1504) (zeroValue!4239 thiss!1504) (minValue!4239 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4398 thiss!1504)))))

(declare-fun lt!119905 () (_ BitVec 64))

(assert (=> b!237044 (= lt!119905 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119913 () (_ BitVec 64))

(assert (=> b!237044 (= lt!119913 (select (arr!5570 (_keys!6485 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119921 () Unit!7275)

(declare-fun addApplyDifferent!191 (ListLongMap!3495 (_ BitVec 64) V!7953 (_ BitVec 64)) Unit!7275)

(assert (=> b!237044 (= lt!119921 (addApplyDifferent!191 lt!119907 lt!119905 (minValue!4239 thiss!1504) lt!119913))))

(declare-fun apply!215 (ListLongMap!3495 (_ BitVec 64)) V!7953)

(assert (=> b!237044 (= (apply!215 (+!642 lt!119907 (tuple2!4581 lt!119905 (minValue!4239 thiss!1504))) lt!119913) (apply!215 lt!119907 lt!119913))))

(declare-fun lt!119923 () Unit!7275)

(assert (=> b!237044 (= lt!119923 lt!119921)))

(declare-fun lt!119925 () ListLongMap!3495)

(assert (=> b!237044 (= lt!119925 (getCurrentListMapNoExtraKeys!531 (_keys!6485 thiss!1504) (_values!4381 thiss!1504) (mask!10399 thiss!1504) (extraKeys!4135 thiss!1504) (zeroValue!4239 thiss!1504) (minValue!4239 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4398 thiss!1504)))))

(declare-fun lt!119920 () (_ BitVec 64))

(assert (=> b!237044 (= lt!119920 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119922 () (_ BitVec 64))

(assert (=> b!237044 (= lt!119922 (select (arr!5570 (_keys!6485 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119918 () Unit!7275)

(assert (=> b!237044 (= lt!119918 (addApplyDifferent!191 lt!119925 lt!119920 (zeroValue!4239 thiss!1504) lt!119922))))

(assert (=> b!237044 (= (apply!215 (+!642 lt!119925 (tuple2!4581 lt!119920 (zeroValue!4239 thiss!1504))) lt!119922) (apply!215 lt!119925 lt!119922))))

(declare-fun lt!119910 () Unit!7275)

(assert (=> b!237044 (= lt!119910 lt!119918)))

(declare-fun lt!119911 () ListLongMap!3495)

(assert (=> b!237044 (= lt!119911 (getCurrentListMapNoExtraKeys!531 (_keys!6485 thiss!1504) (_values!4381 thiss!1504) (mask!10399 thiss!1504) (extraKeys!4135 thiss!1504) (zeroValue!4239 thiss!1504) (minValue!4239 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4398 thiss!1504)))))

(declare-fun lt!119926 () (_ BitVec 64))

(assert (=> b!237044 (= lt!119926 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119906 () (_ BitVec 64))

(assert (=> b!237044 (= lt!119906 (select (arr!5570 (_keys!6485 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!237044 (= lt!119924 (addApplyDifferent!191 lt!119911 lt!119926 (minValue!4239 thiss!1504) lt!119906))))

(assert (=> b!237044 (= (apply!215 (+!642 lt!119911 (tuple2!4581 lt!119926 (minValue!4239 thiss!1504))) lt!119906) (apply!215 lt!119911 lt!119906))))

(declare-fun b!237045 () Bool)

(assert (=> b!237045 (= e!153938 (not call!22022))))

(declare-fun bm!22018 () Bool)

(assert (=> bm!22018 (= call!22025 (contains!1659 lt!119908 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237046 () Bool)

(declare-fun Unit!7278 () Unit!7275)

(assert (=> b!237046 (= e!153937 Unit!7278)))

(declare-fun bm!22019 () Bool)

(assert (=> bm!22019 (= call!22023 (getCurrentListMapNoExtraKeys!531 (_keys!6485 thiss!1504) (_values!4381 thiss!1504) (mask!10399 thiss!1504) (extraKeys!4135 thiss!1504) (zeroValue!4239 thiss!1504) (minValue!4239 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4398 thiss!1504)))))

(declare-fun b!237047 () Bool)

(declare-fun res!116202 () Bool)

(assert (=> b!237047 (=> (not res!116202) (not e!153936))))

(declare-fun e!153944 () Bool)

(assert (=> b!237047 (= res!116202 e!153944)))

(declare-fun res!116201 () Bool)

(assert (=> b!237047 (=> res!116201 e!153944)))

(declare-fun e!153934 () Bool)

(assert (=> b!237047 (= res!116201 (not e!153934))))

(declare-fun res!116203 () Bool)

(assert (=> b!237047 (=> (not res!116203) (not e!153934))))

(assert (=> b!237047 (= res!116203 (bvslt #b00000000000000000000000000000000 (size!5909 (_keys!6485 thiss!1504))))))

(declare-fun b!237048 () Bool)

(declare-fun c!39511 () Bool)

(assert (=> b!237048 (= c!39511 (and (not (= (bvand (extraKeys!4135 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4135 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!237048 (= e!153942 e!153943)))

(declare-fun b!237049 () Bool)

(assert (=> b!237049 (= e!153935 (= (apply!215 lt!119908 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4239 thiss!1504)))))

(declare-fun bm!22020 () Bool)

(assert (=> bm!22020 (= call!22022 (contains!1659 lt!119908 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237050 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!237050 (= e!153941 (validKeyInArray!0 (select (arr!5570 (_keys!6485 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!22021 () Bool)

(assert (=> bm!22021 (= call!22026 call!22020)))

(declare-fun b!237051 () Bool)

(declare-fun e!153932 () Bool)

(assert (=> b!237051 (= e!153944 e!153932)))

(declare-fun res!116209 () Bool)

(assert (=> b!237051 (=> (not res!116209) (not e!153932))))

(assert (=> b!237051 (= res!116209 (contains!1659 lt!119908 (select (arr!5570 (_keys!6485 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!237051 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5909 (_keys!6485 thiss!1504))))))

(declare-fun b!237052 () Bool)

(declare-fun get!2874 (ValueCell!2771 V!7953) V!7953)

(declare-fun dynLambda!558 (Int (_ BitVec 64)) V!7953)

(assert (=> b!237052 (= e!153932 (= (apply!215 lt!119908 (select (arr!5570 (_keys!6485 thiss!1504)) #b00000000000000000000000000000000)) (get!2874 (select (arr!5569 (_values!4381 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!558 (defaultEntry!4398 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!237052 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5908 (_values!4381 thiss!1504))))))

(assert (=> b!237052 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5909 (_keys!6485 thiss!1504))))))

(declare-fun call!22021 () ListLongMap!3495)

(declare-fun bm!22022 () Bool)

(assert (=> bm!22022 (= call!22021 (+!642 (ite c!39510 call!22023 (ite c!39512 call!22020 call!22026)) (ite (or c!39510 c!39512) (tuple2!4581 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4239 thiss!1504)) (tuple2!4581 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4239 thiss!1504)))))))

(declare-fun b!237053 () Bool)

(assert (=> b!237053 (= e!153933 (= (apply!215 lt!119908 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4239 thiss!1504)))))

(declare-fun b!237054 () Bool)

(assert (=> b!237054 (= e!153934 (validKeyInArray!0 (select (arr!5570 (_keys!6485 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!237055 () Bool)

(assert (=> b!237055 (= e!153936 e!153940)))

(declare-fun c!39514 () Bool)

(assert (=> b!237055 (= c!39514 (not (= (bvand (extraKeys!4135 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!237056 () Bool)

(assert (=> b!237056 (= e!153943 call!22024)))

(declare-fun bm!22023 () Bool)

(assert (=> bm!22023 (= call!22024 call!22021)))

(declare-fun b!237057 () Bool)

(assert (=> b!237057 (= e!153939 (+!642 call!22021 (tuple2!4581 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4239 thiss!1504))))))

(assert (= (and d!59591 c!39510) b!237057))

(assert (= (and d!59591 (not c!39510)) b!237039))

(assert (= (and b!237039 c!39512) b!237037))

(assert (= (and b!237039 (not c!39512)) b!237048))

(assert (= (and b!237048 c!39511) b!237056))

(assert (= (and b!237048 (not c!39511)) b!237043))

(assert (= (or b!237056 b!237043) bm!22021))

(assert (= (or b!237037 bm!22021) bm!22017))

(assert (= (or b!237037 b!237056) bm!22023))

(assert (= (or b!237057 bm!22017) bm!22019))

(assert (= (or b!237057 bm!22023) bm!22022))

(assert (= (and d!59591 res!116205) b!237050))

(assert (= (and d!59591 c!39513) b!237044))

(assert (= (and d!59591 (not c!39513)) b!237046))

(assert (= (and d!59591 res!116208) b!237047))

(assert (= (and b!237047 res!116203) b!237054))

(assert (= (and b!237047 (not res!116201)) b!237051))

(assert (= (and b!237051 res!116209) b!237052))

(assert (= (and b!237047 res!116202) b!237038))

(assert (= (and b!237038 c!39509) b!237041))

(assert (= (and b!237038 (not c!39509)) b!237045))

(assert (= (and b!237041 res!116207) b!237049))

(assert (= (or b!237041 b!237045) bm!22020))

(assert (= (and b!237038 res!116204) b!237055))

(assert (= (and b!237055 c!39514) b!237042))

(assert (= (and b!237055 (not c!39514)) b!237040))

(assert (= (and b!237042 res!116206) b!237053))

(assert (= (or b!237042 b!237040) bm!22018))

(declare-fun b_lambda!7961 () Bool)

(assert (=> (not b_lambda!7961) (not b!237052)))

(declare-fun t!8457 () Bool)

(declare-fun tb!2935 () Bool)

(assert (=> (and b!236925 (= (defaultEntry!4398 thiss!1504) (defaultEntry!4398 thiss!1504)) t!8457) tb!2935))

(declare-fun result!5143 () Bool)

(assert (=> tb!2935 (= result!5143 tp_is_empty!6229)))

(assert (=> b!237052 t!8457))

(declare-fun b_and!13333 () Bool)

(assert (= b_and!13327 (and (=> t!8457 result!5143) b_and!13333)))

(declare-fun m!257965 () Bool)

(assert (=> bm!22020 m!257965))

(declare-fun m!257967 () Bool)

(assert (=> b!237044 m!257967))

(declare-fun m!257969 () Bool)

(assert (=> b!237044 m!257969))

(declare-fun m!257971 () Bool)

(assert (=> b!237044 m!257971))

(declare-fun m!257973 () Bool)

(assert (=> b!237044 m!257973))

(declare-fun m!257975 () Bool)

(assert (=> b!237044 m!257975))

(declare-fun m!257977 () Bool)

(assert (=> b!237044 m!257977))

(assert (=> b!237044 m!257975))

(declare-fun m!257979 () Bool)

(assert (=> b!237044 m!257979))

(declare-fun m!257981 () Bool)

(assert (=> b!237044 m!257981))

(declare-fun m!257983 () Bool)

(assert (=> b!237044 m!257983))

(assert (=> b!237044 m!257967))

(declare-fun m!257985 () Bool)

(assert (=> b!237044 m!257985))

(declare-fun m!257987 () Bool)

(assert (=> b!237044 m!257987))

(assert (=> b!237044 m!257985))

(declare-fun m!257989 () Bool)

(assert (=> b!237044 m!257989))

(declare-fun m!257991 () Bool)

(assert (=> b!237044 m!257991))

(declare-fun m!257993 () Bool)

(assert (=> b!237044 m!257993))

(declare-fun m!257995 () Bool)

(assert (=> b!237044 m!257995))

(declare-fun m!257997 () Bool)

(assert (=> b!237044 m!257997))

(assert (=> b!237044 m!257993))

(declare-fun m!257999 () Bool)

(assert (=> b!237044 m!257999))

(declare-fun m!258001 () Bool)

(assert (=> b!237053 m!258001))

(declare-fun m!258003 () Bool)

(assert (=> b!237049 m!258003))

(assert (=> b!237054 m!257991))

(assert (=> b!237054 m!257991))

(declare-fun m!258005 () Bool)

(assert (=> b!237054 m!258005))

(declare-fun m!258007 () Bool)

(assert (=> bm!22018 m!258007))

(assert (=> d!59591 m!257919))

(declare-fun m!258009 () Bool)

(assert (=> bm!22022 m!258009))

(declare-fun m!258011 () Bool)

(assert (=> b!237052 m!258011))

(declare-fun m!258013 () Bool)

(assert (=> b!237052 m!258013))

(declare-fun m!258015 () Bool)

(assert (=> b!237052 m!258015))

(assert (=> b!237052 m!258013))

(assert (=> b!237052 m!257991))

(declare-fun m!258017 () Bool)

(assert (=> b!237052 m!258017))

(assert (=> b!237052 m!257991))

(assert (=> b!237052 m!258011))

(assert (=> bm!22019 m!257995))

(declare-fun m!258019 () Bool)

(assert (=> b!237057 m!258019))

(assert (=> b!237050 m!257991))

(assert (=> b!237050 m!257991))

(assert (=> b!237050 m!258005))

(assert (=> b!237051 m!257991))

(assert (=> b!237051 m!257991))

(declare-fun m!258021 () Bool)

(assert (=> b!237051 m!258021))

(assert (=> b!236930 d!59591))

(declare-fun d!59593 () Bool)

(assert (=> d!59593 (= (array_inv!3659 (_keys!6485 thiss!1504)) (bvsge (size!5909 (_keys!6485 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!236925 d!59593))

(declare-fun d!59595 () Bool)

(assert (=> d!59595 (= (array_inv!3660 (_values!4381 thiss!1504)) (bvsge (size!5908 (_values!4381 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!236925 d!59595))

(declare-fun d!59597 () Bool)

(declare-fun res!116216 () Bool)

(declare-fun e!153947 () Bool)

(assert (=> d!59597 (=> (not res!116216) (not e!153947))))

(declare-fun simpleValid!238 (LongMapFixedSize!3442) Bool)

(assert (=> d!59597 (= res!116216 (simpleValid!238 thiss!1504))))

(assert (=> d!59597 (= (valid!1373 thiss!1504) e!153947)))

(declare-fun b!237066 () Bool)

(declare-fun res!116217 () Bool)

(assert (=> b!237066 (=> (not res!116217) (not e!153947))))

(declare-fun arrayCountValidKeys!0 (array!11725 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!237066 (= res!116217 (= (arrayCountValidKeys!0 (_keys!6485 thiss!1504) #b00000000000000000000000000000000 (size!5909 (_keys!6485 thiss!1504))) (_size!1770 thiss!1504)))))

(declare-fun b!237067 () Bool)

(declare-fun res!116218 () Bool)

(assert (=> b!237067 (=> (not res!116218) (not e!153947))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11725 (_ BitVec 32)) Bool)

(assert (=> b!237067 (= res!116218 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6485 thiss!1504) (mask!10399 thiss!1504)))))

(declare-fun b!237068 () Bool)

(declare-datatypes ((List!3481 0))(
  ( (Nil!3478) (Cons!3477 (h!4131 (_ BitVec 64)) (t!8458 List!3481)) )
))
(declare-fun arrayNoDuplicates!0 (array!11725 (_ BitVec 32) List!3481) Bool)

(assert (=> b!237068 (= e!153947 (arrayNoDuplicates!0 (_keys!6485 thiss!1504) #b00000000000000000000000000000000 Nil!3478))))

(assert (= (and d!59597 res!116216) b!237066))

(assert (= (and b!237066 res!116217) b!237067))

(assert (= (and b!237067 res!116218) b!237068))

(declare-fun m!258023 () Bool)

(assert (=> d!59597 m!258023))

(declare-fun m!258025 () Bool)

(assert (=> b!237066 m!258025))

(declare-fun m!258027 () Bool)

(assert (=> b!237067 m!258027))

(declare-fun m!258029 () Bool)

(assert (=> b!237068 m!258029))

(assert (=> start!22700 d!59597))

(declare-fun b!237081 () Bool)

(declare-fun e!153955 () SeekEntryResult!976)

(declare-fun lt!119933 () SeekEntryResult!976)

(assert (=> b!237081 (= e!153955 (MissingZero!976 (index!6076 lt!119933)))))

(declare-fun d!59599 () Bool)

(declare-fun lt!119934 () SeekEntryResult!976)

(assert (=> d!59599 (and (or ((_ is Undefined!976) lt!119934) (not ((_ is Found!976) lt!119934)) (and (bvsge (index!6075 lt!119934) #b00000000000000000000000000000000) (bvslt (index!6075 lt!119934) (size!5909 (_keys!6485 thiss!1504))))) (or ((_ is Undefined!976) lt!119934) ((_ is Found!976) lt!119934) (not ((_ is MissingZero!976) lt!119934)) (and (bvsge (index!6074 lt!119934) #b00000000000000000000000000000000) (bvslt (index!6074 lt!119934) (size!5909 (_keys!6485 thiss!1504))))) (or ((_ is Undefined!976) lt!119934) ((_ is Found!976) lt!119934) ((_ is MissingZero!976) lt!119934) (not ((_ is MissingVacant!976) lt!119934)) (and (bvsge (index!6077 lt!119934) #b00000000000000000000000000000000) (bvslt (index!6077 lt!119934) (size!5909 (_keys!6485 thiss!1504))))) (or ((_ is Undefined!976) lt!119934) (ite ((_ is Found!976) lt!119934) (= (select (arr!5570 (_keys!6485 thiss!1504)) (index!6075 lt!119934)) key!932) (ite ((_ is MissingZero!976) lt!119934) (= (select (arr!5570 (_keys!6485 thiss!1504)) (index!6074 lt!119934)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!976) lt!119934) (= (select (arr!5570 (_keys!6485 thiss!1504)) (index!6077 lt!119934)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!153956 () SeekEntryResult!976)

(assert (=> d!59599 (= lt!119934 e!153956)))

(declare-fun c!39522 () Bool)

(assert (=> d!59599 (= c!39522 (and ((_ is Intermediate!976) lt!119933) (undefined!1788 lt!119933)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11725 (_ BitVec 32)) SeekEntryResult!976)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59599 (= lt!119933 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10399 thiss!1504)) key!932 (_keys!6485 thiss!1504) (mask!10399 thiss!1504)))))

(assert (=> d!59599 (validMask!0 (mask!10399 thiss!1504))))

(assert (=> d!59599 (= (seekEntryOrOpen!0 key!932 (_keys!6485 thiss!1504) (mask!10399 thiss!1504)) lt!119934)))

(declare-fun b!237082 () Bool)

(declare-fun c!39521 () Bool)

(declare-fun lt!119935 () (_ BitVec 64))

(assert (=> b!237082 (= c!39521 (= lt!119935 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!153954 () SeekEntryResult!976)

(assert (=> b!237082 (= e!153954 e!153955)))

(declare-fun b!237083 () Bool)

(assert (=> b!237083 (= e!153956 Undefined!976)))

(declare-fun b!237084 () Bool)

(assert (=> b!237084 (= e!153956 e!153954)))

(assert (=> b!237084 (= lt!119935 (select (arr!5570 (_keys!6485 thiss!1504)) (index!6076 lt!119933)))))

(declare-fun c!39523 () Bool)

(assert (=> b!237084 (= c!39523 (= lt!119935 key!932))))

(declare-fun b!237085 () Bool)

(assert (=> b!237085 (= e!153954 (Found!976 (index!6076 lt!119933)))))

(declare-fun b!237086 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11725 (_ BitVec 32)) SeekEntryResult!976)

(assert (=> b!237086 (= e!153955 (seekKeyOrZeroReturnVacant!0 (x!23884 lt!119933) (index!6076 lt!119933) (index!6076 lt!119933) key!932 (_keys!6485 thiss!1504) (mask!10399 thiss!1504)))))

(assert (= (and d!59599 c!39522) b!237083))

(assert (= (and d!59599 (not c!39522)) b!237084))

(assert (= (and b!237084 c!39523) b!237085))

(assert (= (and b!237084 (not c!39523)) b!237082))

(assert (= (and b!237082 c!39521) b!237081))

(assert (= (and b!237082 (not c!39521)) b!237086))

(declare-fun m!258031 () Bool)

(assert (=> d!59599 m!258031))

(declare-fun m!258033 () Bool)

(assert (=> d!59599 m!258033))

(assert (=> d!59599 m!258031))

(declare-fun m!258035 () Bool)

(assert (=> d!59599 m!258035))

(declare-fun m!258037 () Bool)

(assert (=> d!59599 m!258037))

(declare-fun m!258039 () Bool)

(assert (=> d!59599 m!258039))

(assert (=> d!59599 m!257919))

(declare-fun m!258041 () Bool)

(assert (=> b!237084 m!258041))

(declare-fun m!258043 () Bool)

(assert (=> b!237086 m!258043))

(assert (=> b!236926 d!59599))

(declare-fun d!59601 () Bool)

(assert (=> d!59601 (= (validMask!0 (mask!10399 thiss!1504)) (and (or (= (mask!10399 thiss!1504) #b00000000000000000000000000000111) (= (mask!10399 thiss!1504) #b00000000000000000000000000001111) (= (mask!10399 thiss!1504) #b00000000000000000000000000011111) (= (mask!10399 thiss!1504) #b00000000000000000000000000111111) (= (mask!10399 thiss!1504) #b00000000000000000000000001111111) (= (mask!10399 thiss!1504) #b00000000000000000000000011111111) (= (mask!10399 thiss!1504) #b00000000000000000000000111111111) (= (mask!10399 thiss!1504) #b00000000000000000000001111111111) (= (mask!10399 thiss!1504) #b00000000000000000000011111111111) (= (mask!10399 thiss!1504) #b00000000000000000000111111111111) (= (mask!10399 thiss!1504) #b00000000000000000001111111111111) (= (mask!10399 thiss!1504) #b00000000000000000011111111111111) (= (mask!10399 thiss!1504) #b00000000000000000111111111111111) (= (mask!10399 thiss!1504) #b00000000000000001111111111111111) (= (mask!10399 thiss!1504) #b00000000000000011111111111111111) (= (mask!10399 thiss!1504) #b00000000000000111111111111111111) (= (mask!10399 thiss!1504) #b00000000000001111111111111111111) (= (mask!10399 thiss!1504) #b00000000000011111111111111111111) (= (mask!10399 thiss!1504) #b00000000000111111111111111111111) (= (mask!10399 thiss!1504) #b00000000001111111111111111111111) (= (mask!10399 thiss!1504) #b00000000011111111111111111111111) (= (mask!10399 thiss!1504) #b00000000111111111111111111111111) (= (mask!10399 thiss!1504) #b00000001111111111111111111111111) (= (mask!10399 thiss!1504) #b00000011111111111111111111111111) (= (mask!10399 thiss!1504) #b00000111111111111111111111111111) (= (mask!10399 thiss!1504) #b00001111111111111111111111111111) (= (mask!10399 thiss!1504) #b00011111111111111111111111111111) (= (mask!10399 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10399 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!236929 d!59601))

(declare-fun mapIsEmpty!10564 () Bool)

(declare-fun mapRes!10564 () Bool)

(assert (=> mapIsEmpty!10564 mapRes!10564))

(declare-fun mapNonEmpty!10564 () Bool)

(declare-fun tp!22300 () Bool)

(declare-fun e!153962 () Bool)

(assert (=> mapNonEmpty!10564 (= mapRes!10564 (and tp!22300 e!153962))))

(declare-fun mapKey!10564 () (_ BitVec 32))

(declare-fun mapRest!10564 () (Array (_ BitVec 32) ValueCell!2771))

(declare-fun mapValue!10564 () ValueCell!2771)

(assert (=> mapNonEmpty!10564 (= mapRest!10555 (store mapRest!10564 mapKey!10564 mapValue!10564))))

(declare-fun b!237093 () Bool)

(assert (=> b!237093 (= e!153962 tp_is_empty!6229)))

(declare-fun b!237094 () Bool)

(declare-fun e!153961 () Bool)

(assert (=> b!237094 (= e!153961 tp_is_empty!6229)))

(declare-fun condMapEmpty!10564 () Bool)

(declare-fun mapDefault!10564 () ValueCell!2771)

(assert (=> mapNonEmpty!10555 (= condMapEmpty!10564 (= mapRest!10555 ((as const (Array (_ BitVec 32) ValueCell!2771)) mapDefault!10564)))))

(assert (=> mapNonEmpty!10555 (= tp!22284 (and e!153961 mapRes!10564))))

(assert (= (and mapNonEmpty!10555 condMapEmpty!10564) mapIsEmpty!10564))

(assert (= (and mapNonEmpty!10555 (not condMapEmpty!10564)) mapNonEmpty!10564))

(assert (= (and mapNonEmpty!10564 ((_ is ValueCellFull!2771) mapValue!10564)) b!237093))

(assert (= (and mapNonEmpty!10555 ((_ is ValueCellFull!2771) mapDefault!10564)) b!237094))

(declare-fun m!258045 () Bool)

(assert (=> mapNonEmpty!10564 m!258045))

(declare-fun b_lambda!7963 () Bool)

(assert (= b_lambda!7961 (or (and b!236925 b_free!6367) b_lambda!7963)))

(check-sat (not b!237054) (not b!237068) (not b!237053) (not bm!22019) (not b!237086) (not mapNonEmpty!10564) (not d!59591) (not d!59589) (not b!236994) (not b!236992) (not b!237044) (not b!237050) b_and!13333 (not d!59599) (not d!59597) (not b!237066) (not b!237057) (not b_next!6367) (not bm!22020) (not b_lambda!7963) (not bm!22022) tp_is_empty!6229 (not b!237049) (not b!237052) (not b!237051) (not b!237067) (not bm!22018))
(check-sat b_and!13333 (not b_next!6367))

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22352 () Bool)

(assert start!22352)

(declare-fun b!233939 () Bool)

(declare-fun b_free!6301 () Bool)

(declare-fun b_next!6301 () Bool)

(assert (=> b!233939 (= b_free!6301 (not b_next!6301))))

(declare-fun tp!22056 () Bool)

(declare-fun b_and!13187 () Bool)

(assert (=> b!233939 (= tp!22056 b_and!13187)))

(declare-fun b!233935 () Bool)

(declare-fun res!114746 () Bool)

(declare-fun e!151948 () Bool)

(assert (=> b!233935 (=> (not res!114746) (not e!151948))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!233935 (= res!114746 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!233936 () Bool)

(declare-fun e!151945 () Bool)

(declare-datatypes ((V!7865 0))(
  ( (V!7866 (val!3126 Int)) )
))
(declare-datatypes ((ValueCell!2738 0))(
  ( (ValueCellFull!2738 (v!5143 V!7865)) (EmptyCell!2738) )
))
(declare-datatypes ((array!11567 0))(
  ( (array!11568 (arr!5499 (Array (_ BitVec 32) ValueCell!2738)) (size!5835 (_ BitVec 32))) )
))
(declare-datatypes ((array!11569 0))(
  ( (array!11570 (arr!5500 (Array (_ BitVec 32) (_ BitVec 64))) (size!5836 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3376 0))(
  ( (LongMapFixedSize!3377 (defaultEntry!4352 Int) (mask!10293 (_ BitVec 32)) (extraKeys!4089 (_ BitVec 32)) (zeroValue!4193 V!7865) (minValue!4193 V!7865) (_size!1737 (_ BitVec 32)) (_keys!6414 array!11569) (_values!4335 array!11567) (_vacant!1737 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3376)

(assert (=> b!233936 (= e!151945 (and (= (size!5835 (_values!4335 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10293 thiss!1504))) (= (size!5836 (_keys!6414 thiss!1504)) (size!5835 (_values!4335 thiss!1504))) (bvslt (mask!10293 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!233937 () Bool)

(declare-fun e!151946 () Bool)

(declare-fun tp_is_empty!6163 () Bool)

(assert (=> b!233937 (= e!151946 tp_is_empty!6163)))

(declare-fun b!233938 () Bool)

(assert (=> b!233938 (= e!151948 e!151945)))

(declare-fun res!114744 () Bool)

(assert (=> b!233938 (=> (not res!114744) (not e!151945))))

(declare-datatypes ((SeekEntryResult!984 0))(
  ( (MissingZero!984 (index!6106 (_ BitVec 32))) (Found!984 (index!6107 (_ BitVec 32))) (Intermediate!984 (undefined!1796 Bool) (index!6108 (_ BitVec 32)) (x!23681 (_ BitVec 32))) (Undefined!984) (MissingVacant!984 (index!6109 (_ BitVec 32))) )
))
(declare-fun lt!118235 () SeekEntryResult!984)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!233938 (= res!114744 (or (= lt!118235 (MissingZero!984 index!297)) (= lt!118235 (MissingVacant!984 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11569 (_ BitVec 32)) SeekEntryResult!984)

(assert (=> b!233938 (= lt!118235 (seekEntryOrOpen!0 key!932 (_keys!6414 thiss!1504) (mask!10293 thiss!1504)))))

(declare-fun e!151942 () Bool)

(declare-fun e!151947 () Bool)

(declare-fun array_inv!3633 (array!11569) Bool)

(declare-fun array_inv!3634 (array!11567) Bool)

(assert (=> b!233939 (= e!151942 (and tp!22056 tp_is_empty!6163 (array_inv!3633 (_keys!6414 thiss!1504)) (array_inv!3634 (_values!4335 thiss!1504)) e!151947))))

(declare-fun b!233940 () Bool)

(declare-fun e!151943 () Bool)

(assert (=> b!233940 (= e!151943 tp_is_empty!6163)))

(declare-fun mapNonEmpty!10425 () Bool)

(declare-fun mapRes!10425 () Bool)

(declare-fun tp!22055 () Bool)

(assert (=> mapNonEmpty!10425 (= mapRes!10425 (and tp!22055 e!151943))))

(declare-fun mapValue!10425 () ValueCell!2738)

(declare-fun mapRest!10425 () (Array (_ BitVec 32) ValueCell!2738))

(declare-fun mapKey!10425 () (_ BitVec 32))

(assert (=> mapNonEmpty!10425 (= (arr!5499 (_values!4335 thiss!1504)) (store mapRest!10425 mapKey!10425 mapValue!10425))))

(declare-fun b!233941 () Bool)

(declare-fun res!114747 () Bool)

(assert (=> b!233941 (=> (not res!114747) (not e!151945))))

(declare-datatypes ((tuple2!4592 0))(
  ( (tuple2!4593 (_1!2307 (_ BitVec 64)) (_2!2307 V!7865)) )
))
(declare-datatypes ((List!3520 0))(
  ( (Nil!3517) (Cons!3516 (h!4166 tuple2!4592) (t!8476 List!3520)) )
))
(declare-datatypes ((ListLongMap!3495 0))(
  ( (ListLongMap!3496 (toList!1763 List!3520)) )
))
(declare-fun contains!1638 (ListLongMap!3495 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1272 (array!11569 array!11567 (_ BitVec 32) (_ BitVec 32) V!7865 V!7865 (_ BitVec 32) Int) ListLongMap!3495)

(assert (=> b!233941 (= res!114747 (contains!1638 (getCurrentListMap!1272 (_keys!6414 thiss!1504) (_values!4335 thiss!1504) (mask!10293 thiss!1504) (extraKeys!4089 thiss!1504) (zeroValue!4193 thiss!1504) (minValue!4193 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4352 thiss!1504)) key!932))))

(declare-fun mapIsEmpty!10425 () Bool)

(assert (=> mapIsEmpty!10425 mapRes!10425))

(declare-fun res!114745 () Bool)

(assert (=> start!22352 (=> (not res!114745) (not e!151948))))

(declare-fun valid!1350 (LongMapFixedSize!3376) Bool)

(assert (=> start!22352 (= res!114745 (valid!1350 thiss!1504))))

(assert (=> start!22352 e!151948))

(assert (=> start!22352 e!151942))

(assert (=> start!22352 true))

(declare-fun b!233942 () Bool)

(assert (=> b!233942 (= e!151947 (and e!151946 mapRes!10425))))

(declare-fun condMapEmpty!10425 () Bool)

(declare-fun mapDefault!10425 () ValueCell!2738)

(assert (=> b!233942 (= condMapEmpty!10425 (= (arr!5499 (_values!4335 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2738)) mapDefault!10425)))))

(declare-fun b!233943 () Bool)

(declare-fun res!114743 () Bool)

(assert (=> b!233943 (=> (not res!114743) (not e!151945))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!233943 (= res!114743 (validMask!0 (mask!10293 thiss!1504)))))

(assert (= (and start!22352 res!114745) b!233935))

(assert (= (and b!233935 res!114746) b!233938))

(assert (= (and b!233938 res!114744) b!233941))

(assert (= (and b!233941 res!114747) b!233943))

(assert (= (and b!233943 res!114743) b!233936))

(assert (= (and b!233942 condMapEmpty!10425) mapIsEmpty!10425))

(assert (= (and b!233942 (not condMapEmpty!10425)) mapNonEmpty!10425))

(get-info :version)

(assert (= (and mapNonEmpty!10425 ((_ is ValueCellFull!2738) mapValue!10425)) b!233940))

(assert (= (and b!233942 ((_ is ValueCellFull!2738) mapDefault!10425)) b!233937))

(assert (= b!233939 b!233942))

(assert (= start!22352 b!233939))

(declare-fun m!254819 () Bool)

(assert (=> b!233943 m!254819))

(declare-fun m!254821 () Bool)

(assert (=> mapNonEmpty!10425 m!254821))

(declare-fun m!254823 () Bool)

(assert (=> b!233939 m!254823))

(declare-fun m!254825 () Bool)

(assert (=> b!233939 m!254825))

(declare-fun m!254827 () Bool)

(assert (=> b!233941 m!254827))

(assert (=> b!233941 m!254827))

(declare-fun m!254829 () Bool)

(assert (=> b!233941 m!254829))

(declare-fun m!254831 () Bool)

(assert (=> start!22352 m!254831))

(declare-fun m!254833 () Bool)

(assert (=> b!233938 m!254833))

(check-sat (not b!233939) (not start!22352) (not b!233943) b_and!13187 tp_is_empty!6163 (not b!233941) (not b_next!6301) (not b!233938) (not mapNonEmpty!10425))
(check-sat b_and!13187 (not b_next!6301))
(get-model)

(declare-fun d!58911 () Bool)

(assert (=> d!58911 (= (array_inv!3633 (_keys!6414 thiss!1504)) (bvsge (size!5836 (_keys!6414 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!233939 d!58911))

(declare-fun d!58913 () Bool)

(assert (=> d!58913 (= (array_inv!3634 (_values!4335 thiss!1504)) (bvsge (size!5835 (_values!4335 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!233939 d!58913))

(declare-fun d!58915 () Bool)

(assert (=> d!58915 (= (validMask!0 (mask!10293 thiss!1504)) (and (or (= (mask!10293 thiss!1504) #b00000000000000000000000000000111) (= (mask!10293 thiss!1504) #b00000000000000000000000000001111) (= (mask!10293 thiss!1504) #b00000000000000000000000000011111) (= (mask!10293 thiss!1504) #b00000000000000000000000000111111) (= (mask!10293 thiss!1504) #b00000000000000000000000001111111) (= (mask!10293 thiss!1504) #b00000000000000000000000011111111) (= (mask!10293 thiss!1504) #b00000000000000000000000111111111) (= (mask!10293 thiss!1504) #b00000000000000000000001111111111) (= (mask!10293 thiss!1504) #b00000000000000000000011111111111) (= (mask!10293 thiss!1504) #b00000000000000000000111111111111) (= (mask!10293 thiss!1504) #b00000000000000000001111111111111) (= (mask!10293 thiss!1504) #b00000000000000000011111111111111) (= (mask!10293 thiss!1504) #b00000000000000000111111111111111) (= (mask!10293 thiss!1504) #b00000000000000001111111111111111) (= (mask!10293 thiss!1504) #b00000000000000011111111111111111) (= (mask!10293 thiss!1504) #b00000000000000111111111111111111) (= (mask!10293 thiss!1504) #b00000000000001111111111111111111) (= (mask!10293 thiss!1504) #b00000000000011111111111111111111) (= (mask!10293 thiss!1504) #b00000000000111111111111111111111) (= (mask!10293 thiss!1504) #b00000000001111111111111111111111) (= (mask!10293 thiss!1504) #b00000000011111111111111111111111) (= (mask!10293 thiss!1504) #b00000000111111111111111111111111) (= (mask!10293 thiss!1504) #b00000001111111111111111111111111) (= (mask!10293 thiss!1504) #b00000011111111111111111111111111) (= (mask!10293 thiss!1504) #b00000111111111111111111111111111) (= (mask!10293 thiss!1504) #b00001111111111111111111111111111) (= (mask!10293 thiss!1504) #b00011111111111111111111111111111) (= (mask!10293 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10293 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!233943 d!58915))

(declare-fun d!58917 () Bool)

(declare-fun res!114784 () Bool)

(declare-fun e!151993 () Bool)

(assert (=> d!58917 (=> (not res!114784) (not e!151993))))

(declare-fun simpleValid!229 (LongMapFixedSize!3376) Bool)

(assert (=> d!58917 (= res!114784 (simpleValid!229 thiss!1504))))

(assert (=> d!58917 (= (valid!1350 thiss!1504) e!151993)))

(declare-fun b!234004 () Bool)

(declare-fun res!114785 () Bool)

(assert (=> b!234004 (=> (not res!114785) (not e!151993))))

(declare-fun arrayCountValidKeys!0 (array!11569 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!234004 (= res!114785 (= (arrayCountValidKeys!0 (_keys!6414 thiss!1504) #b00000000000000000000000000000000 (size!5836 (_keys!6414 thiss!1504))) (_size!1737 thiss!1504)))))

(declare-fun b!234005 () Bool)

(declare-fun res!114786 () Bool)

(assert (=> b!234005 (=> (not res!114786) (not e!151993))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11569 (_ BitVec 32)) Bool)

(assert (=> b!234005 (= res!114786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6414 thiss!1504) (mask!10293 thiss!1504)))))

(declare-fun b!234006 () Bool)

(declare-datatypes ((List!3521 0))(
  ( (Nil!3518) (Cons!3517 (h!4167 (_ BitVec 64)) (t!8479 List!3521)) )
))
(declare-fun arrayNoDuplicates!0 (array!11569 (_ BitVec 32) List!3521) Bool)

(assert (=> b!234006 (= e!151993 (arrayNoDuplicates!0 (_keys!6414 thiss!1504) #b00000000000000000000000000000000 Nil!3518))))

(assert (= (and d!58917 res!114784) b!234004))

(assert (= (and b!234004 res!114785) b!234005))

(assert (= (and b!234005 res!114786) b!234006))

(declare-fun m!254867 () Bool)

(assert (=> d!58917 m!254867))

(declare-fun m!254869 () Bool)

(assert (=> b!234004 m!254869))

(declare-fun m!254871 () Bool)

(assert (=> b!234005 m!254871))

(declare-fun m!254873 () Bool)

(assert (=> b!234006 m!254873))

(assert (=> start!22352 d!58917))

(declare-fun b!234019 () Bool)

(declare-fun c!38957 () Bool)

(declare-fun lt!118250 () (_ BitVec 64))

(assert (=> b!234019 (= c!38957 (= lt!118250 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!152002 () SeekEntryResult!984)

(declare-fun e!152001 () SeekEntryResult!984)

(assert (=> b!234019 (= e!152002 e!152001)))

(declare-fun b!234020 () Bool)

(declare-fun lt!118248 () SeekEntryResult!984)

(assert (=> b!234020 (= e!152002 (Found!984 (index!6108 lt!118248)))))

(declare-fun b!234021 () Bool)

(declare-fun e!152000 () SeekEntryResult!984)

(assert (=> b!234021 (= e!152000 e!152002)))

(assert (=> b!234021 (= lt!118250 (select (arr!5500 (_keys!6414 thiss!1504)) (index!6108 lt!118248)))))

(declare-fun c!38958 () Bool)

(assert (=> b!234021 (= c!38958 (= lt!118250 key!932))))

(declare-fun d!58919 () Bool)

(declare-fun lt!118249 () SeekEntryResult!984)

(assert (=> d!58919 (and (or ((_ is Undefined!984) lt!118249) (not ((_ is Found!984) lt!118249)) (and (bvsge (index!6107 lt!118249) #b00000000000000000000000000000000) (bvslt (index!6107 lt!118249) (size!5836 (_keys!6414 thiss!1504))))) (or ((_ is Undefined!984) lt!118249) ((_ is Found!984) lt!118249) (not ((_ is MissingZero!984) lt!118249)) (and (bvsge (index!6106 lt!118249) #b00000000000000000000000000000000) (bvslt (index!6106 lt!118249) (size!5836 (_keys!6414 thiss!1504))))) (or ((_ is Undefined!984) lt!118249) ((_ is Found!984) lt!118249) ((_ is MissingZero!984) lt!118249) (not ((_ is MissingVacant!984) lt!118249)) (and (bvsge (index!6109 lt!118249) #b00000000000000000000000000000000) (bvslt (index!6109 lt!118249) (size!5836 (_keys!6414 thiss!1504))))) (or ((_ is Undefined!984) lt!118249) (ite ((_ is Found!984) lt!118249) (= (select (arr!5500 (_keys!6414 thiss!1504)) (index!6107 lt!118249)) key!932) (ite ((_ is MissingZero!984) lt!118249) (= (select (arr!5500 (_keys!6414 thiss!1504)) (index!6106 lt!118249)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!984) lt!118249) (= (select (arr!5500 (_keys!6414 thiss!1504)) (index!6109 lt!118249)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!58919 (= lt!118249 e!152000)))

(declare-fun c!38956 () Bool)

(assert (=> d!58919 (= c!38956 (and ((_ is Intermediate!984) lt!118248) (undefined!1796 lt!118248)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11569 (_ BitVec 32)) SeekEntryResult!984)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58919 (= lt!118248 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10293 thiss!1504)) key!932 (_keys!6414 thiss!1504) (mask!10293 thiss!1504)))))

(assert (=> d!58919 (validMask!0 (mask!10293 thiss!1504))))

(assert (=> d!58919 (= (seekEntryOrOpen!0 key!932 (_keys!6414 thiss!1504) (mask!10293 thiss!1504)) lt!118249)))

(declare-fun b!234022 () Bool)

(assert (=> b!234022 (= e!152001 (MissingZero!984 (index!6108 lt!118248)))))

(declare-fun b!234023 () Bool)

(assert (=> b!234023 (= e!152000 Undefined!984)))

(declare-fun b!234024 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11569 (_ BitVec 32)) SeekEntryResult!984)

(assert (=> b!234024 (= e!152001 (seekKeyOrZeroReturnVacant!0 (x!23681 lt!118248) (index!6108 lt!118248) (index!6108 lt!118248) key!932 (_keys!6414 thiss!1504) (mask!10293 thiss!1504)))))

(assert (= (and d!58919 c!38956) b!234023))

(assert (= (and d!58919 (not c!38956)) b!234021))

(assert (= (and b!234021 c!38958) b!234020))

(assert (= (and b!234021 (not c!38958)) b!234019))

(assert (= (and b!234019 c!38957) b!234022))

(assert (= (and b!234019 (not c!38957)) b!234024))

(declare-fun m!254875 () Bool)

(assert (=> b!234021 m!254875))

(declare-fun m!254877 () Bool)

(assert (=> d!58919 m!254877))

(assert (=> d!58919 m!254819))

(declare-fun m!254879 () Bool)

(assert (=> d!58919 m!254879))

(declare-fun m!254881 () Bool)

(assert (=> d!58919 m!254881))

(declare-fun m!254883 () Bool)

(assert (=> d!58919 m!254883))

(assert (=> d!58919 m!254879))

(declare-fun m!254885 () Bool)

(assert (=> d!58919 m!254885))

(declare-fun m!254887 () Bool)

(assert (=> b!234024 m!254887))

(assert (=> b!233938 d!58919))

(declare-fun d!58921 () Bool)

(declare-fun e!152007 () Bool)

(assert (=> d!58921 e!152007))

(declare-fun res!114789 () Bool)

(assert (=> d!58921 (=> res!114789 e!152007)))

(declare-fun lt!118261 () Bool)

(assert (=> d!58921 (= res!114789 (not lt!118261))))

(declare-fun lt!118259 () Bool)

(assert (=> d!58921 (= lt!118261 lt!118259)))

(declare-datatypes ((Unit!7226 0))(
  ( (Unit!7227) )
))
(declare-fun lt!118260 () Unit!7226)

(declare-fun e!152008 () Unit!7226)

(assert (=> d!58921 (= lt!118260 e!152008)))

(declare-fun c!38961 () Bool)

(assert (=> d!58921 (= c!38961 lt!118259)))

(declare-fun containsKey!254 (List!3520 (_ BitVec 64)) Bool)

(assert (=> d!58921 (= lt!118259 (containsKey!254 (toList!1763 (getCurrentListMap!1272 (_keys!6414 thiss!1504) (_values!4335 thiss!1504) (mask!10293 thiss!1504) (extraKeys!4089 thiss!1504) (zeroValue!4193 thiss!1504) (minValue!4193 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4352 thiss!1504))) key!932))))

(assert (=> d!58921 (= (contains!1638 (getCurrentListMap!1272 (_keys!6414 thiss!1504) (_values!4335 thiss!1504) (mask!10293 thiss!1504) (extraKeys!4089 thiss!1504) (zeroValue!4193 thiss!1504) (minValue!4193 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4352 thiss!1504)) key!932) lt!118261)))

(declare-fun b!234031 () Bool)

(declare-fun lt!118262 () Unit!7226)

(assert (=> b!234031 (= e!152008 lt!118262)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!203 (List!3520 (_ BitVec 64)) Unit!7226)

(assert (=> b!234031 (= lt!118262 (lemmaContainsKeyImpliesGetValueByKeyDefined!203 (toList!1763 (getCurrentListMap!1272 (_keys!6414 thiss!1504) (_values!4335 thiss!1504) (mask!10293 thiss!1504) (extraKeys!4089 thiss!1504) (zeroValue!4193 thiss!1504) (minValue!4193 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4352 thiss!1504))) key!932))))

(declare-datatypes ((Option!268 0))(
  ( (Some!267 (v!5146 V!7865)) (None!266) )
))
(declare-fun isDefined!204 (Option!268) Bool)

(declare-fun getValueByKey!262 (List!3520 (_ BitVec 64)) Option!268)

(assert (=> b!234031 (isDefined!204 (getValueByKey!262 (toList!1763 (getCurrentListMap!1272 (_keys!6414 thiss!1504) (_values!4335 thiss!1504) (mask!10293 thiss!1504) (extraKeys!4089 thiss!1504) (zeroValue!4193 thiss!1504) (minValue!4193 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4352 thiss!1504))) key!932))))

(declare-fun b!234032 () Bool)

(declare-fun Unit!7228 () Unit!7226)

(assert (=> b!234032 (= e!152008 Unit!7228)))

(declare-fun b!234033 () Bool)

(assert (=> b!234033 (= e!152007 (isDefined!204 (getValueByKey!262 (toList!1763 (getCurrentListMap!1272 (_keys!6414 thiss!1504) (_values!4335 thiss!1504) (mask!10293 thiss!1504) (extraKeys!4089 thiss!1504) (zeroValue!4193 thiss!1504) (minValue!4193 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4352 thiss!1504))) key!932)))))

(assert (= (and d!58921 c!38961) b!234031))

(assert (= (and d!58921 (not c!38961)) b!234032))

(assert (= (and d!58921 (not res!114789)) b!234033))

(declare-fun m!254889 () Bool)

(assert (=> d!58921 m!254889))

(declare-fun m!254891 () Bool)

(assert (=> b!234031 m!254891))

(declare-fun m!254893 () Bool)

(assert (=> b!234031 m!254893))

(assert (=> b!234031 m!254893))

(declare-fun m!254895 () Bool)

(assert (=> b!234031 m!254895))

(assert (=> b!234033 m!254893))

(assert (=> b!234033 m!254893))

(assert (=> b!234033 m!254895))

(assert (=> b!233941 d!58921))

(declare-fun b!234076 () Bool)

(declare-fun e!152037 () Bool)

(declare-fun e!152045 () Bool)

(assert (=> b!234076 (= e!152037 e!152045)))

(declare-fun c!38977 () Bool)

(assert (=> b!234076 (= c!38977 (not (= (bvand (extraKeys!4089 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!234077 () Bool)

(declare-fun e!152042 () Bool)

(declare-fun lt!118326 () ListLongMap!3495)

(declare-fun apply!206 (ListLongMap!3495 (_ BitVec 64)) V!7865)

(assert (=> b!234077 (= e!152042 (= (apply!206 lt!118326 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4193 thiss!1504)))))

(declare-fun b!234078 () Bool)

(declare-fun e!152044 () Bool)

(assert (=> b!234078 (= e!152045 e!152044)))

(declare-fun res!114808 () Bool)

(declare-fun call!21757 () Bool)

(assert (=> b!234078 (= res!114808 call!21757)))

(assert (=> b!234078 (=> (not res!114808) (not e!152044))))

(declare-fun b!234079 () Bool)

(declare-fun e!152035 () Unit!7226)

(declare-fun lt!118310 () Unit!7226)

(assert (=> b!234079 (= e!152035 lt!118310)))

(declare-fun lt!118324 () ListLongMap!3495)

(declare-fun getCurrentListMapNoExtraKeys!522 (array!11569 array!11567 (_ BitVec 32) (_ BitVec 32) V!7865 V!7865 (_ BitVec 32) Int) ListLongMap!3495)

(assert (=> b!234079 (= lt!118324 (getCurrentListMapNoExtraKeys!522 (_keys!6414 thiss!1504) (_values!4335 thiss!1504) (mask!10293 thiss!1504) (extraKeys!4089 thiss!1504) (zeroValue!4193 thiss!1504) (minValue!4193 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4352 thiss!1504)))))

(declare-fun lt!118315 () (_ BitVec 64))

(assert (=> b!234079 (= lt!118315 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118322 () (_ BitVec 64))

(assert (=> b!234079 (= lt!118322 (select (arr!5500 (_keys!6414 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118327 () Unit!7226)

(declare-fun addStillContains!182 (ListLongMap!3495 (_ BitVec 64) V!7865 (_ BitVec 64)) Unit!7226)

(assert (=> b!234079 (= lt!118327 (addStillContains!182 lt!118324 lt!118315 (zeroValue!4193 thiss!1504) lt!118322))))

(declare-fun +!639 (ListLongMap!3495 tuple2!4592) ListLongMap!3495)

(assert (=> b!234079 (contains!1638 (+!639 lt!118324 (tuple2!4593 lt!118315 (zeroValue!4193 thiss!1504))) lt!118322)))

(declare-fun lt!118317 () Unit!7226)

(assert (=> b!234079 (= lt!118317 lt!118327)))

(declare-fun lt!118321 () ListLongMap!3495)

(assert (=> b!234079 (= lt!118321 (getCurrentListMapNoExtraKeys!522 (_keys!6414 thiss!1504) (_values!4335 thiss!1504) (mask!10293 thiss!1504) (extraKeys!4089 thiss!1504) (zeroValue!4193 thiss!1504) (minValue!4193 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4352 thiss!1504)))))

(declare-fun lt!118309 () (_ BitVec 64))

(assert (=> b!234079 (= lt!118309 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118318 () (_ BitVec 64))

(assert (=> b!234079 (= lt!118318 (select (arr!5500 (_keys!6414 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118320 () Unit!7226)

(declare-fun addApplyDifferent!182 (ListLongMap!3495 (_ BitVec 64) V!7865 (_ BitVec 64)) Unit!7226)

(assert (=> b!234079 (= lt!118320 (addApplyDifferent!182 lt!118321 lt!118309 (minValue!4193 thiss!1504) lt!118318))))

(assert (=> b!234079 (= (apply!206 (+!639 lt!118321 (tuple2!4593 lt!118309 (minValue!4193 thiss!1504))) lt!118318) (apply!206 lt!118321 lt!118318))))

(declare-fun lt!118311 () Unit!7226)

(assert (=> b!234079 (= lt!118311 lt!118320)))

(declare-fun lt!118312 () ListLongMap!3495)

(assert (=> b!234079 (= lt!118312 (getCurrentListMapNoExtraKeys!522 (_keys!6414 thiss!1504) (_values!4335 thiss!1504) (mask!10293 thiss!1504) (extraKeys!4089 thiss!1504) (zeroValue!4193 thiss!1504) (minValue!4193 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4352 thiss!1504)))))

(declare-fun lt!118308 () (_ BitVec 64))

(assert (=> b!234079 (= lt!118308 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118328 () (_ BitVec 64))

(assert (=> b!234079 (= lt!118328 (select (arr!5500 (_keys!6414 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118307 () Unit!7226)

(assert (=> b!234079 (= lt!118307 (addApplyDifferent!182 lt!118312 lt!118308 (zeroValue!4193 thiss!1504) lt!118328))))

(assert (=> b!234079 (= (apply!206 (+!639 lt!118312 (tuple2!4593 lt!118308 (zeroValue!4193 thiss!1504))) lt!118328) (apply!206 lt!118312 lt!118328))))

(declare-fun lt!118319 () Unit!7226)

(assert (=> b!234079 (= lt!118319 lt!118307)))

(declare-fun lt!118314 () ListLongMap!3495)

(assert (=> b!234079 (= lt!118314 (getCurrentListMapNoExtraKeys!522 (_keys!6414 thiss!1504) (_values!4335 thiss!1504) (mask!10293 thiss!1504) (extraKeys!4089 thiss!1504) (zeroValue!4193 thiss!1504) (minValue!4193 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4352 thiss!1504)))))

(declare-fun lt!118323 () (_ BitVec 64))

(assert (=> b!234079 (= lt!118323 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118316 () (_ BitVec 64))

(assert (=> b!234079 (= lt!118316 (select (arr!5500 (_keys!6414 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!234079 (= lt!118310 (addApplyDifferent!182 lt!118314 lt!118323 (minValue!4193 thiss!1504) lt!118316))))

(assert (=> b!234079 (= (apply!206 (+!639 lt!118314 (tuple2!4593 lt!118323 (minValue!4193 thiss!1504))) lt!118316) (apply!206 lt!118314 lt!118316))))

(declare-fun b!234080 () Bool)

(declare-fun res!114814 () Bool)

(assert (=> b!234080 (=> (not res!114814) (not e!152037))))

(declare-fun e!152040 () Bool)

(assert (=> b!234080 (= res!114814 e!152040)))

(declare-fun c!38979 () Bool)

(assert (=> b!234080 (= c!38979 (not (= (bvand (extraKeys!4089 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!234081 () Bool)

(declare-fun e!152038 () ListLongMap!3495)

(declare-fun call!21762 () ListLongMap!3495)

(assert (=> b!234081 (= e!152038 call!21762)))

(declare-fun b!234082 () Bool)

(declare-fun e!152047 () ListLongMap!3495)

(assert (=> b!234082 (= e!152047 e!152038)))

(declare-fun c!38975 () Bool)

(assert (=> b!234082 (= c!38975 (and (not (= (bvand (extraKeys!4089 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4089 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!234083 () Bool)

(assert (=> b!234083 (= e!152045 (not call!21757))))

(declare-fun b!234084 () Bool)

(declare-fun res!114813 () Bool)

(assert (=> b!234084 (=> (not res!114813) (not e!152037))))

(declare-fun e!152041 () Bool)

(assert (=> b!234084 (= res!114813 e!152041)))

(declare-fun res!114810 () Bool)

(assert (=> b!234084 (=> res!114810 e!152041)))

(declare-fun e!152039 () Bool)

(assert (=> b!234084 (= res!114810 (not e!152039))))

(declare-fun res!114811 () Bool)

(assert (=> b!234084 (=> (not res!114811) (not e!152039))))

(assert (=> b!234084 (= res!114811 (bvslt #b00000000000000000000000000000000 (size!5836 (_keys!6414 thiss!1504))))))

(declare-fun b!234085 () Bool)

(assert (=> b!234085 (= e!152040 e!152042)))

(declare-fun res!114815 () Bool)

(declare-fun call!21760 () Bool)

(assert (=> b!234085 (= res!114815 call!21760)))

(assert (=> b!234085 (=> (not res!114815) (not e!152042))))

(declare-fun b!234086 () Bool)

(declare-fun e!152046 () ListLongMap!3495)

(declare-fun call!21759 () ListLongMap!3495)

(assert (=> b!234086 (= e!152046 call!21759)))

(declare-fun d!58923 () Bool)

(assert (=> d!58923 e!152037))

(declare-fun res!114812 () Bool)

(assert (=> d!58923 (=> (not res!114812) (not e!152037))))

(assert (=> d!58923 (= res!114812 (or (bvsge #b00000000000000000000000000000000 (size!5836 (_keys!6414 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5836 (_keys!6414 thiss!1504))))))))

(declare-fun lt!118313 () ListLongMap!3495)

(assert (=> d!58923 (= lt!118326 lt!118313)))

(declare-fun lt!118325 () Unit!7226)

(assert (=> d!58923 (= lt!118325 e!152035)))

(declare-fun c!38976 () Bool)

(declare-fun e!152036 () Bool)

(assert (=> d!58923 (= c!38976 e!152036)))

(declare-fun res!114816 () Bool)

(assert (=> d!58923 (=> (not res!114816) (not e!152036))))

(assert (=> d!58923 (= res!114816 (bvslt #b00000000000000000000000000000000 (size!5836 (_keys!6414 thiss!1504))))))

(assert (=> d!58923 (= lt!118313 e!152047)))

(declare-fun c!38978 () Bool)

(assert (=> d!58923 (= c!38978 (and (not (= (bvand (extraKeys!4089 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4089 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58923 (validMask!0 (mask!10293 thiss!1504))))

(assert (=> d!58923 (= (getCurrentListMap!1272 (_keys!6414 thiss!1504) (_values!4335 thiss!1504) (mask!10293 thiss!1504) (extraKeys!4089 thiss!1504) (zeroValue!4193 thiss!1504) (minValue!4193 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4352 thiss!1504)) lt!118326)))

(declare-fun bm!21753 () Bool)

(declare-fun call!21761 () ListLongMap!3495)

(assert (=> bm!21753 (= call!21762 call!21761)))

(declare-fun bm!21754 () Bool)

(declare-fun call!21756 () ListLongMap!3495)

(assert (=> bm!21754 (= call!21759 call!21756)))

(declare-fun bm!21755 () Bool)

(assert (=> bm!21755 (= call!21757 (contains!1638 lt!118326 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234087 () Bool)

(declare-fun Unit!7229 () Unit!7226)

(assert (=> b!234087 (= e!152035 Unit!7229)))

(declare-fun bm!21756 () Bool)

(declare-fun call!21758 () ListLongMap!3495)

(assert (=> bm!21756 (= call!21756 call!21758)))

(declare-fun b!234088 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!234088 (= e!152036 (validKeyInArray!0 (select (arr!5500 (_keys!6414 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!234089 () Bool)

(assert (=> b!234089 (= e!152040 (not call!21760))))

(declare-fun bm!21757 () Bool)

(assert (=> bm!21757 (= call!21761 (+!639 (ite c!38978 call!21758 (ite c!38975 call!21756 call!21759)) (ite (or c!38978 c!38975) (tuple2!4593 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4193 thiss!1504)) (tuple2!4593 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4193 thiss!1504)))))))

(declare-fun bm!21758 () Bool)

(assert (=> bm!21758 (= call!21758 (getCurrentListMapNoExtraKeys!522 (_keys!6414 thiss!1504) (_values!4335 thiss!1504) (mask!10293 thiss!1504) (extraKeys!4089 thiss!1504) (zeroValue!4193 thiss!1504) (minValue!4193 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4352 thiss!1504)))))

(declare-fun b!234090 () Bool)

(declare-fun e!152043 () Bool)

(declare-fun get!2819 (ValueCell!2738 V!7865) V!7865)

(declare-fun dynLambda!540 (Int (_ BitVec 64)) V!7865)

(assert (=> b!234090 (= e!152043 (= (apply!206 lt!118326 (select (arr!5500 (_keys!6414 thiss!1504)) #b00000000000000000000000000000000)) (get!2819 (select (arr!5499 (_values!4335 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!540 (defaultEntry!4352 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!234090 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5835 (_values!4335 thiss!1504))))))

(assert (=> b!234090 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5836 (_keys!6414 thiss!1504))))))

(declare-fun b!234091 () Bool)

(declare-fun c!38974 () Bool)

(assert (=> b!234091 (= c!38974 (and (not (= (bvand (extraKeys!4089 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4089 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!234091 (= e!152038 e!152046)))

(declare-fun b!234092 () Bool)

(assert (=> b!234092 (= e!152044 (= (apply!206 lt!118326 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4193 thiss!1504)))))

(declare-fun b!234093 () Bool)

(assert (=> b!234093 (= e!152039 (validKeyInArray!0 (select (arr!5500 (_keys!6414 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!234094 () Bool)

(assert (=> b!234094 (= e!152047 (+!639 call!21761 (tuple2!4593 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4193 thiss!1504))))))

(declare-fun bm!21759 () Bool)

(assert (=> bm!21759 (= call!21760 (contains!1638 lt!118326 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234095 () Bool)

(assert (=> b!234095 (= e!152041 e!152043)))

(declare-fun res!114809 () Bool)

(assert (=> b!234095 (=> (not res!114809) (not e!152043))))

(assert (=> b!234095 (= res!114809 (contains!1638 lt!118326 (select (arr!5500 (_keys!6414 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!234095 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5836 (_keys!6414 thiss!1504))))))

(declare-fun b!234096 () Bool)

(assert (=> b!234096 (= e!152046 call!21762)))

(assert (= (and d!58923 c!38978) b!234094))

(assert (= (and d!58923 (not c!38978)) b!234082))

(assert (= (and b!234082 c!38975) b!234081))

(assert (= (and b!234082 (not c!38975)) b!234091))

(assert (= (and b!234091 c!38974) b!234096))

(assert (= (and b!234091 (not c!38974)) b!234086))

(assert (= (or b!234096 b!234086) bm!21754))

(assert (= (or b!234081 bm!21754) bm!21756))

(assert (= (or b!234081 b!234096) bm!21753))

(assert (= (or b!234094 bm!21756) bm!21758))

(assert (= (or b!234094 bm!21753) bm!21757))

(assert (= (and d!58923 res!114816) b!234088))

(assert (= (and d!58923 c!38976) b!234079))

(assert (= (and d!58923 (not c!38976)) b!234087))

(assert (= (and d!58923 res!114812) b!234084))

(assert (= (and b!234084 res!114811) b!234093))

(assert (= (and b!234084 (not res!114810)) b!234095))

(assert (= (and b!234095 res!114809) b!234090))

(assert (= (and b!234084 res!114813) b!234080))

(assert (= (and b!234080 c!38979) b!234085))

(assert (= (and b!234080 (not c!38979)) b!234089))

(assert (= (and b!234085 res!114815) b!234077))

(assert (= (or b!234085 b!234089) bm!21759))

(assert (= (and b!234080 res!114814) b!234076))

(assert (= (and b!234076 c!38977) b!234078))

(assert (= (and b!234076 (not c!38977)) b!234083))

(assert (= (and b!234078 res!114808) b!234092))

(assert (= (or b!234078 b!234083) bm!21755))

(declare-fun b_lambda!7853 () Bool)

(assert (=> (not b_lambda!7853) (not b!234090)))

(declare-fun t!8478 () Bool)

(declare-fun tb!2917 () Bool)

(assert (=> (and b!233939 (= (defaultEntry!4352 thiss!1504) (defaultEntry!4352 thiss!1504)) t!8478) tb!2917))

(declare-fun result!5089 () Bool)

(assert (=> tb!2917 (= result!5089 tp_is_empty!6163)))

(assert (=> b!234090 t!8478))

(declare-fun b_and!13193 () Bool)

(assert (= b_and!13187 (and (=> t!8478 result!5089) b_and!13193)))

(declare-fun m!254897 () Bool)

(assert (=> b!234077 m!254897))

(declare-fun m!254899 () Bool)

(assert (=> b!234090 m!254899))

(declare-fun m!254901 () Bool)

(assert (=> b!234090 m!254901))

(declare-fun m!254903 () Bool)

(assert (=> b!234090 m!254903))

(declare-fun m!254905 () Bool)

(assert (=> b!234090 m!254905))

(assert (=> b!234090 m!254899))

(assert (=> b!234090 m!254905))

(declare-fun m!254907 () Bool)

(assert (=> b!234090 m!254907))

(assert (=> b!234090 m!254901))

(assert (=> d!58923 m!254819))

(assert (=> b!234088 m!254901))

(assert (=> b!234088 m!254901))

(declare-fun m!254909 () Bool)

(assert (=> b!234088 m!254909))

(assert (=> b!234093 m!254901))

(assert (=> b!234093 m!254901))

(assert (=> b!234093 m!254909))

(declare-fun m!254911 () Bool)

(assert (=> b!234094 m!254911))

(declare-fun m!254913 () Bool)

(assert (=> bm!21758 m!254913))

(declare-fun m!254915 () Bool)

(assert (=> bm!21755 m!254915))

(declare-fun m!254917 () Bool)

(assert (=> bm!21759 m!254917))

(assert (=> b!234079 m!254901))

(declare-fun m!254919 () Bool)

(assert (=> b!234079 m!254919))

(declare-fun m!254921 () Bool)

(assert (=> b!234079 m!254921))

(declare-fun m!254923 () Bool)

(assert (=> b!234079 m!254923))

(declare-fun m!254925 () Bool)

(assert (=> b!234079 m!254925))

(declare-fun m!254927 () Bool)

(assert (=> b!234079 m!254927))

(assert (=> b!234079 m!254923))

(declare-fun m!254929 () Bool)

(assert (=> b!234079 m!254929))

(declare-fun m!254931 () Bool)

(assert (=> b!234079 m!254931))

(declare-fun m!254933 () Bool)

(assert (=> b!234079 m!254933))

(assert (=> b!234079 m!254929))

(declare-fun m!254935 () Bool)

(assert (=> b!234079 m!254935))

(declare-fun m!254937 () Bool)

(assert (=> b!234079 m!254937))

(declare-fun m!254939 () Bool)

(assert (=> b!234079 m!254939))

(assert (=> b!234079 m!254927))

(declare-fun m!254941 () Bool)

(assert (=> b!234079 m!254941))

(assert (=> b!234079 m!254935))

(declare-fun m!254943 () Bool)

(assert (=> b!234079 m!254943))

(assert (=> b!234079 m!254913))

(declare-fun m!254945 () Bool)

(assert (=> b!234079 m!254945))

(declare-fun m!254947 () Bool)

(assert (=> b!234079 m!254947))

(assert (=> b!234095 m!254901))

(assert (=> b!234095 m!254901))

(declare-fun m!254949 () Bool)

(assert (=> b!234095 m!254949))

(declare-fun m!254951 () Bool)

(assert (=> b!234092 m!254951))

(declare-fun m!254953 () Bool)

(assert (=> bm!21757 m!254953))

(assert (=> b!233941 d!58923))

(declare-fun b!234106 () Bool)

(declare-fun e!152053 () Bool)

(assert (=> b!234106 (= e!152053 tp_is_empty!6163)))

(declare-fun mapNonEmpty!10434 () Bool)

(declare-fun mapRes!10434 () Bool)

(declare-fun tp!22071 () Bool)

(declare-fun e!152052 () Bool)

(assert (=> mapNonEmpty!10434 (= mapRes!10434 (and tp!22071 e!152052))))

(declare-fun mapValue!10434 () ValueCell!2738)

(declare-fun mapKey!10434 () (_ BitVec 32))

(declare-fun mapRest!10434 () (Array (_ BitVec 32) ValueCell!2738))

(assert (=> mapNonEmpty!10434 (= mapRest!10425 (store mapRest!10434 mapKey!10434 mapValue!10434))))

(declare-fun b!234105 () Bool)

(assert (=> b!234105 (= e!152052 tp_is_empty!6163)))

(declare-fun mapIsEmpty!10434 () Bool)

(assert (=> mapIsEmpty!10434 mapRes!10434))

(declare-fun condMapEmpty!10434 () Bool)

(declare-fun mapDefault!10434 () ValueCell!2738)

(assert (=> mapNonEmpty!10425 (= condMapEmpty!10434 (= mapRest!10425 ((as const (Array (_ BitVec 32) ValueCell!2738)) mapDefault!10434)))))

(assert (=> mapNonEmpty!10425 (= tp!22055 (and e!152053 mapRes!10434))))

(assert (= (and mapNonEmpty!10425 condMapEmpty!10434) mapIsEmpty!10434))

(assert (= (and mapNonEmpty!10425 (not condMapEmpty!10434)) mapNonEmpty!10434))

(assert (= (and mapNonEmpty!10434 ((_ is ValueCellFull!2738) mapValue!10434)) b!234105))

(assert (= (and mapNonEmpty!10425 ((_ is ValueCellFull!2738) mapDefault!10434)) b!234106))

(declare-fun m!254955 () Bool)

(assert (=> mapNonEmpty!10434 m!254955))

(declare-fun b_lambda!7855 () Bool)

(assert (= b_lambda!7853 (or (and b!233939 b_free!6301) b_lambda!7855)))

(check-sat (not b!234094) (not b!234005) (not bm!21758) (not b!234033) (not b!234092) (not b!234093) (not d!58921) (not d!58917) tp_is_empty!6163 (not b!234031) (not b!234095) (not b!234079) (not bm!21759) (not b!234090) (not b!234024) (not mapNonEmpty!10434) (not d!58919) (not b!234006) (not b!234088) (not bm!21755) (not b_next!6301) b_and!13193 (not b!234077) (not b!234004) (not d!58923) (not b_lambda!7855) (not bm!21757))
(check-sat b_and!13193 (not b_next!6301))

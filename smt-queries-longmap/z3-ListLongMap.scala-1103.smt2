; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22698 () Bool)

(assert start!22698)

(declare-fun b!236910 () Bool)

(declare-fun b_free!6369 () Bool)

(declare-fun b_next!6369 () Bool)

(assert (=> b!236910 (= b_free!6369 (not b_next!6369))))

(declare-fun tp!22291 () Bool)

(declare-fun b_and!13315 () Bool)

(assert (=> b!236910 (= tp!22291 b_and!13315)))

(declare-fun b!236903 () Bool)

(declare-fun e!153852 () Bool)

(declare-fun e!153854 () Bool)

(assert (=> b!236903 (= e!153852 e!153854)))

(declare-fun res!116143 () Bool)

(assert (=> b!236903 (=> (not res!116143) (not e!153854))))

(declare-datatypes ((SeekEntryResult!1005 0))(
  ( (MissingZero!1005 (index!6190 (_ BitVec 32))) (Found!1005 (index!6191 (_ BitVec 32))) (Intermediate!1005 (undefined!1817 Bool) (index!6192 (_ BitVec 32)) (x!23913 (_ BitVec 32))) (Undefined!1005) (MissingVacant!1005 (index!6193 (_ BitVec 32))) )
))
(declare-fun lt!119786 () SeekEntryResult!1005)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!236903 (= res!116143 (or (= lt!119786 (MissingZero!1005 index!297)) (= lt!119786 (MissingVacant!1005 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7955 0))(
  ( (V!7956 (val!3160 Int)) )
))
(declare-datatypes ((ValueCell!2772 0))(
  ( (ValueCellFull!2772 (v!5192 V!7955)) (EmptyCell!2772) )
))
(declare-datatypes ((array!11729 0))(
  ( (array!11730 (arr!5572 (Array (_ BitVec 32) ValueCell!2772)) (size!5911 (_ BitVec 32))) )
))
(declare-datatypes ((array!11731 0))(
  ( (array!11732 (arr!5573 (Array (_ BitVec 32) (_ BitVec 64))) (size!5912 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3444 0))(
  ( (LongMapFixedSize!3445 (defaultEntry!4399 Int) (mask!10400 (_ BitVec 32)) (extraKeys!4136 (_ BitVec 32)) (zeroValue!4240 V!7955) (minValue!4240 V!7955) (_size!1771 (_ BitVec 32)) (_keys!6486 array!11731) (_values!4382 array!11729) (_vacant!1771 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3444)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11731 (_ BitVec 32)) SeekEntryResult!1005)

(assert (=> b!236903 (= lt!119786 (seekEntryOrOpen!0 key!932 (_keys!6486 thiss!1504) (mask!10400 thiss!1504)))))

(declare-fun b!236904 () Bool)

(declare-fun e!153849 () Bool)

(declare-fun tp_is_empty!6231 () Bool)

(assert (=> b!236904 (= e!153849 tp_is_empty!6231)))

(declare-fun mapIsEmpty!10558 () Bool)

(declare-fun mapRes!10558 () Bool)

(assert (=> mapIsEmpty!10558 mapRes!10558))

(declare-fun b!236905 () Bool)

(assert (=> b!236905 (= e!153854 (and (= (size!5911 (_values!4382 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10400 thiss!1504))) (= (size!5912 (_keys!6486 thiss!1504)) (size!5911 (_values!4382 thiss!1504))) (bvslt (mask!10400 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!236906 () Bool)

(declare-fun res!116140 () Bool)

(assert (=> b!236906 (=> (not res!116140) (not e!153854))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!236906 (= res!116140 (validMask!0 (mask!10400 thiss!1504)))))

(declare-fun b!236907 () Bool)

(declare-fun res!116142 () Bool)

(assert (=> b!236907 (=> (not res!116142) (not e!153854))))

(declare-datatypes ((tuple2!4656 0))(
  ( (tuple2!4657 (_1!2339 (_ BitVec 64)) (_2!2339 V!7955)) )
))
(declare-datatypes ((List!3559 0))(
  ( (Nil!3556) (Cons!3555 (h!4209 tuple2!4656) (t!8542 List!3559)) )
))
(declare-datatypes ((ListLongMap!3569 0))(
  ( (ListLongMap!3570 (toList!1800 List!3559)) )
))
(declare-fun contains!1682 (ListLongMap!3569 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1328 (array!11731 array!11729 (_ BitVec 32) (_ BitVec 32) V!7955 V!7955 (_ BitVec 32) Int) ListLongMap!3569)

(assert (=> b!236907 (= res!116142 (not (contains!1682 (getCurrentListMap!1328 (_keys!6486 thiss!1504) (_values!4382 thiss!1504) (mask!10400 thiss!1504) (extraKeys!4136 thiss!1504) (zeroValue!4240 thiss!1504) (minValue!4240 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4399 thiss!1504)) key!932)))))

(declare-fun b!236908 () Bool)

(declare-fun e!153851 () Bool)

(assert (=> b!236908 (= e!153851 tp_is_empty!6231)))

(declare-fun res!116141 () Bool)

(assert (=> start!22698 (=> (not res!116141) (not e!153852))))

(declare-fun valid!1358 (LongMapFixedSize!3444) Bool)

(assert (=> start!22698 (= res!116141 (valid!1358 thiss!1504))))

(assert (=> start!22698 e!153852))

(declare-fun e!153853 () Bool)

(assert (=> start!22698 e!153853))

(assert (=> start!22698 true))

(declare-fun b!236909 () Bool)

(declare-fun e!153848 () Bool)

(assert (=> b!236909 (= e!153848 (and e!153849 mapRes!10558))))

(declare-fun condMapEmpty!10558 () Bool)

(declare-fun mapDefault!10558 () ValueCell!2772)

(assert (=> b!236909 (= condMapEmpty!10558 (= (arr!5572 (_values!4382 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2772)) mapDefault!10558)))))

(declare-fun mapNonEmpty!10558 () Bool)

(declare-fun tp!22290 () Bool)

(assert (=> mapNonEmpty!10558 (= mapRes!10558 (and tp!22290 e!153851))))

(declare-fun mapRest!10558 () (Array (_ BitVec 32) ValueCell!2772))

(declare-fun mapValue!10558 () ValueCell!2772)

(declare-fun mapKey!10558 () (_ BitVec 32))

(assert (=> mapNonEmpty!10558 (= (arr!5572 (_values!4382 thiss!1504)) (store mapRest!10558 mapKey!10558 mapValue!10558))))

(declare-fun array_inv!3677 (array!11731) Bool)

(declare-fun array_inv!3678 (array!11729) Bool)

(assert (=> b!236910 (= e!153853 (and tp!22291 tp_is_empty!6231 (array_inv!3677 (_keys!6486 thiss!1504)) (array_inv!3678 (_values!4382 thiss!1504)) e!153848))))

(declare-fun b!236911 () Bool)

(declare-fun res!116139 () Bool)

(assert (=> b!236911 (=> (not res!116139) (not e!153852))))

(assert (=> b!236911 (= res!116139 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!22698 res!116141) b!236911))

(assert (= (and b!236911 res!116139) b!236903))

(assert (= (and b!236903 res!116143) b!236907))

(assert (= (and b!236907 res!116142) b!236906))

(assert (= (and b!236906 res!116140) b!236905))

(assert (= (and b!236909 condMapEmpty!10558) mapIsEmpty!10558))

(assert (= (and b!236909 (not condMapEmpty!10558)) mapNonEmpty!10558))

(get-info :version)

(assert (= (and mapNonEmpty!10558 ((_ is ValueCellFull!2772) mapValue!10558)) b!236908))

(assert (= (and b!236909 ((_ is ValueCellFull!2772) mapDefault!10558)) b!236904))

(assert (= b!236910 b!236909))

(assert (= start!22698 b!236910))

(declare-fun m!257743 () Bool)

(assert (=> start!22698 m!257743))

(declare-fun m!257745 () Bool)

(assert (=> b!236906 m!257745))

(declare-fun m!257747 () Bool)

(assert (=> b!236907 m!257747))

(assert (=> b!236907 m!257747))

(declare-fun m!257749 () Bool)

(assert (=> b!236907 m!257749))

(declare-fun m!257751 () Bool)

(assert (=> b!236903 m!257751))

(declare-fun m!257753 () Bool)

(assert (=> mapNonEmpty!10558 m!257753))

(declare-fun m!257755 () Bool)

(assert (=> b!236910 m!257755))

(declare-fun m!257757 () Bool)

(assert (=> b!236910 m!257757))

(check-sat (not start!22698) b_and!13315 (not mapNonEmpty!10558) (not b!236906) (not b!236910) (not b!236903) tp_is_empty!6231 (not b!236907) (not b_next!6369))
(check-sat b_and!13315 (not b_next!6369))
(get-model)

(declare-fun d!59515 () Bool)

(assert (=> d!59515 (= (validMask!0 (mask!10400 thiss!1504)) (and (or (= (mask!10400 thiss!1504) #b00000000000000000000000000000111) (= (mask!10400 thiss!1504) #b00000000000000000000000000001111) (= (mask!10400 thiss!1504) #b00000000000000000000000000011111) (= (mask!10400 thiss!1504) #b00000000000000000000000000111111) (= (mask!10400 thiss!1504) #b00000000000000000000000001111111) (= (mask!10400 thiss!1504) #b00000000000000000000000011111111) (= (mask!10400 thiss!1504) #b00000000000000000000000111111111) (= (mask!10400 thiss!1504) #b00000000000000000000001111111111) (= (mask!10400 thiss!1504) #b00000000000000000000011111111111) (= (mask!10400 thiss!1504) #b00000000000000000000111111111111) (= (mask!10400 thiss!1504) #b00000000000000000001111111111111) (= (mask!10400 thiss!1504) #b00000000000000000011111111111111) (= (mask!10400 thiss!1504) #b00000000000000000111111111111111) (= (mask!10400 thiss!1504) #b00000000000000001111111111111111) (= (mask!10400 thiss!1504) #b00000000000000011111111111111111) (= (mask!10400 thiss!1504) #b00000000000000111111111111111111) (= (mask!10400 thiss!1504) #b00000000000001111111111111111111) (= (mask!10400 thiss!1504) #b00000000000011111111111111111111) (= (mask!10400 thiss!1504) #b00000000000111111111111111111111) (= (mask!10400 thiss!1504) #b00000000001111111111111111111111) (= (mask!10400 thiss!1504) #b00000000011111111111111111111111) (= (mask!10400 thiss!1504) #b00000000111111111111111111111111) (= (mask!10400 thiss!1504) #b00000001111111111111111111111111) (= (mask!10400 thiss!1504) #b00000011111111111111111111111111) (= (mask!10400 thiss!1504) #b00000111111111111111111111111111) (= (mask!10400 thiss!1504) #b00001111111111111111111111111111) (= (mask!10400 thiss!1504) #b00011111111111111111111111111111) (= (mask!10400 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10400 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!236906 d!59515))

(declare-fun d!59517 () Bool)

(assert (=> d!59517 (= (array_inv!3677 (_keys!6486 thiss!1504)) (bvsge (size!5912 (_keys!6486 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!236910 d!59517))

(declare-fun d!59519 () Bool)

(assert (=> d!59519 (= (array_inv!3678 (_values!4382 thiss!1504)) (bvsge (size!5911 (_values!4382 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!236910 d!59519))

(declare-fun b!236951 () Bool)

(declare-fun e!153882 () SeekEntryResult!1005)

(declare-fun lt!119798 () SeekEntryResult!1005)

(assert (=> b!236951 (= e!153882 (MissingZero!1005 (index!6192 lt!119798)))))

(declare-fun d!59521 () Bool)

(declare-fun lt!119796 () SeekEntryResult!1005)

(assert (=> d!59521 (and (or ((_ is Undefined!1005) lt!119796) (not ((_ is Found!1005) lt!119796)) (and (bvsge (index!6191 lt!119796) #b00000000000000000000000000000000) (bvslt (index!6191 lt!119796) (size!5912 (_keys!6486 thiss!1504))))) (or ((_ is Undefined!1005) lt!119796) ((_ is Found!1005) lt!119796) (not ((_ is MissingZero!1005) lt!119796)) (and (bvsge (index!6190 lt!119796) #b00000000000000000000000000000000) (bvslt (index!6190 lt!119796) (size!5912 (_keys!6486 thiss!1504))))) (or ((_ is Undefined!1005) lt!119796) ((_ is Found!1005) lt!119796) ((_ is MissingZero!1005) lt!119796) (not ((_ is MissingVacant!1005) lt!119796)) (and (bvsge (index!6193 lt!119796) #b00000000000000000000000000000000) (bvslt (index!6193 lt!119796) (size!5912 (_keys!6486 thiss!1504))))) (or ((_ is Undefined!1005) lt!119796) (ite ((_ is Found!1005) lt!119796) (= (select (arr!5573 (_keys!6486 thiss!1504)) (index!6191 lt!119796)) key!932) (ite ((_ is MissingZero!1005) lt!119796) (= (select (arr!5573 (_keys!6486 thiss!1504)) (index!6190 lt!119796)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1005) lt!119796) (= (select (arr!5573 (_keys!6486 thiss!1504)) (index!6193 lt!119796)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!153883 () SeekEntryResult!1005)

(assert (=> d!59521 (= lt!119796 e!153883)))

(declare-fun c!39489 () Bool)

(assert (=> d!59521 (= c!39489 (and ((_ is Intermediate!1005) lt!119798) (undefined!1817 lt!119798)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11731 (_ BitVec 32)) SeekEntryResult!1005)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59521 (= lt!119798 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10400 thiss!1504)) key!932 (_keys!6486 thiss!1504) (mask!10400 thiss!1504)))))

(assert (=> d!59521 (validMask!0 (mask!10400 thiss!1504))))

(assert (=> d!59521 (= (seekEntryOrOpen!0 key!932 (_keys!6486 thiss!1504) (mask!10400 thiss!1504)) lt!119796)))

(declare-fun b!236952 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11731 (_ BitVec 32)) SeekEntryResult!1005)

(assert (=> b!236952 (= e!153882 (seekKeyOrZeroReturnVacant!0 (x!23913 lt!119798) (index!6192 lt!119798) (index!6192 lt!119798) key!932 (_keys!6486 thiss!1504) (mask!10400 thiss!1504)))))

(declare-fun b!236953 () Bool)

(declare-fun e!153884 () SeekEntryResult!1005)

(assert (=> b!236953 (= e!153883 e!153884)))

(declare-fun lt!119797 () (_ BitVec 64))

(assert (=> b!236953 (= lt!119797 (select (arr!5573 (_keys!6486 thiss!1504)) (index!6192 lt!119798)))))

(declare-fun c!39487 () Bool)

(assert (=> b!236953 (= c!39487 (= lt!119797 key!932))))

(declare-fun b!236954 () Bool)

(assert (=> b!236954 (= e!153884 (Found!1005 (index!6192 lt!119798)))))

(declare-fun b!236955 () Bool)

(declare-fun c!39488 () Bool)

(assert (=> b!236955 (= c!39488 (= lt!119797 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!236955 (= e!153884 e!153882)))

(declare-fun b!236956 () Bool)

(assert (=> b!236956 (= e!153883 Undefined!1005)))

(assert (= (and d!59521 c!39489) b!236956))

(assert (= (and d!59521 (not c!39489)) b!236953))

(assert (= (and b!236953 c!39487) b!236954))

(assert (= (and b!236953 (not c!39487)) b!236955))

(assert (= (and b!236955 c!39488) b!236951))

(assert (= (and b!236955 (not c!39488)) b!236952))

(declare-fun m!257775 () Bool)

(assert (=> d!59521 m!257775))

(declare-fun m!257777 () Bool)

(assert (=> d!59521 m!257777))

(declare-fun m!257779 () Bool)

(assert (=> d!59521 m!257779))

(declare-fun m!257781 () Bool)

(assert (=> d!59521 m!257781))

(declare-fun m!257783 () Bool)

(assert (=> d!59521 m!257783))

(assert (=> d!59521 m!257745))

(assert (=> d!59521 m!257779))

(declare-fun m!257785 () Bool)

(assert (=> b!236952 m!257785))

(declare-fun m!257787 () Bool)

(assert (=> b!236953 m!257787))

(assert (=> b!236903 d!59521))

(declare-fun d!59523 () Bool)

(declare-fun e!153890 () Bool)

(assert (=> d!59523 e!153890))

(declare-fun res!116161 () Bool)

(assert (=> d!59523 (=> res!116161 e!153890)))

(declare-fun lt!119809 () Bool)

(assert (=> d!59523 (= res!116161 (not lt!119809))))

(declare-fun lt!119808 () Bool)

(assert (=> d!59523 (= lt!119809 lt!119808)))

(declare-datatypes ((Unit!7288 0))(
  ( (Unit!7289) )
))
(declare-fun lt!119807 () Unit!7288)

(declare-fun e!153889 () Unit!7288)

(assert (=> d!59523 (= lt!119807 e!153889)))

(declare-fun c!39492 () Bool)

(assert (=> d!59523 (= c!39492 lt!119808)))

(declare-fun containsKey!265 (List!3559 (_ BitVec 64)) Bool)

(assert (=> d!59523 (= lt!119808 (containsKey!265 (toList!1800 (getCurrentListMap!1328 (_keys!6486 thiss!1504) (_values!4382 thiss!1504) (mask!10400 thiss!1504) (extraKeys!4136 thiss!1504) (zeroValue!4240 thiss!1504) (minValue!4240 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4399 thiss!1504))) key!932))))

(assert (=> d!59523 (= (contains!1682 (getCurrentListMap!1328 (_keys!6486 thiss!1504) (_values!4382 thiss!1504) (mask!10400 thiss!1504) (extraKeys!4136 thiss!1504) (zeroValue!4240 thiss!1504) (minValue!4240 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4399 thiss!1504)) key!932) lt!119809)))

(declare-fun b!236963 () Bool)

(declare-fun lt!119810 () Unit!7288)

(assert (=> b!236963 (= e!153889 lt!119810)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!213 (List!3559 (_ BitVec 64)) Unit!7288)

(assert (=> b!236963 (= lt!119810 (lemmaContainsKeyImpliesGetValueByKeyDefined!213 (toList!1800 (getCurrentListMap!1328 (_keys!6486 thiss!1504) (_values!4382 thiss!1504) (mask!10400 thiss!1504) (extraKeys!4136 thiss!1504) (zeroValue!4240 thiss!1504) (minValue!4240 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4399 thiss!1504))) key!932))))

(declare-datatypes ((Option!279 0))(
  ( (Some!278 (v!5194 V!7955)) (None!277) )
))
(declare-fun isDefined!214 (Option!279) Bool)

(declare-fun getValueByKey!273 (List!3559 (_ BitVec 64)) Option!279)

(assert (=> b!236963 (isDefined!214 (getValueByKey!273 (toList!1800 (getCurrentListMap!1328 (_keys!6486 thiss!1504) (_values!4382 thiss!1504) (mask!10400 thiss!1504) (extraKeys!4136 thiss!1504) (zeroValue!4240 thiss!1504) (minValue!4240 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4399 thiss!1504))) key!932))))

(declare-fun b!236964 () Bool)

(declare-fun Unit!7290 () Unit!7288)

(assert (=> b!236964 (= e!153889 Unit!7290)))

(declare-fun b!236965 () Bool)

(assert (=> b!236965 (= e!153890 (isDefined!214 (getValueByKey!273 (toList!1800 (getCurrentListMap!1328 (_keys!6486 thiss!1504) (_values!4382 thiss!1504) (mask!10400 thiss!1504) (extraKeys!4136 thiss!1504) (zeroValue!4240 thiss!1504) (minValue!4240 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4399 thiss!1504))) key!932)))))

(assert (= (and d!59523 c!39492) b!236963))

(assert (= (and d!59523 (not c!39492)) b!236964))

(assert (= (and d!59523 (not res!116161)) b!236965))

(declare-fun m!257789 () Bool)

(assert (=> d!59523 m!257789))

(declare-fun m!257791 () Bool)

(assert (=> b!236963 m!257791))

(declare-fun m!257793 () Bool)

(assert (=> b!236963 m!257793))

(assert (=> b!236963 m!257793))

(declare-fun m!257795 () Bool)

(assert (=> b!236963 m!257795))

(assert (=> b!236965 m!257793))

(assert (=> b!236965 m!257793))

(assert (=> b!236965 m!257795))

(assert (=> b!236907 d!59523))

(declare-fun b!237008 () Bool)

(declare-fun e!153925 () Bool)

(declare-fun e!153927 () Bool)

(assert (=> b!237008 (= e!153925 e!153927)))

(declare-fun res!116186 () Bool)

(declare-fun call!22038 () Bool)

(assert (=> b!237008 (= res!116186 call!22038)))

(assert (=> b!237008 (=> (not res!116186) (not e!153927))))

(declare-fun b!237009 () Bool)

(declare-fun res!116182 () Bool)

(declare-fun e!153928 () Bool)

(assert (=> b!237009 (=> (not res!116182) (not e!153928))))

(declare-fun e!153924 () Bool)

(assert (=> b!237009 (= res!116182 e!153924)))

(declare-fun res!116187 () Bool)

(assert (=> b!237009 (=> res!116187 e!153924)))

(declare-fun e!153920 () Bool)

(assert (=> b!237009 (= res!116187 (not e!153920))))

(declare-fun res!116188 () Bool)

(assert (=> b!237009 (=> (not res!116188) (not e!153920))))

(assert (=> b!237009 (= res!116188 (bvslt #b00000000000000000000000000000000 (size!5912 (_keys!6486 thiss!1504))))))

(declare-fun b!237010 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!237010 (= e!153920 (validKeyInArray!0 (select (arr!5573 (_keys!6486 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!237011 () Bool)

(declare-fun e!153918 () Unit!7288)

(declare-fun Unit!7291 () Unit!7288)

(assert (=> b!237011 (= e!153918 Unit!7291)))

(declare-fun b!237012 () Bool)

(assert (=> b!237012 (= e!153928 e!153925)))

(declare-fun c!39506 () Bool)

(assert (=> b!237012 (= c!39506 (not (= (bvand (extraKeys!4136 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!22029 () Bool)

(declare-fun call!22035 () ListLongMap!3569)

(declare-fun call!22033 () ListLongMap!3569)

(assert (=> bm!22029 (= call!22035 call!22033)))

(declare-fun b!237013 () Bool)

(declare-fun e!153921 () Bool)

(declare-fun e!153922 () Bool)

(assert (=> b!237013 (= e!153921 e!153922)))

(declare-fun res!116183 () Bool)

(declare-fun call!22032 () Bool)

(assert (=> b!237013 (= res!116183 call!22032)))

(assert (=> b!237013 (=> (not res!116183) (not e!153922))))

(declare-fun bm!22030 () Bool)

(declare-fun lt!119873 () ListLongMap!3569)

(assert (=> bm!22030 (= call!22032 (contains!1682 lt!119873 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237014 () Bool)

(declare-fun lt!119869 () Unit!7288)

(assert (=> b!237014 (= e!153918 lt!119869)))

(declare-fun lt!119855 () ListLongMap!3569)

(declare-fun getCurrentListMapNoExtraKeys!537 (array!11731 array!11729 (_ BitVec 32) (_ BitVec 32) V!7955 V!7955 (_ BitVec 32) Int) ListLongMap!3569)

(assert (=> b!237014 (= lt!119855 (getCurrentListMapNoExtraKeys!537 (_keys!6486 thiss!1504) (_values!4382 thiss!1504) (mask!10400 thiss!1504) (extraKeys!4136 thiss!1504) (zeroValue!4240 thiss!1504) (minValue!4240 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4399 thiss!1504)))))

(declare-fun lt!119864 () (_ BitVec 64))

(assert (=> b!237014 (= lt!119864 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119872 () (_ BitVec 64))

(assert (=> b!237014 (= lt!119872 (select (arr!5573 (_keys!6486 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119874 () Unit!7288)

(declare-fun addStillContains!191 (ListLongMap!3569 (_ BitVec 64) V!7955 (_ BitVec 64)) Unit!7288)

(assert (=> b!237014 (= lt!119874 (addStillContains!191 lt!119855 lt!119864 (zeroValue!4240 thiss!1504) lt!119872))))

(declare-fun +!642 (ListLongMap!3569 tuple2!4656) ListLongMap!3569)

(assert (=> b!237014 (contains!1682 (+!642 lt!119855 (tuple2!4657 lt!119864 (zeroValue!4240 thiss!1504))) lt!119872)))

(declare-fun lt!119859 () Unit!7288)

(assert (=> b!237014 (= lt!119859 lt!119874)))

(declare-fun lt!119856 () ListLongMap!3569)

(assert (=> b!237014 (= lt!119856 (getCurrentListMapNoExtraKeys!537 (_keys!6486 thiss!1504) (_values!4382 thiss!1504) (mask!10400 thiss!1504) (extraKeys!4136 thiss!1504) (zeroValue!4240 thiss!1504) (minValue!4240 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4399 thiss!1504)))))

(declare-fun lt!119868 () (_ BitVec 64))

(assert (=> b!237014 (= lt!119868 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119865 () (_ BitVec 64))

(assert (=> b!237014 (= lt!119865 (select (arr!5573 (_keys!6486 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119860 () Unit!7288)

(declare-fun addApplyDifferent!191 (ListLongMap!3569 (_ BitVec 64) V!7955 (_ BitVec 64)) Unit!7288)

(assert (=> b!237014 (= lt!119860 (addApplyDifferent!191 lt!119856 lt!119868 (minValue!4240 thiss!1504) lt!119865))))

(declare-fun apply!215 (ListLongMap!3569 (_ BitVec 64)) V!7955)

(assert (=> b!237014 (= (apply!215 (+!642 lt!119856 (tuple2!4657 lt!119868 (minValue!4240 thiss!1504))) lt!119865) (apply!215 lt!119856 lt!119865))))

(declare-fun lt!119867 () Unit!7288)

(assert (=> b!237014 (= lt!119867 lt!119860)))

(declare-fun lt!119858 () ListLongMap!3569)

(assert (=> b!237014 (= lt!119858 (getCurrentListMapNoExtraKeys!537 (_keys!6486 thiss!1504) (_values!4382 thiss!1504) (mask!10400 thiss!1504) (extraKeys!4136 thiss!1504) (zeroValue!4240 thiss!1504) (minValue!4240 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4399 thiss!1504)))))

(declare-fun lt!119871 () (_ BitVec 64))

(assert (=> b!237014 (= lt!119871 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119870 () (_ BitVec 64))

(assert (=> b!237014 (= lt!119870 (select (arr!5573 (_keys!6486 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119862 () Unit!7288)

(assert (=> b!237014 (= lt!119862 (addApplyDifferent!191 lt!119858 lt!119871 (zeroValue!4240 thiss!1504) lt!119870))))

(assert (=> b!237014 (= (apply!215 (+!642 lt!119858 (tuple2!4657 lt!119871 (zeroValue!4240 thiss!1504))) lt!119870) (apply!215 lt!119858 lt!119870))))

(declare-fun lt!119863 () Unit!7288)

(assert (=> b!237014 (= lt!119863 lt!119862)))

(declare-fun lt!119876 () ListLongMap!3569)

(assert (=> b!237014 (= lt!119876 (getCurrentListMapNoExtraKeys!537 (_keys!6486 thiss!1504) (_values!4382 thiss!1504) (mask!10400 thiss!1504) (extraKeys!4136 thiss!1504) (zeroValue!4240 thiss!1504) (minValue!4240 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4399 thiss!1504)))))

(declare-fun lt!119875 () (_ BitVec 64))

(assert (=> b!237014 (= lt!119875 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119857 () (_ BitVec 64))

(assert (=> b!237014 (= lt!119857 (select (arr!5573 (_keys!6486 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!237014 (= lt!119869 (addApplyDifferent!191 lt!119876 lt!119875 (minValue!4240 thiss!1504) lt!119857))))

(assert (=> b!237014 (= (apply!215 (+!642 lt!119876 (tuple2!4657 lt!119875 (minValue!4240 thiss!1504))) lt!119857) (apply!215 lt!119876 lt!119857))))

(declare-fun d!59525 () Bool)

(assert (=> d!59525 e!153928))

(declare-fun res!116185 () Bool)

(assert (=> d!59525 (=> (not res!116185) (not e!153928))))

(assert (=> d!59525 (= res!116185 (or (bvsge #b00000000000000000000000000000000 (size!5912 (_keys!6486 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5912 (_keys!6486 thiss!1504))))))))

(declare-fun lt!119861 () ListLongMap!3569)

(assert (=> d!59525 (= lt!119873 lt!119861)))

(declare-fun lt!119866 () Unit!7288)

(assert (=> d!59525 (= lt!119866 e!153918)))

(declare-fun c!39508 () Bool)

(declare-fun e!153929 () Bool)

(assert (=> d!59525 (= c!39508 e!153929)))

(declare-fun res!116181 () Bool)

(assert (=> d!59525 (=> (not res!116181) (not e!153929))))

(assert (=> d!59525 (= res!116181 (bvslt #b00000000000000000000000000000000 (size!5912 (_keys!6486 thiss!1504))))))

(declare-fun e!153923 () ListLongMap!3569)

(assert (=> d!59525 (= lt!119861 e!153923)))

(declare-fun c!39505 () Bool)

(assert (=> d!59525 (= c!39505 (and (not (= (bvand (extraKeys!4136 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4136 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59525 (validMask!0 (mask!10400 thiss!1504))))

(assert (=> d!59525 (= (getCurrentListMap!1328 (_keys!6486 thiss!1504) (_values!4382 thiss!1504) (mask!10400 thiss!1504) (extraKeys!4136 thiss!1504) (zeroValue!4240 thiss!1504) (minValue!4240 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4399 thiss!1504)) lt!119873)))

(declare-fun bm!22031 () Bool)

(declare-fun call!22034 () ListLongMap!3569)

(assert (=> bm!22031 (= call!22034 (getCurrentListMapNoExtraKeys!537 (_keys!6486 thiss!1504) (_values!4382 thiss!1504) (mask!10400 thiss!1504) (extraKeys!4136 thiss!1504) (zeroValue!4240 thiss!1504) (minValue!4240 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4399 thiss!1504)))))

(declare-fun b!237015 () Bool)

(declare-fun c!39510 () Bool)

(assert (=> b!237015 (= c!39510 (and (not (= (bvand (extraKeys!4136 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4136 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!153926 () ListLongMap!3569)

(declare-fun e!153917 () ListLongMap!3569)

(assert (=> b!237015 (= e!153926 e!153917)))

(declare-fun b!237016 () Bool)

(assert (=> b!237016 (= e!153921 (not call!22032))))

(declare-fun b!237017 () Bool)

(assert (=> b!237017 (= e!153917 call!22035)))

(declare-fun b!237018 () Bool)

(assert (=> b!237018 (= e!153925 (not call!22038))))

(declare-fun b!237019 () Bool)

(assert (=> b!237019 (= e!153926 call!22035)))

(declare-fun b!237020 () Bool)

(assert (=> b!237020 (= e!153929 (validKeyInArray!0 (select (arr!5573 (_keys!6486 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!237021 () Bool)

(declare-fun call!22037 () ListLongMap!3569)

(assert (=> b!237021 (= e!153917 call!22037)))

(declare-fun bm!22032 () Bool)

(declare-fun call!22036 () ListLongMap!3569)

(assert (=> bm!22032 (= call!22036 call!22034)))

(declare-fun b!237022 () Bool)

(assert (=> b!237022 (= e!153927 (= (apply!215 lt!119873 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4240 thiss!1504)))))

(declare-fun bm!22033 () Bool)

(assert (=> bm!22033 (= call!22037 call!22036)))

(declare-fun b!237023 () Bool)

(assert (=> b!237023 (= e!153923 (+!642 call!22033 (tuple2!4657 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4240 thiss!1504))))))

(declare-fun b!237024 () Bool)

(assert (=> b!237024 (= e!153922 (= (apply!215 lt!119873 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4240 thiss!1504)))))

(declare-fun b!237025 () Bool)

(declare-fun e!153919 () Bool)

(declare-fun get!2868 (ValueCell!2772 V!7955) V!7955)

(declare-fun dynLambda!558 (Int (_ BitVec 64)) V!7955)

(assert (=> b!237025 (= e!153919 (= (apply!215 lt!119873 (select (arr!5573 (_keys!6486 thiss!1504)) #b00000000000000000000000000000000)) (get!2868 (select (arr!5572 (_values!4382 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!558 (defaultEntry!4399 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!237025 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5911 (_values!4382 thiss!1504))))))

(assert (=> b!237025 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5912 (_keys!6486 thiss!1504))))))

(declare-fun c!39507 () Bool)

(declare-fun bm!22034 () Bool)

(assert (=> bm!22034 (= call!22033 (+!642 (ite c!39505 call!22034 (ite c!39507 call!22036 call!22037)) (ite (or c!39505 c!39507) (tuple2!4657 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4240 thiss!1504)) (tuple2!4657 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4240 thiss!1504)))))))

(declare-fun b!237026 () Bool)

(assert (=> b!237026 (= e!153924 e!153919)))

(declare-fun res!116184 () Bool)

(assert (=> b!237026 (=> (not res!116184) (not e!153919))))

(assert (=> b!237026 (= res!116184 (contains!1682 lt!119873 (select (arr!5573 (_keys!6486 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!237026 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5912 (_keys!6486 thiss!1504))))))

(declare-fun bm!22035 () Bool)

(assert (=> bm!22035 (= call!22038 (contains!1682 lt!119873 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237027 () Bool)

(declare-fun res!116180 () Bool)

(assert (=> b!237027 (=> (not res!116180) (not e!153928))))

(assert (=> b!237027 (= res!116180 e!153921)))

(declare-fun c!39509 () Bool)

(assert (=> b!237027 (= c!39509 (not (= (bvand (extraKeys!4136 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!237028 () Bool)

(assert (=> b!237028 (= e!153923 e!153926)))

(assert (=> b!237028 (= c!39507 (and (not (= (bvand (extraKeys!4136 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4136 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!59525 c!39505) b!237023))

(assert (= (and d!59525 (not c!39505)) b!237028))

(assert (= (and b!237028 c!39507) b!237019))

(assert (= (and b!237028 (not c!39507)) b!237015))

(assert (= (and b!237015 c!39510) b!237017))

(assert (= (and b!237015 (not c!39510)) b!237021))

(assert (= (or b!237017 b!237021) bm!22033))

(assert (= (or b!237019 bm!22033) bm!22032))

(assert (= (or b!237019 b!237017) bm!22029))

(assert (= (or b!237023 bm!22032) bm!22031))

(assert (= (or b!237023 bm!22029) bm!22034))

(assert (= (and d!59525 res!116181) b!237020))

(assert (= (and d!59525 c!39508) b!237014))

(assert (= (and d!59525 (not c!39508)) b!237011))

(assert (= (and d!59525 res!116185) b!237009))

(assert (= (and b!237009 res!116188) b!237010))

(assert (= (and b!237009 (not res!116187)) b!237026))

(assert (= (and b!237026 res!116184) b!237025))

(assert (= (and b!237009 res!116182) b!237027))

(assert (= (and b!237027 c!39509) b!237013))

(assert (= (and b!237027 (not c!39509)) b!237016))

(assert (= (and b!237013 res!116183) b!237024))

(assert (= (or b!237013 b!237016) bm!22030))

(assert (= (and b!237027 res!116180) b!237012))

(assert (= (and b!237012 c!39506) b!237008))

(assert (= (and b!237012 (not c!39506)) b!237018))

(assert (= (and b!237008 res!116186) b!237022))

(assert (= (or b!237008 b!237018) bm!22035))

(declare-fun b_lambda!7939 () Bool)

(assert (=> (not b_lambda!7939) (not b!237025)))

(declare-fun t!8545 () Bool)

(declare-fun tb!2943 () Bool)

(assert (=> (and b!236910 (= (defaultEntry!4399 thiss!1504) (defaultEntry!4399 thiss!1504)) t!8545) tb!2943))

(declare-fun result!5151 () Bool)

(assert (=> tb!2943 (= result!5151 tp_is_empty!6231)))

(assert (=> b!237025 t!8545))

(declare-fun b_and!13319 () Bool)

(assert (= b_and!13315 (and (=> t!8545 result!5151) b_and!13319)))

(declare-fun m!257797 () Bool)

(assert (=> b!237023 m!257797))

(declare-fun m!257799 () Bool)

(assert (=> b!237025 m!257799))

(declare-fun m!257801 () Bool)

(assert (=> b!237025 m!257801))

(assert (=> b!237025 m!257801))

(declare-fun m!257803 () Bool)

(assert (=> b!237025 m!257803))

(declare-fun m!257805 () Bool)

(assert (=> b!237025 m!257805))

(assert (=> b!237025 m!257803))

(assert (=> b!237025 m!257799))

(declare-fun m!257807 () Bool)

(assert (=> b!237025 m!257807))

(assert (=> d!59525 m!257745))

(declare-fun m!257809 () Bool)

(assert (=> bm!22030 m!257809))

(assert (=> b!237020 m!257799))

(assert (=> b!237020 m!257799))

(declare-fun m!257811 () Bool)

(assert (=> b!237020 m!257811))

(declare-fun m!257813 () Bool)

(assert (=> b!237022 m!257813))

(declare-fun m!257815 () Bool)

(assert (=> b!237014 m!257815))

(declare-fun m!257817 () Bool)

(assert (=> b!237014 m!257817))

(declare-fun m!257819 () Bool)

(assert (=> b!237014 m!257819))

(declare-fun m!257821 () Bool)

(assert (=> b!237014 m!257821))

(declare-fun m!257823 () Bool)

(assert (=> b!237014 m!257823))

(assert (=> b!237014 m!257817))

(declare-fun m!257825 () Bool)

(assert (=> b!237014 m!257825))

(declare-fun m!257827 () Bool)

(assert (=> b!237014 m!257827))

(declare-fun m!257829 () Bool)

(assert (=> b!237014 m!257829))

(declare-fun m!257831 () Bool)

(assert (=> b!237014 m!257831))

(declare-fun m!257833 () Bool)

(assert (=> b!237014 m!257833))

(declare-fun m!257835 () Bool)

(assert (=> b!237014 m!257835))

(declare-fun m!257837 () Bool)

(assert (=> b!237014 m!257837))

(declare-fun m!257839 () Bool)

(assert (=> b!237014 m!257839))

(declare-fun m!257841 () Bool)

(assert (=> b!237014 m!257841))

(assert (=> b!237014 m!257835))

(declare-fun m!257843 () Bool)

(assert (=> b!237014 m!257843))

(assert (=> b!237014 m!257799))

(assert (=> b!237014 m!257827))

(declare-fun m!257845 () Bool)

(assert (=> b!237014 m!257845))

(assert (=> b!237014 m!257837))

(assert (=> bm!22031 m!257833))

(declare-fun m!257847 () Bool)

(assert (=> bm!22034 m!257847))

(declare-fun m!257849 () Bool)

(assert (=> bm!22035 m!257849))

(declare-fun m!257851 () Bool)

(assert (=> b!237024 m!257851))

(assert (=> b!237026 m!257799))

(assert (=> b!237026 m!257799))

(declare-fun m!257853 () Bool)

(assert (=> b!237026 m!257853))

(assert (=> b!237010 m!257799))

(assert (=> b!237010 m!257799))

(assert (=> b!237010 m!257811))

(assert (=> b!236907 d!59525))

(declare-fun d!59527 () Bool)

(declare-fun res!116195 () Bool)

(declare-fun e!153932 () Bool)

(assert (=> d!59527 (=> (not res!116195) (not e!153932))))

(declare-fun simpleValid!238 (LongMapFixedSize!3444) Bool)

(assert (=> d!59527 (= res!116195 (simpleValid!238 thiss!1504))))

(assert (=> d!59527 (= (valid!1358 thiss!1504) e!153932)))

(declare-fun b!237037 () Bool)

(declare-fun res!116196 () Bool)

(assert (=> b!237037 (=> (not res!116196) (not e!153932))))

(declare-fun arrayCountValidKeys!0 (array!11731 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!237037 (= res!116196 (= (arrayCountValidKeys!0 (_keys!6486 thiss!1504) #b00000000000000000000000000000000 (size!5912 (_keys!6486 thiss!1504))) (_size!1771 thiss!1504)))))

(declare-fun b!237038 () Bool)

(declare-fun res!116197 () Bool)

(assert (=> b!237038 (=> (not res!116197) (not e!153932))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11731 (_ BitVec 32)) Bool)

(assert (=> b!237038 (= res!116197 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6486 thiss!1504) (mask!10400 thiss!1504)))))

(declare-fun b!237039 () Bool)

(declare-datatypes ((List!3561 0))(
  ( (Nil!3558) (Cons!3557 (h!4211 (_ BitVec 64)) (t!8546 List!3561)) )
))
(declare-fun arrayNoDuplicates!0 (array!11731 (_ BitVec 32) List!3561) Bool)

(assert (=> b!237039 (= e!153932 (arrayNoDuplicates!0 (_keys!6486 thiss!1504) #b00000000000000000000000000000000 Nil!3558))))

(assert (= (and d!59527 res!116195) b!237037))

(assert (= (and b!237037 res!116196) b!237038))

(assert (= (and b!237038 res!116197) b!237039))

(declare-fun m!257855 () Bool)

(assert (=> d!59527 m!257855))

(declare-fun m!257857 () Bool)

(assert (=> b!237037 m!257857))

(declare-fun m!257859 () Bool)

(assert (=> b!237038 m!257859))

(declare-fun m!257861 () Bool)

(assert (=> b!237039 m!257861))

(assert (=> start!22698 d!59527))

(declare-fun b!237046 () Bool)

(declare-fun e!153937 () Bool)

(assert (=> b!237046 (= e!153937 tp_is_empty!6231)))

(declare-fun condMapEmpty!10564 () Bool)

(declare-fun mapDefault!10564 () ValueCell!2772)

(assert (=> mapNonEmpty!10558 (= condMapEmpty!10564 (= mapRest!10558 ((as const (Array (_ BitVec 32) ValueCell!2772)) mapDefault!10564)))))

(declare-fun e!153938 () Bool)

(declare-fun mapRes!10564 () Bool)

(assert (=> mapNonEmpty!10558 (= tp!22290 (and e!153938 mapRes!10564))))

(declare-fun mapIsEmpty!10564 () Bool)

(assert (=> mapIsEmpty!10564 mapRes!10564))

(declare-fun b!237047 () Bool)

(assert (=> b!237047 (= e!153938 tp_is_empty!6231)))

(declare-fun mapNonEmpty!10564 () Bool)

(declare-fun tp!22300 () Bool)

(assert (=> mapNonEmpty!10564 (= mapRes!10564 (and tp!22300 e!153937))))

(declare-fun mapRest!10564 () (Array (_ BitVec 32) ValueCell!2772))

(declare-fun mapValue!10564 () ValueCell!2772)

(declare-fun mapKey!10564 () (_ BitVec 32))

(assert (=> mapNonEmpty!10564 (= mapRest!10558 (store mapRest!10564 mapKey!10564 mapValue!10564))))

(assert (= (and mapNonEmpty!10558 condMapEmpty!10564) mapIsEmpty!10564))

(assert (= (and mapNonEmpty!10558 (not condMapEmpty!10564)) mapNonEmpty!10564))

(assert (= (and mapNonEmpty!10564 ((_ is ValueCellFull!2772) mapValue!10564)) b!237046))

(assert (= (and mapNonEmpty!10558 ((_ is ValueCellFull!2772) mapDefault!10564)) b!237047))

(declare-fun m!257863 () Bool)

(assert (=> mapNonEmpty!10564 m!257863))

(declare-fun b_lambda!7941 () Bool)

(assert (= b_lambda!7939 (or (and b!236910 b_free!6369) b_lambda!7941)))

(check-sat (not b!237010) (not b!237038) (not d!59525) (not b!236963) (not b!237024) (not b!237026) (not bm!22034) (not b!237020) tp_is_empty!6231 (not d!59527) (not b_next!6369) (not d!59523) (not d!59521) (not b!236965) (not b_lambda!7941) (not b!237014) (not bm!22035) (not bm!22030) (not b!237025) (not b!236952) (not b!237039) (not b!237037) (not b!237022) (not b!237023) b_and!13319 (not mapNonEmpty!10564) (not bm!22031))
(check-sat b_and!13319 (not b_next!6369))

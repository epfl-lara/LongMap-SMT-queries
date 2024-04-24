; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81210 () Bool)

(assert start!81210)

(declare-fun b!949881 () Bool)

(declare-fun b_free!18211 () Bool)

(declare-fun b_next!18211 () Bool)

(assert (=> b!949881 (= b_free!18211 (not b_next!18211))))

(declare-fun tp!63216 () Bool)

(declare-fun b_and!29661 () Bool)

(assert (=> b!949881 (= tp!63216 b_and!29661)))

(declare-fun b!949875 () Bool)

(declare-fun res!636878 () Bool)

(declare-fun e!534813 () Bool)

(assert (=> b!949875 (=> (not res!636878) (not e!534813))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!949875 (= res!636878 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!949876 () Bool)

(declare-fun e!534812 () Bool)

(declare-fun tp_is_empty!20719 () Bool)

(assert (=> b!949876 (= e!534812 tp_is_empty!20719)))

(declare-fun mapIsEmpty!32976 () Bool)

(declare-fun mapRes!32976 () Bool)

(assert (=> mapIsEmpty!32976 mapRes!32976))

(declare-fun b!949877 () Bool)

(declare-fun res!636875 () Bool)

(assert (=> b!949877 (=> (not res!636875) (not e!534813))))

(declare-datatypes ((V!32591 0))(
  ( (V!32592 (val!10410 Int)) )
))
(declare-datatypes ((ValueCell!9878 0))(
  ( (ValueCellFull!9878 (v!12946 V!32591)) (EmptyCell!9878) )
))
(declare-datatypes ((array!57499 0))(
  ( (array!57500 (arr!27649 (Array (_ BitVec 32) ValueCell!9878)) (size!28125 (_ BitVec 32))) )
))
(declare-datatypes ((array!57501 0))(
  ( (array!57502 (arr!27650 (Array (_ BitVec 32) (_ BitVec 64))) (size!28126 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4906 0))(
  ( (LongMapFixedSize!4907 (defaultEntry!5758 Int) (mask!27573 (_ BitVec 32)) (extraKeys!5490 (_ BitVec 32)) (zeroValue!5594 V!32591) (minValue!5594 V!32591) (_size!2508 (_ BitVec 32)) (_keys!10710 array!57501) (_values!5781 array!57499) (_vacant!2508 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4906)

(get-info :version)

(declare-datatypes ((SeekEntryResult!9092 0))(
  ( (MissingZero!9092 (index!38739 (_ BitVec 32))) (Found!9092 (index!38740 (_ BitVec 32))) (Intermediate!9092 (undefined!9904 Bool) (index!38741 (_ BitVec 32)) (x!81628 (_ BitVec 32))) (Undefined!9092) (MissingVacant!9092 (index!38742 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57501 (_ BitVec 32)) SeekEntryResult!9092)

(assert (=> b!949877 (= res!636875 (not ((_ is Found!9092) (seekEntry!0 key!756 (_keys!10710 thiss!1141) (mask!27573 thiss!1141)))))))

(declare-fun b!949878 () Bool)

(declare-fun e!534810 () Bool)

(assert (=> b!949878 (= e!534810 tp_is_empty!20719)))

(declare-fun b!949879 () Bool)

(declare-fun res!636876 () Bool)

(assert (=> b!949879 (=> (not res!636876) (not e!534813))))

(declare-datatypes ((tuple2!13514 0))(
  ( (tuple2!13515 (_1!6768 (_ BitVec 64)) (_2!6768 V!32591)) )
))
(declare-datatypes ((List!19311 0))(
  ( (Nil!19308) (Cons!19307 (h!20471 tuple2!13514) (t!27634 List!19311)) )
))
(declare-datatypes ((ListLongMap!12213 0))(
  ( (ListLongMap!12214 (toList!6122 List!19311)) )
))
(declare-fun contains!5219 (ListLongMap!12213 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3355 (array!57501 array!57499 (_ BitVec 32) (_ BitVec 32) V!32591 V!32591 (_ BitVec 32) Int) ListLongMap!12213)

(assert (=> b!949879 (= res!636876 (contains!5219 (getCurrentListMap!3355 (_keys!10710 thiss!1141) (_values!5781 thiss!1141) (mask!27573 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141)) key!756))))

(declare-fun b!949880 () Bool)

(declare-fun e!534815 () Bool)

(assert (=> b!949880 (= e!534815 (and e!534812 mapRes!32976))))

(declare-fun condMapEmpty!32976 () Bool)

(declare-fun mapDefault!32976 () ValueCell!9878)

(assert (=> b!949880 (= condMapEmpty!32976 (= (arr!27649 (_values!5781 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9878)) mapDefault!32976)))))

(declare-fun e!534814 () Bool)

(declare-fun array_inv!21546 (array!57501) Bool)

(declare-fun array_inv!21547 (array!57499) Bool)

(assert (=> b!949881 (= e!534814 (and tp!63216 tp_is_empty!20719 (array_inv!21546 (_keys!10710 thiss!1141)) (array_inv!21547 (_values!5781 thiss!1141)) e!534815))))

(declare-fun b!949882 () Bool)

(declare-fun res!636877 () Bool)

(assert (=> b!949882 (=> (not res!636877) (not e!534813))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!949882 (= res!636877 (validMask!0 (mask!27573 thiss!1141)))))

(declare-fun b!949883 () Bool)

(assert (=> b!949883 (= e!534813 (and (= (size!28125 (_values!5781 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27573 thiss!1141))) (= (size!28126 (_keys!10710 thiss!1141)) (size!28125 (_values!5781 thiss!1141))) (bvsge (mask!27573 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5490 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun res!636874 () Bool)

(assert (=> start!81210 (=> (not res!636874) (not e!534813))))

(declare-fun valid!1881 (LongMapFixedSize!4906) Bool)

(assert (=> start!81210 (= res!636874 (valid!1881 thiss!1141))))

(assert (=> start!81210 e!534813))

(assert (=> start!81210 e!534814))

(assert (=> start!81210 true))

(declare-fun mapNonEmpty!32976 () Bool)

(declare-fun tp!63215 () Bool)

(assert (=> mapNonEmpty!32976 (= mapRes!32976 (and tp!63215 e!534810))))

(declare-fun mapRest!32976 () (Array (_ BitVec 32) ValueCell!9878))

(declare-fun mapValue!32976 () ValueCell!9878)

(declare-fun mapKey!32976 () (_ BitVec 32))

(assert (=> mapNonEmpty!32976 (= (arr!27649 (_values!5781 thiss!1141)) (store mapRest!32976 mapKey!32976 mapValue!32976))))

(assert (= (and start!81210 res!636874) b!949875))

(assert (= (and b!949875 res!636878) b!949877))

(assert (= (and b!949877 res!636875) b!949879))

(assert (= (and b!949879 res!636876) b!949882))

(assert (= (and b!949882 res!636877) b!949883))

(assert (= (and b!949880 condMapEmpty!32976) mapIsEmpty!32976))

(assert (= (and b!949880 (not condMapEmpty!32976)) mapNonEmpty!32976))

(assert (= (and mapNonEmpty!32976 ((_ is ValueCellFull!9878) mapValue!32976)) b!949878))

(assert (= (and b!949880 ((_ is ValueCellFull!9878) mapDefault!32976)) b!949876))

(assert (= b!949881 b!949880))

(assert (= start!81210 b!949881))

(declare-fun m!882961 () Bool)

(assert (=> b!949881 m!882961))

(declare-fun m!882963 () Bool)

(assert (=> b!949881 m!882963))

(declare-fun m!882965 () Bool)

(assert (=> start!81210 m!882965))

(declare-fun m!882967 () Bool)

(assert (=> b!949879 m!882967))

(assert (=> b!949879 m!882967))

(declare-fun m!882969 () Bool)

(assert (=> b!949879 m!882969))

(declare-fun m!882971 () Bool)

(assert (=> mapNonEmpty!32976 m!882971))

(declare-fun m!882973 () Bool)

(assert (=> b!949877 m!882973))

(declare-fun m!882975 () Bool)

(assert (=> b!949882 m!882975))

(check-sat tp_is_empty!20719 b_and!29661 (not mapNonEmpty!32976) (not b_next!18211) (not b!949882) (not b!949879) (not b!949881) (not start!81210) (not b!949877))
(check-sat b_and!29661 (not b_next!18211))
(get-model)

(declare-fun b!949950 () Bool)

(declare-fun c!99268 () Bool)

(declare-fun lt!427701 () (_ BitVec 64))

(assert (=> b!949950 (= c!99268 (= lt!427701 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!534860 () SeekEntryResult!9092)

(declare-fun e!534858 () SeekEntryResult!9092)

(assert (=> b!949950 (= e!534860 e!534858)))

(declare-fun b!949951 () Bool)

(declare-fun e!534859 () SeekEntryResult!9092)

(assert (=> b!949951 (= e!534859 e!534860)))

(declare-fun lt!427704 () SeekEntryResult!9092)

(assert (=> b!949951 (= lt!427701 (select (arr!27650 (_keys!10710 thiss!1141)) (index!38741 lt!427704)))))

(declare-fun c!99267 () Bool)

(assert (=> b!949951 (= c!99267 (= lt!427701 key!756))))

(declare-fun b!949953 () Bool)

(assert (=> b!949953 (= e!534860 (Found!9092 (index!38741 lt!427704)))))

(declare-fun b!949954 () Bool)

(assert (=> b!949954 (= e!534859 Undefined!9092)))

(declare-fun b!949955 () Bool)

(assert (=> b!949955 (= e!534858 (MissingZero!9092 (index!38741 lt!427704)))))

(declare-fun d!115269 () Bool)

(declare-fun lt!427703 () SeekEntryResult!9092)

(assert (=> d!115269 (and (or ((_ is MissingVacant!9092) lt!427703) (not ((_ is Found!9092) lt!427703)) (and (bvsge (index!38740 lt!427703) #b00000000000000000000000000000000) (bvslt (index!38740 lt!427703) (size!28126 (_keys!10710 thiss!1141))))) (not ((_ is MissingVacant!9092) lt!427703)) (or (not ((_ is Found!9092) lt!427703)) (= (select (arr!27650 (_keys!10710 thiss!1141)) (index!38740 lt!427703)) key!756)))))

(assert (=> d!115269 (= lt!427703 e!534859)))

(declare-fun c!99269 () Bool)

(assert (=> d!115269 (= c!99269 (and ((_ is Intermediate!9092) lt!427704) (undefined!9904 lt!427704)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57501 (_ BitVec 32)) SeekEntryResult!9092)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115269 (= lt!427704 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27573 thiss!1141)) key!756 (_keys!10710 thiss!1141) (mask!27573 thiss!1141)))))

(assert (=> d!115269 (validMask!0 (mask!27573 thiss!1141))))

(assert (=> d!115269 (= (seekEntry!0 key!756 (_keys!10710 thiss!1141) (mask!27573 thiss!1141)) lt!427703)))

(declare-fun b!949952 () Bool)

(declare-fun lt!427702 () SeekEntryResult!9092)

(assert (=> b!949952 (= e!534858 (ite ((_ is MissingVacant!9092) lt!427702) (MissingZero!9092 (index!38742 lt!427702)) lt!427702))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57501 (_ BitVec 32)) SeekEntryResult!9092)

(assert (=> b!949952 (= lt!427702 (seekKeyOrZeroReturnVacant!0 (x!81628 lt!427704) (index!38741 lt!427704) (index!38741 lt!427704) key!756 (_keys!10710 thiss!1141) (mask!27573 thiss!1141)))))

(assert (= (and d!115269 c!99269) b!949954))

(assert (= (and d!115269 (not c!99269)) b!949951))

(assert (= (and b!949951 c!99267) b!949953))

(assert (= (and b!949951 (not c!99267)) b!949950))

(assert (= (and b!949950 c!99268) b!949955))

(assert (= (and b!949950 (not c!99268)) b!949952))

(declare-fun m!883009 () Bool)

(assert (=> b!949951 m!883009))

(declare-fun m!883011 () Bool)

(assert (=> d!115269 m!883011))

(declare-fun m!883013 () Bool)

(assert (=> d!115269 m!883013))

(assert (=> d!115269 m!883013))

(declare-fun m!883015 () Bool)

(assert (=> d!115269 m!883015))

(assert (=> d!115269 m!882975))

(declare-fun m!883017 () Bool)

(assert (=> b!949952 m!883017))

(assert (=> b!949877 d!115269))

(declare-fun d!115271 () Bool)

(declare-fun res!636915 () Bool)

(declare-fun e!534863 () Bool)

(assert (=> d!115271 (=> (not res!636915) (not e!534863))))

(declare-fun simpleValid!370 (LongMapFixedSize!4906) Bool)

(assert (=> d!115271 (= res!636915 (simpleValid!370 thiss!1141))))

(assert (=> d!115271 (= (valid!1881 thiss!1141) e!534863)))

(declare-fun b!949962 () Bool)

(declare-fun res!636916 () Bool)

(assert (=> b!949962 (=> (not res!636916) (not e!534863))))

(declare-fun arrayCountValidKeys!0 (array!57501 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!949962 (= res!636916 (= (arrayCountValidKeys!0 (_keys!10710 thiss!1141) #b00000000000000000000000000000000 (size!28126 (_keys!10710 thiss!1141))) (_size!2508 thiss!1141)))))

(declare-fun b!949963 () Bool)

(declare-fun res!636917 () Bool)

(assert (=> b!949963 (=> (not res!636917) (not e!534863))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57501 (_ BitVec 32)) Bool)

(assert (=> b!949963 (= res!636917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10710 thiss!1141) (mask!27573 thiss!1141)))))

(declare-fun b!949964 () Bool)

(declare-datatypes ((List!19313 0))(
  ( (Nil!19310) (Cons!19309 (h!20473 (_ BitVec 64)) (t!27638 List!19313)) )
))
(declare-fun arrayNoDuplicates!0 (array!57501 (_ BitVec 32) List!19313) Bool)

(assert (=> b!949964 (= e!534863 (arrayNoDuplicates!0 (_keys!10710 thiss!1141) #b00000000000000000000000000000000 Nil!19310))))

(assert (= (and d!115271 res!636915) b!949962))

(assert (= (and b!949962 res!636916) b!949963))

(assert (= (and b!949963 res!636917) b!949964))

(declare-fun m!883019 () Bool)

(assert (=> d!115271 m!883019))

(declare-fun m!883021 () Bool)

(assert (=> b!949962 m!883021))

(declare-fun m!883023 () Bool)

(assert (=> b!949963 m!883023))

(declare-fun m!883025 () Bool)

(assert (=> b!949964 m!883025))

(assert (=> start!81210 d!115271))

(declare-fun d!115273 () Bool)

(assert (=> d!115273 (= (validMask!0 (mask!27573 thiss!1141)) (and (or (= (mask!27573 thiss!1141) #b00000000000000000000000000000111) (= (mask!27573 thiss!1141) #b00000000000000000000000000001111) (= (mask!27573 thiss!1141) #b00000000000000000000000000011111) (= (mask!27573 thiss!1141) #b00000000000000000000000000111111) (= (mask!27573 thiss!1141) #b00000000000000000000000001111111) (= (mask!27573 thiss!1141) #b00000000000000000000000011111111) (= (mask!27573 thiss!1141) #b00000000000000000000000111111111) (= (mask!27573 thiss!1141) #b00000000000000000000001111111111) (= (mask!27573 thiss!1141) #b00000000000000000000011111111111) (= (mask!27573 thiss!1141) #b00000000000000000000111111111111) (= (mask!27573 thiss!1141) #b00000000000000000001111111111111) (= (mask!27573 thiss!1141) #b00000000000000000011111111111111) (= (mask!27573 thiss!1141) #b00000000000000000111111111111111) (= (mask!27573 thiss!1141) #b00000000000000001111111111111111) (= (mask!27573 thiss!1141) #b00000000000000011111111111111111) (= (mask!27573 thiss!1141) #b00000000000000111111111111111111) (= (mask!27573 thiss!1141) #b00000000000001111111111111111111) (= (mask!27573 thiss!1141) #b00000000000011111111111111111111) (= (mask!27573 thiss!1141) #b00000000000111111111111111111111) (= (mask!27573 thiss!1141) #b00000000001111111111111111111111) (= (mask!27573 thiss!1141) #b00000000011111111111111111111111) (= (mask!27573 thiss!1141) #b00000000111111111111111111111111) (= (mask!27573 thiss!1141) #b00000001111111111111111111111111) (= (mask!27573 thiss!1141) #b00000011111111111111111111111111) (= (mask!27573 thiss!1141) #b00000111111111111111111111111111) (= (mask!27573 thiss!1141) #b00001111111111111111111111111111) (= (mask!27573 thiss!1141) #b00011111111111111111111111111111) (= (mask!27573 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27573 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!949882 d!115273))

(declare-fun d!115275 () Bool)

(assert (=> d!115275 (= (array_inv!21546 (_keys!10710 thiss!1141)) (bvsge (size!28126 (_keys!10710 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!949881 d!115275))

(declare-fun d!115277 () Bool)

(assert (=> d!115277 (= (array_inv!21547 (_values!5781 thiss!1141)) (bvsge (size!28125 (_values!5781 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!949881 d!115277))

(declare-fun d!115279 () Bool)

(declare-fun e!534868 () Bool)

(assert (=> d!115279 e!534868))

(declare-fun res!636920 () Bool)

(assert (=> d!115279 (=> res!636920 e!534868)))

(declare-fun lt!427713 () Bool)

(assert (=> d!115279 (= res!636920 (not lt!427713))))

(declare-fun lt!427715 () Bool)

(assert (=> d!115279 (= lt!427713 lt!427715)))

(declare-datatypes ((Unit!31946 0))(
  ( (Unit!31947) )
))
(declare-fun lt!427714 () Unit!31946)

(declare-fun e!534869 () Unit!31946)

(assert (=> d!115279 (= lt!427714 e!534869)))

(declare-fun c!99272 () Bool)

(assert (=> d!115279 (= c!99272 lt!427715)))

(declare-fun containsKey!462 (List!19311 (_ BitVec 64)) Bool)

(assert (=> d!115279 (= lt!427715 (containsKey!462 (toList!6122 (getCurrentListMap!3355 (_keys!10710 thiss!1141) (_values!5781 thiss!1141) (mask!27573 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141))) key!756))))

(assert (=> d!115279 (= (contains!5219 (getCurrentListMap!3355 (_keys!10710 thiss!1141) (_values!5781 thiss!1141) (mask!27573 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141)) key!756) lt!427713)))

(declare-fun b!949971 () Bool)

(declare-fun lt!427716 () Unit!31946)

(assert (=> b!949971 (= e!534869 lt!427716)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!356 (List!19311 (_ BitVec 64)) Unit!31946)

(assert (=> b!949971 (= lt!427716 (lemmaContainsKeyImpliesGetValueByKeyDefined!356 (toList!6122 (getCurrentListMap!3355 (_keys!10710 thiss!1141) (_values!5781 thiss!1141) (mask!27573 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141))) key!756))))

(declare-datatypes ((Option!497 0))(
  ( (Some!496 (v!12949 V!32591)) (None!495) )
))
(declare-fun isDefined!364 (Option!497) Bool)

(declare-fun getValueByKey!491 (List!19311 (_ BitVec 64)) Option!497)

(assert (=> b!949971 (isDefined!364 (getValueByKey!491 (toList!6122 (getCurrentListMap!3355 (_keys!10710 thiss!1141) (_values!5781 thiss!1141) (mask!27573 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141))) key!756))))

(declare-fun b!949972 () Bool)

(declare-fun Unit!31948 () Unit!31946)

(assert (=> b!949972 (= e!534869 Unit!31948)))

(declare-fun b!949973 () Bool)

(assert (=> b!949973 (= e!534868 (isDefined!364 (getValueByKey!491 (toList!6122 (getCurrentListMap!3355 (_keys!10710 thiss!1141) (_values!5781 thiss!1141) (mask!27573 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141))) key!756)))))

(assert (= (and d!115279 c!99272) b!949971))

(assert (= (and d!115279 (not c!99272)) b!949972))

(assert (= (and d!115279 (not res!636920)) b!949973))

(declare-fun m!883027 () Bool)

(assert (=> d!115279 m!883027))

(declare-fun m!883029 () Bool)

(assert (=> b!949971 m!883029))

(declare-fun m!883031 () Bool)

(assert (=> b!949971 m!883031))

(assert (=> b!949971 m!883031))

(declare-fun m!883033 () Bool)

(assert (=> b!949971 m!883033))

(assert (=> b!949973 m!883031))

(assert (=> b!949973 m!883031))

(assert (=> b!949973 m!883033))

(assert (=> b!949879 d!115279))

(declare-fun b!950016 () Bool)

(declare-fun e!534907 () Unit!31946)

(declare-fun Unit!31949 () Unit!31946)

(assert (=> b!950016 (= e!534907 Unit!31949)))

(declare-fun b!950017 () Bool)

(declare-fun e!534898 () ListLongMap!12213)

(declare-fun call!41313 () ListLongMap!12213)

(assert (=> b!950017 (= e!534898 call!41313)))

(declare-fun b!950018 () Bool)

(declare-fun e!534904 () ListLongMap!12213)

(declare-fun e!534908 () ListLongMap!12213)

(assert (=> b!950018 (= e!534904 e!534908)))

(declare-fun c!99286 () Bool)

(assert (=> b!950018 (= c!99286 (and (not (= (bvand (extraKeys!5490 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5490 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!950019 () Bool)

(declare-fun e!534901 () Bool)

(declare-fun lt!427779 () ListLongMap!12213)

(declare-fun apply!883 (ListLongMap!12213 (_ BitVec 64)) V!32591)

(assert (=> b!950019 (= e!534901 (= (apply!883 lt!427779 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5594 thiss!1141)))))

(declare-fun b!950020 () Bool)

(declare-fun e!534896 () Bool)

(declare-fun e!534903 () Bool)

(assert (=> b!950020 (= e!534896 e!534903)))

(declare-fun c!99289 () Bool)

(assert (=> b!950020 (= c!99289 (not (= (bvand (extraKeys!5490 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!950021 () Bool)

(declare-fun e!534906 () Bool)

(declare-fun call!41314 () Bool)

(assert (=> b!950021 (= e!534906 (not call!41314))))

(declare-fun bm!41310 () Bool)

(declare-fun call!41319 () ListLongMap!12213)

(declare-fun call!41316 () ListLongMap!12213)

(assert (=> bm!41310 (= call!41319 call!41316)))

(declare-fun d!115281 () Bool)

(assert (=> d!115281 e!534896))

(declare-fun res!636943 () Bool)

(assert (=> d!115281 (=> (not res!636943) (not e!534896))))

(assert (=> d!115281 (= res!636943 (or (bvsge #b00000000000000000000000000000000 (size!28126 (_keys!10710 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28126 (_keys!10710 thiss!1141))))))))

(declare-fun lt!427764 () ListLongMap!12213)

(assert (=> d!115281 (= lt!427779 lt!427764)))

(declare-fun lt!427768 () Unit!31946)

(assert (=> d!115281 (= lt!427768 e!534907)))

(declare-fun c!99290 () Bool)

(declare-fun e!534900 () Bool)

(assert (=> d!115281 (= c!99290 e!534900)))

(declare-fun res!636945 () Bool)

(assert (=> d!115281 (=> (not res!636945) (not e!534900))))

(assert (=> d!115281 (= res!636945 (bvslt #b00000000000000000000000000000000 (size!28126 (_keys!10710 thiss!1141))))))

(assert (=> d!115281 (= lt!427764 e!534904)))

(declare-fun c!99287 () Bool)

(assert (=> d!115281 (= c!99287 (and (not (= (bvand (extraKeys!5490 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5490 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!115281 (validMask!0 (mask!27573 thiss!1141))))

(assert (=> d!115281 (= (getCurrentListMap!3355 (_keys!10710 thiss!1141) (_values!5781 thiss!1141) (mask!27573 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141)) lt!427779)))

(declare-fun b!950022 () Bool)

(declare-fun e!534902 () Bool)

(declare-fun e!534905 () Bool)

(assert (=> b!950022 (= e!534902 e!534905)))

(declare-fun res!636941 () Bool)

(assert (=> b!950022 (=> (not res!636941) (not e!534905))))

(assert (=> b!950022 (= res!636941 (contains!5219 lt!427779 (select (arr!27650 (_keys!10710 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!950022 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28126 (_keys!10710 thiss!1141))))))

(declare-fun b!950023 () Bool)

(assert (=> b!950023 (= e!534903 e!534901)))

(declare-fun res!636942 () Bool)

(declare-fun call!41317 () Bool)

(assert (=> b!950023 (= res!636942 call!41317)))

(assert (=> b!950023 (=> (not res!636942) (not e!534901))))

(declare-fun b!950024 () Bool)

(declare-fun res!636946 () Bool)

(assert (=> b!950024 (=> (not res!636946) (not e!534896))))

(assert (=> b!950024 (= res!636946 e!534902)))

(declare-fun res!636947 () Bool)

(assert (=> b!950024 (=> res!636947 e!534902)))

(declare-fun e!534897 () Bool)

(assert (=> b!950024 (= res!636947 (not e!534897))))

(declare-fun res!636939 () Bool)

(assert (=> b!950024 (=> (not res!636939) (not e!534897))))

(assert (=> b!950024 (= res!636939 (bvslt #b00000000000000000000000000000000 (size!28126 (_keys!10710 thiss!1141))))))

(declare-fun b!950025 () Bool)

(declare-fun call!41318 () ListLongMap!12213)

(assert (=> b!950025 (= e!534898 call!41318)))

(declare-fun bm!41311 () Bool)

(assert (=> bm!41311 (= call!41318 call!41319)))

(declare-fun b!950026 () Bool)

(declare-fun e!534899 () Bool)

(assert (=> b!950026 (= e!534899 (= (apply!883 lt!427779 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5594 thiss!1141)))))

(declare-fun bm!41312 () Bool)

(assert (=> bm!41312 (= call!41317 (contains!5219 lt!427779 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!950027 () Bool)

(assert (=> b!950027 (= e!534903 (not call!41317))))

(declare-fun b!950028 () Bool)

(declare-fun call!41315 () ListLongMap!12213)

(declare-fun +!2869 (ListLongMap!12213 tuple2!13514) ListLongMap!12213)

(assert (=> b!950028 (= e!534904 (+!2869 call!41315 (tuple2!13515 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141))))))

(declare-fun bm!41313 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3357 (array!57501 array!57499 (_ BitVec 32) (_ BitVec 32) V!32591 V!32591 (_ BitVec 32) Int) ListLongMap!12213)

(assert (=> bm!41313 (= call!41316 (getCurrentListMapNoExtraKeys!3357 (_keys!10710 thiss!1141) (_values!5781 thiss!1141) (mask!27573 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141)))))

(declare-fun b!950029 () Bool)

(declare-fun get!14538 (ValueCell!9878 V!32591) V!32591)

(declare-fun dynLambda!1666 (Int (_ BitVec 64)) V!32591)

(assert (=> b!950029 (= e!534905 (= (apply!883 lt!427779 (select (arr!27650 (_keys!10710 thiss!1141)) #b00000000000000000000000000000000)) (get!14538 (select (arr!27649 (_values!5781 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1666 (defaultEntry!5758 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!950029 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28125 (_values!5781 thiss!1141))))))

(assert (=> b!950029 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28126 (_keys!10710 thiss!1141))))))

(declare-fun b!950030 () Bool)

(assert (=> b!950030 (= e!534906 e!534899)))

(declare-fun res!636940 () Bool)

(assert (=> b!950030 (= res!636940 call!41314)))

(assert (=> b!950030 (=> (not res!636940) (not e!534899))))

(declare-fun b!950031 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!950031 (= e!534900 (validKeyInArray!0 (select (arr!27650 (_keys!10710 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41314 () Bool)

(assert (=> bm!41314 (= call!41314 (contains!5219 lt!427779 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!41315 () Bool)

(assert (=> bm!41315 (= call!41315 (+!2869 (ite c!99287 call!41316 (ite c!99286 call!41319 call!41318)) (ite (or c!99287 c!99286) (tuple2!13515 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5594 thiss!1141)) (tuple2!13515 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141)))))))

(declare-fun b!950032 () Bool)

(declare-fun c!99285 () Bool)

(assert (=> b!950032 (= c!99285 (and (not (= (bvand (extraKeys!5490 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5490 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!950032 (= e!534908 e!534898)))

(declare-fun b!950033 () Bool)

(assert (=> b!950033 (= e!534897 (validKeyInArray!0 (select (arr!27650 (_keys!10710 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41316 () Bool)

(assert (=> bm!41316 (= call!41313 call!41315)))

(declare-fun b!950034 () Bool)

(assert (=> b!950034 (= e!534908 call!41313)))

(declare-fun b!950035 () Bool)

(declare-fun res!636944 () Bool)

(assert (=> b!950035 (=> (not res!636944) (not e!534896))))

(assert (=> b!950035 (= res!636944 e!534906)))

(declare-fun c!99288 () Bool)

(assert (=> b!950035 (= c!99288 (not (= (bvand (extraKeys!5490 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!950036 () Bool)

(declare-fun lt!427770 () Unit!31946)

(assert (=> b!950036 (= e!534907 lt!427770)))

(declare-fun lt!427771 () ListLongMap!12213)

(assert (=> b!950036 (= lt!427771 (getCurrentListMapNoExtraKeys!3357 (_keys!10710 thiss!1141) (_values!5781 thiss!1141) (mask!27573 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141)))))

(declare-fun lt!427773 () (_ BitVec 64))

(assert (=> b!950036 (= lt!427773 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427772 () (_ BitVec 64))

(assert (=> b!950036 (= lt!427772 (select (arr!27650 (_keys!10710 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427782 () Unit!31946)

(declare-fun addStillContains!572 (ListLongMap!12213 (_ BitVec 64) V!32591 (_ BitVec 64)) Unit!31946)

(assert (=> b!950036 (= lt!427782 (addStillContains!572 lt!427771 lt!427773 (zeroValue!5594 thiss!1141) lt!427772))))

(assert (=> b!950036 (contains!5219 (+!2869 lt!427771 (tuple2!13515 lt!427773 (zeroValue!5594 thiss!1141))) lt!427772)))

(declare-fun lt!427762 () Unit!31946)

(assert (=> b!950036 (= lt!427762 lt!427782)))

(declare-fun lt!427778 () ListLongMap!12213)

(assert (=> b!950036 (= lt!427778 (getCurrentListMapNoExtraKeys!3357 (_keys!10710 thiss!1141) (_values!5781 thiss!1141) (mask!27573 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141)))))

(declare-fun lt!427776 () (_ BitVec 64))

(assert (=> b!950036 (= lt!427776 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427780 () (_ BitVec 64))

(assert (=> b!950036 (= lt!427780 (select (arr!27650 (_keys!10710 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427777 () Unit!31946)

(declare-fun addApplyDifferent!453 (ListLongMap!12213 (_ BitVec 64) V!32591 (_ BitVec 64)) Unit!31946)

(assert (=> b!950036 (= lt!427777 (addApplyDifferent!453 lt!427778 lt!427776 (minValue!5594 thiss!1141) lt!427780))))

(assert (=> b!950036 (= (apply!883 (+!2869 lt!427778 (tuple2!13515 lt!427776 (minValue!5594 thiss!1141))) lt!427780) (apply!883 lt!427778 lt!427780))))

(declare-fun lt!427769 () Unit!31946)

(assert (=> b!950036 (= lt!427769 lt!427777)))

(declare-fun lt!427765 () ListLongMap!12213)

(assert (=> b!950036 (= lt!427765 (getCurrentListMapNoExtraKeys!3357 (_keys!10710 thiss!1141) (_values!5781 thiss!1141) (mask!27573 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141)))))

(declare-fun lt!427766 () (_ BitVec 64))

(assert (=> b!950036 (= lt!427766 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427767 () (_ BitVec 64))

(assert (=> b!950036 (= lt!427767 (select (arr!27650 (_keys!10710 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427775 () Unit!31946)

(assert (=> b!950036 (= lt!427775 (addApplyDifferent!453 lt!427765 lt!427766 (zeroValue!5594 thiss!1141) lt!427767))))

(assert (=> b!950036 (= (apply!883 (+!2869 lt!427765 (tuple2!13515 lt!427766 (zeroValue!5594 thiss!1141))) lt!427767) (apply!883 lt!427765 lt!427767))))

(declare-fun lt!427763 () Unit!31946)

(assert (=> b!950036 (= lt!427763 lt!427775)))

(declare-fun lt!427774 () ListLongMap!12213)

(assert (=> b!950036 (= lt!427774 (getCurrentListMapNoExtraKeys!3357 (_keys!10710 thiss!1141) (_values!5781 thiss!1141) (mask!27573 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141)))))

(declare-fun lt!427761 () (_ BitVec 64))

(assert (=> b!950036 (= lt!427761 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427781 () (_ BitVec 64))

(assert (=> b!950036 (= lt!427781 (select (arr!27650 (_keys!10710 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!950036 (= lt!427770 (addApplyDifferent!453 lt!427774 lt!427761 (minValue!5594 thiss!1141) lt!427781))))

(assert (=> b!950036 (= (apply!883 (+!2869 lt!427774 (tuple2!13515 lt!427761 (minValue!5594 thiss!1141))) lt!427781) (apply!883 lt!427774 lt!427781))))

(assert (= (and d!115281 c!99287) b!950028))

(assert (= (and d!115281 (not c!99287)) b!950018))

(assert (= (and b!950018 c!99286) b!950034))

(assert (= (and b!950018 (not c!99286)) b!950032))

(assert (= (and b!950032 c!99285) b!950017))

(assert (= (and b!950032 (not c!99285)) b!950025))

(assert (= (or b!950017 b!950025) bm!41311))

(assert (= (or b!950034 bm!41311) bm!41310))

(assert (= (or b!950034 b!950017) bm!41316))

(assert (= (or b!950028 bm!41310) bm!41313))

(assert (= (or b!950028 bm!41316) bm!41315))

(assert (= (and d!115281 res!636945) b!950031))

(assert (= (and d!115281 c!99290) b!950036))

(assert (= (and d!115281 (not c!99290)) b!950016))

(assert (= (and d!115281 res!636943) b!950024))

(assert (= (and b!950024 res!636939) b!950033))

(assert (= (and b!950024 (not res!636947)) b!950022))

(assert (= (and b!950022 res!636941) b!950029))

(assert (= (and b!950024 res!636946) b!950035))

(assert (= (and b!950035 c!99288) b!950030))

(assert (= (and b!950035 (not c!99288)) b!950021))

(assert (= (and b!950030 res!636940) b!950026))

(assert (= (or b!950030 b!950021) bm!41314))

(assert (= (and b!950035 res!636944) b!950020))

(assert (= (and b!950020 c!99289) b!950023))

(assert (= (and b!950020 (not c!99289)) b!950027))

(assert (= (and b!950023 res!636942) b!950019))

(assert (= (or b!950023 b!950027) bm!41312))

(declare-fun b_lambda!14349 () Bool)

(assert (=> (not b_lambda!14349) (not b!950029)))

(declare-fun t!27637 () Bool)

(declare-fun tb!6175 () Bool)

(assert (=> (and b!949881 (= (defaultEntry!5758 thiss!1141) (defaultEntry!5758 thiss!1141)) t!27637) tb!6175))

(declare-fun result!12263 () Bool)

(assert (=> tb!6175 (= result!12263 tp_is_empty!20719)))

(assert (=> b!950029 t!27637))

(declare-fun b_and!29667 () Bool)

(assert (= b_and!29661 (and (=> t!27637 result!12263) b_and!29667)))

(declare-fun m!883035 () Bool)

(assert (=> b!950019 m!883035))

(declare-fun m!883037 () Bool)

(assert (=> b!950028 m!883037))

(declare-fun m!883039 () Bool)

(assert (=> b!950026 m!883039))

(declare-fun m!883041 () Bool)

(assert (=> bm!41312 m!883041))

(declare-fun m!883043 () Bool)

(assert (=> bm!41314 m!883043))

(declare-fun m!883045 () Bool)

(assert (=> b!950029 m!883045))

(assert (=> b!950029 m!883045))

(declare-fun m!883047 () Bool)

(assert (=> b!950029 m!883047))

(declare-fun m!883049 () Bool)

(assert (=> b!950029 m!883049))

(declare-fun m!883051 () Bool)

(assert (=> b!950029 m!883051))

(assert (=> b!950029 m!883051))

(assert (=> b!950029 m!883049))

(declare-fun m!883053 () Bool)

(assert (=> b!950029 m!883053))

(assert (=> b!950031 m!883045))

(assert (=> b!950031 m!883045))

(declare-fun m!883055 () Bool)

(assert (=> b!950031 m!883055))

(assert (=> d!115281 m!882975))

(declare-fun m!883057 () Bool)

(assert (=> bm!41315 m!883057))

(declare-fun m!883059 () Bool)

(assert (=> b!950036 m!883059))

(declare-fun m!883061 () Bool)

(assert (=> b!950036 m!883061))

(declare-fun m!883063 () Bool)

(assert (=> b!950036 m!883063))

(declare-fun m!883065 () Bool)

(assert (=> b!950036 m!883065))

(declare-fun m!883067 () Bool)

(assert (=> b!950036 m!883067))

(declare-fun m!883069 () Bool)

(assert (=> b!950036 m!883069))

(declare-fun m!883071 () Bool)

(assert (=> b!950036 m!883071))

(assert (=> b!950036 m!883069))

(declare-fun m!883073 () Bool)

(assert (=> b!950036 m!883073))

(declare-fun m!883075 () Bool)

(assert (=> b!950036 m!883075))

(declare-fun m!883077 () Bool)

(assert (=> b!950036 m!883077))

(declare-fun m!883079 () Bool)

(assert (=> b!950036 m!883079))

(declare-fun m!883081 () Bool)

(assert (=> b!950036 m!883081))

(declare-fun m!883083 () Bool)

(assert (=> b!950036 m!883083))

(assert (=> b!950036 m!883045))

(assert (=> b!950036 m!883081))

(declare-fun m!883085 () Bool)

(assert (=> b!950036 m!883085))

(assert (=> b!950036 m!883077))

(declare-fun m!883087 () Bool)

(assert (=> b!950036 m!883087))

(assert (=> b!950036 m!883059))

(declare-fun m!883089 () Bool)

(assert (=> b!950036 m!883089))

(assert (=> b!950033 m!883045))

(assert (=> b!950033 m!883045))

(assert (=> b!950033 m!883055))

(assert (=> bm!41313 m!883085))

(assert (=> b!950022 m!883045))

(assert (=> b!950022 m!883045))

(declare-fun m!883091 () Bool)

(assert (=> b!950022 m!883091))

(assert (=> b!949879 d!115281))

(declare-fun mapNonEmpty!32985 () Bool)

(declare-fun mapRes!32985 () Bool)

(declare-fun tp!63231 () Bool)

(declare-fun e!534914 () Bool)

(assert (=> mapNonEmpty!32985 (= mapRes!32985 (and tp!63231 e!534914))))

(declare-fun mapValue!32985 () ValueCell!9878)

(declare-fun mapKey!32985 () (_ BitVec 32))

(declare-fun mapRest!32985 () (Array (_ BitVec 32) ValueCell!9878))

(assert (=> mapNonEmpty!32985 (= mapRest!32976 (store mapRest!32985 mapKey!32985 mapValue!32985))))

(declare-fun mapIsEmpty!32985 () Bool)

(assert (=> mapIsEmpty!32985 mapRes!32985))

(declare-fun condMapEmpty!32985 () Bool)

(declare-fun mapDefault!32985 () ValueCell!9878)

(assert (=> mapNonEmpty!32976 (= condMapEmpty!32985 (= mapRest!32976 ((as const (Array (_ BitVec 32) ValueCell!9878)) mapDefault!32985)))))

(declare-fun e!534913 () Bool)

(assert (=> mapNonEmpty!32976 (= tp!63215 (and e!534913 mapRes!32985))))

(declare-fun b!950046 () Bool)

(assert (=> b!950046 (= e!534913 tp_is_empty!20719)))

(declare-fun b!950045 () Bool)

(assert (=> b!950045 (= e!534914 tp_is_empty!20719)))

(assert (= (and mapNonEmpty!32976 condMapEmpty!32985) mapIsEmpty!32985))

(assert (= (and mapNonEmpty!32976 (not condMapEmpty!32985)) mapNonEmpty!32985))

(assert (= (and mapNonEmpty!32985 ((_ is ValueCellFull!9878) mapValue!32985)) b!950045))

(assert (= (and mapNonEmpty!32976 ((_ is ValueCellFull!9878) mapDefault!32985)) b!950046))

(declare-fun m!883093 () Bool)

(assert (=> mapNonEmpty!32985 m!883093))

(declare-fun b_lambda!14351 () Bool)

(assert (= b_lambda!14349 (or (and b!949881 b_free!18211) b_lambda!14351)))

(check-sat (not b!950026) (not b!949952) (not mapNonEmpty!32985) (not bm!41313) (not b!950022) (not b!949963) (not b_next!18211) (not b!950036) (not d!115271) (not d!115279) (not b!949973) (not bm!41315) (not b!949971) (not b!949964) (not b!950019) tp_is_empty!20719 (not bm!41312) (not bm!41314) (not b!950028) (not b!950033) (not d!115269) (not b!950031) (not b!949962) (not d!115281) (not b_lambda!14351) b_and!29667 (not b!950029))
(check-sat b_and!29667 (not b_next!18211))
(get-model)

(declare-fun d!115283 () Bool)

(declare-fun isEmpty!714 (Option!497) Bool)

(assert (=> d!115283 (= (isDefined!364 (getValueByKey!491 (toList!6122 (getCurrentListMap!3355 (_keys!10710 thiss!1141) (_values!5781 thiss!1141) (mask!27573 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141))) key!756)) (not (isEmpty!714 (getValueByKey!491 (toList!6122 (getCurrentListMap!3355 (_keys!10710 thiss!1141) (_values!5781 thiss!1141) (mask!27573 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141))) key!756))))))

(declare-fun bs!26688 () Bool)

(assert (= bs!26688 d!115283))

(assert (=> bs!26688 m!883031))

(declare-fun m!883095 () Bool)

(assert (=> bs!26688 m!883095))

(assert (=> b!949973 d!115283))

(declare-fun b!950057 () Bool)

(declare-fun e!534920 () Option!497)

(assert (=> b!950057 (= e!534920 (getValueByKey!491 (t!27634 (toList!6122 (getCurrentListMap!3355 (_keys!10710 thiss!1141) (_values!5781 thiss!1141) (mask!27573 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141)))) key!756))))

(declare-fun b!950055 () Bool)

(declare-fun e!534919 () Option!497)

(assert (=> b!950055 (= e!534919 (Some!496 (_2!6768 (h!20471 (toList!6122 (getCurrentListMap!3355 (_keys!10710 thiss!1141) (_values!5781 thiss!1141) (mask!27573 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141)))))))))

(declare-fun b!950056 () Bool)

(assert (=> b!950056 (= e!534919 e!534920)))

(declare-fun c!99296 () Bool)

(assert (=> b!950056 (= c!99296 (and ((_ is Cons!19307) (toList!6122 (getCurrentListMap!3355 (_keys!10710 thiss!1141) (_values!5781 thiss!1141) (mask!27573 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141)))) (not (= (_1!6768 (h!20471 (toList!6122 (getCurrentListMap!3355 (_keys!10710 thiss!1141) (_values!5781 thiss!1141) (mask!27573 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141))))) key!756))))))

(declare-fun b!950058 () Bool)

(assert (=> b!950058 (= e!534920 None!495)))

(declare-fun d!115285 () Bool)

(declare-fun c!99295 () Bool)

(assert (=> d!115285 (= c!99295 (and ((_ is Cons!19307) (toList!6122 (getCurrentListMap!3355 (_keys!10710 thiss!1141) (_values!5781 thiss!1141) (mask!27573 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141)))) (= (_1!6768 (h!20471 (toList!6122 (getCurrentListMap!3355 (_keys!10710 thiss!1141) (_values!5781 thiss!1141) (mask!27573 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141))))) key!756)))))

(assert (=> d!115285 (= (getValueByKey!491 (toList!6122 (getCurrentListMap!3355 (_keys!10710 thiss!1141) (_values!5781 thiss!1141) (mask!27573 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141))) key!756) e!534919)))

(assert (= (and d!115285 c!99295) b!950055))

(assert (= (and d!115285 (not c!99295)) b!950056))

(assert (= (and b!950056 c!99296) b!950057))

(assert (= (and b!950056 (not c!99296)) b!950058))

(declare-fun m!883097 () Bool)

(assert (=> b!950057 m!883097))

(assert (=> b!949973 d!115285))

(declare-fun bm!41319 () Bool)

(declare-fun call!41322 () (_ BitVec 32))

(assert (=> bm!41319 (= call!41322 (arrayCountValidKeys!0 (_keys!10710 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28126 (_keys!10710 thiss!1141))))))

(declare-fun b!950067 () Bool)

(declare-fun e!534925 () (_ BitVec 32))

(assert (=> b!950067 (= e!534925 (bvadd #b00000000000000000000000000000001 call!41322))))

(declare-fun d!115287 () Bool)

(declare-fun lt!427785 () (_ BitVec 32))

(assert (=> d!115287 (and (bvsge lt!427785 #b00000000000000000000000000000000) (bvsle lt!427785 (bvsub (size!28126 (_keys!10710 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun e!534926 () (_ BitVec 32))

(assert (=> d!115287 (= lt!427785 e!534926)))

(declare-fun c!99302 () Bool)

(assert (=> d!115287 (= c!99302 (bvsge #b00000000000000000000000000000000 (size!28126 (_keys!10710 thiss!1141))))))

(assert (=> d!115287 (and (bvsle #b00000000000000000000000000000000 (size!28126 (_keys!10710 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!28126 (_keys!10710 thiss!1141)) (size!28126 (_keys!10710 thiss!1141))))))

(assert (=> d!115287 (= (arrayCountValidKeys!0 (_keys!10710 thiss!1141) #b00000000000000000000000000000000 (size!28126 (_keys!10710 thiss!1141))) lt!427785)))

(declare-fun b!950068 () Bool)

(assert (=> b!950068 (= e!534926 e!534925)))

(declare-fun c!99301 () Bool)

(assert (=> b!950068 (= c!99301 (validKeyInArray!0 (select (arr!27650 (_keys!10710 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!950069 () Bool)

(assert (=> b!950069 (= e!534926 #b00000000000000000000000000000000)))

(declare-fun b!950070 () Bool)

(assert (=> b!950070 (= e!534925 call!41322)))

(assert (= (and d!115287 c!99302) b!950069))

(assert (= (and d!115287 (not c!99302)) b!950068))

(assert (= (and b!950068 c!99301) b!950067))

(assert (= (and b!950068 (not c!99301)) b!950070))

(assert (= (or b!950067 b!950070) bm!41319))

(declare-fun m!883099 () Bool)

(assert (=> bm!41319 m!883099))

(assert (=> b!950068 m!883045))

(assert (=> b!950068 m!883045))

(assert (=> b!950068 m!883055))

(assert (=> b!949962 d!115287))

(declare-fun d!115289 () Bool)

(declare-fun e!534927 () Bool)

(assert (=> d!115289 e!534927))

(declare-fun res!636948 () Bool)

(assert (=> d!115289 (=> res!636948 e!534927)))

(declare-fun lt!427786 () Bool)

(assert (=> d!115289 (= res!636948 (not lt!427786))))

(declare-fun lt!427788 () Bool)

(assert (=> d!115289 (= lt!427786 lt!427788)))

(declare-fun lt!427787 () Unit!31946)

(declare-fun e!534928 () Unit!31946)

(assert (=> d!115289 (= lt!427787 e!534928)))

(declare-fun c!99303 () Bool)

(assert (=> d!115289 (= c!99303 lt!427788)))

(assert (=> d!115289 (= lt!427788 (containsKey!462 (toList!6122 lt!427779) (select (arr!27650 (_keys!10710 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!115289 (= (contains!5219 lt!427779 (select (arr!27650 (_keys!10710 thiss!1141)) #b00000000000000000000000000000000)) lt!427786)))

(declare-fun b!950071 () Bool)

(declare-fun lt!427789 () Unit!31946)

(assert (=> b!950071 (= e!534928 lt!427789)))

(assert (=> b!950071 (= lt!427789 (lemmaContainsKeyImpliesGetValueByKeyDefined!356 (toList!6122 lt!427779) (select (arr!27650 (_keys!10710 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!950071 (isDefined!364 (getValueByKey!491 (toList!6122 lt!427779) (select (arr!27650 (_keys!10710 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!950072 () Bool)

(declare-fun Unit!31950 () Unit!31946)

(assert (=> b!950072 (= e!534928 Unit!31950)))

(declare-fun b!950073 () Bool)

(assert (=> b!950073 (= e!534927 (isDefined!364 (getValueByKey!491 (toList!6122 lt!427779) (select (arr!27650 (_keys!10710 thiss!1141)) #b00000000000000000000000000000000))))))

(assert (= (and d!115289 c!99303) b!950071))

(assert (= (and d!115289 (not c!99303)) b!950072))

(assert (= (and d!115289 (not res!636948)) b!950073))

(assert (=> d!115289 m!883045))

(declare-fun m!883101 () Bool)

(assert (=> d!115289 m!883101))

(assert (=> b!950071 m!883045))

(declare-fun m!883103 () Bool)

(assert (=> b!950071 m!883103))

(assert (=> b!950071 m!883045))

(declare-fun m!883105 () Bool)

(assert (=> b!950071 m!883105))

(assert (=> b!950071 m!883105))

(declare-fun m!883107 () Bool)

(assert (=> b!950071 m!883107))

(assert (=> b!950073 m!883045))

(assert (=> b!950073 m!883105))

(assert (=> b!950073 m!883105))

(assert (=> b!950073 m!883107))

(assert (=> b!950022 d!115289))

(assert (=> d!115281 d!115273))

(declare-fun b!950085 () Bool)

(declare-fun e!534931 () Bool)

(assert (=> b!950085 (= e!534931 (and (bvsge (extraKeys!5490 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5490 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2508 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun b!950084 () Bool)

(declare-fun res!636960 () Bool)

(assert (=> b!950084 (=> (not res!636960) (not e!534931))))

(declare-fun size!28131 (LongMapFixedSize!4906) (_ BitVec 32))

(assert (=> b!950084 (= res!636960 (= (size!28131 thiss!1141) (bvadd (_size!2508 thiss!1141) (bvsdiv (bvadd (extraKeys!5490 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!115291 () Bool)

(declare-fun res!636958 () Bool)

(assert (=> d!115291 (=> (not res!636958) (not e!534931))))

(assert (=> d!115291 (= res!636958 (validMask!0 (mask!27573 thiss!1141)))))

(assert (=> d!115291 (= (simpleValid!370 thiss!1141) e!534931)))

(declare-fun b!950082 () Bool)

(declare-fun res!636957 () Bool)

(assert (=> b!950082 (=> (not res!636957) (not e!534931))))

(assert (=> b!950082 (= res!636957 (and (= (size!28125 (_values!5781 thiss!1141)) (bvadd (mask!27573 thiss!1141) #b00000000000000000000000000000001)) (= (size!28126 (_keys!10710 thiss!1141)) (size!28125 (_values!5781 thiss!1141))) (bvsge (_size!2508 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2508 thiss!1141) (bvadd (mask!27573 thiss!1141) #b00000000000000000000000000000001))))))

(declare-fun b!950083 () Bool)

(declare-fun res!636959 () Bool)

(assert (=> b!950083 (=> (not res!636959) (not e!534931))))

(assert (=> b!950083 (= res!636959 (bvsge (size!28131 thiss!1141) (_size!2508 thiss!1141)))))

(assert (= (and d!115291 res!636958) b!950082))

(assert (= (and b!950082 res!636957) b!950083))

(assert (= (and b!950083 res!636959) b!950084))

(assert (= (and b!950084 res!636960) b!950085))

(declare-fun m!883109 () Bool)

(assert (=> b!950084 m!883109))

(assert (=> d!115291 m!882975))

(assert (=> b!950083 m!883109))

(assert (=> d!115271 d!115291))

(declare-fun d!115293 () Bool)

(declare-fun get!14539 (Option!497) V!32591)

(assert (=> d!115293 (= (apply!883 lt!427778 lt!427780) (get!14539 (getValueByKey!491 (toList!6122 lt!427778) lt!427780)))))

(declare-fun bs!26689 () Bool)

(assert (= bs!26689 d!115293))

(declare-fun m!883111 () Bool)

(assert (=> bs!26689 m!883111))

(assert (=> bs!26689 m!883111))

(declare-fun m!883113 () Bool)

(assert (=> bs!26689 m!883113))

(assert (=> b!950036 d!115293))

(declare-fun d!115295 () Bool)

(declare-fun e!534934 () Bool)

(assert (=> d!115295 e!534934))

(declare-fun res!636966 () Bool)

(assert (=> d!115295 (=> (not res!636966) (not e!534934))))

(declare-fun lt!427801 () ListLongMap!12213)

(assert (=> d!115295 (= res!636966 (contains!5219 lt!427801 (_1!6768 (tuple2!13515 lt!427773 (zeroValue!5594 thiss!1141)))))))

(declare-fun lt!427798 () List!19311)

(assert (=> d!115295 (= lt!427801 (ListLongMap!12214 lt!427798))))

(declare-fun lt!427799 () Unit!31946)

(declare-fun lt!427800 () Unit!31946)

(assert (=> d!115295 (= lt!427799 lt!427800)))

(assert (=> d!115295 (= (getValueByKey!491 lt!427798 (_1!6768 (tuple2!13515 lt!427773 (zeroValue!5594 thiss!1141)))) (Some!496 (_2!6768 (tuple2!13515 lt!427773 (zeroValue!5594 thiss!1141)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!265 (List!19311 (_ BitVec 64) V!32591) Unit!31946)

(assert (=> d!115295 (= lt!427800 (lemmaContainsTupThenGetReturnValue!265 lt!427798 (_1!6768 (tuple2!13515 lt!427773 (zeroValue!5594 thiss!1141))) (_2!6768 (tuple2!13515 lt!427773 (zeroValue!5594 thiss!1141)))))))

(declare-fun insertStrictlySorted!322 (List!19311 (_ BitVec 64) V!32591) List!19311)

(assert (=> d!115295 (= lt!427798 (insertStrictlySorted!322 (toList!6122 lt!427771) (_1!6768 (tuple2!13515 lt!427773 (zeroValue!5594 thiss!1141))) (_2!6768 (tuple2!13515 lt!427773 (zeroValue!5594 thiss!1141)))))))

(assert (=> d!115295 (= (+!2869 lt!427771 (tuple2!13515 lt!427773 (zeroValue!5594 thiss!1141))) lt!427801)))

(declare-fun b!950090 () Bool)

(declare-fun res!636965 () Bool)

(assert (=> b!950090 (=> (not res!636965) (not e!534934))))

(assert (=> b!950090 (= res!636965 (= (getValueByKey!491 (toList!6122 lt!427801) (_1!6768 (tuple2!13515 lt!427773 (zeroValue!5594 thiss!1141)))) (Some!496 (_2!6768 (tuple2!13515 lt!427773 (zeroValue!5594 thiss!1141))))))))

(declare-fun b!950091 () Bool)

(declare-fun contains!5221 (List!19311 tuple2!13514) Bool)

(assert (=> b!950091 (= e!534934 (contains!5221 (toList!6122 lt!427801) (tuple2!13515 lt!427773 (zeroValue!5594 thiss!1141))))))

(assert (= (and d!115295 res!636966) b!950090))

(assert (= (and b!950090 res!636965) b!950091))

(declare-fun m!883115 () Bool)

(assert (=> d!115295 m!883115))

(declare-fun m!883117 () Bool)

(assert (=> d!115295 m!883117))

(declare-fun m!883119 () Bool)

(assert (=> d!115295 m!883119))

(declare-fun m!883121 () Bool)

(assert (=> d!115295 m!883121))

(declare-fun m!883123 () Bool)

(assert (=> b!950090 m!883123))

(declare-fun m!883125 () Bool)

(assert (=> b!950091 m!883125))

(assert (=> b!950036 d!115295))

(declare-fun d!115297 () Bool)

(assert (=> d!115297 (contains!5219 (+!2869 lt!427771 (tuple2!13515 lt!427773 (zeroValue!5594 thiss!1141))) lt!427772)))

(declare-fun lt!427804 () Unit!31946)

(declare-fun choose!1584 (ListLongMap!12213 (_ BitVec 64) V!32591 (_ BitVec 64)) Unit!31946)

(assert (=> d!115297 (= lt!427804 (choose!1584 lt!427771 lt!427773 (zeroValue!5594 thiss!1141) lt!427772))))

(assert (=> d!115297 (contains!5219 lt!427771 lt!427772)))

(assert (=> d!115297 (= (addStillContains!572 lt!427771 lt!427773 (zeroValue!5594 thiss!1141) lt!427772) lt!427804)))

(declare-fun bs!26690 () Bool)

(assert (= bs!26690 d!115297))

(assert (=> bs!26690 m!883081))

(assert (=> bs!26690 m!883081))

(assert (=> bs!26690 m!883083))

(declare-fun m!883127 () Bool)

(assert (=> bs!26690 m!883127))

(declare-fun m!883129 () Bool)

(assert (=> bs!26690 m!883129))

(assert (=> b!950036 d!115297))

(declare-fun d!115299 () Bool)

(declare-fun e!534935 () Bool)

(assert (=> d!115299 e!534935))

(declare-fun res!636968 () Bool)

(assert (=> d!115299 (=> (not res!636968) (not e!534935))))

(declare-fun lt!427808 () ListLongMap!12213)

(assert (=> d!115299 (= res!636968 (contains!5219 lt!427808 (_1!6768 (tuple2!13515 lt!427776 (minValue!5594 thiss!1141)))))))

(declare-fun lt!427805 () List!19311)

(assert (=> d!115299 (= lt!427808 (ListLongMap!12214 lt!427805))))

(declare-fun lt!427806 () Unit!31946)

(declare-fun lt!427807 () Unit!31946)

(assert (=> d!115299 (= lt!427806 lt!427807)))

(assert (=> d!115299 (= (getValueByKey!491 lt!427805 (_1!6768 (tuple2!13515 lt!427776 (minValue!5594 thiss!1141)))) (Some!496 (_2!6768 (tuple2!13515 lt!427776 (minValue!5594 thiss!1141)))))))

(assert (=> d!115299 (= lt!427807 (lemmaContainsTupThenGetReturnValue!265 lt!427805 (_1!6768 (tuple2!13515 lt!427776 (minValue!5594 thiss!1141))) (_2!6768 (tuple2!13515 lt!427776 (minValue!5594 thiss!1141)))))))

(assert (=> d!115299 (= lt!427805 (insertStrictlySorted!322 (toList!6122 lt!427778) (_1!6768 (tuple2!13515 lt!427776 (minValue!5594 thiss!1141))) (_2!6768 (tuple2!13515 lt!427776 (minValue!5594 thiss!1141)))))))

(assert (=> d!115299 (= (+!2869 lt!427778 (tuple2!13515 lt!427776 (minValue!5594 thiss!1141))) lt!427808)))

(declare-fun b!950093 () Bool)

(declare-fun res!636967 () Bool)

(assert (=> b!950093 (=> (not res!636967) (not e!534935))))

(assert (=> b!950093 (= res!636967 (= (getValueByKey!491 (toList!6122 lt!427808) (_1!6768 (tuple2!13515 lt!427776 (minValue!5594 thiss!1141)))) (Some!496 (_2!6768 (tuple2!13515 lt!427776 (minValue!5594 thiss!1141))))))))

(declare-fun b!950094 () Bool)

(assert (=> b!950094 (= e!534935 (contains!5221 (toList!6122 lt!427808) (tuple2!13515 lt!427776 (minValue!5594 thiss!1141))))))

(assert (= (and d!115299 res!636968) b!950093))

(assert (= (and b!950093 res!636967) b!950094))

(declare-fun m!883131 () Bool)

(assert (=> d!115299 m!883131))

(declare-fun m!883133 () Bool)

(assert (=> d!115299 m!883133))

(declare-fun m!883135 () Bool)

(assert (=> d!115299 m!883135))

(declare-fun m!883137 () Bool)

(assert (=> d!115299 m!883137))

(declare-fun m!883139 () Bool)

(assert (=> b!950093 m!883139))

(declare-fun m!883141 () Bool)

(assert (=> b!950094 m!883141))

(assert (=> b!950036 d!115299))

(declare-fun d!115301 () Bool)

(assert (=> d!115301 (= (apply!883 (+!2869 lt!427778 (tuple2!13515 lt!427776 (minValue!5594 thiss!1141))) lt!427780) (apply!883 lt!427778 lt!427780))))

(declare-fun lt!427811 () Unit!31946)

(declare-fun choose!1585 (ListLongMap!12213 (_ BitVec 64) V!32591 (_ BitVec 64)) Unit!31946)

(assert (=> d!115301 (= lt!427811 (choose!1585 lt!427778 lt!427776 (minValue!5594 thiss!1141) lt!427780))))

(declare-fun e!534938 () Bool)

(assert (=> d!115301 e!534938))

(declare-fun res!636971 () Bool)

(assert (=> d!115301 (=> (not res!636971) (not e!534938))))

(assert (=> d!115301 (= res!636971 (contains!5219 lt!427778 lt!427780))))

(assert (=> d!115301 (= (addApplyDifferent!453 lt!427778 lt!427776 (minValue!5594 thiss!1141) lt!427780) lt!427811)))

(declare-fun b!950098 () Bool)

(assert (=> b!950098 (= e!534938 (not (= lt!427780 lt!427776)))))

(assert (= (and d!115301 res!636971) b!950098))

(declare-fun m!883143 () Bool)

(assert (=> d!115301 m!883143))

(assert (=> d!115301 m!883069))

(assert (=> d!115301 m!883061))

(assert (=> d!115301 m!883069))

(assert (=> d!115301 m!883073))

(declare-fun m!883145 () Bool)

(assert (=> d!115301 m!883145))

(assert (=> b!950036 d!115301))

(declare-fun d!115303 () Bool)

(assert (=> d!115303 (= (apply!883 (+!2869 lt!427765 (tuple2!13515 lt!427766 (zeroValue!5594 thiss!1141))) lt!427767) (apply!883 lt!427765 lt!427767))))

(declare-fun lt!427812 () Unit!31946)

(assert (=> d!115303 (= lt!427812 (choose!1585 lt!427765 lt!427766 (zeroValue!5594 thiss!1141) lt!427767))))

(declare-fun e!534939 () Bool)

(assert (=> d!115303 e!534939))

(declare-fun res!636972 () Bool)

(assert (=> d!115303 (=> (not res!636972) (not e!534939))))

(assert (=> d!115303 (= res!636972 (contains!5219 lt!427765 lt!427767))))

(assert (=> d!115303 (= (addApplyDifferent!453 lt!427765 lt!427766 (zeroValue!5594 thiss!1141) lt!427767) lt!427812)))

(declare-fun b!950099 () Bool)

(assert (=> b!950099 (= e!534939 (not (= lt!427767 lt!427766)))))

(assert (= (and d!115303 res!636972) b!950099))

(declare-fun m!883147 () Bool)

(assert (=> d!115303 m!883147))

(assert (=> d!115303 m!883059))

(assert (=> d!115303 m!883065))

(assert (=> d!115303 m!883059))

(assert (=> d!115303 m!883089))

(declare-fun m!883149 () Bool)

(assert (=> d!115303 m!883149))

(assert (=> b!950036 d!115303))

(declare-fun d!115305 () Bool)

(assert (=> d!115305 (= (apply!883 (+!2869 lt!427774 (tuple2!13515 lt!427761 (minValue!5594 thiss!1141))) lt!427781) (apply!883 lt!427774 lt!427781))))

(declare-fun lt!427813 () Unit!31946)

(assert (=> d!115305 (= lt!427813 (choose!1585 lt!427774 lt!427761 (minValue!5594 thiss!1141) lt!427781))))

(declare-fun e!534940 () Bool)

(assert (=> d!115305 e!534940))

(declare-fun res!636973 () Bool)

(assert (=> d!115305 (=> (not res!636973) (not e!534940))))

(assert (=> d!115305 (= res!636973 (contains!5219 lt!427774 lt!427781))))

(assert (=> d!115305 (= (addApplyDifferent!453 lt!427774 lt!427761 (minValue!5594 thiss!1141) lt!427781) lt!427813)))

(declare-fun b!950100 () Bool)

(assert (=> b!950100 (= e!534940 (not (= lt!427781 lt!427761)))))

(assert (= (and d!115305 res!636973) b!950100))

(declare-fun m!883151 () Bool)

(assert (=> d!115305 m!883151))

(assert (=> d!115305 m!883077))

(assert (=> d!115305 m!883067))

(assert (=> d!115305 m!883077))

(assert (=> d!115305 m!883079))

(declare-fun m!883153 () Bool)

(assert (=> d!115305 m!883153))

(assert (=> b!950036 d!115305))

(declare-fun d!115307 () Bool)

(assert (=> d!115307 (= (apply!883 (+!2869 lt!427765 (tuple2!13515 lt!427766 (zeroValue!5594 thiss!1141))) lt!427767) (get!14539 (getValueByKey!491 (toList!6122 (+!2869 lt!427765 (tuple2!13515 lt!427766 (zeroValue!5594 thiss!1141)))) lt!427767)))))

(declare-fun bs!26691 () Bool)

(assert (= bs!26691 d!115307))

(declare-fun m!883155 () Bool)

(assert (=> bs!26691 m!883155))

(assert (=> bs!26691 m!883155))

(declare-fun m!883157 () Bool)

(assert (=> bs!26691 m!883157))

(assert (=> b!950036 d!115307))

(declare-fun b!950125 () Bool)

(declare-fun res!636982 () Bool)

(declare-fun e!534955 () Bool)

(assert (=> b!950125 (=> (not res!636982) (not e!534955))))

(declare-fun lt!427834 () ListLongMap!12213)

(assert (=> b!950125 (= res!636982 (not (contains!5219 lt!427834 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!950126 () Bool)

(declare-fun e!534959 () Bool)

(declare-fun isEmpty!715 (ListLongMap!12213) Bool)

(assert (=> b!950126 (= e!534959 (isEmpty!715 lt!427834))))

(declare-fun b!950127 () Bool)

(declare-fun e!534961 () Bool)

(assert (=> b!950127 (= e!534955 e!534961)))

(declare-fun c!99312 () Bool)

(declare-fun e!534960 () Bool)

(assert (=> b!950127 (= c!99312 e!534960)))

(declare-fun res!636985 () Bool)

(assert (=> b!950127 (=> (not res!636985) (not e!534960))))

(assert (=> b!950127 (= res!636985 (bvslt #b00000000000000000000000000000000 (size!28126 (_keys!10710 thiss!1141))))))

(declare-fun b!950128 () Bool)

(assert (=> b!950128 (= e!534960 (validKeyInArray!0 (select (arr!27650 (_keys!10710 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!950128 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!950129 () Bool)

(assert (=> b!950129 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28126 (_keys!10710 thiss!1141))))))

(assert (=> b!950129 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28125 (_values!5781 thiss!1141))))))

(declare-fun e!534957 () Bool)

(assert (=> b!950129 (= e!534957 (= (apply!883 lt!427834 (select (arr!27650 (_keys!10710 thiss!1141)) #b00000000000000000000000000000000)) (get!14538 (select (arr!27649 (_values!5781 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1666 (defaultEntry!5758 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!950130 () Bool)

(declare-fun e!534958 () ListLongMap!12213)

(assert (=> b!950130 (= e!534958 (ListLongMap!12214 Nil!19308))))

(declare-fun bm!41322 () Bool)

(declare-fun call!41325 () ListLongMap!12213)

(assert (=> bm!41322 (= call!41325 (getCurrentListMapNoExtraKeys!3357 (_keys!10710 thiss!1141) (_values!5781 thiss!1141) (mask!27573 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5758 thiss!1141)))))

(declare-fun b!950131 () Bool)

(declare-fun e!534956 () ListLongMap!12213)

(assert (=> b!950131 (= e!534956 call!41325)))

(declare-fun b!950132 () Bool)

(assert (=> b!950132 (= e!534961 e!534957)))

(assert (=> b!950132 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28126 (_keys!10710 thiss!1141))))))

(declare-fun res!636984 () Bool)

(assert (=> b!950132 (= res!636984 (contains!5219 lt!427834 (select (arr!27650 (_keys!10710 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!950132 (=> (not res!636984) (not e!534957))))

(declare-fun d!115309 () Bool)

(assert (=> d!115309 e!534955))

(declare-fun res!636983 () Bool)

(assert (=> d!115309 (=> (not res!636983) (not e!534955))))

(assert (=> d!115309 (= res!636983 (not (contains!5219 lt!427834 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!115309 (= lt!427834 e!534958)))

(declare-fun c!99314 () Bool)

(assert (=> d!115309 (= c!99314 (bvsge #b00000000000000000000000000000000 (size!28126 (_keys!10710 thiss!1141))))))

(assert (=> d!115309 (validMask!0 (mask!27573 thiss!1141))))

(assert (=> d!115309 (= (getCurrentListMapNoExtraKeys!3357 (_keys!10710 thiss!1141) (_values!5781 thiss!1141) (mask!27573 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141)) lt!427834)))

(declare-fun b!950133 () Bool)

(assert (=> b!950133 (= e!534961 e!534959)))

(declare-fun c!99315 () Bool)

(assert (=> b!950133 (= c!99315 (bvslt #b00000000000000000000000000000000 (size!28126 (_keys!10710 thiss!1141))))))

(declare-fun b!950134 () Bool)

(declare-fun lt!427828 () Unit!31946)

(declare-fun lt!427829 () Unit!31946)

(assert (=> b!950134 (= lt!427828 lt!427829)))

(declare-fun lt!427833 () (_ BitVec 64))

(declare-fun lt!427830 () ListLongMap!12213)

(declare-fun lt!427832 () V!32591)

(declare-fun lt!427831 () (_ BitVec 64))

(assert (=> b!950134 (not (contains!5219 (+!2869 lt!427830 (tuple2!13515 lt!427833 lt!427832)) lt!427831))))

(declare-fun addStillNotContains!227 (ListLongMap!12213 (_ BitVec 64) V!32591 (_ BitVec 64)) Unit!31946)

(assert (=> b!950134 (= lt!427829 (addStillNotContains!227 lt!427830 lt!427833 lt!427832 lt!427831))))

(assert (=> b!950134 (= lt!427831 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!950134 (= lt!427832 (get!14538 (select (arr!27649 (_values!5781 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1666 (defaultEntry!5758 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!950134 (= lt!427833 (select (arr!27650 (_keys!10710 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!950134 (= lt!427830 call!41325)))

(assert (=> b!950134 (= e!534956 (+!2869 call!41325 (tuple2!13515 (select (arr!27650 (_keys!10710 thiss!1141)) #b00000000000000000000000000000000) (get!14538 (select (arr!27649 (_values!5781 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1666 (defaultEntry!5758 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!950135 () Bool)

(assert (=> b!950135 (= e!534959 (= lt!427834 (getCurrentListMapNoExtraKeys!3357 (_keys!10710 thiss!1141) (_values!5781 thiss!1141) (mask!27573 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5758 thiss!1141))))))

(declare-fun b!950136 () Bool)

(assert (=> b!950136 (= e!534958 e!534956)))

(declare-fun c!99313 () Bool)

(assert (=> b!950136 (= c!99313 (validKeyInArray!0 (select (arr!27650 (_keys!10710 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!115309 c!99314) b!950130))

(assert (= (and d!115309 (not c!99314)) b!950136))

(assert (= (and b!950136 c!99313) b!950134))

(assert (= (and b!950136 (not c!99313)) b!950131))

(assert (= (or b!950134 b!950131) bm!41322))

(assert (= (and d!115309 res!636983) b!950125))

(assert (= (and b!950125 res!636982) b!950127))

(assert (= (and b!950127 res!636985) b!950128))

(assert (= (and b!950127 c!99312) b!950132))

(assert (= (and b!950127 (not c!99312)) b!950133))

(assert (= (and b!950132 res!636984) b!950129))

(assert (= (and b!950133 c!99315) b!950135))

(assert (= (and b!950133 (not c!99315)) b!950126))

(declare-fun b_lambda!14353 () Bool)

(assert (=> (not b_lambda!14353) (not b!950129)))

(assert (=> b!950129 t!27637))

(declare-fun b_and!29669 () Bool)

(assert (= b_and!29667 (and (=> t!27637 result!12263) b_and!29669)))

(declare-fun b_lambda!14355 () Bool)

(assert (=> (not b_lambda!14355) (not b!950134)))

(assert (=> b!950134 t!27637))

(declare-fun b_and!29671 () Bool)

(assert (= b_and!29669 (and (=> t!27637 result!12263) b_and!29671)))

(declare-fun m!883159 () Bool)

(assert (=> b!950125 m!883159))

(assert (=> b!950128 m!883045))

(assert (=> b!950128 m!883045))

(assert (=> b!950128 m!883055))

(assert (=> b!950132 m!883045))

(assert (=> b!950132 m!883045))

(declare-fun m!883161 () Bool)

(assert (=> b!950132 m!883161))

(declare-fun m!883163 () Bool)

(assert (=> b!950126 m!883163))

(declare-fun m!883165 () Bool)

(assert (=> b!950135 m!883165))

(assert (=> b!950136 m!883045))

(assert (=> b!950136 m!883045))

(assert (=> b!950136 m!883055))

(assert (=> b!950129 m!883045))

(assert (=> b!950129 m!883051))

(assert (=> b!950129 m!883051))

(assert (=> b!950129 m!883049))

(assert (=> b!950129 m!883053))

(assert (=> b!950129 m!883045))

(declare-fun m!883167 () Bool)

(assert (=> b!950129 m!883167))

(assert (=> b!950129 m!883049))

(assert (=> bm!41322 m!883165))

(assert (=> b!950134 m!883045))

(declare-fun m!883169 () Bool)

(assert (=> b!950134 m!883169))

(declare-fun m!883171 () Bool)

(assert (=> b!950134 m!883171))

(assert (=> b!950134 m!883051))

(assert (=> b!950134 m!883049))

(assert (=> b!950134 m!883053))

(assert (=> b!950134 m!883049))

(declare-fun m!883173 () Bool)

(assert (=> b!950134 m!883173))

(assert (=> b!950134 m!883051))

(assert (=> b!950134 m!883171))

(declare-fun m!883175 () Bool)

(assert (=> b!950134 m!883175))

(declare-fun m!883177 () Bool)

(assert (=> d!115309 m!883177))

(assert (=> d!115309 m!882975))

(assert (=> b!950036 d!115309))

(declare-fun d!115311 () Bool)

(assert (=> d!115311 (= (apply!883 lt!427774 lt!427781) (get!14539 (getValueByKey!491 (toList!6122 lt!427774) lt!427781)))))

(declare-fun bs!26692 () Bool)

(assert (= bs!26692 d!115311))

(declare-fun m!883179 () Bool)

(assert (=> bs!26692 m!883179))

(assert (=> bs!26692 m!883179))

(declare-fun m!883181 () Bool)

(assert (=> bs!26692 m!883181))

(assert (=> b!950036 d!115311))

(declare-fun d!115313 () Bool)

(assert (=> d!115313 (= (apply!883 (+!2869 lt!427774 (tuple2!13515 lt!427761 (minValue!5594 thiss!1141))) lt!427781) (get!14539 (getValueByKey!491 (toList!6122 (+!2869 lt!427774 (tuple2!13515 lt!427761 (minValue!5594 thiss!1141)))) lt!427781)))))

(declare-fun bs!26693 () Bool)

(assert (= bs!26693 d!115313))

(declare-fun m!883183 () Bool)

(assert (=> bs!26693 m!883183))

(assert (=> bs!26693 m!883183))

(declare-fun m!883185 () Bool)

(assert (=> bs!26693 m!883185))

(assert (=> b!950036 d!115313))

(declare-fun d!115315 () Bool)

(assert (=> d!115315 (= (apply!883 (+!2869 lt!427778 (tuple2!13515 lt!427776 (minValue!5594 thiss!1141))) lt!427780) (get!14539 (getValueByKey!491 (toList!6122 (+!2869 lt!427778 (tuple2!13515 lt!427776 (minValue!5594 thiss!1141)))) lt!427780)))))

(declare-fun bs!26694 () Bool)

(assert (= bs!26694 d!115315))

(declare-fun m!883187 () Bool)

(assert (=> bs!26694 m!883187))

(assert (=> bs!26694 m!883187))

(declare-fun m!883189 () Bool)

(assert (=> bs!26694 m!883189))

(assert (=> b!950036 d!115315))

(declare-fun d!115317 () Bool)

(declare-fun e!534962 () Bool)

(assert (=> d!115317 e!534962))

(declare-fun res!636987 () Bool)

(assert (=> d!115317 (=> (not res!636987) (not e!534962))))

(declare-fun lt!427838 () ListLongMap!12213)

(assert (=> d!115317 (= res!636987 (contains!5219 lt!427838 (_1!6768 (tuple2!13515 lt!427766 (zeroValue!5594 thiss!1141)))))))

(declare-fun lt!427835 () List!19311)

(assert (=> d!115317 (= lt!427838 (ListLongMap!12214 lt!427835))))

(declare-fun lt!427836 () Unit!31946)

(declare-fun lt!427837 () Unit!31946)

(assert (=> d!115317 (= lt!427836 lt!427837)))

(assert (=> d!115317 (= (getValueByKey!491 lt!427835 (_1!6768 (tuple2!13515 lt!427766 (zeroValue!5594 thiss!1141)))) (Some!496 (_2!6768 (tuple2!13515 lt!427766 (zeroValue!5594 thiss!1141)))))))

(assert (=> d!115317 (= lt!427837 (lemmaContainsTupThenGetReturnValue!265 lt!427835 (_1!6768 (tuple2!13515 lt!427766 (zeroValue!5594 thiss!1141))) (_2!6768 (tuple2!13515 lt!427766 (zeroValue!5594 thiss!1141)))))))

(assert (=> d!115317 (= lt!427835 (insertStrictlySorted!322 (toList!6122 lt!427765) (_1!6768 (tuple2!13515 lt!427766 (zeroValue!5594 thiss!1141))) (_2!6768 (tuple2!13515 lt!427766 (zeroValue!5594 thiss!1141)))))))

(assert (=> d!115317 (= (+!2869 lt!427765 (tuple2!13515 lt!427766 (zeroValue!5594 thiss!1141))) lt!427838)))

(declare-fun b!950137 () Bool)

(declare-fun res!636986 () Bool)

(assert (=> b!950137 (=> (not res!636986) (not e!534962))))

(assert (=> b!950137 (= res!636986 (= (getValueByKey!491 (toList!6122 lt!427838) (_1!6768 (tuple2!13515 lt!427766 (zeroValue!5594 thiss!1141)))) (Some!496 (_2!6768 (tuple2!13515 lt!427766 (zeroValue!5594 thiss!1141))))))))

(declare-fun b!950138 () Bool)

(assert (=> b!950138 (= e!534962 (contains!5221 (toList!6122 lt!427838) (tuple2!13515 lt!427766 (zeroValue!5594 thiss!1141))))))

(assert (= (and d!115317 res!636987) b!950137))

(assert (= (and b!950137 res!636986) b!950138))

(declare-fun m!883191 () Bool)

(assert (=> d!115317 m!883191))

(declare-fun m!883193 () Bool)

(assert (=> d!115317 m!883193))

(declare-fun m!883195 () Bool)

(assert (=> d!115317 m!883195))

(declare-fun m!883197 () Bool)

(assert (=> d!115317 m!883197))

(declare-fun m!883199 () Bool)

(assert (=> b!950137 m!883199))

(declare-fun m!883201 () Bool)

(assert (=> b!950138 m!883201))

(assert (=> b!950036 d!115317))

(declare-fun d!115319 () Bool)

(declare-fun e!534963 () Bool)

(assert (=> d!115319 e!534963))

(declare-fun res!636988 () Bool)

(assert (=> d!115319 (=> res!636988 e!534963)))

(declare-fun lt!427839 () Bool)

(assert (=> d!115319 (= res!636988 (not lt!427839))))

(declare-fun lt!427841 () Bool)

(assert (=> d!115319 (= lt!427839 lt!427841)))

(declare-fun lt!427840 () Unit!31946)

(declare-fun e!534964 () Unit!31946)

(assert (=> d!115319 (= lt!427840 e!534964)))

(declare-fun c!99316 () Bool)

(assert (=> d!115319 (= c!99316 lt!427841)))

(assert (=> d!115319 (= lt!427841 (containsKey!462 (toList!6122 (+!2869 lt!427771 (tuple2!13515 lt!427773 (zeroValue!5594 thiss!1141)))) lt!427772))))

(assert (=> d!115319 (= (contains!5219 (+!2869 lt!427771 (tuple2!13515 lt!427773 (zeroValue!5594 thiss!1141))) lt!427772) lt!427839)))

(declare-fun b!950139 () Bool)

(declare-fun lt!427842 () Unit!31946)

(assert (=> b!950139 (= e!534964 lt!427842)))

(assert (=> b!950139 (= lt!427842 (lemmaContainsKeyImpliesGetValueByKeyDefined!356 (toList!6122 (+!2869 lt!427771 (tuple2!13515 lt!427773 (zeroValue!5594 thiss!1141)))) lt!427772))))

(assert (=> b!950139 (isDefined!364 (getValueByKey!491 (toList!6122 (+!2869 lt!427771 (tuple2!13515 lt!427773 (zeroValue!5594 thiss!1141)))) lt!427772))))

(declare-fun b!950140 () Bool)

(declare-fun Unit!31951 () Unit!31946)

(assert (=> b!950140 (= e!534964 Unit!31951)))

(declare-fun b!950141 () Bool)

(assert (=> b!950141 (= e!534963 (isDefined!364 (getValueByKey!491 (toList!6122 (+!2869 lt!427771 (tuple2!13515 lt!427773 (zeroValue!5594 thiss!1141)))) lt!427772)))))

(assert (= (and d!115319 c!99316) b!950139))

(assert (= (and d!115319 (not c!99316)) b!950140))

(assert (= (and d!115319 (not res!636988)) b!950141))

(declare-fun m!883203 () Bool)

(assert (=> d!115319 m!883203))

(declare-fun m!883205 () Bool)

(assert (=> b!950139 m!883205))

(declare-fun m!883207 () Bool)

(assert (=> b!950139 m!883207))

(assert (=> b!950139 m!883207))

(declare-fun m!883209 () Bool)

(assert (=> b!950139 m!883209))

(assert (=> b!950141 m!883207))

(assert (=> b!950141 m!883207))

(assert (=> b!950141 m!883209))

(assert (=> b!950036 d!115319))

(declare-fun d!115321 () Bool)

(declare-fun e!534965 () Bool)

(assert (=> d!115321 e!534965))

(declare-fun res!636990 () Bool)

(assert (=> d!115321 (=> (not res!636990) (not e!534965))))

(declare-fun lt!427846 () ListLongMap!12213)

(assert (=> d!115321 (= res!636990 (contains!5219 lt!427846 (_1!6768 (tuple2!13515 lt!427761 (minValue!5594 thiss!1141)))))))

(declare-fun lt!427843 () List!19311)

(assert (=> d!115321 (= lt!427846 (ListLongMap!12214 lt!427843))))

(declare-fun lt!427844 () Unit!31946)

(declare-fun lt!427845 () Unit!31946)

(assert (=> d!115321 (= lt!427844 lt!427845)))

(assert (=> d!115321 (= (getValueByKey!491 lt!427843 (_1!6768 (tuple2!13515 lt!427761 (minValue!5594 thiss!1141)))) (Some!496 (_2!6768 (tuple2!13515 lt!427761 (minValue!5594 thiss!1141)))))))

(assert (=> d!115321 (= lt!427845 (lemmaContainsTupThenGetReturnValue!265 lt!427843 (_1!6768 (tuple2!13515 lt!427761 (minValue!5594 thiss!1141))) (_2!6768 (tuple2!13515 lt!427761 (minValue!5594 thiss!1141)))))))

(assert (=> d!115321 (= lt!427843 (insertStrictlySorted!322 (toList!6122 lt!427774) (_1!6768 (tuple2!13515 lt!427761 (minValue!5594 thiss!1141))) (_2!6768 (tuple2!13515 lt!427761 (minValue!5594 thiss!1141)))))))

(assert (=> d!115321 (= (+!2869 lt!427774 (tuple2!13515 lt!427761 (minValue!5594 thiss!1141))) lt!427846)))

(declare-fun b!950142 () Bool)

(declare-fun res!636989 () Bool)

(assert (=> b!950142 (=> (not res!636989) (not e!534965))))

(assert (=> b!950142 (= res!636989 (= (getValueByKey!491 (toList!6122 lt!427846) (_1!6768 (tuple2!13515 lt!427761 (minValue!5594 thiss!1141)))) (Some!496 (_2!6768 (tuple2!13515 lt!427761 (minValue!5594 thiss!1141))))))))

(declare-fun b!950143 () Bool)

(assert (=> b!950143 (= e!534965 (contains!5221 (toList!6122 lt!427846) (tuple2!13515 lt!427761 (minValue!5594 thiss!1141))))))

(assert (= (and d!115321 res!636990) b!950142))

(assert (= (and b!950142 res!636989) b!950143))

(declare-fun m!883211 () Bool)

(assert (=> d!115321 m!883211))

(declare-fun m!883213 () Bool)

(assert (=> d!115321 m!883213))

(declare-fun m!883215 () Bool)

(assert (=> d!115321 m!883215))

(declare-fun m!883217 () Bool)

(assert (=> d!115321 m!883217))

(declare-fun m!883219 () Bool)

(assert (=> b!950142 m!883219))

(declare-fun m!883221 () Bool)

(assert (=> b!950143 m!883221))

(assert (=> b!950036 d!115321))

(declare-fun d!115323 () Bool)

(assert (=> d!115323 (= (apply!883 lt!427765 lt!427767) (get!14539 (getValueByKey!491 (toList!6122 lt!427765) lt!427767)))))

(declare-fun bs!26695 () Bool)

(assert (= bs!26695 d!115323))

(declare-fun m!883223 () Bool)

(assert (=> bs!26695 m!883223))

(assert (=> bs!26695 m!883223))

(declare-fun m!883225 () Bool)

(assert (=> bs!26695 m!883225))

(assert (=> b!950036 d!115323))

(declare-fun d!115325 () Bool)

(assert (=> d!115325 (isDefined!364 (getValueByKey!491 (toList!6122 (getCurrentListMap!3355 (_keys!10710 thiss!1141) (_values!5781 thiss!1141) (mask!27573 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141))) key!756))))

(declare-fun lt!427849 () Unit!31946)

(declare-fun choose!1586 (List!19311 (_ BitVec 64)) Unit!31946)

(assert (=> d!115325 (= lt!427849 (choose!1586 (toList!6122 (getCurrentListMap!3355 (_keys!10710 thiss!1141) (_values!5781 thiss!1141) (mask!27573 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141))) key!756))))

(declare-fun e!534968 () Bool)

(assert (=> d!115325 e!534968))

(declare-fun res!636993 () Bool)

(assert (=> d!115325 (=> (not res!636993) (not e!534968))))

(declare-fun isStrictlySorted!498 (List!19311) Bool)

(assert (=> d!115325 (= res!636993 (isStrictlySorted!498 (toList!6122 (getCurrentListMap!3355 (_keys!10710 thiss!1141) (_values!5781 thiss!1141) (mask!27573 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141)))))))

(assert (=> d!115325 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!356 (toList!6122 (getCurrentListMap!3355 (_keys!10710 thiss!1141) (_values!5781 thiss!1141) (mask!27573 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141))) key!756) lt!427849)))

(declare-fun b!950146 () Bool)

(assert (=> b!950146 (= e!534968 (containsKey!462 (toList!6122 (getCurrentListMap!3355 (_keys!10710 thiss!1141) (_values!5781 thiss!1141) (mask!27573 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141))) key!756))))

(assert (= (and d!115325 res!636993) b!950146))

(assert (=> d!115325 m!883031))

(assert (=> d!115325 m!883031))

(assert (=> d!115325 m!883033))

(declare-fun m!883227 () Bool)

(assert (=> d!115325 m!883227))

(declare-fun m!883229 () Bool)

(assert (=> d!115325 m!883229))

(assert (=> b!950146 m!883027))

(assert (=> b!949971 d!115325))

(assert (=> b!949971 d!115283))

(assert (=> b!949971 d!115285))

(declare-fun d!115327 () Bool)

(assert (=> d!115327 (= (apply!883 lt!427779 (select (arr!27650 (_keys!10710 thiss!1141)) #b00000000000000000000000000000000)) (get!14539 (getValueByKey!491 (toList!6122 lt!427779) (select (arr!27650 (_keys!10710 thiss!1141)) #b00000000000000000000000000000000))))))

(declare-fun bs!26696 () Bool)

(assert (= bs!26696 d!115327))

(assert (=> bs!26696 m!883045))

(assert (=> bs!26696 m!883105))

(assert (=> bs!26696 m!883105))

(declare-fun m!883231 () Bool)

(assert (=> bs!26696 m!883231))

(assert (=> b!950029 d!115327))

(declare-fun d!115329 () Bool)

(declare-fun c!99319 () Bool)

(assert (=> d!115329 (= c!99319 ((_ is ValueCellFull!9878) (select (arr!27649 (_values!5781 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun e!534971 () V!32591)

(assert (=> d!115329 (= (get!14538 (select (arr!27649 (_values!5781 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1666 (defaultEntry!5758 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)) e!534971)))

(declare-fun b!950151 () Bool)

(declare-fun get!14540 (ValueCell!9878 V!32591) V!32591)

(assert (=> b!950151 (= e!534971 (get!14540 (select (arr!27649 (_values!5781 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1666 (defaultEntry!5758 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!950152 () Bool)

(declare-fun get!14541 (ValueCell!9878 V!32591) V!32591)

(assert (=> b!950152 (= e!534971 (get!14541 (select (arr!27649 (_values!5781 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1666 (defaultEntry!5758 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!115329 c!99319) b!950151))

(assert (= (and d!115329 (not c!99319)) b!950152))

(assert (=> b!950151 m!883051))

(assert (=> b!950151 m!883049))

(declare-fun m!883233 () Bool)

(assert (=> b!950151 m!883233))

(assert (=> b!950152 m!883051))

(assert (=> b!950152 m!883049))

(declare-fun m!883235 () Bool)

(assert (=> b!950152 m!883235))

(assert (=> b!950029 d!115329))

(declare-fun b!950163 () Bool)

(declare-fun e!534980 () Bool)

(declare-fun call!41328 () Bool)

(assert (=> b!950163 (= e!534980 call!41328)))

(declare-fun b!950164 () Bool)

(assert (=> b!950164 (= e!534980 call!41328)))

(declare-fun b!950166 () Bool)

(declare-fun e!534981 () Bool)

(declare-fun contains!5222 (List!19313 (_ BitVec 64)) Bool)

(assert (=> b!950166 (= e!534981 (contains!5222 Nil!19310 (select (arr!27650 (_keys!10710 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41325 () Bool)

(declare-fun c!99322 () Bool)

(assert (=> bm!41325 (= call!41328 (arrayNoDuplicates!0 (_keys!10710 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!99322 (Cons!19309 (select (arr!27650 (_keys!10710 thiss!1141)) #b00000000000000000000000000000000) Nil!19310) Nil!19310)))))

(declare-fun b!950167 () Bool)

(declare-fun e!534982 () Bool)

(assert (=> b!950167 (= e!534982 e!534980)))

(assert (=> b!950167 (= c!99322 (validKeyInArray!0 (select (arr!27650 (_keys!10710 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!950165 () Bool)

(declare-fun e!534983 () Bool)

(assert (=> b!950165 (= e!534983 e!534982)))

(declare-fun res!637000 () Bool)

(assert (=> b!950165 (=> (not res!637000) (not e!534982))))

(assert (=> b!950165 (= res!637000 (not e!534981))))

(declare-fun res!637002 () Bool)

(assert (=> b!950165 (=> (not res!637002) (not e!534981))))

(assert (=> b!950165 (= res!637002 (validKeyInArray!0 (select (arr!27650 (_keys!10710 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!115331 () Bool)

(declare-fun res!637001 () Bool)

(assert (=> d!115331 (=> res!637001 e!534983)))

(assert (=> d!115331 (= res!637001 (bvsge #b00000000000000000000000000000000 (size!28126 (_keys!10710 thiss!1141))))))

(assert (=> d!115331 (= (arrayNoDuplicates!0 (_keys!10710 thiss!1141) #b00000000000000000000000000000000 Nil!19310) e!534983)))

(assert (= (and d!115331 (not res!637001)) b!950165))

(assert (= (and b!950165 res!637002) b!950166))

(assert (= (and b!950165 res!637000) b!950167))

(assert (= (and b!950167 c!99322) b!950163))

(assert (= (and b!950167 (not c!99322)) b!950164))

(assert (= (or b!950163 b!950164) bm!41325))

(assert (=> b!950166 m!883045))

(assert (=> b!950166 m!883045))

(declare-fun m!883237 () Bool)

(assert (=> b!950166 m!883237))

(assert (=> bm!41325 m!883045))

(declare-fun m!883239 () Bool)

(assert (=> bm!41325 m!883239))

(assert (=> b!950167 m!883045))

(assert (=> b!950167 m!883045))

(assert (=> b!950167 m!883055))

(assert (=> b!950165 m!883045))

(assert (=> b!950165 m!883045))

(assert (=> b!950165 m!883055))

(assert (=> b!949964 d!115331))

(declare-fun d!115333 () Bool)

(declare-fun e!534984 () Bool)

(assert (=> d!115333 e!534984))

(declare-fun res!637004 () Bool)

(assert (=> d!115333 (=> (not res!637004) (not e!534984))))

(declare-fun lt!427853 () ListLongMap!12213)

(assert (=> d!115333 (= res!637004 (contains!5219 lt!427853 (_1!6768 (ite (or c!99287 c!99286) (tuple2!13515 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5594 thiss!1141)) (tuple2!13515 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141))))))))

(declare-fun lt!427850 () List!19311)

(assert (=> d!115333 (= lt!427853 (ListLongMap!12214 lt!427850))))

(declare-fun lt!427851 () Unit!31946)

(declare-fun lt!427852 () Unit!31946)

(assert (=> d!115333 (= lt!427851 lt!427852)))

(assert (=> d!115333 (= (getValueByKey!491 lt!427850 (_1!6768 (ite (or c!99287 c!99286) (tuple2!13515 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5594 thiss!1141)) (tuple2!13515 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141))))) (Some!496 (_2!6768 (ite (or c!99287 c!99286) (tuple2!13515 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5594 thiss!1141)) (tuple2!13515 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141))))))))

(assert (=> d!115333 (= lt!427852 (lemmaContainsTupThenGetReturnValue!265 lt!427850 (_1!6768 (ite (or c!99287 c!99286) (tuple2!13515 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5594 thiss!1141)) (tuple2!13515 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141)))) (_2!6768 (ite (or c!99287 c!99286) (tuple2!13515 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5594 thiss!1141)) (tuple2!13515 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141))))))))

(assert (=> d!115333 (= lt!427850 (insertStrictlySorted!322 (toList!6122 (ite c!99287 call!41316 (ite c!99286 call!41319 call!41318))) (_1!6768 (ite (or c!99287 c!99286) (tuple2!13515 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5594 thiss!1141)) (tuple2!13515 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141)))) (_2!6768 (ite (or c!99287 c!99286) (tuple2!13515 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5594 thiss!1141)) (tuple2!13515 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141))))))))

(assert (=> d!115333 (= (+!2869 (ite c!99287 call!41316 (ite c!99286 call!41319 call!41318)) (ite (or c!99287 c!99286) (tuple2!13515 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5594 thiss!1141)) (tuple2!13515 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141)))) lt!427853)))

(declare-fun b!950168 () Bool)

(declare-fun res!637003 () Bool)

(assert (=> b!950168 (=> (not res!637003) (not e!534984))))

(assert (=> b!950168 (= res!637003 (= (getValueByKey!491 (toList!6122 lt!427853) (_1!6768 (ite (or c!99287 c!99286) (tuple2!13515 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5594 thiss!1141)) (tuple2!13515 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141))))) (Some!496 (_2!6768 (ite (or c!99287 c!99286) (tuple2!13515 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5594 thiss!1141)) (tuple2!13515 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141)))))))))

(declare-fun b!950169 () Bool)

(assert (=> b!950169 (= e!534984 (contains!5221 (toList!6122 lt!427853) (ite (or c!99287 c!99286) (tuple2!13515 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5594 thiss!1141)) (tuple2!13515 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141)))))))

(assert (= (and d!115333 res!637004) b!950168))

(assert (= (and b!950168 res!637003) b!950169))

(declare-fun m!883241 () Bool)

(assert (=> d!115333 m!883241))

(declare-fun m!883243 () Bool)

(assert (=> d!115333 m!883243))

(declare-fun m!883245 () Bool)

(assert (=> d!115333 m!883245))

(declare-fun m!883247 () Bool)

(assert (=> d!115333 m!883247))

(declare-fun m!883249 () Bool)

(assert (=> b!950168 m!883249))

(declare-fun m!883251 () Bool)

(assert (=> b!950169 m!883251))

(assert (=> bm!41315 d!115333))

(declare-fun bm!41328 () Bool)

(declare-fun call!41331 () Bool)

(assert (=> bm!41328 (= call!41331 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10710 thiss!1141) (mask!27573 thiss!1141)))))

(declare-fun b!950178 () Bool)

(declare-fun e!534992 () Bool)

(assert (=> b!950178 (= e!534992 call!41331)))

(declare-fun b!950179 () Bool)

(declare-fun e!534993 () Bool)

(assert (=> b!950179 (= e!534993 e!534992)))

(declare-fun c!99325 () Bool)

(assert (=> b!950179 (= c!99325 (validKeyInArray!0 (select (arr!27650 (_keys!10710 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!950180 () Bool)

(declare-fun e!534991 () Bool)

(assert (=> b!950180 (= e!534992 e!534991)))

(declare-fun lt!427860 () (_ BitVec 64))

(assert (=> b!950180 (= lt!427860 (select (arr!27650 (_keys!10710 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427861 () Unit!31946)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57501 (_ BitVec 64) (_ BitVec 32)) Unit!31946)

(assert (=> b!950180 (= lt!427861 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10710 thiss!1141) lt!427860 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57501 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!950180 (arrayContainsKey!0 (_keys!10710 thiss!1141) lt!427860 #b00000000000000000000000000000000)))

(declare-fun lt!427862 () Unit!31946)

(assert (=> b!950180 (= lt!427862 lt!427861)))

(declare-fun res!637010 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57501 (_ BitVec 32)) SeekEntryResult!9092)

(assert (=> b!950180 (= res!637010 (= (seekEntryOrOpen!0 (select (arr!27650 (_keys!10710 thiss!1141)) #b00000000000000000000000000000000) (_keys!10710 thiss!1141) (mask!27573 thiss!1141)) (Found!9092 #b00000000000000000000000000000000)))))

(assert (=> b!950180 (=> (not res!637010) (not e!534991))))

(declare-fun d!115335 () Bool)

(declare-fun res!637009 () Bool)

(assert (=> d!115335 (=> res!637009 e!534993)))

(assert (=> d!115335 (= res!637009 (bvsge #b00000000000000000000000000000000 (size!28126 (_keys!10710 thiss!1141))))))

(assert (=> d!115335 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10710 thiss!1141) (mask!27573 thiss!1141)) e!534993)))

(declare-fun b!950181 () Bool)

(assert (=> b!950181 (= e!534991 call!41331)))

(assert (= (and d!115335 (not res!637009)) b!950179))

(assert (= (and b!950179 c!99325) b!950180))

(assert (= (and b!950179 (not c!99325)) b!950178))

(assert (= (and b!950180 res!637010) b!950181))

(assert (= (or b!950181 b!950178) bm!41328))

(declare-fun m!883253 () Bool)

(assert (=> bm!41328 m!883253))

(assert (=> b!950179 m!883045))

(assert (=> b!950179 m!883045))

(assert (=> b!950179 m!883055))

(assert (=> b!950180 m!883045))

(declare-fun m!883255 () Bool)

(assert (=> b!950180 m!883255))

(declare-fun m!883257 () Bool)

(assert (=> b!950180 m!883257))

(assert (=> b!950180 m!883045))

(declare-fun m!883259 () Bool)

(assert (=> b!950180 m!883259))

(assert (=> b!949963 d!115335))

(declare-fun d!115337 () Bool)

(assert (=> d!115337 (= (validKeyInArray!0 (select (arr!27650 (_keys!10710 thiss!1141)) #b00000000000000000000000000000000)) (and (not (= (select (arr!27650 (_keys!10710 thiss!1141)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27650 (_keys!10710 thiss!1141)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!950031 d!115337))

(declare-fun d!115339 () Bool)

(declare-fun e!534994 () Bool)

(assert (=> d!115339 e!534994))

(declare-fun res!637011 () Bool)

(assert (=> d!115339 (=> res!637011 e!534994)))

(declare-fun lt!427863 () Bool)

(assert (=> d!115339 (= res!637011 (not lt!427863))))

(declare-fun lt!427865 () Bool)

(assert (=> d!115339 (= lt!427863 lt!427865)))

(declare-fun lt!427864 () Unit!31946)

(declare-fun e!534995 () Unit!31946)

(assert (=> d!115339 (= lt!427864 e!534995)))

(declare-fun c!99326 () Bool)

(assert (=> d!115339 (= c!99326 lt!427865)))

(assert (=> d!115339 (= lt!427865 (containsKey!462 (toList!6122 lt!427779) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!115339 (= (contains!5219 lt!427779 #b0000000000000000000000000000000000000000000000000000000000000000) lt!427863)))

(declare-fun b!950182 () Bool)

(declare-fun lt!427866 () Unit!31946)

(assert (=> b!950182 (= e!534995 lt!427866)))

(assert (=> b!950182 (= lt!427866 (lemmaContainsKeyImpliesGetValueByKeyDefined!356 (toList!6122 lt!427779) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!950182 (isDefined!364 (getValueByKey!491 (toList!6122 lt!427779) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!950183 () Bool)

(declare-fun Unit!31952 () Unit!31946)

(assert (=> b!950183 (= e!534995 Unit!31952)))

(declare-fun b!950184 () Bool)

(assert (=> b!950184 (= e!534994 (isDefined!364 (getValueByKey!491 (toList!6122 lt!427779) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!115339 c!99326) b!950182))

(assert (= (and d!115339 (not c!99326)) b!950183))

(assert (= (and d!115339 (not res!637011)) b!950184))

(declare-fun m!883261 () Bool)

(assert (=> d!115339 m!883261))

(declare-fun m!883263 () Bool)

(assert (=> b!950182 m!883263))

(declare-fun m!883265 () Bool)

(assert (=> b!950182 m!883265))

(assert (=> b!950182 m!883265))

(declare-fun m!883267 () Bool)

(assert (=> b!950182 m!883267))

(assert (=> b!950184 m!883265))

(assert (=> b!950184 m!883265))

(assert (=> b!950184 m!883267))

(assert (=> bm!41314 d!115339))

(assert (=> b!950033 d!115337))

(declare-fun d!115341 () Bool)

(declare-fun e!534996 () Bool)

(assert (=> d!115341 e!534996))

(declare-fun res!637012 () Bool)

(assert (=> d!115341 (=> res!637012 e!534996)))

(declare-fun lt!427867 () Bool)

(assert (=> d!115341 (= res!637012 (not lt!427867))))

(declare-fun lt!427869 () Bool)

(assert (=> d!115341 (= lt!427867 lt!427869)))

(declare-fun lt!427868 () Unit!31946)

(declare-fun e!534997 () Unit!31946)

(assert (=> d!115341 (= lt!427868 e!534997)))

(declare-fun c!99327 () Bool)

(assert (=> d!115341 (= c!99327 lt!427869)))

(assert (=> d!115341 (= lt!427869 (containsKey!462 (toList!6122 lt!427779) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!115341 (= (contains!5219 lt!427779 #b1000000000000000000000000000000000000000000000000000000000000000) lt!427867)))

(declare-fun b!950185 () Bool)

(declare-fun lt!427870 () Unit!31946)

(assert (=> b!950185 (= e!534997 lt!427870)))

(assert (=> b!950185 (= lt!427870 (lemmaContainsKeyImpliesGetValueByKeyDefined!356 (toList!6122 lt!427779) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!950185 (isDefined!364 (getValueByKey!491 (toList!6122 lt!427779) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!950186 () Bool)

(declare-fun Unit!31953 () Unit!31946)

(assert (=> b!950186 (= e!534997 Unit!31953)))

(declare-fun b!950187 () Bool)

(assert (=> b!950187 (= e!534996 (isDefined!364 (getValueByKey!491 (toList!6122 lt!427779) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!115341 c!99327) b!950185))

(assert (= (and d!115341 (not c!99327)) b!950186))

(assert (= (and d!115341 (not res!637012)) b!950187))

(declare-fun m!883269 () Bool)

(assert (=> d!115341 m!883269))

(declare-fun m!883271 () Bool)

(assert (=> b!950185 m!883271))

(declare-fun m!883273 () Bool)

(assert (=> b!950185 m!883273))

(assert (=> b!950185 m!883273))

(declare-fun m!883275 () Bool)

(assert (=> b!950185 m!883275))

(assert (=> b!950187 m!883273))

(assert (=> b!950187 m!883273))

(assert (=> b!950187 m!883275))

(assert (=> bm!41312 d!115341))

(declare-fun d!115343 () Bool)

(assert (=> d!115343 (= (apply!883 lt!427779 #b0000000000000000000000000000000000000000000000000000000000000000) (get!14539 (getValueByKey!491 (toList!6122 lt!427779) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26697 () Bool)

(assert (= bs!26697 d!115343))

(assert (=> bs!26697 m!883265))

(assert (=> bs!26697 m!883265))

(declare-fun m!883277 () Bool)

(assert (=> bs!26697 m!883277))

(assert (=> b!950026 d!115343))

(declare-fun d!115345 () Bool)

(declare-fun e!535010 () Bool)

(assert (=> d!115345 e!535010))

(declare-fun c!99334 () Bool)

(declare-fun lt!427875 () SeekEntryResult!9092)

(assert (=> d!115345 (= c!99334 (and ((_ is Intermediate!9092) lt!427875) (undefined!9904 lt!427875)))))

(declare-fun e!535009 () SeekEntryResult!9092)

(assert (=> d!115345 (= lt!427875 e!535009)))

(declare-fun c!99335 () Bool)

(assert (=> d!115345 (= c!99335 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!427876 () (_ BitVec 64))

(assert (=> d!115345 (= lt!427876 (select (arr!27650 (_keys!10710 thiss!1141)) (toIndex!0 key!756 (mask!27573 thiss!1141))))))

(assert (=> d!115345 (validMask!0 (mask!27573 thiss!1141))))

(assert (=> d!115345 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27573 thiss!1141)) key!756 (_keys!10710 thiss!1141) (mask!27573 thiss!1141)) lt!427875)))

(declare-fun b!950206 () Bool)

(assert (=> b!950206 (and (bvsge (index!38741 lt!427875) #b00000000000000000000000000000000) (bvslt (index!38741 lt!427875) (size!28126 (_keys!10710 thiss!1141))))))

(declare-fun res!637021 () Bool)

(assert (=> b!950206 (= res!637021 (= (select (arr!27650 (_keys!10710 thiss!1141)) (index!38741 lt!427875)) key!756))))

(declare-fun e!535008 () Bool)

(assert (=> b!950206 (=> res!637021 e!535008)))

(declare-fun e!535012 () Bool)

(assert (=> b!950206 (= e!535012 e!535008)))

(declare-fun b!950207 () Bool)

(assert (=> b!950207 (= e!535010 (bvsge (x!81628 lt!427875) #b01111111111111111111111111111110))))

(declare-fun b!950208 () Bool)

(assert (=> b!950208 (= e!535009 (Intermediate!9092 true (toIndex!0 key!756 (mask!27573 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!950209 () Bool)

(assert (=> b!950209 (= e!535010 e!535012)))

(declare-fun res!637019 () Bool)

(assert (=> b!950209 (= res!637019 (and ((_ is Intermediate!9092) lt!427875) (not (undefined!9904 lt!427875)) (bvslt (x!81628 lt!427875) #b01111111111111111111111111111110) (bvsge (x!81628 lt!427875) #b00000000000000000000000000000000) (bvsge (x!81628 lt!427875) #b00000000000000000000000000000000)))))

(assert (=> b!950209 (=> (not res!637019) (not e!535012))))

(declare-fun b!950210 () Bool)

(declare-fun e!535011 () SeekEntryResult!9092)

(assert (=> b!950210 (= e!535011 (Intermediate!9092 false (toIndex!0 key!756 (mask!27573 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!950211 () Bool)

(assert (=> b!950211 (and (bvsge (index!38741 lt!427875) #b00000000000000000000000000000000) (bvslt (index!38741 lt!427875) (size!28126 (_keys!10710 thiss!1141))))))

(assert (=> b!950211 (= e!535008 (= (select (arr!27650 (_keys!10710 thiss!1141)) (index!38741 lt!427875)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!950212 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!950212 (= e!535011 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27573 thiss!1141)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!27573 thiss!1141)) key!756 (_keys!10710 thiss!1141) (mask!27573 thiss!1141)))))

(declare-fun b!950213 () Bool)

(assert (=> b!950213 (= e!535009 e!535011)))

(declare-fun c!99336 () Bool)

(assert (=> b!950213 (= c!99336 (or (= lt!427876 key!756) (= (bvadd lt!427876 lt!427876) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!950214 () Bool)

(assert (=> b!950214 (and (bvsge (index!38741 lt!427875) #b00000000000000000000000000000000) (bvslt (index!38741 lt!427875) (size!28126 (_keys!10710 thiss!1141))))))

(declare-fun res!637020 () Bool)

(assert (=> b!950214 (= res!637020 (= (select (arr!27650 (_keys!10710 thiss!1141)) (index!38741 lt!427875)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!950214 (=> res!637020 e!535008)))

(assert (= (and d!115345 c!99335) b!950208))

(assert (= (and d!115345 (not c!99335)) b!950213))

(assert (= (and b!950213 c!99336) b!950210))

(assert (= (and b!950213 (not c!99336)) b!950212))

(assert (= (and d!115345 c!99334) b!950207))

(assert (= (and d!115345 (not c!99334)) b!950209))

(assert (= (and b!950209 res!637019) b!950206))

(assert (= (and b!950206 (not res!637021)) b!950214))

(assert (= (and b!950214 (not res!637020)) b!950211))

(declare-fun m!883279 () Bool)

(assert (=> b!950214 m!883279))

(assert (=> b!950206 m!883279))

(assert (=> d!115345 m!883013))

(declare-fun m!883281 () Bool)

(assert (=> d!115345 m!883281))

(assert (=> d!115345 m!882975))

(assert (=> b!950211 m!883279))

(assert (=> b!950212 m!883013))

(declare-fun m!883283 () Bool)

(assert (=> b!950212 m!883283))

(assert (=> b!950212 m!883283))

(declare-fun m!883285 () Bool)

(assert (=> b!950212 m!883285))

(assert (=> d!115269 d!115345))

(declare-fun d!115347 () Bool)

(declare-fun lt!427882 () (_ BitVec 32))

(declare-fun lt!427881 () (_ BitVec 32))

(assert (=> d!115347 (= lt!427882 (bvmul (bvxor lt!427881 (bvlshr lt!427881 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!115347 (= lt!427881 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!115347 (and (bvsge (mask!27573 thiss!1141) #b00000000000000000000000000000000) (let ((res!637022 (let ((h!20474 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!81646 (bvmul (bvxor h!20474 (bvlshr h!20474 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!81646 (bvlshr x!81646 #b00000000000000000000000000001101)) (mask!27573 thiss!1141)))))) (and (bvslt res!637022 (bvadd (mask!27573 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!637022 #b00000000000000000000000000000000))))))

(assert (=> d!115347 (= (toIndex!0 key!756 (mask!27573 thiss!1141)) (bvand (bvxor lt!427882 (bvlshr lt!427882 #b00000000000000000000000000001101)) (mask!27573 thiss!1141)))))

(assert (=> d!115269 d!115347))

(assert (=> d!115269 d!115273))

(declare-fun d!115349 () Bool)

(declare-fun e!535013 () Bool)

(assert (=> d!115349 e!535013))

(declare-fun res!637024 () Bool)

(assert (=> d!115349 (=> (not res!637024) (not e!535013))))

(declare-fun lt!427886 () ListLongMap!12213)

(assert (=> d!115349 (= res!637024 (contains!5219 lt!427886 (_1!6768 (tuple2!13515 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141)))))))

(declare-fun lt!427883 () List!19311)

(assert (=> d!115349 (= lt!427886 (ListLongMap!12214 lt!427883))))

(declare-fun lt!427884 () Unit!31946)

(declare-fun lt!427885 () Unit!31946)

(assert (=> d!115349 (= lt!427884 lt!427885)))

(assert (=> d!115349 (= (getValueByKey!491 lt!427883 (_1!6768 (tuple2!13515 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141)))) (Some!496 (_2!6768 (tuple2!13515 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141)))))))

(assert (=> d!115349 (= lt!427885 (lemmaContainsTupThenGetReturnValue!265 lt!427883 (_1!6768 (tuple2!13515 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141))) (_2!6768 (tuple2!13515 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141)))))))

(assert (=> d!115349 (= lt!427883 (insertStrictlySorted!322 (toList!6122 call!41315) (_1!6768 (tuple2!13515 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141))) (_2!6768 (tuple2!13515 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141)))))))

(assert (=> d!115349 (= (+!2869 call!41315 (tuple2!13515 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141))) lt!427886)))

(declare-fun b!950215 () Bool)

(declare-fun res!637023 () Bool)

(assert (=> b!950215 (=> (not res!637023) (not e!535013))))

(assert (=> b!950215 (= res!637023 (= (getValueByKey!491 (toList!6122 lt!427886) (_1!6768 (tuple2!13515 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141)))) (Some!496 (_2!6768 (tuple2!13515 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141))))))))

(declare-fun b!950216 () Bool)

(assert (=> b!950216 (= e!535013 (contains!5221 (toList!6122 lt!427886) (tuple2!13515 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141))))))

(assert (= (and d!115349 res!637024) b!950215))

(assert (= (and b!950215 res!637023) b!950216))

(declare-fun m!883287 () Bool)

(assert (=> d!115349 m!883287))

(declare-fun m!883289 () Bool)

(assert (=> d!115349 m!883289))

(declare-fun m!883291 () Bool)

(assert (=> d!115349 m!883291))

(declare-fun m!883293 () Bool)

(assert (=> d!115349 m!883293))

(declare-fun m!883295 () Bool)

(assert (=> b!950215 m!883295))

(declare-fun m!883297 () Bool)

(assert (=> b!950216 m!883297))

(assert (=> b!950028 d!115349))

(assert (=> bm!41313 d!115309))

(declare-fun d!115351 () Bool)

(assert (=> d!115351 (= (apply!883 lt!427779 #b1000000000000000000000000000000000000000000000000000000000000000) (get!14539 (getValueByKey!491 (toList!6122 lt!427779) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26698 () Bool)

(assert (= bs!26698 d!115351))

(assert (=> bs!26698 m!883273))

(assert (=> bs!26698 m!883273))

(declare-fun m!883299 () Bool)

(assert (=> bs!26698 m!883299))

(assert (=> b!950019 d!115351))

(declare-fun d!115353 () Bool)

(declare-fun res!637029 () Bool)

(declare-fun e!535018 () Bool)

(assert (=> d!115353 (=> res!637029 e!535018)))

(assert (=> d!115353 (= res!637029 (and ((_ is Cons!19307) (toList!6122 (getCurrentListMap!3355 (_keys!10710 thiss!1141) (_values!5781 thiss!1141) (mask!27573 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141)))) (= (_1!6768 (h!20471 (toList!6122 (getCurrentListMap!3355 (_keys!10710 thiss!1141) (_values!5781 thiss!1141) (mask!27573 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141))))) key!756)))))

(assert (=> d!115353 (= (containsKey!462 (toList!6122 (getCurrentListMap!3355 (_keys!10710 thiss!1141) (_values!5781 thiss!1141) (mask!27573 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141))) key!756) e!535018)))

(declare-fun b!950221 () Bool)

(declare-fun e!535019 () Bool)

(assert (=> b!950221 (= e!535018 e!535019)))

(declare-fun res!637030 () Bool)

(assert (=> b!950221 (=> (not res!637030) (not e!535019))))

(assert (=> b!950221 (= res!637030 (and (or (not ((_ is Cons!19307) (toList!6122 (getCurrentListMap!3355 (_keys!10710 thiss!1141) (_values!5781 thiss!1141) (mask!27573 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141))))) (bvsle (_1!6768 (h!20471 (toList!6122 (getCurrentListMap!3355 (_keys!10710 thiss!1141) (_values!5781 thiss!1141) (mask!27573 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141))))) key!756)) ((_ is Cons!19307) (toList!6122 (getCurrentListMap!3355 (_keys!10710 thiss!1141) (_values!5781 thiss!1141) (mask!27573 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141)))) (bvslt (_1!6768 (h!20471 (toList!6122 (getCurrentListMap!3355 (_keys!10710 thiss!1141) (_values!5781 thiss!1141) (mask!27573 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141))))) key!756)))))

(declare-fun b!950222 () Bool)

(assert (=> b!950222 (= e!535019 (containsKey!462 (t!27634 (toList!6122 (getCurrentListMap!3355 (_keys!10710 thiss!1141) (_values!5781 thiss!1141) (mask!27573 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141)))) key!756))))

(assert (= (and d!115353 (not res!637029)) b!950221))

(assert (= (and b!950221 res!637030) b!950222))

(declare-fun m!883301 () Bool)

(assert (=> b!950222 m!883301))

(assert (=> d!115279 d!115353))

(declare-fun b!950235 () Bool)

(declare-fun e!535027 () SeekEntryResult!9092)

(assert (=> b!950235 (= e!535027 Undefined!9092)))

(declare-fun b!950236 () Bool)

(declare-fun c!99344 () Bool)

(declare-fun lt!427892 () (_ BitVec 64))

(assert (=> b!950236 (= c!99344 (= lt!427892 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!535028 () SeekEntryResult!9092)

(declare-fun e!535026 () SeekEntryResult!9092)

(assert (=> b!950236 (= e!535028 e!535026)))

(declare-fun b!950237 () Bool)

(assert (=> b!950237 (= e!535026 (seekKeyOrZeroReturnVacant!0 (bvadd (x!81628 lt!427704) #b00000000000000000000000000000001) (nextIndex!0 (index!38741 lt!427704) (bvadd (x!81628 lt!427704) #b00000000000000000000000000000001) (mask!27573 thiss!1141)) (index!38741 lt!427704) key!756 (_keys!10710 thiss!1141) (mask!27573 thiss!1141)))))

(declare-fun d!115355 () Bool)

(declare-fun lt!427891 () SeekEntryResult!9092)

(assert (=> d!115355 (and (or ((_ is Undefined!9092) lt!427891) (not ((_ is Found!9092) lt!427891)) (and (bvsge (index!38740 lt!427891) #b00000000000000000000000000000000) (bvslt (index!38740 lt!427891) (size!28126 (_keys!10710 thiss!1141))))) (or ((_ is Undefined!9092) lt!427891) ((_ is Found!9092) lt!427891) (not ((_ is MissingVacant!9092) lt!427891)) (not (= (index!38742 lt!427891) (index!38741 lt!427704))) (and (bvsge (index!38742 lt!427891) #b00000000000000000000000000000000) (bvslt (index!38742 lt!427891) (size!28126 (_keys!10710 thiss!1141))))) (or ((_ is Undefined!9092) lt!427891) (ite ((_ is Found!9092) lt!427891) (= (select (arr!27650 (_keys!10710 thiss!1141)) (index!38740 lt!427891)) key!756) (and ((_ is MissingVacant!9092) lt!427891) (= (index!38742 lt!427891) (index!38741 lt!427704)) (= (select (arr!27650 (_keys!10710 thiss!1141)) (index!38742 lt!427891)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!115355 (= lt!427891 e!535027)))

(declare-fun c!99343 () Bool)

(assert (=> d!115355 (= c!99343 (bvsge (x!81628 lt!427704) #b01111111111111111111111111111110))))

(assert (=> d!115355 (= lt!427892 (select (arr!27650 (_keys!10710 thiss!1141)) (index!38741 lt!427704)))))

(assert (=> d!115355 (validMask!0 (mask!27573 thiss!1141))))

(assert (=> d!115355 (= (seekKeyOrZeroReturnVacant!0 (x!81628 lt!427704) (index!38741 lt!427704) (index!38741 lt!427704) key!756 (_keys!10710 thiss!1141) (mask!27573 thiss!1141)) lt!427891)))

(declare-fun b!950238 () Bool)

(assert (=> b!950238 (= e!535027 e!535028)))

(declare-fun c!99345 () Bool)

(assert (=> b!950238 (= c!99345 (= lt!427892 key!756))))

(declare-fun b!950239 () Bool)

(assert (=> b!950239 (= e!535028 (Found!9092 (index!38741 lt!427704)))))

(declare-fun b!950240 () Bool)

(assert (=> b!950240 (= e!535026 (MissingVacant!9092 (index!38741 lt!427704)))))

(assert (= (and d!115355 c!99343) b!950235))

(assert (= (and d!115355 (not c!99343)) b!950238))

(assert (= (and b!950238 c!99345) b!950239))

(assert (= (and b!950238 (not c!99345)) b!950236))

(assert (= (and b!950236 c!99344) b!950240))

(assert (= (and b!950236 (not c!99344)) b!950237))

(declare-fun m!883303 () Bool)

(assert (=> b!950237 m!883303))

(assert (=> b!950237 m!883303))

(declare-fun m!883305 () Bool)

(assert (=> b!950237 m!883305))

(declare-fun m!883307 () Bool)

(assert (=> d!115355 m!883307))

(declare-fun m!883309 () Bool)

(assert (=> d!115355 m!883309))

(assert (=> d!115355 m!883009))

(assert (=> d!115355 m!882975))

(assert (=> b!949952 d!115355))

(declare-fun mapNonEmpty!32986 () Bool)

(declare-fun mapRes!32986 () Bool)

(declare-fun tp!63232 () Bool)

(declare-fun e!535030 () Bool)

(assert (=> mapNonEmpty!32986 (= mapRes!32986 (and tp!63232 e!535030))))

(declare-fun mapRest!32986 () (Array (_ BitVec 32) ValueCell!9878))

(declare-fun mapValue!32986 () ValueCell!9878)

(declare-fun mapKey!32986 () (_ BitVec 32))

(assert (=> mapNonEmpty!32986 (= mapRest!32985 (store mapRest!32986 mapKey!32986 mapValue!32986))))

(declare-fun mapIsEmpty!32986 () Bool)

(assert (=> mapIsEmpty!32986 mapRes!32986))

(declare-fun condMapEmpty!32986 () Bool)

(declare-fun mapDefault!32986 () ValueCell!9878)

(assert (=> mapNonEmpty!32985 (= condMapEmpty!32986 (= mapRest!32985 ((as const (Array (_ BitVec 32) ValueCell!9878)) mapDefault!32986)))))

(declare-fun e!535029 () Bool)

(assert (=> mapNonEmpty!32985 (= tp!63231 (and e!535029 mapRes!32986))))

(declare-fun b!950242 () Bool)

(assert (=> b!950242 (= e!535029 tp_is_empty!20719)))

(declare-fun b!950241 () Bool)

(assert (=> b!950241 (= e!535030 tp_is_empty!20719)))

(assert (= (and mapNonEmpty!32985 condMapEmpty!32986) mapIsEmpty!32986))

(assert (= (and mapNonEmpty!32985 (not condMapEmpty!32986)) mapNonEmpty!32986))

(assert (= (and mapNonEmpty!32986 ((_ is ValueCellFull!9878) mapValue!32986)) b!950241))

(assert (= (and mapNonEmpty!32985 ((_ is ValueCellFull!9878) mapDefault!32986)) b!950242))

(declare-fun m!883311 () Bool)

(assert (=> mapNonEmpty!32986 m!883311))

(declare-fun b_lambda!14357 () Bool)

(assert (= b_lambda!14353 (or (and b!949881 b_free!18211) b_lambda!14357)))

(declare-fun b_lambda!14359 () Bool)

(assert (= b_lambda!14355 (or (and b!949881 b_free!18211) b_lambda!14359)))

(check-sat (not d!115301) (not b!950126) (not d!115345) (not d!115317) (not b!950071) (not b!950222) (not b!950141) (not b!950165) (not b!950184) (not d!115299) (not b!950073) (not d!115309) (not b!950129) (not b!950125) (not b!950091) (not d!115307) (not d!115295) (not d!115333) tp_is_empty!20719 (not b!950138) (not b!950166) (not b!950137) (not d!115283) (not d!115341) (not d!115311) (not b!950068) (not d!115289) (not b!950180) (not d!115321) (not b!950212) (not d!115351) (not b!950185) (not b!950132) (not b!950215) (not b!950179) (not b!950168) (not b!950187) (not b!950094) (not mapNonEmpty!32986) (not d!115291) (not b!950142) (not b!950152) (not b!950139) (not d!115315) (not b!950083) (not d!115339) (not b!950216) (not bm!41319) (not bm!41322) (not d!115297) (not b!950090) (not b_next!18211) (not d!115303) (not b!950136) (not b!950128) (not b!950134) (not d!115327) (not b!950169) (not b!950084) (not d!115325) (not b!950237) (not b!950167) (not d!115343) (not d!115305) (not d!115355) (not b_lambda!14359) (not b!950146) (not bm!41328) (not b!950151) (not bm!41325) (not b!950057) (not b_lambda!14351) (not d!115319) b_and!29671 (not d!115293) (not b!950182) (not b!950135) (not d!115349) (not b!950143) (not b!950093) (not b_lambda!14357) (not d!115313) (not d!115323))
(check-sat b_and!29671 (not b_next!18211))

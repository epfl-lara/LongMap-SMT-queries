; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81024 () Bool)

(assert start!81024)

(declare-fun b!948737 () Bool)

(declare-fun b_free!18211 () Bool)

(declare-fun b_next!18211 () Bool)

(assert (=> b!948737 (= b_free!18211 (not b_next!18211))))

(declare-fun tp!63215 () Bool)

(declare-fun b_and!29625 () Bool)

(assert (=> b!948737 (= tp!63215 b_and!29625)))

(declare-fun b!948733 () Bool)

(declare-fun e!534080 () Bool)

(declare-datatypes ((V!32591 0))(
  ( (V!32592 (val!10410 Int)) )
))
(declare-datatypes ((ValueCell!9878 0))(
  ( (ValueCellFull!9878 (v!12948 V!32591)) (EmptyCell!9878) )
))
(declare-datatypes ((array!57413 0))(
  ( (array!57414 (arr!27611 (Array (_ BitVec 32) ValueCell!9878)) (size!28088 (_ BitVec 32))) )
))
(declare-datatypes ((array!57415 0))(
  ( (array!57416 (arr!27612 (Array (_ BitVec 32) (_ BitVec 64))) (size!28089 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4906 0))(
  ( (LongMapFixedSize!4907 (defaultEntry!5758 Int) (mask!27523 (_ BitVec 32)) (extraKeys!5490 (_ BitVec 32)) (zeroValue!5594 V!32591) (minValue!5594 V!32591) (_size!2508 (_ BitVec 32)) (_keys!10677 array!57415) (_values!5781 array!57413) (_vacant!2508 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4906)

(assert (=> b!948733 (= e!534080 (and (= (size!28088 (_values!5781 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27523 thiss!1141))) (= (size!28089 (_keys!10677 thiss!1141)) (size!28088 (_values!5781 thiss!1141))) (bvsge (mask!27523 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5490 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!32976 () Bool)

(declare-fun mapRes!32976 () Bool)

(assert (=> mapIsEmpty!32976 mapRes!32976))

(declare-fun res!636424 () Bool)

(assert (=> start!81024 (=> (not res!636424) (not e!534080))))

(declare-fun valid!1871 (LongMapFixedSize!4906) Bool)

(assert (=> start!81024 (= res!636424 (valid!1871 thiss!1141))))

(assert (=> start!81024 e!534080))

(declare-fun e!534085 () Bool)

(assert (=> start!81024 e!534085))

(assert (=> start!81024 true))

(declare-fun b!948734 () Bool)

(declare-fun res!636423 () Bool)

(assert (=> b!948734 (=> (not res!636423) (not e!534080))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13576 0))(
  ( (tuple2!13577 (_1!6799 (_ BitVec 64)) (_2!6799 V!32591)) )
))
(declare-datatypes ((List!19326 0))(
  ( (Nil!19323) (Cons!19322 (h!20480 tuple2!13576) (t!27648 List!19326)) )
))
(declare-datatypes ((ListLongMap!12263 0))(
  ( (ListLongMap!12264 (toList!6147 List!19326)) )
))
(declare-fun contains!5176 (ListLongMap!12263 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3309 (array!57415 array!57413 (_ BitVec 32) (_ BitVec 32) V!32591 V!32591 (_ BitVec 32) Int) ListLongMap!12263)

(assert (=> b!948734 (= res!636423 (contains!5176 (getCurrentListMap!3309 (_keys!10677 thiss!1141) (_values!5781 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141)) key!756))))

(declare-fun b!948735 () Bool)

(declare-fun res!636421 () Bool)

(assert (=> b!948735 (=> (not res!636421) (not e!534080))))

(assert (=> b!948735 (= res!636421 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!948736 () Bool)

(declare-fun e!534082 () Bool)

(declare-fun tp_is_empty!20719 () Bool)

(assert (=> b!948736 (= e!534082 tp_is_empty!20719)))

(declare-fun e!534083 () Bool)

(declare-fun array_inv!21492 (array!57415) Bool)

(declare-fun array_inv!21493 (array!57413) Bool)

(assert (=> b!948737 (= e!534085 (and tp!63215 tp_is_empty!20719 (array_inv!21492 (_keys!10677 thiss!1141)) (array_inv!21493 (_values!5781 thiss!1141)) e!534083))))

(declare-fun b!948738 () Bool)

(assert (=> b!948738 (= e!534083 (and e!534082 mapRes!32976))))

(declare-fun condMapEmpty!32976 () Bool)

(declare-fun mapDefault!32976 () ValueCell!9878)

(assert (=> b!948738 (= condMapEmpty!32976 (= (arr!27611 (_values!5781 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9878)) mapDefault!32976)))))

(declare-fun b!948739 () Bool)

(declare-fun e!534084 () Bool)

(assert (=> b!948739 (= e!534084 tp_is_empty!20719)))

(declare-fun mapNonEmpty!32976 () Bool)

(declare-fun tp!63216 () Bool)

(assert (=> mapNonEmpty!32976 (= mapRes!32976 (and tp!63216 e!534084))))

(declare-fun mapRest!32976 () (Array (_ BitVec 32) ValueCell!9878))

(declare-fun mapKey!32976 () (_ BitVec 32))

(declare-fun mapValue!32976 () ValueCell!9878)

(assert (=> mapNonEmpty!32976 (= (arr!27611 (_values!5781 thiss!1141)) (store mapRest!32976 mapKey!32976 mapValue!32976))))

(declare-fun b!948740 () Bool)

(declare-fun res!636422 () Bool)

(assert (=> b!948740 (=> (not res!636422) (not e!534080))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9129 0))(
  ( (MissingZero!9129 (index!38887 (_ BitVec 32))) (Found!9129 (index!38888 (_ BitVec 32))) (Intermediate!9129 (undefined!9941 Bool) (index!38889 (_ BitVec 32)) (x!81646 (_ BitVec 32))) (Undefined!9129) (MissingVacant!9129 (index!38890 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57415 (_ BitVec 32)) SeekEntryResult!9129)

(assert (=> b!948740 (= res!636422 (not ((_ is Found!9129) (seekEntry!0 key!756 (_keys!10677 thiss!1141) (mask!27523 thiss!1141)))))))

(declare-fun b!948741 () Bool)

(declare-fun res!636420 () Bool)

(assert (=> b!948741 (=> (not res!636420) (not e!534080))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!948741 (= res!636420 (validMask!0 (mask!27523 thiss!1141)))))

(assert (= (and start!81024 res!636424) b!948735))

(assert (= (and b!948735 res!636421) b!948740))

(assert (= (and b!948740 res!636422) b!948734))

(assert (= (and b!948734 res!636423) b!948741))

(assert (= (and b!948741 res!636420) b!948733))

(assert (= (and b!948738 condMapEmpty!32976) mapIsEmpty!32976))

(assert (= (and b!948738 (not condMapEmpty!32976)) mapNonEmpty!32976))

(assert (= (and mapNonEmpty!32976 ((_ is ValueCellFull!9878) mapValue!32976)) b!948739))

(assert (= (and b!948738 ((_ is ValueCellFull!9878) mapDefault!32976)) b!948736))

(assert (= b!948737 b!948738))

(assert (= start!81024 b!948737))

(declare-fun m!880909 () Bool)

(assert (=> b!948740 m!880909))

(declare-fun m!880911 () Bool)

(assert (=> mapNonEmpty!32976 m!880911))

(declare-fun m!880913 () Bool)

(assert (=> b!948737 m!880913))

(declare-fun m!880915 () Bool)

(assert (=> b!948737 m!880915))

(declare-fun m!880917 () Bool)

(assert (=> b!948741 m!880917))

(declare-fun m!880919 () Bool)

(assert (=> b!948734 m!880919))

(assert (=> b!948734 m!880919))

(declare-fun m!880921 () Bool)

(assert (=> b!948734 m!880921))

(declare-fun m!880923 () Bool)

(assert (=> start!81024 m!880923))

(check-sat (not b!948740) (not b!948734) tp_is_empty!20719 b_and!29625 (not mapNonEmpty!32976) (not b!948737) (not b!948741) (not b_next!18211) (not start!81024))
(check-sat b_and!29625 (not b_next!18211))
(get-model)

(declare-fun d!114749 () Bool)

(assert (=> d!114749 (= (validMask!0 (mask!27523 thiss!1141)) (and (or (= (mask!27523 thiss!1141) #b00000000000000000000000000000111) (= (mask!27523 thiss!1141) #b00000000000000000000000000001111) (= (mask!27523 thiss!1141) #b00000000000000000000000000011111) (= (mask!27523 thiss!1141) #b00000000000000000000000000111111) (= (mask!27523 thiss!1141) #b00000000000000000000000001111111) (= (mask!27523 thiss!1141) #b00000000000000000000000011111111) (= (mask!27523 thiss!1141) #b00000000000000000000000111111111) (= (mask!27523 thiss!1141) #b00000000000000000000001111111111) (= (mask!27523 thiss!1141) #b00000000000000000000011111111111) (= (mask!27523 thiss!1141) #b00000000000000000000111111111111) (= (mask!27523 thiss!1141) #b00000000000000000001111111111111) (= (mask!27523 thiss!1141) #b00000000000000000011111111111111) (= (mask!27523 thiss!1141) #b00000000000000000111111111111111) (= (mask!27523 thiss!1141) #b00000000000000001111111111111111) (= (mask!27523 thiss!1141) #b00000000000000011111111111111111) (= (mask!27523 thiss!1141) #b00000000000000111111111111111111) (= (mask!27523 thiss!1141) #b00000000000001111111111111111111) (= (mask!27523 thiss!1141) #b00000000000011111111111111111111) (= (mask!27523 thiss!1141) #b00000000000111111111111111111111) (= (mask!27523 thiss!1141) #b00000000001111111111111111111111) (= (mask!27523 thiss!1141) #b00000000011111111111111111111111) (= (mask!27523 thiss!1141) #b00000000111111111111111111111111) (= (mask!27523 thiss!1141) #b00000001111111111111111111111111) (= (mask!27523 thiss!1141) #b00000011111111111111111111111111) (= (mask!27523 thiss!1141) #b00000111111111111111111111111111) (= (mask!27523 thiss!1141) #b00001111111111111111111111111111) (= (mask!27523 thiss!1141) #b00011111111111111111111111111111) (= (mask!27523 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27523 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!948741 d!114749))

(declare-fun d!114751 () Bool)

(assert (=> d!114751 (= (array_inv!21492 (_keys!10677 thiss!1141)) (bvsge (size!28089 (_keys!10677 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!948737 d!114751))

(declare-fun d!114753 () Bool)

(assert (=> d!114753 (= (array_inv!21493 (_values!5781 thiss!1141)) (bvsge (size!28088 (_values!5781 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!948737 d!114753))

(declare-fun d!114755 () Bool)

(declare-fun res!636461 () Bool)

(declare-fun e!534124 () Bool)

(assert (=> d!114755 (=> (not res!636461) (not e!534124))))

(declare-fun simpleValid!370 (LongMapFixedSize!4906) Bool)

(assert (=> d!114755 (= res!636461 (simpleValid!370 thiss!1141))))

(assert (=> d!114755 (= (valid!1871 thiss!1141) e!534124)))

(declare-fun b!948802 () Bool)

(declare-fun res!636462 () Bool)

(assert (=> b!948802 (=> (not res!636462) (not e!534124))))

(declare-fun arrayCountValidKeys!0 (array!57415 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!948802 (= res!636462 (= (arrayCountValidKeys!0 (_keys!10677 thiss!1141) #b00000000000000000000000000000000 (size!28089 (_keys!10677 thiss!1141))) (_size!2508 thiss!1141)))))

(declare-fun b!948803 () Bool)

(declare-fun res!636463 () Bool)

(assert (=> b!948803 (=> (not res!636463) (not e!534124))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57415 (_ BitVec 32)) Bool)

(assert (=> b!948803 (= res!636463 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10677 thiss!1141) (mask!27523 thiss!1141)))))

(declare-fun b!948804 () Bool)

(declare-datatypes ((List!19329 0))(
  ( (Nil!19326) (Cons!19325 (h!20483 (_ BitVec 64)) (t!27653 List!19329)) )
))
(declare-fun arrayNoDuplicates!0 (array!57415 (_ BitVec 32) List!19329) Bool)

(assert (=> b!948804 (= e!534124 (arrayNoDuplicates!0 (_keys!10677 thiss!1141) #b00000000000000000000000000000000 Nil!19326))))

(assert (= (and d!114755 res!636461) b!948802))

(assert (= (and b!948802 res!636462) b!948803))

(assert (= (and b!948803 res!636463) b!948804))

(declare-fun m!880957 () Bool)

(assert (=> d!114755 m!880957))

(declare-fun m!880959 () Bool)

(assert (=> b!948802 m!880959))

(declare-fun m!880961 () Bool)

(assert (=> b!948803 m!880961))

(declare-fun m!880963 () Bool)

(assert (=> b!948804 m!880963))

(assert (=> start!81024 d!114755))

(declare-fun b!948817 () Bool)

(declare-fun e!534131 () SeekEntryResult!9129)

(assert (=> b!948817 (= e!534131 Undefined!9129)))

(declare-fun d!114757 () Bool)

(declare-fun lt!427105 () SeekEntryResult!9129)

(assert (=> d!114757 (and (or ((_ is MissingVacant!9129) lt!427105) (not ((_ is Found!9129) lt!427105)) (and (bvsge (index!38888 lt!427105) #b00000000000000000000000000000000) (bvslt (index!38888 lt!427105) (size!28089 (_keys!10677 thiss!1141))))) (not ((_ is MissingVacant!9129) lt!427105)) (or (not ((_ is Found!9129) lt!427105)) (= (select (arr!27612 (_keys!10677 thiss!1141)) (index!38888 lt!427105)) key!756)))))

(assert (=> d!114757 (= lt!427105 e!534131)))

(declare-fun c!98921 () Bool)

(declare-fun lt!427107 () SeekEntryResult!9129)

(assert (=> d!114757 (= c!98921 (and ((_ is Intermediate!9129) lt!427107) (undefined!9941 lt!427107)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57415 (_ BitVec 32)) SeekEntryResult!9129)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114757 (= lt!427107 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27523 thiss!1141)) key!756 (_keys!10677 thiss!1141) (mask!27523 thiss!1141)))))

(assert (=> d!114757 (validMask!0 (mask!27523 thiss!1141))))

(assert (=> d!114757 (= (seekEntry!0 key!756 (_keys!10677 thiss!1141) (mask!27523 thiss!1141)) lt!427105)))

(declare-fun b!948818 () Bool)

(declare-fun e!534132 () SeekEntryResult!9129)

(assert (=> b!948818 (= e!534131 e!534132)))

(declare-fun lt!427104 () (_ BitVec 64))

(assert (=> b!948818 (= lt!427104 (select (arr!27612 (_keys!10677 thiss!1141)) (index!38889 lt!427107)))))

(declare-fun c!98922 () Bool)

(assert (=> b!948818 (= c!98922 (= lt!427104 key!756))))

(declare-fun b!948819 () Bool)

(declare-fun e!534133 () SeekEntryResult!9129)

(assert (=> b!948819 (= e!534133 (MissingZero!9129 (index!38889 lt!427107)))))

(declare-fun b!948820 () Bool)

(declare-fun lt!427106 () SeekEntryResult!9129)

(assert (=> b!948820 (= e!534133 (ite ((_ is MissingVacant!9129) lt!427106) (MissingZero!9129 (index!38890 lt!427106)) lt!427106))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57415 (_ BitVec 32)) SeekEntryResult!9129)

(assert (=> b!948820 (= lt!427106 (seekKeyOrZeroReturnVacant!0 (x!81646 lt!427107) (index!38889 lt!427107) (index!38889 lt!427107) key!756 (_keys!10677 thiss!1141) (mask!27523 thiss!1141)))))

(declare-fun b!948821 () Bool)

(declare-fun c!98920 () Bool)

(assert (=> b!948821 (= c!98920 (= lt!427104 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!948821 (= e!534132 e!534133)))

(declare-fun b!948822 () Bool)

(assert (=> b!948822 (= e!534132 (Found!9129 (index!38889 lt!427107)))))

(assert (= (and d!114757 c!98921) b!948817))

(assert (= (and d!114757 (not c!98921)) b!948818))

(assert (= (and b!948818 c!98922) b!948822))

(assert (= (and b!948818 (not c!98922)) b!948821))

(assert (= (and b!948821 c!98920) b!948819))

(assert (= (and b!948821 (not c!98920)) b!948820))

(declare-fun m!880965 () Bool)

(assert (=> d!114757 m!880965))

(declare-fun m!880967 () Bool)

(assert (=> d!114757 m!880967))

(assert (=> d!114757 m!880967))

(declare-fun m!880969 () Bool)

(assert (=> d!114757 m!880969))

(assert (=> d!114757 m!880917))

(declare-fun m!880971 () Bool)

(assert (=> b!948818 m!880971))

(declare-fun m!880973 () Bool)

(assert (=> b!948820 m!880973))

(assert (=> b!948740 d!114757))

(declare-fun d!114759 () Bool)

(declare-fun e!534138 () Bool)

(assert (=> d!114759 e!534138))

(declare-fun res!636466 () Bool)

(assert (=> d!114759 (=> res!636466 e!534138)))

(declare-fun lt!427117 () Bool)

(assert (=> d!114759 (= res!636466 (not lt!427117))))

(declare-fun lt!427118 () Bool)

(assert (=> d!114759 (= lt!427117 lt!427118)))

(declare-datatypes ((Unit!31843 0))(
  ( (Unit!31844) )
))
(declare-fun lt!427119 () Unit!31843)

(declare-fun e!534139 () Unit!31843)

(assert (=> d!114759 (= lt!427119 e!534139)))

(declare-fun c!98925 () Bool)

(assert (=> d!114759 (= c!98925 lt!427118)))

(declare-fun containsKey!460 (List!19326 (_ BitVec 64)) Bool)

(assert (=> d!114759 (= lt!427118 (containsKey!460 (toList!6147 (getCurrentListMap!3309 (_keys!10677 thiss!1141) (_values!5781 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141))) key!756))))

(assert (=> d!114759 (= (contains!5176 (getCurrentListMap!3309 (_keys!10677 thiss!1141) (_values!5781 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141)) key!756) lt!427117)))

(declare-fun b!948829 () Bool)

(declare-fun lt!427116 () Unit!31843)

(assert (=> b!948829 (= e!534139 lt!427116)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!355 (List!19326 (_ BitVec 64)) Unit!31843)

(assert (=> b!948829 (= lt!427116 (lemmaContainsKeyImpliesGetValueByKeyDefined!355 (toList!6147 (getCurrentListMap!3309 (_keys!10677 thiss!1141) (_values!5781 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141))) key!756))))

(declare-datatypes ((Option!502 0))(
  ( (Some!501 (v!12951 V!32591)) (None!500) )
))
(declare-fun isDefined!368 (Option!502) Bool)

(declare-fun getValueByKey!496 (List!19326 (_ BitVec 64)) Option!502)

(assert (=> b!948829 (isDefined!368 (getValueByKey!496 (toList!6147 (getCurrentListMap!3309 (_keys!10677 thiss!1141) (_values!5781 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141))) key!756))))

(declare-fun b!948830 () Bool)

(declare-fun Unit!31845 () Unit!31843)

(assert (=> b!948830 (= e!534139 Unit!31845)))

(declare-fun b!948831 () Bool)

(assert (=> b!948831 (= e!534138 (isDefined!368 (getValueByKey!496 (toList!6147 (getCurrentListMap!3309 (_keys!10677 thiss!1141) (_values!5781 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141))) key!756)))))

(assert (= (and d!114759 c!98925) b!948829))

(assert (= (and d!114759 (not c!98925)) b!948830))

(assert (= (and d!114759 (not res!636466)) b!948831))

(declare-fun m!880975 () Bool)

(assert (=> d!114759 m!880975))

(declare-fun m!880977 () Bool)

(assert (=> b!948829 m!880977))

(declare-fun m!880979 () Bool)

(assert (=> b!948829 m!880979))

(assert (=> b!948829 m!880979))

(declare-fun m!880981 () Bool)

(assert (=> b!948829 m!880981))

(assert (=> b!948831 m!880979))

(assert (=> b!948831 m!880979))

(assert (=> b!948831 m!880981))

(assert (=> b!948734 d!114759))

(declare-fun b!948874 () Bool)

(declare-fun e!534172 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!948874 (= e!534172 (validKeyInArray!0 (select (arr!27612 (_keys!10677 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!948875 () Bool)

(declare-fun e!534167 () Bool)

(assert (=> b!948875 (= e!534167 (validKeyInArray!0 (select (arr!27612 (_keys!10677 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!948876 () Bool)

(declare-fun e!534175 () Bool)

(declare-fun lt!427173 () ListLongMap!12263)

(declare-fun apply!867 (ListLongMap!12263 (_ BitVec 64)) V!32591)

(assert (=> b!948876 (= e!534175 (= (apply!867 lt!427173 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5594 thiss!1141)))))

(declare-fun call!41246 () ListLongMap!12263)

(declare-fun call!41244 () ListLongMap!12263)

(declare-fun c!98941 () Bool)

(declare-fun c!98938 () Bool)

(declare-fun call!41243 () ListLongMap!12263)

(declare-fun call!41245 () ListLongMap!12263)

(declare-fun bm!41239 () Bool)

(declare-fun +!2877 (ListLongMap!12263 tuple2!13576) ListLongMap!12263)

(assert (=> bm!41239 (= call!41244 (+!2877 (ite c!98938 call!41246 (ite c!98941 call!41243 call!41245)) (ite (or c!98938 c!98941) (tuple2!13577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5594 thiss!1141)) (tuple2!13577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141)))))))

(declare-fun bm!41240 () Bool)

(declare-fun call!41247 () Bool)

(assert (=> bm!41240 (= call!41247 (contains!5176 lt!427173 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!114761 () Bool)

(declare-fun e!534176 () Bool)

(assert (=> d!114761 e!534176))

(declare-fun res!636485 () Bool)

(assert (=> d!114761 (=> (not res!636485) (not e!534176))))

(assert (=> d!114761 (= res!636485 (or (bvsge #b00000000000000000000000000000000 (size!28089 (_keys!10677 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28089 (_keys!10677 thiss!1141))))))))

(declare-fun lt!427174 () ListLongMap!12263)

(assert (=> d!114761 (= lt!427173 lt!427174)))

(declare-fun lt!427168 () Unit!31843)

(declare-fun e!534169 () Unit!31843)

(assert (=> d!114761 (= lt!427168 e!534169)))

(declare-fun c!98940 () Bool)

(assert (=> d!114761 (= c!98940 e!534167)))

(declare-fun res!636488 () Bool)

(assert (=> d!114761 (=> (not res!636488) (not e!534167))))

(assert (=> d!114761 (= res!636488 (bvslt #b00000000000000000000000000000000 (size!28089 (_keys!10677 thiss!1141))))))

(declare-fun e!534166 () ListLongMap!12263)

(assert (=> d!114761 (= lt!427174 e!534166)))

(assert (=> d!114761 (= c!98938 (and (not (= (bvand (extraKeys!5490 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5490 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!114761 (validMask!0 (mask!27523 thiss!1141))))

(assert (=> d!114761 (= (getCurrentListMap!3309 (_keys!10677 thiss!1141) (_values!5781 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141)) lt!427173)))

(declare-fun b!948877 () Bool)

(declare-fun c!98943 () Bool)

(assert (=> b!948877 (= c!98943 (and (not (= (bvand (extraKeys!5490 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5490 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!534178 () ListLongMap!12263)

(declare-fun e!534177 () ListLongMap!12263)

(assert (=> b!948877 (= e!534178 e!534177)))

(declare-fun b!948878 () Bool)

(declare-fun e!534173 () Bool)

(declare-fun e!534171 () Bool)

(assert (=> b!948878 (= e!534173 e!534171)))

(declare-fun res!636489 () Bool)

(assert (=> b!948878 (=> (not res!636489) (not e!534171))))

(assert (=> b!948878 (= res!636489 (contains!5176 lt!427173 (select (arr!27612 (_keys!10677 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!948878 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28089 (_keys!10677 thiss!1141))))))

(declare-fun b!948879 () Bool)

(declare-fun get!14506 (ValueCell!9878 V!32591) V!32591)

(declare-fun dynLambda!1633 (Int (_ BitVec 64)) V!32591)

(assert (=> b!948879 (= e!534171 (= (apply!867 lt!427173 (select (arr!27612 (_keys!10677 thiss!1141)) #b00000000000000000000000000000000)) (get!14506 (select (arr!27611 (_values!5781 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1633 (defaultEntry!5758 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!948879 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28088 (_values!5781 thiss!1141))))))

(assert (=> b!948879 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28089 (_keys!10677 thiss!1141))))))

(declare-fun b!948880 () Bool)

(declare-fun Unit!31846 () Unit!31843)

(assert (=> b!948880 (= e!534169 Unit!31846)))

(declare-fun b!948881 () Bool)

(assert (=> b!948881 (= e!534166 (+!2877 call!41244 (tuple2!13577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141))))))

(declare-fun b!948882 () Bool)

(declare-fun e!534168 () Bool)

(assert (=> b!948882 (= e!534176 e!534168)))

(declare-fun c!98942 () Bool)

(assert (=> b!948882 (= c!98942 (not (= (bvand (extraKeys!5490 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!948883 () Bool)

(assert (=> b!948883 (= e!534177 call!41245)))

(declare-fun bm!41241 () Bool)

(declare-fun call!41248 () Bool)

(assert (=> bm!41241 (= call!41248 (contains!5176 lt!427173 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!41242 () Bool)

(assert (=> bm!41242 (= call!41245 call!41243)))

(declare-fun bm!41243 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3349 (array!57415 array!57413 (_ BitVec 32) (_ BitVec 32) V!32591 V!32591 (_ BitVec 32) Int) ListLongMap!12263)

(assert (=> bm!41243 (= call!41246 (getCurrentListMapNoExtraKeys!3349 (_keys!10677 thiss!1141) (_values!5781 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141)))))

(declare-fun b!948884 () Bool)

(declare-fun e!534174 () Bool)

(assert (=> b!948884 (= e!534174 e!534175)))

(declare-fun res!636487 () Bool)

(assert (=> b!948884 (= res!636487 call!41247)))

(assert (=> b!948884 (=> (not res!636487) (not e!534175))))

(declare-fun b!948885 () Bool)

(declare-fun e!534170 () Bool)

(assert (=> b!948885 (= e!534170 (= (apply!867 lt!427173 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5594 thiss!1141)))))

(declare-fun b!948886 () Bool)

(declare-fun call!41242 () ListLongMap!12263)

(assert (=> b!948886 (= e!534178 call!41242)))

(declare-fun b!948887 () Bool)

(declare-fun res!636492 () Bool)

(assert (=> b!948887 (=> (not res!636492) (not e!534176))))

(assert (=> b!948887 (= res!636492 e!534174)))

(declare-fun c!98939 () Bool)

(assert (=> b!948887 (= c!98939 (not (= (bvand (extraKeys!5490 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!948888 () Bool)

(assert (=> b!948888 (= e!534168 e!534170)))

(declare-fun res!636491 () Bool)

(assert (=> b!948888 (= res!636491 call!41248)))

(assert (=> b!948888 (=> (not res!636491) (not e!534170))))

(declare-fun b!948889 () Bool)

(assert (=> b!948889 (= e!534174 (not call!41247))))

(declare-fun b!948890 () Bool)

(declare-fun lt!427169 () Unit!31843)

(assert (=> b!948890 (= e!534169 lt!427169)))

(declare-fun lt!427167 () ListLongMap!12263)

(assert (=> b!948890 (= lt!427167 (getCurrentListMapNoExtraKeys!3349 (_keys!10677 thiss!1141) (_values!5781 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141)))))

(declare-fun lt!427184 () (_ BitVec 64))

(assert (=> b!948890 (= lt!427184 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427179 () (_ BitVec 64))

(assert (=> b!948890 (= lt!427179 (select (arr!27612 (_keys!10677 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427172 () Unit!31843)

(declare-fun addStillContains!566 (ListLongMap!12263 (_ BitVec 64) V!32591 (_ BitVec 64)) Unit!31843)

(assert (=> b!948890 (= lt!427172 (addStillContains!566 lt!427167 lt!427184 (zeroValue!5594 thiss!1141) lt!427179))))

(assert (=> b!948890 (contains!5176 (+!2877 lt!427167 (tuple2!13577 lt!427184 (zeroValue!5594 thiss!1141))) lt!427179)))

(declare-fun lt!427177 () Unit!31843)

(assert (=> b!948890 (= lt!427177 lt!427172)))

(declare-fun lt!427171 () ListLongMap!12263)

(assert (=> b!948890 (= lt!427171 (getCurrentListMapNoExtraKeys!3349 (_keys!10677 thiss!1141) (_values!5781 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141)))))

(declare-fun lt!427182 () (_ BitVec 64))

(assert (=> b!948890 (= lt!427182 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427165 () (_ BitVec 64))

(assert (=> b!948890 (= lt!427165 (select (arr!27612 (_keys!10677 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427176 () Unit!31843)

(declare-fun addApplyDifferent!446 (ListLongMap!12263 (_ BitVec 64) V!32591 (_ BitVec 64)) Unit!31843)

(assert (=> b!948890 (= lt!427176 (addApplyDifferent!446 lt!427171 lt!427182 (minValue!5594 thiss!1141) lt!427165))))

(assert (=> b!948890 (= (apply!867 (+!2877 lt!427171 (tuple2!13577 lt!427182 (minValue!5594 thiss!1141))) lt!427165) (apply!867 lt!427171 lt!427165))))

(declare-fun lt!427166 () Unit!31843)

(assert (=> b!948890 (= lt!427166 lt!427176)))

(declare-fun lt!427181 () ListLongMap!12263)

(assert (=> b!948890 (= lt!427181 (getCurrentListMapNoExtraKeys!3349 (_keys!10677 thiss!1141) (_values!5781 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141)))))

(declare-fun lt!427180 () (_ BitVec 64))

(assert (=> b!948890 (= lt!427180 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427164 () (_ BitVec 64))

(assert (=> b!948890 (= lt!427164 (select (arr!27612 (_keys!10677 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427183 () Unit!31843)

(assert (=> b!948890 (= lt!427183 (addApplyDifferent!446 lt!427181 lt!427180 (zeroValue!5594 thiss!1141) lt!427164))))

(assert (=> b!948890 (= (apply!867 (+!2877 lt!427181 (tuple2!13577 lt!427180 (zeroValue!5594 thiss!1141))) lt!427164) (apply!867 lt!427181 lt!427164))))

(declare-fun lt!427170 () Unit!31843)

(assert (=> b!948890 (= lt!427170 lt!427183)))

(declare-fun lt!427178 () ListLongMap!12263)

(assert (=> b!948890 (= lt!427178 (getCurrentListMapNoExtraKeys!3349 (_keys!10677 thiss!1141) (_values!5781 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141)))))

(declare-fun lt!427185 () (_ BitVec 64))

(assert (=> b!948890 (= lt!427185 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427175 () (_ BitVec 64))

(assert (=> b!948890 (= lt!427175 (select (arr!27612 (_keys!10677 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!948890 (= lt!427169 (addApplyDifferent!446 lt!427178 lt!427185 (minValue!5594 thiss!1141) lt!427175))))

(assert (=> b!948890 (= (apply!867 (+!2877 lt!427178 (tuple2!13577 lt!427185 (minValue!5594 thiss!1141))) lt!427175) (apply!867 lt!427178 lt!427175))))

(declare-fun b!948891 () Bool)

(assert (=> b!948891 (= e!534166 e!534178)))

(assert (=> b!948891 (= c!98941 (and (not (= (bvand (extraKeys!5490 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5490 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!41244 () Bool)

(assert (=> bm!41244 (= call!41242 call!41244)))

(declare-fun b!948892 () Bool)

(assert (=> b!948892 (= e!534168 (not call!41248))))

(declare-fun bm!41245 () Bool)

(assert (=> bm!41245 (= call!41243 call!41246)))

(declare-fun b!948893 () Bool)

(assert (=> b!948893 (= e!534177 call!41242)))

(declare-fun b!948894 () Bool)

(declare-fun res!636493 () Bool)

(assert (=> b!948894 (=> (not res!636493) (not e!534176))))

(assert (=> b!948894 (= res!636493 e!534173)))

(declare-fun res!636490 () Bool)

(assert (=> b!948894 (=> res!636490 e!534173)))

(assert (=> b!948894 (= res!636490 (not e!534172))))

(declare-fun res!636486 () Bool)

(assert (=> b!948894 (=> (not res!636486) (not e!534172))))

(assert (=> b!948894 (= res!636486 (bvslt #b00000000000000000000000000000000 (size!28089 (_keys!10677 thiss!1141))))))

(assert (= (and d!114761 c!98938) b!948881))

(assert (= (and d!114761 (not c!98938)) b!948891))

(assert (= (and b!948891 c!98941) b!948886))

(assert (= (and b!948891 (not c!98941)) b!948877))

(assert (= (and b!948877 c!98943) b!948893))

(assert (= (and b!948877 (not c!98943)) b!948883))

(assert (= (or b!948893 b!948883) bm!41242))

(assert (= (or b!948886 bm!41242) bm!41245))

(assert (= (or b!948886 b!948893) bm!41244))

(assert (= (or b!948881 bm!41245) bm!41243))

(assert (= (or b!948881 bm!41244) bm!41239))

(assert (= (and d!114761 res!636488) b!948875))

(assert (= (and d!114761 c!98940) b!948890))

(assert (= (and d!114761 (not c!98940)) b!948880))

(assert (= (and d!114761 res!636485) b!948894))

(assert (= (and b!948894 res!636486) b!948874))

(assert (= (and b!948894 (not res!636490)) b!948878))

(assert (= (and b!948878 res!636489) b!948879))

(assert (= (and b!948894 res!636493) b!948887))

(assert (= (and b!948887 c!98939) b!948884))

(assert (= (and b!948887 (not c!98939)) b!948889))

(assert (= (and b!948884 res!636487) b!948876))

(assert (= (or b!948884 b!948889) bm!41240))

(assert (= (and b!948887 res!636492) b!948882))

(assert (= (and b!948882 c!98942) b!948888))

(assert (= (and b!948882 (not c!98942)) b!948892))

(assert (= (and b!948888 res!636491) b!948885))

(assert (= (or b!948888 b!948892) bm!41241))

(declare-fun b_lambda!14317 () Bool)

(assert (=> (not b_lambda!14317) (not b!948879)))

(declare-fun t!27652 () Bool)

(declare-fun tb!6175 () Bool)

(assert (=> (and b!948737 (= (defaultEntry!5758 thiss!1141) (defaultEntry!5758 thiss!1141)) t!27652) tb!6175))

(declare-fun result!12263 () Bool)

(assert (=> tb!6175 (= result!12263 tp_is_empty!20719)))

(assert (=> b!948879 t!27652))

(declare-fun b_and!29631 () Bool)

(assert (= b_and!29625 (and (=> t!27652 result!12263) b_and!29631)))

(declare-fun m!880983 () Bool)

(assert (=> b!948878 m!880983))

(assert (=> b!948878 m!880983))

(declare-fun m!880985 () Bool)

(assert (=> b!948878 m!880985))

(declare-fun m!880987 () Bool)

(assert (=> b!948890 m!880987))

(declare-fun m!880989 () Bool)

(assert (=> b!948890 m!880989))

(declare-fun m!880991 () Bool)

(assert (=> b!948890 m!880991))

(declare-fun m!880993 () Bool)

(assert (=> b!948890 m!880993))

(declare-fun m!880995 () Bool)

(assert (=> b!948890 m!880995))

(assert (=> b!948890 m!880995))

(declare-fun m!880997 () Bool)

(assert (=> b!948890 m!880997))

(declare-fun m!880999 () Bool)

(assert (=> b!948890 m!880999))

(declare-fun m!881001 () Bool)

(assert (=> b!948890 m!881001))

(declare-fun m!881003 () Bool)

(assert (=> b!948890 m!881003))

(declare-fun m!881005 () Bool)

(assert (=> b!948890 m!881005))

(declare-fun m!881007 () Bool)

(assert (=> b!948890 m!881007))

(assert (=> b!948890 m!880983))

(declare-fun m!881009 () Bool)

(assert (=> b!948890 m!881009))

(assert (=> b!948890 m!881003))

(assert (=> b!948890 m!880989))

(declare-fun m!881011 () Bool)

(assert (=> b!948890 m!881011))

(declare-fun m!881013 () Bool)

(assert (=> b!948890 m!881013))

(declare-fun m!881015 () Bool)

(assert (=> b!948890 m!881015))

(assert (=> b!948890 m!881013))

(declare-fun m!881017 () Bool)

(assert (=> b!948890 m!881017))

(assert (=> bm!41243 m!881017))

(declare-fun m!881019 () Bool)

(assert (=> b!948876 m!881019))

(declare-fun m!881021 () Bool)

(assert (=> bm!41240 m!881021))

(assert (=> b!948874 m!880983))

(assert (=> b!948874 m!880983))

(declare-fun m!881023 () Bool)

(assert (=> b!948874 m!881023))

(declare-fun m!881025 () Bool)

(assert (=> bm!41239 m!881025))

(assert (=> d!114761 m!880917))

(declare-fun m!881027 () Bool)

(assert (=> b!948879 m!881027))

(assert (=> b!948879 m!880983))

(declare-fun m!881029 () Bool)

(assert (=> b!948879 m!881029))

(assert (=> b!948879 m!881027))

(declare-fun m!881031 () Bool)

(assert (=> b!948879 m!881031))

(assert (=> b!948879 m!881029))

(assert (=> b!948879 m!880983))

(declare-fun m!881033 () Bool)

(assert (=> b!948879 m!881033))

(declare-fun m!881035 () Bool)

(assert (=> b!948881 m!881035))

(assert (=> b!948875 m!880983))

(assert (=> b!948875 m!880983))

(assert (=> b!948875 m!881023))

(declare-fun m!881037 () Bool)

(assert (=> bm!41241 m!881037))

(declare-fun m!881039 () Bool)

(assert (=> b!948885 m!881039))

(assert (=> b!948734 d!114761))

(declare-fun mapNonEmpty!32985 () Bool)

(declare-fun mapRes!32985 () Bool)

(declare-fun tp!63231 () Bool)

(declare-fun e!534184 () Bool)

(assert (=> mapNonEmpty!32985 (= mapRes!32985 (and tp!63231 e!534184))))

(declare-fun mapKey!32985 () (_ BitVec 32))

(declare-fun mapValue!32985 () ValueCell!9878)

(declare-fun mapRest!32985 () (Array (_ BitVec 32) ValueCell!9878))

(assert (=> mapNonEmpty!32985 (= mapRest!32976 (store mapRest!32985 mapKey!32985 mapValue!32985))))

(declare-fun mapIsEmpty!32985 () Bool)

(assert (=> mapIsEmpty!32985 mapRes!32985))

(declare-fun b!948903 () Bool)

(assert (=> b!948903 (= e!534184 tp_is_empty!20719)))

(declare-fun condMapEmpty!32985 () Bool)

(declare-fun mapDefault!32985 () ValueCell!9878)

(assert (=> mapNonEmpty!32976 (= condMapEmpty!32985 (= mapRest!32976 ((as const (Array (_ BitVec 32) ValueCell!9878)) mapDefault!32985)))))

(declare-fun e!534183 () Bool)

(assert (=> mapNonEmpty!32976 (= tp!63216 (and e!534183 mapRes!32985))))

(declare-fun b!948904 () Bool)

(assert (=> b!948904 (= e!534183 tp_is_empty!20719)))

(assert (= (and mapNonEmpty!32976 condMapEmpty!32985) mapIsEmpty!32985))

(assert (= (and mapNonEmpty!32976 (not condMapEmpty!32985)) mapNonEmpty!32985))

(assert (= (and mapNonEmpty!32985 ((_ is ValueCellFull!9878) mapValue!32985)) b!948903))

(assert (= (and mapNonEmpty!32976 ((_ is ValueCellFull!9878) mapDefault!32985)) b!948904))

(declare-fun m!881041 () Bool)

(assert (=> mapNonEmpty!32985 m!881041))

(declare-fun b_lambda!14319 () Bool)

(assert (= b_lambda!14317 (or (and b!948737 b_free!18211) b_lambda!14319)))

(check-sat (not b!948890) tp_is_empty!20719 (not b!948831) (not d!114757) (not b!948878) (not b_next!18211) (not bm!41243) (not b!948874) (not b!948879) (not b!948803) (not b!948829) (not b!948876) (not b!948804) b_and!29631 (not bm!41240) (not b!948881) (not b!948875) (not d!114755) (not b!948802) (not d!114761) (not b!948820) (not bm!41239) (not d!114759) (not b_lambda!14319) (not b!948885) (not bm!41241) (not mapNonEmpty!32985))
(check-sat b_and!29631 (not b_next!18211))
(get-model)

(declare-fun d!114763 () Bool)

(declare-fun get!14507 (Option!502) V!32591)

(assert (=> d!114763 (= (apply!867 lt!427173 #b1000000000000000000000000000000000000000000000000000000000000000) (get!14507 (getValueByKey!496 (toList!6147 lt!427173) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26642 () Bool)

(assert (= bs!26642 d!114763))

(declare-fun m!881043 () Bool)

(assert (=> bs!26642 m!881043))

(assert (=> bs!26642 m!881043))

(declare-fun m!881045 () Bool)

(assert (=> bs!26642 m!881045))

(assert (=> b!948885 d!114763))

(declare-fun d!114765 () Bool)

(declare-fun e!534185 () Bool)

(assert (=> d!114765 e!534185))

(declare-fun res!636494 () Bool)

(assert (=> d!114765 (=> res!636494 e!534185)))

(declare-fun lt!427187 () Bool)

(assert (=> d!114765 (= res!636494 (not lt!427187))))

(declare-fun lt!427188 () Bool)

(assert (=> d!114765 (= lt!427187 lt!427188)))

(declare-fun lt!427189 () Unit!31843)

(declare-fun e!534186 () Unit!31843)

(assert (=> d!114765 (= lt!427189 e!534186)))

(declare-fun c!98944 () Bool)

(assert (=> d!114765 (= c!98944 lt!427188)))

(assert (=> d!114765 (= lt!427188 (containsKey!460 (toList!6147 lt!427173) (select (arr!27612 (_keys!10677 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!114765 (= (contains!5176 lt!427173 (select (arr!27612 (_keys!10677 thiss!1141)) #b00000000000000000000000000000000)) lt!427187)))

(declare-fun b!948905 () Bool)

(declare-fun lt!427186 () Unit!31843)

(assert (=> b!948905 (= e!534186 lt!427186)))

(assert (=> b!948905 (= lt!427186 (lemmaContainsKeyImpliesGetValueByKeyDefined!355 (toList!6147 lt!427173) (select (arr!27612 (_keys!10677 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!948905 (isDefined!368 (getValueByKey!496 (toList!6147 lt!427173) (select (arr!27612 (_keys!10677 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!948906 () Bool)

(declare-fun Unit!31847 () Unit!31843)

(assert (=> b!948906 (= e!534186 Unit!31847)))

(declare-fun b!948907 () Bool)

(assert (=> b!948907 (= e!534185 (isDefined!368 (getValueByKey!496 (toList!6147 lt!427173) (select (arr!27612 (_keys!10677 thiss!1141)) #b00000000000000000000000000000000))))))

(assert (= (and d!114765 c!98944) b!948905))

(assert (= (and d!114765 (not c!98944)) b!948906))

(assert (= (and d!114765 (not res!636494)) b!948907))

(assert (=> d!114765 m!880983))

(declare-fun m!881047 () Bool)

(assert (=> d!114765 m!881047))

(assert (=> b!948905 m!880983))

(declare-fun m!881049 () Bool)

(assert (=> b!948905 m!881049))

(assert (=> b!948905 m!880983))

(declare-fun m!881051 () Bool)

(assert (=> b!948905 m!881051))

(assert (=> b!948905 m!881051))

(declare-fun m!881053 () Bool)

(assert (=> b!948905 m!881053))

(assert (=> b!948907 m!880983))

(assert (=> b!948907 m!881051))

(assert (=> b!948907 m!881051))

(assert (=> b!948907 m!881053))

(assert (=> b!948878 d!114765))

(declare-fun d!114767 () Bool)

(assert (=> d!114767 (isDefined!368 (getValueByKey!496 (toList!6147 (getCurrentListMap!3309 (_keys!10677 thiss!1141) (_values!5781 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141))) key!756))))

(declare-fun lt!427192 () Unit!31843)

(declare-fun choose!1587 (List!19326 (_ BitVec 64)) Unit!31843)

(assert (=> d!114767 (= lt!427192 (choose!1587 (toList!6147 (getCurrentListMap!3309 (_keys!10677 thiss!1141) (_values!5781 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141))) key!756))))

(declare-fun e!534189 () Bool)

(assert (=> d!114767 e!534189))

(declare-fun res!636497 () Bool)

(assert (=> d!114767 (=> (not res!636497) (not e!534189))))

(declare-fun isStrictlySorted!506 (List!19326) Bool)

(assert (=> d!114767 (= res!636497 (isStrictlySorted!506 (toList!6147 (getCurrentListMap!3309 (_keys!10677 thiss!1141) (_values!5781 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141)))))))

(assert (=> d!114767 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!355 (toList!6147 (getCurrentListMap!3309 (_keys!10677 thiss!1141) (_values!5781 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141))) key!756) lt!427192)))

(declare-fun b!948910 () Bool)

(assert (=> b!948910 (= e!534189 (containsKey!460 (toList!6147 (getCurrentListMap!3309 (_keys!10677 thiss!1141) (_values!5781 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141))) key!756))))

(assert (= (and d!114767 res!636497) b!948910))

(assert (=> d!114767 m!880979))

(assert (=> d!114767 m!880979))

(assert (=> d!114767 m!880981))

(declare-fun m!881055 () Bool)

(assert (=> d!114767 m!881055))

(declare-fun m!881057 () Bool)

(assert (=> d!114767 m!881057))

(assert (=> b!948910 m!880975))

(assert (=> b!948829 d!114767))

(declare-fun d!114769 () Bool)

(declare-fun isEmpty!713 (Option!502) Bool)

(assert (=> d!114769 (= (isDefined!368 (getValueByKey!496 (toList!6147 (getCurrentListMap!3309 (_keys!10677 thiss!1141) (_values!5781 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141))) key!756)) (not (isEmpty!713 (getValueByKey!496 (toList!6147 (getCurrentListMap!3309 (_keys!10677 thiss!1141) (_values!5781 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141))) key!756))))))

(declare-fun bs!26643 () Bool)

(assert (= bs!26643 d!114769))

(assert (=> bs!26643 m!880979))

(declare-fun m!881059 () Bool)

(assert (=> bs!26643 m!881059))

(assert (=> b!948829 d!114769))

(declare-fun b!948921 () Bool)

(declare-fun e!534195 () Option!502)

(assert (=> b!948921 (= e!534195 (getValueByKey!496 (t!27648 (toList!6147 (getCurrentListMap!3309 (_keys!10677 thiss!1141) (_values!5781 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141)))) key!756))))

(declare-fun d!114771 () Bool)

(declare-fun c!98949 () Bool)

(assert (=> d!114771 (= c!98949 (and ((_ is Cons!19322) (toList!6147 (getCurrentListMap!3309 (_keys!10677 thiss!1141) (_values!5781 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141)))) (= (_1!6799 (h!20480 (toList!6147 (getCurrentListMap!3309 (_keys!10677 thiss!1141) (_values!5781 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141))))) key!756)))))

(declare-fun e!534194 () Option!502)

(assert (=> d!114771 (= (getValueByKey!496 (toList!6147 (getCurrentListMap!3309 (_keys!10677 thiss!1141) (_values!5781 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141))) key!756) e!534194)))

(declare-fun b!948920 () Bool)

(assert (=> b!948920 (= e!534194 e!534195)))

(declare-fun c!98950 () Bool)

(assert (=> b!948920 (= c!98950 (and ((_ is Cons!19322) (toList!6147 (getCurrentListMap!3309 (_keys!10677 thiss!1141) (_values!5781 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141)))) (not (= (_1!6799 (h!20480 (toList!6147 (getCurrentListMap!3309 (_keys!10677 thiss!1141) (_values!5781 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141))))) key!756))))))

(declare-fun b!948919 () Bool)

(assert (=> b!948919 (= e!534194 (Some!501 (_2!6799 (h!20480 (toList!6147 (getCurrentListMap!3309 (_keys!10677 thiss!1141) (_values!5781 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141)))))))))

(declare-fun b!948922 () Bool)

(assert (=> b!948922 (= e!534195 None!500)))

(assert (= (and d!114771 c!98949) b!948919))

(assert (= (and d!114771 (not c!98949)) b!948920))

(assert (= (and b!948920 c!98950) b!948921))

(assert (= (and b!948920 (not c!98950)) b!948922))

(declare-fun m!881061 () Bool)

(assert (=> b!948921 m!881061))

(assert (=> b!948829 d!114771))

(declare-fun d!114773 () Bool)

(declare-fun res!636502 () Bool)

(declare-fun e!534200 () Bool)

(assert (=> d!114773 (=> res!636502 e!534200)))

(assert (=> d!114773 (= res!636502 (and ((_ is Cons!19322) (toList!6147 (getCurrentListMap!3309 (_keys!10677 thiss!1141) (_values!5781 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141)))) (= (_1!6799 (h!20480 (toList!6147 (getCurrentListMap!3309 (_keys!10677 thiss!1141) (_values!5781 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141))))) key!756)))))

(assert (=> d!114773 (= (containsKey!460 (toList!6147 (getCurrentListMap!3309 (_keys!10677 thiss!1141) (_values!5781 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141))) key!756) e!534200)))

(declare-fun b!948927 () Bool)

(declare-fun e!534201 () Bool)

(assert (=> b!948927 (= e!534200 e!534201)))

(declare-fun res!636503 () Bool)

(assert (=> b!948927 (=> (not res!636503) (not e!534201))))

(assert (=> b!948927 (= res!636503 (and (or (not ((_ is Cons!19322) (toList!6147 (getCurrentListMap!3309 (_keys!10677 thiss!1141) (_values!5781 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141))))) (bvsle (_1!6799 (h!20480 (toList!6147 (getCurrentListMap!3309 (_keys!10677 thiss!1141) (_values!5781 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141))))) key!756)) ((_ is Cons!19322) (toList!6147 (getCurrentListMap!3309 (_keys!10677 thiss!1141) (_values!5781 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141)))) (bvslt (_1!6799 (h!20480 (toList!6147 (getCurrentListMap!3309 (_keys!10677 thiss!1141) (_values!5781 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141))))) key!756)))))

(declare-fun b!948928 () Bool)

(assert (=> b!948928 (= e!534201 (containsKey!460 (t!27648 (toList!6147 (getCurrentListMap!3309 (_keys!10677 thiss!1141) (_values!5781 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141)))) key!756))))

(assert (= (and d!114773 (not res!636502)) b!948927))

(assert (= (and b!948927 res!636503) b!948928))

(declare-fun m!881063 () Bool)

(assert (=> b!948928 m!881063))

(assert (=> d!114759 d!114773))

(declare-fun d!114775 () Bool)

(assert (=> d!114775 (= (apply!867 lt!427173 #b0000000000000000000000000000000000000000000000000000000000000000) (get!14507 (getValueByKey!496 (toList!6147 lt!427173) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26644 () Bool)

(assert (= bs!26644 d!114775))

(declare-fun m!881065 () Bool)

(assert (=> bs!26644 m!881065))

(assert (=> bs!26644 m!881065))

(declare-fun m!881067 () Bool)

(assert (=> bs!26644 m!881067))

(assert (=> b!948876 d!114775))

(declare-fun bm!41248 () Bool)

(declare-fun call!41251 () Bool)

(declare-fun c!98953 () Bool)

(assert (=> bm!41248 (= call!41251 (arrayNoDuplicates!0 (_keys!10677 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98953 (Cons!19325 (select (arr!27612 (_keys!10677 thiss!1141)) #b00000000000000000000000000000000) Nil!19326) Nil!19326)))))

(declare-fun d!114777 () Bool)

(declare-fun res!636512 () Bool)

(declare-fun e!534212 () Bool)

(assert (=> d!114777 (=> res!636512 e!534212)))

(assert (=> d!114777 (= res!636512 (bvsge #b00000000000000000000000000000000 (size!28089 (_keys!10677 thiss!1141))))))

(assert (=> d!114777 (= (arrayNoDuplicates!0 (_keys!10677 thiss!1141) #b00000000000000000000000000000000 Nil!19326) e!534212)))

(declare-fun b!948939 () Bool)

(declare-fun e!534213 () Bool)

(assert (=> b!948939 (= e!534212 e!534213)))

(declare-fun res!636511 () Bool)

(assert (=> b!948939 (=> (not res!636511) (not e!534213))))

(declare-fun e!534210 () Bool)

(assert (=> b!948939 (= res!636511 (not e!534210))))

(declare-fun res!636510 () Bool)

(assert (=> b!948939 (=> (not res!636510) (not e!534210))))

(assert (=> b!948939 (= res!636510 (validKeyInArray!0 (select (arr!27612 (_keys!10677 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!948940 () Bool)

(declare-fun e!534211 () Bool)

(assert (=> b!948940 (= e!534213 e!534211)))

(assert (=> b!948940 (= c!98953 (validKeyInArray!0 (select (arr!27612 (_keys!10677 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!948941 () Bool)

(declare-fun contains!5179 (List!19329 (_ BitVec 64)) Bool)

(assert (=> b!948941 (= e!534210 (contains!5179 Nil!19326 (select (arr!27612 (_keys!10677 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!948942 () Bool)

(assert (=> b!948942 (= e!534211 call!41251)))

(declare-fun b!948943 () Bool)

(assert (=> b!948943 (= e!534211 call!41251)))

(assert (= (and d!114777 (not res!636512)) b!948939))

(assert (= (and b!948939 res!636510) b!948941))

(assert (= (and b!948939 res!636511) b!948940))

(assert (= (and b!948940 c!98953) b!948943))

(assert (= (and b!948940 (not c!98953)) b!948942))

(assert (= (or b!948943 b!948942) bm!41248))

(assert (=> bm!41248 m!880983))

(declare-fun m!881069 () Bool)

(assert (=> bm!41248 m!881069))

(assert (=> b!948939 m!880983))

(assert (=> b!948939 m!880983))

(assert (=> b!948939 m!881023))

(assert (=> b!948940 m!880983))

(assert (=> b!948940 m!880983))

(assert (=> b!948940 m!881023))

(assert (=> b!948941 m!880983))

(assert (=> b!948941 m!880983))

(declare-fun m!881071 () Bool)

(assert (=> b!948941 m!881071))

(assert (=> b!948804 d!114777))

(declare-fun d!114779 () Bool)

(declare-fun e!534214 () Bool)

(assert (=> d!114779 e!534214))

(declare-fun res!636513 () Bool)

(assert (=> d!114779 (=> res!636513 e!534214)))

(declare-fun lt!427194 () Bool)

(assert (=> d!114779 (= res!636513 (not lt!427194))))

(declare-fun lt!427195 () Bool)

(assert (=> d!114779 (= lt!427194 lt!427195)))

(declare-fun lt!427196 () Unit!31843)

(declare-fun e!534215 () Unit!31843)

(assert (=> d!114779 (= lt!427196 e!534215)))

(declare-fun c!98954 () Bool)

(assert (=> d!114779 (= c!98954 lt!427195)))

(assert (=> d!114779 (= lt!427195 (containsKey!460 (toList!6147 lt!427173) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!114779 (= (contains!5176 lt!427173 #b0000000000000000000000000000000000000000000000000000000000000000) lt!427194)))

(declare-fun b!948944 () Bool)

(declare-fun lt!427193 () Unit!31843)

(assert (=> b!948944 (= e!534215 lt!427193)))

(assert (=> b!948944 (= lt!427193 (lemmaContainsKeyImpliesGetValueByKeyDefined!355 (toList!6147 lt!427173) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!948944 (isDefined!368 (getValueByKey!496 (toList!6147 lt!427173) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!948945 () Bool)

(declare-fun Unit!31848 () Unit!31843)

(assert (=> b!948945 (= e!534215 Unit!31848)))

(declare-fun b!948946 () Bool)

(assert (=> b!948946 (= e!534214 (isDefined!368 (getValueByKey!496 (toList!6147 lt!427173) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!114779 c!98954) b!948944))

(assert (= (and d!114779 (not c!98954)) b!948945))

(assert (= (and d!114779 (not res!636513)) b!948946))

(declare-fun m!881073 () Bool)

(assert (=> d!114779 m!881073))

(declare-fun m!881075 () Bool)

(assert (=> b!948944 m!881075))

(assert (=> b!948944 m!881065))

(assert (=> b!948944 m!881065))

(declare-fun m!881077 () Bool)

(assert (=> b!948944 m!881077))

(assert (=> b!948946 m!881065))

(assert (=> b!948946 m!881065))

(assert (=> b!948946 m!881077))

(assert (=> bm!41240 d!114779))

(declare-fun b!948971 () Bool)

(declare-fun e!534235 () Bool)

(declare-fun lt!427211 () ListLongMap!12263)

(assert (=> b!948971 (= e!534235 (= lt!427211 (getCurrentListMapNoExtraKeys!3349 (_keys!10677 thiss!1141) (_values!5781 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5758 thiss!1141))))))

(declare-fun b!948972 () Bool)

(declare-fun e!534236 () ListLongMap!12263)

(declare-fun e!534231 () ListLongMap!12263)

(assert (=> b!948972 (= e!534236 e!534231)))

(declare-fun c!98964 () Bool)

(assert (=> b!948972 (= c!98964 (validKeyInArray!0 (select (arr!27612 (_keys!10677 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41251 () Bool)

(declare-fun call!41254 () ListLongMap!12263)

(assert (=> bm!41251 (= call!41254 (getCurrentListMapNoExtraKeys!3349 (_keys!10677 thiss!1141) (_values!5781 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5758 thiss!1141)))))

(declare-fun b!948973 () Bool)

(declare-fun e!534232 () Bool)

(declare-fun e!534233 () Bool)

(assert (=> b!948973 (= e!534232 e!534233)))

(assert (=> b!948973 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28089 (_keys!10677 thiss!1141))))))

(declare-fun res!636522 () Bool)

(assert (=> b!948973 (= res!636522 (contains!5176 lt!427211 (select (arr!27612 (_keys!10677 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!948973 (=> (not res!636522) (not e!534233))))

(declare-fun b!948974 () Bool)

(assert (=> b!948974 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28089 (_keys!10677 thiss!1141))))))

(assert (=> b!948974 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28088 (_values!5781 thiss!1141))))))

(assert (=> b!948974 (= e!534233 (= (apply!867 lt!427211 (select (arr!27612 (_keys!10677 thiss!1141)) #b00000000000000000000000000000000)) (get!14506 (select (arr!27611 (_values!5781 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1633 (defaultEntry!5758 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!948975 () Bool)

(declare-fun e!534234 () Bool)

(assert (=> b!948975 (= e!534234 e!534232)))

(declare-fun c!98963 () Bool)

(declare-fun e!534230 () Bool)

(assert (=> b!948975 (= c!98963 e!534230)))

(declare-fun res!636523 () Bool)

(assert (=> b!948975 (=> (not res!636523) (not e!534230))))

(assert (=> b!948975 (= res!636523 (bvslt #b00000000000000000000000000000000 (size!28089 (_keys!10677 thiss!1141))))))

(declare-fun b!948976 () Bool)

(assert (=> b!948976 (= e!534231 call!41254)))

(declare-fun b!948977 () Bool)

(assert (=> b!948977 (= e!534230 (validKeyInArray!0 (select (arr!27612 (_keys!10677 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!948977 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!948978 () Bool)

(declare-fun res!636525 () Bool)

(assert (=> b!948978 (=> (not res!636525) (not e!534234))))

(assert (=> b!948978 (= res!636525 (not (contains!5176 lt!427211 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!948980 () Bool)

(declare-fun isEmpty!714 (ListLongMap!12263) Bool)

(assert (=> b!948980 (= e!534235 (isEmpty!714 lt!427211))))

(declare-fun b!948981 () Bool)

(declare-fun lt!427213 () Unit!31843)

(declare-fun lt!427216 () Unit!31843)

(assert (=> b!948981 (= lt!427213 lt!427216)))

(declare-fun lt!427215 () (_ BitVec 64))

(declare-fun lt!427214 () (_ BitVec 64))

(declare-fun lt!427217 () ListLongMap!12263)

(declare-fun lt!427212 () V!32591)

(assert (=> b!948981 (not (contains!5176 (+!2877 lt!427217 (tuple2!13577 lt!427214 lt!427212)) lt!427215))))

(declare-fun addStillNotContains!226 (ListLongMap!12263 (_ BitVec 64) V!32591 (_ BitVec 64)) Unit!31843)

(assert (=> b!948981 (= lt!427216 (addStillNotContains!226 lt!427217 lt!427214 lt!427212 lt!427215))))

(assert (=> b!948981 (= lt!427215 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!948981 (= lt!427212 (get!14506 (select (arr!27611 (_values!5781 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1633 (defaultEntry!5758 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!948981 (= lt!427214 (select (arr!27612 (_keys!10677 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!948981 (= lt!427217 call!41254)))

(assert (=> b!948981 (= e!534231 (+!2877 call!41254 (tuple2!13577 (select (arr!27612 (_keys!10677 thiss!1141)) #b00000000000000000000000000000000) (get!14506 (select (arr!27611 (_values!5781 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1633 (defaultEntry!5758 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!948982 () Bool)

(assert (=> b!948982 (= e!534236 (ListLongMap!12264 Nil!19323))))

(declare-fun d!114781 () Bool)

(assert (=> d!114781 e!534234))

(declare-fun res!636524 () Bool)

(assert (=> d!114781 (=> (not res!636524) (not e!534234))))

(assert (=> d!114781 (= res!636524 (not (contains!5176 lt!427211 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!114781 (= lt!427211 e!534236)))

(declare-fun c!98966 () Bool)

(assert (=> d!114781 (= c!98966 (bvsge #b00000000000000000000000000000000 (size!28089 (_keys!10677 thiss!1141))))))

(assert (=> d!114781 (validMask!0 (mask!27523 thiss!1141))))

(assert (=> d!114781 (= (getCurrentListMapNoExtraKeys!3349 (_keys!10677 thiss!1141) (_values!5781 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5490 thiss!1141) (zeroValue!5594 thiss!1141) (minValue!5594 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5758 thiss!1141)) lt!427211)))

(declare-fun b!948979 () Bool)

(assert (=> b!948979 (= e!534232 e!534235)))

(declare-fun c!98965 () Bool)

(assert (=> b!948979 (= c!98965 (bvslt #b00000000000000000000000000000000 (size!28089 (_keys!10677 thiss!1141))))))

(assert (= (and d!114781 c!98966) b!948982))

(assert (= (and d!114781 (not c!98966)) b!948972))

(assert (= (and b!948972 c!98964) b!948981))

(assert (= (and b!948972 (not c!98964)) b!948976))

(assert (= (or b!948981 b!948976) bm!41251))

(assert (= (and d!114781 res!636524) b!948978))

(assert (= (and b!948978 res!636525) b!948975))

(assert (= (and b!948975 res!636523) b!948977))

(assert (= (and b!948975 c!98963) b!948973))

(assert (= (and b!948975 (not c!98963)) b!948979))

(assert (= (and b!948973 res!636522) b!948974))

(assert (= (and b!948979 c!98965) b!948971))

(assert (= (and b!948979 (not c!98965)) b!948980))

(declare-fun b_lambda!14321 () Bool)

(assert (=> (not b_lambda!14321) (not b!948974)))

(assert (=> b!948974 t!27652))

(declare-fun b_and!29633 () Bool)

(assert (= b_and!29631 (and (=> t!27652 result!12263) b_and!29633)))

(declare-fun b_lambda!14323 () Bool)

(assert (=> (not b_lambda!14323) (not b!948981)))

(assert (=> b!948981 t!27652))

(declare-fun b_and!29635 () Bool)

(assert (= b_and!29633 (and (=> t!27652 result!12263) b_and!29635)))

(declare-fun m!881079 () Bool)

(assert (=> b!948971 m!881079))

(declare-fun m!881081 () Bool)

(assert (=> d!114781 m!881081))

(assert (=> d!114781 m!880917))

(declare-fun m!881083 () Bool)

(assert (=> b!948980 m!881083))

(assert (=> b!948974 m!880983))

(declare-fun m!881085 () Bool)

(assert (=> b!948974 m!881085))

(assert (=> b!948974 m!881029))

(assert (=> b!948974 m!880983))

(assert (=> b!948974 m!881027))

(assert (=> b!948974 m!881029))

(assert (=> b!948974 m!881027))

(assert (=> b!948974 m!881031))

(assert (=> b!948972 m!880983))

(assert (=> b!948972 m!880983))

(assert (=> b!948972 m!881023))

(assert (=> b!948973 m!880983))

(assert (=> b!948973 m!880983))

(declare-fun m!881087 () Bool)

(assert (=> b!948973 m!881087))

(assert (=> bm!41251 m!881079))

(declare-fun m!881089 () Bool)

(assert (=> b!948978 m!881089))

(assert (=> b!948977 m!880983))

(assert (=> b!948977 m!880983))

(assert (=> b!948977 m!881023))

(declare-fun m!881091 () Bool)

(assert (=> b!948981 m!881091))

(declare-fun m!881093 () Bool)

(assert (=> b!948981 m!881093))

(declare-fun m!881095 () Bool)

(assert (=> b!948981 m!881095))

(assert (=> b!948981 m!881091))

(assert (=> b!948981 m!881029))

(assert (=> b!948981 m!880983))

(declare-fun m!881097 () Bool)

(assert (=> b!948981 m!881097))

(assert (=> b!948981 m!881027))

(assert (=> b!948981 m!881029))

(assert (=> b!948981 m!881027))

(assert (=> b!948981 m!881031))

(assert (=> bm!41243 d!114781))

(declare-fun d!114783 () Bool)

(declare-fun e!534239 () Bool)

(assert (=> d!114783 e!534239))

(declare-fun res!636531 () Bool)

(assert (=> d!114783 (=> (not res!636531) (not e!534239))))

(declare-fun lt!427229 () ListLongMap!12263)

(assert (=> d!114783 (= res!636531 (contains!5176 lt!427229 (_1!6799 (ite (or c!98938 c!98941) (tuple2!13577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5594 thiss!1141)) (tuple2!13577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141))))))))

(declare-fun lt!427227 () List!19326)

(assert (=> d!114783 (= lt!427229 (ListLongMap!12264 lt!427227))))

(declare-fun lt!427226 () Unit!31843)

(declare-fun lt!427228 () Unit!31843)

(assert (=> d!114783 (= lt!427226 lt!427228)))

(assert (=> d!114783 (= (getValueByKey!496 lt!427227 (_1!6799 (ite (or c!98938 c!98941) (tuple2!13577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5594 thiss!1141)) (tuple2!13577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141))))) (Some!501 (_2!6799 (ite (or c!98938 c!98941) (tuple2!13577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5594 thiss!1141)) (tuple2!13577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!265 (List!19326 (_ BitVec 64) V!32591) Unit!31843)

(assert (=> d!114783 (= lt!427228 (lemmaContainsTupThenGetReturnValue!265 lt!427227 (_1!6799 (ite (or c!98938 c!98941) (tuple2!13577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5594 thiss!1141)) (tuple2!13577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141)))) (_2!6799 (ite (or c!98938 c!98941) (tuple2!13577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5594 thiss!1141)) (tuple2!13577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141))))))))

(declare-fun insertStrictlySorted!322 (List!19326 (_ BitVec 64) V!32591) List!19326)

(assert (=> d!114783 (= lt!427227 (insertStrictlySorted!322 (toList!6147 (ite c!98938 call!41246 (ite c!98941 call!41243 call!41245))) (_1!6799 (ite (or c!98938 c!98941) (tuple2!13577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5594 thiss!1141)) (tuple2!13577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141)))) (_2!6799 (ite (or c!98938 c!98941) (tuple2!13577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5594 thiss!1141)) (tuple2!13577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141))))))))

(assert (=> d!114783 (= (+!2877 (ite c!98938 call!41246 (ite c!98941 call!41243 call!41245)) (ite (or c!98938 c!98941) (tuple2!13577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5594 thiss!1141)) (tuple2!13577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141)))) lt!427229)))

(declare-fun b!948987 () Bool)

(declare-fun res!636530 () Bool)

(assert (=> b!948987 (=> (not res!636530) (not e!534239))))

(assert (=> b!948987 (= res!636530 (= (getValueByKey!496 (toList!6147 lt!427229) (_1!6799 (ite (or c!98938 c!98941) (tuple2!13577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5594 thiss!1141)) (tuple2!13577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141))))) (Some!501 (_2!6799 (ite (or c!98938 c!98941) (tuple2!13577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5594 thiss!1141)) (tuple2!13577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141)))))))))

(declare-fun b!948988 () Bool)

(declare-fun contains!5180 (List!19326 tuple2!13576) Bool)

(assert (=> b!948988 (= e!534239 (contains!5180 (toList!6147 lt!427229) (ite (or c!98938 c!98941) (tuple2!13577 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5594 thiss!1141)) (tuple2!13577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141)))))))

(assert (= (and d!114783 res!636531) b!948987))

(assert (= (and b!948987 res!636530) b!948988))

(declare-fun m!881099 () Bool)

(assert (=> d!114783 m!881099))

(declare-fun m!881101 () Bool)

(assert (=> d!114783 m!881101))

(declare-fun m!881103 () Bool)

(assert (=> d!114783 m!881103))

(declare-fun m!881105 () Bool)

(assert (=> d!114783 m!881105))

(declare-fun m!881107 () Bool)

(assert (=> b!948987 m!881107))

(declare-fun m!881109 () Bool)

(assert (=> b!948988 m!881109))

(assert (=> bm!41239 d!114783))

(declare-fun d!114785 () Bool)

(assert (=> d!114785 (= (validKeyInArray!0 (select (arr!27612 (_keys!10677 thiss!1141)) #b00000000000000000000000000000000)) (and (not (= (select (arr!27612 (_keys!10677 thiss!1141)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27612 (_keys!10677 thiss!1141)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!948874 d!114785))

(declare-fun d!114787 () Bool)

(declare-fun res!636536 () Bool)

(declare-fun e!534247 () Bool)

(assert (=> d!114787 (=> res!636536 e!534247)))

(assert (=> d!114787 (= res!636536 (bvsge #b00000000000000000000000000000000 (size!28089 (_keys!10677 thiss!1141))))))

(assert (=> d!114787 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10677 thiss!1141) (mask!27523 thiss!1141)) e!534247)))

(declare-fun bm!41254 () Bool)

(declare-fun call!41257 () Bool)

(assert (=> bm!41254 (= call!41257 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10677 thiss!1141) (mask!27523 thiss!1141)))))

(declare-fun b!948997 () Bool)

(declare-fun e!534248 () Bool)

(assert (=> b!948997 (= e!534248 call!41257)))

(declare-fun b!948998 () Bool)

(declare-fun e!534246 () Bool)

(assert (=> b!948998 (= e!534247 e!534246)))

(declare-fun c!98969 () Bool)

(assert (=> b!948998 (= c!98969 (validKeyInArray!0 (select (arr!27612 (_keys!10677 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!948999 () Bool)

(assert (=> b!948999 (= e!534246 e!534248)))

(declare-fun lt!427238 () (_ BitVec 64))

(assert (=> b!948999 (= lt!427238 (select (arr!27612 (_keys!10677 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427237 () Unit!31843)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57415 (_ BitVec 64) (_ BitVec 32)) Unit!31843)

(assert (=> b!948999 (= lt!427237 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10677 thiss!1141) lt!427238 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57415 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!948999 (arrayContainsKey!0 (_keys!10677 thiss!1141) lt!427238 #b00000000000000000000000000000000)))

(declare-fun lt!427236 () Unit!31843)

(assert (=> b!948999 (= lt!427236 lt!427237)))

(declare-fun res!636537 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57415 (_ BitVec 32)) SeekEntryResult!9129)

(assert (=> b!948999 (= res!636537 (= (seekEntryOrOpen!0 (select (arr!27612 (_keys!10677 thiss!1141)) #b00000000000000000000000000000000) (_keys!10677 thiss!1141) (mask!27523 thiss!1141)) (Found!9129 #b00000000000000000000000000000000)))))

(assert (=> b!948999 (=> (not res!636537) (not e!534248))))

(declare-fun b!949000 () Bool)

(assert (=> b!949000 (= e!534246 call!41257)))

(assert (= (and d!114787 (not res!636536)) b!948998))

(assert (= (and b!948998 c!98969) b!948999))

(assert (= (and b!948998 (not c!98969)) b!949000))

(assert (= (and b!948999 res!636537) b!948997))

(assert (= (or b!948997 b!949000) bm!41254))

(declare-fun m!881111 () Bool)

(assert (=> bm!41254 m!881111))

(assert (=> b!948998 m!880983))

(assert (=> b!948998 m!880983))

(assert (=> b!948998 m!881023))

(assert (=> b!948999 m!880983))

(declare-fun m!881113 () Bool)

(assert (=> b!948999 m!881113))

(declare-fun m!881115 () Bool)

(assert (=> b!948999 m!881115))

(assert (=> b!948999 m!880983))

(declare-fun m!881117 () Bool)

(assert (=> b!948999 m!881117))

(assert (=> b!948803 d!114787))

(declare-fun d!114789 () Bool)

(assert (=> d!114789 (= (apply!867 (+!2877 lt!427171 (tuple2!13577 lt!427182 (minValue!5594 thiss!1141))) lt!427165) (apply!867 lt!427171 lt!427165))))

(declare-fun lt!427241 () Unit!31843)

(declare-fun choose!1588 (ListLongMap!12263 (_ BitVec 64) V!32591 (_ BitVec 64)) Unit!31843)

(assert (=> d!114789 (= lt!427241 (choose!1588 lt!427171 lt!427182 (minValue!5594 thiss!1141) lt!427165))))

(declare-fun e!534251 () Bool)

(assert (=> d!114789 e!534251))

(declare-fun res!636540 () Bool)

(assert (=> d!114789 (=> (not res!636540) (not e!534251))))

(assert (=> d!114789 (= res!636540 (contains!5176 lt!427171 lt!427165))))

(assert (=> d!114789 (= (addApplyDifferent!446 lt!427171 lt!427182 (minValue!5594 thiss!1141) lt!427165) lt!427241)))

(declare-fun b!949004 () Bool)

(assert (=> b!949004 (= e!534251 (not (= lt!427165 lt!427182)))))

(assert (= (and d!114789 res!636540) b!949004))

(assert (=> d!114789 m!881003))

(declare-fun m!881119 () Bool)

(assert (=> d!114789 m!881119))

(declare-fun m!881121 () Bool)

(assert (=> d!114789 m!881121))

(assert (=> d!114789 m!880999))

(assert (=> d!114789 m!881003))

(assert (=> d!114789 m!881005))

(assert (=> b!948890 d!114789))

(declare-fun d!114791 () Bool)

(declare-fun e!534252 () Bool)

(assert (=> d!114791 e!534252))

(declare-fun res!636542 () Bool)

(assert (=> d!114791 (=> (not res!636542) (not e!534252))))

(declare-fun lt!427245 () ListLongMap!12263)

(assert (=> d!114791 (= res!636542 (contains!5176 lt!427245 (_1!6799 (tuple2!13577 lt!427184 (zeroValue!5594 thiss!1141)))))))

(declare-fun lt!427243 () List!19326)

(assert (=> d!114791 (= lt!427245 (ListLongMap!12264 lt!427243))))

(declare-fun lt!427242 () Unit!31843)

(declare-fun lt!427244 () Unit!31843)

(assert (=> d!114791 (= lt!427242 lt!427244)))

(assert (=> d!114791 (= (getValueByKey!496 lt!427243 (_1!6799 (tuple2!13577 lt!427184 (zeroValue!5594 thiss!1141)))) (Some!501 (_2!6799 (tuple2!13577 lt!427184 (zeroValue!5594 thiss!1141)))))))

(assert (=> d!114791 (= lt!427244 (lemmaContainsTupThenGetReturnValue!265 lt!427243 (_1!6799 (tuple2!13577 lt!427184 (zeroValue!5594 thiss!1141))) (_2!6799 (tuple2!13577 lt!427184 (zeroValue!5594 thiss!1141)))))))

(assert (=> d!114791 (= lt!427243 (insertStrictlySorted!322 (toList!6147 lt!427167) (_1!6799 (tuple2!13577 lt!427184 (zeroValue!5594 thiss!1141))) (_2!6799 (tuple2!13577 lt!427184 (zeroValue!5594 thiss!1141)))))))

(assert (=> d!114791 (= (+!2877 lt!427167 (tuple2!13577 lt!427184 (zeroValue!5594 thiss!1141))) lt!427245)))

(declare-fun b!949005 () Bool)

(declare-fun res!636541 () Bool)

(assert (=> b!949005 (=> (not res!636541) (not e!534252))))

(assert (=> b!949005 (= res!636541 (= (getValueByKey!496 (toList!6147 lt!427245) (_1!6799 (tuple2!13577 lt!427184 (zeroValue!5594 thiss!1141)))) (Some!501 (_2!6799 (tuple2!13577 lt!427184 (zeroValue!5594 thiss!1141))))))))

(declare-fun b!949006 () Bool)

(assert (=> b!949006 (= e!534252 (contains!5180 (toList!6147 lt!427245) (tuple2!13577 lt!427184 (zeroValue!5594 thiss!1141))))))

(assert (= (and d!114791 res!636542) b!949005))

(assert (= (and b!949005 res!636541) b!949006))

(declare-fun m!881123 () Bool)

(assert (=> d!114791 m!881123))

(declare-fun m!881125 () Bool)

(assert (=> d!114791 m!881125))

(declare-fun m!881127 () Bool)

(assert (=> d!114791 m!881127))

(declare-fun m!881129 () Bool)

(assert (=> d!114791 m!881129))

(declare-fun m!881131 () Bool)

(assert (=> b!949005 m!881131))

(declare-fun m!881133 () Bool)

(assert (=> b!949006 m!881133))

(assert (=> b!948890 d!114791))

(declare-fun d!114793 () Bool)

(assert (=> d!114793 (contains!5176 (+!2877 lt!427167 (tuple2!13577 lt!427184 (zeroValue!5594 thiss!1141))) lt!427179)))

(declare-fun lt!427248 () Unit!31843)

(declare-fun choose!1589 (ListLongMap!12263 (_ BitVec 64) V!32591 (_ BitVec 64)) Unit!31843)

(assert (=> d!114793 (= lt!427248 (choose!1589 lt!427167 lt!427184 (zeroValue!5594 thiss!1141) lt!427179))))

(assert (=> d!114793 (contains!5176 lt!427167 lt!427179)))

(assert (=> d!114793 (= (addStillContains!566 lt!427167 lt!427184 (zeroValue!5594 thiss!1141) lt!427179) lt!427248)))

(declare-fun bs!26645 () Bool)

(assert (= bs!26645 d!114793))

(assert (=> bs!26645 m!880995))

(assert (=> bs!26645 m!880995))

(assert (=> bs!26645 m!880997))

(declare-fun m!881135 () Bool)

(assert (=> bs!26645 m!881135))

(declare-fun m!881137 () Bool)

(assert (=> bs!26645 m!881137))

(assert (=> b!948890 d!114793))

(declare-fun d!114795 () Bool)

(declare-fun e!534253 () Bool)

(assert (=> d!114795 e!534253))

(declare-fun res!636544 () Bool)

(assert (=> d!114795 (=> (not res!636544) (not e!534253))))

(declare-fun lt!427252 () ListLongMap!12263)

(assert (=> d!114795 (= res!636544 (contains!5176 lt!427252 (_1!6799 (tuple2!13577 lt!427185 (minValue!5594 thiss!1141)))))))

(declare-fun lt!427250 () List!19326)

(assert (=> d!114795 (= lt!427252 (ListLongMap!12264 lt!427250))))

(declare-fun lt!427249 () Unit!31843)

(declare-fun lt!427251 () Unit!31843)

(assert (=> d!114795 (= lt!427249 lt!427251)))

(assert (=> d!114795 (= (getValueByKey!496 lt!427250 (_1!6799 (tuple2!13577 lt!427185 (minValue!5594 thiss!1141)))) (Some!501 (_2!6799 (tuple2!13577 lt!427185 (minValue!5594 thiss!1141)))))))

(assert (=> d!114795 (= lt!427251 (lemmaContainsTupThenGetReturnValue!265 lt!427250 (_1!6799 (tuple2!13577 lt!427185 (minValue!5594 thiss!1141))) (_2!6799 (tuple2!13577 lt!427185 (minValue!5594 thiss!1141)))))))

(assert (=> d!114795 (= lt!427250 (insertStrictlySorted!322 (toList!6147 lt!427178) (_1!6799 (tuple2!13577 lt!427185 (minValue!5594 thiss!1141))) (_2!6799 (tuple2!13577 lt!427185 (minValue!5594 thiss!1141)))))))

(assert (=> d!114795 (= (+!2877 lt!427178 (tuple2!13577 lt!427185 (minValue!5594 thiss!1141))) lt!427252)))

(declare-fun b!949008 () Bool)

(declare-fun res!636543 () Bool)

(assert (=> b!949008 (=> (not res!636543) (not e!534253))))

(assert (=> b!949008 (= res!636543 (= (getValueByKey!496 (toList!6147 lt!427252) (_1!6799 (tuple2!13577 lt!427185 (minValue!5594 thiss!1141)))) (Some!501 (_2!6799 (tuple2!13577 lt!427185 (minValue!5594 thiss!1141))))))))

(declare-fun b!949009 () Bool)

(assert (=> b!949009 (= e!534253 (contains!5180 (toList!6147 lt!427252) (tuple2!13577 lt!427185 (minValue!5594 thiss!1141))))))

(assert (= (and d!114795 res!636544) b!949008))

(assert (= (and b!949008 res!636543) b!949009))

(declare-fun m!881139 () Bool)

(assert (=> d!114795 m!881139))

(declare-fun m!881141 () Bool)

(assert (=> d!114795 m!881141))

(declare-fun m!881143 () Bool)

(assert (=> d!114795 m!881143))

(declare-fun m!881145 () Bool)

(assert (=> d!114795 m!881145))

(declare-fun m!881147 () Bool)

(assert (=> b!949008 m!881147))

(declare-fun m!881149 () Bool)

(assert (=> b!949009 m!881149))

(assert (=> b!948890 d!114795))

(declare-fun d!114797 () Bool)

(assert (=> d!114797 (= (apply!867 (+!2877 lt!427181 (tuple2!13577 lt!427180 (zeroValue!5594 thiss!1141))) lt!427164) (apply!867 lt!427181 lt!427164))))

(declare-fun lt!427253 () Unit!31843)

(assert (=> d!114797 (= lt!427253 (choose!1588 lt!427181 lt!427180 (zeroValue!5594 thiss!1141) lt!427164))))

(declare-fun e!534254 () Bool)

(assert (=> d!114797 e!534254))

(declare-fun res!636545 () Bool)

(assert (=> d!114797 (=> (not res!636545) (not e!534254))))

(assert (=> d!114797 (= res!636545 (contains!5176 lt!427181 lt!427164))))

(assert (=> d!114797 (= (addApplyDifferent!446 lt!427181 lt!427180 (zeroValue!5594 thiss!1141) lt!427164) lt!427253)))

(declare-fun b!949010 () Bool)

(assert (=> b!949010 (= e!534254 (not (= lt!427164 lt!427180)))))

(assert (= (and d!114797 res!636545) b!949010))

(assert (=> d!114797 m!880989))

(declare-fun m!881151 () Bool)

(assert (=> d!114797 m!881151))

(declare-fun m!881153 () Bool)

(assert (=> d!114797 m!881153))

(assert (=> d!114797 m!881007))

(assert (=> d!114797 m!880989))

(assert (=> d!114797 m!881011))

(assert (=> b!948890 d!114797))

(declare-fun d!114799 () Bool)

(assert (=> d!114799 (= (apply!867 (+!2877 lt!427178 (tuple2!13577 lt!427185 (minValue!5594 thiss!1141))) lt!427175) (apply!867 lt!427178 lt!427175))))

(declare-fun lt!427254 () Unit!31843)

(assert (=> d!114799 (= lt!427254 (choose!1588 lt!427178 lt!427185 (minValue!5594 thiss!1141) lt!427175))))

(declare-fun e!534255 () Bool)

(assert (=> d!114799 e!534255))

(declare-fun res!636546 () Bool)

(assert (=> d!114799 (=> (not res!636546) (not e!534255))))

(assert (=> d!114799 (= res!636546 (contains!5176 lt!427178 lt!427175))))

(assert (=> d!114799 (= (addApplyDifferent!446 lt!427178 lt!427185 (minValue!5594 thiss!1141) lt!427175) lt!427254)))

(declare-fun b!949011 () Bool)

(assert (=> b!949011 (= e!534255 (not (= lt!427175 lt!427185)))))

(assert (= (and d!114799 res!636546) b!949011))

(assert (=> d!114799 m!881013))

(declare-fun m!881155 () Bool)

(assert (=> d!114799 m!881155))

(declare-fun m!881157 () Bool)

(assert (=> d!114799 m!881157))

(assert (=> d!114799 m!881001))

(assert (=> d!114799 m!881013))

(assert (=> d!114799 m!881015))

(assert (=> b!948890 d!114799))

(declare-fun d!114801 () Bool)

(assert (=> d!114801 (= (apply!867 lt!427181 lt!427164) (get!14507 (getValueByKey!496 (toList!6147 lt!427181) lt!427164)))))

(declare-fun bs!26646 () Bool)

(assert (= bs!26646 d!114801))

(declare-fun m!881159 () Bool)

(assert (=> bs!26646 m!881159))

(assert (=> bs!26646 m!881159))

(declare-fun m!881161 () Bool)

(assert (=> bs!26646 m!881161))

(assert (=> b!948890 d!114801))

(assert (=> b!948890 d!114781))

(declare-fun d!114803 () Bool)

(assert (=> d!114803 (= (apply!867 lt!427178 lt!427175) (get!14507 (getValueByKey!496 (toList!6147 lt!427178) lt!427175)))))

(declare-fun bs!26647 () Bool)

(assert (= bs!26647 d!114803))

(declare-fun m!881163 () Bool)

(assert (=> bs!26647 m!881163))

(assert (=> bs!26647 m!881163))

(declare-fun m!881165 () Bool)

(assert (=> bs!26647 m!881165))

(assert (=> b!948890 d!114803))

(declare-fun d!114805 () Bool)

(declare-fun e!534256 () Bool)

(assert (=> d!114805 e!534256))

(declare-fun res!636547 () Bool)

(assert (=> d!114805 (=> res!636547 e!534256)))

(declare-fun lt!427256 () Bool)

(assert (=> d!114805 (= res!636547 (not lt!427256))))

(declare-fun lt!427257 () Bool)

(assert (=> d!114805 (= lt!427256 lt!427257)))

(declare-fun lt!427258 () Unit!31843)

(declare-fun e!534257 () Unit!31843)

(assert (=> d!114805 (= lt!427258 e!534257)))

(declare-fun c!98970 () Bool)

(assert (=> d!114805 (= c!98970 lt!427257)))

(assert (=> d!114805 (= lt!427257 (containsKey!460 (toList!6147 (+!2877 lt!427167 (tuple2!13577 lt!427184 (zeroValue!5594 thiss!1141)))) lt!427179))))

(assert (=> d!114805 (= (contains!5176 (+!2877 lt!427167 (tuple2!13577 lt!427184 (zeroValue!5594 thiss!1141))) lt!427179) lt!427256)))

(declare-fun b!949012 () Bool)

(declare-fun lt!427255 () Unit!31843)

(assert (=> b!949012 (= e!534257 lt!427255)))

(assert (=> b!949012 (= lt!427255 (lemmaContainsKeyImpliesGetValueByKeyDefined!355 (toList!6147 (+!2877 lt!427167 (tuple2!13577 lt!427184 (zeroValue!5594 thiss!1141)))) lt!427179))))

(assert (=> b!949012 (isDefined!368 (getValueByKey!496 (toList!6147 (+!2877 lt!427167 (tuple2!13577 lt!427184 (zeroValue!5594 thiss!1141)))) lt!427179))))

(declare-fun b!949013 () Bool)

(declare-fun Unit!31849 () Unit!31843)

(assert (=> b!949013 (= e!534257 Unit!31849)))

(declare-fun b!949014 () Bool)

(assert (=> b!949014 (= e!534256 (isDefined!368 (getValueByKey!496 (toList!6147 (+!2877 lt!427167 (tuple2!13577 lt!427184 (zeroValue!5594 thiss!1141)))) lt!427179)))))

(assert (= (and d!114805 c!98970) b!949012))

(assert (= (and d!114805 (not c!98970)) b!949013))

(assert (= (and d!114805 (not res!636547)) b!949014))

(declare-fun m!881167 () Bool)

(assert (=> d!114805 m!881167))

(declare-fun m!881169 () Bool)

(assert (=> b!949012 m!881169))

(declare-fun m!881171 () Bool)

(assert (=> b!949012 m!881171))

(assert (=> b!949012 m!881171))

(declare-fun m!881173 () Bool)

(assert (=> b!949012 m!881173))

(assert (=> b!949014 m!881171))

(assert (=> b!949014 m!881171))

(assert (=> b!949014 m!881173))

(assert (=> b!948890 d!114805))

(declare-fun d!114807 () Bool)

(assert (=> d!114807 (= (apply!867 (+!2877 lt!427181 (tuple2!13577 lt!427180 (zeroValue!5594 thiss!1141))) lt!427164) (get!14507 (getValueByKey!496 (toList!6147 (+!2877 lt!427181 (tuple2!13577 lt!427180 (zeroValue!5594 thiss!1141)))) lt!427164)))))

(declare-fun bs!26648 () Bool)

(assert (= bs!26648 d!114807))

(declare-fun m!881175 () Bool)

(assert (=> bs!26648 m!881175))

(assert (=> bs!26648 m!881175))

(declare-fun m!881177 () Bool)

(assert (=> bs!26648 m!881177))

(assert (=> b!948890 d!114807))

(declare-fun d!114809 () Bool)

(declare-fun e!534258 () Bool)

(assert (=> d!114809 e!534258))

(declare-fun res!636549 () Bool)

(assert (=> d!114809 (=> (not res!636549) (not e!534258))))

(declare-fun lt!427262 () ListLongMap!12263)

(assert (=> d!114809 (= res!636549 (contains!5176 lt!427262 (_1!6799 (tuple2!13577 lt!427180 (zeroValue!5594 thiss!1141)))))))

(declare-fun lt!427260 () List!19326)

(assert (=> d!114809 (= lt!427262 (ListLongMap!12264 lt!427260))))

(declare-fun lt!427259 () Unit!31843)

(declare-fun lt!427261 () Unit!31843)

(assert (=> d!114809 (= lt!427259 lt!427261)))

(assert (=> d!114809 (= (getValueByKey!496 lt!427260 (_1!6799 (tuple2!13577 lt!427180 (zeroValue!5594 thiss!1141)))) (Some!501 (_2!6799 (tuple2!13577 lt!427180 (zeroValue!5594 thiss!1141)))))))

(assert (=> d!114809 (= lt!427261 (lemmaContainsTupThenGetReturnValue!265 lt!427260 (_1!6799 (tuple2!13577 lt!427180 (zeroValue!5594 thiss!1141))) (_2!6799 (tuple2!13577 lt!427180 (zeroValue!5594 thiss!1141)))))))

(assert (=> d!114809 (= lt!427260 (insertStrictlySorted!322 (toList!6147 lt!427181) (_1!6799 (tuple2!13577 lt!427180 (zeroValue!5594 thiss!1141))) (_2!6799 (tuple2!13577 lt!427180 (zeroValue!5594 thiss!1141)))))))

(assert (=> d!114809 (= (+!2877 lt!427181 (tuple2!13577 lt!427180 (zeroValue!5594 thiss!1141))) lt!427262)))

(declare-fun b!949015 () Bool)

(declare-fun res!636548 () Bool)

(assert (=> b!949015 (=> (not res!636548) (not e!534258))))

(assert (=> b!949015 (= res!636548 (= (getValueByKey!496 (toList!6147 lt!427262) (_1!6799 (tuple2!13577 lt!427180 (zeroValue!5594 thiss!1141)))) (Some!501 (_2!6799 (tuple2!13577 lt!427180 (zeroValue!5594 thiss!1141))))))))

(declare-fun b!949016 () Bool)

(assert (=> b!949016 (= e!534258 (contains!5180 (toList!6147 lt!427262) (tuple2!13577 lt!427180 (zeroValue!5594 thiss!1141))))))

(assert (= (and d!114809 res!636549) b!949015))

(assert (= (and b!949015 res!636548) b!949016))

(declare-fun m!881179 () Bool)

(assert (=> d!114809 m!881179))

(declare-fun m!881181 () Bool)

(assert (=> d!114809 m!881181))

(declare-fun m!881183 () Bool)

(assert (=> d!114809 m!881183))

(declare-fun m!881185 () Bool)

(assert (=> d!114809 m!881185))

(declare-fun m!881187 () Bool)

(assert (=> b!949015 m!881187))

(declare-fun m!881189 () Bool)

(assert (=> b!949016 m!881189))

(assert (=> b!948890 d!114809))

(declare-fun d!114811 () Bool)

(assert (=> d!114811 (= (apply!867 (+!2877 lt!427171 (tuple2!13577 lt!427182 (minValue!5594 thiss!1141))) lt!427165) (get!14507 (getValueByKey!496 (toList!6147 (+!2877 lt!427171 (tuple2!13577 lt!427182 (minValue!5594 thiss!1141)))) lt!427165)))))

(declare-fun bs!26649 () Bool)

(assert (= bs!26649 d!114811))

(declare-fun m!881191 () Bool)

(assert (=> bs!26649 m!881191))

(assert (=> bs!26649 m!881191))

(declare-fun m!881193 () Bool)

(assert (=> bs!26649 m!881193))

(assert (=> b!948890 d!114811))

(declare-fun d!114813 () Bool)

(declare-fun e!534259 () Bool)

(assert (=> d!114813 e!534259))

(declare-fun res!636551 () Bool)

(assert (=> d!114813 (=> (not res!636551) (not e!534259))))

(declare-fun lt!427266 () ListLongMap!12263)

(assert (=> d!114813 (= res!636551 (contains!5176 lt!427266 (_1!6799 (tuple2!13577 lt!427182 (minValue!5594 thiss!1141)))))))

(declare-fun lt!427264 () List!19326)

(assert (=> d!114813 (= lt!427266 (ListLongMap!12264 lt!427264))))

(declare-fun lt!427263 () Unit!31843)

(declare-fun lt!427265 () Unit!31843)

(assert (=> d!114813 (= lt!427263 lt!427265)))

(assert (=> d!114813 (= (getValueByKey!496 lt!427264 (_1!6799 (tuple2!13577 lt!427182 (minValue!5594 thiss!1141)))) (Some!501 (_2!6799 (tuple2!13577 lt!427182 (minValue!5594 thiss!1141)))))))

(assert (=> d!114813 (= lt!427265 (lemmaContainsTupThenGetReturnValue!265 lt!427264 (_1!6799 (tuple2!13577 lt!427182 (minValue!5594 thiss!1141))) (_2!6799 (tuple2!13577 lt!427182 (minValue!5594 thiss!1141)))))))

(assert (=> d!114813 (= lt!427264 (insertStrictlySorted!322 (toList!6147 lt!427171) (_1!6799 (tuple2!13577 lt!427182 (minValue!5594 thiss!1141))) (_2!6799 (tuple2!13577 lt!427182 (minValue!5594 thiss!1141)))))))

(assert (=> d!114813 (= (+!2877 lt!427171 (tuple2!13577 lt!427182 (minValue!5594 thiss!1141))) lt!427266)))

(declare-fun b!949017 () Bool)

(declare-fun res!636550 () Bool)

(assert (=> b!949017 (=> (not res!636550) (not e!534259))))

(assert (=> b!949017 (= res!636550 (= (getValueByKey!496 (toList!6147 lt!427266) (_1!6799 (tuple2!13577 lt!427182 (minValue!5594 thiss!1141)))) (Some!501 (_2!6799 (tuple2!13577 lt!427182 (minValue!5594 thiss!1141))))))))

(declare-fun b!949018 () Bool)

(assert (=> b!949018 (= e!534259 (contains!5180 (toList!6147 lt!427266) (tuple2!13577 lt!427182 (minValue!5594 thiss!1141))))))

(assert (= (and d!114813 res!636551) b!949017))

(assert (= (and b!949017 res!636550) b!949018))

(declare-fun m!881195 () Bool)

(assert (=> d!114813 m!881195))

(declare-fun m!881197 () Bool)

(assert (=> d!114813 m!881197))

(declare-fun m!881199 () Bool)

(assert (=> d!114813 m!881199))

(declare-fun m!881201 () Bool)

(assert (=> d!114813 m!881201))

(declare-fun m!881203 () Bool)

(assert (=> b!949017 m!881203))

(declare-fun m!881205 () Bool)

(assert (=> b!949018 m!881205))

(assert (=> b!948890 d!114813))

(declare-fun d!114815 () Bool)

(assert (=> d!114815 (= (apply!867 lt!427171 lt!427165) (get!14507 (getValueByKey!496 (toList!6147 lt!427171) lt!427165)))))

(declare-fun bs!26650 () Bool)

(assert (= bs!26650 d!114815))

(declare-fun m!881207 () Bool)

(assert (=> bs!26650 m!881207))

(assert (=> bs!26650 m!881207))

(declare-fun m!881209 () Bool)

(assert (=> bs!26650 m!881209))

(assert (=> b!948890 d!114815))

(declare-fun d!114817 () Bool)

(assert (=> d!114817 (= (apply!867 (+!2877 lt!427178 (tuple2!13577 lt!427185 (minValue!5594 thiss!1141))) lt!427175) (get!14507 (getValueByKey!496 (toList!6147 (+!2877 lt!427178 (tuple2!13577 lt!427185 (minValue!5594 thiss!1141)))) lt!427175)))))

(declare-fun bs!26651 () Bool)

(assert (= bs!26651 d!114817))

(declare-fun m!881211 () Bool)

(assert (=> bs!26651 m!881211))

(assert (=> bs!26651 m!881211))

(declare-fun m!881213 () Bool)

(assert (=> bs!26651 m!881213))

(assert (=> b!948890 d!114817))

(declare-fun b!949037 () Bool)

(declare-fun e!534270 () Bool)

(declare-fun lt!427271 () SeekEntryResult!9129)

(assert (=> b!949037 (= e!534270 (bvsge (x!81646 lt!427271) #b01111111111111111111111111111110))))

(declare-fun b!949038 () Bool)

(declare-fun e!534273 () SeekEntryResult!9129)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!949038 (= e!534273 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27523 thiss!1141)) #b00000000000000000000000000000000 (mask!27523 thiss!1141)) key!756 (_keys!10677 thiss!1141) (mask!27523 thiss!1141)))))

(declare-fun b!949039 () Bool)

(assert (=> b!949039 (= e!534273 (Intermediate!9129 false (toIndex!0 key!756 (mask!27523 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!949040 () Bool)

(declare-fun e!534271 () Bool)

(assert (=> b!949040 (= e!534270 e!534271)))

(declare-fun res!636560 () Bool)

(assert (=> b!949040 (= res!636560 (and ((_ is Intermediate!9129) lt!427271) (not (undefined!9941 lt!427271)) (bvslt (x!81646 lt!427271) #b01111111111111111111111111111110) (bvsge (x!81646 lt!427271) #b00000000000000000000000000000000) (bvsge (x!81646 lt!427271) #b00000000000000000000000000000000)))))

(assert (=> b!949040 (=> (not res!636560) (not e!534271))))

(declare-fun b!949041 () Bool)

(assert (=> b!949041 (and (bvsge (index!38889 lt!427271) #b00000000000000000000000000000000) (bvslt (index!38889 lt!427271) (size!28089 (_keys!10677 thiss!1141))))))

(declare-fun e!534274 () Bool)

(assert (=> b!949041 (= e!534274 (= (select (arr!27612 (_keys!10677 thiss!1141)) (index!38889 lt!427271)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!114819 () Bool)

(assert (=> d!114819 e!534270))

(declare-fun c!98978 () Bool)

(assert (=> d!114819 (= c!98978 (and ((_ is Intermediate!9129) lt!427271) (undefined!9941 lt!427271)))))

(declare-fun e!534272 () SeekEntryResult!9129)

(assert (=> d!114819 (= lt!427271 e!534272)))

(declare-fun c!98977 () Bool)

(assert (=> d!114819 (= c!98977 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!427272 () (_ BitVec 64))

(assert (=> d!114819 (= lt!427272 (select (arr!27612 (_keys!10677 thiss!1141)) (toIndex!0 key!756 (mask!27523 thiss!1141))))))

(assert (=> d!114819 (validMask!0 (mask!27523 thiss!1141))))

(assert (=> d!114819 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27523 thiss!1141)) key!756 (_keys!10677 thiss!1141) (mask!27523 thiss!1141)) lt!427271)))

(declare-fun b!949042 () Bool)

(assert (=> b!949042 (and (bvsge (index!38889 lt!427271) #b00000000000000000000000000000000) (bvslt (index!38889 lt!427271) (size!28089 (_keys!10677 thiss!1141))))))

(declare-fun res!636559 () Bool)

(assert (=> b!949042 (= res!636559 (= (select (arr!27612 (_keys!10677 thiss!1141)) (index!38889 lt!427271)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!949042 (=> res!636559 e!534274)))

(declare-fun b!949043 () Bool)

(assert (=> b!949043 (and (bvsge (index!38889 lt!427271) #b00000000000000000000000000000000) (bvslt (index!38889 lt!427271) (size!28089 (_keys!10677 thiss!1141))))))

(declare-fun res!636558 () Bool)

(assert (=> b!949043 (= res!636558 (= (select (arr!27612 (_keys!10677 thiss!1141)) (index!38889 lt!427271)) key!756))))

(assert (=> b!949043 (=> res!636558 e!534274)))

(assert (=> b!949043 (= e!534271 e!534274)))

(declare-fun b!949044 () Bool)

(assert (=> b!949044 (= e!534272 e!534273)))

(declare-fun c!98979 () Bool)

(assert (=> b!949044 (= c!98979 (or (= lt!427272 key!756) (= (bvadd lt!427272 lt!427272) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!949045 () Bool)

(assert (=> b!949045 (= e!534272 (Intermediate!9129 true (toIndex!0 key!756 (mask!27523 thiss!1141)) #b00000000000000000000000000000000))))

(assert (= (and d!114819 c!98977) b!949045))

(assert (= (and d!114819 (not c!98977)) b!949044))

(assert (= (and b!949044 c!98979) b!949039))

(assert (= (and b!949044 (not c!98979)) b!949038))

(assert (= (and d!114819 c!98978) b!949037))

(assert (= (and d!114819 (not c!98978)) b!949040))

(assert (= (and b!949040 res!636560) b!949043))

(assert (= (and b!949043 (not res!636558)) b!949042))

(assert (= (and b!949042 (not res!636559)) b!949041))

(assert (=> b!949038 m!880967))

(declare-fun m!881215 () Bool)

(assert (=> b!949038 m!881215))

(assert (=> b!949038 m!881215))

(declare-fun m!881217 () Bool)

(assert (=> b!949038 m!881217))

(declare-fun m!881219 () Bool)

(assert (=> b!949041 m!881219))

(assert (=> b!949042 m!881219))

(assert (=> d!114819 m!880967))

(declare-fun m!881221 () Bool)

(assert (=> d!114819 m!881221))

(assert (=> d!114819 m!880917))

(assert (=> b!949043 m!881219))

(assert (=> d!114757 d!114819))

(declare-fun d!114821 () Bool)

(declare-fun lt!427278 () (_ BitVec 32))

(declare-fun lt!427277 () (_ BitVec 32))

(assert (=> d!114821 (= lt!427278 (bvmul (bvxor lt!427277 (bvlshr lt!427277 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!114821 (= lt!427277 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!114821 (and (bvsge (mask!27523 thiss!1141) #b00000000000000000000000000000000) (let ((res!636561 (let ((h!20484 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!81665 (bvmul (bvxor h!20484 (bvlshr h!20484 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!81665 (bvlshr x!81665 #b00000000000000000000000000001101)) (mask!27523 thiss!1141)))))) (and (bvslt res!636561 (bvadd (mask!27523 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!636561 #b00000000000000000000000000000000))))))

(assert (=> d!114821 (= (toIndex!0 key!756 (mask!27523 thiss!1141)) (bvand (bvxor lt!427278 (bvlshr lt!427278 #b00000000000000000000000000001101)) (mask!27523 thiss!1141)))))

(assert (=> d!114757 d!114821))

(assert (=> d!114757 d!114749))

(declare-fun b!949056 () Bool)

(declare-fun res!636571 () Bool)

(declare-fun e!534277 () Bool)

(assert (=> b!949056 (=> (not res!636571) (not e!534277))))

(declare-fun size!28094 (LongMapFixedSize!4906) (_ BitVec 32))

(assert (=> b!949056 (= res!636571 (= (size!28094 thiss!1141) (bvadd (_size!2508 thiss!1141) (bvsdiv (bvadd (extraKeys!5490 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!949057 () Bool)

(assert (=> b!949057 (= e!534277 (and (bvsge (extraKeys!5490 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5490 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2508 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun b!949054 () Bool)

(declare-fun res!636572 () Bool)

(assert (=> b!949054 (=> (not res!636572) (not e!534277))))

(assert (=> b!949054 (= res!636572 (and (= (size!28088 (_values!5781 thiss!1141)) (bvadd (mask!27523 thiss!1141) #b00000000000000000000000000000001)) (= (size!28089 (_keys!10677 thiss!1141)) (size!28088 (_values!5781 thiss!1141))) (bvsge (_size!2508 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2508 thiss!1141) (bvadd (mask!27523 thiss!1141) #b00000000000000000000000000000001))))))

(declare-fun b!949055 () Bool)

(declare-fun res!636573 () Bool)

(assert (=> b!949055 (=> (not res!636573) (not e!534277))))

(assert (=> b!949055 (= res!636573 (bvsge (size!28094 thiss!1141) (_size!2508 thiss!1141)))))

(declare-fun d!114823 () Bool)

(declare-fun res!636570 () Bool)

(assert (=> d!114823 (=> (not res!636570) (not e!534277))))

(assert (=> d!114823 (= res!636570 (validMask!0 (mask!27523 thiss!1141)))))

(assert (=> d!114823 (= (simpleValid!370 thiss!1141) e!534277)))

(assert (= (and d!114823 res!636570) b!949054))

(assert (= (and b!949054 res!636572) b!949055))

(assert (= (and b!949055 res!636573) b!949056))

(assert (= (and b!949056 res!636571) b!949057))

(declare-fun m!881223 () Bool)

(assert (=> b!949056 m!881223))

(assert (=> b!949055 m!881223))

(assert (=> d!114823 m!880917))

(assert (=> d!114755 d!114823))

(declare-fun d!114825 () Bool)

(declare-fun e!534278 () Bool)

(assert (=> d!114825 e!534278))

(declare-fun res!636574 () Bool)

(assert (=> d!114825 (=> res!636574 e!534278)))

(declare-fun lt!427280 () Bool)

(assert (=> d!114825 (= res!636574 (not lt!427280))))

(declare-fun lt!427281 () Bool)

(assert (=> d!114825 (= lt!427280 lt!427281)))

(declare-fun lt!427282 () Unit!31843)

(declare-fun e!534279 () Unit!31843)

(assert (=> d!114825 (= lt!427282 e!534279)))

(declare-fun c!98980 () Bool)

(assert (=> d!114825 (= c!98980 lt!427281)))

(assert (=> d!114825 (= lt!427281 (containsKey!460 (toList!6147 lt!427173) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!114825 (= (contains!5176 lt!427173 #b1000000000000000000000000000000000000000000000000000000000000000) lt!427280)))

(declare-fun b!949058 () Bool)

(declare-fun lt!427279 () Unit!31843)

(assert (=> b!949058 (= e!534279 lt!427279)))

(assert (=> b!949058 (= lt!427279 (lemmaContainsKeyImpliesGetValueByKeyDefined!355 (toList!6147 lt!427173) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!949058 (isDefined!368 (getValueByKey!496 (toList!6147 lt!427173) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!949059 () Bool)

(declare-fun Unit!31850 () Unit!31843)

(assert (=> b!949059 (= e!534279 Unit!31850)))

(declare-fun b!949060 () Bool)

(assert (=> b!949060 (= e!534278 (isDefined!368 (getValueByKey!496 (toList!6147 lt!427173) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!114825 c!98980) b!949058))

(assert (= (and d!114825 (not c!98980)) b!949059))

(assert (= (and d!114825 (not res!636574)) b!949060))

(declare-fun m!881225 () Bool)

(assert (=> d!114825 m!881225))

(declare-fun m!881227 () Bool)

(assert (=> b!949058 m!881227))

(assert (=> b!949058 m!881043))

(assert (=> b!949058 m!881043))

(declare-fun m!881229 () Bool)

(assert (=> b!949058 m!881229))

(assert (=> b!949060 m!881043))

(assert (=> b!949060 m!881043))

(assert (=> b!949060 m!881229))

(assert (=> bm!41241 d!114825))

(assert (=> b!948875 d!114785))

(declare-fun b!949073 () Bool)

(declare-fun e!534286 () SeekEntryResult!9129)

(assert (=> b!949073 (= e!534286 (MissingVacant!9129 (index!38889 lt!427107)))))

(declare-fun b!949074 () Bool)

(declare-fun e!534287 () SeekEntryResult!9129)

(assert (=> b!949074 (= e!534287 Undefined!9129)))

(declare-fun b!949075 () Bool)

(assert (=> b!949075 (= e!534286 (seekKeyOrZeroReturnVacant!0 (bvadd (x!81646 lt!427107) #b00000000000000000000000000000001) (nextIndex!0 (index!38889 lt!427107) (x!81646 lt!427107) (mask!27523 thiss!1141)) (index!38889 lt!427107) key!756 (_keys!10677 thiss!1141) (mask!27523 thiss!1141)))))

(declare-fun b!949077 () Bool)

(declare-fun e!534288 () SeekEntryResult!9129)

(assert (=> b!949077 (= e!534287 e!534288)))

(declare-fun c!98988 () Bool)

(declare-fun lt!427288 () (_ BitVec 64))

(assert (=> b!949077 (= c!98988 (= lt!427288 key!756))))

(declare-fun b!949078 () Bool)

(assert (=> b!949078 (= e!534288 (Found!9129 (index!38889 lt!427107)))))

(declare-fun b!949076 () Bool)

(declare-fun c!98989 () Bool)

(assert (=> b!949076 (= c!98989 (= lt!427288 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!949076 (= e!534288 e!534286)))

(declare-fun d!114827 () Bool)

(declare-fun lt!427287 () SeekEntryResult!9129)

(assert (=> d!114827 (and (or ((_ is Undefined!9129) lt!427287) (not ((_ is Found!9129) lt!427287)) (and (bvsge (index!38888 lt!427287) #b00000000000000000000000000000000) (bvslt (index!38888 lt!427287) (size!28089 (_keys!10677 thiss!1141))))) (or ((_ is Undefined!9129) lt!427287) ((_ is Found!9129) lt!427287) (not ((_ is MissingVacant!9129) lt!427287)) (not (= (index!38890 lt!427287) (index!38889 lt!427107))) (and (bvsge (index!38890 lt!427287) #b00000000000000000000000000000000) (bvslt (index!38890 lt!427287) (size!28089 (_keys!10677 thiss!1141))))) (or ((_ is Undefined!9129) lt!427287) (ite ((_ is Found!9129) lt!427287) (= (select (arr!27612 (_keys!10677 thiss!1141)) (index!38888 lt!427287)) key!756) (and ((_ is MissingVacant!9129) lt!427287) (= (index!38890 lt!427287) (index!38889 lt!427107)) (= (select (arr!27612 (_keys!10677 thiss!1141)) (index!38890 lt!427287)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!114827 (= lt!427287 e!534287)))

(declare-fun c!98987 () Bool)

(assert (=> d!114827 (= c!98987 (bvsge (x!81646 lt!427107) #b01111111111111111111111111111110))))

(assert (=> d!114827 (= lt!427288 (select (arr!27612 (_keys!10677 thiss!1141)) (index!38889 lt!427107)))))

(assert (=> d!114827 (validMask!0 (mask!27523 thiss!1141))))

(assert (=> d!114827 (= (seekKeyOrZeroReturnVacant!0 (x!81646 lt!427107) (index!38889 lt!427107) (index!38889 lt!427107) key!756 (_keys!10677 thiss!1141) (mask!27523 thiss!1141)) lt!427287)))

(assert (= (and d!114827 c!98987) b!949074))

(assert (= (and d!114827 (not c!98987)) b!949077))

(assert (= (and b!949077 c!98988) b!949078))

(assert (= (and b!949077 (not c!98988)) b!949076))

(assert (= (and b!949076 c!98989) b!949073))

(assert (= (and b!949076 (not c!98989)) b!949075))

(declare-fun m!881231 () Bool)

(assert (=> b!949075 m!881231))

(assert (=> b!949075 m!881231))

(declare-fun m!881233 () Bool)

(assert (=> b!949075 m!881233))

(declare-fun m!881235 () Bool)

(assert (=> d!114827 m!881235))

(declare-fun m!881237 () Bool)

(assert (=> d!114827 m!881237))

(assert (=> d!114827 m!880971))

(assert (=> d!114827 m!880917))

(assert (=> b!948820 d!114827))

(declare-fun b!949087 () Bool)

(declare-fun e!534294 () (_ BitVec 32))

(declare-fun e!534293 () (_ BitVec 32))

(assert (=> b!949087 (= e!534294 e!534293)))

(declare-fun c!98994 () Bool)

(assert (=> b!949087 (= c!98994 (validKeyInArray!0 (select (arr!27612 (_keys!10677 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114829 () Bool)

(declare-fun lt!427291 () (_ BitVec 32))

(assert (=> d!114829 (and (bvsge lt!427291 #b00000000000000000000000000000000) (bvsle lt!427291 (bvsub (size!28089 (_keys!10677 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!114829 (= lt!427291 e!534294)))

(declare-fun c!98995 () Bool)

(assert (=> d!114829 (= c!98995 (bvsge #b00000000000000000000000000000000 (size!28089 (_keys!10677 thiss!1141))))))

(assert (=> d!114829 (and (bvsle #b00000000000000000000000000000000 (size!28089 (_keys!10677 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!28089 (_keys!10677 thiss!1141)) (size!28089 (_keys!10677 thiss!1141))))))

(assert (=> d!114829 (= (arrayCountValidKeys!0 (_keys!10677 thiss!1141) #b00000000000000000000000000000000 (size!28089 (_keys!10677 thiss!1141))) lt!427291)))

(declare-fun bm!41257 () Bool)

(declare-fun call!41260 () (_ BitVec 32))

(assert (=> bm!41257 (= call!41260 (arrayCountValidKeys!0 (_keys!10677 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28089 (_keys!10677 thiss!1141))))))

(declare-fun b!949088 () Bool)

(assert (=> b!949088 (= e!534293 (bvadd #b00000000000000000000000000000001 call!41260))))

(declare-fun b!949089 () Bool)

(assert (=> b!949089 (= e!534293 call!41260)))

(declare-fun b!949090 () Bool)

(assert (=> b!949090 (= e!534294 #b00000000000000000000000000000000)))

(assert (= (and d!114829 c!98995) b!949090))

(assert (= (and d!114829 (not c!98995)) b!949087))

(assert (= (and b!949087 c!98994) b!949088))

(assert (= (and b!949087 (not c!98994)) b!949089))

(assert (= (or b!949088 b!949089) bm!41257))

(assert (=> b!949087 m!880983))

(assert (=> b!949087 m!880983))

(assert (=> b!949087 m!881023))

(declare-fun m!881239 () Bool)

(assert (=> bm!41257 m!881239))

(assert (=> b!948802 d!114829))

(assert (=> b!948831 d!114769))

(assert (=> b!948831 d!114771))

(assert (=> d!114761 d!114749))

(declare-fun d!114831 () Bool)

(assert (=> d!114831 (= (apply!867 lt!427173 (select (arr!27612 (_keys!10677 thiss!1141)) #b00000000000000000000000000000000)) (get!14507 (getValueByKey!496 (toList!6147 lt!427173) (select (arr!27612 (_keys!10677 thiss!1141)) #b00000000000000000000000000000000))))))

(declare-fun bs!26652 () Bool)

(assert (= bs!26652 d!114831))

(assert (=> bs!26652 m!880983))

(assert (=> bs!26652 m!881051))

(assert (=> bs!26652 m!881051))

(declare-fun m!881241 () Bool)

(assert (=> bs!26652 m!881241))

(assert (=> b!948879 d!114831))

(declare-fun d!114833 () Bool)

(declare-fun c!98998 () Bool)

(assert (=> d!114833 (= c!98998 ((_ is ValueCellFull!9878) (select (arr!27611 (_values!5781 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun e!534297 () V!32591)

(assert (=> d!114833 (= (get!14506 (select (arr!27611 (_values!5781 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1633 (defaultEntry!5758 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)) e!534297)))

(declare-fun b!949095 () Bool)

(declare-fun get!14508 (ValueCell!9878 V!32591) V!32591)

(assert (=> b!949095 (= e!534297 (get!14508 (select (arr!27611 (_values!5781 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1633 (defaultEntry!5758 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!949096 () Bool)

(declare-fun get!14509 (ValueCell!9878 V!32591) V!32591)

(assert (=> b!949096 (= e!534297 (get!14509 (select (arr!27611 (_values!5781 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1633 (defaultEntry!5758 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!114833 c!98998) b!949095))

(assert (= (and d!114833 (not c!98998)) b!949096))

(assert (=> b!949095 m!881029))

(assert (=> b!949095 m!881027))

(declare-fun m!881243 () Bool)

(assert (=> b!949095 m!881243))

(assert (=> b!949096 m!881029))

(assert (=> b!949096 m!881027))

(declare-fun m!881245 () Bool)

(assert (=> b!949096 m!881245))

(assert (=> b!948879 d!114833))

(declare-fun d!114835 () Bool)

(declare-fun e!534298 () Bool)

(assert (=> d!114835 e!534298))

(declare-fun res!636576 () Bool)

(assert (=> d!114835 (=> (not res!636576) (not e!534298))))

(declare-fun lt!427295 () ListLongMap!12263)

(assert (=> d!114835 (= res!636576 (contains!5176 lt!427295 (_1!6799 (tuple2!13577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141)))))))

(declare-fun lt!427293 () List!19326)

(assert (=> d!114835 (= lt!427295 (ListLongMap!12264 lt!427293))))

(declare-fun lt!427292 () Unit!31843)

(declare-fun lt!427294 () Unit!31843)

(assert (=> d!114835 (= lt!427292 lt!427294)))

(assert (=> d!114835 (= (getValueByKey!496 lt!427293 (_1!6799 (tuple2!13577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141)))) (Some!501 (_2!6799 (tuple2!13577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141)))))))

(assert (=> d!114835 (= lt!427294 (lemmaContainsTupThenGetReturnValue!265 lt!427293 (_1!6799 (tuple2!13577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141))) (_2!6799 (tuple2!13577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141)))))))

(assert (=> d!114835 (= lt!427293 (insertStrictlySorted!322 (toList!6147 call!41244) (_1!6799 (tuple2!13577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141))) (_2!6799 (tuple2!13577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141)))))))

(assert (=> d!114835 (= (+!2877 call!41244 (tuple2!13577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141))) lt!427295)))

(declare-fun b!949097 () Bool)

(declare-fun res!636575 () Bool)

(assert (=> b!949097 (=> (not res!636575) (not e!534298))))

(assert (=> b!949097 (= res!636575 (= (getValueByKey!496 (toList!6147 lt!427295) (_1!6799 (tuple2!13577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141)))) (Some!501 (_2!6799 (tuple2!13577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141))))))))

(declare-fun b!949098 () Bool)

(assert (=> b!949098 (= e!534298 (contains!5180 (toList!6147 lt!427295) (tuple2!13577 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5594 thiss!1141))))))

(assert (= (and d!114835 res!636576) b!949097))

(assert (= (and b!949097 res!636575) b!949098))

(declare-fun m!881247 () Bool)

(assert (=> d!114835 m!881247))

(declare-fun m!881249 () Bool)

(assert (=> d!114835 m!881249))

(declare-fun m!881251 () Bool)

(assert (=> d!114835 m!881251))

(declare-fun m!881253 () Bool)

(assert (=> d!114835 m!881253))

(declare-fun m!881255 () Bool)

(assert (=> b!949097 m!881255))

(declare-fun m!881257 () Bool)

(assert (=> b!949098 m!881257))

(assert (=> b!948881 d!114835))

(declare-fun mapNonEmpty!32986 () Bool)

(declare-fun mapRes!32986 () Bool)

(declare-fun tp!63232 () Bool)

(declare-fun e!534300 () Bool)

(assert (=> mapNonEmpty!32986 (= mapRes!32986 (and tp!63232 e!534300))))

(declare-fun mapKey!32986 () (_ BitVec 32))

(declare-fun mapRest!32986 () (Array (_ BitVec 32) ValueCell!9878))

(declare-fun mapValue!32986 () ValueCell!9878)

(assert (=> mapNonEmpty!32986 (= mapRest!32985 (store mapRest!32986 mapKey!32986 mapValue!32986))))

(declare-fun mapIsEmpty!32986 () Bool)

(assert (=> mapIsEmpty!32986 mapRes!32986))

(declare-fun b!949099 () Bool)

(assert (=> b!949099 (= e!534300 tp_is_empty!20719)))

(declare-fun condMapEmpty!32986 () Bool)

(declare-fun mapDefault!32986 () ValueCell!9878)

(assert (=> mapNonEmpty!32985 (= condMapEmpty!32986 (= mapRest!32985 ((as const (Array (_ BitVec 32) ValueCell!9878)) mapDefault!32986)))))

(declare-fun e!534299 () Bool)

(assert (=> mapNonEmpty!32985 (= tp!63231 (and e!534299 mapRes!32986))))

(declare-fun b!949100 () Bool)

(assert (=> b!949100 (= e!534299 tp_is_empty!20719)))

(assert (= (and mapNonEmpty!32985 condMapEmpty!32986) mapIsEmpty!32986))

(assert (= (and mapNonEmpty!32985 (not condMapEmpty!32986)) mapNonEmpty!32986))

(assert (= (and mapNonEmpty!32986 ((_ is ValueCellFull!9878) mapValue!32986)) b!949099))

(assert (= (and mapNonEmpty!32985 ((_ is ValueCellFull!9878) mapDefault!32986)) b!949100))

(declare-fun m!881259 () Bool)

(assert (=> mapNonEmpty!32986 m!881259))

(declare-fun b_lambda!14325 () Bool)

(assert (= b_lambda!14321 (or (and b!948737 b_free!18211) b_lambda!14325)))

(declare-fun b_lambda!14327 () Bool)

(assert (= b_lambda!14323 (or (and b!948737 b_free!18211) b_lambda!14327)))

(check-sat (not b!948998) (not b!948921) (not b!948978) (not mapNonEmpty!32986) (not b!948928) (not d!114779) (not d!114795) (not d!114763) (not bm!41251) (not b!949095) (not b!949016) (not b!949014) (not d!114767) (not b_lambda!14327) (not bm!41254) (not d!114769) tp_is_empty!20719 (not d!114817) (not d!114807) (not b!948940) (not b!949015) (not d!114765) (not d!114809) (not b!949075) (not b!948971) (not d!114781) (not b!949005) (not b!949087) (not b!948946) (not b!949098) (not d!114827) (not d!114819) b_and!29635 (not b!949038) (not b!948972) (not b!948987) (not d!114783) (not b!949009) (not d!114793) (not d!114825) (not d!114813) (not d!114815) (not d!114831) (not d!114797) (not b!949056) (not d!114823) (not b!949055) (not d!114805) (not b!948999) (not b!949060) (not b!948939) (not b!949018) (not b!948907) (not b_lambda!14319) (not bm!41257) (not b!948977) (not d!114799) (not d!114789) (not b!948973) (not b_next!18211) (not b!948980) (not b!949058) (not d!114775) (not b!949006) (not b!948981) (not b!949012) (not b!948910) (not d!114811) (not b_lambda!14325) (not bm!41248) (not b!949008) (not d!114803) (not b!948944) (not d!114791) (not b!948941) (not b!949017) (not b!949096) (not b!948974) (not b!949097) (not d!114835) (not b!948905) (not b!948988) (not d!114801))
(check-sat b_and!29635 (not b_next!18211))

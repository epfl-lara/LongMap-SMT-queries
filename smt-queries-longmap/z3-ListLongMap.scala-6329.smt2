; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81542 () Bool)

(assert start!81542)

(declare-fun b!952722 () Bool)

(declare-fun b_free!18297 () Bool)

(declare-fun b_next!18297 () Bool)

(assert (=> b!952722 (= b_free!18297 (not b_next!18297))))

(declare-fun tp!63516 () Bool)

(declare-fun b_and!29779 () Bool)

(assert (=> b!952722 (= tp!63516 b_and!29779)))

(declare-fun b!952717 () Bool)

(declare-fun res!638205 () Bool)

(declare-fun e!536563 () Bool)

(assert (=> b!952717 (=> res!638205 e!536563)))

(declare-datatypes ((V!32705 0))(
  ( (V!32706 (val!10453 Int)) )
))
(declare-datatypes ((ValueCell!9921 0))(
  ( (ValueCellFull!9921 (v!13005 V!32705)) (EmptyCell!9921) )
))
(declare-datatypes ((array!57646 0))(
  ( (array!57647 (arr!27714 (Array (_ BitVec 32) ValueCell!9921)) (size!28193 (_ BitVec 32))) )
))
(declare-datatypes ((array!57648 0))(
  ( (array!57649 (arr!27715 (Array (_ BitVec 32) (_ BitVec 64))) (size!28194 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4992 0))(
  ( (LongMapFixedSize!4993 (defaultEntry!5829 Int) (mask!27683 (_ BitVec 32)) (extraKeys!5561 (_ BitVec 32)) (zeroValue!5665 V!32705) (minValue!5665 V!32705) (_size!2551 (_ BitVec 32)) (_keys!10785 array!57648) (_values!5852 array!57646) (_vacant!2551 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4992)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57648 (_ BitVec 32)) Bool)

(assert (=> b!952717 (= res!638205 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10785 thiss!1141) (mask!27683 thiss!1141))))))

(declare-fun b!952718 () Bool)

(declare-fun res!638210 () Bool)

(declare-fun e!536565 () Bool)

(assert (=> b!952718 (=> (not res!638210) (not e!536565))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13586 0))(
  ( (tuple2!13587 (_1!6804 (_ BitVec 64)) (_2!6804 V!32705)) )
))
(declare-datatypes ((List!19367 0))(
  ( (Nil!19364) (Cons!19363 (h!20525 tuple2!13586) (t!27724 List!19367)) )
))
(declare-datatypes ((ListLongMap!12283 0))(
  ( (ListLongMap!12284 (toList!6157 List!19367)) )
))
(declare-fun contains!5252 (ListLongMap!12283 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3390 (array!57648 array!57646 (_ BitVec 32) (_ BitVec 32) V!32705 V!32705 (_ BitVec 32) Int) ListLongMap!12283)

(assert (=> b!952718 (= res!638210 (contains!5252 (getCurrentListMap!3390 (_keys!10785 thiss!1141) (_values!5852 thiss!1141) (mask!27683 thiss!1141) (extraKeys!5561 thiss!1141) (zeroValue!5665 thiss!1141) (minValue!5665 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5829 thiss!1141)) key!756))))

(declare-fun mapIsEmpty!33148 () Bool)

(declare-fun mapRes!33148 () Bool)

(assert (=> mapIsEmpty!33148 mapRes!33148))

(declare-fun res!638209 () Bool)

(assert (=> start!81542 (=> (not res!638209) (not e!536565))))

(declare-fun valid!1899 (LongMapFixedSize!4992) Bool)

(assert (=> start!81542 (= res!638209 (valid!1899 thiss!1141))))

(assert (=> start!81542 e!536565))

(declare-fun e!536564 () Bool)

(assert (=> start!81542 e!536564))

(assert (=> start!81542 true))

(declare-fun b!952719 () Bool)

(declare-fun e!536562 () Bool)

(declare-fun tp_is_empty!20805 () Bool)

(assert (=> b!952719 (= e!536562 tp_is_empty!20805)))

(declare-fun b!952720 () Bool)

(declare-fun e!536567 () Bool)

(declare-fun e!536566 () Bool)

(assert (=> b!952720 (= e!536567 (and e!536566 mapRes!33148))))

(declare-fun condMapEmpty!33148 () Bool)

(declare-fun mapDefault!33148 () ValueCell!9921)

(assert (=> b!952720 (= condMapEmpty!33148 (= (arr!27714 (_values!5852 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9921)) mapDefault!33148)))))

(declare-fun b!952721 () Bool)

(declare-fun res!638211 () Bool)

(assert (=> b!952721 (=> res!638211 e!536563)))

(assert (=> b!952721 (= res!638211 (not (= (size!28194 (_keys!10785 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27683 thiss!1141)))))))

(declare-fun mapNonEmpty!33148 () Bool)

(declare-fun tp!63515 () Bool)

(assert (=> mapNonEmpty!33148 (= mapRes!33148 (and tp!63515 e!536562))))

(declare-fun mapKey!33148 () (_ BitVec 32))

(declare-fun mapRest!33148 () (Array (_ BitVec 32) ValueCell!9921))

(declare-fun mapValue!33148 () ValueCell!9921)

(assert (=> mapNonEmpty!33148 (= (arr!27714 (_values!5852 thiss!1141)) (store mapRest!33148 mapKey!33148 mapValue!33148))))

(declare-fun array_inv!21506 (array!57648) Bool)

(declare-fun array_inv!21507 (array!57646) Bool)

(assert (=> b!952722 (= e!536564 (and tp!63516 tp_is_empty!20805 (array_inv!21506 (_keys!10785 thiss!1141)) (array_inv!21507 (_values!5852 thiss!1141)) e!536567))))

(declare-fun b!952723 () Bool)

(declare-fun res!638206 () Bool)

(assert (=> b!952723 (=> (not res!638206) (not e!536565))))

(assert (=> b!952723 (= res!638206 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!952724 () Bool)

(declare-fun res!638212 () Bool)

(assert (=> b!952724 (=> res!638212 e!536563)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!952724 (= res!638212 (not (validKeyInArray!0 key!756)))))

(declare-fun b!952725 () Bool)

(declare-fun lt!429311 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9162 0))(
  ( (MissingZero!9162 (index!39019 (_ BitVec 32))) (Found!9162 (index!39020 (_ BitVec 32))) (Intermediate!9162 (undefined!9974 Bool) (index!39021 (_ BitVec 32)) (x!81958 (_ BitVec 32))) (Undefined!9162) (MissingVacant!9162 (index!39022 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57648 (_ BitVec 32)) SeekEntryResult!9162)

(assert (=> b!952725 (= e!536563 (= (seekEntryOrOpen!0 key!756 (_keys!10785 thiss!1141) (mask!27683 thiss!1141)) (Found!9162 lt!429311)))))

(declare-fun b!952726 () Bool)

(assert (=> b!952726 (= e!536566 tp_is_empty!20805)))

(declare-fun b!952727 () Bool)

(assert (=> b!952727 (= e!536565 (not e!536563))))

(declare-fun res!638208 () Bool)

(assert (=> b!952727 (=> res!638208 e!536563)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!952727 (= res!638208 (not (validMask!0 (mask!27683 thiss!1141))))))

(assert (=> b!952727 (arrayForallSeekEntryOrOpenFound!0 lt!429311 (_keys!10785 thiss!1141) (mask!27683 thiss!1141))))

(declare-datatypes ((Unit!32049 0))(
  ( (Unit!32050) )
))
(declare-fun lt!429310 () Unit!32049)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57648 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!32049)

(assert (=> b!952727 (= lt!429310 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10785 thiss!1141) (mask!27683 thiss!1141) #b00000000000000000000000000000000 lt!429311))))

(declare-fun arrayScanForKey!0 (array!57648 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!952727 (= lt!429311 (arrayScanForKey!0 (_keys!10785 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57648 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!952727 (arrayContainsKey!0 (_keys!10785 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!429312 () Unit!32049)

(declare-fun lemmaKeyInListMapIsInArray!336 (array!57648 array!57646 (_ BitVec 32) (_ BitVec 32) V!32705 V!32705 (_ BitVec 64) Int) Unit!32049)

(assert (=> b!952727 (= lt!429312 (lemmaKeyInListMapIsInArray!336 (_keys!10785 thiss!1141) (_values!5852 thiss!1141) (mask!27683 thiss!1141) (extraKeys!5561 thiss!1141) (zeroValue!5665 thiss!1141) (minValue!5665 thiss!1141) key!756 (defaultEntry!5829 thiss!1141)))))

(declare-fun b!952728 () Bool)

(declare-fun res!638207 () Bool)

(assert (=> b!952728 (=> (not res!638207) (not e!536565))))

(get-info :version)

(declare-fun seekEntry!0 ((_ BitVec 64) array!57648 (_ BitVec 32)) SeekEntryResult!9162)

(assert (=> b!952728 (= res!638207 (not ((_ is Found!9162) (seekEntry!0 key!756 (_keys!10785 thiss!1141) (mask!27683 thiss!1141)))))))

(assert (= (and start!81542 res!638209) b!952723))

(assert (= (and b!952723 res!638206) b!952728))

(assert (= (and b!952728 res!638207) b!952718))

(assert (= (and b!952718 res!638210) b!952727))

(assert (= (and b!952727 (not res!638208)) b!952721))

(assert (= (and b!952721 (not res!638211)) b!952717))

(assert (= (and b!952717 (not res!638205)) b!952724))

(assert (= (and b!952724 (not res!638212)) b!952725))

(assert (= (and b!952720 condMapEmpty!33148) mapIsEmpty!33148))

(assert (= (and b!952720 (not condMapEmpty!33148)) mapNonEmpty!33148))

(assert (= (and mapNonEmpty!33148 ((_ is ValueCellFull!9921) mapValue!33148)) b!952719))

(assert (= (and b!952720 ((_ is ValueCellFull!9921) mapDefault!33148)) b!952726))

(assert (= b!952722 b!952720))

(assert (= start!81542 b!952722))

(declare-fun m!884831 () Bool)

(assert (=> b!952728 m!884831))

(declare-fun m!884833 () Bool)

(assert (=> b!952722 m!884833))

(declare-fun m!884835 () Bool)

(assert (=> b!952722 m!884835))

(declare-fun m!884837 () Bool)

(assert (=> b!952725 m!884837))

(declare-fun m!884839 () Bool)

(assert (=> b!952727 m!884839))

(declare-fun m!884841 () Bool)

(assert (=> b!952727 m!884841))

(declare-fun m!884843 () Bool)

(assert (=> b!952727 m!884843))

(declare-fun m!884845 () Bool)

(assert (=> b!952727 m!884845))

(declare-fun m!884847 () Bool)

(assert (=> b!952727 m!884847))

(declare-fun m!884849 () Bool)

(assert (=> b!952727 m!884849))

(declare-fun m!884851 () Bool)

(assert (=> start!81542 m!884851))

(declare-fun m!884853 () Bool)

(assert (=> b!952717 m!884853))

(declare-fun m!884855 () Bool)

(assert (=> b!952718 m!884855))

(assert (=> b!952718 m!884855))

(declare-fun m!884857 () Bool)

(assert (=> b!952718 m!884857))

(declare-fun m!884859 () Bool)

(assert (=> b!952724 m!884859))

(declare-fun m!884861 () Bool)

(assert (=> mapNonEmpty!33148 m!884861))

(check-sat tp_is_empty!20805 (not b!952728) (not mapNonEmpty!33148) (not b_next!18297) (not b!952724) (not b!952725) b_and!29779 (not b!952727) (not b!952718) (not start!81542) (not b!952722) (not b!952717))
(check-sat b_and!29779 (not b_next!18297))
(get-model)

(declare-fun d!115561 () Bool)

(assert (=> d!115561 (= (validKeyInArray!0 key!756) (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!952724 d!115561))

(declare-fun b!952777 () Bool)

(declare-fun e!536598 () SeekEntryResult!9162)

(declare-fun e!536597 () SeekEntryResult!9162)

(assert (=> b!952777 (= e!536598 e!536597)))

(declare-fun lt!429330 () (_ BitVec 64))

(declare-fun lt!429331 () SeekEntryResult!9162)

(assert (=> b!952777 (= lt!429330 (select (arr!27715 (_keys!10785 thiss!1141)) (index!39021 lt!429331)))))

(declare-fun c!99691 () Bool)

(assert (=> b!952777 (= c!99691 (= lt!429330 key!756))))

(declare-fun b!952778 () Bool)

(declare-fun e!536596 () SeekEntryResult!9162)

(assert (=> b!952778 (= e!536596 (MissingZero!9162 (index!39021 lt!429331)))))

(declare-fun b!952779 () Bool)

(declare-fun c!99692 () Bool)

(assert (=> b!952779 (= c!99692 (= lt!429330 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!952779 (= e!536597 e!536596)))

(declare-fun b!952781 () Bool)

(assert (=> b!952781 (= e!536598 Undefined!9162)))

(declare-fun b!952782 () Bool)

(declare-fun lt!429332 () SeekEntryResult!9162)

(assert (=> b!952782 (= e!536596 (ite ((_ is MissingVacant!9162) lt!429332) (MissingZero!9162 (index!39022 lt!429332)) lt!429332))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57648 (_ BitVec 32)) SeekEntryResult!9162)

(assert (=> b!952782 (= lt!429332 (seekKeyOrZeroReturnVacant!0 (x!81958 lt!429331) (index!39021 lt!429331) (index!39021 lt!429331) key!756 (_keys!10785 thiss!1141) (mask!27683 thiss!1141)))))

(declare-fun d!115563 () Bool)

(declare-fun lt!429333 () SeekEntryResult!9162)

(assert (=> d!115563 (and (or ((_ is MissingVacant!9162) lt!429333) (not ((_ is Found!9162) lt!429333)) (and (bvsge (index!39020 lt!429333) #b00000000000000000000000000000000) (bvslt (index!39020 lt!429333) (size!28194 (_keys!10785 thiss!1141))))) (not ((_ is MissingVacant!9162) lt!429333)) (or (not ((_ is Found!9162) lt!429333)) (= (select (arr!27715 (_keys!10785 thiss!1141)) (index!39020 lt!429333)) key!756)))))

(assert (=> d!115563 (= lt!429333 e!536598)))

(declare-fun c!99693 () Bool)

(assert (=> d!115563 (= c!99693 (and ((_ is Intermediate!9162) lt!429331) (undefined!9974 lt!429331)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57648 (_ BitVec 32)) SeekEntryResult!9162)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115563 (= lt!429331 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27683 thiss!1141)) key!756 (_keys!10785 thiss!1141) (mask!27683 thiss!1141)))))

(assert (=> d!115563 (validMask!0 (mask!27683 thiss!1141))))

(assert (=> d!115563 (= (seekEntry!0 key!756 (_keys!10785 thiss!1141) (mask!27683 thiss!1141)) lt!429333)))

(declare-fun b!952780 () Bool)

(assert (=> b!952780 (= e!536597 (Found!9162 (index!39021 lt!429331)))))

(assert (= (and d!115563 c!99693) b!952781))

(assert (= (and d!115563 (not c!99693)) b!952777))

(assert (= (and b!952777 c!99691) b!952780))

(assert (= (and b!952777 (not c!99691)) b!952779))

(assert (= (and b!952779 c!99692) b!952778))

(assert (= (and b!952779 (not c!99692)) b!952782))

(declare-fun m!884895 () Bool)

(assert (=> b!952777 m!884895))

(declare-fun m!884897 () Bool)

(assert (=> b!952782 m!884897))

(declare-fun m!884899 () Bool)

(assert (=> d!115563 m!884899))

(declare-fun m!884901 () Bool)

(assert (=> d!115563 m!884901))

(assert (=> d!115563 m!884901))

(declare-fun m!884903 () Bool)

(assert (=> d!115563 m!884903))

(assert (=> d!115563 m!884843))

(assert (=> b!952728 d!115563))

(declare-fun d!115565 () Bool)

(declare-fun res!638243 () Bool)

(declare-fun e!536601 () Bool)

(assert (=> d!115565 (=> (not res!638243) (not e!536601))))

(declare-fun simpleValid!383 (LongMapFixedSize!4992) Bool)

(assert (=> d!115565 (= res!638243 (simpleValid!383 thiss!1141))))

(assert (=> d!115565 (= (valid!1899 thiss!1141) e!536601)))

(declare-fun b!952789 () Bool)

(declare-fun res!638244 () Bool)

(assert (=> b!952789 (=> (not res!638244) (not e!536601))))

(declare-fun arrayCountValidKeys!0 (array!57648 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!952789 (= res!638244 (= (arrayCountValidKeys!0 (_keys!10785 thiss!1141) #b00000000000000000000000000000000 (size!28194 (_keys!10785 thiss!1141))) (_size!2551 thiss!1141)))))

(declare-fun b!952790 () Bool)

(declare-fun res!638245 () Bool)

(assert (=> b!952790 (=> (not res!638245) (not e!536601))))

(assert (=> b!952790 (= res!638245 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10785 thiss!1141) (mask!27683 thiss!1141)))))

(declare-fun b!952791 () Bool)

(declare-datatypes ((List!19369 0))(
  ( (Nil!19366) (Cons!19365 (h!20527 (_ BitVec 64)) (t!27728 List!19369)) )
))
(declare-fun arrayNoDuplicates!0 (array!57648 (_ BitVec 32) List!19369) Bool)

(assert (=> b!952791 (= e!536601 (arrayNoDuplicates!0 (_keys!10785 thiss!1141) #b00000000000000000000000000000000 Nil!19366))))

(assert (= (and d!115565 res!638243) b!952789))

(assert (= (and b!952789 res!638244) b!952790))

(assert (= (and b!952790 res!638245) b!952791))

(declare-fun m!884905 () Bool)

(assert (=> d!115565 m!884905))

(declare-fun m!884907 () Bool)

(assert (=> b!952789 m!884907))

(assert (=> b!952790 m!884853))

(declare-fun m!884909 () Bool)

(assert (=> b!952791 m!884909))

(assert (=> start!81542 d!115565))

(declare-fun d!115567 () Bool)

(declare-fun e!536606 () Bool)

(assert (=> d!115567 e!536606))

(declare-fun res!638248 () Bool)

(assert (=> d!115567 (=> res!638248 e!536606)))

(declare-fun lt!429344 () Bool)

(assert (=> d!115567 (= res!638248 (not lt!429344))))

(declare-fun lt!429345 () Bool)

(assert (=> d!115567 (= lt!429344 lt!429345)))

(declare-fun lt!429343 () Unit!32049)

(declare-fun e!536607 () Unit!32049)

(assert (=> d!115567 (= lt!429343 e!536607)))

(declare-fun c!99696 () Bool)

(assert (=> d!115567 (= c!99696 lt!429345)))

(declare-fun containsKey!473 (List!19367 (_ BitVec 64)) Bool)

(assert (=> d!115567 (= lt!429345 (containsKey!473 (toList!6157 (getCurrentListMap!3390 (_keys!10785 thiss!1141) (_values!5852 thiss!1141) (mask!27683 thiss!1141) (extraKeys!5561 thiss!1141) (zeroValue!5665 thiss!1141) (minValue!5665 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5829 thiss!1141))) key!756))))

(assert (=> d!115567 (= (contains!5252 (getCurrentListMap!3390 (_keys!10785 thiss!1141) (_values!5852 thiss!1141) (mask!27683 thiss!1141) (extraKeys!5561 thiss!1141) (zeroValue!5665 thiss!1141) (minValue!5665 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5829 thiss!1141)) key!756) lt!429344)))

(declare-fun b!952798 () Bool)

(declare-fun lt!429342 () Unit!32049)

(assert (=> b!952798 (= e!536607 lt!429342)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!369 (List!19367 (_ BitVec 64)) Unit!32049)

(assert (=> b!952798 (= lt!429342 (lemmaContainsKeyImpliesGetValueByKeyDefined!369 (toList!6157 (getCurrentListMap!3390 (_keys!10785 thiss!1141) (_values!5852 thiss!1141) (mask!27683 thiss!1141) (extraKeys!5561 thiss!1141) (zeroValue!5665 thiss!1141) (minValue!5665 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5829 thiss!1141))) key!756))))

(declare-datatypes ((Option!512 0))(
  ( (Some!511 (v!13007 V!32705)) (None!510) )
))
(declare-fun isDefined!378 (Option!512) Bool)

(declare-fun getValueByKey!506 (List!19367 (_ BitVec 64)) Option!512)

(assert (=> b!952798 (isDefined!378 (getValueByKey!506 (toList!6157 (getCurrentListMap!3390 (_keys!10785 thiss!1141) (_values!5852 thiss!1141) (mask!27683 thiss!1141) (extraKeys!5561 thiss!1141) (zeroValue!5665 thiss!1141) (minValue!5665 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5829 thiss!1141))) key!756))))

(declare-fun b!952799 () Bool)

(declare-fun Unit!32053 () Unit!32049)

(assert (=> b!952799 (= e!536607 Unit!32053)))

(declare-fun b!952800 () Bool)

(assert (=> b!952800 (= e!536606 (isDefined!378 (getValueByKey!506 (toList!6157 (getCurrentListMap!3390 (_keys!10785 thiss!1141) (_values!5852 thiss!1141) (mask!27683 thiss!1141) (extraKeys!5561 thiss!1141) (zeroValue!5665 thiss!1141) (minValue!5665 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5829 thiss!1141))) key!756)))))

(assert (= (and d!115567 c!99696) b!952798))

(assert (= (and d!115567 (not c!99696)) b!952799))

(assert (= (and d!115567 (not res!638248)) b!952800))

(declare-fun m!884911 () Bool)

(assert (=> d!115567 m!884911))

(declare-fun m!884913 () Bool)

(assert (=> b!952798 m!884913))

(declare-fun m!884915 () Bool)

(assert (=> b!952798 m!884915))

(assert (=> b!952798 m!884915))

(declare-fun m!884917 () Bool)

(assert (=> b!952798 m!884917))

(assert (=> b!952800 m!884915))

(assert (=> b!952800 m!884915))

(assert (=> b!952800 m!884917))

(assert (=> b!952718 d!115567))

(declare-fun b!952843 () Bool)

(declare-fun e!536635 () Unit!32049)

(declare-fun lt!429400 () Unit!32049)

(assert (=> b!952843 (= e!536635 lt!429400)))

(declare-fun lt!429399 () ListLongMap!12283)

(declare-fun getCurrentListMapNoExtraKeys!3326 (array!57648 array!57646 (_ BitVec 32) (_ BitVec 32) V!32705 V!32705 (_ BitVec 32) Int) ListLongMap!12283)

(assert (=> b!952843 (= lt!429399 (getCurrentListMapNoExtraKeys!3326 (_keys!10785 thiss!1141) (_values!5852 thiss!1141) (mask!27683 thiss!1141) (extraKeys!5561 thiss!1141) (zeroValue!5665 thiss!1141) (minValue!5665 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5829 thiss!1141)))))

(declare-fun lt!429401 () (_ BitVec 64))

(assert (=> b!952843 (= lt!429401 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429391 () (_ BitVec 64))

(assert (=> b!952843 (= lt!429391 (select (arr!27715 (_keys!10785 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429404 () Unit!32049)

(declare-fun addStillContains!590 (ListLongMap!12283 (_ BitVec 64) V!32705 (_ BitVec 64)) Unit!32049)

(assert (=> b!952843 (= lt!429404 (addStillContains!590 lt!429399 lt!429401 (zeroValue!5665 thiss!1141) lt!429391))))

(declare-fun +!2871 (ListLongMap!12283 tuple2!13586) ListLongMap!12283)

(assert (=> b!952843 (contains!5252 (+!2871 lt!429399 (tuple2!13587 lt!429401 (zeroValue!5665 thiss!1141))) lt!429391)))

(declare-fun lt!429409 () Unit!32049)

(assert (=> b!952843 (= lt!429409 lt!429404)))

(declare-fun lt!429411 () ListLongMap!12283)

(assert (=> b!952843 (= lt!429411 (getCurrentListMapNoExtraKeys!3326 (_keys!10785 thiss!1141) (_values!5852 thiss!1141) (mask!27683 thiss!1141) (extraKeys!5561 thiss!1141) (zeroValue!5665 thiss!1141) (minValue!5665 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5829 thiss!1141)))))

(declare-fun lt!429392 () (_ BitVec 64))

(assert (=> b!952843 (= lt!429392 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429398 () (_ BitVec 64))

(assert (=> b!952843 (= lt!429398 (select (arr!27715 (_keys!10785 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429394 () Unit!32049)

(declare-fun addApplyDifferent!470 (ListLongMap!12283 (_ BitVec 64) V!32705 (_ BitVec 64)) Unit!32049)

(assert (=> b!952843 (= lt!429394 (addApplyDifferent!470 lt!429411 lt!429392 (minValue!5665 thiss!1141) lt!429398))))

(declare-fun apply!887 (ListLongMap!12283 (_ BitVec 64)) V!32705)

(assert (=> b!952843 (= (apply!887 (+!2871 lt!429411 (tuple2!13587 lt!429392 (minValue!5665 thiss!1141))) lt!429398) (apply!887 lt!429411 lt!429398))))

(declare-fun lt!429408 () Unit!32049)

(assert (=> b!952843 (= lt!429408 lt!429394)))

(declare-fun lt!429407 () ListLongMap!12283)

(assert (=> b!952843 (= lt!429407 (getCurrentListMapNoExtraKeys!3326 (_keys!10785 thiss!1141) (_values!5852 thiss!1141) (mask!27683 thiss!1141) (extraKeys!5561 thiss!1141) (zeroValue!5665 thiss!1141) (minValue!5665 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5829 thiss!1141)))))

(declare-fun lt!429410 () (_ BitVec 64))

(assert (=> b!952843 (= lt!429410 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429397 () (_ BitVec 64))

(assert (=> b!952843 (= lt!429397 (select (arr!27715 (_keys!10785 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429396 () Unit!32049)

(assert (=> b!952843 (= lt!429396 (addApplyDifferent!470 lt!429407 lt!429410 (zeroValue!5665 thiss!1141) lt!429397))))

(assert (=> b!952843 (= (apply!887 (+!2871 lt!429407 (tuple2!13587 lt!429410 (zeroValue!5665 thiss!1141))) lt!429397) (apply!887 lt!429407 lt!429397))))

(declare-fun lt!429405 () Unit!32049)

(assert (=> b!952843 (= lt!429405 lt!429396)))

(declare-fun lt!429403 () ListLongMap!12283)

(assert (=> b!952843 (= lt!429403 (getCurrentListMapNoExtraKeys!3326 (_keys!10785 thiss!1141) (_values!5852 thiss!1141) (mask!27683 thiss!1141) (extraKeys!5561 thiss!1141) (zeroValue!5665 thiss!1141) (minValue!5665 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5829 thiss!1141)))))

(declare-fun lt!429393 () (_ BitVec 64))

(assert (=> b!952843 (= lt!429393 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429390 () (_ BitVec 64))

(assert (=> b!952843 (= lt!429390 (select (arr!27715 (_keys!10785 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!952843 (= lt!429400 (addApplyDifferent!470 lt!429403 lt!429393 (minValue!5665 thiss!1141) lt!429390))))

(assert (=> b!952843 (= (apply!887 (+!2871 lt!429403 (tuple2!13587 lt!429393 (minValue!5665 thiss!1141))) lt!429390) (apply!887 lt!429403 lt!429390))))

(declare-fun b!952844 () Bool)

(declare-fun e!536644 () Bool)

(declare-fun e!536636 () Bool)

(assert (=> b!952844 (= e!536644 e!536636)))

(declare-fun res!638273 () Bool)

(declare-fun call!41619 () Bool)

(assert (=> b!952844 (= res!638273 call!41619)))

(assert (=> b!952844 (=> (not res!638273) (not e!536636))))

(declare-fun bm!41611 () Bool)

(declare-fun lt!429406 () ListLongMap!12283)

(assert (=> bm!41611 (= call!41619 (contains!5252 lt!429406 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!952845 () Bool)

(declare-fun Unit!32054 () Unit!32049)

(assert (=> b!952845 (= e!536635 Unit!32054)))

(declare-fun b!952846 () Bool)

(declare-fun e!536638 () ListLongMap!12283)

(declare-fun call!41620 () ListLongMap!12283)

(assert (=> b!952846 (= e!536638 call!41620)))

(declare-fun call!41614 () ListLongMap!12283)

(declare-fun call!41616 () ListLongMap!12283)

(declare-fun c!99712 () Bool)

(declare-fun bm!41612 () Bool)

(declare-fun call!41618 () ListLongMap!12283)

(declare-fun call!41617 () ListLongMap!12283)

(declare-fun c!99709 () Bool)

(assert (=> bm!41612 (= call!41616 (+!2871 (ite c!99712 call!41614 (ite c!99709 call!41617 call!41618)) (ite (or c!99712 c!99709) (tuple2!13587 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5665 thiss!1141)) (tuple2!13587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5665 thiss!1141)))))))

(declare-fun b!952847 () Bool)

(declare-fun e!536641 () Bool)

(declare-fun call!41615 () Bool)

(assert (=> b!952847 (= e!536641 (not call!41615))))

(declare-fun b!952848 () Bool)

(assert (=> b!952848 (= e!536636 (= (apply!887 lt!429406 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5665 thiss!1141)))))

(declare-fun b!952849 () Bool)

(declare-fun e!536637 () Bool)

(assert (=> b!952849 (= e!536637 (validKeyInArray!0 (select (arr!27715 (_keys!10785 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41613 () Bool)

(assert (=> bm!41613 (= call!41617 call!41614)))

(declare-fun b!952850 () Bool)

(declare-fun e!536640 () ListLongMap!12283)

(assert (=> b!952850 (= e!536640 call!41620)))

(declare-fun b!952851 () Bool)

(declare-fun e!536643 () ListLongMap!12283)

(assert (=> b!952851 (= e!536643 (+!2871 call!41616 (tuple2!13587 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5665 thiss!1141))))))

(declare-fun b!952852 () Bool)

(declare-fun res!638269 () Bool)

(declare-fun e!536642 () Bool)

(assert (=> b!952852 (=> (not res!638269) (not e!536642))))

(assert (=> b!952852 (= res!638269 e!536644)))

(declare-fun c!99711 () Bool)

(assert (=> b!952852 (= c!99711 (not (= (bvand (extraKeys!5561 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!952853 () Bool)

(declare-fun e!536646 () Bool)

(declare-fun get!14568 (ValueCell!9921 V!32705) V!32705)

(declare-fun dynLambda!1660 (Int (_ BitVec 64)) V!32705)

(assert (=> b!952853 (= e!536646 (= (apply!887 lt!429406 (select (arr!27715 (_keys!10785 thiss!1141)) #b00000000000000000000000000000000)) (get!14568 (select (arr!27714 (_values!5852 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1660 (defaultEntry!5829 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!952853 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28193 (_values!5852 thiss!1141))))))

(assert (=> b!952853 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28194 (_keys!10785 thiss!1141))))))

(declare-fun b!952854 () Bool)

(assert (=> b!952854 (= e!536644 (not call!41619))))

(declare-fun b!952855 () Bool)

(declare-fun c!99714 () Bool)

(assert (=> b!952855 (= c!99714 (and (not (= (bvand (extraKeys!5561 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5561 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!952855 (= e!536638 e!536640)))

(declare-fun b!952856 () Bool)

(assert (=> b!952856 (= e!536643 e!536638)))

(assert (=> b!952856 (= c!99709 (and (not (= (bvand (extraKeys!5561 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5561 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!41614 () Bool)

(assert (=> bm!41614 (= call!41620 call!41616)))

(declare-fun bm!41615 () Bool)

(assert (=> bm!41615 (= call!41615 (contains!5252 lt!429406 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!952857 () Bool)

(assert (=> b!952857 (= e!536640 call!41618)))

(declare-fun b!952858 () Bool)

(assert (=> b!952858 (= e!536642 e!536641)))

(declare-fun c!99710 () Bool)

(assert (=> b!952858 (= c!99710 (not (= (bvand (extraKeys!5561 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!952859 () Bool)

(declare-fun e!536645 () Bool)

(assert (=> b!952859 (= e!536645 (= (apply!887 lt!429406 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5665 thiss!1141)))))

(declare-fun b!952860 () Bool)

(declare-fun res!638274 () Bool)

(assert (=> b!952860 (=> (not res!638274) (not e!536642))))

(declare-fun e!536634 () Bool)

(assert (=> b!952860 (= res!638274 e!536634)))

(declare-fun res!638267 () Bool)

(assert (=> b!952860 (=> res!638267 e!536634)))

(declare-fun e!536639 () Bool)

(assert (=> b!952860 (= res!638267 (not e!536639))))

(declare-fun res!638271 () Bool)

(assert (=> b!952860 (=> (not res!638271) (not e!536639))))

(assert (=> b!952860 (= res!638271 (bvslt #b00000000000000000000000000000000 (size!28194 (_keys!10785 thiss!1141))))))

(declare-fun d!115569 () Bool)

(assert (=> d!115569 e!536642))

(declare-fun res!638275 () Bool)

(assert (=> d!115569 (=> (not res!638275) (not e!536642))))

(assert (=> d!115569 (= res!638275 (or (bvsge #b00000000000000000000000000000000 (size!28194 (_keys!10785 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28194 (_keys!10785 thiss!1141))))))))

(declare-fun lt!429395 () ListLongMap!12283)

(assert (=> d!115569 (= lt!429406 lt!429395)))

(declare-fun lt!429402 () Unit!32049)

(assert (=> d!115569 (= lt!429402 e!536635)))

(declare-fun c!99713 () Bool)

(assert (=> d!115569 (= c!99713 e!536637)))

(declare-fun res!638268 () Bool)

(assert (=> d!115569 (=> (not res!638268) (not e!536637))))

(assert (=> d!115569 (= res!638268 (bvslt #b00000000000000000000000000000000 (size!28194 (_keys!10785 thiss!1141))))))

(assert (=> d!115569 (= lt!429395 e!536643)))

(assert (=> d!115569 (= c!99712 (and (not (= (bvand (extraKeys!5561 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5561 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!115569 (validMask!0 (mask!27683 thiss!1141))))

(assert (=> d!115569 (= (getCurrentListMap!3390 (_keys!10785 thiss!1141) (_values!5852 thiss!1141) (mask!27683 thiss!1141) (extraKeys!5561 thiss!1141) (zeroValue!5665 thiss!1141) (minValue!5665 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5829 thiss!1141)) lt!429406)))

(declare-fun bm!41616 () Bool)

(assert (=> bm!41616 (= call!41618 call!41617)))

(declare-fun b!952861 () Bool)

(assert (=> b!952861 (= e!536641 e!536645)))

(declare-fun res!638272 () Bool)

(assert (=> b!952861 (= res!638272 call!41615)))

(assert (=> b!952861 (=> (not res!638272) (not e!536645))))

(declare-fun b!952862 () Bool)

(assert (=> b!952862 (= e!536634 e!536646)))

(declare-fun res!638270 () Bool)

(assert (=> b!952862 (=> (not res!638270) (not e!536646))))

(assert (=> b!952862 (= res!638270 (contains!5252 lt!429406 (select (arr!27715 (_keys!10785 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!952862 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28194 (_keys!10785 thiss!1141))))))

(declare-fun bm!41617 () Bool)

(assert (=> bm!41617 (= call!41614 (getCurrentListMapNoExtraKeys!3326 (_keys!10785 thiss!1141) (_values!5852 thiss!1141) (mask!27683 thiss!1141) (extraKeys!5561 thiss!1141) (zeroValue!5665 thiss!1141) (minValue!5665 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5829 thiss!1141)))))

(declare-fun b!952863 () Bool)

(assert (=> b!952863 (= e!536639 (validKeyInArray!0 (select (arr!27715 (_keys!10785 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!115569 c!99712) b!952851))

(assert (= (and d!115569 (not c!99712)) b!952856))

(assert (= (and b!952856 c!99709) b!952846))

(assert (= (and b!952856 (not c!99709)) b!952855))

(assert (= (and b!952855 c!99714) b!952850))

(assert (= (and b!952855 (not c!99714)) b!952857))

(assert (= (or b!952850 b!952857) bm!41616))

(assert (= (or b!952846 bm!41616) bm!41613))

(assert (= (or b!952846 b!952850) bm!41614))

(assert (= (or b!952851 bm!41613) bm!41617))

(assert (= (or b!952851 bm!41614) bm!41612))

(assert (= (and d!115569 res!638268) b!952849))

(assert (= (and d!115569 c!99713) b!952843))

(assert (= (and d!115569 (not c!99713)) b!952845))

(assert (= (and d!115569 res!638275) b!952860))

(assert (= (and b!952860 res!638271) b!952863))

(assert (= (and b!952860 (not res!638267)) b!952862))

(assert (= (and b!952862 res!638270) b!952853))

(assert (= (and b!952860 res!638274) b!952852))

(assert (= (and b!952852 c!99711) b!952844))

(assert (= (and b!952852 (not c!99711)) b!952854))

(assert (= (and b!952844 res!638273) b!952848))

(assert (= (or b!952844 b!952854) bm!41611))

(assert (= (and b!952852 res!638269) b!952858))

(assert (= (and b!952858 c!99710) b!952861))

(assert (= (and b!952858 (not c!99710)) b!952847))

(assert (= (and b!952861 res!638272) b!952859))

(assert (= (or b!952861 b!952847) bm!41615))

(declare-fun b_lambda!14419 () Bool)

(assert (=> (not b_lambda!14419) (not b!952853)))

(declare-fun t!27727 () Bool)

(declare-fun tb!6209 () Bool)

(assert (=> (and b!952722 (= (defaultEntry!5829 thiss!1141) (defaultEntry!5829 thiss!1141)) t!27727) tb!6209))

(declare-fun result!12349 () Bool)

(assert (=> tb!6209 (= result!12349 tp_is_empty!20805)))

(assert (=> b!952853 t!27727))

(declare-fun b_and!29783 () Bool)

(assert (= b_and!29779 (and (=> t!27727 result!12349) b_and!29783)))

(declare-fun m!884919 () Bool)

(assert (=> bm!41615 m!884919))

(declare-fun m!884921 () Bool)

(assert (=> b!952849 m!884921))

(assert (=> b!952849 m!884921))

(declare-fun m!884923 () Bool)

(assert (=> b!952849 m!884923))

(declare-fun m!884925 () Bool)

(assert (=> b!952851 m!884925))

(assert (=> d!115569 m!884843))

(declare-fun m!884927 () Bool)

(assert (=> bm!41617 m!884927))

(assert (=> b!952863 m!884921))

(assert (=> b!952863 m!884921))

(assert (=> b!952863 m!884923))

(assert (=> b!952853 m!884921))

(declare-fun m!884929 () Bool)

(assert (=> b!952853 m!884929))

(declare-fun m!884931 () Bool)

(assert (=> b!952853 m!884931))

(declare-fun m!884933 () Bool)

(assert (=> b!952853 m!884933))

(assert (=> b!952853 m!884921))

(declare-fun m!884935 () Bool)

(assert (=> b!952853 m!884935))

(assert (=> b!952853 m!884931))

(assert (=> b!952853 m!884929))

(declare-fun m!884937 () Bool)

(assert (=> bm!41612 m!884937))

(declare-fun m!884939 () Bool)

(assert (=> b!952843 m!884939))

(declare-fun m!884941 () Bool)

(assert (=> b!952843 m!884941))

(declare-fun m!884943 () Bool)

(assert (=> b!952843 m!884943))

(declare-fun m!884945 () Bool)

(assert (=> b!952843 m!884945))

(assert (=> b!952843 m!884921))

(declare-fun m!884947 () Bool)

(assert (=> b!952843 m!884947))

(declare-fun m!884949 () Bool)

(assert (=> b!952843 m!884949))

(declare-fun m!884951 () Bool)

(assert (=> b!952843 m!884951))

(declare-fun m!884953 () Bool)

(assert (=> b!952843 m!884953))

(assert (=> b!952843 m!884951))

(declare-fun m!884955 () Bool)

(assert (=> b!952843 m!884955))

(declare-fun m!884957 () Bool)

(assert (=> b!952843 m!884957))

(assert (=> b!952843 m!884927))

(assert (=> b!952843 m!884941))

(declare-fun m!884959 () Bool)

(assert (=> b!952843 m!884959))

(declare-fun m!884961 () Bool)

(assert (=> b!952843 m!884961))

(assert (=> b!952843 m!884947))

(assert (=> b!952843 m!884961))

(declare-fun m!884963 () Bool)

(assert (=> b!952843 m!884963))

(declare-fun m!884965 () Bool)

(assert (=> b!952843 m!884965))

(declare-fun m!884967 () Bool)

(assert (=> b!952843 m!884967))

(declare-fun m!884969 () Bool)

(assert (=> bm!41611 m!884969))

(declare-fun m!884971 () Bool)

(assert (=> b!952848 m!884971))

(declare-fun m!884973 () Bool)

(assert (=> b!952859 m!884973))

(assert (=> b!952862 m!884921))

(assert (=> b!952862 m!884921))

(declare-fun m!884975 () Bool)

(assert (=> b!952862 m!884975))

(assert (=> b!952718 d!115569))

(declare-fun d!115571 () Bool)

(assert (=> d!115571 (= (array_inv!21506 (_keys!10785 thiss!1141)) (bvsge (size!28194 (_keys!10785 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!952722 d!115571))

(declare-fun d!115573 () Bool)

(assert (=> d!115573 (= (array_inv!21507 (_values!5852 thiss!1141)) (bvsge (size!28193 (_values!5852 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!952722 d!115573))

(declare-fun d!115575 () Bool)

(declare-fun e!536649 () Bool)

(assert (=> d!115575 e!536649))

(declare-fun c!99717 () Bool)

(assert (=> d!115575 (= c!99717 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!429414 () Unit!32049)

(declare-fun choose!1599 (array!57648 array!57646 (_ BitVec 32) (_ BitVec 32) V!32705 V!32705 (_ BitVec 64) Int) Unit!32049)

(assert (=> d!115575 (= lt!429414 (choose!1599 (_keys!10785 thiss!1141) (_values!5852 thiss!1141) (mask!27683 thiss!1141) (extraKeys!5561 thiss!1141) (zeroValue!5665 thiss!1141) (minValue!5665 thiss!1141) key!756 (defaultEntry!5829 thiss!1141)))))

(assert (=> d!115575 (validMask!0 (mask!27683 thiss!1141))))

(assert (=> d!115575 (= (lemmaKeyInListMapIsInArray!336 (_keys!10785 thiss!1141) (_values!5852 thiss!1141) (mask!27683 thiss!1141) (extraKeys!5561 thiss!1141) (zeroValue!5665 thiss!1141) (minValue!5665 thiss!1141) key!756 (defaultEntry!5829 thiss!1141)) lt!429414)))

(declare-fun b!952870 () Bool)

(assert (=> b!952870 (= e!536649 (arrayContainsKey!0 (_keys!10785 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun b!952871 () Bool)

(assert (=> b!952871 (= e!536649 (ite (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5561 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5561 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!115575 c!99717) b!952870))

(assert (= (and d!115575 (not c!99717)) b!952871))

(declare-fun m!884977 () Bool)

(assert (=> d!115575 m!884977))

(assert (=> d!115575 m!884843))

(assert (=> b!952870 m!884847))

(assert (=> b!952727 d!115575))

(declare-fun d!115577 () Bool)

(declare-fun lt!429417 () (_ BitVec 32))

(assert (=> d!115577 (and (or (bvslt lt!429417 #b00000000000000000000000000000000) (bvsge lt!429417 (size!28194 (_keys!10785 thiss!1141))) (and (bvsge lt!429417 #b00000000000000000000000000000000) (bvslt lt!429417 (size!28194 (_keys!10785 thiss!1141))))) (bvsge lt!429417 #b00000000000000000000000000000000) (bvslt lt!429417 (size!28194 (_keys!10785 thiss!1141))) (= (select (arr!27715 (_keys!10785 thiss!1141)) lt!429417) key!756))))

(declare-fun e!536652 () (_ BitVec 32))

(assert (=> d!115577 (= lt!429417 e!536652)))

(declare-fun c!99720 () Bool)

(assert (=> d!115577 (= c!99720 (= (select (arr!27715 (_keys!10785 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115577 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28194 (_keys!10785 thiss!1141))) (bvslt (size!28194 (_keys!10785 thiss!1141)) #b01111111111111111111111111111111))))

(assert (=> d!115577 (= (arrayScanForKey!0 (_keys!10785 thiss!1141) key!756 #b00000000000000000000000000000000) lt!429417)))

(declare-fun b!952876 () Bool)

(assert (=> b!952876 (= e!536652 #b00000000000000000000000000000000)))

(declare-fun b!952877 () Bool)

(assert (=> b!952877 (= e!536652 (arrayScanForKey!0 (_keys!10785 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115577 c!99720) b!952876))

(assert (= (and d!115577 (not c!99720)) b!952877))

(declare-fun m!884979 () Bool)

(assert (=> d!115577 m!884979))

(assert (=> d!115577 m!884921))

(declare-fun m!884981 () Bool)

(assert (=> b!952877 m!884981))

(assert (=> b!952727 d!115577))

(declare-fun b!952886 () Bool)

(declare-fun e!536661 () Bool)

(declare-fun e!536660 () Bool)

(assert (=> b!952886 (= e!536661 e!536660)))

(declare-fun c!99723 () Bool)

(assert (=> b!952886 (= c!99723 (validKeyInArray!0 (select (arr!27715 (_keys!10785 thiss!1141)) lt!429311)))))

(declare-fun b!952887 () Bool)

(declare-fun e!536659 () Bool)

(declare-fun call!41623 () Bool)

(assert (=> b!952887 (= e!536659 call!41623)))

(declare-fun bm!41620 () Bool)

(assert (=> bm!41620 (= call!41623 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!429311 #b00000000000000000000000000000001) (_keys!10785 thiss!1141) (mask!27683 thiss!1141)))))

(declare-fun d!115579 () Bool)

(declare-fun res!638280 () Bool)

(assert (=> d!115579 (=> res!638280 e!536661)))

(assert (=> d!115579 (= res!638280 (bvsge lt!429311 (size!28194 (_keys!10785 thiss!1141))))))

(assert (=> d!115579 (= (arrayForallSeekEntryOrOpenFound!0 lt!429311 (_keys!10785 thiss!1141) (mask!27683 thiss!1141)) e!536661)))

(declare-fun b!952888 () Bool)

(assert (=> b!952888 (= e!536660 e!536659)))

(declare-fun lt!429424 () (_ BitVec 64))

(assert (=> b!952888 (= lt!429424 (select (arr!27715 (_keys!10785 thiss!1141)) lt!429311))))

(declare-fun lt!429426 () Unit!32049)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57648 (_ BitVec 64) (_ BitVec 32)) Unit!32049)

(assert (=> b!952888 (= lt!429426 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10785 thiss!1141) lt!429424 lt!429311))))

(assert (=> b!952888 (arrayContainsKey!0 (_keys!10785 thiss!1141) lt!429424 #b00000000000000000000000000000000)))

(declare-fun lt!429425 () Unit!32049)

(assert (=> b!952888 (= lt!429425 lt!429426)))

(declare-fun res!638281 () Bool)

(assert (=> b!952888 (= res!638281 (= (seekEntryOrOpen!0 (select (arr!27715 (_keys!10785 thiss!1141)) lt!429311) (_keys!10785 thiss!1141) (mask!27683 thiss!1141)) (Found!9162 lt!429311)))))

(assert (=> b!952888 (=> (not res!638281) (not e!536659))))

(declare-fun b!952889 () Bool)

(assert (=> b!952889 (= e!536660 call!41623)))

(assert (= (and d!115579 (not res!638280)) b!952886))

(assert (= (and b!952886 c!99723) b!952888))

(assert (= (and b!952886 (not c!99723)) b!952889))

(assert (= (and b!952888 res!638281) b!952887))

(assert (= (or b!952887 b!952889) bm!41620))

(declare-fun m!884983 () Bool)

(assert (=> b!952886 m!884983))

(assert (=> b!952886 m!884983))

(declare-fun m!884985 () Bool)

(assert (=> b!952886 m!884985))

(declare-fun m!884987 () Bool)

(assert (=> bm!41620 m!884987))

(assert (=> b!952888 m!884983))

(declare-fun m!884989 () Bool)

(assert (=> b!952888 m!884989))

(declare-fun m!884991 () Bool)

(assert (=> b!952888 m!884991))

(assert (=> b!952888 m!884983))

(declare-fun m!884993 () Bool)

(assert (=> b!952888 m!884993))

(assert (=> b!952727 d!115579))

(declare-fun d!115581 () Bool)

(assert (=> d!115581 (= (validMask!0 (mask!27683 thiss!1141)) (and (or (= (mask!27683 thiss!1141) #b00000000000000000000000000000111) (= (mask!27683 thiss!1141) #b00000000000000000000000000001111) (= (mask!27683 thiss!1141) #b00000000000000000000000000011111) (= (mask!27683 thiss!1141) #b00000000000000000000000000111111) (= (mask!27683 thiss!1141) #b00000000000000000000000001111111) (= (mask!27683 thiss!1141) #b00000000000000000000000011111111) (= (mask!27683 thiss!1141) #b00000000000000000000000111111111) (= (mask!27683 thiss!1141) #b00000000000000000000001111111111) (= (mask!27683 thiss!1141) #b00000000000000000000011111111111) (= (mask!27683 thiss!1141) #b00000000000000000000111111111111) (= (mask!27683 thiss!1141) #b00000000000000000001111111111111) (= (mask!27683 thiss!1141) #b00000000000000000011111111111111) (= (mask!27683 thiss!1141) #b00000000000000000111111111111111) (= (mask!27683 thiss!1141) #b00000000000000001111111111111111) (= (mask!27683 thiss!1141) #b00000000000000011111111111111111) (= (mask!27683 thiss!1141) #b00000000000000111111111111111111) (= (mask!27683 thiss!1141) #b00000000000001111111111111111111) (= (mask!27683 thiss!1141) #b00000000000011111111111111111111) (= (mask!27683 thiss!1141) #b00000000000111111111111111111111) (= (mask!27683 thiss!1141) #b00000000001111111111111111111111) (= (mask!27683 thiss!1141) #b00000000011111111111111111111111) (= (mask!27683 thiss!1141) #b00000000111111111111111111111111) (= (mask!27683 thiss!1141) #b00000001111111111111111111111111) (= (mask!27683 thiss!1141) #b00000011111111111111111111111111) (= (mask!27683 thiss!1141) #b00000111111111111111111111111111) (= (mask!27683 thiss!1141) #b00001111111111111111111111111111) (= (mask!27683 thiss!1141) #b00011111111111111111111111111111) (= (mask!27683 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27683 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!952727 d!115581))

(declare-fun d!115583 () Bool)

(assert (=> d!115583 (arrayForallSeekEntryOrOpenFound!0 lt!429311 (_keys!10785 thiss!1141) (mask!27683 thiss!1141))))

(declare-fun lt!429429 () Unit!32049)

(declare-fun choose!38 (array!57648 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!32049)

(assert (=> d!115583 (= lt!429429 (choose!38 (_keys!10785 thiss!1141) (mask!27683 thiss!1141) #b00000000000000000000000000000000 lt!429311))))

(assert (=> d!115583 (validMask!0 (mask!27683 thiss!1141))))

(assert (=> d!115583 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10785 thiss!1141) (mask!27683 thiss!1141) #b00000000000000000000000000000000 lt!429311) lt!429429)))

(declare-fun bs!26767 () Bool)

(assert (= bs!26767 d!115583))

(assert (=> bs!26767 m!884849))

(declare-fun m!884995 () Bool)

(assert (=> bs!26767 m!884995))

(assert (=> bs!26767 m!884843))

(assert (=> b!952727 d!115583))

(declare-fun d!115585 () Bool)

(declare-fun res!638286 () Bool)

(declare-fun e!536666 () Bool)

(assert (=> d!115585 (=> res!638286 e!536666)))

(assert (=> d!115585 (= res!638286 (= (select (arr!27715 (_keys!10785 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115585 (= (arrayContainsKey!0 (_keys!10785 thiss!1141) key!756 #b00000000000000000000000000000000) e!536666)))

(declare-fun b!952894 () Bool)

(declare-fun e!536667 () Bool)

(assert (=> b!952894 (= e!536666 e!536667)))

(declare-fun res!638287 () Bool)

(assert (=> b!952894 (=> (not res!638287) (not e!536667))))

(assert (=> b!952894 (= res!638287 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28194 (_keys!10785 thiss!1141))))))

(declare-fun b!952895 () Bool)

(assert (=> b!952895 (= e!536667 (arrayContainsKey!0 (_keys!10785 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115585 (not res!638286)) b!952894))

(assert (= (and b!952894 res!638287) b!952895))

(assert (=> d!115585 m!884921))

(declare-fun m!884997 () Bool)

(assert (=> b!952895 m!884997))

(assert (=> b!952727 d!115585))

(declare-fun b!952908 () Bool)

(declare-fun c!99731 () Bool)

(declare-fun lt!429437 () (_ BitVec 64))

(assert (=> b!952908 (= c!99731 (= lt!429437 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!536675 () SeekEntryResult!9162)

(declare-fun e!536674 () SeekEntryResult!9162)

(assert (=> b!952908 (= e!536675 e!536674)))

(declare-fun d!115587 () Bool)

(declare-fun lt!429438 () SeekEntryResult!9162)

(assert (=> d!115587 (and (or ((_ is Undefined!9162) lt!429438) (not ((_ is Found!9162) lt!429438)) (and (bvsge (index!39020 lt!429438) #b00000000000000000000000000000000) (bvslt (index!39020 lt!429438) (size!28194 (_keys!10785 thiss!1141))))) (or ((_ is Undefined!9162) lt!429438) ((_ is Found!9162) lt!429438) (not ((_ is MissingZero!9162) lt!429438)) (and (bvsge (index!39019 lt!429438) #b00000000000000000000000000000000) (bvslt (index!39019 lt!429438) (size!28194 (_keys!10785 thiss!1141))))) (or ((_ is Undefined!9162) lt!429438) ((_ is Found!9162) lt!429438) ((_ is MissingZero!9162) lt!429438) (not ((_ is MissingVacant!9162) lt!429438)) (and (bvsge (index!39022 lt!429438) #b00000000000000000000000000000000) (bvslt (index!39022 lt!429438) (size!28194 (_keys!10785 thiss!1141))))) (or ((_ is Undefined!9162) lt!429438) (ite ((_ is Found!9162) lt!429438) (= (select (arr!27715 (_keys!10785 thiss!1141)) (index!39020 lt!429438)) key!756) (ite ((_ is MissingZero!9162) lt!429438) (= (select (arr!27715 (_keys!10785 thiss!1141)) (index!39019 lt!429438)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9162) lt!429438) (= (select (arr!27715 (_keys!10785 thiss!1141)) (index!39022 lt!429438)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!536676 () SeekEntryResult!9162)

(assert (=> d!115587 (= lt!429438 e!536676)))

(declare-fun c!99732 () Bool)

(declare-fun lt!429436 () SeekEntryResult!9162)

(assert (=> d!115587 (= c!99732 (and ((_ is Intermediate!9162) lt!429436) (undefined!9974 lt!429436)))))

(assert (=> d!115587 (= lt!429436 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27683 thiss!1141)) key!756 (_keys!10785 thiss!1141) (mask!27683 thiss!1141)))))

(assert (=> d!115587 (validMask!0 (mask!27683 thiss!1141))))

(assert (=> d!115587 (= (seekEntryOrOpen!0 key!756 (_keys!10785 thiss!1141) (mask!27683 thiss!1141)) lt!429438)))

(declare-fun b!952909 () Bool)

(assert (=> b!952909 (= e!536674 (MissingZero!9162 (index!39021 lt!429436)))))

(declare-fun b!952910 () Bool)

(assert (=> b!952910 (= e!536676 Undefined!9162)))

(declare-fun b!952911 () Bool)

(assert (=> b!952911 (= e!536676 e!536675)))

(assert (=> b!952911 (= lt!429437 (select (arr!27715 (_keys!10785 thiss!1141)) (index!39021 lt!429436)))))

(declare-fun c!99730 () Bool)

(assert (=> b!952911 (= c!99730 (= lt!429437 key!756))))

(declare-fun b!952912 () Bool)

(assert (=> b!952912 (= e!536675 (Found!9162 (index!39021 lt!429436)))))

(declare-fun b!952913 () Bool)

(assert (=> b!952913 (= e!536674 (seekKeyOrZeroReturnVacant!0 (x!81958 lt!429436) (index!39021 lt!429436) (index!39021 lt!429436) key!756 (_keys!10785 thiss!1141) (mask!27683 thiss!1141)))))

(assert (= (and d!115587 c!99732) b!952910))

(assert (= (and d!115587 (not c!99732)) b!952911))

(assert (= (and b!952911 c!99730) b!952912))

(assert (= (and b!952911 (not c!99730)) b!952908))

(assert (= (and b!952908 c!99731) b!952909))

(assert (= (and b!952908 (not c!99731)) b!952913))

(assert (=> d!115587 m!884901))

(declare-fun m!884999 () Bool)

(assert (=> d!115587 m!884999))

(declare-fun m!885001 () Bool)

(assert (=> d!115587 m!885001))

(declare-fun m!885003 () Bool)

(assert (=> d!115587 m!885003))

(assert (=> d!115587 m!884843))

(assert (=> d!115587 m!884901))

(assert (=> d!115587 m!884903))

(declare-fun m!885005 () Bool)

(assert (=> b!952911 m!885005))

(declare-fun m!885007 () Bool)

(assert (=> b!952913 m!885007))

(assert (=> b!952725 d!115587))

(declare-fun b!952914 () Bool)

(declare-fun e!536679 () Bool)

(declare-fun e!536678 () Bool)

(assert (=> b!952914 (= e!536679 e!536678)))

(declare-fun c!99733 () Bool)

(assert (=> b!952914 (= c!99733 (validKeyInArray!0 (select (arr!27715 (_keys!10785 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!952915 () Bool)

(declare-fun e!536677 () Bool)

(declare-fun call!41624 () Bool)

(assert (=> b!952915 (= e!536677 call!41624)))

(declare-fun bm!41621 () Bool)

(assert (=> bm!41621 (= call!41624 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10785 thiss!1141) (mask!27683 thiss!1141)))))

(declare-fun d!115589 () Bool)

(declare-fun res!638288 () Bool)

(assert (=> d!115589 (=> res!638288 e!536679)))

(assert (=> d!115589 (= res!638288 (bvsge #b00000000000000000000000000000000 (size!28194 (_keys!10785 thiss!1141))))))

(assert (=> d!115589 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10785 thiss!1141) (mask!27683 thiss!1141)) e!536679)))

(declare-fun b!952916 () Bool)

(assert (=> b!952916 (= e!536678 e!536677)))

(declare-fun lt!429439 () (_ BitVec 64))

(assert (=> b!952916 (= lt!429439 (select (arr!27715 (_keys!10785 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429441 () Unit!32049)

(assert (=> b!952916 (= lt!429441 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10785 thiss!1141) lt!429439 #b00000000000000000000000000000000))))

(assert (=> b!952916 (arrayContainsKey!0 (_keys!10785 thiss!1141) lt!429439 #b00000000000000000000000000000000)))

(declare-fun lt!429440 () Unit!32049)

(assert (=> b!952916 (= lt!429440 lt!429441)))

(declare-fun res!638289 () Bool)

(assert (=> b!952916 (= res!638289 (= (seekEntryOrOpen!0 (select (arr!27715 (_keys!10785 thiss!1141)) #b00000000000000000000000000000000) (_keys!10785 thiss!1141) (mask!27683 thiss!1141)) (Found!9162 #b00000000000000000000000000000000)))))

(assert (=> b!952916 (=> (not res!638289) (not e!536677))))

(declare-fun b!952917 () Bool)

(assert (=> b!952917 (= e!536678 call!41624)))

(assert (= (and d!115589 (not res!638288)) b!952914))

(assert (= (and b!952914 c!99733) b!952916))

(assert (= (and b!952914 (not c!99733)) b!952917))

(assert (= (and b!952916 res!638289) b!952915))

(assert (= (or b!952915 b!952917) bm!41621))

(assert (=> b!952914 m!884921))

(assert (=> b!952914 m!884921))

(assert (=> b!952914 m!884923))

(declare-fun m!885009 () Bool)

(assert (=> bm!41621 m!885009))

(assert (=> b!952916 m!884921))

(declare-fun m!885011 () Bool)

(assert (=> b!952916 m!885011))

(declare-fun m!885013 () Bool)

(assert (=> b!952916 m!885013))

(assert (=> b!952916 m!884921))

(declare-fun m!885015 () Bool)

(assert (=> b!952916 m!885015))

(assert (=> b!952717 d!115589))

(declare-fun mapIsEmpty!33154 () Bool)

(declare-fun mapRes!33154 () Bool)

(assert (=> mapIsEmpty!33154 mapRes!33154))

(declare-fun b!952925 () Bool)

(declare-fun e!536685 () Bool)

(assert (=> b!952925 (= e!536685 tp_is_empty!20805)))

(declare-fun mapNonEmpty!33154 () Bool)

(declare-fun tp!63525 () Bool)

(declare-fun e!536684 () Bool)

(assert (=> mapNonEmpty!33154 (= mapRes!33154 (and tp!63525 e!536684))))

(declare-fun mapRest!33154 () (Array (_ BitVec 32) ValueCell!9921))

(declare-fun mapValue!33154 () ValueCell!9921)

(declare-fun mapKey!33154 () (_ BitVec 32))

(assert (=> mapNonEmpty!33154 (= mapRest!33148 (store mapRest!33154 mapKey!33154 mapValue!33154))))

(declare-fun b!952924 () Bool)

(assert (=> b!952924 (= e!536684 tp_is_empty!20805)))

(declare-fun condMapEmpty!33154 () Bool)

(declare-fun mapDefault!33154 () ValueCell!9921)

(assert (=> mapNonEmpty!33148 (= condMapEmpty!33154 (= mapRest!33148 ((as const (Array (_ BitVec 32) ValueCell!9921)) mapDefault!33154)))))

(assert (=> mapNonEmpty!33148 (= tp!63515 (and e!536685 mapRes!33154))))

(assert (= (and mapNonEmpty!33148 condMapEmpty!33154) mapIsEmpty!33154))

(assert (= (and mapNonEmpty!33148 (not condMapEmpty!33154)) mapNonEmpty!33154))

(assert (= (and mapNonEmpty!33154 ((_ is ValueCellFull!9921) mapValue!33154)) b!952924))

(assert (= (and mapNonEmpty!33148 ((_ is ValueCellFull!9921) mapDefault!33154)) b!952925))

(declare-fun m!885017 () Bool)

(assert (=> mapNonEmpty!33154 m!885017))

(declare-fun b_lambda!14421 () Bool)

(assert (= b_lambda!14419 (or (and b!952722 b_free!18297) b_lambda!14421)))

(check-sat (not d!115567) (not b!952851) (not bm!41611) (not b!952853) tp_is_empty!20805 (not b!952913) (not b!952870) (not b!952862) (not d!115569) (not b!952849) (not b_next!18297) (not b_lambda!14421) (not b!952789) (not b!952843) (not d!115563) (not b!952798) (not b!952895) (not b!952782) (not bm!41612) (not bm!41615) (not b!952886) b_and!29783 (not d!115575) (not b!952791) (not bm!41621) (not d!115565) (not b!952877) (not b!952859) (not d!115583) (not b!952848) (not b!952916) (not mapNonEmpty!33154) (not b!952863) (not bm!41617) (not b!952888) (not d!115587) (not bm!41620) (not b!952914) (not b!952790) (not b!952800))
(check-sat b_and!29783 (not b_next!18297))

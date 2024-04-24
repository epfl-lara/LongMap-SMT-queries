; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80586 () Bool)

(assert start!80586)

(declare-fun b!945543 () Bool)

(declare-fun b_free!18061 () Bool)

(declare-fun b_next!18061 () Bool)

(assert (=> b!945543 (= b_free!18061 (not b_next!18061))))

(declare-fun tp!62694 () Bool)

(declare-fun b_and!29489 () Bool)

(assert (=> b!945543 (= tp!62694 b_and!29489)))

(declare-fun res!634928 () Bool)

(declare-fun e!531803 () Bool)

(assert (=> start!80586 (=> (not res!634928) (not e!531803))))

(declare-datatypes ((V!32391 0))(
  ( (V!32392 (val!10335 Int)) )
))
(declare-datatypes ((ValueCell!9803 0))(
  ( (ValueCellFull!9803 (v!12864 V!32391)) (EmptyCell!9803) )
))
(declare-datatypes ((array!57157 0))(
  ( (array!57158 (arr!27499 (Array (_ BitVec 32) ValueCell!9803)) (size!27966 (_ BitVec 32))) )
))
(declare-datatypes ((array!57159 0))(
  ( (array!57160 (arr!27500 (Array (_ BitVec 32) (_ BitVec 64))) (size!27967 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4756 0))(
  ( (LongMapFixedSize!4757 (defaultEntry!5673 Int) (mask!27370 (_ BitVec 32)) (extraKeys!5405 (_ BitVec 32)) (zeroValue!5509 V!32391) (minValue!5509 V!32391) (_size!2433 (_ BitVec 32)) (_keys!10579 array!57159) (_values!5696 array!57157) (_vacant!2433 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4756)

(declare-fun valid!1826 (LongMapFixedSize!4756) Bool)

(assert (=> start!80586 (= res!634928 (valid!1826 thiss!1141))))

(assert (=> start!80586 e!531803))

(declare-fun e!531799 () Bool)

(assert (=> start!80586 e!531799))

(assert (=> start!80586 true))

(declare-fun b!945538 () Bool)

(declare-fun res!634926 () Bool)

(declare-fun e!531802 () Bool)

(assert (=> b!945538 (=> res!634926 e!531802)))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!945538 (= res!634926 (not (validKeyInArray!0 key!756)))))

(declare-fun b!945539 () Bool)

(declare-fun res!634924 () Bool)

(assert (=> b!945539 (=> (not res!634924) (not e!531803))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9032 0))(
  ( (MissingZero!9032 (index!38499 (_ BitVec 32))) (Found!9032 (index!38500 (_ BitVec 32))) (Intermediate!9032 (undefined!9844 Bool) (index!38501 (_ BitVec 32)) (x!81113 (_ BitVec 32))) (Undefined!9032) (MissingVacant!9032 (index!38502 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57159 (_ BitVec 32)) SeekEntryResult!9032)

(assert (=> b!945539 (= res!634924 (not ((_ is Found!9032) (seekEntry!0 key!756 (_keys!10579 thiss!1141) (mask!27370 thiss!1141)))))))

(declare-fun mapIsEmpty!32679 () Bool)

(declare-fun mapRes!32679 () Bool)

(assert (=> mapIsEmpty!32679 mapRes!32679))

(declare-fun b!945540 () Bool)

(declare-fun e!531805 () Bool)

(declare-fun tp_is_empty!20569 () Bool)

(assert (=> b!945540 (= e!531805 tp_is_empty!20569)))

(declare-fun b!945541 () Bool)

(declare-fun res!634929 () Bool)

(assert (=> b!945541 (=> res!634929 e!531802)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57159 (_ BitVec 32)) Bool)

(assert (=> b!945541 (= res!634929 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10579 thiss!1141) (mask!27370 thiss!1141))))))

(declare-fun b!945542 () Bool)

(declare-fun e!531800 () Bool)

(assert (=> b!945542 (= e!531800 tp_is_empty!20569)))

(declare-fun e!531804 () Bool)

(declare-fun array_inv!21450 (array!57159) Bool)

(declare-fun array_inv!21451 (array!57157) Bool)

(assert (=> b!945543 (= e!531799 (and tp!62694 tp_is_empty!20569 (array_inv!21450 (_keys!10579 thiss!1141)) (array_inv!21451 (_values!5696 thiss!1141)) e!531804))))

(declare-fun b!945544 () Bool)

(assert (=> b!945544 (= e!531802 true)))

(declare-fun lt!426057 () SeekEntryResult!9032)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57159 (_ BitVec 32)) SeekEntryResult!9032)

(assert (=> b!945544 (= lt!426057 (seekEntryOrOpen!0 key!756 (_keys!10579 thiss!1141) (mask!27370 thiss!1141)))))

(declare-fun b!945545 () Bool)

(declare-fun res!634931 () Bool)

(assert (=> b!945545 (=> (not res!634931) (not e!531803))))

(declare-datatypes ((tuple2!13466 0))(
  ( (tuple2!13467 (_1!6744 (_ BitVec 64)) (_2!6744 V!32391)) )
))
(declare-datatypes ((List!19262 0))(
  ( (Nil!19259) (Cons!19258 (h!20415 tuple2!13466) (t!27571 List!19262)) )
))
(declare-datatypes ((ListLongMap!12165 0))(
  ( (ListLongMap!12166 (toList!6098 List!19262)) )
))
(declare-fun contains!5181 (ListLongMap!12165 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3332 (array!57159 array!57157 (_ BitVec 32) (_ BitVec 32) V!32391 V!32391 (_ BitVec 32) Int) ListLongMap!12165)

(assert (=> b!945545 (= res!634931 (contains!5181 (getCurrentListMap!3332 (_keys!10579 thiss!1141) (_values!5696 thiss!1141) (mask!27370 thiss!1141) (extraKeys!5405 thiss!1141) (zeroValue!5509 thiss!1141) (minValue!5509 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5673 thiss!1141)) key!756))))

(declare-fun b!945546 () Bool)

(assert (=> b!945546 (= e!531804 (and e!531805 mapRes!32679))))

(declare-fun condMapEmpty!32679 () Bool)

(declare-fun mapDefault!32679 () ValueCell!9803)

(assert (=> b!945546 (= condMapEmpty!32679 (= (arr!27499 (_values!5696 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9803)) mapDefault!32679)))))

(declare-fun b!945547 () Bool)

(declare-fun res!634930 () Bool)

(assert (=> b!945547 (=> (not res!634930) (not e!531803))))

(assert (=> b!945547 (= res!634930 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!945548 () Bool)

(assert (=> b!945548 (= e!531803 (not e!531802))))

(declare-fun res!634927 () Bool)

(assert (=> b!945548 (=> res!634927 e!531802)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!945548 (= res!634927 (not (validMask!0 (mask!27370 thiss!1141))))))

(declare-fun lt!426056 () (_ BitVec 32))

(assert (=> b!945548 (arrayForallSeekEntryOrOpenFound!0 lt!426056 (_keys!10579 thiss!1141) (mask!27370 thiss!1141))))

(declare-datatypes ((Unit!31838 0))(
  ( (Unit!31839) )
))
(declare-fun lt!426055 () Unit!31838)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57159 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!31838)

(assert (=> b!945548 (= lt!426055 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10579 thiss!1141) (mask!27370 thiss!1141) #b00000000000000000000000000000000 lt!426056))))

(declare-fun arrayScanForKey!0 (array!57159 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!945548 (= lt!426056 (arrayScanForKey!0 (_keys!10579 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57159 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!945548 (arrayContainsKey!0 (_keys!10579 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!426058 () Unit!31838)

(declare-fun lemmaKeyInListMapIsInArray!310 (array!57159 array!57157 (_ BitVec 32) (_ BitVec 32) V!32391 V!32391 (_ BitVec 64) Int) Unit!31838)

(assert (=> b!945548 (= lt!426058 (lemmaKeyInListMapIsInArray!310 (_keys!10579 thiss!1141) (_values!5696 thiss!1141) (mask!27370 thiss!1141) (extraKeys!5405 thiss!1141) (zeroValue!5509 thiss!1141) (minValue!5509 thiss!1141) key!756 (defaultEntry!5673 thiss!1141)))))

(declare-fun mapNonEmpty!32679 () Bool)

(declare-fun tp!62693 () Bool)

(assert (=> mapNonEmpty!32679 (= mapRes!32679 (and tp!62693 e!531800))))

(declare-fun mapValue!32679 () ValueCell!9803)

(declare-fun mapRest!32679 () (Array (_ BitVec 32) ValueCell!9803))

(declare-fun mapKey!32679 () (_ BitVec 32))

(assert (=> mapNonEmpty!32679 (= (arr!27499 (_values!5696 thiss!1141)) (store mapRest!32679 mapKey!32679 mapValue!32679))))

(declare-fun b!945549 () Bool)

(declare-fun res!634925 () Bool)

(assert (=> b!945549 (=> res!634925 e!531802)))

(assert (=> b!945549 (= res!634925 (not (= (size!27967 (_keys!10579 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27370 thiss!1141)))))))

(assert (= (and start!80586 res!634928) b!945547))

(assert (= (and b!945547 res!634930) b!945539))

(assert (= (and b!945539 res!634924) b!945545))

(assert (= (and b!945545 res!634931) b!945548))

(assert (= (and b!945548 (not res!634927)) b!945549))

(assert (= (and b!945549 (not res!634925)) b!945541))

(assert (= (and b!945541 (not res!634929)) b!945538))

(assert (= (and b!945538 (not res!634926)) b!945544))

(assert (= (and b!945546 condMapEmpty!32679) mapIsEmpty!32679))

(assert (= (and b!945546 (not condMapEmpty!32679)) mapNonEmpty!32679))

(assert (= (and mapNonEmpty!32679 ((_ is ValueCellFull!9803) mapValue!32679)) b!945542))

(assert (= (and b!945546 ((_ is ValueCellFull!9803) mapDefault!32679)) b!945540))

(assert (= b!945543 b!945546))

(assert (= start!80586 b!945543))

(declare-fun m!879907 () Bool)

(assert (=> b!945543 m!879907))

(declare-fun m!879909 () Bool)

(assert (=> b!945543 m!879909))

(declare-fun m!879911 () Bool)

(assert (=> b!945545 m!879911))

(assert (=> b!945545 m!879911))

(declare-fun m!879913 () Bool)

(assert (=> b!945545 m!879913))

(declare-fun m!879915 () Bool)

(assert (=> b!945544 m!879915))

(declare-fun m!879917 () Bool)

(assert (=> b!945539 m!879917))

(declare-fun m!879919 () Bool)

(assert (=> b!945548 m!879919))

(declare-fun m!879921 () Bool)

(assert (=> b!945548 m!879921))

(declare-fun m!879923 () Bool)

(assert (=> b!945548 m!879923))

(declare-fun m!879925 () Bool)

(assert (=> b!945548 m!879925))

(declare-fun m!879927 () Bool)

(assert (=> b!945548 m!879927))

(declare-fun m!879929 () Bool)

(assert (=> b!945548 m!879929))

(declare-fun m!879931 () Bool)

(assert (=> b!945541 m!879931))

(declare-fun m!879933 () Bool)

(assert (=> mapNonEmpty!32679 m!879933))

(declare-fun m!879935 () Bool)

(assert (=> start!80586 m!879935))

(declare-fun m!879937 () Bool)

(assert (=> b!945538 m!879937))

(check-sat (not mapNonEmpty!32679) (not b!945538) (not start!80586) (not b!945548) (not b!945539) tp_is_empty!20569 (not b!945545) (not b!945544) (not b_next!18061) b_and!29489 (not b!945541) (not b!945543))
(check-sat b_and!29489 (not b_next!18061))

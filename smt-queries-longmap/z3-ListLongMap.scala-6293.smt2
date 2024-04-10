; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80438 () Bool)

(assert start!80438)

(declare-fun b!944988 () Bool)

(declare-fun b_free!18081 () Bool)

(declare-fun b_next!18081 () Bool)

(assert (=> b!944988 (= b_free!18081 (not b_next!18081))))

(declare-fun tp!62753 () Bool)

(declare-fun b_and!29499 () Bool)

(assert (=> b!944988 (= tp!62753 b_and!29499)))

(declare-fun res!634796 () Bool)

(declare-fun e!531428 () Bool)

(assert (=> start!80438 (=> (not res!634796) (not e!531428))))

(declare-datatypes ((V!32417 0))(
  ( (V!32418 (val!10345 Int)) )
))
(declare-datatypes ((ValueCell!9813 0))(
  ( (ValueCellFull!9813 (v!12877 V!32417)) (EmptyCell!9813) )
))
(declare-datatypes ((array!57146 0))(
  ( (array!57147 (arr!27498 (Array (_ BitVec 32) ValueCell!9813)) (size!27964 (_ BitVec 32))) )
))
(declare-datatypes ((array!57148 0))(
  ( (array!57149 (arr!27499 (Array (_ BitVec 32) (_ BitVec 64))) (size!27965 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4776 0))(
  ( (LongMapFixedSize!4777 (defaultEntry!5683 Int) (mask!27343 (_ BitVec 32)) (extraKeys!5415 (_ BitVec 32)) (zeroValue!5519 V!32417) (minValue!5519 V!32417) (_size!2443 (_ BitVec 32)) (_keys!10561 array!57148) (_values!5706 array!57146) (_vacant!2443 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4776)

(declare-fun valid!1826 (LongMapFixedSize!4776) Bool)

(assert (=> start!80438 (= res!634796 (valid!1826 thiss!1141))))

(assert (=> start!80438 e!531428))

(declare-fun e!531432 () Bool)

(assert (=> start!80438 e!531432))

(assert (=> start!80438 true))

(declare-fun b!944980 () Bool)

(assert (=> b!944980 (= e!531428 false)))

(declare-datatypes ((Unit!31878 0))(
  ( (Unit!31879) )
))
(declare-fun lt!425821 () Unit!31878)

(declare-fun e!531427 () Unit!31878)

(assert (=> b!944980 (= lt!425821 e!531427)))

(declare-fun c!98339 () Bool)

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13502 0))(
  ( (tuple2!13503 (_1!6762 (_ BitVec 64)) (_2!6762 V!32417)) )
))
(declare-datatypes ((List!19285 0))(
  ( (Nil!19282) (Cons!19281 (h!20432 tuple2!13502) (t!27602 List!19285)) )
))
(declare-datatypes ((ListLongMap!12199 0))(
  ( (ListLongMap!12200 (toList!6115 List!19285)) )
))
(declare-fun contains!5187 (ListLongMap!12199 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3349 (array!57148 array!57146 (_ BitVec 32) (_ BitVec 32) V!32417 V!32417 (_ BitVec 32) Int) ListLongMap!12199)

(assert (=> b!944980 (= c!98339 (contains!5187 (getCurrentListMap!3349 (_keys!10561 thiss!1141) (_values!5706 thiss!1141) (mask!27343 thiss!1141) (extraKeys!5415 thiss!1141) (zeroValue!5519 thiss!1141) (minValue!5519 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5683 thiss!1141)) key!756))))

(declare-fun b!944981 () Bool)

(declare-fun Unit!31880 () Unit!31878)

(assert (=> b!944981 (= e!531427 Unit!31880)))

(declare-fun b!944982 () Bool)

(declare-fun res!634797 () Bool)

(assert (=> b!944982 (=> (not res!634797) (not e!531428))))

(assert (=> b!944982 (= res!634797 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!944983 () Bool)

(declare-fun res!634795 () Bool)

(assert (=> b!944983 (=> (not res!634795) (not e!531428))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9082 0))(
  ( (MissingZero!9082 (index!38699 (_ BitVec 32))) (Found!9082 (index!38700 (_ BitVec 32))) (Intermediate!9082 (undefined!9894 Bool) (index!38701 (_ BitVec 32)) (x!81173 (_ BitVec 32))) (Undefined!9082) (MissingVacant!9082 (index!38702 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57148 (_ BitVec 32)) SeekEntryResult!9082)

(assert (=> b!944983 (= res!634795 (not ((_ is Found!9082) (seekEntry!0 key!756 (_keys!10561 thiss!1141) (mask!27343 thiss!1141)))))))

(declare-fun b!944984 () Bool)

(declare-fun Unit!31881 () Unit!31878)

(assert (=> b!944984 (= e!531427 Unit!31881)))

(declare-fun lt!425820 () Unit!31878)

(declare-fun lemmaKeyInListMapIsInArray!318 (array!57148 array!57146 (_ BitVec 32) (_ BitVec 32) V!32417 V!32417 (_ BitVec 64) Int) Unit!31878)

(assert (=> b!944984 (= lt!425820 (lemmaKeyInListMapIsInArray!318 (_keys!10561 thiss!1141) (_values!5706 thiss!1141) (mask!27343 thiss!1141) (extraKeys!5415 thiss!1141) (zeroValue!5519 thiss!1141) (minValue!5519 thiss!1141) key!756 (defaultEntry!5683 thiss!1141)))))

(declare-fun arrayContainsKey!0 (array!57148 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!944984 (arrayContainsKey!0 (_keys!10561 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!425822 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!57148 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!944984 (= lt!425822 (arrayScanForKey!0 (_keys!10561 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun lt!425823 () Unit!31878)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57148 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!31878)

(assert (=> b!944984 (= lt!425823 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10561 thiss!1141) (mask!27343 thiss!1141) #b00000000000000000000000000000000 lt!425822))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57148 (_ BitVec 32)) Bool)

(assert (=> b!944984 (arrayForallSeekEntryOrOpenFound!0 lt!425822 (_keys!10561 thiss!1141) (mask!27343 thiss!1141))))

(declare-fun lt!425819 () Unit!31878)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!57148 (_ BitVec 32)) Unit!31878)

(assert (=> b!944984 (= lt!425819 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!756 lt!425822 (_keys!10561 thiss!1141) (mask!27343 thiss!1141)))))

(assert (=> b!944984 false))

(declare-fun b!944985 () Bool)

(declare-fun e!531429 () Bool)

(declare-fun e!531430 () Bool)

(declare-fun mapRes!32709 () Bool)

(assert (=> b!944985 (= e!531429 (and e!531430 mapRes!32709))))

(declare-fun condMapEmpty!32709 () Bool)

(declare-fun mapDefault!32709 () ValueCell!9813)

(assert (=> b!944985 (= condMapEmpty!32709 (= (arr!27498 (_values!5706 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9813)) mapDefault!32709)))))

(declare-fun b!944986 () Bool)

(declare-fun tp_is_empty!20589 () Bool)

(assert (=> b!944986 (= e!531430 tp_is_empty!20589)))

(declare-fun mapNonEmpty!32709 () Bool)

(declare-fun tp!62752 () Bool)

(declare-fun e!531433 () Bool)

(assert (=> mapNonEmpty!32709 (= mapRes!32709 (and tp!62752 e!531433))))

(declare-fun mapKey!32709 () (_ BitVec 32))

(declare-fun mapRest!32709 () (Array (_ BitVec 32) ValueCell!9813))

(declare-fun mapValue!32709 () ValueCell!9813)

(assert (=> mapNonEmpty!32709 (= (arr!27498 (_values!5706 thiss!1141)) (store mapRest!32709 mapKey!32709 mapValue!32709))))

(declare-fun b!944987 () Bool)

(assert (=> b!944987 (= e!531433 tp_is_empty!20589)))

(declare-fun mapIsEmpty!32709 () Bool)

(assert (=> mapIsEmpty!32709 mapRes!32709))

(declare-fun array_inv!21364 (array!57148) Bool)

(declare-fun array_inv!21365 (array!57146) Bool)

(assert (=> b!944988 (= e!531432 (and tp!62753 tp_is_empty!20589 (array_inv!21364 (_keys!10561 thiss!1141)) (array_inv!21365 (_values!5706 thiss!1141)) e!531429))))

(assert (= (and start!80438 res!634796) b!944982))

(assert (= (and b!944982 res!634797) b!944983))

(assert (= (and b!944983 res!634795) b!944980))

(assert (= (and b!944980 c!98339) b!944984))

(assert (= (and b!944980 (not c!98339)) b!944981))

(assert (= (and b!944985 condMapEmpty!32709) mapIsEmpty!32709))

(assert (= (and b!944985 (not condMapEmpty!32709)) mapNonEmpty!32709))

(assert (= (and mapNonEmpty!32709 ((_ is ValueCellFull!9813) mapValue!32709)) b!944987))

(assert (= (and b!944985 ((_ is ValueCellFull!9813) mapDefault!32709)) b!944986))

(assert (= b!944988 b!944985))

(assert (= start!80438 b!944988))

(declare-fun m!878927 () Bool)

(assert (=> start!80438 m!878927))

(declare-fun m!878929 () Bool)

(assert (=> b!944983 m!878929))

(declare-fun m!878931 () Bool)

(assert (=> b!944980 m!878931))

(assert (=> b!944980 m!878931))

(declare-fun m!878933 () Bool)

(assert (=> b!944980 m!878933))

(declare-fun m!878935 () Bool)

(assert (=> mapNonEmpty!32709 m!878935))

(declare-fun m!878937 () Bool)

(assert (=> b!944984 m!878937))

(declare-fun m!878939 () Bool)

(assert (=> b!944984 m!878939))

(declare-fun m!878941 () Bool)

(assert (=> b!944984 m!878941))

(declare-fun m!878943 () Bool)

(assert (=> b!944984 m!878943))

(declare-fun m!878945 () Bool)

(assert (=> b!944984 m!878945))

(declare-fun m!878947 () Bool)

(assert (=> b!944984 m!878947))

(declare-fun m!878949 () Bool)

(assert (=> b!944988 m!878949))

(declare-fun m!878951 () Bool)

(assert (=> b!944988 m!878951))

(check-sat b_and!29499 (not b!944984) (not start!80438) tp_is_empty!20589 (not b_next!18081) (not mapNonEmpty!32709) (not b!944988) (not b!944980) (not b!944983))
(check-sat b_and!29499 (not b_next!18081))

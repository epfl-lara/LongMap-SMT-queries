; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80958 () Bool)

(assert start!80958)

(declare-fun b!948052 () Bool)

(declare-fun b_free!18163 () Bool)

(declare-fun b_next!18163 () Bool)

(assert (=> b!948052 (= b_free!18163 (not b_next!18163))))

(declare-fun tp!63046 () Bool)

(declare-fun b_and!29595 () Bool)

(assert (=> b!948052 (= tp!63046 b_and!29595)))

(declare-fun mapIsEmpty!32878 () Bool)

(declare-fun mapRes!32878 () Bool)

(assert (=> mapIsEmpty!32878 mapRes!32878))

(declare-fun b!948049 () Bool)

(declare-fun e!533626 () Bool)

(declare-fun e!533631 () Bool)

(assert (=> b!948049 (= e!533626 (not e!533631))))

(declare-fun res!636031 () Bool)

(assert (=> b!948049 (=> res!636031 e!533631)))

(declare-datatypes ((V!32527 0))(
  ( (V!32528 (val!10386 Int)) )
))
(declare-datatypes ((ValueCell!9854 0))(
  ( (ValueCellFull!9854 (v!12917 V!32527)) (EmptyCell!9854) )
))
(declare-datatypes ((array!57387 0))(
  ( (array!57388 (arr!27601 (Array (_ BitVec 32) ValueCell!9854)) (size!28075 (_ BitVec 32))) )
))
(declare-datatypes ((array!57389 0))(
  ( (array!57390 (arr!27602 (Array (_ BitVec 32) (_ BitVec 64))) (size!28076 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4858 0))(
  ( (LongMapFixedSize!4859 (defaultEntry!5726 Int) (mask!27499 (_ BitVec 32)) (extraKeys!5458 (_ BitVec 32)) (zeroValue!5562 V!32527) (minValue!5562 V!32527) (_size!2484 (_ BitVec 32)) (_keys!10661 array!57389) (_values!5749 array!57387) (_vacant!2484 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4858)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!948049 (= res!636031 (not (validMask!0 (mask!27499 thiss!1141))))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!57389 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!948049 (arrayContainsKey!0 (_keys!10661 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31903 0))(
  ( (Unit!31904) )
))
(declare-fun lt!426864 () Unit!31903)

(declare-datatypes ((SeekEntryResult!9073 0))(
  ( (MissingZero!9073 (index!38663 (_ BitVec 32))) (Found!9073 (index!38664 (_ BitVec 32))) (Intermediate!9073 (undefined!9885 Bool) (index!38665 (_ BitVec 32)) (x!81455 (_ BitVec 32))) (Undefined!9073) (MissingVacant!9073 (index!38666 (_ BitVec 32))) )
))
(declare-fun lt!426865 () SeekEntryResult!9073)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57389 (_ BitVec 64) (_ BitVec 32)) Unit!31903)

(assert (=> b!948049 (= lt!426864 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10661 thiss!1141) key!756 (index!38664 lt!426865)))))

(declare-fun mapNonEmpty!32878 () Bool)

(declare-fun tp!63045 () Bool)

(declare-fun e!533628 () Bool)

(assert (=> mapNonEmpty!32878 (= mapRes!32878 (and tp!63045 e!533628))))

(declare-fun mapRest!32878 () (Array (_ BitVec 32) ValueCell!9854))

(declare-fun mapValue!32878 () ValueCell!9854)

(declare-fun mapKey!32878 () (_ BitVec 32))

(assert (=> mapNonEmpty!32878 (= (arr!27601 (_values!5749 thiss!1141)) (store mapRest!32878 mapKey!32878 mapValue!32878))))

(declare-fun b!948051 () Bool)

(declare-fun res!636030 () Bool)

(assert (=> b!948051 (=> res!636030 e!533631)))

(assert (=> b!948051 (= res!636030 (or (not (= (size!28075 (_values!5749 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27499 thiss!1141)))) (not (= (size!28076 (_keys!10661 thiss!1141)) (size!28075 (_values!5749 thiss!1141)))) (bvslt (mask!27499 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5458 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5458 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun tp_is_empty!20671 () Bool)

(declare-fun e!533627 () Bool)

(declare-fun e!533632 () Bool)

(declare-fun array_inv!21516 (array!57389) Bool)

(declare-fun array_inv!21517 (array!57387) Bool)

(assert (=> b!948052 (= e!533632 (and tp!63046 tp_is_empty!20671 (array_inv!21516 (_keys!10661 thiss!1141)) (array_inv!21517 (_values!5749 thiss!1141)) e!533627))))

(declare-fun b!948053 () Bool)

(declare-fun e!533629 () Bool)

(assert (=> b!948053 (= e!533629 e!533626)))

(declare-fun res!636032 () Bool)

(assert (=> b!948053 (=> (not res!636032) (not e!533626))))

(get-info :version)

(assert (=> b!948053 (= res!636032 ((_ is Found!9073) lt!426865))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57389 (_ BitVec 32)) SeekEntryResult!9073)

(assert (=> b!948053 (= lt!426865 (seekEntry!0 key!756 (_keys!10661 thiss!1141) (mask!27499 thiss!1141)))))

(declare-fun res!636033 () Bool)

(assert (=> start!80958 (=> (not res!636033) (not e!533629))))

(declare-fun valid!1862 (LongMapFixedSize!4858) Bool)

(assert (=> start!80958 (= res!636033 (valid!1862 thiss!1141))))

(assert (=> start!80958 e!533629))

(assert (=> start!80958 e!533632))

(assert (=> start!80958 true))

(declare-fun b!948050 () Bool)

(assert (=> b!948050 (= e!533628 tp_is_empty!20671)))

(declare-fun b!948054 () Bool)

(declare-fun e!533633 () Bool)

(assert (=> b!948054 (= e!533633 tp_is_empty!20671)))

(declare-fun b!948055 () Bool)

(declare-fun res!636028 () Bool)

(assert (=> b!948055 (=> res!636028 e!533631)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57389 (_ BitVec 32)) Bool)

(assert (=> b!948055 (= res!636028 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10661 thiss!1141) (mask!27499 thiss!1141))))))

(declare-fun b!948056 () Bool)

(declare-datatypes ((List!19287 0))(
  ( (Nil!19284) (Cons!19283 (h!20445 (_ BitVec 64)) (t!27600 List!19287)) )
))
(declare-fun arrayNoDuplicates!0 (array!57389 (_ BitVec 32) List!19287) Bool)

(assert (=> b!948056 (= e!533631 (arrayNoDuplicates!0 (_keys!10661 thiss!1141) #b00000000000000000000000000000000 Nil!19284))))

(declare-fun b!948057 () Bool)

(assert (=> b!948057 (= e!533627 (and e!533633 mapRes!32878))))

(declare-fun condMapEmpty!32878 () Bool)

(declare-fun mapDefault!32878 () ValueCell!9854)

(assert (=> b!948057 (= condMapEmpty!32878 (= (arr!27601 (_values!5749 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9854)) mapDefault!32878)))))

(declare-fun b!948058 () Bool)

(declare-fun res!636029 () Bool)

(assert (=> b!948058 (=> (not res!636029) (not e!533629))))

(assert (=> b!948058 (= res!636029 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!80958 res!636033) b!948058))

(assert (= (and b!948058 res!636029) b!948053))

(assert (= (and b!948053 res!636032) b!948049))

(assert (= (and b!948049 (not res!636031)) b!948051))

(assert (= (and b!948051 (not res!636030)) b!948055))

(assert (= (and b!948055 (not res!636028)) b!948056))

(assert (= (and b!948057 condMapEmpty!32878) mapIsEmpty!32878))

(assert (= (and b!948057 (not condMapEmpty!32878)) mapNonEmpty!32878))

(assert (= (and mapNonEmpty!32878 ((_ is ValueCellFull!9854) mapValue!32878)) b!948050))

(assert (= (and b!948057 ((_ is ValueCellFull!9854) mapDefault!32878)) b!948054))

(assert (= b!948052 b!948057))

(assert (= start!80958 b!948052))

(declare-fun m!881509 () Bool)

(assert (=> b!948052 m!881509))

(declare-fun m!881511 () Bool)

(assert (=> b!948052 m!881511))

(declare-fun m!881513 () Bool)

(assert (=> b!948055 m!881513))

(declare-fun m!881515 () Bool)

(assert (=> b!948049 m!881515))

(declare-fun m!881517 () Bool)

(assert (=> b!948049 m!881517))

(declare-fun m!881519 () Bool)

(assert (=> b!948049 m!881519))

(declare-fun m!881521 () Bool)

(assert (=> b!948053 m!881521))

(declare-fun m!881523 () Bool)

(assert (=> b!948056 m!881523))

(declare-fun m!881525 () Bool)

(assert (=> start!80958 m!881525))

(declare-fun m!881527 () Bool)

(assert (=> mapNonEmpty!32878 m!881527))

(check-sat b_and!29595 tp_is_empty!20671 (not b!948052) (not b!948053) (not b!948049) (not b!948055) (not b!948056) (not start!80958) (not b_next!18163) (not mapNonEmpty!32878))
(check-sat b_and!29595 (not b_next!18163))
(get-model)

(declare-fun d!114971 () Bool)

(declare-fun res!636078 () Bool)

(declare-fun e!533692 () Bool)

(assert (=> d!114971 (=> res!636078 e!533692)))

(assert (=> d!114971 (= res!636078 (bvsge #b00000000000000000000000000000000 (size!28076 (_keys!10661 thiss!1141))))))

(assert (=> d!114971 (= (arrayNoDuplicates!0 (_keys!10661 thiss!1141) #b00000000000000000000000000000000 Nil!19284) e!533692)))

(declare-fun b!948129 () Bool)

(declare-fun e!533690 () Bool)

(assert (=> b!948129 (= e!533692 e!533690)))

(declare-fun res!636077 () Bool)

(assert (=> b!948129 (=> (not res!636077) (not e!533690))))

(declare-fun e!533693 () Bool)

(assert (=> b!948129 (= res!636077 (not e!533693))))

(declare-fun res!636076 () Bool)

(assert (=> b!948129 (=> (not res!636076) (not e!533693))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!948129 (= res!636076 (validKeyInArray!0 (select (arr!27602 (_keys!10661 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41151 () Bool)

(declare-fun call!41154 () Bool)

(declare-fun c!98957 () Bool)

(assert (=> bm!41151 (= call!41154 (arrayNoDuplicates!0 (_keys!10661 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98957 (Cons!19283 (select (arr!27602 (_keys!10661 thiss!1141)) #b00000000000000000000000000000000) Nil!19284) Nil!19284)))))

(declare-fun b!948130 () Bool)

(declare-fun e!533691 () Bool)

(assert (=> b!948130 (= e!533690 e!533691)))

(assert (=> b!948130 (= c!98957 (validKeyInArray!0 (select (arr!27602 (_keys!10661 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!948131 () Bool)

(assert (=> b!948131 (= e!533691 call!41154)))

(declare-fun b!948132 () Bool)

(declare-fun contains!5200 (List!19287 (_ BitVec 64)) Bool)

(assert (=> b!948132 (= e!533693 (contains!5200 Nil!19284 (select (arr!27602 (_keys!10661 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!948133 () Bool)

(assert (=> b!948133 (= e!533691 call!41154)))

(assert (= (and d!114971 (not res!636078)) b!948129))

(assert (= (and b!948129 res!636076) b!948132))

(assert (= (and b!948129 res!636077) b!948130))

(assert (= (and b!948130 c!98957) b!948133))

(assert (= (and b!948130 (not c!98957)) b!948131))

(assert (= (or b!948133 b!948131) bm!41151))

(declare-fun m!881569 () Bool)

(assert (=> b!948129 m!881569))

(assert (=> b!948129 m!881569))

(declare-fun m!881571 () Bool)

(assert (=> b!948129 m!881571))

(assert (=> bm!41151 m!881569))

(declare-fun m!881573 () Bool)

(assert (=> bm!41151 m!881573))

(assert (=> b!948130 m!881569))

(assert (=> b!948130 m!881569))

(assert (=> b!948130 m!881571))

(assert (=> b!948132 m!881569))

(assert (=> b!948132 m!881569))

(declare-fun m!881575 () Bool)

(assert (=> b!948132 m!881575))

(assert (=> b!948056 d!114971))

(declare-fun d!114973 () Bool)

(assert (=> d!114973 (= (array_inv!21516 (_keys!10661 thiss!1141)) (bvsge (size!28076 (_keys!10661 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!948052 d!114973))

(declare-fun d!114975 () Bool)

(assert (=> d!114975 (= (array_inv!21517 (_values!5749 thiss!1141)) (bvsge (size!28075 (_values!5749 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!948052 d!114975))

(declare-fun d!114977 () Bool)

(assert (=> d!114977 (= (validMask!0 (mask!27499 thiss!1141)) (and (or (= (mask!27499 thiss!1141) #b00000000000000000000000000000111) (= (mask!27499 thiss!1141) #b00000000000000000000000000001111) (= (mask!27499 thiss!1141) #b00000000000000000000000000011111) (= (mask!27499 thiss!1141) #b00000000000000000000000000111111) (= (mask!27499 thiss!1141) #b00000000000000000000000001111111) (= (mask!27499 thiss!1141) #b00000000000000000000000011111111) (= (mask!27499 thiss!1141) #b00000000000000000000000111111111) (= (mask!27499 thiss!1141) #b00000000000000000000001111111111) (= (mask!27499 thiss!1141) #b00000000000000000000011111111111) (= (mask!27499 thiss!1141) #b00000000000000000000111111111111) (= (mask!27499 thiss!1141) #b00000000000000000001111111111111) (= (mask!27499 thiss!1141) #b00000000000000000011111111111111) (= (mask!27499 thiss!1141) #b00000000000000000111111111111111) (= (mask!27499 thiss!1141) #b00000000000000001111111111111111) (= (mask!27499 thiss!1141) #b00000000000000011111111111111111) (= (mask!27499 thiss!1141) #b00000000000000111111111111111111) (= (mask!27499 thiss!1141) #b00000000000001111111111111111111) (= (mask!27499 thiss!1141) #b00000000000011111111111111111111) (= (mask!27499 thiss!1141) #b00000000000111111111111111111111) (= (mask!27499 thiss!1141) #b00000000001111111111111111111111) (= (mask!27499 thiss!1141) #b00000000011111111111111111111111) (= (mask!27499 thiss!1141) #b00000000111111111111111111111111) (= (mask!27499 thiss!1141) #b00000001111111111111111111111111) (= (mask!27499 thiss!1141) #b00000011111111111111111111111111) (= (mask!27499 thiss!1141) #b00000111111111111111111111111111) (= (mask!27499 thiss!1141) #b00001111111111111111111111111111) (= (mask!27499 thiss!1141) #b00011111111111111111111111111111) (= (mask!27499 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27499 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!948049 d!114977))

(declare-fun d!114979 () Bool)

(declare-fun res!636083 () Bool)

(declare-fun e!533698 () Bool)

(assert (=> d!114979 (=> res!636083 e!533698)))

(assert (=> d!114979 (= res!636083 (= (select (arr!27602 (_keys!10661 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!114979 (= (arrayContainsKey!0 (_keys!10661 thiss!1141) key!756 #b00000000000000000000000000000000) e!533698)))

(declare-fun b!948138 () Bool)

(declare-fun e!533699 () Bool)

(assert (=> b!948138 (= e!533698 e!533699)))

(declare-fun res!636084 () Bool)

(assert (=> b!948138 (=> (not res!636084) (not e!533699))))

(assert (=> b!948138 (= res!636084 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28076 (_keys!10661 thiss!1141))))))

(declare-fun b!948139 () Bool)

(assert (=> b!948139 (= e!533699 (arrayContainsKey!0 (_keys!10661 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!114979 (not res!636083)) b!948138))

(assert (= (and b!948138 res!636084) b!948139))

(assert (=> d!114979 m!881569))

(declare-fun m!881577 () Bool)

(assert (=> b!948139 m!881577))

(assert (=> b!948049 d!114979))

(declare-fun d!114981 () Bool)

(assert (=> d!114981 (arrayContainsKey!0 (_keys!10661 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!426880 () Unit!31903)

(declare-fun choose!13 (array!57389 (_ BitVec 64) (_ BitVec 32)) Unit!31903)

(assert (=> d!114981 (= lt!426880 (choose!13 (_keys!10661 thiss!1141) key!756 (index!38664 lt!426865)))))

(assert (=> d!114981 (bvsge (index!38664 lt!426865) #b00000000000000000000000000000000)))

(assert (=> d!114981 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10661 thiss!1141) key!756 (index!38664 lt!426865)) lt!426880)))

(declare-fun bs!26637 () Bool)

(assert (= bs!26637 d!114981))

(assert (=> bs!26637 m!881517))

(declare-fun m!881579 () Bool)

(assert (=> bs!26637 m!881579))

(assert (=> b!948049 d!114981))

(declare-fun b!948152 () Bool)

(declare-fun e!533707 () SeekEntryResult!9073)

(declare-fun lt!426891 () SeekEntryResult!9073)

(assert (=> b!948152 (= e!533707 (MissingZero!9073 (index!38665 lt!426891)))))

(declare-fun b!948153 () Bool)

(declare-fun e!533708 () SeekEntryResult!9073)

(assert (=> b!948153 (= e!533708 Undefined!9073)))

(declare-fun b!948154 () Bool)

(declare-fun lt!426889 () SeekEntryResult!9073)

(assert (=> b!948154 (= e!533707 (ite ((_ is MissingVacant!9073) lt!426889) (MissingZero!9073 (index!38666 lt!426889)) lt!426889))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57389 (_ BitVec 32)) SeekEntryResult!9073)

(assert (=> b!948154 (= lt!426889 (seekKeyOrZeroReturnVacant!0 (x!81455 lt!426891) (index!38665 lt!426891) (index!38665 lt!426891) key!756 (_keys!10661 thiss!1141) (mask!27499 thiss!1141)))))

(declare-fun b!948155 () Bool)

(declare-fun c!98964 () Bool)

(declare-fun lt!426890 () (_ BitVec 64))

(assert (=> b!948155 (= c!98964 (= lt!426890 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!533706 () SeekEntryResult!9073)

(assert (=> b!948155 (= e!533706 e!533707)))

(declare-fun b!948157 () Bool)

(assert (=> b!948157 (= e!533708 e!533706)))

(assert (=> b!948157 (= lt!426890 (select (arr!27602 (_keys!10661 thiss!1141)) (index!38665 lt!426891)))))

(declare-fun c!98965 () Bool)

(assert (=> b!948157 (= c!98965 (= lt!426890 key!756))))

(declare-fun b!948156 () Bool)

(assert (=> b!948156 (= e!533706 (Found!9073 (index!38665 lt!426891)))))

(declare-fun d!114983 () Bool)

(declare-fun lt!426892 () SeekEntryResult!9073)

(assert (=> d!114983 (and (or ((_ is MissingVacant!9073) lt!426892) (not ((_ is Found!9073) lt!426892)) (and (bvsge (index!38664 lt!426892) #b00000000000000000000000000000000) (bvslt (index!38664 lt!426892) (size!28076 (_keys!10661 thiss!1141))))) (not ((_ is MissingVacant!9073) lt!426892)) (or (not ((_ is Found!9073) lt!426892)) (= (select (arr!27602 (_keys!10661 thiss!1141)) (index!38664 lt!426892)) key!756)))))

(assert (=> d!114983 (= lt!426892 e!533708)))

(declare-fun c!98966 () Bool)

(assert (=> d!114983 (= c!98966 (and ((_ is Intermediate!9073) lt!426891) (undefined!9885 lt!426891)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57389 (_ BitVec 32)) SeekEntryResult!9073)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114983 (= lt!426891 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27499 thiss!1141)) key!756 (_keys!10661 thiss!1141) (mask!27499 thiss!1141)))))

(assert (=> d!114983 (validMask!0 (mask!27499 thiss!1141))))

(assert (=> d!114983 (= (seekEntry!0 key!756 (_keys!10661 thiss!1141) (mask!27499 thiss!1141)) lt!426892)))

(assert (= (and d!114983 c!98966) b!948153))

(assert (= (and d!114983 (not c!98966)) b!948157))

(assert (= (and b!948157 c!98965) b!948156))

(assert (= (and b!948157 (not c!98965)) b!948155))

(assert (= (and b!948155 c!98964) b!948152))

(assert (= (and b!948155 (not c!98964)) b!948154))

(declare-fun m!881581 () Bool)

(assert (=> b!948154 m!881581))

(declare-fun m!881583 () Bool)

(assert (=> b!948157 m!881583))

(declare-fun m!881585 () Bool)

(assert (=> d!114983 m!881585))

(declare-fun m!881587 () Bool)

(assert (=> d!114983 m!881587))

(assert (=> d!114983 m!881587))

(declare-fun m!881589 () Bool)

(assert (=> d!114983 m!881589))

(assert (=> d!114983 m!881515))

(assert (=> b!948053 d!114983))

(declare-fun d!114985 () Bool)

(declare-fun res!636091 () Bool)

(declare-fun e!533711 () Bool)

(assert (=> d!114985 (=> (not res!636091) (not e!533711))))

(declare-fun simpleValid!362 (LongMapFixedSize!4858) Bool)

(assert (=> d!114985 (= res!636091 (simpleValid!362 thiss!1141))))

(assert (=> d!114985 (= (valid!1862 thiss!1141) e!533711)))

(declare-fun b!948164 () Bool)

(declare-fun res!636092 () Bool)

(assert (=> b!948164 (=> (not res!636092) (not e!533711))))

(declare-fun arrayCountValidKeys!0 (array!57389 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!948164 (= res!636092 (= (arrayCountValidKeys!0 (_keys!10661 thiss!1141) #b00000000000000000000000000000000 (size!28076 (_keys!10661 thiss!1141))) (_size!2484 thiss!1141)))))

(declare-fun b!948165 () Bool)

(declare-fun res!636093 () Bool)

(assert (=> b!948165 (=> (not res!636093) (not e!533711))))

(assert (=> b!948165 (= res!636093 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10661 thiss!1141) (mask!27499 thiss!1141)))))

(declare-fun b!948166 () Bool)

(assert (=> b!948166 (= e!533711 (arrayNoDuplicates!0 (_keys!10661 thiss!1141) #b00000000000000000000000000000000 Nil!19284))))

(assert (= (and d!114985 res!636091) b!948164))

(assert (= (and b!948164 res!636092) b!948165))

(assert (= (and b!948165 res!636093) b!948166))

(declare-fun m!881591 () Bool)

(assert (=> d!114985 m!881591))

(declare-fun m!881593 () Bool)

(assert (=> b!948164 m!881593))

(assert (=> b!948165 m!881513))

(assert (=> b!948166 m!881523))

(assert (=> start!80958 d!114985))

(declare-fun d!114987 () Bool)

(declare-fun res!636099 () Bool)

(declare-fun e!533719 () Bool)

(assert (=> d!114987 (=> res!636099 e!533719)))

(assert (=> d!114987 (= res!636099 (bvsge #b00000000000000000000000000000000 (size!28076 (_keys!10661 thiss!1141))))))

(assert (=> d!114987 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10661 thiss!1141) (mask!27499 thiss!1141)) e!533719)))

(declare-fun b!948175 () Bool)

(declare-fun e!533718 () Bool)

(declare-fun call!41157 () Bool)

(assert (=> b!948175 (= e!533718 call!41157)))

(declare-fun b!948176 () Bool)

(declare-fun e!533720 () Bool)

(assert (=> b!948176 (= e!533720 e!533718)))

(declare-fun lt!426900 () (_ BitVec 64))

(assert (=> b!948176 (= lt!426900 (select (arr!27602 (_keys!10661 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426901 () Unit!31903)

(assert (=> b!948176 (= lt!426901 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10661 thiss!1141) lt!426900 #b00000000000000000000000000000000))))

(assert (=> b!948176 (arrayContainsKey!0 (_keys!10661 thiss!1141) lt!426900 #b00000000000000000000000000000000)))

(declare-fun lt!426899 () Unit!31903)

(assert (=> b!948176 (= lt!426899 lt!426901)))

(declare-fun res!636098 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57389 (_ BitVec 32)) SeekEntryResult!9073)

(assert (=> b!948176 (= res!636098 (= (seekEntryOrOpen!0 (select (arr!27602 (_keys!10661 thiss!1141)) #b00000000000000000000000000000000) (_keys!10661 thiss!1141) (mask!27499 thiss!1141)) (Found!9073 #b00000000000000000000000000000000)))))

(assert (=> b!948176 (=> (not res!636098) (not e!533718))))

(declare-fun b!948177 () Bool)

(assert (=> b!948177 (= e!533720 call!41157)))

(declare-fun bm!41154 () Bool)

(assert (=> bm!41154 (= call!41157 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10661 thiss!1141) (mask!27499 thiss!1141)))))

(declare-fun b!948178 () Bool)

(assert (=> b!948178 (= e!533719 e!533720)))

(declare-fun c!98969 () Bool)

(assert (=> b!948178 (= c!98969 (validKeyInArray!0 (select (arr!27602 (_keys!10661 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!114987 (not res!636099)) b!948178))

(assert (= (and b!948178 c!98969) b!948176))

(assert (= (and b!948178 (not c!98969)) b!948177))

(assert (= (and b!948176 res!636098) b!948175))

(assert (= (or b!948175 b!948177) bm!41154))

(assert (=> b!948176 m!881569))

(declare-fun m!881595 () Bool)

(assert (=> b!948176 m!881595))

(declare-fun m!881597 () Bool)

(assert (=> b!948176 m!881597))

(assert (=> b!948176 m!881569))

(declare-fun m!881599 () Bool)

(assert (=> b!948176 m!881599))

(declare-fun m!881601 () Bool)

(assert (=> bm!41154 m!881601))

(assert (=> b!948178 m!881569))

(assert (=> b!948178 m!881569))

(assert (=> b!948178 m!881571))

(assert (=> b!948055 d!114987))

(declare-fun mapNonEmpty!32887 () Bool)

(declare-fun mapRes!32887 () Bool)

(declare-fun tp!63061 () Bool)

(declare-fun e!533726 () Bool)

(assert (=> mapNonEmpty!32887 (= mapRes!32887 (and tp!63061 e!533726))))

(declare-fun mapKey!32887 () (_ BitVec 32))

(declare-fun mapRest!32887 () (Array (_ BitVec 32) ValueCell!9854))

(declare-fun mapValue!32887 () ValueCell!9854)

(assert (=> mapNonEmpty!32887 (= mapRest!32878 (store mapRest!32887 mapKey!32887 mapValue!32887))))

(declare-fun b!948186 () Bool)

(declare-fun e!533725 () Bool)

(assert (=> b!948186 (= e!533725 tp_is_empty!20671)))

(declare-fun mapIsEmpty!32887 () Bool)

(assert (=> mapIsEmpty!32887 mapRes!32887))

(declare-fun condMapEmpty!32887 () Bool)

(declare-fun mapDefault!32887 () ValueCell!9854)

(assert (=> mapNonEmpty!32878 (= condMapEmpty!32887 (= mapRest!32878 ((as const (Array (_ BitVec 32) ValueCell!9854)) mapDefault!32887)))))

(assert (=> mapNonEmpty!32878 (= tp!63045 (and e!533725 mapRes!32887))))

(declare-fun b!948185 () Bool)

(assert (=> b!948185 (= e!533726 tp_is_empty!20671)))

(assert (= (and mapNonEmpty!32878 condMapEmpty!32887) mapIsEmpty!32887))

(assert (= (and mapNonEmpty!32878 (not condMapEmpty!32887)) mapNonEmpty!32887))

(assert (= (and mapNonEmpty!32887 ((_ is ValueCellFull!9854) mapValue!32887)) b!948185))

(assert (= (and mapNonEmpty!32878 ((_ is ValueCellFull!9854) mapDefault!32887)) b!948186))

(declare-fun m!881603 () Bool)

(assert (=> mapNonEmpty!32887 m!881603))

(check-sat (not b!948130) tp_is_empty!20671 (not bm!41154) (not d!114983) (not b!948166) (not b_next!18163) (not b!948154) (not b!948139) (not b!948165) (not b!948178) (not d!114981) (not b!948176) (not mapNonEmpty!32887) b_and!29595 (not b!948132) (not b!948129) (not b!948164) (not d!114985) (not bm!41151))
(check-sat b_and!29595 (not b_next!18163))

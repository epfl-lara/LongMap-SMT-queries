; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81024 () Bool)

(assert start!81024)

(declare-fun b!948810 () Bool)

(declare-fun b_free!18207 () Bool)

(declare-fun b_next!18207 () Bool)

(assert (=> b!948810 (= b_free!18207 (not b_next!18207))))

(declare-fun tp!63199 () Bool)

(declare-fun b_and!29645 () Bool)

(assert (=> b!948810 (= tp!63199 b_and!29645)))

(declare-fun b!948809 () Bool)

(declare-fun res!636464 () Bool)

(declare-fun e!534132 () Bool)

(assert (=> b!948809 (=> (not res!636464) (not e!534132))))

(declare-datatypes ((V!32585 0))(
  ( (V!32586 (val!10408 Int)) )
))
(declare-datatypes ((ValueCell!9876 0))(
  ( (ValueCellFull!9876 (v!12946 V!32585)) (EmptyCell!9876) )
))
(declare-datatypes ((array!57438 0))(
  ( (array!57439 (arr!27624 (Array (_ BitVec 32) ValueCell!9876)) (size!28099 (_ BitVec 32))) )
))
(declare-datatypes ((array!57440 0))(
  ( (array!57441 (arr!27625 (Array (_ BitVec 32) (_ BitVec 64))) (size!28100 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4902 0))(
  ( (LongMapFixedSize!4903 (defaultEntry!5755 Int) (mask!27523 (_ BitVec 32)) (extraKeys!5487 (_ BitVec 32)) (zeroValue!5591 V!32585) (minValue!5591 V!32585) (_size!2506 (_ BitVec 32)) (_keys!10678 array!57440) (_values!5778 array!57438) (_vacant!2506 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4902)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!948809 (= res!636464 (validMask!0 (mask!27523 thiss!1141)))))

(declare-fun e!534133 () Bool)

(declare-fun e!534130 () Bool)

(declare-fun tp_is_empty!20715 () Bool)

(declare-fun array_inv!21444 (array!57440) Bool)

(declare-fun array_inv!21445 (array!57438) Bool)

(assert (=> b!948810 (= e!534130 (and tp!63199 tp_is_empty!20715 (array_inv!21444 (_keys!10678 thiss!1141)) (array_inv!21445 (_values!5778 thiss!1141)) e!534133))))

(declare-fun b!948811 () Bool)

(declare-fun e!534134 () Bool)

(assert (=> b!948811 (= e!534134 tp_is_empty!20715)))

(declare-fun b!948812 () Bool)

(declare-fun res!636463 () Bool)

(assert (=> b!948812 (=> (not res!636463) (not e!534132))))

(declare-fun key!756 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9128 0))(
  ( (MissingZero!9128 (index!38883 (_ BitVec 32))) (Found!9128 (index!38884 (_ BitVec 32))) (Intermediate!9128 (undefined!9940 Bool) (index!38885 (_ BitVec 32)) (x!81632 (_ BitVec 32))) (Undefined!9128) (MissingVacant!9128 (index!38886 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57440 (_ BitVec 32)) SeekEntryResult!9128)

(assert (=> b!948812 (= res!636463 (not ((_ is Found!9128) (seekEntry!0 key!756 (_keys!10678 thiss!1141) (mask!27523 thiss!1141)))))))

(declare-fun mapNonEmpty!32967 () Bool)

(declare-fun mapRes!32967 () Bool)

(declare-fun tp!63200 () Bool)

(declare-fun e!534131 () Bool)

(assert (=> mapNonEmpty!32967 (= mapRes!32967 (and tp!63200 e!534131))))

(declare-fun mapKey!32967 () (_ BitVec 32))

(declare-fun mapValue!32967 () ValueCell!9876)

(declare-fun mapRest!32967 () (Array (_ BitVec 32) ValueCell!9876))

(assert (=> mapNonEmpty!32967 (= (arr!27624 (_values!5778 thiss!1141)) (store mapRest!32967 mapKey!32967 mapValue!32967))))

(declare-fun b!948814 () Bool)

(declare-fun res!636462 () Bool)

(assert (=> b!948814 (=> (not res!636462) (not e!534132))))

(assert (=> b!948814 (= res!636462 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!948815 () Bool)

(assert (=> b!948815 (= e!534131 tp_is_empty!20715)))

(declare-fun b!948816 () Bool)

(assert (=> b!948816 (= e!534133 (and e!534134 mapRes!32967))))

(declare-fun condMapEmpty!32967 () Bool)

(declare-fun mapDefault!32967 () ValueCell!9876)

(assert (=> b!948816 (= condMapEmpty!32967 (= (arr!27624 (_values!5778 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9876)) mapDefault!32967)))))

(declare-fun res!636465 () Bool)

(assert (=> start!81024 (=> (not res!636465) (not e!534132))))

(declare-fun valid!1867 (LongMapFixedSize!4902) Bool)

(assert (=> start!81024 (= res!636465 (valid!1867 thiss!1141))))

(assert (=> start!81024 e!534132))

(assert (=> start!81024 e!534130))

(assert (=> start!81024 true))

(declare-fun b!948813 () Bool)

(declare-fun res!636461 () Bool)

(assert (=> b!948813 (=> (not res!636461) (not e!534132))))

(declare-datatypes ((tuple2!13528 0))(
  ( (tuple2!13529 (_1!6775 (_ BitVec 64)) (_2!6775 V!32585)) )
))
(declare-datatypes ((List!19321 0))(
  ( (Nil!19318) (Cons!19317 (h!20475 tuple2!13528) (t!27650 List!19321)) )
))
(declare-datatypes ((ListLongMap!12225 0))(
  ( (ListLongMap!12226 (toList!6128 List!19321)) )
))
(declare-fun contains!5214 (ListLongMap!12225 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3361 (array!57440 array!57438 (_ BitVec 32) (_ BitVec 32) V!32585 V!32585 (_ BitVec 32) Int) ListLongMap!12225)

(assert (=> b!948813 (= res!636461 (contains!5214 (getCurrentListMap!3361 (_keys!10678 thiss!1141) (_values!5778 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5487 thiss!1141) (zeroValue!5591 thiss!1141) (minValue!5591 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5755 thiss!1141)) key!756))))

(declare-fun mapIsEmpty!32967 () Bool)

(assert (=> mapIsEmpty!32967 mapRes!32967))

(declare-fun b!948817 () Bool)

(assert (=> b!948817 (= e!534132 (and (= (size!28099 (_values!5778 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27523 thiss!1141))) (= (size!28100 (_keys!10678 thiss!1141)) (size!28099 (_values!5778 thiss!1141))) (bvslt (mask!27523 thiss!1141) #b00000000000000000000000000000000)))))

(assert (= (and start!81024 res!636465) b!948814))

(assert (= (and b!948814 res!636462) b!948812))

(assert (= (and b!948812 res!636463) b!948813))

(assert (= (and b!948813 res!636461) b!948809))

(assert (= (and b!948809 res!636464) b!948817))

(assert (= (and b!948816 condMapEmpty!32967) mapIsEmpty!32967))

(assert (= (and b!948816 (not condMapEmpty!32967)) mapNonEmpty!32967))

(assert (= (and mapNonEmpty!32967 ((_ is ValueCellFull!9876) mapValue!32967)) b!948815))

(assert (= (and b!948816 ((_ is ValueCellFull!9876) mapDefault!32967)) b!948811))

(assert (= b!948810 b!948816))

(assert (= start!81024 b!948810))

(declare-fun m!881549 () Bool)

(assert (=> b!948809 m!881549))

(declare-fun m!881551 () Bool)

(assert (=> mapNonEmpty!32967 m!881551))

(declare-fun m!881553 () Bool)

(assert (=> start!81024 m!881553))

(declare-fun m!881555 () Bool)

(assert (=> b!948812 m!881555))

(declare-fun m!881557 () Bool)

(assert (=> b!948810 m!881557))

(declare-fun m!881559 () Bool)

(assert (=> b!948810 m!881559))

(declare-fun m!881561 () Bool)

(assert (=> b!948813 m!881561))

(assert (=> b!948813 m!881561))

(declare-fun m!881563 () Bool)

(assert (=> b!948813 m!881563))

(check-sat (not b!948809) (not b!948812) (not b!948813) tp_is_empty!20715 (not start!81024) b_and!29645 (not b_next!18207) (not mapNonEmpty!32967) (not b!948810))
(check-sat b_and!29645 (not b_next!18207))
(get-model)

(declare-fun d!114931 () Bool)

(assert (=> d!114931 (= (validMask!0 (mask!27523 thiss!1141)) (and (or (= (mask!27523 thiss!1141) #b00000000000000000000000000000111) (= (mask!27523 thiss!1141) #b00000000000000000000000000001111) (= (mask!27523 thiss!1141) #b00000000000000000000000000011111) (= (mask!27523 thiss!1141) #b00000000000000000000000000111111) (= (mask!27523 thiss!1141) #b00000000000000000000000001111111) (= (mask!27523 thiss!1141) #b00000000000000000000000011111111) (= (mask!27523 thiss!1141) #b00000000000000000000000111111111) (= (mask!27523 thiss!1141) #b00000000000000000000001111111111) (= (mask!27523 thiss!1141) #b00000000000000000000011111111111) (= (mask!27523 thiss!1141) #b00000000000000000000111111111111) (= (mask!27523 thiss!1141) #b00000000000000000001111111111111) (= (mask!27523 thiss!1141) #b00000000000000000011111111111111) (= (mask!27523 thiss!1141) #b00000000000000000111111111111111) (= (mask!27523 thiss!1141) #b00000000000000001111111111111111) (= (mask!27523 thiss!1141) #b00000000000000011111111111111111) (= (mask!27523 thiss!1141) #b00000000000000111111111111111111) (= (mask!27523 thiss!1141) #b00000000000001111111111111111111) (= (mask!27523 thiss!1141) #b00000000000011111111111111111111) (= (mask!27523 thiss!1141) #b00000000000111111111111111111111) (= (mask!27523 thiss!1141) #b00000000001111111111111111111111) (= (mask!27523 thiss!1141) #b00000000011111111111111111111111) (= (mask!27523 thiss!1141) #b00000000111111111111111111111111) (= (mask!27523 thiss!1141) #b00000001111111111111111111111111) (= (mask!27523 thiss!1141) #b00000011111111111111111111111111) (= (mask!27523 thiss!1141) #b00000111111111111111111111111111) (= (mask!27523 thiss!1141) #b00001111111111111111111111111111) (= (mask!27523 thiss!1141) #b00011111111111111111111111111111) (= (mask!27523 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27523 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!948809 d!114931))

(declare-fun d!114933 () Bool)

(assert (=> d!114933 (= (array_inv!21444 (_keys!10678 thiss!1141)) (bvsge (size!28100 (_keys!10678 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!948810 d!114933))

(declare-fun d!114935 () Bool)

(assert (=> d!114935 (= (array_inv!21445 (_values!5778 thiss!1141)) (bvsge (size!28099 (_values!5778 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!948810 d!114935))

(declare-fun b!948857 () Bool)

(declare-fun e!534159 () SeekEntryResult!9128)

(assert (=> b!948857 (= e!534159 Undefined!9128)))

(declare-fun d!114937 () Bool)

(declare-fun lt!427252 () SeekEntryResult!9128)

(assert (=> d!114937 (and (or ((_ is MissingVacant!9128) lt!427252) (not ((_ is Found!9128) lt!427252)) (and (bvsge (index!38884 lt!427252) #b00000000000000000000000000000000) (bvslt (index!38884 lt!427252) (size!28100 (_keys!10678 thiss!1141))))) (not ((_ is MissingVacant!9128) lt!427252)) (or (not ((_ is Found!9128) lt!427252)) (= (select (arr!27625 (_keys!10678 thiss!1141)) (index!38884 lt!427252)) key!756)))))

(assert (=> d!114937 (= lt!427252 e!534159)))

(declare-fun c!98955 () Bool)

(declare-fun lt!427250 () SeekEntryResult!9128)

(assert (=> d!114937 (= c!98955 (and ((_ is Intermediate!9128) lt!427250) (undefined!9940 lt!427250)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57440 (_ BitVec 32)) SeekEntryResult!9128)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114937 (= lt!427250 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27523 thiss!1141)) key!756 (_keys!10678 thiss!1141) (mask!27523 thiss!1141)))))

(assert (=> d!114937 (validMask!0 (mask!27523 thiss!1141))))

(assert (=> d!114937 (= (seekEntry!0 key!756 (_keys!10678 thiss!1141) (mask!27523 thiss!1141)) lt!427252)))

(declare-fun b!948858 () Bool)

(declare-fun e!534161 () SeekEntryResult!9128)

(assert (=> b!948858 (= e!534161 (MissingZero!9128 (index!38885 lt!427250)))))

(declare-fun b!948859 () Bool)

(declare-fun e!534160 () SeekEntryResult!9128)

(assert (=> b!948859 (= e!534159 e!534160)))

(declare-fun lt!427253 () (_ BitVec 64))

(assert (=> b!948859 (= lt!427253 (select (arr!27625 (_keys!10678 thiss!1141)) (index!38885 lt!427250)))))

(declare-fun c!98956 () Bool)

(assert (=> b!948859 (= c!98956 (= lt!427253 key!756))))

(declare-fun b!948860 () Bool)

(declare-fun lt!427251 () SeekEntryResult!9128)

(assert (=> b!948860 (= e!534161 (ite ((_ is MissingVacant!9128) lt!427251) (MissingZero!9128 (index!38886 lt!427251)) lt!427251))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57440 (_ BitVec 32)) SeekEntryResult!9128)

(assert (=> b!948860 (= lt!427251 (seekKeyOrZeroReturnVacant!0 (x!81632 lt!427250) (index!38885 lt!427250) (index!38885 lt!427250) key!756 (_keys!10678 thiss!1141) (mask!27523 thiss!1141)))))

(declare-fun b!948861 () Bool)

(assert (=> b!948861 (= e!534160 (Found!9128 (index!38885 lt!427250)))))

(declare-fun b!948862 () Bool)

(declare-fun c!98957 () Bool)

(assert (=> b!948862 (= c!98957 (= lt!427253 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!948862 (= e!534160 e!534161)))

(assert (= (and d!114937 c!98955) b!948857))

(assert (= (and d!114937 (not c!98955)) b!948859))

(assert (= (and b!948859 c!98956) b!948861))

(assert (= (and b!948859 (not c!98956)) b!948862))

(assert (= (and b!948862 c!98957) b!948858))

(assert (= (and b!948862 (not c!98957)) b!948860))

(declare-fun m!881581 () Bool)

(assert (=> d!114937 m!881581))

(declare-fun m!881583 () Bool)

(assert (=> d!114937 m!881583))

(assert (=> d!114937 m!881583))

(declare-fun m!881585 () Bool)

(assert (=> d!114937 m!881585))

(assert (=> d!114937 m!881549))

(declare-fun m!881587 () Bool)

(assert (=> b!948859 m!881587))

(declare-fun m!881589 () Bool)

(assert (=> b!948860 m!881589))

(assert (=> b!948812 d!114937))

(declare-fun d!114939 () Bool)

(declare-fun e!534166 () Bool)

(assert (=> d!114939 e!534166))

(declare-fun res!636483 () Bool)

(assert (=> d!114939 (=> res!636483 e!534166)))

(declare-fun lt!427262 () Bool)

(assert (=> d!114939 (= res!636483 (not lt!427262))))

(declare-fun lt!427265 () Bool)

(assert (=> d!114939 (= lt!427262 lt!427265)))

(declare-datatypes ((Unit!31961 0))(
  ( (Unit!31962) )
))
(declare-fun lt!427263 () Unit!31961)

(declare-fun e!534167 () Unit!31961)

(assert (=> d!114939 (= lt!427263 e!534167)))

(declare-fun c!98960 () Bool)

(assert (=> d!114939 (= c!98960 lt!427265)))

(declare-fun containsKey!459 (List!19321 (_ BitVec 64)) Bool)

(assert (=> d!114939 (= lt!427265 (containsKey!459 (toList!6128 (getCurrentListMap!3361 (_keys!10678 thiss!1141) (_values!5778 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5487 thiss!1141) (zeroValue!5591 thiss!1141) (minValue!5591 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5755 thiss!1141))) key!756))))

(assert (=> d!114939 (= (contains!5214 (getCurrentListMap!3361 (_keys!10678 thiss!1141) (_values!5778 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5487 thiss!1141) (zeroValue!5591 thiss!1141) (minValue!5591 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5755 thiss!1141)) key!756) lt!427262)))

(declare-fun b!948869 () Bool)

(declare-fun lt!427264 () Unit!31961)

(assert (=> b!948869 (= e!534167 lt!427264)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!355 (List!19321 (_ BitVec 64)) Unit!31961)

(assert (=> b!948869 (= lt!427264 (lemmaContainsKeyImpliesGetValueByKeyDefined!355 (toList!6128 (getCurrentListMap!3361 (_keys!10678 thiss!1141) (_values!5778 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5487 thiss!1141) (zeroValue!5591 thiss!1141) (minValue!5591 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5755 thiss!1141))) key!756))))

(declare-datatypes ((Option!498 0))(
  ( (Some!497 (v!12948 V!32585)) (None!496) )
))
(declare-fun isDefined!364 (Option!498) Bool)

(declare-fun getValueByKey!492 (List!19321 (_ BitVec 64)) Option!498)

(assert (=> b!948869 (isDefined!364 (getValueByKey!492 (toList!6128 (getCurrentListMap!3361 (_keys!10678 thiss!1141) (_values!5778 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5487 thiss!1141) (zeroValue!5591 thiss!1141) (minValue!5591 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5755 thiss!1141))) key!756))))

(declare-fun b!948870 () Bool)

(declare-fun Unit!31963 () Unit!31961)

(assert (=> b!948870 (= e!534167 Unit!31963)))

(declare-fun b!948871 () Bool)

(assert (=> b!948871 (= e!534166 (isDefined!364 (getValueByKey!492 (toList!6128 (getCurrentListMap!3361 (_keys!10678 thiss!1141) (_values!5778 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5487 thiss!1141) (zeroValue!5591 thiss!1141) (minValue!5591 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5755 thiss!1141))) key!756)))))

(assert (= (and d!114939 c!98960) b!948869))

(assert (= (and d!114939 (not c!98960)) b!948870))

(assert (= (and d!114939 (not res!636483)) b!948871))

(declare-fun m!881591 () Bool)

(assert (=> d!114939 m!881591))

(declare-fun m!881593 () Bool)

(assert (=> b!948869 m!881593))

(declare-fun m!881595 () Bool)

(assert (=> b!948869 m!881595))

(assert (=> b!948869 m!881595))

(declare-fun m!881597 () Bool)

(assert (=> b!948869 m!881597))

(assert (=> b!948871 m!881595))

(assert (=> b!948871 m!881595))

(assert (=> b!948871 m!881597))

(assert (=> b!948813 d!114939))

(declare-fun b!948914 () Bool)

(declare-fun e!534202 () Bool)

(declare-fun lt!427326 () ListLongMap!12225)

(declare-fun apply!873 (ListLongMap!12225 (_ BitVec 64)) V!32585)

(assert (=> b!948914 (= e!534202 (= (apply!873 lt!427326 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5591 thiss!1141)))))

(declare-fun b!948915 () Bool)

(declare-fun e!534200 () Bool)

(declare-fun call!41253 () Bool)

(assert (=> b!948915 (= e!534200 (not call!41253))))

(declare-fun b!948916 () Bool)

(declare-fun e!534204 () Bool)

(assert (=> b!948916 (= e!534200 e!534204)))

(declare-fun res!636506 () Bool)

(assert (=> b!948916 (= res!636506 call!41253)))

(assert (=> b!948916 (=> (not res!636506) (not e!534204))))

(declare-fun b!948917 () Bool)

(declare-fun e!534205 () ListLongMap!12225)

(declare-fun call!41247 () ListLongMap!12225)

(assert (=> b!948917 (= e!534205 call!41247)))

(declare-fun b!948918 () Bool)

(declare-fun e!534199 () ListLongMap!12225)

(declare-fun e!534195 () ListLongMap!12225)

(assert (=> b!948918 (= e!534199 e!534195)))

(declare-fun c!98976 () Bool)

(assert (=> b!948918 (= c!98976 (and (not (= (bvand (extraKeys!5487 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5487 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!41251 () ListLongMap!12225)

(declare-fun call!41252 () ListLongMap!12225)

(declare-fun bm!41244 () Bool)

(declare-fun call!41248 () ListLongMap!12225)

(declare-fun c!98975 () Bool)

(declare-fun +!2857 (ListLongMap!12225 tuple2!13528) ListLongMap!12225)

(assert (=> bm!41244 (= call!41248 (+!2857 (ite c!98975 call!41252 (ite c!98976 call!41251 call!41247)) (ite (or c!98975 c!98976) (tuple2!13529 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5591 thiss!1141)) (tuple2!13529 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5591 thiss!1141)))))))

(declare-fun b!948919 () Bool)

(declare-fun e!534196 () Unit!31961)

(declare-fun lt!427316 () Unit!31961)

(assert (=> b!948919 (= e!534196 lt!427316)))

(declare-fun lt!427311 () ListLongMap!12225)

(declare-fun getCurrentListMapNoExtraKeys!3312 (array!57440 array!57438 (_ BitVec 32) (_ BitVec 32) V!32585 V!32585 (_ BitVec 32) Int) ListLongMap!12225)

(assert (=> b!948919 (= lt!427311 (getCurrentListMapNoExtraKeys!3312 (_keys!10678 thiss!1141) (_values!5778 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5487 thiss!1141) (zeroValue!5591 thiss!1141) (minValue!5591 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5755 thiss!1141)))))

(declare-fun lt!427312 () (_ BitVec 64))

(assert (=> b!948919 (= lt!427312 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427322 () (_ BitVec 64))

(assert (=> b!948919 (= lt!427322 (select (arr!27625 (_keys!10678 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427329 () Unit!31961)

(declare-fun addStillContains!576 (ListLongMap!12225 (_ BitVec 64) V!32585 (_ BitVec 64)) Unit!31961)

(assert (=> b!948919 (= lt!427329 (addStillContains!576 lt!427311 lt!427312 (zeroValue!5591 thiss!1141) lt!427322))))

(assert (=> b!948919 (contains!5214 (+!2857 lt!427311 (tuple2!13529 lt!427312 (zeroValue!5591 thiss!1141))) lt!427322)))

(declare-fun lt!427327 () Unit!31961)

(assert (=> b!948919 (= lt!427327 lt!427329)))

(declare-fun lt!427314 () ListLongMap!12225)

(assert (=> b!948919 (= lt!427314 (getCurrentListMapNoExtraKeys!3312 (_keys!10678 thiss!1141) (_values!5778 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5487 thiss!1141) (zeroValue!5591 thiss!1141) (minValue!5591 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5755 thiss!1141)))))

(declare-fun lt!427331 () (_ BitVec 64))

(assert (=> b!948919 (= lt!427331 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427318 () (_ BitVec 64))

(assert (=> b!948919 (= lt!427318 (select (arr!27625 (_keys!10678 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427315 () Unit!31961)

(declare-fun addApplyDifferent!456 (ListLongMap!12225 (_ BitVec 64) V!32585 (_ BitVec 64)) Unit!31961)

(assert (=> b!948919 (= lt!427315 (addApplyDifferent!456 lt!427314 lt!427331 (minValue!5591 thiss!1141) lt!427318))))

(assert (=> b!948919 (= (apply!873 (+!2857 lt!427314 (tuple2!13529 lt!427331 (minValue!5591 thiss!1141))) lt!427318) (apply!873 lt!427314 lt!427318))))

(declare-fun lt!427324 () Unit!31961)

(assert (=> b!948919 (= lt!427324 lt!427315)))

(declare-fun lt!427323 () ListLongMap!12225)

(assert (=> b!948919 (= lt!427323 (getCurrentListMapNoExtraKeys!3312 (_keys!10678 thiss!1141) (_values!5778 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5487 thiss!1141) (zeroValue!5591 thiss!1141) (minValue!5591 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5755 thiss!1141)))))

(declare-fun lt!427319 () (_ BitVec 64))

(assert (=> b!948919 (= lt!427319 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427328 () (_ BitVec 64))

(assert (=> b!948919 (= lt!427328 (select (arr!27625 (_keys!10678 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427321 () Unit!31961)

(assert (=> b!948919 (= lt!427321 (addApplyDifferent!456 lt!427323 lt!427319 (zeroValue!5591 thiss!1141) lt!427328))))

(assert (=> b!948919 (= (apply!873 (+!2857 lt!427323 (tuple2!13529 lt!427319 (zeroValue!5591 thiss!1141))) lt!427328) (apply!873 lt!427323 lt!427328))))

(declare-fun lt!427320 () Unit!31961)

(assert (=> b!948919 (= lt!427320 lt!427321)))

(declare-fun lt!427330 () ListLongMap!12225)

(assert (=> b!948919 (= lt!427330 (getCurrentListMapNoExtraKeys!3312 (_keys!10678 thiss!1141) (_values!5778 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5487 thiss!1141) (zeroValue!5591 thiss!1141) (minValue!5591 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5755 thiss!1141)))))

(declare-fun lt!427317 () (_ BitVec 64))

(assert (=> b!948919 (= lt!427317 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427313 () (_ BitVec 64))

(assert (=> b!948919 (= lt!427313 (select (arr!27625 (_keys!10678 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!948919 (= lt!427316 (addApplyDifferent!456 lt!427330 lt!427317 (minValue!5591 thiss!1141) lt!427313))))

(assert (=> b!948919 (= (apply!873 (+!2857 lt!427330 (tuple2!13529 lt!427317 (minValue!5591 thiss!1141))) lt!427313) (apply!873 lt!427330 lt!427313))))

(declare-fun b!948920 () Bool)

(declare-fun Unit!31964 () Unit!31961)

(assert (=> b!948920 (= e!534196 Unit!31964)))

(declare-fun b!948921 () Bool)

(declare-fun e!534194 () Bool)

(declare-fun get!14512 (ValueCell!9876 V!32585) V!32585)

(declare-fun dynLambda!1646 (Int (_ BitVec 64)) V!32585)

(assert (=> b!948921 (= e!534194 (= (apply!873 lt!427326 (select (arr!27625 (_keys!10678 thiss!1141)) #b00000000000000000000000000000000)) (get!14512 (select (arr!27624 (_values!5778 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1646 (defaultEntry!5755 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!948921 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28099 (_values!5778 thiss!1141))))))

(assert (=> b!948921 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28100 (_keys!10678 thiss!1141))))))

(declare-fun bm!41245 () Bool)

(assert (=> bm!41245 (= call!41247 call!41251)))

(declare-fun b!948922 () Bool)

(declare-fun e!534203 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!948922 (= e!534203 (validKeyInArray!0 (select (arr!27625 (_keys!10678 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41246 () Bool)

(assert (=> bm!41246 (= call!41251 call!41252)))

(declare-fun b!948923 () Bool)

(assert (=> b!948923 (= e!534204 (= (apply!873 lt!427326 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5591 thiss!1141)))))

(declare-fun b!948924 () Bool)

(declare-fun res!636502 () Bool)

(declare-fun e!534198 () Bool)

(assert (=> b!948924 (=> (not res!636502) (not e!534198))))

(declare-fun e!534206 () Bool)

(assert (=> b!948924 (= res!636502 e!534206)))

(declare-fun c!98978 () Bool)

(assert (=> b!948924 (= c!98978 (not (= (bvand (extraKeys!5487 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!41247 () Bool)

(declare-fun call!41250 () Bool)

(assert (=> bm!41247 (= call!41250 (contains!5214 lt!427326 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!41248 () Bool)

(declare-fun call!41249 () ListLongMap!12225)

(assert (=> bm!41248 (= call!41249 call!41248)))

(declare-fun bm!41249 () Bool)

(assert (=> bm!41249 (= call!41252 (getCurrentListMapNoExtraKeys!3312 (_keys!10678 thiss!1141) (_values!5778 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5487 thiss!1141) (zeroValue!5591 thiss!1141) (minValue!5591 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5755 thiss!1141)))))

(declare-fun b!948925 () Bool)

(declare-fun res!636505 () Bool)

(assert (=> b!948925 (=> (not res!636505) (not e!534198))))

(declare-fun e!534197 () Bool)

(assert (=> b!948925 (= res!636505 e!534197)))

(declare-fun res!636508 () Bool)

(assert (=> b!948925 (=> res!636508 e!534197)))

(declare-fun e!534201 () Bool)

(assert (=> b!948925 (= res!636508 (not e!534201))))

(declare-fun res!636507 () Bool)

(assert (=> b!948925 (=> (not res!636507) (not e!534201))))

(assert (=> b!948925 (= res!636507 (bvslt #b00000000000000000000000000000000 (size!28100 (_keys!10678 thiss!1141))))))

(declare-fun b!948926 () Bool)

(assert (=> b!948926 (= e!534199 (+!2857 call!41248 (tuple2!13529 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5591 thiss!1141))))))

(declare-fun bm!41250 () Bool)

(assert (=> bm!41250 (= call!41253 (contains!5214 lt!427326 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!948927 () Bool)

(declare-fun c!98973 () Bool)

(assert (=> b!948927 (= c!98973 (and (not (= (bvand (extraKeys!5487 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5487 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!948927 (= e!534195 e!534205)))

(declare-fun b!948928 () Bool)

(assert (=> b!948928 (= e!534198 e!534200)))

(declare-fun c!98977 () Bool)

(assert (=> b!948928 (= c!98977 (not (= (bvand (extraKeys!5487 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!114941 () Bool)

(assert (=> d!114941 e!534198))

(declare-fun res!636504 () Bool)

(assert (=> d!114941 (=> (not res!636504) (not e!534198))))

(assert (=> d!114941 (= res!636504 (or (bvsge #b00000000000000000000000000000000 (size!28100 (_keys!10678 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28100 (_keys!10678 thiss!1141))))))))

(declare-fun lt!427325 () ListLongMap!12225)

(assert (=> d!114941 (= lt!427326 lt!427325)))

(declare-fun lt!427310 () Unit!31961)

(assert (=> d!114941 (= lt!427310 e!534196)))

(declare-fun c!98974 () Bool)

(assert (=> d!114941 (= c!98974 e!534203)))

(declare-fun res!636510 () Bool)

(assert (=> d!114941 (=> (not res!636510) (not e!534203))))

(assert (=> d!114941 (= res!636510 (bvslt #b00000000000000000000000000000000 (size!28100 (_keys!10678 thiss!1141))))))

(assert (=> d!114941 (= lt!427325 e!534199)))

(assert (=> d!114941 (= c!98975 (and (not (= (bvand (extraKeys!5487 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5487 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!114941 (validMask!0 (mask!27523 thiss!1141))))

(assert (=> d!114941 (= (getCurrentListMap!3361 (_keys!10678 thiss!1141) (_values!5778 thiss!1141) (mask!27523 thiss!1141) (extraKeys!5487 thiss!1141) (zeroValue!5591 thiss!1141) (minValue!5591 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5755 thiss!1141)) lt!427326)))

(declare-fun b!948929 () Bool)

(assert (=> b!948929 (= e!534206 (not call!41250))))

(declare-fun b!948930 () Bool)

(assert (=> b!948930 (= e!534195 call!41249)))

(declare-fun b!948931 () Bool)

(assert (=> b!948931 (= e!534206 e!534202)))

(declare-fun res!636509 () Bool)

(assert (=> b!948931 (= res!636509 call!41250)))

(assert (=> b!948931 (=> (not res!636509) (not e!534202))))

(declare-fun b!948932 () Bool)

(assert (=> b!948932 (= e!534205 call!41249)))

(declare-fun b!948933 () Bool)

(assert (=> b!948933 (= e!534197 e!534194)))

(declare-fun res!636503 () Bool)

(assert (=> b!948933 (=> (not res!636503) (not e!534194))))

(assert (=> b!948933 (= res!636503 (contains!5214 lt!427326 (select (arr!27625 (_keys!10678 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!948933 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28100 (_keys!10678 thiss!1141))))))

(declare-fun b!948934 () Bool)

(assert (=> b!948934 (= e!534201 (validKeyInArray!0 (select (arr!27625 (_keys!10678 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!114941 c!98975) b!948926))

(assert (= (and d!114941 (not c!98975)) b!948918))

(assert (= (and b!948918 c!98976) b!948930))

(assert (= (and b!948918 (not c!98976)) b!948927))

(assert (= (and b!948927 c!98973) b!948932))

(assert (= (and b!948927 (not c!98973)) b!948917))

(assert (= (or b!948932 b!948917) bm!41245))

(assert (= (or b!948930 bm!41245) bm!41246))

(assert (= (or b!948930 b!948932) bm!41248))

(assert (= (or b!948926 bm!41246) bm!41249))

(assert (= (or b!948926 bm!41248) bm!41244))

(assert (= (and d!114941 res!636510) b!948922))

(assert (= (and d!114941 c!98974) b!948919))

(assert (= (and d!114941 (not c!98974)) b!948920))

(assert (= (and d!114941 res!636504) b!948925))

(assert (= (and b!948925 res!636507) b!948934))

(assert (= (and b!948925 (not res!636508)) b!948933))

(assert (= (and b!948933 res!636503) b!948921))

(assert (= (and b!948925 res!636505) b!948924))

(assert (= (and b!948924 c!98978) b!948931))

(assert (= (and b!948924 (not c!98978)) b!948929))

(assert (= (and b!948931 res!636509) b!948914))

(assert (= (or b!948931 b!948929) bm!41247))

(assert (= (and b!948924 res!636502) b!948928))

(assert (= (and b!948928 c!98977) b!948916))

(assert (= (and b!948928 (not c!98977)) b!948915))

(assert (= (and b!948916 res!636506) b!948923))

(assert (= (or b!948916 b!948915) bm!41250))

(declare-fun b_lambda!14331 () Bool)

(assert (=> (not b_lambda!14331) (not b!948921)))

(declare-fun t!27652 () Bool)

(declare-fun tb!6181 () Bool)

(assert (=> (and b!948810 (= (defaultEntry!5755 thiss!1141) (defaultEntry!5755 thiss!1141)) t!27652) tb!6181))

(declare-fun result!12265 () Bool)

(assert (=> tb!6181 (= result!12265 tp_is_empty!20715)))

(assert (=> b!948921 t!27652))

(declare-fun b_and!29649 () Bool)

(assert (= b_and!29645 (and (=> t!27652 result!12265) b_and!29649)))

(declare-fun m!881599 () Bool)

(assert (=> b!948933 m!881599))

(assert (=> b!948933 m!881599))

(declare-fun m!881601 () Bool)

(assert (=> b!948933 m!881601))

(declare-fun m!881603 () Bool)

(assert (=> b!948926 m!881603))

(declare-fun m!881605 () Bool)

(assert (=> b!948923 m!881605))

(assert (=> b!948922 m!881599))

(assert (=> b!948922 m!881599))

(declare-fun m!881607 () Bool)

(assert (=> b!948922 m!881607))

(declare-fun m!881609 () Bool)

(assert (=> b!948914 m!881609))

(declare-fun m!881611 () Bool)

(assert (=> bm!41249 m!881611))

(declare-fun m!881613 () Bool)

(assert (=> bm!41244 m!881613))

(assert (=> b!948921 m!881599))

(declare-fun m!881615 () Bool)

(assert (=> b!948921 m!881615))

(assert (=> b!948921 m!881599))

(declare-fun m!881617 () Bool)

(assert (=> b!948921 m!881617))

(declare-fun m!881619 () Bool)

(assert (=> b!948921 m!881619))

(declare-fun m!881621 () Bool)

(assert (=> b!948921 m!881621))

(assert (=> b!948921 m!881619))

(assert (=> b!948921 m!881617))

(declare-fun m!881623 () Bool)

(assert (=> bm!41247 m!881623))

(assert (=> b!948934 m!881599))

(assert (=> b!948934 m!881599))

(assert (=> b!948934 m!881607))

(declare-fun m!881625 () Bool)

(assert (=> b!948919 m!881625))

(declare-fun m!881627 () Bool)

(assert (=> b!948919 m!881627))

(declare-fun m!881629 () Bool)

(assert (=> b!948919 m!881629))

(declare-fun m!881631 () Bool)

(assert (=> b!948919 m!881631))

(assert (=> b!948919 m!881611))

(declare-fun m!881633 () Bool)

(assert (=> b!948919 m!881633))

(declare-fun m!881635 () Bool)

(assert (=> b!948919 m!881635))

(declare-fun m!881637 () Bool)

(assert (=> b!948919 m!881637))

(declare-fun m!881639 () Bool)

(assert (=> b!948919 m!881639))

(declare-fun m!881641 () Bool)

(assert (=> b!948919 m!881641))

(assert (=> b!948919 m!881639))

(declare-fun m!881643 () Bool)

(assert (=> b!948919 m!881643))

(assert (=> b!948919 m!881599))

(assert (=> b!948919 m!881627))

(declare-fun m!881645 () Bool)

(assert (=> b!948919 m!881645))

(declare-fun m!881647 () Bool)

(assert (=> b!948919 m!881647))

(assert (=> b!948919 m!881631))

(declare-fun m!881649 () Bool)

(assert (=> b!948919 m!881649))

(declare-fun m!881651 () Bool)

(assert (=> b!948919 m!881651))

(assert (=> b!948919 m!881625))

(declare-fun m!881653 () Bool)

(assert (=> b!948919 m!881653))

(declare-fun m!881655 () Bool)

(assert (=> bm!41250 m!881655))

(assert (=> d!114941 m!881549))

(assert (=> b!948813 d!114941))

(declare-fun d!114943 () Bool)

(declare-fun res!636517 () Bool)

(declare-fun e!534209 () Bool)

(assert (=> d!114943 (=> (not res!636517) (not e!534209))))

(declare-fun simpleValid!369 (LongMapFixedSize!4902) Bool)

(assert (=> d!114943 (= res!636517 (simpleValid!369 thiss!1141))))

(assert (=> d!114943 (= (valid!1867 thiss!1141) e!534209)))

(declare-fun b!948943 () Bool)

(declare-fun res!636518 () Bool)

(assert (=> b!948943 (=> (not res!636518) (not e!534209))))

(declare-fun arrayCountValidKeys!0 (array!57440 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!948943 (= res!636518 (= (arrayCountValidKeys!0 (_keys!10678 thiss!1141) #b00000000000000000000000000000000 (size!28100 (_keys!10678 thiss!1141))) (_size!2506 thiss!1141)))))

(declare-fun b!948944 () Bool)

(declare-fun res!636519 () Bool)

(assert (=> b!948944 (=> (not res!636519) (not e!534209))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57440 (_ BitVec 32)) Bool)

(assert (=> b!948944 (= res!636519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10678 thiss!1141) (mask!27523 thiss!1141)))))

(declare-fun b!948945 () Bool)

(declare-datatypes ((List!19322 0))(
  ( (Nil!19319) (Cons!19318 (h!20476 (_ BitVec 64)) (t!27653 List!19322)) )
))
(declare-fun arrayNoDuplicates!0 (array!57440 (_ BitVec 32) List!19322) Bool)

(assert (=> b!948945 (= e!534209 (arrayNoDuplicates!0 (_keys!10678 thiss!1141) #b00000000000000000000000000000000 Nil!19319))))

(assert (= (and d!114943 res!636517) b!948943))

(assert (= (and b!948943 res!636518) b!948944))

(assert (= (and b!948944 res!636519) b!948945))

(declare-fun m!881657 () Bool)

(assert (=> d!114943 m!881657))

(declare-fun m!881659 () Bool)

(assert (=> b!948943 m!881659))

(declare-fun m!881661 () Bool)

(assert (=> b!948944 m!881661))

(declare-fun m!881663 () Bool)

(assert (=> b!948945 m!881663))

(assert (=> start!81024 d!114943))

(declare-fun condMapEmpty!32973 () Bool)

(declare-fun mapDefault!32973 () ValueCell!9876)

(assert (=> mapNonEmpty!32967 (= condMapEmpty!32973 (= mapRest!32967 ((as const (Array (_ BitVec 32) ValueCell!9876)) mapDefault!32973)))))

(declare-fun e!534214 () Bool)

(declare-fun mapRes!32973 () Bool)

(assert (=> mapNonEmpty!32967 (= tp!63200 (and e!534214 mapRes!32973))))

(declare-fun mapNonEmpty!32973 () Bool)

(declare-fun tp!63209 () Bool)

(declare-fun e!534215 () Bool)

(assert (=> mapNonEmpty!32973 (= mapRes!32973 (and tp!63209 e!534215))))

(declare-fun mapKey!32973 () (_ BitVec 32))

(declare-fun mapRest!32973 () (Array (_ BitVec 32) ValueCell!9876))

(declare-fun mapValue!32973 () ValueCell!9876)

(assert (=> mapNonEmpty!32973 (= mapRest!32967 (store mapRest!32973 mapKey!32973 mapValue!32973))))

(declare-fun mapIsEmpty!32973 () Bool)

(assert (=> mapIsEmpty!32973 mapRes!32973))

(declare-fun b!948953 () Bool)

(assert (=> b!948953 (= e!534214 tp_is_empty!20715)))

(declare-fun b!948952 () Bool)

(assert (=> b!948952 (= e!534215 tp_is_empty!20715)))

(assert (= (and mapNonEmpty!32967 condMapEmpty!32973) mapIsEmpty!32973))

(assert (= (and mapNonEmpty!32967 (not condMapEmpty!32973)) mapNonEmpty!32973))

(assert (= (and mapNonEmpty!32973 ((_ is ValueCellFull!9876) mapValue!32973)) b!948952))

(assert (= (and mapNonEmpty!32967 ((_ is ValueCellFull!9876) mapDefault!32973)) b!948953))

(declare-fun m!881665 () Bool)

(assert (=> mapNonEmpty!32973 m!881665))

(declare-fun b_lambda!14333 () Bool)

(assert (= b_lambda!14331 (or (and b!948810 b_free!18207) b_lambda!14333)))

(check-sat (not bm!41247) (not d!114941) (not d!114943) (not b!948919) (not mapNonEmpty!32973) (not b!948933) (not b!948860) (not d!114937) (not b!948934) (not b!948921) (not b!948926) (not bm!41250) (not bm!41249) b_and!29649 (not b!948923) (not b!948945) (not b_lambda!14333) (not bm!41244) tp_is_empty!20715 (not d!114939) (not b!948914) (not b!948922) (not b!948869) (not b!948871) (not b_next!18207) (not b!948943) (not b!948944))
(check-sat b_and!29649 (not b_next!18207))

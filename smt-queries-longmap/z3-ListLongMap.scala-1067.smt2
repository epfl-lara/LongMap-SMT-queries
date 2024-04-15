; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22088 () Bool)

(assert start!22088)

(declare-fun b!228981 () Bool)

(declare-fun b_free!6151 () Bool)

(declare-fun b_next!6151 () Bool)

(assert (=> b!228981 (= b_free!6151 (not b_next!6151))))

(declare-fun tp!21594 () Bool)

(declare-fun b_and!13023 () Bool)

(assert (=> b!228981 (= tp!21594 b_and!13023)))

(declare-fun b!228978 () Bool)

(declare-fun res!112679 () Bool)

(declare-datatypes ((V!7665 0))(
  ( (V!7666 (val!3051 Int)) )
))
(declare-datatypes ((ValueCell!2663 0))(
  ( (ValueCellFull!2663 (v!5065 V!7665)) (EmptyCell!2663) )
))
(declare-datatypes ((array!11261 0))(
  ( (array!11262 (arr!5349 (Array (_ BitVec 32) ValueCell!2663)) (size!5683 (_ BitVec 32))) )
))
(declare-datatypes ((array!11263 0))(
  ( (array!11264 (arr!5350 (Array (_ BitVec 32) (_ BitVec 64))) (size!5684 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3226 0))(
  ( (LongMapFixedSize!3227 (defaultEntry!4272 Int) (mask!10149 (_ BitVec 32)) (extraKeys!4009 (_ BitVec 32)) (zeroValue!4113 V!7665) (minValue!4113 V!7665) (_size!1662 (_ BitVec 32)) (_keys!6325 array!11263) (_values!4255 array!11261) (_vacant!1662 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3226)

(declare-datatypes ((SeekEntryResult!916 0))(
  ( (MissingZero!916 (index!5834 (_ BitVec 32))) (Found!916 (index!5835 (_ BitVec 32))) (Intermediate!916 (undefined!1728 Bool) (index!5836 (_ BitVec 32)) (x!23367 (_ BitVec 32))) (Undefined!916) (MissingVacant!916 (index!5837 (_ BitVec 32))) )
))
(declare-fun lt!115079 () SeekEntryResult!916)

(assert (=> b!228978 (= res!112679 (= (select (arr!5350 (_keys!6325 thiss!1504)) (index!5837 lt!115079)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!148558 () Bool)

(assert (=> b!228978 (=> (not res!112679) (not e!148558))))

(declare-fun b!228979 () Bool)

(declare-fun res!112680 () Bool)

(declare-fun e!148557 () Bool)

(assert (=> b!228979 (=> (not res!112680) (not e!148557))))

(assert (=> b!228979 (= res!112680 (= (select (arr!5350 (_keys!6325 thiss!1504)) (index!5834 lt!115079)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!228980 () Bool)

(declare-datatypes ((Unit!6951 0))(
  ( (Unit!6952) )
))
(declare-fun e!148549 () Unit!6951)

(declare-fun Unit!6953 () Unit!6951)

(assert (=> b!228980 (= e!148549 Unit!6953)))

(declare-fun mapNonEmpty!10189 () Bool)

(declare-fun mapRes!10189 () Bool)

(declare-fun tp!21595 () Bool)

(declare-fun e!148559 () Bool)

(assert (=> mapNonEmpty!10189 (= mapRes!10189 (and tp!21595 e!148559))))

(declare-fun mapRest!10189 () (Array (_ BitVec 32) ValueCell!2663))

(declare-fun mapValue!10189 () ValueCell!2663)

(declare-fun mapKey!10189 () (_ BitVec 32))

(assert (=> mapNonEmpty!10189 (= (arr!5349 (_values!4255 thiss!1504)) (store mapRest!10189 mapKey!10189 mapValue!10189))))

(declare-fun e!148553 () Bool)

(declare-fun tp_is_empty!6013 () Bool)

(declare-fun e!148550 () Bool)

(declare-fun array_inv!3529 (array!11263) Bool)

(declare-fun array_inv!3530 (array!11261) Bool)

(assert (=> b!228981 (= e!148553 (and tp!21594 tp_is_empty!6013 (array_inv!3529 (_keys!6325 thiss!1504)) (array_inv!3530 (_values!4255 thiss!1504)) e!148550))))

(declare-fun b!228982 () Bool)

(declare-fun res!112677 () Bool)

(declare-fun e!148551 () Bool)

(assert (=> b!228982 (=> (not res!112677) (not e!148551))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!228982 (= res!112677 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!228983 () Bool)

(declare-fun e!148563 () Bool)

(assert (=> b!228983 (= e!148563 true)))

(declare-fun lt!115082 () Bool)

(declare-datatypes ((List!3412 0))(
  ( (Nil!3409) (Cons!3408 (h!4056 (_ BitVec 64)) (t!8362 List!3412)) )
))
(declare-fun arrayNoDuplicates!0 (array!11263 (_ BitVec 32) List!3412) Bool)

(assert (=> b!228983 (= lt!115082 (arrayNoDuplicates!0 (_keys!6325 thiss!1504) #b00000000000000000000000000000000 Nil!3409))))

(declare-fun b!228984 () Bool)

(declare-fun e!148556 () Unit!6951)

(declare-fun Unit!6954 () Unit!6951)

(assert (=> b!228984 (= e!148556 Unit!6954)))

(declare-fun lt!115076 () Unit!6951)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!278 (array!11263 array!11261 (_ BitVec 32) (_ BitVec 32) V!7665 V!7665 (_ BitVec 64) Int) Unit!6951)

(assert (=> b!228984 (= lt!115076 (lemmaInListMapThenSeekEntryOrOpenFindsIt!278 (_keys!6325 thiss!1504) (_values!4255 thiss!1504) (mask!10149 thiss!1504) (extraKeys!4009 thiss!1504) (zeroValue!4113 thiss!1504) (minValue!4113 thiss!1504) key!932 (defaultEntry!4272 thiss!1504)))))

(assert (=> b!228984 false))

(declare-fun call!21263 () Bool)

(declare-fun c!37975 () Bool)

(declare-fun bm!21261 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21261 (= call!21263 (inRange!0 (ite c!37975 (index!5834 lt!115079) (index!5837 lt!115079)) (mask!10149 thiss!1504)))))

(declare-fun mapIsEmpty!10189 () Bool)

(assert (=> mapIsEmpty!10189 mapRes!10189))

(declare-fun b!228985 () Bool)

(declare-fun call!21264 () Bool)

(assert (=> b!228985 (= e!148558 (not call!21264))))

(declare-fun b!228986 () Bool)

(assert (=> b!228986 (= e!148559 tp_is_empty!6013)))

(declare-fun b!228987 () Bool)

(declare-fun res!112682 () Bool)

(assert (=> b!228987 (=> (not res!112682) (not e!148557))))

(assert (=> b!228987 (= res!112682 call!21263)))

(declare-fun e!148552 () Bool)

(assert (=> b!228987 (= e!148552 e!148557)))

(declare-fun b!228988 () Bool)

(declare-fun lt!115084 () Unit!6951)

(assert (=> b!228988 (= e!148556 lt!115084)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!275 (array!11263 array!11261 (_ BitVec 32) (_ BitVec 32) V!7665 V!7665 (_ BitVec 64) Int) Unit!6951)

(assert (=> b!228988 (= lt!115084 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!275 (_keys!6325 thiss!1504) (_values!4255 thiss!1504) (mask!10149 thiss!1504) (extraKeys!4009 thiss!1504) (zeroValue!4113 thiss!1504) (minValue!4113 thiss!1504) key!932 (defaultEntry!4272 thiss!1504)))))

(get-info :version)

(assert (=> b!228988 (= c!37975 ((_ is MissingZero!916) lt!115079))))

(assert (=> b!228988 e!148552))

(declare-fun b!228989 () Bool)

(declare-fun e!148560 () Bool)

(assert (=> b!228989 (= e!148560 e!148558)))

(declare-fun res!112676 () Bool)

(assert (=> b!228989 (= res!112676 call!21263)))

(assert (=> b!228989 (=> (not res!112676) (not e!148558))))

(declare-fun b!228990 () Bool)

(declare-fun e!148554 () Bool)

(assert (=> b!228990 (= e!148554 (not e!148563))))

(declare-fun res!112672 () Bool)

(assert (=> b!228990 (=> res!112672 e!148563)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!228990 (= res!112672 (not (validMask!0 (mask!10149 thiss!1504))))))

(declare-fun lt!115077 () array!11263)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11263 (_ BitVec 32)) Bool)

(assert (=> b!228990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!115077 (mask!10149 thiss!1504))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun lt!115078 () Unit!6951)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11263 (_ BitVec 32) (_ BitVec 32)) Unit!6951)

(assert (=> b!228990 (= lt!115078 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6325 thiss!1504) index!297 (mask!10149 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11263 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!228990 (= (arrayCountValidKeys!0 lt!115077 #b00000000000000000000000000000000 (size!5684 (_keys!6325 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6325 thiss!1504) #b00000000000000000000000000000000 (size!5684 (_keys!6325 thiss!1504)))))))

(declare-fun lt!115075 () Unit!6951)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11263 (_ BitVec 32) (_ BitVec 64)) Unit!6951)

(assert (=> b!228990 (= lt!115075 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6325 thiss!1504) index!297 key!932))))

(assert (=> b!228990 (arrayNoDuplicates!0 lt!115077 #b00000000000000000000000000000000 Nil!3409)))

(assert (=> b!228990 (= lt!115077 (array!11264 (store (arr!5350 (_keys!6325 thiss!1504)) index!297 key!932) (size!5684 (_keys!6325 thiss!1504))))))

(declare-fun lt!115080 () Unit!6951)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11263 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3412) Unit!6951)

(assert (=> b!228990 (= lt!115080 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6325 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3409))))

(declare-fun lt!115081 () Unit!6951)

(assert (=> b!228990 (= lt!115081 e!148549)))

(declare-fun c!37976 () Bool)

(declare-fun arrayContainsKey!0 (array!11263 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228990 (= c!37976 (arrayContainsKey!0 (_keys!6325 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun res!112673 () Bool)

(assert (=> start!22088 (=> (not res!112673) (not e!148551))))

(declare-fun valid!1301 (LongMapFixedSize!3226) Bool)

(assert (=> start!22088 (= res!112673 (valid!1301 thiss!1504))))

(assert (=> start!22088 e!148551))

(assert (=> start!22088 e!148553))

(assert (=> start!22088 true))

(declare-fun bm!21260 () Bool)

(assert (=> bm!21260 (= call!21264 (arrayContainsKey!0 (_keys!6325 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!228991 () Bool)

(declare-fun e!148555 () Bool)

(assert (=> b!228991 (= e!148555 e!148554)))

(declare-fun res!112681 () Bool)

(assert (=> b!228991 (=> (not res!112681) (not e!148554))))

(assert (=> b!228991 (= res!112681 (inRange!0 index!297 (mask!10149 thiss!1504)))))

(declare-fun lt!115083 () Unit!6951)

(assert (=> b!228991 (= lt!115083 e!148556)))

(declare-fun c!37977 () Bool)

(declare-datatypes ((tuple2!4476 0))(
  ( (tuple2!4477 (_1!2249 (_ BitVec 64)) (_2!2249 V!7665)) )
))
(declare-datatypes ((List!3413 0))(
  ( (Nil!3410) (Cons!3409 (h!4057 tuple2!4476) (t!8363 List!3413)) )
))
(declare-datatypes ((ListLongMap!3379 0))(
  ( (ListLongMap!3380 (toList!1705 List!3413)) )
))
(declare-fun contains!1580 (ListLongMap!3379 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1214 (array!11263 array!11261 (_ BitVec 32) (_ BitVec 32) V!7665 V!7665 (_ BitVec 32) Int) ListLongMap!3379)

(assert (=> b!228991 (= c!37977 (contains!1580 (getCurrentListMap!1214 (_keys!6325 thiss!1504) (_values!4255 thiss!1504) (mask!10149 thiss!1504) (extraKeys!4009 thiss!1504) (zeroValue!4113 thiss!1504) (minValue!4113 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4272 thiss!1504)) key!932))))

(declare-fun b!228992 () Bool)

(declare-fun e!148562 () Bool)

(assert (=> b!228992 (= e!148550 (and e!148562 mapRes!10189))))

(declare-fun condMapEmpty!10189 () Bool)

(declare-fun mapDefault!10189 () ValueCell!2663)

(assert (=> b!228992 (= condMapEmpty!10189 (= (arr!5349 (_values!4255 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2663)) mapDefault!10189)))))

(declare-fun b!228993 () Bool)

(assert (=> b!228993 (= e!148557 (not call!21264))))

(declare-fun b!228994 () Bool)

(assert (=> b!228994 (= e!148560 ((_ is Undefined!916) lt!115079))))

(declare-fun b!228995 () Bool)

(declare-fun res!112678 () Bool)

(assert (=> b!228995 (=> res!112678 e!148563)))

(assert (=> b!228995 (= res!112678 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6325 thiss!1504) (mask!10149 thiss!1504))))))

(declare-fun b!228996 () Bool)

(assert (=> b!228996 (= e!148562 tp_is_empty!6013)))

(declare-fun b!228997 () Bool)

(assert (=> b!228997 (= e!148551 e!148555)))

(declare-fun res!112674 () Bool)

(assert (=> b!228997 (=> (not res!112674) (not e!148555))))

(assert (=> b!228997 (= res!112674 (or (= lt!115079 (MissingZero!916 index!297)) (= lt!115079 (MissingVacant!916 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11263 (_ BitVec 32)) SeekEntryResult!916)

(assert (=> b!228997 (= lt!115079 (seekEntryOrOpen!0 key!932 (_keys!6325 thiss!1504) (mask!10149 thiss!1504)))))

(declare-fun b!228998 () Bool)

(declare-fun c!37978 () Bool)

(assert (=> b!228998 (= c!37978 ((_ is MissingVacant!916) lt!115079))))

(assert (=> b!228998 (= e!148552 e!148560)))

(declare-fun b!228999 () Bool)

(declare-fun res!112675 () Bool)

(assert (=> b!228999 (=> res!112675 e!148563)))

(assert (=> b!228999 (= res!112675 (or (not (= (size!5683 (_values!4255 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10149 thiss!1504)))) (not (= (size!5684 (_keys!6325 thiss!1504)) (size!5683 (_values!4255 thiss!1504)))) (bvslt (mask!10149 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4009 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4009 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!229000 () Bool)

(declare-fun Unit!6955 () Unit!6951)

(assert (=> b!229000 (= e!148549 Unit!6955)))

(declare-fun lt!115074 () Unit!6951)

(declare-fun lemmaArrayContainsKeyThenInListMap!119 (array!11263 array!11261 (_ BitVec 32) (_ BitVec 32) V!7665 V!7665 (_ BitVec 64) (_ BitVec 32) Int) Unit!6951)

(assert (=> b!229000 (= lt!115074 (lemmaArrayContainsKeyThenInListMap!119 (_keys!6325 thiss!1504) (_values!4255 thiss!1504) (mask!10149 thiss!1504) (extraKeys!4009 thiss!1504) (zeroValue!4113 thiss!1504) (minValue!4113 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4272 thiss!1504)))))

(assert (=> b!229000 false))

(assert (= (and start!22088 res!112673) b!228982))

(assert (= (and b!228982 res!112677) b!228997))

(assert (= (and b!228997 res!112674) b!228991))

(assert (= (and b!228991 c!37977) b!228984))

(assert (= (and b!228991 (not c!37977)) b!228988))

(assert (= (and b!228988 c!37975) b!228987))

(assert (= (and b!228988 (not c!37975)) b!228998))

(assert (= (and b!228987 res!112682) b!228979))

(assert (= (and b!228979 res!112680) b!228993))

(assert (= (and b!228998 c!37978) b!228989))

(assert (= (and b!228998 (not c!37978)) b!228994))

(assert (= (and b!228989 res!112676) b!228978))

(assert (= (and b!228978 res!112679) b!228985))

(assert (= (or b!228987 b!228989) bm!21261))

(assert (= (or b!228993 b!228985) bm!21260))

(assert (= (and b!228991 res!112681) b!228990))

(assert (= (and b!228990 c!37976) b!229000))

(assert (= (and b!228990 (not c!37976)) b!228980))

(assert (= (and b!228990 (not res!112672)) b!228999))

(assert (= (and b!228999 (not res!112675)) b!228995))

(assert (= (and b!228995 (not res!112678)) b!228983))

(assert (= (and b!228992 condMapEmpty!10189) mapIsEmpty!10189))

(assert (= (and b!228992 (not condMapEmpty!10189)) mapNonEmpty!10189))

(assert (= (and mapNonEmpty!10189 ((_ is ValueCellFull!2663) mapValue!10189)) b!228986))

(assert (= (and b!228992 ((_ is ValueCellFull!2663) mapDefault!10189)) b!228996))

(assert (= b!228981 b!228992))

(assert (= start!22088 b!228981))

(declare-fun m!250099 () Bool)

(assert (=> b!229000 m!250099))

(declare-fun m!250101 () Bool)

(assert (=> b!228995 m!250101))

(declare-fun m!250103 () Bool)

(assert (=> start!22088 m!250103))

(declare-fun m!250105 () Bool)

(assert (=> b!228984 m!250105))

(declare-fun m!250107 () Bool)

(assert (=> b!228979 m!250107))

(declare-fun m!250109 () Bool)

(assert (=> mapNonEmpty!10189 m!250109))

(declare-fun m!250111 () Bool)

(assert (=> b!228988 m!250111))

(declare-fun m!250113 () Bool)

(assert (=> b!228997 m!250113))

(declare-fun m!250115 () Bool)

(assert (=> b!228981 m!250115))

(declare-fun m!250117 () Bool)

(assert (=> b!228981 m!250117))

(declare-fun m!250119 () Bool)

(assert (=> b!228990 m!250119))

(declare-fun m!250121 () Bool)

(assert (=> b!228990 m!250121))

(declare-fun m!250123 () Bool)

(assert (=> b!228990 m!250123))

(declare-fun m!250125 () Bool)

(assert (=> b!228990 m!250125))

(declare-fun m!250127 () Bool)

(assert (=> b!228990 m!250127))

(declare-fun m!250129 () Bool)

(assert (=> b!228990 m!250129))

(declare-fun m!250131 () Bool)

(assert (=> b!228990 m!250131))

(declare-fun m!250133 () Bool)

(assert (=> b!228990 m!250133))

(declare-fun m!250135 () Bool)

(assert (=> b!228990 m!250135))

(declare-fun m!250137 () Bool)

(assert (=> b!228990 m!250137))

(declare-fun m!250139 () Bool)

(assert (=> b!228983 m!250139))

(declare-fun m!250141 () Bool)

(assert (=> b!228991 m!250141))

(declare-fun m!250143 () Bool)

(assert (=> b!228991 m!250143))

(assert (=> b!228991 m!250143))

(declare-fun m!250145 () Bool)

(assert (=> b!228991 m!250145))

(declare-fun m!250147 () Bool)

(assert (=> bm!21261 m!250147))

(declare-fun m!250149 () Bool)

(assert (=> b!228978 m!250149))

(assert (=> bm!21260 m!250121))

(check-sat (not b!228981) (not b!228997) (not bm!21261) (not b!228991) tp_is_empty!6013 (not b_next!6151) (not b!228990) (not b!228984) (not bm!21260) (not b!229000) (not b!228983) (not b!228988) (not b!228995) (not start!22088) b_and!13023 (not mapNonEmpty!10189))
(check-sat b_and!13023 (not b_next!6151))

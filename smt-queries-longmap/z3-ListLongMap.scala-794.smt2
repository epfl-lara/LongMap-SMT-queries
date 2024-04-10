; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18974 () Bool)

(assert start!18974)

(declare-fun b!187121 () Bool)

(declare-fun b_free!4605 () Bool)

(declare-fun b_next!4605 () Bool)

(assert (=> b!187121 (= b_free!4605 (not b_next!4605))))

(declare-fun tp!16625 () Bool)

(declare-fun b_and!11221 () Bool)

(assert (=> b!187121 (= tp!16625 b_and!11221)))

(declare-fun b!187111 () Bool)

(declare-datatypes ((Unit!5636 0))(
  ( (Unit!5637) )
))
(declare-fun e!123143 () Unit!5636)

(declare-fun lt!92546 () Unit!5636)

(assert (=> b!187111 (= e!123143 lt!92546)))

(declare-datatypes ((V!5483 0))(
  ( (V!5484 (val!2233 Int)) )
))
(declare-datatypes ((ValueCell!1845 0))(
  ( (ValueCellFull!1845 (v!4147 V!5483)) (EmptyCell!1845) )
))
(declare-datatypes ((array!7969 0))(
  ( (array!7970 (arr!3761 (Array (_ BitVec 32) (_ BitVec 64))) (size!4079 (_ BitVec 32))) )
))
(declare-datatypes ((array!7971 0))(
  ( (array!7972 (arr!3762 (Array (_ BitVec 32) ValueCell!1845)) (size!4080 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2598 0))(
  ( (LongMapFixedSize!2599 (defaultEntry!3816 Int) (mask!8956 (_ BitVec 32)) (extraKeys!3553 (_ BitVec 32)) (zeroValue!3657 V!5483) (minValue!3657 V!5483) (_size!1348 (_ BitVec 32)) (_keys!5766 array!7969) (_values!3799 array!7971) (_vacant!1348 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2598)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!148 (array!7969 array!7971 (_ BitVec 32) (_ BitVec 32) V!5483 V!5483 (_ BitVec 64) Int) Unit!5636)

(assert (=> b!187111 (= lt!92546 (lemmaInListMapThenSeekEntryOrOpenFindsIt!148 (_keys!5766 thiss!1248) (_values!3799 thiss!1248) (mask!8956 thiss!1248) (extraKeys!3553 thiss!1248) (zeroValue!3657 thiss!1248) (minValue!3657 thiss!1248) key!828 (defaultEntry!3816 thiss!1248)))))

(declare-fun res!88491 () Bool)

(declare-datatypes ((SeekEntryResult!646 0))(
  ( (MissingZero!646 (index!4754 (_ BitVec 32))) (Found!646 (index!4755 (_ BitVec 32))) (Intermediate!646 (undefined!1458 Bool) (index!4756 (_ BitVec 32)) (x!20262 (_ BitVec 32))) (Undefined!646) (MissingVacant!646 (index!4757 (_ BitVec 32))) )
))
(declare-fun lt!92545 () SeekEntryResult!646)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!187111 (= res!88491 (inRange!0 (index!4755 lt!92545) (mask!8956 thiss!1248)))))

(declare-fun e!123148 () Bool)

(assert (=> b!187111 (=> (not res!88491) (not e!123148))))

(assert (=> b!187111 e!123148))

(declare-fun res!88488 () Bool)

(declare-fun e!123140 () Bool)

(assert (=> start!18974 (=> (not res!88488) (not e!123140))))

(declare-fun valid!1069 (LongMapFixedSize!2598) Bool)

(assert (=> start!18974 (= res!88488 (valid!1069 thiss!1248))))

(assert (=> start!18974 e!123140))

(declare-fun e!123146 () Bool)

(assert (=> start!18974 e!123146))

(assert (=> start!18974 true))

(declare-fun b!187112 () Bool)

(declare-fun e!123144 () Bool)

(declare-fun e!123145 () Bool)

(declare-fun mapRes!7538 () Bool)

(assert (=> b!187112 (= e!123144 (and e!123145 mapRes!7538))))

(declare-fun condMapEmpty!7538 () Bool)

(declare-fun mapDefault!7538 () ValueCell!1845)

(assert (=> b!187112 (= condMapEmpty!7538 (= (arr!3762 (_values!3799 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1845)) mapDefault!7538)))))

(declare-fun mapIsEmpty!7538 () Bool)

(assert (=> mapIsEmpty!7538 mapRes!7538))

(declare-fun b!187113 () Bool)

(declare-fun tp_is_empty!4377 () Bool)

(assert (=> b!187113 (= e!123145 tp_is_empty!4377)))

(declare-fun b!187114 () Bool)

(declare-fun e!123142 () Bool)

(assert (=> b!187114 (= e!123142 (and (= (size!4080 (_values!3799 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8956 thiss!1248))) (= (size!4079 (_keys!5766 thiss!1248)) (size!4080 (_values!3799 thiss!1248))) (bvslt (mask!8956 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!187115 () Bool)

(declare-fun Unit!5638 () Unit!5636)

(assert (=> b!187115 (= e!123143 Unit!5638)))

(declare-fun lt!92547 () Unit!5636)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!151 (array!7969 array!7971 (_ BitVec 32) (_ BitVec 32) V!5483 V!5483 (_ BitVec 64) Int) Unit!5636)

(assert (=> b!187115 (= lt!92547 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!151 (_keys!5766 thiss!1248) (_values!3799 thiss!1248) (mask!8956 thiss!1248) (extraKeys!3553 thiss!1248) (zeroValue!3657 thiss!1248) (minValue!3657 thiss!1248) key!828 (defaultEntry!3816 thiss!1248)))))

(assert (=> b!187115 false))

(declare-fun b!187116 () Bool)

(declare-fun e!123149 () Bool)

(assert (=> b!187116 (= e!123140 e!123149)))

(declare-fun res!88487 () Bool)

(assert (=> b!187116 (=> (not res!88487) (not e!123149))))

(get-info :version)

(assert (=> b!187116 (= res!88487 (and (not ((_ is Undefined!646) lt!92545)) (not ((_ is MissingVacant!646) lt!92545)) (not ((_ is MissingZero!646) lt!92545)) ((_ is Found!646) lt!92545)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7969 (_ BitVec 32)) SeekEntryResult!646)

(assert (=> b!187116 (= lt!92545 (seekEntryOrOpen!0 key!828 (_keys!5766 thiss!1248) (mask!8956 thiss!1248)))))

(declare-fun b!187117 () Bool)

(assert (=> b!187117 (= e!123148 (= (select (arr!3761 (_keys!5766 thiss!1248)) (index!4755 lt!92545)) key!828))))

(declare-fun b!187118 () Bool)

(assert (=> b!187118 (= e!123149 e!123142)))

(declare-fun res!88490 () Bool)

(assert (=> b!187118 (=> (not res!88490) (not e!123142))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!187118 (= res!88490 (validMask!0 (mask!8956 thiss!1248)))))

(declare-fun lt!92548 () Unit!5636)

(assert (=> b!187118 (= lt!92548 e!123143)))

(declare-fun c!33585 () Bool)

(declare-datatypes ((tuple2!3474 0))(
  ( (tuple2!3475 (_1!1748 (_ BitVec 64)) (_2!1748 V!5483)) )
))
(declare-datatypes ((List!2379 0))(
  ( (Nil!2376) (Cons!2375 (h!3010 tuple2!3474) (t!7269 List!2379)) )
))
(declare-datatypes ((ListLongMap!2391 0))(
  ( (ListLongMap!2392 (toList!1211 List!2379)) )
))
(declare-fun contains!1311 (ListLongMap!2391 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!859 (array!7969 array!7971 (_ BitVec 32) (_ BitVec 32) V!5483 V!5483 (_ BitVec 32) Int) ListLongMap!2391)

(assert (=> b!187118 (= c!33585 (contains!1311 (getCurrentListMap!859 (_keys!5766 thiss!1248) (_values!3799 thiss!1248) (mask!8956 thiss!1248) (extraKeys!3553 thiss!1248) (zeroValue!3657 thiss!1248) (minValue!3657 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3816 thiss!1248)) key!828))))

(declare-fun b!187119 () Bool)

(declare-fun e!123147 () Bool)

(assert (=> b!187119 (= e!123147 tp_is_empty!4377)))

(declare-fun b!187120 () Bool)

(declare-fun res!88489 () Bool)

(assert (=> b!187120 (=> (not res!88489) (not e!123140))))

(assert (=> b!187120 (= res!88489 (not (= key!828 (bvneg key!828))))))

(declare-fun array_inv!2433 (array!7969) Bool)

(declare-fun array_inv!2434 (array!7971) Bool)

(assert (=> b!187121 (= e!123146 (and tp!16625 tp_is_empty!4377 (array_inv!2433 (_keys!5766 thiss!1248)) (array_inv!2434 (_values!3799 thiss!1248)) e!123144))))

(declare-fun mapNonEmpty!7538 () Bool)

(declare-fun tp!16624 () Bool)

(assert (=> mapNonEmpty!7538 (= mapRes!7538 (and tp!16624 e!123147))))

(declare-fun mapValue!7538 () ValueCell!1845)

(declare-fun mapRest!7538 () (Array (_ BitVec 32) ValueCell!1845))

(declare-fun mapKey!7538 () (_ BitVec 32))

(assert (=> mapNonEmpty!7538 (= (arr!3762 (_values!3799 thiss!1248)) (store mapRest!7538 mapKey!7538 mapValue!7538))))

(assert (= (and start!18974 res!88488) b!187120))

(assert (= (and b!187120 res!88489) b!187116))

(assert (= (and b!187116 res!88487) b!187118))

(assert (= (and b!187118 c!33585) b!187111))

(assert (= (and b!187118 (not c!33585)) b!187115))

(assert (= (and b!187111 res!88491) b!187117))

(assert (= (and b!187118 res!88490) b!187114))

(assert (= (and b!187112 condMapEmpty!7538) mapIsEmpty!7538))

(assert (= (and b!187112 (not condMapEmpty!7538)) mapNonEmpty!7538))

(assert (= (and mapNonEmpty!7538 ((_ is ValueCellFull!1845) mapValue!7538)) b!187119))

(assert (= (and b!187112 ((_ is ValueCellFull!1845) mapDefault!7538)) b!187113))

(assert (= b!187121 b!187112))

(assert (= start!18974 b!187121))

(declare-fun m!213991 () Bool)

(assert (=> b!187116 m!213991))

(declare-fun m!213993 () Bool)

(assert (=> mapNonEmpty!7538 m!213993))

(declare-fun m!213995 () Bool)

(assert (=> start!18974 m!213995))

(declare-fun m!213997 () Bool)

(assert (=> b!187115 m!213997))

(declare-fun m!213999 () Bool)

(assert (=> b!187111 m!213999))

(declare-fun m!214001 () Bool)

(assert (=> b!187111 m!214001))

(declare-fun m!214003 () Bool)

(assert (=> b!187118 m!214003))

(declare-fun m!214005 () Bool)

(assert (=> b!187118 m!214005))

(assert (=> b!187118 m!214005))

(declare-fun m!214007 () Bool)

(assert (=> b!187118 m!214007))

(declare-fun m!214009 () Bool)

(assert (=> b!187117 m!214009))

(declare-fun m!214011 () Bool)

(assert (=> b!187121 m!214011))

(declare-fun m!214013 () Bool)

(assert (=> b!187121 m!214013))

(check-sat (not b!187116) (not b!187118) tp_is_empty!4377 b_and!11221 (not b_next!4605) (not b!187111) (not mapNonEmpty!7538) (not b!187115) (not b!187121) (not start!18974))
(check-sat b_and!11221 (not b_next!4605))
(get-model)

(declare-fun b!187167 () Bool)

(declare-fun e!123187 () SeekEntryResult!646)

(declare-fun lt!92569 () SeekEntryResult!646)

(assert (=> b!187167 (= e!123187 (Found!646 (index!4756 lt!92569)))))

(declare-fun b!187168 () Bool)

(declare-fun c!33595 () Bool)

(declare-fun lt!92568 () (_ BitVec 64))

(assert (=> b!187168 (= c!33595 (= lt!92568 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!123188 () SeekEntryResult!646)

(assert (=> b!187168 (= e!123187 e!123188)))

(declare-fun d!55377 () Bool)

(declare-fun lt!92567 () SeekEntryResult!646)

(assert (=> d!55377 (and (or ((_ is Undefined!646) lt!92567) (not ((_ is Found!646) lt!92567)) (and (bvsge (index!4755 lt!92567) #b00000000000000000000000000000000) (bvslt (index!4755 lt!92567) (size!4079 (_keys!5766 thiss!1248))))) (or ((_ is Undefined!646) lt!92567) ((_ is Found!646) lt!92567) (not ((_ is MissingZero!646) lt!92567)) (and (bvsge (index!4754 lt!92567) #b00000000000000000000000000000000) (bvslt (index!4754 lt!92567) (size!4079 (_keys!5766 thiss!1248))))) (or ((_ is Undefined!646) lt!92567) ((_ is Found!646) lt!92567) ((_ is MissingZero!646) lt!92567) (not ((_ is MissingVacant!646) lt!92567)) (and (bvsge (index!4757 lt!92567) #b00000000000000000000000000000000) (bvslt (index!4757 lt!92567) (size!4079 (_keys!5766 thiss!1248))))) (or ((_ is Undefined!646) lt!92567) (ite ((_ is Found!646) lt!92567) (= (select (arr!3761 (_keys!5766 thiss!1248)) (index!4755 lt!92567)) key!828) (ite ((_ is MissingZero!646) lt!92567) (= (select (arr!3761 (_keys!5766 thiss!1248)) (index!4754 lt!92567)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!646) lt!92567) (= (select (arr!3761 (_keys!5766 thiss!1248)) (index!4757 lt!92567)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!123186 () SeekEntryResult!646)

(assert (=> d!55377 (= lt!92567 e!123186)))

(declare-fun c!33596 () Bool)

(assert (=> d!55377 (= c!33596 (and ((_ is Intermediate!646) lt!92569) (undefined!1458 lt!92569)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7969 (_ BitVec 32)) SeekEntryResult!646)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55377 (= lt!92569 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8956 thiss!1248)) key!828 (_keys!5766 thiss!1248) (mask!8956 thiss!1248)))))

(assert (=> d!55377 (validMask!0 (mask!8956 thiss!1248))))

(assert (=> d!55377 (= (seekEntryOrOpen!0 key!828 (_keys!5766 thiss!1248) (mask!8956 thiss!1248)) lt!92567)))

(declare-fun b!187169 () Bool)

(assert (=> b!187169 (= e!123186 Undefined!646)))

(declare-fun b!187170 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7969 (_ BitVec 32)) SeekEntryResult!646)

(assert (=> b!187170 (= e!123188 (seekKeyOrZeroReturnVacant!0 (x!20262 lt!92569) (index!4756 lt!92569) (index!4756 lt!92569) key!828 (_keys!5766 thiss!1248) (mask!8956 thiss!1248)))))

(declare-fun b!187171 () Bool)

(assert (=> b!187171 (= e!123186 e!123187)))

(assert (=> b!187171 (= lt!92568 (select (arr!3761 (_keys!5766 thiss!1248)) (index!4756 lt!92569)))))

(declare-fun c!33597 () Bool)

(assert (=> b!187171 (= c!33597 (= lt!92568 key!828))))

(declare-fun b!187172 () Bool)

(assert (=> b!187172 (= e!123188 (MissingZero!646 (index!4756 lt!92569)))))

(assert (= (and d!55377 c!33596) b!187169))

(assert (= (and d!55377 (not c!33596)) b!187171))

(assert (= (and b!187171 c!33597) b!187167))

(assert (= (and b!187171 (not c!33597)) b!187168))

(assert (= (and b!187168 c!33595) b!187172))

(assert (= (and b!187168 (not c!33595)) b!187170))

(assert (=> d!55377 m!214003))

(declare-fun m!214039 () Bool)

(assert (=> d!55377 m!214039))

(declare-fun m!214041 () Bool)

(assert (=> d!55377 m!214041))

(declare-fun m!214043 () Bool)

(assert (=> d!55377 m!214043))

(declare-fun m!214045 () Bool)

(assert (=> d!55377 m!214045))

(declare-fun m!214047 () Bool)

(assert (=> d!55377 m!214047))

(assert (=> d!55377 m!214039))

(declare-fun m!214049 () Bool)

(assert (=> b!187170 m!214049))

(declare-fun m!214051 () Bool)

(assert (=> b!187171 m!214051))

(assert (=> b!187116 d!55377))

(declare-fun d!55379 () Bool)

(assert (=> d!55379 (= (array_inv!2433 (_keys!5766 thiss!1248)) (bvsge (size!4079 (_keys!5766 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!187121 d!55379))

(declare-fun d!55381 () Bool)

(assert (=> d!55381 (= (array_inv!2434 (_values!3799 thiss!1248)) (bvsge (size!4080 (_values!3799 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!187121 d!55381))

(declare-fun d!55383 () Bool)

(declare-fun e!123191 () Bool)

(assert (=> d!55383 e!123191))

(declare-fun res!88512 () Bool)

(assert (=> d!55383 (=> (not res!88512) (not e!123191))))

(declare-fun lt!92574 () SeekEntryResult!646)

(assert (=> d!55383 (= res!88512 ((_ is Found!646) lt!92574))))

(assert (=> d!55383 (= lt!92574 (seekEntryOrOpen!0 key!828 (_keys!5766 thiss!1248) (mask!8956 thiss!1248)))))

(declare-fun lt!92575 () Unit!5636)

(declare-fun choose!994 (array!7969 array!7971 (_ BitVec 32) (_ BitVec 32) V!5483 V!5483 (_ BitVec 64) Int) Unit!5636)

(assert (=> d!55383 (= lt!92575 (choose!994 (_keys!5766 thiss!1248) (_values!3799 thiss!1248) (mask!8956 thiss!1248) (extraKeys!3553 thiss!1248) (zeroValue!3657 thiss!1248) (minValue!3657 thiss!1248) key!828 (defaultEntry!3816 thiss!1248)))))

(assert (=> d!55383 (validMask!0 (mask!8956 thiss!1248))))

(assert (=> d!55383 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!148 (_keys!5766 thiss!1248) (_values!3799 thiss!1248) (mask!8956 thiss!1248) (extraKeys!3553 thiss!1248) (zeroValue!3657 thiss!1248) (minValue!3657 thiss!1248) key!828 (defaultEntry!3816 thiss!1248)) lt!92575)))

(declare-fun b!187177 () Bool)

(declare-fun res!88511 () Bool)

(assert (=> b!187177 (=> (not res!88511) (not e!123191))))

(assert (=> b!187177 (= res!88511 (inRange!0 (index!4755 lt!92574) (mask!8956 thiss!1248)))))

(declare-fun b!187178 () Bool)

(assert (=> b!187178 (= e!123191 (= (select (arr!3761 (_keys!5766 thiss!1248)) (index!4755 lt!92574)) key!828))))

(assert (=> b!187178 (and (bvsge (index!4755 lt!92574) #b00000000000000000000000000000000) (bvslt (index!4755 lt!92574) (size!4079 (_keys!5766 thiss!1248))))))

(assert (= (and d!55383 res!88512) b!187177))

(assert (= (and b!187177 res!88511) b!187178))

(assert (=> d!55383 m!213991))

(declare-fun m!214053 () Bool)

(assert (=> d!55383 m!214053))

(assert (=> d!55383 m!214003))

(declare-fun m!214055 () Bool)

(assert (=> b!187177 m!214055))

(declare-fun m!214057 () Bool)

(assert (=> b!187178 m!214057))

(assert (=> b!187111 d!55383))

(declare-fun d!55385 () Bool)

(assert (=> d!55385 (= (inRange!0 (index!4755 lt!92545) (mask!8956 thiss!1248)) (and (bvsge (index!4755 lt!92545) #b00000000000000000000000000000000) (bvslt (index!4755 lt!92545) (bvadd (mask!8956 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!187111 d!55385))

(declare-fun b!187195 () Bool)

(declare-fun e!123202 () Bool)

(declare-fun call!18861 () Bool)

(assert (=> b!187195 (= e!123202 (not call!18861))))

(declare-fun b!187196 () Bool)

(declare-fun e!123203 () Bool)

(declare-fun e!123201 () Bool)

(assert (=> b!187196 (= e!123203 e!123201)))

(declare-fun res!88523 () Bool)

(declare-fun call!18862 () Bool)

(assert (=> b!187196 (= res!88523 call!18862)))

(assert (=> b!187196 (=> (not res!88523) (not e!123201))))

(declare-fun c!33602 () Bool)

(declare-fun lt!92581 () SeekEntryResult!646)

(declare-fun bm!18858 () Bool)

(assert (=> bm!18858 (= call!18862 (inRange!0 (ite c!33602 (index!4754 lt!92581) (index!4757 lt!92581)) (mask!8956 thiss!1248)))))

(declare-fun b!187197 () Bool)

(assert (=> b!187197 (= e!123201 (not call!18861))))

(declare-fun b!187198 () Bool)

(declare-fun e!123200 () Bool)

(assert (=> b!187198 (= e!123200 ((_ is Undefined!646) lt!92581))))

(declare-fun d!55387 () Bool)

(assert (=> d!55387 e!123203))

(assert (=> d!55387 (= c!33602 ((_ is MissingZero!646) lt!92581))))

(assert (=> d!55387 (= lt!92581 (seekEntryOrOpen!0 key!828 (_keys!5766 thiss!1248) (mask!8956 thiss!1248)))))

(declare-fun lt!92580 () Unit!5636)

(declare-fun choose!995 (array!7969 array!7971 (_ BitVec 32) (_ BitVec 32) V!5483 V!5483 (_ BitVec 64) Int) Unit!5636)

(assert (=> d!55387 (= lt!92580 (choose!995 (_keys!5766 thiss!1248) (_values!3799 thiss!1248) (mask!8956 thiss!1248) (extraKeys!3553 thiss!1248) (zeroValue!3657 thiss!1248) (minValue!3657 thiss!1248) key!828 (defaultEntry!3816 thiss!1248)))))

(assert (=> d!55387 (validMask!0 (mask!8956 thiss!1248))))

(assert (=> d!55387 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!151 (_keys!5766 thiss!1248) (_values!3799 thiss!1248) (mask!8956 thiss!1248) (extraKeys!3553 thiss!1248) (zeroValue!3657 thiss!1248) (minValue!3657 thiss!1248) key!828 (defaultEntry!3816 thiss!1248)) lt!92580)))

(declare-fun b!187199 () Bool)

(declare-fun res!88522 () Bool)

(assert (=> b!187199 (=> (not res!88522) (not e!123202))))

(assert (=> b!187199 (= res!88522 call!18862)))

(assert (=> b!187199 (= e!123200 e!123202)))

(declare-fun b!187200 () Bool)

(assert (=> b!187200 (and (bvsge (index!4754 lt!92581) #b00000000000000000000000000000000) (bvslt (index!4754 lt!92581) (size!4079 (_keys!5766 thiss!1248))))))

(declare-fun res!88524 () Bool)

(assert (=> b!187200 (= res!88524 (= (select (arr!3761 (_keys!5766 thiss!1248)) (index!4754 lt!92581)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!187200 (=> (not res!88524) (not e!123201))))

(declare-fun bm!18859 () Bool)

(declare-fun arrayContainsKey!0 (array!7969 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!18859 (= call!18861 (arrayContainsKey!0 (_keys!5766 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!187201 () Bool)

(declare-fun res!88521 () Bool)

(assert (=> b!187201 (=> (not res!88521) (not e!123202))))

(assert (=> b!187201 (= res!88521 (= (select (arr!3761 (_keys!5766 thiss!1248)) (index!4757 lt!92581)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!187201 (and (bvsge (index!4757 lt!92581) #b00000000000000000000000000000000) (bvslt (index!4757 lt!92581) (size!4079 (_keys!5766 thiss!1248))))))

(declare-fun b!187202 () Bool)

(assert (=> b!187202 (= e!123203 e!123200)))

(declare-fun c!33603 () Bool)

(assert (=> b!187202 (= c!33603 ((_ is MissingVacant!646) lt!92581))))

(assert (= (and d!55387 c!33602) b!187196))

(assert (= (and d!55387 (not c!33602)) b!187202))

(assert (= (and b!187196 res!88523) b!187200))

(assert (= (and b!187200 res!88524) b!187197))

(assert (= (and b!187202 c!33603) b!187199))

(assert (= (and b!187202 (not c!33603)) b!187198))

(assert (= (and b!187199 res!88522) b!187201))

(assert (= (and b!187201 res!88521) b!187195))

(assert (= (or b!187196 b!187199) bm!18858))

(assert (= (or b!187197 b!187195) bm!18859))

(declare-fun m!214059 () Bool)

(assert (=> bm!18859 m!214059))

(declare-fun m!214061 () Bool)

(assert (=> b!187201 m!214061))

(declare-fun m!214063 () Bool)

(assert (=> bm!18858 m!214063))

(assert (=> d!55387 m!213991))

(declare-fun m!214065 () Bool)

(assert (=> d!55387 m!214065))

(assert (=> d!55387 m!214003))

(declare-fun m!214067 () Bool)

(assert (=> b!187200 m!214067))

(assert (=> b!187115 d!55387))

(declare-fun d!55389 () Bool)

(assert (=> d!55389 (= (validMask!0 (mask!8956 thiss!1248)) (and (or (= (mask!8956 thiss!1248) #b00000000000000000000000000000111) (= (mask!8956 thiss!1248) #b00000000000000000000000000001111) (= (mask!8956 thiss!1248) #b00000000000000000000000000011111) (= (mask!8956 thiss!1248) #b00000000000000000000000000111111) (= (mask!8956 thiss!1248) #b00000000000000000000000001111111) (= (mask!8956 thiss!1248) #b00000000000000000000000011111111) (= (mask!8956 thiss!1248) #b00000000000000000000000111111111) (= (mask!8956 thiss!1248) #b00000000000000000000001111111111) (= (mask!8956 thiss!1248) #b00000000000000000000011111111111) (= (mask!8956 thiss!1248) #b00000000000000000000111111111111) (= (mask!8956 thiss!1248) #b00000000000000000001111111111111) (= (mask!8956 thiss!1248) #b00000000000000000011111111111111) (= (mask!8956 thiss!1248) #b00000000000000000111111111111111) (= (mask!8956 thiss!1248) #b00000000000000001111111111111111) (= (mask!8956 thiss!1248) #b00000000000000011111111111111111) (= (mask!8956 thiss!1248) #b00000000000000111111111111111111) (= (mask!8956 thiss!1248) #b00000000000001111111111111111111) (= (mask!8956 thiss!1248) #b00000000000011111111111111111111) (= (mask!8956 thiss!1248) #b00000000000111111111111111111111) (= (mask!8956 thiss!1248) #b00000000001111111111111111111111) (= (mask!8956 thiss!1248) #b00000000011111111111111111111111) (= (mask!8956 thiss!1248) #b00000000111111111111111111111111) (= (mask!8956 thiss!1248) #b00000001111111111111111111111111) (= (mask!8956 thiss!1248) #b00000011111111111111111111111111) (= (mask!8956 thiss!1248) #b00000111111111111111111111111111) (= (mask!8956 thiss!1248) #b00001111111111111111111111111111) (= (mask!8956 thiss!1248) #b00011111111111111111111111111111) (= (mask!8956 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8956 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!187118 d!55389))

(declare-fun d!55391 () Bool)

(declare-fun e!123208 () Bool)

(assert (=> d!55391 e!123208))

(declare-fun res!88527 () Bool)

(assert (=> d!55391 (=> res!88527 e!123208)))

(declare-fun lt!92592 () Bool)

(assert (=> d!55391 (= res!88527 (not lt!92592))))

(declare-fun lt!92593 () Bool)

(assert (=> d!55391 (= lt!92592 lt!92593)))

(declare-fun lt!92591 () Unit!5636)

(declare-fun e!123209 () Unit!5636)

(assert (=> d!55391 (= lt!92591 e!123209)))

(declare-fun c!33606 () Bool)

(assert (=> d!55391 (= c!33606 lt!92593)))

(declare-fun containsKey!231 (List!2379 (_ BitVec 64)) Bool)

(assert (=> d!55391 (= lt!92593 (containsKey!231 (toList!1211 (getCurrentListMap!859 (_keys!5766 thiss!1248) (_values!3799 thiss!1248) (mask!8956 thiss!1248) (extraKeys!3553 thiss!1248) (zeroValue!3657 thiss!1248) (minValue!3657 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3816 thiss!1248))) key!828))))

(assert (=> d!55391 (= (contains!1311 (getCurrentListMap!859 (_keys!5766 thiss!1248) (_values!3799 thiss!1248) (mask!8956 thiss!1248) (extraKeys!3553 thiss!1248) (zeroValue!3657 thiss!1248) (minValue!3657 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3816 thiss!1248)) key!828) lt!92592)))

(declare-fun b!187209 () Bool)

(declare-fun lt!92590 () Unit!5636)

(assert (=> b!187209 (= e!123209 lt!92590)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!179 (List!2379 (_ BitVec 64)) Unit!5636)

(assert (=> b!187209 (= lt!92590 (lemmaContainsKeyImpliesGetValueByKeyDefined!179 (toList!1211 (getCurrentListMap!859 (_keys!5766 thiss!1248) (_values!3799 thiss!1248) (mask!8956 thiss!1248) (extraKeys!3553 thiss!1248) (zeroValue!3657 thiss!1248) (minValue!3657 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3816 thiss!1248))) key!828))))

(declare-datatypes ((Option!233 0))(
  ( (Some!232 (v!4149 V!5483)) (None!231) )
))
(declare-fun isDefined!180 (Option!233) Bool)

(declare-fun getValueByKey!227 (List!2379 (_ BitVec 64)) Option!233)

(assert (=> b!187209 (isDefined!180 (getValueByKey!227 (toList!1211 (getCurrentListMap!859 (_keys!5766 thiss!1248) (_values!3799 thiss!1248) (mask!8956 thiss!1248) (extraKeys!3553 thiss!1248) (zeroValue!3657 thiss!1248) (minValue!3657 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3816 thiss!1248))) key!828))))

(declare-fun b!187210 () Bool)

(declare-fun Unit!5642 () Unit!5636)

(assert (=> b!187210 (= e!123209 Unit!5642)))

(declare-fun b!187211 () Bool)

(assert (=> b!187211 (= e!123208 (isDefined!180 (getValueByKey!227 (toList!1211 (getCurrentListMap!859 (_keys!5766 thiss!1248) (_values!3799 thiss!1248) (mask!8956 thiss!1248) (extraKeys!3553 thiss!1248) (zeroValue!3657 thiss!1248) (minValue!3657 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3816 thiss!1248))) key!828)))))

(assert (= (and d!55391 c!33606) b!187209))

(assert (= (and d!55391 (not c!33606)) b!187210))

(assert (= (and d!55391 (not res!88527)) b!187211))

(declare-fun m!214069 () Bool)

(assert (=> d!55391 m!214069))

(declare-fun m!214071 () Bool)

(assert (=> b!187209 m!214071))

(declare-fun m!214073 () Bool)

(assert (=> b!187209 m!214073))

(assert (=> b!187209 m!214073))

(declare-fun m!214075 () Bool)

(assert (=> b!187209 m!214075))

(assert (=> b!187211 m!214073))

(assert (=> b!187211 m!214073))

(assert (=> b!187211 m!214075))

(assert (=> b!187118 d!55391))

(declare-fun c!33624 () Bool)

(declare-fun call!18879 () ListLongMap!2391)

(declare-fun bm!18874 () Bool)

(declare-fun call!18882 () ListLongMap!2391)

(declare-fun call!18878 () ListLongMap!2391)

(declare-fun call!18883 () ListLongMap!2391)

(declare-fun c!33619 () Bool)

(declare-fun +!290 (ListLongMap!2391 tuple2!3474) ListLongMap!2391)

(assert (=> bm!18874 (= call!18883 (+!290 (ite c!33619 call!18878 (ite c!33624 call!18882 call!18879)) (ite (or c!33619 c!33624) (tuple2!3475 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3657 thiss!1248)) (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3657 thiss!1248)))))))

(declare-fun b!187254 () Bool)

(declare-fun e!123238 () Bool)

(declare-fun e!123242 () Bool)

(assert (=> b!187254 (= e!123238 e!123242)))

(declare-fun res!88547 () Bool)

(declare-fun call!18877 () Bool)

(assert (=> b!187254 (= res!88547 call!18877)))

(assert (=> b!187254 (=> (not res!88547) (not e!123242))))

(declare-fun b!187255 () Bool)

(declare-fun e!123237 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!187255 (= e!123237 (validKeyInArray!0 (select (arr!3761 (_keys!5766 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!187256 () Bool)

(assert (=> b!187256 (= e!123238 (not call!18877))))

(declare-fun b!187257 () Bool)

(declare-fun e!123247 () Bool)

(declare-fun lt!92646 () ListLongMap!2391)

(declare-fun apply!170 (ListLongMap!2391 (_ BitVec 64)) V!5483)

(assert (=> b!187257 (= e!123247 (= (apply!170 lt!92646 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3657 thiss!1248)))))

(declare-fun b!187258 () Bool)

(declare-fun e!123246 () ListLongMap!2391)

(declare-fun call!18881 () ListLongMap!2391)

(assert (=> b!187258 (= e!123246 call!18881)))

(declare-fun b!187259 () Bool)

(declare-fun c!33622 () Bool)

(assert (=> b!187259 (= c!33622 (and (not (= (bvand (extraKeys!3553 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3553 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!123245 () ListLongMap!2391)

(assert (=> b!187259 (= e!123245 e!123246)))

(declare-fun b!187260 () Bool)

(assert (=> b!187260 (= e!123246 call!18879)))

(declare-fun b!187261 () Bool)

(declare-fun e!123243 () Bool)

(declare-fun call!18880 () Bool)

(assert (=> b!187261 (= e!123243 (not call!18880))))

(declare-fun b!187262 () Bool)

(declare-fun e!123239 () ListLongMap!2391)

(assert (=> b!187262 (= e!123239 (+!290 call!18883 (tuple2!3475 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3657 thiss!1248))))))

(declare-fun bm!18876 () Bool)

(assert (=> bm!18876 (= call!18880 (contains!1311 lt!92646 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!187263 () Bool)

(assert (=> b!187263 (= e!123245 call!18881)))

(declare-fun bm!18877 () Bool)

(assert (=> bm!18877 (= call!18879 call!18882)))

(declare-fun b!187264 () Bool)

(declare-fun e!123236 () Bool)

(assert (=> b!187264 (= e!123236 (validKeyInArray!0 (select (arr!3761 (_keys!5766 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!187265 () Bool)

(declare-fun res!88554 () Bool)

(declare-fun e!123244 () Bool)

(assert (=> b!187265 (=> (not res!88554) (not e!123244))))

(declare-fun e!123248 () Bool)

(assert (=> b!187265 (= res!88554 e!123248)))

(declare-fun res!88551 () Bool)

(assert (=> b!187265 (=> res!88551 e!123248)))

(assert (=> b!187265 (= res!88551 (not e!123237))))

(declare-fun res!88553 () Bool)

(assert (=> b!187265 (=> (not res!88553) (not e!123237))))

(assert (=> b!187265 (= res!88553 (bvslt #b00000000000000000000000000000000 (size!4079 (_keys!5766 thiss!1248))))))

(declare-fun b!187266 () Bool)

(assert (=> b!187266 (= e!123244 e!123238)))

(declare-fun c!33621 () Bool)

(assert (=> b!187266 (= c!33621 (not (= (bvand (extraKeys!3553 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18878 () Bool)

(assert (=> bm!18878 (= call!18877 (contains!1311 lt!92646 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!187267 () Bool)

(declare-fun e!123241 () Unit!5636)

(declare-fun Unit!5643 () Unit!5636)

(assert (=> b!187267 (= e!123241 Unit!5643)))

(declare-fun bm!18879 () Bool)

(assert (=> bm!18879 (= call!18881 call!18883)))

(declare-fun bm!18880 () Bool)

(assert (=> bm!18880 (= call!18882 call!18878)))

(declare-fun b!187268 () Bool)

(declare-fun res!88546 () Bool)

(assert (=> b!187268 (=> (not res!88546) (not e!123244))))

(assert (=> b!187268 (= res!88546 e!123243)))

(declare-fun c!33623 () Bool)

(assert (=> b!187268 (= c!33623 (not (= (bvand (extraKeys!3553 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!187269 () Bool)

(declare-fun e!123240 () Bool)

(assert (=> b!187269 (= e!123248 e!123240)))

(declare-fun res!88549 () Bool)

(assert (=> b!187269 (=> (not res!88549) (not e!123240))))

(assert (=> b!187269 (= res!88549 (contains!1311 lt!92646 (select (arr!3761 (_keys!5766 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!187269 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4079 (_keys!5766 thiss!1248))))))

(declare-fun b!187270 () Bool)

(assert (=> b!187270 (= e!123239 e!123245)))

(assert (=> b!187270 (= c!33624 (and (not (= (bvand (extraKeys!3553 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3553 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!187271 () Bool)

(declare-fun get!2163 (ValueCell!1845 V!5483) V!5483)

(declare-fun dynLambda!513 (Int (_ BitVec 64)) V!5483)

(assert (=> b!187271 (= e!123240 (= (apply!170 lt!92646 (select (arr!3761 (_keys!5766 thiss!1248)) #b00000000000000000000000000000000)) (get!2163 (select (arr!3762 (_values!3799 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!513 (defaultEntry!3816 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!187271 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4080 (_values!3799 thiss!1248))))))

(assert (=> b!187271 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4079 (_keys!5766 thiss!1248))))))

(declare-fun b!187272 () Bool)

(declare-fun lt!92640 () Unit!5636)

(assert (=> b!187272 (= e!123241 lt!92640)))

(declare-fun lt!92639 () ListLongMap!2391)

(declare-fun getCurrentListMapNoExtraKeys!203 (array!7969 array!7971 (_ BitVec 32) (_ BitVec 32) V!5483 V!5483 (_ BitVec 32) Int) ListLongMap!2391)

(assert (=> b!187272 (= lt!92639 (getCurrentListMapNoExtraKeys!203 (_keys!5766 thiss!1248) (_values!3799 thiss!1248) (mask!8956 thiss!1248) (extraKeys!3553 thiss!1248) (zeroValue!3657 thiss!1248) (minValue!3657 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3816 thiss!1248)))))

(declare-fun lt!92659 () (_ BitVec 64))

(assert (=> b!187272 (= lt!92659 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92641 () (_ BitVec 64))

(assert (=> b!187272 (= lt!92641 (select (arr!3761 (_keys!5766 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92645 () Unit!5636)

(declare-fun addStillContains!146 (ListLongMap!2391 (_ BitVec 64) V!5483 (_ BitVec 64)) Unit!5636)

(assert (=> b!187272 (= lt!92645 (addStillContains!146 lt!92639 lt!92659 (zeroValue!3657 thiss!1248) lt!92641))))

(assert (=> b!187272 (contains!1311 (+!290 lt!92639 (tuple2!3475 lt!92659 (zeroValue!3657 thiss!1248))) lt!92641)))

(declare-fun lt!92656 () Unit!5636)

(assert (=> b!187272 (= lt!92656 lt!92645)))

(declare-fun lt!92648 () ListLongMap!2391)

(assert (=> b!187272 (= lt!92648 (getCurrentListMapNoExtraKeys!203 (_keys!5766 thiss!1248) (_values!3799 thiss!1248) (mask!8956 thiss!1248) (extraKeys!3553 thiss!1248) (zeroValue!3657 thiss!1248) (minValue!3657 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3816 thiss!1248)))))

(declare-fun lt!92649 () (_ BitVec 64))

(assert (=> b!187272 (= lt!92649 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92650 () (_ BitVec 64))

(assert (=> b!187272 (= lt!92650 (select (arr!3761 (_keys!5766 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92651 () Unit!5636)

(declare-fun addApplyDifferent!146 (ListLongMap!2391 (_ BitVec 64) V!5483 (_ BitVec 64)) Unit!5636)

(assert (=> b!187272 (= lt!92651 (addApplyDifferent!146 lt!92648 lt!92649 (minValue!3657 thiss!1248) lt!92650))))

(assert (=> b!187272 (= (apply!170 (+!290 lt!92648 (tuple2!3475 lt!92649 (minValue!3657 thiss!1248))) lt!92650) (apply!170 lt!92648 lt!92650))))

(declare-fun lt!92657 () Unit!5636)

(assert (=> b!187272 (= lt!92657 lt!92651)))

(declare-fun lt!92638 () ListLongMap!2391)

(assert (=> b!187272 (= lt!92638 (getCurrentListMapNoExtraKeys!203 (_keys!5766 thiss!1248) (_values!3799 thiss!1248) (mask!8956 thiss!1248) (extraKeys!3553 thiss!1248) (zeroValue!3657 thiss!1248) (minValue!3657 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3816 thiss!1248)))))

(declare-fun lt!92642 () (_ BitVec 64))

(assert (=> b!187272 (= lt!92642 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92653 () (_ BitVec 64))

(assert (=> b!187272 (= lt!92653 (select (arr!3761 (_keys!5766 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92652 () Unit!5636)

(assert (=> b!187272 (= lt!92652 (addApplyDifferent!146 lt!92638 lt!92642 (zeroValue!3657 thiss!1248) lt!92653))))

(assert (=> b!187272 (= (apply!170 (+!290 lt!92638 (tuple2!3475 lt!92642 (zeroValue!3657 thiss!1248))) lt!92653) (apply!170 lt!92638 lt!92653))))

(declare-fun lt!92643 () Unit!5636)

(assert (=> b!187272 (= lt!92643 lt!92652)))

(declare-fun lt!92647 () ListLongMap!2391)

(assert (=> b!187272 (= lt!92647 (getCurrentListMapNoExtraKeys!203 (_keys!5766 thiss!1248) (_values!3799 thiss!1248) (mask!8956 thiss!1248) (extraKeys!3553 thiss!1248) (zeroValue!3657 thiss!1248) (minValue!3657 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3816 thiss!1248)))))

(declare-fun lt!92654 () (_ BitVec 64))

(assert (=> b!187272 (= lt!92654 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92644 () (_ BitVec 64))

(assert (=> b!187272 (= lt!92644 (select (arr!3761 (_keys!5766 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!187272 (= lt!92640 (addApplyDifferent!146 lt!92647 lt!92654 (minValue!3657 thiss!1248) lt!92644))))

(assert (=> b!187272 (= (apply!170 (+!290 lt!92647 (tuple2!3475 lt!92654 (minValue!3657 thiss!1248))) lt!92644) (apply!170 lt!92647 lt!92644))))

(declare-fun bm!18875 () Bool)

(assert (=> bm!18875 (= call!18878 (getCurrentListMapNoExtraKeys!203 (_keys!5766 thiss!1248) (_values!3799 thiss!1248) (mask!8956 thiss!1248) (extraKeys!3553 thiss!1248) (zeroValue!3657 thiss!1248) (minValue!3657 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3816 thiss!1248)))))

(declare-fun d!55393 () Bool)

(assert (=> d!55393 e!123244))

(declare-fun res!88550 () Bool)

(assert (=> d!55393 (=> (not res!88550) (not e!123244))))

(assert (=> d!55393 (= res!88550 (or (bvsge #b00000000000000000000000000000000 (size!4079 (_keys!5766 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4079 (_keys!5766 thiss!1248))))))))

(declare-fun lt!92658 () ListLongMap!2391)

(assert (=> d!55393 (= lt!92646 lt!92658)))

(declare-fun lt!92655 () Unit!5636)

(assert (=> d!55393 (= lt!92655 e!123241)))

(declare-fun c!33620 () Bool)

(assert (=> d!55393 (= c!33620 e!123236)))

(declare-fun res!88548 () Bool)

(assert (=> d!55393 (=> (not res!88548) (not e!123236))))

(assert (=> d!55393 (= res!88548 (bvslt #b00000000000000000000000000000000 (size!4079 (_keys!5766 thiss!1248))))))

(assert (=> d!55393 (= lt!92658 e!123239)))

(assert (=> d!55393 (= c!33619 (and (not (= (bvand (extraKeys!3553 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3553 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55393 (validMask!0 (mask!8956 thiss!1248))))

(assert (=> d!55393 (= (getCurrentListMap!859 (_keys!5766 thiss!1248) (_values!3799 thiss!1248) (mask!8956 thiss!1248) (extraKeys!3553 thiss!1248) (zeroValue!3657 thiss!1248) (minValue!3657 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3816 thiss!1248)) lt!92646)))

(declare-fun b!187273 () Bool)

(assert (=> b!187273 (= e!123243 e!123247)))

(declare-fun res!88552 () Bool)

(assert (=> b!187273 (= res!88552 call!18880)))

(assert (=> b!187273 (=> (not res!88552) (not e!123247))))

(declare-fun b!187274 () Bool)

(assert (=> b!187274 (= e!123242 (= (apply!170 lt!92646 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3657 thiss!1248)))))

(assert (= (and d!55393 c!33619) b!187262))

(assert (= (and d!55393 (not c!33619)) b!187270))

(assert (= (and b!187270 c!33624) b!187263))

(assert (= (and b!187270 (not c!33624)) b!187259))

(assert (= (and b!187259 c!33622) b!187258))

(assert (= (and b!187259 (not c!33622)) b!187260))

(assert (= (or b!187258 b!187260) bm!18877))

(assert (= (or b!187263 bm!18877) bm!18880))

(assert (= (or b!187263 b!187258) bm!18879))

(assert (= (or b!187262 bm!18880) bm!18875))

(assert (= (or b!187262 bm!18879) bm!18874))

(assert (= (and d!55393 res!88548) b!187264))

(assert (= (and d!55393 c!33620) b!187272))

(assert (= (and d!55393 (not c!33620)) b!187267))

(assert (= (and d!55393 res!88550) b!187265))

(assert (= (and b!187265 res!88553) b!187255))

(assert (= (and b!187265 (not res!88551)) b!187269))

(assert (= (and b!187269 res!88549) b!187271))

(assert (= (and b!187265 res!88554) b!187268))

(assert (= (and b!187268 c!33623) b!187273))

(assert (= (and b!187268 (not c!33623)) b!187261))

(assert (= (and b!187273 res!88552) b!187257))

(assert (= (or b!187273 b!187261) bm!18876))

(assert (= (and b!187268 res!88546) b!187266))

(assert (= (and b!187266 c!33621) b!187254))

(assert (= (and b!187266 (not c!33621)) b!187256))

(assert (= (and b!187254 res!88547) b!187274))

(assert (= (or b!187254 b!187256) bm!18878))

(declare-fun b_lambda!7283 () Bool)

(assert (=> (not b_lambda!7283) (not b!187271)))

(declare-fun t!7271 () Bool)

(declare-fun tb!2851 () Bool)

(assert (=> (and b!187121 (= (defaultEntry!3816 thiss!1248) (defaultEntry!3816 thiss!1248)) t!7271) tb!2851))

(declare-fun result!4831 () Bool)

(assert (=> tb!2851 (= result!4831 tp_is_empty!4377)))

(assert (=> b!187271 t!7271))

(declare-fun b_and!11225 () Bool)

(assert (= b_and!11221 (and (=> t!7271 result!4831) b_and!11225)))

(declare-fun m!214077 () Bool)

(assert (=> bm!18875 m!214077))

(declare-fun m!214079 () Bool)

(assert (=> bm!18874 m!214079))

(assert (=> b!187272 m!214077))

(declare-fun m!214081 () Bool)

(assert (=> b!187272 m!214081))

(declare-fun m!214083 () Bool)

(assert (=> b!187272 m!214083))

(declare-fun m!214085 () Bool)

(assert (=> b!187272 m!214085))

(declare-fun m!214087 () Bool)

(assert (=> b!187272 m!214087))

(declare-fun m!214089 () Bool)

(assert (=> b!187272 m!214089))

(declare-fun m!214091 () Bool)

(assert (=> b!187272 m!214091))

(declare-fun m!214093 () Bool)

(assert (=> b!187272 m!214093))

(declare-fun m!214095 () Bool)

(assert (=> b!187272 m!214095))

(declare-fun m!214097 () Bool)

(assert (=> b!187272 m!214097))

(declare-fun m!214099 () Bool)

(assert (=> b!187272 m!214099))

(declare-fun m!214101 () Bool)

(assert (=> b!187272 m!214101))

(declare-fun m!214103 () Bool)

(assert (=> b!187272 m!214103))

(assert (=> b!187272 m!214093))

(assert (=> b!187272 m!214103))

(declare-fun m!214105 () Bool)

(assert (=> b!187272 m!214105))

(assert (=> b!187272 m!214089))

(declare-fun m!214107 () Bool)

(assert (=> b!187272 m!214107))

(declare-fun m!214109 () Bool)

(assert (=> b!187272 m!214109))

(assert (=> b!187272 m!214109))

(declare-fun m!214111 () Bool)

(assert (=> b!187272 m!214111))

(assert (=> d!55393 m!214003))

(declare-fun m!214113 () Bool)

(assert (=> b!187257 m!214113))

(declare-fun m!214115 () Bool)

(assert (=> b!187262 m!214115))

(declare-fun m!214117 () Bool)

(assert (=> bm!18878 m!214117))

(declare-fun m!214119 () Bool)

(assert (=> bm!18876 m!214119))

(declare-fun m!214121 () Bool)

(assert (=> b!187271 m!214121))

(declare-fun m!214123 () Bool)

(assert (=> b!187271 m!214123))

(declare-fun m!214125 () Bool)

(assert (=> b!187271 m!214125))

(assert (=> b!187271 m!214085))

(assert (=> b!187271 m!214123))

(assert (=> b!187271 m!214121))

(assert (=> b!187271 m!214085))

(declare-fun m!214127 () Bool)

(assert (=> b!187271 m!214127))

(declare-fun m!214129 () Bool)

(assert (=> b!187274 m!214129))

(assert (=> b!187255 m!214085))

(assert (=> b!187255 m!214085))

(declare-fun m!214131 () Bool)

(assert (=> b!187255 m!214131))

(assert (=> b!187269 m!214085))

(assert (=> b!187269 m!214085))

(declare-fun m!214133 () Bool)

(assert (=> b!187269 m!214133))

(assert (=> b!187264 m!214085))

(assert (=> b!187264 m!214085))

(assert (=> b!187264 m!214131))

(assert (=> b!187118 d!55393))

(declare-fun d!55395 () Bool)

(declare-fun res!88561 () Bool)

(declare-fun e!123251 () Bool)

(assert (=> d!55395 (=> (not res!88561) (not e!123251))))

(declare-fun simpleValid!186 (LongMapFixedSize!2598) Bool)

(assert (=> d!55395 (= res!88561 (simpleValid!186 thiss!1248))))

(assert (=> d!55395 (= (valid!1069 thiss!1248) e!123251)))

(declare-fun b!187283 () Bool)

(declare-fun res!88562 () Bool)

(assert (=> b!187283 (=> (not res!88562) (not e!123251))))

(declare-fun arrayCountValidKeys!0 (array!7969 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!187283 (= res!88562 (= (arrayCountValidKeys!0 (_keys!5766 thiss!1248) #b00000000000000000000000000000000 (size!4079 (_keys!5766 thiss!1248))) (_size!1348 thiss!1248)))))

(declare-fun b!187284 () Bool)

(declare-fun res!88563 () Bool)

(assert (=> b!187284 (=> (not res!88563) (not e!123251))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7969 (_ BitVec 32)) Bool)

(assert (=> b!187284 (= res!88563 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5766 thiss!1248) (mask!8956 thiss!1248)))))

(declare-fun b!187285 () Bool)

(declare-datatypes ((List!2380 0))(
  ( (Nil!2377) (Cons!2376 (h!3011 (_ BitVec 64)) (t!7272 List!2380)) )
))
(declare-fun arrayNoDuplicates!0 (array!7969 (_ BitVec 32) List!2380) Bool)

(assert (=> b!187285 (= e!123251 (arrayNoDuplicates!0 (_keys!5766 thiss!1248) #b00000000000000000000000000000000 Nil!2377))))

(assert (= (and d!55395 res!88561) b!187283))

(assert (= (and b!187283 res!88562) b!187284))

(assert (= (and b!187284 res!88563) b!187285))

(declare-fun m!214135 () Bool)

(assert (=> d!55395 m!214135))

(declare-fun m!214137 () Bool)

(assert (=> b!187283 m!214137))

(declare-fun m!214139 () Bool)

(assert (=> b!187284 m!214139))

(declare-fun m!214141 () Bool)

(assert (=> b!187285 m!214141))

(assert (=> start!18974 d!55395))

(declare-fun condMapEmpty!7544 () Bool)

(declare-fun mapDefault!7544 () ValueCell!1845)

(assert (=> mapNonEmpty!7538 (= condMapEmpty!7544 (= mapRest!7538 ((as const (Array (_ BitVec 32) ValueCell!1845)) mapDefault!7544)))))

(declare-fun e!123257 () Bool)

(declare-fun mapRes!7544 () Bool)

(assert (=> mapNonEmpty!7538 (= tp!16624 (and e!123257 mapRes!7544))))

(declare-fun b!187292 () Bool)

(declare-fun e!123256 () Bool)

(assert (=> b!187292 (= e!123256 tp_is_empty!4377)))

(declare-fun mapNonEmpty!7544 () Bool)

(declare-fun tp!16634 () Bool)

(assert (=> mapNonEmpty!7544 (= mapRes!7544 (and tp!16634 e!123256))))

(declare-fun mapValue!7544 () ValueCell!1845)

(declare-fun mapRest!7544 () (Array (_ BitVec 32) ValueCell!1845))

(declare-fun mapKey!7544 () (_ BitVec 32))

(assert (=> mapNonEmpty!7544 (= mapRest!7538 (store mapRest!7544 mapKey!7544 mapValue!7544))))

(declare-fun mapIsEmpty!7544 () Bool)

(assert (=> mapIsEmpty!7544 mapRes!7544))

(declare-fun b!187293 () Bool)

(assert (=> b!187293 (= e!123257 tp_is_empty!4377)))

(assert (= (and mapNonEmpty!7538 condMapEmpty!7544) mapIsEmpty!7544))

(assert (= (and mapNonEmpty!7538 (not condMapEmpty!7544)) mapNonEmpty!7544))

(assert (= (and mapNonEmpty!7544 ((_ is ValueCellFull!1845) mapValue!7544)) b!187292))

(assert (= (and mapNonEmpty!7538 ((_ is ValueCellFull!1845) mapDefault!7544)) b!187293))

(declare-fun m!214143 () Bool)

(assert (=> mapNonEmpty!7544 m!214143))

(declare-fun b_lambda!7285 () Bool)

(assert (= b_lambda!7283 (or (and b!187121 b_free!4605) b_lambda!7285)))

(check-sat (not b!187271) (not b!187284) (not b!187285) (not b!187269) (not d!55377) (not b!187262) (not b_next!4605) (not bm!18876) (not b!187209) (not d!55391) b_and!11225 (not b!187257) (not b!187274) (not bm!18858) (not d!55395) (not b_lambda!7285) (not d!55383) (not d!55393) tp_is_empty!4377 (not b!187283) (not bm!18859) (not d!55387) (not b!187170) (not bm!18875) (not mapNonEmpty!7544) (not b!187272) (not bm!18878) (not b!187264) (not b!187177) (not bm!18874) (not b!187255) (not b!187211))
(check-sat b_and!11225 (not b_next!4605))

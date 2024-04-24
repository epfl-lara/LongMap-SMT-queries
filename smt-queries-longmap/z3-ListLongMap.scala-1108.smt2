; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22878 () Bool)

(assert start!22878)

(declare-fun b!238348 () Bool)

(declare-fun b_free!6397 () Bool)

(declare-fun b_next!6397 () Bool)

(assert (=> b!238348 (= b_free!6397 (not b_next!6397))))

(declare-fun tp!22391 () Bool)

(declare-fun b_and!13375 () Bool)

(assert (=> b!238348 (= tp!22391 b_and!13375)))

(declare-fun b!238337 () Bool)

(declare-fun res!116788 () Bool)

(declare-fun e!154748 () Bool)

(assert (=> b!238337 (=> (not res!116788) (not e!154748))))

(declare-datatypes ((V!7993 0))(
  ( (V!7994 (val!3174 Int)) )
))
(declare-datatypes ((ValueCell!2786 0))(
  ( (ValueCellFull!2786 (v!5212 V!7993)) (EmptyCell!2786) )
))
(declare-datatypes ((array!11793 0))(
  ( (array!11794 (arr!5599 (Array (_ BitVec 32) ValueCell!2786)) (size!5940 (_ BitVec 32))) )
))
(declare-datatypes ((array!11795 0))(
  ( (array!11796 (arr!5600 (Array (_ BitVec 32) (_ BitVec 64))) (size!5941 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3472 0))(
  ( (LongMapFixedSize!3473 (defaultEntry!4420 Int) (mask!10451 (_ BitVec 32)) (extraKeys!4157 (_ BitVec 32)) (zeroValue!4261 V!7993) (minValue!4261 V!7993) (_size!1785 (_ BitVec 32)) (_keys!6520 array!11795) (_values!4403 array!11793) (_vacant!1785 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3472)

(assert (=> b!238337 (= res!116788 (and (= (size!5940 (_values!4403 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10451 thiss!1504))) (= (size!5941 (_keys!6520 thiss!1504)) (size!5940 (_values!4403 thiss!1504))) (bvsge (mask!10451 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4157 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4157 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!238338 () Bool)

(declare-fun res!116785 () Bool)

(assert (=> b!238338 (=> (not res!116785) (not e!154748))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!238338 (= res!116785 (validMask!0 (mask!10451 thiss!1504)))))

(declare-fun b!238339 () Bool)

(declare-fun res!116789 () Bool)

(assert (=> b!238339 (=> (not res!116789) (not e!154748))))

(declare-datatypes ((List!3495 0))(
  ( (Nil!3492) (Cons!3491 (h!4147 (_ BitVec 64)) (t!8480 List!3495)) )
))
(declare-fun arrayNoDuplicates!0 (array!11795 (_ BitVec 32) List!3495) Bool)

(assert (=> b!238339 (= res!116789 (arrayNoDuplicates!0 (_keys!6520 thiss!1504) #b00000000000000000000000000000000 Nil!3492))))

(declare-fun mapNonEmpty!10617 () Bool)

(declare-fun mapRes!10617 () Bool)

(declare-fun tp!22392 () Bool)

(declare-fun e!154745 () Bool)

(assert (=> mapNonEmpty!10617 (= mapRes!10617 (and tp!22392 e!154745))))

(declare-fun mapRest!10617 () (Array (_ BitVec 32) ValueCell!2786))

(declare-fun mapValue!10617 () ValueCell!2786)

(declare-fun mapKey!10617 () (_ BitVec 32))

(assert (=> mapNonEmpty!10617 (= (arr!5599 (_values!4403 thiss!1504)) (store mapRest!10617 mapKey!10617 mapValue!10617))))

(declare-fun b!238341 () Bool)

(declare-fun e!154744 () Bool)

(declare-fun tp_is_empty!6259 () Bool)

(assert (=> b!238341 (= e!154744 tp_is_empty!6259)))

(declare-fun b!238342 () Bool)

(assert (=> b!238342 (= e!154745 tp_is_empty!6259)))

(declare-fun b!238343 () Bool)

(declare-fun res!116786 () Bool)

(assert (=> b!238343 (=> (not res!116786) (not e!154748))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4604 0))(
  ( (tuple2!4605 (_1!2313 (_ BitVec 64)) (_2!2313 V!7993)) )
))
(declare-datatypes ((List!3496 0))(
  ( (Nil!3493) (Cons!3492 (h!4148 tuple2!4604) (t!8481 List!3496)) )
))
(declare-datatypes ((ListLongMap!3519 0))(
  ( (ListLongMap!3520 (toList!1775 List!3496)) )
))
(declare-fun contains!1676 (ListLongMap!3519 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1307 (array!11795 array!11793 (_ BitVec 32) (_ BitVec 32) V!7993 V!7993 (_ BitVec 32) Int) ListLongMap!3519)

(assert (=> b!238343 (= res!116786 (not (contains!1676 (getCurrentListMap!1307 (_keys!6520 thiss!1504) (_values!4403 thiss!1504) (mask!10451 thiss!1504) (extraKeys!4157 thiss!1504) (zeroValue!4261 thiss!1504) (minValue!4261 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4420 thiss!1504)) key!932)))))

(declare-fun b!238344 () Bool)

(declare-fun res!116791 () Bool)

(declare-fun e!154743 () Bool)

(assert (=> b!238344 (=> (not res!116791) (not e!154743))))

(assert (=> b!238344 (= res!116791 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!238345 () Bool)

(declare-fun e!154746 () Bool)

(assert (=> b!238345 (= e!154746 (and e!154744 mapRes!10617))))

(declare-fun condMapEmpty!10617 () Bool)

(declare-fun mapDefault!10617 () ValueCell!2786)

(assert (=> b!238345 (= condMapEmpty!10617 (= (arr!5599 (_values!4403 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2786)) mapDefault!10617)))))

(declare-fun mapIsEmpty!10617 () Bool)

(assert (=> mapIsEmpty!10617 mapRes!10617))

(declare-fun b!238346 () Bool)

(assert (=> b!238346 (= e!154743 e!154748)))

(declare-fun res!116790 () Bool)

(assert (=> b!238346 (=> (not res!116790) (not e!154748))))

(declare-datatypes ((SeekEntryResult!987 0))(
  ( (MissingZero!987 (index!6118 (_ BitVec 32))) (Found!987 (index!6119 (_ BitVec 32))) (Intermediate!987 (undefined!1799 Bool) (index!6120 (_ BitVec 32)) (x!24001 (_ BitVec 32))) (Undefined!987) (MissingVacant!987 (index!6121 (_ BitVec 32))) )
))
(declare-fun lt!120560 () SeekEntryResult!987)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!238346 (= res!116790 (or (= lt!120560 (MissingZero!987 index!297)) (= lt!120560 (MissingVacant!987 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11795 (_ BitVec 32)) SeekEntryResult!987)

(assert (=> b!238346 (= lt!120560 (seekEntryOrOpen!0 key!932 (_keys!6520 thiss!1504) (mask!10451 thiss!1504)))))

(declare-fun b!238340 () Bool)

(declare-fun res!116792 () Bool)

(assert (=> b!238340 (=> (not res!116792) (not e!154748))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11795 (_ BitVec 32)) Bool)

(assert (=> b!238340 (= res!116792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6520 thiss!1504) (mask!10451 thiss!1504)))))

(declare-fun res!116787 () Bool)

(assert (=> start!22878 (=> (not res!116787) (not e!154743))))

(declare-fun valid!1384 (LongMapFixedSize!3472) Bool)

(assert (=> start!22878 (= res!116787 (valid!1384 thiss!1504))))

(assert (=> start!22878 e!154743))

(declare-fun e!154749 () Bool)

(assert (=> start!22878 e!154749))

(assert (=> start!22878 true))

(declare-fun b!238347 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!238347 (= e!154748 (not (validKeyInArray!0 key!932)))))

(declare-fun array_inv!3681 (array!11795) Bool)

(declare-fun array_inv!3682 (array!11793) Bool)

(assert (=> b!238348 (= e!154749 (and tp!22391 tp_is_empty!6259 (array_inv!3681 (_keys!6520 thiss!1504)) (array_inv!3682 (_values!4403 thiss!1504)) e!154746))))

(assert (= (and start!22878 res!116787) b!238344))

(assert (= (and b!238344 res!116791) b!238346))

(assert (= (and b!238346 res!116790) b!238343))

(assert (= (and b!238343 res!116786) b!238338))

(assert (= (and b!238338 res!116785) b!238337))

(assert (= (and b!238337 res!116788) b!238340))

(assert (= (and b!238340 res!116792) b!238339))

(assert (= (and b!238339 res!116789) b!238347))

(assert (= (and b!238345 condMapEmpty!10617) mapIsEmpty!10617))

(assert (= (and b!238345 (not condMapEmpty!10617)) mapNonEmpty!10617))

(get-info :version)

(assert (= (and mapNonEmpty!10617 ((_ is ValueCellFull!2786) mapValue!10617)) b!238342))

(assert (= (and b!238345 ((_ is ValueCellFull!2786) mapDefault!10617)) b!238341))

(assert (= b!238348 b!238345))

(assert (= start!22878 b!238348))

(declare-fun m!259067 () Bool)

(assert (=> b!238339 m!259067))

(declare-fun m!259069 () Bool)

(assert (=> b!238340 m!259069))

(declare-fun m!259071 () Bool)

(assert (=> mapNonEmpty!10617 m!259071))

(declare-fun m!259073 () Bool)

(assert (=> b!238348 m!259073))

(declare-fun m!259075 () Bool)

(assert (=> b!238348 m!259075))

(declare-fun m!259077 () Bool)

(assert (=> start!22878 m!259077))

(declare-fun m!259079 () Bool)

(assert (=> b!238347 m!259079))

(declare-fun m!259081 () Bool)

(assert (=> b!238338 m!259081))

(declare-fun m!259083 () Bool)

(assert (=> b!238346 m!259083))

(declare-fun m!259085 () Bool)

(assert (=> b!238343 m!259085))

(assert (=> b!238343 m!259085))

(declare-fun m!259087 () Bool)

(assert (=> b!238343 m!259087))

(check-sat (not b!238347) (not mapNonEmpty!10617) (not b!238338) (not b!238348) tp_is_empty!6259 (not b!238343) (not b!238346) (not b!238340) b_and!13375 (not b_next!6397) (not b!238339) (not start!22878))
(check-sat b_and!13375 (not b_next!6397))
(get-model)

(declare-fun d!59823 () Bool)

(declare-fun lt!120574 () SeekEntryResult!987)

(assert (=> d!59823 (and (or ((_ is Undefined!987) lt!120574) (not ((_ is Found!987) lt!120574)) (and (bvsge (index!6119 lt!120574) #b00000000000000000000000000000000) (bvslt (index!6119 lt!120574) (size!5941 (_keys!6520 thiss!1504))))) (or ((_ is Undefined!987) lt!120574) ((_ is Found!987) lt!120574) (not ((_ is MissingZero!987) lt!120574)) (and (bvsge (index!6118 lt!120574) #b00000000000000000000000000000000) (bvslt (index!6118 lt!120574) (size!5941 (_keys!6520 thiss!1504))))) (or ((_ is Undefined!987) lt!120574) ((_ is Found!987) lt!120574) ((_ is MissingZero!987) lt!120574) (not ((_ is MissingVacant!987) lt!120574)) (and (bvsge (index!6121 lt!120574) #b00000000000000000000000000000000) (bvslt (index!6121 lt!120574) (size!5941 (_keys!6520 thiss!1504))))) (or ((_ is Undefined!987) lt!120574) (ite ((_ is Found!987) lt!120574) (= (select (arr!5600 (_keys!6520 thiss!1504)) (index!6119 lt!120574)) key!932) (ite ((_ is MissingZero!987) lt!120574) (= (select (arr!5600 (_keys!6520 thiss!1504)) (index!6118 lt!120574)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!987) lt!120574) (= (select (arr!5600 (_keys!6520 thiss!1504)) (index!6121 lt!120574)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!154798 () SeekEntryResult!987)

(assert (=> d!59823 (= lt!120574 e!154798)))

(declare-fun c!39771 () Bool)

(declare-fun lt!120573 () SeekEntryResult!987)

(assert (=> d!59823 (= c!39771 (and ((_ is Intermediate!987) lt!120573) (undefined!1799 lt!120573)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11795 (_ BitVec 32)) SeekEntryResult!987)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59823 (= lt!120573 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10451 thiss!1504)) key!932 (_keys!6520 thiss!1504) (mask!10451 thiss!1504)))))

(assert (=> d!59823 (validMask!0 (mask!10451 thiss!1504))))

(assert (=> d!59823 (= (seekEntryOrOpen!0 key!932 (_keys!6520 thiss!1504) (mask!10451 thiss!1504)) lt!120574)))

(declare-fun b!238433 () Bool)

(declare-fun e!154800 () SeekEntryResult!987)

(assert (=> b!238433 (= e!154800 (MissingZero!987 (index!6120 lt!120573)))))

(declare-fun b!238434 () Bool)

(declare-fun c!39770 () Bool)

(declare-fun lt!120575 () (_ BitVec 64))

(assert (=> b!238434 (= c!39770 (= lt!120575 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!154799 () SeekEntryResult!987)

(assert (=> b!238434 (= e!154799 e!154800)))

(declare-fun b!238435 () Bool)

(assert (=> b!238435 (= e!154798 Undefined!987)))

(declare-fun b!238436 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11795 (_ BitVec 32)) SeekEntryResult!987)

(assert (=> b!238436 (= e!154800 (seekKeyOrZeroReturnVacant!0 (x!24001 lt!120573) (index!6120 lt!120573) (index!6120 lt!120573) key!932 (_keys!6520 thiss!1504) (mask!10451 thiss!1504)))))

(declare-fun b!238437 () Bool)

(assert (=> b!238437 (= e!154799 (Found!987 (index!6120 lt!120573)))))

(declare-fun b!238438 () Bool)

(assert (=> b!238438 (= e!154798 e!154799)))

(assert (=> b!238438 (= lt!120575 (select (arr!5600 (_keys!6520 thiss!1504)) (index!6120 lt!120573)))))

(declare-fun c!39769 () Bool)

(assert (=> b!238438 (= c!39769 (= lt!120575 key!932))))

(assert (= (and d!59823 c!39771) b!238435))

(assert (= (and d!59823 (not c!39771)) b!238438))

(assert (= (and b!238438 c!39769) b!238437))

(assert (= (and b!238438 (not c!39769)) b!238434))

(assert (= (and b!238434 c!39770) b!238433))

(assert (= (and b!238434 (not c!39770)) b!238436))

(assert (=> d!59823 m!259081))

(declare-fun m!259133 () Bool)

(assert (=> d!59823 m!259133))

(declare-fun m!259135 () Bool)

(assert (=> d!59823 m!259135))

(declare-fun m!259137 () Bool)

(assert (=> d!59823 m!259137))

(declare-fun m!259139 () Bool)

(assert (=> d!59823 m!259139))

(declare-fun m!259141 () Bool)

(assert (=> d!59823 m!259141))

(assert (=> d!59823 m!259137))

(declare-fun m!259143 () Bool)

(assert (=> b!238436 m!259143))

(declare-fun m!259145 () Bool)

(assert (=> b!238438 m!259145))

(assert (=> b!238346 d!59823))

(declare-fun d!59825 () Bool)

(assert (=> d!59825 (= (validMask!0 (mask!10451 thiss!1504)) (and (or (= (mask!10451 thiss!1504) #b00000000000000000000000000000111) (= (mask!10451 thiss!1504) #b00000000000000000000000000001111) (= (mask!10451 thiss!1504) #b00000000000000000000000000011111) (= (mask!10451 thiss!1504) #b00000000000000000000000000111111) (= (mask!10451 thiss!1504) #b00000000000000000000000001111111) (= (mask!10451 thiss!1504) #b00000000000000000000000011111111) (= (mask!10451 thiss!1504) #b00000000000000000000000111111111) (= (mask!10451 thiss!1504) #b00000000000000000000001111111111) (= (mask!10451 thiss!1504) #b00000000000000000000011111111111) (= (mask!10451 thiss!1504) #b00000000000000000000111111111111) (= (mask!10451 thiss!1504) #b00000000000000000001111111111111) (= (mask!10451 thiss!1504) #b00000000000000000011111111111111) (= (mask!10451 thiss!1504) #b00000000000000000111111111111111) (= (mask!10451 thiss!1504) #b00000000000000001111111111111111) (= (mask!10451 thiss!1504) #b00000000000000011111111111111111) (= (mask!10451 thiss!1504) #b00000000000000111111111111111111) (= (mask!10451 thiss!1504) #b00000000000001111111111111111111) (= (mask!10451 thiss!1504) #b00000000000011111111111111111111) (= (mask!10451 thiss!1504) #b00000000000111111111111111111111) (= (mask!10451 thiss!1504) #b00000000001111111111111111111111) (= (mask!10451 thiss!1504) #b00000000011111111111111111111111) (= (mask!10451 thiss!1504) #b00000000111111111111111111111111) (= (mask!10451 thiss!1504) #b00000001111111111111111111111111) (= (mask!10451 thiss!1504) #b00000011111111111111111111111111) (= (mask!10451 thiss!1504) #b00000111111111111111111111111111) (= (mask!10451 thiss!1504) #b00001111111111111111111111111111) (= (mask!10451 thiss!1504) #b00011111111111111111111111111111) (= (mask!10451 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10451 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!238338 d!59825))

(declare-fun bm!22143 () Bool)

(declare-fun call!22146 () Bool)

(assert (=> bm!22143 (= call!22146 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6520 thiss!1504) (mask!10451 thiss!1504)))))

(declare-fun d!59827 () Bool)

(declare-fun res!116845 () Bool)

(declare-fun e!154807 () Bool)

(assert (=> d!59827 (=> res!116845 e!154807)))

(assert (=> d!59827 (= res!116845 (bvsge #b00000000000000000000000000000000 (size!5941 (_keys!6520 thiss!1504))))))

(assert (=> d!59827 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6520 thiss!1504) (mask!10451 thiss!1504)) e!154807)))

(declare-fun b!238447 () Bool)

(declare-fun e!154808 () Bool)

(assert (=> b!238447 (= e!154807 e!154808)))

(declare-fun c!39774 () Bool)

(assert (=> b!238447 (= c!39774 (validKeyInArray!0 (select (arr!5600 (_keys!6520 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!238448 () Bool)

(assert (=> b!238448 (= e!154808 call!22146)))

(declare-fun b!238449 () Bool)

(declare-fun e!154809 () Bool)

(assert (=> b!238449 (= e!154808 e!154809)))

(declare-fun lt!120582 () (_ BitVec 64))

(assert (=> b!238449 (= lt!120582 (select (arr!5600 (_keys!6520 thiss!1504)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!7303 0))(
  ( (Unit!7304) )
))
(declare-fun lt!120584 () Unit!7303)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11795 (_ BitVec 64) (_ BitVec 32)) Unit!7303)

(assert (=> b!238449 (= lt!120584 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6520 thiss!1504) lt!120582 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!11795 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!238449 (arrayContainsKey!0 (_keys!6520 thiss!1504) lt!120582 #b00000000000000000000000000000000)))

(declare-fun lt!120583 () Unit!7303)

(assert (=> b!238449 (= lt!120583 lt!120584)))

(declare-fun res!116846 () Bool)

(assert (=> b!238449 (= res!116846 (= (seekEntryOrOpen!0 (select (arr!5600 (_keys!6520 thiss!1504)) #b00000000000000000000000000000000) (_keys!6520 thiss!1504) (mask!10451 thiss!1504)) (Found!987 #b00000000000000000000000000000000)))))

(assert (=> b!238449 (=> (not res!116846) (not e!154809))))

(declare-fun b!238450 () Bool)

(assert (=> b!238450 (= e!154809 call!22146)))

(assert (= (and d!59827 (not res!116845)) b!238447))

(assert (= (and b!238447 c!39774) b!238449))

(assert (= (and b!238447 (not c!39774)) b!238448))

(assert (= (and b!238449 res!116846) b!238450))

(assert (= (or b!238450 b!238448) bm!22143))

(declare-fun m!259147 () Bool)

(assert (=> bm!22143 m!259147))

(declare-fun m!259149 () Bool)

(assert (=> b!238447 m!259149))

(assert (=> b!238447 m!259149))

(declare-fun m!259151 () Bool)

(assert (=> b!238447 m!259151))

(assert (=> b!238449 m!259149))

(declare-fun m!259153 () Bool)

(assert (=> b!238449 m!259153))

(declare-fun m!259155 () Bool)

(assert (=> b!238449 m!259155))

(assert (=> b!238449 m!259149))

(declare-fun m!259157 () Bool)

(assert (=> b!238449 m!259157))

(assert (=> b!238340 d!59827))

(declare-fun d!59829 () Bool)

(declare-fun res!116853 () Bool)

(declare-fun e!154812 () Bool)

(assert (=> d!59829 (=> (not res!116853) (not e!154812))))

(declare-fun simpleValid!243 (LongMapFixedSize!3472) Bool)

(assert (=> d!59829 (= res!116853 (simpleValid!243 thiss!1504))))

(assert (=> d!59829 (= (valid!1384 thiss!1504) e!154812)))

(declare-fun b!238457 () Bool)

(declare-fun res!116854 () Bool)

(assert (=> b!238457 (=> (not res!116854) (not e!154812))))

(declare-fun arrayCountValidKeys!0 (array!11795 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!238457 (= res!116854 (= (arrayCountValidKeys!0 (_keys!6520 thiss!1504) #b00000000000000000000000000000000 (size!5941 (_keys!6520 thiss!1504))) (_size!1785 thiss!1504)))))

(declare-fun b!238458 () Bool)

(declare-fun res!116855 () Bool)

(assert (=> b!238458 (=> (not res!116855) (not e!154812))))

(assert (=> b!238458 (= res!116855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6520 thiss!1504) (mask!10451 thiss!1504)))))

(declare-fun b!238459 () Bool)

(assert (=> b!238459 (= e!154812 (arrayNoDuplicates!0 (_keys!6520 thiss!1504) #b00000000000000000000000000000000 Nil!3492))))

(assert (= (and d!59829 res!116853) b!238457))

(assert (= (and b!238457 res!116854) b!238458))

(assert (= (and b!238458 res!116855) b!238459))

(declare-fun m!259159 () Bool)

(assert (=> d!59829 m!259159))

(declare-fun m!259161 () Bool)

(assert (=> b!238457 m!259161))

(assert (=> b!238458 m!259069))

(assert (=> b!238459 m!259067))

(assert (=> start!22878 d!59829))

(declare-fun d!59831 () Bool)

(assert (=> d!59831 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!238347 d!59831))

(declare-fun d!59833 () Bool)

(declare-fun e!154818 () Bool)

(assert (=> d!59833 e!154818))

(declare-fun res!116858 () Bool)

(assert (=> d!59833 (=> res!116858 e!154818)))

(declare-fun lt!120595 () Bool)

(assert (=> d!59833 (= res!116858 (not lt!120595))))

(declare-fun lt!120596 () Bool)

(assert (=> d!59833 (= lt!120595 lt!120596)))

(declare-fun lt!120594 () Unit!7303)

(declare-fun e!154817 () Unit!7303)

(assert (=> d!59833 (= lt!120594 e!154817)))

(declare-fun c!39777 () Bool)

(assert (=> d!59833 (= c!39777 lt!120596)))

(declare-fun containsKey!270 (List!3496 (_ BitVec 64)) Bool)

(assert (=> d!59833 (= lt!120596 (containsKey!270 (toList!1775 (getCurrentListMap!1307 (_keys!6520 thiss!1504) (_values!4403 thiss!1504) (mask!10451 thiss!1504) (extraKeys!4157 thiss!1504) (zeroValue!4261 thiss!1504) (minValue!4261 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4420 thiss!1504))) key!932))))

(assert (=> d!59833 (= (contains!1676 (getCurrentListMap!1307 (_keys!6520 thiss!1504) (_values!4403 thiss!1504) (mask!10451 thiss!1504) (extraKeys!4157 thiss!1504) (zeroValue!4261 thiss!1504) (minValue!4261 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4420 thiss!1504)) key!932) lt!120595)))

(declare-fun b!238466 () Bool)

(declare-fun lt!120593 () Unit!7303)

(assert (=> b!238466 (= e!154817 lt!120593)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!218 (List!3496 (_ BitVec 64)) Unit!7303)

(assert (=> b!238466 (= lt!120593 (lemmaContainsKeyImpliesGetValueByKeyDefined!218 (toList!1775 (getCurrentListMap!1307 (_keys!6520 thiss!1504) (_values!4403 thiss!1504) (mask!10451 thiss!1504) (extraKeys!4157 thiss!1504) (zeroValue!4261 thiss!1504) (minValue!4261 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4420 thiss!1504))) key!932))))

(declare-datatypes ((Option!285 0))(
  ( (Some!284 (v!5215 V!7993)) (None!283) )
))
(declare-fun isDefined!219 (Option!285) Bool)

(declare-fun getValueByKey!279 (List!3496 (_ BitVec 64)) Option!285)

(assert (=> b!238466 (isDefined!219 (getValueByKey!279 (toList!1775 (getCurrentListMap!1307 (_keys!6520 thiss!1504) (_values!4403 thiss!1504) (mask!10451 thiss!1504) (extraKeys!4157 thiss!1504) (zeroValue!4261 thiss!1504) (minValue!4261 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4420 thiss!1504))) key!932))))

(declare-fun b!238467 () Bool)

(declare-fun Unit!7305 () Unit!7303)

(assert (=> b!238467 (= e!154817 Unit!7305)))

(declare-fun b!238468 () Bool)

(assert (=> b!238468 (= e!154818 (isDefined!219 (getValueByKey!279 (toList!1775 (getCurrentListMap!1307 (_keys!6520 thiss!1504) (_values!4403 thiss!1504) (mask!10451 thiss!1504) (extraKeys!4157 thiss!1504) (zeroValue!4261 thiss!1504) (minValue!4261 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4420 thiss!1504))) key!932)))))

(assert (= (and d!59833 c!39777) b!238466))

(assert (= (and d!59833 (not c!39777)) b!238467))

(assert (= (and d!59833 (not res!116858)) b!238468))

(declare-fun m!259163 () Bool)

(assert (=> d!59833 m!259163))

(declare-fun m!259165 () Bool)

(assert (=> b!238466 m!259165))

(declare-fun m!259167 () Bool)

(assert (=> b!238466 m!259167))

(assert (=> b!238466 m!259167))

(declare-fun m!259169 () Bool)

(assert (=> b!238466 m!259169))

(assert (=> b!238468 m!259167))

(assert (=> b!238468 m!259167))

(assert (=> b!238468 m!259169))

(assert (=> b!238343 d!59833))

(declare-fun b!238511 () Bool)

(declare-fun e!154852 () Bool)

(declare-fun lt!120662 () ListLongMap!3519)

(declare-fun apply!220 (ListLongMap!3519 (_ BitVec 64)) V!7993)

(assert (=> b!238511 (= e!154852 (= (apply!220 lt!120662 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4261 thiss!1504)))))

(declare-fun b!238512 () Bool)

(declare-fun e!154847 () Bool)

(assert (=> b!238512 (= e!154847 (= (apply!220 lt!120662 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4261 thiss!1504)))))

(declare-fun bm!22158 () Bool)

(declare-fun call!22165 () ListLongMap!3519)

(declare-fun call!22161 () ListLongMap!3519)

(assert (=> bm!22158 (= call!22165 call!22161)))

(declare-fun bm!22159 () Bool)

(declare-fun call!22166 () Bool)

(assert (=> bm!22159 (= call!22166 (contains!1676 lt!120662 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!39790 () Bool)

(declare-fun call!22164 () ListLongMap!3519)

(declare-fun call!22162 () ListLongMap!3519)

(declare-fun bm!22160 () Bool)

(declare-fun c!39791 () Bool)

(declare-fun +!647 (ListLongMap!3519 tuple2!4604) ListLongMap!3519)

(assert (=> bm!22160 (= call!22162 (+!647 (ite c!39791 call!22161 (ite c!39790 call!22165 call!22164)) (ite (or c!39791 c!39790) (tuple2!4605 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4261 thiss!1504)) (tuple2!4605 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4261 thiss!1504)))))))

(declare-fun d!59835 () Bool)

(declare-fun e!154853 () Bool)

(assert (=> d!59835 e!154853))

(declare-fun res!116882 () Bool)

(assert (=> d!59835 (=> (not res!116882) (not e!154853))))

(assert (=> d!59835 (= res!116882 (or (bvsge #b00000000000000000000000000000000 (size!5941 (_keys!6520 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5941 (_keys!6520 thiss!1504))))))))

(declare-fun lt!120657 () ListLongMap!3519)

(assert (=> d!59835 (= lt!120662 lt!120657)))

(declare-fun lt!120655 () Unit!7303)

(declare-fun e!154849 () Unit!7303)

(assert (=> d!59835 (= lt!120655 e!154849)))

(declare-fun c!39795 () Bool)

(declare-fun e!154846 () Bool)

(assert (=> d!59835 (= c!39795 e!154846)))

(declare-fun res!116879 () Bool)

(assert (=> d!59835 (=> (not res!116879) (not e!154846))))

(assert (=> d!59835 (= res!116879 (bvslt #b00000000000000000000000000000000 (size!5941 (_keys!6520 thiss!1504))))))

(declare-fun e!154845 () ListLongMap!3519)

(assert (=> d!59835 (= lt!120657 e!154845)))

(assert (=> d!59835 (= c!39791 (and (not (= (bvand (extraKeys!4157 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4157 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59835 (validMask!0 (mask!10451 thiss!1504))))

(assert (=> d!59835 (= (getCurrentListMap!1307 (_keys!6520 thiss!1504) (_values!4403 thiss!1504) (mask!10451 thiss!1504) (extraKeys!4157 thiss!1504) (zeroValue!4261 thiss!1504) (minValue!4261 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4420 thiss!1504)) lt!120662)))

(declare-fun bm!22161 () Bool)

(declare-fun call!22167 () Bool)

(assert (=> bm!22161 (= call!22167 (contains!1676 lt!120662 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!238513 () Bool)

(declare-fun lt!120651 () Unit!7303)

(assert (=> b!238513 (= e!154849 lt!120651)))

(declare-fun lt!120649 () ListLongMap!3519)

(declare-fun getCurrentListMapNoExtraKeys!536 (array!11795 array!11793 (_ BitVec 32) (_ BitVec 32) V!7993 V!7993 (_ BitVec 32) Int) ListLongMap!3519)

(assert (=> b!238513 (= lt!120649 (getCurrentListMapNoExtraKeys!536 (_keys!6520 thiss!1504) (_values!4403 thiss!1504) (mask!10451 thiss!1504) (extraKeys!4157 thiss!1504) (zeroValue!4261 thiss!1504) (minValue!4261 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4420 thiss!1504)))))

(declare-fun lt!120656 () (_ BitVec 64))

(assert (=> b!238513 (= lt!120656 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120652 () (_ BitVec 64))

(assert (=> b!238513 (= lt!120652 (select (arr!5600 (_keys!6520 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!120645 () Unit!7303)

(declare-fun addStillContains!196 (ListLongMap!3519 (_ BitVec 64) V!7993 (_ BitVec 64)) Unit!7303)

(assert (=> b!238513 (= lt!120645 (addStillContains!196 lt!120649 lt!120656 (zeroValue!4261 thiss!1504) lt!120652))))

(assert (=> b!238513 (contains!1676 (+!647 lt!120649 (tuple2!4605 lt!120656 (zeroValue!4261 thiss!1504))) lt!120652)))

(declare-fun lt!120653 () Unit!7303)

(assert (=> b!238513 (= lt!120653 lt!120645)))

(declare-fun lt!120658 () ListLongMap!3519)

(assert (=> b!238513 (= lt!120658 (getCurrentListMapNoExtraKeys!536 (_keys!6520 thiss!1504) (_values!4403 thiss!1504) (mask!10451 thiss!1504) (extraKeys!4157 thiss!1504) (zeroValue!4261 thiss!1504) (minValue!4261 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4420 thiss!1504)))))

(declare-fun lt!120650 () (_ BitVec 64))

(assert (=> b!238513 (= lt!120650 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120654 () (_ BitVec 64))

(assert (=> b!238513 (= lt!120654 (select (arr!5600 (_keys!6520 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!120661 () Unit!7303)

(declare-fun addApplyDifferent!196 (ListLongMap!3519 (_ BitVec 64) V!7993 (_ BitVec 64)) Unit!7303)

(assert (=> b!238513 (= lt!120661 (addApplyDifferent!196 lt!120658 lt!120650 (minValue!4261 thiss!1504) lt!120654))))

(assert (=> b!238513 (= (apply!220 (+!647 lt!120658 (tuple2!4605 lt!120650 (minValue!4261 thiss!1504))) lt!120654) (apply!220 lt!120658 lt!120654))))

(declare-fun lt!120643 () Unit!7303)

(assert (=> b!238513 (= lt!120643 lt!120661)))

(declare-fun lt!120648 () ListLongMap!3519)

(assert (=> b!238513 (= lt!120648 (getCurrentListMapNoExtraKeys!536 (_keys!6520 thiss!1504) (_values!4403 thiss!1504) (mask!10451 thiss!1504) (extraKeys!4157 thiss!1504) (zeroValue!4261 thiss!1504) (minValue!4261 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4420 thiss!1504)))))

(declare-fun lt!120659 () (_ BitVec 64))

(assert (=> b!238513 (= lt!120659 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120647 () (_ BitVec 64))

(assert (=> b!238513 (= lt!120647 (select (arr!5600 (_keys!6520 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!120642 () Unit!7303)

(assert (=> b!238513 (= lt!120642 (addApplyDifferent!196 lt!120648 lt!120659 (zeroValue!4261 thiss!1504) lt!120647))))

(assert (=> b!238513 (= (apply!220 (+!647 lt!120648 (tuple2!4605 lt!120659 (zeroValue!4261 thiss!1504))) lt!120647) (apply!220 lt!120648 lt!120647))))

(declare-fun lt!120641 () Unit!7303)

(assert (=> b!238513 (= lt!120641 lt!120642)))

(declare-fun lt!120644 () ListLongMap!3519)

(assert (=> b!238513 (= lt!120644 (getCurrentListMapNoExtraKeys!536 (_keys!6520 thiss!1504) (_values!4403 thiss!1504) (mask!10451 thiss!1504) (extraKeys!4157 thiss!1504) (zeroValue!4261 thiss!1504) (minValue!4261 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4420 thiss!1504)))))

(declare-fun lt!120660 () (_ BitVec 64))

(assert (=> b!238513 (= lt!120660 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120646 () (_ BitVec 64))

(assert (=> b!238513 (= lt!120646 (select (arr!5600 (_keys!6520 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!238513 (= lt!120651 (addApplyDifferent!196 lt!120644 lt!120660 (minValue!4261 thiss!1504) lt!120646))))

(assert (=> b!238513 (= (apply!220 (+!647 lt!120644 (tuple2!4605 lt!120660 (minValue!4261 thiss!1504))) lt!120646) (apply!220 lt!120644 lt!120646))))

(declare-fun b!238514 () Bool)

(declare-fun e!154850 () Bool)

(declare-fun e!154848 () Bool)

(assert (=> b!238514 (= e!154850 e!154848)))

(declare-fun res!116877 () Bool)

(assert (=> b!238514 (=> (not res!116877) (not e!154848))))

(assert (=> b!238514 (= res!116877 (contains!1676 lt!120662 (select (arr!5600 (_keys!6520 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!238514 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5941 (_keys!6520 thiss!1504))))))

(declare-fun b!238515 () Bool)

(declare-fun e!154857 () ListLongMap!3519)

(assert (=> b!238515 (= e!154845 e!154857)))

(assert (=> b!238515 (= c!39790 (and (not (= (bvand (extraKeys!4157 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4157 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!238516 () Bool)

(declare-fun e!154855 () Bool)

(assert (=> b!238516 (= e!154855 (not call!22167))))

(declare-fun b!238517 () Bool)

(declare-fun e!154854 () Bool)

(assert (=> b!238517 (= e!154854 (not call!22166))))

(declare-fun b!238518 () Bool)

(declare-fun get!2895 (ValueCell!2786 V!7993) V!7993)

(declare-fun dynLambda!563 (Int (_ BitVec 64)) V!7993)

(assert (=> b!238518 (= e!154848 (= (apply!220 lt!120662 (select (arr!5600 (_keys!6520 thiss!1504)) #b00000000000000000000000000000000)) (get!2895 (select (arr!5599 (_values!4403 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!563 (defaultEntry!4420 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!238518 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5940 (_values!4403 thiss!1504))))))

(assert (=> b!238518 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5941 (_keys!6520 thiss!1504))))))

(declare-fun b!238519 () Bool)

(declare-fun e!154856 () Bool)

(assert (=> b!238519 (= e!154856 (validKeyInArray!0 (select (arr!5600 (_keys!6520 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!238520 () Bool)

(declare-fun Unit!7306 () Unit!7303)

(assert (=> b!238520 (= e!154849 Unit!7306)))

(declare-fun bm!22162 () Bool)

(assert (=> bm!22162 (= call!22161 (getCurrentListMapNoExtraKeys!536 (_keys!6520 thiss!1504) (_values!4403 thiss!1504) (mask!10451 thiss!1504) (extraKeys!4157 thiss!1504) (zeroValue!4261 thiss!1504) (minValue!4261 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4420 thiss!1504)))))

(declare-fun b!238521 () Bool)

(declare-fun e!154851 () ListLongMap!3519)

(assert (=> b!238521 (= e!154851 call!22164)))

(declare-fun b!238522 () Bool)

(assert (=> b!238522 (= e!154846 (validKeyInArray!0 (select (arr!5600 (_keys!6520 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!238523 () Bool)

(declare-fun c!39792 () Bool)

(assert (=> b!238523 (= c!39792 (and (not (= (bvand (extraKeys!4157 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4157 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!238523 (= e!154857 e!154851)))

(declare-fun b!238524 () Bool)

(declare-fun res!116881 () Bool)

(assert (=> b!238524 (=> (not res!116881) (not e!154853))))

(assert (=> b!238524 (= res!116881 e!154855)))

(declare-fun c!39793 () Bool)

(assert (=> b!238524 (= c!39793 (not (= (bvand (extraKeys!4157 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!22163 () Bool)

(assert (=> bm!22163 (= call!22164 call!22165)))

(declare-fun b!238525 () Bool)

(assert (=> b!238525 (= e!154854 e!154852)))

(declare-fun res!116885 () Bool)

(assert (=> b!238525 (= res!116885 call!22166)))

(assert (=> b!238525 (=> (not res!116885) (not e!154852))))

(declare-fun b!238526 () Bool)

(declare-fun call!22163 () ListLongMap!3519)

(assert (=> b!238526 (= e!154857 call!22163)))

(declare-fun bm!22164 () Bool)

(assert (=> bm!22164 (= call!22163 call!22162)))

(declare-fun b!238527 () Bool)

(assert (=> b!238527 (= e!154853 e!154854)))

(declare-fun c!39794 () Bool)

(assert (=> b!238527 (= c!39794 (not (= (bvand (extraKeys!4157 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!238528 () Bool)

(declare-fun res!116880 () Bool)

(assert (=> b!238528 (=> (not res!116880) (not e!154853))))

(assert (=> b!238528 (= res!116880 e!154850)))

(declare-fun res!116884 () Bool)

(assert (=> b!238528 (=> res!116884 e!154850)))

(assert (=> b!238528 (= res!116884 (not e!154856))))

(declare-fun res!116883 () Bool)

(assert (=> b!238528 (=> (not res!116883) (not e!154856))))

(assert (=> b!238528 (= res!116883 (bvslt #b00000000000000000000000000000000 (size!5941 (_keys!6520 thiss!1504))))))

(declare-fun b!238529 () Bool)

(assert (=> b!238529 (= e!154851 call!22163)))

(declare-fun b!238530 () Bool)

(assert (=> b!238530 (= e!154845 (+!647 call!22162 (tuple2!4605 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4261 thiss!1504))))))

(declare-fun b!238531 () Bool)

(assert (=> b!238531 (= e!154855 e!154847)))

(declare-fun res!116878 () Bool)

(assert (=> b!238531 (= res!116878 call!22167)))

(assert (=> b!238531 (=> (not res!116878) (not e!154847))))

(assert (= (and d!59835 c!39791) b!238530))

(assert (= (and d!59835 (not c!39791)) b!238515))

(assert (= (and b!238515 c!39790) b!238526))

(assert (= (and b!238515 (not c!39790)) b!238523))

(assert (= (and b!238523 c!39792) b!238529))

(assert (= (and b!238523 (not c!39792)) b!238521))

(assert (= (or b!238529 b!238521) bm!22163))

(assert (= (or b!238526 bm!22163) bm!22158))

(assert (= (or b!238526 b!238529) bm!22164))

(assert (= (or b!238530 bm!22158) bm!22162))

(assert (= (or b!238530 bm!22164) bm!22160))

(assert (= (and d!59835 res!116879) b!238522))

(assert (= (and d!59835 c!39795) b!238513))

(assert (= (and d!59835 (not c!39795)) b!238520))

(assert (= (and d!59835 res!116882) b!238528))

(assert (= (and b!238528 res!116883) b!238519))

(assert (= (and b!238528 (not res!116884)) b!238514))

(assert (= (and b!238514 res!116877) b!238518))

(assert (= (and b!238528 res!116880) b!238524))

(assert (= (and b!238524 c!39793) b!238531))

(assert (= (and b!238524 (not c!39793)) b!238516))

(assert (= (and b!238531 res!116878) b!238512))

(assert (= (or b!238531 b!238516) bm!22161))

(assert (= (and b!238524 res!116881) b!238527))

(assert (= (and b!238527 c!39794) b!238525))

(assert (= (and b!238527 (not c!39794)) b!238517))

(assert (= (and b!238525 res!116885) b!238511))

(assert (= (or b!238525 b!238517) bm!22159))

(declare-fun b_lambda!7997 () Bool)

(assert (=> (not b_lambda!7997) (not b!238518)))

(declare-fun t!8486 () Bool)

(declare-fun tb!2945 () Bool)

(assert (=> (and b!238348 (= (defaultEntry!4420 thiss!1504) (defaultEntry!4420 thiss!1504)) t!8486) tb!2945))

(declare-fun result!5173 () Bool)

(assert (=> tb!2945 (= result!5173 tp_is_empty!6259)))

(assert (=> b!238518 t!8486))

(declare-fun b_and!13381 () Bool)

(assert (= b_and!13375 (and (=> t!8486 result!5173) b_and!13381)))

(assert (=> b!238519 m!259149))

(assert (=> b!238519 m!259149))

(assert (=> b!238519 m!259151))

(assert (=> d!59835 m!259081))

(declare-fun m!259171 () Bool)

(assert (=> b!238513 m!259171))

(assert (=> b!238513 m!259171))

(declare-fun m!259173 () Bool)

(assert (=> b!238513 m!259173))

(declare-fun m!259175 () Bool)

(assert (=> b!238513 m!259175))

(declare-fun m!259177 () Bool)

(assert (=> b!238513 m!259177))

(declare-fun m!259179 () Bool)

(assert (=> b!238513 m!259179))

(declare-fun m!259181 () Bool)

(assert (=> b!238513 m!259181))

(declare-fun m!259183 () Bool)

(assert (=> b!238513 m!259183))

(declare-fun m!259185 () Bool)

(assert (=> b!238513 m!259185))

(declare-fun m!259187 () Bool)

(assert (=> b!238513 m!259187))

(assert (=> b!238513 m!259175))

(declare-fun m!259189 () Bool)

(assert (=> b!238513 m!259189))

(declare-fun m!259191 () Bool)

(assert (=> b!238513 m!259191))

(assert (=> b!238513 m!259149))

(assert (=> b!238513 m!259177))

(declare-fun m!259193 () Bool)

(assert (=> b!238513 m!259193))

(declare-fun m!259195 () Bool)

(assert (=> b!238513 m!259195))

(assert (=> b!238513 m!259183))

(declare-fun m!259197 () Bool)

(assert (=> b!238513 m!259197))

(declare-fun m!259199 () Bool)

(assert (=> b!238513 m!259199))

(declare-fun m!259201 () Bool)

(assert (=> b!238513 m!259201))

(declare-fun m!259203 () Bool)

(assert (=> b!238511 m!259203))

(declare-fun m!259205 () Bool)

(assert (=> b!238530 m!259205))

(assert (=> b!238522 m!259149))

(assert (=> b!238522 m!259149))

(assert (=> b!238522 m!259151))

(assert (=> bm!22162 m!259179))

(assert (=> b!238518 m!259149))

(declare-fun m!259207 () Bool)

(assert (=> b!238518 m!259207))

(declare-fun m!259209 () Bool)

(assert (=> b!238518 m!259209))

(assert (=> b!238518 m!259149))

(declare-fun m!259211 () Bool)

(assert (=> b!238518 m!259211))

(assert (=> b!238518 m!259211))

(assert (=> b!238518 m!259209))

(declare-fun m!259213 () Bool)

(assert (=> b!238518 m!259213))

(declare-fun m!259215 () Bool)

(assert (=> bm!22159 m!259215))

(assert (=> b!238514 m!259149))

(assert (=> b!238514 m!259149))

(declare-fun m!259217 () Bool)

(assert (=> b!238514 m!259217))

(declare-fun m!259219 () Bool)

(assert (=> bm!22160 m!259219))

(declare-fun m!259221 () Bool)

(assert (=> b!238512 m!259221))

(declare-fun m!259223 () Bool)

(assert (=> bm!22161 m!259223))

(assert (=> b!238343 d!59835))

(declare-fun b!238544 () Bool)

(declare-fun e!154869 () Bool)

(declare-fun e!154867 () Bool)

(assert (=> b!238544 (= e!154869 e!154867)))

(declare-fun res!116892 () Bool)

(assert (=> b!238544 (=> (not res!116892) (not e!154867))))

(declare-fun e!154866 () Bool)

(assert (=> b!238544 (= res!116892 (not e!154866))))

(declare-fun res!116894 () Bool)

(assert (=> b!238544 (=> (not res!116894) (not e!154866))))

(assert (=> b!238544 (= res!116894 (validKeyInArray!0 (select (arr!5600 (_keys!6520 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!238545 () Bool)

(declare-fun e!154868 () Bool)

(assert (=> b!238545 (= e!154867 e!154868)))

(declare-fun c!39798 () Bool)

(assert (=> b!238545 (= c!39798 (validKeyInArray!0 (select (arr!5600 (_keys!6520 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!238546 () Bool)

(declare-fun call!22170 () Bool)

(assert (=> b!238546 (= e!154868 call!22170)))

(declare-fun d!59837 () Bool)

(declare-fun res!116893 () Bool)

(assert (=> d!59837 (=> res!116893 e!154869)))

(assert (=> d!59837 (= res!116893 (bvsge #b00000000000000000000000000000000 (size!5941 (_keys!6520 thiss!1504))))))

(assert (=> d!59837 (= (arrayNoDuplicates!0 (_keys!6520 thiss!1504) #b00000000000000000000000000000000 Nil!3492) e!154869)))

(declare-fun b!238547 () Bool)

(declare-fun contains!1679 (List!3495 (_ BitVec 64)) Bool)

(assert (=> b!238547 (= e!154866 (contains!1679 Nil!3492 (select (arr!5600 (_keys!6520 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!238548 () Bool)

(assert (=> b!238548 (= e!154868 call!22170)))

(declare-fun bm!22167 () Bool)

(assert (=> bm!22167 (= call!22170 (arrayNoDuplicates!0 (_keys!6520 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!39798 (Cons!3491 (select (arr!5600 (_keys!6520 thiss!1504)) #b00000000000000000000000000000000) Nil!3492) Nil!3492)))))

(assert (= (and d!59837 (not res!116893)) b!238544))

(assert (= (and b!238544 res!116894) b!238547))

(assert (= (and b!238544 res!116892) b!238545))

(assert (= (and b!238545 c!39798) b!238548))

(assert (= (and b!238545 (not c!39798)) b!238546))

(assert (= (or b!238548 b!238546) bm!22167))

(assert (=> b!238544 m!259149))

(assert (=> b!238544 m!259149))

(assert (=> b!238544 m!259151))

(assert (=> b!238545 m!259149))

(assert (=> b!238545 m!259149))

(assert (=> b!238545 m!259151))

(assert (=> b!238547 m!259149))

(assert (=> b!238547 m!259149))

(declare-fun m!259225 () Bool)

(assert (=> b!238547 m!259225))

(assert (=> bm!22167 m!259149))

(declare-fun m!259227 () Bool)

(assert (=> bm!22167 m!259227))

(assert (=> b!238339 d!59837))

(declare-fun d!59839 () Bool)

(assert (=> d!59839 (= (array_inv!3681 (_keys!6520 thiss!1504)) (bvsge (size!5941 (_keys!6520 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!238348 d!59839))

(declare-fun d!59841 () Bool)

(assert (=> d!59841 (= (array_inv!3682 (_values!4403 thiss!1504)) (bvsge (size!5940 (_values!4403 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!238348 d!59841))

(declare-fun mapNonEmpty!10626 () Bool)

(declare-fun mapRes!10626 () Bool)

(declare-fun tp!22407 () Bool)

(declare-fun e!154875 () Bool)

(assert (=> mapNonEmpty!10626 (= mapRes!10626 (and tp!22407 e!154875))))

(declare-fun mapValue!10626 () ValueCell!2786)

(declare-fun mapRest!10626 () (Array (_ BitVec 32) ValueCell!2786))

(declare-fun mapKey!10626 () (_ BitVec 32))

(assert (=> mapNonEmpty!10626 (= mapRest!10617 (store mapRest!10626 mapKey!10626 mapValue!10626))))

(declare-fun b!238556 () Bool)

(declare-fun e!154874 () Bool)

(assert (=> b!238556 (= e!154874 tp_is_empty!6259)))

(declare-fun condMapEmpty!10626 () Bool)

(declare-fun mapDefault!10626 () ValueCell!2786)

(assert (=> mapNonEmpty!10617 (= condMapEmpty!10626 (= mapRest!10617 ((as const (Array (_ BitVec 32) ValueCell!2786)) mapDefault!10626)))))

(assert (=> mapNonEmpty!10617 (= tp!22392 (and e!154874 mapRes!10626))))

(declare-fun mapIsEmpty!10626 () Bool)

(assert (=> mapIsEmpty!10626 mapRes!10626))

(declare-fun b!238555 () Bool)

(assert (=> b!238555 (= e!154875 tp_is_empty!6259)))

(assert (= (and mapNonEmpty!10617 condMapEmpty!10626) mapIsEmpty!10626))

(assert (= (and mapNonEmpty!10617 (not condMapEmpty!10626)) mapNonEmpty!10626))

(assert (= (and mapNonEmpty!10626 ((_ is ValueCellFull!2786) mapValue!10626)) b!238555))

(assert (= (and mapNonEmpty!10617 ((_ is ValueCellFull!2786) mapDefault!10626)) b!238556))

(declare-fun m!259229 () Bool)

(assert (=> mapNonEmpty!10626 m!259229))

(declare-fun b_lambda!7999 () Bool)

(assert (= b_lambda!7997 (or (and b!238348 b_free!6397) b_lambda!7999)))

(check-sat (not b!238522) (not b!238518) b_and!13381 (not d!59829) (not b_lambda!7999) (not b!238447) (not bm!22161) (not bm!22167) (not d!59835) (not b!238466) (not b!238449) (not bm!22160) (not d!59823) (not b!238457) (not b!238468) (not bm!22143) (not b!238436) (not b!238519) (not bm!22162) (not b!238547) (not bm!22159) (not b!238458) (not b!238511) (not b!238544) tp_is_empty!6259 (not d!59833) (not b!238514) (not b!238545) (not b!238530) (not b_next!6397) (not b!238512) (not b!238513) (not b!238459) (not mapNonEmpty!10626))
(check-sat b_and!13381 (not b_next!6397))

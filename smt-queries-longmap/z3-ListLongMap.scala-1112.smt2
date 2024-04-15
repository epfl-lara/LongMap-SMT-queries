; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22922 () Bool)

(assert start!22922)

(declare-fun b!238853 () Bool)

(declare-fun b_free!6421 () Bool)

(declare-fun b_next!6421 () Bool)

(assert (=> b!238853 (= b_free!6421 (not b_next!6421))))

(declare-fun tp!22466 () Bool)

(declare-fun b_and!13361 () Bool)

(assert (=> b!238853 (= tp!22466 b_and!13361)))

(declare-fun mapNonEmpty!10656 () Bool)

(declare-fun mapRes!10656 () Bool)

(declare-fun tp!22467 () Bool)

(declare-fun e!155078 () Bool)

(assert (=> mapNonEmpty!10656 (= mapRes!10656 (and tp!22467 e!155078))))

(declare-datatypes ((V!8025 0))(
  ( (V!8026 (val!3186 Int)) )
))
(declare-datatypes ((ValueCell!2798 0))(
  ( (ValueCellFull!2798 (v!5218 V!8025)) (EmptyCell!2798) )
))
(declare-datatypes ((array!11837 0))(
  ( (array!11838 (arr!5619 (Array (_ BitVec 32) ValueCell!2798)) (size!5961 (_ BitVec 32))) )
))
(declare-datatypes ((array!11839 0))(
  ( (array!11840 (arr!5620 (Array (_ BitVec 32) (_ BitVec 64))) (size!5962 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3496 0))(
  ( (LongMapFixedSize!3497 (defaultEntry!4433 Int) (mask!10474 (_ BitVec 32)) (extraKeys!4170 (_ BitVec 32)) (zeroValue!4274 V!8025) (minValue!4274 V!8025) (_size!1797 (_ BitVec 32)) (_keys!6534 array!11839) (_values!4416 array!11837) (_vacant!1797 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3496)

(declare-fun mapRest!10656 () (Array (_ BitVec 32) ValueCell!2798))

(declare-fun mapKey!10656 () (_ BitVec 32))

(declare-fun mapValue!10656 () ValueCell!2798)

(assert (=> mapNonEmpty!10656 (= (arr!5619 (_values!4416 thiss!1504)) (store mapRest!10656 mapKey!10656 mapValue!10656))))

(declare-fun e!155074 () Bool)

(declare-fun tp_is_empty!6283 () Bool)

(declare-fun e!155077 () Bool)

(declare-fun array_inv!3707 (array!11839) Bool)

(declare-fun array_inv!3708 (array!11837) Bool)

(assert (=> b!238853 (= e!155077 (and tp!22466 tp_is_empty!6283 (array_inv!3707 (_keys!6534 thiss!1504)) (array_inv!3708 (_values!4416 thiss!1504)) e!155074))))

(declare-fun b!238854 () Bool)

(declare-fun res!117040 () Bool)

(declare-fun e!155084 () Bool)

(assert (=> b!238854 (=> (not res!117040) (not e!155084))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!238854 (= res!117040 (validMask!0 (mask!10474 thiss!1504)))))

(declare-fun b!238855 () Bool)

(declare-fun e!155079 () Bool)

(declare-fun call!22200 () Bool)

(assert (=> b!238855 (= e!155079 (not call!22200))))

(declare-fun b!238856 () Bool)

(assert (=> b!238856 (= e!155078 tp_is_empty!6283)))

(declare-fun b!238857 () Bool)

(declare-fun res!117036 () Bool)

(assert (=> b!238857 (=> (not res!117036) (not e!155079))))

(declare-datatypes ((SeekEntryResult!1022 0))(
  ( (MissingZero!1022 (index!6258 (_ BitVec 32))) (Found!1022 (index!6259 (_ BitVec 32))) (Intermediate!1022 (undefined!1834 Bool) (index!6260 (_ BitVec 32)) (x!24077 (_ BitVec 32))) (Undefined!1022) (MissingVacant!1022 (index!6261 (_ BitVec 32))) )
))
(declare-fun lt!120523 () SeekEntryResult!1022)

(assert (=> b!238857 (= res!117036 (= (select (arr!5620 (_keys!6534 thiss!1504)) (index!6258 lt!120523)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!22199 () Bool)

(declare-fun c!39821 () Bool)

(declare-fun bm!22196 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22196 (= call!22199 (inRange!0 (ite c!39821 (index!6258 lt!120523) (index!6261 lt!120523)) (mask!10474 thiss!1504)))))

(declare-fun b!238858 () Bool)

(declare-fun e!155085 () Bool)

(declare-fun e!155082 () Bool)

(assert (=> b!238858 (= e!155085 e!155082)))

(declare-fun res!117039 () Bool)

(assert (=> b!238858 (=> (not res!117039) (not e!155082))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!238858 (= res!117039 (or (= lt!120523 (MissingZero!1022 index!297)) (= lt!120523 (MissingVacant!1022 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11839 (_ BitVec 32)) SeekEntryResult!1022)

(assert (=> b!238858 (= lt!120523 (seekEntryOrOpen!0 key!932 (_keys!6534 thiss!1504) (mask!10474 thiss!1504)))))

(declare-fun b!238859 () Bool)

(assert (=> b!238859 (= e!155084 (and (= (size!5961 (_values!4416 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10474 thiss!1504))) (not (= (size!5962 (_keys!6534 thiss!1504)) (size!5961 (_values!4416 thiss!1504))))))))

(declare-fun mapIsEmpty!10656 () Bool)

(assert (=> mapIsEmpty!10656 mapRes!10656))

(declare-fun b!238860 () Bool)

(declare-fun e!155080 () Bool)

(assert (=> b!238860 (= e!155080 (not call!22200))))

(declare-fun b!238861 () Bool)

(declare-fun res!117034 () Bool)

(assert (=> b!238861 (=> (not res!117034) (not e!155084))))

(declare-fun arrayContainsKey!0 (array!11839 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!238861 (= res!117034 (arrayContainsKey!0 (_keys!6534 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!238862 () Bool)

(declare-fun e!155076 () Bool)

(assert (=> b!238862 (= e!155074 (and e!155076 mapRes!10656))))

(declare-fun condMapEmpty!10656 () Bool)

(declare-fun mapDefault!10656 () ValueCell!2798)

(assert (=> b!238862 (= condMapEmpty!10656 (= (arr!5619 (_values!4416 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2798)) mapDefault!10656)))))

(declare-fun b!238863 () Bool)

(declare-fun res!117035 () Bool)

(assert (=> b!238863 (=> (not res!117035) (not e!155079))))

(assert (=> b!238863 (= res!117035 call!22199)))

(declare-fun e!155081 () Bool)

(assert (=> b!238863 (= e!155081 e!155079)))

(declare-fun b!238864 () Bool)

(assert (=> b!238864 (= e!155076 tp_is_empty!6283)))

(declare-fun b!238865 () Bool)

(declare-fun res!117038 () Bool)

(assert (=> b!238865 (= res!117038 (= (select (arr!5620 (_keys!6534 thiss!1504)) (index!6261 lt!120523)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!238865 (=> (not res!117038) (not e!155080))))

(declare-fun b!238866 () Bool)

(declare-datatypes ((Unit!7326 0))(
  ( (Unit!7327) )
))
(declare-fun e!155075 () Unit!7326)

(declare-fun Unit!7328 () Unit!7326)

(assert (=> b!238866 (= e!155075 Unit!7328)))

(declare-fun lt!120524 () Unit!7326)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!330 (array!11839 array!11837 (_ BitVec 32) (_ BitVec 32) V!8025 V!8025 (_ BitVec 64) Int) Unit!7326)

(assert (=> b!238866 (= lt!120524 (lemmaInListMapThenSeekEntryOrOpenFindsIt!330 (_keys!6534 thiss!1504) (_values!4416 thiss!1504) (mask!10474 thiss!1504) (extraKeys!4170 thiss!1504) (zeroValue!4274 thiss!1504) (minValue!4274 thiss!1504) key!932 (defaultEntry!4433 thiss!1504)))))

(assert (=> b!238866 false))

(declare-fun b!238867 () Bool)

(assert (=> b!238867 (= e!155082 e!155084)))

(declare-fun res!117041 () Bool)

(assert (=> b!238867 (=> (not res!117041) (not e!155084))))

(assert (=> b!238867 (= res!117041 (inRange!0 index!297 (mask!10474 thiss!1504)))))

(declare-fun lt!120522 () Unit!7326)

(assert (=> b!238867 (= lt!120522 e!155075)))

(declare-fun c!39822 () Bool)

(declare-datatypes ((tuple2!4668 0))(
  ( (tuple2!4669 (_1!2345 (_ BitVec 64)) (_2!2345 V!8025)) )
))
(declare-datatypes ((List!3577 0))(
  ( (Nil!3574) (Cons!3573 (h!4229 tuple2!4668) (t!8563 List!3577)) )
))
(declare-datatypes ((ListLongMap!3571 0))(
  ( (ListLongMap!3572 (toList!1801 List!3577)) )
))
(declare-fun contains!1692 (ListLongMap!3571 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1310 (array!11839 array!11837 (_ BitVec 32) (_ BitVec 32) V!8025 V!8025 (_ BitVec 32) Int) ListLongMap!3571)

(assert (=> b!238867 (= c!39822 (contains!1692 (getCurrentListMap!1310 (_keys!6534 thiss!1504) (_values!4416 thiss!1504) (mask!10474 thiss!1504) (extraKeys!4170 thiss!1504) (zeroValue!4274 thiss!1504) (minValue!4274 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4433 thiss!1504)) key!932))))

(declare-fun bm!22197 () Bool)

(assert (=> bm!22197 (= call!22200 (arrayContainsKey!0 (_keys!6534 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!238868 () Bool)

(declare-fun c!39820 () Bool)

(get-info :version)

(assert (=> b!238868 (= c!39820 ((_ is MissingVacant!1022) lt!120523))))

(declare-fun e!155083 () Bool)

(assert (=> b!238868 (= e!155081 e!155083)))

(declare-fun res!117033 () Bool)

(assert (=> start!22922 (=> (not res!117033) (not e!155085))))

(declare-fun valid!1385 (LongMapFixedSize!3496) Bool)

(assert (=> start!22922 (= res!117033 (valid!1385 thiss!1504))))

(assert (=> start!22922 e!155085))

(assert (=> start!22922 e!155077))

(assert (=> start!22922 true))

(declare-fun b!238869 () Bool)

(declare-fun res!117042 () Bool)

(assert (=> b!238869 (=> (not res!117042) (not e!155085))))

(assert (=> b!238869 (= res!117042 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!238870 () Bool)

(declare-fun lt!120521 () Unit!7326)

(assert (=> b!238870 (= e!155075 lt!120521)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!325 (array!11839 array!11837 (_ BitVec 32) (_ BitVec 32) V!8025 V!8025 (_ BitVec 64) Int) Unit!7326)

(assert (=> b!238870 (= lt!120521 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!325 (_keys!6534 thiss!1504) (_values!4416 thiss!1504) (mask!10474 thiss!1504) (extraKeys!4170 thiss!1504) (zeroValue!4274 thiss!1504) (minValue!4274 thiss!1504) key!932 (defaultEntry!4433 thiss!1504)))))

(assert (=> b!238870 (= c!39821 ((_ is MissingZero!1022) lt!120523))))

(assert (=> b!238870 e!155081))

(declare-fun b!238871 () Bool)

(assert (=> b!238871 (= e!155083 ((_ is Undefined!1022) lt!120523))))

(declare-fun b!238872 () Bool)

(assert (=> b!238872 (= e!155083 e!155080)))

(declare-fun res!117037 () Bool)

(assert (=> b!238872 (= res!117037 call!22199)))

(assert (=> b!238872 (=> (not res!117037) (not e!155080))))

(assert (= (and start!22922 res!117033) b!238869))

(assert (= (and b!238869 res!117042) b!238858))

(assert (= (and b!238858 res!117039) b!238867))

(assert (= (and b!238867 c!39822) b!238866))

(assert (= (and b!238867 (not c!39822)) b!238870))

(assert (= (and b!238870 c!39821) b!238863))

(assert (= (and b!238870 (not c!39821)) b!238868))

(assert (= (and b!238863 res!117035) b!238857))

(assert (= (and b!238857 res!117036) b!238855))

(assert (= (and b!238868 c!39820) b!238872))

(assert (= (and b!238868 (not c!39820)) b!238871))

(assert (= (and b!238872 res!117037) b!238865))

(assert (= (and b!238865 res!117038) b!238860))

(assert (= (or b!238863 b!238872) bm!22196))

(assert (= (or b!238855 b!238860) bm!22197))

(assert (= (and b!238867 res!117041) b!238861))

(assert (= (and b!238861 res!117034) b!238854))

(assert (= (and b!238854 res!117040) b!238859))

(assert (= (and b!238862 condMapEmpty!10656) mapIsEmpty!10656))

(assert (= (and b!238862 (not condMapEmpty!10656)) mapNonEmpty!10656))

(assert (= (and mapNonEmpty!10656 ((_ is ValueCellFull!2798) mapValue!10656)) b!238856))

(assert (= (and b!238862 ((_ is ValueCellFull!2798) mapDefault!10656)) b!238864))

(assert (= b!238853 b!238862))

(assert (= start!22922 b!238853))

(declare-fun m!258673 () Bool)

(assert (=> b!238861 m!258673))

(assert (=> bm!22197 m!258673))

(declare-fun m!258675 () Bool)

(assert (=> b!238865 m!258675))

(declare-fun m!258677 () Bool)

(assert (=> b!238870 m!258677))

(declare-fun m!258679 () Bool)

(assert (=> b!238854 m!258679))

(declare-fun m!258681 () Bool)

(assert (=> b!238867 m!258681))

(declare-fun m!258683 () Bool)

(assert (=> b!238867 m!258683))

(assert (=> b!238867 m!258683))

(declare-fun m!258685 () Bool)

(assert (=> b!238867 m!258685))

(declare-fun m!258687 () Bool)

(assert (=> b!238857 m!258687))

(declare-fun m!258689 () Bool)

(assert (=> b!238866 m!258689))

(declare-fun m!258691 () Bool)

(assert (=> start!22922 m!258691))

(declare-fun m!258693 () Bool)

(assert (=> bm!22196 m!258693))

(declare-fun m!258695 () Bool)

(assert (=> b!238858 m!258695))

(declare-fun m!258697 () Bool)

(assert (=> mapNonEmpty!10656 m!258697))

(declare-fun m!258699 () Bool)

(assert (=> b!238853 m!258699))

(declare-fun m!258701 () Bool)

(assert (=> b!238853 m!258701))

(check-sat (not start!22922) (not b!238853) (not b!238866) (not b!238870) tp_is_empty!6283 b_and!13361 (not b_next!6421) (not b!238854) (not mapNonEmpty!10656) (not b!238867) (not b!238861) (not b!238858) (not bm!22196) (not bm!22197))
(check-sat b_and!13361 (not b_next!6421))

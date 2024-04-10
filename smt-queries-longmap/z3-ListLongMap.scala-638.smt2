; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16178 () Bool)

(assert start!16178)

(declare-fun b!161316 () Bool)

(declare-fun b_free!3639 () Bool)

(declare-fun b_next!3639 () Bool)

(assert (=> b!161316 (= b_free!3639 (not b_next!3639))))

(declare-fun tp!13487 () Bool)

(declare-fun b_and!10053 () Bool)

(assert (=> b!161316 (= tp!13487 b_and!10053)))

(declare-fun b!161315 () Bool)

(declare-fun res!76485 () Bool)

(declare-fun e!105412 () Bool)

(assert (=> b!161315 (=> (not res!76485) (not e!105412))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4235 0))(
  ( (V!4236 (val!1765 Int)) )
))
(declare-datatypes ((ValueCell!1377 0))(
  ( (ValueCellFull!1377 (v!3630 V!4235)) (EmptyCell!1377) )
))
(declare-datatypes ((array!5961 0))(
  ( (array!5962 (arr!2825 (Array (_ BitVec 32) (_ BitVec 64))) (size!3109 (_ BitVec 32))) )
))
(declare-datatypes ((array!5963 0))(
  ( (array!5964 (arr!2826 (Array (_ BitVec 32) ValueCell!1377)) (size!3110 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1662 0))(
  ( (LongMapFixedSize!1663 (defaultEntry!3273 Int) (mask!7861 (_ BitVec 32)) (extraKeys!3014 (_ BitVec 32)) (zeroValue!3116 V!4235) (minValue!3116 V!4235) (_size!880 (_ BitVec 32)) (_keys!5074 array!5961) (_values!3256 array!5963) (_vacant!880 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1662)

(get-info :version)

(declare-datatypes ((SeekEntryResult!352 0))(
  ( (MissingZero!352 (index!3576 (_ BitVec 32))) (Found!352 (index!3577 (_ BitVec 32))) (Intermediate!352 (undefined!1164 Bool) (index!3578 (_ BitVec 32)) (x!17800 (_ BitVec 32))) (Undefined!352) (MissingVacant!352 (index!3579 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5961 (_ BitVec 32)) SeekEntryResult!352)

(assert (=> b!161315 (= res!76485 ((_ is Undefined!352) (seekEntryOrOpen!0 key!828 (_keys!5074 thiss!1248) (mask!7861 thiss!1248))))))

(declare-fun tp_is_empty!3441 () Bool)

(declare-fun e!105414 () Bool)

(declare-fun e!105413 () Bool)

(declare-fun array_inv!1807 (array!5961) Bool)

(declare-fun array_inv!1808 (array!5963) Bool)

(assert (=> b!161316 (= e!105413 (and tp!13487 tp_is_empty!3441 (array_inv!1807 (_keys!5074 thiss!1248)) (array_inv!1808 (_values!3256 thiss!1248)) e!105414))))

(declare-fun mapNonEmpty!5849 () Bool)

(declare-fun mapRes!5849 () Bool)

(declare-fun tp!13486 () Bool)

(declare-fun e!105417 () Bool)

(assert (=> mapNonEmpty!5849 (= mapRes!5849 (and tp!13486 e!105417))))

(declare-fun mapRest!5849 () (Array (_ BitVec 32) ValueCell!1377))

(declare-fun mapKey!5849 () (_ BitVec 32))

(declare-fun mapValue!5849 () ValueCell!1377)

(assert (=> mapNonEmpty!5849 (= (arr!2826 (_values!3256 thiss!1248)) (store mapRest!5849 mapKey!5849 mapValue!5849))))

(declare-fun b!161317 () Bool)

(declare-fun e!105415 () Bool)

(assert (=> b!161317 (= e!105414 (and e!105415 mapRes!5849))))

(declare-fun condMapEmpty!5849 () Bool)

(declare-fun mapDefault!5849 () ValueCell!1377)

(assert (=> b!161317 (= condMapEmpty!5849 (= (arr!2826 (_values!3256 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1377)) mapDefault!5849)))))

(declare-fun b!161318 () Bool)

(assert (=> b!161318 (= e!105412 false)))

(declare-datatypes ((Unit!5007 0))(
  ( (Unit!5008) )
))
(declare-fun lt!82186 () Unit!5007)

(declare-fun e!105411 () Unit!5007)

(assert (=> b!161318 (= lt!82186 e!105411)))

(declare-fun c!29947 () Bool)

(declare-datatypes ((tuple2!2956 0))(
  ( (tuple2!2957 (_1!1489 (_ BitVec 64)) (_2!1489 V!4235)) )
))
(declare-datatypes ((List!1974 0))(
  ( (Nil!1971) (Cons!1970 (h!2583 tuple2!2956) (t!6776 List!1974)) )
))
(declare-datatypes ((ListLongMap!1943 0))(
  ( (ListLongMap!1944 (toList!987 List!1974)) )
))
(declare-fun contains!1023 (ListLongMap!1943 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!651 (array!5961 array!5963 (_ BitVec 32) (_ BitVec 32) V!4235 V!4235 (_ BitVec 32) Int) ListLongMap!1943)

(assert (=> b!161318 (= c!29947 (contains!1023 (getCurrentListMap!651 (_keys!5074 thiss!1248) (_values!3256 thiss!1248) (mask!7861 thiss!1248) (extraKeys!3014 thiss!1248) (zeroValue!3116 thiss!1248) (minValue!3116 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3273 thiss!1248)) key!828))))

(declare-fun b!161319 () Bool)

(declare-fun Unit!5009 () Unit!5007)

(assert (=> b!161319 (= e!105411 Unit!5009)))

(declare-fun lt!82185 () Unit!5007)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!75 (array!5961 array!5963 (_ BitVec 32) (_ BitVec 32) V!4235 V!4235 (_ BitVec 64) Int) Unit!5007)

(assert (=> b!161319 (= lt!82185 (lemmaInListMapThenSeekEntryOrOpenFindsIt!75 (_keys!5074 thiss!1248) (_values!3256 thiss!1248) (mask!7861 thiss!1248) (extraKeys!3014 thiss!1248) (zeroValue!3116 thiss!1248) (minValue!3116 thiss!1248) key!828 (defaultEntry!3273 thiss!1248)))))

(assert (=> b!161319 false))

(declare-fun b!161320 () Bool)

(assert (=> b!161320 (= e!105415 tp_is_empty!3441)))

(declare-fun res!76487 () Bool)

(assert (=> start!16178 (=> (not res!76487) (not e!105412))))

(declare-fun valid!763 (LongMapFixedSize!1662) Bool)

(assert (=> start!16178 (= res!76487 (valid!763 thiss!1248))))

(assert (=> start!16178 e!105412))

(assert (=> start!16178 e!105413))

(assert (=> start!16178 true))

(declare-fun mapIsEmpty!5849 () Bool)

(assert (=> mapIsEmpty!5849 mapRes!5849))

(declare-fun b!161321 () Bool)

(assert (=> b!161321 (= e!105417 tp_is_empty!3441)))

(declare-fun b!161322 () Bool)

(declare-fun res!76486 () Bool)

(assert (=> b!161322 (=> (not res!76486) (not e!105412))))

(assert (=> b!161322 (= res!76486 (not (= key!828 (bvneg key!828))))))

(declare-fun b!161323 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!75 (array!5961 array!5963 (_ BitVec 32) (_ BitVec 32) V!4235 V!4235 (_ BitVec 64) Int) Unit!5007)

(assert (=> b!161323 (= e!105411 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!75 (_keys!5074 thiss!1248) (_values!3256 thiss!1248) (mask!7861 thiss!1248) (extraKeys!3014 thiss!1248) (zeroValue!3116 thiss!1248) (minValue!3116 thiss!1248) key!828 (defaultEntry!3273 thiss!1248)))))

(assert (= (and start!16178 res!76487) b!161322))

(assert (= (and b!161322 res!76486) b!161315))

(assert (= (and b!161315 res!76485) b!161318))

(assert (= (and b!161318 c!29947) b!161319))

(assert (= (and b!161318 (not c!29947)) b!161323))

(assert (= (and b!161317 condMapEmpty!5849) mapIsEmpty!5849))

(assert (= (and b!161317 (not condMapEmpty!5849)) mapNonEmpty!5849))

(assert (= (and mapNonEmpty!5849 ((_ is ValueCellFull!1377) mapValue!5849)) b!161321))

(assert (= (and b!161317 ((_ is ValueCellFull!1377) mapDefault!5849)) b!161320))

(assert (= b!161316 b!161317))

(assert (= start!16178 b!161316))

(declare-fun m!192849 () Bool)

(assert (=> start!16178 m!192849))

(declare-fun m!192851 () Bool)

(assert (=> b!161316 m!192851))

(declare-fun m!192853 () Bool)

(assert (=> b!161316 m!192853))

(declare-fun m!192855 () Bool)

(assert (=> b!161315 m!192855))

(declare-fun m!192857 () Bool)

(assert (=> b!161319 m!192857))

(declare-fun m!192859 () Bool)

(assert (=> mapNonEmpty!5849 m!192859))

(declare-fun m!192861 () Bool)

(assert (=> b!161323 m!192861))

(declare-fun m!192863 () Bool)

(assert (=> b!161318 m!192863))

(assert (=> b!161318 m!192863))

(declare-fun m!192865 () Bool)

(assert (=> b!161318 m!192865))

(check-sat (not mapNonEmpty!5849) b_and!10053 (not b!161323) (not b_next!3639) tp_is_empty!3441 (not b!161316) (not b!161319) (not b!161318) (not b!161315) (not start!16178))
(check-sat b_and!10053 (not b_next!3639))

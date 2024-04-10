; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25188 () Bool)

(assert start!25188)

(declare-fun b!262541 () Bool)

(declare-fun b_free!6791 () Bool)

(declare-fun b_next!6791 () Bool)

(assert (=> b!262541 (= b_free!6791 (not b_next!6791))))

(declare-fun tp!23706 () Bool)

(declare-fun b_and!13929 () Bool)

(assert (=> b!262541 (= tp!23706 b_and!13929)))

(declare-fun b!262537 () Bool)

(declare-fun res!128235 () Bool)

(declare-fun e!170143 () Bool)

(assert (=> b!262537 (=> (not res!128235) (not e!170143))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!262537 (= res!128235 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!262538 () Bool)

(declare-fun e!170144 () Bool)

(declare-fun e!170142 () Bool)

(assert (=> b!262538 (= e!170144 e!170142)))

(declare-fun res!128237 () Bool)

(assert (=> b!262538 (=> (not res!128237) (not e!170142))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!8517 0))(
  ( (V!8518 (val!3371 Int)) )
))
(declare-datatypes ((ValueCell!2983 0))(
  ( (ValueCellFull!2983 (v!5499 V!8517)) (EmptyCell!2983) )
))
(declare-datatypes ((array!12665 0))(
  ( (array!12666 (arr!5994 (Array (_ BitVec 32) ValueCell!2983)) (size!6345 (_ BitVec 32))) )
))
(declare-datatypes ((array!12667 0))(
  ( (array!12668 (arr!5995 (Array (_ BitVec 32) (_ BitVec 64))) (size!6346 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3866 0))(
  ( (LongMapFixedSize!3867 (defaultEntry!4836 Int) (mask!11195 (_ BitVec 32)) (extraKeys!4573 (_ BitVec 32)) (zeroValue!4677 V!8517) (minValue!4677 V!8517) (_size!1982 (_ BitVec 32)) (_keys!7026 array!12667) (_values!4819 array!12665) (_vacant!1982 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3866)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!262538 (= res!128237 (inRange!0 index!297 (mask!11195 thiss!1504)))))

(declare-datatypes ((Unit!8180 0))(
  ( (Unit!8181) )
))
(declare-fun lt!132725 () Unit!8180)

(declare-fun e!170141 () Unit!8180)

(assert (=> b!262538 (= lt!132725 e!170141)))

(declare-fun c!44742 () Bool)

(declare-datatypes ((tuple2!4974 0))(
  ( (tuple2!4975 (_1!2498 (_ BitVec 64)) (_2!2498 V!8517)) )
))
(declare-datatypes ((List!3849 0))(
  ( (Nil!3846) (Cons!3845 (h!4511 tuple2!4974) (t!8924 List!3849)) )
))
(declare-datatypes ((ListLongMap!3887 0))(
  ( (ListLongMap!3888 (toList!1959 List!3849)) )
))
(declare-fun lt!132732 () ListLongMap!3887)

(declare-fun contains!1908 (ListLongMap!3887 (_ BitVec 64)) Bool)

(assert (=> b!262538 (= c!44742 (contains!1908 lt!132732 key!932))))

(declare-fun getCurrentListMap!1487 (array!12667 array!12665 (_ BitVec 32) (_ BitVec 32) V!8517 V!8517 (_ BitVec 32) Int) ListLongMap!3887)

(assert (=> b!262538 (= lt!132732 (getCurrentListMap!1487 (_keys!7026 thiss!1504) (_values!4819 thiss!1504) (mask!11195 thiss!1504) (extraKeys!4573 thiss!1504) (zeroValue!4677 thiss!1504) (minValue!4677 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4836 thiss!1504)))))

(declare-fun b!262539 () Bool)

(declare-fun res!128229 () Bool)

(declare-fun e!170152 () Bool)

(assert (=> b!262539 (=> res!128229 e!170152)))

(assert (=> b!262539 (= res!128229 (or (not (= (size!6345 (_values!4819 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!11195 thiss!1504)))) (not (= (size!6346 (_keys!7026 thiss!1504)) (size!6345 (_values!4819 thiss!1504)))) (bvslt (mask!11195 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4573 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4573 thiss!1504) #b00000000000000000000000000000011) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6346 (_keys!7026 thiss!1504)))))))

(declare-fun b!262540 () Bool)

(declare-fun c!44741 () Bool)

(declare-datatypes ((SeekEntryResult!1198 0))(
  ( (MissingZero!1198 (index!6962 (_ BitVec 32))) (Found!1198 (index!6963 (_ BitVec 32))) (Intermediate!1198 (undefined!2010 Bool) (index!6964 (_ BitVec 32)) (x!25222 (_ BitVec 32))) (Undefined!1198) (MissingVacant!1198 (index!6965 (_ BitVec 32))) )
))
(declare-fun lt!132723 () SeekEntryResult!1198)

(assert (=> b!262540 (= c!44741 (is-MissingVacant!1198 lt!132723))))

(declare-fun e!170140 () Bool)

(declare-fun e!170138 () Bool)

(assert (=> b!262540 (= e!170140 e!170138)))

(declare-fun mapNonEmpty!11341 () Bool)

(declare-fun mapRes!11341 () Bool)

(declare-fun tp!23707 () Bool)

(declare-fun e!170150 () Bool)

(assert (=> mapNonEmpty!11341 (= mapRes!11341 (and tp!23707 e!170150))))

(declare-fun mapValue!11341 () ValueCell!2983)

(declare-fun mapKey!11341 () (_ BitVec 32))

(declare-fun mapRest!11341 () (Array (_ BitVec 32) ValueCell!2983))

(assert (=> mapNonEmpty!11341 (= (arr!5994 (_values!4819 thiss!1504)) (store mapRest!11341 mapKey!11341 mapValue!11341))))

(declare-fun b!262542 () Bool)

(declare-fun e!170146 () Bool)

(declare-fun call!25090 () Bool)

(assert (=> b!262542 (= e!170146 (not call!25090))))

(declare-fun b!262543 () Bool)

(declare-fun res!128236 () Bool)

(assert (=> b!262543 (= res!128236 (= (select (arr!5995 (_keys!7026 thiss!1504)) (index!6965 lt!132723)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!262543 (=> (not res!128236) (not e!170146))))

(declare-fun b!262544 () Bool)

(declare-fun e!170145 () Bool)

(declare-fun tp_is_empty!6653 () Bool)

(assert (=> b!262544 (= e!170145 tp_is_empty!6653)))

(declare-fun b!262545 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!262545 (= e!170152 (validKeyInArray!0 key!932))))

(declare-fun b!262546 () Bool)

(assert (=> b!262546 (= e!170150 tp_is_empty!6653)))

(declare-fun b!262547 () Bool)

(assert (=> b!262547 (= e!170138 e!170146)))

(declare-fun res!128232 () Bool)

(declare-fun call!25091 () Bool)

(assert (=> b!262547 (= res!128232 call!25091)))

(assert (=> b!262547 (=> (not res!128232) (not e!170146))))

(declare-fun b!262548 () Bool)

(declare-fun Unit!8182 () Unit!8180)

(assert (=> b!262548 (= e!170141 Unit!8182)))

(declare-fun lt!132730 () Unit!8180)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!454 (array!12667 array!12665 (_ BitVec 32) (_ BitVec 32) V!8517 V!8517 (_ BitVec 64) Int) Unit!8180)

(assert (=> b!262548 (= lt!132730 (lemmaInListMapThenSeekEntryOrOpenFindsIt!454 (_keys!7026 thiss!1504) (_values!4819 thiss!1504) (mask!11195 thiss!1504) (extraKeys!4573 thiss!1504) (zeroValue!4677 thiss!1504) (minValue!4677 thiss!1504) key!932 (defaultEntry!4836 thiss!1504)))))

(assert (=> b!262548 false))

(declare-fun b!262549 () Bool)

(assert (=> b!262549 (= e!170138 (is-Undefined!1198 lt!132723))))

(declare-fun b!262550 () Bool)

(declare-fun res!128231 () Bool)

(declare-fun e!170151 () Bool)

(assert (=> b!262550 (=> (not res!128231) (not e!170151))))

(assert (=> b!262550 (= res!128231 (= (select (arr!5995 (_keys!7026 thiss!1504)) (index!6962 lt!132723)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!262551 () Bool)

(assert (=> b!262551 (= e!170142 (not e!170152))))

(declare-fun res!128238 () Bool)

(assert (=> b!262551 (=> res!128238 e!170152)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!262551 (= res!128238 (not (validMask!0 (mask!11195 thiss!1504))))))

(declare-fun lt!132731 () array!12667)

(declare-fun arrayCountValidKeys!0 (array!12667 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!262551 (= (arrayCountValidKeys!0 lt!132731 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!132728 () Unit!8180)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12667 (_ BitVec 32)) Unit!8180)

(assert (=> b!262551 (= lt!132728 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!132731 index!297))))

(declare-fun arrayContainsKey!0 (array!12667 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!262551 (arrayContainsKey!0 lt!132731 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!132724 () Unit!8180)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12667 (_ BitVec 64) (_ BitVec 32)) Unit!8180)

(assert (=> b!262551 (= lt!132724 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!132731 key!932 index!297))))

(declare-fun v!346 () V!8517)

(declare-fun +!709 (ListLongMap!3887 tuple2!4974) ListLongMap!3887)

(assert (=> b!262551 (= (+!709 lt!132732 (tuple2!4975 key!932 v!346)) (getCurrentListMap!1487 lt!132731 (array!12666 (store (arr!5994 (_values!4819 thiss!1504)) index!297 (ValueCellFull!2983 v!346)) (size!6345 (_values!4819 thiss!1504))) (mask!11195 thiss!1504) (extraKeys!4573 thiss!1504) (zeroValue!4677 thiss!1504) (minValue!4677 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4836 thiss!1504)))))

(declare-fun lt!132722 () Unit!8180)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!119 (array!12667 array!12665 (_ BitVec 32) (_ BitVec 32) V!8517 V!8517 (_ BitVec 32) (_ BitVec 64) V!8517 Int) Unit!8180)

(assert (=> b!262551 (= lt!132722 (lemmaAddValidKeyToArrayThenAddPairToListMap!119 (_keys!7026 thiss!1504) (_values!4819 thiss!1504) (mask!11195 thiss!1504) (extraKeys!4573 thiss!1504) (zeroValue!4677 thiss!1504) (minValue!4677 thiss!1504) index!297 key!932 v!346 (defaultEntry!4836 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12667 (_ BitVec 32)) Bool)

(assert (=> b!262551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!132731 (mask!11195 thiss!1504))))

(declare-fun lt!132720 () Unit!8180)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12667 (_ BitVec 32) (_ BitVec 32)) Unit!8180)

(assert (=> b!262551 (= lt!132720 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!7026 thiss!1504) index!297 (mask!11195 thiss!1504)))))

(assert (=> b!262551 (= (arrayCountValidKeys!0 lt!132731 #b00000000000000000000000000000000 (size!6346 (_keys!7026 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!7026 thiss!1504) #b00000000000000000000000000000000 (size!6346 (_keys!7026 thiss!1504)))))))

(declare-fun lt!132729 () Unit!8180)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12667 (_ BitVec 32) (_ BitVec 64)) Unit!8180)

(assert (=> b!262551 (= lt!132729 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!7026 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3850 0))(
  ( (Nil!3847) (Cons!3846 (h!4512 (_ BitVec 64)) (t!8925 List!3850)) )
))
(declare-fun arrayNoDuplicates!0 (array!12667 (_ BitVec 32) List!3850) Bool)

(assert (=> b!262551 (arrayNoDuplicates!0 lt!132731 #b00000000000000000000000000000000 Nil!3847)))

(assert (=> b!262551 (= lt!132731 (array!12668 (store (arr!5995 (_keys!7026 thiss!1504)) index!297 key!932) (size!6346 (_keys!7026 thiss!1504))))))

(declare-fun lt!132727 () Unit!8180)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12667 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3850) Unit!8180)

(assert (=> b!262551 (= lt!132727 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!7026 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3847))))

(declare-fun lt!132721 () Unit!8180)

(declare-fun e!170139 () Unit!8180)

(assert (=> b!262551 (= lt!132721 e!170139)))

(declare-fun c!44739 () Bool)

(assert (=> b!262551 (= c!44739 (arrayContainsKey!0 (_keys!7026 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!262552 () Bool)

(declare-fun Unit!8183 () Unit!8180)

(assert (=> b!262552 (= e!170139 Unit!8183)))

(declare-fun lt!132726 () Unit!8180)

(declare-fun lemmaArrayContainsKeyThenInListMap!261 (array!12667 array!12665 (_ BitVec 32) (_ BitVec 32) V!8517 V!8517 (_ BitVec 64) (_ BitVec 32) Int) Unit!8180)

(assert (=> b!262552 (= lt!132726 (lemmaArrayContainsKeyThenInListMap!261 (_keys!7026 thiss!1504) (_values!4819 thiss!1504) (mask!11195 thiss!1504) (extraKeys!4573 thiss!1504) (zeroValue!4677 thiss!1504) (minValue!4677 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4836 thiss!1504)))))

(assert (=> b!262552 false))

(declare-fun b!262553 () Bool)

(declare-fun res!128234 () Bool)

(assert (=> b!262553 (=> (not res!128234) (not e!170151))))

(assert (=> b!262553 (= res!128234 call!25091)))

(assert (=> b!262553 (= e!170140 e!170151)))

(declare-fun b!262554 () Bool)

(assert (=> b!262554 (= e!170151 (not call!25090))))

(declare-fun b!262555 () Bool)

(declare-fun Unit!8184 () Unit!8180)

(assert (=> b!262555 (= e!170139 Unit!8184)))

(declare-fun bm!25087 () Bool)

(assert (=> bm!25087 (= call!25090 (arrayContainsKey!0 (_keys!7026 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!262556 () Bool)

(declare-fun e!170148 () Bool)

(assert (=> b!262556 (= e!170148 (and e!170145 mapRes!11341))))

(declare-fun condMapEmpty!11341 () Bool)

(declare-fun mapDefault!11341 () ValueCell!2983)


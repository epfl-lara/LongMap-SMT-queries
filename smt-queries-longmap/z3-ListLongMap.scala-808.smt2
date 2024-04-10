; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19584 () Bool)

(assert start!19584)

(declare-fun b!192132 () Bool)

(declare-fun b_free!4689 () Bool)

(declare-fun b_next!4689 () Bool)

(assert (=> b!192132 (= b_free!4689 (not b_next!4689))))

(declare-fun tp!16921 () Bool)

(declare-fun b_and!11375 () Bool)

(assert (=> b!192132 (= tp!16921 b_and!11375)))

(declare-fun b!192130 () Bool)

(declare-fun e!126433 () Bool)

(declare-datatypes ((V!5595 0))(
  ( (V!5596 (val!2275 Int)) )
))
(declare-datatypes ((ValueCell!1887 0))(
  ( (ValueCellFull!1887 (v!4220 V!5595)) (EmptyCell!1887) )
))
(declare-datatypes ((array!8163 0))(
  ( (array!8164 (arr!3845 (Array (_ BitVec 32) (_ BitVec 64))) (size!4168 (_ BitVec 32))) )
))
(declare-datatypes ((array!8165 0))(
  ( (array!8166 (arr!3846 (Array (_ BitVec 32) ValueCell!1887)) (size!4169 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2682 0))(
  ( (LongMapFixedSize!2683 (defaultEntry!3921 Int) (mask!9151 (_ BitVec 32)) (extraKeys!3658 (_ BitVec 32)) (zeroValue!3762 V!5595) (minValue!3762 V!5595) (_size!1390 (_ BitVec 32)) (_keys!5903 array!8163) (_values!3904 array!8165) (_vacant!1390 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2682)

(assert (=> b!192130 (= e!126433 (or (not (= (size!4169 (_values!3904 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9151 thiss!1248)))) (not (= (size!4168 (_keys!5903 thiss!1248)) (size!4169 (_values!3904 thiss!1248)))) (bvslt (mask!9151 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3658 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3658 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!192131 () Bool)

(declare-fun e!126430 () Bool)

(declare-fun e!126434 () Bool)

(assert (=> b!192131 (= e!126430 e!126434)))

(declare-fun res!90793 () Bool)

(assert (=> b!192131 (=> (not res!90793) (not e!126434))))

(declare-datatypes ((SeekEntryResult!681 0))(
  ( (MissingZero!681 (index!4894 (_ BitVec 32))) (Found!681 (index!4895 (_ BitVec 32))) (Intermediate!681 (undefined!1493 Bool) (index!4896 (_ BitVec 32)) (x!20579 (_ BitVec 32))) (Undefined!681) (MissingVacant!681 (index!4897 (_ BitVec 32))) )
))
(declare-fun lt!95475 () SeekEntryResult!681)

(get-info :version)

(assert (=> b!192131 (= res!90793 (and (not ((_ is Undefined!681) lt!95475)) (not ((_ is MissingVacant!681) lt!95475)) (not ((_ is MissingZero!681) lt!95475)) ((_ is Found!681) lt!95475)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8163 (_ BitVec 32)) SeekEntryResult!681)

(assert (=> b!192131 (= lt!95475 (seekEntryOrOpen!0 key!828 (_keys!5903 thiss!1248) (mask!9151 thiss!1248)))))

(declare-fun res!90789 () Bool)

(assert (=> start!19584 (=> (not res!90789) (not e!126430))))

(declare-fun valid!1101 (LongMapFixedSize!2682) Bool)

(assert (=> start!19584 (= res!90789 (valid!1101 thiss!1248))))

(assert (=> start!19584 e!126430))

(declare-fun e!126437 () Bool)

(assert (=> start!19584 e!126437))

(assert (=> start!19584 true))

(declare-fun tp_is_empty!4461 () Bool)

(assert (=> start!19584 tp_is_empty!4461))

(declare-fun e!126438 () Bool)

(declare-fun array_inv!2493 (array!8163) Bool)

(declare-fun array_inv!2494 (array!8165) Bool)

(assert (=> b!192132 (= e!126437 (and tp!16921 tp_is_empty!4461 (array_inv!2493 (_keys!5903 thiss!1248)) (array_inv!2494 (_values!3904 thiss!1248)) e!126438))))

(declare-fun b!192133 () Bool)

(declare-fun e!126429 () Bool)

(assert (=> b!192133 (= e!126429 tp_is_empty!4461)))

(declare-fun e!126436 () Bool)

(declare-fun b!192134 () Bool)

(assert (=> b!192134 (= e!126436 (= (select (arr!3845 (_keys!5903 thiss!1248)) (index!4895 lt!95475)) key!828))))

(declare-fun b!192135 () Bool)

(declare-fun res!90792 () Bool)

(assert (=> b!192135 (=> (not res!90792) (not e!126430))))

(assert (=> b!192135 (= res!90792 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!7708 () Bool)

(declare-fun mapRes!7708 () Bool)

(declare-fun tp!16920 () Bool)

(declare-fun e!126435 () Bool)

(assert (=> mapNonEmpty!7708 (= mapRes!7708 (and tp!16920 e!126435))))

(declare-fun mapValue!7708 () ValueCell!1887)

(declare-fun mapRest!7708 () (Array (_ BitVec 32) ValueCell!1887))

(declare-fun mapKey!7708 () (_ BitVec 32))

(assert (=> mapNonEmpty!7708 (= (arr!3846 (_values!3904 thiss!1248)) (store mapRest!7708 mapKey!7708 mapValue!7708))))

(declare-fun b!192136 () Bool)

(assert (=> b!192136 (= e!126434 (not e!126433))))

(declare-fun res!90790 () Bool)

(assert (=> b!192136 (=> res!90790 e!126433)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!192136 (= res!90790 (not (validMask!0 (mask!9151 thiss!1248))))))

(declare-datatypes ((tuple2!3536 0))(
  ( (tuple2!3537 (_1!1779 (_ BitVec 64)) (_2!1779 V!5595)) )
))
(declare-datatypes ((List!2428 0))(
  ( (Nil!2425) (Cons!2424 (h!3064 tuple2!3536) (t!7344 List!2428)) )
))
(declare-datatypes ((ListLongMap!2453 0))(
  ( (ListLongMap!2454 (toList!1242 List!2428)) )
))
(declare-fun lt!95476 () ListLongMap!2453)

(declare-fun v!309 () V!5595)

(declare-fun +!310 (ListLongMap!2453 tuple2!3536) ListLongMap!2453)

(declare-fun getCurrentListMap!890 (array!8163 array!8165 (_ BitVec 32) (_ BitVec 32) V!5595 V!5595 (_ BitVec 32) Int) ListLongMap!2453)

(assert (=> b!192136 (= (+!310 lt!95476 (tuple2!3537 key!828 v!309)) (getCurrentListMap!890 (_keys!5903 thiss!1248) (array!8166 (store (arr!3846 (_values!3904 thiss!1248)) (index!4895 lt!95475) (ValueCellFull!1887 v!309)) (size!4169 (_values!3904 thiss!1248))) (mask!9151 thiss!1248) (extraKeys!3658 thiss!1248) (zeroValue!3762 thiss!1248) (minValue!3762 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3921 thiss!1248)))))

(declare-datatypes ((Unit!5811 0))(
  ( (Unit!5812) )
))
(declare-fun lt!95472 () Unit!5811)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!111 (array!8163 array!8165 (_ BitVec 32) (_ BitVec 32) V!5595 V!5595 (_ BitVec 32) (_ BitVec 64) V!5595 Int) Unit!5811)

(assert (=> b!192136 (= lt!95472 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!111 (_keys!5903 thiss!1248) (_values!3904 thiss!1248) (mask!9151 thiss!1248) (extraKeys!3658 thiss!1248) (zeroValue!3762 thiss!1248) (minValue!3762 thiss!1248) (index!4895 lt!95475) key!828 v!309 (defaultEntry!3921 thiss!1248)))))

(declare-fun lt!95473 () Unit!5811)

(declare-fun e!126432 () Unit!5811)

(assert (=> b!192136 (= lt!95473 e!126432)))

(declare-fun c!34619 () Bool)

(declare-fun contains!1358 (ListLongMap!2453 (_ BitVec 64)) Bool)

(assert (=> b!192136 (= c!34619 (contains!1358 lt!95476 key!828))))

(assert (=> b!192136 (= lt!95476 (getCurrentListMap!890 (_keys!5903 thiss!1248) (_values!3904 thiss!1248) (mask!9151 thiss!1248) (extraKeys!3658 thiss!1248) (zeroValue!3762 thiss!1248) (minValue!3762 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3921 thiss!1248)))))

(declare-fun b!192137 () Bool)

(declare-fun lt!95477 () Unit!5811)

(assert (=> b!192137 (= e!126432 lt!95477)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!176 (array!8163 array!8165 (_ BitVec 32) (_ BitVec 32) V!5595 V!5595 (_ BitVec 64) Int) Unit!5811)

(assert (=> b!192137 (= lt!95477 (lemmaInListMapThenSeekEntryOrOpenFindsIt!176 (_keys!5903 thiss!1248) (_values!3904 thiss!1248) (mask!9151 thiss!1248) (extraKeys!3658 thiss!1248) (zeroValue!3762 thiss!1248) (minValue!3762 thiss!1248) key!828 (defaultEntry!3921 thiss!1248)))))

(declare-fun res!90791 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!192137 (= res!90791 (inRange!0 (index!4895 lt!95475) (mask!9151 thiss!1248)))))

(assert (=> b!192137 (=> (not res!90791) (not e!126436))))

(assert (=> b!192137 e!126436))

(declare-fun b!192138 () Bool)

(assert (=> b!192138 (= e!126435 tp_is_empty!4461)))

(declare-fun b!192139 () Bool)

(declare-fun Unit!5813 () Unit!5811)

(assert (=> b!192139 (= e!126432 Unit!5813)))

(declare-fun lt!95474 () Unit!5811)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!183 (array!8163 array!8165 (_ BitVec 32) (_ BitVec 32) V!5595 V!5595 (_ BitVec 64) Int) Unit!5811)

(assert (=> b!192139 (= lt!95474 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!183 (_keys!5903 thiss!1248) (_values!3904 thiss!1248) (mask!9151 thiss!1248) (extraKeys!3658 thiss!1248) (zeroValue!3762 thiss!1248) (minValue!3762 thiss!1248) key!828 (defaultEntry!3921 thiss!1248)))))

(assert (=> b!192139 false))

(declare-fun mapIsEmpty!7708 () Bool)

(assert (=> mapIsEmpty!7708 mapRes!7708))

(declare-fun b!192140 () Bool)

(assert (=> b!192140 (= e!126438 (and e!126429 mapRes!7708))))

(declare-fun condMapEmpty!7708 () Bool)

(declare-fun mapDefault!7708 () ValueCell!1887)

(assert (=> b!192140 (= condMapEmpty!7708 (= (arr!3846 (_values!3904 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1887)) mapDefault!7708)))))

(assert (= (and start!19584 res!90789) b!192135))

(assert (= (and b!192135 res!90792) b!192131))

(assert (= (and b!192131 res!90793) b!192136))

(assert (= (and b!192136 c!34619) b!192137))

(assert (= (and b!192136 (not c!34619)) b!192139))

(assert (= (and b!192137 res!90791) b!192134))

(assert (= (and b!192136 (not res!90790)) b!192130))

(assert (= (and b!192140 condMapEmpty!7708) mapIsEmpty!7708))

(assert (= (and b!192140 (not condMapEmpty!7708)) mapNonEmpty!7708))

(assert (= (and mapNonEmpty!7708 ((_ is ValueCellFull!1887) mapValue!7708)) b!192138))

(assert (= (and b!192140 ((_ is ValueCellFull!1887) mapDefault!7708)) b!192133))

(assert (= b!192132 b!192140))

(assert (= start!19584 b!192132))

(declare-fun m!218839 () Bool)

(assert (=> b!192139 m!218839))

(declare-fun m!218841 () Bool)

(assert (=> b!192136 m!218841))

(declare-fun m!218843 () Bool)

(assert (=> b!192136 m!218843))

(declare-fun m!218845 () Bool)

(assert (=> b!192136 m!218845))

(declare-fun m!218847 () Bool)

(assert (=> b!192136 m!218847))

(declare-fun m!218849 () Bool)

(assert (=> b!192136 m!218849))

(declare-fun m!218851 () Bool)

(assert (=> b!192136 m!218851))

(declare-fun m!218853 () Bool)

(assert (=> b!192136 m!218853))

(declare-fun m!218855 () Bool)

(assert (=> b!192132 m!218855))

(declare-fun m!218857 () Bool)

(assert (=> b!192132 m!218857))

(declare-fun m!218859 () Bool)

(assert (=> mapNonEmpty!7708 m!218859))

(declare-fun m!218861 () Bool)

(assert (=> b!192137 m!218861))

(declare-fun m!218863 () Bool)

(assert (=> b!192137 m!218863))

(declare-fun m!218865 () Bool)

(assert (=> start!19584 m!218865))

(declare-fun m!218867 () Bool)

(assert (=> b!192131 m!218867))

(declare-fun m!218869 () Bool)

(assert (=> b!192134 m!218869))

(check-sat (not start!19584) (not b!192131) tp_is_empty!4461 (not b!192137) (not b!192139) b_and!11375 (not mapNonEmpty!7708) (not b_next!4689) (not b!192136) (not b!192132))
(check-sat b_and!11375 (not b_next!4689))
(get-model)

(declare-fun b!192190 () Bool)

(declare-fun res!90819 () Bool)

(declare-fun e!126479 () Bool)

(assert (=> b!192190 (=> (not res!90819) (not e!126479))))

(declare-fun lt!95500 () SeekEntryResult!681)

(assert (=> b!192190 (= res!90819 (= (select (arr!3845 (_keys!5903 thiss!1248)) (index!4897 lt!95500)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!192190 (and (bvsge (index!4897 lt!95500) #b00000000000000000000000000000000) (bvslt (index!4897 lt!95500) (size!4168 (_keys!5903 thiss!1248))))))

(declare-fun b!192191 () Bool)

(declare-fun e!126480 () Bool)

(declare-fun call!19395 () Bool)

(assert (=> b!192191 (= e!126480 (not call!19395))))

(declare-fun b!192192 () Bool)

(declare-fun res!90818 () Bool)

(assert (=> b!192192 (=> (not res!90818) (not e!126479))))

(declare-fun call!19396 () Bool)

(assert (=> b!192192 (= res!90818 call!19396)))

(declare-fun e!126477 () Bool)

(assert (=> b!192192 (= e!126477 e!126479)))

(declare-fun bm!19392 () Bool)

(declare-fun arrayContainsKey!0 (array!8163 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!19392 (= call!19395 (arrayContainsKey!0 (_keys!5903 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun bm!19393 () Bool)

(declare-fun c!34628 () Bool)

(assert (=> bm!19393 (= call!19396 (inRange!0 (ite c!34628 (index!4894 lt!95500) (index!4897 lt!95500)) (mask!9151 thiss!1248)))))

(declare-fun b!192194 () Bool)

(assert (=> b!192194 (= e!126477 ((_ is Undefined!681) lt!95500))))

(declare-fun b!192195 () Bool)

(declare-fun e!126478 () Bool)

(assert (=> b!192195 (= e!126478 e!126477)))

(declare-fun c!34627 () Bool)

(assert (=> b!192195 (= c!34627 ((_ is MissingVacant!681) lt!95500))))

(declare-fun b!192193 () Bool)

(assert (=> b!192193 (and (bvsge (index!4894 lt!95500) #b00000000000000000000000000000000) (bvslt (index!4894 lt!95500) (size!4168 (_keys!5903 thiss!1248))))))

(declare-fun res!90817 () Bool)

(assert (=> b!192193 (= res!90817 (= (select (arr!3845 (_keys!5903 thiss!1248)) (index!4894 lt!95500)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!192193 (=> (not res!90817) (not e!126480))))

(declare-fun d!56333 () Bool)

(assert (=> d!56333 e!126478))

(assert (=> d!56333 (= c!34628 ((_ is MissingZero!681) lt!95500))))

(assert (=> d!56333 (= lt!95500 (seekEntryOrOpen!0 key!828 (_keys!5903 thiss!1248) (mask!9151 thiss!1248)))))

(declare-fun lt!95501 () Unit!5811)

(declare-fun choose!1044 (array!8163 array!8165 (_ BitVec 32) (_ BitVec 32) V!5595 V!5595 (_ BitVec 64) Int) Unit!5811)

(assert (=> d!56333 (= lt!95501 (choose!1044 (_keys!5903 thiss!1248) (_values!3904 thiss!1248) (mask!9151 thiss!1248) (extraKeys!3658 thiss!1248) (zeroValue!3762 thiss!1248) (minValue!3762 thiss!1248) key!828 (defaultEntry!3921 thiss!1248)))))

(assert (=> d!56333 (validMask!0 (mask!9151 thiss!1248))))

(assert (=> d!56333 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!183 (_keys!5903 thiss!1248) (_values!3904 thiss!1248) (mask!9151 thiss!1248) (extraKeys!3658 thiss!1248) (zeroValue!3762 thiss!1248) (minValue!3762 thiss!1248) key!828 (defaultEntry!3921 thiss!1248)) lt!95501)))

(declare-fun b!192196 () Bool)

(assert (=> b!192196 (= e!126479 (not call!19395))))

(declare-fun b!192197 () Bool)

(assert (=> b!192197 (= e!126478 e!126480)))

(declare-fun res!90820 () Bool)

(assert (=> b!192197 (= res!90820 call!19396)))

(assert (=> b!192197 (=> (not res!90820) (not e!126480))))

(assert (= (and d!56333 c!34628) b!192197))

(assert (= (and d!56333 (not c!34628)) b!192195))

(assert (= (and b!192197 res!90820) b!192193))

(assert (= (and b!192193 res!90817) b!192191))

(assert (= (and b!192195 c!34627) b!192192))

(assert (= (and b!192195 (not c!34627)) b!192194))

(assert (= (and b!192192 res!90818) b!192190))

(assert (= (and b!192190 res!90819) b!192196))

(assert (= (or b!192197 b!192192) bm!19393))

(assert (= (or b!192191 b!192196) bm!19392))

(declare-fun m!218903 () Bool)

(assert (=> bm!19393 m!218903))

(assert (=> d!56333 m!218867))

(declare-fun m!218905 () Bool)

(assert (=> d!56333 m!218905))

(assert (=> d!56333 m!218845))

(declare-fun m!218907 () Bool)

(assert (=> b!192193 m!218907))

(declare-fun m!218909 () Bool)

(assert (=> bm!19392 m!218909))

(declare-fun m!218911 () Bool)

(assert (=> b!192190 m!218911))

(assert (=> b!192139 d!56333))

(declare-fun d!56335 () Bool)

(declare-fun res!90827 () Bool)

(declare-fun e!126483 () Bool)

(assert (=> d!56335 (=> (not res!90827) (not e!126483))))

(declare-fun simpleValid!199 (LongMapFixedSize!2682) Bool)

(assert (=> d!56335 (= res!90827 (simpleValid!199 thiss!1248))))

(assert (=> d!56335 (= (valid!1101 thiss!1248) e!126483)))

(declare-fun b!192204 () Bool)

(declare-fun res!90828 () Bool)

(assert (=> b!192204 (=> (not res!90828) (not e!126483))))

(declare-fun arrayCountValidKeys!0 (array!8163 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!192204 (= res!90828 (= (arrayCountValidKeys!0 (_keys!5903 thiss!1248) #b00000000000000000000000000000000 (size!4168 (_keys!5903 thiss!1248))) (_size!1390 thiss!1248)))))

(declare-fun b!192205 () Bool)

(declare-fun res!90829 () Bool)

(assert (=> b!192205 (=> (not res!90829) (not e!126483))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8163 (_ BitVec 32)) Bool)

(assert (=> b!192205 (= res!90829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5903 thiss!1248) (mask!9151 thiss!1248)))))

(declare-fun b!192206 () Bool)

(declare-datatypes ((List!2429 0))(
  ( (Nil!2426) (Cons!2425 (h!3065 (_ BitVec 64)) (t!7347 List!2429)) )
))
(declare-fun arrayNoDuplicates!0 (array!8163 (_ BitVec 32) List!2429) Bool)

(assert (=> b!192206 (= e!126483 (arrayNoDuplicates!0 (_keys!5903 thiss!1248) #b00000000000000000000000000000000 Nil!2426))))

(assert (= (and d!56335 res!90827) b!192204))

(assert (= (and b!192204 res!90828) b!192205))

(assert (= (and b!192205 res!90829) b!192206))

(declare-fun m!218913 () Bool)

(assert (=> d!56335 m!218913))

(declare-fun m!218915 () Bool)

(assert (=> b!192204 m!218915))

(declare-fun m!218917 () Bool)

(assert (=> b!192205 m!218917))

(declare-fun m!218919 () Bool)

(assert (=> b!192206 m!218919))

(assert (=> start!19584 d!56335))

(declare-fun d!56337 () Bool)

(declare-fun e!126486 () Bool)

(assert (=> d!56337 e!126486))

(declare-fun res!90834 () Bool)

(assert (=> d!56337 (=> (not res!90834) (not e!126486))))

(declare-fun lt!95506 () SeekEntryResult!681)

(assert (=> d!56337 (= res!90834 ((_ is Found!681) lt!95506))))

(assert (=> d!56337 (= lt!95506 (seekEntryOrOpen!0 key!828 (_keys!5903 thiss!1248) (mask!9151 thiss!1248)))))

(declare-fun lt!95507 () Unit!5811)

(declare-fun choose!1045 (array!8163 array!8165 (_ BitVec 32) (_ BitVec 32) V!5595 V!5595 (_ BitVec 64) Int) Unit!5811)

(assert (=> d!56337 (= lt!95507 (choose!1045 (_keys!5903 thiss!1248) (_values!3904 thiss!1248) (mask!9151 thiss!1248) (extraKeys!3658 thiss!1248) (zeroValue!3762 thiss!1248) (minValue!3762 thiss!1248) key!828 (defaultEntry!3921 thiss!1248)))))

(assert (=> d!56337 (validMask!0 (mask!9151 thiss!1248))))

(assert (=> d!56337 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!176 (_keys!5903 thiss!1248) (_values!3904 thiss!1248) (mask!9151 thiss!1248) (extraKeys!3658 thiss!1248) (zeroValue!3762 thiss!1248) (minValue!3762 thiss!1248) key!828 (defaultEntry!3921 thiss!1248)) lt!95507)))

(declare-fun b!192211 () Bool)

(declare-fun res!90835 () Bool)

(assert (=> b!192211 (=> (not res!90835) (not e!126486))))

(assert (=> b!192211 (= res!90835 (inRange!0 (index!4895 lt!95506) (mask!9151 thiss!1248)))))

(declare-fun b!192212 () Bool)

(assert (=> b!192212 (= e!126486 (= (select (arr!3845 (_keys!5903 thiss!1248)) (index!4895 lt!95506)) key!828))))

(assert (=> b!192212 (and (bvsge (index!4895 lt!95506) #b00000000000000000000000000000000) (bvslt (index!4895 lt!95506) (size!4168 (_keys!5903 thiss!1248))))))

(assert (= (and d!56337 res!90834) b!192211))

(assert (= (and b!192211 res!90835) b!192212))

(assert (=> d!56337 m!218867))

(declare-fun m!218921 () Bool)

(assert (=> d!56337 m!218921))

(assert (=> d!56337 m!218845))

(declare-fun m!218923 () Bool)

(assert (=> b!192211 m!218923))

(declare-fun m!218925 () Bool)

(assert (=> b!192212 m!218925))

(assert (=> b!192137 d!56337))

(declare-fun d!56339 () Bool)

(assert (=> d!56339 (= (inRange!0 (index!4895 lt!95475) (mask!9151 thiss!1248)) (and (bvsge (index!4895 lt!95475) #b00000000000000000000000000000000) (bvslt (index!4895 lt!95475) (bvadd (mask!9151 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!192137 d!56339))

(declare-fun d!56341 () Bool)

(declare-fun e!126489 () Bool)

(assert (=> d!56341 e!126489))

(declare-fun res!90840 () Bool)

(assert (=> d!56341 (=> (not res!90840) (not e!126489))))

(declare-fun lt!95517 () ListLongMap!2453)

(assert (=> d!56341 (= res!90840 (contains!1358 lt!95517 (_1!1779 (tuple2!3537 key!828 v!309))))))

(declare-fun lt!95519 () List!2428)

(assert (=> d!56341 (= lt!95517 (ListLongMap!2454 lt!95519))))

(declare-fun lt!95518 () Unit!5811)

(declare-fun lt!95516 () Unit!5811)

(assert (=> d!56341 (= lt!95518 lt!95516)))

(declare-datatypes ((Option!246 0))(
  ( (Some!245 (v!4224 V!5595)) (None!244) )
))
(declare-fun getValueByKey!240 (List!2428 (_ BitVec 64)) Option!246)

(assert (=> d!56341 (= (getValueByKey!240 lt!95519 (_1!1779 (tuple2!3537 key!828 v!309))) (Some!245 (_2!1779 (tuple2!3537 key!828 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!127 (List!2428 (_ BitVec 64) V!5595) Unit!5811)

(assert (=> d!56341 (= lt!95516 (lemmaContainsTupThenGetReturnValue!127 lt!95519 (_1!1779 (tuple2!3537 key!828 v!309)) (_2!1779 (tuple2!3537 key!828 v!309))))))

(declare-fun insertStrictlySorted!130 (List!2428 (_ BitVec 64) V!5595) List!2428)

(assert (=> d!56341 (= lt!95519 (insertStrictlySorted!130 (toList!1242 lt!95476) (_1!1779 (tuple2!3537 key!828 v!309)) (_2!1779 (tuple2!3537 key!828 v!309))))))

(assert (=> d!56341 (= (+!310 lt!95476 (tuple2!3537 key!828 v!309)) lt!95517)))

(declare-fun b!192217 () Bool)

(declare-fun res!90841 () Bool)

(assert (=> b!192217 (=> (not res!90841) (not e!126489))))

(assert (=> b!192217 (= res!90841 (= (getValueByKey!240 (toList!1242 lt!95517) (_1!1779 (tuple2!3537 key!828 v!309))) (Some!245 (_2!1779 (tuple2!3537 key!828 v!309)))))))

(declare-fun b!192218 () Bool)

(declare-fun contains!1359 (List!2428 tuple2!3536) Bool)

(assert (=> b!192218 (= e!126489 (contains!1359 (toList!1242 lt!95517) (tuple2!3537 key!828 v!309)))))

(assert (= (and d!56341 res!90840) b!192217))

(assert (= (and b!192217 res!90841) b!192218))

(declare-fun m!218927 () Bool)

(assert (=> d!56341 m!218927))

(declare-fun m!218929 () Bool)

(assert (=> d!56341 m!218929))

(declare-fun m!218931 () Bool)

(assert (=> d!56341 m!218931))

(declare-fun m!218933 () Bool)

(assert (=> d!56341 m!218933))

(declare-fun m!218935 () Bool)

(assert (=> b!192217 m!218935))

(declare-fun m!218937 () Bool)

(assert (=> b!192218 m!218937))

(assert (=> b!192136 d!56341))

(declare-fun d!56343 () Bool)

(assert (=> d!56343 (= (validMask!0 (mask!9151 thiss!1248)) (and (or (= (mask!9151 thiss!1248) #b00000000000000000000000000000111) (= (mask!9151 thiss!1248) #b00000000000000000000000000001111) (= (mask!9151 thiss!1248) #b00000000000000000000000000011111) (= (mask!9151 thiss!1248) #b00000000000000000000000000111111) (= (mask!9151 thiss!1248) #b00000000000000000000000001111111) (= (mask!9151 thiss!1248) #b00000000000000000000000011111111) (= (mask!9151 thiss!1248) #b00000000000000000000000111111111) (= (mask!9151 thiss!1248) #b00000000000000000000001111111111) (= (mask!9151 thiss!1248) #b00000000000000000000011111111111) (= (mask!9151 thiss!1248) #b00000000000000000000111111111111) (= (mask!9151 thiss!1248) #b00000000000000000001111111111111) (= (mask!9151 thiss!1248) #b00000000000000000011111111111111) (= (mask!9151 thiss!1248) #b00000000000000000111111111111111) (= (mask!9151 thiss!1248) #b00000000000000001111111111111111) (= (mask!9151 thiss!1248) #b00000000000000011111111111111111) (= (mask!9151 thiss!1248) #b00000000000000111111111111111111) (= (mask!9151 thiss!1248) #b00000000000001111111111111111111) (= (mask!9151 thiss!1248) #b00000000000011111111111111111111) (= (mask!9151 thiss!1248) #b00000000000111111111111111111111) (= (mask!9151 thiss!1248) #b00000000001111111111111111111111) (= (mask!9151 thiss!1248) #b00000000011111111111111111111111) (= (mask!9151 thiss!1248) #b00000000111111111111111111111111) (= (mask!9151 thiss!1248) #b00000001111111111111111111111111) (= (mask!9151 thiss!1248) #b00000011111111111111111111111111) (= (mask!9151 thiss!1248) #b00000111111111111111111111111111) (= (mask!9151 thiss!1248) #b00001111111111111111111111111111) (= (mask!9151 thiss!1248) #b00011111111111111111111111111111) (= (mask!9151 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!9151 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!192136 d!56343))

(declare-fun b!192261 () Bool)

(declare-fun e!126525 () ListLongMap!2453)

(declare-fun call!19415 () ListLongMap!2453)

(assert (=> b!192261 (= e!126525 call!19415)))

(declare-fun b!192262 () Bool)

(declare-fun e!126522 () ListLongMap!2453)

(declare-fun e!126520 () ListLongMap!2453)

(assert (=> b!192262 (= e!126522 e!126520)))

(declare-fun c!34642 () Bool)

(assert (=> b!192262 (= c!34642 (and (not (= (bvand (extraKeys!3658 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3658 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!192263 () Bool)

(declare-fun e!126518 () Bool)

(declare-fun e!126527 () Bool)

(assert (=> b!192263 (= e!126518 e!126527)))

(declare-fun res!90866 () Bool)

(declare-fun call!19416 () Bool)

(assert (=> b!192263 (= res!90866 call!19416)))

(assert (=> b!192263 (=> (not res!90866) (not e!126527))))

(declare-fun b!192265 () Bool)

(declare-fun e!126516 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!192265 (= e!126516 (validKeyInArray!0 (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!192266 () Bool)

(declare-fun e!126526 () Unit!5811)

(declare-fun lt!95584 () Unit!5811)

(assert (=> b!192266 (= e!126526 lt!95584)))

(declare-fun lt!95582 () ListLongMap!2453)

(declare-fun getCurrentListMapNoExtraKeys!216 (array!8163 array!8165 (_ BitVec 32) (_ BitVec 32) V!5595 V!5595 (_ BitVec 32) Int) ListLongMap!2453)

(assert (=> b!192266 (= lt!95582 (getCurrentListMapNoExtraKeys!216 (_keys!5903 thiss!1248) (_values!3904 thiss!1248) (mask!9151 thiss!1248) (extraKeys!3658 thiss!1248) (zeroValue!3762 thiss!1248) (minValue!3762 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3921 thiss!1248)))))

(declare-fun lt!95569 () (_ BitVec 64))

(assert (=> b!192266 (= lt!95569 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95576 () (_ BitVec 64))

(assert (=> b!192266 (= lt!95576 (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95571 () Unit!5811)

(declare-fun addStillContains!159 (ListLongMap!2453 (_ BitVec 64) V!5595 (_ BitVec 64)) Unit!5811)

(assert (=> b!192266 (= lt!95571 (addStillContains!159 lt!95582 lt!95569 (zeroValue!3762 thiss!1248) lt!95576))))

(assert (=> b!192266 (contains!1358 (+!310 lt!95582 (tuple2!3537 lt!95569 (zeroValue!3762 thiss!1248))) lt!95576)))

(declare-fun lt!95578 () Unit!5811)

(assert (=> b!192266 (= lt!95578 lt!95571)))

(declare-fun lt!95577 () ListLongMap!2453)

(assert (=> b!192266 (= lt!95577 (getCurrentListMapNoExtraKeys!216 (_keys!5903 thiss!1248) (_values!3904 thiss!1248) (mask!9151 thiss!1248) (extraKeys!3658 thiss!1248) (zeroValue!3762 thiss!1248) (minValue!3762 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3921 thiss!1248)))))

(declare-fun lt!95567 () (_ BitVec 64))

(assert (=> b!192266 (= lt!95567 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95568 () (_ BitVec 64))

(assert (=> b!192266 (= lt!95568 (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95565 () Unit!5811)

(declare-fun addApplyDifferent!159 (ListLongMap!2453 (_ BitVec 64) V!5595 (_ BitVec 64)) Unit!5811)

(assert (=> b!192266 (= lt!95565 (addApplyDifferent!159 lt!95577 lt!95567 (minValue!3762 thiss!1248) lt!95568))))

(declare-fun apply!183 (ListLongMap!2453 (_ BitVec 64)) V!5595)

(assert (=> b!192266 (= (apply!183 (+!310 lt!95577 (tuple2!3537 lt!95567 (minValue!3762 thiss!1248))) lt!95568) (apply!183 lt!95577 lt!95568))))

(declare-fun lt!95575 () Unit!5811)

(assert (=> b!192266 (= lt!95575 lt!95565)))

(declare-fun lt!95573 () ListLongMap!2453)

(assert (=> b!192266 (= lt!95573 (getCurrentListMapNoExtraKeys!216 (_keys!5903 thiss!1248) (_values!3904 thiss!1248) (mask!9151 thiss!1248) (extraKeys!3658 thiss!1248) (zeroValue!3762 thiss!1248) (minValue!3762 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3921 thiss!1248)))))

(declare-fun lt!95585 () (_ BitVec 64))

(assert (=> b!192266 (= lt!95585 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95579 () (_ BitVec 64))

(assert (=> b!192266 (= lt!95579 (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95566 () Unit!5811)

(assert (=> b!192266 (= lt!95566 (addApplyDifferent!159 lt!95573 lt!95585 (zeroValue!3762 thiss!1248) lt!95579))))

(assert (=> b!192266 (= (apply!183 (+!310 lt!95573 (tuple2!3537 lt!95585 (zeroValue!3762 thiss!1248))) lt!95579) (apply!183 lt!95573 lt!95579))))

(declare-fun lt!95580 () Unit!5811)

(assert (=> b!192266 (= lt!95580 lt!95566)))

(declare-fun lt!95572 () ListLongMap!2453)

(assert (=> b!192266 (= lt!95572 (getCurrentListMapNoExtraKeys!216 (_keys!5903 thiss!1248) (_values!3904 thiss!1248) (mask!9151 thiss!1248) (extraKeys!3658 thiss!1248) (zeroValue!3762 thiss!1248) (minValue!3762 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3921 thiss!1248)))))

(declare-fun lt!95570 () (_ BitVec 64))

(assert (=> b!192266 (= lt!95570 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95581 () (_ BitVec 64))

(assert (=> b!192266 (= lt!95581 (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!192266 (= lt!95584 (addApplyDifferent!159 lt!95572 lt!95570 (minValue!3762 thiss!1248) lt!95581))))

(assert (=> b!192266 (= (apply!183 (+!310 lt!95572 (tuple2!3537 lt!95570 (minValue!3762 thiss!1248))) lt!95581) (apply!183 lt!95572 lt!95581))))

(declare-fun bm!19408 () Bool)

(declare-fun call!19413 () Bool)

(declare-fun lt!95574 () ListLongMap!2453)

(assert (=> bm!19408 (= call!19413 (contains!1358 lt!95574 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!192267 () Bool)

(declare-fun e!126528 () Bool)

(assert (=> b!192267 (= e!126528 e!126518)))

(declare-fun c!34645 () Bool)

(assert (=> b!192267 (= c!34645 (not (= (bvand (extraKeys!3658 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!192268 () Bool)

(assert (=> b!192268 (= e!126527 (= (apply!183 lt!95574 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3762 thiss!1248)))))

(declare-fun bm!19409 () Bool)

(declare-fun call!19417 () ListLongMap!2453)

(declare-fun call!19414 () ListLongMap!2453)

(assert (=> bm!19409 (= call!19417 call!19414)))

(declare-fun b!192269 () Bool)

(declare-fun e!126524 () Bool)

(assert (=> b!192269 (= e!126524 (= (apply!183 lt!95574 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3762 thiss!1248)))))

(declare-fun d!56345 () Bool)

(assert (=> d!56345 e!126528))

(declare-fun res!90862 () Bool)

(assert (=> d!56345 (=> (not res!90862) (not e!126528))))

(assert (=> d!56345 (= res!90862 (or (bvsge #b00000000000000000000000000000000 (size!4168 (_keys!5903 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4168 (_keys!5903 thiss!1248))))))))

(declare-fun lt!95564 () ListLongMap!2453)

(assert (=> d!56345 (= lt!95574 lt!95564)))

(declare-fun lt!95583 () Unit!5811)

(assert (=> d!56345 (= lt!95583 e!126526)))

(declare-fun c!34644 () Bool)

(assert (=> d!56345 (= c!34644 e!126516)))

(declare-fun res!90864 () Bool)

(assert (=> d!56345 (=> (not res!90864) (not e!126516))))

(assert (=> d!56345 (= res!90864 (bvslt #b00000000000000000000000000000000 (size!4168 (_keys!5903 thiss!1248))))))

(assert (=> d!56345 (= lt!95564 e!126522)))

(declare-fun c!34643 () Bool)

(assert (=> d!56345 (= c!34643 (and (not (= (bvand (extraKeys!3658 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3658 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56345 (validMask!0 (mask!9151 thiss!1248))))

(assert (=> d!56345 (= (getCurrentListMap!890 (_keys!5903 thiss!1248) (_values!3904 thiss!1248) (mask!9151 thiss!1248) (extraKeys!3658 thiss!1248) (zeroValue!3762 thiss!1248) (minValue!3762 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3921 thiss!1248)) lt!95574)))

(declare-fun b!192264 () Bool)

(declare-fun e!126521 () Bool)

(declare-fun e!126517 () Bool)

(assert (=> b!192264 (= e!126521 e!126517)))

(declare-fun res!90861 () Bool)

(assert (=> b!192264 (=> (not res!90861) (not e!126517))))

(assert (=> b!192264 (= res!90861 (contains!1358 lt!95574 (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!192264 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4168 (_keys!5903 thiss!1248))))))

(declare-fun b!192270 () Bool)

(declare-fun res!90863 () Bool)

(assert (=> b!192270 (=> (not res!90863) (not e!126528))))

(assert (=> b!192270 (= res!90863 e!126521)))

(declare-fun res!90868 () Bool)

(assert (=> b!192270 (=> res!90868 e!126521)))

(declare-fun e!126523 () Bool)

(assert (=> b!192270 (= res!90868 (not e!126523))))

(declare-fun res!90860 () Bool)

(assert (=> b!192270 (=> (not res!90860) (not e!126523))))

(assert (=> b!192270 (= res!90860 (bvslt #b00000000000000000000000000000000 (size!4168 (_keys!5903 thiss!1248))))))

(declare-fun b!192271 () Bool)

(assert (=> b!192271 (= e!126523 (validKeyInArray!0 (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!192272 () Bool)

(declare-fun c!34641 () Bool)

(assert (=> b!192272 (= c!34641 (and (not (= (bvand (extraKeys!3658 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3658 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!192272 (= e!126520 e!126525)))

(declare-fun bm!19410 () Bool)

(declare-fun call!19412 () ListLongMap!2453)

(assert (=> bm!19410 (= call!19412 (getCurrentListMapNoExtraKeys!216 (_keys!5903 thiss!1248) (_values!3904 thiss!1248) (mask!9151 thiss!1248) (extraKeys!3658 thiss!1248) (zeroValue!3762 thiss!1248) (minValue!3762 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3921 thiss!1248)))))

(declare-fun b!192273 () Bool)

(assert (=> b!192273 (= e!126520 call!19415)))

(declare-fun b!192274 () Bool)

(declare-fun Unit!5817 () Unit!5811)

(assert (=> b!192274 (= e!126526 Unit!5817)))

(declare-fun bm!19411 () Bool)

(assert (=> bm!19411 (= call!19414 call!19412)))

(declare-fun b!192275 () Bool)

(declare-fun e!126519 () Bool)

(assert (=> b!192275 (= e!126519 (not call!19413))))

(declare-fun b!192276 () Bool)

(declare-fun res!90865 () Bool)

(assert (=> b!192276 (=> (not res!90865) (not e!126528))))

(assert (=> b!192276 (= res!90865 e!126519)))

(declare-fun c!34646 () Bool)

(assert (=> b!192276 (= c!34646 (not (= (bvand (extraKeys!3658 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!19412 () Bool)

(declare-fun call!19411 () ListLongMap!2453)

(assert (=> bm!19412 (= call!19415 call!19411)))

(declare-fun bm!19413 () Bool)

(assert (=> bm!19413 (= call!19416 (contains!1358 lt!95574 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!19414 () Bool)

(assert (=> bm!19414 (= call!19411 (+!310 (ite c!34643 call!19412 (ite c!34642 call!19414 call!19417)) (ite (or c!34643 c!34642) (tuple2!3537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3762 thiss!1248)) (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248)))))))

(declare-fun b!192277 () Bool)

(assert (=> b!192277 (= e!126518 (not call!19416))))

(declare-fun b!192278 () Bool)

(declare-fun get!2219 (ValueCell!1887 V!5595) V!5595)

(declare-fun dynLambda!526 (Int (_ BitVec 64)) V!5595)

(assert (=> b!192278 (= e!126517 (= (apply!183 lt!95574 (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000)) (get!2219 (select (arr!3846 (_values!3904 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!526 (defaultEntry!3921 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!192278 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4169 (_values!3904 thiss!1248))))))

(assert (=> b!192278 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4168 (_keys!5903 thiss!1248))))))

(declare-fun b!192279 () Bool)

(assert (=> b!192279 (= e!126525 call!19417)))

(declare-fun b!192280 () Bool)

(assert (=> b!192280 (= e!126522 (+!310 call!19411 (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248))))))

(declare-fun b!192281 () Bool)

(assert (=> b!192281 (= e!126519 e!126524)))

(declare-fun res!90867 () Bool)

(assert (=> b!192281 (= res!90867 call!19413)))

(assert (=> b!192281 (=> (not res!90867) (not e!126524))))

(assert (= (and d!56345 c!34643) b!192280))

(assert (= (and d!56345 (not c!34643)) b!192262))

(assert (= (and b!192262 c!34642) b!192273))

(assert (= (and b!192262 (not c!34642)) b!192272))

(assert (= (and b!192272 c!34641) b!192261))

(assert (= (and b!192272 (not c!34641)) b!192279))

(assert (= (or b!192261 b!192279) bm!19409))

(assert (= (or b!192273 bm!19409) bm!19411))

(assert (= (or b!192273 b!192261) bm!19412))

(assert (= (or b!192280 bm!19411) bm!19410))

(assert (= (or b!192280 bm!19412) bm!19414))

(assert (= (and d!56345 res!90864) b!192265))

(assert (= (and d!56345 c!34644) b!192266))

(assert (= (and d!56345 (not c!34644)) b!192274))

(assert (= (and d!56345 res!90862) b!192270))

(assert (= (and b!192270 res!90860) b!192271))

(assert (= (and b!192270 (not res!90868)) b!192264))

(assert (= (and b!192264 res!90861) b!192278))

(assert (= (and b!192270 res!90863) b!192276))

(assert (= (and b!192276 c!34646) b!192281))

(assert (= (and b!192276 (not c!34646)) b!192275))

(assert (= (and b!192281 res!90867) b!192269))

(assert (= (or b!192281 b!192275) bm!19408))

(assert (= (and b!192276 res!90865) b!192267))

(assert (= (and b!192267 c!34645) b!192263))

(assert (= (and b!192267 (not c!34645)) b!192277))

(assert (= (and b!192263 res!90866) b!192268))

(assert (= (or b!192263 b!192277) bm!19413))

(declare-fun b_lambda!7423 () Bool)

(assert (=> (not b_lambda!7423) (not b!192278)))

(declare-fun t!7346 () Bool)

(declare-fun tb!2877 () Bool)

(assert (=> (and b!192132 (= (defaultEntry!3921 thiss!1248) (defaultEntry!3921 thiss!1248)) t!7346) tb!2877))

(declare-fun result!4909 () Bool)

(assert (=> tb!2877 (= result!4909 tp_is_empty!4461)))

(assert (=> b!192278 t!7346))

(declare-fun b_and!11379 () Bool)

(assert (= b_and!11375 (and (=> t!7346 result!4909) b_and!11379)))

(declare-fun m!218939 () Bool)

(assert (=> b!192278 m!218939))

(declare-fun m!218941 () Bool)

(assert (=> b!192278 m!218941))

(declare-fun m!218943 () Bool)

(assert (=> b!192278 m!218943))

(declare-fun m!218945 () Bool)

(assert (=> b!192278 m!218945))

(assert (=> b!192278 m!218939))

(assert (=> b!192278 m!218941))

(assert (=> b!192278 m!218945))

(declare-fun m!218947 () Bool)

(assert (=> b!192278 m!218947))

(declare-fun m!218949 () Bool)

(assert (=> bm!19408 m!218949))

(declare-fun m!218951 () Bool)

(assert (=> b!192266 m!218951))

(declare-fun m!218953 () Bool)

(assert (=> b!192266 m!218953))

(declare-fun m!218955 () Bool)

(assert (=> b!192266 m!218955))

(declare-fun m!218957 () Bool)

(assert (=> b!192266 m!218957))

(declare-fun m!218959 () Bool)

(assert (=> b!192266 m!218959))

(declare-fun m!218961 () Bool)

(assert (=> b!192266 m!218961))

(declare-fun m!218963 () Bool)

(assert (=> b!192266 m!218963))

(declare-fun m!218965 () Bool)

(assert (=> b!192266 m!218965))

(declare-fun m!218967 () Bool)

(assert (=> b!192266 m!218967))

(assert (=> b!192266 m!218953))

(declare-fun m!218969 () Bool)

(assert (=> b!192266 m!218969))

(assert (=> b!192266 m!218959))

(declare-fun m!218971 () Bool)

(assert (=> b!192266 m!218971))

(assert (=> b!192266 m!218971))

(declare-fun m!218973 () Bool)

(assert (=> b!192266 m!218973))

(declare-fun m!218975 () Bool)

(assert (=> b!192266 m!218975))

(assert (=> b!192266 m!218945))

(declare-fun m!218977 () Bool)

(assert (=> b!192266 m!218977))

(declare-fun m!218979 () Bool)

(assert (=> b!192266 m!218979))

(declare-fun m!218981 () Bool)

(assert (=> b!192266 m!218981))

(assert (=> b!192266 m!218979))

(declare-fun m!218983 () Bool)

(assert (=> bm!19413 m!218983))

(assert (=> b!192265 m!218945))

(assert (=> b!192265 m!218945))

(declare-fun m!218985 () Bool)

(assert (=> b!192265 m!218985))

(assert (=> bm!19410 m!218975))

(assert (=> b!192271 m!218945))

(assert (=> b!192271 m!218945))

(assert (=> b!192271 m!218985))

(assert (=> d!56345 m!218845))

(declare-fun m!218987 () Bool)

(assert (=> b!192269 m!218987))

(declare-fun m!218989 () Bool)

(assert (=> b!192280 m!218989))

(assert (=> b!192264 m!218945))

(assert (=> b!192264 m!218945))

(declare-fun m!218991 () Bool)

(assert (=> b!192264 m!218991))

(declare-fun m!218993 () Bool)

(assert (=> bm!19414 m!218993))

(declare-fun m!218995 () Bool)

(assert (=> b!192268 m!218995))

(assert (=> b!192136 d!56345))

(declare-fun b!192284 () Bool)

(declare-fun e!126538 () ListLongMap!2453)

(declare-fun call!19422 () ListLongMap!2453)

(assert (=> b!192284 (= e!126538 call!19422)))

(declare-fun b!192285 () Bool)

(declare-fun e!126535 () ListLongMap!2453)

(declare-fun e!126533 () ListLongMap!2453)

(assert (=> b!192285 (= e!126535 e!126533)))

(declare-fun c!34648 () Bool)

(assert (=> b!192285 (= c!34648 (and (not (= (bvand (extraKeys!3658 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3658 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!192286 () Bool)

(declare-fun e!126531 () Bool)

(declare-fun e!126540 () Bool)

(assert (=> b!192286 (= e!126531 e!126540)))

(declare-fun res!90875 () Bool)

(declare-fun call!19423 () Bool)

(assert (=> b!192286 (= res!90875 call!19423)))

(assert (=> b!192286 (=> (not res!90875) (not e!126540))))

(declare-fun b!192288 () Bool)

(declare-fun e!126529 () Bool)

(assert (=> b!192288 (= e!126529 (validKeyInArray!0 (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!192289 () Bool)

(declare-fun e!126539 () Unit!5811)

(declare-fun lt!95606 () Unit!5811)

(assert (=> b!192289 (= e!126539 lt!95606)))

(declare-fun lt!95604 () ListLongMap!2453)

(assert (=> b!192289 (= lt!95604 (getCurrentListMapNoExtraKeys!216 (_keys!5903 thiss!1248) (array!8166 (store (arr!3846 (_values!3904 thiss!1248)) (index!4895 lt!95475) (ValueCellFull!1887 v!309)) (size!4169 (_values!3904 thiss!1248))) (mask!9151 thiss!1248) (extraKeys!3658 thiss!1248) (zeroValue!3762 thiss!1248) (minValue!3762 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3921 thiss!1248)))))

(declare-fun lt!95591 () (_ BitVec 64))

(assert (=> b!192289 (= lt!95591 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95598 () (_ BitVec 64))

(assert (=> b!192289 (= lt!95598 (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95593 () Unit!5811)

(assert (=> b!192289 (= lt!95593 (addStillContains!159 lt!95604 lt!95591 (zeroValue!3762 thiss!1248) lt!95598))))

(assert (=> b!192289 (contains!1358 (+!310 lt!95604 (tuple2!3537 lt!95591 (zeroValue!3762 thiss!1248))) lt!95598)))

(declare-fun lt!95600 () Unit!5811)

(assert (=> b!192289 (= lt!95600 lt!95593)))

(declare-fun lt!95599 () ListLongMap!2453)

(assert (=> b!192289 (= lt!95599 (getCurrentListMapNoExtraKeys!216 (_keys!5903 thiss!1248) (array!8166 (store (arr!3846 (_values!3904 thiss!1248)) (index!4895 lt!95475) (ValueCellFull!1887 v!309)) (size!4169 (_values!3904 thiss!1248))) (mask!9151 thiss!1248) (extraKeys!3658 thiss!1248) (zeroValue!3762 thiss!1248) (minValue!3762 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3921 thiss!1248)))))

(declare-fun lt!95589 () (_ BitVec 64))

(assert (=> b!192289 (= lt!95589 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95590 () (_ BitVec 64))

(assert (=> b!192289 (= lt!95590 (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95587 () Unit!5811)

(assert (=> b!192289 (= lt!95587 (addApplyDifferent!159 lt!95599 lt!95589 (minValue!3762 thiss!1248) lt!95590))))

(assert (=> b!192289 (= (apply!183 (+!310 lt!95599 (tuple2!3537 lt!95589 (minValue!3762 thiss!1248))) lt!95590) (apply!183 lt!95599 lt!95590))))

(declare-fun lt!95597 () Unit!5811)

(assert (=> b!192289 (= lt!95597 lt!95587)))

(declare-fun lt!95595 () ListLongMap!2453)

(assert (=> b!192289 (= lt!95595 (getCurrentListMapNoExtraKeys!216 (_keys!5903 thiss!1248) (array!8166 (store (arr!3846 (_values!3904 thiss!1248)) (index!4895 lt!95475) (ValueCellFull!1887 v!309)) (size!4169 (_values!3904 thiss!1248))) (mask!9151 thiss!1248) (extraKeys!3658 thiss!1248) (zeroValue!3762 thiss!1248) (minValue!3762 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3921 thiss!1248)))))

(declare-fun lt!95607 () (_ BitVec 64))

(assert (=> b!192289 (= lt!95607 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95601 () (_ BitVec 64))

(assert (=> b!192289 (= lt!95601 (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95588 () Unit!5811)

(assert (=> b!192289 (= lt!95588 (addApplyDifferent!159 lt!95595 lt!95607 (zeroValue!3762 thiss!1248) lt!95601))))

(assert (=> b!192289 (= (apply!183 (+!310 lt!95595 (tuple2!3537 lt!95607 (zeroValue!3762 thiss!1248))) lt!95601) (apply!183 lt!95595 lt!95601))))

(declare-fun lt!95602 () Unit!5811)

(assert (=> b!192289 (= lt!95602 lt!95588)))

(declare-fun lt!95594 () ListLongMap!2453)

(assert (=> b!192289 (= lt!95594 (getCurrentListMapNoExtraKeys!216 (_keys!5903 thiss!1248) (array!8166 (store (arr!3846 (_values!3904 thiss!1248)) (index!4895 lt!95475) (ValueCellFull!1887 v!309)) (size!4169 (_values!3904 thiss!1248))) (mask!9151 thiss!1248) (extraKeys!3658 thiss!1248) (zeroValue!3762 thiss!1248) (minValue!3762 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3921 thiss!1248)))))

(declare-fun lt!95592 () (_ BitVec 64))

(assert (=> b!192289 (= lt!95592 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95603 () (_ BitVec 64))

(assert (=> b!192289 (= lt!95603 (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!192289 (= lt!95606 (addApplyDifferent!159 lt!95594 lt!95592 (minValue!3762 thiss!1248) lt!95603))))

(assert (=> b!192289 (= (apply!183 (+!310 lt!95594 (tuple2!3537 lt!95592 (minValue!3762 thiss!1248))) lt!95603) (apply!183 lt!95594 lt!95603))))

(declare-fun bm!19415 () Bool)

(declare-fun call!19420 () Bool)

(declare-fun lt!95596 () ListLongMap!2453)

(assert (=> bm!19415 (= call!19420 (contains!1358 lt!95596 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!192290 () Bool)

(declare-fun e!126541 () Bool)

(assert (=> b!192290 (= e!126541 e!126531)))

(declare-fun c!34651 () Bool)

(assert (=> b!192290 (= c!34651 (not (= (bvand (extraKeys!3658 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!192291 () Bool)

(assert (=> b!192291 (= e!126540 (= (apply!183 lt!95596 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3762 thiss!1248)))))

(declare-fun bm!19416 () Bool)

(declare-fun call!19424 () ListLongMap!2453)

(declare-fun call!19421 () ListLongMap!2453)

(assert (=> bm!19416 (= call!19424 call!19421)))

(declare-fun b!192292 () Bool)

(declare-fun e!126537 () Bool)

(assert (=> b!192292 (= e!126537 (= (apply!183 lt!95596 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3762 thiss!1248)))))

(declare-fun d!56347 () Bool)

(assert (=> d!56347 e!126541))

(declare-fun res!90871 () Bool)

(assert (=> d!56347 (=> (not res!90871) (not e!126541))))

(assert (=> d!56347 (= res!90871 (or (bvsge #b00000000000000000000000000000000 (size!4168 (_keys!5903 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4168 (_keys!5903 thiss!1248))))))))

(declare-fun lt!95586 () ListLongMap!2453)

(assert (=> d!56347 (= lt!95596 lt!95586)))

(declare-fun lt!95605 () Unit!5811)

(assert (=> d!56347 (= lt!95605 e!126539)))

(declare-fun c!34650 () Bool)

(assert (=> d!56347 (= c!34650 e!126529)))

(declare-fun res!90873 () Bool)

(assert (=> d!56347 (=> (not res!90873) (not e!126529))))

(assert (=> d!56347 (= res!90873 (bvslt #b00000000000000000000000000000000 (size!4168 (_keys!5903 thiss!1248))))))

(assert (=> d!56347 (= lt!95586 e!126535)))

(declare-fun c!34649 () Bool)

(assert (=> d!56347 (= c!34649 (and (not (= (bvand (extraKeys!3658 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3658 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56347 (validMask!0 (mask!9151 thiss!1248))))

(assert (=> d!56347 (= (getCurrentListMap!890 (_keys!5903 thiss!1248) (array!8166 (store (arr!3846 (_values!3904 thiss!1248)) (index!4895 lt!95475) (ValueCellFull!1887 v!309)) (size!4169 (_values!3904 thiss!1248))) (mask!9151 thiss!1248) (extraKeys!3658 thiss!1248) (zeroValue!3762 thiss!1248) (minValue!3762 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3921 thiss!1248)) lt!95596)))

(declare-fun b!192287 () Bool)

(declare-fun e!126534 () Bool)

(declare-fun e!126530 () Bool)

(assert (=> b!192287 (= e!126534 e!126530)))

(declare-fun res!90870 () Bool)

(assert (=> b!192287 (=> (not res!90870) (not e!126530))))

(assert (=> b!192287 (= res!90870 (contains!1358 lt!95596 (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!192287 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4168 (_keys!5903 thiss!1248))))))

(declare-fun b!192293 () Bool)

(declare-fun res!90872 () Bool)

(assert (=> b!192293 (=> (not res!90872) (not e!126541))))

(assert (=> b!192293 (= res!90872 e!126534)))

(declare-fun res!90877 () Bool)

(assert (=> b!192293 (=> res!90877 e!126534)))

(declare-fun e!126536 () Bool)

(assert (=> b!192293 (= res!90877 (not e!126536))))

(declare-fun res!90869 () Bool)

(assert (=> b!192293 (=> (not res!90869) (not e!126536))))

(assert (=> b!192293 (= res!90869 (bvslt #b00000000000000000000000000000000 (size!4168 (_keys!5903 thiss!1248))))))

(declare-fun b!192294 () Bool)

(assert (=> b!192294 (= e!126536 (validKeyInArray!0 (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!192295 () Bool)

(declare-fun c!34647 () Bool)

(assert (=> b!192295 (= c!34647 (and (not (= (bvand (extraKeys!3658 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3658 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!192295 (= e!126533 e!126538)))

(declare-fun call!19419 () ListLongMap!2453)

(declare-fun bm!19417 () Bool)

(assert (=> bm!19417 (= call!19419 (getCurrentListMapNoExtraKeys!216 (_keys!5903 thiss!1248) (array!8166 (store (arr!3846 (_values!3904 thiss!1248)) (index!4895 lt!95475) (ValueCellFull!1887 v!309)) (size!4169 (_values!3904 thiss!1248))) (mask!9151 thiss!1248) (extraKeys!3658 thiss!1248) (zeroValue!3762 thiss!1248) (minValue!3762 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3921 thiss!1248)))))

(declare-fun b!192296 () Bool)

(assert (=> b!192296 (= e!126533 call!19422)))

(declare-fun b!192297 () Bool)

(declare-fun Unit!5818 () Unit!5811)

(assert (=> b!192297 (= e!126539 Unit!5818)))

(declare-fun bm!19418 () Bool)

(assert (=> bm!19418 (= call!19421 call!19419)))

(declare-fun b!192298 () Bool)

(declare-fun e!126532 () Bool)

(assert (=> b!192298 (= e!126532 (not call!19420))))

(declare-fun b!192299 () Bool)

(declare-fun res!90874 () Bool)

(assert (=> b!192299 (=> (not res!90874) (not e!126541))))

(assert (=> b!192299 (= res!90874 e!126532)))

(declare-fun c!34652 () Bool)

(assert (=> b!192299 (= c!34652 (not (= (bvand (extraKeys!3658 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!19419 () Bool)

(declare-fun call!19418 () ListLongMap!2453)

(assert (=> bm!19419 (= call!19422 call!19418)))

(declare-fun bm!19420 () Bool)

(assert (=> bm!19420 (= call!19423 (contains!1358 lt!95596 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!19421 () Bool)

(assert (=> bm!19421 (= call!19418 (+!310 (ite c!34649 call!19419 (ite c!34648 call!19421 call!19424)) (ite (or c!34649 c!34648) (tuple2!3537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3762 thiss!1248)) (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248)))))))

(declare-fun b!192300 () Bool)

(assert (=> b!192300 (= e!126531 (not call!19423))))

(declare-fun b!192301 () Bool)

(assert (=> b!192301 (= e!126530 (= (apply!183 lt!95596 (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000)) (get!2219 (select (arr!3846 (array!8166 (store (arr!3846 (_values!3904 thiss!1248)) (index!4895 lt!95475) (ValueCellFull!1887 v!309)) (size!4169 (_values!3904 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!526 (defaultEntry!3921 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!192301 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4169 (array!8166 (store (arr!3846 (_values!3904 thiss!1248)) (index!4895 lt!95475) (ValueCellFull!1887 v!309)) (size!4169 (_values!3904 thiss!1248))))))))

(assert (=> b!192301 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4168 (_keys!5903 thiss!1248))))))

(declare-fun b!192302 () Bool)

(assert (=> b!192302 (= e!126538 call!19424)))

(declare-fun b!192303 () Bool)

(assert (=> b!192303 (= e!126535 (+!310 call!19418 (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248))))))

(declare-fun b!192304 () Bool)

(assert (=> b!192304 (= e!126532 e!126537)))

(declare-fun res!90876 () Bool)

(assert (=> b!192304 (= res!90876 call!19420)))

(assert (=> b!192304 (=> (not res!90876) (not e!126537))))

(assert (= (and d!56347 c!34649) b!192303))

(assert (= (and d!56347 (not c!34649)) b!192285))

(assert (= (and b!192285 c!34648) b!192296))

(assert (= (and b!192285 (not c!34648)) b!192295))

(assert (= (and b!192295 c!34647) b!192284))

(assert (= (and b!192295 (not c!34647)) b!192302))

(assert (= (or b!192284 b!192302) bm!19416))

(assert (= (or b!192296 bm!19416) bm!19418))

(assert (= (or b!192296 b!192284) bm!19419))

(assert (= (or b!192303 bm!19418) bm!19417))

(assert (= (or b!192303 bm!19419) bm!19421))

(assert (= (and d!56347 res!90873) b!192288))

(assert (= (and d!56347 c!34650) b!192289))

(assert (= (and d!56347 (not c!34650)) b!192297))

(assert (= (and d!56347 res!90871) b!192293))

(assert (= (and b!192293 res!90869) b!192294))

(assert (= (and b!192293 (not res!90877)) b!192287))

(assert (= (and b!192287 res!90870) b!192301))

(assert (= (and b!192293 res!90872) b!192299))

(assert (= (and b!192299 c!34652) b!192304))

(assert (= (and b!192299 (not c!34652)) b!192298))

(assert (= (and b!192304 res!90876) b!192292))

(assert (= (or b!192304 b!192298) bm!19415))

(assert (= (and b!192299 res!90874) b!192290))

(assert (= (and b!192290 c!34651) b!192286))

(assert (= (and b!192290 (not c!34651)) b!192300))

(assert (= (and b!192286 res!90875) b!192291))

(assert (= (or b!192286 b!192300) bm!19420))

(declare-fun b_lambda!7425 () Bool)

(assert (=> (not b_lambda!7425) (not b!192301)))

(assert (=> b!192301 t!7346))

(declare-fun b_and!11381 () Bool)

(assert (= b_and!11379 (and (=> t!7346 result!4909) b_and!11381)))

(declare-fun m!218997 () Bool)

(assert (=> b!192301 m!218997))

(assert (=> b!192301 m!218941))

(declare-fun m!218999 () Bool)

(assert (=> b!192301 m!218999))

(assert (=> b!192301 m!218945))

(assert (=> b!192301 m!218997))

(assert (=> b!192301 m!218941))

(assert (=> b!192301 m!218945))

(declare-fun m!219001 () Bool)

(assert (=> b!192301 m!219001))

(declare-fun m!219003 () Bool)

(assert (=> bm!19415 m!219003))

(declare-fun m!219005 () Bool)

(assert (=> b!192289 m!219005))

(declare-fun m!219007 () Bool)

(assert (=> b!192289 m!219007))

(declare-fun m!219009 () Bool)

(assert (=> b!192289 m!219009))

(declare-fun m!219011 () Bool)

(assert (=> b!192289 m!219011))

(declare-fun m!219013 () Bool)

(assert (=> b!192289 m!219013))

(declare-fun m!219015 () Bool)

(assert (=> b!192289 m!219015))

(declare-fun m!219017 () Bool)

(assert (=> b!192289 m!219017))

(declare-fun m!219019 () Bool)

(assert (=> b!192289 m!219019))

(declare-fun m!219021 () Bool)

(assert (=> b!192289 m!219021))

(assert (=> b!192289 m!219007))

(declare-fun m!219023 () Bool)

(assert (=> b!192289 m!219023))

(assert (=> b!192289 m!219013))

(declare-fun m!219025 () Bool)

(assert (=> b!192289 m!219025))

(assert (=> b!192289 m!219025))

(declare-fun m!219027 () Bool)

(assert (=> b!192289 m!219027))

(declare-fun m!219029 () Bool)

(assert (=> b!192289 m!219029))

(assert (=> b!192289 m!218945))

(declare-fun m!219031 () Bool)

(assert (=> b!192289 m!219031))

(declare-fun m!219033 () Bool)

(assert (=> b!192289 m!219033))

(declare-fun m!219035 () Bool)

(assert (=> b!192289 m!219035))

(assert (=> b!192289 m!219033))

(declare-fun m!219037 () Bool)

(assert (=> bm!19420 m!219037))

(assert (=> b!192288 m!218945))

(assert (=> b!192288 m!218945))

(assert (=> b!192288 m!218985))

(assert (=> bm!19417 m!219029))

(assert (=> b!192294 m!218945))

(assert (=> b!192294 m!218945))

(assert (=> b!192294 m!218985))

(assert (=> d!56347 m!218845))

(declare-fun m!219039 () Bool)

(assert (=> b!192292 m!219039))

(declare-fun m!219041 () Bool)

(assert (=> b!192303 m!219041))

(assert (=> b!192287 m!218945))

(assert (=> b!192287 m!218945))

(declare-fun m!219043 () Bool)

(assert (=> b!192287 m!219043))

(declare-fun m!219045 () Bool)

(assert (=> bm!19421 m!219045))

(declare-fun m!219047 () Bool)

(assert (=> b!192291 m!219047))

(assert (=> b!192136 d!56347))

(declare-fun d!56349 () Bool)

(declare-fun e!126547 () Bool)

(assert (=> d!56349 e!126547))

(declare-fun res!90880 () Bool)

(assert (=> d!56349 (=> res!90880 e!126547)))

(declare-fun lt!95617 () Bool)

(assert (=> d!56349 (= res!90880 (not lt!95617))))

(declare-fun lt!95619 () Bool)

(assert (=> d!56349 (= lt!95617 lt!95619)))

(declare-fun lt!95618 () Unit!5811)

(declare-fun e!126546 () Unit!5811)

(assert (=> d!56349 (= lt!95618 e!126546)))

(declare-fun c!34655 () Bool)

(assert (=> d!56349 (= c!34655 lt!95619)))

(declare-fun containsKey!244 (List!2428 (_ BitVec 64)) Bool)

(assert (=> d!56349 (= lt!95619 (containsKey!244 (toList!1242 lt!95476) key!828))))

(assert (=> d!56349 (= (contains!1358 lt!95476 key!828) lt!95617)))

(declare-fun b!192311 () Bool)

(declare-fun lt!95616 () Unit!5811)

(assert (=> b!192311 (= e!126546 lt!95616)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!192 (List!2428 (_ BitVec 64)) Unit!5811)

(assert (=> b!192311 (= lt!95616 (lemmaContainsKeyImpliesGetValueByKeyDefined!192 (toList!1242 lt!95476) key!828))))

(declare-fun isDefined!193 (Option!246) Bool)

(assert (=> b!192311 (isDefined!193 (getValueByKey!240 (toList!1242 lt!95476) key!828))))

(declare-fun b!192312 () Bool)

(declare-fun Unit!5819 () Unit!5811)

(assert (=> b!192312 (= e!126546 Unit!5819)))

(declare-fun b!192313 () Bool)

(assert (=> b!192313 (= e!126547 (isDefined!193 (getValueByKey!240 (toList!1242 lt!95476) key!828)))))

(assert (= (and d!56349 c!34655) b!192311))

(assert (= (and d!56349 (not c!34655)) b!192312))

(assert (= (and d!56349 (not res!90880)) b!192313))

(declare-fun m!219049 () Bool)

(assert (=> d!56349 m!219049))

(declare-fun m!219051 () Bool)

(assert (=> b!192311 m!219051))

(declare-fun m!219053 () Bool)

(assert (=> b!192311 m!219053))

(assert (=> b!192311 m!219053))

(declare-fun m!219055 () Bool)

(assert (=> b!192311 m!219055))

(assert (=> b!192313 m!219053))

(assert (=> b!192313 m!219053))

(assert (=> b!192313 m!219055))

(assert (=> b!192136 d!56349))

(declare-fun d!56351 () Bool)

(declare-fun e!126550 () Bool)

(assert (=> d!56351 e!126550))

(declare-fun res!90883 () Bool)

(assert (=> d!56351 (=> (not res!90883) (not e!126550))))

(assert (=> d!56351 (= res!90883 (and (bvsge (index!4895 lt!95475) #b00000000000000000000000000000000) (bvslt (index!4895 lt!95475) (size!4169 (_values!3904 thiss!1248)))))))

(declare-fun lt!95622 () Unit!5811)

(declare-fun choose!1046 (array!8163 array!8165 (_ BitVec 32) (_ BitVec 32) V!5595 V!5595 (_ BitVec 32) (_ BitVec 64) V!5595 Int) Unit!5811)

(assert (=> d!56351 (= lt!95622 (choose!1046 (_keys!5903 thiss!1248) (_values!3904 thiss!1248) (mask!9151 thiss!1248) (extraKeys!3658 thiss!1248) (zeroValue!3762 thiss!1248) (minValue!3762 thiss!1248) (index!4895 lt!95475) key!828 v!309 (defaultEntry!3921 thiss!1248)))))

(assert (=> d!56351 (validMask!0 (mask!9151 thiss!1248))))

(assert (=> d!56351 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!111 (_keys!5903 thiss!1248) (_values!3904 thiss!1248) (mask!9151 thiss!1248) (extraKeys!3658 thiss!1248) (zeroValue!3762 thiss!1248) (minValue!3762 thiss!1248) (index!4895 lt!95475) key!828 v!309 (defaultEntry!3921 thiss!1248)) lt!95622)))

(declare-fun b!192316 () Bool)

(assert (=> b!192316 (= e!126550 (= (+!310 (getCurrentListMap!890 (_keys!5903 thiss!1248) (_values!3904 thiss!1248) (mask!9151 thiss!1248) (extraKeys!3658 thiss!1248) (zeroValue!3762 thiss!1248) (minValue!3762 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3921 thiss!1248)) (tuple2!3537 key!828 v!309)) (getCurrentListMap!890 (_keys!5903 thiss!1248) (array!8166 (store (arr!3846 (_values!3904 thiss!1248)) (index!4895 lt!95475) (ValueCellFull!1887 v!309)) (size!4169 (_values!3904 thiss!1248))) (mask!9151 thiss!1248) (extraKeys!3658 thiss!1248) (zeroValue!3762 thiss!1248) (minValue!3762 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3921 thiss!1248))))))

(assert (= (and d!56351 res!90883) b!192316))

(declare-fun m!219057 () Bool)

(assert (=> d!56351 m!219057))

(assert (=> d!56351 m!218845))

(assert (=> b!192316 m!218851))

(assert (=> b!192316 m!218851))

(declare-fun m!219059 () Bool)

(assert (=> b!192316 m!219059))

(assert (=> b!192316 m!218841))

(assert (=> b!192316 m!218853))

(assert (=> b!192136 d!56351))

(declare-fun d!56353 () Bool)

(assert (=> d!56353 (= (array_inv!2493 (_keys!5903 thiss!1248)) (bvsge (size!4168 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!192132 d!56353))

(declare-fun d!56355 () Bool)

(assert (=> d!56355 (= (array_inv!2494 (_values!3904 thiss!1248)) (bvsge (size!4169 (_values!3904 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!192132 d!56355))

(declare-fun b!192329 () Bool)

(declare-fun e!126557 () SeekEntryResult!681)

(assert (=> b!192329 (= e!126557 Undefined!681)))

(declare-fun b!192330 () Bool)

(declare-fun e!126559 () SeekEntryResult!681)

(declare-fun lt!95629 () SeekEntryResult!681)

(assert (=> b!192330 (= e!126559 (Found!681 (index!4896 lt!95629)))))

(declare-fun b!192332 () Bool)

(declare-fun e!126558 () SeekEntryResult!681)

(assert (=> b!192332 (= e!126558 (MissingZero!681 (index!4896 lt!95629)))))

(declare-fun b!192333 () Bool)

(assert (=> b!192333 (= e!126557 e!126559)))

(declare-fun lt!95631 () (_ BitVec 64))

(assert (=> b!192333 (= lt!95631 (select (arr!3845 (_keys!5903 thiss!1248)) (index!4896 lt!95629)))))

(declare-fun c!34664 () Bool)

(assert (=> b!192333 (= c!34664 (= lt!95631 key!828))))

(declare-fun b!192334 () Bool)

(declare-fun c!34663 () Bool)

(assert (=> b!192334 (= c!34663 (= lt!95631 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!192334 (= e!126559 e!126558)))

(declare-fun b!192331 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8163 (_ BitVec 32)) SeekEntryResult!681)

(assert (=> b!192331 (= e!126558 (seekKeyOrZeroReturnVacant!0 (x!20579 lt!95629) (index!4896 lt!95629) (index!4896 lt!95629) key!828 (_keys!5903 thiss!1248) (mask!9151 thiss!1248)))))

(declare-fun d!56357 () Bool)

(declare-fun lt!95630 () SeekEntryResult!681)

(assert (=> d!56357 (and (or ((_ is Undefined!681) lt!95630) (not ((_ is Found!681) lt!95630)) (and (bvsge (index!4895 lt!95630) #b00000000000000000000000000000000) (bvslt (index!4895 lt!95630) (size!4168 (_keys!5903 thiss!1248))))) (or ((_ is Undefined!681) lt!95630) ((_ is Found!681) lt!95630) (not ((_ is MissingZero!681) lt!95630)) (and (bvsge (index!4894 lt!95630) #b00000000000000000000000000000000) (bvslt (index!4894 lt!95630) (size!4168 (_keys!5903 thiss!1248))))) (or ((_ is Undefined!681) lt!95630) ((_ is Found!681) lt!95630) ((_ is MissingZero!681) lt!95630) (not ((_ is MissingVacant!681) lt!95630)) (and (bvsge (index!4897 lt!95630) #b00000000000000000000000000000000) (bvslt (index!4897 lt!95630) (size!4168 (_keys!5903 thiss!1248))))) (or ((_ is Undefined!681) lt!95630) (ite ((_ is Found!681) lt!95630) (= (select (arr!3845 (_keys!5903 thiss!1248)) (index!4895 lt!95630)) key!828) (ite ((_ is MissingZero!681) lt!95630) (= (select (arr!3845 (_keys!5903 thiss!1248)) (index!4894 lt!95630)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!681) lt!95630) (= (select (arr!3845 (_keys!5903 thiss!1248)) (index!4897 lt!95630)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!56357 (= lt!95630 e!126557)))

(declare-fun c!34662 () Bool)

(assert (=> d!56357 (= c!34662 (and ((_ is Intermediate!681) lt!95629) (undefined!1493 lt!95629)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8163 (_ BitVec 32)) SeekEntryResult!681)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!56357 (= lt!95629 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9151 thiss!1248)) key!828 (_keys!5903 thiss!1248) (mask!9151 thiss!1248)))))

(assert (=> d!56357 (validMask!0 (mask!9151 thiss!1248))))

(assert (=> d!56357 (= (seekEntryOrOpen!0 key!828 (_keys!5903 thiss!1248) (mask!9151 thiss!1248)) lt!95630)))

(assert (= (and d!56357 c!34662) b!192329))

(assert (= (and d!56357 (not c!34662)) b!192333))

(assert (= (and b!192333 c!34664) b!192330))

(assert (= (and b!192333 (not c!34664)) b!192334))

(assert (= (and b!192334 c!34663) b!192332))

(assert (= (and b!192334 (not c!34663)) b!192331))

(declare-fun m!219061 () Bool)

(assert (=> b!192333 m!219061))

(declare-fun m!219063 () Bool)

(assert (=> b!192331 m!219063))

(assert (=> d!56357 m!218845))

(declare-fun m!219065 () Bool)

(assert (=> d!56357 m!219065))

(declare-fun m!219067 () Bool)

(assert (=> d!56357 m!219067))

(declare-fun m!219069 () Bool)

(assert (=> d!56357 m!219069))

(assert (=> d!56357 m!219065))

(declare-fun m!219071 () Bool)

(assert (=> d!56357 m!219071))

(declare-fun m!219073 () Bool)

(assert (=> d!56357 m!219073))

(assert (=> b!192131 d!56357))

(declare-fun b!192341 () Bool)

(declare-fun e!126565 () Bool)

(assert (=> b!192341 (= e!126565 tp_is_empty!4461)))

(declare-fun b!192342 () Bool)

(declare-fun e!126564 () Bool)

(assert (=> b!192342 (= e!126564 tp_is_empty!4461)))

(declare-fun mapIsEmpty!7714 () Bool)

(declare-fun mapRes!7714 () Bool)

(assert (=> mapIsEmpty!7714 mapRes!7714))

(declare-fun condMapEmpty!7714 () Bool)

(declare-fun mapDefault!7714 () ValueCell!1887)

(assert (=> mapNonEmpty!7708 (= condMapEmpty!7714 (= mapRest!7708 ((as const (Array (_ BitVec 32) ValueCell!1887)) mapDefault!7714)))))

(assert (=> mapNonEmpty!7708 (= tp!16920 (and e!126564 mapRes!7714))))

(declare-fun mapNonEmpty!7714 () Bool)

(declare-fun tp!16930 () Bool)

(assert (=> mapNonEmpty!7714 (= mapRes!7714 (and tp!16930 e!126565))))

(declare-fun mapValue!7714 () ValueCell!1887)

(declare-fun mapKey!7714 () (_ BitVec 32))

(declare-fun mapRest!7714 () (Array (_ BitVec 32) ValueCell!1887))

(assert (=> mapNonEmpty!7714 (= mapRest!7708 (store mapRest!7714 mapKey!7714 mapValue!7714))))

(assert (= (and mapNonEmpty!7708 condMapEmpty!7714) mapIsEmpty!7714))

(assert (= (and mapNonEmpty!7708 (not condMapEmpty!7714)) mapNonEmpty!7714))

(assert (= (and mapNonEmpty!7714 ((_ is ValueCellFull!1887) mapValue!7714)) b!192341))

(assert (= (and mapNonEmpty!7708 ((_ is ValueCellFull!1887) mapDefault!7714)) b!192342))

(declare-fun m!219075 () Bool)

(assert (=> mapNonEmpty!7714 m!219075))

(declare-fun b_lambda!7427 () Bool)

(assert (= b_lambda!7423 (or (and b!192132 b_free!4689) b_lambda!7427)))

(declare-fun b_lambda!7429 () Bool)

(assert (= b_lambda!7425 (or (and b!192132 b_free!4689) b_lambda!7429)))

(check-sat (not bm!19415) (not bm!19414) (not b!192301) (not b!192269) (not d!56349) (not b!192268) (not bm!19413) (not b!192294) (not b!192289) (not b!192303) (not bm!19393) (not b_lambda!7429) (not b!192265) (not b!192217) (not bm!19421) (not d!56341) (not b!192211) (not b!192278) (not bm!19392) (not b!192266) (not d!56347) (not b!192288) (not bm!19410) (not d!56335) (not b_lambda!7427) (not b_next!4689) (not b!192313) (not b!192218) (not b!192311) tp_is_empty!4461 (not b!192280) (not d!56337) (not d!56357) (not b!192316) (not d!56333) (not d!56345) (not b!192271) (not b!192291) (not b!192205) (not b!192292) (not bm!19408) b_and!11381 (not mapNonEmpty!7714) (not b!192204) (not b!192331) (not b!192206) (not bm!19417) (not b!192287) (not d!56351) (not b!192264) (not bm!19420))
(check-sat b_and!11381 (not b_next!4689))
(get-model)

(declare-fun b!192367 () Bool)

(declare-fun e!126584 () Bool)

(declare-fun e!126585 () Bool)

(assert (=> b!192367 (= e!126584 e!126585)))

(declare-fun c!34674 () Bool)

(declare-fun e!126586 () Bool)

(assert (=> b!192367 (= c!34674 e!126586)))

(declare-fun res!90892 () Bool)

(assert (=> b!192367 (=> (not res!90892) (not e!126586))))

(assert (=> b!192367 (= res!90892 (bvslt #b00000000000000000000000000000000 (size!4168 (_keys!5903 thiss!1248))))))

(declare-fun b!192368 () Bool)

(declare-fun e!126583 () Bool)

(assert (=> b!192368 (= e!126585 e!126583)))

(assert (=> b!192368 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4168 (_keys!5903 thiss!1248))))))

(declare-fun res!90894 () Bool)

(declare-fun lt!95647 () ListLongMap!2453)

(assert (=> b!192368 (= res!90894 (contains!1358 lt!95647 (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!192368 (=> (not res!90894) (not e!126583))))

(declare-fun b!192369 () Bool)

(declare-fun e!126582 () ListLongMap!2453)

(declare-fun e!126581 () ListLongMap!2453)

(assert (=> b!192369 (= e!126582 e!126581)))

(declare-fun c!34673 () Bool)

(assert (=> b!192369 (= c!34673 (validKeyInArray!0 (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19424 () Bool)

(declare-fun call!19427 () ListLongMap!2453)

(assert (=> bm!19424 (= call!19427 (getCurrentListMapNoExtraKeys!216 (_keys!5903 thiss!1248) (_values!3904 thiss!1248) (mask!9151 thiss!1248) (extraKeys!3658 thiss!1248) (zeroValue!3762 thiss!1248) (minValue!3762 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3921 thiss!1248)))))

(declare-fun b!192370 () Bool)

(assert (=> b!192370 (= e!126582 (ListLongMap!2454 Nil!2425))))

(declare-fun b!192371 () Bool)

(declare-fun e!126580 () Bool)

(assert (=> b!192371 (= e!126585 e!126580)))

(declare-fun c!34675 () Bool)

(assert (=> b!192371 (= c!34675 (bvslt #b00000000000000000000000000000000 (size!4168 (_keys!5903 thiss!1248))))))

(declare-fun b!192372 () Bool)

(declare-fun res!90895 () Bool)

(assert (=> b!192372 (=> (not res!90895) (not e!126584))))

(assert (=> b!192372 (= res!90895 (not (contains!1358 lt!95647 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!192373 () Bool)

(assert (=> b!192373 (= e!126581 call!19427)))

(declare-fun b!192374 () Bool)

(assert (=> b!192374 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4168 (_keys!5903 thiss!1248))))))

(assert (=> b!192374 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4169 (_values!3904 thiss!1248))))))

(assert (=> b!192374 (= e!126583 (= (apply!183 lt!95647 (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000)) (get!2219 (select (arr!3846 (_values!3904 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!526 (defaultEntry!3921 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!192375 () Bool)

(assert (=> b!192375 (= e!126586 (validKeyInArray!0 (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!192375 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!56359 () Bool)

(assert (=> d!56359 e!126584))

(declare-fun res!90893 () Bool)

(assert (=> d!56359 (=> (not res!90893) (not e!126584))))

(assert (=> d!56359 (= res!90893 (not (contains!1358 lt!95647 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56359 (= lt!95647 e!126582)))

(declare-fun c!34676 () Bool)

(assert (=> d!56359 (= c!34676 (bvsge #b00000000000000000000000000000000 (size!4168 (_keys!5903 thiss!1248))))))

(assert (=> d!56359 (validMask!0 (mask!9151 thiss!1248))))

(assert (=> d!56359 (= (getCurrentListMapNoExtraKeys!216 (_keys!5903 thiss!1248) (_values!3904 thiss!1248) (mask!9151 thiss!1248) (extraKeys!3658 thiss!1248) (zeroValue!3762 thiss!1248) (minValue!3762 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3921 thiss!1248)) lt!95647)))

(declare-fun b!192376 () Bool)

(declare-fun isEmpty!485 (ListLongMap!2453) Bool)

(assert (=> b!192376 (= e!126580 (isEmpty!485 lt!95647))))

(declare-fun b!192377 () Bool)

(declare-fun lt!95649 () Unit!5811)

(declare-fun lt!95646 () Unit!5811)

(assert (=> b!192377 (= lt!95649 lt!95646)))

(declare-fun lt!95651 () V!5595)

(declare-fun lt!95650 () (_ BitVec 64))

(declare-fun lt!95652 () (_ BitVec 64))

(declare-fun lt!95648 () ListLongMap!2453)

(assert (=> b!192377 (not (contains!1358 (+!310 lt!95648 (tuple2!3537 lt!95652 lt!95651)) lt!95650))))

(declare-fun addStillNotContains!96 (ListLongMap!2453 (_ BitVec 64) V!5595 (_ BitVec 64)) Unit!5811)

(assert (=> b!192377 (= lt!95646 (addStillNotContains!96 lt!95648 lt!95652 lt!95651 lt!95650))))

(assert (=> b!192377 (= lt!95650 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!192377 (= lt!95651 (get!2219 (select (arr!3846 (_values!3904 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!526 (defaultEntry!3921 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!192377 (= lt!95652 (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!192377 (= lt!95648 call!19427)))

(assert (=> b!192377 (= e!126581 (+!310 call!19427 (tuple2!3537 (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000) (get!2219 (select (arr!3846 (_values!3904 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!526 (defaultEntry!3921 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!192378 () Bool)

(assert (=> b!192378 (= e!126580 (= lt!95647 (getCurrentListMapNoExtraKeys!216 (_keys!5903 thiss!1248) (_values!3904 thiss!1248) (mask!9151 thiss!1248) (extraKeys!3658 thiss!1248) (zeroValue!3762 thiss!1248) (minValue!3762 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3921 thiss!1248))))))

(assert (= (and d!56359 c!34676) b!192370))

(assert (= (and d!56359 (not c!34676)) b!192369))

(assert (= (and b!192369 c!34673) b!192377))

(assert (= (and b!192369 (not c!34673)) b!192373))

(assert (= (or b!192377 b!192373) bm!19424))

(assert (= (and d!56359 res!90893) b!192372))

(assert (= (and b!192372 res!90895) b!192367))

(assert (= (and b!192367 res!90892) b!192375))

(assert (= (and b!192367 c!34674) b!192368))

(assert (= (and b!192367 (not c!34674)) b!192371))

(assert (= (and b!192368 res!90894) b!192374))

(assert (= (and b!192371 c!34675) b!192378))

(assert (= (and b!192371 (not c!34675)) b!192376))

(declare-fun b_lambda!7431 () Bool)

(assert (=> (not b_lambda!7431) (not b!192374)))

(assert (=> b!192374 t!7346))

(declare-fun b_and!11383 () Bool)

(assert (= b_and!11381 (and (=> t!7346 result!4909) b_and!11383)))

(declare-fun b_lambda!7433 () Bool)

(assert (=> (not b_lambda!7433) (not b!192377)))

(assert (=> b!192377 t!7346))

(declare-fun b_and!11385 () Bool)

(assert (= b_and!11383 (and (=> t!7346 result!4909) b_and!11385)))

(declare-fun m!219077 () Bool)

(assert (=> b!192378 m!219077))

(assert (=> b!192369 m!218945))

(assert (=> b!192369 m!218945))

(assert (=> b!192369 m!218985))

(assert (=> b!192368 m!218945))

(assert (=> b!192368 m!218945))

(declare-fun m!219079 () Bool)

(assert (=> b!192368 m!219079))

(declare-fun m!219081 () Bool)

(assert (=> b!192377 m!219081))

(declare-fun m!219083 () Bool)

(assert (=> b!192377 m!219083))

(declare-fun m!219085 () Bool)

(assert (=> b!192377 m!219085))

(assert (=> b!192377 m!218939))

(assert (=> b!192377 m!218941))

(assert (=> b!192377 m!218943))

(assert (=> b!192377 m!218941))

(declare-fun m!219087 () Bool)

(assert (=> b!192377 m!219087))

(assert (=> b!192377 m!219081))

(assert (=> b!192377 m!218945))

(assert (=> b!192377 m!218939))

(declare-fun m!219089 () Bool)

(assert (=> d!56359 m!219089))

(assert (=> d!56359 m!218845))

(declare-fun m!219091 () Bool)

(assert (=> b!192376 m!219091))

(assert (=> b!192374 m!218939))

(assert (=> b!192374 m!218941))

(assert (=> b!192374 m!218943))

(assert (=> b!192374 m!218941))

(assert (=> b!192374 m!218945))

(assert (=> b!192374 m!218939))

(assert (=> b!192374 m!218945))

(declare-fun m!219093 () Bool)

(assert (=> b!192374 m!219093))

(assert (=> bm!19424 m!219077))

(assert (=> b!192375 m!218945))

(assert (=> b!192375 m!218945))

(assert (=> b!192375 m!218985))

(declare-fun m!219095 () Bool)

(assert (=> b!192372 m!219095))

(assert (=> bm!19410 d!56359))

(declare-fun d!56361 () Bool)

(declare-fun get!2220 (Option!246) V!5595)

(assert (=> d!56361 (= (apply!183 lt!95596 (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000)) (get!2220 (getValueByKey!240 (toList!1242 lt!95596) (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7689 () Bool)

(assert (= bs!7689 d!56361))

(assert (=> bs!7689 m!218945))

(declare-fun m!219097 () Bool)

(assert (=> bs!7689 m!219097))

(assert (=> bs!7689 m!219097))

(declare-fun m!219099 () Bool)

(assert (=> bs!7689 m!219099))

(assert (=> b!192301 d!56361))

(declare-fun d!56363 () Bool)

(declare-fun c!34679 () Bool)

(assert (=> d!56363 (= c!34679 ((_ is ValueCellFull!1887) (select (arr!3846 (array!8166 (store (arr!3846 (_values!3904 thiss!1248)) (index!4895 lt!95475) (ValueCellFull!1887 v!309)) (size!4169 (_values!3904 thiss!1248)))) #b00000000000000000000000000000000)))))

(declare-fun e!126589 () V!5595)

(assert (=> d!56363 (= (get!2219 (select (arr!3846 (array!8166 (store (arr!3846 (_values!3904 thiss!1248)) (index!4895 lt!95475) (ValueCellFull!1887 v!309)) (size!4169 (_values!3904 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!526 (defaultEntry!3921 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!126589)))

(declare-fun b!192383 () Bool)

(declare-fun get!2221 (ValueCell!1887 V!5595) V!5595)

(assert (=> b!192383 (= e!126589 (get!2221 (select (arr!3846 (array!8166 (store (arr!3846 (_values!3904 thiss!1248)) (index!4895 lt!95475) (ValueCellFull!1887 v!309)) (size!4169 (_values!3904 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!526 (defaultEntry!3921 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!192384 () Bool)

(declare-fun get!2222 (ValueCell!1887 V!5595) V!5595)

(assert (=> b!192384 (= e!126589 (get!2222 (select (arr!3846 (array!8166 (store (arr!3846 (_values!3904 thiss!1248)) (index!4895 lt!95475) (ValueCellFull!1887 v!309)) (size!4169 (_values!3904 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!526 (defaultEntry!3921 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56363 c!34679) b!192383))

(assert (= (and d!56363 (not c!34679)) b!192384))

(assert (=> b!192383 m!218997))

(assert (=> b!192383 m!218941))

(declare-fun m!219101 () Bool)

(assert (=> b!192383 m!219101))

(assert (=> b!192384 m!218997))

(assert (=> b!192384 m!218941))

(declare-fun m!219103 () Bool)

(assert (=> b!192384 m!219103))

(assert (=> b!192301 d!56363))

(declare-fun b!192403 () Bool)

(declare-fun e!126604 () SeekEntryResult!681)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!192403 (= e!126604 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!9151 thiss!1248)) #b00000000000000000000000000000000 (mask!9151 thiss!1248)) key!828 (_keys!5903 thiss!1248) (mask!9151 thiss!1248)))))

(declare-fun b!192404 () Bool)

(declare-fun e!126603 () Bool)

(declare-fun lt!95657 () SeekEntryResult!681)

(assert (=> b!192404 (= e!126603 (bvsge (x!20579 lt!95657) #b01111111111111111111111111111110))))

(declare-fun b!192405 () Bool)

(assert (=> b!192405 (= e!126604 (Intermediate!681 false (toIndex!0 key!828 (mask!9151 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!192407 () Bool)

(declare-fun e!126602 () SeekEntryResult!681)

(assert (=> b!192407 (= e!126602 (Intermediate!681 true (toIndex!0 key!828 (mask!9151 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!192408 () Bool)

(declare-fun e!126601 () Bool)

(assert (=> b!192408 (= e!126603 e!126601)))

(declare-fun res!90902 () Bool)

(assert (=> b!192408 (= res!90902 (and ((_ is Intermediate!681) lt!95657) (not (undefined!1493 lt!95657)) (bvslt (x!20579 lt!95657) #b01111111111111111111111111111110) (bvsge (x!20579 lt!95657) #b00000000000000000000000000000000) (bvsge (x!20579 lt!95657) #b00000000000000000000000000000000)))))

(assert (=> b!192408 (=> (not res!90902) (not e!126601))))

(declare-fun b!192409 () Bool)

(assert (=> b!192409 (and (bvsge (index!4896 lt!95657) #b00000000000000000000000000000000) (bvslt (index!4896 lt!95657) (size!4168 (_keys!5903 thiss!1248))))))

(declare-fun res!90904 () Bool)

(assert (=> b!192409 (= res!90904 (= (select (arr!3845 (_keys!5903 thiss!1248)) (index!4896 lt!95657)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!126600 () Bool)

(assert (=> b!192409 (=> res!90904 e!126600)))

(declare-fun b!192410 () Bool)

(assert (=> b!192410 (and (bvsge (index!4896 lt!95657) #b00000000000000000000000000000000) (bvslt (index!4896 lt!95657) (size!4168 (_keys!5903 thiss!1248))))))

(assert (=> b!192410 (= e!126600 (= (select (arr!3845 (_keys!5903 thiss!1248)) (index!4896 lt!95657)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!192411 () Bool)

(assert (=> b!192411 (and (bvsge (index!4896 lt!95657) #b00000000000000000000000000000000) (bvslt (index!4896 lt!95657) (size!4168 (_keys!5903 thiss!1248))))))

(declare-fun res!90903 () Bool)

(assert (=> b!192411 (= res!90903 (= (select (arr!3845 (_keys!5903 thiss!1248)) (index!4896 lt!95657)) key!828))))

(assert (=> b!192411 (=> res!90903 e!126600)))

(assert (=> b!192411 (= e!126601 e!126600)))

(declare-fun b!192406 () Bool)

(assert (=> b!192406 (= e!126602 e!126604)))

(declare-fun c!34687 () Bool)

(declare-fun lt!95658 () (_ BitVec 64))

(assert (=> b!192406 (= c!34687 (or (= lt!95658 key!828) (= (bvadd lt!95658 lt!95658) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!56365 () Bool)

(assert (=> d!56365 e!126603))

(declare-fun c!34688 () Bool)

(assert (=> d!56365 (= c!34688 (and ((_ is Intermediate!681) lt!95657) (undefined!1493 lt!95657)))))

(assert (=> d!56365 (= lt!95657 e!126602)))

(declare-fun c!34686 () Bool)

(assert (=> d!56365 (= c!34686 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!56365 (= lt!95658 (select (arr!3845 (_keys!5903 thiss!1248)) (toIndex!0 key!828 (mask!9151 thiss!1248))))))

(assert (=> d!56365 (validMask!0 (mask!9151 thiss!1248))))

(assert (=> d!56365 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9151 thiss!1248)) key!828 (_keys!5903 thiss!1248) (mask!9151 thiss!1248)) lt!95657)))

(assert (= (and d!56365 c!34686) b!192407))

(assert (= (and d!56365 (not c!34686)) b!192406))

(assert (= (and b!192406 c!34687) b!192405))

(assert (= (and b!192406 (not c!34687)) b!192403))

(assert (= (and d!56365 c!34688) b!192404))

(assert (= (and d!56365 (not c!34688)) b!192408))

(assert (= (and b!192408 res!90902) b!192411))

(assert (= (and b!192411 (not res!90903)) b!192409))

(assert (= (and b!192409 (not res!90904)) b!192410))

(declare-fun m!219105 () Bool)

(assert (=> b!192411 m!219105))

(assert (=> b!192410 m!219105))

(assert (=> b!192403 m!219065))

(declare-fun m!219107 () Bool)

(assert (=> b!192403 m!219107))

(assert (=> b!192403 m!219107))

(declare-fun m!219109 () Bool)

(assert (=> b!192403 m!219109))

(assert (=> b!192409 m!219105))

(assert (=> d!56365 m!219065))

(declare-fun m!219111 () Bool)

(assert (=> d!56365 m!219111))

(assert (=> d!56365 m!218845))

(assert (=> d!56357 d!56365))

(declare-fun d!56367 () Bool)

(declare-fun lt!95664 () (_ BitVec 32))

(declare-fun lt!95663 () (_ BitVec 32))

(assert (=> d!56367 (= lt!95664 (bvmul (bvxor lt!95663 (bvlshr lt!95663 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!56367 (= lt!95663 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!56367 (and (bvsge (mask!9151 thiss!1248) #b00000000000000000000000000000000) (let ((res!90905 (let ((h!3066 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!20596 (bvmul (bvxor h!3066 (bvlshr h!3066 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!20596 (bvlshr x!20596 #b00000000000000000000000000001101)) (mask!9151 thiss!1248)))))) (and (bvslt res!90905 (bvadd (mask!9151 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!90905 #b00000000000000000000000000000000))))))

(assert (=> d!56367 (= (toIndex!0 key!828 (mask!9151 thiss!1248)) (bvand (bvxor lt!95664 (bvlshr lt!95664 #b00000000000000000000000000001101)) (mask!9151 thiss!1248)))))

(assert (=> d!56357 d!56367))

(assert (=> d!56357 d!56343))

(declare-fun d!56369 () Bool)

(declare-fun e!126605 () Bool)

(assert (=> d!56369 e!126605))

(declare-fun res!90906 () Bool)

(assert (=> d!56369 (=> (not res!90906) (not e!126605))))

(declare-fun lt!95666 () ListLongMap!2453)

(assert (=> d!56369 (= res!90906 (contains!1358 lt!95666 (_1!1779 (ite (or c!34649 c!34648) (tuple2!3537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3762 thiss!1248)) (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248))))))))

(declare-fun lt!95668 () List!2428)

(assert (=> d!56369 (= lt!95666 (ListLongMap!2454 lt!95668))))

(declare-fun lt!95667 () Unit!5811)

(declare-fun lt!95665 () Unit!5811)

(assert (=> d!56369 (= lt!95667 lt!95665)))

(assert (=> d!56369 (= (getValueByKey!240 lt!95668 (_1!1779 (ite (or c!34649 c!34648) (tuple2!3537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3762 thiss!1248)) (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248))))) (Some!245 (_2!1779 (ite (or c!34649 c!34648) (tuple2!3537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3762 thiss!1248)) (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248))))))))

(assert (=> d!56369 (= lt!95665 (lemmaContainsTupThenGetReturnValue!127 lt!95668 (_1!1779 (ite (or c!34649 c!34648) (tuple2!3537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3762 thiss!1248)) (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248)))) (_2!1779 (ite (or c!34649 c!34648) (tuple2!3537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3762 thiss!1248)) (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248))))))))

(assert (=> d!56369 (= lt!95668 (insertStrictlySorted!130 (toList!1242 (ite c!34649 call!19419 (ite c!34648 call!19421 call!19424))) (_1!1779 (ite (or c!34649 c!34648) (tuple2!3537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3762 thiss!1248)) (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248)))) (_2!1779 (ite (or c!34649 c!34648) (tuple2!3537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3762 thiss!1248)) (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248))))))))

(assert (=> d!56369 (= (+!310 (ite c!34649 call!19419 (ite c!34648 call!19421 call!19424)) (ite (or c!34649 c!34648) (tuple2!3537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3762 thiss!1248)) (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248)))) lt!95666)))

(declare-fun b!192412 () Bool)

(declare-fun res!90907 () Bool)

(assert (=> b!192412 (=> (not res!90907) (not e!126605))))

(assert (=> b!192412 (= res!90907 (= (getValueByKey!240 (toList!1242 lt!95666) (_1!1779 (ite (or c!34649 c!34648) (tuple2!3537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3762 thiss!1248)) (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248))))) (Some!245 (_2!1779 (ite (or c!34649 c!34648) (tuple2!3537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3762 thiss!1248)) (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248)))))))))

(declare-fun b!192413 () Bool)

(assert (=> b!192413 (= e!126605 (contains!1359 (toList!1242 lt!95666) (ite (or c!34649 c!34648) (tuple2!3537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3762 thiss!1248)) (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248)))))))

(assert (= (and d!56369 res!90906) b!192412))

(assert (= (and b!192412 res!90907) b!192413))

(declare-fun m!219113 () Bool)

(assert (=> d!56369 m!219113))

(declare-fun m!219115 () Bool)

(assert (=> d!56369 m!219115))

(declare-fun m!219117 () Bool)

(assert (=> d!56369 m!219117))

(declare-fun m!219119 () Bool)

(assert (=> d!56369 m!219119))

(declare-fun m!219121 () Bool)

(assert (=> b!192412 m!219121))

(declare-fun m!219123 () Bool)

(assert (=> b!192413 m!219123))

(assert (=> bm!19421 d!56369))

(declare-fun d!56371 () Bool)

(assert (=> d!56371 (= (validKeyInArray!0 (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!192271 d!56371))

(declare-fun d!56373 () Bool)

(declare-fun e!126607 () Bool)

(assert (=> d!56373 e!126607))

(declare-fun res!90908 () Bool)

(assert (=> d!56373 (=> res!90908 e!126607)))

(declare-fun lt!95670 () Bool)

(assert (=> d!56373 (= res!90908 (not lt!95670))))

(declare-fun lt!95672 () Bool)

(assert (=> d!56373 (= lt!95670 lt!95672)))

(declare-fun lt!95671 () Unit!5811)

(declare-fun e!126606 () Unit!5811)

(assert (=> d!56373 (= lt!95671 e!126606)))

(declare-fun c!34689 () Bool)

(assert (=> d!56373 (= c!34689 lt!95672)))

(assert (=> d!56373 (= lt!95672 (containsKey!244 (toList!1242 lt!95517) (_1!1779 (tuple2!3537 key!828 v!309))))))

(assert (=> d!56373 (= (contains!1358 lt!95517 (_1!1779 (tuple2!3537 key!828 v!309))) lt!95670)))

(declare-fun b!192414 () Bool)

(declare-fun lt!95669 () Unit!5811)

(assert (=> b!192414 (= e!126606 lt!95669)))

(assert (=> b!192414 (= lt!95669 (lemmaContainsKeyImpliesGetValueByKeyDefined!192 (toList!1242 lt!95517) (_1!1779 (tuple2!3537 key!828 v!309))))))

(assert (=> b!192414 (isDefined!193 (getValueByKey!240 (toList!1242 lt!95517) (_1!1779 (tuple2!3537 key!828 v!309))))))

(declare-fun b!192415 () Bool)

(declare-fun Unit!5820 () Unit!5811)

(assert (=> b!192415 (= e!126606 Unit!5820)))

(declare-fun b!192416 () Bool)

(assert (=> b!192416 (= e!126607 (isDefined!193 (getValueByKey!240 (toList!1242 lt!95517) (_1!1779 (tuple2!3537 key!828 v!309)))))))

(assert (= (and d!56373 c!34689) b!192414))

(assert (= (and d!56373 (not c!34689)) b!192415))

(assert (= (and d!56373 (not res!90908)) b!192416))

(declare-fun m!219125 () Bool)

(assert (=> d!56373 m!219125))

(declare-fun m!219127 () Bool)

(assert (=> b!192414 m!219127))

(assert (=> b!192414 m!218935))

(assert (=> b!192414 m!218935))

(declare-fun m!219129 () Bool)

(assert (=> b!192414 m!219129))

(assert (=> b!192416 m!218935))

(assert (=> b!192416 m!218935))

(assert (=> b!192416 m!219129))

(assert (=> d!56341 d!56373))

(declare-fun d!56375 () Bool)

(declare-fun c!34694 () Bool)

(assert (=> d!56375 (= c!34694 (and ((_ is Cons!2424) lt!95519) (= (_1!1779 (h!3064 lt!95519)) (_1!1779 (tuple2!3537 key!828 v!309)))))))

(declare-fun e!126612 () Option!246)

(assert (=> d!56375 (= (getValueByKey!240 lt!95519 (_1!1779 (tuple2!3537 key!828 v!309))) e!126612)))

(declare-fun b!192428 () Bool)

(declare-fun e!126613 () Option!246)

(assert (=> b!192428 (= e!126613 None!244)))

(declare-fun b!192425 () Bool)

(assert (=> b!192425 (= e!126612 (Some!245 (_2!1779 (h!3064 lt!95519))))))

(declare-fun b!192426 () Bool)

(assert (=> b!192426 (= e!126612 e!126613)))

(declare-fun c!34695 () Bool)

(assert (=> b!192426 (= c!34695 (and ((_ is Cons!2424) lt!95519) (not (= (_1!1779 (h!3064 lt!95519)) (_1!1779 (tuple2!3537 key!828 v!309))))))))

(declare-fun b!192427 () Bool)

(assert (=> b!192427 (= e!126613 (getValueByKey!240 (t!7344 lt!95519) (_1!1779 (tuple2!3537 key!828 v!309))))))

(assert (= (and d!56375 c!34694) b!192425))

(assert (= (and d!56375 (not c!34694)) b!192426))

(assert (= (and b!192426 c!34695) b!192427))

(assert (= (and b!192426 (not c!34695)) b!192428))

(declare-fun m!219131 () Bool)

(assert (=> b!192427 m!219131))

(assert (=> d!56341 d!56375))

(declare-fun d!56377 () Bool)

(assert (=> d!56377 (= (getValueByKey!240 lt!95519 (_1!1779 (tuple2!3537 key!828 v!309))) (Some!245 (_2!1779 (tuple2!3537 key!828 v!309))))))

(declare-fun lt!95675 () Unit!5811)

(declare-fun choose!1047 (List!2428 (_ BitVec 64) V!5595) Unit!5811)

(assert (=> d!56377 (= lt!95675 (choose!1047 lt!95519 (_1!1779 (tuple2!3537 key!828 v!309)) (_2!1779 (tuple2!3537 key!828 v!309))))))

(declare-fun e!126616 () Bool)

(assert (=> d!56377 e!126616))

(declare-fun res!90913 () Bool)

(assert (=> d!56377 (=> (not res!90913) (not e!126616))))

(declare-fun isStrictlySorted!356 (List!2428) Bool)

(assert (=> d!56377 (= res!90913 (isStrictlySorted!356 lt!95519))))

(assert (=> d!56377 (= (lemmaContainsTupThenGetReturnValue!127 lt!95519 (_1!1779 (tuple2!3537 key!828 v!309)) (_2!1779 (tuple2!3537 key!828 v!309))) lt!95675)))

(declare-fun b!192433 () Bool)

(declare-fun res!90914 () Bool)

(assert (=> b!192433 (=> (not res!90914) (not e!126616))))

(assert (=> b!192433 (= res!90914 (containsKey!244 lt!95519 (_1!1779 (tuple2!3537 key!828 v!309))))))

(declare-fun b!192434 () Bool)

(assert (=> b!192434 (= e!126616 (contains!1359 lt!95519 (tuple2!3537 (_1!1779 (tuple2!3537 key!828 v!309)) (_2!1779 (tuple2!3537 key!828 v!309)))))))

(assert (= (and d!56377 res!90913) b!192433))

(assert (= (and b!192433 res!90914) b!192434))

(assert (=> d!56377 m!218929))

(declare-fun m!219133 () Bool)

(assert (=> d!56377 m!219133))

(declare-fun m!219135 () Bool)

(assert (=> d!56377 m!219135))

(declare-fun m!219137 () Bool)

(assert (=> b!192433 m!219137))

(declare-fun m!219139 () Bool)

(assert (=> b!192434 m!219139))

(assert (=> d!56341 d!56377))

(declare-fun e!126627 () List!2428)

(declare-fun b!192455 () Bool)

(assert (=> b!192455 (= e!126627 (insertStrictlySorted!130 (t!7344 (toList!1242 lt!95476)) (_1!1779 (tuple2!3537 key!828 v!309)) (_2!1779 (tuple2!3537 key!828 v!309))))))

(declare-fun b!192456 () Bool)

(declare-fun e!126628 () List!2428)

(declare-fun call!19436 () List!2428)

(assert (=> b!192456 (= e!126628 call!19436)))

(declare-fun b!192457 () Bool)

(declare-fun e!126629 () List!2428)

(declare-fun e!126631 () List!2428)

(assert (=> b!192457 (= e!126629 e!126631)))

(declare-fun c!34705 () Bool)

(assert (=> b!192457 (= c!34705 (and ((_ is Cons!2424) (toList!1242 lt!95476)) (= (_1!1779 (h!3064 (toList!1242 lt!95476))) (_1!1779 (tuple2!3537 key!828 v!309)))))))

(declare-fun d!56379 () Bool)

(declare-fun e!126630 () Bool)

(assert (=> d!56379 e!126630))

(declare-fun res!90919 () Bool)

(assert (=> d!56379 (=> (not res!90919) (not e!126630))))

(declare-fun lt!95678 () List!2428)

(assert (=> d!56379 (= res!90919 (isStrictlySorted!356 lt!95678))))

(assert (=> d!56379 (= lt!95678 e!126629)))

(declare-fun c!34704 () Bool)

(assert (=> d!56379 (= c!34704 (and ((_ is Cons!2424) (toList!1242 lt!95476)) (bvslt (_1!1779 (h!3064 (toList!1242 lt!95476))) (_1!1779 (tuple2!3537 key!828 v!309)))))))

(assert (=> d!56379 (isStrictlySorted!356 (toList!1242 lt!95476))))

(assert (=> d!56379 (= (insertStrictlySorted!130 (toList!1242 lt!95476) (_1!1779 (tuple2!3537 key!828 v!309)) (_2!1779 (tuple2!3537 key!828 v!309))) lt!95678)))

(declare-fun b!192458 () Bool)

(assert (=> b!192458 (= e!126628 call!19436)))

(declare-fun c!34707 () Bool)

(declare-fun b!192459 () Bool)

(assert (=> b!192459 (= e!126627 (ite c!34705 (t!7344 (toList!1242 lt!95476)) (ite c!34707 (Cons!2424 (h!3064 (toList!1242 lt!95476)) (t!7344 (toList!1242 lt!95476))) Nil!2425)))))

(declare-fun b!192460 () Bool)

(declare-fun call!19435 () List!2428)

(assert (=> b!192460 (= e!126629 call!19435)))

(declare-fun b!192461 () Bool)

(assert (=> b!192461 (= c!34707 (and ((_ is Cons!2424) (toList!1242 lt!95476)) (bvsgt (_1!1779 (h!3064 (toList!1242 lt!95476))) (_1!1779 (tuple2!3537 key!828 v!309)))))))

(assert (=> b!192461 (= e!126631 e!126628)))

(declare-fun b!192462 () Bool)

(declare-fun call!19434 () List!2428)

(assert (=> b!192462 (= e!126631 call!19434)))

(declare-fun bm!19431 () Bool)

(assert (=> bm!19431 (= call!19434 call!19435)))

(declare-fun b!192463 () Bool)

(assert (=> b!192463 (= e!126630 (contains!1359 lt!95678 (tuple2!3537 (_1!1779 (tuple2!3537 key!828 v!309)) (_2!1779 (tuple2!3537 key!828 v!309)))))))

(declare-fun b!192464 () Bool)

(declare-fun res!90920 () Bool)

(assert (=> b!192464 (=> (not res!90920) (not e!126630))))

(assert (=> b!192464 (= res!90920 (containsKey!244 lt!95678 (_1!1779 (tuple2!3537 key!828 v!309))))))

(declare-fun bm!19432 () Bool)

(declare-fun $colon$colon!102 (List!2428 tuple2!3536) List!2428)

(assert (=> bm!19432 (= call!19435 ($colon$colon!102 e!126627 (ite c!34704 (h!3064 (toList!1242 lt!95476)) (tuple2!3537 (_1!1779 (tuple2!3537 key!828 v!309)) (_2!1779 (tuple2!3537 key!828 v!309))))))))

(declare-fun c!34706 () Bool)

(assert (=> bm!19432 (= c!34706 c!34704)))

(declare-fun bm!19433 () Bool)

(assert (=> bm!19433 (= call!19436 call!19434)))

(assert (= (and d!56379 c!34704) b!192460))

(assert (= (and d!56379 (not c!34704)) b!192457))

(assert (= (and b!192457 c!34705) b!192462))

(assert (= (and b!192457 (not c!34705)) b!192461))

(assert (= (and b!192461 c!34707) b!192458))

(assert (= (and b!192461 (not c!34707)) b!192456))

(assert (= (or b!192458 b!192456) bm!19433))

(assert (= (or b!192462 bm!19433) bm!19431))

(assert (= (or b!192460 bm!19431) bm!19432))

(assert (= (and bm!19432 c!34706) b!192455))

(assert (= (and bm!19432 (not c!34706)) b!192459))

(assert (= (and d!56379 res!90919) b!192464))

(assert (= (and b!192464 res!90920) b!192463))

(declare-fun m!219141 () Bool)

(assert (=> bm!19432 m!219141))

(declare-fun m!219143 () Bool)

(assert (=> b!192455 m!219143))

(declare-fun m!219145 () Bool)

(assert (=> b!192463 m!219145))

(declare-fun m!219147 () Bool)

(assert (=> d!56379 m!219147))

(declare-fun m!219149 () Bool)

(assert (=> d!56379 m!219149))

(declare-fun m!219151 () Bool)

(assert (=> b!192464 m!219151))

(assert (=> d!56341 d!56379))

(declare-fun d!56381 () Bool)

(declare-fun e!126633 () Bool)

(assert (=> d!56381 e!126633))

(declare-fun res!90921 () Bool)

(assert (=> d!56381 (=> res!90921 e!126633)))

(declare-fun lt!95680 () Bool)

(assert (=> d!56381 (= res!90921 (not lt!95680))))

(declare-fun lt!95682 () Bool)

(assert (=> d!56381 (= lt!95680 lt!95682)))

(declare-fun lt!95681 () Unit!5811)

(declare-fun e!126632 () Unit!5811)

(assert (=> d!56381 (= lt!95681 e!126632)))

(declare-fun c!34708 () Bool)

(assert (=> d!56381 (= c!34708 lt!95682)))

(assert (=> d!56381 (= lt!95682 (containsKey!244 (toList!1242 lt!95596) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56381 (= (contains!1358 lt!95596 #b1000000000000000000000000000000000000000000000000000000000000000) lt!95680)))

(declare-fun b!192465 () Bool)

(declare-fun lt!95679 () Unit!5811)

(assert (=> b!192465 (= e!126632 lt!95679)))

(assert (=> b!192465 (= lt!95679 (lemmaContainsKeyImpliesGetValueByKeyDefined!192 (toList!1242 lt!95596) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!192465 (isDefined!193 (getValueByKey!240 (toList!1242 lt!95596) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!192466 () Bool)

(declare-fun Unit!5821 () Unit!5811)

(assert (=> b!192466 (= e!126632 Unit!5821)))

(declare-fun b!192467 () Bool)

(assert (=> b!192467 (= e!126633 (isDefined!193 (getValueByKey!240 (toList!1242 lt!95596) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56381 c!34708) b!192465))

(assert (= (and d!56381 (not c!34708)) b!192466))

(assert (= (and d!56381 (not res!90921)) b!192467))

(declare-fun m!219153 () Bool)

(assert (=> d!56381 m!219153))

(declare-fun m!219155 () Bool)

(assert (=> b!192465 m!219155))

(declare-fun m!219157 () Bool)

(assert (=> b!192465 m!219157))

(assert (=> b!192465 m!219157))

(declare-fun m!219159 () Bool)

(assert (=> b!192465 m!219159))

(assert (=> b!192467 m!219157))

(assert (=> b!192467 m!219157))

(assert (=> b!192467 m!219159))

(assert (=> bm!19420 d!56381))

(declare-fun d!56383 () Bool)

(declare-fun res!90926 () Bool)

(declare-fun e!126638 () Bool)

(assert (=> d!56383 (=> res!90926 e!126638)))

(assert (=> d!56383 (= res!90926 (and ((_ is Cons!2424) (toList!1242 lt!95476)) (= (_1!1779 (h!3064 (toList!1242 lt!95476))) key!828)))))

(assert (=> d!56383 (= (containsKey!244 (toList!1242 lt!95476) key!828) e!126638)))

(declare-fun b!192472 () Bool)

(declare-fun e!126639 () Bool)

(assert (=> b!192472 (= e!126638 e!126639)))

(declare-fun res!90927 () Bool)

(assert (=> b!192472 (=> (not res!90927) (not e!126639))))

(assert (=> b!192472 (= res!90927 (and (or (not ((_ is Cons!2424) (toList!1242 lt!95476))) (bvsle (_1!1779 (h!3064 (toList!1242 lt!95476))) key!828)) ((_ is Cons!2424) (toList!1242 lt!95476)) (bvslt (_1!1779 (h!3064 (toList!1242 lt!95476))) key!828)))))

(declare-fun b!192473 () Bool)

(assert (=> b!192473 (= e!126639 (containsKey!244 (t!7344 (toList!1242 lt!95476)) key!828))))

(assert (= (and d!56383 (not res!90926)) b!192472))

(assert (= (and b!192472 res!90927) b!192473))

(declare-fun m!219161 () Bool)

(assert (=> b!192473 m!219161))

(assert (=> d!56349 d!56383))

(declare-fun d!56385 () Bool)

(assert (=> d!56385 (= (apply!183 lt!95574 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2220 (getValueByKey!240 (toList!1242 lt!95574) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7690 () Bool)

(assert (= bs!7690 d!56385))

(declare-fun m!219163 () Bool)

(assert (=> bs!7690 m!219163))

(assert (=> bs!7690 m!219163))

(declare-fun m!219165 () Bool)

(assert (=> bs!7690 m!219165))

(assert (=> b!192269 d!56385))

(declare-fun c!34709 () Bool)

(declare-fun d!56387 () Bool)

(assert (=> d!56387 (= c!34709 (and ((_ is Cons!2424) (toList!1242 lt!95517)) (= (_1!1779 (h!3064 (toList!1242 lt!95517))) (_1!1779 (tuple2!3537 key!828 v!309)))))))

(declare-fun e!126640 () Option!246)

(assert (=> d!56387 (= (getValueByKey!240 (toList!1242 lt!95517) (_1!1779 (tuple2!3537 key!828 v!309))) e!126640)))

(declare-fun b!192477 () Bool)

(declare-fun e!126641 () Option!246)

(assert (=> b!192477 (= e!126641 None!244)))

(declare-fun b!192474 () Bool)

(assert (=> b!192474 (= e!126640 (Some!245 (_2!1779 (h!3064 (toList!1242 lt!95517)))))))

(declare-fun b!192475 () Bool)

(assert (=> b!192475 (= e!126640 e!126641)))

(declare-fun c!34710 () Bool)

(assert (=> b!192475 (= c!34710 (and ((_ is Cons!2424) (toList!1242 lt!95517)) (not (= (_1!1779 (h!3064 (toList!1242 lt!95517))) (_1!1779 (tuple2!3537 key!828 v!309))))))))

(declare-fun b!192476 () Bool)

(assert (=> b!192476 (= e!126641 (getValueByKey!240 (t!7344 (toList!1242 lt!95517)) (_1!1779 (tuple2!3537 key!828 v!309))))))

(assert (= (and d!56387 c!34709) b!192474))

(assert (= (and d!56387 (not c!34709)) b!192475))

(assert (= (and b!192475 c!34710) b!192476))

(assert (= (and b!192475 (not c!34710)) b!192477))

(declare-fun m!219167 () Bool)

(assert (=> b!192476 m!219167))

(assert (=> b!192217 d!56387))

(declare-fun d!56389 () Bool)

(assert (=> d!56389 (= (apply!183 lt!95596 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2220 (getValueByKey!240 (toList!1242 lt!95596) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7691 () Bool)

(assert (= bs!7691 d!56389))

(assert (=> bs!7691 m!219157))

(assert (=> bs!7691 m!219157))

(declare-fun m!219169 () Bool)

(assert (=> bs!7691 m!219169))

(assert (=> b!192291 d!56389))

(declare-fun b!192488 () Bool)

(declare-fun e!126652 () Bool)

(declare-fun e!126651 () Bool)

(assert (=> b!192488 (= e!126652 e!126651)))

(declare-fun c!34713 () Bool)

(assert (=> b!192488 (= c!34713 (validKeyInArray!0 (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!56391 () Bool)

(declare-fun res!90934 () Bool)

(declare-fun e!126650 () Bool)

(assert (=> d!56391 (=> res!90934 e!126650)))

(assert (=> d!56391 (= res!90934 (bvsge #b00000000000000000000000000000000 (size!4168 (_keys!5903 thiss!1248))))))

(assert (=> d!56391 (= (arrayNoDuplicates!0 (_keys!5903 thiss!1248) #b00000000000000000000000000000000 Nil!2426) e!126650)))

(declare-fun b!192489 () Bool)

(declare-fun e!126653 () Bool)

(declare-fun contains!1360 (List!2429 (_ BitVec 64)) Bool)

(assert (=> b!192489 (= e!126653 (contains!1360 Nil!2426 (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!192490 () Bool)

(assert (=> b!192490 (= e!126650 e!126652)))

(declare-fun res!90935 () Bool)

(assert (=> b!192490 (=> (not res!90935) (not e!126652))))

(assert (=> b!192490 (= res!90935 (not e!126653))))

(declare-fun res!90936 () Bool)

(assert (=> b!192490 (=> (not res!90936) (not e!126653))))

(assert (=> b!192490 (= res!90936 (validKeyInArray!0 (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!192491 () Bool)

(declare-fun call!19439 () Bool)

(assert (=> b!192491 (= e!126651 call!19439)))

(declare-fun b!192492 () Bool)

(assert (=> b!192492 (= e!126651 call!19439)))

(declare-fun bm!19436 () Bool)

(assert (=> bm!19436 (= call!19439 (arrayNoDuplicates!0 (_keys!5903 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!34713 (Cons!2425 (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000) Nil!2426) Nil!2426)))))

(assert (= (and d!56391 (not res!90934)) b!192490))

(assert (= (and b!192490 res!90936) b!192489))

(assert (= (and b!192490 res!90935) b!192488))

(assert (= (and b!192488 c!34713) b!192491))

(assert (= (and b!192488 (not c!34713)) b!192492))

(assert (= (or b!192491 b!192492) bm!19436))

(assert (=> b!192488 m!218945))

(assert (=> b!192488 m!218945))

(assert (=> b!192488 m!218985))

(assert (=> b!192489 m!218945))

(assert (=> b!192489 m!218945))

(declare-fun m!219171 () Bool)

(assert (=> b!192489 m!219171))

(assert (=> b!192490 m!218945))

(assert (=> b!192490 m!218945))

(assert (=> b!192490 m!218985))

(assert (=> bm!19436 m!218945))

(declare-fun m!219173 () Bool)

(assert (=> bm!19436 m!219173))

(assert (=> b!192206 d!56391))

(declare-fun b!192501 () Bool)

(declare-fun e!126660 () Bool)

(declare-fun e!126661 () Bool)

(assert (=> b!192501 (= e!126660 e!126661)))

(declare-fun lt!95689 () (_ BitVec 64))

(assert (=> b!192501 (= lt!95689 (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95690 () Unit!5811)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8163 (_ BitVec 64) (_ BitVec 32)) Unit!5811)

(assert (=> b!192501 (= lt!95690 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5903 thiss!1248) lt!95689 #b00000000000000000000000000000000))))

(assert (=> b!192501 (arrayContainsKey!0 (_keys!5903 thiss!1248) lt!95689 #b00000000000000000000000000000000)))

(declare-fun lt!95691 () Unit!5811)

(assert (=> b!192501 (= lt!95691 lt!95690)))

(declare-fun res!90942 () Bool)

(assert (=> b!192501 (= res!90942 (= (seekEntryOrOpen!0 (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000) (_keys!5903 thiss!1248) (mask!9151 thiss!1248)) (Found!681 #b00000000000000000000000000000000)))))

(assert (=> b!192501 (=> (not res!90942) (not e!126661))))

(declare-fun b!192502 () Bool)

(declare-fun call!19442 () Bool)

(assert (=> b!192502 (= e!126660 call!19442)))

(declare-fun d!56393 () Bool)

(declare-fun res!90941 () Bool)

(declare-fun e!126662 () Bool)

(assert (=> d!56393 (=> res!90941 e!126662)))

(assert (=> d!56393 (= res!90941 (bvsge #b00000000000000000000000000000000 (size!4168 (_keys!5903 thiss!1248))))))

(assert (=> d!56393 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5903 thiss!1248) (mask!9151 thiss!1248)) e!126662)))

(declare-fun b!192503 () Bool)

(assert (=> b!192503 (= e!126662 e!126660)))

(declare-fun c!34716 () Bool)

(assert (=> b!192503 (= c!34716 (validKeyInArray!0 (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!192504 () Bool)

(assert (=> b!192504 (= e!126661 call!19442)))

(declare-fun bm!19439 () Bool)

(assert (=> bm!19439 (= call!19442 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5903 thiss!1248) (mask!9151 thiss!1248)))))

(assert (= (and d!56393 (not res!90941)) b!192503))

(assert (= (and b!192503 c!34716) b!192501))

(assert (= (and b!192503 (not c!34716)) b!192502))

(assert (= (and b!192501 res!90942) b!192504))

(assert (= (or b!192504 b!192502) bm!19439))

(assert (=> b!192501 m!218945))

(declare-fun m!219175 () Bool)

(assert (=> b!192501 m!219175))

(declare-fun m!219177 () Bool)

(assert (=> b!192501 m!219177))

(assert (=> b!192501 m!218945))

(declare-fun m!219179 () Bool)

(assert (=> b!192501 m!219179))

(assert (=> b!192503 m!218945))

(assert (=> b!192503 m!218945))

(assert (=> b!192503 m!218985))

(declare-fun m!219181 () Bool)

(assert (=> bm!19439 m!219181))

(assert (=> b!192205 d!56393))

(declare-fun d!56395 () Bool)

(declare-fun e!126663 () Bool)

(assert (=> d!56395 e!126663))

(declare-fun res!90943 () Bool)

(assert (=> d!56395 (=> (not res!90943) (not e!126663))))

(declare-fun lt!95693 () ListLongMap!2453)

(assert (=> d!56395 (= res!90943 (contains!1358 lt!95693 (_1!1779 (tuple2!3537 key!828 v!309))))))

(declare-fun lt!95695 () List!2428)

(assert (=> d!56395 (= lt!95693 (ListLongMap!2454 lt!95695))))

(declare-fun lt!95694 () Unit!5811)

(declare-fun lt!95692 () Unit!5811)

(assert (=> d!56395 (= lt!95694 lt!95692)))

(assert (=> d!56395 (= (getValueByKey!240 lt!95695 (_1!1779 (tuple2!3537 key!828 v!309))) (Some!245 (_2!1779 (tuple2!3537 key!828 v!309))))))

(assert (=> d!56395 (= lt!95692 (lemmaContainsTupThenGetReturnValue!127 lt!95695 (_1!1779 (tuple2!3537 key!828 v!309)) (_2!1779 (tuple2!3537 key!828 v!309))))))

(assert (=> d!56395 (= lt!95695 (insertStrictlySorted!130 (toList!1242 (getCurrentListMap!890 (_keys!5903 thiss!1248) (_values!3904 thiss!1248) (mask!9151 thiss!1248) (extraKeys!3658 thiss!1248) (zeroValue!3762 thiss!1248) (minValue!3762 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3921 thiss!1248))) (_1!1779 (tuple2!3537 key!828 v!309)) (_2!1779 (tuple2!3537 key!828 v!309))))))

(assert (=> d!56395 (= (+!310 (getCurrentListMap!890 (_keys!5903 thiss!1248) (_values!3904 thiss!1248) (mask!9151 thiss!1248) (extraKeys!3658 thiss!1248) (zeroValue!3762 thiss!1248) (minValue!3762 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3921 thiss!1248)) (tuple2!3537 key!828 v!309)) lt!95693)))

(declare-fun b!192505 () Bool)

(declare-fun res!90944 () Bool)

(assert (=> b!192505 (=> (not res!90944) (not e!126663))))

(assert (=> b!192505 (= res!90944 (= (getValueByKey!240 (toList!1242 lt!95693) (_1!1779 (tuple2!3537 key!828 v!309))) (Some!245 (_2!1779 (tuple2!3537 key!828 v!309)))))))

(declare-fun b!192506 () Bool)

(assert (=> b!192506 (= e!126663 (contains!1359 (toList!1242 lt!95693) (tuple2!3537 key!828 v!309)))))

(assert (= (and d!56395 res!90943) b!192505))

(assert (= (and b!192505 res!90944) b!192506))

(declare-fun m!219183 () Bool)

(assert (=> d!56395 m!219183))

(declare-fun m!219185 () Bool)

(assert (=> d!56395 m!219185))

(declare-fun m!219187 () Bool)

(assert (=> d!56395 m!219187))

(declare-fun m!219189 () Bool)

(assert (=> d!56395 m!219189))

(declare-fun m!219191 () Bool)

(assert (=> b!192505 m!219191))

(declare-fun m!219193 () Bool)

(assert (=> b!192506 m!219193))

(assert (=> b!192316 d!56395))

(assert (=> b!192316 d!56345))

(assert (=> b!192316 d!56347))

(assert (=> d!56345 d!56343))

(assert (=> d!56347 d!56343))

(declare-fun d!56397 () Bool)

(declare-fun e!126665 () Bool)

(assert (=> d!56397 e!126665))

(declare-fun res!90945 () Bool)

(assert (=> d!56397 (=> res!90945 e!126665)))

(declare-fun lt!95697 () Bool)

(assert (=> d!56397 (= res!90945 (not lt!95697))))

(declare-fun lt!95699 () Bool)

(assert (=> d!56397 (= lt!95697 lt!95699)))

(declare-fun lt!95698 () Unit!5811)

(declare-fun e!126664 () Unit!5811)

(assert (=> d!56397 (= lt!95698 e!126664)))

(declare-fun c!34717 () Bool)

(assert (=> d!56397 (= c!34717 lt!95699)))

(assert (=> d!56397 (= lt!95699 (containsKey!244 (toList!1242 lt!95596) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56397 (= (contains!1358 lt!95596 #b0000000000000000000000000000000000000000000000000000000000000000) lt!95697)))

(declare-fun b!192507 () Bool)

(declare-fun lt!95696 () Unit!5811)

(assert (=> b!192507 (= e!126664 lt!95696)))

(assert (=> b!192507 (= lt!95696 (lemmaContainsKeyImpliesGetValueByKeyDefined!192 (toList!1242 lt!95596) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!192507 (isDefined!193 (getValueByKey!240 (toList!1242 lt!95596) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!192508 () Bool)

(declare-fun Unit!5822 () Unit!5811)

(assert (=> b!192508 (= e!126664 Unit!5822)))

(declare-fun b!192509 () Bool)

(assert (=> b!192509 (= e!126665 (isDefined!193 (getValueByKey!240 (toList!1242 lt!95596) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56397 c!34717) b!192507))

(assert (= (and d!56397 (not c!34717)) b!192508))

(assert (= (and d!56397 (not res!90945)) b!192509))

(declare-fun m!219195 () Bool)

(assert (=> d!56397 m!219195))

(declare-fun m!219197 () Bool)

(assert (=> b!192507 m!219197))

(declare-fun m!219199 () Bool)

(assert (=> b!192507 m!219199))

(assert (=> b!192507 m!219199))

(declare-fun m!219201 () Bool)

(assert (=> b!192507 m!219201))

(assert (=> b!192509 m!219199))

(assert (=> b!192509 m!219199))

(assert (=> b!192509 m!219201))

(assert (=> bm!19415 d!56397))

(declare-fun bm!19442 () Bool)

(declare-fun call!19445 () (_ BitVec 32))

(assert (=> bm!19442 (= call!19445 (arrayCountValidKeys!0 (_keys!5903 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4168 (_keys!5903 thiss!1248))))))

(declare-fun d!56399 () Bool)

(declare-fun lt!95702 () (_ BitVec 32))

(assert (=> d!56399 (and (bvsge lt!95702 #b00000000000000000000000000000000) (bvsle lt!95702 (bvsub (size!4168 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!126670 () (_ BitVec 32))

(assert (=> d!56399 (= lt!95702 e!126670)))

(declare-fun c!34723 () Bool)

(assert (=> d!56399 (= c!34723 (bvsge #b00000000000000000000000000000000 (size!4168 (_keys!5903 thiss!1248))))))

(assert (=> d!56399 (and (bvsle #b00000000000000000000000000000000 (size!4168 (_keys!5903 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!4168 (_keys!5903 thiss!1248)) (size!4168 (_keys!5903 thiss!1248))))))

(assert (=> d!56399 (= (arrayCountValidKeys!0 (_keys!5903 thiss!1248) #b00000000000000000000000000000000 (size!4168 (_keys!5903 thiss!1248))) lt!95702)))

(declare-fun b!192518 () Bool)

(declare-fun e!126671 () (_ BitVec 32))

(assert (=> b!192518 (= e!126670 e!126671)))

(declare-fun c!34722 () Bool)

(assert (=> b!192518 (= c!34722 (validKeyInArray!0 (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!192519 () Bool)

(assert (=> b!192519 (= e!126671 call!19445)))

(declare-fun b!192520 () Bool)

(assert (=> b!192520 (= e!126670 #b00000000000000000000000000000000)))

(declare-fun b!192521 () Bool)

(assert (=> b!192521 (= e!126671 (bvadd #b00000000000000000000000000000001 call!19445))))

(assert (= (and d!56399 c!34723) b!192520))

(assert (= (and d!56399 (not c!34723)) b!192518))

(assert (= (and b!192518 c!34722) b!192521))

(assert (= (and b!192518 (not c!34722)) b!192519))

(assert (= (or b!192521 b!192519) bm!19442))

(declare-fun m!219203 () Bool)

(assert (=> bm!19442 m!219203))

(assert (=> b!192518 m!218945))

(assert (=> b!192518 m!218945))

(assert (=> b!192518 m!218985))

(assert (=> b!192204 d!56399))

(declare-fun d!56401 () Bool)

(assert (=> d!56401 (= (apply!183 (+!310 lt!95599 (tuple2!3537 lt!95589 (minValue!3762 thiss!1248))) lt!95590) (get!2220 (getValueByKey!240 (toList!1242 (+!310 lt!95599 (tuple2!3537 lt!95589 (minValue!3762 thiss!1248)))) lt!95590)))))

(declare-fun bs!7692 () Bool)

(assert (= bs!7692 d!56401))

(declare-fun m!219205 () Bool)

(assert (=> bs!7692 m!219205))

(assert (=> bs!7692 m!219205))

(declare-fun m!219207 () Bool)

(assert (=> bs!7692 m!219207))

(assert (=> b!192289 d!56401))

(declare-fun d!56403 () Bool)

(assert (=> d!56403 (= (apply!183 lt!95595 lt!95601) (get!2220 (getValueByKey!240 (toList!1242 lt!95595) lt!95601)))))

(declare-fun bs!7693 () Bool)

(assert (= bs!7693 d!56403))

(declare-fun m!219209 () Bool)

(assert (=> bs!7693 m!219209))

(assert (=> bs!7693 m!219209))

(declare-fun m!219211 () Bool)

(assert (=> bs!7693 m!219211))

(assert (=> b!192289 d!56403))

(declare-fun d!56405 () Bool)

(declare-fun e!126672 () Bool)

(assert (=> d!56405 e!126672))

(declare-fun res!90946 () Bool)

(assert (=> d!56405 (=> (not res!90946) (not e!126672))))

(declare-fun lt!95704 () ListLongMap!2453)

(assert (=> d!56405 (= res!90946 (contains!1358 lt!95704 (_1!1779 (tuple2!3537 lt!95591 (zeroValue!3762 thiss!1248)))))))

(declare-fun lt!95706 () List!2428)

(assert (=> d!56405 (= lt!95704 (ListLongMap!2454 lt!95706))))

(declare-fun lt!95705 () Unit!5811)

(declare-fun lt!95703 () Unit!5811)

(assert (=> d!56405 (= lt!95705 lt!95703)))

(assert (=> d!56405 (= (getValueByKey!240 lt!95706 (_1!1779 (tuple2!3537 lt!95591 (zeroValue!3762 thiss!1248)))) (Some!245 (_2!1779 (tuple2!3537 lt!95591 (zeroValue!3762 thiss!1248)))))))

(assert (=> d!56405 (= lt!95703 (lemmaContainsTupThenGetReturnValue!127 lt!95706 (_1!1779 (tuple2!3537 lt!95591 (zeroValue!3762 thiss!1248))) (_2!1779 (tuple2!3537 lt!95591 (zeroValue!3762 thiss!1248)))))))

(assert (=> d!56405 (= lt!95706 (insertStrictlySorted!130 (toList!1242 lt!95604) (_1!1779 (tuple2!3537 lt!95591 (zeroValue!3762 thiss!1248))) (_2!1779 (tuple2!3537 lt!95591 (zeroValue!3762 thiss!1248)))))))

(assert (=> d!56405 (= (+!310 lt!95604 (tuple2!3537 lt!95591 (zeroValue!3762 thiss!1248))) lt!95704)))

(declare-fun b!192522 () Bool)

(declare-fun res!90947 () Bool)

(assert (=> b!192522 (=> (not res!90947) (not e!126672))))

(assert (=> b!192522 (= res!90947 (= (getValueByKey!240 (toList!1242 lt!95704) (_1!1779 (tuple2!3537 lt!95591 (zeroValue!3762 thiss!1248)))) (Some!245 (_2!1779 (tuple2!3537 lt!95591 (zeroValue!3762 thiss!1248))))))))

(declare-fun b!192523 () Bool)

(assert (=> b!192523 (= e!126672 (contains!1359 (toList!1242 lt!95704) (tuple2!3537 lt!95591 (zeroValue!3762 thiss!1248))))))

(assert (= (and d!56405 res!90946) b!192522))

(assert (= (and b!192522 res!90947) b!192523))

(declare-fun m!219213 () Bool)

(assert (=> d!56405 m!219213))

(declare-fun m!219215 () Bool)

(assert (=> d!56405 m!219215))

(declare-fun m!219217 () Bool)

(assert (=> d!56405 m!219217))

(declare-fun m!219219 () Bool)

(assert (=> d!56405 m!219219))

(declare-fun m!219221 () Bool)

(assert (=> b!192522 m!219221))

(declare-fun m!219223 () Bool)

(assert (=> b!192523 m!219223))

(assert (=> b!192289 d!56405))

(declare-fun d!56407 () Bool)

(assert (=> d!56407 (= (apply!183 (+!310 lt!95599 (tuple2!3537 lt!95589 (minValue!3762 thiss!1248))) lt!95590) (apply!183 lt!95599 lt!95590))))

(declare-fun lt!95709 () Unit!5811)

(declare-fun choose!1048 (ListLongMap!2453 (_ BitVec 64) V!5595 (_ BitVec 64)) Unit!5811)

(assert (=> d!56407 (= lt!95709 (choose!1048 lt!95599 lt!95589 (minValue!3762 thiss!1248) lt!95590))))

(declare-fun e!126675 () Bool)

(assert (=> d!56407 e!126675))

(declare-fun res!90950 () Bool)

(assert (=> d!56407 (=> (not res!90950) (not e!126675))))

(assert (=> d!56407 (= res!90950 (contains!1358 lt!95599 lt!95590))))

(assert (=> d!56407 (= (addApplyDifferent!159 lt!95599 lt!95589 (minValue!3762 thiss!1248) lt!95590) lt!95709)))

(declare-fun b!192527 () Bool)

(assert (=> b!192527 (= e!126675 (not (= lt!95590 lt!95589)))))

(assert (= (and d!56407 res!90950) b!192527))

(assert (=> d!56407 m!219033))

(assert (=> d!56407 m!219035))

(assert (=> d!56407 m!219033))

(declare-fun m!219225 () Bool)

(assert (=> d!56407 m!219225))

(assert (=> d!56407 m!219031))

(declare-fun m!219227 () Bool)

(assert (=> d!56407 m!219227))

(assert (=> b!192289 d!56407))

(declare-fun b!192528 () Bool)

(declare-fun e!126680 () Bool)

(declare-fun e!126681 () Bool)

(assert (=> b!192528 (= e!126680 e!126681)))

(declare-fun c!34725 () Bool)

(declare-fun e!126682 () Bool)

(assert (=> b!192528 (= c!34725 e!126682)))

(declare-fun res!90951 () Bool)

(assert (=> b!192528 (=> (not res!90951) (not e!126682))))

(assert (=> b!192528 (= res!90951 (bvslt #b00000000000000000000000000000000 (size!4168 (_keys!5903 thiss!1248))))))

(declare-fun b!192529 () Bool)

(declare-fun e!126679 () Bool)

(assert (=> b!192529 (= e!126681 e!126679)))

(assert (=> b!192529 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4168 (_keys!5903 thiss!1248))))))

(declare-fun res!90953 () Bool)

(declare-fun lt!95711 () ListLongMap!2453)

(assert (=> b!192529 (= res!90953 (contains!1358 lt!95711 (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!192529 (=> (not res!90953) (not e!126679))))

(declare-fun b!192530 () Bool)

(declare-fun e!126678 () ListLongMap!2453)

(declare-fun e!126677 () ListLongMap!2453)

(assert (=> b!192530 (= e!126678 e!126677)))

(declare-fun c!34724 () Bool)

(assert (=> b!192530 (= c!34724 (validKeyInArray!0 (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19443 () Bool)

(declare-fun call!19446 () ListLongMap!2453)

(assert (=> bm!19443 (= call!19446 (getCurrentListMapNoExtraKeys!216 (_keys!5903 thiss!1248) (array!8166 (store (arr!3846 (_values!3904 thiss!1248)) (index!4895 lt!95475) (ValueCellFull!1887 v!309)) (size!4169 (_values!3904 thiss!1248))) (mask!9151 thiss!1248) (extraKeys!3658 thiss!1248) (zeroValue!3762 thiss!1248) (minValue!3762 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3921 thiss!1248)))))

(declare-fun b!192531 () Bool)

(assert (=> b!192531 (= e!126678 (ListLongMap!2454 Nil!2425))))

(declare-fun b!192532 () Bool)

(declare-fun e!126676 () Bool)

(assert (=> b!192532 (= e!126681 e!126676)))

(declare-fun c!34726 () Bool)

(assert (=> b!192532 (= c!34726 (bvslt #b00000000000000000000000000000000 (size!4168 (_keys!5903 thiss!1248))))))

(declare-fun b!192533 () Bool)

(declare-fun res!90954 () Bool)

(assert (=> b!192533 (=> (not res!90954) (not e!126680))))

(assert (=> b!192533 (= res!90954 (not (contains!1358 lt!95711 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!192534 () Bool)

(assert (=> b!192534 (= e!126677 call!19446)))

(declare-fun b!192535 () Bool)

(assert (=> b!192535 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4168 (_keys!5903 thiss!1248))))))

(assert (=> b!192535 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4169 (array!8166 (store (arr!3846 (_values!3904 thiss!1248)) (index!4895 lt!95475) (ValueCellFull!1887 v!309)) (size!4169 (_values!3904 thiss!1248))))))))

(assert (=> b!192535 (= e!126679 (= (apply!183 lt!95711 (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000)) (get!2219 (select (arr!3846 (array!8166 (store (arr!3846 (_values!3904 thiss!1248)) (index!4895 lt!95475) (ValueCellFull!1887 v!309)) (size!4169 (_values!3904 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!526 (defaultEntry!3921 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!192536 () Bool)

(assert (=> b!192536 (= e!126682 (validKeyInArray!0 (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!192536 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!56409 () Bool)

(assert (=> d!56409 e!126680))

(declare-fun res!90952 () Bool)

(assert (=> d!56409 (=> (not res!90952) (not e!126680))))

(assert (=> d!56409 (= res!90952 (not (contains!1358 lt!95711 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!56409 (= lt!95711 e!126678)))

(declare-fun c!34727 () Bool)

(assert (=> d!56409 (= c!34727 (bvsge #b00000000000000000000000000000000 (size!4168 (_keys!5903 thiss!1248))))))

(assert (=> d!56409 (validMask!0 (mask!9151 thiss!1248))))

(assert (=> d!56409 (= (getCurrentListMapNoExtraKeys!216 (_keys!5903 thiss!1248) (array!8166 (store (arr!3846 (_values!3904 thiss!1248)) (index!4895 lt!95475) (ValueCellFull!1887 v!309)) (size!4169 (_values!3904 thiss!1248))) (mask!9151 thiss!1248) (extraKeys!3658 thiss!1248) (zeroValue!3762 thiss!1248) (minValue!3762 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3921 thiss!1248)) lt!95711)))

(declare-fun b!192537 () Bool)

(assert (=> b!192537 (= e!126676 (isEmpty!485 lt!95711))))

(declare-fun b!192538 () Bool)

(declare-fun lt!95713 () Unit!5811)

(declare-fun lt!95710 () Unit!5811)

(assert (=> b!192538 (= lt!95713 lt!95710)))

(declare-fun lt!95714 () (_ BitVec 64))

(declare-fun lt!95715 () V!5595)

(declare-fun lt!95716 () (_ BitVec 64))

(declare-fun lt!95712 () ListLongMap!2453)

(assert (=> b!192538 (not (contains!1358 (+!310 lt!95712 (tuple2!3537 lt!95716 lt!95715)) lt!95714))))

(assert (=> b!192538 (= lt!95710 (addStillNotContains!96 lt!95712 lt!95716 lt!95715 lt!95714))))

(assert (=> b!192538 (= lt!95714 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!192538 (= lt!95715 (get!2219 (select (arr!3846 (array!8166 (store (arr!3846 (_values!3904 thiss!1248)) (index!4895 lt!95475) (ValueCellFull!1887 v!309)) (size!4169 (_values!3904 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!526 (defaultEntry!3921 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!192538 (= lt!95716 (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!192538 (= lt!95712 call!19446)))

(assert (=> b!192538 (= e!126677 (+!310 call!19446 (tuple2!3537 (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000) (get!2219 (select (arr!3846 (array!8166 (store (arr!3846 (_values!3904 thiss!1248)) (index!4895 lt!95475) (ValueCellFull!1887 v!309)) (size!4169 (_values!3904 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!526 (defaultEntry!3921 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!192539 () Bool)

(assert (=> b!192539 (= e!126676 (= lt!95711 (getCurrentListMapNoExtraKeys!216 (_keys!5903 thiss!1248) (array!8166 (store (arr!3846 (_values!3904 thiss!1248)) (index!4895 lt!95475) (ValueCellFull!1887 v!309)) (size!4169 (_values!3904 thiss!1248))) (mask!9151 thiss!1248) (extraKeys!3658 thiss!1248) (zeroValue!3762 thiss!1248) (minValue!3762 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3921 thiss!1248))))))

(assert (= (and d!56409 c!34727) b!192531))

(assert (= (and d!56409 (not c!34727)) b!192530))

(assert (= (and b!192530 c!34724) b!192538))

(assert (= (and b!192530 (not c!34724)) b!192534))

(assert (= (or b!192538 b!192534) bm!19443))

(assert (= (and d!56409 res!90952) b!192533))

(assert (= (and b!192533 res!90954) b!192528))

(assert (= (and b!192528 res!90951) b!192536))

(assert (= (and b!192528 c!34725) b!192529))

(assert (= (and b!192528 (not c!34725)) b!192532))

(assert (= (and b!192529 res!90953) b!192535))

(assert (= (and b!192532 c!34726) b!192539))

(assert (= (and b!192532 (not c!34726)) b!192537))

(declare-fun b_lambda!7435 () Bool)

(assert (=> (not b_lambda!7435) (not b!192535)))

(assert (=> b!192535 t!7346))

(declare-fun b_and!11387 () Bool)

(assert (= b_and!11385 (and (=> t!7346 result!4909) b_and!11387)))

(declare-fun b_lambda!7437 () Bool)

(assert (=> (not b_lambda!7437) (not b!192538)))

(assert (=> b!192538 t!7346))

(declare-fun b_and!11389 () Bool)

(assert (= b_and!11387 (and (=> t!7346 result!4909) b_and!11389)))

(declare-fun m!219229 () Bool)

(assert (=> b!192539 m!219229))

(assert (=> b!192530 m!218945))

(assert (=> b!192530 m!218945))

(assert (=> b!192530 m!218985))

(assert (=> b!192529 m!218945))

(assert (=> b!192529 m!218945))

(declare-fun m!219231 () Bool)

(assert (=> b!192529 m!219231))

(declare-fun m!219233 () Bool)

(assert (=> b!192538 m!219233))

(declare-fun m!219235 () Bool)

(assert (=> b!192538 m!219235))

(declare-fun m!219237 () Bool)

(assert (=> b!192538 m!219237))

(assert (=> b!192538 m!218997))

(assert (=> b!192538 m!218941))

(assert (=> b!192538 m!218999))

(assert (=> b!192538 m!218941))

(declare-fun m!219239 () Bool)

(assert (=> b!192538 m!219239))

(assert (=> b!192538 m!219233))

(assert (=> b!192538 m!218945))

(assert (=> b!192538 m!218997))

(declare-fun m!219241 () Bool)

(assert (=> d!56409 m!219241))

(assert (=> d!56409 m!218845))

(declare-fun m!219243 () Bool)

(assert (=> b!192537 m!219243))

(assert (=> b!192535 m!218997))

(assert (=> b!192535 m!218941))

(assert (=> b!192535 m!218999))

(assert (=> b!192535 m!218941))

(assert (=> b!192535 m!218945))

(assert (=> b!192535 m!218997))

(assert (=> b!192535 m!218945))

(declare-fun m!219245 () Bool)

(assert (=> b!192535 m!219245))

(assert (=> bm!19443 m!219229))

(assert (=> b!192536 m!218945))

(assert (=> b!192536 m!218945))

(assert (=> b!192536 m!218985))

(declare-fun m!219247 () Bool)

(assert (=> b!192533 m!219247))

(assert (=> b!192289 d!56409))

(declare-fun d!56411 () Bool)

(declare-fun e!126683 () Bool)

(assert (=> d!56411 e!126683))

(declare-fun res!90955 () Bool)

(assert (=> d!56411 (=> (not res!90955) (not e!126683))))

(declare-fun lt!95718 () ListLongMap!2453)

(assert (=> d!56411 (= res!90955 (contains!1358 lt!95718 (_1!1779 (tuple2!3537 lt!95589 (minValue!3762 thiss!1248)))))))

(declare-fun lt!95720 () List!2428)

(assert (=> d!56411 (= lt!95718 (ListLongMap!2454 lt!95720))))

(declare-fun lt!95719 () Unit!5811)

(declare-fun lt!95717 () Unit!5811)

(assert (=> d!56411 (= lt!95719 lt!95717)))

(assert (=> d!56411 (= (getValueByKey!240 lt!95720 (_1!1779 (tuple2!3537 lt!95589 (minValue!3762 thiss!1248)))) (Some!245 (_2!1779 (tuple2!3537 lt!95589 (minValue!3762 thiss!1248)))))))

(assert (=> d!56411 (= lt!95717 (lemmaContainsTupThenGetReturnValue!127 lt!95720 (_1!1779 (tuple2!3537 lt!95589 (minValue!3762 thiss!1248))) (_2!1779 (tuple2!3537 lt!95589 (minValue!3762 thiss!1248)))))))

(assert (=> d!56411 (= lt!95720 (insertStrictlySorted!130 (toList!1242 lt!95599) (_1!1779 (tuple2!3537 lt!95589 (minValue!3762 thiss!1248))) (_2!1779 (tuple2!3537 lt!95589 (minValue!3762 thiss!1248)))))))

(assert (=> d!56411 (= (+!310 lt!95599 (tuple2!3537 lt!95589 (minValue!3762 thiss!1248))) lt!95718)))

(declare-fun b!192540 () Bool)

(declare-fun res!90956 () Bool)

(assert (=> b!192540 (=> (not res!90956) (not e!126683))))

(assert (=> b!192540 (= res!90956 (= (getValueByKey!240 (toList!1242 lt!95718) (_1!1779 (tuple2!3537 lt!95589 (minValue!3762 thiss!1248)))) (Some!245 (_2!1779 (tuple2!3537 lt!95589 (minValue!3762 thiss!1248))))))))

(declare-fun b!192541 () Bool)

(assert (=> b!192541 (= e!126683 (contains!1359 (toList!1242 lt!95718) (tuple2!3537 lt!95589 (minValue!3762 thiss!1248))))))

(assert (= (and d!56411 res!90955) b!192540))

(assert (= (and b!192540 res!90956) b!192541))

(declare-fun m!219249 () Bool)

(assert (=> d!56411 m!219249))

(declare-fun m!219251 () Bool)

(assert (=> d!56411 m!219251))

(declare-fun m!219253 () Bool)

(assert (=> d!56411 m!219253))

(declare-fun m!219255 () Bool)

(assert (=> d!56411 m!219255))

(declare-fun m!219257 () Bool)

(assert (=> b!192540 m!219257))

(declare-fun m!219259 () Bool)

(assert (=> b!192541 m!219259))

(assert (=> b!192289 d!56411))

(declare-fun d!56413 () Bool)

(assert (=> d!56413 (= (apply!183 lt!95594 lt!95603) (get!2220 (getValueByKey!240 (toList!1242 lt!95594) lt!95603)))))

(declare-fun bs!7694 () Bool)

(assert (= bs!7694 d!56413))

(declare-fun m!219261 () Bool)

(assert (=> bs!7694 m!219261))

(assert (=> bs!7694 m!219261))

(declare-fun m!219263 () Bool)

(assert (=> bs!7694 m!219263))

(assert (=> b!192289 d!56413))

(declare-fun d!56415 () Bool)

(declare-fun e!126685 () Bool)

(assert (=> d!56415 e!126685))

(declare-fun res!90957 () Bool)

(assert (=> d!56415 (=> res!90957 e!126685)))

(declare-fun lt!95722 () Bool)

(assert (=> d!56415 (= res!90957 (not lt!95722))))

(declare-fun lt!95724 () Bool)

(assert (=> d!56415 (= lt!95722 lt!95724)))

(declare-fun lt!95723 () Unit!5811)

(declare-fun e!126684 () Unit!5811)

(assert (=> d!56415 (= lt!95723 e!126684)))

(declare-fun c!34728 () Bool)

(assert (=> d!56415 (= c!34728 lt!95724)))

(assert (=> d!56415 (= lt!95724 (containsKey!244 (toList!1242 (+!310 lt!95604 (tuple2!3537 lt!95591 (zeroValue!3762 thiss!1248)))) lt!95598))))

(assert (=> d!56415 (= (contains!1358 (+!310 lt!95604 (tuple2!3537 lt!95591 (zeroValue!3762 thiss!1248))) lt!95598) lt!95722)))

(declare-fun b!192542 () Bool)

(declare-fun lt!95721 () Unit!5811)

(assert (=> b!192542 (= e!126684 lt!95721)))

(assert (=> b!192542 (= lt!95721 (lemmaContainsKeyImpliesGetValueByKeyDefined!192 (toList!1242 (+!310 lt!95604 (tuple2!3537 lt!95591 (zeroValue!3762 thiss!1248)))) lt!95598))))

(assert (=> b!192542 (isDefined!193 (getValueByKey!240 (toList!1242 (+!310 lt!95604 (tuple2!3537 lt!95591 (zeroValue!3762 thiss!1248)))) lt!95598))))

(declare-fun b!192543 () Bool)

(declare-fun Unit!5823 () Unit!5811)

(assert (=> b!192543 (= e!126684 Unit!5823)))

(declare-fun b!192544 () Bool)

(assert (=> b!192544 (= e!126685 (isDefined!193 (getValueByKey!240 (toList!1242 (+!310 lt!95604 (tuple2!3537 lt!95591 (zeroValue!3762 thiss!1248)))) lt!95598)))))

(assert (= (and d!56415 c!34728) b!192542))

(assert (= (and d!56415 (not c!34728)) b!192543))

(assert (= (and d!56415 (not res!90957)) b!192544))

(declare-fun m!219265 () Bool)

(assert (=> d!56415 m!219265))

(declare-fun m!219267 () Bool)

(assert (=> b!192542 m!219267))

(declare-fun m!219269 () Bool)

(assert (=> b!192542 m!219269))

(assert (=> b!192542 m!219269))

(declare-fun m!219271 () Bool)

(assert (=> b!192542 m!219271))

(assert (=> b!192544 m!219269))

(assert (=> b!192544 m!219269))

(assert (=> b!192544 m!219271))

(assert (=> b!192289 d!56415))

(declare-fun d!56417 () Bool)

(assert (=> d!56417 (= (apply!183 (+!310 lt!95595 (tuple2!3537 lt!95607 (zeroValue!3762 thiss!1248))) lt!95601) (get!2220 (getValueByKey!240 (toList!1242 (+!310 lt!95595 (tuple2!3537 lt!95607 (zeroValue!3762 thiss!1248)))) lt!95601)))))

(declare-fun bs!7695 () Bool)

(assert (= bs!7695 d!56417))

(declare-fun m!219273 () Bool)

(assert (=> bs!7695 m!219273))

(assert (=> bs!7695 m!219273))

(declare-fun m!219275 () Bool)

(assert (=> bs!7695 m!219275))

(assert (=> b!192289 d!56417))

(declare-fun d!56419 () Bool)

(declare-fun e!126686 () Bool)

(assert (=> d!56419 e!126686))

(declare-fun res!90958 () Bool)

(assert (=> d!56419 (=> (not res!90958) (not e!126686))))

(declare-fun lt!95726 () ListLongMap!2453)

(assert (=> d!56419 (= res!90958 (contains!1358 lt!95726 (_1!1779 (tuple2!3537 lt!95607 (zeroValue!3762 thiss!1248)))))))

(declare-fun lt!95728 () List!2428)

(assert (=> d!56419 (= lt!95726 (ListLongMap!2454 lt!95728))))

(declare-fun lt!95727 () Unit!5811)

(declare-fun lt!95725 () Unit!5811)

(assert (=> d!56419 (= lt!95727 lt!95725)))

(assert (=> d!56419 (= (getValueByKey!240 lt!95728 (_1!1779 (tuple2!3537 lt!95607 (zeroValue!3762 thiss!1248)))) (Some!245 (_2!1779 (tuple2!3537 lt!95607 (zeroValue!3762 thiss!1248)))))))

(assert (=> d!56419 (= lt!95725 (lemmaContainsTupThenGetReturnValue!127 lt!95728 (_1!1779 (tuple2!3537 lt!95607 (zeroValue!3762 thiss!1248))) (_2!1779 (tuple2!3537 lt!95607 (zeroValue!3762 thiss!1248)))))))

(assert (=> d!56419 (= lt!95728 (insertStrictlySorted!130 (toList!1242 lt!95595) (_1!1779 (tuple2!3537 lt!95607 (zeroValue!3762 thiss!1248))) (_2!1779 (tuple2!3537 lt!95607 (zeroValue!3762 thiss!1248)))))))

(assert (=> d!56419 (= (+!310 lt!95595 (tuple2!3537 lt!95607 (zeroValue!3762 thiss!1248))) lt!95726)))

(declare-fun b!192545 () Bool)

(declare-fun res!90959 () Bool)

(assert (=> b!192545 (=> (not res!90959) (not e!126686))))

(assert (=> b!192545 (= res!90959 (= (getValueByKey!240 (toList!1242 lt!95726) (_1!1779 (tuple2!3537 lt!95607 (zeroValue!3762 thiss!1248)))) (Some!245 (_2!1779 (tuple2!3537 lt!95607 (zeroValue!3762 thiss!1248))))))))

(declare-fun b!192546 () Bool)

(assert (=> b!192546 (= e!126686 (contains!1359 (toList!1242 lt!95726) (tuple2!3537 lt!95607 (zeroValue!3762 thiss!1248))))))

(assert (= (and d!56419 res!90958) b!192545))

(assert (= (and b!192545 res!90959) b!192546))

(declare-fun m!219277 () Bool)

(assert (=> d!56419 m!219277))

(declare-fun m!219279 () Bool)

(assert (=> d!56419 m!219279))

(declare-fun m!219281 () Bool)

(assert (=> d!56419 m!219281))

(declare-fun m!219283 () Bool)

(assert (=> d!56419 m!219283))

(declare-fun m!219285 () Bool)

(assert (=> b!192545 m!219285))

(declare-fun m!219287 () Bool)

(assert (=> b!192546 m!219287))

(assert (=> b!192289 d!56419))

(declare-fun d!56421 () Bool)

(assert (=> d!56421 (= (apply!183 (+!310 lt!95594 (tuple2!3537 lt!95592 (minValue!3762 thiss!1248))) lt!95603) (apply!183 lt!95594 lt!95603))))

(declare-fun lt!95729 () Unit!5811)

(assert (=> d!56421 (= lt!95729 (choose!1048 lt!95594 lt!95592 (minValue!3762 thiss!1248) lt!95603))))

(declare-fun e!126687 () Bool)

(assert (=> d!56421 e!126687))

(declare-fun res!90960 () Bool)

(assert (=> d!56421 (=> (not res!90960) (not e!126687))))

(assert (=> d!56421 (= res!90960 (contains!1358 lt!95594 lt!95603))))

(assert (=> d!56421 (= (addApplyDifferent!159 lt!95594 lt!95592 (minValue!3762 thiss!1248) lt!95603) lt!95729)))

(declare-fun b!192547 () Bool)

(assert (=> b!192547 (= e!126687 (not (= lt!95603 lt!95592)))))

(assert (= (and d!56421 res!90960) b!192547))

(assert (=> d!56421 m!219013))

(assert (=> d!56421 m!219015))

(assert (=> d!56421 m!219013))

(declare-fun m!219289 () Bool)

(assert (=> d!56421 m!219289))

(assert (=> d!56421 m!219017))

(declare-fun m!219291 () Bool)

(assert (=> d!56421 m!219291))

(assert (=> b!192289 d!56421))

(declare-fun d!56423 () Bool)

(declare-fun e!126688 () Bool)

(assert (=> d!56423 e!126688))

(declare-fun res!90961 () Bool)

(assert (=> d!56423 (=> (not res!90961) (not e!126688))))

(declare-fun lt!95731 () ListLongMap!2453)

(assert (=> d!56423 (= res!90961 (contains!1358 lt!95731 (_1!1779 (tuple2!3537 lt!95592 (minValue!3762 thiss!1248)))))))

(declare-fun lt!95733 () List!2428)

(assert (=> d!56423 (= lt!95731 (ListLongMap!2454 lt!95733))))

(declare-fun lt!95732 () Unit!5811)

(declare-fun lt!95730 () Unit!5811)

(assert (=> d!56423 (= lt!95732 lt!95730)))

(assert (=> d!56423 (= (getValueByKey!240 lt!95733 (_1!1779 (tuple2!3537 lt!95592 (minValue!3762 thiss!1248)))) (Some!245 (_2!1779 (tuple2!3537 lt!95592 (minValue!3762 thiss!1248)))))))

(assert (=> d!56423 (= lt!95730 (lemmaContainsTupThenGetReturnValue!127 lt!95733 (_1!1779 (tuple2!3537 lt!95592 (minValue!3762 thiss!1248))) (_2!1779 (tuple2!3537 lt!95592 (minValue!3762 thiss!1248)))))))

(assert (=> d!56423 (= lt!95733 (insertStrictlySorted!130 (toList!1242 lt!95594) (_1!1779 (tuple2!3537 lt!95592 (minValue!3762 thiss!1248))) (_2!1779 (tuple2!3537 lt!95592 (minValue!3762 thiss!1248)))))))

(assert (=> d!56423 (= (+!310 lt!95594 (tuple2!3537 lt!95592 (minValue!3762 thiss!1248))) lt!95731)))

(declare-fun b!192548 () Bool)

(declare-fun res!90962 () Bool)

(assert (=> b!192548 (=> (not res!90962) (not e!126688))))

(assert (=> b!192548 (= res!90962 (= (getValueByKey!240 (toList!1242 lt!95731) (_1!1779 (tuple2!3537 lt!95592 (minValue!3762 thiss!1248)))) (Some!245 (_2!1779 (tuple2!3537 lt!95592 (minValue!3762 thiss!1248))))))))

(declare-fun b!192549 () Bool)

(assert (=> b!192549 (= e!126688 (contains!1359 (toList!1242 lt!95731) (tuple2!3537 lt!95592 (minValue!3762 thiss!1248))))))

(assert (= (and d!56423 res!90961) b!192548))

(assert (= (and b!192548 res!90962) b!192549))

(declare-fun m!219293 () Bool)

(assert (=> d!56423 m!219293))

(declare-fun m!219295 () Bool)

(assert (=> d!56423 m!219295))

(declare-fun m!219297 () Bool)

(assert (=> d!56423 m!219297))

(declare-fun m!219299 () Bool)

(assert (=> d!56423 m!219299))

(declare-fun m!219301 () Bool)

(assert (=> b!192548 m!219301))

(declare-fun m!219303 () Bool)

(assert (=> b!192549 m!219303))

(assert (=> b!192289 d!56423))

(declare-fun d!56425 () Bool)

(assert (=> d!56425 (= (apply!183 (+!310 lt!95594 (tuple2!3537 lt!95592 (minValue!3762 thiss!1248))) lt!95603) (get!2220 (getValueByKey!240 (toList!1242 (+!310 lt!95594 (tuple2!3537 lt!95592 (minValue!3762 thiss!1248)))) lt!95603)))))

(declare-fun bs!7696 () Bool)

(assert (= bs!7696 d!56425))

(declare-fun m!219305 () Bool)

(assert (=> bs!7696 m!219305))

(assert (=> bs!7696 m!219305))

(declare-fun m!219307 () Bool)

(assert (=> bs!7696 m!219307))

(assert (=> b!192289 d!56425))

(declare-fun d!56427 () Bool)

(assert (=> d!56427 (= (apply!183 (+!310 lt!95595 (tuple2!3537 lt!95607 (zeroValue!3762 thiss!1248))) lt!95601) (apply!183 lt!95595 lt!95601))))

(declare-fun lt!95734 () Unit!5811)

(assert (=> d!56427 (= lt!95734 (choose!1048 lt!95595 lt!95607 (zeroValue!3762 thiss!1248) lt!95601))))

(declare-fun e!126689 () Bool)

(assert (=> d!56427 e!126689))

(declare-fun res!90963 () Bool)

(assert (=> d!56427 (=> (not res!90963) (not e!126689))))

(assert (=> d!56427 (= res!90963 (contains!1358 lt!95595 lt!95601))))

(assert (=> d!56427 (= (addApplyDifferent!159 lt!95595 lt!95607 (zeroValue!3762 thiss!1248) lt!95601) lt!95734)))

(declare-fun b!192550 () Bool)

(assert (=> b!192550 (= e!126689 (not (= lt!95601 lt!95607)))))

(assert (= (and d!56427 res!90963) b!192550))

(assert (=> d!56427 m!219025))

(assert (=> d!56427 m!219027))

(assert (=> d!56427 m!219025))

(declare-fun m!219309 () Bool)

(assert (=> d!56427 m!219309))

(assert (=> d!56427 m!219005))

(declare-fun m!219311 () Bool)

(assert (=> d!56427 m!219311))

(assert (=> b!192289 d!56427))

(declare-fun d!56429 () Bool)

(assert (=> d!56429 (= (apply!183 lt!95599 lt!95590) (get!2220 (getValueByKey!240 (toList!1242 lt!95599) lt!95590)))))

(declare-fun bs!7697 () Bool)

(assert (= bs!7697 d!56429))

(declare-fun m!219313 () Bool)

(assert (=> bs!7697 m!219313))

(assert (=> bs!7697 m!219313))

(declare-fun m!219315 () Bool)

(assert (=> bs!7697 m!219315))

(assert (=> b!192289 d!56429))

(declare-fun d!56431 () Bool)

(assert (=> d!56431 (contains!1358 (+!310 lt!95604 (tuple2!3537 lt!95591 (zeroValue!3762 thiss!1248))) lt!95598)))

(declare-fun lt!95737 () Unit!5811)

(declare-fun choose!1049 (ListLongMap!2453 (_ BitVec 64) V!5595 (_ BitVec 64)) Unit!5811)

(assert (=> d!56431 (= lt!95737 (choose!1049 lt!95604 lt!95591 (zeroValue!3762 thiss!1248) lt!95598))))

(assert (=> d!56431 (contains!1358 lt!95604 lt!95598)))

(assert (=> d!56431 (= (addStillContains!159 lt!95604 lt!95591 (zeroValue!3762 thiss!1248) lt!95598) lt!95737)))

(declare-fun bs!7698 () Bool)

(assert (= bs!7698 d!56431))

(assert (=> bs!7698 m!219007))

(assert (=> bs!7698 m!219007))

(assert (=> bs!7698 m!219023))

(declare-fun m!219317 () Bool)

(assert (=> bs!7698 m!219317))

(declare-fun m!219319 () Bool)

(assert (=> bs!7698 m!219319))

(assert (=> b!192289 d!56431))

(declare-fun d!56433 () Bool)

(declare-fun e!126690 () Bool)

(assert (=> d!56433 e!126690))

(declare-fun res!90964 () Bool)

(assert (=> d!56433 (=> (not res!90964) (not e!126690))))

(declare-fun lt!95739 () ListLongMap!2453)

(assert (=> d!56433 (= res!90964 (contains!1358 lt!95739 (_1!1779 (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248)))))))

(declare-fun lt!95741 () List!2428)

(assert (=> d!56433 (= lt!95739 (ListLongMap!2454 lt!95741))))

(declare-fun lt!95740 () Unit!5811)

(declare-fun lt!95738 () Unit!5811)

(assert (=> d!56433 (= lt!95740 lt!95738)))

(assert (=> d!56433 (= (getValueByKey!240 lt!95741 (_1!1779 (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248)))) (Some!245 (_2!1779 (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248)))))))

(assert (=> d!56433 (= lt!95738 (lemmaContainsTupThenGetReturnValue!127 lt!95741 (_1!1779 (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248))) (_2!1779 (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248)))))))

(assert (=> d!56433 (= lt!95741 (insertStrictlySorted!130 (toList!1242 call!19418) (_1!1779 (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248))) (_2!1779 (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248)))))))

(assert (=> d!56433 (= (+!310 call!19418 (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248))) lt!95739)))

(declare-fun b!192552 () Bool)

(declare-fun res!90965 () Bool)

(assert (=> b!192552 (=> (not res!90965) (not e!126690))))

(assert (=> b!192552 (= res!90965 (= (getValueByKey!240 (toList!1242 lt!95739) (_1!1779 (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248)))) (Some!245 (_2!1779 (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248))))))))

(declare-fun b!192553 () Bool)

(assert (=> b!192553 (= e!126690 (contains!1359 (toList!1242 lt!95739) (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248))))))

(assert (= (and d!56433 res!90964) b!192552))

(assert (= (and b!192552 res!90965) b!192553))

(declare-fun m!219321 () Bool)

(assert (=> d!56433 m!219321))

(declare-fun m!219323 () Bool)

(assert (=> d!56433 m!219323))

(declare-fun m!219325 () Bool)

(assert (=> d!56433 m!219325))

(declare-fun m!219327 () Bool)

(assert (=> d!56433 m!219327))

(declare-fun m!219329 () Bool)

(assert (=> b!192552 m!219329))

(declare-fun m!219331 () Bool)

(assert (=> b!192553 m!219331))

(assert (=> b!192303 d!56433))

(declare-fun d!56435 () Bool)

(assert (=> d!56435 (= (inRange!0 (index!4895 lt!95506) (mask!9151 thiss!1248)) (and (bvsge (index!4895 lt!95506) #b00000000000000000000000000000000) (bvslt (index!4895 lt!95506) (bvadd (mask!9151 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!192211 d!56435))

(declare-fun b!192563 () Bool)

(declare-fun res!90977 () Bool)

(declare-fun e!126693 () Bool)

(assert (=> b!192563 (=> (not res!90977) (not e!126693))))

(declare-fun size!4172 (LongMapFixedSize!2682) (_ BitVec 32))

(assert (=> b!192563 (= res!90977 (bvsge (size!4172 thiss!1248) (_size!1390 thiss!1248)))))

(declare-fun b!192565 () Bool)

(assert (=> b!192565 (= e!126693 (and (bvsge (extraKeys!3658 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3658 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1390 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!192562 () Bool)

(declare-fun res!90975 () Bool)

(assert (=> b!192562 (=> (not res!90975) (not e!126693))))

(assert (=> b!192562 (= res!90975 (and (= (size!4169 (_values!3904 thiss!1248)) (bvadd (mask!9151 thiss!1248) #b00000000000000000000000000000001)) (= (size!4168 (_keys!5903 thiss!1248)) (size!4169 (_values!3904 thiss!1248))) (bvsge (_size!1390 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1390 thiss!1248) (bvadd (mask!9151 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!192564 () Bool)

(declare-fun res!90976 () Bool)

(assert (=> b!192564 (=> (not res!90976) (not e!126693))))

(assert (=> b!192564 (= res!90976 (= (size!4172 thiss!1248) (bvadd (_size!1390 thiss!1248) (bvsdiv (bvadd (extraKeys!3658 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!56437 () Bool)

(declare-fun res!90974 () Bool)

(assert (=> d!56437 (=> (not res!90974) (not e!126693))))

(assert (=> d!56437 (= res!90974 (validMask!0 (mask!9151 thiss!1248)))))

(assert (=> d!56437 (= (simpleValid!199 thiss!1248) e!126693)))

(assert (= (and d!56437 res!90974) b!192562))

(assert (= (and b!192562 res!90975) b!192563))

(assert (= (and b!192563 res!90977) b!192564))

(assert (= (and b!192564 res!90976) b!192565))

(declare-fun m!219333 () Bool)

(assert (=> b!192563 m!219333))

(assert (=> b!192564 m!219333))

(assert (=> d!56437 m!218845))

(assert (=> d!56335 d!56437))

(assert (=> b!192288 d!56371))

(declare-fun d!56439 () Bool)

(declare-fun e!126695 () Bool)

(assert (=> d!56439 e!126695))

(declare-fun res!90978 () Bool)

(assert (=> d!56439 (=> res!90978 e!126695)))

(declare-fun lt!95743 () Bool)

(assert (=> d!56439 (= res!90978 (not lt!95743))))

(declare-fun lt!95745 () Bool)

(assert (=> d!56439 (= lt!95743 lt!95745)))

(declare-fun lt!95744 () Unit!5811)

(declare-fun e!126694 () Unit!5811)

(assert (=> d!56439 (= lt!95744 e!126694)))

(declare-fun c!34729 () Bool)

(assert (=> d!56439 (= c!34729 lt!95745)))

(assert (=> d!56439 (= lt!95745 (containsKey!244 (toList!1242 lt!95596) (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!56439 (= (contains!1358 lt!95596 (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000)) lt!95743)))

(declare-fun b!192566 () Bool)

(declare-fun lt!95742 () Unit!5811)

(assert (=> b!192566 (= e!126694 lt!95742)))

(assert (=> b!192566 (= lt!95742 (lemmaContainsKeyImpliesGetValueByKeyDefined!192 (toList!1242 lt!95596) (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!192566 (isDefined!193 (getValueByKey!240 (toList!1242 lt!95596) (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!192567 () Bool)

(declare-fun Unit!5824 () Unit!5811)

(assert (=> b!192567 (= e!126694 Unit!5824)))

(declare-fun b!192568 () Bool)

(assert (=> b!192568 (= e!126695 (isDefined!193 (getValueByKey!240 (toList!1242 lt!95596) (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!56439 c!34729) b!192566))

(assert (= (and d!56439 (not c!34729)) b!192567))

(assert (= (and d!56439 (not res!90978)) b!192568))

(assert (=> d!56439 m!218945))

(declare-fun m!219335 () Bool)

(assert (=> d!56439 m!219335))

(assert (=> b!192566 m!218945))

(declare-fun m!219337 () Bool)

(assert (=> b!192566 m!219337))

(assert (=> b!192566 m!218945))

(assert (=> b!192566 m!219097))

(assert (=> b!192566 m!219097))

(declare-fun m!219339 () Bool)

(assert (=> b!192566 m!219339))

(assert (=> b!192568 m!218945))

(assert (=> b!192568 m!219097))

(assert (=> b!192568 m!219097))

(assert (=> b!192568 m!219339))

(assert (=> b!192287 d!56439))

(declare-fun d!56441 () Bool)

(assert (=> d!56441 (= (+!310 (getCurrentListMap!890 (_keys!5903 thiss!1248) (_values!3904 thiss!1248) (mask!9151 thiss!1248) (extraKeys!3658 thiss!1248) (zeroValue!3762 thiss!1248) (minValue!3762 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3921 thiss!1248)) (tuple2!3537 key!828 v!309)) (getCurrentListMap!890 (_keys!5903 thiss!1248) (array!8166 (store (arr!3846 (_values!3904 thiss!1248)) (index!4895 lt!95475) (ValueCellFull!1887 v!309)) (size!4169 (_values!3904 thiss!1248))) (mask!9151 thiss!1248) (extraKeys!3658 thiss!1248) (zeroValue!3762 thiss!1248) (minValue!3762 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3921 thiss!1248)))))

(assert (=> d!56441 true))

(declare-fun _$5!155 () Unit!5811)

(assert (=> d!56441 (= (choose!1046 (_keys!5903 thiss!1248) (_values!3904 thiss!1248) (mask!9151 thiss!1248) (extraKeys!3658 thiss!1248) (zeroValue!3762 thiss!1248) (minValue!3762 thiss!1248) (index!4895 lt!95475) key!828 v!309 (defaultEntry!3921 thiss!1248)) _$5!155)))

(declare-fun bs!7699 () Bool)

(assert (= bs!7699 d!56441))

(assert (=> bs!7699 m!218851))

(assert (=> bs!7699 m!218851))

(assert (=> bs!7699 m!219059))

(assert (=> bs!7699 m!218841))

(assert (=> bs!7699 m!218853))

(assert (=> d!56351 d!56441))

(assert (=> d!56351 d!56343))

(declare-fun d!56443 () Bool)

(assert (=> d!56443 (= (apply!183 lt!95574 (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000)) (get!2220 (getValueByKey!240 (toList!1242 lt!95574) (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7700 () Bool)

(assert (= bs!7700 d!56443))

(assert (=> bs!7700 m!218945))

(declare-fun m!219341 () Bool)

(assert (=> bs!7700 m!219341))

(assert (=> bs!7700 m!219341))

(declare-fun m!219343 () Bool)

(assert (=> bs!7700 m!219343))

(assert (=> b!192278 d!56443))

(declare-fun d!56445 () Bool)

(declare-fun c!34730 () Bool)

(assert (=> d!56445 (= c!34730 ((_ is ValueCellFull!1887) (select (arr!3846 (_values!3904 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!126696 () V!5595)

(assert (=> d!56445 (= (get!2219 (select (arr!3846 (_values!3904 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!526 (defaultEntry!3921 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!126696)))

(declare-fun b!192569 () Bool)

(assert (=> b!192569 (= e!126696 (get!2221 (select (arr!3846 (_values!3904 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!526 (defaultEntry!3921 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!192570 () Bool)

(assert (=> b!192570 (= e!126696 (get!2222 (select (arr!3846 (_values!3904 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!526 (defaultEntry!3921 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56445 c!34730) b!192569))

(assert (= (and d!56445 (not c!34730)) b!192570))

(assert (=> b!192569 m!218939))

(assert (=> b!192569 m!218941))

(declare-fun m!219345 () Bool)

(assert (=> b!192569 m!219345))

(assert (=> b!192570 m!218939))

(assert (=> b!192570 m!218941))

(declare-fun m!219347 () Bool)

(assert (=> b!192570 m!219347))

(assert (=> b!192278 d!56445))

(declare-fun d!56447 () Bool)

(assert (=> d!56447 (isDefined!193 (getValueByKey!240 (toList!1242 lt!95476) key!828))))

(declare-fun lt!95748 () Unit!5811)

(declare-fun choose!1050 (List!2428 (_ BitVec 64)) Unit!5811)

(assert (=> d!56447 (= lt!95748 (choose!1050 (toList!1242 lt!95476) key!828))))

(declare-fun e!126699 () Bool)

(assert (=> d!56447 e!126699))

(declare-fun res!90981 () Bool)

(assert (=> d!56447 (=> (not res!90981) (not e!126699))))

(assert (=> d!56447 (= res!90981 (isStrictlySorted!356 (toList!1242 lt!95476)))))

(assert (=> d!56447 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!192 (toList!1242 lt!95476) key!828) lt!95748)))

(declare-fun b!192573 () Bool)

(assert (=> b!192573 (= e!126699 (containsKey!244 (toList!1242 lt!95476) key!828))))

(assert (= (and d!56447 res!90981) b!192573))

(assert (=> d!56447 m!219053))

(assert (=> d!56447 m!219053))

(assert (=> d!56447 m!219055))

(declare-fun m!219349 () Bool)

(assert (=> d!56447 m!219349))

(assert (=> d!56447 m!219149))

(assert (=> b!192573 m!219049))

(assert (=> b!192311 d!56447))

(declare-fun d!56449 () Bool)

(declare-fun isEmpty!486 (Option!246) Bool)

(assert (=> d!56449 (= (isDefined!193 (getValueByKey!240 (toList!1242 lt!95476) key!828)) (not (isEmpty!486 (getValueByKey!240 (toList!1242 lt!95476) key!828))))))

(declare-fun bs!7701 () Bool)

(assert (= bs!7701 d!56449))

(assert (=> bs!7701 m!219053))

(declare-fun m!219351 () Bool)

(assert (=> bs!7701 m!219351))

(assert (=> b!192311 d!56449))

(declare-fun d!56451 () Bool)

(declare-fun c!34731 () Bool)

(assert (=> d!56451 (= c!34731 (and ((_ is Cons!2424) (toList!1242 lt!95476)) (= (_1!1779 (h!3064 (toList!1242 lt!95476))) key!828)))))

(declare-fun e!126700 () Option!246)

(assert (=> d!56451 (= (getValueByKey!240 (toList!1242 lt!95476) key!828) e!126700)))

(declare-fun b!192577 () Bool)

(declare-fun e!126701 () Option!246)

(assert (=> b!192577 (= e!126701 None!244)))

(declare-fun b!192574 () Bool)

(assert (=> b!192574 (= e!126700 (Some!245 (_2!1779 (h!3064 (toList!1242 lt!95476)))))))

(declare-fun b!192575 () Bool)

(assert (=> b!192575 (= e!126700 e!126701)))

(declare-fun c!34732 () Bool)

(assert (=> b!192575 (= c!34732 (and ((_ is Cons!2424) (toList!1242 lt!95476)) (not (= (_1!1779 (h!3064 (toList!1242 lt!95476))) key!828))))))

(declare-fun b!192576 () Bool)

(assert (=> b!192576 (= e!126701 (getValueByKey!240 (t!7344 (toList!1242 lt!95476)) key!828))))

(assert (= (and d!56451 c!34731) b!192574))

(assert (= (and d!56451 (not c!34731)) b!192575))

(assert (= (and b!192575 c!34732) b!192576))

(assert (= (and b!192575 (not c!34732)) b!192577))

(declare-fun m!219353 () Bool)

(assert (=> b!192576 m!219353))

(assert (=> b!192311 d!56451))

(declare-fun d!56453 () Bool)

(declare-fun e!126703 () Bool)

(assert (=> d!56453 e!126703))

(declare-fun res!90982 () Bool)

(assert (=> d!56453 (=> res!90982 e!126703)))

(declare-fun lt!95750 () Bool)

(assert (=> d!56453 (= res!90982 (not lt!95750))))

(declare-fun lt!95752 () Bool)

(assert (=> d!56453 (= lt!95750 lt!95752)))

(declare-fun lt!95751 () Unit!5811)

(declare-fun e!126702 () Unit!5811)

(assert (=> d!56453 (= lt!95751 e!126702)))

(declare-fun c!34733 () Bool)

(assert (=> d!56453 (= c!34733 lt!95752)))

(assert (=> d!56453 (= lt!95752 (containsKey!244 (toList!1242 lt!95574) (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!56453 (= (contains!1358 lt!95574 (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000)) lt!95750)))

(declare-fun b!192578 () Bool)

(declare-fun lt!95749 () Unit!5811)

(assert (=> b!192578 (= e!126702 lt!95749)))

(assert (=> b!192578 (= lt!95749 (lemmaContainsKeyImpliesGetValueByKeyDefined!192 (toList!1242 lt!95574) (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!192578 (isDefined!193 (getValueByKey!240 (toList!1242 lt!95574) (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!192579 () Bool)

(declare-fun Unit!5825 () Unit!5811)

(assert (=> b!192579 (= e!126702 Unit!5825)))

(declare-fun b!192580 () Bool)

(assert (=> b!192580 (= e!126703 (isDefined!193 (getValueByKey!240 (toList!1242 lt!95574) (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!56453 c!34733) b!192578))

(assert (= (and d!56453 (not c!34733)) b!192579))

(assert (= (and d!56453 (not res!90982)) b!192580))

(assert (=> d!56453 m!218945))

(declare-fun m!219355 () Bool)

(assert (=> d!56453 m!219355))

(assert (=> b!192578 m!218945))

(declare-fun m!219357 () Bool)

(assert (=> b!192578 m!219357))

(assert (=> b!192578 m!218945))

(assert (=> b!192578 m!219341))

(assert (=> b!192578 m!219341))

(declare-fun m!219359 () Bool)

(assert (=> b!192578 m!219359))

(assert (=> b!192580 m!218945))

(assert (=> b!192580 m!219341))

(assert (=> b!192580 m!219341))

(assert (=> b!192580 m!219359))

(assert (=> b!192264 d!56453))

(assert (=> b!192294 d!56371))

(declare-fun d!56455 () Bool)

(declare-fun e!126704 () Bool)

(assert (=> d!56455 e!126704))

(declare-fun res!90983 () Bool)

(assert (=> d!56455 (=> (not res!90983) (not e!126704))))

(declare-fun lt!95754 () ListLongMap!2453)

(assert (=> d!56455 (= res!90983 (contains!1358 lt!95754 (_1!1779 (ite (or c!34643 c!34642) (tuple2!3537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3762 thiss!1248)) (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248))))))))

(declare-fun lt!95756 () List!2428)

(assert (=> d!56455 (= lt!95754 (ListLongMap!2454 lt!95756))))

(declare-fun lt!95755 () Unit!5811)

(declare-fun lt!95753 () Unit!5811)

(assert (=> d!56455 (= lt!95755 lt!95753)))

(assert (=> d!56455 (= (getValueByKey!240 lt!95756 (_1!1779 (ite (or c!34643 c!34642) (tuple2!3537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3762 thiss!1248)) (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248))))) (Some!245 (_2!1779 (ite (or c!34643 c!34642) (tuple2!3537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3762 thiss!1248)) (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248))))))))

(assert (=> d!56455 (= lt!95753 (lemmaContainsTupThenGetReturnValue!127 lt!95756 (_1!1779 (ite (or c!34643 c!34642) (tuple2!3537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3762 thiss!1248)) (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248)))) (_2!1779 (ite (or c!34643 c!34642) (tuple2!3537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3762 thiss!1248)) (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248))))))))

(assert (=> d!56455 (= lt!95756 (insertStrictlySorted!130 (toList!1242 (ite c!34643 call!19412 (ite c!34642 call!19414 call!19417))) (_1!1779 (ite (or c!34643 c!34642) (tuple2!3537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3762 thiss!1248)) (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248)))) (_2!1779 (ite (or c!34643 c!34642) (tuple2!3537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3762 thiss!1248)) (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248))))))))

(assert (=> d!56455 (= (+!310 (ite c!34643 call!19412 (ite c!34642 call!19414 call!19417)) (ite (or c!34643 c!34642) (tuple2!3537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3762 thiss!1248)) (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248)))) lt!95754)))

(declare-fun b!192581 () Bool)

(declare-fun res!90984 () Bool)

(assert (=> b!192581 (=> (not res!90984) (not e!126704))))

(assert (=> b!192581 (= res!90984 (= (getValueByKey!240 (toList!1242 lt!95754) (_1!1779 (ite (or c!34643 c!34642) (tuple2!3537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3762 thiss!1248)) (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248))))) (Some!245 (_2!1779 (ite (or c!34643 c!34642) (tuple2!3537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3762 thiss!1248)) (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248)))))))))

(declare-fun b!192582 () Bool)

(assert (=> b!192582 (= e!126704 (contains!1359 (toList!1242 lt!95754) (ite (or c!34643 c!34642) (tuple2!3537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3762 thiss!1248)) (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248)))))))

(assert (= (and d!56455 res!90983) b!192581))

(assert (= (and b!192581 res!90984) b!192582))

(declare-fun m!219361 () Bool)

(assert (=> d!56455 m!219361))

(declare-fun m!219363 () Bool)

(assert (=> d!56455 m!219363))

(declare-fun m!219365 () Bool)

(assert (=> d!56455 m!219365))

(declare-fun m!219367 () Bool)

(assert (=> d!56455 m!219367))

(declare-fun m!219369 () Bool)

(assert (=> b!192581 m!219369))

(declare-fun m!219371 () Bool)

(assert (=> b!192582 m!219371))

(assert (=> bm!19414 d!56455))

(declare-fun d!56457 () Bool)

(assert (=> d!56457 (= (inRange!0 (ite c!34628 (index!4894 lt!95500) (index!4897 lt!95500)) (mask!9151 thiss!1248)) (and (bvsge (ite c!34628 (index!4894 lt!95500) (index!4897 lt!95500)) #b00000000000000000000000000000000) (bvslt (ite c!34628 (index!4894 lt!95500) (index!4897 lt!95500)) (bvadd (mask!9151 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> bm!19393 d!56457))

(declare-fun b!192595 () Bool)

(declare-fun c!34742 () Bool)

(declare-fun lt!95762 () (_ BitVec 64))

(assert (=> b!192595 (= c!34742 (= lt!95762 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!126711 () SeekEntryResult!681)

(declare-fun e!126713 () SeekEntryResult!681)

(assert (=> b!192595 (= e!126711 e!126713)))

(declare-fun b!192596 () Bool)

(assert (=> b!192596 (= e!126713 (MissingVacant!681 (index!4896 lt!95629)))))

(declare-fun b!192597 () Bool)

(assert (=> b!192597 (= e!126713 (seekKeyOrZeroReturnVacant!0 (bvadd (x!20579 lt!95629) #b00000000000000000000000000000001) (nextIndex!0 (index!4896 lt!95629) (x!20579 lt!95629) (mask!9151 thiss!1248)) (index!4896 lt!95629) key!828 (_keys!5903 thiss!1248) (mask!9151 thiss!1248)))))

(declare-fun lt!95761 () SeekEntryResult!681)

(declare-fun d!56459 () Bool)

(assert (=> d!56459 (and (or ((_ is Undefined!681) lt!95761) (not ((_ is Found!681) lt!95761)) (and (bvsge (index!4895 lt!95761) #b00000000000000000000000000000000) (bvslt (index!4895 lt!95761) (size!4168 (_keys!5903 thiss!1248))))) (or ((_ is Undefined!681) lt!95761) ((_ is Found!681) lt!95761) (not ((_ is MissingVacant!681) lt!95761)) (not (= (index!4897 lt!95761) (index!4896 lt!95629))) (and (bvsge (index!4897 lt!95761) #b00000000000000000000000000000000) (bvslt (index!4897 lt!95761) (size!4168 (_keys!5903 thiss!1248))))) (or ((_ is Undefined!681) lt!95761) (ite ((_ is Found!681) lt!95761) (= (select (arr!3845 (_keys!5903 thiss!1248)) (index!4895 lt!95761)) key!828) (and ((_ is MissingVacant!681) lt!95761) (= (index!4897 lt!95761) (index!4896 lt!95629)) (= (select (arr!3845 (_keys!5903 thiss!1248)) (index!4897 lt!95761)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!126712 () SeekEntryResult!681)

(assert (=> d!56459 (= lt!95761 e!126712)))

(declare-fun c!34740 () Bool)

(assert (=> d!56459 (= c!34740 (bvsge (x!20579 lt!95629) #b01111111111111111111111111111110))))

(assert (=> d!56459 (= lt!95762 (select (arr!3845 (_keys!5903 thiss!1248)) (index!4896 lt!95629)))))

(assert (=> d!56459 (validMask!0 (mask!9151 thiss!1248))))

(assert (=> d!56459 (= (seekKeyOrZeroReturnVacant!0 (x!20579 lt!95629) (index!4896 lt!95629) (index!4896 lt!95629) key!828 (_keys!5903 thiss!1248) (mask!9151 thiss!1248)) lt!95761)))

(declare-fun b!192598 () Bool)

(assert (=> b!192598 (= e!126711 (Found!681 (index!4896 lt!95629)))))

(declare-fun b!192599 () Bool)

(assert (=> b!192599 (= e!126712 Undefined!681)))

(declare-fun b!192600 () Bool)

(assert (=> b!192600 (= e!126712 e!126711)))

(declare-fun c!34741 () Bool)

(assert (=> b!192600 (= c!34741 (= lt!95762 key!828))))

(assert (= (and d!56459 c!34740) b!192599))

(assert (= (and d!56459 (not c!34740)) b!192600))

(assert (= (and b!192600 c!34741) b!192598))

(assert (= (and b!192600 (not c!34741)) b!192595))

(assert (= (and b!192595 c!34742) b!192596))

(assert (= (and b!192595 (not c!34742)) b!192597))

(declare-fun m!219373 () Bool)

(assert (=> b!192597 m!219373))

(assert (=> b!192597 m!219373))

(declare-fun m!219375 () Bool)

(assert (=> b!192597 m!219375))

(declare-fun m!219377 () Bool)

(assert (=> d!56459 m!219377))

(declare-fun m!219379 () Bool)

(assert (=> d!56459 m!219379))

(assert (=> d!56459 m!219061))

(assert (=> d!56459 m!218845))

(assert (=> b!192331 d!56459))

(declare-fun d!56461 () Bool)

(assert (=> d!56461 (= (apply!183 lt!95596 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2220 (getValueByKey!240 (toList!1242 lt!95596) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7702 () Bool)

(assert (= bs!7702 d!56461))

(assert (=> bs!7702 m!219199))

(assert (=> bs!7702 m!219199))

(declare-fun m!219381 () Bool)

(assert (=> bs!7702 m!219381))

(assert (=> b!192292 d!56461))

(declare-fun d!56463 () Bool)

(declare-fun e!126715 () Bool)

(assert (=> d!56463 e!126715))

(declare-fun res!90985 () Bool)

(assert (=> d!56463 (=> res!90985 e!126715)))

(declare-fun lt!95764 () Bool)

(assert (=> d!56463 (= res!90985 (not lt!95764))))

(declare-fun lt!95766 () Bool)

(assert (=> d!56463 (= lt!95764 lt!95766)))

(declare-fun lt!95765 () Unit!5811)

(declare-fun e!126714 () Unit!5811)

(assert (=> d!56463 (= lt!95765 e!126714)))

(declare-fun c!34743 () Bool)

(assert (=> d!56463 (= c!34743 lt!95766)))

(assert (=> d!56463 (= lt!95766 (containsKey!244 (toList!1242 lt!95574) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56463 (= (contains!1358 lt!95574 #b1000000000000000000000000000000000000000000000000000000000000000) lt!95764)))

(declare-fun b!192601 () Bool)

(declare-fun lt!95763 () Unit!5811)

(assert (=> b!192601 (= e!126714 lt!95763)))

(assert (=> b!192601 (= lt!95763 (lemmaContainsKeyImpliesGetValueByKeyDefined!192 (toList!1242 lt!95574) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!192601 (isDefined!193 (getValueByKey!240 (toList!1242 lt!95574) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!192602 () Bool)

(declare-fun Unit!5826 () Unit!5811)

(assert (=> b!192602 (= e!126714 Unit!5826)))

(declare-fun b!192603 () Bool)

(assert (=> b!192603 (= e!126715 (isDefined!193 (getValueByKey!240 (toList!1242 lt!95574) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56463 c!34743) b!192601))

(assert (= (and d!56463 (not c!34743)) b!192602))

(assert (= (and d!56463 (not res!90985)) b!192603))

(declare-fun m!219383 () Bool)

(assert (=> d!56463 m!219383))

(declare-fun m!219385 () Bool)

(assert (=> b!192601 m!219385))

(declare-fun m!219387 () Bool)

(assert (=> b!192601 m!219387))

(assert (=> b!192601 m!219387))

(declare-fun m!219389 () Bool)

(assert (=> b!192601 m!219389))

(assert (=> b!192603 m!219387))

(assert (=> b!192603 m!219387))

(assert (=> b!192603 m!219389))

(assert (=> bm!19413 d!56463))

(declare-fun lt!95769 () Bool)

(declare-fun d!56465 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!154 (List!2428) (InoxSet tuple2!3536))

(assert (=> d!56465 (= lt!95769 (select (content!154 (toList!1242 lt!95517)) (tuple2!3537 key!828 v!309)))))

(declare-fun e!126720 () Bool)

(assert (=> d!56465 (= lt!95769 e!126720)))

(declare-fun res!90991 () Bool)

(assert (=> d!56465 (=> (not res!90991) (not e!126720))))

(assert (=> d!56465 (= res!90991 ((_ is Cons!2424) (toList!1242 lt!95517)))))

(assert (=> d!56465 (= (contains!1359 (toList!1242 lt!95517) (tuple2!3537 key!828 v!309)) lt!95769)))

(declare-fun b!192608 () Bool)

(declare-fun e!126721 () Bool)

(assert (=> b!192608 (= e!126720 e!126721)))

(declare-fun res!90990 () Bool)

(assert (=> b!192608 (=> res!90990 e!126721)))

(assert (=> b!192608 (= res!90990 (= (h!3064 (toList!1242 lt!95517)) (tuple2!3537 key!828 v!309)))))

(declare-fun b!192609 () Bool)

(assert (=> b!192609 (= e!126721 (contains!1359 (t!7344 (toList!1242 lt!95517)) (tuple2!3537 key!828 v!309)))))

(assert (= (and d!56465 res!90991) b!192608))

(assert (= (and b!192608 (not res!90990)) b!192609))

(declare-fun m!219391 () Bool)

(assert (=> d!56465 m!219391))

(declare-fun m!219393 () Bool)

(assert (=> d!56465 m!219393))

(declare-fun m!219395 () Bool)

(assert (=> b!192609 m!219395))

(assert (=> b!192218 d!56465))

(declare-fun d!56467 () Bool)

(declare-fun res!90996 () Bool)

(declare-fun e!126726 () Bool)

(assert (=> d!56467 (=> res!90996 e!126726)))

(assert (=> d!56467 (= res!90996 (= (select (arr!3845 (_keys!5903 thiss!1248)) #b00000000000000000000000000000000) key!828))))

(assert (=> d!56467 (= (arrayContainsKey!0 (_keys!5903 thiss!1248) key!828 #b00000000000000000000000000000000) e!126726)))

(declare-fun b!192614 () Bool)

(declare-fun e!126727 () Bool)

(assert (=> b!192614 (= e!126726 e!126727)))

(declare-fun res!90997 () Bool)

(assert (=> b!192614 (=> (not res!90997) (not e!126727))))

(assert (=> b!192614 (= res!90997 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4168 (_keys!5903 thiss!1248))))))

(declare-fun b!192615 () Bool)

(assert (=> b!192615 (= e!126727 (arrayContainsKey!0 (_keys!5903 thiss!1248) key!828 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!56467 (not res!90996)) b!192614))

(assert (= (and b!192614 res!90997) b!192615))

(assert (=> d!56467 m!218945))

(declare-fun m!219397 () Bool)

(assert (=> b!192615 m!219397))

(assert (=> bm!19392 d!56467))

(declare-fun d!56469 () Bool)

(assert (=> d!56469 (= (apply!183 lt!95574 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2220 (getValueByKey!240 (toList!1242 lt!95574) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7703 () Bool)

(assert (= bs!7703 d!56469))

(assert (=> bs!7703 m!219387))

(assert (=> bs!7703 m!219387))

(declare-fun m!219399 () Bool)

(assert (=> bs!7703 m!219399))

(assert (=> b!192268 d!56469))

(assert (=> d!56337 d!56357))

(declare-fun d!56471 () Bool)

(declare-fun e!126730 () Bool)

(assert (=> d!56471 e!126730))

(declare-fun res!91003 () Bool)

(assert (=> d!56471 (=> (not res!91003) (not e!126730))))

(declare-fun lt!95772 () SeekEntryResult!681)

(assert (=> d!56471 (= res!91003 ((_ is Found!681) lt!95772))))

(assert (=> d!56471 (= lt!95772 (seekEntryOrOpen!0 key!828 (_keys!5903 thiss!1248) (mask!9151 thiss!1248)))))

(assert (=> d!56471 true))

(declare-fun _$33!147 () Unit!5811)

(assert (=> d!56471 (= (choose!1045 (_keys!5903 thiss!1248) (_values!3904 thiss!1248) (mask!9151 thiss!1248) (extraKeys!3658 thiss!1248) (zeroValue!3762 thiss!1248) (minValue!3762 thiss!1248) key!828 (defaultEntry!3921 thiss!1248)) _$33!147)))

(declare-fun b!192620 () Bool)

(declare-fun res!91002 () Bool)

(assert (=> b!192620 (=> (not res!91002) (not e!126730))))

(assert (=> b!192620 (= res!91002 (inRange!0 (index!4895 lt!95772) (mask!9151 thiss!1248)))))

(declare-fun b!192621 () Bool)

(assert (=> b!192621 (= e!126730 (= (select (arr!3845 (_keys!5903 thiss!1248)) (index!4895 lt!95772)) key!828))))

(assert (= (and d!56471 res!91003) b!192620))

(assert (= (and b!192620 res!91002) b!192621))

(assert (=> d!56471 m!218867))

(declare-fun m!219401 () Bool)

(assert (=> b!192620 m!219401))

(declare-fun m!219403 () Bool)

(assert (=> b!192621 m!219403))

(assert (=> d!56337 d!56471))

(assert (=> d!56337 d!56343))

(assert (=> d!56333 d!56357))

(declare-fun d!56473 () Bool)

(declare-fun e!126739 () Bool)

(assert (=> d!56473 e!126739))

(declare-fun c!34749 () Bool)

(declare-fun lt!95775 () SeekEntryResult!681)

(assert (=> d!56473 (= c!34749 ((_ is MissingZero!681) lt!95775))))

(assert (=> d!56473 (= lt!95775 (seekEntryOrOpen!0 key!828 (_keys!5903 thiss!1248) (mask!9151 thiss!1248)))))

(assert (=> d!56473 true))

(declare-fun _$34!1084 () Unit!5811)

(assert (=> d!56473 (= (choose!1044 (_keys!5903 thiss!1248) (_values!3904 thiss!1248) (mask!9151 thiss!1248) (extraKeys!3658 thiss!1248) (zeroValue!3762 thiss!1248) (minValue!3762 thiss!1248) key!828 (defaultEntry!3921 thiss!1248)) _$34!1084)))

(declare-fun b!192638 () Bool)

(declare-fun e!126740 () Bool)

(assert (=> b!192638 (= e!126739 e!126740)))

(declare-fun res!91015 () Bool)

(declare-fun call!19451 () Bool)

(assert (=> b!192638 (= res!91015 call!19451)))

(assert (=> b!192638 (=> (not res!91015) (not e!126740))))

(declare-fun bm!19448 () Bool)

(declare-fun call!19452 () Bool)

(assert (=> bm!19448 (= call!19452 (arrayContainsKey!0 (_keys!5903 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!192639 () Bool)

(declare-fun res!91014 () Bool)

(declare-fun e!126741 () Bool)

(assert (=> b!192639 (=> (not res!91014) (not e!126741))))

(assert (=> b!192639 (= res!91014 call!19451)))

(declare-fun e!126742 () Bool)

(assert (=> b!192639 (= e!126742 e!126741)))

(declare-fun b!192640 () Bool)

(assert (=> b!192640 (= e!126742 ((_ is Undefined!681) lt!95775))))

(declare-fun b!192641 () Bool)

(declare-fun res!91012 () Bool)

(assert (=> b!192641 (= res!91012 (= (select (arr!3845 (_keys!5903 thiss!1248)) (index!4894 lt!95775)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!192641 (=> (not res!91012) (not e!126740))))

(declare-fun bm!19449 () Bool)

(assert (=> bm!19449 (= call!19451 (inRange!0 (ite c!34749 (index!4894 lt!95775) (index!4897 lt!95775)) (mask!9151 thiss!1248)))))

(declare-fun b!192642 () Bool)

(declare-fun res!91013 () Bool)

(assert (=> b!192642 (=> (not res!91013) (not e!126741))))

(assert (=> b!192642 (= res!91013 (= (select (arr!3845 (_keys!5903 thiss!1248)) (index!4897 lt!95775)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!192643 () Bool)

(assert (=> b!192643 (= e!126739 e!126742)))

(declare-fun c!34748 () Bool)

(assert (=> b!192643 (= c!34748 ((_ is MissingVacant!681) lt!95775))))

(declare-fun b!192644 () Bool)

(assert (=> b!192644 (= e!126740 (not call!19452))))

(declare-fun b!192645 () Bool)

(assert (=> b!192645 (= e!126741 (not call!19452))))

(assert (= (and d!56473 c!34749) b!192638))

(assert (= (and d!56473 (not c!34749)) b!192643))

(assert (= (and b!192638 res!91015) b!192641))

(assert (= (and b!192641 res!91012) b!192644))

(assert (= (and b!192643 c!34748) b!192639))

(assert (= (and b!192643 (not c!34748)) b!192640))

(assert (= (and b!192639 res!91014) b!192642))

(assert (= (and b!192642 res!91013) b!192645))

(assert (= (or b!192638 b!192639) bm!19449))

(assert (= (or b!192644 b!192645) bm!19448))

(declare-fun m!219405 () Bool)

(assert (=> b!192642 m!219405))

(declare-fun m!219407 () Bool)

(assert (=> b!192641 m!219407))

(assert (=> d!56473 m!218867))

(declare-fun m!219409 () Bool)

(assert (=> bm!19449 m!219409))

(assert (=> bm!19448 m!218909))

(assert (=> d!56333 d!56473))

(assert (=> d!56333 d!56343))

(declare-fun d!56475 () Bool)

(declare-fun e!126744 () Bool)

(assert (=> d!56475 e!126744))

(declare-fun res!91016 () Bool)

(assert (=> d!56475 (=> res!91016 e!126744)))

(declare-fun lt!95777 () Bool)

(assert (=> d!56475 (= res!91016 (not lt!95777))))

(declare-fun lt!95779 () Bool)

(assert (=> d!56475 (= lt!95777 lt!95779)))

(declare-fun lt!95778 () Unit!5811)

(declare-fun e!126743 () Unit!5811)

(assert (=> d!56475 (= lt!95778 e!126743)))

(declare-fun c!34750 () Bool)

(assert (=> d!56475 (= c!34750 lt!95779)))

(assert (=> d!56475 (= lt!95779 (containsKey!244 (toList!1242 lt!95574) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56475 (= (contains!1358 lt!95574 #b0000000000000000000000000000000000000000000000000000000000000000) lt!95777)))

(declare-fun b!192646 () Bool)

(declare-fun lt!95776 () Unit!5811)

(assert (=> b!192646 (= e!126743 lt!95776)))

(assert (=> b!192646 (= lt!95776 (lemmaContainsKeyImpliesGetValueByKeyDefined!192 (toList!1242 lt!95574) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!192646 (isDefined!193 (getValueByKey!240 (toList!1242 lt!95574) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!192647 () Bool)

(declare-fun Unit!5827 () Unit!5811)

(assert (=> b!192647 (= e!126743 Unit!5827)))

(declare-fun b!192648 () Bool)

(assert (=> b!192648 (= e!126744 (isDefined!193 (getValueByKey!240 (toList!1242 lt!95574) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56475 c!34750) b!192646))

(assert (= (and d!56475 (not c!34750)) b!192647))

(assert (= (and d!56475 (not res!91016)) b!192648))

(declare-fun m!219411 () Bool)

(assert (=> d!56475 m!219411))

(declare-fun m!219413 () Bool)

(assert (=> b!192646 m!219413))

(assert (=> b!192646 m!219163))

(assert (=> b!192646 m!219163))

(declare-fun m!219415 () Bool)

(assert (=> b!192646 m!219415))

(assert (=> b!192648 m!219163))

(assert (=> b!192648 m!219163))

(assert (=> b!192648 m!219415))

(assert (=> bm!19408 d!56475))

(assert (=> b!192313 d!56449))

(assert (=> b!192313 d!56451))

(declare-fun d!56477 () Bool)

(declare-fun e!126745 () Bool)

(assert (=> d!56477 e!126745))

(declare-fun res!91017 () Bool)

(assert (=> d!56477 (=> (not res!91017) (not e!126745))))

(declare-fun lt!95781 () ListLongMap!2453)

(assert (=> d!56477 (= res!91017 (contains!1358 lt!95781 (_1!1779 (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248)))))))

(declare-fun lt!95783 () List!2428)

(assert (=> d!56477 (= lt!95781 (ListLongMap!2454 lt!95783))))

(declare-fun lt!95782 () Unit!5811)

(declare-fun lt!95780 () Unit!5811)

(assert (=> d!56477 (= lt!95782 lt!95780)))

(assert (=> d!56477 (= (getValueByKey!240 lt!95783 (_1!1779 (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248)))) (Some!245 (_2!1779 (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248)))))))

(assert (=> d!56477 (= lt!95780 (lemmaContainsTupThenGetReturnValue!127 lt!95783 (_1!1779 (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248))) (_2!1779 (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248)))))))

(assert (=> d!56477 (= lt!95783 (insertStrictlySorted!130 (toList!1242 call!19411) (_1!1779 (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248))) (_2!1779 (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248)))))))

(assert (=> d!56477 (= (+!310 call!19411 (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248))) lt!95781)))

(declare-fun b!192649 () Bool)

(declare-fun res!91018 () Bool)

(assert (=> b!192649 (=> (not res!91018) (not e!126745))))

(assert (=> b!192649 (= res!91018 (= (getValueByKey!240 (toList!1242 lt!95781) (_1!1779 (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248)))) (Some!245 (_2!1779 (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248))))))))

(declare-fun b!192650 () Bool)

(assert (=> b!192650 (= e!126745 (contains!1359 (toList!1242 lt!95781) (tuple2!3537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3762 thiss!1248))))))

(assert (= (and d!56477 res!91017) b!192649))

(assert (= (and b!192649 res!91018) b!192650))

(declare-fun m!219417 () Bool)

(assert (=> d!56477 m!219417))

(declare-fun m!219419 () Bool)

(assert (=> d!56477 m!219419))

(declare-fun m!219421 () Bool)

(assert (=> d!56477 m!219421))

(declare-fun m!219423 () Bool)

(assert (=> d!56477 m!219423))

(declare-fun m!219425 () Bool)

(assert (=> b!192649 m!219425))

(declare-fun m!219427 () Bool)

(assert (=> b!192650 m!219427))

(assert (=> b!192280 d!56477))

(declare-fun d!56479 () Bool)

(assert (=> d!56479 (= (apply!183 (+!310 lt!95577 (tuple2!3537 lt!95567 (minValue!3762 thiss!1248))) lt!95568) (get!2220 (getValueByKey!240 (toList!1242 (+!310 lt!95577 (tuple2!3537 lt!95567 (minValue!3762 thiss!1248)))) lt!95568)))))

(declare-fun bs!7704 () Bool)

(assert (= bs!7704 d!56479))

(declare-fun m!219429 () Bool)

(assert (=> bs!7704 m!219429))

(assert (=> bs!7704 m!219429))

(declare-fun m!219431 () Bool)

(assert (=> bs!7704 m!219431))

(assert (=> b!192266 d!56479))

(declare-fun d!56481 () Bool)

(declare-fun e!126746 () Bool)

(assert (=> d!56481 e!126746))

(declare-fun res!91019 () Bool)

(assert (=> d!56481 (=> (not res!91019) (not e!126746))))

(declare-fun lt!95785 () ListLongMap!2453)

(assert (=> d!56481 (= res!91019 (contains!1358 lt!95785 (_1!1779 (tuple2!3537 lt!95567 (minValue!3762 thiss!1248)))))))

(declare-fun lt!95787 () List!2428)

(assert (=> d!56481 (= lt!95785 (ListLongMap!2454 lt!95787))))

(declare-fun lt!95786 () Unit!5811)

(declare-fun lt!95784 () Unit!5811)

(assert (=> d!56481 (= lt!95786 lt!95784)))

(assert (=> d!56481 (= (getValueByKey!240 lt!95787 (_1!1779 (tuple2!3537 lt!95567 (minValue!3762 thiss!1248)))) (Some!245 (_2!1779 (tuple2!3537 lt!95567 (minValue!3762 thiss!1248)))))))

(assert (=> d!56481 (= lt!95784 (lemmaContainsTupThenGetReturnValue!127 lt!95787 (_1!1779 (tuple2!3537 lt!95567 (minValue!3762 thiss!1248))) (_2!1779 (tuple2!3537 lt!95567 (minValue!3762 thiss!1248)))))))

(assert (=> d!56481 (= lt!95787 (insertStrictlySorted!130 (toList!1242 lt!95577) (_1!1779 (tuple2!3537 lt!95567 (minValue!3762 thiss!1248))) (_2!1779 (tuple2!3537 lt!95567 (minValue!3762 thiss!1248)))))))

(assert (=> d!56481 (= (+!310 lt!95577 (tuple2!3537 lt!95567 (minValue!3762 thiss!1248))) lt!95785)))

(declare-fun b!192651 () Bool)

(declare-fun res!91020 () Bool)

(assert (=> b!192651 (=> (not res!91020) (not e!126746))))

(assert (=> b!192651 (= res!91020 (= (getValueByKey!240 (toList!1242 lt!95785) (_1!1779 (tuple2!3537 lt!95567 (minValue!3762 thiss!1248)))) (Some!245 (_2!1779 (tuple2!3537 lt!95567 (minValue!3762 thiss!1248))))))))

(declare-fun b!192652 () Bool)

(assert (=> b!192652 (= e!126746 (contains!1359 (toList!1242 lt!95785) (tuple2!3537 lt!95567 (minValue!3762 thiss!1248))))))

(assert (= (and d!56481 res!91019) b!192651))

(assert (= (and b!192651 res!91020) b!192652))

(declare-fun m!219433 () Bool)

(assert (=> d!56481 m!219433))

(declare-fun m!219435 () Bool)

(assert (=> d!56481 m!219435))

(declare-fun m!219437 () Bool)

(assert (=> d!56481 m!219437))

(declare-fun m!219439 () Bool)

(assert (=> d!56481 m!219439))

(declare-fun m!219441 () Bool)

(assert (=> b!192651 m!219441))

(declare-fun m!219443 () Bool)

(assert (=> b!192652 m!219443))

(assert (=> b!192266 d!56481))

(declare-fun d!56483 () Bool)

(assert (=> d!56483 (= (apply!183 lt!95577 lt!95568) (get!2220 (getValueByKey!240 (toList!1242 lt!95577) lt!95568)))))

(declare-fun bs!7705 () Bool)

(assert (= bs!7705 d!56483))

(declare-fun m!219445 () Bool)

(assert (=> bs!7705 m!219445))

(assert (=> bs!7705 m!219445))

(declare-fun m!219447 () Bool)

(assert (=> bs!7705 m!219447))

(assert (=> b!192266 d!56483))

(declare-fun d!56485 () Bool)

(declare-fun e!126747 () Bool)

(assert (=> d!56485 e!126747))

(declare-fun res!91021 () Bool)

(assert (=> d!56485 (=> (not res!91021) (not e!126747))))

(declare-fun lt!95789 () ListLongMap!2453)

(assert (=> d!56485 (= res!91021 (contains!1358 lt!95789 (_1!1779 (tuple2!3537 lt!95569 (zeroValue!3762 thiss!1248)))))))

(declare-fun lt!95791 () List!2428)

(assert (=> d!56485 (= lt!95789 (ListLongMap!2454 lt!95791))))

(declare-fun lt!95790 () Unit!5811)

(declare-fun lt!95788 () Unit!5811)

(assert (=> d!56485 (= lt!95790 lt!95788)))

(assert (=> d!56485 (= (getValueByKey!240 lt!95791 (_1!1779 (tuple2!3537 lt!95569 (zeroValue!3762 thiss!1248)))) (Some!245 (_2!1779 (tuple2!3537 lt!95569 (zeroValue!3762 thiss!1248)))))))

(assert (=> d!56485 (= lt!95788 (lemmaContainsTupThenGetReturnValue!127 lt!95791 (_1!1779 (tuple2!3537 lt!95569 (zeroValue!3762 thiss!1248))) (_2!1779 (tuple2!3537 lt!95569 (zeroValue!3762 thiss!1248)))))))

(assert (=> d!56485 (= lt!95791 (insertStrictlySorted!130 (toList!1242 lt!95582) (_1!1779 (tuple2!3537 lt!95569 (zeroValue!3762 thiss!1248))) (_2!1779 (tuple2!3537 lt!95569 (zeroValue!3762 thiss!1248)))))))

(assert (=> d!56485 (= (+!310 lt!95582 (tuple2!3537 lt!95569 (zeroValue!3762 thiss!1248))) lt!95789)))

(declare-fun b!192653 () Bool)

(declare-fun res!91022 () Bool)

(assert (=> b!192653 (=> (not res!91022) (not e!126747))))

(assert (=> b!192653 (= res!91022 (= (getValueByKey!240 (toList!1242 lt!95789) (_1!1779 (tuple2!3537 lt!95569 (zeroValue!3762 thiss!1248)))) (Some!245 (_2!1779 (tuple2!3537 lt!95569 (zeroValue!3762 thiss!1248))))))))

(declare-fun b!192654 () Bool)

(assert (=> b!192654 (= e!126747 (contains!1359 (toList!1242 lt!95789) (tuple2!3537 lt!95569 (zeroValue!3762 thiss!1248))))))

(assert (= (and d!56485 res!91021) b!192653))

(assert (= (and b!192653 res!91022) b!192654))

(declare-fun m!219449 () Bool)

(assert (=> d!56485 m!219449))

(declare-fun m!219451 () Bool)

(assert (=> d!56485 m!219451))

(declare-fun m!219453 () Bool)

(assert (=> d!56485 m!219453))

(declare-fun m!219455 () Bool)

(assert (=> d!56485 m!219455))

(declare-fun m!219457 () Bool)

(assert (=> b!192653 m!219457))

(declare-fun m!219459 () Bool)

(assert (=> b!192654 m!219459))

(assert (=> b!192266 d!56485))

(declare-fun d!56487 () Bool)

(declare-fun e!126749 () Bool)

(assert (=> d!56487 e!126749))

(declare-fun res!91023 () Bool)

(assert (=> d!56487 (=> res!91023 e!126749)))

(declare-fun lt!95793 () Bool)

(assert (=> d!56487 (= res!91023 (not lt!95793))))

(declare-fun lt!95795 () Bool)

(assert (=> d!56487 (= lt!95793 lt!95795)))

(declare-fun lt!95794 () Unit!5811)

(declare-fun e!126748 () Unit!5811)

(assert (=> d!56487 (= lt!95794 e!126748)))

(declare-fun c!34751 () Bool)

(assert (=> d!56487 (= c!34751 lt!95795)))

(assert (=> d!56487 (= lt!95795 (containsKey!244 (toList!1242 (+!310 lt!95582 (tuple2!3537 lt!95569 (zeroValue!3762 thiss!1248)))) lt!95576))))

(assert (=> d!56487 (= (contains!1358 (+!310 lt!95582 (tuple2!3537 lt!95569 (zeroValue!3762 thiss!1248))) lt!95576) lt!95793)))

(declare-fun b!192655 () Bool)

(declare-fun lt!95792 () Unit!5811)

(assert (=> b!192655 (= e!126748 lt!95792)))

(assert (=> b!192655 (= lt!95792 (lemmaContainsKeyImpliesGetValueByKeyDefined!192 (toList!1242 (+!310 lt!95582 (tuple2!3537 lt!95569 (zeroValue!3762 thiss!1248)))) lt!95576))))

(assert (=> b!192655 (isDefined!193 (getValueByKey!240 (toList!1242 (+!310 lt!95582 (tuple2!3537 lt!95569 (zeroValue!3762 thiss!1248)))) lt!95576))))

(declare-fun b!192656 () Bool)

(declare-fun Unit!5828 () Unit!5811)

(assert (=> b!192656 (= e!126748 Unit!5828)))

(declare-fun b!192657 () Bool)

(assert (=> b!192657 (= e!126749 (isDefined!193 (getValueByKey!240 (toList!1242 (+!310 lt!95582 (tuple2!3537 lt!95569 (zeroValue!3762 thiss!1248)))) lt!95576)))))

(assert (= (and d!56487 c!34751) b!192655))

(assert (= (and d!56487 (not c!34751)) b!192656))

(assert (= (and d!56487 (not res!91023)) b!192657))

(declare-fun m!219461 () Bool)

(assert (=> d!56487 m!219461))

(declare-fun m!219463 () Bool)

(assert (=> b!192655 m!219463))

(declare-fun m!219465 () Bool)

(assert (=> b!192655 m!219465))

(assert (=> b!192655 m!219465))

(declare-fun m!219467 () Bool)

(assert (=> b!192655 m!219467))

(assert (=> b!192657 m!219465))

(assert (=> b!192657 m!219465))

(assert (=> b!192657 m!219467))

(assert (=> b!192266 d!56487))

(declare-fun d!56489 () Bool)

(assert (=> d!56489 (contains!1358 (+!310 lt!95582 (tuple2!3537 lt!95569 (zeroValue!3762 thiss!1248))) lt!95576)))

(declare-fun lt!95796 () Unit!5811)

(assert (=> d!56489 (= lt!95796 (choose!1049 lt!95582 lt!95569 (zeroValue!3762 thiss!1248) lt!95576))))

(assert (=> d!56489 (contains!1358 lt!95582 lt!95576)))

(assert (=> d!56489 (= (addStillContains!159 lt!95582 lt!95569 (zeroValue!3762 thiss!1248) lt!95576) lt!95796)))

(declare-fun bs!7706 () Bool)

(assert (= bs!7706 d!56489))

(assert (=> bs!7706 m!218953))

(assert (=> bs!7706 m!218953))

(assert (=> bs!7706 m!218969))

(declare-fun m!219469 () Bool)

(assert (=> bs!7706 m!219469))

(declare-fun m!219471 () Bool)

(assert (=> bs!7706 m!219471))

(assert (=> b!192266 d!56489))

(declare-fun d!56491 () Bool)

(assert (=> d!56491 (= (apply!183 (+!310 lt!95573 (tuple2!3537 lt!95585 (zeroValue!3762 thiss!1248))) lt!95579) (apply!183 lt!95573 lt!95579))))

(declare-fun lt!95797 () Unit!5811)

(assert (=> d!56491 (= lt!95797 (choose!1048 lt!95573 lt!95585 (zeroValue!3762 thiss!1248) lt!95579))))

(declare-fun e!126750 () Bool)

(assert (=> d!56491 e!126750))

(declare-fun res!91024 () Bool)

(assert (=> d!56491 (=> (not res!91024) (not e!126750))))

(assert (=> d!56491 (= res!91024 (contains!1358 lt!95573 lt!95579))))

(assert (=> d!56491 (= (addApplyDifferent!159 lt!95573 lt!95585 (zeroValue!3762 thiss!1248) lt!95579) lt!95797)))

(declare-fun b!192658 () Bool)

(assert (=> b!192658 (= e!126750 (not (= lt!95579 lt!95585)))))

(assert (= (and d!56491 res!91024) b!192658))

(assert (=> d!56491 m!218971))

(assert (=> d!56491 m!218973))

(assert (=> d!56491 m!218971))

(declare-fun m!219473 () Bool)

(assert (=> d!56491 m!219473))

(assert (=> d!56491 m!218951))

(declare-fun m!219475 () Bool)

(assert (=> d!56491 m!219475))

(assert (=> b!192266 d!56491))

(declare-fun d!56493 () Bool)

(assert (=> d!56493 (= (apply!183 (+!310 lt!95572 (tuple2!3537 lt!95570 (minValue!3762 thiss!1248))) lt!95581) (get!2220 (getValueByKey!240 (toList!1242 (+!310 lt!95572 (tuple2!3537 lt!95570 (minValue!3762 thiss!1248)))) lt!95581)))))

(declare-fun bs!7707 () Bool)

(assert (= bs!7707 d!56493))

(declare-fun m!219477 () Bool)

(assert (=> bs!7707 m!219477))

(assert (=> bs!7707 m!219477))

(declare-fun m!219479 () Bool)

(assert (=> bs!7707 m!219479))

(assert (=> b!192266 d!56493))

(declare-fun d!56495 () Bool)

(assert (=> d!56495 (= (apply!183 lt!95573 lt!95579) (get!2220 (getValueByKey!240 (toList!1242 lt!95573) lt!95579)))))

(declare-fun bs!7708 () Bool)

(assert (= bs!7708 d!56495))

(declare-fun m!219481 () Bool)

(assert (=> bs!7708 m!219481))

(assert (=> bs!7708 m!219481))

(declare-fun m!219483 () Bool)

(assert (=> bs!7708 m!219483))

(assert (=> b!192266 d!56495))

(declare-fun d!56497 () Bool)

(assert (=> d!56497 (= (apply!183 lt!95572 lt!95581) (get!2220 (getValueByKey!240 (toList!1242 lt!95572) lt!95581)))))

(declare-fun bs!7709 () Bool)

(assert (= bs!7709 d!56497))

(declare-fun m!219485 () Bool)

(assert (=> bs!7709 m!219485))

(assert (=> bs!7709 m!219485))

(declare-fun m!219487 () Bool)

(assert (=> bs!7709 m!219487))

(assert (=> b!192266 d!56497))

(declare-fun d!56499 () Bool)

(assert (=> d!56499 (= (apply!183 (+!310 lt!95572 (tuple2!3537 lt!95570 (minValue!3762 thiss!1248))) lt!95581) (apply!183 lt!95572 lt!95581))))

(declare-fun lt!95798 () Unit!5811)

(assert (=> d!56499 (= lt!95798 (choose!1048 lt!95572 lt!95570 (minValue!3762 thiss!1248) lt!95581))))

(declare-fun e!126751 () Bool)

(assert (=> d!56499 e!126751))

(declare-fun res!91025 () Bool)

(assert (=> d!56499 (=> (not res!91025) (not e!126751))))

(assert (=> d!56499 (= res!91025 (contains!1358 lt!95572 lt!95581))))

(assert (=> d!56499 (= (addApplyDifferent!159 lt!95572 lt!95570 (minValue!3762 thiss!1248) lt!95581) lt!95798)))

(declare-fun b!192659 () Bool)

(assert (=> b!192659 (= e!126751 (not (= lt!95581 lt!95570)))))

(assert (= (and d!56499 res!91025) b!192659))

(assert (=> d!56499 m!218959))

(assert (=> d!56499 m!218961))

(assert (=> d!56499 m!218959))

(declare-fun m!219489 () Bool)

(assert (=> d!56499 m!219489))

(assert (=> d!56499 m!218963))

(declare-fun m!219491 () Bool)

(assert (=> d!56499 m!219491))

(assert (=> b!192266 d!56499))

(assert (=> b!192266 d!56359))

(declare-fun d!56501 () Bool)

(assert (=> d!56501 (= (apply!183 (+!310 lt!95573 (tuple2!3537 lt!95585 (zeroValue!3762 thiss!1248))) lt!95579) (get!2220 (getValueByKey!240 (toList!1242 (+!310 lt!95573 (tuple2!3537 lt!95585 (zeroValue!3762 thiss!1248)))) lt!95579)))))

(declare-fun bs!7710 () Bool)

(assert (= bs!7710 d!56501))

(declare-fun m!219493 () Bool)

(assert (=> bs!7710 m!219493))

(assert (=> bs!7710 m!219493))

(declare-fun m!219495 () Bool)

(assert (=> bs!7710 m!219495))

(assert (=> b!192266 d!56501))

(declare-fun d!56503 () Bool)

(declare-fun e!126752 () Bool)

(assert (=> d!56503 e!126752))

(declare-fun res!91026 () Bool)

(assert (=> d!56503 (=> (not res!91026) (not e!126752))))

(declare-fun lt!95800 () ListLongMap!2453)

(assert (=> d!56503 (= res!91026 (contains!1358 lt!95800 (_1!1779 (tuple2!3537 lt!95585 (zeroValue!3762 thiss!1248)))))))

(declare-fun lt!95802 () List!2428)

(assert (=> d!56503 (= lt!95800 (ListLongMap!2454 lt!95802))))

(declare-fun lt!95801 () Unit!5811)

(declare-fun lt!95799 () Unit!5811)

(assert (=> d!56503 (= lt!95801 lt!95799)))

(assert (=> d!56503 (= (getValueByKey!240 lt!95802 (_1!1779 (tuple2!3537 lt!95585 (zeroValue!3762 thiss!1248)))) (Some!245 (_2!1779 (tuple2!3537 lt!95585 (zeroValue!3762 thiss!1248)))))))

(assert (=> d!56503 (= lt!95799 (lemmaContainsTupThenGetReturnValue!127 lt!95802 (_1!1779 (tuple2!3537 lt!95585 (zeroValue!3762 thiss!1248))) (_2!1779 (tuple2!3537 lt!95585 (zeroValue!3762 thiss!1248)))))))

(assert (=> d!56503 (= lt!95802 (insertStrictlySorted!130 (toList!1242 lt!95573) (_1!1779 (tuple2!3537 lt!95585 (zeroValue!3762 thiss!1248))) (_2!1779 (tuple2!3537 lt!95585 (zeroValue!3762 thiss!1248)))))))

(assert (=> d!56503 (= (+!310 lt!95573 (tuple2!3537 lt!95585 (zeroValue!3762 thiss!1248))) lt!95800)))

(declare-fun b!192660 () Bool)

(declare-fun res!91027 () Bool)

(assert (=> b!192660 (=> (not res!91027) (not e!126752))))

(assert (=> b!192660 (= res!91027 (= (getValueByKey!240 (toList!1242 lt!95800) (_1!1779 (tuple2!3537 lt!95585 (zeroValue!3762 thiss!1248)))) (Some!245 (_2!1779 (tuple2!3537 lt!95585 (zeroValue!3762 thiss!1248))))))))

(declare-fun b!192661 () Bool)

(assert (=> b!192661 (= e!126752 (contains!1359 (toList!1242 lt!95800) (tuple2!3537 lt!95585 (zeroValue!3762 thiss!1248))))))

(assert (= (and d!56503 res!91026) b!192660))

(assert (= (and b!192660 res!91027) b!192661))

(declare-fun m!219497 () Bool)

(assert (=> d!56503 m!219497))

(declare-fun m!219499 () Bool)

(assert (=> d!56503 m!219499))

(declare-fun m!219501 () Bool)

(assert (=> d!56503 m!219501))

(declare-fun m!219503 () Bool)

(assert (=> d!56503 m!219503))

(declare-fun m!219505 () Bool)

(assert (=> b!192660 m!219505))

(declare-fun m!219507 () Bool)

(assert (=> b!192661 m!219507))

(assert (=> b!192266 d!56503))

(declare-fun d!56505 () Bool)

(assert (=> d!56505 (= (apply!183 (+!310 lt!95577 (tuple2!3537 lt!95567 (minValue!3762 thiss!1248))) lt!95568) (apply!183 lt!95577 lt!95568))))

(declare-fun lt!95803 () Unit!5811)

(assert (=> d!56505 (= lt!95803 (choose!1048 lt!95577 lt!95567 (minValue!3762 thiss!1248) lt!95568))))

(declare-fun e!126753 () Bool)

(assert (=> d!56505 e!126753))

(declare-fun res!91028 () Bool)

(assert (=> d!56505 (=> (not res!91028) (not e!126753))))

(assert (=> d!56505 (= res!91028 (contains!1358 lt!95577 lt!95568))))

(assert (=> d!56505 (= (addApplyDifferent!159 lt!95577 lt!95567 (minValue!3762 thiss!1248) lt!95568) lt!95803)))

(declare-fun b!192662 () Bool)

(assert (=> b!192662 (= e!126753 (not (= lt!95568 lt!95567)))))

(assert (= (and d!56505 res!91028) b!192662))

(assert (=> d!56505 m!218979))

(assert (=> d!56505 m!218981))

(assert (=> d!56505 m!218979))

(declare-fun m!219509 () Bool)

(assert (=> d!56505 m!219509))

(assert (=> d!56505 m!218977))

(declare-fun m!219511 () Bool)

(assert (=> d!56505 m!219511))

(assert (=> b!192266 d!56505))

(declare-fun d!56507 () Bool)

(declare-fun e!126754 () Bool)

(assert (=> d!56507 e!126754))

(declare-fun res!91029 () Bool)

(assert (=> d!56507 (=> (not res!91029) (not e!126754))))

(declare-fun lt!95805 () ListLongMap!2453)

(assert (=> d!56507 (= res!91029 (contains!1358 lt!95805 (_1!1779 (tuple2!3537 lt!95570 (minValue!3762 thiss!1248)))))))

(declare-fun lt!95807 () List!2428)

(assert (=> d!56507 (= lt!95805 (ListLongMap!2454 lt!95807))))

(declare-fun lt!95806 () Unit!5811)

(declare-fun lt!95804 () Unit!5811)

(assert (=> d!56507 (= lt!95806 lt!95804)))

(assert (=> d!56507 (= (getValueByKey!240 lt!95807 (_1!1779 (tuple2!3537 lt!95570 (minValue!3762 thiss!1248)))) (Some!245 (_2!1779 (tuple2!3537 lt!95570 (minValue!3762 thiss!1248)))))))

(assert (=> d!56507 (= lt!95804 (lemmaContainsTupThenGetReturnValue!127 lt!95807 (_1!1779 (tuple2!3537 lt!95570 (minValue!3762 thiss!1248))) (_2!1779 (tuple2!3537 lt!95570 (minValue!3762 thiss!1248)))))))

(assert (=> d!56507 (= lt!95807 (insertStrictlySorted!130 (toList!1242 lt!95572) (_1!1779 (tuple2!3537 lt!95570 (minValue!3762 thiss!1248))) (_2!1779 (tuple2!3537 lt!95570 (minValue!3762 thiss!1248)))))))

(assert (=> d!56507 (= (+!310 lt!95572 (tuple2!3537 lt!95570 (minValue!3762 thiss!1248))) lt!95805)))

(declare-fun b!192663 () Bool)

(declare-fun res!91030 () Bool)

(assert (=> b!192663 (=> (not res!91030) (not e!126754))))

(assert (=> b!192663 (= res!91030 (= (getValueByKey!240 (toList!1242 lt!95805) (_1!1779 (tuple2!3537 lt!95570 (minValue!3762 thiss!1248)))) (Some!245 (_2!1779 (tuple2!3537 lt!95570 (minValue!3762 thiss!1248))))))))

(declare-fun b!192664 () Bool)

(assert (=> b!192664 (= e!126754 (contains!1359 (toList!1242 lt!95805) (tuple2!3537 lt!95570 (minValue!3762 thiss!1248))))))

(assert (= (and d!56507 res!91029) b!192663))

(assert (= (and b!192663 res!91030) b!192664))

(declare-fun m!219513 () Bool)

(assert (=> d!56507 m!219513))

(declare-fun m!219515 () Bool)

(assert (=> d!56507 m!219515))

(declare-fun m!219517 () Bool)

(assert (=> d!56507 m!219517))

(declare-fun m!219519 () Bool)

(assert (=> d!56507 m!219519))

(declare-fun m!219521 () Bool)

(assert (=> b!192663 m!219521))

(declare-fun m!219523 () Bool)

(assert (=> b!192664 m!219523))

(assert (=> b!192266 d!56507))

(assert (=> b!192265 d!56371))

(assert (=> bm!19417 d!56409))

(declare-fun b!192665 () Bool)

(declare-fun e!126756 () Bool)

(assert (=> b!192665 (= e!126756 tp_is_empty!4461)))

(declare-fun b!192666 () Bool)

(declare-fun e!126755 () Bool)

(assert (=> b!192666 (= e!126755 tp_is_empty!4461)))

(declare-fun mapIsEmpty!7715 () Bool)

(declare-fun mapRes!7715 () Bool)

(assert (=> mapIsEmpty!7715 mapRes!7715))

(declare-fun condMapEmpty!7715 () Bool)

(declare-fun mapDefault!7715 () ValueCell!1887)

(assert (=> mapNonEmpty!7714 (= condMapEmpty!7715 (= mapRest!7714 ((as const (Array (_ BitVec 32) ValueCell!1887)) mapDefault!7715)))))

(assert (=> mapNonEmpty!7714 (= tp!16930 (and e!126755 mapRes!7715))))

(declare-fun mapNonEmpty!7715 () Bool)

(declare-fun tp!16931 () Bool)

(assert (=> mapNonEmpty!7715 (= mapRes!7715 (and tp!16931 e!126756))))

(declare-fun mapKey!7715 () (_ BitVec 32))

(declare-fun mapValue!7715 () ValueCell!1887)

(declare-fun mapRest!7715 () (Array (_ BitVec 32) ValueCell!1887))

(assert (=> mapNonEmpty!7715 (= mapRest!7714 (store mapRest!7715 mapKey!7715 mapValue!7715))))

(assert (= (and mapNonEmpty!7714 condMapEmpty!7715) mapIsEmpty!7715))

(assert (= (and mapNonEmpty!7714 (not condMapEmpty!7715)) mapNonEmpty!7715))

(assert (= (and mapNonEmpty!7715 ((_ is ValueCellFull!1887) mapValue!7715)) b!192665))

(assert (= (and mapNonEmpty!7714 ((_ is ValueCellFull!1887) mapDefault!7715)) b!192666))

(declare-fun m!219525 () Bool)

(assert (=> mapNonEmpty!7715 m!219525))

(declare-fun b_lambda!7439 () Bool)

(assert (= b_lambda!7433 (or (and b!192132 b_free!4689) b_lambda!7439)))

(declare-fun b_lambda!7441 () Bool)

(assert (= b_lambda!7431 (or (and b!192132 b_free!4689) b_lambda!7441)))

(declare-fun b_lambda!7443 () Bool)

(assert (= b_lambda!7437 (or (and b!192132 b_free!4689) b_lambda!7443)))

(declare-fun b_lambda!7445 () Bool)

(assert (= b_lambda!7435 (or (and b!192132 b_free!4689) b_lambda!7445)))

(check-sat (not d!56365) (not d!56405) (not b_lambda!7441) (not d!56373) (not b!192661) (not d!56389) (not b_lambda!7429) (not b!192501) (not d!56401) (not b!192490) (not b!192465) (not b!192541) (not d!56441) (not d!56505) (not bm!19449) (not b!192368) (not b!192384) (not d!56463) (not b!192545) (not b!192664) (not d!56419) (not b!192615) (not d!56485) (not d!56397) (not d!56429) (not d!56359) (not b!192549) (not b!192416) (not d!56497) (not d!56489) (not bm!19448) (not b!192648) (not b!192518) (not d!56417) (not d!56369) (not b!192378) (not b!192537) (not d!56425) (not b!192581) (not b!192652) (not d!56423) (not d!56449) (not b!192488) (not b!192427) (not d!56495) (not b_lambda!7427) (not bm!19432) (not b!192546) (not b!192372) (not bm!19436) (not b!192535) (not b_next!4689) (not b!192655) (not b!192455) (not b!192564) (not b_lambda!7439) (not b!192552) (not d!56477) (not b!192539) (not d!56377) (not b!192570) (not b!192434) (not d!56475) (not b!192609) (not b_lambda!7443) (not b!192375) (not b!192369) (not b!192548) b_and!11389 (not d!56501) (not b!192540) (not d!56443) (not d!56413) (not b!192597) (not b!192649) (not b!192544) (not d!56481) (not d!56381) (not d!56433) (not b!192563) (not bm!19424) (not d!56453) (not d!56491) (not b!192651) (not b!192653) (not b!192509) (not b!192654) (not d!56395) (not b!192522) tp_is_empty!4461 (not d!56403) (not d!56465) (not b!192403) (not d!56471) (not d!56439) (not b!192489) (not b!192568) (not b!192566) (not bm!19443) (not d!56409) (not b!192650) (not d!56431) (not b!192464) (not b!192505) (not b!192538) (not b!192433) (not d!56411) (not d!56503) (not b!192476) (not b!192646) (not b!192620) (not d!56455) (not b!192383) (not b!192569) (not b!192660) (not bm!19439) (not d!56479) (not mapNonEmpty!7715) (not b!192603) (not bm!19442) (not b!192463) (not d!56507) (not d!56407) (not d!56379) (not d!56461) (not b!192578) (not b!192377) (not d!56459) (not b!192467) (not b!192374) (not b!192376) (not b!192580) (not b!192529) (not b!192536) (not d!56447) (not b!192412) (not d!56421) (not d!56473) (not b!192601) (not d!56499) (not b!192553) (not b!192473) (not b_lambda!7445) (not d!56493) (not b!192523) (not b!192506) (not d!56437) (not b!192657) (not d!56469) (not b!192573) (not d!56427) (not d!56415) (not d!56483) (not b!192533) (not b!192582) (not b!192576) (not b!192663) (not b!192530) (not b!192413) (not d!56361) (not d!56385) (not d!56487) (not b!192507) (not b!192542) (not b!192414) (not b!192503))
(check-sat b_and!11389 (not b_next!4689))

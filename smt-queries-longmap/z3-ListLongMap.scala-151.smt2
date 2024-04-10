; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2948 () Bool)

(assert start!2948)

(declare-fun b!16845 () Bool)

(declare-fun b_free!585 () Bool)

(declare-fun b_next!585 () Bool)

(assert (=> b!16845 (= b_free!585 (not b_next!585))))

(declare-fun tp!2941 () Bool)

(declare-fun b_and!1227 () Bool)

(assert (=> b!16845 (= tp!2941 b_and!1227)))

(declare-fun res!12401 () Bool)

(declare-fun e!10495 () Bool)

(assert (=> start!2948 (=> (not res!12401) (not e!10495))))

(declare-datatypes ((V!957 0))(
  ( (V!958 (val!451 Int)) )
))
(declare-datatypes ((ValueCell!225 0))(
  ( (ValueCellFull!225 (v!1402 V!957)) (EmptyCell!225) )
))
(declare-datatypes ((array!901 0))(
  ( (array!902 (arr!433 (Array (_ BitVec 32) ValueCell!225)) (size!522 (_ BitVec 32))) )
))
(declare-datatypes ((array!903 0))(
  ( (array!904 (arr!434 (Array (_ BitVec 32) (_ BitVec 64))) (size!523 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!36 0))(
  ( (LongMapFixedSize!37 (defaultEntry!1628 Int) (mask!4538 (_ BitVec 32)) (extraKeys!1542 (_ BitVec 32)) (zeroValue!1565 V!957) (minValue!1565 V!957) (_size!49 (_ BitVec 32)) (_keys!3053 array!903) (_values!1626 array!901) (_vacant!49 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!36 0))(
  ( (Cell!37 (v!1403 LongMapFixedSize!36)) )
))
(declare-datatypes ((LongMap!36 0))(
  ( (LongMap!37 (underlying!29 Cell!36)) )
))
(declare-fun thiss!848 () LongMap!36)

(declare-fun valid!20 (LongMap!36) Bool)

(assert (=> start!2948 (= res!12401 (valid!20 thiss!848))))

(assert (=> start!2948 e!10495))

(declare-fun e!10489 () Bool)

(assert (=> start!2948 e!10489))

(declare-fun b!16841 () Bool)

(declare-datatypes ((tuple2!696 0))(
  ( (tuple2!697 (_1!348 Bool) (_2!348 LongMap!36)) )
))
(declare-fun e!10492 () tuple2!696)

(declare-fun repack!1 (LongMap!36) tuple2!696)

(assert (=> b!16841 (= e!10492 (repack!1 thiss!848))))

(declare-fun mapNonEmpty!704 () Bool)

(declare-fun mapRes!704 () Bool)

(declare-fun tp!2942 () Bool)

(declare-fun e!10498 () Bool)

(assert (=> mapNonEmpty!704 (= mapRes!704 (and tp!2942 e!10498))))

(declare-fun mapRest!704 () (Array (_ BitVec 32) ValueCell!225))

(declare-fun mapKey!704 () (_ BitVec 32))

(declare-fun mapValue!704 () ValueCell!225)

(assert (=> mapNonEmpty!704 (= (arr!433 (_values!1626 (v!1403 (underlying!29 thiss!848)))) (store mapRest!704 mapKey!704 mapValue!704))))

(declare-fun b!16842 () Bool)

(declare-fun e!10493 () Bool)

(assert (=> b!16842 (= e!10495 e!10493)))

(declare-fun res!12400 () Bool)

(assert (=> b!16842 (=> (not res!12400) (not e!10493))))

(declare-fun lt!4144 () tuple2!696)

(assert (=> b!16842 (= res!12400 (_1!348 lt!4144))))

(assert (=> b!16842 (= lt!4144 e!10492)))

(declare-fun c!1623 () Bool)

(declare-fun imbalanced!3 (LongMap!36) Bool)

(assert (=> b!16842 (= c!1623 (imbalanced!3 thiss!848))))

(declare-fun b!16843 () Bool)

(declare-fun tp_is_empty!849 () Bool)

(assert (=> b!16843 (= e!10498 tp_is_empty!849)))

(declare-fun b!16844 () Bool)

(declare-fun valid!21 (LongMapFixedSize!36) Bool)

(assert (=> b!16844 (= e!10493 (not (valid!21 (v!1403 (underlying!29 (_2!348 lt!4144))))))))

(declare-fun e!10494 () Bool)

(declare-fun e!10496 () Bool)

(declare-fun array_inv!305 (array!903) Bool)

(declare-fun array_inv!306 (array!901) Bool)

(assert (=> b!16845 (= e!10494 (and tp!2941 tp_is_empty!849 (array_inv!305 (_keys!3053 (v!1403 (underlying!29 thiss!848)))) (array_inv!306 (_values!1626 (v!1403 (underlying!29 thiss!848)))) e!10496))))

(declare-fun b!16846 () Bool)

(declare-fun e!10497 () Bool)

(assert (=> b!16846 (= e!10489 e!10497)))

(declare-fun b!16847 () Bool)

(assert (=> b!16847 (= e!10492 (tuple2!697 true thiss!848))))

(declare-fun b!16848 () Bool)

(declare-fun e!10491 () Bool)

(assert (=> b!16848 (= e!10496 (and e!10491 mapRes!704))))

(declare-fun condMapEmpty!704 () Bool)

(declare-fun mapDefault!704 () ValueCell!225)

(assert (=> b!16848 (= condMapEmpty!704 (= (arr!433 (_values!1626 (v!1403 (underlying!29 thiss!848)))) ((as const (Array (_ BitVec 32) ValueCell!225)) mapDefault!704)))))

(declare-fun b!16849 () Bool)

(assert (=> b!16849 (= e!10497 e!10494)))

(declare-fun b!16850 () Bool)

(assert (=> b!16850 (= e!10491 tp_is_empty!849)))

(declare-fun mapIsEmpty!704 () Bool)

(assert (=> mapIsEmpty!704 mapRes!704))

(assert (= (and start!2948 res!12401) b!16842))

(assert (= (and b!16842 c!1623) b!16841))

(assert (= (and b!16842 (not c!1623)) b!16847))

(assert (= (and b!16842 res!12400) b!16844))

(assert (= (and b!16848 condMapEmpty!704) mapIsEmpty!704))

(assert (= (and b!16848 (not condMapEmpty!704)) mapNonEmpty!704))

(get-info :version)

(assert (= (and mapNonEmpty!704 ((_ is ValueCellFull!225) mapValue!704)) b!16843))

(assert (= (and b!16848 ((_ is ValueCellFull!225) mapDefault!704)) b!16850))

(assert (= b!16845 b!16848))

(assert (= b!16849 b!16845))

(assert (= b!16846 b!16849))

(assert (= start!2948 b!16846))

(declare-fun m!11865 () Bool)

(assert (=> b!16842 m!11865))

(declare-fun m!11867 () Bool)

(assert (=> mapNonEmpty!704 m!11867))

(declare-fun m!11869 () Bool)

(assert (=> b!16844 m!11869))

(declare-fun m!11871 () Bool)

(assert (=> b!16845 m!11871))

(declare-fun m!11873 () Bool)

(assert (=> b!16845 m!11873))

(declare-fun m!11875 () Bool)

(assert (=> b!16841 m!11875))

(declare-fun m!11877 () Bool)

(assert (=> start!2948 m!11877))

(check-sat (not mapNonEmpty!704) tp_is_empty!849 (not b!16841) (not b!16842) (not start!2948) (not b_next!585) (not b!16845) (not b!16844) b_and!1227)
(check-sat b_and!1227 (not b_next!585))
(get-model)

(declare-fun d!3363 () Bool)

(assert (=> d!3363 (= (imbalanced!3 thiss!848) (or (bvsgt (bvmul #b00000000000000000000000000000010 (bvadd (_size!49 (v!1403 (underlying!29 thiss!848))) (_vacant!49 (v!1403 (underlying!29 thiss!848))))) (mask!4538 (v!1403 (underlying!29 thiss!848)))) (bvsgt (_vacant!49 (v!1403 (underlying!29 thiss!848))) (_size!49 (v!1403 (underlying!29 thiss!848))))))))

(assert (=> b!16842 d!3363))

(declare-fun d!3365 () Bool)

(assert (=> d!3365 (= (valid!20 thiss!848) (valid!21 (v!1403 (underlying!29 thiss!848))))))

(declare-fun bs!804 () Bool)

(assert (= bs!804 d!3365))

(declare-fun m!11893 () Bool)

(assert (=> bs!804 m!11893))

(assert (=> start!2948 d!3365))

(declare-fun d!3367 () Bool)

(declare-fun res!12414 () Bool)

(declare-fun e!10531 () Bool)

(assert (=> d!3367 (=> (not res!12414) (not e!10531))))

(declare-fun simpleValid!8 (LongMapFixedSize!36) Bool)

(assert (=> d!3367 (= res!12414 (simpleValid!8 (v!1403 (underlying!29 (_2!348 lt!4144)))))))

(assert (=> d!3367 (= (valid!21 (v!1403 (underlying!29 (_2!348 lt!4144)))) e!10531)))

(declare-fun b!16887 () Bool)

(declare-fun res!12415 () Bool)

(assert (=> b!16887 (=> (not res!12415) (not e!10531))))

(declare-fun arrayCountValidKeys!0 (array!903 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!16887 (= res!12415 (= (arrayCountValidKeys!0 (_keys!3053 (v!1403 (underlying!29 (_2!348 lt!4144)))) #b00000000000000000000000000000000 (size!523 (_keys!3053 (v!1403 (underlying!29 (_2!348 lt!4144)))))) (_size!49 (v!1403 (underlying!29 (_2!348 lt!4144))))))))

(declare-fun b!16888 () Bool)

(declare-fun res!12416 () Bool)

(assert (=> b!16888 (=> (not res!12416) (not e!10531))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!903 (_ BitVec 32)) Bool)

(assert (=> b!16888 (= res!12416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3053 (v!1403 (underlying!29 (_2!348 lt!4144)))) (mask!4538 (v!1403 (underlying!29 (_2!348 lt!4144))))))))

(declare-fun b!16889 () Bool)

(declare-datatypes ((List!532 0))(
  ( (Nil!529) (Cons!528 (h!1094 (_ BitVec 64)) (t!3169 List!532)) )
))
(declare-fun arrayNoDuplicates!0 (array!903 (_ BitVec 32) List!532) Bool)

(assert (=> b!16889 (= e!10531 (arrayNoDuplicates!0 (_keys!3053 (v!1403 (underlying!29 (_2!348 lt!4144)))) #b00000000000000000000000000000000 Nil!529))))

(assert (= (and d!3367 res!12414) b!16887))

(assert (= (and b!16887 res!12415) b!16888))

(assert (= (and b!16888 res!12416) b!16889))

(declare-fun m!11895 () Bool)

(assert (=> d!3367 m!11895))

(declare-fun m!11897 () Bool)

(assert (=> b!16887 m!11897))

(declare-fun m!11899 () Bool)

(assert (=> b!16888 m!11899))

(declare-fun m!11901 () Bool)

(assert (=> b!16889 m!11901))

(assert (=> b!16844 d!3367))

(declare-fun bm!464 () Bool)

(declare-fun call!469 () LongMapFixedSize!36)

(declare-fun lt!4171 () (_ BitVec 32))

(declare-fun getNewLongMapFixedSize!7 ((_ BitVec 32) Int) LongMapFixedSize!36)

(assert (=> bm!464 (= call!469 (getNewLongMapFixedSize!7 lt!4171 (defaultEntry!1628 (v!1403 (underlying!29 thiss!848)))))))

(declare-fun b!16908 () Bool)

(declare-datatypes ((tuple2!698 0))(
  ( (tuple2!699 (_1!349 Bool) (_2!349 Cell!36)) )
))
(declare-fun e!10542 () tuple2!698)

(declare-fun e!10545 () tuple2!698)

(assert (=> b!16908 (= e!10542 e!10545)))

(declare-fun c!1638 () Bool)

(assert (=> b!16908 (= c!1638 (and (not (= (bvand (extraKeys!1542 (v!1403 (underlying!29 thiss!848))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1542 (v!1403 (underlying!29 thiss!848))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!16909 () Bool)

(declare-fun e!10544 () tuple2!698)

(declare-fun lt!4177 () Cell!36)

(assert (=> b!16909 (= e!10544 (tuple2!699 true lt!4177))))

(declare-fun bm!465 () Bool)

(declare-datatypes ((tuple2!700 0))(
  ( (tuple2!701 (_1!350 Bool) (_2!350 LongMapFixedSize!36)) )
))
(declare-fun call!468 () tuple2!700)

(declare-fun call!467 () tuple2!700)

(assert (=> bm!465 (= call!468 call!467)))

(declare-fun b!16910 () Bool)

(declare-datatypes ((tuple3!0 0))(
  ( (tuple3!1 (_1!351 Bool) (_2!351 Cell!36) (_3!0 LongMap!36)) )
))
(declare-fun e!10546 () tuple3!0)

(declare-fun lt!4175 () tuple2!700)

(assert (=> b!16910 (= e!10546 (ite (_1!350 lt!4175) (tuple3!1 true (underlying!29 thiss!848) (LongMap!37 (Cell!37 (_2!350 lt!4175)))) (tuple3!1 false (Cell!37 (_2!350 lt!4175)) thiss!848)))))

(declare-fun lt!4173 () tuple2!698)

(declare-fun repackFrom!1 (LongMap!36 LongMapFixedSize!36 (_ BitVec 32)) tuple2!700)

(assert (=> b!16910 (= lt!4175 (repackFrom!1 thiss!848 (v!1403 (_2!349 lt!4173)) (bvsub (size!523 (_keys!3053 (v!1403 (underlying!29 thiss!848)))) #b00000000000000000000000000000001)))))

(declare-fun b!16911 () Bool)

(declare-fun c!1636 () Bool)

(assert (=> b!16911 (= c!1636 (and (not (= (bvand (extraKeys!1542 (v!1403 (underlying!29 thiss!848))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1542 (v!1403 (underlying!29 thiss!848))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!16911 (= e!10545 e!10544)))

(declare-fun d!3369 () Bool)

(declare-fun e!10543 () Bool)

(assert (=> d!3369 e!10543))

(declare-fun res!12419 () Bool)

(assert (=> d!3369 (=> res!12419 e!10543)))

(declare-fun lt!4172 () tuple2!696)

(assert (=> d!3369 (= res!12419 (= (_1!348 lt!4172) false))))

(declare-fun lt!4170 () tuple3!0)

(assert (=> d!3369 (= lt!4172 (tuple2!697 (_1!351 lt!4170) (_3!0 lt!4170)))))

(assert (=> d!3369 (= lt!4170 e!10546)))

(declare-fun c!1637 () Bool)

(assert (=> d!3369 (= c!1637 (not (_1!349 lt!4173)))))

(assert (=> d!3369 (= lt!4173 e!10542)))

(declare-fun c!1635 () Bool)

(assert (=> d!3369 (= c!1635 (and (not (= (bvand (extraKeys!1542 (v!1403 (underlying!29 thiss!848))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1542 (v!1403 (underlying!29 thiss!848))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!3369 (= lt!4177 (Cell!37 (getNewLongMapFixedSize!7 lt!4171 (defaultEntry!1628 (v!1403 (underlying!29 thiss!848))))))))

(declare-fun computeNewMask!1 (LongMap!36 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!3369 (= lt!4171 (computeNewMask!1 thiss!848 (mask!4538 (v!1403 (underlying!29 thiss!848))) (_vacant!49 (v!1403 (underlying!29 thiss!848))) (_size!49 (v!1403 (underlying!29 thiss!848)))))))

(assert (=> d!3369 (valid!20 thiss!848)))

(assert (=> d!3369 (= (repack!1 thiss!848) lt!4172)))

(declare-fun b!16912 () Bool)

(declare-fun lt!4176 () tuple2!700)

(assert (=> b!16912 (= e!10544 (tuple2!699 (_1!350 lt!4176) (Cell!37 (_2!350 lt!4176))))))

(assert (=> b!16912 (= lt!4176 call!468)))

(declare-fun bm!466 () Bool)

(declare-fun call!470 () LongMapFixedSize!36)

(assert (=> bm!466 (= call!470 call!469)))

(declare-fun b!16913 () Bool)

(declare-fun lt!4168 () tuple2!700)

(assert (=> b!16913 (= lt!4168 call!468)))

(assert (=> b!16913 (= e!10545 (tuple2!699 (_1!350 lt!4168) (Cell!37 (_2!350 lt!4168))))))

(declare-fun b!16914 () Bool)

(declare-datatypes ((tuple2!702 0))(
  ( (tuple2!703 (_1!352 (_ BitVec 64)) (_2!352 V!957)) )
))
(declare-datatypes ((List!533 0))(
  ( (Nil!530) (Cons!529 (h!1095 tuple2!702) (t!3170 List!533)) )
))
(declare-datatypes ((ListLongMap!525 0))(
  ( (ListLongMap!526 (toList!278 List!533)) )
))
(declare-fun map!326 (LongMap!36) ListLongMap!525)

(assert (=> b!16914 (= e!10543 (= (map!326 (_2!348 lt!4172)) (map!326 thiss!848)))))

(declare-fun b!16915 () Bool)

(assert (=> b!16915 (= e!10546 (tuple3!1 false (_2!349 lt!4173) thiss!848))))

(declare-fun lt!4174 () tuple2!700)

(declare-fun bm!467 () Bool)

(declare-fun update!2 (LongMapFixedSize!36 (_ BitVec 64) V!957) tuple2!700)

(assert (=> bm!467 (= call!467 (update!2 (ite c!1635 (_2!350 lt!4174) call!470) (ite c!1635 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1638 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!1635 (minValue!1565 (v!1403 (underlying!29 thiss!848))) (ite c!1638 (zeroValue!1565 (v!1403 (underlying!29 thiss!848))) (minValue!1565 (v!1403 (underlying!29 thiss!848)))))))))

(declare-fun b!16916 () Bool)

(declare-fun lt!4169 () tuple2!700)

(assert (=> b!16916 (= e!10542 (tuple2!699 (and (_1!350 lt!4174) (_1!350 lt!4169)) (Cell!37 (_2!350 lt!4169))))))

(assert (=> b!16916 (= lt!4174 (update!2 call!469 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1565 (v!1403 (underlying!29 thiss!848)))))))

(assert (=> b!16916 (= lt!4169 call!467)))

(assert (= (and d!3369 c!1635) b!16916))

(assert (= (and d!3369 (not c!1635)) b!16908))

(assert (= (and b!16908 c!1638) b!16913))

(assert (= (and b!16908 (not c!1638)) b!16911))

(assert (= (and b!16911 c!1636) b!16912))

(assert (= (and b!16911 (not c!1636)) b!16909))

(assert (= (or b!16913 b!16912) bm!466))

(assert (= (or b!16913 b!16912) bm!465))

(assert (= (or b!16916 bm!465) bm!467))

(assert (= (or b!16916 bm!466) bm!464))

(assert (= (and d!3369 c!1637) b!16915))

(assert (= (and d!3369 (not c!1637)) b!16910))

(assert (= (and d!3369 (not res!12419)) b!16914))

(declare-fun m!11903 () Bool)

(assert (=> d!3369 m!11903))

(declare-fun m!11905 () Bool)

(assert (=> d!3369 m!11905))

(assert (=> d!3369 m!11877))

(declare-fun m!11907 () Bool)

(assert (=> b!16916 m!11907))

(declare-fun m!11909 () Bool)

(assert (=> b!16914 m!11909))

(declare-fun m!11911 () Bool)

(assert (=> b!16914 m!11911))

(assert (=> bm!464 m!11903))

(declare-fun m!11913 () Bool)

(assert (=> b!16910 m!11913))

(declare-fun m!11915 () Bool)

(assert (=> bm!467 m!11915))

(assert (=> b!16841 d!3369))

(declare-fun d!3371 () Bool)

(assert (=> d!3371 (= (array_inv!305 (_keys!3053 (v!1403 (underlying!29 thiss!848)))) (bvsge (size!523 (_keys!3053 (v!1403 (underlying!29 thiss!848)))) #b00000000000000000000000000000000))))

(assert (=> b!16845 d!3371))

(declare-fun d!3373 () Bool)

(assert (=> d!3373 (= (array_inv!306 (_values!1626 (v!1403 (underlying!29 thiss!848)))) (bvsge (size!522 (_values!1626 (v!1403 (underlying!29 thiss!848)))) #b00000000000000000000000000000000))))

(assert (=> b!16845 d!3373))

(declare-fun b!16923 () Bool)

(declare-fun e!10552 () Bool)

(assert (=> b!16923 (= e!10552 tp_is_empty!849)))

(declare-fun mapNonEmpty!710 () Bool)

(declare-fun mapRes!710 () Bool)

(declare-fun tp!2951 () Bool)

(assert (=> mapNonEmpty!710 (= mapRes!710 (and tp!2951 e!10552))))

(declare-fun mapValue!710 () ValueCell!225)

(declare-fun mapKey!710 () (_ BitVec 32))

(declare-fun mapRest!710 () (Array (_ BitVec 32) ValueCell!225))

(assert (=> mapNonEmpty!710 (= mapRest!704 (store mapRest!710 mapKey!710 mapValue!710))))

(declare-fun condMapEmpty!710 () Bool)

(declare-fun mapDefault!710 () ValueCell!225)

(assert (=> mapNonEmpty!704 (= condMapEmpty!710 (= mapRest!704 ((as const (Array (_ BitVec 32) ValueCell!225)) mapDefault!710)))))

(declare-fun e!10551 () Bool)

(assert (=> mapNonEmpty!704 (= tp!2942 (and e!10551 mapRes!710))))

(declare-fun b!16924 () Bool)

(assert (=> b!16924 (= e!10551 tp_is_empty!849)))

(declare-fun mapIsEmpty!710 () Bool)

(assert (=> mapIsEmpty!710 mapRes!710))

(assert (= (and mapNonEmpty!704 condMapEmpty!710) mapIsEmpty!710))

(assert (= (and mapNonEmpty!704 (not condMapEmpty!710)) mapNonEmpty!710))

(assert (= (and mapNonEmpty!710 ((_ is ValueCellFull!225) mapValue!710)) b!16923))

(assert (= (and mapNonEmpty!704 ((_ is ValueCellFull!225) mapDefault!710)) b!16924))

(declare-fun m!11917 () Bool)

(assert (=> mapNonEmpty!710 m!11917))

(check-sat (not d!3365) tp_is_empty!849 (not b!16910) (not b!16888) (not d!3369) (not mapNonEmpty!710) (not b_next!585) (not d!3367) (not b!16887) b_and!1227 (not b!16914) (not bm!467) (not b!16889) (not bm!464) (not b!16916))
(check-sat b_and!1227 (not b_next!585))
(get-model)

(declare-fun d!3375 () Bool)

(declare-fun e!10559 () Bool)

(assert (=> d!3375 e!10559))

(declare-fun res!12424 () Bool)

(assert (=> d!3375 (=> (not res!12424) (not e!10559))))

(declare-fun lt!4230 () LongMapFixedSize!36)

(assert (=> d!3375 (= res!12424 (valid!21 lt!4230))))

(declare-fun lt!4241 () LongMapFixedSize!36)

(assert (=> d!3375 (= lt!4230 lt!4241)))

(declare-datatypes ((Unit!339 0))(
  ( (Unit!340) )
))
(declare-fun lt!4243 () Unit!339)

(declare-fun e!10560 () Unit!339)

(assert (=> d!3375 (= lt!4243 e!10560)))

(declare-fun c!1643 () Bool)

(declare-fun map!327 (LongMapFixedSize!36) ListLongMap!525)

(assert (=> d!3375 (= c!1643 (not (= (map!327 lt!4241) (ListLongMap!526 Nil!530))))))

(declare-fun lt!4232 () Unit!339)

(declare-fun lt!4238 () Unit!339)

(assert (=> d!3375 (= lt!4232 lt!4238)))

(declare-fun lt!4246 () array!903)

(declare-fun lt!4224 () (_ BitVec 32))

(declare-fun lt!4240 () List!532)

(assert (=> d!3375 (arrayNoDuplicates!0 lt!4246 lt!4224 lt!4240)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!903 (_ BitVec 32) (_ BitVec 32) List!532) Unit!339)

(assert (=> d!3375 (= lt!4238 (lemmaArrayNoDuplicatesInAll0Array!0 lt!4246 lt!4224 (bvadd lt!4171 #b00000000000000000000000000000001) lt!4240))))

(assert (=> d!3375 (= lt!4240 Nil!529)))

(assert (=> d!3375 (= lt!4224 #b00000000000000000000000000000000)))

(assert (=> d!3375 (= lt!4246 (array!904 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd lt!4171 #b00000000000000000000000000000001)))))

(declare-fun lt!4244 () Unit!339)

(declare-fun lt!4236 () Unit!339)

(assert (=> d!3375 (= lt!4244 lt!4236)))

(declare-fun lt!4231 () (_ BitVec 32))

(declare-fun lt!4245 () array!903)

(assert (=> d!3375 (arrayForallSeekEntryOrOpenFound!0 lt!4231 lt!4245 lt!4171)))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!903 (_ BitVec 32) (_ BitVec 32)) Unit!339)

(assert (=> d!3375 (= lt!4236 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!4245 lt!4171 lt!4231))))

(assert (=> d!3375 (= lt!4231 #b00000000000000000000000000000000)))

(assert (=> d!3375 (= lt!4245 (array!904 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd lt!4171 #b00000000000000000000000000000001)))))

(declare-fun lt!4239 () Unit!339)

(declare-fun lt!4234 () Unit!339)

(assert (=> d!3375 (= lt!4239 lt!4234)))

(declare-fun lt!4233 () array!903)

(declare-fun lt!4235 () (_ BitVec 32))

(declare-fun lt!4237 () (_ BitVec 32))

(assert (=> d!3375 (= (arrayCountValidKeys!0 lt!4233 lt!4235 lt!4237) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!903 (_ BitVec 32) (_ BitVec 32)) Unit!339)

(assert (=> d!3375 (= lt!4234 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!4233 lt!4235 lt!4237))))

(assert (=> d!3375 (= lt!4237 (bvadd lt!4171 #b00000000000000000000000000000001))))

(assert (=> d!3375 (= lt!4235 #b00000000000000000000000000000000)))

(assert (=> d!3375 (= lt!4233 (array!904 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd lt!4171 #b00000000000000000000000000000001)))))

(declare-fun dynLambda!132 (Int (_ BitVec 64)) V!957)

(assert (=> d!3375 (= lt!4241 (LongMapFixedSize!37 (defaultEntry!1628 (v!1403 (underlying!29 thiss!848))) lt!4171 #b00000000000000000000000000000000 (dynLambda!132 (defaultEntry!1628 (v!1403 (underlying!29 thiss!848))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!132 (defaultEntry!1628 (v!1403 (underlying!29 thiss!848))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!904 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd lt!4171 #b00000000000000000000000000000001)) (array!902 ((as const (Array (_ BitVec 32) ValueCell!225)) EmptyCell!225) (bvadd lt!4171 #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!3375 (validMask!0 lt!4171)))

(assert (=> d!3375 (= (getNewLongMapFixedSize!7 lt!4171 (defaultEntry!1628 (v!1403 (underlying!29 thiss!848)))) lt!4230)))

(declare-fun b!16937 () Bool)

(declare-fun e!10561 () Bool)

(declare-fun lt!4242 () array!903)

(declare-fun lt!4229 () tuple2!702)

(declare-fun arrayContainsKey!0 (array!903 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!16937 (= e!10561 (arrayContainsKey!0 lt!4242 (_1!352 lt!4229) #b00000000000000000000000000000000))))

(declare-fun b!16938 () Bool)

(assert (=> b!16938 (= e!10559 (= (map!327 lt!4230) (ListLongMap!526 Nil!530)))))

(declare-fun b!16939 () Bool)

(declare-fun Unit!341 () Unit!339)

(assert (=> b!16939 (= e!10560 Unit!341)))

(declare-fun head!818 (List!533) tuple2!702)

(assert (=> b!16939 (= lt!4229 (head!818 (toList!278 (map!327 lt!4241))))))

(assert (=> b!16939 (= lt!4242 (array!904 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd lt!4171 #b00000000000000000000000000000001)))))

(declare-fun lt!4227 () (_ BitVec 32))

(assert (=> b!16939 (= lt!4227 #b00000000000000000000000000000000)))

(declare-fun lt!4228 () Unit!339)

(declare-fun lemmaKeyInListMapIsInArray!79 (array!903 array!901 (_ BitVec 32) (_ BitVec 32) V!957 V!957 (_ BitVec 64) Int) Unit!339)

(assert (=> b!16939 (= lt!4228 (lemmaKeyInListMapIsInArray!79 lt!4242 (array!902 ((as const (Array (_ BitVec 32) ValueCell!225)) EmptyCell!225) (bvadd lt!4171 #b00000000000000000000000000000001)) lt!4171 lt!4227 (dynLambda!132 (defaultEntry!1628 (v!1403 (underlying!29 thiss!848))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!132 (defaultEntry!1628 (v!1403 (underlying!29 thiss!848))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!352 lt!4229) (defaultEntry!1628 (v!1403 (underlying!29 thiss!848)))))))

(declare-fun c!1644 () Bool)

(assert (=> b!16939 (= c!1644 (and (not (= (_1!352 lt!4229) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!352 lt!4229) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!16939 e!10561))

(declare-fun lt!4225 () Unit!339)

(assert (=> b!16939 (= lt!4225 lt!4228)))

(declare-fun lt!4226 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!903 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!16939 (= lt!4226 (arrayScanForKey!0 (array!904 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd lt!4171 #b00000000000000000000000000000001)) (_1!352 lt!4229) #b00000000000000000000000000000000))))

(assert (=> b!16939 false))

(declare-fun b!16940 () Bool)

(declare-fun Unit!342 () Unit!339)

(assert (=> b!16940 (= e!10560 Unit!342)))

(declare-fun b!16941 () Bool)

(declare-fun res!12425 () Bool)

(assert (=> b!16941 (=> (not res!12425) (not e!10559))))

(assert (=> b!16941 (= res!12425 (= (mask!4538 lt!4230) lt!4171))))

(declare-fun b!16942 () Bool)

(assert (=> b!16942 (= e!10561 (ite (= (_1!352 lt!4229) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!4227 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!4227 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!3375 c!1643) b!16939))

(assert (= (and d!3375 (not c!1643)) b!16940))

(assert (= (and b!16939 c!1644) b!16937))

(assert (= (and b!16939 (not c!1644)) b!16942))

(assert (= (and d!3375 res!12424) b!16941))

(assert (= (and b!16941 res!12425) b!16938))

(declare-fun b_lambda!1435 () Bool)

(assert (=> (not b_lambda!1435) (not d!3375)))

(declare-fun t!3172 () Bool)

(declare-fun tb!625 () Bool)

(assert (=> (and b!16845 (= (defaultEntry!1628 (v!1403 (underlying!29 thiss!848))) (defaultEntry!1628 (v!1403 (underlying!29 thiss!848)))) t!3172) tb!625))

(declare-fun result!1005 () Bool)

(assert (=> tb!625 (= result!1005 tp_is_empty!849)))

(assert (=> d!3375 t!3172))

(declare-fun b_and!1231 () Bool)

(assert (= b_and!1227 (and (=> t!3172 result!1005) b_and!1231)))

(declare-fun b_lambda!1437 () Bool)

(assert (=> (not b_lambda!1437) (not b!16939)))

(assert (=> b!16939 t!3172))

(declare-fun b_and!1233 () Bool)

(assert (= b_and!1231 (and (=> t!3172 result!1005) b_and!1233)))

(declare-fun m!11919 () Bool)

(assert (=> d!3375 m!11919))

(declare-fun m!11921 () Bool)

(assert (=> d!3375 m!11921))

(declare-fun m!11923 () Bool)

(assert (=> d!3375 m!11923))

(declare-fun m!11925 () Bool)

(assert (=> d!3375 m!11925))

(declare-fun m!11927 () Bool)

(assert (=> d!3375 m!11927))

(declare-fun m!11929 () Bool)

(assert (=> d!3375 m!11929))

(declare-fun m!11931 () Bool)

(assert (=> d!3375 m!11931))

(declare-fun m!11933 () Bool)

(assert (=> d!3375 m!11933))

(declare-fun m!11935 () Bool)

(assert (=> d!3375 m!11935))

(declare-fun m!11937 () Bool)

(assert (=> d!3375 m!11937))

(declare-fun m!11939 () Bool)

(assert (=> b!16937 m!11939))

(declare-fun m!11941 () Bool)

(assert (=> b!16938 m!11941))

(assert (=> b!16939 m!11931))

(assert (=> b!16939 m!11931))

(declare-fun m!11943 () Bool)

(assert (=> b!16939 m!11943))

(declare-fun m!11945 () Bool)

(assert (=> b!16939 m!11945))

(assert (=> b!16939 m!11931))

(declare-fun m!11947 () Bool)

(assert (=> b!16939 m!11947))

(assert (=> b!16939 m!11933))

(assert (=> d!3369 d!3375))

(declare-fun d!3377 () Bool)

(declare-fun e!10567 () Bool)

(assert (=> d!3377 e!10567))

(declare-fun res!12428 () Bool)

(assert (=> d!3377 (=> (not res!12428) (not e!10567))))

(declare-fun lt!4251 () (_ BitVec 32))

(assert (=> d!3377 (= res!12428 (validMask!0 lt!4251))))

(declare-datatypes ((tuple2!704 0))(
  ( (tuple2!705 (_1!353 Unit!339) (_2!353 (_ BitVec 32))) )
))
(declare-fun e!10566 () tuple2!704)

(assert (=> d!3377 (= lt!4251 (_2!353 e!10566))))

(declare-fun c!1647 () Bool)

(declare-fun lt!4252 () tuple2!704)

(assert (=> d!3377 (= c!1647 (and (bvsgt (_2!353 lt!4252) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!49 (v!1403 (underlying!29 thiss!848)))) (_2!353 lt!4252)) (bvsge (bvadd (bvand (bvashr (_2!353 lt!4252) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!49 (v!1403 (underlying!29 thiss!848))))))))

(declare-fun Unit!343 () Unit!339)

(declare-fun Unit!344 () Unit!339)

(assert (=> d!3377 (= lt!4252 (ite (and (bvsge (bvmul #b00000000000000000000000000000010 (bvadd (_size!49 (v!1403 (underlying!29 thiss!848))) (_vacant!49 (v!1403 (underlying!29 thiss!848))))) (mask!4538 (v!1403 (underlying!29 thiss!848)))) (bvsle (bvmul #b00000000000000000000000000000101 (_vacant!49 (v!1403 (underlying!29 thiss!848)))) (mask!4538 (v!1403 (underlying!29 thiss!848))))) (tuple2!705 Unit!343 (bvand (bvadd (bvshl (mask!4538 (v!1403 (underlying!29 thiss!848))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (tuple2!705 Unit!344 (mask!4538 (v!1403 (underlying!29 thiss!848))))))))

(assert (=> d!3377 (validMask!0 (mask!4538 (v!1403 (underlying!29 thiss!848))))))

(assert (=> d!3377 (= (computeNewMask!1 thiss!848 (mask!4538 (v!1403 (underlying!29 thiss!848))) (_vacant!49 (v!1403 (underlying!29 thiss!848))) (_size!49 (v!1403 (underlying!29 thiss!848)))) lt!4251)))

(declare-fun b!16951 () Bool)

(declare-fun computeNewMaskWhile!1 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!704)

(assert (=> b!16951 (= e!10566 (computeNewMaskWhile!1 (_size!49 (v!1403 (underlying!29 thiss!848))) (_vacant!49 (v!1403 (underlying!29 thiss!848))) (mask!4538 (v!1403 (underlying!29 thiss!848))) (_2!353 lt!4252)))))

(declare-fun b!16952 () Bool)

(declare-fun Unit!345 () Unit!339)

(assert (=> b!16952 (= e!10566 (tuple2!705 Unit!345 (_2!353 lt!4252)))))

(declare-fun b!16953 () Bool)

(assert (=> b!16953 (= e!10567 (bvsle (_size!49 (v!1403 (underlying!29 thiss!848))) (bvadd lt!4251 #b00000000000000000000000000000001)))))

(assert (= (and d!3377 c!1647) b!16951))

(assert (= (and d!3377 (not c!1647)) b!16952))

(assert (= (and d!3377 res!12428) b!16953))

(declare-fun m!11949 () Bool)

(assert (=> d!3377 m!11949))

(declare-fun m!11951 () Bool)

(assert (=> d!3377 m!11951))

(declare-fun m!11953 () Bool)

(assert (=> b!16951 m!11953))

(assert (=> d!3369 d!3377))

(assert (=> d!3369 d!3365))

(declare-fun bm!516 () Bool)

(declare-fun call!532 () ListLongMap!525)

(declare-fun lt!4312 () tuple2!700)

(assert (=> bm!516 (= call!532 (map!327 (_2!350 lt!4312)))))

(declare-fun b!17034 () Bool)

(declare-fun e!10613 () tuple2!700)

(declare-fun e!10622 () tuple2!700)

(assert (=> b!17034 (= e!10613 e!10622)))

(declare-fun c!1686 () Bool)

(declare-datatypes ((SeekEntryResult!42 0))(
  ( (MissingZero!42 (index!2287 (_ BitVec 32))) (Found!42 (index!2288 (_ BitVec 32))) (Intermediate!42 (undefined!854 Bool) (index!2289 (_ BitVec 32)) (x!4373 (_ BitVec 32))) (Undefined!42) (MissingVacant!42 (index!2290 (_ BitVec 32))) )
))
(declare-fun lt!4326 () SeekEntryResult!42)

(assert (=> b!17034 (= c!1686 ((_ is MissingZero!42) lt!4326))))

(declare-fun bm!517 () Bool)

(declare-fun call!541 () ListLongMap!525)

(declare-fun call!540 () ListLongMap!525)

(assert (=> bm!517 (= call!541 call!540)))

(declare-fun b!17035 () Bool)

(declare-fun res!12460 () Bool)

(declare-fun call!529 () Bool)

(assert (=> b!17035 (= res!12460 call!529)))

(declare-fun e!10627 () Bool)

(assert (=> b!17035 (=> (not res!12460) (not e!10627))))

(declare-fun b!17036 () Bool)

(declare-fun e!10614 () Bool)

(declare-fun lt!4308 () SeekEntryResult!42)

(assert (=> b!17036 (= e!10614 (= (select (arr!434 (_keys!3053 call!469)) (index!2288 lt!4308)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!17037 () Bool)

(declare-fun lt!4320 () SeekEntryResult!42)

(assert (=> b!17037 (= e!10627 (= (select (arr!434 (_keys!3053 call!469)) (index!2288 lt!4320)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!17038 () Bool)

(declare-fun res!12469 () Bool)

(declare-fun e!10612 () Bool)

(assert (=> b!17038 (=> (not res!12469) (not e!10612))))

(declare-fun lt!4314 () SeekEntryResult!42)

(assert (=> b!17038 (= res!12469 (= (select (arr!434 (_keys!3053 call!469)) (index!2287 lt!4314)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!518 () Bool)

(declare-fun call!526 () Unit!339)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!1 (array!903 array!901 (_ BitVec 32) (_ BitVec 32) V!957 V!957 (_ BitVec 64) Int) Unit!339)

(assert (=> bm!518 (= call!526 (lemmaInListMapThenSeekEntryOrOpenFindsIt!1 (_keys!3053 call!469) (_values!1626 call!469) (mask!4538 call!469) (extraKeys!1542 call!469) (zeroValue!1565 call!469) (minValue!1565 call!469) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1628 call!469)))))

(declare-fun b!17039 () Bool)

(declare-fun res!12457 () Bool)

(assert (=> b!17039 (= res!12457 (= (select (arr!434 (_keys!3053 call!469)) (index!2290 lt!4314)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!10624 () Bool)

(assert (=> b!17039 (=> (not res!12457) (not e!10624))))

(declare-fun bm!519 () Bool)

(declare-fun call!530 () ListLongMap!525)

(declare-fun call!525 () ListLongMap!525)

(assert (=> bm!519 (= call!530 call!525)))

(declare-fun b!17041 () Bool)

(declare-fun res!12463 () Bool)

(assert (=> b!17041 (=> (not res!12463) (not e!10612))))

(declare-fun call!522 () Bool)

(assert (=> b!17041 (= res!12463 call!522)))

(declare-fun e!10619 () Bool)

(assert (=> b!17041 (= e!10619 e!10612)))

(declare-fun bm!520 () Bool)

(declare-fun call!519 () Bool)

(declare-fun call!527 () Bool)

(assert (=> bm!520 (= call!519 call!527)))

(declare-fun b!17042 () Bool)

(declare-fun res!12462 () Bool)

(declare-fun lt!4318 () SeekEntryResult!42)

(assert (=> b!17042 (= res!12462 (= (select (arr!434 (_keys!3053 call!469)) (index!2290 lt!4318)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!10611 () Bool)

(assert (=> b!17042 (=> (not res!12462) (not e!10611))))

(declare-fun b!17043 () Bool)

(declare-fun e!10616 () Bool)

(declare-fun call!539 () ListLongMap!525)

(assert (=> b!17043 (= e!10616 (= call!532 call!539))))

(declare-fun c!1681 () Bool)

(declare-fun bm!521 () Bool)

(declare-fun lt!4325 () array!901)

(declare-fun c!1677 () Bool)

(declare-fun getCurrentListMap!120 (array!903 array!901 (_ BitVec 32) (_ BitVec 32) V!957 V!957 (_ BitVec 32) Int) ListLongMap!525)

(assert (=> bm!521 (= call!540 (getCurrentListMap!120 (_keys!3053 call!469) (ite (or c!1681 c!1677) (_values!1626 call!469) lt!4325) (mask!4538 call!469) (extraKeys!1542 call!469) (zeroValue!1565 call!469) (minValue!1565 call!469) #b00000000000000000000000000000000 (defaultEntry!1628 call!469)))))

(declare-fun c!1685 () Bool)

(declare-fun c!1682 () Bool)

(declare-fun c!1683 () Bool)

(declare-fun bm!522 () Bool)

(declare-fun c!1676 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!522 (= call!527 (inRange!0 (ite c!1677 (ite c!1683 (index!2288 lt!4308) (ite c!1676 (index!2287 lt!4318) (index!2290 lt!4318))) (ite c!1685 (index!2288 lt!4320) (ite c!1682 (index!2287 lt!4314) (index!2290 lt!4314)))) (mask!4538 call!469)))))

(declare-fun bm!523 () Bool)

(declare-fun call!524 () Bool)

(assert (=> bm!523 (= call!524 call!519)))

(declare-fun bm!524 () Bool)

(declare-fun c!1679 () Bool)

(assert (=> bm!524 (= c!1679 c!1677)))

(declare-fun call!534 () Bool)

(declare-fun e!10625 () ListLongMap!525)

(declare-fun contains!209 (ListLongMap!525 (_ BitVec 64)) Bool)

(assert (=> bm!524 (= call!534 (contains!209 e!10625 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!525 () Bool)

(declare-fun call!528 () ListLongMap!525)

(declare-fun call!520 () ListLongMap!525)

(assert (=> bm!525 (= call!528 call!520)))

(declare-fun e!10626 () Bool)

(declare-fun b!17044 () Bool)

(declare-fun +!35 (ListLongMap!525 tuple2!702) ListLongMap!525)

(assert (=> b!17044 (= e!10626 (= call!532 (+!35 call!539 (tuple2!703 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1565 (v!1403 (underlying!29 thiss!848)))))))))

(declare-fun bm!526 () Bool)

(declare-fun call!533 () SeekEntryResult!42)

(declare-fun call!531 () SeekEntryResult!42)

(assert (=> bm!526 (= call!533 call!531)))

(declare-fun bm!527 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!903 (_ BitVec 32)) SeekEntryResult!42)

(assert (=> bm!527 (= call!531 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3053 call!469) (mask!4538 call!469)))))

(declare-fun b!17045 () Bool)

(declare-fun res!12470 () Bool)

(declare-fun e!10628 () Bool)

(assert (=> b!17045 (=> (not res!12470) (not e!10628))))

(assert (=> b!17045 (= res!12470 (= (select (arr!434 (_keys!3053 call!469)) (index!2287 lt!4318)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!17046 () Bool)

(declare-fun e!10610 () Bool)

(assert (=> b!17046 (= e!10610 e!10616)))

(declare-fun c!1675 () Bool)

(assert (=> b!17046 (= c!1675 (_1!350 lt!4312))))

(declare-fun b!17047 () Bool)

(declare-fun e!10629 () Unit!339)

(declare-fun Unit!346 () Unit!339)

(assert (=> b!17047 (= e!10629 Unit!346)))

(declare-fun lt!4332 () Unit!339)

(assert (=> b!17047 (= lt!4332 call!526)))

(assert (=> b!17047 (= lt!4308 call!533)))

(declare-fun res!12465 () Bool)

(assert (=> b!17047 (= res!12465 ((_ is Found!42) lt!4308))))

(assert (=> b!17047 (=> (not res!12465) (not e!10614))))

(assert (=> b!17047 e!10614))

(declare-fun lt!4333 () Unit!339)

(assert (=> b!17047 (= lt!4333 lt!4332)))

(assert (=> b!17047 false))

(declare-fun b!17048 () Bool)

(declare-fun call!523 () Bool)

(assert (=> b!17048 (= e!10624 (not call!523))))

(declare-fun b!17049 () Bool)

(declare-fun call!542 () Bool)

(assert (=> b!17049 (= e!10611 (not call!542))))

(declare-fun b!17050 () Bool)

(declare-fun e!10630 () Unit!339)

(declare-fun Unit!347 () Unit!339)

(assert (=> b!17050 (= e!10630 Unit!347)))

(declare-fun lt!4331 () Unit!339)

(declare-fun call!538 () Unit!339)

(assert (=> b!17050 (= lt!4331 call!538)))

(declare-fun call!521 () SeekEntryResult!42)

(assert (=> b!17050 (= lt!4314 call!521)))

(assert (=> b!17050 (= c!1682 ((_ is MissingZero!42) lt!4314))))

(assert (=> b!17050 e!10619))

(declare-fun lt!4323 () Unit!339)

(assert (=> b!17050 (= lt!4323 lt!4331)))

(assert (=> b!17050 false))

(declare-fun bm!528 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!1 (array!903 array!901 (_ BitVec 32) (_ BitVec 32) V!957 V!957 (_ BitVec 64) Int) Unit!339)

(assert (=> bm!528 (= call!538 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!1 (_keys!3053 call!469) (_values!1626 call!469) (mask!4538 call!469) (extraKeys!1542 call!469) (zeroValue!1565 call!469) (minValue!1565 call!469) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1628 call!469)))))

(declare-fun bm!529 () Bool)

(declare-fun call!536 () ListLongMap!525)

(assert (=> bm!529 (= call!536 call!540)))

(declare-fun b!17051 () Bool)

(assert (=> b!17051 (= e!10625 call!541)))

(declare-fun b!17052 () Bool)

(declare-fun lt!4329 () tuple2!700)

(declare-fun call!535 () tuple2!700)

(assert (=> b!17052 (= lt!4329 call!535)))

(assert (=> b!17052 (= e!10622 (tuple2!701 (_1!350 lt!4329) (_2!350 lt!4329)))))

(declare-fun b!17053 () Bool)

(declare-fun c!1674 () Bool)

(assert (=> b!17053 (= c!1674 ((_ is MissingVacant!42) lt!4326))))

(declare-fun e!10615 () tuple2!700)

(assert (=> b!17053 (= e!10615 e!10613)))

(declare-fun bm!530 () Bool)

(declare-fun call!537 () Bool)

(assert (=> bm!530 (= call!537 (arrayContainsKey!0 (_keys!3053 call!469) #b0000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000))))

(declare-fun b!17054 () Bool)

(declare-fun res!12464 () Bool)

(assert (=> b!17054 (=> (not res!12464) (not e!10628))))

(assert (=> b!17054 (= res!12464 call!524)))

(declare-fun e!10621 () Bool)

(assert (=> b!17054 (= e!10621 e!10628)))

(declare-fun b!17055 () Bool)

(declare-fun c!1680 () Bool)

(assert (=> b!17055 (= c!1680 ((_ is MissingVacant!42) lt!4318))))

(declare-fun e!10623 () Bool)

(assert (=> b!17055 (= e!10621 e!10623)))

(declare-fun b!17056 () Bool)

(declare-fun lt!4316 () Unit!339)

(declare-fun lt!4319 () Unit!339)

(assert (=> b!17056 (= lt!4316 lt!4319)))

(assert (=> b!17056 (contains!209 call!541 (select (arr!434 (_keys!3053 call!469)) (index!2288 lt!4326)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!1 (array!903 array!901 (_ BitVec 32) (_ BitVec 32) V!957 V!957 (_ BitVec 32) Int) Unit!339)

(assert (=> b!17056 (= lt!4319 (lemmaValidKeyInArrayIsInListMap!1 (_keys!3053 call!469) lt!4325 (mask!4538 call!469) (extraKeys!1542 call!469) (zeroValue!1565 call!469) (minValue!1565 call!469) (index!2288 lt!4326) (defaultEntry!1628 call!469)))))

(assert (=> b!17056 (= lt!4325 (array!902 (store (arr!433 (_values!1626 call!469)) (index!2288 lt!4326) (ValueCellFull!225 (zeroValue!1565 (v!1403 (underlying!29 thiss!848))))) (size!522 (_values!1626 call!469))))))

(declare-fun lt!4322 () Unit!339)

(declare-fun lt!4330 () Unit!339)

(assert (=> b!17056 (= lt!4322 lt!4330)))

(assert (=> b!17056 (= call!525 (getCurrentListMap!120 (_keys!3053 call!469) (array!902 (store (arr!433 (_values!1626 call!469)) (index!2288 lt!4326) (ValueCellFull!225 (zeroValue!1565 (v!1403 (underlying!29 thiss!848))))) (size!522 (_values!1626 call!469))) (mask!4538 call!469) (extraKeys!1542 call!469) (zeroValue!1565 call!469) (minValue!1565 call!469) #b00000000000000000000000000000000 (defaultEntry!1628 call!469)))))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!1 (array!903 array!901 (_ BitVec 32) (_ BitVec 32) V!957 V!957 (_ BitVec 32) (_ BitVec 64) V!957 Int) Unit!339)

(assert (=> b!17056 (= lt!4330 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!1 (_keys!3053 call!469) (_values!1626 call!469) (mask!4538 call!469) (extraKeys!1542 call!469) (zeroValue!1565 call!469) (minValue!1565 call!469) (index!2288 lt!4326) #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1565 (v!1403 (underlying!29 thiss!848))) (defaultEntry!1628 call!469)))))

(declare-fun lt!4309 () Unit!339)

(assert (=> b!17056 (= lt!4309 e!10630)))

(assert (=> b!17056 (= c!1685 call!534)))

(assert (=> b!17056 (= e!10622 (tuple2!701 true (LongMapFixedSize!37 (defaultEntry!1628 call!469) (mask!4538 call!469) (extraKeys!1542 call!469) (zeroValue!1565 call!469) (minValue!1565 call!469) (_size!49 call!469) (_keys!3053 call!469) (array!902 (store (arr!433 (_values!1626 call!469)) (index!2288 lt!4326) (ValueCellFull!225 (zeroValue!1565 (v!1403 (underlying!29 thiss!848))))) (size!522 (_values!1626 call!469))) (_vacant!49 call!469))))))

(declare-fun b!17057 () Bool)

(declare-fun lt!4313 () Unit!339)

(assert (=> b!17057 (= lt!4313 e!10629)))

(assert (=> b!17057 (= c!1683 call!534)))

(assert (=> b!17057 (= e!10615 (tuple2!701 false call!469))))

(declare-fun b!17058 () Bool)

(declare-fun c!1678 () Bool)

(assert (=> b!17058 (= c!1678 ((_ is MissingVacant!42) lt!4314))))

(declare-fun e!10617 () Bool)

(assert (=> b!17058 (= e!10619 e!10617)))

(declare-fun bm!531 () Bool)

(assert (=> bm!531 (= call!521 call!531)))

(declare-fun b!17059 () Bool)

(declare-fun res!12466 () Bool)

(assert (=> b!17059 (= res!12466 call!519)))

(assert (=> b!17059 (=> (not res!12466) (not e!10614))))

(declare-fun c!1684 () Bool)

(declare-fun bm!532 () Bool)

(assert (=> bm!532 (= call!525 (+!35 (ite c!1681 call!536 call!520) (ite c!1681 (ite c!1684 (tuple2!703 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1565 (v!1403 (underlying!29 thiss!848)))) (tuple2!703 #b1000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1565 (v!1403 (underlying!29 thiss!848))))) (tuple2!703 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1565 (v!1403 (underlying!29 thiss!848)))))))))

(declare-fun b!17060 () Bool)

(declare-fun lt!4328 () tuple2!700)

(assert (=> b!17060 (= e!10613 (tuple2!701 (_1!350 lt!4328) (_2!350 lt!4328)))))

(assert (=> b!17060 (= lt!4328 call!535)))

(declare-fun lt!4307 () (_ BitVec 32))

(declare-fun lt!4324 () (_ BitVec 32))

(declare-fun bm!533 () Bool)

(assert (=> bm!533 (= call!520 (getCurrentListMap!120 (_keys!3053 call!469) (_values!1626 call!469) (mask!4538 call!469) (ite c!1681 (ite c!1684 lt!4307 lt!4324) (extraKeys!1542 call!469)) (ite (and c!1681 c!1684) (zeroValue!1565 (v!1403 (underlying!29 thiss!848))) (zeroValue!1565 call!469)) (ite c!1681 (ite c!1684 (minValue!1565 call!469) (zeroValue!1565 (v!1403 (underlying!29 thiss!848)))) (minValue!1565 call!469)) #b00000000000000000000000000000000 (defaultEntry!1628 call!469)))))

(declare-fun b!17061 () Bool)

(assert (=> b!17061 (= e!10623 ((_ is Undefined!42) lt!4318))))

(declare-fun b!17062 () Bool)

(assert (=> b!17062 (= e!10623 e!10611)))

(declare-fun res!12458 () Bool)

(assert (=> b!17062 (= res!12458 call!524)))

(assert (=> b!17062 (=> (not res!12458) (not e!10611))))

(declare-fun bm!534 () Bool)

(assert (=> bm!534 (= call!539 (map!327 call!469))))

(declare-fun bm!535 () Bool)

(assert (=> bm!535 (= call!522 call!529)))

(declare-fun b!17063 () Bool)

(assert (=> b!17063 (= e!10625 call!520)))

(declare-fun bm!536 () Bool)

(assert (=> bm!536 (= call!523 call!537)))

(declare-fun b!17064 () Bool)

(assert (=> b!17064 (= e!10617 e!10624)))

(declare-fun res!12461 () Bool)

(assert (=> b!17064 (= res!12461 call!522)))

(assert (=> b!17064 (=> (not res!12461) (not e!10624))))

(declare-fun b!17065 () Bool)

(declare-fun lt!4311 () Unit!339)

(assert (=> b!17065 (= e!10629 lt!4311)))

(assert (=> b!17065 (= lt!4311 call!538)))

(assert (=> b!17065 (= lt!4318 call!533)))

(assert (=> b!17065 (= c!1676 ((_ is MissingZero!42) lt!4318))))

(assert (=> b!17065 e!10621))

(declare-fun b!17066 () Bool)

(assert (=> b!17066 (= e!10616 e!10626)))

(declare-fun res!12468 () Bool)

(assert (=> b!17066 (= res!12468 (contains!209 call!532 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!17066 (=> (not res!12468) (not e!10626))))

(declare-fun b!17067 () Bool)

(assert (=> b!17067 (= e!10612 (not call!523))))

(declare-fun bm!537 () Bool)

(assert (=> bm!537 (= call!529 call!527)))

(declare-fun b!17068 () Bool)

(declare-fun lt!4315 () Unit!339)

(declare-fun lt!4327 () Unit!339)

(assert (=> b!17068 (= lt!4315 lt!4327)))

(assert (=> b!17068 (= call!530 call!528)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!1 (array!903 array!901 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!957 V!957 V!957 Int) Unit!339)

(assert (=> b!17068 (= lt!4327 (lemmaChangeZeroKeyThenAddPairToListMap!1 (_keys!3053 call!469) (_values!1626 call!469) (mask!4538 call!469) (extraKeys!1542 call!469) lt!4307 (zeroValue!1565 call!469) (zeroValue!1565 (v!1403 (underlying!29 thiss!848))) (minValue!1565 call!469) (defaultEntry!1628 call!469)))))

(assert (=> b!17068 (= lt!4307 (bvor (extraKeys!1542 call!469) #b00000000000000000000000000000001))))

(declare-fun e!10618 () tuple2!700)

(assert (=> b!17068 (= e!10618 (tuple2!701 true (LongMapFixedSize!37 (defaultEntry!1628 call!469) (mask!4538 call!469) (bvor (extraKeys!1542 call!469) #b00000000000000000000000000000001) (zeroValue!1565 (v!1403 (underlying!29 thiss!848))) (minValue!1565 call!469) (_size!49 call!469) (_keys!3053 call!469) (_values!1626 call!469) (_vacant!49 call!469))))))

(declare-fun bm!538 () Bool)

(declare-fun updateHelperNewKey!1 (LongMapFixedSize!36 (_ BitVec 64) V!957 (_ BitVec 32)) tuple2!700)

(assert (=> bm!538 (= call!535 (updateHelperNewKey!1 call!469 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1565 (v!1403 (underlying!29 thiss!848))) (ite c!1674 (index!2290 lt!4326) (index!2287 lt!4326))))))

(declare-fun b!17069 () Bool)

(declare-fun lt!4317 () Unit!339)

(declare-fun lt!4321 () Unit!339)

(assert (=> b!17069 (= lt!4317 lt!4321)))

(assert (=> b!17069 (= call!530 call!528)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!1 (array!903 array!901 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!957 V!957 V!957 Int) Unit!339)

(assert (=> b!17069 (= lt!4321 (lemmaChangeLongMinValueKeyThenAddPairToListMap!1 (_keys!3053 call!469) (_values!1626 call!469) (mask!4538 call!469) (extraKeys!1542 call!469) lt!4324 (zeroValue!1565 call!469) (minValue!1565 call!469) (zeroValue!1565 (v!1403 (underlying!29 thiss!848))) (defaultEntry!1628 call!469)))))

(assert (=> b!17069 (= lt!4324 (bvor (extraKeys!1542 call!469) #b00000000000000000000000000000010))))

(assert (=> b!17069 (= e!10618 (tuple2!701 true (LongMapFixedSize!37 (defaultEntry!1628 call!469) (mask!4538 call!469) (bvor (extraKeys!1542 call!469) #b00000000000000000000000000000010) (zeroValue!1565 call!469) (zeroValue!1565 (v!1403 (underlying!29 thiss!848))) (_size!49 call!469) (_keys!3053 call!469) (_values!1626 call!469) (_vacant!49 call!469))))))

(declare-fun b!17070 () Bool)

(declare-fun lt!4310 () Unit!339)

(assert (=> b!17070 (= e!10630 lt!4310)))

(assert (=> b!17070 (= lt!4310 call!526)))

(assert (=> b!17070 (= lt!4320 call!521)))

(declare-fun res!12459 () Bool)

(assert (=> b!17070 (= res!12459 ((_ is Found!42) lt!4320))))

(assert (=> b!17070 (=> (not res!12459) (not e!10627))))

(assert (=> b!17070 e!10627))

(declare-fun b!17071 () Bool)

(declare-fun e!10620 () tuple2!700)

(assert (=> b!17071 (= e!10620 e!10618)))

(assert (=> b!17071 (= c!1684 (= #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!17072 () Bool)

(assert (=> b!17072 (= e!10628 (not call!542))))

(declare-fun b!17073 () Bool)

(assert (=> b!17073 (= e!10617 ((_ is Undefined!42) lt!4314))))

(declare-fun bm!539 () Bool)

(assert (=> bm!539 (= call!542 call!537)))

(declare-fun d!3379 () Bool)

(assert (=> d!3379 e!10610))

(declare-fun res!12467 () Bool)

(assert (=> d!3379 (=> (not res!12467) (not e!10610))))

(assert (=> d!3379 (= res!12467 (valid!21 (_2!350 lt!4312)))))

(assert (=> d!3379 (= lt!4312 e!10620)))

(assert (=> d!3379 (= c!1681 (= #b0000000000000000000000000000000000000000000000000000000000000000 (bvneg #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3379 (valid!21 call!469)))

(assert (=> d!3379 (= (update!2 call!469 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1565 (v!1403 (underlying!29 thiss!848)))) lt!4312)))

(declare-fun b!17040 () Bool)

(assert (=> b!17040 (= e!10620 e!10615)))

(assert (=> b!17040 (= lt!4326 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3053 call!469) (mask!4538 call!469)))))

(assert (=> b!17040 (= c!1677 ((_ is Undefined!42) lt!4326))))

(assert (= (and d!3379 c!1681) b!17071))

(assert (= (and d!3379 (not c!1681)) b!17040))

(assert (= (and b!17071 c!1684) b!17068))

(assert (= (and b!17071 (not c!1684)) b!17069))

(assert (= (or b!17068 b!17069) bm!529))

(assert (= (or b!17068 b!17069) bm!525))

(assert (= (or b!17068 b!17069) bm!519))

(assert (= (and b!17040 c!1677) b!17057))

(assert (= (and b!17040 (not c!1677)) b!17053))

(assert (= (and b!17057 c!1683) b!17047))

(assert (= (and b!17057 (not c!1683)) b!17065))

(assert (= (and b!17047 res!12465) b!17059))

(assert (= (and b!17059 res!12466) b!17036))

(assert (= (and b!17065 c!1676) b!17054))

(assert (= (and b!17065 (not c!1676)) b!17055))

(assert (= (and b!17054 res!12464) b!17045))

(assert (= (and b!17045 res!12470) b!17072))

(assert (= (and b!17055 c!1680) b!17062))

(assert (= (and b!17055 (not c!1680)) b!17061))

(assert (= (and b!17062 res!12458) b!17042))

(assert (= (and b!17042 res!12462) b!17049))

(assert (= (or b!17054 b!17062) bm!523))

(assert (= (or b!17072 b!17049) bm!539))

(assert (= (or b!17059 bm!523) bm!520))

(assert (= (or b!17047 b!17065) bm!526))

(assert (= (and b!17053 c!1674) b!17060))

(assert (= (and b!17053 (not c!1674)) b!17034))

(assert (= (and b!17034 c!1686) b!17052))

(assert (= (and b!17034 (not c!1686)) b!17056))

(assert (= (and b!17056 c!1685) b!17070))

(assert (= (and b!17056 (not c!1685)) b!17050))

(assert (= (and b!17070 res!12459) b!17035))

(assert (= (and b!17035 res!12460) b!17037))

(assert (= (and b!17050 c!1682) b!17041))

(assert (= (and b!17050 (not c!1682)) b!17058))

(assert (= (and b!17041 res!12463) b!17038))

(assert (= (and b!17038 res!12469) b!17067))

(assert (= (and b!17058 c!1678) b!17064))

(assert (= (and b!17058 (not c!1678)) b!17073))

(assert (= (and b!17064 res!12461) b!17039))

(assert (= (and b!17039 res!12457) b!17048))

(assert (= (or b!17041 b!17064) bm!535))

(assert (= (or b!17067 b!17048) bm!536))

(assert (= (or b!17035 bm!535) bm!537))

(assert (= (or b!17070 b!17050) bm!531))

(assert (= (or b!17060 b!17052) bm!538))

(assert (= (or b!17057 b!17056) bm!517))

(assert (= (or bm!520 bm!537) bm!522))

(assert (= (or b!17047 b!17070) bm!518))

(assert (= (or bm!539 bm!536) bm!530))

(assert (= (or bm!526 bm!531) bm!527))

(assert (= (or b!17065 b!17050) bm!528))

(assert (= (or b!17057 b!17056) bm!524))

(assert (= (and bm!524 c!1679) b!17051))

(assert (= (and bm!524 (not c!1679)) b!17063))

(assert (= (or bm!525 b!17056 b!17063) bm!533))

(assert (= (or bm!529 bm!517) bm!521))

(assert (= (or bm!519 b!17056) bm!532))

(assert (= (and d!3379 res!12467) b!17046))

(assert (= (and b!17046 c!1675) b!17066))

(assert (= (and b!17046 (not c!1675)) b!17043))

(assert (= (and b!17066 res!12468) b!17044))

(assert (= (or b!17044 b!17043) bm!534))

(assert (= (or b!17066 b!17044 b!17043) bm!516))

(declare-fun m!11955 () Bool)

(assert (=> bm!524 m!11955))

(declare-fun m!11957 () Bool)

(assert (=> b!17038 m!11957))

(declare-fun m!11959 () Bool)

(assert (=> b!17040 m!11959))

(declare-fun m!11961 () Bool)

(assert (=> b!17069 m!11961))

(declare-fun m!11963 () Bool)

(assert (=> d!3379 m!11963))

(declare-fun m!11965 () Bool)

(assert (=> d!3379 m!11965))

(declare-fun m!11967 () Bool)

(assert (=> bm!521 m!11967))

(declare-fun m!11969 () Bool)

(assert (=> bm!530 m!11969))

(declare-fun m!11971 () Bool)

(assert (=> bm!516 m!11971))

(declare-fun m!11973 () Bool)

(assert (=> b!17037 m!11973))

(declare-fun m!11975 () Bool)

(assert (=> b!17036 m!11975))

(declare-fun m!11977 () Bool)

(assert (=> b!17066 m!11977))

(declare-fun m!11979 () Bool)

(assert (=> b!17045 m!11979))

(declare-fun m!11981 () Bool)

(assert (=> bm!528 m!11981))

(declare-fun m!11983 () Bool)

(assert (=> b!17056 m!11983))

(declare-fun m!11985 () Bool)

(assert (=> b!17056 m!11985))

(declare-fun m!11987 () Bool)

(assert (=> b!17056 m!11987))

(declare-fun m!11989 () Bool)

(assert (=> b!17056 m!11989))

(assert (=> b!17056 m!11985))

(declare-fun m!11991 () Bool)

(assert (=> b!17056 m!11991))

(declare-fun m!11993 () Bool)

(assert (=> b!17056 m!11993))

(declare-fun m!11995 () Bool)

(assert (=> bm!534 m!11995))

(declare-fun m!11997 () Bool)

(assert (=> bm!522 m!11997))

(declare-fun m!11999 () Bool)

(assert (=> bm!532 m!11999))

(declare-fun m!12001 () Bool)

(assert (=> bm!518 m!12001))

(declare-fun m!12003 () Bool)

(assert (=> bm!533 m!12003))

(declare-fun m!12005 () Bool)

(assert (=> b!17068 m!12005))

(assert (=> bm!527 m!11959))

(declare-fun m!12007 () Bool)

(assert (=> b!17044 m!12007))

(declare-fun m!12009 () Bool)

(assert (=> b!17039 m!12009))

(declare-fun m!12011 () Bool)

(assert (=> bm!538 m!12011))

(declare-fun m!12013 () Bool)

(assert (=> b!17042 m!12013))

(assert (=> b!16916 d!3379))

(declare-fun b!17082 () Bool)

(declare-fun e!10639 () Bool)

(declare-fun call!545 () Bool)

(assert (=> b!17082 (= e!10639 call!545)))

(declare-fun b!17083 () Bool)

(declare-fun e!10638 () Bool)

(assert (=> b!17083 (= e!10638 e!10639)))

(declare-fun c!1689 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!17083 (= c!1689 (validKeyInArray!0 (select (arr!434 (_keys!3053 (v!1403 (underlying!29 (_2!348 lt!4144))))) #b00000000000000000000000000000000)))))

(declare-fun bm!542 () Bool)

(assert (=> bm!542 (= call!545 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3053 (v!1403 (underlying!29 (_2!348 lt!4144)))) (mask!4538 (v!1403 (underlying!29 (_2!348 lt!4144))))))))

(declare-fun d!3381 () Bool)

(declare-fun res!12476 () Bool)

(assert (=> d!3381 (=> res!12476 e!10638)))

(assert (=> d!3381 (= res!12476 (bvsge #b00000000000000000000000000000000 (size!523 (_keys!3053 (v!1403 (underlying!29 (_2!348 lt!4144)))))))))

(assert (=> d!3381 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3053 (v!1403 (underlying!29 (_2!348 lt!4144)))) (mask!4538 (v!1403 (underlying!29 (_2!348 lt!4144))))) e!10638)))

(declare-fun b!17084 () Bool)

(declare-fun e!10637 () Bool)

(assert (=> b!17084 (= e!10639 e!10637)))

(declare-fun lt!4340 () (_ BitVec 64))

(assert (=> b!17084 (= lt!4340 (select (arr!434 (_keys!3053 (v!1403 (underlying!29 (_2!348 lt!4144))))) #b00000000000000000000000000000000))))

(declare-fun lt!4342 () Unit!339)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!903 (_ BitVec 64) (_ BitVec 32)) Unit!339)

(assert (=> b!17084 (= lt!4342 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3053 (v!1403 (underlying!29 (_2!348 lt!4144)))) lt!4340 #b00000000000000000000000000000000))))

(assert (=> b!17084 (arrayContainsKey!0 (_keys!3053 (v!1403 (underlying!29 (_2!348 lt!4144)))) lt!4340 #b00000000000000000000000000000000)))

(declare-fun lt!4341 () Unit!339)

(assert (=> b!17084 (= lt!4341 lt!4342)))

(declare-fun res!12475 () Bool)

(assert (=> b!17084 (= res!12475 (= (seekEntryOrOpen!0 (select (arr!434 (_keys!3053 (v!1403 (underlying!29 (_2!348 lt!4144))))) #b00000000000000000000000000000000) (_keys!3053 (v!1403 (underlying!29 (_2!348 lt!4144)))) (mask!4538 (v!1403 (underlying!29 (_2!348 lt!4144))))) (Found!42 #b00000000000000000000000000000000)))))

(assert (=> b!17084 (=> (not res!12475) (not e!10637))))

(declare-fun b!17085 () Bool)

(assert (=> b!17085 (= e!10637 call!545)))

(assert (= (and d!3381 (not res!12476)) b!17083))

(assert (= (and b!17083 c!1689) b!17084))

(assert (= (and b!17083 (not c!1689)) b!17082))

(assert (= (and b!17084 res!12475) b!17085))

(assert (= (or b!17085 b!17082) bm!542))

(declare-fun m!12015 () Bool)

(assert (=> b!17083 m!12015))

(assert (=> b!17083 m!12015))

(declare-fun m!12017 () Bool)

(assert (=> b!17083 m!12017))

(declare-fun m!12019 () Bool)

(assert (=> bm!542 m!12019))

(assert (=> b!17084 m!12015))

(declare-fun m!12021 () Bool)

(assert (=> b!17084 m!12021))

(declare-fun m!12023 () Bool)

(assert (=> b!17084 m!12023))

(assert (=> b!17084 m!12015))

(declare-fun m!12025 () Bool)

(assert (=> b!17084 m!12025))

(assert (=> b!16888 d!3381))

(declare-fun d!3383 () Bool)

(declare-fun res!12477 () Bool)

(declare-fun e!10640 () Bool)

(assert (=> d!3383 (=> (not res!12477) (not e!10640))))

(assert (=> d!3383 (= res!12477 (simpleValid!8 (v!1403 (underlying!29 thiss!848))))))

(assert (=> d!3383 (= (valid!21 (v!1403 (underlying!29 thiss!848))) e!10640)))

(declare-fun b!17086 () Bool)

(declare-fun res!12478 () Bool)

(assert (=> b!17086 (=> (not res!12478) (not e!10640))))

(assert (=> b!17086 (= res!12478 (= (arrayCountValidKeys!0 (_keys!3053 (v!1403 (underlying!29 thiss!848))) #b00000000000000000000000000000000 (size!523 (_keys!3053 (v!1403 (underlying!29 thiss!848))))) (_size!49 (v!1403 (underlying!29 thiss!848)))))))

(declare-fun b!17087 () Bool)

(declare-fun res!12479 () Bool)

(assert (=> b!17087 (=> (not res!12479) (not e!10640))))

(assert (=> b!17087 (= res!12479 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3053 (v!1403 (underlying!29 thiss!848))) (mask!4538 (v!1403 (underlying!29 thiss!848)))))))

(declare-fun b!17088 () Bool)

(assert (=> b!17088 (= e!10640 (arrayNoDuplicates!0 (_keys!3053 (v!1403 (underlying!29 thiss!848))) #b00000000000000000000000000000000 Nil!529))))

(assert (= (and d!3383 res!12477) b!17086))

(assert (= (and b!17086 res!12478) b!17087))

(assert (= (and b!17087 res!12479) b!17088))

(declare-fun m!12027 () Bool)

(assert (=> d!3383 m!12027))

(declare-fun m!12029 () Bool)

(assert (=> b!17086 m!12029))

(declare-fun m!12031 () Bool)

(assert (=> b!17087 m!12031))

(declare-fun m!12033 () Bool)

(assert (=> b!17088 m!12033))

(assert (=> d!3365 d!3383))

(declare-fun b!17099 () Bool)

(declare-fun e!10649 () Bool)

(declare-fun contains!210 (List!532 (_ BitVec 64)) Bool)

(assert (=> b!17099 (= e!10649 (contains!210 Nil!529 (select (arr!434 (_keys!3053 (v!1403 (underlying!29 (_2!348 lt!4144))))) #b00000000000000000000000000000000)))))

(declare-fun b!17100 () Bool)

(declare-fun e!10650 () Bool)

(declare-fun e!10651 () Bool)

(assert (=> b!17100 (= e!10650 e!10651)))

(declare-fun res!12488 () Bool)

(assert (=> b!17100 (=> (not res!12488) (not e!10651))))

(assert (=> b!17100 (= res!12488 (not e!10649))))

(declare-fun res!12486 () Bool)

(assert (=> b!17100 (=> (not res!12486) (not e!10649))))

(assert (=> b!17100 (= res!12486 (validKeyInArray!0 (select (arr!434 (_keys!3053 (v!1403 (underlying!29 (_2!348 lt!4144))))) #b00000000000000000000000000000000)))))

(declare-fun b!17101 () Bool)

(declare-fun e!10652 () Bool)

(assert (=> b!17101 (= e!10651 e!10652)))

(declare-fun c!1692 () Bool)

(assert (=> b!17101 (= c!1692 (validKeyInArray!0 (select (arr!434 (_keys!3053 (v!1403 (underlying!29 (_2!348 lt!4144))))) #b00000000000000000000000000000000)))))

(declare-fun d!3385 () Bool)

(declare-fun res!12487 () Bool)

(assert (=> d!3385 (=> res!12487 e!10650)))

(assert (=> d!3385 (= res!12487 (bvsge #b00000000000000000000000000000000 (size!523 (_keys!3053 (v!1403 (underlying!29 (_2!348 lt!4144)))))))))

(assert (=> d!3385 (= (arrayNoDuplicates!0 (_keys!3053 (v!1403 (underlying!29 (_2!348 lt!4144)))) #b00000000000000000000000000000000 Nil!529) e!10650)))

(declare-fun b!17102 () Bool)

(declare-fun call!548 () Bool)

(assert (=> b!17102 (= e!10652 call!548)))

(declare-fun b!17103 () Bool)

(assert (=> b!17103 (= e!10652 call!548)))

(declare-fun bm!545 () Bool)

(assert (=> bm!545 (= call!548 (arrayNoDuplicates!0 (_keys!3053 (v!1403 (underlying!29 (_2!348 lt!4144)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!1692 (Cons!528 (select (arr!434 (_keys!3053 (v!1403 (underlying!29 (_2!348 lt!4144))))) #b00000000000000000000000000000000) Nil!529) Nil!529)))))

(assert (= (and d!3385 (not res!12487)) b!17100))

(assert (= (and b!17100 res!12486) b!17099))

(assert (= (and b!17100 res!12488) b!17101))

(assert (= (and b!17101 c!1692) b!17102))

(assert (= (and b!17101 (not c!1692)) b!17103))

(assert (= (or b!17102 b!17103) bm!545))

(assert (=> b!17099 m!12015))

(assert (=> b!17099 m!12015))

(declare-fun m!12035 () Bool)

(assert (=> b!17099 m!12035))

(assert (=> b!17100 m!12015))

(assert (=> b!17100 m!12015))

(assert (=> b!17100 m!12017))

(assert (=> b!17101 m!12015))

(assert (=> b!17101 m!12015))

(assert (=> b!17101 m!12017))

(assert (=> bm!545 m!12015))

(declare-fun m!12037 () Bool)

(assert (=> bm!545 m!12037))

(assert (=> b!16889 d!3385))

(declare-fun d!3387 () Bool)

(assert (=> d!3387 (= (map!326 (_2!348 lt!4172)) (map!327 (v!1403 (underlying!29 (_2!348 lt!4172)))))))

(declare-fun bs!805 () Bool)

(assert (= bs!805 d!3387))

(declare-fun m!12039 () Bool)

(assert (=> bs!805 m!12039))

(assert (=> b!16914 d!3387))

(declare-fun d!3389 () Bool)

(assert (=> d!3389 (= (map!326 thiss!848) (map!327 (v!1403 (underlying!29 thiss!848))))))

(declare-fun bs!806 () Bool)

(assert (= bs!806 d!3389))

(declare-fun m!12041 () Bool)

(assert (=> bs!806 m!12041))

(assert (=> b!16914 d!3389))

(declare-fun b!17132 () Bool)

(declare-fun e!10670 () tuple2!700)

(declare-fun lt!4411 () tuple2!700)

(assert (=> b!17132 (= e!10670 (tuple2!701 true (_2!350 lt!4411)))))

(declare-fun lt!4409 () ListLongMap!525)

(declare-fun call!585 () ListLongMap!525)

(assert (=> b!17132 (= lt!4409 call!585)))

(declare-fun lt!4426 () (_ BitVec 64))

(assert (=> b!17132 (= lt!4426 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!4419 () Unit!339)

(declare-fun call!580 () Unit!339)

(assert (=> b!17132 (= lt!4419 call!580)))

(declare-fun call!587 () ListLongMap!525)

(declare-fun call!582 () ListLongMap!525)

(assert (=> b!17132 (= call!587 call!582)))

(declare-fun lt!4423 () Unit!339)

(assert (=> b!17132 (= lt!4423 lt!4419)))

(declare-fun lt!4428 () ListLongMap!525)

(declare-fun call!577 () ListLongMap!525)

(assert (=> b!17132 (= lt!4428 call!577)))

(declare-fun lt!4436 () (_ BitVec 64))

(assert (=> b!17132 (= lt!4436 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!4417 () Unit!339)

(declare-fun call!578 () Unit!339)

(assert (=> b!17132 (= lt!4417 call!578)))

(declare-fun call!586 () ListLongMap!525)

(declare-fun call!583 () ListLongMap!525)

(assert (=> b!17132 (= call!586 call!583)))

(declare-fun lt!4407 () Unit!339)

(assert (=> b!17132 (= lt!4407 lt!4417)))

(declare-fun bm!572 () Bool)

(declare-fun call!575 () ListLongMap!525)

(declare-fun lt!4422 () V!957)

(declare-fun lt!4435 () (_ BitVec 64))

(declare-fun call!584 () ListLongMap!525)

(declare-fun c!1709 () Bool)

(declare-fun lt!4437 () (_ BitVec 64))

(assert (=> bm!572 (= call!582 (+!35 (ite c!1709 call!584 call!575) (ite c!1709 (tuple2!703 lt!4435 (zeroValue!1565 (v!1403 (underlying!29 thiss!848)))) (tuple2!703 lt!4437 lt!4422))))))

(declare-fun b!17133 () Bool)

(declare-fun e!10671 () tuple2!700)

(assert (=> b!17133 (= e!10671 (tuple2!701 true (v!1403 (_2!349 lt!4173))))))

(declare-fun bm!573 () Bool)

(declare-fun call!576 () tuple2!700)

(declare-fun c!1705 () Bool)

(assert (=> bm!573 (= call!576 (repackFrom!1 thiss!848 (ite c!1705 (_2!350 lt!4411) (v!1403 (_2!349 lt!4173))) (bvsub (bvsub (size!523 (_keys!3053 (v!1403 (underlying!29 thiss!848)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun b!17134 () Bool)

(declare-fun e!10669 () Unit!339)

(declare-fun Unit!348 () Unit!339)

(assert (=> b!17134 (= e!10669 Unit!348)))

(declare-fun b!17135 () Bool)

(declare-fun e!10673 () tuple2!700)

(assert (=> b!17135 (= e!10673 (tuple2!701 false (_2!350 lt!4411)))))

(declare-fun lt!4432 () ListLongMap!525)

(declare-fun lt!4434 () (_ BitVec 64))

(declare-fun bm!574 () Bool)

(declare-fun addCommutativeForDiffKeys!1 (ListLongMap!525 (_ BitVec 64) V!957 (_ BitVec 64) V!957) Unit!339)

(assert (=> bm!574 (= call!578 (addCommutativeForDiffKeys!1 (ite c!1709 lt!4432 lt!4428) lt!4437 lt!4422 (ite c!1709 lt!4434 lt!4436) (minValue!1565 (v!1403 (underlying!29 thiss!848)))))))

(declare-fun call!581 () ListLongMap!525)

(declare-fun bm!575 () Bool)

(assert (=> bm!575 (= call!587 (+!35 (ite c!1709 call!581 call!584) (ite c!1709 (tuple2!703 lt!4437 lt!4422) (tuple2!703 lt!4426 (zeroValue!1565 (v!1403 (underlying!29 thiss!848)))))))))

(declare-fun bm!576 () Bool)

(declare-fun call!579 () ListLongMap!525)

(assert (=> bm!576 (= call!579 (+!35 (ite c!1709 lt!4432 lt!4428) (ite c!1709 (tuple2!703 lt!4437 lt!4422) (tuple2!703 lt!4436 (minValue!1565 (v!1403 (underlying!29 thiss!848)))))))))

(declare-fun bm!577 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!11 (array!903 array!901 (_ BitVec 32) (_ BitVec 32) V!957 V!957 (_ BitVec 32) Int) ListLongMap!525)

(assert (=> bm!577 (= call!585 (getCurrentListMapNoExtraKeys!11 (_keys!3053 (v!1403 (underlying!29 thiss!848))) (_values!1626 (v!1403 (underlying!29 thiss!848))) (mask!4538 (v!1403 (underlying!29 thiss!848))) (extraKeys!1542 (v!1403 (underlying!29 thiss!848))) (zeroValue!1565 (v!1403 (underlying!29 thiss!848))) (minValue!1565 (v!1403 (underlying!29 thiss!848))) (bvadd (bvsub (size!523 (_keys!3053 (v!1403 (underlying!29 thiss!848)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) (defaultEntry!1628 (v!1403 (underlying!29 thiss!848)))))))

(declare-fun b!17136 () Bool)

(assert (=> b!17136 false))

(declare-fun lt!4413 () Unit!339)

(declare-fun lt!4438 () Unit!339)

(assert (=> b!17136 (= lt!4413 lt!4438)))

(declare-fun lt!4410 () (_ BitVec 32))

(assert (=> b!17136 (not (arrayContainsKey!0 (_keys!3053 (v!1403 (underlying!29 thiss!848))) lt!4437 lt!4410))))

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!903 (_ BitVec 32) (_ BitVec 64) List!532) Unit!339)

(assert (=> b!17136 (= lt!4438 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3053 (v!1403 (underlying!29 thiss!848))) lt!4410 lt!4437 (Cons!528 lt!4437 Nil!529)))))

(assert (=> b!17136 (= lt!4410 (bvadd (bvsub (size!523 (_keys!3053 (v!1403 (underlying!29 thiss!848)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun lt!4420 () Unit!339)

(declare-fun lt!4429 () Unit!339)

(assert (=> b!17136 (= lt!4420 lt!4429)))

(assert (=> b!17136 (arrayNoDuplicates!0 (_keys!3053 (v!1403 (underlying!29 thiss!848))) (bvsub (size!523 (_keys!3053 (v!1403 (underlying!29 thiss!848)))) #b00000000000000000000000000000001) Nil!529)))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!903 (_ BitVec 32) (_ BitVec 32)) Unit!339)

(assert (=> b!17136 (= lt!4429 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3053 (v!1403 (underlying!29 thiss!848))) #b00000000000000000000000000000000 (bvsub (size!523 (_keys!3053 (v!1403 (underlying!29 thiss!848)))) #b00000000000000000000000000000001)))))

(declare-fun lt!4425 () Unit!339)

(declare-fun lt!4421 () Unit!339)

(assert (=> b!17136 (= lt!4425 lt!4421)))

(declare-fun e!10674 () Bool)

(assert (=> b!17136 e!10674))

(declare-fun c!1707 () Bool)

(assert (=> b!17136 (= c!1707 (and (not (= lt!4437 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!4437 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!4431 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!1 (array!903 array!901 (_ BitVec 32) (_ BitVec 32) V!957 V!957 (_ BitVec 64) (_ BitVec 32) Int) Unit!339)

(assert (=> b!17136 (= lt!4421 (lemmaListMapContainsThenArrayContainsFrom!1 (_keys!3053 (v!1403 (underlying!29 thiss!848))) (_values!1626 (v!1403 (underlying!29 thiss!848))) (mask!4538 (v!1403 (underlying!29 thiss!848))) (extraKeys!1542 (v!1403 (underlying!29 thiss!848))) (zeroValue!1565 (v!1403 (underlying!29 thiss!848))) (minValue!1565 (v!1403 (underlying!29 thiss!848))) lt!4437 lt!4431 (defaultEntry!1628 (v!1403 (underlying!29 thiss!848)))))))

(assert (=> b!17136 (= lt!4431 (bvadd (bvsub (size!523 (_keys!3053 (v!1403 (underlying!29 thiss!848)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun Unit!349 () Unit!339)

(assert (=> b!17136 (= e!10669 Unit!349)))

(declare-fun bm!578 () Bool)

(declare-fun lt!4412 () ListLongMap!525)

(assert (=> bm!578 (= call!580 (addCommutativeForDiffKeys!1 (ite c!1709 lt!4412 lt!4409) lt!4437 lt!4422 (ite c!1709 lt!4435 lt!4426) (zeroValue!1565 (v!1403 (underlying!29 thiss!848)))))))

(declare-fun b!17137 () Bool)

(declare-fun e!10675 () tuple2!700)

(assert (=> b!17137 (= e!10675 e!10673)))

(assert (=> b!17137 (= lt!4411 (update!2 (v!1403 (_2!349 lt!4173)) lt!4437 lt!4422))))

(declare-fun c!1706 () Bool)

(declare-fun lt!4424 () ListLongMap!525)

(assert (=> b!17137 (= c!1706 (contains!209 lt!4424 lt!4437))))

(declare-fun lt!4430 () Unit!339)

(assert (=> b!17137 (= lt!4430 e!10669)))

(declare-fun c!1708 () Bool)

(assert (=> b!17137 (= c!1708 (_1!350 lt!4411))))

(declare-fun bm!579 () Bool)

(assert (=> bm!579 (= call!577 (+!35 call!585 (tuple2!703 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1565 (v!1403 (underlying!29 thiss!848))))))))

(declare-fun b!17138 () Bool)

(declare-fun e!10672 () Bool)

(declare-fun lt!4416 () tuple2!700)

(assert (=> b!17138 (= e!10672 (= (map!327 (_2!350 lt!4416)) (map!327 (v!1403 (underlying!29 thiss!848)))))))

(declare-fun b!17139 () Bool)

(assert (=> b!17139 (= e!10674 (arrayContainsKey!0 (_keys!3053 (v!1403 (underlying!29 thiss!848))) lt!4437 lt!4431))))

(declare-fun bm!580 () Bool)

(assert (=> bm!580 (= call!584 (+!35 (ite c!1709 lt!4412 lt!4409) (tuple2!703 lt!4437 lt!4422)))))

(declare-fun b!17140 () Bool)

(assert (=> b!17140 (= e!10675 e!10671)))

(declare-fun c!1710 () Bool)

(assert (=> b!17140 (= c!1710 (bvsgt (bvsub (size!523 (_keys!3053 (v!1403 (underlying!29 thiss!848)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!581 () Bool)

(assert (=> bm!581 (= call!581 (+!35 (ite c!1709 lt!4412 lt!4428) (ite c!1709 (tuple2!703 lt!4435 (zeroValue!1565 (v!1403 (underlying!29 thiss!848)))) (tuple2!703 lt!4437 lt!4422))))))

(declare-fun b!17141 () Bool)

(declare-fun lt!4427 () tuple2!700)

(assert (=> b!17141 (= e!10670 (tuple2!701 (_1!350 lt!4427) (_2!350 lt!4427)))))

(assert (=> b!17141 (= lt!4412 call!585)))

(assert (=> b!17141 (= lt!4435 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!4408 () Unit!339)

(assert (=> b!17141 (= lt!4408 call!580)))

(assert (=> b!17141 (= call!582 call!587)))

(declare-fun lt!4415 () Unit!339)

(assert (=> b!17141 (= lt!4415 lt!4408)))

(assert (=> b!17141 (= lt!4432 call!577)))

(assert (=> b!17141 (= lt!4434 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!4414 () Unit!339)

(assert (=> b!17141 (= lt!4414 call!578)))

(assert (=> b!17141 (= call!586 call!583)))

(declare-fun lt!4433 () Unit!339)

(assert (=> b!17141 (= lt!4433 lt!4414)))

(assert (=> b!17141 (= lt!4427 call!576)))

(declare-fun b!17142 () Bool)

(declare-fun e!10676 () Bool)

(assert (=> b!17142 (= e!10676 e!10672)))

(declare-fun res!12494 () Bool)

(assert (=> b!17142 (=> (not res!12494) (not e!10672))))

(assert (=> b!17142 (= res!12494 (valid!21 (_2!350 lt!4416)))))

(declare-fun bm!582 () Bool)

(assert (=> bm!582 (= call!583 (+!35 (ite c!1709 call!575 call!579) (tuple2!703 lt!4437 lt!4422)))))

(declare-fun b!17143 () Bool)

(assert (=> b!17143 (= e!10674 (ite (= lt!4437 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!1542 (v!1403 (underlying!29 thiss!848))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1542 (v!1403 (underlying!29 thiss!848))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!583 () Bool)

(assert (=> bm!583 (= call!575 (+!35 (ite c!1709 lt!4432 lt!4409) (ite c!1709 (tuple2!703 lt!4434 (minValue!1565 (v!1403 (underlying!29 thiss!848)))) (tuple2!703 lt!4426 (zeroValue!1565 (v!1403 (underlying!29 thiss!848)))))))))

(declare-fun b!17144 () Bool)

(assert (=> b!17144 (= c!1709 (bvsgt (bvsub (size!523 (_keys!3053 (v!1403 (underlying!29 thiss!848)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!17144 (= e!10673 e!10670)))

(declare-fun d!3391 () Bool)

(assert (=> d!3391 e!10676))

(declare-fun res!12493 () Bool)

(assert (=> d!3391 (=> res!12493 e!10676)))

(assert (=> d!3391 (= res!12493 (not (_1!350 lt!4416)))))

(assert (=> d!3391 (= lt!4416 e!10675)))

(assert (=> d!3391 (= c!1705 (and (not (= lt!4437 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!4437 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!3391 (= lt!4424 (map!327 (v!1403 (_2!349 lt!4173))))))

(declare-fun get!325 (ValueCell!225 V!957) V!957)

(assert (=> d!3391 (= lt!4422 (get!325 (select (arr!433 (_values!1626 (v!1403 (underlying!29 thiss!848)))) (bvsub (size!523 (_keys!3053 (v!1403 (underlying!29 thiss!848)))) #b00000000000000000000000000000001)) (dynLambda!132 (defaultEntry!1628 (v!1403 (underlying!29 thiss!848))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3391 (= lt!4437 (select (arr!434 (_keys!3053 (v!1403 (underlying!29 thiss!848)))) (bvsub (size!523 (_keys!3053 (v!1403 (underlying!29 thiss!848)))) #b00000000000000000000000000000001)))))

(assert (=> d!3391 (valid!20 thiss!848)))

(assert (=> d!3391 (= (repackFrom!1 thiss!848 (v!1403 (_2!349 lt!4173)) (bvsub (size!523 (_keys!3053 (v!1403 (underlying!29 thiss!848)))) #b00000000000000000000000000000001)) lt!4416)))

(declare-fun b!17145 () Bool)

(declare-fun lt!4418 () tuple2!700)

(assert (=> b!17145 (= lt!4418 call!576)))

(assert (=> b!17145 (= e!10671 (tuple2!701 (_1!350 lt!4418) (_2!350 lt!4418)))))

(declare-fun bm!584 () Bool)

(assert (=> bm!584 (= call!586 (+!35 (ite c!1709 call!579 call!581) (ite c!1709 (tuple2!703 lt!4434 (minValue!1565 (v!1403 (underlying!29 thiss!848)))) (tuple2!703 lt!4436 (minValue!1565 (v!1403 (underlying!29 thiss!848)))))))))

(assert (= (and d!3391 c!1705) b!17137))

(assert (= (and d!3391 (not c!1705)) b!17140))

(assert (= (and b!17137 c!1706) b!17136))

(assert (= (and b!17137 (not c!1706)) b!17134))

(assert (= (and b!17136 c!1707) b!17139))

(assert (= (and b!17136 (not c!1707)) b!17143))

(assert (= (and b!17137 c!1708) b!17144))

(assert (= (and b!17137 (not c!1708)) b!17135))

(assert (= (and b!17144 c!1709) b!17141))

(assert (= (and b!17144 (not c!1709)) b!17132))

(assert (= (or b!17141 b!17132) bm!581))

(assert (= (or b!17141 b!17132) bm!580))

(assert (= (or b!17141 b!17132) bm!574))

(assert (= (or b!17141 b!17132) bm!583))

(assert (= (or b!17141 b!17132) bm!577))

(assert (= (or b!17141 b!17132) bm!576))

(assert (= (or b!17141 b!17132) bm!578))

(assert (= (or b!17141 b!17132) bm!575))

(assert (= (or b!17141 b!17132) bm!584))

(assert (= (or b!17141 b!17132) bm!582))

(assert (= (or b!17141 b!17132) bm!579))

(assert (= (or b!17141 b!17132) bm!572))

(assert (= (and b!17140 c!1710) b!17145))

(assert (= (and b!17140 (not c!1710)) b!17133))

(assert (= (or b!17141 b!17145) bm!573))

(assert (= (and d!3391 (not res!12493)) b!17142))

(assert (= (and b!17142 res!12494) b!17138))

(declare-fun b_lambda!1439 () Bool)

(assert (=> (not b_lambda!1439) (not d!3391)))

(assert (=> d!3391 t!3172))

(declare-fun b_and!1235 () Bool)

(assert (= b_and!1233 (and (=> t!3172 result!1005) b_and!1235)))

(declare-fun m!12043 () Bool)

(assert (=> bm!575 m!12043))

(declare-fun m!12045 () Bool)

(assert (=> bm!577 m!12045))

(declare-fun m!12047 () Bool)

(assert (=> bm!582 m!12047))

(declare-fun m!12049 () Bool)

(assert (=> bm!579 m!12049))

(assert (=> d!3391 m!11931))

(declare-fun m!12051 () Bool)

(assert (=> d!3391 m!12051))

(declare-fun m!12053 () Bool)

(assert (=> d!3391 m!12053))

(declare-fun m!12055 () Bool)

(assert (=> d!3391 m!12055))

(assert (=> d!3391 m!11931))

(declare-fun m!12057 () Bool)

(assert (=> d!3391 m!12057))

(assert (=> d!3391 m!11877))

(assert (=> d!3391 m!12055))

(declare-fun m!12059 () Bool)

(assert (=> b!17138 m!12059))

(assert (=> b!17138 m!12041))

(declare-fun m!12061 () Bool)

(assert (=> bm!576 m!12061))

(declare-fun m!12063 () Bool)

(assert (=> b!17136 m!12063))

(declare-fun m!12065 () Bool)

(assert (=> b!17136 m!12065))

(declare-fun m!12067 () Bool)

(assert (=> b!17136 m!12067))

(declare-fun m!12069 () Bool)

(assert (=> b!17136 m!12069))

(declare-fun m!12071 () Bool)

(assert (=> b!17136 m!12071))

(declare-fun m!12073 () Bool)

(assert (=> b!17142 m!12073))

(declare-fun m!12075 () Bool)

(assert (=> bm!583 m!12075))

(declare-fun m!12077 () Bool)

(assert (=> bm!584 m!12077))

(declare-fun m!12079 () Bool)

(assert (=> bm!580 m!12079))

(declare-fun m!12081 () Bool)

(assert (=> b!17137 m!12081))

(declare-fun m!12083 () Bool)

(assert (=> b!17137 m!12083))

(declare-fun m!12085 () Bool)

(assert (=> bm!572 m!12085))

(declare-fun m!12087 () Bool)

(assert (=> b!17139 m!12087))

(declare-fun m!12089 () Bool)

(assert (=> bm!578 m!12089))

(declare-fun m!12091 () Bool)

(assert (=> bm!581 m!12091))

(declare-fun m!12093 () Bool)

(assert (=> bm!574 m!12093))

(declare-fun m!12095 () Bool)

(assert (=> bm!573 m!12095))

(assert (=> b!16910 d!3391))

(declare-fun b!17155 () Bool)

(declare-fun res!12505 () Bool)

(declare-fun e!10679 () Bool)

(assert (=> b!17155 (=> (not res!12505) (not e!10679))))

(declare-fun size!526 (LongMapFixedSize!36) (_ BitVec 32))

(assert (=> b!17155 (= res!12505 (bvsge (size!526 (v!1403 (underlying!29 (_2!348 lt!4144)))) (_size!49 (v!1403 (underlying!29 (_2!348 lt!4144))))))))

(declare-fun b!17154 () Bool)

(declare-fun res!12504 () Bool)

(assert (=> b!17154 (=> (not res!12504) (not e!10679))))

(assert (=> b!17154 (= res!12504 (and (= (size!522 (_values!1626 (v!1403 (underlying!29 (_2!348 lt!4144))))) (bvadd (mask!4538 (v!1403 (underlying!29 (_2!348 lt!4144)))) #b00000000000000000000000000000001)) (= (size!523 (_keys!3053 (v!1403 (underlying!29 (_2!348 lt!4144))))) (size!522 (_values!1626 (v!1403 (underlying!29 (_2!348 lt!4144)))))) (bvsge (_size!49 (v!1403 (underlying!29 (_2!348 lt!4144)))) #b00000000000000000000000000000000) (bvsle (_size!49 (v!1403 (underlying!29 (_2!348 lt!4144)))) (bvadd (mask!4538 (v!1403 (underlying!29 (_2!348 lt!4144)))) #b00000000000000000000000000000001))))))

(declare-fun b!17157 () Bool)

(assert (=> b!17157 (= e!10679 (and (bvsge (extraKeys!1542 (v!1403 (underlying!29 (_2!348 lt!4144)))) #b00000000000000000000000000000000) (bvsle (extraKeys!1542 (v!1403 (underlying!29 (_2!348 lt!4144)))) #b00000000000000000000000000000011) (bvsge (_vacant!49 (v!1403 (underlying!29 (_2!348 lt!4144)))) #b00000000000000000000000000000000)))))

(declare-fun d!3393 () Bool)

(declare-fun res!12506 () Bool)

(assert (=> d!3393 (=> (not res!12506) (not e!10679))))

(assert (=> d!3393 (= res!12506 (validMask!0 (mask!4538 (v!1403 (underlying!29 (_2!348 lt!4144))))))))

(assert (=> d!3393 (= (simpleValid!8 (v!1403 (underlying!29 (_2!348 lt!4144)))) e!10679)))

(declare-fun b!17156 () Bool)

(declare-fun res!12503 () Bool)

(assert (=> b!17156 (=> (not res!12503) (not e!10679))))

(assert (=> b!17156 (= res!12503 (= (size!526 (v!1403 (underlying!29 (_2!348 lt!4144)))) (bvadd (_size!49 (v!1403 (underlying!29 (_2!348 lt!4144)))) (bvsdiv (bvadd (extraKeys!1542 (v!1403 (underlying!29 (_2!348 lt!4144)))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!3393 res!12506) b!17154))

(assert (= (and b!17154 res!12504) b!17155))

(assert (= (and b!17155 res!12505) b!17156))

(assert (= (and b!17156 res!12503) b!17157))

(declare-fun m!12097 () Bool)

(assert (=> b!17155 m!12097))

(declare-fun m!12099 () Bool)

(assert (=> d!3393 m!12099))

(assert (=> b!17156 m!12097))

(assert (=> d!3367 d!3393))

(declare-fun bm!585 () Bool)

(declare-fun call!601 () ListLongMap!525)

(declare-fun lt!4444 () tuple2!700)

(assert (=> bm!585 (= call!601 (map!327 (_2!350 lt!4444)))))

(declare-fun b!17158 () Bool)

(declare-fun e!10683 () tuple2!700)

(declare-fun e!10692 () tuple2!700)

(assert (=> b!17158 (= e!10683 e!10692)))

(declare-fun c!1723 () Bool)

(declare-fun lt!4458 () SeekEntryResult!42)

(assert (=> b!17158 (= c!1723 ((_ is MissingZero!42) lt!4458))))

(declare-fun bm!586 () Bool)

(declare-fun call!610 () ListLongMap!525)

(declare-fun call!609 () ListLongMap!525)

(assert (=> bm!586 (= call!610 call!609)))

(declare-fun b!17159 () Bool)

(declare-fun res!12510 () Bool)

(declare-fun call!598 () Bool)

(assert (=> b!17159 (= res!12510 call!598)))

(declare-fun e!10697 () Bool)

(assert (=> b!17159 (=> (not res!12510) (not e!10697))))

(declare-fun e!10684 () Bool)

(declare-fun b!17160 () Bool)

(declare-fun lt!4440 () SeekEntryResult!42)

(assert (=> b!17160 (= e!10684 (= (select (arr!434 (_keys!3053 (ite c!1635 (_2!350 lt!4174) call!470))) (index!2288 lt!4440)) (ite c!1635 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1638 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!4452 () SeekEntryResult!42)

(declare-fun b!17161 () Bool)

(assert (=> b!17161 (= e!10697 (= (select (arr!434 (_keys!3053 (ite c!1635 (_2!350 lt!4174) call!470))) (index!2288 lt!4452)) (ite c!1635 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1638 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!17162 () Bool)

(declare-fun res!12519 () Bool)

(declare-fun e!10682 () Bool)

(assert (=> b!17162 (=> (not res!12519) (not e!10682))))

(declare-fun lt!4446 () SeekEntryResult!42)

(assert (=> b!17162 (= res!12519 (= (select (arr!434 (_keys!3053 (ite c!1635 (_2!350 lt!4174) call!470))) (index!2287 lt!4446)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!587 () Bool)

(declare-fun call!595 () Unit!339)

(assert (=> bm!587 (= call!595 (lemmaInListMapThenSeekEntryOrOpenFindsIt!1 (_keys!3053 (ite c!1635 (_2!350 lt!4174) call!470)) (_values!1626 (ite c!1635 (_2!350 lt!4174) call!470)) (mask!4538 (ite c!1635 (_2!350 lt!4174) call!470)) (extraKeys!1542 (ite c!1635 (_2!350 lt!4174) call!470)) (zeroValue!1565 (ite c!1635 (_2!350 lt!4174) call!470)) (minValue!1565 (ite c!1635 (_2!350 lt!4174) call!470)) (ite c!1635 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1638 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1628 (ite c!1635 (_2!350 lt!4174) call!470))))))

(declare-fun res!12507 () Bool)

(declare-fun b!17163 () Bool)

(assert (=> b!17163 (= res!12507 (= (select (arr!434 (_keys!3053 (ite c!1635 (_2!350 lt!4174) call!470))) (index!2290 lt!4446)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!10694 () Bool)

(assert (=> b!17163 (=> (not res!12507) (not e!10694))))

(declare-fun bm!588 () Bool)

(declare-fun call!599 () ListLongMap!525)

(declare-fun call!594 () ListLongMap!525)

(assert (=> bm!588 (= call!599 call!594)))

(declare-fun b!17165 () Bool)

(declare-fun res!12513 () Bool)

(assert (=> b!17165 (=> (not res!12513) (not e!10682))))

(declare-fun call!591 () Bool)

(assert (=> b!17165 (= res!12513 call!591)))

(declare-fun e!10689 () Bool)

(assert (=> b!17165 (= e!10689 e!10682)))

(declare-fun bm!589 () Bool)

(declare-fun call!588 () Bool)

(declare-fun call!596 () Bool)

(assert (=> bm!589 (= call!588 call!596)))

(declare-fun b!17166 () Bool)

(declare-fun res!12512 () Bool)

(declare-fun lt!4450 () SeekEntryResult!42)

(assert (=> b!17166 (= res!12512 (= (select (arr!434 (_keys!3053 (ite c!1635 (_2!350 lt!4174) call!470))) (index!2290 lt!4450)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!10681 () Bool)

(assert (=> b!17166 (=> (not res!12512) (not e!10681))))

(declare-fun b!17167 () Bool)

(declare-fun e!10686 () Bool)

(declare-fun call!608 () ListLongMap!525)

(assert (=> b!17167 (= e!10686 (= call!601 call!608))))

(declare-fun c!1714 () Bool)

(declare-fun lt!4457 () array!901)

(declare-fun bm!590 () Bool)

(declare-fun c!1718 () Bool)

(assert (=> bm!590 (= call!609 (getCurrentListMap!120 (_keys!3053 (ite c!1635 (_2!350 lt!4174) call!470)) (ite (or c!1718 c!1714) (_values!1626 (ite c!1635 (_2!350 lt!4174) call!470)) lt!4457) (mask!4538 (ite c!1635 (_2!350 lt!4174) call!470)) (extraKeys!1542 (ite c!1635 (_2!350 lt!4174) call!470)) (zeroValue!1565 (ite c!1635 (_2!350 lt!4174) call!470)) (minValue!1565 (ite c!1635 (_2!350 lt!4174) call!470)) #b00000000000000000000000000000000 (defaultEntry!1628 (ite c!1635 (_2!350 lt!4174) call!470))))))

(declare-fun c!1722 () Bool)

(declare-fun c!1713 () Bool)

(declare-fun c!1719 () Bool)

(declare-fun bm!591 () Bool)

(declare-fun c!1720 () Bool)

(assert (=> bm!591 (= call!596 (inRange!0 (ite c!1714 (ite c!1720 (index!2288 lt!4440) (ite c!1713 (index!2287 lt!4450) (index!2290 lt!4450))) (ite c!1722 (index!2288 lt!4452) (ite c!1719 (index!2287 lt!4446) (index!2290 lt!4446)))) (mask!4538 (ite c!1635 (_2!350 lt!4174) call!470))))))

(declare-fun bm!592 () Bool)

(declare-fun call!593 () Bool)

(assert (=> bm!592 (= call!593 call!588)))

(declare-fun bm!593 () Bool)

(declare-fun c!1716 () Bool)

(assert (=> bm!593 (= c!1716 c!1714)))

(declare-fun call!603 () Bool)

(declare-fun e!10695 () ListLongMap!525)

(assert (=> bm!593 (= call!603 (contains!209 e!10695 (ite c!1635 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1638 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!594 () Bool)

(declare-fun call!597 () ListLongMap!525)

(declare-fun call!589 () ListLongMap!525)

(assert (=> bm!594 (= call!597 call!589)))

(declare-fun b!17168 () Bool)

(declare-fun e!10696 () Bool)

(assert (=> b!17168 (= e!10696 (= call!601 (+!35 call!608 (tuple2!703 (ite c!1635 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1638 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!1635 (minValue!1565 (v!1403 (underlying!29 thiss!848))) (ite c!1638 (zeroValue!1565 (v!1403 (underlying!29 thiss!848))) (minValue!1565 (v!1403 (underlying!29 thiss!848)))))))))))

(declare-fun bm!595 () Bool)

(declare-fun call!602 () SeekEntryResult!42)

(declare-fun call!600 () SeekEntryResult!42)

(assert (=> bm!595 (= call!602 call!600)))

(declare-fun bm!596 () Bool)

(assert (=> bm!596 (= call!600 (seekEntryOrOpen!0 (ite c!1635 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1638 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3053 (ite c!1635 (_2!350 lt!4174) call!470)) (mask!4538 (ite c!1635 (_2!350 lt!4174) call!470))))))

(declare-fun b!17169 () Bool)

(declare-fun res!12520 () Bool)

(declare-fun e!10698 () Bool)

(assert (=> b!17169 (=> (not res!12520) (not e!10698))))

(assert (=> b!17169 (= res!12520 (= (select (arr!434 (_keys!3053 (ite c!1635 (_2!350 lt!4174) call!470))) (index!2287 lt!4450)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!17170 () Bool)

(declare-fun e!10680 () Bool)

(assert (=> b!17170 (= e!10680 e!10686)))

(declare-fun c!1712 () Bool)

(assert (=> b!17170 (= c!1712 (_1!350 lt!4444))))

(declare-fun b!17171 () Bool)

(declare-fun e!10699 () Unit!339)

(declare-fun Unit!350 () Unit!339)

(assert (=> b!17171 (= e!10699 Unit!350)))

(declare-fun lt!4464 () Unit!339)

(assert (=> b!17171 (= lt!4464 call!595)))

(assert (=> b!17171 (= lt!4440 call!602)))

(declare-fun res!12515 () Bool)

(assert (=> b!17171 (= res!12515 ((_ is Found!42) lt!4440))))

(assert (=> b!17171 (=> (not res!12515) (not e!10684))))

(assert (=> b!17171 e!10684))

(declare-fun lt!4465 () Unit!339)

(assert (=> b!17171 (= lt!4465 lt!4464)))

(assert (=> b!17171 false))

(declare-fun b!17172 () Bool)

(declare-fun call!592 () Bool)

(assert (=> b!17172 (= e!10694 (not call!592))))

(declare-fun b!17173 () Bool)

(declare-fun call!611 () Bool)

(assert (=> b!17173 (= e!10681 (not call!611))))

(declare-fun b!17174 () Bool)

(declare-fun e!10700 () Unit!339)

(declare-fun Unit!351 () Unit!339)

(assert (=> b!17174 (= e!10700 Unit!351)))

(declare-fun lt!4463 () Unit!339)

(declare-fun call!607 () Unit!339)

(assert (=> b!17174 (= lt!4463 call!607)))

(declare-fun call!590 () SeekEntryResult!42)

(assert (=> b!17174 (= lt!4446 call!590)))

(assert (=> b!17174 (= c!1719 ((_ is MissingZero!42) lt!4446))))

(assert (=> b!17174 e!10689))

(declare-fun lt!4455 () Unit!339)

(assert (=> b!17174 (= lt!4455 lt!4463)))

(assert (=> b!17174 false))

(declare-fun bm!597 () Bool)

(assert (=> bm!597 (= call!607 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!1 (_keys!3053 (ite c!1635 (_2!350 lt!4174) call!470)) (_values!1626 (ite c!1635 (_2!350 lt!4174) call!470)) (mask!4538 (ite c!1635 (_2!350 lt!4174) call!470)) (extraKeys!1542 (ite c!1635 (_2!350 lt!4174) call!470)) (zeroValue!1565 (ite c!1635 (_2!350 lt!4174) call!470)) (minValue!1565 (ite c!1635 (_2!350 lt!4174) call!470)) (ite c!1635 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1638 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1628 (ite c!1635 (_2!350 lt!4174) call!470))))))

(declare-fun bm!598 () Bool)

(declare-fun call!605 () ListLongMap!525)

(assert (=> bm!598 (= call!605 call!609)))

(declare-fun b!17175 () Bool)

(assert (=> b!17175 (= e!10695 call!610)))

(declare-fun b!17176 () Bool)

(declare-fun lt!4461 () tuple2!700)

(declare-fun call!604 () tuple2!700)

(assert (=> b!17176 (= lt!4461 call!604)))

(assert (=> b!17176 (= e!10692 (tuple2!701 (_1!350 lt!4461) (_2!350 lt!4461)))))

(declare-fun b!17177 () Bool)

(declare-fun c!1711 () Bool)

(assert (=> b!17177 (= c!1711 ((_ is MissingVacant!42) lt!4458))))

(declare-fun e!10685 () tuple2!700)

(assert (=> b!17177 (= e!10685 e!10683)))

(declare-fun call!606 () Bool)

(declare-fun bm!599 () Bool)

(assert (=> bm!599 (= call!606 (arrayContainsKey!0 (_keys!3053 (ite c!1635 (_2!350 lt!4174) call!470)) (ite c!1635 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1638 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000))))

(declare-fun b!17178 () Bool)

(declare-fun res!12514 () Bool)

(assert (=> b!17178 (=> (not res!12514) (not e!10698))))

(assert (=> b!17178 (= res!12514 call!593)))

(declare-fun e!10691 () Bool)

(assert (=> b!17178 (= e!10691 e!10698)))

(declare-fun b!17179 () Bool)

(declare-fun c!1717 () Bool)

(assert (=> b!17179 (= c!1717 ((_ is MissingVacant!42) lt!4450))))

(declare-fun e!10693 () Bool)

(assert (=> b!17179 (= e!10691 e!10693)))

(declare-fun b!17180 () Bool)

(declare-fun lt!4448 () Unit!339)

(declare-fun lt!4451 () Unit!339)

(assert (=> b!17180 (= lt!4448 lt!4451)))

(assert (=> b!17180 (contains!209 call!610 (select (arr!434 (_keys!3053 (ite c!1635 (_2!350 lt!4174) call!470))) (index!2288 lt!4458)))))

(assert (=> b!17180 (= lt!4451 (lemmaValidKeyInArrayIsInListMap!1 (_keys!3053 (ite c!1635 (_2!350 lt!4174) call!470)) lt!4457 (mask!4538 (ite c!1635 (_2!350 lt!4174) call!470)) (extraKeys!1542 (ite c!1635 (_2!350 lt!4174) call!470)) (zeroValue!1565 (ite c!1635 (_2!350 lt!4174) call!470)) (minValue!1565 (ite c!1635 (_2!350 lt!4174) call!470)) (index!2288 lt!4458) (defaultEntry!1628 (ite c!1635 (_2!350 lt!4174) call!470))))))

(assert (=> b!17180 (= lt!4457 (array!902 (store (arr!433 (_values!1626 (ite c!1635 (_2!350 lt!4174) call!470))) (index!2288 lt!4458) (ValueCellFull!225 (ite c!1635 (minValue!1565 (v!1403 (underlying!29 thiss!848))) (ite c!1638 (zeroValue!1565 (v!1403 (underlying!29 thiss!848))) (minValue!1565 (v!1403 (underlying!29 thiss!848))))))) (size!522 (_values!1626 (ite c!1635 (_2!350 lt!4174) call!470)))))))

(declare-fun lt!4454 () Unit!339)

(declare-fun lt!4462 () Unit!339)

(assert (=> b!17180 (= lt!4454 lt!4462)))

(assert (=> b!17180 (= call!594 (getCurrentListMap!120 (_keys!3053 (ite c!1635 (_2!350 lt!4174) call!470)) (array!902 (store (arr!433 (_values!1626 (ite c!1635 (_2!350 lt!4174) call!470))) (index!2288 lt!4458) (ValueCellFull!225 (ite c!1635 (minValue!1565 (v!1403 (underlying!29 thiss!848))) (ite c!1638 (zeroValue!1565 (v!1403 (underlying!29 thiss!848))) (minValue!1565 (v!1403 (underlying!29 thiss!848))))))) (size!522 (_values!1626 (ite c!1635 (_2!350 lt!4174) call!470)))) (mask!4538 (ite c!1635 (_2!350 lt!4174) call!470)) (extraKeys!1542 (ite c!1635 (_2!350 lt!4174) call!470)) (zeroValue!1565 (ite c!1635 (_2!350 lt!4174) call!470)) (minValue!1565 (ite c!1635 (_2!350 lt!4174) call!470)) #b00000000000000000000000000000000 (defaultEntry!1628 (ite c!1635 (_2!350 lt!4174) call!470))))))

(assert (=> b!17180 (= lt!4462 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!1 (_keys!3053 (ite c!1635 (_2!350 lt!4174) call!470)) (_values!1626 (ite c!1635 (_2!350 lt!4174) call!470)) (mask!4538 (ite c!1635 (_2!350 lt!4174) call!470)) (extraKeys!1542 (ite c!1635 (_2!350 lt!4174) call!470)) (zeroValue!1565 (ite c!1635 (_2!350 lt!4174) call!470)) (minValue!1565 (ite c!1635 (_2!350 lt!4174) call!470)) (index!2288 lt!4458) (ite c!1635 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1638 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!1635 (minValue!1565 (v!1403 (underlying!29 thiss!848))) (ite c!1638 (zeroValue!1565 (v!1403 (underlying!29 thiss!848))) (minValue!1565 (v!1403 (underlying!29 thiss!848))))) (defaultEntry!1628 (ite c!1635 (_2!350 lt!4174) call!470))))))

(declare-fun lt!4441 () Unit!339)

(assert (=> b!17180 (= lt!4441 e!10700)))

(assert (=> b!17180 (= c!1722 call!603)))

(assert (=> b!17180 (= e!10692 (tuple2!701 true (LongMapFixedSize!37 (defaultEntry!1628 (ite c!1635 (_2!350 lt!4174) call!470)) (mask!4538 (ite c!1635 (_2!350 lt!4174) call!470)) (extraKeys!1542 (ite c!1635 (_2!350 lt!4174) call!470)) (zeroValue!1565 (ite c!1635 (_2!350 lt!4174) call!470)) (minValue!1565 (ite c!1635 (_2!350 lt!4174) call!470)) (_size!49 (ite c!1635 (_2!350 lt!4174) call!470)) (_keys!3053 (ite c!1635 (_2!350 lt!4174) call!470)) (array!902 (store (arr!433 (_values!1626 (ite c!1635 (_2!350 lt!4174) call!470))) (index!2288 lt!4458) (ValueCellFull!225 (ite c!1635 (minValue!1565 (v!1403 (underlying!29 thiss!848))) (ite c!1638 (zeroValue!1565 (v!1403 (underlying!29 thiss!848))) (minValue!1565 (v!1403 (underlying!29 thiss!848))))))) (size!522 (_values!1626 (ite c!1635 (_2!350 lt!4174) call!470)))) (_vacant!49 (ite c!1635 (_2!350 lt!4174) call!470)))))))

(declare-fun b!17181 () Bool)

(declare-fun lt!4445 () Unit!339)

(assert (=> b!17181 (= lt!4445 e!10699)))

(assert (=> b!17181 (= c!1720 call!603)))

(assert (=> b!17181 (= e!10685 (tuple2!701 false (ite c!1635 (_2!350 lt!4174) call!470)))))

(declare-fun b!17182 () Bool)

(declare-fun c!1715 () Bool)

(assert (=> b!17182 (= c!1715 ((_ is MissingVacant!42) lt!4446))))

(declare-fun e!10687 () Bool)

(assert (=> b!17182 (= e!10689 e!10687)))

(declare-fun bm!600 () Bool)

(assert (=> bm!600 (= call!590 call!600)))

(declare-fun b!17183 () Bool)

(declare-fun res!12516 () Bool)

(assert (=> b!17183 (= res!12516 call!588)))

(assert (=> b!17183 (=> (not res!12516) (not e!10684))))

(declare-fun bm!601 () Bool)

(declare-fun c!1721 () Bool)

(assert (=> bm!601 (= call!594 (+!35 (ite c!1718 call!605 call!589) (ite c!1718 (ite c!1721 (tuple2!703 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!1635 (minValue!1565 (v!1403 (underlying!29 thiss!848))) (ite c!1638 (zeroValue!1565 (v!1403 (underlying!29 thiss!848))) (minValue!1565 (v!1403 (underlying!29 thiss!848)))))) (tuple2!703 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1635 (minValue!1565 (v!1403 (underlying!29 thiss!848))) (ite c!1638 (zeroValue!1565 (v!1403 (underlying!29 thiss!848))) (minValue!1565 (v!1403 (underlying!29 thiss!848))))))) (tuple2!703 (ite c!1635 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1638 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!1635 (minValue!1565 (v!1403 (underlying!29 thiss!848))) (ite c!1638 (zeroValue!1565 (v!1403 (underlying!29 thiss!848))) (minValue!1565 (v!1403 (underlying!29 thiss!848)))))))))))

(declare-fun b!17184 () Bool)

(declare-fun lt!4460 () tuple2!700)

(assert (=> b!17184 (= e!10683 (tuple2!701 (_1!350 lt!4460) (_2!350 lt!4460)))))

(assert (=> b!17184 (= lt!4460 call!604)))

(declare-fun lt!4439 () (_ BitVec 32))

(declare-fun lt!4456 () (_ BitVec 32))

(declare-fun bm!602 () Bool)

(assert (=> bm!602 (= call!589 (getCurrentListMap!120 (_keys!3053 (ite c!1635 (_2!350 lt!4174) call!470)) (_values!1626 (ite c!1635 (_2!350 lt!4174) call!470)) (mask!4538 (ite c!1635 (_2!350 lt!4174) call!470)) (ite c!1718 (ite c!1721 lt!4439 lt!4456) (extraKeys!1542 (ite c!1635 (_2!350 lt!4174) call!470))) (ite (and c!1718 c!1721) (ite c!1635 (minValue!1565 (v!1403 (underlying!29 thiss!848))) (ite c!1638 (zeroValue!1565 (v!1403 (underlying!29 thiss!848))) (minValue!1565 (v!1403 (underlying!29 thiss!848))))) (zeroValue!1565 (ite c!1635 (_2!350 lt!4174) call!470))) (ite c!1718 (ite c!1721 (minValue!1565 (ite c!1635 (_2!350 lt!4174) call!470)) (ite c!1635 (minValue!1565 (v!1403 (underlying!29 thiss!848))) (ite c!1638 (zeroValue!1565 (v!1403 (underlying!29 thiss!848))) (minValue!1565 (v!1403 (underlying!29 thiss!848)))))) (minValue!1565 (ite c!1635 (_2!350 lt!4174) call!470))) #b00000000000000000000000000000000 (defaultEntry!1628 (ite c!1635 (_2!350 lt!4174) call!470))))))

(declare-fun b!17185 () Bool)

(assert (=> b!17185 (= e!10693 ((_ is Undefined!42) lt!4450))))

(declare-fun b!17186 () Bool)

(assert (=> b!17186 (= e!10693 e!10681)))

(declare-fun res!12508 () Bool)

(assert (=> b!17186 (= res!12508 call!593)))

(assert (=> b!17186 (=> (not res!12508) (not e!10681))))

(declare-fun bm!603 () Bool)

(assert (=> bm!603 (= call!608 (map!327 (ite c!1635 (_2!350 lt!4174) call!470)))))

(declare-fun bm!604 () Bool)

(assert (=> bm!604 (= call!591 call!598)))

(declare-fun b!17187 () Bool)

(assert (=> b!17187 (= e!10695 call!589)))

(declare-fun bm!605 () Bool)

(assert (=> bm!605 (= call!592 call!606)))

(declare-fun b!17188 () Bool)

(assert (=> b!17188 (= e!10687 e!10694)))

(declare-fun res!12511 () Bool)

(assert (=> b!17188 (= res!12511 call!591)))

(assert (=> b!17188 (=> (not res!12511) (not e!10694))))

(declare-fun b!17189 () Bool)

(declare-fun lt!4443 () Unit!339)

(assert (=> b!17189 (= e!10699 lt!4443)))

(assert (=> b!17189 (= lt!4443 call!607)))

(assert (=> b!17189 (= lt!4450 call!602)))

(assert (=> b!17189 (= c!1713 ((_ is MissingZero!42) lt!4450))))

(assert (=> b!17189 e!10691))

(declare-fun b!17190 () Bool)

(assert (=> b!17190 (= e!10686 e!10696)))

(declare-fun res!12518 () Bool)

(assert (=> b!17190 (= res!12518 (contains!209 call!601 (ite c!1635 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1638 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!17190 (=> (not res!12518) (not e!10696))))

(declare-fun b!17191 () Bool)

(assert (=> b!17191 (= e!10682 (not call!592))))

(declare-fun bm!606 () Bool)

(assert (=> bm!606 (= call!598 call!596)))

(declare-fun b!17192 () Bool)

(declare-fun lt!4447 () Unit!339)

(declare-fun lt!4459 () Unit!339)

(assert (=> b!17192 (= lt!4447 lt!4459)))

(assert (=> b!17192 (= call!599 call!597)))

(assert (=> b!17192 (= lt!4459 (lemmaChangeZeroKeyThenAddPairToListMap!1 (_keys!3053 (ite c!1635 (_2!350 lt!4174) call!470)) (_values!1626 (ite c!1635 (_2!350 lt!4174) call!470)) (mask!4538 (ite c!1635 (_2!350 lt!4174) call!470)) (extraKeys!1542 (ite c!1635 (_2!350 lt!4174) call!470)) lt!4439 (zeroValue!1565 (ite c!1635 (_2!350 lt!4174) call!470)) (ite c!1635 (minValue!1565 (v!1403 (underlying!29 thiss!848))) (ite c!1638 (zeroValue!1565 (v!1403 (underlying!29 thiss!848))) (minValue!1565 (v!1403 (underlying!29 thiss!848))))) (minValue!1565 (ite c!1635 (_2!350 lt!4174) call!470)) (defaultEntry!1628 (ite c!1635 (_2!350 lt!4174) call!470))))))

(assert (=> b!17192 (= lt!4439 (bvor (extraKeys!1542 (ite c!1635 (_2!350 lt!4174) call!470)) #b00000000000000000000000000000001))))

(declare-fun e!10688 () tuple2!700)

(assert (=> b!17192 (= e!10688 (tuple2!701 true (LongMapFixedSize!37 (defaultEntry!1628 (ite c!1635 (_2!350 lt!4174) call!470)) (mask!4538 (ite c!1635 (_2!350 lt!4174) call!470)) (bvor (extraKeys!1542 (ite c!1635 (_2!350 lt!4174) call!470)) #b00000000000000000000000000000001) (ite c!1635 (minValue!1565 (v!1403 (underlying!29 thiss!848))) (ite c!1638 (zeroValue!1565 (v!1403 (underlying!29 thiss!848))) (minValue!1565 (v!1403 (underlying!29 thiss!848))))) (minValue!1565 (ite c!1635 (_2!350 lt!4174) call!470)) (_size!49 (ite c!1635 (_2!350 lt!4174) call!470)) (_keys!3053 (ite c!1635 (_2!350 lt!4174) call!470)) (_values!1626 (ite c!1635 (_2!350 lt!4174) call!470)) (_vacant!49 (ite c!1635 (_2!350 lt!4174) call!470)))))))

(declare-fun bm!607 () Bool)

(assert (=> bm!607 (= call!604 (updateHelperNewKey!1 (ite c!1635 (_2!350 lt!4174) call!470) (ite c!1635 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1638 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!1635 (minValue!1565 (v!1403 (underlying!29 thiss!848))) (ite c!1638 (zeroValue!1565 (v!1403 (underlying!29 thiss!848))) (minValue!1565 (v!1403 (underlying!29 thiss!848))))) (ite c!1711 (index!2290 lt!4458) (index!2287 lt!4458))))))

(declare-fun b!17193 () Bool)

(declare-fun lt!4449 () Unit!339)

(declare-fun lt!4453 () Unit!339)

(assert (=> b!17193 (= lt!4449 lt!4453)))

(assert (=> b!17193 (= call!599 call!597)))

(assert (=> b!17193 (= lt!4453 (lemmaChangeLongMinValueKeyThenAddPairToListMap!1 (_keys!3053 (ite c!1635 (_2!350 lt!4174) call!470)) (_values!1626 (ite c!1635 (_2!350 lt!4174) call!470)) (mask!4538 (ite c!1635 (_2!350 lt!4174) call!470)) (extraKeys!1542 (ite c!1635 (_2!350 lt!4174) call!470)) lt!4456 (zeroValue!1565 (ite c!1635 (_2!350 lt!4174) call!470)) (minValue!1565 (ite c!1635 (_2!350 lt!4174) call!470)) (ite c!1635 (minValue!1565 (v!1403 (underlying!29 thiss!848))) (ite c!1638 (zeroValue!1565 (v!1403 (underlying!29 thiss!848))) (minValue!1565 (v!1403 (underlying!29 thiss!848))))) (defaultEntry!1628 (ite c!1635 (_2!350 lt!4174) call!470))))))

(assert (=> b!17193 (= lt!4456 (bvor (extraKeys!1542 (ite c!1635 (_2!350 lt!4174) call!470)) #b00000000000000000000000000000010))))

(assert (=> b!17193 (= e!10688 (tuple2!701 true (LongMapFixedSize!37 (defaultEntry!1628 (ite c!1635 (_2!350 lt!4174) call!470)) (mask!4538 (ite c!1635 (_2!350 lt!4174) call!470)) (bvor (extraKeys!1542 (ite c!1635 (_2!350 lt!4174) call!470)) #b00000000000000000000000000000010) (zeroValue!1565 (ite c!1635 (_2!350 lt!4174) call!470)) (ite c!1635 (minValue!1565 (v!1403 (underlying!29 thiss!848))) (ite c!1638 (zeroValue!1565 (v!1403 (underlying!29 thiss!848))) (minValue!1565 (v!1403 (underlying!29 thiss!848))))) (_size!49 (ite c!1635 (_2!350 lt!4174) call!470)) (_keys!3053 (ite c!1635 (_2!350 lt!4174) call!470)) (_values!1626 (ite c!1635 (_2!350 lt!4174) call!470)) (_vacant!49 (ite c!1635 (_2!350 lt!4174) call!470)))))))

(declare-fun b!17194 () Bool)

(declare-fun lt!4442 () Unit!339)

(assert (=> b!17194 (= e!10700 lt!4442)))

(assert (=> b!17194 (= lt!4442 call!595)))

(assert (=> b!17194 (= lt!4452 call!590)))

(declare-fun res!12509 () Bool)

(assert (=> b!17194 (= res!12509 ((_ is Found!42) lt!4452))))

(assert (=> b!17194 (=> (not res!12509) (not e!10697))))

(assert (=> b!17194 e!10697))

(declare-fun b!17195 () Bool)

(declare-fun e!10690 () tuple2!700)

(assert (=> b!17195 (= e!10690 e!10688)))

(assert (=> b!17195 (= c!1721 (= (ite c!1635 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1638 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!17196 () Bool)

(assert (=> b!17196 (= e!10698 (not call!611))))

(declare-fun b!17197 () Bool)

(assert (=> b!17197 (= e!10687 ((_ is Undefined!42) lt!4446))))

(declare-fun bm!608 () Bool)

(assert (=> bm!608 (= call!611 call!606)))

(declare-fun d!3395 () Bool)

(assert (=> d!3395 e!10680))

(declare-fun res!12517 () Bool)

(assert (=> d!3395 (=> (not res!12517) (not e!10680))))

(assert (=> d!3395 (= res!12517 (valid!21 (_2!350 lt!4444)))))

(assert (=> d!3395 (= lt!4444 e!10690)))

(assert (=> d!3395 (= c!1718 (= (ite c!1635 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1638 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvneg (ite c!1635 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1638 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!3395 (valid!21 (ite c!1635 (_2!350 lt!4174) call!470))))

(assert (=> d!3395 (= (update!2 (ite c!1635 (_2!350 lt!4174) call!470) (ite c!1635 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1638 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!1635 (minValue!1565 (v!1403 (underlying!29 thiss!848))) (ite c!1638 (zeroValue!1565 (v!1403 (underlying!29 thiss!848))) (minValue!1565 (v!1403 (underlying!29 thiss!848)))))) lt!4444)))

(declare-fun b!17164 () Bool)

(assert (=> b!17164 (= e!10690 e!10685)))

(assert (=> b!17164 (= lt!4458 (seekEntryOrOpen!0 (ite c!1635 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1638 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3053 (ite c!1635 (_2!350 lt!4174) call!470)) (mask!4538 (ite c!1635 (_2!350 lt!4174) call!470))))))

(assert (=> b!17164 (= c!1714 ((_ is Undefined!42) lt!4458))))

(assert (= (and d!3395 c!1718) b!17195))

(assert (= (and d!3395 (not c!1718)) b!17164))

(assert (= (and b!17195 c!1721) b!17192))

(assert (= (and b!17195 (not c!1721)) b!17193))

(assert (= (or b!17192 b!17193) bm!598))

(assert (= (or b!17192 b!17193) bm!594))

(assert (= (or b!17192 b!17193) bm!588))

(assert (= (and b!17164 c!1714) b!17181))

(assert (= (and b!17164 (not c!1714)) b!17177))

(assert (= (and b!17181 c!1720) b!17171))

(assert (= (and b!17181 (not c!1720)) b!17189))

(assert (= (and b!17171 res!12515) b!17183))

(assert (= (and b!17183 res!12516) b!17160))

(assert (= (and b!17189 c!1713) b!17178))

(assert (= (and b!17189 (not c!1713)) b!17179))

(assert (= (and b!17178 res!12514) b!17169))

(assert (= (and b!17169 res!12520) b!17196))

(assert (= (and b!17179 c!1717) b!17186))

(assert (= (and b!17179 (not c!1717)) b!17185))

(assert (= (and b!17186 res!12508) b!17166))

(assert (= (and b!17166 res!12512) b!17173))

(assert (= (or b!17178 b!17186) bm!592))

(assert (= (or b!17196 b!17173) bm!608))

(assert (= (or b!17183 bm!592) bm!589))

(assert (= (or b!17171 b!17189) bm!595))

(assert (= (and b!17177 c!1711) b!17184))

(assert (= (and b!17177 (not c!1711)) b!17158))

(assert (= (and b!17158 c!1723) b!17176))

(assert (= (and b!17158 (not c!1723)) b!17180))

(assert (= (and b!17180 c!1722) b!17194))

(assert (= (and b!17180 (not c!1722)) b!17174))

(assert (= (and b!17194 res!12509) b!17159))

(assert (= (and b!17159 res!12510) b!17161))

(assert (= (and b!17174 c!1719) b!17165))

(assert (= (and b!17174 (not c!1719)) b!17182))

(assert (= (and b!17165 res!12513) b!17162))

(assert (= (and b!17162 res!12519) b!17191))

(assert (= (and b!17182 c!1715) b!17188))

(assert (= (and b!17182 (not c!1715)) b!17197))

(assert (= (and b!17188 res!12511) b!17163))

(assert (= (and b!17163 res!12507) b!17172))

(assert (= (or b!17165 b!17188) bm!604))

(assert (= (or b!17191 b!17172) bm!605))

(assert (= (or b!17159 bm!604) bm!606))

(assert (= (or b!17194 b!17174) bm!600))

(assert (= (or b!17184 b!17176) bm!607))

(assert (= (or b!17181 b!17180) bm!586))

(assert (= (or bm!589 bm!606) bm!591))

(assert (= (or b!17171 b!17194) bm!587))

(assert (= (or bm!608 bm!605) bm!599))

(assert (= (or bm!595 bm!600) bm!596))

(assert (= (or b!17189 b!17174) bm!597))

(assert (= (or b!17181 b!17180) bm!593))

(assert (= (and bm!593 c!1716) b!17175))

(assert (= (and bm!593 (not c!1716)) b!17187))

(assert (= (or bm!594 b!17180 b!17187) bm!602))

(assert (= (or bm!598 bm!586) bm!590))

(assert (= (or bm!588 b!17180) bm!601))

(assert (= (and d!3395 res!12517) b!17170))

(assert (= (and b!17170 c!1712) b!17190))

(assert (= (and b!17170 (not c!1712)) b!17167))

(assert (= (and b!17190 res!12518) b!17168))

(assert (= (or b!17168 b!17167) bm!603))

(assert (= (or b!17190 b!17168 b!17167) bm!585))

(declare-fun m!12101 () Bool)

(assert (=> bm!593 m!12101))

(declare-fun m!12103 () Bool)

(assert (=> b!17162 m!12103))

(declare-fun m!12105 () Bool)

(assert (=> b!17164 m!12105))

(declare-fun m!12107 () Bool)

(assert (=> b!17193 m!12107))

(declare-fun m!12109 () Bool)

(assert (=> d!3395 m!12109))

(declare-fun m!12111 () Bool)

(assert (=> d!3395 m!12111))

(declare-fun m!12113 () Bool)

(assert (=> bm!590 m!12113))

(declare-fun m!12115 () Bool)

(assert (=> bm!599 m!12115))

(declare-fun m!12117 () Bool)

(assert (=> bm!585 m!12117))

(declare-fun m!12119 () Bool)

(assert (=> b!17161 m!12119))

(declare-fun m!12121 () Bool)

(assert (=> b!17160 m!12121))

(declare-fun m!12123 () Bool)

(assert (=> b!17190 m!12123))

(declare-fun m!12125 () Bool)

(assert (=> b!17169 m!12125))

(declare-fun m!12127 () Bool)

(assert (=> bm!597 m!12127))

(declare-fun m!12129 () Bool)

(assert (=> b!17180 m!12129))

(declare-fun m!12131 () Bool)

(assert (=> b!17180 m!12131))

(declare-fun m!12133 () Bool)

(assert (=> b!17180 m!12133))

(declare-fun m!12135 () Bool)

(assert (=> b!17180 m!12135))

(assert (=> b!17180 m!12131))

(declare-fun m!12137 () Bool)

(assert (=> b!17180 m!12137))

(declare-fun m!12139 () Bool)

(assert (=> b!17180 m!12139))

(declare-fun m!12141 () Bool)

(assert (=> bm!603 m!12141))

(declare-fun m!12143 () Bool)

(assert (=> bm!591 m!12143))

(declare-fun m!12145 () Bool)

(assert (=> bm!601 m!12145))

(declare-fun m!12147 () Bool)

(assert (=> bm!587 m!12147))

(declare-fun m!12149 () Bool)

(assert (=> bm!602 m!12149))

(declare-fun m!12151 () Bool)

(assert (=> b!17192 m!12151))

(assert (=> bm!596 m!12105))

(declare-fun m!12153 () Bool)

(assert (=> b!17168 m!12153))

(declare-fun m!12155 () Bool)

(assert (=> b!17163 m!12155))

(declare-fun m!12157 () Bool)

(assert (=> bm!607 m!12157))

(declare-fun m!12159 () Bool)

(assert (=> b!17166 m!12159))

(assert (=> bm!467 d!3395))

(declare-fun b!17206 () Bool)

(declare-fun e!10705 () (_ BitVec 32))

(declare-fun e!10706 () (_ BitVec 32))

(assert (=> b!17206 (= e!10705 e!10706)))

(declare-fun c!1729 () Bool)

(assert (=> b!17206 (= c!1729 (validKeyInArray!0 (select (arr!434 (_keys!3053 (v!1403 (underlying!29 (_2!348 lt!4144))))) #b00000000000000000000000000000000)))))

(declare-fun b!17207 () Bool)

(declare-fun call!614 () (_ BitVec 32))

(assert (=> b!17207 (= e!10706 (bvadd #b00000000000000000000000000000001 call!614))))

(declare-fun d!3397 () Bool)

(declare-fun lt!4468 () (_ BitVec 32))

(assert (=> d!3397 (and (bvsge lt!4468 #b00000000000000000000000000000000) (bvsle lt!4468 (bvsub (size!523 (_keys!3053 (v!1403 (underlying!29 (_2!348 lt!4144))))) #b00000000000000000000000000000000)))))

(assert (=> d!3397 (= lt!4468 e!10705)))

(declare-fun c!1728 () Bool)

(assert (=> d!3397 (= c!1728 (bvsge #b00000000000000000000000000000000 (size!523 (_keys!3053 (v!1403 (underlying!29 (_2!348 lt!4144)))))))))

(assert (=> d!3397 (and (bvsle #b00000000000000000000000000000000 (size!523 (_keys!3053 (v!1403 (underlying!29 (_2!348 lt!4144)))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!523 (_keys!3053 (v!1403 (underlying!29 (_2!348 lt!4144))))) (size!523 (_keys!3053 (v!1403 (underlying!29 (_2!348 lt!4144)))))))))

(assert (=> d!3397 (= (arrayCountValidKeys!0 (_keys!3053 (v!1403 (underlying!29 (_2!348 lt!4144)))) #b00000000000000000000000000000000 (size!523 (_keys!3053 (v!1403 (underlying!29 (_2!348 lt!4144)))))) lt!4468)))

(declare-fun bm!611 () Bool)

(assert (=> bm!611 (= call!614 (arrayCountValidKeys!0 (_keys!3053 (v!1403 (underlying!29 (_2!348 lt!4144)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!523 (_keys!3053 (v!1403 (underlying!29 (_2!348 lt!4144)))))))))

(declare-fun b!17208 () Bool)

(assert (=> b!17208 (= e!10706 call!614)))

(declare-fun b!17209 () Bool)

(assert (=> b!17209 (= e!10705 #b00000000000000000000000000000000)))

(assert (= (and d!3397 c!1728) b!17209))

(assert (= (and d!3397 (not c!1728)) b!17206))

(assert (= (and b!17206 c!1729) b!17207))

(assert (= (and b!17206 (not c!1729)) b!17208))

(assert (= (or b!17207 b!17208) bm!611))

(assert (=> b!17206 m!12015))

(assert (=> b!17206 m!12015))

(assert (=> b!17206 m!12017))

(declare-fun m!12161 () Bool)

(assert (=> bm!611 m!12161))

(assert (=> b!16887 d!3397))

(assert (=> bm!464 d!3375))

(declare-fun b!17210 () Bool)

(declare-fun e!10708 () Bool)

(assert (=> b!17210 (= e!10708 tp_is_empty!849)))

(declare-fun mapNonEmpty!711 () Bool)

(declare-fun mapRes!711 () Bool)

(declare-fun tp!2952 () Bool)

(assert (=> mapNonEmpty!711 (= mapRes!711 (and tp!2952 e!10708))))

(declare-fun mapValue!711 () ValueCell!225)

(declare-fun mapRest!711 () (Array (_ BitVec 32) ValueCell!225))

(declare-fun mapKey!711 () (_ BitVec 32))

(assert (=> mapNonEmpty!711 (= mapRest!710 (store mapRest!711 mapKey!711 mapValue!711))))

(declare-fun condMapEmpty!711 () Bool)

(declare-fun mapDefault!711 () ValueCell!225)

(assert (=> mapNonEmpty!710 (= condMapEmpty!711 (= mapRest!710 ((as const (Array (_ BitVec 32) ValueCell!225)) mapDefault!711)))))

(declare-fun e!10707 () Bool)

(assert (=> mapNonEmpty!710 (= tp!2951 (and e!10707 mapRes!711))))

(declare-fun b!17211 () Bool)

(assert (=> b!17211 (= e!10707 tp_is_empty!849)))

(declare-fun mapIsEmpty!711 () Bool)

(assert (=> mapIsEmpty!711 mapRes!711))

(assert (= (and mapNonEmpty!710 condMapEmpty!711) mapIsEmpty!711))

(assert (= (and mapNonEmpty!710 (not condMapEmpty!711)) mapNonEmpty!711))

(assert (= (and mapNonEmpty!711 ((_ is ValueCellFull!225) mapValue!711)) b!17210))

(assert (= (and mapNonEmpty!710 ((_ is ValueCellFull!225) mapDefault!711)) b!17211))

(declare-fun m!12163 () Bool)

(assert (=> mapNonEmpty!711 m!12163))

(declare-fun b_lambda!1441 () Bool)

(assert (= b_lambda!1435 (or (and b!16845 b_free!585) b_lambda!1441)))

(declare-fun b_lambda!1443 () Bool)

(assert (= b_lambda!1437 (or (and b!16845 b_free!585) b_lambda!1443)))

(declare-fun b_lambda!1445 () Bool)

(assert (= b_lambda!1439 (or (and b!16845 b_free!585) b_lambda!1445)))

(check-sat (not bm!603) (not b!17192) (not bm!538) (not b!17068) (not bm!583) (not bm!597) (not b!17190) b_and!1235 (not d!3377) (not b!17084) (not bm!590) (not bm!599) (not b!16939) (not b!17040) (not bm!607) (not d!3389) (not d!3379) (not bm!542) (not b!16951) (not b!17193) (not b!17136) tp_is_empty!849 (not b!17206) (not b!17066) (not bm!576) (not b_lambda!1445) (not bm!574) (not bm!528) (not bm!611) (not bm!532) (not bm!573) (not b!16938) (not bm!580) (not bm!581) (not b!17168) (not b!17164) (not bm!530) (not bm!545) (not bm!582) (not d!3387) (not bm!522) (not bm!577) (not d!3375) (not bm!601) (not b_lambda!1441) (not bm!521) (not bm!587) (not b!17155) (not d!3383) (not bm!533) (not bm!516) (not bm!596) (not bm!602) (not b_next!585) (not b!17099) (not b!17137) (not bm!591) (not b!17083) (not b!17156) (not b!17138) (not mapNonEmpty!711) (not bm!584) (not b!17069) (not bm!572) (not d!3395) (not b!17142) (not b!17056) (not b!16937) (not bm!527) (not b!17100) (not b!17139) (not d!3393) (not bm!585) (not bm!534) (not b!17044) (not bm!593) (not bm!518) (not bm!578) (not b!17087) (not d!3391) (not b!17088) (not bm!575) (not bm!524) (not b!17101) (not b!17086) (not b_lambda!1443) (not bm!579) (not b!17180))
(check-sat b_and!1235 (not b_next!585))

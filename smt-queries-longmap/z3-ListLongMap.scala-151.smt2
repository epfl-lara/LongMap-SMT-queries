; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2936 () Bool)

(assert start!2936)

(declare-fun b!16768 () Bool)

(declare-fun b_free!583 () Bool)

(declare-fun b_next!583 () Bool)

(assert (=> b!16768 (= b_free!583 (not b_next!583))))

(declare-fun tp!2936 () Bool)

(declare-fun b_and!1219 () Bool)

(assert (=> b!16768 (= tp!2936 b_and!1219)))

(declare-fun b!16759 () Bool)

(declare-fun e!10418 () Bool)

(declare-fun e!10423 () Bool)

(assert (=> b!16759 (= e!10418 e!10423)))

(declare-fun res!12362 () Bool)

(assert (=> b!16759 (=> (not res!12362) (not e!10423))))

(declare-datatypes ((V!955 0))(
  ( (V!956 (val!450 Int)) )
))
(declare-datatypes ((ValueCell!224 0))(
  ( (ValueCellFull!224 (v!1399 V!955)) (EmptyCell!224) )
))
(declare-datatypes ((array!879 0))(
  ( (array!880 (arr!422 (Array (_ BitVec 32) ValueCell!224)) (size!511 (_ BitVec 32))) )
))
(declare-datatypes ((array!881 0))(
  ( (array!882 (arr!423 (Array (_ BitVec 32) (_ BitVec 64))) (size!512 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!34 0))(
  ( (LongMapFixedSize!35 (defaultEntry!1627 Int) (mask!4537 (_ BitVec 32)) (extraKeys!1541 (_ BitVec 32)) (zeroValue!1564 V!955) (minValue!1564 V!955) (_size!48 (_ BitVec 32)) (_keys!3052 array!881) (_values!1625 array!879) (_vacant!48 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!34 0))(
  ( (Cell!35 (v!1400 LongMapFixedSize!34)) )
))
(declare-datatypes ((LongMap!34 0))(
  ( (LongMap!35 (underlying!28 Cell!34)) )
))
(declare-datatypes ((tuple2!690 0))(
  ( (tuple2!691 (_1!345 Bool) (_2!345 LongMap!34)) )
))
(declare-fun lt!4137 () tuple2!690)

(assert (=> b!16759 (= res!12362 (_1!345 lt!4137))))

(declare-fun e!10424 () tuple2!690)

(assert (=> b!16759 (= lt!4137 e!10424)))

(declare-fun c!1610 () Bool)

(declare-fun thiss!848 () LongMap!34)

(declare-fun imbalanced!2 (LongMap!34) Bool)

(assert (=> b!16759 (= c!1610 (imbalanced!2 thiss!848))))

(declare-fun mapNonEmpty!701 () Bool)

(declare-fun mapRes!701 () Bool)

(declare-fun tp!2935 () Bool)

(declare-fun e!10421 () Bool)

(assert (=> mapNonEmpty!701 (= mapRes!701 (and tp!2935 e!10421))))

(declare-fun mapKey!701 () (_ BitVec 32))

(declare-fun mapValue!701 () ValueCell!224)

(declare-fun mapRest!701 () (Array (_ BitVec 32) ValueCell!224))

(assert (=> mapNonEmpty!701 (= (arr!422 (_values!1625 (v!1400 (underlying!28 thiss!848)))) (store mapRest!701 mapKey!701 mapValue!701))))

(declare-fun b!16760 () Bool)

(declare-fun repack!1 (LongMap!34) tuple2!690)

(assert (=> b!16760 (= e!10424 (repack!1 thiss!848))))

(declare-fun b!16761 () Bool)

(declare-fun e!10425 () Bool)

(declare-fun e!10419 () Bool)

(assert (=> b!16761 (= e!10425 e!10419)))

(declare-fun b!16762 () Bool)

(declare-fun e!10422 () Bool)

(declare-fun e!10420 () Bool)

(assert (=> b!16762 (= e!10422 (and e!10420 mapRes!701))))

(declare-fun condMapEmpty!701 () Bool)

(declare-fun mapDefault!701 () ValueCell!224)

(assert (=> b!16762 (= condMapEmpty!701 (= (arr!422 (_values!1625 (v!1400 (underlying!28 thiss!848)))) ((as const (Array (_ BitVec 32) ValueCell!224)) mapDefault!701)))))

(declare-fun b!16763 () Bool)

(declare-fun tp_is_empty!847 () Bool)

(assert (=> b!16763 (= e!10420 tp_is_empty!847)))

(declare-fun mapIsEmpty!701 () Bool)

(assert (=> mapIsEmpty!701 mapRes!701))

(declare-fun b!16764 () Bool)

(declare-fun valid!25 (LongMapFixedSize!34) Bool)

(assert (=> b!16764 (= e!10423 (not (valid!25 (v!1400 (underlying!28 (_2!345 lt!4137))))))))

(declare-fun res!12363 () Bool)

(assert (=> start!2936 (=> (not res!12363) (not e!10418))))

(declare-fun valid!26 (LongMap!34) Bool)

(assert (=> start!2936 (= res!12363 (valid!26 thiss!848))))

(assert (=> start!2936 e!10418))

(assert (=> start!2936 e!10425))

(declare-fun b!16765 () Bool)

(declare-fun e!10417 () Bool)

(assert (=> b!16765 (= e!10419 e!10417)))

(declare-fun b!16766 () Bool)

(assert (=> b!16766 (= e!10421 tp_is_empty!847)))

(declare-fun b!16767 () Bool)

(assert (=> b!16767 (= e!10424 (tuple2!691 true thiss!848))))

(declare-fun array_inv!309 (array!881) Bool)

(declare-fun array_inv!310 (array!879) Bool)

(assert (=> b!16768 (= e!10417 (and tp!2936 tp_is_empty!847 (array_inv!309 (_keys!3052 (v!1400 (underlying!28 thiss!848)))) (array_inv!310 (_values!1625 (v!1400 (underlying!28 thiss!848)))) e!10422))))

(assert (= (and start!2936 res!12363) b!16759))

(assert (= (and b!16759 c!1610) b!16760))

(assert (= (and b!16759 (not c!1610)) b!16767))

(assert (= (and b!16759 res!12362) b!16764))

(assert (= (and b!16762 condMapEmpty!701) mapIsEmpty!701))

(assert (= (and b!16762 (not condMapEmpty!701)) mapNonEmpty!701))

(get-info :version)

(assert (= (and mapNonEmpty!701 ((_ is ValueCellFull!224) mapValue!701)) b!16766))

(assert (= (and b!16762 ((_ is ValueCellFull!224) mapDefault!701)) b!16763))

(assert (= b!16768 b!16762))

(assert (= b!16765 b!16768))

(assert (= b!16761 b!16765))

(assert (= start!2936 b!16761))

(declare-fun m!11789 () Bool)

(assert (=> b!16760 m!11789))

(declare-fun m!11791 () Bool)

(assert (=> b!16759 m!11791))

(declare-fun m!11793 () Bool)

(assert (=> mapNonEmpty!701 m!11793))

(declare-fun m!11795 () Bool)

(assert (=> b!16768 m!11795))

(declare-fun m!11797 () Bool)

(assert (=> b!16768 m!11797))

(declare-fun m!11799 () Bool)

(assert (=> start!2936 m!11799))

(declare-fun m!11801 () Bool)

(assert (=> b!16764 m!11801))

(check-sat (not b_next!583) (not start!2936) (not b!16760) tp_is_empty!847 b_and!1219 (not b!16764) (not b!16759) (not b!16768) (not mapNonEmpty!701))
(check-sat b_and!1219 (not b_next!583))
(get-model)

(declare-fun d!3325 () Bool)

(assert (=> d!3325 (= (imbalanced!2 thiss!848) (or (bvsgt (bvmul #b00000000000000000000000000000010 (bvadd (_size!48 (v!1400 (underlying!28 thiss!848))) (_vacant!48 (v!1400 (underlying!28 thiss!848))))) (mask!4537 (v!1400 (underlying!28 thiss!848)))) (bvsgt (_vacant!48 (v!1400 (underlying!28 thiss!848))) (_size!48 (v!1400 (underlying!28 thiss!848))))))))

(assert (=> b!16759 d!3325))

(declare-fun d!3327 () Bool)

(assert (=> d!3327 (= (array_inv!309 (_keys!3052 (v!1400 (underlying!28 thiss!848)))) (bvsge (size!512 (_keys!3052 (v!1400 (underlying!28 thiss!848)))) #b00000000000000000000000000000000))))

(assert (=> b!16768 d!3327))

(declare-fun d!3329 () Bool)

(assert (=> d!3329 (= (array_inv!310 (_values!1625 (v!1400 (underlying!28 thiss!848)))) (bvsge (size!511 (_values!1625 (v!1400 (underlying!28 thiss!848)))) #b00000000000000000000000000000000))))

(assert (=> b!16768 d!3329))

(declare-fun d!3331 () Bool)

(declare-fun res!12382 () Bool)

(declare-fun e!10489 () Bool)

(assert (=> d!3331 (=> (not res!12382) (not e!10489))))

(declare-fun simpleValid!8 (LongMapFixedSize!34) Bool)

(assert (=> d!3331 (= res!12382 (simpleValid!8 (v!1400 (underlying!28 (_2!345 lt!4137)))))))

(assert (=> d!3331 (= (valid!25 (v!1400 (underlying!28 (_2!345 lt!4137)))) e!10489)))

(declare-fun b!16835 () Bool)

(declare-fun res!12383 () Bool)

(assert (=> b!16835 (=> (not res!12383) (not e!10489))))

(declare-fun arrayCountValidKeys!0 (array!881 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!16835 (= res!12383 (= (arrayCountValidKeys!0 (_keys!3052 (v!1400 (underlying!28 (_2!345 lt!4137)))) #b00000000000000000000000000000000 (size!512 (_keys!3052 (v!1400 (underlying!28 (_2!345 lt!4137)))))) (_size!48 (v!1400 (underlying!28 (_2!345 lt!4137))))))))

(declare-fun b!16836 () Bool)

(declare-fun res!12384 () Bool)

(assert (=> b!16836 (=> (not res!12384) (not e!10489))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!881 (_ BitVec 32)) Bool)

(assert (=> b!16836 (= res!12384 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3052 (v!1400 (underlying!28 (_2!345 lt!4137)))) (mask!4537 (v!1400 (underlying!28 (_2!345 lt!4137))))))))

(declare-fun b!16837 () Bool)

(declare-datatypes ((List!528 0))(
  ( (Nil!525) (Cons!524 (h!1090 (_ BitVec 64)) (t!3158 List!528)) )
))
(declare-fun arrayNoDuplicates!0 (array!881 (_ BitVec 32) List!528) Bool)

(assert (=> b!16837 (= e!10489 (arrayNoDuplicates!0 (_keys!3052 (v!1400 (underlying!28 (_2!345 lt!4137)))) #b00000000000000000000000000000000 Nil!525))))

(assert (= (and d!3331 res!12382) b!16835))

(assert (= (and b!16835 res!12383) b!16836))

(assert (= (and b!16836 res!12384) b!16837))

(declare-fun m!11831 () Bool)

(assert (=> d!3331 m!11831))

(declare-fun m!11833 () Bool)

(assert (=> b!16835 m!11833))

(declare-fun m!11835 () Bool)

(assert (=> b!16836 m!11835))

(declare-fun m!11837 () Bool)

(assert (=> b!16837 m!11837))

(assert (=> b!16764 d!3331))

(declare-fun d!3333 () Bool)

(assert (=> d!3333 (= (valid!26 thiss!848) (valid!25 (v!1400 (underlying!28 thiss!848))))))

(declare-fun bs!802 () Bool)

(assert (= bs!802 d!3333))

(declare-fun m!11839 () Bool)

(assert (=> bs!802 m!11839))

(assert (=> start!2936 d!3333))

(declare-fun b!16856 () Bool)

(declare-datatypes ((tuple2!696 0))(
  ( (tuple2!697 (_1!348 Bool) (_2!348 Cell!34)) )
))
(declare-fun e!10504 () tuple2!696)

(declare-fun lt!4169 () Cell!34)

(assert (=> b!16856 (= e!10504 (tuple2!697 true lt!4169))))

(declare-fun bm!464 () Bool)

(declare-fun call!469 () LongMapFixedSize!34)

(declare-fun call!470 () LongMapFixedSize!34)

(assert (=> bm!464 (= call!469 call!470)))

(declare-fun b!16857 () Bool)

(declare-fun e!10502 () Bool)

(declare-fun lt!4165 () tuple2!690)

(declare-datatypes ((tuple2!698 0))(
  ( (tuple2!699 (_1!349 (_ BitVec 64)) (_2!349 V!955)) )
))
(declare-datatypes ((List!529 0))(
  ( (Nil!526) (Cons!525 (h!1091 tuple2!698) (t!3159 List!529)) )
))
(declare-datatypes ((ListLongMap!521 0))(
  ( (ListLongMap!522 (toList!276 List!529)) )
))
(declare-fun map!326 (LongMap!34) ListLongMap!521)

(assert (=> b!16857 (= e!10502 (= (map!326 (_2!345 lt!4165)) (map!326 thiss!848)))))

(declare-fun bm!465 () Bool)

(declare-datatypes ((tuple2!700 0))(
  ( (tuple2!701 (_1!350 Bool) (_2!350 LongMapFixedSize!34)) )
))
(declare-fun call!467 () tuple2!700)

(declare-fun call!468 () tuple2!700)

(assert (=> bm!465 (= call!467 call!468)))

(declare-fun b!16858 () Bool)

(declare-fun lt!4173 () tuple2!700)

(assert (=> b!16858 (= lt!4173 call!467)))

(declare-fun e!10501 () tuple2!696)

(assert (=> b!16858 (= e!10501 (tuple2!697 (_1!350 lt!4173) (Cell!35 (_2!350 lt!4173))))))

(declare-fun b!16859 () Bool)

(declare-datatypes ((tuple3!0 0))(
  ( (tuple3!1 (_1!351 Bool) (_2!351 Cell!34) (_3!0 LongMap!34)) )
))
(declare-fun e!10500 () tuple3!0)

(declare-fun lt!4170 () tuple2!696)

(assert (=> b!16859 (= e!10500 (tuple3!1 false (_2!348 lt!4170) thiss!848))))

(declare-fun d!3335 () Bool)

(assert (=> d!3335 e!10502))

(declare-fun res!12387 () Bool)

(assert (=> d!3335 (=> res!12387 e!10502)))

(assert (=> d!3335 (= res!12387 (= (_1!345 lt!4165) false))))

(declare-fun lt!4164 () tuple3!0)

(assert (=> d!3335 (= lt!4165 (tuple2!691 (_1!351 lt!4164) (_3!0 lt!4164)))))

(assert (=> d!3335 (= lt!4164 e!10500)))

(declare-fun c!1626 () Bool)

(assert (=> d!3335 (= c!1626 (not (_1!348 lt!4170)))))

(declare-fun e!10503 () tuple2!696)

(assert (=> d!3335 (= lt!4170 e!10503)))

(declare-fun c!1627 () Bool)

(assert (=> d!3335 (= c!1627 (and (not (= (bvand (extraKeys!1541 (v!1400 (underlying!28 thiss!848))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1541 (v!1400 (underlying!28 thiss!848))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!4167 () (_ BitVec 32))

(declare-fun getNewLongMapFixedSize!7 ((_ BitVec 32) Int) LongMapFixedSize!34)

(assert (=> d!3335 (= lt!4169 (Cell!35 (getNewLongMapFixedSize!7 lt!4167 (defaultEntry!1627 (v!1400 (underlying!28 thiss!848))))))))

(declare-fun computeNewMask!1 (LongMap!34 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!3335 (= lt!4167 (computeNewMask!1 thiss!848 (mask!4537 (v!1400 (underlying!28 thiss!848))) (_vacant!48 (v!1400 (underlying!28 thiss!848))) (_size!48 (v!1400 (underlying!28 thiss!848)))))))

(assert (=> d!3335 (valid!26 thiss!848)))

(assert (=> d!3335 (= (repack!1 thiss!848) lt!4165)))

(declare-fun lt!4166 () tuple2!700)

(declare-fun bm!466 () Bool)

(declare-fun c!1625 () Bool)

(declare-fun update!2 (LongMapFixedSize!34 (_ BitVec 64) V!955) tuple2!700)

(assert (=> bm!466 (= call!468 (update!2 (ite c!1627 (_2!350 lt!4166) call!469) (ite c!1627 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1625 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!1627 (minValue!1564 (v!1400 (underlying!28 thiss!848))) (ite c!1625 (zeroValue!1564 (v!1400 (underlying!28 thiss!848))) (minValue!1564 (v!1400 (underlying!28 thiss!848)))))))))

(declare-fun b!16860 () Bool)

(declare-fun lt!4168 () tuple2!700)

(assert (=> b!16860 (= e!10504 (tuple2!697 (_1!350 lt!4168) (Cell!35 (_2!350 lt!4168))))))

(assert (=> b!16860 (= lt!4168 call!467)))

(declare-fun b!16861 () Bool)

(declare-fun c!1628 () Bool)

(assert (=> b!16861 (= c!1628 (and (not (= (bvand (extraKeys!1541 (v!1400 (underlying!28 thiss!848))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1541 (v!1400 (underlying!28 thiss!848))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!16861 (= e!10501 e!10504)))

(declare-fun b!16862 () Bool)

(declare-fun lt!4171 () tuple2!700)

(assert (=> b!16862 (= e!10503 (tuple2!697 (and (_1!350 lt!4166) (_1!350 lt!4171)) (Cell!35 (_2!350 lt!4171))))))

(assert (=> b!16862 (= lt!4166 (update!2 call!470 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1564 (v!1400 (underlying!28 thiss!848)))))))

(assert (=> b!16862 (= lt!4171 call!468)))

(declare-fun b!16863 () Bool)

(assert (=> b!16863 (= e!10503 e!10501)))

(assert (=> b!16863 (= c!1625 (and (not (= (bvand (extraKeys!1541 (v!1400 (underlying!28 thiss!848))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1541 (v!1400 (underlying!28 thiss!848))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!467 () Bool)

(assert (=> bm!467 (= call!470 (getNewLongMapFixedSize!7 lt!4167 (defaultEntry!1627 (v!1400 (underlying!28 thiss!848)))))))

(declare-fun b!16864 () Bool)

(declare-fun lt!4172 () tuple2!700)

(assert (=> b!16864 (= e!10500 (ite (_1!350 lt!4172) (tuple3!1 true (underlying!28 thiss!848) (LongMap!35 (Cell!35 (_2!350 lt!4172)))) (tuple3!1 false (Cell!35 (_2!350 lt!4172)) thiss!848)))))

(declare-fun repackFrom!1 (LongMap!34 LongMapFixedSize!34 (_ BitVec 32)) tuple2!700)

(assert (=> b!16864 (= lt!4172 (repackFrom!1 thiss!848 (v!1400 (_2!348 lt!4170)) (bvsub (size!512 (_keys!3052 (v!1400 (underlying!28 thiss!848)))) #b00000000000000000000000000000001)))))

(assert (= (and d!3335 c!1627) b!16862))

(assert (= (and d!3335 (not c!1627)) b!16863))

(assert (= (and b!16863 c!1625) b!16858))

(assert (= (and b!16863 (not c!1625)) b!16861))

(assert (= (and b!16861 c!1628) b!16860))

(assert (= (and b!16861 (not c!1628)) b!16856))

(assert (= (or b!16858 b!16860) bm!464))

(assert (= (or b!16858 b!16860) bm!465))

(assert (= (or b!16862 bm!465) bm!466))

(assert (= (or b!16862 bm!464) bm!467))

(assert (= (and d!3335 c!1626) b!16859))

(assert (= (and d!3335 (not c!1626)) b!16864))

(assert (= (and d!3335 (not res!12387)) b!16857))

(declare-fun m!11841 () Bool)

(assert (=> b!16862 m!11841))

(declare-fun m!11843 () Bool)

(assert (=> b!16857 m!11843))

(declare-fun m!11845 () Bool)

(assert (=> b!16857 m!11845))

(declare-fun m!11847 () Bool)

(assert (=> bm!466 m!11847))

(declare-fun m!11849 () Bool)

(assert (=> bm!467 m!11849))

(declare-fun m!11851 () Bool)

(assert (=> b!16864 m!11851))

(assert (=> d!3335 m!11849))

(declare-fun m!11853 () Bool)

(assert (=> d!3335 m!11853))

(assert (=> d!3335 m!11799))

(assert (=> b!16760 d!3335))

(declare-fun b!16872 () Bool)

(declare-fun e!10510 () Bool)

(assert (=> b!16872 (= e!10510 tp_is_empty!847)))

(declare-fun mapIsEmpty!710 () Bool)

(declare-fun mapRes!710 () Bool)

(assert (=> mapIsEmpty!710 mapRes!710))

(declare-fun condMapEmpty!710 () Bool)

(declare-fun mapDefault!710 () ValueCell!224)

(assert (=> mapNonEmpty!701 (= condMapEmpty!710 (= mapRest!701 ((as const (Array (_ BitVec 32) ValueCell!224)) mapDefault!710)))))

(assert (=> mapNonEmpty!701 (= tp!2935 (and e!10510 mapRes!710))))

(declare-fun b!16871 () Bool)

(declare-fun e!10509 () Bool)

(assert (=> b!16871 (= e!10509 tp_is_empty!847)))

(declare-fun mapNonEmpty!710 () Bool)

(declare-fun tp!2951 () Bool)

(assert (=> mapNonEmpty!710 (= mapRes!710 (and tp!2951 e!10509))))

(declare-fun mapRest!710 () (Array (_ BitVec 32) ValueCell!224))

(declare-fun mapValue!710 () ValueCell!224)

(declare-fun mapKey!710 () (_ BitVec 32))

(assert (=> mapNonEmpty!710 (= mapRest!701 (store mapRest!710 mapKey!710 mapValue!710))))

(assert (= (and mapNonEmpty!701 condMapEmpty!710) mapIsEmpty!710))

(assert (= (and mapNonEmpty!701 (not condMapEmpty!710)) mapNonEmpty!710))

(assert (= (and mapNonEmpty!710 ((_ is ValueCellFull!224) mapValue!710)) b!16871))

(assert (= (and mapNonEmpty!701 ((_ is ValueCellFull!224) mapDefault!710)) b!16872))

(declare-fun m!11855 () Bool)

(assert (=> mapNonEmpty!710 m!11855))

(check-sat (not b!16862) (not bm!467) (not b!16836) (not b!16864) (not bm!466) (not d!3335) (not b!16835) (not b!16837) tp_is_empty!847 b_and!1219 (not d!3333) (not b!16857) (not b_next!583) (not d!3331) (not mapNonEmpty!710))
(check-sat b_and!1219 (not b_next!583))
(get-model)

(declare-fun b!16885 () Bool)

(declare-fun e!10517 () Bool)

(declare-fun lt!4235 () LongMapFixedSize!34)

(declare-fun map!327 (LongMapFixedSize!34) ListLongMap!521)

(assert (=> b!16885 (= e!10517 (= (map!327 lt!4235) (ListLongMap!522 Nil!526)))))

(declare-fun b!16886 () Bool)

(declare-fun e!10518 () Bool)

(declare-fun lt!4234 () tuple2!698)

(declare-fun lt!4225 () (_ BitVec 32))

(assert (=> b!16886 (= e!10518 (ite (= (_1!349 lt!4234) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!4225 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!4225 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!16887 () Bool)

(declare-fun res!12392 () Bool)

(assert (=> b!16887 (=> (not res!12392) (not e!10517))))

(assert (=> b!16887 (= res!12392 (= (mask!4537 lt!4235) lt!4167))))

(declare-fun b!16888 () Bool)

(declare-datatypes ((Unit!346 0))(
  ( (Unit!347) )
))
(declare-fun e!10519 () Unit!346)

(declare-fun Unit!348 () Unit!346)

(assert (=> b!16888 (= e!10519 Unit!348)))

(declare-fun lt!4233 () LongMapFixedSize!34)

(declare-fun head!818 (List!529) tuple2!698)

(assert (=> b!16888 (= lt!4234 (head!818 (toList!276 (map!327 lt!4233))))))

(declare-fun lt!4230 () array!881)

(assert (=> b!16888 (= lt!4230 (array!882 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd lt!4167 #b00000000000000000000000000000001)))))

(assert (=> b!16888 (= lt!4225 #b00000000000000000000000000000000)))

(declare-fun lt!4223 () Unit!346)

(declare-fun lemmaKeyInListMapIsInArray!85 (array!881 array!879 (_ BitVec 32) (_ BitVec 32) V!955 V!955 (_ BitVec 64) Int) Unit!346)

(declare-fun dynLambda!131 (Int (_ BitVec 64)) V!955)

(assert (=> b!16888 (= lt!4223 (lemmaKeyInListMapIsInArray!85 lt!4230 (array!880 ((as const (Array (_ BitVec 32) ValueCell!224)) EmptyCell!224) (bvadd lt!4167 #b00000000000000000000000000000001)) lt!4167 lt!4225 (dynLambda!131 (defaultEntry!1627 (v!1400 (underlying!28 thiss!848))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!131 (defaultEntry!1627 (v!1400 (underlying!28 thiss!848))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!349 lt!4234) (defaultEntry!1627 (v!1400 (underlying!28 thiss!848)))))))

(declare-fun c!1633 () Bool)

(assert (=> b!16888 (= c!1633 (and (not (= (_1!349 lt!4234) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!349 lt!4234) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!16888 e!10518))

(declare-fun lt!4240 () Unit!346)

(assert (=> b!16888 (= lt!4240 lt!4223)))

(declare-fun lt!4231 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!881 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!16888 (= lt!4231 (arrayScanForKey!0 (array!882 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd lt!4167 #b00000000000000000000000000000001)) (_1!349 lt!4234) #b00000000000000000000000000000000))))

(assert (=> b!16888 false))

(declare-fun d!3337 () Bool)

(assert (=> d!3337 e!10517))

(declare-fun res!12393 () Bool)

(assert (=> d!3337 (=> (not res!12393) (not e!10517))))

(assert (=> d!3337 (= res!12393 (valid!25 lt!4235))))

(assert (=> d!3337 (= lt!4235 lt!4233)))

(declare-fun lt!4237 () Unit!346)

(assert (=> d!3337 (= lt!4237 e!10519)))

(declare-fun c!1634 () Bool)

(assert (=> d!3337 (= c!1634 (not (= (map!327 lt!4233) (ListLongMap!522 Nil!526))))))

(declare-fun lt!4229 () Unit!346)

(declare-fun lt!4221 () Unit!346)

(assert (=> d!3337 (= lt!4229 lt!4221)))

(declare-fun lt!4236 () array!881)

(declare-fun lt!4242 () (_ BitVec 32))

(declare-fun lt!4241 () List!528)

(assert (=> d!3337 (arrayNoDuplicates!0 lt!4236 lt!4242 lt!4241)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!881 (_ BitVec 32) (_ BitVec 32) List!528) Unit!346)

(assert (=> d!3337 (= lt!4221 (lemmaArrayNoDuplicatesInAll0Array!0 lt!4236 lt!4242 (bvadd lt!4167 #b00000000000000000000000000000001) lt!4241))))

(assert (=> d!3337 (= lt!4241 Nil!525)))

(assert (=> d!3337 (= lt!4242 #b00000000000000000000000000000000)))

(assert (=> d!3337 (= lt!4236 (array!882 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd lt!4167 #b00000000000000000000000000000001)))))

(declare-fun lt!4222 () Unit!346)

(declare-fun lt!4232 () Unit!346)

(assert (=> d!3337 (= lt!4222 lt!4232)))

(declare-fun lt!4226 () (_ BitVec 32))

(declare-fun lt!4228 () array!881)

(assert (=> d!3337 (arrayForallSeekEntryOrOpenFound!0 lt!4226 lt!4228 lt!4167)))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!881 (_ BitVec 32) (_ BitVec 32)) Unit!346)

(assert (=> d!3337 (= lt!4232 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!4228 lt!4167 lt!4226))))

(assert (=> d!3337 (= lt!4226 #b00000000000000000000000000000000)))

(assert (=> d!3337 (= lt!4228 (array!882 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd lt!4167 #b00000000000000000000000000000001)))))

(declare-fun lt!4224 () Unit!346)

(declare-fun lt!4220 () Unit!346)

(assert (=> d!3337 (= lt!4224 lt!4220)))

(declare-fun lt!4238 () array!881)

(declare-fun lt!4239 () (_ BitVec 32))

(declare-fun lt!4227 () (_ BitVec 32))

(assert (=> d!3337 (= (arrayCountValidKeys!0 lt!4238 lt!4239 lt!4227) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!881 (_ BitVec 32) (_ BitVec 32)) Unit!346)

(assert (=> d!3337 (= lt!4220 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!4238 lt!4239 lt!4227))))

(assert (=> d!3337 (= lt!4227 (bvadd lt!4167 #b00000000000000000000000000000001))))

(assert (=> d!3337 (= lt!4239 #b00000000000000000000000000000000)))

(assert (=> d!3337 (= lt!4238 (array!882 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd lt!4167 #b00000000000000000000000000000001)))))

(assert (=> d!3337 (= lt!4233 (LongMapFixedSize!35 (defaultEntry!1627 (v!1400 (underlying!28 thiss!848))) lt!4167 #b00000000000000000000000000000000 (dynLambda!131 (defaultEntry!1627 (v!1400 (underlying!28 thiss!848))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!131 (defaultEntry!1627 (v!1400 (underlying!28 thiss!848))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!882 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd lt!4167 #b00000000000000000000000000000001)) (array!880 ((as const (Array (_ BitVec 32) ValueCell!224)) EmptyCell!224) (bvadd lt!4167 #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!3337 (validMask!0 lt!4167)))

(assert (=> d!3337 (= (getNewLongMapFixedSize!7 lt!4167 (defaultEntry!1627 (v!1400 (underlying!28 thiss!848)))) lt!4235)))

(declare-fun b!16889 () Bool)

(declare-fun Unit!349 () Unit!346)

(assert (=> b!16889 (= e!10519 Unit!349)))

(declare-fun b!16890 () Bool)

(declare-fun arrayContainsKey!0 (array!881 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!16890 (= e!10518 (arrayContainsKey!0 lt!4230 (_1!349 lt!4234) #b00000000000000000000000000000000))))

(assert (= (and d!3337 c!1634) b!16888))

(assert (= (and d!3337 (not c!1634)) b!16889))

(assert (= (and b!16888 c!1633) b!16890))

(assert (= (and b!16888 (not c!1633)) b!16886))

(assert (= (and d!3337 res!12393) b!16887))

(assert (= (and b!16887 res!12392) b!16885))

(declare-fun b_lambda!1423 () Bool)

(assert (=> (not b_lambda!1423) (not b!16888)))

(declare-fun t!3161 () Bool)

(declare-fun tb!619 () Bool)

(assert (=> (and b!16768 (= (defaultEntry!1627 (v!1400 (underlying!28 thiss!848))) (defaultEntry!1627 (v!1400 (underlying!28 thiss!848)))) t!3161) tb!619))

(declare-fun result!999 () Bool)

(assert (=> tb!619 (= result!999 tp_is_empty!847)))

(assert (=> b!16888 t!3161))

(declare-fun b_and!1225 () Bool)

(assert (= b_and!1219 (and (=> t!3161 result!999) b_and!1225)))

(declare-fun b_lambda!1425 () Bool)

(assert (=> (not b_lambda!1425) (not d!3337)))

(assert (=> d!3337 t!3161))

(declare-fun b_and!1227 () Bool)

(assert (= b_and!1225 (and (=> t!3161 result!999) b_and!1227)))

(declare-fun m!11857 () Bool)

(assert (=> b!16885 m!11857))

(declare-fun m!11859 () Bool)

(assert (=> b!16888 m!11859))

(assert (=> b!16888 m!11859))

(assert (=> b!16888 m!11859))

(declare-fun m!11861 () Bool)

(assert (=> b!16888 m!11861))

(declare-fun m!11863 () Bool)

(assert (=> b!16888 m!11863))

(declare-fun m!11865 () Bool)

(assert (=> b!16888 m!11865))

(declare-fun m!11867 () Bool)

(assert (=> b!16888 m!11867))

(assert (=> d!3337 m!11859))

(assert (=> d!3337 m!11863))

(declare-fun m!11869 () Bool)

(assert (=> d!3337 m!11869))

(declare-fun m!11871 () Bool)

(assert (=> d!3337 m!11871))

(declare-fun m!11873 () Bool)

(assert (=> d!3337 m!11873))

(declare-fun m!11875 () Bool)

(assert (=> d!3337 m!11875))

(declare-fun m!11877 () Bool)

(assert (=> d!3337 m!11877))

(declare-fun m!11879 () Bool)

(assert (=> d!3337 m!11879))

(declare-fun m!11881 () Bool)

(assert (=> d!3337 m!11881))

(declare-fun m!11883 () Bool)

(assert (=> d!3337 m!11883))

(declare-fun m!11885 () Bool)

(assert (=> b!16890 m!11885))

(assert (=> bm!467 d!3337))

(declare-fun lt!4327 () V!955)

(declare-fun lt!4325 () (_ BitVec 64))

(declare-fun call!499 () ListLongMap!521)

(declare-fun c!1651 () Bool)

(declare-fun lt!4309 () (_ BitVec 64))

(declare-fun bm!494 () Bool)

(declare-fun call!507 () ListLongMap!521)

(declare-fun call!502 () ListLongMap!521)

(declare-fun +!34 (ListLongMap!521 tuple2!698) ListLongMap!521)

(assert (=> bm!494 (= call!499 (+!34 (ite c!1651 call!507 call!502) (ite c!1651 (tuple2!699 lt!4325 lt!4327) (tuple2!699 lt!4309 (minValue!1564 (v!1400 (underlying!28 thiss!848)))))))))

(declare-fun bm!495 () Bool)

(declare-fun lt!4318 () ListLongMap!521)

(declare-fun lt!4323 () ListLongMap!521)

(declare-fun lt!4314 () (_ BitVec 64))

(declare-fun call!504 () ListLongMap!521)

(assert (=> bm!495 (= call!504 (+!34 (ite c!1651 lt!4323 lt!4318) (ite c!1651 (tuple2!699 lt!4325 lt!4327) (tuple2!699 lt!4314 (zeroValue!1564 (v!1400 (underlying!28 thiss!848)))))))))

(declare-fun b!16921 () Bool)

(declare-fun e!10540 () tuple2!700)

(declare-fun lt!4313 () tuple2!700)

(assert (=> b!16921 (= e!10540 (tuple2!701 false (_2!350 lt!4313)))))

(declare-fun bm!496 () Bool)

(declare-fun lt!4336 () ListLongMap!521)

(declare-fun lt!4329 () ListLongMap!521)

(declare-fun lt!4335 () (_ BitVec 64))

(assert (=> bm!496 (= call!507 (+!34 (ite c!1651 lt!4329 lt!4336) (ite c!1651 (tuple2!699 lt!4335 (minValue!1564 (v!1400 (underlying!28 thiss!848)))) (tuple2!699 lt!4309 (minValue!1564 (v!1400 (underlying!28 thiss!848)))))))))

(declare-fun bm!498 () Bool)

(assert (=> bm!498 (= call!502 (+!34 (ite c!1651 lt!4329 lt!4336) (tuple2!699 lt!4325 lt!4327)))))

(declare-fun call!500 () ListLongMap!521)

(declare-fun bm!499 () Bool)

(assert (=> bm!499 (= call!500 (+!34 (ite c!1651 call!502 call!507) (ite c!1651 (tuple2!699 lt!4335 (minValue!1564 (v!1400 (underlying!28 thiss!848)))) (tuple2!699 lt!4325 lt!4327))))))

(declare-fun b!16922 () Bool)

(declare-fun e!10541 () tuple2!700)

(declare-fun e!10539 () tuple2!700)

(assert (=> b!16922 (= e!10541 e!10539)))

(declare-fun c!1650 () Bool)

(assert (=> b!16922 (= c!1650 (bvsgt (bvsub (size!512 (_keys!3052 (v!1400 (underlying!28 thiss!848)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!16923 () Bool)

(declare-fun lt!4324 () tuple2!700)

(declare-fun call!509 () tuple2!700)

(assert (=> b!16923 (= lt!4324 call!509)))

(assert (=> b!16923 (= e!10539 (tuple2!701 (_1!350 lt!4324) (_2!350 lt!4324)))))

(declare-fun call!508 () ListLongMap!521)

(declare-fun lt!4317 () (_ BitVec 64))

(declare-fun bm!500 () Bool)

(assert (=> bm!500 (= call!508 (+!34 (ite c!1651 lt!4323 lt!4318) (ite c!1651 (tuple2!699 lt!4317 (zeroValue!1564 (v!1400 (underlying!28 thiss!848)))) (tuple2!699 lt!4325 lt!4327))))))

(declare-fun bm!501 () Bool)

(declare-fun call!506 () Unit!346)

(declare-fun addCommutativeForDiffKeys!1 (ListLongMap!521 (_ BitVec 64) V!955 (_ BitVec 64) V!955) Unit!346)

(assert (=> bm!501 (= call!506 (addCommutativeForDiffKeys!1 (ite c!1651 lt!4323 lt!4336) lt!4325 lt!4327 (ite c!1651 lt!4317 lt!4309) (ite c!1651 (zeroValue!1564 (v!1400 (underlying!28 thiss!848))) (minValue!1564 (v!1400 (underlying!28 thiss!848))))))))

(declare-fun b!16924 () Bool)

(assert (=> b!16924 (= c!1651 (bvsgt (bvsub (size!512 (_keys!3052 (v!1400 (underlying!28 thiss!848)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun e!10538 () tuple2!700)

(assert (=> b!16924 (= e!10540 e!10538)))

(declare-fun call!497 () Unit!346)

(declare-fun bm!502 () Bool)

(assert (=> bm!502 (= call!497 (addCommutativeForDiffKeys!1 (ite c!1651 lt!4329 lt!4318) lt!4325 lt!4327 (ite c!1651 lt!4335 lt!4314) (ite c!1651 (minValue!1564 (v!1400 (underlying!28 thiss!848))) (zeroValue!1564 (v!1400 (underlying!28 thiss!848))))))))

(declare-fun b!16925 () Bool)

(assert (=> b!16925 (= e!10539 (tuple2!701 true (v!1400 (_2!348 lt!4170))))))

(declare-fun bm!503 () Bool)

(declare-fun call!498 () ListLongMap!521)

(declare-fun call!503 () ListLongMap!521)

(assert (=> bm!503 (= call!498 (+!34 (ite c!1651 call!503 call!504) (ite c!1651 (tuple2!699 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1564 (v!1400 (underlying!28 thiss!848)))) (tuple2!699 lt!4325 lt!4327))))))

(declare-fun bm!497 () Bool)

(declare-fun c!1652 () Bool)

(assert (=> bm!497 (= call!509 (repackFrom!1 thiss!848 (ite c!1652 (_2!350 lt!4313) (v!1400 (_2!348 lt!4170))) (bvsub (bvsub (size!512 (_keys!3052 (v!1400 (underlying!28 thiss!848)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun d!3339 () Bool)

(declare-fun e!10537 () Bool)

(assert (=> d!3339 e!10537))

(declare-fun res!12399 () Bool)

(assert (=> d!3339 (=> res!12399 e!10537)))

(declare-fun lt!4322 () tuple2!700)

(assert (=> d!3339 (= res!12399 (not (_1!350 lt!4322)))))

(assert (=> d!3339 (= lt!4322 e!10541)))

(assert (=> d!3339 (= c!1652 (and (not (= lt!4325 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!4325 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!4330 () ListLongMap!521)

(assert (=> d!3339 (= lt!4330 (map!327 (v!1400 (_2!348 lt!4170))))))

(declare-fun get!325 (ValueCell!224 V!955) V!955)

(assert (=> d!3339 (= lt!4327 (get!325 (select (arr!422 (_values!1625 (v!1400 (underlying!28 thiss!848)))) (bvsub (size!512 (_keys!3052 (v!1400 (underlying!28 thiss!848)))) #b00000000000000000000000000000001)) (dynLambda!131 (defaultEntry!1627 (v!1400 (underlying!28 thiss!848))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3339 (= lt!4325 (select (arr!423 (_keys!3052 (v!1400 (underlying!28 thiss!848)))) (bvsub (size!512 (_keys!3052 (v!1400 (underlying!28 thiss!848)))) #b00000000000000000000000000000001)))))

(assert (=> d!3339 (valid!26 thiss!848)))

(assert (=> d!3339 (= (repackFrom!1 thiss!848 (v!1400 (_2!348 lt!4170)) (bvsub (size!512 (_keys!3052 (v!1400 (underlying!28 thiss!848)))) #b00000000000000000000000000000001)) lt!4322)))

(declare-fun b!16926 () Bool)

(declare-fun e!10542 () Bool)

(assert (=> b!16926 (= e!10537 e!10542)))

(declare-fun res!12398 () Bool)

(assert (=> b!16926 (=> (not res!12398) (not e!10542))))

(assert (=> b!16926 (= res!12398 (valid!25 (_2!350 lt!4322)))))

(declare-fun call!501 () ListLongMap!521)

(declare-fun bm!504 () Bool)

(assert (=> bm!504 (= call!501 (+!34 call!508 (ite c!1651 (tuple2!699 lt!4325 lt!4327) (tuple2!699 lt!4314 (zeroValue!1564 (v!1400 (underlying!28 thiss!848)))))))))

(declare-fun b!16927 () Bool)

(declare-fun e!10543 () Bool)

(assert (=> b!16927 (= e!10543 (ite (= lt!4325 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!1541 (v!1400 (underlying!28 thiss!848))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1541 (v!1400 (underlying!28 thiss!848))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!16928 () Bool)

(assert (=> b!16928 false))

(declare-fun lt!4310 () Unit!346)

(declare-fun lt!4328 () Unit!346)

(assert (=> b!16928 (= lt!4310 lt!4328)))

(declare-fun lt!4332 () (_ BitVec 32))

(assert (=> b!16928 (not (arrayContainsKey!0 (_keys!3052 (v!1400 (underlying!28 thiss!848))) lt!4325 lt!4332))))

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!881 (_ BitVec 32) (_ BitVec 64) List!528) Unit!346)

(assert (=> b!16928 (= lt!4328 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3052 (v!1400 (underlying!28 thiss!848))) lt!4332 lt!4325 (Cons!524 lt!4325 Nil!525)))))

(assert (=> b!16928 (= lt!4332 (bvadd (bvsub (size!512 (_keys!3052 (v!1400 (underlying!28 thiss!848)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun lt!4316 () Unit!346)

(declare-fun lt!4319 () Unit!346)

(assert (=> b!16928 (= lt!4316 lt!4319)))

(assert (=> b!16928 (arrayNoDuplicates!0 (_keys!3052 (v!1400 (underlying!28 thiss!848))) (bvsub (size!512 (_keys!3052 (v!1400 (underlying!28 thiss!848)))) #b00000000000000000000000000000001) Nil!525)))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!881 (_ BitVec 32) (_ BitVec 32)) Unit!346)

(assert (=> b!16928 (= lt!4319 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3052 (v!1400 (underlying!28 thiss!848))) #b00000000000000000000000000000000 (bvsub (size!512 (_keys!3052 (v!1400 (underlying!28 thiss!848)))) #b00000000000000000000000000000001)))))

(declare-fun lt!4333 () Unit!346)

(declare-fun lt!4326 () Unit!346)

(assert (=> b!16928 (= lt!4333 lt!4326)))

(assert (=> b!16928 e!10543))

(declare-fun c!1647 () Bool)

(assert (=> b!16928 (= c!1647 (and (not (= lt!4325 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!4325 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!4338 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!1 (array!881 array!879 (_ BitVec 32) (_ BitVec 32) V!955 V!955 (_ BitVec 64) (_ BitVec 32) Int) Unit!346)

(assert (=> b!16928 (= lt!4326 (lemmaListMapContainsThenArrayContainsFrom!1 (_keys!3052 (v!1400 (underlying!28 thiss!848))) (_values!1625 (v!1400 (underlying!28 thiss!848))) (mask!4537 (v!1400 (underlying!28 thiss!848))) (extraKeys!1541 (v!1400 (underlying!28 thiss!848))) (zeroValue!1564 (v!1400 (underlying!28 thiss!848))) (minValue!1564 (v!1400 (underlying!28 thiss!848))) lt!4325 lt!4338 (defaultEntry!1627 (v!1400 (underlying!28 thiss!848)))))))

(assert (=> b!16928 (= lt!4338 (bvadd (bvsub (size!512 (_keys!3052 (v!1400 (underlying!28 thiss!848)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun e!10536 () Unit!346)

(declare-fun Unit!350 () Unit!346)

(assert (=> b!16928 (= e!10536 Unit!350)))

(declare-fun b!16929 () Bool)

(assert (=> b!16929 (= e!10543 (arrayContainsKey!0 (_keys!3052 (v!1400 (underlying!28 thiss!848))) lt!4325 lt!4338))))

(declare-fun b!16930 () Bool)

(assert (=> b!16930 (= e!10541 e!10540)))

(assert (=> b!16930 (= lt!4313 (update!2 (v!1400 (_2!348 lt!4170)) lt!4325 lt!4327))))

(declare-fun c!1649 () Bool)

(declare-fun contains!207 (ListLongMap!521 (_ BitVec 64)) Bool)

(assert (=> b!16930 (= c!1649 (contains!207 lt!4330 lt!4325))))

(declare-fun lt!4321 () Unit!346)

(assert (=> b!16930 (= lt!4321 e!10536)))

(declare-fun c!1648 () Bool)

(assert (=> b!16930 (= c!1648 (_1!350 lt!4313))))

(declare-fun bm!505 () Bool)

(declare-fun call!505 () ListLongMap!521)

(assert (=> bm!505 (= call!505 (+!34 (ite c!1651 call!504 call!503) (ite c!1651 (tuple2!699 lt!4317 (zeroValue!1564 (v!1400 (underlying!28 thiss!848)))) (tuple2!699 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1564 (v!1400 (underlying!28 thiss!848)))))))))

(declare-fun bm!506 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!11 (array!881 array!879 (_ BitVec 32) (_ BitVec 32) V!955 V!955 (_ BitVec 32) Int) ListLongMap!521)

(assert (=> bm!506 (= call!503 (getCurrentListMapNoExtraKeys!11 (_keys!3052 (v!1400 (underlying!28 thiss!848))) (_values!1625 (v!1400 (underlying!28 thiss!848))) (mask!4537 (v!1400 (underlying!28 thiss!848))) (extraKeys!1541 (v!1400 (underlying!28 thiss!848))) (zeroValue!1564 (v!1400 (underlying!28 thiss!848))) (minValue!1564 (v!1400 (underlying!28 thiss!848))) (bvadd (bvsub (size!512 (_keys!3052 (v!1400 (underlying!28 thiss!848)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) (defaultEntry!1627 (v!1400 (underlying!28 thiss!848)))))))

(declare-fun b!16931 () Bool)

(assert (=> b!16931 (= e!10538 (tuple2!701 true (_2!350 lt!4313)))))

(assert (=> b!16931 (= lt!4318 call!503)))

(assert (=> b!16931 (= lt!4314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!4311 () Unit!346)

(assert (=> b!16931 (= lt!4311 call!497)))

(assert (=> b!16931 (= call!501 call!498)))

(declare-fun lt!4307 () Unit!346)

(assert (=> b!16931 (= lt!4307 lt!4311)))

(assert (=> b!16931 (= lt!4336 call!505)))

(assert (=> b!16931 (= lt!4309 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!4337 () Unit!346)

(assert (=> b!16931 (= lt!4337 call!506)))

(assert (=> b!16931 (= call!499 call!500)))

(declare-fun lt!4320 () Unit!346)

(assert (=> b!16931 (= lt!4320 lt!4337)))

(declare-fun b!16932 () Bool)

(declare-fun Unit!351 () Unit!346)

(assert (=> b!16932 (= e!10536 Unit!351)))

(declare-fun b!16933 () Bool)

(declare-fun lt!4331 () tuple2!700)

(assert (=> b!16933 (= e!10538 (tuple2!701 (_1!350 lt!4331) (_2!350 lt!4331)))))

(assert (=> b!16933 (= lt!4323 call!503)))

(assert (=> b!16933 (= lt!4317 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!4315 () Unit!346)

(assert (=> b!16933 (= lt!4315 call!506)))

(assert (=> b!16933 (= call!505 call!501)))

(declare-fun lt!4308 () Unit!346)

(assert (=> b!16933 (= lt!4308 lt!4315)))

(assert (=> b!16933 (= lt!4329 call!498)))

(assert (=> b!16933 (= lt!4335 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!4334 () Unit!346)

(assert (=> b!16933 (= lt!4334 call!497)))

(assert (=> b!16933 (= call!500 call!499)))

(declare-fun lt!4312 () Unit!346)

(assert (=> b!16933 (= lt!4312 lt!4334)))

(assert (=> b!16933 (= lt!4331 call!509)))

(declare-fun b!16934 () Bool)

(assert (=> b!16934 (= e!10542 (= (map!327 (_2!350 lt!4322)) (map!327 (v!1400 (underlying!28 thiss!848)))))))

(assert (= (and d!3339 c!1652) b!16930))

(assert (= (and d!3339 (not c!1652)) b!16922))

(assert (= (and b!16930 c!1649) b!16928))

(assert (= (and b!16930 (not c!1649)) b!16932))

(assert (= (and b!16928 c!1647) b!16929))

(assert (= (and b!16928 (not c!1647)) b!16927))

(assert (= (and b!16930 c!1648) b!16924))

(assert (= (and b!16930 (not c!1648)) b!16921))

(assert (= (and b!16924 c!1651) b!16933))

(assert (= (and b!16924 (not c!1651)) b!16931))

(assert (= (or b!16933 b!16931) bm!502))

(assert (= (or b!16933 b!16931) bm!500))

(assert (= (or b!16933 b!16931) bm!498))

(assert (= (or b!16933 b!16931) bm!506))

(assert (= (or b!16933 b!16931) bm!495))

(assert (= (or b!16933 b!16931) bm!501))

(assert (= (or b!16933 b!16931) bm!496))

(assert (= (or b!16933 b!16931) bm!494))

(assert (= (or b!16933 b!16931) bm!499))

(assert (= (or b!16933 b!16931) bm!503))

(assert (= (or b!16933 b!16931) bm!504))

(assert (= (or b!16933 b!16931) bm!505))

(assert (= (and b!16922 c!1650) b!16923))

(assert (= (and b!16922 (not c!1650)) b!16925))

(assert (= (or b!16933 b!16923) bm!497))

(assert (= (and d!3339 (not res!12399)) b!16926))

(assert (= (and b!16926 res!12398) b!16934))

(declare-fun b_lambda!1427 () Bool)

(assert (=> (not b_lambda!1427) (not d!3339)))

(assert (=> d!3339 t!3161))

(declare-fun b_and!1229 () Bool)

(assert (= b_and!1227 (and (=> t!3161 result!999) b_and!1229)))

(declare-fun m!11887 () Bool)

(assert (=> b!16928 m!11887))

(declare-fun m!11889 () Bool)

(assert (=> b!16928 m!11889))

(declare-fun m!11891 () Bool)

(assert (=> b!16928 m!11891))

(declare-fun m!11893 () Bool)

(assert (=> b!16928 m!11893))

(declare-fun m!11895 () Bool)

(assert (=> b!16928 m!11895))

(declare-fun m!11897 () Bool)

(assert (=> bm!499 m!11897))

(declare-fun m!11899 () Bool)

(assert (=> bm!494 m!11899))

(declare-fun m!11901 () Bool)

(assert (=> bm!500 m!11901))

(declare-fun m!11903 () Bool)

(assert (=> b!16934 m!11903))

(declare-fun m!11905 () Bool)

(assert (=> b!16934 m!11905))

(declare-fun m!11907 () Bool)

(assert (=> b!16926 m!11907))

(declare-fun m!11909 () Bool)

(assert (=> bm!501 m!11909))

(declare-fun m!11911 () Bool)

(assert (=> bm!495 m!11911))

(declare-fun m!11913 () Bool)

(assert (=> bm!496 m!11913))

(declare-fun m!11915 () Bool)

(assert (=> bm!506 m!11915))

(declare-fun m!11917 () Bool)

(assert (=> bm!497 m!11917))

(assert (=> d!3339 m!11859))

(declare-fun m!11919 () Bool)

(assert (=> d!3339 m!11919))

(declare-fun m!11921 () Bool)

(assert (=> d!3339 m!11921))

(declare-fun m!11923 () Bool)

(assert (=> d!3339 m!11923))

(assert (=> d!3339 m!11859))

(declare-fun m!11925 () Bool)

(assert (=> d!3339 m!11925))

(assert (=> d!3339 m!11923))

(assert (=> d!3339 m!11799))

(declare-fun m!11927 () Bool)

(assert (=> b!16930 m!11927))

(declare-fun m!11929 () Bool)

(assert (=> b!16930 m!11929))

(declare-fun m!11931 () Bool)

(assert (=> bm!504 m!11931))

(declare-fun m!11933 () Bool)

(assert (=> bm!502 m!11933))

(declare-fun m!11935 () Bool)

(assert (=> bm!503 m!11935))

(declare-fun m!11937 () Bool)

(assert (=> bm!498 m!11937))

(declare-fun m!11939 () Bool)

(assert (=> bm!505 m!11939))

(declare-fun m!11941 () Bool)

(assert (=> b!16929 m!11941))

(assert (=> b!16864 d!3339))

(declare-fun d!3341 () Bool)

(assert (=> d!3341 (= (map!326 (_2!345 lt!4165)) (map!327 (v!1400 (underlying!28 (_2!345 lt!4165)))))))

(declare-fun bs!803 () Bool)

(assert (= bs!803 d!3341))

(declare-fun m!11943 () Bool)

(assert (=> bs!803 m!11943))

(assert (=> b!16857 d!3341))

(declare-fun d!3343 () Bool)

(assert (=> d!3343 (= (map!326 thiss!848) (map!327 (v!1400 (underlying!28 thiss!848))))))

(declare-fun bs!804 () Bool)

(assert (= bs!804 d!3343))

(assert (=> bs!804 m!11905))

(assert (=> b!16857 d!3343))

(assert (=> d!3335 d!3337))

(declare-fun d!3345 () Bool)

(declare-fun e!10549 () Bool)

(assert (=> d!3345 e!10549))

(declare-fun res!12402 () Bool)

(assert (=> d!3345 (=> (not res!12402) (not e!10549))))

(declare-fun lt!4343 () (_ BitVec 32))

(assert (=> d!3345 (= res!12402 (validMask!0 lt!4343))))

(declare-datatypes ((tuple2!702 0))(
  ( (tuple2!703 (_1!352 Unit!346) (_2!352 (_ BitVec 32))) )
))
(declare-fun e!10548 () tuple2!702)

(assert (=> d!3345 (= lt!4343 (_2!352 e!10548))))

(declare-fun c!1655 () Bool)

(declare-fun lt!4344 () tuple2!702)

(assert (=> d!3345 (= c!1655 (and (bvsgt (_2!352 lt!4344) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!48 (v!1400 (underlying!28 thiss!848)))) (_2!352 lt!4344)) (bvsge (bvadd (bvand (bvashr (_2!352 lt!4344) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!48 (v!1400 (underlying!28 thiss!848))))))))

(declare-fun Unit!352 () Unit!346)

(declare-fun Unit!353 () Unit!346)

(assert (=> d!3345 (= lt!4344 (ite (and (bvsge (bvmul #b00000000000000000000000000000010 (bvadd (_size!48 (v!1400 (underlying!28 thiss!848))) (_vacant!48 (v!1400 (underlying!28 thiss!848))))) (mask!4537 (v!1400 (underlying!28 thiss!848)))) (bvsle (bvmul #b00000000000000000000000000000101 (_vacant!48 (v!1400 (underlying!28 thiss!848)))) (mask!4537 (v!1400 (underlying!28 thiss!848))))) (tuple2!703 Unit!352 (bvand (bvadd (bvshl (mask!4537 (v!1400 (underlying!28 thiss!848))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (tuple2!703 Unit!353 (mask!4537 (v!1400 (underlying!28 thiss!848))))))))

(assert (=> d!3345 (validMask!0 (mask!4537 (v!1400 (underlying!28 thiss!848))))))

(assert (=> d!3345 (= (computeNewMask!1 thiss!848 (mask!4537 (v!1400 (underlying!28 thiss!848))) (_vacant!48 (v!1400 (underlying!28 thiss!848))) (_size!48 (v!1400 (underlying!28 thiss!848)))) lt!4343)))

(declare-fun b!16941 () Bool)

(declare-fun computeNewMaskWhile!1 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!702)

(assert (=> b!16941 (= e!10548 (computeNewMaskWhile!1 (_size!48 (v!1400 (underlying!28 thiss!848))) (_vacant!48 (v!1400 (underlying!28 thiss!848))) (mask!4537 (v!1400 (underlying!28 thiss!848))) (_2!352 lt!4344)))))

(declare-fun b!16942 () Bool)

(declare-fun Unit!354 () Unit!346)

(assert (=> b!16942 (= e!10548 (tuple2!703 Unit!354 (_2!352 lt!4344)))))

(declare-fun b!16943 () Bool)

(assert (=> b!16943 (= e!10549 (bvsle (_size!48 (v!1400 (underlying!28 thiss!848))) (bvadd lt!4343 #b00000000000000000000000000000001)))))

(assert (= (and d!3345 c!1655) b!16941))

(assert (= (and d!3345 (not c!1655)) b!16942))

(assert (= (and d!3345 res!12402) b!16943))

(declare-fun m!11945 () Bool)

(assert (=> d!3345 m!11945))

(declare-fun m!11947 () Bool)

(assert (=> d!3345 m!11947))

(declare-fun m!11949 () Bool)

(assert (=> b!16941 m!11949))

(assert (=> d!3335 d!3345))

(assert (=> d!3335 d!3333))

(declare-fun b!16954 () Bool)

(declare-fun res!12412 () Bool)

(declare-fun e!10552 () Bool)

(assert (=> b!16954 (=> (not res!12412) (not e!10552))))

(declare-fun size!517 (LongMapFixedSize!34) (_ BitVec 32))

(assert (=> b!16954 (= res!12412 (= (size!517 (v!1400 (underlying!28 (_2!345 lt!4137)))) (bvadd (_size!48 (v!1400 (underlying!28 (_2!345 lt!4137)))) (bvsdiv (bvadd (extraKeys!1541 (v!1400 (underlying!28 (_2!345 lt!4137)))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!16952 () Bool)

(declare-fun res!12414 () Bool)

(assert (=> b!16952 (=> (not res!12414) (not e!10552))))

(assert (=> b!16952 (= res!12414 (and (= (size!511 (_values!1625 (v!1400 (underlying!28 (_2!345 lt!4137))))) (bvadd (mask!4537 (v!1400 (underlying!28 (_2!345 lt!4137)))) #b00000000000000000000000000000001)) (= (size!512 (_keys!3052 (v!1400 (underlying!28 (_2!345 lt!4137))))) (size!511 (_values!1625 (v!1400 (underlying!28 (_2!345 lt!4137)))))) (bvsge (_size!48 (v!1400 (underlying!28 (_2!345 lt!4137)))) #b00000000000000000000000000000000) (bvsle (_size!48 (v!1400 (underlying!28 (_2!345 lt!4137)))) (bvadd (mask!4537 (v!1400 (underlying!28 (_2!345 lt!4137)))) #b00000000000000000000000000000001))))))

(declare-fun d!3347 () Bool)

(declare-fun res!12413 () Bool)

(assert (=> d!3347 (=> (not res!12413) (not e!10552))))

(assert (=> d!3347 (= res!12413 (validMask!0 (mask!4537 (v!1400 (underlying!28 (_2!345 lt!4137))))))))

(assert (=> d!3347 (= (simpleValid!8 (v!1400 (underlying!28 (_2!345 lt!4137)))) e!10552)))

(declare-fun b!16955 () Bool)

(assert (=> b!16955 (= e!10552 (and (bvsge (extraKeys!1541 (v!1400 (underlying!28 (_2!345 lt!4137)))) #b00000000000000000000000000000000) (bvsle (extraKeys!1541 (v!1400 (underlying!28 (_2!345 lt!4137)))) #b00000000000000000000000000000011) (bvsge (_vacant!48 (v!1400 (underlying!28 (_2!345 lt!4137)))) #b00000000000000000000000000000000)))))

(declare-fun b!16953 () Bool)

(declare-fun res!12411 () Bool)

(assert (=> b!16953 (=> (not res!12411) (not e!10552))))

(assert (=> b!16953 (= res!12411 (bvsge (size!517 (v!1400 (underlying!28 (_2!345 lt!4137)))) (_size!48 (v!1400 (underlying!28 (_2!345 lt!4137))))))))

(assert (= (and d!3347 res!12413) b!16952))

(assert (= (and b!16952 res!12414) b!16953))

(assert (= (and b!16953 res!12411) b!16954))

(assert (= (and b!16954 res!12412) b!16955))

(declare-fun m!11951 () Bool)

(assert (=> b!16954 m!11951))

(declare-fun m!11953 () Bool)

(assert (=> d!3347 m!11953))

(assert (=> b!16953 m!11951))

(assert (=> d!3331 d!3347))

(declare-fun b!16964 () Bool)

(declare-fun e!10558 () (_ BitVec 32))

(assert (=> b!16964 (= e!10558 #b00000000000000000000000000000000)))

(declare-fun b!16965 () Bool)

(declare-fun e!10557 () (_ BitVec 32))

(assert (=> b!16965 (= e!10558 e!10557)))

(declare-fun c!1661 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!16965 (= c!1661 (validKeyInArray!0 (select (arr!423 (_keys!3052 (v!1400 (underlying!28 (_2!345 lt!4137))))) #b00000000000000000000000000000000)))))

(declare-fun b!16966 () Bool)

(declare-fun call!512 () (_ BitVec 32))

(assert (=> b!16966 (= e!10557 (bvadd #b00000000000000000000000000000001 call!512))))

(declare-fun b!16967 () Bool)

(assert (=> b!16967 (= e!10557 call!512)))

(declare-fun bm!509 () Bool)

(assert (=> bm!509 (= call!512 (arrayCountValidKeys!0 (_keys!3052 (v!1400 (underlying!28 (_2!345 lt!4137)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!512 (_keys!3052 (v!1400 (underlying!28 (_2!345 lt!4137)))))))))

(declare-fun d!3349 () Bool)

(declare-fun lt!4347 () (_ BitVec 32))

(assert (=> d!3349 (and (bvsge lt!4347 #b00000000000000000000000000000000) (bvsle lt!4347 (bvsub (size!512 (_keys!3052 (v!1400 (underlying!28 (_2!345 lt!4137))))) #b00000000000000000000000000000000)))))

(assert (=> d!3349 (= lt!4347 e!10558)))

(declare-fun c!1660 () Bool)

(assert (=> d!3349 (= c!1660 (bvsge #b00000000000000000000000000000000 (size!512 (_keys!3052 (v!1400 (underlying!28 (_2!345 lt!4137)))))))))

(assert (=> d!3349 (and (bvsle #b00000000000000000000000000000000 (size!512 (_keys!3052 (v!1400 (underlying!28 (_2!345 lt!4137)))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!512 (_keys!3052 (v!1400 (underlying!28 (_2!345 lt!4137))))) (size!512 (_keys!3052 (v!1400 (underlying!28 (_2!345 lt!4137)))))))))

(assert (=> d!3349 (= (arrayCountValidKeys!0 (_keys!3052 (v!1400 (underlying!28 (_2!345 lt!4137)))) #b00000000000000000000000000000000 (size!512 (_keys!3052 (v!1400 (underlying!28 (_2!345 lt!4137)))))) lt!4347)))

(assert (= (and d!3349 c!1660) b!16964))

(assert (= (and d!3349 (not c!1660)) b!16965))

(assert (= (and b!16965 c!1661) b!16966))

(assert (= (and b!16965 (not c!1661)) b!16967))

(assert (= (or b!16966 b!16967) bm!509))

(declare-fun m!11955 () Bool)

(assert (=> b!16965 m!11955))

(assert (=> b!16965 m!11955))

(declare-fun m!11957 () Bool)

(assert (=> b!16965 m!11957))

(declare-fun m!11959 () Bool)

(assert (=> bm!509 m!11959))

(assert (=> b!16835 d!3349))

(declare-fun b!16976 () Bool)

(declare-fun e!10565 () Bool)

(declare-fun call!515 () Bool)

(assert (=> b!16976 (= e!10565 call!515)))

(declare-fun b!16977 () Bool)

(declare-fun e!10567 () Bool)

(assert (=> b!16977 (= e!10565 e!10567)))

(declare-fun lt!4354 () (_ BitVec 64))

(assert (=> b!16977 (= lt!4354 (select (arr!423 (_keys!3052 (v!1400 (underlying!28 (_2!345 lt!4137))))) #b00000000000000000000000000000000))))

(declare-fun lt!4355 () Unit!346)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!881 (_ BitVec 64) (_ BitVec 32)) Unit!346)

(assert (=> b!16977 (= lt!4355 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3052 (v!1400 (underlying!28 (_2!345 lt!4137)))) lt!4354 #b00000000000000000000000000000000))))

(assert (=> b!16977 (arrayContainsKey!0 (_keys!3052 (v!1400 (underlying!28 (_2!345 lt!4137)))) lt!4354 #b00000000000000000000000000000000)))

(declare-fun lt!4356 () Unit!346)

(assert (=> b!16977 (= lt!4356 lt!4355)))

(declare-fun res!12419 () Bool)

(declare-datatypes ((SeekEntryResult!43 0))(
  ( (MissingZero!43 (index!2291 (_ BitVec 32))) (Found!43 (index!2292 (_ BitVec 32))) (Intermediate!43 (undefined!855 Bool) (index!2293 (_ BitVec 32)) (x!4374 (_ BitVec 32))) (Undefined!43) (MissingVacant!43 (index!2294 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!881 (_ BitVec 32)) SeekEntryResult!43)

(assert (=> b!16977 (= res!12419 (= (seekEntryOrOpen!0 (select (arr!423 (_keys!3052 (v!1400 (underlying!28 (_2!345 lt!4137))))) #b00000000000000000000000000000000) (_keys!3052 (v!1400 (underlying!28 (_2!345 lt!4137)))) (mask!4537 (v!1400 (underlying!28 (_2!345 lt!4137))))) (Found!43 #b00000000000000000000000000000000)))))

(assert (=> b!16977 (=> (not res!12419) (not e!10567))))

(declare-fun b!16978 () Bool)

(assert (=> b!16978 (= e!10567 call!515)))

(declare-fun b!16979 () Bool)

(declare-fun e!10566 () Bool)

(assert (=> b!16979 (= e!10566 e!10565)))

(declare-fun c!1664 () Bool)

(assert (=> b!16979 (= c!1664 (validKeyInArray!0 (select (arr!423 (_keys!3052 (v!1400 (underlying!28 (_2!345 lt!4137))))) #b00000000000000000000000000000000)))))

(declare-fun d!3351 () Bool)

(declare-fun res!12420 () Bool)

(assert (=> d!3351 (=> res!12420 e!10566)))

(assert (=> d!3351 (= res!12420 (bvsge #b00000000000000000000000000000000 (size!512 (_keys!3052 (v!1400 (underlying!28 (_2!345 lt!4137)))))))))

(assert (=> d!3351 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3052 (v!1400 (underlying!28 (_2!345 lt!4137)))) (mask!4537 (v!1400 (underlying!28 (_2!345 lt!4137))))) e!10566)))

(declare-fun bm!512 () Bool)

(assert (=> bm!512 (= call!515 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3052 (v!1400 (underlying!28 (_2!345 lt!4137)))) (mask!4537 (v!1400 (underlying!28 (_2!345 lt!4137))))))))

(assert (= (and d!3351 (not res!12420)) b!16979))

(assert (= (and b!16979 c!1664) b!16977))

(assert (= (and b!16979 (not c!1664)) b!16976))

(assert (= (and b!16977 res!12419) b!16978))

(assert (= (or b!16978 b!16976) bm!512))

(assert (=> b!16977 m!11955))

(declare-fun m!11961 () Bool)

(assert (=> b!16977 m!11961))

(declare-fun m!11963 () Bool)

(assert (=> b!16977 m!11963))

(assert (=> b!16977 m!11955))

(declare-fun m!11965 () Bool)

(assert (=> b!16977 m!11965))

(assert (=> b!16979 m!11955))

(assert (=> b!16979 m!11955))

(assert (=> b!16979 m!11957))

(declare-fun m!11967 () Bool)

(assert (=> bm!512 m!11967))

(assert (=> b!16836 d!3351))

(declare-fun d!3353 () Bool)

(declare-fun res!12421 () Bool)

(declare-fun e!10568 () Bool)

(assert (=> d!3353 (=> (not res!12421) (not e!10568))))

(assert (=> d!3353 (= res!12421 (simpleValid!8 (v!1400 (underlying!28 thiss!848))))))

(assert (=> d!3353 (= (valid!25 (v!1400 (underlying!28 thiss!848))) e!10568)))

(declare-fun b!16980 () Bool)

(declare-fun res!12422 () Bool)

(assert (=> b!16980 (=> (not res!12422) (not e!10568))))

(assert (=> b!16980 (= res!12422 (= (arrayCountValidKeys!0 (_keys!3052 (v!1400 (underlying!28 thiss!848))) #b00000000000000000000000000000000 (size!512 (_keys!3052 (v!1400 (underlying!28 thiss!848))))) (_size!48 (v!1400 (underlying!28 thiss!848)))))))

(declare-fun b!16981 () Bool)

(declare-fun res!12423 () Bool)

(assert (=> b!16981 (=> (not res!12423) (not e!10568))))

(assert (=> b!16981 (= res!12423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3052 (v!1400 (underlying!28 thiss!848))) (mask!4537 (v!1400 (underlying!28 thiss!848)))))))

(declare-fun b!16982 () Bool)

(assert (=> b!16982 (= e!10568 (arrayNoDuplicates!0 (_keys!3052 (v!1400 (underlying!28 thiss!848))) #b00000000000000000000000000000000 Nil!525))))

(assert (= (and d!3353 res!12421) b!16980))

(assert (= (and b!16980 res!12422) b!16981))

(assert (= (and b!16981 res!12423) b!16982))

(declare-fun m!11969 () Bool)

(assert (=> d!3353 m!11969))

(declare-fun m!11971 () Bool)

(assert (=> b!16980 m!11971))

(declare-fun m!11973 () Bool)

(assert (=> b!16981 m!11973))

(declare-fun m!11975 () Bool)

(assert (=> b!16982 m!11975))

(assert (=> d!3333 d!3353))

(declare-fun bm!515 () Bool)

(declare-fun call!518 () Bool)

(declare-fun c!1667 () Bool)

(assert (=> bm!515 (= call!518 (arrayNoDuplicates!0 (_keys!3052 (v!1400 (underlying!28 (_2!345 lt!4137)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!1667 (Cons!524 (select (arr!423 (_keys!3052 (v!1400 (underlying!28 (_2!345 lt!4137))))) #b00000000000000000000000000000000) Nil!525) Nil!525)))))

(declare-fun b!16993 () Bool)

(declare-fun e!10577 () Bool)

(declare-fun contains!208 (List!528 (_ BitVec 64)) Bool)

(assert (=> b!16993 (= e!10577 (contains!208 Nil!525 (select (arr!423 (_keys!3052 (v!1400 (underlying!28 (_2!345 lt!4137))))) #b00000000000000000000000000000000)))))

(declare-fun b!16994 () Bool)

(declare-fun e!10579 () Bool)

(declare-fun e!10580 () Bool)

(assert (=> b!16994 (= e!10579 e!10580)))

(declare-fun res!12430 () Bool)

(assert (=> b!16994 (=> (not res!12430) (not e!10580))))

(assert (=> b!16994 (= res!12430 (not e!10577))))

(declare-fun res!12431 () Bool)

(assert (=> b!16994 (=> (not res!12431) (not e!10577))))

(assert (=> b!16994 (= res!12431 (validKeyInArray!0 (select (arr!423 (_keys!3052 (v!1400 (underlying!28 (_2!345 lt!4137))))) #b00000000000000000000000000000000)))))

(declare-fun d!3355 () Bool)

(declare-fun res!12432 () Bool)

(assert (=> d!3355 (=> res!12432 e!10579)))

(assert (=> d!3355 (= res!12432 (bvsge #b00000000000000000000000000000000 (size!512 (_keys!3052 (v!1400 (underlying!28 (_2!345 lt!4137)))))))))

(assert (=> d!3355 (= (arrayNoDuplicates!0 (_keys!3052 (v!1400 (underlying!28 (_2!345 lt!4137)))) #b00000000000000000000000000000000 Nil!525) e!10579)))

(declare-fun b!16995 () Bool)

(declare-fun e!10578 () Bool)

(assert (=> b!16995 (= e!10578 call!518)))

(declare-fun b!16996 () Bool)

(assert (=> b!16996 (= e!10578 call!518)))

(declare-fun b!16997 () Bool)

(assert (=> b!16997 (= e!10580 e!10578)))

(assert (=> b!16997 (= c!1667 (validKeyInArray!0 (select (arr!423 (_keys!3052 (v!1400 (underlying!28 (_2!345 lt!4137))))) #b00000000000000000000000000000000)))))

(assert (= (and d!3355 (not res!12432)) b!16994))

(assert (= (and b!16994 res!12431) b!16993))

(assert (= (and b!16994 res!12430) b!16997))

(assert (= (and b!16997 c!1667) b!16996))

(assert (= (and b!16997 (not c!1667)) b!16995))

(assert (= (or b!16996 b!16995) bm!515))

(assert (=> bm!515 m!11955))

(declare-fun m!11977 () Bool)

(assert (=> bm!515 m!11977))

(assert (=> b!16993 m!11955))

(assert (=> b!16993 m!11955))

(declare-fun m!11979 () Bool)

(assert (=> b!16993 m!11979))

(assert (=> b!16994 m!11955))

(assert (=> b!16994 m!11955))

(assert (=> b!16994 m!11957))

(assert (=> b!16997 m!11955))

(assert (=> b!16997 m!11955))

(assert (=> b!16997 m!11957))

(assert (=> b!16837 d!3355))

(declare-fun b!17074 () Bool)

(declare-fun e!10626 () Unit!346)

(declare-fun Unit!355 () Unit!346)

(assert (=> b!17074 (= e!10626 Unit!355)))

(declare-fun lt!4437 () Unit!346)

(declare-fun call!573 () Unit!346)

(assert (=> b!17074 (= lt!4437 call!573)))

(declare-fun lt!4431 () SeekEntryResult!43)

(declare-fun call!571 () SeekEntryResult!43)

(assert (=> b!17074 (= lt!4431 call!571)))

(declare-fun res!12469 () Bool)

(assert (=> b!17074 (= res!12469 ((_ is Found!43) lt!4431))))

(declare-fun e!10628 () Bool)

(assert (=> b!17074 (=> (not res!12469) (not e!10628))))

(assert (=> b!17074 e!10628))

(declare-fun lt!4417 () Unit!346)

(assert (=> b!17074 (= lt!4417 lt!4437)))

(assert (=> b!17074 false))

(declare-fun b!17075 () Bool)

(declare-fun e!10632 () tuple2!700)

(declare-fun e!10636 () tuple2!700)

(assert (=> b!17075 (= e!10632 e!10636)))

(declare-fun lt!4424 () SeekEntryResult!43)

(assert (=> b!17075 (= lt!4424 (seekEntryOrOpen!0 (ite c!1627 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1625 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3052 (ite c!1627 (_2!350 lt!4166) call!469)) (mask!4537 (ite c!1627 (_2!350 lt!4166) call!469))))))

(declare-fun c!1698 () Bool)

(assert (=> b!17075 (= c!1698 ((_ is Undefined!43) lt!4424))))

(declare-fun b!17076 () Bool)

(declare-fun e!10630 () Bool)

(declare-fun e!10621 () Bool)

(assert (=> b!17076 (= e!10630 e!10621)))

(declare-fun c!1696 () Bool)

(declare-fun lt!4420 () tuple2!700)

(assert (=> b!17076 (= c!1696 (_1!350 lt!4420))))

(declare-fun bm!564 () Bool)

(declare-fun call!589 () ListLongMap!521)

(declare-fun call!567 () ListLongMap!521)

(assert (=> bm!564 (= call!589 call!567)))

(declare-fun b!17077 () Bool)

(declare-fun lt!4415 () Unit!346)

(assert (=> b!17077 (= lt!4415 e!10626)))

(declare-fun c!1695 () Bool)

(declare-fun call!588 () Bool)

(assert (=> b!17077 (= c!1695 call!588)))

(assert (=> b!17077 (= e!10636 (tuple2!701 false (ite c!1627 (_2!350 lt!4166) call!469)))))

(declare-fun b!17078 () Bool)

(declare-fun call!585 () ListLongMap!521)

(declare-fun call!583 () ListLongMap!521)

(assert (=> b!17078 (= e!10621 (= call!585 call!583))))

(declare-fun b!17079 () Bool)

(declare-fun c!1693 () Bool)

(assert (=> b!17079 (= c!1693 ((_ is MissingVacant!43) lt!4424))))

(declare-fun e!10631 () tuple2!700)

(assert (=> b!17079 (= e!10636 e!10631)))

(declare-fun b!17080 () Bool)

(declare-fun e!10639 () Bool)

(assert (=> b!17080 (= e!10621 e!10639)))

(declare-fun res!12473 () Bool)

(assert (=> b!17080 (= res!12473 (contains!207 call!583 (ite c!1627 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1625 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!17080 (=> (not res!12473) (not e!10639))))

(declare-fun bm!565 () Bool)

(declare-fun c!1700 () Bool)

(declare-fun lt!4421 () (_ BitVec 32))

(declare-fun c!1699 () Bool)

(declare-fun call!590 () ListLongMap!521)

(declare-fun lt!4429 () (_ BitVec 32))

(declare-fun getCurrentListMap!118 (array!881 array!879 (_ BitVec 32) (_ BitVec 32) V!955 V!955 (_ BitVec 32) Int) ListLongMap!521)

(assert (=> bm!565 (= call!590 (getCurrentListMap!118 (_keys!3052 (ite c!1627 (_2!350 lt!4166) call!469)) (_values!1625 (ite c!1627 (_2!350 lt!4166) call!469)) (mask!4537 (ite c!1627 (_2!350 lt!4166) call!469)) (ite c!1700 (ite c!1699 lt!4421 lt!4429) (extraKeys!1541 (ite c!1627 (_2!350 lt!4166) call!469))) (ite (and c!1700 c!1699) (ite c!1627 (minValue!1564 (v!1400 (underlying!28 thiss!848))) (ite c!1625 (zeroValue!1564 (v!1400 (underlying!28 thiss!848))) (minValue!1564 (v!1400 (underlying!28 thiss!848))))) (zeroValue!1564 (ite c!1627 (_2!350 lt!4166) call!469))) (ite c!1700 (ite c!1699 (minValue!1564 (ite c!1627 (_2!350 lt!4166) call!469)) (ite c!1627 (minValue!1564 (v!1400 (underlying!28 thiss!848))) (ite c!1625 (zeroValue!1564 (v!1400 (underlying!28 thiss!848))) (minValue!1564 (v!1400 (underlying!28 thiss!848)))))) (minValue!1564 (ite c!1627 (_2!350 lt!4166) call!469))) #b00000000000000000000000000000000 (defaultEntry!1627 (ite c!1627 (_2!350 lt!4166) call!469))))))

(declare-fun bm!566 () Bool)

(declare-fun call!577 () Bool)

(declare-fun call!582 () Bool)

(assert (=> bm!566 (= call!577 call!582)))

(declare-fun bm!567 () Bool)

(assert (=> bm!567 (= call!583 (map!327 (ite c!1696 (_2!350 lt!4420) (ite c!1627 (_2!350 lt!4166) call!469))))))

(declare-fun b!17081 () Bool)

(declare-fun lt!4433 () tuple2!700)

(assert (=> b!17081 (= e!10631 (tuple2!701 (_1!350 lt!4433) (_2!350 lt!4433)))))

(declare-fun call!580 () tuple2!700)

(assert (=> b!17081 (= lt!4433 call!580)))

(declare-fun d!3357 () Bool)

(assert (=> d!3357 e!10630))

(declare-fun res!12461 () Bool)

(assert (=> d!3357 (=> (not res!12461) (not e!10630))))

(assert (=> d!3357 (= res!12461 (valid!25 (_2!350 lt!4420)))))

(assert (=> d!3357 (= lt!4420 e!10632)))

(assert (=> d!3357 (= c!1700 (= (ite c!1627 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1625 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvneg (ite c!1627 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1625 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!3357 (valid!25 (ite c!1627 (_2!350 lt!4166) call!469))))

(assert (=> d!3357 (= (update!2 (ite c!1627 (_2!350 lt!4166) call!469) (ite c!1627 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1625 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!1627 (minValue!1564 (v!1400 (underlying!28 thiss!848))) (ite c!1625 (zeroValue!1564 (v!1400 (underlying!28 thiss!848))) (minValue!1564 (v!1400 (underlying!28 thiss!848)))))) lt!4420)))

(declare-fun bm!568 () Bool)

(declare-fun call!569 () SeekEntryResult!43)

(declare-fun call!572 () SeekEntryResult!43)

(assert (=> bm!568 (= call!569 call!572)))

(declare-fun bm!569 () Bool)

(declare-fun call!576 () ListLongMap!521)

(assert (=> bm!569 (= call!576 call!590)))

(declare-fun b!17082 () Bool)

(declare-fun res!12467 () Bool)

(declare-fun e!10637 () Bool)

(assert (=> b!17082 (=> (not res!12467) (not e!10637))))

(declare-fun lt!4419 () SeekEntryResult!43)

(assert (=> b!17082 (= res!12467 (= (select (arr!423 (_keys!3052 (ite c!1627 (_2!350 lt!4166) call!469))) (index!2291 lt!4419)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!570 () Bool)

(declare-fun call!575 () ListLongMap!521)

(assert (=> bm!570 (= call!575 call!590)))

(declare-fun bm!571 () Bool)

(declare-fun updateHelperNewKey!1 (LongMapFixedSize!34 (_ BitVec 64) V!955 (_ BitVec 32)) tuple2!700)

(assert (=> bm!571 (= call!580 (updateHelperNewKey!1 (ite c!1627 (_2!350 lt!4166) call!469) (ite c!1627 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1625 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!1627 (minValue!1564 (v!1400 (underlying!28 thiss!848))) (ite c!1625 (zeroValue!1564 (v!1400 (underlying!28 thiss!848))) (minValue!1564 (v!1400 (underlying!28 thiss!848))))) (ite c!1693 (index!2294 lt!4424) (index!2291 lt!4424))))))

(declare-fun bm!572 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!1 (array!881 array!879 (_ BitVec 32) (_ BitVec 32) V!955 V!955 (_ BitVec 64) Int) Unit!346)

(assert (=> bm!572 (= call!573 (lemmaInListMapThenSeekEntryOrOpenFindsIt!1 (_keys!3052 (ite c!1627 (_2!350 lt!4166) call!469)) (_values!1625 (ite c!1627 (_2!350 lt!4166) call!469)) (mask!4537 (ite c!1627 (_2!350 lt!4166) call!469)) (extraKeys!1541 (ite c!1627 (_2!350 lt!4166) call!469)) (zeroValue!1564 (ite c!1627 (_2!350 lt!4166) call!469)) (minValue!1564 (ite c!1627 (_2!350 lt!4166) call!469)) (ite c!1627 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1625 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1627 (ite c!1627 (_2!350 lt!4166) call!469))))))

(declare-fun lt!4411 () SeekEntryResult!43)

(declare-fun b!17083 () Bool)

(declare-fun res!12462 () Bool)

(assert (=> b!17083 (= res!12462 (= (select (arr!423 (_keys!3052 (ite c!1627 (_2!350 lt!4166) call!469))) (index!2294 lt!4411)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!10634 () Bool)

(assert (=> b!17083 (=> (not res!12462) (not e!10634))))

(declare-fun b!17084 () Bool)

(declare-fun res!12463 () Bool)

(declare-fun call!579 () Bool)

(assert (=> b!17084 (= res!12463 call!579)))

(declare-fun e!10635 () Bool)

(assert (=> b!17084 (=> (not res!12463) (not e!10635))))

(declare-fun b!17085 () Bool)

(declare-fun res!12472 () Bool)

(declare-fun call!581 () Bool)

(assert (=> b!17085 (= res!12472 call!581)))

(assert (=> b!17085 (=> (not res!12472) (not e!10628))))

(declare-fun res!12474 () Bool)

(declare-fun b!17086 () Bool)

(assert (=> b!17086 (= res!12474 (= (select (arr!423 (_keys!3052 (ite c!1627 (_2!350 lt!4166) call!469))) (index!2294 lt!4419)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!10622 () Bool)

(assert (=> b!17086 (=> (not res!12474) (not e!10622))))

(declare-fun b!17087 () Bool)

(declare-fun lt!4425 () Unit!346)

(declare-fun lt!4423 () Unit!346)

(assert (=> b!17087 (= lt!4425 lt!4423)))

(assert (=> b!17087 (= call!589 call!575)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!1 (array!881 array!879 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!955 V!955 V!955 Int) Unit!346)

(assert (=> b!17087 (= lt!4423 (lemmaChangeLongMinValueKeyThenAddPairToListMap!1 (_keys!3052 (ite c!1627 (_2!350 lt!4166) call!469)) (_values!1625 (ite c!1627 (_2!350 lt!4166) call!469)) (mask!4537 (ite c!1627 (_2!350 lt!4166) call!469)) (extraKeys!1541 (ite c!1627 (_2!350 lt!4166) call!469)) lt!4429 (zeroValue!1564 (ite c!1627 (_2!350 lt!4166) call!469)) (minValue!1564 (ite c!1627 (_2!350 lt!4166) call!469)) (ite c!1627 (minValue!1564 (v!1400 (underlying!28 thiss!848))) (ite c!1625 (zeroValue!1564 (v!1400 (underlying!28 thiss!848))) (minValue!1564 (v!1400 (underlying!28 thiss!848))))) (defaultEntry!1627 (ite c!1627 (_2!350 lt!4166) call!469))))))

(assert (=> b!17087 (= lt!4429 (bvor (extraKeys!1541 (ite c!1627 (_2!350 lt!4166) call!469)) #b00000000000000000000000000000010))))

(declare-fun e!10629 () tuple2!700)

(assert (=> b!17087 (= e!10629 (tuple2!701 true (LongMapFixedSize!35 (defaultEntry!1627 (ite c!1627 (_2!350 lt!4166) call!469)) (mask!4537 (ite c!1627 (_2!350 lt!4166) call!469)) (bvor (extraKeys!1541 (ite c!1627 (_2!350 lt!4166) call!469)) #b00000000000000000000000000000010) (zeroValue!1564 (ite c!1627 (_2!350 lt!4166) call!469)) (ite c!1627 (minValue!1564 (v!1400 (underlying!28 thiss!848))) (ite c!1625 (zeroValue!1564 (v!1400 (underlying!28 thiss!848))) (minValue!1564 (v!1400 (underlying!28 thiss!848))))) (_size!48 (ite c!1627 (_2!350 lt!4166) call!469)) (_keys!3052 (ite c!1627 (_2!350 lt!4166) call!469)) (_values!1625 (ite c!1627 (_2!350 lt!4166) call!469)) (_vacant!48 (ite c!1627 (_2!350 lt!4166) call!469)))))))

(declare-fun bm!573 () Bool)

(declare-fun call!586 () Bool)

(assert (=> bm!573 (= call!586 call!579)))

(declare-fun bm!574 () Bool)

(declare-fun call!578 () Bool)

(assert (=> bm!574 (= call!579 call!578)))

(declare-fun b!17088 () Bool)

(declare-fun res!12466 () Bool)

(declare-fun e!10625 () Bool)

(assert (=> b!17088 (=> (not res!12466) (not e!10625))))

(assert (=> b!17088 (= res!12466 (= (select (arr!423 (_keys!3052 (ite c!1627 (_2!350 lt!4166) call!469))) (index!2291 lt!4411)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!17089 () Bool)

(declare-fun call!584 () Bool)

(assert (=> b!17089 (= e!10637 (not call!584))))

(declare-fun b!17090 () Bool)

(declare-fun e!10640 () tuple2!700)

(assert (=> b!17090 (= e!10631 e!10640)))

(declare-fun c!1703 () Bool)

(assert (=> b!17090 (= c!1703 ((_ is MissingZero!43) lt!4424))))

(declare-fun b!17091 () Bool)

(assert (=> b!17091 (= e!10625 (not call!577))))

(declare-fun b!17092 () Bool)

(assert (=> b!17092 (= e!10639 (= call!583 (+!34 call!585 (tuple2!699 (ite c!1627 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1625 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!1627 (minValue!1564 (v!1400 (underlying!28 thiss!848))) (ite c!1625 (zeroValue!1564 (v!1400 (underlying!28 thiss!848))) (minValue!1564 (v!1400 (underlying!28 thiss!848)))))))))))

(declare-fun lt!4414 () array!879)

(declare-fun bm!575 () Bool)

(declare-fun call!574 () ListLongMap!521)

(assert (=> bm!575 (= call!574 (getCurrentListMap!118 (_keys!3052 (ite c!1627 (_2!350 lt!4166) call!469)) (ite c!1700 (_values!1625 (ite c!1627 (_2!350 lt!4166) call!469)) lt!4414) (mask!4537 (ite c!1627 (_2!350 lt!4166) call!469)) (extraKeys!1541 (ite c!1627 (_2!350 lt!4166) call!469)) (zeroValue!1564 (ite c!1627 (_2!350 lt!4166) call!469)) (minValue!1564 (ite c!1627 (_2!350 lt!4166) call!469)) #b00000000000000000000000000000000 (defaultEntry!1627 (ite c!1627 (_2!350 lt!4166) call!469))))))

(declare-fun bm!576 () Bool)

(declare-fun call!587 () ListLongMap!521)

(assert (=> bm!576 (= call!567 (+!34 (ite c!1700 call!587 call!576) (ite c!1700 (ite c!1699 (tuple2!699 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!1627 (minValue!1564 (v!1400 (underlying!28 thiss!848))) (ite c!1625 (zeroValue!1564 (v!1400 (underlying!28 thiss!848))) (minValue!1564 (v!1400 (underlying!28 thiss!848)))))) (tuple2!699 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1627 (minValue!1564 (v!1400 (underlying!28 thiss!848))) (ite c!1625 (zeroValue!1564 (v!1400 (underlying!28 thiss!848))) (minValue!1564 (v!1400 (underlying!28 thiss!848))))))) (tuple2!699 (ite c!1627 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1625 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!1627 (minValue!1564 (v!1400 (underlying!28 thiss!848))) (ite c!1625 (zeroValue!1564 (v!1400 (underlying!28 thiss!848))) (minValue!1564 (v!1400 (underlying!28 thiss!848)))))))))))

(declare-fun bm!577 () Bool)

(assert (=> bm!577 (= call!572 (seekEntryOrOpen!0 (ite c!1627 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1625 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3052 (ite c!1627 (_2!350 lt!4166) call!469)) (mask!4537 (ite c!1627 (_2!350 lt!4166) call!469))))))

(declare-fun b!17093 () Bool)

(declare-fun lt!4413 () Unit!346)

(declare-fun lt!4427 () Unit!346)

(assert (=> b!17093 (= lt!4413 lt!4427)))

(assert (=> b!17093 (contains!207 call!574 (select (arr!423 (_keys!3052 (ite c!1627 (_2!350 lt!4166) call!469))) (index!2292 lt!4424)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!1 (array!881 array!879 (_ BitVec 32) (_ BitVec 32) V!955 V!955 (_ BitVec 32) Int) Unit!346)

(assert (=> b!17093 (= lt!4427 (lemmaValidKeyInArrayIsInListMap!1 (_keys!3052 (ite c!1627 (_2!350 lt!4166) call!469)) lt!4414 (mask!4537 (ite c!1627 (_2!350 lt!4166) call!469)) (extraKeys!1541 (ite c!1627 (_2!350 lt!4166) call!469)) (zeroValue!1564 (ite c!1627 (_2!350 lt!4166) call!469)) (minValue!1564 (ite c!1627 (_2!350 lt!4166) call!469)) (index!2292 lt!4424) (defaultEntry!1627 (ite c!1627 (_2!350 lt!4166) call!469))))))

(assert (=> b!17093 (= lt!4414 (array!880 (store (arr!422 (_values!1625 (ite c!1627 (_2!350 lt!4166) call!469))) (index!2292 lt!4424) (ValueCellFull!224 (ite c!1627 (minValue!1564 (v!1400 (underlying!28 thiss!848))) (ite c!1625 (zeroValue!1564 (v!1400 (underlying!28 thiss!848))) (minValue!1564 (v!1400 (underlying!28 thiss!848))))))) (size!511 (_values!1625 (ite c!1627 (_2!350 lt!4166) call!469)))))))

(declare-fun lt!4432 () Unit!346)

(declare-fun lt!4418 () Unit!346)

(assert (=> b!17093 (= lt!4432 lt!4418)))

(assert (=> b!17093 (= call!567 (getCurrentListMap!118 (_keys!3052 (ite c!1627 (_2!350 lt!4166) call!469)) (array!880 (store (arr!422 (_values!1625 (ite c!1627 (_2!350 lt!4166) call!469))) (index!2292 lt!4424) (ValueCellFull!224 (ite c!1627 (minValue!1564 (v!1400 (underlying!28 thiss!848))) (ite c!1625 (zeroValue!1564 (v!1400 (underlying!28 thiss!848))) (minValue!1564 (v!1400 (underlying!28 thiss!848))))))) (size!511 (_values!1625 (ite c!1627 (_2!350 lt!4166) call!469)))) (mask!4537 (ite c!1627 (_2!350 lt!4166) call!469)) (extraKeys!1541 (ite c!1627 (_2!350 lt!4166) call!469)) (zeroValue!1564 (ite c!1627 (_2!350 lt!4166) call!469)) (minValue!1564 (ite c!1627 (_2!350 lt!4166) call!469)) #b00000000000000000000000000000000 (defaultEntry!1627 (ite c!1627 (_2!350 lt!4166) call!469))))))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!1 (array!881 array!879 (_ BitVec 32) (_ BitVec 32) V!955 V!955 (_ BitVec 32) (_ BitVec 64) V!955 Int) Unit!346)

(assert (=> b!17093 (= lt!4418 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!1 (_keys!3052 (ite c!1627 (_2!350 lt!4166) call!469)) (_values!1625 (ite c!1627 (_2!350 lt!4166) call!469)) (mask!4537 (ite c!1627 (_2!350 lt!4166) call!469)) (extraKeys!1541 (ite c!1627 (_2!350 lt!4166) call!469)) (zeroValue!1564 (ite c!1627 (_2!350 lt!4166) call!469)) (minValue!1564 (ite c!1627 (_2!350 lt!4166) call!469)) (index!2292 lt!4424) (ite c!1627 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1625 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!1627 (minValue!1564 (v!1400 (underlying!28 thiss!848))) (ite c!1625 (zeroValue!1564 (v!1400 (underlying!28 thiss!848))) (minValue!1564 (v!1400 (underlying!28 thiss!848))))) (defaultEntry!1627 (ite c!1627 (_2!350 lt!4166) call!469))))))

(declare-fun lt!4436 () Unit!346)

(declare-fun e!10627 () Unit!346)

(assert (=> b!17093 (= lt!4436 e!10627)))

(declare-fun c!1692 () Bool)

(assert (=> b!17093 (= c!1692 call!588)))

(assert (=> b!17093 (= e!10640 (tuple2!701 true (LongMapFixedSize!35 (defaultEntry!1627 (ite c!1627 (_2!350 lt!4166) call!469)) (mask!4537 (ite c!1627 (_2!350 lt!4166) call!469)) (extraKeys!1541 (ite c!1627 (_2!350 lt!4166) call!469)) (zeroValue!1564 (ite c!1627 (_2!350 lt!4166) call!469)) (minValue!1564 (ite c!1627 (_2!350 lt!4166) call!469)) (_size!48 (ite c!1627 (_2!350 lt!4166) call!469)) (_keys!3052 (ite c!1627 (_2!350 lt!4166) call!469)) (array!880 (store (arr!422 (_values!1625 (ite c!1627 (_2!350 lt!4166) call!469))) (index!2292 lt!4424) (ValueCellFull!224 (ite c!1627 (minValue!1564 (v!1400 (underlying!28 thiss!848))) (ite c!1625 (zeroValue!1564 (v!1400 (underlying!28 thiss!848))) (minValue!1564 (v!1400 (underlying!28 thiss!848))))))) (size!511 (_values!1625 (ite c!1627 (_2!350 lt!4166) call!469)))) (_vacant!48 (ite c!1627 (_2!350 lt!4166) call!469)))))))

(declare-fun b!17094 () Bool)

(declare-fun lt!4434 () tuple2!700)

(assert (=> b!17094 (= lt!4434 call!580)))

(assert (=> b!17094 (= e!10640 (tuple2!701 (_1!350 lt!4434) (_2!350 lt!4434)))))

(declare-fun bm!578 () Bool)

(assert (=> bm!578 (= call!571 call!572)))

(declare-fun bm!579 () Bool)

(assert (=> bm!579 (= call!588 (contains!207 call!576 (ite c!1627 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1625 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun c!1702 () Bool)

(declare-fun c!1694 () Bool)

(declare-fun lt!4435 () SeekEntryResult!43)

(declare-fun bm!580 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!580 (= call!578 (inRange!0 (ite c!1698 (ite c!1695 (index!2292 lt!4431) (ite c!1694 (index!2291 lt!4411) (index!2294 lt!4411))) (ite c!1692 (index!2292 lt!4435) (ite c!1702 (index!2291 lt!4419) (index!2294 lt!4419)))) (mask!4537 (ite c!1627 (_2!350 lt!4166) call!469))))))

(declare-fun b!17095 () Bool)

(declare-fun e!10624 () Bool)

(assert (=> b!17095 (= e!10624 ((_ is Undefined!43) lt!4419))))

(declare-fun b!17096 () Bool)

(declare-fun e!10638 () Bool)

(assert (=> b!17096 (= e!10638 ((_ is Undefined!43) lt!4411))))

(declare-fun b!17097 () Bool)

(declare-fun lt!4416 () Unit!346)

(assert (=> b!17097 (= e!10626 lt!4416)))

(declare-fun call!570 () Unit!346)

(assert (=> b!17097 (= lt!4416 call!570)))

(assert (=> b!17097 (= lt!4411 call!571)))

(assert (=> b!17097 (= c!1694 ((_ is MissingZero!43) lt!4411))))

(declare-fun e!10633 () Bool)

(assert (=> b!17097 e!10633))

(declare-fun b!17098 () Bool)

(assert (=> b!17098 (= e!10638 e!10634)))

(declare-fun res!12471 () Bool)

(declare-fun call!568 () Bool)

(assert (=> b!17098 (= res!12471 call!568)))

(assert (=> b!17098 (=> (not res!12471) (not e!10634))))

(declare-fun b!17099 () Bool)

(assert (=> b!17099 (= e!10622 (not call!584))))

(declare-fun b!17100 () Bool)

(assert (=> b!17100 (= e!10628 (= (select (arr!423 (_keys!3052 (ite c!1627 (_2!350 lt!4166) call!469))) (index!2292 lt!4431)) (ite c!1627 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1625 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!17101 () Bool)

(assert (=> b!17101 (= e!10635 (= (select (arr!423 (_keys!3052 (ite c!1627 (_2!350 lt!4166) call!469))) (index!2292 lt!4435)) (ite c!1627 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1625 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!17102 () Bool)

(declare-fun c!1701 () Bool)

(assert (=> b!17102 (= c!1701 ((_ is MissingVacant!43) lt!4411))))

(assert (=> b!17102 (= e!10633 e!10638)))

(declare-fun b!17103 () Bool)

(declare-fun res!12470 () Bool)

(assert (=> b!17103 (=> (not res!12470) (not e!10625))))

(assert (=> b!17103 (= res!12470 call!568)))

(assert (=> b!17103 (= e!10633 e!10625)))

(declare-fun bm!581 () Bool)

(assert (=> bm!581 (= call!582 (arrayContainsKey!0 (_keys!3052 (ite c!1627 (_2!350 lt!4166) call!469)) (ite c!1627 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1625 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000))))

(declare-fun b!17104 () Bool)

(declare-fun Unit!356 () Unit!346)

(assert (=> b!17104 (= e!10627 Unit!356)))

(declare-fun lt!4412 () Unit!346)

(assert (=> b!17104 (= lt!4412 call!570)))

(assert (=> b!17104 (= lt!4419 call!569)))

(assert (=> b!17104 (= c!1702 ((_ is MissingZero!43) lt!4419))))

(declare-fun e!10623 () Bool)

(assert (=> b!17104 e!10623))

(declare-fun lt!4426 () Unit!346)

(assert (=> b!17104 (= lt!4426 lt!4412)))

(assert (=> b!17104 false))

(declare-fun b!17105 () Bool)

(assert (=> b!17105 (= e!10634 (not call!577))))

(declare-fun b!17106 () Bool)

(declare-fun c!1697 () Bool)

(assert (=> b!17106 (= c!1697 ((_ is MissingVacant!43) lt!4419))))

(assert (=> b!17106 (= e!10623 e!10624)))

(declare-fun b!17107 () Bool)

(declare-fun lt!4428 () Unit!346)

(declare-fun lt!4422 () Unit!346)

(assert (=> b!17107 (= lt!4428 lt!4422)))

(assert (=> b!17107 (= call!589 call!575)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!1 (array!881 array!879 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!955 V!955 V!955 Int) Unit!346)

(assert (=> b!17107 (= lt!4422 (lemmaChangeZeroKeyThenAddPairToListMap!1 (_keys!3052 (ite c!1627 (_2!350 lt!4166) call!469)) (_values!1625 (ite c!1627 (_2!350 lt!4166) call!469)) (mask!4537 (ite c!1627 (_2!350 lt!4166) call!469)) (extraKeys!1541 (ite c!1627 (_2!350 lt!4166) call!469)) lt!4421 (zeroValue!1564 (ite c!1627 (_2!350 lt!4166) call!469)) (ite c!1627 (minValue!1564 (v!1400 (underlying!28 thiss!848))) (ite c!1625 (zeroValue!1564 (v!1400 (underlying!28 thiss!848))) (minValue!1564 (v!1400 (underlying!28 thiss!848))))) (minValue!1564 (ite c!1627 (_2!350 lt!4166) call!469)) (defaultEntry!1627 (ite c!1627 (_2!350 lt!4166) call!469))))))

(assert (=> b!17107 (= lt!4421 (bvor (extraKeys!1541 (ite c!1627 (_2!350 lt!4166) call!469)) #b00000000000000000000000000000001))))

(assert (=> b!17107 (= e!10629 (tuple2!701 true (LongMapFixedSize!35 (defaultEntry!1627 (ite c!1627 (_2!350 lt!4166) call!469)) (mask!4537 (ite c!1627 (_2!350 lt!4166) call!469)) (bvor (extraKeys!1541 (ite c!1627 (_2!350 lt!4166) call!469)) #b00000000000000000000000000000001) (ite c!1627 (minValue!1564 (v!1400 (underlying!28 thiss!848))) (ite c!1625 (zeroValue!1564 (v!1400 (underlying!28 thiss!848))) (minValue!1564 (v!1400 (underlying!28 thiss!848))))) (minValue!1564 (ite c!1627 (_2!350 lt!4166) call!469)) (_size!48 (ite c!1627 (_2!350 lt!4166) call!469)) (_keys!3052 (ite c!1627 (_2!350 lt!4166) call!469)) (_values!1625 (ite c!1627 (_2!350 lt!4166) call!469)) (_vacant!48 (ite c!1627 (_2!350 lt!4166) call!469)))))))

(declare-fun b!17108 () Bool)

(declare-fun res!12465 () Bool)

(assert (=> b!17108 (=> (not res!12465) (not e!10637))))

(assert (=> b!17108 (= res!12465 call!586)))

(assert (=> b!17108 (= e!10623 e!10637)))

(declare-fun b!17109 () Bool)

(assert (=> b!17109 (= e!10624 e!10622)))

(declare-fun res!12464 () Bool)

(assert (=> b!17109 (= res!12464 call!586)))

(assert (=> b!17109 (=> (not res!12464) (not e!10622))))

(declare-fun bm!582 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!1 (array!881 array!879 (_ BitVec 32) (_ BitVec 32) V!955 V!955 (_ BitVec 64) Int) Unit!346)

(assert (=> bm!582 (= call!570 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!1 (_keys!3052 (ite c!1627 (_2!350 lt!4166) call!469)) (_values!1625 (ite c!1627 (_2!350 lt!4166) call!469)) (mask!4537 (ite c!1627 (_2!350 lt!4166) call!469)) (extraKeys!1541 (ite c!1627 (_2!350 lt!4166) call!469)) (zeroValue!1564 (ite c!1627 (_2!350 lt!4166) call!469)) (minValue!1564 (ite c!1627 (_2!350 lt!4166) call!469)) (ite c!1627 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1625 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1627 (ite c!1627 (_2!350 lt!4166) call!469))))))

(declare-fun bm!583 () Bool)

(assert (=> bm!583 (= call!587 call!574)))

(declare-fun bm!584 () Bool)

(assert (=> bm!584 (= call!568 call!581)))

(declare-fun b!17110 () Bool)

(assert (=> b!17110 (= e!10632 e!10629)))

(assert (=> b!17110 (= c!1699 (= (ite c!1627 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1625 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!585 () Bool)

(assert (=> bm!585 (= call!585 (map!327 (ite c!1696 (ite c!1627 (_2!350 lt!4166) call!469) (_2!350 lt!4420))))))

(declare-fun bm!586 () Bool)

(assert (=> bm!586 (= call!581 call!578)))

(declare-fun bm!587 () Bool)

(assert (=> bm!587 (= call!584 call!582)))

(declare-fun b!17111 () Bool)

(declare-fun lt!4430 () Unit!346)

(assert (=> b!17111 (= e!10627 lt!4430)))

(assert (=> b!17111 (= lt!4430 call!573)))

(assert (=> b!17111 (= lt!4435 call!569)))

(declare-fun res!12468 () Bool)

(assert (=> b!17111 (= res!12468 ((_ is Found!43) lt!4435))))

(assert (=> b!17111 (=> (not res!12468) (not e!10635))))

(assert (=> b!17111 e!10635))

(assert (= (and d!3357 c!1700) b!17110))

(assert (= (and d!3357 (not c!1700)) b!17075))

(assert (= (and b!17110 c!1699) b!17107))

(assert (= (and b!17110 (not c!1699)) b!17087))

(assert (= (or b!17107 b!17087) bm!570))

(assert (= (or b!17107 b!17087) bm!583))

(assert (= (or b!17107 b!17087) bm!564))

(assert (= (and b!17075 c!1698) b!17077))

(assert (= (and b!17075 (not c!1698)) b!17079))

(assert (= (and b!17077 c!1695) b!17074))

(assert (= (and b!17077 (not c!1695)) b!17097))

(assert (= (and b!17074 res!12469) b!17085))

(assert (= (and b!17085 res!12472) b!17100))

(assert (= (and b!17097 c!1694) b!17103))

(assert (= (and b!17097 (not c!1694)) b!17102))

(assert (= (and b!17103 res!12470) b!17088))

(assert (= (and b!17088 res!12466) b!17091))

(assert (= (and b!17102 c!1701) b!17098))

(assert (= (and b!17102 (not c!1701)) b!17096))

(assert (= (and b!17098 res!12471) b!17083))

(assert (= (and b!17083 res!12462) b!17105))

(assert (= (or b!17103 b!17098) bm!584))

(assert (= (or b!17091 b!17105) bm!566))

(assert (= (or b!17085 bm!584) bm!586))

(assert (= (or b!17074 b!17097) bm!578))

(assert (= (and b!17079 c!1693) b!17081))

(assert (= (and b!17079 (not c!1693)) b!17090))

(assert (= (and b!17090 c!1703) b!17094))

(assert (= (and b!17090 (not c!1703)) b!17093))

(assert (= (and b!17093 c!1692) b!17111))

(assert (= (and b!17093 (not c!1692)) b!17104))

(assert (= (and b!17111 res!12468) b!17084))

(assert (= (and b!17084 res!12463) b!17101))

(assert (= (and b!17104 c!1702) b!17108))

(assert (= (and b!17104 (not c!1702)) b!17106))

(assert (= (and b!17108 res!12465) b!17082))

(assert (= (and b!17082 res!12467) b!17089))

(assert (= (and b!17106 c!1697) b!17109))

(assert (= (and b!17106 (not c!1697)) b!17095))

(assert (= (and b!17109 res!12464) b!17086))

(assert (= (and b!17086 res!12474) b!17099))

(assert (= (or b!17108 b!17109) bm!573))

(assert (= (or b!17089 b!17099) bm!587))

(assert (= (or b!17084 bm!573) bm!574))

(assert (= (or b!17111 b!17104) bm!568))

(assert (= (or b!17081 b!17094) bm!571))

(assert (= (or bm!586 bm!574) bm!580))

(assert (= (or b!17077 b!17093) bm!569))

(assert (= (or bm!578 bm!568) bm!577))

(assert (= (or b!17074 b!17111) bm!572))

(assert (= (or b!17097 b!17104) bm!582))

(assert (= (or bm!566 bm!587) bm!581))

(assert (= (or b!17077 b!17093) bm!579))

(assert (= (or bm!564 b!17093) bm!576))

(assert (= (or bm!570 bm!569) bm!565))

(assert (= (or bm!583 b!17093) bm!575))

(assert (= (and d!3357 res!12461) b!17076))

(assert (= (and b!17076 c!1696) b!17080))

(assert (= (and b!17076 (not c!1696)) b!17078))

(assert (= (and b!17080 res!12473) b!17092))

(assert (= (or b!17080 b!17092 b!17078) bm!567))

(assert (= (or b!17092 b!17078) bm!585))

(declare-fun m!11981 () Bool)

(assert (=> bm!565 m!11981))

(declare-fun m!11983 () Bool)

(assert (=> bm!580 m!11983))

(declare-fun m!11985 () Bool)

(assert (=> bm!567 m!11985))

(declare-fun m!11987 () Bool)

(assert (=> b!17101 m!11987))

(declare-fun m!11989 () Bool)

(assert (=> bm!581 m!11989))

(declare-fun m!11991 () Bool)

(assert (=> bm!576 m!11991))

(declare-fun m!11993 () Bool)

(assert (=> bm!571 m!11993))

(declare-fun m!11995 () Bool)

(assert (=> d!3357 m!11995))

(declare-fun m!11997 () Bool)

(assert (=> d!3357 m!11997))

(declare-fun m!11999 () Bool)

(assert (=> bm!579 m!11999))

(declare-fun m!12001 () Bool)

(assert (=> b!17107 m!12001))

(declare-fun m!12003 () Bool)

(assert (=> b!17100 m!12003))

(declare-fun m!12005 () Bool)

(assert (=> b!17086 m!12005))

(declare-fun m!12007 () Bool)

(assert (=> bm!585 m!12007))

(declare-fun m!12009 () Bool)

(assert (=> b!17075 m!12009))

(declare-fun m!12011 () Bool)

(assert (=> bm!575 m!12011))

(declare-fun m!12013 () Bool)

(assert (=> b!17092 m!12013))

(declare-fun m!12015 () Bool)

(assert (=> b!17080 m!12015))

(declare-fun m!12017 () Bool)

(assert (=> bm!572 m!12017))

(declare-fun m!12019 () Bool)

(assert (=> b!17082 m!12019))

(declare-fun m!12021 () Bool)

(assert (=> b!17093 m!12021))

(declare-fun m!12023 () Bool)

(assert (=> b!17093 m!12023))

(declare-fun m!12025 () Bool)

(assert (=> b!17093 m!12025))

(assert (=> b!17093 m!12025))

(declare-fun m!12027 () Bool)

(assert (=> b!17093 m!12027))

(declare-fun m!12029 () Bool)

(assert (=> b!17093 m!12029))

(declare-fun m!12031 () Bool)

(assert (=> b!17093 m!12031))

(declare-fun m!12033 () Bool)

(assert (=> b!17087 m!12033))

(assert (=> bm!577 m!12009))

(declare-fun m!12035 () Bool)

(assert (=> b!17083 m!12035))

(declare-fun m!12037 () Bool)

(assert (=> b!17088 m!12037))

(declare-fun m!12039 () Bool)

(assert (=> bm!582 m!12039))

(assert (=> bm!466 d!3357))

(declare-fun b!17112 () Bool)

(declare-fun e!10646 () Unit!346)

(declare-fun Unit!357 () Unit!346)

(assert (=> b!17112 (= e!10646 Unit!357)))

(declare-fun lt!4464 () Unit!346)

(declare-fun call!597 () Unit!346)

(assert (=> b!17112 (= lt!4464 call!597)))

(declare-fun lt!4458 () SeekEntryResult!43)

(declare-fun call!595 () SeekEntryResult!43)

(assert (=> b!17112 (= lt!4458 call!595)))

(declare-fun res!12483 () Bool)

(assert (=> b!17112 (= res!12483 ((_ is Found!43) lt!4458))))

(declare-fun e!10648 () Bool)

(assert (=> b!17112 (=> (not res!12483) (not e!10648))))

(assert (=> b!17112 e!10648))

(declare-fun lt!4444 () Unit!346)

(assert (=> b!17112 (= lt!4444 lt!4464)))

(assert (=> b!17112 false))

(declare-fun b!17113 () Bool)

(declare-fun e!10652 () tuple2!700)

(declare-fun e!10656 () tuple2!700)

(assert (=> b!17113 (= e!10652 e!10656)))

(declare-fun lt!4451 () SeekEntryResult!43)

(assert (=> b!17113 (= lt!4451 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3052 call!470) (mask!4537 call!470)))))

(declare-fun c!1710 () Bool)

(assert (=> b!17113 (= c!1710 ((_ is Undefined!43) lt!4451))))

(declare-fun b!17114 () Bool)

(declare-fun e!10650 () Bool)

(declare-fun e!10641 () Bool)

(assert (=> b!17114 (= e!10650 e!10641)))

(declare-fun c!1708 () Bool)

(declare-fun lt!4447 () tuple2!700)

(assert (=> b!17114 (= c!1708 (_1!350 lt!4447))))

(declare-fun bm!588 () Bool)

(declare-fun call!613 () ListLongMap!521)

(declare-fun call!591 () ListLongMap!521)

(assert (=> bm!588 (= call!613 call!591)))

(declare-fun b!17115 () Bool)

(declare-fun lt!4442 () Unit!346)

(assert (=> b!17115 (= lt!4442 e!10646)))

(declare-fun c!1707 () Bool)

(declare-fun call!612 () Bool)

(assert (=> b!17115 (= c!1707 call!612)))

(assert (=> b!17115 (= e!10656 (tuple2!701 false call!470))))

(declare-fun b!17116 () Bool)

(declare-fun call!609 () ListLongMap!521)

(declare-fun call!607 () ListLongMap!521)

(assert (=> b!17116 (= e!10641 (= call!609 call!607))))

(declare-fun b!17117 () Bool)

(declare-fun c!1705 () Bool)

(assert (=> b!17117 (= c!1705 ((_ is MissingVacant!43) lt!4451))))

(declare-fun e!10651 () tuple2!700)

(assert (=> b!17117 (= e!10656 e!10651)))

(declare-fun b!17118 () Bool)

(declare-fun e!10659 () Bool)

(assert (=> b!17118 (= e!10641 e!10659)))

(declare-fun res!12487 () Bool)

(assert (=> b!17118 (= res!12487 (contains!207 call!607 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!17118 (=> (not res!12487) (not e!10659))))

(declare-fun lt!4456 () (_ BitVec 32))

(declare-fun lt!4448 () (_ BitVec 32))

(declare-fun c!1712 () Bool)

(declare-fun c!1711 () Bool)

(declare-fun bm!589 () Bool)

(declare-fun call!614 () ListLongMap!521)

(assert (=> bm!589 (= call!614 (getCurrentListMap!118 (_keys!3052 call!470) (_values!1625 call!470) (mask!4537 call!470) (ite c!1712 (ite c!1711 lt!4448 lt!4456) (extraKeys!1541 call!470)) (ite (and c!1712 c!1711) (zeroValue!1564 (v!1400 (underlying!28 thiss!848))) (zeroValue!1564 call!470)) (ite c!1712 (ite c!1711 (minValue!1564 call!470) (zeroValue!1564 (v!1400 (underlying!28 thiss!848)))) (minValue!1564 call!470)) #b00000000000000000000000000000000 (defaultEntry!1627 call!470)))))

(declare-fun bm!590 () Bool)

(declare-fun call!601 () Bool)

(declare-fun call!606 () Bool)

(assert (=> bm!590 (= call!601 call!606)))

(declare-fun bm!591 () Bool)

(assert (=> bm!591 (= call!607 (map!327 (ite c!1708 (_2!350 lt!4447) call!470)))))

(declare-fun b!17119 () Bool)

(declare-fun lt!4460 () tuple2!700)

(assert (=> b!17119 (= e!10651 (tuple2!701 (_1!350 lt!4460) (_2!350 lt!4460)))))

(declare-fun call!604 () tuple2!700)

(assert (=> b!17119 (= lt!4460 call!604)))

(declare-fun d!3359 () Bool)

(assert (=> d!3359 e!10650))

(declare-fun res!12475 () Bool)

(assert (=> d!3359 (=> (not res!12475) (not e!10650))))

(assert (=> d!3359 (= res!12475 (valid!25 (_2!350 lt!4447)))))

(assert (=> d!3359 (= lt!4447 e!10652)))

(assert (=> d!3359 (= c!1712 (= #b0000000000000000000000000000000000000000000000000000000000000000 (bvneg #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3359 (valid!25 call!470)))

(assert (=> d!3359 (= (update!2 call!470 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1564 (v!1400 (underlying!28 thiss!848)))) lt!4447)))

(declare-fun bm!592 () Bool)

(declare-fun call!593 () SeekEntryResult!43)

(declare-fun call!596 () SeekEntryResult!43)

(assert (=> bm!592 (= call!593 call!596)))

(declare-fun bm!593 () Bool)

(declare-fun call!600 () ListLongMap!521)

(assert (=> bm!593 (= call!600 call!614)))

(declare-fun b!17120 () Bool)

(declare-fun res!12481 () Bool)

(declare-fun e!10657 () Bool)

(assert (=> b!17120 (=> (not res!12481) (not e!10657))))

(declare-fun lt!4446 () SeekEntryResult!43)

(assert (=> b!17120 (= res!12481 (= (select (arr!423 (_keys!3052 call!470)) (index!2291 lt!4446)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!594 () Bool)

(declare-fun call!599 () ListLongMap!521)

(assert (=> bm!594 (= call!599 call!614)))

(declare-fun bm!595 () Bool)

(assert (=> bm!595 (= call!604 (updateHelperNewKey!1 call!470 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1564 (v!1400 (underlying!28 thiss!848))) (ite c!1705 (index!2294 lt!4451) (index!2291 lt!4451))))))

(declare-fun bm!596 () Bool)

(assert (=> bm!596 (= call!597 (lemmaInListMapThenSeekEntryOrOpenFindsIt!1 (_keys!3052 call!470) (_values!1625 call!470) (mask!4537 call!470) (extraKeys!1541 call!470) (zeroValue!1564 call!470) (minValue!1564 call!470) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1627 call!470)))))

(declare-fun b!17121 () Bool)

(declare-fun res!12476 () Bool)

(declare-fun lt!4438 () SeekEntryResult!43)

(assert (=> b!17121 (= res!12476 (= (select (arr!423 (_keys!3052 call!470)) (index!2294 lt!4438)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!10654 () Bool)

(assert (=> b!17121 (=> (not res!12476) (not e!10654))))

(declare-fun b!17122 () Bool)

(declare-fun res!12477 () Bool)

(declare-fun call!603 () Bool)

(assert (=> b!17122 (= res!12477 call!603)))

(declare-fun e!10655 () Bool)

(assert (=> b!17122 (=> (not res!12477) (not e!10655))))

(declare-fun b!17123 () Bool)

(declare-fun res!12486 () Bool)

(declare-fun call!605 () Bool)

(assert (=> b!17123 (= res!12486 call!605)))

(assert (=> b!17123 (=> (not res!12486) (not e!10648))))

(declare-fun b!17124 () Bool)

(declare-fun res!12488 () Bool)

(assert (=> b!17124 (= res!12488 (= (select (arr!423 (_keys!3052 call!470)) (index!2294 lt!4446)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!10642 () Bool)

(assert (=> b!17124 (=> (not res!12488) (not e!10642))))

(declare-fun b!17125 () Bool)

(declare-fun lt!4452 () Unit!346)

(declare-fun lt!4450 () Unit!346)

(assert (=> b!17125 (= lt!4452 lt!4450)))

(assert (=> b!17125 (= call!613 call!599)))

(assert (=> b!17125 (= lt!4450 (lemmaChangeLongMinValueKeyThenAddPairToListMap!1 (_keys!3052 call!470) (_values!1625 call!470) (mask!4537 call!470) (extraKeys!1541 call!470) lt!4456 (zeroValue!1564 call!470) (minValue!1564 call!470) (zeroValue!1564 (v!1400 (underlying!28 thiss!848))) (defaultEntry!1627 call!470)))))

(assert (=> b!17125 (= lt!4456 (bvor (extraKeys!1541 call!470) #b00000000000000000000000000000010))))

(declare-fun e!10649 () tuple2!700)

(assert (=> b!17125 (= e!10649 (tuple2!701 true (LongMapFixedSize!35 (defaultEntry!1627 call!470) (mask!4537 call!470) (bvor (extraKeys!1541 call!470) #b00000000000000000000000000000010) (zeroValue!1564 call!470) (zeroValue!1564 (v!1400 (underlying!28 thiss!848))) (_size!48 call!470) (_keys!3052 call!470) (_values!1625 call!470) (_vacant!48 call!470))))))

(declare-fun bm!597 () Bool)

(declare-fun call!610 () Bool)

(assert (=> bm!597 (= call!610 call!603)))

(declare-fun bm!598 () Bool)

(declare-fun call!602 () Bool)

(assert (=> bm!598 (= call!603 call!602)))

(declare-fun b!17126 () Bool)

(declare-fun res!12480 () Bool)

(declare-fun e!10645 () Bool)

(assert (=> b!17126 (=> (not res!12480) (not e!10645))))

(assert (=> b!17126 (= res!12480 (= (select (arr!423 (_keys!3052 call!470)) (index!2291 lt!4438)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!17127 () Bool)

(declare-fun call!608 () Bool)

(assert (=> b!17127 (= e!10657 (not call!608))))

(declare-fun b!17128 () Bool)

(declare-fun e!10660 () tuple2!700)

(assert (=> b!17128 (= e!10651 e!10660)))

(declare-fun c!1715 () Bool)

(assert (=> b!17128 (= c!1715 ((_ is MissingZero!43) lt!4451))))

(declare-fun b!17129 () Bool)

(assert (=> b!17129 (= e!10645 (not call!601))))

(declare-fun b!17130 () Bool)

(assert (=> b!17130 (= e!10659 (= call!607 (+!34 call!609 (tuple2!699 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1564 (v!1400 (underlying!28 thiss!848)))))))))

(declare-fun lt!4441 () array!879)

(declare-fun bm!599 () Bool)

(declare-fun call!598 () ListLongMap!521)

(assert (=> bm!599 (= call!598 (getCurrentListMap!118 (_keys!3052 call!470) (ite c!1712 (_values!1625 call!470) lt!4441) (mask!4537 call!470) (extraKeys!1541 call!470) (zeroValue!1564 call!470) (minValue!1564 call!470) #b00000000000000000000000000000000 (defaultEntry!1627 call!470)))))

(declare-fun call!611 () ListLongMap!521)

(declare-fun bm!600 () Bool)

(assert (=> bm!600 (= call!591 (+!34 (ite c!1712 call!611 call!600) (ite c!1712 (ite c!1711 (tuple2!699 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1564 (v!1400 (underlying!28 thiss!848)))) (tuple2!699 #b1000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1564 (v!1400 (underlying!28 thiss!848))))) (tuple2!699 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1564 (v!1400 (underlying!28 thiss!848)))))))))

(declare-fun bm!601 () Bool)

(assert (=> bm!601 (= call!596 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3052 call!470) (mask!4537 call!470)))))

(declare-fun b!17131 () Bool)

(declare-fun lt!4440 () Unit!346)

(declare-fun lt!4454 () Unit!346)

(assert (=> b!17131 (= lt!4440 lt!4454)))

(assert (=> b!17131 (contains!207 call!598 (select (arr!423 (_keys!3052 call!470)) (index!2292 lt!4451)))))

(assert (=> b!17131 (= lt!4454 (lemmaValidKeyInArrayIsInListMap!1 (_keys!3052 call!470) lt!4441 (mask!4537 call!470) (extraKeys!1541 call!470) (zeroValue!1564 call!470) (minValue!1564 call!470) (index!2292 lt!4451) (defaultEntry!1627 call!470)))))

(assert (=> b!17131 (= lt!4441 (array!880 (store (arr!422 (_values!1625 call!470)) (index!2292 lt!4451) (ValueCellFull!224 (zeroValue!1564 (v!1400 (underlying!28 thiss!848))))) (size!511 (_values!1625 call!470))))))

(declare-fun lt!4459 () Unit!346)

(declare-fun lt!4445 () Unit!346)

(assert (=> b!17131 (= lt!4459 lt!4445)))

(assert (=> b!17131 (= call!591 (getCurrentListMap!118 (_keys!3052 call!470) (array!880 (store (arr!422 (_values!1625 call!470)) (index!2292 lt!4451) (ValueCellFull!224 (zeroValue!1564 (v!1400 (underlying!28 thiss!848))))) (size!511 (_values!1625 call!470))) (mask!4537 call!470) (extraKeys!1541 call!470) (zeroValue!1564 call!470) (minValue!1564 call!470) #b00000000000000000000000000000000 (defaultEntry!1627 call!470)))))

(assert (=> b!17131 (= lt!4445 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!1 (_keys!3052 call!470) (_values!1625 call!470) (mask!4537 call!470) (extraKeys!1541 call!470) (zeroValue!1564 call!470) (minValue!1564 call!470) (index!2292 lt!4451) #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1564 (v!1400 (underlying!28 thiss!848))) (defaultEntry!1627 call!470)))))

(declare-fun lt!4463 () Unit!346)

(declare-fun e!10647 () Unit!346)

(assert (=> b!17131 (= lt!4463 e!10647)))

(declare-fun c!1704 () Bool)

(assert (=> b!17131 (= c!1704 call!612)))

(assert (=> b!17131 (= e!10660 (tuple2!701 true (LongMapFixedSize!35 (defaultEntry!1627 call!470) (mask!4537 call!470) (extraKeys!1541 call!470) (zeroValue!1564 call!470) (minValue!1564 call!470) (_size!48 call!470) (_keys!3052 call!470) (array!880 (store (arr!422 (_values!1625 call!470)) (index!2292 lt!4451) (ValueCellFull!224 (zeroValue!1564 (v!1400 (underlying!28 thiss!848))))) (size!511 (_values!1625 call!470))) (_vacant!48 call!470))))))

(declare-fun b!17132 () Bool)

(declare-fun lt!4461 () tuple2!700)

(assert (=> b!17132 (= lt!4461 call!604)))

(assert (=> b!17132 (= e!10660 (tuple2!701 (_1!350 lt!4461) (_2!350 lt!4461)))))

(declare-fun bm!602 () Bool)

(assert (=> bm!602 (= call!595 call!596)))

(declare-fun bm!603 () Bool)

(assert (=> bm!603 (= call!612 (contains!207 call!600 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!1714 () Bool)

(declare-fun c!1706 () Bool)

(declare-fun lt!4462 () SeekEntryResult!43)

(declare-fun bm!604 () Bool)

(assert (=> bm!604 (= call!602 (inRange!0 (ite c!1710 (ite c!1707 (index!2292 lt!4458) (ite c!1706 (index!2291 lt!4438) (index!2294 lt!4438))) (ite c!1704 (index!2292 lt!4462) (ite c!1714 (index!2291 lt!4446) (index!2294 lt!4446)))) (mask!4537 call!470)))))

(declare-fun b!17133 () Bool)

(declare-fun e!10644 () Bool)

(assert (=> b!17133 (= e!10644 ((_ is Undefined!43) lt!4446))))

(declare-fun b!17134 () Bool)

(declare-fun e!10658 () Bool)

(assert (=> b!17134 (= e!10658 ((_ is Undefined!43) lt!4438))))

(declare-fun b!17135 () Bool)

(declare-fun lt!4443 () Unit!346)

(assert (=> b!17135 (= e!10646 lt!4443)))

(declare-fun call!594 () Unit!346)

(assert (=> b!17135 (= lt!4443 call!594)))

(assert (=> b!17135 (= lt!4438 call!595)))

(assert (=> b!17135 (= c!1706 ((_ is MissingZero!43) lt!4438))))

(declare-fun e!10653 () Bool)

(assert (=> b!17135 e!10653))

(declare-fun b!17136 () Bool)

(assert (=> b!17136 (= e!10658 e!10654)))

(declare-fun res!12485 () Bool)

(declare-fun call!592 () Bool)

(assert (=> b!17136 (= res!12485 call!592)))

(assert (=> b!17136 (=> (not res!12485) (not e!10654))))

(declare-fun b!17137 () Bool)

(assert (=> b!17137 (= e!10642 (not call!608))))

(declare-fun b!17138 () Bool)

(assert (=> b!17138 (= e!10648 (= (select (arr!423 (_keys!3052 call!470)) (index!2292 lt!4458)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!17139 () Bool)

(assert (=> b!17139 (= e!10655 (= (select (arr!423 (_keys!3052 call!470)) (index!2292 lt!4462)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!17140 () Bool)

(declare-fun c!1713 () Bool)

(assert (=> b!17140 (= c!1713 ((_ is MissingVacant!43) lt!4438))))

(assert (=> b!17140 (= e!10653 e!10658)))

(declare-fun b!17141 () Bool)

(declare-fun res!12484 () Bool)

(assert (=> b!17141 (=> (not res!12484) (not e!10645))))

(assert (=> b!17141 (= res!12484 call!592)))

(assert (=> b!17141 (= e!10653 e!10645)))

(declare-fun bm!605 () Bool)

(assert (=> bm!605 (= call!606 (arrayContainsKey!0 (_keys!3052 call!470) #b0000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000))))

(declare-fun b!17142 () Bool)

(declare-fun Unit!358 () Unit!346)

(assert (=> b!17142 (= e!10647 Unit!358)))

(declare-fun lt!4439 () Unit!346)

(assert (=> b!17142 (= lt!4439 call!594)))

(assert (=> b!17142 (= lt!4446 call!593)))

(assert (=> b!17142 (= c!1714 ((_ is MissingZero!43) lt!4446))))

(declare-fun e!10643 () Bool)

(assert (=> b!17142 e!10643))

(declare-fun lt!4453 () Unit!346)

(assert (=> b!17142 (= lt!4453 lt!4439)))

(assert (=> b!17142 false))

(declare-fun b!17143 () Bool)

(assert (=> b!17143 (= e!10654 (not call!601))))

(declare-fun b!17144 () Bool)

(declare-fun c!1709 () Bool)

(assert (=> b!17144 (= c!1709 ((_ is MissingVacant!43) lt!4446))))

(assert (=> b!17144 (= e!10643 e!10644)))

(declare-fun b!17145 () Bool)

(declare-fun lt!4455 () Unit!346)

(declare-fun lt!4449 () Unit!346)

(assert (=> b!17145 (= lt!4455 lt!4449)))

(assert (=> b!17145 (= call!613 call!599)))

(assert (=> b!17145 (= lt!4449 (lemmaChangeZeroKeyThenAddPairToListMap!1 (_keys!3052 call!470) (_values!1625 call!470) (mask!4537 call!470) (extraKeys!1541 call!470) lt!4448 (zeroValue!1564 call!470) (zeroValue!1564 (v!1400 (underlying!28 thiss!848))) (minValue!1564 call!470) (defaultEntry!1627 call!470)))))

(assert (=> b!17145 (= lt!4448 (bvor (extraKeys!1541 call!470) #b00000000000000000000000000000001))))

(assert (=> b!17145 (= e!10649 (tuple2!701 true (LongMapFixedSize!35 (defaultEntry!1627 call!470) (mask!4537 call!470) (bvor (extraKeys!1541 call!470) #b00000000000000000000000000000001) (zeroValue!1564 (v!1400 (underlying!28 thiss!848))) (minValue!1564 call!470) (_size!48 call!470) (_keys!3052 call!470) (_values!1625 call!470) (_vacant!48 call!470))))))

(declare-fun b!17146 () Bool)

(declare-fun res!12479 () Bool)

(assert (=> b!17146 (=> (not res!12479) (not e!10657))))

(assert (=> b!17146 (= res!12479 call!610)))

(assert (=> b!17146 (= e!10643 e!10657)))

(declare-fun b!17147 () Bool)

(assert (=> b!17147 (= e!10644 e!10642)))

(declare-fun res!12478 () Bool)

(assert (=> b!17147 (= res!12478 call!610)))

(assert (=> b!17147 (=> (not res!12478) (not e!10642))))

(declare-fun bm!606 () Bool)

(assert (=> bm!606 (= call!594 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!1 (_keys!3052 call!470) (_values!1625 call!470) (mask!4537 call!470) (extraKeys!1541 call!470) (zeroValue!1564 call!470) (minValue!1564 call!470) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1627 call!470)))))

(declare-fun bm!607 () Bool)

(assert (=> bm!607 (= call!611 call!598)))

(declare-fun bm!608 () Bool)

(assert (=> bm!608 (= call!592 call!605)))

(declare-fun b!17148 () Bool)

(assert (=> b!17148 (= e!10652 e!10649)))

(assert (=> b!17148 (= c!1711 (= #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!609 () Bool)

(assert (=> bm!609 (= call!609 (map!327 (ite c!1708 call!470 (_2!350 lt!4447))))))

(declare-fun bm!610 () Bool)

(assert (=> bm!610 (= call!605 call!602)))

(declare-fun bm!611 () Bool)

(assert (=> bm!611 (= call!608 call!606)))

(declare-fun b!17149 () Bool)

(declare-fun lt!4457 () Unit!346)

(assert (=> b!17149 (= e!10647 lt!4457)))

(assert (=> b!17149 (= lt!4457 call!597)))

(assert (=> b!17149 (= lt!4462 call!593)))

(declare-fun res!12482 () Bool)

(assert (=> b!17149 (= res!12482 ((_ is Found!43) lt!4462))))

(assert (=> b!17149 (=> (not res!12482) (not e!10655))))

(assert (=> b!17149 e!10655))

(assert (= (and d!3359 c!1712) b!17148))

(assert (= (and d!3359 (not c!1712)) b!17113))

(assert (= (and b!17148 c!1711) b!17145))

(assert (= (and b!17148 (not c!1711)) b!17125))

(assert (= (or b!17145 b!17125) bm!594))

(assert (= (or b!17145 b!17125) bm!607))

(assert (= (or b!17145 b!17125) bm!588))

(assert (= (and b!17113 c!1710) b!17115))

(assert (= (and b!17113 (not c!1710)) b!17117))

(assert (= (and b!17115 c!1707) b!17112))

(assert (= (and b!17115 (not c!1707)) b!17135))

(assert (= (and b!17112 res!12483) b!17123))

(assert (= (and b!17123 res!12486) b!17138))

(assert (= (and b!17135 c!1706) b!17141))

(assert (= (and b!17135 (not c!1706)) b!17140))

(assert (= (and b!17141 res!12484) b!17126))

(assert (= (and b!17126 res!12480) b!17129))

(assert (= (and b!17140 c!1713) b!17136))

(assert (= (and b!17140 (not c!1713)) b!17134))

(assert (= (and b!17136 res!12485) b!17121))

(assert (= (and b!17121 res!12476) b!17143))

(assert (= (or b!17141 b!17136) bm!608))

(assert (= (or b!17129 b!17143) bm!590))

(assert (= (or b!17123 bm!608) bm!610))

(assert (= (or b!17112 b!17135) bm!602))

(assert (= (and b!17117 c!1705) b!17119))

(assert (= (and b!17117 (not c!1705)) b!17128))

(assert (= (and b!17128 c!1715) b!17132))

(assert (= (and b!17128 (not c!1715)) b!17131))

(assert (= (and b!17131 c!1704) b!17149))

(assert (= (and b!17131 (not c!1704)) b!17142))

(assert (= (and b!17149 res!12482) b!17122))

(assert (= (and b!17122 res!12477) b!17139))

(assert (= (and b!17142 c!1714) b!17146))

(assert (= (and b!17142 (not c!1714)) b!17144))

(assert (= (and b!17146 res!12479) b!17120))

(assert (= (and b!17120 res!12481) b!17127))

(assert (= (and b!17144 c!1709) b!17147))

(assert (= (and b!17144 (not c!1709)) b!17133))

(assert (= (and b!17147 res!12478) b!17124))

(assert (= (and b!17124 res!12488) b!17137))

(assert (= (or b!17146 b!17147) bm!597))

(assert (= (or b!17127 b!17137) bm!611))

(assert (= (or b!17122 bm!597) bm!598))

(assert (= (or b!17149 b!17142) bm!592))

(assert (= (or b!17119 b!17132) bm!595))

(assert (= (or bm!610 bm!598) bm!604))

(assert (= (or b!17115 b!17131) bm!593))

(assert (= (or bm!602 bm!592) bm!601))

(assert (= (or b!17112 b!17149) bm!596))

(assert (= (or b!17135 b!17142) bm!606))

(assert (= (or bm!590 bm!611) bm!605))

(assert (= (or b!17115 b!17131) bm!603))

(assert (= (or bm!588 b!17131) bm!600))

(assert (= (or bm!594 bm!593) bm!589))

(assert (= (or bm!607 b!17131) bm!599))

(assert (= (and d!3359 res!12475) b!17114))

(assert (= (and b!17114 c!1708) b!17118))

(assert (= (and b!17114 (not c!1708)) b!17116))

(assert (= (and b!17118 res!12487) b!17130))

(assert (= (or b!17118 b!17130 b!17116) bm!591))

(assert (= (or b!17130 b!17116) bm!609))

(declare-fun m!12041 () Bool)

(assert (=> bm!589 m!12041))

(declare-fun m!12043 () Bool)

(assert (=> bm!604 m!12043))

(declare-fun m!12045 () Bool)

(assert (=> bm!591 m!12045))

(declare-fun m!12047 () Bool)

(assert (=> b!17139 m!12047))

(declare-fun m!12049 () Bool)

(assert (=> bm!605 m!12049))

(declare-fun m!12051 () Bool)

(assert (=> bm!600 m!12051))

(declare-fun m!12053 () Bool)

(assert (=> bm!595 m!12053))

(declare-fun m!12055 () Bool)

(assert (=> d!3359 m!12055))

(declare-fun m!12057 () Bool)

(assert (=> d!3359 m!12057))

(declare-fun m!12059 () Bool)

(assert (=> bm!603 m!12059))

(declare-fun m!12061 () Bool)

(assert (=> b!17145 m!12061))

(declare-fun m!12063 () Bool)

(assert (=> b!17138 m!12063))

(declare-fun m!12065 () Bool)

(assert (=> b!17124 m!12065))

(declare-fun m!12067 () Bool)

(assert (=> bm!609 m!12067))

(declare-fun m!12069 () Bool)

(assert (=> b!17113 m!12069))

(declare-fun m!12071 () Bool)

(assert (=> bm!599 m!12071))

(declare-fun m!12073 () Bool)

(assert (=> b!17130 m!12073))

(declare-fun m!12075 () Bool)

(assert (=> b!17118 m!12075))

(declare-fun m!12077 () Bool)

(assert (=> bm!596 m!12077))

(declare-fun m!12079 () Bool)

(assert (=> b!17120 m!12079))

(declare-fun m!12081 () Bool)

(assert (=> b!17131 m!12081))

(declare-fun m!12083 () Bool)

(assert (=> b!17131 m!12083))

(declare-fun m!12085 () Bool)

(assert (=> b!17131 m!12085))

(assert (=> b!17131 m!12085))

(declare-fun m!12087 () Bool)

(assert (=> b!17131 m!12087))

(declare-fun m!12089 () Bool)

(assert (=> b!17131 m!12089))

(declare-fun m!12091 () Bool)

(assert (=> b!17131 m!12091))

(declare-fun m!12093 () Bool)

(assert (=> b!17125 m!12093))

(assert (=> bm!601 m!12069))

(declare-fun m!12095 () Bool)

(assert (=> b!17121 m!12095))

(declare-fun m!12097 () Bool)

(assert (=> b!17126 m!12097))

(declare-fun m!12099 () Bool)

(assert (=> bm!606 m!12099))

(assert (=> b!16862 d!3359))

(declare-fun b!17151 () Bool)

(declare-fun e!10662 () Bool)

(assert (=> b!17151 (= e!10662 tp_is_empty!847)))

(declare-fun mapIsEmpty!711 () Bool)

(declare-fun mapRes!711 () Bool)

(assert (=> mapIsEmpty!711 mapRes!711))

(declare-fun condMapEmpty!711 () Bool)

(declare-fun mapDefault!711 () ValueCell!224)

(assert (=> mapNonEmpty!710 (= condMapEmpty!711 (= mapRest!710 ((as const (Array (_ BitVec 32) ValueCell!224)) mapDefault!711)))))

(assert (=> mapNonEmpty!710 (= tp!2951 (and e!10662 mapRes!711))))

(declare-fun b!17150 () Bool)

(declare-fun e!10661 () Bool)

(assert (=> b!17150 (= e!10661 tp_is_empty!847)))

(declare-fun mapNonEmpty!711 () Bool)

(declare-fun tp!2952 () Bool)

(assert (=> mapNonEmpty!711 (= mapRes!711 (and tp!2952 e!10661))))

(declare-fun mapRest!711 () (Array (_ BitVec 32) ValueCell!224))

(declare-fun mapKey!711 () (_ BitVec 32))

(declare-fun mapValue!711 () ValueCell!224)

(assert (=> mapNonEmpty!711 (= mapRest!710 (store mapRest!711 mapKey!711 mapValue!711))))

(assert (= (and mapNonEmpty!710 condMapEmpty!711) mapIsEmpty!711))

(assert (= (and mapNonEmpty!710 (not condMapEmpty!711)) mapNonEmpty!711))

(assert (= (and mapNonEmpty!711 ((_ is ValueCellFull!224) mapValue!711)) b!17150))

(assert (= (and mapNonEmpty!710 ((_ is ValueCellFull!224) mapDefault!711)) b!17151))

(declare-fun m!12101 () Bool)

(assert (=> mapNonEmpty!711 m!12101))

(declare-fun b_lambda!1429 () Bool)

(assert (= b_lambda!1423 (or (and b!16768 b_free!583) b_lambda!1429)))

(declare-fun b_lambda!1431 () Bool)

(assert (= b_lambda!1427 (or (and b!16768 b_free!583) b_lambda!1431)))

(declare-fun b_lambda!1433 () Bool)

(assert (= b_lambda!1425 (or (and b!16768 b_free!583) b_lambda!1433)))

(check-sat (not b!16993) (not bm!506) (not bm!601) (not b_next!583) (not bm!609) (not b!17075) (not d!3337) (not d!3341) (not mapNonEmpty!711) (not b!17113) (not bm!497) (not b!17093) (not b_lambda!1431) (not b!17080) (not bm!494) (not b!17118) (not b!16954) (not bm!512) (not bm!571) (not bm!604) (not b!16885) (not bm!504) (not b!17145) (not b!16941) (not b!16965) (not bm!589) (not b_lambda!1433) (not bm!600) (not bm!585) (not bm!581) (not bm!498) (not bm!509) (not bm!606) (not b!16979) (not d!3347) (not bm!572) (not bm!582) (not b!16928) (not bm!591) (not d!3345) (not bm!502) (not bm!567) (not b!16888) (not d!3343) (not bm!596) (not bm!565) (not b!16982) (not bm!503) (not b!16934) (not b!16890) (not b!16953) (not bm!576) (not b!17092) (not bm!499) (not bm!501) tp_is_empty!847 b_and!1229 (not b!17125) (not bm!505) (not d!3339) (not b!17130) (not bm!496) (not b!16930) (not bm!579) (not bm!595) (not b!17131) (not b!16994) (not bm!495) (not bm!577) (not bm!599) (not b!17087) (not b!16926) (not bm!605) (not bm!580) (not bm!500) (not b!16980) (not b!16977) (not d!3353) (not bm!603) (not d!3357) (not d!3359) (not b_lambda!1429) (not bm!575) (not b!16981) (not b!17107) (not b!16997) (not b!16929) (not bm!515))
(check-sat b_and!1229 (not b_next!583))

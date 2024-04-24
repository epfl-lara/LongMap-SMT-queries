; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2942 () Bool)

(assert start!2942)

(declare-fun b!16776 () Bool)

(declare-fun b_free!583 () Bool)

(declare-fun b_next!583 () Bool)

(assert (=> b!16776 (= b_free!583 (not b_next!583))))

(declare-fun tp!2936 () Bool)

(declare-fun b_and!1219 () Bool)

(assert (=> b!16776 (= tp!2936 b_and!1219)))

(declare-fun b!16769 () Bool)

(declare-datatypes ((V!955 0))(
  ( (V!956 (val!450 Int)) )
))
(declare-datatypes ((ValueCell!224 0))(
  ( (ValueCellFull!224 (v!1400 V!955)) (EmptyCell!224) )
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
  ( (Cell!35 (v!1401 LongMapFixedSize!34)) )
))
(declare-datatypes ((LongMap!34 0))(
  ( (LongMap!35 (underlying!28 Cell!34)) )
))
(declare-datatypes ((tuple2!690 0))(
  ( (tuple2!691 (_1!345 Bool) (_2!345 LongMap!34)) )
))
(declare-fun e!10432 () tuple2!690)

(declare-fun thiss!848 () LongMap!34)

(assert (=> b!16769 (= e!10432 (tuple2!691 true thiss!848))))

(declare-fun b!16770 () Bool)

(declare-fun e!10431 () Bool)

(declare-fun e!10435 () Bool)

(assert (=> b!16770 (= e!10431 e!10435)))

(declare-fun b!16771 () Bool)

(declare-fun repack!1 (LongMap!34) tuple2!690)

(assert (=> b!16771 (= e!10432 (repack!1 thiss!848))))

(declare-fun res!12372 () Bool)

(declare-fun e!10427 () Bool)

(assert (=> start!2942 (=> (not res!12372) (not e!10427))))

(declare-fun valid!25 (LongMap!34) Bool)

(assert (=> start!2942 (= res!12372 (valid!25 thiss!848))))

(assert (=> start!2942 e!10427))

(declare-fun e!10433 () Bool)

(assert (=> start!2942 e!10433))

(declare-fun b!16772 () Bool)

(declare-fun e!10434 () Bool)

(assert (=> b!16772 (= e!10427 e!10434)))

(declare-fun res!12373 () Bool)

(assert (=> b!16772 (=> (not res!12373) (not e!10434))))

(declare-fun lt!4141 () tuple2!690)

(assert (=> b!16772 (= res!12373 (_1!345 lt!4141))))

(assert (=> b!16772 (= lt!4141 e!10432)))

(declare-fun c!1610 () Bool)

(declare-fun imbalanced!2 (LongMap!34) Bool)

(assert (=> b!16772 (= c!1610 (imbalanced!2 thiss!848))))

(declare-fun b!16773 () Bool)

(declare-fun e!10436 () Bool)

(declare-fun tp_is_empty!847 () Bool)

(assert (=> b!16773 (= e!10436 tp_is_empty!847)))

(declare-fun b!16774 () Bool)

(declare-fun e!10428 () Bool)

(declare-fun mapRes!701 () Bool)

(assert (=> b!16774 (= e!10428 (and e!10436 mapRes!701))))

(declare-fun condMapEmpty!701 () Bool)

(declare-fun mapDefault!701 () ValueCell!224)

(assert (=> b!16774 (= condMapEmpty!701 (= (arr!422 (_values!1625 (v!1401 (underlying!28 thiss!848)))) ((as const (Array (_ BitVec 32) ValueCell!224)) mapDefault!701)))))

(declare-fun b!16775 () Bool)

(declare-fun valid!26 (LongMapFixedSize!34) Bool)

(assert (=> b!16775 (= e!10434 (not (valid!26 (v!1401 (underlying!28 (_2!345 lt!4141))))))))

(declare-fun array_inv!309 (array!881) Bool)

(declare-fun array_inv!310 (array!879) Bool)

(assert (=> b!16776 (= e!10435 (and tp!2936 tp_is_empty!847 (array_inv!309 (_keys!3052 (v!1401 (underlying!28 thiss!848)))) (array_inv!310 (_values!1625 (v!1401 (underlying!28 thiss!848)))) e!10428))))

(declare-fun b!16777 () Bool)

(declare-fun e!10429 () Bool)

(assert (=> b!16777 (= e!10429 tp_is_empty!847)))

(declare-fun mapIsEmpty!701 () Bool)

(assert (=> mapIsEmpty!701 mapRes!701))

(declare-fun b!16778 () Bool)

(assert (=> b!16778 (= e!10433 e!10431)))

(declare-fun mapNonEmpty!701 () Bool)

(declare-fun tp!2935 () Bool)

(assert (=> mapNonEmpty!701 (= mapRes!701 (and tp!2935 e!10429))))

(declare-fun mapRest!701 () (Array (_ BitVec 32) ValueCell!224))

(declare-fun mapValue!701 () ValueCell!224)

(declare-fun mapKey!701 () (_ BitVec 32))

(assert (=> mapNonEmpty!701 (= (arr!422 (_values!1625 (v!1401 (underlying!28 thiss!848)))) (store mapRest!701 mapKey!701 mapValue!701))))

(assert (= (and start!2942 res!12372) b!16772))

(assert (= (and b!16772 c!1610) b!16771))

(assert (= (and b!16772 (not c!1610)) b!16769))

(assert (= (and b!16772 res!12373) b!16775))

(assert (= (and b!16774 condMapEmpty!701) mapIsEmpty!701))

(assert (= (and b!16774 (not condMapEmpty!701)) mapNonEmpty!701))

(get-info :version)

(assert (= (and mapNonEmpty!701 ((_ is ValueCellFull!224) mapValue!701)) b!16777))

(assert (= (and b!16774 ((_ is ValueCellFull!224) mapDefault!701)) b!16773))

(assert (= b!16776 b!16774))

(assert (= b!16770 b!16776))

(assert (= b!16778 b!16770))

(assert (= start!2942 b!16778))

(declare-fun m!11803 () Bool)

(assert (=> b!16776 m!11803))

(declare-fun m!11805 () Bool)

(assert (=> b!16776 m!11805))

(declare-fun m!11807 () Bool)

(assert (=> b!16771 m!11807))

(declare-fun m!11809 () Bool)

(assert (=> start!2942 m!11809))

(declare-fun m!11811 () Bool)

(assert (=> b!16775 m!11811))

(declare-fun m!11813 () Bool)

(assert (=> mapNonEmpty!701 m!11813))

(declare-fun m!11815 () Bool)

(assert (=> b!16772 m!11815))

(check-sat (not b!16775) tp_is_empty!847 (not b!16771) (not mapNonEmpty!701) (not b_next!583) b_and!1219 (not b!16772) (not b!16776) (not start!2942))
(check-sat b_and!1219 (not b_next!583))
(get-model)

(declare-fun bm!464 () Bool)

(declare-fun call!469 () LongMapFixedSize!34)

(declare-fun lt!4168 () (_ BitVec 32))

(declare-fun getNewLongMapFixedSize!7 ((_ BitVec 32) Int) LongMapFixedSize!34)

(assert (=> bm!464 (= call!469 (getNewLongMapFixedSize!7 lt!4168 (defaultEntry!1627 (v!1401 (underlying!28 thiss!848)))))))

(declare-fun bm!465 () Bool)

(declare-fun call!470 () LongMapFixedSize!34)

(assert (=> bm!465 (= call!470 call!469)))

(declare-fun c!1626 () Bool)

(declare-fun c!1625 () Bool)

(declare-datatypes ((tuple2!696 0))(
  ( (tuple2!697 (_1!348 Bool) (_2!348 LongMapFixedSize!34)) )
))
(declare-fun call!468 () tuple2!696)

(declare-fun bm!466 () Bool)

(declare-fun lt!4169 () tuple2!696)

(declare-fun update!2 (LongMapFixedSize!34 (_ BitVec 64) V!955) tuple2!696)

(assert (=> bm!466 (= call!468 (update!2 (ite c!1626 (_2!348 lt!4169) call!470) (ite c!1626 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1625 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!1626 (minValue!1564 (v!1401 (underlying!28 thiss!848))) (ite c!1625 (zeroValue!1564 (v!1401 (underlying!28 thiss!848))) (minValue!1564 (v!1401 (underlying!28 thiss!848)))))))))

(declare-fun b!16857 () Bool)

(declare-datatypes ((tuple3!0 0))(
  ( (tuple3!1 (_1!349 Bool) (_2!349 Cell!34) (_3!0 LongMap!34)) )
))
(declare-fun e!10507 () tuple3!0)

(declare-datatypes ((tuple2!698 0))(
  ( (tuple2!699 (_1!350 Bool) (_2!350 Cell!34)) )
))
(declare-fun lt!4170 () tuple2!698)

(assert (=> b!16857 (= e!10507 (tuple3!1 false (_2!350 lt!4170) thiss!848))))

(declare-fun b!16858 () Bool)

(declare-fun e!10509 () tuple2!698)

(declare-fun lt!4173 () tuple2!696)

(assert (=> b!16858 (= e!10509 (tuple2!699 (and (_1!348 lt!4169) (_1!348 lt!4173)) (Cell!35 (_2!348 lt!4173))))))

(assert (=> b!16858 (= lt!4169 (update!2 call!469 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1564 (v!1401 (underlying!28 thiss!848)))))))

(assert (=> b!16858 (= lt!4173 call!468)))

(declare-fun b!16859 () Bool)

(declare-fun e!10510 () Bool)

(declare-fun lt!4174 () tuple2!690)

(declare-datatypes ((tuple2!700 0))(
  ( (tuple2!701 (_1!351 (_ BitVec 64)) (_2!351 V!955)) )
))
(declare-datatypes ((List!528 0))(
  ( (Nil!525) (Cons!524 (h!1090 tuple2!700) (t!3159 List!528)) )
))
(declare-datatypes ((ListLongMap!521 0))(
  ( (ListLongMap!522 (toList!276 List!528)) )
))
(declare-fun map!326 (LongMap!34) ListLongMap!521)

(assert (=> b!16859 (= e!10510 (= (map!326 (_2!345 lt!4174)) (map!326 thiss!848)))))

(declare-fun b!16860 () Bool)

(declare-fun e!10508 () tuple2!698)

(declare-fun lt!4171 () Cell!34)

(assert (=> b!16860 (= e!10508 (tuple2!699 true lt!4171))))

(declare-fun b!16861 () Bool)

(declare-fun lt!4172 () tuple2!696)

(assert (=> b!16861 (= e!10508 (tuple2!699 (_1!348 lt!4172) (Cell!35 (_2!348 lt!4172))))))

(declare-fun call!467 () tuple2!696)

(assert (=> b!16861 (= lt!4172 call!467)))

(declare-fun d!3331 () Bool)

(assert (=> d!3331 e!10510))

(declare-fun res!12388 () Bool)

(assert (=> d!3331 (=> res!12388 e!10510)))

(assert (=> d!3331 (= res!12388 (= (_1!345 lt!4174) false))))

(declare-fun lt!4176 () tuple3!0)

(assert (=> d!3331 (= lt!4174 (tuple2!691 (_1!349 lt!4176) (_3!0 lt!4176)))))

(assert (=> d!3331 (= lt!4176 e!10507)))

(declare-fun c!1627 () Bool)

(assert (=> d!3331 (= c!1627 (not (_1!350 lt!4170)))))

(assert (=> d!3331 (= lt!4170 e!10509)))

(assert (=> d!3331 (= c!1626 (and (not (= (bvand (extraKeys!1541 (v!1401 (underlying!28 thiss!848))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1541 (v!1401 (underlying!28 thiss!848))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!3331 (= lt!4171 (Cell!35 (getNewLongMapFixedSize!7 lt!4168 (defaultEntry!1627 (v!1401 (underlying!28 thiss!848))))))))

(declare-fun computeNewMask!1 (LongMap!34 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!3331 (= lt!4168 (computeNewMask!1 thiss!848 (mask!4537 (v!1401 (underlying!28 thiss!848))) (_vacant!48 (v!1401 (underlying!28 thiss!848))) (_size!48 (v!1401 (underlying!28 thiss!848)))))))

(assert (=> d!3331 (valid!25 thiss!848)))

(assert (=> d!3331 (= (repack!1 thiss!848) lt!4174)))

(declare-fun b!16862 () Bool)

(declare-fun lt!4175 () tuple2!696)

(assert (=> b!16862 (= e!10507 (ite (_1!348 lt!4175) (tuple3!1 true (underlying!28 thiss!848) (LongMap!35 (Cell!35 (_2!348 lt!4175)))) (tuple3!1 false (Cell!35 (_2!348 lt!4175)) thiss!848)))))

(declare-fun repackFrom!1 (LongMap!34 LongMapFixedSize!34 (_ BitVec 32)) tuple2!696)

(assert (=> b!16862 (= lt!4175 (repackFrom!1 thiss!848 (v!1401 (_2!350 lt!4170)) (bvsub (size!512 (_keys!3052 (v!1401 (underlying!28 thiss!848)))) #b00000000000000000000000000000001)))))

(declare-fun b!16863 () Bool)

(declare-fun e!10511 () tuple2!698)

(assert (=> b!16863 (= e!10509 e!10511)))

(assert (=> b!16863 (= c!1625 (and (not (= (bvand (extraKeys!1541 (v!1401 (underlying!28 thiss!848))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1541 (v!1401 (underlying!28 thiss!848))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!16864 () Bool)

(declare-fun c!1628 () Bool)

(assert (=> b!16864 (= c!1628 (and (not (= (bvand (extraKeys!1541 (v!1401 (underlying!28 thiss!848))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1541 (v!1401 (underlying!28 thiss!848))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!16864 (= e!10511 e!10508)))

(declare-fun bm!467 () Bool)

(assert (=> bm!467 (= call!467 call!468)))

(declare-fun b!16865 () Bool)

(declare-fun lt!4177 () tuple2!696)

(assert (=> b!16865 (= lt!4177 call!467)))

(assert (=> b!16865 (= e!10511 (tuple2!699 (_1!348 lt!4177) (Cell!35 (_2!348 lt!4177))))))

(assert (= (and d!3331 c!1626) b!16858))

(assert (= (and d!3331 (not c!1626)) b!16863))

(assert (= (and b!16863 c!1625) b!16865))

(assert (= (and b!16863 (not c!1625)) b!16864))

(assert (= (and b!16864 c!1628) b!16861))

(assert (= (and b!16864 (not c!1628)) b!16860))

(assert (= (or b!16865 b!16861) bm!465))

(assert (= (or b!16865 b!16861) bm!467))

(assert (= (or b!16858 bm!467) bm!466))

(assert (= (or b!16858 bm!465) bm!464))

(assert (= (and d!3331 c!1627) b!16857))

(assert (= (and d!3331 (not c!1627)) b!16862))

(assert (= (and d!3331 (not res!12388)) b!16859))

(declare-fun m!11845 () Bool)

(assert (=> bm!466 m!11845))

(declare-fun m!11847 () Bool)

(assert (=> b!16859 m!11847))

(declare-fun m!11849 () Bool)

(assert (=> b!16859 m!11849))

(declare-fun m!11851 () Bool)

(assert (=> b!16862 m!11851))

(declare-fun m!11853 () Bool)

(assert (=> d!3331 m!11853))

(declare-fun m!11855 () Bool)

(assert (=> d!3331 m!11855))

(assert (=> d!3331 m!11809))

(declare-fun m!11857 () Bool)

(assert (=> b!16858 m!11857))

(assert (=> bm!464 m!11853))

(assert (=> b!16771 d!3331))

(declare-fun d!3333 () Bool)

(assert (=> d!3333 (= (array_inv!309 (_keys!3052 (v!1401 (underlying!28 thiss!848)))) (bvsge (size!512 (_keys!3052 (v!1401 (underlying!28 thiss!848)))) #b00000000000000000000000000000000))))

(assert (=> b!16776 d!3333))

(declare-fun d!3335 () Bool)

(assert (=> d!3335 (= (array_inv!310 (_values!1625 (v!1401 (underlying!28 thiss!848)))) (bvsge (size!511 (_values!1625 (v!1401 (underlying!28 thiss!848)))) #b00000000000000000000000000000000))))

(assert (=> b!16776 d!3335))

(declare-fun d!3337 () Bool)

(assert (=> d!3337 (= (valid!25 thiss!848) (valid!26 (v!1401 (underlying!28 thiss!848))))))

(declare-fun bs!802 () Bool)

(assert (= bs!802 d!3337))

(declare-fun m!11859 () Bool)

(assert (=> bs!802 m!11859))

(assert (=> start!2942 d!3337))

(declare-fun d!3339 () Bool)

(assert (=> d!3339 (= (imbalanced!2 thiss!848) (or (bvsgt (bvmul #b00000000000000000000000000000010 (bvadd (_size!48 (v!1401 (underlying!28 thiss!848))) (_vacant!48 (v!1401 (underlying!28 thiss!848))))) (mask!4537 (v!1401 (underlying!28 thiss!848)))) (bvsgt (_vacant!48 (v!1401 (underlying!28 thiss!848))) (_size!48 (v!1401 (underlying!28 thiss!848))))))))

(assert (=> b!16772 d!3339))

(declare-fun d!3341 () Bool)

(declare-fun res!12395 () Bool)

(declare-fun e!10514 () Bool)

(assert (=> d!3341 (=> (not res!12395) (not e!10514))))

(declare-fun simpleValid!8 (LongMapFixedSize!34) Bool)

(assert (=> d!3341 (= res!12395 (simpleValid!8 (v!1401 (underlying!28 (_2!345 lt!4141)))))))

(assert (=> d!3341 (= (valid!26 (v!1401 (underlying!28 (_2!345 lt!4141)))) e!10514)))

(declare-fun b!16872 () Bool)

(declare-fun res!12396 () Bool)

(assert (=> b!16872 (=> (not res!12396) (not e!10514))))

(declare-fun arrayCountValidKeys!0 (array!881 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!16872 (= res!12396 (= (arrayCountValidKeys!0 (_keys!3052 (v!1401 (underlying!28 (_2!345 lt!4141)))) #b00000000000000000000000000000000 (size!512 (_keys!3052 (v!1401 (underlying!28 (_2!345 lt!4141)))))) (_size!48 (v!1401 (underlying!28 (_2!345 lt!4141))))))))

(declare-fun b!16873 () Bool)

(declare-fun res!12397 () Bool)

(assert (=> b!16873 (=> (not res!12397) (not e!10514))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!881 (_ BitVec 32)) Bool)

(assert (=> b!16873 (= res!12397 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3052 (v!1401 (underlying!28 (_2!345 lt!4141)))) (mask!4537 (v!1401 (underlying!28 (_2!345 lt!4141))))))))

(declare-fun b!16874 () Bool)

(declare-datatypes ((List!529 0))(
  ( (Nil!526) (Cons!525 (h!1091 (_ BitVec 64)) (t!3160 List!529)) )
))
(declare-fun arrayNoDuplicates!0 (array!881 (_ BitVec 32) List!529) Bool)

(assert (=> b!16874 (= e!10514 (arrayNoDuplicates!0 (_keys!3052 (v!1401 (underlying!28 (_2!345 lt!4141)))) #b00000000000000000000000000000000 Nil!526))))

(assert (= (and d!3341 res!12395) b!16872))

(assert (= (and b!16872 res!12396) b!16873))

(assert (= (and b!16873 res!12397) b!16874))

(declare-fun m!11861 () Bool)

(assert (=> d!3341 m!11861))

(declare-fun m!11863 () Bool)

(assert (=> b!16872 m!11863))

(declare-fun m!11865 () Bool)

(assert (=> b!16873 m!11865))

(declare-fun m!11867 () Bool)

(assert (=> b!16874 m!11867))

(assert (=> b!16775 d!3341))

(declare-fun b!16881 () Bool)

(declare-fun e!10519 () Bool)

(assert (=> b!16881 (= e!10519 tp_is_empty!847)))

(declare-fun mapNonEmpty!710 () Bool)

(declare-fun mapRes!710 () Bool)

(declare-fun tp!2951 () Bool)

(assert (=> mapNonEmpty!710 (= mapRes!710 (and tp!2951 e!10519))))

(declare-fun mapRest!710 () (Array (_ BitVec 32) ValueCell!224))

(declare-fun mapValue!710 () ValueCell!224)

(declare-fun mapKey!710 () (_ BitVec 32))

(assert (=> mapNonEmpty!710 (= mapRest!701 (store mapRest!710 mapKey!710 mapValue!710))))

(declare-fun b!16882 () Bool)

(declare-fun e!10520 () Bool)

(assert (=> b!16882 (= e!10520 tp_is_empty!847)))

(declare-fun mapIsEmpty!710 () Bool)

(assert (=> mapIsEmpty!710 mapRes!710))

(declare-fun condMapEmpty!710 () Bool)

(declare-fun mapDefault!710 () ValueCell!224)

(assert (=> mapNonEmpty!701 (= condMapEmpty!710 (= mapRest!701 ((as const (Array (_ BitVec 32) ValueCell!224)) mapDefault!710)))))

(assert (=> mapNonEmpty!701 (= tp!2935 (and e!10520 mapRes!710))))

(assert (= (and mapNonEmpty!701 condMapEmpty!710) mapIsEmpty!710))

(assert (= (and mapNonEmpty!701 (not condMapEmpty!710)) mapNonEmpty!710))

(assert (= (and mapNonEmpty!710 ((_ is ValueCellFull!224) mapValue!710)) b!16881))

(assert (= (and mapNonEmpty!701 ((_ is ValueCellFull!224) mapDefault!710)) b!16882))

(declare-fun m!11869 () Bool)

(assert (=> mapNonEmpty!710 m!11869))

(check-sat (not d!3337) tp_is_empty!847 b_and!1219 (not b!16872) (not bm!466) (not b!16862) (not b!16859) (not b!16874) (not b!16873) (not d!3341) (not b!16858) (not d!3331) (not mapNonEmpty!710) (not b_next!583) (not bm!464))
(check-sat b_and!1219 (not b_next!583))
(get-model)

(declare-fun b!16891 () Bool)

(declare-fun e!10528 () Bool)

(declare-fun call!473 () Bool)

(assert (=> b!16891 (= e!10528 call!473)))

(declare-fun d!3343 () Bool)

(declare-fun res!12402 () Bool)

(declare-fun e!10529 () Bool)

(assert (=> d!3343 (=> res!12402 e!10529)))

(assert (=> d!3343 (= res!12402 (bvsge #b00000000000000000000000000000000 (size!512 (_keys!3052 (v!1401 (underlying!28 (_2!345 lt!4141)))))))))

(assert (=> d!3343 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3052 (v!1401 (underlying!28 (_2!345 lt!4141)))) (mask!4537 (v!1401 (underlying!28 (_2!345 lt!4141))))) e!10529)))

(declare-fun b!16892 () Bool)

(declare-fun e!10527 () Bool)

(assert (=> b!16892 (= e!10529 e!10527)))

(declare-fun c!1631 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!16892 (= c!1631 (validKeyInArray!0 (select (arr!423 (_keys!3052 (v!1401 (underlying!28 (_2!345 lt!4141))))) #b00000000000000000000000000000000)))))

(declare-fun b!16893 () Bool)

(assert (=> b!16893 (= e!10527 call!473)))

(declare-fun bm!470 () Bool)

(assert (=> bm!470 (= call!473 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3052 (v!1401 (underlying!28 (_2!345 lt!4141)))) (mask!4537 (v!1401 (underlying!28 (_2!345 lt!4141))))))))

(declare-fun b!16894 () Bool)

(assert (=> b!16894 (= e!10527 e!10528)))

(declare-fun lt!4186 () (_ BitVec 64))

(assert (=> b!16894 (= lt!4186 (select (arr!423 (_keys!3052 (v!1401 (underlying!28 (_2!345 lt!4141))))) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!349 0))(
  ( (Unit!350) )
))
(declare-fun lt!4184 () Unit!349)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!881 (_ BitVec 64) (_ BitVec 32)) Unit!349)

(assert (=> b!16894 (= lt!4184 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3052 (v!1401 (underlying!28 (_2!345 lt!4141)))) lt!4186 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!881 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!16894 (arrayContainsKey!0 (_keys!3052 (v!1401 (underlying!28 (_2!345 lt!4141)))) lt!4186 #b00000000000000000000000000000000)))

(declare-fun lt!4185 () Unit!349)

(assert (=> b!16894 (= lt!4185 lt!4184)))

(declare-fun res!12403 () Bool)

(declare-datatypes ((SeekEntryResult!42 0))(
  ( (MissingZero!42 (index!2287 (_ BitVec 32))) (Found!42 (index!2288 (_ BitVec 32))) (Intermediate!42 (undefined!854 Bool) (index!2289 (_ BitVec 32)) (x!4373 (_ BitVec 32))) (Undefined!42) (MissingVacant!42 (index!2290 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!881 (_ BitVec 32)) SeekEntryResult!42)

(assert (=> b!16894 (= res!12403 (= (seekEntryOrOpen!0 (select (arr!423 (_keys!3052 (v!1401 (underlying!28 (_2!345 lt!4141))))) #b00000000000000000000000000000000) (_keys!3052 (v!1401 (underlying!28 (_2!345 lt!4141)))) (mask!4537 (v!1401 (underlying!28 (_2!345 lt!4141))))) (Found!42 #b00000000000000000000000000000000)))))

(assert (=> b!16894 (=> (not res!12403) (not e!10528))))

(assert (= (and d!3343 (not res!12402)) b!16892))

(assert (= (and b!16892 c!1631) b!16894))

(assert (= (and b!16892 (not c!1631)) b!16893))

(assert (= (and b!16894 res!12403) b!16891))

(assert (= (or b!16891 b!16893) bm!470))

(declare-fun m!11871 () Bool)

(assert (=> b!16892 m!11871))

(assert (=> b!16892 m!11871))

(declare-fun m!11873 () Bool)

(assert (=> b!16892 m!11873))

(declare-fun m!11875 () Bool)

(assert (=> bm!470 m!11875))

(assert (=> b!16894 m!11871))

(declare-fun m!11877 () Bool)

(assert (=> b!16894 m!11877))

(declare-fun m!11879 () Bool)

(assert (=> b!16894 m!11879))

(assert (=> b!16894 m!11871))

(declare-fun m!11881 () Bool)

(assert (=> b!16894 m!11881))

(assert (=> b!16873 d!3343))

(declare-fun b!16907 () Bool)

(declare-fun e!10537 () Unit!349)

(declare-fun Unit!351 () Unit!349)

(assert (=> b!16907 (= e!10537 Unit!351)))

(declare-fun b!16908 () Bool)

(declare-fun e!10538 () Bool)

(declare-fun lt!4251 () array!881)

(declare-fun lt!4237 () tuple2!700)

(assert (=> b!16908 (= e!10538 (arrayContainsKey!0 lt!4251 (_1!351 lt!4237) #b00000000000000000000000000000000))))

(declare-fun d!3345 () Bool)

(declare-fun e!10536 () Bool)

(assert (=> d!3345 e!10536))

(declare-fun res!12409 () Bool)

(assert (=> d!3345 (=> (not res!12409) (not e!10536))))

(declare-fun lt!4234 () LongMapFixedSize!34)

(assert (=> d!3345 (= res!12409 (valid!26 lt!4234))))

(declare-fun lt!4247 () LongMapFixedSize!34)

(assert (=> d!3345 (= lt!4234 lt!4247)))

(declare-fun lt!4248 () Unit!349)

(assert (=> d!3345 (= lt!4248 e!10537)))

(declare-fun c!1637 () Bool)

(declare-fun map!327 (LongMapFixedSize!34) ListLongMap!521)

(assert (=> d!3345 (= c!1637 (not (= (map!327 lt!4247) (ListLongMap!522 Nil!525))))))

(declare-fun lt!4250 () Unit!349)

(declare-fun lt!4242 () Unit!349)

(assert (=> d!3345 (= lt!4250 lt!4242)))

(declare-fun lt!4240 () array!881)

(declare-fun lt!4249 () (_ BitVec 32))

(declare-fun lt!4245 () List!529)

(assert (=> d!3345 (arrayNoDuplicates!0 lt!4240 lt!4249 lt!4245)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!881 (_ BitVec 32) (_ BitVec 32) List!529) Unit!349)

(assert (=> d!3345 (= lt!4242 (lemmaArrayNoDuplicatesInAll0Array!0 lt!4240 lt!4249 (bvadd lt!4168 #b00000000000000000000000000000001) lt!4245))))

(assert (=> d!3345 (= lt!4245 Nil!526)))

(assert (=> d!3345 (= lt!4249 #b00000000000000000000000000000000)))

(assert (=> d!3345 (= lt!4240 (array!882 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd lt!4168 #b00000000000000000000000000000001)))))

(declare-fun lt!4236 () Unit!349)

(declare-fun lt!4243 () Unit!349)

(assert (=> d!3345 (= lt!4236 lt!4243)))

(declare-fun lt!4244 () (_ BitVec 32))

(declare-fun lt!4255 () array!881)

(assert (=> d!3345 (arrayForallSeekEntryOrOpenFound!0 lt!4244 lt!4255 lt!4168)))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!881 (_ BitVec 32) (_ BitVec 32)) Unit!349)

(assert (=> d!3345 (= lt!4243 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!4255 lt!4168 lt!4244))))

(assert (=> d!3345 (= lt!4244 #b00000000000000000000000000000000)))

(assert (=> d!3345 (= lt!4255 (array!882 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd lt!4168 #b00000000000000000000000000000001)))))

(declare-fun lt!4233 () Unit!349)

(declare-fun lt!4241 () Unit!349)

(assert (=> d!3345 (= lt!4233 lt!4241)))

(declare-fun lt!4235 () array!881)

(declare-fun lt!4238 () (_ BitVec 32))

(declare-fun lt!4253 () (_ BitVec 32))

(assert (=> d!3345 (= (arrayCountValidKeys!0 lt!4235 lt!4238 lt!4253) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!881 (_ BitVec 32) (_ BitVec 32)) Unit!349)

(assert (=> d!3345 (= lt!4241 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!4235 lt!4238 lt!4253))))

(assert (=> d!3345 (= lt!4253 (bvadd lt!4168 #b00000000000000000000000000000001))))

(assert (=> d!3345 (= lt!4238 #b00000000000000000000000000000000)))

(assert (=> d!3345 (= lt!4235 (array!882 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd lt!4168 #b00000000000000000000000000000001)))))

(declare-fun dynLambda!128 (Int (_ BitVec 64)) V!955)

(assert (=> d!3345 (= lt!4247 (LongMapFixedSize!35 (defaultEntry!1627 (v!1401 (underlying!28 thiss!848))) lt!4168 #b00000000000000000000000000000000 (dynLambda!128 (defaultEntry!1627 (v!1401 (underlying!28 thiss!848))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!128 (defaultEntry!1627 (v!1401 (underlying!28 thiss!848))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!882 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd lt!4168 #b00000000000000000000000000000001)) (array!880 ((as const (Array (_ BitVec 32) ValueCell!224)) EmptyCell!224) (bvadd lt!4168 #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!3345 (validMask!0 lt!4168)))

(assert (=> d!3345 (= (getNewLongMapFixedSize!7 lt!4168 (defaultEntry!1627 (v!1401 (underlying!28 thiss!848)))) lt!4234)))

(declare-fun b!16909 () Bool)

(declare-fun Unit!352 () Unit!349)

(assert (=> b!16909 (= e!10537 Unit!352)))

(declare-fun head!816 (List!528) tuple2!700)

(assert (=> b!16909 (= lt!4237 (head!816 (toList!276 (map!327 lt!4247))))))

(assert (=> b!16909 (= lt!4251 (array!882 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd lt!4168 #b00000000000000000000000000000001)))))

(declare-fun lt!4239 () (_ BitVec 32))

(assert (=> b!16909 (= lt!4239 #b00000000000000000000000000000000)))

(declare-fun lt!4252 () Unit!349)

(declare-fun lemmaKeyInListMapIsInArray!85 (array!881 array!879 (_ BitVec 32) (_ BitVec 32) V!955 V!955 (_ BitVec 64) Int) Unit!349)

(assert (=> b!16909 (= lt!4252 (lemmaKeyInListMapIsInArray!85 lt!4251 (array!880 ((as const (Array (_ BitVec 32) ValueCell!224)) EmptyCell!224) (bvadd lt!4168 #b00000000000000000000000000000001)) lt!4168 lt!4239 (dynLambda!128 (defaultEntry!1627 (v!1401 (underlying!28 thiss!848))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!128 (defaultEntry!1627 (v!1401 (underlying!28 thiss!848))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!351 lt!4237) (defaultEntry!1627 (v!1401 (underlying!28 thiss!848)))))))

(declare-fun c!1636 () Bool)

(assert (=> b!16909 (= c!1636 (and (not (= (_1!351 lt!4237) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!351 lt!4237) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!16909 e!10538))

(declare-fun lt!4254 () Unit!349)

(assert (=> b!16909 (= lt!4254 lt!4252)))

(declare-fun lt!4246 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!881 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!16909 (= lt!4246 (arrayScanForKey!0 (array!882 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd lt!4168 #b00000000000000000000000000000001)) (_1!351 lt!4237) #b00000000000000000000000000000000))))

(assert (=> b!16909 false))

(declare-fun b!16910 () Bool)

(assert (=> b!16910 (= e!10538 (ite (= (_1!351 lt!4237) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!4239 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!4239 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!16911 () Bool)

(assert (=> b!16911 (= e!10536 (= (map!327 lt!4234) (ListLongMap!522 Nil!525)))))

(declare-fun b!16912 () Bool)

(declare-fun res!12408 () Bool)

(assert (=> b!16912 (=> (not res!12408) (not e!10536))))

(assert (=> b!16912 (= res!12408 (= (mask!4537 lt!4234) lt!4168))))

(assert (= (and d!3345 c!1637) b!16909))

(assert (= (and d!3345 (not c!1637)) b!16907))

(assert (= (and b!16909 c!1636) b!16908))

(assert (= (and b!16909 (not c!1636)) b!16910))

(assert (= (and d!3345 res!12409) b!16912))

(assert (= (and b!16912 res!12408) b!16911))

(declare-fun b_lambda!1423 () Bool)

(assert (=> (not b_lambda!1423) (not d!3345)))

(declare-fun t!3162 () Bool)

(declare-fun tb!619 () Bool)

(assert (=> (and b!16776 (= (defaultEntry!1627 (v!1401 (underlying!28 thiss!848))) (defaultEntry!1627 (v!1401 (underlying!28 thiss!848)))) t!3162) tb!619))

(declare-fun result!999 () Bool)

(assert (=> tb!619 (= result!999 tp_is_empty!847)))

(assert (=> d!3345 t!3162))

(declare-fun b_and!1225 () Bool)

(assert (= b_and!1219 (and (=> t!3162 result!999) b_and!1225)))

(declare-fun b_lambda!1425 () Bool)

(assert (=> (not b_lambda!1425) (not b!16909)))

(assert (=> b!16909 t!3162))

(declare-fun b_and!1227 () Bool)

(assert (= b_and!1225 (and (=> t!3162 result!999) b_and!1227)))

(declare-fun m!11883 () Bool)

(assert (=> b!16908 m!11883))

(declare-fun m!11885 () Bool)

(assert (=> d!3345 m!11885))

(declare-fun m!11887 () Bool)

(assert (=> d!3345 m!11887))

(declare-fun m!11889 () Bool)

(assert (=> d!3345 m!11889))

(declare-fun m!11891 () Bool)

(assert (=> d!3345 m!11891))

(declare-fun m!11893 () Bool)

(assert (=> d!3345 m!11893))

(declare-fun m!11895 () Bool)

(assert (=> d!3345 m!11895))

(declare-fun m!11897 () Bool)

(assert (=> d!3345 m!11897))

(declare-fun m!11899 () Bool)

(assert (=> d!3345 m!11899))

(declare-fun m!11901 () Bool)

(assert (=> d!3345 m!11901))

(declare-fun m!11903 () Bool)

(assert (=> d!3345 m!11903))

(declare-fun m!11905 () Bool)

(assert (=> b!16909 m!11905))

(assert (=> b!16909 m!11895))

(assert (=> b!16909 m!11895))

(declare-fun m!11907 () Bool)

(assert (=> b!16909 m!11907))

(declare-fun m!11909 () Bool)

(assert (=> b!16909 m!11909))

(assert (=> b!16909 m!11895))

(assert (=> b!16909 m!11901))

(declare-fun m!11911 () Bool)

(assert (=> b!16911 m!11911))

(assert (=> bm!464 d!3345))

(declare-fun d!3347 () Bool)

(assert (=> d!3347 (= (map!326 (_2!345 lt!4174)) (map!327 (v!1401 (underlying!28 (_2!345 lt!4174)))))))

(declare-fun bs!803 () Bool)

(assert (= bs!803 d!3347))

(declare-fun m!11913 () Bool)

(assert (=> bs!803 m!11913))

(assert (=> b!16859 d!3347))

(declare-fun d!3349 () Bool)

(assert (=> d!3349 (= (map!326 thiss!848) (map!327 (v!1401 (underlying!28 thiss!848))))))

(declare-fun bs!804 () Bool)

(assert (= bs!804 d!3349))

(declare-fun m!11915 () Bool)

(assert (=> bs!804 m!11915))

(assert (=> b!16859 d!3349))

(declare-fun d!3351 () Bool)

(declare-fun res!12410 () Bool)

(declare-fun e!10539 () Bool)

(assert (=> d!3351 (=> (not res!12410) (not e!10539))))

(assert (=> d!3351 (= res!12410 (simpleValid!8 (v!1401 (underlying!28 thiss!848))))))

(assert (=> d!3351 (= (valid!26 (v!1401 (underlying!28 thiss!848))) e!10539)))

(declare-fun b!16915 () Bool)

(declare-fun res!12411 () Bool)

(assert (=> b!16915 (=> (not res!12411) (not e!10539))))

(assert (=> b!16915 (= res!12411 (= (arrayCountValidKeys!0 (_keys!3052 (v!1401 (underlying!28 thiss!848))) #b00000000000000000000000000000000 (size!512 (_keys!3052 (v!1401 (underlying!28 thiss!848))))) (_size!48 (v!1401 (underlying!28 thiss!848)))))))

(declare-fun b!16916 () Bool)

(declare-fun res!12412 () Bool)

(assert (=> b!16916 (=> (not res!12412) (not e!10539))))

(assert (=> b!16916 (= res!12412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3052 (v!1401 (underlying!28 thiss!848))) (mask!4537 (v!1401 (underlying!28 thiss!848)))))))

(declare-fun b!16917 () Bool)

(assert (=> b!16917 (= e!10539 (arrayNoDuplicates!0 (_keys!3052 (v!1401 (underlying!28 thiss!848))) #b00000000000000000000000000000000 Nil!526))))

(assert (= (and d!3351 res!12410) b!16915))

(assert (= (and b!16915 res!12411) b!16916))

(assert (= (and b!16916 res!12412) b!16917))

(declare-fun m!11917 () Bool)

(assert (=> d!3351 m!11917))

(declare-fun m!11919 () Bool)

(assert (=> b!16915 m!11919))

(declare-fun m!11921 () Bool)

(assert (=> b!16916 m!11921))

(declare-fun m!11923 () Bool)

(assert (=> b!16917 m!11923))

(assert (=> d!3337 d!3351))

(declare-fun b!16928 () Bool)

(declare-fun e!10550 () Bool)

(declare-fun call!476 () Bool)

(assert (=> b!16928 (= e!10550 call!476)))

(declare-fun b!16929 () Bool)

(declare-fun e!10551 () Bool)

(declare-fun contains!206 (List!529 (_ BitVec 64)) Bool)

(assert (=> b!16929 (= e!10551 (contains!206 Nil!526 (select (arr!423 (_keys!3052 (v!1401 (underlying!28 (_2!345 lt!4141))))) #b00000000000000000000000000000000)))))

(declare-fun b!16930 () Bool)

(assert (=> b!16930 (= e!10550 call!476)))

(declare-fun d!3353 () Bool)

(declare-fun res!12421 () Bool)

(declare-fun e!10548 () Bool)

(assert (=> d!3353 (=> res!12421 e!10548)))

(assert (=> d!3353 (= res!12421 (bvsge #b00000000000000000000000000000000 (size!512 (_keys!3052 (v!1401 (underlying!28 (_2!345 lt!4141)))))))))

(assert (=> d!3353 (= (arrayNoDuplicates!0 (_keys!3052 (v!1401 (underlying!28 (_2!345 lt!4141)))) #b00000000000000000000000000000000 Nil!526) e!10548)))

(declare-fun bm!473 () Bool)

(declare-fun c!1640 () Bool)

(assert (=> bm!473 (= call!476 (arrayNoDuplicates!0 (_keys!3052 (v!1401 (underlying!28 (_2!345 lt!4141)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!1640 (Cons!525 (select (arr!423 (_keys!3052 (v!1401 (underlying!28 (_2!345 lt!4141))))) #b00000000000000000000000000000000) Nil!526) Nil!526)))))

(declare-fun b!16931 () Bool)

(declare-fun e!10549 () Bool)

(assert (=> b!16931 (= e!10549 e!10550)))

(assert (=> b!16931 (= c!1640 (validKeyInArray!0 (select (arr!423 (_keys!3052 (v!1401 (underlying!28 (_2!345 lt!4141))))) #b00000000000000000000000000000000)))))

(declare-fun b!16932 () Bool)

(assert (=> b!16932 (= e!10548 e!10549)))

(declare-fun res!12419 () Bool)

(assert (=> b!16932 (=> (not res!12419) (not e!10549))))

(assert (=> b!16932 (= res!12419 (not e!10551))))

(declare-fun res!12420 () Bool)

(assert (=> b!16932 (=> (not res!12420) (not e!10551))))

(assert (=> b!16932 (= res!12420 (validKeyInArray!0 (select (arr!423 (_keys!3052 (v!1401 (underlying!28 (_2!345 lt!4141))))) #b00000000000000000000000000000000)))))

(assert (= (and d!3353 (not res!12421)) b!16932))

(assert (= (and b!16932 res!12420) b!16929))

(assert (= (and b!16932 res!12419) b!16931))

(assert (= (and b!16931 c!1640) b!16930))

(assert (= (and b!16931 (not c!1640)) b!16928))

(assert (= (or b!16930 b!16928) bm!473))

(assert (=> b!16929 m!11871))

(assert (=> b!16929 m!11871))

(declare-fun m!11925 () Bool)

(assert (=> b!16929 m!11925))

(assert (=> bm!473 m!11871))

(declare-fun m!11927 () Bool)

(assert (=> bm!473 m!11927))

(assert (=> b!16931 m!11871))

(assert (=> b!16931 m!11871))

(assert (=> b!16931 m!11873))

(assert (=> b!16932 m!11871))

(assert (=> b!16932 m!11871))

(assert (=> b!16932 m!11873))

(assert (=> b!16874 d!3353))

(declare-fun b!17013 () Bool)

(declare-fun res!12459 () Bool)

(declare-fun lt!4332 () SeekEntryResult!42)

(assert (=> b!17013 (= res!12459 (= (select (arr!423 (_keys!3052 (ite c!1626 (_2!348 lt!4169) call!470))) (index!2290 lt!4332)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!10610 () Bool)

(assert (=> b!17013 (=> (not res!12459) (not e!10610))))

(declare-fun b!17014 () Bool)

(declare-fun c!1671 () Bool)

(declare-fun lt!4329 () SeekEntryResult!42)

(assert (=> b!17014 (= c!1671 ((_ is MissingVacant!42) lt!4329))))

(declare-fun e!10596 () Bool)

(declare-fun e!10609 () Bool)

(assert (=> b!17014 (= e!10596 e!10609)))

(declare-fun e!10606 () Bool)

(declare-fun lt!4335 () SeekEntryResult!42)

(declare-fun b!17015 () Bool)

(assert (=> b!17015 (= e!10606 (= (select (arr!423 (_keys!3052 (ite c!1626 (_2!348 lt!4169) call!470))) (index!2288 lt!4335)) (ite c!1626 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1625 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!17016 () Bool)

(declare-fun lt!4310 () Unit!349)

(declare-fun e!10605 () Unit!349)

(assert (=> b!17016 (= lt!4310 e!10605)))

(declare-fun c!1677 () Bool)

(declare-fun call!540 () Bool)

(assert (=> b!17016 (= c!1677 call!540)))

(declare-fun e!10608 () tuple2!696)

(assert (=> b!17016 (= e!10608 (tuple2!697 false (ite c!1626 (_2!348 lt!4169) call!470)))))

(declare-fun bm!522 () Bool)

(declare-fun call!530 () Bool)

(declare-fun call!545 () Bool)

(assert (=> bm!522 (= call!530 call!545)))

(declare-fun b!17017 () Bool)

(declare-fun Unit!353 () Unit!349)

(assert (=> b!17017 (= e!10605 Unit!353)))

(declare-fun lt!4320 () Unit!349)

(declare-fun call!538 () Unit!349)

(assert (=> b!17017 (= lt!4320 call!538)))

(declare-fun call!544 () SeekEntryResult!42)

(assert (=> b!17017 (= lt!4335 call!544)))

(declare-fun res!12462 () Bool)

(assert (=> b!17017 (= res!12462 ((_ is Found!42) lt!4335))))

(assert (=> b!17017 (=> (not res!12462) (not e!10606))))

(assert (=> b!17017 e!10606))

(declare-fun lt!4314 () Unit!349)

(assert (=> b!17017 (= lt!4314 lt!4320)))

(assert (=> b!17017 false))

(declare-fun b!17018 () Bool)

(declare-fun lt!4334 () Unit!349)

(declare-fun lt!4313 () Unit!349)

(assert (=> b!17018 (= lt!4334 lt!4313)))

(declare-fun call!548 () ListLongMap!521)

(declare-fun call!528 () ListLongMap!521)

(assert (=> b!17018 (= call!548 call!528)))

(declare-fun lt!4311 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!1 (array!881 array!879 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!955 V!955 V!955 Int) Unit!349)

(assert (=> b!17018 (= lt!4313 (lemmaChangeZeroKeyThenAddPairToListMap!1 (_keys!3052 (ite c!1626 (_2!348 lt!4169) call!470)) (_values!1625 (ite c!1626 (_2!348 lt!4169) call!470)) (mask!4537 (ite c!1626 (_2!348 lt!4169) call!470)) (extraKeys!1541 (ite c!1626 (_2!348 lt!4169) call!470)) lt!4311 (zeroValue!1564 (ite c!1626 (_2!348 lt!4169) call!470)) (ite c!1626 (minValue!1564 (v!1401 (underlying!28 thiss!848))) (ite c!1625 (zeroValue!1564 (v!1401 (underlying!28 thiss!848))) (minValue!1564 (v!1401 (underlying!28 thiss!848))))) (minValue!1564 (ite c!1626 (_2!348 lt!4169) call!470)) (defaultEntry!1627 (ite c!1626 (_2!348 lt!4169) call!470))))))

(assert (=> b!17018 (= lt!4311 (bvor (extraKeys!1541 (ite c!1626 (_2!348 lt!4169) call!470)) #b00000000000000000000000000000001))))

(declare-fun e!10612 () tuple2!696)

(assert (=> b!17018 (= e!10612 (tuple2!697 true (LongMapFixedSize!35 (defaultEntry!1627 (ite c!1626 (_2!348 lt!4169) call!470)) (mask!4537 (ite c!1626 (_2!348 lt!4169) call!470)) (bvor (extraKeys!1541 (ite c!1626 (_2!348 lt!4169) call!470)) #b00000000000000000000000000000001) (ite c!1626 (minValue!1564 (v!1401 (underlying!28 thiss!848))) (ite c!1625 (zeroValue!1564 (v!1401 (underlying!28 thiss!848))) (minValue!1564 (v!1401 (underlying!28 thiss!848))))) (minValue!1564 (ite c!1626 (_2!348 lt!4169) call!470)) (_size!48 (ite c!1626 (_2!348 lt!4169) call!470)) (_keys!3052 (ite c!1626 (_2!348 lt!4169) call!470)) (_values!1625 (ite c!1626 (_2!348 lt!4169) call!470)) (_vacant!48 (ite c!1626 (_2!348 lt!4169) call!470)))))))

(declare-fun bm!523 () Bool)

(declare-fun call!532 () ListLongMap!521)

(declare-fun call!535 () ListLongMap!521)

(assert (=> bm!523 (= call!532 call!535)))

(declare-fun b!17019 () Bool)

(declare-fun e!10603 () Bool)

(assert (=> b!17019 (= e!10603 (not call!530))))

(declare-fun b!17020 () Bool)

(declare-fun res!12454 () Bool)

(declare-fun call!527 () Bool)

(assert (=> b!17020 (= res!12454 call!527)))

(assert (=> b!17020 (=> (not res!12454) (not e!10606))))

(declare-fun b!17021 () Bool)

(declare-fun res!12463 () Bool)

(declare-fun e!10613 () Bool)

(assert (=> b!17021 (=> (not res!12463) (not e!10613))))

(assert (=> b!17021 (= res!12463 (= (select (arr!423 (_keys!3052 (ite c!1626 (_2!348 lt!4169) call!470))) (index!2287 lt!4329)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!17022 () Bool)

(declare-fun e!10601 () tuple2!696)

(declare-fun e!10600 () tuple2!696)

(assert (=> b!17022 (= e!10601 e!10600)))

(declare-fun c!1670 () Bool)

(declare-fun lt!4322 () SeekEntryResult!42)

(assert (=> b!17022 (= c!1670 ((_ is MissingZero!42) lt!4322))))

(declare-fun b!17023 () Bool)

(declare-fun e!10599 () Bool)

(declare-fun call!526 () Bool)

(assert (=> b!17023 (= e!10599 (not call!526))))

(declare-fun b!17024 () Bool)

(declare-fun lt!4326 () Unit!349)

(assert (=> b!17024 (= e!10605 lt!4326)))

(declare-fun call!525 () Unit!349)

(assert (=> b!17024 (= lt!4326 call!525)))

(assert (=> b!17024 (= lt!4332 call!544)))

(declare-fun c!1674 () Bool)

(assert (=> b!17024 (= c!1674 ((_ is MissingZero!42) lt!4332))))

(declare-fun e!10598 () Bool)

(assert (=> b!17024 e!10598))

(declare-fun bm!524 () Bool)

(declare-fun call!546 () ListLongMap!521)

(declare-fun lt!4318 () tuple2!696)

(assert (=> bm!524 (= call!546 (map!327 (_2!348 lt!4318)))))

(declare-fun b!17025 () Bool)

(declare-fun e!10607 () Bool)

(assert (=> b!17025 (= e!10607 ((_ is Undefined!42) lt!4332))))

(declare-fun bm!525 () Bool)

(declare-fun call!539 () ListLongMap!521)

(assert (=> bm!525 (= call!528 call!539)))

(declare-fun bm!526 () Bool)

(declare-fun c!1676 () Bool)

(declare-fun c!1675 () Bool)

(assert (=> bm!526 (= c!1676 c!1675)))

(declare-fun e!10611 () ListLongMap!521)

(declare-fun contains!207 (ListLongMap!521 (_ BitVec 64)) Bool)

(assert (=> bm!526 (= call!540 (contains!207 e!10611 (ite c!1626 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1625 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!17026 () Bool)

(declare-fun c!1668 () Bool)

(assert (=> b!17026 (= c!1668 ((_ is MissingVacant!42) lt!4322))))

(assert (=> b!17026 (= e!10608 e!10601)))

(declare-fun call!536 () ListLongMap!521)

(declare-fun bm!527 () Bool)

(assert (=> bm!527 (= call!536 (map!327 (ite c!1626 (_2!348 lt!4169) call!470)))))

(declare-fun b!17027 () Bool)

(declare-fun lt!4323 () SeekEntryResult!42)

(declare-fun e!10594 () Bool)

(assert (=> b!17027 (= e!10594 (= (select (arr!423 (_keys!3052 (ite c!1626 (_2!348 lt!4169) call!470))) (index!2288 lt!4323)) (ite c!1626 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1625 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun call!542 () tuple2!696)

(declare-fun bm!528 () Bool)

(declare-fun updateHelperNewKey!1 (LongMapFixedSize!34 (_ BitVec 64) V!955 (_ BitVec 32)) tuple2!696)

(assert (=> bm!528 (= call!542 (updateHelperNewKey!1 (ite c!1626 (_2!348 lt!4169) call!470) (ite c!1626 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1625 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!1626 (minValue!1564 (v!1401 (underlying!28 thiss!848))) (ite c!1625 (zeroValue!1564 (v!1401 (underlying!28 thiss!848))) (minValue!1564 (v!1401 (underlying!28 thiss!848))))) (ite c!1668 (index!2290 lt!4322) (index!2287 lt!4322))))))

(declare-fun bm!529 () Bool)

(assert (=> bm!529 (= call!545 (arrayContainsKey!0 (_keys!3052 (ite c!1626 (_2!348 lt!4169) call!470)) (ite c!1626 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1625 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000))))

(declare-fun b!17028 () Bool)

(assert (=> b!17028 (= e!10609 ((_ is Undefined!42) lt!4329))))

(declare-fun b!17029 () Bool)

(assert (=> b!17029 (= e!10607 e!10610)))

(declare-fun res!12451 () Bool)

(declare-fun call!543 () Bool)

(assert (=> b!17029 (= res!12451 call!543)))

(assert (=> b!17029 (=> (not res!12451) (not e!10610))))

(declare-fun bm!530 () Bool)

(declare-fun call!533 () Bool)

(assert (=> bm!530 (= call!527 call!533)))

(declare-fun b!17030 () Bool)

(declare-fun e!10604 () Unit!349)

(declare-fun lt!4336 () Unit!349)

(assert (=> b!17030 (= e!10604 lt!4336)))

(assert (=> b!17030 (= lt!4336 call!538)))

(declare-fun call!541 () SeekEntryResult!42)

(assert (=> b!17030 (= lt!4323 call!541)))

(declare-fun res!12456 () Bool)

(assert (=> b!17030 (= res!12456 ((_ is Found!42) lt!4323))))

(assert (=> b!17030 (=> (not res!12456) (not e!10594))))

(assert (=> b!17030 e!10594))

(declare-fun bm!531 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!1 (array!881 array!879 (_ BitVec 32) (_ BitVec 32) V!955 V!955 (_ BitVec 64) Int) Unit!349)

(assert (=> bm!531 (= call!538 (lemmaInListMapThenSeekEntryOrOpenFindsIt!1 (_keys!3052 (ite c!1626 (_2!348 lt!4169) call!470)) (_values!1625 (ite c!1626 (_2!348 lt!4169) call!470)) (mask!4537 (ite c!1626 (_2!348 lt!4169) call!470)) (extraKeys!1541 (ite c!1626 (_2!348 lt!4169) call!470)) (zeroValue!1564 (ite c!1626 (_2!348 lt!4169) call!470)) (minValue!1564 (ite c!1626 (_2!348 lt!4169) call!470)) (ite c!1626 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1625 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1627 (ite c!1626 (_2!348 lt!4169) call!470))))))

(declare-fun b!17031 () Bool)

(declare-fun e!10614 () tuple2!696)

(assert (=> b!17031 (= e!10614 e!10612)))

(declare-fun c!1672 () Bool)

(assert (=> b!17031 (= c!1672 (= (ite c!1626 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1625 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!17032 () Bool)

(declare-fun call!537 () ListLongMap!521)

(assert (=> b!17032 (= e!10611 call!537)))

(declare-fun d!3355 () Bool)

(declare-fun e!10595 () Bool)

(assert (=> d!3355 e!10595))

(declare-fun res!12458 () Bool)

(assert (=> d!3355 (=> (not res!12458) (not e!10595))))

(assert (=> d!3355 (= res!12458 (valid!26 (_2!348 lt!4318)))))

(assert (=> d!3355 (= lt!4318 e!10614)))

(declare-fun c!1678 () Bool)

(assert (=> d!3355 (= c!1678 (= (ite c!1626 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1625 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvneg (ite c!1626 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1625 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!3355 (valid!26 (ite c!1626 (_2!348 lt!4169) call!470))))

(assert (=> d!3355 (= (update!2 (ite c!1626 (_2!348 lt!4169) call!470) (ite c!1626 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1625 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!1626 (minValue!1564 (v!1401 (underlying!28 thiss!848))) (ite c!1625 (zeroValue!1564 (v!1401 (underlying!28 thiss!848))) (minValue!1564 (v!1401 (underlying!28 thiss!848)))))) lt!4318)))

(declare-fun b!17033 () Bool)

(declare-fun e!10597 () Bool)

(assert (=> b!17033 (= e!10597 (= call!546 call!536))))

(declare-fun b!17034 () Bool)

(assert (=> b!17034 (= e!10614 e!10608)))

(assert (=> b!17034 (= lt!4322 (seekEntryOrOpen!0 (ite c!1626 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1625 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3052 (ite c!1626 (_2!348 lt!4169) call!470)) (mask!4537 (ite c!1626 (_2!348 lt!4169) call!470))))))

(assert (=> b!17034 (= c!1675 ((_ is Undefined!42) lt!4322))))

(declare-fun lt!4327 () (_ BitVec 32))

(declare-fun bm!532 () Bool)

(declare-fun getCurrentListMap!118 (array!881 array!879 (_ BitVec 32) (_ BitVec 32) V!955 V!955 (_ BitVec 32) Int) ListLongMap!521)

(assert (=> bm!532 (= call!539 (getCurrentListMap!118 (_keys!3052 (ite c!1626 (_2!348 lt!4169) call!470)) (_values!1625 (ite c!1626 (_2!348 lt!4169) call!470)) (mask!4537 (ite c!1626 (_2!348 lt!4169) call!470)) (ite c!1678 (ite c!1672 lt!4311 lt!4327) (extraKeys!1541 (ite c!1626 (_2!348 lt!4169) call!470))) (ite (and c!1678 c!1672) (ite c!1626 (minValue!1564 (v!1401 (underlying!28 thiss!848))) (ite c!1625 (zeroValue!1564 (v!1401 (underlying!28 thiss!848))) (minValue!1564 (v!1401 (underlying!28 thiss!848))))) (zeroValue!1564 (ite c!1626 (_2!348 lt!4169) call!470))) (ite c!1678 (ite c!1672 (minValue!1564 (ite c!1626 (_2!348 lt!4169) call!470)) (ite c!1626 (minValue!1564 (v!1401 (underlying!28 thiss!848))) (ite c!1625 (zeroValue!1564 (v!1401 (underlying!28 thiss!848))) (minValue!1564 (v!1401 (underlying!28 thiss!848)))))) (minValue!1564 (ite c!1626 (_2!348 lt!4169) call!470))) #b00000000000000000000000000000000 (defaultEntry!1627 (ite c!1626 (_2!348 lt!4169) call!470))))))

(declare-fun bm!533 () Bool)

(declare-fun call!529 () SeekEntryResult!42)

(assert (=> bm!533 (= call!529 (seekEntryOrOpen!0 (ite c!1626 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1625 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (_keys!3052 (ite c!1626 (_2!348 lt!4169) call!470)) (mask!4537 (ite c!1626 (_2!348 lt!4169) call!470))))))

(declare-fun b!17035 () Bool)

(declare-fun c!1673 () Bool)

(assert (=> b!17035 (= c!1673 ((_ is MissingVacant!42) lt!4332))))

(assert (=> b!17035 (= e!10598 e!10607)))

(declare-fun bm!534 () Bool)

(declare-fun call!531 () Bool)

(declare-fun call!547 () Bool)

(assert (=> bm!534 (= call!531 call!547)))

(declare-fun bm!535 () Bool)

(assert (=> bm!535 (= call!544 call!529)))

(declare-fun bm!536 () Bool)

(assert (=> bm!536 (= call!541 call!529)))

(declare-fun bm!537 () Bool)

(declare-fun c!1679 () Bool)

(declare-fun c!1667 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!537 (= call!533 (inRange!0 (ite c!1675 (ite c!1677 (index!2288 lt!4335) (ite c!1674 (index!2287 lt!4332) (index!2290 lt!4332))) (ite c!1679 (index!2288 lt!4323) (ite c!1667 (index!2287 lt!4329) (index!2290 lt!4329)))) (mask!4537 (ite c!1626 (_2!348 lt!4169) call!470))))))

(declare-fun b!17036 () Bool)

(declare-fun lt!4321 () Unit!349)

(declare-fun lt!4315 () Unit!349)

(assert (=> b!17036 (= lt!4321 lt!4315)))

(assert (=> b!17036 (= call!548 call!528)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!1 (array!881 array!879 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!955 V!955 V!955 Int) Unit!349)

(assert (=> b!17036 (= lt!4315 (lemmaChangeLongMinValueKeyThenAddPairToListMap!1 (_keys!3052 (ite c!1626 (_2!348 lt!4169) call!470)) (_values!1625 (ite c!1626 (_2!348 lt!4169) call!470)) (mask!4537 (ite c!1626 (_2!348 lt!4169) call!470)) (extraKeys!1541 (ite c!1626 (_2!348 lt!4169) call!470)) lt!4327 (zeroValue!1564 (ite c!1626 (_2!348 lt!4169) call!470)) (minValue!1564 (ite c!1626 (_2!348 lt!4169) call!470)) (ite c!1626 (minValue!1564 (v!1401 (underlying!28 thiss!848))) (ite c!1625 (zeroValue!1564 (v!1401 (underlying!28 thiss!848))) (minValue!1564 (v!1401 (underlying!28 thiss!848))))) (defaultEntry!1627 (ite c!1626 (_2!348 lt!4169) call!470))))))

(assert (=> b!17036 (= lt!4327 (bvor (extraKeys!1541 (ite c!1626 (_2!348 lt!4169) call!470)) #b00000000000000000000000000000010))))

(assert (=> b!17036 (= e!10612 (tuple2!697 true (LongMapFixedSize!35 (defaultEntry!1627 (ite c!1626 (_2!348 lt!4169) call!470)) (mask!4537 (ite c!1626 (_2!348 lt!4169) call!470)) (bvor (extraKeys!1541 (ite c!1626 (_2!348 lt!4169) call!470)) #b00000000000000000000000000000010) (zeroValue!1564 (ite c!1626 (_2!348 lt!4169) call!470)) (ite c!1626 (minValue!1564 (v!1401 (underlying!28 thiss!848))) (ite c!1625 (zeroValue!1564 (v!1401 (underlying!28 thiss!848))) (minValue!1564 (v!1401 (underlying!28 thiss!848))))) (_size!48 (ite c!1626 (_2!348 lt!4169) call!470)) (_keys!3052 (ite c!1626 (_2!348 lt!4169) call!470)) (_values!1625 (ite c!1626 (_2!348 lt!4169) call!470)) (_vacant!48 (ite c!1626 (_2!348 lt!4169) call!470)))))))

(declare-fun b!17037 () Bool)

(declare-fun res!12453 () Bool)

(assert (=> b!17037 (=> (not res!12453) (not e!10603))))

(assert (=> b!17037 (= res!12453 (= (select (arr!423 (_keys!3052 (ite c!1626 (_2!348 lt!4169) call!470))) (index!2287 lt!4332)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!17038 () Bool)

(declare-fun lt!4316 () Unit!349)

(declare-fun lt!4319 () Unit!349)

(assert (=> b!17038 (= lt!4316 lt!4319)))

(declare-fun lt!4328 () array!879)

(assert (=> b!17038 (contains!207 (getCurrentListMap!118 (_keys!3052 (ite c!1626 (_2!348 lt!4169) call!470)) lt!4328 (mask!4537 (ite c!1626 (_2!348 lt!4169) call!470)) (extraKeys!1541 (ite c!1626 (_2!348 lt!4169) call!470)) (zeroValue!1564 (ite c!1626 (_2!348 lt!4169) call!470)) (minValue!1564 (ite c!1626 (_2!348 lt!4169) call!470)) #b00000000000000000000000000000000 (defaultEntry!1627 (ite c!1626 (_2!348 lt!4169) call!470))) (select (arr!423 (_keys!3052 (ite c!1626 (_2!348 lt!4169) call!470))) (index!2288 lt!4322)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!1 (array!881 array!879 (_ BitVec 32) (_ BitVec 32) V!955 V!955 (_ BitVec 32) Int) Unit!349)

(assert (=> b!17038 (= lt!4319 (lemmaValidKeyInArrayIsInListMap!1 (_keys!3052 (ite c!1626 (_2!348 lt!4169) call!470)) lt!4328 (mask!4537 (ite c!1626 (_2!348 lt!4169) call!470)) (extraKeys!1541 (ite c!1626 (_2!348 lt!4169) call!470)) (zeroValue!1564 (ite c!1626 (_2!348 lt!4169) call!470)) (minValue!1564 (ite c!1626 (_2!348 lt!4169) call!470)) (index!2288 lt!4322) (defaultEntry!1627 (ite c!1626 (_2!348 lt!4169) call!470))))))

(assert (=> b!17038 (= lt!4328 (array!880 (store (arr!422 (_values!1625 (ite c!1626 (_2!348 lt!4169) call!470))) (index!2288 lt!4322) (ValueCellFull!224 (ite c!1626 (minValue!1564 (v!1401 (underlying!28 thiss!848))) (ite c!1625 (zeroValue!1564 (v!1401 (underlying!28 thiss!848))) (minValue!1564 (v!1401 (underlying!28 thiss!848))))))) (size!511 (_values!1625 (ite c!1626 (_2!348 lt!4169) call!470)))))))

(declare-fun lt!4325 () Unit!349)

(declare-fun lt!4312 () Unit!349)

(assert (=> b!17038 (= lt!4325 lt!4312)))

(declare-fun call!534 () ListLongMap!521)

(assert (=> b!17038 (= call!534 call!537)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!1 (array!881 array!879 (_ BitVec 32) (_ BitVec 32) V!955 V!955 (_ BitVec 32) (_ BitVec 64) V!955 Int) Unit!349)

(assert (=> b!17038 (= lt!4312 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!1 (_keys!3052 (ite c!1626 (_2!348 lt!4169) call!470)) (_values!1625 (ite c!1626 (_2!348 lt!4169) call!470)) (mask!4537 (ite c!1626 (_2!348 lt!4169) call!470)) (extraKeys!1541 (ite c!1626 (_2!348 lt!4169) call!470)) (zeroValue!1564 (ite c!1626 (_2!348 lt!4169) call!470)) (minValue!1564 (ite c!1626 (_2!348 lt!4169) call!470)) (index!2288 lt!4322) (ite c!1626 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1625 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!1626 (minValue!1564 (v!1401 (underlying!28 thiss!848))) (ite c!1625 (zeroValue!1564 (v!1401 (underlying!28 thiss!848))) (minValue!1564 (v!1401 (underlying!28 thiss!848))))) (defaultEntry!1627 (ite c!1626 (_2!348 lt!4169) call!470))))))

(declare-fun lt!4331 () Unit!349)

(assert (=> b!17038 (= lt!4331 e!10604)))

(assert (=> b!17038 (= c!1679 call!540)))

(assert (=> b!17038 (= e!10600 (tuple2!697 true (LongMapFixedSize!35 (defaultEntry!1627 (ite c!1626 (_2!348 lt!4169) call!470)) (mask!4537 (ite c!1626 (_2!348 lt!4169) call!470)) (extraKeys!1541 (ite c!1626 (_2!348 lt!4169) call!470)) (zeroValue!1564 (ite c!1626 (_2!348 lt!4169) call!470)) (minValue!1564 (ite c!1626 (_2!348 lt!4169) call!470)) (_size!48 (ite c!1626 (_2!348 lt!4169) call!470)) (_keys!3052 (ite c!1626 (_2!348 lt!4169) call!470)) (array!880 (store (arr!422 (_values!1625 (ite c!1626 (_2!348 lt!4169) call!470))) (index!2288 lt!4322) (ValueCellFull!224 (ite c!1626 (minValue!1564 (v!1401 (underlying!28 thiss!848))) (ite c!1625 (zeroValue!1564 (v!1401 (underlying!28 thiss!848))) (minValue!1564 (v!1401 (underlying!28 thiss!848))))))) (size!511 (_values!1625 (ite c!1626 (_2!348 lt!4169) call!470)))) (_vacant!48 (ite c!1626 (_2!348 lt!4169) call!470)))))))

(declare-fun b!17039 () Bool)

(declare-fun e!10602 () Bool)

(assert (=> b!17039 (= e!10597 e!10602)))

(declare-fun res!12455 () Bool)

(assert (=> b!17039 (= res!12455 (contains!207 call!546 (ite c!1626 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1625 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!17039 (=> (not res!12455) (not e!10602))))

(declare-fun b!17040 () Bool)

(declare-fun lt!4333 () tuple2!696)

(assert (=> b!17040 (= e!10601 (tuple2!697 (_1!348 lt!4333) (_2!348 lt!4333)))))

(assert (=> b!17040 (= lt!4333 call!542)))

(declare-fun bm!538 () Bool)

(assert (=> bm!538 (= call!543 call!527)))

(declare-fun b!17041 () Bool)

(assert (=> b!17041 (= e!10610 (not call!530))))

(declare-fun bm!539 () Bool)

(assert (=> bm!539 (= call!535 (getCurrentListMap!118 (_keys!3052 (ite c!1626 (_2!348 lt!4169) call!470)) (ite (or c!1678 c!1675) (_values!1625 (ite c!1626 (_2!348 lt!4169) call!470)) (array!880 (store (arr!422 (_values!1625 (ite c!1626 (_2!348 lt!4169) call!470))) (index!2288 lt!4322) (ValueCellFull!224 (ite c!1626 (minValue!1564 (v!1401 (underlying!28 thiss!848))) (ite c!1625 (zeroValue!1564 (v!1401 (underlying!28 thiss!848))) (minValue!1564 (v!1401 (underlying!28 thiss!848))))))) (size!511 (_values!1625 (ite c!1626 (_2!348 lt!4169) call!470))))) (mask!4537 (ite c!1626 (_2!348 lt!4169) call!470)) (extraKeys!1541 (ite c!1626 (_2!348 lt!4169) call!470)) (zeroValue!1564 (ite c!1626 (_2!348 lt!4169) call!470)) (minValue!1564 (ite c!1626 (_2!348 lt!4169) call!470)) #b00000000000000000000000000000000 (defaultEntry!1627 (ite c!1626 (_2!348 lt!4169) call!470))))))

(declare-fun b!17042 () Bool)

(declare-fun Unit!354 () Unit!349)

(assert (=> b!17042 (= e!10604 Unit!354)))

(declare-fun lt!4317 () Unit!349)

(assert (=> b!17042 (= lt!4317 call!525)))

(assert (=> b!17042 (= lt!4329 call!541)))

(assert (=> b!17042 (= c!1667 ((_ is MissingZero!42) lt!4329))))

(assert (=> b!17042 e!10596))

(declare-fun lt!4324 () Unit!349)

(assert (=> b!17042 (= lt!4324 lt!4317)))

(assert (=> b!17042 false))

(declare-fun b!17043 () Bool)

(declare-fun lt!4330 () tuple2!696)

(assert (=> b!17043 (= lt!4330 call!542)))

(assert (=> b!17043 (= e!10600 (tuple2!697 (_1!348 lt!4330) (_2!348 lt!4330)))))

(declare-fun b!17044 () Bool)

(declare-fun res!12452 () Bool)

(assert (=> b!17044 (=> (not res!12452) (not e!10603))))

(assert (=> b!17044 (= res!12452 call!543)))

(assert (=> b!17044 (= e!10598 e!10603)))

(declare-fun b!17045 () Bool)

(assert (=> b!17045 (= e!10609 e!10599)))

(declare-fun res!12457 () Bool)

(assert (=> b!17045 (= res!12457 call!531)))

(assert (=> b!17045 (=> (not res!12457) (not e!10599))))

(declare-fun res!12450 () Bool)

(declare-fun b!17046 () Bool)

(assert (=> b!17046 (= res!12450 (= (select (arr!423 (_keys!3052 (ite c!1626 (_2!348 lt!4169) call!470))) (index!2290 lt!4329)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!17046 (=> (not res!12450) (not e!10599))))

(declare-fun b!17047 () Bool)

(declare-fun +!33 (ListLongMap!521 tuple2!700) ListLongMap!521)

(assert (=> b!17047 (= e!10602 (= call!546 (+!33 call!536 (tuple2!701 (ite c!1626 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1625 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!1626 (minValue!1564 (v!1401 (underlying!28 thiss!848))) (ite c!1625 (zeroValue!1564 (v!1401 (underlying!28 thiss!848))) (minValue!1564 (v!1401 (underlying!28 thiss!848)))))))))))

(declare-fun bm!540 () Bool)

(assert (=> bm!540 (= call!526 call!545)))

(declare-fun bm!541 () Bool)

(assert (=> bm!541 (= call!548 call!534)))

(declare-fun b!17048 () Bool)

(assert (=> b!17048 (= e!10595 e!10597)))

(declare-fun c!1669 () Bool)

(assert (=> b!17048 (= c!1669 (_1!348 lt!4318))))

(declare-fun bm!542 () Bool)

(assert (=> bm!542 (= call!537 call!535)))

(declare-fun b!17049 () Bool)

(assert (=> b!17049 (= e!10613 (not call!526))))

(declare-fun b!17050 () Bool)

(assert (=> b!17050 (= e!10611 call!539)))

(declare-fun bm!543 () Bool)

(assert (=> bm!543 (= call!534 (+!33 (ite c!1678 call!532 call!539) (ite c!1678 (ite c!1672 (tuple2!701 #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!1626 (minValue!1564 (v!1401 (underlying!28 thiss!848))) (ite c!1625 (zeroValue!1564 (v!1401 (underlying!28 thiss!848))) (minValue!1564 (v!1401 (underlying!28 thiss!848)))))) (tuple2!701 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1626 (minValue!1564 (v!1401 (underlying!28 thiss!848))) (ite c!1625 (zeroValue!1564 (v!1401 (underlying!28 thiss!848))) (minValue!1564 (v!1401 (underlying!28 thiss!848))))))) (tuple2!701 (ite c!1626 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1625 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!1626 (minValue!1564 (v!1401 (underlying!28 thiss!848))) (ite c!1625 (zeroValue!1564 (v!1401 (underlying!28 thiss!848))) (minValue!1564 (v!1401 (underlying!28 thiss!848)))))))))))

(declare-fun bm!544 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!1 (array!881 array!879 (_ BitVec 32) (_ BitVec 32) V!955 V!955 (_ BitVec 64) Int) Unit!349)

(assert (=> bm!544 (= call!525 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!1 (_keys!3052 (ite c!1626 (_2!348 lt!4169) call!470)) (_values!1625 (ite c!1626 (_2!348 lt!4169) call!470)) (mask!4537 (ite c!1626 (_2!348 lt!4169) call!470)) (extraKeys!1541 (ite c!1626 (_2!348 lt!4169) call!470)) (zeroValue!1564 (ite c!1626 (_2!348 lt!4169) call!470)) (minValue!1564 (ite c!1626 (_2!348 lt!4169) call!470)) (ite c!1626 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!1625 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!1627 (ite c!1626 (_2!348 lt!4169) call!470))))))

(declare-fun b!17051 () Bool)

(declare-fun res!12460 () Bool)

(assert (=> b!17051 (=> (not res!12460) (not e!10613))))

(assert (=> b!17051 (= res!12460 call!531)))

(assert (=> b!17051 (= e!10596 e!10613)))

(declare-fun bm!545 () Bool)

(assert (=> bm!545 (= call!547 call!533)))

(declare-fun b!17052 () Bool)

(declare-fun res!12461 () Bool)

(assert (=> b!17052 (= res!12461 call!547)))

(assert (=> b!17052 (=> (not res!12461) (not e!10594))))

(assert (= (and d!3355 c!1678) b!17031))

(assert (= (and d!3355 (not c!1678)) b!17034))

(assert (= (and b!17031 c!1672) b!17018))

(assert (= (and b!17031 (not c!1672)) b!17036))

(assert (= (or b!17018 b!17036) bm!523))

(assert (= (or b!17018 b!17036) bm!525))

(assert (= (or b!17018 b!17036) bm!541))

(assert (= (and b!17034 c!1675) b!17016))

(assert (= (and b!17034 (not c!1675)) b!17026))

(assert (= (and b!17016 c!1677) b!17017))

(assert (= (and b!17016 (not c!1677)) b!17024))

(assert (= (and b!17017 res!12462) b!17020))

(assert (= (and b!17020 res!12454) b!17015))

(assert (= (and b!17024 c!1674) b!17044))

(assert (= (and b!17024 (not c!1674)) b!17035))

(assert (= (and b!17044 res!12452) b!17037))

(assert (= (and b!17037 res!12453) b!17019))

(assert (= (and b!17035 c!1673) b!17029))

(assert (= (and b!17035 (not c!1673)) b!17025))

(assert (= (and b!17029 res!12451) b!17013))

(assert (= (and b!17013 res!12459) b!17041))

(assert (= (or b!17044 b!17029) bm!538))

(assert (= (or b!17019 b!17041) bm!522))

(assert (= (or b!17020 bm!538) bm!530))

(assert (= (or b!17017 b!17024) bm!535))

(assert (= (and b!17026 c!1668) b!17040))

(assert (= (and b!17026 (not c!1668)) b!17022))

(assert (= (and b!17022 c!1670) b!17043))

(assert (= (and b!17022 (not c!1670)) b!17038))

(assert (= (and b!17038 c!1679) b!17030))

(assert (= (and b!17038 (not c!1679)) b!17042))

(assert (= (and b!17030 res!12456) b!17052))

(assert (= (and b!17052 res!12461) b!17027))

(assert (= (and b!17042 c!1667) b!17051))

(assert (= (and b!17042 (not c!1667)) b!17014))

(assert (= (and b!17051 res!12460) b!17021))

(assert (= (and b!17021 res!12463) b!17049))

(assert (= (and b!17014 c!1671) b!17045))

(assert (= (and b!17014 (not c!1671)) b!17028))

(assert (= (and b!17045 res!12457) b!17046))

(assert (= (and b!17046 res!12450) b!17023))

(assert (= (or b!17051 b!17045) bm!534))

(assert (= (or b!17049 b!17023) bm!540))

(assert (= (or b!17052 bm!534) bm!545))

(assert (= (or b!17030 b!17042) bm!536))

(assert (= (or b!17040 b!17043) bm!528))

(assert (= (or b!17017 b!17030) bm!531))

(assert (= (or bm!522 bm!540) bm!529))

(assert (= (or b!17024 b!17042) bm!544))

(assert (= (or b!17016 b!17038) bm!542))

(assert (= (or bm!535 bm!536) bm!533))

(assert (= (or bm!530 bm!545) bm!537))

(assert (= (or b!17016 b!17038) bm!526))

(assert (= (and bm!526 c!1676) b!17032))

(assert (= (and bm!526 (not c!1676)) b!17050))

(assert (= (or bm!523 bm!542) bm!539))

(assert (= (or bm!525 b!17038 b!17050) bm!532))

(assert (= (or bm!541 b!17038) bm!543))

(assert (= (and d!3355 res!12458) b!17048))

(assert (= (and b!17048 c!1669) b!17039))

(assert (= (and b!17048 (not c!1669)) b!17033))

(assert (= (and b!17039 res!12455) b!17047))

(assert (= (or b!17047 b!17033) bm!527))

(assert (= (or b!17039 b!17047 b!17033) bm!524))

(declare-fun m!11929 () Bool)

(assert (=> bm!524 m!11929))

(declare-fun m!11931 () Bool)

(assert (=> bm!527 m!11931))

(declare-fun m!11933 () Bool)

(assert (=> b!17015 m!11933))

(declare-fun m!11935 () Bool)

(assert (=> b!17036 m!11935))

(declare-fun m!11937 () Bool)

(assert (=> b!17038 m!11937))

(declare-fun m!11939 () Bool)

(assert (=> b!17038 m!11939))

(declare-fun m!11941 () Bool)

(assert (=> b!17038 m!11941))

(declare-fun m!11943 () Bool)

(assert (=> b!17038 m!11943))

(declare-fun m!11945 () Bool)

(assert (=> b!17038 m!11945))

(assert (=> b!17038 m!11941))

(assert (=> b!17038 m!11943))

(declare-fun m!11947 () Bool)

(assert (=> b!17038 m!11947))

(declare-fun m!11949 () Bool)

(assert (=> bm!532 m!11949))

(declare-fun m!11951 () Bool)

(assert (=> b!17013 m!11951))

(declare-fun m!11953 () Bool)

(assert (=> bm!526 m!11953))

(declare-fun m!11955 () Bool)

(assert (=> bm!533 m!11955))

(declare-fun m!11957 () Bool)

(assert (=> b!17039 m!11957))

(declare-fun m!11959 () Bool)

(assert (=> b!17046 m!11959))

(declare-fun m!11961 () Bool)

(assert (=> bm!531 m!11961))

(declare-fun m!11963 () Bool)

(assert (=> b!17047 m!11963))

(assert (=> bm!539 m!11937))

(declare-fun m!11965 () Bool)

(assert (=> bm!539 m!11965))

(declare-fun m!11967 () Bool)

(assert (=> b!17037 m!11967))

(assert (=> b!17034 m!11955))

(declare-fun m!11969 () Bool)

(assert (=> bm!543 m!11969))

(declare-fun m!11971 () Bool)

(assert (=> b!17027 m!11971))

(declare-fun m!11973 () Bool)

(assert (=> b!17018 m!11973))

(declare-fun m!11975 () Bool)

(assert (=> bm!529 m!11975))

(declare-fun m!11977 () Bool)

(assert (=> bm!544 m!11977))

(declare-fun m!11979 () Bool)

(assert (=> b!17021 m!11979))

(declare-fun m!11981 () Bool)

(assert (=> d!3355 m!11981))

(declare-fun m!11983 () Bool)

(assert (=> d!3355 m!11983))

(declare-fun m!11985 () Bool)

(assert (=> bm!528 m!11985))

(declare-fun m!11987 () Bool)

(assert (=> bm!537 m!11987))

(assert (=> bm!466 d!3355))

(assert (=> d!3331 d!3345))

(declare-fun d!3357 () Bool)

(declare-fun e!10620 () Bool)

(assert (=> d!3357 e!10620))

(declare-fun res!12466 () Bool)

(assert (=> d!3357 (=> (not res!12466) (not e!10620))))

(declare-fun lt!4341 () (_ BitVec 32))

(assert (=> d!3357 (= res!12466 (validMask!0 lt!4341))))

(declare-datatypes ((tuple2!702 0))(
  ( (tuple2!703 (_1!352 Unit!349) (_2!352 (_ BitVec 32))) )
))
(declare-fun e!10619 () tuple2!702)

(assert (=> d!3357 (= lt!4341 (_2!352 e!10619))))

(declare-fun c!1682 () Bool)

(declare-fun lt!4342 () tuple2!702)

(assert (=> d!3357 (= c!1682 (and (bvsgt (_2!352 lt!4342) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!48 (v!1401 (underlying!28 thiss!848)))) (_2!352 lt!4342)) (bvsge (bvadd (bvand (bvashr (_2!352 lt!4342) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!48 (v!1401 (underlying!28 thiss!848))))))))

(declare-fun Unit!355 () Unit!349)

(declare-fun Unit!356 () Unit!349)

(assert (=> d!3357 (= lt!4342 (ite (and (bvsge (bvmul #b00000000000000000000000000000010 (bvadd (_size!48 (v!1401 (underlying!28 thiss!848))) (_vacant!48 (v!1401 (underlying!28 thiss!848))))) (mask!4537 (v!1401 (underlying!28 thiss!848)))) (bvsle (bvmul #b00000000000000000000000000000101 (_vacant!48 (v!1401 (underlying!28 thiss!848)))) (mask!4537 (v!1401 (underlying!28 thiss!848))))) (tuple2!703 Unit!355 (bvand (bvadd (bvshl (mask!4537 (v!1401 (underlying!28 thiss!848))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (tuple2!703 Unit!356 (mask!4537 (v!1401 (underlying!28 thiss!848))))))))

(assert (=> d!3357 (validMask!0 (mask!4537 (v!1401 (underlying!28 thiss!848))))))

(assert (=> d!3357 (= (computeNewMask!1 thiss!848 (mask!4537 (v!1401 (underlying!28 thiss!848))) (_vacant!48 (v!1401 (underlying!28 thiss!848))) (_size!48 (v!1401 (underlying!28 thiss!848)))) lt!4341)))

(declare-fun b!17059 () Bool)

(declare-fun computeNewMaskWhile!1 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!702)

(assert (=> b!17059 (= e!10619 (computeNewMaskWhile!1 (_size!48 (v!1401 (underlying!28 thiss!848))) (_vacant!48 (v!1401 (underlying!28 thiss!848))) (mask!4537 (v!1401 (underlying!28 thiss!848))) (_2!352 lt!4342)))))

(declare-fun b!17060 () Bool)

(declare-fun Unit!357 () Unit!349)

(assert (=> b!17060 (= e!10619 (tuple2!703 Unit!357 (_2!352 lt!4342)))))

(declare-fun b!17061 () Bool)

(assert (=> b!17061 (= e!10620 (bvsle (_size!48 (v!1401 (underlying!28 thiss!848))) (bvadd lt!4341 #b00000000000000000000000000000001)))))

(assert (= (and d!3357 c!1682) b!17059))

(assert (= (and d!3357 (not c!1682)) b!17060))

(assert (= (and d!3357 res!12466) b!17061))

(declare-fun m!11989 () Bool)

(assert (=> d!3357 m!11989))

(declare-fun m!11991 () Bool)

(assert (=> d!3357 m!11991))

(declare-fun m!11993 () Bool)

(assert (=> b!17059 m!11993))

(assert (=> d!3331 d!3357))

(assert (=> d!3331 d!3337))

(declare-fun b!17090 () Bool)

(declare-fun e!10641 () Bool)

(declare-fun e!10639 () Bool)

(assert (=> b!17090 (= e!10641 e!10639)))

(declare-fun res!12472 () Bool)

(assert (=> b!17090 (=> (not res!12472) (not e!10639))))

(declare-fun lt!4430 () tuple2!696)

(assert (=> b!17090 (= res!12472 (valid!26 (_2!348 lt!4430)))))

(declare-fun c!1695 () Bool)

(declare-fun call!576 () ListLongMap!521)

(declare-fun bm!572 () Bool)

(declare-fun call!580 () ListLongMap!521)

(declare-fun lt!4409 () V!955)

(declare-fun lt!4438 () (_ BitVec 64))

(declare-fun call!585 () ListLongMap!521)

(assert (=> bm!572 (= call!585 (+!33 (ite c!1695 call!580 call!576) (tuple2!701 lt!4438 lt!4409)))))

(declare-fun lt!4434 () (_ BitVec 64))

(declare-fun lt!4423 () ListLongMap!521)

(declare-fun lt!4424 () ListLongMap!521)

(declare-fun bm!573 () Bool)

(assert (=> bm!573 (= call!576 (+!33 (ite c!1695 lt!4423 lt!4424) (ite c!1695 (tuple2!701 lt!4438 lt!4409) (tuple2!701 lt!4434 (minValue!1564 (v!1401 (underlying!28 thiss!848)))))))))

(declare-fun d!3359 () Bool)

(assert (=> d!3359 e!10641))

(declare-fun res!12471 () Bool)

(assert (=> d!3359 (=> res!12471 e!10641)))

(assert (=> d!3359 (= res!12471 (not (_1!348 lt!4430)))))

(declare-fun e!10640 () tuple2!696)

(assert (=> d!3359 (= lt!4430 e!10640)))

(declare-fun c!1700 () Bool)

(assert (=> d!3359 (= c!1700 (and (not (= lt!4438 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!4438 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!4408 () ListLongMap!521)

(assert (=> d!3359 (= lt!4408 (map!327 (v!1401 (_2!350 lt!4170))))))

(declare-fun get!325 (ValueCell!224 V!955) V!955)

(assert (=> d!3359 (= lt!4409 (get!325 (select (arr!422 (_values!1625 (v!1401 (underlying!28 thiss!848)))) (bvsub (size!512 (_keys!3052 (v!1401 (underlying!28 thiss!848)))) #b00000000000000000000000000000001)) (dynLambda!128 (defaultEntry!1627 (v!1401 (underlying!28 thiss!848))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3359 (= lt!4438 (select (arr!423 (_keys!3052 (v!1401 (underlying!28 thiss!848)))) (bvsub (size!512 (_keys!3052 (v!1401 (underlying!28 thiss!848)))) #b00000000000000000000000000000001)))))

(assert (=> d!3359 (valid!25 thiss!848)))

(assert (=> d!3359 (= (repackFrom!1 thiss!848 (v!1401 (_2!350 lt!4170)) (bvsub (size!512 (_keys!3052 (v!1401 (underlying!28 thiss!848)))) #b00000000000000000000000000000001)) lt!4430)))

(declare-fun b!17091 () Bool)

(declare-fun lt!4436 () tuple2!696)

(declare-fun call!583 () tuple2!696)

(assert (=> b!17091 (= lt!4436 call!583)))

(declare-fun e!10644 () tuple2!696)

(assert (=> b!17091 (= e!10644 (tuple2!697 (_1!348 lt!4436) (_2!348 lt!4436)))))

(declare-fun bm!574 () Bool)

(declare-fun lt!4407 () (_ BitVec 64))

(declare-fun call!587 () ListLongMap!521)

(declare-fun lt!4422 () (_ BitVec 64))

(assert (=> bm!574 (= call!587 (+!33 (ite c!1695 call!576 call!580) (ite c!1695 (tuple2!701 lt!4407 (zeroValue!1564 (v!1401 (underlying!28 thiss!848)))) (tuple2!701 lt!4422 (zeroValue!1564 (v!1401 (underlying!28 thiss!848)))))))))

(declare-fun call!579 () ListLongMap!521)

(declare-fun call!581 () ListLongMap!521)

(declare-fun bm!575 () Bool)

(declare-fun call!586 () ListLongMap!521)

(declare-fun lt!4425 () (_ BitVec 64))

(assert (=> bm!575 (= call!581 (+!33 (ite c!1695 call!586 call!579) (ite c!1695 (tuple2!701 lt!4425 (minValue!1564 (v!1401 (underlying!28 thiss!848)))) (tuple2!701 lt!4434 (minValue!1564 (v!1401 (underlying!28 thiss!848)))))))))

(declare-fun b!17092 () Bool)

(declare-fun e!10637 () tuple2!696)

(declare-fun lt!4414 () tuple2!696)

(assert (=> b!17092 (= e!10637 (tuple2!697 false (_2!348 lt!4414)))))

(declare-fun bm!576 () Bool)

(assert (=> bm!576 (= call!579 (+!33 (ite c!1695 lt!4423 lt!4424) (ite c!1695 (tuple2!701 lt!4407 (zeroValue!1564 (v!1401 (underlying!28 thiss!848)))) (tuple2!701 lt!4438 lt!4409))))))

(declare-fun b!17093 () Bool)

(declare-fun e!10642 () tuple2!696)

(declare-fun lt!4426 () tuple2!696)

(assert (=> b!17093 (= e!10642 (tuple2!697 (_1!348 lt!4426) (_2!348 lt!4426)))))

(declare-fun call!577 () ListLongMap!521)

(assert (=> b!17093 (= lt!4423 call!577)))

(assert (=> b!17093 (= lt!4407 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!4410 () Unit!349)

(declare-fun call!575 () Unit!349)

(assert (=> b!17093 (= lt!4410 call!575)))

(declare-fun call!584 () ListLongMap!521)

(assert (=> b!17093 (= call!587 call!584)))

(declare-fun lt!4417 () Unit!349)

(assert (=> b!17093 (= lt!4417 lt!4410)))

(declare-fun lt!4419 () ListLongMap!521)

(declare-fun call!578 () ListLongMap!521)

(assert (=> b!17093 (= lt!4419 call!578)))

(assert (=> b!17093 (= lt!4425 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!4428 () Unit!349)

(declare-fun call!582 () Unit!349)

(assert (=> b!17093 (= lt!4428 call!582)))

(assert (=> b!17093 (= call!581 call!585)))

(declare-fun lt!4418 () Unit!349)

(assert (=> b!17093 (= lt!4418 lt!4428)))

(assert (=> b!17093 (= lt!4426 call!583)))

(declare-fun lt!4427 () ListLongMap!521)

(declare-fun bm!577 () Bool)

(assert (=> bm!577 (= call!586 (+!33 (ite c!1695 lt!4419 lt!4427) (ite c!1695 (tuple2!701 lt!4438 lt!4409) (tuple2!701 lt!4422 (zeroValue!1564 (v!1401 (underlying!28 thiss!848)))))))))

(declare-fun b!17094 () Bool)

(assert (=> b!17094 (= e!10642 (tuple2!697 true (_2!348 lt!4414)))))

(assert (=> b!17094 (= lt!4427 call!577)))

(assert (=> b!17094 (= lt!4422 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!4412 () Unit!349)

(assert (=> b!17094 (= lt!4412 call!582)))

(assert (=> b!17094 (= call!587 call!578)))

(declare-fun lt!4415 () Unit!349)

(assert (=> b!17094 (= lt!4415 lt!4412)))

(assert (=> b!17094 (= lt!4424 call!584)))

(assert (=> b!17094 (= lt!4434 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!4429 () Unit!349)

(assert (=> b!17094 (= lt!4429 call!575)))

(assert (=> b!17094 (= call!581 call!585)))

(declare-fun lt!4421 () Unit!349)

(assert (=> b!17094 (= lt!4421 lt!4429)))

(declare-fun b!17095 () Bool)

(assert (=> b!17095 false))

(declare-fun lt!4433 () Unit!349)

(declare-fun lt!4437 () Unit!349)

(assert (=> b!17095 (= lt!4433 lt!4437)))

(declare-fun lt!4432 () (_ BitVec 32))

(assert (=> b!17095 (not (arrayContainsKey!0 (_keys!3052 (v!1401 (underlying!28 thiss!848))) lt!4438 lt!4432))))

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!881 (_ BitVec 32) (_ BitVec 64) List!529) Unit!349)

(assert (=> b!17095 (= lt!4437 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3052 (v!1401 (underlying!28 thiss!848))) lt!4432 lt!4438 (Cons!525 lt!4438 Nil!526)))))

(assert (=> b!17095 (= lt!4432 (bvadd (bvsub (size!512 (_keys!3052 (v!1401 (underlying!28 thiss!848)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun lt!4413 () Unit!349)

(declare-fun lt!4411 () Unit!349)

(assert (=> b!17095 (= lt!4413 lt!4411)))

(assert (=> b!17095 (arrayNoDuplicates!0 (_keys!3052 (v!1401 (underlying!28 thiss!848))) (bvsub (size!512 (_keys!3052 (v!1401 (underlying!28 thiss!848)))) #b00000000000000000000000000000001) Nil!526)))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!881 (_ BitVec 32) (_ BitVec 32)) Unit!349)

(assert (=> b!17095 (= lt!4411 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3052 (v!1401 (underlying!28 thiss!848))) #b00000000000000000000000000000000 (bvsub (size!512 (_keys!3052 (v!1401 (underlying!28 thiss!848)))) #b00000000000000000000000000000001)))))

(declare-fun lt!4420 () Unit!349)

(declare-fun lt!4431 () Unit!349)

(assert (=> b!17095 (= lt!4420 lt!4431)))

(declare-fun e!10638 () Bool)

(assert (=> b!17095 e!10638))

(declare-fun c!1699 () Bool)

(assert (=> b!17095 (= c!1699 (and (not (= lt!4438 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!4438 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!4435 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!1 (array!881 array!879 (_ BitVec 32) (_ BitVec 32) V!955 V!955 (_ BitVec 64) (_ BitVec 32) Int) Unit!349)

(assert (=> b!17095 (= lt!4431 (lemmaListMapContainsThenArrayContainsFrom!1 (_keys!3052 (v!1401 (underlying!28 thiss!848))) (_values!1625 (v!1401 (underlying!28 thiss!848))) (mask!4537 (v!1401 (underlying!28 thiss!848))) (extraKeys!1541 (v!1401 (underlying!28 thiss!848))) (zeroValue!1564 (v!1401 (underlying!28 thiss!848))) (minValue!1564 (v!1401 (underlying!28 thiss!848))) lt!4438 lt!4435 (defaultEntry!1627 (v!1401 (underlying!28 thiss!848)))))))

(assert (=> b!17095 (= lt!4435 (bvadd (bvsub (size!512 (_keys!3052 (v!1401 (underlying!28 thiss!848)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun e!10643 () Unit!349)

(declare-fun Unit!358 () Unit!349)

(assert (=> b!17095 (= e!10643 Unit!358)))

(declare-fun bm!578 () Bool)

(assert (=> bm!578 (= call!583 (repackFrom!1 thiss!848 (ite c!1700 (_2!348 lt!4414) (v!1401 (_2!350 lt!4170))) (bvsub (bvsub (size!512 (_keys!3052 (v!1401 (underlying!28 thiss!848)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun b!17096 () Bool)

(assert (=> b!17096 (= c!1695 (bvsgt (bvsub (size!512 (_keys!3052 (v!1401 (underlying!28 thiss!848)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!17096 (= e!10637 e!10642)))

(declare-fun b!17097 () Bool)

(assert (=> b!17097 (= e!10644 (tuple2!697 true (v!1401 (_2!350 lt!4170))))))

(declare-fun bm!579 () Bool)

(assert (=> bm!579 (= call!578 (+!33 (ite c!1695 call!577 call!586) (ite c!1695 (tuple2!701 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1564 (v!1401 (underlying!28 thiss!848)))) (tuple2!701 lt!4438 lt!4409))))))

(declare-fun bm!580 () Bool)

(declare-fun addCommutativeForDiffKeys!1 (ListLongMap!521 (_ BitVec 64) V!955 (_ BitVec 64) V!955) Unit!349)

(assert (=> bm!580 (= call!575 (addCommutativeForDiffKeys!1 (ite c!1695 lt!4423 lt!4424) lt!4438 lt!4409 (ite c!1695 lt!4407 lt!4434) (ite c!1695 (zeroValue!1564 (v!1401 (underlying!28 thiss!848))) (minValue!1564 (v!1401 (underlying!28 thiss!848))))))))

(declare-fun b!17098 () Bool)

(assert (=> b!17098 (= e!10639 (= (map!327 (_2!348 lt!4430)) (map!327 (v!1401 (underlying!28 thiss!848)))))))

(declare-fun b!17099 () Bool)

(assert (=> b!17099 (= e!10638 (arrayContainsKey!0 (_keys!3052 (v!1401 (underlying!28 thiss!848))) lt!4438 lt!4435))))

(declare-fun b!17100 () Bool)

(assert (=> b!17100 (= e!10640 e!10637)))

(assert (=> b!17100 (= lt!4414 (update!2 (v!1401 (_2!350 lt!4170)) lt!4438 lt!4409))))

(declare-fun c!1697 () Bool)

(assert (=> b!17100 (= c!1697 (contains!207 lt!4408 lt!4438))))

(declare-fun lt!4416 () Unit!349)

(assert (=> b!17100 (= lt!4416 e!10643)))

(declare-fun c!1696 () Bool)

(assert (=> b!17100 (= c!1696 (_1!348 lt!4414))))

(declare-fun b!17101 () Bool)

(assert (=> b!17101 (= e!10640 e!10644)))

(declare-fun c!1698 () Bool)

(assert (=> b!17101 (= c!1698 (bvsgt (bvsub (size!512 (_keys!3052 (v!1401 (underlying!28 thiss!848)))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!581 () Bool)

(assert (=> bm!581 (= call!584 (+!33 (ite c!1695 call!579 call!577) (ite c!1695 (tuple2!701 lt!4438 lt!4409) (tuple2!701 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1564 (v!1401 (underlying!28 thiss!848)))))))))

(declare-fun b!17102 () Bool)

(assert (=> b!17102 (= e!10638 (ite (= lt!4438 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!1541 (v!1401 (underlying!28 thiss!848))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1541 (v!1401 (underlying!28 thiss!848))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!17103 () Bool)

(declare-fun Unit!359 () Unit!349)

(assert (=> b!17103 (= e!10643 Unit!359)))

(declare-fun bm!582 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!11 (array!881 array!879 (_ BitVec 32) (_ BitVec 32) V!955 V!955 (_ BitVec 32) Int) ListLongMap!521)

(assert (=> bm!582 (= call!577 (getCurrentListMapNoExtraKeys!11 (_keys!3052 (v!1401 (underlying!28 thiss!848))) (_values!1625 (v!1401 (underlying!28 thiss!848))) (mask!4537 (v!1401 (underlying!28 thiss!848))) (extraKeys!1541 (v!1401 (underlying!28 thiss!848))) (zeroValue!1564 (v!1401 (underlying!28 thiss!848))) (minValue!1564 (v!1401 (underlying!28 thiss!848))) (bvadd (bvsub (size!512 (_keys!3052 (v!1401 (underlying!28 thiss!848)))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) (defaultEntry!1627 (v!1401 (underlying!28 thiss!848)))))))

(declare-fun bm!583 () Bool)

(assert (=> bm!583 (= call!582 (addCommutativeForDiffKeys!1 (ite c!1695 lt!4419 lt!4427) lt!4438 lt!4409 (ite c!1695 lt!4425 lt!4422) (ite c!1695 (minValue!1564 (v!1401 (underlying!28 thiss!848))) (zeroValue!1564 (v!1401 (underlying!28 thiss!848))))))))

(declare-fun bm!584 () Bool)

(assert (=> bm!584 (= call!580 (+!33 (ite c!1695 lt!4419 lt!4427) (ite c!1695 (tuple2!701 lt!4425 (minValue!1564 (v!1401 (underlying!28 thiss!848)))) (tuple2!701 lt!4438 lt!4409))))))

(assert (= (and d!3359 c!1700) b!17100))

(assert (= (and d!3359 (not c!1700)) b!17101))

(assert (= (and b!17100 c!1697) b!17095))

(assert (= (and b!17100 (not c!1697)) b!17103))

(assert (= (and b!17095 c!1699) b!17099))

(assert (= (and b!17095 (not c!1699)) b!17102))

(assert (= (and b!17100 c!1696) b!17096))

(assert (= (and b!17100 (not c!1696)) b!17092))

(assert (= (and b!17096 c!1695) b!17093))

(assert (= (and b!17096 (not c!1695)) b!17094))

(assert (= (or b!17093 b!17094) bm!580))

(assert (= (or b!17093 b!17094) bm!576))

(assert (= (or b!17093 b!17094) bm!573))

(assert (= (or b!17093 b!17094) bm!583))

(assert (= (or b!17093 b!17094) bm!577))

(assert (= (or b!17093 b!17094) bm!582))

(assert (= (or b!17093 b!17094) bm!584))

(assert (= (or b!17093 b!17094) bm!574))

(assert (= (or b!17093 b!17094) bm!572))

(assert (= (or b!17093 b!17094) bm!579))

(assert (= (or b!17093 b!17094) bm!575))

(assert (= (or b!17093 b!17094) bm!581))

(assert (= (and b!17101 c!1698) b!17091))

(assert (= (and b!17101 (not c!1698)) b!17097))

(assert (= (or b!17093 b!17091) bm!578))

(assert (= (and d!3359 (not res!12471)) b!17090))

(assert (= (and b!17090 res!12472) b!17098))

(declare-fun b_lambda!1427 () Bool)

(assert (=> (not b_lambda!1427) (not d!3359)))

(assert (=> d!3359 t!3162))

(declare-fun b_and!1229 () Bool)

(assert (= b_and!1227 (and (=> t!3162 result!999) b_and!1229)))

(declare-fun m!11995 () Bool)

(assert (=> b!17090 m!11995))

(declare-fun m!11997 () Bool)

(assert (=> bm!575 m!11997))

(declare-fun m!11999 () Bool)

(assert (=> b!17099 m!11999))

(declare-fun m!12001 () Bool)

(assert (=> bm!577 m!12001))

(declare-fun m!12003 () Bool)

(assert (=> bm!581 m!12003))

(declare-fun m!12005 () Bool)

(assert (=> b!17098 m!12005))

(assert (=> b!17098 m!11915))

(declare-fun m!12007 () Bool)

(assert (=> bm!583 m!12007))

(declare-fun m!12009 () Bool)

(assert (=> bm!574 m!12009))

(declare-fun m!12011 () Bool)

(assert (=> bm!584 m!12011))

(declare-fun m!12013 () Bool)

(assert (=> bm!576 m!12013))

(declare-fun m!12015 () Bool)

(assert (=> b!17100 m!12015))

(declare-fun m!12017 () Bool)

(assert (=> b!17100 m!12017))

(declare-fun m!12019 () Bool)

(assert (=> d!3359 m!12019))

(declare-fun m!12021 () Bool)

(assert (=> d!3359 m!12021))

(assert (=> d!3359 m!12021))

(assert (=> d!3359 m!11895))

(declare-fun m!12023 () Bool)

(assert (=> d!3359 m!12023))

(declare-fun m!12025 () Bool)

(assert (=> d!3359 m!12025))

(assert (=> d!3359 m!11895))

(assert (=> d!3359 m!11809))

(declare-fun m!12027 () Bool)

(assert (=> bm!582 m!12027))

(declare-fun m!12029 () Bool)

(assert (=> bm!580 m!12029))

(declare-fun m!12031 () Bool)

(assert (=> bm!572 m!12031))

(declare-fun m!12033 () Bool)

(assert (=> b!17095 m!12033))

(declare-fun m!12035 () Bool)

(assert (=> b!17095 m!12035))

(declare-fun m!12037 () Bool)

(assert (=> b!17095 m!12037))

(declare-fun m!12039 () Bool)

(assert (=> b!17095 m!12039))

(declare-fun m!12041 () Bool)

(assert (=> b!17095 m!12041))

(declare-fun m!12043 () Bool)

(assert (=> bm!579 m!12043))

(declare-fun m!12045 () Bool)

(assert (=> bm!573 m!12045))

(declare-fun m!12047 () Bool)

(assert (=> bm!578 m!12047))

(assert (=> b!16862 d!3359))

(declare-fun b!17113 () Bool)

(declare-fun res!12482 () Bool)

(declare-fun e!10647 () Bool)

(assert (=> b!17113 (=> (not res!12482) (not e!10647))))

(declare-fun size!517 (LongMapFixedSize!34) (_ BitVec 32))

(assert (=> b!17113 (= res!12482 (bvsge (size!517 (v!1401 (underlying!28 (_2!345 lt!4141)))) (_size!48 (v!1401 (underlying!28 (_2!345 lt!4141))))))))

(declare-fun b!17114 () Bool)

(declare-fun res!12483 () Bool)

(assert (=> b!17114 (=> (not res!12483) (not e!10647))))

(assert (=> b!17114 (= res!12483 (= (size!517 (v!1401 (underlying!28 (_2!345 lt!4141)))) (bvadd (_size!48 (v!1401 (underlying!28 (_2!345 lt!4141)))) (bvsdiv (bvadd (extraKeys!1541 (v!1401 (underlying!28 (_2!345 lt!4141)))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!3361 () Bool)

(declare-fun res!12481 () Bool)

(assert (=> d!3361 (=> (not res!12481) (not e!10647))))

(assert (=> d!3361 (= res!12481 (validMask!0 (mask!4537 (v!1401 (underlying!28 (_2!345 lt!4141))))))))

(assert (=> d!3361 (= (simpleValid!8 (v!1401 (underlying!28 (_2!345 lt!4141)))) e!10647)))

(declare-fun b!17115 () Bool)

(assert (=> b!17115 (= e!10647 (and (bvsge (extraKeys!1541 (v!1401 (underlying!28 (_2!345 lt!4141)))) #b00000000000000000000000000000000) (bvsle (extraKeys!1541 (v!1401 (underlying!28 (_2!345 lt!4141)))) #b00000000000000000000000000000011) (bvsge (_vacant!48 (v!1401 (underlying!28 (_2!345 lt!4141)))) #b00000000000000000000000000000000)))))

(declare-fun b!17112 () Bool)

(declare-fun res!12484 () Bool)

(assert (=> b!17112 (=> (not res!12484) (not e!10647))))

(assert (=> b!17112 (= res!12484 (and (= (size!511 (_values!1625 (v!1401 (underlying!28 (_2!345 lt!4141))))) (bvadd (mask!4537 (v!1401 (underlying!28 (_2!345 lt!4141)))) #b00000000000000000000000000000001)) (= (size!512 (_keys!3052 (v!1401 (underlying!28 (_2!345 lt!4141))))) (size!511 (_values!1625 (v!1401 (underlying!28 (_2!345 lt!4141)))))) (bvsge (_size!48 (v!1401 (underlying!28 (_2!345 lt!4141)))) #b00000000000000000000000000000000) (bvsle (_size!48 (v!1401 (underlying!28 (_2!345 lt!4141)))) (bvadd (mask!4537 (v!1401 (underlying!28 (_2!345 lt!4141)))) #b00000000000000000000000000000001))))))

(assert (= (and d!3361 res!12481) b!17112))

(assert (= (and b!17112 res!12484) b!17113))

(assert (= (and b!17113 res!12482) b!17114))

(assert (= (and b!17114 res!12483) b!17115))

(declare-fun m!12049 () Bool)

(assert (=> b!17113 m!12049))

(assert (=> b!17114 m!12049))

(declare-fun m!12051 () Bool)

(assert (=> d!3361 m!12051))

(assert (=> d!3341 d!3361))

(declare-fun b!17116 () Bool)

(declare-fun res!12494 () Bool)

(declare-fun lt!4461 () SeekEntryResult!42)

(assert (=> b!17116 (= res!12494 (= (select (arr!423 (_keys!3052 call!469)) (index!2290 lt!4461)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!10664 () Bool)

(assert (=> b!17116 (=> (not res!12494) (not e!10664))))

(declare-fun b!17117 () Bool)

(declare-fun c!1705 () Bool)

(declare-fun lt!4458 () SeekEntryResult!42)

(assert (=> b!17117 (= c!1705 ((_ is MissingVacant!42) lt!4458))))

(declare-fun e!10650 () Bool)

(declare-fun e!10663 () Bool)

(assert (=> b!17117 (= e!10650 e!10663)))

(declare-fun b!17118 () Bool)

(declare-fun e!10660 () Bool)

(declare-fun lt!4464 () SeekEntryResult!42)

(assert (=> b!17118 (= e!10660 (= (select (arr!423 (_keys!3052 call!469)) (index!2288 lt!4464)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!17119 () Bool)

(declare-fun lt!4439 () Unit!349)

(declare-fun e!10659 () Unit!349)

(assert (=> b!17119 (= lt!4439 e!10659)))

(declare-fun c!1711 () Bool)

(declare-fun call!603 () Bool)

(assert (=> b!17119 (= c!1711 call!603)))

(declare-fun e!10662 () tuple2!696)

(assert (=> b!17119 (= e!10662 (tuple2!697 false call!469))))

(declare-fun bm!585 () Bool)

(declare-fun call!593 () Bool)

(declare-fun call!608 () Bool)

(assert (=> bm!585 (= call!593 call!608)))

(declare-fun b!17120 () Bool)

(declare-fun Unit!360 () Unit!349)

(assert (=> b!17120 (= e!10659 Unit!360)))

(declare-fun lt!4449 () Unit!349)

(declare-fun call!601 () Unit!349)

(assert (=> b!17120 (= lt!4449 call!601)))

(declare-fun call!607 () SeekEntryResult!42)

(assert (=> b!17120 (= lt!4464 call!607)))

(declare-fun res!12497 () Bool)

(assert (=> b!17120 (= res!12497 ((_ is Found!42) lt!4464))))

(assert (=> b!17120 (=> (not res!12497) (not e!10660))))

(assert (=> b!17120 e!10660))

(declare-fun lt!4443 () Unit!349)

(assert (=> b!17120 (= lt!4443 lt!4449)))

(assert (=> b!17120 false))

(declare-fun b!17121 () Bool)

(declare-fun lt!4463 () Unit!349)

(declare-fun lt!4442 () Unit!349)

(assert (=> b!17121 (= lt!4463 lt!4442)))

(declare-fun call!611 () ListLongMap!521)

(declare-fun call!591 () ListLongMap!521)

(assert (=> b!17121 (= call!611 call!591)))

(declare-fun lt!4440 () (_ BitVec 32))

(assert (=> b!17121 (= lt!4442 (lemmaChangeZeroKeyThenAddPairToListMap!1 (_keys!3052 call!469) (_values!1625 call!469) (mask!4537 call!469) (extraKeys!1541 call!469) lt!4440 (zeroValue!1564 call!469) (zeroValue!1564 (v!1401 (underlying!28 thiss!848))) (minValue!1564 call!469) (defaultEntry!1627 call!469)))))

(assert (=> b!17121 (= lt!4440 (bvor (extraKeys!1541 call!469) #b00000000000000000000000000000001))))

(declare-fun e!10666 () tuple2!696)

(assert (=> b!17121 (= e!10666 (tuple2!697 true (LongMapFixedSize!35 (defaultEntry!1627 call!469) (mask!4537 call!469) (bvor (extraKeys!1541 call!469) #b00000000000000000000000000000001) (zeroValue!1564 (v!1401 (underlying!28 thiss!848))) (minValue!1564 call!469) (_size!48 call!469) (_keys!3052 call!469) (_values!1625 call!469) (_vacant!48 call!469))))))

(declare-fun bm!586 () Bool)

(declare-fun call!595 () ListLongMap!521)

(declare-fun call!598 () ListLongMap!521)

(assert (=> bm!586 (= call!595 call!598)))

(declare-fun b!17122 () Bool)

(declare-fun e!10657 () Bool)

(assert (=> b!17122 (= e!10657 (not call!593))))

(declare-fun b!17123 () Bool)

(declare-fun res!12489 () Bool)

(declare-fun call!590 () Bool)

(assert (=> b!17123 (= res!12489 call!590)))

(assert (=> b!17123 (=> (not res!12489) (not e!10660))))

(declare-fun b!17124 () Bool)

(declare-fun res!12498 () Bool)

(declare-fun e!10667 () Bool)

(assert (=> b!17124 (=> (not res!12498) (not e!10667))))

(assert (=> b!17124 (= res!12498 (= (select (arr!423 (_keys!3052 call!469)) (index!2287 lt!4458)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!17125 () Bool)

(declare-fun e!10655 () tuple2!696)

(declare-fun e!10654 () tuple2!696)

(assert (=> b!17125 (= e!10655 e!10654)))

(declare-fun c!1704 () Bool)

(declare-fun lt!4451 () SeekEntryResult!42)

(assert (=> b!17125 (= c!1704 ((_ is MissingZero!42) lt!4451))))

(declare-fun b!17126 () Bool)

(declare-fun e!10653 () Bool)

(declare-fun call!589 () Bool)

(assert (=> b!17126 (= e!10653 (not call!589))))

(declare-fun b!17127 () Bool)

(declare-fun lt!4455 () Unit!349)

(assert (=> b!17127 (= e!10659 lt!4455)))

(declare-fun call!588 () Unit!349)

(assert (=> b!17127 (= lt!4455 call!588)))

(assert (=> b!17127 (= lt!4461 call!607)))

(declare-fun c!1708 () Bool)

(assert (=> b!17127 (= c!1708 ((_ is MissingZero!42) lt!4461))))

(declare-fun e!10652 () Bool)

(assert (=> b!17127 e!10652))

(declare-fun bm!587 () Bool)

(declare-fun call!609 () ListLongMap!521)

(declare-fun lt!4447 () tuple2!696)

(assert (=> bm!587 (= call!609 (map!327 (_2!348 lt!4447)))))

(declare-fun b!17128 () Bool)

(declare-fun e!10661 () Bool)

(assert (=> b!17128 (= e!10661 ((_ is Undefined!42) lt!4461))))

(declare-fun bm!588 () Bool)

(declare-fun call!602 () ListLongMap!521)

(assert (=> bm!588 (= call!591 call!602)))

(declare-fun bm!589 () Bool)

(declare-fun c!1710 () Bool)

(declare-fun c!1709 () Bool)

(assert (=> bm!589 (= c!1710 c!1709)))

(declare-fun e!10665 () ListLongMap!521)

(assert (=> bm!589 (= call!603 (contains!207 e!10665 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!17129 () Bool)

(declare-fun c!1702 () Bool)

(assert (=> b!17129 (= c!1702 ((_ is MissingVacant!42) lt!4451))))

(assert (=> b!17129 (= e!10662 e!10655)))

(declare-fun bm!590 () Bool)

(declare-fun call!599 () ListLongMap!521)

(assert (=> bm!590 (= call!599 (map!327 call!469))))

(declare-fun b!17130 () Bool)

(declare-fun e!10648 () Bool)

(declare-fun lt!4452 () SeekEntryResult!42)

(assert (=> b!17130 (= e!10648 (= (select (arr!423 (_keys!3052 call!469)) (index!2288 lt!4452)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!605 () tuple2!696)

(declare-fun bm!591 () Bool)

(assert (=> bm!591 (= call!605 (updateHelperNewKey!1 call!469 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1564 (v!1401 (underlying!28 thiss!848))) (ite c!1702 (index!2290 lt!4451) (index!2287 lt!4451))))))

(declare-fun bm!592 () Bool)

(assert (=> bm!592 (= call!608 (arrayContainsKey!0 (_keys!3052 call!469) #b0000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000))))

(declare-fun b!17131 () Bool)

(assert (=> b!17131 (= e!10663 ((_ is Undefined!42) lt!4458))))

(declare-fun b!17132 () Bool)

(assert (=> b!17132 (= e!10661 e!10664)))

(declare-fun res!12486 () Bool)

(declare-fun call!606 () Bool)

(assert (=> b!17132 (= res!12486 call!606)))

(assert (=> b!17132 (=> (not res!12486) (not e!10664))))

(declare-fun bm!593 () Bool)

(declare-fun call!596 () Bool)

(assert (=> bm!593 (= call!590 call!596)))

(declare-fun b!17133 () Bool)

(declare-fun e!10658 () Unit!349)

(declare-fun lt!4465 () Unit!349)

(assert (=> b!17133 (= e!10658 lt!4465)))

(assert (=> b!17133 (= lt!4465 call!601)))

(declare-fun call!604 () SeekEntryResult!42)

(assert (=> b!17133 (= lt!4452 call!604)))

(declare-fun res!12491 () Bool)

(assert (=> b!17133 (= res!12491 ((_ is Found!42) lt!4452))))

(assert (=> b!17133 (=> (not res!12491) (not e!10648))))

(assert (=> b!17133 e!10648))

(declare-fun bm!594 () Bool)

(assert (=> bm!594 (= call!601 (lemmaInListMapThenSeekEntryOrOpenFindsIt!1 (_keys!3052 call!469) (_values!1625 call!469) (mask!4537 call!469) (extraKeys!1541 call!469) (zeroValue!1564 call!469) (minValue!1564 call!469) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1627 call!469)))))

(declare-fun b!17134 () Bool)

(declare-fun e!10668 () tuple2!696)

(assert (=> b!17134 (= e!10668 e!10666)))

(declare-fun c!1706 () Bool)

(assert (=> b!17134 (= c!1706 (= #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!17135 () Bool)

(declare-fun call!600 () ListLongMap!521)

(assert (=> b!17135 (= e!10665 call!600)))

(declare-fun d!3363 () Bool)

(declare-fun e!10649 () Bool)

(assert (=> d!3363 e!10649))

(declare-fun res!12493 () Bool)

(assert (=> d!3363 (=> (not res!12493) (not e!10649))))

(assert (=> d!3363 (= res!12493 (valid!26 (_2!348 lt!4447)))))

(assert (=> d!3363 (= lt!4447 e!10668)))

(declare-fun c!1712 () Bool)

(assert (=> d!3363 (= c!1712 (= #b0000000000000000000000000000000000000000000000000000000000000000 (bvneg #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3363 (valid!26 call!469)))

(assert (=> d!3363 (= (update!2 call!469 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1564 (v!1401 (underlying!28 thiss!848)))) lt!4447)))

(declare-fun b!17136 () Bool)

(declare-fun e!10651 () Bool)

(assert (=> b!17136 (= e!10651 (= call!609 call!599))))

(declare-fun b!17137 () Bool)

(assert (=> b!17137 (= e!10668 e!10662)))

(assert (=> b!17137 (= lt!4451 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3052 call!469) (mask!4537 call!469)))))

(assert (=> b!17137 (= c!1709 ((_ is Undefined!42) lt!4451))))

(declare-fun lt!4456 () (_ BitVec 32))

(declare-fun bm!595 () Bool)

(assert (=> bm!595 (= call!602 (getCurrentListMap!118 (_keys!3052 call!469) (_values!1625 call!469) (mask!4537 call!469) (ite c!1712 (ite c!1706 lt!4440 lt!4456) (extraKeys!1541 call!469)) (ite (and c!1712 c!1706) (zeroValue!1564 (v!1401 (underlying!28 thiss!848))) (zeroValue!1564 call!469)) (ite c!1712 (ite c!1706 (minValue!1564 call!469) (zeroValue!1564 (v!1401 (underlying!28 thiss!848)))) (minValue!1564 call!469)) #b00000000000000000000000000000000 (defaultEntry!1627 call!469)))))

(declare-fun bm!596 () Bool)

(declare-fun call!592 () SeekEntryResult!42)

(assert (=> bm!596 (= call!592 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3052 call!469) (mask!4537 call!469)))))

(declare-fun b!17138 () Bool)

(declare-fun c!1707 () Bool)

(assert (=> b!17138 (= c!1707 ((_ is MissingVacant!42) lt!4461))))

(assert (=> b!17138 (= e!10652 e!10661)))

(declare-fun bm!597 () Bool)

(declare-fun call!594 () Bool)

(declare-fun call!610 () Bool)

(assert (=> bm!597 (= call!594 call!610)))

(declare-fun bm!598 () Bool)

(assert (=> bm!598 (= call!607 call!592)))

(declare-fun bm!599 () Bool)

(assert (=> bm!599 (= call!604 call!592)))

(declare-fun c!1701 () Bool)

(declare-fun c!1713 () Bool)

(declare-fun bm!600 () Bool)

(assert (=> bm!600 (= call!596 (inRange!0 (ite c!1709 (ite c!1711 (index!2288 lt!4464) (ite c!1708 (index!2287 lt!4461) (index!2290 lt!4461))) (ite c!1713 (index!2288 lt!4452) (ite c!1701 (index!2287 lt!4458) (index!2290 lt!4458)))) (mask!4537 call!469)))))

(declare-fun b!17139 () Bool)

(declare-fun lt!4450 () Unit!349)

(declare-fun lt!4444 () Unit!349)

(assert (=> b!17139 (= lt!4450 lt!4444)))

(assert (=> b!17139 (= call!611 call!591)))

(assert (=> b!17139 (= lt!4444 (lemmaChangeLongMinValueKeyThenAddPairToListMap!1 (_keys!3052 call!469) (_values!1625 call!469) (mask!4537 call!469) (extraKeys!1541 call!469) lt!4456 (zeroValue!1564 call!469) (minValue!1564 call!469) (zeroValue!1564 (v!1401 (underlying!28 thiss!848))) (defaultEntry!1627 call!469)))))

(assert (=> b!17139 (= lt!4456 (bvor (extraKeys!1541 call!469) #b00000000000000000000000000000010))))

(assert (=> b!17139 (= e!10666 (tuple2!697 true (LongMapFixedSize!35 (defaultEntry!1627 call!469) (mask!4537 call!469) (bvor (extraKeys!1541 call!469) #b00000000000000000000000000000010) (zeroValue!1564 call!469) (zeroValue!1564 (v!1401 (underlying!28 thiss!848))) (_size!48 call!469) (_keys!3052 call!469) (_values!1625 call!469) (_vacant!48 call!469))))))

(declare-fun b!17140 () Bool)

(declare-fun res!12488 () Bool)

(assert (=> b!17140 (=> (not res!12488) (not e!10657))))

(assert (=> b!17140 (= res!12488 (= (select (arr!423 (_keys!3052 call!469)) (index!2287 lt!4461)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!17141 () Bool)

(declare-fun lt!4445 () Unit!349)

(declare-fun lt!4448 () Unit!349)

(assert (=> b!17141 (= lt!4445 lt!4448)))

(declare-fun lt!4457 () array!879)

(assert (=> b!17141 (contains!207 (getCurrentListMap!118 (_keys!3052 call!469) lt!4457 (mask!4537 call!469) (extraKeys!1541 call!469) (zeroValue!1564 call!469) (minValue!1564 call!469) #b00000000000000000000000000000000 (defaultEntry!1627 call!469)) (select (arr!423 (_keys!3052 call!469)) (index!2288 lt!4451)))))

(assert (=> b!17141 (= lt!4448 (lemmaValidKeyInArrayIsInListMap!1 (_keys!3052 call!469) lt!4457 (mask!4537 call!469) (extraKeys!1541 call!469) (zeroValue!1564 call!469) (minValue!1564 call!469) (index!2288 lt!4451) (defaultEntry!1627 call!469)))))

(assert (=> b!17141 (= lt!4457 (array!880 (store (arr!422 (_values!1625 call!469)) (index!2288 lt!4451) (ValueCellFull!224 (zeroValue!1564 (v!1401 (underlying!28 thiss!848))))) (size!511 (_values!1625 call!469))))))

(declare-fun lt!4454 () Unit!349)

(declare-fun lt!4441 () Unit!349)

(assert (=> b!17141 (= lt!4454 lt!4441)))

(declare-fun call!597 () ListLongMap!521)

(assert (=> b!17141 (= call!597 call!600)))

(assert (=> b!17141 (= lt!4441 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!1 (_keys!3052 call!469) (_values!1625 call!469) (mask!4537 call!469) (extraKeys!1541 call!469) (zeroValue!1564 call!469) (minValue!1564 call!469) (index!2288 lt!4451) #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1564 (v!1401 (underlying!28 thiss!848))) (defaultEntry!1627 call!469)))))

(declare-fun lt!4460 () Unit!349)

(assert (=> b!17141 (= lt!4460 e!10658)))

(assert (=> b!17141 (= c!1713 call!603)))

(assert (=> b!17141 (= e!10654 (tuple2!697 true (LongMapFixedSize!35 (defaultEntry!1627 call!469) (mask!4537 call!469) (extraKeys!1541 call!469) (zeroValue!1564 call!469) (minValue!1564 call!469) (_size!48 call!469) (_keys!3052 call!469) (array!880 (store (arr!422 (_values!1625 call!469)) (index!2288 lt!4451) (ValueCellFull!224 (zeroValue!1564 (v!1401 (underlying!28 thiss!848))))) (size!511 (_values!1625 call!469))) (_vacant!48 call!469))))))

(declare-fun b!17142 () Bool)

(declare-fun e!10656 () Bool)

(assert (=> b!17142 (= e!10651 e!10656)))

(declare-fun res!12490 () Bool)

(assert (=> b!17142 (= res!12490 (contains!207 call!609 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!17142 (=> (not res!12490) (not e!10656))))

(declare-fun b!17143 () Bool)

(declare-fun lt!4462 () tuple2!696)

(assert (=> b!17143 (= e!10655 (tuple2!697 (_1!348 lt!4462) (_2!348 lt!4462)))))

(assert (=> b!17143 (= lt!4462 call!605)))

(declare-fun bm!601 () Bool)

(assert (=> bm!601 (= call!606 call!590)))

(declare-fun b!17144 () Bool)

(assert (=> b!17144 (= e!10664 (not call!593))))

(declare-fun bm!602 () Bool)

(assert (=> bm!602 (= call!598 (getCurrentListMap!118 (_keys!3052 call!469) (ite (or c!1712 c!1709) (_values!1625 call!469) (array!880 (store (arr!422 (_values!1625 call!469)) (index!2288 lt!4451) (ValueCellFull!224 (zeroValue!1564 (v!1401 (underlying!28 thiss!848))))) (size!511 (_values!1625 call!469)))) (mask!4537 call!469) (extraKeys!1541 call!469) (zeroValue!1564 call!469) (minValue!1564 call!469) #b00000000000000000000000000000000 (defaultEntry!1627 call!469)))))

(declare-fun b!17145 () Bool)

(declare-fun Unit!361 () Unit!349)

(assert (=> b!17145 (= e!10658 Unit!361)))

(declare-fun lt!4446 () Unit!349)

(assert (=> b!17145 (= lt!4446 call!588)))

(assert (=> b!17145 (= lt!4458 call!604)))

(assert (=> b!17145 (= c!1701 ((_ is MissingZero!42) lt!4458))))

(assert (=> b!17145 e!10650))

(declare-fun lt!4453 () Unit!349)

(assert (=> b!17145 (= lt!4453 lt!4446)))

(assert (=> b!17145 false))

(declare-fun b!17146 () Bool)

(declare-fun lt!4459 () tuple2!696)

(assert (=> b!17146 (= lt!4459 call!605)))

(assert (=> b!17146 (= e!10654 (tuple2!697 (_1!348 lt!4459) (_2!348 lt!4459)))))

(declare-fun b!17147 () Bool)

(declare-fun res!12487 () Bool)

(assert (=> b!17147 (=> (not res!12487) (not e!10657))))

(assert (=> b!17147 (= res!12487 call!606)))

(assert (=> b!17147 (= e!10652 e!10657)))

(declare-fun b!17148 () Bool)

(assert (=> b!17148 (= e!10663 e!10653)))

(declare-fun res!12492 () Bool)

(assert (=> b!17148 (= res!12492 call!594)))

(assert (=> b!17148 (=> (not res!12492) (not e!10653))))

(declare-fun b!17149 () Bool)

(declare-fun res!12485 () Bool)

(assert (=> b!17149 (= res!12485 (= (select (arr!423 (_keys!3052 call!469)) (index!2290 lt!4458)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!17149 (=> (not res!12485) (not e!10653))))

(declare-fun b!17150 () Bool)

(assert (=> b!17150 (= e!10656 (= call!609 (+!33 call!599 (tuple2!701 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1564 (v!1401 (underlying!28 thiss!848)))))))))

(declare-fun bm!603 () Bool)

(assert (=> bm!603 (= call!589 call!608)))

(declare-fun bm!604 () Bool)

(assert (=> bm!604 (= call!611 call!597)))

(declare-fun b!17151 () Bool)

(assert (=> b!17151 (= e!10649 e!10651)))

(declare-fun c!1703 () Bool)

(assert (=> b!17151 (= c!1703 (_1!348 lt!4447))))

(declare-fun bm!605 () Bool)

(assert (=> bm!605 (= call!600 call!598)))

(declare-fun b!17152 () Bool)

(assert (=> b!17152 (= e!10667 (not call!589))))

(declare-fun b!17153 () Bool)

(assert (=> b!17153 (= e!10665 call!602)))

(declare-fun bm!606 () Bool)

(assert (=> bm!606 (= call!597 (+!33 (ite c!1712 call!595 call!602) (ite c!1712 (ite c!1706 (tuple2!701 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1564 (v!1401 (underlying!28 thiss!848)))) (tuple2!701 #b1000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1564 (v!1401 (underlying!28 thiss!848))))) (tuple2!701 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1564 (v!1401 (underlying!28 thiss!848)))))))))

(declare-fun bm!607 () Bool)

(assert (=> bm!607 (= call!588 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!1 (_keys!3052 call!469) (_values!1625 call!469) (mask!4537 call!469) (extraKeys!1541 call!469) (zeroValue!1564 call!469) (minValue!1564 call!469) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1627 call!469)))))

(declare-fun b!17154 () Bool)

(declare-fun res!12495 () Bool)

(assert (=> b!17154 (=> (not res!12495) (not e!10667))))

(assert (=> b!17154 (= res!12495 call!594)))

(assert (=> b!17154 (= e!10650 e!10667)))

(declare-fun bm!608 () Bool)

(assert (=> bm!608 (= call!610 call!596)))

(declare-fun b!17155 () Bool)

(declare-fun res!12496 () Bool)

(assert (=> b!17155 (= res!12496 call!610)))

(assert (=> b!17155 (=> (not res!12496) (not e!10648))))

(assert (= (and d!3363 c!1712) b!17134))

(assert (= (and d!3363 (not c!1712)) b!17137))

(assert (= (and b!17134 c!1706) b!17121))

(assert (= (and b!17134 (not c!1706)) b!17139))

(assert (= (or b!17121 b!17139) bm!586))

(assert (= (or b!17121 b!17139) bm!588))

(assert (= (or b!17121 b!17139) bm!604))

(assert (= (and b!17137 c!1709) b!17119))

(assert (= (and b!17137 (not c!1709)) b!17129))

(assert (= (and b!17119 c!1711) b!17120))

(assert (= (and b!17119 (not c!1711)) b!17127))

(assert (= (and b!17120 res!12497) b!17123))

(assert (= (and b!17123 res!12489) b!17118))

(assert (= (and b!17127 c!1708) b!17147))

(assert (= (and b!17127 (not c!1708)) b!17138))

(assert (= (and b!17147 res!12487) b!17140))

(assert (= (and b!17140 res!12488) b!17122))

(assert (= (and b!17138 c!1707) b!17132))

(assert (= (and b!17138 (not c!1707)) b!17128))

(assert (= (and b!17132 res!12486) b!17116))

(assert (= (and b!17116 res!12494) b!17144))

(assert (= (or b!17147 b!17132) bm!601))

(assert (= (or b!17122 b!17144) bm!585))

(assert (= (or b!17123 bm!601) bm!593))

(assert (= (or b!17120 b!17127) bm!598))

(assert (= (and b!17129 c!1702) b!17143))

(assert (= (and b!17129 (not c!1702)) b!17125))

(assert (= (and b!17125 c!1704) b!17146))

(assert (= (and b!17125 (not c!1704)) b!17141))

(assert (= (and b!17141 c!1713) b!17133))

(assert (= (and b!17141 (not c!1713)) b!17145))

(assert (= (and b!17133 res!12491) b!17155))

(assert (= (and b!17155 res!12496) b!17130))

(assert (= (and b!17145 c!1701) b!17154))

(assert (= (and b!17145 (not c!1701)) b!17117))

(assert (= (and b!17154 res!12495) b!17124))

(assert (= (and b!17124 res!12498) b!17152))

(assert (= (and b!17117 c!1705) b!17148))

(assert (= (and b!17117 (not c!1705)) b!17131))

(assert (= (and b!17148 res!12492) b!17149))

(assert (= (and b!17149 res!12485) b!17126))

(assert (= (or b!17154 b!17148) bm!597))

(assert (= (or b!17152 b!17126) bm!603))

(assert (= (or b!17155 bm!597) bm!608))

(assert (= (or b!17133 b!17145) bm!599))

(assert (= (or b!17143 b!17146) bm!591))

(assert (= (or b!17120 b!17133) bm!594))

(assert (= (or bm!585 bm!603) bm!592))

(assert (= (or b!17127 b!17145) bm!607))

(assert (= (or b!17119 b!17141) bm!605))

(assert (= (or bm!598 bm!599) bm!596))

(assert (= (or bm!593 bm!608) bm!600))

(assert (= (or b!17119 b!17141) bm!589))

(assert (= (and bm!589 c!1710) b!17135))

(assert (= (and bm!589 (not c!1710)) b!17153))

(assert (= (or bm!586 bm!605) bm!602))

(assert (= (or bm!588 b!17141 b!17153) bm!595))

(assert (= (or bm!604 b!17141) bm!606))

(assert (= (and d!3363 res!12493) b!17151))

(assert (= (and b!17151 c!1703) b!17142))

(assert (= (and b!17151 (not c!1703)) b!17136))

(assert (= (and b!17142 res!12490) b!17150))

(assert (= (or b!17150 b!17136) bm!590))

(assert (= (or b!17142 b!17150 b!17136) bm!587))

(declare-fun m!12053 () Bool)

(assert (=> bm!587 m!12053))

(declare-fun m!12055 () Bool)

(assert (=> bm!590 m!12055))

(declare-fun m!12057 () Bool)

(assert (=> b!17118 m!12057))

(declare-fun m!12059 () Bool)

(assert (=> b!17139 m!12059))

(declare-fun m!12061 () Bool)

(assert (=> b!17141 m!12061))

(declare-fun m!12063 () Bool)

(assert (=> b!17141 m!12063))

(declare-fun m!12065 () Bool)

(assert (=> b!17141 m!12065))

(declare-fun m!12067 () Bool)

(assert (=> b!17141 m!12067))

(declare-fun m!12069 () Bool)

(assert (=> b!17141 m!12069))

(assert (=> b!17141 m!12065))

(assert (=> b!17141 m!12067))

(declare-fun m!12071 () Bool)

(assert (=> b!17141 m!12071))

(declare-fun m!12073 () Bool)

(assert (=> bm!595 m!12073))

(declare-fun m!12075 () Bool)

(assert (=> b!17116 m!12075))

(declare-fun m!12077 () Bool)

(assert (=> bm!589 m!12077))

(declare-fun m!12079 () Bool)

(assert (=> bm!596 m!12079))

(declare-fun m!12081 () Bool)

(assert (=> b!17142 m!12081))

(declare-fun m!12083 () Bool)

(assert (=> b!17149 m!12083))

(declare-fun m!12085 () Bool)

(assert (=> bm!594 m!12085))

(declare-fun m!12087 () Bool)

(assert (=> b!17150 m!12087))

(assert (=> bm!602 m!12061))

(declare-fun m!12089 () Bool)

(assert (=> bm!602 m!12089))

(declare-fun m!12091 () Bool)

(assert (=> b!17140 m!12091))

(assert (=> b!17137 m!12079))

(declare-fun m!12093 () Bool)

(assert (=> bm!606 m!12093))

(declare-fun m!12095 () Bool)

(assert (=> b!17130 m!12095))

(declare-fun m!12097 () Bool)

(assert (=> b!17121 m!12097))

(declare-fun m!12099 () Bool)

(assert (=> bm!592 m!12099))

(declare-fun m!12101 () Bool)

(assert (=> bm!607 m!12101))

(declare-fun m!12103 () Bool)

(assert (=> b!17124 m!12103))

(declare-fun m!12105 () Bool)

(assert (=> d!3363 m!12105))

(declare-fun m!12107 () Bool)

(assert (=> d!3363 m!12107))

(declare-fun m!12109 () Bool)

(assert (=> bm!591 m!12109))

(declare-fun m!12111 () Bool)

(assert (=> bm!600 m!12111))

(assert (=> b!16858 d!3363))

(declare-fun b!17164 () Bool)

(declare-fun e!10673 () (_ BitVec 32))

(declare-fun e!10674 () (_ BitVec 32))

(assert (=> b!17164 (= e!10673 e!10674)))

(declare-fun c!1719 () Bool)

(assert (=> b!17164 (= c!1719 (validKeyInArray!0 (select (arr!423 (_keys!3052 (v!1401 (underlying!28 (_2!345 lt!4141))))) #b00000000000000000000000000000000)))))

(declare-fun b!17165 () Bool)

(declare-fun call!614 () (_ BitVec 32))

(assert (=> b!17165 (= e!10674 (bvadd #b00000000000000000000000000000001 call!614))))

(declare-fun d!3365 () Bool)

(declare-fun lt!4468 () (_ BitVec 32))

(assert (=> d!3365 (and (bvsge lt!4468 #b00000000000000000000000000000000) (bvsle lt!4468 (bvsub (size!512 (_keys!3052 (v!1401 (underlying!28 (_2!345 lt!4141))))) #b00000000000000000000000000000000)))))

(assert (=> d!3365 (= lt!4468 e!10673)))

(declare-fun c!1718 () Bool)

(assert (=> d!3365 (= c!1718 (bvsge #b00000000000000000000000000000000 (size!512 (_keys!3052 (v!1401 (underlying!28 (_2!345 lt!4141)))))))))

(assert (=> d!3365 (and (bvsle #b00000000000000000000000000000000 (size!512 (_keys!3052 (v!1401 (underlying!28 (_2!345 lt!4141)))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!512 (_keys!3052 (v!1401 (underlying!28 (_2!345 lt!4141))))) (size!512 (_keys!3052 (v!1401 (underlying!28 (_2!345 lt!4141)))))))))

(assert (=> d!3365 (= (arrayCountValidKeys!0 (_keys!3052 (v!1401 (underlying!28 (_2!345 lt!4141)))) #b00000000000000000000000000000000 (size!512 (_keys!3052 (v!1401 (underlying!28 (_2!345 lt!4141)))))) lt!4468)))

(declare-fun bm!611 () Bool)

(assert (=> bm!611 (= call!614 (arrayCountValidKeys!0 (_keys!3052 (v!1401 (underlying!28 (_2!345 lt!4141)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!512 (_keys!3052 (v!1401 (underlying!28 (_2!345 lt!4141)))))))))

(declare-fun b!17166 () Bool)

(assert (=> b!17166 (= e!10674 call!614)))

(declare-fun b!17167 () Bool)

(assert (=> b!17167 (= e!10673 #b00000000000000000000000000000000)))

(assert (= (and d!3365 c!1718) b!17167))

(assert (= (and d!3365 (not c!1718)) b!17164))

(assert (= (and b!17164 c!1719) b!17165))

(assert (= (and b!17164 (not c!1719)) b!17166))

(assert (= (or b!17165 b!17166) bm!611))

(assert (=> b!17164 m!11871))

(assert (=> b!17164 m!11871))

(assert (=> b!17164 m!11873))

(declare-fun m!12113 () Bool)

(assert (=> bm!611 m!12113))

(assert (=> b!16872 d!3365))

(declare-fun b!17168 () Bool)

(declare-fun e!10675 () Bool)

(assert (=> b!17168 (= e!10675 tp_is_empty!847)))

(declare-fun mapNonEmpty!711 () Bool)

(declare-fun mapRes!711 () Bool)

(declare-fun tp!2952 () Bool)

(assert (=> mapNonEmpty!711 (= mapRes!711 (and tp!2952 e!10675))))

(declare-fun mapRest!711 () (Array (_ BitVec 32) ValueCell!224))

(declare-fun mapKey!711 () (_ BitVec 32))

(declare-fun mapValue!711 () ValueCell!224)

(assert (=> mapNonEmpty!711 (= mapRest!710 (store mapRest!711 mapKey!711 mapValue!711))))

(declare-fun b!17169 () Bool)

(declare-fun e!10676 () Bool)

(assert (=> b!17169 (= e!10676 tp_is_empty!847)))

(declare-fun mapIsEmpty!711 () Bool)

(assert (=> mapIsEmpty!711 mapRes!711))

(declare-fun condMapEmpty!711 () Bool)

(declare-fun mapDefault!711 () ValueCell!224)

(assert (=> mapNonEmpty!710 (= condMapEmpty!711 (= mapRest!710 ((as const (Array (_ BitVec 32) ValueCell!224)) mapDefault!711)))))

(assert (=> mapNonEmpty!710 (= tp!2951 (and e!10676 mapRes!711))))

(assert (= (and mapNonEmpty!710 condMapEmpty!711) mapIsEmpty!711))

(assert (= (and mapNonEmpty!710 (not condMapEmpty!711)) mapNonEmpty!711))

(assert (= (and mapNonEmpty!711 ((_ is ValueCellFull!224) mapValue!711)) b!17168))

(assert (= (and mapNonEmpty!710 ((_ is ValueCellFull!224) mapDefault!711)) b!17169))

(declare-fun m!12115 () Bool)

(assert (=> mapNonEmpty!711 m!12115))

(declare-fun b_lambda!1429 () Bool)

(assert (= b_lambda!1427 (or (and b!16776 b_free!583) b_lambda!1429)))

(declare-fun b_lambda!1431 () Bool)

(assert (= b_lambda!1423 (or (and b!16776 b_free!583) b_lambda!1431)))

(declare-fun b_lambda!1433 () Bool)

(assert (= b_lambda!1425 (or (and b!16776 b_free!583) b_lambda!1433)))

(check-sat (not b!17139) (not bm!470) (not b!17121) (not d!3347) (not d!3361) (not b_lambda!1433) (not b!16916) (not bm!579) (not b!17150) (not b!17038) tp_is_empty!847 (not b!17114) (not bm!580) (not bm!590) (not bm!539) (not bm!577) (not b!16917) (not b_lambda!1431) (not bm!595) (not bm!544) (not b!16892) (not b!17164) (not d!3349) (not d!3345) (not bm!526) (not bm!527) (not mapNonEmpty!711) (not b!16911) (not b!17113) (not d!3355) (not bm!581) b_and!1229 (not b!16894) (not b!17095) (not bm!600) (not bm!533) (not bm!596) (not d!3363) (not b!16908) (not b!17141) (not bm!543) (not bm!532) (not bm!537) (not bm!573) (not b!17036) (not bm!576) (not b_lambda!1429) (not bm!592) (not bm!473) (not b!17018) (not bm!529) (not bm!606) (not b!17099) (not bm!587) (not b!17047) (not b!17090) (not bm!594) (not bm!574) (not b!16929) (not b!17034) (not d!3357) (not b!17059) (not b!16932) (not b!16931) (not b!17100) (not bm!572) (not bm!528) (not b!17039) (not bm!602) (not b!17137) (not b!16915) (not bm!589) (not bm!584) (not b!17098) (not bm!578) (not b!17142) (not bm!611) (not bm!591) (not bm!583) (not d!3359) (not bm!524) (not b_next!583) (not b!16909) (not bm!582) (not d!3351) (not bm!607) (not bm!531) (not bm!575))
(check-sat b_and!1229 (not b_next!583))

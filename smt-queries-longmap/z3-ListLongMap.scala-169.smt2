; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3238 () Bool)

(assert start!3238)

(declare-fun b!19705 () Bool)

(declare-fun b_free!693 () Bool)

(declare-fun b_next!693 () Bool)

(assert (=> b!19705 (= b_free!693 (not b_next!693))))

(declare-fun tp!3298 () Bool)

(declare-fun b_and!1357 () Bool)

(assert (=> b!19705 (= tp!3298 b_and!1357)))

(declare-fun b!19703 () Bool)

(declare-fun e!12804 () Bool)

(declare-fun e!12803 () Bool)

(declare-fun mapRes!898 () Bool)

(assert (=> b!19703 (= e!12804 (and e!12803 mapRes!898))))

(declare-fun condMapEmpty!898 () Bool)

(declare-datatypes ((V!1101 0))(
  ( (V!1102 (val!505 Int)) )
))
(declare-datatypes ((ValueCell!279 0))(
  ( (ValueCellFull!279 (v!1526 V!1101)) (EmptyCell!279) )
))
(declare-datatypes ((array!1133 0))(
  ( (array!1134 (arr!541 (Array (_ BitVec 32) ValueCell!279)) (size!634 (_ BitVec 32))) )
))
(declare-datatypes ((array!1135 0))(
  ( (array!1136 (arr!542 (Array (_ BitVec 32) (_ BitVec 64))) (size!635 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!144 0))(
  ( (LongMapFixedSize!145 (defaultEntry!1692 Int) (mask!4648 (_ BitVec 32)) (extraKeys!1601 (_ BitVec 32)) (zeroValue!1625 V!1101) (minValue!1625 V!1101) (_size!107 (_ BitVec 32)) (_keys!3119 array!1135) (_values!1687 array!1133) (_vacant!107 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!144 0))(
  ( (Cell!145 (v!1527 LongMapFixedSize!144)) )
))
(declare-datatypes ((LongMap!144 0))(
  ( (LongMap!145 (underlying!83 Cell!144)) )
))
(declare-fun thiss!938 () LongMap!144)

(declare-fun mapDefault!898 () ValueCell!279)

(assert (=> b!19703 (= condMapEmpty!898 (= (arr!541 (_values!1687 (v!1527 (underlying!83 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!279)) mapDefault!898)))))

(declare-fun res!13267 () Bool)

(declare-fun e!12806 () Bool)

(assert (=> start!3238 (=> (not res!13267) (not e!12806))))

(declare-fun valid!69 (LongMap!144) Bool)

(assert (=> start!3238 (= res!13267 (valid!69 thiss!938))))

(assert (=> start!3238 e!12806))

(declare-fun e!12802 () Bool)

(assert (=> start!3238 e!12802))

(declare-fun b!19704 () Bool)

(declare-fun e!12799 () Bool)

(declare-fun lt!5520 () LongMapFixedSize!144)

(declare-fun valid!70 (LongMapFixedSize!144) Bool)

(declare-datatypes ((tuple2!824 0))(
  ( (tuple2!825 (_1!415 Bool) (_2!415 LongMapFixedSize!144)) )
))
(declare-fun update!14 (LongMapFixedSize!144 (_ BitVec 64) V!1101) tuple2!824)

(assert (=> b!19704 (= e!12799 (not (valid!70 (_2!415 (update!14 lt!5520 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1625 (v!1527 (underlying!83 thiss!938))))))))))

(declare-fun e!12798 () Bool)

(declare-fun tp_is_empty!957 () Bool)

(declare-fun array_inv!367 (array!1135) Bool)

(declare-fun array_inv!368 (array!1133) Bool)

(assert (=> b!19705 (= e!12798 (and tp!3298 tp_is_empty!957 (array_inv!367 (_keys!3119 (v!1527 (underlying!83 thiss!938)))) (array_inv!368 (_values!1687 (v!1527 (underlying!83 thiss!938)))) e!12804))))

(declare-fun b!19706 () Bool)

(assert (=> b!19706 (= e!12806 e!12799)))

(declare-fun res!13266 () Bool)

(assert (=> b!19706 (=> (not res!13266) (not e!12799))))

(assert (=> b!19706 (= res!13266 (and (not (= (bvand (extraKeys!1601 (v!1527 (underlying!83 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1601 (v!1527 (underlying!83 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun getNewLongMapFixedSize!12 ((_ BitVec 32) Int) LongMapFixedSize!144)

(declare-fun computeNewMask!8 (LongMap!144 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!19706 (= lt!5520 (getNewLongMapFixedSize!12 (computeNewMask!8 thiss!938 (mask!4648 (v!1527 (underlying!83 thiss!938))) (_vacant!107 (v!1527 (underlying!83 thiss!938))) (_size!107 (v!1527 (underlying!83 thiss!938)))) (defaultEntry!1692 (v!1527 (underlying!83 thiss!938)))))))

(declare-fun b!19707 () Bool)

(assert (=> b!19707 (= e!12803 tp_is_empty!957)))

(declare-fun b!19708 () Bool)

(declare-fun e!12805 () Bool)

(assert (=> b!19708 (= e!12802 e!12805)))

(declare-fun b!19709 () Bool)

(declare-fun e!12801 () Bool)

(assert (=> b!19709 (= e!12801 tp_is_empty!957)))

(declare-fun mapNonEmpty!898 () Bool)

(declare-fun tp!3297 () Bool)

(assert (=> mapNonEmpty!898 (= mapRes!898 (and tp!3297 e!12801))))

(declare-fun mapValue!898 () ValueCell!279)

(declare-fun mapRest!898 () (Array (_ BitVec 32) ValueCell!279))

(declare-fun mapKey!898 () (_ BitVec 32))

(assert (=> mapNonEmpty!898 (= (arr!541 (_values!1687 (v!1527 (underlying!83 thiss!938)))) (store mapRest!898 mapKey!898 mapValue!898))))

(declare-fun mapIsEmpty!898 () Bool)

(assert (=> mapIsEmpty!898 mapRes!898))

(declare-fun b!19710 () Bool)

(assert (=> b!19710 (= e!12805 e!12798)))

(assert (= (and start!3238 res!13267) b!19706))

(assert (= (and b!19706 res!13266) b!19704))

(assert (= (and b!19703 condMapEmpty!898) mapIsEmpty!898))

(assert (= (and b!19703 (not condMapEmpty!898)) mapNonEmpty!898))

(get-info :version)

(assert (= (and mapNonEmpty!898 ((_ is ValueCellFull!279) mapValue!898)) b!19709))

(assert (= (and b!19703 ((_ is ValueCellFull!279) mapDefault!898)) b!19707))

(assert (= b!19705 b!19703))

(assert (= b!19710 b!19705))

(assert (= b!19708 b!19710))

(assert (= start!3238 b!19708))

(declare-fun m!13859 () Bool)

(assert (=> b!19705 m!13859))

(declare-fun m!13861 () Bool)

(assert (=> b!19705 m!13861))

(declare-fun m!13863 () Bool)

(assert (=> b!19704 m!13863))

(declare-fun m!13865 () Bool)

(assert (=> b!19704 m!13865))

(declare-fun m!13867 () Bool)

(assert (=> mapNonEmpty!898 m!13867))

(declare-fun m!13869 () Bool)

(assert (=> start!3238 m!13869))

(declare-fun m!13871 () Bool)

(assert (=> b!19706 m!13871))

(assert (=> b!19706 m!13871))

(declare-fun m!13873 () Bool)

(assert (=> b!19706 m!13873))

(check-sat b_and!1357 (not b_next!693) (not b!19705) (not b!19706) (not start!3238) (not mapNonEmpty!898) (not b!19704) tp_is_empty!957)
(check-sat b_and!1357 (not b_next!693))
(get-model)

(declare-fun d!3633 () Bool)

(assert (=> d!3633 (= (valid!69 thiss!938) (valid!70 (v!1527 (underlying!83 thiss!938))))))

(declare-fun bs!882 () Bool)

(assert (= bs!882 d!3633))

(declare-fun m!13891 () Bool)

(assert (=> bs!882 m!13891))

(assert (=> start!3238 d!3633))

(declare-fun d!3635 () Bool)

(assert (=> d!3635 (= (array_inv!367 (_keys!3119 (v!1527 (underlying!83 thiss!938)))) (bvsge (size!635 (_keys!3119 (v!1527 (underlying!83 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!19705 d!3635))

(declare-fun d!3637 () Bool)

(assert (=> d!3637 (= (array_inv!368 (_values!1687 (v!1527 (underlying!83 thiss!938)))) (bvsge (size!634 (_values!1687 (v!1527 (underlying!83 thiss!938)))) #b00000000000000000000000000000000))))

(assert (=> b!19705 d!3637))

(declare-fun d!3639 () Bool)

(declare-fun res!13280 () Bool)

(declare-fun e!12836 () Bool)

(assert (=> d!3639 (=> (not res!13280) (not e!12836))))

(declare-fun simpleValid!14 (LongMapFixedSize!144) Bool)

(assert (=> d!3639 (= res!13280 (simpleValid!14 (_2!415 (update!14 lt!5520 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1625 (v!1527 (underlying!83 thiss!938)))))))))

(assert (=> d!3639 (= (valid!70 (_2!415 (update!14 lt!5520 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1625 (v!1527 (underlying!83 thiss!938)))))) e!12836)))

(declare-fun b!19741 () Bool)

(declare-fun res!13281 () Bool)

(assert (=> b!19741 (=> (not res!13281) (not e!12836))))

(declare-fun arrayCountValidKeys!0 (array!1135 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!19741 (= res!13281 (= (arrayCountValidKeys!0 (_keys!3119 (_2!415 (update!14 lt!5520 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1625 (v!1527 (underlying!83 thiss!938)))))) #b00000000000000000000000000000000 (size!635 (_keys!3119 (_2!415 (update!14 lt!5520 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1625 (v!1527 (underlying!83 thiss!938)))))))) (_size!107 (_2!415 (update!14 lt!5520 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1625 (v!1527 (underlying!83 thiss!938))))))))))

(declare-fun b!19742 () Bool)

(declare-fun res!13282 () Bool)

(assert (=> b!19742 (=> (not res!13282) (not e!12836))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1135 (_ BitVec 32)) Bool)

(assert (=> b!19742 (= res!13282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3119 (_2!415 (update!14 lt!5520 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1625 (v!1527 (underlying!83 thiss!938)))))) (mask!4648 (_2!415 (update!14 lt!5520 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1625 (v!1527 (underlying!83 thiss!938))))))))))

(declare-fun b!19743 () Bool)

(declare-datatypes ((List!549 0))(
  ( (Nil!546) (Cons!545 (h!1111 (_ BitVec 64)) (t!3196 List!549)) )
))
(declare-fun arrayNoDuplicates!0 (array!1135 (_ BitVec 32) List!549) Bool)

(assert (=> b!19743 (= e!12836 (arrayNoDuplicates!0 (_keys!3119 (_2!415 (update!14 lt!5520 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1625 (v!1527 (underlying!83 thiss!938)))))) #b00000000000000000000000000000000 Nil!546))))

(assert (= (and d!3639 res!13280) b!19741))

(assert (= (and b!19741 res!13281) b!19742))

(assert (= (and b!19742 res!13282) b!19743))

(declare-fun m!13893 () Bool)

(assert (=> d!3639 m!13893))

(declare-fun m!13895 () Bool)

(assert (=> b!19741 m!13895))

(declare-fun m!13897 () Bool)

(assert (=> b!19742 m!13897))

(declare-fun m!13899 () Bool)

(assert (=> b!19743 m!13899))

(assert (=> b!19704 d!3639))

(declare-fun d!3641 () Bool)

(declare-fun e!12896 () Bool)

(assert (=> d!3641 e!12896))

(declare-fun res!13323 () Bool)

(assert (=> d!3641 (=> (not res!13323) (not e!12896))))

(declare-fun lt!5587 () tuple2!824)

(assert (=> d!3641 (= res!13323 (valid!70 (_2!415 lt!5587)))))

(declare-fun e!12881 () tuple2!824)

(assert (=> d!3641 (= lt!5587 e!12881)))

(declare-fun c!2124 () Bool)

(assert (=> d!3641 (= c!2124 (= #b0000000000000000000000000000000000000000000000000000000000000000 (bvneg #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3641 (valid!70 lt!5520)))

(assert (=> d!3641 (= (update!14 lt!5520 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1625 (v!1527 (underlying!83 thiss!938)))) lt!5587)))

(declare-datatypes ((tuple2!826 0))(
  ( (tuple2!827 (_1!416 (_ BitVec 64)) (_2!416 V!1101)) )
))
(declare-datatypes ((List!550 0))(
  ( (Nil!547) (Cons!546 (h!1112 tuple2!826) (t!3197 List!550)) )
))
(declare-datatypes ((ListLongMap!547 0))(
  ( (ListLongMap!548 (toList!289 List!550)) )
))
(declare-fun call!970 () ListLongMap!547)

(declare-fun bm!950 () Bool)

(declare-fun lt!5600 () array!1133)

(declare-fun c!2127 () Bool)

(declare-fun getCurrentListMap!122 (array!1135 array!1133 (_ BitVec 32) (_ BitVec 32) V!1101 V!1101 (_ BitVec 32) Int) ListLongMap!547)

(assert (=> bm!950 (= call!970 (getCurrentListMap!122 (_keys!3119 lt!5520) (ite c!2127 (_values!1687 lt!5520) lt!5600) (mask!4648 lt!5520) (extraKeys!1601 lt!5520) (zeroValue!1625 lt!5520) (minValue!1625 lt!5520) #b00000000000000000000000000000000 (defaultEntry!1692 lt!5520)))))

(declare-fun b!19820 () Bool)

(declare-fun e!12895 () Bool)

(declare-fun call!955 () Bool)

(assert (=> b!19820 (= e!12895 (not call!955))))

(declare-fun bm!951 () Bool)

(declare-fun call!968 () ListLongMap!547)

(declare-fun call!953 () ListLongMap!547)

(assert (=> bm!951 (= call!968 call!953)))

(declare-fun b!19821 () Bool)

(declare-fun e!12878 () Bool)

(assert (=> b!19821 (= e!12878 (not call!955))))

(declare-fun bm!952 () Bool)

(declare-fun call!969 () Bool)

(declare-fun call!957 () Bool)

(assert (=> bm!952 (= call!969 call!957)))

(declare-fun bm!953 () Bool)

(declare-fun call!954 () ListLongMap!547)

(declare-fun call!974 () ListLongMap!547)

(assert (=> bm!953 (= call!954 call!974)))

(declare-fun b!19822 () Bool)

(declare-datatypes ((Unit!396 0))(
  ( (Unit!397) )
))
(declare-fun e!12891 () Unit!396)

(declare-fun lt!5581 () Unit!396)

(assert (=> b!19822 (= e!12891 lt!5581)))

(declare-fun call!976 () Unit!396)

(assert (=> b!19822 (= lt!5581 call!976)))

(declare-datatypes ((SeekEntryResult!47 0))(
  ( (MissingZero!47 (index!2308 (_ BitVec 32))) (Found!47 (index!2309 (_ BitVec 32))) (Intermediate!47 (undefined!859 Bool) (index!2310 (_ BitVec 32)) (x!4826 (_ BitVec 32))) (Undefined!47) (MissingVacant!47 (index!2311 (_ BitVec 32))) )
))
(declare-fun lt!5595 () SeekEntryResult!47)

(declare-fun call!965 () SeekEntryResult!47)

(assert (=> b!19822 (= lt!5595 call!965)))

(declare-fun c!2116 () Bool)

(assert (=> b!19822 (= c!2116 ((_ is MissingZero!47) lt!5595))))

(declare-fun e!12877 () Bool)

(assert (=> b!19822 e!12877))

(declare-fun bm!954 () Bool)

(declare-fun call!959 () Unit!396)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!3 (array!1135 array!1133 (_ BitVec 32) (_ BitVec 32) V!1101 V!1101 (_ BitVec 64) Int) Unit!396)

(assert (=> bm!954 (= call!959 (lemmaInListMapThenSeekEntryOrOpenFindsIt!3 (_keys!3119 lt!5520) (_values!1687 lt!5520) (mask!4648 lt!5520) (extraKeys!1601 lt!5520) (zeroValue!1625 lt!5520) (minValue!1625 lt!5520) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1692 lt!5520)))))

(declare-fun bm!955 () Bool)

(declare-fun call!961 () ListLongMap!547)

(declare-fun map!375 (LongMapFixedSize!144) ListLongMap!547)

(assert (=> bm!955 (= call!961 (map!375 (_2!415 lt!5587)))))

(declare-fun bm!956 () Bool)

(declare-fun call!966 () Bool)

(assert (=> bm!956 (= call!955 call!966)))

(declare-fun b!19823 () Bool)

(declare-fun e!12892 () Bool)

(declare-fun lt!5578 () SeekEntryResult!47)

(assert (=> b!19823 (= e!12892 (= (select (arr!542 (_keys!3119 lt!5520)) (index!2309 lt!5578)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!19824 () Bool)

(declare-fun lt!5602 () Unit!396)

(declare-fun lt!5582 () Unit!396)

(assert (=> b!19824 (= lt!5602 lt!5582)))

(declare-fun call!962 () ListLongMap!547)

(assert (=> b!19824 (= call!962 call!954)))

(declare-fun lt!5593 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!3 (array!1135 array!1133 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1101 V!1101 V!1101 Int) Unit!396)

(assert (=> b!19824 (= lt!5582 (lemmaChangeZeroKeyThenAddPairToListMap!3 (_keys!3119 lt!5520) (_values!1687 lt!5520) (mask!4648 lt!5520) (extraKeys!1601 lt!5520) lt!5593 (zeroValue!1625 lt!5520) (zeroValue!1625 (v!1527 (underlying!83 thiss!938))) (minValue!1625 lt!5520) (defaultEntry!1692 lt!5520)))))

(assert (=> b!19824 (= lt!5593 (bvor (extraKeys!1601 lt!5520) #b00000000000000000000000000000001))))

(declare-fun e!12879 () tuple2!824)

(assert (=> b!19824 (= e!12879 (tuple2!825 true (LongMapFixedSize!145 (defaultEntry!1692 lt!5520) (mask!4648 lt!5520) (bvor (extraKeys!1601 lt!5520) #b00000000000000000000000000000001) (zeroValue!1625 (v!1527 (underlying!83 thiss!938))) (minValue!1625 lt!5520) (_size!107 lt!5520) (_keys!3119 lt!5520) (_values!1687 lt!5520) (_vacant!107 lt!5520))))))

(declare-fun b!19825 () Bool)

(declare-fun e!12884 () Unit!396)

(declare-fun lt!5579 () Unit!396)

(assert (=> b!19825 (= e!12884 lt!5579)))

(assert (=> b!19825 (= lt!5579 call!959)))

(declare-fun lt!5597 () SeekEntryResult!47)

(declare-fun call!960 () SeekEntryResult!47)

(assert (=> b!19825 (= lt!5597 call!960)))

(declare-fun res!13321 () Bool)

(assert (=> b!19825 (= res!13321 ((_ is Found!47) lt!5597))))

(declare-fun e!12886 () Bool)

(assert (=> b!19825 (=> (not res!13321) (not e!12886))))

(assert (=> b!19825 e!12886))

(declare-fun lt!5596 () (_ BitVec 32))

(declare-fun bm!957 () Bool)

(declare-fun c!2117 () Bool)

(declare-fun lt!5583 () SeekEntryResult!47)

(assert (=> bm!957 (= call!974 (getCurrentListMap!122 (_keys!3119 lt!5520) (ite c!2124 (_values!1687 lt!5520) (array!1134 (store (arr!541 (_values!1687 lt!5520)) (index!2309 lt!5583) (ValueCellFull!279 (zeroValue!1625 (v!1527 (underlying!83 thiss!938))))) (size!634 (_values!1687 lt!5520)))) (mask!4648 lt!5520) (ite c!2124 (ite c!2117 lt!5593 lt!5596) (extraKeys!1601 lt!5520)) (ite (and c!2124 c!2117) (zeroValue!1625 (v!1527 (underlying!83 thiss!938))) (zeroValue!1625 lt!5520)) (ite c!2124 (ite c!2117 (minValue!1625 lt!5520) (zeroValue!1625 (v!1527 (underlying!83 thiss!938)))) (minValue!1625 lt!5520)) #b00000000000000000000000000000000 (defaultEntry!1692 lt!5520)))))

(declare-fun bm!958 () Bool)

(declare-fun call!967 () SeekEntryResult!47)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1135 (_ BitVec 32)) SeekEntryResult!47)

(assert (=> bm!958 (= call!967 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3119 lt!5520) (mask!4648 lt!5520)))))

(declare-fun b!19826 () Bool)

(declare-fun res!13311 () Bool)

(assert (=> b!19826 (=> (not res!13311) (not e!12878))))

(declare-fun lt!5604 () SeekEntryResult!47)

(assert (=> b!19826 (= res!13311 (= (select (arr!542 (_keys!3119 lt!5520)) (index!2308 lt!5604)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!19827 () Bool)

(declare-fun e!12880 () tuple2!824)

(declare-fun lt!5601 () tuple2!824)

(assert (=> b!19827 (= e!12880 (tuple2!825 (_1!415 lt!5601) (_2!415 lt!5601)))))

(declare-fun call!958 () tuple2!824)

(assert (=> b!19827 (= lt!5601 call!958)))

(declare-fun b!19828 () Bool)

(declare-fun c!2126 () Bool)

(assert (=> b!19828 (= c!2126 ((_ is MissingVacant!47) lt!5604))))

(declare-fun e!12894 () Bool)

(declare-fun e!12882 () Bool)

(assert (=> b!19828 (= e!12894 e!12882)))

(declare-fun b!19829 () Bool)

(declare-fun res!13315 () Bool)

(assert (=> b!19829 (= res!13315 (= (select (arr!542 (_keys!3119 lt!5520)) (index!2311 lt!5595)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!12888 () Bool)

(assert (=> b!19829 (=> (not res!13315) (not e!12888))))

(declare-fun bm!959 () Bool)

(declare-fun call!963 () ListLongMap!547)

(assert (=> bm!959 (= call!962 call!963)))

(declare-fun b!19830 () Bool)

(declare-fun call!972 () Bool)

(assert (=> b!19830 (= e!12888 (not call!972))))

(declare-fun b!19831 () Bool)

(declare-fun res!13314 () Bool)

(declare-fun call!964 () Bool)

(assert (=> b!19831 (= res!13314 call!964)))

(assert (=> b!19831 (=> (not res!13314) (not e!12892))))

(declare-fun b!19832 () Bool)

(declare-fun e!12883 () Bool)

(assert (=> b!19832 (= e!12896 e!12883)))

(declare-fun c!2120 () Bool)

(assert (=> b!19832 (= c!2120 (_1!415 lt!5587))))

(declare-fun bm!960 () Bool)

(declare-fun c!2121 () Bool)

(declare-fun updateHelperNewKey!3 (LongMapFixedSize!144 (_ BitVec 64) V!1101 (_ BitVec 32)) tuple2!824)

(assert (=> bm!960 (= call!958 (updateHelperNewKey!3 lt!5520 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1625 (v!1527 (underlying!83 thiss!938))) (ite c!2121 (index!2311 lt!5583) (index!2308 lt!5583))))))

(declare-fun b!19833 () Bool)

(declare-fun Unit!398 () Unit!396)

(assert (=> b!19833 (= e!12884 Unit!398)))

(declare-fun lt!5588 () Unit!396)

(assert (=> b!19833 (= lt!5588 call!976)))

(assert (=> b!19833 (= lt!5604 call!960)))

(declare-fun c!2119 () Bool)

(assert (=> b!19833 (= c!2119 ((_ is MissingZero!47) lt!5604))))

(assert (=> b!19833 e!12894))

(declare-fun lt!5590 () Unit!396)

(assert (=> b!19833 (= lt!5590 lt!5588)))

(assert (=> b!19833 false))

(declare-fun b!19834 () Bool)

(declare-fun Unit!399 () Unit!396)

(assert (=> b!19834 (= e!12891 Unit!399)))

(declare-fun lt!5603 () Unit!396)

(assert (=> b!19834 (= lt!5603 call!959)))

(assert (=> b!19834 (= lt!5578 call!965)))

(declare-fun res!13312 () Bool)

(assert (=> b!19834 (= res!13312 ((_ is Found!47) lt!5578))))

(assert (=> b!19834 (=> (not res!13312) (not e!12892))))

(assert (=> b!19834 e!12892))

(declare-fun lt!5584 () Unit!396)

(assert (=> b!19834 (= lt!5584 lt!5603)))

(assert (=> b!19834 false))

(declare-fun e!12890 () Bool)

(declare-fun call!971 () ListLongMap!547)

(declare-fun b!19835 () Bool)

(declare-fun +!38 (ListLongMap!547 tuple2!826) ListLongMap!547)

(assert (=> b!19835 (= e!12890 (= call!961 (+!38 call!971 (tuple2!827 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1625 (v!1527 (underlying!83 thiss!938)))))))))

(declare-fun b!19836 () Bool)

(declare-fun res!13318 () Bool)

(declare-fun e!12885 () Bool)

(assert (=> b!19836 (=> (not res!13318) (not e!12885))))

(assert (=> b!19836 (= res!13318 (= (select (arr!542 (_keys!3119 lt!5520)) (index!2308 lt!5595)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!19837 () Bool)

(declare-fun res!13317 () Bool)

(assert (=> b!19837 (= res!13317 call!957)))

(assert (=> b!19837 (=> (not res!13317) (not e!12886))))

(declare-fun b!19838 () Bool)

(assert (=> b!19838 (= e!12881 e!12879)))

(assert (=> b!19838 (= c!2117 (= #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!961 () Bool)

(declare-fun call!973 () Bool)

(assert (=> bm!961 (= call!957 call!973)))

(declare-fun b!19839 () Bool)

(assert (=> b!19839 (= e!12882 e!12895)))

(declare-fun res!13324 () Bool)

(assert (=> b!19839 (= res!13324 call!969)))

(assert (=> b!19839 (=> (not res!13324) (not e!12895))))

(declare-fun bm!962 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!3 (array!1135 array!1133 (_ BitVec 32) (_ BitVec 32) V!1101 V!1101 (_ BitVec 64) Int) Unit!396)

(assert (=> bm!962 (= call!976 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!3 (_keys!3119 lt!5520) (_values!1687 lt!5520) (mask!4648 lt!5520) (extraKeys!1601 lt!5520) (zeroValue!1625 lt!5520) (minValue!1625 lt!5520) #b0000000000000000000000000000000000000000000000000000000000000000 (defaultEntry!1692 lt!5520)))))

(declare-fun b!19840 () Bool)

(assert (=> b!19840 (= c!2121 ((_ is MissingVacant!47) lt!5583))))

(declare-fun e!12893 () tuple2!824)

(assert (=> b!19840 (= e!12893 e!12880)))

(declare-fun b!19841 () Bool)

(declare-fun res!13316 () Bool)

(assert (=> b!19841 (=> (not res!13316) (not e!12878))))

(assert (=> b!19841 (= res!13316 call!969)))

(assert (=> b!19841 (= e!12894 e!12878)))

(declare-fun b!19842 () Bool)

(declare-fun e!12887 () Bool)

(assert (=> b!19842 (= e!12887 e!12888)))

(declare-fun res!13322 () Bool)

(declare-fun call!956 () Bool)

(assert (=> b!19842 (= res!13322 call!956)))

(assert (=> b!19842 (=> (not res!13322) (not e!12888))))

(declare-fun bm!963 () Bool)

(declare-fun arrayContainsKey!0 (array!1135 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!963 (= call!966 (arrayContainsKey!0 (_keys!3119 lt!5520) #b0000000000000000000000000000000000000000000000000000000000000000 #b00000000000000000000000000000000))))

(declare-fun b!19843 () Bool)

(declare-fun lt!5599 () Unit!396)

(declare-fun lt!5592 () Unit!396)

(assert (=> b!19843 (= lt!5599 lt!5592)))

(declare-fun call!975 () Bool)

(assert (=> b!19843 call!975))

(declare-fun lemmaValidKeyInArrayIsInListMap!3 (array!1135 array!1133 (_ BitVec 32) (_ BitVec 32) V!1101 V!1101 (_ BitVec 32) Int) Unit!396)

(assert (=> b!19843 (= lt!5592 (lemmaValidKeyInArrayIsInListMap!3 (_keys!3119 lt!5520) lt!5600 (mask!4648 lt!5520) (extraKeys!1601 lt!5520) (zeroValue!1625 lt!5520) (minValue!1625 lt!5520) (index!2309 lt!5583) (defaultEntry!1692 lt!5520)))))

(assert (=> b!19843 (= lt!5600 (array!1134 (store (arr!541 (_values!1687 lt!5520)) (index!2309 lt!5583) (ValueCellFull!279 (zeroValue!1625 (v!1527 (underlying!83 thiss!938))))) (size!634 (_values!1687 lt!5520))))))

(declare-fun lt!5591 () Unit!396)

(declare-fun lt!5594 () Unit!396)

(assert (=> b!19843 (= lt!5591 lt!5594)))

(assert (=> b!19843 (= call!963 call!974)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!3 (array!1135 array!1133 (_ BitVec 32) (_ BitVec 32) V!1101 V!1101 (_ BitVec 32) (_ BitVec 64) V!1101 Int) Unit!396)

(assert (=> b!19843 (= lt!5594 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!3 (_keys!3119 lt!5520) (_values!1687 lt!5520) (mask!4648 lt!5520) (extraKeys!1601 lt!5520) (zeroValue!1625 lt!5520) (minValue!1625 lt!5520) (index!2309 lt!5583) #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1625 (v!1527 (underlying!83 thiss!938))) (defaultEntry!1692 lt!5520)))))

(declare-fun lt!5598 () Unit!396)

(assert (=> b!19843 (= lt!5598 e!12884)))

(declare-fun c!2125 () Bool)

(declare-fun contains!221 (ListLongMap!547 (_ BitVec 64)) Bool)

(assert (=> b!19843 (= c!2125 (contains!221 call!953 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!12889 () tuple2!824)

(assert (=> b!19843 (= e!12889 (tuple2!825 true (LongMapFixedSize!145 (defaultEntry!1692 lt!5520) (mask!4648 lt!5520) (extraKeys!1601 lt!5520) (zeroValue!1625 lt!5520) (minValue!1625 lt!5520) (_size!107 lt!5520) (_keys!3119 lt!5520) (array!1134 (store (arr!541 (_values!1687 lt!5520)) (index!2309 lt!5583) (ValueCellFull!279 (zeroValue!1625 (v!1527 (underlying!83 thiss!938))))) (size!634 (_values!1687 lt!5520))) (_vacant!107 lt!5520))))))

(declare-fun b!19844 () Bool)

(declare-fun c!2122 () Bool)

(assert (=> b!19844 (= c!2122 ((_ is MissingVacant!47) lt!5595))))

(assert (=> b!19844 (= e!12877 e!12887)))

(declare-fun b!19845 () Bool)

(declare-fun res!13319 () Bool)

(assert (=> b!19845 (= res!13319 (= (select (arr!542 (_keys!3119 lt!5520)) (index!2311 lt!5604)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!19845 (=> (not res!13319) (not e!12895))))

(declare-fun b!19846 () Bool)

(declare-fun lt!5585 () tuple2!824)

(assert (=> b!19846 (= lt!5585 call!958)))

(assert (=> b!19846 (= e!12889 (tuple2!825 (_1!415 lt!5585) (_2!415 lt!5585)))))

(declare-fun bm!964 () Bool)

(assert (=> bm!964 (= call!975 (contains!221 call!970 (ite c!2127 #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!542 (_keys!3119 lt!5520)) (index!2309 lt!5583)))))))

(declare-fun b!19847 () Bool)

(declare-fun lt!5580 () Unit!396)

(assert (=> b!19847 (= lt!5580 e!12891)))

(declare-fun c!2118 () Bool)

(assert (=> b!19847 (= c!2118 call!975)))

(assert (=> b!19847 (= e!12893 (tuple2!825 false lt!5520))))

(declare-fun b!19848 () Bool)

(assert (=> b!19848 (= e!12883 e!12890)))

(declare-fun res!13313 () Bool)

(assert (=> b!19848 (= res!13313 (contains!221 call!961 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!19848 (=> (not res!13313) (not e!12890))))

(declare-fun bm!965 () Bool)

(assert (=> bm!965 (= call!963 (+!38 (ite c!2124 call!968 call!953) (ite c!2124 (ite c!2117 (tuple2!827 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1625 (v!1527 (underlying!83 thiss!938)))) (tuple2!827 #b1000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1625 (v!1527 (underlying!83 thiss!938))))) (tuple2!827 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1625 (v!1527 (underlying!83 thiss!938)))))))))

(declare-fun b!19849 () Bool)

(assert (=> b!19849 (= e!12882 ((_ is Undefined!47) lt!5604))))

(declare-fun b!19850 () Bool)

(declare-fun res!13320 () Bool)

(assert (=> b!19850 (=> (not res!13320) (not e!12885))))

(assert (=> b!19850 (= res!13320 call!956)))

(assert (=> b!19850 (= e!12877 e!12885)))

(declare-fun bm!966 () Bool)

(assert (=> bm!966 (= call!971 (map!375 lt!5520))))

(declare-fun bm!967 () Bool)

(assert (=> bm!967 (= call!965 call!967)))

(declare-fun bm!968 () Bool)

(assert (=> bm!968 (= call!964 call!973)))

(declare-fun bm!969 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!969 (= call!973 (inRange!0 (ite c!2127 (ite c!2118 (index!2309 lt!5578) (ite c!2116 (index!2308 lt!5595) (index!2311 lt!5595))) (ite c!2125 (index!2309 lt!5597) (ite c!2119 (index!2308 lt!5604) (index!2311 lt!5604)))) (mask!4648 lt!5520)))))

(declare-fun bm!970 () Bool)

(assert (=> bm!970 (= call!956 call!964)))

(declare-fun b!19851 () Bool)

(declare-fun lt!5589 () Unit!396)

(declare-fun lt!5586 () Unit!396)

(assert (=> b!19851 (= lt!5589 lt!5586)))

(assert (=> b!19851 (= call!962 call!954)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!3 (array!1135 array!1133 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!1101 V!1101 V!1101 Int) Unit!396)

(assert (=> b!19851 (= lt!5586 (lemmaChangeLongMinValueKeyThenAddPairToListMap!3 (_keys!3119 lt!5520) (_values!1687 lt!5520) (mask!4648 lt!5520) (extraKeys!1601 lt!5520) lt!5596 (zeroValue!1625 lt!5520) (minValue!1625 lt!5520) (zeroValue!1625 (v!1527 (underlying!83 thiss!938))) (defaultEntry!1692 lt!5520)))))

(assert (=> b!19851 (= lt!5596 (bvor (extraKeys!1601 lt!5520) #b00000000000000000000000000000010))))

(assert (=> b!19851 (= e!12879 (tuple2!825 true (LongMapFixedSize!145 (defaultEntry!1692 lt!5520) (mask!4648 lt!5520) (bvor (extraKeys!1601 lt!5520) #b00000000000000000000000000000010) (zeroValue!1625 lt!5520) (zeroValue!1625 (v!1527 (underlying!83 thiss!938))) (_size!107 lt!5520) (_keys!3119 lt!5520) (_values!1687 lt!5520) (_vacant!107 lt!5520))))))

(declare-fun b!19852 () Bool)

(assert (=> b!19852 (= e!12883 (= call!961 call!971))))

(declare-fun bm!971 () Bool)

(assert (=> bm!971 (= call!972 call!966)))

(declare-fun b!19853 () Bool)

(assert (=> b!19853 (= e!12886 (= (select (arr!542 (_keys!3119 lt!5520)) (index!2309 lt!5597)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!972 () Bool)

(assert (=> bm!972 (= call!953 (getCurrentListMap!122 (_keys!3119 lt!5520) (_values!1687 lt!5520) (mask!4648 lt!5520) (extraKeys!1601 lt!5520) (zeroValue!1625 lt!5520) (minValue!1625 lt!5520) #b00000000000000000000000000000000 (defaultEntry!1692 lt!5520)))))

(declare-fun b!19854 () Bool)

(assert (=> b!19854 (= e!12885 (not call!972))))

(declare-fun b!19855 () Bool)

(assert (=> b!19855 (= e!12887 ((_ is Undefined!47) lt!5595))))

(declare-fun b!19856 () Bool)

(assert (=> b!19856 (= e!12880 e!12889)))

(declare-fun c!2123 () Bool)

(assert (=> b!19856 (= c!2123 ((_ is MissingZero!47) lt!5583))))

(declare-fun b!19857 () Bool)

(assert (=> b!19857 (= e!12881 e!12893)))

(assert (=> b!19857 (= lt!5583 (seekEntryOrOpen!0 #b0000000000000000000000000000000000000000000000000000000000000000 (_keys!3119 lt!5520) (mask!4648 lt!5520)))))

(assert (=> b!19857 (= c!2127 ((_ is Undefined!47) lt!5583))))

(declare-fun bm!973 () Bool)

(assert (=> bm!973 (= call!960 call!967)))

(assert (= (and d!3641 c!2124) b!19838))

(assert (= (and d!3641 (not c!2124)) b!19857))

(assert (= (and b!19838 c!2117) b!19824))

(assert (= (and b!19838 (not c!2117)) b!19851))

(assert (= (or b!19824 b!19851) bm!953))

(assert (= (or b!19824 b!19851) bm!951))

(assert (= (or b!19824 b!19851) bm!959))

(assert (= (and b!19857 c!2127) b!19847))

(assert (= (and b!19857 (not c!2127)) b!19840))

(assert (= (and b!19847 c!2118) b!19834))

(assert (= (and b!19847 (not c!2118)) b!19822))

(assert (= (and b!19834 res!13312) b!19831))

(assert (= (and b!19831 res!13314) b!19823))

(assert (= (and b!19822 c!2116) b!19850))

(assert (= (and b!19822 (not c!2116)) b!19844))

(assert (= (and b!19850 res!13320) b!19836))

(assert (= (and b!19836 res!13318) b!19854))

(assert (= (and b!19844 c!2122) b!19842))

(assert (= (and b!19844 (not c!2122)) b!19855))

(assert (= (and b!19842 res!13322) b!19829))

(assert (= (and b!19829 res!13315) b!19830))

(assert (= (or b!19850 b!19842) bm!970))

(assert (= (or b!19854 b!19830) bm!971))

(assert (= (or b!19831 bm!970) bm!968))

(assert (= (or b!19834 b!19822) bm!967))

(assert (= (and b!19840 c!2121) b!19827))

(assert (= (and b!19840 (not c!2121)) b!19856))

(assert (= (and b!19856 c!2123) b!19846))

(assert (= (and b!19856 (not c!2123)) b!19843))

(assert (= (and b!19843 c!2125) b!19825))

(assert (= (and b!19843 (not c!2125)) b!19833))

(assert (= (and b!19825 res!13321) b!19837))

(assert (= (and b!19837 res!13317) b!19853))

(assert (= (and b!19833 c!2119) b!19841))

(assert (= (and b!19833 (not c!2119)) b!19828))

(assert (= (and b!19841 res!13316) b!19826))

(assert (= (and b!19826 res!13311) b!19821))

(assert (= (and b!19828 c!2126) b!19839))

(assert (= (and b!19828 (not c!2126)) b!19849))

(assert (= (and b!19839 res!13324) b!19845))

(assert (= (and b!19845 res!13319) b!19820))

(assert (= (or b!19841 b!19839) bm!952))

(assert (= (or b!19821 b!19820) bm!956))

(assert (= (or b!19837 bm!952) bm!961))

(assert (= (or b!19825 b!19833) bm!973))

(assert (= (or b!19827 b!19846) bm!960))

(assert (= (or b!19834 b!19825) bm!954))

(assert (= (or bm!968 bm!961) bm!969))

(assert (= (or b!19822 b!19833) bm!962))

(assert (= (or b!19847 b!19843) bm!950))

(assert (= (or bm!967 bm!973) bm!958))

(assert (= (or bm!971 bm!956) bm!963))

(assert (= (or b!19847 b!19843) bm!964))

(assert (= (or bm!953 b!19843) bm!957))

(assert (= (or bm!951 b!19843) bm!972))

(assert (= (or bm!959 b!19843) bm!965))

(assert (= (and d!3641 res!13323) b!19832))

(assert (= (and b!19832 c!2120) b!19848))

(assert (= (and b!19832 (not c!2120)) b!19852))

(assert (= (and b!19848 res!13313) b!19835))

(assert (= (or b!19835 b!19852) bm!966))

(assert (= (or b!19848 b!19835 b!19852) bm!955))

(declare-fun m!13901 () Bool)

(assert (=> bm!965 m!13901))

(declare-fun m!13903 () Bool)

(assert (=> bm!962 m!13903))

(declare-fun m!13905 () Bool)

(assert (=> b!19826 m!13905))

(declare-fun m!13907 () Bool)

(assert (=> bm!958 m!13907))

(declare-fun m!13909 () Bool)

(assert (=> bm!966 m!13909))

(declare-fun m!13911 () Bool)

(assert (=> bm!957 m!13911))

(declare-fun m!13913 () Bool)

(assert (=> bm!957 m!13913))

(declare-fun m!13915 () Bool)

(assert (=> b!19851 m!13915))

(declare-fun m!13917 () Bool)

(assert (=> d!3641 m!13917))

(declare-fun m!13919 () Bool)

(assert (=> d!3641 m!13919))

(assert (=> b!19857 m!13907))

(declare-fun m!13921 () Bool)

(assert (=> bm!950 m!13921))

(declare-fun m!13923 () Bool)

(assert (=> bm!960 m!13923))

(declare-fun m!13925 () Bool)

(assert (=> b!19853 m!13925))

(declare-fun m!13927 () Bool)

(assert (=> b!19824 m!13927))

(declare-fun m!13929 () Bool)

(assert (=> b!19836 m!13929))

(declare-fun m!13931 () Bool)

(assert (=> b!19843 m!13931))

(assert (=> b!19843 m!13911))

(declare-fun m!13933 () Bool)

(assert (=> b!19843 m!13933))

(declare-fun m!13935 () Bool)

(assert (=> b!19843 m!13935))

(declare-fun m!13937 () Bool)

(assert (=> bm!972 m!13937))

(declare-fun m!13939 () Bool)

(assert (=> bm!964 m!13939))

(declare-fun m!13941 () Bool)

(assert (=> bm!964 m!13941))

(declare-fun m!13943 () Bool)

(assert (=> bm!969 m!13943))

(declare-fun m!13945 () Bool)

(assert (=> bm!963 m!13945))

(declare-fun m!13947 () Bool)

(assert (=> b!19845 m!13947))

(declare-fun m!13949 () Bool)

(assert (=> b!19829 m!13949))

(declare-fun m!13951 () Bool)

(assert (=> b!19848 m!13951))

(declare-fun m!13953 () Bool)

(assert (=> bm!955 m!13953))

(declare-fun m!13955 () Bool)

(assert (=> bm!954 m!13955))

(declare-fun m!13957 () Bool)

(assert (=> b!19823 m!13957))

(declare-fun m!13959 () Bool)

(assert (=> b!19835 m!13959))

(assert (=> b!19704 d!3641))

(declare-fun b!19870 () Bool)

(declare-fun e!12904 () Bool)

(declare-fun lt!5672 () array!1135)

(declare-fun lt!5658 () tuple2!826)

(assert (=> b!19870 (= e!12904 (arrayContainsKey!0 lt!5672 (_1!416 lt!5658) #b00000000000000000000000000000000))))

(declare-fun b!19871 () Bool)

(declare-fun e!12903 () Unit!396)

(declare-fun Unit!400 () Unit!396)

(assert (=> b!19871 (= e!12903 Unit!400)))

(declare-fun b!19872 () Bool)

(declare-fun lt!5652 () (_ BitVec 32))

(assert (=> b!19872 (= e!12904 (ite (= (_1!416 lt!5658) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!5652 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!5652 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun d!3643 () Bool)

(declare-fun e!12905 () Bool)

(assert (=> d!3643 e!12905))

(declare-fun res!13330 () Bool)

(assert (=> d!3643 (=> (not res!13330) (not e!12905))))

(declare-fun lt!5670 () LongMapFixedSize!144)

(assert (=> d!3643 (= res!13330 (valid!70 lt!5670))))

(declare-fun lt!5654 () LongMapFixedSize!144)

(assert (=> d!3643 (= lt!5670 lt!5654)))

(declare-fun lt!5667 () Unit!396)

(assert (=> d!3643 (= lt!5667 e!12903)))

(declare-fun c!2133 () Bool)

(assert (=> d!3643 (= c!2133 (not (= (map!375 lt!5654) (ListLongMap!548 Nil!547))))))

(declare-fun lt!5673 () Unit!396)

(declare-fun lt!5661 () Unit!396)

(assert (=> d!3643 (= lt!5673 lt!5661)))

(declare-fun lt!5653 () array!1135)

(declare-fun lt!5666 () (_ BitVec 32))

(declare-fun lt!5660 () List!549)

(assert (=> d!3643 (arrayNoDuplicates!0 lt!5653 lt!5666 lt!5660)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!1135 (_ BitVec 32) (_ BitVec 32) List!549) Unit!396)

(assert (=> d!3643 (= lt!5661 (lemmaArrayNoDuplicatesInAll0Array!0 lt!5653 lt!5666 (bvadd (computeNewMask!8 thiss!938 (mask!4648 (v!1527 (underlying!83 thiss!938))) (_vacant!107 (v!1527 (underlying!83 thiss!938))) (_size!107 (v!1527 (underlying!83 thiss!938)))) #b00000000000000000000000000000001) lt!5660))))

(assert (=> d!3643 (= lt!5660 Nil!546)))

(assert (=> d!3643 (= lt!5666 #b00000000000000000000000000000000)))

(assert (=> d!3643 (= lt!5653 (array!1136 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!8 thiss!938 (mask!4648 (v!1527 (underlying!83 thiss!938))) (_vacant!107 (v!1527 (underlying!83 thiss!938))) (_size!107 (v!1527 (underlying!83 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!5655 () Unit!396)

(declare-fun lt!5668 () Unit!396)

(assert (=> d!3643 (= lt!5655 lt!5668)))

(declare-fun lt!5657 () (_ BitVec 32))

(declare-fun lt!5662 () array!1135)

(assert (=> d!3643 (arrayForallSeekEntryOrOpenFound!0 lt!5657 lt!5662 (computeNewMask!8 thiss!938 (mask!4648 (v!1527 (underlying!83 thiss!938))) (_vacant!107 (v!1527 (underlying!83 thiss!938))) (_size!107 (v!1527 (underlying!83 thiss!938)))))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!1135 (_ BitVec 32) (_ BitVec 32)) Unit!396)

(assert (=> d!3643 (= lt!5668 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!5662 (computeNewMask!8 thiss!938 (mask!4648 (v!1527 (underlying!83 thiss!938))) (_vacant!107 (v!1527 (underlying!83 thiss!938))) (_size!107 (v!1527 (underlying!83 thiss!938)))) lt!5657))))

(assert (=> d!3643 (= lt!5657 #b00000000000000000000000000000000)))

(assert (=> d!3643 (= lt!5662 (array!1136 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!8 thiss!938 (mask!4648 (v!1527 (underlying!83 thiss!938))) (_vacant!107 (v!1527 (underlying!83 thiss!938))) (_size!107 (v!1527 (underlying!83 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun lt!5651 () Unit!396)

(declare-fun lt!5659 () Unit!396)

(assert (=> d!3643 (= lt!5651 lt!5659)))

(declare-fun lt!5656 () array!1135)

(declare-fun lt!5665 () (_ BitVec 32))

(declare-fun lt!5663 () (_ BitVec 32))

(assert (=> d!3643 (= (arrayCountValidKeys!0 lt!5656 lt!5665 lt!5663) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!1135 (_ BitVec 32) (_ BitVec 32)) Unit!396)

(assert (=> d!3643 (= lt!5659 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!5656 lt!5665 lt!5663))))

(assert (=> d!3643 (= lt!5663 (bvadd (computeNewMask!8 thiss!938 (mask!4648 (v!1527 (underlying!83 thiss!938))) (_vacant!107 (v!1527 (underlying!83 thiss!938))) (_size!107 (v!1527 (underlying!83 thiss!938)))) #b00000000000000000000000000000001))))

(assert (=> d!3643 (= lt!5665 #b00000000000000000000000000000000)))

(assert (=> d!3643 (= lt!5656 (array!1136 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!8 thiss!938 (mask!4648 (v!1527 (underlying!83 thiss!938))) (_vacant!107 (v!1527 (underlying!83 thiss!938))) (_size!107 (v!1527 (underlying!83 thiss!938)))) #b00000000000000000000000000000001)))))

(declare-fun dynLambda!135 (Int (_ BitVec 64)) V!1101)

(assert (=> d!3643 (= lt!5654 (LongMapFixedSize!145 (defaultEntry!1692 (v!1527 (underlying!83 thiss!938))) (computeNewMask!8 thiss!938 (mask!4648 (v!1527 (underlying!83 thiss!938))) (_vacant!107 (v!1527 (underlying!83 thiss!938))) (_size!107 (v!1527 (underlying!83 thiss!938)))) #b00000000000000000000000000000000 (dynLambda!135 (defaultEntry!1692 (v!1527 (underlying!83 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!135 (defaultEntry!1692 (v!1527 (underlying!83 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!1136 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!8 thiss!938 (mask!4648 (v!1527 (underlying!83 thiss!938))) (_vacant!107 (v!1527 (underlying!83 thiss!938))) (_size!107 (v!1527 (underlying!83 thiss!938)))) #b00000000000000000000000000000001)) (array!1134 ((as const (Array (_ BitVec 32) ValueCell!279)) EmptyCell!279) (bvadd (computeNewMask!8 thiss!938 (mask!4648 (v!1527 (underlying!83 thiss!938))) (_vacant!107 (v!1527 (underlying!83 thiss!938))) (_size!107 (v!1527 (underlying!83 thiss!938)))) #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!3643 (validMask!0 (computeNewMask!8 thiss!938 (mask!4648 (v!1527 (underlying!83 thiss!938))) (_vacant!107 (v!1527 (underlying!83 thiss!938))) (_size!107 (v!1527 (underlying!83 thiss!938)))))))

(assert (=> d!3643 (= (getNewLongMapFixedSize!12 (computeNewMask!8 thiss!938 (mask!4648 (v!1527 (underlying!83 thiss!938))) (_vacant!107 (v!1527 (underlying!83 thiss!938))) (_size!107 (v!1527 (underlying!83 thiss!938)))) (defaultEntry!1692 (v!1527 (underlying!83 thiss!938)))) lt!5670)))

(declare-fun b!19873 () Bool)

(assert (=> b!19873 (= e!12905 (= (map!375 lt!5670) (ListLongMap!548 Nil!547)))))

(declare-fun b!19874 () Bool)

(declare-fun Unit!401 () Unit!396)

(assert (=> b!19874 (= e!12903 Unit!401)))

(declare-fun head!821 (List!550) tuple2!826)

(assert (=> b!19874 (= lt!5658 (head!821 (toList!289 (map!375 lt!5654))))))

(assert (=> b!19874 (= lt!5672 (array!1136 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!8 thiss!938 (mask!4648 (v!1527 (underlying!83 thiss!938))) (_vacant!107 (v!1527 (underlying!83 thiss!938))) (_size!107 (v!1527 (underlying!83 thiss!938)))) #b00000000000000000000000000000001)))))

(assert (=> b!19874 (= lt!5652 #b00000000000000000000000000000000)))

(declare-fun lt!5671 () Unit!396)

(declare-fun lemmaKeyInListMapIsInArray!82 (array!1135 array!1133 (_ BitVec 32) (_ BitVec 32) V!1101 V!1101 (_ BitVec 64) Int) Unit!396)

(assert (=> b!19874 (= lt!5671 (lemmaKeyInListMapIsInArray!82 lt!5672 (array!1134 ((as const (Array (_ BitVec 32) ValueCell!279)) EmptyCell!279) (bvadd (computeNewMask!8 thiss!938 (mask!4648 (v!1527 (underlying!83 thiss!938))) (_vacant!107 (v!1527 (underlying!83 thiss!938))) (_size!107 (v!1527 (underlying!83 thiss!938)))) #b00000000000000000000000000000001)) (computeNewMask!8 thiss!938 (mask!4648 (v!1527 (underlying!83 thiss!938))) (_vacant!107 (v!1527 (underlying!83 thiss!938))) (_size!107 (v!1527 (underlying!83 thiss!938)))) lt!5652 (dynLambda!135 (defaultEntry!1692 (v!1527 (underlying!83 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!135 (defaultEntry!1692 (v!1527 (underlying!83 thiss!938))) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!416 lt!5658) (defaultEntry!1692 (v!1527 (underlying!83 thiss!938)))))))

(declare-fun c!2132 () Bool)

(assert (=> b!19874 (= c!2132 (and (not (= (_1!416 lt!5658) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!416 lt!5658) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!19874 e!12904))

(declare-fun lt!5664 () Unit!396)

(assert (=> b!19874 (= lt!5664 lt!5671)))

(declare-fun lt!5669 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1135 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!19874 (= lt!5669 (arrayScanForKey!0 (array!1136 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd (computeNewMask!8 thiss!938 (mask!4648 (v!1527 (underlying!83 thiss!938))) (_vacant!107 (v!1527 (underlying!83 thiss!938))) (_size!107 (v!1527 (underlying!83 thiss!938)))) #b00000000000000000000000000000001)) (_1!416 lt!5658) #b00000000000000000000000000000000))))

(assert (=> b!19874 false))

(declare-fun b!19875 () Bool)

(declare-fun res!13329 () Bool)

(assert (=> b!19875 (=> (not res!13329) (not e!12905))))

(assert (=> b!19875 (= res!13329 (= (mask!4648 lt!5670) (computeNewMask!8 thiss!938 (mask!4648 (v!1527 (underlying!83 thiss!938))) (_vacant!107 (v!1527 (underlying!83 thiss!938))) (_size!107 (v!1527 (underlying!83 thiss!938))))))))

(assert (= (and d!3643 c!2133) b!19874))

(assert (= (and d!3643 (not c!2133)) b!19871))

(assert (= (and b!19874 c!2132) b!19870))

(assert (= (and b!19874 (not c!2132)) b!19872))

(assert (= (and d!3643 res!13330) b!19875))

(assert (= (and b!19875 res!13329) b!19873))

(declare-fun b_lambda!1473 () Bool)

(assert (=> (not b_lambda!1473) (not d!3643)))

(declare-fun t!3195 () Bool)

(declare-fun tb!633 () Bool)

(assert (=> (and b!19705 (= (defaultEntry!1692 (v!1527 (underlying!83 thiss!938))) (defaultEntry!1692 (v!1527 (underlying!83 thiss!938)))) t!3195) tb!633))

(declare-fun result!1033 () Bool)

(assert (=> tb!633 (= result!1033 tp_is_empty!957)))

(assert (=> d!3643 t!3195))

(declare-fun b_and!1361 () Bool)

(assert (= b_and!1357 (and (=> t!3195 result!1033) b_and!1361)))

(declare-fun b_lambda!1475 () Bool)

(assert (=> (not b_lambda!1475) (not b!19874)))

(assert (=> b!19874 t!3195))

(declare-fun b_and!1363 () Bool)

(assert (= b_and!1361 (and (=> t!3195 result!1033) b_and!1363)))

(declare-fun m!13961 () Bool)

(assert (=> b!19870 m!13961))

(declare-fun m!13963 () Bool)

(assert (=> d!3643 m!13963))

(declare-fun m!13965 () Bool)

(assert (=> d!3643 m!13965))

(assert (=> d!3643 m!13871))

(declare-fun m!13967 () Bool)

(assert (=> d!3643 m!13967))

(declare-fun m!13969 () Bool)

(assert (=> d!3643 m!13969))

(assert (=> d!3643 m!13871))

(declare-fun m!13971 () Bool)

(assert (=> d!3643 m!13971))

(declare-fun m!13973 () Bool)

(assert (=> d!3643 m!13973))

(declare-fun m!13975 () Bool)

(assert (=> d!3643 m!13975))

(assert (=> d!3643 m!13871))

(declare-fun m!13977 () Bool)

(assert (=> d!3643 m!13977))

(declare-fun m!13979 () Bool)

(assert (=> d!3643 m!13979))

(declare-fun m!13981 () Bool)

(assert (=> d!3643 m!13981))

(declare-fun m!13983 () Bool)

(assert (=> b!19873 m!13983))

(assert (=> b!19874 m!13965))

(assert (=> b!19874 m!13871))

(assert (=> b!19874 m!13965))

(assert (=> b!19874 m!13965))

(declare-fun m!13985 () Bool)

(assert (=> b!19874 m!13985))

(declare-fun m!13987 () Bool)

(assert (=> b!19874 m!13987))

(declare-fun m!13989 () Bool)

(assert (=> b!19874 m!13989))

(assert (=> b!19874 m!13973))

(assert (=> b!19706 d!3643))

(declare-fun d!3645 () Bool)

(declare-fun e!12910 () Bool)

(assert (=> d!3645 e!12910))

(declare-fun res!13333 () Bool)

(assert (=> d!3645 (=> (not res!13333) (not e!12910))))

(declare-fun lt!5679 () (_ BitVec 32))

(assert (=> d!3645 (= res!13333 (validMask!0 lt!5679))))

(declare-datatypes ((tuple2!828 0))(
  ( (tuple2!829 (_1!417 Unit!396) (_2!417 (_ BitVec 32))) )
))
(declare-fun e!12911 () tuple2!828)

(assert (=> d!3645 (= lt!5679 (_2!417 e!12911))))

(declare-fun c!2136 () Bool)

(declare-fun lt!5678 () tuple2!828)

(assert (=> d!3645 (= c!2136 (and (bvsgt (_2!417 lt!5678) #b00000000000000000000000000001000) (bvslt (bvmul #b00000000000000000000000000001000 (_size!107 (v!1527 (underlying!83 thiss!938)))) (_2!417 lt!5678)) (bvsge (bvadd (bvand (bvashr (_2!417 lt!5678) #b00000000000000000000000000000001) #b00111111111111111111111111111111) #b00000000000000000000000000000001) (_size!107 (v!1527 (underlying!83 thiss!938))))))))

(declare-fun Unit!402 () Unit!396)

(declare-fun Unit!403 () Unit!396)

(assert (=> d!3645 (= lt!5678 (ite (and (bvsge (bvmul #b00000000000000000000000000000010 (bvadd (_size!107 (v!1527 (underlying!83 thiss!938))) (_vacant!107 (v!1527 (underlying!83 thiss!938))))) (mask!4648 (v!1527 (underlying!83 thiss!938)))) (bvsle (bvmul #b00000000000000000000000000000101 (_vacant!107 (v!1527 (underlying!83 thiss!938)))) (mask!4648 (v!1527 (underlying!83 thiss!938))))) (tuple2!829 Unit!402 (bvand (bvadd (bvshl (mask!4648 (v!1527 (underlying!83 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00111111111111111111111111111111)) (tuple2!829 Unit!403 (mask!4648 (v!1527 (underlying!83 thiss!938))))))))

(assert (=> d!3645 (validMask!0 (mask!4648 (v!1527 (underlying!83 thiss!938))))))

(assert (=> d!3645 (= (computeNewMask!8 thiss!938 (mask!4648 (v!1527 (underlying!83 thiss!938))) (_vacant!107 (v!1527 (underlying!83 thiss!938))) (_size!107 (v!1527 (underlying!83 thiss!938)))) lt!5679)))

(declare-fun b!19884 () Bool)

(declare-fun computeNewMaskWhile!5 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!828)

(assert (=> b!19884 (= e!12911 (computeNewMaskWhile!5 (_size!107 (v!1527 (underlying!83 thiss!938))) (_vacant!107 (v!1527 (underlying!83 thiss!938))) (mask!4648 (v!1527 (underlying!83 thiss!938))) (_2!417 lt!5678)))))

(declare-fun b!19885 () Bool)

(declare-fun Unit!404 () Unit!396)

(assert (=> b!19885 (= e!12911 (tuple2!829 Unit!404 (_2!417 lt!5678)))))

(declare-fun b!19886 () Bool)

(assert (=> b!19886 (= e!12910 (bvsle (_size!107 (v!1527 (underlying!83 thiss!938))) (bvadd lt!5679 #b00000000000000000000000000000001)))))

(assert (= (and d!3645 c!2136) b!19884))

(assert (= (and d!3645 (not c!2136)) b!19885))

(assert (= (and d!3645 res!13333) b!19886))

(declare-fun m!13991 () Bool)

(assert (=> d!3645 m!13991))

(declare-fun m!13993 () Bool)

(assert (=> d!3645 m!13993))

(declare-fun m!13995 () Bool)

(assert (=> b!19884 m!13995))

(assert (=> b!19706 d!3645))

(declare-fun condMapEmpty!904 () Bool)

(declare-fun mapDefault!904 () ValueCell!279)

(assert (=> mapNonEmpty!898 (= condMapEmpty!904 (= mapRest!898 ((as const (Array (_ BitVec 32) ValueCell!279)) mapDefault!904)))))

(declare-fun e!12917 () Bool)

(declare-fun mapRes!904 () Bool)

(assert (=> mapNonEmpty!898 (= tp!3297 (and e!12917 mapRes!904))))

(declare-fun mapIsEmpty!904 () Bool)

(assert (=> mapIsEmpty!904 mapRes!904))

(declare-fun b!19893 () Bool)

(declare-fun e!12916 () Bool)

(assert (=> b!19893 (= e!12916 tp_is_empty!957)))

(declare-fun b!19894 () Bool)

(assert (=> b!19894 (= e!12917 tp_is_empty!957)))

(declare-fun mapNonEmpty!904 () Bool)

(declare-fun tp!3307 () Bool)

(assert (=> mapNonEmpty!904 (= mapRes!904 (and tp!3307 e!12916))))

(declare-fun mapRest!904 () (Array (_ BitVec 32) ValueCell!279))

(declare-fun mapKey!904 () (_ BitVec 32))

(declare-fun mapValue!904 () ValueCell!279)

(assert (=> mapNonEmpty!904 (= mapRest!898 (store mapRest!904 mapKey!904 mapValue!904))))

(assert (= (and mapNonEmpty!898 condMapEmpty!904) mapIsEmpty!904))

(assert (= (and mapNonEmpty!898 (not condMapEmpty!904)) mapNonEmpty!904))

(assert (= (and mapNonEmpty!904 ((_ is ValueCellFull!279) mapValue!904)) b!19893))

(assert (= (and mapNonEmpty!898 ((_ is ValueCellFull!279) mapDefault!904)) b!19894))

(declare-fun m!13997 () Bool)

(assert (=> mapNonEmpty!904 m!13997))

(declare-fun b_lambda!1477 () Bool)

(assert (= b_lambda!1473 (or (and b!19705 b_free!693) b_lambda!1477)))

(declare-fun b_lambda!1479 () Bool)

(assert (= b_lambda!1475 (or (and b!19705 b_free!693) b_lambda!1479)))

(check-sat (not bm!964) (not b!19743) (not b!19843) (not bm!954) (not bm!962) (not b!19824) (not bm!969) (not bm!958) (not b!19851) (not b!19835) (not bm!965) (not d!3633) (not b!19857) (not b!19873) (not b!19741) b_and!1363 (not b!19848) (not b_lambda!1479) (not mapNonEmpty!904) (not bm!950) (not bm!955) (not b!19884) (not bm!966) (not bm!960) (not b!19874) (not bm!972) (not d!3645) (not b_next!693) (not d!3639) (not d!3641) (not b!19742) (not d!3643) (not b!19870) (not bm!957) (not bm!963) (not b_lambda!1477) tp_is_empty!957)
(check-sat b_and!1363 (not b_next!693))

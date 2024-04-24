; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107796 () Bool)

(assert start!107796)

(declare-fun b!1274801 () Bool)

(declare-fun b_free!27727 () Bool)

(declare-fun b_next!27727 () Bool)

(assert (=> b!1274801 (= b_free!27727 (not b_next!27727))))

(declare-fun tp!97732 () Bool)

(declare-fun b_and!45785 () Bool)

(assert (=> b!1274801 (= tp!97732 b_and!45785)))

(declare-fun e!727445 () Bool)

(declare-fun e!727443 () Bool)

(declare-fun tp_is_empty!33097 () Bool)

(declare-datatypes ((V!49323 0))(
  ( (V!49324 (val!16623 Int)) )
))
(declare-datatypes ((ValueCell!15695 0))(
  ( (ValueCellFull!15695 (v!19255 V!49323)) (EmptyCell!15695) )
))
(declare-datatypes ((array!83485 0))(
  ( (array!83486 (arr!40262 (Array (_ BitVec 32) ValueCell!15695)) (size!40806 (_ BitVec 32))) )
))
(declare-datatypes ((array!83487 0))(
  ( (array!83488 (arr!40263 (Array (_ BitVec 32) (_ BitVec 64))) (size!40807 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6154 0))(
  ( (LongMapFixedSize!6155 (defaultEntry!6723 Int) (mask!34567 (_ BitVec 32)) (extraKeys!6402 (_ BitVec 32)) (zeroValue!6508 V!49323) (minValue!6508 V!49323) (_size!3132 (_ BitVec 32)) (_keys!12175 array!83487) (_values!6746 array!83485) (_vacant!3132 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6154)

(declare-fun array_inv!30787 (array!83487) Bool)

(declare-fun array_inv!30788 (array!83485) Bool)

(assert (=> b!1274801 (= e!727445 (and tp!97732 tp_is_empty!33097 (array_inv!30787 (_keys!12175 thiss!1551)) (array_inv!30788 (_values!6746 thiss!1551)) e!727443))))

(declare-fun b!1274802 () Bool)

(declare-fun e!727446 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1274802 (= e!727446 (not (validMask!0 (mask!34567 thiss!1551))))))

(declare-fun b!1274803 () Bool)

(declare-fun e!727447 () Bool)

(declare-fun mapRes!51271 () Bool)

(assert (=> b!1274803 (= e!727443 (and e!727447 mapRes!51271))))

(declare-fun condMapEmpty!51271 () Bool)

(declare-fun mapDefault!51271 () ValueCell!15695)

(assert (=> b!1274803 (= condMapEmpty!51271 (= (arr!40262 (_values!6746 thiss!1551)) ((as const (Array (_ BitVec 32) ValueCell!15695)) mapDefault!51271)))))

(declare-fun b!1274804 () Bool)

(assert (=> b!1274804 (= e!727447 tp_is_empty!33097)))

(declare-fun mapNonEmpty!51271 () Bool)

(declare-fun tp!97731 () Bool)

(declare-fun e!727444 () Bool)

(assert (=> mapNonEmpty!51271 (= mapRes!51271 (and tp!97731 e!727444))))

(declare-fun mapValue!51271 () ValueCell!15695)

(declare-fun mapKey!51271 () (_ BitVec 32))

(declare-fun mapRest!51271 () (Array (_ BitVec 32) ValueCell!15695))

(assert (=> mapNonEmpty!51271 (= (arr!40262 (_values!6746 thiss!1551)) (store mapRest!51271 mapKey!51271 mapValue!51271))))

(declare-fun res!847386 () Bool)

(assert (=> start!107796 (=> (not res!847386) (not e!727446))))

(declare-fun simpleValid!467 (LongMapFixedSize!6154) Bool)

(assert (=> start!107796 (= res!847386 (simpleValid!467 thiss!1551))))

(assert (=> start!107796 e!727446))

(assert (=> start!107796 e!727445))

(declare-fun b!1274805 () Bool)

(assert (=> b!1274805 (= e!727444 tp_is_empty!33097)))

(declare-fun mapIsEmpty!51271 () Bool)

(assert (=> mapIsEmpty!51271 mapRes!51271))

(declare-fun b!1274806 () Bool)

(declare-fun res!847387 () Bool)

(assert (=> b!1274806 (=> (not res!847387) (not e!727446))))

(declare-fun arrayCountValidKeys!0 (array!83487 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1274806 (= res!847387 (= (arrayCountValidKeys!0 (_keys!12175 thiss!1551) #b00000000000000000000000000000000 (size!40807 (_keys!12175 thiss!1551))) (_size!3132 thiss!1551)))))

(assert (= (and start!107796 res!847386) b!1274806))

(assert (= (and b!1274806 res!847387) b!1274802))

(assert (= (and b!1274803 condMapEmpty!51271) mapIsEmpty!51271))

(assert (= (and b!1274803 (not condMapEmpty!51271)) mapNonEmpty!51271))

(get-info :version)

(assert (= (and mapNonEmpty!51271 ((_ is ValueCellFull!15695) mapValue!51271)) b!1274805))

(assert (= (and b!1274803 ((_ is ValueCellFull!15695) mapDefault!51271)) b!1274804))

(assert (= b!1274801 b!1274803))

(assert (= start!107796 b!1274801))

(declare-fun m!1172267 () Bool)

(assert (=> b!1274802 m!1172267))

(declare-fun m!1172269 () Bool)

(assert (=> start!107796 m!1172269))

(declare-fun m!1172271 () Bool)

(assert (=> mapNonEmpty!51271 m!1172271))

(declare-fun m!1172273 () Bool)

(assert (=> b!1274806 m!1172273))

(declare-fun m!1172275 () Bool)

(assert (=> b!1274801 m!1172275))

(declare-fun m!1172277 () Bool)

(assert (=> b!1274801 m!1172277))

(check-sat (not b!1274806) tp_is_empty!33097 (not start!107796) (not mapNonEmpty!51271) (not b_next!27727) b_and!45785 (not b!1274801) (not b!1274802))
(check-sat b_and!45785 (not b_next!27727))
(get-model)

(declare-fun b!1274853 () Bool)

(declare-fun res!847410 () Bool)

(declare-fun e!727487 () Bool)

(assert (=> b!1274853 (=> (not res!847410) (not e!727487))))

(declare-fun size!40812 (LongMapFixedSize!6154) (_ BitVec 32))

(assert (=> b!1274853 (= res!847410 (= (size!40812 thiss!1551) (bvadd (_size!3132 thiss!1551) (bvsdiv (bvadd (extraKeys!6402 thiss!1551) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!140453 () Bool)

(declare-fun res!847409 () Bool)

(assert (=> d!140453 (=> (not res!847409) (not e!727487))))

(assert (=> d!140453 (= res!847409 (validMask!0 (mask!34567 thiss!1551)))))

(assert (=> d!140453 (= (simpleValid!467 thiss!1551) e!727487)))

(declare-fun b!1274854 () Bool)

(assert (=> b!1274854 (= e!727487 (and (bvsge (extraKeys!6402 thiss!1551) #b00000000000000000000000000000000) (bvsle (extraKeys!6402 thiss!1551) #b00000000000000000000000000000011) (bvsge (_vacant!3132 thiss!1551) #b00000000000000000000000000000000)))))

(declare-fun b!1274852 () Bool)

(declare-fun res!847408 () Bool)

(assert (=> b!1274852 (=> (not res!847408) (not e!727487))))

(assert (=> b!1274852 (= res!847408 (bvsge (size!40812 thiss!1551) (_size!3132 thiss!1551)))))

(declare-fun b!1274851 () Bool)

(declare-fun res!847411 () Bool)

(assert (=> b!1274851 (=> (not res!847411) (not e!727487))))

(assert (=> b!1274851 (= res!847411 (and (= (size!40806 (_values!6746 thiss!1551)) (bvadd (mask!34567 thiss!1551) #b00000000000000000000000000000001)) (= (size!40807 (_keys!12175 thiss!1551)) (size!40806 (_values!6746 thiss!1551))) (bvsge (_size!3132 thiss!1551) #b00000000000000000000000000000000) (bvsle (_size!3132 thiss!1551) (bvadd (mask!34567 thiss!1551) #b00000000000000000000000000000001))))))

(assert (= (and d!140453 res!847409) b!1274851))

(assert (= (and b!1274851 res!847411) b!1274852))

(assert (= (and b!1274852 res!847408) b!1274853))

(assert (= (and b!1274853 res!847410) b!1274854))

(declare-fun m!1172303 () Bool)

(assert (=> b!1274853 m!1172303))

(assert (=> d!140453 m!1172267))

(assert (=> b!1274852 m!1172303))

(assert (=> start!107796 d!140453))

(declare-fun d!140455 () Bool)

(declare-fun lt!575618 () (_ BitVec 32))

(assert (=> d!140455 (and (bvsge lt!575618 #b00000000000000000000000000000000) (bvsle lt!575618 (bvsub (size!40807 (_keys!12175 thiss!1551)) #b00000000000000000000000000000000)))))

(declare-fun e!727493 () (_ BitVec 32))

(assert (=> d!140455 (= lt!575618 e!727493)))

(declare-fun c!124164 () Bool)

(assert (=> d!140455 (= c!124164 (bvsge #b00000000000000000000000000000000 (size!40807 (_keys!12175 thiss!1551))))))

(assert (=> d!140455 (and (bvsle #b00000000000000000000000000000000 (size!40807 (_keys!12175 thiss!1551))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!40807 (_keys!12175 thiss!1551)) (size!40807 (_keys!12175 thiss!1551))))))

(assert (=> d!140455 (= (arrayCountValidKeys!0 (_keys!12175 thiss!1551) #b00000000000000000000000000000000 (size!40807 (_keys!12175 thiss!1551))) lt!575618)))

(declare-fun bm!62662 () Bool)

(declare-fun call!62665 () (_ BitVec 32))

(assert (=> bm!62662 (= call!62665 (arrayCountValidKeys!0 (_keys!12175 thiss!1551) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40807 (_keys!12175 thiss!1551))))))

(declare-fun b!1274863 () Bool)

(declare-fun e!727492 () (_ BitVec 32))

(assert (=> b!1274863 (= e!727493 e!727492)))

(declare-fun c!124165 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1274863 (= c!124165 (validKeyInArray!0 (select (arr!40263 (_keys!12175 thiss!1551)) #b00000000000000000000000000000000)))))

(declare-fun b!1274864 () Bool)

(assert (=> b!1274864 (= e!727492 call!62665)))

(declare-fun b!1274865 () Bool)

(assert (=> b!1274865 (= e!727493 #b00000000000000000000000000000000)))

(declare-fun b!1274866 () Bool)

(assert (=> b!1274866 (= e!727492 (bvadd #b00000000000000000000000000000001 call!62665))))

(assert (= (and d!140455 c!124164) b!1274865))

(assert (= (and d!140455 (not c!124164)) b!1274863))

(assert (= (and b!1274863 c!124165) b!1274866))

(assert (= (and b!1274863 (not c!124165)) b!1274864))

(assert (= (or b!1274866 b!1274864) bm!62662))

(declare-fun m!1172305 () Bool)

(assert (=> bm!62662 m!1172305))

(declare-fun m!1172307 () Bool)

(assert (=> b!1274863 m!1172307))

(assert (=> b!1274863 m!1172307))

(declare-fun m!1172309 () Bool)

(assert (=> b!1274863 m!1172309))

(assert (=> b!1274806 d!140455))

(declare-fun d!140457 () Bool)

(assert (=> d!140457 (= (validMask!0 (mask!34567 thiss!1551)) (and (or (= (mask!34567 thiss!1551) #b00000000000000000000000000000111) (= (mask!34567 thiss!1551) #b00000000000000000000000000001111) (= (mask!34567 thiss!1551) #b00000000000000000000000000011111) (= (mask!34567 thiss!1551) #b00000000000000000000000000111111) (= (mask!34567 thiss!1551) #b00000000000000000000000001111111) (= (mask!34567 thiss!1551) #b00000000000000000000000011111111) (= (mask!34567 thiss!1551) #b00000000000000000000000111111111) (= (mask!34567 thiss!1551) #b00000000000000000000001111111111) (= (mask!34567 thiss!1551) #b00000000000000000000011111111111) (= (mask!34567 thiss!1551) #b00000000000000000000111111111111) (= (mask!34567 thiss!1551) #b00000000000000000001111111111111) (= (mask!34567 thiss!1551) #b00000000000000000011111111111111) (= (mask!34567 thiss!1551) #b00000000000000000111111111111111) (= (mask!34567 thiss!1551) #b00000000000000001111111111111111) (= (mask!34567 thiss!1551) #b00000000000000011111111111111111) (= (mask!34567 thiss!1551) #b00000000000000111111111111111111) (= (mask!34567 thiss!1551) #b00000000000001111111111111111111) (= (mask!34567 thiss!1551) #b00000000000011111111111111111111) (= (mask!34567 thiss!1551) #b00000000000111111111111111111111) (= (mask!34567 thiss!1551) #b00000000001111111111111111111111) (= (mask!34567 thiss!1551) #b00000000011111111111111111111111) (= (mask!34567 thiss!1551) #b00000000111111111111111111111111) (= (mask!34567 thiss!1551) #b00000001111111111111111111111111) (= (mask!34567 thiss!1551) #b00000011111111111111111111111111) (= (mask!34567 thiss!1551) #b00000111111111111111111111111111) (= (mask!34567 thiss!1551) #b00001111111111111111111111111111) (= (mask!34567 thiss!1551) #b00011111111111111111111111111111) (= (mask!34567 thiss!1551) #b00111111111111111111111111111111)) (bvsle (mask!34567 thiss!1551) #b00111111111111111111111111111111)))))

(assert (=> b!1274802 d!140457))

(declare-fun d!140459 () Bool)

(assert (=> d!140459 (= (array_inv!30787 (_keys!12175 thiss!1551)) (bvsge (size!40807 (_keys!12175 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1274801 d!140459))

(declare-fun d!140461 () Bool)

(assert (=> d!140461 (= (array_inv!30788 (_values!6746 thiss!1551)) (bvsge (size!40806 (_values!6746 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1274801 d!140461))

(declare-fun mapNonEmpty!51280 () Bool)

(declare-fun mapRes!51280 () Bool)

(declare-fun tp!97747 () Bool)

(declare-fun e!727499 () Bool)

(assert (=> mapNonEmpty!51280 (= mapRes!51280 (and tp!97747 e!727499))))

(declare-fun mapKey!51280 () (_ BitVec 32))

(declare-fun mapRest!51280 () (Array (_ BitVec 32) ValueCell!15695))

(declare-fun mapValue!51280 () ValueCell!15695)

(assert (=> mapNonEmpty!51280 (= mapRest!51271 (store mapRest!51280 mapKey!51280 mapValue!51280))))

(declare-fun condMapEmpty!51280 () Bool)

(declare-fun mapDefault!51280 () ValueCell!15695)

(assert (=> mapNonEmpty!51271 (= condMapEmpty!51280 (= mapRest!51271 ((as const (Array (_ BitVec 32) ValueCell!15695)) mapDefault!51280)))))

(declare-fun e!727498 () Bool)

(assert (=> mapNonEmpty!51271 (= tp!97731 (and e!727498 mapRes!51280))))

(declare-fun b!1274874 () Bool)

(assert (=> b!1274874 (= e!727498 tp_is_empty!33097)))

(declare-fun b!1274873 () Bool)

(assert (=> b!1274873 (= e!727499 tp_is_empty!33097)))

(declare-fun mapIsEmpty!51280 () Bool)

(assert (=> mapIsEmpty!51280 mapRes!51280))

(assert (= (and mapNonEmpty!51271 condMapEmpty!51280) mapIsEmpty!51280))

(assert (= (and mapNonEmpty!51271 (not condMapEmpty!51280)) mapNonEmpty!51280))

(assert (= (and mapNonEmpty!51280 ((_ is ValueCellFull!15695) mapValue!51280)) b!1274873))

(assert (= (and mapNonEmpty!51271 ((_ is ValueCellFull!15695) mapDefault!51280)) b!1274874))

(declare-fun m!1172311 () Bool)

(assert (=> mapNonEmpty!51280 m!1172311))

(check-sat (not bm!62662) (not d!140453) (not b!1274863) tp_is_empty!33097 (not mapNonEmpty!51280) (not b_next!27727) b_and!45785 (not b!1274853) (not b!1274852))
(check-sat b_and!45785 (not b_next!27727))

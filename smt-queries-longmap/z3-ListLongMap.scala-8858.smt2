; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107472 () Bool)

(assert start!107472)

(declare-fun b!1272928 () Bool)

(declare-fun b_free!27693 () Bool)

(declare-fun b_next!27693 () Bool)

(assert (=> b!1272928 (= b_free!27693 (not b_next!27693))))

(declare-fun tp!97609 () Bool)

(declare-fun b_and!45749 () Bool)

(assert (=> b!1272928 (= tp!97609 b_and!45749)))

(declare-fun res!846606 () Bool)

(declare-fun e!726153 () Bool)

(assert (=> start!107472 (=> (not res!846606) (not e!726153))))

(declare-datatypes ((V!49277 0))(
  ( (V!49278 (val!16606 Int)) )
))
(declare-datatypes ((ValueCell!15678 0))(
  ( (ValueCellFull!15678 (v!19243 V!49277)) (EmptyCell!15678) )
))
(declare-datatypes ((array!83388 0))(
  ( (array!83389 (arr!40224 (Array (_ BitVec 32) ValueCell!15678)) (size!40764 (_ BitVec 32))) )
))
(declare-datatypes ((array!83390 0))(
  ( (array!83391 (arr!40225 (Array (_ BitVec 32) (_ BitVec 64))) (size!40765 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6120 0))(
  ( (LongMapFixedSize!6121 (defaultEntry!6706 Int) (mask!34469 (_ BitVec 32)) (extraKeys!6385 (_ BitVec 32)) (zeroValue!6491 V!49277) (minValue!6491 V!49277) (_size!3115 (_ BitVec 32)) (_keys!12116 array!83390) (_values!6729 array!83388) (_vacant!3115 (_ BitVec 32))) )
))
(declare-fun thiss!1559 () LongMapFixedSize!6120)

(declare-fun valid!2296 (LongMapFixedSize!6120) Bool)

(assert (=> start!107472 (= res!846606 (valid!2296 thiss!1559))))

(assert (=> start!107472 e!726153))

(declare-fun e!726154 () Bool)

(assert (=> start!107472 e!726154))

(declare-fun b!1272925 () Bool)

(declare-fun res!846605 () Bool)

(assert (=> b!1272925 (=> (not res!846605) (not e!726153))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1272925 (= res!846605 (validMask!0 (mask!34469 thiss!1559)))))

(declare-fun mapIsEmpty!51200 () Bool)

(declare-fun mapRes!51200 () Bool)

(assert (=> mapIsEmpty!51200 mapRes!51200))

(declare-fun b!1272926 () Bool)

(declare-fun e!726156 () Bool)

(declare-fun tp_is_empty!33063 () Bool)

(assert (=> b!1272926 (= e!726156 tp_is_empty!33063)))

(declare-fun b!1272927 () Bool)

(assert (=> b!1272927 (= e!726153 (and (= (size!40764 (_values!6729 thiss!1559)) (bvadd #b00000000000000000000000000000001 (mask!34469 thiss!1559))) (= (size!40765 (_keys!12116 thiss!1559)) (size!40764 (_values!6729 thiss!1559))) (bvsge (mask!34469 thiss!1559) #b00000000000000000000000000000000) (bvsge (extraKeys!6385 thiss!1559) #b00000000000000000000000000000000) (bvsgt (extraKeys!6385 thiss!1559) #b00000000000000000000000000000011)))))

(declare-fun e!726152 () Bool)

(declare-fun array_inv!30591 (array!83390) Bool)

(declare-fun array_inv!30592 (array!83388) Bool)

(assert (=> b!1272928 (= e!726154 (and tp!97609 tp_is_empty!33063 (array_inv!30591 (_keys!12116 thiss!1559)) (array_inv!30592 (_values!6729 thiss!1559)) e!726152))))

(declare-fun b!1272929 () Bool)

(declare-fun e!726155 () Bool)

(assert (=> b!1272929 (= e!726155 tp_is_empty!33063)))

(declare-fun mapNonEmpty!51200 () Bool)

(declare-fun tp!97610 () Bool)

(assert (=> mapNonEmpty!51200 (= mapRes!51200 (and tp!97610 e!726155))))

(declare-fun mapRest!51200 () (Array (_ BitVec 32) ValueCell!15678))

(declare-fun mapKey!51200 () (_ BitVec 32))

(declare-fun mapValue!51200 () ValueCell!15678)

(assert (=> mapNonEmpty!51200 (= (arr!40224 (_values!6729 thiss!1559)) (store mapRest!51200 mapKey!51200 mapValue!51200))))

(declare-fun b!1272930 () Bool)

(assert (=> b!1272930 (= e!726152 (and e!726156 mapRes!51200))))

(declare-fun condMapEmpty!51200 () Bool)

(declare-fun mapDefault!51200 () ValueCell!15678)

(assert (=> b!1272930 (= condMapEmpty!51200 (= (arr!40224 (_values!6729 thiss!1559)) ((as const (Array (_ BitVec 32) ValueCell!15678)) mapDefault!51200)))))

(assert (= (and start!107472 res!846606) b!1272925))

(assert (= (and b!1272925 res!846605) b!1272927))

(assert (= (and b!1272930 condMapEmpty!51200) mapIsEmpty!51200))

(assert (= (and b!1272930 (not condMapEmpty!51200)) mapNonEmpty!51200))

(get-info :version)

(assert (= (and mapNonEmpty!51200 ((_ is ValueCellFull!15678) mapValue!51200)) b!1272929))

(assert (= (and b!1272930 ((_ is ValueCellFull!15678) mapDefault!51200)) b!1272926))

(assert (= b!1272928 b!1272930))

(assert (= start!107472 b!1272928))

(declare-fun m!1170357 () Bool)

(assert (=> start!107472 m!1170357))

(declare-fun m!1170359 () Bool)

(assert (=> b!1272925 m!1170359))

(declare-fun m!1170361 () Bool)

(assert (=> b!1272928 m!1170361))

(declare-fun m!1170363 () Bool)

(assert (=> b!1272928 m!1170363))

(declare-fun m!1170365 () Bool)

(assert (=> mapNonEmpty!51200 m!1170365))

(check-sat tp_is_empty!33063 (not b_next!27693) (not mapNonEmpty!51200) (not start!107472) b_and!45749 (not b!1272928) (not b!1272925))
(check-sat b_and!45749 (not b_next!27693))
(get-model)

(declare-fun d!139927 () Bool)

(assert (=> d!139927 (= (validMask!0 (mask!34469 thiss!1559)) (and (or (= (mask!34469 thiss!1559) #b00000000000000000000000000000111) (= (mask!34469 thiss!1559) #b00000000000000000000000000001111) (= (mask!34469 thiss!1559) #b00000000000000000000000000011111) (= (mask!34469 thiss!1559) #b00000000000000000000000000111111) (= (mask!34469 thiss!1559) #b00000000000000000000000001111111) (= (mask!34469 thiss!1559) #b00000000000000000000000011111111) (= (mask!34469 thiss!1559) #b00000000000000000000000111111111) (= (mask!34469 thiss!1559) #b00000000000000000000001111111111) (= (mask!34469 thiss!1559) #b00000000000000000000011111111111) (= (mask!34469 thiss!1559) #b00000000000000000000111111111111) (= (mask!34469 thiss!1559) #b00000000000000000001111111111111) (= (mask!34469 thiss!1559) #b00000000000000000011111111111111) (= (mask!34469 thiss!1559) #b00000000000000000111111111111111) (= (mask!34469 thiss!1559) #b00000000000000001111111111111111) (= (mask!34469 thiss!1559) #b00000000000000011111111111111111) (= (mask!34469 thiss!1559) #b00000000000000111111111111111111) (= (mask!34469 thiss!1559) #b00000000000001111111111111111111) (= (mask!34469 thiss!1559) #b00000000000011111111111111111111) (= (mask!34469 thiss!1559) #b00000000000111111111111111111111) (= (mask!34469 thiss!1559) #b00000000001111111111111111111111) (= (mask!34469 thiss!1559) #b00000000011111111111111111111111) (= (mask!34469 thiss!1559) #b00000000111111111111111111111111) (= (mask!34469 thiss!1559) #b00000001111111111111111111111111) (= (mask!34469 thiss!1559) #b00000011111111111111111111111111) (= (mask!34469 thiss!1559) #b00000111111111111111111111111111) (= (mask!34469 thiss!1559) #b00001111111111111111111111111111) (= (mask!34469 thiss!1559) #b00011111111111111111111111111111) (= (mask!34469 thiss!1559) #b00111111111111111111111111111111)) (bvsle (mask!34469 thiss!1559) #b00111111111111111111111111111111)))))

(assert (=> b!1272925 d!139927))

(declare-fun d!139929 () Bool)

(declare-fun res!846619 () Bool)

(declare-fun e!726177 () Bool)

(assert (=> d!139929 (=> (not res!846619) (not e!726177))))

(declare-fun simpleValid!460 (LongMapFixedSize!6120) Bool)

(assert (=> d!139929 (= res!846619 (simpleValid!460 thiss!1559))))

(assert (=> d!139929 (= (valid!2296 thiss!1559) e!726177)))

(declare-fun b!1272955 () Bool)

(declare-fun res!846620 () Bool)

(assert (=> b!1272955 (=> (not res!846620) (not e!726177))))

(declare-fun arrayCountValidKeys!0 (array!83390 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1272955 (= res!846620 (= (arrayCountValidKeys!0 (_keys!12116 thiss!1559) #b00000000000000000000000000000000 (size!40765 (_keys!12116 thiss!1559))) (_size!3115 thiss!1559)))))

(declare-fun b!1272956 () Bool)

(declare-fun res!846621 () Bool)

(assert (=> b!1272956 (=> (not res!846621) (not e!726177))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83390 (_ BitVec 32)) Bool)

(assert (=> b!1272956 (= res!846621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12116 thiss!1559) (mask!34469 thiss!1559)))))

(declare-fun b!1272957 () Bool)

(declare-datatypes ((List!28563 0))(
  ( (Nil!28560) (Cons!28559 (h!29768 (_ BitVec 64)) (t!42096 List!28563)) )
))
(declare-fun arrayNoDuplicates!0 (array!83390 (_ BitVec 32) List!28563) Bool)

(assert (=> b!1272957 (= e!726177 (arrayNoDuplicates!0 (_keys!12116 thiss!1559) #b00000000000000000000000000000000 Nil!28560))))

(assert (= (and d!139929 res!846619) b!1272955))

(assert (= (and b!1272955 res!846620) b!1272956))

(assert (= (and b!1272956 res!846621) b!1272957))

(declare-fun m!1170377 () Bool)

(assert (=> d!139929 m!1170377))

(declare-fun m!1170379 () Bool)

(assert (=> b!1272955 m!1170379))

(declare-fun m!1170381 () Bool)

(assert (=> b!1272956 m!1170381))

(declare-fun m!1170383 () Bool)

(assert (=> b!1272957 m!1170383))

(assert (=> start!107472 d!139929))

(declare-fun d!139931 () Bool)

(assert (=> d!139931 (= (array_inv!30591 (_keys!12116 thiss!1559)) (bvsge (size!40765 (_keys!12116 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1272928 d!139931))

(declare-fun d!139933 () Bool)

(assert (=> d!139933 (= (array_inv!30592 (_values!6729 thiss!1559)) (bvsge (size!40764 (_values!6729 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1272928 d!139933))

(declare-fun mapIsEmpty!51206 () Bool)

(declare-fun mapRes!51206 () Bool)

(assert (=> mapIsEmpty!51206 mapRes!51206))

(declare-fun mapNonEmpty!51206 () Bool)

(declare-fun tp!97619 () Bool)

(declare-fun e!726182 () Bool)

(assert (=> mapNonEmpty!51206 (= mapRes!51206 (and tp!97619 e!726182))))

(declare-fun mapRest!51206 () (Array (_ BitVec 32) ValueCell!15678))

(declare-fun mapKey!51206 () (_ BitVec 32))

(declare-fun mapValue!51206 () ValueCell!15678)

(assert (=> mapNonEmpty!51206 (= mapRest!51200 (store mapRest!51206 mapKey!51206 mapValue!51206))))

(declare-fun b!1272965 () Bool)

(declare-fun e!726183 () Bool)

(assert (=> b!1272965 (= e!726183 tp_is_empty!33063)))

(declare-fun b!1272964 () Bool)

(assert (=> b!1272964 (= e!726182 tp_is_empty!33063)))

(declare-fun condMapEmpty!51206 () Bool)

(declare-fun mapDefault!51206 () ValueCell!15678)

(assert (=> mapNonEmpty!51200 (= condMapEmpty!51206 (= mapRest!51200 ((as const (Array (_ BitVec 32) ValueCell!15678)) mapDefault!51206)))))

(assert (=> mapNonEmpty!51200 (= tp!97610 (and e!726183 mapRes!51206))))

(assert (= (and mapNonEmpty!51200 condMapEmpty!51206) mapIsEmpty!51206))

(assert (= (and mapNonEmpty!51200 (not condMapEmpty!51206)) mapNonEmpty!51206))

(assert (= (and mapNonEmpty!51206 ((_ is ValueCellFull!15678) mapValue!51206)) b!1272964))

(assert (= (and mapNonEmpty!51200 ((_ is ValueCellFull!15678) mapDefault!51206)) b!1272965))

(declare-fun m!1170385 () Bool)

(assert (=> mapNonEmpty!51206 m!1170385))

(check-sat (not d!139929) tp_is_empty!33063 (not b!1272956) (not b!1272957) b_and!45749 (not b!1272955) (not b_next!27693) (not mapNonEmpty!51206))
(check-sat b_and!45749 (not b_next!27693))
(get-model)

(declare-fun d!139935 () Bool)

(declare-fun res!846630 () Bool)

(declare-fun e!726186 () Bool)

(assert (=> d!139935 (=> (not res!846630) (not e!726186))))

(assert (=> d!139935 (= res!846630 (validMask!0 (mask!34469 thiss!1559)))))

(assert (=> d!139935 (= (simpleValid!460 thiss!1559) e!726186)))

(declare-fun b!1272975 () Bool)

(declare-fun res!846633 () Bool)

(assert (=> b!1272975 (=> (not res!846633) (not e!726186))))

(declare-fun size!40768 (LongMapFixedSize!6120) (_ BitVec 32))

(assert (=> b!1272975 (= res!846633 (bvsge (size!40768 thiss!1559) (_size!3115 thiss!1559)))))

(declare-fun b!1272976 () Bool)

(declare-fun res!846632 () Bool)

(assert (=> b!1272976 (=> (not res!846632) (not e!726186))))

(assert (=> b!1272976 (= res!846632 (= (size!40768 thiss!1559) (bvadd (_size!3115 thiss!1559) (bvsdiv (bvadd (extraKeys!6385 thiss!1559) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1272974 () Bool)

(declare-fun res!846631 () Bool)

(assert (=> b!1272974 (=> (not res!846631) (not e!726186))))

(assert (=> b!1272974 (= res!846631 (and (= (size!40764 (_values!6729 thiss!1559)) (bvadd (mask!34469 thiss!1559) #b00000000000000000000000000000001)) (= (size!40765 (_keys!12116 thiss!1559)) (size!40764 (_values!6729 thiss!1559))) (bvsge (_size!3115 thiss!1559) #b00000000000000000000000000000000) (bvsle (_size!3115 thiss!1559) (bvadd (mask!34469 thiss!1559) #b00000000000000000000000000000001))))))

(declare-fun b!1272977 () Bool)

(assert (=> b!1272977 (= e!726186 (and (bvsge (extraKeys!6385 thiss!1559) #b00000000000000000000000000000000) (bvsle (extraKeys!6385 thiss!1559) #b00000000000000000000000000000011) (bvsge (_vacant!3115 thiss!1559) #b00000000000000000000000000000000)))))

(assert (= (and d!139935 res!846630) b!1272974))

(assert (= (and b!1272974 res!846631) b!1272975))

(assert (= (and b!1272975 res!846633) b!1272976))

(assert (= (and b!1272976 res!846632) b!1272977))

(assert (=> d!139935 m!1170359))

(declare-fun m!1170387 () Bool)

(assert (=> b!1272975 m!1170387))

(assert (=> b!1272976 m!1170387))

(assert (=> d!139929 d!139935))

(declare-fun b!1272986 () Bool)

(declare-fun e!726192 () (_ BitVec 32))

(declare-fun call!62576 () (_ BitVec 32))

(assert (=> b!1272986 (= e!726192 call!62576)))

(declare-fun b!1272987 () Bool)

(declare-fun e!726191 () (_ BitVec 32))

(assert (=> b!1272987 (= e!726191 e!726192)))

(declare-fun c!123737 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1272987 (= c!123737 (validKeyInArray!0 (select (arr!40225 (_keys!12116 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun d!139937 () Bool)

(declare-fun lt!575095 () (_ BitVec 32))

(assert (=> d!139937 (and (bvsge lt!575095 #b00000000000000000000000000000000) (bvsle lt!575095 (bvsub (size!40765 (_keys!12116 thiss!1559)) #b00000000000000000000000000000000)))))

(assert (=> d!139937 (= lt!575095 e!726191)))

(declare-fun c!123738 () Bool)

(assert (=> d!139937 (= c!123738 (bvsge #b00000000000000000000000000000000 (size!40765 (_keys!12116 thiss!1559))))))

(assert (=> d!139937 (and (bvsle #b00000000000000000000000000000000 (size!40765 (_keys!12116 thiss!1559))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!40765 (_keys!12116 thiss!1559)) (size!40765 (_keys!12116 thiss!1559))))))

(assert (=> d!139937 (= (arrayCountValidKeys!0 (_keys!12116 thiss!1559) #b00000000000000000000000000000000 (size!40765 (_keys!12116 thiss!1559))) lt!575095)))

(declare-fun bm!62573 () Bool)

(assert (=> bm!62573 (= call!62576 (arrayCountValidKeys!0 (_keys!12116 thiss!1559) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40765 (_keys!12116 thiss!1559))))))

(declare-fun b!1272988 () Bool)

(assert (=> b!1272988 (= e!726192 (bvadd #b00000000000000000000000000000001 call!62576))))

(declare-fun b!1272989 () Bool)

(assert (=> b!1272989 (= e!726191 #b00000000000000000000000000000000)))

(assert (= (and d!139937 c!123738) b!1272989))

(assert (= (and d!139937 (not c!123738)) b!1272987))

(assert (= (and b!1272987 c!123737) b!1272988))

(assert (= (and b!1272987 (not c!123737)) b!1272986))

(assert (= (or b!1272988 b!1272986) bm!62573))

(declare-fun m!1170389 () Bool)

(assert (=> b!1272987 m!1170389))

(assert (=> b!1272987 m!1170389))

(declare-fun m!1170391 () Bool)

(assert (=> b!1272987 m!1170391))

(declare-fun m!1170393 () Bool)

(assert (=> bm!62573 m!1170393))

(assert (=> b!1272955 d!139937))

(declare-fun b!1272998 () Bool)

(declare-fun e!726199 () Bool)

(declare-fun e!726200 () Bool)

(assert (=> b!1272998 (= e!726199 e!726200)))

(declare-fun lt!575104 () (_ BitVec 64))

(assert (=> b!1272998 (= lt!575104 (select (arr!40225 (_keys!12116 thiss!1559)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42326 0))(
  ( (Unit!42327) )
))
(declare-fun lt!575102 () Unit!42326)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83390 (_ BitVec 64) (_ BitVec 32)) Unit!42326)

(assert (=> b!1272998 (= lt!575102 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!12116 thiss!1559) lt!575104 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83390 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1272998 (arrayContainsKey!0 (_keys!12116 thiss!1559) lt!575104 #b00000000000000000000000000000000)))

(declare-fun lt!575103 () Unit!42326)

(assert (=> b!1272998 (= lt!575103 lt!575102)))

(declare-fun res!846639 () Bool)

(declare-datatypes ((SeekEntryResult!9993 0))(
  ( (MissingZero!9993 (index!42343 (_ BitVec 32))) (Found!9993 (index!42344 (_ BitVec 32))) (Intermediate!9993 (undefined!10805 Bool) (index!42345 (_ BitVec 32)) (x!112518 (_ BitVec 32))) (Undefined!9993) (MissingVacant!9993 (index!42346 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83390 (_ BitVec 32)) SeekEntryResult!9993)

(assert (=> b!1272998 (= res!846639 (= (seekEntryOrOpen!0 (select (arr!40225 (_keys!12116 thiss!1559)) #b00000000000000000000000000000000) (_keys!12116 thiss!1559) (mask!34469 thiss!1559)) (Found!9993 #b00000000000000000000000000000000)))))

(assert (=> b!1272998 (=> (not res!846639) (not e!726200))))

(declare-fun b!1272999 () Bool)

(declare-fun call!62579 () Bool)

(assert (=> b!1272999 (= e!726200 call!62579)))

(declare-fun b!1273000 () Bool)

(declare-fun e!726201 () Bool)

(assert (=> b!1273000 (= e!726201 e!726199)))

(declare-fun c!123741 () Bool)

(assert (=> b!1273000 (= c!123741 (validKeyInArray!0 (select (arr!40225 (_keys!12116 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1273001 () Bool)

(assert (=> b!1273001 (= e!726199 call!62579)))

(declare-fun bm!62576 () Bool)

(assert (=> bm!62576 (= call!62579 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!12116 thiss!1559) (mask!34469 thiss!1559)))))

(declare-fun d!139939 () Bool)

(declare-fun res!846638 () Bool)

(assert (=> d!139939 (=> res!846638 e!726201)))

(assert (=> d!139939 (= res!846638 (bvsge #b00000000000000000000000000000000 (size!40765 (_keys!12116 thiss!1559))))))

(assert (=> d!139939 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12116 thiss!1559) (mask!34469 thiss!1559)) e!726201)))

(assert (= (and d!139939 (not res!846638)) b!1273000))

(assert (= (and b!1273000 c!123741) b!1272998))

(assert (= (and b!1273000 (not c!123741)) b!1273001))

(assert (= (and b!1272998 res!846639) b!1272999))

(assert (= (or b!1272999 b!1273001) bm!62576))

(assert (=> b!1272998 m!1170389))

(declare-fun m!1170395 () Bool)

(assert (=> b!1272998 m!1170395))

(declare-fun m!1170397 () Bool)

(assert (=> b!1272998 m!1170397))

(assert (=> b!1272998 m!1170389))

(declare-fun m!1170399 () Bool)

(assert (=> b!1272998 m!1170399))

(assert (=> b!1273000 m!1170389))

(assert (=> b!1273000 m!1170389))

(assert (=> b!1273000 m!1170391))

(declare-fun m!1170401 () Bool)

(assert (=> bm!62576 m!1170401))

(assert (=> b!1272956 d!139939))

(declare-fun b!1273012 () Bool)

(declare-fun e!726212 () Bool)

(declare-fun e!726213 () Bool)

(assert (=> b!1273012 (= e!726212 e!726213)))

(declare-fun c!123744 () Bool)

(assert (=> b!1273012 (= c!123744 (validKeyInArray!0 (select (arr!40225 (_keys!12116 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1273013 () Bool)

(declare-fun call!62582 () Bool)

(assert (=> b!1273013 (= e!726213 call!62582)))

(declare-fun b!1273014 () Bool)

(declare-fun e!726211 () Bool)

(assert (=> b!1273014 (= e!726211 e!726212)))

(declare-fun res!846648 () Bool)

(assert (=> b!1273014 (=> (not res!846648) (not e!726212))))

(declare-fun e!726210 () Bool)

(assert (=> b!1273014 (= res!846648 (not e!726210))))

(declare-fun res!846647 () Bool)

(assert (=> b!1273014 (=> (not res!846647) (not e!726210))))

(assert (=> b!1273014 (= res!846647 (validKeyInArray!0 (select (arr!40225 (_keys!12116 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1273015 () Bool)

(declare-fun contains!7672 (List!28563 (_ BitVec 64)) Bool)

(assert (=> b!1273015 (= e!726210 (contains!7672 Nil!28560 (select (arr!40225 (_keys!12116 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1273016 () Bool)

(assert (=> b!1273016 (= e!726213 call!62582)))

(declare-fun bm!62579 () Bool)

(assert (=> bm!62579 (= call!62582 (arrayNoDuplicates!0 (_keys!12116 thiss!1559) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!123744 (Cons!28559 (select (arr!40225 (_keys!12116 thiss!1559)) #b00000000000000000000000000000000) Nil!28560) Nil!28560)))))

(declare-fun d!139941 () Bool)

(declare-fun res!846646 () Bool)

(assert (=> d!139941 (=> res!846646 e!726211)))

(assert (=> d!139941 (= res!846646 (bvsge #b00000000000000000000000000000000 (size!40765 (_keys!12116 thiss!1559))))))

(assert (=> d!139941 (= (arrayNoDuplicates!0 (_keys!12116 thiss!1559) #b00000000000000000000000000000000 Nil!28560) e!726211)))

(assert (= (and d!139941 (not res!846646)) b!1273014))

(assert (= (and b!1273014 res!846647) b!1273015))

(assert (= (and b!1273014 res!846648) b!1273012))

(assert (= (and b!1273012 c!123744) b!1273016))

(assert (= (and b!1273012 (not c!123744)) b!1273013))

(assert (= (or b!1273016 b!1273013) bm!62579))

(assert (=> b!1273012 m!1170389))

(assert (=> b!1273012 m!1170389))

(assert (=> b!1273012 m!1170391))

(assert (=> b!1273014 m!1170389))

(assert (=> b!1273014 m!1170389))

(assert (=> b!1273014 m!1170391))

(assert (=> b!1273015 m!1170389))

(assert (=> b!1273015 m!1170389))

(declare-fun m!1170403 () Bool)

(assert (=> b!1273015 m!1170403))

(assert (=> bm!62579 m!1170389))

(declare-fun m!1170405 () Bool)

(assert (=> bm!62579 m!1170405))

(assert (=> b!1272957 d!139941))

(declare-fun mapIsEmpty!51207 () Bool)

(declare-fun mapRes!51207 () Bool)

(assert (=> mapIsEmpty!51207 mapRes!51207))

(declare-fun mapNonEmpty!51207 () Bool)

(declare-fun tp!97620 () Bool)

(declare-fun e!726214 () Bool)

(assert (=> mapNonEmpty!51207 (= mapRes!51207 (and tp!97620 e!726214))))

(declare-fun mapRest!51207 () (Array (_ BitVec 32) ValueCell!15678))

(declare-fun mapKey!51207 () (_ BitVec 32))

(declare-fun mapValue!51207 () ValueCell!15678)

(assert (=> mapNonEmpty!51207 (= mapRest!51206 (store mapRest!51207 mapKey!51207 mapValue!51207))))

(declare-fun b!1273018 () Bool)

(declare-fun e!726215 () Bool)

(assert (=> b!1273018 (= e!726215 tp_is_empty!33063)))

(declare-fun b!1273017 () Bool)

(assert (=> b!1273017 (= e!726214 tp_is_empty!33063)))

(declare-fun condMapEmpty!51207 () Bool)

(declare-fun mapDefault!51207 () ValueCell!15678)

(assert (=> mapNonEmpty!51206 (= condMapEmpty!51207 (= mapRest!51206 ((as const (Array (_ BitVec 32) ValueCell!15678)) mapDefault!51207)))))

(assert (=> mapNonEmpty!51206 (= tp!97619 (and e!726215 mapRes!51207))))

(assert (= (and mapNonEmpty!51206 condMapEmpty!51207) mapIsEmpty!51207))

(assert (= (and mapNonEmpty!51206 (not condMapEmpty!51207)) mapNonEmpty!51207))

(assert (= (and mapNonEmpty!51207 ((_ is ValueCellFull!15678) mapValue!51207)) b!1273017))

(assert (= (and mapNonEmpty!51206 ((_ is ValueCellFull!15678) mapDefault!51207)) b!1273018))

(declare-fun m!1170407 () Bool)

(assert (=> mapNonEmpty!51207 m!1170407))

(check-sat (not b!1272976) tp_is_empty!33063 (not b_next!27693) (not d!139935) (not b!1273014) (not b!1273015) (not b!1272987) (not bm!62579) b_and!45749 (not bm!62573) (not mapNonEmpty!51207) (not b!1273000) (not b!1272975) (not b!1272998) (not b!1273012) (not bm!62576))
(check-sat b_and!45749 (not b_next!27693))

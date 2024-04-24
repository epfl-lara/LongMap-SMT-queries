; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107834 () Bool)

(assert start!107834)

(declare-fun b!1275029 () Bool)

(declare-fun b_free!27745 () Bool)

(declare-fun b_next!27745 () Bool)

(assert (=> b!1275029 (= b_free!27745 (not b_next!27745))))

(declare-fun tp!97791 () Bool)

(declare-fun b_and!45803 () Bool)

(assert (=> b!1275029 (= tp!97791 b_and!45803)))

(declare-fun e!727636 () Bool)

(declare-datatypes ((V!49347 0))(
  ( (V!49348 (val!16632 Int)) )
))
(declare-datatypes ((ValueCell!15704 0))(
  ( (ValueCellFull!15704 (v!19264 V!49347)) (EmptyCell!15704) )
))
(declare-datatypes ((array!83525 0))(
  ( (array!83526 (arr!40280 (Array (_ BitVec 32) ValueCell!15704)) (size!40826 (_ BitVec 32))) )
))
(declare-datatypes ((array!83527 0))(
  ( (array!83528 (arr!40281 (Array (_ BitVec 32) (_ BitVec 64))) (size!40827 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6172 0))(
  ( (LongMapFixedSize!6173 (defaultEntry!6732 Int) (mask!34584 (_ BitVec 32)) (extraKeys!6411 (_ BitVec 32)) (zeroValue!6517 V!49347) (minValue!6517 V!49347) (_size!3141 (_ BitVec 32)) (_keys!12184 array!83527) (_values!6755 array!83525) (_vacant!3141 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6172)

(declare-fun e!727638 () Bool)

(declare-fun tp_is_empty!33115 () Bool)

(declare-fun array_inv!30799 (array!83527) Bool)

(declare-fun array_inv!30800 (array!83525) Bool)

(assert (=> b!1275029 (= e!727638 (and tp!97791 tp_is_empty!33115 (array_inv!30799 (_keys!12184 thiss!1551)) (array_inv!30800 (_values!6755 thiss!1551)) e!727636))))

(declare-fun b!1275030 () Bool)

(declare-fun res!847468 () Bool)

(declare-fun e!727637 () Bool)

(assert (=> b!1275030 (=> (not res!847468) (not e!727637))))

(declare-fun arrayCountValidKeys!0 (array!83527 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1275030 (= res!847468 (= (arrayCountValidKeys!0 (_keys!12184 thiss!1551) #b00000000000000000000000000000000 (size!40827 (_keys!12184 thiss!1551))) (_size!3141 thiss!1551)))))

(declare-fun b!1275031 () Bool)

(declare-fun res!847466 () Bool)

(assert (=> b!1275031 (=> (not res!847466) (not e!727637))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1275031 (= res!847466 (validMask!0 (mask!34584 thiss!1551)))))

(declare-fun b!1275032 () Bool)

(declare-fun e!727635 () Bool)

(assert (=> b!1275032 (= e!727635 tp_is_empty!33115)))

(declare-fun mapNonEmpty!51304 () Bool)

(declare-fun mapRes!51304 () Bool)

(declare-fun tp!97792 () Bool)

(assert (=> mapNonEmpty!51304 (= mapRes!51304 (and tp!97792 e!727635))))

(declare-fun mapRest!51304 () (Array (_ BitVec 32) ValueCell!15704))

(declare-fun mapKey!51304 () (_ BitVec 32))

(declare-fun mapValue!51304 () ValueCell!15704)

(assert (=> mapNonEmpty!51304 (= (arr!40280 (_values!6755 thiss!1551)) (store mapRest!51304 mapKey!51304 mapValue!51304))))

(declare-fun mapIsEmpty!51304 () Bool)

(assert (=> mapIsEmpty!51304 mapRes!51304))

(declare-fun b!1275034 () Bool)

(declare-fun e!727640 () Bool)

(assert (=> b!1275034 (= e!727640 tp_is_empty!33115)))

(declare-fun b!1275035 () Bool)

(assert (=> b!1275035 (= e!727637 (and (= (size!40827 (_keys!12184 thiss!1551)) (bvadd #b00000000000000000000000000000001 (mask!34584 thiss!1551))) (bvsgt #b00000000000000000000000000000000 (size!40827 (_keys!12184 thiss!1551)))))))

(declare-fun b!1275033 () Bool)

(assert (=> b!1275033 (= e!727636 (and e!727640 mapRes!51304))))

(declare-fun condMapEmpty!51304 () Bool)

(declare-fun mapDefault!51304 () ValueCell!15704)

(assert (=> b!1275033 (= condMapEmpty!51304 (= (arr!40280 (_values!6755 thiss!1551)) ((as const (Array (_ BitVec 32) ValueCell!15704)) mapDefault!51304)))))

(declare-fun res!847467 () Bool)

(assert (=> start!107834 (=> (not res!847467) (not e!727637))))

(declare-fun simpleValid!474 (LongMapFixedSize!6172) Bool)

(assert (=> start!107834 (= res!847467 (simpleValid!474 thiss!1551))))

(assert (=> start!107834 e!727637))

(assert (=> start!107834 e!727638))

(assert (= (and start!107834 res!847467) b!1275030))

(assert (= (and b!1275030 res!847468) b!1275031))

(assert (= (and b!1275031 res!847466) b!1275035))

(assert (= (and b!1275033 condMapEmpty!51304) mapIsEmpty!51304))

(assert (= (and b!1275033 (not condMapEmpty!51304)) mapNonEmpty!51304))

(get-info :version)

(assert (= (and mapNonEmpty!51304 ((_ is ValueCellFull!15704) mapValue!51304)) b!1275032))

(assert (= (and b!1275033 ((_ is ValueCellFull!15704) mapDefault!51304)) b!1275034))

(assert (= b!1275029 b!1275033))

(assert (= start!107834 b!1275029))

(declare-fun m!1172389 () Bool)

(assert (=> start!107834 m!1172389))

(declare-fun m!1172391 () Bool)

(assert (=> b!1275029 m!1172391))

(declare-fun m!1172393 () Bool)

(assert (=> b!1275029 m!1172393))

(declare-fun m!1172395 () Bool)

(assert (=> b!1275030 m!1172395))

(declare-fun m!1172397 () Bool)

(assert (=> b!1275031 m!1172397))

(declare-fun m!1172399 () Bool)

(assert (=> mapNonEmpty!51304 m!1172399))

(check-sat (not b!1275031) (not b_next!27745) (not b!1275030) (not mapNonEmpty!51304) b_and!45803 tp_is_empty!33115 (not b!1275029) (not start!107834))
(check-sat b_and!45803 (not b_next!27745))
(get-model)

(declare-fun d!140479 () Bool)

(assert (=> d!140479 (= (validMask!0 (mask!34584 thiss!1551)) (and (or (= (mask!34584 thiss!1551) #b00000000000000000000000000000111) (= (mask!34584 thiss!1551) #b00000000000000000000000000001111) (= (mask!34584 thiss!1551) #b00000000000000000000000000011111) (= (mask!34584 thiss!1551) #b00000000000000000000000000111111) (= (mask!34584 thiss!1551) #b00000000000000000000000001111111) (= (mask!34584 thiss!1551) #b00000000000000000000000011111111) (= (mask!34584 thiss!1551) #b00000000000000000000000111111111) (= (mask!34584 thiss!1551) #b00000000000000000000001111111111) (= (mask!34584 thiss!1551) #b00000000000000000000011111111111) (= (mask!34584 thiss!1551) #b00000000000000000000111111111111) (= (mask!34584 thiss!1551) #b00000000000000000001111111111111) (= (mask!34584 thiss!1551) #b00000000000000000011111111111111) (= (mask!34584 thiss!1551) #b00000000000000000111111111111111) (= (mask!34584 thiss!1551) #b00000000000000001111111111111111) (= (mask!34584 thiss!1551) #b00000000000000011111111111111111) (= (mask!34584 thiss!1551) #b00000000000000111111111111111111) (= (mask!34584 thiss!1551) #b00000000000001111111111111111111) (= (mask!34584 thiss!1551) #b00000000000011111111111111111111) (= (mask!34584 thiss!1551) #b00000000000111111111111111111111) (= (mask!34584 thiss!1551) #b00000000001111111111111111111111) (= (mask!34584 thiss!1551) #b00000000011111111111111111111111) (= (mask!34584 thiss!1551) #b00000000111111111111111111111111) (= (mask!34584 thiss!1551) #b00000001111111111111111111111111) (= (mask!34584 thiss!1551) #b00000011111111111111111111111111) (= (mask!34584 thiss!1551) #b00000111111111111111111111111111) (= (mask!34584 thiss!1551) #b00001111111111111111111111111111) (= (mask!34584 thiss!1551) #b00011111111111111111111111111111) (= (mask!34584 thiss!1551) #b00111111111111111111111111111111)) (bvsle (mask!34584 thiss!1551) #b00111111111111111111111111111111)))))

(assert (=> b!1275031 d!140479))

(declare-fun b!1275086 () Bool)

(declare-fun res!847497 () Bool)

(declare-fun e!727679 () Bool)

(assert (=> b!1275086 (=> (not res!847497) (not e!727679))))

(assert (=> b!1275086 (= res!847497 (and (= (size!40826 (_values!6755 thiss!1551)) (bvadd (mask!34584 thiss!1551) #b00000000000000000000000000000001)) (= (size!40827 (_keys!12184 thiss!1551)) (size!40826 (_values!6755 thiss!1551))) (bvsge (_size!3141 thiss!1551) #b00000000000000000000000000000000) (bvsle (_size!3141 thiss!1551) (bvadd (mask!34584 thiss!1551) #b00000000000000000000000000000001))))))

(declare-fun d!140481 () Bool)

(declare-fun res!847495 () Bool)

(assert (=> d!140481 (=> (not res!847495) (not e!727679))))

(assert (=> d!140481 (= res!847495 (validMask!0 (mask!34584 thiss!1551)))))

(assert (=> d!140481 (= (simpleValid!474 thiss!1551) e!727679)))

(declare-fun b!1275088 () Bool)

(declare-fun res!847498 () Bool)

(assert (=> b!1275088 (=> (not res!847498) (not e!727679))))

(declare-fun size!40832 (LongMapFixedSize!6172) (_ BitVec 32))

(assert (=> b!1275088 (= res!847498 (= (size!40832 thiss!1551) (bvadd (_size!3141 thiss!1551) (bvsdiv (bvadd (extraKeys!6411 thiss!1551) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1275089 () Bool)

(assert (=> b!1275089 (= e!727679 (and (bvsge (extraKeys!6411 thiss!1551) #b00000000000000000000000000000000) (bvsle (extraKeys!6411 thiss!1551) #b00000000000000000000000000000011) (bvsge (_vacant!3141 thiss!1551) #b00000000000000000000000000000000)))))

(declare-fun b!1275087 () Bool)

(declare-fun res!847496 () Bool)

(assert (=> b!1275087 (=> (not res!847496) (not e!727679))))

(assert (=> b!1275087 (= res!847496 (bvsge (size!40832 thiss!1551) (_size!3141 thiss!1551)))))

(assert (= (and d!140481 res!847495) b!1275086))

(assert (= (and b!1275086 res!847497) b!1275087))

(assert (= (and b!1275087 res!847496) b!1275088))

(assert (= (and b!1275088 res!847498) b!1275089))

(assert (=> d!140481 m!1172397))

(declare-fun m!1172425 () Bool)

(assert (=> b!1275088 m!1172425))

(assert (=> b!1275087 m!1172425))

(assert (=> start!107834 d!140481))

(declare-fun b!1275099 () Bool)

(declare-fun e!727685 () (_ BitVec 32))

(declare-fun call!62671 () (_ BitVec 32))

(assert (=> b!1275099 (= e!727685 (bvadd #b00000000000000000000000000000001 call!62671))))

(declare-fun b!1275100 () Bool)

(declare-fun e!727684 () (_ BitVec 32))

(assert (=> b!1275100 (= e!727684 #b00000000000000000000000000000000)))

(declare-fun bm!62668 () Bool)

(assert (=> bm!62668 (= call!62671 (arrayCountValidKeys!0 (_keys!12184 thiss!1551) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40827 (_keys!12184 thiss!1551))))))

(declare-fun b!1275101 () Bool)

(assert (=> b!1275101 (= e!727684 e!727685)))

(declare-fun c!124176 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1275101 (= c!124176 (validKeyInArray!0 (select (arr!40281 (_keys!12184 thiss!1551)) #b00000000000000000000000000000000)))))

(declare-fun b!1275098 () Bool)

(assert (=> b!1275098 (= e!727685 call!62671)))

(declare-fun d!140483 () Bool)

(declare-fun lt!575633 () (_ BitVec 32))

(assert (=> d!140483 (and (bvsge lt!575633 #b00000000000000000000000000000000) (bvsle lt!575633 (bvsub (size!40827 (_keys!12184 thiss!1551)) #b00000000000000000000000000000000)))))

(assert (=> d!140483 (= lt!575633 e!727684)))

(declare-fun c!124177 () Bool)

(assert (=> d!140483 (= c!124177 (bvsge #b00000000000000000000000000000000 (size!40827 (_keys!12184 thiss!1551))))))

(assert (=> d!140483 (and (bvsle #b00000000000000000000000000000000 (size!40827 (_keys!12184 thiss!1551))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!40827 (_keys!12184 thiss!1551)) (size!40827 (_keys!12184 thiss!1551))))))

(assert (=> d!140483 (= (arrayCountValidKeys!0 (_keys!12184 thiss!1551) #b00000000000000000000000000000000 (size!40827 (_keys!12184 thiss!1551))) lt!575633)))

(assert (= (and d!140483 c!124177) b!1275100))

(assert (= (and d!140483 (not c!124177)) b!1275101))

(assert (= (and b!1275101 c!124176) b!1275099))

(assert (= (and b!1275101 (not c!124176)) b!1275098))

(assert (= (or b!1275099 b!1275098) bm!62668))

(declare-fun m!1172427 () Bool)

(assert (=> bm!62668 m!1172427))

(declare-fun m!1172429 () Bool)

(assert (=> b!1275101 m!1172429))

(assert (=> b!1275101 m!1172429))

(declare-fun m!1172431 () Bool)

(assert (=> b!1275101 m!1172431))

(assert (=> b!1275030 d!140483))

(declare-fun d!140485 () Bool)

(assert (=> d!140485 (= (array_inv!30799 (_keys!12184 thiss!1551)) (bvsge (size!40827 (_keys!12184 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1275029 d!140485))

(declare-fun d!140487 () Bool)

(assert (=> d!140487 (= (array_inv!30800 (_values!6755 thiss!1551)) (bvsge (size!40826 (_values!6755 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1275029 d!140487))

(declare-fun mapNonEmpty!51313 () Bool)

(declare-fun mapRes!51313 () Bool)

(declare-fun tp!97807 () Bool)

(declare-fun e!727690 () Bool)

(assert (=> mapNonEmpty!51313 (= mapRes!51313 (and tp!97807 e!727690))))

(declare-fun mapKey!51313 () (_ BitVec 32))

(declare-fun mapValue!51313 () ValueCell!15704)

(declare-fun mapRest!51313 () (Array (_ BitVec 32) ValueCell!15704))

(assert (=> mapNonEmpty!51313 (= mapRest!51304 (store mapRest!51313 mapKey!51313 mapValue!51313))))

(declare-fun b!1275109 () Bool)

(declare-fun e!727691 () Bool)

(assert (=> b!1275109 (= e!727691 tp_is_empty!33115)))

(declare-fun mapIsEmpty!51313 () Bool)

(assert (=> mapIsEmpty!51313 mapRes!51313))

(declare-fun b!1275108 () Bool)

(assert (=> b!1275108 (= e!727690 tp_is_empty!33115)))

(declare-fun condMapEmpty!51313 () Bool)

(declare-fun mapDefault!51313 () ValueCell!15704)

(assert (=> mapNonEmpty!51304 (= condMapEmpty!51313 (= mapRest!51304 ((as const (Array (_ BitVec 32) ValueCell!15704)) mapDefault!51313)))))

(assert (=> mapNonEmpty!51304 (= tp!97792 (and e!727691 mapRes!51313))))

(assert (= (and mapNonEmpty!51304 condMapEmpty!51313) mapIsEmpty!51313))

(assert (= (and mapNonEmpty!51304 (not condMapEmpty!51313)) mapNonEmpty!51313))

(assert (= (and mapNonEmpty!51313 ((_ is ValueCellFull!15704) mapValue!51313)) b!1275108))

(assert (= (and mapNonEmpty!51304 ((_ is ValueCellFull!15704) mapDefault!51313)) b!1275109))

(declare-fun m!1172433 () Bool)

(assert (=> mapNonEmpty!51313 m!1172433))

(check-sat (not b!1275088) (not b!1275087) (not d!140481) (not b_next!27745) (not bm!62668) (not b!1275101) (not mapNonEmpty!51313) b_and!45803 tp_is_empty!33115)
(check-sat b_and!45803 (not b_next!27745))

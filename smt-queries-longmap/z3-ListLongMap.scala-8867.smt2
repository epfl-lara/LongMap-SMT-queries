; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107610 () Bool)

(assert start!107610)

(declare-fun b!1273666 () Bool)

(declare-fun b_free!27745 () Bool)

(declare-fun b_next!27745 () Bool)

(assert (=> b!1273666 (= b_free!27745 (not b_next!27745))))

(declare-fun tp!97793 () Bool)

(declare-fun b_and!45783 () Bool)

(assert (=> b!1273666 (= tp!97793 b_and!45783)))

(declare-fun b!1273660 () Bool)

(declare-fun e!726762 () Bool)

(declare-fun tp_is_empty!33115 () Bool)

(assert (=> b!1273660 (= e!726762 tp_is_empty!33115)))

(declare-fun b!1273661 () Bool)

(declare-fun res!846919 () Bool)

(declare-fun e!726761 () Bool)

(assert (=> b!1273661 (=> (not res!846919) (not e!726761))))

(declare-datatypes ((V!49347 0))(
  ( (V!49348 (val!16632 Int)) )
))
(declare-datatypes ((ValueCell!15704 0))(
  ( (ValueCellFull!15704 (v!19268 V!49347)) (EmptyCell!15704) )
))
(declare-datatypes ((array!83407 0))(
  ( (array!83408 (arr!40226 (Array (_ BitVec 32) ValueCell!15704)) (size!40773 (_ BitVec 32))) )
))
(declare-datatypes ((array!83409 0))(
  ( (array!83410 (arr!40227 (Array (_ BitVec 32) (_ BitVec 64))) (size!40774 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6172 0))(
  ( (LongMapFixedSize!6173 (defaultEntry!6732 Int) (mask!34519 (_ BitVec 32)) (extraKeys!6411 (_ BitVec 32)) (zeroValue!6517 V!49347) (minValue!6517 V!49347) (_size!3141 (_ BitVec 32)) (_keys!12142 array!83409) (_values!6755 array!83407) (_vacant!3141 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6172)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1273661 (= res!846919 (validMask!0 (mask!34519 thiss!1551)))))

(declare-fun mapNonEmpty!51304 () Bool)

(declare-fun mapRes!51304 () Bool)

(declare-fun tp!97792 () Bool)

(assert (=> mapNonEmpty!51304 (= mapRes!51304 (and tp!97792 e!726762))))

(declare-fun mapValue!51304 () ValueCell!15704)

(declare-fun mapRest!51304 () (Array (_ BitVec 32) ValueCell!15704))

(declare-fun mapKey!51304 () (_ BitVec 32))

(assert (=> mapNonEmpty!51304 (= (arr!40226 (_values!6755 thiss!1551)) (store mapRest!51304 mapKey!51304 mapValue!51304))))

(declare-fun b!1273662 () Bool)

(declare-fun res!846920 () Bool)

(assert (=> b!1273662 (=> (not res!846920) (not e!726761))))

(declare-fun arrayCountValidKeys!0 (array!83409 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1273662 (= res!846920 (= (arrayCountValidKeys!0 (_keys!12142 thiss!1551) #b00000000000000000000000000000000 (size!40774 (_keys!12142 thiss!1551))) (_size!3141 thiss!1551)))))

(declare-fun res!846921 () Bool)

(assert (=> start!107610 (=> (not res!846921) (not e!726761))))

(declare-fun simpleValid!473 (LongMapFixedSize!6172) Bool)

(assert (=> start!107610 (= res!846921 (simpleValid!473 thiss!1551))))

(assert (=> start!107610 e!726761))

(declare-fun e!726760 () Bool)

(assert (=> start!107610 e!726760))

(declare-fun b!1273663 () Bool)

(declare-fun e!726759 () Bool)

(assert (=> b!1273663 (= e!726759 tp_is_empty!33115)))

(declare-fun b!1273664 () Bool)

(declare-fun e!726764 () Bool)

(assert (=> b!1273664 (= e!726764 (and e!726759 mapRes!51304))))

(declare-fun condMapEmpty!51304 () Bool)

(declare-fun mapDefault!51304 () ValueCell!15704)

(assert (=> b!1273664 (= condMapEmpty!51304 (= (arr!40226 (_values!6755 thiss!1551)) ((as const (Array (_ BitVec 32) ValueCell!15704)) mapDefault!51304)))))

(declare-fun mapIsEmpty!51304 () Bool)

(assert (=> mapIsEmpty!51304 mapRes!51304))

(declare-fun b!1273665 () Bool)

(assert (=> b!1273665 (= e!726761 (and (= (size!40774 (_keys!12142 thiss!1551)) (bvadd #b00000000000000000000000000000001 (mask!34519 thiss!1551))) (bvsgt #b00000000000000000000000000000000 (size!40774 (_keys!12142 thiss!1551)))))))

(declare-fun array_inv!30735 (array!83409) Bool)

(declare-fun array_inv!30736 (array!83407) Bool)

(assert (=> b!1273666 (= e!726760 (and tp!97793 tp_is_empty!33115 (array_inv!30735 (_keys!12142 thiss!1551)) (array_inv!30736 (_values!6755 thiss!1551)) e!726764))))

(assert (= (and start!107610 res!846921) b!1273662))

(assert (= (and b!1273662 res!846920) b!1273661))

(assert (= (and b!1273661 res!846919) b!1273665))

(assert (= (and b!1273664 condMapEmpty!51304) mapIsEmpty!51304))

(assert (= (and b!1273664 (not condMapEmpty!51304)) mapNonEmpty!51304))

(get-info :version)

(assert (= (and mapNonEmpty!51304 ((_ is ValueCellFull!15704) mapValue!51304)) b!1273660))

(assert (= (and b!1273664 ((_ is ValueCellFull!15704) mapDefault!51304)) b!1273663))

(assert (= b!1273666 b!1273664))

(assert (= start!107610 b!1273666))

(declare-fun m!1170277 () Bool)

(assert (=> b!1273662 m!1170277))

(declare-fun m!1170279 () Bool)

(assert (=> mapNonEmpty!51304 m!1170279))

(declare-fun m!1170281 () Bool)

(assert (=> b!1273661 m!1170281))

(declare-fun m!1170283 () Bool)

(assert (=> start!107610 m!1170283))

(declare-fun m!1170285 () Bool)

(assert (=> b!1273666 m!1170285))

(declare-fun m!1170287 () Bool)

(assert (=> b!1273666 m!1170287))

(check-sat (not mapNonEmpty!51304) tp_is_empty!33115 (not b_next!27745) (not b!1273661) (not b!1273666) b_and!45783 (not b!1273662) (not start!107610))
(check-sat b_and!45783 (not b_next!27745))
(get-model)

(declare-fun b!1273717 () Bool)

(declare-fun res!846948 () Bool)

(declare-fun e!726803 () Bool)

(assert (=> b!1273717 (=> (not res!846948) (not e!726803))))

(assert (=> b!1273717 (= res!846948 (and (= (size!40773 (_values!6755 thiss!1551)) (bvadd (mask!34519 thiss!1551) #b00000000000000000000000000000001)) (= (size!40774 (_keys!12142 thiss!1551)) (size!40773 (_values!6755 thiss!1551))) (bvsge (_size!3141 thiss!1551) #b00000000000000000000000000000000) (bvsle (_size!3141 thiss!1551) (bvadd (mask!34519 thiss!1551) #b00000000000000000000000000000001))))))

(declare-fun b!1273718 () Bool)

(declare-fun res!846949 () Bool)

(assert (=> b!1273718 (=> (not res!846949) (not e!726803))))

(declare-fun size!40779 (LongMapFixedSize!6172) (_ BitVec 32))

(assert (=> b!1273718 (= res!846949 (bvsge (size!40779 thiss!1551) (_size!3141 thiss!1551)))))

(declare-fun d!139919 () Bool)

(declare-fun res!846951 () Bool)

(assert (=> d!139919 (=> (not res!846951) (not e!726803))))

(assert (=> d!139919 (= res!846951 (validMask!0 (mask!34519 thiss!1551)))))

(assert (=> d!139919 (= (simpleValid!473 thiss!1551) e!726803)))

(declare-fun b!1273720 () Bool)

(assert (=> b!1273720 (= e!726803 (and (bvsge (extraKeys!6411 thiss!1551) #b00000000000000000000000000000000) (bvsle (extraKeys!6411 thiss!1551) #b00000000000000000000000000000011) (bvsge (_vacant!3141 thiss!1551) #b00000000000000000000000000000000)))))

(declare-fun b!1273719 () Bool)

(declare-fun res!846950 () Bool)

(assert (=> b!1273719 (=> (not res!846950) (not e!726803))))

(assert (=> b!1273719 (= res!846950 (= (size!40779 thiss!1551) (bvadd (_size!3141 thiss!1551) (bvsdiv (bvadd (extraKeys!6411 thiss!1551) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!139919 res!846951) b!1273717))

(assert (= (and b!1273717 res!846948) b!1273718))

(assert (= (and b!1273718 res!846949) b!1273719))

(assert (= (and b!1273719 res!846950) b!1273720))

(declare-fun m!1170313 () Bool)

(assert (=> b!1273718 m!1170313))

(assert (=> d!139919 m!1170281))

(assert (=> b!1273719 m!1170313))

(assert (=> start!107610 d!139919))

(declare-fun d!139921 () Bool)

(assert (=> d!139921 (= (array_inv!30735 (_keys!12142 thiss!1551)) (bvsge (size!40774 (_keys!12142 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1273666 d!139921))

(declare-fun d!139923 () Bool)

(assert (=> d!139923 (= (array_inv!30736 (_values!6755 thiss!1551)) (bvsge (size!40773 (_values!6755 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1273666 d!139923))

(declare-fun bm!62584 () Bool)

(declare-fun call!62587 () (_ BitVec 32))

(assert (=> bm!62584 (= call!62587 (arrayCountValidKeys!0 (_keys!12142 thiss!1551) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40774 (_keys!12142 thiss!1551))))))

(declare-fun b!1273729 () Bool)

(declare-fun e!726808 () (_ BitVec 32))

(declare-fun e!726809 () (_ BitVec 32))

(assert (=> b!1273729 (= e!726808 e!726809)))

(declare-fun c!123761 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1273729 (= c!123761 (validKeyInArray!0 (select (arr!40227 (_keys!12142 thiss!1551)) #b00000000000000000000000000000000)))))

(declare-fun b!1273730 () Bool)

(assert (=> b!1273730 (= e!726809 call!62587)))

(declare-fun d!139925 () Bool)

(declare-fun lt!574971 () (_ BitVec 32))

(assert (=> d!139925 (and (bvsge lt!574971 #b00000000000000000000000000000000) (bvsle lt!574971 (bvsub (size!40774 (_keys!12142 thiss!1551)) #b00000000000000000000000000000000)))))

(assert (=> d!139925 (= lt!574971 e!726808)))

(declare-fun c!123760 () Bool)

(assert (=> d!139925 (= c!123760 (bvsge #b00000000000000000000000000000000 (size!40774 (_keys!12142 thiss!1551))))))

(assert (=> d!139925 (and (bvsle #b00000000000000000000000000000000 (size!40774 (_keys!12142 thiss!1551))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!40774 (_keys!12142 thiss!1551)) (size!40774 (_keys!12142 thiss!1551))))))

(assert (=> d!139925 (= (arrayCountValidKeys!0 (_keys!12142 thiss!1551) #b00000000000000000000000000000000 (size!40774 (_keys!12142 thiss!1551))) lt!574971)))

(declare-fun b!1273731 () Bool)

(assert (=> b!1273731 (= e!726809 (bvadd #b00000000000000000000000000000001 call!62587))))

(declare-fun b!1273732 () Bool)

(assert (=> b!1273732 (= e!726808 #b00000000000000000000000000000000)))

(assert (= (and d!139925 c!123760) b!1273732))

(assert (= (and d!139925 (not c!123760)) b!1273729))

(assert (= (and b!1273729 c!123761) b!1273731))

(assert (= (and b!1273729 (not c!123761)) b!1273730))

(assert (= (or b!1273731 b!1273730) bm!62584))

(declare-fun m!1170315 () Bool)

(assert (=> bm!62584 m!1170315))

(declare-fun m!1170317 () Bool)

(assert (=> b!1273729 m!1170317))

(assert (=> b!1273729 m!1170317))

(declare-fun m!1170319 () Bool)

(assert (=> b!1273729 m!1170319))

(assert (=> b!1273662 d!139925))

(declare-fun d!139927 () Bool)

(assert (=> d!139927 (= (validMask!0 (mask!34519 thiss!1551)) (and (or (= (mask!34519 thiss!1551) #b00000000000000000000000000000111) (= (mask!34519 thiss!1551) #b00000000000000000000000000001111) (= (mask!34519 thiss!1551) #b00000000000000000000000000011111) (= (mask!34519 thiss!1551) #b00000000000000000000000000111111) (= (mask!34519 thiss!1551) #b00000000000000000000000001111111) (= (mask!34519 thiss!1551) #b00000000000000000000000011111111) (= (mask!34519 thiss!1551) #b00000000000000000000000111111111) (= (mask!34519 thiss!1551) #b00000000000000000000001111111111) (= (mask!34519 thiss!1551) #b00000000000000000000011111111111) (= (mask!34519 thiss!1551) #b00000000000000000000111111111111) (= (mask!34519 thiss!1551) #b00000000000000000001111111111111) (= (mask!34519 thiss!1551) #b00000000000000000011111111111111) (= (mask!34519 thiss!1551) #b00000000000000000111111111111111) (= (mask!34519 thiss!1551) #b00000000000000001111111111111111) (= (mask!34519 thiss!1551) #b00000000000000011111111111111111) (= (mask!34519 thiss!1551) #b00000000000000111111111111111111) (= (mask!34519 thiss!1551) #b00000000000001111111111111111111) (= (mask!34519 thiss!1551) #b00000000000011111111111111111111) (= (mask!34519 thiss!1551) #b00000000000111111111111111111111) (= (mask!34519 thiss!1551) #b00000000001111111111111111111111) (= (mask!34519 thiss!1551) #b00000000011111111111111111111111) (= (mask!34519 thiss!1551) #b00000000111111111111111111111111) (= (mask!34519 thiss!1551) #b00000001111111111111111111111111) (= (mask!34519 thiss!1551) #b00000011111111111111111111111111) (= (mask!34519 thiss!1551) #b00000111111111111111111111111111) (= (mask!34519 thiss!1551) #b00001111111111111111111111111111) (= (mask!34519 thiss!1551) #b00011111111111111111111111111111) (= (mask!34519 thiss!1551) #b00111111111111111111111111111111)) (bvsle (mask!34519 thiss!1551) #b00111111111111111111111111111111)))))

(assert (=> b!1273661 d!139927))

(declare-fun b!1273739 () Bool)

(declare-fun e!726815 () Bool)

(assert (=> b!1273739 (= e!726815 tp_is_empty!33115)))

(declare-fun condMapEmpty!51313 () Bool)

(declare-fun mapDefault!51313 () ValueCell!15704)

(assert (=> mapNonEmpty!51304 (= condMapEmpty!51313 (= mapRest!51304 ((as const (Array (_ BitVec 32) ValueCell!15704)) mapDefault!51313)))))

(declare-fun e!726814 () Bool)

(declare-fun mapRes!51313 () Bool)

(assert (=> mapNonEmpty!51304 (= tp!97792 (and e!726814 mapRes!51313))))

(declare-fun b!1273740 () Bool)

(assert (=> b!1273740 (= e!726814 tp_is_empty!33115)))

(declare-fun mapIsEmpty!51313 () Bool)

(assert (=> mapIsEmpty!51313 mapRes!51313))

(declare-fun mapNonEmpty!51313 () Bool)

(declare-fun tp!97808 () Bool)

(assert (=> mapNonEmpty!51313 (= mapRes!51313 (and tp!97808 e!726815))))

(declare-fun mapValue!51313 () ValueCell!15704)

(declare-fun mapKey!51313 () (_ BitVec 32))

(declare-fun mapRest!51313 () (Array (_ BitVec 32) ValueCell!15704))

(assert (=> mapNonEmpty!51313 (= mapRest!51304 (store mapRest!51313 mapKey!51313 mapValue!51313))))

(assert (= (and mapNonEmpty!51304 condMapEmpty!51313) mapIsEmpty!51313))

(assert (= (and mapNonEmpty!51304 (not condMapEmpty!51313)) mapNonEmpty!51313))

(assert (= (and mapNonEmpty!51313 ((_ is ValueCellFull!15704) mapValue!51313)) b!1273739))

(assert (= (and mapNonEmpty!51304 ((_ is ValueCellFull!15704) mapDefault!51313)) b!1273740))

(declare-fun m!1170321 () Bool)

(assert (=> mapNonEmpty!51313 m!1170321))

(check-sat (not b!1273718) (not mapNonEmpty!51313) (not bm!62584) tp_is_empty!33115 (not b!1273719) (not b_next!27745) (not d!139919) b_and!45783 (not b!1273729))
(check-sat b_and!45783 (not b_next!27745))

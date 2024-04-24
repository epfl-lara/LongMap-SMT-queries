; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90648 () Bool)

(assert start!90648)

(declare-fun b!1036104 () Bool)

(declare-fun b_free!20809 () Bool)

(declare-fun b_next!20809 () Bool)

(assert (=> b!1036104 (= b_free!20809 (not b_next!20809))))

(declare-fun tp!73535 () Bool)

(declare-fun b_and!33319 () Bool)

(assert (=> b!1036104 (= tp!73535 b_and!33319)))

(declare-fun b!1036103 () Bool)

(declare-fun res!691563 () Bool)

(declare-fun e!585844 () Bool)

(assert (=> b!1036103 (=> (not res!691563) (not e!585844))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1036103 (= res!691563 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!585841 () Bool)

(declare-fun e!585843 () Bool)

(declare-fun tp_is_empty!24529 () Bool)

(declare-datatypes ((V!37579 0))(
  ( (V!37580 (val!12315 Int)) )
))
(declare-datatypes ((ValueCell!11561 0))(
  ( (ValueCellFull!11561 (v!14891 V!37579)) (EmptyCell!11561) )
))
(declare-datatypes ((array!65191 0))(
  ( (array!65192 (arr!31381 (Array (_ BitVec 32) (_ BitVec 64))) (size!31906 (_ BitVec 32))) )
))
(declare-datatypes ((array!65193 0))(
  ( (array!65194 (arr!31382 (Array (_ BitVec 32) ValueCell!11561)) (size!31907 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5716 0))(
  ( (LongMapFixedSize!5717 (defaultEntry!6236 Int) (mask!30162 (_ BitVec 32)) (extraKeys!5966 (_ BitVec 32)) (zeroValue!6070 V!37579) (minValue!6072 V!37579) (_size!2913 (_ BitVec 32)) (_keys!11457 array!65191) (_values!6259 array!65193) (_vacant!2913 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5716)

(declare-fun array_inv!24289 (array!65191) Bool)

(declare-fun array_inv!24290 (array!65193) Bool)

(assert (=> b!1036104 (= e!585841 (and tp!73535 tp_is_empty!24529 (array_inv!24289 (_keys!11457 thiss!1427)) (array_inv!24290 (_values!6259 thiss!1427)) e!585843))))

(declare-fun b!1036105 () Bool)

(declare-fun e!585842 () Bool)

(assert (=> b!1036105 (= e!585842 tp_is_empty!24529)))

(declare-fun b!1036106 () Bool)

(declare-fun e!585845 () Bool)

(declare-fun mapRes!38285 () Bool)

(assert (=> b!1036106 (= e!585843 (and e!585845 mapRes!38285))))

(declare-fun condMapEmpty!38285 () Bool)

(declare-fun mapDefault!38285 () ValueCell!11561)

(assert (=> b!1036106 (= condMapEmpty!38285 (= (arr!31382 (_values!6259 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11561)) mapDefault!38285)))))

(declare-fun b!1036107 () Bool)

(assert (=> b!1036107 (= e!585844 (not (= (size!31907 (_values!6259 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30162 thiss!1427)))))))

(declare-fun mapIsEmpty!38285 () Bool)

(assert (=> mapIsEmpty!38285 mapRes!38285))

(declare-fun mapNonEmpty!38285 () Bool)

(declare-fun tp!73536 () Bool)

(assert (=> mapNonEmpty!38285 (= mapRes!38285 (and tp!73536 e!585842))))

(declare-fun mapKey!38285 () (_ BitVec 32))

(declare-fun mapValue!38285 () ValueCell!11561)

(declare-fun mapRest!38285 () (Array (_ BitVec 32) ValueCell!11561))

(assert (=> mapNonEmpty!38285 (= (arr!31382 (_values!6259 thiss!1427)) (store mapRest!38285 mapKey!38285 mapValue!38285))))

(declare-fun b!1036108 () Bool)

(assert (=> b!1036108 (= e!585845 tp_is_empty!24529)))

(declare-fun b!1036109 () Bool)

(declare-fun res!691565 () Bool)

(assert (=> b!1036109 (=> (not res!691565) (not e!585844))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1036109 (= res!691565 (validMask!0 (mask!30162 thiss!1427)))))

(declare-fun res!691564 () Bool)

(assert (=> start!90648 (=> (not res!691564) (not e!585844))))

(declare-fun valid!2166 (LongMapFixedSize!5716) Bool)

(assert (=> start!90648 (= res!691564 (valid!2166 thiss!1427))))

(assert (=> start!90648 e!585844))

(assert (=> start!90648 e!585841))

(assert (=> start!90648 true))

(assert (= (and start!90648 res!691564) b!1036103))

(assert (= (and b!1036103 res!691563) b!1036109))

(assert (= (and b!1036109 res!691565) b!1036107))

(assert (= (and b!1036106 condMapEmpty!38285) mapIsEmpty!38285))

(assert (= (and b!1036106 (not condMapEmpty!38285)) mapNonEmpty!38285))

(get-info :version)

(assert (= (and mapNonEmpty!38285 ((_ is ValueCellFull!11561) mapValue!38285)) b!1036105))

(assert (= (and b!1036106 ((_ is ValueCellFull!11561) mapDefault!38285)) b!1036108))

(assert (= b!1036104 b!1036106))

(assert (= start!90648 b!1036104))

(declare-fun m!956739 () Bool)

(assert (=> b!1036104 m!956739))

(declare-fun m!956741 () Bool)

(assert (=> b!1036104 m!956741))

(declare-fun m!956743 () Bool)

(assert (=> mapNonEmpty!38285 m!956743))

(declare-fun m!956745 () Bool)

(assert (=> b!1036109 m!956745))

(declare-fun m!956747 () Bool)

(assert (=> start!90648 m!956747))

(check-sat (not b_next!20809) (not b!1036104) b_and!33319 tp_is_empty!24529 (not start!90648) (not mapNonEmpty!38285) (not b!1036109))
(check-sat b_and!33319 (not b_next!20809))
(get-model)

(declare-fun d!124905 () Bool)

(assert (=> d!124905 (= (array_inv!24289 (_keys!11457 thiss!1427)) (bvsge (size!31906 (_keys!11457 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1036104 d!124905))

(declare-fun d!124907 () Bool)

(assert (=> d!124907 (= (array_inv!24290 (_values!6259 thiss!1427)) (bvsge (size!31907 (_values!6259 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1036104 d!124907))

(declare-fun d!124909 () Bool)

(assert (=> d!124909 (= (validMask!0 (mask!30162 thiss!1427)) (and (or (= (mask!30162 thiss!1427) #b00000000000000000000000000000111) (= (mask!30162 thiss!1427) #b00000000000000000000000000001111) (= (mask!30162 thiss!1427) #b00000000000000000000000000011111) (= (mask!30162 thiss!1427) #b00000000000000000000000000111111) (= (mask!30162 thiss!1427) #b00000000000000000000000001111111) (= (mask!30162 thiss!1427) #b00000000000000000000000011111111) (= (mask!30162 thiss!1427) #b00000000000000000000000111111111) (= (mask!30162 thiss!1427) #b00000000000000000000001111111111) (= (mask!30162 thiss!1427) #b00000000000000000000011111111111) (= (mask!30162 thiss!1427) #b00000000000000000000111111111111) (= (mask!30162 thiss!1427) #b00000000000000000001111111111111) (= (mask!30162 thiss!1427) #b00000000000000000011111111111111) (= (mask!30162 thiss!1427) #b00000000000000000111111111111111) (= (mask!30162 thiss!1427) #b00000000000000001111111111111111) (= (mask!30162 thiss!1427) #b00000000000000011111111111111111) (= (mask!30162 thiss!1427) #b00000000000000111111111111111111) (= (mask!30162 thiss!1427) #b00000000000001111111111111111111) (= (mask!30162 thiss!1427) #b00000000000011111111111111111111) (= (mask!30162 thiss!1427) #b00000000000111111111111111111111) (= (mask!30162 thiss!1427) #b00000000001111111111111111111111) (= (mask!30162 thiss!1427) #b00000000011111111111111111111111) (= (mask!30162 thiss!1427) #b00000000111111111111111111111111) (= (mask!30162 thiss!1427) #b00000001111111111111111111111111) (= (mask!30162 thiss!1427) #b00000011111111111111111111111111) (= (mask!30162 thiss!1427) #b00000111111111111111111111111111) (= (mask!30162 thiss!1427) #b00001111111111111111111111111111) (= (mask!30162 thiss!1427) #b00011111111111111111111111111111) (= (mask!30162 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30162 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1036109 d!124909))

(declare-fun d!124911 () Bool)

(declare-fun res!691590 () Bool)

(declare-fun e!585884 () Bool)

(assert (=> d!124911 (=> (not res!691590) (not e!585884))))

(declare-fun simpleValid!407 (LongMapFixedSize!5716) Bool)

(assert (=> d!124911 (= res!691590 (simpleValid!407 thiss!1427))))

(assert (=> d!124911 (= (valid!2166 thiss!1427) e!585884)))

(declare-fun b!1036158 () Bool)

(declare-fun res!691591 () Bool)

(assert (=> b!1036158 (=> (not res!691591) (not e!585884))))

(declare-fun arrayCountValidKeys!0 (array!65191 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1036158 (= res!691591 (= (arrayCountValidKeys!0 (_keys!11457 thiss!1427) #b00000000000000000000000000000000 (size!31906 (_keys!11457 thiss!1427))) (_size!2913 thiss!1427)))))

(declare-fun b!1036159 () Bool)

(declare-fun res!691592 () Bool)

(assert (=> b!1036159 (=> (not res!691592) (not e!585884))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65191 (_ BitVec 32)) Bool)

(assert (=> b!1036159 (= res!691592 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11457 thiss!1427) (mask!30162 thiss!1427)))))

(declare-fun b!1036160 () Bool)

(declare-datatypes ((List!21895 0))(
  ( (Nil!21892) (Cons!21891 (h!23102 (_ BitVec 64)) (t!31090 List!21895)) )
))
(declare-fun arrayNoDuplicates!0 (array!65191 (_ BitVec 32) List!21895) Bool)

(assert (=> b!1036160 (= e!585884 (arrayNoDuplicates!0 (_keys!11457 thiss!1427) #b00000000000000000000000000000000 Nil!21892))))

(assert (= (and d!124911 res!691590) b!1036158))

(assert (= (and b!1036158 res!691591) b!1036159))

(assert (= (and b!1036159 res!691592) b!1036160))

(declare-fun m!956769 () Bool)

(assert (=> d!124911 m!956769))

(declare-fun m!956771 () Bool)

(assert (=> b!1036158 m!956771))

(declare-fun m!956773 () Bool)

(assert (=> b!1036159 m!956773))

(declare-fun m!956775 () Bool)

(assert (=> b!1036160 m!956775))

(assert (=> start!90648 d!124911))

(declare-fun b!1036167 () Bool)

(declare-fun e!585890 () Bool)

(assert (=> b!1036167 (= e!585890 tp_is_empty!24529)))

(declare-fun condMapEmpty!38294 () Bool)

(declare-fun mapDefault!38294 () ValueCell!11561)

(assert (=> mapNonEmpty!38285 (= condMapEmpty!38294 (= mapRest!38285 ((as const (Array (_ BitVec 32) ValueCell!11561)) mapDefault!38294)))))

(declare-fun e!585889 () Bool)

(declare-fun mapRes!38294 () Bool)

(assert (=> mapNonEmpty!38285 (= tp!73536 (and e!585889 mapRes!38294))))

(declare-fun mapNonEmpty!38294 () Bool)

(declare-fun tp!73551 () Bool)

(assert (=> mapNonEmpty!38294 (= mapRes!38294 (and tp!73551 e!585890))))

(declare-fun mapKey!38294 () (_ BitVec 32))

(declare-fun mapRest!38294 () (Array (_ BitVec 32) ValueCell!11561))

(declare-fun mapValue!38294 () ValueCell!11561)

(assert (=> mapNonEmpty!38294 (= mapRest!38285 (store mapRest!38294 mapKey!38294 mapValue!38294))))

(declare-fun mapIsEmpty!38294 () Bool)

(assert (=> mapIsEmpty!38294 mapRes!38294))

(declare-fun b!1036168 () Bool)

(assert (=> b!1036168 (= e!585889 tp_is_empty!24529)))

(assert (= (and mapNonEmpty!38285 condMapEmpty!38294) mapIsEmpty!38294))

(assert (= (and mapNonEmpty!38285 (not condMapEmpty!38294)) mapNonEmpty!38294))

(assert (= (and mapNonEmpty!38294 ((_ is ValueCellFull!11561) mapValue!38294)) b!1036167))

(assert (= (and mapNonEmpty!38285 ((_ is ValueCellFull!11561) mapDefault!38294)) b!1036168))

(declare-fun m!956777 () Bool)

(assert (=> mapNonEmpty!38294 m!956777))

(check-sat (not b!1036160) (not b_next!20809) tp_is_empty!24529 (not b!1036158) b_and!33319 (not mapNonEmpty!38294) (not b!1036159) (not d!124911))
(check-sat b_and!33319 (not b_next!20809))
(get-model)

(declare-fun bm!43822 () Bool)

(declare-fun call!43825 () Bool)

(declare-fun c!105101 () Bool)

(assert (=> bm!43822 (= call!43825 (arrayNoDuplicates!0 (_keys!11457 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105101 (Cons!21891 (select (arr!31381 (_keys!11457 thiss!1427)) #b00000000000000000000000000000000) Nil!21892) Nil!21892)))))

(declare-fun b!1036179 () Bool)

(declare-fun e!585902 () Bool)

(declare-fun e!585900 () Bool)

(assert (=> b!1036179 (= e!585902 e!585900)))

(declare-fun res!691600 () Bool)

(assert (=> b!1036179 (=> (not res!691600) (not e!585900))))

(declare-fun e!585901 () Bool)

(assert (=> b!1036179 (= res!691600 (not e!585901))))

(declare-fun res!691601 () Bool)

(assert (=> b!1036179 (=> (not res!691601) (not e!585901))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1036179 (= res!691601 (validKeyInArray!0 (select (arr!31381 (_keys!11457 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!124913 () Bool)

(declare-fun res!691599 () Bool)

(assert (=> d!124913 (=> res!691599 e!585902)))

(assert (=> d!124913 (= res!691599 (bvsge #b00000000000000000000000000000000 (size!31906 (_keys!11457 thiss!1427))))))

(assert (=> d!124913 (= (arrayNoDuplicates!0 (_keys!11457 thiss!1427) #b00000000000000000000000000000000 Nil!21892) e!585902)))

(declare-fun b!1036180 () Bool)

(declare-fun contains!6041 (List!21895 (_ BitVec 64)) Bool)

(assert (=> b!1036180 (= e!585901 (contains!6041 Nil!21892 (select (arr!31381 (_keys!11457 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1036181 () Bool)

(declare-fun e!585899 () Bool)

(assert (=> b!1036181 (= e!585899 call!43825)))

(declare-fun b!1036182 () Bool)

(assert (=> b!1036182 (= e!585900 e!585899)))

(assert (=> b!1036182 (= c!105101 (validKeyInArray!0 (select (arr!31381 (_keys!11457 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1036183 () Bool)

(assert (=> b!1036183 (= e!585899 call!43825)))

(assert (= (and d!124913 (not res!691599)) b!1036179))

(assert (= (and b!1036179 res!691601) b!1036180))

(assert (= (and b!1036179 res!691600) b!1036182))

(assert (= (and b!1036182 c!105101) b!1036183))

(assert (= (and b!1036182 (not c!105101)) b!1036181))

(assert (= (or b!1036183 b!1036181) bm!43822))

(declare-fun m!956779 () Bool)

(assert (=> bm!43822 m!956779))

(declare-fun m!956781 () Bool)

(assert (=> bm!43822 m!956781))

(assert (=> b!1036179 m!956779))

(assert (=> b!1036179 m!956779))

(declare-fun m!956783 () Bool)

(assert (=> b!1036179 m!956783))

(assert (=> b!1036180 m!956779))

(assert (=> b!1036180 m!956779))

(declare-fun m!956785 () Bool)

(assert (=> b!1036180 m!956785))

(assert (=> b!1036182 m!956779))

(assert (=> b!1036182 m!956779))

(assert (=> b!1036182 m!956783))

(assert (=> b!1036160 d!124913))

(declare-fun d!124915 () Bool)

(declare-fun res!691611 () Bool)

(declare-fun e!585905 () Bool)

(assert (=> d!124915 (=> (not res!691611) (not e!585905))))

(assert (=> d!124915 (= res!691611 (validMask!0 (mask!30162 thiss!1427)))))

(assert (=> d!124915 (= (simpleValid!407 thiss!1427) e!585905)))

(declare-fun b!1036194 () Bool)

(declare-fun res!691613 () Bool)

(assert (=> b!1036194 (=> (not res!691613) (not e!585905))))

(declare-fun size!31912 (LongMapFixedSize!5716) (_ BitVec 32))

(assert (=> b!1036194 (= res!691613 (= (size!31912 thiss!1427) (bvadd (_size!2913 thiss!1427) (bvsdiv (bvadd (extraKeys!5966 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1036193 () Bool)

(declare-fun res!691612 () Bool)

(assert (=> b!1036193 (=> (not res!691612) (not e!585905))))

(assert (=> b!1036193 (= res!691612 (bvsge (size!31912 thiss!1427) (_size!2913 thiss!1427)))))

(declare-fun b!1036195 () Bool)

(assert (=> b!1036195 (= e!585905 (and (bvsge (extraKeys!5966 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5966 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2913 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1036192 () Bool)

(declare-fun res!691610 () Bool)

(assert (=> b!1036192 (=> (not res!691610) (not e!585905))))

(assert (=> b!1036192 (= res!691610 (and (= (size!31907 (_values!6259 thiss!1427)) (bvadd (mask!30162 thiss!1427) #b00000000000000000000000000000001)) (= (size!31906 (_keys!11457 thiss!1427)) (size!31907 (_values!6259 thiss!1427))) (bvsge (_size!2913 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2913 thiss!1427) (bvadd (mask!30162 thiss!1427) #b00000000000000000000000000000001))))))

(assert (= (and d!124915 res!691611) b!1036192))

(assert (= (and b!1036192 res!691610) b!1036193))

(assert (= (and b!1036193 res!691612) b!1036194))

(assert (= (and b!1036194 res!691613) b!1036195))

(assert (=> d!124915 m!956745))

(declare-fun m!956787 () Bool)

(assert (=> b!1036194 m!956787))

(assert (=> b!1036193 m!956787))

(assert (=> d!124911 d!124915))

(declare-fun b!1036204 () Bool)

(declare-fun e!585910 () (_ BitVec 32))

(declare-fun e!585911 () (_ BitVec 32))

(assert (=> b!1036204 (= e!585910 e!585911)))

(declare-fun c!105106 () Bool)

(assert (=> b!1036204 (= c!105106 (validKeyInArray!0 (select (arr!31381 (_keys!11457 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43825 () Bool)

(declare-fun call!43828 () (_ BitVec 32))

(assert (=> bm!43825 (= call!43828 (arrayCountValidKeys!0 (_keys!11457 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31906 (_keys!11457 thiss!1427))))))

(declare-fun b!1036205 () Bool)

(assert (=> b!1036205 (= e!585911 (bvadd #b00000000000000000000000000000001 call!43828))))

(declare-fun b!1036206 () Bool)

(assert (=> b!1036206 (= e!585910 #b00000000000000000000000000000000)))

(declare-fun b!1036207 () Bool)

(assert (=> b!1036207 (= e!585911 call!43828)))

(declare-fun d!124917 () Bool)

(declare-fun lt!457226 () (_ BitVec 32))

(assert (=> d!124917 (and (bvsge lt!457226 #b00000000000000000000000000000000) (bvsle lt!457226 (bvsub (size!31906 (_keys!11457 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!124917 (= lt!457226 e!585910)))

(declare-fun c!105107 () Bool)

(assert (=> d!124917 (= c!105107 (bvsge #b00000000000000000000000000000000 (size!31906 (_keys!11457 thiss!1427))))))

(assert (=> d!124917 (and (bvsle #b00000000000000000000000000000000 (size!31906 (_keys!11457 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31906 (_keys!11457 thiss!1427)) (size!31906 (_keys!11457 thiss!1427))))))

(assert (=> d!124917 (= (arrayCountValidKeys!0 (_keys!11457 thiss!1427) #b00000000000000000000000000000000 (size!31906 (_keys!11457 thiss!1427))) lt!457226)))

(assert (= (and d!124917 c!105107) b!1036206))

(assert (= (and d!124917 (not c!105107)) b!1036204))

(assert (= (and b!1036204 c!105106) b!1036205))

(assert (= (and b!1036204 (not c!105106)) b!1036207))

(assert (= (or b!1036205 b!1036207) bm!43825))

(assert (=> b!1036204 m!956779))

(assert (=> b!1036204 m!956779))

(assert (=> b!1036204 m!956783))

(declare-fun m!956789 () Bool)

(assert (=> bm!43825 m!956789))

(assert (=> b!1036158 d!124917))

(declare-fun b!1036216 () Bool)

(declare-fun e!585918 () Bool)

(declare-fun call!43831 () Bool)

(assert (=> b!1036216 (= e!585918 call!43831)))

(declare-fun b!1036217 () Bool)

(declare-fun e!585920 () Bool)

(assert (=> b!1036217 (= e!585920 e!585918)))

(declare-fun lt!457233 () (_ BitVec 64))

(assert (=> b!1036217 (= lt!457233 (select (arr!31381 (_keys!11457 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33886 0))(
  ( (Unit!33887) )
))
(declare-fun lt!457234 () Unit!33886)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65191 (_ BitVec 64) (_ BitVec 32)) Unit!33886)

(assert (=> b!1036217 (= lt!457234 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11457 thiss!1427) lt!457233 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65191 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1036217 (arrayContainsKey!0 (_keys!11457 thiss!1427) lt!457233 #b00000000000000000000000000000000)))

(declare-fun lt!457235 () Unit!33886)

(assert (=> b!1036217 (= lt!457235 lt!457234)))

(declare-fun res!691618 () Bool)

(declare-datatypes ((SeekEntryResult!9697 0))(
  ( (MissingZero!9697 (index!41159 (_ BitVec 32))) (Found!9697 (index!41160 (_ BitVec 32))) (Intermediate!9697 (undefined!10509 Bool) (index!41161 (_ BitVec 32)) (x!92258 (_ BitVec 32))) (Undefined!9697) (MissingVacant!9697 (index!41162 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65191 (_ BitVec 32)) SeekEntryResult!9697)

(assert (=> b!1036217 (= res!691618 (= (seekEntryOrOpen!0 (select (arr!31381 (_keys!11457 thiss!1427)) #b00000000000000000000000000000000) (_keys!11457 thiss!1427) (mask!30162 thiss!1427)) (Found!9697 #b00000000000000000000000000000000)))))

(assert (=> b!1036217 (=> (not res!691618) (not e!585918))))

(declare-fun b!1036218 () Bool)

(declare-fun e!585919 () Bool)

(assert (=> b!1036218 (= e!585919 e!585920)))

(declare-fun c!105110 () Bool)

(assert (=> b!1036218 (= c!105110 (validKeyInArray!0 (select (arr!31381 (_keys!11457 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43828 () Bool)

(assert (=> bm!43828 (= call!43831 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11457 thiss!1427) (mask!30162 thiss!1427)))))

(declare-fun d!124919 () Bool)

(declare-fun res!691619 () Bool)

(assert (=> d!124919 (=> res!691619 e!585919)))

(assert (=> d!124919 (= res!691619 (bvsge #b00000000000000000000000000000000 (size!31906 (_keys!11457 thiss!1427))))))

(assert (=> d!124919 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11457 thiss!1427) (mask!30162 thiss!1427)) e!585919)))

(declare-fun b!1036219 () Bool)

(assert (=> b!1036219 (= e!585920 call!43831)))

(assert (= (and d!124919 (not res!691619)) b!1036218))

(assert (= (and b!1036218 c!105110) b!1036217))

(assert (= (and b!1036218 (not c!105110)) b!1036219))

(assert (= (and b!1036217 res!691618) b!1036216))

(assert (= (or b!1036216 b!1036219) bm!43828))

(assert (=> b!1036217 m!956779))

(declare-fun m!956791 () Bool)

(assert (=> b!1036217 m!956791))

(declare-fun m!956793 () Bool)

(assert (=> b!1036217 m!956793))

(assert (=> b!1036217 m!956779))

(declare-fun m!956795 () Bool)

(assert (=> b!1036217 m!956795))

(assert (=> b!1036218 m!956779))

(assert (=> b!1036218 m!956779))

(assert (=> b!1036218 m!956783))

(declare-fun m!956797 () Bool)

(assert (=> bm!43828 m!956797))

(assert (=> b!1036159 d!124919))

(declare-fun b!1036220 () Bool)

(declare-fun e!585922 () Bool)

(assert (=> b!1036220 (= e!585922 tp_is_empty!24529)))

(declare-fun condMapEmpty!38295 () Bool)

(declare-fun mapDefault!38295 () ValueCell!11561)

(assert (=> mapNonEmpty!38294 (= condMapEmpty!38295 (= mapRest!38294 ((as const (Array (_ BitVec 32) ValueCell!11561)) mapDefault!38295)))))

(declare-fun e!585921 () Bool)

(declare-fun mapRes!38295 () Bool)

(assert (=> mapNonEmpty!38294 (= tp!73551 (and e!585921 mapRes!38295))))

(declare-fun mapNonEmpty!38295 () Bool)

(declare-fun tp!73552 () Bool)

(assert (=> mapNonEmpty!38295 (= mapRes!38295 (and tp!73552 e!585922))))

(declare-fun mapRest!38295 () (Array (_ BitVec 32) ValueCell!11561))

(declare-fun mapKey!38295 () (_ BitVec 32))

(declare-fun mapValue!38295 () ValueCell!11561)

(assert (=> mapNonEmpty!38295 (= mapRest!38294 (store mapRest!38295 mapKey!38295 mapValue!38295))))

(declare-fun mapIsEmpty!38295 () Bool)

(assert (=> mapIsEmpty!38295 mapRes!38295))

(declare-fun b!1036221 () Bool)

(assert (=> b!1036221 (= e!585921 tp_is_empty!24529)))

(assert (= (and mapNonEmpty!38294 condMapEmpty!38295) mapIsEmpty!38295))

(assert (= (and mapNonEmpty!38294 (not condMapEmpty!38295)) mapNonEmpty!38295))

(assert (= (and mapNonEmpty!38295 ((_ is ValueCellFull!11561) mapValue!38295)) b!1036220))

(assert (= (and mapNonEmpty!38294 ((_ is ValueCellFull!11561) mapDefault!38295)) b!1036221))

(declare-fun m!956799 () Bool)

(assert (=> mapNonEmpty!38295 m!956799))

(check-sat (not d!124915) (not b!1036193) (not bm!43822) (not b!1036217) (not b!1036179) (not b!1036204) (not b!1036194) b_and!33319 (not b!1036180) (not b!1036182) (not mapNonEmpty!38295) (not b!1036218) (not bm!43828) (not b_next!20809) tp_is_empty!24529 (not bm!43825))
(check-sat b_and!33319 (not b_next!20809))

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90706 () Bool)

(assert start!90706)

(declare-fun b!1036450 () Bool)

(declare-fun b_free!20827 () Bool)

(declare-fun b_next!20827 () Bool)

(assert (=> b!1036450 (= b_free!20827 (not b_next!20827))))

(declare-fun tp!73600 () Bool)

(declare-fun b_and!33337 () Bool)

(assert (=> b!1036450 (= tp!73600 b_and!33337)))

(declare-fun b!1036449 () Bool)

(declare-fun res!691726 () Bool)

(declare-fun e!586097 () Bool)

(assert (=> b!1036449 (=> (not res!691726) (not e!586097))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1036449 (= res!691726 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!586095 () Bool)

(declare-fun tp_is_empty!24547 () Bool)

(declare-fun e!586096 () Bool)

(declare-datatypes ((V!37603 0))(
  ( (V!37604 (val!12324 Int)) )
))
(declare-datatypes ((ValueCell!11570 0))(
  ( (ValueCellFull!11570 (v!14900 V!37603)) (EmptyCell!11570) )
))
(declare-datatypes ((array!65233 0))(
  ( (array!65234 (arr!31399 (Array (_ BitVec 32) (_ BitVec 64))) (size!31926 (_ BitVec 32))) )
))
(declare-datatypes ((array!65235 0))(
  ( (array!65236 (arr!31400 (Array (_ BitVec 32) ValueCell!11570)) (size!31927 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5734 0))(
  ( (LongMapFixedSize!5735 (defaultEntry!6245 Int) (mask!30182 (_ BitVec 32)) (extraKeys!5975 (_ BitVec 32)) (zeroValue!6079 V!37603) (minValue!6081 V!37603) (_size!2922 (_ BitVec 32)) (_keys!11468 array!65233) (_values!6268 array!65235) (_vacant!2922 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5734)

(declare-fun array_inv!24301 (array!65233) Bool)

(declare-fun array_inv!24302 (array!65235) Bool)

(assert (=> b!1036450 (= e!586095 (and tp!73600 tp_is_empty!24547 (array_inv!24301 (_keys!11468 thiss!1427)) (array_inv!24302 (_values!6268 thiss!1427)) e!586096))))

(declare-fun b!1036452 () Bool)

(assert (=> b!1036452 (= e!586097 (and (= (size!31927 (_values!6268 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30182 thiss!1427))) (= (size!31926 (_keys!11468 thiss!1427)) (size!31927 (_values!6268 thiss!1427))) (bvsge (mask!30182 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5975 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1036453 () Bool)

(declare-fun e!586094 () Bool)

(assert (=> b!1036453 (= e!586094 tp_is_empty!24547)))

(declare-fun b!1036454 () Bool)

(declare-fun mapRes!38323 () Bool)

(assert (=> b!1036454 (= e!586096 (and e!586094 mapRes!38323))))

(declare-fun condMapEmpty!38323 () Bool)

(declare-fun mapDefault!38323 () ValueCell!11570)

(assert (=> b!1036454 (= condMapEmpty!38323 (= (arr!31400 (_values!6268 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11570)) mapDefault!38323)))))

(declare-fun mapIsEmpty!38323 () Bool)

(assert (=> mapIsEmpty!38323 mapRes!38323))

(declare-fun b!1036455 () Bool)

(declare-fun res!691727 () Bool)

(assert (=> b!1036455 (=> (not res!691727) (not e!586097))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1036455 (= res!691727 (validMask!0 (mask!30182 thiss!1427)))))

(declare-fun mapNonEmpty!38323 () Bool)

(declare-fun tp!73601 () Bool)

(declare-fun e!586098 () Bool)

(assert (=> mapNonEmpty!38323 (= mapRes!38323 (and tp!73601 e!586098))))

(declare-fun mapValue!38323 () ValueCell!11570)

(declare-fun mapRest!38323 () (Array (_ BitVec 32) ValueCell!11570))

(declare-fun mapKey!38323 () (_ BitVec 32))

(assert (=> mapNonEmpty!38323 (= (arr!31400 (_values!6268 thiss!1427)) (store mapRest!38323 mapKey!38323 mapValue!38323))))

(declare-fun res!691725 () Bool)

(assert (=> start!90706 (=> (not res!691725) (not e!586097))))

(declare-fun valid!2173 (LongMapFixedSize!5734) Bool)

(assert (=> start!90706 (= res!691725 (valid!2173 thiss!1427))))

(assert (=> start!90706 e!586097))

(assert (=> start!90706 e!586095))

(assert (=> start!90706 true))

(declare-fun b!1036451 () Bool)

(assert (=> b!1036451 (= e!586098 tp_is_empty!24547)))

(assert (= (and start!90706 res!691725) b!1036449))

(assert (= (and b!1036449 res!691726) b!1036455))

(assert (= (and b!1036455 res!691727) b!1036452))

(assert (= (and b!1036454 condMapEmpty!38323) mapIsEmpty!38323))

(assert (= (and b!1036454 (not condMapEmpty!38323)) mapNonEmpty!38323))

(get-info :version)

(assert (= (and mapNonEmpty!38323 ((_ is ValueCellFull!11570) mapValue!38323)) b!1036451))

(assert (= (and b!1036454 ((_ is ValueCellFull!11570) mapDefault!38323)) b!1036453))

(assert (= b!1036450 b!1036454))

(assert (= start!90706 b!1036450))

(declare-fun m!956903 () Bool)

(assert (=> b!1036450 m!956903))

(declare-fun m!956905 () Bool)

(assert (=> b!1036450 m!956905))

(declare-fun m!956907 () Bool)

(assert (=> b!1036455 m!956907))

(declare-fun m!956909 () Bool)

(assert (=> mapNonEmpty!38323 m!956909))

(declare-fun m!956911 () Bool)

(assert (=> start!90706 m!956911))

(check-sat (not start!90706) (not b!1036455) tp_is_empty!24547 (not b_next!20827) (not mapNonEmpty!38323) b_and!33337 (not b!1036450))
(check-sat b_and!33337 (not b_next!20827))
(get-model)

(declare-fun d!124951 () Bool)

(declare-fun res!691752 () Bool)

(declare-fun e!586137 () Bool)

(assert (=> d!124951 (=> (not res!691752) (not e!586137))))

(declare-fun simpleValid!410 (LongMapFixedSize!5734) Bool)

(assert (=> d!124951 (= res!691752 (simpleValid!410 thiss!1427))))

(assert (=> d!124951 (= (valid!2173 thiss!1427) e!586137)))

(declare-fun b!1036504 () Bool)

(declare-fun res!691753 () Bool)

(assert (=> b!1036504 (=> (not res!691753) (not e!586137))))

(declare-fun arrayCountValidKeys!0 (array!65233 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1036504 (= res!691753 (= (arrayCountValidKeys!0 (_keys!11468 thiss!1427) #b00000000000000000000000000000000 (size!31926 (_keys!11468 thiss!1427))) (_size!2922 thiss!1427)))))

(declare-fun b!1036505 () Bool)

(declare-fun res!691754 () Bool)

(assert (=> b!1036505 (=> (not res!691754) (not e!586137))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65233 (_ BitVec 32)) Bool)

(assert (=> b!1036505 (= res!691754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11468 thiss!1427) (mask!30182 thiss!1427)))))

(declare-fun b!1036506 () Bool)

(declare-datatypes ((List!21898 0))(
  ( (Nil!21895) (Cons!21894 (h!23105 (_ BitVec 64)) (t!31093 List!21898)) )
))
(declare-fun arrayNoDuplicates!0 (array!65233 (_ BitVec 32) List!21898) Bool)

(assert (=> b!1036506 (= e!586137 (arrayNoDuplicates!0 (_keys!11468 thiss!1427) #b00000000000000000000000000000000 Nil!21895))))

(assert (= (and d!124951 res!691752) b!1036504))

(assert (= (and b!1036504 res!691753) b!1036505))

(assert (= (and b!1036505 res!691754) b!1036506))

(declare-fun m!956933 () Bool)

(assert (=> d!124951 m!956933))

(declare-fun m!956935 () Bool)

(assert (=> b!1036504 m!956935))

(declare-fun m!956937 () Bool)

(assert (=> b!1036505 m!956937))

(declare-fun m!956939 () Bool)

(assert (=> b!1036506 m!956939))

(assert (=> start!90706 d!124951))

(declare-fun d!124953 () Bool)

(assert (=> d!124953 (= (validMask!0 (mask!30182 thiss!1427)) (and (or (= (mask!30182 thiss!1427) #b00000000000000000000000000000111) (= (mask!30182 thiss!1427) #b00000000000000000000000000001111) (= (mask!30182 thiss!1427) #b00000000000000000000000000011111) (= (mask!30182 thiss!1427) #b00000000000000000000000000111111) (= (mask!30182 thiss!1427) #b00000000000000000000000001111111) (= (mask!30182 thiss!1427) #b00000000000000000000000011111111) (= (mask!30182 thiss!1427) #b00000000000000000000000111111111) (= (mask!30182 thiss!1427) #b00000000000000000000001111111111) (= (mask!30182 thiss!1427) #b00000000000000000000011111111111) (= (mask!30182 thiss!1427) #b00000000000000000000111111111111) (= (mask!30182 thiss!1427) #b00000000000000000001111111111111) (= (mask!30182 thiss!1427) #b00000000000000000011111111111111) (= (mask!30182 thiss!1427) #b00000000000000000111111111111111) (= (mask!30182 thiss!1427) #b00000000000000001111111111111111) (= (mask!30182 thiss!1427) #b00000000000000011111111111111111) (= (mask!30182 thiss!1427) #b00000000000000111111111111111111) (= (mask!30182 thiss!1427) #b00000000000001111111111111111111) (= (mask!30182 thiss!1427) #b00000000000011111111111111111111) (= (mask!30182 thiss!1427) #b00000000000111111111111111111111) (= (mask!30182 thiss!1427) #b00000000001111111111111111111111) (= (mask!30182 thiss!1427) #b00000000011111111111111111111111) (= (mask!30182 thiss!1427) #b00000000111111111111111111111111) (= (mask!30182 thiss!1427) #b00000001111111111111111111111111) (= (mask!30182 thiss!1427) #b00000011111111111111111111111111) (= (mask!30182 thiss!1427) #b00000111111111111111111111111111) (= (mask!30182 thiss!1427) #b00001111111111111111111111111111) (= (mask!30182 thiss!1427) #b00011111111111111111111111111111) (= (mask!30182 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30182 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1036455 d!124953))

(declare-fun d!124955 () Bool)

(assert (=> d!124955 (= (array_inv!24301 (_keys!11468 thiss!1427)) (bvsge (size!31926 (_keys!11468 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1036450 d!124955))

(declare-fun d!124957 () Bool)

(assert (=> d!124957 (= (array_inv!24302 (_values!6268 thiss!1427)) (bvsge (size!31927 (_values!6268 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1036450 d!124957))

(declare-fun mapNonEmpty!38332 () Bool)

(declare-fun mapRes!38332 () Bool)

(declare-fun tp!73616 () Bool)

(declare-fun e!586142 () Bool)

(assert (=> mapNonEmpty!38332 (= mapRes!38332 (and tp!73616 e!586142))))

(declare-fun mapKey!38332 () (_ BitVec 32))

(declare-fun mapRest!38332 () (Array (_ BitVec 32) ValueCell!11570))

(declare-fun mapValue!38332 () ValueCell!11570)

(assert (=> mapNonEmpty!38332 (= mapRest!38323 (store mapRest!38332 mapKey!38332 mapValue!38332))))

(declare-fun b!1036514 () Bool)

(declare-fun e!586143 () Bool)

(assert (=> b!1036514 (= e!586143 tp_is_empty!24547)))

(declare-fun b!1036513 () Bool)

(assert (=> b!1036513 (= e!586142 tp_is_empty!24547)))

(declare-fun mapIsEmpty!38332 () Bool)

(assert (=> mapIsEmpty!38332 mapRes!38332))

(declare-fun condMapEmpty!38332 () Bool)

(declare-fun mapDefault!38332 () ValueCell!11570)

(assert (=> mapNonEmpty!38323 (= condMapEmpty!38332 (= mapRest!38323 ((as const (Array (_ BitVec 32) ValueCell!11570)) mapDefault!38332)))))

(assert (=> mapNonEmpty!38323 (= tp!73601 (and e!586143 mapRes!38332))))

(assert (= (and mapNonEmpty!38323 condMapEmpty!38332) mapIsEmpty!38332))

(assert (= (and mapNonEmpty!38323 (not condMapEmpty!38332)) mapNonEmpty!38332))

(assert (= (and mapNonEmpty!38332 ((_ is ValueCellFull!11570) mapValue!38332)) b!1036513))

(assert (= (and mapNonEmpty!38323 ((_ is ValueCellFull!11570) mapDefault!38332)) b!1036514))

(declare-fun m!956941 () Bool)

(assert (=> mapNonEmpty!38332 m!956941))

(check-sat (not b!1036505) (not mapNonEmpty!38332) (not b!1036506) tp_is_empty!24547 (not d!124951) b_and!33337 (not b!1036504) (not b_next!20827))
(check-sat b_and!33337 (not b_next!20827))
(get-model)

(declare-fun b!1036523 () Bool)

(declare-fun e!586149 () (_ BitVec 32))

(declare-fun e!586148 () (_ BitVec 32))

(assert (=> b!1036523 (= e!586149 e!586148)))

(declare-fun c!105127 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1036523 (= c!105127 (validKeyInArray!0 (select (arr!31399 (_keys!11468 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43840 () Bool)

(declare-fun call!43843 () (_ BitVec 32))

(assert (=> bm!43840 (= call!43843 (arrayCountValidKeys!0 (_keys!11468 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31926 (_keys!11468 thiss!1427))))))

(declare-fun b!1036524 () Bool)

(assert (=> b!1036524 (= e!586148 call!43843)))

(declare-fun b!1036525 () Bool)

(assert (=> b!1036525 (= e!586149 #b00000000000000000000000000000000)))

(declare-fun d!124959 () Bool)

(declare-fun lt!457250 () (_ BitVec 32))

(assert (=> d!124959 (and (bvsge lt!457250 #b00000000000000000000000000000000) (bvsle lt!457250 (bvsub (size!31926 (_keys!11468 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!124959 (= lt!457250 e!586149)))

(declare-fun c!105128 () Bool)

(assert (=> d!124959 (= c!105128 (bvsge #b00000000000000000000000000000000 (size!31926 (_keys!11468 thiss!1427))))))

(assert (=> d!124959 (and (bvsle #b00000000000000000000000000000000 (size!31926 (_keys!11468 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31926 (_keys!11468 thiss!1427)) (size!31926 (_keys!11468 thiss!1427))))))

(assert (=> d!124959 (= (arrayCountValidKeys!0 (_keys!11468 thiss!1427) #b00000000000000000000000000000000 (size!31926 (_keys!11468 thiss!1427))) lt!457250)))

(declare-fun b!1036526 () Bool)

(assert (=> b!1036526 (= e!586148 (bvadd #b00000000000000000000000000000001 call!43843))))

(assert (= (and d!124959 c!105128) b!1036525))

(assert (= (and d!124959 (not c!105128)) b!1036523))

(assert (= (and b!1036523 c!105127) b!1036526))

(assert (= (and b!1036523 (not c!105127)) b!1036524))

(assert (= (or b!1036526 b!1036524) bm!43840))

(declare-fun m!956943 () Bool)

(assert (=> b!1036523 m!956943))

(assert (=> b!1036523 m!956943))

(declare-fun m!956945 () Bool)

(assert (=> b!1036523 m!956945))

(declare-fun m!956947 () Bool)

(assert (=> bm!43840 m!956947))

(assert (=> b!1036504 d!124959))

(declare-fun d!124961 () Bool)

(declare-fun res!691763 () Bool)

(declare-fun e!586152 () Bool)

(assert (=> d!124961 (=> (not res!691763) (not e!586152))))

(assert (=> d!124961 (= res!691763 (validMask!0 (mask!30182 thiss!1427)))))

(assert (=> d!124961 (= (simpleValid!410 thiss!1427) e!586152)))

(declare-fun b!1036537 () Bool)

(declare-fun res!691766 () Bool)

(assert (=> b!1036537 (=> (not res!691766) (not e!586152))))

(declare-fun size!31932 (LongMapFixedSize!5734) (_ BitVec 32))

(assert (=> b!1036537 (= res!691766 (= (size!31932 thiss!1427) (bvadd (_size!2922 thiss!1427) (bvsdiv (bvadd (extraKeys!5975 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1036536 () Bool)

(declare-fun res!691765 () Bool)

(assert (=> b!1036536 (=> (not res!691765) (not e!586152))))

(assert (=> b!1036536 (= res!691765 (bvsge (size!31932 thiss!1427) (_size!2922 thiss!1427)))))

(declare-fun b!1036538 () Bool)

(assert (=> b!1036538 (= e!586152 (and (bvsge (extraKeys!5975 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5975 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2922 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1036535 () Bool)

(declare-fun res!691764 () Bool)

(assert (=> b!1036535 (=> (not res!691764) (not e!586152))))

(assert (=> b!1036535 (= res!691764 (and (= (size!31927 (_values!6268 thiss!1427)) (bvadd (mask!30182 thiss!1427) #b00000000000000000000000000000001)) (= (size!31926 (_keys!11468 thiss!1427)) (size!31927 (_values!6268 thiss!1427))) (bvsge (_size!2922 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2922 thiss!1427) (bvadd (mask!30182 thiss!1427) #b00000000000000000000000000000001))))))

(assert (= (and d!124961 res!691763) b!1036535))

(assert (= (and b!1036535 res!691764) b!1036536))

(assert (= (and b!1036536 res!691765) b!1036537))

(assert (= (and b!1036537 res!691766) b!1036538))

(assert (=> d!124961 m!956907))

(declare-fun m!956949 () Bool)

(assert (=> b!1036537 m!956949))

(assert (=> b!1036536 m!956949))

(assert (=> d!124951 d!124961))

(declare-fun b!1036549 () Bool)

(declare-fun e!586161 () Bool)

(declare-fun contains!6043 (List!21898 (_ BitVec 64)) Bool)

(assert (=> b!1036549 (= e!586161 (contains!6043 Nil!21895 (select (arr!31399 (_keys!11468 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1036550 () Bool)

(declare-fun e!586162 () Bool)

(declare-fun e!586163 () Bool)

(assert (=> b!1036550 (= e!586162 e!586163)))

(declare-fun c!105131 () Bool)

(assert (=> b!1036550 (= c!105131 (validKeyInArray!0 (select (arr!31399 (_keys!11468 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1036551 () Bool)

(declare-fun call!43846 () Bool)

(assert (=> b!1036551 (= e!586163 call!43846)))

(declare-fun b!1036552 () Bool)

(assert (=> b!1036552 (= e!586163 call!43846)))

(declare-fun b!1036553 () Bool)

(declare-fun e!586164 () Bool)

(assert (=> b!1036553 (= e!586164 e!586162)))

(declare-fun res!691774 () Bool)

(assert (=> b!1036553 (=> (not res!691774) (not e!586162))))

(assert (=> b!1036553 (= res!691774 (not e!586161))))

(declare-fun res!691773 () Bool)

(assert (=> b!1036553 (=> (not res!691773) (not e!586161))))

(assert (=> b!1036553 (= res!691773 (validKeyInArray!0 (select (arr!31399 (_keys!11468 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!124963 () Bool)

(declare-fun res!691775 () Bool)

(assert (=> d!124963 (=> res!691775 e!586164)))

(assert (=> d!124963 (= res!691775 (bvsge #b00000000000000000000000000000000 (size!31926 (_keys!11468 thiss!1427))))))

(assert (=> d!124963 (= (arrayNoDuplicates!0 (_keys!11468 thiss!1427) #b00000000000000000000000000000000 Nil!21895) e!586164)))

(declare-fun bm!43843 () Bool)

(assert (=> bm!43843 (= call!43846 (arrayNoDuplicates!0 (_keys!11468 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105131 (Cons!21894 (select (arr!31399 (_keys!11468 thiss!1427)) #b00000000000000000000000000000000) Nil!21895) Nil!21895)))))

(assert (= (and d!124963 (not res!691775)) b!1036553))

(assert (= (and b!1036553 res!691773) b!1036549))

(assert (= (and b!1036553 res!691774) b!1036550))

(assert (= (and b!1036550 c!105131) b!1036552))

(assert (= (and b!1036550 (not c!105131)) b!1036551))

(assert (= (or b!1036552 b!1036551) bm!43843))

(assert (=> b!1036549 m!956943))

(assert (=> b!1036549 m!956943))

(declare-fun m!956951 () Bool)

(assert (=> b!1036549 m!956951))

(assert (=> b!1036550 m!956943))

(assert (=> b!1036550 m!956943))

(assert (=> b!1036550 m!956945))

(assert (=> b!1036553 m!956943))

(assert (=> b!1036553 m!956943))

(assert (=> b!1036553 m!956945))

(assert (=> bm!43843 m!956943))

(declare-fun m!956953 () Bool)

(assert (=> bm!43843 m!956953))

(assert (=> b!1036506 d!124963))

(declare-fun b!1036562 () Bool)

(declare-fun e!586172 () Bool)

(declare-fun e!586173 () Bool)

(assert (=> b!1036562 (= e!586172 e!586173)))

(declare-fun c!105134 () Bool)

(assert (=> b!1036562 (= c!105134 (validKeyInArray!0 (select (arr!31399 (_keys!11468 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1036563 () Bool)

(declare-fun e!586171 () Bool)

(declare-fun call!43849 () Bool)

(assert (=> b!1036563 (= e!586171 call!43849)))

(declare-fun b!1036564 () Bool)

(assert (=> b!1036564 (= e!586173 call!43849)))

(declare-fun d!124965 () Bool)

(declare-fun res!691780 () Bool)

(assert (=> d!124965 (=> res!691780 e!586172)))

(assert (=> d!124965 (= res!691780 (bvsge #b00000000000000000000000000000000 (size!31926 (_keys!11468 thiss!1427))))))

(assert (=> d!124965 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11468 thiss!1427) (mask!30182 thiss!1427)) e!586172)))

(declare-fun bm!43846 () Bool)

(assert (=> bm!43846 (= call!43849 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11468 thiss!1427) (mask!30182 thiss!1427)))))

(declare-fun b!1036565 () Bool)

(assert (=> b!1036565 (= e!586173 e!586171)))

(declare-fun lt!457257 () (_ BitVec 64))

(assert (=> b!1036565 (= lt!457257 (select (arr!31399 (_keys!11468 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33890 0))(
  ( (Unit!33891) )
))
(declare-fun lt!457258 () Unit!33890)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65233 (_ BitVec 64) (_ BitVec 32)) Unit!33890)

(assert (=> b!1036565 (= lt!457258 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11468 thiss!1427) lt!457257 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65233 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1036565 (arrayContainsKey!0 (_keys!11468 thiss!1427) lt!457257 #b00000000000000000000000000000000)))

(declare-fun lt!457259 () Unit!33890)

(assert (=> b!1036565 (= lt!457259 lt!457258)))

(declare-fun res!691781 () Bool)

(declare-datatypes ((SeekEntryResult!9699 0))(
  ( (MissingZero!9699 (index!41167 (_ BitVec 32))) (Found!9699 (index!41168 (_ BitVec 32))) (Intermediate!9699 (undefined!10511 Bool) (index!41169 (_ BitVec 32)) (x!92320 (_ BitVec 32))) (Undefined!9699) (MissingVacant!9699 (index!41170 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65233 (_ BitVec 32)) SeekEntryResult!9699)

(assert (=> b!1036565 (= res!691781 (= (seekEntryOrOpen!0 (select (arr!31399 (_keys!11468 thiss!1427)) #b00000000000000000000000000000000) (_keys!11468 thiss!1427) (mask!30182 thiss!1427)) (Found!9699 #b00000000000000000000000000000000)))))

(assert (=> b!1036565 (=> (not res!691781) (not e!586171))))

(assert (= (and d!124965 (not res!691780)) b!1036562))

(assert (= (and b!1036562 c!105134) b!1036565))

(assert (= (and b!1036562 (not c!105134)) b!1036564))

(assert (= (and b!1036565 res!691781) b!1036563))

(assert (= (or b!1036563 b!1036564) bm!43846))

(assert (=> b!1036562 m!956943))

(assert (=> b!1036562 m!956943))

(assert (=> b!1036562 m!956945))

(declare-fun m!956955 () Bool)

(assert (=> bm!43846 m!956955))

(assert (=> b!1036565 m!956943))

(declare-fun m!956957 () Bool)

(assert (=> b!1036565 m!956957))

(declare-fun m!956959 () Bool)

(assert (=> b!1036565 m!956959))

(assert (=> b!1036565 m!956943))

(declare-fun m!956961 () Bool)

(assert (=> b!1036565 m!956961))

(assert (=> b!1036505 d!124965))

(declare-fun mapNonEmpty!38333 () Bool)

(declare-fun mapRes!38333 () Bool)

(declare-fun tp!73617 () Bool)

(declare-fun e!586174 () Bool)

(assert (=> mapNonEmpty!38333 (= mapRes!38333 (and tp!73617 e!586174))))

(declare-fun mapRest!38333 () (Array (_ BitVec 32) ValueCell!11570))

(declare-fun mapValue!38333 () ValueCell!11570)

(declare-fun mapKey!38333 () (_ BitVec 32))

(assert (=> mapNonEmpty!38333 (= mapRest!38332 (store mapRest!38333 mapKey!38333 mapValue!38333))))

(declare-fun b!1036567 () Bool)

(declare-fun e!586175 () Bool)

(assert (=> b!1036567 (= e!586175 tp_is_empty!24547)))

(declare-fun b!1036566 () Bool)

(assert (=> b!1036566 (= e!586174 tp_is_empty!24547)))

(declare-fun mapIsEmpty!38333 () Bool)

(assert (=> mapIsEmpty!38333 mapRes!38333))

(declare-fun condMapEmpty!38333 () Bool)

(declare-fun mapDefault!38333 () ValueCell!11570)

(assert (=> mapNonEmpty!38332 (= condMapEmpty!38333 (= mapRest!38332 ((as const (Array (_ BitVec 32) ValueCell!11570)) mapDefault!38333)))))

(assert (=> mapNonEmpty!38332 (= tp!73616 (and e!586175 mapRes!38333))))

(assert (= (and mapNonEmpty!38332 condMapEmpty!38333) mapIsEmpty!38333))

(assert (= (and mapNonEmpty!38332 (not condMapEmpty!38333)) mapNonEmpty!38333))

(assert (= (and mapNonEmpty!38333 ((_ is ValueCellFull!11570) mapValue!38333)) b!1036566))

(assert (= (and mapNonEmpty!38332 ((_ is ValueCellFull!11570) mapDefault!38333)) b!1036567))

(declare-fun m!956963 () Bool)

(assert (=> mapNonEmpty!38333 m!956963))

(check-sat (not b!1036565) (not b!1036536) (not bm!43843) (not b!1036549) (not d!124961) (not bm!43846) tp_is_empty!24547 (not b!1036553) (not b_next!20827) (not bm!43840) (not b!1036562) (not b!1036537) (not b!1036550) (not b!1036523) b_and!33337 (not mapNonEmpty!38333))
(check-sat b_and!33337 (not b_next!20827))

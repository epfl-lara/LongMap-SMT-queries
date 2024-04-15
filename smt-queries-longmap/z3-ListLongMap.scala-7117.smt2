; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90218 () Bool)

(assert start!90218)

(declare-fun b!1032811 () Bool)

(declare-fun b_free!20755 () Bool)

(declare-fun b_next!20755 () Bool)

(assert (=> b!1032811 (= b_free!20755 (not b_next!20755))))

(declare-fun tp!73354 () Bool)

(declare-fun b_and!33197 () Bool)

(assert (=> b!1032811 (= tp!73354 b_and!33197)))

(declare-fun b!1032808 () Bool)

(declare-fun e!583662 () Bool)

(declare-fun tp_is_empty!24475 () Bool)

(assert (=> b!1032808 (= e!583662 tp_is_empty!24475)))

(declare-fun mapNonEmpty!38185 () Bool)

(declare-fun mapRes!38185 () Bool)

(declare-fun tp!73355 () Bool)

(assert (=> mapNonEmpty!38185 (= mapRes!38185 (and tp!73355 e!583662))))

(declare-datatypes ((V!37507 0))(
  ( (V!37508 (val!12288 Int)) )
))
(declare-datatypes ((ValueCell!11534 0))(
  ( (ValueCellFull!11534 (v!14864 V!37507)) (EmptyCell!11534) )
))
(declare-fun mapValue!38185 () ValueCell!11534)

(declare-fun mapRest!38185 () (Array (_ BitVec 32) ValueCell!11534))

(declare-fun mapKey!38185 () (_ BitVec 32))

(declare-datatypes ((array!64963 0))(
  ( (array!64964 (arr!31278 (Array (_ BitVec 32) (_ BitVec 64))) (size!31801 (_ BitVec 32))) )
))
(declare-datatypes ((array!64965 0))(
  ( (array!64966 (arr!31279 (Array (_ BitVec 32) ValueCell!11534)) (size!31802 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5662 0))(
  ( (LongMapFixedSize!5663 (defaultEntry!6205 Int) (mask!30037 (_ BitVec 32)) (extraKeys!5937 (_ BitVec 32)) (zeroValue!6041 V!37507) (minValue!6041 V!37507) (_size!2886 (_ BitVec 32)) (_keys!11378 array!64963) (_values!6228 array!64965) (_vacant!2886 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5662)

(assert (=> mapNonEmpty!38185 (= (arr!31279 (_values!6228 thiss!1427)) (store mapRest!38185 mapKey!38185 mapValue!38185))))

(declare-fun b!1032809 () Bool)

(declare-fun e!583663 () Bool)

(assert (=> b!1032809 (= e!583663 tp_is_empty!24475)))

(declare-fun b!1032810 () Bool)

(declare-fun e!583659 () Bool)

(assert (=> b!1032810 (= e!583659 (and e!583663 mapRes!38185))))

(declare-fun condMapEmpty!38185 () Bool)

(declare-fun mapDefault!38185 () ValueCell!11534)

(assert (=> b!1032810 (= condMapEmpty!38185 (= (arr!31279 (_values!6228 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11534)) mapDefault!38185)))))

(declare-fun mapIsEmpty!38185 () Bool)

(assert (=> mapIsEmpty!38185 mapRes!38185))

(declare-fun b!1032812 () Bool)

(declare-fun res!690220 () Bool)

(declare-fun e!583661 () Bool)

(assert (=> b!1032812 (=> (not res!690220) (not e!583661))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1032812 (= res!690220 (validMask!0 (mask!30037 thiss!1427)))))

(declare-fun b!1032813 () Bool)

(declare-fun res!690219 () Bool)

(assert (=> b!1032813 (=> (not res!690219) (not e!583661))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1032813 (= res!690219 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1032814 () Bool)

(assert (=> b!1032814 (= e!583661 (and (= (size!31802 (_values!6228 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30037 thiss!1427))) (= (size!31801 (_keys!11378 thiss!1427)) (size!31802 (_values!6228 thiss!1427))) (bvsge (mask!30037 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5937 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5937 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun e!583658 () Bool)

(declare-fun array_inv!24203 (array!64963) Bool)

(declare-fun array_inv!24204 (array!64965) Bool)

(assert (=> b!1032811 (= e!583658 (and tp!73354 tp_is_empty!24475 (array_inv!24203 (_keys!11378 thiss!1427)) (array_inv!24204 (_values!6228 thiss!1427)) e!583659))))

(declare-fun res!690218 () Bool)

(assert (=> start!90218 (=> (not res!690218) (not e!583661))))

(declare-fun valid!2132 (LongMapFixedSize!5662) Bool)

(assert (=> start!90218 (= res!690218 (valid!2132 thiss!1427))))

(assert (=> start!90218 e!583661))

(assert (=> start!90218 e!583658))

(assert (=> start!90218 true))

(assert (= (and start!90218 res!690218) b!1032813))

(assert (= (and b!1032813 res!690219) b!1032812))

(assert (= (and b!1032812 res!690220) b!1032814))

(assert (= (and b!1032810 condMapEmpty!38185) mapIsEmpty!38185))

(assert (= (and b!1032810 (not condMapEmpty!38185)) mapNonEmpty!38185))

(get-info :version)

(assert (= (and mapNonEmpty!38185 ((_ is ValueCellFull!11534) mapValue!38185)) b!1032808))

(assert (= (and b!1032810 ((_ is ValueCellFull!11534) mapDefault!38185)) b!1032809))

(assert (= b!1032811 b!1032810))

(assert (= start!90218 b!1032811))

(declare-fun m!952345 () Bool)

(assert (=> mapNonEmpty!38185 m!952345))

(declare-fun m!952347 () Bool)

(assert (=> b!1032812 m!952347))

(declare-fun m!952349 () Bool)

(assert (=> b!1032811 m!952349))

(declare-fun m!952351 () Bool)

(assert (=> b!1032811 m!952351))

(declare-fun m!952353 () Bool)

(assert (=> start!90218 m!952353))

(check-sat b_and!33197 tp_is_empty!24475 (not start!90218) (not b_next!20755) (not b!1032811) (not b!1032812) (not mapNonEmpty!38185))
(check-sat b_and!33197 (not b_next!20755))
(get-model)

(declare-fun d!123603 () Bool)

(assert (=> d!123603 (= (validMask!0 (mask!30037 thiss!1427)) (and (or (= (mask!30037 thiss!1427) #b00000000000000000000000000000111) (= (mask!30037 thiss!1427) #b00000000000000000000000000001111) (= (mask!30037 thiss!1427) #b00000000000000000000000000011111) (= (mask!30037 thiss!1427) #b00000000000000000000000000111111) (= (mask!30037 thiss!1427) #b00000000000000000000000001111111) (= (mask!30037 thiss!1427) #b00000000000000000000000011111111) (= (mask!30037 thiss!1427) #b00000000000000000000000111111111) (= (mask!30037 thiss!1427) #b00000000000000000000001111111111) (= (mask!30037 thiss!1427) #b00000000000000000000011111111111) (= (mask!30037 thiss!1427) #b00000000000000000000111111111111) (= (mask!30037 thiss!1427) #b00000000000000000001111111111111) (= (mask!30037 thiss!1427) #b00000000000000000011111111111111) (= (mask!30037 thiss!1427) #b00000000000000000111111111111111) (= (mask!30037 thiss!1427) #b00000000000000001111111111111111) (= (mask!30037 thiss!1427) #b00000000000000011111111111111111) (= (mask!30037 thiss!1427) #b00000000000000111111111111111111) (= (mask!30037 thiss!1427) #b00000000000001111111111111111111) (= (mask!30037 thiss!1427) #b00000000000011111111111111111111) (= (mask!30037 thiss!1427) #b00000000000111111111111111111111) (= (mask!30037 thiss!1427) #b00000000001111111111111111111111) (= (mask!30037 thiss!1427) #b00000000011111111111111111111111) (= (mask!30037 thiss!1427) #b00000000111111111111111111111111) (= (mask!30037 thiss!1427) #b00000001111111111111111111111111) (= (mask!30037 thiss!1427) #b00000011111111111111111111111111) (= (mask!30037 thiss!1427) #b00000111111111111111111111111111) (= (mask!30037 thiss!1427) #b00001111111111111111111111111111) (= (mask!30037 thiss!1427) #b00011111111111111111111111111111) (= (mask!30037 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30037 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1032812 d!123603))

(declare-fun d!123605 () Bool)

(assert (=> d!123605 (= (array_inv!24203 (_keys!11378 thiss!1427)) (bvsge (size!31801 (_keys!11378 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1032811 d!123605))

(declare-fun d!123607 () Bool)

(assert (=> d!123607 (= (array_inv!24204 (_values!6228 thiss!1427)) (bvsge (size!31802 (_values!6228 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1032811 d!123607))

(declare-fun d!123609 () Bool)

(declare-fun res!690245 () Bool)

(declare-fun e!583702 () Bool)

(assert (=> d!123609 (=> (not res!690245) (not e!583702))))

(declare-fun simpleValid!402 (LongMapFixedSize!5662) Bool)

(assert (=> d!123609 (= res!690245 (simpleValid!402 thiss!1427))))

(assert (=> d!123609 (= (valid!2132 thiss!1427) e!583702)))

(declare-fun b!1032863 () Bool)

(declare-fun res!690246 () Bool)

(assert (=> b!1032863 (=> (not res!690246) (not e!583702))))

(declare-fun arrayCountValidKeys!0 (array!64963 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1032863 (= res!690246 (= (arrayCountValidKeys!0 (_keys!11378 thiss!1427) #b00000000000000000000000000000000 (size!31801 (_keys!11378 thiss!1427))) (_size!2886 thiss!1427)))))

(declare-fun b!1032864 () Bool)

(declare-fun res!690247 () Bool)

(assert (=> b!1032864 (=> (not res!690247) (not e!583702))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64963 (_ BitVec 32)) Bool)

(assert (=> b!1032864 (= res!690247 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11378 thiss!1427) (mask!30037 thiss!1427)))))

(declare-fun b!1032865 () Bool)

(declare-datatypes ((List!21936 0))(
  ( (Nil!21933) (Cons!21932 (h!23134 (_ BitVec 64)) (t!31121 List!21936)) )
))
(declare-fun arrayNoDuplicates!0 (array!64963 (_ BitVec 32) List!21936) Bool)

(assert (=> b!1032865 (= e!583702 (arrayNoDuplicates!0 (_keys!11378 thiss!1427) #b00000000000000000000000000000000 Nil!21933))))

(assert (= (and d!123609 res!690245) b!1032863))

(assert (= (and b!1032863 res!690246) b!1032864))

(assert (= (and b!1032864 res!690247) b!1032865))

(declare-fun m!952375 () Bool)

(assert (=> d!123609 m!952375))

(declare-fun m!952377 () Bool)

(assert (=> b!1032863 m!952377))

(declare-fun m!952379 () Bool)

(assert (=> b!1032864 m!952379))

(declare-fun m!952381 () Bool)

(assert (=> b!1032865 m!952381))

(assert (=> start!90218 d!123609))

(declare-fun b!1032873 () Bool)

(declare-fun e!583707 () Bool)

(assert (=> b!1032873 (= e!583707 tp_is_empty!24475)))

(declare-fun b!1032872 () Bool)

(declare-fun e!583708 () Bool)

(assert (=> b!1032872 (= e!583708 tp_is_empty!24475)))

(declare-fun mapIsEmpty!38194 () Bool)

(declare-fun mapRes!38194 () Bool)

(assert (=> mapIsEmpty!38194 mapRes!38194))

(declare-fun condMapEmpty!38194 () Bool)

(declare-fun mapDefault!38194 () ValueCell!11534)

(assert (=> mapNonEmpty!38185 (= condMapEmpty!38194 (= mapRest!38185 ((as const (Array (_ BitVec 32) ValueCell!11534)) mapDefault!38194)))))

(assert (=> mapNonEmpty!38185 (= tp!73355 (and e!583707 mapRes!38194))))

(declare-fun mapNonEmpty!38194 () Bool)

(declare-fun tp!73370 () Bool)

(assert (=> mapNonEmpty!38194 (= mapRes!38194 (and tp!73370 e!583708))))

(declare-fun mapKey!38194 () (_ BitVec 32))

(declare-fun mapRest!38194 () (Array (_ BitVec 32) ValueCell!11534))

(declare-fun mapValue!38194 () ValueCell!11534)

(assert (=> mapNonEmpty!38194 (= mapRest!38185 (store mapRest!38194 mapKey!38194 mapValue!38194))))

(assert (= (and mapNonEmpty!38185 condMapEmpty!38194) mapIsEmpty!38194))

(assert (= (and mapNonEmpty!38185 (not condMapEmpty!38194)) mapNonEmpty!38194))

(assert (= (and mapNonEmpty!38194 ((_ is ValueCellFull!11534) mapValue!38194)) b!1032872))

(assert (= (and mapNonEmpty!38185 ((_ is ValueCellFull!11534) mapDefault!38194)) b!1032873))

(declare-fun m!952383 () Bool)

(assert (=> mapNonEmpty!38194 m!952383))

(check-sat b_and!33197 (not d!123609) tp_is_empty!24475 (not b!1032864) (not b!1032865) (not b_next!20755) (not mapNonEmpty!38194) (not b!1032863))
(check-sat b_and!33197 (not b_next!20755))
(get-model)

(declare-fun b!1032882 () Bool)

(declare-fun e!583716 () Bool)

(declare-fun e!583717 () Bool)

(assert (=> b!1032882 (= e!583716 e!583717)))

(declare-fun lt!455886 () (_ BitVec 64))

(assert (=> b!1032882 (= lt!455886 (select (arr!31278 (_keys!11378 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33707 0))(
  ( (Unit!33708) )
))
(declare-fun lt!455885 () Unit!33707)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64963 (_ BitVec 64) (_ BitVec 32)) Unit!33707)

(assert (=> b!1032882 (= lt!455885 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11378 thiss!1427) lt!455886 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!64963 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1032882 (arrayContainsKey!0 (_keys!11378 thiss!1427) lt!455886 #b00000000000000000000000000000000)))

(declare-fun lt!455884 () Unit!33707)

(assert (=> b!1032882 (= lt!455884 lt!455885)))

(declare-fun res!690252 () Bool)

(declare-datatypes ((SeekEntryResult!9726 0))(
  ( (MissingZero!9726 (index!41275 (_ BitVec 32))) (Found!9726 (index!41276 (_ BitVec 32))) (Intermediate!9726 (undefined!10538 Bool) (index!41277 (_ BitVec 32)) (x!92105 (_ BitVec 32))) (Undefined!9726) (MissingVacant!9726 (index!41278 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!64963 (_ BitVec 32)) SeekEntryResult!9726)

(assert (=> b!1032882 (= res!690252 (= (seekEntryOrOpen!0 (select (arr!31278 (_keys!11378 thiss!1427)) #b00000000000000000000000000000000) (_keys!11378 thiss!1427) (mask!30037 thiss!1427)) (Found!9726 #b00000000000000000000000000000000)))))

(assert (=> b!1032882 (=> (not res!690252) (not e!583717))))

(declare-fun b!1032883 () Bool)

(declare-fun call!43606 () Bool)

(assert (=> b!1032883 (= e!583717 call!43606)))

(declare-fun b!1032884 () Bool)

(assert (=> b!1032884 (= e!583716 call!43606)))

(declare-fun d!123611 () Bool)

(declare-fun res!690253 () Bool)

(declare-fun e!583715 () Bool)

(assert (=> d!123611 (=> res!690253 e!583715)))

(assert (=> d!123611 (= res!690253 (bvsge #b00000000000000000000000000000000 (size!31801 (_keys!11378 thiss!1427))))))

(assert (=> d!123611 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11378 thiss!1427) (mask!30037 thiss!1427)) e!583715)))

(declare-fun bm!43603 () Bool)

(assert (=> bm!43603 (= call!43606 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11378 thiss!1427) (mask!30037 thiss!1427)))))

(declare-fun b!1032885 () Bool)

(assert (=> b!1032885 (= e!583715 e!583716)))

(declare-fun c!104313 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1032885 (= c!104313 (validKeyInArray!0 (select (arr!31278 (_keys!11378 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!123611 (not res!690253)) b!1032885))

(assert (= (and b!1032885 c!104313) b!1032882))

(assert (= (and b!1032885 (not c!104313)) b!1032884))

(assert (= (and b!1032882 res!690252) b!1032883))

(assert (= (or b!1032883 b!1032884) bm!43603))

(declare-fun m!952385 () Bool)

(assert (=> b!1032882 m!952385))

(declare-fun m!952387 () Bool)

(assert (=> b!1032882 m!952387))

(declare-fun m!952389 () Bool)

(assert (=> b!1032882 m!952389))

(assert (=> b!1032882 m!952385))

(declare-fun m!952391 () Bool)

(assert (=> b!1032882 m!952391))

(declare-fun m!952393 () Bool)

(assert (=> bm!43603 m!952393))

(assert (=> b!1032885 m!952385))

(assert (=> b!1032885 m!952385))

(declare-fun m!952395 () Bool)

(assert (=> b!1032885 m!952395))

(assert (=> b!1032864 d!123611))

(declare-fun b!1032896 () Bool)

(declare-fun e!583728 () Bool)

(declare-fun contains!5990 (List!21936 (_ BitVec 64)) Bool)

(assert (=> b!1032896 (= e!583728 (contains!5990 Nil!21933 (select (arr!31278 (_keys!11378 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1032897 () Bool)

(declare-fun e!583726 () Bool)

(declare-fun e!583727 () Bool)

(assert (=> b!1032897 (= e!583726 e!583727)))

(declare-fun c!104316 () Bool)

(assert (=> b!1032897 (= c!104316 (validKeyInArray!0 (select (arr!31278 (_keys!11378 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1032898 () Bool)

(declare-fun e!583729 () Bool)

(assert (=> b!1032898 (= e!583729 e!583726)))

(declare-fun res!690261 () Bool)

(assert (=> b!1032898 (=> (not res!690261) (not e!583726))))

(assert (=> b!1032898 (= res!690261 (not e!583728))))

(declare-fun res!690262 () Bool)

(assert (=> b!1032898 (=> (not res!690262) (not e!583728))))

(assert (=> b!1032898 (= res!690262 (validKeyInArray!0 (select (arr!31278 (_keys!11378 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!123613 () Bool)

(declare-fun res!690260 () Bool)

(assert (=> d!123613 (=> res!690260 e!583729)))

(assert (=> d!123613 (= res!690260 (bvsge #b00000000000000000000000000000000 (size!31801 (_keys!11378 thiss!1427))))))

(assert (=> d!123613 (= (arrayNoDuplicates!0 (_keys!11378 thiss!1427) #b00000000000000000000000000000000 Nil!21933) e!583729)))

(declare-fun b!1032899 () Bool)

(declare-fun call!43609 () Bool)

(assert (=> b!1032899 (= e!583727 call!43609)))

(declare-fun bm!43606 () Bool)

(assert (=> bm!43606 (= call!43609 (arrayNoDuplicates!0 (_keys!11378 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104316 (Cons!21932 (select (arr!31278 (_keys!11378 thiss!1427)) #b00000000000000000000000000000000) Nil!21933) Nil!21933)))))

(declare-fun b!1032900 () Bool)

(assert (=> b!1032900 (= e!583727 call!43609)))

(assert (= (and d!123613 (not res!690260)) b!1032898))

(assert (= (and b!1032898 res!690262) b!1032896))

(assert (= (and b!1032898 res!690261) b!1032897))

(assert (= (and b!1032897 c!104316) b!1032899))

(assert (= (and b!1032897 (not c!104316)) b!1032900))

(assert (= (or b!1032899 b!1032900) bm!43606))

(assert (=> b!1032896 m!952385))

(assert (=> b!1032896 m!952385))

(declare-fun m!952397 () Bool)

(assert (=> b!1032896 m!952397))

(assert (=> b!1032897 m!952385))

(assert (=> b!1032897 m!952385))

(assert (=> b!1032897 m!952395))

(assert (=> b!1032898 m!952385))

(assert (=> b!1032898 m!952385))

(assert (=> b!1032898 m!952395))

(assert (=> bm!43606 m!952385))

(declare-fun m!952399 () Bool)

(assert (=> bm!43606 m!952399))

(assert (=> b!1032865 d!123613))

(declare-fun b!1032909 () Bool)

(declare-fun e!583735 () (_ BitVec 32))

(declare-fun e!583734 () (_ BitVec 32))

(assert (=> b!1032909 (= e!583735 e!583734)))

(declare-fun c!104322 () Bool)

(assert (=> b!1032909 (= c!104322 (validKeyInArray!0 (select (arr!31278 (_keys!11378 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43609 () Bool)

(declare-fun call!43612 () (_ BitVec 32))

(assert (=> bm!43609 (= call!43612 (arrayCountValidKeys!0 (_keys!11378 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31801 (_keys!11378 thiss!1427))))))

(declare-fun b!1032910 () Bool)

(assert (=> b!1032910 (= e!583734 call!43612)))

(declare-fun b!1032911 () Bool)

(assert (=> b!1032911 (= e!583735 #b00000000000000000000000000000000)))

(declare-fun d!123615 () Bool)

(declare-fun lt!455889 () (_ BitVec 32))

(assert (=> d!123615 (and (bvsge lt!455889 #b00000000000000000000000000000000) (bvsle lt!455889 (bvsub (size!31801 (_keys!11378 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!123615 (= lt!455889 e!583735)))

(declare-fun c!104321 () Bool)

(assert (=> d!123615 (= c!104321 (bvsge #b00000000000000000000000000000000 (size!31801 (_keys!11378 thiss!1427))))))

(assert (=> d!123615 (and (bvsle #b00000000000000000000000000000000 (size!31801 (_keys!11378 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31801 (_keys!11378 thiss!1427)) (size!31801 (_keys!11378 thiss!1427))))))

(assert (=> d!123615 (= (arrayCountValidKeys!0 (_keys!11378 thiss!1427) #b00000000000000000000000000000000 (size!31801 (_keys!11378 thiss!1427))) lt!455889)))

(declare-fun b!1032912 () Bool)

(assert (=> b!1032912 (= e!583734 (bvadd #b00000000000000000000000000000001 call!43612))))

(assert (= (and d!123615 c!104321) b!1032911))

(assert (= (and d!123615 (not c!104321)) b!1032909))

(assert (= (and b!1032909 c!104322) b!1032912))

(assert (= (and b!1032909 (not c!104322)) b!1032910))

(assert (= (or b!1032912 b!1032910) bm!43609))

(assert (=> b!1032909 m!952385))

(assert (=> b!1032909 m!952385))

(assert (=> b!1032909 m!952395))

(declare-fun m!952401 () Bool)

(assert (=> bm!43609 m!952401))

(assert (=> b!1032863 d!123615))

(declare-fun b!1032923 () Bool)

(declare-fun res!690272 () Bool)

(declare-fun e!583738 () Bool)

(assert (=> b!1032923 (=> (not res!690272) (not e!583738))))

(declare-fun size!31807 (LongMapFixedSize!5662) (_ BitVec 32))

(assert (=> b!1032923 (= res!690272 (= (size!31807 thiss!1427) (bvadd (_size!2886 thiss!1427) (bvsdiv (bvadd (extraKeys!5937 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1032922 () Bool)

(declare-fun res!690271 () Bool)

(assert (=> b!1032922 (=> (not res!690271) (not e!583738))))

(assert (=> b!1032922 (= res!690271 (bvsge (size!31807 thiss!1427) (_size!2886 thiss!1427)))))

(declare-fun b!1032921 () Bool)

(declare-fun res!690274 () Bool)

(assert (=> b!1032921 (=> (not res!690274) (not e!583738))))

(assert (=> b!1032921 (= res!690274 (and (= (size!31802 (_values!6228 thiss!1427)) (bvadd (mask!30037 thiss!1427) #b00000000000000000000000000000001)) (= (size!31801 (_keys!11378 thiss!1427)) (size!31802 (_values!6228 thiss!1427))) (bvsge (_size!2886 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2886 thiss!1427) (bvadd (mask!30037 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun d!123617 () Bool)

(declare-fun res!690273 () Bool)

(assert (=> d!123617 (=> (not res!690273) (not e!583738))))

(assert (=> d!123617 (= res!690273 (validMask!0 (mask!30037 thiss!1427)))))

(assert (=> d!123617 (= (simpleValid!402 thiss!1427) e!583738)))

(declare-fun b!1032924 () Bool)

(assert (=> b!1032924 (= e!583738 (and (bvsge (extraKeys!5937 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5937 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2886 thiss!1427) #b00000000000000000000000000000000)))))

(assert (= (and d!123617 res!690273) b!1032921))

(assert (= (and b!1032921 res!690274) b!1032922))

(assert (= (and b!1032922 res!690271) b!1032923))

(assert (= (and b!1032923 res!690272) b!1032924))

(declare-fun m!952403 () Bool)

(assert (=> b!1032923 m!952403))

(assert (=> b!1032922 m!952403))

(assert (=> d!123617 m!952347))

(assert (=> d!123609 d!123617))

(declare-fun b!1032926 () Bool)

(declare-fun e!583739 () Bool)

(assert (=> b!1032926 (= e!583739 tp_is_empty!24475)))

(declare-fun b!1032925 () Bool)

(declare-fun e!583740 () Bool)

(assert (=> b!1032925 (= e!583740 tp_is_empty!24475)))

(declare-fun mapIsEmpty!38195 () Bool)

(declare-fun mapRes!38195 () Bool)

(assert (=> mapIsEmpty!38195 mapRes!38195))

(declare-fun condMapEmpty!38195 () Bool)

(declare-fun mapDefault!38195 () ValueCell!11534)

(assert (=> mapNonEmpty!38194 (= condMapEmpty!38195 (= mapRest!38194 ((as const (Array (_ BitVec 32) ValueCell!11534)) mapDefault!38195)))))

(assert (=> mapNonEmpty!38194 (= tp!73370 (and e!583739 mapRes!38195))))

(declare-fun mapNonEmpty!38195 () Bool)

(declare-fun tp!73371 () Bool)

(assert (=> mapNonEmpty!38195 (= mapRes!38195 (and tp!73371 e!583740))))

(declare-fun mapKey!38195 () (_ BitVec 32))

(declare-fun mapRest!38195 () (Array (_ BitVec 32) ValueCell!11534))

(declare-fun mapValue!38195 () ValueCell!11534)

(assert (=> mapNonEmpty!38195 (= mapRest!38194 (store mapRest!38195 mapKey!38195 mapValue!38195))))

(assert (= (and mapNonEmpty!38194 condMapEmpty!38195) mapIsEmpty!38195))

(assert (= (and mapNonEmpty!38194 (not condMapEmpty!38195)) mapNonEmpty!38195))

(assert (= (and mapNonEmpty!38195 ((_ is ValueCellFull!11534) mapValue!38195)) b!1032925))

(assert (= (and mapNonEmpty!38194 ((_ is ValueCellFull!11534) mapDefault!38195)) b!1032926))

(declare-fun m!952405 () Bool)

(assert (=> mapNonEmpty!38195 m!952405))

(check-sat (not bm!43609) (not b!1032923) tp_is_empty!24475 (not b!1032909) (not b!1032882) (not b!1032896) (not bm!43603) (not mapNonEmpty!38195) (not d!123617) (not b_next!20755) (not b!1032885) (not bm!43606) (not b!1032898) (not b!1032897) (not b!1032922) b_and!33197)
(check-sat b_and!33197 (not b_next!20755))

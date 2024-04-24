; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90670 () Bool)

(assert start!90670)

(declare-fun b!1036238 () Bool)

(declare-fun b_free!20815 () Bool)

(declare-fun b_next!20815 () Bool)

(assert (=> b!1036238 (= b_free!20815 (not b_next!20815))))

(declare-fun tp!73558 () Bool)

(declare-fun b_and!33325 () Bool)

(assert (=> b!1036238 (= tp!73558 b_and!33325)))

(declare-fun b!1036236 () Bool)

(declare-fun e!585936 () Bool)

(declare-fun e!585939 () Bool)

(declare-fun mapRes!38298 () Bool)

(assert (=> b!1036236 (= e!585936 (and e!585939 mapRes!38298))))

(declare-fun condMapEmpty!38298 () Bool)

(declare-datatypes ((V!37587 0))(
  ( (V!37588 (val!12318 Int)) )
))
(declare-datatypes ((ValueCell!11564 0))(
  ( (ValueCellFull!11564 (v!14894 V!37587)) (EmptyCell!11564) )
))
(declare-datatypes ((array!65205 0))(
  ( (array!65206 (arr!31387 (Array (_ BitVec 32) (_ BitVec 64))) (size!31913 (_ BitVec 32))) )
))
(declare-datatypes ((array!65207 0))(
  ( (array!65208 (arr!31388 (Array (_ BitVec 32) ValueCell!11564)) (size!31914 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5722 0))(
  ( (LongMapFixedSize!5723 (defaultEntry!6239 Int) (mask!30169 (_ BitVec 32)) (extraKeys!5969 (_ BitVec 32)) (zeroValue!6073 V!37587) (minValue!6075 V!37587) (_size!2916 (_ BitVec 32)) (_keys!11461 array!65205) (_values!6262 array!65207) (_vacant!2916 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5722)

(declare-fun mapDefault!38298 () ValueCell!11564)

(assert (=> b!1036236 (= condMapEmpty!38298 (= (arr!31388 (_values!6262 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11564)) mapDefault!38298)))))

(declare-fun b!1036237 () Bool)

(declare-fun res!691627 () Bool)

(declare-fun e!585937 () Bool)

(assert (=> b!1036237 (=> (not res!691627) (not e!585937))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1036237 (= res!691627 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!585935 () Bool)

(declare-fun tp_is_empty!24535 () Bool)

(declare-fun array_inv!24295 (array!65205) Bool)

(declare-fun array_inv!24296 (array!65207) Bool)

(assert (=> b!1036238 (= e!585935 (and tp!73558 tp_is_empty!24535 (array_inv!24295 (_keys!11461 thiss!1427)) (array_inv!24296 (_values!6262 thiss!1427)) e!585936))))

(declare-fun mapNonEmpty!38298 () Bool)

(declare-fun tp!73557 () Bool)

(declare-fun e!585938 () Bool)

(assert (=> mapNonEmpty!38298 (= mapRes!38298 (and tp!73557 e!585938))))

(declare-fun mapValue!38298 () ValueCell!11564)

(declare-fun mapRest!38298 () (Array (_ BitVec 32) ValueCell!11564))

(declare-fun mapKey!38298 () (_ BitVec 32))

(assert (=> mapNonEmpty!38298 (= (arr!31388 (_values!6262 thiss!1427)) (store mapRest!38298 mapKey!38298 mapValue!38298))))

(declare-fun b!1036239 () Bool)

(assert (=> b!1036239 (= e!585937 (and (= (size!31914 (_values!6262 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30169 thiss!1427))) (not (= (size!31913 (_keys!11461 thiss!1427)) (size!31914 (_values!6262 thiss!1427))))))))

(declare-fun b!1036240 () Bool)

(assert (=> b!1036240 (= e!585939 tp_is_empty!24535)))

(declare-fun res!691628 () Bool)

(assert (=> start!90670 (=> (not res!691628) (not e!585937))))

(declare-fun valid!2169 (LongMapFixedSize!5722) Bool)

(assert (=> start!90670 (= res!691628 (valid!2169 thiss!1427))))

(assert (=> start!90670 e!585937))

(assert (=> start!90670 e!585935))

(assert (=> start!90670 true))

(declare-fun mapIsEmpty!38298 () Bool)

(assert (=> mapIsEmpty!38298 mapRes!38298))

(declare-fun b!1036241 () Bool)

(declare-fun res!691626 () Bool)

(assert (=> b!1036241 (=> (not res!691626) (not e!585937))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1036241 (= res!691626 (validMask!0 (mask!30169 thiss!1427)))))

(declare-fun b!1036242 () Bool)

(assert (=> b!1036242 (= e!585938 tp_is_empty!24535)))

(assert (= (and start!90670 res!691628) b!1036237))

(assert (= (and b!1036237 res!691627) b!1036241))

(assert (= (and b!1036241 res!691626) b!1036239))

(assert (= (and b!1036236 condMapEmpty!38298) mapIsEmpty!38298))

(assert (= (and b!1036236 (not condMapEmpty!38298)) mapNonEmpty!38298))

(get-info :version)

(assert (= (and mapNonEmpty!38298 ((_ is ValueCellFull!11564) mapValue!38298)) b!1036242))

(assert (= (and b!1036236 ((_ is ValueCellFull!11564) mapDefault!38298)) b!1036240))

(assert (= b!1036238 b!1036236))

(assert (= start!90670 b!1036238))

(declare-fun m!956801 () Bool)

(assert (=> b!1036238 m!956801))

(declare-fun m!956803 () Bool)

(assert (=> b!1036238 m!956803))

(declare-fun m!956805 () Bool)

(assert (=> mapNonEmpty!38298 m!956805))

(declare-fun m!956807 () Bool)

(assert (=> start!90670 m!956807))

(declare-fun m!956809 () Bool)

(assert (=> b!1036241 m!956809))

(check-sat (not b!1036241) (not b!1036238) (not b_next!20815) tp_is_empty!24535 b_and!33325 (not start!90670) (not mapNonEmpty!38298))
(check-sat b_and!33325 (not b_next!20815))
(get-model)

(declare-fun d!124923 () Bool)

(declare-fun res!691653 () Bool)

(declare-fun e!585979 () Bool)

(assert (=> d!124923 (=> (not res!691653) (not e!585979))))

(declare-fun simpleValid!408 (LongMapFixedSize!5722) Bool)

(assert (=> d!124923 (= res!691653 (simpleValid!408 thiss!1427))))

(assert (=> d!124923 (= (valid!2169 thiss!1427) e!585979)))

(declare-fun b!1036291 () Bool)

(declare-fun res!691654 () Bool)

(assert (=> b!1036291 (=> (not res!691654) (not e!585979))))

(declare-fun arrayCountValidKeys!0 (array!65205 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1036291 (= res!691654 (= (arrayCountValidKeys!0 (_keys!11461 thiss!1427) #b00000000000000000000000000000000 (size!31913 (_keys!11461 thiss!1427))) (_size!2916 thiss!1427)))))

(declare-fun b!1036292 () Bool)

(declare-fun res!691655 () Bool)

(assert (=> b!1036292 (=> (not res!691655) (not e!585979))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65205 (_ BitVec 32)) Bool)

(assert (=> b!1036292 (= res!691655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11461 thiss!1427) (mask!30169 thiss!1427)))))

(declare-fun b!1036293 () Bool)

(declare-datatypes ((List!21896 0))(
  ( (Nil!21893) (Cons!21892 (h!23103 (_ BitVec 64)) (t!31091 List!21896)) )
))
(declare-fun arrayNoDuplicates!0 (array!65205 (_ BitVec 32) List!21896) Bool)

(assert (=> b!1036293 (= e!585979 (arrayNoDuplicates!0 (_keys!11461 thiss!1427) #b00000000000000000000000000000000 Nil!21893))))

(assert (= (and d!124923 res!691653) b!1036291))

(assert (= (and b!1036291 res!691654) b!1036292))

(assert (= (and b!1036292 res!691655) b!1036293))

(declare-fun m!956831 () Bool)

(assert (=> d!124923 m!956831))

(declare-fun m!956833 () Bool)

(assert (=> b!1036291 m!956833))

(declare-fun m!956835 () Bool)

(assert (=> b!1036292 m!956835))

(declare-fun m!956837 () Bool)

(assert (=> b!1036293 m!956837))

(assert (=> start!90670 d!124923))

(declare-fun d!124925 () Bool)

(assert (=> d!124925 (= (array_inv!24295 (_keys!11461 thiss!1427)) (bvsge (size!31913 (_keys!11461 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1036238 d!124925))

(declare-fun d!124927 () Bool)

(assert (=> d!124927 (= (array_inv!24296 (_values!6262 thiss!1427)) (bvsge (size!31914 (_values!6262 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1036238 d!124927))

(declare-fun d!124929 () Bool)

(assert (=> d!124929 (= (validMask!0 (mask!30169 thiss!1427)) (and (or (= (mask!30169 thiss!1427) #b00000000000000000000000000000111) (= (mask!30169 thiss!1427) #b00000000000000000000000000001111) (= (mask!30169 thiss!1427) #b00000000000000000000000000011111) (= (mask!30169 thiss!1427) #b00000000000000000000000000111111) (= (mask!30169 thiss!1427) #b00000000000000000000000001111111) (= (mask!30169 thiss!1427) #b00000000000000000000000011111111) (= (mask!30169 thiss!1427) #b00000000000000000000000111111111) (= (mask!30169 thiss!1427) #b00000000000000000000001111111111) (= (mask!30169 thiss!1427) #b00000000000000000000011111111111) (= (mask!30169 thiss!1427) #b00000000000000000000111111111111) (= (mask!30169 thiss!1427) #b00000000000000000001111111111111) (= (mask!30169 thiss!1427) #b00000000000000000011111111111111) (= (mask!30169 thiss!1427) #b00000000000000000111111111111111) (= (mask!30169 thiss!1427) #b00000000000000001111111111111111) (= (mask!30169 thiss!1427) #b00000000000000011111111111111111) (= (mask!30169 thiss!1427) #b00000000000000111111111111111111) (= (mask!30169 thiss!1427) #b00000000000001111111111111111111) (= (mask!30169 thiss!1427) #b00000000000011111111111111111111) (= (mask!30169 thiss!1427) #b00000000000111111111111111111111) (= (mask!30169 thiss!1427) #b00000000001111111111111111111111) (= (mask!30169 thiss!1427) #b00000000011111111111111111111111) (= (mask!30169 thiss!1427) #b00000000111111111111111111111111) (= (mask!30169 thiss!1427) #b00000001111111111111111111111111) (= (mask!30169 thiss!1427) #b00000011111111111111111111111111) (= (mask!30169 thiss!1427) #b00000111111111111111111111111111) (= (mask!30169 thiss!1427) #b00001111111111111111111111111111) (= (mask!30169 thiss!1427) #b00011111111111111111111111111111) (= (mask!30169 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30169 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1036241 d!124929))

(declare-fun condMapEmpty!38307 () Bool)

(declare-fun mapDefault!38307 () ValueCell!11564)

(assert (=> mapNonEmpty!38298 (= condMapEmpty!38307 (= mapRest!38298 ((as const (Array (_ BitVec 32) ValueCell!11564)) mapDefault!38307)))))

(declare-fun e!585985 () Bool)

(declare-fun mapRes!38307 () Bool)

(assert (=> mapNonEmpty!38298 (= tp!73557 (and e!585985 mapRes!38307))))

(declare-fun b!1036300 () Bool)

(declare-fun e!585984 () Bool)

(assert (=> b!1036300 (= e!585984 tp_is_empty!24535)))

(declare-fun mapNonEmpty!38307 () Bool)

(declare-fun tp!73573 () Bool)

(assert (=> mapNonEmpty!38307 (= mapRes!38307 (and tp!73573 e!585984))))

(declare-fun mapKey!38307 () (_ BitVec 32))

(declare-fun mapRest!38307 () (Array (_ BitVec 32) ValueCell!11564))

(declare-fun mapValue!38307 () ValueCell!11564)

(assert (=> mapNonEmpty!38307 (= mapRest!38298 (store mapRest!38307 mapKey!38307 mapValue!38307))))

(declare-fun mapIsEmpty!38307 () Bool)

(assert (=> mapIsEmpty!38307 mapRes!38307))

(declare-fun b!1036301 () Bool)

(assert (=> b!1036301 (= e!585985 tp_is_empty!24535)))

(assert (= (and mapNonEmpty!38298 condMapEmpty!38307) mapIsEmpty!38307))

(assert (= (and mapNonEmpty!38298 (not condMapEmpty!38307)) mapNonEmpty!38307))

(assert (= (and mapNonEmpty!38307 ((_ is ValueCellFull!11564) mapValue!38307)) b!1036300))

(assert (= (and mapNonEmpty!38298 ((_ is ValueCellFull!11564) mapDefault!38307)) b!1036301))

(declare-fun m!956839 () Bool)

(assert (=> mapNonEmpty!38307 m!956839))

(check-sat (not b_next!20815) (not d!124923) (not b!1036293) tp_is_empty!24535 (not b!1036292) (not mapNonEmpty!38307) b_and!33325 (not b!1036291))
(check-sat b_and!33325 (not b_next!20815))
(get-model)

(declare-fun b!1036312 () Bool)

(declare-fun e!585995 () Bool)

(declare-fun e!585996 () Bool)

(assert (=> b!1036312 (= e!585995 e!585996)))

(declare-fun c!105113 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1036312 (= c!105113 (validKeyInArray!0 (select (arr!31387 (_keys!11461 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1036314 () Bool)

(declare-fun call!43834 () Bool)

(assert (=> b!1036314 (= e!585996 call!43834)))

(declare-fun bm!43831 () Bool)

(assert (=> bm!43831 (= call!43834 (arrayNoDuplicates!0 (_keys!11461 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!105113 (Cons!21892 (select (arr!31387 (_keys!11461 thiss!1427)) #b00000000000000000000000000000000) Nil!21893) Nil!21893)))))

(declare-fun b!1036315 () Bool)

(declare-fun e!585994 () Bool)

(assert (=> b!1036315 (= e!585994 e!585995)))

(declare-fun res!691663 () Bool)

(assert (=> b!1036315 (=> (not res!691663) (not e!585995))))

(declare-fun e!585997 () Bool)

(assert (=> b!1036315 (= res!691663 (not e!585997))))

(declare-fun res!691662 () Bool)

(assert (=> b!1036315 (=> (not res!691662) (not e!585997))))

(assert (=> b!1036315 (= res!691662 (validKeyInArray!0 (select (arr!31387 (_keys!11461 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1036316 () Bool)

(assert (=> b!1036316 (= e!585996 call!43834)))

(declare-fun d!124931 () Bool)

(declare-fun res!691664 () Bool)

(assert (=> d!124931 (=> res!691664 e!585994)))

(assert (=> d!124931 (= res!691664 (bvsge #b00000000000000000000000000000000 (size!31913 (_keys!11461 thiss!1427))))))

(assert (=> d!124931 (= (arrayNoDuplicates!0 (_keys!11461 thiss!1427) #b00000000000000000000000000000000 Nil!21893) e!585994)))

(declare-fun b!1036313 () Bool)

(declare-fun contains!6042 (List!21896 (_ BitVec 64)) Bool)

(assert (=> b!1036313 (= e!585997 (contains!6042 Nil!21893 (select (arr!31387 (_keys!11461 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!124931 (not res!691664)) b!1036315))

(assert (= (and b!1036315 res!691662) b!1036313))

(assert (= (and b!1036315 res!691663) b!1036312))

(assert (= (and b!1036312 c!105113) b!1036314))

(assert (= (and b!1036312 (not c!105113)) b!1036316))

(assert (= (or b!1036314 b!1036316) bm!43831))

(declare-fun m!956841 () Bool)

(assert (=> b!1036312 m!956841))

(assert (=> b!1036312 m!956841))

(declare-fun m!956843 () Bool)

(assert (=> b!1036312 m!956843))

(assert (=> bm!43831 m!956841))

(declare-fun m!956845 () Bool)

(assert (=> bm!43831 m!956845))

(assert (=> b!1036315 m!956841))

(assert (=> b!1036315 m!956841))

(assert (=> b!1036315 m!956843))

(assert (=> b!1036313 m!956841))

(assert (=> b!1036313 m!956841))

(declare-fun m!956847 () Bool)

(assert (=> b!1036313 m!956847))

(assert (=> b!1036293 d!124931))

(declare-fun b!1036325 () Bool)

(declare-fun e!586004 () Bool)

(declare-fun e!586006 () Bool)

(assert (=> b!1036325 (= e!586004 e!586006)))

(declare-fun lt!457242 () (_ BitVec 64))

(assert (=> b!1036325 (= lt!457242 (select (arr!31387 (_keys!11461 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33888 0))(
  ( (Unit!33889) )
))
(declare-fun lt!457244 () Unit!33888)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65205 (_ BitVec 64) (_ BitVec 32)) Unit!33888)

(assert (=> b!1036325 (= lt!457244 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11461 thiss!1427) lt!457242 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65205 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1036325 (arrayContainsKey!0 (_keys!11461 thiss!1427) lt!457242 #b00000000000000000000000000000000)))

(declare-fun lt!457243 () Unit!33888)

(assert (=> b!1036325 (= lt!457243 lt!457244)))

(declare-fun res!691669 () Bool)

(declare-datatypes ((SeekEntryResult!9698 0))(
  ( (MissingZero!9698 (index!41163 (_ BitVec 32))) (Found!9698 (index!41164 (_ BitVec 32))) (Intermediate!9698 (undefined!10510 Bool) (index!41165 (_ BitVec 32)) (x!92281 (_ BitVec 32))) (Undefined!9698) (MissingVacant!9698 (index!41166 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65205 (_ BitVec 32)) SeekEntryResult!9698)

(assert (=> b!1036325 (= res!691669 (= (seekEntryOrOpen!0 (select (arr!31387 (_keys!11461 thiss!1427)) #b00000000000000000000000000000000) (_keys!11461 thiss!1427) (mask!30169 thiss!1427)) (Found!9698 #b00000000000000000000000000000000)))))

(assert (=> b!1036325 (=> (not res!691669) (not e!586006))))

(declare-fun d!124933 () Bool)

(declare-fun res!691670 () Bool)

(declare-fun e!586005 () Bool)

(assert (=> d!124933 (=> res!691670 e!586005)))

(assert (=> d!124933 (= res!691670 (bvsge #b00000000000000000000000000000000 (size!31913 (_keys!11461 thiss!1427))))))

(assert (=> d!124933 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11461 thiss!1427) (mask!30169 thiss!1427)) e!586005)))

(declare-fun b!1036326 () Bool)

(declare-fun call!43837 () Bool)

(assert (=> b!1036326 (= e!586006 call!43837)))

(declare-fun b!1036327 () Bool)

(assert (=> b!1036327 (= e!586004 call!43837)))

(declare-fun b!1036328 () Bool)

(assert (=> b!1036328 (= e!586005 e!586004)))

(declare-fun c!105116 () Bool)

(assert (=> b!1036328 (= c!105116 (validKeyInArray!0 (select (arr!31387 (_keys!11461 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43834 () Bool)

(assert (=> bm!43834 (= call!43837 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11461 thiss!1427) (mask!30169 thiss!1427)))))

(assert (= (and d!124933 (not res!691670)) b!1036328))

(assert (= (and b!1036328 c!105116) b!1036325))

(assert (= (and b!1036328 (not c!105116)) b!1036327))

(assert (= (and b!1036325 res!691669) b!1036326))

(assert (= (or b!1036326 b!1036327) bm!43834))

(assert (=> b!1036325 m!956841))

(declare-fun m!956849 () Bool)

(assert (=> b!1036325 m!956849))

(declare-fun m!956851 () Bool)

(assert (=> b!1036325 m!956851))

(assert (=> b!1036325 m!956841))

(declare-fun m!956853 () Bool)

(assert (=> b!1036325 m!956853))

(assert (=> b!1036328 m!956841))

(assert (=> b!1036328 m!956841))

(assert (=> b!1036328 m!956843))

(declare-fun m!956855 () Bool)

(assert (=> bm!43834 m!956855))

(assert (=> b!1036292 d!124933))

(declare-fun b!1036337 () Bool)

(declare-fun e!586012 () (_ BitVec 32))

(declare-fun call!43840 () (_ BitVec 32))

(assert (=> b!1036337 (= e!586012 call!43840)))

(declare-fun b!1036338 () Bool)

(declare-fun e!586011 () (_ BitVec 32))

(assert (=> b!1036338 (= e!586011 #b00000000000000000000000000000000)))

(declare-fun d!124935 () Bool)

(declare-fun lt!457247 () (_ BitVec 32))

(assert (=> d!124935 (and (bvsge lt!457247 #b00000000000000000000000000000000) (bvsle lt!457247 (bvsub (size!31913 (_keys!11461 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!124935 (= lt!457247 e!586011)))

(declare-fun c!105121 () Bool)

(assert (=> d!124935 (= c!105121 (bvsge #b00000000000000000000000000000000 (size!31913 (_keys!11461 thiss!1427))))))

(assert (=> d!124935 (and (bvsle #b00000000000000000000000000000000 (size!31913 (_keys!11461 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31913 (_keys!11461 thiss!1427)) (size!31913 (_keys!11461 thiss!1427))))))

(assert (=> d!124935 (= (arrayCountValidKeys!0 (_keys!11461 thiss!1427) #b00000000000000000000000000000000 (size!31913 (_keys!11461 thiss!1427))) lt!457247)))

(declare-fun bm!43837 () Bool)

(assert (=> bm!43837 (= call!43840 (arrayCountValidKeys!0 (_keys!11461 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31913 (_keys!11461 thiss!1427))))))

(declare-fun b!1036339 () Bool)

(assert (=> b!1036339 (= e!586011 e!586012)))

(declare-fun c!105122 () Bool)

(assert (=> b!1036339 (= c!105122 (validKeyInArray!0 (select (arr!31387 (_keys!11461 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1036340 () Bool)

(assert (=> b!1036340 (= e!586012 (bvadd #b00000000000000000000000000000001 call!43840))))

(assert (= (and d!124935 c!105121) b!1036338))

(assert (= (and d!124935 (not c!105121)) b!1036339))

(assert (= (and b!1036339 c!105122) b!1036340))

(assert (= (and b!1036339 (not c!105122)) b!1036337))

(assert (= (or b!1036340 b!1036337) bm!43837))

(declare-fun m!956857 () Bool)

(assert (=> bm!43837 m!956857))

(assert (=> b!1036339 m!956841))

(assert (=> b!1036339 m!956841))

(assert (=> b!1036339 m!956843))

(assert (=> b!1036291 d!124935))

(declare-fun b!1036349 () Bool)

(declare-fun res!691682 () Bool)

(declare-fun e!586015 () Bool)

(assert (=> b!1036349 (=> (not res!691682) (not e!586015))))

(assert (=> b!1036349 (= res!691682 (and (= (size!31914 (_values!6262 thiss!1427)) (bvadd (mask!30169 thiss!1427) #b00000000000000000000000000000001)) (= (size!31913 (_keys!11461 thiss!1427)) (size!31914 (_values!6262 thiss!1427))) (bvsge (_size!2916 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2916 thiss!1427) (bvadd (mask!30169 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun b!1036351 () Bool)

(declare-fun res!691680 () Bool)

(assert (=> b!1036351 (=> (not res!691680) (not e!586015))))

(declare-fun size!31919 (LongMapFixedSize!5722) (_ BitVec 32))

(assert (=> b!1036351 (= res!691680 (= (size!31919 thiss!1427) (bvadd (_size!2916 thiss!1427) (bvsdiv (bvadd (extraKeys!5969 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1036350 () Bool)

(declare-fun res!691679 () Bool)

(assert (=> b!1036350 (=> (not res!691679) (not e!586015))))

(assert (=> b!1036350 (= res!691679 (bvsge (size!31919 thiss!1427) (_size!2916 thiss!1427)))))

(declare-fun d!124937 () Bool)

(declare-fun res!691681 () Bool)

(assert (=> d!124937 (=> (not res!691681) (not e!586015))))

(assert (=> d!124937 (= res!691681 (validMask!0 (mask!30169 thiss!1427)))))

(assert (=> d!124937 (= (simpleValid!408 thiss!1427) e!586015)))

(declare-fun b!1036352 () Bool)

(assert (=> b!1036352 (= e!586015 (and (bvsge (extraKeys!5969 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5969 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2916 thiss!1427) #b00000000000000000000000000000000)))))

(assert (= (and d!124937 res!691681) b!1036349))

(assert (= (and b!1036349 res!691682) b!1036350))

(assert (= (and b!1036350 res!691679) b!1036351))

(assert (= (and b!1036351 res!691680) b!1036352))

(declare-fun m!956859 () Bool)

(assert (=> b!1036351 m!956859))

(assert (=> b!1036350 m!956859))

(assert (=> d!124937 m!956809))

(assert (=> d!124923 d!124937))

(declare-fun condMapEmpty!38308 () Bool)

(declare-fun mapDefault!38308 () ValueCell!11564)

(assert (=> mapNonEmpty!38307 (= condMapEmpty!38308 (= mapRest!38307 ((as const (Array (_ BitVec 32) ValueCell!11564)) mapDefault!38308)))))

(declare-fun e!586017 () Bool)

(declare-fun mapRes!38308 () Bool)

(assert (=> mapNonEmpty!38307 (= tp!73573 (and e!586017 mapRes!38308))))

(declare-fun b!1036353 () Bool)

(declare-fun e!586016 () Bool)

(assert (=> b!1036353 (= e!586016 tp_is_empty!24535)))

(declare-fun mapNonEmpty!38308 () Bool)

(declare-fun tp!73574 () Bool)

(assert (=> mapNonEmpty!38308 (= mapRes!38308 (and tp!73574 e!586016))))

(declare-fun mapRest!38308 () (Array (_ BitVec 32) ValueCell!11564))

(declare-fun mapValue!38308 () ValueCell!11564)

(declare-fun mapKey!38308 () (_ BitVec 32))

(assert (=> mapNonEmpty!38308 (= mapRest!38307 (store mapRest!38308 mapKey!38308 mapValue!38308))))

(declare-fun mapIsEmpty!38308 () Bool)

(assert (=> mapIsEmpty!38308 mapRes!38308))

(declare-fun b!1036354 () Bool)

(assert (=> b!1036354 (= e!586017 tp_is_empty!24535)))

(assert (= (and mapNonEmpty!38307 condMapEmpty!38308) mapIsEmpty!38308))

(assert (= (and mapNonEmpty!38307 (not condMapEmpty!38308)) mapNonEmpty!38308))

(assert (= (and mapNonEmpty!38308 ((_ is ValueCellFull!11564) mapValue!38308)) b!1036353))

(assert (= (and mapNonEmpty!38307 ((_ is ValueCellFull!11564) mapDefault!38308)) b!1036354))

(declare-fun m!956861 () Bool)

(assert (=> mapNonEmpty!38308 m!956861))

(check-sat (not b!1036315) (not mapNonEmpty!38308) (not b_next!20815) (not b!1036325) (not b!1036351) (not b!1036312) (not b!1036339) tp_is_empty!24535 (not b!1036350) (not b!1036313) (not bm!43831) (not b!1036328) (not bm!43837) (not d!124937) b_and!33325 (not bm!43834))
(check-sat b_and!33325 (not b_next!20815))

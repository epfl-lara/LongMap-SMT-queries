; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90222 () Bool)

(assert start!90222)

(declare-fun b!1032980 () Bool)

(declare-fun b_free!20757 () Bool)

(declare-fun b_next!20757 () Bool)

(assert (=> b!1032980 (= b_free!20757 (not b_next!20757))))

(declare-fun tp!73360 () Bool)

(declare-fun b_and!33225 () Bool)

(assert (=> b!1032980 (= tp!73360 b_and!33225)))

(declare-fun e!583769 () Bool)

(declare-fun e!583771 () Bool)

(declare-fun tp_is_empty!24477 () Bool)

(declare-datatypes ((V!37509 0))(
  ( (V!37510 (val!12289 Int)) )
))
(declare-datatypes ((ValueCell!11535 0))(
  ( (ValueCellFull!11535 (v!14866 V!37509)) (EmptyCell!11535) )
))
(declare-datatypes ((array!65028 0))(
  ( (array!65029 (arr!31311 (Array (_ BitVec 32) (_ BitVec 64))) (size!31832 (_ BitVec 32))) )
))
(declare-datatypes ((array!65030 0))(
  ( (array!65031 (arr!31312 (Array (_ BitVec 32) ValueCell!11535)) (size!31833 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5664 0))(
  ( (LongMapFixedSize!5665 (defaultEntry!6206 Int) (mask!30043 (_ BitVec 32)) (extraKeys!5938 (_ BitVec 32)) (zeroValue!6042 V!37509) (minValue!6042 V!37509) (_size!2887 (_ BitVec 32)) (_keys!11383 array!65028) (_values!6229 array!65030) (_vacant!2887 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5664)

(declare-fun array_inv!24231 (array!65028) Bool)

(declare-fun array_inv!24232 (array!65030) Bool)

(assert (=> b!1032980 (= e!583771 (and tp!73360 tp_is_empty!24477 (array_inv!24231 (_keys!11383 thiss!1427)) (array_inv!24232 (_values!6229 thiss!1427)) e!583769))))

(declare-fun b!1032981 () Bool)

(declare-fun e!583770 () Bool)

(assert (=> b!1032981 (= e!583770 tp_is_empty!24477)))

(declare-fun b!1032982 () Bool)

(declare-fun e!583768 () Bool)

(assert (=> b!1032982 (= e!583768 tp_is_empty!24477)))

(declare-fun res!690294 () Bool)

(declare-fun e!583767 () Bool)

(assert (=> start!90222 (=> (not res!690294) (not e!583767))))

(declare-fun valid!2142 (LongMapFixedSize!5664) Bool)

(assert (=> start!90222 (= res!690294 (valid!2142 thiss!1427))))

(assert (=> start!90222 e!583767))

(assert (=> start!90222 e!583771))

(assert (=> start!90222 true))

(declare-fun b!1032983 () Bool)

(declare-fun res!690295 () Bool)

(assert (=> b!1032983 (=> (not res!690295) (not e!583767))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1032983 (= res!690295 (validMask!0 (mask!30043 thiss!1427)))))

(declare-fun b!1032984 () Bool)

(declare-fun res!690296 () Bool)

(assert (=> b!1032984 (=> (not res!690296) (not e!583767))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1032984 (= res!690296 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!38188 () Bool)

(declare-fun mapRes!38188 () Bool)

(declare-fun tp!73361 () Bool)

(assert (=> mapNonEmpty!38188 (= mapRes!38188 (and tp!73361 e!583768))))

(declare-fun mapValue!38188 () ValueCell!11535)

(declare-fun mapKey!38188 () (_ BitVec 32))

(declare-fun mapRest!38188 () (Array (_ BitVec 32) ValueCell!11535))

(assert (=> mapNonEmpty!38188 (= (arr!31312 (_values!6229 thiss!1427)) (store mapRest!38188 mapKey!38188 mapValue!38188))))

(declare-fun b!1032985 () Bool)

(assert (=> b!1032985 (= e!583769 (and e!583770 mapRes!38188))))

(declare-fun condMapEmpty!38188 () Bool)

(declare-fun mapDefault!38188 () ValueCell!11535)

(assert (=> b!1032985 (= condMapEmpty!38188 (= (arr!31312 (_values!6229 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11535)) mapDefault!38188)))))

(declare-fun b!1032986 () Bool)

(assert (=> b!1032986 (= e!583767 (and (= (size!31833 (_values!6229 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30043 thiss!1427))) (= (size!31832 (_keys!11383 thiss!1427)) (size!31833 (_values!6229 thiss!1427))) (bvsge (mask!30043 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5938 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5938 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!38188 () Bool)

(assert (=> mapIsEmpty!38188 mapRes!38188))

(assert (= (and start!90222 res!690294) b!1032984))

(assert (= (and b!1032984 res!690296) b!1032983))

(assert (= (and b!1032983 res!690295) b!1032986))

(assert (= (and b!1032985 condMapEmpty!38188) mapIsEmpty!38188))

(assert (= (and b!1032985 (not condMapEmpty!38188)) mapNonEmpty!38188))

(get-info :version)

(assert (= (and mapNonEmpty!38188 ((_ is ValueCellFull!11535) mapValue!38188)) b!1032982))

(assert (= (and b!1032985 ((_ is ValueCellFull!11535) mapDefault!38188)) b!1032981))

(assert (= b!1032980 b!1032985))

(assert (= start!90222 b!1032980))

(declare-fun m!952975 () Bool)

(assert (=> b!1032980 m!952975))

(declare-fun m!952977 () Bool)

(assert (=> b!1032980 m!952977))

(declare-fun m!952979 () Bool)

(assert (=> start!90222 m!952979))

(declare-fun m!952981 () Bool)

(assert (=> b!1032983 m!952981))

(declare-fun m!952983 () Bool)

(assert (=> mapNonEmpty!38188 m!952983))

(check-sat (not b_next!20757) (not mapNonEmpty!38188) (not b!1032980) (not b!1032983) tp_is_empty!24477 b_and!33225 (not start!90222))
(check-sat b_and!33225 (not b_next!20757))
(get-model)

(declare-fun d!123753 () Bool)

(assert (=> d!123753 (= (array_inv!24231 (_keys!11383 thiss!1427)) (bvsge (size!31832 (_keys!11383 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1032980 d!123753))

(declare-fun d!123755 () Bool)

(assert (=> d!123755 (= (array_inv!24232 (_values!6229 thiss!1427)) (bvsge (size!31833 (_values!6229 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1032980 d!123755))

(declare-fun d!123757 () Bool)

(declare-fun res!690312 () Bool)

(declare-fun e!583793 () Bool)

(assert (=> d!123757 (=> (not res!690312) (not e!583793))))

(declare-fun simpleValid!402 (LongMapFixedSize!5664) Bool)

(assert (=> d!123757 (= res!690312 (simpleValid!402 thiss!1427))))

(assert (=> d!123757 (= (valid!2142 thiss!1427) e!583793)))

(declare-fun b!1033014 () Bool)

(declare-fun res!690313 () Bool)

(assert (=> b!1033014 (=> (not res!690313) (not e!583793))))

(declare-fun arrayCountValidKeys!0 (array!65028 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1033014 (= res!690313 (= (arrayCountValidKeys!0 (_keys!11383 thiss!1427) #b00000000000000000000000000000000 (size!31832 (_keys!11383 thiss!1427))) (_size!2887 thiss!1427)))))

(declare-fun b!1033015 () Bool)

(declare-fun res!690314 () Bool)

(assert (=> b!1033015 (=> (not res!690314) (not e!583793))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65028 (_ BitVec 32)) Bool)

(assert (=> b!1033015 (= res!690314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11383 thiss!1427) (mask!30043 thiss!1427)))))

(declare-fun b!1033016 () Bool)

(declare-datatypes ((List!21900 0))(
  ( (Nil!21897) (Cons!21896 (h!23098 (_ BitVec 64)) (t!31094 List!21900)) )
))
(declare-fun arrayNoDuplicates!0 (array!65028 (_ BitVec 32) List!21900) Bool)

(assert (=> b!1033016 (= e!583793 (arrayNoDuplicates!0 (_keys!11383 thiss!1427) #b00000000000000000000000000000000 Nil!21897))))

(assert (= (and d!123757 res!690312) b!1033014))

(assert (= (and b!1033014 res!690313) b!1033015))

(assert (= (and b!1033015 res!690314) b!1033016))

(declare-fun m!952995 () Bool)

(assert (=> d!123757 m!952995))

(declare-fun m!952997 () Bool)

(assert (=> b!1033014 m!952997))

(declare-fun m!952999 () Bool)

(assert (=> b!1033015 m!952999))

(declare-fun m!953001 () Bool)

(assert (=> b!1033016 m!953001))

(assert (=> start!90222 d!123757))

(declare-fun d!123759 () Bool)

(assert (=> d!123759 (= (validMask!0 (mask!30043 thiss!1427)) (and (or (= (mask!30043 thiss!1427) #b00000000000000000000000000000111) (= (mask!30043 thiss!1427) #b00000000000000000000000000001111) (= (mask!30043 thiss!1427) #b00000000000000000000000000011111) (= (mask!30043 thiss!1427) #b00000000000000000000000000111111) (= (mask!30043 thiss!1427) #b00000000000000000000000001111111) (= (mask!30043 thiss!1427) #b00000000000000000000000011111111) (= (mask!30043 thiss!1427) #b00000000000000000000000111111111) (= (mask!30043 thiss!1427) #b00000000000000000000001111111111) (= (mask!30043 thiss!1427) #b00000000000000000000011111111111) (= (mask!30043 thiss!1427) #b00000000000000000000111111111111) (= (mask!30043 thiss!1427) #b00000000000000000001111111111111) (= (mask!30043 thiss!1427) #b00000000000000000011111111111111) (= (mask!30043 thiss!1427) #b00000000000000000111111111111111) (= (mask!30043 thiss!1427) #b00000000000000001111111111111111) (= (mask!30043 thiss!1427) #b00000000000000011111111111111111) (= (mask!30043 thiss!1427) #b00000000000000111111111111111111) (= (mask!30043 thiss!1427) #b00000000000001111111111111111111) (= (mask!30043 thiss!1427) #b00000000000011111111111111111111) (= (mask!30043 thiss!1427) #b00000000000111111111111111111111) (= (mask!30043 thiss!1427) #b00000000001111111111111111111111) (= (mask!30043 thiss!1427) #b00000000011111111111111111111111) (= (mask!30043 thiss!1427) #b00000000111111111111111111111111) (= (mask!30043 thiss!1427) #b00000001111111111111111111111111) (= (mask!30043 thiss!1427) #b00000011111111111111111111111111) (= (mask!30043 thiss!1427) #b00000111111111111111111111111111) (= (mask!30043 thiss!1427) #b00001111111111111111111111111111) (= (mask!30043 thiss!1427) #b00011111111111111111111111111111) (= (mask!30043 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30043 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1032983 d!123759))

(declare-fun mapNonEmpty!38194 () Bool)

(declare-fun mapRes!38194 () Bool)

(declare-fun tp!73370 () Bool)

(declare-fun e!583798 () Bool)

(assert (=> mapNonEmpty!38194 (= mapRes!38194 (and tp!73370 e!583798))))

(declare-fun mapKey!38194 () (_ BitVec 32))

(declare-fun mapValue!38194 () ValueCell!11535)

(declare-fun mapRest!38194 () (Array (_ BitVec 32) ValueCell!11535))

(assert (=> mapNonEmpty!38194 (= mapRest!38188 (store mapRest!38194 mapKey!38194 mapValue!38194))))

(declare-fun condMapEmpty!38194 () Bool)

(declare-fun mapDefault!38194 () ValueCell!11535)

(assert (=> mapNonEmpty!38188 (= condMapEmpty!38194 (= mapRest!38188 ((as const (Array (_ BitVec 32) ValueCell!11535)) mapDefault!38194)))))

(declare-fun e!583799 () Bool)

(assert (=> mapNonEmpty!38188 (= tp!73361 (and e!583799 mapRes!38194))))

(declare-fun b!1033023 () Bool)

(assert (=> b!1033023 (= e!583798 tp_is_empty!24477)))

(declare-fun mapIsEmpty!38194 () Bool)

(assert (=> mapIsEmpty!38194 mapRes!38194))

(declare-fun b!1033024 () Bool)

(assert (=> b!1033024 (= e!583799 tp_is_empty!24477)))

(assert (= (and mapNonEmpty!38188 condMapEmpty!38194) mapIsEmpty!38194))

(assert (= (and mapNonEmpty!38188 (not condMapEmpty!38194)) mapNonEmpty!38194))

(assert (= (and mapNonEmpty!38194 ((_ is ValueCellFull!11535) mapValue!38194)) b!1033023))

(assert (= (and mapNonEmpty!38188 ((_ is ValueCellFull!11535) mapDefault!38194)) b!1033024))

(declare-fun m!953003 () Bool)

(assert (=> mapNonEmpty!38194 m!953003))

(check-sat (not b_next!20757) (not mapNonEmpty!38194) (not d!123757) (not b!1033015) b_and!33225 (not b!1033016) tp_is_empty!24477 (not b!1033014))
(check-sat b_and!33225 (not b_next!20757))
(get-model)

(declare-fun b!1033035 () Bool)

(declare-fun e!583810 () Bool)

(declare-fun call!43629 () Bool)

(assert (=> b!1033035 (= e!583810 call!43629)))

(declare-fun d!123761 () Bool)

(declare-fun res!690321 () Bool)

(declare-fun e!583811 () Bool)

(assert (=> d!123761 (=> res!690321 e!583811)))

(assert (=> d!123761 (= res!690321 (bvsge #b00000000000000000000000000000000 (size!31832 (_keys!11383 thiss!1427))))))

(assert (=> d!123761 (= (arrayNoDuplicates!0 (_keys!11383 thiss!1427) #b00000000000000000000000000000000 Nil!21897) e!583811)))

(declare-fun b!1033036 () Bool)

(declare-fun e!583809 () Bool)

(assert (=> b!1033036 (= e!583811 e!583809)))

(declare-fun res!690323 () Bool)

(assert (=> b!1033036 (=> (not res!690323) (not e!583809))))

(declare-fun e!583808 () Bool)

(assert (=> b!1033036 (= res!690323 (not e!583808))))

(declare-fun res!690322 () Bool)

(assert (=> b!1033036 (=> (not res!690322) (not e!583808))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1033036 (= res!690322 (validKeyInArray!0 (select (arr!31311 (_keys!11383 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43626 () Bool)

(declare-fun c!104352 () Bool)

(assert (=> bm!43626 (= call!43629 (arrayNoDuplicates!0 (_keys!11383 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104352 (Cons!21896 (select (arr!31311 (_keys!11383 thiss!1427)) #b00000000000000000000000000000000) Nil!21897) Nil!21897)))))

(declare-fun b!1033037 () Bool)

(declare-fun contains!6010 (List!21900 (_ BitVec 64)) Bool)

(assert (=> b!1033037 (= e!583808 (contains!6010 Nil!21897 (select (arr!31311 (_keys!11383 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1033038 () Bool)

(assert (=> b!1033038 (= e!583809 e!583810)))

(assert (=> b!1033038 (= c!104352 (validKeyInArray!0 (select (arr!31311 (_keys!11383 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1033039 () Bool)

(assert (=> b!1033039 (= e!583810 call!43629)))

(assert (= (and d!123761 (not res!690321)) b!1033036))

(assert (= (and b!1033036 res!690322) b!1033037))

(assert (= (and b!1033036 res!690323) b!1033038))

(assert (= (and b!1033038 c!104352) b!1033039))

(assert (= (and b!1033038 (not c!104352)) b!1033035))

(assert (= (or b!1033039 b!1033035) bm!43626))

(declare-fun m!953005 () Bool)

(assert (=> b!1033036 m!953005))

(assert (=> b!1033036 m!953005))

(declare-fun m!953007 () Bool)

(assert (=> b!1033036 m!953007))

(assert (=> bm!43626 m!953005))

(declare-fun m!953009 () Bool)

(assert (=> bm!43626 m!953009))

(assert (=> b!1033037 m!953005))

(assert (=> b!1033037 m!953005))

(declare-fun m!953011 () Bool)

(assert (=> b!1033037 m!953011))

(assert (=> b!1033038 m!953005))

(assert (=> b!1033038 m!953005))

(assert (=> b!1033038 m!953007))

(assert (=> b!1033016 d!123761))

(declare-fun b!1033050 () Bool)

(declare-fun res!690335 () Bool)

(declare-fun e!583814 () Bool)

(assert (=> b!1033050 (=> (not res!690335) (not e!583814))))

(declare-fun size!31836 (LongMapFixedSize!5664) (_ BitVec 32))

(assert (=> b!1033050 (= res!690335 (= (size!31836 thiss!1427) (bvadd (_size!2887 thiss!1427) (bvsdiv (bvadd (extraKeys!5938 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!123763 () Bool)

(declare-fun res!690334 () Bool)

(assert (=> d!123763 (=> (not res!690334) (not e!583814))))

(assert (=> d!123763 (= res!690334 (validMask!0 (mask!30043 thiss!1427)))))

(assert (=> d!123763 (= (simpleValid!402 thiss!1427) e!583814)))

(declare-fun b!1033051 () Bool)

(assert (=> b!1033051 (= e!583814 (and (bvsge (extraKeys!5938 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5938 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2887 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1033048 () Bool)

(declare-fun res!690332 () Bool)

(assert (=> b!1033048 (=> (not res!690332) (not e!583814))))

(assert (=> b!1033048 (= res!690332 (and (= (size!31833 (_values!6229 thiss!1427)) (bvadd (mask!30043 thiss!1427) #b00000000000000000000000000000001)) (= (size!31832 (_keys!11383 thiss!1427)) (size!31833 (_values!6229 thiss!1427))) (bvsge (_size!2887 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2887 thiss!1427) (bvadd (mask!30043 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun b!1033049 () Bool)

(declare-fun res!690333 () Bool)

(assert (=> b!1033049 (=> (not res!690333) (not e!583814))))

(assert (=> b!1033049 (= res!690333 (bvsge (size!31836 thiss!1427) (_size!2887 thiss!1427)))))

(assert (= (and d!123763 res!690334) b!1033048))

(assert (= (and b!1033048 res!690332) b!1033049))

(assert (= (and b!1033049 res!690333) b!1033050))

(assert (= (and b!1033050 res!690335) b!1033051))

(declare-fun m!953013 () Bool)

(assert (=> b!1033050 m!953013))

(assert (=> d!123763 m!952981))

(assert (=> b!1033049 m!953013))

(assert (=> d!123757 d!123763))

(declare-fun b!1033060 () Bool)

(declare-fun e!583820 () (_ BitVec 32))

(declare-fun call!43632 () (_ BitVec 32))

(assert (=> b!1033060 (= e!583820 call!43632)))

(declare-fun b!1033061 () Bool)

(declare-fun e!583819 () (_ BitVec 32))

(assert (=> b!1033061 (= e!583819 e!583820)))

(declare-fun c!104358 () Bool)

(assert (=> b!1033061 (= c!104358 (validKeyInArray!0 (select (arr!31311 (_keys!11383 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!123765 () Bool)

(declare-fun lt!456080 () (_ BitVec 32))

(assert (=> d!123765 (and (bvsge lt!456080 #b00000000000000000000000000000000) (bvsle lt!456080 (bvsub (size!31832 (_keys!11383 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!123765 (= lt!456080 e!583819)))

(declare-fun c!104357 () Bool)

(assert (=> d!123765 (= c!104357 (bvsge #b00000000000000000000000000000000 (size!31832 (_keys!11383 thiss!1427))))))

(assert (=> d!123765 (and (bvsle #b00000000000000000000000000000000 (size!31832 (_keys!11383 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31832 (_keys!11383 thiss!1427)) (size!31832 (_keys!11383 thiss!1427))))))

(assert (=> d!123765 (= (arrayCountValidKeys!0 (_keys!11383 thiss!1427) #b00000000000000000000000000000000 (size!31832 (_keys!11383 thiss!1427))) lt!456080)))

(declare-fun b!1033062 () Bool)

(assert (=> b!1033062 (= e!583819 #b00000000000000000000000000000000)))

(declare-fun bm!43629 () Bool)

(assert (=> bm!43629 (= call!43632 (arrayCountValidKeys!0 (_keys!11383 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31832 (_keys!11383 thiss!1427))))))

(declare-fun b!1033063 () Bool)

(assert (=> b!1033063 (= e!583820 (bvadd #b00000000000000000000000000000001 call!43632))))

(assert (= (and d!123765 c!104357) b!1033062))

(assert (= (and d!123765 (not c!104357)) b!1033061))

(assert (= (and b!1033061 c!104358) b!1033063))

(assert (= (and b!1033061 (not c!104358)) b!1033060))

(assert (= (or b!1033063 b!1033060) bm!43629))

(assert (=> b!1033061 m!953005))

(assert (=> b!1033061 m!953005))

(assert (=> b!1033061 m!953007))

(declare-fun m!953015 () Bool)

(assert (=> bm!43629 m!953015))

(assert (=> b!1033014 d!123765))

(declare-fun b!1033072 () Bool)

(declare-fun e!583829 () Bool)

(declare-fun e!583828 () Bool)

(assert (=> b!1033072 (= e!583829 e!583828)))

(declare-fun lt!456087 () (_ BitVec 64))

(assert (=> b!1033072 (= lt!456087 (select (arr!31311 (_keys!11383 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33823 0))(
  ( (Unit!33824) )
))
(declare-fun lt!456088 () Unit!33823)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65028 (_ BitVec 64) (_ BitVec 32)) Unit!33823)

(assert (=> b!1033072 (= lt!456088 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11383 thiss!1427) lt!456087 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65028 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1033072 (arrayContainsKey!0 (_keys!11383 thiss!1427) lt!456087 #b00000000000000000000000000000000)))

(declare-fun lt!456089 () Unit!33823)

(assert (=> b!1033072 (= lt!456089 lt!456088)))

(declare-fun res!690340 () Bool)

(declare-datatypes ((SeekEntryResult!9735 0))(
  ( (MissingZero!9735 (index!41311 (_ BitVec 32))) (Found!9735 (index!41312 (_ BitVec 32))) (Intermediate!9735 (undefined!10547 Bool) (index!41313 (_ BitVec 32)) (x!92117 (_ BitVec 32))) (Undefined!9735) (MissingVacant!9735 (index!41314 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65028 (_ BitVec 32)) SeekEntryResult!9735)

(assert (=> b!1033072 (= res!690340 (= (seekEntryOrOpen!0 (select (arr!31311 (_keys!11383 thiss!1427)) #b00000000000000000000000000000000) (_keys!11383 thiss!1427) (mask!30043 thiss!1427)) (Found!9735 #b00000000000000000000000000000000)))))

(assert (=> b!1033072 (=> (not res!690340) (not e!583828))))

(declare-fun d!123767 () Bool)

(declare-fun res!690341 () Bool)

(declare-fun e!583827 () Bool)

(assert (=> d!123767 (=> res!690341 e!583827)))

(assert (=> d!123767 (= res!690341 (bvsge #b00000000000000000000000000000000 (size!31832 (_keys!11383 thiss!1427))))))

(assert (=> d!123767 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11383 thiss!1427) (mask!30043 thiss!1427)) e!583827)))

(declare-fun b!1033073 () Bool)

(declare-fun call!43635 () Bool)

(assert (=> b!1033073 (= e!583828 call!43635)))

(declare-fun bm!43632 () Bool)

(assert (=> bm!43632 (= call!43635 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11383 thiss!1427) (mask!30043 thiss!1427)))))

(declare-fun b!1033074 () Bool)

(assert (=> b!1033074 (= e!583827 e!583829)))

(declare-fun c!104361 () Bool)

(assert (=> b!1033074 (= c!104361 (validKeyInArray!0 (select (arr!31311 (_keys!11383 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1033075 () Bool)

(assert (=> b!1033075 (= e!583829 call!43635)))

(assert (= (and d!123767 (not res!690341)) b!1033074))

(assert (= (and b!1033074 c!104361) b!1033072))

(assert (= (and b!1033074 (not c!104361)) b!1033075))

(assert (= (and b!1033072 res!690340) b!1033073))

(assert (= (or b!1033073 b!1033075) bm!43632))

(assert (=> b!1033072 m!953005))

(declare-fun m!953017 () Bool)

(assert (=> b!1033072 m!953017))

(declare-fun m!953019 () Bool)

(assert (=> b!1033072 m!953019))

(assert (=> b!1033072 m!953005))

(declare-fun m!953021 () Bool)

(assert (=> b!1033072 m!953021))

(declare-fun m!953023 () Bool)

(assert (=> bm!43632 m!953023))

(assert (=> b!1033074 m!953005))

(assert (=> b!1033074 m!953005))

(assert (=> b!1033074 m!953007))

(assert (=> b!1033015 d!123767))

(declare-fun mapNonEmpty!38195 () Bool)

(declare-fun mapRes!38195 () Bool)

(declare-fun tp!73371 () Bool)

(declare-fun e!583830 () Bool)

(assert (=> mapNonEmpty!38195 (= mapRes!38195 (and tp!73371 e!583830))))

(declare-fun mapValue!38195 () ValueCell!11535)

(declare-fun mapRest!38195 () (Array (_ BitVec 32) ValueCell!11535))

(declare-fun mapKey!38195 () (_ BitVec 32))

(assert (=> mapNonEmpty!38195 (= mapRest!38194 (store mapRest!38195 mapKey!38195 mapValue!38195))))

(declare-fun condMapEmpty!38195 () Bool)

(declare-fun mapDefault!38195 () ValueCell!11535)

(assert (=> mapNonEmpty!38194 (= condMapEmpty!38195 (= mapRest!38194 ((as const (Array (_ BitVec 32) ValueCell!11535)) mapDefault!38195)))))

(declare-fun e!583831 () Bool)

(assert (=> mapNonEmpty!38194 (= tp!73370 (and e!583831 mapRes!38195))))

(declare-fun b!1033076 () Bool)

(assert (=> b!1033076 (= e!583830 tp_is_empty!24477)))

(declare-fun mapIsEmpty!38195 () Bool)

(assert (=> mapIsEmpty!38195 mapRes!38195))

(declare-fun b!1033077 () Bool)

(assert (=> b!1033077 (= e!583831 tp_is_empty!24477)))

(assert (= (and mapNonEmpty!38194 condMapEmpty!38195) mapIsEmpty!38195))

(assert (= (and mapNonEmpty!38194 (not condMapEmpty!38195)) mapNonEmpty!38195))

(assert (= (and mapNonEmpty!38195 ((_ is ValueCellFull!11535) mapValue!38195)) b!1033076))

(assert (= (and mapNonEmpty!38194 ((_ is ValueCellFull!11535) mapDefault!38195)) b!1033077))

(declare-fun m!953025 () Bool)

(assert (=> mapNonEmpty!38195 m!953025))

(check-sat (not b_next!20757) (not bm!43626) (not d!123763) (not b!1033050) (not b!1033049) (not bm!43629) (not b!1033061) (not mapNonEmpty!38195) tp_is_empty!24477 (not bm!43632) b_and!33225 (not b!1033072) (not b!1033037) (not b!1033074) (not b!1033036) (not b!1033038))
(check-sat b_and!33225 (not b_next!20757))

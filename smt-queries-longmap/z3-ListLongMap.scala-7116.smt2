; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90432 () Bool)

(assert start!90432)

(declare-fun b!1034145 () Bool)

(declare-fun b_free!20749 () Bool)

(declare-fun b_next!20749 () Bool)

(assert (=> b!1034145 (= b_free!20749 (not b_next!20749))))

(declare-fun tp!73333 () Bool)

(declare-fun b_and!33227 () Bool)

(assert (=> b!1034145 (= tp!73333 b_and!33227)))

(declare-fun res!690734 () Bool)

(declare-fun e!584498 () Bool)

(assert (=> start!90432 (=> (not res!690734) (not e!584498))))

(declare-datatypes ((V!37499 0))(
  ( (V!37500 (val!12285 Int)) )
))
(declare-datatypes ((ValueCell!11531 0))(
  ( (ValueCellFull!11531 (v!14858 V!37499)) (EmptyCell!11531) )
))
(declare-datatypes ((array!65059 0))(
  ( (array!65060 (arr!31321 (Array (_ BitVec 32) (_ BitVec 64))) (size!31842 (_ BitVec 32))) )
))
(declare-datatypes ((array!65061 0))(
  ( (array!65062 (arr!31322 (Array (_ BitVec 32) ValueCell!11531)) (size!31843 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5656 0))(
  ( (LongMapFixedSize!5657 (defaultEntry!6202 Int) (mask!30095 (_ BitVec 32)) (extraKeys!5934 (_ BitVec 32)) (zeroValue!6038 V!37499) (minValue!6038 V!37499) (_size!2883 (_ BitVec 32)) (_keys!11416 array!65059) (_values!6225 array!65061) (_vacant!2883 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5656)

(declare-fun valid!2145 (LongMapFixedSize!5656) Bool)

(assert (=> start!90432 (= res!690734 (valid!2145 thiss!1427))))

(assert (=> start!90432 e!584498))

(declare-fun e!584500 () Bool)

(assert (=> start!90432 e!584500))

(assert (=> start!90432 true))

(declare-fun mapIsEmpty!38172 () Bool)

(declare-fun mapRes!38172 () Bool)

(assert (=> mapIsEmpty!38172 mapRes!38172))

(declare-fun b!1034141 () Bool)

(declare-fun e!584497 () Bool)

(declare-fun e!584501 () Bool)

(assert (=> b!1034141 (= e!584497 (and e!584501 mapRes!38172))))

(declare-fun condMapEmpty!38172 () Bool)

(declare-fun mapDefault!38172 () ValueCell!11531)

(assert (=> b!1034141 (= condMapEmpty!38172 (= (arr!31322 (_values!6225 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11531)) mapDefault!38172)))))

(declare-fun mapNonEmpty!38172 () Bool)

(declare-fun tp!73332 () Bool)

(declare-fun e!584499 () Bool)

(assert (=> mapNonEmpty!38172 (= mapRes!38172 (and tp!73332 e!584499))))

(declare-fun mapKey!38172 () (_ BitVec 32))

(declare-fun mapValue!38172 () ValueCell!11531)

(declare-fun mapRest!38172 () (Array (_ BitVec 32) ValueCell!11531))

(assert (=> mapNonEmpty!38172 (= (arr!31322 (_values!6225 thiss!1427)) (store mapRest!38172 mapKey!38172 mapValue!38172))))

(declare-fun b!1034142 () Bool)

(declare-fun res!690733 () Bool)

(assert (=> b!1034142 (=> (not res!690733) (not e!584498))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1034142 (= res!690733 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1034143 () Bool)

(assert (=> b!1034143 (= e!584498 (and (= (size!31843 (_values!6225 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30095 thiss!1427))) (= (size!31842 (_keys!11416 thiss!1427)) (size!31843 (_values!6225 thiss!1427))) (bvsge (mask!30095 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5934 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1034144 () Bool)

(declare-fun res!690732 () Bool)

(assert (=> b!1034144 (=> (not res!690732) (not e!584498))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1034144 (= res!690732 (validMask!0 (mask!30095 thiss!1427)))))

(declare-fun tp_is_empty!24469 () Bool)

(declare-fun array_inv!24247 (array!65059) Bool)

(declare-fun array_inv!24248 (array!65061) Bool)

(assert (=> b!1034145 (= e!584500 (and tp!73333 tp_is_empty!24469 (array_inv!24247 (_keys!11416 thiss!1427)) (array_inv!24248 (_values!6225 thiss!1427)) e!584497))))

(declare-fun b!1034146 () Bool)

(assert (=> b!1034146 (= e!584501 tp_is_empty!24469)))

(declare-fun b!1034147 () Bool)

(assert (=> b!1034147 (= e!584499 tp_is_empty!24469)))

(assert (= (and start!90432 res!690734) b!1034142))

(assert (= (and b!1034142 res!690733) b!1034144))

(assert (= (and b!1034144 res!690732) b!1034143))

(assert (= (and b!1034141 condMapEmpty!38172) mapIsEmpty!38172))

(assert (= (and b!1034141 (not condMapEmpty!38172)) mapNonEmpty!38172))

(get-info :version)

(assert (= (and mapNonEmpty!38172 ((_ is ValueCellFull!11531) mapValue!38172)) b!1034147))

(assert (= (and b!1034141 ((_ is ValueCellFull!11531) mapDefault!38172)) b!1034146))

(assert (= b!1034145 b!1034141))

(assert (= start!90432 b!1034145))

(declare-fun m!954567 () Bool)

(assert (=> start!90432 m!954567))

(declare-fun m!954569 () Bool)

(assert (=> mapNonEmpty!38172 m!954569))

(declare-fun m!954571 () Bool)

(assert (=> b!1034144 m!954571))

(declare-fun m!954573 () Bool)

(assert (=> b!1034145 m!954573))

(declare-fun m!954575 () Bool)

(assert (=> b!1034145 m!954575))

(check-sat (not mapNonEmpty!38172) (not b_next!20749) (not b!1034145) (not start!90432) b_and!33227 tp_is_empty!24469 (not b!1034144))
(check-sat b_and!33227 (not b_next!20749))
(get-model)

(declare-fun d!124197 () Bool)

(declare-fun res!690759 () Bool)

(declare-fun e!584541 () Bool)

(assert (=> d!124197 (=> (not res!690759) (not e!584541))))

(declare-fun simpleValid!401 (LongMapFixedSize!5656) Bool)

(assert (=> d!124197 (= res!690759 (simpleValid!401 thiss!1427))))

(assert (=> d!124197 (= (valid!2145 thiss!1427) e!584541)))

(declare-fun b!1034196 () Bool)

(declare-fun res!690760 () Bool)

(assert (=> b!1034196 (=> (not res!690760) (not e!584541))))

(declare-fun arrayCountValidKeys!0 (array!65059 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1034196 (= res!690760 (= (arrayCountValidKeys!0 (_keys!11416 thiss!1427) #b00000000000000000000000000000000 (size!31842 (_keys!11416 thiss!1427))) (_size!2883 thiss!1427)))))

(declare-fun b!1034197 () Bool)

(declare-fun res!690761 () Bool)

(assert (=> b!1034197 (=> (not res!690761) (not e!584541))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65059 (_ BitVec 32)) Bool)

(assert (=> b!1034197 (= res!690761 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11416 thiss!1427) (mask!30095 thiss!1427)))))

(declare-fun b!1034198 () Bool)

(declare-datatypes ((List!21886 0))(
  ( (Nil!21883) (Cons!21882 (h!23093 (_ BitVec 64)) (t!31072 List!21886)) )
))
(declare-fun arrayNoDuplicates!0 (array!65059 (_ BitVec 32) List!21886) Bool)

(assert (=> b!1034198 (= e!584541 (arrayNoDuplicates!0 (_keys!11416 thiss!1427) #b00000000000000000000000000000000 Nil!21883))))

(assert (= (and d!124197 res!690759) b!1034196))

(assert (= (and b!1034196 res!690760) b!1034197))

(assert (= (and b!1034197 res!690761) b!1034198))

(declare-fun m!954597 () Bool)

(assert (=> d!124197 m!954597))

(declare-fun m!954599 () Bool)

(assert (=> b!1034196 m!954599))

(declare-fun m!954601 () Bool)

(assert (=> b!1034197 m!954601))

(declare-fun m!954603 () Bool)

(assert (=> b!1034198 m!954603))

(assert (=> start!90432 d!124197))

(declare-fun d!124199 () Bool)

(assert (=> d!124199 (= (validMask!0 (mask!30095 thiss!1427)) (and (or (= (mask!30095 thiss!1427) #b00000000000000000000000000000111) (= (mask!30095 thiss!1427) #b00000000000000000000000000001111) (= (mask!30095 thiss!1427) #b00000000000000000000000000011111) (= (mask!30095 thiss!1427) #b00000000000000000000000000111111) (= (mask!30095 thiss!1427) #b00000000000000000000000001111111) (= (mask!30095 thiss!1427) #b00000000000000000000000011111111) (= (mask!30095 thiss!1427) #b00000000000000000000000111111111) (= (mask!30095 thiss!1427) #b00000000000000000000001111111111) (= (mask!30095 thiss!1427) #b00000000000000000000011111111111) (= (mask!30095 thiss!1427) #b00000000000000000000111111111111) (= (mask!30095 thiss!1427) #b00000000000000000001111111111111) (= (mask!30095 thiss!1427) #b00000000000000000011111111111111) (= (mask!30095 thiss!1427) #b00000000000000000111111111111111) (= (mask!30095 thiss!1427) #b00000000000000001111111111111111) (= (mask!30095 thiss!1427) #b00000000000000011111111111111111) (= (mask!30095 thiss!1427) #b00000000000000111111111111111111) (= (mask!30095 thiss!1427) #b00000000000001111111111111111111) (= (mask!30095 thiss!1427) #b00000000000011111111111111111111) (= (mask!30095 thiss!1427) #b00000000000111111111111111111111) (= (mask!30095 thiss!1427) #b00000000001111111111111111111111) (= (mask!30095 thiss!1427) #b00000000011111111111111111111111) (= (mask!30095 thiss!1427) #b00000000111111111111111111111111) (= (mask!30095 thiss!1427) #b00000001111111111111111111111111) (= (mask!30095 thiss!1427) #b00000011111111111111111111111111) (= (mask!30095 thiss!1427) #b00000111111111111111111111111111) (= (mask!30095 thiss!1427) #b00001111111111111111111111111111) (= (mask!30095 thiss!1427) #b00011111111111111111111111111111) (= (mask!30095 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30095 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1034144 d!124199))

(declare-fun d!124201 () Bool)

(assert (=> d!124201 (= (array_inv!24247 (_keys!11416 thiss!1427)) (bvsge (size!31842 (_keys!11416 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1034145 d!124201))

(declare-fun d!124203 () Bool)

(assert (=> d!124203 (= (array_inv!24248 (_values!6225 thiss!1427)) (bvsge (size!31843 (_values!6225 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1034145 d!124203))

(declare-fun condMapEmpty!38181 () Bool)

(declare-fun mapDefault!38181 () ValueCell!11531)

(assert (=> mapNonEmpty!38172 (= condMapEmpty!38181 (= mapRest!38172 ((as const (Array (_ BitVec 32) ValueCell!11531)) mapDefault!38181)))))

(declare-fun e!584547 () Bool)

(declare-fun mapRes!38181 () Bool)

(assert (=> mapNonEmpty!38172 (= tp!73332 (and e!584547 mapRes!38181))))

(declare-fun b!1034206 () Bool)

(assert (=> b!1034206 (= e!584547 tp_is_empty!24469)))

(declare-fun mapNonEmpty!38181 () Bool)

(declare-fun tp!73348 () Bool)

(declare-fun e!584546 () Bool)

(assert (=> mapNonEmpty!38181 (= mapRes!38181 (and tp!73348 e!584546))))

(declare-fun mapValue!38181 () ValueCell!11531)

(declare-fun mapKey!38181 () (_ BitVec 32))

(declare-fun mapRest!38181 () (Array (_ BitVec 32) ValueCell!11531))

(assert (=> mapNonEmpty!38181 (= mapRest!38172 (store mapRest!38181 mapKey!38181 mapValue!38181))))

(declare-fun mapIsEmpty!38181 () Bool)

(assert (=> mapIsEmpty!38181 mapRes!38181))

(declare-fun b!1034205 () Bool)

(assert (=> b!1034205 (= e!584546 tp_is_empty!24469)))

(assert (= (and mapNonEmpty!38172 condMapEmpty!38181) mapIsEmpty!38181))

(assert (= (and mapNonEmpty!38172 (not condMapEmpty!38181)) mapNonEmpty!38181))

(assert (= (and mapNonEmpty!38181 ((_ is ValueCellFull!11531) mapValue!38181)) b!1034205))

(assert (= (and mapNonEmpty!38172 ((_ is ValueCellFull!11531) mapDefault!38181)) b!1034206))

(declare-fun m!954605 () Bool)

(assert (=> mapNonEmpty!38181 m!954605))

(check-sat b_and!33227 (not b!1034198) (not b_next!20749) (not b!1034196) (not d!124197) (not b!1034197) tp_is_empty!24469 (not mapNonEmpty!38181))
(check-sat b_and!33227 (not b_next!20749))
(get-model)

(declare-fun b!1034216 () Bool)

(declare-fun res!690772 () Bool)

(declare-fun e!584550 () Bool)

(assert (=> b!1034216 (=> (not res!690772) (not e!584550))))

(declare-fun size!31848 (LongMapFixedSize!5656) (_ BitVec 32))

(assert (=> b!1034216 (= res!690772 (bvsge (size!31848 thiss!1427) (_size!2883 thiss!1427)))))

(declare-fun d!124205 () Bool)

(declare-fun res!690771 () Bool)

(assert (=> d!124205 (=> (not res!690771) (not e!584550))))

(assert (=> d!124205 (= res!690771 (validMask!0 (mask!30095 thiss!1427)))))

(assert (=> d!124205 (= (simpleValid!401 thiss!1427) e!584550)))

(declare-fun b!1034217 () Bool)

(declare-fun res!690773 () Bool)

(assert (=> b!1034217 (=> (not res!690773) (not e!584550))))

(assert (=> b!1034217 (= res!690773 (= (size!31848 thiss!1427) (bvadd (_size!2883 thiss!1427) (bvsdiv (bvadd (extraKeys!5934 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1034215 () Bool)

(declare-fun res!690770 () Bool)

(assert (=> b!1034215 (=> (not res!690770) (not e!584550))))

(assert (=> b!1034215 (= res!690770 (and (= (size!31843 (_values!6225 thiss!1427)) (bvadd (mask!30095 thiss!1427) #b00000000000000000000000000000001)) (= (size!31842 (_keys!11416 thiss!1427)) (size!31843 (_values!6225 thiss!1427))) (bvsge (_size!2883 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2883 thiss!1427) (bvadd (mask!30095 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun b!1034218 () Bool)

(assert (=> b!1034218 (= e!584550 (and (bvsge (extraKeys!5934 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5934 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2883 thiss!1427) #b00000000000000000000000000000000)))))

(assert (= (and d!124205 res!690771) b!1034215))

(assert (= (and b!1034215 res!690770) b!1034216))

(assert (= (and b!1034216 res!690772) b!1034217))

(assert (= (and b!1034217 res!690773) b!1034218))

(declare-fun m!954607 () Bool)

(assert (=> b!1034216 m!954607))

(assert (=> d!124205 m!954571))

(assert (=> b!1034217 m!954607))

(assert (=> d!124197 d!124205))

(declare-fun bm!43684 () Bool)

(declare-fun call!43687 () Bool)

(assert (=> bm!43684 (= call!43687 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11416 thiss!1427) (mask!30095 thiss!1427)))))

(declare-fun b!1034227 () Bool)

(declare-fun e!584557 () Bool)

(declare-fun e!584559 () Bool)

(assert (=> b!1034227 (= e!584557 e!584559)))

(declare-fun c!104750 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1034227 (= c!104750 (validKeyInArray!0 (select (arr!31321 (_keys!11416 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1034228 () Bool)

(declare-fun e!584558 () Bool)

(assert (=> b!1034228 (= e!584558 call!43687)))

(declare-fun b!1034229 () Bool)

(assert (=> b!1034229 (= e!584559 e!584558)))

(declare-fun lt!456589 () (_ BitVec 64))

(assert (=> b!1034229 (= lt!456589 (select (arr!31321 (_keys!11416 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33829 0))(
  ( (Unit!33830) )
))
(declare-fun lt!456588 () Unit!33829)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65059 (_ BitVec 64) (_ BitVec 32)) Unit!33829)

(assert (=> b!1034229 (= lt!456588 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11416 thiss!1427) lt!456589 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65059 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1034229 (arrayContainsKey!0 (_keys!11416 thiss!1427) lt!456589 #b00000000000000000000000000000000)))

(declare-fun lt!456587 () Unit!33829)

(assert (=> b!1034229 (= lt!456587 lt!456588)))

(declare-fun res!690779 () Bool)

(declare-datatypes ((SeekEntryResult!9691 0))(
  ( (MissingZero!9691 (index!41135 (_ BitVec 32))) (Found!9691 (index!41136 (_ BitVec 32))) (Intermediate!9691 (undefined!10503 Bool) (index!41137 (_ BitVec 32)) (x!92073 (_ BitVec 32))) (Undefined!9691) (MissingVacant!9691 (index!41138 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65059 (_ BitVec 32)) SeekEntryResult!9691)

(assert (=> b!1034229 (= res!690779 (= (seekEntryOrOpen!0 (select (arr!31321 (_keys!11416 thiss!1427)) #b00000000000000000000000000000000) (_keys!11416 thiss!1427) (mask!30095 thiss!1427)) (Found!9691 #b00000000000000000000000000000000)))))

(assert (=> b!1034229 (=> (not res!690779) (not e!584558))))

(declare-fun d!124207 () Bool)

(declare-fun res!690778 () Bool)

(assert (=> d!124207 (=> res!690778 e!584557)))

(assert (=> d!124207 (= res!690778 (bvsge #b00000000000000000000000000000000 (size!31842 (_keys!11416 thiss!1427))))))

(assert (=> d!124207 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11416 thiss!1427) (mask!30095 thiss!1427)) e!584557)))

(declare-fun b!1034230 () Bool)

(assert (=> b!1034230 (= e!584559 call!43687)))

(assert (= (and d!124207 (not res!690778)) b!1034227))

(assert (= (and b!1034227 c!104750) b!1034229))

(assert (= (and b!1034227 (not c!104750)) b!1034230))

(assert (= (and b!1034229 res!690779) b!1034228))

(assert (= (or b!1034228 b!1034230) bm!43684))

(declare-fun m!954609 () Bool)

(assert (=> bm!43684 m!954609))

(declare-fun m!954611 () Bool)

(assert (=> b!1034227 m!954611))

(assert (=> b!1034227 m!954611))

(declare-fun m!954613 () Bool)

(assert (=> b!1034227 m!954613))

(assert (=> b!1034229 m!954611))

(declare-fun m!954615 () Bool)

(assert (=> b!1034229 m!954615))

(declare-fun m!954617 () Bool)

(assert (=> b!1034229 m!954617))

(assert (=> b!1034229 m!954611))

(declare-fun m!954619 () Bool)

(assert (=> b!1034229 m!954619))

(assert (=> b!1034197 d!124207))

(declare-fun d!124209 () Bool)

(declare-fun res!690786 () Bool)

(declare-fun e!584570 () Bool)

(assert (=> d!124209 (=> res!690786 e!584570)))

(assert (=> d!124209 (= res!690786 (bvsge #b00000000000000000000000000000000 (size!31842 (_keys!11416 thiss!1427))))))

(assert (=> d!124209 (= (arrayNoDuplicates!0 (_keys!11416 thiss!1427) #b00000000000000000000000000000000 Nil!21883) e!584570)))

(declare-fun bm!43687 () Bool)

(declare-fun call!43690 () Bool)

(declare-fun c!104753 () Bool)

(assert (=> bm!43687 (= call!43690 (arrayNoDuplicates!0 (_keys!11416 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104753 (Cons!21882 (select (arr!31321 (_keys!11416 thiss!1427)) #b00000000000000000000000000000000) Nil!21883) Nil!21883)))))

(declare-fun b!1034241 () Bool)

(declare-fun e!584571 () Bool)

(declare-fun e!584568 () Bool)

(assert (=> b!1034241 (= e!584571 e!584568)))

(assert (=> b!1034241 (= c!104753 (validKeyInArray!0 (select (arr!31321 (_keys!11416 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1034242 () Bool)

(assert (=> b!1034242 (= e!584568 call!43690)))

(declare-fun b!1034243 () Bool)

(assert (=> b!1034243 (= e!584570 e!584571)))

(declare-fun res!690787 () Bool)

(assert (=> b!1034243 (=> (not res!690787) (not e!584571))))

(declare-fun e!584569 () Bool)

(assert (=> b!1034243 (= res!690787 (not e!584569))))

(declare-fun res!690788 () Bool)

(assert (=> b!1034243 (=> (not res!690788) (not e!584569))))

(assert (=> b!1034243 (= res!690788 (validKeyInArray!0 (select (arr!31321 (_keys!11416 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1034244 () Bool)

(declare-fun contains!6034 (List!21886 (_ BitVec 64)) Bool)

(assert (=> b!1034244 (= e!584569 (contains!6034 Nil!21883 (select (arr!31321 (_keys!11416 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1034245 () Bool)

(assert (=> b!1034245 (= e!584568 call!43690)))

(assert (= (and d!124209 (not res!690786)) b!1034243))

(assert (= (and b!1034243 res!690788) b!1034244))

(assert (= (and b!1034243 res!690787) b!1034241))

(assert (= (and b!1034241 c!104753) b!1034245))

(assert (= (and b!1034241 (not c!104753)) b!1034242))

(assert (= (or b!1034245 b!1034242) bm!43687))

(assert (=> bm!43687 m!954611))

(declare-fun m!954621 () Bool)

(assert (=> bm!43687 m!954621))

(assert (=> b!1034241 m!954611))

(assert (=> b!1034241 m!954611))

(assert (=> b!1034241 m!954613))

(assert (=> b!1034243 m!954611))

(assert (=> b!1034243 m!954611))

(assert (=> b!1034243 m!954613))

(assert (=> b!1034244 m!954611))

(assert (=> b!1034244 m!954611))

(declare-fun m!954623 () Bool)

(assert (=> b!1034244 m!954623))

(assert (=> b!1034198 d!124209))

(declare-fun b!1034254 () Bool)

(declare-fun e!584577 () (_ BitVec 32))

(assert (=> b!1034254 (= e!584577 #b00000000000000000000000000000000)))

(declare-fun b!1034255 () Bool)

(declare-fun e!584576 () (_ BitVec 32))

(declare-fun call!43693 () (_ BitVec 32))

(assert (=> b!1034255 (= e!584576 (bvadd #b00000000000000000000000000000001 call!43693))))

(declare-fun b!1034256 () Bool)

(assert (=> b!1034256 (= e!584577 e!584576)))

(declare-fun c!104759 () Bool)

(assert (=> b!1034256 (= c!104759 (validKeyInArray!0 (select (arr!31321 (_keys!11416 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1034257 () Bool)

(assert (=> b!1034257 (= e!584576 call!43693)))

(declare-fun bm!43690 () Bool)

(assert (=> bm!43690 (= call!43693 (arrayCountValidKeys!0 (_keys!11416 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31842 (_keys!11416 thiss!1427))))))

(declare-fun d!124211 () Bool)

(declare-fun lt!456592 () (_ BitVec 32))

(assert (=> d!124211 (and (bvsge lt!456592 #b00000000000000000000000000000000) (bvsle lt!456592 (bvsub (size!31842 (_keys!11416 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!124211 (= lt!456592 e!584577)))

(declare-fun c!104758 () Bool)

(assert (=> d!124211 (= c!104758 (bvsge #b00000000000000000000000000000000 (size!31842 (_keys!11416 thiss!1427))))))

(assert (=> d!124211 (and (bvsle #b00000000000000000000000000000000 (size!31842 (_keys!11416 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31842 (_keys!11416 thiss!1427)) (size!31842 (_keys!11416 thiss!1427))))))

(assert (=> d!124211 (= (arrayCountValidKeys!0 (_keys!11416 thiss!1427) #b00000000000000000000000000000000 (size!31842 (_keys!11416 thiss!1427))) lt!456592)))

(assert (= (and d!124211 c!104758) b!1034254))

(assert (= (and d!124211 (not c!104758)) b!1034256))

(assert (= (and b!1034256 c!104759) b!1034255))

(assert (= (and b!1034256 (not c!104759)) b!1034257))

(assert (= (or b!1034255 b!1034257) bm!43690))

(assert (=> b!1034256 m!954611))

(assert (=> b!1034256 m!954611))

(assert (=> b!1034256 m!954613))

(declare-fun m!954625 () Bool)

(assert (=> bm!43690 m!954625))

(assert (=> b!1034196 d!124211))

(declare-fun condMapEmpty!38182 () Bool)

(declare-fun mapDefault!38182 () ValueCell!11531)

(assert (=> mapNonEmpty!38181 (= condMapEmpty!38182 (= mapRest!38181 ((as const (Array (_ BitVec 32) ValueCell!11531)) mapDefault!38182)))))

(declare-fun e!584579 () Bool)

(declare-fun mapRes!38182 () Bool)

(assert (=> mapNonEmpty!38181 (= tp!73348 (and e!584579 mapRes!38182))))

(declare-fun b!1034259 () Bool)

(assert (=> b!1034259 (= e!584579 tp_is_empty!24469)))

(declare-fun mapNonEmpty!38182 () Bool)

(declare-fun tp!73349 () Bool)

(declare-fun e!584578 () Bool)

(assert (=> mapNonEmpty!38182 (= mapRes!38182 (and tp!73349 e!584578))))

(declare-fun mapRest!38182 () (Array (_ BitVec 32) ValueCell!11531))

(declare-fun mapKey!38182 () (_ BitVec 32))

(declare-fun mapValue!38182 () ValueCell!11531)

(assert (=> mapNonEmpty!38182 (= mapRest!38181 (store mapRest!38182 mapKey!38182 mapValue!38182))))

(declare-fun mapIsEmpty!38182 () Bool)

(assert (=> mapIsEmpty!38182 mapRes!38182))

(declare-fun b!1034258 () Bool)

(assert (=> b!1034258 (= e!584578 tp_is_empty!24469)))

(assert (= (and mapNonEmpty!38181 condMapEmpty!38182) mapIsEmpty!38182))

(assert (= (and mapNonEmpty!38181 (not condMapEmpty!38182)) mapNonEmpty!38182))

(assert (= (and mapNonEmpty!38182 ((_ is ValueCellFull!11531) mapValue!38182)) b!1034258))

(assert (= (and mapNonEmpty!38181 ((_ is ValueCellFull!11531) mapDefault!38182)) b!1034259))

(declare-fun m!954627 () Bool)

(assert (=> mapNonEmpty!38182 m!954627))

(check-sat (not b!1034216) (not bm!43690) (not b!1034243) (not mapNonEmpty!38182) (not b_next!20749) (not d!124205) (not b!1034256) (not b!1034241) (not b!1034244) tp_is_empty!24469 (not b!1034229) (not bm!43684) (not b!1034227) (not bm!43687) (not b!1034217) b_and!33227)
(check-sat b_and!33227 (not b_next!20749))

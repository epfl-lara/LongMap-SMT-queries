; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90196 () Bool)

(assert start!90196)

(declare-fun b!1032677 () Bool)

(declare-fun b_free!20749 () Bool)

(declare-fun b_next!20749 () Bool)

(assert (=> b!1032677 (= b_free!20749 (not b_next!20749))))

(declare-fun tp!73332 () Bool)

(declare-fun b_and!33191 () Bool)

(assert (=> b!1032677 (= tp!73332 b_and!33191)))

(declare-fun b!1032675 () Bool)

(declare-fun e!583568 () Bool)

(declare-fun tp_is_empty!24469 () Bool)

(assert (=> b!1032675 (= e!583568 tp_is_empty!24469)))

(declare-fun b!1032676 () Bool)

(declare-fun res!690157 () Bool)

(declare-fun e!583564 () Bool)

(assert (=> b!1032676 (=> (not res!690157) (not e!583564))))

(declare-datatypes ((V!37499 0))(
  ( (V!37500 (val!12285 Int)) )
))
(declare-datatypes ((ValueCell!11531 0))(
  ( (ValueCellFull!11531 (v!14861 V!37499)) (EmptyCell!11531) )
))
(declare-datatypes ((array!64949 0))(
  ( (array!64950 (arr!31272 (Array (_ BitVec 32) (_ BitVec 64))) (size!31794 (_ BitVec 32))) )
))
(declare-datatypes ((array!64951 0))(
  ( (array!64952 (arr!31273 (Array (_ BitVec 32) ValueCell!11531)) (size!31795 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5656 0))(
  ( (LongMapFixedSize!5657 (defaultEntry!6202 Int) (mask!30030 (_ BitVec 32)) (extraKeys!5934 (_ BitVec 32)) (zeroValue!6038 V!37499) (minValue!6038 V!37499) (_size!2883 (_ BitVec 32)) (_keys!11374 array!64949) (_values!6225 array!64951) (_vacant!2883 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5656)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1032676 (= res!690157 (validMask!0 (mask!30030 thiss!1427)))))

(declare-fun e!583566 () Bool)

(declare-fun e!583565 () Bool)

(declare-fun array_inv!24197 (array!64949) Bool)

(declare-fun array_inv!24198 (array!64951) Bool)

(assert (=> b!1032677 (= e!583565 (and tp!73332 tp_is_empty!24469 (array_inv!24197 (_keys!11374 thiss!1427)) (array_inv!24198 (_values!6225 thiss!1427)) e!583566))))

(declare-fun b!1032678 () Bool)

(declare-fun e!583567 () Bool)

(assert (=> b!1032678 (= e!583567 tp_is_empty!24469)))

(declare-fun b!1032679 () Bool)

(declare-fun mapRes!38172 () Bool)

(assert (=> b!1032679 (= e!583566 (and e!583567 mapRes!38172))))

(declare-fun condMapEmpty!38172 () Bool)

(declare-fun mapDefault!38172 () ValueCell!11531)

(assert (=> b!1032679 (= condMapEmpty!38172 (= (arr!31273 (_values!6225 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11531)) mapDefault!38172)))))

(declare-fun b!1032680 () Bool)

(assert (=> b!1032680 (= e!583564 (and (= (size!31795 (_values!6225 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30030 thiss!1427))) (= (size!31794 (_keys!11374 thiss!1427)) (size!31795 (_values!6225 thiss!1427))) (bvsge (mask!30030 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5934 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!38172 () Bool)

(declare-fun tp!73333 () Bool)

(assert (=> mapNonEmpty!38172 (= mapRes!38172 (and tp!73333 e!583568))))

(declare-fun mapKey!38172 () (_ BitVec 32))

(declare-fun mapValue!38172 () ValueCell!11531)

(declare-fun mapRest!38172 () (Array (_ BitVec 32) ValueCell!11531))

(assert (=> mapNonEmpty!38172 (= (arr!31273 (_values!6225 thiss!1427)) (store mapRest!38172 mapKey!38172 mapValue!38172))))

(declare-fun res!690155 () Bool)

(assert (=> start!90196 (=> (not res!690155) (not e!583564))))

(declare-fun valid!2129 (LongMapFixedSize!5656) Bool)

(assert (=> start!90196 (= res!690155 (valid!2129 thiss!1427))))

(assert (=> start!90196 e!583564))

(assert (=> start!90196 e!583565))

(assert (=> start!90196 true))

(declare-fun b!1032681 () Bool)

(declare-fun res!690156 () Bool)

(assert (=> b!1032681 (=> (not res!690156) (not e!583564))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1032681 (= res!690156 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!38172 () Bool)

(assert (=> mapIsEmpty!38172 mapRes!38172))

(assert (= (and start!90196 res!690155) b!1032681))

(assert (= (and b!1032681 res!690156) b!1032676))

(assert (= (and b!1032676 res!690157) b!1032680))

(assert (= (and b!1032679 condMapEmpty!38172) mapIsEmpty!38172))

(assert (= (and b!1032679 (not condMapEmpty!38172)) mapNonEmpty!38172))

(get-info :version)

(assert (= (and mapNonEmpty!38172 ((_ is ValueCellFull!11531) mapValue!38172)) b!1032675))

(assert (= (and b!1032679 ((_ is ValueCellFull!11531) mapDefault!38172)) b!1032678))

(assert (= b!1032677 b!1032679))

(assert (= start!90196 b!1032677))

(declare-fun m!952283 () Bool)

(assert (=> b!1032676 m!952283))

(declare-fun m!952285 () Bool)

(assert (=> b!1032677 m!952285))

(declare-fun m!952287 () Bool)

(assert (=> b!1032677 m!952287))

(declare-fun m!952289 () Bool)

(assert (=> mapNonEmpty!38172 m!952289))

(declare-fun m!952291 () Bool)

(assert (=> start!90196 m!952291))

(check-sat b_and!33191 (not b_next!20749) (not b!1032677) tp_is_empty!24469 (not start!90196) (not mapNonEmpty!38172) (not b!1032676))
(check-sat b_and!33191 (not b_next!20749))
(get-model)

(declare-fun d!123585 () Bool)

(assert (=> d!123585 (= (array_inv!24197 (_keys!11374 thiss!1427)) (bvsge (size!31794 (_keys!11374 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1032677 d!123585))

(declare-fun d!123587 () Bool)

(assert (=> d!123587 (= (array_inv!24198 (_values!6225 thiss!1427)) (bvsge (size!31795 (_values!6225 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1032677 d!123587))

(declare-fun d!123589 () Bool)

(assert (=> d!123589 (= (validMask!0 (mask!30030 thiss!1427)) (and (or (= (mask!30030 thiss!1427) #b00000000000000000000000000000111) (= (mask!30030 thiss!1427) #b00000000000000000000000000001111) (= (mask!30030 thiss!1427) #b00000000000000000000000000011111) (= (mask!30030 thiss!1427) #b00000000000000000000000000111111) (= (mask!30030 thiss!1427) #b00000000000000000000000001111111) (= (mask!30030 thiss!1427) #b00000000000000000000000011111111) (= (mask!30030 thiss!1427) #b00000000000000000000000111111111) (= (mask!30030 thiss!1427) #b00000000000000000000001111111111) (= (mask!30030 thiss!1427) #b00000000000000000000011111111111) (= (mask!30030 thiss!1427) #b00000000000000000000111111111111) (= (mask!30030 thiss!1427) #b00000000000000000001111111111111) (= (mask!30030 thiss!1427) #b00000000000000000011111111111111) (= (mask!30030 thiss!1427) #b00000000000000000111111111111111) (= (mask!30030 thiss!1427) #b00000000000000001111111111111111) (= (mask!30030 thiss!1427) #b00000000000000011111111111111111) (= (mask!30030 thiss!1427) #b00000000000000111111111111111111) (= (mask!30030 thiss!1427) #b00000000000001111111111111111111) (= (mask!30030 thiss!1427) #b00000000000011111111111111111111) (= (mask!30030 thiss!1427) #b00000000000111111111111111111111) (= (mask!30030 thiss!1427) #b00000000001111111111111111111111) (= (mask!30030 thiss!1427) #b00000000011111111111111111111111) (= (mask!30030 thiss!1427) #b00000000111111111111111111111111) (= (mask!30030 thiss!1427) #b00000001111111111111111111111111) (= (mask!30030 thiss!1427) #b00000011111111111111111111111111) (= (mask!30030 thiss!1427) #b00000111111111111111111111111111) (= (mask!30030 thiss!1427) #b00001111111111111111111111111111) (= (mask!30030 thiss!1427) #b00011111111111111111111111111111) (= (mask!30030 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30030 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1032676 d!123589))

(declare-fun d!123591 () Bool)

(declare-fun res!690182 () Bool)

(declare-fun e!583607 () Bool)

(assert (=> d!123591 (=> (not res!690182) (not e!583607))))

(declare-fun simpleValid!401 (LongMapFixedSize!5656) Bool)

(assert (=> d!123591 (= res!690182 (simpleValid!401 thiss!1427))))

(assert (=> d!123591 (= (valid!2129 thiss!1427) e!583607)))

(declare-fun b!1032730 () Bool)

(declare-fun res!690183 () Bool)

(assert (=> b!1032730 (=> (not res!690183) (not e!583607))))

(declare-fun arrayCountValidKeys!0 (array!64949 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1032730 (= res!690183 (= (arrayCountValidKeys!0 (_keys!11374 thiss!1427) #b00000000000000000000000000000000 (size!31794 (_keys!11374 thiss!1427))) (_size!2883 thiss!1427)))))

(declare-fun b!1032731 () Bool)

(declare-fun res!690184 () Bool)

(assert (=> b!1032731 (=> (not res!690184) (not e!583607))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64949 (_ BitVec 32)) Bool)

(assert (=> b!1032731 (= res!690184 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11374 thiss!1427) (mask!30030 thiss!1427)))))

(declare-fun b!1032732 () Bool)

(declare-datatypes ((List!21935 0))(
  ( (Nil!21932) (Cons!21931 (h!23133 (_ BitVec 64)) (t!31120 List!21935)) )
))
(declare-fun arrayNoDuplicates!0 (array!64949 (_ BitVec 32) List!21935) Bool)

(assert (=> b!1032732 (= e!583607 (arrayNoDuplicates!0 (_keys!11374 thiss!1427) #b00000000000000000000000000000000 Nil!21932))))

(assert (= (and d!123591 res!690182) b!1032730))

(assert (= (and b!1032730 res!690183) b!1032731))

(assert (= (and b!1032731 res!690184) b!1032732))

(declare-fun m!952313 () Bool)

(assert (=> d!123591 m!952313))

(declare-fun m!952315 () Bool)

(assert (=> b!1032730 m!952315))

(declare-fun m!952317 () Bool)

(assert (=> b!1032731 m!952317))

(declare-fun m!952319 () Bool)

(assert (=> b!1032732 m!952319))

(assert (=> start!90196 d!123591))

(declare-fun b!1032739 () Bool)

(declare-fun e!583613 () Bool)

(assert (=> b!1032739 (= e!583613 tp_is_empty!24469)))

(declare-fun condMapEmpty!38181 () Bool)

(declare-fun mapDefault!38181 () ValueCell!11531)

(assert (=> mapNonEmpty!38172 (= condMapEmpty!38181 (= mapRest!38172 ((as const (Array (_ BitVec 32) ValueCell!11531)) mapDefault!38181)))))

(declare-fun e!583612 () Bool)

(declare-fun mapRes!38181 () Bool)

(assert (=> mapNonEmpty!38172 (= tp!73333 (and e!583612 mapRes!38181))))

(declare-fun mapNonEmpty!38181 () Bool)

(declare-fun tp!73348 () Bool)

(assert (=> mapNonEmpty!38181 (= mapRes!38181 (and tp!73348 e!583613))))

(declare-fun mapKey!38181 () (_ BitVec 32))

(declare-fun mapRest!38181 () (Array (_ BitVec 32) ValueCell!11531))

(declare-fun mapValue!38181 () ValueCell!11531)

(assert (=> mapNonEmpty!38181 (= mapRest!38172 (store mapRest!38181 mapKey!38181 mapValue!38181))))

(declare-fun b!1032740 () Bool)

(assert (=> b!1032740 (= e!583612 tp_is_empty!24469)))

(declare-fun mapIsEmpty!38181 () Bool)

(assert (=> mapIsEmpty!38181 mapRes!38181))

(assert (= (and mapNonEmpty!38172 condMapEmpty!38181) mapIsEmpty!38181))

(assert (= (and mapNonEmpty!38172 (not condMapEmpty!38181)) mapNonEmpty!38181))

(assert (= (and mapNonEmpty!38181 ((_ is ValueCellFull!11531) mapValue!38181)) b!1032739))

(assert (= (and mapNonEmpty!38172 ((_ is ValueCellFull!11531) mapDefault!38181)) b!1032740))

(declare-fun m!952321 () Bool)

(assert (=> mapNonEmpty!38181 m!952321))

(check-sat b_and!33191 (not b_next!20749) tp_is_empty!24469 (not b!1032731) (not d!123591) (not b!1032732) (not b!1032730) (not mapNonEmpty!38181))
(check-sat b_and!33191 (not b_next!20749))
(get-model)

(declare-fun b!1032749 () Bool)

(declare-fun e!583619 () (_ BitVec 32))

(declare-fun e!583618 () (_ BitVec 32))

(assert (=> b!1032749 (= e!583619 e!583618)))

(declare-fun c!104303 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1032749 (= c!104303 (validKeyInArray!0 (select (arr!31272 (_keys!11374 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43594 () Bool)

(declare-fun call!43597 () (_ BitVec 32))

(assert (=> bm!43594 (= call!43597 (arrayCountValidKeys!0 (_keys!11374 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31794 (_keys!11374 thiss!1427))))))

(declare-fun d!123593 () Bool)

(declare-fun lt!455868 () (_ BitVec 32))

(assert (=> d!123593 (and (bvsge lt!455868 #b00000000000000000000000000000000) (bvsle lt!455868 (bvsub (size!31794 (_keys!11374 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!123593 (= lt!455868 e!583619)))

(declare-fun c!104304 () Bool)

(assert (=> d!123593 (= c!104304 (bvsge #b00000000000000000000000000000000 (size!31794 (_keys!11374 thiss!1427))))))

(assert (=> d!123593 (and (bvsle #b00000000000000000000000000000000 (size!31794 (_keys!11374 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31794 (_keys!11374 thiss!1427)) (size!31794 (_keys!11374 thiss!1427))))))

(assert (=> d!123593 (= (arrayCountValidKeys!0 (_keys!11374 thiss!1427) #b00000000000000000000000000000000 (size!31794 (_keys!11374 thiss!1427))) lt!455868)))

(declare-fun b!1032750 () Bool)

(assert (=> b!1032750 (= e!583618 call!43597)))

(declare-fun b!1032751 () Bool)

(assert (=> b!1032751 (= e!583619 #b00000000000000000000000000000000)))

(declare-fun b!1032752 () Bool)

(assert (=> b!1032752 (= e!583618 (bvadd #b00000000000000000000000000000001 call!43597))))

(assert (= (and d!123593 c!104304) b!1032751))

(assert (= (and d!123593 (not c!104304)) b!1032749))

(assert (= (and b!1032749 c!104303) b!1032752))

(assert (= (and b!1032749 (not c!104303)) b!1032750))

(assert (= (or b!1032752 b!1032750) bm!43594))

(declare-fun m!952323 () Bool)

(assert (=> b!1032749 m!952323))

(assert (=> b!1032749 m!952323))

(declare-fun m!952325 () Bool)

(assert (=> b!1032749 m!952325))

(declare-fun m!952327 () Bool)

(assert (=> bm!43594 m!952327))

(assert (=> b!1032730 d!123593))

(declare-fun d!123595 () Bool)

(declare-fun res!690196 () Bool)

(declare-fun e!583622 () Bool)

(assert (=> d!123595 (=> (not res!690196) (not e!583622))))

(assert (=> d!123595 (= res!690196 (validMask!0 (mask!30030 thiss!1427)))))

(assert (=> d!123595 (= (simpleValid!401 thiss!1427) e!583622)))

(declare-fun b!1032762 () Bool)

(declare-fun res!690194 () Bool)

(assert (=> b!1032762 (=> (not res!690194) (not e!583622))))

(declare-fun size!31800 (LongMapFixedSize!5656) (_ BitVec 32))

(assert (=> b!1032762 (= res!690194 (bvsge (size!31800 thiss!1427) (_size!2883 thiss!1427)))))

(declare-fun b!1032761 () Bool)

(declare-fun res!690195 () Bool)

(assert (=> b!1032761 (=> (not res!690195) (not e!583622))))

(assert (=> b!1032761 (= res!690195 (and (= (size!31795 (_values!6225 thiss!1427)) (bvadd (mask!30030 thiss!1427) #b00000000000000000000000000000001)) (= (size!31794 (_keys!11374 thiss!1427)) (size!31795 (_values!6225 thiss!1427))) (bvsge (_size!2883 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2883 thiss!1427) (bvadd (mask!30030 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun b!1032764 () Bool)

(assert (=> b!1032764 (= e!583622 (and (bvsge (extraKeys!5934 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5934 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2883 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1032763 () Bool)

(declare-fun res!690193 () Bool)

(assert (=> b!1032763 (=> (not res!690193) (not e!583622))))

(assert (=> b!1032763 (= res!690193 (= (size!31800 thiss!1427) (bvadd (_size!2883 thiss!1427) (bvsdiv (bvadd (extraKeys!5934 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!123595 res!690196) b!1032761))

(assert (= (and b!1032761 res!690195) b!1032762))

(assert (= (and b!1032762 res!690194) b!1032763))

(assert (= (and b!1032763 res!690193) b!1032764))

(assert (=> d!123595 m!952283))

(declare-fun m!952329 () Bool)

(assert (=> b!1032762 m!952329))

(assert (=> b!1032763 m!952329))

(assert (=> d!123591 d!123595))

(declare-fun d!123597 () Bool)

(declare-fun res!690202 () Bool)

(declare-fun e!583629 () Bool)

(assert (=> d!123597 (=> res!690202 e!583629)))

(assert (=> d!123597 (= res!690202 (bvsge #b00000000000000000000000000000000 (size!31794 (_keys!11374 thiss!1427))))))

(assert (=> d!123597 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11374 thiss!1427) (mask!30030 thiss!1427)) e!583629)))

(declare-fun b!1032773 () Bool)

(declare-fun e!583631 () Bool)

(declare-fun call!43600 () Bool)

(assert (=> b!1032773 (= e!583631 call!43600)))

(declare-fun b!1032774 () Bool)

(assert (=> b!1032774 (= e!583629 e!583631)))

(declare-fun c!104307 () Bool)

(assert (=> b!1032774 (= c!104307 (validKeyInArray!0 (select (arr!31272 (_keys!11374 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1032775 () Bool)

(declare-fun e!583630 () Bool)

(assert (=> b!1032775 (= e!583631 e!583630)))

(declare-fun lt!455875 () (_ BitVec 64))

(assert (=> b!1032775 (= lt!455875 (select (arr!31272 (_keys!11374 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33705 0))(
  ( (Unit!33706) )
))
(declare-fun lt!455877 () Unit!33705)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64949 (_ BitVec 64) (_ BitVec 32)) Unit!33705)

(assert (=> b!1032775 (= lt!455877 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11374 thiss!1427) lt!455875 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!64949 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1032775 (arrayContainsKey!0 (_keys!11374 thiss!1427) lt!455875 #b00000000000000000000000000000000)))

(declare-fun lt!455876 () Unit!33705)

(assert (=> b!1032775 (= lt!455876 lt!455877)))

(declare-fun res!690201 () Bool)

(declare-datatypes ((SeekEntryResult!9725 0))(
  ( (MissingZero!9725 (index!41271 (_ BitVec 32))) (Found!9725 (index!41272 (_ BitVec 32))) (Intermediate!9725 (undefined!10537 Bool) (index!41273 (_ BitVec 32)) (x!92082 (_ BitVec 32))) (Undefined!9725) (MissingVacant!9725 (index!41274 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!64949 (_ BitVec 32)) SeekEntryResult!9725)

(assert (=> b!1032775 (= res!690201 (= (seekEntryOrOpen!0 (select (arr!31272 (_keys!11374 thiss!1427)) #b00000000000000000000000000000000) (_keys!11374 thiss!1427) (mask!30030 thiss!1427)) (Found!9725 #b00000000000000000000000000000000)))))

(assert (=> b!1032775 (=> (not res!690201) (not e!583630))))

(declare-fun b!1032776 () Bool)

(assert (=> b!1032776 (= e!583630 call!43600)))

(declare-fun bm!43597 () Bool)

(assert (=> bm!43597 (= call!43600 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11374 thiss!1427) (mask!30030 thiss!1427)))))

(assert (= (and d!123597 (not res!690202)) b!1032774))

(assert (= (and b!1032774 c!104307) b!1032775))

(assert (= (and b!1032774 (not c!104307)) b!1032773))

(assert (= (and b!1032775 res!690201) b!1032776))

(assert (= (or b!1032776 b!1032773) bm!43597))

(assert (=> b!1032774 m!952323))

(assert (=> b!1032774 m!952323))

(assert (=> b!1032774 m!952325))

(assert (=> b!1032775 m!952323))

(declare-fun m!952331 () Bool)

(assert (=> b!1032775 m!952331))

(declare-fun m!952333 () Bool)

(assert (=> b!1032775 m!952333))

(assert (=> b!1032775 m!952323))

(declare-fun m!952335 () Bool)

(assert (=> b!1032775 m!952335))

(declare-fun m!952337 () Bool)

(assert (=> bm!43597 m!952337))

(assert (=> b!1032731 d!123597))

(declare-fun b!1032787 () Bool)

(declare-fun e!583643 () Bool)

(declare-fun call!43603 () Bool)

(assert (=> b!1032787 (= e!583643 call!43603)))

(declare-fun b!1032788 () Bool)

(declare-fun e!583642 () Bool)

(declare-fun e!583640 () Bool)

(assert (=> b!1032788 (= e!583642 e!583640)))

(declare-fun res!690209 () Bool)

(assert (=> b!1032788 (=> (not res!690209) (not e!583640))))

(declare-fun e!583641 () Bool)

(assert (=> b!1032788 (= res!690209 (not e!583641))))

(declare-fun res!690211 () Bool)

(assert (=> b!1032788 (=> (not res!690211) (not e!583641))))

(assert (=> b!1032788 (= res!690211 (validKeyInArray!0 (select (arr!31272 (_keys!11374 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!123599 () Bool)

(declare-fun res!690210 () Bool)

(assert (=> d!123599 (=> res!690210 e!583642)))

(assert (=> d!123599 (= res!690210 (bvsge #b00000000000000000000000000000000 (size!31794 (_keys!11374 thiss!1427))))))

(assert (=> d!123599 (= (arrayNoDuplicates!0 (_keys!11374 thiss!1427) #b00000000000000000000000000000000 Nil!21932) e!583642)))

(declare-fun b!1032789 () Bool)

(assert (=> b!1032789 (= e!583643 call!43603)))

(declare-fun b!1032790 () Bool)

(declare-fun contains!5989 (List!21935 (_ BitVec 64)) Bool)

(assert (=> b!1032790 (= e!583641 (contains!5989 Nil!21932 (select (arr!31272 (_keys!11374 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43600 () Bool)

(declare-fun c!104310 () Bool)

(assert (=> bm!43600 (= call!43603 (arrayNoDuplicates!0 (_keys!11374 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104310 (Cons!21931 (select (arr!31272 (_keys!11374 thiss!1427)) #b00000000000000000000000000000000) Nil!21932) Nil!21932)))))

(declare-fun b!1032791 () Bool)

(assert (=> b!1032791 (= e!583640 e!583643)))

(assert (=> b!1032791 (= c!104310 (validKeyInArray!0 (select (arr!31272 (_keys!11374 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!123599 (not res!690210)) b!1032788))

(assert (= (and b!1032788 res!690211) b!1032790))

(assert (= (and b!1032788 res!690209) b!1032791))

(assert (= (and b!1032791 c!104310) b!1032789))

(assert (= (and b!1032791 (not c!104310)) b!1032787))

(assert (= (or b!1032789 b!1032787) bm!43600))

(assert (=> b!1032788 m!952323))

(assert (=> b!1032788 m!952323))

(assert (=> b!1032788 m!952325))

(assert (=> b!1032790 m!952323))

(assert (=> b!1032790 m!952323))

(declare-fun m!952339 () Bool)

(assert (=> b!1032790 m!952339))

(assert (=> bm!43600 m!952323))

(declare-fun m!952341 () Bool)

(assert (=> bm!43600 m!952341))

(assert (=> b!1032791 m!952323))

(assert (=> b!1032791 m!952323))

(assert (=> b!1032791 m!952325))

(assert (=> b!1032732 d!123599))

(declare-fun b!1032792 () Bool)

(declare-fun e!583645 () Bool)

(assert (=> b!1032792 (= e!583645 tp_is_empty!24469)))

(declare-fun condMapEmpty!38182 () Bool)

(declare-fun mapDefault!38182 () ValueCell!11531)

(assert (=> mapNonEmpty!38181 (= condMapEmpty!38182 (= mapRest!38181 ((as const (Array (_ BitVec 32) ValueCell!11531)) mapDefault!38182)))))

(declare-fun e!583644 () Bool)

(declare-fun mapRes!38182 () Bool)

(assert (=> mapNonEmpty!38181 (= tp!73348 (and e!583644 mapRes!38182))))

(declare-fun mapNonEmpty!38182 () Bool)

(declare-fun tp!73349 () Bool)

(assert (=> mapNonEmpty!38182 (= mapRes!38182 (and tp!73349 e!583645))))

(declare-fun mapKey!38182 () (_ BitVec 32))

(declare-fun mapValue!38182 () ValueCell!11531)

(declare-fun mapRest!38182 () (Array (_ BitVec 32) ValueCell!11531))

(assert (=> mapNonEmpty!38182 (= mapRest!38181 (store mapRest!38182 mapKey!38182 mapValue!38182))))

(declare-fun b!1032793 () Bool)

(assert (=> b!1032793 (= e!583644 tp_is_empty!24469)))

(declare-fun mapIsEmpty!38182 () Bool)

(assert (=> mapIsEmpty!38182 mapRes!38182))

(assert (= (and mapNonEmpty!38181 condMapEmpty!38182) mapIsEmpty!38182))

(assert (= (and mapNonEmpty!38181 (not condMapEmpty!38182)) mapNonEmpty!38182))

(assert (= (and mapNonEmpty!38182 ((_ is ValueCellFull!11531) mapValue!38182)) b!1032792))

(assert (= (and mapNonEmpty!38181 ((_ is ValueCellFull!11531) mapDefault!38182)) b!1032793))

(declare-fun m!952343 () Bool)

(assert (=> mapNonEmpty!38182 m!952343))

(check-sat b_and!33191 (not b!1032749) (not b!1032762) tp_is_empty!24469 (not mapNonEmpty!38182) (not bm!43600) (not b!1032790) (not b!1032774) (not b!1032763) (not bm!43597) (not b!1032788) (not b!1032791) (not b_next!20749) (not b!1032775) (not bm!43594) (not d!123595))
(check-sat b_and!33191 (not b_next!20749))

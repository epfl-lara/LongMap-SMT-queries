; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90138 () Bool)

(assert start!90138)

(declare-fun b!1032329 () Bool)

(declare-fun b_free!20731 () Bool)

(declare-fun b_next!20731 () Bool)

(assert (=> b!1032329 (= b_free!20731 (not b_next!20731))))

(declare-fun tp!73267 () Bool)

(declare-fun b_and!33173 () Bool)

(assert (=> b!1032329 (= tp!73267 b_and!33173)))

(declare-fun e!583313 () Bool)

(declare-datatypes ((V!37475 0))(
  ( (V!37476 (val!12276 Int)) )
))
(declare-datatypes ((ValueCell!11522 0))(
  ( (ValueCellFull!11522 (v!14852 V!37475)) (EmptyCell!11522) )
))
(declare-datatypes ((array!64907 0))(
  ( (array!64908 (arr!31254 (Array (_ BitVec 32) (_ BitVec 64))) (size!31774 (_ BitVec 32))) )
))
(declare-datatypes ((array!64909 0))(
  ( (array!64910 (arr!31255 (Array (_ BitVec 32) ValueCell!11522)) (size!31775 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5638 0))(
  ( (LongMapFixedSize!5639 (defaultEntry!6193 Int) (mask!30010 (_ BitVec 32)) (extraKeys!5925 (_ BitVec 32)) (zeroValue!6029 V!37475) (minValue!6029 V!37475) (_size!2874 (_ BitVec 32)) (_keys!11363 array!64907) (_values!6216 array!64909) (_vacant!2874 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5638)

(declare-fun tp_is_empty!24451 () Bool)

(declare-fun e!583310 () Bool)

(declare-fun array_inv!24187 (array!64907) Bool)

(declare-fun array_inv!24188 (array!64909) Bool)

(assert (=> b!1032329 (= e!583310 (and tp!73267 tp_is_empty!24451 (array_inv!24187 (_keys!11363 thiss!1427)) (array_inv!24188 (_values!6216 thiss!1427)) e!583313))))

(declare-fun mapIsEmpty!38134 () Bool)

(declare-fun mapRes!38134 () Bool)

(assert (=> mapIsEmpty!38134 mapRes!38134))

(declare-fun res!689994 () Bool)

(declare-fun e!583315 () Bool)

(assert (=> start!90138 (=> (not res!689994) (not e!583315))))

(declare-fun valid!2124 (LongMapFixedSize!5638) Bool)

(assert (=> start!90138 (= res!689994 (valid!2124 thiss!1427))))

(assert (=> start!90138 e!583315))

(assert (=> start!90138 e!583310))

(assert (=> start!90138 true))

(declare-fun mapNonEmpty!38134 () Bool)

(declare-fun tp!73268 () Bool)

(declare-fun e!583314 () Bool)

(assert (=> mapNonEmpty!38134 (= mapRes!38134 (and tp!73268 e!583314))))

(declare-fun mapValue!38134 () ValueCell!11522)

(declare-fun mapKey!38134 () (_ BitVec 32))

(declare-fun mapRest!38134 () (Array (_ BitVec 32) ValueCell!11522))

(assert (=> mapNonEmpty!38134 (= (arr!31255 (_values!6216 thiss!1427)) (store mapRest!38134 mapKey!38134 mapValue!38134))))

(declare-fun b!1032330 () Bool)

(declare-fun e!583312 () Bool)

(assert (=> b!1032330 (= e!583312 tp_is_empty!24451)))

(declare-fun b!1032331 () Bool)

(assert (=> b!1032331 (= e!583315 (not (= (size!31775 (_values!6216 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30010 thiss!1427)))))))

(declare-fun b!1032332 () Bool)

(assert (=> b!1032332 (= e!583314 tp_is_empty!24451)))

(declare-fun b!1032333 () Bool)

(declare-fun res!689993 () Bool)

(assert (=> b!1032333 (=> (not res!689993) (not e!583315))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1032333 (= res!689993 (validMask!0 (mask!30010 thiss!1427)))))

(declare-fun b!1032334 () Bool)

(declare-fun res!689995 () Bool)

(assert (=> b!1032334 (=> (not res!689995) (not e!583315))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1032334 (= res!689995 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1032335 () Bool)

(assert (=> b!1032335 (= e!583313 (and e!583312 mapRes!38134))))

(declare-fun condMapEmpty!38134 () Bool)

(declare-fun mapDefault!38134 () ValueCell!11522)

(assert (=> b!1032335 (= condMapEmpty!38134 (= (arr!31255 (_values!6216 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11522)) mapDefault!38134)))))

(assert (= (and start!90138 res!689994) b!1032334))

(assert (= (and b!1032334 res!689995) b!1032333))

(assert (= (and b!1032333 res!689993) b!1032331))

(assert (= (and b!1032335 condMapEmpty!38134) mapIsEmpty!38134))

(assert (= (and b!1032335 (not condMapEmpty!38134)) mapNonEmpty!38134))

(get-info :version)

(assert (= (and mapNonEmpty!38134 ((_ is ValueCellFull!11522) mapValue!38134)) b!1032332))

(assert (= (and b!1032335 ((_ is ValueCellFull!11522) mapDefault!38134)) b!1032330))

(assert (= b!1032329 b!1032335))

(assert (= start!90138 b!1032329))

(declare-fun m!952119 () Bool)

(assert (=> b!1032329 m!952119))

(declare-fun m!952121 () Bool)

(assert (=> b!1032329 m!952121))

(declare-fun m!952123 () Bool)

(assert (=> start!90138 m!952123))

(declare-fun m!952125 () Bool)

(assert (=> mapNonEmpty!38134 m!952125))

(declare-fun m!952127 () Bool)

(assert (=> b!1032333 m!952127))

(check-sat (not start!90138) (not b_next!20731) tp_is_empty!24451 b_and!33173 (not mapNonEmpty!38134) (not b!1032329) (not b!1032333))
(check-sat b_and!33173 (not b_next!20731))
(get-model)

(declare-fun d!123539 () Bool)

(assert (=> d!123539 (= (array_inv!24187 (_keys!11363 thiss!1427)) (bvsge (size!31774 (_keys!11363 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1032329 d!123539))

(declare-fun d!123541 () Bool)

(assert (=> d!123541 (= (array_inv!24188 (_values!6216 thiss!1427)) (bvsge (size!31775 (_values!6216 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1032329 d!123541))

(declare-fun d!123543 () Bool)

(declare-fun res!690020 () Bool)

(declare-fun e!583354 () Bool)

(assert (=> d!123543 (=> (not res!690020) (not e!583354))))

(declare-fun simpleValid!398 (LongMapFixedSize!5638) Bool)

(assert (=> d!123543 (= res!690020 (simpleValid!398 thiss!1427))))

(assert (=> d!123543 (= (valid!2124 thiss!1427) e!583354)))

(declare-fun b!1032384 () Bool)

(declare-fun res!690021 () Bool)

(assert (=> b!1032384 (=> (not res!690021) (not e!583354))))

(declare-fun arrayCountValidKeys!0 (array!64907 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1032384 (= res!690021 (= (arrayCountValidKeys!0 (_keys!11363 thiss!1427) #b00000000000000000000000000000000 (size!31774 (_keys!11363 thiss!1427))) (_size!2874 thiss!1427)))))

(declare-fun b!1032385 () Bool)

(declare-fun res!690022 () Bool)

(assert (=> b!1032385 (=> (not res!690022) (not e!583354))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64907 (_ BitVec 32)) Bool)

(assert (=> b!1032385 (= res!690022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11363 thiss!1427) (mask!30010 thiss!1427)))))

(declare-fun b!1032386 () Bool)

(declare-datatypes ((List!21932 0))(
  ( (Nil!21929) (Cons!21928 (h!23130 (_ BitVec 64)) (t!31117 List!21932)) )
))
(declare-fun arrayNoDuplicates!0 (array!64907 (_ BitVec 32) List!21932) Bool)

(assert (=> b!1032386 (= e!583354 (arrayNoDuplicates!0 (_keys!11363 thiss!1427) #b00000000000000000000000000000000 Nil!21929))))

(assert (= (and d!123543 res!690020) b!1032384))

(assert (= (and b!1032384 res!690021) b!1032385))

(assert (= (and b!1032385 res!690022) b!1032386))

(declare-fun m!952149 () Bool)

(assert (=> d!123543 m!952149))

(declare-fun m!952151 () Bool)

(assert (=> b!1032384 m!952151))

(declare-fun m!952153 () Bool)

(assert (=> b!1032385 m!952153))

(declare-fun m!952155 () Bool)

(assert (=> b!1032386 m!952155))

(assert (=> start!90138 d!123543))

(declare-fun d!123545 () Bool)

(assert (=> d!123545 (= (validMask!0 (mask!30010 thiss!1427)) (and (or (= (mask!30010 thiss!1427) #b00000000000000000000000000000111) (= (mask!30010 thiss!1427) #b00000000000000000000000000001111) (= (mask!30010 thiss!1427) #b00000000000000000000000000011111) (= (mask!30010 thiss!1427) #b00000000000000000000000000111111) (= (mask!30010 thiss!1427) #b00000000000000000000000001111111) (= (mask!30010 thiss!1427) #b00000000000000000000000011111111) (= (mask!30010 thiss!1427) #b00000000000000000000000111111111) (= (mask!30010 thiss!1427) #b00000000000000000000001111111111) (= (mask!30010 thiss!1427) #b00000000000000000000011111111111) (= (mask!30010 thiss!1427) #b00000000000000000000111111111111) (= (mask!30010 thiss!1427) #b00000000000000000001111111111111) (= (mask!30010 thiss!1427) #b00000000000000000011111111111111) (= (mask!30010 thiss!1427) #b00000000000000000111111111111111) (= (mask!30010 thiss!1427) #b00000000000000001111111111111111) (= (mask!30010 thiss!1427) #b00000000000000011111111111111111) (= (mask!30010 thiss!1427) #b00000000000000111111111111111111) (= (mask!30010 thiss!1427) #b00000000000001111111111111111111) (= (mask!30010 thiss!1427) #b00000000000011111111111111111111) (= (mask!30010 thiss!1427) #b00000000000111111111111111111111) (= (mask!30010 thiss!1427) #b00000000001111111111111111111111) (= (mask!30010 thiss!1427) #b00000000011111111111111111111111) (= (mask!30010 thiss!1427) #b00000000111111111111111111111111) (= (mask!30010 thiss!1427) #b00000001111111111111111111111111) (= (mask!30010 thiss!1427) #b00000011111111111111111111111111) (= (mask!30010 thiss!1427) #b00000111111111111111111111111111) (= (mask!30010 thiss!1427) #b00001111111111111111111111111111) (= (mask!30010 thiss!1427) #b00011111111111111111111111111111) (= (mask!30010 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30010 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1032333 d!123545))

(declare-fun b!1032393 () Bool)

(declare-fun e!583359 () Bool)

(assert (=> b!1032393 (= e!583359 tp_is_empty!24451)))

(declare-fun mapIsEmpty!38143 () Bool)

(declare-fun mapRes!38143 () Bool)

(assert (=> mapIsEmpty!38143 mapRes!38143))

(declare-fun condMapEmpty!38143 () Bool)

(declare-fun mapDefault!38143 () ValueCell!11522)

(assert (=> mapNonEmpty!38134 (= condMapEmpty!38143 (= mapRest!38134 ((as const (Array (_ BitVec 32) ValueCell!11522)) mapDefault!38143)))))

(declare-fun e!583360 () Bool)

(assert (=> mapNonEmpty!38134 (= tp!73268 (and e!583360 mapRes!38143))))

(declare-fun b!1032394 () Bool)

(assert (=> b!1032394 (= e!583360 tp_is_empty!24451)))

(declare-fun mapNonEmpty!38143 () Bool)

(declare-fun tp!73283 () Bool)

(assert (=> mapNonEmpty!38143 (= mapRes!38143 (and tp!73283 e!583359))))

(declare-fun mapValue!38143 () ValueCell!11522)

(declare-fun mapRest!38143 () (Array (_ BitVec 32) ValueCell!11522))

(declare-fun mapKey!38143 () (_ BitVec 32))

(assert (=> mapNonEmpty!38143 (= mapRest!38134 (store mapRest!38143 mapKey!38143 mapValue!38143))))

(assert (= (and mapNonEmpty!38134 condMapEmpty!38143) mapIsEmpty!38143))

(assert (= (and mapNonEmpty!38134 (not condMapEmpty!38143)) mapNonEmpty!38143))

(assert (= (and mapNonEmpty!38143 ((_ is ValueCellFull!11522) mapValue!38143)) b!1032393))

(assert (= (and mapNonEmpty!38134 ((_ is ValueCellFull!11522) mapDefault!38143)) b!1032394))

(declare-fun m!952157 () Bool)

(assert (=> mapNonEmpty!38143 m!952157))

(check-sat (not b!1032385) (not b_next!20731) (not mapNonEmpty!38143) (not d!123543) tp_is_empty!24451 b_and!33173 (not b!1032384) (not b!1032386))
(check-sat b_and!33173 (not b_next!20731))
(get-model)

(declare-fun b!1032405 () Bool)

(declare-fun e!583369 () Bool)

(declare-fun e!583372 () Bool)

(assert (=> b!1032405 (= e!583369 e!583372)))

(declare-fun res!690031 () Bool)

(assert (=> b!1032405 (=> (not res!690031) (not e!583372))))

(declare-fun e!583371 () Bool)

(assert (=> b!1032405 (= res!690031 (not e!583371))))

(declare-fun res!690029 () Bool)

(assert (=> b!1032405 (=> (not res!690029) (not e!583371))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1032405 (= res!690029 (validKeyInArray!0 (select (arr!31254 (_keys!11363 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43576 () Bool)

(declare-fun call!43579 () Bool)

(declare-fun c!104277 () Bool)

(assert (=> bm!43576 (= call!43579 (arrayNoDuplicates!0 (_keys!11363 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104277 (Cons!21928 (select (arr!31254 (_keys!11363 thiss!1427)) #b00000000000000000000000000000000) Nil!21929) Nil!21929)))))

(declare-fun b!1032406 () Bool)

(declare-fun e!583370 () Bool)

(assert (=> b!1032406 (= e!583372 e!583370)))

(assert (=> b!1032406 (= c!104277 (validKeyInArray!0 (select (arr!31254 (_keys!11363 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!123547 () Bool)

(declare-fun res!690030 () Bool)

(assert (=> d!123547 (=> res!690030 e!583369)))

(assert (=> d!123547 (= res!690030 (bvsge #b00000000000000000000000000000000 (size!31774 (_keys!11363 thiss!1427))))))

(assert (=> d!123547 (= (arrayNoDuplicates!0 (_keys!11363 thiss!1427) #b00000000000000000000000000000000 Nil!21929) e!583369)))

(declare-fun b!1032407 () Bool)

(assert (=> b!1032407 (= e!583370 call!43579)))

(declare-fun b!1032408 () Bool)

(assert (=> b!1032408 (= e!583370 call!43579)))

(declare-fun b!1032409 () Bool)

(declare-fun contains!5987 (List!21932 (_ BitVec 64)) Bool)

(assert (=> b!1032409 (= e!583371 (contains!5987 Nil!21929 (select (arr!31254 (_keys!11363 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!123547 (not res!690030)) b!1032405))

(assert (= (and b!1032405 res!690029) b!1032409))

(assert (= (and b!1032405 res!690031) b!1032406))

(assert (= (and b!1032406 c!104277) b!1032407))

(assert (= (and b!1032406 (not c!104277)) b!1032408))

(assert (= (or b!1032407 b!1032408) bm!43576))

(declare-fun m!952159 () Bool)

(assert (=> b!1032405 m!952159))

(assert (=> b!1032405 m!952159))

(declare-fun m!952161 () Bool)

(assert (=> b!1032405 m!952161))

(assert (=> bm!43576 m!952159))

(declare-fun m!952163 () Bool)

(assert (=> bm!43576 m!952163))

(assert (=> b!1032406 m!952159))

(assert (=> b!1032406 m!952159))

(assert (=> b!1032406 m!952161))

(assert (=> b!1032409 m!952159))

(assert (=> b!1032409 m!952159))

(declare-fun m!952165 () Bool)

(assert (=> b!1032409 m!952165))

(assert (=> b!1032386 d!123547))

(declare-fun b!1032418 () Bool)

(declare-fun e!583379 () Bool)

(declare-fun e!583380 () Bool)

(assert (=> b!1032418 (= e!583379 e!583380)))

(declare-fun c!104280 () Bool)

(assert (=> b!1032418 (= c!104280 (validKeyInArray!0 (select (arr!31254 (_keys!11363 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!123549 () Bool)

(declare-fun res!690036 () Bool)

(assert (=> d!123549 (=> res!690036 e!583379)))

(assert (=> d!123549 (= res!690036 (bvsge #b00000000000000000000000000000000 (size!31774 (_keys!11363 thiss!1427))))))

(assert (=> d!123549 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11363 thiss!1427) (mask!30010 thiss!1427)) e!583379)))

(declare-fun b!1032419 () Bool)

(declare-fun e!583381 () Bool)

(declare-fun call!43582 () Bool)

(assert (=> b!1032419 (= e!583381 call!43582)))

(declare-fun bm!43579 () Bool)

(assert (=> bm!43579 (= call!43582 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11363 thiss!1427) (mask!30010 thiss!1427)))))

(declare-fun b!1032420 () Bool)

(assert (=> b!1032420 (= e!583380 e!583381)))

(declare-fun lt!455849 () (_ BitVec 64))

(assert (=> b!1032420 (= lt!455849 (select (arr!31254 (_keys!11363 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33701 0))(
  ( (Unit!33702) )
))
(declare-fun lt!455850 () Unit!33701)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64907 (_ BitVec 64) (_ BitVec 32)) Unit!33701)

(assert (=> b!1032420 (= lt!455850 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11363 thiss!1427) lt!455849 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!64907 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1032420 (arrayContainsKey!0 (_keys!11363 thiss!1427) lt!455849 #b00000000000000000000000000000000)))

(declare-fun lt!455848 () Unit!33701)

(assert (=> b!1032420 (= lt!455848 lt!455850)))

(declare-fun res!690037 () Bool)

(declare-datatypes ((SeekEntryResult!9723 0))(
  ( (MissingZero!9723 (index!41263 (_ BitVec 32))) (Found!9723 (index!41264 (_ BitVec 32))) (Intermediate!9723 (undefined!10535 Bool) (index!41265 (_ BitVec 32)) (x!92020 (_ BitVec 32))) (Undefined!9723) (MissingVacant!9723 (index!41266 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!64907 (_ BitVec 32)) SeekEntryResult!9723)

(assert (=> b!1032420 (= res!690037 (= (seekEntryOrOpen!0 (select (arr!31254 (_keys!11363 thiss!1427)) #b00000000000000000000000000000000) (_keys!11363 thiss!1427) (mask!30010 thiss!1427)) (Found!9723 #b00000000000000000000000000000000)))))

(assert (=> b!1032420 (=> (not res!690037) (not e!583381))))

(declare-fun b!1032421 () Bool)

(assert (=> b!1032421 (= e!583380 call!43582)))

(assert (= (and d!123549 (not res!690036)) b!1032418))

(assert (= (and b!1032418 c!104280) b!1032420))

(assert (= (and b!1032418 (not c!104280)) b!1032421))

(assert (= (and b!1032420 res!690037) b!1032419))

(assert (= (or b!1032419 b!1032421) bm!43579))

(assert (=> b!1032418 m!952159))

(assert (=> b!1032418 m!952159))

(assert (=> b!1032418 m!952161))

(declare-fun m!952167 () Bool)

(assert (=> bm!43579 m!952167))

(assert (=> b!1032420 m!952159))

(declare-fun m!952169 () Bool)

(assert (=> b!1032420 m!952169))

(declare-fun m!952171 () Bool)

(assert (=> b!1032420 m!952171))

(assert (=> b!1032420 m!952159))

(declare-fun m!952173 () Bool)

(assert (=> b!1032420 m!952173))

(assert (=> b!1032385 d!123549))

(declare-fun d!123551 () Bool)

(declare-fun res!690048 () Bool)

(declare-fun e!583384 () Bool)

(assert (=> d!123551 (=> (not res!690048) (not e!583384))))

(assert (=> d!123551 (= res!690048 (validMask!0 (mask!30010 thiss!1427)))))

(assert (=> d!123551 (= (simpleValid!398 thiss!1427) e!583384)))

(declare-fun b!1032432 () Bool)

(declare-fun res!690046 () Bool)

(assert (=> b!1032432 (=> (not res!690046) (not e!583384))))

(declare-fun size!31780 (LongMapFixedSize!5638) (_ BitVec 32))

(assert (=> b!1032432 (= res!690046 (= (size!31780 thiss!1427) (bvadd (_size!2874 thiss!1427) (bvsdiv (bvadd (extraKeys!5925 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1032431 () Bool)

(declare-fun res!690047 () Bool)

(assert (=> b!1032431 (=> (not res!690047) (not e!583384))))

(assert (=> b!1032431 (= res!690047 (bvsge (size!31780 thiss!1427) (_size!2874 thiss!1427)))))

(declare-fun b!1032433 () Bool)

(assert (=> b!1032433 (= e!583384 (and (bvsge (extraKeys!5925 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5925 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2874 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1032430 () Bool)

(declare-fun res!690049 () Bool)

(assert (=> b!1032430 (=> (not res!690049) (not e!583384))))

(assert (=> b!1032430 (= res!690049 (and (= (size!31775 (_values!6216 thiss!1427)) (bvadd (mask!30010 thiss!1427) #b00000000000000000000000000000001)) (= (size!31774 (_keys!11363 thiss!1427)) (size!31775 (_values!6216 thiss!1427))) (bvsge (_size!2874 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2874 thiss!1427) (bvadd (mask!30010 thiss!1427) #b00000000000000000000000000000001))))))

(assert (= (and d!123551 res!690048) b!1032430))

(assert (= (and b!1032430 res!690049) b!1032431))

(assert (= (and b!1032431 res!690047) b!1032432))

(assert (= (and b!1032432 res!690046) b!1032433))

(assert (=> d!123551 m!952127))

(declare-fun m!952175 () Bool)

(assert (=> b!1032432 m!952175))

(assert (=> b!1032431 m!952175))

(assert (=> d!123543 d!123551))

(declare-fun d!123553 () Bool)

(declare-fun lt!455853 () (_ BitVec 32))

(assert (=> d!123553 (and (bvsge lt!455853 #b00000000000000000000000000000000) (bvsle lt!455853 (bvsub (size!31774 (_keys!11363 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!583389 () (_ BitVec 32))

(assert (=> d!123553 (= lt!455853 e!583389)))

(declare-fun c!104285 () Bool)

(assert (=> d!123553 (= c!104285 (bvsge #b00000000000000000000000000000000 (size!31774 (_keys!11363 thiss!1427))))))

(assert (=> d!123553 (and (bvsle #b00000000000000000000000000000000 (size!31774 (_keys!11363 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31774 (_keys!11363 thiss!1427)) (size!31774 (_keys!11363 thiss!1427))))))

(assert (=> d!123553 (= (arrayCountValidKeys!0 (_keys!11363 thiss!1427) #b00000000000000000000000000000000 (size!31774 (_keys!11363 thiss!1427))) lt!455853)))

(declare-fun b!1032442 () Bool)

(assert (=> b!1032442 (= e!583389 #b00000000000000000000000000000000)))

(declare-fun b!1032443 () Bool)

(declare-fun e!583390 () (_ BitVec 32))

(declare-fun call!43585 () (_ BitVec 32))

(assert (=> b!1032443 (= e!583390 call!43585)))

(declare-fun bm!43582 () Bool)

(assert (=> bm!43582 (= call!43585 (arrayCountValidKeys!0 (_keys!11363 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31774 (_keys!11363 thiss!1427))))))

(declare-fun b!1032444 () Bool)

(assert (=> b!1032444 (= e!583389 e!583390)))

(declare-fun c!104286 () Bool)

(assert (=> b!1032444 (= c!104286 (validKeyInArray!0 (select (arr!31254 (_keys!11363 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1032445 () Bool)

(assert (=> b!1032445 (= e!583390 (bvadd #b00000000000000000000000000000001 call!43585))))

(assert (= (and d!123553 c!104285) b!1032442))

(assert (= (and d!123553 (not c!104285)) b!1032444))

(assert (= (and b!1032444 c!104286) b!1032445))

(assert (= (and b!1032444 (not c!104286)) b!1032443))

(assert (= (or b!1032445 b!1032443) bm!43582))

(declare-fun m!952177 () Bool)

(assert (=> bm!43582 m!952177))

(assert (=> b!1032444 m!952159))

(assert (=> b!1032444 m!952159))

(assert (=> b!1032444 m!952161))

(assert (=> b!1032384 d!123553))

(declare-fun b!1032446 () Bool)

(declare-fun e!583391 () Bool)

(assert (=> b!1032446 (= e!583391 tp_is_empty!24451)))

(declare-fun mapIsEmpty!38144 () Bool)

(declare-fun mapRes!38144 () Bool)

(assert (=> mapIsEmpty!38144 mapRes!38144))

(declare-fun condMapEmpty!38144 () Bool)

(declare-fun mapDefault!38144 () ValueCell!11522)

(assert (=> mapNonEmpty!38143 (= condMapEmpty!38144 (= mapRest!38143 ((as const (Array (_ BitVec 32) ValueCell!11522)) mapDefault!38144)))))

(declare-fun e!583392 () Bool)

(assert (=> mapNonEmpty!38143 (= tp!73283 (and e!583392 mapRes!38144))))

(declare-fun b!1032447 () Bool)

(assert (=> b!1032447 (= e!583392 tp_is_empty!24451)))

(declare-fun mapNonEmpty!38144 () Bool)

(declare-fun tp!73284 () Bool)

(assert (=> mapNonEmpty!38144 (= mapRes!38144 (and tp!73284 e!583391))))

(declare-fun mapKey!38144 () (_ BitVec 32))

(declare-fun mapRest!38144 () (Array (_ BitVec 32) ValueCell!11522))

(declare-fun mapValue!38144 () ValueCell!11522)

(assert (=> mapNonEmpty!38144 (= mapRest!38143 (store mapRest!38144 mapKey!38144 mapValue!38144))))

(assert (= (and mapNonEmpty!38143 condMapEmpty!38144) mapIsEmpty!38144))

(assert (= (and mapNonEmpty!38143 (not condMapEmpty!38144)) mapNonEmpty!38144))

(assert (= (and mapNonEmpty!38144 ((_ is ValueCellFull!11522) mapValue!38144)) b!1032446))

(assert (= (and mapNonEmpty!38143 ((_ is ValueCellFull!11522) mapDefault!38144)) b!1032447))

(declare-fun m!952179 () Bool)

(assert (=> mapNonEmpty!38144 m!952179))

(check-sat (not b!1032431) (not b!1032409) (not b!1032432) (not b!1032420) (not bm!43579) (not bm!43582) (not mapNonEmpty!38144) (not d!123551) tp_is_empty!24451 b_and!33173 (not bm!43576) (not b_next!20731) (not b!1032406) (not b!1032444) (not b!1032418) (not b!1032405))
(check-sat b_and!33173 (not b_next!20731))

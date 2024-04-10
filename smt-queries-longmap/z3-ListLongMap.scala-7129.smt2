; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90474 () Bool)

(assert start!90474)

(declare-fun b!1035155 () Bool)

(declare-fun b_free!20829 () Bool)

(declare-fun b_next!20829 () Bool)

(assert (=> b!1035155 (= b_free!20829 (not b_next!20829))))

(declare-fun tp!73606 () Bool)

(declare-fun b_and!33329 () Bool)

(assert (=> b!1035155 (= tp!73606 b_and!33329)))

(declare-fun mapIsEmpty!38326 () Bool)

(declare-fun mapRes!38326 () Bool)

(assert (=> mapIsEmpty!38326 mapRes!38326))

(declare-datatypes ((V!37605 0))(
  ( (V!37606 (val!12325 Int)) )
))
(declare-datatypes ((ValueCell!11571 0))(
  ( (ValueCellFull!11571 (v!14905 V!37605)) (EmptyCell!11571) )
))
(declare-datatypes ((array!65188 0))(
  ( (array!65189 (arr!31383 (Array (_ BitVec 32) (_ BitVec 64))) (size!31909 (_ BitVec 32))) )
))
(declare-datatypes ((array!65190 0))(
  ( (array!65191 (arr!31384 (Array (_ BitVec 32) ValueCell!11571)) (size!31910 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5736 0))(
  ( (LongMapFixedSize!5737 (defaultEntry!6246 Int) (mask!30123 (_ BitVec 32)) (extraKeys!5976 (_ BitVec 32)) (zeroValue!6080 V!37605) (minValue!6082 V!37605) (_size!2923 (_ BitVec 32)) (_keys!11431 array!65188) (_values!6269 array!65190) (_vacant!2923 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5736)

(declare-fun e!585273 () Bool)

(declare-fun tp_is_empty!24549 () Bool)

(declare-fun e!585270 () Bool)

(declare-fun array_inv!24277 (array!65188) Bool)

(declare-fun array_inv!24278 (array!65190) Bool)

(assert (=> b!1035155 (= e!585273 (and tp!73606 tp_is_empty!24549 (array_inv!24277 (_keys!11431 thiss!1427)) (array_inv!24278 (_values!6269 thiss!1427)) e!585270))))

(declare-fun b!1035157 () Bool)

(declare-fun res!691225 () Bool)

(declare-fun e!585268 () Bool)

(assert (=> b!1035157 (=> (not res!691225) (not e!585268))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1035157 (= res!691225 (validMask!0 (mask!30123 thiss!1427)))))

(declare-fun b!1035158 () Bool)

(declare-fun e!585272 () Bool)

(assert (=> b!1035158 (= e!585272 tp_is_empty!24549)))

(declare-fun b!1035159 () Bool)

(declare-fun e!585271 () Bool)

(assert (=> b!1035159 (= e!585271 tp_is_empty!24549)))

(declare-fun mapNonEmpty!38326 () Bool)

(declare-fun tp!73607 () Bool)

(assert (=> mapNonEmpty!38326 (= mapRes!38326 (and tp!73607 e!585272))))

(declare-fun mapRest!38326 () (Array (_ BitVec 32) ValueCell!11571))

(declare-fun mapKey!38326 () (_ BitVec 32))

(declare-fun mapValue!38326 () ValueCell!11571)

(assert (=> mapNonEmpty!38326 (= (arr!31384 (_values!6269 thiss!1427)) (store mapRest!38326 mapKey!38326 mapValue!38326))))

(declare-fun res!691226 () Bool)

(assert (=> start!90474 (=> (not res!691226) (not e!585268))))

(declare-fun valid!2167 (LongMapFixedSize!5736) Bool)

(assert (=> start!90474 (= res!691226 (valid!2167 thiss!1427))))

(assert (=> start!90474 e!585268))

(assert (=> start!90474 e!585273))

(assert (=> start!90474 true))

(declare-fun b!1035156 () Bool)

(assert (=> b!1035156 (= e!585268 (and (= (size!31910 (_values!6269 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30123 thiss!1427))) (= (size!31909 (_keys!11431 thiss!1427)) (size!31910 (_values!6269 thiss!1427))) (bvsge (mask!30123 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5976 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1035160 () Bool)

(assert (=> b!1035160 (= e!585270 (and e!585271 mapRes!38326))))

(declare-fun condMapEmpty!38326 () Bool)

(declare-fun mapDefault!38326 () ValueCell!11571)

(assert (=> b!1035160 (= condMapEmpty!38326 (= (arr!31384 (_values!6269 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11571)) mapDefault!38326)))))

(declare-fun b!1035161 () Bool)

(declare-fun res!691224 () Bool)

(assert (=> b!1035161 (=> (not res!691224) (not e!585268))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1035161 (= res!691224 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!90474 res!691226) b!1035161))

(assert (= (and b!1035161 res!691224) b!1035157))

(assert (= (and b!1035157 res!691225) b!1035156))

(assert (= (and b!1035160 condMapEmpty!38326) mapIsEmpty!38326))

(assert (= (and b!1035160 (not condMapEmpty!38326)) mapNonEmpty!38326))

(get-info :version)

(assert (= (and mapNonEmpty!38326 ((_ is ValueCellFull!11571) mapValue!38326)) b!1035158))

(assert (= (and b!1035160 ((_ is ValueCellFull!11571) mapDefault!38326)) b!1035159))

(assert (= b!1035155 b!1035160))

(assert (= start!90474 b!1035155))

(declare-fun m!955249 () Bool)

(assert (=> b!1035155 m!955249))

(declare-fun m!955251 () Bool)

(assert (=> b!1035155 m!955251))

(declare-fun m!955253 () Bool)

(assert (=> b!1035157 m!955253))

(declare-fun m!955255 () Bool)

(assert (=> mapNonEmpty!38326 m!955255))

(declare-fun m!955257 () Bool)

(assert (=> start!90474 m!955257))

(check-sat (not b!1035155) (not b!1035157) tp_is_empty!24549 (not start!90474) (not mapNonEmpty!38326) (not b_next!20829) b_and!33329)
(check-sat b_and!33329 (not b_next!20829))
(get-model)

(declare-fun d!124489 () Bool)

(declare-fun res!691242 () Bool)

(declare-fun e!585294 () Bool)

(assert (=> d!124489 (=> (not res!691242) (not e!585294))))

(declare-fun simpleValid!410 (LongMapFixedSize!5736) Bool)

(assert (=> d!124489 (= res!691242 (simpleValid!410 thiss!1427))))

(assert (=> d!124489 (= (valid!2167 thiss!1427) e!585294)))

(declare-fun b!1035189 () Bool)

(declare-fun res!691243 () Bool)

(assert (=> b!1035189 (=> (not res!691243) (not e!585294))))

(declare-fun arrayCountValidKeys!0 (array!65188 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1035189 (= res!691243 (= (arrayCountValidKeys!0 (_keys!11431 thiss!1427) #b00000000000000000000000000000000 (size!31909 (_keys!11431 thiss!1427))) (_size!2923 thiss!1427)))))

(declare-fun b!1035190 () Bool)

(declare-fun res!691244 () Bool)

(assert (=> b!1035190 (=> (not res!691244) (not e!585294))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65188 (_ BitVec 32)) Bool)

(assert (=> b!1035190 (= res!691244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11431 thiss!1427) (mask!30123 thiss!1427)))))

(declare-fun b!1035191 () Bool)

(declare-datatypes ((List!21912 0))(
  ( (Nil!21909) (Cons!21908 (h!23110 (_ BitVec 64)) (t!31115 List!21912)) )
))
(declare-fun arrayNoDuplicates!0 (array!65188 (_ BitVec 32) List!21912) Bool)

(assert (=> b!1035191 (= e!585294 (arrayNoDuplicates!0 (_keys!11431 thiss!1427) #b00000000000000000000000000000000 Nil!21909))))

(assert (= (and d!124489 res!691242) b!1035189))

(assert (= (and b!1035189 res!691243) b!1035190))

(assert (= (and b!1035190 res!691244) b!1035191))

(declare-fun m!955269 () Bool)

(assert (=> d!124489 m!955269))

(declare-fun m!955271 () Bool)

(assert (=> b!1035189 m!955271))

(declare-fun m!955273 () Bool)

(assert (=> b!1035190 m!955273))

(declare-fun m!955275 () Bool)

(assert (=> b!1035191 m!955275))

(assert (=> start!90474 d!124489))

(declare-fun d!124491 () Bool)

(assert (=> d!124491 (= (validMask!0 (mask!30123 thiss!1427)) (and (or (= (mask!30123 thiss!1427) #b00000000000000000000000000000111) (= (mask!30123 thiss!1427) #b00000000000000000000000000001111) (= (mask!30123 thiss!1427) #b00000000000000000000000000011111) (= (mask!30123 thiss!1427) #b00000000000000000000000000111111) (= (mask!30123 thiss!1427) #b00000000000000000000000001111111) (= (mask!30123 thiss!1427) #b00000000000000000000000011111111) (= (mask!30123 thiss!1427) #b00000000000000000000000111111111) (= (mask!30123 thiss!1427) #b00000000000000000000001111111111) (= (mask!30123 thiss!1427) #b00000000000000000000011111111111) (= (mask!30123 thiss!1427) #b00000000000000000000111111111111) (= (mask!30123 thiss!1427) #b00000000000000000001111111111111) (= (mask!30123 thiss!1427) #b00000000000000000011111111111111) (= (mask!30123 thiss!1427) #b00000000000000000111111111111111) (= (mask!30123 thiss!1427) #b00000000000000001111111111111111) (= (mask!30123 thiss!1427) #b00000000000000011111111111111111) (= (mask!30123 thiss!1427) #b00000000000000111111111111111111) (= (mask!30123 thiss!1427) #b00000000000001111111111111111111) (= (mask!30123 thiss!1427) #b00000000000011111111111111111111) (= (mask!30123 thiss!1427) #b00000000000111111111111111111111) (= (mask!30123 thiss!1427) #b00000000001111111111111111111111) (= (mask!30123 thiss!1427) #b00000000011111111111111111111111) (= (mask!30123 thiss!1427) #b00000000111111111111111111111111) (= (mask!30123 thiss!1427) #b00000001111111111111111111111111) (= (mask!30123 thiss!1427) #b00000011111111111111111111111111) (= (mask!30123 thiss!1427) #b00000111111111111111111111111111) (= (mask!30123 thiss!1427) #b00001111111111111111111111111111) (= (mask!30123 thiss!1427) #b00011111111111111111111111111111) (= (mask!30123 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30123 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1035157 d!124491))

(declare-fun d!124493 () Bool)

(assert (=> d!124493 (= (array_inv!24277 (_keys!11431 thiss!1427)) (bvsge (size!31909 (_keys!11431 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1035155 d!124493))

(declare-fun d!124495 () Bool)

(assert (=> d!124495 (= (array_inv!24278 (_values!6269 thiss!1427)) (bvsge (size!31910 (_values!6269 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1035155 d!124495))

(declare-fun b!1035198 () Bool)

(declare-fun e!585299 () Bool)

(assert (=> b!1035198 (= e!585299 tp_is_empty!24549)))

(declare-fun mapIsEmpty!38332 () Bool)

(declare-fun mapRes!38332 () Bool)

(assert (=> mapIsEmpty!38332 mapRes!38332))

(declare-fun mapNonEmpty!38332 () Bool)

(declare-fun tp!73616 () Bool)

(assert (=> mapNonEmpty!38332 (= mapRes!38332 (and tp!73616 e!585299))))

(declare-fun mapRest!38332 () (Array (_ BitVec 32) ValueCell!11571))

(declare-fun mapValue!38332 () ValueCell!11571)

(declare-fun mapKey!38332 () (_ BitVec 32))

(assert (=> mapNonEmpty!38332 (= mapRest!38326 (store mapRest!38332 mapKey!38332 mapValue!38332))))

(declare-fun b!1035199 () Bool)

(declare-fun e!585300 () Bool)

(assert (=> b!1035199 (= e!585300 tp_is_empty!24549)))

(declare-fun condMapEmpty!38332 () Bool)

(declare-fun mapDefault!38332 () ValueCell!11571)

(assert (=> mapNonEmpty!38326 (= condMapEmpty!38332 (= mapRest!38326 ((as const (Array (_ BitVec 32) ValueCell!11571)) mapDefault!38332)))))

(assert (=> mapNonEmpty!38326 (= tp!73607 (and e!585300 mapRes!38332))))

(assert (= (and mapNonEmpty!38326 condMapEmpty!38332) mapIsEmpty!38332))

(assert (= (and mapNonEmpty!38326 (not condMapEmpty!38332)) mapNonEmpty!38332))

(assert (= (and mapNonEmpty!38332 ((_ is ValueCellFull!11571) mapValue!38332)) b!1035198))

(assert (= (and mapNonEmpty!38326 ((_ is ValueCellFull!11571) mapDefault!38332)) b!1035199))

(declare-fun m!955277 () Bool)

(assert (=> mapNonEmpty!38332 m!955277))

(check-sat (not b!1035191) (not b!1035190) (not b_next!20829) (not b!1035189) (not mapNonEmpty!38332) b_and!33329 tp_is_empty!24549 (not d!124489))
(check-sat b_and!33329 (not b_next!20829))
(get-model)

(declare-fun b!1035208 () Bool)

(declare-fun e!585308 () Bool)

(declare-fun e!585307 () Bool)

(assert (=> b!1035208 (= e!585308 e!585307)))

(declare-fun c!104715 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1035208 (= c!104715 (validKeyInArray!0 (select (arr!31383 (_keys!11431 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1035209 () Bool)

(declare-fun e!585309 () Bool)

(assert (=> b!1035209 (= e!585307 e!585309)))

(declare-fun lt!456741 () (_ BitVec 64))

(assert (=> b!1035209 (= lt!456741 (select (arr!31383 (_keys!11431 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33886 0))(
  ( (Unit!33887) )
))
(declare-fun lt!456740 () Unit!33886)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65188 (_ BitVec 64) (_ BitVec 32)) Unit!33886)

(assert (=> b!1035209 (= lt!456740 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11431 thiss!1427) lt!456741 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65188 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1035209 (arrayContainsKey!0 (_keys!11431 thiss!1427) lt!456741 #b00000000000000000000000000000000)))

(declare-fun lt!456739 () Unit!33886)

(assert (=> b!1035209 (= lt!456739 lt!456740)))

(declare-fun res!691249 () Bool)

(declare-datatypes ((SeekEntryResult!9742 0))(
  ( (MissingZero!9742 (index!41339 (_ BitVec 32))) (Found!9742 (index!41340 (_ BitVec 32))) (Intermediate!9742 (undefined!10554 Bool) (index!41341 (_ BitVec 32)) (x!92341 (_ BitVec 32))) (Undefined!9742) (MissingVacant!9742 (index!41342 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65188 (_ BitVec 32)) SeekEntryResult!9742)

(assert (=> b!1035209 (= res!691249 (= (seekEntryOrOpen!0 (select (arr!31383 (_keys!11431 thiss!1427)) #b00000000000000000000000000000000) (_keys!11431 thiss!1427) (mask!30123 thiss!1427)) (Found!9742 #b00000000000000000000000000000000)))))

(assert (=> b!1035209 (=> (not res!691249) (not e!585309))))

(declare-fun b!1035210 () Bool)

(declare-fun call!43776 () Bool)

(assert (=> b!1035210 (= e!585309 call!43776)))

(declare-fun b!1035211 () Bool)

(assert (=> b!1035211 (= e!585307 call!43776)))

(declare-fun d!124497 () Bool)

(declare-fun res!691250 () Bool)

(assert (=> d!124497 (=> res!691250 e!585308)))

(assert (=> d!124497 (= res!691250 (bvsge #b00000000000000000000000000000000 (size!31909 (_keys!11431 thiss!1427))))))

(assert (=> d!124497 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11431 thiss!1427) (mask!30123 thiss!1427)) e!585308)))

(declare-fun bm!43773 () Bool)

(assert (=> bm!43773 (= call!43776 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11431 thiss!1427) (mask!30123 thiss!1427)))))

(assert (= (and d!124497 (not res!691250)) b!1035208))

(assert (= (and b!1035208 c!104715) b!1035209))

(assert (= (and b!1035208 (not c!104715)) b!1035211))

(assert (= (and b!1035209 res!691249) b!1035210))

(assert (= (or b!1035210 b!1035211) bm!43773))

(declare-fun m!955279 () Bool)

(assert (=> b!1035208 m!955279))

(assert (=> b!1035208 m!955279))

(declare-fun m!955281 () Bool)

(assert (=> b!1035208 m!955281))

(assert (=> b!1035209 m!955279))

(declare-fun m!955283 () Bool)

(assert (=> b!1035209 m!955283))

(declare-fun m!955285 () Bool)

(assert (=> b!1035209 m!955285))

(assert (=> b!1035209 m!955279))

(declare-fun m!955287 () Bool)

(assert (=> b!1035209 m!955287))

(declare-fun m!955289 () Bool)

(assert (=> bm!43773 m!955289))

(assert (=> b!1035190 d!124497))

(declare-fun b!1035222 () Bool)

(declare-fun e!585319 () Bool)

(declare-fun e!585321 () Bool)

(assert (=> b!1035222 (= e!585319 e!585321)))

(declare-fun c!104718 () Bool)

(assert (=> b!1035222 (= c!104718 (validKeyInArray!0 (select (arr!31383 (_keys!11431 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43776 () Bool)

(declare-fun call!43779 () Bool)

(assert (=> bm!43776 (= call!43779 (arrayNoDuplicates!0 (_keys!11431 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104718 (Cons!21908 (select (arr!31383 (_keys!11431 thiss!1427)) #b00000000000000000000000000000000) Nil!21909) Nil!21909)))))

(declare-fun b!1035223 () Bool)

(assert (=> b!1035223 (= e!585321 call!43779)))

(declare-fun d!124499 () Bool)

(declare-fun res!691259 () Bool)

(declare-fun e!585318 () Bool)

(assert (=> d!124499 (=> res!691259 e!585318)))

(assert (=> d!124499 (= res!691259 (bvsge #b00000000000000000000000000000000 (size!31909 (_keys!11431 thiss!1427))))))

(assert (=> d!124499 (= (arrayNoDuplicates!0 (_keys!11431 thiss!1427) #b00000000000000000000000000000000 Nil!21909) e!585318)))

(declare-fun b!1035224 () Bool)

(assert (=> b!1035224 (= e!585318 e!585319)))

(declare-fun res!691257 () Bool)

(assert (=> b!1035224 (=> (not res!691257) (not e!585319))))

(declare-fun e!585320 () Bool)

(assert (=> b!1035224 (= res!691257 (not e!585320))))

(declare-fun res!691258 () Bool)

(assert (=> b!1035224 (=> (not res!691258) (not e!585320))))

(assert (=> b!1035224 (= res!691258 (validKeyInArray!0 (select (arr!31383 (_keys!11431 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1035225 () Bool)

(declare-fun contains!6018 (List!21912 (_ BitVec 64)) Bool)

(assert (=> b!1035225 (= e!585320 (contains!6018 Nil!21909 (select (arr!31383 (_keys!11431 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1035226 () Bool)

(assert (=> b!1035226 (= e!585321 call!43779)))

(assert (= (and d!124499 (not res!691259)) b!1035224))

(assert (= (and b!1035224 res!691258) b!1035225))

(assert (= (and b!1035224 res!691257) b!1035222))

(assert (= (and b!1035222 c!104718) b!1035223))

(assert (= (and b!1035222 (not c!104718)) b!1035226))

(assert (= (or b!1035223 b!1035226) bm!43776))

(assert (=> b!1035222 m!955279))

(assert (=> b!1035222 m!955279))

(assert (=> b!1035222 m!955281))

(assert (=> bm!43776 m!955279))

(declare-fun m!955291 () Bool)

(assert (=> bm!43776 m!955291))

(assert (=> b!1035224 m!955279))

(assert (=> b!1035224 m!955279))

(assert (=> b!1035224 m!955281))

(assert (=> b!1035225 m!955279))

(assert (=> b!1035225 m!955279))

(declare-fun m!955293 () Bool)

(assert (=> b!1035225 m!955293))

(assert (=> b!1035191 d!124499))

(declare-fun b!1035235 () Bool)

(declare-fun e!585327 () (_ BitVec 32))

(declare-fun call!43782 () (_ BitVec 32))

(assert (=> b!1035235 (= e!585327 (bvadd #b00000000000000000000000000000001 call!43782))))

(declare-fun b!1035236 () Bool)

(declare-fun e!585326 () (_ BitVec 32))

(assert (=> b!1035236 (= e!585326 e!585327)))

(declare-fun c!104724 () Bool)

(assert (=> b!1035236 (= c!104724 (validKeyInArray!0 (select (arr!31383 (_keys!11431 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1035237 () Bool)

(assert (=> b!1035237 (= e!585326 #b00000000000000000000000000000000)))

(declare-fun b!1035238 () Bool)

(assert (=> b!1035238 (= e!585327 call!43782)))

(declare-fun bm!43779 () Bool)

(assert (=> bm!43779 (= call!43782 (arrayCountValidKeys!0 (_keys!11431 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31909 (_keys!11431 thiss!1427))))))

(declare-fun d!124501 () Bool)

(declare-fun lt!456744 () (_ BitVec 32))

(assert (=> d!124501 (and (bvsge lt!456744 #b00000000000000000000000000000000) (bvsle lt!456744 (bvsub (size!31909 (_keys!11431 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!124501 (= lt!456744 e!585326)))

(declare-fun c!104723 () Bool)

(assert (=> d!124501 (= c!104723 (bvsge #b00000000000000000000000000000000 (size!31909 (_keys!11431 thiss!1427))))))

(assert (=> d!124501 (and (bvsle #b00000000000000000000000000000000 (size!31909 (_keys!11431 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31909 (_keys!11431 thiss!1427)) (size!31909 (_keys!11431 thiss!1427))))))

(assert (=> d!124501 (= (arrayCountValidKeys!0 (_keys!11431 thiss!1427) #b00000000000000000000000000000000 (size!31909 (_keys!11431 thiss!1427))) lt!456744)))

(assert (= (and d!124501 c!104723) b!1035237))

(assert (= (and d!124501 (not c!104723)) b!1035236))

(assert (= (and b!1035236 c!104724) b!1035235))

(assert (= (and b!1035236 (not c!104724)) b!1035238))

(assert (= (or b!1035235 b!1035238) bm!43779))

(assert (=> b!1035236 m!955279))

(assert (=> b!1035236 m!955279))

(assert (=> b!1035236 m!955281))

(declare-fun m!955295 () Bool)

(assert (=> bm!43779 m!955295))

(assert (=> b!1035189 d!124501))

(declare-fun d!124503 () Bool)

(declare-fun res!691268 () Bool)

(declare-fun e!585330 () Bool)

(assert (=> d!124503 (=> (not res!691268) (not e!585330))))

(assert (=> d!124503 (= res!691268 (validMask!0 (mask!30123 thiss!1427)))))

(assert (=> d!124503 (= (simpleValid!410 thiss!1427) e!585330)))

(declare-fun b!1035248 () Bool)

(declare-fun res!691271 () Bool)

(assert (=> b!1035248 (=> (not res!691271) (not e!585330))))

(declare-fun size!31913 (LongMapFixedSize!5736) (_ BitVec 32))

(assert (=> b!1035248 (= res!691271 (bvsge (size!31913 thiss!1427) (_size!2923 thiss!1427)))))

(declare-fun b!1035247 () Bool)

(declare-fun res!691269 () Bool)

(assert (=> b!1035247 (=> (not res!691269) (not e!585330))))

(assert (=> b!1035247 (= res!691269 (and (= (size!31910 (_values!6269 thiss!1427)) (bvadd (mask!30123 thiss!1427) #b00000000000000000000000000000001)) (= (size!31909 (_keys!11431 thiss!1427)) (size!31910 (_values!6269 thiss!1427))) (bvsge (_size!2923 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2923 thiss!1427) (bvadd (mask!30123 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun b!1035249 () Bool)

(declare-fun res!691270 () Bool)

(assert (=> b!1035249 (=> (not res!691270) (not e!585330))))

(assert (=> b!1035249 (= res!691270 (= (size!31913 thiss!1427) (bvadd (_size!2923 thiss!1427) (bvsdiv (bvadd (extraKeys!5976 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1035250 () Bool)

(assert (=> b!1035250 (= e!585330 (and (bvsge (extraKeys!5976 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5976 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2923 thiss!1427) #b00000000000000000000000000000000)))))

(assert (= (and d!124503 res!691268) b!1035247))

(assert (= (and b!1035247 res!691269) b!1035248))

(assert (= (and b!1035248 res!691271) b!1035249))

(assert (= (and b!1035249 res!691270) b!1035250))

(assert (=> d!124503 m!955253))

(declare-fun m!955297 () Bool)

(assert (=> b!1035248 m!955297))

(assert (=> b!1035249 m!955297))

(assert (=> d!124489 d!124503))

(declare-fun b!1035251 () Bool)

(declare-fun e!585331 () Bool)

(assert (=> b!1035251 (= e!585331 tp_is_empty!24549)))

(declare-fun mapIsEmpty!38333 () Bool)

(declare-fun mapRes!38333 () Bool)

(assert (=> mapIsEmpty!38333 mapRes!38333))

(declare-fun mapNonEmpty!38333 () Bool)

(declare-fun tp!73617 () Bool)

(assert (=> mapNonEmpty!38333 (= mapRes!38333 (and tp!73617 e!585331))))

(declare-fun mapValue!38333 () ValueCell!11571)

(declare-fun mapKey!38333 () (_ BitVec 32))

(declare-fun mapRest!38333 () (Array (_ BitVec 32) ValueCell!11571))

(assert (=> mapNonEmpty!38333 (= mapRest!38332 (store mapRest!38333 mapKey!38333 mapValue!38333))))

(declare-fun b!1035252 () Bool)

(declare-fun e!585332 () Bool)

(assert (=> b!1035252 (= e!585332 tp_is_empty!24549)))

(declare-fun condMapEmpty!38333 () Bool)

(declare-fun mapDefault!38333 () ValueCell!11571)

(assert (=> mapNonEmpty!38332 (= condMapEmpty!38333 (= mapRest!38332 ((as const (Array (_ BitVec 32) ValueCell!11571)) mapDefault!38333)))))

(assert (=> mapNonEmpty!38332 (= tp!73616 (and e!585332 mapRes!38333))))

(assert (= (and mapNonEmpty!38332 condMapEmpty!38333) mapIsEmpty!38333))

(assert (= (and mapNonEmpty!38332 (not condMapEmpty!38333)) mapNonEmpty!38333))

(assert (= (and mapNonEmpty!38333 ((_ is ValueCellFull!11571) mapValue!38333)) b!1035251))

(assert (= (and mapNonEmpty!38332 ((_ is ValueCellFull!11571) mapDefault!38333)) b!1035252))

(declare-fun m!955299 () Bool)

(assert (=> mapNonEmpty!38333 m!955299))

(check-sat (not b!1035222) (not d!124503) (not b!1035248) tp_is_empty!24549 (not b!1035224) (not b!1035236) (not b!1035225) (not b!1035249) (not b!1035208) b_and!33329 (not bm!43776) (not bm!43779) (not bm!43773) (not b_next!20829) (not b!1035209) (not mapNonEmpty!38333))
(check-sat b_and!33329 (not b_next!20829))

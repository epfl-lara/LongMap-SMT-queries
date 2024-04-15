; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90470 () Bool)

(assert start!90470)

(declare-fun b!1034987 () Bool)

(declare-fun b_free!20827 () Bool)

(declare-fun b_next!20827 () Bool)

(assert (=> b!1034987 (= b_free!20827 (not b_next!20827))))

(declare-fun tp!73601 () Bool)

(declare-fun b_and!33301 () Bool)

(assert (=> b!1034987 (= tp!73601 b_and!33301)))

(declare-fun b!1034984 () Bool)

(declare-fun e!585162 () Bool)

(declare-fun tp_is_empty!24547 () Bool)

(assert (=> b!1034984 (= e!585162 tp_is_empty!24547)))

(declare-fun b!1034985 () Bool)

(declare-fun e!585161 () Bool)

(assert (=> b!1034985 (= e!585161 tp_is_empty!24547)))

(declare-fun b!1034986 () Bool)

(declare-fun res!691150 () Bool)

(declare-fun e!585159 () Bool)

(assert (=> b!1034986 (=> (not res!691150) (not e!585159))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1034986 (= res!691150 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!585163 () Bool)

(declare-datatypes ((V!37603 0))(
  ( (V!37604 (val!12324 Int)) )
))
(declare-datatypes ((ValueCell!11570 0))(
  ( (ValueCellFull!11570 (v!14903 V!37603)) (EmptyCell!11570) )
))
(declare-datatypes ((array!65123 0))(
  ( (array!65124 (arr!31350 (Array (_ BitVec 32) (_ BitVec 64))) (size!31878 (_ BitVec 32))) )
))
(declare-datatypes ((array!65125 0))(
  ( (array!65126 (arr!31351 (Array (_ BitVec 32) ValueCell!11570)) (size!31879 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5734 0))(
  ( (LongMapFixedSize!5735 (defaultEntry!6245 Int) (mask!30117 (_ BitVec 32)) (extraKeys!5975 (_ BitVec 32)) (zeroValue!6079 V!37603) (minValue!6081 V!37603) (_size!2922 (_ BitVec 32)) (_keys!11426 array!65123) (_values!6268 array!65125) (_vacant!2922 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5734)

(declare-fun e!585164 () Bool)

(declare-fun array_inv!24251 (array!65123) Bool)

(declare-fun array_inv!24252 (array!65125) Bool)

(assert (=> b!1034987 (= e!585164 (and tp!73601 tp_is_empty!24547 (array_inv!24251 (_keys!11426 thiss!1427)) (array_inv!24252 (_values!6268 thiss!1427)) e!585163))))

(declare-fun mapNonEmpty!38323 () Bool)

(declare-fun mapRes!38323 () Bool)

(declare-fun tp!73600 () Bool)

(assert (=> mapNonEmpty!38323 (= mapRes!38323 (and tp!73600 e!585161))))

(declare-fun mapRest!38323 () (Array (_ BitVec 32) ValueCell!11570))

(declare-fun mapKey!38323 () (_ BitVec 32))

(declare-fun mapValue!38323 () ValueCell!11570)

(assert (=> mapNonEmpty!38323 (= (arr!31351 (_values!6268 thiss!1427)) (store mapRest!38323 mapKey!38323 mapValue!38323))))

(declare-fun mapIsEmpty!38323 () Bool)

(assert (=> mapIsEmpty!38323 mapRes!38323))

(declare-fun b!1034988 () Bool)

(assert (=> b!1034988 (= e!585159 (and (= (size!31879 (_values!6268 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30117 thiss!1427))) (= (size!31878 (_keys!11426 thiss!1427)) (size!31879 (_values!6268 thiss!1427))) (bvsge (mask!30117 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5975 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1034989 () Bool)

(declare-fun res!691149 () Bool)

(assert (=> b!1034989 (=> (not res!691149) (not e!585159))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1034989 (= res!691149 (validMask!0 (mask!30117 thiss!1427)))))

(declare-fun b!1034983 () Bool)

(assert (=> b!1034983 (= e!585163 (and e!585162 mapRes!38323))))

(declare-fun condMapEmpty!38323 () Bool)

(declare-fun mapDefault!38323 () ValueCell!11570)

(assert (=> b!1034983 (= condMapEmpty!38323 (= (arr!31351 (_values!6268 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11570)) mapDefault!38323)))))

(declare-fun res!691148 () Bool)

(assert (=> start!90470 (=> (not res!691148) (not e!585159))))

(declare-fun valid!2154 (LongMapFixedSize!5734) Bool)

(assert (=> start!90470 (= res!691148 (valid!2154 thiss!1427))))

(assert (=> start!90470 e!585159))

(assert (=> start!90470 e!585164))

(assert (=> start!90470 true))

(assert (= (and start!90470 res!691148) b!1034986))

(assert (= (and b!1034986 res!691150) b!1034989))

(assert (= (and b!1034989 res!691149) b!1034988))

(assert (= (and b!1034983 condMapEmpty!38323) mapIsEmpty!38323))

(assert (= (and b!1034983 (not condMapEmpty!38323)) mapNonEmpty!38323))

(get-info :version)

(assert (= (and mapNonEmpty!38323 ((_ is ValueCellFull!11570) mapValue!38323)) b!1034985))

(assert (= (and b!1034983 ((_ is ValueCellFull!11570) mapDefault!38323)) b!1034984))

(assert (= b!1034987 b!1034983))

(assert (= start!90470 b!1034987))

(declare-fun m!954619 () Bool)

(assert (=> b!1034987 m!954619))

(declare-fun m!954621 () Bool)

(assert (=> b!1034987 m!954621))

(declare-fun m!954623 () Bool)

(assert (=> mapNonEmpty!38323 m!954623))

(declare-fun m!954625 () Bool)

(assert (=> b!1034989 m!954625))

(declare-fun m!954627 () Bool)

(assert (=> start!90470 m!954627))

(check-sat tp_is_empty!24547 (not mapNonEmpty!38323) (not b!1034989) (not start!90470) (not b_next!20827) b_and!33301 (not b!1034987))
(check-sat b_and!33301 (not b_next!20827))
(get-model)

(declare-fun d!124339 () Bool)

(assert (=> d!124339 (= (array_inv!24251 (_keys!11426 thiss!1427)) (bvsge (size!31878 (_keys!11426 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1034987 d!124339))

(declare-fun d!124341 () Bool)

(assert (=> d!124341 (= (array_inv!24252 (_values!6268 thiss!1427)) (bvsge (size!31879 (_values!6268 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1034987 d!124341))

(declare-fun d!124343 () Bool)

(assert (=> d!124343 (= (validMask!0 (mask!30117 thiss!1427)) (and (or (= (mask!30117 thiss!1427) #b00000000000000000000000000000111) (= (mask!30117 thiss!1427) #b00000000000000000000000000001111) (= (mask!30117 thiss!1427) #b00000000000000000000000000011111) (= (mask!30117 thiss!1427) #b00000000000000000000000000111111) (= (mask!30117 thiss!1427) #b00000000000000000000000001111111) (= (mask!30117 thiss!1427) #b00000000000000000000000011111111) (= (mask!30117 thiss!1427) #b00000000000000000000000111111111) (= (mask!30117 thiss!1427) #b00000000000000000000001111111111) (= (mask!30117 thiss!1427) #b00000000000000000000011111111111) (= (mask!30117 thiss!1427) #b00000000000000000000111111111111) (= (mask!30117 thiss!1427) #b00000000000000000001111111111111) (= (mask!30117 thiss!1427) #b00000000000000000011111111111111) (= (mask!30117 thiss!1427) #b00000000000000000111111111111111) (= (mask!30117 thiss!1427) #b00000000000000001111111111111111) (= (mask!30117 thiss!1427) #b00000000000000011111111111111111) (= (mask!30117 thiss!1427) #b00000000000000111111111111111111) (= (mask!30117 thiss!1427) #b00000000000001111111111111111111) (= (mask!30117 thiss!1427) #b00000000000011111111111111111111) (= (mask!30117 thiss!1427) #b00000000000111111111111111111111) (= (mask!30117 thiss!1427) #b00000000001111111111111111111111) (= (mask!30117 thiss!1427) #b00000000011111111111111111111111) (= (mask!30117 thiss!1427) #b00000000111111111111111111111111) (= (mask!30117 thiss!1427) #b00000001111111111111111111111111) (= (mask!30117 thiss!1427) #b00000011111111111111111111111111) (= (mask!30117 thiss!1427) #b00000111111111111111111111111111) (= (mask!30117 thiss!1427) #b00001111111111111111111111111111) (= (mask!30117 thiss!1427) #b00011111111111111111111111111111) (= (mask!30117 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30117 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1034989 d!124343))

(declare-fun d!124345 () Bool)

(declare-fun res!691175 () Bool)

(declare-fun e!585203 () Bool)

(assert (=> d!124345 (=> (not res!691175) (not e!585203))))

(declare-fun simpleValid!410 (LongMapFixedSize!5734) Bool)

(assert (=> d!124345 (= res!691175 (simpleValid!410 thiss!1427))))

(assert (=> d!124345 (= (valid!2154 thiss!1427) e!585203)))

(declare-fun b!1035038 () Bool)

(declare-fun res!691176 () Bool)

(assert (=> b!1035038 (=> (not res!691176) (not e!585203))))

(declare-fun arrayCountValidKeys!0 (array!65123 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1035038 (= res!691176 (= (arrayCountValidKeys!0 (_keys!11426 thiss!1427) #b00000000000000000000000000000000 (size!31878 (_keys!11426 thiss!1427))) (_size!2922 thiss!1427)))))

(declare-fun b!1035039 () Bool)

(declare-fun res!691177 () Bool)

(assert (=> b!1035039 (=> (not res!691177) (not e!585203))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65123 (_ BitVec 32)) Bool)

(assert (=> b!1035039 (= res!691177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11426 thiss!1427) (mask!30117 thiss!1427)))))

(declare-fun b!1035040 () Bool)

(declare-datatypes ((List!21946 0))(
  ( (Nil!21943) (Cons!21942 (h!23144 (_ BitVec 64)) (t!31140 List!21946)) )
))
(declare-fun arrayNoDuplicates!0 (array!65123 (_ BitVec 32) List!21946) Bool)

(assert (=> b!1035040 (= e!585203 (arrayNoDuplicates!0 (_keys!11426 thiss!1427) #b00000000000000000000000000000000 Nil!21943))))

(assert (= (and d!124345 res!691175) b!1035038))

(assert (= (and b!1035038 res!691176) b!1035039))

(assert (= (and b!1035039 res!691177) b!1035040))

(declare-fun m!954649 () Bool)

(assert (=> d!124345 m!954649))

(declare-fun m!954651 () Bool)

(assert (=> b!1035038 m!954651))

(declare-fun m!954653 () Bool)

(assert (=> b!1035039 m!954653))

(declare-fun m!954655 () Bool)

(assert (=> b!1035040 m!954655))

(assert (=> start!90470 d!124345))

(declare-fun b!1035047 () Bool)

(declare-fun e!585209 () Bool)

(assert (=> b!1035047 (= e!585209 tp_is_empty!24547)))

(declare-fun mapNonEmpty!38332 () Bool)

(declare-fun mapRes!38332 () Bool)

(declare-fun tp!73616 () Bool)

(assert (=> mapNonEmpty!38332 (= mapRes!38332 (and tp!73616 e!585209))))

(declare-fun mapKey!38332 () (_ BitVec 32))

(declare-fun mapRest!38332 () (Array (_ BitVec 32) ValueCell!11570))

(declare-fun mapValue!38332 () ValueCell!11570)

(assert (=> mapNonEmpty!38332 (= mapRest!38323 (store mapRest!38332 mapKey!38332 mapValue!38332))))

(declare-fun b!1035048 () Bool)

(declare-fun e!585208 () Bool)

(assert (=> b!1035048 (= e!585208 tp_is_empty!24547)))

(declare-fun condMapEmpty!38332 () Bool)

(declare-fun mapDefault!38332 () ValueCell!11570)

(assert (=> mapNonEmpty!38323 (= condMapEmpty!38332 (= mapRest!38323 ((as const (Array (_ BitVec 32) ValueCell!11570)) mapDefault!38332)))))

(assert (=> mapNonEmpty!38323 (= tp!73600 (and e!585208 mapRes!38332))))

(declare-fun mapIsEmpty!38332 () Bool)

(assert (=> mapIsEmpty!38332 mapRes!38332))

(assert (= (and mapNonEmpty!38323 condMapEmpty!38332) mapIsEmpty!38332))

(assert (= (and mapNonEmpty!38323 (not condMapEmpty!38332)) mapNonEmpty!38332))

(assert (= (and mapNonEmpty!38332 ((_ is ValueCellFull!11570) mapValue!38332)) b!1035047))

(assert (= (and mapNonEmpty!38323 ((_ is ValueCellFull!11570) mapDefault!38332)) b!1035048))

(declare-fun m!954657 () Bool)

(assert (=> mapNonEmpty!38332 m!954657))

(check-sat (not b_next!20827) (not b!1035039) (not d!124345) tp_is_empty!24547 b_and!33301 (not b!1035038) (not mapNonEmpty!38332) (not b!1035040))
(check-sat b_and!33301 (not b_next!20827))
(get-model)

(declare-fun b!1035059 () Bool)

(declare-fun e!585218 () Bool)

(declare-fun call!43753 () Bool)

(assert (=> b!1035059 (= e!585218 call!43753)))

(declare-fun b!1035060 () Bool)

(declare-fun e!585221 () Bool)

(declare-fun contains!5998 (List!21946 (_ BitVec 64)) Bool)

(assert (=> b!1035060 (= e!585221 (contains!5998 Nil!21943 (select (arr!31350 (_keys!11426 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1035061 () Bool)

(assert (=> b!1035061 (= e!585218 call!43753)))

(declare-fun b!1035062 () Bool)

(declare-fun e!585220 () Bool)

(assert (=> b!1035062 (= e!585220 e!585218)))

(declare-fun c!104676 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1035062 (= c!104676 (validKeyInArray!0 (select (arr!31350 (_keys!11426 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1035063 () Bool)

(declare-fun e!585219 () Bool)

(assert (=> b!1035063 (= e!585219 e!585220)))

(declare-fun res!691185 () Bool)

(assert (=> b!1035063 (=> (not res!691185) (not e!585220))))

(assert (=> b!1035063 (= res!691185 (not e!585221))))

(declare-fun res!691184 () Bool)

(assert (=> b!1035063 (=> (not res!691184) (not e!585221))))

(assert (=> b!1035063 (= res!691184 (validKeyInArray!0 (select (arr!31350 (_keys!11426 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!124347 () Bool)

(declare-fun res!691186 () Bool)

(assert (=> d!124347 (=> res!691186 e!585219)))

(assert (=> d!124347 (= res!691186 (bvsge #b00000000000000000000000000000000 (size!31878 (_keys!11426 thiss!1427))))))

(assert (=> d!124347 (= (arrayNoDuplicates!0 (_keys!11426 thiss!1427) #b00000000000000000000000000000000 Nil!21943) e!585219)))

(declare-fun bm!43750 () Bool)

(assert (=> bm!43750 (= call!43753 (arrayNoDuplicates!0 (_keys!11426 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104676 (Cons!21942 (select (arr!31350 (_keys!11426 thiss!1427)) #b00000000000000000000000000000000) Nil!21943) Nil!21943)))))

(assert (= (and d!124347 (not res!691186)) b!1035063))

(assert (= (and b!1035063 res!691184) b!1035060))

(assert (= (and b!1035063 res!691185) b!1035062))

(assert (= (and b!1035062 c!104676) b!1035059))

(assert (= (and b!1035062 (not c!104676)) b!1035061))

(assert (= (or b!1035059 b!1035061) bm!43750))

(declare-fun m!954659 () Bool)

(assert (=> b!1035060 m!954659))

(assert (=> b!1035060 m!954659))

(declare-fun m!954661 () Bool)

(assert (=> b!1035060 m!954661))

(assert (=> b!1035062 m!954659))

(assert (=> b!1035062 m!954659))

(declare-fun m!954663 () Bool)

(assert (=> b!1035062 m!954663))

(assert (=> b!1035063 m!954659))

(assert (=> b!1035063 m!954659))

(assert (=> b!1035063 m!954663))

(assert (=> bm!43750 m!954659))

(declare-fun m!954665 () Bool)

(assert (=> bm!43750 m!954665))

(assert (=> b!1035040 d!124347))

(declare-fun b!1035072 () Bool)

(declare-fun e!585228 () Bool)

(declare-fun call!43756 () Bool)

(assert (=> b!1035072 (= e!585228 call!43756)))

(declare-fun b!1035073 () Bool)

(declare-fun e!585229 () Bool)

(assert (=> b!1035073 (= e!585229 call!43756)))

(declare-fun b!1035074 () Bool)

(declare-fun e!585230 () Bool)

(assert (=> b!1035074 (= e!585230 e!585228)))

(declare-fun c!104679 () Bool)

(assert (=> b!1035074 (= c!104679 (validKeyInArray!0 (select (arr!31350 (_keys!11426 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1035075 () Bool)

(assert (=> b!1035075 (= e!585228 e!585229)))

(declare-fun lt!456540 () (_ BitVec 64))

(assert (=> b!1035075 (= lt!456540 (select (arr!31350 (_keys!11426 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33766 0))(
  ( (Unit!33767) )
))
(declare-fun lt!456539 () Unit!33766)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65123 (_ BitVec 64) (_ BitVec 32)) Unit!33766)

(assert (=> b!1035075 (= lt!456539 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11426 thiss!1427) lt!456540 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65123 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1035075 (arrayContainsKey!0 (_keys!11426 thiss!1427) lt!456540 #b00000000000000000000000000000000)))

(declare-fun lt!456541 () Unit!33766)

(assert (=> b!1035075 (= lt!456541 lt!456539)))

(declare-fun res!691191 () Bool)

(declare-datatypes ((SeekEntryResult!9733 0))(
  ( (MissingZero!9733 (index!41303 (_ BitVec 32))) (Found!9733 (index!41304 (_ BitVec 32))) (Intermediate!9733 (undefined!10545 Bool) (index!41305 (_ BitVec 32)) (x!92329 (_ BitVec 32))) (Undefined!9733) (MissingVacant!9733 (index!41306 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65123 (_ BitVec 32)) SeekEntryResult!9733)

(assert (=> b!1035075 (= res!691191 (= (seekEntryOrOpen!0 (select (arr!31350 (_keys!11426 thiss!1427)) #b00000000000000000000000000000000) (_keys!11426 thiss!1427) (mask!30117 thiss!1427)) (Found!9733 #b00000000000000000000000000000000)))))

(assert (=> b!1035075 (=> (not res!691191) (not e!585229))))

(declare-fun d!124349 () Bool)

(declare-fun res!691192 () Bool)

(assert (=> d!124349 (=> res!691192 e!585230)))

(assert (=> d!124349 (= res!691192 (bvsge #b00000000000000000000000000000000 (size!31878 (_keys!11426 thiss!1427))))))

(assert (=> d!124349 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11426 thiss!1427) (mask!30117 thiss!1427)) e!585230)))

(declare-fun bm!43753 () Bool)

(assert (=> bm!43753 (= call!43756 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11426 thiss!1427) (mask!30117 thiss!1427)))))

(assert (= (and d!124349 (not res!691192)) b!1035074))

(assert (= (and b!1035074 c!104679) b!1035075))

(assert (= (and b!1035074 (not c!104679)) b!1035072))

(assert (= (and b!1035075 res!691191) b!1035073))

(assert (= (or b!1035073 b!1035072) bm!43753))

(assert (=> b!1035074 m!954659))

(assert (=> b!1035074 m!954659))

(assert (=> b!1035074 m!954663))

(assert (=> b!1035075 m!954659))

(declare-fun m!954667 () Bool)

(assert (=> b!1035075 m!954667))

(declare-fun m!954669 () Bool)

(assert (=> b!1035075 m!954669))

(assert (=> b!1035075 m!954659))

(declare-fun m!954671 () Bool)

(assert (=> b!1035075 m!954671))

(declare-fun m!954673 () Bool)

(assert (=> bm!43753 m!954673))

(assert (=> b!1035039 d!124349))

(declare-fun b!1035084 () Bool)

(declare-fun res!691201 () Bool)

(declare-fun e!585233 () Bool)

(assert (=> b!1035084 (=> (not res!691201) (not e!585233))))

(assert (=> b!1035084 (= res!691201 (and (= (size!31879 (_values!6268 thiss!1427)) (bvadd (mask!30117 thiss!1427) #b00000000000000000000000000000001)) (= (size!31878 (_keys!11426 thiss!1427)) (size!31879 (_values!6268 thiss!1427))) (bvsge (_size!2922 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2922 thiss!1427) (bvadd (mask!30117 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun b!1035087 () Bool)

(assert (=> b!1035087 (= e!585233 (and (bvsge (extraKeys!5975 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5975 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2922 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1035085 () Bool)

(declare-fun res!691202 () Bool)

(assert (=> b!1035085 (=> (not res!691202) (not e!585233))))

(declare-fun size!31884 (LongMapFixedSize!5734) (_ BitVec 32))

(assert (=> b!1035085 (= res!691202 (bvsge (size!31884 thiss!1427) (_size!2922 thiss!1427)))))

(declare-fun b!1035086 () Bool)

(declare-fun res!691203 () Bool)

(assert (=> b!1035086 (=> (not res!691203) (not e!585233))))

(assert (=> b!1035086 (= res!691203 (= (size!31884 thiss!1427) (bvadd (_size!2922 thiss!1427) (bvsdiv (bvadd (extraKeys!5975 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!124351 () Bool)

(declare-fun res!691204 () Bool)

(assert (=> d!124351 (=> (not res!691204) (not e!585233))))

(assert (=> d!124351 (= res!691204 (validMask!0 (mask!30117 thiss!1427)))))

(assert (=> d!124351 (= (simpleValid!410 thiss!1427) e!585233)))

(assert (= (and d!124351 res!691204) b!1035084))

(assert (= (and b!1035084 res!691201) b!1035085))

(assert (= (and b!1035085 res!691202) b!1035086))

(assert (= (and b!1035086 res!691203) b!1035087))

(declare-fun m!954675 () Bool)

(assert (=> b!1035085 m!954675))

(assert (=> b!1035086 m!954675))

(assert (=> d!124351 m!954625))

(assert (=> d!124345 d!124351))

(declare-fun b!1035096 () Bool)

(declare-fun e!585239 () (_ BitVec 32))

(declare-fun call!43759 () (_ BitVec 32))

(assert (=> b!1035096 (= e!585239 (bvadd #b00000000000000000000000000000001 call!43759))))

(declare-fun bm!43756 () Bool)

(assert (=> bm!43756 (= call!43759 (arrayCountValidKeys!0 (_keys!11426 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31878 (_keys!11426 thiss!1427))))))

(declare-fun d!124353 () Bool)

(declare-fun lt!456544 () (_ BitVec 32))

(assert (=> d!124353 (and (bvsge lt!456544 #b00000000000000000000000000000000) (bvsle lt!456544 (bvsub (size!31878 (_keys!11426 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!585238 () (_ BitVec 32))

(assert (=> d!124353 (= lt!456544 e!585238)))

(declare-fun c!104684 () Bool)

(assert (=> d!124353 (= c!104684 (bvsge #b00000000000000000000000000000000 (size!31878 (_keys!11426 thiss!1427))))))

(assert (=> d!124353 (and (bvsle #b00000000000000000000000000000000 (size!31878 (_keys!11426 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31878 (_keys!11426 thiss!1427)) (size!31878 (_keys!11426 thiss!1427))))))

(assert (=> d!124353 (= (arrayCountValidKeys!0 (_keys!11426 thiss!1427) #b00000000000000000000000000000000 (size!31878 (_keys!11426 thiss!1427))) lt!456544)))

(declare-fun b!1035097 () Bool)

(assert (=> b!1035097 (= e!585239 call!43759)))

(declare-fun b!1035098 () Bool)

(assert (=> b!1035098 (= e!585238 #b00000000000000000000000000000000)))

(declare-fun b!1035099 () Bool)

(assert (=> b!1035099 (= e!585238 e!585239)))

(declare-fun c!104685 () Bool)

(assert (=> b!1035099 (= c!104685 (validKeyInArray!0 (select (arr!31350 (_keys!11426 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!124353 c!104684) b!1035098))

(assert (= (and d!124353 (not c!104684)) b!1035099))

(assert (= (and b!1035099 c!104685) b!1035096))

(assert (= (and b!1035099 (not c!104685)) b!1035097))

(assert (= (or b!1035096 b!1035097) bm!43756))

(declare-fun m!954677 () Bool)

(assert (=> bm!43756 m!954677))

(assert (=> b!1035099 m!954659))

(assert (=> b!1035099 m!954659))

(assert (=> b!1035099 m!954663))

(assert (=> b!1035038 d!124353))

(declare-fun b!1035100 () Bool)

(declare-fun e!585241 () Bool)

(assert (=> b!1035100 (= e!585241 tp_is_empty!24547)))

(declare-fun mapNonEmpty!38333 () Bool)

(declare-fun mapRes!38333 () Bool)

(declare-fun tp!73617 () Bool)

(assert (=> mapNonEmpty!38333 (= mapRes!38333 (and tp!73617 e!585241))))

(declare-fun mapRest!38333 () (Array (_ BitVec 32) ValueCell!11570))

(declare-fun mapValue!38333 () ValueCell!11570)

(declare-fun mapKey!38333 () (_ BitVec 32))

(assert (=> mapNonEmpty!38333 (= mapRest!38332 (store mapRest!38333 mapKey!38333 mapValue!38333))))

(declare-fun b!1035101 () Bool)

(declare-fun e!585240 () Bool)

(assert (=> b!1035101 (= e!585240 tp_is_empty!24547)))

(declare-fun condMapEmpty!38333 () Bool)

(declare-fun mapDefault!38333 () ValueCell!11570)

(assert (=> mapNonEmpty!38332 (= condMapEmpty!38333 (= mapRest!38332 ((as const (Array (_ BitVec 32) ValueCell!11570)) mapDefault!38333)))))

(assert (=> mapNonEmpty!38332 (= tp!73616 (and e!585240 mapRes!38333))))

(declare-fun mapIsEmpty!38333 () Bool)

(assert (=> mapIsEmpty!38333 mapRes!38333))

(assert (= (and mapNonEmpty!38332 condMapEmpty!38333) mapIsEmpty!38333))

(assert (= (and mapNonEmpty!38332 (not condMapEmpty!38333)) mapNonEmpty!38333))

(assert (= (and mapNonEmpty!38333 ((_ is ValueCellFull!11570) mapValue!38333)) b!1035100))

(assert (= (and mapNonEmpty!38332 ((_ is ValueCellFull!11570) mapDefault!38333)) b!1035101))

(declare-fun m!954679 () Bool)

(assert (=> mapNonEmpty!38333 m!954679))

(check-sat (not b!1035063) (not b!1035086) (not b!1035060) b_and!33301 (not b!1035074) (not b!1035062) (not b!1035075) (not mapNonEmpty!38333) tp_is_empty!24547 (not bm!43756) (not bm!43750) (not b_next!20827) (not b!1035099) (not d!124351) (not b!1035085) (not bm!43753))
(check-sat b_and!33301 (not b_next!20827))

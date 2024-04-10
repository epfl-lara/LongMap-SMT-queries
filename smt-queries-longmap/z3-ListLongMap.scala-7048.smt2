; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89318 () Bool)

(assert start!89318)

(declare-fun b!1024040 () Bool)

(declare-fun b_free!20343 () Bool)

(declare-fun b_next!20343 () Bool)

(assert (=> b!1024040 (= b_free!20343 (not b_next!20343))))

(declare-fun tp!72067 () Bool)

(declare-fun b_and!32589 () Bool)

(assert (=> b!1024040 (= tp!72067 b_and!32589)))

(declare-fun res!685680 () Bool)

(declare-fun e!577162 () Bool)

(assert (=> start!89318 (=> (not res!685680) (not e!577162))))

(declare-datatypes ((V!36957 0))(
  ( (V!36958 (val!12082 Int)) )
))
(declare-datatypes ((ValueCell!11328 0))(
  ( (ValueCellFull!11328 (v!14651 V!36957)) (EmptyCell!11328) )
))
(declare-datatypes ((array!64172 0))(
  ( (array!64173 (arr!30897 (Array (_ BitVec 32) (_ BitVec 64))) (size!31409 (_ BitVec 32))) )
))
(declare-datatypes ((array!64174 0))(
  ( (array!64175 (arr!30898 (Array (_ BitVec 32) ValueCell!11328)) (size!31410 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5250 0))(
  ( (LongMapFixedSize!5251 (defaultEntry!5977 Int) (mask!29616 (_ BitVec 32)) (extraKeys!5709 (_ BitVec 32)) (zeroValue!5813 V!36957) (minValue!5813 V!36957) (_size!2680 (_ BitVec 32)) (_keys!11123 array!64172) (_values!6000 array!64174) (_vacant!2680 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5250)

(declare-fun valid!2000 (LongMapFixedSize!5250) Bool)

(assert (=> start!89318 (= res!685680 (valid!2000 thiss!1427))))

(assert (=> start!89318 e!577162))

(declare-fun e!577163 () Bool)

(assert (=> start!89318 e!577163))

(assert (=> start!89318 true))

(declare-fun b!1024034 () Bool)

(declare-fun e!577165 () Bool)

(declare-fun tp_is_empty!24063 () Bool)

(assert (=> b!1024034 (= e!577165 tp_is_empty!24063)))

(declare-fun b!1024035 () Bool)

(declare-fun e!577161 () Bool)

(assert (=> b!1024035 (= e!577161 tp_is_empty!24063)))

(declare-fun mapNonEmpty!37516 () Bool)

(declare-fun mapRes!37516 () Bool)

(declare-fun tp!72068 () Bool)

(assert (=> mapNonEmpty!37516 (= mapRes!37516 (and tp!72068 e!577161))))

(declare-fun mapRest!37516 () (Array (_ BitVec 32) ValueCell!11328))

(declare-fun mapKey!37516 () (_ BitVec 32))

(declare-fun mapValue!37516 () ValueCell!11328)

(assert (=> mapNonEmpty!37516 (= (arr!30898 (_values!6000 thiss!1427)) (store mapRest!37516 mapKey!37516 mapValue!37516))))

(declare-fun b!1024036 () Bool)

(assert (=> b!1024036 (= e!577162 (not (= (size!31409 (_keys!11123 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29616 thiss!1427)))))))

(declare-fun b!1024037 () Bool)

(declare-fun res!685682 () Bool)

(assert (=> b!1024037 (=> (not res!685682) (not e!577162))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1024037 (= res!685682 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!37516 () Bool)

(assert (=> mapIsEmpty!37516 mapRes!37516))

(declare-fun b!1024038 () Bool)

(declare-fun e!577166 () Bool)

(assert (=> b!1024038 (= e!577166 (and e!577165 mapRes!37516))))

(declare-fun condMapEmpty!37516 () Bool)

(declare-fun mapDefault!37516 () ValueCell!11328)

(assert (=> b!1024038 (= condMapEmpty!37516 (= (arr!30898 (_values!6000 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11328)) mapDefault!37516)))))

(declare-fun b!1024039 () Bool)

(declare-fun res!685681 () Bool)

(assert (=> b!1024039 (=> (not res!685681) (not e!577162))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1024039 (= res!685681 (validMask!0 (mask!29616 thiss!1427)))))

(declare-fun array_inv!23937 (array!64172) Bool)

(declare-fun array_inv!23938 (array!64174) Bool)

(assert (=> b!1024040 (= e!577163 (and tp!72067 tp_is_empty!24063 (array_inv!23937 (_keys!11123 thiss!1427)) (array_inv!23938 (_values!6000 thiss!1427)) e!577166))))

(assert (= (and start!89318 res!685680) b!1024037))

(assert (= (and b!1024037 res!685682) b!1024039))

(assert (= (and b!1024039 res!685681) b!1024036))

(assert (= (and b!1024038 condMapEmpty!37516) mapIsEmpty!37516))

(assert (= (and b!1024038 (not condMapEmpty!37516)) mapNonEmpty!37516))

(get-info :version)

(assert (= (and mapNonEmpty!37516 ((_ is ValueCellFull!11328) mapValue!37516)) b!1024035))

(assert (= (and b!1024038 ((_ is ValueCellFull!11328) mapDefault!37516)) b!1024034))

(assert (= b!1024040 b!1024038))

(assert (= start!89318 b!1024040))

(declare-fun m!942545 () Bool)

(assert (=> start!89318 m!942545))

(declare-fun m!942547 () Bool)

(assert (=> mapNonEmpty!37516 m!942547))

(declare-fun m!942549 () Bool)

(assert (=> b!1024039 m!942549))

(declare-fun m!942551 () Bool)

(assert (=> b!1024040 m!942551))

(declare-fun m!942553 () Bool)

(assert (=> b!1024040 m!942553))

(check-sat (not b_next!20343) (not mapNonEmpty!37516) (not b!1024039) (not start!89318) b_and!32589 (not b!1024040) tp_is_empty!24063)
(check-sat b_and!32589 (not b_next!20343))
(get-model)

(declare-fun d!122605 () Bool)

(assert (=> d!122605 (= (validMask!0 (mask!29616 thiss!1427)) (and (or (= (mask!29616 thiss!1427) #b00000000000000000000000000000111) (= (mask!29616 thiss!1427) #b00000000000000000000000000001111) (= (mask!29616 thiss!1427) #b00000000000000000000000000011111) (= (mask!29616 thiss!1427) #b00000000000000000000000000111111) (= (mask!29616 thiss!1427) #b00000000000000000000000001111111) (= (mask!29616 thiss!1427) #b00000000000000000000000011111111) (= (mask!29616 thiss!1427) #b00000000000000000000000111111111) (= (mask!29616 thiss!1427) #b00000000000000000000001111111111) (= (mask!29616 thiss!1427) #b00000000000000000000011111111111) (= (mask!29616 thiss!1427) #b00000000000000000000111111111111) (= (mask!29616 thiss!1427) #b00000000000000000001111111111111) (= (mask!29616 thiss!1427) #b00000000000000000011111111111111) (= (mask!29616 thiss!1427) #b00000000000000000111111111111111) (= (mask!29616 thiss!1427) #b00000000000000001111111111111111) (= (mask!29616 thiss!1427) #b00000000000000011111111111111111) (= (mask!29616 thiss!1427) #b00000000000000111111111111111111) (= (mask!29616 thiss!1427) #b00000000000001111111111111111111) (= (mask!29616 thiss!1427) #b00000000000011111111111111111111) (= (mask!29616 thiss!1427) #b00000000000111111111111111111111) (= (mask!29616 thiss!1427) #b00000000001111111111111111111111) (= (mask!29616 thiss!1427) #b00000000011111111111111111111111) (= (mask!29616 thiss!1427) #b00000000111111111111111111111111) (= (mask!29616 thiss!1427) #b00000001111111111111111111111111) (= (mask!29616 thiss!1427) #b00000011111111111111111111111111) (= (mask!29616 thiss!1427) #b00000111111111111111111111111111) (= (mask!29616 thiss!1427) #b00001111111111111111111111111111) (= (mask!29616 thiss!1427) #b00011111111111111111111111111111) (= (mask!29616 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!29616 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1024039 d!122605))

(declare-fun d!122607 () Bool)

(assert (=> d!122607 (= (array_inv!23937 (_keys!11123 thiss!1427)) (bvsge (size!31409 (_keys!11123 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1024040 d!122607))

(declare-fun d!122609 () Bool)

(assert (=> d!122609 (= (array_inv!23938 (_values!6000 thiss!1427)) (bvsge (size!31410 (_values!6000 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1024040 d!122609))

(declare-fun d!122611 () Bool)

(declare-fun res!685698 () Bool)

(declare-fun e!577187 () Bool)

(assert (=> d!122611 (=> (not res!685698) (not e!577187))))

(declare-fun simpleValid!388 (LongMapFixedSize!5250) Bool)

(assert (=> d!122611 (= res!685698 (simpleValid!388 thiss!1427))))

(assert (=> d!122611 (= (valid!2000 thiss!1427) e!577187)))

(declare-fun b!1024068 () Bool)

(declare-fun res!685699 () Bool)

(assert (=> b!1024068 (=> (not res!685699) (not e!577187))))

(declare-fun arrayCountValidKeys!0 (array!64172 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1024068 (= res!685699 (= (arrayCountValidKeys!0 (_keys!11123 thiss!1427) #b00000000000000000000000000000000 (size!31409 (_keys!11123 thiss!1427))) (_size!2680 thiss!1427)))))

(declare-fun b!1024069 () Bool)

(declare-fun res!685700 () Bool)

(assert (=> b!1024069 (=> (not res!685700) (not e!577187))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64172 (_ BitVec 32)) Bool)

(assert (=> b!1024069 (= res!685700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11123 thiss!1427) (mask!29616 thiss!1427)))))

(declare-fun b!1024070 () Bool)

(declare-datatypes ((List!21725 0))(
  ( (Nil!21722) (Cons!21721 (h!22919 (_ BitVec 64)) (t!30787 List!21725)) )
))
(declare-fun arrayNoDuplicates!0 (array!64172 (_ BitVec 32) List!21725) Bool)

(assert (=> b!1024070 (= e!577187 (arrayNoDuplicates!0 (_keys!11123 thiss!1427) #b00000000000000000000000000000000 Nil!21722))))

(assert (= (and d!122611 res!685698) b!1024068))

(assert (= (and b!1024068 res!685699) b!1024069))

(assert (= (and b!1024069 res!685700) b!1024070))

(declare-fun m!942565 () Bool)

(assert (=> d!122611 m!942565))

(declare-fun m!942567 () Bool)

(assert (=> b!1024068 m!942567))

(declare-fun m!942569 () Bool)

(assert (=> b!1024069 m!942569))

(declare-fun m!942571 () Bool)

(assert (=> b!1024070 m!942571))

(assert (=> start!89318 d!122611))

(declare-fun condMapEmpty!37522 () Bool)

(declare-fun mapDefault!37522 () ValueCell!11328)

(assert (=> mapNonEmpty!37516 (= condMapEmpty!37522 (= mapRest!37516 ((as const (Array (_ BitVec 32) ValueCell!11328)) mapDefault!37522)))))

(declare-fun e!577193 () Bool)

(declare-fun mapRes!37522 () Bool)

(assert (=> mapNonEmpty!37516 (= tp!72068 (and e!577193 mapRes!37522))))

(declare-fun b!1024077 () Bool)

(declare-fun e!577192 () Bool)

(assert (=> b!1024077 (= e!577192 tp_is_empty!24063)))

(declare-fun b!1024078 () Bool)

(assert (=> b!1024078 (= e!577193 tp_is_empty!24063)))

(declare-fun mapIsEmpty!37522 () Bool)

(assert (=> mapIsEmpty!37522 mapRes!37522))

(declare-fun mapNonEmpty!37522 () Bool)

(declare-fun tp!72077 () Bool)

(assert (=> mapNonEmpty!37522 (= mapRes!37522 (and tp!72077 e!577192))))

(declare-fun mapKey!37522 () (_ BitVec 32))

(declare-fun mapRest!37522 () (Array (_ BitVec 32) ValueCell!11328))

(declare-fun mapValue!37522 () ValueCell!11328)

(assert (=> mapNonEmpty!37522 (= mapRest!37516 (store mapRest!37522 mapKey!37522 mapValue!37522))))

(assert (= (and mapNonEmpty!37516 condMapEmpty!37522) mapIsEmpty!37522))

(assert (= (and mapNonEmpty!37516 (not condMapEmpty!37522)) mapNonEmpty!37522))

(assert (= (and mapNonEmpty!37522 ((_ is ValueCellFull!11328) mapValue!37522)) b!1024077))

(assert (= (and mapNonEmpty!37516 ((_ is ValueCellFull!11328) mapDefault!37522)) b!1024078))

(declare-fun m!942573 () Bool)

(assert (=> mapNonEmpty!37522 m!942573))

(check-sat (not b_next!20343) tp_is_empty!24063 (not b!1024070) b_and!32589 (not mapNonEmpty!37522) (not d!122611) (not b!1024069) (not b!1024068))
(check-sat b_and!32589 (not b_next!20343))
(get-model)

(declare-fun bm!43233 () Bool)

(declare-fun call!43236 () (_ BitVec 32))

(assert (=> bm!43233 (= call!43236 (arrayCountValidKeys!0 (_keys!11123 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31409 (_keys!11123 thiss!1427))))))

(declare-fun b!1024087 () Bool)

(declare-fun e!577198 () (_ BitVec 32))

(assert (=> b!1024087 (= e!577198 call!43236)))

(declare-fun b!1024088 () Bool)

(assert (=> b!1024088 (= e!577198 (bvadd #b00000000000000000000000000000001 call!43236))))

(declare-fun d!122613 () Bool)

(declare-fun lt!450552 () (_ BitVec 32))

(assert (=> d!122613 (and (bvsge lt!450552 #b00000000000000000000000000000000) (bvsle lt!450552 (bvsub (size!31409 (_keys!11123 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!577199 () (_ BitVec 32))

(assert (=> d!122613 (= lt!450552 e!577199)))

(declare-fun c!103564 () Bool)

(assert (=> d!122613 (= c!103564 (bvsge #b00000000000000000000000000000000 (size!31409 (_keys!11123 thiss!1427))))))

(assert (=> d!122613 (and (bvsle #b00000000000000000000000000000000 (size!31409 (_keys!11123 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31409 (_keys!11123 thiss!1427)) (size!31409 (_keys!11123 thiss!1427))))))

(assert (=> d!122613 (= (arrayCountValidKeys!0 (_keys!11123 thiss!1427) #b00000000000000000000000000000000 (size!31409 (_keys!11123 thiss!1427))) lt!450552)))

(declare-fun b!1024089 () Bool)

(assert (=> b!1024089 (= e!577199 #b00000000000000000000000000000000)))

(declare-fun b!1024090 () Bool)

(assert (=> b!1024090 (= e!577199 e!577198)))

(declare-fun c!103563 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1024090 (= c!103563 (validKeyInArray!0 (select (arr!30897 (_keys!11123 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!122613 c!103564) b!1024089))

(assert (= (and d!122613 (not c!103564)) b!1024090))

(assert (= (and b!1024090 c!103563) b!1024088))

(assert (= (and b!1024090 (not c!103563)) b!1024087))

(assert (= (or b!1024088 b!1024087) bm!43233))

(declare-fun m!942575 () Bool)

(assert (=> bm!43233 m!942575))

(declare-fun m!942577 () Bool)

(assert (=> b!1024090 m!942577))

(assert (=> b!1024090 m!942577))

(declare-fun m!942579 () Bool)

(assert (=> b!1024090 m!942579))

(assert (=> b!1024068 d!122613))

(declare-fun b!1024099 () Bool)

(declare-fun res!685711 () Bool)

(declare-fun e!577202 () Bool)

(assert (=> b!1024099 (=> (not res!685711) (not e!577202))))

(assert (=> b!1024099 (= res!685711 (and (= (size!31410 (_values!6000 thiss!1427)) (bvadd (mask!29616 thiss!1427) #b00000000000000000000000000000001)) (= (size!31409 (_keys!11123 thiss!1427)) (size!31410 (_values!6000 thiss!1427))) (bvsge (_size!2680 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2680 thiss!1427) (bvadd (mask!29616 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun b!1024101 () Bool)

(declare-fun res!685712 () Bool)

(assert (=> b!1024101 (=> (not res!685712) (not e!577202))))

(declare-fun size!31413 (LongMapFixedSize!5250) (_ BitVec 32))

(assert (=> b!1024101 (= res!685712 (= (size!31413 thiss!1427) (bvadd (_size!2680 thiss!1427) (bvsdiv (bvadd (extraKeys!5709 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1024102 () Bool)

(assert (=> b!1024102 (= e!577202 (and (bvsge (extraKeys!5709 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5709 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2680 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1024100 () Bool)

(declare-fun res!685710 () Bool)

(assert (=> b!1024100 (=> (not res!685710) (not e!577202))))

(assert (=> b!1024100 (= res!685710 (bvsge (size!31413 thiss!1427) (_size!2680 thiss!1427)))))

(declare-fun d!122615 () Bool)

(declare-fun res!685709 () Bool)

(assert (=> d!122615 (=> (not res!685709) (not e!577202))))

(assert (=> d!122615 (= res!685709 (validMask!0 (mask!29616 thiss!1427)))))

(assert (=> d!122615 (= (simpleValid!388 thiss!1427) e!577202)))

(assert (= (and d!122615 res!685709) b!1024099))

(assert (= (and b!1024099 res!685711) b!1024100))

(assert (= (and b!1024100 res!685710) b!1024101))

(assert (= (and b!1024101 res!685712) b!1024102))

(declare-fun m!942581 () Bool)

(assert (=> b!1024101 m!942581))

(assert (=> b!1024100 m!942581))

(assert (=> d!122615 m!942549))

(assert (=> d!122611 d!122615))

(declare-fun b!1024111 () Bool)

(declare-fun e!577210 () Bool)

(declare-fun e!577209 () Bool)

(assert (=> b!1024111 (= e!577210 e!577209)))

(declare-fun lt!450559 () (_ BitVec 64))

(assert (=> b!1024111 (= lt!450559 (select (arr!30897 (_keys!11123 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33343 0))(
  ( (Unit!33344) )
))
(declare-fun lt!450561 () Unit!33343)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!64172 (_ BitVec 64) (_ BitVec 32)) Unit!33343)

(assert (=> b!1024111 (= lt!450561 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11123 thiss!1427) lt!450559 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!64172 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1024111 (arrayContainsKey!0 (_keys!11123 thiss!1427) lt!450559 #b00000000000000000000000000000000)))

(declare-fun lt!450560 () Unit!33343)

(assert (=> b!1024111 (= lt!450560 lt!450561)))

(declare-fun res!685717 () Bool)

(declare-datatypes ((SeekEntryResult!9589 0))(
  ( (MissingZero!9589 (index!40727 (_ BitVec 32))) (Found!9589 (index!40728 (_ BitVec 32))) (Intermediate!9589 (undefined!10401 Bool) (index!40729 (_ BitVec 32)) (x!91035 (_ BitVec 32))) (Undefined!9589) (MissingVacant!9589 (index!40730 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!64172 (_ BitVec 32)) SeekEntryResult!9589)

(assert (=> b!1024111 (= res!685717 (= (seekEntryOrOpen!0 (select (arr!30897 (_keys!11123 thiss!1427)) #b00000000000000000000000000000000) (_keys!11123 thiss!1427) (mask!29616 thiss!1427)) (Found!9589 #b00000000000000000000000000000000)))))

(assert (=> b!1024111 (=> (not res!685717) (not e!577209))))

(declare-fun d!122617 () Bool)

(declare-fun res!685718 () Bool)

(declare-fun e!577211 () Bool)

(assert (=> d!122617 (=> res!685718 e!577211)))

(assert (=> d!122617 (= res!685718 (bvsge #b00000000000000000000000000000000 (size!31409 (_keys!11123 thiss!1427))))))

(assert (=> d!122617 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11123 thiss!1427) (mask!29616 thiss!1427)) e!577211)))

(declare-fun b!1024112 () Bool)

(assert (=> b!1024112 (= e!577211 e!577210)))

(declare-fun c!103567 () Bool)

(assert (=> b!1024112 (= c!103567 (validKeyInArray!0 (select (arr!30897 (_keys!11123 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1024113 () Bool)

(declare-fun call!43239 () Bool)

(assert (=> b!1024113 (= e!577209 call!43239)))

(declare-fun bm!43236 () Bool)

(assert (=> bm!43236 (= call!43239 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11123 thiss!1427) (mask!29616 thiss!1427)))))

(declare-fun b!1024114 () Bool)

(assert (=> b!1024114 (= e!577210 call!43239)))

(assert (= (and d!122617 (not res!685718)) b!1024112))

(assert (= (and b!1024112 c!103567) b!1024111))

(assert (= (and b!1024112 (not c!103567)) b!1024114))

(assert (= (and b!1024111 res!685717) b!1024113))

(assert (= (or b!1024113 b!1024114) bm!43236))

(assert (=> b!1024111 m!942577))

(declare-fun m!942583 () Bool)

(assert (=> b!1024111 m!942583))

(declare-fun m!942585 () Bool)

(assert (=> b!1024111 m!942585))

(assert (=> b!1024111 m!942577))

(declare-fun m!942587 () Bool)

(assert (=> b!1024111 m!942587))

(assert (=> b!1024112 m!942577))

(assert (=> b!1024112 m!942577))

(assert (=> b!1024112 m!942579))

(declare-fun m!942589 () Bool)

(assert (=> bm!43236 m!942589))

(assert (=> b!1024069 d!122617))

(declare-fun b!1024125 () Bool)

(declare-fun e!577222 () Bool)

(declare-fun e!577221 () Bool)

(assert (=> b!1024125 (= e!577222 e!577221)))

(declare-fun res!685727 () Bool)

(assert (=> b!1024125 (=> (not res!685727) (not e!577221))))

(declare-fun e!577223 () Bool)

(assert (=> b!1024125 (= res!685727 (not e!577223))))

(declare-fun res!685726 () Bool)

(assert (=> b!1024125 (=> (not res!685726) (not e!577223))))

(assert (=> b!1024125 (= res!685726 (validKeyInArray!0 (select (arr!30897 (_keys!11123 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1024126 () Bool)

(declare-fun e!577220 () Bool)

(declare-fun call!43242 () Bool)

(assert (=> b!1024126 (= e!577220 call!43242)))

(declare-fun d!122619 () Bool)

(declare-fun res!685725 () Bool)

(assert (=> d!122619 (=> res!685725 e!577222)))

(assert (=> d!122619 (= res!685725 (bvsge #b00000000000000000000000000000000 (size!31409 (_keys!11123 thiss!1427))))))

(assert (=> d!122619 (= (arrayNoDuplicates!0 (_keys!11123 thiss!1427) #b00000000000000000000000000000000 Nil!21722) e!577222)))

(declare-fun b!1024127 () Bool)

(assert (=> b!1024127 (= e!577220 call!43242)))

(declare-fun b!1024128 () Bool)

(assert (=> b!1024128 (= e!577221 e!577220)))

(declare-fun c!103570 () Bool)

(assert (=> b!1024128 (= c!103570 (validKeyInArray!0 (select (arr!30897 (_keys!11123 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1024129 () Bool)

(declare-fun contains!5942 (List!21725 (_ BitVec 64)) Bool)

(assert (=> b!1024129 (= e!577223 (contains!5942 Nil!21722 (select (arr!30897 (_keys!11123 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43239 () Bool)

(assert (=> bm!43239 (= call!43242 (arrayNoDuplicates!0 (_keys!11123 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!103570 (Cons!21721 (select (arr!30897 (_keys!11123 thiss!1427)) #b00000000000000000000000000000000) Nil!21722) Nil!21722)))))

(assert (= (and d!122619 (not res!685725)) b!1024125))

(assert (= (and b!1024125 res!685726) b!1024129))

(assert (= (and b!1024125 res!685727) b!1024128))

(assert (= (and b!1024128 c!103570) b!1024127))

(assert (= (and b!1024128 (not c!103570)) b!1024126))

(assert (= (or b!1024127 b!1024126) bm!43239))

(assert (=> b!1024125 m!942577))

(assert (=> b!1024125 m!942577))

(assert (=> b!1024125 m!942579))

(assert (=> b!1024128 m!942577))

(assert (=> b!1024128 m!942577))

(assert (=> b!1024128 m!942579))

(assert (=> b!1024129 m!942577))

(assert (=> b!1024129 m!942577))

(declare-fun m!942591 () Bool)

(assert (=> b!1024129 m!942591))

(assert (=> bm!43239 m!942577))

(declare-fun m!942593 () Bool)

(assert (=> bm!43239 m!942593))

(assert (=> b!1024070 d!122619))

(declare-fun condMapEmpty!37523 () Bool)

(declare-fun mapDefault!37523 () ValueCell!11328)

(assert (=> mapNonEmpty!37522 (= condMapEmpty!37523 (= mapRest!37522 ((as const (Array (_ BitVec 32) ValueCell!11328)) mapDefault!37523)))))

(declare-fun e!577225 () Bool)

(declare-fun mapRes!37523 () Bool)

(assert (=> mapNonEmpty!37522 (= tp!72077 (and e!577225 mapRes!37523))))

(declare-fun b!1024130 () Bool)

(declare-fun e!577224 () Bool)

(assert (=> b!1024130 (= e!577224 tp_is_empty!24063)))

(declare-fun b!1024131 () Bool)

(assert (=> b!1024131 (= e!577225 tp_is_empty!24063)))

(declare-fun mapIsEmpty!37523 () Bool)

(assert (=> mapIsEmpty!37523 mapRes!37523))

(declare-fun mapNonEmpty!37523 () Bool)

(declare-fun tp!72078 () Bool)

(assert (=> mapNonEmpty!37523 (= mapRes!37523 (and tp!72078 e!577224))))

(declare-fun mapValue!37523 () ValueCell!11328)

(declare-fun mapKey!37523 () (_ BitVec 32))

(declare-fun mapRest!37523 () (Array (_ BitVec 32) ValueCell!11328))

(assert (=> mapNonEmpty!37523 (= mapRest!37522 (store mapRest!37523 mapKey!37523 mapValue!37523))))

(assert (= (and mapNonEmpty!37522 condMapEmpty!37523) mapIsEmpty!37523))

(assert (= (and mapNonEmpty!37522 (not condMapEmpty!37523)) mapNonEmpty!37523))

(assert (= (and mapNonEmpty!37523 ((_ is ValueCellFull!11328) mapValue!37523)) b!1024130))

(assert (= (and mapNonEmpty!37522 ((_ is ValueCellFull!11328) mapDefault!37523)) b!1024131))

(declare-fun m!942595 () Bool)

(assert (=> mapNonEmpty!37523 m!942595))

(check-sat tp_is_empty!24063 (not b!1024090) (not b!1024111) (not b!1024112) (not d!122615) (not bm!43236) (not b!1024128) (not b!1024129) b_and!32589 (not b!1024101) (not b_next!20343) (not b!1024125) (not b!1024100) (not bm!43233) (not mapNonEmpty!37523) (not bm!43239))
(check-sat b_and!32589 (not b_next!20343))

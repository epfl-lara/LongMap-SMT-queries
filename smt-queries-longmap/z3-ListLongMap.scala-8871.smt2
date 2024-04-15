; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107688 () Bool)

(assert start!107688)

(declare-fun b!1274132 () Bool)

(declare-fun b_free!27769 () Bool)

(declare-fun b_next!27769 () Bool)

(assert (=> b!1274132 (= b_free!27769 (not b_next!27769))))

(declare-fun tp!97877 () Bool)

(declare-fun b_and!45807 () Bool)

(assert (=> b!1274132 (= tp!97877 b_and!45807)))

(declare-fun b!1274131 () Bool)

(declare-fun res!847127 () Bool)

(declare-fun e!727093 () Bool)

(assert (=> b!1274131 (=> (not res!847127) (not e!727093))))

(declare-datatypes ((V!49379 0))(
  ( (V!49380 (val!16644 Int)) )
))
(declare-datatypes ((ValueCell!15716 0))(
  ( (ValueCellFull!15716 (v!19280 V!49379)) (EmptyCell!15716) )
))
(declare-datatypes ((array!83463 0))(
  ( (array!83464 (arr!40250 (Array (_ BitVec 32) ValueCell!15716)) (size!40801 (_ BitVec 32))) )
))
(declare-datatypes ((array!83465 0))(
  ( (array!83466 (arr!40251 (Array (_ BitVec 32) (_ BitVec 64))) (size!40802 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6196 0))(
  ( (LongMapFixedSize!6197 (defaultEntry!6744 Int) (mask!34545 (_ BitVec 32)) (extraKeys!6423 (_ BitVec 32)) (zeroValue!6529 V!49379) (minValue!6529 V!49379) (_size!3153 (_ BitVec 32)) (_keys!12158 array!83465) (_values!6767 array!83463) (_vacant!3153 (_ BitVec 32))) )
))
(declare-fun thiss!1551 () LongMapFixedSize!6196)

(assert (=> b!1274131 (= res!847127 (and (bvsle #b00000000000000000000000000000000 (size!40802 (_keys!12158 thiss!1551))) (bvslt (size!40802 (_keys!12158 thiss!1551)) #b01111111111111111111111111111111)))))

(declare-fun e!727098 () Bool)

(declare-fun tp_is_empty!33139 () Bool)

(declare-fun e!727094 () Bool)

(declare-fun array_inv!30749 (array!83465) Bool)

(declare-fun array_inv!30750 (array!83463) Bool)

(assert (=> b!1274132 (= e!727094 (and tp!97877 tp_is_empty!33139 (array_inv!30749 (_keys!12158 thiss!1551)) (array_inv!30750 (_values!6767 thiss!1551)) e!727098))))

(declare-fun b!1274133 () Bool)

(declare-fun e!727092 () Bool)

(assert (=> b!1274133 (= e!727092 tp_is_empty!33139)))

(declare-fun mapIsEmpty!51353 () Bool)

(declare-fun mapRes!51353 () Bool)

(assert (=> mapIsEmpty!51353 mapRes!51353))

(declare-fun b!1274134 () Bool)

(declare-fun res!847123 () Bool)

(assert (=> b!1274134 (=> (not res!847123) (not e!727093))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83465 (_ BitVec 32)) Bool)

(assert (=> b!1274134 (= res!847123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12158 thiss!1551) (mask!34545 thiss!1551)))))

(declare-fun b!1274135 () Bool)

(declare-fun e!727097 () Bool)

(assert (=> b!1274135 (= e!727097 tp_is_empty!33139)))

(declare-fun b!1274136 () Bool)

(declare-fun res!847122 () Bool)

(assert (=> b!1274136 (=> (not res!847122) (not e!727093))))

(declare-fun arrayCountValidKeys!0 (array!83465 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1274136 (= res!847122 (= (arrayCountValidKeys!0 (_keys!12158 thiss!1551) #b00000000000000000000000000000000 (size!40802 (_keys!12158 thiss!1551))) (_size!3153 thiss!1551)))))

(declare-fun b!1274137 () Bool)

(declare-fun e!727096 () Bool)

(declare-datatypes ((List!28643 0))(
  ( (Nil!28640) (Cons!28639 (h!29848 (_ BitVec 64)) (t!42168 List!28643)) )
))
(declare-fun contains!7645 (List!28643 (_ BitVec 64)) Bool)

(assert (=> b!1274137 (= e!727096 (contains!7645 Nil!28640 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!51353 () Bool)

(declare-fun tp!97878 () Bool)

(assert (=> mapNonEmpty!51353 (= mapRes!51353 (and tp!97878 e!727092))))

(declare-fun mapKey!51353 () (_ BitVec 32))

(declare-fun mapRest!51353 () (Array (_ BitVec 32) ValueCell!15716))

(declare-fun mapValue!51353 () ValueCell!15716)

(assert (=> mapNonEmpty!51353 (= (arr!40250 (_values!6767 thiss!1551)) (store mapRest!51353 mapKey!51353 mapValue!51353))))

(declare-fun res!847124 () Bool)

(assert (=> start!107688 (=> (not res!847124) (not e!727093))))

(declare-fun simpleValid!480 (LongMapFixedSize!6196) Bool)

(assert (=> start!107688 (= res!847124 (simpleValid!480 thiss!1551))))

(assert (=> start!107688 e!727093))

(assert (=> start!107688 e!727094))

(declare-fun b!1274138 () Bool)

(assert (=> b!1274138 (= e!727098 (and e!727097 mapRes!51353))))

(declare-fun condMapEmpty!51353 () Bool)

(declare-fun mapDefault!51353 () ValueCell!15716)

(assert (=> b!1274138 (= condMapEmpty!51353 (= (arr!40250 (_values!6767 thiss!1551)) ((as const (Array (_ BitVec 32) ValueCell!15716)) mapDefault!51353)))))

(declare-fun b!1274139 () Bool)

(assert (=> b!1274139 (= e!727093 e!727096)))

(declare-fun res!847125 () Bool)

(assert (=> b!1274139 (=> res!847125 e!727096)))

(assert (=> b!1274139 (= res!847125 (contains!7645 Nil!28640 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1274140 () Bool)

(declare-fun res!847126 () Bool)

(assert (=> b!1274140 (=> (not res!847126) (not e!727093))))

(declare-fun noDuplicate!2066 (List!28643) Bool)

(assert (=> b!1274140 (= res!847126 (noDuplicate!2066 Nil!28640))))

(assert (= (and start!107688 res!847124) b!1274136))

(assert (= (and b!1274136 res!847122) b!1274134))

(assert (= (and b!1274134 res!847123) b!1274131))

(assert (= (and b!1274131 res!847127) b!1274140))

(assert (= (and b!1274140 res!847126) b!1274139))

(assert (= (and b!1274139 (not res!847125)) b!1274137))

(assert (= (and b!1274138 condMapEmpty!51353) mapIsEmpty!51353))

(assert (= (and b!1274138 (not condMapEmpty!51353)) mapNonEmpty!51353))

(get-info :version)

(assert (= (and mapNonEmpty!51353 ((_ is ValueCellFull!15716) mapValue!51353)) b!1274133))

(assert (= (and b!1274138 ((_ is ValueCellFull!15716) mapDefault!51353)) b!1274135))

(assert (= b!1274132 b!1274138))

(assert (= start!107688 b!1274132))

(declare-fun m!1170535 () Bool)

(assert (=> b!1274136 m!1170535))

(declare-fun m!1170537 () Bool)

(assert (=> b!1274132 m!1170537))

(declare-fun m!1170539 () Bool)

(assert (=> b!1274132 m!1170539))

(declare-fun m!1170541 () Bool)

(assert (=> mapNonEmpty!51353 m!1170541))

(declare-fun m!1170543 () Bool)

(assert (=> b!1274137 m!1170543))

(declare-fun m!1170545 () Bool)

(assert (=> start!107688 m!1170545))

(declare-fun m!1170547 () Bool)

(assert (=> b!1274139 m!1170547))

(declare-fun m!1170549 () Bool)

(assert (=> b!1274134 m!1170549))

(declare-fun m!1170551 () Bool)

(assert (=> b!1274140 m!1170551))

(check-sat (not b!1274140) tp_is_empty!33139 (not b!1274139) (not b!1274136) (not mapNonEmpty!51353) (not start!107688) (not b!1274132) (not b_next!27769) (not b!1274134) b_and!45807 (not b!1274137))
(check-sat b_and!45807 (not b_next!27769))
(get-model)

(declare-fun d!139985 () Bool)

(declare-fun res!847173 () Bool)

(declare-fun e!727143 () Bool)

(assert (=> d!139985 (=> (not res!847173) (not e!727143))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!139985 (= res!847173 (validMask!0 (mask!34545 thiss!1551)))))

(assert (=> d!139985 (= (simpleValid!480 thiss!1551) e!727143)))

(declare-fun b!1274212 () Bool)

(assert (=> b!1274212 (= e!727143 (and (bvsge (extraKeys!6423 thiss!1551) #b00000000000000000000000000000000) (bvsle (extraKeys!6423 thiss!1551) #b00000000000000000000000000000011) (bvsge (_vacant!3153 thiss!1551) #b00000000000000000000000000000000)))))

(declare-fun b!1274209 () Bool)

(declare-fun res!847174 () Bool)

(assert (=> b!1274209 (=> (not res!847174) (not e!727143))))

(assert (=> b!1274209 (= res!847174 (and (= (size!40801 (_values!6767 thiss!1551)) (bvadd (mask!34545 thiss!1551) #b00000000000000000000000000000001)) (= (size!40802 (_keys!12158 thiss!1551)) (size!40801 (_values!6767 thiss!1551))) (bvsge (_size!3153 thiss!1551) #b00000000000000000000000000000000) (bvsle (_size!3153 thiss!1551) (bvadd (mask!34545 thiss!1551) #b00000000000000000000000000000001))))))

(declare-fun b!1274210 () Bool)

(declare-fun res!847172 () Bool)

(assert (=> b!1274210 (=> (not res!847172) (not e!727143))))

(declare-fun size!40807 (LongMapFixedSize!6196) (_ BitVec 32))

(assert (=> b!1274210 (= res!847172 (bvsge (size!40807 thiss!1551) (_size!3153 thiss!1551)))))

(declare-fun b!1274211 () Bool)

(declare-fun res!847175 () Bool)

(assert (=> b!1274211 (=> (not res!847175) (not e!727143))))

(assert (=> b!1274211 (= res!847175 (= (size!40807 thiss!1551) (bvadd (_size!3153 thiss!1551) (bvsdiv (bvadd (extraKeys!6423 thiss!1551) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!139985 res!847173) b!1274209))

(assert (= (and b!1274209 res!847174) b!1274210))

(assert (= (and b!1274210 res!847172) b!1274211))

(assert (= (and b!1274211 res!847175) b!1274212))

(declare-fun m!1170589 () Bool)

(assert (=> d!139985 m!1170589))

(declare-fun m!1170591 () Bool)

(assert (=> b!1274210 m!1170591))

(assert (=> b!1274211 m!1170591))

(assert (=> start!107688 d!139985))

(declare-fun b!1274221 () Bool)

(declare-fun e!727149 () (_ BitVec 32))

(declare-fun e!727148 () (_ BitVec 32))

(assert (=> b!1274221 (= e!727149 e!727148)))

(declare-fun c!123805 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1274221 (= c!123805 (validKeyInArray!0 (select (arr!40251 (_keys!12158 thiss!1551)) #b00000000000000000000000000000000)))))

(declare-fun d!139987 () Bool)

(declare-fun lt!575026 () (_ BitVec 32))

(assert (=> d!139987 (and (bvsge lt!575026 #b00000000000000000000000000000000) (bvsle lt!575026 (bvsub (size!40802 (_keys!12158 thiss!1551)) #b00000000000000000000000000000000)))))

(assert (=> d!139987 (= lt!575026 e!727149)))

(declare-fun c!123806 () Bool)

(assert (=> d!139987 (= c!123806 (bvsge #b00000000000000000000000000000000 (size!40802 (_keys!12158 thiss!1551))))))

(assert (=> d!139987 (and (bvsle #b00000000000000000000000000000000 (size!40802 (_keys!12158 thiss!1551))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!40802 (_keys!12158 thiss!1551)) (size!40802 (_keys!12158 thiss!1551))))))

(assert (=> d!139987 (= (arrayCountValidKeys!0 (_keys!12158 thiss!1551) #b00000000000000000000000000000000 (size!40802 (_keys!12158 thiss!1551))) lt!575026)))

(declare-fun b!1274222 () Bool)

(declare-fun call!62610 () (_ BitVec 32))

(assert (=> b!1274222 (= e!727148 call!62610)))

(declare-fun bm!62607 () Bool)

(assert (=> bm!62607 (= call!62610 (arrayCountValidKeys!0 (_keys!12158 thiss!1551) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40802 (_keys!12158 thiss!1551))))))

(declare-fun b!1274223 () Bool)

(assert (=> b!1274223 (= e!727148 (bvadd #b00000000000000000000000000000001 call!62610))))

(declare-fun b!1274224 () Bool)

(assert (=> b!1274224 (= e!727149 #b00000000000000000000000000000000)))

(assert (= (and d!139987 c!123806) b!1274224))

(assert (= (and d!139987 (not c!123806)) b!1274221))

(assert (= (and b!1274221 c!123805) b!1274223))

(assert (= (and b!1274221 (not c!123805)) b!1274222))

(assert (= (or b!1274223 b!1274222) bm!62607))

(declare-fun m!1170593 () Bool)

(assert (=> b!1274221 m!1170593))

(assert (=> b!1274221 m!1170593))

(declare-fun m!1170595 () Bool)

(assert (=> b!1274221 m!1170595))

(declare-fun m!1170597 () Bool)

(assert (=> bm!62607 m!1170597))

(assert (=> b!1274136 d!139987))

(declare-fun d!139989 () Bool)

(declare-fun res!847180 () Bool)

(declare-fun e!727154 () Bool)

(assert (=> d!139989 (=> res!847180 e!727154)))

(assert (=> d!139989 (= res!847180 ((_ is Nil!28640) Nil!28640))))

(assert (=> d!139989 (= (noDuplicate!2066 Nil!28640) e!727154)))

(declare-fun b!1274229 () Bool)

(declare-fun e!727155 () Bool)

(assert (=> b!1274229 (= e!727154 e!727155)))

(declare-fun res!847181 () Bool)

(assert (=> b!1274229 (=> (not res!847181) (not e!727155))))

(assert (=> b!1274229 (= res!847181 (not (contains!7645 (t!42168 Nil!28640) (h!29848 Nil!28640))))))

(declare-fun b!1274230 () Bool)

(assert (=> b!1274230 (= e!727155 (noDuplicate!2066 (t!42168 Nil!28640)))))

(assert (= (and d!139989 (not res!847180)) b!1274229))

(assert (= (and b!1274229 res!847181) b!1274230))

(declare-fun m!1170599 () Bool)

(assert (=> b!1274229 m!1170599))

(declare-fun m!1170601 () Bool)

(assert (=> b!1274230 m!1170601))

(assert (=> b!1274140 d!139989))

(declare-fun d!139991 () Bool)

(assert (=> d!139991 (= (array_inv!30749 (_keys!12158 thiss!1551)) (bvsge (size!40802 (_keys!12158 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1274132 d!139991))

(declare-fun d!139993 () Bool)

(assert (=> d!139993 (= (array_inv!30750 (_values!6767 thiss!1551)) (bvsge (size!40801 (_values!6767 thiss!1551)) #b00000000000000000000000000000000))))

(assert (=> b!1274132 d!139993))

(declare-fun d!139995 () Bool)

(declare-fun lt!575029 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!638 (List!28643) (InoxSet (_ BitVec 64)))

(assert (=> d!139995 (= lt!575029 (select (content!638 Nil!28640) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!727161 () Bool)

(assert (=> d!139995 (= lt!575029 e!727161)))

(declare-fun res!847186 () Bool)

(assert (=> d!139995 (=> (not res!847186) (not e!727161))))

(assert (=> d!139995 (= res!847186 ((_ is Cons!28639) Nil!28640))))

(assert (=> d!139995 (= (contains!7645 Nil!28640 #b1000000000000000000000000000000000000000000000000000000000000000) lt!575029)))

(declare-fun b!1274235 () Bool)

(declare-fun e!727160 () Bool)

(assert (=> b!1274235 (= e!727161 e!727160)))

(declare-fun res!847187 () Bool)

(assert (=> b!1274235 (=> res!847187 e!727160)))

(assert (=> b!1274235 (= res!847187 (= (h!29848 Nil!28640) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1274236 () Bool)

(assert (=> b!1274236 (= e!727160 (contains!7645 (t!42168 Nil!28640) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!139995 res!847186) b!1274235))

(assert (= (and b!1274235 (not res!847187)) b!1274236))

(declare-fun m!1170603 () Bool)

(assert (=> d!139995 m!1170603))

(declare-fun m!1170605 () Bool)

(assert (=> d!139995 m!1170605))

(declare-fun m!1170607 () Bool)

(assert (=> b!1274236 m!1170607))

(assert (=> b!1274137 d!139995))

(declare-fun b!1274245 () Bool)

(declare-fun e!727169 () Bool)

(declare-fun e!727170 () Bool)

(assert (=> b!1274245 (= e!727169 e!727170)))

(declare-fun c!123809 () Bool)

(assert (=> b!1274245 (= c!123809 (validKeyInArray!0 (select (arr!40251 (_keys!12158 thiss!1551)) #b00000000000000000000000000000000)))))

(declare-fun b!1274246 () Bool)

(declare-fun call!62613 () Bool)

(assert (=> b!1274246 (= e!727170 call!62613)))

(declare-fun bm!62610 () Bool)

(assert (=> bm!62610 (= call!62613 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!12158 thiss!1551) (mask!34545 thiss!1551)))))

(declare-fun b!1274248 () Bool)

(declare-fun e!727168 () Bool)

(assert (=> b!1274248 (= e!727170 e!727168)))

(declare-fun lt!575038 () (_ BitVec 64))

(assert (=> b!1274248 (= lt!575038 (select (arr!40251 (_keys!12158 thiss!1551)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42186 0))(
  ( (Unit!42187) )
))
(declare-fun lt!575037 () Unit!42186)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83465 (_ BitVec 64) (_ BitVec 32)) Unit!42186)

(assert (=> b!1274248 (= lt!575037 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!12158 thiss!1551) lt!575038 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83465 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1274248 (arrayContainsKey!0 (_keys!12158 thiss!1551) lt!575038 #b00000000000000000000000000000000)))

(declare-fun lt!575036 () Unit!42186)

(assert (=> b!1274248 (= lt!575036 lt!575037)))

(declare-fun res!847193 () Bool)

(declare-datatypes ((SeekEntryResult!9999 0))(
  ( (MissingZero!9999 (index!42367 (_ BitVec 32))) (Found!9999 (index!42368 (_ BitVec 32))) (Intermediate!9999 (undefined!10811 Bool) (index!42369 (_ BitVec 32)) (x!112733 (_ BitVec 32))) (Undefined!9999) (MissingVacant!9999 (index!42370 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83465 (_ BitVec 32)) SeekEntryResult!9999)

(assert (=> b!1274248 (= res!847193 (= (seekEntryOrOpen!0 (select (arr!40251 (_keys!12158 thiss!1551)) #b00000000000000000000000000000000) (_keys!12158 thiss!1551) (mask!34545 thiss!1551)) (Found!9999 #b00000000000000000000000000000000)))))

(assert (=> b!1274248 (=> (not res!847193) (not e!727168))))

(declare-fun b!1274247 () Bool)

(assert (=> b!1274247 (= e!727168 call!62613)))

(declare-fun d!139997 () Bool)

(declare-fun res!847192 () Bool)

(assert (=> d!139997 (=> res!847192 e!727169)))

(assert (=> d!139997 (= res!847192 (bvsge #b00000000000000000000000000000000 (size!40802 (_keys!12158 thiss!1551))))))

(assert (=> d!139997 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12158 thiss!1551) (mask!34545 thiss!1551)) e!727169)))

(assert (= (and d!139997 (not res!847192)) b!1274245))

(assert (= (and b!1274245 c!123809) b!1274248))

(assert (= (and b!1274245 (not c!123809)) b!1274246))

(assert (= (and b!1274248 res!847193) b!1274247))

(assert (= (or b!1274247 b!1274246) bm!62610))

(assert (=> b!1274245 m!1170593))

(assert (=> b!1274245 m!1170593))

(assert (=> b!1274245 m!1170595))

(declare-fun m!1170609 () Bool)

(assert (=> bm!62610 m!1170609))

(assert (=> b!1274248 m!1170593))

(declare-fun m!1170611 () Bool)

(assert (=> b!1274248 m!1170611))

(declare-fun m!1170613 () Bool)

(assert (=> b!1274248 m!1170613))

(assert (=> b!1274248 m!1170593))

(declare-fun m!1170615 () Bool)

(assert (=> b!1274248 m!1170615))

(assert (=> b!1274134 d!139997))

(declare-fun d!139999 () Bool)

(declare-fun lt!575039 () Bool)

(assert (=> d!139999 (= lt!575039 (select (content!638 Nil!28640) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!727172 () Bool)

(assert (=> d!139999 (= lt!575039 e!727172)))

(declare-fun res!847194 () Bool)

(assert (=> d!139999 (=> (not res!847194) (not e!727172))))

(assert (=> d!139999 (= res!847194 ((_ is Cons!28639) Nil!28640))))

(assert (=> d!139999 (= (contains!7645 Nil!28640 #b0000000000000000000000000000000000000000000000000000000000000000) lt!575039)))

(declare-fun b!1274249 () Bool)

(declare-fun e!727171 () Bool)

(assert (=> b!1274249 (= e!727172 e!727171)))

(declare-fun res!847195 () Bool)

(assert (=> b!1274249 (=> res!847195 e!727171)))

(assert (=> b!1274249 (= res!847195 (= (h!29848 Nil!28640) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1274250 () Bool)

(assert (=> b!1274250 (= e!727171 (contains!7645 (t!42168 Nil!28640) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!139999 res!847194) b!1274249))

(assert (= (and b!1274249 (not res!847195)) b!1274250))

(assert (=> d!139999 m!1170603))

(declare-fun m!1170617 () Bool)

(assert (=> d!139999 m!1170617))

(declare-fun m!1170619 () Bool)

(assert (=> b!1274250 m!1170619))

(assert (=> b!1274139 d!139999))

(declare-fun b!1274258 () Bool)

(declare-fun e!727178 () Bool)

(assert (=> b!1274258 (= e!727178 tp_is_empty!33139)))

(declare-fun mapNonEmpty!51362 () Bool)

(declare-fun mapRes!51362 () Bool)

(declare-fun tp!97893 () Bool)

(declare-fun e!727177 () Bool)

(assert (=> mapNonEmpty!51362 (= mapRes!51362 (and tp!97893 e!727177))))

(declare-fun mapKey!51362 () (_ BitVec 32))

(declare-fun mapRest!51362 () (Array (_ BitVec 32) ValueCell!15716))

(declare-fun mapValue!51362 () ValueCell!15716)

(assert (=> mapNonEmpty!51362 (= mapRest!51353 (store mapRest!51362 mapKey!51362 mapValue!51362))))

(declare-fun condMapEmpty!51362 () Bool)

(declare-fun mapDefault!51362 () ValueCell!15716)

(assert (=> mapNonEmpty!51353 (= condMapEmpty!51362 (= mapRest!51353 ((as const (Array (_ BitVec 32) ValueCell!15716)) mapDefault!51362)))))

(assert (=> mapNonEmpty!51353 (= tp!97878 (and e!727178 mapRes!51362))))

(declare-fun mapIsEmpty!51362 () Bool)

(assert (=> mapIsEmpty!51362 mapRes!51362))

(declare-fun b!1274257 () Bool)

(assert (=> b!1274257 (= e!727177 tp_is_empty!33139)))

(assert (= (and mapNonEmpty!51353 condMapEmpty!51362) mapIsEmpty!51362))

(assert (= (and mapNonEmpty!51353 (not condMapEmpty!51362)) mapNonEmpty!51362))

(assert (= (and mapNonEmpty!51362 ((_ is ValueCellFull!15716) mapValue!51362)) b!1274257))

(assert (= (and mapNonEmpty!51353 ((_ is ValueCellFull!15716) mapDefault!51362)) b!1274258))

(declare-fun m!1170621 () Bool)

(assert (=> mapNonEmpty!51362 m!1170621))

(check-sat (not d!139995) tp_is_empty!33139 (not b!1274211) (not b!1274221) (not b!1274210) (not b!1274230) (not mapNonEmpty!51362) (not b_next!27769) b_and!45807 (not bm!62607) (not b!1274248) (not b!1274229) (not b!1274245) (not b!1274250) (not d!139985) (not b!1274236) (not bm!62610) (not d!139999))
(check-sat b_and!45807 (not b_next!27769))

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107672 () Bool)

(assert start!107672)

(declare-fun b!1274093 () Bool)

(declare-fun b_free!27685 () Bool)

(declare-fun b_next!27685 () Bool)

(assert (=> b!1274093 (= b_free!27685 (not b_next!27685))))

(declare-fun tp!97581 () Bool)

(declare-fun b_and!45743 () Bool)

(assert (=> b!1274093 (= tp!97581 b_and!45743)))

(declare-fun mapIsEmpty!51184 () Bool)

(declare-fun mapRes!51184 () Bool)

(assert (=> mapIsEmpty!51184 mapRes!51184))

(declare-fun b!1274088 () Bool)

(declare-fun e!726890 () Bool)

(declare-fun tp_is_empty!33055 () Bool)

(assert (=> b!1274088 (= e!726890 tp_is_empty!33055)))

(declare-fun b!1274089 () Bool)

(declare-fun e!726888 () Bool)

(assert (=> b!1274089 (= e!726888 tp_is_empty!33055)))

(declare-fun b!1274090 () Bool)

(declare-fun e!726885 () Bool)

(declare-datatypes ((V!49267 0))(
  ( (V!49268 (val!16602 Int)) )
))
(declare-datatypes ((ValueCell!15674 0))(
  ( (ValueCellFull!15674 (v!19234 V!49267)) (EmptyCell!15674) )
))
(declare-datatypes ((array!83387 0))(
  ( (array!83388 (arr!40220 (Array (_ BitVec 32) ValueCell!15674)) (size!40760 (_ BitVec 32))) )
))
(declare-datatypes ((array!83389 0))(
  ( (array!83390 (arr!40221 (Array (_ BitVec 32) (_ BitVec 64))) (size!40761 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6112 0))(
  ( (LongMapFixedSize!6113 (defaultEntry!6702 Int) (mask!34521 (_ BitVec 32)) (extraKeys!6381 (_ BitVec 32)) (zeroValue!6487 V!49267) (minValue!6487 V!49267) (_size!3111 (_ BitVec 32)) (_keys!12149 array!83389) (_values!6725 array!83387) (_vacant!3111 (_ BitVec 32))) )
))
(declare-fun thiss!1559 () LongMapFixedSize!6112)

(assert (=> b!1274090 (= e!726885 (and (= (size!40760 (_values!6725 thiss!1559)) (bvadd #b00000000000000000000000000000001 (mask!34521 thiss!1559))) (= (size!40761 (_keys!12149 thiss!1559)) (size!40760 (_values!6725 thiss!1559))) (bvsge (mask!34521 thiss!1559) #b00000000000000000000000000000000) (bvslt (extraKeys!6381 thiss!1559) #b00000000000000000000000000000000)))))

(declare-fun b!1274091 () Bool)

(declare-fun e!726889 () Bool)

(assert (=> b!1274091 (= e!726889 (and e!726890 mapRes!51184))))

(declare-fun condMapEmpty!51184 () Bool)

(declare-fun mapDefault!51184 () ValueCell!15674)

(assert (=> b!1274091 (= condMapEmpty!51184 (= (arr!40220 (_values!6725 thiss!1559)) ((as const (Array (_ BitVec 32) ValueCell!15674)) mapDefault!51184)))))

(declare-fun res!847066 () Bool)

(assert (=> start!107672 (=> (not res!847066) (not e!726885))))

(declare-fun valid!2295 (LongMapFixedSize!6112) Bool)

(assert (=> start!107672 (= res!847066 (valid!2295 thiss!1559))))

(assert (=> start!107672 e!726885))

(declare-fun e!726887 () Bool)

(assert (=> start!107672 e!726887))

(declare-fun b!1274092 () Bool)

(declare-fun res!847065 () Bool)

(assert (=> b!1274092 (=> (not res!847065) (not e!726885))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1274092 (= res!847065 (validMask!0 (mask!34521 thiss!1559)))))

(declare-fun mapNonEmpty!51184 () Bool)

(declare-fun tp!97582 () Bool)

(assert (=> mapNonEmpty!51184 (= mapRes!51184 (and tp!97582 e!726888))))

(declare-fun mapRest!51184 () (Array (_ BitVec 32) ValueCell!15674))

(declare-fun mapKey!51184 () (_ BitVec 32))

(declare-fun mapValue!51184 () ValueCell!15674)

(assert (=> mapNonEmpty!51184 (= (arr!40220 (_values!6725 thiss!1559)) (store mapRest!51184 mapKey!51184 mapValue!51184))))

(declare-fun array_inv!30757 (array!83389) Bool)

(declare-fun array_inv!30758 (array!83387) Bool)

(assert (=> b!1274093 (= e!726887 (and tp!97581 tp_is_empty!33055 (array_inv!30757 (_keys!12149 thiss!1559)) (array_inv!30758 (_values!6725 thiss!1559)) e!726889))))

(assert (= (and start!107672 res!847066) b!1274092))

(assert (= (and b!1274092 res!847065) b!1274090))

(assert (= (and b!1274091 condMapEmpty!51184) mapIsEmpty!51184))

(assert (= (and b!1274091 (not condMapEmpty!51184)) mapNonEmpty!51184))

(get-info :version)

(assert (= (and mapNonEmpty!51184 ((_ is ValueCellFull!15674) mapValue!51184)) b!1274089))

(assert (= (and b!1274091 ((_ is ValueCellFull!15674) mapDefault!51184)) b!1274088))

(assert (= b!1274093 b!1274091))

(assert (= start!107672 b!1274093))

(declare-fun m!1171897 () Bool)

(assert (=> start!107672 m!1171897))

(declare-fun m!1171899 () Bool)

(assert (=> b!1274092 m!1171899))

(declare-fun m!1171901 () Bool)

(assert (=> mapNonEmpty!51184 m!1171901))

(declare-fun m!1171903 () Bool)

(assert (=> b!1274093 m!1171903))

(declare-fun m!1171905 () Bool)

(assert (=> b!1274093 m!1171905))

(check-sat (not start!107672) b_and!45743 (not b!1274093) (not b!1274092) tp_is_empty!33055 (not mapNonEmpty!51184) (not b_next!27685))
(check-sat b_and!45743 (not b_next!27685))
(get-model)

(declare-fun d!140357 () Bool)

(declare-fun res!847085 () Bool)

(declare-fun e!726929 () Bool)

(assert (=> d!140357 (=> (not res!847085) (not e!726929))))

(declare-fun simpleValid!459 (LongMapFixedSize!6112) Bool)

(assert (=> d!140357 (= res!847085 (simpleValid!459 thiss!1559))))

(assert (=> d!140357 (= (valid!2295 thiss!1559) e!726929)))

(declare-fun b!1274136 () Bool)

(declare-fun res!847086 () Bool)

(assert (=> b!1274136 (=> (not res!847086) (not e!726929))))

(declare-fun arrayCountValidKeys!0 (array!83389 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1274136 (= res!847086 (= (arrayCountValidKeys!0 (_keys!12149 thiss!1559) #b00000000000000000000000000000000 (size!40761 (_keys!12149 thiss!1559))) (_size!3111 thiss!1559)))))

(declare-fun b!1274137 () Bool)

(declare-fun res!847087 () Bool)

(assert (=> b!1274137 (=> (not res!847087) (not e!726929))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83389 (_ BitVec 32)) Bool)

(assert (=> b!1274137 (= res!847087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12149 thiss!1559) (mask!34521 thiss!1559)))))

(declare-fun b!1274138 () Bool)

(declare-datatypes ((List!28588 0))(
  ( (Nil!28585) (Cons!28584 (h!29802 (_ BitVec 64)) (t!42113 List!28588)) )
))
(declare-fun arrayNoDuplicates!0 (array!83389 (_ BitVec 32) List!28588) Bool)

(assert (=> b!1274138 (= e!726929 (arrayNoDuplicates!0 (_keys!12149 thiss!1559) #b00000000000000000000000000000000 Nil!28585))))

(assert (= (and d!140357 res!847085) b!1274136))

(assert (= (and b!1274136 res!847086) b!1274137))

(assert (= (and b!1274137 res!847087) b!1274138))

(declare-fun m!1171927 () Bool)

(assert (=> d!140357 m!1171927))

(declare-fun m!1171929 () Bool)

(assert (=> b!1274136 m!1171929))

(declare-fun m!1171931 () Bool)

(assert (=> b!1274137 m!1171931))

(declare-fun m!1171933 () Bool)

(assert (=> b!1274138 m!1171933))

(assert (=> start!107672 d!140357))

(declare-fun d!140359 () Bool)

(assert (=> d!140359 (= (array_inv!30757 (_keys!12149 thiss!1559)) (bvsge (size!40761 (_keys!12149 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1274093 d!140359))

(declare-fun d!140361 () Bool)

(assert (=> d!140361 (= (array_inv!30758 (_values!6725 thiss!1559)) (bvsge (size!40760 (_values!6725 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1274093 d!140361))

(declare-fun d!140363 () Bool)

(assert (=> d!140363 (= (validMask!0 (mask!34521 thiss!1559)) (and (or (= (mask!34521 thiss!1559) #b00000000000000000000000000000111) (= (mask!34521 thiss!1559) #b00000000000000000000000000001111) (= (mask!34521 thiss!1559) #b00000000000000000000000000011111) (= (mask!34521 thiss!1559) #b00000000000000000000000000111111) (= (mask!34521 thiss!1559) #b00000000000000000000000001111111) (= (mask!34521 thiss!1559) #b00000000000000000000000011111111) (= (mask!34521 thiss!1559) #b00000000000000000000000111111111) (= (mask!34521 thiss!1559) #b00000000000000000000001111111111) (= (mask!34521 thiss!1559) #b00000000000000000000011111111111) (= (mask!34521 thiss!1559) #b00000000000000000000111111111111) (= (mask!34521 thiss!1559) #b00000000000000000001111111111111) (= (mask!34521 thiss!1559) #b00000000000000000011111111111111) (= (mask!34521 thiss!1559) #b00000000000000000111111111111111) (= (mask!34521 thiss!1559) #b00000000000000001111111111111111) (= (mask!34521 thiss!1559) #b00000000000000011111111111111111) (= (mask!34521 thiss!1559) #b00000000000000111111111111111111) (= (mask!34521 thiss!1559) #b00000000000001111111111111111111) (= (mask!34521 thiss!1559) #b00000000000011111111111111111111) (= (mask!34521 thiss!1559) #b00000000000111111111111111111111) (= (mask!34521 thiss!1559) #b00000000001111111111111111111111) (= (mask!34521 thiss!1559) #b00000000011111111111111111111111) (= (mask!34521 thiss!1559) #b00000000111111111111111111111111) (= (mask!34521 thiss!1559) #b00000001111111111111111111111111) (= (mask!34521 thiss!1559) #b00000011111111111111111111111111) (= (mask!34521 thiss!1559) #b00000111111111111111111111111111) (= (mask!34521 thiss!1559) #b00001111111111111111111111111111) (= (mask!34521 thiss!1559) #b00011111111111111111111111111111) (= (mask!34521 thiss!1559) #b00111111111111111111111111111111)) (bvsle (mask!34521 thiss!1559) #b00111111111111111111111111111111)))))

(assert (=> b!1274092 d!140363))

(declare-fun b!1274146 () Bool)

(declare-fun e!726935 () Bool)

(assert (=> b!1274146 (= e!726935 tp_is_empty!33055)))

(declare-fun mapIsEmpty!51193 () Bool)

(declare-fun mapRes!51193 () Bool)

(assert (=> mapIsEmpty!51193 mapRes!51193))

(declare-fun condMapEmpty!51193 () Bool)

(declare-fun mapDefault!51193 () ValueCell!15674)

(assert (=> mapNonEmpty!51184 (= condMapEmpty!51193 (= mapRest!51184 ((as const (Array (_ BitVec 32) ValueCell!15674)) mapDefault!51193)))))

(assert (=> mapNonEmpty!51184 (= tp!97582 (and e!726935 mapRes!51193))))

(declare-fun mapNonEmpty!51193 () Bool)

(declare-fun tp!97597 () Bool)

(declare-fun e!726934 () Bool)

(assert (=> mapNonEmpty!51193 (= mapRes!51193 (and tp!97597 e!726934))))

(declare-fun mapValue!51193 () ValueCell!15674)

(declare-fun mapRest!51193 () (Array (_ BitVec 32) ValueCell!15674))

(declare-fun mapKey!51193 () (_ BitVec 32))

(assert (=> mapNonEmpty!51193 (= mapRest!51184 (store mapRest!51193 mapKey!51193 mapValue!51193))))

(declare-fun b!1274145 () Bool)

(assert (=> b!1274145 (= e!726934 tp_is_empty!33055)))

(assert (= (and mapNonEmpty!51184 condMapEmpty!51193) mapIsEmpty!51193))

(assert (= (and mapNonEmpty!51184 (not condMapEmpty!51193)) mapNonEmpty!51193))

(assert (= (and mapNonEmpty!51193 ((_ is ValueCellFull!15674) mapValue!51193)) b!1274145))

(assert (= (and mapNonEmpty!51184 ((_ is ValueCellFull!15674) mapDefault!51193)) b!1274146))

(declare-fun m!1171935 () Bool)

(assert (=> mapNonEmpty!51193 m!1171935))

(check-sat b_and!45743 (not mapNonEmpty!51193) (not b_next!27685) tp_is_empty!33055 (not b!1274137) (not d!140357) (not b!1274138) (not b!1274136))
(check-sat b_and!45743 (not b_next!27685))
(get-model)

(declare-fun b!1274155 () Bool)

(declare-fun e!726942 () Bool)

(declare-fun call!62632 () Bool)

(assert (=> b!1274155 (= e!726942 call!62632)))

(declare-fun b!1274156 () Bool)

(declare-fun e!726944 () Bool)

(assert (=> b!1274156 (= e!726944 call!62632)))

(declare-fun d!140365 () Bool)

(declare-fun res!847093 () Bool)

(declare-fun e!726943 () Bool)

(assert (=> d!140365 (=> res!847093 e!726943)))

(assert (=> d!140365 (= res!847093 (bvsge #b00000000000000000000000000000000 (size!40761 (_keys!12149 thiss!1559))))))

(assert (=> d!140365 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12149 thiss!1559) (mask!34521 thiss!1559)) e!726943)))

(declare-fun b!1274157 () Bool)

(assert (=> b!1274157 (= e!726944 e!726942)))

(declare-fun lt!575572 () (_ BitVec 64))

(assert (=> b!1274157 (= lt!575572 (select (arr!40221 (_keys!12149 thiss!1559)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42295 0))(
  ( (Unit!42296) )
))
(declare-fun lt!575573 () Unit!42295)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83389 (_ BitVec 64) (_ BitVec 32)) Unit!42295)

(assert (=> b!1274157 (= lt!575573 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!12149 thiss!1559) lt!575572 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83389 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1274157 (arrayContainsKey!0 (_keys!12149 thiss!1559) lt!575572 #b00000000000000000000000000000000)))

(declare-fun lt!575571 () Unit!42295)

(assert (=> b!1274157 (= lt!575571 lt!575573)))

(declare-fun res!847092 () Bool)

(declare-datatypes ((SeekEntryResult!9948 0))(
  ( (MissingZero!9948 (index!42163 (_ BitVec 32))) (Found!9948 (index!42164 (_ BitVec 32))) (Intermediate!9948 (undefined!10760 Bool) (index!42165 (_ BitVec 32)) (x!112473 (_ BitVec 32))) (Undefined!9948) (MissingVacant!9948 (index!42166 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83389 (_ BitVec 32)) SeekEntryResult!9948)

(assert (=> b!1274157 (= res!847092 (= (seekEntryOrOpen!0 (select (arr!40221 (_keys!12149 thiss!1559)) #b00000000000000000000000000000000) (_keys!12149 thiss!1559) (mask!34521 thiss!1559)) (Found!9948 #b00000000000000000000000000000000)))))

(assert (=> b!1274157 (=> (not res!847092) (not e!726942))))

(declare-fun bm!62629 () Bool)

(assert (=> bm!62629 (= call!62632 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!12149 thiss!1559) (mask!34521 thiss!1559)))))

(declare-fun b!1274158 () Bool)

(assert (=> b!1274158 (= e!726943 e!726944)))

(declare-fun c!124123 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1274158 (= c!124123 (validKeyInArray!0 (select (arr!40221 (_keys!12149 thiss!1559)) #b00000000000000000000000000000000)))))

(assert (= (and d!140365 (not res!847093)) b!1274158))

(assert (= (and b!1274158 c!124123) b!1274157))

(assert (= (and b!1274158 (not c!124123)) b!1274156))

(assert (= (and b!1274157 res!847092) b!1274155))

(assert (= (or b!1274155 b!1274156) bm!62629))

(declare-fun m!1171937 () Bool)

(assert (=> b!1274157 m!1171937))

(declare-fun m!1171939 () Bool)

(assert (=> b!1274157 m!1171939))

(declare-fun m!1171941 () Bool)

(assert (=> b!1274157 m!1171941))

(assert (=> b!1274157 m!1171937))

(declare-fun m!1171943 () Bool)

(assert (=> b!1274157 m!1171943))

(declare-fun m!1171945 () Bool)

(assert (=> bm!62629 m!1171945))

(assert (=> b!1274158 m!1171937))

(assert (=> b!1274158 m!1171937))

(declare-fun m!1171947 () Bool)

(assert (=> b!1274158 m!1171947))

(assert (=> b!1274137 d!140365))

(declare-fun b!1274169 () Bool)

(declare-fun e!726955 () Bool)

(declare-fun e!726954 () Bool)

(assert (=> b!1274169 (= e!726955 e!726954)))

(declare-fun c!124126 () Bool)

(assert (=> b!1274169 (= c!124126 (validKeyInArray!0 (select (arr!40221 (_keys!12149 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun d!140367 () Bool)

(declare-fun res!847101 () Bool)

(declare-fun e!726956 () Bool)

(assert (=> d!140367 (=> res!847101 e!726956)))

(assert (=> d!140367 (= res!847101 (bvsge #b00000000000000000000000000000000 (size!40761 (_keys!12149 thiss!1559))))))

(assert (=> d!140367 (= (arrayNoDuplicates!0 (_keys!12149 thiss!1559) #b00000000000000000000000000000000 Nil!28585) e!726956)))

(declare-fun b!1274170 () Bool)

(declare-fun call!62635 () Bool)

(assert (=> b!1274170 (= e!726954 call!62635)))

(declare-fun bm!62632 () Bool)

(assert (=> bm!62632 (= call!62635 (arrayNoDuplicates!0 (_keys!12149 thiss!1559) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124126 (Cons!28584 (select (arr!40221 (_keys!12149 thiss!1559)) #b00000000000000000000000000000000) Nil!28585) Nil!28585)))))

(declare-fun b!1274171 () Bool)

(assert (=> b!1274171 (= e!726956 e!726955)))

(declare-fun res!847100 () Bool)

(assert (=> b!1274171 (=> (not res!847100) (not e!726955))))

(declare-fun e!726953 () Bool)

(assert (=> b!1274171 (= res!847100 (not e!726953))))

(declare-fun res!847102 () Bool)

(assert (=> b!1274171 (=> (not res!847102) (not e!726953))))

(assert (=> b!1274171 (= res!847102 (validKeyInArray!0 (select (arr!40221 (_keys!12149 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1274172 () Bool)

(declare-fun contains!7695 (List!28588 (_ BitVec 64)) Bool)

(assert (=> b!1274172 (= e!726953 (contains!7695 Nil!28585 (select (arr!40221 (_keys!12149 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1274173 () Bool)

(assert (=> b!1274173 (= e!726954 call!62635)))

(assert (= (and d!140367 (not res!847101)) b!1274171))

(assert (= (and b!1274171 res!847102) b!1274172))

(assert (= (and b!1274171 res!847100) b!1274169))

(assert (= (and b!1274169 c!124126) b!1274173))

(assert (= (and b!1274169 (not c!124126)) b!1274170))

(assert (= (or b!1274173 b!1274170) bm!62632))

(assert (=> b!1274169 m!1171937))

(assert (=> b!1274169 m!1171937))

(assert (=> b!1274169 m!1171947))

(assert (=> bm!62632 m!1171937))

(declare-fun m!1171949 () Bool)

(assert (=> bm!62632 m!1171949))

(assert (=> b!1274171 m!1171937))

(assert (=> b!1274171 m!1171937))

(assert (=> b!1274171 m!1171947))

(assert (=> b!1274172 m!1171937))

(assert (=> b!1274172 m!1171937))

(declare-fun m!1171951 () Bool)

(assert (=> b!1274172 m!1171951))

(assert (=> b!1274138 d!140367))

(declare-fun b!1274182 () Bool)

(declare-fun e!726962 () (_ BitVec 32))

(declare-fun e!726961 () (_ BitVec 32))

(assert (=> b!1274182 (= e!726962 e!726961)))

(declare-fun c!124131 () Bool)

(assert (=> b!1274182 (= c!124131 (validKeyInArray!0 (select (arr!40221 (_keys!12149 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun bm!62635 () Bool)

(declare-fun call!62638 () (_ BitVec 32))

(assert (=> bm!62635 (= call!62638 (arrayCountValidKeys!0 (_keys!12149 thiss!1559) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40761 (_keys!12149 thiss!1559))))))

(declare-fun d!140369 () Bool)

(declare-fun lt!575576 () (_ BitVec 32))

(assert (=> d!140369 (and (bvsge lt!575576 #b00000000000000000000000000000000) (bvsle lt!575576 (bvsub (size!40761 (_keys!12149 thiss!1559)) #b00000000000000000000000000000000)))))

(assert (=> d!140369 (= lt!575576 e!726962)))

(declare-fun c!124132 () Bool)

(assert (=> d!140369 (= c!124132 (bvsge #b00000000000000000000000000000000 (size!40761 (_keys!12149 thiss!1559))))))

(assert (=> d!140369 (and (bvsle #b00000000000000000000000000000000 (size!40761 (_keys!12149 thiss!1559))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!40761 (_keys!12149 thiss!1559)) (size!40761 (_keys!12149 thiss!1559))))))

(assert (=> d!140369 (= (arrayCountValidKeys!0 (_keys!12149 thiss!1559) #b00000000000000000000000000000000 (size!40761 (_keys!12149 thiss!1559))) lt!575576)))

(declare-fun b!1274183 () Bool)

(assert (=> b!1274183 (= e!726962 #b00000000000000000000000000000000)))

(declare-fun b!1274184 () Bool)

(assert (=> b!1274184 (= e!726961 (bvadd #b00000000000000000000000000000001 call!62638))))

(declare-fun b!1274185 () Bool)

(assert (=> b!1274185 (= e!726961 call!62638)))

(assert (= (and d!140369 c!124132) b!1274183))

(assert (= (and d!140369 (not c!124132)) b!1274182))

(assert (= (and b!1274182 c!124131) b!1274184))

(assert (= (and b!1274182 (not c!124131)) b!1274185))

(assert (= (or b!1274184 b!1274185) bm!62635))

(assert (=> b!1274182 m!1171937))

(assert (=> b!1274182 m!1171937))

(assert (=> b!1274182 m!1171947))

(declare-fun m!1171953 () Bool)

(assert (=> bm!62635 m!1171953))

(assert (=> b!1274136 d!140369))

(declare-fun b!1274196 () Bool)

(declare-fun res!847111 () Bool)

(declare-fun e!726965 () Bool)

(assert (=> b!1274196 (=> (not res!847111) (not e!726965))))

(declare-fun size!40766 (LongMapFixedSize!6112) (_ BitVec 32))

(assert (=> b!1274196 (= res!847111 (= (size!40766 thiss!1559) (bvadd (_size!3111 thiss!1559) (bvsdiv (bvadd (extraKeys!6381 thiss!1559) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1274195 () Bool)

(declare-fun res!847114 () Bool)

(assert (=> b!1274195 (=> (not res!847114) (not e!726965))))

(assert (=> b!1274195 (= res!847114 (bvsge (size!40766 thiss!1559) (_size!3111 thiss!1559)))))

(declare-fun b!1274194 () Bool)

(declare-fun res!847112 () Bool)

(assert (=> b!1274194 (=> (not res!847112) (not e!726965))))

(assert (=> b!1274194 (= res!847112 (and (= (size!40760 (_values!6725 thiss!1559)) (bvadd (mask!34521 thiss!1559) #b00000000000000000000000000000001)) (= (size!40761 (_keys!12149 thiss!1559)) (size!40760 (_values!6725 thiss!1559))) (bvsge (_size!3111 thiss!1559) #b00000000000000000000000000000000) (bvsle (_size!3111 thiss!1559) (bvadd (mask!34521 thiss!1559) #b00000000000000000000000000000001))))))

(declare-fun d!140371 () Bool)

(declare-fun res!847113 () Bool)

(assert (=> d!140371 (=> (not res!847113) (not e!726965))))

(assert (=> d!140371 (= res!847113 (validMask!0 (mask!34521 thiss!1559)))))

(assert (=> d!140371 (= (simpleValid!459 thiss!1559) e!726965)))

(declare-fun b!1274197 () Bool)

(assert (=> b!1274197 (= e!726965 (and (bvsge (extraKeys!6381 thiss!1559) #b00000000000000000000000000000000) (bvsle (extraKeys!6381 thiss!1559) #b00000000000000000000000000000011) (bvsge (_vacant!3111 thiss!1559) #b00000000000000000000000000000000)))))

(assert (= (and d!140371 res!847113) b!1274194))

(assert (= (and b!1274194 res!847112) b!1274195))

(assert (= (and b!1274195 res!847114) b!1274196))

(assert (= (and b!1274196 res!847111) b!1274197))

(declare-fun m!1171955 () Bool)

(assert (=> b!1274196 m!1171955))

(assert (=> b!1274195 m!1171955))

(assert (=> d!140371 m!1171899))

(assert (=> d!140357 d!140371))

(declare-fun b!1274199 () Bool)

(declare-fun e!726967 () Bool)

(assert (=> b!1274199 (= e!726967 tp_is_empty!33055)))

(declare-fun mapIsEmpty!51194 () Bool)

(declare-fun mapRes!51194 () Bool)

(assert (=> mapIsEmpty!51194 mapRes!51194))

(declare-fun condMapEmpty!51194 () Bool)

(declare-fun mapDefault!51194 () ValueCell!15674)

(assert (=> mapNonEmpty!51193 (= condMapEmpty!51194 (= mapRest!51193 ((as const (Array (_ BitVec 32) ValueCell!15674)) mapDefault!51194)))))

(assert (=> mapNonEmpty!51193 (= tp!97597 (and e!726967 mapRes!51194))))

(declare-fun mapNonEmpty!51194 () Bool)

(declare-fun tp!97598 () Bool)

(declare-fun e!726966 () Bool)

(assert (=> mapNonEmpty!51194 (= mapRes!51194 (and tp!97598 e!726966))))

(declare-fun mapValue!51194 () ValueCell!15674)

(declare-fun mapKey!51194 () (_ BitVec 32))

(declare-fun mapRest!51194 () (Array (_ BitVec 32) ValueCell!15674))

(assert (=> mapNonEmpty!51194 (= mapRest!51193 (store mapRest!51194 mapKey!51194 mapValue!51194))))

(declare-fun b!1274198 () Bool)

(assert (=> b!1274198 (= e!726966 tp_is_empty!33055)))

(assert (= (and mapNonEmpty!51193 condMapEmpty!51194) mapIsEmpty!51194))

(assert (= (and mapNonEmpty!51193 (not condMapEmpty!51194)) mapNonEmpty!51194))

(assert (= (and mapNonEmpty!51194 ((_ is ValueCellFull!15674) mapValue!51194)) b!1274198))

(assert (= (and mapNonEmpty!51193 ((_ is ValueCellFull!15674) mapDefault!51194)) b!1274199))

(declare-fun m!1171957 () Bool)

(assert (=> mapNonEmpty!51194 m!1171957))

(check-sat (not b!1274158) (not bm!62629) b_and!45743 (not mapNonEmpty!51194) (not d!140371) (not b!1274171) (not bm!62635) (not b!1274157) (not b_next!27685) (not b!1274169) (not b!1274195) (not b!1274182) (not bm!62632) (not b!1274172) (not b!1274196) tp_is_empty!33055)
(check-sat b_and!45743 (not b_next!27685))

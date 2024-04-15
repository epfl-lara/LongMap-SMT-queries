; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16930 () Bool)

(assert start!16930)

(declare-fun b!170106 () Bool)

(declare-fun b_free!4189 () Bool)

(declare-fun b_next!4189 () Bool)

(assert (=> b!170106 (= b_free!4189 (not b_next!4189))))

(declare-fun tp!15186 () Bool)

(declare-fun b_and!10577 () Bool)

(assert (=> b!170106 (= tp!15186 b_and!10577)))

(declare-fun b!170100 () Bool)

(declare-fun res!80841 () Bool)

(declare-fun e!112217 () Bool)

(assert (=> b!170100 (=> (not res!80841) (not e!112217))))

(declare-datatypes ((V!4929 0))(
  ( (V!4930 (val!2025 Int)) )
))
(declare-datatypes ((ValueCell!1637 0))(
  ( (ValueCellFull!1637 (v!3884 V!4929)) (EmptyCell!1637) )
))
(declare-datatypes ((array!7009 0))(
  ( (array!7010 (arr!3334 (Array (_ BitVec 32) (_ BitVec 64))) (size!3627 (_ BitVec 32))) )
))
(declare-datatypes ((array!7011 0))(
  ( (array!7012 (arr!3335 (Array (_ BitVec 32) ValueCell!1637)) (size!3628 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2182 0))(
  ( (LongMapFixedSize!2183 (defaultEntry!3533 Int) (mask!8340 (_ BitVec 32)) (extraKeys!3274 (_ BitVec 32)) (zeroValue!3376 V!4929) (minValue!3376 V!4929) (_size!1140 (_ BitVec 32)) (_keys!5361 array!7009) (_values!3516 array!7011) (_vacant!1140 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2182)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!170100 (= res!80841 (validMask!0 (mask!8340 thiss!1248)))))

(declare-fun b!170101 () Bool)

(declare-fun e!112218 () Bool)

(declare-fun tp_is_empty!3961 () Bool)

(assert (=> b!170101 (= e!112218 tp_is_empty!3961)))

(declare-fun b!170102 () Bool)

(assert (=> b!170102 (= e!112217 (and (= (size!3628 (_values!3516 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8340 thiss!1248))) (= (size!3627 (_keys!5361 thiss!1248)) (size!3628 (_values!3516 thiss!1248))) (bvsge (mask!8340 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3274 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3274 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!170103 () Bool)

(declare-fun e!112219 () Bool)

(declare-fun e!112220 () Bool)

(declare-fun mapRes!6724 () Bool)

(assert (=> b!170103 (= e!112219 (and e!112220 mapRes!6724))))

(declare-fun condMapEmpty!6724 () Bool)

(declare-fun mapDefault!6724 () ValueCell!1637)

(assert (=> b!170103 (= condMapEmpty!6724 (= (arr!3335 (_values!3516 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1637)) mapDefault!6724)))))

(declare-fun b!170104 () Bool)

(assert (=> b!170104 (= e!112220 tp_is_empty!3961)))

(declare-fun mapIsEmpty!6724 () Bool)

(assert (=> mapIsEmpty!6724 mapRes!6724))

(declare-fun mapNonEmpty!6724 () Bool)

(declare-fun tp!15187 () Bool)

(assert (=> mapNonEmpty!6724 (= mapRes!6724 (and tp!15187 e!112218))))

(declare-fun mapRest!6724 () (Array (_ BitVec 32) ValueCell!1637))

(declare-fun mapKey!6724 () (_ BitVec 32))

(declare-fun mapValue!6724 () ValueCell!1637)

(assert (=> mapNonEmpty!6724 (= (arr!3335 (_values!3516 thiss!1248)) (store mapRest!6724 mapKey!6724 mapValue!6724))))

(declare-fun b!170105 () Bool)

(declare-fun res!80842 () Bool)

(assert (=> b!170105 (=> (not res!80842) (not e!112217))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!170105 (= res!80842 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!80840 () Bool)

(assert (=> start!16930 (=> (not res!80840) (not e!112217))))

(declare-fun valid!952 (LongMapFixedSize!2182) Bool)

(assert (=> start!16930 (= res!80840 (valid!952 thiss!1248))))

(assert (=> start!16930 e!112217))

(declare-fun e!112216 () Bool)

(assert (=> start!16930 e!112216))

(assert (=> start!16930 true))

(declare-fun array_inv!2145 (array!7009) Bool)

(declare-fun array_inv!2146 (array!7011) Bool)

(assert (=> b!170106 (= e!112216 (and tp!15186 tp_is_empty!3961 (array_inv!2145 (_keys!5361 thiss!1248)) (array_inv!2146 (_values!3516 thiss!1248)) e!112219))))

(assert (= (and start!16930 res!80840) b!170105))

(assert (= (and b!170105 res!80842) b!170100))

(assert (= (and b!170100 res!80841) b!170102))

(assert (= (and b!170103 condMapEmpty!6724) mapIsEmpty!6724))

(assert (= (and b!170103 (not condMapEmpty!6724)) mapNonEmpty!6724))

(get-info :version)

(assert (= (and mapNonEmpty!6724 ((_ is ValueCellFull!1637) mapValue!6724)) b!170101))

(assert (= (and b!170103 ((_ is ValueCellFull!1637) mapDefault!6724)) b!170104))

(assert (= b!170106 b!170103))

(assert (= start!16930 b!170106))

(declare-fun m!198241 () Bool)

(assert (=> b!170100 m!198241))

(declare-fun m!198243 () Bool)

(assert (=> mapNonEmpty!6724 m!198243))

(declare-fun m!198245 () Bool)

(assert (=> start!16930 m!198245))

(declare-fun m!198247 () Bool)

(assert (=> b!170106 m!198247))

(declare-fun m!198249 () Bool)

(assert (=> b!170106 m!198249))

(check-sat tp_is_empty!3961 (not b!170106) b_and!10577 (not b_next!4189) (not b!170100) (not start!16930) (not mapNonEmpty!6724))
(check-sat b_and!10577 (not b_next!4189))
(get-model)

(declare-fun d!51567 () Bool)

(assert (=> d!51567 (= (validMask!0 (mask!8340 thiss!1248)) (and (or (= (mask!8340 thiss!1248) #b00000000000000000000000000000111) (= (mask!8340 thiss!1248) #b00000000000000000000000000001111) (= (mask!8340 thiss!1248) #b00000000000000000000000000011111) (= (mask!8340 thiss!1248) #b00000000000000000000000000111111) (= (mask!8340 thiss!1248) #b00000000000000000000000001111111) (= (mask!8340 thiss!1248) #b00000000000000000000000011111111) (= (mask!8340 thiss!1248) #b00000000000000000000000111111111) (= (mask!8340 thiss!1248) #b00000000000000000000001111111111) (= (mask!8340 thiss!1248) #b00000000000000000000011111111111) (= (mask!8340 thiss!1248) #b00000000000000000000111111111111) (= (mask!8340 thiss!1248) #b00000000000000000001111111111111) (= (mask!8340 thiss!1248) #b00000000000000000011111111111111) (= (mask!8340 thiss!1248) #b00000000000000000111111111111111) (= (mask!8340 thiss!1248) #b00000000000000001111111111111111) (= (mask!8340 thiss!1248) #b00000000000000011111111111111111) (= (mask!8340 thiss!1248) #b00000000000000111111111111111111) (= (mask!8340 thiss!1248) #b00000000000001111111111111111111) (= (mask!8340 thiss!1248) #b00000000000011111111111111111111) (= (mask!8340 thiss!1248) #b00000000000111111111111111111111) (= (mask!8340 thiss!1248) #b00000000001111111111111111111111) (= (mask!8340 thiss!1248) #b00000000011111111111111111111111) (= (mask!8340 thiss!1248) #b00000000111111111111111111111111) (= (mask!8340 thiss!1248) #b00000001111111111111111111111111) (= (mask!8340 thiss!1248) #b00000011111111111111111111111111) (= (mask!8340 thiss!1248) #b00000111111111111111111111111111) (= (mask!8340 thiss!1248) #b00001111111111111111111111111111) (= (mask!8340 thiss!1248) #b00011111111111111111111111111111) (= (mask!8340 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8340 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!170100 d!51567))

(declare-fun d!51569 () Bool)

(assert (=> d!51569 (= (array_inv!2145 (_keys!5361 thiss!1248)) (bvsge (size!3627 (_keys!5361 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!170106 d!51569))

(declare-fun d!51571 () Bool)

(assert (=> d!51571 (= (array_inv!2146 (_values!3516 thiss!1248)) (bvsge (size!3628 (_values!3516 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!170106 d!51571))

(declare-fun d!51573 () Bool)

(declare-fun res!80867 () Bool)

(declare-fun e!112259 () Bool)

(assert (=> d!51573 (=> (not res!80867) (not e!112259))))

(declare-fun simpleValid!132 (LongMapFixedSize!2182) Bool)

(assert (=> d!51573 (= res!80867 (simpleValid!132 thiss!1248))))

(assert (=> d!51573 (= (valid!952 thiss!1248) e!112259)))

(declare-fun b!170155 () Bool)

(declare-fun res!80868 () Bool)

(assert (=> b!170155 (=> (not res!80868) (not e!112259))))

(declare-fun arrayCountValidKeys!0 (array!7009 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!170155 (= res!80868 (= (arrayCountValidKeys!0 (_keys!5361 thiss!1248) #b00000000000000000000000000000000 (size!3627 (_keys!5361 thiss!1248))) (_size!1140 thiss!1248)))))

(declare-fun b!170156 () Bool)

(declare-fun res!80869 () Bool)

(assert (=> b!170156 (=> (not res!80869) (not e!112259))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7009 (_ BitVec 32)) Bool)

(assert (=> b!170156 (= res!80869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5361 thiss!1248) (mask!8340 thiss!1248)))))

(declare-fun b!170157 () Bool)

(declare-datatypes ((List!2199 0))(
  ( (Nil!2196) (Cons!2195 (h!2812 (_ BitVec 64)) (t!6992 List!2199)) )
))
(declare-fun arrayNoDuplicates!0 (array!7009 (_ BitVec 32) List!2199) Bool)

(assert (=> b!170157 (= e!112259 (arrayNoDuplicates!0 (_keys!5361 thiss!1248) #b00000000000000000000000000000000 Nil!2196))))

(assert (= (and d!51573 res!80867) b!170155))

(assert (= (and b!170155 res!80868) b!170156))

(assert (= (and b!170156 res!80869) b!170157))

(declare-fun m!198271 () Bool)

(assert (=> d!51573 m!198271))

(declare-fun m!198273 () Bool)

(assert (=> b!170155 m!198273))

(declare-fun m!198275 () Bool)

(assert (=> b!170156 m!198275))

(declare-fun m!198277 () Bool)

(assert (=> b!170157 m!198277))

(assert (=> start!16930 d!51573))

(declare-fun condMapEmpty!6733 () Bool)

(declare-fun mapDefault!6733 () ValueCell!1637)

(assert (=> mapNonEmpty!6724 (= condMapEmpty!6733 (= mapRest!6724 ((as const (Array (_ BitVec 32) ValueCell!1637)) mapDefault!6733)))))

(declare-fun e!112265 () Bool)

(declare-fun mapRes!6733 () Bool)

(assert (=> mapNonEmpty!6724 (= tp!15187 (and e!112265 mapRes!6733))))

(declare-fun mapIsEmpty!6733 () Bool)

(assert (=> mapIsEmpty!6733 mapRes!6733))

(declare-fun mapNonEmpty!6733 () Bool)

(declare-fun tp!15202 () Bool)

(declare-fun e!112264 () Bool)

(assert (=> mapNonEmpty!6733 (= mapRes!6733 (and tp!15202 e!112264))))

(declare-fun mapKey!6733 () (_ BitVec 32))

(declare-fun mapValue!6733 () ValueCell!1637)

(declare-fun mapRest!6733 () (Array (_ BitVec 32) ValueCell!1637))

(assert (=> mapNonEmpty!6733 (= mapRest!6724 (store mapRest!6733 mapKey!6733 mapValue!6733))))

(declare-fun b!170164 () Bool)

(assert (=> b!170164 (= e!112264 tp_is_empty!3961)))

(declare-fun b!170165 () Bool)

(assert (=> b!170165 (= e!112265 tp_is_empty!3961)))

(assert (= (and mapNonEmpty!6724 condMapEmpty!6733) mapIsEmpty!6733))

(assert (= (and mapNonEmpty!6724 (not condMapEmpty!6733)) mapNonEmpty!6733))

(assert (= (and mapNonEmpty!6733 ((_ is ValueCellFull!1637) mapValue!6733)) b!170164))

(assert (= (and mapNonEmpty!6724 ((_ is ValueCellFull!1637) mapDefault!6733)) b!170165))

(declare-fun m!198279 () Bool)

(assert (=> mapNonEmpty!6733 m!198279))

(check-sat (not mapNonEmpty!6733) tp_is_empty!3961 (not b!170155) b_and!10577 (not d!51573) (not b_next!4189) (not b!170157) (not b!170156))
(check-sat b_and!10577 (not b_next!4189))
(get-model)

(declare-fun b!170174 () Bool)

(declare-fun e!112271 () (_ BitVec 32))

(declare-fun call!17350 () (_ BitVec 32))

(assert (=> b!170174 (= e!112271 call!17350)))

(declare-fun bm!17347 () Bool)

(assert (=> bm!17347 (= call!17350 (arrayCountValidKeys!0 (_keys!5361 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3627 (_keys!5361 thiss!1248))))))

(declare-fun b!170175 () Bool)

(assert (=> b!170175 (= e!112271 (bvadd #b00000000000000000000000000000001 call!17350))))

(declare-fun d!51575 () Bool)

(declare-fun lt!84819 () (_ BitVec 32))

(assert (=> d!51575 (and (bvsge lt!84819 #b00000000000000000000000000000000) (bvsle lt!84819 (bvsub (size!3627 (_keys!5361 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!112270 () (_ BitVec 32))

(assert (=> d!51575 (= lt!84819 e!112270)))

(declare-fun c!30454 () Bool)

(assert (=> d!51575 (= c!30454 (bvsge #b00000000000000000000000000000000 (size!3627 (_keys!5361 thiss!1248))))))

(assert (=> d!51575 (and (bvsle #b00000000000000000000000000000000 (size!3627 (_keys!5361 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3627 (_keys!5361 thiss!1248)) (size!3627 (_keys!5361 thiss!1248))))))

(assert (=> d!51575 (= (arrayCountValidKeys!0 (_keys!5361 thiss!1248) #b00000000000000000000000000000000 (size!3627 (_keys!5361 thiss!1248))) lt!84819)))

(declare-fun b!170176 () Bool)

(assert (=> b!170176 (= e!112270 #b00000000000000000000000000000000)))

(declare-fun b!170177 () Bool)

(assert (=> b!170177 (= e!112270 e!112271)))

(declare-fun c!30455 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!170177 (= c!30455 (validKeyInArray!0 (select (arr!3334 (_keys!5361 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51575 c!30454) b!170176))

(assert (= (and d!51575 (not c!30454)) b!170177))

(assert (= (and b!170177 c!30455) b!170175))

(assert (= (and b!170177 (not c!30455)) b!170174))

(assert (= (or b!170175 b!170174) bm!17347))

(declare-fun m!198281 () Bool)

(assert (=> bm!17347 m!198281))

(declare-fun m!198283 () Bool)

(assert (=> b!170177 m!198283))

(assert (=> b!170177 m!198283))

(declare-fun m!198285 () Bool)

(assert (=> b!170177 m!198285))

(assert (=> b!170155 d!51575))

(declare-fun b!170186 () Bool)

(declare-fun e!112279 () Bool)

(declare-fun call!17353 () Bool)

(assert (=> b!170186 (= e!112279 call!17353)))

(declare-fun b!170187 () Bool)

(declare-fun e!112280 () Bool)

(assert (=> b!170187 (= e!112279 e!112280)))

(declare-fun lt!84826 () (_ BitVec 64))

(assert (=> b!170187 (= lt!84826 (select (arr!3334 (_keys!5361 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5221 0))(
  ( (Unit!5222) )
))
(declare-fun lt!84828 () Unit!5221)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7009 (_ BitVec 64) (_ BitVec 32)) Unit!5221)

(assert (=> b!170187 (= lt!84828 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5361 thiss!1248) lt!84826 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7009 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!170187 (arrayContainsKey!0 (_keys!5361 thiss!1248) lt!84826 #b00000000000000000000000000000000)))

(declare-fun lt!84827 () Unit!5221)

(assert (=> b!170187 (= lt!84827 lt!84828)))

(declare-fun res!80874 () Bool)

(declare-datatypes ((SeekEntryResult!542 0))(
  ( (MissingZero!542 (index!4336 (_ BitVec 32))) (Found!542 (index!4337 (_ BitVec 32))) (Intermediate!542 (undefined!1354 Bool) (index!4338 (_ BitVec 32)) (x!18871 (_ BitVec 32))) (Undefined!542) (MissingVacant!542 (index!4339 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7009 (_ BitVec 32)) SeekEntryResult!542)

(assert (=> b!170187 (= res!80874 (= (seekEntryOrOpen!0 (select (arr!3334 (_keys!5361 thiss!1248)) #b00000000000000000000000000000000) (_keys!5361 thiss!1248) (mask!8340 thiss!1248)) (Found!542 #b00000000000000000000000000000000)))))

(assert (=> b!170187 (=> (not res!80874) (not e!112280))))

(declare-fun d!51577 () Bool)

(declare-fun res!80875 () Bool)

(declare-fun e!112278 () Bool)

(assert (=> d!51577 (=> res!80875 e!112278)))

(assert (=> d!51577 (= res!80875 (bvsge #b00000000000000000000000000000000 (size!3627 (_keys!5361 thiss!1248))))))

(assert (=> d!51577 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5361 thiss!1248) (mask!8340 thiss!1248)) e!112278)))

(declare-fun b!170188 () Bool)

(assert (=> b!170188 (= e!112278 e!112279)))

(declare-fun c!30458 () Bool)

(assert (=> b!170188 (= c!30458 (validKeyInArray!0 (select (arr!3334 (_keys!5361 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17350 () Bool)

(assert (=> bm!17350 (= call!17353 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5361 thiss!1248) (mask!8340 thiss!1248)))))

(declare-fun b!170189 () Bool)

(assert (=> b!170189 (= e!112280 call!17353)))

(assert (= (and d!51577 (not res!80875)) b!170188))

(assert (= (and b!170188 c!30458) b!170187))

(assert (= (and b!170188 (not c!30458)) b!170186))

(assert (= (and b!170187 res!80874) b!170189))

(assert (= (or b!170189 b!170186) bm!17350))

(assert (=> b!170187 m!198283))

(declare-fun m!198287 () Bool)

(assert (=> b!170187 m!198287))

(declare-fun m!198289 () Bool)

(assert (=> b!170187 m!198289))

(assert (=> b!170187 m!198283))

(declare-fun m!198291 () Bool)

(assert (=> b!170187 m!198291))

(assert (=> b!170188 m!198283))

(assert (=> b!170188 m!198283))

(assert (=> b!170188 m!198285))

(declare-fun m!198293 () Bool)

(assert (=> bm!17350 m!198293))

(assert (=> b!170156 d!51577))

(declare-fun d!51579 () Bool)

(declare-fun res!80885 () Bool)

(declare-fun e!112283 () Bool)

(assert (=> d!51579 (=> (not res!80885) (not e!112283))))

(assert (=> d!51579 (= res!80885 (validMask!0 (mask!8340 thiss!1248)))))

(assert (=> d!51579 (= (simpleValid!132 thiss!1248) e!112283)))

(declare-fun b!170199 () Bool)

(declare-fun res!80887 () Bool)

(assert (=> b!170199 (=> (not res!80887) (not e!112283))))

(declare-fun size!3633 (LongMapFixedSize!2182) (_ BitVec 32))

(assert (=> b!170199 (= res!80887 (bvsge (size!3633 thiss!1248) (_size!1140 thiss!1248)))))

(declare-fun b!170201 () Bool)

(assert (=> b!170201 (= e!112283 (and (bvsge (extraKeys!3274 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3274 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1140 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!170200 () Bool)

(declare-fun res!80886 () Bool)

(assert (=> b!170200 (=> (not res!80886) (not e!112283))))

(assert (=> b!170200 (= res!80886 (= (size!3633 thiss!1248) (bvadd (_size!1140 thiss!1248) (bvsdiv (bvadd (extraKeys!3274 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!170198 () Bool)

(declare-fun res!80884 () Bool)

(assert (=> b!170198 (=> (not res!80884) (not e!112283))))

(assert (=> b!170198 (= res!80884 (and (= (size!3628 (_values!3516 thiss!1248)) (bvadd (mask!8340 thiss!1248) #b00000000000000000000000000000001)) (= (size!3627 (_keys!5361 thiss!1248)) (size!3628 (_values!3516 thiss!1248))) (bvsge (_size!1140 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1140 thiss!1248) (bvadd (mask!8340 thiss!1248) #b00000000000000000000000000000001))))))

(assert (= (and d!51579 res!80885) b!170198))

(assert (= (and b!170198 res!80884) b!170199))

(assert (= (and b!170199 res!80887) b!170200))

(assert (= (and b!170200 res!80886) b!170201))

(assert (=> d!51579 m!198241))

(declare-fun m!198295 () Bool)

(assert (=> b!170199 m!198295))

(assert (=> b!170200 m!198295))

(assert (=> d!51573 d!51579))

(declare-fun b!170212 () Bool)

(declare-fun e!112294 () Bool)

(declare-fun call!17356 () Bool)

(assert (=> b!170212 (= e!112294 call!17356)))

(declare-fun bm!17353 () Bool)

(declare-fun c!30461 () Bool)

(assert (=> bm!17353 (= call!17356 (arrayNoDuplicates!0 (_keys!5361 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30461 (Cons!2195 (select (arr!3334 (_keys!5361 thiss!1248)) #b00000000000000000000000000000000) Nil!2196) Nil!2196)))))

(declare-fun b!170213 () Bool)

(declare-fun e!112293 () Bool)

(assert (=> b!170213 (= e!112293 e!112294)))

(assert (=> b!170213 (= c!30461 (validKeyInArray!0 (select (arr!3334 (_keys!5361 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!170214 () Bool)

(declare-fun e!112292 () Bool)

(declare-fun contains!1140 (List!2199 (_ BitVec 64)) Bool)

(assert (=> b!170214 (= e!112292 (contains!1140 Nil!2196 (select (arr!3334 (_keys!5361 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!170215 () Bool)

(declare-fun e!112295 () Bool)

(assert (=> b!170215 (= e!112295 e!112293)))

(declare-fun res!80895 () Bool)

(assert (=> b!170215 (=> (not res!80895) (not e!112293))))

(assert (=> b!170215 (= res!80895 (not e!112292))))

(declare-fun res!80896 () Bool)

(assert (=> b!170215 (=> (not res!80896) (not e!112292))))

(assert (=> b!170215 (= res!80896 (validKeyInArray!0 (select (arr!3334 (_keys!5361 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!170216 () Bool)

(assert (=> b!170216 (= e!112294 call!17356)))

(declare-fun d!51581 () Bool)

(declare-fun res!80894 () Bool)

(assert (=> d!51581 (=> res!80894 e!112295)))

(assert (=> d!51581 (= res!80894 (bvsge #b00000000000000000000000000000000 (size!3627 (_keys!5361 thiss!1248))))))

(assert (=> d!51581 (= (arrayNoDuplicates!0 (_keys!5361 thiss!1248) #b00000000000000000000000000000000 Nil!2196) e!112295)))

(assert (= (and d!51581 (not res!80894)) b!170215))

(assert (= (and b!170215 res!80896) b!170214))

(assert (= (and b!170215 res!80895) b!170213))

(assert (= (and b!170213 c!30461) b!170216))

(assert (= (and b!170213 (not c!30461)) b!170212))

(assert (= (or b!170216 b!170212) bm!17353))

(assert (=> bm!17353 m!198283))

(declare-fun m!198297 () Bool)

(assert (=> bm!17353 m!198297))

(assert (=> b!170213 m!198283))

(assert (=> b!170213 m!198283))

(assert (=> b!170213 m!198285))

(assert (=> b!170214 m!198283))

(assert (=> b!170214 m!198283))

(declare-fun m!198299 () Bool)

(assert (=> b!170214 m!198299))

(assert (=> b!170215 m!198283))

(assert (=> b!170215 m!198283))

(assert (=> b!170215 m!198285))

(assert (=> b!170157 d!51581))

(declare-fun condMapEmpty!6734 () Bool)

(declare-fun mapDefault!6734 () ValueCell!1637)

(assert (=> mapNonEmpty!6733 (= condMapEmpty!6734 (= mapRest!6733 ((as const (Array (_ BitVec 32) ValueCell!1637)) mapDefault!6734)))))

(declare-fun e!112297 () Bool)

(declare-fun mapRes!6734 () Bool)

(assert (=> mapNonEmpty!6733 (= tp!15202 (and e!112297 mapRes!6734))))

(declare-fun mapIsEmpty!6734 () Bool)

(assert (=> mapIsEmpty!6734 mapRes!6734))

(declare-fun mapNonEmpty!6734 () Bool)

(declare-fun tp!15203 () Bool)

(declare-fun e!112296 () Bool)

(assert (=> mapNonEmpty!6734 (= mapRes!6734 (and tp!15203 e!112296))))

(declare-fun mapKey!6734 () (_ BitVec 32))

(declare-fun mapValue!6734 () ValueCell!1637)

(declare-fun mapRest!6734 () (Array (_ BitVec 32) ValueCell!1637))

(assert (=> mapNonEmpty!6734 (= mapRest!6733 (store mapRest!6734 mapKey!6734 mapValue!6734))))

(declare-fun b!170217 () Bool)

(assert (=> b!170217 (= e!112296 tp_is_empty!3961)))

(declare-fun b!170218 () Bool)

(assert (=> b!170218 (= e!112297 tp_is_empty!3961)))

(assert (= (and mapNonEmpty!6733 condMapEmpty!6734) mapIsEmpty!6734))

(assert (= (and mapNonEmpty!6733 (not condMapEmpty!6734)) mapNonEmpty!6734))

(assert (= (and mapNonEmpty!6734 ((_ is ValueCellFull!1637) mapValue!6734)) b!170217))

(assert (= (and mapNonEmpty!6733 ((_ is ValueCellFull!1637) mapDefault!6734)) b!170218))

(declare-fun m!198301 () Bool)

(assert (=> mapNonEmpty!6734 m!198301))

(check-sat tp_is_empty!3961 (not b!170188) (not mapNonEmpty!6734) (not b!170199) (not b_next!4189) (not bm!17350) (not b!170215) (not b!170187) (not b!170200) (not bm!17353) (not d!51579) (not b!170213) (not b!170177) b_and!10577 (not b!170214) (not bm!17347))
(check-sat b_and!10577 (not b_next!4189))

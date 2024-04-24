; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16976 () Bool)

(assert start!16976)

(declare-fun b!170687 () Bool)

(declare-fun b_free!4219 () Bool)

(declare-fun b_next!4219 () Bool)

(assert (=> b!170687 (= b_free!4219 (not b_next!4219))))

(declare-fun tp!15281 () Bool)

(declare-fun b_and!10647 () Bool)

(assert (=> b!170687 (= tp!15281 b_and!10647)))

(declare-fun mapNonEmpty!6773 () Bool)

(declare-fun mapRes!6773 () Bool)

(declare-fun tp!15280 () Bool)

(declare-fun e!112656 () Bool)

(assert (=> mapNonEmpty!6773 (= mapRes!6773 (and tp!15280 e!112656))))

(declare-datatypes ((V!4969 0))(
  ( (V!4970 (val!2040 Int)) )
))
(declare-datatypes ((ValueCell!1652 0))(
  ( (ValueCellFull!1652 (v!3906 V!4969)) (EmptyCell!1652) )
))
(declare-fun mapValue!6773 () ValueCell!1652)

(declare-datatypes ((array!7077 0))(
  ( (array!7078 (arr!3368 (Array (_ BitVec 32) (_ BitVec 64))) (size!3661 (_ BitVec 32))) )
))
(declare-datatypes ((array!7079 0))(
  ( (array!7080 (arr!3369 (Array (_ BitVec 32) ValueCell!1652)) (size!3662 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2212 0))(
  ( (LongMapFixedSize!2213 (defaultEntry!3548 Int) (mask!8368 (_ BitVec 32)) (extraKeys!3289 (_ BitVec 32)) (zeroValue!3391 V!4969) (minValue!3391 V!4969) (_size!1155 (_ BitVec 32)) (_keys!5378 array!7077) (_values!3531 array!7079) (_vacant!1155 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2212)

(declare-fun mapRest!6773 () (Array (_ BitVec 32) ValueCell!1652))

(declare-fun mapKey!6773 () (_ BitVec 32))

(assert (=> mapNonEmpty!6773 (= (arr!3369 (_values!3531 thiss!1248)) (store mapRest!6773 mapKey!6773 mapValue!6773))))

(declare-fun b!170681 () Bool)

(declare-fun res!81129 () Bool)

(declare-fun e!112654 () Bool)

(assert (=> b!170681 (=> (not res!81129) (not e!112654))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!170681 (= res!81129 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!81131 () Bool)

(assert (=> start!16976 (=> (not res!81131) (not e!112654))))

(declare-fun valid!958 (LongMapFixedSize!2212) Bool)

(assert (=> start!16976 (= res!81131 (valid!958 thiss!1248))))

(assert (=> start!16976 e!112654))

(declare-fun e!112653 () Bool)

(assert (=> start!16976 e!112653))

(assert (=> start!16976 true))

(declare-fun b!170682 () Bool)

(declare-fun res!81132 () Bool)

(assert (=> b!170682 (=> (not res!81132) (not e!112654))))

(assert (=> b!170682 (= res!81132 (and (= (size!3662 (_values!3531 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8368 thiss!1248))) (= (size!3661 (_keys!5378 thiss!1248)) (size!3662 (_values!3531 thiss!1248))) (bvsge (mask!8368 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3289 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3289 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!3289 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!3289 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!3289 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!3289 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!3289 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!170683 () Bool)

(declare-fun e!112652 () Bool)

(declare-fun e!112651 () Bool)

(assert (=> b!170683 (= e!112652 (and e!112651 mapRes!6773))))

(declare-fun condMapEmpty!6773 () Bool)

(declare-fun mapDefault!6773 () ValueCell!1652)

(assert (=> b!170683 (= condMapEmpty!6773 (= (arr!3369 (_values!3531 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1652)) mapDefault!6773)))))

(declare-fun b!170684 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7077 (_ BitVec 32)) Bool)

(assert (=> b!170684 (= e!112654 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5378 thiss!1248) (mask!8368 thiss!1248))))))

(declare-fun b!170685 () Bool)

(declare-fun tp_is_empty!3991 () Bool)

(assert (=> b!170685 (= e!112656 tp_is_empty!3991)))

(declare-fun mapIsEmpty!6773 () Bool)

(assert (=> mapIsEmpty!6773 mapRes!6773))

(declare-fun b!170686 () Bool)

(assert (=> b!170686 (= e!112651 tp_is_empty!3991)))

(declare-fun array_inv!2167 (array!7077) Bool)

(declare-fun array_inv!2168 (array!7079) Bool)

(assert (=> b!170687 (= e!112653 (and tp!15281 tp_is_empty!3991 (array_inv!2167 (_keys!5378 thiss!1248)) (array_inv!2168 (_values!3531 thiss!1248)) e!112652))))

(declare-fun b!170688 () Bool)

(declare-fun res!81130 () Bool)

(assert (=> b!170688 (=> (not res!81130) (not e!112654))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!170688 (= res!81130 (validMask!0 (mask!8368 thiss!1248)))))

(assert (= (and start!16976 res!81131) b!170681))

(assert (= (and b!170681 res!81129) b!170688))

(assert (= (and b!170688 res!81130) b!170682))

(assert (= (and b!170682 res!81132) b!170684))

(assert (= (and b!170683 condMapEmpty!6773) mapIsEmpty!6773))

(assert (= (and b!170683 (not condMapEmpty!6773)) mapNonEmpty!6773))

(get-info :version)

(assert (= (and mapNonEmpty!6773 ((_ is ValueCellFull!1652) mapValue!6773)) b!170685))

(assert (= (and b!170683 ((_ is ValueCellFull!1652) mapDefault!6773)) b!170686))

(assert (= b!170687 b!170683))

(assert (= start!16976 b!170687))

(declare-fun m!199225 () Bool)

(assert (=> b!170688 m!199225))

(declare-fun m!199227 () Bool)

(assert (=> mapNonEmpty!6773 m!199227))

(declare-fun m!199229 () Bool)

(assert (=> b!170684 m!199229))

(declare-fun m!199231 () Bool)

(assert (=> start!16976 m!199231))

(declare-fun m!199233 () Bool)

(assert (=> b!170687 m!199233))

(declare-fun m!199235 () Bool)

(assert (=> b!170687 m!199235))

(check-sat tp_is_empty!3991 (not b!170687) (not b!170684) (not mapNonEmpty!6773) (not b_next!4219) (not b!170688) (not start!16976) b_and!10647)
(check-sat b_and!10647 (not b_next!4219))
(get-model)

(declare-fun d!51815 () Bool)

(assert (=> d!51815 (= (array_inv!2167 (_keys!5378 thiss!1248)) (bvsge (size!3661 (_keys!5378 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!170687 d!51815))

(declare-fun d!51817 () Bool)

(assert (=> d!51817 (= (array_inv!2168 (_values!3531 thiss!1248)) (bvsge (size!3662 (_values!3531 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!170687 d!51817))

(declare-fun d!51819 () Bool)

(declare-fun res!81163 () Bool)

(declare-fun e!112695 () Bool)

(assert (=> d!51819 (=> (not res!81163) (not e!112695))))

(declare-fun simpleValid!133 (LongMapFixedSize!2212) Bool)

(assert (=> d!51819 (= res!81163 (simpleValid!133 thiss!1248))))

(assert (=> d!51819 (= (valid!958 thiss!1248) e!112695)))

(declare-fun b!170743 () Bool)

(declare-fun res!81164 () Bool)

(assert (=> b!170743 (=> (not res!81164) (not e!112695))))

(declare-fun arrayCountValidKeys!0 (array!7077 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!170743 (= res!81164 (= (arrayCountValidKeys!0 (_keys!5378 thiss!1248) #b00000000000000000000000000000000 (size!3661 (_keys!5378 thiss!1248))) (_size!1155 thiss!1248)))))

(declare-fun b!170744 () Bool)

(declare-fun res!81165 () Bool)

(assert (=> b!170744 (=> (not res!81165) (not e!112695))))

(assert (=> b!170744 (= res!81165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5378 thiss!1248) (mask!8368 thiss!1248)))))

(declare-fun b!170745 () Bool)

(declare-datatypes ((List!2172 0))(
  ( (Nil!2169) (Cons!2168 (h!2785 (_ BitVec 64)) (t!6966 List!2172)) )
))
(declare-fun arrayNoDuplicates!0 (array!7077 (_ BitVec 32) List!2172) Bool)

(assert (=> b!170745 (= e!112695 (arrayNoDuplicates!0 (_keys!5378 thiss!1248) #b00000000000000000000000000000000 Nil!2169))))

(assert (= (and d!51819 res!81163) b!170743))

(assert (= (and b!170743 res!81164) b!170744))

(assert (= (and b!170744 res!81165) b!170745))

(declare-fun m!199261 () Bool)

(assert (=> d!51819 m!199261))

(declare-fun m!199263 () Bool)

(assert (=> b!170743 m!199263))

(assert (=> b!170744 m!199229))

(declare-fun m!199265 () Bool)

(assert (=> b!170745 m!199265))

(assert (=> start!16976 d!51819))

(declare-fun d!51821 () Bool)

(declare-fun res!81170 () Bool)

(declare-fun e!112702 () Bool)

(assert (=> d!51821 (=> res!81170 e!112702)))

(assert (=> d!51821 (= res!81170 (bvsge #b00000000000000000000000000000000 (size!3661 (_keys!5378 thiss!1248))))))

(assert (=> d!51821 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5378 thiss!1248) (mask!8368 thiss!1248)) e!112702)))

(declare-fun bm!17368 () Bool)

(declare-fun call!17371 () Bool)

(assert (=> bm!17368 (= call!17371 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5378 thiss!1248) (mask!8368 thiss!1248)))))

(declare-fun b!170754 () Bool)

(declare-fun e!112704 () Bool)

(assert (=> b!170754 (= e!112704 call!17371)))

(declare-fun b!170755 () Bool)

(declare-fun e!112703 () Bool)

(assert (=> b!170755 (= e!112703 call!17371)))

(declare-fun b!170756 () Bool)

(assert (=> b!170756 (= e!112704 e!112703)))

(declare-fun lt!85075 () (_ BitVec 64))

(assert (=> b!170756 (= lt!85075 (select (arr!3368 (_keys!5378 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5247 0))(
  ( (Unit!5248) )
))
(declare-fun lt!85077 () Unit!5247)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7077 (_ BitVec 64) (_ BitVec 32)) Unit!5247)

(assert (=> b!170756 (= lt!85077 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5378 thiss!1248) lt!85075 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7077 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!170756 (arrayContainsKey!0 (_keys!5378 thiss!1248) lt!85075 #b00000000000000000000000000000000)))

(declare-fun lt!85076 () Unit!5247)

(assert (=> b!170756 (= lt!85076 lt!85077)))

(declare-fun res!81171 () Bool)

(declare-datatypes ((SeekEntryResult!526 0))(
  ( (MissingZero!526 (index!4272 (_ BitVec 32))) (Found!526 (index!4273 (_ BitVec 32))) (Intermediate!526 (undefined!1338 Bool) (index!4274 (_ BitVec 32)) (x!18904 (_ BitVec 32))) (Undefined!526) (MissingVacant!526 (index!4275 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7077 (_ BitVec 32)) SeekEntryResult!526)

(assert (=> b!170756 (= res!81171 (= (seekEntryOrOpen!0 (select (arr!3368 (_keys!5378 thiss!1248)) #b00000000000000000000000000000000) (_keys!5378 thiss!1248) (mask!8368 thiss!1248)) (Found!526 #b00000000000000000000000000000000)))))

(assert (=> b!170756 (=> (not res!81171) (not e!112703))))

(declare-fun b!170757 () Bool)

(assert (=> b!170757 (= e!112702 e!112704)))

(declare-fun c!30503 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!170757 (= c!30503 (validKeyInArray!0 (select (arr!3368 (_keys!5378 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51821 (not res!81170)) b!170757))

(assert (= (and b!170757 c!30503) b!170756))

(assert (= (and b!170757 (not c!30503)) b!170754))

(assert (= (and b!170756 res!81171) b!170755))

(assert (= (or b!170755 b!170754) bm!17368))

(declare-fun m!199267 () Bool)

(assert (=> bm!17368 m!199267))

(declare-fun m!199269 () Bool)

(assert (=> b!170756 m!199269))

(declare-fun m!199271 () Bool)

(assert (=> b!170756 m!199271))

(declare-fun m!199273 () Bool)

(assert (=> b!170756 m!199273))

(assert (=> b!170756 m!199269))

(declare-fun m!199275 () Bool)

(assert (=> b!170756 m!199275))

(assert (=> b!170757 m!199269))

(assert (=> b!170757 m!199269))

(declare-fun m!199277 () Bool)

(assert (=> b!170757 m!199277))

(assert (=> b!170684 d!51821))

(declare-fun d!51823 () Bool)

(assert (=> d!51823 (= (validMask!0 (mask!8368 thiss!1248)) (and (or (= (mask!8368 thiss!1248) #b00000000000000000000000000000111) (= (mask!8368 thiss!1248) #b00000000000000000000000000001111) (= (mask!8368 thiss!1248) #b00000000000000000000000000011111) (= (mask!8368 thiss!1248) #b00000000000000000000000000111111) (= (mask!8368 thiss!1248) #b00000000000000000000000001111111) (= (mask!8368 thiss!1248) #b00000000000000000000000011111111) (= (mask!8368 thiss!1248) #b00000000000000000000000111111111) (= (mask!8368 thiss!1248) #b00000000000000000000001111111111) (= (mask!8368 thiss!1248) #b00000000000000000000011111111111) (= (mask!8368 thiss!1248) #b00000000000000000000111111111111) (= (mask!8368 thiss!1248) #b00000000000000000001111111111111) (= (mask!8368 thiss!1248) #b00000000000000000011111111111111) (= (mask!8368 thiss!1248) #b00000000000000000111111111111111) (= (mask!8368 thiss!1248) #b00000000000000001111111111111111) (= (mask!8368 thiss!1248) #b00000000000000011111111111111111) (= (mask!8368 thiss!1248) #b00000000000000111111111111111111) (= (mask!8368 thiss!1248) #b00000000000001111111111111111111) (= (mask!8368 thiss!1248) #b00000000000011111111111111111111) (= (mask!8368 thiss!1248) #b00000000000111111111111111111111) (= (mask!8368 thiss!1248) #b00000000001111111111111111111111) (= (mask!8368 thiss!1248) #b00000000011111111111111111111111) (= (mask!8368 thiss!1248) #b00000000111111111111111111111111) (= (mask!8368 thiss!1248) #b00000001111111111111111111111111) (= (mask!8368 thiss!1248) #b00000011111111111111111111111111) (= (mask!8368 thiss!1248) #b00000111111111111111111111111111) (= (mask!8368 thiss!1248) #b00001111111111111111111111111111) (= (mask!8368 thiss!1248) #b00011111111111111111111111111111) (= (mask!8368 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8368 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!170688 d!51823))

(declare-fun b!170764 () Bool)

(declare-fun e!112710 () Bool)

(assert (=> b!170764 (= e!112710 tp_is_empty!3991)))

(declare-fun condMapEmpty!6782 () Bool)

(declare-fun mapDefault!6782 () ValueCell!1652)

(assert (=> mapNonEmpty!6773 (= condMapEmpty!6782 (= mapRest!6773 ((as const (Array (_ BitVec 32) ValueCell!1652)) mapDefault!6782)))))

(declare-fun e!112709 () Bool)

(declare-fun mapRes!6782 () Bool)

(assert (=> mapNonEmpty!6773 (= tp!15280 (and e!112709 mapRes!6782))))

(declare-fun mapNonEmpty!6782 () Bool)

(declare-fun tp!15296 () Bool)

(assert (=> mapNonEmpty!6782 (= mapRes!6782 (and tp!15296 e!112710))))

(declare-fun mapRest!6782 () (Array (_ BitVec 32) ValueCell!1652))

(declare-fun mapKey!6782 () (_ BitVec 32))

(declare-fun mapValue!6782 () ValueCell!1652)

(assert (=> mapNonEmpty!6782 (= mapRest!6773 (store mapRest!6782 mapKey!6782 mapValue!6782))))

(declare-fun b!170765 () Bool)

(assert (=> b!170765 (= e!112709 tp_is_empty!3991)))

(declare-fun mapIsEmpty!6782 () Bool)

(assert (=> mapIsEmpty!6782 mapRes!6782))

(assert (= (and mapNonEmpty!6773 condMapEmpty!6782) mapIsEmpty!6782))

(assert (= (and mapNonEmpty!6773 (not condMapEmpty!6782)) mapNonEmpty!6782))

(assert (= (and mapNonEmpty!6782 ((_ is ValueCellFull!1652) mapValue!6782)) b!170764))

(assert (= (and mapNonEmpty!6773 ((_ is ValueCellFull!1652) mapDefault!6782)) b!170765))

(declare-fun m!199279 () Bool)

(assert (=> mapNonEmpty!6782 m!199279))

(check-sat (not d!51819) (not b!170745) (not b!170756) (not b!170744) (not b_next!4219) (not b!170743) b_and!10647 (not bm!17368) (not mapNonEmpty!6782) (not b!170757) tp_is_empty!3991)
(check-sat b_and!10647 (not b_next!4219))

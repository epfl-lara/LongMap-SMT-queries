; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107368 () Bool)

(assert start!107368)

(declare-fun b!1272284 () Bool)

(declare-fun b_free!27661 () Bool)

(declare-fun b_next!27661 () Bool)

(assert (=> b!1272284 (= b_free!27661 (not b_next!27661))))

(declare-fun tp!97495 () Bool)

(declare-fun b_and!45699 () Bool)

(assert (=> b!1272284 (= tp!97495 b_and!45699)))

(declare-fun b!1272283 () Bool)

(declare-fun e!725661 () Bool)

(declare-fun e!725662 () Bool)

(declare-fun mapRes!51133 () Bool)

(assert (=> b!1272283 (= e!725661 (and e!725662 mapRes!51133))))

(declare-fun condMapEmpty!51133 () Bool)

(declare-datatypes ((V!49235 0))(
  ( (V!49236 (val!16590 Int)) )
))
(declare-datatypes ((ValueCell!15662 0))(
  ( (ValueCellFull!15662 (v!19226 V!49235)) (EmptyCell!15662) )
))
(declare-datatypes ((array!83213 0))(
  ( (array!83214 (arr!40142 (Array (_ BitVec 32) ValueCell!15662)) (size!40680 (_ BitVec 32))) )
))
(declare-datatypes ((array!83215 0))(
  ( (array!83216 (arr!40143 (Array (_ BitVec 32) (_ BitVec 64))) (size!40681 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6088 0))(
  ( (LongMapFixedSize!6089 (defaultEntry!6690 Int) (mask!34429 (_ BitVec 32)) (extraKeys!6369 (_ BitVec 32)) (zeroValue!6475 V!49235) (minValue!6475 V!49235) (_size!3099 (_ BitVec 32)) (_keys!12092 array!83215) (_values!6713 array!83213) (_vacant!3099 (_ BitVec 32))) )
))
(declare-fun thiss!1559 () LongMapFixedSize!6088)

(declare-fun mapDefault!51133 () ValueCell!15662)

(assert (=> b!1272283 (= condMapEmpty!51133 (= (arr!40142 (_values!6713 thiss!1559)) ((as const (Array (_ BitVec 32) ValueCell!15662)) mapDefault!51133)))))

(declare-fun e!725665 () Bool)

(declare-fun tp_is_empty!33031 () Bool)

(declare-fun array_inv!30685 (array!83215) Bool)

(declare-fun array_inv!30686 (array!83213) Bool)

(assert (=> b!1272284 (= e!725665 (and tp!97495 tp_is_empty!33031 (array_inv!30685 (_keys!12092 thiss!1559)) (array_inv!30686 (_values!6713 thiss!1559)) e!725661))))

(declare-fun mapIsEmpty!51133 () Bool)

(assert (=> mapIsEmpty!51133 mapRes!51133))

(declare-fun res!846336 () Bool)

(declare-fun e!725663 () Bool)

(assert (=> start!107368 (=> (not res!846336) (not e!725663))))

(declare-fun valid!2278 (LongMapFixedSize!6088) Bool)

(assert (=> start!107368 (= res!846336 (valid!2278 thiss!1559))))

(assert (=> start!107368 e!725663))

(assert (=> start!107368 e!725665))

(declare-fun b!1272285 () Bool)

(assert (=> b!1272285 (= e!725662 tp_is_empty!33031)))

(declare-fun mapNonEmpty!51133 () Bool)

(declare-fun tp!97496 () Bool)

(declare-fun e!725666 () Bool)

(assert (=> mapNonEmpty!51133 (= mapRes!51133 (and tp!97496 e!725666))))

(declare-fun mapKey!51133 () (_ BitVec 32))

(declare-fun mapRest!51133 () (Array (_ BitVec 32) ValueCell!15662))

(declare-fun mapValue!51133 () ValueCell!15662)

(assert (=> mapNonEmpty!51133 (= (arr!40142 (_values!6713 thiss!1559)) (store mapRest!51133 mapKey!51133 mapValue!51133))))

(declare-fun b!1272286 () Bool)

(assert (=> b!1272286 (= e!725666 tp_is_empty!33031)))

(declare-fun b!1272287 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1272287 (= e!725663 (not (validMask!0 (mask!34429 thiss!1559))))))

(assert (= (and start!107368 res!846336) b!1272287))

(assert (= (and b!1272283 condMapEmpty!51133) mapIsEmpty!51133))

(assert (= (and b!1272283 (not condMapEmpty!51133)) mapNonEmpty!51133))

(get-info :version)

(assert (= (and mapNonEmpty!51133 ((_ is ValueCellFull!15662) mapValue!51133)) b!1272286))

(assert (= (and b!1272283 ((_ is ValueCellFull!15662) mapDefault!51133)) b!1272285))

(assert (= b!1272284 b!1272283))

(assert (= start!107368 b!1272284))

(declare-fun m!1169559 () Bool)

(assert (=> b!1272284 m!1169559))

(declare-fun m!1169561 () Bool)

(assert (=> b!1272284 m!1169561))

(declare-fun m!1169563 () Bool)

(assert (=> start!107368 m!1169563))

(declare-fun m!1169565 () Bool)

(assert (=> mapNonEmpty!51133 m!1169565))

(declare-fun m!1169567 () Bool)

(assert (=> b!1272287 m!1169567))

(check-sat (not b_next!27661) (not mapNonEmpty!51133) (not b!1272287) (not b!1272284) b_and!45699 (not start!107368) tp_is_empty!33031)
(check-sat b_and!45699 (not b_next!27661))
(get-model)

(declare-fun d!139733 () Bool)

(declare-fun res!846349 () Bool)

(declare-fun e!725705 () Bool)

(assert (=> d!139733 (=> (not res!846349) (not e!725705))))

(declare-fun simpleValid!455 (LongMapFixedSize!6088) Bool)

(assert (=> d!139733 (= res!846349 (simpleValid!455 thiss!1559))))

(assert (=> d!139733 (= (valid!2278 thiss!1559) e!725705)))

(declare-fun b!1272324 () Bool)

(declare-fun res!846350 () Bool)

(assert (=> b!1272324 (=> (not res!846350) (not e!725705))))

(declare-fun arrayCountValidKeys!0 (array!83215 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1272324 (= res!846350 (= (arrayCountValidKeys!0 (_keys!12092 thiss!1559) #b00000000000000000000000000000000 (size!40681 (_keys!12092 thiss!1559))) (_size!3099 thiss!1559)))))

(declare-fun b!1272325 () Bool)

(declare-fun res!846351 () Bool)

(assert (=> b!1272325 (=> (not res!846351) (not e!725705))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83215 (_ BitVec 32)) Bool)

(assert (=> b!1272325 (= res!846351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12092 thiss!1559) (mask!34429 thiss!1559)))))

(declare-fun b!1272326 () Bool)

(declare-datatypes ((List!28630 0))(
  ( (Nil!28627) (Cons!28626 (h!29835 (_ BitVec 64)) (t!42155 List!28630)) )
))
(declare-fun arrayNoDuplicates!0 (array!83215 (_ BitVec 32) List!28630) Bool)

(assert (=> b!1272326 (= e!725705 (arrayNoDuplicates!0 (_keys!12092 thiss!1559) #b00000000000000000000000000000000 Nil!28627))))

(assert (= (and d!139733 res!846349) b!1272324))

(assert (= (and b!1272324 res!846350) b!1272325))

(assert (= (and b!1272325 res!846351) b!1272326))

(declare-fun m!1169589 () Bool)

(assert (=> d!139733 m!1169589))

(declare-fun m!1169591 () Bool)

(assert (=> b!1272324 m!1169591))

(declare-fun m!1169593 () Bool)

(assert (=> b!1272325 m!1169593))

(declare-fun m!1169595 () Bool)

(assert (=> b!1272326 m!1169595))

(assert (=> start!107368 d!139733))

(declare-fun d!139735 () Bool)

(assert (=> d!139735 (= (array_inv!30685 (_keys!12092 thiss!1559)) (bvsge (size!40681 (_keys!12092 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1272284 d!139735))

(declare-fun d!139737 () Bool)

(assert (=> d!139737 (= (array_inv!30686 (_values!6713 thiss!1559)) (bvsge (size!40680 (_values!6713 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1272284 d!139737))

(declare-fun d!139739 () Bool)

(assert (=> d!139739 (= (validMask!0 (mask!34429 thiss!1559)) (and (or (= (mask!34429 thiss!1559) #b00000000000000000000000000000111) (= (mask!34429 thiss!1559) #b00000000000000000000000000001111) (= (mask!34429 thiss!1559) #b00000000000000000000000000011111) (= (mask!34429 thiss!1559) #b00000000000000000000000000111111) (= (mask!34429 thiss!1559) #b00000000000000000000000001111111) (= (mask!34429 thiss!1559) #b00000000000000000000000011111111) (= (mask!34429 thiss!1559) #b00000000000000000000000111111111) (= (mask!34429 thiss!1559) #b00000000000000000000001111111111) (= (mask!34429 thiss!1559) #b00000000000000000000011111111111) (= (mask!34429 thiss!1559) #b00000000000000000000111111111111) (= (mask!34429 thiss!1559) #b00000000000000000001111111111111) (= (mask!34429 thiss!1559) #b00000000000000000011111111111111) (= (mask!34429 thiss!1559) #b00000000000000000111111111111111) (= (mask!34429 thiss!1559) #b00000000000000001111111111111111) (= (mask!34429 thiss!1559) #b00000000000000011111111111111111) (= (mask!34429 thiss!1559) #b00000000000000111111111111111111) (= (mask!34429 thiss!1559) #b00000000000001111111111111111111) (= (mask!34429 thiss!1559) #b00000000000011111111111111111111) (= (mask!34429 thiss!1559) #b00000000000111111111111111111111) (= (mask!34429 thiss!1559) #b00000000001111111111111111111111) (= (mask!34429 thiss!1559) #b00000000011111111111111111111111) (= (mask!34429 thiss!1559) #b00000000111111111111111111111111) (= (mask!34429 thiss!1559) #b00000001111111111111111111111111) (= (mask!34429 thiss!1559) #b00000011111111111111111111111111) (= (mask!34429 thiss!1559) #b00000111111111111111111111111111) (= (mask!34429 thiss!1559) #b00001111111111111111111111111111) (= (mask!34429 thiss!1559) #b00011111111111111111111111111111) (= (mask!34429 thiss!1559) #b00111111111111111111111111111111)) (bvsle (mask!34429 thiss!1559) #b00111111111111111111111111111111)))))

(assert (=> b!1272287 d!139739))

(declare-fun mapNonEmpty!51142 () Bool)

(declare-fun mapRes!51142 () Bool)

(declare-fun tp!97511 () Bool)

(declare-fun e!725711 () Bool)

(assert (=> mapNonEmpty!51142 (= mapRes!51142 (and tp!97511 e!725711))))

(declare-fun mapRest!51142 () (Array (_ BitVec 32) ValueCell!15662))

(declare-fun mapKey!51142 () (_ BitVec 32))

(declare-fun mapValue!51142 () ValueCell!15662)

(assert (=> mapNonEmpty!51142 (= mapRest!51133 (store mapRest!51142 mapKey!51142 mapValue!51142))))

(declare-fun b!1272334 () Bool)

(declare-fun e!725710 () Bool)

(assert (=> b!1272334 (= e!725710 tp_is_empty!33031)))

(declare-fun mapIsEmpty!51142 () Bool)

(assert (=> mapIsEmpty!51142 mapRes!51142))

(declare-fun condMapEmpty!51142 () Bool)

(declare-fun mapDefault!51142 () ValueCell!15662)

(assert (=> mapNonEmpty!51133 (= condMapEmpty!51142 (= mapRest!51133 ((as const (Array (_ BitVec 32) ValueCell!15662)) mapDefault!51142)))))

(assert (=> mapNonEmpty!51133 (= tp!97496 (and e!725710 mapRes!51142))))

(declare-fun b!1272333 () Bool)

(assert (=> b!1272333 (= e!725711 tp_is_empty!33031)))

(assert (= (and mapNonEmpty!51133 condMapEmpty!51142) mapIsEmpty!51142))

(assert (= (and mapNonEmpty!51133 (not condMapEmpty!51142)) mapNonEmpty!51142))

(assert (= (and mapNonEmpty!51142 ((_ is ValueCellFull!15662) mapValue!51142)) b!1272333))

(assert (= (and mapNonEmpty!51133 ((_ is ValueCellFull!15662) mapDefault!51142)) b!1272334))

(declare-fun m!1169597 () Bool)

(assert (=> mapNonEmpty!51142 m!1169597))

(check-sat (not d!139733) (not b!1272326) (not b!1272325) (not mapNonEmpty!51142) b_and!45699 tp_is_empty!33031 (not b_next!27661) (not b!1272324))
(check-sat b_and!45699 (not b_next!27661))
(get-model)

(declare-fun b!1272346 () Bool)

(declare-fun e!725721 () Bool)

(declare-fun contains!7637 (List!28630 (_ BitVec 64)) Bool)

(assert (=> b!1272346 (= e!725721 (contains!7637 Nil!28627 (select (arr!40143 (_keys!12092 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun bm!62518 () Bool)

(declare-fun call!62521 () Bool)

(declare-fun c!123671 () Bool)

(assert (=> bm!62518 (= call!62521 (arrayNoDuplicates!0 (_keys!12092 thiss!1559) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!123671 (Cons!28626 (select (arr!40143 (_keys!12092 thiss!1559)) #b00000000000000000000000000000000) Nil!28627) Nil!28627)))))

(declare-fun b!1272347 () Bool)

(declare-fun e!725722 () Bool)

(declare-fun e!725723 () Bool)

(assert (=> b!1272347 (= e!725722 e!725723)))

(declare-fun res!846358 () Bool)

(assert (=> b!1272347 (=> (not res!846358) (not e!725723))))

(assert (=> b!1272347 (= res!846358 (not e!725721))))

(declare-fun res!846360 () Bool)

(assert (=> b!1272347 (=> (not res!846360) (not e!725721))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1272347 (= res!846360 (validKeyInArray!0 (select (arr!40143 (_keys!12092 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun d!139741 () Bool)

(declare-fun res!846359 () Bool)

(assert (=> d!139741 (=> res!846359 e!725722)))

(assert (=> d!139741 (= res!846359 (bvsge #b00000000000000000000000000000000 (size!40681 (_keys!12092 thiss!1559))))))

(assert (=> d!139741 (= (arrayNoDuplicates!0 (_keys!12092 thiss!1559) #b00000000000000000000000000000000 Nil!28627) e!725722)))

(declare-fun b!1272345 () Bool)

(declare-fun e!725720 () Bool)

(assert (=> b!1272345 (= e!725720 call!62521)))

(declare-fun b!1272348 () Bool)

(assert (=> b!1272348 (= e!725720 call!62521)))

(declare-fun b!1272349 () Bool)

(assert (=> b!1272349 (= e!725723 e!725720)))

(assert (=> b!1272349 (= c!123671 (validKeyInArray!0 (select (arr!40143 (_keys!12092 thiss!1559)) #b00000000000000000000000000000000)))))

(assert (= (and d!139741 (not res!846359)) b!1272347))

(assert (= (and b!1272347 res!846360) b!1272346))

(assert (= (and b!1272347 res!846358) b!1272349))

(assert (= (and b!1272349 c!123671) b!1272345))

(assert (= (and b!1272349 (not c!123671)) b!1272348))

(assert (= (or b!1272345 b!1272348) bm!62518))

(declare-fun m!1169599 () Bool)

(assert (=> b!1272346 m!1169599))

(assert (=> b!1272346 m!1169599))

(declare-fun m!1169601 () Bool)

(assert (=> b!1272346 m!1169601))

(assert (=> bm!62518 m!1169599))

(declare-fun m!1169603 () Bool)

(assert (=> bm!62518 m!1169603))

(assert (=> b!1272347 m!1169599))

(assert (=> b!1272347 m!1169599))

(declare-fun m!1169605 () Bool)

(assert (=> b!1272347 m!1169605))

(assert (=> b!1272349 m!1169599))

(assert (=> b!1272349 m!1169599))

(assert (=> b!1272349 m!1169605))

(assert (=> b!1272326 d!139741))

(declare-fun b!1272358 () Bool)

(declare-fun e!725730 () Bool)

(declare-fun e!725732 () Bool)

(assert (=> b!1272358 (= e!725730 e!725732)))

(declare-fun c!123674 () Bool)

(assert (=> b!1272358 (= c!123674 (validKeyInArray!0 (select (arr!40143 (_keys!12092 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun bm!62521 () Bool)

(declare-fun call!62524 () Bool)

(assert (=> bm!62521 (= call!62524 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!12092 thiss!1559) (mask!34429 thiss!1559)))))

(declare-fun b!1272359 () Bool)

(declare-fun e!725731 () Bool)

(assert (=> b!1272359 (= e!725732 e!725731)))

(declare-fun lt!574874 () (_ BitVec 64))

(assert (=> b!1272359 (= lt!574874 (select (arr!40143 (_keys!12092 thiss!1559)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42164 0))(
  ( (Unit!42165) )
))
(declare-fun lt!574875 () Unit!42164)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83215 (_ BitVec 64) (_ BitVec 32)) Unit!42164)

(assert (=> b!1272359 (= lt!574875 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!12092 thiss!1559) lt!574874 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83215 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1272359 (arrayContainsKey!0 (_keys!12092 thiss!1559) lt!574874 #b00000000000000000000000000000000)))

(declare-fun lt!574873 () Unit!42164)

(assert (=> b!1272359 (= lt!574873 lt!574875)))

(declare-fun res!846365 () Bool)

(declare-datatypes ((SeekEntryResult!9988 0))(
  ( (MissingZero!9988 (index!42323 (_ BitVec 32))) (Found!9988 (index!42324 (_ BitVec 32))) (Intermediate!9988 (undefined!10800 Bool) (index!42325 (_ BitVec 32)) (x!112406 (_ BitVec 32))) (Undefined!9988) (MissingVacant!9988 (index!42326 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83215 (_ BitVec 32)) SeekEntryResult!9988)

(assert (=> b!1272359 (= res!846365 (= (seekEntryOrOpen!0 (select (arr!40143 (_keys!12092 thiss!1559)) #b00000000000000000000000000000000) (_keys!12092 thiss!1559) (mask!34429 thiss!1559)) (Found!9988 #b00000000000000000000000000000000)))))

(assert (=> b!1272359 (=> (not res!846365) (not e!725731))))

(declare-fun d!139743 () Bool)

(declare-fun res!846366 () Bool)

(assert (=> d!139743 (=> res!846366 e!725730)))

(assert (=> d!139743 (= res!846366 (bvsge #b00000000000000000000000000000000 (size!40681 (_keys!12092 thiss!1559))))))

(assert (=> d!139743 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12092 thiss!1559) (mask!34429 thiss!1559)) e!725730)))

(declare-fun b!1272360 () Bool)

(assert (=> b!1272360 (= e!725731 call!62524)))

(declare-fun b!1272361 () Bool)

(assert (=> b!1272361 (= e!725732 call!62524)))

(assert (= (and d!139743 (not res!846366)) b!1272358))

(assert (= (and b!1272358 c!123674) b!1272359))

(assert (= (and b!1272358 (not c!123674)) b!1272361))

(assert (= (and b!1272359 res!846365) b!1272360))

(assert (= (or b!1272360 b!1272361) bm!62521))

(assert (=> b!1272358 m!1169599))

(assert (=> b!1272358 m!1169599))

(assert (=> b!1272358 m!1169605))

(declare-fun m!1169607 () Bool)

(assert (=> bm!62521 m!1169607))

(assert (=> b!1272359 m!1169599))

(declare-fun m!1169609 () Bool)

(assert (=> b!1272359 m!1169609))

(declare-fun m!1169611 () Bool)

(assert (=> b!1272359 m!1169611))

(assert (=> b!1272359 m!1169599))

(declare-fun m!1169613 () Bool)

(assert (=> b!1272359 m!1169613))

(assert (=> b!1272325 d!139743))

(declare-fun d!139745 () Bool)

(declare-fun res!846377 () Bool)

(declare-fun e!725735 () Bool)

(assert (=> d!139745 (=> (not res!846377) (not e!725735))))

(assert (=> d!139745 (= res!846377 (validMask!0 (mask!34429 thiss!1559)))))

(assert (=> d!139745 (= (simpleValid!455 thiss!1559) e!725735)))

(declare-fun b!1272370 () Bool)

(declare-fun res!846376 () Bool)

(assert (=> b!1272370 (=> (not res!846376) (not e!725735))))

(assert (=> b!1272370 (= res!846376 (and (= (size!40680 (_values!6713 thiss!1559)) (bvadd (mask!34429 thiss!1559) #b00000000000000000000000000000001)) (= (size!40681 (_keys!12092 thiss!1559)) (size!40680 (_values!6713 thiss!1559))) (bvsge (_size!3099 thiss!1559) #b00000000000000000000000000000000) (bvsle (_size!3099 thiss!1559) (bvadd (mask!34429 thiss!1559) #b00000000000000000000000000000001))))))

(declare-fun b!1272372 () Bool)

(declare-fun res!846378 () Bool)

(assert (=> b!1272372 (=> (not res!846378) (not e!725735))))

(declare-fun size!40686 (LongMapFixedSize!6088) (_ BitVec 32))

(assert (=> b!1272372 (= res!846378 (= (size!40686 thiss!1559) (bvadd (_size!3099 thiss!1559) (bvsdiv (bvadd (extraKeys!6369 thiss!1559) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1272371 () Bool)

(declare-fun res!846375 () Bool)

(assert (=> b!1272371 (=> (not res!846375) (not e!725735))))

(assert (=> b!1272371 (= res!846375 (bvsge (size!40686 thiss!1559) (_size!3099 thiss!1559)))))

(declare-fun b!1272373 () Bool)

(assert (=> b!1272373 (= e!725735 (and (bvsge (extraKeys!6369 thiss!1559) #b00000000000000000000000000000000) (bvsle (extraKeys!6369 thiss!1559) #b00000000000000000000000000000011) (bvsge (_vacant!3099 thiss!1559) #b00000000000000000000000000000000)))))

(assert (= (and d!139745 res!846377) b!1272370))

(assert (= (and b!1272370 res!846376) b!1272371))

(assert (= (and b!1272371 res!846375) b!1272372))

(assert (= (and b!1272372 res!846378) b!1272373))

(assert (=> d!139745 m!1169567))

(declare-fun m!1169615 () Bool)

(assert (=> b!1272372 m!1169615))

(assert (=> b!1272371 m!1169615))

(assert (=> d!139733 d!139745))

(declare-fun b!1272382 () Bool)

(declare-fun e!725740 () (_ BitVec 32))

(declare-fun call!62527 () (_ BitVec 32))

(assert (=> b!1272382 (= e!725740 call!62527)))

(declare-fun b!1272383 () Bool)

(declare-fun e!725741 () (_ BitVec 32))

(assert (=> b!1272383 (= e!725741 e!725740)))

(declare-fun c!123680 () Bool)

(assert (=> b!1272383 (= c!123680 (validKeyInArray!0 (select (arr!40143 (_keys!12092 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1272384 () Bool)

(assert (=> b!1272384 (= e!725741 #b00000000000000000000000000000000)))

(declare-fun b!1272385 () Bool)

(assert (=> b!1272385 (= e!725740 (bvadd #b00000000000000000000000000000001 call!62527))))

(declare-fun d!139747 () Bool)

(declare-fun lt!574878 () (_ BitVec 32))

(assert (=> d!139747 (and (bvsge lt!574878 #b00000000000000000000000000000000) (bvsle lt!574878 (bvsub (size!40681 (_keys!12092 thiss!1559)) #b00000000000000000000000000000000)))))

(assert (=> d!139747 (= lt!574878 e!725741)))

(declare-fun c!123679 () Bool)

(assert (=> d!139747 (= c!123679 (bvsge #b00000000000000000000000000000000 (size!40681 (_keys!12092 thiss!1559))))))

(assert (=> d!139747 (and (bvsle #b00000000000000000000000000000000 (size!40681 (_keys!12092 thiss!1559))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!40681 (_keys!12092 thiss!1559)) (size!40681 (_keys!12092 thiss!1559))))))

(assert (=> d!139747 (= (arrayCountValidKeys!0 (_keys!12092 thiss!1559) #b00000000000000000000000000000000 (size!40681 (_keys!12092 thiss!1559))) lt!574878)))

(declare-fun bm!62524 () Bool)

(assert (=> bm!62524 (= call!62527 (arrayCountValidKeys!0 (_keys!12092 thiss!1559) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40681 (_keys!12092 thiss!1559))))))

(assert (= (and d!139747 c!123679) b!1272384))

(assert (= (and d!139747 (not c!123679)) b!1272383))

(assert (= (and b!1272383 c!123680) b!1272385))

(assert (= (and b!1272383 (not c!123680)) b!1272382))

(assert (= (or b!1272385 b!1272382) bm!62524))

(assert (=> b!1272383 m!1169599))

(assert (=> b!1272383 m!1169599))

(assert (=> b!1272383 m!1169605))

(declare-fun m!1169617 () Bool)

(assert (=> bm!62524 m!1169617))

(assert (=> b!1272324 d!139747))

(declare-fun mapNonEmpty!51143 () Bool)

(declare-fun mapRes!51143 () Bool)

(declare-fun tp!97512 () Bool)

(declare-fun e!725743 () Bool)

(assert (=> mapNonEmpty!51143 (= mapRes!51143 (and tp!97512 e!725743))))

(declare-fun mapRest!51143 () (Array (_ BitVec 32) ValueCell!15662))

(declare-fun mapValue!51143 () ValueCell!15662)

(declare-fun mapKey!51143 () (_ BitVec 32))

(assert (=> mapNonEmpty!51143 (= mapRest!51142 (store mapRest!51143 mapKey!51143 mapValue!51143))))

(declare-fun b!1272387 () Bool)

(declare-fun e!725742 () Bool)

(assert (=> b!1272387 (= e!725742 tp_is_empty!33031)))

(declare-fun mapIsEmpty!51143 () Bool)

(assert (=> mapIsEmpty!51143 mapRes!51143))

(declare-fun condMapEmpty!51143 () Bool)

(declare-fun mapDefault!51143 () ValueCell!15662)

(assert (=> mapNonEmpty!51142 (= condMapEmpty!51143 (= mapRest!51142 ((as const (Array (_ BitVec 32) ValueCell!15662)) mapDefault!51143)))))

(assert (=> mapNonEmpty!51142 (= tp!97511 (and e!725742 mapRes!51143))))

(declare-fun b!1272386 () Bool)

(assert (=> b!1272386 (= e!725743 tp_is_empty!33031)))

(assert (= (and mapNonEmpty!51142 condMapEmpty!51143) mapIsEmpty!51143))

(assert (= (and mapNonEmpty!51142 (not condMapEmpty!51143)) mapNonEmpty!51143))

(assert (= (and mapNonEmpty!51143 ((_ is ValueCellFull!15662) mapValue!51143)) b!1272386))

(assert (= (and mapNonEmpty!51142 ((_ is ValueCellFull!15662) mapDefault!51143)) b!1272387))

(declare-fun m!1169619 () Bool)

(assert (=> mapNonEmpty!51143 m!1169619))

(check-sat (not b_next!27661) (not b!1272359) (not d!139745) (not b!1272371) (not b!1272383) (not bm!62521) (not bm!62518) (not mapNonEmpty!51143) b_and!45699 tp_is_empty!33031 (not b!1272358) (not b!1272346) (not b!1272372) (not bm!62524) (not b!1272349) (not b!1272347))
(check-sat b_and!45699 (not b_next!27661))

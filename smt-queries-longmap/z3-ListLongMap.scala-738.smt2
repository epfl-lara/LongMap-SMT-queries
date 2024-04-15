; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17208 () Bool)

(assert start!17208)

(declare-fun b!172505 () Bool)

(declare-fun b_free!4267 () Bool)

(declare-fun b_next!4267 () Bool)

(assert (=> b!172505 (= b_free!4267 (not b_next!4267))))

(declare-fun tp!15454 () Bool)

(declare-fun b_and!10681 () Bool)

(assert (=> b!172505 (= tp!15454 b_and!10681)))

(declare-fun b!172506 () Bool)

(declare-fun e!113879 () Bool)

(declare-datatypes ((V!5033 0))(
  ( (V!5034 (val!2064 Int)) )
))
(declare-datatypes ((ValueCell!1676 0))(
  ( (ValueCellFull!1676 (v!3926 V!5033)) (EmptyCell!1676) )
))
(declare-datatypes ((array!7183 0))(
  ( (array!7184 (arr!3412 (Array (_ BitVec 32) (_ BitVec 64))) (size!3711 (_ BitVec 32))) )
))
(declare-datatypes ((array!7185 0))(
  ( (array!7186 (arr!3413 (Array (_ BitVec 32) ValueCell!1676)) (size!3712 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2260 0))(
  ( (LongMapFixedSize!2261 (defaultEntry!3576 Int) (mask!8427 (_ BitVec 32)) (extraKeys!3315 (_ BitVec 32)) (zeroValue!3417 V!5033) (minValue!3419 V!5033) (_size!1179 (_ BitVec 32)) (_keys!5413 array!7183) (_values!3559 array!7185) (_vacant!1179 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2260)

(assert (=> b!172506 (= e!113879 (and (= (size!3712 (_values!3559 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8427 thiss!1248))) (= (size!3711 (_keys!5413 thiss!1248)) (size!3712 (_values!3559 thiss!1248))) (bvsge (mask!8427 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3315 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3315 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!6875 () Bool)

(declare-fun mapRes!6875 () Bool)

(assert (=> mapIsEmpty!6875 mapRes!6875))

(declare-fun mapNonEmpty!6875 () Bool)

(declare-fun tp!15455 () Bool)

(declare-fun e!113882 () Bool)

(assert (=> mapNonEmpty!6875 (= mapRes!6875 (and tp!15455 e!113882))))

(declare-fun mapKey!6875 () (_ BitVec 32))

(declare-fun mapValue!6875 () ValueCell!1676)

(declare-fun mapRest!6875 () (Array (_ BitVec 32) ValueCell!1676))

(assert (=> mapNonEmpty!6875 (= (arr!3413 (_values!3559 thiss!1248)) (store mapRest!6875 mapKey!6875 mapValue!6875))))

(declare-fun b!172507 () Bool)

(declare-fun tp_is_empty!4039 () Bool)

(assert (=> b!172507 (= e!113882 tp_is_empty!4039)))

(declare-fun b!172508 () Bool)

(declare-fun e!113880 () Bool)

(declare-fun e!113881 () Bool)

(assert (=> b!172508 (= e!113880 (and e!113881 mapRes!6875))))

(declare-fun condMapEmpty!6875 () Bool)

(declare-fun mapDefault!6875 () ValueCell!1676)

(assert (=> b!172508 (= condMapEmpty!6875 (= (arr!3413 (_values!3559 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1676)) mapDefault!6875)))))

(declare-fun b!172509 () Bool)

(declare-fun res!81885 () Bool)

(assert (=> b!172509 (=> (not res!81885) (not e!113879))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!172509 (= res!81885 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!172510 () Bool)

(assert (=> b!172510 (= e!113881 tp_is_empty!4039)))

(declare-fun b!172511 () Bool)

(declare-fun res!81884 () Bool)

(assert (=> b!172511 (=> (not res!81884) (not e!113879))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!172511 (= res!81884 (validMask!0 (mask!8427 thiss!1248)))))

(declare-fun e!113884 () Bool)

(declare-fun array_inv!2201 (array!7183) Bool)

(declare-fun array_inv!2202 (array!7185) Bool)

(assert (=> b!172505 (= e!113884 (and tp!15454 tp_is_empty!4039 (array_inv!2201 (_keys!5413 thiss!1248)) (array_inv!2202 (_values!3559 thiss!1248)) e!113880))))

(declare-fun res!81886 () Bool)

(assert (=> start!17208 (=> (not res!81886) (not e!113879))))

(declare-fun valid!979 (LongMapFixedSize!2260) Bool)

(assert (=> start!17208 (= res!81886 (valid!979 thiss!1248))))

(assert (=> start!17208 e!113879))

(assert (=> start!17208 e!113884))

(assert (=> start!17208 true))

(assert (= (and start!17208 res!81886) b!172509))

(assert (= (and b!172509 res!81885) b!172511))

(assert (= (and b!172511 res!81884) b!172506))

(assert (= (and b!172508 condMapEmpty!6875) mapIsEmpty!6875))

(assert (= (and b!172508 (not condMapEmpty!6875)) mapNonEmpty!6875))

(get-info :version)

(assert (= (and mapNonEmpty!6875 ((_ is ValueCellFull!1676) mapValue!6875)) b!172507))

(assert (= (and b!172508 ((_ is ValueCellFull!1676) mapDefault!6875)) b!172510))

(assert (= b!172505 b!172508))

(assert (= start!17208 b!172505))

(declare-fun m!200711 () Bool)

(assert (=> mapNonEmpty!6875 m!200711))

(declare-fun m!200713 () Bool)

(assert (=> b!172511 m!200713))

(declare-fun m!200715 () Bool)

(assert (=> b!172505 m!200715))

(declare-fun m!200717 () Bool)

(assert (=> b!172505 m!200717))

(declare-fun m!200719 () Bool)

(assert (=> start!17208 m!200719))

(check-sat (not mapNonEmpty!6875) tp_is_empty!4039 b_and!10681 (not b!172505) (not start!17208) (not b!172511) (not b_next!4267))
(check-sat b_and!10681 (not b_next!4267))
(get-model)

(declare-fun d!52389 () Bool)

(assert (=> d!52389 (= (array_inv!2201 (_keys!5413 thiss!1248)) (bvsge (size!3711 (_keys!5413 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!172505 d!52389))

(declare-fun d!52391 () Bool)

(assert (=> d!52391 (= (array_inv!2202 (_values!3559 thiss!1248)) (bvsge (size!3712 (_values!3559 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!172505 d!52391))

(declare-fun d!52393 () Bool)

(assert (=> d!52393 (= (validMask!0 (mask!8427 thiss!1248)) (and (or (= (mask!8427 thiss!1248) #b00000000000000000000000000000111) (= (mask!8427 thiss!1248) #b00000000000000000000000000001111) (= (mask!8427 thiss!1248) #b00000000000000000000000000011111) (= (mask!8427 thiss!1248) #b00000000000000000000000000111111) (= (mask!8427 thiss!1248) #b00000000000000000000000001111111) (= (mask!8427 thiss!1248) #b00000000000000000000000011111111) (= (mask!8427 thiss!1248) #b00000000000000000000000111111111) (= (mask!8427 thiss!1248) #b00000000000000000000001111111111) (= (mask!8427 thiss!1248) #b00000000000000000000011111111111) (= (mask!8427 thiss!1248) #b00000000000000000000111111111111) (= (mask!8427 thiss!1248) #b00000000000000000001111111111111) (= (mask!8427 thiss!1248) #b00000000000000000011111111111111) (= (mask!8427 thiss!1248) #b00000000000000000111111111111111) (= (mask!8427 thiss!1248) #b00000000000000001111111111111111) (= (mask!8427 thiss!1248) #b00000000000000011111111111111111) (= (mask!8427 thiss!1248) #b00000000000000111111111111111111) (= (mask!8427 thiss!1248) #b00000000000001111111111111111111) (= (mask!8427 thiss!1248) #b00000000000011111111111111111111) (= (mask!8427 thiss!1248) #b00000000000111111111111111111111) (= (mask!8427 thiss!1248) #b00000000001111111111111111111111) (= (mask!8427 thiss!1248) #b00000000011111111111111111111111) (= (mask!8427 thiss!1248) #b00000000111111111111111111111111) (= (mask!8427 thiss!1248) #b00000001111111111111111111111111) (= (mask!8427 thiss!1248) #b00000011111111111111111111111111) (= (mask!8427 thiss!1248) #b00000111111111111111111111111111) (= (mask!8427 thiss!1248) #b00001111111111111111111111111111) (= (mask!8427 thiss!1248) #b00011111111111111111111111111111) (= (mask!8427 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8427 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!172511 d!52393))

(declare-fun d!52395 () Bool)

(declare-fun res!81911 () Bool)

(declare-fun e!113923 () Bool)

(assert (=> d!52395 (=> (not res!81911) (not e!113923))))

(declare-fun simpleValid!141 (LongMapFixedSize!2260) Bool)

(assert (=> d!52395 (= res!81911 (simpleValid!141 thiss!1248))))

(assert (=> d!52395 (= (valid!979 thiss!1248) e!113923)))

(declare-fun b!172560 () Bool)

(declare-fun res!81912 () Bool)

(assert (=> b!172560 (=> (not res!81912) (not e!113923))))

(declare-fun arrayCountValidKeys!0 (array!7183 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!172560 (= res!81912 (= (arrayCountValidKeys!0 (_keys!5413 thiss!1248) #b00000000000000000000000000000000 (size!3711 (_keys!5413 thiss!1248))) (_size!1179 thiss!1248)))))

(declare-fun b!172561 () Bool)

(declare-fun res!81913 () Bool)

(assert (=> b!172561 (=> (not res!81913) (not e!113923))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7183 (_ BitVec 32)) Bool)

(assert (=> b!172561 (= res!81913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5413 thiss!1248) (mask!8427 thiss!1248)))))

(declare-fun b!172562 () Bool)

(declare-datatypes ((List!2211 0))(
  ( (Nil!2208) (Cons!2207 (h!2824 (_ BitVec 64)) (t!7009 List!2211)) )
))
(declare-fun arrayNoDuplicates!0 (array!7183 (_ BitVec 32) List!2211) Bool)

(assert (=> b!172562 (= e!113923 (arrayNoDuplicates!0 (_keys!5413 thiss!1248) #b00000000000000000000000000000000 Nil!2208))))

(assert (= (and d!52395 res!81911) b!172560))

(assert (= (and b!172560 res!81912) b!172561))

(assert (= (and b!172561 res!81913) b!172562))

(declare-fun m!200741 () Bool)

(assert (=> d!52395 m!200741))

(declare-fun m!200743 () Bool)

(assert (=> b!172560 m!200743))

(declare-fun m!200745 () Bool)

(assert (=> b!172561 m!200745))

(declare-fun m!200747 () Bool)

(assert (=> b!172562 m!200747))

(assert (=> start!17208 d!52395))

(declare-fun b!172570 () Bool)

(declare-fun e!113928 () Bool)

(assert (=> b!172570 (= e!113928 tp_is_empty!4039)))

(declare-fun mapNonEmpty!6884 () Bool)

(declare-fun mapRes!6884 () Bool)

(declare-fun tp!15470 () Bool)

(declare-fun e!113929 () Bool)

(assert (=> mapNonEmpty!6884 (= mapRes!6884 (and tp!15470 e!113929))))

(declare-fun mapKey!6884 () (_ BitVec 32))

(declare-fun mapRest!6884 () (Array (_ BitVec 32) ValueCell!1676))

(declare-fun mapValue!6884 () ValueCell!1676)

(assert (=> mapNonEmpty!6884 (= mapRest!6875 (store mapRest!6884 mapKey!6884 mapValue!6884))))

(declare-fun condMapEmpty!6884 () Bool)

(declare-fun mapDefault!6884 () ValueCell!1676)

(assert (=> mapNonEmpty!6875 (= condMapEmpty!6884 (= mapRest!6875 ((as const (Array (_ BitVec 32) ValueCell!1676)) mapDefault!6884)))))

(assert (=> mapNonEmpty!6875 (= tp!15455 (and e!113928 mapRes!6884))))

(declare-fun b!172569 () Bool)

(assert (=> b!172569 (= e!113929 tp_is_empty!4039)))

(declare-fun mapIsEmpty!6884 () Bool)

(assert (=> mapIsEmpty!6884 mapRes!6884))

(assert (= (and mapNonEmpty!6875 condMapEmpty!6884) mapIsEmpty!6884))

(assert (= (and mapNonEmpty!6875 (not condMapEmpty!6884)) mapNonEmpty!6884))

(assert (= (and mapNonEmpty!6884 ((_ is ValueCellFull!1676) mapValue!6884)) b!172569))

(assert (= (and mapNonEmpty!6875 ((_ is ValueCellFull!1676) mapDefault!6884)) b!172570))

(declare-fun m!200749 () Bool)

(assert (=> mapNonEmpty!6884 m!200749))

(check-sat (not d!52395) tp_is_empty!4039 (not b!172561) (not mapNonEmpty!6884) (not b!172560) (not b_next!4267) (not b!172562) b_and!10681)
(check-sat b_and!10681 (not b_next!4267))
(get-model)

(declare-fun b!172581 () Bool)

(declare-fun e!113938 () Bool)

(declare-fun call!17518 () Bool)

(assert (=> b!172581 (= e!113938 call!17518)))

(declare-fun b!172582 () Bool)

(declare-fun e!113940 () Bool)

(declare-fun contains!1150 (List!2211 (_ BitVec 64)) Bool)

(assert (=> b!172582 (= e!113940 (contains!1150 Nil!2208 (select (arr!3412 (_keys!5413 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17515 () Bool)

(declare-fun c!30852 () Bool)

(assert (=> bm!17515 (= call!17518 (arrayNoDuplicates!0 (_keys!5413 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30852 (Cons!2207 (select (arr!3412 (_keys!5413 thiss!1248)) #b00000000000000000000000000000000) Nil!2208) Nil!2208)))))

(declare-fun b!172583 () Bool)

(assert (=> b!172583 (= e!113938 call!17518)))

(declare-fun b!172584 () Bool)

(declare-fun e!113941 () Bool)

(assert (=> b!172584 (= e!113941 e!113938)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!172584 (= c!30852 (validKeyInArray!0 (select (arr!3412 (_keys!5413 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!52397 () Bool)

(declare-fun res!81921 () Bool)

(declare-fun e!113939 () Bool)

(assert (=> d!52397 (=> res!81921 e!113939)))

(assert (=> d!52397 (= res!81921 (bvsge #b00000000000000000000000000000000 (size!3711 (_keys!5413 thiss!1248))))))

(assert (=> d!52397 (= (arrayNoDuplicates!0 (_keys!5413 thiss!1248) #b00000000000000000000000000000000 Nil!2208) e!113939)))

(declare-fun b!172585 () Bool)

(assert (=> b!172585 (= e!113939 e!113941)))

(declare-fun res!81920 () Bool)

(assert (=> b!172585 (=> (not res!81920) (not e!113941))))

(assert (=> b!172585 (= res!81920 (not e!113940))))

(declare-fun res!81922 () Bool)

(assert (=> b!172585 (=> (not res!81922) (not e!113940))))

(assert (=> b!172585 (= res!81922 (validKeyInArray!0 (select (arr!3412 (_keys!5413 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!52397 (not res!81921)) b!172585))

(assert (= (and b!172585 res!81922) b!172582))

(assert (= (and b!172585 res!81920) b!172584))

(assert (= (and b!172584 c!30852) b!172583))

(assert (= (and b!172584 (not c!30852)) b!172581))

(assert (= (or b!172583 b!172581) bm!17515))

(declare-fun m!200751 () Bool)

(assert (=> b!172582 m!200751))

(assert (=> b!172582 m!200751))

(declare-fun m!200753 () Bool)

(assert (=> b!172582 m!200753))

(assert (=> bm!17515 m!200751))

(declare-fun m!200755 () Bool)

(assert (=> bm!17515 m!200755))

(assert (=> b!172584 m!200751))

(assert (=> b!172584 m!200751))

(declare-fun m!200757 () Bool)

(assert (=> b!172584 m!200757))

(assert (=> b!172585 m!200751))

(assert (=> b!172585 m!200751))

(assert (=> b!172585 m!200757))

(assert (=> b!172562 d!52397))

(declare-fun b!172594 () Bool)

(declare-fun e!113948 () Bool)

(declare-fun e!113949 () Bool)

(assert (=> b!172594 (= e!113948 e!113949)))

(declare-fun lt!85507 () (_ BitVec 64))

(assert (=> b!172594 (= lt!85507 (select (arr!3412 (_keys!5413 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5285 0))(
  ( (Unit!5286) )
))
(declare-fun lt!85508 () Unit!5285)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7183 (_ BitVec 64) (_ BitVec 32)) Unit!5285)

(assert (=> b!172594 (= lt!85508 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5413 thiss!1248) lt!85507 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7183 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!172594 (arrayContainsKey!0 (_keys!5413 thiss!1248) lt!85507 #b00000000000000000000000000000000)))

(declare-fun lt!85509 () Unit!5285)

(assert (=> b!172594 (= lt!85509 lt!85508)))

(declare-fun res!81928 () Bool)

(declare-datatypes ((SeekEntryResult!550 0))(
  ( (MissingZero!550 (index!4368 (_ BitVec 32))) (Found!550 (index!4369 (_ BitVec 32))) (Intermediate!550 (undefined!1362 Bool) (index!4370 (_ BitVec 32)) (x!19108 (_ BitVec 32))) (Undefined!550) (MissingVacant!550 (index!4371 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7183 (_ BitVec 32)) SeekEntryResult!550)

(assert (=> b!172594 (= res!81928 (= (seekEntryOrOpen!0 (select (arr!3412 (_keys!5413 thiss!1248)) #b00000000000000000000000000000000) (_keys!5413 thiss!1248) (mask!8427 thiss!1248)) (Found!550 #b00000000000000000000000000000000)))))

(assert (=> b!172594 (=> (not res!81928) (not e!113949))))

(declare-fun d!52399 () Bool)

(declare-fun res!81927 () Bool)

(declare-fun e!113950 () Bool)

(assert (=> d!52399 (=> res!81927 e!113950)))

(assert (=> d!52399 (= res!81927 (bvsge #b00000000000000000000000000000000 (size!3711 (_keys!5413 thiss!1248))))))

(assert (=> d!52399 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5413 thiss!1248) (mask!8427 thiss!1248)) e!113950)))

(declare-fun b!172595 () Bool)

(assert (=> b!172595 (= e!113950 e!113948)))

(declare-fun c!30855 () Bool)

(assert (=> b!172595 (= c!30855 (validKeyInArray!0 (select (arr!3412 (_keys!5413 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!172596 () Bool)

(declare-fun call!17521 () Bool)

(assert (=> b!172596 (= e!113949 call!17521)))

(declare-fun bm!17518 () Bool)

(assert (=> bm!17518 (= call!17521 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5413 thiss!1248) (mask!8427 thiss!1248)))))

(declare-fun b!172597 () Bool)

(assert (=> b!172597 (= e!113948 call!17521)))

(assert (= (and d!52399 (not res!81927)) b!172595))

(assert (= (and b!172595 c!30855) b!172594))

(assert (= (and b!172595 (not c!30855)) b!172597))

(assert (= (and b!172594 res!81928) b!172596))

(assert (= (or b!172596 b!172597) bm!17518))

(assert (=> b!172594 m!200751))

(declare-fun m!200759 () Bool)

(assert (=> b!172594 m!200759))

(declare-fun m!200761 () Bool)

(assert (=> b!172594 m!200761))

(assert (=> b!172594 m!200751))

(declare-fun m!200763 () Bool)

(assert (=> b!172594 m!200763))

(assert (=> b!172595 m!200751))

(assert (=> b!172595 m!200751))

(assert (=> b!172595 m!200757))

(declare-fun m!200765 () Bool)

(assert (=> bm!17518 m!200765))

(assert (=> b!172561 d!52399))

(declare-fun d!52401 () Bool)

(declare-fun lt!85512 () (_ BitVec 32))

(assert (=> d!52401 (and (bvsge lt!85512 #b00000000000000000000000000000000) (bvsle lt!85512 (bvsub (size!3711 (_keys!5413 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!113956 () (_ BitVec 32))

(assert (=> d!52401 (= lt!85512 e!113956)))

(declare-fun c!30860 () Bool)

(assert (=> d!52401 (= c!30860 (bvsge #b00000000000000000000000000000000 (size!3711 (_keys!5413 thiss!1248))))))

(assert (=> d!52401 (and (bvsle #b00000000000000000000000000000000 (size!3711 (_keys!5413 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3711 (_keys!5413 thiss!1248)) (size!3711 (_keys!5413 thiss!1248))))))

(assert (=> d!52401 (= (arrayCountValidKeys!0 (_keys!5413 thiss!1248) #b00000000000000000000000000000000 (size!3711 (_keys!5413 thiss!1248))) lt!85512)))

(declare-fun b!172606 () Bool)

(declare-fun e!113955 () (_ BitVec 32))

(assert (=> b!172606 (= e!113956 e!113955)))

(declare-fun c!30861 () Bool)

(assert (=> b!172606 (= c!30861 (validKeyInArray!0 (select (arr!3412 (_keys!5413 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!172607 () Bool)

(assert (=> b!172607 (= e!113956 #b00000000000000000000000000000000)))

(declare-fun bm!17521 () Bool)

(declare-fun call!17524 () (_ BitVec 32))

(assert (=> bm!17521 (= call!17524 (arrayCountValidKeys!0 (_keys!5413 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3711 (_keys!5413 thiss!1248))))))

(declare-fun b!172608 () Bool)

(assert (=> b!172608 (= e!113955 (bvadd #b00000000000000000000000000000001 call!17524))))

(declare-fun b!172609 () Bool)

(assert (=> b!172609 (= e!113955 call!17524)))

(assert (= (and d!52401 c!30860) b!172607))

(assert (= (and d!52401 (not c!30860)) b!172606))

(assert (= (and b!172606 c!30861) b!172608))

(assert (= (and b!172606 (not c!30861)) b!172609))

(assert (= (or b!172608 b!172609) bm!17521))

(assert (=> b!172606 m!200751))

(assert (=> b!172606 m!200751))

(assert (=> b!172606 m!200757))

(declare-fun m!200767 () Bool)

(assert (=> bm!17521 m!200767))

(assert (=> b!172560 d!52401))

(declare-fun b!172621 () Bool)

(declare-fun e!113959 () Bool)

(assert (=> b!172621 (= e!113959 (and (bvsge (extraKeys!3315 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3315 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1179 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!172619 () Bool)

(declare-fun res!81940 () Bool)

(assert (=> b!172619 (=> (not res!81940) (not e!113959))))

(declare-fun size!3717 (LongMapFixedSize!2260) (_ BitVec 32))

(assert (=> b!172619 (= res!81940 (bvsge (size!3717 thiss!1248) (_size!1179 thiss!1248)))))

(declare-fun b!172618 () Bool)

(declare-fun res!81938 () Bool)

(assert (=> b!172618 (=> (not res!81938) (not e!113959))))

(assert (=> b!172618 (= res!81938 (and (= (size!3712 (_values!3559 thiss!1248)) (bvadd (mask!8427 thiss!1248) #b00000000000000000000000000000001)) (= (size!3711 (_keys!5413 thiss!1248)) (size!3712 (_values!3559 thiss!1248))) (bvsge (_size!1179 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1179 thiss!1248) (bvadd (mask!8427 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun d!52403 () Bool)

(declare-fun res!81939 () Bool)

(assert (=> d!52403 (=> (not res!81939) (not e!113959))))

(assert (=> d!52403 (= res!81939 (validMask!0 (mask!8427 thiss!1248)))))

(assert (=> d!52403 (= (simpleValid!141 thiss!1248) e!113959)))

(declare-fun b!172620 () Bool)

(declare-fun res!81937 () Bool)

(assert (=> b!172620 (=> (not res!81937) (not e!113959))))

(assert (=> b!172620 (= res!81937 (= (size!3717 thiss!1248) (bvadd (_size!1179 thiss!1248) (bvsdiv (bvadd (extraKeys!3315 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!52403 res!81939) b!172618))

(assert (= (and b!172618 res!81938) b!172619))

(assert (= (and b!172619 res!81940) b!172620))

(assert (= (and b!172620 res!81937) b!172621))

(declare-fun m!200769 () Bool)

(assert (=> b!172619 m!200769))

(assert (=> d!52403 m!200713))

(assert (=> b!172620 m!200769))

(assert (=> d!52395 d!52403))

(declare-fun b!172623 () Bool)

(declare-fun e!113960 () Bool)

(assert (=> b!172623 (= e!113960 tp_is_empty!4039)))

(declare-fun mapNonEmpty!6885 () Bool)

(declare-fun mapRes!6885 () Bool)

(declare-fun tp!15471 () Bool)

(declare-fun e!113961 () Bool)

(assert (=> mapNonEmpty!6885 (= mapRes!6885 (and tp!15471 e!113961))))

(declare-fun mapRest!6885 () (Array (_ BitVec 32) ValueCell!1676))

(declare-fun mapKey!6885 () (_ BitVec 32))

(declare-fun mapValue!6885 () ValueCell!1676)

(assert (=> mapNonEmpty!6885 (= mapRest!6884 (store mapRest!6885 mapKey!6885 mapValue!6885))))

(declare-fun condMapEmpty!6885 () Bool)

(declare-fun mapDefault!6885 () ValueCell!1676)

(assert (=> mapNonEmpty!6884 (= condMapEmpty!6885 (= mapRest!6884 ((as const (Array (_ BitVec 32) ValueCell!1676)) mapDefault!6885)))))

(assert (=> mapNonEmpty!6884 (= tp!15470 (and e!113960 mapRes!6885))))

(declare-fun b!172622 () Bool)

(assert (=> b!172622 (= e!113961 tp_is_empty!4039)))

(declare-fun mapIsEmpty!6885 () Bool)

(assert (=> mapIsEmpty!6885 mapRes!6885))

(assert (= (and mapNonEmpty!6884 condMapEmpty!6885) mapIsEmpty!6885))

(assert (= (and mapNonEmpty!6884 (not condMapEmpty!6885)) mapNonEmpty!6885))

(assert (= (and mapNonEmpty!6885 ((_ is ValueCellFull!1676) mapValue!6885)) b!172622))

(assert (= (and mapNonEmpty!6884 ((_ is ValueCellFull!1676) mapDefault!6885)) b!172623))

(declare-fun m!200771 () Bool)

(assert (=> mapNonEmpty!6885 m!200771))

(check-sat (not b!172619) (not d!52403) (not bm!17518) b_and!10681 (not b!172620) (not b!172585) (not b!172582) (not b!172594) (not b!172606) (not b_next!4267) (not bm!17521) tp_is_empty!4039 (not b!172595) (not bm!17515) (not b!172584) (not mapNonEmpty!6885))
(check-sat b_and!10681 (not b_next!4267))

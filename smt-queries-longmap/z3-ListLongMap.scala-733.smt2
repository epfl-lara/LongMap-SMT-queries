; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17106 () Bool)

(assert start!17106)

(declare-fun b!171903 () Bool)

(declare-fun b_free!4237 () Bool)

(declare-fun b_next!4237 () Bool)

(assert (=> b!171903 (= b_free!4237 (not b_next!4237))))

(declare-fun tp!15345 () Bool)

(declare-fun b_and!10651 () Bool)

(assert (=> b!171903 (= tp!15345 b_and!10651)))

(declare-fun b!171900 () Bool)

(declare-fun e!113441 () Bool)

(declare-fun tp_is_empty!4009 () Bool)

(assert (=> b!171900 (= e!113441 tp_is_empty!4009)))

(declare-fun mapIsEmpty!6811 () Bool)

(declare-fun mapRes!6811 () Bool)

(assert (=> mapIsEmpty!6811 mapRes!6811))

(declare-fun res!81604 () Bool)

(declare-fun e!113439 () Bool)

(assert (=> start!17106 (=> (not res!81604) (not e!113439))))

(declare-datatypes ((V!4993 0))(
  ( (V!4994 (val!2049 Int)) )
))
(declare-datatypes ((ValueCell!1661 0))(
  ( (ValueCellFull!1661 (v!3911 V!4993)) (EmptyCell!1661) )
))
(declare-datatypes ((array!7113 0))(
  ( (array!7114 (arr!3382 (Array (_ BitVec 32) (_ BitVec 64))) (size!3677 (_ BitVec 32))) )
))
(declare-datatypes ((array!7115 0))(
  ( (array!7116 (arr!3383 (Array (_ BitVec 32) ValueCell!1661)) (size!3678 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2230 0))(
  ( (LongMapFixedSize!2231 (defaultEntry!3561 Int) (mask!8393 (_ BitVec 32)) (extraKeys!3300 (_ BitVec 32)) (zeroValue!3402 V!4993) (minValue!3404 V!4993) (_size!1164 (_ BitVec 32)) (_keys!5394 array!7113) (_values!3544 array!7115) (_vacant!1164 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2230)

(declare-fun valid!968 (LongMapFixedSize!2230) Bool)

(assert (=> start!17106 (= res!81604 (valid!968 thiss!1248))))

(assert (=> start!17106 e!113439))

(declare-fun e!113436 () Bool)

(assert (=> start!17106 e!113436))

(assert (=> start!17106 true))

(declare-fun mapNonEmpty!6811 () Bool)

(declare-fun tp!15346 () Bool)

(declare-fun e!113437 () Bool)

(assert (=> mapNonEmpty!6811 (= mapRes!6811 (and tp!15346 e!113437))))

(declare-fun mapValue!6811 () ValueCell!1661)

(declare-fun mapRest!6811 () (Array (_ BitVec 32) ValueCell!1661))

(declare-fun mapKey!6811 () (_ BitVec 32))

(assert (=> mapNonEmpty!6811 (= (arr!3383 (_values!3544 thiss!1248)) (store mapRest!6811 mapKey!6811 mapValue!6811))))

(declare-fun b!171901 () Bool)

(declare-fun res!81603 () Bool)

(assert (=> b!171901 (=> (not res!81603) (not e!113439))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!171901 (= res!81603 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!171902 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!171902 (= e!113439 (not (validMask!0 (mask!8393 thiss!1248))))))

(declare-fun e!113438 () Bool)

(declare-fun array_inv!2181 (array!7113) Bool)

(declare-fun array_inv!2182 (array!7115) Bool)

(assert (=> b!171903 (= e!113436 (and tp!15345 tp_is_empty!4009 (array_inv!2181 (_keys!5394 thiss!1248)) (array_inv!2182 (_values!3544 thiss!1248)) e!113438))))

(declare-fun b!171904 () Bool)

(assert (=> b!171904 (= e!113437 tp_is_empty!4009)))

(declare-fun b!171905 () Bool)

(assert (=> b!171905 (= e!113438 (and e!113441 mapRes!6811))))

(declare-fun condMapEmpty!6811 () Bool)

(declare-fun mapDefault!6811 () ValueCell!1661)

(assert (=> b!171905 (= condMapEmpty!6811 (= (arr!3383 (_values!3544 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1661)) mapDefault!6811)))))

(assert (= (and start!17106 res!81604) b!171901))

(assert (= (and b!171901 res!81603) b!171902))

(assert (= (and b!171905 condMapEmpty!6811) mapIsEmpty!6811))

(assert (= (and b!171905 (not condMapEmpty!6811)) mapNonEmpty!6811))

(get-info :version)

(assert (= (and mapNonEmpty!6811 ((_ is ValueCellFull!1661) mapValue!6811)) b!171904))

(assert (= (and b!171905 ((_ is ValueCellFull!1661) mapDefault!6811)) b!171900))

(assert (= b!171903 b!171905))

(assert (= start!17106 b!171903))

(declare-fun m!200423 () Bool)

(assert (=> start!17106 m!200423))

(declare-fun m!200425 () Bool)

(assert (=> mapNonEmpty!6811 m!200425))

(declare-fun m!200427 () Bool)

(assert (=> b!171902 m!200427))

(declare-fun m!200429 () Bool)

(assert (=> b!171903 m!200429))

(declare-fun m!200431 () Bool)

(assert (=> b!171903 m!200431))

(check-sat (not start!17106) tp_is_empty!4009 (not b!171903) (not b_next!4237) (not b!171902) (not mapNonEmpty!6811) b_and!10651)
(check-sat b_and!10651 (not b_next!4237))
(get-model)

(declare-fun d!52307 () Bool)

(declare-fun res!81623 () Bool)

(declare-fun e!113480 () Bool)

(assert (=> d!52307 (=> (not res!81623) (not e!113480))))

(declare-fun simpleValid!136 (LongMapFixedSize!2230) Bool)

(assert (=> d!52307 (= res!81623 (simpleValid!136 thiss!1248))))

(assert (=> d!52307 (= (valid!968 thiss!1248) e!113480)))

(declare-fun b!171948 () Bool)

(declare-fun res!81624 () Bool)

(assert (=> b!171948 (=> (not res!81624) (not e!113480))))

(declare-fun arrayCountValidKeys!0 (array!7113 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!171948 (= res!81624 (= (arrayCountValidKeys!0 (_keys!5394 thiss!1248) #b00000000000000000000000000000000 (size!3677 (_keys!5394 thiss!1248))) (_size!1164 thiss!1248)))))

(declare-fun b!171949 () Bool)

(declare-fun res!81625 () Bool)

(assert (=> b!171949 (=> (not res!81625) (not e!113480))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7113 (_ BitVec 32)) Bool)

(assert (=> b!171949 (= res!81625 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5394 thiss!1248) (mask!8393 thiss!1248)))))

(declare-fun b!171950 () Bool)

(declare-datatypes ((List!2206 0))(
  ( (Nil!2203) (Cons!2202 (h!2819 (_ BitVec 64)) (t!7004 List!2206)) )
))
(declare-fun arrayNoDuplicates!0 (array!7113 (_ BitVec 32) List!2206) Bool)

(assert (=> b!171950 (= e!113480 (arrayNoDuplicates!0 (_keys!5394 thiss!1248) #b00000000000000000000000000000000 Nil!2203))))

(assert (= (and d!52307 res!81623) b!171948))

(assert (= (and b!171948 res!81624) b!171949))

(assert (= (and b!171949 res!81625) b!171950))

(declare-fun m!200453 () Bool)

(assert (=> d!52307 m!200453))

(declare-fun m!200455 () Bool)

(assert (=> b!171948 m!200455))

(declare-fun m!200457 () Bool)

(assert (=> b!171949 m!200457))

(declare-fun m!200459 () Bool)

(assert (=> b!171950 m!200459))

(assert (=> start!17106 d!52307))

(declare-fun d!52309 () Bool)

(assert (=> d!52309 (= (array_inv!2181 (_keys!5394 thiss!1248)) (bvsge (size!3677 (_keys!5394 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!171903 d!52309))

(declare-fun d!52311 () Bool)

(assert (=> d!52311 (= (array_inv!2182 (_values!3544 thiss!1248)) (bvsge (size!3678 (_values!3544 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!171903 d!52311))

(declare-fun d!52313 () Bool)

(assert (=> d!52313 (= (validMask!0 (mask!8393 thiss!1248)) (and (or (= (mask!8393 thiss!1248) #b00000000000000000000000000000111) (= (mask!8393 thiss!1248) #b00000000000000000000000000001111) (= (mask!8393 thiss!1248) #b00000000000000000000000000011111) (= (mask!8393 thiss!1248) #b00000000000000000000000000111111) (= (mask!8393 thiss!1248) #b00000000000000000000000001111111) (= (mask!8393 thiss!1248) #b00000000000000000000000011111111) (= (mask!8393 thiss!1248) #b00000000000000000000000111111111) (= (mask!8393 thiss!1248) #b00000000000000000000001111111111) (= (mask!8393 thiss!1248) #b00000000000000000000011111111111) (= (mask!8393 thiss!1248) #b00000000000000000000111111111111) (= (mask!8393 thiss!1248) #b00000000000000000001111111111111) (= (mask!8393 thiss!1248) #b00000000000000000011111111111111) (= (mask!8393 thiss!1248) #b00000000000000000111111111111111) (= (mask!8393 thiss!1248) #b00000000000000001111111111111111) (= (mask!8393 thiss!1248) #b00000000000000011111111111111111) (= (mask!8393 thiss!1248) #b00000000000000111111111111111111) (= (mask!8393 thiss!1248) #b00000000000001111111111111111111) (= (mask!8393 thiss!1248) #b00000000000011111111111111111111) (= (mask!8393 thiss!1248) #b00000000000111111111111111111111) (= (mask!8393 thiss!1248) #b00000000001111111111111111111111) (= (mask!8393 thiss!1248) #b00000000011111111111111111111111) (= (mask!8393 thiss!1248) #b00000000111111111111111111111111) (= (mask!8393 thiss!1248) #b00000001111111111111111111111111) (= (mask!8393 thiss!1248) #b00000011111111111111111111111111) (= (mask!8393 thiss!1248) #b00000111111111111111111111111111) (= (mask!8393 thiss!1248) #b00001111111111111111111111111111) (= (mask!8393 thiss!1248) #b00011111111111111111111111111111) (= (mask!8393 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8393 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!171902 d!52313))

(declare-fun b!171957 () Bool)

(declare-fun e!113485 () Bool)

(assert (=> b!171957 (= e!113485 tp_is_empty!4009)))

(declare-fun mapNonEmpty!6820 () Bool)

(declare-fun mapRes!6820 () Bool)

(declare-fun tp!15361 () Bool)

(assert (=> mapNonEmpty!6820 (= mapRes!6820 (and tp!15361 e!113485))))

(declare-fun mapKey!6820 () (_ BitVec 32))

(declare-fun mapValue!6820 () ValueCell!1661)

(declare-fun mapRest!6820 () (Array (_ BitVec 32) ValueCell!1661))

(assert (=> mapNonEmpty!6820 (= mapRest!6811 (store mapRest!6820 mapKey!6820 mapValue!6820))))

(declare-fun mapIsEmpty!6820 () Bool)

(assert (=> mapIsEmpty!6820 mapRes!6820))

(declare-fun condMapEmpty!6820 () Bool)

(declare-fun mapDefault!6820 () ValueCell!1661)

(assert (=> mapNonEmpty!6811 (= condMapEmpty!6820 (= mapRest!6811 ((as const (Array (_ BitVec 32) ValueCell!1661)) mapDefault!6820)))))

(declare-fun e!113486 () Bool)

(assert (=> mapNonEmpty!6811 (= tp!15346 (and e!113486 mapRes!6820))))

(declare-fun b!171958 () Bool)

(assert (=> b!171958 (= e!113486 tp_is_empty!4009)))

(assert (= (and mapNonEmpty!6811 condMapEmpty!6820) mapIsEmpty!6820))

(assert (= (and mapNonEmpty!6811 (not condMapEmpty!6820)) mapNonEmpty!6820))

(assert (= (and mapNonEmpty!6820 ((_ is ValueCellFull!1661) mapValue!6820)) b!171957))

(assert (= (and mapNonEmpty!6811 ((_ is ValueCellFull!1661) mapDefault!6820)) b!171958))

(declare-fun m!200461 () Bool)

(assert (=> mapNonEmpty!6820 m!200461))

(check-sat tp_is_empty!4009 (not b_next!4237) (not b!171948) (not d!52307) (not b!171949) (not mapNonEmpty!6820) b_and!10651 (not b!171950))
(check-sat b_and!10651 (not b_next!4237))
(get-model)

(declare-fun b!171970 () Bool)

(declare-fun e!113489 () Bool)

(assert (=> b!171970 (= e!113489 (and (bvsge (extraKeys!3300 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3300 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1164 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!171968 () Bool)

(declare-fun res!81635 () Bool)

(assert (=> b!171968 (=> (not res!81635) (not e!113489))))

(declare-fun size!3683 (LongMapFixedSize!2230) (_ BitVec 32))

(assert (=> b!171968 (= res!81635 (bvsge (size!3683 thiss!1248) (_size!1164 thiss!1248)))))

(declare-fun d!52315 () Bool)

(declare-fun res!81637 () Bool)

(assert (=> d!52315 (=> (not res!81637) (not e!113489))))

(assert (=> d!52315 (= res!81637 (validMask!0 (mask!8393 thiss!1248)))))

(assert (=> d!52315 (= (simpleValid!136 thiss!1248) e!113489)))

(declare-fun b!171967 () Bool)

(declare-fun res!81634 () Bool)

(assert (=> b!171967 (=> (not res!81634) (not e!113489))))

(assert (=> b!171967 (= res!81634 (and (= (size!3678 (_values!3544 thiss!1248)) (bvadd (mask!8393 thiss!1248) #b00000000000000000000000000000001)) (= (size!3677 (_keys!5394 thiss!1248)) (size!3678 (_values!3544 thiss!1248))) (bvsge (_size!1164 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1164 thiss!1248) (bvadd (mask!8393 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!171969 () Bool)

(declare-fun res!81636 () Bool)

(assert (=> b!171969 (=> (not res!81636) (not e!113489))))

(assert (=> b!171969 (= res!81636 (= (size!3683 thiss!1248) (bvadd (_size!1164 thiss!1248) (bvsdiv (bvadd (extraKeys!3300 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!52315 res!81637) b!171967))

(assert (= (and b!171967 res!81634) b!171968))

(assert (= (and b!171968 res!81635) b!171969))

(assert (= (and b!171969 res!81636) b!171970))

(declare-fun m!200463 () Bool)

(assert (=> b!171968 m!200463))

(assert (=> d!52315 m!200427))

(assert (=> b!171969 m!200463))

(assert (=> d!52307 d!52315))

(declare-fun b!171979 () Bool)

(declare-fun e!113495 () (_ BitVec 32))

(assert (=> b!171979 (= e!113495 #b00000000000000000000000000000000)))

(declare-fun b!171980 () Bool)

(declare-fun e!113494 () (_ BitVec 32))

(assert (=> b!171980 (= e!113495 e!113494)))

(declare-fun c!30806 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!171980 (= c!30806 (validKeyInArray!0 (select (arr!3382 (_keys!5394 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!171981 () Bool)

(declare-fun call!17482 () (_ BitVec 32))

(assert (=> b!171981 (= e!113494 call!17482)))

(declare-fun d!52317 () Bool)

(declare-fun lt!85455 () (_ BitVec 32))

(assert (=> d!52317 (and (bvsge lt!85455 #b00000000000000000000000000000000) (bvsle lt!85455 (bvsub (size!3677 (_keys!5394 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!52317 (= lt!85455 e!113495)))

(declare-fun c!30807 () Bool)

(assert (=> d!52317 (= c!30807 (bvsge #b00000000000000000000000000000000 (size!3677 (_keys!5394 thiss!1248))))))

(assert (=> d!52317 (and (bvsle #b00000000000000000000000000000000 (size!3677 (_keys!5394 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3677 (_keys!5394 thiss!1248)) (size!3677 (_keys!5394 thiss!1248))))))

(assert (=> d!52317 (= (arrayCountValidKeys!0 (_keys!5394 thiss!1248) #b00000000000000000000000000000000 (size!3677 (_keys!5394 thiss!1248))) lt!85455)))

(declare-fun b!171982 () Bool)

(assert (=> b!171982 (= e!113494 (bvadd #b00000000000000000000000000000001 call!17482))))

(declare-fun bm!17479 () Bool)

(assert (=> bm!17479 (= call!17482 (arrayCountValidKeys!0 (_keys!5394 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3677 (_keys!5394 thiss!1248))))))

(assert (= (and d!52317 c!30807) b!171979))

(assert (= (and d!52317 (not c!30807)) b!171980))

(assert (= (and b!171980 c!30806) b!171982))

(assert (= (and b!171980 (not c!30806)) b!171981))

(assert (= (or b!171982 b!171981) bm!17479))

(declare-fun m!200465 () Bool)

(assert (=> b!171980 m!200465))

(assert (=> b!171980 m!200465))

(declare-fun m!200467 () Bool)

(assert (=> b!171980 m!200467))

(declare-fun m!200469 () Bool)

(assert (=> bm!17479 m!200469))

(assert (=> b!171948 d!52317))

(declare-fun b!171993 () Bool)

(declare-fun e!113506 () Bool)

(declare-fun call!17485 () Bool)

(assert (=> b!171993 (= e!113506 call!17485)))

(declare-fun d!52319 () Bool)

(declare-fun res!81646 () Bool)

(declare-fun e!113504 () Bool)

(assert (=> d!52319 (=> res!81646 e!113504)))

(assert (=> d!52319 (= res!81646 (bvsge #b00000000000000000000000000000000 (size!3677 (_keys!5394 thiss!1248))))))

(assert (=> d!52319 (= (arrayNoDuplicates!0 (_keys!5394 thiss!1248) #b00000000000000000000000000000000 Nil!2203) e!113504)))

(declare-fun bm!17482 () Bool)

(declare-fun c!30810 () Bool)

(assert (=> bm!17482 (= call!17485 (arrayNoDuplicates!0 (_keys!5394 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30810 (Cons!2202 (select (arr!3382 (_keys!5394 thiss!1248)) #b00000000000000000000000000000000) Nil!2203) Nil!2203)))))

(declare-fun b!171994 () Bool)

(assert (=> b!171994 (= e!113506 call!17485)))

(declare-fun b!171995 () Bool)

(declare-fun e!113505 () Bool)

(assert (=> b!171995 (= e!113504 e!113505)))

(declare-fun res!81645 () Bool)

(assert (=> b!171995 (=> (not res!81645) (not e!113505))))

(declare-fun e!113507 () Bool)

(assert (=> b!171995 (= res!81645 (not e!113507))))

(declare-fun res!81644 () Bool)

(assert (=> b!171995 (=> (not res!81644) (not e!113507))))

(assert (=> b!171995 (= res!81644 (validKeyInArray!0 (select (arr!3382 (_keys!5394 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!171996 () Bool)

(assert (=> b!171996 (= e!113505 e!113506)))

(assert (=> b!171996 (= c!30810 (validKeyInArray!0 (select (arr!3382 (_keys!5394 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!171997 () Bool)

(declare-fun contains!1146 (List!2206 (_ BitVec 64)) Bool)

(assert (=> b!171997 (= e!113507 (contains!1146 Nil!2203 (select (arr!3382 (_keys!5394 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!52319 (not res!81646)) b!171995))

(assert (= (and b!171995 res!81644) b!171997))

(assert (= (and b!171995 res!81645) b!171996))

(assert (= (and b!171996 c!30810) b!171993))

(assert (= (and b!171996 (not c!30810)) b!171994))

(assert (= (or b!171993 b!171994) bm!17482))

(assert (=> bm!17482 m!200465))

(declare-fun m!200471 () Bool)

(assert (=> bm!17482 m!200471))

(assert (=> b!171995 m!200465))

(assert (=> b!171995 m!200465))

(assert (=> b!171995 m!200467))

(assert (=> b!171996 m!200465))

(assert (=> b!171996 m!200465))

(assert (=> b!171996 m!200467))

(assert (=> b!171997 m!200465))

(assert (=> b!171997 m!200465))

(declare-fun m!200473 () Bool)

(assert (=> b!171997 m!200473))

(assert (=> b!171950 d!52319))

(declare-fun d!52321 () Bool)

(declare-fun res!81652 () Bool)

(declare-fun e!113514 () Bool)

(assert (=> d!52321 (=> res!81652 e!113514)))

(assert (=> d!52321 (= res!81652 (bvsge #b00000000000000000000000000000000 (size!3677 (_keys!5394 thiss!1248))))))

(assert (=> d!52321 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5394 thiss!1248) (mask!8393 thiss!1248)) e!113514)))

(declare-fun b!172006 () Bool)

(declare-fun e!113515 () Bool)

(assert (=> b!172006 (= e!113514 e!113515)))

(declare-fun c!30813 () Bool)

(assert (=> b!172006 (= c!30813 (validKeyInArray!0 (select (arr!3382 (_keys!5394 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!172007 () Bool)

(declare-fun call!17488 () Bool)

(assert (=> b!172007 (= e!113515 call!17488)))

(declare-fun b!172008 () Bool)

(declare-fun e!113516 () Bool)

(assert (=> b!172008 (= e!113515 e!113516)))

(declare-fun lt!85463 () (_ BitVec 64))

(assert (=> b!172008 (= lt!85463 (select (arr!3382 (_keys!5394 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5277 0))(
  ( (Unit!5278) )
))
(declare-fun lt!85462 () Unit!5277)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7113 (_ BitVec 64) (_ BitVec 32)) Unit!5277)

(assert (=> b!172008 (= lt!85462 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5394 thiss!1248) lt!85463 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7113 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!172008 (arrayContainsKey!0 (_keys!5394 thiss!1248) lt!85463 #b00000000000000000000000000000000)))

(declare-fun lt!85464 () Unit!5277)

(assert (=> b!172008 (= lt!85464 lt!85462)))

(declare-fun res!81651 () Bool)

(declare-datatypes ((SeekEntryResult!546 0))(
  ( (MissingZero!546 (index!4352 (_ BitVec 32))) (Found!546 (index!4353 (_ BitVec 32))) (Intermediate!546 (undefined!1358 Bool) (index!4354 (_ BitVec 32)) (x!19000 (_ BitVec 32))) (Undefined!546) (MissingVacant!546 (index!4355 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7113 (_ BitVec 32)) SeekEntryResult!546)

(assert (=> b!172008 (= res!81651 (= (seekEntryOrOpen!0 (select (arr!3382 (_keys!5394 thiss!1248)) #b00000000000000000000000000000000) (_keys!5394 thiss!1248) (mask!8393 thiss!1248)) (Found!546 #b00000000000000000000000000000000)))))

(assert (=> b!172008 (=> (not res!81651) (not e!113516))))

(declare-fun bm!17485 () Bool)

(assert (=> bm!17485 (= call!17488 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5394 thiss!1248) (mask!8393 thiss!1248)))))

(declare-fun b!172009 () Bool)

(assert (=> b!172009 (= e!113516 call!17488)))

(assert (= (and d!52321 (not res!81652)) b!172006))

(assert (= (and b!172006 c!30813) b!172008))

(assert (= (and b!172006 (not c!30813)) b!172007))

(assert (= (and b!172008 res!81651) b!172009))

(assert (= (or b!172009 b!172007) bm!17485))

(assert (=> b!172006 m!200465))

(assert (=> b!172006 m!200465))

(assert (=> b!172006 m!200467))

(assert (=> b!172008 m!200465))

(declare-fun m!200475 () Bool)

(assert (=> b!172008 m!200475))

(declare-fun m!200477 () Bool)

(assert (=> b!172008 m!200477))

(assert (=> b!172008 m!200465))

(declare-fun m!200479 () Bool)

(assert (=> b!172008 m!200479))

(declare-fun m!200481 () Bool)

(assert (=> bm!17485 m!200481))

(assert (=> b!171949 d!52321))

(declare-fun b!172010 () Bool)

(declare-fun e!113517 () Bool)

(assert (=> b!172010 (= e!113517 tp_is_empty!4009)))

(declare-fun mapNonEmpty!6821 () Bool)

(declare-fun mapRes!6821 () Bool)

(declare-fun tp!15362 () Bool)

(assert (=> mapNonEmpty!6821 (= mapRes!6821 (and tp!15362 e!113517))))

(declare-fun mapValue!6821 () ValueCell!1661)

(declare-fun mapKey!6821 () (_ BitVec 32))

(declare-fun mapRest!6821 () (Array (_ BitVec 32) ValueCell!1661))

(assert (=> mapNonEmpty!6821 (= mapRest!6820 (store mapRest!6821 mapKey!6821 mapValue!6821))))

(declare-fun mapIsEmpty!6821 () Bool)

(assert (=> mapIsEmpty!6821 mapRes!6821))

(declare-fun condMapEmpty!6821 () Bool)

(declare-fun mapDefault!6821 () ValueCell!1661)

(assert (=> mapNonEmpty!6820 (= condMapEmpty!6821 (= mapRest!6820 ((as const (Array (_ BitVec 32) ValueCell!1661)) mapDefault!6821)))))

(declare-fun e!113518 () Bool)

(assert (=> mapNonEmpty!6820 (= tp!15361 (and e!113518 mapRes!6821))))

(declare-fun b!172011 () Bool)

(assert (=> b!172011 (= e!113518 tp_is_empty!4009)))

(assert (= (and mapNonEmpty!6820 condMapEmpty!6821) mapIsEmpty!6821))

(assert (= (and mapNonEmpty!6820 (not condMapEmpty!6821)) mapNonEmpty!6821))

(assert (= (and mapNonEmpty!6821 ((_ is ValueCellFull!1661) mapValue!6821)) b!172010))

(assert (= (and mapNonEmpty!6820 ((_ is ValueCellFull!1661) mapDefault!6821)) b!172011))

(declare-fun m!200483 () Bool)

(assert (=> mapNonEmpty!6821 m!200483))

(check-sat (not b!171996) (not b!171995) (not bm!17485) tp_is_empty!4009 (not b!172008) (not d!52315) (not b_next!4237) (not b!171968) (not bm!17479) (not b!172006) (not bm!17482) (not b!171997) b_and!10651 (not b!171980) (not mapNonEmpty!6821) (not b!171969))
(check-sat b_and!10651 (not b_next!4237))

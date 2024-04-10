; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17104 () Bool)

(assert start!17104)

(declare-fun b!172067 () Bool)

(declare-fun b_free!4239 () Bool)

(declare-fun b_next!4239 () Bool)

(assert (=> b!172067 (= b_free!4239 (not b_next!4239))))

(declare-fun tp!15351 () Bool)

(declare-fun b_and!10679 () Bool)

(assert (=> b!172067 (= tp!15351 b_and!10679)))

(declare-fun b!172065 () Bool)

(declare-fun e!113558 () Bool)

(declare-fun e!113559 () Bool)

(declare-fun mapRes!6814 () Bool)

(assert (=> b!172065 (= e!113558 (and e!113559 mapRes!6814))))

(declare-fun condMapEmpty!6814 () Bool)

(declare-datatypes ((V!4995 0))(
  ( (V!4996 (val!2050 Int)) )
))
(declare-datatypes ((ValueCell!1662 0))(
  ( (ValueCellFull!1662 (v!3918 V!4995)) (EmptyCell!1662) )
))
(declare-datatypes ((array!7137 0))(
  ( (array!7138 (arr!3395 (Array (_ BitVec 32) (_ BitVec 64))) (size!3689 (_ BitVec 32))) )
))
(declare-datatypes ((array!7139 0))(
  ( (array!7140 (arr!3396 (Array (_ BitVec 32) ValueCell!1662)) (size!3690 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2232 0))(
  ( (LongMapFixedSize!2233 (defaultEntry!3562 Int) (mask!8395 (_ BitVec 32)) (extraKeys!3301 (_ BitVec 32)) (zeroValue!3403 V!4995) (minValue!3405 V!4995) (_size!1165 (_ BitVec 32)) (_keys!5396 array!7137) (_values!3545 array!7139) (_vacant!1165 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2232)

(declare-fun mapDefault!6814 () ValueCell!1662)

(assert (=> b!172065 (= condMapEmpty!6814 (= (arr!3396 (_values!3545 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1662)) mapDefault!6814)))))

(declare-fun b!172066 () Bool)

(declare-fun e!113556 () Bool)

(declare-fun tp_is_empty!4011 () Bool)

(assert (=> b!172066 (= e!113556 tp_is_empty!4011)))

(declare-fun e!113560 () Bool)

(declare-fun array_inv!2173 (array!7137) Bool)

(declare-fun array_inv!2174 (array!7139) Bool)

(assert (=> b!172067 (= e!113560 (and tp!15351 tp_is_empty!4011 (array_inv!2173 (_keys!5396 thiss!1248)) (array_inv!2174 (_values!3545 thiss!1248)) e!113558))))

(declare-fun b!172068 () Bool)

(declare-fun e!113555 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!172068 (= e!113555 (not (validMask!0 (mask!8395 thiss!1248))))))

(declare-fun mapIsEmpty!6814 () Bool)

(assert (=> mapIsEmpty!6814 mapRes!6814))

(declare-fun b!172069 () Bool)

(assert (=> b!172069 (= e!113559 tp_is_empty!4011)))

(declare-fun mapNonEmpty!6814 () Bool)

(declare-fun tp!15352 () Bool)

(assert (=> mapNonEmpty!6814 (= mapRes!6814 (and tp!15352 e!113556))))

(declare-fun mapValue!6814 () ValueCell!1662)

(declare-fun mapKey!6814 () (_ BitVec 32))

(declare-fun mapRest!6814 () (Array (_ BitVec 32) ValueCell!1662))

(assert (=> mapNonEmpty!6814 (= (arr!3396 (_values!3545 thiss!1248)) (store mapRest!6814 mapKey!6814 mapValue!6814))))

(declare-fun b!172070 () Bool)

(declare-fun res!81704 () Bool)

(assert (=> b!172070 (=> (not res!81704) (not e!113555))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!172070 (= res!81704 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!81705 () Bool)

(assert (=> start!17104 (=> (not res!81705) (not e!113555))))

(declare-fun valid!948 (LongMapFixedSize!2232) Bool)

(assert (=> start!17104 (= res!81705 (valid!948 thiss!1248))))

(assert (=> start!17104 e!113555))

(assert (=> start!17104 e!113560))

(assert (=> start!17104 true))

(assert (= (and start!17104 res!81705) b!172070))

(assert (= (and b!172070 res!81704) b!172068))

(assert (= (and b!172065 condMapEmpty!6814) mapIsEmpty!6814))

(assert (= (and b!172065 (not condMapEmpty!6814)) mapNonEmpty!6814))

(get-info :version)

(assert (= (and mapNonEmpty!6814 ((_ is ValueCellFull!1662) mapValue!6814)) b!172066))

(assert (= (and b!172065 ((_ is ValueCellFull!1662) mapDefault!6814)) b!172069))

(assert (= b!172067 b!172065))

(assert (= start!17104 b!172067))

(declare-fun m!201053 () Bool)

(assert (=> b!172067 m!201053))

(declare-fun m!201055 () Bool)

(assert (=> b!172067 m!201055))

(declare-fun m!201057 () Bool)

(assert (=> b!172068 m!201057))

(declare-fun m!201059 () Bool)

(assert (=> mapNonEmpty!6814 m!201059))

(declare-fun m!201061 () Bool)

(assert (=> start!17104 m!201061))

(check-sat b_and!10679 (not mapNonEmpty!6814) tp_is_empty!4011 (not b_next!4239) (not start!17104) (not b!172067) (not b!172068))
(check-sat b_and!10679 (not b_next!4239))
(get-model)

(declare-fun d!52455 () Bool)

(declare-fun res!81718 () Bool)

(declare-fun e!113581 () Bool)

(assert (=> d!52455 (=> (not res!81718) (not e!113581))))

(declare-fun simpleValid!136 (LongMapFixedSize!2232) Bool)

(assert (=> d!52455 (= res!81718 (simpleValid!136 thiss!1248))))

(assert (=> d!52455 (= (valid!948 thiss!1248) e!113581)))

(declare-fun b!172095 () Bool)

(declare-fun res!81719 () Bool)

(assert (=> b!172095 (=> (not res!81719) (not e!113581))))

(declare-fun arrayCountValidKeys!0 (array!7137 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!172095 (= res!81719 (= (arrayCountValidKeys!0 (_keys!5396 thiss!1248) #b00000000000000000000000000000000 (size!3689 (_keys!5396 thiss!1248))) (_size!1165 thiss!1248)))))

(declare-fun b!172096 () Bool)

(declare-fun res!81720 () Bool)

(assert (=> b!172096 (=> (not res!81720) (not e!113581))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7137 (_ BitVec 32)) Bool)

(assert (=> b!172096 (= res!81720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5396 thiss!1248) (mask!8395 thiss!1248)))))

(declare-fun b!172097 () Bool)

(declare-datatypes ((List!2196 0))(
  ( (Nil!2193) (Cons!2192 (h!2809 (_ BitVec 64)) (t!7003 List!2196)) )
))
(declare-fun arrayNoDuplicates!0 (array!7137 (_ BitVec 32) List!2196) Bool)

(assert (=> b!172097 (= e!113581 (arrayNoDuplicates!0 (_keys!5396 thiss!1248) #b00000000000000000000000000000000 Nil!2193))))

(assert (= (and d!52455 res!81718) b!172095))

(assert (= (and b!172095 res!81719) b!172096))

(assert (= (and b!172096 res!81720) b!172097))

(declare-fun m!201073 () Bool)

(assert (=> d!52455 m!201073))

(declare-fun m!201075 () Bool)

(assert (=> b!172095 m!201075))

(declare-fun m!201077 () Bool)

(assert (=> b!172096 m!201077))

(declare-fun m!201079 () Bool)

(assert (=> b!172097 m!201079))

(assert (=> start!17104 d!52455))

(declare-fun d!52457 () Bool)

(assert (=> d!52457 (= (array_inv!2173 (_keys!5396 thiss!1248)) (bvsge (size!3689 (_keys!5396 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!172067 d!52457))

(declare-fun d!52459 () Bool)

(assert (=> d!52459 (= (array_inv!2174 (_values!3545 thiss!1248)) (bvsge (size!3690 (_values!3545 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!172067 d!52459))

(declare-fun d!52461 () Bool)

(assert (=> d!52461 (= (validMask!0 (mask!8395 thiss!1248)) (and (or (= (mask!8395 thiss!1248) #b00000000000000000000000000000111) (= (mask!8395 thiss!1248) #b00000000000000000000000000001111) (= (mask!8395 thiss!1248) #b00000000000000000000000000011111) (= (mask!8395 thiss!1248) #b00000000000000000000000000111111) (= (mask!8395 thiss!1248) #b00000000000000000000000001111111) (= (mask!8395 thiss!1248) #b00000000000000000000000011111111) (= (mask!8395 thiss!1248) #b00000000000000000000000111111111) (= (mask!8395 thiss!1248) #b00000000000000000000001111111111) (= (mask!8395 thiss!1248) #b00000000000000000000011111111111) (= (mask!8395 thiss!1248) #b00000000000000000000111111111111) (= (mask!8395 thiss!1248) #b00000000000000000001111111111111) (= (mask!8395 thiss!1248) #b00000000000000000011111111111111) (= (mask!8395 thiss!1248) #b00000000000000000111111111111111) (= (mask!8395 thiss!1248) #b00000000000000001111111111111111) (= (mask!8395 thiss!1248) #b00000000000000011111111111111111) (= (mask!8395 thiss!1248) #b00000000000000111111111111111111) (= (mask!8395 thiss!1248) #b00000000000001111111111111111111) (= (mask!8395 thiss!1248) #b00000000000011111111111111111111) (= (mask!8395 thiss!1248) #b00000000000111111111111111111111) (= (mask!8395 thiss!1248) #b00000000001111111111111111111111) (= (mask!8395 thiss!1248) #b00000000011111111111111111111111) (= (mask!8395 thiss!1248) #b00000000111111111111111111111111) (= (mask!8395 thiss!1248) #b00000001111111111111111111111111) (= (mask!8395 thiss!1248) #b00000011111111111111111111111111) (= (mask!8395 thiss!1248) #b00000111111111111111111111111111) (= (mask!8395 thiss!1248) #b00001111111111111111111111111111) (= (mask!8395 thiss!1248) #b00011111111111111111111111111111) (= (mask!8395 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8395 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!172068 d!52461))

(declare-fun condMapEmpty!6820 () Bool)

(declare-fun mapDefault!6820 () ValueCell!1662)

(assert (=> mapNonEmpty!6814 (= condMapEmpty!6820 (= mapRest!6814 ((as const (Array (_ BitVec 32) ValueCell!1662)) mapDefault!6820)))))

(declare-fun e!113587 () Bool)

(declare-fun mapRes!6820 () Bool)

(assert (=> mapNonEmpty!6814 (= tp!15352 (and e!113587 mapRes!6820))))

(declare-fun mapIsEmpty!6820 () Bool)

(assert (=> mapIsEmpty!6820 mapRes!6820))

(declare-fun b!172105 () Bool)

(assert (=> b!172105 (= e!113587 tp_is_empty!4011)))

(declare-fun b!172104 () Bool)

(declare-fun e!113586 () Bool)

(assert (=> b!172104 (= e!113586 tp_is_empty!4011)))

(declare-fun mapNonEmpty!6820 () Bool)

(declare-fun tp!15361 () Bool)

(assert (=> mapNonEmpty!6820 (= mapRes!6820 (and tp!15361 e!113586))))

(declare-fun mapKey!6820 () (_ BitVec 32))

(declare-fun mapValue!6820 () ValueCell!1662)

(declare-fun mapRest!6820 () (Array (_ BitVec 32) ValueCell!1662))

(assert (=> mapNonEmpty!6820 (= mapRest!6814 (store mapRest!6820 mapKey!6820 mapValue!6820))))

(assert (= (and mapNonEmpty!6814 condMapEmpty!6820) mapIsEmpty!6820))

(assert (= (and mapNonEmpty!6814 (not condMapEmpty!6820)) mapNonEmpty!6820))

(assert (= (and mapNonEmpty!6820 ((_ is ValueCellFull!1662) mapValue!6820)) b!172104))

(assert (= (and mapNonEmpty!6814 ((_ is ValueCellFull!1662) mapDefault!6820)) b!172105))

(declare-fun m!201081 () Bool)

(assert (=> mapNonEmpty!6820 m!201081))

(check-sat b_and!10679 (not b!172097) (not d!52455) (not mapNonEmpty!6820) tp_is_empty!4011 (not b!172096) (not b_next!4239) (not b!172095))
(check-sat b_and!10679 (not b_next!4239))
(get-model)

(declare-fun b!172114 () Bool)

(declare-fun res!81730 () Bool)

(declare-fun e!113590 () Bool)

(assert (=> b!172114 (=> (not res!81730) (not e!113590))))

(assert (=> b!172114 (= res!81730 (and (= (size!3690 (_values!3545 thiss!1248)) (bvadd (mask!8395 thiss!1248) #b00000000000000000000000000000001)) (= (size!3689 (_keys!5396 thiss!1248)) (size!3690 (_values!3545 thiss!1248))) (bvsge (_size!1165 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1165 thiss!1248) (bvadd (mask!8395 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!172115 () Bool)

(declare-fun res!81729 () Bool)

(assert (=> b!172115 (=> (not res!81729) (not e!113590))))

(declare-fun size!3693 (LongMapFixedSize!2232) (_ BitVec 32))

(assert (=> b!172115 (= res!81729 (bvsge (size!3693 thiss!1248) (_size!1165 thiss!1248)))))

(declare-fun d!52463 () Bool)

(declare-fun res!81732 () Bool)

(assert (=> d!52463 (=> (not res!81732) (not e!113590))))

(assert (=> d!52463 (= res!81732 (validMask!0 (mask!8395 thiss!1248)))))

(assert (=> d!52463 (= (simpleValid!136 thiss!1248) e!113590)))

(declare-fun b!172117 () Bool)

(assert (=> b!172117 (= e!113590 (and (bvsge (extraKeys!3301 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3301 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1165 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!172116 () Bool)

(declare-fun res!81731 () Bool)

(assert (=> b!172116 (=> (not res!81731) (not e!113590))))

(assert (=> b!172116 (= res!81731 (= (size!3693 thiss!1248) (bvadd (_size!1165 thiss!1248) (bvsdiv (bvadd (extraKeys!3301 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!52463 res!81732) b!172114))

(assert (= (and b!172114 res!81730) b!172115))

(assert (= (and b!172115 res!81729) b!172116))

(assert (= (and b!172116 res!81731) b!172117))

(declare-fun m!201083 () Bool)

(assert (=> b!172115 m!201083))

(assert (=> d!52463 m!201057))

(assert (=> b!172116 m!201083))

(assert (=> d!52455 d!52463))

(declare-fun b!172126 () Bool)

(declare-fun e!113596 () (_ BitVec 32))

(assert (=> b!172126 (= e!113596 #b00000000000000000000000000000000)))

(declare-fun b!172127 () Bool)

(declare-fun e!113595 () (_ BitVec 32))

(declare-fun call!17506 () (_ BitVec 32))

(assert (=> b!172127 (= e!113595 (bvadd #b00000000000000000000000000000001 call!17506))))

(declare-fun d!52465 () Bool)

(declare-fun lt!85636 () (_ BitVec 32))

(assert (=> d!52465 (and (bvsge lt!85636 #b00000000000000000000000000000000) (bvsle lt!85636 (bvsub (size!3689 (_keys!5396 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!52465 (= lt!85636 e!113596)))

(declare-fun c!30832 () Bool)

(assert (=> d!52465 (= c!30832 (bvsge #b00000000000000000000000000000000 (size!3689 (_keys!5396 thiss!1248))))))

(assert (=> d!52465 (and (bvsle #b00000000000000000000000000000000 (size!3689 (_keys!5396 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3689 (_keys!5396 thiss!1248)) (size!3689 (_keys!5396 thiss!1248))))))

(assert (=> d!52465 (= (arrayCountValidKeys!0 (_keys!5396 thiss!1248) #b00000000000000000000000000000000 (size!3689 (_keys!5396 thiss!1248))) lt!85636)))

(declare-fun b!172128 () Bool)

(assert (=> b!172128 (= e!113595 call!17506)))

(declare-fun bm!17503 () Bool)

(assert (=> bm!17503 (= call!17506 (arrayCountValidKeys!0 (_keys!5396 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3689 (_keys!5396 thiss!1248))))))

(declare-fun b!172129 () Bool)

(assert (=> b!172129 (= e!113596 e!113595)))

(declare-fun c!30833 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!172129 (= c!30833 (validKeyInArray!0 (select (arr!3395 (_keys!5396 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!52465 c!30832) b!172126))

(assert (= (and d!52465 (not c!30832)) b!172129))

(assert (= (and b!172129 c!30833) b!172127))

(assert (= (and b!172129 (not c!30833)) b!172128))

(assert (= (or b!172127 b!172128) bm!17503))

(declare-fun m!201085 () Bool)

(assert (=> bm!17503 m!201085))

(declare-fun m!201087 () Bool)

(assert (=> b!172129 m!201087))

(assert (=> b!172129 m!201087))

(declare-fun m!201089 () Bool)

(assert (=> b!172129 m!201089))

(assert (=> b!172095 d!52465))

(declare-fun b!172138 () Bool)

(declare-fun e!113604 () Bool)

(declare-fun call!17509 () Bool)

(assert (=> b!172138 (= e!113604 call!17509)))

(declare-fun b!172139 () Bool)

(declare-fun e!113603 () Bool)

(assert (=> b!172139 (= e!113603 call!17509)))

(declare-fun bm!17506 () Bool)

(assert (=> bm!17506 (= call!17509 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5396 thiss!1248) (mask!8395 thiss!1248)))))

(declare-fun b!172140 () Bool)

(assert (=> b!172140 (= e!113603 e!113604)))

(declare-fun lt!85644 () (_ BitVec 64))

(assert (=> b!172140 (= lt!85644 (select (arr!3395 (_keys!5396 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5300 0))(
  ( (Unit!5301) )
))
(declare-fun lt!85643 () Unit!5300)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7137 (_ BitVec 64) (_ BitVec 32)) Unit!5300)

(assert (=> b!172140 (= lt!85643 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5396 thiss!1248) lt!85644 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7137 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!172140 (arrayContainsKey!0 (_keys!5396 thiss!1248) lt!85644 #b00000000000000000000000000000000)))

(declare-fun lt!85645 () Unit!5300)

(assert (=> b!172140 (= lt!85645 lt!85643)))

(declare-fun res!81737 () Bool)

(declare-datatypes ((SeekEntryResult!535 0))(
  ( (MissingZero!535 (index!4308 (_ BitVec 32))) (Found!535 (index!4309 (_ BitVec 32))) (Intermediate!535 (undefined!1347 Bool) (index!4310 (_ BitVec 32)) (x!18990 (_ BitVec 32))) (Undefined!535) (MissingVacant!535 (index!4311 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7137 (_ BitVec 32)) SeekEntryResult!535)

(assert (=> b!172140 (= res!81737 (= (seekEntryOrOpen!0 (select (arr!3395 (_keys!5396 thiss!1248)) #b00000000000000000000000000000000) (_keys!5396 thiss!1248) (mask!8395 thiss!1248)) (Found!535 #b00000000000000000000000000000000)))))

(assert (=> b!172140 (=> (not res!81737) (not e!113604))))

(declare-fun b!172141 () Bool)

(declare-fun e!113605 () Bool)

(assert (=> b!172141 (= e!113605 e!113603)))

(declare-fun c!30836 () Bool)

(assert (=> b!172141 (= c!30836 (validKeyInArray!0 (select (arr!3395 (_keys!5396 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!52467 () Bool)

(declare-fun res!81738 () Bool)

(assert (=> d!52467 (=> res!81738 e!113605)))

(assert (=> d!52467 (= res!81738 (bvsge #b00000000000000000000000000000000 (size!3689 (_keys!5396 thiss!1248))))))

(assert (=> d!52467 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5396 thiss!1248) (mask!8395 thiss!1248)) e!113605)))

(assert (= (and d!52467 (not res!81738)) b!172141))

(assert (= (and b!172141 c!30836) b!172140))

(assert (= (and b!172141 (not c!30836)) b!172139))

(assert (= (and b!172140 res!81737) b!172138))

(assert (= (or b!172138 b!172139) bm!17506))

(declare-fun m!201091 () Bool)

(assert (=> bm!17506 m!201091))

(assert (=> b!172140 m!201087))

(declare-fun m!201093 () Bool)

(assert (=> b!172140 m!201093))

(declare-fun m!201095 () Bool)

(assert (=> b!172140 m!201095))

(assert (=> b!172140 m!201087))

(declare-fun m!201097 () Bool)

(assert (=> b!172140 m!201097))

(assert (=> b!172141 m!201087))

(assert (=> b!172141 m!201087))

(assert (=> b!172141 m!201089))

(assert (=> b!172096 d!52467))

(declare-fun b!172152 () Bool)

(declare-fun e!113616 () Bool)

(declare-fun call!17512 () Bool)

(assert (=> b!172152 (= e!113616 call!17512)))

(declare-fun b!172153 () Bool)

(declare-fun e!113614 () Bool)

(declare-fun contains!1148 (List!2196 (_ BitVec 64)) Bool)

(assert (=> b!172153 (= e!113614 (contains!1148 Nil!2193 (select (arr!3395 (_keys!5396 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17509 () Bool)

(declare-fun c!30839 () Bool)

(assert (=> bm!17509 (= call!17512 (arrayNoDuplicates!0 (_keys!5396 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30839 (Cons!2192 (select (arr!3395 (_keys!5396 thiss!1248)) #b00000000000000000000000000000000) Nil!2193) Nil!2193)))))

(declare-fun b!172154 () Bool)

(declare-fun e!113617 () Bool)

(declare-fun e!113615 () Bool)

(assert (=> b!172154 (= e!113617 e!113615)))

(declare-fun res!81747 () Bool)

(assert (=> b!172154 (=> (not res!81747) (not e!113615))))

(assert (=> b!172154 (= res!81747 (not e!113614))))

(declare-fun res!81745 () Bool)

(assert (=> b!172154 (=> (not res!81745) (not e!113614))))

(assert (=> b!172154 (= res!81745 (validKeyInArray!0 (select (arr!3395 (_keys!5396 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!172155 () Bool)

(assert (=> b!172155 (= e!113616 call!17512)))

(declare-fun d!52469 () Bool)

(declare-fun res!81746 () Bool)

(assert (=> d!52469 (=> res!81746 e!113617)))

(assert (=> d!52469 (= res!81746 (bvsge #b00000000000000000000000000000000 (size!3689 (_keys!5396 thiss!1248))))))

(assert (=> d!52469 (= (arrayNoDuplicates!0 (_keys!5396 thiss!1248) #b00000000000000000000000000000000 Nil!2193) e!113617)))

(declare-fun b!172156 () Bool)

(assert (=> b!172156 (= e!113615 e!113616)))

(assert (=> b!172156 (= c!30839 (validKeyInArray!0 (select (arr!3395 (_keys!5396 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!52469 (not res!81746)) b!172154))

(assert (= (and b!172154 res!81745) b!172153))

(assert (= (and b!172154 res!81747) b!172156))

(assert (= (and b!172156 c!30839) b!172152))

(assert (= (and b!172156 (not c!30839)) b!172155))

(assert (= (or b!172152 b!172155) bm!17509))

(assert (=> b!172153 m!201087))

(assert (=> b!172153 m!201087))

(declare-fun m!201099 () Bool)

(assert (=> b!172153 m!201099))

(assert (=> bm!17509 m!201087))

(declare-fun m!201101 () Bool)

(assert (=> bm!17509 m!201101))

(assert (=> b!172154 m!201087))

(assert (=> b!172154 m!201087))

(assert (=> b!172154 m!201089))

(assert (=> b!172156 m!201087))

(assert (=> b!172156 m!201087))

(assert (=> b!172156 m!201089))

(assert (=> b!172097 d!52469))

(declare-fun condMapEmpty!6821 () Bool)

(declare-fun mapDefault!6821 () ValueCell!1662)

(assert (=> mapNonEmpty!6820 (= condMapEmpty!6821 (= mapRest!6820 ((as const (Array (_ BitVec 32) ValueCell!1662)) mapDefault!6821)))))

(declare-fun e!113619 () Bool)

(declare-fun mapRes!6821 () Bool)

(assert (=> mapNonEmpty!6820 (= tp!15361 (and e!113619 mapRes!6821))))

(declare-fun mapIsEmpty!6821 () Bool)

(assert (=> mapIsEmpty!6821 mapRes!6821))

(declare-fun b!172158 () Bool)

(assert (=> b!172158 (= e!113619 tp_is_empty!4011)))

(declare-fun b!172157 () Bool)

(declare-fun e!113618 () Bool)

(assert (=> b!172157 (= e!113618 tp_is_empty!4011)))

(declare-fun mapNonEmpty!6821 () Bool)

(declare-fun tp!15362 () Bool)

(assert (=> mapNonEmpty!6821 (= mapRes!6821 (and tp!15362 e!113618))))

(declare-fun mapKey!6821 () (_ BitVec 32))

(declare-fun mapRest!6821 () (Array (_ BitVec 32) ValueCell!1662))

(declare-fun mapValue!6821 () ValueCell!1662)

(assert (=> mapNonEmpty!6821 (= mapRest!6820 (store mapRest!6821 mapKey!6821 mapValue!6821))))

(assert (= (and mapNonEmpty!6820 condMapEmpty!6821) mapIsEmpty!6821))

(assert (= (and mapNonEmpty!6820 (not condMapEmpty!6821)) mapNonEmpty!6821))

(assert (= (and mapNonEmpty!6821 ((_ is ValueCellFull!1662) mapValue!6821)) b!172157))

(assert (= (and mapNonEmpty!6820 ((_ is ValueCellFull!1662) mapDefault!6821)) b!172158))

(declare-fun m!201103 () Bool)

(assert (=> mapNonEmpty!6821 m!201103))

(check-sat b_and!10679 (not b!172129) (not bm!17503) (not b!172154) (not b_next!4239) (not b!172156) (not b!172141) (not mapNonEmpty!6821) (not d!52463) (not bm!17509) (not b!172153) (not bm!17506) tp_is_empty!4011 (not b!172140) (not b!172116) (not b!172115))
(check-sat b_and!10679 (not b_next!4239))

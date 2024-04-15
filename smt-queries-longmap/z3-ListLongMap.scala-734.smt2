; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17128 () Bool)

(assert start!17128)

(declare-fun b!172026 () Bool)

(declare-fun b_free!4243 () Bool)

(declare-fun b_next!4243 () Bool)

(assert (=> b!172026 (= b_free!4243 (not b_next!4243))))

(declare-fun tp!15367 () Bool)

(declare-fun b_and!10657 () Bool)

(assert (=> b!172026 (= tp!15367 b_and!10657)))

(declare-fun e!113534 () Bool)

(declare-fun e!113531 () Bool)

(declare-fun tp_is_empty!4015 () Bool)

(declare-datatypes ((V!5001 0))(
  ( (V!5002 (val!2052 Int)) )
))
(declare-datatypes ((ValueCell!1664 0))(
  ( (ValueCellFull!1664 (v!3914 V!5001)) (EmptyCell!1664) )
))
(declare-datatypes ((array!7127 0))(
  ( (array!7128 (arr!3388 (Array (_ BitVec 32) (_ BitVec 64))) (size!3684 (_ BitVec 32))) )
))
(declare-datatypes ((array!7129 0))(
  ( (array!7130 (arr!3389 (Array (_ BitVec 32) ValueCell!1664)) (size!3685 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2236 0))(
  ( (LongMapFixedSize!2237 (defaultEntry!3564 Int) (mask!8400 (_ BitVec 32)) (extraKeys!3303 (_ BitVec 32)) (zeroValue!3405 V!5001) (minValue!3407 V!5001) (_size!1167 (_ BitVec 32)) (_keys!5398 array!7127) (_values!3547 array!7129) (_vacant!1167 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2236)

(declare-fun array_inv!2185 (array!7127) Bool)

(declare-fun array_inv!2186 (array!7129) Bool)

(assert (=> b!172026 (= e!113534 (and tp!15367 tp_is_empty!4015 (array_inv!2185 (_keys!5398 thiss!1248)) (array_inv!2186 (_values!3547 thiss!1248)) e!113531))))

(declare-fun res!81661 () Bool)

(declare-fun e!113532 () Bool)

(assert (=> start!17128 (=> (not res!81661) (not e!113532))))

(declare-fun valid!970 (LongMapFixedSize!2236) Bool)

(assert (=> start!17128 (= res!81661 (valid!970 thiss!1248))))

(assert (=> start!17128 e!113532))

(assert (=> start!17128 e!113534))

(assert (=> start!17128 true))

(declare-fun b!172027 () Bool)

(declare-fun res!81659 () Bool)

(assert (=> b!172027 (=> (not res!81659) (not e!113532))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!172027 (= res!81659 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!172028 () Bool)

(declare-fun res!81660 () Bool)

(assert (=> b!172028 (=> (not res!81660) (not e!113532))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!172028 (= res!81660 (validMask!0 (mask!8400 thiss!1248)))))

(declare-fun mapIsEmpty!6824 () Bool)

(declare-fun mapRes!6824 () Bool)

(assert (=> mapIsEmpty!6824 mapRes!6824))

(declare-fun b!172029 () Bool)

(declare-fun e!113533 () Bool)

(assert (=> b!172029 (= e!113533 tp_is_empty!4015)))

(declare-fun b!172030 () Bool)

(assert (=> b!172030 (= e!113531 (and e!113533 mapRes!6824))))

(declare-fun condMapEmpty!6824 () Bool)

(declare-fun mapDefault!6824 () ValueCell!1664)

(assert (=> b!172030 (= condMapEmpty!6824 (= (arr!3389 (_values!3547 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1664)) mapDefault!6824)))))

(declare-fun b!172031 () Bool)

(assert (=> b!172031 (= e!113532 (not (= (size!3685 (_values!3547 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8400 thiss!1248)))))))

(declare-fun b!172032 () Bool)

(declare-fun e!113535 () Bool)

(assert (=> b!172032 (= e!113535 tp_is_empty!4015)))

(declare-fun mapNonEmpty!6824 () Bool)

(declare-fun tp!15368 () Bool)

(assert (=> mapNonEmpty!6824 (= mapRes!6824 (and tp!15368 e!113535))))

(declare-fun mapRest!6824 () (Array (_ BitVec 32) ValueCell!1664))

(declare-fun mapValue!6824 () ValueCell!1664)

(declare-fun mapKey!6824 () (_ BitVec 32))

(assert (=> mapNonEmpty!6824 (= (arr!3389 (_values!3547 thiss!1248)) (store mapRest!6824 mapKey!6824 mapValue!6824))))

(assert (= (and start!17128 res!81661) b!172027))

(assert (= (and b!172027 res!81659) b!172028))

(assert (= (and b!172028 res!81660) b!172031))

(assert (= (and b!172030 condMapEmpty!6824) mapIsEmpty!6824))

(assert (= (and b!172030 (not condMapEmpty!6824)) mapNonEmpty!6824))

(get-info :version)

(assert (= (and mapNonEmpty!6824 ((_ is ValueCellFull!1664) mapValue!6824)) b!172032))

(assert (= (and b!172030 ((_ is ValueCellFull!1664) mapDefault!6824)) b!172029))

(assert (= b!172026 b!172030))

(assert (= start!17128 b!172026))

(declare-fun m!200485 () Bool)

(assert (=> b!172026 m!200485))

(declare-fun m!200487 () Bool)

(assert (=> b!172026 m!200487))

(declare-fun m!200489 () Bool)

(assert (=> start!17128 m!200489))

(declare-fun m!200491 () Bool)

(assert (=> b!172028 m!200491))

(declare-fun m!200493 () Bool)

(assert (=> mapNonEmpty!6824 m!200493))

(check-sat (not b!172028) (not mapNonEmpty!6824) (not b_next!4243) tp_is_empty!4015 (not start!17128) (not b!172026) b_and!10657)
(check-sat b_and!10657 (not b_next!4243))
(get-model)

(declare-fun d!52325 () Bool)

(assert (=> d!52325 (= (array_inv!2185 (_keys!5398 thiss!1248)) (bvsge (size!3684 (_keys!5398 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!172026 d!52325))

(declare-fun d!52327 () Bool)

(assert (=> d!52327 (= (array_inv!2186 (_values!3547 thiss!1248)) (bvsge (size!3685 (_values!3547 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!172026 d!52327))

(declare-fun d!52329 () Bool)

(assert (=> d!52329 (= (validMask!0 (mask!8400 thiss!1248)) (and (or (= (mask!8400 thiss!1248) #b00000000000000000000000000000111) (= (mask!8400 thiss!1248) #b00000000000000000000000000001111) (= (mask!8400 thiss!1248) #b00000000000000000000000000011111) (= (mask!8400 thiss!1248) #b00000000000000000000000000111111) (= (mask!8400 thiss!1248) #b00000000000000000000000001111111) (= (mask!8400 thiss!1248) #b00000000000000000000000011111111) (= (mask!8400 thiss!1248) #b00000000000000000000000111111111) (= (mask!8400 thiss!1248) #b00000000000000000000001111111111) (= (mask!8400 thiss!1248) #b00000000000000000000011111111111) (= (mask!8400 thiss!1248) #b00000000000000000000111111111111) (= (mask!8400 thiss!1248) #b00000000000000000001111111111111) (= (mask!8400 thiss!1248) #b00000000000000000011111111111111) (= (mask!8400 thiss!1248) #b00000000000000000111111111111111) (= (mask!8400 thiss!1248) #b00000000000000001111111111111111) (= (mask!8400 thiss!1248) #b00000000000000011111111111111111) (= (mask!8400 thiss!1248) #b00000000000000111111111111111111) (= (mask!8400 thiss!1248) #b00000000000001111111111111111111) (= (mask!8400 thiss!1248) #b00000000000011111111111111111111) (= (mask!8400 thiss!1248) #b00000000000111111111111111111111) (= (mask!8400 thiss!1248) #b00000000001111111111111111111111) (= (mask!8400 thiss!1248) #b00000000011111111111111111111111) (= (mask!8400 thiss!1248) #b00000000111111111111111111111111) (= (mask!8400 thiss!1248) #b00000001111111111111111111111111) (= (mask!8400 thiss!1248) #b00000011111111111111111111111111) (= (mask!8400 thiss!1248) #b00000111111111111111111111111111) (= (mask!8400 thiss!1248) #b00001111111111111111111111111111) (= (mask!8400 thiss!1248) #b00011111111111111111111111111111) (= (mask!8400 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8400 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!172028 d!52329))

(declare-fun d!52331 () Bool)

(declare-fun res!81686 () Bool)

(declare-fun e!113575 () Bool)

(assert (=> d!52331 (=> (not res!81686) (not e!113575))))

(declare-fun simpleValid!137 (LongMapFixedSize!2236) Bool)

(assert (=> d!52331 (= res!81686 (simpleValid!137 thiss!1248))))

(assert (=> d!52331 (= (valid!970 thiss!1248) e!113575)))

(declare-fun b!172081 () Bool)

(declare-fun res!81687 () Bool)

(assert (=> b!172081 (=> (not res!81687) (not e!113575))))

(declare-fun arrayCountValidKeys!0 (array!7127 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!172081 (= res!81687 (= (arrayCountValidKeys!0 (_keys!5398 thiss!1248) #b00000000000000000000000000000000 (size!3684 (_keys!5398 thiss!1248))) (_size!1167 thiss!1248)))))

(declare-fun b!172082 () Bool)

(declare-fun res!81688 () Bool)

(assert (=> b!172082 (=> (not res!81688) (not e!113575))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7127 (_ BitVec 32)) Bool)

(assert (=> b!172082 (= res!81688 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5398 thiss!1248) (mask!8400 thiss!1248)))))

(declare-fun b!172083 () Bool)

(declare-datatypes ((List!2207 0))(
  ( (Nil!2204) (Cons!2203 (h!2820 (_ BitVec 64)) (t!7005 List!2207)) )
))
(declare-fun arrayNoDuplicates!0 (array!7127 (_ BitVec 32) List!2207) Bool)

(assert (=> b!172083 (= e!113575 (arrayNoDuplicates!0 (_keys!5398 thiss!1248) #b00000000000000000000000000000000 Nil!2204))))

(assert (= (and d!52331 res!81686) b!172081))

(assert (= (and b!172081 res!81687) b!172082))

(assert (= (and b!172082 res!81688) b!172083))

(declare-fun m!200515 () Bool)

(assert (=> d!52331 m!200515))

(declare-fun m!200517 () Bool)

(assert (=> b!172081 m!200517))

(declare-fun m!200519 () Bool)

(assert (=> b!172082 m!200519))

(declare-fun m!200521 () Bool)

(assert (=> b!172083 m!200521))

(assert (=> start!17128 d!52331))

(declare-fun mapIsEmpty!6833 () Bool)

(declare-fun mapRes!6833 () Bool)

(assert (=> mapIsEmpty!6833 mapRes!6833))

(declare-fun b!172091 () Bool)

(declare-fun e!113581 () Bool)

(assert (=> b!172091 (= e!113581 tp_is_empty!4015)))

(declare-fun mapNonEmpty!6833 () Bool)

(declare-fun tp!15383 () Bool)

(declare-fun e!113580 () Bool)

(assert (=> mapNonEmpty!6833 (= mapRes!6833 (and tp!15383 e!113580))))

(declare-fun mapKey!6833 () (_ BitVec 32))

(declare-fun mapRest!6833 () (Array (_ BitVec 32) ValueCell!1664))

(declare-fun mapValue!6833 () ValueCell!1664)

(assert (=> mapNonEmpty!6833 (= mapRest!6824 (store mapRest!6833 mapKey!6833 mapValue!6833))))

(declare-fun b!172090 () Bool)

(assert (=> b!172090 (= e!113580 tp_is_empty!4015)))

(declare-fun condMapEmpty!6833 () Bool)

(declare-fun mapDefault!6833 () ValueCell!1664)

(assert (=> mapNonEmpty!6824 (= condMapEmpty!6833 (= mapRest!6824 ((as const (Array (_ BitVec 32) ValueCell!1664)) mapDefault!6833)))))

(assert (=> mapNonEmpty!6824 (= tp!15368 (and e!113581 mapRes!6833))))

(assert (= (and mapNonEmpty!6824 condMapEmpty!6833) mapIsEmpty!6833))

(assert (= (and mapNonEmpty!6824 (not condMapEmpty!6833)) mapNonEmpty!6833))

(assert (= (and mapNonEmpty!6833 ((_ is ValueCellFull!1664) mapValue!6833)) b!172090))

(assert (= (and mapNonEmpty!6824 ((_ is ValueCellFull!1664) mapDefault!6833)) b!172091))

(declare-fun m!200523 () Bool)

(assert (=> mapNonEmpty!6833 m!200523))

(check-sat (not b!172082) b_and!10657 (not b_next!4243) (not mapNonEmpty!6833) (not d!52331) (not b!172081) tp_is_empty!4015 (not b!172083))
(check-sat b_and!10657 (not b_next!4243))
(get-model)

(declare-fun b!172100 () Bool)

(declare-fun e!113587 () (_ BitVec 32))

(declare-fun call!17491 () (_ BitVec 32))

(assert (=> b!172100 (= e!113587 call!17491)))

(declare-fun d!52333 () Bool)

(declare-fun lt!85467 () (_ BitVec 32))

(assert (=> d!52333 (and (bvsge lt!85467 #b00000000000000000000000000000000) (bvsle lt!85467 (bvsub (size!3684 (_keys!5398 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!113586 () (_ BitVec 32))

(assert (=> d!52333 (= lt!85467 e!113586)))

(declare-fun c!30819 () Bool)

(assert (=> d!52333 (= c!30819 (bvsge #b00000000000000000000000000000000 (size!3684 (_keys!5398 thiss!1248))))))

(assert (=> d!52333 (and (bvsle #b00000000000000000000000000000000 (size!3684 (_keys!5398 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3684 (_keys!5398 thiss!1248)) (size!3684 (_keys!5398 thiss!1248))))))

(assert (=> d!52333 (= (arrayCountValidKeys!0 (_keys!5398 thiss!1248) #b00000000000000000000000000000000 (size!3684 (_keys!5398 thiss!1248))) lt!85467)))

(declare-fun b!172101 () Bool)

(assert (=> b!172101 (= e!113587 (bvadd #b00000000000000000000000000000001 call!17491))))

(declare-fun b!172102 () Bool)

(assert (=> b!172102 (= e!113586 e!113587)))

(declare-fun c!30818 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!172102 (= c!30818 (validKeyInArray!0 (select (arr!3388 (_keys!5398 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17488 () Bool)

(assert (=> bm!17488 (= call!17491 (arrayCountValidKeys!0 (_keys!5398 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3684 (_keys!5398 thiss!1248))))))

(declare-fun b!172103 () Bool)

(assert (=> b!172103 (= e!113586 #b00000000000000000000000000000000)))

(assert (= (and d!52333 c!30819) b!172103))

(assert (= (and d!52333 (not c!30819)) b!172102))

(assert (= (and b!172102 c!30818) b!172101))

(assert (= (and b!172102 (not c!30818)) b!172100))

(assert (= (or b!172101 b!172100) bm!17488))

(declare-fun m!200525 () Bool)

(assert (=> b!172102 m!200525))

(assert (=> b!172102 m!200525))

(declare-fun m!200527 () Bool)

(assert (=> b!172102 m!200527))

(declare-fun m!200529 () Bool)

(assert (=> bm!17488 m!200529))

(assert (=> b!172081 d!52333))

(declare-fun b!172112 () Bool)

(declare-fun e!113595 () Bool)

(declare-fun e!113594 () Bool)

(assert (=> b!172112 (= e!113595 e!113594)))

(declare-fun c!30822 () Bool)

(assert (=> b!172112 (= c!30822 (validKeyInArray!0 (select (arr!3388 (_keys!5398 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17491 () Bool)

(declare-fun call!17494 () Bool)

(assert (=> bm!17491 (= call!17494 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5398 thiss!1248) (mask!8400 thiss!1248)))))

(declare-fun b!172113 () Bool)

(declare-fun e!113596 () Bool)

(assert (=> b!172113 (= e!113594 e!113596)))

(declare-fun lt!85475 () (_ BitVec 64))

(assert (=> b!172113 (= lt!85475 (select (arr!3388 (_keys!5398 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5279 0))(
  ( (Unit!5280) )
))
(declare-fun lt!85474 () Unit!5279)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7127 (_ BitVec 64) (_ BitVec 32)) Unit!5279)

(assert (=> b!172113 (= lt!85474 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5398 thiss!1248) lt!85475 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7127 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!172113 (arrayContainsKey!0 (_keys!5398 thiss!1248) lt!85475 #b00000000000000000000000000000000)))

(declare-fun lt!85476 () Unit!5279)

(assert (=> b!172113 (= lt!85476 lt!85474)))

(declare-fun res!81693 () Bool)

(declare-datatypes ((SeekEntryResult!547 0))(
  ( (MissingZero!547 (index!4356 (_ BitVec 32))) (Found!547 (index!4357 (_ BitVec 32))) (Intermediate!547 (undefined!1359 Bool) (index!4358 (_ BitVec 32)) (x!19023 (_ BitVec 32))) (Undefined!547) (MissingVacant!547 (index!4359 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7127 (_ BitVec 32)) SeekEntryResult!547)

(assert (=> b!172113 (= res!81693 (= (seekEntryOrOpen!0 (select (arr!3388 (_keys!5398 thiss!1248)) #b00000000000000000000000000000000) (_keys!5398 thiss!1248) (mask!8400 thiss!1248)) (Found!547 #b00000000000000000000000000000000)))))

(assert (=> b!172113 (=> (not res!81693) (not e!113596))))

(declare-fun d!52335 () Bool)

(declare-fun res!81694 () Bool)

(assert (=> d!52335 (=> res!81694 e!113595)))

(assert (=> d!52335 (= res!81694 (bvsge #b00000000000000000000000000000000 (size!3684 (_keys!5398 thiss!1248))))))

(assert (=> d!52335 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5398 thiss!1248) (mask!8400 thiss!1248)) e!113595)))

(declare-fun b!172114 () Bool)

(assert (=> b!172114 (= e!113596 call!17494)))

(declare-fun b!172115 () Bool)

(assert (=> b!172115 (= e!113594 call!17494)))

(assert (= (and d!52335 (not res!81694)) b!172112))

(assert (= (and b!172112 c!30822) b!172113))

(assert (= (and b!172112 (not c!30822)) b!172115))

(assert (= (and b!172113 res!81693) b!172114))

(assert (= (or b!172114 b!172115) bm!17491))

(assert (=> b!172112 m!200525))

(assert (=> b!172112 m!200525))

(assert (=> b!172112 m!200527))

(declare-fun m!200531 () Bool)

(assert (=> bm!17491 m!200531))

(assert (=> b!172113 m!200525))

(declare-fun m!200533 () Bool)

(assert (=> b!172113 m!200533))

(declare-fun m!200535 () Bool)

(assert (=> b!172113 m!200535))

(assert (=> b!172113 m!200525))

(declare-fun m!200537 () Bool)

(assert (=> b!172113 m!200537))

(assert (=> b!172082 d!52335))

(declare-fun b!172126 () Bool)

(declare-fun e!113608 () Bool)

(declare-fun contains!1147 (List!2207 (_ BitVec 64)) Bool)

(assert (=> b!172126 (= e!113608 (contains!1147 Nil!2204 (select (arr!3388 (_keys!5398 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!172127 () Bool)

(declare-fun e!113606 () Bool)

(declare-fun call!17497 () Bool)

(assert (=> b!172127 (= e!113606 call!17497)))

(declare-fun bm!17494 () Bool)

(declare-fun c!30825 () Bool)

(assert (=> bm!17494 (= call!17497 (arrayNoDuplicates!0 (_keys!5398 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30825 (Cons!2203 (select (arr!3388 (_keys!5398 thiss!1248)) #b00000000000000000000000000000000) Nil!2204) Nil!2204)))))

(declare-fun d!52337 () Bool)

(declare-fun res!81702 () Bool)

(declare-fun e!113607 () Bool)

(assert (=> d!52337 (=> res!81702 e!113607)))

(assert (=> d!52337 (= res!81702 (bvsge #b00000000000000000000000000000000 (size!3684 (_keys!5398 thiss!1248))))))

(assert (=> d!52337 (= (arrayNoDuplicates!0 (_keys!5398 thiss!1248) #b00000000000000000000000000000000 Nil!2204) e!113607)))

(declare-fun b!172128 () Bool)

(declare-fun e!113605 () Bool)

(assert (=> b!172128 (= e!113605 e!113606)))

(assert (=> b!172128 (= c!30825 (validKeyInArray!0 (select (arr!3388 (_keys!5398 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!172129 () Bool)

(assert (=> b!172129 (= e!113607 e!113605)))

(declare-fun res!81701 () Bool)

(assert (=> b!172129 (=> (not res!81701) (not e!113605))))

(assert (=> b!172129 (= res!81701 (not e!113608))))

(declare-fun res!81703 () Bool)

(assert (=> b!172129 (=> (not res!81703) (not e!113608))))

(assert (=> b!172129 (= res!81703 (validKeyInArray!0 (select (arr!3388 (_keys!5398 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!172130 () Bool)

(assert (=> b!172130 (= e!113606 call!17497)))

(assert (= (and d!52337 (not res!81702)) b!172129))

(assert (= (and b!172129 res!81703) b!172126))

(assert (= (and b!172129 res!81701) b!172128))

(assert (= (and b!172128 c!30825) b!172130))

(assert (= (and b!172128 (not c!30825)) b!172127))

(assert (= (or b!172130 b!172127) bm!17494))

(assert (=> b!172126 m!200525))

(assert (=> b!172126 m!200525))

(declare-fun m!200539 () Bool)

(assert (=> b!172126 m!200539))

(assert (=> bm!17494 m!200525))

(declare-fun m!200541 () Bool)

(assert (=> bm!17494 m!200541))

(assert (=> b!172128 m!200525))

(assert (=> b!172128 m!200525))

(assert (=> b!172128 m!200527))

(assert (=> b!172129 m!200525))

(assert (=> b!172129 m!200525))

(assert (=> b!172129 m!200527))

(assert (=> b!172083 d!52337))

(declare-fun d!52339 () Bool)

(declare-fun res!81713 () Bool)

(declare-fun e!113611 () Bool)

(assert (=> d!52339 (=> (not res!81713) (not e!113611))))

(assert (=> d!52339 (= res!81713 (validMask!0 (mask!8400 thiss!1248)))))

(assert (=> d!52339 (= (simpleValid!137 thiss!1248) e!113611)))

(declare-fun b!172141 () Bool)

(declare-fun res!81712 () Bool)

(assert (=> b!172141 (=> (not res!81712) (not e!113611))))

(declare-fun size!3690 (LongMapFixedSize!2236) (_ BitVec 32))

(assert (=> b!172141 (= res!81712 (= (size!3690 thiss!1248) (bvadd (_size!1167 thiss!1248) (bvsdiv (bvadd (extraKeys!3303 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!172139 () Bool)

(declare-fun res!81714 () Bool)

(assert (=> b!172139 (=> (not res!81714) (not e!113611))))

(assert (=> b!172139 (= res!81714 (and (= (size!3685 (_values!3547 thiss!1248)) (bvadd (mask!8400 thiss!1248) #b00000000000000000000000000000001)) (= (size!3684 (_keys!5398 thiss!1248)) (size!3685 (_values!3547 thiss!1248))) (bvsge (_size!1167 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1167 thiss!1248) (bvadd (mask!8400 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!172142 () Bool)

(assert (=> b!172142 (= e!113611 (and (bvsge (extraKeys!3303 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3303 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1167 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!172140 () Bool)

(declare-fun res!81715 () Bool)

(assert (=> b!172140 (=> (not res!81715) (not e!113611))))

(assert (=> b!172140 (= res!81715 (bvsge (size!3690 thiss!1248) (_size!1167 thiss!1248)))))

(assert (= (and d!52339 res!81713) b!172139))

(assert (= (and b!172139 res!81714) b!172140))

(assert (= (and b!172140 res!81715) b!172141))

(assert (= (and b!172141 res!81712) b!172142))

(assert (=> d!52339 m!200491))

(declare-fun m!200543 () Bool)

(assert (=> b!172141 m!200543))

(assert (=> b!172140 m!200543))

(assert (=> d!52331 d!52339))

(declare-fun mapIsEmpty!6834 () Bool)

(declare-fun mapRes!6834 () Bool)

(assert (=> mapIsEmpty!6834 mapRes!6834))

(declare-fun b!172144 () Bool)

(declare-fun e!113613 () Bool)

(assert (=> b!172144 (= e!113613 tp_is_empty!4015)))

(declare-fun mapNonEmpty!6834 () Bool)

(declare-fun tp!15384 () Bool)

(declare-fun e!113612 () Bool)

(assert (=> mapNonEmpty!6834 (= mapRes!6834 (and tp!15384 e!113612))))

(declare-fun mapValue!6834 () ValueCell!1664)

(declare-fun mapKey!6834 () (_ BitVec 32))

(declare-fun mapRest!6834 () (Array (_ BitVec 32) ValueCell!1664))

(assert (=> mapNonEmpty!6834 (= mapRest!6833 (store mapRest!6834 mapKey!6834 mapValue!6834))))

(declare-fun b!172143 () Bool)

(assert (=> b!172143 (= e!113612 tp_is_empty!4015)))

(declare-fun condMapEmpty!6834 () Bool)

(declare-fun mapDefault!6834 () ValueCell!1664)

(assert (=> mapNonEmpty!6833 (= condMapEmpty!6834 (= mapRest!6833 ((as const (Array (_ BitVec 32) ValueCell!1664)) mapDefault!6834)))))

(assert (=> mapNonEmpty!6833 (= tp!15383 (and e!113613 mapRes!6834))))

(assert (= (and mapNonEmpty!6833 condMapEmpty!6834) mapIsEmpty!6834))

(assert (= (and mapNonEmpty!6833 (not condMapEmpty!6834)) mapNonEmpty!6834))

(assert (= (and mapNonEmpty!6834 ((_ is ValueCellFull!1664) mapValue!6834)) b!172143))

(assert (= (and mapNonEmpty!6833 ((_ is ValueCellFull!1664) mapDefault!6834)) b!172144))

(declare-fun m!200545 () Bool)

(assert (=> mapNonEmpty!6834 m!200545))

(check-sat (not b!172102) (not mapNonEmpty!6834) b_and!10657 (not b!172113) (not b!172140) (not b!172126) (not b!172129) (not b_next!4243) (not bm!17494) (not bm!17488) tp_is_empty!4015 (not b!172141) (not bm!17491) (not b!172112) (not b!172128) (not d!52339))
(check-sat b_and!10657 (not b_next!4243))

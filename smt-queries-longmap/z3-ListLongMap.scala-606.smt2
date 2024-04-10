; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15804 () Bool)

(assert start!15804)

(declare-fun b!157557 () Bool)

(declare-fun b_free!3447 () Bool)

(declare-fun b_next!3447 () Bool)

(assert (=> b!157557 (= b_free!3447 (not b_next!3447))))

(declare-fun tp!12872 () Bool)

(declare-fun b_and!9861 () Bool)

(assert (=> b!157557 (= tp!12872 b_and!9861)))

(declare-fun b!157556 () Bool)

(declare-fun e!103185 () Bool)

(declare-fun tp_is_empty!3249 () Bool)

(assert (=> b!157556 (= e!103185 tp_is_empty!3249)))

(declare-fun e!103182 () Bool)

(declare-datatypes ((V!3979 0))(
  ( (V!3980 (val!1669 Int)) )
))
(declare-datatypes ((ValueCell!1281 0))(
  ( (ValueCellFull!1281 (v!3534 V!3979)) (EmptyCell!1281) )
))
(declare-datatypes ((array!5555 0))(
  ( (array!5556 (arr!2633 (Array (_ BitVec 32) (_ BitVec 64))) (size!2912 (_ BitVec 32))) )
))
(declare-datatypes ((array!5557 0))(
  ( (array!5558 (arr!2634 (Array (_ BitVec 32) ValueCell!1281)) (size!2913 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1470 0))(
  ( (LongMapFixedSize!1471 (defaultEntry!3177 Int) (mask!7661 (_ BitVec 32)) (extraKeys!2918 (_ BitVec 32)) (zeroValue!3020 V!3979) (minValue!3020 V!3979) (_size!784 (_ BitVec 32)) (_keys!4953 array!5555) (_values!3160 array!5557) (_vacant!784 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1470)

(declare-fun e!103184 () Bool)

(declare-fun array_inv!1671 (array!5555) Bool)

(declare-fun array_inv!1672 (array!5557) Bool)

(assert (=> b!157557 (= e!103184 (and tp!12872 tp_is_empty!3249 (array_inv!1671 (_keys!4953 thiss!1248)) (array_inv!1672 (_values!3160 thiss!1248)) e!103182))))

(declare-fun mapIsEmpty!5523 () Bool)

(declare-fun mapRes!5523 () Bool)

(assert (=> mapIsEmpty!5523 mapRes!5523))

(declare-fun b!157559 () Bool)

(declare-fun e!103183 () Bool)

(assert (=> b!157559 (= e!103183 (and (bvsge (mask!7661 thiss!1248) #b00000000000000000000000000000000) (not (= (size!2912 (_keys!4953 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7661 thiss!1248))))))))

(declare-fun mapNonEmpty!5523 () Bool)

(declare-fun tp!12873 () Bool)

(assert (=> mapNonEmpty!5523 (= mapRes!5523 (and tp!12873 e!103185))))

(declare-fun mapValue!5523 () ValueCell!1281)

(declare-fun mapRest!5523 () (Array (_ BitVec 32) ValueCell!1281))

(declare-fun mapKey!5523 () (_ BitVec 32))

(assert (=> mapNonEmpty!5523 (= (arr!2634 (_values!3160 thiss!1248)) (store mapRest!5523 mapKey!5523 mapValue!5523))))

(declare-fun b!157560 () Bool)

(declare-fun res!74457 () Bool)

(assert (=> b!157560 (=> (not res!74457) (not e!103183))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!157560 (= res!74457 (not (= key!828 (bvneg key!828))))))

(declare-fun res!74456 () Bool)

(assert (=> start!15804 (=> (not res!74456) (not e!103183))))

(declare-fun valid!697 (LongMapFixedSize!1470) Bool)

(assert (=> start!15804 (= res!74456 (valid!697 thiss!1248))))

(assert (=> start!15804 e!103183))

(assert (=> start!15804 e!103184))

(assert (=> start!15804 true))

(declare-fun b!157558 () Bool)

(declare-fun res!74458 () Bool)

(assert (=> b!157558 (=> (not res!74458) (not e!103183))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!157558 (= res!74458 (validMask!0 (mask!7661 thiss!1248)))))

(declare-fun b!157561 () Bool)

(declare-fun e!103186 () Bool)

(assert (=> b!157561 (= e!103186 tp_is_empty!3249)))

(declare-fun b!157562 () Bool)

(assert (=> b!157562 (= e!103182 (and e!103186 mapRes!5523))))

(declare-fun condMapEmpty!5523 () Bool)

(declare-fun mapDefault!5523 () ValueCell!1281)

(assert (=> b!157562 (= condMapEmpty!5523 (= (arr!2634 (_values!3160 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1281)) mapDefault!5523)))))

(assert (= (and start!15804 res!74456) b!157560))

(assert (= (and b!157560 res!74457) b!157558))

(assert (= (and b!157558 res!74458) b!157559))

(assert (= (and b!157562 condMapEmpty!5523) mapIsEmpty!5523))

(assert (= (and b!157562 (not condMapEmpty!5523)) mapNonEmpty!5523))

(get-info :version)

(assert (= (and mapNonEmpty!5523 ((_ is ValueCellFull!1281) mapValue!5523)) b!157556))

(assert (= (and b!157562 ((_ is ValueCellFull!1281) mapDefault!5523)) b!157561))

(assert (= b!157557 b!157562))

(assert (= start!15804 b!157557))

(declare-fun m!190723 () Bool)

(assert (=> b!157557 m!190723))

(declare-fun m!190725 () Bool)

(assert (=> b!157557 m!190725))

(declare-fun m!190727 () Bool)

(assert (=> mapNonEmpty!5523 m!190727))

(declare-fun m!190729 () Bool)

(assert (=> start!15804 m!190729))

(declare-fun m!190731 () Bool)

(assert (=> b!157558 m!190731))

(check-sat (not mapNonEmpty!5523) (not b!157557) b_and!9861 tp_is_empty!3249 (not start!15804) (not b!157558) (not b_next!3447))
(check-sat b_and!9861 (not b_next!3447))
(get-model)

(declare-fun d!51067 () Bool)

(assert (=> d!51067 (= (array_inv!1671 (_keys!4953 thiss!1248)) (bvsge (size!2912 (_keys!4953 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!157557 d!51067))

(declare-fun d!51069 () Bool)

(assert (=> d!51069 (= (array_inv!1672 (_values!3160 thiss!1248)) (bvsge (size!2913 (_values!3160 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!157557 d!51069))

(declare-fun d!51071 () Bool)

(assert (=> d!51071 (= (validMask!0 (mask!7661 thiss!1248)) (and (or (= (mask!7661 thiss!1248) #b00000000000000000000000000000111) (= (mask!7661 thiss!1248) #b00000000000000000000000000001111) (= (mask!7661 thiss!1248) #b00000000000000000000000000011111) (= (mask!7661 thiss!1248) #b00000000000000000000000000111111) (= (mask!7661 thiss!1248) #b00000000000000000000000001111111) (= (mask!7661 thiss!1248) #b00000000000000000000000011111111) (= (mask!7661 thiss!1248) #b00000000000000000000000111111111) (= (mask!7661 thiss!1248) #b00000000000000000000001111111111) (= (mask!7661 thiss!1248) #b00000000000000000000011111111111) (= (mask!7661 thiss!1248) #b00000000000000000000111111111111) (= (mask!7661 thiss!1248) #b00000000000000000001111111111111) (= (mask!7661 thiss!1248) #b00000000000000000011111111111111) (= (mask!7661 thiss!1248) #b00000000000000000111111111111111) (= (mask!7661 thiss!1248) #b00000000000000001111111111111111) (= (mask!7661 thiss!1248) #b00000000000000011111111111111111) (= (mask!7661 thiss!1248) #b00000000000000111111111111111111) (= (mask!7661 thiss!1248) #b00000000000001111111111111111111) (= (mask!7661 thiss!1248) #b00000000000011111111111111111111) (= (mask!7661 thiss!1248) #b00000000000111111111111111111111) (= (mask!7661 thiss!1248) #b00000000001111111111111111111111) (= (mask!7661 thiss!1248) #b00000000011111111111111111111111) (= (mask!7661 thiss!1248) #b00000000111111111111111111111111) (= (mask!7661 thiss!1248) #b00000001111111111111111111111111) (= (mask!7661 thiss!1248) #b00000011111111111111111111111111) (= (mask!7661 thiss!1248) #b00000111111111111111111111111111) (= (mask!7661 thiss!1248) #b00001111111111111111111111111111) (= (mask!7661 thiss!1248) #b00011111111111111111111111111111) (= (mask!7661 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7661 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!157558 d!51071))

(declare-fun d!51073 () Bool)

(declare-fun res!74474 () Bool)

(declare-fun e!103208 () Bool)

(assert (=> d!51073 (=> (not res!74474) (not e!103208))))

(declare-fun simpleValid!107 (LongMapFixedSize!1470) Bool)

(assert (=> d!51073 (= res!74474 (simpleValid!107 thiss!1248))))

(assert (=> d!51073 (= (valid!697 thiss!1248) e!103208)))

(declare-fun b!157590 () Bool)

(declare-fun res!74475 () Bool)

(assert (=> b!157590 (=> (not res!74475) (not e!103208))))

(declare-fun arrayCountValidKeys!0 (array!5555 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!157590 (= res!74475 (= (arrayCountValidKeys!0 (_keys!4953 thiss!1248) #b00000000000000000000000000000000 (size!2912 (_keys!4953 thiss!1248))) (_size!784 thiss!1248)))))

(declare-fun b!157591 () Bool)

(declare-fun res!74476 () Bool)

(assert (=> b!157591 (=> (not res!74476) (not e!103208))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5555 (_ BitVec 32)) Bool)

(assert (=> b!157591 (= res!74476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4953 thiss!1248) (mask!7661 thiss!1248)))))

(declare-fun b!157592 () Bool)

(declare-datatypes ((List!1884 0))(
  ( (Nil!1881) (Cons!1880 (h!2489 (_ BitVec 64)) (t!6686 List!1884)) )
))
(declare-fun arrayNoDuplicates!0 (array!5555 (_ BitVec 32) List!1884) Bool)

(assert (=> b!157592 (= e!103208 (arrayNoDuplicates!0 (_keys!4953 thiss!1248) #b00000000000000000000000000000000 Nil!1881))))

(assert (= (and d!51073 res!74474) b!157590))

(assert (= (and b!157590 res!74475) b!157591))

(assert (= (and b!157591 res!74476) b!157592))

(declare-fun m!190743 () Bool)

(assert (=> d!51073 m!190743))

(declare-fun m!190745 () Bool)

(assert (=> b!157590 m!190745))

(declare-fun m!190747 () Bool)

(assert (=> b!157591 m!190747))

(declare-fun m!190749 () Bool)

(assert (=> b!157592 m!190749))

(assert (=> start!15804 d!51073))

(declare-fun condMapEmpty!5529 () Bool)

(declare-fun mapDefault!5529 () ValueCell!1281)

(assert (=> mapNonEmpty!5523 (= condMapEmpty!5529 (= mapRest!5523 ((as const (Array (_ BitVec 32) ValueCell!1281)) mapDefault!5529)))))

(declare-fun e!103213 () Bool)

(declare-fun mapRes!5529 () Bool)

(assert (=> mapNonEmpty!5523 (= tp!12873 (and e!103213 mapRes!5529))))

(declare-fun b!157599 () Bool)

(declare-fun e!103214 () Bool)

(assert (=> b!157599 (= e!103214 tp_is_empty!3249)))

(declare-fun mapNonEmpty!5529 () Bool)

(declare-fun tp!12882 () Bool)

(assert (=> mapNonEmpty!5529 (= mapRes!5529 (and tp!12882 e!103214))))

(declare-fun mapValue!5529 () ValueCell!1281)

(declare-fun mapRest!5529 () (Array (_ BitVec 32) ValueCell!1281))

(declare-fun mapKey!5529 () (_ BitVec 32))

(assert (=> mapNonEmpty!5529 (= mapRest!5523 (store mapRest!5529 mapKey!5529 mapValue!5529))))

(declare-fun b!157600 () Bool)

(assert (=> b!157600 (= e!103213 tp_is_empty!3249)))

(declare-fun mapIsEmpty!5529 () Bool)

(assert (=> mapIsEmpty!5529 mapRes!5529))

(assert (= (and mapNonEmpty!5523 condMapEmpty!5529) mapIsEmpty!5529))

(assert (= (and mapNonEmpty!5523 (not condMapEmpty!5529)) mapNonEmpty!5529))

(assert (= (and mapNonEmpty!5529 ((_ is ValueCellFull!1281) mapValue!5529)) b!157599))

(assert (= (and mapNonEmpty!5523 ((_ is ValueCellFull!1281) mapDefault!5529)) b!157600))

(declare-fun m!190751 () Bool)

(assert (=> mapNonEmpty!5529 m!190751))

(check-sat (not b!157592) (not b!157590) b_and!9861 (not b!157591) tp_is_empty!3249 (not d!51073) (not mapNonEmpty!5529) (not b_next!3447))
(check-sat b_and!9861 (not b_next!3447))
(get-model)

(declare-fun b!157609 () Bool)

(declare-fun e!103220 () (_ BitVec 32))

(declare-fun e!103219 () (_ BitVec 32))

(assert (=> b!157609 (= e!103220 e!103219)))

(declare-fun c!29710 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!157609 (= c!29710 (validKeyInArray!0 (select (arr!2633 (_keys!4953 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!157610 () Bool)

(assert (=> b!157610 (= e!103220 #b00000000000000000000000000000000)))

(declare-fun b!157611 () Bool)

(declare-fun call!17227 () (_ BitVec 32))

(assert (=> b!157611 (= e!103219 call!17227)))

(declare-fun b!157612 () Bool)

(assert (=> b!157612 (= e!103219 (bvadd #b00000000000000000000000000000001 call!17227))))

(declare-fun bm!17224 () Bool)

(assert (=> bm!17224 (= call!17227 (arrayCountValidKeys!0 (_keys!4953 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2912 (_keys!4953 thiss!1248))))))

(declare-fun d!51075 () Bool)

(declare-fun lt!81739 () (_ BitVec 32))

(assert (=> d!51075 (and (bvsge lt!81739 #b00000000000000000000000000000000) (bvsle lt!81739 (bvsub (size!2912 (_keys!4953 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!51075 (= lt!81739 e!103220)))

(declare-fun c!29709 () Bool)

(assert (=> d!51075 (= c!29709 (bvsge #b00000000000000000000000000000000 (size!2912 (_keys!4953 thiss!1248))))))

(assert (=> d!51075 (and (bvsle #b00000000000000000000000000000000 (size!2912 (_keys!4953 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2912 (_keys!4953 thiss!1248)) (size!2912 (_keys!4953 thiss!1248))))))

(assert (=> d!51075 (= (arrayCountValidKeys!0 (_keys!4953 thiss!1248) #b00000000000000000000000000000000 (size!2912 (_keys!4953 thiss!1248))) lt!81739)))

(assert (= (and d!51075 c!29709) b!157610))

(assert (= (and d!51075 (not c!29709)) b!157609))

(assert (= (and b!157609 c!29710) b!157612))

(assert (= (and b!157609 (not c!29710)) b!157611))

(assert (= (or b!157612 b!157611) bm!17224))

(declare-fun m!190753 () Bool)

(assert (=> b!157609 m!190753))

(assert (=> b!157609 m!190753))

(declare-fun m!190755 () Bool)

(assert (=> b!157609 m!190755))

(declare-fun m!190757 () Bool)

(assert (=> bm!17224 m!190757))

(assert (=> b!157590 d!51075))

(declare-fun b!157621 () Bool)

(declare-fun e!103227 () Bool)

(declare-fun call!17230 () Bool)

(assert (=> b!157621 (= e!103227 call!17230)))

(declare-fun b!157622 () Bool)

(declare-fun e!103228 () Bool)

(assert (=> b!157622 (= e!103228 e!103227)))

(declare-fun c!29713 () Bool)

(assert (=> b!157622 (= c!29713 (validKeyInArray!0 (select (arr!2633 (_keys!4953 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17227 () Bool)

(assert (=> bm!17227 (= call!17230 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4953 thiss!1248) (mask!7661 thiss!1248)))))

(declare-fun b!157624 () Bool)

(declare-fun e!103229 () Bool)

(assert (=> b!157624 (= e!103229 call!17230)))

(declare-fun d!51077 () Bool)

(declare-fun res!74481 () Bool)

(assert (=> d!51077 (=> res!74481 e!103228)))

(assert (=> d!51077 (= res!74481 (bvsge #b00000000000000000000000000000000 (size!2912 (_keys!4953 thiss!1248))))))

(assert (=> d!51077 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4953 thiss!1248) (mask!7661 thiss!1248)) e!103228)))

(declare-fun b!157623 () Bool)

(assert (=> b!157623 (= e!103227 e!103229)))

(declare-fun lt!81746 () (_ BitVec 64))

(assert (=> b!157623 (= lt!81746 (select (arr!2633 (_keys!4953 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!4980 0))(
  ( (Unit!4981) )
))
(declare-fun lt!81747 () Unit!4980)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!5555 (_ BitVec 64) (_ BitVec 32)) Unit!4980)

(assert (=> b!157623 (= lt!81747 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4953 thiss!1248) lt!81746 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!5555 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157623 (arrayContainsKey!0 (_keys!4953 thiss!1248) lt!81746 #b00000000000000000000000000000000)))

(declare-fun lt!81748 () Unit!4980)

(assert (=> b!157623 (= lt!81748 lt!81747)))

(declare-fun res!74482 () Bool)

(declare-datatypes ((SeekEntryResult!288 0))(
  ( (MissingZero!288 (index!3320 (_ BitVec 32))) (Found!288 (index!3321 (_ BitVec 32))) (Intermediate!288 (undefined!1100 Bool) (index!3322 (_ BitVec 32)) (x!17364 (_ BitVec 32))) (Undefined!288) (MissingVacant!288 (index!3323 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5555 (_ BitVec 32)) SeekEntryResult!288)

(assert (=> b!157623 (= res!74482 (= (seekEntryOrOpen!0 (select (arr!2633 (_keys!4953 thiss!1248)) #b00000000000000000000000000000000) (_keys!4953 thiss!1248) (mask!7661 thiss!1248)) (Found!288 #b00000000000000000000000000000000)))))

(assert (=> b!157623 (=> (not res!74482) (not e!103229))))

(assert (= (and d!51077 (not res!74481)) b!157622))

(assert (= (and b!157622 c!29713) b!157623))

(assert (= (and b!157622 (not c!29713)) b!157621))

(assert (= (and b!157623 res!74482) b!157624))

(assert (= (or b!157624 b!157621) bm!17227))

(assert (=> b!157622 m!190753))

(assert (=> b!157622 m!190753))

(assert (=> b!157622 m!190755))

(declare-fun m!190759 () Bool)

(assert (=> bm!17227 m!190759))

(assert (=> b!157623 m!190753))

(declare-fun m!190761 () Bool)

(assert (=> b!157623 m!190761))

(declare-fun m!190763 () Bool)

(assert (=> b!157623 m!190763))

(assert (=> b!157623 m!190753))

(declare-fun m!190765 () Bool)

(assert (=> b!157623 m!190765))

(assert (=> b!157591 d!51077))

(declare-fun b!157635 () Bool)

(declare-fun e!103239 () Bool)

(declare-fun e!103241 () Bool)

(assert (=> b!157635 (= e!103239 e!103241)))

(declare-fun c!29716 () Bool)

(assert (=> b!157635 (= c!29716 (validKeyInArray!0 (select (arr!2633 (_keys!4953 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!51079 () Bool)

(declare-fun res!74491 () Bool)

(declare-fun e!103240 () Bool)

(assert (=> d!51079 (=> res!74491 e!103240)))

(assert (=> d!51079 (= res!74491 (bvsge #b00000000000000000000000000000000 (size!2912 (_keys!4953 thiss!1248))))))

(assert (=> d!51079 (= (arrayNoDuplicates!0 (_keys!4953 thiss!1248) #b00000000000000000000000000000000 Nil!1881) e!103240)))

(declare-fun b!157636 () Bool)

(assert (=> b!157636 (= e!103240 e!103239)))

(declare-fun res!74489 () Bool)

(assert (=> b!157636 (=> (not res!74489) (not e!103239))))

(declare-fun e!103238 () Bool)

(assert (=> b!157636 (= res!74489 (not e!103238))))

(declare-fun res!74490 () Bool)

(assert (=> b!157636 (=> (not res!74490) (not e!103238))))

(assert (=> b!157636 (= res!74490 (validKeyInArray!0 (select (arr!2633 (_keys!4953 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17230 () Bool)

(declare-fun call!17233 () Bool)

(assert (=> bm!17230 (= call!17233 (arrayNoDuplicates!0 (_keys!4953 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!29716 (Cons!1880 (select (arr!2633 (_keys!4953 thiss!1248)) #b00000000000000000000000000000000) Nil!1881) Nil!1881)))))

(declare-fun b!157637 () Bool)

(assert (=> b!157637 (= e!103241 call!17233)))

(declare-fun b!157638 () Bool)

(assert (=> b!157638 (= e!103241 call!17233)))

(declare-fun b!157639 () Bool)

(declare-fun contains!978 (List!1884 (_ BitVec 64)) Bool)

(assert (=> b!157639 (= e!103238 (contains!978 Nil!1881 (select (arr!2633 (_keys!4953 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51079 (not res!74491)) b!157636))

(assert (= (and b!157636 res!74490) b!157639))

(assert (= (and b!157636 res!74489) b!157635))

(assert (= (and b!157635 c!29716) b!157638))

(assert (= (and b!157635 (not c!29716)) b!157637))

(assert (= (or b!157638 b!157637) bm!17230))

(assert (=> b!157635 m!190753))

(assert (=> b!157635 m!190753))

(assert (=> b!157635 m!190755))

(assert (=> b!157636 m!190753))

(assert (=> b!157636 m!190753))

(assert (=> b!157636 m!190755))

(assert (=> bm!17230 m!190753))

(declare-fun m!190767 () Bool)

(assert (=> bm!17230 m!190767))

(assert (=> b!157639 m!190753))

(assert (=> b!157639 m!190753))

(declare-fun m!190769 () Bool)

(assert (=> b!157639 m!190769))

(assert (=> b!157592 d!51079))

(declare-fun d!51081 () Bool)

(declare-fun res!74502 () Bool)

(declare-fun e!103244 () Bool)

(assert (=> d!51081 (=> (not res!74502) (not e!103244))))

(assert (=> d!51081 (= res!74502 (validMask!0 (mask!7661 thiss!1248)))))

(assert (=> d!51081 (= (simpleValid!107 thiss!1248) e!103244)))

(declare-fun b!157648 () Bool)

(declare-fun res!74503 () Bool)

(assert (=> b!157648 (=> (not res!74503) (not e!103244))))

(assert (=> b!157648 (= res!74503 (and (= (size!2913 (_values!3160 thiss!1248)) (bvadd (mask!7661 thiss!1248) #b00000000000000000000000000000001)) (= (size!2912 (_keys!4953 thiss!1248)) (size!2913 (_values!3160 thiss!1248))) (bvsge (_size!784 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!784 thiss!1248) (bvadd (mask!7661 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!157650 () Bool)

(declare-fun res!74501 () Bool)

(assert (=> b!157650 (=> (not res!74501) (not e!103244))))

(declare-fun size!2916 (LongMapFixedSize!1470) (_ BitVec 32))

(assert (=> b!157650 (= res!74501 (= (size!2916 thiss!1248) (bvadd (_size!784 thiss!1248) (bvsdiv (bvadd (extraKeys!2918 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!157651 () Bool)

(assert (=> b!157651 (= e!103244 (and (bvsge (extraKeys!2918 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2918 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!784 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!157649 () Bool)

(declare-fun res!74500 () Bool)

(assert (=> b!157649 (=> (not res!74500) (not e!103244))))

(assert (=> b!157649 (= res!74500 (bvsge (size!2916 thiss!1248) (_size!784 thiss!1248)))))

(assert (= (and d!51081 res!74502) b!157648))

(assert (= (and b!157648 res!74503) b!157649))

(assert (= (and b!157649 res!74500) b!157650))

(assert (= (and b!157650 res!74501) b!157651))

(assert (=> d!51081 m!190731))

(declare-fun m!190771 () Bool)

(assert (=> b!157650 m!190771))

(assert (=> b!157649 m!190771))

(assert (=> d!51073 d!51081))

(declare-fun condMapEmpty!5530 () Bool)

(declare-fun mapDefault!5530 () ValueCell!1281)

(assert (=> mapNonEmpty!5529 (= condMapEmpty!5530 (= mapRest!5529 ((as const (Array (_ BitVec 32) ValueCell!1281)) mapDefault!5530)))))

(declare-fun e!103245 () Bool)

(declare-fun mapRes!5530 () Bool)

(assert (=> mapNonEmpty!5529 (= tp!12882 (and e!103245 mapRes!5530))))

(declare-fun b!157652 () Bool)

(declare-fun e!103246 () Bool)

(assert (=> b!157652 (= e!103246 tp_is_empty!3249)))

(declare-fun mapNonEmpty!5530 () Bool)

(declare-fun tp!12883 () Bool)

(assert (=> mapNonEmpty!5530 (= mapRes!5530 (and tp!12883 e!103246))))

(declare-fun mapValue!5530 () ValueCell!1281)

(declare-fun mapKey!5530 () (_ BitVec 32))

(declare-fun mapRest!5530 () (Array (_ BitVec 32) ValueCell!1281))

(assert (=> mapNonEmpty!5530 (= mapRest!5529 (store mapRest!5530 mapKey!5530 mapValue!5530))))

(declare-fun b!157653 () Bool)

(assert (=> b!157653 (= e!103245 tp_is_empty!3249)))

(declare-fun mapIsEmpty!5530 () Bool)

(assert (=> mapIsEmpty!5530 mapRes!5530))

(assert (= (and mapNonEmpty!5529 condMapEmpty!5530) mapIsEmpty!5530))

(assert (= (and mapNonEmpty!5529 (not condMapEmpty!5530)) mapNonEmpty!5530))

(assert (= (and mapNonEmpty!5530 ((_ is ValueCellFull!1281) mapValue!5530)) b!157652))

(assert (= (and mapNonEmpty!5529 ((_ is ValueCellFull!1281) mapDefault!5530)) b!157653))

(declare-fun m!190773 () Bool)

(assert (=> mapNonEmpty!5530 m!190773))

(check-sat (not b!157622) (not d!51081) (not b!157639) (not bm!17224) (not b!157649) (not mapNonEmpty!5530) tp_is_empty!3249 (not b!157636) (not b!157650) (not b!157635) (not bm!17230) (not b!157609) b_and!9861 (not bm!17227) (not b_next!3447) (not b!157623))
(check-sat b_and!9861 (not b_next!3447))

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15806 () Bool)

(assert start!15806)

(declare-fun b!157584 () Bool)

(declare-fun b_free!3445 () Bool)

(declare-fun b_next!3445 () Bool)

(assert (=> b!157584 (= b_free!3445 (not b_next!3445))))

(declare-fun tp!12866 () Bool)

(declare-fun b_and!9873 () Bool)

(assert (=> b!157584 (= tp!12866 b_and!9873)))

(declare-fun mapIsEmpty!5520 () Bool)

(declare-fun mapRes!5520 () Bool)

(assert (=> mapIsEmpty!5520 mapRes!5520))

(declare-fun res!74470 () Bool)

(declare-fun e!103188 () Bool)

(assert (=> start!15806 (=> (not res!74470) (not e!103188))))

(declare-datatypes ((V!3977 0))(
  ( (V!3978 (val!1668 Int)) )
))
(declare-datatypes ((ValueCell!1280 0))(
  ( (ValueCellFull!1280 (v!3534 V!3977)) (EmptyCell!1280) )
))
(declare-datatypes ((array!5537 0))(
  ( (array!5538 (arr!2624 (Array (_ BitVec 32) (_ BitVec 64))) (size!2903 (_ BitVec 32))) )
))
(declare-datatypes ((array!5539 0))(
  ( (array!5540 (arr!2625 (Array (_ BitVec 32) ValueCell!1280)) (size!2904 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1468 0))(
  ( (LongMapFixedSize!1469 (defaultEntry!3176 Int) (mask!7660 (_ BitVec 32)) (extraKeys!2917 (_ BitVec 32)) (zeroValue!3019 V!3977) (minValue!3019 V!3977) (_size!783 (_ BitVec 32)) (_keys!4952 array!5537) (_values!3159 array!5539) (_vacant!783 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1468)

(declare-fun valid!716 (LongMapFixedSize!1468) Bool)

(assert (=> start!15806 (= res!74470 (valid!716 thiss!1248))))

(assert (=> start!15806 e!103188))

(declare-fun e!103189 () Bool)

(assert (=> start!15806 e!103189))

(assert (=> start!15806 true))

(declare-fun b!157582 () Bool)

(assert (=> b!157582 (= e!103188 (and (bvsge (mask!7660 thiss!1248) #b00000000000000000000000000000000) (not (= (size!2903 (_keys!4952 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7660 thiss!1248))))))))

(declare-fun b!157583 () Bool)

(declare-fun res!74469 () Bool)

(assert (=> b!157583 (=> (not res!74469) (not e!103188))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!157583 (= res!74469 (validMask!0 (mask!7660 thiss!1248)))))

(declare-fun tp_is_empty!3247 () Bool)

(declare-fun e!103191 () Bool)

(declare-fun array_inv!1671 (array!5537) Bool)

(declare-fun array_inv!1672 (array!5539) Bool)

(assert (=> b!157584 (= e!103189 (and tp!12866 tp_is_empty!3247 (array_inv!1671 (_keys!4952 thiss!1248)) (array_inv!1672 (_values!3159 thiss!1248)) e!103191))))

(declare-fun b!157585 () Bool)

(declare-fun e!103193 () Bool)

(assert (=> b!157585 (= e!103191 (and e!103193 mapRes!5520))))

(declare-fun condMapEmpty!5520 () Bool)

(declare-fun mapDefault!5520 () ValueCell!1280)

(assert (=> b!157585 (= condMapEmpty!5520 (= (arr!2625 (_values!3159 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1280)) mapDefault!5520)))))

(declare-fun b!157586 () Bool)

(declare-fun e!103192 () Bool)

(assert (=> b!157586 (= e!103192 tp_is_empty!3247)))

(declare-fun b!157587 () Bool)

(assert (=> b!157587 (= e!103193 tp_is_empty!3247)))

(declare-fun mapNonEmpty!5520 () Bool)

(declare-fun tp!12867 () Bool)

(assert (=> mapNonEmpty!5520 (= mapRes!5520 (and tp!12867 e!103192))))

(declare-fun mapKey!5520 () (_ BitVec 32))

(declare-fun mapRest!5520 () (Array (_ BitVec 32) ValueCell!1280))

(declare-fun mapValue!5520 () ValueCell!1280)

(assert (=> mapNonEmpty!5520 (= (arr!2625 (_values!3159 thiss!1248)) (store mapRest!5520 mapKey!5520 mapValue!5520))))

(declare-fun b!157588 () Bool)

(declare-fun res!74468 () Bool)

(assert (=> b!157588 (=> (not res!74468) (not e!103188))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!157588 (= res!74468 (not (= key!828 (bvneg key!828))))))

(assert (= (and start!15806 res!74470) b!157588))

(assert (= (and b!157588 res!74468) b!157583))

(assert (= (and b!157583 res!74469) b!157582))

(assert (= (and b!157585 condMapEmpty!5520) mapIsEmpty!5520))

(assert (= (and b!157585 (not condMapEmpty!5520)) mapNonEmpty!5520))

(get-info :version)

(assert (= (and mapNonEmpty!5520 ((_ is ValueCellFull!1280) mapValue!5520)) b!157586))

(assert (= (and b!157585 ((_ is ValueCellFull!1280) mapDefault!5520)) b!157587))

(assert (= b!157584 b!157585))

(assert (= start!15806 b!157584))

(declare-fun m!190895 () Bool)

(assert (=> start!15806 m!190895))

(declare-fun m!190897 () Bool)

(assert (=> b!157583 m!190897))

(declare-fun m!190899 () Bool)

(assert (=> b!157584 m!190899))

(declare-fun m!190901 () Bool)

(assert (=> b!157584 m!190901))

(declare-fun m!190903 () Bool)

(assert (=> mapNonEmpty!5520 m!190903))

(check-sat (not mapNonEmpty!5520) (not b_next!3445) tp_is_empty!3247 (not start!15806) (not b!157583) (not b!157584) b_and!9873)
(check-sat b_and!9873 (not b_next!3445))
(get-model)

(declare-fun d!51141 () Bool)

(assert (=> d!51141 (= (validMask!0 (mask!7660 thiss!1248)) (and (or (= (mask!7660 thiss!1248) #b00000000000000000000000000000111) (= (mask!7660 thiss!1248) #b00000000000000000000000000001111) (= (mask!7660 thiss!1248) #b00000000000000000000000000011111) (= (mask!7660 thiss!1248) #b00000000000000000000000000111111) (= (mask!7660 thiss!1248) #b00000000000000000000000001111111) (= (mask!7660 thiss!1248) #b00000000000000000000000011111111) (= (mask!7660 thiss!1248) #b00000000000000000000000111111111) (= (mask!7660 thiss!1248) #b00000000000000000000001111111111) (= (mask!7660 thiss!1248) #b00000000000000000000011111111111) (= (mask!7660 thiss!1248) #b00000000000000000000111111111111) (= (mask!7660 thiss!1248) #b00000000000000000001111111111111) (= (mask!7660 thiss!1248) #b00000000000000000011111111111111) (= (mask!7660 thiss!1248) #b00000000000000000111111111111111) (= (mask!7660 thiss!1248) #b00000000000000001111111111111111) (= (mask!7660 thiss!1248) #b00000000000000011111111111111111) (= (mask!7660 thiss!1248) #b00000000000000111111111111111111) (= (mask!7660 thiss!1248) #b00000000000001111111111111111111) (= (mask!7660 thiss!1248) #b00000000000011111111111111111111) (= (mask!7660 thiss!1248) #b00000000000111111111111111111111) (= (mask!7660 thiss!1248) #b00000000001111111111111111111111) (= (mask!7660 thiss!1248) #b00000000011111111111111111111111) (= (mask!7660 thiss!1248) #b00000000111111111111111111111111) (= (mask!7660 thiss!1248) #b00000001111111111111111111111111) (= (mask!7660 thiss!1248) #b00000011111111111111111111111111) (= (mask!7660 thiss!1248) #b00000111111111111111111111111111) (= (mask!7660 thiss!1248) #b00001111111111111111111111111111) (= (mask!7660 thiss!1248) #b00011111111111111111111111111111) (= (mask!7660 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7660 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!157583 d!51141))

(declare-fun d!51143 () Bool)

(declare-fun res!74495 () Bool)

(declare-fun e!103232 () Bool)

(assert (=> d!51143 (=> (not res!74495) (not e!103232))))

(declare-fun simpleValid!107 (LongMapFixedSize!1468) Bool)

(assert (=> d!51143 (= res!74495 (simpleValid!107 thiss!1248))))

(assert (=> d!51143 (= (valid!716 thiss!1248) e!103232)))

(declare-fun b!157637 () Bool)

(declare-fun res!74496 () Bool)

(assert (=> b!157637 (=> (not res!74496) (not e!103232))))

(declare-fun arrayCountValidKeys!0 (array!5537 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!157637 (= res!74496 (= (arrayCountValidKeys!0 (_keys!4952 thiss!1248) #b00000000000000000000000000000000 (size!2903 (_keys!4952 thiss!1248))) (_size!783 thiss!1248)))))

(declare-fun b!157638 () Bool)

(declare-fun res!74497 () Bool)

(assert (=> b!157638 (=> (not res!74497) (not e!103232))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5537 (_ BitVec 32)) Bool)

(assert (=> b!157638 (= res!74497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4952 thiss!1248) (mask!7660 thiss!1248)))))

(declare-fun b!157639 () Bool)

(declare-datatypes ((List!1868 0))(
  ( (Nil!1865) (Cons!1864 (h!2473 (_ BitVec 64)) (t!6662 List!1868)) )
))
(declare-fun arrayNoDuplicates!0 (array!5537 (_ BitVec 32) List!1868) Bool)

(assert (=> b!157639 (= e!103232 (arrayNoDuplicates!0 (_keys!4952 thiss!1248) #b00000000000000000000000000000000 Nil!1865))))

(assert (= (and d!51143 res!74495) b!157637))

(assert (= (and b!157637 res!74496) b!157638))

(assert (= (and b!157638 res!74497) b!157639))

(declare-fun m!190925 () Bool)

(assert (=> d!51143 m!190925))

(declare-fun m!190927 () Bool)

(assert (=> b!157637 m!190927))

(declare-fun m!190929 () Bool)

(assert (=> b!157638 m!190929))

(declare-fun m!190931 () Bool)

(assert (=> b!157639 m!190931))

(assert (=> start!15806 d!51143))

(declare-fun d!51145 () Bool)

(assert (=> d!51145 (= (array_inv!1671 (_keys!4952 thiss!1248)) (bvsge (size!2903 (_keys!4952 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!157584 d!51145))

(declare-fun d!51147 () Bool)

(assert (=> d!51147 (= (array_inv!1672 (_values!3159 thiss!1248)) (bvsge (size!2904 (_values!3159 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!157584 d!51147))

(declare-fun condMapEmpty!5529 () Bool)

(declare-fun mapDefault!5529 () ValueCell!1280)

(assert (=> mapNonEmpty!5520 (= condMapEmpty!5529 (= mapRest!5520 ((as const (Array (_ BitVec 32) ValueCell!1280)) mapDefault!5529)))))

(declare-fun e!103237 () Bool)

(declare-fun mapRes!5529 () Bool)

(assert (=> mapNonEmpty!5520 (= tp!12867 (and e!103237 mapRes!5529))))

(declare-fun b!157646 () Bool)

(declare-fun e!103238 () Bool)

(assert (=> b!157646 (= e!103238 tp_is_empty!3247)))

(declare-fun mapNonEmpty!5529 () Bool)

(declare-fun tp!12882 () Bool)

(assert (=> mapNonEmpty!5529 (= mapRes!5529 (and tp!12882 e!103238))))

(declare-fun mapValue!5529 () ValueCell!1280)

(declare-fun mapRest!5529 () (Array (_ BitVec 32) ValueCell!1280))

(declare-fun mapKey!5529 () (_ BitVec 32))

(assert (=> mapNonEmpty!5529 (= mapRest!5520 (store mapRest!5529 mapKey!5529 mapValue!5529))))

(declare-fun b!157647 () Bool)

(assert (=> b!157647 (= e!103237 tp_is_empty!3247)))

(declare-fun mapIsEmpty!5529 () Bool)

(assert (=> mapIsEmpty!5529 mapRes!5529))

(assert (= (and mapNonEmpty!5520 condMapEmpty!5529) mapIsEmpty!5529))

(assert (= (and mapNonEmpty!5520 (not condMapEmpty!5529)) mapNonEmpty!5529))

(assert (= (and mapNonEmpty!5529 ((_ is ValueCellFull!1280) mapValue!5529)) b!157646))

(assert (= (and mapNonEmpty!5520 ((_ is ValueCellFull!1280) mapDefault!5529)) b!157647))

(declare-fun m!190933 () Bool)

(assert (=> mapNonEmpty!5529 m!190933))

(check-sat (not b_next!3445) tp_is_empty!3247 (not b!157638) (not b!157637) (not d!51143) b_and!9873 (not b!157639) (not mapNonEmpty!5529))
(check-sat b_and!9873 (not b_next!3445))
(get-model)

(declare-fun b!157659 () Bool)

(declare-fun e!103241 () Bool)

(assert (=> b!157659 (= e!103241 (and (bvsge (extraKeys!2917 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2917 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!783 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!157656 () Bool)

(declare-fun res!74506 () Bool)

(assert (=> b!157656 (=> (not res!74506) (not e!103241))))

(assert (=> b!157656 (= res!74506 (and (= (size!2904 (_values!3159 thiss!1248)) (bvadd (mask!7660 thiss!1248) #b00000000000000000000000000000001)) (= (size!2903 (_keys!4952 thiss!1248)) (size!2904 (_values!3159 thiss!1248))) (bvsge (_size!783 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!783 thiss!1248) (bvadd (mask!7660 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!157657 () Bool)

(declare-fun res!74508 () Bool)

(assert (=> b!157657 (=> (not res!74508) (not e!103241))))

(declare-fun size!2909 (LongMapFixedSize!1468) (_ BitVec 32))

(assert (=> b!157657 (= res!74508 (bvsge (size!2909 thiss!1248) (_size!783 thiss!1248)))))

(declare-fun b!157658 () Bool)

(declare-fun res!74507 () Bool)

(assert (=> b!157658 (=> (not res!74507) (not e!103241))))

(assert (=> b!157658 (= res!74507 (= (size!2909 thiss!1248) (bvadd (_size!783 thiss!1248) (bvsdiv (bvadd (extraKeys!2917 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!51149 () Bool)

(declare-fun res!74509 () Bool)

(assert (=> d!51149 (=> (not res!74509) (not e!103241))))

(assert (=> d!51149 (= res!74509 (validMask!0 (mask!7660 thiss!1248)))))

(assert (=> d!51149 (= (simpleValid!107 thiss!1248) e!103241)))

(assert (= (and d!51149 res!74509) b!157656))

(assert (= (and b!157656 res!74506) b!157657))

(assert (= (and b!157657 res!74508) b!157658))

(assert (= (and b!157658 res!74507) b!157659))

(declare-fun m!190935 () Bool)

(assert (=> b!157657 m!190935))

(assert (=> b!157658 m!190935))

(assert (=> d!51149 m!190897))

(assert (=> d!51143 d!51149))

(declare-fun b!157668 () Bool)

(declare-fun e!103247 () (_ BitVec 32))

(declare-fun call!17215 () (_ BitVec 32))

(assert (=> b!157668 (= e!103247 call!17215)))

(declare-fun bm!17212 () Bool)

(assert (=> bm!17212 (= call!17215 (arrayCountValidKeys!0 (_keys!4952 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2903 (_keys!4952 thiss!1248))))))

(declare-fun b!157669 () Bool)

(assert (=> b!157669 (= e!103247 (bvadd #b00000000000000000000000000000001 call!17215))))

(declare-fun d!51151 () Bool)

(declare-fun lt!81798 () (_ BitVec 32))

(assert (=> d!51151 (and (bvsge lt!81798 #b00000000000000000000000000000000) (bvsle lt!81798 (bvsub (size!2903 (_keys!4952 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!103246 () (_ BitVec 32))

(assert (=> d!51151 (= lt!81798 e!103246)))

(declare-fun c!29723 () Bool)

(assert (=> d!51151 (= c!29723 (bvsge #b00000000000000000000000000000000 (size!2903 (_keys!4952 thiss!1248))))))

(assert (=> d!51151 (and (bvsle #b00000000000000000000000000000000 (size!2903 (_keys!4952 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2903 (_keys!4952 thiss!1248)) (size!2903 (_keys!4952 thiss!1248))))))

(assert (=> d!51151 (= (arrayCountValidKeys!0 (_keys!4952 thiss!1248) #b00000000000000000000000000000000 (size!2903 (_keys!4952 thiss!1248))) lt!81798)))

(declare-fun b!157670 () Bool)

(assert (=> b!157670 (= e!103246 e!103247)))

(declare-fun c!29722 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!157670 (= c!29722 (validKeyInArray!0 (select (arr!2624 (_keys!4952 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!157671 () Bool)

(assert (=> b!157671 (= e!103246 #b00000000000000000000000000000000)))

(assert (= (and d!51151 c!29723) b!157671))

(assert (= (and d!51151 (not c!29723)) b!157670))

(assert (= (and b!157670 c!29722) b!157669))

(assert (= (and b!157670 (not c!29722)) b!157668))

(assert (= (or b!157669 b!157668) bm!17212))

(declare-fun m!190937 () Bool)

(assert (=> bm!17212 m!190937))

(declare-fun m!190939 () Bool)

(assert (=> b!157670 m!190939))

(assert (=> b!157670 m!190939))

(declare-fun m!190941 () Bool)

(assert (=> b!157670 m!190941))

(assert (=> b!157637 d!51151))

(declare-fun b!157680 () Bool)

(declare-fun e!103256 () Bool)

(declare-fun call!17218 () Bool)

(assert (=> b!157680 (= e!103256 call!17218)))

(declare-fun b!157681 () Bool)

(declare-fun e!103255 () Bool)

(assert (=> b!157681 (= e!103255 call!17218)))

(declare-fun d!51153 () Bool)

(declare-fun res!74514 () Bool)

(declare-fun e!103254 () Bool)

(assert (=> d!51153 (=> res!74514 e!103254)))

(assert (=> d!51153 (= res!74514 (bvsge #b00000000000000000000000000000000 (size!2903 (_keys!4952 thiss!1248))))))

(assert (=> d!51153 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4952 thiss!1248) (mask!7660 thiss!1248)) e!103254)))

(declare-fun b!157682 () Bool)

(assert (=> b!157682 (= e!103256 e!103255)))

(declare-fun lt!81807 () (_ BitVec 64))

(assert (=> b!157682 (= lt!81807 (select (arr!2624 (_keys!4952 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!4985 0))(
  ( (Unit!4986) )
))
(declare-fun lt!81806 () Unit!4985)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!5537 (_ BitVec 64) (_ BitVec 32)) Unit!4985)

(assert (=> b!157682 (= lt!81806 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4952 thiss!1248) lt!81807 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!5537 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157682 (arrayContainsKey!0 (_keys!4952 thiss!1248) lt!81807 #b00000000000000000000000000000000)))

(declare-fun lt!81805 () Unit!4985)

(assert (=> b!157682 (= lt!81805 lt!81806)))

(declare-fun res!74515 () Bool)

(declare-datatypes ((SeekEntryResult!282 0))(
  ( (MissingZero!282 (index!3296 (_ BitVec 32))) (Found!282 (index!3297 (_ BitVec 32))) (Intermediate!282 (undefined!1094 Bool) (index!3298 (_ BitVec 32)) (x!17358 (_ BitVec 32))) (Undefined!282) (MissingVacant!282 (index!3299 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5537 (_ BitVec 32)) SeekEntryResult!282)

(assert (=> b!157682 (= res!74515 (= (seekEntryOrOpen!0 (select (arr!2624 (_keys!4952 thiss!1248)) #b00000000000000000000000000000000) (_keys!4952 thiss!1248) (mask!7660 thiss!1248)) (Found!282 #b00000000000000000000000000000000)))))

(assert (=> b!157682 (=> (not res!74515) (not e!103255))))

(declare-fun b!157683 () Bool)

(assert (=> b!157683 (= e!103254 e!103256)))

(declare-fun c!29726 () Bool)

(assert (=> b!157683 (= c!29726 (validKeyInArray!0 (select (arr!2624 (_keys!4952 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17215 () Bool)

(assert (=> bm!17215 (= call!17218 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4952 thiss!1248) (mask!7660 thiss!1248)))))

(assert (= (and d!51153 (not res!74514)) b!157683))

(assert (= (and b!157683 c!29726) b!157682))

(assert (= (and b!157683 (not c!29726)) b!157680))

(assert (= (and b!157682 res!74515) b!157681))

(assert (= (or b!157681 b!157680) bm!17215))

(assert (=> b!157682 m!190939))

(declare-fun m!190943 () Bool)

(assert (=> b!157682 m!190943))

(declare-fun m!190945 () Bool)

(assert (=> b!157682 m!190945))

(assert (=> b!157682 m!190939))

(declare-fun m!190947 () Bool)

(assert (=> b!157682 m!190947))

(assert (=> b!157683 m!190939))

(assert (=> b!157683 m!190939))

(assert (=> b!157683 m!190941))

(declare-fun m!190949 () Bool)

(assert (=> bm!17215 m!190949))

(assert (=> b!157638 d!51153))

(declare-fun d!51155 () Bool)

(declare-fun res!74522 () Bool)

(declare-fun e!103266 () Bool)

(assert (=> d!51155 (=> res!74522 e!103266)))

(assert (=> d!51155 (= res!74522 (bvsge #b00000000000000000000000000000000 (size!2903 (_keys!4952 thiss!1248))))))

(assert (=> d!51155 (= (arrayNoDuplicates!0 (_keys!4952 thiss!1248) #b00000000000000000000000000000000 Nil!1865) e!103266)))

(declare-fun b!157694 () Bool)

(declare-fun e!103267 () Bool)

(declare-fun e!103268 () Bool)

(assert (=> b!157694 (= e!103267 e!103268)))

(declare-fun c!29729 () Bool)

(assert (=> b!157694 (= c!29729 (validKeyInArray!0 (select (arr!2624 (_keys!4952 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!157695 () Bool)

(declare-fun call!17221 () Bool)

(assert (=> b!157695 (= e!103268 call!17221)))

(declare-fun bm!17218 () Bool)

(assert (=> bm!17218 (= call!17221 (arrayNoDuplicates!0 (_keys!4952 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!29729 (Cons!1864 (select (arr!2624 (_keys!4952 thiss!1248)) #b00000000000000000000000000000000) Nil!1865) Nil!1865)))))

(declare-fun b!157696 () Bool)

(assert (=> b!157696 (= e!103266 e!103267)))

(declare-fun res!74523 () Bool)

(assert (=> b!157696 (=> (not res!74523) (not e!103267))))

(declare-fun e!103265 () Bool)

(assert (=> b!157696 (= res!74523 (not e!103265))))

(declare-fun res!74524 () Bool)

(assert (=> b!157696 (=> (not res!74524) (not e!103265))))

(assert (=> b!157696 (= res!74524 (validKeyInArray!0 (select (arr!2624 (_keys!4952 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!157697 () Bool)

(declare-fun contains!961 (List!1868 (_ BitVec 64)) Bool)

(assert (=> b!157697 (= e!103265 (contains!961 Nil!1865 (select (arr!2624 (_keys!4952 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!157698 () Bool)

(assert (=> b!157698 (= e!103268 call!17221)))

(assert (= (and d!51155 (not res!74522)) b!157696))

(assert (= (and b!157696 res!74524) b!157697))

(assert (= (and b!157696 res!74523) b!157694))

(assert (= (and b!157694 c!29729) b!157695))

(assert (= (and b!157694 (not c!29729)) b!157698))

(assert (= (or b!157695 b!157698) bm!17218))

(assert (=> b!157694 m!190939))

(assert (=> b!157694 m!190939))

(assert (=> b!157694 m!190941))

(assert (=> bm!17218 m!190939))

(declare-fun m!190951 () Bool)

(assert (=> bm!17218 m!190951))

(assert (=> b!157696 m!190939))

(assert (=> b!157696 m!190939))

(assert (=> b!157696 m!190941))

(assert (=> b!157697 m!190939))

(assert (=> b!157697 m!190939))

(declare-fun m!190953 () Bool)

(assert (=> b!157697 m!190953))

(assert (=> b!157639 d!51155))

(declare-fun condMapEmpty!5530 () Bool)

(declare-fun mapDefault!5530 () ValueCell!1280)

(assert (=> mapNonEmpty!5529 (= condMapEmpty!5530 (= mapRest!5529 ((as const (Array (_ BitVec 32) ValueCell!1280)) mapDefault!5530)))))

(declare-fun e!103269 () Bool)

(declare-fun mapRes!5530 () Bool)

(assert (=> mapNonEmpty!5529 (= tp!12882 (and e!103269 mapRes!5530))))

(declare-fun b!157699 () Bool)

(declare-fun e!103270 () Bool)

(assert (=> b!157699 (= e!103270 tp_is_empty!3247)))

(declare-fun mapNonEmpty!5530 () Bool)

(declare-fun tp!12883 () Bool)

(assert (=> mapNonEmpty!5530 (= mapRes!5530 (and tp!12883 e!103270))))

(declare-fun mapValue!5530 () ValueCell!1280)

(declare-fun mapKey!5530 () (_ BitVec 32))

(declare-fun mapRest!5530 () (Array (_ BitVec 32) ValueCell!1280))

(assert (=> mapNonEmpty!5530 (= mapRest!5529 (store mapRest!5530 mapKey!5530 mapValue!5530))))

(declare-fun b!157700 () Bool)

(assert (=> b!157700 (= e!103269 tp_is_empty!3247)))

(declare-fun mapIsEmpty!5530 () Bool)

(assert (=> mapIsEmpty!5530 mapRes!5530))

(assert (= (and mapNonEmpty!5529 condMapEmpty!5530) mapIsEmpty!5530))

(assert (= (and mapNonEmpty!5529 (not condMapEmpty!5530)) mapNonEmpty!5530))

(assert (= (and mapNonEmpty!5530 ((_ is ValueCellFull!1280) mapValue!5530)) b!157699))

(assert (= (and mapNonEmpty!5529 ((_ is ValueCellFull!1280) mapDefault!5530)) b!157700))

(declare-fun m!190955 () Bool)

(assert (=> mapNonEmpty!5530 m!190955))

(check-sat tp_is_empty!3247 (not b!157697) (not d!51149) (not b!157694) (not b!157670) b_and!9873 (not b!157696) (not b!157683) (not mapNonEmpty!5530) (not b!157657) (not bm!17218) (not b!157682) (not b_next!3445) (not bm!17212) (not b!157658) (not bm!17215))
(check-sat b_and!9873 (not b_next!3445))

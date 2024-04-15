; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17186 () Bool)

(assert start!17186)

(declare-fun b!172374 () Bool)

(declare-fun b_free!4261 () Bool)

(declare-fun b_next!4261 () Bool)

(assert (=> b!172374 (= b_free!4261 (not b_next!4261))))

(declare-fun tp!15432 () Bool)

(declare-fun b_and!10675 () Bool)

(assert (=> b!172374 (= tp!15432 b_and!10675)))

(declare-fun b!172372 () Bool)

(declare-fun e!113788 () Bool)

(declare-fun e!113787 () Bool)

(declare-fun mapRes!6862 () Bool)

(assert (=> b!172372 (= e!113788 (and e!113787 mapRes!6862))))

(declare-fun condMapEmpty!6862 () Bool)

(declare-datatypes ((V!5025 0))(
  ( (V!5026 (val!2061 Int)) )
))
(declare-datatypes ((ValueCell!1673 0))(
  ( (ValueCellFull!1673 (v!3923 V!5025)) (EmptyCell!1673) )
))
(declare-datatypes ((array!7169 0))(
  ( (array!7170 (arr!3406 (Array (_ BitVec 32) (_ BitVec 64))) (size!3704 (_ BitVec 32))) )
))
(declare-datatypes ((array!7171 0))(
  ( (array!7172 (arr!3407 (Array (_ BitVec 32) ValueCell!1673)) (size!3705 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2254 0))(
  ( (LongMapFixedSize!2255 (defaultEntry!3573 Int) (mask!8420 (_ BitVec 32)) (extraKeys!3312 (_ BitVec 32)) (zeroValue!3414 V!5025) (minValue!3416 V!5025) (_size!1176 (_ BitVec 32)) (_keys!5409 array!7169) (_values!3556 array!7171) (_vacant!1176 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2254)

(declare-fun mapDefault!6862 () ValueCell!1673)

(assert (=> b!172372 (= condMapEmpty!6862 (= (arr!3407 (_values!3556 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1673)) mapDefault!6862)))))

(declare-fun b!172373 () Bool)

(declare-fun e!113786 () Bool)

(assert (=> b!172373 (= e!113786 (and (= (size!3705 (_values!3556 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8420 thiss!1248))) (= (size!3704 (_keys!5409 thiss!1248)) (size!3705 (_values!3556 thiss!1248))) (bvsge (mask!8420 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3312 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun res!81822 () Bool)

(assert (=> start!17186 (=> (not res!81822) (not e!113786))))

(declare-fun valid!976 (LongMapFixedSize!2254) Bool)

(assert (=> start!17186 (= res!81822 (valid!976 thiss!1248))))

(assert (=> start!17186 e!113786))

(declare-fun e!113785 () Bool)

(assert (=> start!17186 e!113785))

(assert (=> start!17186 true))

(declare-fun tp_is_empty!4033 () Bool)

(declare-fun array_inv!2195 (array!7169) Bool)

(declare-fun array_inv!2196 (array!7171) Bool)

(assert (=> b!172374 (= e!113785 (and tp!15432 tp_is_empty!4033 (array_inv!2195 (_keys!5409 thiss!1248)) (array_inv!2196 (_values!3556 thiss!1248)) e!113788))))

(declare-fun b!172375 () Bool)

(declare-fun res!81821 () Bool)

(assert (=> b!172375 (=> (not res!81821) (not e!113786))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!172375 (= res!81821 (validMask!0 (mask!8420 thiss!1248)))))

(declare-fun mapIsEmpty!6862 () Bool)

(assert (=> mapIsEmpty!6862 mapRes!6862))

(declare-fun mapNonEmpty!6862 () Bool)

(declare-fun tp!15433 () Bool)

(declare-fun e!113789 () Bool)

(assert (=> mapNonEmpty!6862 (= mapRes!6862 (and tp!15433 e!113789))))

(declare-fun mapRest!6862 () (Array (_ BitVec 32) ValueCell!1673))

(declare-fun mapKey!6862 () (_ BitVec 32))

(declare-fun mapValue!6862 () ValueCell!1673)

(assert (=> mapNonEmpty!6862 (= (arr!3407 (_values!3556 thiss!1248)) (store mapRest!6862 mapKey!6862 mapValue!6862))))

(declare-fun b!172376 () Bool)

(assert (=> b!172376 (= e!113787 tp_is_empty!4033)))

(declare-fun b!172377 () Bool)

(declare-fun res!81823 () Bool)

(assert (=> b!172377 (=> (not res!81823) (not e!113786))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!172377 (= res!81823 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!172378 () Bool)

(assert (=> b!172378 (= e!113789 tp_is_empty!4033)))

(assert (= (and start!17186 res!81822) b!172377))

(assert (= (and b!172377 res!81823) b!172375))

(assert (= (and b!172375 res!81821) b!172373))

(assert (= (and b!172372 condMapEmpty!6862) mapIsEmpty!6862))

(assert (= (and b!172372 (not condMapEmpty!6862)) mapNonEmpty!6862))

(get-info :version)

(assert (= (and mapNonEmpty!6862 ((_ is ValueCellFull!1673) mapValue!6862)) b!172378))

(assert (= (and b!172372 ((_ is ValueCellFull!1673) mapDefault!6862)) b!172376))

(assert (= b!172374 b!172372))

(assert (= start!17186 b!172374))

(declare-fun m!200649 () Bool)

(assert (=> start!17186 m!200649))

(declare-fun m!200651 () Bool)

(assert (=> b!172374 m!200651))

(declare-fun m!200653 () Bool)

(assert (=> b!172374 m!200653))

(declare-fun m!200655 () Bool)

(assert (=> b!172375 m!200655))

(declare-fun m!200657 () Bool)

(assert (=> mapNonEmpty!6862 m!200657))

(check-sat (not b!172375) tp_is_empty!4033 (not start!17186) (not b!172374) b_and!10675 (not b_next!4261) (not mapNonEmpty!6862))
(check-sat b_and!10675 (not b_next!4261))
(get-model)

(declare-fun d!52371 () Bool)

(assert (=> d!52371 (= (validMask!0 (mask!8420 thiss!1248)) (and (or (= (mask!8420 thiss!1248) #b00000000000000000000000000000111) (= (mask!8420 thiss!1248) #b00000000000000000000000000001111) (= (mask!8420 thiss!1248) #b00000000000000000000000000011111) (= (mask!8420 thiss!1248) #b00000000000000000000000000111111) (= (mask!8420 thiss!1248) #b00000000000000000000000001111111) (= (mask!8420 thiss!1248) #b00000000000000000000000011111111) (= (mask!8420 thiss!1248) #b00000000000000000000000111111111) (= (mask!8420 thiss!1248) #b00000000000000000000001111111111) (= (mask!8420 thiss!1248) #b00000000000000000000011111111111) (= (mask!8420 thiss!1248) #b00000000000000000000111111111111) (= (mask!8420 thiss!1248) #b00000000000000000001111111111111) (= (mask!8420 thiss!1248) #b00000000000000000011111111111111) (= (mask!8420 thiss!1248) #b00000000000000000111111111111111) (= (mask!8420 thiss!1248) #b00000000000000001111111111111111) (= (mask!8420 thiss!1248) #b00000000000000011111111111111111) (= (mask!8420 thiss!1248) #b00000000000000111111111111111111) (= (mask!8420 thiss!1248) #b00000000000001111111111111111111) (= (mask!8420 thiss!1248) #b00000000000011111111111111111111) (= (mask!8420 thiss!1248) #b00000000000111111111111111111111) (= (mask!8420 thiss!1248) #b00000000001111111111111111111111) (= (mask!8420 thiss!1248) #b00000000011111111111111111111111) (= (mask!8420 thiss!1248) #b00000000111111111111111111111111) (= (mask!8420 thiss!1248) #b00000001111111111111111111111111) (= (mask!8420 thiss!1248) #b00000011111111111111111111111111) (= (mask!8420 thiss!1248) #b00000111111111111111111111111111) (= (mask!8420 thiss!1248) #b00001111111111111111111111111111) (= (mask!8420 thiss!1248) #b00011111111111111111111111111111) (= (mask!8420 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8420 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!172375 d!52371))

(declare-fun d!52373 () Bool)

(declare-fun res!81848 () Bool)

(declare-fun e!113828 () Bool)

(assert (=> d!52373 (=> (not res!81848) (not e!113828))))

(declare-fun simpleValid!140 (LongMapFixedSize!2254) Bool)

(assert (=> d!52373 (= res!81848 (simpleValid!140 thiss!1248))))

(assert (=> d!52373 (= (valid!976 thiss!1248) e!113828)))

(declare-fun b!172427 () Bool)

(declare-fun res!81849 () Bool)

(assert (=> b!172427 (=> (not res!81849) (not e!113828))))

(declare-fun arrayCountValidKeys!0 (array!7169 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!172427 (= res!81849 (= (arrayCountValidKeys!0 (_keys!5409 thiss!1248) #b00000000000000000000000000000000 (size!3704 (_keys!5409 thiss!1248))) (_size!1176 thiss!1248)))))

(declare-fun b!172428 () Bool)

(declare-fun res!81850 () Bool)

(assert (=> b!172428 (=> (not res!81850) (not e!113828))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7169 (_ BitVec 32)) Bool)

(assert (=> b!172428 (= res!81850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5409 thiss!1248) (mask!8420 thiss!1248)))))

(declare-fun b!172429 () Bool)

(declare-datatypes ((List!2210 0))(
  ( (Nil!2207) (Cons!2206 (h!2823 (_ BitVec 64)) (t!7008 List!2210)) )
))
(declare-fun arrayNoDuplicates!0 (array!7169 (_ BitVec 32) List!2210) Bool)

(assert (=> b!172429 (= e!113828 (arrayNoDuplicates!0 (_keys!5409 thiss!1248) #b00000000000000000000000000000000 Nil!2207))))

(assert (= (and d!52373 res!81848) b!172427))

(assert (= (and b!172427 res!81849) b!172428))

(assert (= (and b!172428 res!81850) b!172429))

(declare-fun m!200679 () Bool)

(assert (=> d!52373 m!200679))

(declare-fun m!200681 () Bool)

(assert (=> b!172427 m!200681))

(declare-fun m!200683 () Bool)

(assert (=> b!172428 m!200683))

(declare-fun m!200685 () Bool)

(assert (=> b!172429 m!200685))

(assert (=> start!17186 d!52373))

(declare-fun d!52375 () Bool)

(assert (=> d!52375 (= (array_inv!2195 (_keys!5409 thiss!1248)) (bvsge (size!3704 (_keys!5409 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!172374 d!52375))

(declare-fun d!52377 () Bool)

(assert (=> d!52377 (= (array_inv!2196 (_values!3556 thiss!1248)) (bvsge (size!3705 (_values!3556 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!172374 d!52377))

(declare-fun b!172437 () Bool)

(declare-fun e!113833 () Bool)

(assert (=> b!172437 (= e!113833 tp_is_empty!4033)))

(declare-fun mapIsEmpty!6871 () Bool)

(declare-fun mapRes!6871 () Bool)

(assert (=> mapIsEmpty!6871 mapRes!6871))

(declare-fun condMapEmpty!6871 () Bool)

(declare-fun mapDefault!6871 () ValueCell!1673)

(assert (=> mapNonEmpty!6862 (= condMapEmpty!6871 (= mapRest!6862 ((as const (Array (_ BitVec 32) ValueCell!1673)) mapDefault!6871)))))

(assert (=> mapNonEmpty!6862 (= tp!15433 (and e!113833 mapRes!6871))))

(declare-fun b!172436 () Bool)

(declare-fun e!113834 () Bool)

(assert (=> b!172436 (= e!113834 tp_is_empty!4033)))

(declare-fun mapNonEmpty!6871 () Bool)

(declare-fun tp!15448 () Bool)

(assert (=> mapNonEmpty!6871 (= mapRes!6871 (and tp!15448 e!113834))))

(declare-fun mapValue!6871 () ValueCell!1673)

(declare-fun mapRest!6871 () (Array (_ BitVec 32) ValueCell!1673))

(declare-fun mapKey!6871 () (_ BitVec 32))

(assert (=> mapNonEmpty!6871 (= mapRest!6862 (store mapRest!6871 mapKey!6871 mapValue!6871))))

(assert (= (and mapNonEmpty!6862 condMapEmpty!6871) mapIsEmpty!6871))

(assert (= (and mapNonEmpty!6862 (not condMapEmpty!6871)) mapNonEmpty!6871))

(assert (= (and mapNonEmpty!6871 ((_ is ValueCellFull!1673) mapValue!6871)) b!172436))

(assert (= (and mapNonEmpty!6862 ((_ is ValueCellFull!1673) mapDefault!6871)) b!172437))

(declare-fun m!200687 () Bool)

(assert (=> mapNonEmpty!6871 m!200687))

(check-sat (not b!172429) (not b_next!4261) tp_is_empty!4033 (not d!52373) (not b!172428) (not b!172427) (not mapNonEmpty!6871) b_and!10675)
(check-sat b_and!10675 (not b_next!4261))
(get-model)

(declare-fun b!172448 () Bool)

(declare-fun e!113844 () Bool)

(declare-fun e!113845 () Bool)

(assert (=> b!172448 (= e!113844 e!113845)))

(declare-fun c!30840 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!172448 (= c!30840 (validKeyInArray!0 (select (arr!3406 (_keys!5409 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17506 () Bool)

(declare-fun call!17509 () Bool)

(assert (=> bm!17506 (= call!17509 (arrayNoDuplicates!0 (_keys!5409 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30840 (Cons!2206 (select (arr!3406 (_keys!5409 thiss!1248)) #b00000000000000000000000000000000) Nil!2207) Nil!2207)))))

(declare-fun b!172449 () Bool)

(declare-fun e!113846 () Bool)

(assert (=> b!172449 (= e!113846 e!113844)))

(declare-fun res!81859 () Bool)

(assert (=> b!172449 (=> (not res!81859) (not e!113844))))

(declare-fun e!113843 () Bool)

(assert (=> b!172449 (= res!81859 (not e!113843))))

(declare-fun res!81857 () Bool)

(assert (=> b!172449 (=> (not res!81857) (not e!113843))))

(assert (=> b!172449 (= res!81857 (validKeyInArray!0 (select (arr!3406 (_keys!5409 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!52379 () Bool)

(declare-fun res!81858 () Bool)

(assert (=> d!52379 (=> res!81858 e!113846)))

(assert (=> d!52379 (= res!81858 (bvsge #b00000000000000000000000000000000 (size!3704 (_keys!5409 thiss!1248))))))

(assert (=> d!52379 (= (arrayNoDuplicates!0 (_keys!5409 thiss!1248) #b00000000000000000000000000000000 Nil!2207) e!113846)))

(declare-fun b!172450 () Bool)

(assert (=> b!172450 (= e!113845 call!17509)))

(declare-fun b!172451 () Bool)

(assert (=> b!172451 (= e!113845 call!17509)))

(declare-fun b!172452 () Bool)

(declare-fun contains!1149 (List!2210 (_ BitVec 64)) Bool)

(assert (=> b!172452 (= e!113843 (contains!1149 Nil!2207 (select (arr!3406 (_keys!5409 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!52379 (not res!81858)) b!172449))

(assert (= (and b!172449 res!81857) b!172452))

(assert (= (and b!172449 res!81859) b!172448))

(assert (= (and b!172448 c!30840) b!172450))

(assert (= (and b!172448 (not c!30840)) b!172451))

(assert (= (or b!172450 b!172451) bm!17506))

(declare-fun m!200689 () Bool)

(assert (=> b!172448 m!200689))

(assert (=> b!172448 m!200689))

(declare-fun m!200691 () Bool)

(assert (=> b!172448 m!200691))

(assert (=> bm!17506 m!200689))

(declare-fun m!200693 () Bool)

(assert (=> bm!17506 m!200693))

(assert (=> b!172449 m!200689))

(assert (=> b!172449 m!200689))

(assert (=> b!172449 m!200691))

(assert (=> b!172452 m!200689))

(assert (=> b!172452 m!200689))

(declare-fun m!200695 () Bool)

(assert (=> b!172452 m!200695))

(assert (=> b!172429 d!52379))

(declare-fun b!172461 () Bool)

(declare-fun e!113855 () Bool)

(declare-fun call!17512 () Bool)

(assert (=> b!172461 (= e!113855 call!17512)))

(declare-fun b!172462 () Bool)

(declare-fun e!113854 () Bool)

(assert (=> b!172462 (= e!113854 e!113855)))

(declare-fun lt!85495 () (_ BitVec 64))

(assert (=> b!172462 (= lt!85495 (select (arr!3406 (_keys!5409 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5283 0))(
  ( (Unit!5284) )
))
(declare-fun lt!85497 () Unit!5283)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7169 (_ BitVec 64) (_ BitVec 32)) Unit!5283)

(assert (=> b!172462 (= lt!85497 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5409 thiss!1248) lt!85495 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7169 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!172462 (arrayContainsKey!0 (_keys!5409 thiss!1248) lt!85495 #b00000000000000000000000000000000)))

(declare-fun lt!85496 () Unit!5283)

(assert (=> b!172462 (= lt!85496 lt!85497)))

(declare-fun res!81864 () Bool)

(declare-datatypes ((SeekEntryResult!549 0))(
  ( (MissingZero!549 (index!4364 (_ BitVec 32))) (Found!549 (index!4365 (_ BitVec 32))) (Intermediate!549 (undefined!1361 Bool) (index!4366 (_ BitVec 32)) (x!19085 (_ BitVec 32))) (Undefined!549) (MissingVacant!549 (index!4367 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7169 (_ BitVec 32)) SeekEntryResult!549)

(assert (=> b!172462 (= res!81864 (= (seekEntryOrOpen!0 (select (arr!3406 (_keys!5409 thiss!1248)) #b00000000000000000000000000000000) (_keys!5409 thiss!1248) (mask!8420 thiss!1248)) (Found!549 #b00000000000000000000000000000000)))))

(assert (=> b!172462 (=> (not res!81864) (not e!113855))))

(declare-fun d!52381 () Bool)

(declare-fun res!81865 () Bool)

(declare-fun e!113853 () Bool)

(assert (=> d!52381 (=> res!81865 e!113853)))

(assert (=> d!52381 (= res!81865 (bvsge #b00000000000000000000000000000000 (size!3704 (_keys!5409 thiss!1248))))))

(assert (=> d!52381 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5409 thiss!1248) (mask!8420 thiss!1248)) e!113853)))

(declare-fun b!172463 () Bool)

(assert (=> b!172463 (= e!113853 e!113854)))

(declare-fun c!30843 () Bool)

(assert (=> b!172463 (= c!30843 (validKeyInArray!0 (select (arr!3406 (_keys!5409 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17509 () Bool)

(assert (=> bm!17509 (= call!17512 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5409 thiss!1248) (mask!8420 thiss!1248)))))

(declare-fun b!172464 () Bool)

(assert (=> b!172464 (= e!113854 call!17512)))

(assert (= (and d!52381 (not res!81865)) b!172463))

(assert (= (and b!172463 c!30843) b!172462))

(assert (= (and b!172463 (not c!30843)) b!172464))

(assert (= (and b!172462 res!81864) b!172461))

(assert (= (or b!172461 b!172464) bm!17509))

(assert (=> b!172462 m!200689))

(declare-fun m!200697 () Bool)

(assert (=> b!172462 m!200697))

(declare-fun m!200699 () Bool)

(assert (=> b!172462 m!200699))

(assert (=> b!172462 m!200689))

(declare-fun m!200701 () Bool)

(assert (=> b!172462 m!200701))

(assert (=> b!172463 m!200689))

(assert (=> b!172463 m!200689))

(assert (=> b!172463 m!200691))

(declare-fun m!200703 () Bool)

(assert (=> bm!17509 m!200703))

(assert (=> b!172428 d!52381))

(declare-fun bm!17512 () Bool)

(declare-fun call!17515 () (_ BitVec 32))

(assert (=> bm!17512 (= call!17515 (arrayCountValidKeys!0 (_keys!5409 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3704 (_keys!5409 thiss!1248))))))

(declare-fun d!52383 () Bool)

(declare-fun lt!85500 () (_ BitVec 32))

(assert (=> d!52383 (and (bvsge lt!85500 #b00000000000000000000000000000000) (bvsle lt!85500 (bvsub (size!3704 (_keys!5409 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!113861 () (_ BitVec 32))

(assert (=> d!52383 (= lt!85500 e!113861)))

(declare-fun c!30848 () Bool)

(assert (=> d!52383 (= c!30848 (bvsge #b00000000000000000000000000000000 (size!3704 (_keys!5409 thiss!1248))))))

(assert (=> d!52383 (and (bvsle #b00000000000000000000000000000000 (size!3704 (_keys!5409 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3704 (_keys!5409 thiss!1248)) (size!3704 (_keys!5409 thiss!1248))))))

(assert (=> d!52383 (= (arrayCountValidKeys!0 (_keys!5409 thiss!1248) #b00000000000000000000000000000000 (size!3704 (_keys!5409 thiss!1248))) lt!85500)))

(declare-fun b!172473 () Bool)

(declare-fun e!113860 () (_ BitVec 32))

(assert (=> b!172473 (= e!113861 e!113860)))

(declare-fun c!30849 () Bool)

(assert (=> b!172473 (= c!30849 (validKeyInArray!0 (select (arr!3406 (_keys!5409 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!172474 () Bool)

(assert (=> b!172474 (= e!113860 call!17515)))

(declare-fun b!172475 () Bool)

(assert (=> b!172475 (= e!113860 (bvadd #b00000000000000000000000000000001 call!17515))))

(declare-fun b!172476 () Bool)

(assert (=> b!172476 (= e!113861 #b00000000000000000000000000000000)))

(assert (= (and d!52383 c!30848) b!172476))

(assert (= (and d!52383 (not c!30848)) b!172473))

(assert (= (and b!172473 c!30849) b!172475))

(assert (= (and b!172473 (not c!30849)) b!172474))

(assert (= (or b!172475 b!172474) bm!17512))

(declare-fun m!200705 () Bool)

(assert (=> bm!17512 m!200705))

(assert (=> b!172473 m!200689))

(assert (=> b!172473 m!200689))

(assert (=> b!172473 m!200691))

(assert (=> b!172427 d!52383))

(declare-fun b!172488 () Bool)

(declare-fun e!113864 () Bool)

(assert (=> b!172488 (= e!113864 (and (bvsge (extraKeys!3312 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3312 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1176 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!172487 () Bool)

(declare-fun res!81874 () Bool)

(assert (=> b!172487 (=> (not res!81874) (not e!113864))))

(declare-fun size!3710 (LongMapFixedSize!2254) (_ BitVec 32))

(assert (=> b!172487 (= res!81874 (= (size!3710 thiss!1248) (bvadd (_size!1176 thiss!1248) (bvsdiv (bvadd (extraKeys!3312 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!172486 () Bool)

(declare-fun res!81877 () Bool)

(assert (=> b!172486 (=> (not res!81877) (not e!113864))))

(assert (=> b!172486 (= res!81877 (bvsge (size!3710 thiss!1248) (_size!1176 thiss!1248)))))

(declare-fun b!172485 () Bool)

(declare-fun res!81875 () Bool)

(assert (=> b!172485 (=> (not res!81875) (not e!113864))))

(assert (=> b!172485 (= res!81875 (and (= (size!3705 (_values!3556 thiss!1248)) (bvadd (mask!8420 thiss!1248) #b00000000000000000000000000000001)) (= (size!3704 (_keys!5409 thiss!1248)) (size!3705 (_values!3556 thiss!1248))) (bvsge (_size!1176 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1176 thiss!1248) (bvadd (mask!8420 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun d!52385 () Bool)

(declare-fun res!81876 () Bool)

(assert (=> d!52385 (=> (not res!81876) (not e!113864))))

(assert (=> d!52385 (= res!81876 (validMask!0 (mask!8420 thiss!1248)))))

(assert (=> d!52385 (= (simpleValid!140 thiss!1248) e!113864)))

(assert (= (and d!52385 res!81876) b!172485))

(assert (= (and b!172485 res!81875) b!172486))

(assert (= (and b!172486 res!81877) b!172487))

(assert (= (and b!172487 res!81874) b!172488))

(declare-fun m!200707 () Bool)

(assert (=> b!172487 m!200707))

(assert (=> b!172486 m!200707))

(assert (=> d!52385 m!200655))

(assert (=> d!52373 d!52385))

(declare-fun b!172490 () Bool)

(declare-fun e!113865 () Bool)

(assert (=> b!172490 (= e!113865 tp_is_empty!4033)))

(declare-fun mapIsEmpty!6872 () Bool)

(declare-fun mapRes!6872 () Bool)

(assert (=> mapIsEmpty!6872 mapRes!6872))

(declare-fun condMapEmpty!6872 () Bool)

(declare-fun mapDefault!6872 () ValueCell!1673)

(assert (=> mapNonEmpty!6871 (= condMapEmpty!6872 (= mapRest!6871 ((as const (Array (_ BitVec 32) ValueCell!1673)) mapDefault!6872)))))

(assert (=> mapNonEmpty!6871 (= tp!15448 (and e!113865 mapRes!6872))))

(declare-fun b!172489 () Bool)

(declare-fun e!113866 () Bool)

(assert (=> b!172489 (= e!113866 tp_is_empty!4033)))

(declare-fun mapNonEmpty!6872 () Bool)

(declare-fun tp!15449 () Bool)

(assert (=> mapNonEmpty!6872 (= mapRes!6872 (and tp!15449 e!113866))))

(declare-fun mapKey!6872 () (_ BitVec 32))

(declare-fun mapValue!6872 () ValueCell!1673)

(declare-fun mapRest!6872 () (Array (_ BitVec 32) ValueCell!1673))

(assert (=> mapNonEmpty!6872 (= mapRest!6871 (store mapRest!6872 mapKey!6872 mapValue!6872))))

(assert (= (and mapNonEmpty!6871 condMapEmpty!6872) mapIsEmpty!6872))

(assert (= (and mapNonEmpty!6871 (not condMapEmpty!6872)) mapNonEmpty!6872))

(assert (= (and mapNonEmpty!6872 ((_ is ValueCellFull!1673) mapValue!6872)) b!172489))

(assert (= (and mapNonEmpty!6871 ((_ is ValueCellFull!1673) mapDefault!6872)) b!172490))

(declare-fun m!200709 () Bool)

(assert (=> mapNonEmpty!6872 m!200709))

(check-sat (not b!172463) (not b!172448) (not bm!17512) (not b!172452) (not b!172473) (not b!172487) (not bm!17506) (not b!172449) (not b_next!4261) (not b!172462) tp_is_empty!4033 (not bm!17509) (not d!52385) (not b!172486) b_and!10675 (not mapNonEmpty!6872))
(check-sat b_and!10675 (not b_next!4261))

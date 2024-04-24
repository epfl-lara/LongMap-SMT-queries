; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16502 () Bool)

(assert start!16502)

(declare-fun b!164103 () Bool)

(declare-fun b_free!3817 () Bool)

(declare-fun b_next!3817 () Bool)

(assert (=> b!164103 (= b_free!3817 (not b_next!3817))))

(declare-fun tp!14048 () Bool)

(declare-fun b_and!10245 () Bool)

(assert (=> b!164103 (= tp!14048 b_and!10245)))

(declare-fun b!164102 () Bool)

(declare-fun res!77652 () Bool)

(declare-fun e!107669 () Bool)

(assert (=> b!164102 (=> (not res!77652) (not e!107669))))

(declare-datatypes ((V!4473 0))(
  ( (V!4474 (val!1854 Int)) )
))
(declare-datatypes ((ValueCell!1466 0))(
  ( (ValueCellFull!1466 (v!3720 V!4473)) (EmptyCell!1466) )
))
(declare-datatypes ((array!6319 0))(
  ( (array!6320 (arr!2996 (Array (_ BitVec 32) (_ BitVec 64))) (size!3284 (_ BitVec 32))) )
))
(declare-datatypes ((array!6321 0))(
  ( (array!6322 (arr!2997 (Array (_ BitVec 32) ValueCell!1466)) (size!3285 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1840 0))(
  ( (LongMapFixedSize!1841 (defaultEntry!3362 Int) (mask!8044 (_ BitVec 32)) (extraKeys!3103 (_ BitVec 32)) (zeroValue!3205 V!4473) (minValue!3205 V!4473) (_size!969 (_ BitVec 32)) (_keys!5185 array!6319) (_values!3345 array!6321) (_vacant!969 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1840)

(assert (=> b!164102 (= res!77652 (and (= (size!3285 (_values!3345 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8044 thiss!1248))) (= (size!3284 (_keys!5185 thiss!1248)) (size!3285 (_values!3345 thiss!1248))) (bvsge (mask!8044 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3103 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3103 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun tp_is_empty!3619 () Bool)

(declare-fun e!107672 () Bool)

(declare-fun e!107666 () Bool)

(declare-fun array_inv!1923 (array!6319) Bool)

(declare-fun array_inv!1924 (array!6321) Bool)

(assert (=> b!164103 (= e!107672 (and tp!14048 tp_is_empty!3619 (array_inv!1923 (_keys!5185 thiss!1248)) (array_inv!1924 (_values!3345 thiss!1248)) e!107666))))

(declare-fun b!164104 () Bool)

(declare-fun res!77647 () Bool)

(assert (=> b!164104 (=> (not res!77647) (not e!107669))))

(declare-datatypes ((List!1991 0))(
  ( (Nil!1988) (Cons!1987 (h!2604 (_ BitVec 64)) (t!6785 List!1991)) )
))
(declare-fun arrayNoDuplicates!0 (array!6319 (_ BitVec 32) List!1991) Bool)

(assert (=> b!164104 (= res!77647 (arrayNoDuplicates!0 (_keys!5185 thiss!1248) #b00000000000000000000000000000000 Nil!1988))))

(declare-fun b!164105 () Bool)

(declare-fun e!107670 () Bool)

(declare-fun mapRes!6144 () Bool)

(assert (=> b!164105 (= e!107666 (and e!107670 mapRes!6144))))

(declare-fun condMapEmpty!6144 () Bool)

(declare-fun mapDefault!6144 () ValueCell!1466)

(assert (=> b!164105 (= condMapEmpty!6144 (= (arr!2997 (_values!3345 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1466)) mapDefault!6144)))))

(declare-fun b!164106 () Bool)

(declare-fun e!107667 () Bool)

(assert (=> b!164106 (= e!107667 e!107669)))

(declare-fun res!77650 () Bool)

(assert (=> b!164106 (=> (not res!77650) (not e!107669))))

(declare-datatypes ((SeekEntryResult!405 0))(
  ( (MissingZero!405 (index!3788 (_ BitVec 32))) (Found!405 (index!3789 (_ BitVec 32))) (Intermediate!405 (undefined!1217 Bool) (index!3790 (_ BitVec 32)) (x!18193 (_ BitVec 32))) (Undefined!405) (MissingVacant!405 (index!3791 (_ BitVec 32))) )
))
(declare-fun lt!82878 () SeekEntryResult!405)

(get-info :version)

(assert (=> b!164106 (= res!77650 (and (not ((_ is Undefined!405) lt!82878)) (not ((_ is MissingVacant!405) lt!82878)) (not ((_ is MissingZero!405) lt!82878)) ((_ is Found!405) lt!82878)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6319 (_ BitVec 32)) SeekEntryResult!405)

(assert (=> b!164106 (= lt!82878 (seekEntryOrOpen!0 key!828 (_keys!5185 thiss!1248) (mask!8044 thiss!1248)))))

(declare-fun b!164107 () Bool)

(declare-fun res!77649 () Bool)

(assert (=> b!164107 (=> (not res!77649) (not e!107667))))

(assert (=> b!164107 (= res!77649 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!6144 () Bool)

(declare-fun tp!14049 () Bool)

(declare-fun e!107671 () Bool)

(assert (=> mapNonEmpty!6144 (= mapRes!6144 (and tp!14049 e!107671))))

(declare-fun mapValue!6144 () ValueCell!1466)

(declare-fun mapRest!6144 () (Array (_ BitVec 32) ValueCell!1466))

(declare-fun mapKey!6144 () (_ BitVec 32))

(assert (=> mapNonEmpty!6144 (= (arr!2997 (_values!3345 thiss!1248)) (store mapRest!6144 mapKey!6144 mapValue!6144))))

(declare-fun b!164108 () Bool)

(declare-fun res!77651 () Bool)

(assert (=> b!164108 (=> (not res!77651) (not e!107669))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!164108 (= res!77651 (validMask!0 (mask!8044 thiss!1248)))))

(declare-fun b!164109 () Bool)

(assert (=> b!164109 (= e!107670 tp_is_empty!3619)))

(declare-fun res!77646 () Bool)

(assert (=> start!16502 (=> (not res!77646) (not e!107667))))

(declare-fun valid!841 (LongMapFixedSize!1840) Bool)

(assert (=> start!16502 (= res!77646 (valid!841 thiss!1248))))

(assert (=> start!16502 e!107667))

(assert (=> start!16502 e!107672))

(assert (=> start!16502 true))

(declare-fun b!164110 () Bool)

(assert (=> b!164110 (= e!107671 tp_is_empty!3619)))

(declare-fun mapIsEmpty!6144 () Bool)

(assert (=> mapIsEmpty!6144 mapRes!6144))

(declare-fun b!164111 () Bool)

(declare-fun res!77648 () Bool)

(assert (=> b!164111 (=> (not res!77648) (not e!107669))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6319 (_ BitVec 32)) Bool)

(assert (=> b!164111 (= res!77648 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5185 thiss!1248) (mask!8044 thiss!1248)))))

(declare-fun b!164112 () Bool)

(assert (=> b!164112 (= e!107669 (bvsgt #b00000000000000000000000000000000 (size!3284 (_keys!5185 thiss!1248))))))

(assert (= (and start!16502 res!77646) b!164107))

(assert (= (and b!164107 res!77649) b!164106))

(assert (= (and b!164106 res!77650) b!164108))

(assert (= (and b!164108 res!77651) b!164102))

(assert (= (and b!164102 res!77652) b!164111))

(assert (= (and b!164111 res!77648) b!164104))

(assert (= (and b!164104 res!77647) b!164112))

(assert (= (and b!164105 condMapEmpty!6144) mapIsEmpty!6144))

(assert (= (and b!164105 (not condMapEmpty!6144)) mapNonEmpty!6144))

(assert (= (and mapNonEmpty!6144 ((_ is ValueCellFull!1466) mapValue!6144)) b!164110))

(assert (= (and b!164105 ((_ is ValueCellFull!1466) mapDefault!6144)) b!164109))

(assert (= b!164103 b!164105))

(assert (= start!16502 b!164103))

(declare-fun m!194609 () Bool)

(assert (=> b!164108 m!194609))

(declare-fun m!194611 () Bool)

(assert (=> mapNonEmpty!6144 m!194611))

(declare-fun m!194613 () Bool)

(assert (=> b!164111 m!194613))

(declare-fun m!194615 () Bool)

(assert (=> b!164104 m!194615))

(declare-fun m!194617 () Bool)

(assert (=> start!16502 m!194617))

(declare-fun m!194619 () Bool)

(assert (=> b!164106 m!194619))

(declare-fun m!194621 () Bool)

(assert (=> b!164103 m!194621))

(declare-fun m!194623 () Bool)

(assert (=> b!164103 m!194623))

(check-sat (not mapNonEmpty!6144) (not b!164103) (not b!164108) (not b!164104) tp_is_empty!3619 (not b_next!3817) b_and!10245 (not b!164106) (not start!16502) (not b!164111))
(check-sat b_and!10245 (not b_next!3817))
(get-model)

(declare-fun d!51589 () Bool)

(assert (=> d!51589 (= (validMask!0 (mask!8044 thiss!1248)) (and (or (= (mask!8044 thiss!1248) #b00000000000000000000000000000111) (= (mask!8044 thiss!1248) #b00000000000000000000000000001111) (= (mask!8044 thiss!1248) #b00000000000000000000000000011111) (= (mask!8044 thiss!1248) #b00000000000000000000000000111111) (= (mask!8044 thiss!1248) #b00000000000000000000000001111111) (= (mask!8044 thiss!1248) #b00000000000000000000000011111111) (= (mask!8044 thiss!1248) #b00000000000000000000000111111111) (= (mask!8044 thiss!1248) #b00000000000000000000001111111111) (= (mask!8044 thiss!1248) #b00000000000000000000011111111111) (= (mask!8044 thiss!1248) #b00000000000000000000111111111111) (= (mask!8044 thiss!1248) #b00000000000000000001111111111111) (= (mask!8044 thiss!1248) #b00000000000000000011111111111111) (= (mask!8044 thiss!1248) #b00000000000000000111111111111111) (= (mask!8044 thiss!1248) #b00000000000000001111111111111111) (= (mask!8044 thiss!1248) #b00000000000000011111111111111111) (= (mask!8044 thiss!1248) #b00000000000000111111111111111111) (= (mask!8044 thiss!1248) #b00000000000001111111111111111111) (= (mask!8044 thiss!1248) #b00000000000011111111111111111111) (= (mask!8044 thiss!1248) #b00000000000111111111111111111111) (= (mask!8044 thiss!1248) #b00000000001111111111111111111111) (= (mask!8044 thiss!1248) #b00000000011111111111111111111111) (= (mask!8044 thiss!1248) #b00000000111111111111111111111111) (= (mask!8044 thiss!1248) #b00000001111111111111111111111111) (= (mask!8044 thiss!1248) #b00000011111111111111111111111111) (= (mask!8044 thiss!1248) #b00000111111111111111111111111111) (= (mask!8044 thiss!1248) #b00001111111111111111111111111111) (= (mask!8044 thiss!1248) #b00011111111111111111111111111111) (= (mask!8044 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8044 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!164108 d!51589))

(declare-fun b!164189 () Bool)

(declare-fun e!107725 () Bool)

(declare-fun call!17320 () Bool)

(assert (=> b!164189 (= e!107725 call!17320)))

(declare-fun b!164190 () Bool)

(declare-fun e!107723 () Bool)

(declare-fun contains!1033 (List!1991 (_ BitVec 64)) Bool)

(assert (=> b!164190 (= e!107723 (contains!1033 Nil!1988 (select (arr!2996 (_keys!5185 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!164191 () Bool)

(assert (=> b!164191 (= e!107725 call!17320)))

(declare-fun d!51591 () Bool)

(declare-fun res!77703 () Bool)

(declare-fun e!107724 () Bool)

(assert (=> d!51591 (=> res!77703 e!107724)))

(assert (=> d!51591 (= res!77703 (bvsge #b00000000000000000000000000000000 (size!3284 (_keys!5185 thiss!1248))))))

(assert (=> d!51591 (= (arrayNoDuplicates!0 (_keys!5185 thiss!1248) #b00000000000000000000000000000000 Nil!1988) e!107724)))

(declare-fun bm!17317 () Bool)

(declare-fun c!30194 () Bool)

(assert (=> bm!17317 (= call!17320 (arrayNoDuplicates!0 (_keys!5185 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30194 (Cons!1987 (select (arr!2996 (_keys!5185 thiss!1248)) #b00000000000000000000000000000000) Nil!1988) Nil!1988)))))

(declare-fun b!164192 () Bool)

(declare-fun e!107726 () Bool)

(assert (=> b!164192 (= e!107726 e!107725)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!164192 (= c!30194 (validKeyInArray!0 (select (arr!2996 (_keys!5185 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!164193 () Bool)

(assert (=> b!164193 (= e!107724 e!107726)))

(declare-fun res!77701 () Bool)

(assert (=> b!164193 (=> (not res!77701) (not e!107726))))

(assert (=> b!164193 (= res!77701 (not e!107723))))

(declare-fun res!77702 () Bool)

(assert (=> b!164193 (=> (not res!77702) (not e!107723))))

(assert (=> b!164193 (= res!77702 (validKeyInArray!0 (select (arr!2996 (_keys!5185 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51591 (not res!77703)) b!164193))

(assert (= (and b!164193 res!77702) b!164190))

(assert (= (and b!164193 res!77701) b!164192))

(assert (= (and b!164192 c!30194) b!164191))

(assert (= (and b!164192 (not c!30194)) b!164189))

(assert (= (or b!164191 b!164189) bm!17317))

(declare-fun m!194657 () Bool)

(assert (=> b!164190 m!194657))

(assert (=> b!164190 m!194657))

(declare-fun m!194659 () Bool)

(assert (=> b!164190 m!194659))

(assert (=> bm!17317 m!194657))

(declare-fun m!194661 () Bool)

(assert (=> bm!17317 m!194661))

(assert (=> b!164192 m!194657))

(assert (=> b!164192 m!194657))

(declare-fun m!194663 () Bool)

(assert (=> b!164192 m!194663))

(assert (=> b!164193 m!194657))

(assert (=> b!164193 m!194657))

(assert (=> b!164193 m!194663))

(assert (=> b!164104 d!51591))

(declare-fun d!51593 () Bool)

(assert (=> d!51593 (= (array_inv!1923 (_keys!5185 thiss!1248)) (bvsge (size!3284 (_keys!5185 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!164103 d!51593))

(declare-fun d!51595 () Bool)

(assert (=> d!51595 (= (array_inv!1924 (_values!3345 thiss!1248)) (bvsge (size!3285 (_values!3345 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!164103 d!51595))

(declare-fun b!164202 () Bool)

(declare-fun e!107735 () Bool)

(declare-fun e!107734 () Bool)

(assert (=> b!164202 (= e!107735 e!107734)))

(declare-fun lt!82893 () (_ BitVec 64))

(assert (=> b!164202 (= lt!82893 (select (arr!2996 (_keys!5185 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5054 0))(
  ( (Unit!5055) )
))
(declare-fun lt!82892 () Unit!5054)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!6319 (_ BitVec 64) (_ BitVec 32)) Unit!5054)

(assert (=> b!164202 (= lt!82892 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5185 thiss!1248) lt!82893 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!6319 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!164202 (arrayContainsKey!0 (_keys!5185 thiss!1248) lt!82893 #b00000000000000000000000000000000)))

(declare-fun lt!82891 () Unit!5054)

(assert (=> b!164202 (= lt!82891 lt!82892)))

(declare-fun res!77708 () Bool)

(assert (=> b!164202 (= res!77708 (= (seekEntryOrOpen!0 (select (arr!2996 (_keys!5185 thiss!1248)) #b00000000000000000000000000000000) (_keys!5185 thiss!1248) (mask!8044 thiss!1248)) (Found!405 #b00000000000000000000000000000000)))))

(assert (=> b!164202 (=> (not res!77708) (not e!107734))))

(declare-fun b!164203 () Bool)

(declare-fun e!107733 () Bool)

(assert (=> b!164203 (= e!107733 e!107735)))

(declare-fun c!30197 () Bool)

(assert (=> b!164203 (= c!30197 (validKeyInArray!0 (select (arr!2996 (_keys!5185 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!164204 () Bool)

(declare-fun call!17323 () Bool)

(assert (=> b!164204 (= e!107734 call!17323)))

(declare-fun d!51597 () Bool)

(declare-fun res!77709 () Bool)

(assert (=> d!51597 (=> res!77709 e!107733)))

(assert (=> d!51597 (= res!77709 (bvsge #b00000000000000000000000000000000 (size!3284 (_keys!5185 thiss!1248))))))

(assert (=> d!51597 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5185 thiss!1248) (mask!8044 thiss!1248)) e!107733)))

(declare-fun b!164205 () Bool)

(assert (=> b!164205 (= e!107735 call!17323)))

(declare-fun bm!17320 () Bool)

(assert (=> bm!17320 (= call!17323 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5185 thiss!1248) (mask!8044 thiss!1248)))))

(assert (= (and d!51597 (not res!77709)) b!164203))

(assert (= (and b!164203 c!30197) b!164202))

(assert (= (and b!164203 (not c!30197)) b!164205))

(assert (= (and b!164202 res!77708) b!164204))

(assert (= (or b!164204 b!164205) bm!17320))

(assert (=> b!164202 m!194657))

(declare-fun m!194665 () Bool)

(assert (=> b!164202 m!194665))

(declare-fun m!194667 () Bool)

(assert (=> b!164202 m!194667))

(assert (=> b!164202 m!194657))

(declare-fun m!194669 () Bool)

(assert (=> b!164202 m!194669))

(assert (=> b!164203 m!194657))

(assert (=> b!164203 m!194657))

(assert (=> b!164203 m!194663))

(declare-fun m!194671 () Bool)

(assert (=> bm!17320 m!194671))

(assert (=> b!164111 d!51597))

(declare-fun b!164218 () Bool)

(declare-fun e!107743 () SeekEntryResult!405)

(declare-fun lt!82902 () SeekEntryResult!405)

(assert (=> b!164218 (= e!107743 (MissingZero!405 (index!3790 lt!82902)))))

(declare-fun b!164219 () Bool)

(declare-fun e!107744 () SeekEntryResult!405)

(declare-fun e!107742 () SeekEntryResult!405)

(assert (=> b!164219 (= e!107744 e!107742)))

(declare-fun lt!82900 () (_ BitVec 64))

(assert (=> b!164219 (= lt!82900 (select (arr!2996 (_keys!5185 thiss!1248)) (index!3790 lt!82902)))))

(declare-fun c!30206 () Bool)

(assert (=> b!164219 (= c!30206 (= lt!82900 key!828))))

(declare-fun b!164220 () Bool)

(assert (=> b!164220 (= e!107742 (Found!405 (index!3790 lt!82902)))))

(declare-fun b!164221 () Bool)

(declare-fun c!30205 () Bool)

(assert (=> b!164221 (= c!30205 (= lt!82900 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!164221 (= e!107742 e!107743)))

(declare-fun b!164222 () Bool)

(assert (=> b!164222 (= e!107744 Undefined!405)))

(declare-fun d!51599 () Bool)

(declare-fun lt!82901 () SeekEntryResult!405)

(assert (=> d!51599 (and (or ((_ is Undefined!405) lt!82901) (not ((_ is Found!405) lt!82901)) (and (bvsge (index!3789 lt!82901) #b00000000000000000000000000000000) (bvslt (index!3789 lt!82901) (size!3284 (_keys!5185 thiss!1248))))) (or ((_ is Undefined!405) lt!82901) ((_ is Found!405) lt!82901) (not ((_ is MissingZero!405) lt!82901)) (and (bvsge (index!3788 lt!82901) #b00000000000000000000000000000000) (bvslt (index!3788 lt!82901) (size!3284 (_keys!5185 thiss!1248))))) (or ((_ is Undefined!405) lt!82901) ((_ is Found!405) lt!82901) ((_ is MissingZero!405) lt!82901) (not ((_ is MissingVacant!405) lt!82901)) (and (bvsge (index!3791 lt!82901) #b00000000000000000000000000000000) (bvslt (index!3791 lt!82901) (size!3284 (_keys!5185 thiss!1248))))) (or ((_ is Undefined!405) lt!82901) (ite ((_ is Found!405) lt!82901) (= (select (arr!2996 (_keys!5185 thiss!1248)) (index!3789 lt!82901)) key!828) (ite ((_ is MissingZero!405) lt!82901) (= (select (arr!2996 (_keys!5185 thiss!1248)) (index!3788 lt!82901)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!405) lt!82901) (= (select (arr!2996 (_keys!5185 thiss!1248)) (index!3791 lt!82901)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!51599 (= lt!82901 e!107744)))

(declare-fun c!30204 () Bool)

(assert (=> d!51599 (= c!30204 (and ((_ is Intermediate!405) lt!82902) (undefined!1217 lt!82902)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6319 (_ BitVec 32)) SeekEntryResult!405)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51599 (= lt!82902 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8044 thiss!1248)) key!828 (_keys!5185 thiss!1248) (mask!8044 thiss!1248)))))

(assert (=> d!51599 (validMask!0 (mask!8044 thiss!1248))))

(assert (=> d!51599 (= (seekEntryOrOpen!0 key!828 (_keys!5185 thiss!1248) (mask!8044 thiss!1248)) lt!82901)))

(declare-fun b!164223 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6319 (_ BitVec 32)) SeekEntryResult!405)

(assert (=> b!164223 (= e!107743 (seekKeyOrZeroReturnVacant!0 (x!18193 lt!82902) (index!3790 lt!82902) (index!3790 lt!82902) key!828 (_keys!5185 thiss!1248) (mask!8044 thiss!1248)))))

(assert (= (and d!51599 c!30204) b!164222))

(assert (= (and d!51599 (not c!30204)) b!164219))

(assert (= (and b!164219 c!30206) b!164220))

(assert (= (and b!164219 (not c!30206)) b!164221))

(assert (= (and b!164221 c!30205) b!164218))

(assert (= (and b!164221 (not c!30205)) b!164223))

(declare-fun m!194673 () Bool)

(assert (=> b!164219 m!194673))

(declare-fun m!194675 () Bool)

(assert (=> d!51599 m!194675))

(declare-fun m!194677 () Bool)

(assert (=> d!51599 m!194677))

(assert (=> d!51599 m!194609))

(declare-fun m!194679 () Bool)

(assert (=> d!51599 m!194679))

(assert (=> d!51599 m!194675))

(declare-fun m!194681 () Bool)

(assert (=> d!51599 m!194681))

(declare-fun m!194683 () Bool)

(assert (=> d!51599 m!194683))

(declare-fun m!194685 () Bool)

(assert (=> b!164223 m!194685))

(assert (=> b!164106 d!51599))

(declare-fun d!51601 () Bool)

(declare-fun res!77716 () Bool)

(declare-fun e!107747 () Bool)

(assert (=> d!51601 (=> (not res!77716) (not e!107747))))

(declare-fun simpleValid!126 (LongMapFixedSize!1840) Bool)

(assert (=> d!51601 (= res!77716 (simpleValid!126 thiss!1248))))

(assert (=> d!51601 (= (valid!841 thiss!1248) e!107747)))

(declare-fun b!164230 () Bool)

(declare-fun res!77717 () Bool)

(assert (=> b!164230 (=> (not res!77717) (not e!107747))))

(declare-fun arrayCountValidKeys!0 (array!6319 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!164230 (= res!77717 (= (arrayCountValidKeys!0 (_keys!5185 thiss!1248) #b00000000000000000000000000000000 (size!3284 (_keys!5185 thiss!1248))) (_size!969 thiss!1248)))))

(declare-fun b!164231 () Bool)

(declare-fun res!77718 () Bool)

(assert (=> b!164231 (=> (not res!77718) (not e!107747))))

(assert (=> b!164231 (= res!77718 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5185 thiss!1248) (mask!8044 thiss!1248)))))

(declare-fun b!164232 () Bool)

(assert (=> b!164232 (= e!107747 (arrayNoDuplicates!0 (_keys!5185 thiss!1248) #b00000000000000000000000000000000 Nil!1988))))

(assert (= (and d!51601 res!77716) b!164230))

(assert (= (and b!164230 res!77717) b!164231))

(assert (= (and b!164231 res!77718) b!164232))

(declare-fun m!194687 () Bool)

(assert (=> d!51601 m!194687))

(declare-fun m!194689 () Bool)

(assert (=> b!164230 m!194689))

(assert (=> b!164231 m!194613))

(assert (=> b!164232 m!194615))

(assert (=> start!16502 d!51601))

(declare-fun condMapEmpty!6153 () Bool)

(declare-fun mapDefault!6153 () ValueCell!1466)

(assert (=> mapNonEmpty!6144 (= condMapEmpty!6153 (= mapRest!6144 ((as const (Array (_ BitVec 32) ValueCell!1466)) mapDefault!6153)))))

(declare-fun e!107753 () Bool)

(declare-fun mapRes!6153 () Bool)

(assert (=> mapNonEmpty!6144 (= tp!14049 (and e!107753 mapRes!6153))))

(declare-fun b!164240 () Bool)

(assert (=> b!164240 (= e!107753 tp_is_empty!3619)))

(declare-fun mapIsEmpty!6153 () Bool)

(assert (=> mapIsEmpty!6153 mapRes!6153))

(declare-fun b!164239 () Bool)

(declare-fun e!107752 () Bool)

(assert (=> b!164239 (= e!107752 tp_is_empty!3619)))

(declare-fun mapNonEmpty!6153 () Bool)

(declare-fun tp!14064 () Bool)

(assert (=> mapNonEmpty!6153 (= mapRes!6153 (and tp!14064 e!107752))))

(declare-fun mapValue!6153 () ValueCell!1466)

(declare-fun mapRest!6153 () (Array (_ BitVec 32) ValueCell!1466))

(declare-fun mapKey!6153 () (_ BitVec 32))

(assert (=> mapNonEmpty!6153 (= mapRest!6144 (store mapRest!6153 mapKey!6153 mapValue!6153))))

(assert (= (and mapNonEmpty!6144 condMapEmpty!6153) mapIsEmpty!6153))

(assert (= (and mapNonEmpty!6144 (not condMapEmpty!6153)) mapNonEmpty!6153))

(assert (= (and mapNonEmpty!6153 ((_ is ValueCellFull!1466) mapValue!6153)) b!164239))

(assert (= (and mapNonEmpty!6144 ((_ is ValueCellFull!1466) mapDefault!6153)) b!164240))

(declare-fun m!194691 () Bool)

(assert (=> mapNonEmpty!6153 m!194691))

(check-sat (not bm!17320) (not b!164231) (not bm!17317) (not b!164230) (not b!164232) (not b!164202) (not b_next!3817) b_and!10245 (not b!164203) (not b!164192) (not d!51601) (not d!51599) (not b!164193) (not mapNonEmpty!6153) tp_is_empty!3619 (not b!164223) (not b!164190))
(check-sat b_and!10245 (not b_next!3817))

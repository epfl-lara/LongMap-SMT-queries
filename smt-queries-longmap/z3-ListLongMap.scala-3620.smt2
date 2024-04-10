; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49870 () Bool)

(assert start!49870)

(declare-fun b!547454 () Bool)

(declare-fun res!341030 () Bool)

(declare-fun e!316331 () Bool)

(assert (=> b!547454 (=> (not res!341030) (not e!316331))))

(declare-datatypes ((array!34536 0))(
  ( (array!34537 (arr!16591 (Array (_ BitVec 32) (_ BitVec 64))) (size!16955 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34536)

(assert (=> b!547454 (= res!341030 (and (bvsle #b00000000000000000000000000000000 (size!16955 a!3118)) (bvslt (size!16955 a!3118) #b01111111111111111111111111111111)))))

(declare-fun b!547455 () Bool)

(declare-fun res!341025 () Bool)

(declare-fun e!316329 () Bool)

(assert (=> b!547455 (=> (not res!341025) (not e!316329))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34536 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!547455 (= res!341025 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!547456 () Bool)

(declare-fun res!341027 () Bool)

(assert (=> b!547456 (=> (not res!341027) (not e!316329))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!547456 (= res!341027 (validKeyInArray!0 k0!1914))))

(declare-fun b!547458 () Bool)

(assert (=> b!547458 (= e!316329 e!316331)))

(declare-fun res!341033 () Bool)

(assert (=> b!547458 (=> (not res!341033) (not e!316331))))

(declare-datatypes ((SeekEntryResult!5040 0))(
  ( (MissingZero!5040 (index!22387 (_ BitVec 32))) (Found!5040 (index!22388 (_ BitVec 32))) (Intermediate!5040 (undefined!5852 Bool) (index!22389 (_ BitVec 32)) (x!51332 (_ BitVec 32))) (Undefined!5040) (MissingVacant!5040 (index!22390 (_ BitVec 32))) )
))
(declare-fun lt!249541 () SeekEntryResult!5040)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!547458 (= res!341033 (or (= lt!249541 (MissingZero!5040 i!1132)) (= lt!249541 (MissingVacant!5040 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34536 (_ BitVec 32)) SeekEntryResult!5040)

(assert (=> b!547458 (= lt!249541 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!547459 () Bool)

(declare-fun e!316332 () Bool)

(declare-datatypes ((List!10671 0))(
  ( (Nil!10668) (Cons!10667 (h!11634 (_ BitVec 64)) (t!16899 List!10671)) )
))
(declare-fun contains!2820 (List!10671 (_ BitVec 64)) Bool)

(assert (=> b!547459 (= e!316332 (contains!2820 Nil!10668 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!341026 () Bool)

(assert (=> start!49870 (=> (not res!341026) (not e!316329))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49870 (= res!341026 (validMask!0 mask!3119))))

(assert (=> start!49870 e!316329))

(assert (=> start!49870 true))

(declare-fun array_inv!12387 (array!34536) Bool)

(assert (=> start!49870 (array_inv!12387 a!3118)))

(declare-fun b!547457 () Bool)

(declare-fun res!341028 () Bool)

(assert (=> b!547457 (=> (not res!341028) (not e!316331))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34536 (_ BitVec 32)) Bool)

(assert (=> b!547457 (= res!341028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!547460 () Bool)

(declare-fun res!341032 () Bool)

(assert (=> b!547460 (=> (not res!341032) (not e!316331))))

(declare-fun noDuplicate!223 (List!10671) Bool)

(assert (=> b!547460 (= res!341032 (noDuplicate!223 Nil!10668))))

(declare-fun b!547461 () Bool)

(declare-fun res!341031 () Bool)

(assert (=> b!547461 (=> (not res!341031) (not e!316329))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!547461 (= res!341031 (and (= (size!16955 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16955 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16955 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!547462 () Bool)

(declare-fun res!341029 () Bool)

(assert (=> b!547462 (=> (not res!341029) (not e!316329))))

(assert (=> b!547462 (= res!341029 (validKeyInArray!0 (select (arr!16591 a!3118) j!142)))))

(declare-fun b!547463 () Bool)

(assert (=> b!547463 (= e!316331 e!316332)))

(declare-fun res!341024 () Bool)

(assert (=> b!547463 (=> res!341024 e!316332)))

(assert (=> b!547463 (= res!341024 (contains!2820 Nil!10668 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!49870 res!341026) b!547461))

(assert (= (and b!547461 res!341031) b!547462))

(assert (= (and b!547462 res!341029) b!547456))

(assert (= (and b!547456 res!341027) b!547455))

(assert (= (and b!547455 res!341025) b!547458))

(assert (= (and b!547458 res!341033) b!547457))

(assert (= (and b!547457 res!341028) b!547454))

(assert (= (and b!547454 res!341030) b!547460))

(assert (= (and b!547460 res!341032) b!547463))

(assert (= (and b!547463 (not res!341024)) b!547459))

(declare-fun m!524713 () Bool)

(assert (=> b!547463 m!524713))

(declare-fun m!524715 () Bool)

(assert (=> b!547456 m!524715))

(declare-fun m!524717 () Bool)

(assert (=> b!547462 m!524717))

(assert (=> b!547462 m!524717))

(declare-fun m!524719 () Bool)

(assert (=> b!547462 m!524719))

(declare-fun m!524721 () Bool)

(assert (=> b!547460 m!524721))

(declare-fun m!524723 () Bool)

(assert (=> b!547455 m!524723))

(declare-fun m!524725 () Bool)

(assert (=> b!547459 m!524725))

(declare-fun m!524727 () Bool)

(assert (=> b!547458 m!524727))

(declare-fun m!524729 () Bool)

(assert (=> start!49870 m!524729))

(declare-fun m!524731 () Bool)

(assert (=> start!49870 m!524731))

(declare-fun m!524733 () Bool)

(assert (=> b!547457 m!524733))

(check-sat (not b!547457) (not b!547458) (not b!547455) (not b!547460) (not start!49870) (not b!547459) (not b!547462) (not b!547456) (not b!547463))
(check-sat)
(get-model)

(declare-fun d!82491 () Bool)

(assert (=> d!82491 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!547456 d!82491))

(declare-fun d!82493 () Bool)

(assert (=> d!82493 (= (validKeyInArray!0 (select (arr!16591 a!3118) j!142)) (and (not (= (select (arr!16591 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16591 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!547462 d!82493))

(declare-fun d!82495 () Bool)

(declare-fun res!341068 () Bool)

(declare-fun e!316349 () Bool)

(assert (=> d!82495 (=> res!341068 e!316349)))

(get-info :version)

(assert (=> d!82495 (= res!341068 ((_ is Nil!10668) Nil!10668))))

(assert (=> d!82495 (= (noDuplicate!223 Nil!10668) e!316349)))

(declare-fun b!547498 () Bool)

(declare-fun e!316350 () Bool)

(assert (=> b!547498 (= e!316349 e!316350)))

(declare-fun res!341069 () Bool)

(assert (=> b!547498 (=> (not res!341069) (not e!316350))))

(assert (=> b!547498 (= res!341069 (not (contains!2820 (t!16899 Nil!10668) (h!11634 Nil!10668))))))

(declare-fun b!547499 () Bool)

(assert (=> b!547499 (= e!316350 (noDuplicate!223 (t!16899 Nil!10668)))))

(assert (= (and d!82495 (not res!341068)) b!547498))

(assert (= (and b!547498 res!341069) b!547499))

(declare-fun m!524757 () Bool)

(assert (=> b!547498 m!524757))

(declare-fun m!524759 () Bool)

(assert (=> b!547499 m!524759))

(assert (=> b!547460 d!82495))

(declare-fun d!82497 () Bool)

(declare-fun res!341074 () Bool)

(declare-fun e!316355 () Bool)

(assert (=> d!82497 (=> res!341074 e!316355)))

(assert (=> d!82497 (= res!341074 (= (select (arr!16591 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!82497 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!316355)))

(declare-fun b!547504 () Bool)

(declare-fun e!316356 () Bool)

(assert (=> b!547504 (= e!316355 e!316356)))

(declare-fun res!341075 () Bool)

(assert (=> b!547504 (=> (not res!341075) (not e!316356))))

(assert (=> b!547504 (= res!341075 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16955 a!3118)))))

(declare-fun b!547505 () Bool)

(assert (=> b!547505 (= e!316356 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82497 (not res!341074)) b!547504))

(assert (= (and b!547504 res!341075) b!547505))

(declare-fun m!524761 () Bool)

(assert (=> d!82497 m!524761))

(declare-fun m!524763 () Bool)

(assert (=> b!547505 m!524763))

(assert (=> b!547455 d!82497))

(declare-fun d!82499 () Bool)

(declare-fun lt!249547 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!229 (List!10671) (InoxSet (_ BitVec 64)))

(assert (=> d!82499 (= lt!249547 (select (content!229 Nil!10668) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!316361 () Bool)

(assert (=> d!82499 (= lt!249547 e!316361)))

(declare-fun res!341080 () Bool)

(assert (=> d!82499 (=> (not res!341080) (not e!316361))))

(assert (=> d!82499 (= res!341080 ((_ is Cons!10667) Nil!10668))))

(assert (=> d!82499 (= (contains!2820 Nil!10668 #b1000000000000000000000000000000000000000000000000000000000000000) lt!249547)))

(declare-fun b!547510 () Bool)

(declare-fun e!316362 () Bool)

(assert (=> b!547510 (= e!316361 e!316362)))

(declare-fun res!341081 () Bool)

(assert (=> b!547510 (=> res!341081 e!316362)))

(assert (=> b!547510 (= res!341081 (= (h!11634 Nil!10668) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!547511 () Bool)

(assert (=> b!547511 (= e!316362 (contains!2820 (t!16899 Nil!10668) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!82499 res!341080) b!547510))

(assert (= (and b!547510 (not res!341081)) b!547511))

(declare-fun m!524765 () Bool)

(assert (=> d!82499 m!524765))

(declare-fun m!524767 () Bool)

(assert (=> d!82499 m!524767))

(declare-fun m!524769 () Bool)

(assert (=> b!547511 m!524769))

(assert (=> b!547459 d!82499))

(declare-fun d!82505 () Bool)

(assert (=> d!82505 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!49870 d!82505))

(declare-fun d!82523 () Bool)

(assert (=> d!82523 (= (array_inv!12387 a!3118) (bvsge (size!16955 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!49870 d!82523))

(declare-fun b!547582 () Bool)

(declare-fun e!316426 () Bool)

(declare-fun call!32174 () Bool)

(assert (=> b!547582 (= e!316426 call!32174)))

(declare-fun b!547583 () Bool)

(declare-fun e!316427 () Bool)

(assert (=> b!547583 (= e!316426 e!316427)))

(declare-fun lt!249579 () (_ BitVec 64))

(assert (=> b!547583 (= lt!249579 (select (arr!16591 a!3118) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16958 0))(
  ( (Unit!16959) )
))
(declare-fun lt!249580 () Unit!16958)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34536 (_ BitVec 64) (_ BitVec 32)) Unit!16958)

(assert (=> b!547583 (= lt!249580 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!249579 #b00000000000000000000000000000000))))

(assert (=> b!547583 (arrayContainsKey!0 a!3118 lt!249579 #b00000000000000000000000000000000)))

(declare-fun lt!249581 () Unit!16958)

(assert (=> b!547583 (= lt!249581 lt!249580)))

(declare-fun res!341136 () Bool)

(assert (=> b!547583 (= res!341136 (= (seekEntryOrOpen!0 (select (arr!16591 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5040 #b00000000000000000000000000000000)))))

(assert (=> b!547583 (=> (not res!341136) (not e!316427))))

(declare-fun d!82525 () Bool)

(declare-fun res!341137 () Bool)

(declare-fun e!316425 () Bool)

(assert (=> d!82525 (=> res!341137 e!316425)))

(assert (=> d!82525 (= res!341137 (bvsge #b00000000000000000000000000000000 (size!16955 a!3118)))))

(assert (=> d!82525 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!316425)))

(declare-fun b!547584 () Bool)

(assert (=> b!547584 (= e!316427 call!32174)))

(declare-fun b!547585 () Bool)

(assert (=> b!547585 (= e!316425 e!316426)))

(declare-fun c!63551 () Bool)

(assert (=> b!547585 (= c!63551 (validKeyInArray!0 (select (arr!16591 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32171 () Bool)

(assert (=> bm!32171 (= call!32174 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!82525 (not res!341137)) b!547585))

(assert (= (and b!547585 c!63551) b!547583))

(assert (= (and b!547585 (not c!63551)) b!547582))

(assert (= (and b!547583 res!341136) b!547584))

(assert (= (or b!547584 b!547582) bm!32171))

(assert (=> b!547583 m!524761))

(declare-fun m!524823 () Bool)

(assert (=> b!547583 m!524823))

(declare-fun m!524825 () Bool)

(assert (=> b!547583 m!524825))

(assert (=> b!547583 m!524761))

(declare-fun m!524827 () Bool)

(assert (=> b!547583 m!524827))

(assert (=> b!547585 m!524761))

(assert (=> b!547585 m!524761))

(declare-fun m!524829 () Bool)

(assert (=> b!547585 m!524829))

(declare-fun m!524831 () Bool)

(assert (=> bm!32171 m!524831))

(assert (=> b!547457 d!82525))

(declare-fun e!316454 () SeekEntryResult!5040)

(declare-fun b!547636 () Bool)

(declare-fun lt!249607 () SeekEntryResult!5040)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34536 (_ BitVec 32)) SeekEntryResult!5040)

(assert (=> b!547636 (= e!316454 (seekKeyOrZeroReturnVacant!0 (x!51332 lt!249607) (index!22389 lt!249607) (index!22389 lt!249607) k0!1914 a!3118 mask!3119))))

(declare-fun b!547637 () Bool)

(assert (=> b!547637 (= e!316454 (MissingZero!5040 (index!22389 lt!249607)))))

(declare-fun b!547638 () Bool)

(declare-fun e!316455 () SeekEntryResult!5040)

(declare-fun e!316456 () SeekEntryResult!5040)

(assert (=> b!547638 (= e!316455 e!316456)))

(declare-fun lt!249608 () (_ BitVec 64))

(assert (=> b!547638 (= lt!249608 (select (arr!16591 a!3118) (index!22389 lt!249607)))))

(declare-fun c!63577 () Bool)

(assert (=> b!547638 (= c!63577 (= lt!249608 k0!1914))))

(declare-fun b!547639 () Bool)

(assert (=> b!547639 (= e!316456 (Found!5040 (index!22389 lt!249607)))))

(declare-fun b!547640 () Bool)

(assert (=> b!547640 (= e!316455 Undefined!5040)))

(declare-fun d!82535 () Bool)

(declare-fun lt!249609 () SeekEntryResult!5040)

(assert (=> d!82535 (and (or ((_ is Undefined!5040) lt!249609) (not ((_ is Found!5040) lt!249609)) (and (bvsge (index!22388 lt!249609) #b00000000000000000000000000000000) (bvslt (index!22388 lt!249609) (size!16955 a!3118)))) (or ((_ is Undefined!5040) lt!249609) ((_ is Found!5040) lt!249609) (not ((_ is MissingZero!5040) lt!249609)) (and (bvsge (index!22387 lt!249609) #b00000000000000000000000000000000) (bvslt (index!22387 lt!249609) (size!16955 a!3118)))) (or ((_ is Undefined!5040) lt!249609) ((_ is Found!5040) lt!249609) ((_ is MissingZero!5040) lt!249609) (not ((_ is MissingVacant!5040) lt!249609)) (and (bvsge (index!22390 lt!249609) #b00000000000000000000000000000000) (bvslt (index!22390 lt!249609) (size!16955 a!3118)))) (or ((_ is Undefined!5040) lt!249609) (ite ((_ is Found!5040) lt!249609) (= (select (arr!16591 a!3118) (index!22388 lt!249609)) k0!1914) (ite ((_ is MissingZero!5040) lt!249609) (= (select (arr!16591 a!3118) (index!22387 lt!249609)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5040) lt!249609) (= (select (arr!16591 a!3118) (index!22390 lt!249609)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!82535 (= lt!249609 e!316455)))

(declare-fun c!63576 () Bool)

(assert (=> d!82535 (= c!63576 (and ((_ is Intermediate!5040) lt!249607) (undefined!5852 lt!249607)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34536 (_ BitVec 32)) SeekEntryResult!5040)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!82535 (= lt!249607 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!82535 (validMask!0 mask!3119)))

(assert (=> d!82535 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!249609)))

(declare-fun b!547641 () Bool)

(declare-fun c!63578 () Bool)

(assert (=> b!547641 (= c!63578 (= lt!249608 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!547641 (= e!316456 e!316454)))

(assert (= (and d!82535 c!63576) b!547640))

(assert (= (and d!82535 (not c!63576)) b!547638))

(assert (= (and b!547638 c!63577) b!547639))

(assert (= (and b!547638 (not c!63577)) b!547641))

(assert (= (and b!547641 c!63578) b!547637))

(assert (= (and b!547641 (not c!63578)) b!547636))

(declare-fun m!524865 () Bool)

(assert (=> b!547636 m!524865))

(declare-fun m!524867 () Bool)

(assert (=> b!547638 m!524867))

(declare-fun m!524869 () Bool)

(assert (=> d!82535 m!524869))

(declare-fun m!524871 () Bool)

(assert (=> d!82535 m!524871))

(assert (=> d!82535 m!524869))

(declare-fun m!524873 () Bool)

(assert (=> d!82535 m!524873))

(declare-fun m!524875 () Bool)

(assert (=> d!82535 m!524875))

(assert (=> d!82535 m!524729))

(declare-fun m!524877 () Bool)

(assert (=> d!82535 m!524877))

(assert (=> b!547458 d!82535))

(declare-fun d!82547 () Bool)

(declare-fun lt!249610 () Bool)

(assert (=> d!82547 (= lt!249610 (select (content!229 Nil!10668) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!316457 () Bool)

(assert (=> d!82547 (= lt!249610 e!316457)))

(declare-fun res!341140 () Bool)

(assert (=> d!82547 (=> (not res!341140) (not e!316457))))

(assert (=> d!82547 (= res!341140 ((_ is Cons!10667) Nil!10668))))

(assert (=> d!82547 (= (contains!2820 Nil!10668 #b0000000000000000000000000000000000000000000000000000000000000000) lt!249610)))

(declare-fun b!547642 () Bool)

(declare-fun e!316458 () Bool)

(assert (=> b!547642 (= e!316457 e!316458)))

(declare-fun res!341141 () Bool)

(assert (=> b!547642 (=> res!341141 e!316458)))

(assert (=> b!547642 (= res!341141 (= (h!11634 Nil!10668) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!547643 () Bool)

(assert (=> b!547643 (= e!316458 (contains!2820 (t!16899 Nil!10668) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!82547 res!341140) b!547642))

(assert (= (and b!547642 (not res!341141)) b!547643))

(assert (=> d!82547 m!524765))

(declare-fun m!524879 () Bool)

(assert (=> d!82547 m!524879))

(declare-fun m!524881 () Bool)

(assert (=> b!547643 m!524881))

(assert (=> b!547463 d!82547))

(check-sat (not d!82499) (not b!547505) (not b!547499) (not b!547636) (not b!547498) (not b!547511) (not b!547585) (not d!82535) (not d!82547) (not bm!32171) (not b!547643) (not b!547583))
(check-sat)

; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46618 () Bool)

(assert start!46618)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!300587 () Bool)

(declare-datatypes ((array!32987 0))(
  ( (array!32988 (arr!15863 (Array (_ BitVec 32) (_ BitVec 64))) (size!16227 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32987)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!514759 () Bool)

(declare-datatypes ((SeekEntryResult!4330 0))(
  ( (MissingZero!4330 (index!19508 (_ BitVec 32))) (Found!4330 (index!19509 (_ BitVec 32))) (Intermediate!4330 (undefined!5142 Bool) (index!19510 (_ BitVec 32)) (x!48471 (_ BitVec 32))) (Undefined!4330) (MissingVacant!4330 (index!19511 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32987 (_ BitVec 32)) SeekEntryResult!4330)

(assert (=> b!514759 (= e!300587 (= (seekEntryOrOpen!0 (select (arr!15863 a!3235) j!176) a!3235 mask!3524) (Found!4330 j!176)))))

(declare-fun b!514760 () Bool)

(declare-fun res!314511 () Bool)

(declare-fun e!300586 () Bool)

(assert (=> b!514760 (=> (not res!314511) (not e!300586))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!514760 (= res!314511 (validKeyInArray!0 k!2280))))

(declare-fun b!514761 () Bool)

(declare-fun res!314516 () Bool)

(declare-fun e!300584 () Bool)

(assert (=> b!514761 (=> (not res!314516) (not e!300584))))

(declare-datatypes ((List!10021 0))(
  ( (Nil!10018) (Cons!10017 (h!10912 (_ BitVec 64)) (t!16249 List!10021)) )
))
(declare-fun arrayNoDuplicates!0 (array!32987 (_ BitVec 32) List!10021) Bool)

(assert (=> b!514761 (= res!314516 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10018))))

(declare-fun res!314510 () Bool)

(assert (=> start!46618 (=> (not res!314510) (not e!300586))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46618 (= res!314510 (validMask!0 mask!3524))))

(assert (=> start!46618 e!300586))

(assert (=> start!46618 true))

(declare-fun array_inv!11659 (array!32987) Bool)

(assert (=> start!46618 (array_inv!11659 a!3235)))

(declare-fun b!514762 () Bool)

(declare-fun e!300585 () Bool)

(declare-fun lt!235658 () SeekEntryResult!4330)

(assert (=> b!514762 (= e!300585 (and (bvsge (index!19510 lt!235658) #b00000000000000000000000000000000) (bvslt (index!19510 lt!235658) (size!16227 a!3235))))))

(assert (=> b!514762 (and (bvslt (x!48471 lt!235658) #b01111111111111111111111111111110) (or (= (select (arr!15863 a!3235) (index!19510 lt!235658)) (select (arr!15863 a!3235) j!176)) (= (select (arr!15863 a!3235) (index!19510 lt!235658)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15863 a!3235) (index!19510 lt!235658)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!514763 () Bool)

(declare-fun res!314508 () Bool)

(assert (=> b!514763 (=> res!314508 e!300585)))

(assert (=> b!514763 (= res!314508 (or (undefined!5142 lt!235658) (not (is-Intermediate!4330 lt!235658))))))

(declare-fun b!514764 () Bool)

(declare-fun res!314514 () Bool)

(assert (=> b!514764 (=> (not res!314514) (not e!300586))))

(assert (=> b!514764 (= res!314514 (validKeyInArray!0 (select (arr!15863 a!3235) j!176)))))

(declare-fun b!514765 () Bool)

(declare-fun res!314513 () Bool)

(assert (=> b!514765 (=> (not res!314513) (not e!300584))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32987 (_ BitVec 32)) Bool)

(assert (=> b!514765 (= res!314513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!514766 () Bool)

(assert (=> b!514766 (= e!300584 (not e!300585))))

(declare-fun res!314506 () Bool)

(assert (=> b!514766 (=> res!314506 e!300585)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!235657 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32987 (_ BitVec 32)) SeekEntryResult!4330)

(assert (=> b!514766 (= res!314506 (= lt!235658 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235657 (select (store (arr!15863 a!3235) i!1204 k!2280) j!176) (array!32988 (store (arr!15863 a!3235) i!1204 k!2280) (size!16227 a!3235)) mask!3524)))))

(declare-fun lt!235659 () (_ BitVec 32))

(assert (=> b!514766 (= lt!235658 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235659 (select (arr!15863 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!514766 (= lt!235657 (toIndex!0 (select (store (arr!15863 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!514766 (= lt!235659 (toIndex!0 (select (arr!15863 a!3235) j!176) mask!3524))))

(assert (=> b!514766 e!300587))

(declare-fun res!314515 () Bool)

(assert (=> b!514766 (=> (not res!314515) (not e!300587))))

(assert (=> b!514766 (= res!314515 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15918 0))(
  ( (Unit!15919) )
))
(declare-fun lt!235656 () Unit!15918)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32987 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15918)

(assert (=> b!514766 (= lt!235656 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!514767 () Bool)

(declare-fun res!314507 () Bool)

(assert (=> b!514767 (=> (not res!314507) (not e!300586))))

(declare-fun arrayContainsKey!0 (array!32987 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!514767 (= res!314507 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!514768 () Bool)

(assert (=> b!514768 (= e!300586 e!300584)))

(declare-fun res!314509 () Bool)

(assert (=> b!514768 (=> (not res!314509) (not e!300584))))

(declare-fun lt!235660 () SeekEntryResult!4330)

(assert (=> b!514768 (= res!314509 (or (= lt!235660 (MissingZero!4330 i!1204)) (= lt!235660 (MissingVacant!4330 i!1204))))))

(assert (=> b!514768 (= lt!235660 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!514769 () Bool)

(declare-fun res!314512 () Bool)

(assert (=> b!514769 (=> (not res!314512) (not e!300586))))

(assert (=> b!514769 (= res!314512 (and (= (size!16227 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16227 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16227 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!46618 res!314510) b!514769))

(assert (= (and b!514769 res!314512) b!514764))

(assert (= (and b!514764 res!314514) b!514760))

(assert (= (and b!514760 res!314511) b!514767))

(assert (= (and b!514767 res!314507) b!514768))

(assert (= (and b!514768 res!314509) b!514765))

(assert (= (and b!514765 res!314513) b!514761))

(assert (= (and b!514761 res!314516) b!514766))

(assert (= (and b!514766 res!314515) b!514759))

(assert (= (and b!514766 (not res!314506)) b!514763))

(assert (= (and b!514763 (not res!314508)) b!514762))

(declare-fun m!496123 () Bool)

(assert (=> b!514768 m!496123))

(declare-fun m!496125 () Bool)

(assert (=> b!514767 m!496125))

(declare-fun m!496127 () Bool)

(assert (=> b!514759 m!496127))

(assert (=> b!514759 m!496127))

(declare-fun m!496129 () Bool)

(assert (=> b!514759 m!496129))

(assert (=> b!514764 m!496127))

(assert (=> b!514764 m!496127))

(declare-fun m!496131 () Bool)

(assert (=> b!514764 m!496131))

(declare-fun m!496133 () Bool)

(assert (=> b!514762 m!496133))

(assert (=> b!514762 m!496127))

(declare-fun m!496135 () Bool)

(assert (=> b!514765 m!496135))

(declare-fun m!496137 () Bool)

(assert (=> b!514760 m!496137))

(declare-fun m!496139 () Bool)

(assert (=> b!514766 m!496139))

(declare-fun m!496141 () Bool)

(assert (=> b!514766 m!496141))

(declare-fun m!496143 () Bool)

(assert (=> b!514766 m!496143))

(declare-fun m!496145 () Bool)

(assert (=> b!514766 m!496145))

(assert (=> b!514766 m!496127))

(declare-fun m!496147 () Bool)

(assert (=> b!514766 m!496147))

(assert (=> b!514766 m!496127))

(declare-fun m!496149 () Bool)

(assert (=> b!514766 m!496149))

(assert (=> b!514766 m!496139))

(declare-fun m!496151 () Bool)

(assert (=> b!514766 m!496151))

(assert (=> b!514766 m!496127))

(declare-fun m!496153 () Bool)

(assert (=> b!514766 m!496153))

(assert (=> b!514766 m!496139))

(declare-fun m!496155 () Bool)

(assert (=> b!514761 m!496155))

(declare-fun m!496157 () Bool)

(assert (=> start!46618 m!496157))

(declare-fun m!496159 () Bool)

(assert (=> start!46618 m!496159))

(push 1)

(assert (not b!514760))

(assert (not b!514768))

(assert (not b!514759))

(assert (not b!514761))

(assert (not b!514767))

(assert (not b!514764))

(assert (not b!514765))

(assert (not start!46618))

(assert (not b!514766))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79459 () Bool)

(declare-fun res!314527 () Bool)

(declare-fun e!300612 () Bool)

(assert (=> d!79459 (=> res!314527 e!300612)))

(assert (=> d!79459 (= res!314527 (= (select (arr!15863 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!79459 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!300612)))

(declare-fun b!514808 () Bool)

(declare-fun e!300613 () Bool)

(assert (=> b!514808 (= e!300612 e!300613)))

(declare-fun res!314528 () Bool)

(assert (=> b!514808 (=> (not res!314528) (not e!300613))))

(assert (=> b!514808 (= res!314528 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16227 a!3235)))))

(declare-fun b!514809 () Bool)

(assert (=> b!514809 (= e!300613 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79459 (not res!314527)) b!514808))

(assert (= (and b!514808 res!314528) b!514809))

(declare-fun m!496179 () Bool)

(assert (=> d!79459 m!496179))

(declare-fun m!496181 () Bool)

(assert (=> b!514809 m!496181))

(assert (=> b!514767 d!79459))

(declare-fun d!79461 () Bool)

(declare-fun res!314552 () Bool)

(declare-fun e!300643 () Bool)

(assert (=> d!79461 (=> res!314552 e!300643)))

(assert (=> d!79461 (= res!314552 (bvsge #b00000000000000000000000000000000 (size!16227 a!3235)))))

(assert (=> d!79461 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10018) e!300643)))

(declare-fun b!514849 () Bool)

(declare-fun e!300644 () Bool)

(declare-fun contains!2737 (List!10021 (_ BitVec 64)) Bool)

(assert (=> b!514849 (= e!300644 (contains!2737 Nil!10018 (select (arr!15863 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!514850 () Bool)

(declare-fun e!300645 () Bool)

(declare-fun e!300642 () Bool)

(assert (=> b!514850 (= e!300645 e!300642)))

(declare-fun c!60437 () Bool)

(assert (=> b!514850 (= c!60437 (validKeyInArray!0 (select (arr!15863 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31622 () Bool)

(declare-fun call!31625 () Bool)

(assert (=> bm!31622 (= call!31625 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60437 (Cons!10017 (select (arr!15863 a!3235) #b00000000000000000000000000000000) Nil!10018) Nil!10018)))))

(declare-fun b!514851 () Bool)

(assert (=> b!514851 (= e!300642 call!31625)))

(declare-fun b!514852 () Bool)

(assert (=> b!514852 (= e!300642 call!31625)))

(declare-fun b!514853 () Bool)

(assert (=> b!514853 (= e!300643 e!300645)))

(declare-fun res!314553 () Bool)

(assert (=> b!514853 (=> (not res!314553) (not e!300645))))

(assert (=> b!514853 (= res!314553 (not e!300644))))

(declare-fun res!314551 () Bool)

(assert (=> b!514853 (=> (not res!314551) (not e!300644))))

(assert (=> b!514853 (= res!314551 (validKeyInArray!0 (select (arr!15863 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!79461 (not res!314552)) b!514853))

(assert (= (and b!514853 res!314551) b!514849))

(assert (= (and b!514853 res!314553) b!514850))

(assert (= (and b!514850 c!60437) b!514852))

(assert (= (and b!514850 (not c!60437)) b!514851))

(assert (= (or b!514852 b!514851) bm!31622))

(assert (=> b!514849 m!496179))

(assert (=> b!514849 m!496179))

(declare-fun m!496203 () Bool)

(assert (=> b!514849 m!496203))

(assert (=> b!514850 m!496179))

(assert (=> b!514850 m!496179))

(declare-fun m!496205 () Bool)

(assert (=> b!514850 m!496205))

(assert (=> bm!31622 m!496179))

(declare-fun m!496207 () Bool)

(assert (=> bm!31622 m!496207))

(assert (=> b!514853 m!496179))

(assert (=> b!514853 m!496179))

(assert (=> b!514853 m!496205))

(assert (=> b!514761 d!79461))

(declare-fun d!79467 () Bool)

(declare-fun lt!235698 () (_ BitVec 32))

(declare-fun lt!235697 () (_ BitVec 32))

(assert (=> d!79467 (= lt!235698 (bvmul (bvxor lt!235697 (bvlshr lt!235697 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79467 (= lt!235697 ((_ extract 31 0) (bvand (bvxor (select (arr!15863 a!3235) j!176) (bvlshr (select (arr!15863 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79467 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!314554 (let ((h!10914 ((_ extract 31 0) (bvand (bvxor (select (arr!15863 a!3235) j!176) (bvlshr (select (arr!15863 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48474 (bvmul (bvxor h!10914 (bvlshr h!10914 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48474 (bvlshr x!48474 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!314554 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!314554 #b00000000000000000000000000000000))))))

(assert (=> d!79467 (= (toIndex!0 (select (arr!15863 a!3235) j!176) mask!3524) (bvand (bvxor lt!235698 (bvlshr lt!235698 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!514766 d!79467))

(declare-fun e!300705 () SeekEntryResult!4330)

(declare-fun b!514942 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!514942 (= e!300705 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!235659 #b00000000000000000000000000000000 mask!3524) (select (arr!15863 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!514943 () Bool)

(assert (=> b!514943 (= e!300705 (Intermediate!4330 false lt!235659 #b00000000000000000000000000000000))))

(declare-fun b!514944 () Bool)

(declare-fun e!300703 () Bool)

(declare-fun e!300706 () Bool)

(assert (=> b!514944 (= e!300703 e!300706)))

(declare-fun res!314585 () Bool)

(declare-fun lt!235730 () SeekEntryResult!4330)

(assert (=> b!514944 (= res!314585 (and (is-Intermediate!4330 lt!235730) (not (undefined!5142 lt!235730)) (bvslt (x!48471 lt!235730) #b01111111111111111111111111111110) (bvsge (x!48471 lt!235730) #b00000000000000000000000000000000) (bvsge (x!48471 lt!235730) #b00000000000000000000000000000000)))))

(assert (=> b!514944 (=> (not res!314585) (not e!300706))))

(declare-fun b!514945 () Bool)

(assert (=> b!514945 (and (bvsge (index!19510 lt!235730) #b00000000000000000000000000000000) (bvslt (index!19510 lt!235730) (size!16227 a!3235)))))

(declare-fun res!314587 () Bool)

(assert (=> b!514945 (= res!314587 (= (select (arr!15863 a!3235) (index!19510 lt!235730)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!300702 () Bool)

(assert (=> b!514945 (=> res!314587 e!300702)))

(declare-fun b!514946 () Bool)

(assert (=> b!514946 (= e!300703 (bvsge (x!48471 lt!235730) #b01111111111111111111111111111110))))

(declare-fun b!514948 () Bool)

(assert (=> b!514948 (and (bvsge (index!19510 lt!235730) #b00000000000000000000000000000000) (bvslt (index!19510 lt!235730) (size!16227 a!3235)))))

(assert (=> b!514948 (= e!300702 (= (select (arr!15863 a!3235) (index!19510 lt!235730)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!514949 () Bool)

(assert (=> b!514949 (and (bvsge (index!19510 lt!235730) #b00000000000000000000000000000000) (bvslt (index!19510 lt!235730) (size!16227 a!3235)))))

(declare-fun res!314586 () Bool)

(assert (=> b!514949 (= res!314586 (= (select (arr!15863 a!3235) (index!19510 lt!235730)) (select (arr!15863 a!3235) j!176)))))

(assert (=> b!514949 (=> res!314586 e!300702)))

(assert (=> b!514949 (= e!300706 e!300702)))

(declare-fun b!514950 () Bool)

(declare-fun e!300704 () SeekEntryResult!4330)

(assert (=> b!514950 (= e!300704 (Intermediate!4330 true lt!235659 #b00000000000000000000000000000000))))

(declare-fun b!514947 () Bool)

(assert (=> b!514947 (= e!300704 e!300705)))

(declare-fun c!60469 () Bool)

(declare-fun lt!235729 () (_ BitVec 64))

(assert (=> b!514947 (= c!60469 (or (= lt!235729 (select (arr!15863 a!3235) j!176)) (= (bvadd lt!235729 lt!235729) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!79473 () Bool)

(assert (=> d!79473 e!300703))

(declare-fun c!60467 () Bool)

(assert (=> d!79473 (= c!60467 (and (is-Intermediate!4330 lt!235730) (undefined!5142 lt!235730)))))

(assert (=> d!79473 (= lt!235730 e!300704)))

(declare-fun c!60468 () Bool)

(assert (=> d!79473 (= c!60468 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79473 (= lt!235729 (select (arr!15863 a!3235) lt!235659))))

(assert (=> d!79473 (validMask!0 mask!3524)))

(assert (=> d!79473 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235659 (select (arr!15863 a!3235) j!176) a!3235 mask!3524) lt!235730)))

(assert (= (and d!79473 c!60468) b!514950))

(assert (= (and d!79473 (not c!60468)) b!514947))

(assert (= (and b!514947 c!60469) b!514943))

(assert (= (and b!514947 (not c!60469)) b!514942))

(assert (= (and d!79473 c!60467) b!514946))

(assert (= (and d!79473 (not c!60467)) b!514944))

(assert (= (and b!514944 res!314585) b!514949))

(assert (= (and b!514949 (not res!314586)) b!514945))

(assert (= (and b!514945 (not res!314587)) b!514948))

(declare-fun m!496257 () Bool)

(assert (=> b!514942 m!496257))

(assert (=> b!514942 m!496257))

(assert (=> b!514942 m!496127))

(declare-fun m!496259 () Bool)

(assert (=> b!514942 m!496259))

(declare-fun m!496261 () Bool)

(assert (=> d!79473 m!496261))

(assert (=> d!79473 m!496157))

(declare-fun m!496263 () Bool)

(assert (=> b!514949 m!496263))

(assert (=> b!514945 m!496263))

(assert (=> b!514948 m!496263))

(assert (=> b!514766 d!79473))

(declare-fun bm!31634 () Bool)

(declare-fun call!31637 () Bool)

(assert (=> bm!31634 (= call!31637 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!79489 () Bool)

(declare-fun res!314602 () Bool)

(declare-fun e!300725 () Bool)

(assert (=> d!79489 (=> res!314602 e!300725)))

(assert (=> d!79489 (= res!314602 (bvsge j!176 (size!16227 a!3235)))))

(assert (=> d!79489 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!300725)))

(declare-fun b!514970 () Bool)

(declare-fun e!300723 () Bool)

(declare-fun e!300724 () Bool)

(assert (=> b!514970 (= e!300723 e!300724)))

(declare-fun lt!235737 () (_ BitVec 64))

(assert (=> b!514970 (= lt!235737 (select (arr!15863 a!3235) j!176))))

(declare-fun lt!235738 () Unit!15918)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32987 (_ BitVec 64) (_ BitVec 32)) Unit!15918)

(assert (=> b!514970 (= lt!235738 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!235737 j!176))))

(assert (=> b!514970 (arrayContainsKey!0 a!3235 lt!235737 #b00000000000000000000000000000000)))

(declare-fun lt!235739 () Unit!15918)

(assert (=> b!514970 (= lt!235739 lt!235738)))

(declare-fun res!314601 () Bool)

(assert (=> b!514970 (= res!314601 (= (seekEntryOrOpen!0 (select (arr!15863 a!3235) j!176) a!3235 mask!3524) (Found!4330 j!176)))))

(assert (=> b!514970 (=> (not res!314601) (not e!300724))))

(declare-fun b!514971 () Bool)

(assert (=> b!514971 (= e!300723 call!31637)))

(declare-fun b!514972 () Bool)

(assert (=> b!514972 (= e!300725 e!300723)))

(declare-fun c!60473 () Bool)

(assert (=> b!514972 (= c!60473 (validKeyInArray!0 (select (arr!15863 a!3235) j!176)))))

(declare-fun b!514973 () Bool)

(assert (=> b!514973 (= e!300724 call!31637)))

(assert (= (and d!79489 (not res!314602)) b!514972))

(assert (= (and b!514972 c!60473) b!514970))

(assert (= (and b!514972 (not c!60473)) b!514971))

(assert (= (and b!514970 res!314601) b!514973))

(assert (= (or b!514973 b!514971) bm!31634))

(declare-fun m!496271 () Bool)

(assert (=> bm!31634 m!496271))

(assert (=> b!514970 m!496127))

(declare-fun m!496273 () Bool)

(assert (=> b!514970 m!496273))

(declare-fun m!496275 () Bool)

(assert (=> b!514970 m!496275))

(assert (=> b!514970 m!496127))

(assert (=> b!514970 m!496129))

(assert (=> b!514972 m!496127))

(assert (=> b!514972 m!496127))

(assert (=> b!514972 m!496131))

(assert (=> b!514766 d!79489))

(declare-fun d!79497 () Bool)

(assert (=> d!79497 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!235748 () Unit!15918)

(declare-fun choose!38 (array!32987 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15918)

(assert (=> d!79497 (= lt!235748 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79497 (validMask!0 mask!3524)))

(assert (=> d!79497 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!235748)))

(declare-fun bs!16274 () Bool)

(assert (= bs!16274 d!79497))

(assert (=> bs!16274 m!496149))

(declare-fun m!496297 () Bool)

(assert (=> bs!16274 m!496297))

(assert (=> bs!16274 m!496157))

(assert (=> b!514766 d!79497))

(declare-fun d!79507 () Bool)

(declare-fun lt!235750 () (_ BitVec 32))

(declare-fun lt!235749 () (_ BitVec 32))

(assert (=> d!79507 (= lt!235750 (bvmul (bvxor lt!235749 (bvlshr lt!235749 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79507 (= lt!235749 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15863 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15863 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79507 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!314554 (let ((h!10914 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15863 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15863 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48474 (bvmul (bvxor h!10914 (bvlshr h!10914 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48474 (bvlshr x!48474 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!314554 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!314554 #b00000000000000000000000000000000))))))

(assert (=> d!79507 (= (toIndex!0 (select (store (arr!15863 a!3235) i!1204 k!2280) j!176) mask!3524) (bvand (bvxor lt!235750 (bvlshr lt!235750 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!514766 d!79507))

(declare-fun b!514984 () Bool)

(declare-fun e!300735 () SeekEntryResult!4330)

(assert (=> b!514984 (= e!300735 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!235657 #b00000000000000000000000000000000 mask!3524) (select (store (arr!15863 a!3235) i!1204 k!2280) j!176) (array!32988 (store (arr!15863 a!3235) i!1204 k!2280) (size!16227 a!3235)) mask!3524))))

(declare-fun b!514985 () Bool)

(assert (=> b!514985 (= e!300735 (Intermediate!4330 false lt!235657 #b00000000000000000000000000000000))))

(declare-fun b!514986 () Bool)

(declare-fun e!300733 () Bool)

(declare-fun e!300736 () Bool)

(assert (=> b!514986 (= e!300733 e!300736)))

(declare-fun res!314605 () Bool)

(declare-fun lt!235752 () SeekEntryResult!4330)

(assert (=> b!514986 (= res!314605 (and (is-Intermediate!4330 lt!235752) (not (undefined!5142 lt!235752)) (bvslt (x!48471 lt!235752) #b01111111111111111111111111111110) (bvsge (x!48471 lt!235752) #b00000000000000000000000000000000) (bvsge (x!48471 lt!235752) #b00000000000000000000000000000000)))))

(assert (=> b!514986 (=> (not res!314605) (not e!300736))))

(declare-fun b!514987 () Bool)

(assert (=> b!514987 (and (bvsge (index!19510 lt!235752) #b00000000000000000000000000000000) (bvslt (index!19510 lt!235752) (size!16227 (array!32988 (store (arr!15863 a!3235) i!1204 k!2280) (size!16227 a!3235)))))))

(declare-fun res!314607 () Bool)

(assert (=> b!514987 (= res!314607 (= (select (arr!15863 (array!32988 (store (arr!15863 a!3235) i!1204 k!2280) (size!16227 a!3235))) (index!19510 lt!235752)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!300732 () Bool)

(assert (=> b!514987 (=> res!314607 e!300732)))

(declare-fun b!514988 () Bool)

(assert (=> b!514988 (= e!300733 (bvsge (x!48471 lt!235752) #b01111111111111111111111111111110))))

(declare-fun b!514990 () Bool)

(assert (=> b!514990 (and (bvsge (index!19510 lt!235752) #b00000000000000000000000000000000) (bvslt (index!19510 lt!235752) (size!16227 (array!32988 (store (arr!15863 a!3235) i!1204 k!2280) (size!16227 a!3235)))))))

(assert (=> b!514990 (= e!300732 (= (select (arr!15863 (array!32988 (store (arr!15863 a!3235) i!1204 k!2280) (size!16227 a!3235))) (index!19510 lt!235752)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!514991 () Bool)

(assert (=> b!514991 (and (bvsge (index!19510 lt!235752) #b00000000000000000000000000000000) (bvslt (index!19510 lt!235752) (size!16227 (array!32988 (store (arr!15863 a!3235) i!1204 k!2280) (size!16227 a!3235)))))))

(declare-fun res!314606 () Bool)

(assert (=> b!514991 (= res!314606 (= (select (arr!15863 (array!32988 (store (arr!15863 a!3235) i!1204 k!2280) (size!16227 a!3235))) (index!19510 lt!235752)) (select (store (arr!15863 a!3235) i!1204 k!2280) j!176)))))

(assert (=> b!514991 (=> res!314606 e!300732)))

(assert (=> b!514991 (= e!300736 e!300732)))

(declare-fun b!514992 () Bool)

(declare-fun e!300734 () SeekEntryResult!4330)

(assert (=> b!514992 (= e!300734 (Intermediate!4330 true lt!235657 #b00000000000000000000000000000000))))

(declare-fun b!514989 () Bool)

(assert (=> b!514989 (= e!300734 e!300735)))

(declare-fun lt!235751 () (_ BitVec 64))

(declare-fun c!60480 () Bool)

(assert (=> b!514989 (= c!60480 (or (= lt!235751 (select (store (arr!15863 a!3235) i!1204 k!2280) j!176)) (= (bvadd lt!235751 lt!235751) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!79509 () Bool)

(assert (=> d!79509 e!300733))

(declare-fun c!60478 () Bool)

(assert (=> d!79509 (= c!60478 (and (is-Intermediate!4330 lt!235752) (undefined!5142 lt!235752)))))

(assert (=> d!79509 (= lt!235752 e!300734)))

(declare-fun c!60479 () Bool)

(assert (=> d!79509 (= c!60479 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79509 (= lt!235751 (select (arr!15863 (array!32988 (store (arr!15863 a!3235) i!1204 k!2280) (size!16227 a!3235))) lt!235657))))

(assert (=> d!79509 (validMask!0 mask!3524)))

(assert (=> d!79509 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235657 (select (store (arr!15863 a!3235) i!1204 k!2280) j!176) (array!32988 (store (arr!15863 a!3235) i!1204 k!2280) (size!16227 a!3235)) mask!3524) lt!235752)))

(assert (= (and d!79509 c!60479) b!514992))

(assert (= (and d!79509 (not c!60479)) b!514989))

(assert (= (and b!514989 c!60480) b!514985))

(assert (= (and b!514989 (not c!60480)) b!514984))

(assert (= (and d!79509 c!60478) b!514988))

(assert (= (and d!79509 (not c!60478)) b!514986))

(assert (= (and b!514986 res!314605) b!514991))

(assert (= (and b!514991 (not res!314606)) b!514987))

(assert (= (and b!514987 (not res!314607)) b!514990))

(declare-fun m!496299 () Bool)

(assert (=> b!514984 m!496299))

(assert (=> b!514984 m!496299))

(assert (=> b!514984 m!496139))

(declare-fun m!496301 () Bool)

(assert (=> b!514984 m!496301))

(declare-fun m!496303 () Bool)

(assert (=> d!79509 m!496303))

(assert (=> d!79509 m!496157))

(declare-fun m!496305 () Bool)

(assert (=> b!514991 m!496305))

(assert (=> b!514987 m!496305))

(assert (=> b!514990 m!496305))

(assert (=> b!514766 d!79509))

(declare-fun d!79515 () Bool)

(assert (=> d!79515 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!514760 d!79515))

(declare-fun bm!31636 () Bool)

(declare-fun call!31639 () Bool)

(assert (=> bm!31636 (= call!31639 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!79517 () Bool)

(declare-fun res!314610 () Bool)

(declare-fun e!300739 () Bool)

(assert (=> d!79517 (=> res!314610 e!300739)))

(assert (=> d!79517 (= res!314610 (bvsge #b00000000000000000000000000000000 (size!16227 a!3235)))))

(assert (=> d!79517 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!300739)))

(declare-fun b!514993 () Bool)

(declare-fun e!300737 () Bool)

(declare-fun e!300738 () Bool)

(assert (=> b!514993 (= e!300737 e!300738)))

(declare-fun lt!235753 () (_ BitVec 64))

(assert (=> b!514993 (= lt!235753 (select (arr!15863 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!235754 () Unit!15918)

(assert (=> b!514993 (= lt!235754 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!235753 #b00000000000000000000000000000000))))

(assert (=> b!514993 (arrayContainsKey!0 a!3235 lt!235753 #b00000000000000000000000000000000)))

(declare-fun lt!235755 () Unit!15918)

(assert (=> b!514993 (= lt!235755 lt!235754)))

(declare-fun res!314609 () Bool)

(assert (=> b!514993 (= res!314609 (= (seekEntryOrOpen!0 (select (arr!15863 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4330 #b00000000000000000000000000000000)))))

(assert (=> b!514993 (=> (not res!314609) (not e!300738))))

(declare-fun b!514994 () Bool)

(assert (=> b!514994 (= e!300737 call!31639)))

(declare-fun b!514995 () Bool)

(assert (=> b!514995 (= e!300739 e!300737)))

(declare-fun c!60481 () Bool)

(assert (=> b!514995 (= c!60481 (validKeyInArray!0 (select (arr!15863 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!514996 () Bool)

(assert (=> b!514996 (= e!300738 call!31639)))

(assert (= (and d!79517 (not res!314610)) b!514995))

(assert (= (and b!514995 c!60481) b!514993))

(assert (= (and b!514995 (not c!60481)) b!514994))

(assert (= (and b!514993 res!314609) b!514996))

(assert (= (or b!514996 b!514994) bm!31636))

(declare-fun m!496307 () Bool)

(assert (=> bm!31636 m!496307))

(assert (=> b!514993 m!496179))

(declare-fun m!496309 () Bool)

(assert (=> b!514993 m!496309))

(declare-fun m!496311 () Bool)

(assert (=> b!514993 m!496311))

(assert (=> b!514993 m!496179))

(declare-fun m!496313 () Bool)

(assert (=> b!514993 m!496313))

(assert (=> b!514995 m!496179))

(assert (=> b!514995 m!496179))

(assert (=> b!514995 m!496205))

(assert (=> b!514765 d!79517))

(declare-fun d!79519 () Bool)

(declare-fun lt!235778 () SeekEntryResult!4330)

(assert (=> d!79519 (and (or (is-Undefined!4330 lt!235778) (not (is-Found!4330 lt!235778)) (and (bvsge (index!19509 lt!235778) #b00000000000000000000000000000000) (bvslt (index!19509 lt!235778) (size!16227 a!3235)))) (or (is-Undefined!4330 lt!235778) (is-Found!4330 lt!235778) (not (is-MissingZero!4330 lt!235778)) (and (bvsge (index!19508 lt!235778) #b00000000000000000000000000000000) (bvslt (index!19508 lt!235778) (size!16227 a!3235)))) (or (is-Undefined!4330 lt!235778) (is-Found!4330 lt!235778) (is-MissingZero!4330 lt!235778) (not (is-MissingVacant!4330 lt!235778)) (and (bvsge (index!19511 lt!235778) #b00000000000000000000000000000000) (bvslt (index!19511 lt!235778) (size!16227 a!3235)))) (or (is-Undefined!4330 lt!235778) (ite (is-Found!4330 lt!235778) (= (select (arr!15863 a!3235) (index!19509 lt!235778)) (select (arr!15863 a!3235) j!176)) (ite (is-MissingZero!4330 lt!235778) (= (select (arr!15863 a!3235) (index!19508 lt!235778)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4330 lt!235778) (= (select (arr!15863 a!3235) (index!19511 lt!235778)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!300751 () SeekEntryResult!4330)

(assert (=> d!79519 (= lt!235778 e!300751)))

(declare-fun c!60490 () Bool)

(declare-fun lt!235777 () SeekEntryResult!4330)

(assert (=> d!79519 (= c!60490 (and (is-Intermediate!4330 lt!235777) (undefined!5142 lt!235777)))))

(assert (=> d!79519 (= lt!235777 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15863 a!3235) j!176) mask!3524) (select (arr!15863 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79519 (validMask!0 mask!3524)))

(assert (=> d!79519 (= (seekEntryOrOpen!0 (select (arr!15863 a!3235) j!176) a!3235 mask!3524) lt!235778)))

(declare-fun b!515013 () Bool)

(declare-fun e!300749 () SeekEntryResult!4330)

(assert (=> b!515013 (= e!300751 e!300749)))

(declare-fun lt!235776 () (_ BitVec 64))

(assert (=> b!515013 (= lt!235776 (select (arr!15863 a!3235) (index!19510 lt!235777)))))

(declare-fun c!60491 () Bool)

(assert (=> b!515013 (= c!60491 (= lt!235776 (select (arr!15863 a!3235) j!176)))))

(declare-fun b!515014 () Bool)

(declare-fun c!60489 () Bool)

(assert (=> b!515014 (= c!60489 (= lt!235776 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!300750 () SeekEntryResult!4330)

(assert (=> b!515014 (= e!300749 e!300750)))

(declare-fun b!515015 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32987 (_ BitVec 32)) SeekEntryResult!4330)

(assert (=> b!515015 (= e!300750 (seekKeyOrZeroReturnVacant!0 (x!48471 lt!235777) (index!19510 lt!235777) (index!19510 lt!235777) (select (arr!15863 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!515016 () Bool)

(assert (=> b!515016 (= e!300750 (MissingZero!4330 (index!19510 lt!235777)))))

(declare-fun b!515017 () Bool)

(assert (=> b!515017 (= e!300749 (Found!4330 (index!19510 lt!235777)))))

(declare-fun b!515018 () Bool)

(assert (=> b!515018 (= e!300751 Undefined!4330)))

(assert (= (and d!79519 c!60490) b!515018))

(assert (= (and d!79519 (not c!60490)) b!515013))

(assert (= (and b!515013 c!60491) b!515017))

(assert (= (and b!515013 (not c!60491)) b!515014))

(assert (= (and b!515014 c!60489) b!515016))

(assert (= (and b!515014 (not c!60489)) b!515015))

(assert (=> d!79519 m!496127))

(assert (=> d!79519 m!496147))

(declare-fun m!496323 () Bool)

(assert (=> d!79519 m!496323))

(declare-fun m!496325 () Bool)

(assert (=> d!79519 m!496325))

(declare-fun m!496327 () Bool)

(assert (=> d!79519 m!496327))

(assert (=> d!79519 m!496147))

(assert (=> d!79519 m!496127))

(declare-fun m!496329 () Bool)

(assert (=> d!79519 m!496329))

(assert (=> d!79519 m!496157))

(declare-fun m!496331 () Bool)

(assert (=> b!515013 m!496331))

(assert (=> b!515015 m!496127))

(declare-fun m!496333 () Bool)

(assert (=> b!515015 m!496333))

(assert (=> b!514759 d!79519))

(declare-fun d!79529 () Bool)

(assert (=> d!79529 (= (validKeyInArray!0 (select (arr!15863 a!3235) j!176)) (and (not (= (select (arr!15863 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15863 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!514764 d!79529))

(declare-fun d!79531 () Bool)

(assert (=> d!79531 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46618 d!79531))

(declare-fun d!79535 () Bool)

(assert (=> d!79535 (= (array_inv!11659 a!3235) (bvsge (size!16227 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46618 d!79535))

(declare-fun d!79539 () Bool)

(declare-fun lt!235789 () SeekEntryResult!4330)

(assert (=> d!79539 (and (or (is-Undefined!4330 lt!235789) (not (is-Found!4330 lt!235789)) (and (bvsge (index!19509 lt!235789) #b00000000000000000000000000000000) (bvslt (index!19509 lt!235789) (size!16227 a!3235)))) (or (is-Undefined!4330 lt!235789) (is-Found!4330 lt!235789) (not (is-MissingZero!4330 lt!235789)) (and (bvsge (index!19508 lt!235789) #b00000000000000000000000000000000) (bvslt (index!19508 lt!235789) (size!16227 a!3235)))) (or (is-Undefined!4330 lt!235789) (is-Found!4330 lt!235789) (is-MissingZero!4330 lt!235789) (not (is-MissingVacant!4330 lt!235789)) (and (bvsge (index!19511 lt!235789) #b00000000000000000000000000000000) (bvslt (index!19511 lt!235789) (size!16227 a!3235)))) (or (is-Undefined!4330 lt!235789) (ite (is-Found!4330 lt!235789) (= (select (arr!15863 a!3235) (index!19509 lt!235789)) k!2280) (ite (is-MissingZero!4330 lt!235789) (= (select (arr!15863 a!3235) (index!19508 lt!235789)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4330 lt!235789) (= (select (arr!15863 a!3235) (index!19511 lt!235789)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!300774 () SeekEntryResult!4330)

(assert (=> d!79539 (= lt!235789 e!300774)))

(declare-fun c!60505 () Bool)

(declare-fun lt!235788 () SeekEntryResult!4330)

(assert (=> d!79539 (= c!60505 (and (is-Intermediate!4330 lt!235788) (undefined!5142 lt!235788)))))

(assert (=> d!79539 (= lt!235788 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!79539 (validMask!0 mask!3524)))

(assert (=> d!79539 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!235789)))

(declare-fun b!515055 () Bool)

(declare-fun e!300772 () SeekEntryResult!4330)

(assert (=> b!515055 (= e!300774 e!300772)))

(declare-fun lt!235787 () (_ BitVec 64))

(assert (=> b!515055 (= lt!235787 (select (arr!15863 a!3235) (index!19510 lt!235788)))))

(declare-fun c!60506 () Bool)


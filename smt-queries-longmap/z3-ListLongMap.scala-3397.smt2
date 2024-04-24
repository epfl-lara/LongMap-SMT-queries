; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46904 () Bool)

(assert start!46904)

(declare-fun b!517485 () Bool)

(declare-fun res!316738 () Bool)

(declare-fun e!301975 () Bool)

(assert (=> b!517485 (=> (not res!316738) (not e!301975))))

(declare-datatypes ((array!33103 0))(
  ( (array!33104 (arr!15916 (Array (_ BitVec 32) (_ BitVec 64))) (size!16280 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33103)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!517485 (= res!316738 (validKeyInArray!0 (select (arr!15916 a!3235) j!176)))))

(declare-fun b!517486 () Bool)

(declare-fun e!301976 () Bool)

(assert (=> b!517486 (= e!301975 e!301976)))

(declare-fun res!316741 () Bool)

(assert (=> b!517486 (=> (not res!316741) (not e!301976))))

(declare-datatypes ((SeekEntryResult!4339 0))(
  ( (MissingZero!4339 (index!19544 (_ BitVec 32))) (Found!4339 (index!19545 (_ BitVec 32))) (Intermediate!4339 (undefined!5151 Bool) (index!19546 (_ BitVec 32)) (x!48655 (_ BitVec 32))) (Undefined!4339) (MissingVacant!4339 (index!19547 (_ BitVec 32))) )
))
(declare-fun lt!236926 () SeekEntryResult!4339)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!517486 (= res!316741 (or (= lt!236926 (MissingZero!4339 i!1204)) (= lt!236926 (MissingVacant!4339 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33103 (_ BitVec 32)) SeekEntryResult!4339)

(assert (=> b!517486 (= lt!236926 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!517488 () Bool)

(declare-fun e!301974 () Bool)

(assert (=> b!517488 (= e!301976 (not e!301974))))

(declare-fun res!316740 () Bool)

(assert (=> b!517488 (=> res!316740 e!301974)))

(declare-fun lt!236925 () (_ BitVec 32))

(declare-fun lt!236928 () SeekEntryResult!4339)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33103 (_ BitVec 32)) SeekEntryResult!4339)

(assert (=> b!517488 (= res!316740 (= lt!236928 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236925 (select (store (arr!15916 a!3235) i!1204 k0!2280) j!176) (array!33104 (store (arr!15916 a!3235) i!1204 k0!2280) (size!16280 a!3235)) mask!3524)))))

(declare-fun lt!236929 () (_ BitVec 32))

(assert (=> b!517488 (= lt!236928 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236929 (select (arr!15916 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!517488 (= lt!236925 (toIndex!0 (select (store (arr!15916 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!517488 (= lt!236929 (toIndex!0 (select (arr!15916 a!3235) j!176) mask!3524))))

(declare-fun e!301977 () Bool)

(assert (=> b!517488 e!301977))

(declare-fun res!316746 () Bool)

(assert (=> b!517488 (=> (not res!316746) (not e!301977))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33103 (_ BitVec 32)) Bool)

(assert (=> b!517488 (= res!316746 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15997 0))(
  ( (Unit!15998) )
))
(declare-fun lt!236927 () Unit!15997)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33103 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15997)

(assert (=> b!517488 (= lt!236927 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!517489 () Bool)

(declare-fun res!316739 () Bool)

(assert (=> b!517489 (=> (not res!316739) (not e!301976))))

(assert (=> b!517489 (= res!316739 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!517490 () Bool)

(assert (=> b!517490 (= e!301977 (= (seekEntryOrOpen!0 (select (arr!15916 a!3235) j!176) a!3235 mask!3524) (Found!4339 j!176)))))

(declare-fun b!517491 () Bool)

(declare-fun res!316745 () Bool)

(assert (=> b!517491 (=> (not res!316745) (not e!301975))))

(assert (=> b!517491 (= res!316745 (validKeyInArray!0 k0!2280))))

(declare-fun b!517492 () Bool)

(assert (=> b!517492 (= e!301974 (or (not (= (select (arr!15916 a!3235) (index!19546 lt!236928)) (select (arr!15916 a!3235) j!176))) (bvsgt (x!48655 lt!236928) #b01111111111111111111111111111110) (bvsgt #b00000000000000000000000000000000 (x!48655 lt!236928)) (bvslt lt!236929 #b00000000000000000000000000000000) (bvsge lt!236929 (size!16280 a!3235)) (and (bvsge (index!19546 lt!236928) #b00000000000000000000000000000000) (bvslt (index!19546 lt!236928) (size!16280 a!3235)))))))

(assert (=> b!517492 (and (bvslt (x!48655 lt!236928) #b01111111111111111111111111111110) (or (= (select (arr!15916 a!3235) (index!19546 lt!236928)) (select (arr!15916 a!3235) j!176)) (= (select (arr!15916 a!3235) (index!19546 lt!236928)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15916 a!3235) (index!19546 lt!236928)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!517493 () Bool)

(declare-fun res!316747 () Bool)

(assert (=> b!517493 (=> (not res!316747) (not e!301975))))

(assert (=> b!517493 (= res!316747 (and (= (size!16280 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16280 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16280 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!517494 () Bool)

(declare-fun res!316737 () Bool)

(assert (=> b!517494 (=> (not res!316737) (not e!301975))))

(declare-fun arrayContainsKey!0 (array!33103 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!517494 (= res!316737 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!517495 () Bool)

(declare-fun res!316743 () Bool)

(assert (=> b!517495 (=> res!316743 e!301974)))

(get-info :version)

(assert (=> b!517495 (= res!316743 (or (undefined!5151 lt!236928) (not ((_ is Intermediate!4339) lt!236928))))))

(declare-fun res!316744 () Bool)

(assert (=> start!46904 (=> (not res!316744) (not e!301975))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46904 (= res!316744 (validMask!0 mask!3524))))

(assert (=> start!46904 e!301975))

(assert (=> start!46904 true))

(declare-fun array_inv!11775 (array!33103) Bool)

(assert (=> start!46904 (array_inv!11775 a!3235)))

(declare-fun b!517487 () Bool)

(declare-fun res!316742 () Bool)

(assert (=> b!517487 (=> (not res!316742) (not e!301976))))

(declare-datatypes ((List!9981 0))(
  ( (Nil!9978) (Cons!9977 (h!10881 (_ BitVec 64)) (t!16201 List!9981)) )
))
(declare-fun arrayNoDuplicates!0 (array!33103 (_ BitVec 32) List!9981) Bool)

(assert (=> b!517487 (= res!316742 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9978))))

(assert (= (and start!46904 res!316744) b!517493))

(assert (= (and b!517493 res!316747) b!517485))

(assert (= (and b!517485 res!316738) b!517491))

(assert (= (and b!517491 res!316745) b!517494))

(assert (= (and b!517494 res!316737) b!517486))

(assert (= (and b!517486 res!316741) b!517489))

(assert (= (and b!517489 res!316739) b!517487))

(assert (= (and b!517487 res!316742) b!517488))

(assert (= (and b!517488 res!316746) b!517490))

(assert (= (and b!517488 (not res!316740)) b!517495))

(assert (= (and b!517495 (not res!316743)) b!517492))

(declare-fun m!499123 () Bool)

(assert (=> b!517486 m!499123))

(declare-fun m!499125 () Bool)

(assert (=> b!517490 m!499125))

(assert (=> b!517490 m!499125))

(declare-fun m!499127 () Bool)

(assert (=> b!517490 m!499127))

(declare-fun m!499129 () Bool)

(assert (=> b!517488 m!499129))

(declare-fun m!499131 () Bool)

(assert (=> b!517488 m!499131))

(declare-fun m!499133 () Bool)

(assert (=> b!517488 m!499133))

(assert (=> b!517488 m!499133))

(declare-fun m!499135 () Bool)

(assert (=> b!517488 m!499135))

(assert (=> b!517488 m!499125))

(declare-fun m!499137 () Bool)

(assert (=> b!517488 m!499137))

(assert (=> b!517488 m!499125))

(assert (=> b!517488 m!499125))

(declare-fun m!499139 () Bool)

(assert (=> b!517488 m!499139))

(declare-fun m!499141 () Bool)

(assert (=> b!517488 m!499141))

(assert (=> b!517488 m!499133))

(declare-fun m!499143 () Bool)

(assert (=> b!517488 m!499143))

(declare-fun m!499145 () Bool)

(assert (=> b!517489 m!499145))

(declare-fun m!499147 () Bool)

(assert (=> start!46904 m!499147))

(declare-fun m!499149 () Bool)

(assert (=> start!46904 m!499149))

(declare-fun m!499151 () Bool)

(assert (=> b!517494 m!499151))

(declare-fun m!499153 () Bool)

(assert (=> b!517491 m!499153))

(declare-fun m!499155 () Bool)

(assert (=> b!517487 m!499155))

(declare-fun m!499157 () Bool)

(assert (=> b!517492 m!499157))

(assert (=> b!517492 m!499125))

(assert (=> b!517485 m!499125))

(assert (=> b!517485 m!499125))

(declare-fun m!499159 () Bool)

(assert (=> b!517485 m!499159))

(check-sat (not b!517485) (not b!517490) (not b!517494) (not b!517487) (not start!46904) (not b!517488) (not b!517491) (not b!517489) (not b!517486))
(check-sat)
(get-model)

(declare-fun b!517572 () Bool)

(declare-fun e!302018 () Bool)

(declare-fun e!302019 () Bool)

(assert (=> b!517572 (= e!302018 e!302019)))

(declare-fun c!60668 () Bool)

(assert (=> b!517572 (= c!60668 (validKeyInArray!0 (select (arr!15916 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!79795 () Bool)

(declare-fun res!316822 () Bool)

(declare-fun e!302016 () Bool)

(assert (=> d!79795 (=> res!316822 e!302016)))

(assert (=> d!79795 (= res!316822 (bvsge #b00000000000000000000000000000000 (size!16280 a!3235)))))

(assert (=> d!79795 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9978) e!302016)))

(declare-fun b!517573 () Bool)

(declare-fun call!31671 () Bool)

(assert (=> b!517573 (= e!302019 call!31671)))

(declare-fun b!517574 () Bool)

(assert (=> b!517574 (= e!302016 e!302018)))

(declare-fun res!316820 () Bool)

(assert (=> b!517574 (=> (not res!316820) (not e!302018))))

(declare-fun e!302017 () Bool)

(assert (=> b!517574 (= res!316820 (not e!302017))))

(declare-fun res!316821 () Bool)

(assert (=> b!517574 (=> (not res!316821) (not e!302017))))

(assert (=> b!517574 (= res!316821 (validKeyInArray!0 (select (arr!15916 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31668 () Bool)

(assert (=> bm!31668 (= call!31671 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60668 (Cons!9977 (select (arr!15916 a!3235) #b00000000000000000000000000000000) Nil!9978) Nil!9978)))))

(declare-fun b!517575 () Bool)

(assert (=> b!517575 (= e!302019 call!31671)))

(declare-fun b!517576 () Bool)

(declare-fun contains!2724 (List!9981 (_ BitVec 64)) Bool)

(assert (=> b!517576 (= e!302017 (contains!2724 Nil!9978 (select (arr!15916 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!79795 (not res!316822)) b!517574))

(assert (= (and b!517574 res!316821) b!517576))

(assert (= (and b!517574 res!316820) b!517572))

(assert (= (and b!517572 c!60668) b!517575))

(assert (= (and b!517572 (not c!60668)) b!517573))

(assert (= (or b!517575 b!517573) bm!31668))

(declare-fun m!499237 () Bool)

(assert (=> b!517572 m!499237))

(assert (=> b!517572 m!499237))

(declare-fun m!499239 () Bool)

(assert (=> b!517572 m!499239))

(assert (=> b!517574 m!499237))

(assert (=> b!517574 m!499237))

(assert (=> b!517574 m!499239))

(assert (=> bm!31668 m!499237))

(declare-fun m!499241 () Bool)

(assert (=> bm!31668 m!499241))

(assert (=> b!517576 m!499237))

(assert (=> b!517576 m!499237))

(declare-fun m!499243 () Bool)

(assert (=> b!517576 m!499243))

(assert (=> b!517487 d!79795))

(declare-fun d!79797 () Bool)

(declare-fun lt!236965 () (_ BitVec 32))

(declare-fun lt!236964 () (_ BitVec 32))

(assert (=> d!79797 (= lt!236965 (bvmul (bvxor lt!236964 (bvlshr lt!236964 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79797 (= lt!236964 ((_ extract 31 0) (bvand (bvxor (select (arr!15916 a!3235) j!176) (bvlshr (select (arr!15916 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79797 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!316823 (let ((h!10884 ((_ extract 31 0) (bvand (bvxor (select (arr!15916 a!3235) j!176) (bvlshr (select (arr!15916 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48658 (bvmul (bvxor h!10884 (bvlshr h!10884 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48658 (bvlshr x!48658 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!316823 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!316823 #b00000000000000000000000000000000))))))

(assert (=> d!79797 (= (toIndex!0 (select (arr!15916 a!3235) j!176) mask!3524) (bvand (bvxor lt!236965 (bvlshr lt!236965 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!517488 d!79797))

(declare-fun bm!31671 () Bool)

(declare-fun call!31674 () Bool)

(assert (=> bm!31671 (= call!31674 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!517585 () Bool)

(declare-fun e!302026 () Bool)

(declare-fun e!302028 () Bool)

(assert (=> b!517585 (= e!302026 e!302028)))

(declare-fun c!60671 () Bool)

(assert (=> b!517585 (= c!60671 (validKeyInArray!0 (select (arr!15916 a!3235) j!176)))))

(declare-fun b!517587 () Bool)

(assert (=> b!517587 (= e!302028 call!31674)))

(declare-fun b!517588 () Bool)

(declare-fun e!302027 () Bool)

(assert (=> b!517588 (= e!302027 call!31674)))

(declare-fun d!79799 () Bool)

(declare-fun res!316829 () Bool)

(assert (=> d!79799 (=> res!316829 e!302026)))

(assert (=> d!79799 (= res!316829 (bvsge j!176 (size!16280 a!3235)))))

(assert (=> d!79799 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!302026)))

(declare-fun b!517586 () Bool)

(assert (=> b!517586 (= e!302028 e!302027)))

(declare-fun lt!236974 () (_ BitVec 64))

(assert (=> b!517586 (= lt!236974 (select (arr!15916 a!3235) j!176))))

(declare-fun lt!236972 () Unit!15997)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33103 (_ BitVec 64) (_ BitVec 32)) Unit!15997)

(assert (=> b!517586 (= lt!236972 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!236974 j!176))))

(assert (=> b!517586 (arrayContainsKey!0 a!3235 lt!236974 #b00000000000000000000000000000000)))

(declare-fun lt!236973 () Unit!15997)

(assert (=> b!517586 (= lt!236973 lt!236972)))

(declare-fun res!316828 () Bool)

(assert (=> b!517586 (= res!316828 (= (seekEntryOrOpen!0 (select (arr!15916 a!3235) j!176) a!3235 mask!3524) (Found!4339 j!176)))))

(assert (=> b!517586 (=> (not res!316828) (not e!302027))))

(assert (= (and d!79799 (not res!316829)) b!517585))

(assert (= (and b!517585 c!60671) b!517586))

(assert (= (and b!517585 (not c!60671)) b!517587))

(assert (= (and b!517586 res!316828) b!517588))

(assert (= (or b!517588 b!517587) bm!31671))

(declare-fun m!499245 () Bool)

(assert (=> bm!31671 m!499245))

(assert (=> b!517585 m!499125))

(assert (=> b!517585 m!499125))

(assert (=> b!517585 m!499159))

(assert (=> b!517586 m!499125))

(declare-fun m!499247 () Bool)

(assert (=> b!517586 m!499247))

(declare-fun m!499249 () Bool)

(assert (=> b!517586 m!499249))

(assert (=> b!517586 m!499125))

(assert (=> b!517586 m!499127))

(assert (=> b!517488 d!79799))

(declare-fun b!517613 () Bool)

(declare-fun e!302045 () SeekEntryResult!4339)

(assert (=> b!517613 (= e!302045 (Intermediate!4339 true lt!236925 #b00000000000000000000000000000000))))

(declare-fun d!79801 () Bool)

(declare-fun e!302047 () Bool)

(assert (=> d!79801 e!302047))

(declare-fun c!60680 () Bool)

(declare-fun lt!236979 () SeekEntryResult!4339)

(assert (=> d!79801 (= c!60680 (and ((_ is Intermediate!4339) lt!236979) (undefined!5151 lt!236979)))))

(assert (=> d!79801 (= lt!236979 e!302045)))

(declare-fun c!60678 () Bool)

(assert (=> d!79801 (= c!60678 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!236980 () (_ BitVec 64))

(assert (=> d!79801 (= lt!236980 (select (arr!15916 (array!33104 (store (arr!15916 a!3235) i!1204 k0!2280) (size!16280 a!3235))) lt!236925))))

(assert (=> d!79801 (validMask!0 mask!3524)))

(assert (=> d!79801 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236925 (select (store (arr!15916 a!3235) i!1204 k0!2280) j!176) (array!33104 (store (arr!15916 a!3235) i!1204 k0!2280) (size!16280 a!3235)) mask!3524) lt!236979)))

(declare-fun e!302049 () SeekEntryResult!4339)

(declare-fun b!517614 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!517614 (= e!302049 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!236925 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) (select (store (arr!15916 a!3235) i!1204 k0!2280) j!176) (array!33104 (store (arr!15916 a!3235) i!1204 k0!2280) (size!16280 a!3235)) mask!3524))))

(declare-fun b!517615 () Bool)

(assert (=> b!517615 (and (bvsge (index!19546 lt!236979) #b00000000000000000000000000000000) (bvslt (index!19546 lt!236979) (size!16280 (array!33104 (store (arr!15916 a!3235) i!1204 k0!2280) (size!16280 a!3235)))))))

(declare-fun res!316844 () Bool)

(assert (=> b!517615 (= res!316844 (= (select (arr!15916 (array!33104 (store (arr!15916 a!3235) i!1204 k0!2280) (size!16280 a!3235))) (index!19546 lt!236979)) (select (store (arr!15916 a!3235) i!1204 k0!2280) j!176)))))

(declare-fun e!302046 () Bool)

(assert (=> b!517615 (=> res!316844 e!302046)))

(declare-fun e!302048 () Bool)

(assert (=> b!517615 (= e!302048 e!302046)))

(declare-fun b!517616 () Bool)

(assert (=> b!517616 (= e!302047 e!302048)))

(declare-fun res!316843 () Bool)

(assert (=> b!517616 (= res!316843 (and ((_ is Intermediate!4339) lt!236979) (not (undefined!5151 lt!236979)) (bvslt (x!48655 lt!236979) #b01111111111111111111111111111110) (bvsge (x!48655 lt!236979) #b00000000000000000000000000000000) (bvsge (x!48655 lt!236979) #b00000000000000000000000000000000)))))

(assert (=> b!517616 (=> (not res!316843) (not e!302048))))

(declare-fun b!517617 () Bool)

(assert (=> b!517617 (= e!302045 e!302049)))

(declare-fun c!60679 () Bool)

(assert (=> b!517617 (= c!60679 (or (= lt!236980 (select (store (arr!15916 a!3235) i!1204 k0!2280) j!176)) (= (bvadd lt!236980 lt!236980) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!517618 () Bool)

(assert (=> b!517618 (= e!302047 (bvsge (x!48655 lt!236979) #b01111111111111111111111111111110))))

(declare-fun b!517619 () Bool)

(assert (=> b!517619 (and (bvsge (index!19546 lt!236979) #b00000000000000000000000000000000) (bvslt (index!19546 lt!236979) (size!16280 (array!33104 (store (arr!15916 a!3235) i!1204 k0!2280) (size!16280 a!3235)))))))

(declare-fun res!316842 () Bool)

(assert (=> b!517619 (= res!316842 (= (select (arr!15916 (array!33104 (store (arr!15916 a!3235) i!1204 k0!2280) (size!16280 a!3235))) (index!19546 lt!236979)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!517619 (=> res!316842 e!302046)))

(declare-fun b!517620 () Bool)

(assert (=> b!517620 (and (bvsge (index!19546 lt!236979) #b00000000000000000000000000000000) (bvslt (index!19546 lt!236979) (size!16280 (array!33104 (store (arr!15916 a!3235) i!1204 k0!2280) (size!16280 a!3235)))))))

(assert (=> b!517620 (= e!302046 (= (select (arr!15916 (array!33104 (store (arr!15916 a!3235) i!1204 k0!2280) (size!16280 a!3235))) (index!19546 lt!236979)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!517621 () Bool)

(assert (=> b!517621 (= e!302049 (Intermediate!4339 false lt!236925 #b00000000000000000000000000000000))))

(assert (= (and d!79801 c!60678) b!517613))

(assert (= (and d!79801 (not c!60678)) b!517617))

(assert (= (and b!517617 c!60679) b!517621))

(assert (= (and b!517617 (not c!60679)) b!517614))

(assert (= (and d!79801 c!60680) b!517618))

(assert (= (and d!79801 (not c!60680)) b!517616))

(assert (= (and b!517616 res!316843) b!517615))

(assert (= (and b!517615 (not res!316844)) b!517619))

(assert (= (and b!517619 (not res!316842)) b!517620))

(declare-fun m!499255 () Bool)

(assert (=> b!517615 m!499255))

(declare-fun m!499257 () Bool)

(assert (=> d!79801 m!499257))

(assert (=> d!79801 m!499147))

(declare-fun m!499259 () Bool)

(assert (=> b!517614 m!499259))

(assert (=> b!517614 m!499259))

(assert (=> b!517614 m!499133))

(declare-fun m!499261 () Bool)

(assert (=> b!517614 m!499261))

(assert (=> b!517620 m!499255))

(assert (=> b!517619 m!499255))

(assert (=> b!517488 d!79801))

(declare-fun d!79809 () Bool)

(assert (=> d!79809 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!236983 () Unit!15997)

(declare-fun choose!38 (array!33103 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15997)

(assert (=> d!79809 (= lt!236983 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79809 (validMask!0 mask!3524)))

(assert (=> d!79809 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!236983)))

(declare-fun bs!16358 () Bool)

(assert (= bs!16358 d!79809))

(assert (=> bs!16358 m!499141))

(declare-fun m!499263 () Bool)

(assert (=> bs!16358 m!499263))

(assert (=> bs!16358 m!499147))

(assert (=> b!517488 d!79809))

(declare-fun d!79813 () Bool)

(declare-fun lt!236985 () (_ BitVec 32))

(declare-fun lt!236984 () (_ BitVec 32))

(assert (=> d!79813 (= lt!236985 (bvmul (bvxor lt!236984 (bvlshr lt!236984 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79813 (= lt!236984 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15916 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15916 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79813 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!316823 (let ((h!10884 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15916 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15916 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48658 (bvmul (bvxor h!10884 (bvlshr h!10884 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48658 (bvlshr x!48658 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!316823 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!316823 #b00000000000000000000000000000000))))))

(assert (=> d!79813 (= (toIndex!0 (select (store (arr!15916 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvand (bvxor lt!236985 (bvlshr lt!236985 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!517488 d!79813))

(declare-fun b!517628 () Bool)

(declare-fun e!302054 () SeekEntryResult!4339)

(assert (=> b!517628 (= e!302054 (Intermediate!4339 true lt!236929 #b00000000000000000000000000000000))))

(declare-fun d!79815 () Bool)

(declare-fun e!302056 () Bool)

(assert (=> d!79815 e!302056))

(declare-fun c!60685 () Bool)

(declare-fun lt!236992 () SeekEntryResult!4339)

(assert (=> d!79815 (= c!60685 (and ((_ is Intermediate!4339) lt!236992) (undefined!5151 lt!236992)))))

(assert (=> d!79815 (= lt!236992 e!302054)))

(declare-fun c!60683 () Bool)

(assert (=> d!79815 (= c!60683 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!236993 () (_ BitVec 64))

(assert (=> d!79815 (= lt!236993 (select (arr!15916 a!3235) lt!236929))))

(assert (=> d!79815 (validMask!0 mask!3524)))

(assert (=> d!79815 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236929 (select (arr!15916 a!3235) j!176) a!3235 mask!3524) lt!236992)))

(declare-fun b!517629 () Bool)

(declare-fun e!302058 () SeekEntryResult!4339)

(assert (=> b!517629 (= e!302058 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!236929 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) (select (arr!15916 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!517630 () Bool)

(assert (=> b!517630 (and (bvsge (index!19546 lt!236992) #b00000000000000000000000000000000) (bvslt (index!19546 lt!236992) (size!16280 a!3235)))))

(declare-fun res!316849 () Bool)

(assert (=> b!517630 (= res!316849 (= (select (arr!15916 a!3235) (index!19546 lt!236992)) (select (arr!15916 a!3235) j!176)))))

(declare-fun e!302055 () Bool)

(assert (=> b!517630 (=> res!316849 e!302055)))

(declare-fun e!302057 () Bool)

(assert (=> b!517630 (= e!302057 e!302055)))

(declare-fun b!517631 () Bool)

(assert (=> b!517631 (= e!302056 e!302057)))

(declare-fun res!316848 () Bool)

(assert (=> b!517631 (= res!316848 (and ((_ is Intermediate!4339) lt!236992) (not (undefined!5151 lt!236992)) (bvslt (x!48655 lt!236992) #b01111111111111111111111111111110) (bvsge (x!48655 lt!236992) #b00000000000000000000000000000000) (bvsge (x!48655 lt!236992) #b00000000000000000000000000000000)))))

(assert (=> b!517631 (=> (not res!316848) (not e!302057))))

(declare-fun b!517632 () Bool)

(assert (=> b!517632 (= e!302054 e!302058)))

(declare-fun c!60684 () Bool)

(assert (=> b!517632 (= c!60684 (or (= lt!236993 (select (arr!15916 a!3235) j!176)) (= (bvadd lt!236993 lt!236993) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!517633 () Bool)

(assert (=> b!517633 (= e!302056 (bvsge (x!48655 lt!236992) #b01111111111111111111111111111110))))

(declare-fun b!517634 () Bool)

(assert (=> b!517634 (and (bvsge (index!19546 lt!236992) #b00000000000000000000000000000000) (bvslt (index!19546 lt!236992) (size!16280 a!3235)))))

(declare-fun res!316847 () Bool)

(assert (=> b!517634 (= res!316847 (= (select (arr!15916 a!3235) (index!19546 lt!236992)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!517634 (=> res!316847 e!302055)))

(declare-fun b!517635 () Bool)

(assert (=> b!517635 (and (bvsge (index!19546 lt!236992) #b00000000000000000000000000000000) (bvslt (index!19546 lt!236992) (size!16280 a!3235)))))

(assert (=> b!517635 (= e!302055 (= (select (arr!15916 a!3235) (index!19546 lt!236992)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!517636 () Bool)

(assert (=> b!517636 (= e!302058 (Intermediate!4339 false lt!236929 #b00000000000000000000000000000000))))

(assert (= (and d!79815 c!60683) b!517628))

(assert (= (and d!79815 (not c!60683)) b!517632))

(assert (= (and b!517632 c!60684) b!517636))

(assert (= (and b!517632 (not c!60684)) b!517629))

(assert (= (and d!79815 c!60685) b!517633))

(assert (= (and d!79815 (not c!60685)) b!517631))

(assert (= (and b!517631 res!316848) b!517630))

(assert (= (and b!517630 (not res!316849)) b!517634))

(assert (= (and b!517634 (not res!316847)) b!517635))

(declare-fun m!499265 () Bool)

(assert (=> b!517630 m!499265))

(declare-fun m!499267 () Bool)

(assert (=> d!79815 m!499267))

(assert (=> d!79815 m!499147))

(declare-fun m!499269 () Bool)

(assert (=> b!517629 m!499269))

(assert (=> b!517629 m!499269))

(assert (=> b!517629 m!499125))

(declare-fun m!499271 () Bool)

(assert (=> b!517629 m!499271))

(assert (=> b!517635 m!499265))

(assert (=> b!517634 m!499265))

(assert (=> b!517488 d!79815))

(declare-fun bm!31674 () Bool)

(declare-fun call!31677 () Bool)

(assert (=> bm!31674 (= call!31677 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!517639 () Bool)

(declare-fun e!302061 () Bool)

(declare-fun e!302063 () Bool)

(assert (=> b!517639 (= e!302061 e!302063)))

(declare-fun c!60686 () Bool)

(assert (=> b!517639 (= c!60686 (validKeyInArray!0 (select (arr!15916 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!517641 () Bool)

(assert (=> b!517641 (= e!302063 call!31677)))

(declare-fun b!517642 () Bool)

(declare-fun e!302062 () Bool)

(assert (=> b!517642 (= e!302062 call!31677)))

(declare-fun d!79817 () Bool)

(declare-fun res!316853 () Bool)

(assert (=> d!79817 (=> res!316853 e!302061)))

(assert (=> d!79817 (= res!316853 (bvsge #b00000000000000000000000000000000 (size!16280 a!3235)))))

(assert (=> d!79817 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!302061)))

(declare-fun b!517640 () Bool)

(assert (=> b!517640 (= e!302063 e!302062)))

(declare-fun lt!236996 () (_ BitVec 64))

(assert (=> b!517640 (= lt!236996 (select (arr!15916 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!236994 () Unit!15997)

(assert (=> b!517640 (= lt!236994 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!236996 #b00000000000000000000000000000000))))

(assert (=> b!517640 (arrayContainsKey!0 a!3235 lt!236996 #b00000000000000000000000000000000)))

(declare-fun lt!236995 () Unit!15997)

(assert (=> b!517640 (= lt!236995 lt!236994)))

(declare-fun res!316852 () Bool)

(assert (=> b!517640 (= res!316852 (= (seekEntryOrOpen!0 (select (arr!15916 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4339 #b00000000000000000000000000000000)))))

(assert (=> b!517640 (=> (not res!316852) (not e!302062))))

(assert (= (and d!79817 (not res!316853)) b!517639))

(assert (= (and b!517639 c!60686) b!517640))

(assert (= (and b!517639 (not c!60686)) b!517641))

(assert (= (and b!517640 res!316852) b!517642))

(assert (= (or b!517642 b!517641) bm!31674))

(declare-fun m!499273 () Bool)

(assert (=> bm!31674 m!499273))

(assert (=> b!517639 m!499237))

(assert (=> b!517639 m!499237))

(assert (=> b!517639 m!499239))

(assert (=> b!517640 m!499237))

(declare-fun m!499275 () Bool)

(assert (=> b!517640 m!499275))

(declare-fun m!499277 () Bool)

(assert (=> b!517640 m!499277))

(assert (=> b!517640 m!499237))

(declare-fun m!499279 () Bool)

(assert (=> b!517640 m!499279))

(assert (=> b!517489 d!79817))

(declare-fun d!79819 () Bool)

(declare-fun res!316861 () Bool)

(declare-fun e!302071 () Bool)

(assert (=> d!79819 (=> res!316861 e!302071)))

(assert (=> d!79819 (= res!316861 (= (select (arr!15916 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!79819 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!302071)))

(declare-fun b!517651 () Bool)

(declare-fun e!302072 () Bool)

(assert (=> b!517651 (= e!302071 e!302072)))

(declare-fun res!316862 () Bool)

(assert (=> b!517651 (=> (not res!316862) (not e!302072))))

(assert (=> b!517651 (= res!316862 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16280 a!3235)))))

(declare-fun b!517652 () Bool)

(assert (=> b!517652 (= e!302072 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79819 (not res!316861)) b!517651))

(assert (= (and b!517651 res!316862) b!517652))

(assert (=> d!79819 m!499237))

(declare-fun m!499291 () Bool)

(assert (=> b!517652 m!499291))

(assert (=> b!517494 d!79819))

(declare-fun d!79823 () Bool)

(assert (=> d!79823 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46904 d!79823))

(declare-fun d!79827 () Bool)

(assert (=> d!79827 (= (array_inv!11775 a!3235) (bvsge (size!16280 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46904 d!79827))

(declare-fun d!79829 () Bool)

(assert (=> d!79829 (= (validKeyInArray!0 (select (arr!15916 a!3235) j!176)) (and (not (= (select (arr!15916 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15916 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!517485 d!79829))

(declare-fun b!517735 () Bool)

(declare-fun c!60719 () Bool)

(declare-fun lt!237047 () (_ BitVec 64))

(assert (=> b!517735 (= c!60719 (= lt!237047 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!302121 () SeekEntryResult!4339)

(declare-fun e!302122 () SeekEntryResult!4339)

(assert (=> b!517735 (= e!302121 e!302122)))

(declare-fun b!517736 () Bool)

(declare-fun e!302120 () SeekEntryResult!4339)

(assert (=> b!517736 (= e!302120 Undefined!4339)))

(declare-fun b!517737 () Bool)

(declare-fun lt!237050 () SeekEntryResult!4339)

(assert (=> b!517737 (= e!302121 (Found!4339 (index!19546 lt!237050)))))

(declare-fun b!517738 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33103 (_ BitVec 32)) SeekEntryResult!4339)

(assert (=> b!517738 (= e!302122 (seekKeyOrZeroReturnVacant!0 (x!48655 lt!237050) (index!19546 lt!237050) (index!19546 lt!237050) (select (arr!15916 a!3235) j!176) a!3235 mask!3524))))

(declare-fun d!79831 () Bool)

(declare-fun lt!237048 () SeekEntryResult!4339)

(assert (=> d!79831 (and (or ((_ is Undefined!4339) lt!237048) (not ((_ is Found!4339) lt!237048)) (and (bvsge (index!19545 lt!237048) #b00000000000000000000000000000000) (bvslt (index!19545 lt!237048) (size!16280 a!3235)))) (or ((_ is Undefined!4339) lt!237048) ((_ is Found!4339) lt!237048) (not ((_ is MissingZero!4339) lt!237048)) (and (bvsge (index!19544 lt!237048) #b00000000000000000000000000000000) (bvslt (index!19544 lt!237048) (size!16280 a!3235)))) (or ((_ is Undefined!4339) lt!237048) ((_ is Found!4339) lt!237048) ((_ is MissingZero!4339) lt!237048) (not ((_ is MissingVacant!4339) lt!237048)) (and (bvsge (index!19547 lt!237048) #b00000000000000000000000000000000) (bvslt (index!19547 lt!237048) (size!16280 a!3235)))) (or ((_ is Undefined!4339) lt!237048) (ite ((_ is Found!4339) lt!237048) (= (select (arr!15916 a!3235) (index!19545 lt!237048)) (select (arr!15916 a!3235) j!176)) (ite ((_ is MissingZero!4339) lt!237048) (= (select (arr!15916 a!3235) (index!19544 lt!237048)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4339) lt!237048) (= (select (arr!15916 a!3235) (index!19547 lt!237048)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79831 (= lt!237048 e!302120)))

(declare-fun c!60721 () Bool)

(assert (=> d!79831 (= c!60721 (and ((_ is Intermediate!4339) lt!237050) (undefined!5151 lt!237050)))))

(assert (=> d!79831 (= lt!237050 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15916 a!3235) j!176) mask!3524) (select (arr!15916 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79831 (validMask!0 mask!3524)))

(assert (=> d!79831 (= (seekEntryOrOpen!0 (select (arr!15916 a!3235) j!176) a!3235 mask!3524) lt!237048)))

(declare-fun b!517739 () Bool)

(assert (=> b!517739 (= e!302120 e!302121)))

(assert (=> b!517739 (= lt!237047 (select (arr!15916 a!3235) (index!19546 lt!237050)))))

(declare-fun c!60720 () Bool)

(assert (=> b!517739 (= c!60720 (= lt!237047 (select (arr!15916 a!3235) j!176)))))

(declare-fun b!517740 () Bool)

(assert (=> b!517740 (= e!302122 (MissingZero!4339 (index!19546 lt!237050)))))

(assert (= (and d!79831 c!60721) b!517736))

(assert (= (and d!79831 (not c!60721)) b!517739))

(assert (= (and b!517739 c!60720) b!517737))

(assert (= (and b!517739 (not c!60720)) b!517735))

(assert (= (and b!517735 c!60719) b!517740))

(assert (= (and b!517735 (not c!60719)) b!517738))

(assert (=> b!517738 m!499125))

(declare-fun m!499335 () Bool)

(assert (=> b!517738 m!499335))

(assert (=> d!79831 m!499147))

(declare-fun m!499339 () Bool)

(assert (=> d!79831 m!499339))

(assert (=> d!79831 m!499137))

(assert (=> d!79831 m!499125))

(declare-fun m!499341 () Bool)

(assert (=> d!79831 m!499341))

(declare-fun m!499343 () Bool)

(assert (=> d!79831 m!499343))

(declare-fun m!499345 () Bool)

(assert (=> d!79831 m!499345))

(assert (=> d!79831 m!499125))

(assert (=> d!79831 m!499137))

(declare-fun m!499347 () Bool)

(assert (=> b!517739 m!499347))

(assert (=> b!517490 d!79831))

(declare-fun d!79847 () Bool)

(assert (=> d!79847 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!517491 d!79847))

(declare-fun b!517741 () Bool)

(declare-fun c!60722 () Bool)

(declare-fun lt!237055 () (_ BitVec 64))

(assert (=> b!517741 (= c!60722 (= lt!237055 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!302124 () SeekEntryResult!4339)

(declare-fun e!302125 () SeekEntryResult!4339)

(assert (=> b!517741 (= e!302124 e!302125)))

(declare-fun b!517742 () Bool)

(declare-fun e!302123 () SeekEntryResult!4339)

(assert (=> b!517742 (= e!302123 Undefined!4339)))

(declare-fun b!517743 () Bool)

(declare-fun lt!237057 () SeekEntryResult!4339)

(assert (=> b!517743 (= e!302124 (Found!4339 (index!19546 lt!237057)))))

(declare-fun b!517744 () Bool)

(assert (=> b!517744 (= e!302125 (seekKeyOrZeroReturnVacant!0 (x!48655 lt!237057) (index!19546 lt!237057) (index!19546 lt!237057) k0!2280 a!3235 mask!3524))))

(declare-fun d!79849 () Bool)

(declare-fun lt!237056 () SeekEntryResult!4339)

(assert (=> d!79849 (and (or ((_ is Undefined!4339) lt!237056) (not ((_ is Found!4339) lt!237056)) (and (bvsge (index!19545 lt!237056) #b00000000000000000000000000000000) (bvslt (index!19545 lt!237056) (size!16280 a!3235)))) (or ((_ is Undefined!4339) lt!237056) ((_ is Found!4339) lt!237056) (not ((_ is MissingZero!4339) lt!237056)) (and (bvsge (index!19544 lt!237056) #b00000000000000000000000000000000) (bvslt (index!19544 lt!237056) (size!16280 a!3235)))) (or ((_ is Undefined!4339) lt!237056) ((_ is Found!4339) lt!237056) ((_ is MissingZero!4339) lt!237056) (not ((_ is MissingVacant!4339) lt!237056)) (and (bvsge (index!19547 lt!237056) #b00000000000000000000000000000000) (bvslt (index!19547 lt!237056) (size!16280 a!3235)))) (or ((_ is Undefined!4339) lt!237056) (ite ((_ is Found!4339) lt!237056) (= (select (arr!15916 a!3235) (index!19545 lt!237056)) k0!2280) (ite ((_ is MissingZero!4339) lt!237056) (= (select (arr!15916 a!3235) (index!19544 lt!237056)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4339) lt!237056) (= (select (arr!15916 a!3235) (index!19547 lt!237056)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79849 (= lt!237056 e!302123)))

(declare-fun c!60724 () Bool)

(assert (=> d!79849 (= c!60724 (and ((_ is Intermediate!4339) lt!237057) (undefined!5151 lt!237057)))))

(assert (=> d!79849 (= lt!237057 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!79849 (validMask!0 mask!3524)))

(assert (=> d!79849 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!237056)))

(declare-fun b!517745 () Bool)

(assert (=> b!517745 (= e!302123 e!302124)))

(assert (=> b!517745 (= lt!237055 (select (arr!15916 a!3235) (index!19546 lt!237057)))))

(declare-fun c!60723 () Bool)

(assert (=> b!517745 (= c!60723 (= lt!237055 k0!2280))))

(declare-fun b!517746 () Bool)

(assert (=> b!517746 (= e!302125 (MissingZero!4339 (index!19546 lt!237057)))))

(assert (= (and d!79849 c!60724) b!517742))

(assert (= (and d!79849 (not c!60724)) b!517745))

(assert (= (and b!517745 c!60723) b!517743))

(assert (= (and b!517745 (not c!60723)) b!517741))

(assert (= (and b!517741 c!60722) b!517746))

(assert (= (and b!517741 (not c!60722)) b!517744))

(declare-fun m!499349 () Bool)

(assert (=> b!517744 m!499349))

(assert (=> d!79849 m!499147))

(declare-fun m!499351 () Bool)

(assert (=> d!79849 m!499351))

(declare-fun m!499353 () Bool)

(assert (=> d!79849 m!499353))

(declare-fun m!499355 () Bool)

(assert (=> d!79849 m!499355))

(declare-fun m!499357 () Bool)

(assert (=> d!79849 m!499357))

(declare-fun m!499359 () Bool)

(assert (=> d!79849 m!499359))

(assert (=> d!79849 m!499353))

(declare-fun m!499361 () Bool)

(assert (=> b!517745 m!499361))

(assert (=> b!517486 d!79849))

(check-sat (not d!79815) (not b!517738) (not b!517744) (not d!79801) (not d!79809) (not b!517614) (not d!79849) (not b!517572) (not b!517585) (not b!517629) (not d!79831) (not bm!31671) (not bm!31668) (not b!517640) (not b!517639) (not b!517586) (not b!517576) (not b!517574) (not bm!31674) (not b!517652))
(check-sat)

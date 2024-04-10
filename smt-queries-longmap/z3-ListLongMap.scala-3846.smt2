; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52888 () Bool)

(assert start!52888)

(declare-datatypes ((array!35976 0))(
  ( (array!35977 (arr!17269 (Array (_ BitVec 32) (_ BitVec 64))) (size!17633 (_ BitVec 32))) )
))
(declare-fun lt!263723 () array!35976)

(declare-datatypes ((SeekEntryResult!5718 0))(
  ( (MissingZero!5718 (index!25099 (_ BitVec 32))) (Found!5718 (index!25100 (_ BitVec 32))) (Intermediate!5718 (undefined!6530 Bool) (index!25101 (_ BitVec 32)) (x!53989 (_ BitVec 32))) (Undefined!5718) (MissingVacant!5718 (index!25102 (_ BitVec 32))) )
))
(declare-fun lt!263724 () SeekEntryResult!5718)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun e!331697 () Bool)

(declare-fun lt!263727 () (_ BitVec 64))

(declare-fun b!576572 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35976 (_ BitVec 32)) SeekEntryResult!5718)

(assert (=> b!576572 (= e!331697 (= lt!263724 (seekEntryOrOpen!0 lt!263727 lt!263723 mask!3119)))))

(declare-fun b!576573 () Bool)

(declare-fun res!364813 () Bool)

(declare-fun e!331698 () Bool)

(assert (=> b!576573 (=> (not res!364813) (not e!331698))))

(declare-fun a!3118 () array!35976)

(declare-datatypes ((List!11349 0))(
  ( (Nil!11346) (Cons!11345 (h!12387 (_ BitVec 64)) (t!17577 List!11349)) )
))
(declare-fun arrayNoDuplicates!0 (array!35976 (_ BitVec 32) List!11349) Bool)

(assert (=> b!576573 (= res!364813 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11346))))

(declare-fun b!576574 () Bool)

(declare-fun res!364807 () Bool)

(declare-fun e!331700 () Bool)

(assert (=> b!576574 (=> (not res!364807) (not e!331700))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!576574 (= res!364807 (validKeyInArray!0 k0!1914))))

(declare-fun b!576576 () Bool)

(declare-fun e!331701 () Bool)

(assert (=> b!576576 (= e!331701 (not e!331697))))

(declare-fun res!364806 () Bool)

(assert (=> b!576576 (=> res!364806 e!331697)))

(declare-fun lt!263725 () Bool)

(declare-fun lt!263726 () SeekEntryResult!5718)

(assert (=> b!576576 (= res!364806 (or (and (not lt!263725) (undefined!6530 lt!263726)) (and (not lt!263725) (not (undefined!6530 lt!263726)))))))

(get-info :version)

(assert (=> b!576576 (= lt!263725 (not ((_ is Intermediate!5718) lt!263726)))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!576576 (= lt!263724 (Found!5718 j!142))))

(assert (=> b!576576 (= lt!263724 (seekEntryOrOpen!0 (select (arr!17269 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35976 (_ BitVec 32)) Bool)

(assert (=> b!576576 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18138 0))(
  ( (Unit!18139) )
))
(declare-fun lt!263728 () Unit!18138)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35976 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18138)

(assert (=> b!576576 (= lt!263728 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!576577 () Bool)

(assert (=> b!576577 (= e!331698 e!331701)))

(declare-fun res!364811 () Bool)

(assert (=> b!576577 (=> (not res!364811) (not e!331701))))

(declare-fun lt!263730 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35976 (_ BitVec 32)) SeekEntryResult!5718)

(assert (=> b!576577 (= res!364811 (= lt!263726 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263730 lt!263727 lt!263723 mask!3119)))))

(declare-fun lt!263729 () (_ BitVec 32))

(assert (=> b!576577 (= lt!263726 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263729 (select (arr!17269 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!576577 (= lt!263730 (toIndex!0 lt!263727 mask!3119))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!576577 (= lt!263727 (select (store (arr!17269 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!576577 (= lt!263729 (toIndex!0 (select (arr!17269 a!3118) j!142) mask!3119))))

(assert (=> b!576577 (= lt!263723 (array!35977 (store (arr!17269 a!3118) i!1132 k0!1914) (size!17633 a!3118)))))

(declare-fun b!576578 () Bool)

(assert (=> b!576578 (= e!331700 e!331698)))

(declare-fun res!364812 () Bool)

(assert (=> b!576578 (=> (not res!364812) (not e!331698))))

(declare-fun lt!263731 () SeekEntryResult!5718)

(assert (=> b!576578 (= res!364812 (or (= lt!263731 (MissingZero!5718 i!1132)) (= lt!263731 (MissingVacant!5718 i!1132))))))

(assert (=> b!576578 (= lt!263731 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!576579 () Bool)

(declare-fun res!364808 () Bool)

(assert (=> b!576579 (=> (not res!364808) (not e!331700))))

(assert (=> b!576579 (= res!364808 (validKeyInArray!0 (select (arr!17269 a!3118) j!142)))))

(declare-fun b!576580 () Bool)

(declare-fun res!364805 () Bool)

(assert (=> b!576580 (=> (not res!364805) (not e!331700))))

(assert (=> b!576580 (= res!364805 (and (= (size!17633 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17633 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17633 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!576581 () Bool)

(declare-fun res!364810 () Bool)

(assert (=> b!576581 (=> (not res!364810) (not e!331700))))

(declare-fun arrayContainsKey!0 (array!35976 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!576581 (= res!364810 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!364809 () Bool)

(assert (=> start!52888 (=> (not res!364809) (not e!331700))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52888 (= res!364809 (validMask!0 mask!3119))))

(assert (=> start!52888 e!331700))

(assert (=> start!52888 true))

(declare-fun array_inv!13065 (array!35976) Bool)

(assert (=> start!52888 (array_inv!13065 a!3118)))

(declare-fun b!576575 () Bool)

(declare-fun res!364814 () Bool)

(assert (=> b!576575 (=> (not res!364814) (not e!331698))))

(assert (=> b!576575 (= res!364814 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!52888 res!364809) b!576580))

(assert (= (and b!576580 res!364805) b!576579))

(assert (= (and b!576579 res!364808) b!576574))

(assert (= (and b!576574 res!364807) b!576581))

(assert (= (and b!576581 res!364810) b!576578))

(assert (= (and b!576578 res!364812) b!576575))

(assert (= (and b!576575 res!364814) b!576573))

(assert (= (and b!576573 res!364813) b!576577))

(assert (= (and b!576577 res!364811) b!576576))

(assert (= (and b!576576 (not res!364806)) b!576572))

(declare-fun m!555563 () Bool)

(assert (=> b!576574 m!555563))

(declare-fun m!555565 () Bool)

(assert (=> b!576572 m!555565))

(declare-fun m!555567 () Bool)

(assert (=> b!576579 m!555567))

(assert (=> b!576579 m!555567))

(declare-fun m!555569 () Bool)

(assert (=> b!576579 m!555569))

(declare-fun m!555571 () Bool)

(assert (=> b!576578 m!555571))

(assert (=> b!576576 m!555567))

(assert (=> b!576576 m!555567))

(declare-fun m!555573 () Bool)

(assert (=> b!576576 m!555573))

(declare-fun m!555575 () Bool)

(assert (=> b!576576 m!555575))

(declare-fun m!555577 () Bool)

(assert (=> b!576576 m!555577))

(declare-fun m!555579 () Bool)

(assert (=> b!576581 m!555579))

(declare-fun m!555581 () Bool)

(assert (=> b!576575 m!555581))

(assert (=> b!576577 m!555567))

(declare-fun m!555583 () Bool)

(assert (=> b!576577 m!555583))

(assert (=> b!576577 m!555567))

(declare-fun m!555585 () Bool)

(assert (=> b!576577 m!555585))

(declare-fun m!555587 () Bool)

(assert (=> b!576577 m!555587))

(declare-fun m!555589 () Bool)

(assert (=> b!576577 m!555589))

(assert (=> b!576577 m!555567))

(declare-fun m!555591 () Bool)

(assert (=> b!576577 m!555591))

(declare-fun m!555593 () Bool)

(assert (=> b!576577 m!555593))

(declare-fun m!555595 () Bool)

(assert (=> b!576573 m!555595))

(declare-fun m!555597 () Bool)

(assert (=> start!52888 m!555597))

(declare-fun m!555599 () Bool)

(assert (=> start!52888 m!555599))

(check-sat (not b!576576) (not b!576579) (not b!576577) (not start!52888) (not b!576572) (not b!576581) (not b!576573) (not b!576575) (not b!576578) (not b!576574))
(check-sat)
(get-model)

(declare-fun d!85403 () Bool)

(declare-fun res!364849 () Bool)

(declare-fun e!331721 () Bool)

(assert (=> d!85403 (=> res!364849 e!331721)))

(assert (=> d!85403 (= res!364849 (= (select (arr!17269 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!85403 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!331721)))

(declare-fun b!576616 () Bool)

(declare-fun e!331722 () Bool)

(assert (=> b!576616 (= e!331721 e!331722)))

(declare-fun res!364850 () Bool)

(assert (=> b!576616 (=> (not res!364850) (not e!331722))))

(assert (=> b!576616 (= res!364850 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17633 a!3118)))))

(declare-fun b!576617 () Bool)

(assert (=> b!576617 (= e!331722 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!85403 (not res!364849)) b!576616))

(assert (= (and b!576616 res!364850) b!576617))

(declare-fun m!555639 () Bool)

(assert (=> d!85403 m!555639))

(declare-fun m!555641 () Bool)

(assert (=> b!576617 m!555641))

(assert (=> b!576581 d!85403))

(declare-fun b!576626 () Bool)

(declare-fun e!331731 () Bool)

(declare-fun call!32732 () Bool)

(assert (=> b!576626 (= e!331731 call!32732)))

(declare-fun b!576627 () Bool)

(declare-fun e!331730 () Bool)

(declare-fun e!331729 () Bool)

(assert (=> b!576627 (= e!331730 e!331729)))

(declare-fun c!66251 () Bool)

(assert (=> b!576627 (= c!66251 (validKeyInArray!0 (select (arr!17269 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32729 () Bool)

(assert (=> bm!32729 (= call!32732 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun d!85405 () Bool)

(declare-fun res!364856 () Bool)

(assert (=> d!85405 (=> res!364856 e!331730)))

(assert (=> d!85405 (= res!364856 (bvsge #b00000000000000000000000000000000 (size!17633 a!3118)))))

(assert (=> d!85405 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!331730)))

(declare-fun b!576628 () Bool)

(assert (=> b!576628 (= e!331729 call!32732)))

(declare-fun b!576629 () Bool)

(assert (=> b!576629 (= e!331729 e!331731)))

(declare-fun lt!263766 () (_ BitVec 64))

(assert (=> b!576629 (= lt!263766 (select (arr!17269 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!263765 () Unit!18138)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35976 (_ BitVec 64) (_ BitVec 32)) Unit!18138)

(assert (=> b!576629 (= lt!263765 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!263766 #b00000000000000000000000000000000))))

(assert (=> b!576629 (arrayContainsKey!0 a!3118 lt!263766 #b00000000000000000000000000000000)))

(declare-fun lt!263767 () Unit!18138)

(assert (=> b!576629 (= lt!263767 lt!263765)))

(declare-fun res!364855 () Bool)

(assert (=> b!576629 (= res!364855 (= (seekEntryOrOpen!0 (select (arr!17269 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5718 #b00000000000000000000000000000000)))))

(assert (=> b!576629 (=> (not res!364855) (not e!331731))))

(assert (= (and d!85405 (not res!364856)) b!576627))

(assert (= (and b!576627 c!66251) b!576629))

(assert (= (and b!576627 (not c!66251)) b!576628))

(assert (= (and b!576629 res!364855) b!576626))

(assert (= (or b!576626 b!576628) bm!32729))

(assert (=> b!576627 m!555639))

(assert (=> b!576627 m!555639))

(declare-fun m!555643 () Bool)

(assert (=> b!576627 m!555643))

(declare-fun m!555645 () Bool)

(assert (=> bm!32729 m!555645))

(assert (=> b!576629 m!555639))

(declare-fun m!555647 () Bool)

(assert (=> b!576629 m!555647))

(declare-fun m!555649 () Bool)

(assert (=> b!576629 m!555649))

(assert (=> b!576629 m!555639))

(declare-fun m!555651 () Bool)

(assert (=> b!576629 m!555651))

(assert (=> b!576575 d!85405))

(declare-fun d!85407 () Bool)

(assert (=> d!85407 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!52888 d!85407))

(declare-fun d!85409 () Bool)

(assert (=> d!85409 (= (array_inv!13065 a!3118) (bvsge (size!17633 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!52888 d!85409))

(declare-fun b!576648 () Bool)

(declare-fun e!331746 () SeekEntryResult!5718)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!576648 (= e!331746 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!263730 #b00000000000000000000000000000000 mask!3119) lt!263727 lt!263723 mask!3119))))

(declare-fun b!576649 () Bool)

(declare-fun e!331744 () SeekEntryResult!5718)

(assert (=> b!576649 (= e!331744 (Intermediate!5718 true lt!263730 #b00000000000000000000000000000000))))

(declare-fun b!576650 () Bool)

(declare-fun lt!263773 () SeekEntryResult!5718)

(assert (=> b!576650 (and (bvsge (index!25101 lt!263773) #b00000000000000000000000000000000) (bvslt (index!25101 lt!263773) (size!17633 lt!263723)))))

(declare-fun e!331743 () Bool)

(assert (=> b!576650 (= e!331743 (= (select (arr!17269 lt!263723) (index!25101 lt!263773)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!85411 () Bool)

(declare-fun e!331745 () Bool)

(assert (=> d!85411 e!331745))

(declare-fun c!66259 () Bool)

(assert (=> d!85411 (= c!66259 (and ((_ is Intermediate!5718) lt!263773) (undefined!6530 lt!263773)))))

(assert (=> d!85411 (= lt!263773 e!331744)))

(declare-fun c!66260 () Bool)

(assert (=> d!85411 (= c!66260 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!263772 () (_ BitVec 64))

(assert (=> d!85411 (= lt!263772 (select (arr!17269 lt!263723) lt!263730))))

(assert (=> d!85411 (validMask!0 mask!3119)))

(assert (=> d!85411 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263730 lt!263727 lt!263723 mask!3119) lt!263773)))

(declare-fun b!576651 () Bool)

(declare-fun e!331742 () Bool)

(assert (=> b!576651 (= e!331745 e!331742)))

(declare-fun res!364865 () Bool)

(assert (=> b!576651 (= res!364865 (and ((_ is Intermediate!5718) lt!263773) (not (undefined!6530 lt!263773)) (bvslt (x!53989 lt!263773) #b01111111111111111111111111111110) (bvsge (x!53989 lt!263773) #b00000000000000000000000000000000) (bvsge (x!53989 lt!263773) #b00000000000000000000000000000000)))))

(assert (=> b!576651 (=> (not res!364865) (not e!331742))))

(declare-fun b!576652 () Bool)

(assert (=> b!576652 (= e!331746 (Intermediate!5718 false lt!263730 #b00000000000000000000000000000000))))

(declare-fun b!576653 () Bool)

(assert (=> b!576653 (and (bvsge (index!25101 lt!263773) #b00000000000000000000000000000000) (bvslt (index!25101 lt!263773) (size!17633 lt!263723)))))

(declare-fun res!364863 () Bool)

(assert (=> b!576653 (= res!364863 (= (select (arr!17269 lt!263723) (index!25101 lt!263773)) lt!263727))))

(assert (=> b!576653 (=> res!364863 e!331743)))

(assert (=> b!576653 (= e!331742 e!331743)))

(declare-fun b!576654 () Bool)

(assert (=> b!576654 (and (bvsge (index!25101 lt!263773) #b00000000000000000000000000000000) (bvslt (index!25101 lt!263773) (size!17633 lt!263723)))))

(declare-fun res!364864 () Bool)

(assert (=> b!576654 (= res!364864 (= (select (arr!17269 lt!263723) (index!25101 lt!263773)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!576654 (=> res!364864 e!331743)))

(declare-fun b!576655 () Bool)

(assert (=> b!576655 (= e!331744 e!331746)))

(declare-fun c!66258 () Bool)

(assert (=> b!576655 (= c!66258 (or (= lt!263772 lt!263727) (= (bvadd lt!263772 lt!263772) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!576656 () Bool)

(assert (=> b!576656 (= e!331745 (bvsge (x!53989 lt!263773) #b01111111111111111111111111111110))))

(assert (= (and d!85411 c!66260) b!576649))

(assert (= (and d!85411 (not c!66260)) b!576655))

(assert (= (and b!576655 c!66258) b!576652))

(assert (= (and b!576655 (not c!66258)) b!576648))

(assert (= (and d!85411 c!66259) b!576656))

(assert (= (and d!85411 (not c!66259)) b!576651))

(assert (= (and b!576651 res!364865) b!576653))

(assert (= (and b!576653 (not res!364863)) b!576654))

(assert (= (and b!576654 (not res!364864)) b!576650))

(declare-fun m!555653 () Bool)

(assert (=> d!85411 m!555653))

(assert (=> d!85411 m!555597))

(declare-fun m!555655 () Bool)

(assert (=> b!576650 m!555655))

(declare-fun m!555657 () Bool)

(assert (=> b!576648 m!555657))

(assert (=> b!576648 m!555657))

(declare-fun m!555659 () Bool)

(assert (=> b!576648 m!555659))

(assert (=> b!576654 m!555655))

(assert (=> b!576653 m!555655))

(assert (=> b!576577 d!85411))

(declare-fun b!576665 () Bool)

(declare-fun e!331755 () SeekEntryResult!5718)

(assert (=> b!576665 (= e!331755 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!263729 #b00000000000000000000000000000000 mask!3119) (select (arr!17269 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!576666 () Bool)

(declare-fun e!331753 () SeekEntryResult!5718)

(assert (=> b!576666 (= e!331753 (Intermediate!5718 true lt!263729 #b00000000000000000000000000000000))))

(declare-fun b!576667 () Bool)

(declare-fun lt!263781 () SeekEntryResult!5718)

(assert (=> b!576667 (and (bvsge (index!25101 lt!263781) #b00000000000000000000000000000000) (bvslt (index!25101 lt!263781) (size!17633 a!3118)))))

(declare-fun e!331752 () Bool)

(assert (=> b!576667 (= e!331752 (= (select (arr!17269 a!3118) (index!25101 lt!263781)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!85421 () Bool)

(declare-fun e!331754 () Bool)

(assert (=> d!85421 e!331754))

(declare-fun c!66266 () Bool)

(assert (=> d!85421 (= c!66266 (and ((_ is Intermediate!5718) lt!263781) (undefined!6530 lt!263781)))))

(assert (=> d!85421 (= lt!263781 e!331753)))

(declare-fun c!66267 () Bool)

(assert (=> d!85421 (= c!66267 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!263780 () (_ BitVec 64))

(assert (=> d!85421 (= lt!263780 (select (arr!17269 a!3118) lt!263729))))

(assert (=> d!85421 (validMask!0 mask!3119)))

(assert (=> d!85421 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263729 (select (arr!17269 a!3118) j!142) a!3118 mask!3119) lt!263781)))

(declare-fun b!576668 () Bool)

(declare-fun e!331751 () Bool)

(assert (=> b!576668 (= e!331754 e!331751)))

(declare-fun res!364868 () Bool)

(assert (=> b!576668 (= res!364868 (and ((_ is Intermediate!5718) lt!263781) (not (undefined!6530 lt!263781)) (bvslt (x!53989 lt!263781) #b01111111111111111111111111111110) (bvsge (x!53989 lt!263781) #b00000000000000000000000000000000) (bvsge (x!53989 lt!263781) #b00000000000000000000000000000000)))))

(assert (=> b!576668 (=> (not res!364868) (not e!331751))))

(declare-fun b!576669 () Bool)

(assert (=> b!576669 (= e!331755 (Intermediate!5718 false lt!263729 #b00000000000000000000000000000000))))

(declare-fun b!576670 () Bool)

(assert (=> b!576670 (and (bvsge (index!25101 lt!263781) #b00000000000000000000000000000000) (bvslt (index!25101 lt!263781) (size!17633 a!3118)))))

(declare-fun res!364866 () Bool)

(assert (=> b!576670 (= res!364866 (= (select (arr!17269 a!3118) (index!25101 lt!263781)) (select (arr!17269 a!3118) j!142)))))

(assert (=> b!576670 (=> res!364866 e!331752)))

(assert (=> b!576670 (= e!331751 e!331752)))

(declare-fun b!576671 () Bool)

(assert (=> b!576671 (and (bvsge (index!25101 lt!263781) #b00000000000000000000000000000000) (bvslt (index!25101 lt!263781) (size!17633 a!3118)))))

(declare-fun res!364867 () Bool)

(assert (=> b!576671 (= res!364867 (= (select (arr!17269 a!3118) (index!25101 lt!263781)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!576671 (=> res!364867 e!331752)))

(declare-fun b!576672 () Bool)

(assert (=> b!576672 (= e!331753 e!331755)))

(declare-fun c!66265 () Bool)

(assert (=> b!576672 (= c!66265 (or (= lt!263780 (select (arr!17269 a!3118) j!142)) (= (bvadd lt!263780 lt!263780) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!576673 () Bool)

(assert (=> b!576673 (= e!331754 (bvsge (x!53989 lt!263781) #b01111111111111111111111111111110))))

(assert (= (and d!85421 c!66267) b!576666))

(assert (= (and d!85421 (not c!66267)) b!576672))

(assert (= (and b!576672 c!66265) b!576669))

(assert (= (and b!576672 (not c!66265)) b!576665))

(assert (= (and d!85421 c!66266) b!576673))

(assert (= (and d!85421 (not c!66266)) b!576668))

(assert (= (and b!576668 res!364868) b!576670))

(assert (= (and b!576670 (not res!364866)) b!576671))

(assert (= (and b!576671 (not res!364867)) b!576667))

(declare-fun m!555661 () Bool)

(assert (=> d!85421 m!555661))

(assert (=> d!85421 m!555597))

(declare-fun m!555663 () Bool)

(assert (=> b!576667 m!555663))

(declare-fun m!555665 () Bool)

(assert (=> b!576665 m!555665))

(assert (=> b!576665 m!555665))

(assert (=> b!576665 m!555567))

(declare-fun m!555667 () Bool)

(assert (=> b!576665 m!555667))

(assert (=> b!576671 m!555663))

(assert (=> b!576670 m!555663))

(assert (=> b!576577 d!85421))

(declare-fun d!85423 () Bool)

(declare-fun lt!263796 () (_ BitVec 32))

(declare-fun lt!263795 () (_ BitVec 32))

(assert (=> d!85423 (= lt!263796 (bvmul (bvxor lt!263795 (bvlshr lt!263795 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!85423 (= lt!263795 ((_ extract 31 0) (bvand (bvxor lt!263727 (bvlshr lt!263727 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!85423 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!364869 (let ((h!12389 ((_ extract 31 0) (bvand (bvxor lt!263727 (bvlshr lt!263727 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53992 (bvmul (bvxor h!12389 (bvlshr h!12389 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53992 (bvlshr x!53992 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!364869 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!364869 #b00000000000000000000000000000000))))))

(assert (=> d!85423 (= (toIndex!0 lt!263727 mask!3119) (bvand (bvxor lt!263796 (bvlshr lt!263796 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!576577 d!85423))

(declare-fun d!85427 () Bool)

(declare-fun lt!263798 () (_ BitVec 32))

(declare-fun lt!263797 () (_ BitVec 32))

(assert (=> d!85427 (= lt!263798 (bvmul (bvxor lt!263797 (bvlshr lt!263797 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!85427 (= lt!263797 ((_ extract 31 0) (bvand (bvxor (select (arr!17269 a!3118) j!142) (bvlshr (select (arr!17269 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!85427 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!364869 (let ((h!12389 ((_ extract 31 0) (bvand (bvxor (select (arr!17269 a!3118) j!142) (bvlshr (select (arr!17269 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53992 (bvmul (bvxor h!12389 (bvlshr h!12389 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53992 (bvlshr x!53992 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!364869 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!364869 #b00000000000000000000000000000000))))))

(assert (=> d!85427 (= (toIndex!0 (select (arr!17269 a!3118) j!142) mask!3119) (bvand (bvxor lt!263798 (bvlshr lt!263798 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!576577 d!85427))

(declare-fun b!576759 () Bool)

(declare-fun e!331810 () SeekEntryResult!5718)

(declare-fun lt!263836 () SeekEntryResult!5718)

(assert (=> b!576759 (= e!331810 (MissingZero!5718 (index!25101 lt!263836)))))

(declare-fun b!576760 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35976 (_ BitVec 32)) SeekEntryResult!5718)

(assert (=> b!576760 (= e!331810 (seekKeyOrZeroReturnVacant!0 (x!53989 lt!263836) (index!25101 lt!263836) (index!25101 lt!263836) (select (arr!17269 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!576761 () Bool)

(declare-fun e!331811 () SeekEntryResult!5718)

(assert (=> b!576761 (= e!331811 Undefined!5718)))

(declare-fun b!576762 () Bool)

(declare-fun e!331809 () SeekEntryResult!5718)

(assert (=> b!576762 (= e!331809 (Found!5718 (index!25101 lt!263836)))))

(declare-fun d!85429 () Bool)

(declare-fun lt!263835 () SeekEntryResult!5718)

(assert (=> d!85429 (and (or ((_ is Undefined!5718) lt!263835) (not ((_ is Found!5718) lt!263835)) (and (bvsge (index!25100 lt!263835) #b00000000000000000000000000000000) (bvslt (index!25100 lt!263835) (size!17633 a!3118)))) (or ((_ is Undefined!5718) lt!263835) ((_ is Found!5718) lt!263835) (not ((_ is MissingZero!5718) lt!263835)) (and (bvsge (index!25099 lt!263835) #b00000000000000000000000000000000) (bvslt (index!25099 lt!263835) (size!17633 a!3118)))) (or ((_ is Undefined!5718) lt!263835) ((_ is Found!5718) lt!263835) ((_ is MissingZero!5718) lt!263835) (not ((_ is MissingVacant!5718) lt!263835)) (and (bvsge (index!25102 lt!263835) #b00000000000000000000000000000000) (bvslt (index!25102 lt!263835) (size!17633 a!3118)))) (or ((_ is Undefined!5718) lt!263835) (ite ((_ is Found!5718) lt!263835) (= (select (arr!17269 a!3118) (index!25100 lt!263835)) (select (arr!17269 a!3118) j!142)) (ite ((_ is MissingZero!5718) lt!263835) (= (select (arr!17269 a!3118) (index!25099 lt!263835)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5718) lt!263835) (= (select (arr!17269 a!3118) (index!25102 lt!263835)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85429 (= lt!263835 e!331811)))

(declare-fun c!66301 () Bool)

(assert (=> d!85429 (= c!66301 (and ((_ is Intermediate!5718) lt!263836) (undefined!6530 lt!263836)))))

(assert (=> d!85429 (= lt!263836 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17269 a!3118) j!142) mask!3119) (select (arr!17269 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!85429 (validMask!0 mask!3119)))

(assert (=> d!85429 (= (seekEntryOrOpen!0 (select (arr!17269 a!3118) j!142) a!3118 mask!3119) lt!263835)))

(declare-fun b!576763 () Bool)

(declare-fun c!66302 () Bool)

(declare-fun lt!263837 () (_ BitVec 64))

(assert (=> b!576763 (= c!66302 (= lt!263837 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!576763 (= e!331809 e!331810)))

(declare-fun b!576764 () Bool)

(assert (=> b!576764 (= e!331811 e!331809)))

(assert (=> b!576764 (= lt!263837 (select (arr!17269 a!3118) (index!25101 lt!263836)))))

(declare-fun c!66300 () Bool)

(assert (=> b!576764 (= c!66300 (= lt!263837 (select (arr!17269 a!3118) j!142)))))

(assert (= (and d!85429 c!66301) b!576761))

(assert (= (and d!85429 (not c!66301)) b!576764))

(assert (= (and b!576764 c!66300) b!576762))

(assert (= (and b!576764 (not c!66300)) b!576763))

(assert (= (and b!576763 c!66302) b!576759))

(assert (= (and b!576763 (not c!66302)) b!576760))

(assert (=> b!576760 m!555567))

(declare-fun m!555731 () Bool)

(assert (=> b!576760 m!555731))

(assert (=> d!85429 m!555583))

(assert (=> d!85429 m!555567))

(declare-fun m!555733 () Bool)

(assert (=> d!85429 m!555733))

(declare-fun m!555735 () Bool)

(assert (=> d!85429 m!555735))

(declare-fun m!555737 () Bool)

(assert (=> d!85429 m!555737))

(assert (=> d!85429 m!555597))

(assert (=> d!85429 m!555567))

(assert (=> d!85429 m!555583))

(declare-fun m!555739 () Bool)

(assert (=> d!85429 m!555739))

(declare-fun m!555743 () Bool)

(assert (=> b!576764 m!555743))

(assert (=> b!576576 d!85429))

(declare-fun b!576771 () Bool)

(declare-fun e!331817 () Bool)

(declare-fun call!32742 () Bool)

(assert (=> b!576771 (= e!331817 call!32742)))

(declare-fun b!576772 () Bool)

(declare-fun e!331816 () Bool)

(declare-fun e!331815 () Bool)

(assert (=> b!576772 (= e!331816 e!331815)))

(declare-fun c!66306 () Bool)

(assert (=> b!576772 (= c!66306 (validKeyInArray!0 (select (arr!17269 a!3118) j!142)))))

(declare-fun bm!32739 () Bool)

(assert (=> bm!32739 (= call!32742 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun d!85445 () Bool)

(declare-fun res!364892 () Bool)

(assert (=> d!85445 (=> res!364892 e!331816)))

(assert (=> d!85445 (= res!364892 (bvsge j!142 (size!17633 a!3118)))))

(assert (=> d!85445 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!331816)))

(declare-fun b!576773 () Bool)

(assert (=> b!576773 (= e!331815 call!32742)))

(declare-fun b!576774 () Bool)

(assert (=> b!576774 (= e!331815 e!331817)))

(declare-fun lt!263842 () (_ BitVec 64))

(assert (=> b!576774 (= lt!263842 (select (arr!17269 a!3118) j!142))))

(declare-fun lt!263841 () Unit!18138)

(assert (=> b!576774 (= lt!263841 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!263842 j!142))))

(assert (=> b!576774 (arrayContainsKey!0 a!3118 lt!263842 #b00000000000000000000000000000000)))

(declare-fun lt!263843 () Unit!18138)

(assert (=> b!576774 (= lt!263843 lt!263841)))

(declare-fun res!364891 () Bool)

(assert (=> b!576774 (= res!364891 (= (seekEntryOrOpen!0 (select (arr!17269 a!3118) j!142) a!3118 mask!3119) (Found!5718 j!142)))))

(assert (=> b!576774 (=> (not res!364891) (not e!331817))))

(assert (= (and d!85445 (not res!364892)) b!576772))

(assert (= (and b!576772 c!66306) b!576774))

(assert (= (and b!576772 (not c!66306)) b!576773))

(assert (= (and b!576774 res!364891) b!576771))

(assert (= (or b!576771 b!576773) bm!32739))

(assert (=> b!576772 m!555567))

(assert (=> b!576772 m!555567))

(assert (=> b!576772 m!555569))

(declare-fun m!555757 () Bool)

(assert (=> bm!32739 m!555757))

(assert (=> b!576774 m!555567))

(declare-fun m!555759 () Bool)

(assert (=> b!576774 m!555759))

(declare-fun m!555761 () Bool)

(assert (=> b!576774 m!555761))

(assert (=> b!576774 m!555567))

(assert (=> b!576774 m!555573))

(assert (=> b!576576 d!85445))

(declare-fun d!85449 () Bool)

(assert (=> d!85449 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!263846 () Unit!18138)

(declare-fun choose!38 (array!35976 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18138)

(assert (=> d!85449 (= lt!263846 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!85449 (validMask!0 mask!3119)))

(assert (=> d!85449 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!263846)))

(declare-fun bs!17820 () Bool)

(assert (= bs!17820 d!85449))

(assert (=> bs!17820 m!555575))

(declare-fun m!555765 () Bool)

(assert (=> bs!17820 m!555765))

(assert (=> bs!17820 m!555597))

(assert (=> b!576576 d!85449))

(declare-fun b!576791 () Bool)

(declare-fun e!331835 () Bool)

(declare-fun e!331833 () Bool)

(assert (=> b!576791 (= e!331835 e!331833)))

(declare-fun c!66309 () Bool)

(assert (=> b!576791 (= c!66309 (validKeyInArray!0 (select (arr!17269 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!85457 () Bool)

(declare-fun res!364905 () Bool)

(declare-fun e!331834 () Bool)

(assert (=> d!85457 (=> res!364905 e!331834)))

(assert (=> d!85457 (= res!364905 (bvsge #b00000000000000000000000000000000 (size!17633 a!3118)))))

(assert (=> d!85457 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11346) e!331834)))

(declare-fun b!576792 () Bool)

(declare-fun call!32745 () Bool)

(assert (=> b!576792 (= e!331833 call!32745)))

(declare-fun b!576793 () Bool)

(declare-fun e!331832 () Bool)

(declare-fun contains!2896 (List!11349 (_ BitVec 64)) Bool)

(assert (=> b!576793 (= e!331832 (contains!2896 Nil!11346 (select (arr!17269 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32742 () Bool)

(assert (=> bm!32742 (= call!32745 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!66309 (Cons!11345 (select (arr!17269 a!3118) #b00000000000000000000000000000000) Nil!11346) Nil!11346)))))

(declare-fun b!576794 () Bool)

(assert (=> b!576794 (= e!331834 e!331835)))

(declare-fun res!364906 () Bool)

(assert (=> b!576794 (=> (not res!364906) (not e!331835))))

(assert (=> b!576794 (= res!364906 (not e!331832))))

(declare-fun res!364907 () Bool)

(assert (=> b!576794 (=> (not res!364907) (not e!331832))))

(assert (=> b!576794 (= res!364907 (validKeyInArray!0 (select (arr!17269 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!576795 () Bool)

(assert (=> b!576795 (= e!331833 call!32745)))

(assert (= (and d!85457 (not res!364905)) b!576794))

(assert (= (and b!576794 res!364907) b!576793))

(assert (= (and b!576794 res!364906) b!576791))

(assert (= (and b!576791 c!66309) b!576792))

(assert (= (and b!576791 (not c!66309)) b!576795))

(assert (= (or b!576792 b!576795) bm!32742))

(assert (=> b!576791 m!555639))

(assert (=> b!576791 m!555639))

(assert (=> b!576791 m!555643))

(assert (=> b!576793 m!555639))

(assert (=> b!576793 m!555639))

(declare-fun m!555767 () Bool)

(assert (=> b!576793 m!555767))

(assert (=> bm!32742 m!555639))

(declare-fun m!555769 () Bool)

(assert (=> bm!32742 m!555769))

(assert (=> b!576794 m!555639))

(assert (=> b!576794 m!555639))

(assert (=> b!576794 m!555643))

(assert (=> b!576573 d!85457))

(declare-fun b!576796 () Bool)

(declare-fun e!331837 () SeekEntryResult!5718)

(declare-fun lt!263848 () SeekEntryResult!5718)

(assert (=> b!576796 (= e!331837 (MissingZero!5718 (index!25101 lt!263848)))))

(declare-fun b!576797 () Bool)

(assert (=> b!576797 (= e!331837 (seekKeyOrZeroReturnVacant!0 (x!53989 lt!263848) (index!25101 lt!263848) (index!25101 lt!263848) k0!1914 a!3118 mask!3119))))

(declare-fun b!576798 () Bool)

(declare-fun e!331838 () SeekEntryResult!5718)

(assert (=> b!576798 (= e!331838 Undefined!5718)))

(declare-fun b!576799 () Bool)

(declare-fun e!331836 () SeekEntryResult!5718)

(assert (=> b!576799 (= e!331836 (Found!5718 (index!25101 lt!263848)))))

(declare-fun d!85459 () Bool)

(declare-fun lt!263847 () SeekEntryResult!5718)

(assert (=> d!85459 (and (or ((_ is Undefined!5718) lt!263847) (not ((_ is Found!5718) lt!263847)) (and (bvsge (index!25100 lt!263847) #b00000000000000000000000000000000) (bvslt (index!25100 lt!263847) (size!17633 a!3118)))) (or ((_ is Undefined!5718) lt!263847) ((_ is Found!5718) lt!263847) (not ((_ is MissingZero!5718) lt!263847)) (and (bvsge (index!25099 lt!263847) #b00000000000000000000000000000000) (bvslt (index!25099 lt!263847) (size!17633 a!3118)))) (or ((_ is Undefined!5718) lt!263847) ((_ is Found!5718) lt!263847) ((_ is MissingZero!5718) lt!263847) (not ((_ is MissingVacant!5718) lt!263847)) (and (bvsge (index!25102 lt!263847) #b00000000000000000000000000000000) (bvslt (index!25102 lt!263847) (size!17633 a!3118)))) (or ((_ is Undefined!5718) lt!263847) (ite ((_ is Found!5718) lt!263847) (= (select (arr!17269 a!3118) (index!25100 lt!263847)) k0!1914) (ite ((_ is MissingZero!5718) lt!263847) (= (select (arr!17269 a!3118) (index!25099 lt!263847)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5718) lt!263847) (= (select (arr!17269 a!3118) (index!25102 lt!263847)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85459 (= lt!263847 e!331838)))

(declare-fun c!66311 () Bool)

(assert (=> d!85459 (= c!66311 (and ((_ is Intermediate!5718) lt!263848) (undefined!6530 lt!263848)))))

(assert (=> d!85459 (= lt!263848 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!85459 (validMask!0 mask!3119)))

(assert (=> d!85459 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!263847)))

(declare-fun b!576800 () Bool)

(declare-fun c!66312 () Bool)

(declare-fun lt!263849 () (_ BitVec 64))

(assert (=> b!576800 (= c!66312 (= lt!263849 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!576800 (= e!331836 e!331837)))

(declare-fun b!576801 () Bool)

(assert (=> b!576801 (= e!331838 e!331836)))

(assert (=> b!576801 (= lt!263849 (select (arr!17269 a!3118) (index!25101 lt!263848)))))

(declare-fun c!66310 () Bool)

(assert (=> b!576801 (= c!66310 (= lt!263849 k0!1914))))

(assert (= (and d!85459 c!66311) b!576798))

(assert (= (and d!85459 (not c!66311)) b!576801))

(assert (= (and b!576801 c!66310) b!576799))

(assert (= (and b!576801 (not c!66310)) b!576800))

(assert (= (and b!576800 c!66312) b!576796))

(assert (= (and b!576800 (not c!66312)) b!576797))

(declare-fun m!555771 () Bool)

(assert (=> b!576797 m!555771))

(declare-fun m!555773 () Bool)

(assert (=> d!85459 m!555773))

(declare-fun m!555775 () Bool)

(assert (=> d!85459 m!555775))

(declare-fun m!555777 () Bool)

(assert (=> d!85459 m!555777))

(declare-fun m!555779 () Bool)

(assert (=> d!85459 m!555779))

(assert (=> d!85459 m!555597))

(assert (=> d!85459 m!555773))

(declare-fun m!555781 () Bool)

(assert (=> d!85459 m!555781))

(declare-fun m!555783 () Bool)

(assert (=> b!576801 m!555783))

(assert (=> b!576578 d!85459))

(declare-fun b!576810 () Bool)

(declare-fun e!331844 () SeekEntryResult!5718)

(declare-fun lt!263855 () SeekEntryResult!5718)

(assert (=> b!576810 (= e!331844 (MissingZero!5718 (index!25101 lt!263855)))))

(declare-fun b!576811 () Bool)

(assert (=> b!576811 (= e!331844 (seekKeyOrZeroReturnVacant!0 (x!53989 lt!263855) (index!25101 lt!263855) (index!25101 lt!263855) lt!263727 lt!263723 mask!3119))))

(declare-fun b!576812 () Bool)

(declare-fun e!331845 () SeekEntryResult!5718)

(assert (=> b!576812 (= e!331845 Undefined!5718)))

(declare-fun b!576813 () Bool)

(declare-fun e!331843 () SeekEntryResult!5718)

(assert (=> b!576813 (= e!331843 (Found!5718 (index!25101 lt!263855)))))

(declare-fun d!85461 () Bool)

(declare-fun lt!263854 () SeekEntryResult!5718)

(assert (=> d!85461 (and (or ((_ is Undefined!5718) lt!263854) (not ((_ is Found!5718) lt!263854)) (and (bvsge (index!25100 lt!263854) #b00000000000000000000000000000000) (bvslt (index!25100 lt!263854) (size!17633 lt!263723)))) (or ((_ is Undefined!5718) lt!263854) ((_ is Found!5718) lt!263854) (not ((_ is MissingZero!5718) lt!263854)) (and (bvsge (index!25099 lt!263854) #b00000000000000000000000000000000) (bvslt (index!25099 lt!263854) (size!17633 lt!263723)))) (or ((_ is Undefined!5718) lt!263854) ((_ is Found!5718) lt!263854) ((_ is MissingZero!5718) lt!263854) (not ((_ is MissingVacant!5718) lt!263854)) (and (bvsge (index!25102 lt!263854) #b00000000000000000000000000000000) (bvslt (index!25102 lt!263854) (size!17633 lt!263723)))) (or ((_ is Undefined!5718) lt!263854) (ite ((_ is Found!5718) lt!263854) (= (select (arr!17269 lt!263723) (index!25100 lt!263854)) lt!263727) (ite ((_ is MissingZero!5718) lt!263854) (= (select (arr!17269 lt!263723) (index!25099 lt!263854)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5718) lt!263854) (= (select (arr!17269 lt!263723) (index!25102 lt!263854)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85461 (= lt!263854 e!331845)))

(declare-fun c!66318 () Bool)

(assert (=> d!85461 (= c!66318 (and ((_ is Intermediate!5718) lt!263855) (undefined!6530 lt!263855)))))

(assert (=> d!85461 (= lt!263855 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!263727 mask!3119) lt!263727 lt!263723 mask!3119))))

(assert (=> d!85461 (validMask!0 mask!3119)))

(assert (=> d!85461 (= (seekEntryOrOpen!0 lt!263727 lt!263723 mask!3119) lt!263854)))

(declare-fun b!576814 () Bool)

(declare-fun c!66319 () Bool)

(declare-fun lt!263856 () (_ BitVec 64))

(assert (=> b!576814 (= c!66319 (= lt!263856 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!576814 (= e!331843 e!331844)))

(declare-fun b!576815 () Bool)

(assert (=> b!576815 (= e!331845 e!331843)))

(assert (=> b!576815 (= lt!263856 (select (arr!17269 lt!263723) (index!25101 lt!263855)))))

(declare-fun c!66317 () Bool)

(assert (=> b!576815 (= c!66317 (= lt!263856 lt!263727))))

(assert (= (and d!85461 c!66318) b!576812))

(assert (= (and d!85461 (not c!66318)) b!576815))

(assert (= (and b!576815 c!66317) b!576813))

(assert (= (and b!576815 (not c!66317)) b!576814))

(assert (= (and b!576814 c!66319) b!576810))

(assert (= (and b!576814 (not c!66319)) b!576811))

(declare-fun m!555785 () Bool)

(assert (=> b!576811 m!555785))

(assert (=> d!85461 m!555585))

(declare-fun m!555787 () Bool)

(assert (=> d!85461 m!555787))

(declare-fun m!555789 () Bool)

(assert (=> d!85461 m!555789))

(declare-fun m!555791 () Bool)

(assert (=> d!85461 m!555791))

(assert (=> d!85461 m!555597))

(assert (=> d!85461 m!555585))

(declare-fun m!555793 () Bool)

(assert (=> d!85461 m!555793))

(declare-fun m!555795 () Bool)

(assert (=> b!576815 m!555795))

(assert (=> b!576572 d!85461))

(declare-fun d!85463 () Bool)

(assert (=> d!85463 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!576574 d!85463))

(declare-fun d!85465 () Bool)

(assert (=> d!85465 (= (validKeyInArray!0 (select (arr!17269 a!3118) j!142)) (and (not (= (select (arr!17269 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17269 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!576579 d!85465))

(check-sat (not b!576648) (not b!576797) (not b!576627) (not b!576791) (not b!576774) (not bm!32729) (not bm!32739) (not b!576629) (not d!85459) (not d!85429) (not b!576793) (not d!85411) (not b!576811) (not d!85421) (not b!576760) (not b!576772) (not b!576794) (not b!576617) (not d!85449) (not d!85461) (not bm!32742) (not b!576665))
(check-sat)

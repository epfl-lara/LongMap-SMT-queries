; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52734 () Bool)

(assert start!52734)

(declare-fun b!574861 () Bool)

(declare-fun res!363457 () Bool)

(declare-fun e!330766 () Bool)

(assert (=> b!574861 (=> (not res!363457) (not e!330766))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35889 0))(
  ( (array!35890 (arr!17227 (Array (_ BitVec 32) (_ BitVec 64))) (size!17591 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35889)

(assert (=> b!574861 (= res!363457 (and (= (size!17591 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17591 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17591 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!574862 () Bool)

(declare-fun e!330763 () Bool)

(declare-fun e!330761 () Bool)

(assert (=> b!574862 (= e!330763 e!330761)))

(declare-fun res!363454 () Bool)

(assert (=> b!574862 (=> res!363454 e!330761)))

(declare-datatypes ((SeekEntryResult!5632 0))(
  ( (MissingZero!5632 (index!24755 (_ BitVec 32))) (Found!5632 (index!24756 (_ BitVec 32))) (Intermediate!5632 (undefined!6444 Bool) (index!24757 (_ BitVec 32)) (x!53795 (_ BitVec 32))) (Undefined!5632) (MissingVacant!5632 (index!24758 (_ BitVec 32))) )
))
(declare-fun lt!262588 () SeekEntryResult!5632)

(get-info :version)

(assert (=> b!574862 (= res!363454 (or (undefined!6444 lt!262588) (not ((_ is Intermediate!5632) lt!262588))))))

(declare-fun b!574863 () Bool)

(declare-fun res!363453 () Bool)

(assert (=> b!574863 (=> (not res!363453) (not e!330766))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!574863 (= res!363453 (validKeyInArray!0 k0!1914))))

(declare-fun b!574864 () Bool)

(declare-fun res!363451 () Bool)

(declare-fun e!330765 () Bool)

(assert (=> b!574864 (=> (not res!363451) (not e!330765))))

(declare-datatypes ((List!11214 0))(
  ( (Nil!11211) (Cons!11210 (h!12249 (_ BitVec 64)) (t!17434 List!11214)) )
))
(declare-fun arrayNoDuplicates!0 (array!35889 (_ BitVec 32) List!11214) Bool)

(assert (=> b!574864 (= res!363451 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11211))))

(declare-fun lt!262585 () (_ BitVec 64))

(declare-fun e!330762 () Bool)

(declare-fun lt!262580 () array!35889)

(declare-fun b!574865 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35889 (_ BitVec 32)) SeekEntryResult!5632)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35889 (_ BitVec 32)) SeekEntryResult!5632)

(assert (=> b!574865 (= e!330762 (= (seekEntryOrOpen!0 lt!262585 lt!262580 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53795 lt!262588) (index!24757 lt!262588) (index!24757 lt!262588) lt!262585 lt!262580 mask!3119)))))

(declare-fun e!330764 () Bool)

(declare-fun b!574866 () Bool)

(assert (=> b!574866 (= e!330764 (not (or (undefined!6444 lt!262588) (not ((_ is Intermediate!5632) lt!262588)) (let ((bdg!18025 (select (arr!17227 a!3118) (index!24757 lt!262588)))) (or (= bdg!18025 (select (arr!17227 a!3118) j!142)) (= bdg!18025 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt (index!24757 lt!262588) #b00000000000000000000000000000000) (bvsge (index!24757 lt!262588) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!53795 lt!262588) #b01111111111111111111111111111110) (bvslt (x!53795 lt!262588) #b00000000000000000000000000000000) (not (= bdg!18025 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (select (store (arr!17227 a!3118) i!1132 k0!1914) (index!24757 lt!262588)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!574866 e!330763))

(declare-fun res!363446 () Bool)

(assert (=> b!574866 (=> (not res!363446) (not e!330763))))

(declare-fun lt!262587 () SeekEntryResult!5632)

(assert (=> b!574866 (= res!363446 (= lt!262587 (Found!5632 j!142)))))

(assert (=> b!574866 (= lt!262587 (seekEntryOrOpen!0 (select (arr!17227 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35889 (_ BitVec 32)) Bool)

(assert (=> b!574866 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18037 0))(
  ( (Unit!18038) )
))
(declare-fun lt!262586 () Unit!18037)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35889 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18037)

(assert (=> b!574866 (= lt!262586 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!363455 () Bool)

(assert (=> start!52734 (=> (not res!363455) (not e!330766))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52734 (= res!363455 (validMask!0 mask!3119))))

(assert (=> start!52734 e!330766))

(assert (=> start!52734 true))

(declare-fun array_inv!13086 (array!35889) Bool)

(assert (=> start!52734 (array_inv!13086 a!3118)))

(declare-fun b!574867 () Bool)

(declare-fun res!363449 () Bool)

(assert (=> b!574867 (=> (not res!363449) (not e!330766))))

(assert (=> b!574867 (= res!363449 (validKeyInArray!0 (select (arr!17227 a!3118) j!142)))))

(declare-fun b!574868 () Bool)

(declare-fun e!330767 () Bool)

(assert (=> b!574868 (= e!330761 e!330767)))

(declare-fun res!363450 () Bool)

(assert (=> b!574868 (=> res!363450 e!330767)))

(declare-fun lt!262583 () (_ BitVec 64))

(assert (=> b!574868 (= res!363450 (or (= lt!262583 (select (arr!17227 a!3118) j!142)) (= lt!262583 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!574868 (= lt!262583 (select (arr!17227 a!3118) (index!24757 lt!262588)))))

(declare-fun b!574869 () Bool)

(assert (=> b!574869 (= e!330767 e!330762)))

(declare-fun res!363445 () Bool)

(assert (=> b!574869 (=> (not res!363445) (not e!330762))))

(assert (=> b!574869 (= res!363445 (= lt!262587 (seekKeyOrZeroReturnVacant!0 (x!53795 lt!262588) (index!24757 lt!262588) (index!24757 lt!262588) (select (arr!17227 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!574870 () Bool)

(declare-fun res!363447 () Bool)

(assert (=> b!574870 (=> (not res!363447) (not e!330765))))

(assert (=> b!574870 (= res!363447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!574871 () Bool)

(declare-fun res!363452 () Bool)

(assert (=> b!574871 (=> (not res!363452) (not e!330766))))

(declare-fun arrayContainsKey!0 (array!35889 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!574871 (= res!363452 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!574872 () Bool)

(assert (=> b!574872 (= e!330766 e!330765)))

(declare-fun res!363448 () Bool)

(assert (=> b!574872 (=> (not res!363448) (not e!330765))))

(declare-fun lt!262584 () SeekEntryResult!5632)

(assert (=> b!574872 (= res!363448 (or (= lt!262584 (MissingZero!5632 i!1132)) (= lt!262584 (MissingVacant!5632 i!1132))))))

(assert (=> b!574872 (= lt!262584 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!574873 () Bool)

(assert (=> b!574873 (= e!330765 e!330764)))

(declare-fun res!363456 () Bool)

(assert (=> b!574873 (=> (not res!363456) (not e!330764))))

(declare-fun lt!262582 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35889 (_ BitVec 32)) SeekEntryResult!5632)

(assert (=> b!574873 (= res!363456 (= lt!262588 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262582 lt!262585 lt!262580 mask!3119)))))

(declare-fun lt!262581 () (_ BitVec 32))

(assert (=> b!574873 (= lt!262588 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262581 (select (arr!17227 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!574873 (= lt!262582 (toIndex!0 lt!262585 mask!3119))))

(assert (=> b!574873 (= lt!262585 (select (store (arr!17227 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!574873 (= lt!262581 (toIndex!0 (select (arr!17227 a!3118) j!142) mask!3119))))

(assert (=> b!574873 (= lt!262580 (array!35890 (store (arr!17227 a!3118) i!1132 k0!1914) (size!17591 a!3118)))))

(assert (= (and start!52734 res!363455) b!574861))

(assert (= (and b!574861 res!363457) b!574867))

(assert (= (and b!574867 res!363449) b!574863))

(assert (= (and b!574863 res!363453) b!574871))

(assert (= (and b!574871 res!363452) b!574872))

(assert (= (and b!574872 res!363448) b!574870))

(assert (= (and b!574870 res!363447) b!574864))

(assert (= (and b!574864 res!363451) b!574873))

(assert (= (and b!574873 res!363456) b!574866))

(assert (= (and b!574866 res!363446) b!574862))

(assert (= (and b!574862 (not res!363454)) b!574868))

(assert (= (and b!574868 (not res!363450)) b!574869))

(assert (= (and b!574869 res!363445) b!574865))

(declare-fun m!553835 () Bool)

(assert (=> b!574865 m!553835))

(declare-fun m!553837 () Bool)

(assert (=> b!574865 m!553837))

(declare-fun m!553839 () Bool)

(assert (=> b!574871 m!553839))

(declare-fun m!553841 () Bool)

(assert (=> b!574866 m!553841))

(declare-fun m!553843 () Bool)

(assert (=> b!574866 m!553843))

(declare-fun m!553845 () Bool)

(assert (=> b!574866 m!553845))

(declare-fun m!553847 () Bool)

(assert (=> b!574866 m!553847))

(declare-fun m!553849 () Bool)

(assert (=> b!574866 m!553849))

(declare-fun m!553851 () Bool)

(assert (=> b!574866 m!553851))

(assert (=> b!574866 m!553843))

(declare-fun m!553853 () Bool)

(assert (=> b!574866 m!553853))

(assert (=> b!574869 m!553843))

(assert (=> b!574869 m!553843))

(declare-fun m!553855 () Bool)

(assert (=> b!574869 m!553855))

(assert (=> b!574867 m!553843))

(assert (=> b!574867 m!553843))

(declare-fun m!553857 () Bool)

(assert (=> b!574867 m!553857))

(declare-fun m!553859 () Bool)

(assert (=> b!574872 m!553859))

(declare-fun m!553861 () Bool)

(assert (=> b!574863 m!553861))

(assert (=> b!574873 m!553843))

(declare-fun m!553863 () Bool)

(assert (=> b!574873 m!553863))

(declare-fun m!553865 () Bool)

(assert (=> b!574873 m!553865))

(assert (=> b!574873 m!553843))

(assert (=> b!574873 m!553843))

(declare-fun m!553867 () Bool)

(assert (=> b!574873 m!553867))

(declare-fun m!553869 () Bool)

(assert (=> b!574873 m!553869))

(assert (=> b!574873 m!553847))

(declare-fun m!553871 () Bool)

(assert (=> b!574873 m!553871))

(declare-fun m!553873 () Bool)

(assert (=> b!574870 m!553873))

(assert (=> b!574868 m!553843))

(assert (=> b!574868 m!553841))

(declare-fun m!553875 () Bool)

(assert (=> start!52734 m!553875))

(declare-fun m!553877 () Bool)

(assert (=> start!52734 m!553877))

(declare-fun m!553879 () Bool)

(assert (=> b!574864 m!553879))

(check-sat (not b!574869) (not b!574864) (not b!574867) (not b!574872) (not b!574870) (not start!52734) (not b!574866) (not b!574873) (not b!574871) (not b!574865) (not b!574863))
(check-sat)
(get-model)

(declare-fun d!85291 () Bool)

(declare-fun res!363540 () Bool)

(declare-fun e!330825 () Bool)

(assert (=> d!85291 (=> res!363540 e!330825)))

(assert (=> d!85291 (= res!363540 (bvsge #b00000000000000000000000000000000 (size!17591 a!3118)))))

(assert (=> d!85291 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!330825)))

(declare-fun bm!32691 () Bool)

(declare-fun call!32694 () Bool)

(assert (=> bm!32691 (= call!32694 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!574960 () Bool)

(declare-fun e!330823 () Bool)

(assert (=> b!574960 (= e!330823 call!32694)))

(declare-fun b!574961 () Bool)

(declare-fun e!330824 () Bool)

(assert (=> b!574961 (= e!330823 e!330824)))

(declare-fun lt!262650 () (_ BitVec 64))

(assert (=> b!574961 (= lt!262650 (select (arr!17227 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!262649 () Unit!18037)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35889 (_ BitVec 64) (_ BitVec 32)) Unit!18037)

(assert (=> b!574961 (= lt!262649 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!262650 #b00000000000000000000000000000000))))

(assert (=> b!574961 (arrayContainsKey!0 a!3118 lt!262650 #b00000000000000000000000000000000)))

(declare-fun lt!262651 () Unit!18037)

(assert (=> b!574961 (= lt!262651 lt!262649)))

(declare-fun res!363541 () Bool)

(assert (=> b!574961 (= res!363541 (= (seekEntryOrOpen!0 (select (arr!17227 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5632 #b00000000000000000000000000000000)))))

(assert (=> b!574961 (=> (not res!363541) (not e!330824))))

(declare-fun b!574962 () Bool)

(assert (=> b!574962 (= e!330825 e!330823)))

(declare-fun c!66074 () Bool)

(assert (=> b!574962 (= c!66074 (validKeyInArray!0 (select (arr!17227 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!574963 () Bool)

(assert (=> b!574963 (= e!330824 call!32694)))

(assert (= (and d!85291 (not res!363540)) b!574962))

(assert (= (and b!574962 c!66074) b!574961))

(assert (= (and b!574962 (not c!66074)) b!574960))

(assert (= (and b!574961 res!363541) b!574963))

(assert (= (or b!574963 b!574960) bm!32691))

(declare-fun m!553973 () Bool)

(assert (=> bm!32691 m!553973))

(declare-fun m!553975 () Bool)

(assert (=> b!574961 m!553975))

(declare-fun m!553977 () Bool)

(assert (=> b!574961 m!553977))

(declare-fun m!553979 () Bool)

(assert (=> b!574961 m!553979))

(assert (=> b!574961 m!553975))

(declare-fun m!553981 () Bool)

(assert (=> b!574961 m!553981))

(assert (=> b!574962 m!553975))

(assert (=> b!574962 m!553975))

(declare-fun m!553983 () Bool)

(assert (=> b!574962 m!553983))

(assert (=> b!574870 d!85291))

(declare-fun d!85293 () Bool)

(assert (=> d!85293 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!52734 d!85293))

(declare-fun d!85295 () Bool)

(assert (=> d!85295 (= (array_inv!13086 a!3118) (bvsge (size!17591 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!52734 d!85295))

(declare-fun d!85297 () Bool)

(declare-fun lt!262659 () SeekEntryResult!5632)

(assert (=> d!85297 (and (or ((_ is Undefined!5632) lt!262659) (not ((_ is Found!5632) lt!262659)) (and (bvsge (index!24756 lt!262659) #b00000000000000000000000000000000) (bvslt (index!24756 lt!262659) (size!17591 lt!262580)))) (or ((_ is Undefined!5632) lt!262659) ((_ is Found!5632) lt!262659) (not ((_ is MissingZero!5632) lt!262659)) (and (bvsge (index!24755 lt!262659) #b00000000000000000000000000000000) (bvslt (index!24755 lt!262659) (size!17591 lt!262580)))) (or ((_ is Undefined!5632) lt!262659) ((_ is Found!5632) lt!262659) ((_ is MissingZero!5632) lt!262659) (not ((_ is MissingVacant!5632) lt!262659)) (and (bvsge (index!24758 lt!262659) #b00000000000000000000000000000000) (bvslt (index!24758 lt!262659) (size!17591 lt!262580)))) (or ((_ is Undefined!5632) lt!262659) (ite ((_ is Found!5632) lt!262659) (= (select (arr!17227 lt!262580) (index!24756 lt!262659)) lt!262585) (ite ((_ is MissingZero!5632) lt!262659) (= (select (arr!17227 lt!262580) (index!24755 lt!262659)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5632) lt!262659) (= (select (arr!17227 lt!262580) (index!24758 lt!262659)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!330834 () SeekEntryResult!5632)

(assert (=> d!85297 (= lt!262659 e!330834)))

(declare-fun c!66082 () Bool)

(declare-fun lt!262660 () SeekEntryResult!5632)

(assert (=> d!85297 (= c!66082 (and ((_ is Intermediate!5632) lt!262660) (undefined!6444 lt!262660)))))

(assert (=> d!85297 (= lt!262660 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!262585 mask!3119) lt!262585 lt!262580 mask!3119))))

(assert (=> d!85297 (validMask!0 mask!3119)))

(assert (=> d!85297 (= (seekEntryOrOpen!0 lt!262585 lt!262580 mask!3119) lt!262659)))

(declare-fun b!574976 () Bool)

(declare-fun e!330833 () SeekEntryResult!5632)

(assert (=> b!574976 (= e!330833 (Found!5632 (index!24757 lt!262660)))))

(declare-fun b!574977 () Bool)

(declare-fun c!66081 () Bool)

(declare-fun lt!262658 () (_ BitVec 64))

(assert (=> b!574977 (= c!66081 (= lt!262658 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330832 () SeekEntryResult!5632)

(assert (=> b!574977 (= e!330833 e!330832)))

(declare-fun b!574978 () Bool)

(assert (=> b!574978 (= e!330832 (MissingZero!5632 (index!24757 lt!262660)))))

(declare-fun b!574979 () Bool)

(assert (=> b!574979 (= e!330832 (seekKeyOrZeroReturnVacant!0 (x!53795 lt!262660) (index!24757 lt!262660) (index!24757 lt!262660) lt!262585 lt!262580 mask!3119))))

(declare-fun b!574980 () Bool)

(assert (=> b!574980 (= e!330834 e!330833)))

(assert (=> b!574980 (= lt!262658 (select (arr!17227 lt!262580) (index!24757 lt!262660)))))

(declare-fun c!66083 () Bool)

(assert (=> b!574980 (= c!66083 (= lt!262658 lt!262585))))

(declare-fun b!574981 () Bool)

(assert (=> b!574981 (= e!330834 Undefined!5632)))

(assert (= (and d!85297 c!66082) b!574981))

(assert (= (and d!85297 (not c!66082)) b!574980))

(assert (= (and b!574980 c!66083) b!574976))

(assert (= (and b!574980 (not c!66083)) b!574977))

(assert (= (and b!574977 c!66081) b!574978))

(assert (= (and b!574977 (not c!66081)) b!574979))

(assert (=> d!85297 m!553865))

(declare-fun m!553985 () Bool)

(assert (=> d!85297 m!553985))

(declare-fun m!553987 () Bool)

(assert (=> d!85297 m!553987))

(declare-fun m!553989 () Bool)

(assert (=> d!85297 m!553989))

(assert (=> d!85297 m!553875))

(assert (=> d!85297 m!553865))

(declare-fun m!553991 () Bool)

(assert (=> d!85297 m!553991))

(declare-fun m!553993 () Bool)

(assert (=> b!574979 m!553993))

(declare-fun m!553995 () Bool)

(assert (=> b!574980 m!553995))

(assert (=> b!574865 d!85297))

(declare-fun e!330859 () SeekEntryResult!5632)

(declare-fun b!575015 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!575015 (= e!330859 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53795 lt!262588) #b00000000000000000000000000000001) (nextIndex!0 (index!24757 lt!262588) (bvadd (x!53795 lt!262588) #b00000000000000000000000000000001) mask!3119) (index!24757 lt!262588) lt!262585 lt!262580 mask!3119))))

(declare-fun lt!262665 () SeekEntryResult!5632)

(declare-fun d!85301 () Bool)

(assert (=> d!85301 (and (or ((_ is Undefined!5632) lt!262665) (not ((_ is Found!5632) lt!262665)) (and (bvsge (index!24756 lt!262665) #b00000000000000000000000000000000) (bvslt (index!24756 lt!262665) (size!17591 lt!262580)))) (or ((_ is Undefined!5632) lt!262665) ((_ is Found!5632) lt!262665) (not ((_ is MissingVacant!5632) lt!262665)) (not (= (index!24758 lt!262665) (index!24757 lt!262588))) (and (bvsge (index!24758 lt!262665) #b00000000000000000000000000000000) (bvslt (index!24758 lt!262665) (size!17591 lt!262580)))) (or ((_ is Undefined!5632) lt!262665) (ite ((_ is Found!5632) lt!262665) (= (select (arr!17227 lt!262580) (index!24756 lt!262665)) lt!262585) (and ((_ is MissingVacant!5632) lt!262665) (= (index!24758 lt!262665) (index!24757 lt!262588)) (= (select (arr!17227 lt!262580) (index!24758 lt!262665)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!330861 () SeekEntryResult!5632)

(assert (=> d!85301 (= lt!262665 e!330861)))

(declare-fun c!66093 () Bool)

(assert (=> d!85301 (= c!66093 (bvsge (x!53795 lt!262588) #b01111111111111111111111111111110))))

(declare-fun lt!262666 () (_ BitVec 64))

(assert (=> d!85301 (= lt!262666 (select (arr!17227 lt!262580) (index!24757 lt!262588)))))

(assert (=> d!85301 (validMask!0 mask!3119)))

(assert (=> d!85301 (= (seekKeyOrZeroReturnVacant!0 (x!53795 lt!262588) (index!24757 lt!262588) (index!24757 lt!262588) lt!262585 lt!262580 mask!3119) lt!262665)))

(declare-fun b!575016 () Bool)

(declare-fun e!330860 () SeekEntryResult!5632)

(assert (=> b!575016 (= e!330861 e!330860)))

(declare-fun c!66095 () Bool)

(assert (=> b!575016 (= c!66095 (= lt!262666 lt!262585))))

(declare-fun b!575017 () Bool)

(assert (=> b!575017 (= e!330859 (MissingVacant!5632 (index!24757 lt!262588)))))

(declare-fun b!575018 () Bool)

(declare-fun c!66094 () Bool)

(assert (=> b!575018 (= c!66094 (= lt!262666 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!575018 (= e!330860 e!330859)))

(declare-fun b!575019 () Bool)

(assert (=> b!575019 (= e!330860 (Found!5632 (index!24757 lt!262588)))))

(declare-fun b!575020 () Bool)

(assert (=> b!575020 (= e!330861 Undefined!5632)))

(assert (= (and d!85301 c!66093) b!575020))

(assert (= (and d!85301 (not c!66093)) b!575016))

(assert (= (and b!575016 c!66095) b!575019))

(assert (= (and b!575016 (not c!66095)) b!575018))

(assert (= (and b!575018 c!66094) b!575017))

(assert (= (and b!575018 (not c!66094)) b!575015))

(declare-fun m!554009 () Bool)

(assert (=> b!575015 m!554009))

(assert (=> b!575015 m!554009))

(declare-fun m!554011 () Bool)

(assert (=> b!575015 m!554011))

(declare-fun m!554013 () Bool)

(assert (=> d!85301 m!554013))

(declare-fun m!554015 () Bool)

(assert (=> d!85301 m!554015))

(declare-fun m!554017 () Bool)

(assert (=> d!85301 m!554017))

(assert (=> d!85301 m!553875))

(assert (=> b!574865 d!85301))

(declare-fun b!575061 () Bool)

(declare-fun e!330886 () Bool)

(declare-fun e!330888 () Bool)

(assert (=> b!575061 (= e!330886 e!330888)))

(declare-fun res!363571 () Bool)

(assert (=> b!575061 (=> (not res!363571) (not e!330888))))

(declare-fun e!330887 () Bool)

(assert (=> b!575061 (= res!363571 (not e!330887))))

(declare-fun res!363570 () Bool)

(assert (=> b!575061 (=> (not res!363570) (not e!330887))))

(assert (=> b!575061 (= res!363570 (validKeyInArray!0 (select (arr!17227 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32697 () Bool)

(declare-fun call!32700 () Bool)

(declare-fun c!66110 () Bool)

(assert (=> bm!32697 (= call!32700 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!66110 (Cons!11210 (select (arr!17227 a!3118) #b00000000000000000000000000000000) Nil!11211) Nil!11211)))))

(declare-fun b!575062 () Bool)

(declare-fun e!330889 () Bool)

(assert (=> b!575062 (= e!330889 call!32700)))

(declare-fun b!575063 () Bool)

(declare-fun contains!2863 (List!11214 (_ BitVec 64)) Bool)

(assert (=> b!575063 (= e!330887 (contains!2863 Nil!11211 (select (arr!17227 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!575064 () Bool)

(assert (=> b!575064 (= e!330888 e!330889)))

(assert (=> b!575064 (= c!66110 (validKeyInArray!0 (select (arr!17227 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!85309 () Bool)

(declare-fun res!363569 () Bool)

(assert (=> d!85309 (=> res!363569 e!330886)))

(assert (=> d!85309 (= res!363569 (bvsge #b00000000000000000000000000000000 (size!17591 a!3118)))))

(assert (=> d!85309 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11211) e!330886)))

(declare-fun b!575065 () Bool)

(assert (=> b!575065 (= e!330889 call!32700)))

(assert (= (and d!85309 (not res!363569)) b!575061))

(assert (= (and b!575061 res!363570) b!575063))

(assert (= (and b!575061 res!363571) b!575064))

(assert (= (and b!575064 c!66110) b!575065))

(assert (= (and b!575064 (not c!66110)) b!575062))

(assert (= (or b!575065 b!575062) bm!32697))

(assert (=> b!575061 m!553975))

(assert (=> b!575061 m!553975))

(assert (=> b!575061 m!553983))

(assert (=> bm!32697 m!553975))

(declare-fun m!554019 () Bool)

(assert (=> bm!32697 m!554019))

(assert (=> b!575063 m!553975))

(assert (=> b!575063 m!553975))

(declare-fun m!554021 () Bool)

(assert (=> b!575063 m!554021))

(assert (=> b!575064 m!553975))

(assert (=> b!575064 m!553975))

(assert (=> b!575064 m!553983))

(assert (=> b!574864 d!85309))

(declare-fun b!575066 () Bool)

(declare-fun e!330890 () SeekEntryResult!5632)

(assert (=> b!575066 (= e!330890 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53795 lt!262588) #b00000000000000000000000000000001) (nextIndex!0 (index!24757 lt!262588) (bvadd (x!53795 lt!262588) #b00000000000000000000000000000001) mask!3119) (index!24757 lt!262588) (select (arr!17227 a!3118) j!142) a!3118 mask!3119))))

(declare-fun d!85311 () Bool)

(declare-fun lt!262677 () SeekEntryResult!5632)

(assert (=> d!85311 (and (or ((_ is Undefined!5632) lt!262677) (not ((_ is Found!5632) lt!262677)) (and (bvsge (index!24756 lt!262677) #b00000000000000000000000000000000) (bvslt (index!24756 lt!262677) (size!17591 a!3118)))) (or ((_ is Undefined!5632) lt!262677) ((_ is Found!5632) lt!262677) (not ((_ is MissingVacant!5632) lt!262677)) (not (= (index!24758 lt!262677) (index!24757 lt!262588))) (and (bvsge (index!24758 lt!262677) #b00000000000000000000000000000000) (bvslt (index!24758 lt!262677) (size!17591 a!3118)))) (or ((_ is Undefined!5632) lt!262677) (ite ((_ is Found!5632) lt!262677) (= (select (arr!17227 a!3118) (index!24756 lt!262677)) (select (arr!17227 a!3118) j!142)) (and ((_ is MissingVacant!5632) lt!262677) (= (index!24758 lt!262677) (index!24757 lt!262588)) (= (select (arr!17227 a!3118) (index!24758 lt!262677)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!330892 () SeekEntryResult!5632)

(assert (=> d!85311 (= lt!262677 e!330892)))

(declare-fun c!66111 () Bool)

(assert (=> d!85311 (= c!66111 (bvsge (x!53795 lt!262588) #b01111111111111111111111111111110))))

(declare-fun lt!262678 () (_ BitVec 64))

(assert (=> d!85311 (= lt!262678 (select (arr!17227 a!3118) (index!24757 lt!262588)))))

(assert (=> d!85311 (validMask!0 mask!3119)))

(assert (=> d!85311 (= (seekKeyOrZeroReturnVacant!0 (x!53795 lt!262588) (index!24757 lt!262588) (index!24757 lt!262588) (select (arr!17227 a!3118) j!142) a!3118 mask!3119) lt!262677)))

(declare-fun b!575067 () Bool)

(declare-fun e!330891 () SeekEntryResult!5632)

(assert (=> b!575067 (= e!330892 e!330891)))

(declare-fun c!66113 () Bool)

(assert (=> b!575067 (= c!66113 (= lt!262678 (select (arr!17227 a!3118) j!142)))))

(declare-fun b!575068 () Bool)

(assert (=> b!575068 (= e!330890 (MissingVacant!5632 (index!24757 lt!262588)))))

(declare-fun b!575069 () Bool)

(declare-fun c!66112 () Bool)

(assert (=> b!575069 (= c!66112 (= lt!262678 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!575069 (= e!330891 e!330890)))

(declare-fun b!575070 () Bool)

(assert (=> b!575070 (= e!330891 (Found!5632 (index!24757 lt!262588)))))

(declare-fun b!575071 () Bool)

(assert (=> b!575071 (= e!330892 Undefined!5632)))

(assert (= (and d!85311 c!66111) b!575071))

(assert (= (and d!85311 (not c!66111)) b!575067))

(assert (= (and b!575067 c!66113) b!575070))

(assert (= (and b!575067 (not c!66113)) b!575069))

(assert (= (and b!575069 c!66112) b!575068))

(assert (= (and b!575069 (not c!66112)) b!575066))

(assert (=> b!575066 m!554009))

(assert (=> b!575066 m!554009))

(assert (=> b!575066 m!553843))

(declare-fun m!554023 () Bool)

(assert (=> b!575066 m!554023))

(declare-fun m!554025 () Bool)

(assert (=> d!85311 m!554025))

(declare-fun m!554027 () Bool)

(assert (=> d!85311 m!554027))

(assert (=> d!85311 m!553841))

(assert (=> d!85311 m!553875))

(assert (=> b!574869 d!85311))

(declare-fun d!85313 () Bool)

(assert (=> d!85313 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!574863 d!85313))

(declare-fun b!575144 () Bool)

(declare-fun e!330934 () Bool)

(declare-fun lt!262706 () SeekEntryResult!5632)

(assert (=> b!575144 (= e!330934 (bvsge (x!53795 lt!262706) #b01111111111111111111111111111110))))

(declare-fun b!575145 () Bool)

(declare-fun e!330936 () SeekEntryResult!5632)

(assert (=> b!575145 (= e!330936 (Intermediate!5632 true lt!262582 #b00000000000000000000000000000000))))

(declare-fun b!575146 () Bool)

(declare-fun e!330935 () SeekEntryResult!5632)

(assert (=> b!575146 (= e!330936 e!330935)))

(declare-fun c!66143 () Bool)

(declare-fun lt!262707 () (_ BitVec 64))

(assert (=> b!575146 (= c!66143 (or (= lt!262707 lt!262585) (= (bvadd lt!262707 lt!262707) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!575147 () Bool)

(declare-fun e!330932 () Bool)

(assert (=> b!575147 (= e!330934 e!330932)))

(declare-fun res!363593 () Bool)

(assert (=> b!575147 (= res!363593 (and ((_ is Intermediate!5632) lt!262706) (not (undefined!6444 lt!262706)) (bvslt (x!53795 lt!262706) #b01111111111111111111111111111110) (bvsge (x!53795 lt!262706) #b00000000000000000000000000000000) (bvsge (x!53795 lt!262706) #b00000000000000000000000000000000)))))

(assert (=> b!575147 (=> (not res!363593) (not e!330932))))

(declare-fun b!575148 () Bool)

(assert (=> b!575148 (= e!330935 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!262582 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) lt!262585 lt!262580 mask!3119))))

(declare-fun d!85315 () Bool)

(assert (=> d!85315 e!330934))

(declare-fun c!66142 () Bool)

(assert (=> d!85315 (= c!66142 (and ((_ is Intermediate!5632) lt!262706) (undefined!6444 lt!262706)))))

(assert (=> d!85315 (= lt!262706 e!330936)))

(declare-fun c!66141 () Bool)

(assert (=> d!85315 (= c!66141 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!85315 (= lt!262707 (select (arr!17227 lt!262580) lt!262582))))

(assert (=> d!85315 (validMask!0 mask!3119)))

(assert (=> d!85315 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262582 lt!262585 lt!262580 mask!3119) lt!262706)))

(declare-fun b!575149 () Bool)

(assert (=> b!575149 (and (bvsge (index!24757 lt!262706) #b00000000000000000000000000000000) (bvslt (index!24757 lt!262706) (size!17591 lt!262580)))))

(declare-fun res!363592 () Bool)

(assert (=> b!575149 (= res!363592 (= (select (arr!17227 lt!262580) (index!24757 lt!262706)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330933 () Bool)

(assert (=> b!575149 (=> res!363592 e!330933)))

(declare-fun b!575150 () Bool)

(assert (=> b!575150 (and (bvsge (index!24757 lt!262706) #b00000000000000000000000000000000) (bvslt (index!24757 lt!262706) (size!17591 lt!262580)))))

(assert (=> b!575150 (= e!330933 (= (select (arr!17227 lt!262580) (index!24757 lt!262706)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!575151 () Bool)

(assert (=> b!575151 (= e!330935 (Intermediate!5632 false lt!262582 #b00000000000000000000000000000000))))

(declare-fun b!575152 () Bool)

(assert (=> b!575152 (and (bvsge (index!24757 lt!262706) #b00000000000000000000000000000000) (bvslt (index!24757 lt!262706) (size!17591 lt!262580)))))

(declare-fun res!363591 () Bool)

(assert (=> b!575152 (= res!363591 (= (select (arr!17227 lt!262580) (index!24757 lt!262706)) lt!262585))))

(assert (=> b!575152 (=> res!363591 e!330933)))

(assert (=> b!575152 (= e!330932 e!330933)))

(assert (= (and d!85315 c!66141) b!575145))

(assert (= (and d!85315 (not c!66141)) b!575146))

(assert (= (and b!575146 c!66143) b!575151))

(assert (= (and b!575146 (not c!66143)) b!575148))

(assert (= (and d!85315 c!66142) b!575144))

(assert (= (and d!85315 (not c!66142)) b!575147))

(assert (= (and b!575147 res!363593) b!575152))

(assert (= (and b!575152 (not res!363591)) b!575149))

(assert (= (and b!575149 (not res!363592)) b!575150))

(declare-fun m!554059 () Bool)

(assert (=> b!575152 m!554059))

(assert (=> b!575149 m!554059))

(declare-fun m!554061 () Bool)

(assert (=> d!85315 m!554061))

(assert (=> d!85315 m!553875))

(declare-fun m!554063 () Bool)

(assert (=> b!575148 m!554063))

(assert (=> b!575148 m!554063))

(declare-fun m!554067 () Bool)

(assert (=> b!575148 m!554067))

(assert (=> b!575150 m!554059))

(assert (=> b!574873 d!85315))

(declare-fun b!575162 () Bool)

(declare-fun e!330944 () Bool)

(declare-fun lt!262710 () SeekEntryResult!5632)

(assert (=> b!575162 (= e!330944 (bvsge (x!53795 lt!262710) #b01111111111111111111111111111110))))

(declare-fun b!575163 () Bool)

(declare-fun e!330946 () SeekEntryResult!5632)

(assert (=> b!575163 (= e!330946 (Intermediate!5632 true lt!262581 #b00000000000000000000000000000000))))

(declare-fun b!575164 () Bool)

(declare-fun e!330945 () SeekEntryResult!5632)

(assert (=> b!575164 (= e!330946 e!330945)))

(declare-fun c!66149 () Bool)

(declare-fun lt!262711 () (_ BitVec 64))

(assert (=> b!575164 (= c!66149 (or (= lt!262711 (select (arr!17227 a!3118) j!142)) (= (bvadd lt!262711 lt!262711) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!575165 () Bool)

(declare-fun e!330942 () Bool)

(assert (=> b!575165 (= e!330944 e!330942)))

(declare-fun res!363599 () Bool)

(assert (=> b!575165 (= res!363599 (and ((_ is Intermediate!5632) lt!262710) (not (undefined!6444 lt!262710)) (bvslt (x!53795 lt!262710) #b01111111111111111111111111111110) (bvsge (x!53795 lt!262710) #b00000000000000000000000000000000) (bvsge (x!53795 lt!262710) #b00000000000000000000000000000000)))))

(assert (=> b!575165 (=> (not res!363599) (not e!330942))))

(declare-fun b!575166 () Bool)

(assert (=> b!575166 (= e!330945 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!262581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) (select (arr!17227 a!3118) j!142) a!3118 mask!3119))))

(declare-fun d!85327 () Bool)

(assert (=> d!85327 e!330944))

(declare-fun c!66148 () Bool)

(assert (=> d!85327 (= c!66148 (and ((_ is Intermediate!5632) lt!262710) (undefined!6444 lt!262710)))))

(assert (=> d!85327 (= lt!262710 e!330946)))

(declare-fun c!66147 () Bool)

(assert (=> d!85327 (= c!66147 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!85327 (= lt!262711 (select (arr!17227 a!3118) lt!262581))))

(assert (=> d!85327 (validMask!0 mask!3119)))

(assert (=> d!85327 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262581 (select (arr!17227 a!3118) j!142) a!3118 mask!3119) lt!262710)))

(declare-fun b!575167 () Bool)

(assert (=> b!575167 (and (bvsge (index!24757 lt!262710) #b00000000000000000000000000000000) (bvslt (index!24757 lt!262710) (size!17591 a!3118)))))

(declare-fun res!363598 () Bool)

(assert (=> b!575167 (= res!363598 (= (select (arr!17227 a!3118) (index!24757 lt!262710)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330943 () Bool)

(assert (=> b!575167 (=> res!363598 e!330943)))

(declare-fun b!575168 () Bool)

(assert (=> b!575168 (and (bvsge (index!24757 lt!262710) #b00000000000000000000000000000000) (bvslt (index!24757 lt!262710) (size!17591 a!3118)))))

(assert (=> b!575168 (= e!330943 (= (select (arr!17227 a!3118) (index!24757 lt!262710)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!575169 () Bool)

(assert (=> b!575169 (= e!330945 (Intermediate!5632 false lt!262581 #b00000000000000000000000000000000))))

(declare-fun b!575170 () Bool)

(assert (=> b!575170 (and (bvsge (index!24757 lt!262710) #b00000000000000000000000000000000) (bvslt (index!24757 lt!262710) (size!17591 a!3118)))))

(declare-fun res!363597 () Bool)

(assert (=> b!575170 (= res!363597 (= (select (arr!17227 a!3118) (index!24757 lt!262710)) (select (arr!17227 a!3118) j!142)))))

(assert (=> b!575170 (=> res!363597 e!330943)))

(assert (=> b!575170 (= e!330942 e!330943)))

(assert (= (and d!85327 c!66147) b!575163))

(assert (= (and d!85327 (not c!66147)) b!575164))

(assert (= (and b!575164 c!66149) b!575169))

(assert (= (and b!575164 (not c!66149)) b!575166))

(assert (= (and d!85327 c!66148) b!575162))

(assert (= (and d!85327 (not c!66148)) b!575165))

(assert (= (and b!575165 res!363599) b!575170))

(assert (= (and b!575170 (not res!363597)) b!575167))

(assert (= (and b!575167 (not res!363598)) b!575168))

(declare-fun m!554075 () Bool)

(assert (=> b!575170 m!554075))

(assert (=> b!575167 m!554075))

(declare-fun m!554077 () Bool)

(assert (=> d!85327 m!554077))

(assert (=> d!85327 m!553875))

(declare-fun m!554081 () Bool)

(assert (=> b!575166 m!554081))

(assert (=> b!575166 m!554081))

(assert (=> b!575166 m!553843))

(declare-fun m!554085 () Bool)

(assert (=> b!575166 m!554085))

(assert (=> b!575168 m!554075))

(assert (=> b!574873 d!85327))

(declare-fun d!85331 () Bool)

(declare-fun lt!262727 () (_ BitVec 32))

(declare-fun lt!262726 () (_ BitVec 32))

(assert (=> d!85331 (= lt!262727 (bvmul (bvxor lt!262726 (bvlshr lt!262726 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!85331 (= lt!262726 ((_ extract 31 0) (bvand (bvxor lt!262585 (bvlshr lt!262585 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!85331 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!363603 (let ((h!12253 ((_ extract 31 0) (bvand (bvxor lt!262585 (bvlshr lt!262585 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53804 (bvmul (bvxor h!12253 (bvlshr h!12253 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53804 (bvlshr x!53804 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!363603 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!363603 #b00000000000000000000000000000000))))))

(assert (=> d!85331 (= (toIndex!0 lt!262585 mask!3119) (bvand (bvxor lt!262727 (bvlshr lt!262727 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!574873 d!85331))

(declare-fun d!85341 () Bool)

(declare-fun lt!262731 () (_ BitVec 32))

(declare-fun lt!262730 () (_ BitVec 32))

(assert (=> d!85341 (= lt!262731 (bvmul (bvxor lt!262730 (bvlshr lt!262730 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!85341 (= lt!262730 ((_ extract 31 0) (bvand (bvxor (select (arr!17227 a!3118) j!142) (bvlshr (select (arr!17227 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!85341 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!363603 (let ((h!12253 ((_ extract 31 0) (bvand (bvxor (select (arr!17227 a!3118) j!142) (bvlshr (select (arr!17227 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53804 (bvmul (bvxor h!12253 (bvlshr h!12253 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53804 (bvlshr x!53804 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!363603 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!363603 #b00000000000000000000000000000000))))))

(assert (=> d!85341 (= (toIndex!0 (select (arr!17227 a!3118) j!142) mask!3119) (bvand (bvxor lt!262731 (bvlshr lt!262731 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!574873 d!85341))

(declare-fun d!85345 () Bool)

(declare-fun lt!262736 () SeekEntryResult!5632)

(assert (=> d!85345 (and (or ((_ is Undefined!5632) lt!262736) (not ((_ is Found!5632) lt!262736)) (and (bvsge (index!24756 lt!262736) #b00000000000000000000000000000000) (bvslt (index!24756 lt!262736) (size!17591 a!3118)))) (or ((_ is Undefined!5632) lt!262736) ((_ is Found!5632) lt!262736) (not ((_ is MissingZero!5632) lt!262736)) (and (bvsge (index!24755 lt!262736) #b00000000000000000000000000000000) (bvslt (index!24755 lt!262736) (size!17591 a!3118)))) (or ((_ is Undefined!5632) lt!262736) ((_ is Found!5632) lt!262736) ((_ is MissingZero!5632) lt!262736) (not ((_ is MissingVacant!5632) lt!262736)) (and (bvsge (index!24758 lt!262736) #b00000000000000000000000000000000) (bvslt (index!24758 lt!262736) (size!17591 a!3118)))) (or ((_ is Undefined!5632) lt!262736) (ite ((_ is Found!5632) lt!262736) (= (select (arr!17227 a!3118) (index!24756 lt!262736)) k0!1914) (ite ((_ is MissingZero!5632) lt!262736) (= (select (arr!17227 a!3118) (index!24755 lt!262736)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5632) lt!262736) (= (select (arr!17227 a!3118) (index!24758 lt!262736)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!330960 () SeekEntryResult!5632)

(assert (=> d!85345 (= lt!262736 e!330960)))

(declare-fun c!66160 () Bool)

(declare-fun lt!262737 () SeekEntryResult!5632)

(assert (=> d!85345 (= c!66160 (and ((_ is Intermediate!5632) lt!262737) (undefined!6444 lt!262737)))))

(assert (=> d!85345 (= lt!262737 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!85345 (validMask!0 mask!3119)))

(assert (=> d!85345 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!262736)))

(declare-fun b!575192 () Bool)

(declare-fun e!330959 () SeekEntryResult!5632)

(assert (=> b!575192 (= e!330959 (Found!5632 (index!24757 lt!262737)))))

(declare-fun b!575193 () Bool)

(declare-fun c!66159 () Bool)

(declare-fun lt!262735 () (_ BitVec 64))

(assert (=> b!575193 (= c!66159 (= lt!262735 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330958 () SeekEntryResult!5632)

(assert (=> b!575193 (= e!330959 e!330958)))

(declare-fun b!575194 () Bool)

(assert (=> b!575194 (= e!330958 (MissingZero!5632 (index!24757 lt!262737)))))

(declare-fun b!575195 () Bool)

(assert (=> b!575195 (= e!330958 (seekKeyOrZeroReturnVacant!0 (x!53795 lt!262737) (index!24757 lt!262737) (index!24757 lt!262737) k0!1914 a!3118 mask!3119))))

(declare-fun b!575196 () Bool)

(assert (=> b!575196 (= e!330960 e!330959)))

(assert (=> b!575196 (= lt!262735 (select (arr!17227 a!3118) (index!24757 lt!262737)))))

(declare-fun c!66161 () Bool)

(assert (=> b!575196 (= c!66161 (= lt!262735 k0!1914))))

(declare-fun b!575197 () Bool)

(assert (=> b!575197 (= e!330960 Undefined!5632)))

(assert (= (and d!85345 c!66160) b!575197))

(assert (= (and d!85345 (not c!66160)) b!575196))

(assert (= (and b!575196 c!66161) b!575192))

(assert (= (and b!575196 (not c!66161)) b!575193))

(assert (= (and b!575193 c!66159) b!575194))

(assert (= (and b!575193 (not c!66159)) b!575195))

(declare-fun m!554105 () Bool)

(assert (=> d!85345 m!554105))

(declare-fun m!554107 () Bool)

(assert (=> d!85345 m!554107))

(declare-fun m!554111 () Bool)

(assert (=> d!85345 m!554111))

(declare-fun m!554117 () Bool)

(assert (=> d!85345 m!554117))

(assert (=> d!85345 m!553875))

(assert (=> d!85345 m!554105))

(declare-fun m!554119 () Bool)

(assert (=> d!85345 m!554119))

(declare-fun m!554121 () Bool)

(assert (=> b!575195 m!554121))

(declare-fun m!554123 () Bool)

(assert (=> b!575196 m!554123))

(assert (=> b!574872 d!85345))

(declare-fun d!85349 () Bool)

(assert (=> d!85349 (= (validKeyInArray!0 (select (arr!17227 a!3118) j!142)) (and (not (= (select (arr!17227 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17227 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!574867 d!85349))

(declare-fun d!85351 () Bool)

(declare-fun lt!262739 () SeekEntryResult!5632)

(assert (=> d!85351 (and (or ((_ is Undefined!5632) lt!262739) (not ((_ is Found!5632) lt!262739)) (and (bvsge (index!24756 lt!262739) #b00000000000000000000000000000000) (bvslt (index!24756 lt!262739) (size!17591 a!3118)))) (or ((_ is Undefined!5632) lt!262739) ((_ is Found!5632) lt!262739) (not ((_ is MissingZero!5632) lt!262739)) (and (bvsge (index!24755 lt!262739) #b00000000000000000000000000000000) (bvslt (index!24755 lt!262739) (size!17591 a!3118)))) (or ((_ is Undefined!5632) lt!262739) ((_ is Found!5632) lt!262739) ((_ is MissingZero!5632) lt!262739) (not ((_ is MissingVacant!5632) lt!262739)) (and (bvsge (index!24758 lt!262739) #b00000000000000000000000000000000) (bvslt (index!24758 lt!262739) (size!17591 a!3118)))) (or ((_ is Undefined!5632) lt!262739) (ite ((_ is Found!5632) lt!262739) (= (select (arr!17227 a!3118) (index!24756 lt!262739)) (select (arr!17227 a!3118) j!142)) (ite ((_ is MissingZero!5632) lt!262739) (= (select (arr!17227 a!3118) (index!24755 lt!262739)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5632) lt!262739) (= (select (arr!17227 a!3118) (index!24758 lt!262739)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!330963 () SeekEntryResult!5632)

(assert (=> d!85351 (= lt!262739 e!330963)))

(declare-fun c!66163 () Bool)

(declare-fun lt!262740 () SeekEntryResult!5632)

(assert (=> d!85351 (= c!66163 (and ((_ is Intermediate!5632) lt!262740) (undefined!6444 lt!262740)))))

(assert (=> d!85351 (= lt!262740 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17227 a!3118) j!142) mask!3119) (select (arr!17227 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!85351 (validMask!0 mask!3119)))

(assert (=> d!85351 (= (seekEntryOrOpen!0 (select (arr!17227 a!3118) j!142) a!3118 mask!3119) lt!262739)))

(declare-fun b!575198 () Bool)

(declare-fun e!330962 () SeekEntryResult!5632)

(assert (=> b!575198 (= e!330962 (Found!5632 (index!24757 lt!262740)))))

(declare-fun b!575199 () Bool)

(declare-fun c!66162 () Bool)

(declare-fun lt!262738 () (_ BitVec 64))

(assert (=> b!575199 (= c!66162 (= lt!262738 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330961 () SeekEntryResult!5632)

(assert (=> b!575199 (= e!330962 e!330961)))

(declare-fun b!575200 () Bool)

(assert (=> b!575200 (= e!330961 (MissingZero!5632 (index!24757 lt!262740)))))

(declare-fun b!575201 () Bool)

(assert (=> b!575201 (= e!330961 (seekKeyOrZeroReturnVacant!0 (x!53795 lt!262740) (index!24757 lt!262740) (index!24757 lt!262740) (select (arr!17227 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!575202 () Bool)

(assert (=> b!575202 (= e!330963 e!330962)))

(assert (=> b!575202 (= lt!262738 (select (arr!17227 a!3118) (index!24757 lt!262740)))))

(declare-fun c!66164 () Bool)

(assert (=> b!575202 (= c!66164 (= lt!262738 (select (arr!17227 a!3118) j!142)))))

(declare-fun b!575203 () Bool)

(assert (=> b!575203 (= e!330963 Undefined!5632)))

(assert (= (and d!85351 c!66163) b!575203))

(assert (= (and d!85351 (not c!66163)) b!575202))

(assert (= (and b!575202 c!66164) b!575198))

(assert (= (and b!575202 (not c!66164)) b!575199))

(assert (= (and b!575199 c!66162) b!575200))

(assert (= (and b!575199 (not c!66162)) b!575201))

(assert (=> d!85351 m!553863))

(assert (=> d!85351 m!553843))

(declare-fun m!554125 () Bool)

(assert (=> d!85351 m!554125))

(declare-fun m!554127 () Bool)

(assert (=> d!85351 m!554127))

(declare-fun m!554129 () Bool)

(assert (=> d!85351 m!554129))

(assert (=> d!85351 m!553875))

(assert (=> d!85351 m!553843))

(assert (=> d!85351 m!553863))

(declare-fun m!554131 () Bool)

(assert (=> d!85351 m!554131))

(assert (=> b!575201 m!553843))

(declare-fun m!554133 () Bool)

(assert (=> b!575201 m!554133))

(declare-fun m!554135 () Bool)

(assert (=> b!575202 m!554135))

(assert (=> b!574866 d!85351))

(declare-fun d!85353 () Bool)

(declare-fun res!363605 () Bool)

(declare-fun e!330966 () Bool)

(assert (=> d!85353 (=> res!363605 e!330966)))

(assert (=> d!85353 (= res!363605 (bvsge j!142 (size!17591 a!3118)))))

(assert (=> d!85353 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!330966)))

(declare-fun bm!32698 () Bool)

(declare-fun call!32701 () Bool)

(assert (=> bm!32698 (= call!32701 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!575204 () Bool)

(declare-fun e!330964 () Bool)

(assert (=> b!575204 (= e!330964 call!32701)))

(declare-fun b!575205 () Bool)

(declare-fun e!330965 () Bool)

(assert (=> b!575205 (= e!330964 e!330965)))

(declare-fun lt!262742 () (_ BitVec 64))

(assert (=> b!575205 (= lt!262742 (select (arr!17227 a!3118) j!142))))

(declare-fun lt!262741 () Unit!18037)

(assert (=> b!575205 (= lt!262741 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!262742 j!142))))

(assert (=> b!575205 (arrayContainsKey!0 a!3118 lt!262742 #b00000000000000000000000000000000)))

(declare-fun lt!262743 () Unit!18037)

(assert (=> b!575205 (= lt!262743 lt!262741)))

(declare-fun res!363606 () Bool)

(assert (=> b!575205 (= res!363606 (= (seekEntryOrOpen!0 (select (arr!17227 a!3118) j!142) a!3118 mask!3119) (Found!5632 j!142)))))

(assert (=> b!575205 (=> (not res!363606) (not e!330965))))

(declare-fun b!575206 () Bool)

(assert (=> b!575206 (= e!330966 e!330964)))

(declare-fun c!66165 () Bool)

(assert (=> b!575206 (= c!66165 (validKeyInArray!0 (select (arr!17227 a!3118) j!142)))))

(declare-fun b!575207 () Bool)

(assert (=> b!575207 (= e!330965 call!32701)))

(assert (= (and d!85353 (not res!363605)) b!575206))

(assert (= (and b!575206 c!66165) b!575205))

(assert (= (and b!575206 (not c!66165)) b!575204))

(assert (= (and b!575205 res!363606) b!575207))

(assert (= (or b!575207 b!575204) bm!32698))

(declare-fun m!554137 () Bool)

(assert (=> bm!32698 m!554137))

(assert (=> b!575205 m!553843))

(declare-fun m!554139 () Bool)

(assert (=> b!575205 m!554139))

(declare-fun m!554141 () Bool)

(assert (=> b!575205 m!554141))

(assert (=> b!575205 m!553843))

(assert (=> b!575205 m!553853))

(assert (=> b!575206 m!553843))

(assert (=> b!575206 m!553843))

(assert (=> b!575206 m!553857))

(assert (=> b!574866 d!85353))

(declare-fun d!85355 () Bool)

(assert (=> d!85355 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!262746 () Unit!18037)

(declare-fun choose!38 (array!35889 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18037)

(assert (=> d!85355 (= lt!262746 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!85355 (validMask!0 mask!3119)))

(assert (=> d!85355 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!262746)))

(declare-fun bs!17795 () Bool)

(assert (= bs!17795 d!85355))

(assert (=> bs!17795 m!553845))

(declare-fun m!554143 () Bool)

(assert (=> bs!17795 m!554143))

(assert (=> bs!17795 m!553875))

(assert (=> b!574866 d!85355))

(declare-fun d!85357 () Bool)

(declare-fun res!363611 () Bool)

(declare-fun e!330971 () Bool)

(assert (=> d!85357 (=> res!363611 e!330971)))

(assert (=> d!85357 (= res!363611 (= (select (arr!17227 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!85357 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!330971)))

(declare-fun b!575212 () Bool)

(declare-fun e!330972 () Bool)

(assert (=> b!575212 (= e!330971 e!330972)))

(declare-fun res!363612 () Bool)

(assert (=> b!575212 (=> (not res!363612) (not e!330972))))

(assert (=> b!575212 (= res!363612 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17591 a!3118)))))

(declare-fun b!575213 () Bool)

(assert (=> b!575213 (= e!330972 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!85357 (not res!363611)) b!575212))

(assert (= (and b!575212 res!363612) b!575213))

(assert (=> d!85357 m!553975))

(declare-fun m!554145 () Bool)

(assert (=> b!575213 m!554145))

(assert (=> b!574871 d!85357))

(check-sat (not d!85301) (not d!85297) (not b!575015) (not b!575206) (not bm!32698) (not b!575201) (not b!575061) (not d!85315) (not d!85327) (not d!85355) (not b!574979) (not b!574961) (not b!575064) (not bm!32691) (not b!575166) (not b!575066) (not b!575213) (not d!85351) (not d!85345) (not d!85311) (not b!575148) (not b!575205) (not b!575063) (not b!574962) (not bm!32697) (not b!575195))
(check-sat)

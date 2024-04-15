; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51164 () Bool)

(assert start!51164)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!558761 () Bool)

(declare-datatypes ((SeekEntryResult!5332 0))(
  ( (MissingZero!5332 (index!23555 (_ BitVec 32))) (Found!5332 (index!23556 (_ BitVec 32))) (Intermediate!5332 (undefined!6144 Bool) (index!23557 (_ BitVec 32)) (x!52468 (_ BitVec 32))) (Undefined!5332) (MissingVacant!5332 (index!23558 (_ BitVec 32))) )
))
(declare-fun lt!253827 () SeekEntryResult!5332)

(declare-datatypes ((array!35164 0))(
  ( (array!35165 (arr!16886 (Array (_ BitVec 32) (_ BitVec 64))) (size!17251 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35164)

(declare-fun e!321874 () Bool)

(get-info :version)

(assert (=> b!558761 (= e!321874 (not (or (undefined!6144 lt!253827) (not ((_ is Intermediate!5332) lt!253827)) (let ((bdg!16952 (select (arr!16886 a!3118) (index!23557 lt!253827)))) (or (= bdg!16952 (select (arr!16886 a!3118) j!142)) (= bdg!16952 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!3119 #b00000000000000000000000000000000) (bvslt (index!23557 lt!253827) #b00000000000000000000000000000000) (bvsge (index!23557 lt!253827) (bvadd #b00000000000000000000000000000001 mask!3119)) (and (bvsle (x!52468 lt!253827) #b01111111111111111111111111111110) (bvsge (x!52468 lt!253827) #b00000000000000000000000000000000)))))))))

(declare-fun e!321879 () Bool)

(assert (=> b!558761 e!321879))

(declare-fun res!350538 () Bool)

(assert (=> b!558761 (=> (not res!350538) (not e!321879))))

(declare-fun lt!253826 () SeekEntryResult!5332)

(assert (=> b!558761 (= res!350538 (= lt!253826 (Found!5332 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35164 (_ BitVec 32)) SeekEntryResult!5332)

(assert (=> b!558761 (= lt!253826 (seekEntryOrOpen!0 (select (arr!16886 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35164 (_ BitVec 32)) Bool)

(assert (=> b!558761 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17424 0))(
  ( (Unit!17425) )
))
(declare-fun lt!253828 () Unit!17424)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35164 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17424)

(assert (=> b!558761 (= lt!253828 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!558762 () Bool)

(declare-fun res!350536 () Bool)

(declare-fun e!321877 () Bool)

(assert (=> b!558762 (=> (not res!350536) (not e!321877))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!558762 (= res!350536 (validKeyInArray!0 k0!1914))))

(declare-fun b!558763 () Bool)

(declare-fun res!350535 () Bool)

(assert (=> b!558763 (=> (not res!350535) (not e!321877))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!558763 (= res!350535 (and (= (size!17251 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17251 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17251 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!558764 () Bool)

(declare-fun res!350534 () Bool)

(declare-fun e!321878 () Bool)

(assert (=> b!558764 (=> (not res!350534) (not e!321878))))

(assert (=> b!558764 (= res!350534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!350537 () Bool)

(assert (=> start!51164 (=> (not res!350537) (not e!321877))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51164 (= res!350537 (validMask!0 mask!3119))))

(assert (=> start!51164 e!321877))

(assert (=> start!51164 true))

(declare-fun array_inv!12769 (array!35164) Bool)

(assert (=> start!51164 (array_inv!12769 a!3118)))

(declare-fun e!321873 () Bool)

(declare-fun b!558765 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35164 (_ BitVec 32)) SeekEntryResult!5332)

(assert (=> b!558765 (= e!321873 (= lt!253826 (seekKeyOrZeroReturnVacant!0 (x!52468 lt!253827) (index!23557 lt!253827) (index!23557 lt!253827) (select (arr!16886 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!558766 () Bool)

(declare-fun e!321876 () Bool)

(assert (=> b!558766 (= e!321876 e!321873)))

(declare-fun res!350533 () Bool)

(assert (=> b!558766 (=> res!350533 e!321873)))

(declare-fun lt!253831 () (_ BitVec 64))

(assert (=> b!558766 (= res!350533 (or (= lt!253831 (select (arr!16886 a!3118) j!142)) (= lt!253831 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!558766 (= lt!253831 (select (arr!16886 a!3118) (index!23557 lt!253827)))))

(declare-fun b!558767 () Bool)

(declare-fun res!350530 () Bool)

(assert (=> b!558767 (=> (not res!350530) (not e!321878))))

(declare-datatypes ((List!11005 0))(
  ( (Nil!11002) (Cons!11001 (h!11998 (_ BitVec 64)) (t!17224 List!11005)) )
))
(declare-fun arrayNoDuplicates!0 (array!35164 (_ BitVec 32) List!11005) Bool)

(assert (=> b!558767 (= res!350530 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11002))))

(declare-fun b!558768 () Bool)

(assert (=> b!558768 (= e!321877 e!321878)))

(declare-fun res!350540 () Bool)

(assert (=> b!558768 (=> (not res!350540) (not e!321878))))

(declare-fun lt!253829 () SeekEntryResult!5332)

(assert (=> b!558768 (= res!350540 (or (= lt!253829 (MissingZero!5332 i!1132)) (= lt!253829 (MissingVacant!5332 i!1132))))))

(assert (=> b!558768 (= lt!253829 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!558769 () Bool)

(declare-fun res!350529 () Bool)

(assert (=> b!558769 (=> (not res!350529) (not e!321877))))

(declare-fun arrayContainsKey!0 (array!35164 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!558769 (= res!350529 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!558770 () Bool)

(assert (=> b!558770 (= e!321879 e!321876)))

(declare-fun res!350539 () Bool)

(assert (=> b!558770 (=> res!350539 e!321876)))

(assert (=> b!558770 (= res!350539 (or (undefined!6144 lt!253827) (not ((_ is Intermediate!5332) lt!253827))))))

(declare-fun b!558771 () Bool)

(declare-fun res!350532 () Bool)

(assert (=> b!558771 (=> (not res!350532) (not e!321877))))

(assert (=> b!558771 (= res!350532 (validKeyInArray!0 (select (arr!16886 a!3118) j!142)))))

(declare-fun b!558772 () Bool)

(assert (=> b!558772 (= e!321878 e!321874)))

(declare-fun res!350531 () Bool)

(assert (=> b!558772 (=> (not res!350531) (not e!321874))))

(declare-fun lt!253830 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35164 (_ BitVec 32)) SeekEntryResult!5332)

(assert (=> b!558772 (= res!350531 (= lt!253827 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253830 (select (store (arr!16886 a!3118) i!1132 k0!1914) j!142) (array!35165 (store (arr!16886 a!3118) i!1132 k0!1914) (size!17251 a!3118)) mask!3119)))))

(declare-fun lt!253825 () (_ BitVec 32))

(assert (=> b!558772 (= lt!253827 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253825 (select (arr!16886 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!558772 (= lt!253830 (toIndex!0 (select (store (arr!16886 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!558772 (= lt!253825 (toIndex!0 (select (arr!16886 a!3118) j!142) mask!3119))))

(assert (= (and start!51164 res!350537) b!558763))

(assert (= (and b!558763 res!350535) b!558771))

(assert (= (and b!558771 res!350532) b!558762))

(assert (= (and b!558762 res!350536) b!558769))

(assert (= (and b!558769 res!350529) b!558768))

(assert (= (and b!558768 res!350540) b!558764))

(assert (= (and b!558764 res!350534) b!558767))

(assert (= (and b!558767 res!350530) b!558772))

(assert (= (and b!558772 res!350531) b!558761))

(assert (= (and b!558761 res!350538) b!558770))

(assert (= (and b!558770 (not res!350539)) b!558766))

(assert (= (and b!558766 (not res!350533)) b!558765))

(declare-fun m!536171 () Bool)

(assert (=> b!558768 m!536171))

(declare-fun m!536173 () Bool)

(assert (=> b!558769 m!536173))

(declare-fun m!536175 () Bool)

(assert (=> b!558772 m!536175))

(declare-fun m!536177 () Bool)

(assert (=> b!558772 m!536177))

(assert (=> b!558772 m!536175))

(declare-fun m!536179 () Bool)

(assert (=> b!558772 m!536179))

(declare-fun m!536181 () Bool)

(assert (=> b!558772 m!536181))

(assert (=> b!558772 m!536179))

(declare-fun m!536183 () Bool)

(assert (=> b!558772 m!536183))

(assert (=> b!558772 m!536179))

(declare-fun m!536185 () Bool)

(assert (=> b!558772 m!536185))

(assert (=> b!558772 m!536175))

(declare-fun m!536187 () Bool)

(assert (=> b!558772 m!536187))

(assert (=> b!558761 m!536175))

(declare-fun m!536189 () Bool)

(assert (=> b!558761 m!536189))

(assert (=> b!558761 m!536175))

(declare-fun m!536191 () Bool)

(assert (=> b!558761 m!536191))

(declare-fun m!536193 () Bool)

(assert (=> b!558761 m!536193))

(declare-fun m!536195 () Bool)

(assert (=> b!558761 m!536195))

(assert (=> b!558771 m!536175))

(assert (=> b!558771 m!536175))

(declare-fun m!536197 () Bool)

(assert (=> b!558771 m!536197))

(declare-fun m!536199 () Bool)

(assert (=> start!51164 m!536199))

(declare-fun m!536201 () Bool)

(assert (=> start!51164 m!536201))

(declare-fun m!536203 () Bool)

(assert (=> b!558762 m!536203))

(declare-fun m!536205 () Bool)

(assert (=> b!558767 m!536205))

(declare-fun m!536207 () Bool)

(assert (=> b!558764 m!536207))

(assert (=> b!558765 m!536175))

(assert (=> b!558765 m!536175))

(declare-fun m!536209 () Bool)

(assert (=> b!558765 m!536209))

(assert (=> b!558766 m!536175))

(assert (=> b!558766 m!536195))

(check-sat (not b!558765) (not b!558762) (not b!558768) (not b!558761) (not b!558767) (not b!558772) (not b!558771) (not b!558769) (not start!51164) (not b!558764))
(check-sat)
(get-model)

(declare-fun b!558863 () Bool)

(declare-fun lt!253879 () SeekEntryResult!5332)

(assert (=> b!558863 (and (bvsge (index!23557 lt!253879) #b00000000000000000000000000000000) (bvslt (index!23557 lt!253879) (size!17251 (array!35165 (store (arr!16886 a!3118) i!1132 k0!1914) (size!17251 a!3118)))))))

(declare-fun res!350619 () Bool)

(assert (=> b!558863 (= res!350619 (= (select (arr!16886 (array!35165 (store (arr!16886 a!3118) i!1132 k0!1914) (size!17251 a!3118))) (index!23557 lt!253879)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!321932 () Bool)

(assert (=> b!558863 (=> res!350619 e!321932)))

(declare-fun b!558864 () Bool)

(declare-fun e!321933 () SeekEntryResult!5332)

(assert (=> b!558864 (= e!321933 (Intermediate!5332 false lt!253830 #b00000000000000000000000000000000))))

(declare-fun b!558865 () Bool)

(declare-fun e!321934 () SeekEntryResult!5332)

(assert (=> b!558865 (= e!321934 (Intermediate!5332 true lt!253830 #b00000000000000000000000000000000))))

(declare-fun b!558866 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!558866 (= e!321933 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!253830 #b00000000000000000000000000000000 mask!3119) (select (store (arr!16886 a!3118) i!1132 k0!1914) j!142) (array!35165 (store (arr!16886 a!3118) i!1132 k0!1914) (size!17251 a!3118)) mask!3119))))

(declare-fun b!558867 () Bool)

(declare-fun e!321935 () Bool)

(assert (=> b!558867 (= e!321935 (bvsge (x!52468 lt!253879) #b01111111111111111111111111111110))))

(declare-fun b!558869 () Bool)

(assert (=> b!558869 (and (bvsge (index!23557 lt!253879) #b00000000000000000000000000000000) (bvslt (index!23557 lt!253879) (size!17251 (array!35165 (store (arr!16886 a!3118) i!1132 k0!1914) (size!17251 a!3118)))))))

(assert (=> b!558869 (= e!321932 (= (select (arr!16886 (array!35165 (store (arr!16886 a!3118) i!1132 k0!1914) (size!17251 a!3118))) (index!23557 lt!253879)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!558870 () Bool)

(declare-fun e!321936 () Bool)

(assert (=> b!558870 (= e!321935 e!321936)))

(declare-fun res!350621 () Bool)

(assert (=> b!558870 (= res!350621 (and ((_ is Intermediate!5332) lt!253879) (not (undefined!6144 lt!253879)) (bvslt (x!52468 lt!253879) #b01111111111111111111111111111110) (bvsge (x!52468 lt!253879) #b00000000000000000000000000000000) (bvsge (x!52468 lt!253879) #b00000000000000000000000000000000)))))

(assert (=> b!558870 (=> (not res!350621) (not e!321936))))

(declare-fun b!558871 () Bool)

(assert (=> b!558871 (= e!321934 e!321933)))

(declare-fun c!64466 () Bool)

(declare-fun lt!253878 () (_ BitVec 64))

(assert (=> b!558871 (= c!64466 (or (= lt!253878 (select (store (arr!16886 a!3118) i!1132 k0!1914) j!142)) (= (bvadd lt!253878 lt!253878) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!558868 () Bool)

(assert (=> b!558868 (and (bvsge (index!23557 lt!253879) #b00000000000000000000000000000000) (bvslt (index!23557 lt!253879) (size!17251 (array!35165 (store (arr!16886 a!3118) i!1132 k0!1914) (size!17251 a!3118)))))))

(declare-fun res!350620 () Bool)

(assert (=> b!558868 (= res!350620 (= (select (arr!16886 (array!35165 (store (arr!16886 a!3118) i!1132 k0!1914) (size!17251 a!3118))) (index!23557 lt!253879)) (select (store (arr!16886 a!3118) i!1132 k0!1914) j!142)))))

(assert (=> b!558868 (=> res!350620 e!321932)))

(assert (=> b!558868 (= e!321936 e!321932)))

(declare-fun d!83471 () Bool)

(assert (=> d!83471 e!321935))

(declare-fun c!64465 () Bool)

(assert (=> d!83471 (= c!64465 (and ((_ is Intermediate!5332) lt!253879) (undefined!6144 lt!253879)))))

(assert (=> d!83471 (= lt!253879 e!321934)))

(declare-fun c!64467 () Bool)

(assert (=> d!83471 (= c!64467 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!83471 (= lt!253878 (select (arr!16886 (array!35165 (store (arr!16886 a!3118) i!1132 k0!1914) (size!17251 a!3118))) lt!253830))))

(assert (=> d!83471 (validMask!0 mask!3119)))

(assert (=> d!83471 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253830 (select (store (arr!16886 a!3118) i!1132 k0!1914) j!142) (array!35165 (store (arr!16886 a!3118) i!1132 k0!1914) (size!17251 a!3118)) mask!3119) lt!253879)))

(assert (= (and d!83471 c!64467) b!558865))

(assert (= (and d!83471 (not c!64467)) b!558871))

(assert (= (and b!558871 c!64466) b!558864))

(assert (= (and b!558871 (not c!64466)) b!558866))

(assert (= (and d!83471 c!64465) b!558867))

(assert (= (and d!83471 (not c!64465)) b!558870))

(assert (= (and b!558870 res!350621) b!558868))

(assert (= (and b!558868 (not res!350620)) b!558863))

(assert (= (and b!558863 (not res!350619)) b!558869))

(declare-fun m!536291 () Bool)

(assert (=> d!83471 m!536291))

(assert (=> d!83471 m!536199))

(declare-fun m!536293 () Bool)

(assert (=> b!558869 m!536293))

(assert (=> b!558863 m!536293))

(declare-fun m!536295 () Bool)

(assert (=> b!558866 m!536295))

(assert (=> b!558866 m!536295))

(assert (=> b!558866 m!536179))

(declare-fun m!536297 () Bool)

(assert (=> b!558866 m!536297))

(assert (=> b!558868 m!536293))

(assert (=> b!558772 d!83471))

(declare-fun b!558872 () Bool)

(declare-fun lt!253881 () SeekEntryResult!5332)

(assert (=> b!558872 (and (bvsge (index!23557 lt!253881) #b00000000000000000000000000000000) (bvslt (index!23557 lt!253881) (size!17251 a!3118)))))

(declare-fun res!350622 () Bool)

(assert (=> b!558872 (= res!350622 (= (select (arr!16886 a!3118) (index!23557 lt!253881)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!321937 () Bool)

(assert (=> b!558872 (=> res!350622 e!321937)))

(declare-fun b!558873 () Bool)

(declare-fun e!321938 () SeekEntryResult!5332)

(assert (=> b!558873 (= e!321938 (Intermediate!5332 false lt!253825 #b00000000000000000000000000000000))))

(declare-fun b!558874 () Bool)

(declare-fun e!321939 () SeekEntryResult!5332)

(assert (=> b!558874 (= e!321939 (Intermediate!5332 true lt!253825 #b00000000000000000000000000000000))))

(declare-fun b!558875 () Bool)

(assert (=> b!558875 (= e!321938 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!253825 #b00000000000000000000000000000000 mask!3119) (select (arr!16886 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!558876 () Bool)

(declare-fun e!321940 () Bool)

(assert (=> b!558876 (= e!321940 (bvsge (x!52468 lt!253881) #b01111111111111111111111111111110))))

(declare-fun b!558878 () Bool)

(assert (=> b!558878 (and (bvsge (index!23557 lt!253881) #b00000000000000000000000000000000) (bvslt (index!23557 lt!253881) (size!17251 a!3118)))))

(assert (=> b!558878 (= e!321937 (= (select (arr!16886 a!3118) (index!23557 lt!253881)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!558879 () Bool)

(declare-fun e!321941 () Bool)

(assert (=> b!558879 (= e!321940 e!321941)))

(declare-fun res!350624 () Bool)

(assert (=> b!558879 (= res!350624 (and ((_ is Intermediate!5332) lt!253881) (not (undefined!6144 lt!253881)) (bvslt (x!52468 lt!253881) #b01111111111111111111111111111110) (bvsge (x!52468 lt!253881) #b00000000000000000000000000000000) (bvsge (x!52468 lt!253881) #b00000000000000000000000000000000)))))

(assert (=> b!558879 (=> (not res!350624) (not e!321941))))

(declare-fun b!558880 () Bool)

(assert (=> b!558880 (= e!321939 e!321938)))

(declare-fun c!64469 () Bool)

(declare-fun lt!253880 () (_ BitVec 64))

(assert (=> b!558880 (= c!64469 (or (= lt!253880 (select (arr!16886 a!3118) j!142)) (= (bvadd lt!253880 lt!253880) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!558877 () Bool)

(assert (=> b!558877 (and (bvsge (index!23557 lt!253881) #b00000000000000000000000000000000) (bvslt (index!23557 lt!253881) (size!17251 a!3118)))))

(declare-fun res!350623 () Bool)

(assert (=> b!558877 (= res!350623 (= (select (arr!16886 a!3118) (index!23557 lt!253881)) (select (arr!16886 a!3118) j!142)))))

(assert (=> b!558877 (=> res!350623 e!321937)))

(assert (=> b!558877 (= e!321941 e!321937)))

(declare-fun d!83473 () Bool)

(assert (=> d!83473 e!321940))

(declare-fun c!64468 () Bool)

(assert (=> d!83473 (= c!64468 (and ((_ is Intermediate!5332) lt!253881) (undefined!6144 lt!253881)))))

(assert (=> d!83473 (= lt!253881 e!321939)))

(declare-fun c!64470 () Bool)

(assert (=> d!83473 (= c!64470 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!83473 (= lt!253880 (select (arr!16886 a!3118) lt!253825))))

(assert (=> d!83473 (validMask!0 mask!3119)))

(assert (=> d!83473 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253825 (select (arr!16886 a!3118) j!142) a!3118 mask!3119) lt!253881)))

(assert (= (and d!83473 c!64470) b!558874))

(assert (= (and d!83473 (not c!64470)) b!558880))

(assert (= (and b!558880 c!64469) b!558873))

(assert (= (and b!558880 (not c!64469)) b!558875))

(assert (= (and d!83473 c!64468) b!558876))

(assert (= (and d!83473 (not c!64468)) b!558879))

(assert (= (and b!558879 res!350624) b!558877))

(assert (= (and b!558877 (not res!350623)) b!558872))

(assert (= (and b!558872 (not res!350622)) b!558878))

(declare-fun m!536299 () Bool)

(assert (=> d!83473 m!536299))

(assert (=> d!83473 m!536199))

(declare-fun m!536301 () Bool)

(assert (=> b!558878 m!536301))

(assert (=> b!558872 m!536301))

(declare-fun m!536303 () Bool)

(assert (=> b!558875 m!536303))

(assert (=> b!558875 m!536303))

(assert (=> b!558875 m!536175))

(declare-fun m!536305 () Bool)

(assert (=> b!558875 m!536305))

(assert (=> b!558877 m!536301))

(assert (=> b!558772 d!83473))

(declare-fun d!83475 () Bool)

(declare-fun lt!253887 () (_ BitVec 32))

(declare-fun lt!253886 () (_ BitVec 32))

(assert (=> d!83475 (= lt!253887 (bvmul (bvxor lt!253886 (bvlshr lt!253886 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83475 (= lt!253886 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16886 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16886 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83475 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!350625 (let ((h!12001 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16886 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16886 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52472 (bvmul (bvxor h!12001 (bvlshr h!12001 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52472 (bvlshr x!52472 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!350625 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!350625 #b00000000000000000000000000000000))))))

(assert (=> d!83475 (= (toIndex!0 (select (store (arr!16886 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvand (bvxor lt!253887 (bvlshr lt!253887 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!558772 d!83475))

(declare-fun d!83477 () Bool)

(declare-fun lt!253889 () (_ BitVec 32))

(declare-fun lt!253888 () (_ BitVec 32))

(assert (=> d!83477 (= lt!253889 (bvmul (bvxor lt!253888 (bvlshr lt!253888 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83477 (= lt!253888 ((_ extract 31 0) (bvand (bvxor (select (arr!16886 a!3118) j!142) (bvlshr (select (arr!16886 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83477 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!350625 (let ((h!12001 ((_ extract 31 0) (bvand (bvxor (select (arr!16886 a!3118) j!142) (bvlshr (select (arr!16886 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52472 (bvmul (bvxor h!12001 (bvlshr h!12001 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52472 (bvlshr x!52472 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!350625 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!350625 #b00000000000000000000000000000000))))))

(assert (=> d!83477 (= (toIndex!0 (select (arr!16886 a!3118) j!142) mask!3119) (bvand (bvxor lt!253889 (bvlshr lt!253889 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!558772 d!83477))

(declare-fun bm!32389 () Bool)

(declare-fun call!32392 () Bool)

(declare-fun c!64473 () Bool)

(assert (=> bm!32389 (= call!32392 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64473 (Cons!11001 (select (arr!16886 a!3118) #b00000000000000000000000000000000) Nil!11002) Nil!11002)))))

(declare-fun b!558891 () Bool)

(declare-fun e!321952 () Bool)

(declare-fun contains!2836 (List!11005 (_ BitVec 64)) Bool)

(assert (=> b!558891 (= e!321952 (contains!2836 Nil!11002 (select (arr!16886 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!558892 () Bool)

(declare-fun e!321950 () Bool)

(assert (=> b!558892 (= e!321950 call!32392)))

(declare-fun b!558893 () Bool)

(assert (=> b!558893 (= e!321950 call!32392)))

(declare-fun d!83479 () Bool)

(declare-fun res!350632 () Bool)

(declare-fun e!321953 () Bool)

(assert (=> d!83479 (=> res!350632 e!321953)))

(assert (=> d!83479 (= res!350632 (bvsge #b00000000000000000000000000000000 (size!17251 a!3118)))))

(assert (=> d!83479 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11002) e!321953)))

(declare-fun b!558894 () Bool)

(declare-fun e!321951 () Bool)

(assert (=> b!558894 (= e!321953 e!321951)))

(declare-fun res!350634 () Bool)

(assert (=> b!558894 (=> (not res!350634) (not e!321951))))

(assert (=> b!558894 (= res!350634 (not e!321952))))

(declare-fun res!350633 () Bool)

(assert (=> b!558894 (=> (not res!350633) (not e!321952))))

(assert (=> b!558894 (= res!350633 (validKeyInArray!0 (select (arr!16886 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!558895 () Bool)

(assert (=> b!558895 (= e!321951 e!321950)))

(assert (=> b!558895 (= c!64473 (validKeyInArray!0 (select (arr!16886 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!83479 (not res!350632)) b!558894))

(assert (= (and b!558894 res!350633) b!558891))

(assert (= (and b!558894 res!350634) b!558895))

(assert (= (and b!558895 c!64473) b!558893))

(assert (= (and b!558895 (not c!64473)) b!558892))

(assert (= (or b!558893 b!558892) bm!32389))

(declare-fun m!536307 () Bool)

(assert (=> bm!32389 m!536307))

(declare-fun m!536309 () Bool)

(assert (=> bm!32389 m!536309))

(assert (=> b!558891 m!536307))

(assert (=> b!558891 m!536307))

(declare-fun m!536311 () Bool)

(assert (=> b!558891 m!536311))

(assert (=> b!558894 m!536307))

(assert (=> b!558894 m!536307))

(declare-fun m!536313 () Bool)

(assert (=> b!558894 m!536313))

(assert (=> b!558895 m!536307))

(assert (=> b!558895 m!536307))

(assert (=> b!558895 m!536313))

(assert (=> b!558767 d!83479))

(declare-fun b!558947 () Bool)

(declare-fun e!321989 () SeekEntryResult!5332)

(declare-fun e!321987 () SeekEntryResult!5332)

(assert (=> b!558947 (= e!321989 e!321987)))

(declare-fun lt!253906 () (_ BitVec 64))

(declare-fun lt!253905 () SeekEntryResult!5332)

(assert (=> b!558947 (= lt!253906 (select (arr!16886 a!3118) (index!23557 lt!253905)))))

(declare-fun c!64492 () Bool)

(assert (=> b!558947 (= c!64492 (= lt!253906 (select (arr!16886 a!3118) j!142)))))

(declare-fun b!558948 () Bool)

(assert (=> b!558948 (= e!321989 Undefined!5332)))

(declare-fun b!558949 () Bool)

(declare-fun e!321988 () SeekEntryResult!5332)

(assert (=> b!558949 (= e!321988 (MissingZero!5332 (index!23557 lt!253905)))))

(declare-fun d!83485 () Bool)

(declare-fun lt!253907 () SeekEntryResult!5332)

(assert (=> d!83485 (and (or ((_ is Undefined!5332) lt!253907) (not ((_ is Found!5332) lt!253907)) (and (bvsge (index!23556 lt!253907) #b00000000000000000000000000000000) (bvslt (index!23556 lt!253907) (size!17251 a!3118)))) (or ((_ is Undefined!5332) lt!253907) ((_ is Found!5332) lt!253907) (not ((_ is MissingZero!5332) lt!253907)) (and (bvsge (index!23555 lt!253907) #b00000000000000000000000000000000) (bvslt (index!23555 lt!253907) (size!17251 a!3118)))) (or ((_ is Undefined!5332) lt!253907) ((_ is Found!5332) lt!253907) ((_ is MissingZero!5332) lt!253907) (not ((_ is MissingVacant!5332) lt!253907)) (and (bvsge (index!23558 lt!253907) #b00000000000000000000000000000000) (bvslt (index!23558 lt!253907) (size!17251 a!3118)))) (or ((_ is Undefined!5332) lt!253907) (ite ((_ is Found!5332) lt!253907) (= (select (arr!16886 a!3118) (index!23556 lt!253907)) (select (arr!16886 a!3118) j!142)) (ite ((_ is MissingZero!5332) lt!253907) (= (select (arr!16886 a!3118) (index!23555 lt!253907)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5332) lt!253907) (= (select (arr!16886 a!3118) (index!23558 lt!253907)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83485 (= lt!253907 e!321989)))

(declare-fun c!64494 () Bool)

(assert (=> d!83485 (= c!64494 (and ((_ is Intermediate!5332) lt!253905) (undefined!6144 lt!253905)))))

(assert (=> d!83485 (= lt!253905 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16886 a!3118) j!142) mask!3119) (select (arr!16886 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!83485 (validMask!0 mask!3119)))

(assert (=> d!83485 (= (seekEntryOrOpen!0 (select (arr!16886 a!3118) j!142) a!3118 mask!3119) lt!253907)))

(declare-fun b!558950 () Bool)

(assert (=> b!558950 (= e!321988 (seekKeyOrZeroReturnVacant!0 (x!52468 lt!253905) (index!23557 lt!253905) (index!23557 lt!253905) (select (arr!16886 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!558951 () Bool)

(assert (=> b!558951 (= e!321987 (Found!5332 (index!23557 lt!253905)))))

(declare-fun b!558952 () Bool)

(declare-fun c!64493 () Bool)

(assert (=> b!558952 (= c!64493 (= lt!253906 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!558952 (= e!321987 e!321988)))

(assert (= (and d!83485 c!64494) b!558948))

(assert (= (and d!83485 (not c!64494)) b!558947))

(assert (= (and b!558947 c!64492) b!558951))

(assert (= (and b!558947 (not c!64492)) b!558952))

(assert (= (and b!558952 c!64493) b!558949))

(assert (= (and b!558952 (not c!64493)) b!558950))

(declare-fun m!536337 () Bool)

(assert (=> b!558947 m!536337))

(declare-fun m!536339 () Bool)

(assert (=> d!83485 m!536339))

(declare-fun m!536341 () Bool)

(assert (=> d!83485 m!536341))

(assert (=> d!83485 m!536175))

(assert (=> d!83485 m!536177))

(assert (=> d!83485 m!536199))

(declare-fun m!536343 () Bool)

(assert (=> d!83485 m!536343))

(assert (=> d!83485 m!536177))

(assert (=> d!83485 m!536175))

(declare-fun m!536345 () Bool)

(assert (=> d!83485 m!536345))

(assert (=> b!558950 m!536175))

(declare-fun m!536347 () Bool)

(assert (=> b!558950 m!536347))

(assert (=> b!558761 d!83485))

(declare-fun b!558991 () Bool)

(declare-fun e!322016 () Bool)

(declare-fun e!322015 () Bool)

(assert (=> b!558991 (= e!322016 e!322015)))

(declare-fun c!64509 () Bool)

(assert (=> b!558991 (= c!64509 (validKeyInArray!0 (select (arr!16886 a!3118) j!142)))))

(declare-fun bm!32398 () Bool)

(declare-fun call!32401 () Bool)

(assert (=> bm!32398 (= call!32401 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!558992 () Bool)

(assert (=> b!558992 (= e!322015 call!32401)))

(declare-fun b!558993 () Bool)

(declare-fun e!322014 () Bool)

(assert (=> b!558993 (= e!322014 call!32401)))

(declare-fun b!558994 () Bool)

(assert (=> b!558994 (= e!322015 e!322014)))

(declare-fun lt!253934 () (_ BitVec 64))

(assert (=> b!558994 (= lt!253934 (select (arr!16886 a!3118) j!142))))

(declare-fun lt!253932 () Unit!17424)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35164 (_ BitVec 64) (_ BitVec 32)) Unit!17424)

(assert (=> b!558994 (= lt!253932 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!253934 j!142))))

(assert (=> b!558994 (arrayContainsKey!0 a!3118 lt!253934 #b00000000000000000000000000000000)))

(declare-fun lt!253933 () Unit!17424)

(assert (=> b!558994 (= lt!253933 lt!253932)))

(declare-fun res!350660 () Bool)

(assert (=> b!558994 (= res!350660 (= (seekEntryOrOpen!0 (select (arr!16886 a!3118) j!142) a!3118 mask!3119) (Found!5332 j!142)))))

(assert (=> b!558994 (=> (not res!350660) (not e!322014))))

(declare-fun d!83495 () Bool)

(declare-fun res!350661 () Bool)

(assert (=> d!83495 (=> res!350661 e!322016)))

(assert (=> d!83495 (= res!350661 (bvsge j!142 (size!17251 a!3118)))))

(assert (=> d!83495 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!322016)))

(assert (= (and d!83495 (not res!350661)) b!558991))

(assert (= (and b!558991 c!64509) b!558994))

(assert (= (and b!558991 (not c!64509)) b!558992))

(assert (= (and b!558994 res!350660) b!558993))

(assert (= (or b!558993 b!558992) bm!32398))

(assert (=> b!558991 m!536175))

(assert (=> b!558991 m!536175))

(assert (=> b!558991 m!536197))

(declare-fun m!536367 () Bool)

(assert (=> bm!32398 m!536367))

(assert (=> b!558994 m!536175))

(declare-fun m!536369 () Bool)

(assert (=> b!558994 m!536369))

(declare-fun m!536371 () Bool)

(assert (=> b!558994 m!536371))

(assert (=> b!558994 m!536175))

(assert (=> b!558994 m!536191))

(assert (=> b!558761 d!83495))

(declare-fun d!83501 () Bool)

(assert (=> d!83501 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!253946 () Unit!17424)

(declare-fun choose!38 (array!35164 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17424)

(assert (=> d!83501 (= lt!253946 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!83501 (validMask!0 mask!3119)))

(assert (=> d!83501 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!253946)))

(declare-fun bs!17363 () Bool)

(assert (= bs!17363 d!83501))

(assert (=> bs!17363 m!536189))

(declare-fun m!536401 () Bool)

(assert (=> bs!17363 m!536401))

(assert (=> bs!17363 m!536199))

(assert (=> b!558761 d!83501))

(declare-fun d!83511 () Bool)

(assert (=> d!83511 (= (validKeyInArray!0 (select (arr!16886 a!3118) j!142)) (and (not (= (select (arr!16886 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16886 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!558771 d!83511))

(declare-fun b!559035 () Bool)

(declare-fun e!322044 () SeekEntryResult!5332)

(assert (=> b!559035 (= e!322044 Undefined!5332)))

(declare-fun b!559036 () Bool)

(declare-fun c!64525 () Bool)

(declare-fun lt!253963 () (_ BitVec 64))

(assert (=> b!559036 (= c!64525 (= lt!253963 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!322046 () SeekEntryResult!5332)

(declare-fun e!322045 () SeekEntryResult!5332)

(assert (=> b!559036 (= e!322046 e!322045)))

(declare-fun b!559037 () Bool)

(assert (=> b!559037 (= e!322046 (Found!5332 (index!23557 lt!253827)))))

(declare-fun b!559038 () Bool)

(assert (=> b!559038 (= e!322045 (seekKeyOrZeroReturnVacant!0 (bvadd (x!52468 lt!253827) #b00000000000000000000000000000001) (nextIndex!0 (index!23557 lt!253827) (x!52468 lt!253827) mask!3119) (index!23557 lt!253827) (select (arr!16886 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!559040 () Bool)

(assert (=> b!559040 (= e!322045 (MissingVacant!5332 (index!23557 lt!253827)))))

(declare-fun lt!253964 () SeekEntryResult!5332)

(declare-fun d!83513 () Bool)

(assert (=> d!83513 (and (or ((_ is Undefined!5332) lt!253964) (not ((_ is Found!5332) lt!253964)) (and (bvsge (index!23556 lt!253964) #b00000000000000000000000000000000) (bvslt (index!23556 lt!253964) (size!17251 a!3118)))) (or ((_ is Undefined!5332) lt!253964) ((_ is Found!5332) lt!253964) (not ((_ is MissingVacant!5332) lt!253964)) (not (= (index!23558 lt!253964) (index!23557 lt!253827))) (and (bvsge (index!23558 lt!253964) #b00000000000000000000000000000000) (bvslt (index!23558 lt!253964) (size!17251 a!3118)))) (or ((_ is Undefined!5332) lt!253964) (ite ((_ is Found!5332) lt!253964) (= (select (arr!16886 a!3118) (index!23556 lt!253964)) (select (arr!16886 a!3118) j!142)) (and ((_ is MissingVacant!5332) lt!253964) (= (index!23558 lt!253964) (index!23557 lt!253827)) (= (select (arr!16886 a!3118) (index!23558 lt!253964)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!83513 (= lt!253964 e!322044)))

(declare-fun c!64523 () Bool)

(assert (=> d!83513 (= c!64523 (bvsge (x!52468 lt!253827) #b01111111111111111111111111111110))))

(assert (=> d!83513 (= lt!253963 (select (arr!16886 a!3118) (index!23557 lt!253827)))))

(assert (=> d!83513 (validMask!0 mask!3119)))

(assert (=> d!83513 (= (seekKeyOrZeroReturnVacant!0 (x!52468 lt!253827) (index!23557 lt!253827) (index!23557 lt!253827) (select (arr!16886 a!3118) j!142) a!3118 mask!3119) lt!253964)))

(declare-fun b!559039 () Bool)

(assert (=> b!559039 (= e!322044 e!322046)))

(declare-fun c!64524 () Bool)

(assert (=> b!559039 (= c!64524 (= lt!253963 (select (arr!16886 a!3118) j!142)))))

(assert (= (and d!83513 c!64523) b!559035))

(assert (= (and d!83513 (not c!64523)) b!559039))

(assert (= (and b!559039 c!64524) b!559037))

(assert (= (and b!559039 (not c!64524)) b!559036))

(assert (= (and b!559036 c!64525) b!559040))

(assert (= (and b!559036 (not c!64525)) b!559038))

(declare-fun m!536413 () Bool)

(assert (=> b!559038 m!536413))

(assert (=> b!559038 m!536413))

(assert (=> b!559038 m!536175))

(declare-fun m!536415 () Bool)

(assert (=> b!559038 m!536415))

(declare-fun m!536417 () Bool)

(assert (=> d!83513 m!536417))

(declare-fun m!536419 () Bool)

(assert (=> d!83513 m!536419))

(assert (=> d!83513 m!536195))

(assert (=> d!83513 m!536199))

(assert (=> b!558765 d!83513))

(declare-fun b!559041 () Bool)

(declare-fun e!322049 () Bool)

(declare-fun e!322048 () Bool)

(assert (=> b!559041 (= e!322049 e!322048)))

(declare-fun c!64526 () Bool)

(assert (=> b!559041 (= c!64526 (validKeyInArray!0 (select (arr!16886 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32403 () Bool)

(declare-fun call!32406 () Bool)

(assert (=> bm!32403 (= call!32406 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!559042 () Bool)

(assert (=> b!559042 (= e!322048 call!32406)))

(declare-fun b!559043 () Bool)

(declare-fun e!322047 () Bool)

(assert (=> b!559043 (= e!322047 call!32406)))

(declare-fun b!559044 () Bool)

(assert (=> b!559044 (= e!322048 e!322047)))

(declare-fun lt!253967 () (_ BitVec 64))

(assert (=> b!559044 (= lt!253967 (select (arr!16886 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!253965 () Unit!17424)

(assert (=> b!559044 (= lt!253965 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!253967 #b00000000000000000000000000000000))))

(assert (=> b!559044 (arrayContainsKey!0 a!3118 lt!253967 #b00000000000000000000000000000000)))

(declare-fun lt!253966 () Unit!17424)

(assert (=> b!559044 (= lt!253966 lt!253965)))

(declare-fun res!350676 () Bool)

(assert (=> b!559044 (= res!350676 (= (seekEntryOrOpen!0 (select (arr!16886 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5332 #b00000000000000000000000000000000)))))

(assert (=> b!559044 (=> (not res!350676) (not e!322047))))

(declare-fun d!83527 () Bool)

(declare-fun res!350677 () Bool)

(assert (=> d!83527 (=> res!350677 e!322049)))

(assert (=> d!83527 (= res!350677 (bvsge #b00000000000000000000000000000000 (size!17251 a!3118)))))

(assert (=> d!83527 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!322049)))

(assert (= (and d!83527 (not res!350677)) b!559041))

(assert (= (and b!559041 c!64526) b!559044))

(assert (= (and b!559041 (not c!64526)) b!559042))

(assert (= (and b!559044 res!350676) b!559043))

(assert (= (or b!559043 b!559042) bm!32403))

(assert (=> b!559041 m!536307))

(assert (=> b!559041 m!536307))

(assert (=> b!559041 m!536313))

(declare-fun m!536421 () Bool)

(assert (=> bm!32403 m!536421))

(assert (=> b!559044 m!536307))

(declare-fun m!536423 () Bool)

(assert (=> b!559044 m!536423))

(declare-fun m!536425 () Bool)

(assert (=> b!559044 m!536425))

(assert (=> b!559044 m!536307))

(declare-fun m!536427 () Bool)

(assert (=> b!559044 m!536427))

(assert (=> b!558764 d!83527))

(declare-fun d!83529 () Bool)

(declare-fun res!350682 () Bool)

(declare-fun e!322054 () Bool)

(assert (=> d!83529 (=> res!350682 e!322054)))

(assert (=> d!83529 (= res!350682 (= (select (arr!16886 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!83529 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!322054)))

(declare-fun b!559049 () Bool)

(declare-fun e!322055 () Bool)

(assert (=> b!559049 (= e!322054 e!322055)))

(declare-fun res!350683 () Bool)

(assert (=> b!559049 (=> (not res!350683) (not e!322055))))

(assert (=> b!559049 (= res!350683 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17251 a!3118)))))

(declare-fun b!559050 () Bool)

(assert (=> b!559050 (= e!322055 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!83529 (not res!350682)) b!559049))

(assert (= (and b!559049 res!350683) b!559050))

(assert (=> d!83529 m!536307))

(declare-fun m!536429 () Bool)

(assert (=> b!559050 m!536429))

(assert (=> b!558769 d!83529))

(declare-fun b!559051 () Bool)

(declare-fun e!322058 () SeekEntryResult!5332)

(declare-fun e!322056 () SeekEntryResult!5332)

(assert (=> b!559051 (= e!322058 e!322056)))

(declare-fun lt!253969 () (_ BitVec 64))

(declare-fun lt!253968 () SeekEntryResult!5332)

(assert (=> b!559051 (= lt!253969 (select (arr!16886 a!3118) (index!23557 lt!253968)))))

(declare-fun c!64527 () Bool)

(assert (=> b!559051 (= c!64527 (= lt!253969 k0!1914))))

(declare-fun b!559052 () Bool)

(assert (=> b!559052 (= e!322058 Undefined!5332)))

(declare-fun b!559053 () Bool)

(declare-fun e!322057 () SeekEntryResult!5332)

(assert (=> b!559053 (= e!322057 (MissingZero!5332 (index!23557 lt!253968)))))

(declare-fun d!83531 () Bool)

(declare-fun lt!253970 () SeekEntryResult!5332)

(assert (=> d!83531 (and (or ((_ is Undefined!5332) lt!253970) (not ((_ is Found!5332) lt!253970)) (and (bvsge (index!23556 lt!253970) #b00000000000000000000000000000000) (bvslt (index!23556 lt!253970) (size!17251 a!3118)))) (or ((_ is Undefined!5332) lt!253970) ((_ is Found!5332) lt!253970) (not ((_ is MissingZero!5332) lt!253970)) (and (bvsge (index!23555 lt!253970) #b00000000000000000000000000000000) (bvslt (index!23555 lt!253970) (size!17251 a!3118)))) (or ((_ is Undefined!5332) lt!253970) ((_ is Found!5332) lt!253970) ((_ is MissingZero!5332) lt!253970) (not ((_ is MissingVacant!5332) lt!253970)) (and (bvsge (index!23558 lt!253970) #b00000000000000000000000000000000) (bvslt (index!23558 lt!253970) (size!17251 a!3118)))) (or ((_ is Undefined!5332) lt!253970) (ite ((_ is Found!5332) lt!253970) (= (select (arr!16886 a!3118) (index!23556 lt!253970)) k0!1914) (ite ((_ is MissingZero!5332) lt!253970) (= (select (arr!16886 a!3118) (index!23555 lt!253970)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5332) lt!253970) (= (select (arr!16886 a!3118) (index!23558 lt!253970)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83531 (= lt!253970 e!322058)))

(declare-fun c!64529 () Bool)

(assert (=> d!83531 (= c!64529 (and ((_ is Intermediate!5332) lt!253968) (undefined!6144 lt!253968)))))

(assert (=> d!83531 (= lt!253968 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!83531 (validMask!0 mask!3119)))

(assert (=> d!83531 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!253970)))

(declare-fun b!559054 () Bool)

(assert (=> b!559054 (= e!322057 (seekKeyOrZeroReturnVacant!0 (x!52468 lt!253968) (index!23557 lt!253968) (index!23557 lt!253968) k0!1914 a!3118 mask!3119))))

(declare-fun b!559055 () Bool)

(assert (=> b!559055 (= e!322056 (Found!5332 (index!23557 lt!253968)))))

(declare-fun b!559056 () Bool)

(declare-fun c!64528 () Bool)

(assert (=> b!559056 (= c!64528 (= lt!253969 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!559056 (= e!322056 e!322057)))

(assert (= (and d!83531 c!64529) b!559052))

(assert (= (and d!83531 (not c!64529)) b!559051))

(assert (= (and b!559051 c!64527) b!559055))

(assert (= (and b!559051 (not c!64527)) b!559056))

(assert (= (and b!559056 c!64528) b!559053))

(assert (= (and b!559056 (not c!64528)) b!559054))

(declare-fun m!536431 () Bool)

(assert (=> b!559051 m!536431))

(declare-fun m!536433 () Bool)

(assert (=> d!83531 m!536433))

(declare-fun m!536435 () Bool)

(assert (=> d!83531 m!536435))

(declare-fun m!536437 () Bool)

(assert (=> d!83531 m!536437))

(assert (=> d!83531 m!536199))

(declare-fun m!536439 () Bool)

(assert (=> d!83531 m!536439))

(assert (=> d!83531 m!536437))

(declare-fun m!536441 () Bool)

(assert (=> d!83531 m!536441))

(declare-fun m!536443 () Bool)

(assert (=> b!559054 m!536443))

(assert (=> b!558768 d!83531))

(declare-fun d!83533 () Bool)

(assert (=> d!83533 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!51164 d!83533))

(declare-fun d!83539 () Bool)

(assert (=> d!83539 (= (array_inv!12769 a!3118) (bvsge (size!17251 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!51164 d!83539))

(declare-fun d!83541 () Bool)

(assert (=> d!83541 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!558762 d!83541))

(check-sat (not b!558950) (not d!83471) (not b!558866) (not d!83501) (not bm!32398) (not b!558875) (not bm!32389) (not b!559038) (not b!558994) (not b!558991) (not b!559044) (not b!558891) (not d!83513) (not bm!32403) (not b!559054) (not d!83485) (not b!558894) (not b!559041) (not b!558895) (not d!83473) (not d!83531) (not b!559050))
(check-sat)

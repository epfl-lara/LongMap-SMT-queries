; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51614 () Bool)

(assert start!51614)

(declare-fun b!564728 () Bool)

(declare-fun e!325145 () Bool)

(declare-fun e!325144 () Bool)

(assert (=> b!564728 (= e!325145 e!325144)))

(declare-fun res!356027 () Bool)

(assert (=> b!564728 (=> (not res!356027) (not e!325144))))

(declare-datatypes ((SeekEntryResult!5491 0))(
  ( (MissingZero!5491 (index!24191 (_ BitVec 32))) (Found!5491 (index!24192 (_ BitVec 32))) (Intermediate!5491 (undefined!6303 Bool) (index!24193 (_ BitVec 32)) (x!53069 (_ BitVec 32))) (Undefined!5491) (MissingVacant!5491 (index!24194 (_ BitVec 32))) )
))
(declare-fun lt!257494 () SeekEntryResult!5491)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564728 (= res!356027 (or (= lt!257494 (MissingZero!5491 i!1132)) (= lt!257494 (MissingVacant!5491 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!35488 0))(
  ( (array!35489 (arr!17045 (Array (_ BitVec 32) (_ BitVec 64))) (size!17410 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35488)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35488 (_ BitVec 32)) SeekEntryResult!5491)

(assert (=> b!564728 (= lt!257494 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!564729 () Bool)

(declare-fun res!356022 () Bool)

(assert (=> b!564729 (=> (not res!356022) (not e!325145))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!564729 (= res!356022 (and (= (size!17410 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17410 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17410 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!564730 () Bool)

(declare-fun res!356025 () Bool)

(assert (=> b!564730 (=> (not res!356025) (not e!325144))))

(declare-datatypes ((List!11164 0))(
  ( (Nil!11161) (Cons!11160 (h!12163 (_ BitVec 64)) (t!17383 List!11164)) )
))
(declare-fun arrayNoDuplicates!0 (array!35488 (_ BitVec 32) List!11164) Bool)

(assert (=> b!564730 (= res!356025 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11161))))

(declare-fun b!564731 () Bool)

(assert (=> b!564731 (= e!325144 (not (= (seekEntryOrOpen!0 (select (arr!17045 a!3118) j!142) a!3118 mask!3119) (Found!5491 j!142))))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35488 (_ BitVec 32)) Bool)

(assert (=> b!564731 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17670 0))(
  ( (Unit!17671) )
))
(declare-fun lt!257493 () Unit!17670)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35488 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17670)

(assert (=> b!564731 (= lt!257493 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!564732 () Bool)

(declare-fun res!356026 () Bool)

(assert (=> b!564732 (=> (not res!356026) (not e!325144))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35488 (_ BitVec 32)) SeekEntryResult!5491)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564732 (= res!356026 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17045 a!3118) j!142) mask!3119) (select (arr!17045 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17045 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17045 a!3118) i!1132 k0!1914) j!142) (array!35489 (store (arr!17045 a!3118) i!1132 k0!1914) (size!17410 a!3118)) mask!3119)))))

(declare-fun b!564733 () Bool)

(declare-fun res!356029 () Bool)

(assert (=> b!564733 (=> (not res!356029) (not e!325145))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564733 (= res!356029 (validKeyInArray!0 (select (arr!17045 a!3118) j!142)))))

(declare-fun res!356024 () Bool)

(assert (=> start!51614 (=> (not res!356024) (not e!325145))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51614 (= res!356024 (validMask!0 mask!3119))))

(assert (=> start!51614 e!325145))

(assert (=> start!51614 true))

(declare-fun array_inv!12928 (array!35488) Bool)

(assert (=> start!51614 (array_inv!12928 a!3118)))

(declare-fun b!564734 () Bool)

(declare-fun res!356028 () Bool)

(assert (=> b!564734 (=> (not res!356028) (not e!325144))))

(assert (=> b!564734 (= res!356028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564735 () Bool)

(declare-fun res!356023 () Bool)

(assert (=> b!564735 (=> (not res!356023) (not e!325145))))

(declare-fun arrayContainsKey!0 (array!35488 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564735 (= res!356023 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564736 () Bool)

(declare-fun res!356030 () Bool)

(assert (=> b!564736 (=> (not res!356030) (not e!325145))))

(assert (=> b!564736 (= res!356030 (validKeyInArray!0 k0!1914))))

(assert (= (and start!51614 res!356024) b!564729))

(assert (= (and b!564729 res!356022) b!564733))

(assert (= (and b!564733 res!356029) b!564736))

(assert (= (and b!564736 res!356030) b!564735))

(assert (= (and b!564735 res!356023) b!564728))

(assert (= (and b!564728 res!356027) b!564734))

(assert (= (and b!564734 res!356028) b!564730))

(assert (= (and b!564730 res!356025) b!564732))

(assert (= (and b!564732 res!356026) b!564731))

(declare-fun m!542741 () Bool)

(assert (=> b!564733 m!542741))

(assert (=> b!564733 m!542741))

(declare-fun m!542743 () Bool)

(assert (=> b!564733 m!542743))

(declare-fun m!542745 () Bool)

(assert (=> b!564734 m!542745))

(declare-fun m!542747 () Bool)

(assert (=> b!564730 m!542747))

(declare-fun m!542749 () Bool)

(assert (=> b!564728 m!542749))

(declare-fun m!542751 () Bool)

(assert (=> start!51614 m!542751))

(declare-fun m!542753 () Bool)

(assert (=> start!51614 m!542753))

(declare-fun m!542755 () Bool)

(assert (=> b!564735 m!542755))

(assert (=> b!564732 m!542741))

(declare-fun m!542757 () Bool)

(assert (=> b!564732 m!542757))

(assert (=> b!564732 m!542741))

(declare-fun m!542759 () Bool)

(assert (=> b!564732 m!542759))

(declare-fun m!542761 () Bool)

(assert (=> b!564732 m!542761))

(assert (=> b!564732 m!542759))

(declare-fun m!542763 () Bool)

(assert (=> b!564732 m!542763))

(assert (=> b!564732 m!542757))

(assert (=> b!564732 m!542741))

(declare-fun m!542765 () Bool)

(assert (=> b!564732 m!542765))

(declare-fun m!542767 () Bool)

(assert (=> b!564732 m!542767))

(assert (=> b!564732 m!542759))

(assert (=> b!564732 m!542761))

(declare-fun m!542769 () Bool)

(assert (=> b!564736 m!542769))

(assert (=> b!564731 m!542741))

(assert (=> b!564731 m!542741))

(declare-fun m!542771 () Bool)

(assert (=> b!564731 m!542771))

(declare-fun m!542773 () Bool)

(assert (=> b!564731 m!542773))

(declare-fun m!542775 () Bool)

(assert (=> b!564731 m!542775))

(check-sat (not b!564733) (not b!564731) (not b!564728) (not b!564734) (not b!564732) (not b!564730) (not start!51614) (not b!564735) (not b!564736))
(check-sat)
(get-model)

(declare-fun b!564803 () Bool)

(declare-fun e!325171 () SeekEntryResult!5491)

(declare-fun lt!257514 () SeekEntryResult!5491)

(assert (=> b!564803 (= e!325171 (MissingZero!5491 (index!24193 lt!257514)))))

(declare-fun d!83769 () Bool)

(declare-fun lt!257513 () SeekEntryResult!5491)

(get-info :version)

(assert (=> d!83769 (and (or ((_ is Undefined!5491) lt!257513) (not ((_ is Found!5491) lt!257513)) (and (bvsge (index!24192 lt!257513) #b00000000000000000000000000000000) (bvslt (index!24192 lt!257513) (size!17410 a!3118)))) (or ((_ is Undefined!5491) lt!257513) ((_ is Found!5491) lt!257513) (not ((_ is MissingZero!5491) lt!257513)) (and (bvsge (index!24191 lt!257513) #b00000000000000000000000000000000) (bvslt (index!24191 lt!257513) (size!17410 a!3118)))) (or ((_ is Undefined!5491) lt!257513) ((_ is Found!5491) lt!257513) ((_ is MissingZero!5491) lt!257513) (not ((_ is MissingVacant!5491) lt!257513)) (and (bvsge (index!24194 lt!257513) #b00000000000000000000000000000000) (bvslt (index!24194 lt!257513) (size!17410 a!3118)))) (or ((_ is Undefined!5491) lt!257513) (ite ((_ is Found!5491) lt!257513) (= (select (arr!17045 a!3118) (index!24192 lt!257513)) k0!1914) (ite ((_ is MissingZero!5491) lt!257513) (= (select (arr!17045 a!3118) (index!24191 lt!257513)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5491) lt!257513) (= (select (arr!17045 a!3118) (index!24194 lt!257513)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!325172 () SeekEntryResult!5491)

(assert (=> d!83769 (= lt!257513 e!325172)))

(declare-fun c!64707 () Bool)

(assert (=> d!83769 (= c!64707 (and ((_ is Intermediate!5491) lt!257514) (undefined!6303 lt!257514)))))

(assert (=> d!83769 (= lt!257514 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!83769 (validMask!0 mask!3119)))

(assert (=> d!83769 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!257513)))

(declare-fun b!564804 () Bool)

(declare-fun e!325173 () SeekEntryResult!5491)

(assert (=> b!564804 (= e!325172 e!325173)))

(declare-fun lt!257515 () (_ BitVec 64))

(assert (=> b!564804 (= lt!257515 (select (arr!17045 a!3118) (index!24193 lt!257514)))))

(declare-fun c!64706 () Bool)

(assert (=> b!564804 (= c!64706 (= lt!257515 k0!1914))))

(declare-fun b!564805 () Bool)

(declare-fun c!64705 () Bool)

(assert (=> b!564805 (= c!64705 (= lt!257515 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!564805 (= e!325173 e!325171)))

(declare-fun b!564806 () Bool)

(assert (=> b!564806 (= e!325172 Undefined!5491)))

(declare-fun b!564807 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35488 (_ BitVec 32)) SeekEntryResult!5491)

(assert (=> b!564807 (= e!325171 (seekKeyOrZeroReturnVacant!0 (x!53069 lt!257514) (index!24193 lt!257514) (index!24193 lt!257514) k0!1914 a!3118 mask!3119))))

(declare-fun b!564808 () Bool)

(assert (=> b!564808 (= e!325173 (Found!5491 (index!24193 lt!257514)))))

(assert (= (and d!83769 c!64707) b!564806))

(assert (= (and d!83769 (not c!64707)) b!564804))

(assert (= (and b!564804 c!64706) b!564808))

(assert (= (and b!564804 (not c!64706)) b!564805))

(assert (= (and b!564805 c!64705) b!564803))

(assert (= (and b!564805 (not c!64705)) b!564807))

(declare-fun m!542849 () Bool)

(assert (=> d!83769 m!542849))

(declare-fun m!542851 () Bool)

(assert (=> d!83769 m!542851))

(declare-fun m!542853 () Bool)

(assert (=> d!83769 m!542853))

(declare-fun m!542855 () Bool)

(assert (=> d!83769 m!542855))

(assert (=> d!83769 m!542751))

(assert (=> d!83769 m!542855))

(declare-fun m!542857 () Bool)

(assert (=> d!83769 m!542857))

(declare-fun m!542859 () Bool)

(assert (=> b!564804 m!542859))

(declare-fun m!542861 () Bool)

(assert (=> b!564807 m!542861))

(assert (=> b!564728 d!83769))

(declare-fun d!83773 () Bool)

(assert (=> d!83773 (= (validKeyInArray!0 (select (arr!17045 a!3118) j!142)) (and (not (= (select (arr!17045 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17045 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!564733 d!83773))

(declare-fun d!83775 () Bool)

(declare-fun res!356089 () Bool)

(declare-fun e!325178 () Bool)

(assert (=> d!83775 (=> res!356089 e!325178)))

(assert (=> d!83775 (= res!356089 (= (select (arr!17045 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!83775 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!325178)))

(declare-fun b!564813 () Bool)

(declare-fun e!325179 () Bool)

(assert (=> b!564813 (= e!325178 e!325179)))

(declare-fun res!356090 () Bool)

(assert (=> b!564813 (=> (not res!356090) (not e!325179))))

(assert (=> b!564813 (= res!356090 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17410 a!3118)))))

(declare-fun b!564814 () Bool)

(assert (=> b!564814 (= e!325179 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!83775 (not res!356089)) b!564813))

(assert (= (and b!564813 res!356090) b!564814))

(declare-fun m!542863 () Bool)

(assert (=> d!83775 m!542863))

(declare-fun m!542865 () Bool)

(assert (=> b!564814 m!542865))

(assert (=> b!564735 d!83775))

(declare-fun b!564829 () Bool)

(declare-fun e!325194 () Bool)

(declare-fun e!325192 () Bool)

(assert (=> b!564829 (= e!325194 e!325192)))

(declare-fun lt!257522 () (_ BitVec 64))

(assert (=> b!564829 (= lt!257522 (select (arr!17045 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!257523 () Unit!17670)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35488 (_ BitVec 64) (_ BitVec 32)) Unit!17670)

(assert (=> b!564829 (= lt!257523 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!257522 #b00000000000000000000000000000000))))

(assert (=> b!564829 (arrayContainsKey!0 a!3118 lt!257522 #b00000000000000000000000000000000)))

(declare-fun lt!257524 () Unit!17670)

(assert (=> b!564829 (= lt!257524 lt!257523)))

(declare-fun res!356101 () Bool)

(assert (=> b!564829 (= res!356101 (= (seekEntryOrOpen!0 (select (arr!17045 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5491 #b00000000000000000000000000000000)))))

(assert (=> b!564829 (=> (not res!356101) (not e!325192))))

(declare-fun d!83779 () Bool)

(declare-fun res!356102 () Bool)

(declare-fun e!325193 () Bool)

(assert (=> d!83779 (=> res!356102 e!325193)))

(assert (=> d!83779 (= res!356102 (bvsge #b00000000000000000000000000000000 (size!17410 a!3118)))))

(assert (=> d!83779 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!325193)))

(declare-fun b!564830 () Bool)

(declare-fun call!32434 () Bool)

(assert (=> b!564830 (= e!325192 call!32434)))

(declare-fun b!564831 () Bool)

(assert (=> b!564831 (= e!325194 call!32434)))

(declare-fun b!564832 () Bool)

(assert (=> b!564832 (= e!325193 e!325194)))

(declare-fun c!64710 () Bool)

(assert (=> b!564832 (= c!64710 (validKeyInArray!0 (select (arr!17045 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32431 () Bool)

(assert (=> bm!32431 (= call!32434 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!83779 (not res!356102)) b!564832))

(assert (= (and b!564832 c!64710) b!564829))

(assert (= (and b!564832 (not c!64710)) b!564831))

(assert (= (and b!564829 res!356101) b!564830))

(assert (= (or b!564830 b!564831) bm!32431))

(assert (=> b!564829 m!542863))

(declare-fun m!542871 () Bool)

(assert (=> b!564829 m!542871))

(declare-fun m!542873 () Bool)

(assert (=> b!564829 m!542873))

(assert (=> b!564829 m!542863))

(declare-fun m!542875 () Bool)

(assert (=> b!564829 m!542875))

(assert (=> b!564832 m!542863))

(assert (=> b!564832 m!542863))

(declare-fun m!542877 () Bool)

(assert (=> b!564832 m!542877))

(declare-fun m!542879 () Bool)

(assert (=> bm!32431 m!542879))

(assert (=> b!564734 d!83779))

(declare-fun b!564833 () Bool)

(declare-fun e!325195 () SeekEntryResult!5491)

(declare-fun lt!257526 () SeekEntryResult!5491)

(assert (=> b!564833 (= e!325195 (MissingZero!5491 (index!24193 lt!257526)))))

(declare-fun d!83783 () Bool)

(declare-fun lt!257525 () SeekEntryResult!5491)

(assert (=> d!83783 (and (or ((_ is Undefined!5491) lt!257525) (not ((_ is Found!5491) lt!257525)) (and (bvsge (index!24192 lt!257525) #b00000000000000000000000000000000) (bvslt (index!24192 lt!257525) (size!17410 a!3118)))) (or ((_ is Undefined!5491) lt!257525) ((_ is Found!5491) lt!257525) (not ((_ is MissingZero!5491) lt!257525)) (and (bvsge (index!24191 lt!257525) #b00000000000000000000000000000000) (bvslt (index!24191 lt!257525) (size!17410 a!3118)))) (or ((_ is Undefined!5491) lt!257525) ((_ is Found!5491) lt!257525) ((_ is MissingZero!5491) lt!257525) (not ((_ is MissingVacant!5491) lt!257525)) (and (bvsge (index!24194 lt!257525) #b00000000000000000000000000000000) (bvslt (index!24194 lt!257525) (size!17410 a!3118)))) (or ((_ is Undefined!5491) lt!257525) (ite ((_ is Found!5491) lt!257525) (= (select (arr!17045 a!3118) (index!24192 lt!257525)) (select (arr!17045 a!3118) j!142)) (ite ((_ is MissingZero!5491) lt!257525) (= (select (arr!17045 a!3118) (index!24191 lt!257525)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5491) lt!257525) (= (select (arr!17045 a!3118) (index!24194 lt!257525)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!325196 () SeekEntryResult!5491)

(assert (=> d!83783 (= lt!257525 e!325196)))

(declare-fun c!64713 () Bool)

(assert (=> d!83783 (= c!64713 (and ((_ is Intermediate!5491) lt!257526) (undefined!6303 lt!257526)))))

(assert (=> d!83783 (= lt!257526 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17045 a!3118) j!142) mask!3119) (select (arr!17045 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!83783 (validMask!0 mask!3119)))

(assert (=> d!83783 (= (seekEntryOrOpen!0 (select (arr!17045 a!3118) j!142) a!3118 mask!3119) lt!257525)))

(declare-fun b!564834 () Bool)

(declare-fun e!325197 () SeekEntryResult!5491)

(assert (=> b!564834 (= e!325196 e!325197)))

(declare-fun lt!257527 () (_ BitVec 64))

(assert (=> b!564834 (= lt!257527 (select (arr!17045 a!3118) (index!24193 lt!257526)))))

(declare-fun c!64712 () Bool)

(assert (=> b!564834 (= c!64712 (= lt!257527 (select (arr!17045 a!3118) j!142)))))

(declare-fun b!564835 () Bool)

(declare-fun c!64711 () Bool)

(assert (=> b!564835 (= c!64711 (= lt!257527 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!564835 (= e!325197 e!325195)))

(declare-fun b!564836 () Bool)

(assert (=> b!564836 (= e!325196 Undefined!5491)))

(declare-fun b!564837 () Bool)

(assert (=> b!564837 (= e!325195 (seekKeyOrZeroReturnVacant!0 (x!53069 lt!257526) (index!24193 lt!257526) (index!24193 lt!257526) (select (arr!17045 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!564838 () Bool)

(assert (=> b!564838 (= e!325197 (Found!5491 (index!24193 lt!257526)))))

(assert (= (and d!83783 c!64713) b!564836))

(assert (= (and d!83783 (not c!64713)) b!564834))

(assert (= (and b!564834 c!64712) b!564838))

(assert (= (and b!564834 (not c!64712)) b!564835))

(assert (= (and b!564835 c!64711) b!564833))

(assert (= (and b!564835 (not c!64711)) b!564837))

(declare-fun m!542881 () Bool)

(assert (=> d!83783 m!542881))

(declare-fun m!542883 () Bool)

(assert (=> d!83783 m!542883))

(declare-fun m!542885 () Bool)

(assert (=> d!83783 m!542885))

(assert (=> d!83783 m!542741))

(assert (=> d!83783 m!542757))

(assert (=> d!83783 m!542751))

(assert (=> d!83783 m!542757))

(assert (=> d!83783 m!542741))

(assert (=> d!83783 m!542765))

(declare-fun m!542887 () Bool)

(assert (=> b!564834 m!542887))

(assert (=> b!564837 m!542741))

(declare-fun m!542889 () Bool)

(assert (=> b!564837 m!542889))

(assert (=> b!564731 d!83783))

(declare-fun b!564839 () Bool)

(declare-fun e!325200 () Bool)

(declare-fun e!325198 () Bool)

(assert (=> b!564839 (= e!325200 e!325198)))

(declare-fun lt!257528 () (_ BitVec 64))

(assert (=> b!564839 (= lt!257528 (select (arr!17045 a!3118) j!142))))

(declare-fun lt!257529 () Unit!17670)

(assert (=> b!564839 (= lt!257529 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!257528 j!142))))

(assert (=> b!564839 (arrayContainsKey!0 a!3118 lt!257528 #b00000000000000000000000000000000)))

(declare-fun lt!257530 () Unit!17670)

(assert (=> b!564839 (= lt!257530 lt!257529)))

(declare-fun res!356103 () Bool)

(assert (=> b!564839 (= res!356103 (= (seekEntryOrOpen!0 (select (arr!17045 a!3118) j!142) a!3118 mask!3119) (Found!5491 j!142)))))

(assert (=> b!564839 (=> (not res!356103) (not e!325198))))

(declare-fun d!83785 () Bool)

(declare-fun res!356104 () Bool)

(declare-fun e!325199 () Bool)

(assert (=> d!83785 (=> res!356104 e!325199)))

(assert (=> d!83785 (= res!356104 (bvsge j!142 (size!17410 a!3118)))))

(assert (=> d!83785 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!325199)))

(declare-fun b!564840 () Bool)

(declare-fun call!32435 () Bool)

(assert (=> b!564840 (= e!325198 call!32435)))

(declare-fun b!564841 () Bool)

(assert (=> b!564841 (= e!325200 call!32435)))

(declare-fun b!564842 () Bool)

(assert (=> b!564842 (= e!325199 e!325200)))

(declare-fun c!64714 () Bool)

(assert (=> b!564842 (= c!64714 (validKeyInArray!0 (select (arr!17045 a!3118) j!142)))))

(declare-fun bm!32432 () Bool)

(assert (=> bm!32432 (= call!32435 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!83785 (not res!356104)) b!564842))

(assert (= (and b!564842 c!64714) b!564839))

(assert (= (and b!564842 (not c!64714)) b!564841))

(assert (= (and b!564839 res!356103) b!564840))

(assert (= (or b!564840 b!564841) bm!32432))

(assert (=> b!564839 m!542741))

(declare-fun m!542891 () Bool)

(assert (=> b!564839 m!542891))

(declare-fun m!542893 () Bool)

(assert (=> b!564839 m!542893))

(assert (=> b!564839 m!542741))

(assert (=> b!564839 m!542771))

(assert (=> b!564842 m!542741))

(assert (=> b!564842 m!542741))

(assert (=> b!564842 m!542743))

(declare-fun m!542895 () Bool)

(assert (=> bm!32432 m!542895))

(assert (=> b!564731 d!83785))

(declare-fun d!83787 () Bool)

(assert (=> d!83787 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!257537 () Unit!17670)

(declare-fun choose!38 (array!35488 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17670)

(assert (=> d!83787 (= lt!257537 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!83787 (validMask!0 mask!3119)))

(assert (=> d!83787 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!257537)))

(declare-fun bs!17527 () Bool)

(assert (= bs!17527 d!83787))

(assert (=> bs!17527 m!542773))

(declare-fun m!542897 () Bool)

(assert (=> bs!17527 m!542897))

(assert (=> bs!17527 m!542751))

(assert (=> b!564731 d!83787))

(declare-fun d!83789 () Bool)

(assert (=> d!83789 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!51614 d!83789))

(declare-fun d!83795 () Bool)

(assert (=> d!83795 (= (array_inv!12928 a!3118) (bvsge (size!17410 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!51614 d!83795))

(declare-fun d!83797 () Bool)

(assert (=> d!83797 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!564736 d!83797))

(declare-fun bm!32438 () Bool)

(declare-fun call!32441 () Bool)

(declare-fun c!64738 () Bool)

(assert (=> bm!32438 (= call!32441 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64738 (Cons!11160 (select (arr!17045 a!3118) #b00000000000000000000000000000000) Nil!11161) Nil!11161)))))

(declare-fun b!564910 () Bool)

(declare-fun e!325242 () Bool)

(assert (=> b!564910 (= e!325242 call!32441)))

(declare-fun d!83799 () Bool)

(declare-fun res!356127 () Bool)

(declare-fun e!325244 () Bool)

(assert (=> d!83799 (=> res!356127 e!325244)))

(assert (=> d!83799 (= res!356127 (bvsge #b00000000000000000000000000000000 (size!17410 a!3118)))))

(assert (=> d!83799 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11161) e!325244)))

(declare-fun b!564911 () Bool)

(assert (=> b!564911 (= e!325242 call!32441)))

(declare-fun b!564912 () Bool)

(declare-fun e!325243 () Bool)

(assert (=> b!564912 (= e!325243 e!325242)))

(assert (=> b!564912 (= c!64738 (validKeyInArray!0 (select (arr!17045 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!564913 () Bool)

(declare-fun e!325245 () Bool)

(declare-fun contains!2842 (List!11164 (_ BitVec 64)) Bool)

(assert (=> b!564913 (= e!325245 (contains!2842 Nil!11161 (select (arr!17045 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!564914 () Bool)

(assert (=> b!564914 (= e!325244 e!325243)))

(declare-fun res!356129 () Bool)

(assert (=> b!564914 (=> (not res!356129) (not e!325243))))

(assert (=> b!564914 (= res!356129 (not e!325245))))

(declare-fun res!356128 () Bool)

(assert (=> b!564914 (=> (not res!356128) (not e!325245))))

(assert (=> b!564914 (= res!356128 (validKeyInArray!0 (select (arr!17045 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!83799 (not res!356127)) b!564914))

(assert (= (and b!564914 res!356128) b!564913))

(assert (= (and b!564914 res!356129) b!564912))

(assert (= (and b!564912 c!64738) b!564910))

(assert (= (and b!564912 (not c!64738)) b!564911))

(assert (= (or b!564910 b!564911) bm!32438))

(assert (=> bm!32438 m!542863))

(declare-fun m!542923 () Bool)

(assert (=> bm!32438 m!542923))

(assert (=> b!564912 m!542863))

(assert (=> b!564912 m!542863))

(assert (=> b!564912 m!542877))

(assert (=> b!564913 m!542863))

(assert (=> b!564913 m!542863))

(declare-fun m!542925 () Bool)

(assert (=> b!564913 m!542925))

(assert (=> b!564914 m!542863))

(assert (=> b!564914 m!542863))

(assert (=> b!564914 m!542877))

(assert (=> b!564730 d!83799))

(declare-fun b!564961 () Bool)

(declare-fun e!325280 () SeekEntryResult!5491)

(assert (=> b!564961 (= e!325280 (Intermediate!5491 true (toIndex!0 (select (arr!17045 a!3118) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!564962 () Bool)

(declare-fun lt!257579 () SeekEntryResult!5491)

(assert (=> b!564962 (and (bvsge (index!24193 lt!257579) #b00000000000000000000000000000000) (bvslt (index!24193 lt!257579) (size!17410 a!3118)))))

(declare-fun res!356152 () Bool)

(assert (=> b!564962 (= res!356152 (= (select (arr!17045 a!3118) (index!24193 lt!257579)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!325278 () Bool)

(assert (=> b!564962 (=> res!356152 e!325278)))

(declare-fun b!564963 () Bool)

(declare-fun e!325277 () Bool)

(declare-fun e!325276 () Bool)

(assert (=> b!564963 (= e!325277 e!325276)))

(declare-fun res!356150 () Bool)

(assert (=> b!564963 (= res!356150 (and ((_ is Intermediate!5491) lt!257579) (not (undefined!6303 lt!257579)) (bvslt (x!53069 lt!257579) #b01111111111111111111111111111110) (bvsge (x!53069 lt!257579) #b00000000000000000000000000000000) (bvsge (x!53069 lt!257579) #b00000000000000000000000000000000)))))

(assert (=> b!564963 (=> (not res!356150) (not e!325276))))

(declare-fun d!83805 () Bool)

(assert (=> d!83805 e!325277))

(declare-fun c!64754 () Bool)

(assert (=> d!83805 (= c!64754 (and ((_ is Intermediate!5491) lt!257579) (undefined!6303 lt!257579)))))

(assert (=> d!83805 (= lt!257579 e!325280)))

(declare-fun c!64753 () Bool)

(assert (=> d!83805 (= c!64753 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!257578 () (_ BitVec 64))

(assert (=> d!83805 (= lt!257578 (select (arr!17045 a!3118) (toIndex!0 (select (arr!17045 a!3118) j!142) mask!3119)))))

(assert (=> d!83805 (validMask!0 mask!3119)))

(assert (=> d!83805 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17045 a!3118) j!142) mask!3119) (select (arr!17045 a!3118) j!142) a!3118 mask!3119) lt!257579)))

(declare-fun b!564964 () Bool)

(declare-fun e!325279 () SeekEntryResult!5491)

(assert (=> b!564964 (= e!325280 e!325279)))

(declare-fun c!64752 () Bool)

(assert (=> b!564964 (= c!64752 (or (= lt!257578 (select (arr!17045 a!3118) j!142)) (= (bvadd lt!257578 lt!257578) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!564965 () Bool)

(assert (=> b!564965 (and (bvsge (index!24193 lt!257579) #b00000000000000000000000000000000) (bvslt (index!24193 lt!257579) (size!17410 a!3118)))))

(declare-fun res!356151 () Bool)

(assert (=> b!564965 (= res!356151 (= (select (arr!17045 a!3118) (index!24193 lt!257579)) (select (arr!17045 a!3118) j!142)))))

(assert (=> b!564965 (=> res!356151 e!325278)))

(assert (=> b!564965 (= e!325276 e!325278)))

(declare-fun b!564966 () Bool)

(assert (=> b!564966 (and (bvsge (index!24193 lt!257579) #b00000000000000000000000000000000) (bvslt (index!24193 lt!257579) (size!17410 a!3118)))))

(assert (=> b!564966 (= e!325278 (= (select (arr!17045 a!3118) (index!24193 lt!257579)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!564967 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564967 (= e!325279 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!17045 a!3118) j!142) mask!3119) #b00000000000000000000000000000000 mask!3119) (select (arr!17045 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!564968 () Bool)

(assert (=> b!564968 (= e!325277 (bvsge (x!53069 lt!257579) #b01111111111111111111111111111110))))

(declare-fun b!564969 () Bool)

(assert (=> b!564969 (= e!325279 (Intermediate!5491 false (toIndex!0 (select (arr!17045 a!3118) j!142) mask!3119) #b00000000000000000000000000000000))))

(assert (= (and d!83805 c!64753) b!564961))

(assert (= (and d!83805 (not c!64753)) b!564964))

(assert (= (and b!564964 c!64752) b!564969))

(assert (= (and b!564964 (not c!64752)) b!564967))

(assert (= (and d!83805 c!64754) b!564968))

(assert (= (and d!83805 (not c!64754)) b!564963))

(assert (= (and b!564963 res!356150) b!564965))

(assert (= (and b!564965 (not res!356151)) b!564962))

(assert (= (and b!564962 (not res!356152)) b!564966))

(assert (=> b!564967 m!542757))

(declare-fun m!542951 () Bool)

(assert (=> b!564967 m!542951))

(assert (=> b!564967 m!542951))

(assert (=> b!564967 m!542741))

(declare-fun m!542953 () Bool)

(assert (=> b!564967 m!542953))

(assert (=> d!83805 m!542757))

(declare-fun m!542955 () Bool)

(assert (=> d!83805 m!542955))

(assert (=> d!83805 m!542751))

(declare-fun m!542957 () Bool)

(assert (=> b!564966 m!542957))

(assert (=> b!564965 m!542957))

(assert (=> b!564962 m!542957))

(assert (=> b!564732 d!83805))

(declare-fun d!83821 () Bool)

(declare-fun lt!257591 () (_ BitVec 32))

(declare-fun lt!257590 () (_ BitVec 32))

(assert (=> d!83821 (= lt!257591 (bvmul (bvxor lt!257590 (bvlshr lt!257590 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83821 (= lt!257590 ((_ extract 31 0) (bvand (bvxor (select (arr!17045 a!3118) j!142) (bvlshr (select (arr!17045 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83821 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!356153 (let ((h!12167 ((_ extract 31 0) (bvand (bvxor (select (arr!17045 a!3118) j!142) (bvlshr (select (arr!17045 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53075 (bvmul (bvxor h!12167 (bvlshr h!12167 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53075 (bvlshr x!53075 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!356153 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!356153 #b00000000000000000000000000000000))))))

(assert (=> d!83821 (= (toIndex!0 (select (arr!17045 a!3118) j!142) mask!3119) (bvand (bvxor lt!257591 (bvlshr lt!257591 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!564732 d!83821))

(declare-fun e!325291 () SeekEntryResult!5491)

(declare-fun b!564982 () Bool)

(assert (=> b!564982 (= e!325291 (Intermediate!5491 true (toIndex!0 (select (store (arr!17045 a!3118) i!1132 k0!1914) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!564983 () Bool)

(declare-fun lt!257593 () SeekEntryResult!5491)

(assert (=> b!564983 (and (bvsge (index!24193 lt!257593) #b00000000000000000000000000000000) (bvslt (index!24193 lt!257593) (size!17410 (array!35489 (store (arr!17045 a!3118) i!1132 k0!1914) (size!17410 a!3118)))))))

(declare-fun res!356156 () Bool)

(assert (=> b!564983 (= res!356156 (= (select (arr!17045 (array!35489 (store (arr!17045 a!3118) i!1132 k0!1914) (size!17410 a!3118))) (index!24193 lt!257593)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!325289 () Bool)

(assert (=> b!564983 (=> res!356156 e!325289)))

(declare-fun b!564984 () Bool)

(declare-fun e!325288 () Bool)

(declare-fun e!325287 () Bool)

(assert (=> b!564984 (= e!325288 e!325287)))

(declare-fun res!356154 () Bool)

(assert (=> b!564984 (= res!356154 (and ((_ is Intermediate!5491) lt!257593) (not (undefined!6303 lt!257593)) (bvslt (x!53069 lt!257593) #b01111111111111111111111111111110) (bvsge (x!53069 lt!257593) #b00000000000000000000000000000000) (bvsge (x!53069 lt!257593) #b00000000000000000000000000000000)))))

(assert (=> b!564984 (=> (not res!356154) (not e!325287))))

(declare-fun d!83827 () Bool)

(assert (=> d!83827 e!325288))

(declare-fun c!64763 () Bool)

(assert (=> d!83827 (= c!64763 (and ((_ is Intermediate!5491) lt!257593) (undefined!6303 lt!257593)))))

(assert (=> d!83827 (= lt!257593 e!325291)))

(declare-fun c!64762 () Bool)

(assert (=> d!83827 (= c!64762 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!257592 () (_ BitVec 64))

(assert (=> d!83827 (= lt!257592 (select (arr!17045 (array!35489 (store (arr!17045 a!3118) i!1132 k0!1914) (size!17410 a!3118))) (toIndex!0 (select (store (arr!17045 a!3118) i!1132 k0!1914) j!142) mask!3119)))))

(assert (=> d!83827 (validMask!0 mask!3119)))

(assert (=> d!83827 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17045 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17045 a!3118) i!1132 k0!1914) j!142) (array!35489 (store (arr!17045 a!3118) i!1132 k0!1914) (size!17410 a!3118)) mask!3119) lt!257593)))

(declare-fun b!564985 () Bool)

(declare-fun e!325290 () SeekEntryResult!5491)

(assert (=> b!564985 (= e!325291 e!325290)))

(declare-fun c!64761 () Bool)

(assert (=> b!564985 (= c!64761 (or (= lt!257592 (select (store (arr!17045 a!3118) i!1132 k0!1914) j!142)) (= (bvadd lt!257592 lt!257592) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!564986 () Bool)

(assert (=> b!564986 (and (bvsge (index!24193 lt!257593) #b00000000000000000000000000000000) (bvslt (index!24193 lt!257593) (size!17410 (array!35489 (store (arr!17045 a!3118) i!1132 k0!1914) (size!17410 a!3118)))))))

(declare-fun res!356155 () Bool)

(assert (=> b!564986 (= res!356155 (= (select (arr!17045 (array!35489 (store (arr!17045 a!3118) i!1132 k0!1914) (size!17410 a!3118))) (index!24193 lt!257593)) (select (store (arr!17045 a!3118) i!1132 k0!1914) j!142)))))

(assert (=> b!564986 (=> res!356155 e!325289)))

(assert (=> b!564986 (= e!325287 e!325289)))

(declare-fun b!564987 () Bool)

(assert (=> b!564987 (and (bvsge (index!24193 lt!257593) #b00000000000000000000000000000000) (bvslt (index!24193 lt!257593) (size!17410 (array!35489 (store (arr!17045 a!3118) i!1132 k0!1914) (size!17410 a!3118)))))))

(assert (=> b!564987 (= e!325289 (= (select (arr!17045 (array!35489 (store (arr!17045 a!3118) i!1132 k0!1914) (size!17410 a!3118))) (index!24193 lt!257593)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!564988 () Bool)

(assert (=> b!564988 (= e!325290 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!17045 a!3118) i!1132 k0!1914) j!142) mask!3119) #b00000000000000000000000000000000 mask!3119) (select (store (arr!17045 a!3118) i!1132 k0!1914) j!142) (array!35489 (store (arr!17045 a!3118) i!1132 k0!1914) (size!17410 a!3118)) mask!3119))))

(declare-fun b!564989 () Bool)

(assert (=> b!564989 (= e!325288 (bvsge (x!53069 lt!257593) #b01111111111111111111111111111110))))

(declare-fun b!564990 () Bool)

(assert (=> b!564990 (= e!325290 (Intermediate!5491 false (toIndex!0 (select (store (arr!17045 a!3118) i!1132 k0!1914) j!142) mask!3119) #b00000000000000000000000000000000))))

(assert (= (and d!83827 c!64762) b!564982))

(assert (= (and d!83827 (not c!64762)) b!564985))

(assert (= (and b!564985 c!64761) b!564990))

(assert (= (and b!564985 (not c!64761)) b!564988))

(assert (= (and d!83827 c!64763) b!564989))

(assert (= (and d!83827 (not c!64763)) b!564984))

(assert (= (and b!564984 res!356154) b!564986))

(assert (= (and b!564986 (not res!356155)) b!564983))

(assert (= (and b!564983 (not res!356156)) b!564987))

(assert (=> b!564988 m!542761))

(declare-fun m!542959 () Bool)

(assert (=> b!564988 m!542959))

(assert (=> b!564988 m!542959))

(assert (=> b!564988 m!542759))

(declare-fun m!542961 () Bool)

(assert (=> b!564988 m!542961))

(assert (=> d!83827 m!542761))

(declare-fun m!542963 () Bool)

(assert (=> d!83827 m!542963))

(assert (=> d!83827 m!542751))

(declare-fun m!542965 () Bool)

(assert (=> b!564987 m!542965))

(assert (=> b!564986 m!542965))

(assert (=> b!564983 m!542965))

(assert (=> b!564732 d!83827))

(declare-fun d!83829 () Bool)

(declare-fun lt!257598 () (_ BitVec 32))

(declare-fun lt!257597 () (_ BitVec 32))

(assert (=> d!83829 (= lt!257598 (bvmul (bvxor lt!257597 (bvlshr lt!257597 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83829 (= lt!257597 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17045 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!17045 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83829 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!356153 (let ((h!12167 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17045 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!17045 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53075 (bvmul (bvxor h!12167 (bvlshr h!12167 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53075 (bvlshr x!53075 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!356153 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!356153 #b00000000000000000000000000000000))))))

(assert (=> d!83829 (= (toIndex!0 (select (store (arr!17045 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvand (bvxor lt!257598 (bvlshr lt!257598 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!564732 d!83829))

(check-sat (not b!564837) (not b!564913) (not b!564842) (not b!564914) (not bm!32431) (not b!564814) (not b!564988) (not bm!32438) (not b!564829) (not d!83805) (not b!564807) (not b!564839) (not d!83783) (not bm!32432) (not d!83827) (not d!83787) (not d!83769) (not b!564832) (not b!564912) (not b!564967))
(check-sat)

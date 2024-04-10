; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52468 () Bool)

(assert start!52468)

(declare-fun res!362597 () Bool)

(declare-fun e!329681 () Bool)

(assert (=> start!52468 (=> (not res!362597) (not e!329681))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52468 (= res!362597 (validMask!0 mask!3119))))

(assert (=> start!52468 e!329681))

(assert (=> start!52468 true))

(declare-datatypes ((array!35865 0))(
  ( (array!35866 (arr!17221 (Array (_ BitVec 32) (_ BitVec 64))) (size!17585 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35865)

(declare-fun array_inv!13017 (array!35865) Bool)

(assert (=> start!52468 (array_inv!13017 a!3118)))

(declare-fun b!573089 () Bool)

(declare-fun res!362605 () Bool)

(declare-fun e!329677 () Bool)

(assert (=> b!573089 (=> (not res!362605) (not e!329677))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35865 (_ BitVec 32)) Bool)

(assert (=> b!573089 (= res!362605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!573090 () Bool)

(declare-fun res!362604 () Bool)

(assert (=> b!573090 (=> (not res!362604) (not e!329681))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!573090 (= res!362604 (validKeyInArray!0 k0!1914))))

(declare-fun b!573091 () Bool)

(declare-fun e!329682 () Bool)

(declare-fun e!329679 () Bool)

(assert (=> b!573091 (= e!329682 e!329679)))

(declare-fun res!362607 () Bool)

(assert (=> b!573091 (=> res!362607 e!329679)))

(declare-datatypes ((SeekEntryResult!5670 0))(
  ( (MissingZero!5670 (index!24907 (_ BitVec 32))) (Found!5670 (index!24908 (_ BitVec 32))) (Intermediate!5670 (undefined!6482 Bool) (index!24909 (_ BitVec 32)) (x!53771 (_ BitVec 32))) (Undefined!5670) (MissingVacant!5670 (index!24910 (_ BitVec 32))) )
))
(declare-fun lt!261689 () SeekEntryResult!5670)

(get-info :version)

(assert (=> b!573091 (= res!362607 (or (undefined!6482 lt!261689) (not ((_ is Intermediate!5670) lt!261689))))))

(declare-fun b!573092 () Bool)

(declare-fun e!329675 () Bool)

(declare-fun e!329680 () Bool)

(assert (=> b!573092 (= e!329675 e!329680)))

(declare-fun res!362599 () Bool)

(assert (=> b!573092 (=> (not res!362599) (not e!329680))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!261688 () SeekEntryResult!5670)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35865 (_ BitVec 32)) SeekEntryResult!5670)

(assert (=> b!573092 (= res!362599 (= lt!261688 (seekKeyOrZeroReturnVacant!0 (x!53771 lt!261689) (index!24909 lt!261689) (index!24909 lt!261689) (select (arr!17221 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!573093 () Bool)

(declare-fun res!362598 () Bool)

(assert (=> b!573093 (=> (not res!362598) (not e!329681))))

(declare-fun arrayContainsKey!0 (array!35865 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!573093 (= res!362598 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!573094 () Bool)

(declare-fun res!362608 () Bool)

(assert (=> b!573094 (=> (not res!362608) (not e!329681))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!573094 (= res!362608 (and (= (size!17585 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17585 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17585 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!573095 () Bool)

(declare-fun e!329676 () Bool)

(assert (=> b!573095 (= e!329676 (not (or (undefined!6482 lt!261689) (not ((_ is Intermediate!5670) lt!261689)) (let ((bdg!17961 (select (arr!17221 a!3118) (index!24909 lt!261689)))) (or (= bdg!17961 (select (arr!17221 a!3118) j!142)) (= bdg!17961 #b0000000000000000000000000000000000000000000000000000000000000000) (and (bvsge (index!24909 lt!261689) #b00000000000000000000000000000000) (bvslt (index!24909 lt!261689) (bvadd #b00000000000000000000000000000001 mask!3119))))))))))

(assert (=> b!573095 e!329682))

(declare-fun res!362600 () Bool)

(assert (=> b!573095 (=> (not res!362600) (not e!329682))))

(assert (=> b!573095 (= res!362600 (= lt!261688 (Found!5670 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35865 (_ BitVec 32)) SeekEntryResult!5670)

(assert (=> b!573095 (= lt!261688 (seekEntryOrOpen!0 (select (arr!17221 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!573095 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18042 0))(
  ( (Unit!18043) )
))
(declare-fun lt!261693 () Unit!18042)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35865 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18042)

(assert (=> b!573095 (= lt!261693 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!573096 () Bool)

(assert (=> b!573096 (= e!329681 e!329677)))

(declare-fun res!362606 () Bool)

(assert (=> b!573096 (=> (not res!362606) (not e!329677))))

(declare-fun lt!261694 () SeekEntryResult!5670)

(assert (=> b!573096 (= res!362606 (or (= lt!261694 (MissingZero!5670 i!1132)) (= lt!261694 (MissingVacant!5670 i!1132))))))

(assert (=> b!573096 (= lt!261694 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!573097 () Bool)

(declare-fun res!362609 () Bool)

(assert (=> b!573097 (=> (not res!362609) (not e!329677))))

(declare-datatypes ((List!11301 0))(
  ( (Nil!11298) (Cons!11297 (h!12324 (_ BitVec 64)) (t!17529 List!11301)) )
))
(declare-fun arrayNoDuplicates!0 (array!35865 (_ BitVec 32) List!11301) Bool)

(assert (=> b!573097 (= res!362609 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11298))))

(declare-fun b!573098 () Bool)

(assert (=> b!573098 (= e!329677 e!329676)))

(declare-fun res!362601 () Bool)

(assert (=> b!573098 (=> (not res!362601) (not e!329676))))

(declare-fun lt!261687 () array!35865)

(declare-fun lt!261691 () (_ BitVec 64))

(declare-fun lt!261692 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35865 (_ BitVec 32)) SeekEntryResult!5670)

(assert (=> b!573098 (= res!362601 (= lt!261689 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261692 lt!261691 lt!261687 mask!3119)))))

(declare-fun lt!261686 () (_ BitVec 32))

(assert (=> b!573098 (= lt!261689 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261686 (select (arr!17221 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!573098 (= lt!261692 (toIndex!0 lt!261691 mask!3119))))

(assert (=> b!573098 (= lt!261691 (select (store (arr!17221 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!573098 (= lt!261686 (toIndex!0 (select (arr!17221 a!3118) j!142) mask!3119))))

(assert (=> b!573098 (= lt!261687 (array!35866 (store (arr!17221 a!3118) i!1132 k0!1914) (size!17585 a!3118)))))

(declare-fun b!573099 () Bool)

(declare-fun res!362603 () Bool)

(assert (=> b!573099 (=> (not res!362603) (not e!329681))))

(assert (=> b!573099 (= res!362603 (validKeyInArray!0 (select (arr!17221 a!3118) j!142)))))

(declare-fun b!573100 () Bool)

(assert (=> b!573100 (= e!329679 e!329675)))

(declare-fun res!362602 () Bool)

(assert (=> b!573100 (=> res!362602 e!329675)))

(declare-fun lt!261690 () (_ BitVec 64))

(assert (=> b!573100 (= res!362602 (or (= lt!261690 (select (arr!17221 a!3118) j!142)) (= lt!261690 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!573100 (= lt!261690 (select (arr!17221 a!3118) (index!24909 lt!261689)))))

(declare-fun b!573101 () Bool)

(assert (=> b!573101 (= e!329680 (= (seekEntryOrOpen!0 lt!261691 lt!261687 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53771 lt!261689) (index!24909 lt!261689) (index!24909 lt!261689) lt!261691 lt!261687 mask!3119)))))

(assert (= (and start!52468 res!362597) b!573094))

(assert (= (and b!573094 res!362608) b!573099))

(assert (= (and b!573099 res!362603) b!573090))

(assert (= (and b!573090 res!362604) b!573093))

(assert (= (and b!573093 res!362598) b!573096))

(assert (= (and b!573096 res!362606) b!573089))

(assert (= (and b!573089 res!362605) b!573097))

(assert (= (and b!573097 res!362609) b!573098))

(assert (= (and b!573098 res!362601) b!573095))

(assert (= (and b!573095 res!362600) b!573091))

(assert (= (and b!573091 (not res!362607)) b!573100))

(assert (= (and b!573100 (not res!362602)) b!573092))

(assert (= (and b!573092 res!362599) b!573101))

(declare-fun m!552149 () Bool)

(assert (=> b!573093 m!552149))

(declare-fun m!552151 () Bool)

(assert (=> b!573101 m!552151))

(declare-fun m!552153 () Bool)

(assert (=> b!573101 m!552153))

(declare-fun m!552155 () Bool)

(assert (=> b!573095 m!552155))

(declare-fun m!552157 () Bool)

(assert (=> b!573095 m!552157))

(declare-fun m!552159 () Bool)

(assert (=> b!573095 m!552159))

(declare-fun m!552161 () Bool)

(assert (=> b!573095 m!552161))

(assert (=> b!573095 m!552155))

(declare-fun m!552163 () Bool)

(assert (=> b!573095 m!552163))

(declare-fun m!552165 () Bool)

(assert (=> b!573097 m!552165))

(declare-fun m!552167 () Bool)

(assert (=> b!573096 m!552167))

(assert (=> b!573100 m!552155))

(assert (=> b!573100 m!552161))

(declare-fun m!552169 () Bool)

(assert (=> b!573090 m!552169))

(assert (=> b!573098 m!552155))

(declare-fun m!552171 () Bool)

(assert (=> b!573098 m!552171))

(declare-fun m!552173 () Bool)

(assert (=> b!573098 m!552173))

(declare-fun m!552175 () Bool)

(assert (=> b!573098 m!552175))

(declare-fun m!552177 () Bool)

(assert (=> b!573098 m!552177))

(declare-fun m!552179 () Bool)

(assert (=> b!573098 m!552179))

(assert (=> b!573098 m!552155))

(declare-fun m!552181 () Bool)

(assert (=> b!573098 m!552181))

(assert (=> b!573098 m!552155))

(assert (=> b!573092 m!552155))

(assert (=> b!573092 m!552155))

(declare-fun m!552183 () Bool)

(assert (=> b!573092 m!552183))

(declare-fun m!552185 () Bool)

(assert (=> start!52468 m!552185))

(declare-fun m!552187 () Bool)

(assert (=> start!52468 m!552187))

(assert (=> b!573099 m!552155))

(assert (=> b!573099 m!552155))

(declare-fun m!552189 () Bool)

(assert (=> b!573099 m!552189))

(declare-fun m!552191 () Bool)

(assert (=> b!573089 m!552191))

(check-sat (not b!573092) (not b!573090) (not b!573093) (not b!573097) (not b!573099) (not b!573101) (not start!52468) (not b!573098) (not b!573096) (not b!573089) (not b!573095))
(check-sat)
(get-model)

(declare-fun b!573153 () Bool)

(declare-fun e!329714 () SeekEntryResult!5670)

(declare-fun e!329715 () SeekEntryResult!5670)

(assert (=> b!573153 (= e!329714 e!329715)))

(declare-fun lt!261729 () (_ BitVec 64))

(declare-fun lt!261730 () SeekEntryResult!5670)

(assert (=> b!573153 (= lt!261729 (select (arr!17221 lt!261687) (index!24909 lt!261730)))))

(declare-fun c!65612 () Bool)

(assert (=> b!573153 (= c!65612 (= lt!261729 lt!261691))))

(declare-fun b!573154 () Bool)

(declare-fun e!329713 () SeekEntryResult!5670)

(assert (=> b!573154 (= e!329713 (MissingZero!5670 (index!24909 lt!261730)))))

(declare-fun b!573155 () Bool)

(assert (=> b!573155 (= e!329713 (seekKeyOrZeroReturnVacant!0 (x!53771 lt!261730) (index!24909 lt!261730) (index!24909 lt!261730) lt!261691 lt!261687 mask!3119))))

(declare-fun d!84849 () Bool)

(declare-fun lt!261728 () SeekEntryResult!5670)

(assert (=> d!84849 (and (or ((_ is Undefined!5670) lt!261728) (not ((_ is Found!5670) lt!261728)) (and (bvsge (index!24908 lt!261728) #b00000000000000000000000000000000) (bvslt (index!24908 lt!261728) (size!17585 lt!261687)))) (or ((_ is Undefined!5670) lt!261728) ((_ is Found!5670) lt!261728) (not ((_ is MissingZero!5670) lt!261728)) (and (bvsge (index!24907 lt!261728) #b00000000000000000000000000000000) (bvslt (index!24907 lt!261728) (size!17585 lt!261687)))) (or ((_ is Undefined!5670) lt!261728) ((_ is Found!5670) lt!261728) ((_ is MissingZero!5670) lt!261728) (not ((_ is MissingVacant!5670) lt!261728)) (and (bvsge (index!24910 lt!261728) #b00000000000000000000000000000000) (bvslt (index!24910 lt!261728) (size!17585 lt!261687)))) (or ((_ is Undefined!5670) lt!261728) (ite ((_ is Found!5670) lt!261728) (= (select (arr!17221 lt!261687) (index!24908 lt!261728)) lt!261691) (ite ((_ is MissingZero!5670) lt!261728) (= (select (arr!17221 lt!261687) (index!24907 lt!261728)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5670) lt!261728) (= (select (arr!17221 lt!261687) (index!24910 lt!261728)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84849 (= lt!261728 e!329714)))

(declare-fun c!65610 () Bool)

(assert (=> d!84849 (= c!65610 (and ((_ is Intermediate!5670) lt!261730) (undefined!6482 lt!261730)))))

(assert (=> d!84849 (= lt!261730 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!261691 mask!3119) lt!261691 lt!261687 mask!3119))))

(assert (=> d!84849 (validMask!0 mask!3119)))

(assert (=> d!84849 (= (seekEntryOrOpen!0 lt!261691 lt!261687 mask!3119) lt!261728)))

(declare-fun b!573156 () Bool)

(declare-fun c!65611 () Bool)

(assert (=> b!573156 (= c!65611 (= lt!261729 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!573156 (= e!329715 e!329713)))

(declare-fun b!573157 () Bool)

(assert (=> b!573157 (= e!329715 (Found!5670 (index!24909 lt!261730)))))

(declare-fun b!573158 () Bool)

(assert (=> b!573158 (= e!329714 Undefined!5670)))

(assert (= (and d!84849 c!65610) b!573158))

(assert (= (and d!84849 (not c!65610)) b!573153))

(assert (= (and b!573153 c!65612) b!573157))

(assert (= (and b!573153 (not c!65612)) b!573156))

(assert (= (and b!573156 c!65611) b!573154))

(assert (= (and b!573156 (not c!65611)) b!573155))

(declare-fun m!552237 () Bool)

(assert (=> b!573153 m!552237))

(declare-fun m!552239 () Bool)

(assert (=> b!573155 m!552239))

(declare-fun m!552241 () Bool)

(assert (=> d!84849 m!552241))

(assert (=> d!84849 m!552177))

(declare-fun m!552243 () Bool)

(assert (=> d!84849 m!552243))

(assert (=> d!84849 m!552177))

(declare-fun m!552245 () Bool)

(assert (=> d!84849 m!552245))

(assert (=> d!84849 m!552185))

(declare-fun m!552247 () Bool)

(assert (=> d!84849 m!552247))

(assert (=> b!573101 d!84849))

(declare-fun b!573196 () Bool)

(declare-fun e!329744 () SeekEntryResult!5670)

(declare-fun e!329742 () SeekEntryResult!5670)

(assert (=> b!573196 (= e!329744 e!329742)))

(declare-fun c!65625 () Bool)

(declare-fun lt!261736 () (_ BitVec 64))

(assert (=> b!573196 (= c!65625 (= lt!261736 lt!261691))))

(declare-fun b!573197 () Bool)

(declare-fun e!329743 () SeekEntryResult!5670)

(assert (=> b!573197 (= e!329743 (MissingVacant!5670 (index!24909 lt!261689)))))

(declare-fun b!573198 () Bool)

(assert (=> b!573198 (= e!329742 (Found!5670 (index!24909 lt!261689)))))

(declare-fun d!84851 () Bool)

(declare-fun lt!261735 () SeekEntryResult!5670)

(assert (=> d!84851 (and (or ((_ is Undefined!5670) lt!261735) (not ((_ is Found!5670) lt!261735)) (and (bvsge (index!24908 lt!261735) #b00000000000000000000000000000000) (bvslt (index!24908 lt!261735) (size!17585 lt!261687)))) (or ((_ is Undefined!5670) lt!261735) ((_ is Found!5670) lt!261735) (not ((_ is MissingVacant!5670) lt!261735)) (not (= (index!24910 lt!261735) (index!24909 lt!261689))) (and (bvsge (index!24910 lt!261735) #b00000000000000000000000000000000) (bvslt (index!24910 lt!261735) (size!17585 lt!261687)))) (or ((_ is Undefined!5670) lt!261735) (ite ((_ is Found!5670) lt!261735) (= (select (arr!17221 lt!261687) (index!24908 lt!261735)) lt!261691) (and ((_ is MissingVacant!5670) lt!261735) (= (index!24910 lt!261735) (index!24909 lt!261689)) (= (select (arr!17221 lt!261687) (index!24910 lt!261735)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!84851 (= lt!261735 e!329744)))

(declare-fun c!65626 () Bool)

(assert (=> d!84851 (= c!65626 (bvsge (x!53771 lt!261689) #b01111111111111111111111111111110))))

(assert (=> d!84851 (= lt!261736 (select (arr!17221 lt!261687) (index!24909 lt!261689)))))

(assert (=> d!84851 (validMask!0 mask!3119)))

(assert (=> d!84851 (= (seekKeyOrZeroReturnVacant!0 (x!53771 lt!261689) (index!24909 lt!261689) (index!24909 lt!261689) lt!261691 lt!261687 mask!3119) lt!261735)))

(declare-fun b!573199 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!573199 (= e!329743 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53771 lt!261689) #b00000000000000000000000000000001) (nextIndex!0 (index!24909 lt!261689) (x!53771 lt!261689) mask!3119) (index!24909 lt!261689) lt!261691 lt!261687 mask!3119))))

(declare-fun b!573200 () Bool)

(assert (=> b!573200 (= e!329744 Undefined!5670)))

(declare-fun b!573201 () Bool)

(declare-fun c!65624 () Bool)

(assert (=> b!573201 (= c!65624 (= lt!261736 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!573201 (= e!329742 e!329743)))

(assert (= (and d!84851 c!65626) b!573200))

(assert (= (and d!84851 (not c!65626)) b!573196))

(assert (= (and b!573196 c!65625) b!573198))

(assert (= (and b!573196 (not c!65625)) b!573201))

(assert (= (and b!573201 c!65624) b!573197))

(assert (= (and b!573201 (not c!65624)) b!573199))

(declare-fun m!552257 () Bool)

(assert (=> d!84851 m!552257))

(declare-fun m!552259 () Bool)

(assert (=> d!84851 m!552259))

(declare-fun m!552261 () Bool)

(assert (=> d!84851 m!552261))

(assert (=> d!84851 m!552185))

(declare-fun m!552263 () Bool)

(assert (=> b!573199 m!552263))

(assert (=> b!573199 m!552263))

(declare-fun m!552265 () Bool)

(assert (=> b!573199 m!552265))

(assert (=> b!573101 d!84851))

(declare-fun d!84859 () Bool)

(assert (=> d!84859 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!573090 d!84859))

(declare-fun d!84861 () Bool)

(declare-fun res!362680 () Bool)

(declare-fun e!329772 () Bool)

(assert (=> d!84861 (=> res!362680 e!329772)))

(assert (=> d!84861 (= res!362680 (bvsge #b00000000000000000000000000000000 (size!17585 a!3118)))))

(assert (=> d!84861 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!329772)))

(declare-fun b!573242 () Bool)

(declare-fun e!329771 () Bool)

(declare-fun e!329770 () Bool)

(assert (=> b!573242 (= e!329771 e!329770)))

(declare-fun lt!261749 () (_ BitVec 64))

(assert (=> b!573242 (= lt!261749 (select (arr!17221 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!261751 () Unit!18042)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35865 (_ BitVec 64) (_ BitVec 32)) Unit!18042)

(assert (=> b!573242 (= lt!261751 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!261749 #b00000000000000000000000000000000))))

(assert (=> b!573242 (arrayContainsKey!0 a!3118 lt!261749 #b00000000000000000000000000000000)))

(declare-fun lt!261750 () Unit!18042)

(assert (=> b!573242 (= lt!261750 lt!261751)))

(declare-fun res!362681 () Bool)

(assert (=> b!573242 (= res!362681 (= (seekEntryOrOpen!0 (select (arr!17221 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5670 #b00000000000000000000000000000000)))))

(assert (=> b!573242 (=> (not res!362681) (not e!329770))))

(declare-fun b!573243 () Bool)

(declare-fun call!32633 () Bool)

(assert (=> b!573243 (= e!329771 call!32633)))

(declare-fun bm!32630 () Bool)

(assert (=> bm!32630 (= call!32633 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!573244 () Bool)

(assert (=> b!573244 (= e!329770 call!32633)))

(declare-fun b!573245 () Bool)

(assert (=> b!573245 (= e!329772 e!329771)))

(declare-fun c!65639 () Bool)

(assert (=> b!573245 (= c!65639 (validKeyInArray!0 (select (arr!17221 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!84861 (not res!362680)) b!573245))

(assert (= (and b!573245 c!65639) b!573242))

(assert (= (and b!573245 (not c!65639)) b!573243))

(assert (= (and b!573242 res!362681) b!573244))

(assert (= (or b!573244 b!573243) bm!32630))

(declare-fun m!552283 () Bool)

(assert (=> b!573242 m!552283))

(declare-fun m!552285 () Bool)

(assert (=> b!573242 m!552285))

(declare-fun m!552287 () Bool)

(assert (=> b!573242 m!552287))

(assert (=> b!573242 m!552283))

(declare-fun m!552291 () Bool)

(assert (=> b!573242 m!552291))

(declare-fun m!552295 () Bool)

(assert (=> bm!32630 m!552295))

(assert (=> b!573245 m!552283))

(assert (=> b!573245 m!552283))

(declare-fun m!552301 () Bool)

(assert (=> b!573245 m!552301))

(assert (=> b!573089 d!84861))

(declare-fun b!573309 () Bool)

(declare-fun e!329806 () Bool)

(declare-fun lt!261782 () SeekEntryResult!5670)

(assert (=> b!573309 (= e!329806 (bvsge (x!53771 lt!261782) #b01111111111111111111111111111110))))

(declare-fun b!573310 () Bool)

(assert (=> b!573310 (and (bvsge (index!24909 lt!261782) #b00000000000000000000000000000000) (bvslt (index!24909 lt!261782) (size!17585 lt!261687)))))

(declare-fun res!362693 () Bool)

(assert (=> b!573310 (= res!362693 (= (select (arr!17221 lt!261687) (index!24909 lt!261782)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!329807 () Bool)

(assert (=> b!573310 (=> res!362693 e!329807)))

(declare-fun b!573311 () Bool)

(declare-fun e!329809 () SeekEntryResult!5670)

(assert (=> b!573311 (= e!329809 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!261692 #b00000000000000000000000000000000 mask!3119) lt!261691 lt!261687 mask!3119))))

(declare-fun d!84869 () Bool)

(assert (=> d!84869 e!329806))

(declare-fun c!65668 () Bool)

(assert (=> d!84869 (= c!65668 (and ((_ is Intermediate!5670) lt!261782) (undefined!6482 lt!261782)))))

(declare-fun e!329810 () SeekEntryResult!5670)

(assert (=> d!84869 (= lt!261782 e!329810)))

(declare-fun c!65669 () Bool)

(assert (=> d!84869 (= c!65669 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!261781 () (_ BitVec 64))

(assert (=> d!84869 (= lt!261781 (select (arr!17221 lt!261687) lt!261692))))

(assert (=> d!84869 (validMask!0 mask!3119)))

(assert (=> d!84869 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261692 lt!261691 lt!261687 mask!3119) lt!261782)))

(declare-fun b!573312 () Bool)

(assert (=> b!573312 (= e!329810 e!329809)))

(declare-fun c!65667 () Bool)

(assert (=> b!573312 (= c!65667 (or (= lt!261781 lt!261691) (= (bvadd lt!261781 lt!261781) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!573313 () Bool)

(declare-fun e!329808 () Bool)

(assert (=> b!573313 (= e!329806 e!329808)))

(declare-fun res!362694 () Bool)

(assert (=> b!573313 (= res!362694 (and ((_ is Intermediate!5670) lt!261782) (not (undefined!6482 lt!261782)) (bvslt (x!53771 lt!261782) #b01111111111111111111111111111110) (bvsge (x!53771 lt!261782) #b00000000000000000000000000000000) (bvsge (x!53771 lt!261782) #b00000000000000000000000000000000)))))

(assert (=> b!573313 (=> (not res!362694) (not e!329808))))

(declare-fun b!573314 () Bool)

(assert (=> b!573314 (= e!329810 (Intermediate!5670 true lt!261692 #b00000000000000000000000000000000))))

(declare-fun b!573315 () Bool)

(assert (=> b!573315 (and (bvsge (index!24909 lt!261782) #b00000000000000000000000000000000) (bvslt (index!24909 lt!261782) (size!17585 lt!261687)))))

(assert (=> b!573315 (= e!329807 (= (select (arr!17221 lt!261687) (index!24909 lt!261782)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!573316 () Bool)

(assert (=> b!573316 (= e!329809 (Intermediate!5670 false lt!261692 #b00000000000000000000000000000000))))

(declare-fun b!573317 () Bool)

(assert (=> b!573317 (and (bvsge (index!24909 lt!261782) #b00000000000000000000000000000000) (bvslt (index!24909 lt!261782) (size!17585 lt!261687)))))

(declare-fun res!362692 () Bool)

(assert (=> b!573317 (= res!362692 (= (select (arr!17221 lt!261687) (index!24909 lt!261782)) lt!261691))))

(assert (=> b!573317 (=> res!362692 e!329807)))

(assert (=> b!573317 (= e!329808 e!329807)))

(assert (= (and d!84869 c!65669) b!573314))

(assert (= (and d!84869 (not c!65669)) b!573312))

(assert (= (and b!573312 c!65667) b!573316))

(assert (= (and b!573312 (not c!65667)) b!573311))

(assert (= (and d!84869 c!65668) b!573309))

(assert (= (and d!84869 (not c!65668)) b!573313))

(assert (= (and b!573313 res!362694) b!573317))

(assert (= (and b!573317 (not res!362692)) b!573310))

(assert (= (and b!573310 (not res!362693)) b!573315))

(declare-fun m!552323 () Bool)

(assert (=> b!573310 m!552323))

(assert (=> b!573317 m!552323))

(declare-fun m!552325 () Bool)

(assert (=> d!84869 m!552325))

(assert (=> d!84869 m!552185))

(declare-fun m!552327 () Bool)

(assert (=> b!573311 m!552327))

(assert (=> b!573311 m!552327))

(declare-fun m!552329 () Bool)

(assert (=> b!573311 m!552329))

(assert (=> b!573315 m!552323))

(assert (=> b!573098 d!84869))

(declare-fun b!573318 () Bool)

(declare-fun e!329811 () Bool)

(declare-fun lt!261784 () SeekEntryResult!5670)

(assert (=> b!573318 (= e!329811 (bvsge (x!53771 lt!261784) #b01111111111111111111111111111110))))

(declare-fun b!573319 () Bool)

(assert (=> b!573319 (and (bvsge (index!24909 lt!261784) #b00000000000000000000000000000000) (bvslt (index!24909 lt!261784) (size!17585 a!3118)))))

(declare-fun res!362696 () Bool)

(assert (=> b!573319 (= res!362696 (= (select (arr!17221 a!3118) (index!24909 lt!261784)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!329812 () Bool)

(assert (=> b!573319 (=> res!362696 e!329812)))

(declare-fun b!573320 () Bool)

(declare-fun e!329814 () SeekEntryResult!5670)

(assert (=> b!573320 (= e!329814 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!261686 #b00000000000000000000000000000000 mask!3119) (select (arr!17221 a!3118) j!142) a!3118 mask!3119))))

(declare-fun d!84884 () Bool)

(assert (=> d!84884 e!329811))

(declare-fun c!65671 () Bool)

(assert (=> d!84884 (= c!65671 (and ((_ is Intermediate!5670) lt!261784) (undefined!6482 lt!261784)))))

(declare-fun e!329815 () SeekEntryResult!5670)

(assert (=> d!84884 (= lt!261784 e!329815)))

(declare-fun c!65672 () Bool)

(assert (=> d!84884 (= c!65672 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!261783 () (_ BitVec 64))

(assert (=> d!84884 (= lt!261783 (select (arr!17221 a!3118) lt!261686))))

(assert (=> d!84884 (validMask!0 mask!3119)))

(assert (=> d!84884 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261686 (select (arr!17221 a!3118) j!142) a!3118 mask!3119) lt!261784)))

(declare-fun b!573321 () Bool)

(assert (=> b!573321 (= e!329815 e!329814)))

(declare-fun c!65670 () Bool)

(assert (=> b!573321 (= c!65670 (or (= lt!261783 (select (arr!17221 a!3118) j!142)) (= (bvadd lt!261783 lt!261783) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!573322 () Bool)

(declare-fun e!329813 () Bool)

(assert (=> b!573322 (= e!329811 e!329813)))

(declare-fun res!362697 () Bool)

(assert (=> b!573322 (= res!362697 (and ((_ is Intermediate!5670) lt!261784) (not (undefined!6482 lt!261784)) (bvslt (x!53771 lt!261784) #b01111111111111111111111111111110) (bvsge (x!53771 lt!261784) #b00000000000000000000000000000000) (bvsge (x!53771 lt!261784) #b00000000000000000000000000000000)))))

(assert (=> b!573322 (=> (not res!362697) (not e!329813))))

(declare-fun b!573323 () Bool)

(assert (=> b!573323 (= e!329815 (Intermediate!5670 true lt!261686 #b00000000000000000000000000000000))))

(declare-fun b!573324 () Bool)

(assert (=> b!573324 (and (bvsge (index!24909 lt!261784) #b00000000000000000000000000000000) (bvslt (index!24909 lt!261784) (size!17585 a!3118)))))

(assert (=> b!573324 (= e!329812 (= (select (arr!17221 a!3118) (index!24909 lt!261784)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!573325 () Bool)

(assert (=> b!573325 (= e!329814 (Intermediate!5670 false lt!261686 #b00000000000000000000000000000000))))

(declare-fun b!573326 () Bool)

(assert (=> b!573326 (and (bvsge (index!24909 lt!261784) #b00000000000000000000000000000000) (bvslt (index!24909 lt!261784) (size!17585 a!3118)))))

(declare-fun res!362695 () Bool)

(assert (=> b!573326 (= res!362695 (= (select (arr!17221 a!3118) (index!24909 lt!261784)) (select (arr!17221 a!3118) j!142)))))

(assert (=> b!573326 (=> res!362695 e!329812)))

(assert (=> b!573326 (= e!329813 e!329812)))

(assert (= (and d!84884 c!65672) b!573323))

(assert (= (and d!84884 (not c!65672)) b!573321))

(assert (= (and b!573321 c!65670) b!573325))

(assert (= (and b!573321 (not c!65670)) b!573320))

(assert (= (and d!84884 c!65671) b!573318))

(assert (= (and d!84884 (not c!65671)) b!573322))

(assert (= (and b!573322 res!362697) b!573326))

(assert (= (and b!573326 (not res!362695)) b!573319))

(assert (= (and b!573319 (not res!362696)) b!573324))

(declare-fun m!552331 () Bool)

(assert (=> b!573319 m!552331))

(assert (=> b!573326 m!552331))

(declare-fun m!552333 () Bool)

(assert (=> d!84884 m!552333))

(assert (=> d!84884 m!552185))

(declare-fun m!552335 () Bool)

(assert (=> b!573320 m!552335))

(assert (=> b!573320 m!552335))

(assert (=> b!573320 m!552155))

(declare-fun m!552337 () Bool)

(assert (=> b!573320 m!552337))

(assert (=> b!573324 m!552331))

(assert (=> b!573098 d!84884))

(declare-fun d!84887 () Bool)

(declare-fun lt!261796 () (_ BitVec 32))

(declare-fun lt!261795 () (_ BitVec 32))

(assert (=> d!84887 (= lt!261796 (bvmul (bvxor lt!261795 (bvlshr lt!261795 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84887 (= lt!261795 ((_ extract 31 0) (bvand (bvxor lt!261691 (bvlshr lt!261691 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84887 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!362698 (let ((h!12327 ((_ extract 31 0) (bvand (bvxor lt!261691 (bvlshr lt!261691 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53778 (bvmul (bvxor h!12327 (bvlshr h!12327 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53778 (bvlshr x!53778 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!362698 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!362698 #b00000000000000000000000000000000))))))

(assert (=> d!84887 (= (toIndex!0 lt!261691 mask!3119) (bvand (bvxor lt!261796 (bvlshr lt!261796 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!573098 d!84887))

(declare-fun d!84891 () Bool)

(declare-fun lt!261798 () (_ BitVec 32))

(declare-fun lt!261797 () (_ BitVec 32))

(assert (=> d!84891 (= lt!261798 (bvmul (bvxor lt!261797 (bvlshr lt!261797 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84891 (= lt!261797 ((_ extract 31 0) (bvand (bvxor (select (arr!17221 a!3118) j!142) (bvlshr (select (arr!17221 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84891 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!362698 (let ((h!12327 ((_ extract 31 0) (bvand (bvxor (select (arr!17221 a!3118) j!142) (bvlshr (select (arr!17221 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53778 (bvmul (bvxor h!12327 (bvlshr h!12327 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53778 (bvlshr x!53778 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!362698 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!362698 #b00000000000000000000000000000000))))))

(assert (=> d!84891 (= (toIndex!0 (select (arr!17221 a!3118) j!142) mask!3119) (bvand (bvxor lt!261798 (bvlshr lt!261798 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!573098 d!84891))

(declare-fun d!84893 () Bool)

(assert (=> d!84893 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!52468 d!84893))

(declare-fun d!84907 () Bool)

(assert (=> d!84907 (= (array_inv!13017 a!3118) (bvsge (size!17585 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!52468 d!84907))

(declare-fun d!84909 () Bool)

(assert (=> d!84909 (= (validKeyInArray!0 (select (arr!17221 a!3118) j!142)) (and (not (= (select (arr!17221 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17221 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!573099 d!84909))

(declare-fun b!573403 () Bool)

(declare-fun e!329864 () Bool)

(declare-fun e!329866 () Bool)

(assert (=> b!573403 (= e!329864 e!329866)))

(declare-fun res!362718 () Bool)

(assert (=> b!573403 (=> (not res!362718) (not e!329866))))

(declare-fun e!329865 () Bool)

(assert (=> b!573403 (= res!362718 (not e!329865))))

(declare-fun res!362717 () Bool)

(assert (=> b!573403 (=> (not res!362717) (not e!329865))))

(assert (=> b!573403 (= res!362717 (validKeyInArray!0 (select (arr!17221 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!84911 () Bool)

(declare-fun res!362719 () Bool)

(assert (=> d!84911 (=> res!362719 e!329864)))

(assert (=> d!84911 (= res!362719 (bvsge #b00000000000000000000000000000000 (size!17585 a!3118)))))

(assert (=> d!84911 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11298) e!329864)))

(declare-fun bm!32636 () Bool)

(declare-fun call!32639 () Bool)

(declare-fun c!65702 () Bool)

(assert (=> bm!32636 (= call!32639 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!65702 (Cons!11297 (select (arr!17221 a!3118) #b00000000000000000000000000000000) Nil!11298) Nil!11298)))))

(declare-fun b!573404 () Bool)

(declare-fun e!329863 () Bool)

(assert (=> b!573404 (= e!329863 call!32639)))

(declare-fun b!573405 () Bool)

(assert (=> b!573405 (= e!329863 call!32639)))

(declare-fun b!573406 () Bool)

(assert (=> b!573406 (= e!329866 e!329863)))

(assert (=> b!573406 (= c!65702 (validKeyInArray!0 (select (arr!17221 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!573407 () Bool)

(declare-fun contains!2885 (List!11301 (_ BitVec 64)) Bool)

(assert (=> b!573407 (= e!329865 (contains!2885 Nil!11298 (select (arr!17221 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!84911 (not res!362719)) b!573403))

(assert (= (and b!573403 res!362717) b!573407))

(assert (= (and b!573403 res!362718) b!573406))

(assert (= (and b!573406 c!65702) b!573405))

(assert (= (and b!573406 (not c!65702)) b!573404))

(assert (= (or b!573405 b!573404) bm!32636))

(assert (=> b!573403 m!552283))

(assert (=> b!573403 m!552283))

(assert (=> b!573403 m!552301))

(assert (=> bm!32636 m!552283))

(declare-fun m!552399 () Bool)

(assert (=> bm!32636 m!552399))

(assert (=> b!573406 m!552283))

(assert (=> b!573406 m!552283))

(assert (=> b!573406 m!552301))

(assert (=> b!573407 m!552283))

(assert (=> b!573407 m!552283))

(declare-fun m!552401 () Bool)

(assert (=> b!573407 m!552401))

(assert (=> b!573097 d!84911))

(declare-fun b!573414 () Bool)

(declare-fun e!329871 () SeekEntryResult!5670)

(declare-fun e!329872 () SeekEntryResult!5670)

(assert (=> b!573414 (= e!329871 e!329872)))

(declare-fun lt!261829 () (_ BitVec 64))

(declare-fun lt!261830 () SeekEntryResult!5670)

(assert (=> b!573414 (= lt!261829 (select (arr!17221 a!3118) (index!24909 lt!261830)))))

(declare-fun c!65708 () Bool)

(assert (=> b!573414 (= c!65708 (= lt!261829 k0!1914))))

(declare-fun b!573415 () Bool)

(declare-fun e!329870 () SeekEntryResult!5670)

(assert (=> b!573415 (= e!329870 (MissingZero!5670 (index!24909 lt!261830)))))

(declare-fun b!573416 () Bool)

(assert (=> b!573416 (= e!329870 (seekKeyOrZeroReturnVacant!0 (x!53771 lt!261830) (index!24909 lt!261830) (index!24909 lt!261830) k0!1914 a!3118 mask!3119))))

(declare-fun d!84919 () Bool)

(declare-fun lt!261828 () SeekEntryResult!5670)

(assert (=> d!84919 (and (or ((_ is Undefined!5670) lt!261828) (not ((_ is Found!5670) lt!261828)) (and (bvsge (index!24908 lt!261828) #b00000000000000000000000000000000) (bvslt (index!24908 lt!261828) (size!17585 a!3118)))) (or ((_ is Undefined!5670) lt!261828) ((_ is Found!5670) lt!261828) (not ((_ is MissingZero!5670) lt!261828)) (and (bvsge (index!24907 lt!261828) #b00000000000000000000000000000000) (bvslt (index!24907 lt!261828) (size!17585 a!3118)))) (or ((_ is Undefined!5670) lt!261828) ((_ is Found!5670) lt!261828) ((_ is MissingZero!5670) lt!261828) (not ((_ is MissingVacant!5670) lt!261828)) (and (bvsge (index!24910 lt!261828) #b00000000000000000000000000000000) (bvslt (index!24910 lt!261828) (size!17585 a!3118)))) (or ((_ is Undefined!5670) lt!261828) (ite ((_ is Found!5670) lt!261828) (= (select (arr!17221 a!3118) (index!24908 lt!261828)) k0!1914) (ite ((_ is MissingZero!5670) lt!261828) (= (select (arr!17221 a!3118) (index!24907 lt!261828)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5670) lt!261828) (= (select (arr!17221 a!3118) (index!24910 lt!261828)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84919 (= lt!261828 e!329871)))

(declare-fun c!65706 () Bool)

(assert (=> d!84919 (= c!65706 (and ((_ is Intermediate!5670) lt!261830) (undefined!6482 lt!261830)))))

(assert (=> d!84919 (= lt!261830 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!84919 (validMask!0 mask!3119)))

(assert (=> d!84919 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!261828)))

(declare-fun b!573417 () Bool)

(declare-fun c!65707 () Bool)

(assert (=> b!573417 (= c!65707 (= lt!261829 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!573417 (= e!329872 e!329870)))

(declare-fun b!573418 () Bool)

(assert (=> b!573418 (= e!329872 (Found!5670 (index!24909 lt!261830)))))

(declare-fun b!573419 () Bool)

(assert (=> b!573419 (= e!329871 Undefined!5670)))

(assert (= (and d!84919 c!65706) b!573419))

(assert (= (and d!84919 (not c!65706)) b!573414))

(assert (= (and b!573414 c!65708) b!573418))

(assert (= (and b!573414 (not c!65708)) b!573417))

(assert (= (and b!573417 c!65707) b!573415))

(assert (= (and b!573417 (not c!65707)) b!573416))

(declare-fun m!552417 () Bool)

(assert (=> b!573414 m!552417))

(declare-fun m!552419 () Bool)

(assert (=> b!573416 m!552419))

(declare-fun m!552421 () Bool)

(assert (=> d!84919 m!552421))

(declare-fun m!552423 () Bool)

(assert (=> d!84919 m!552423))

(declare-fun m!552425 () Bool)

(assert (=> d!84919 m!552425))

(assert (=> d!84919 m!552423))

(declare-fun m!552427 () Bool)

(assert (=> d!84919 m!552427))

(assert (=> d!84919 m!552185))

(declare-fun m!552429 () Bool)

(assert (=> d!84919 m!552429))

(assert (=> b!573096 d!84919))

(declare-fun b!573424 () Bool)

(declare-fun e!329877 () SeekEntryResult!5670)

(declare-fun e!329878 () SeekEntryResult!5670)

(assert (=> b!573424 (= e!329877 e!329878)))

(declare-fun lt!261835 () (_ BitVec 64))

(declare-fun lt!261836 () SeekEntryResult!5670)

(assert (=> b!573424 (= lt!261835 (select (arr!17221 a!3118) (index!24909 lt!261836)))))

(declare-fun c!65712 () Bool)

(assert (=> b!573424 (= c!65712 (= lt!261835 (select (arr!17221 a!3118) j!142)))))

(declare-fun b!573425 () Bool)

(declare-fun e!329876 () SeekEntryResult!5670)

(assert (=> b!573425 (= e!329876 (MissingZero!5670 (index!24909 lt!261836)))))

(declare-fun b!573426 () Bool)

(assert (=> b!573426 (= e!329876 (seekKeyOrZeroReturnVacant!0 (x!53771 lt!261836) (index!24909 lt!261836) (index!24909 lt!261836) (select (arr!17221 a!3118) j!142) a!3118 mask!3119))))

(declare-fun d!84925 () Bool)

(declare-fun lt!261834 () SeekEntryResult!5670)

(assert (=> d!84925 (and (or ((_ is Undefined!5670) lt!261834) (not ((_ is Found!5670) lt!261834)) (and (bvsge (index!24908 lt!261834) #b00000000000000000000000000000000) (bvslt (index!24908 lt!261834) (size!17585 a!3118)))) (or ((_ is Undefined!5670) lt!261834) ((_ is Found!5670) lt!261834) (not ((_ is MissingZero!5670) lt!261834)) (and (bvsge (index!24907 lt!261834) #b00000000000000000000000000000000) (bvslt (index!24907 lt!261834) (size!17585 a!3118)))) (or ((_ is Undefined!5670) lt!261834) ((_ is Found!5670) lt!261834) ((_ is MissingZero!5670) lt!261834) (not ((_ is MissingVacant!5670) lt!261834)) (and (bvsge (index!24910 lt!261834) #b00000000000000000000000000000000) (bvslt (index!24910 lt!261834) (size!17585 a!3118)))) (or ((_ is Undefined!5670) lt!261834) (ite ((_ is Found!5670) lt!261834) (= (select (arr!17221 a!3118) (index!24908 lt!261834)) (select (arr!17221 a!3118) j!142)) (ite ((_ is MissingZero!5670) lt!261834) (= (select (arr!17221 a!3118) (index!24907 lt!261834)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5670) lt!261834) (= (select (arr!17221 a!3118) (index!24910 lt!261834)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84925 (= lt!261834 e!329877)))

(declare-fun c!65710 () Bool)

(assert (=> d!84925 (= c!65710 (and ((_ is Intermediate!5670) lt!261836) (undefined!6482 lt!261836)))))

(assert (=> d!84925 (= lt!261836 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17221 a!3118) j!142) mask!3119) (select (arr!17221 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!84925 (validMask!0 mask!3119)))

(assert (=> d!84925 (= (seekEntryOrOpen!0 (select (arr!17221 a!3118) j!142) a!3118 mask!3119) lt!261834)))

(declare-fun b!573427 () Bool)

(declare-fun c!65711 () Bool)

(assert (=> b!573427 (= c!65711 (= lt!261835 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!573427 (= e!329878 e!329876)))

(declare-fun b!573428 () Bool)

(assert (=> b!573428 (= e!329878 (Found!5670 (index!24909 lt!261836)))))

(declare-fun b!573429 () Bool)

(assert (=> b!573429 (= e!329877 Undefined!5670)))

(assert (= (and d!84925 c!65710) b!573429))

(assert (= (and d!84925 (not c!65710)) b!573424))

(assert (= (and b!573424 c!65712) b!573428))

(assert (= (and b!573424 (not c!65712)) b!573427))

(assert (= (and b!573427 c!65711) b!573425))

(assert (= (and b!573427 (not c!65711)) b!573426))

(declare-fun m!552431 () Bool)

(assert (=> b!573424 m!552431))

(assert (=> b!573426 m!552155))

(declare-fun m!552433 () Bool)

(assert (=> b!573426 m!552433))

(declare-fun m!552435 () Bool)

(assert (=> d!84925 m!552435))

(assert (=> d!84925 m!552155))

(assert (=> d!84925 m!552171))

(declare-fun m!552437 () Bool)

(assert (=> d!84925 m!552437))

(assert (=> d!84925 m!552171))

(assert (=> d!84925 m!552155))

(declare-fun m!552439 () Bool)

(assert (=> d!84925 m!552439))

(assert (=> d!84925 m!552185))

(declare-fun m!552441 () Bool)

(assert (=> d!84925 m!552441))

(assert (=> b!573095 d!84925))

(declare-fun d!84927 () Bool)

(declare-fun res!362726 () Bool)

(declare-fun e!329887 () Bool)

(assert (=> d!84927 (=> res!362726 e!329887)))

(assert (=> d!84927 (= res!362726 (bvsge j!142 (size!17585 a!3118)))))

(assert (=> d!84927 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!329887)))

(declare-fun b!573438 () Bool)

(declare-fun e!329886 () Bool)

(declare-fun e!329885 () Bool)

(assert (=> b!573438 (= e!329886 e!329885)))

(declare-fun lt!261843 () (_ BitVec 64))

(assert (=> b!573438 (= lt!261843 (select (arr!17221 a!3118) j!142))))

(declare-fun lt!261845 () Unit!18042)

(assert (=> b!573438 (= lt!261845 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!261843 j!142))))

(assert (=> b!573438 (arrayContainsKey!0 a!3118 lt!261843 #b00000000000000000000000000000000)))

(declare-fun lt!261844 () Unit!18042)

(assert (=> b!573438 (= lt!261844 lt!261845)))

(declare-fun res!362727 () Bool)

(assert (=> b!573438 (= res!362727 (= (seekEntryOrOpen!0 (select (arr!17221 a!3118) j!142) a!3118 mask!3119) (Found!5670 j!142)))))

(assert (=> b!573438 (=> (not res!362727) (not e!329885))))

(declare-fun b!573439 () Bool)

(declare-fun call!32643 () Bool)

(assert (=> b!573439 (= e!329886 call!32643)))

(declare-fun bm!32638 () Bool)

(assert (=> bm!32638 (= call!32643 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!573440 () Bool)

(assert (=> b!573440 (= e!329885 call!32643)))

(declare-fun b!573441 () Bool)

(assert (=> b!573441 (= e!329887 e!329886)))

(declare-fun c!65715 () Bool)

(assert (=> b!573441 (= c!65715 (validKeyInArray!0 (select (arr!17221 a!3118) j!142)))))

(assert (= (and d!84927 (not res!362726)) b!573441))

(assert (= (and b!573441 c!65715) b!573438))

(assert (= (and b!573441 (not c!65715)) b!573439))

(assert (= (and b!573438 res!362727) b!573440))

(assert (= (or b!573440 b!573439) bm!32638))

(assert (=> b!573438 m!552155))

(declare-fun m!552443 () Bool)

(assert (=> b!573438 m!552443))

(declare-fun m!552445 () Bool)

(assert (=> b!573438 m!552445))

(assert (=> b!573438 m!552155))

(assert (=> b!573438 m!552163))

(declare-fun m!552447 () Bool)

(assert (=> bm!32638 m!552447))

(assert (=> b!573441 m!552155))

(assert (=> b!573441 m!552155))

(assert (=> b!573441 m!552189))

(assert (=> b!573095 d!84927))

(declare-fun d!84929 () Bool)

(assert (=> d!84929 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!261851 () Unit!18042)

(declare-fun choose!38 (array!35865 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18042)

(assert (=> d!84929 (= lt!261851 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!84929 (validMask!0 mask!3119)))

(assert (=> d!84929 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!261851)))

(declare-fun bs!17756 () Bool)

(assert (= bs!17756 d!84929))

(assert (=> bs!17756 m!552157))

(declare-fun m!552457 () Bool)

(assert (=> bs!17756 m!552457))

(assert (=> bs!17756 m!552185))

(assert (=> b!573095 d!84929))

(declare-fun d!84933 () Bool)

(declare-fun res!362740 () Bool)

(declare-fun e!329901 () Bool)

(assert (=> d!84933 (=> res!362740 e!329901)))

(assert (=> d!84933 (= res!362740 (= (select (arr!17221 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!84933 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!329901)))

(declare-fun b!573456 () Bool)

(declare-fun e!329902 () Bool)

(assert (=> b!573456 (= e!329901 e!329902)))

(declare-fun res!362741 () Bool)

(assert (=> b!573456 (=> (not res!362741) (not e!329902))))

(assert (=> b!573456 (= res!362741 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17585 a!3118)))))

(declare-fun b!573457 () Bool)

(assert (=> b!573457 (= e!329902 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!84933 (not res!362740)) b!573456))

(assert (= (and b!573456 res!362741) b!573457))

(assert (=> d!84933 m!552283))

(declare-fun m!552461 () Bool)

(assert (=> b!573457 m!552461))

(assert (=> b!573093 d!84933))

(declare-fun b!573458 () Bool)

(declare-fun e!329905 () SeekEntryResult!5670)

(declare-fun e!329903 () SeekEntryResult!5670)

(assert (=> b!573458 (= e!329905 e!329903)))

(declare-fun lt!261853 () (_ BitVec 64))

(declare-fun c!65718 () Bool)

(assert (=> b!573458 (= c!65718 (= lt!261853 (select (arr!17221 a!3118) j!142)))))

(declare-fun b!573459 () Bool)

(declare-fun e!329904 () SeekEntryResult!5670)

(assert (=> b!573459 (= e!329904 (MissingVacant!5670 (index!24909 lt!261689)))))

(declare-fun b!573460 () Bool)

(assert (=> b!573460 (= e!329903 (Found!5670 (index!24909 lt!261689)))))

(declare-fun lt!261852 () SeekEntryResult!5670)

(declare-fun d!84937 () Bool)

(assert (=> d!84937 (and (or ((_ is Undefined!5670) lt!261852) (not ((_ is Found!5670) lt!261852)) (and (bvsge (index!24908 lt!261852) #b00000000000000000000000000000000) (bvslt (index!24908 lt!261852) (size!17585 a!3118)))) (or ((_ is Undefined!5670) lt!261852) ((_ is Found!5670) lt!261852) (not ((_ is MissingVacant!5670) lt!261852)) (not (= (index!24910 lt!261852) (index!24909 lt!261689))) (and (bvsge (index!24910 lt!261852) #b00000000000000000000000000000000) (bvslt (index!24910 lt!261852) (size!17585 a!3118)))) (or ((_ is Undefined!5670) lt!261852) (ite ((_ is Found!5670) lt!261852) (= (select (arr!17221 a!3118) (index!24908 lt!261852)) (select (arr!17221 a!3118) j!142)) (and ((_ is MissingVacant!5670) lt!261852) (= (index!24910 lt!261852) (index!24909 lt!261689)) (= (select (arr!17221 a!3118) (index!24910 lt!261852)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!84937 (= lt!261852 e!329905)))

(declare-fun c!65719 () Bool)

(assert (=> d!84937 (= c!65719 (bvsge (x!53771 lt!261689) #b01111111111111111111111111111110))))

(assert (=> d!84937 (= lt!261853 (select (arr!17221 a!3118) (index!24909 lt!261689)))))

(assert (=> d!84937 (validMask!0 mask!3119)))

(assert (=> d!84937 (= (seekKeyOrZeroReturnVacant!0 (x!53771 lt!261689) (index!24909 lt!261689) (index!24909 lt!261689) (select (arr!17221 a!3118) j!142) a!3118 mask!3119) lt!261852)))

(declare-fun b!573461 () Bool)

(assert (=> b!573461 (= e!329904 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53771 lt!261689) #b00000000000000000000000000000001) (nextIndex!0 (index!24909 lt!261689) (x!53771 lt!261689) mask!3119) (index!24909 lt!261689) (select (arr!17221 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!573462 () Bool)

(assert (=> b!573462 (= e!329905 Undefined!5670)))

(declare-fun b!573463 () Bool)

(declare-fun c!65717 () Bool)

(assert (=> b!573463 (= c!65717 (= lt!261853 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!573463 (= e!329903 e!329904)))

(assert (= (and d!84937 c!65719) b!573462))

(assert (= (and d!84937 (not c!65719)) b!573458))

(assert (= (and b!573458 c!65718) b!573460))

(assert (= (and b!573458 (not c!65718)) b!573463))

(assert (= (and b!573463 c!65717) b!573459))

(assert (= (and b!573463 (not c!65717)) b!573461))

(declare-fun m!552463 () Bool)

(assert (=> d!84937 m!552463))

(declare-fun m!552465 () Bool)

(assert (=> d!84937 m!552465))

(assert (=> d!84937 m!552161))

(assert (=> d!84937 m!552185))

(assert (=> b!573461 m!552263))

(assert (=> b!573461 m!552263))

(assert (=> b!573461 m!552155))

(declare-fun m!552467 () Bool)

(assert (=> b!573461 m!552467))

(assert (=> b!573092 d!84937))

(check-sat (not b!573199) (not b!573245) (not b!573426) (not b!573320) (not b!573242) (not bm!32636) (not d!84937) (not b!573406) (not b!573155) (not bm!32630) (not d!84919) (not b!573438) (not d!84869) (not b!573461) (not d!84851) (not d!84925) (not b!573403) (not b!573416) (not b!573441) (not d!84849) (not d!84929) (not b!573311) (not bm!32638) (not b!573407) (not b!573457) (not d!84884))
(check-sat)

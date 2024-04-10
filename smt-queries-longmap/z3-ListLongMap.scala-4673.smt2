; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65028 () Bool)

(assert start!65028)

(declare-fun b!734105 () Bool)

(declare-fun e!410755 () Bool)

(declare-fun e!410754 () Bool)

(assert (=> b!734105 (= e!410755 e!410754)))

(declare-fun res!493286 () Bool)

(assert (=> b!734105 (=> res!493286 e!410754)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!734105 (= res!493286 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!325361 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!734105 (= lt!325361 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!734106 () Bool)

(declare-fun res!493275 () Bool)

(declare-fun e!410758 () Bool)

(assert (=> b!734106 (=> (not res!493275) (not e!410758))))

(declare-fun e!410760 () Bool)

(assert (=> b!734106 (= res!493275 e!410760)))

(declare-fun c!80794 () Bool)

(assert (=> b!734106 (= c!80794 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!734107 () Bool)

(declare-fun res!493283 () Bool)

(declare-fun e!410753 () Bool)

(assert (=> b!734107 (=> (not res!493283) (not e!410753))))

(declare-datatypes ((array!41270 0))(
  ( (array!41271 (arr!19750 (Array (_ BitVec 32) (_ BitVec 64))) (size!20171 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41270)

(declare-datatypes ((List!13752 0))(
  ( (Nil!13749) (Cons!13748 (h!14817 (_ BitVec 64)) (t!20067 List!13752)) )
))
(declare-fun arrayNoDuplicates!0 (array!41270 (_ BitVec 32) List!13752) Bool)

(assert (=> b!734107 (= res!493283 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13749))))

(declare-fun b!734108 () Bool)

(assert (=> b!734108 (= e!410754 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt lt!325361 #b00000000000000000000000000000000) (bvsge lt!325361 (bvadd #b00000000000000000000000000000001 mask!3328)) (and (bvsle (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000))))))

(declare-fun b!734109 () Bool)

(assert (=> b!734109 (= e!410753 e!410758)))

(declare-fun res!493290 () Bool)

(assert (=> b!734109 (=> (not res!493290) (not e!410758))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7350 0))(
  ( (MissingZero!7350 (index!31768 (_ BitVec 32))) (Found!7350 (index!31769 (_ BitVec 32))) (Intermediate!7350 (undefined!8162 Bool) (index!31770 (_ BitVec 32)) (x!62768 (_ BitVec 32))) (Undefined!7350) (MissingVacant!7350 (index!31771 (_ BitVec 32))) )
))
(declare-fun lt!325360 () SeekEntryResult!7350)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41270 (_ BitVec 32)) SeekEntryResult!7350)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!734109 (= res!493290 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19750 a!3186) j!159) mask!3328) (select (arr!19750 a!3186) j!159) a!3186 mask!3328) lt!325360))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!734109 (= lt!325360 (Intermediate!7350 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!734110 () Bool)

(declare-fun res!493282 () Bool)

(declare-fun e!410756 () Bool)

(assert (=> b!734110 (=> (not res!493282) (not e!410756))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!734110 (= res!493282 (validKeyInArray!0 (select (arr!19750 a!3186) j!159)))))

(declare-fun b!734111 () Bool)

(declare-fun res!493279 () Bool)

(assert (=> b!734111 (=> (not res!493279) (not e!410756))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!734111 (= res!493279 (validKeyInArray!0 k0!2102))))

(declare-fun b!734113 () Bool)

(declare-fun res!493292 () Bool)

(assert (=> b!734113 (=> (not res!493292) (not e!410756))))

(declare-fun arrayContainsKey!0 (array!41270 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!734113 (= res!493292 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!734114 () Bool)

(declare-fun res!493287 () Bool)

(assert (=> b!734114 (=> res!493287 e!410754)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41270 (_ BitVec 32)) SeekEntryResult!7350)

(assert (=> b!734114 (= res!493287 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19750 a!3186) j!159) a!3186 mask!3328) (Found!7350 j!159)))))

(declare-fun b!734115 () Bool)

(assert (=> b!734115 (= e!410760 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19750 a!3186) j!159) a!3186 mask!3328) (Found!7350 j!159)))))

(declare-fun b!734116 () Bool)

(assert (=> b!734116 (= e!410756 e!410753)))

(declare-fun res!493289 () Bool)

(assert (=> b!734116 (=> (not res!493289) (not e!410753))))

(declare-fun lt!325364 () SeekEntryResult!7350)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!734116 (= res!493289 (or (= lt!325364 (MissingZero!7350 i!1173)) (= lt!325364 (MissingVacant!7350 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41270 (_ BitVec 32)) SeekEntryResult!7350)

(assert (=> b!734116 (= lt!325364 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!734117 () Bool)

(declare-fun res!493281 () Bool)

(assert (=> b!734117 (=> (not res!493281) (not e!410753))))

(assert (=> b!734117 (= res!493281 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20171 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20171 a!3186))))))

(declare-fun b!734118 () Bool)

(declare-fun e!410762 () Bool)

(assert (=> b!734118 (= e!410758 e!410762)))

(declare-fun res!493284 () Bool)

(assert (=> b!734118 (=> (not res!493284) (not e!410762))))

(declare-fun lt!325366 () SeekEntryResult!7350)

(declare-fun lt!325365 () SeekEntryResult!7350)

(assert (=> b!734118 (= res!493284 (= lt!325366 lt!325365))))

(declare-fun lt!325363 () array!41270)

(declare-fun lt!325362 () (_ BitVec 64))

(assert (=> b!734118 (= lt!325365 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!325362 lt!325363 mask!3328))))

(assert (=> b!734118 (= lt!325366 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!325362 mask!3328) lt!325362 lt!325363 mask!3328))))

(assert (=> b!734118 (= lt!325362 (select (store (arr!19750 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!734118 (= lt!325363 (array!41271 (store (arr!19750 a!3186) i!1173 k0!2102) (size!20171 a!3186)))))

(declare-fun b!734119 () Bool)

(assert (=> b!734119 (= e!410760 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19750 a!3186) j!159) a!3186 mask!3328) lt!325360))))

(declare-fun b!734120 () Bool)

(declare-fun e!410757 () Bool)

(declare-fun e!410759 () Bool)

(assert (=> b!734120 (= e!410757 e!410759)))

(declare-fun res!493278 () Bool)

(assert (=> b!734120 (=> (not res!493278) (not e!410759))))

(declare-fun lt!325359 () SeekEntryResult!7350)

(assert (=> b!734120 (= res!493278 (= (seekEntryOrOpen!0 (select (arr!19750 a!3186) j!159) a!3186 mask!3328) lt!325359))))

(assert (=> b!734120 (= lt!325359 (Found!7350 j!159))))

(declare-fun b!734121 () Bool)

(declare-fun res!493288 () Bool)

(assert (=> b!734121 (=> (not res!493288) (not e!410753))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41270 (_ BitVec 32)) Bool)

(assert (=> b!734121 (= res!493288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!734122 () Bool)

(declare-fun res!493291 () Bool)

(assert (=> b!734122 (=> (not res!493291) (not e!410758))))

(assert (=> b!734122 (= res!493291 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19750 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!734123 () Bool)

(assert (=> b!734123 (= e!410759 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19750 a!3186) j!159) a!3186 mask!3328) lt!325359))))

(declare-fun b!734124 () Bool)

(declare-fun res!493276 () Bool)

(assert (=> b!734124 (=> (not res!493276) (not e!410756))))

(assert (=> b!734124 (= res!493276 (and (= (size!20171 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20171 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20171 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!493280 () Bool)

(assert (=> start!65028 (=> (not res!493280) (not e!410756))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65028 (= res!493280 (validMask!0 mask!3328))))

(assert (=> start!65028 e!410756))

(assert (=> start!65028 true))

(declare-fun array_inv!15546 (array!41270) Bool)

(assert (=> start!65028 (array_inv!15546 a!3186)))

(declare-fun b!734112 () Bool)

(assert (=> b!734112 (= e!410762 (not e!410755))))

(declare-fun res!493277 () Bool)

(assert (=> b!734112 (=> res!493277 e!410755)))

(get-info :version)

(assert (=> b!734112 (= res!493277 (or (not ((_ is Intermediate!7350) lt!325365)) (bvsge x!1131 (x!62768 lt!325365))))))

(assert (=> b!734112 e!410757))

(declare-fun res!493285 () Bool)

(assert (=> b!734112 (=> (not res!493285) (not e!410757))))

(assert (=> b!734112 (= res!493285 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25018 0))(
  ( (Unit!25019) )
))
(declare-fun lt!325367 () Unit!25018)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41270 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25018)

(assert (=> b!734112 (= lt!325367 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!65028 res!493280) b!734124))

(assert (= (and b!734124 res!493276) b!734110))

(assert (= (and b!734110 res!493282) b!734111))

(assert (= (and b!734111 res!493279) b!734113))

(assert (= (and b!734113 res!493292) b!734116))

(assert (= (and b!734116 res!493289) b!734121))

(assert (= (and b!734121 res!493288) b!734107))

(assert (= (and b!734107 res!493283) b!734117))

(assert (= (and b!734117 res!493281) b!734109))

(assert (= (and b!734109 res!493290) b!734122))

(assert (= (and b!734122 res!493291) b!734106))

(assert (= (and b!734106 c!80794) b!734119))

(assert (= (and b!734106 (not c!80794)) b!734115))

(assert (= (and b!734106 res!493275) b!734118))

(assert (= (and b!734118 res!493284) b!734112))

(assert (= (and b!734112 res!493285) b!734120))

(assert (= (and b!734120 res!493278) b!734123))

(assert (= (and b!734112 (not res!493277)) b!734105))

(assert (= (and b!734105 (not res!493286)) b!734114))

(assert (= (and b!734114 (not res!493287)) b!734108))

(declare-fun m!686809 () Bool)

(assert (=> b!734118 m!686809))

(declare-fun m!686811 () Bool)

(assert (=> b!734118 m!686811))

(declare-fun m!686813 () Bool)

(assert (=> b!734118 m!686813))

(assert (=> b!734118 m!686809))

(declare-fun m!686815 () Bool)

(assert (=> b!734118 m!686815))

(declare-fun m!686817 () Bool)

(assert (=> b!734118 m!686817))

(declare-fun m!686819 () Bool)

(assert (=> b!734110 m!686819))

(assert (=> b!734110 m!686819))

(declare-fun m!686821 () Bool)

(assert (=> b!734110 m!686821))

(assert (=> b!734123 m!686819))

(assert (=> b!734123 m!686819))

(declare-fun m!686823 () Bool)

(assert (=> b!734123 m!686823))

(assert (=> b!734109 m!686819))

(assert (=> b!734109 m!686819))

(declare-fun m!686825 () Bool)

(assert (=> b!734109 m!686825))

(assert (=> b!734109 m!686825))

(assert (=> b!734109 m!686819))

(declare-fun m!686827 () Bool)

(assert (=> b!734109 m!686827))

(assert (=> b!734120 m!686819))

(assert (=> b!734120 m!686819))

(declare-fun m!686829 () Bool)

(assert (=> b!734120 m!686829))

(assert (=> b!734119 m!686819))

(assert (=> b!734119 m!686819))

(declare-fun m!686831 () Bool)

(assert (=> b!734119 m!686831))

(declare-fun m!686833 () Bool)

(assert (=> b!734111 m!686833))

(declare-fun m!686835 () Bool)

(assert (=> b!734122 m!686835))

(declare-fun m!686837 () Bool)

(assert (=> b!734113 m!686837))

(declare-fun m!686839 () Bool)

(assert (=> b!734107 m!686839))

(assert (=> b!734115 m!686819))

(assert (=> b!734115 m!686819))

(declare-fun m!686841 () Bool)

(assert (=> b!734115 m!686841))

(declare-fun m!686843 () Bool)

(assert (=> start!65028 m!686843))

(declare-fun m!686845 () Bool)

(assert (=> start!65028 m!686845))

(declare-fun m!686847 () Bool)

(assert (=> b!734116 m!686847))

(assert (=> b!734114 m!686819))

(assert (=> b!734114 m!686819))

(assert (=> b!734114 m!686841))

(declare-fun m!686849 () Bool)

(assert (=> b!734112 m!686849))

(declare-fun m!686851 () Bool)

(assert (=> b!734112 m!686851))

(declare-fun m!686853 () Bool)

(assert (=> b!734121 m!686853))

(declare-fun m!686855 () Bool)

(assert (=> b!734105 m!686855))

(check-sat (not b!734109) (not b!734115) (not b!734111) (not b!734110) (not b!734114) (not b!734112) (not start!65028) (not b!734105) (not b!734118) (not b!734107) (not b!734121) (not b!734116) (not b!734120) (not b!734123) (not b!734119) (not b!734113))
(check-sat)
(get-model)

(declare-fun b!734197 () Bool)

(declare-fun c!80805 () Bool)

(declare-fun lt!325399 () (_ BitVec 64))

(assert (=> b!734197 (= c!80805 (= lt!325399 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!410799 () SeekEntryResult!7350)

(declare-fun e!410801 () SeekEntryResult!7350)

(assert (=> b!734197 (= e!410799 e!410801)))

(declare-fun b!734198 () Bool)

(assert (=> b!734198 (= e!410799 (Found!7350 resIntermediateIndex!5))))

(declare-fun b!734199 () Bool)

(declare-fun e!410800 () SeekEntryResult!7350)

(assert (=> b!734199 (= e!410800 Undefined!7350)))

(declare-fun b!734200 () Bool)

(assert (=> b!734200 (= e!410800 e!410799)))

(declare-fun c!80806 () Bool)

(assert (=> b!734200 (= c!80806 (= lt!325399 (select (arr!19750 a!3186) j!159)))))

(declare-fun b!734201 () Bool)

(assert (=> b!734201 (= e!410801 (MissingVacant!7350 resIntermediateIndex!5))))

(declare-fun b!734202 () Bool)

(assert (=> b!734202 (= e!410801 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!19750 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!325400 () SeekEntryResult!7350)

(declare-fun d!99989 () Bool)

(assert (=> d!99989 (and (or ((_ is Undefined!7350) lt!325400) (not ((_ is Found!7350) lt!325400)) (and (bvsge (index!31769 lt!325400) #b00000000000000000000000000000000) (bvslt (index!31769 lt!325400) (size!20171 a!3186)))) (or ((_ is Undefined!7350) lt!325400) ((_ is Found!7350) lt!325400) (not ((_ is MissingVacant!7350) lt!325400)) (not (= (index!31771 lt!325400) resIntermediateIndex!5)) (and (bvsge (index!31771 lt!325400) #b00000000000000000000000000000000) (bvslt (index!31771 lt!325400) (size!20171 a!3186)))) (or ((_ is Undefined!7350) lt!325400) (ite ((_ is Found!7350) lt!325400) (= (select (arr!19750 a!3186) (index!31769 lt!325400)) (select (arr!19750 a!3186) j!159)) (and ((_ is MissingVacant!7350) lt!325400) (= (index!31771 lt!325400) resIntermediateIndex!5) (= (select (arr!19750 a!3186) (index!31771 lt!325400)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!99989 (= lt!325400 e!410800)))

(declare-fun c!80804 () Bool)

(assert (=> d!99989 (= c!80804 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!99989 (= lt!325399 (select (arr!19750 a!3186) resIntermediateIndex!5))))

(assert (=> d!99989 (validMask!0 mask!3328)))

(assert (=> d!99989 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19750 a!3186) j!159) a!3186 mask!3328) lt!325400)))

(assert (= (and d!99989 c!80804) b!734199))

(assert (= (and d!99989 (not c!80804)) b!734200))

(assert (= (and b!734200 c!80806) b!734198))

(assert (= (and b!734200 (not c!80806)) b!734197))

(assert (= (and b!734197 c!80805) b!734201))

(assert (= (and b!734197 (not c!80805)) b!734202))

(declare-fun m!686905 () Bool)

(assert (=> b!734202 m!686905))

(assert (=> b!734202 m!686905))

(assert (=> b!734202 m!686819))

(declare-fun m!686907 () Bool)

(assert (=> b!734202 m!686907))

(declare-fun m!686909 () Bool)

(assert (=> d!99989 m!686909))

(declare-fun m!686911 () Bool)

(assert (=> d!99989 m!686911))

(assert (=> d!99989 m!686835))

(assert (=> d!99989 m!686843))

(assert (=> b!734123 d!99989))

(declare-fun b!734211 () Bool)

(declare-fun e!410810 () Bool)

(declare-fun call!34893 () Bool)

(assert (=> b!734211 (= e!410810 call!34893)))

(declare-fun b!734212 () Bool)

(declare-fun e!410808 () Bool)

(assert (=> b!734212 (= e!410810 e!410808)))

(declare-fun lt!325407 () (_ BitVec 64))

(assert (=> b!734212 (= lt!325407 (select (arr!19750 a!3186) j!159))))

(declare-fun lt!325408 () Unit!25018)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!41270 (_ BitVec 64) (_ BitVec 32)) Unit!25018)

(assert (=> b!734212 (= lt!325408 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!325407 j!159))))

(assert (=> b!734212 (arrayContainsKey!0 a!3186 lt!325407 #b00000000000000000000000000000000)))

(declare-fun lt!325409 () Unit!25018)

(assert (=> b!734212 (= lt!325409 lt!325408)))

(declare-fun res!493351 () Bool)

(assert (=> b!734212 (= res!493351 (= (seekEntryOrOpen!0 (select (arr!19750 a!3186) j!159) a!3186 mask!3328) (Found!7350 j!159)))))

(assert (=> b!734212 (=> (not res!493351) (not e!410808))))

(declare-fun b!734213 () Bool)

(assert (=> b!734213 (= e!410808 call!34893)))

(declare-fun b!734214 () Bool)

(declare-fun e!410809 () Bool)

(assert (=> b!734214 (= e!410809 e!410810)))

(declare-fun c!80809 () Bool)

(assert (=> b!734214 (= c!80809 (validKeyInArray!0 (select (arr!19750 a!3186) j!159)))))

(declare-fun d!99991 () Bool)

(declare-fun res!493352 () Bool)

(assert (=> d!99991 (=> res!493352 e!410809)))

(assert (=> d!99991 (= res!493352 (bvsge j!159 (size!20171 a!3186)))))

(assert (=> d!99991 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!410809)))

(declare-fun bm!34890 () Bool)

(assert (=> bm!34890 (= call!34893 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(assert (= (and d!99991 (not res!493352)) b!734214))

(assert (= (and b!734214 c!80809) b!734212))

(assert (= (and b!734214 (not c!80809)) b!734211))

(assert (= (and b!734212 res!493351) b!734213))

(assert (= (or b!734213 b!734211) bm!34890))

(assert (=> b!734212 m!686819))

(declare-fun m!686913 () Bool)

(assert (=> b!734212 m!686913))

(declare-fun m!686915 () Bool)

(assert (=> b!734212 m!686915))

(assert (=> b!734212 m!686819))

(assert (=> b!734212 m!686829))

(assert (=> b!734214 m!686819))

(assert (=> b!734214 m!686819))

(assert (=> b!734214 m!686821))

(declare-fun m!686917 () Bool)

(assert (=> bm!34890 m!686917))

(assert (=> b!734112 d!99991))

(declare-fun d!99993 () Bool)

(assert (=> d!99993 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!325412 () Unit!25018)

(declare-fun choose!38 (array!41270 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25018)

(assert (=> d!99993 (= lt!325412 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!99993 (validMask!0 mask!3328)))

(assert (=> d!99993 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!325412)))

(declare-fun bs!20980 () Bool)

(assert (= bs!20980 d!99993))

(assert (=> bs!20980 m!686849))

(declare-fun m!686919 () Bool)

(assert (=> bs!20980 m!686919))

(assert (=> bs!20980 m!686843))

(assert (=> b!734112 d!99993))

(declare-fun b!734215 () Bool)

(declare-fun e!410813 () Bool)

(declare-fun call!34894 () Bool)

(assert (=> b!734215 (= e!410813 call!34894)))

(declare-fun b!734216 () Bool)

(declare-fun e!410811 () Bool)

(assert (=> b!734216 (= e!410813 e!410811)))

(declare-fun lt!325413 () (_ BitVec 64))

(assert (=> b!734216 (= lt!325413 (select (arr!19750 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!325414 () Unit!25018)

(assert (=> b!734216 (= lt!325414 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!325413 #b00000000000000000000000000000000))))

(assert (=> b!734216 (arrayContainsKey!0 a!3186 lt!325413 #b00000000000000000000000000000000)))

(declare-fun lt!325415 () Unit!25018)

(assert (=> b!734216 (= lt!325415 lt!325414)))

(declare-fun res!493353 () Bool)

(assert (=> b!734216 (= res!493353 (= (seekEntryOrOpen!0 (select (arr!19750 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7350 #b00000000000000000000000000000000)))))

(assert (=> b!734216 (=> (not res!493353) (not e!410811))))

(declare-fun b!734217 () Bool)

(assert (=> b!734217 (= e!410811 call!34894)))

(declare-fun b!734218 () Bool)

(declare-fun e!410812 () Bool)

(assert (=> b!734218 (= e!410812 e!410813)))

(declare-fun c!80810 () Bool)

(assert (=> b!734218 (= c!80810 (validKeyInArray!0 (select (arr!19750 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!99995 () Bool)

(declare-fun res!493354 () Bool)

(assert (=> d!99995 (=> res!493354 e!410812)))

(assert (=> d!99995 (= res!493354 (bvsge #b00000000000000000000000000000000 (size!20171 a!3186)))))

(assert (=> d!99995 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!410812)))

(declare-fun bm!34891 () Bool)

(assert (=> bm!34891 (= call!34894 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(assert (= (and d!99995 (not res!493354)) b!734218))

(assert (= (and b!734218 c!80810) b!734216))

(assert (= (and b!734218 (not c!80810)) b!734215))

(assert (= (and b!734216 res!493353) b!734217))

(assert (= (or b!734217 b!734215) bm!34891))

(declare-fun m!686921 () Bool)

(assert (=> b!734216 m!686921))

(declare-fun m!686923 () Bool)

(assert (=> b!734216 m!686923))

(declare-fun m!686925 () Bool)

(assert (=> b!734216 m!686925))

(assert (=> b!734216 m!686921))

(declare-fun m!686927 () Bool)

(assert (=> b!734216 m!686927))

(assert (=> b!734218 m!686921))

(assert (=> b!734218 m!686921))

(declare-fun m!686929 () Bool)

(assert (=> b!734218 m!686929))

(declare-fun m!686931 () Bool)

(assert (=> bm!34891 m!686931))

(assert (=> b!734121 d!99995))

(declare-fun d!99997 () Bool)

(assert (=> d!99997 (= (validKeyInArray!0 (select (arr!19750 a!3186) j!159)) (and (not (= (select (arr!19750 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19750 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!734110 d!99997))

(declare-fun d!99999 () Bool)

(assert (=> d!99999 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!734111 d!99999))

(declare-fun b!734237 () Bool)

(declare-fun lt!325421 () SeekEntryResult!7350)

(assert (=> b!734237 (and (bvsge (index!31770 lt!325421) #b00000000000000000000000000000000) (bvslt (index!31770 lt!325421) (size!20171 a!3186)))))

(declare-fun e!410828 () Bool)

(assert (=> b!734237 (= e!410828 (= (select (arr!19750 a!3186) (index!31770 lt!325421)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!734238 () Bool)

(assert (=> b!734238 (and (bvsge (index!31770 lt!325421) #b00000000000000000000000000000000) (bvslt (index!31770 lt!325421) (size!20171 a!3186)))))

(declare-fun res!493362 () Bool)

(assert (=> b!734238 (= res!493362 (= (select (arr!19750 a!3186) (index!31770 lt!325421)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!734238 (=> res!493362 e!410828)))

(declare-fun b!734239 () Bool)

(declare-fun e!410825 () SeekEntryResult!7350)

(assert (=> b!734239 (= e!410825 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!19750 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!19750 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!734240 () Bool)

(assert (=> b!734240 (= e!410825 (Intermediate!7350 false (toIndex!0 (select (arr!19750 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!734242 () Bool)

(declare-fun e!410824 () SeekEntryResult!7350)

(assert (=> b!734242 (= e!410824 (Intermediate!7350 true (toIndex!0 (select (arr!19750 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!734243 () Bool)

(declare-fun e!410827 () Bool)

(assert (=> b!734243 (= e!410827 (bvsge (x!62768 lt!325421) #b01111111111111111111111111111110))))

(declare-fun b!734244 () Bool)

(assert (=> b!734244 (= e!410824 e!410825)))

(declare-fun c!80817 () Bool)

(declare-fun lt!325420 () (_ BitVec 64))

(assert (=> b!734244 (= c!80817 (or (= lt!325420 (select (arr!19750 a!3186) j!159)) (= (bvadd lt!325420 lt!325420) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!734245 () Bool)

(declare-fun e!410826 () Bool)

(assert (=> b!734245 (= e!410827 e!410826)))

(declare-fun res!493361 () Bool)

(assert (=> b!734245 (= res!493361 (and ((_ is Intermediate!7350) lt!325421) (not (undefined!8162 lt!325421)) (bvslt (x!62768 lt!325421) #b01111111111111111111111111111110) (bvsge (x!62768 lt!325421) #b00000000000000000000000000000000) (bvsge (x!62768 lt!325421) #b00000000000000000000000000000000)))))

(assert (=> b!734245 (=> (not res!493361) (not e!410826))))

(declare-fun b!734241 () Bool)

(assert (=> b!734241 (and (bvsge (index!31770 lt!325421) #b00000000000000000000000000000000) (bvslt (index!31770 lt!325421) (size!20171 a!3186)))))

(declare-fun res!493363 () Bool)

(assert (=> b!734241 (= res!493363 (= (select (arr!19750 a!3186) (index!31770 lt!325421)) (select (arr!19750 a!3186) j!159)))))

(assert (=> b!734241 (=> res!493363 e!410828)))

(assert (=> b!734241 (= e!410826 e!410828)))

(declare-fun d!100001 () Bool)

(assert (=> d!100001 e!410827))

(declare-fun c!80819 () Bool)

(assert (=> d!100001 (= c!80819 (and ((_ is Intermediate!7350) lt!325421) (undefined!8162 lt!325421)))))

(assert (=> d!100001 (= lt!325421 e!410824)))

(declare-fun c!80818 () Bool)

(assert (=> d!100001 (= c!80818 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!100001 (= lt!325420 (select (arr!19750 a!3186) (toIndex!0 (select (arr!19750 a!3186) j!159) mask!3328)))))

(assert (=> d!100001 (validMask!0 mask!3328)))

(assert (=> d!100001 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19750 a!3186) j!159) mask!3328) (select (arr!19750 a!3186) j!159) a!3186 mask!3328) lt!325421)))

(assert (= (and d!100001 c!80818) b!734242))

(assert (= (and d!100001 (not c!80818)) b!734244))

(assert (= (and b!734244 c!80817) b!734240))

(assert (= (and b!734244 (not c!80817)) b!734239))

(assert (= (and d!100001 c!80819) b!734243))

(assert (= (and d!100001 (not c!80819)) b!734245))

(assert (= (and b!734245 res!493361) b!734241))

(assert (= (and b!734241 (not res!493363)) b!734238))

(assert (= (and b!734238 (not res!493362)) b!734237))

(declare-fun m!686933 () Bool)

(assert (=> b!734241 m!686933))

(assert (=> b!734237 m!686933))

(assert (=> b!734239 m!686825))

(declare-fun m!686935 () Bool)

(assert (=> b!734239 m!686935))

(assert (=> b!734239 m!686935))

(assert (=> b!734239 m!686819))

(declare-fun m!686937 () Bool)

(assert (=> b!734239 m!686937))

(assert (=> b!734238 m!686933))

(assert (=> d!100001 m!686825))

(declare-fun m!686939 () Bool)

(assert (=> d!100001 m!686939))

(assert (=> d!100001 m!686843))

(assert (=> b!734109 d!100001))

(declare-fun d!100005 () Bool)

(declare-fun lt!325431 () (_ BitVec 32))

(declare-fun lt!325430 () (_ BitVec 32))

(assert (=> d!100005 (= lt!325431 (bvmul (bvxor lt!325430 (bvlshr lt!325430 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!100005 (= lt!325430 ((_ extract 31 0) (bvand (bvxor (select (arr!19750 a!3186) j!159) (bvlshr (select (arr!19750 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!100005 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!493364 (let ((h!14819 ((_ extract 31 0) (bvand (bvxor (select (arr!19750 a!3186) j!159) (bvlshr (select (arr!19750 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!62772 (bvmul (bvxor h!14819 (bvlshr h!14819 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!62772 (bvlshr x!62772 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!493364 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!493364 #b00000000000000000000000000000000))))))

(assert (=> d!100005 (= (toIndex!0 (select (arr!19750 a!3186) j!159) mask!3328) (bvand (bvxor lt!325431 (bvlshr lt!325431 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!734109 d!100005))

(declare-fun d!100007 () Bool)

(assert (=> d!100007 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!65028 d!100007))

(declare-fun d!100017 () Bool)

(assert (=> d!100017 (= (array_inv!15546 a!3186) (bvsge (size!20171 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!65028 d!100017))

(declare-fun b!734348 () Bool)

(declare-fun e!410884 () SeekEntryResult!7350)

(declare-fun lt!325469 () SeekEntryResult!7350)

(assert (=> b!734348 (= e!410884 (MissingZero!7350 (index!31770 lt!325469)))))

(declare-fun b!734349 () Bool)

(declare-fun e!410885 () SeekEntryResult!7350)

(assert (=> b!734349 (= e!410885 (Found!7350 (index!31770 lt!325469)))))

(declare-fun b!734350 () Bool)

(declare-fun e!410886 () SeekEntryResult!7350)

(assert (=> b!734350 (= e!410886 e!410885)))

(declare-fun lt!325468 () (_ BitVec 64))

(assert (=> b!734350 (= lt!325468 (select (arr!19750 a!3186) (index!31770 lt!325469)))))

(declare-fun c!80860 () Bool)

(assert (=> b!734350 (= c!80860 (= lt!325468 (select (arr!19750 a!3186) j!159)))))

(declare-fun b!734351 () Bool)

(assert (=> b!734351 (= e!410884 (seekKeyOrZeroReturnVacant!0 (x!62768 lt!325469) (index!31770 lt!325469) (index!31770 lt!325469) (select (arr!19750 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!734353 () Bool)

(assert (=> b!734353 (= e!410886 Undefined!7350)))

(declare-fun d!100021 () Bool)

(declare-fun lt!325470 () SeekEntryResult!7350)

(assert (=> d!100021 (and (or ((_ is Undefined!7350) lt!325470) (not ((_ is Found!7350) lt!325470)) (and (bvsge (index!31769 lt!325470) #b00000000000000000000000000000000) (bvslt (index!31769 lt!325470) (size!20171 a!3186)))) (or ((_ is Undefined!7350) lt!325470) ((_ is Found!7350) lt!325470) (not ((_ is MissingZero!7350) lt!325470)) (and (bvsge (index!31768 lt!325470) #b00000000000000000000000000000000) (bvslt (index!31768 lt!325470) (size!20171 a!3186)))) (or ((_ is Undefined!7350) lt!325470) ((_ is Found!7350) lt!325470) ((_ is MissingZero!7350) lt!325470) (not ((_ is MissingVacant!7350) lt!325470)) (and (bvsge (index!31771 lt!325470) #b00000000000000000000000000000000) (bvslt (index!31771 lt!325470) (size!20171 a!3186)))) (or ((_ is Undefined!7350) lt!325470) (ite ((_ is Found!7350) lt!325470) (= (select (arr!19750 a!3186) (index!31769 lt!325470)) (select (arr!19750 a!3186) j!159)) (ite ((_ is MissingZero!7350) lt!325470) (= (select (arr!19750 a!3186) (index!31768 lt!325470)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7350) lt!325470) (= (select (arr!19750 a!3186) (index!31771 lt!325470)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!100021 (= lt!325470 e!410886)))

(declare-fun c!80859 () Bool)

(assert (=> d!100021 (= c!80859 (and ((_ is Intermediate!7350) lt!325469) (undefined!8162 lt!325469)))))

(assert (=> d!100021 (= lt!325469 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19750 a!3186) j!159) mask!3328) (select (arr!19750 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!100021 (validMask!0 mask!3328)))

(assert (=> d!100021 (= (seekEntryOrOpen!0 (select (arr!19750 a!3186) j!159) a!3186 mask!3328) lt!325470)))

(declare-fun b!734352 () Bool)

(declare-fun c!80861 () Bool)

(assert (=> b!734352 (= c!80861 (= lt!325468 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!734352 (= e!410885 e!410884)))

(assert (= (and d!100021 c!80859) b!734353))

(assert (= (and d!100021 (not c!80859)) b!734350))

(assert (= (and b!734350 c!80860) b!734349))

(assert (= (and b!734350 (not c!80860)) b!734352))

(assert (= (and b!734352 c!80861) b!734348))

(assert (= (and b!734352 (not c!80861)) b!734351))

(declare-fun m!686977 () Bool)

(assert (=> b!734350 m!686977))

(assert (=> b!734351 m!686819))

(declare-fun m!686979 () Bool)

(assert (=> b!734351 m!686979))

(assert (=> d!100021 m!686819))

(assert (=> d!100021 m!686825))

(declare-fun m!686981 () Bool)

(assert (=> d!100021 m!686981))

(declare-fun m!686983 () Bool)

(assert (=> d!100021 m!686983))

(assert (=> d!100021 m!686825))

(assert (=> d!100021 m!686819))

(assert (=> d!100021 m!686827))

(declare-fun m!686985 () Bool)

(assert (=> d!100021 m!686985))

(assert (=> d!100021 m!686843))

(assert (=> b!734120 d!100021))

(declare-fun b!734354 () Bool)

(declare-fun lt!325472 () SeekEntryResult!7350)

(assert (=> b!734354 (and (bvsge (index!31770 lt!325472) #b00000000000000000000000000000000) (bvslt (index!31770 lt!325472) (size!20171 lt!325363)))))

(declare-fun e!410891 () Bool)

(assert (=> b!734354 (= e!410891 (= (select (arr!19750 lt!325363) (index!31770 lt!325472)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!734355 () Bool)

(assert (=> b!734355 (and (bvsge (index!31770 lt!325472) #b00000000000000000000000000000000) (bvslt (index!31770 lt!325472) (size!20171 lt!325363)))))

(declare-fun res!493392 () Bool)

(assert (=> b!734355 (= res!493392 (= (select (arr!19750 lt!325363) (index!31770 lt!325472)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!734355 (=> res!493392 e!410891)))

(declare-fun b!734356 () Bool)

(declare-fun e!410888 () SeekEntryResult!7350)

(assert (=> b!734356 (= e!410888 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!325362 lt!325363 mask!3328))))

(declare-fun b!734357 () Bool)

(assert (=> b!734357 (= e!410888 (Intermediate!7350 false index!1321 x!1131))))

(declare-fun b!734359 () Bool)

(declare-fun e!410887 () SeekEntryResult!7350)

(assert (=> b!734359 (= e!410887 (Intermediate!7350 true index!1321 x!1131))))

(declare-fun b!734360 () Bool)

(declare-fun e!410890 () Bool)

(assert (=> b!734360 (= e!410890 (bvsge (x!62768 lt!325472) #b01111111111111111111111111111110))))

(declare-fun b!734361 () Bool)

(assert (=> b!734361 (= e!410887 e!410888)))

(declare-fun c!80862 () Bool)

(declare-fun lt!325471 () (_ BitVec 64))

(assert (=> b!734361 (= c!80862 (or (= lt!325471 lt!325362) (= (bvadd lt!325471 lt!325471) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!734362 () Bool)

(declare-fun e!410889 () Bool)

(assert (=> b!734362 (= e!410890 e!410889)))

(declare-fun res!493391 () Bool)

(assert (=> b!734362 (= res!493391 (and ((_ is Intermediate!7350) lt!325472) (not (undefined!8162 lt!325472)) (bvslt (x!62768 lt!325472) #b01111111111111111111111111111110) (bvsge (x!62768 lt!325472) #b00000000000000000000000000000000) (bvsge (x!62768 lt!325472) x!1131)))))

(assert (=> b!734362 (=> (not res!493391) (not e!410889))))

(declare-fun b!734358 () Bool)

(assert (=> b!734358 (and (bvsge (index!31770 lt!325472) #b00000000000000000000000000000000) (bvslt (index!31770 lt!325472) (size!20171 lt!325363)))))

(declare-fun res!493393 () Bool)

(assert (=> b!734358 (= res!493393 (= (select (arr!19750 lt!325363) (index!31770 lt!325472)) lt!325362))))

(assert (=> b!734358 (=> res!493393 e!410891)))

(assert (=> b!734358 (= e!410889 e!410891)))

(declare-fun d!100031 () Bool)

(assert (=> d!100031 e!410890))

(declare-fun c!80864 () Bool)

(assert (=> d!100031 (= c!80864 (and ((_ is Intermediate!7350) lt!325472) (undefined!8162 lt!325472)))))

(assert (=> d!100031 (= lt!325472 e!410887)))

(declare-fun c!80863 () Bool)

(assert (=> d!100031 (= c!80863 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!100031 (= lt!325471 (select (arr!19750 lt!325363) index!1321))))

(assert (=> d!100031 (validMask!0 mask!3328)))

(assert (=> d!100031 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!325362 lt!325363 mask!3328) lt!325472)))

(assert (= (and d!100031 c!80863) b!734359))

(assert (= (and d!100031 (not c!80863)) b!734361))

(assert (= (and b!734361 c!80862) b!734357))

(assert (= (and b!734361 (not c!80862)) b!734356))

(assert (= (and d!100031 c!80864) b!734360))

(assert (= (and d!100031 (not c!80864)) b!734362))

(assert (= (and b!734362 res!493391) b!734358))

(assert (= (and b!734358 (not res!493393)) b!734355))

(assert (= (and b!734355 (not res!493392)) b!734354))

(declare-fun m!686987 () Bool)

(assert (=> b!734358 m!686987))

(assert (=> b!734354 m!686987))

(assert (=> b!734356 m!686855))

(assert (=> b!734356 m!686855))

(declare-fun m!686989 () Bool)

(assert (=> b!734356 m!686989))

(assert (=> b!734355 m!686987))

(declare-fun m!686991 () Bool)

(assert (=> d!100031 m!686991))

(assert (=> d!100031 m!686843))

(assert (=> b!734118 d!100031))

(declare-fun b!734363 () Bool)

(declare-fun lt!325474 () SeekEntryResult!7350)

(assert (=> b!734363 (and (bvsge (index!31770 lt!325474) #b00000000000000000000000000000000) (bvslt (index!31770 lt!325474) (size!20171 lt!325363)))))

(declare-fun e!410896 () Bool)

(assert (=> b!734363 (= e!410896 (= (select (arr!19750 lt!325363) (index!31770 lt!325474)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!734364 () Bool)

(assert (=> b!734364 (and (bvsge (index!31770 lt!325474) #b00000000000000000000000000000000) (bvslt (index!31770 lt!325474) (size!20171 lt!325363)))))

(declare-fun res!493395 () Bool)

(assert (=> b!734364 (= res!493395 (= (select (arr!19750 lt!325363) (index!31770 lt!325474)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!734364 (=> res!493395 e!410896)))

(declare-fun b!734365 () Bool)

(declare-fun e!410893 () SeekEntryResult!7350)

(assert (=> b!734365 (= e!410893 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!325362 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!325362 lt!325363 mask!3328))))

(declare-fun b!734366 () Bool)

(assert (=> b!734366 (= e!410893 (Intermediate!7350 false (toIndex!0 lt!325362 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!734368 () Bool)

(declare-fun e!410892 () SeekEntryResult!7350)

(assert (=> b!734368 (= e!410892 (Intermediate!7350 true (toIndex!0 lt!325362 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!734369 () Bool)

(declare-fun e!410895 () Bool)

(assert (=> b!734369 (= e!410895 (bvsge (x!62768 lt!325474) #b01111111111111111111111111111110))))

(declare-fun b!734370 () Bool)

(assert (=> b!734370 (= e!410892 e!410893)))

(declare-fun c!80865 () Bool)

(declare-fun lt!325473 () (_ BitVec 64))

(assert (=> b!734370 (= c!80865 (or (= lt!325473 lt!325362) (= (bvadd lt!325473 lt!325473) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!734371 () Bool)

(declare-fun e!410894 () Bool)

(assert (=> b!734371 (= e!410895 e!410894)))

(declare-fun res!493394 () Bool)

(assert (=> b!734371 (= res!493394 (and ((_ is Intermediate!7350) lt!325474) (not (undefined!8162 lt!325474)) (bvslt (x!62768 lt!325474) #b01111111111111111111111111111110) (bvsge (x!62768 lt!325474) #b00000000000000000000000000000000) (bvsge (x!62768 lt!325474) #b00000000000000000000000000000000)))))

(assert (=> b!734371 (=> (not res!493394) (not e!410894))))

(declare-fun b!734367 () Bool)

(assert (=> b!734367 (and (bvsge (index!31770 lt!325474) #b00000000000000000000000000000000) (bvslt (index!31770 lt!325474) (size!20171 lt!325363)))))

(declare-fun res!493396 () Bool)

(assert (=> b!734367 (= res!493396 (= (select (arr!19750 lt!325363) (index!31770 lt!325474)) lt!325362))))

(assert (=> b!734367 (=> res!493396 e!410896)))

(assert (=> b!734367 (= e!410894 e!410896)))

(declare-fun d!100033 () Bool)

(assert (=> d!100033 e!410895))

(declare-fun c!80867 () Bool)

(assert (=> d!100033 (= c!80867 (and ((_ is Intermediate!7350) lt!325474) (undefined!8162 lt!325474)))))

(assert (=> d!100033 (= lt!325474 e!410892)))

(declare-fun c!80866 () Bool)

(assert (=> d!100033 (= c!80866 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!100033 (= lt!325473 (select (arr!19750 lt!325363) (toIndex!0 lt!325362 mask!3328)))))

(assert (=> d!100033 (validMask!0 mask!3328)))

(assert (=> d!100033 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!325362 mask!3328) lt!325362 lt!325363 mask!3328) lt!325474)))

(assert (= (and d!100033 c!80866) b!734368))

(assert (= (and d!100033 (not c!80866)) b!734370))

(assert (= (and b!734370 c!80865) b!734366))

(assert (= (and b!734370 (not c!80865)) b!734365))

(assert (= (and d!100033 c!80867) b!734369))

(assert (= (and d!100033 (not c!80867)) b!734371))

(assert (= (and b!734371 res!493394) b!734367))

(assert (= (and b!734367 (not res!493396)) b!734364))

(assert (= (and b!734364 (not res!493395)) b!734363))

(declare-fun m!686993 () Bool)

(assert (=> b!734367 m!686993))

(assert (=> b!734363 m!686993))

(assert (=> b!734365 m!686809))

(declare-fun m!686995 () Bool)

(assert (=> b!734365 m!686995))

(assert (=> b!734365 m!686995))

(declare-fun m!686997 () Bool)

(assert (=> b!734365 m!686997))

(assert (=> b!734364 m!686993))

(assert (=> d!100033 m!686809))

(declare-fun m!686999 () Bool)

(assert (=> d!100033 m!686999))

(assert (=> d!100033 m!686843))

(assert (=> b!734118 d!100033))

(declare-fun d!100035 () Bool)

(declare-fun lt!325476 () (_ BitVec 32))

(declare-fun lt!325475 () (_ BitVec 32))

(assert (=> d!100035 (= lt!325476 (bvmul (bvxor lt!325475 (bvlshr lt!325475 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!100035 (= lt!325475 ((_ extract 31 0) (bvand (bvxor lt!325362 (bvlshr lt!325362 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!100035 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!493364 (let ((h!14819 ((_ extract 31 0) (bvand (bvxor lt!325362 (bvlshr lt!325362 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!62772 (bvmul (bvxor h!14819 (bvlshr h!14819 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!62772 (bvlshr x!62772 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!493364 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!493364 #b00000000000000000000000000000000))))))

(assert (=> d!100035 (= (toIndex!0 lt!325362 mask!3328) (bvand (bvxor lt!325476 (bvlshr lt!325476 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!734118 d!100035))

(declare-fun b!734372 () Bool)

(declare-fun lt!325478 () SeekEntryResult!7350)

(assert (=> b!734372 (and (bvsge (index!31770 lt!325478) #b00000000000000000000000000000000) (bvslt (index!31770 lt!325478) (size!20171 a!3186)))))

(declare-fun e!410901 () Bool)

(assert (=> b!734372 (= e!410901 (= (select (arr!19750 a!3186) (index!31770 lt!325478)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!734373 () Bool)

(assert (=> b!734373 (and (bvsge (index!31770 lt!325478) #b00000000000000000000000000000000) (bvslt (index!31770 lt!325478) (size!20171 a!3186)))))

(declare-fun res!493398 () Bool)

(assert (=> b!734373 (= res!493398 (= (select (arr!19750 a!3186) (index!31770 lt!325478)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!734373 (=> res!493398 e!410901)))

(declare-fun e!410898 () SeekEntryResult!7350)

(declare-fun b!734374 () Bool)

(assert (=> b!734374 (= e!410898 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!19750 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!734375 () Bool)

(assert (=> b!734375 (= e!410898 (Intermediate!7350 false index!1321 x!1131))))

(declare-fun b!734377 () Bool)

(declare-fun e!410897 () SeekEntryResult!7350)

(assert (=> b!734377 (= e!410897 (Intermediate!7350 true index!1321 x!1131))))

(declare-fun b!734378 () Bool)

(declare-fun e!410900 () Bool)

(assert (=> b!734378 (= e!410900 (bvsge (x!62768 lt!325478) #b01111111111111111111111111111110))))

(declare-fun b!734379 () Bool)

(assert (=> b!734379 (= e!410897 e!410898)))

(declare-fun lt!325477 () (_ BitVec 64))

(declare-fun c!80868 () Bool)

(assert (=> b!734379 (= c!80868 (or (= lt!325477 (select (arr!19750 a!3186) j!159)) (= (bvadd lt!325477 lt!325477) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!734380 () Bool)

(declare-fun e!410899 () Bool)

(assert (=> b!734380 (= e!410900 e!410899)))

(declare-fun res!493397 () Bool)

(assert (=> b!734380 (= res!493397 (and ((_ is Intermediate!7350) lt!325478) (not (undefined!8162 lt!325478)) (bvslt (x!62768 lt!325478) #b01111111111111111111111111111110) (bvsge (x!62768 lt!325478) #b00000000000000000000000000000000) (bvsge (x!62768 lt!325478) x!1131)))))

(assert (=> b!734380 (=> (not res!493397) (not e!410899))))

(declare-fun b!734376 () Bool)

(assert (=> b!734376 (and (bvsge (index!31770 lt!325478) #b00000000000000000000000000000000) (bvslt (index!31770 lt!325478) (size!20171 a!3186)))))

(declare-fun res!493399 () Bool)

(assert (=> b!734376 (= res!493399 (= (select (arr!19750 a!3186) (index!31770 lt!325478)) (select (arr!19750 a!3186) j!159)))))

(assert (=> b!734376 (=> res!493399 e!410901)))

(assert (=> b!734376 (= e!410899 e!410901)))

(declare-fun d!100037 () Bool)

(assert (=> d!100037 e!410900))

(declare-fun c!80870 () Bool)

(assert (=> d!100037 (= c!80870 (and ((_ is Intermediate!7350) lt!325478) (undefined!8162 lt!325478)))))

(assert (=> d!100037 (= lt!325478 e!410897)))

(declare-fun c!80869 () Bool)

(assert (=> d!100037 (= c!80869 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!100037 (= lt!325477 (select (arr!19750 a!3186) index!1321))))

(assert (=> d!100037 (validMask!0 mask!3328)))

(assert (=> d!100037 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19750 a!3186) j!159) a!3186 mask!3328) lt!325478)))

(assert (= (and d!100037 c!80869) b!734377))

(assert (= (and d!100037 (not c!80869)) b!734379))

(assert (= (and b!734379 c!80868) b!734375))

(assert (= (and b!734379 (not c!80868)) b!734374))

(assert (= (and d!100037 c!80870) b!734378))

(assert (= (and d!100037 (not c!80870)) b!734380))

(assert (= (and b!734380 res!493397) b!734376))

(assert (= (and b!734376 (not res!493399)) b!734373))

(assert (= (and b!734373 (not res!493398)) b!734372))

(declare-fun m!687001 () Bool)

(assert (=> b!734376 m!687001))

(assert (=> b!734372 m!687001))

(assert (=> b!734374 m!686855))

(assert (=> b!734374 m!686855))

(assert (=> b!734374 m!686819))

(declare-fun m!687003 () Bool)

(assert (=> b!734374 m!687003))

(assert (=> b!734373 m!687001))

(declare-fun m!687005 () Bool)

(assert (=> d!100037 m!687005))

(assert (=> d!100037 m!686843))

(assert (=> b!734119 d!100037))

(declare-fun b!734391 () Bool)

(declare-fun e!410913 () Bool)

(declare-fun call!34897 () Bool)

(assert (=> b!734391 (= e!410913 call!34897)))

(declare-fun b!734392 () Bool)

(declare-fun e!410912 () Bool)

(declare-fun contains!4060 (List!13752 (_ BitVec 64)) Bool)

(assert (=> b!734392 (= e!410912 (contains!4060 Nil!13749 (select (arr!19750 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!734393 () Bool)

(declare-fun e!410911 () Bool)

(declare-fun e!410910 () Bool)

(assert (=> b!734393 (= e!410911 e!410910)))

(declare-fun res!493407 () Bool)

(assert (=> b!734393 (=> (not res!493407) (not e!410910))))

(assert (=> b!734393 (= res!493407 (not e!410912))))

(declare-fun res!493406 () Bool)

(assert (=> b!734393 (=> (not res!493406) (not e!410912))))

(assert (=> b!734393 (= res!493406 (validKeyInArray!0 (select (arr!19750 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!100039 () Bool)

(declare-fun res!493408 () Bool)

(assert (=> d!100039 (=> res!493408 e!410911)))

(assert (=> d!100039 (= res!493408 (bvsge #b00000000000000000000000000000000 (size!20171 a!3186)))))

(assert (=> d!100039 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13749) e!410911)))

(declare-fun bm!34894 () Bool)

(declare-fun c!80873 () Bool)

(assert (=> bm!34894 (= call!34897 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!80873 (Cons!13748 (select (arr!19750 a!3186) #b00000000000000000000000000000000) Nil!13749) Nil!13749)))))

(declare-fun b!734394 () Bool)

(assert (=> b!734394 (= e!410913 call!34897)))

(declare-fun b!734395 () Bool)

(assert (=> b!734395 (= e!410910 e!410913)))

(assert (=> b!734395 (= c!80873 (validKeyInArray!0 (select (arr!19750 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!100039 (not res!493408)) b!734393))

(assert (= (and b!734393 res!493406) b!734392))

(assert (= (and b!734393 res!493407) b!734395))

(assert (= (and b!734395 c!80873) b!734391))

(assert (= (and b!734395 (not c!80873)) b!734394))

(assert (= (or b!734391 b!734394) bm!34894))

(assert (=> b!734392 m!686921))

(assert (=> b!734392 m!686921))

(declare-fun m!687007 () Bool)

(assert (=> b!734392 m!687007))

(assert (=> b!734393 m!686921))

(assert (=> b!734393 m!686921))

(assert (=> b!734393 m!686929))

(assert (=> bm!34894 m!686921))

(declare-fun m!687009 () Bool)

(assert (=> bm!34894 m!687009))

(assert (=> b!734395 m!686921))

(assert (=> b!734395 m!686921))

(assert (=> b!734395 m!686929))

(assert (=> b!734107 d!100039))

(declare-fun d!100041 () Bool)

(declare-fun lt!325493 () (_ BitVec 32))

(assert (=> d!100041 (and (bvsge lt!325493 #b00000000000000000000000000000000) (bvslt lt!325493 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!100041 (= lt!325493 (choose!52 index!1321 x!1131 mask!3328))))

(assert (=> d!100041 (validMask!0 mask!3328)))

(assert (=> d!100041 (= (nextIndex!0 index!1321 x!1131 mask!3328) lt!325493)))

(declare-fun bs!20981 () Bool)

(assert (= bs!20981 d!100041))

(declare-fun m!687011 () Bool)

(assert (=> bs!20981 m!687011))

(assert (=> bs!20981 m!686843))

(assert (=> b!734105 d!100041))

(declare-fun b!734420 () Bool)

(declare-fun e!410926 () SeekEntryResult!7350)

(declare-fun lt!325495 () SeekEntryResult!7350)

(assert (=> b!734420 (= e!410926 (MissingZero!7350 (index!31770 lt!325495)))))

(declare-fun b!734421 () Bool)

(declare-fun e!410927 () SeekEntryResult!7350)

(assert (=> b!734421 (= e!410927 (Found!7350 (index!31770 lt!325495)))))

(declare-fun b!734422 () Bool)

(declare-fun e!410928 () SeekEntryResult!7350)

(assert (=> b!734422 (= e!410928 e!410927)))

(declare-fun lt!325494 () (_ BitVec 64))

(assert (=> b!734422 (= lt!325494 (select (arr!19750 a!3186) (index!31770 lt!325495)))))

(declare-fun c!80887 () Bool)

(assert (=> b!734422 (= c!80887 (= lt!325494 k0!2102))))

(declare-fun b!734423 () Bool)

(assert (=> b!734423 (= e!410926 (seekKeyOrZeroReturnVacant!0 (x!62768 lt!325495) (index!31770 lt!325495) (index!31770 lt!325495) k0!2102 a!3186 mask!3328))))

(declare-fun b!734425 () Bool)

(assert (=> b!734425 (= e!410928 Undefined!7350)))

(declare-fun d!100043 () Bool)

(declare-fun lt!325496 () SeekEntryResult!7350)

(assert (=> d!100043 (and (or ((_ is Undefined!7350) lt!325496) (not ((_ is Found!7350) lt!325496)) (and (bvsge (index!31769 lt!325496) #b00000000000000000000000000000000) (bvslt (index!31769 lt!325496) (size!20171 a!3186)))) (or ((_ is Undefined!7350) lt!325496) ((_ is Found!7350) lt!325496) (not ((_ is MissingZero!7350) lt!325496)) (and (bvsge (index!31768 lt!325496) #b00000000000000000000000000000000) (bvslt (index!31768 lt!325496) (size!20171 a!3186)))) (or ((_ is Undefined!7350) lt!325496) ((_ is Found!7350) lt!325496) ((_ is MissingZero!7350) lt!325496) (not ((_ is MissingVacant!7350) lt!325496)) (and (bvsge (index!31771 lt!325496) #b00000000000000000000000000000000) (bvslt (index!31771 lt!325496) (size!20171 a!3186)))) (or ((_ is Undefined!7350) lt!325496) (ite ((_ is Found!7350) lt!325496) (= (select (arr!19750 a!3186) (index!31769 lt!325496)) k0!2102) (ite ((_ is MissingZero!7350) lt!325496) (= (select (arr!19750 a!3186) (index!31768 lt!325496)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7350) lt!325496) (= (select (arr!19750 a!3186) (index!31771 lt!325496)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!100043 (= lt!325496 e!410928)))

(declare-fun c!80886 () Bool)

(assert (=> d!100043 (= c!80886 (and ((_ is Intermediate!7350) lt!325495) (undefined!8162 lt!325495)))))

(assert (=> d!100043 (= lt!325495 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!100043 (validMask!0 mask!3328)))

(assert (=> d!100043 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!325496)))

(declare-fun b!734424 () Bool)

(declare-fun c!80888 () Bool)

(assert (=> b!734424 (= c!80888 (= lt!325494 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!734424 (= e!410927 e!410926)))

(assert (= (and d!100043 c!80886) b!734425))

(assert (= (and d!100043 (not c!80886)) b!734422))

(assert (= (and b!734422 c!80887) b!734421))

(assert (= (and b!734422 (not c!80887)) b!734424))

(assert (= (and b!734424 c!80888) b!734420))

(assert (= (and b!734424 (not c!80888)) b!734423))

(declare-fun m!687013 () Bool)

(assert (=> b!734422 m!687013))

(declare-fun m!687015 () Bool)

(assert (=> b!734423 m!687015))

(declare-fun m!687017 () Bool)

(assert (=> d!100043 m!687017))

(declare-fun m!687019 () Bool)

(assert (=> d!100043 m!687019))

(declare-fun m!687021 () Bool)

(assert (=> d!100043 m!687021))

(assert (=> d!100043 m!687017))

(declare-fun m!687023 () Bool)

(assert (=> d!100043 m!687023))

(declare-fun m!687025 () Bool)

(assert (=> d!100043 m!687025))

(assert (=> d!100043 m!686843))

(assert (=> b!734116 d!100043))

(declare-fun b!734426 () Bool)

(declare-fun c!80890 () Bool)

(declare-fun lt!325497 () (_ BitVec 64))

(assert (=> b!734426 (= c!80890 (= lt!325497 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!410929 () SeekEntryResult!7350)

(declare-fun e!410931 () SeekEntryResult!7350)

(assert (=> b!734426 (= e!410929 e!410931)))

(declare-fun b!734427 () Bool)

(assert (=> b!734427 (= e!410929 (Found!7350 index!1321))))

(declare-fun b!734428 () Bool)

(declare-fun e!410930 () SeekEntryResult!7350)

(assert (=> b!734428 (= e!410930 Undefined!7350)))

(declare-fun b!734429 () Bool)

(assert (=> b!734429 (= e!410930 e!410929)))

(declare-fun c!80891 () Bool)

(assert (=> b!734429 (= c!80891 (= lt!325497 (select (arr!19750 a!3186) j!159)))))

(declare-fun b!734430 () Bool)

(assert (=> b!734430 (= e!410931 (MissingVacant!7350 resIntermediateIndex!5))))

(declare-fun b!734431 () Bool)

(assert (=> b!734431 (= e!410931 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!19750 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!100045 () Bool)

(declare-fun lt!325498 () SeekEntryResult!7350)

(assert (=> d!100045 (and (or ((_ is Undefined!7350) lt!325498) (not ((_ is Found!7350) lt!325498)) (and (bvsge (index!31769 lt!325498) #b00000000000000000000000000000000) (bvslt (index!31769 lt!325498) (size!20171 a!3186)))) (or ((_ is Undefined!7350) lt!325498) ((_ is Found!7350) lt!325498) (not ((_ is MissingVacant!7350) lt!325498)) (not (= (index!31771 lt!325498) resIntermediateIndex!5)) (and (bvsge (index!31771 lt!325498) #b00000000000000000000000000000000) (bvslt (index!31771 lt!325498) (size!20171 a!3186)))) (or ((_ is Undefined!7350) lt!325498) (ite ((_ is Found!7350) lt!325498) (= (select (arr!19750 a!3186) (index!31769 lt!325498)) (select (arr!19750 a!3186) j!159)) (and ((_ is MissingVacant!7350) lt!325498) (= (index!31771 lt!325498) resIntermediateIndex!5) (= (select (arr!19750 a!3186) (index!31771 lt!325498)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!100045 (= lt!325498 e!410930)))

(declare-fun c!80889 () Bool)

(assert (=> d!100045 (= c!80889 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!100045 (= lt!325497 (select (arr!19750 a!3186) index!1321))))

(assert (=> d!100045 (validMask!0 mask!3328)))

(assert (=> d!100045 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19750 a!3186) j!159) a!3186 mask!3328) lt!325498)))

(assert (= (and d!100045 c!80889) b!734428))

(assert (= (and d!100045 (not c!80889)) b!734429))

(assert (= (and b!734429 c!80891) b!734427))

(assert (= (and b!734429 (not c!80891)) b!734426))

(assert (= (and b!734426 c!80890) b!734430))

(assert (= (and b!734426 (not c!80890)) b!734431))

(assert (=> b!734431 m!686855))

(assert (=> b!734431 m!686855))

(assert (=> b!734431 m!686819))

(declare-fun m!687027 () Bool)

(assert (=> b!734431 m!687027))

(declare-fun m!687029 () Bool)

(assert (=> d!100045 m!687029))

(declare-fun m!687031 () Bool)

(assert (=> d!100045 m!687031))

(assert (=> d!100045 m!687005))

(assert (=> d!100045 m!686843))

(assert (=> b!734114 d!100045))

(assert (=> b!734115 d!100045))

(declare-fun d!100047 () Bool)

(declare-fun res!493419 () Bool)

(declare-fun e!410952 () Bool)

(assert (=> d!100047 (=> res!493419 e!410952)))

(assert (=> d!100047 (= res!493419 (= (select (arr!19750 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!100047 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!410952)))

(declare-fun b!734466 () Bool)

(declare-fun e!410953 () Bool)

(assert (=> b!734466 (= e!410952 e!410953)))

(declare-fun res!493420 () Bool)

(assert (=> b!734466 (=> (not res!493420) (not e!410953))))

(assert (=> b!734466 (= res!493420 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20171 a!3186)))))

(declare-fun b!734467 () Bool)

(assert (=> b!734467 (= e!410953 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!100047 (not res!493419)) b!734466))

(assert (= (and b!734466 res!493420) b!734467))

(assert (=> d!100047 m!686921))

(declare-fun m!687073 () Bool)

(assert (=> b!734467 m!687073))

(assert (=> b!734113 d!100047))

(check-sat (not b!734356) (not b!734351) (not bm!34894) (not b!734395) (not d!99993) (not b!734393) (not d!100021) (not d!100031) (not b!734365) (not b!734374) (not d!100041) (not b!734392) (not b!734212) (not d!100001) (not b!734202) (not b!734431) (not b!734216) (not d!100037) (not b!734239) (not bm!34890) (not d!100043) (not bm!34891) (not d!100045) (not b!734218) (not d!100033) (not b!734214) (not b!734423) (not b!734467) (not d!99989))
(check-sat)

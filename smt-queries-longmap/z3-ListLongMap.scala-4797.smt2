; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65970 () Bool)

(assert start!65970)

(declare-fun b!759196 () Bool)

(declare-fun res!513416 () Bool)

(declare-fun e!423328 () Bool)

(assert (=> b!759196 (=> (not res!513416) (not e!423328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42013 0))(
  ( (array!42014 (arr!20116 (Array (_ BitVec 32) (_ BitVec 64))) (size!20536 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42013)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!759196 (= res!513416 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20536 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20536 a!3186))))))

(declare-fun b!759197 () Bool)

(declare-fun res!513413 () Bool)

(declare-fun e!423333 () Bool)

(assert (=> b!759197 (=> (not res!513413) (not e!423333))))

(declare-fun e!423331 () Bool)

(assert (=> b!759197 (= res!513413 e!423331)))

(declare-fun c!83278 () Bool)

(assert (=> b!759197 (= c!83278 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!759199 () Bool)

(declare-fun res!513419 () Bool)

(assert (=> b!759199 (=> (not res!513419) (not e!423328))))

(declare-datatypes ((List!14025 0))(
  ( (Nil!14022) (Cons!14021 (h!15099 (_ BitVec 64)) (t!20332 List!14025)) )
))
(declare-fun arrayNoDuplicates!0 (array!42013 (_ BitVec 32) List!14025) Bool)

(assert (=> b!759199 (= res!513419 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14022))))

(declare-fun b!759200 () Bool)

(declare-fun e!423337 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!759200 (= e!423337 (bvsge mask!3328 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!7672 0))(
  ( (MissingZero!7672 (index!33056 (_ BitVec 32))) (Found!7672 (index!33057 (_ BitVec 32))) (Intermediate!7672 (undefined!8484 Bool) (index!33058 (_ BitVec 32)) (x!64106 (_ BitVec 32))) (Undefined!7672) (MissingVacant!7672 (index!33059 (_ BitVec 32))) )
))
(declare-fun lt!338191 () SeekEntryResult!7672)

(declare-fun lt!338188 () SeekEntryResult!7672)

(assert (=> b!759200 (= lt!338191 lt!338188)))

(declare-datatypes ((Unit!26245 0))(
  ( (Unit!26246) )
))
(declare-fun lt!338202 () Unit!26245)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!42013 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26245)

(assert (=> b!759200 (= lt!338202 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3186 i!1173 k0!2102 j!159 index!1321 x!1131 resIntermediateIndex!5 index!1321 mask!3328))))

(declare-fun b!759201 () Bool)

(declare-fun e!423335 () Unit!26245)

(declare-fun Unit!26247 () Unit!26245)

(assert (=> b!759201 (= e!423335 Unit!26247)))

(declare-fun b!759202 () Bool)

(declare-fun e!423334 () Bool)

(assert (=> b!759202 (= e!423334 e!423337)))

(declare-fun res!513407 () Bool)

(assert (=> b!759202 (=> res!513407 e!423337)))

(assert (=> b!759202 (= res!513407 (or (not (= (select (arr!20116 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!1321 resIntermediateIndex!5)))))

(declare-fun lt!338197 () SeekEntryResult!7672)

(declare-fun lt!338190 () SeekEntryResult!7672)

(assert (=> b!759202 (and (= lt!338190 lt!338191) (= lt!338197 lt!338188))))

(declare-fun lt!338195 () (_ BitVec 64))

(declare-fun lt!338199 () array!42013)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42013 (_ BitVec 32)) SeekEntryResult!7672)

(assert (=> b!759202 (= lt!338191 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!338195 lt!338199 mask!3328))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42013 (_ BitVec 32)) SeekEntryResult!7672)

(assert (=> b!759202 (= lt!338190 (seekEntryOrOpen!0 lt!338195 lt!338199 mask!3328))))

(declare-fun lt!338192 () (_ BitVec 64))

(assert (=> b!759202 (= lt!338192 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!338189 () Unit!26245)

(assert (=> b!759202 (= lt!338189 e!423335)))

(declare-fun c!83279 () Bool)

(assert (=> b!759202 (= c!83279 (= lt!338192 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!759203 () Bool)

(declare-fun e!423329 () Bool)

(declare-fun e!423332 () Bool)

(assert (=> b!759203 (= e!423329 e!423332)))

(declare-fun res!513422 () Bool)

(assert (=> b!759203 (=> res!513422 e!423332)))

(declare-fun lt!338194 () SeekEntryResult!7672)

(assert (=> b!759203 (= res!513422 (not (= lt!338188 lt!338194)))))

(assert (=> b!759203 (= lt!338188 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20116 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!759204 () Bool)

(declare-fun e!423336 () Bool)

(assert (=> b!759204 (= e!423333 e!423336)))

(declare-fun res!513412 () Bool)

(assert (=> b!759204 (=> (not res!513412) (not e!423336))))

(declare-fun lt!338198 () SeekEntryResult!7672)

(declare-fun lt!338201 () SeekEntryResult!7672)

(assert (=> b!759204 (= res!513412 (= lt!338198 lt!338201))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42013 (_ BitVec 32)) SeekEntryResult!7672)

(assert (=> b!759204 (= lt!338201 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338195 lt!338199 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!759204 (= lt!338198 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338195 mask!3328) lt!338195 lt!338199 mask!3328))))

(assert (=> b!759204 (= lt!338195 (select (store (arr!20116 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!759204 (= lt!338199 (array!42014 (store (arr!20116 a!3186) i!1173 k0!2102) (size!20536 a!3186)))))

(declare-fun b!759205 () Bool)

(declare-fun res!513409 () Bool)

(assert (=> b!759205 (=> (not res!513409) (not e!423328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42013 (_ BitVec 32)) Bool)

(assert (=> b!759205 (= res!513409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!759206 () Bool)

(declare-fun res!513421 () Bool)

(declare-fun e!423330 () Bool)

(assert (=> b!759206 (=> (not res!513421) (not e!423330))))

(assert (=> b!759206 (= res!513421 (and (= (size!20536 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20536 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20536 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!759207 () Bool)

(declare-fun res!513411 () Bool)

(assert (=> b!759207 (=> (not res!513411) (not e!423330))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!759207 (= res!513411 (validKeyInArray!0 k0!2102))))

(declare-fun b!759208 () Bool)

(assert (=> b!759208 (= e!423330 e!423328)))

(declare-fun res!513417 () Bool)

(assert (=> b!759208 (=> (not res!513417) (not e!423328))))

(declare-fun lt!338196 () SeekEntryResult!7672)

(assert (=> b!759208 (= res!513417 (or (= lt!338196 (MissingZero!7672 i!1173)) (= lt!338196 (MissingVacant!7672 i!1173))))))

(assert (=> b!759208 (= lt!338196 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!759209 () Bool)

(declare-fun res!513420 () Bool)

(assert (=> b!759209 (=> (not res!513420) (not e!423333))))

(assert (=> b!759209 (= res!513420 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20116 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!759210 () Bool)

(declare-fun res!513424 () Bool)

(assert (=> b!759210 (=> (not res!513424) (not e!423330))))

(declare-fun arrayContainsKey!0 (array!42013 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!759210 (= res!513424 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!759211 () Bool)

(assert (=> b!759211 (= e!423328 e!423333)))

(declare-fun res!513408 () Bool)

(assert (=> b!759211 (=> (not res!513408) (not e!423333))))

(declare-fun lt!338200 () SeekEntryResult!7672)

(assert (=> b!759211 (= res!513408 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20116 a!3186) j!159) mask!3328) (select (arr!20116 a!3186) j!159) a!3186 mask!3328) lt!338200))))

(assert (=> b!759211 (= lt!338200 (Intermediate!7672 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!513414 () Bool)

(assert (=> start!65970 (=> (not res!513414) (not e!423330))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65970 (= res!513414 (validMask!0 mask!3328))))

(assert (=> start!65970 e!423330))

(assert (=> start!65970 true))

(declare-fun array_inv!15975 (array!42013) Bool)

(assert (=> start!65970 (array_inv!15975 a!3186)))

(declare-fun b!759198 () Bool)

(assert (=> b!759198 (= e!423331 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20116 a!3186) j!159) a!3186 mask!3328) (Found!7672 j!159)))))

(declare-fun b!759212 () Bool)

(declare-fun e!423339 () Bool)

(assert (=> b!759212 (= e!423339 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20116 a!3186) j!159) a!3186 mask!3328) lt!338194))))

(declare-fun b!759213 () Bool)

(assert (=> b!759213 (= e!423331 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20116 a!3186) j!159) a!3186 mask!3328) lt!338200))))

(declare-fun b!759214 () Bool)

(assert (=> b!759214 (= e!423336 (not e!423329))))

(declare-fun res!513410 () Bool)

(assert (=> b!759214 (=> res!513410 e!423329)))

(get-info :version)

(assert (=> b!759214 (= res!513410 (or (not ((_ is Intermediate!7672) lt!338201)) (bvslt x!1131 (x!64106 lt!338201)) (not (= x!1131 (x!64106 lt!338201))) (not (= index!1321 (index!33058 lt!338201)))))))

(assert (=> b!759214 e!423339))

(declare-fun res!513415 () Bool)

(assert (=> b!759214 (=> (not res!513415) (not e!423339))))

(assert (=> b!759214 (= res!513415 (= lt!338197 lt!338194))))

(assert (=> b!759214 (= lt!338194 (Found!7672 j!159))))

(assert (=> b!759214 (= lt!338197 (seekEntryOrOpen!0 (select (arr!20116 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!759214 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!338193 () Unit!26245)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42013 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26245)

(assert (=> b!759214 (= lt!338193 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!759215 () Bool)

(assert (=> b!759215 (= e!423332 e!423334)))

(declare-fun res!513423 () Bool)

(assert (=> b!759215 (=> res!513423 e!423334)))

(assert (=> b!759215 (= res!513423 (= lt!338192 lt!338195))))

(assert (=> b!759215 (= lt!338192 (select (store (arr!20116 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!759216 () Bool)

(declare-fun Unit!26248 () Unit!26245)

(assert (=> b!759216 (= e!423335 Unit!26248)))

(assert (=> b!759216 false))

(declare-fun b!759217 () Bool)

(declare-fun res!513418 () Bool)

(assert (=> b!759217 (=> (not res!513418) (not e!423330))))

(assert (=> b!759217 (= res!513418 (validKeyInArray!0 (select (arr!20116 a!3186) j!159)))))

(assert (= (and start!65970 res!513414) b!759206))

(assert (= (and b!759206 res!513421) b!759217))

(assert (= (and b!759217 res!513418) b!759207))

(assert (= (and b!759207 res!513411) b!759210))

(assert (= (and b!759210 res!513424) b!759208))

(assert (= (and b!759208 res!513417) b!759205))

(assert (= (and b!759205 res!513409) b!759199))

(assert (= (and b!759199 res!513419) b!759196))

(assert (= (and b!759196 res!513416) b!759211))

(assert (= (and b!759211 res!513408) b!759209))

(assert (= (and b!759209 res!513420) b!759197))

(assert (= (and b!759197 c!83278) b!759213))

(assert (= (and b!759197 (not c!83278)) b!759198))

(assert (= (and b!759197 res!513413) b!759204))

(assert (= (and b!759204 res!513412) b!759214))

(assert (= (and b!759214 res!513415) b!759212))

(assert (= (and b!759214 (not res!513410)) b!759203))

(assert (= (and b!759203 (not res!513422)) b!759215))

(assert (= (and b!759215 (not res!513423)) b!759202))

(assert (= (and b!759202 c!83279) b!759216))

(assert (= (and b!759202 (not c!83279)) b!759201))

(assert (= (and b!759202 (not res!513407)) b!759200))

(declare-fun m!707091 () Bool)

(assert (=> b!759200 m!707091))

(declare-fun m!707093 () Bool)

(assert (=> b!759202 m!707093))

(declare-fun m!707095 () Bool)

(assert (=> b!759202 m!707095))

(declare-fun m!707097 () Bool)

(assert (=> b!759202 m!707097))

(declare-fun m!707099 () Bool)

(assert (=> b!759198 m!707099))

(assert (=> b!759198 m!707099))

(declare-fun m!707101 () Bool)

(assert (=> b!759198 m!707101))

(assert (=> b!759203 m!707099))

(assert (=> b!759203 m!707099))

(assert (=> b!759203 m!707101))

(assert (=> b!759212 m!707099))

(assert (=> b!759212 m!707099))

(declare-fun m!707103 () Bool)

(assert (=> b!759212 m!707103))

(declare-fun m!707105 () Bool)

(assert (=> start!65970 m!707105))

(declare-fun m!707107 () Bool)

(assert (=> start!65970 m!707107))

(declare-fun m!707109 () Bool)

(assert (=> b!759209 m!707109))

(declare-fun m!707111 () Bool)

(assert (=> b!759205 m!707111))

(declare-fun m!707113 () Bool)

(assert (=> b!759204 m!707113))

(declare-fun m!707115 () Bool)

(assert (=> b!759204 m!707115))

(declare-fun m!707117 () Bool)

(assert (=> b!759204 m!707117))

(declare-fun m!707119 () Bool)

(assert (=> b!759204 m!707119))

(assert (=> b!759204 m!707119))

(declare-fun m!707121 () Bool)

(assert (=> b!759204 m!707121))

(assert (=> b!759217 m!707099))

(assert (=> b!759217 m!707099))

(declare-fun m!707123 () Bool)

(assert (=> b!759217 m!707123))

(assert (=> b!759213 m!707099))

(assert (=> b!759213 m!707099))

(declare-fun m!707125 () Bool)

(assert (=> b!759213 m!707125))

(assert (=> b!759211 m!707099))

(assert (=> b!759211 m!707099))

(declare-fun m!707127 () Bool)

(assert (=> b!759211 m!707127))

(assert (=> b!759211 m!707127))

(assert (=> b!759211 m!707099))

(declare-fun m!707129 () Bool)

(assert (=> b!759211 m!707129))

(declare-fun m!707131 () Bool)

(assert (=> b!759207 m!707131))

(assert (=> b!759214 m!707099))

(assert (=> b!759214 m!707099))

(declare-fun m!707133 () Bool)

(assert (=> b!759214 m!707133))

(declare-fun m!707135 () Bool)

(assert (=> b!759214 m!707135))

(declare-fun m!707137 () Bool)

(assert (=> b!759214 m!707137))

(declare-fun m!707139 () Bool)

(assert (=> b!759208 m!707139))

(declare-fun m!707141 () Bool)

(assert (=> b!759210 m!707141))

(assert (=> b!759215 m!707113))

(declare-fun m!707143 () Bool)

(assert (=> b!759215 m!707143))

(declare-fun m!707145 () Bool)

(assert (=> b!759199 m!707145))

(check-sat (not b!759198) (not b!759212) (not b!759210) (not b!759202) (not b!759205) (not b!759200) (not b!759203) (not b!759199) (not b!759214) (not b!759207) (not start!65970) (not b!759208) (not b!759217) (not b!759213) (not b!759204) (not b!759211))
(check-sat)

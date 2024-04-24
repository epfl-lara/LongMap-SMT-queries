; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64860 () Bool)

(assert start!64860)

(declare-fun b!731267 () Bool)

(declare-fun res!491124 () Bool)

(declare-fun e!409285 () Bool)

(assert (=> b!731267 (=> (not res!491124) (not e!409285))))

(declare-datatypes ((array!41179 0))(
  ( (array!41180 (arr!19705 (Array (_ BitVec 32) (_ BitVec 64))) (size!20125 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41179)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!731267 (= res!491124 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19705 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!731268 () Bool)

(declare-fun e!409287 () Bool)

(declare-fun e!409289 () Bool)

(assert (=> b!731268 (= e!409287 e!409289)))

(declare-fun res!491117 () Bool)

(assert (=> b!731268 (=> (not res!491117) (not e!409289))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7261 0))(
  ( (MissingZero!7261 (index!31412 (_ BitVec 32))) (Found!7261 (index!31413 (_ BitVec 32))) (Intermediate!7261 (undefined!8073 Bool) (index!31414 (_ BitVec 32)) (x!62551 (_ BitVec 32))) (Undefined!7261) (MissingVacant!7261 (index!31415 (_ BitVec 32))) )
))
(declare-fun lt!324022 () SeekEntryResult!7261)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41179 (_ BitVec 32)) SeekEntryResult!7261)

(assert (=> b!731268 (= res!491117 (= (seekEntryOrOpen!0 (select (arr!19705 a!3186) j!159) a!3186 mask!3328) lt!324022))))

(assert (=> b!731268 (= lt!324022 (Found!7261 j!159))))

(declare-fun b!731269 () Bool)

(declare-fun e!409288 () Bool)

(assert (=> b!731269 (= e!409288 e!409285)))

(declare-fun res!491111 () Bool)

(assert (=> b!731269 (=> (not res!491111) (not e!409285))))

(declare-fun lt!324017 () SeekEntryResult!7261)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41179 (_ BitVec 32)) SeekEntryResult!7261)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!731269 (= res!491111 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19705 a!3186) j!159) mask!3328) (select (arr!19705 a!3186) j!159) a!3186 mask!3328) lt!324017))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!731269 (= lt!324017 (Intermediate!7261 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun e!409290 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!731270 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41179 (_ BitVec 32)) SeekEntryResult!7261)

(assert (=> b!731270 (= e!409290 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19705 a!3186) j!159) a!3186 mask!3328) (Found!7261 j!159)))))

(declare-fun b!731272 () Bool)

(declare-fun e!409283 () Bool)

(assert (=> b!731272 (= e!409283 true)))

(declare-fun lt!324024 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!731272 (= lt!324024 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!731273 () Bool)

(declare-fun res!491125 () Bool)

(declare-fun e!409286 () Bool)

(assert (=> b!731273 (=> (not res!491125) (not e!409286))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!731273 (= res!491125 (validKeyInArray!0 (select (arr!19705 a!3186) j!159)))))

(declare-fun b!731274 () Bool)

(declare-fun res!491119 () Bool)

(assert (=> b!731274 (=> (not res!491119) (not e!409288))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41179 (_ BitVec 32)) Bool)

(assert (=> b!731274 (= res!491119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!731275 () Bool)

(declare-fun res!491115 () Bool)

(assert (=> b!731275 (=> (not res!491115) (not e!409286))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41179 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!731275 (= res!491115 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!731276 () Bool)

(declare-fun res!491110 () Bool)

(assert (=> b!731276 (=> (not res!491110) (not e!409286))))

(assert (=> b!731276 (= res!491110 (validKeyInArray!0 k0!2102))))

(declare-fun b!731277 () Bool)

(assert (=> b!731277 (= e!409290 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19705 a!3186) j!159) a!3186 mask!3328) lt!324017))))

(declare-fun b!731278 () Bool)

(declare-fun res!491113 () Bool)

(assert (=> b!731278 (=> (not res!491113) (not e!409288))))

(assert (=> b!731278 (= res!491113 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20125 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20125 a!3186))))))

(declare-fun b!731279 () Bool)

(declare-fun res!491112 () Bool)

(assert (=> b!731279 (=> (not res!491112) (not e!409288))))

(declare-datatypes ((List!13614 0))(
  ( (Nil!13611) (Cons!13610 (h!14676 (_ BitVec 64)) (t!19921 List!13614)) )
))
(declare-fun arrayNoDuplicates!0 (array!41179 (_ BitVec 32) List!13614) Bool)

(assert (=> b!731279 (= res!491112 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13611))))

(declare-fun b!731280 () Bool)

(declare-fun e!409282 () Bool)

(assert (=> b!731280 (= e!409282 (not e!409283))))

(declare-fun res!491116 () Bool)

(assert (=> b!731280 (=> res!491116 e!409283)))

(declare-fun lt!324021 () SeekEntryResult!7261)

(get-info :version)

(assert (=> b!731280 (= res!491116 (or (not ((_ is Intermediate!7261) lt!324021)) (bvsge x!1131 (x!62551 lt!324021))))))

(assert (=> b!731280 e!409287))

(declare-fun res!491121 () Bool)

(assert (=> b!731280 (=> (not res!491121) (not e!409287))))

(assert (=> b!731280 (= res!491121 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24919 0))(
  ( (Unit!24920) )
))
(declare-fun lt!324020 () Unit!24919)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41179 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24919)

(assert (=> b!731280 (= lt!324020 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!731281 () Bool)

(assert (=> b!731281 (= e!409286 e!409288)))

(declare-fun res!491118 () Bool)

(assert (=> b!731281 (=> (not res!491118) (not e!409288))))

(declare-fun lt!324023 () SeekEntryResult!7261)

(assert (=> b!731281 (= res!491118 (or (= lt!324023 (MissingZero!7261 i!1173)) (= lt!324023 (MissingVacant!7261 i!1173))))))

(assert (=> b!731281 (= lt!324023 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!731282 () Bool)

(declare-fun res!491122 () Bool)

(assert (=> b!731282 (=> (not res!491122) (not e!409286))))

(assert (=> b!731282 (= res!491122 (and (= (size!20125 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20125 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20125 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!731283 () Bool)

(assert (=> b!731283 (= e!409285 e!409282)))

(declare-fun res!491114 () Bool)

(assert (=> b!731283 (=> (not res!491114) (not e!409282))))

(declare-fun lt!324019 () SeekEntryResult!7261)

(assert (=> b!731283 (= res!491114 (= lt!324019 lt!324021))))

(declare-fun lt!324016 () array!41179)

(declare-fun lt!324018 () (_ BitVec 64))

(assert (=> b!731283 (= lt!324021 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!324018 lt!324016 mask!3328))))

(assert (=> b!731283 (= lt!324019 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!324018 mask!3328) lt!324018 lt!324016 mask!3328))))

(assert (=> b!731283 (= lt!324018 (select (store (arr!19705 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!731283 (= lt!324016 (array!41180 (store (arr!19705 a!3186) i!1173 k0!2102) (size!20125 a!3186)))))

(declare-fun b!731284 () Bool)

(assert (=> b!731284 (= e!409289 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19705 a!3186) j!159) a!3186 mask!3328) lt!324022))))

(declare-fun res!491120 () Bool)

(assert (=> start!64860 (=> (not res!491120) (not e!409286))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64860 (= res!491120 (validMask!0 mask!3328))))

(assert (=> start!64860 e!409286))

(assert (=> start!64860 true))

(declare-fun array_inv!15564 (array!41179) Bool)

(assert (=> start!64860 (array_inv!15564 a!3186)))

(declare-fun b!731271 () Bool)

(declare-fun res!491123 () Bool)

(assert (=> b!731271 (=> (not res!491123) (not e!409285))))

(assert (=> b!731271 (= res!491123 e!409290)))

(declare-fun c!80456 () Bool)

(assert (=> b!731271 (= c!80456 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!64860 res!491120) b!731282))

(assert (= (and b!731282 res!491122) b!731273))

(assert (= (and b!731273 res!491125) b!731276))

(assert (= (and b!731276 res!491110) b!731275))

(assert (= (and b!731275 res!491115) b!731281))

(assert (= (and b!731281 res!491118) b!731274))

(assert (= (and b!731274 res!491119) b!731279))

(assert (= (and b!731279 res!491112) b!731278))

(assert (= (and b!731278 res!491113) b!731269))

(assert (= (and b!731269 res!491111) b!731267))

(assert (= (and b!731267 res!491124) b!731271))

(assert (= (and b!731271 c!80456) b!731277))

(assert (= (and b!731271 (not c!80456)) b!731270))

(assert (= (and b!731271 res!491123) b!731283))

(assert (= (and b!731283 res!491114) b!731280))

(assert (= (and b!731280 res!491121) b!731268))

(assert (= (and b!731268 res!491117) b!731284))

(assert (= (and b!731280 (not res!491116)) b!731272))

(declare-fun m!685179 () Bool)

(assert (=> b!731268 m!685179))

(assert (=> b!731268 m!685179))

(declare-fun m!685181 () Bool)

(assert (=> b!731268 m!685181))

(assert (=> b!731273 m!685179))

(assert (=> b!731273 m!685179))

(declare-fun m!685183 () Bool)

(assert (=> b!731273 m!685183))

(declare-fun m!685185 () Bool)

(assert (=> b!731272 m!685185))

(assert (=> b!731284 m!685179))

(assert (=> b!731284 m!685179))

(declare-fun m!685187 () Bool)

(assert (=> b!731284 m!685187))

(declare-fun m!685189 () Bool)

(assert (=> b!731274 m!685189))

(declare-fun m!685191 () Bool)

(assert (=> b!731281 m!685191))

(declare-fun m!685193 () Bool)

(assert (=> b!731267 m!685193))

(declare-fun m!685195 () Bool)

(assert (=> b!731276 m!685195))

(declare-fun m!685197 () Bool)

(assert (=> b!731283 m!685197))

(declare-fun m!685199 () Bool)

(assert (=> b!731283 m!685199))

(declare-fun m!685201 () Bool)

(assert (=> b!731283 m!685201))

(declare-fun m!685203 () Bool)

(assert (=> b!731283 m!685203))

(declare-fun m!685205 () Bool)

(assert (=> b!731283 m!685205))

(assert (=> b!731283 m!685201))

(declare-fun m!685207 () Bool)

(assert (=> start!64860 m!685207))

(declare-fun m!685209 () Bool)

(assert (=> start!64860 m!685209))

(assert (=> b!731269 m!685179))

(assert (=> b!731269 m!685179))

(declare-fun m!685211 () Bool)

(assert (=> b!731269 m!685211))

(assert (=> b!731269 m!685211))

(assert (=> b!731269 m!685179))

(declare-fun m!685213 () Bool)

(assert (=> b!731269 m!685213))

(declare-fun m!685215 () Bool)

(assert (=> b!731275 m!685215))

(declare-fun m!685217 () Bool)

(assert (=> b!731280 m!685217))

(declare-fun m!685219 () Bool)

(assert (=> b!731280 m!685219))

(declare-fun m!685221 () Bool)

(assert (=> b!731279 m!685221))

(assert (=> b!731270 m!685179))

(assert (=> b!731270 m!685179))

(declare-fun m!685223 () Bool)

(assert (=> b!731270 m!685223))

(assert (=> b!731277 m!685179))

(assert (=> b!731277 m!685179))

(declare-fun m!685225 () Bool)

(assert (=> b!731277 m!685225))

(check-sat (not b!731283) (not b!731276) (not b!731281) (not start!64860) (not b!731272) (not b!731269) (not b!731275) (not b!731274) (not b!731270) (not b!731268) (not b!731284) (not b!731279) (not b!731273) (not b!731280) (not b!731277))
(check-sat)

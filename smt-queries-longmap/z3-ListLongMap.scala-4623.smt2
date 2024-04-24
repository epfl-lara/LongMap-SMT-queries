; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64434 () Bool)

(assert start!64434)

(declare-fun b!724225 () Bool)

(declare-fun res!485592 () Bool)

(declare-fun e!405725 () Bool)

(assert (=> b!724225 (=> (not res!485592) (not e!405725))))

(declare-fun e!405729 () Bool)

(assert (=> b!724225 (= res!485592 e!405729)))

(declare-fun c!79691 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!724225 (= c!79691 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!724226 () Bool)

(declare-fun res!485595 () Bool)

(declare-fun e!405728 () Bool)

(assert (=> b!724226 (=> (not res!485595) (not e!405728))))

(declare-datatypes ((array!40948 0))(
  ( (array!40949 (arr!19594 (Array (_ BitVec 32) (_ BitVec 64))) (size!20014 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40948)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40948 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!724226 (= res!485595 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!724227 () Bool)

(declare-fun res!485599 () Bool)

(assert (=> b!724227 (=> (not res!485599) (not e!405728))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!724227 (= res!485599 (validKeyInArray!0 (select (arr!19594 a!3186) j!159)))))

(declare-fun res!485602 () Bool)

(assert (=> start!64434 (=> (not res!485602) (not e!405728))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64434 (= res!485602 (validMask!0 mask!3328))))

(assert (=> start!64434 e!405728))

(assert (=> start!64434 true))

(declare-fun array_inv!15453 (array!40948) Bool)

(assert (=> start!64434 (array_inv!15453 a!3186)))

(declare-fun b!724228 () Bool)

(declare-fun e!405727 () Bool)

(declare-datatypes ((SeekEntryResult!7150 0))(
  ( (MissingZero!7150 (index!30968 (_ BitVec 32))) (Found!7150 (index!30969 (_ BitVec 32))) (Intermediate!7150 (undefined!7962 Bool) (index!30970 (_ BitVec 32)) (x!62114 (_ BitVec 32))) (Undefined!7150) (MissingVacant!7150 (index!30971 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40948 (_ BitVec 32)) SeekEntryResult!7150)

(assert (=> b!724228 (= e!405727 (= (seekEntryOrOpen!0 (select (arr!19594 a!3186) j!159) a!3186 mask!3328) (Found!7150 j!159)))))

(declare-fun b!724229 () Bool)

(declare-fun e!405724 () Bool)

(assert (=> b!724229 (= e!405725 e!405724)))

(declare-fun res!485591 () Bool)

(assert (=> b!724229 (=> (not res!485591) (not e!405724))))

(declare-fun lt!320945 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!320949 () array!40948)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40948 (_ BitVec 32)) SeekEntryResult!7150)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!724229 (= res!485591 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320945 mask!3328) lt!320945 lt!320949 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320945 lt!320949 mask!3328)))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!724229 (= lt!320945 (select (store (arr!19594 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!724229 (= lt!320949 (array!40949 (store (arr!19594 a!3186) i!1173 k0!2102) (size!20014 a!3186)))))

(declare-fun b!724230 () Bool)

(declare-fun res!485594 () Bool)

(declare-fun e!405726 () Bool)

(assert (=> b!724230 (=> (not res!485594) (not e!405726))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40948 (_ BitVec 32)) Bool)

(assert (=> b!724230 (= res!485594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!724231 () Bool)

(declare-fun res!485590 () Bool)

(assert (=> b!724231 (=> (not res!485590) (not e!405728))))

(assert (=> b!724231 (= res!485590 (validKeyInArray!0 k0!2102))))

(declare-fun b!724232 () Bool)

(assert (=> b!724232 (= e!405724 (not true))))

(assert (=> b!724232 e!405727))

(declare-fun res!485600 () Bool)

(assert (=> b!724232 (=> (not res!485600) (not e!405727))))

(assert (=> b!724232 (= res!485600 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24697 0))(
  ( (Unit!24698) )
))
(declare-fun lt!320948 () Unit!24697)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40948 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24697)

(assert (=> b!724232 (= lt!320948 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!724233 () Bool)

(assert (=> b!724233 (= e!405728 e!405726)))

(declare-fun res!485598 () Bool)

(assert (=> b!724233 (=> (not res!485598) (not e!405726))))

(declare-fun lt!320947 () SeekEntryResult!7150)

(assert (=> b!724233 (= res!485598 (or (= lt!320947 (MissingZero!7150 i!1173)) (= lt!320947 (MissingVacant!7150 i!1173))))))

(assert (=> b!724233 (= lt!320947 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!724234 () Bool)

(declare-fun res!485596 () Bool)

(assert (=> b!724234 (=> (not res!485596) (not e!405726))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!724234 (= res!485596 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20014 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20014 a!3186))))))

(declare-fun b!724235 () Bool)

(declare-fun res!485597 () Bool)

(assert (=> b!724235 (=> (not res!485597) (not e!405726))))

(declare-datatypes ((List!13503 0))(
  ( (Nil!13500) (Cons!13499 (h!14556 (_ BitVec 64)) (t!19810 List!13503)) )
))
(declare-fun arrayNoDuplicates!0 (array!40948 (_ BitVec 32) List!13503) Bool)

(assert (=> b!724235 (= res!485597 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13500))))

(declare-fun b!724236 () Bool)

(declare-fun res!485593 () Bool)

(assert (=> b!724236 (=> (not res!485593) (not e!405728))))

(assert (=> b!724236 (= res!485593 (and (= (size!20014 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20014 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20014 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!724237 () Bool)

(declare-fun res!485601 () Bool)

(assert (=> b!724237 (=> (not res!485601) (not e!405725))))

(assert (=> b!724237 (= res!485601 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19594 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!724238 () Bool)

(assert (=> b!724238 (= e!405726 e!405725)))

(declare-fun res!485589 () Bool)

(assert (=> b!724238 (=> (not res!485589) (not e!405725))))

(declare-fun lt!320946 () SeekEntryResult!7150)

(assert (=> b!724238 (= res!485589 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19594 a!3186) j!159) mask!3328) (select (arr!19594 a!3186) j!159) a!3186 mask!3328) lt!320946))))

(assert (=> b!724238 (= lt!320946 (Intermediate!7150 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!724239 () Bool)

(assert (=> b!724239 (= e!405729 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19594 a!3186) j!159) a!3186 mask!3328) lt!320946))))

(declare-fun b!724240 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40948 (_ BitVec 32)) SeekEntryResult!7150)

(assert (=> b!724240 (= e!405729 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19594 a!3186) j!159) a!3186 mask!3328) (Found!7150 j!159)))))

(assert (= (and start!64434 res!485602) b!724236))

(assert (= (and b!724236 res!485593) b!724227))

(assert (= (and b!724227 res!485599) b!724231))

(assert (= (and b!724231 res!485590) b!724226))

(assert (= (and b!724226 res!485595) b!724233))

(assert (= (and b!724233 res!485598) b!724230))

(assert (= (and b!724230 res!485594) b!724235))

(assert (= (and b!724235 res!485597) b!724234))

(assert (= (and b!724234 res!485596) b!724238))

(assert (= (and b!724238 res!485589) b!724237))

(assert (= (and b!724237 res!485601) b!724225))

(assert (= (and b!724225 c!79691) b!724239))

(assert (= (and b!724225 (not c!79691)) b!724240))

(assert (= (and b!724225 res!485592) b!724229))

(assert (= (and b!724229 res!485591) b!724232))

(assert (= (and b!724232 res!485600) b!724228))

(declare-fun m!679149 () Bool)

(assert (=> b!724232 m!679149))

(declare-fun m!679151 () Bool)

(assert (=> b!724232 m!679151))

(declare-fun m!679153 () Bool)

(assert (=> b!724231 m!679153))

(declare-fun m!679155 () Bool)

(assert (=> b!724226 m!679155))

(declare-fun m!679157 () Bool)

(assert (=> b!724230 m!679157))

(declare-fun m!679159 () Bool)

(assert (=> b!724238 m!679159))

(assert (=> b!724238 m!679159))

(declare-fun m!679161 () Bool)

(assert (=> b!724238 m!679161))

(assert (=> b!724238 m!679161))

(assert (=> b!724238 m!679159))

(declare-fun m!679163 () Bool)

(assert (=> b!724238 m!679163))

(declare-fun m!679165 () Bool)

(assert (=> start!64434 m!679165))

(declare-fun m!679167 () Bool)

(assert (=> start!64434 m!679167))

(declare-fun m!679169 () Bool)

(assert (=> b!724237 m!679169))

(assert (=> b!724227 m!679159))

(assert (=> b!724227 m!679159))

(declare-fun m!679171 () Bool)

(assert (=> b!724227 m!679171))

(assert (=> b!724239 m!679159))

(assert (=> b!724239 m!679159))

(declare-fun m!679173 () Bool)

(assert (=> b!724239 m!679173))

(declare-fun m!679175 () Bool)

(assert (=> b!724235 m!679175))

(assert (=> b!724240 m!679159))

(assert (=> b!724240 m!679159))

(declare-fun m!679177 () Bool)

(assert (=> b!724240 m!679177))

(declare-fun m!679179 () Bool)

(assert (=> b!724233 m!679179))

(assert (=> b!724228 m!679159))

(assert (=> b!724228 m!679159))

(declare-fun m!679181 () Bool)

(assert (=> b!724228 m!679181))

(declare-fun m!679183 () Bool)

(assert (=> b!724229 m!679183))

(declare-fun m!679185 () Bool)

(assert (=> b!724229 m!679185))

(assert (=> b!724229 m!679185))

(declare-fun m!679187 () Bool)

(assert (=> b!724229 m!679187))

(declare-fun m!679189 () Bool)

(assert (=> b!724229 m!679189))

(declare-fun m!679191 () Bool)

(assert (=> b!724229 m!679191))

(check-sat (not b!724226) (not b!724233) (not b!724228) (not b!724229) (not b!724239) (not b!724238) (not b!724231) (not b!724240) (not start!64434) (not b!724235) (not b!724232) (not b!724227) (not b!724230))
(check-sat)

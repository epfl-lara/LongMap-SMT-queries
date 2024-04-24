; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65070 () Bool)

(assert start!65070)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41251 0))(
  ( (array!41252 (arr!19738 (Array (_ BitVec 32) (_ BitVec 64))) (size!20158 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41251)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7294 0))(
  ( (MissingZero!7294 (index!31544 (_ BitVec 32))) (Found!7294 (index!31545 (_ BitVec 32))) (Intermediate!7294 (undefined!8106 Bool) (index!31546 (_ BitVec 32)) (x!62696 (_ BitVec 32))) (Undefined!7294) (MissingVacant!7294 (index!31547 (_ BitVec 32))) )
))
(declare-fun lt!325303 () SeekEntryResult!7294)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!734020 () Bool)

(declare-fun e!410773 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41251 (_ BitVec 32)) SeekEntryResult!7294)

(assert (=> b!734020 (= e!410773 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19738 a!3186) j!159) a!3186 mask!3328) lt!325303))))

(declare-fun b!734021 () Bool)

(declare-fun res!493083 () Bool)

(declare-fun e!410770 () Bool)

(assert (=> b!734021 (=> (not res!493083) (not e!410770))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41251 (_ BitVec 32)) Bool)

(assert (=> b!734021 (= res!493083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!734022 () Bool)

(declare-fun e!410778 () Bool)

(assert (=> b!734022 (= e!410770 e!410778)))

(declare-fun res!493098 () Bool)

(assert (=> b!734022 (=> (not res!493098) (not e!410778))))

(declare-fun lt!325307 () SeekEntryResult!7294)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41251 (_ BitVec 32)) SeekEntryResult!7294)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!734022 (= res!493098 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19738 a!3186) j!159) mask!3328) (select (arr!19738 a!3186) j!159) a!3186 mask!3328) lt!325307))))

(assert (=> b!734022 (= lt!325307 (Intermediate!7294 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!734023 () Bool)

(declare-fun e!410777 () Bool)

(assert (=> b!734023 (= e!410778 e!410777)))

(declare-fun res!493089 () Bool)

(assert (=> b!734023 (=> (not res!493089) (not e!410777))))

(declare-fun lt!325305 () SeekEntryResult!7294)

(declare-fun lt!325306 () SeekEntryResult!7294)

(assert (=> b!734023 (= res!493089 (= lt!325305 lt!325306))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!325310 () array!41251)

(declare-fun lt!325302 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!734023 (= lt!325306 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!325302 lt!325310 mask!3328))))

(assert (=> b!734023 (= lt!325305 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!325302 mask!3328) lt!325302 lt!325310 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!734023 (= lt!325302 (select (store (arr!19738 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!734023 (= lt!325310 (array!41252 (store (arr!19738 a!3186) i!1173 k0!2102) (size!20158 a!3186)))))

(declare-fun b!734024 () Bool)

(declare-fun res!493092 () Bool)

(declare-fun e!410776 () Bool)

(assert (=> b!734024 (=> (not res!493092) (not e!410776))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!734024 (= res!493092 (validKeyInArray!0 (select (arr!19738 a!3186) j!159)))))

(declare-fun b!734025 () Bool)

(assert (=> b!734025 (= e!410776 e!410770)))

(declare-fun res!493086 () Bool)

(assert (=> b!734025 (=> (not res!493086) (not e!410770))))

(declare-fun lt!325304 () SeekEntryResult!7294)

(assert (=> b!734025 (= res!493086 (or (= lt!325304 (MissingZero!7294 i!1173)) (= lt!325304 (MissingVacant!7294 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41251 (_ BitVec 32)) SeekEntryResult!7294)

(assert (=> b!734025 (= lt!325304 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!734026 () Bool)

(declare-fun res!493093 () Bool)

(assert (=> b!734026 (=> (not res!493093) (not e!410778))))

(assert (=> b!734026 (= res!493093 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19738 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!734027 () Bool)

(declare-fun e!410774 () Bool)

(assert (=> b!734027 (= e!410774 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19738 a!3186) j!159) a!3186 mask!3328) (Found!7294 j!159)))))

(declare-fun res!493088 () Bool)

(assert (=> start!65070 (=> (not res!493088) (not e!410776))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65070 (= res!493088 (validMask!0 mask!3328))))

(assert (=> start!65070 e!410776))

(assert (=> start!65070 true))

(declare-fun array_inv!15597 (array!41251) Bool)

(assert (=> start!65070 (array_inv!15597 a!3186)))

(declare-fun b!734028 () Bool)

(declare-fun res!493091 () Bool)

(assert (=> b!734028 (=> (not res!493091) (not e!410776))))

(assert (=> b!734028 (= res!493091 (and (= (size!20158 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20158 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20158 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!734029 () Bool)

(declare-fun res!493090 () Bool)

(assert (=> b!734029 (=> (not res!493090) (not e!410778))))

(assert (=> b!734029 (= res!493090 e!410774)))

(declare-fun c!80849 () Bool)

(assert (=> b!734029 (= c!80849 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!734030 () Bool)

(declare-fun e!410772 () Bool)

(assert (=> b!734030 (= e!410772 e!410773)))

(declare-fun res!493096 () Bool)

(assert (=> b!734030 (=> (not res!493096) (not e!410773))))

(assert (=> b!734030 (= res!493096 (= (seekEntryOrOpen!0 (select (arr!19738 a!3186) j!159) a!3186 mask!3328) lt!325303))))

(assert (=> b!734030 (= lt!325303 (Found!7294 j!159))))

(declare-fun b!734031 () Bool)

(declare-fun res!493087 () Bool)

(assert (=> b!734031 (=> (not res!493087) (not e!410770))))

(declare-datatypes ((List!13647 0))(
  ( (Nil!13644) (Cons!13643 (h!14715 (_ BitVec 64)) (t!19954 List!13647)) )
))
(declare-fun arrayNoDuplicates!0 (array!41251 (_ BitVec 32) List!13647) Bool)

(assert (=> b!734031 (= res!493087 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13644))))

(declare-fun b!734032 () Bool)

(declare-fun res!493094 () Bool)

(assert (=> b!734032 (=> (not res!493094) (not e!410770))))

(assert (=> b!734032 (= res!493094 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20158 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20158 a!3186))))))

(declare-fun b!734033 () Bool)

(assert (=> b!734033 (= e!410774 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19738 a!3186) j!159) a!3186 mask!3328) lt!325307))))

(declare-fun b!734034 () Bool)

(declare-fun e!410769 () Bool)

(assert (=> b!734034 (= e!410777 (not e!410769))))

(declare-fun res!493085 () Bool)

(assert (=> b!734034 (=> res!493085 e!410769)))

(get-info :version)

(assert (=> b!734034 (= res!493085 (or (not ((_ is Intermediate!7294) lt!325306)) (bvsge x!1131 (x!62696 lt!325306))))))

(assert (=> b!734034 e!410772))

(declare-fun res!493084 () Bool)

(assert (=> b!734034 (=> (not res!493084) (not e!410772))))

(assert (=> b!734034 (= res!493084 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24985 0))(
  ( (Unit!24986) )
))
(declare-fun lt!325309 () Unit!24985)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41251 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24985)

(assert (=> b!734034 (= lt!325309 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!734035 () Bool)

(declare-fun e!410771 () Bool)

(assert (=> b!734035 (= e!410769 e!410771)))

(declare-fun res!493095 () Bool)

(assert (=> b!734035 (=> res!493095 e!410771)))

(assert (=> b!734035 (= res!493095 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!325311 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!734035 (= lt!325311 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!734036 () Bool)

(assert (=> b!734036 (= e!410771 true)))

(declare-fun lt!325308 () SeekEntryResult!7294)

(assert (=> b!734036 (= lt!325308 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19738 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!734037 () Bool)

(declare-fun res!493099 () Bool)

(assert (=> b!734037 (=> (not res!493099) (not e!410776))))

(declare-fun arrayContainsKey!0 (array!41251 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!734037 (= res!493099 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!734038 () Bool)

(declare-fun res!493097 () Bool)

(assert (=> b!734038 (=> (not res!493097) (not e!410776))))

(assert (=> b!734038 (= res!493097 (validKeyInArray!0 k0!2102))))

(assert (= (and start!65070 res!493088) b!734028))

(assert (= (and b!734028 res!493091) b!734024))

(assert (= (and b!734024 res!493092) b!734038))

(assert (= (and b!734038 res!493097) b!734037))

(assert (= (and b!734037 res!493099) b!734025))

(assert (= (and b!734025 res!493086) b!734021))

(assert (= (and b!734021 res!493083) b!734031))

(assert (= (and b!734031 res!493087) b!734032))

(assert (= (and b!734032 res!493094) b!734022))

(assert (= (and b!734022 res!493098) b!734026))

(assert (= (and b!734026 res!493093) b!734029))

(assert (= (and b!734029 c!80849) b!734033))

(assert (= (and b!734029 (not c!80849)) b!734027))

(assert (= (and b!734029 res!493090) b!734023))

(assert (= (and b!734023 res!493089) b!734034))

(assert (= (and b!734034 res!493084) b!734030))

(assert (= (and b!734030 res!493096) b!734020))

(assert (= (and b!734034 (not res!493085)) b!734035))

(assert (= (and b!734035 (not res!493095)) b!734036))

(declare-fun m!687339 () Bool)

(assert (=> b!734031 m!687339))

(declare-fun m!687341 () Bool)

(assert (=> b!734020 m!687341))

(assert (=> b!734020 m!687341))

(declare-fun m!687343 () Bool)

(assert (=> b!734020 m!687343))

(declare-fun m!687345 () Bool)

(assert (=> b!734023 m!687345))

(declare-fun m!687347 () Bool)

(assert (=> b!734023 m!687347))

(declare-fun m!687349 () Bool)

(assert (=> b!734023 m!687349))

(declare-fun m!687351 () Bool)

(assert (=> b!734023 m!687351))

(assert (=> b!734023 m!687345))

(declare-fun m!687353 () Bool)

(assert (=> b!734023 m!687353))

(declare-fun m!687355 () Bool)

(assert (=> b!734026 m!687355))

(declare-fun m!687357 () Bool)

(assert (=> b!734037 m!687357))

(assert (=> b!734027 m!687341))

(assert (=> b!734027 m!687341))

(declare-fun m!687359 () Bool)

(assert (=> b!734027 m!687359))

(declare-fun m!687361 () Bool)

(assert (=> b!734025 m!687361))

(declare-fun m!687363 () Bool)

(assert (=> b!734035 m!687363))

(assert (=> b!734024 m!687341))

(assert (=> b!734024 m!687341))

(declare-fun m!687365 () Bool)

(assert (=> b!734024 m!687365))

(assert (=> b!734022 m!687341))

(assert (=> b!734022 m!687341))

(declare-fun m!687367 () Bool)

(assert (=> b!734022 m!687367))

(assert (=> b!734022 m!687367))

(assert (=> b!734022 m!687341))

(declare-fun m!687369 () Bool)

(assert (=> b!734022 m!687369))

(assert (=> b!734036 m!687341))

(assert (=> b!734036 m!687341))

(assert (=> b!734036 m!687359))

(declare-fun m!687371 () Bool)

(assert (=> b!734038 m!687371))

(assert (=> b!734030 m!687341))

(assert (=> b!734030 m!687341))

(declare-fun m!687373 () Bool)

(assert (=> b!734030 m!687373))

(declare-fun m!687375 () Bool)

(assert (=> start!65070 m!687375))

(declare-fun m!687377 () Bool)

(assert (=> start!65070 m!687377))

(assert (=> b!734033 m!687341))

(assert (=> b!734033 m!687341))

(declare-fun m!687379 () Bool)

(assert (=> b!734033 m!687379))

(declare-fun m!687381 () Bool)

(assert (=> b!734021 m!687381))

(declare-fun m!687383 () Bool)

(assert (=> b!734034 m!687383))

(declare-fun m!687385 () Bool)

(assert (=> b!734034 m!687385))

(check-sat (not b!734024) (not b!734022) (not b!734038) (not b!734025) (not b!734030) (not start!65070) (not b!734034) (not b!734021) (not b!734020) (not b!734033) (not b!734031) (not b!734036) (not b!734027) (not b!734023) (not b!734035) (not b!734037))
(check-sat)

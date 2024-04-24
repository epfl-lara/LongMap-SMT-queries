; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66404 () Bool)

(assert start!66404)

(declare-fun res!517066 () Bool)

(declare-fun e!425944 () Bool)

(assert (=> start!66404 (=> (not res!517066) (not e!425944))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66404 (= res!517066 (validMask!0 mask!3328))))

(assert (=> start!66404 e!425944))

(assert (=> start!66404 true))

(declare-datatypes ((array!42187 0))(
  ( (array!42188 (arr!20197 (Array (_ BitVec 32) (_ BitVec 64))) (size!20617 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42187)

(declare-fun array_inv!16056 (array!42187) Bool)

(assert (=> start!66404 (array_inv!16056 a!3186)))

(declare-fun b!764523 () Bool)

(declare-fun res!517063 () Bool)

(assert (=> b!764523 (=> (not res!517063) (not e!425944))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!764523 (= res!517063 (validKeyInArray!0 k0!2102))))

(declare-fun b!764524 () Bool)

(declare-fun res!517068 () Bool)

(declare-fun e!425945 () Bool)

(assert (=> b!764524 (=> (not res!517068) (not e!425945))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!764524 (= res!517068 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20617 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20617 a!3186))))))

(declare-fun b!764525 () Bool)

(declare-fun e!425943 () Bool)

(declare-fun e!425946 () Bool)

(assert (=> b!764525 (= e!425943 e!425946)))

(declare-fun res!517070 () Bool)

(assert (=> b!764525 (=> (not res!517070) (not e!425946))))

(declare-fun lt!340245 () (_ BitVec 64))

(declare-fun lt!340246 () array!42187)

(declare-datatypes ((SeekEntryResult!7753 0))(
  ( (MissingZero!7753 (index!33380 (_ BitVec 32))) (Found!7753 (index!33381 (_ BitVec 32))) (Intermediate!7753 (undefined!8565 Bool) (index!33382 (_ BitVec 32)) (x!64440 (_ BitVec 32))) (Undefined!7753) (MissingVacant!7753 (index!33383 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42187 (_ BitVec 32)) SeekEntryResult!7753)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!764525 (= res!517070 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340245 mask!3328) lt!340245 lt!340246 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340245 lt!340246 mask!3328)))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!764525 (= lt!340245 (select (store (arr!20197 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!764525 (= lt!340246 (array!42188 (store (arr!20197 a!3186) i!1173 k0!2102) (size!20617 a!3186)))))

(declare-fun b!764526 () Bool)

(declare-fun res!517060 () Bool)

(assert (=> b!764526 (=> (not res!517060) (not e!425945))))

(declare-datatypes ((List!14106 0))(
  ( (Nil!14103) (Cons!14102 (h!15192 (_ BitVec 64)) (t!20413 List!14106)) )
))
(declare-fun arrayNoDuplicates!0 (array!42187 (_ BitVec 32) List!14106) Bool)

(assert (=> b!764526 (= res!517060 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14103))))

(declare-fun b!764527 () Bool)

(assert (=> b!764527 (= e!425944 e!425945)))

(declare-fun res!517069 () Bool)

(assert (=> b!764527 (=> (not res!517069) (not e!425945))))

(declare-fun lt!340247 () SeekEntryResult!7753)

(assert (=> b!764527 (= res!517069 (or (= lt!340247 (MissingZero!7753 i!1173)) (= lt!340247 (MissingVacant!7753 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42187 (_ BitVec 32)) SeekEntryResult!7753)

(assert (=> b!764527 (= lt!340247 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!764528 () Bool)

(declare-fun res!517059 () Bool)

(assert (=> b!764528 (=> (not res!517059) (not e!425945))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42187 (_ BitVec 32)) Bool)

(assert (=> b!764528 (= res!517059 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!764529 () Bool)

(assert (=> b!764529 (= e!425946 (bvsgt #b00000000000000000000000000000000 (size!20617 a!3186)))))

(declare-fun b!764530 () Bool)

(declare-fun e!425947 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42187 (_ BitVec 32)) SeekEntryResult!7753)

(assert (=> b!764530 (= e!425947 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20197 a!3186) j!159) a!3186 mask!3328) (Found!7753 j!159)))))

(declare-fun lt!340248 () SeekEntryResult!7753)

(declare-fun b!764531 () Bool)

(assert (=> b!764531 (= e!425947 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20197 a!3186) j!159) a!3186 mask!3328) lt!340248))))

(declare-fun b!764532 () Bool)

(declare-fun res!517064 () Bool)

(assert (=> b!764532 (=> (not res!517064) (not e!425944))))

(assert (=> b!764532 (= res!517064 (validKeyInArray!0 (select (arr!20197 a!3186) j!159)))))

(declare-fun b!764533 () Bool)

(declare-fun res!517062 () Bool)

(assert (=> b!764533 (=> (not res!517062) (not e!425943))))

(assert (=> b!764533 (= res!517062 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20197 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!764534 () Bool)

(declare-fun res!517067 () Bool)

(assert (=> b!764534 (=> (not res!517067) (not e!425944))))

(assert (=> b!764534 (= res!517067 (and (= (size!20617 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20617 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20617 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!764535 () Bool)

(declare-fun res!517065 () Bool)

(assert (=> b!764535 (=> (not res!517065) (not e!425943))))

(assert (=> b!764535 (= res!517065 e!425947)))

(declare-fun c!84122 () Bool)

(assert (=> b!764535 (= c!84122 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!764536 () Bool)

(declare-fun res!517061 () Bool)

(assert (=> b!764536 (=> (not res!517061) (not e!425944))))

(declare-fun arrayContainsKey!0 (array!42187 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!764536 (= res!517061 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!764537 () Bool)

(assert (=> b!764537 (= e!425945 e!425943)))

(declare-fun res!517058 () Bool)

(assert (=> b!764537 (=> (not res!517058) (not e!425943))))

(assert (=> b!764537 (= res!517058 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20197 a!3186) j!159) mask!3328) (select (arr!20197 a!3186) j!159) a!3186 mask!3328) lt!340248))))

(assert (=> b!764537 (= lt!340248 (Intermediate!7753 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!66404 res!517066) b!764534))

(assert (= (and b!764534 res!517067) b!764532))

(assert (= (and b!764532 res!517064) b!764523))

(assert (= (and b!764523 res!517063) b!764536))

(assert (= (and b!764536 res!517061) b!764527))

(assert (= (and b!764527 res!517069) b!764528))

(assert (= (and b!764528 res!517059) b!764526))

(assert (= (and b!764526 res!517060) b!764524))

(assert (= (and b!764524 res!517068) b!764537))

(assert (= (and b!764537 res!517058) b!764533))

(assert (= (and b!764533 res!517062) b!764535))

(assert (= (and b!764535 c!84122) b!764531))

(assert (= (and b!764535 (not c!84122)) b!764530))

(assert (= (and b!764535 res!517065) b!764525))

(assert (= (and b!764525 res!517070) b!764529))

(declare-fun m!711337 () Bool)

(assert (=> b!764537 m!711337))

(assert (=> b!764537 m!711337))

(declare-fun m!711339 () Bool)

(assert (=> b!764537 m!711339))

(assert (=> b!764537 m!711339))

(assert (=> b!764537 m!711337))

(declare-fun m!711341 () Bool)

(assert (=> b!764537 m!711341))

(declare-fun m!711343 () Bool)

(assert (=> b!764528 m!711343))

(declare-fun m!711345 () Bool)

(assert (=> b!764527 m!711345))

(declare-fun m!711347 () Bool)

(assert (=> start!66404 m!711347))

(declare-fun m!711349 () Bool)

(assert (=> start!66404 m!711349))

(assert (=> b!764530 m!711337))

(assert (=> b!764530 m!711337))

(declare-fun m!711351 () Bool)

(assert (=> b!764530 m!711351))

(declare-fun m!711353 () Bool)

(assert (=> b!764536 m!711353))

(declare-fun m!711355 () Bool)

(assert (=> b!764526 m!711355))

(declare-fun m!711357 () Bool)

(assert (=> b!764525 m!711357))

(declare-fun m!711359 () Bool)

(assert (=> b!764525 m!711359))

(declare-fun m!711361 () Bool)

(assert (=> b!764525 m!711361))

(declare-fun m!711363 () Bool)

(assert (=> b!764525 m!711363))

(declare-fun m!711365 () Bool)

(assert (=> b!764525 m!711365))

(assert (=> b!764525 m!711359))

(declare-fun m!711367 () Bool)

(assert (=> b!764523 m!711367))

(declare-fun m!711369 () Bool)

(assert (=> b!764533 m!711369))

(assert (=> b!764531 m!711337))

(assert (=> b!764531 m!711337))

(declare-fun m!711371 () Bool)

(assert (=> b!764531 m!711371))

(assert (=> b!764532 m!711337))

(assert (=> b!764532 m!711337))

(declare-fun m!711373 () Bool)

(assert (=> b!764532 m!711373))

(check-sat (not b!764532) (not b!764525) (not b!764530) (not start!66404) (not b!764531) (not b!764523) (not b!764536) (not b!764526) (not b!764527) (not b!764537) (not b!764528))
(check-sat)

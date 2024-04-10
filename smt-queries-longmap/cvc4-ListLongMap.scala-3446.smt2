; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47800 () Bool)

(assert start!47800)

(declare-fun b!526600 () Bool)

(declare-fun e!306939 () Bool)

(declare-fun e!306941 () Bool)

(assert (=> b!526600 (= e!306939 (not e!306941))))

(declare-fun res!323199 () Bool)

(assert (=> b!526600 (=> res!323199 e!306941)))

(declare-datatypes ((SeekEntryResult!4537 0))(
  ( (MissingZero!4537 (index!20360 (_ BitVec 32))) (Found!4537 (index!20361 (_ BitVec 32))) (Intermediate!4537 (undefined!5349 Bool) (index!20362 (_ BitVec 32)) (x!49326 (_ BitVec 32))) (Undefined!4537) (MissingVacant!4537 (index!20363 (_ BitVec 32))) )
))
(declare-fun lt!242225 () SeekEntryResult!4537)

(declare-datatypes ((array!33437 0))(
  ( (array!33438 (arr!16070 (Array (_ BitVec 32) (_ BitVec 64))) (size!16434 (_ BitVec 32))) )
))
(declare-fun lt!242229 () array!33437)

(declare-fun lt!242226 () (_ BitVec 32))

(declare-fun lt!242227 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33437 (_ BitVec 32)) SeekEntryResult!4537)

(assert (=> b!526600 (= res!323199 (= lt!242225 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242226 lt!242227 lt!242229 mask!3524)))))

(declare-fun lt!242231 () (_ BitVec 32))

(declare-fun a!3235 () array!33437)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!526600 (= lt!242225 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242231 (select (arr!16070 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!526600 (= lt!242226 (toIndex!0 lt!242227 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!526600 (= lt!242227 (select (store (arr!16070 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!526600 (= lt!242231 (toIndex!0 (select (arr!16070 a!3235) j!176) mask!3524))))

(assert (=> b!526600 (= lt!242229 (array!33438 (store (arr!16070 a!3235) i!1204 k!2280) (size!16434 a!3235)))))

(declare-fun e!306942 () Bool)

(assert (=> b!526600 e!306942))

(declare-fun res!323202 () Bool)

(assert (=> b!526600 (=> (not res!323202) (not e!306942))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33437 (_ BitVec 32)) Bool)

(assert (=> b!526600 (= res!323202 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16600 0))(
  ( (Unit!16601) )
))
(declare-fun lt!242233 () Unit!16600)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33437 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16600)

(assert (=> b!526600 (= lt!242233 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!323201 () Bool)

(declare-fun e!306944 () Bool)

(assert (=> start!47800 (=> (not res!323201) (not e!306944))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47800 (= res!323201 (validMask!0 mask!3524))))

(assert (=> start!47800 e!306944))

(assert (=> start!47800 true))

(declare-fun array_inv!11866 (array!33437) Bool)

(assert (=> start!47800 (array_inv!11866 a!3235)))

(declare-fun b!526601 () Bool)

(declare-fun res!323204 () Bool)

(assert (=> b!526601 (=> (not res!323204) (not e!306944))))

(assert (=> b!526601 (= res!323204 (and (= (size!16434 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16434 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16434 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!526602 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33437 (_ BitVec 32)) SeekEntryResult!4537)

(assert (=> b!526602 (= e!306942 (= (seekEntryOrOpen!0 (select (arr!16070 a!3235) j!176) a!3235 mask!3524) (Found!4537 j!176)))))

(declare-fun b!526603 () Bool)

(declare-fun e!306943 () Unit!16600)

(declare-fun Unit!16602 () Unit!16600)

(assert (=> b!526603 (= e!306943 Unit!16602)))

(declare-fun lt!242230 () Unit!16600)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33437 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16600)

(assert (=> b!526603 (= lt!242230 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!242231 #b00000000000000000000000000000000 (index!20362 lt!242225) (x!49326 lt!242225) mask!3524))))

(declare-fun res!323206 () Bool)

(assert (=> b!526603 (= res!323206 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242231 lt!242227 lt!242229 mask!3524) (Intermediate!4537 false (index!20362 lt!242225) (x!49326 lt!242225))))))

(declare-fun e!306940 () Bool)

(assert (=> b!526603 (=> (not res!323206) (not e!306940))))

(assert (=> b!526603 e!306940))

(declare-fun b!526604 () Bool)

(declare-fun res!323200 () Bool)

(assert (=> b!526604 (=> (not res!323200) (not e!306939))))

(declare-datatypes ((List!10228 0))(
  ( (Nil!10225) (Cons!10224 (h!11155 (_ BitVec 64)) (t!16456 List!10228)) )
))
(declare-fun arrayNoDuplicates!0 (array!33437 (_ BitVec 32) List!10228) Bool)

(assert (=> b!526604 (= res!323200 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10225))))

(declare-fun b!526605 () Bool)

(declare-fun res!323209 () Bool)

(assert (=> b!526605 (=> (not res!323209) (not e!306944))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!526605 (= res!323209 (validKeyInArray!0 k!2280))))

(declare-fun b!526606 () Bool)

(declare-fun Unit!16603 () Unit!16600)

(assert (=> b!526606 (= e!306943 Unit!16603)))

(declare-fun b!526607 () Bool)

(declare-fun res!323203 () Bool)

(assert (=> b!526607 (=> (not res!323203) (not e!306944))))

(assert (=> b!526607 (= res!323203 (validKeyInArray!0 (select (arr!16070 a!3235) j!176)))))

(declare-fun b!526608 () Bool)

(assert (=> b!526608 (= e!306941 true)))

(assert (=> b!526608 (= (index!20362 lt!242225) i!1204)))

(declare-fun lt!242228 () Unit!16600)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33437 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16600)

(assert (=> b!526608 (= lt!242228 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!242231 #b00000000000000000000000000000000 (index!20362 lt!242225) (x!49326 lt!242225) mask!3524))))

(assert (=> b!526608 (and (or (= (select (arr!16070 a!3235) (index!20362 lt!242225)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16070 a!3235) (index!20362 lt!242225)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16070 a!3235) (index!20362 lt!242225)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16070 a!3235) (index!20362 lt!242225)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242224 () Unit!16600)

(assert (=> b!526608 (= lt!242224 e!306943)))

(declare-fun c!62006 () Bool)

(assert (=> b!526608 (= c!62006 (= (select (arr!16070 a!3235) (index!20362 lt!242225)) (select (arr!16070 a!3235) j!176)))))

(assert (=> b!526608 (and (bvslt (x!49326 lt!242225) #b01111111111111111111111111111110) (or (= (select (arr!16070 a!3235) (index!20362 lt!242225)) (select (arr!16070 a!3235) j!176)) (= (select (arr!16070 a!3235) (index!20362 lt!242225)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16070 a!3235) (index!20362 lt!242225)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!526609 () Bool)

(declare-fun res!323207 () Bool)

(assert (=> b!526609 (=> (not res!323207) (not e!306944))))

(declare-fun arrayContainsKey!0 (array!33437 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!526609 (= res!323207 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!526610 () Bool)

(assert (=> b!526610 (= e!306944 e!306939)))

(declare-fun res!323210 () Bool)

(assert (=> b!526610 (=> (not res!323210) (not e!306939))))

(declare-fun lt!242232 () SeekEntryResult!4537)

(assert (=> b!526610 (= res!323210 (or (= lt!242232 (MissingZero!4537 i!1204)) (= lt!242232 (MissingVacant!4537 i!1204))))))

(assert (=> b!526610 (= lt!242232 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!526611 () Bool)

(declare-fun res!323205 () Bool)

(assert (=> b!526611 (=> res!323205 e!306941)))

(assert (=> b!526611 (= res!323205 (or (undefined!5349 lt!242225) (not (is-Intermediate!4537 lt!242225))))))

(declare-fun b!526612 () Bool)

(assert (=> b!526612 (= e!306940 false)))

(declare-fun b!526613 () Bool)

(declare-fun res!323208 () Bool)

(assert (=> b!526613 (=> (not res!323208) (not e!306939))))

(assert (=> b!526613 (= res!323208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!47800 res!323201) b!526601))

(assert (= (and b!526601 res!323204) b!526607))

(assert (= (and b!526607 res!323203) b!526605))

(assert (= (and b!526605 res!323209) b!526609))

(assert (= (and b!526609 res!323207) b!526610))

(assert (= (and b!526610 res!323210) b!526613))

(assert (= (and b!526613 res!323208) b!526604))

(assert (= (and b!526604 res!323200) b!526600))

(assert (= (and b!526600 res!323202) b!526602))

(assert (= (and b!526600 (not res!323199)) b!526611))

(assert (= (and b!526611 (not res!323205)) b!526608))

(assert (= (and b!526608 c!62006) b!526603))

(assert (= (and b!526608 (not c!62006)) b!526606))

(assert (= (and b!526603 res!323206) b!526612))

(declare-fun m!507313 () Bool)

(assert (=> b!526607 m!507313))

(assert (=> b!526607 m!507313))

(declare-fun m!507315 () Bool)

(assert (=> b!526607 m!507315))

(assert (=> b!526602 m!507313))

(assert (=> b!526602 m!507313))

(declare-fun m!507317 () Bool)

(assert (=> b!526602 m!507317))

(declare-fun m!507319 () Bool)

(assert (=> b!526608 m!507319))

(declare-fun m!507321 () Bool)

(assert (=> b!526608 m!507321))

(assert (=> b!526608 m!507313))

(declare-fun m!507323 () Bool)

(assert (=> b!526609 m!507323))

(declare-fun m!507325 () Bool)

(assert (=> b!526605 m!507325))

(declare-fun m!507327 () Bool)

(assert (=> b!526610 m!507327))

(declare-fun m!507329 () Bool)

(assert (=> b!526600 m!507329))

(declare-fun m!507331 () Bool)

(assert (=> b!526600 m!507331))

(declare-fun m!507333 () Bool)

(assert (=> b!526600 m!507333))

(declare-fun m!507335 () Bool)

(assert (=> b!526600 m!507335))

(declare-fun m!507337 () Bool)

(assert (=> b!526600 m!507337))

(assert (=> b!526600 m!507313))

(declare-fun m!507339 () Bool)

(assert (=> b!526600 m!507339))

(assert (=> b!526600 m!507313))

(declare-fun m!507341 () Bool)

(assert (=> b!526600 m!507341))

(assert (=> b!526600 m!507313))

(declare-fun m!507343 () Bool)

(assert (=> b!526600 m!507343))

(declare-fun m!507345 () Bool)

(assert (=> b!526603 m!507345))

(declare-fun m!507347 () Bool)

(assert (=> b!526603 m!507347))

(declare-fun m!507349 () Bool)

(assert (=> start!47800 m!507349))

(declare-fun m!507351 () Bool)

(assert (=> start!47800 m!507351))

(declare-fun m!507353 () Bool)

(assert (=> b!526604 m!507353))

(declare-fun m!507355 () Bool)

(assert (=> b!526613 m!507355))

(push 1)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44766 () Bool)

(assert start!44766)

(declare-fun b!491442 () Bool)

(declare-fun e!288757 () Bool)

(declare-fun e!288756 () Bool)

(assert (=> b!491442 (= e!288757 (not e!288756))))

(declare-fun res!294378 () Bool)

(assert (=> b!491442 (=> res!294378 e!288756)))

(declare-datatypes ((array!31825 0))(
  ( (array!31826 (arr!15300 (Array (_ BitVec 32) (_ BitVec 64))) (size!15664 (_ BitVec 32))) )
))
(declare-fun lt!222159 () array!31825)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!222158 () (_ BitVec 64))

(declare-fun a!3235 () array!31825)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3767 0))(
  ( (MissingZero!3767 (index!17247 (_ BitVec 32))) (Found!3767 (index!17248 (_ BitVec 32))) (Intermediate!3767 (undefined!4579 Bool) (index!17249 (_ BitVec 32)) (x!46337 (_ BitVec 32))) (Undefined!3767) (MissingVacant!3767 (index!17250 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31825 (_ BitVec 32)) SeekEntryResult!3767)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491442 (= res!294378 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15300 a!3235) j!176) mask!3524) (select (arr!15300 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!222158 mask!3524) lt!222158 lt!222159 mask!3524))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!491442 (= lt!222158 (select (store (arr!15300 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!491442 (= lt!222159 (array!31826 (store (arr!15300 a!3235) i!1204 k!2280) (size!15664 a!3235)))))

(declare-fun lt!222160 () SeekEntryResult!3767)

(assert (=> b!491442 (= lt!222160 (Found!3767 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31825 (_ BitVec 32)) SeekEntryResult!3767)

(assert (=> b!491442 (= lt!222160 (seekEntryOrOpen!0 (select (arr!15300 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31825 (_ BitVec 32)) Bool)

(assert (=> b!491442 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14480 0))(
  ( (Unit!14481) )
))
(declare-fun lt!222156 () Unit!14480)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31825 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14480)

(assert (=> b!491442 (= lt!222156 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!491443 () Bool)

(assert (=> b!491443 (= e!288756 true)))

(assert (=> b!491443 (= lt!222160 (seekEntryOrOpen!0 lt!222158 lt!222159 mask!3524))))

(declare-fun lt!222155 () Unit!14480)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31825 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14480)

(assert (=> b!491443 (= lt!222155 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(declare-fun b!491444 () Bool)

(declare-fun res!294385 () Bool)

(declare-fun e!288759 () Bool)

(assert (=> b!491444 (=> (not res!294385) (not e!288759))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491444 (= res!294385 (validKeyInArray!0 k!2280))))

(declare-fun b!491445 () Bool)

(declare-fun res!294380 () Bool)

(assert (=> b!491445 (=> (not res!294380) (not e!288757))))

(declare-datatypes ((List!9458 0))(
  ( (Nil!9455) (Cons!9454 (h!10316 (_ BitVec 64)) (t!15686 List!9458)) )
))
(declare-fun arrayNoDuplicates!0 (array!31825 (_ BitVec 32) List!9458) Bool)

(assert (=> b!491445 (= res!294380 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9455))))

(declare-fun b!491446 () Bool)

(declare-fun res!294383 () Bool)

(assert (=> b!491446 (=> (not res!294383) (not e!288759))))

(assert (=> b!491446 (= res!294383 (validKeyInArray!0 (select (arr!15300 a!3235) j!176)))))

(declare-fun b!491447 () Bool)

(assert (=> b!491447 (= e!288759 e!288757)))

(declare-fun res!294381 () Bool)

(assert (=> b!491447 (=> (not res!294381) (not e!288757))))

(declare-fun lt!222157 () SeekEntryResult!3767)

(assert (=> b!491447 (= res!294381 (or (= lt!222157 (MissingZero!3767 i!1204)) (= lt!222157 (MissingVacant!3767 i!1204))))))

(assert (=> b!491447 (= lt!222157 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!491448 () Bool)

(declare-fun res!294384 () Bool)

(assert (=> b!491448 (=> (not res!294384) (not e!288759))))

(assert (=> b!491448 (= res!294384 (and (= (size!15664 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15664 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15664 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!294382 () Bool)

(assert (=> start!44766 (=> (not res!294382) (not e!288759))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44766 (= res!294382 (validMask!0 mask!3524))))

(assert (=> start!44766 e!288759))

(assert (=> start!44766 true))

(declare-fun array_inv!11096 (array!31825) Bool)

(assert (=> start!44766 (array_inv!11096 a!3235)))

(declare-fun b!491449 () Bool)

(declare-fun res!294379 () Bool)

(assert (=> b!491449 (=> (not res!294379) (not e!288757))))

(assert (=> b!491449 (= res!294379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491450 () Bool)

(declare-fun res!294386 () Bool)

(assert (=> b!491450 (=> (not res!294386) (not e!288759))))

(declare-fun arrayContainsKey!0 (array!31825 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491450 (= res!294386 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!44766 res!294382) b!491448))

(assert (= (and b!491448 res!294384) b!491446))

(assert (= (and b!491446 res!294383) b!491444))

(assert (= (and b!491444 res!294385) b!491450))

(assert (= (and b!491450 res!294386) b!491447))

(assert (= (and b!491447 res!294381) b!491449))

(assert (= (and b!491449 res!294379) b!491445))

(assert (= (and b!491445 res!294380) b!491442))

(assert (= (and b!491442 (not res!294378)) b!491443))

(declare-fun m!472023 () Bool)

(assert (=> start!44766 m!472023))

(declare-fun m!472025 () Bool)

(assert (=> start!44766 m!472025))

(declare-fun m!472027 () Bool)

(assert (=> b!491449 m!472027))

(declare-fun m!472029 () Bool)

(assert (=> b!491444 m!472029))

(declare-fun m!472031 () Bool)

(assert (=> b!491442 m!472031))

(declare-fun m!472033 () Bool)

(assert (=> b!491442 m!472033))

(declare-fun m!472035 () Bool)

(assert (=> b!491442 m!472035))

(declare-fun m!472037 () Bool)

(assert (=> b!491442 m!472037))

(declare-fun m!472039 () Bool)

(assert (=> b!491442 m!472039))

(declare-fun m!472041 () Bool)

(assert (=> b!491442 m!472041))

(declare-fun m!472043 () Bool)

(assert (=> b!491442 m!472043))

(declare-fun m!472045 () Bool)

(assert (=> b!491442 m!472045))

(assert (=> b!491442 m!472031))

(assert (=> b!491442 m!472043))

(assert (=> b!491442 m!472041))

(assert (=> b!491442 m!472043))

(declare-fun m!472047 () Bool)

(assert (=> b!491442 m!472047))

(assert (=> b!491442 m!472043))

(declare-fun m!472049 () Bool)

(assert (=> b!491442 m!472049))

(declare-fun m!472051 () Bool)

(assert (=> b!491445 m!472051))

(assert (=> b!491446 m!472043))

(assert (=> b!491446 m!472043))

(declare-fun m!472053 () Bool)

(assert (=> b!491446 m!472053))

(declare-fun m!472055 () Bool)

(assert (=> b!491443 m!472055))

(declare-fun m!472057 () Bool)

(assert (=> b!491443 m!472057))

(declare-fun m!472059 () Bool)

(assert (=> b!491447 m!472059))

(declare-fun m!472061 () Bool)

(assert (=> b!491450 m!472061))

(push 1)


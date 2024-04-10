; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44770 () Bool)

(assert start!44770)

(declare-fun b!491496 () Bool)

(declare-fun res!294435 () Bool)

(declare-fun e!288782 () Bool)

(assert (=> b!491496 (=> (not res!294435) (not e!288782))))

(declare-datatypes ((array!31829 0))(
  ( (array!31830 (arr!15302 (Array (_ BitVec 32) (_ BitVec 64))) (size!15666 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31829)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31829 (_ BitVec 32)) Bool)

(assert (=> b!491496 (= res!294435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491497 () Bool)

(declare-fun res!294440 () Bool)

(declare-fun e!288783 () Bool)

(assert (=> b!491497 (=> (not res!294440) (not e!288783))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31829 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491497 (= res!294440 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!491498 () Bool)

(declare-fun res!294437 () Bool)

(assert (=> b!491498 (=> (not res!294437) (not e!288783))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491498 (= res!294437 (validKeyInArray!0 (select (arr!15302 a!3235) j!176)))))

(declare-fun res!294434 () Bool)

(assert (=> start!44770 (=> (not res!294434) (not e!288783))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44770 (= res!294434 (validMask!0 mask!3524))))

(assert (=> start!44770 e!288783))

(assert (=> start!44770 true))

(declare-fun array_inv!11098 (array!31829) Bool)

(assert (=> start!44770 (array_inv!11098 a!3235)))

(declare-fun b!491499 () Bool)

(declare-fun e!288781 () Bool)

(assert (=> b!491499 (= e!288782 (not e!288781))))

(declare-fun res!294439 () Bool)

(assert (=> b!491499 (=> res!294439 e!288781)))

(declare-fun lt!222196 () array!31829)

(declare-fun lt!222193 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3769 0))(
  ( (MissingZero!3769 (index!17255 (_ BitVec 32))) (Found!3769 (index!17256 (_ BitVec 32))) (Intermediate!3769 (undefined!4581 Bool) (index!17257 (_ BitVec 32)) (x!46339 (_ BitVec 32))) (Undefined!3769) (MissingVacant!3769 (index!17258 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31829 (_ BitVec 32)) SeekEntryResult!3769)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491499 (= res!294439 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15302 a!3235) j!176) mask!3524) (select (arr!15302 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!222193 mask!3524) lt!222193 lt!222196 mask!3524))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!491499 (= lt!222193 (select (store (arr!15302 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!491499 (= lt!222196 (array!31830 (store (arr!15302 a!3235) i!1204 k!2280) (size!15666 a!3235)))))

(declare-fun lt!222192 () SeekEntryResult!3769)

(assert (=> b!491499 (= lt!222192 (Found!3769 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31829 (_ BitVec 32)) SeekEntryResult!3769)

(assert (=> b!491499 (= lt!222192 (seekEntryOrOpen!0 (select (arr!15302 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!491499 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14484 0))(
  ( (Unit!14485) )
))
(declare-fun lt!222195 () Unit!14484)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31829 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14484)

(assert (=> b!491499 (= lt!222195 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!491500 () Bool)

(declare-fun res!294438 () Bool)

(assert (=> b!491500 (=> (not res!294438) (not e!288782))))

(declare-datatypes ((List!9460 0))(
  ( (Nil!9457) (Cons!9456 (h!10318 (_ BitVec 64)) (t!15688 List!9460)) )
))
(declare-fun arrayNoDuplicates!0 (array!31829 (_ BitVec 32) List!9460) Bool)

(assert (=> b!491500 (= res!294438 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9457))))

(declare-fun b!491501 () Bool)

(declare-fun res!294433 () Bool)

(assert (=> b!491501 (=> (not res!294433) (not e!288783))))

(assert (=> b!491501 (= res!294433 (validKeyInArray!0 k!2280))))

(declare-fun b!491502 () Bool)

(assert (=> b!491502 (= e!288783 e!288782)))

(declare-fun res!294436 () Bool)

(assert (=> b!491502 (=> (not res!294436) (not e!288782))))

(declare-fun lt!222191 () SeekEntryResult!3769)

(assert (=> b!491502 (= res!294436 (or (= lt!222191 (MissingZero!3769 i!1204)) (= lt!222191 (MissingVacant!3769 i!1204))))))

(assert (=> b!491502 (= lt!222191 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!491503 () Bool)

(declare-fun res!294432 () Bool)

(assert (=> b!491503 (=> (not res!294432) (not e!288783))))

(assert (=> b!491503 (= res!294432 (and (= (size!15666 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15666 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15666 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!491504 () Bool)

(assert (=> b!491504 (= e!288781 true)))

(assert (=> b!491504 (= lt!222192 (seekEntryOrOpen!0 lt!222193 lt!222196 mask!3524))))

(declare-fun lt!222194 () Unit!14484)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31829 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14484)

(assert (=> b!491504 (= lt!222194 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(assert (= (and start!44770 res!294434) b!491503))

(assert (= (and b!491503 res!294432) b!491498))

(assert (= (and b!491498 res!294437) b!491501))

(assert (= (and b!491501 res!294433) b!491497))

(assert (= (and b!491497 res!294440) b!491502))

(assert (= (and b!491502 res!294436) b!491496))

(assert (= (and b!491496 res!294435) b!491500))

(assert (= (and b!491500 res!294438) b!491499))

(assert (= (and b!491499 (not res!294439)) b!491504))

(declare-fun m!472103 () Bool)

(assert (=> start!44770 m!472103))

(declare-fun m!472105 () Bool)

(assert (=> start!44770 m!472105))

(declare-fun m!472107 () Bool)

(assert (=> b!491496 m!472107))

(declare-fun m!472109 () Bool)

(assert (=> b!491504 m!472109))

(declare-fun m!472111 () Bool)

(assert (=> b!491504 m!472111))

(declare-fun m!472113 () Bool)

(assert (=> b!491498 m!472113))

(assert (=> b!491498 m!472113))

(declare-fun m!472115 () Bool)

(assert (=> b!491498 m!472115))

(declare-fun m!472117 () Bool)

(assert (=> b!491501 m!472117))

(declare-fun m!472119 () Bool)

(assert (=> b!491500 m!472119))

(declare-fun m!472121 () Bool)

(assert (=> b!491502 m!472121))

(declare-fun m!472123 () Bool)

(assert (=> b!491497 m!472123))

(declare-fun m!472125 () Bool)

(assert (=> b!491499 m!472125))

(declare-fun m!472127 () Bool)

(assert (=> b!491499 m!472127))

(declare-fun m!472129 () Bool)

(assert (=> b!491499 m!472129))

(declare-fun m!472131 () Bool)

(assert (=> b!491499 m!472131))

(declare-fun m!472133 () Bool)

(assert (=> b!491499 m!472133))

(declare-fun m!472135 () Bool)

(assert (=> b!491499 m!472135))

(assert (=> b!491499 m!472113))

(declare-fun m!472137 () Bool)

(assert (=> b!491499 m!472137))

(assert (=> b!491499 m!472113))

(assert (=> b!491499 m!472135))

(assert (=> b!491499 m!472127))

(assert (=> b!491499 m!472113))

(declare-fun m!472139 () Bool)

(assert (=> b!491499 m!472139))

(assert (=> b!491499 m!472113))

(declare-fun m!472141 () Bool)

(assert (=> b!491499 m!472141))

(push 1)


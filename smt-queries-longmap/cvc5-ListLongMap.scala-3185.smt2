; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44736 () Bool)

(assert start!44736)

(declare-fun b!491030 () Bool)

(declare-fun res!293975 () Bool)

(declare-fun e!288571 () Bool)

(assert (=> b!491030 (=> (not res!293975) (not e!288571))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491030 (= res!293975 (validKeyInArray!0 k!2280))))

(declare-fun b!491031 () Bool)

(declare-fun e!288572 () Bool)

(declare-fun e!288570 () Bool)

(assert (=> b!491031 (= e!288572 (not e!288570))))

(declare-fun res!293967 () Bool)

(assert (=> b!491031 (=> res!293967 e!288570)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31795 0))(
  ( (array!31796 (arr!15285 (Array (_ BitVec 32) (_ BitVec 64))) (size!15649 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31795)

(declare-fun lt!221887 () (_ BitVec 64))

(declare-fun lt!221885 () array!31795)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3752 0))(
  ( (MissingZero!3752 (index!17187 (_ BitVec 32))) (Found!3752 (index!17188 (_ BitVec 32))) (Intermediate!3752 (undefined!4564 Bool) (index!17189 (_ BitVec 32)) (x!46282 (_ BitVec 32))) (Undefined!3752) (MissingVacant!3752 (index!17190 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31795 (_ BitVec 32)) SeekEntryResult!3752)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491031 (= res!293967 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15285 a!3235) j!176) mask!3524) (select (arr!15285 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221887 mask!3524) lt!221887 lt!221885 mask!3524))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!491031 (= lt!221887 (select (store (arr!15285 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!491031 (= lt!221885 (array!31796 (store (arr!15285 a!3235) i!1204 k!2280) (size!15649 a!3235)))))

(declare-fun lt!221888 () SeekEntryResult!3752)

(assert (=> b!491031 (= lt!221888 (Found!3752 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31795 (_ BitVec 32)) SeekEntryResult!3752)

(assert (=> b!491031 (= lt!221888 (seekEntryOrOpen!0 (select (arr!15285 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31795 (_ BitVec 32)) Bool)

(assert (=> b!491031 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14450 0))(
  ( (Unit!14451) )
))
(declare-fun lt!221886 () Unit!14450)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31795 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14450)

(assert (=> b!491031 (= lt!221886 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!491032 () Bool)

(declare-fun e!288569 () Bool)

(assert (=> b!491032 (= e!288570 e!288569)))

(declare-fun res!293972 () Bool)

(assert (=> b!491032 (=> res!293972 e!288569)))

(assert (=> b!491032 (= res!293972 (bvslt mask!3524 #b00000000000000000000000000000000))))

(assert (=> b!491032 (= lt!221888 (seekEntryOrOpen!0 lt!221887 lt!221885 mask!3524))))

(declare-fun lt!221890 () Unit!14450)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31795 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14450)

(assert (=> b!491032 (= lt!221890 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(declare-fun res!293966 () Bool)

(assert (=> start!44736 (=> (not res!293966) (not e!288571))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44736 (= res!293966 (validMask!0 mask!3524))))

(assert (=> start!44736 e!288571))

(assert (=> start!44736 true))

(declare-fun array_inv!11081 (array!31795) Bool)

(assert (=> start!44736 (array_inv!11081 a!3235)))

(declare-fun b!491033 () Bool)

(declare-fun res!293970 () Bool)

(assert (=> b!491033 (=> (not res!293970) (not e!288572))))

(assert (=> b!491033 (= res!293970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491034 () Bool)

(declare-fun res!293969 () Bool)

(assert (=> b!491034 (=> (not res!293969) (not e!288572))))

(declare-datatypes ((List!9443 0))(
  ( (Nil!9440) (Cons!9439 (h!10301 (_ BitVec 64)) (t!15671 List!9443)) )
))
(declare-fun arrayNoDuplicates!0 (array!31795 (_ BitVec 32) List!9443) Bool)

(assert (=> b!491034 (= res!293969 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9440))))

(declare-fun b!491035 () Bool)

(assert (=> b!491035 (= e!288569 (validKeyInArray!0 lt!221887))))

(declare-fun b!491036 () Bool)

(assert (=> b!491036 (= e!288571 e!288572)))

(declare-fun res!293973 () Bool)

(assert (=> b!491036 (=> (not res!293973) (not e!288572))))

(declare-fun lt!221889 () SeekEntryResult!3752)

(assert (=> b!491036 (= res!293973 (or (= lt!221889 (MissingZero!3752 i!1204)) (= lt!221889 (MissingVacant!3752 i!1204))))))

(assert (=> b!491036 (= lt!221889 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!491037 () Bool)

(declare-fun res!293974 () Bool)

(assert (=> b!491037 (=> (not res!293974) (not e!288571))))

(assert (=> b!491037 (= res!293974 (validKeyInArray!0 (select (arr!15285 a!3235) j!176)))))

(declare-fun b!491038 () Bool)

(declare-fun res!293971 () Bool)

(assert (=> b!491038 (=> (not res!293971) (not e!288571))))

(declare-fun arrayContainsKey!0 (array!31795 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491038 (= res!293971 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!491039 () Bool)

(declare-fun res!293968 () Bool)

(assert (=> b!491039 (=> (not res!293968) (not e!288571))))

(assert (=> b!491039 (= res!293968 (and (= (size!15649 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15649 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15649 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44736 res!293966) b!491039))

(assert (= (and b!491039 res!293968) b!491037))

(assert (= (and b!491037 res!293974) b!491030))

(assert (= (and b!491030 res!293975) b!491038))

(assert (= (and b!491038 res!293971) b!491036))

(assert (= (and b!491036 res!293973) b!491033))

(assert (= (and b!491033 res!293970) b!491034))

(assert (= (and b!491034 res!293969) b!491031))

(assert (= (and b!491031 (not res!293967)) b!491032))

(assert (= (and b!491032 (not res!293972)) b!491035))

(declare-fun m!471417 () Bool)

(assert (=> b!491038 m!471417))

(declare-fun m!471419 () Bool)

(assert (=> b!491030 m!471419))

(declare-fun m!471421 () Bool)

(assert (=> b!491034 m!471421))

(declare-fun m!471423 () Bool)

(assert (=> b!491037 m!471423))

(assert (=> b!491037 m!471423))

(declare-fun m!471425 () Bool)

(assert (=> b!491037 m!471425))

(declare-fun m!471427 () Bool)

(assert (=> start!44736 m!471427))

(declare-fun m!471429 () Bool)

(assert (=> start!44736 m!471429))

(declare-fun m!471431 () Bool)

(assert (=> b!491031 m!471431))

(declare-fun m!471433 () Bool)

(assert (=> b!491031 m!471433))

(declare-fun m!471435 () Bool)

(assert (=> b!491031 m!471435))

(declare-fun m!471437 () Bool)

(assert (=> b!491031 m!471437))

(assert (=> b!491031 m!471423))

(declare-fun m!471439 () Bool)

(assert (=> b!491031 m!471439))

(declare-fun m!471441 () Bool)

(assert (=> b!491031 m!471441))

(assert (=> b!491031 m!471423))

(assert (=> b!491031 m!471437))

(assert (=> b!491031 m!471423))

(declare-fun m!471443 () Bool)

(assert (=> b!491031 m!471443))

(assert (=> b!491031 m!471423))

(declare-fun m!471445 () Bool)

(assert (=> b!491031 m!471445))

(assert (=> b!491031 m!471441))

(declare-fun m!471447 () Bool)

(assert (=> b!491031 m!471447))

(declare-fun m!471449 () Bool)

(assert (=> b!491036 m!471449))

(declare-fun m!471451 () Bool)

(assert (=> b!491033 m!471451))

(declare-fun m!471453 () Bool)

(assert (=> b!491035 m!471453))

(declare-fun m!471455 () Bool)

(assert (=> b!491032 m!471455))

(declare-fun m!471457 () Bool)

(assert (=> b!491032 m!471457))

(push 1)


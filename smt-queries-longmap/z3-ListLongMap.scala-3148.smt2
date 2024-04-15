; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44298 () Bool)

(assert start!44298)

(declare-fun b!487019 () Bool)

(declare-fun res!290555 () Bool)

(declare-fun e!286549 () Bool)

(assert (=> b!487019 (=> (not res!290555) (not e!286549))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31559 0))(
  ( (array!31560 (arr!15173 (Array (_ BitVec 32) (_ BitVec 64))) (size!15538 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31559)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!487019 (= res!290555 (and (= (size!15538 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15538 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15538 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!487020 () Bool)

(declare-fun res!290548 () Bool)

(declare-fun e!286550 () Bool)

(assert (=> b!487020 (=> (not res!290548) (not e!286550))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31559 (_ BitVec 32)) Bool)

(assert (=> b!487020 (= res!290548 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!290550 () Bool)

(assert (=> start!44298 (=> (not res!290550) (not e!286549))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44298 (= res!290550 (validMask!0 mask!3524))))

(assert (=> start!44298 e!286549))

(assert (=> start!44298 true))

(declare-fun array_inv!11056 (array!31559) Bool)

(assert (=> start!44298 (array_inv!11056 a!3235)))

(declare-fun b!487021 () Bool)

(declare-fun res!290547 () Bool)

(assert (=> b!487021 (=> (not res!290547) (not e!286549))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31559 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487021 (= res!290547 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!487022 () Bool)

(declare-fun e!286548 () Bool)

(declare-datatypes ((SeekEntryResult!3637 0))(
  ( (MissingZero!3637 (index!16727 (_ BitVec 32))) (Found!3637 (index!16728 (_ BitVec 32))) (Intermediate!3637 (undefined!4449 Bool) (index!16729 (_ BitVec 32)) (x!45860 (_ BitVec 32))) (Undefined!3637) (MissingVacant!3637 (index!16730 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31559 (_ BitVec 32)) SeekEntryResult!3637)

(assert (=> b!487022 (= e!286548 (= (seekEntryOrOpen!0 (select (arr!15173 a!3235) j!176) a!3235 mask!3524) (Found!3637 j!176)))))

(declare-fun b!487023 () Bool)

(assert (=> b!487023 (= e!286550 (not (bvsge mask!3524 #b00000000000000000000000000000000)))))

(assert (=> b!487023 e!286548))

(declare-fun res!290553 () Bool)

(assert (=> b!487023 (=> (not res!290553) (not e!286548))))

(assert (=> b!487023 (= res!290553 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14206 0))(
  ( (Unit!14207) )
))
(declare-fun lt!219754 () Unit!14206)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31559 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14206)

(assert (=> b!487023 (= lt!219754 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!487024 () Bool)

(declare-fun res!290554 () Bool)

(assert (=> b!487024 (=> (not res!290554) (not e!286549))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487024 (= res!290554 (validKeyInArray!0 (select (arr!15173 a!3235) j!176)))))

(declare-fun b!487025 () Bool)

(declare-fun res!290551 () Bool)

(assert (=> b!487025 (=> (not res!290551) (not e!286550))))

(declare-datatypes ((List!9370 0))(
  ( (Nil!9367) (Cons!9366 (h!10222 (_ BitVec 64)) (t!15589 List!9370)) )
))
(declare-fun arrayNoDuplicates!0 (array!31559 (_ BitVec 32) List!9370) Bool)

(assert (=> b!487025 (= res!290551 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9367))))

(declare-fun b!487026 () Bool)

(assert (=> b!487026 (= e!286549 e!286550)))

(declare-fun res!290552 () Bool)

(assert (=> b!487026 (=> (not res!290552) (not e!286550))))

(declare-fun lt!219753 () SeekEntryResult!3637)

(assert (=> b!487026 (= res!290552 (or (= lt!219753 (MissingZero!3637 i!1204)) (= lt!219753 (MissingVacant!3637 i!1204))))))

(assert (=> b!487026 (= lt!219753 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!487027 () Bool)

(declare-fun res!290549 () Bool)

(assert (=> b!487027 (=> (not res!290549) (not e!286549))))

(assert (=> b!487027 (= res!290549 (validKeyInArray!0 k0!2280))))

(assert (= (and start!44298 res!290550) b!487019))

(assert (= (and b!487019 res!290555) b!487024))

(assert (= (and b!487024 res!290554) b!487027))

(assert (= (and b!487027 res!290549) b!487021))

(assert (= (and b!487021 res!290547) b!487026))

(assert (= (and b!487026 res!290552) b!487020))

(assert (= (and b!487020 res!290548) b!487025))

(assert (= (and b!487025 res!290551) b!487023))

(assert (= (and b!487023 res!290553) b!487022))

(declare-fun m!466369 () Bool)

(assert (=> b!487021 m!466369))

(declare-fun m!466371 () Bool)

(assert (=> b!487022 m!466371))

(assert (=> b!487022 m!466371))

(declare-fun m!466373 () Bool)

(assert (=> b!487022 m!466373))

(declare-fun m!466375 () Bool)

(assert (=> start!44298 m!466375))

(declare-fun m!466377 () Bool)

(assert (=> start!44298 m!466377))

(declare-fun m!466379 () Bool)

(assert (=> b!487026 m!466379))

(declare-fun m!466381 () Bool)

(assert (=> b!487027 m!466381))

(declare-fun m!466383 () Bool)

(assert (=> b!487020 m!466383))

(declare-fun m!466385 () Bool)

(assert (=> b!487023 m!466385))

(declare-fun m!466387 () Bool)

(assert (=> b!487023 m!466387))

(assert (=> b!487024 m!466371))

(assert (=> b!487024 m!466371))

(declare-fun m!466389 () Bool)

(assert (=> b!487024 m!466389))

(declare-fun m!466391 () Bool)

(assert (=> b!487025 m!466391))

(check-sat (not b!487025) (not b!487021) (not b!487024) (not b!487020) (not start!44298) (not b!487026) (not b!487022) (not b!487023) (not b!487027))
(check-sat)

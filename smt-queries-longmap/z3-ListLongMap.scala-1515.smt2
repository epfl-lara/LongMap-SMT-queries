; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28622 () Bool)

(assert start!28622)

(declare-fun b!292623 () Bool)

(declare-fun res!153680 () Bool)

(declare-fun e!185117 () Bool)

(assert (=> b!292623 (=> (not res!153680) (not e!185117))))

(declare-datatypes ((array!14801 0))(
  ( (array!14802 (arr!7023 (Array (_ BitVec 32) (_ BitVec 64))) (size!7375 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14801)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14801 (_ BitVec 32)) Bool)

(assert (=> b!292623 (= res!153680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!153683 () Bool)

(declare-fun e!185115 () Bool)

(assert (=> start!28622 (=> (not res!153683) (not e!185115))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28622 (= res!153683 (validMask!0 mask!3809))))

(assert (=> start!28622 e!185115))

(assert (=> start!28622 true))

(declare-fun array_inv!4986 (array!14801) Bool)

(assert (=> start!28622 (array_inv!4986 a!3312)))

(declare-fun b!292624 () Bool)

(declare-fun res!153682 () Bool)

(assert (=> b!292624 (=> (not res!153682) (not e!185115))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14801 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292624 (= res!153682 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292625 () Bool)

(declare-fun res!153679 () Bool)

(assert (=> b!292625 (=> (not res!153679) (not e!185115))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!292625 (= res!153679 (and (= (size!7375 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7375 a!3312))))))

(declare-fun b!292626 () Bool)

(assert (=> b!292626 (= e!185117 false)))

(declare-fun lt!144964 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2172 0))(
  ( (MissingZero!2172 (index!10858 (_ BitVec 32))) (Found!2172 (index!10859 (_ BitVec 32))) (Intermediate!2172 (undefined!2984 Bool) (index!10860 (_ BitVec 32)) (x!29043 (_ BitVec 32))) (Undefined!2172) (MissingVacant!2172 (index!10861 (_ BitVec 32))) )
))
(declare-fun lt!144965 () SeekEntryResult!2172)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14801 (_ BitVec 32)) SeekEntryResult!2172)

(assert (=> b!292626 (= lt!144965 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144964 k0!2524 (array!14802 (store (arr!7023 a!3312) i!1256 k0!2524) (size!7375 a!3312)) mask!3809))))

(declare-fun lt!144967 () SeekEntryResult!2172)

(assert (=> b!292626 (= lt!144967 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144964 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292626 (= lt!144964 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!292627 () Bool)

(assert (=> b!292627 (= e!185115 e!185117)))

(declare-fun res!153684 () Bool)

(assert (=> b!292627 (=> (not res!153684) (not e!185117))))

(declare-fun lt!144966 () SeekEntryResult!2172)

(assert (=> b!292627 (= res!153684 (or (= lt!144966 (MissingZero!2172 i!1256)) (= lt!144966 (MissingVacant!2172 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14801 (_ BitVec 32)) SeekEntryResult!2172)

(assert (=> b!292627 (= lt!144966 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!292628 () Bool)

(declare-fun res!153681 () Bool)

(assert (=> b!292628 (=> (not res!153681) (not e!185115))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292628 (= res!153681 (validKeyInArray!0 k0!2524))))

(assert (= (and start!28622 res!153683) b!292625))

(assert (= (and b!292625 res!153679) b!292628))

(assert (= (and b!292628 res!153681) b!292624))

(assert (= (and b!292624 res!153682) b!292627))

(assert (= (and b!292627 res!153684) b!292623))

(assert (= (and b!292623 res!153680) b!292626))

(declare-fun m!306377 () Bool)

(assert (=> start!28622 m!306377))

(declare-fun m!306379 () Bool)

(assert (=> start!28622 m!306379))

(declare-fun m!306381 () Bool)

(assert (=> b!292624 m!306381))

(declare-fun m!306383 () Bool)

(assert (=> b!292623 m!306383))

(declare-fun m!306385 () Bool)

(assert (=> b!292628 m!306385))

(declare-fun m!306387 () Bool)

(assert (=> b!292627 m!306387))

(declare-fun m!306389 () Bool)

(assert (=> b!292626 m!306389))

(declare-fun m!306391 () Bool)

(assert (=> b!292626 m!306391))

(declare-fun m!306393 () Bool)

(assert (=> b!292626 m!306393))

(declare-fun m!306395 () Bool)

(assert (=> b!292626 m!306395))

(check-sat (not start!28622) (not b!292623) (not b!292627) (not b!292628) (not b!292624) (not b!292626))

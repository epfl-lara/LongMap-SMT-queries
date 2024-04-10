; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44378 () Bool)

(assert start!44378)

(declare-fun b!487743 () Bool)

(declare-fun e!286968 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(assert (=> b!487743 (= e!286968 (not (bvsge mask!3524 #b00000000000000000000000000000000)))))

(declare-datatypes ((array!31584 0))(
  ( (array!31585 (arr!15184 (Array (_ BitVec 32) (_ BitVec 64))) (size!15548 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31584)

(declare-fun lt!220142 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!487743 (= lt!220142 (toIndex!0 (select (arr!15184 a!3235) j!176) mask!3524))))

(declare-fun e!286971 () Bool)

(assert (=> b!487743 e!286971))

(declare-fun res!291018 () Bool)

(assert (=> b!487743 (=> (not res!291018) (not e!286971))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31584 (_ BitVec 32)) Bool)

(assert (=> b!487743 (= res!291018 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14248 0))(
  ( (Unit!14249) )
))
(declare-fun lt!220143 () Unit!14248)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31584 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14248)

(assert (=> b!487743 (= lt!220143 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!487744 () Bool)

(declare-fun res!291020 () Bool)

(declare-fun e!286970 () Bool)

(assert (=> b!487744 (=> (not res!291020) (not e!286970))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487744 (= res!291020 (validKeyInArray!0 k0!2280))))

(declare-fun b!487745 () Bool)

(declare-fun res!291022 () Bool)

(assert (=> b!487745 (=> (not res!291022) (not e!286968))))

(declare-datatypes ((List!9342 0))(
  ( (Nil!9339) (Cons!9338 (h!10194 (_ BitVec 64)) (t!15570 List!9342)) )
))
(declare-fun arrayNoDuplicates!0 (array!31584 (_ BitVec 32) List!9342) Bool)

(assert (=> b!487745 (= res!291022 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9339))))

(declare-fun b!487746 () Bool)

(declare-fun res!291019 () Bool)

(assert (=> b!487746 (=> (not res!291019) (not e!286970))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!487746 (= res!291019 (and (= (size!15548 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15548 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15548 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!487747 () Bool)

(assert (=> b!487747 (= e!286970 e!286968)))

(declare-fun res!291023 () Bool)

(assert (=> b!487747 (=> (not res!291023) (not e!286968))))

(declare-datatypes ((SeekEntryResult!3651 0))(
  ( (MissingZero!3651 (index!16783 (_ BitVec 32))) (Found!3651 (index!16784 (_ BitVec 32))) (Intermediate!3651 (undefined!4463 Bool) (index!16785 (_ BitVec 32)) (x!45903 (_ BitVec 32))) (Undefined!3651) (MissingVacant!3651 (index!16786 (_ BitVec 32))) )
))
(declare-fun lt!220144 () SeekEntryResult!3651)

(assert (=> b!487747 (= res!291023 (or (= lt!220144 (MissingZero!3651 i!1204)) (= lt!220144 (MissingVacant!3651 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31584 (_ BitVec 32)) SeekEntryResult!3651)

(assert (=> b!487747 (= lt!220144 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!487748 () Bool)

(declare-fun res!291016 () Bool)

(assert (=> b!487748 (=> (not res!291016) (not e!286970))))

(assert (=> b!487748 (= res!291016 (validKeyInArray!0 (select (arr!15184 a!3235) j!176)))))

(declare-fun b!487750 () Bool)

(assert (=> b!487750 (= e!286971 (= (seekEntryOrOpen!0 (select (arr!15184 a!3235) j!176) a!3235 mask!3524) (Found!3651 j!176)))))

(declare-fun b!487751 () Bool)

(declare-fun res!291017 () Bool)

(assert (=> b!487751 (=> (not res!291017) (not e!286970))))

(declare-fun arrayContainsKey!0 (array!31584 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487751 (= res!291017 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!487749 () Bool)

(declare-fun res!291021 () Bool)

(assert (=> b!487749 (=> (not res!291021) (not e!286968))))

(assert (=> b!487749 (= res!291021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!291015 () Bool)

(assert (=> start!44378 (=> (not res!291015) (not e!286970))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44378 (= res!291015 (validMask!0 mask!3524))))

(assert (=> start!44378 e!286970))

(assert (=> start!44378 true))

(declare-fun array_inv!10980 (array!31584) Bool)

(assert (=> start!44378 (array_inv!10980 a!3235)))

(assert (= (and start!44378 res!291015) b!487746))

(assert (= (and b!487746 res!291019) b!487748))

(assert (= (and b!487748 res!291016) b!487744))

(assert (= (and b!487744 res!291020) b!487751))

(assert (= (and b!487751 res!291017) b!487747))

(assert (= (and b!487747 res!291023) b!487749))

(assert (= (and b!487749 res!291021) b!487745))

(assert (= (and b!487745 res!291022) b!487743))

(assert (= (and b!487743 res!291018) b!487750))

(declare-fun m!467531 () Bool)

(assert (=> b!487747 m!467531))

(declare-fun m!467533 () Bool)

(assert (=> b!487744 m!467533))

(declare-fun m!467535 () Bool)

(assert (=> b!487749 m!467535))

(declare-fun m!467537 () Bool)

(assert (=> b!487745 m!467537))

(declare-fun m!467539 () Bool)

(assert (=> b!487743 m!467539))

(assert (=> b!487743 m!467539))

(declare-fun m!467541 () Bool)

(assert (=> b!487743 m!467541))

(declare-fun m!467543 () Bool)

(assert (=> b!487743 m!467543))

(declare-fun m!467545 () Bool)

(assert (=> b!487743 m!467545))

(declare-fun m!467547 () Bool)

(assert (=> b!487751 m!467547))

(declare-fun m!467549 () Bool)

(assert (=> start!44378 m!467549))

(declare-fun m!467551 () Bool)

(assert (=> start!44378 m!467551))

(assert (=> b!487750 m!467539))

(assert (=> b!487750 m!467539))

(declare-fun m!467553 () Bool)

(assert (=> b!487750 m!467553))

(assert (=> b!487748 m!467539))

(assert (=> b!487748 m!467539))

(declare-fun m!467555 () Bool)

(assert (=> b!487748 m!467555))

(check-sat (not b!487747) (not start!44378) (not b!487750) (not b!487748) (not b!487749) (not b!487745) (not b!487744) (not b!487751) (not b!487743))
(check-sat)

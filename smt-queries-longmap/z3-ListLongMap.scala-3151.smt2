; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44366 () Bool)

(assert start!44366)

(declare-fun b!487655 () Bool)

(declare-fun res!290984 () Bool)

(declare-fun e!286918 () Bool)

(assert (=> b!487655 (=> (not res!290984) (not e!286918))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487655 (= res!290984 (validKeyInArray!0 k0!2280))))

(declare-fun b!487656 () Bool)

(declare-fun res!290982 () Bool)

(declare-fun e!286917 () Bool)

(assert (=> b!487656 (=> (not res!290982) (not e!286917))))

(declare-datatypes ((array!31573 0))(
  ( (array!31574 (arr!15178 (Array (_ BitVec 32) (_ BitVec 64))) (size!15542 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31573)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31573 (_ BitVec 32)) Bool)

(assert (=> b!487656 (= res!290982 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!487657 () Bool)

(declare-fun res!290987 () Bool)

(assert (=> b!487657 (=> (not res!290987) (not e!286918))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!487657 (= res!290987 (validKeyInArray!0 (select (arr!15178 a!3235) j!176)))))

(declare-fun res!290986 () Bool)

(assert (=> start!44366 (=> (not res!290986) (not e!286918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44366 (= res!290986 (validMask!0 mask!3524))))

(assert (=> start!44366 e!286918))

(assert (=> start!44366 true))

(declare-fun array_inv!11037 (array!31573) Bool)

(assert (=> start!44366 (array_inv!11037 a!3235)))

(declare-fun b!487658 () Bool)

(declare-fun res!290983 () Bool)

(assert (=> b!487658 (=> (not res!290983) (not e!286917))))

(declare-datatypes ((List!9243 0))(
  ( (Nil!9240) (Cons!9239 (h!10095 (_ BitVec 64)) (t!15463 List!9243)) )
))
(declare-fun arrayNoDuplicates!0 (array!31573 (_ BitVec 32) List!9243) Bool)

(assert (=> b!487658 (= res!290983 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9240))))

(declare-fun b!487659 () Bool)

(assert (=> b!487659 (= e!286918 e!286917)))

(declare-fun res!290988 () Bool)

(assert (=> b!487659 (=> (not res!290988) (not e!286917))))

(declare-datatypes ((SeekEntryResult!3601 0))(
  ( (MissingZero!3601 (index!16583 (_ BitVec 32))) (Found!3601 (index!16584 (_ BitVec 32))) (Intermediate!3601 (undefined!4413 Bool) (index!16585 (_ BitVec 32)) (x!45850 (_ BitVec 32))) (Undefined!3601) (MissingVacant!3601 (index!16586 (_ BitVec 32))) )
))
(declare-fun lt!220147 () SeekEntryResult!3601)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!487659 (= res!290988 (or (= lt!220147 (MissingZero!3601 i!1204)) (= lt!220147 (MissingVacant!3601 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31573 (_ BitVec 32)) SeekEntryResult!3601)

(assert (=> b!487659 (= lt!220147 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!487660 () Bool)

(declare-fun e!286920 () Bool)

(assert (=> b!487660 (= e!286920 (= (seekEntryOrOpen!0 (select (arr!15178 a!3235) j!176) a!3235 mask!3524) (Found!3601 j!176)))))

(declare-fun b!487661 () Bool)

(assert (=> b!487661 (= e!286917 (not (bvsge mask!3524 #b00000000000000000000000000000000)))))

(declare-fun lt!220145 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!487661 (= lt!220145 (toIndex!0 (select (arr!15178 a!3235) j!176) mask!3524))))

(assert (=> b!487661 e!286920))

(declare-fun res!290989 () Bool)

(assert (=> b!487661 (=> (not res!290989) (not e!286920))))

(assert (=> b!487661 (= res!290989 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14209 0))(
  ( (Unit!14210) )
))
(declare-fun lt!220146 () Unit!14209)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31573 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14209)

(assert (=> b!487661 (= lt!220146 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!487662 () Bool)

(declare-fun res!290981 () Bool)

(assert (=> b!487662 (=> (not res!290981) (not e!286918))))

(assert (=> b!487662 (= res!290981 (and (= (size!15542 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15542 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15542 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!487663 () Bool)

(declare-fun res!290985 () Bool)

(assert (=> b!487663 (=> (not res!290985) (not e!286918))))

(declare-fun arrayContainsKey!0 (array!31573 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487663 (= res!290985 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!44366 res!290986) b!487662))

(assert (= (and b!487662 res!290981) b!487657))

(assert (= (and b!487657 res!290987) b!487655))

(assert (= (and b!487655 res!290984) b!487663))

(assert (= (and b!487663 res!290985) b!487659))

(assert (= (and b!487659 res!290988) b!487656))

(assert (= (and b!487656 res!290982) b!487658))

(assert (= (and b!487658 res!290983) b!487661))

(assert (= (and b!487661 res!290989) b!487660))

(declare-fun m!467689 () Bool)

(assert (=> b!487656 m!467689))

(declare-fun m!467691 () Bool)

(assert (=> b!487660 m!467691))

(assert (=> b!487660 m!467691))

(declare-fun m!467693 () Bool)

(assert (=> b!487660 m!467693))

(assert (=> b!487661 m!467691))

(assert (=> b!487661 m!467691))

(declare-fun m!467695 () Bool)

(assert (=> b!487661 m!467695))

(declare-fun m!467697 () Bool)

(assert (=> b!487661 m!467697))

(declare-fun m!467699 () Bool)

(assert (=> b!487661 m!467699))

(assert (=> b!487657 m!467691))

(assert (=> b!487657 m!467691))

(declare-fun m!467701 () Bool)

(assert (=> b!487657 m!467701))

(declare-fun m!467703 () Bool)

(assert (=> b!487659 m!467703))

(declare-fun m!467705 () Bool)

(assert (=> b!487655 m!467705))

(declare-fun m!467707 () Bool)

(assert (=> b!487663 m!467707))

(declare-fun m!467709 () Bool)

(assert (=> start!44366 m!467709))

(declare-fun m!467711 () Bool)

(assert (=> start!44366 m!467711))

(declare-fun m!467713 () Bool)

(assert (=> b!487658 m!467713))

(check-sat (not b!487660) (not start!44366) (not b!487655) (not b!487656) (not b!487657) (not b!487661) (not b!487659) (not b!487658) (not b!487663))
(check-sat)

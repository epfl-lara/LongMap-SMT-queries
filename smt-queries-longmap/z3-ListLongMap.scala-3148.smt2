; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44312 () Bool)

(assert start!44312)

(declare-fun b!487317 () Bool)

(declare-fun res!290704 () Bool)

(declare-fun e!286735 () Bool)

(assert (=> b!487317 (=> (not res!290704) (not e!286735))))

(declare-datatypes ((array!31563 0))(
  ( (array!31564 (arr!15175 (Array (_ BitVec 32) (_ BitVec 64))) (size!15539 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31563)

(declare-datatypes ((List!9333 0))(
  ( (Nil!9330) (Cons!9329 (h!10185 (_ BitVec 64)) (t!15561 List!9333)) )
))
(declare-fun arrayNoDuplicates!0 (array!31563 (_ BitVec 32) List!9333) Bool)

(assert (=> b!487317 (= res!290704 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9330))))

(declare-fun b!487318 () Bool)

(declare-fun res!290703 () Bool)

(assert (=> b!487318 (=> (not res!290703) (not e!286735))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31563 (_ BitVec 32)) Bool)

(assert (=> b!487318 (= res!290703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!290707 () Bool)

(declare-fun e!286734 () Bool)

(assert (=> start!44312 (=> (not res!290707) (not e!286734))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44312 (= res!290707 (validMask!0 mask!3524))))

(assert (=> start!44312 e!286734))

(assert (=> start!44312 true))

(declare-fun array_inv!10971 (array!31563) Bool)

(assert (=> start!44312 (array_inv!10971 a!3235)))

(declare-fun b!487319 () Bool)

(assert (=> b!487319 (= e!286735 (not (bvsge mask!3524 #b00000000000000000000000000000000)))))

(declare-fun e!286737 () Bool)

(assert (=> b!487319 e!286737))

(declare-fun res!290710 () Bool)

(assert (=> b!487319 (=> (not res!290710) (not e!286737))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!487319 (= res!290710 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14230 0))(
  ( (Unit!14231) )
))
(declare-fun lt!219994 () Unit!14230)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31563 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14230)

(assert (=> b!487319 (= lt!219994 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!487320 () Bool)

(declare-fun res!290706 () Bool)

(assert (=> b!487320 (=> (not res!290706) (not e!286734))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!487320 (= res!290706 (and (= (size!15539 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15539 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15539 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!487321 () Bool)

(declare-datatypes ((SeekEntryResult!3642 0))(
  ( (MissingZero!3642 (index!16747 (_ BitVec 32))) (Found!3642 (index!16748 (_ BitVec 32))) (Intermediate!3642 (undefined!4454 Bool) (index!16749 (_ BitVec 32)) (x!45870 (_ BitVec 32))) (Undefined!3642) (MissingVacant!3642 (index!16750 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31563 (_ BitVec 32)) SeekEntryResult!3642)

(assert (=> b!487321 (= e!286737 (= (seekEntryOrOpen!0 (select (arr!15175 a!3235) j!176) a!3235 mask!3524) (Found!3642 j!176)))))

(declare-fun b!487322 () Bool)

(declare-fun res!290711 () Bool)

(assert (=> b!487322 (=> (not res!290711) (not e!286734))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487322 (= res!290711 (validKeyInArray!0 (select (arr!15175 a!3235) j!176)))))

(declare-fun b!487323 () Bool)

(declare-fun res!290709 () Bool)

(assert (=> b!487323 (=> (not res!290709) (not e!286734))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!487323 (= res!290709 (validKeyInArray!0 k0!2280))))

(declare-fun b!487324 () Bool)

(declare-fun res!290708 () Bool)

(assert (=> b!487324 (=> (not res!290708) (not e!286734))))

(declare-fun arrayContainsKey!0 (array!31563 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487324 (= res!290708 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!487325 () Bool)

(assert (=> b!487325 (= e!286734 e!286735)))

(declare-fun res!290705 () Bool)

(assert (=> b!487325 (=> (not res!290705) (not e!286735))))

(declare-fun lt!219993 () SeekEntryResult!3642)

(assert (=> b!487325 (= res!290705 (or (= lt!219993 (MissingZero!3642 i!1204)) (= lt!219993 (MissingVacant!3642 i!1204))))))

(assert (=> b!487325 (= lt!219993 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!44312 res!290707) b!487320))

(assert (= (and b!487320 res!290706) b!487322))

(assert (= (and b!487322 res!290711) b!487323))

(assert (= (and b!487323 res!290709) b!487324))

(assert (= (and b!487324 res!290708) b!487325))

(assert (= (and b!487325 res!290705) b!487318))

(assert (= (and b!487318 res!290703) b!487317))

(assert (= (and b!487317 res!290704) b!487319))

(assert (= (and b!487319 res!290710) b!487321))

(declare-fun m!467145 () Bool)

(assert (=> b!487323 m!467145))

(declare-fun m!467147 () Bool)

(assert (=> b!487322 m!467147))

(assert (=> b!487322 m!467147))

(declare-fun m!467149 () Bool)

(assert (=> b!487322 m!467149))

(declare-fun m!467151 () Bool)

(assert (=> start!44312 m!467151))

(declare-fun m!467153 () Bool)

(assert (=> start!44312 m!467153))

(assert (=> b!487321 m!467147))

(assert (=> b!487321 m!467147))

(declare-fun m!467155 () Bool)

(assert (=> b!487321 m!467155))

(declare-fun m!467157 () Bool)

(assert (=> b!487325 m!467157))

(declare-fun m!467159 () Bool)

(assert (=> b!487318 m!467159))

(declare-fun m!467161 () Bool)

(assert (=> b!487324 m!467161))

(declare-fun m!467163 () Bool)

(assert (=> b!487319 m!467163))

(declare-fun m!467165 () Bool)

(assert (=> b!487319 m!467165))

(declare-fun m!467167 () Bool)

(assert (=> b!487317 m!467167))

(check-sat (not b!487321) (not b!487325) (not b!487317) (not b!487324) (not b!487319) (not start!44312) (not b!487322) (not b!487323) (not b!487318))
(check-sat)

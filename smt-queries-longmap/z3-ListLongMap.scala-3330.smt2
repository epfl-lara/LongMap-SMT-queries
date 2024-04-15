; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45960 () Bool)

(assert start!45960)

(declare-fun b!508649 () Bool)

(declare-fun res!309642 () Bool)

(declare-fun e!297516 () Bool)

(assert (=> b!508649 (=> (not res!309642) (not e!297516))))

(declare-datatypes ((array!32681 0))(
  ( (array!32682 (arr!15719 (Array (_ BitVec 32) (_ BitVec 64))) (size!16084 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32681)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32681 (_ BitVec 32)) Bool)

(assert (=> b!508649 (= res!309642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!508650 () Bool)

(declare-fun res!309636 () Bool)

(assert (=> b!508650 (=> (not res!309636) (not e!297516))))

(declare-datatypes ((List!9916 0))(
  ( (Nil!9913) (Cons!9912 (h!10789 (_ BitVec 64)) (t!16135 List!9916)) )
))
(declare-fun arrayNoDuplicates!0 (array!32681 (_ BitVec 32) List!9916) Bool)

(assert (=> b!508650 (= res!309636 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9913))))

(declare-fun b!508651 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!297519 () Bool)

(declare-datatypes ((SeekEntryResult!4183 0))(
  ( (MissingZero!4183 (index!18920 (_ BitVec 32))) (Found!4183 (index!18921 (_ BitVec 32))) (Intermediate!4183 (undefined!4995 Bool) (index!18922 (_ BitVec 32)) (x!47907 (_ BitVec 32))) (Undefined!4183) (MissingVacant!4183 (index!18923 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32681 (_ BitVec 32)) SeekEntryResult!4183)

(assert (=> b!508651 (= e!297519 (= (seekEntryOrOpen!0 (select (arr!15719 a!3235) j!176) a!3235 mask!3524) (Found!4183 j!176)))))

(declare-fun b!508652 () Bool)

(declare-fun res!309639 () Bool)

(declare-fun e!297518 () Bool)

(assert (=> b!508652 (=> (not res!309639) (not e!297518))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32681 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508652 (= res!309639 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!508653 () Bool)

(assert (=> b!508653 (= e!297516 (not true))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!232157 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!508653 (= lt!232157 (toIndex!0 (select (store (arr!15719 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!508653 e!297519))

(declare-fun res!309637 () Bool)

(assert (=> b!508653 (=> (not res!309637) (not e!297519))))

(assert (=> b!508653 (= res!309637 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15610 0))(
  ( (Unit!15611) )
))
(declare-fun lt!232158 () Unit!15610)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32681 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15610)

(assert (=> b!508653 (= lt!232158 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!508654 () Bool)

(declare-fun res!309644 () Bool)

(assert (=> b!508654 (=> (not res!309644) (not e!297518))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508654 (= res!309644 (validKeyInArray!0 (select (arr!15719 a!3235) j!176)))))

(declare-fun b!508655 () Bool)

(assert (=> b!508655 (= e!297518 e!297516)))

(declare-fun res!309640 () Bool)

(assert (=> b!508655 (=> (not res!309640) (not e!297516))))

(declare-fun lt!232159 () SeekEntryResult!4183)

(assert (=> b!508655 (= res!309640 (or (= lt!232159 (MissingZero!4183 i!1204)) (= lt!232159 (MissingVacant!4183 i!1204))))))

(assert (=> b!508655 (= lt!232159 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!309641 () Bool)

(assert (=> start!45960 (=> (not res!309641) (not e!297518))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45960 (= res!309641 (validMask!0 mask!3524))))

(assert (=> start!45960 e!297518))

(assert (=> start!45960 true))

(declare-fun array_inv!11602 (array!32681) Bool)

(assert (=> start!45960 (array_inv!11602 a!3235)))

(declare-fun b!508656 () Bool)

(declare-fun res!309643 () Bool)

(assert (=> b!508656 (=> (not res!309643) (not e!297518))))

(assert (=> b!508656 (= res!309643 (and (= (size!16084 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16084 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16084 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!508657 () Bool)

(declare-fun res!309638 () Bool)

(assert (=> b!508657 (=> (not res!309638) (not e!297518))))

(assert (=> b!508657 (= res!309638 (validKeyInArray!0 k0!2280))))

(assert (= (and start!45960 res!309641) b!508656))

(assert (= (and b!508656 res!309643) b!508654))

(assert (= (and b!508654 res!309644) b!508657))

(assert (= (and b!508657 res!309638) b!508652))

(assert (= (and b!508652 res!309639) b!508655))

(assert (= (and b!508655 res!309640) b!508649))

(assert (= (and b!508649 res!309642) b!508650))

(assert (= (and b!508650 res!309636) b!508653))

(assert (= (and b!508653 res!309637) b!508651))

(declare-fun m!488899 () Bool)

(assert (=> b!508652 m!488899))

(declare-fun m!488901 () Bool)

(assert (=> start!45960 m!488901))

(declare-fun m!488903 () Bool)

(assert (=> start!45960 m!488903))

(declare-fun m!488905 () Bool)

(assert (=> b!508657 m!488905))

(declare-fun m!488907 () Bool)

(assert (=> b!508650 m!488907))

(declare-fun m!488909 () Bool)

(assert (=> b!508654 m!488909))

(assert (=> b!508654 m!488909))

(declare-fun m!488911 () Bool)

(assert (=> b!508654 m!488911))

(declare-fun m!488913 () Bool)

(assert (=> b!508655 m!488913))

(declare-fun m!488915 () Bool)

(assert (=> b!508649 m!488915))

(declare-fun m!488917 () Bool)

(assert (=> b!508653 m!488917))

(declare-fun m!488919 () Bool)

(assert (=> b!508653 m!488919))

(declare-fun m!488921 () Bool)

(assert (=> b!508653 m!488921))

(declare-fun m!488923 () Bool)

(assert (=> b!508653 m!488923))

(assert (=> b!508653 m!488921))

(declare-fun m!488925 () Bool)

(assert (=> b!508653 m!488925))

(assert (=> b!508651 m!488909))

(assert (=> b!508651 m!488909))

(declare-fun m!488927 () Bool)

(assert (=> b!508651 m!488927))

(check-sat (not b!508654) (not b!508652) (not b!508649) (not b!508655) (not b!508657) (not start!45960) (not b!508650) (not b!508651) (not b!508653))
(check-sat)

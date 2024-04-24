; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46220 () Bool)

(assert start!46220)

(declare-fun b!511879 () Bool)

(declare-fun e!299028 () Bool)

(assert (=> b!511879 (= e!299028 true)))

(declare-datatypes ((SeekEntryResult!4237 0))(
  ( (MissingZero!4237 (index!19136 (_ BitVec 32))) (Found!4237 (index!19137 (_ BitVec 32))) (Intermediate!4237 (undefined!5049 Bool) (index!19138 (_ BitVec 32)) (x!48233 (_ BitVec 32))) (Undefined!4237) (MissingVacant!4237 (index!19139 (_ BitVec 32))) )
))
(declare-fun lt!234295 () SeekEntryResult!4237)

(assert (=> b!511879 (= lt!234295 Undefined!4237)))

(declare-fun b!511880 () Bool)

(declare-fun res!312596 () Bool)

(declare-fun e!299027 () Bool)

(assert (=> b!511880 (=> (not res!312596) (not e!299027))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!511880 (= res!312596 (validKeyInArray!0 k0!2280))))

(declare-fun b!511881 () Bool)

(declare-fun e!299026 () Bool)

(assert (=> b!511881 (= e!299027 e!299026)))

(declare-fun res!312602 () Bool)

(assert (=> b!511881 (=> (not res!312602) (not e!299026))))

(declare-fun lt!234294 () SeekEntryResult!4237)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!511881 (= res!312602 (or (= lt!234294 (MissingZero!4237 i!1204)) (= lt!234294 (MissingVacant!4237 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32875 0))(
  ( (array!32876 (arr!15814 (Array (_ BitVec 32) (_ BitVec 64))) (size!16178 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32875)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32875 (_ BitVec 32)) SeekEntryResult!4237)

(assert (=> b!511881 (= lt!234294 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!312595 () Bool)

(assert (=> start!46220 (=> (not res!312595) (not e!299027))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46220 (= res!312595 (validMask!0 mask!3524))))

(assert (=> start!46220 e!299027))

(assert (=> start!46220 true))

(declare-fun array_inv!11673 (array!32875) Bool)

(assert (=> start!46220 (array_inv!11673 a!3235)))

(declare-fun b!511882 () Bool)

(declare-fun res!312598 () Bool)

(assert (=> b!511882 (=> (not res!312598) (not e!299027))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!511882 (= res!312598 (and (= (size!16178 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16178 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16178 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!511883 () Bool)

(declare-fun res!312604 () Bool)

(assert (=> b!511883 (=> res!312604 e!299028)))

(declare-fun lt!234297 () SeekEntryResult!4237)

(get-info :version)

(assert (=> b!511883 (= res!312604 (or (not ((_ is Intermediate!4237) lt!234297)) (not (undefined!5049 lt!234297))))))

(declare-fun b!511884 () Bool)

(declare-fun res!312599 () Bool)

(assert (=> b!511884 (=> (not res!312599) (not e!299027))))

(declare-fun arrayContainsKey!0 (array!32875 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!511884 (= res!312599 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!511885 () Bool)

(declare-fun res!312597 () Bool)

(assert (=> b!511885 (=> (not res!312597) (not e!299026))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32875 (_ BitVec 32)) Bool)

(assert (=> b!511885 (= res!312597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!511886 () Bool)

(declare-fun res!312601 () Bool)

(assert (=> b!511886 (=> (not res!312601) (not e!299027))))

(assert (=> b!511886 (= res!312601 (validKeyInArray!0 (select (arr!15814 a!3235) j!176)))))

(declare-fun b!511887 () Bool)

(declare-fun res!312603 () Bool)

(assert (=> b!511887 (=> (not res!312603) (not e!299026))))

(declare-datatypes ((List!9879 0))(
  ( (Nil!9876) (Cons!9875 (h!10755 (_ BitVec 64)) (t!16099 List!9879)) )
))
(declare-fun arrayNoDuplicates!0 (array!32875 (_ BitVec 32) List!9879) Bool)

(assert (=> b!511887 (= res!312603 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9876))))

(declare-fun b!511888 () Bool)

(assert (=> b!511888 (= e!299026 (not e!299028))))

(declare-fun res!312600 () Bool)

(assert (=> b!511888 (=> res!312600 e!299028)))

(declare-fun lt!234296 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32875 (_ BitVec 32)) SeekEntryResult!4237)

(assert (=> b!511888 (= res!312600 (= lt!234297 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234296 (select (store (arr!15814 a!3235) i!1204 k0!2280) j!176) (array!32876 (store (arr!15814 a!3235) i!1204 k0!2280) (size!16178 a!3235)) mask!3524)))))

(declare-fun lt!234298 () (_ BitVec 32))

(assert (=> b!511888 (= lt!234297 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234298 (select (arr!15814 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511888 (= lt!234296 (toIndex!0 (select (store (arr!15814 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!511888 (= lt!234298 (toIndex!0 (select (arr!15814 a!3235) j!176) mask!3524))))

(assert (=> b!511888 (= lt!234295 (Found!4237 j!176))))

(assert (=> b!511888 (= lt!234295 (seekEntryOrOpen!0 (select (arr!15814 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!511888 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15793 0))(
  ( (Unit!15794) )
))
(declare-fun lt!234293 () Unit!15793)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32875 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15793)

(assert (=> b!511888 (= lt!234293 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!46220 res!312595) b!511882))

(assert (= (and b!511882 res!312598) b!511886))

(assert (= (and b!511886 res!312601) b!511880))

(assert (= (and b!511880 res!312596) b!511884))

(assert (= (and b!511884 res!312599) b!511881))

(assert (= (and b!511881 res!312602) b!511885))

(assert (= (and b!511885 res!312597) b!511887))

(assert (= (and b!511887 res!312603) b!511888))

(assert (= (and b!511888 (not res!312600)) b!511883))

(assert (= (and b!511883 (not res!312604)) b!511879))

(declare-fun m!493681 () Bool)

(assert (=> b!511884 m!493681))

(declare-fun m!493683 () Bool)

(assert (=> b!511888 m!493683))

(declare-fun m!493685 () Bool)

(assert (=> b!511888 m!493685))

(declare-fun m!493687 () Bool)

(assert (=> b!511888 m!493687))

(declare-fun m!493689 () Bool)

(assert (=> b!511888 m!493689))

(declare-fun m!493691 () Bool)

(assert (=> b!511888 m!493691))

(assert (=> b!511888 m!493685))

(declare-fun m!493693 () Bool)

(assert (=> b!511888 m!493693))

(assert (=> b!511888 m!493685))

(declare-fun m!493695 () Bool)

(assert (=> b!511888 m!493695))

(assert (=> b!511888 m!493685))

(declare-fun m!493697 () Bool)

(assert (=> b!511888 m!493697))

(assert (=> b!511888 m!493691))

(declare-fun m!493699 () Bool)

(assert (=> b!511888 m!493699))

(assert (=> b!511888 m!493691))

(declare-fun m!493701 () Bool)

(assert (=> b!511888 m!493701))

(declare-fun m!493703 () Bool)

(assert (=> b!511887 m!493703))

(assert (=> b!511886 m!493685))

(assert (=> b!511886 m!493685))

(declare-fun m!493705 () Bool)

(assert (=> b!511886 m!493705))

(declare-fun m!493707 () Bool)

(assert (=> b!511881 m!493707))

(declare-fun m!493709 () Bool)

(assert (=> b!511885 m!493709))

(declare-fun m!493711 () Bool)

(assert (=> start!46220 m!493711))

(declare-fun m!493713 () Bool)

(assert (=> start!46220 m!493713))

(declare-fun m!493715 () Bool)

(assert (=> b!511880 m!493715))

(check-sat (not b!511887) (not b!511880) (not b!511881) (not b!511884) (not b!511888) (not b!511885) (not b!511886) (not start!46220))
(check-sat)

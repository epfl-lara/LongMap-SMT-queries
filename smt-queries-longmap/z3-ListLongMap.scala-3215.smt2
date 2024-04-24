; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45026 () Bool)

(assert start!45026)

(declare-fun res!296753 () Bool)

(declare-fun e!290045 () Bool)

(assert (=> start!45026 (=> (not res!296753) (not e!290045))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45026 (= res!296753 (validMask!0 mask!3524))))

(assert (=> start!45026 e!290045))

(assert (=> start!45026 true))

(declare-datatypes ((array!31972 0))(
  ( (array!31973 (arr!15370 (Array (_ BitVec 32) (_ BitVec 64))) (size!15734 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31972)

(declare-fun array_inv!11229 (array!31972) Bool)

(assert (=> start!45026 (array_inv!11229 a!3235)))

(declare-fun b!494125 () Bool)

(declare-fun res!296749 () Bool)

(assert (=> b!494125 (=> (not res!296749) (not e!290045))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494125 (= res!296749 (validKeyInArray!0 (select (arr!15370 a!3235) j!176)))))

(declare-fun b!494126 () Bool)

(declare-fun res!296750 () Bool)

(declare-fun e!290043 () Bool)

(assert (=> b!494126 (=> (not res!296750) (not e!290043))))

(declare-datatypes ((List!9435 0))(
  ( (Nil!9432) (Cons!9431 (h!10299 (_ BitVec 64)) (t!15655 List!9435)) )
))
(declare-fun arrayNoDuplicates!0 (array!31972 (_ BitVec 32) List!9435) Bool)

(assert (=> b!494126 (= res!296750 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9432))))

(declare-fun b!494127 () Bool)

(assert (=> b!494127 (= e!290045 e!290043)))

(declare-fun res!296756 () Bool)

(assert (=> b!494127 (=> (not res!296756) (not e!290043))))

(declare-datatypes ((SeekEntryResult!3793 0))(
  ( (MissingZero!3793 (index!17351 (_ BitVec 32))) (Found!3793 (index!17352 (_ BitVec 32))) (Intermediate!3793 (undefined!4605 Bool) (index!17353 (_ BitVec 32)) (x!46572 (_ BitVec 32))) (Undefined!3793) (MissingVacant!3793 (index!17354 (_ BitVec 32))) )
))
(declare-fun lt!223635 () SeekEntryResult!3793)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!494127 (= res!296756 (or (= lt!223635 (MissingZero!3793 i!1204)) (= lt!223635 (MissingVacant!3793 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31972 (_ BitVec 32)) SeekEntryResult!3793)

(assert (=> b!494127 (= lt!223635 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!494128 () Bool)

(declare-fun e!290046 () Bool)

(assert (=> b!494128 (= e!290046 true)))

(declare-fun lt!223634 () SeekEntryResult!3793)

(assert (=> b!494128 (= lt!223634 Undefined!3793)))

(declare-fun b!494129 () Bool)

(assert (=> b!494129 (= e!290043 (not e!290046))))

(declare-fun res!296755 () Bool)

(assert (=> b!494129 (=> res!296755 e!290046)))

(declare-fun lt!223632 () SeekEntryResult!3793)

(declare-fun lt!223633 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31972 (_ BitVec 32)) SeekEntryResult!3793)

(assert (=> b!494129 (= res!296755 (= lt!223632 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223633 (select (store (arr!15370 a!3235) i!1204 k0!2280) j!176) (array!31973 (store (arr!15370 a!3235) i!1204 k0!2280) (size!15734 a!3235)) mask!3524)))))

(declare-fun lt!223631 () (_ BitVec 32))

(assert (=> b!494129 (= lt!223632 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223631 (select (arr!15370 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494129 (= lt!223633 (toIndex!0 (select (store (arr!15370 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!494129 (= lt!223631 (toIndex!0 (select (arr!15370 a!3235) j!176) mask!3524))))

(assert (=> b!494129 (= lt!223634 (Found!3793 j!176))))

(assert (=> b!494129 (= lt!223634 (seekEntryOrOpen!0 (select (arr!15370 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31972 (_ BitVec 32)) Bool)

(assert (=> b!494129 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14593 0))(
  ( (Unit!14594) )
))
(declare-fun lt!223636 () Unit!14593)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31972 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14593)

(assert (=> b!494129 (= lt!223636 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!494130 () Bool)

(declare-fun res!296754 () Bool)

(assert (=> b!494130 (=> (not res!296754) (not e!290043))))

(assert (=> b!494130 (= res!296754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!494131 () Bool)

(declare-fun res!296751 () Bool)

(assert (=> b!494131 (=> (not res!296751) (not e!290045))))

(assert (=> b!494131 (= res!296751 (validKeyInArray!0 k0!2280))))

(declare-fun b!494132 () Bool)

(declare-fun res!296758 () Bool)

(assert (=> b!494132 (=> (not res!296758) (not e!290045))))

(declare-fun arrayContainsKey!0 (array!31972 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494132 (= res!296758 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!494133 () Bool)

(declare-fun res!296752 () Bool)

(assert (=> b!494133 (=> (not res!296752) (not e!290045))))

(assert (=> b!494133 (= res!296752 (and (= (size!15734 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15734 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15734 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!494134 () Bool)

(declare-fun res!296757 () Bool)

(assert (=> b!494134 (=> res!296757 e!290046)))

(get-info :version)

(assert (=> b!494134 (= res!296757 (or (not ((_ is Intermediate!3793) lt!223632)) (not (undefined!4605 lt!223632))))))

(assert (= (and start!45026 res!296753) b!494133))

(assert (= (and b!494133 res!296752) b!494125))

(assert (= (and b!494125 res!296749) b!494131))

(assert (= (and b!494131 res!296751) b!494132))

(assert (= (and b!494132 res!296758) b!494127))

(assert (= (and b!494127 res!296756) b!494130))

(assert (= (and b!494130 res!296754) b!494126))

(assert (= (and b!494126 res!296750) b!494129))

(assert (= (and b!494129 (not res!296755)) b!494134))

(assert (= (and b!494134 (not res!296757)) b!494128))

(declare-fun m!475363 () Bool)

(assert (=> start!45026 m!475363))

(declare-fun m!475365 () Bool)

(assert (=> start!45026 m!475365))

(declare-fun m!475367 () Bool)

(assert (=> b!494131 m!475367))

(declare-fun m!475369 () Bool)

(assert (=> b!494130 m!475369))

(declare-fun m!475371 () Bool)

(assert (=> b!494127 m!475371))

(declare-fun m!475373 () Bool)

(assert (=> b!494125 m!475373))

(assert (=> b!494125 m!475373))

(declare-fun m!475375 () Bool)

(assert (=> b!494125 m!475375))

(declare-fun m!475377 () Bool)

(assert (=> b!494126 m!475377))

(declare-fun m!475379 () Bool)

(assert (=> b!494129 m!475379))

(declare-fun m!475381 () Bool)

(assert (=> b!494129 m!475381))

(declare-fun m!475383 () Bool)

(assert (=> b!494129 m!475383))

(assert (=> b!494129 m!475373))

(declare-fun m!475385 () Bool)

(assert (=> b!494129 m!475385))

(assert (=> b!494129 m!475373))

(declare-fun m!475387 () Bool)

(assert (=> b!494129 m!475387))

(assert (=> b!494129 m!475373))

(declare-fun m!475389 () Bool)

(assert (=> b!494129 m!475389))

(assert (=> b!494129 m!475373))

(declare-fun m!475391 () Bool)

(assert (=> b!494129 m!475391))

(assert (=> b!494129 m!475383))

(declare-fun m!475393 () Bool)

(assert (=> b!494129 m!475393))

(assert (=> b!494129 m!475383))

(declare-fun m!475395 () Bool)

(assert (=> b!494129 m!475395))

(declare-fun m!475397 () Bool)

(assert (=> b!494132 m!475397))

(check-sat (not start!45026) (not b!494132) (not b!494130) (not b!494125) (not b!494126) (not b!494131) (not b!494129) (not b!494127))
(check-sat)

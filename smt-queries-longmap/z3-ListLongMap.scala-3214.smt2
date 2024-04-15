; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45018 () Bool)

(assert start!45018)

(declare-fun b!493825 () Bool)

(declare-fun res!296540 () Bool)

(declare-fun e!289874 () Bool)

(assert (=> b!493825 (=> (not res!296540) (not e!289874))))

(declare-datatypes ((array!31973 0))(
  ( (array!31974 (arr!15371 (Array (_ BitVec 32) (_ BitVec 64))) (size!15736 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31973)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31973 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493825 (= res!296540 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!493826 () Bool)

(declare-fun e!289875 () Bool)

(assert (=> b!493826 (= e!289874 e!289875)))

(declare-fun res!296542 () Bool)

(assert (=> b!493826 (=> (not res!296542) (not e!289875))))

(declare-datatypes ((SeekEntryResult!3835 0))(
  ( (MissingZero!3835 (index!17519 (_ BitVec 32))) (Found!3835 (index!17520 (_ BitVec 32))) (Intermediate!3835 (undefined!4647 Bool) (index!17521 (_ BitVec 32)) (x!46604 (_ BitVec 32))) (Undefined!3835) (MissingVacant!3835 (index!17522 (_ BitVec 32))) )
))
(declare-fun lt!223332 () SeekEntryResult!3835)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!493826 (= res!296542 (or (= lt!223332 (MissingZero!3835 i!1204)) (= lt!223332 (MissingVacant!3835 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31973 (_ BitVec 32)) SeekEntryResult!3835)

(assert (=> b!493826 (= lt!223332 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!493828 () Bool)

(declare-fun e!289872 () Bool)

(assert (=> b!493828 (= e!289875 (not e!289872))))

(declare-fun res!296545 () Bool)

(assert (=> b!493828 (=> res!296545 e!289872)))

(declare-fun lt!223333 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!223334 () SeekEntryResult!3835)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31973 (_ BitVec 32)) SeekEntryResult!3835)

(assert (=> b!493828 (= res!296545 (= lt!223334 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223333 (select (store (arr!15371 a!3235) i!1204 k0!2280) j!176) (array!31974 (store (arr!15371 a!3235) i!1204 k0!2280) (size!15736 a!3235)) mask!3524)))))

(declare-fun lt!223336 () (_ BitVec 32))

(assert (=> b!493828 (= lt!223334 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223336 (select (arr!15371 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493828 (= lt!223333 (toIndex!0 (select (store (arr!15371 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!493828 (= lt!223336 (toIndex!0 (select (arr!15371 a!3235) j!176) mask!3524))))

(declare-fun lt!223335 () SeekEntryResult!3835)

(assert (=> b!493828 (= lt!223335 (Found!3835 j!176))))

(assert (=> b!493828 (= lt!223335 (seekEntryOrOpen!0 (select (arr!15371 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31973 (_ BitVec 32)) Bool)

(assert (=> b!493828 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14602 0))(
  ( (Unit!14603) )
))
(declare-fun lt!223331 () Unit!14602)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31973 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14602)

(assert (=> b!493828 (= lt!223331 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493829 () Bool)

(declare-fun res!296538 () Bool)

(assert (=> b!493829 (=> res!296538 e!289872)))

(get-info :version)

(assert (=> b!493829 (= res!296538 (or (not ((_ is Intermediate!3835) lt!223334)) (not (undefined!4647 lt!223334))))))

(declare-fun b!493830 () Bool)

(declare-fun res!296546 () Bool)

(assert (=> b!493830 (=> (not res!296546) (not e!289874))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493830 (= res!296546 (validKeyInArray!0 (select (arr!15371 a!3235) j!176)))))

(declare-fun b!493831 () Bool)

(declare-fun res!296539 () Bool)

(assert (=> b!493831 (=> (not res!296539) (not e!289874))))

(assert (=> b!493831 (= res!296539 (validKeyInArray!0 k0!2280))))

(declare-fun b!493832 () Bool)

(assert (=> b!493832 (= e!289872 true)))

(assert (=> b!493832 (= lt!223335 Undefined!3835)))

(declare-fun b!493827 () Bool)

(declare-fun res!296543 () Bool)

(assert (=> b!493827 (=> (not res!296543) (not e!289875))))

(assert (=> b!493827 (= res!296543 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!296541 () Bool)

(assert (=> start!45018 (=> (not res!296541) (not e!289874))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45018 (= res!296541 (validMask!0 mask!3524))))

(assert (=> start!45018 e!289874))

(assert (=> start!45018 true))

(declare-fun array_inv!11254 (array!31973) Bool)

(assert (=> start!45018 (array_inv!11254 a!3235)))

(declare-fun b!493833 () Bool)

(declare-fun res!296544 () Bool)

(assert (=> b!493833 (=> (not res!296544) (not e!289874))))

(assert (=> b!493833 (= res!296544 (and (= (size!15736 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15736 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15736 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493834 () Bool)

(declare-fun res!296537 () Bool)

(assert (=> b!493834 (=> (not res!296537) (not e!289875))))

(declare-datatypes ((List!9568 0))(
  ( (Nil!9565) (Cons!9564 (h!10432 (_ BitVec 64)) (t!15787 List!9568)) )
))
(declare-fun arrayNoDuplicates!0 (array!31973 (_ BitVec 32) List!9568) Bool)

(assert (=> b!493834 (= res!296537 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9565))))

(assert (= (and start!45018 res!296541) b!493833))

(assert (= (and b!493833 res!296544) b!493830))

(assert (= (and b!493830 res!296546) b!493831))

(assert (= (and b!493831 res!296539) b!493825))

(assert (= (and b!493825 res!296540) b!493826))

(assert (= (and b!493826 res!296542) b!493827))

(assert (= (and b!493827 res!296543) b!493834))

(assert (= (and b!493834 res!296537) b!493828))

(assert (= (and b!493828 (not res!296545)) b!493829))

(assert (= (and b!493829 (not res!296538)) b!493832))

(declare-fun m!474319 () Bool)

(assert (=> b!493834 m!474319))

(declare-fun m!474321 () Bool)

(assert (=> b!493825 m!474321))

(declare-fun m!474323 () Bool)

(assert (=> start!45018 m!474323))

(declare-fun m!474325 () Bool)

(assert (=> start!45018 m!474325))

(declare-fun m!474327 () Bool)

(assert (=> b!493830 m!474327))

(assert (=> b!493830 m!474327))

(declare-fun m!474329 () Bool)

(assert (=> b!493830 m!474329))

(declare-fun m!474331 () Bool)

(assert (=> b!493827 m!474331))

(declare-fun m!474333 () Bool)

(assert (=> b!493828 m!474333))

(declare-fun m!474335 () Bool)

(assert (=> b!493828 m!474335))

(declare-fun m!474337 () Bool)

(assert (=> b!493828 m!474337))

(assert (=> b!493828 m!474327))

(declare-fun m!474339 () Bool)

(assert (=> b!493828 m!474339))

(assert (=> b!493828 m!474327))

(declare-fun m!474341 () Bool)

(assert (=> b!493828 m!474341))

(assert (=> b!493828 m!474327))

(declare-fun m!474343 () Bool)

(assert (=> b!493828 m!474343))

(assert (=> b!493828 m!474327))

(declare-fun m!474345 () Bool)

(assert (=> b!493828 m!474345))

(assert (=> b!493828 m!474337))

(declare-fun m!474347 () Bool)

(assert (=> b!493828 m!474347))

(assert (=> b!493828 m!474337))

(declare-fun m!474349 () Bool)

(assert (=> b!493828 m!474349))

(declare-fun m!474351 () Bool)

(assert (=> b!493826 m!474351))

(declare-fun m!474353 () Bool)

(assert (=> b!493831 m!474353))

(check-sat (not b!493834) (not b!493827) (not start!45018) (not b!493828) (not b!493826) (not b!493830) (not b!493825) (not b!493831))
(check-sat)

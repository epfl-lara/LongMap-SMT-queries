; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44612 () Bool)

(assert start!44612)

(declare-fun b!489354 () Bool)

(declare-fun res!292293 () Bool)

(declare-fun e!287824 () Bool)

(assert (=> b!489354 (=> (not res!292293) (not e!287824))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489354 (= res!292293 (validKeyInArray!0 k0!2280))))

(declare-fun b!489355 () Bool)

(declare-fun res!292298 () Bool)

(assert (=> b!489355 (=> (not res!292298) (not e!287824))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31671 0))(
  ( (array!31672 (arr!15223 (Array (_ BitVec 32) (_ BitVec 64))) (size!15587 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31671)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!489355 (= res!292298 (and (= (size!15587 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15587 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15587 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!489356 () Bool)

(declare-fun e!287823 () Bool)

(assert (=> b!489356 (= e!287823 (not true))))

(declare-datatypes ((SeekEntryResult!3690 0))(
  ( (MissingZero!3690 (index!16939 (_ BitVec 32))) (Found!3690 (index!16940 (_ BitVec 32))) (Intermediate!3690 (undefined!4502 Bool) (index!16941 (_ BitVec 32)) (x!46052 (_ BitVec 32))) (Undefined!3690) (MissingVacant!3690 (index!16942 (_ BitVec 32))) )
))
(declare-fun lt!220769 () SeekEntryResult!3690)

(declare-fun lt!220771 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31671 (_ BitVec 32)) SeekEntryResult!3690)

(assert (=> b!489356 (= lt!220769 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220771 (select (store (arr!15223 a!3235) i!1204 k0!2280) j!176) (array!31672 (store (arr!15223 a!3235) i!1204 k0!2280) (size!15587 a!3235)) mask!3524))))

(declare-fun lt!220774 () SeekEntryResult!3690)

(declare-fun lt!220770 () (_ BitVec 32))

(assert (=> b!489356 (= lt!220774 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220770 (select (arr!15223 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489356 (= lt!220771 (toIndex!0 (select (store (arr!15223 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!489356 (= lt!220770 (toIndex!0 (select (arr!15223 a!3235) j!176) mask!3524))))

(declare-fun e!287826 () Bool)

(assert (=> b!489356 e!287826))

(declare-fun res!292291 () Bool)

(assert (=> b!489356 (=> (not res!292291) (not e!287826))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31671 (_ BitVec 32)) Bool)

(assert (=> b!489356 (= res!292291 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14326 0))(
  ( (Unit!14327) )
))
(declare-fun lt!220773 () Unit!14326)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31671 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14326)

(assert (=> b!489356 (= lt!220773 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489357 () Bool)

(declare-fun res!292296 () Bool)

(assert (=> b!489357 (=> (not res!292296) (not e!287824))))

(assert (=> b!489357 (= res!292296 (validKeyInArray!0 (select (arr!15223 a!3235) j!176)))))

(declare-fun b!489358 () Bool)

(declare-fun res!292295 () Bool)

(assert (=> b!489358 (=> (not res!292295) (not e!287823))))

(declare-datatypes ((List!9381 0))(
  ( (Nil!9378) (Cons!9377 (h!10239 (_ BitVec 64)) (t!15609 List!9381)) )
))
(declare-fun arrayNoDuplicates!0 (array!31671 (_ BitVec 32) List!9381) Bool)

(assert (=> b!489358 (= res!292295 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9378))))

(declare-fun b!489359 () Bool)

(declare-fun res!292297 () Bool)

(assert (=> b!489359 (=> (not res!292297) (not e!287823))))

(assert (=> b!489359 (= res!292297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489361 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31671 (_ BitVec 32)) SeekEntryResult!3690)

(assert (=> b!489361 (= e!287826 (= (seekEntryOrOpen!0 (select (arr!15223 a!3235) j!176) a!3235 mask!3524) (Found!3690 j!176)))))

(declare-fun b!489362 () Bool)

(declare-fun res!292292 () Bool)

(assert (=> b!489362 (=> (not res!292292) (not e!287824))))

(declare-fun arrayContainsKey!0 (array!31671 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489362 (= res!292292 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!489360 () Bool)

(assert (=> b!489360 (= e!287824 e!287823)))

(declare-fun res!292294 () Bool)

(assert (=> b!489360 (=> (not res!292294) (not e!287823))))

(declare-fun lt!220772 () SeekEntryResult!3690)

(assert (=> b!489360 (= res!292294 (or (= lt!220772 (MissingZero!3690 i!1204)) (= lt!220772 (MissingVacant!3690 i!1204))))))

(assert (=> b!489360 (= lt!220772 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!292290 () Bool)

(assert (=> start!44612 (=> (not res!292290) (not e!287824))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44612 (= res!292290 (validMask!0 mask!3524))))

(assert (=> start!44612 e!287824))

(assert (=> start!44612 true))

(declare-fun array_inv!11019 (array!31671) Bool)

(assert (=> start!44612 (array_inv!11019 a!3235)))

(assert (= (and start!44612 res!292290) b!489355))

(assert (= (and b!489355 res!292298) b!489357))

(assert (= (and b!489357 res!292296) b!489354))

(assert (= (and b!489354 res!292293) b!489362))

(assert (= (and b!489362 res!292292) b!489360))

(assert (= (and b!489360 res!292294) b!489359))

(assert (= (and b!489359 res!292297) b!489358))

(assert (= (and b!489358 res!292295) b!489356))

(assert (= (and b!489356 res!292291) b!489361))

(declare-fun m!469101 () Bool)

(assert (=> b!489357 m!469101))

(assert (=> b!489357 m!469101))

(declare-fun m!469103 () Bool)

(assert (=> b!489357 m!469103))

(declare-fun m!469105 () Bool)

(assert (=> start!44612 m!469105))

(declare-fun m!469107 () Bool)

(assert (=> start!44612 m!469107))

(declare-fun m!469109 () Bool)

(assert (=> b!489356 m!469109))

(declare-fun m!469111 () Bool)

(assert (=> b!489356 m!469111))

(declare-fun m!469113 () Bool)

(assert (=> b!489356 m!469113))

(assert (=> b!489356 m!469101))

(declare-fun m!469115 () Bool)

(assert (=> b!489356 m!469115))

(assert (=> b!489356 m!469101))

(declare-fun m!469117 () Bool)

(assert (=> b!489356 m!469117))

(assert (=> b!489356 m!469101))

(declare-fun m!469119 () Bool)

(assert (=> b!489356 m!469119))

(assert (=> b!489356 m!469113))

(declare-fun m!469121 () Bool)

(assert (=> b!489356 m!469121))

(assert (=> b!489356 m!469113))

(declare-fun m!469123 () Bool)

(assert (=> b!489356 m!469123))

(declare-fun m!469125 () Bool)

(assert (=> b!489359 m!469125))

(declare-fun m!469127 () Bool)

(assert (=> b!489360 m!469127))

(declare-fun m!469129 () Bool)

(assert (=> b!489358 m!469129))

(declare-fun m!469131 () Bool)

(assert (=> b!489354 m!469131))

(assert (=> b!489361 m!469101))

(assert (=> b!489361 m!469101))

(declare-fun m!469133 () Bool)

(assert (=> b!489361 m!469133))

(declare-fun m!469135 () Bool)

(assert (=> b!489362 m!469135))

(check-sat (not b!489354) (not b!489362) (not b!489356) (not b!489361) (not b!489360) (not b!489357) (not start!44612) (not b!489359) (not b!489358))
(check-sat)

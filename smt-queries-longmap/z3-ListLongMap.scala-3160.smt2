; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44520 () Bool)

(assert start!44520)

(declare-fun b!488540 () Bool)

(declare-fun e!287361 () Bool)

(declare-fun e!287358 () Bool)

(assert (=> b!488540 (= e!287361 e!287358)))

(declare-fun res!291731 () Bool)

(assert (=> b!488540 (=> (not res!291731) (not e!287358))))

(declare-datatypes ((SeekEntryResult!3673 0))(
  ( (MissingZero!3673 (index!16871 (_ BitVec 32))) (Found!3673 (index!16872 (_ BitVec 32))) (Intermediate!3673 (undefined!4485 Bool) (index!16873 (_ BitVec 32)) (x!45995 (_ BitVec 32))) (Undefined!3673) (MissingVacant!3673 (index!16874 (_ BitVec 32))) )
))
(declare-fun lt!220305 () SeekEntryResult!3673)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!488540 (= res!291731 (or (= lt!220305 (MissingZero!3673 i!1204)) (= lt!220305 (MissingVacant!3673 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31640 0))(
  ( (array!31641 (arr!15209 (Array (_ BitVec 32) (_ BitVec 64))) (size!15574 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31640)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31640 (_ BitVec 32)) SeekEntryResult!3673)

(assert (=> b!488540 (= lt!220305 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!488541 () Bool)

(declare-fun res!291729 () Bool)

(assert (=> b!488541 (=> (not res!291729) (not e!287361))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!488541 (= res!291729 (validKeyInArray!0 k0!2280))))

(declare-fun b!488542 () Bool)

(assert (=> b!488542 (= e!287358 (not true))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!220304 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!488542 (= lt!220304 (toIndex!0 (select (store (arr!15209 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(declare-fun e!287359 () Bool)

(assert (=> b!488542 e!287359))

(declare-fun res!291736 () Bool)

(assert (=> b!488542 (=> (not res!291736) (not e!287359))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31640 (_ BitVec 32)) Bool)

(assert (=> b!488542 (= res!291736 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14278 0))(
  ( (Unit!14279) )
))
(declare-fun lt!220306 () Unit!14278)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31640 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14278)

(assert (=> b!488542 (= lt!220306 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!488543 () Bool)

(declare-fun res!291733 () Bool)

(assert (=> b!488543 (=> (not res!291733) (not e!287361))))

(assert (=> b!488543 (= res!291733 (validKeyInArray!0 (select (arr!15209 a!3235) j!176)))))

(declare-fun b!488545 () Bool)

(declare-fun res!291730 () Bool)

(assert (=> b!488545 (=> (not res!291730) (not e!287358))))

(declare-datatypes ((List!9406 0))(
  ( (Nil!9403) (Cons!9402 (h!10261 (_ BitVec 64)) (t!15625 List!9406)) )
))
(declare-fun arrayNoDuplicates!0 (array!31640 (_ BitVec 32) List!9406) Bool)

(assert (=> b!488545 (= res!291730 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9403))))

(declare-fun b!488546 () Bool)

(assert (=> b!488546 (= e!287359 (= (seekEntryOrOpen!0 (select (arr!15209 a!3235) j!176) a!3235 mask!3524) (Found!3673 j!176)))))

(declare-fun b!488547 () Bool)

(declare-fun res!291735 () Bool)

(assert (=> b!488547 (=> (not res!291735) (not e!287358))))

(assert (=> b!488547 (= res!291735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!488548 () Bool)

(declare-fun res!291732 () Bool)

(assert (=> b!488548 (=> (not res!291732) (not e!287361))))

(declare-fun arrayContainsKey!0 (array!31640 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!488548 (= res!291732 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!291734 () Bool)

(assert (=> start!44520 (=> (not res!291734) (not e!287361))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44520 (= res!291734 (validMask!0 mask!3524))))

(assert (=> start!44520 e!287361))

(assert (=> start!44520 true))

(declare-fun array_inv!11092 (array!31640) Bool)

(assert (=> start!44520 (array_inv!11092 a!3235)))

(declare-fun b!488544 () Bool)

(declare-fun res!291737 () Bool)

(assert (=> b!488544 (=> (not res!291737) (not e!287361))))

(assert (=> b!488544 (= res!291737 (and (= (size!15574 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15574 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15574 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44520 res!291734) b!488544))

(assert (= (and b!488544 res!291737) b!488543))

(assert (= (and b!488543 res!291733) b!488541))

(assert (= (and b!488541 res!291729) b!488548))

(assert (= (and b!488548 res!291732) b!488540))

(assert (= (and b!488540 res!291731) b!488547))

(assert (= (and b!488547 res!291735) b!488545))

(assert (= (and b!488545 res!291730) b!488542))

(assert (= (and b!488542 res!291736) b!488546))

(declare-fun m!467785 () Bool)

(assert (=> b!488547 m!467785))

(declare-fun m!467787 () Bool)

(assert (=> start!44520 m!467787))

(declare-fun m!467789 () Bool)

(assert (=> start!44520 m!467789))

(declare-fun m!467791 () Bool)

(assert (=> b!488545 m!467791))

(declare-fun m!467793 () Bool)

(assert (=> b!488543 m!467793))

(assert (=> b!488543 m!467793))

(declare-fun m!467795 () Bool)

(assert (=> b!488543 m!467795))

(declare-fun m!467797 () Bool)

(assert (=> b!488548 m!467797))

(assert (=> b!488546 m!467793))

(assert (=> b!488546 m!467793))

(declare-fun m!467799 () Bool)

(assert (=> b!488546 m!467799))

(declare-fun m!467801 () Bool)

(assert (=> b!488541 m!467801))

(declare-fun m!467803 () Bool)

(assert (=> b!488540 m!467803))

(declare-fun m!467805 () Bool)

(assert (=> b!488542 m!467805))

(declare-fun m!467807 () Bool)

(assert (=> b!488542 m!467807))

(declare-fun m!467809 () Bool)

(assert (=> b!488542 m!467809))

(declare-fun m!467811 () Bool)

(assert (=> b!488542 m!467811))

(assert (=> b!488542 m!467809))

(declare-fun m!467813 () Bool)

(assert (=> b!488542 m!467813))

(check-sat (not b!488547) (not b!488545) (not b!488548) (not b!488543) (not b!488546) (not start!44520) (not b!488542) (not b!488541) (not b!488540))
(check-sat)

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44624 () Bool)

(assert start!44624)

(declare-fun res!292582 () Bool)

(declare-fun e!287918 () Bool)

(assert (=> start!44624 (=> (not res!292582) (not e!287918))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44624 (= res!292582 (validMask!0 mask!3524))))

(assert (=> start!44624 e!287918))

(assert (=> start!44624 true))

(declare-datatypes ((array!31684 0))(
  ( (array!31685 (arr!15229 (Array (_ BitVec 32) (_ BitVec 64))) (size!15593 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31684)

(declare-fun array_inv!11088 (array!31684) Bool)

(assert (=> start!44624 (array_inv!11088 a!3235)))

(declare-fun b!489590 () Bool)

(declare-fun res!292580 () Bool)

(assert (=> b!489590 (=> (not res!292580) (not e!287918))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489590 (= res!292580 (validKeyInArray!0 (select (arr!15229 a!3235) j!176)))))

(declare-fun b!489591 () Bool)

(declare-fun res!292588 () Bool)

(declare-fun e!287917 () Bool)

(assert (=> b!489591 (=> (not res!292588) (not e!287917))))

(declare-datatypes ((List!9294 0))(
  ( (Nil!9291) (Cons!9290 (h!10152 (_ BitVec 64)) (t!15514 List!9294)) )
))
(declare-fun arrayNoDuplicates!0 (array!31684 (_ BitVec 32) List!9294) Bool)

(assert (=> b!489591 (= res!292588 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9291))))

(declare-fun b!489592 () Bool)

(assert (=> b!489592 (= e!287917 (not true))))

(declare-datatypes ((SeekEntryResult!3652 0))(
  ( (MissingZero!3652 (index!16787 (_ BitVec 32))) (Found!3652 (index!16788 (_ BitVec 32))) (Intermediate!3652 (undefined!4464 Bool) (index!16789 (_ BitVec 32)) (x!46043 (_ BitVec 32))) (Undefined!3652) (MissingVacant!3652 (index!16790 (_ BitVec 32))) )
))
(declare-fun lt!220984 () SeekEntryResult!3652)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!220983 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31684 (_ BitVec 32)) SeekEntryResult!3652)

(assert (=> b!489592 (= lt!220984 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220983 (select (store (arr!15229 a!3235) i!1204 k0!2280) j!176) (array!31685 (store (arr!15229 a!3235) i!1204 k0!2280) (size!15593 a!3235)) mask!3524))))

(declare-fun lt!220982 () SeekEntryResult!3652)

(declare-fun lt!220979 () (_ BitVec 32))

(assert (=> b!489592 (= lt!220982 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220979 (select (arr!15229 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489592 (= lt!220983 (toIndex!0 (select (store (arr!15229 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!489592 (= lt!220979 (toIndex!0 (select (arr!15229 a!3235) j!176) mask!3524))))

(declare-fun e!287919 () Bool)

(assert (=> b!489592 e!287919))

(declare-fun res!292584 () Bool)

(assert (=> b!489592 (=> (not res!292584) (not e!287919))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31684 (_ BitVec 32)) Bool)

(assert (=> b!489592 (= res!292584 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14311 0))(
  ( (Unit!14312) )
))
(declare-fun lt!220981 () Unit!14311)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31684 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14311)

(assert (=> b!489592 (= lt!220981 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489593 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31684 (_ BitVec 32)) SeekEntryResult!3652)

(assert (=> b!489593 (= e!287919 (= (seekEntryOrOpen!0 (select (arr!15229 a!3235) j!176) a!3235 mask!3524) (Found!3652 j!176)))))

(declare-fun b!489594 () Bool)

(declare-fun res!292583 () Bool)

(assert (=> b!489594 (=> (not res!292583) (not e!287918))))

(declare-fun arrayContainsKey!0 (array!31684 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489594 (= res!292583 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!489595 () Bool)

(declare-fun res!292587 () Bool)

(assert (=> b!489595 (=> (not res!292587) (not e!287917))))

(assert (=> b!489595 (= res!292587 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489596 () Bool)

(assert (=> b!489596 (= e!287918 e!287917)))

(declare-fun res!292581 () Bool)

(assert (=> b!489596 (=> (not res!292581) (not e!287917))))

(declare-fun lt!220980 () SeekEntryResult!3652)

(assert (=> b!489596 (= res!292581 (or (= lt!220980 (MissingZero!3652 i!1204)) (= lt!220980 (MissingVacant!3652 i!1204))))))

(assert (=> b!489596 (= lt!220980 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!489597 () Bool)

(declare-fun res!292585 () Bool)

(assert (=> b!489597 (=> (not res!292585) (not e!287918))))

(assert (=> b!489597 (= res!292585 (and (= (size!15593 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15593 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15593 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!489598 () Bool)

(declare-fun res!292586 () Bool)

(assert (=> b!489598 (=> (not res!292586) (not e!287918))))

(assert (=> b!489598 (= res!292586 (validKeyInArray!0 k0!2280))))

(assert (= (and start!44624 res!292582) b!489597))

(assert (= (and b!489597 res!292585) b!489590))

(assert (= (and b!489590 res!292580) b!489598))

(assert (= (and b!489598 res!292586) b!489594))

(assert (= (and b!489594 res!292583) b!489596))

(assert (= (and b!489596 res!292581) b!489595))

(assert (= (and b!489595 res!292587) b!489591))

(assert (= (and b!489591 res!292588) b!489592))

(assert (= (and b!489592 res!292584) b!489593))

(declare-fun m!469681 () Bool)

(assert (=> b!489596 m!469681))

(declare-fun m!469683 () Bool)

(assert (=> b!489594 m!469683))

(declare-fun m!469685 () Bool)

(assert (=> b!489595 m!469685))

(declare-fun m!469687 () Bool)

(assert (=> b!489598 m!469687))

(declare-fun m!469689 () Bool)

(assert (=> b!489593 m!469689))

(assert (=> b!489593 m!469689))

(declare-fun m!469691 () Bool)

(assert (=> b!489593 m!469691))

(assert (=> b!489592 m!469689))

(declare-fun m!469693 () Bool)

(assert (=> b!489592 m!469693))

(declare-fun m!469695 () Bool)

(assert (=> b!489592 m!469695))

(declare-fun m!469697 () Bool)

(assert (=> b!489592 m!469697))

(assert (=> b!489592 m!469689))

(declare-fun m!469699 () Bool)

(assert (=> b!489592 m!469699))

(assert (=> b!489592 m!469689))

(declare-fun m!469701 () Bool)

(assert (=> b!489592 m!469701))

(declare-fun m!469703 () Bool)

(assert (=> b!489592 m!469703))

(declare-fun m!469705 () Bool)

(assert (=> b!489592 m!469705))

(assert (=> b!489592 m!469703))

(declare-fun m!469707 () Bool)

(assert (=> b!489592 m!469707))

(assert (=> b!489592 m!469703))

(declare-fun m!469709 () Bool)

(assert (=> start!44624 m!469709))

(declare-fun m!469711 () Bool)

(assert (=> start!44624 m!469711))

(assert (=> b!489590 m!469689))

(assert (=> b!489590 m!469689))

(declare-fun m!469713 () Bool)

(assert (=> b!489590 m!469713))

(declare-fun m!469715 () Bool)

(assert (=> b!489591 m!469715))

(check-sat (not b!489596) (not b!489591) (not b!489594) (not b!489593) (not b!489595) (not b!489592) (not b!489598) (not start!44624) (not b!489590))
(check-sat)

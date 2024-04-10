; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46028 () Bool)

(assert start!46028)

(declare-fun e!298026 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!509676 () Bool)

(declare-datatypes ((array!32739 0))(
  ( (array!32740 (arr!15748 (Array (_ BitVec 32) (_ BitVec 64))) (size!16112 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32739)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4215 0))(
  ( (MissingZero!4215 (index!19048 (_ BitVec 32))) (Found!4215 (index!19049 (_ BitVec 32))) (Intermediate!4215 (undefined!5027 Bool) (index!19050 (_ BitVec 32)) (x!48016 (_ BitVec 32))) (Undefined!4215) (MissingVacant!4215 (index!19051 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32739 (_ BitVec 32)) SeekEntryResult!4215)

(assert (=> b!509676 (= e!298026 (= (seekEntryOrOpen!0 (select (arr!15748 a!3235) j!176) a!3235 mask!3524) (Found!4215 j!176)))))

(declare-fun b!509677 () Bool)

(declare-fun e!298029 () Bool)

(declare-fun e!298028 () Bool)

(assert (=> b!509677 (= e!298029 e!298028)))

(declare-fun res!310523 () Bool)

(assert (=> b!509677 (=> (not res!310523) (not e!298028))))

(declare-fun lt!232878 () SeekEntryResult!4215)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!509677 (= res!310523 (or (= lt!232878 (MissingZero!4215 i!1204)) (= lt!232878 (MissingVacant!4215 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!509677 (= lt!232878 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!509679 () Bool)

(declare-fun res!310528 () Bool)

(assert (=> b!509679 (=> (not res!310528) (not e!298029))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509679 (= res!310528 (validKeyInArray!0 (select (arr!15748 a!3235) j!176)))))

(declare-fun b!509680 () Bool)

(declare-fun res!310524 () Bool)

(assert (=> b!509680 (=> (not res!310524) (not e!298029))))

(assert (=> b!509680 (= res!310524 (validKeyInArray!0 k0!2280))))

(declare-fun b!509681 () Bool)

(declare-fun res!310526 () Bool)

(assert (=> b!509681 (=> (not res!310526) (not e!298028))))

(declare-datatypes ((List!9906 0))(
  ( (Nil!9903) (Cons!9902 (h!10779 (_ BitVec 64)) (t!16134 List!9906)) )
))
(declare-fun arrayNoDuplicates!0 (array!32739 (_ BitVec 32) List!9906) Bool)

(assert (=> b!509681 (= res!310526 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9903))))

(declare-fun b!509682 () Bool)

(declare-fun res!310529 () Bool)

(assert (=> b!509682 (=> (not res!310529) (not e!298028))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32739 (_ BitVec 32)) Bool)

(assert (=> b!509682 (= res!310529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!310525 () Bool)

(assert (=> start!46028 (=> (not res!310525) (not e!298029))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46028 (= res!310525 (validMask!0 mask!3524))))

(assert (=> start!46028 e!298029))

(assert (=> start!46028 true))

(declare-fun array_inv!11544 (array!32739) Bool)

(assert (=> start!46028 (array_inv!11544 a!3235)))

(declare-fun b!509678 () Bool)

(declare-fun res!310527 () Bool)

(assert (=> b!509678 (=> (not res!310527) (not e!298029))))

(declare-fun arrayContainsKey!0 (array!32739 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509678 (= res!310527 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509683 () Bool)

(declare-fun res!310522 () Bool)

(assert (=> b!509683 (=> (not res!310522) (not e!298029))))

(assert (=> b!509683 (= res!310522 (and (= (size!16112 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16112 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16112 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509684 () Bool)

(assert (=> b!509684 (= e!298028 (not true))))

(declare-fun lt!232875 () (_ BitVec 32))

(declare-fun lt!232876 () SeekEntryResult!4215)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32739 (_ BitVec 32)) SeekEntryResult!4215)

(assert (=> b!509684 (= lt!232876 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232875 (select (store (arr!15748 a!3235) i!1204 k0!2280) j!176) (array!32740 (store (arr!15748 a!3235) i!1204 k0!2280) (size!16112 a!3235)) mask!3524))))

(declare-fun lt!232877 () SeekEntryResult!4215)

(declare-fun lt!232874 () (_ BitVec 32))

(assert (=> b!509684 (= lt!232877 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232874 (select (arr!15748 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509684 (= lt!232875 (toIndex!0 (select (store (arr!15748 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!509684 (= lt!232874 (toIndex!0 (select (arr!15748 a!3235) j!176) mask!3524))))

(assert (=> b!509684 e!298026))

(declare-fun res!310521 () Bool)

(assert (=> b!509684 (=> (not res!310521) (not e!298026))))

(assert (=> b!509684 (= res!310521 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15688 0))(
  ( (Unit!15689) )
))
(declare-fun lt!232879 () Unit!15688)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32739 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15688)

(assert (=> b!509684 (= lt!232879 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!46028 res!310525) b!509683))

(assert (= (and b!509683 res!310522) b!509679))

(assert (= (and b!509679 res!310528) b!509680))

(assert (= (and b!509680 res!310524) b!509678))

(assert (= (and b!509678 res!310527) b!509677))

(assert (= (and b!509677 res!310523) b!509682))

(assert (= (and b!509682 res!310529) b!509681))

(assert (= (and b!509681 res!310526) b!509684))

(assert (= (and b!509684 res!310521) b!509676))

(declare-fun m!490641 () Bool)

(assert (=> start!46028 m!490641))

(declare-fun m!490643 () Bool)

(assert (=> start!46028 m!490643))

(declare-fun m!490645 () Bool)

(assert (=> b!509682 m!490645))

(declare-fun m!490647 () Bool)

(assert (=> b!509677 m!490647))

(declare-fun m!490649 () Bool)

(assert (=> b!509681 m!490649))

(declare-fun m!490651 () Bool)

(assert (=> b!509678 m!490651))

(declare-fun m!490653 () Bool)

(assert (=> b!509684 m!490653))

(declare-fun m!490655 () Bool)

(assert (=> b!509684 m!490655))

(declare-fun m!490657 () Bool)

(assert (=> b!509684 m!490657))

(assert (=> b!509684 m!490657))

(declare-fun m!490659 () Bool)

(assert (=> b!509684 m!490659))

(declare-fun m!490661 () Bool)

(assert (=> b!509684 m!490661))

(declare-fun m!490663 () Bool)

(assert (=> b!509684 m!490663))

(assert (=> b!509684 m!490661))

(declare-fun m!490665 () Bool)

(assert (=> b!509684 m!490665))

(assert (=> b!509684 m!490657))

(declare-fun m!490667 () Bool)

(assert (=> b!509684 m!490667))

(assert (=> b!509684 m!490661))

(declare-fun m!490669 () Bool)

(assert (=> b!509684 m!490669))

(declare-fun m!490671 () Bool)

(assert (=> b!509680 m!490671))

(assert (=> b!509676 m!490661))

(assert (=> b!509676 m!490661))

(declare-fun m!490673 () Bool)

(assert (=> b!509676 m!490673))

(assert (=> b!509679 m!490661))

(assert (=> b!509679 m!490661))

(declare-fun m!490675 () Bool)

(assert (=> b!509679 m!490675))

(check-sat (not b!509677) (not b!509682) (not b!509679) (not b!509684) (not start!46028) (not b!509680) (not b!509676) (not b!509678) (not b!509681))
(check-sat)

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44636 () Bool)

(assert start!44636)

(declare-fun b!489678 () Bool)

(declare-fun res!292622 () Bool)

(declare-fun e!287970 () Bool)

(assert (=> b!489678 (=> (not res!292622) (not e!287970))))

(declare-datatypes ((array!31695 0))(
  ( (array!31696 (arr!15235 (Array (_ BitVec 32) (_ BitVec 64))) (size!15599 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31695)

(declare-datatypes ((List!9393 0))(
  ( (Nil!9390) (Cons!9389 (h!10251 (_ BitVec 64)) (t!15621 List!9393)) )
))
(declare-fun arrayNoDuplicates!0 (array!31695 (_ BitVec 32) List!9393) Bool)

(assert (=> b!489678 (= res!292622 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9390))))

(declare-fun b!489679 () Bool)

(declare-fun res!292621 () Bool)

(declare-fun e!287969 () Bool)

(assert (=> b!489679 (=> (not res!292621) (not e!287969))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489679 (= res!292621 (validKeyInArray!0 (select (arr!15235 a!3235) j!176)))))

(declare-fun b!489681 () Bool)

(declare-fun res!292618 () Bool)

(assert (=> b!489681 (=> (not res!292618) (not e!287969))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31695 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489681 (= res!292618 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!489682 () Bool)

(declare-fun res!292620 () Bool)

(assert (=> b!489682 (=> (not res!292620) (not e!287969))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!489682 (= res!292620 (and (= (size!15599 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15599 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15599 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!489683 () Bool)

(declare-fun res!292614 () Bool)

(assert (=> b!489683 (=> (not res!292614) (not e!287970))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31695 (_ BitVec 32)) Bool)

(assert (=> b!489683 (= res!292614 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489684 () Bool)

(assert (=> b!489684 (= e!287970 (not true))))

(declare-fun lt!220989 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3702 0))(
  ( (MissingZero!3702 (index!16987 (_ BitVec 32))) (Found!3702 (index!16988 (_ BitVec 32))) (Intermediate!3702 (undefined!4514 Bool) (index!16989 (_ BitVec 32)) (x!46096 (_ BitVec 32))) (Undefined!3702) (MissingVacant!3702 (index!16990 (_ BitVec 32))) )
))
(declare-fun lt!220986 () SeekEntryResult!3702)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31695 (_ BitVec 32)) SeekEntryResult!3702)

(assert (=> b!489684 (= lt!220986 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220989 (select (store (arr!15235 a!3235) i!1204 k0!2280) j!176) (array!31696 (store (arr!15235 a!3235) i!1204 k0!2280) (size!15599 a!3235)) mask!3524))))

(declare-fun lt!220990 () (_ BitVec 32))

(declare-fun lt!220985 () SeekEntryResult!3702)

(assert (=> b!489684 (= lt!220985 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220990 (select (arr!15235 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489684 (= lt!220989 (toIndex!0 (select (store (arr!15235 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!489684 (= lt!220990 (toIndex!0 (select (arr!15235 a!3235) j!176) mask!3524))))

(declare-fun e!287967 () Bool)

(assert (=> b!489684 e!287967))

(declare-fun res!292615 () Bool)

(assert (=> b!489684 (=> (not res!292615) (not e!287967))))

(assert (=> b!489684 (= res!292615 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14350 0))(
  ( (Unit!14351) )
))
(declare-fun lt!220987 () Unit!14350)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31695 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14350)

(assert (=> b!489684 (= lt!220987 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!292619 () Bool)

(assert (=> start!44636 (=> (not res!292619) (not e!287969))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44636 (= res!292619 (validMask!0 mask!3524))))

(assert (=> start!44636 e!287969))

(assert (=> start!44636 true))

(declare-fun array_inv!11031 (array!31695) Bool)

(assert (=> start!44636 (array_inv!11031 a!3235)))

(declare-fun b!489680 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31695 (_ BitVec 32)) SeekEntryResult!3702)

(assert (=> b!489680 (= e!287967 (= (seekEntryOrOpen!0 (select (arr!15235 a!3235) j!176) a!3235 mask!3524) (Found!3702 j!176)))))

(declare-fun b!489685 () Bool)

(assert (=> b!489685 (= e!287969 e!287970)))

(declare-fun res!292616 () Bool)

(assert (=> b!489685 (=> (not res!292616) (not e!287970))))

(declare-fun lt!220988 () SeekEntryResult!3702)

(assert (=> b!489685 (= res!292616 (or (= lt!220988 (MissingZero!3702 i!1204)) (= lt!220988 (MissingVacant!3702 i!1204))))))

(assert (=> b!489685 (= lt!220988 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!489686 () Bool)

(declare-fun res!292617 () Bool)

(assert (=> b!489686 (=> (not res!292617) (not e!287969))))

(assert (=> b!489686 (= res!292617 (validKeyInArray!0 k0!2280))))

(assert (= (and start!44636 res!292619) b!489682))

(assert (= (and b!489682 res!292620) b!489679))

(assert (= (and b!489679 res!292621) b!489686))

(assert (= (and b!489686 res!292617) b!489681))

(assert (= (and b!489681 res!292618) b!489685))

(assert (= (and b!489685 res!292616) b!489683))

(assert (= (and b!489683 res!292614) b!489678))

(assert (= (and b!489678 res!292622) b!489684))

(assert (= (and b!489684 res!292615) b!489680))

(declare-fun m!469533 () Bool)

(assert (=> b!489685 m!469533))

(declare-fun m!469535 () Bool)

(assert (=> b!489681 m!469535))

(declare-fun m!469537 () Bool)

(assert (=> b!489680 m!469537))

(assert (=> b!489680 m!469537))

(declare-fun m!469539 () Bool)

(assert (=> b!489680 m!469539))

(declare-fun m!469541 () Bool)

(assert (=> b!489686 m!469541))

(declare-fun m!469543 () Bool)

(assert (=> b!489683 m!469543))

(declare-fun m!469545 () Bool)

(assert (=> b!489678 m!469545))

(declare-fun m!469547 () Bool)

(assert (=> start!44636 m!469547))

(declare-fun m!469549 () Bool)

(assert (=> start!44636 m!469549))

(declare-fun m!469551 () Bool)

(assert (=> b!489684 m!469551))

(declare-fun m!469553 () Bool)

(assert (=> b!489684 m!469553))

(declare-fun m!469555 () Bool)

(assert (=> b!489684 m!469555))

(assert (=> b!489684 m!469537))

(declare-fun m!469557 () Bool)

(assert (=> b!489684 m!469557))

(assert (=> b!489684 m!469537))

(declare-fun m!469559 () Bool)

(assert (=> b!489684 m!469559))

(assert (=> b!489684 m!469537))

(declare-fun m!469561 () Bool)

(assert (=> b!489684 m!469561))

(assert (=> b!489684 m!469555))

(declare-fun m!469563 () Bool)

(assert (=> b!489684 m!469563))

(assert (=> b!489684 m!469555))

(declare-fun m!469565 () Bool)

(assert (=> b!489684 m!469565))

(assert (=> b!489679 m!469537))

(assert (=> b!489679 m!469537))

(declare-fun m!469567 () Bool)

(assert (=> b!489679 m!469567))

(check-sat (not b!489681) (not b!489683) (not b!489686) (not b!489680) (not b!489678) (not start!44636) (not b!489685) (not b!489684) (not b!489679))

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45782 () Bool)

(assert start!45782)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32539 0))(
  ( (array!32540 (arr!15649 (Array (_ BitVec 32) (_ BitVec 64))) (size!16013 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32539)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!506790 () Bool)

(declare-fun e!296604 () Bool)

(declare-datatypes ((SeekEntryResult!4072 0))(
  ( (MissingZero!4072 (index!18476 (_ BitVec 32))) (Found!4072 (index!18477 (_ BitVec 32))) (Intermediate!4072 (undefined!4884 Bool) (index!18478 (_ BitVec 32)) (x!47622 (_ BitVec 32))) (Undefined!4072) (MissingVacant!4072 (index!18479 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32539 (_ BitVec 32)) SeekEntryResult!4072)

(assert (=> b!506790 (= e!296604 (= (seekEntryOrOpen!0 (select (arr!15649 a!3235) j!176) a!3235 mask!3524) (Found!4072 j!176)))))

(declare-fun b!506791 () Bool)

(declare-fun res!307805 () Bool)

(declare-fun e!296603 () Bool)

(assert (=> b!506791 (=> (not res!307805) (not e!296603))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!506791 (= res!307805 (and (= (size!16013 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16013 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16013 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!506792 () Bool)

(declare-fun e!296605 () Bool)

(assert (=> b!506792 (= e!296605 true)))

(assert (=> b!506792 false))

(declare-fun b!506793 () Bool)

(declare-fun res!307803 () Bool)

(assert (=> b!506793 (=> (not res!307803) (not e!296603))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32539 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506793 (= res!307803 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!506794 () Bool)

(declare-fun res!307812 () Bool)

(assert (=> b!506794 (=> (not res!307812) (not e!296603))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506794 (= res!307812 (validKeyInArray!0 (select (arr!15649 a!3235) j!176)))))

(declare-fun b!506795 () Bool)

(declare-fun res!307810 () Bool)

(declare-fun e!296607 () Bool)

(assert (=> b!506795 (=> (not res!307810) (not e!296607))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32539 (_ BitVec 32)) Bool)

(assert (=> b!506795 (= res!307810 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!506796 () Bool)

(declare-fun e!296606 () Bool)

(assert (=> b!506796 (= e!296607 (not e!296606))))

(declare-fun res!307807 () Bool)

(assert (=> b!506796 (=> res!307807 e!296606)))

(declare-fun lt!231332 () (_ BitVec 32))

(declare-fun lt!231334 () SeekEntryResult!4072)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32539 (_ BitVec 32)) SeekEntryResult!4072)

(assert (=> b!506796 (= res!307807 (= lt!231334 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231332 (select (store (arr!15649 a!3235) i!1204 k0!2280) j!176) (array!32540 (store (arr!15649 a!3235) i!1204 k0!2280) (size!16013 a!3235)) mask!3524)))))

(declare-fun lt!231330 () (_ BitVec 32))

(assert (=> b!506796 (= lt!231334 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231330 (select (arr!15649 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506796 (= lt!231332 (toIndex!0 (select (store (arr!15649 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!506796 (= lt!231330 (toIndex!0 (select (arr!15649 a!3235) j!176) mask!3524))))

(assert (=> b!506796 e!296604))

(declare-fun res!307806 () Bool)

(assert (=> b!506796 (=> (not res!307806) (not e!296604))))

(assert (=> b!506796 (= res!307806 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15493 0))(
  ( (Unit!15494) )
))
(declare-fun lt!231331 () Unit!15493)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32539 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15493)

(assert (=> b!506796 (= lt!231331 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!506797 () Bool)

(assert (=> b!506797 (= e!296606 e!296605)))

(declare-fun res!307804 () Bool)

(assert (=> b!506797 (=> res!307804 e!296605)))

(declare-fun lt!231333 () Bool)

(assert (=> b!506797 (= res!307804 (or (and (not lt!231333) (undefined!4884 lt!231334)) (and (not lt!231333) (not (undefined!4884 lt!231334)))))))

(get-info :version)

(assert (=> b!506797 (= lt!231333 (not ((_ is Intermediate!4072) lt!231334)))))

(declare-fun res!307809 () Bool)

(assert (=> start!45782 (=> (not res!307809) (not e!296603))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45782 (= res!307809 (validMask!0 mask!3524))))

(assert (=> start!45782 e!296603))

(assert (=> start!45782 true))

(declare-fun array_inv!11508 (array!32539) Bool)

(assert (=> start!45782 (array_inv!11508 a!3235)))

(declare-fun b!506798 () Bool)

(declare-fun res!307808 () Bool)

(assert (=> b!506798 (=> (not res!307808) (not e!296603))))

(assert (=> b!506798 (= res!307808 (validKeyInArray!0 k0!2280))))

(declare-fun b!506799 () Bool)

(declare-fun res!307813 () Bool)

(assert (=> b!506799 (=> (not res!307813) (not e!296607))))

(declare-datatypes ((List!9714 0))(
  ( (Nil!9711) (Cons!9710 (h!10587 (_ BitVec 64)) (t!15934 List!9714)) )
))
(declare-fun arrayNoDuplicates!0 (array!32539 (_ BitVec 32) List!9714) Bool)

(assert (=> b!506799 (= res!307813 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9711))))

(declare-fun b!506800 () Bool)

(assert (=> b!506800 (= e!296603 e!296607)))

(declare-fun res!307811 () Bool)

(assert (=> b!506800 (=> (not res!307811) (not e!296607))))

(declare-fun lt!231329 () SeekEntryResult!4072)

(assert (=> b!506800 (= res!307811 (or (= lt!231329 (MissingZero!4072 i!1204)) (= lt!231329 (MissingVacant!4072 i!1204))))))

(assert (=> b!506800 (= lt!231329 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!45782 res!307809) b!506791))

(assert (= (and b!506791 res!307805) b!506794))

(assert (= (and b!506794 res!307812) b!506798))

(assert (= (and b!506798 res!307808) b!506793))

(assert (= (and b!506793 res!307803) b!506800))

(assert (= (and b!506800 res!307811) b!506795))

(assert (= (and b!506795 res!307810) b!506799))

(assert (= (and b!506799 res!307813) b!506796))

(assert (= (and b!506796 res!307806) b!506790))

(assert (= (and b!506796 (not res!307807)) b!506797))

(assert (= (and b!506797 (not res!307804)) b!506792))

(declare-fun m!487735 () Bool)

(assert (=> b!506798 m!487735))

(declare-fun m!487737 () Bool)

(assert (=> b!506790 m!487737))

(assert (=> b!506790 m!487737))

(declare-fun m!487739 () Bool)

(assert (=> b!506790 m!487739))

(declare-fun m!487741 () Bool)

(assert (=> b!506795 m!487741))

(assert (=> b!506794 m!487737))

(assert (=> b!506794 m!487737))

(declare-fun m!487743 () Bool)

(assert (=> b!506794 m!487743))

(declare-fun m!487745 () Bool)

(assert (=> b!506796 m!487745))

(declare-fun m!487747 () Bool)

(assert (=> b!506796 m!487747))

(declare-fun m!487749 () Bool)

(assert (=> b!506796 m!487749))

(assert (=> b!506796 m!487737))

(declare-fun m!487751 () Bool)

(assert (=> b!506796 m!487751))

(assert (=> b!506796 m!487737))

(assert (=> b!506796 m!487749))

(declare-fun m!487753 () Bool)

(assert (=> b!506796 m!487753))

(assert (=> b!506796 m!487749))

(declare-fun m!487755 () Bool)

(assert (=> b!506796 m!487755))

(assert (=> b!506796 m!487737))

(declare-fun m!487757 () Bool)

(assert (=> b!506796 m!487757))

(declare-fun m!487759 () Bool)

(assert (=> b!506796 m!487759))

(declare-fun m!487761 () Bool)

(assert (=> b!506793 m!487761))

(declare-fun m!487763 () Bool)

(assert (=> start!45782 m!487763))

(declare-fun m!487765 () Bool)

(assert (=> start!45782 m!487765))

(declare-fun m!487767 () Bool)

(assert (=> b!506799 m!487767))

(declare-fun m!487769 () Bool)

(assert (=> b!506800 m!487769))

(check-sat (not b!506790) (not start!45782) (not b!506799) (not b!506796) (not b!506794) (not b!506795) (not b!506800) (not b!506798) (not b!506793))
(check-sat)

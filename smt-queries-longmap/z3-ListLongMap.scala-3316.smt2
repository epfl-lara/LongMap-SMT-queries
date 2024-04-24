; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45830 () Bool)

(assert start!45830)

(declare-fun b!507582 () Bool)

(declare-fun res!308598 () Bool)

(declare-fun e!297034 () Bool)

(assert (=> b!507582 (=> (not res!308598) (not e!297034))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32587 0))(
  ( (array!32588 (arr!15673 (Array (_ BitVec 32) (_ BitVec 64))) (size!16037 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32587)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!507582 (= res!308598 (and (= (size!16037 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16037 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16037 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!507583 () Bool)

(declare-fun e!297038 () Bool)

(declare-fun e!297035 () Bool)

(assert (=> b!507583 (= e!297038 (not e!297035))))

(declare-fun res!308600 () Bool)

(assert (=> b!507583 (=> res!308600 e!297035)))

(declare-fun lt!231909 () (_ BitVec 64))

(declare-fun lt!231908 () (_ BitVec 32))

(declare-fun lt!231904 () array!32587)

(declare-datatypes ((SeekEntryResult!4096 0))(
  ( (MissingZero!4096 (index!18572 (_ BitVec 32))) (Found!4096 (index!18573 (_ BitVec 32))) (Intermediate!4096 (undefined!4908 Bool) (index!18574 (_ BitVec 32)) (x!47710 (_ BitVec 32))) (Undefined!4096) (MissingVacant!4096 (index!18575 (_ BitVec 32))) )
))
(declare-fun lt!231906 () SeekEntryResult!4096)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32587 (_ BitVec 32)) SeekEntryResult!4096)

(assert (=> b!507583 (= res!308600 (= lt!231906 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231908 lt!231909 lt!231904 mask!3524)))))

(declare-fun lt!231910 () (_ BitVec 32))

(assert (=> b!507583 (= lt!231906 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231910 (select (arr!15673 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!507583 (= lt!231908 (toIndex!0 lt!231909 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!507583 (= lt!231909 (select (store (arr!15673 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!507583 (= lt!231910 (toIndex!0 (select (arr!15673 a!3235) j!176) mask!3524))))

(assert (=> b!507583 (= lt!231904 (array!32588 (store (arr!15673 a!3235) i!1204 k0!2280) (size!16037 a!3235)))))

(declare-fun e!297039 () Bool)

(assert (=> b!507583 e!297039))

(declare-fun res!308603 () Bool)

(assert (=> b!507583 (=> (not res!308603) (not e!297039))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32587 (_ BitVec 32)) Bool)

(assert (=> b!507583 (= res!308603 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15541 0))(
  ( (Unit!15542) )
))
(declare-fun lt!231903 () Unit!15541)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32587 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15541)

(assert (=> b!507583 (= lt!231903 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!507584 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32587 (_ BitVec 32)) SeekEntryResult!4096)

(assert (=> b!507584 (= e!297039 (= (seekEntryOrOpen!0 (select (arr!15673 a!3235) j!176) a!3235 mask!3524) (Found!4096 j!176)))))

(declare-fun b!507585 () Bool)

(declare-fun res!308601 () Bool)

(assert (=> b!507585 (=> (not res!308601) (not e!297038))))

(declare-datatypes ((List!9738 0))(
  ( (Nil!9735) (Cons!9734 (h!10611 (_ BitVec 64)) (t!15958 List!9738)) )
))
(declare-fun arrayNoDuplicates!0 (array!32587 (_ BitVec 32) List!9738) Bool)

(assert (=> b!507585 (= res!308601 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9735))))

(declare-fun b!507586 () Bool)

(assert (=> b!507586 (= e!297034 e!297038)))

(declare-fun res!308602 () Bool)

(assert (=> b!507586 (=> (not res!308602) (not e!297038))))

(declare-fun lt!231907 () SeekEntryResult!4096)

(assert (=> b!507586 (= res!308602 (or (= lt!231907 (MissingZero!4096 i!1204)) (= lt!231907 (MissingVacant!4096 i!1204))))))

(assert (=> b!507586 (= lt!231907 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!507587 () Bool)

(declare-fun res!308597 () Bool)

(assert (=> b!507587 (=> (not res!308597) (not e!297034))))

(declare-fun arrayContainsKey!0 (array!32587 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507587 (= res!308597 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!507588 () Bool)

(declare-fun e!297036 () Bool)

(assert (=> b!507588 (= e!297036 true)))

(declare-fun lt!231905 () SeekEntryResult!4096)

(assert (=> b!507588 (= lt!231905 (seekEntryOrOpen!0 lt!231909 lt!231904 mask!3524))))

(assert (=> b!507588 false))

(declare-fun b!507589 () Bool)

(declare-fun res!308596 () Bool)

(assert (=> b!507589 (=> (not res!308596) (not e!297038))))

(assert (=> b!507589 (= res!308596 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!308605 () Bool)

(assert (=> start!45830 (=> (not res!308605) (not e!297034))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45830 (= res!308605 (validMask!0 mask!3524))))

(assert (=> start!45830 e!297034))

(assert (=> start!45830 true))

(declare-fun array_inv!11532 (array!32587) Bool)

(assert (=> start!45830 (array_inv!11532 a!3235)))

(declare-fun b!507590 () Bool)

(declare-fun res!308604 () Bool)

(assert (=> b!507590 (=> (not res!308604) (not e!297034))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507590 (= res!308604 (validKeyInArray!0 (select (arr!15673 a!3235) j!176)))))

(declare-fun b!507591 () Bool)

(assert (=> b!507591 (= e!297035 e!297036)))

(declare-fun res!308595 () Bool)

(assert (=> b!507591 (=> res!308595 e!297036)))

(declare-fun lt!231902 () Bool)

(assert (=> b!507591 (= res!308595 (or (and (not lt!231902) (undefined!4908 lt!231906)) (and (not lt!231902) (not (undefined!4908 lt!231906)))))))

(get-info :version)

(assert (=> b!507591 (= lt!231902 (not ((_ is Intermediate!4096) lt!231906)))))

(declare-fun b!507592 () Bool)

(declare-fun res!308599 () Bool)

(assert (=> b!507592 (=> (not res!308599) (not e!297034))))

(assert (=> b!507592 (= res!308599 (validKeyInArray!0 k0!2280))))

(assert (= (and start!45830 res!308605) b!507582))

(assert (= (and b!507582 res!308598) b!507590))

(assert (= (and b!507590 res!308604) b!507592))

(assert (= (and b!507592 res!308599) b!507587))

(assert (= (and b!507587 res!308597) b!507586))

(assert (= (and b!507586 res!308602) b!507589))

(assert (= (and b!507589 res!308596) b!507585))

(assert (= (and b!507585 res!308601) b!507583))

(assert (= (and b!507583 res!308603) b!507584))

(assert (= (and b!507583 (not res!308600)) b!507591))

(assert (= (and b!507591 (not res!308595)) b!507588))

(declare-fun m!488629 () Bool)

(assert (=> b!507589 m!488629))

(declare-fun m!488631 () Bool)

(assert (=> b!507586 m!488631))

(declare-fun m!488633 () Bool)

(assert (=> b!507585 m!488633))

(declare-fun m!488635 () Bool)

(assert (=> start!45830 m!488635))

(declare-fun m!488637 () Bool)

(assert (=> start!45830 m!488637))

(declare-fun m!488639 () Bool)

(assert (=> b!507583 m!488639))

(declare-fun m!488641 () Bool)

(assert (=> b!507583 m!488641))

(declare-fun m!488643 () Bool)

(assert (=> b!507583 m!488643))

(declare-fun m!488645 () Bool)

(assert (=> b!507583 m!488645))

(assert (=> b!507583 m!488643))

(declare-fun m!488647 () Bool)

(assert (=> b!507583 m!488647))

(assert (=> b!507583 m!488643))

(declare-fun m!488649 () Bool)

(assert (=> b!507583 m!488649))

(declare-fun m!488651 () Bool)

(assert (=> b!507583 m!488651))

(declare-fun m!488653 () Bool)

(assert (=> b!507583 m!488653))

(declare-fun m!488655 () Bool)

(assert (=> b!507583 m!488655))

(declare-fun m!488657 () Bool)

(assert (=> b!507592 m!488657))

(declare-fun m!488659 () Bool)

(assert (=> b!507588 m!488659))

(assert (=> b!507584 m!488643))

(assert (=> b!507584 m!488643))

(declare-fun m!488661 () Bool)

(assert (=> b!507584 m!488661))

(assert (=> b!507590 m!488643))

(assert (=> b!507590 m!488643))

(declare-fun m!488663 () Bool)

(assert (=> b!507590 m!488663))

(declare-fun m!488665 () Bool)

(assert (=> b!507587 m!488665))

(check-sat (not b!507583) (not b!507588) (not b!507589) (not b!507592) (not b!507585) (not start!45830) (not b!507587) (not b!507584) (not b!507586) (not b!507590))
(check-sat)

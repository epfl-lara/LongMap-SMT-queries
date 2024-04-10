; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44708 () Bool)

(assert start!44708)

(declare-fun b!490650 () Bool)

(declare-fun res!293586 () Bool)

(declare-fun e!288400 () Bool)

(assert (=> b!490650 (=> (not res!293586) (not e!288400))))

(declare-datatypes ((array!31767 0))(
  ( (array!31768 (arr!15271 (Array (_ BitVec 32) (_ BitVec 64))) (size!15635 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31767)

(declare-datatypes ((List!9429 0))(
  ( (Nil!9426) (Cons!9425 (h!10287 (_ BitVec 64)) (t!15657 List!9429)) )
))
(declare-fun arrayNoDuplicates!0 (array!31767 (_ BitVec 32) List!9429) Bool)

(assert (=> b!490650 (= res!293586 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9426))))

(declare-fun b!490651 () Bool)

(declare-fun res!293590 () Bool)

(declare-fun e!288402 () Bool)

(assert (=> b!490651 (=> (not res!293590) (not e!288402))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490651 (= res!293590 (validKeyInArray!0 k0!2280))))

(declare-fun res!293593 () Bool)

(assert (=> start!44708 (=> (not res!293593) (not e!288402))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44708 (= res!293593 (validMask!0 mask!3524))))

(assert (=> start!44708 e!288402))

(assert (=> start!44708 true))

(declare-fun array_inv!11067 (array!31767) Bool)

(assert (=> start!44708 (array_inv!11067 a!3235)))

(declare-fun b!490652 () Bool)

(declare-fun e!288401 () Bool)

(assert (=> b!490652 (= e!288400 (not e!288401))))

(declare-fun res!293587 () Bool)

(assert (=> b!490652 (=> res!293587 e!288401)))

(declare-fun lt!221638 () (_ BitVec 64))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!221635 () array!31767)

(declare-datatypes ((SeekEntryResult!3738 0))(
  ( (MissingZero!3738 (index!17131 (_ BitVec 32))) (Found!3738 (index!17132 (_ BitVec 32))) (Intermediate!3738 (undefined!4550 Bool) (index!17133 (_ BitVec 32)) (x!46228 (_ BitVec 32))) (Undefined!3738) (MissingVacant!3738 (index!17134 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31767 (_ BitVec 32)) SeekEntryResult!3738)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490652 (= res!293587 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15271 a!3235) j!176) mask!3524) (select (arr!15271 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221638 mask!3524) lt!221638 lt!221635 mask!3524))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!490652 (= lt!221638 (select (store (arr!15271 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!490652 (= lt!221635 (array!31768 (store (arr!15271 a!3235) i!1204 k0!2280) (size!15635 a!3235)))))

(declare-fun lt!221633 () SeekEntryResult!3738)

(assert (=> b!490652 (= lt!221633 (Found!3738 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31767 (_ BitVec 32)) SeekEntryResult!3738)

(assert (=> b!490652 (= lt!221633 (seekEntryOrOpen!0 (select (arr!15271 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31767 (_ BitVec 32)) Bool)

(assert (=> b!490652 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14422 0))(
  ( (Unit!14423) )
))
(declare-fun lt!221636 () Unit!14422)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31767 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14422)

(assert (=> b!490652 (= lt!221636 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490653 () Bool)

(declare-fun res!293592 () Bool)

(assert (=> b!490653 (=> (not res!293592) (not e!288402))))

(assert (=> b!490653 (= res!293592 (and (= (size!15635 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15635 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15635 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490654 () Bool)

(declare-fun res!293591 () Bool)

(assert (=> b!490654 (=> (not res!293591) (not e!288402))))

(declare-fun arrayContainsKey!0 (array!31767 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490654 (= res!293591 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490655 () Bool)

(assert (=> b!490655 (= e!288401 true)))

(assert (=> b!490655 (= lt!221633 (seekEntryOrOpen!0 lt!221638 lt!221635 mask!3524))))

(declare-fun lt!221634 () Unit!14422)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31767 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14422)

(assert (=> b!490655 (= lt!221634 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!490656 () Bool)

(assert (=> b!490656 (= e!288402 e!288400)))

(declare-fun res!293588 () Bool)

(assert (=> b!490656 (=> (not res!293588) (not e!288400))))

(declare-fun lt!221637 () SeekEntryResult!3738)

(assert (=> b!490656 (= res!293588 (or (= lt!221637 (MissingZero!3738 i!1204)) (= lt!221637 (MissingVacant!3738 i!1204))))))

(assert (=> b!490656 (= lt!221637 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!490657 () Bool)

(declare-fun res!293589 () Bool)

(assert (=> b!490657 (=> (not res!293589) (not e!288402))))

(assert (=> b!490657 (= res!293589 (validKeyInArray!0 (select (arr!15271 a!3235) j!176)))))

(declare-fun b!490658 () Bool)

(declare-fun res!293594 () Bool)

(assert (=> b!490658 (=> (not res!293594) (not e!288400))))

(assert (=> b!490658 (= res!293594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!44708 res!293593) b!490653))

(assert (= (and b!490653 res!293592) b!490657))

(assert (= (and b!490657 res!293589) b!490651))

(assert (= (and b!490651 res!293590) b!490654))

(assert (= (and b!490654 res!293591) b!490656))

(assert (= (and b!490656 res!293588) b!490658))

(assert (= (and b!490658 res!293594) b!490650))

(assert (= (and b!490650 res!293586) b!490652))

(assert (= (and b!490652 (not res!293587)) b!490655))

(declare-fun m!470857 () Bool)

(assert (=> b!490650 m!470857))

(declare-fun m!470859 () Bool)

(assert (=> start!44708 m!470859))

(declare-fun m!470861 () Bool)

(assert (=> start!44708 m!470861))

(declare-fun m!470863 () Bool)

(assert (=> b!490657 m!470863))

(assert (=> b!490657 m!470863))

(declare-fun m!470865 () Bool)

(assert (=> b!490657 m!470865))

(declare-fun m!470867 () Bool)

(assert (=> b!490656 m!470867))

(declare-fun m!470869 () Bool)

(assert (=> b!490651 m!470869))

(declare-fun m!470871 () Bool)

(assert (=> b!490658 m!470871))

(declare-fun m!470873 () Bool)

(assert (=> b!490654 m!470873))

(declare-fun m!470875 () Bool)

(assert (=> b!490655 m!470875))

(declare-fun m!470877 () Bool)

(assert (=> b!490655 m!470877))

(declare-fun m!470879 () Bool)

(assert (=> b!490652 m!470879))

(declare-fun m!470881 () Bool)

(assert (=> b!490652 m!470881))

(declare-fun m!470883 () Bool)

(assert (=> b!490652 m!470883))

(declare-fun m!470885 () Bool)

(assert (=> b!490652 m!470885))

(declare-fun m!470887 () Bool)

(assert (=> b!490652 m!470887))

(declare-fun m!470889 () Bool)

(assert (=> b!490652 m!470889))

(assert (=> b!490652 m!470863))

(declare-fun m!470891 () Bool)

(assert (=> b!490652 m!470891))

(assert (=> b!490652 m!470863))

(assert (=> b!490652 m!470889))

(assert (=> b!490652 m!470863))

(declare-fun m!470893 () Bool)

(assert (=> b!490652 m!470893))

(assert (=> b!490652 m!470863))

(declare-fun m!470895 () Bool)

(assert (=> b!490652 m!470895))

(assert (=> b!490652 m!470879))

(check-sat (not b!490651) (not b!490655) (not b!490654) (not b!490650) (not b!490656) (not b!490652) (not b!490657) (not start!44708) (not b!490658))
(check-sat)

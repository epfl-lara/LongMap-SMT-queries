; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45144 () Bool)

(assert start!45144)

(declare-fun b!495126 () Bool)

(declare-fun e!290477 () Bool)

(declare-fun e!290476 () Bool)

(assert (=> b!495126 (= e!290477 e!290476)))

(declare-fun res!297664 () Bool)

(assert (=> b!495126 (=> (not res!297664) (not e!290476))))

(declare-datatypes ((SeekEntryResult!3868 0))(
  ( (MissingZero!3868 (index!17651 (_ BitVec 32))) (Found!3868 (index!17652 (_ BitVec 32))) (Intermediate!3868 (undefined!4680 Bool) (index!17653 (_ BitVec 32)) (x!46731 (_ BitVec 32))) (Undefined!3868) (MissingVacant!3868 (index!17654 (_ BitVec 32))) )
))
(declare-fun lt!224035 () SeekEntryResult!3868)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!495126 (= res!297664 (or (= lt!224035 (MissingZero!3868 i!1204)) (= lt!224035 (MissingVacant!3868 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32042 0))(
  ( (array!32043 (arr!15404 (Array (_ BitVec 32) (_ BitVec 64))) (size!15769 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32042)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32042 (_ BitVec 32)) SeekEntryResult!3868)

(assert (=> b!495126 (= lt!224035 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!495127 () Bool)

(declare-fun res!297659 () Bool)

(assert (=> b!495127 (=> (not res!297659) (not e!290477))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!495127 (= res!297659 (validKeyInArray!0 k0!2280))))

(declare-fun b!495128 () Bool)

(declare-fun res!297656 () Bool)

(declare-fun e!290475 () Bool)

(assert (=> b!495128 (=> res!297656 e!290475)))

(declare-fun lt!224034 () SeekEntryResult!3868)

(get-info :version)

(assert (=> b!495128 (= res!297656 (or (undefined!4680 lt!224034) (not ((_ is Intermediate!3868) lt!224034))))))

(declare-fun b!495129 () Bool)

(assert (=> b!495129 (= e!290475 true)))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!495129 (and (bvslt (x!46731 lt!224034) #b01111111111111111111111111111110) (or (= (select (arr!15404 a!3235) (index!17653 lt!224034)) (select (arr!15404 a!3235) j!176)) (= (select (arr!15404 a!3235) (index!17653 lt!224034)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15404 a!3235) (index!17653 lt!224034)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!495130 () Bool)

(declare-fun res!297660 () Bool)

(assert (=> b!495130 (=> (not res!297660) (not e!290477))))

(assert (=> b!495130 (= res!297660 (validKeyInArray!0 (select (arr!15404 a!3235) j!176)))))

(declare-fun res!297663 () Bool)

(assert (=> start!45144 (=> (not res!297663) (not e!290477))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45144 (= res!297663 (validMask!0 mask!3524))))

(assert (=> start!45144 e!290477))

(assert (=> start!45144 true))

(declare-fun array_inv!11287 (array!32042) Bool)

(assert (=> start!45144 (array_inv!11287 a!3235)))

(declare-fun b!495131 () Bool)

(declare-fun res!297657 () Bool)

(assert (=> b!495131 (=> (not res!297657) (not e!290477))))

(declare-fun arrayContainsKey!0 (array!32042 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!495131 (= res!297657 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!495132 () Bool)

(declare-fun res!297655 () Bool)

(assert (=> b!495132 (=> (not res!297655) (not e!290476))))

(declare-datatypes ((List!9601 0))(
  ( (Nil!9598) (Cons!9597 (h!10468 (_ BitVec 64)) (t!15820 List!9601)) )
))
(declare-fun arrayNoDuplicates!0 (array!32042 (_ BitVec 32) List!9601) Bool)

(assert (=> b!495132 (= res!297655 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9598))))

(declare-fun b!495133 () Bool)

(assert (=> b!495133 (= e!290476 (not e!290475))))

(declare-fun res!297658 () Bool)

(assert (=> b!495133 (=> res!297658 e!290475)))

(declare-fun lt!224038 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32042 (_ BitVec 32)) SeekEntryResult!3868)

(assert (=> b!495133 (= res!297658 (= lt!224034 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224038 (select (store (arr!15404 a!3235) i!1204 k0!2280) j!176) (array!32043 (store (arr!15404 a!3235) i!1204 k0!2280) (size!15769 a!3235)) mask!3524)))))

(declare-fun lt!224036 () (_ BitVec 32))

(assert (=> b!495133 (= lt!224034 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224036 (select (arr!15404 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!495133 (= lt!224038 (toIndex!0 (select (store (arr!15404 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!495133 (= lt!224036 (toIndex!0 (select (arr!15404 a!3235) j!176) mask!3524))))

(declare-fun e!290478 () Bool)

(assert (=> b!495133 e!290478))

(declare-fun res!297661 () Bool)

(assert (=> b!495133 (=> (not res!297661) (not e!290478))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32042 (_ BitVec 32)) Bool)

(assert (=> b!495133 (= res!297661 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14668 0))(
  ( (Unit!14669) )
))
(declare-fun lt!224037 () Unit!14668)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32042 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14668)

(assert (=> b!495133 (= lt!224037 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!495134 () Bool)

(assert (=> b!495134 (= e!290478 (= (seekEntryOrOpen!0 (select (arr!15404 a!3235) j!176) a!3235 mask!3524) (Found!3868 j!176)))))

(declare-fun b!495135 () Bool)

(declare-fun res!297662 () Bool)

(assert (=> b!495135 (=> (not res!297662) (not e!290477))))

(assert (=> b!495135 (= res!297662 (and (= (size!15769 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15769 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15769 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!495136 () Bool)

(declare-fun res!297665 () Bool)

(assert (=> b!495136 (=> (not res!297665) (not e!290476))))

(assert (=> b!495136 (= res!297665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!45144 res!297663) b!495135))

(assert (= (and b!495135 res!297662) b!495130))

(assert (= (and b!495130 res!297660) b!495127))

(assert (= (and b!495127 res!297659) b!495131))

(assert (= (and b!495131 res!297657) b!495126))

(assert (= (and b!495126 res!297664) b!495136))

(assert (= (and b!495136 res!297665) b!495132))

(assert (= (and b!495132 res!297655) b!495133))

(assert (= (and b!495133 res!297661) b!495134))

(assert (= (and b!495133 (not res!297658)) b!495128))

(assert (= (and b!495128 (not res!297656)) b!495129))

(declare-fun m!475723 () Bool)

(assert (=> b!495127 m!475723))

(declare-fun m!475725 () Bool)

(assert (=> b!495134 m!475725))

(assert (=> b!495134 m!475725))

(declare-fun m!475727 () Bool)

(assert (=> b!495134 m!475727))

(declare-fun m!475729 () Bool)

(assert (=> b!495133 m!475729))

(declare-fun m!475731 () Bool)

(assert (=> b!495133 m!475731))

(declare-fun m!475733 () Bool)

(assert (=> b!495133 m!475733))

(assert (=> b!495133 m!475733))

(declare-fun m!475735 () Bool)

(assert (=> b!495133 m!475735))

(assert (=> b!495133 m!475725))

(declare-fun m!475737 () Bool)

(assert (=> b!495133 m!475737))

(assert (=> b!495133 m!475725))

(declare-fun m!475739 () Bool)

(assert (=> b!495133 m!475739))

(assert (=> b!495133 m!475725))

(declare-fun m!475741 () Bool)

(assert (=> b!495133 m!475741))

(assert (=> b!495133 m!475733))

(declare-fun m!475743 () Bool)

(assert (=> b!495133 m!475743))

(declare-fun m!475745 () Bool)

(assert (=> b!495131 m!475745))

(declare-fun m!475747 () Bool)

(assert (=> b!495129 m!475747))

(assert (=> b!495129 m!475725))

(declare-fun m!475749 () Bool)

(assert (=> start!45144 m!475749))

(declare-fun m!475751 () Bool)

(assert (=> start!45144 m!475751))

(assert (=> b!495130 m!475725))

(assert (=> b!495130 m!475725))

(declare-fun m!475753 () Bool)

(assert (=> b!495130 m!475753))

(declare-fun m!475755 () Bool)

(assert (=> b!495126 m!475755))

(declare-fun m!475757 () Bool)

(assert (=> b!495136 m!475757))

(declare-fun m!475759 () Bool)

(assert (=> b!495132 m!475759))

(check-sat (not b!495136) (not b!495126) (not b!495127) (not b!495131) (not b!495133) (not b!495130) (not b!495134) (not start!45144) (not b!495132))
(check-sat)

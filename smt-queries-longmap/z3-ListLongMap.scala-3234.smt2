; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45198 () Bool)

(assert start!45198)

(declare-fun b!496017 () Bool)

(declare-fun e!290880 () Bool)

(assert (=> b!496017 (= e!290880 true)))

(declare-datatypes ((SeekEntryResult!3895 0))(
  ( (MissingZero!3895 (index!17759 (_ BitVec 32))) (Found!3895 (index!17760 (_ BitVec 32))) (Intermediate!3895 (undefined!4707 Bool) (index!17761 (_ BitVec 32)) (x!46830 (_ BitVec 32))) (Undefined!3895) (MissingVacant!3895 (index!17762 (_ BitVec 32))) )
))
(declare-fun lt!224442 () SeekEntryResult!3895)

(declare-datatypes ((array!32096 0))(
  ( (array!32097 (arr!15431 (Array (_ BitVec 32) (_ BitVec 64))) (size!15796 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32096)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!496017 (and (bvslt (x!46830 lt!224442) #b01111111111111111111111111111110) (or (= (select (arr!15431 a!3235) (index!17761 lt!224442)) (select (arr!15431 a!3235) j!176)) (= (select (arr!15431 a!3235) (index!17761 lt!224442)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15431 a!3235) (index!17761 lt!224442)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!496018 () Bool)

(declare-fun res!298551 () Bool)

(declare-fun e!290882 () Bool)

(assert (=> b!496018 (=> (not res!298551) (not e!290882))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32096 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496018 (= res!298551 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!496019 () Bool)

(declare-fun res!298554 () Bool)

(assert (=> b!496019 (=> (not res!298554) (not e!290882))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496019 (= res!298554 (validKeyInArray!0 k0!2280))))

(declare-fun b!496020 () Bool)

(declare-fun e!290879 () Bool)

(assert (=> b!496020 (= e!290882 e!290879)))

(declare-fun res!298549 () Bool)

(assert (=> b!496020 (=> (not res!298549) (not e!290879))))

(declare-fun lt!224440 () SeekEntryResult!3895)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!496020 (= res!298549 (or (= lt!224440 (MissingZero!3895 i!1204)) (= lt!224440 (MissingVacant!3895 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32096 (_ BitVec 32)) SeekEntryResult!3895)

(assert (=> b!496020 (= lt!224440 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!298556 () Bool)

(assert (=> start!45198 (=> (not res!298556) (not e!290882))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45198 (= res!298556 (validMask!0 mask!3524))))

(assert (=> start!45198 e!290882))

(assert (=> start!45198 true))

(declare-fun array_inv!11314 (array!32096) Bool)

(assert (=> start!45198 (array_inv!11314 a!3235)))

(declare-fun b!496021 () Bool)

(declare-fun res!298546 () Bool)

(assert (=> b!496021 (=> (not res!298546) (not e!290882))))

(assert (=> b!496021 (= res!298546 (validKeyInArray!0 (select (arr!15431 a!3235) j!176)))))

(declare-fun b!496022 () Bool)

(declare-fun res!298548 () Bool)

(assert (=> b!496022 (=> (not res!298548) (not e!290879))))

(declare-datatypes ((List!9628 0))(
  ( (Nil!9625) (Cons!9624 (h!10495 (_ BitVec 64)) (t!15847 List!9628)) )
))
(declare-fun arrayNoDuplicates!0 (array!32096 (_ BitVec 32) List!9628) Bool)

(assert (=> b!496022 (= res!298548 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9625))))

(declare-fun b!496023 () Bool)

(declare-fun res!298552 () Bool)

(assert (=> b!496023 (=> (not res!298552) (not e!290879))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32096 (_ BitVec 32)) Bool)

(assert (=> b!496023 (= res!298552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun e!290881 () Bool)

(declare-fun b!496024 () Bool)

(assert (=> b!496024 (= e!290881 (= (seekEntryOrOpen!0 (select (arr!15431 a!3235) j!176) a!3235 mask!3524) (Found!3895 j!176)))))

(declare-fun b!496025 () Bool)

(declare-fun res!298550 () Bool)

(assert (=> b!496025 (=> res!298550 e!290880)))

(get-info :version)

(assert (=> b!496025 (= res!298550 (or (undefined!4707 lt!224442) (not ((_ is Intermediate!3895) lt!224442))))))

(declare-fun b!496026 () Bool)

(declare-fun res!298555 () Bool)

(assert (=> b!496026 (=> (not res!298555) (not e!290882))))

(assert (=> b!496026 (= res!298555 (and (= (size!15796 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15796 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15796 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!496027 () Bool)

(assert (=> b!496027 (= e!290879 (not e!290880))))

(declare-fun res!298553 () Bool)

(assert (=> b!496027 (=> res!298553 e!290880)))

(declare-fun lt!224439 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32096 (_ BitVec 32)) SeekEntryResult!3895)

(assert (=> b!496027 (= res!298553 (= lt!224442 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224439 (select (store (arr!15431 a!3235) i!1204 k0!2280) j!176) (array!32097 (store (arr!15431 a!3235) i!1204 k0!2280) (size!15796 a!3235)) mask!3524)))))

(declare-fun lt!224441 () (_ BitVec 32))

(assert (=> b!496027 (= lt!224442 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224441 (select (arr!15431 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496027 (= lt!224439 (toIndex!0 (select (store (arr!15431 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!496027 (= lt!224441 (toIndex!0 (select (arr!15431 a!3235) j!176) mask!3524))))

(assert (=> b!496027 e!290881))

(declare-fun res!298547 () Bool)

(assert (=> b!496027 (=> (not res!298547) (not e!290881))))

(assert (=> b!496027 (= res!298547 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14722 0))(
  ( (Unit!14723) )
))
(declare-fun lt!224443 () Unit!14722)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32096 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14722)

(assert (=> b!496027 (= lt!224443 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!45198 res!298556) b!496026))

(assert (= (and b!496026 res!298555) b!496021))

(assert (= (and b!496021 res!298546) b!496019))

(assert (= (and b!496019 res!298554) b!496018))

(assert (= (and b!496018 res!298551) b!496020))

(assert (= (and b!496020 res!298549) b!496023))

(assert (= (and b!496023 res!298552) b!496022))

(assert (= (and b!496022 res!298548) b!496027))

(assert (= (and b!496027 res!298547) b!496024))

(assert (= (and b!496027 (not res!298553)) b!496025))

(assert (= (and b!496025 (not res!298550)) b!496017))

(declare-fun m!476749 () Bool)

(assert (=> b!496019 m!476749))

(declare-fun m!476751 () Bool)

(assert (=> b!496018 m!476751))

(declare-fun m!476753 () Bool)

(assert (=> start!45198 m!476753))

(declare-fun m!476755 () Bool)

(assert (=> start!45198 m!476755))

(declare-fun m!476757 () Bool)

(assert (=> b!496017 m!476757))

(declare-fun m!476759 () Bool)

(assert (=> b!496017 m!476759))

(assert (=> b!496024 m!476759))

(assert (=> b!496024 m!476759))

(declare-fun m!476761 () Bool)

(assert (=> b!496024 m!476761))

(declare-fun m!476763 () Bool)

(assert (=> b!496022 m!476763))

(declare-fun m!476765 () Bool)

(assert (=> b!496020 m!476765))

(declare-fun m!476767 () Bool)

(assert (=> b!496023 m!476767))

(declare-fun m!476769 () Bool)

(assert (=> b!496027 m!476769))

(declare-fun m!476771 () Bool)

(assert (=> b!496027 m!476771))

(declare-fun m!476773 () Bool)

(assert (=> b!496027 m!476773))

(declare-fun m!476775 () Bool)

(assert (=> b!496027 m!476775))

(assert (=> b!496027 m!476769))

(assert (=> b!496027 m!476759))

(declare-fun m!476777 () Bool)

(assert (=> b!496027 m!476777))

(assert (=> b!496027 m!476759))

(assert (=> b!496027 m!476759))

(declare-fun m!476779 () Bool)

(assert (=> b!496027 m!476779))

(declare-fun m!476781 () Bool)

(assert (=> b!496027 m!476781))

(assert (=> b!496027 m!476769))

(declare-fun m!476783 () Bool)

(assert (=> b!496027 m!476783))

(assert (=> b!496021 m!476759))

(assert (=> b!496021 m!476759))

(declare-fun m!476785 () Bool)

(assert (=> b!496021 m!476785))

(check-sat (not start!45198) (not b!496018) (not b!496022) (not b!496021) (not b!496023) (not b!496024) (not b!496019) (not b!496027) (not b!496020))
(check-sat)

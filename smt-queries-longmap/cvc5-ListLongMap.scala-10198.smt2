; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120114 () Bool)

(assert start!120114)

(declare-fun b!1398508 () Bool)

(declare-fun res!937426 () Bool)

(declare-fun e!791731 () Bool)

(assert (=> b!1398508 (=> (not res!937426) (not e!791731))))

(declare-datatypes ((array!95643 0))(
  ( (array!95644 (arr!46175 (Array (_ BitVec 32) (_ BitVec 64))) (size!46725 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95643)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398508 (= res!937426 (validKeyInArray!0 (select (arr!46175 a!2901) j!112)))))

(declare-fun b!1398509 () Bool)

(declare-fun res!937423 () Bool)

(assert (=> b!1398509 (=> (not res!937423) (not e!791731))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1398509 (= res!937423 (and (= (size!46725 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46725 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46725 a!2901)) (not (= i!1037 j!112))))))

(declare-fun e!791732 () Bool)

(declare-fun b!1398510 () Bool)

(declare-datatypes ((SeekEntryResult!10492 0))(
  ( (MissingZero!10492 (index!44339 (_ BitVec 32))) (Found!10492 (index!44340 (_ BitVec 32))) (Intermediate!10492 (undefined!11304 Bool) (index!44341 (_ BitVec 32)) (x!125986 (_ BitVec 32))) (Undefined!10492) (MissingVacant!10492 (index!44342 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95643 (_ BitVec 32)) SeekEntryResult!10492)

(assert (=> b!1398510 (= e!791732 (= (seekEntryOrOpen!0 (select (arr!46175 a!2901) j!112) a!2901 mask!2840) (Found!10492 j!112)))))

(declare-fun b!1398511 () Bool)

(declare-fun res!937427 () Bool)

(assert (=> b!1398511 (=> (not res!937427) (not e!791731))))

(declare-datatypes ((List!32694 0))(
  ( (Nil!32691) (Cons!32690 (h!33932 (_ BitVec 64)) (t!47388 List!32694)) )
))
(declare-fun arrayNoDuplicates!0 (array!95643 (_ BitVec 32) List!32694) Bool)

(assert (=> b!1398511 (= res!937427 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32691))))

(declare-fun b!1398512 () Bool)

(declare-fun res!937421 () Bool)

(assert (=> b!1398512 (=> (not res!937421) (not e!791731))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95643 (_ BitVec 32)) Bool)

(assert (=> b!1398512 (= res!937421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1398513 () Bool)

(declare-fun e!791730 () Bool)

(assert (=> b!1398513 (= e!791730 true)))

(declare-fun lt!614971 () SeekEntryResult!10492)

(declare-fun lt!614973 () SeekEntryResult!10492)

(assert (=> b!1398513 (and (not (undefined!11304 lt!614971)) (= (index!44341 lt!614971) i!1037) (bvslt (x!125986 lt!614971) (x!125986 lt!614973)) (= (select (store (arr!46175 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44341 lt!614971)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!46988 0))(
  ( (Unit!46989) )
))
(declare-fun lt!614976 () Unit!46988)

(declare-fun lt!614975 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95643 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46988)

(assert (=> b!1398513 (= lt!614976 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!614975 (x!125986 lt!614973) (index!44341 lt!614973) (x!125986 lt!614971) (index!44341 lt!614971) (undefined!11304 lt!614971) mask!2840))))

(declare-fun res!937428 () Bool)

(assert (=> start!120114 (=> (not res!937428) (not e!791731))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120114 (= res!937428 (validMask!0 mask!2840))))

(assert (=> start!120114 e!791731))

(assert (=> start!120114 true))

(declare-fun array_inv!35203 (array!95643) Bool)

(assert (=> start!120114 (array_inv!35203 a!2901)))

(declare-fun b!1398514 () Bool)

(declare-fun e!791729 () Bool)

(assert (=> b!1398514 (= e!791729 e!791730)))

(declare-fun res!937429 () Bool)

(assert (=> b!1398514 (=> res!937429 e!791730)))

(assert (=> b!1398514 (= res!937429 (or (= lt!614973 lt!614971) (not (is-Intermediate!10492 lt!614971))))))

(declare-fun lt!614972 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95643 (_ BitVec 32)) SeekEntryResult!10492)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398514 (= lt!614971 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614972 mask!2840) lt!614972 (array!95644 (store (arr!46175 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46725 a!2901)) mask!2840))))

(assert (=> b!1398514 (= lt!614972 (select (store (arr!46175 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1398515 () Bool)

(assert (=> b!1398515 (= e!791731 (not e!791729))))

(declare-fun res!937422 () Bool)

(assert (=> b!1398515 (=> res!937422 e!791729)))

(assert (=> b!1398515 (= res!937422 (or (not (is-Intermediate!10492 lt!614973)) (undefined!11304 lt!614973)))))

(assert (=> b!1398515 e!791732))

(declare-fun res!937424 () Bool)

(assert (=> b!1398515 (=> (not res!937424) (not e!791732))))

(assert (=> b!1398515 (= res!937424 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!614974 () Unit!46988)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95643 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46988)

(assert (=> b!1398515 (= lt!614974 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1398515 (= lt!614973 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614975 (select (arr!46175 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1398515 (= lt!614975 (toIndex!0 (select (arr!46175 a!2901) j!112) mask!2840))))

(declare-fun b!1398516 () Bool)

(declare-fun res!937425 () Bool)

(assert (=> b!1398516 (=> (not res!937425) (not e!791731))))

(assert (=> b!1398516 (= res!937425 (validKeyInArray!0 (select (arr!46175 a!2901) i!1037)))))

(assert (= (and start!120114 res!937428) b!1398509))

(assert (= (and b!1398509 res!937423) b!1398516))

(assert (= (and b!1398516 res!937425) b!1398508))

(assert (= (and b!1398508 res!937426) b!1398512))

(assert (= (and b!1398512 res!937421) b!1398511))

(assert (= (and b!1398511 res!937427) b!1398515))

(assert (= (and b!1398515 res!937424) b!1398510))

(assert (= (and b!1398515 (not res!937422)) b!1398514))

(assert (= (and b!1398514 (not res!937429)) b!1398513))

(declare-fun m!1285665 () Bool)

(assert (=> start!120114 m!1285665))

(declare-fun m!1285667 () Bool)

(assert (=> start!120114 m!1285667))

(declare-fun m!1285669 () Bool)

(assert (=> b!1398514 m!1285669))

(declare-fun m!1285671 () Bool)

(assert (=> b!1398514 m!1285671))

(assert (=> b!1398514 m!1285669))

(declare-fun m!1285673 () Bool)

(assert (=> b!1398514 m!1285673))

(declare-fun m!1285675 () Bool)

(assert (=> b!1398514 m!1285675))

(declare-fun m!1285677 () Bool)

(assert (=> b!1398510 m!1285677))

(assert (=> b!1398510 m!1285677))

(declare-fun m!1285679 () Bool)

(assert (=> b!1398510 m!1285679))

(assert (=> b!1398515 m!1285677))

(declare-fun m!1285681 () Bool)

(assert (=> b!1398515 m!1285681))

(assert (=> b!1398515 m!1285677))

(assert (=> b!1398515 m!1285677))

(declare-fun m!1285683 () Bool)

(assert (=> b!1398515 m!1285683))

(declare-fun m!1285685 () Bool)

(assert (=> b!1398515 m!1285685))

(declare-fun m!1285687 () Bool)

(assert (=> b!1398515 m!1285687))

(assert (=> b!1398513 m!1285671))

(declare-fun m!1285689 () Bool)

(assert (=> b!1398513 m!1285689))

(declare-fun m!1285691 () Bool)

(assert (=> b!1398513 m!1285691))

(declare-fun m!1285693 () Bool)

(assert (=> b!1398511 m!1285693))

(assert (=> b!1398508 m!1285677))

(assert (=> b!1398508 m!1285677))

(declare-fun m!1285695 () Bool)

(assert (=> b!1398508 m!1285695))

(declare-fun m!1285697 () Bool)

(assert (=> b!1398512 m!1285697))

(declare-fun m!1285699 () Bool)

(assert (=> b!1398516 m!1285699))

(assert (=> b!1398516 m!1285699))

(declare-fun m!1285701 () Bool)

(assert (=> b!1398516 m!1285701))

(push 1)


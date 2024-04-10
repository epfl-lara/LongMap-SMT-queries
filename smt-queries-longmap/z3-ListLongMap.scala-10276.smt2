; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120818 () Bool)

(assert start!120818)

(declare-fun b!1405760 () Bool)

(declare-fun res!943983 () Bool)

(declare-fun e!795701 () Bool)

(assert (=> b!1405760 (=> (not res!943983) (not e!795701))))

(declare-datatypes ((array!96125 0))(
  ( (array!96126 (arr!46410 (Array (_ BitVec 32) (_ BitVec 64))) (size!46960 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96125)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405760 (= res!943983 (validKeyInArray!0 (select (arr!46410 a!2901) i!1037)))))

(declare-fun b!1405761 () Bool)

(declare-fun res!943980 () Bool)

(assert (=> b!1405761 (=> (not res!943980) (not e!795701))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96125 (_ BitVec 32)) Bool)

(assert (=> b!1405761 (= res!943980 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!943979 () Bool)

(assert (=> start!120818 (=> (not res!943979) (not e!795701))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120818 (= res!943979 (validMask!0 mask!2840))))

(assert (=> start!120818 e!795701))

(assert (=> start!120818 true))

(declare-fun array_inv!35438 (array!96125) Bool)

(assert (=> start!120818 (array_inv!35438 a!2901)))

(declare-fun b!1405762 () Bool)

(declare-fun res!943977 () Bool)

(assert (=> b!1405762 (=> (not res!943977) (not e!795701))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1405762 (= res!943977 (and (= (size!46960 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46960 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46960 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405763 () Bool)

(declare-fun e!795704 () Bool)

(assert (=> b!1405763 (= e!795704 true)))

(declare-fun lt!619129 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405763 (= lt!619129 (toIndex!0 (select (store (arr!46410 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(declare-fun e!795703 () Bool)

(declare-fun b!1405764 () Bool)

(declare-datatypes ((SeekEntryResult!10721 0))(
  ( (MissingZero!10721 (index!45261 (_ BitVec 32))) (Found!10721 (index!45262 (_ BitVec 32))) (Intermediate!10721 (undefined!11533 Bool) (index!45263 (_ BitVec 32)) (x!126872 (_ BitVec 32))) (Undefined!10721) (MissingVacant!10721 (index!45264 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96125 (_ BitVec 32)) SeekEntryResult!10721)

(assert (=> b!1405764 (= e!795703 (= (seekEntryOrOpen!0 (select (arr!46410 a!2901) j!112) a!2901 mask!2840) (Found!10721 j!112)))))

(declare-fun b!1405765 () Bool)

(declare-fun res!943984 () Bool)

(assert (=> b!1405765 (=> (not res!943984) (not e!795701))))

(declare-datatypes ((List!32929 0))(
  ( (Nil!32926) (Cons!32925 (h!34179 (_ BitVec 64)) (t!47623 List!32929)) )
))
(declare-fun arrayNoDuplicates!0 (array!96125 (_ BitVec 32) List!32929) Bool)

(assert (=> b!1405765 (= res!943984 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32926))))

(declare-fun b!1405766 () Bool)

(assert (=> b!1405766 (= e!795701 (not e!795704))))

(declare-fun res!943978 () Bool)

(assert (=> b!1405766 (=> res!943978 e!795704)))

(declare-fun lt!619130 () SeekEntryResult!10721)

(get-info :version)

(assert (=> b!1405766 (= res!943978 (or (not ((_ is Intermediate!10721) lt!619130)) (undefined!11533 lt!619130)))))

(assert (=> b!1405766 e!795703))

(declare-fun res!943981 () Bool)

(assert (=> b!1405766 (=> (not res!943981) (not e!795703))))

(assert (=> b!1405766 (= res!943981 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47416 0))(
  ( (Unit!47417) )
))
(declare-fun lt!619131 () Unit!47416)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96125 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47416)

(assert (=> b!1405766 (= lt!619131 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96125 (_ BitVec 32)) SeekEntryResult!10721)

(assert (=> b!1405766 (= lt!619130 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46410 a!2901) j!112) mask!2840) (select (arr!46410 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405767 () Bool)

(declare-fun res!943982 () Bool)

(assert (=> b!1405767 (=> (not res!943982) (not e!795701))))

(assert (=> b!1405767 (= res!943982 (validKeyInArray!0 (select (arr!46410 a!2901) j!112)))))

(assert (= (and start!120818 res!943979) b!1405762))

(assert (= (and b!1405762 res!943977) b!1405760))

(assert (= (and b!1405760 res!943983) b!1405767))

(assert (= (and b!1405767 res!943982) b!1405761))

(assert (= (and b!1405761 res!943980) b!1405765))

(assert (= (and b!1405765 res!943984) b!1405766))

(assert (= (and b!1405766 res!943981) b!1405764))

(assert (= (and b!1405766 (not res!943978)) b!1405763))

(declare-fun m!1294625 () Bool)

(assert (=> b!1405761 m!1294625))

(declare-fun m!1294627 () Bool)

(assert (=> b!1405764 m!1294627))

(assert (=> b!1405764 m!1294627))

(declare-fun m!1294629 () Bool)

(assert (=> b!1405764 m!1294629))

(declare-fun m!1294631 () Bool)

(assert (=> b!1405760 m!1294631))

(assert (=> b!1405760 m!1294631))

(declare-fun m!1294633 () Bool)

(assert (=> b!1405760 m!1294633))

(assert (=> b!1405767 m!1294627))

(assert (=> b!1405767 m!1294627))

(declare-fun m!1294635 () Bool)

(assert (=> b!1405767 m!1294635))

(assert (=> b!1405766 m!1294627))

(declare-fun m!1294637 () Bool)

(assert (=> b!1405766 m!1294637))

(assert (=> b!1405766 m!1294627))

(declare-fun m!1294639 () Bool)

(assert (=> b!1405766 m!1294639))

(assert (=> b!1405766 m!1294637))

(assert (=> b!1405766 m!1294627))

(declare-fun m!1294641 () Bool)

(assert (=> b!1405766 m!1294641))

(declare-fun m!1294643 () Bool)

(assert (=> b!1405766 m!1294643))

(declare-fun m!1294645 () Bool)

(assert (=> b!1405763 m!1294645))

(declare-fun m!1294647 () Bool)

(assert (=> b!1405763 m!1294647))

(assert (=> b!1405763 m!1294647))

(declare-fun m!1294649 () Bool)

(assert (=> b!1405763 m!1294649))

(declare-fun m!1294651 () Bool)

(assert (=> start!120818 m!1294651))

(declare-fun m!1294653 () Bool)

(assert (=> start!120818 m!1294653))

(declare-fun m!1294655 () Bool)

(assert (=> b!1405765 m!1294655))

(check-sat (not b!1405763) (not start!120818) (not b!1405761) (not b!1405767) (not b!1405764) (not b!1405766) (not b!1405765) (not b!1405760))

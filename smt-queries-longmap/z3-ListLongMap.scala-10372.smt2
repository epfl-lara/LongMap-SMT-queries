; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122102 () Bool)

(assert start!122102)

(declare-fun b!1416902 () Bool)

(declare-fun res!952783 () Bool)

(declare-fun e!801922 () Bool)

(assert (=> b!1416902 (=> (not res!952783) (not e!801922))))

(declare-datatypes ((array!96737 0))(
  ( (array!96738 (arr!46698 (Array (_ BitVec 32) (_ BitVec 64))) (size!47248 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96737)

(declare-datatypes ((List!33217 0))(
  ( (Nil!33214) (Cons!33213 (h!34503 (_ BitVec 64)) (t!47911 List!33217)) )
))
(declare-fun arrayNoDuplicates!0 (array!96737 (_ BitVec 32) List!33217) Bool)

(assert (=> b!1416902 (= res!952783 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33214))))

(declare-fun b!1416903 () Bool)

(declare-fun res!952779 () Bool)

(assert (=> b!1416903 (=> (not res!952779) (not e!801922))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96737 (_ BitVec 32)) Bool)

(assert (=> b!1416903 (= res!952779 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1416904 () Bool)

(declare-fun res!952780 () Bool)

(assert (=> b!1416904 (=> (not res!952780) (not e!801922))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1416904 (= res!952780 (validKeyInArray!0 (select (arr!46698 a!2901) j!112)))))

(declare-fun b!1416905 () Bool)

(declare-fun e!801920 () Bool)

(declare-datatypes ((SeekEntryResult!11009 0))(
  ( (MissingZero!11009 (index!46428 (_ BitVec 32))) (Found!11009 (index!46429 (_ BitVec 32))) (Intermediate!11009 (undefined!11821 Bool) (index!46430 (_ BitVec 32)) (x!128030 (_ BitVec 32))) (Undefined!11009) (MissingVacant!11009 (index!46431 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96737 (_ BitVec 32)) SeekEntryResult!11009)

(assert (=> b!1416905 (= e!801920 (= (seekEntryOrOpen!0 (select (arr!46698 a!2901) j!112) a!2901 mask!2840) (Found!11009 j!112)))))

(declare-fun b!1416906 () Bool)

(declare-fun res!952786 () Bool)

(assert (=> b!1416906 (=> (not res!952786) (not e!801922))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1416906 (= res!952786 (validKeyInArray!0 (select (arr!46698 a!2901) i!1037)))))

(declare-fun b!1416907 () Bool)

(declare-fun e!801921 () Bool)

(assert (=> b!1416907 (= e!801921 true)))

(declare-fun lt!625160 () SeekEntryResult!11009)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96737 (_ BitVec 32)) SeekEntryResult!11009)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416907 (= lt!625160 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46698 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46698 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96738 (store (arr!46698 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47248 a!2901)) mask!2840))))

(declare-fun res!952781 () Bool)

(assert (=> start!122102 (=> (not res!952781) (not e!801922))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122102 (= res!952781 (validMask!0 mask!2840))))

(assert (=> start!122102 e!801922))

(assert (=> start!122102 true))

(declare-fun array_inv!35726 (array!96737) Bool)

(assert (=> start!122102 (array_inv!35726 a!2901)))

(declare-fun b!1416908 () Bool)

(assert (=> b!1416908 (= e!801922 (not e!801921))))

(declare-fun res!952782 () Bool)

(assert (=> b!1416908 (=> res!952782 e!801921)))

(declare-fun lt!625159 () SeekEntryResult!11009)

(get-info :version)

(assert (=> b!1416908 (= res!952782 (or (not ((_ is Intermediate!11009) lt!625159)) (undefined!11821 lt!625159)))))

(assert (=> b!1416908 e!801920))

(declare-fun res!952785 () Bool)

(assert (=> b!1416908 (=> (not res!952785) (not e!801920))))

(assert (=> b!1416908 (= res!952785 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47992 0))(
  ( (Unit!47993) )
))
(declare-fun lt!625161 () Unit!47992)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96737 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47992)

(assert (=> b!1416908 (= lt!625161 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1416908 (= lt!625159 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46698 a!2901) j!112) mask!2840) (select (arr!46698 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1416909 () Bool)

(declare-fun res!952784 () Bool)

(assert (=> b!1416909 (=> (not res!952784) (not e!801922))))

(assert (=> b!1416909 (= res!952784 (and (= (size!47248 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47248 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47248 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!122102 res!952781) b!1416909))

(assert (= (and b!1416909 res!952784) b!1416906))

(assert (= (and b!1416906 res!952786) b!1416904))

(assert (= (and b!1416904 res!952780) b!1416903))

(assert (= (and b!1416903 res!952779) b!1416902))

(assert (= (and b!1416902 res!952783) b!1416908))

(assert (= (and b!1416908 res!952785) b!1416905))

(assert (= (and b!1416908 (not res!952782)) b!1416907))

(declare-fun m!1307611 () Bool)

(assert (=> b!1416905 m!1307611))

(assert (=> b!1416905 m!1307611))

(declare-fun m!1307613 () Bool)

(assert (=> b!1416905 m!1307613))

(declare-fun m!1307615 () Bool)

(assert (=> b!1416902 m!1307615))

(declare-fun m!1307617 () Bool)

(assert (=> b!1416903 m!1307617))

(assert (=> b!1416904 m!1307611))

(assert (=> b!1416904 m!1307611))

(declare-fun m!1307619 () Bool)

(assert (=> b!1416904 m!1307619))

(declare-fun m!1307621 () Bool)

(assert (=> b!1416906 m!1307621))

(assert (=> b!1416906 m!1307621))

(declare-fun m!1307623 () Bool)

(assert (=> b!1416906 m!1307623))

(declare-fun m!1307625 () Bool)

(assert (=> b!1416907 m!1307625))

(declare-fun m!1307627 () Bool)

(assert (=> b!1416907 m!1307627))

(assert (=> b!1416907 m!1307627))

(declare-fun m!1307629 () Bool)

(assert (=> b!1416907 m!1307629))

(assert (=> b!1416907 m!1307629))

(assert (=> b!1416907 m!1307627))

(declare-fun m!1307631 () Bool)

(assert (=> b!1416907 m!1307631))

(assert (=> b!1416908 m!1307611))

(declare-fun m!1307633 () Bool)

(assert (=> b!1416908 m!1307633))

(assert (=> b!1416908 m!1307611))

(declare-fun m!1307635 () Bool)

(assert (=> b!1416908 m!1307635))

(assert (=> b!1416908 m!1307633))

(assert (=> b!1416908 m!1307611))

(declare-fun m!1307637 () Bool)

(assert (=> b!1416908 m!1307637))

(declare-fun m!1307639 () Bool)

(assert (=> b!1416908 m!1307639))

(declare-fun m!1307641 () Bool)

(assert (=> start!122102 m!1307641))

(declare-fun m!1307643 () Bool)

(assert (=> start!122102 m!1307643))

(check-sat (not b!1416906) (not b!1416902) (not b!1416904) (not b!1416908) (not b!1416907) (not b!1416903) (not start!122102) (not b!1416905))

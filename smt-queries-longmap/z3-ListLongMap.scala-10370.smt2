; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122090 () Bool)

(assert start!122090)

(declare-fun b!1416758 () Bool)

(declare-fun e!801848 () Bool)

(declare-fun e!801849 () Bool)

(assert (=> b!1416758 (= e!801848 (not e!801849))))

(declare-fun res!952638 () Bool)

(assert (=> b!1416758 (=> res!952638 e!801849)))

(declare-datatypes ((SeekEntryResult!11003 0))(
  ( (MissingZero!11003 (index!46404 (_ BitVec 32))) (Found!11003 (index!46405 (_ BitVec 32))) (Intermediate!11003 (undefined!11815 Bool) (index!46406 (_ BitVec 32)) (x!128008 (_ BitVec 32))) (Undefined!11003) (MissingVacant!11003 (index!46407 (_ BitVec 32))) )
))
(declare-fun lt!625107 () SeekEntryResult!11003)

(get-info :version)

(assert (=> b!1416758 (= res!952638 (or (not ((_ is Intermediate!11003) lt!625107)) (undefined!11815 lt!625107)))))

(declare-fun e!801851 () Bool)

(assert (=> b!1416758 e!801851))

(declare-fun res!952642 () Bool)

(assert (=> b!1416758 (=> (not res!952642) (not e!801851))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96725 0))(
  ( (array!96726 (arr!46692 (Array (_ BitVec 32) (_ BitVec 64))) (size!47242 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96725)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96725 (_ BitVec 32)) Bool)

(assert (=> b!1416758 (= res!952642 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47980 0))(
  ( (Unit!47981) )
))
(declare-fun lt!625105 () Unit!47980)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96725 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47980)

(assert (=> b!1416758 (= lt!625105 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96725 (_ BitVec 32)) SeekEntryResult!11003)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416758 (= lt!625107 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46692 a!2901) j!112) mask!2840) (select (arr!46692 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1416759 () Bool)

(declare-fun res!952639 () Bool)

(assert (=> b!1416759 (=> (not res!952639) (not e!801848))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1416759 (= res!952639 (and (= (size!47242 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47242 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47242 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1416760 () Bool)

(declare-fun res!952636 () Bool)

(assert (=> b!1416760 (=> (not res!952636) (not e!801848))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1416760 (= res!952636 (validKeyInArray!0 (select (arr!46692 a!2901) i!1037)))))

(declare-fun b!1416761 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96725 (_ BitVec 32)) SeekEntryResult!11003)

(assert (=> b!1416761 (= e!801851 (= (seekEntryOrOpen!0 (select (arr!46692 a!2901) j!112) a!2901 mask!2840) (Found!11003 j!112)))))

(declare-fun b!1416762 () Bool)

(declare-fun res!952640 () Bool)

(assert (=> b!1416762 (=> (not res!952640) (not e!801848))))

(assert (=> b!1416762 (= res!952640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1416763 () Bool)

(assert (=> b!1416763 (= e!801849 true)))

(declare-fun lt!625106 () SeekEntryResult!11003)

(assert (=> b!1416763 (= lt!625106 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46692 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46692 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96726 (store (arr!46692 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47242 a!2901)) mask!2840))))

(declare-fun res!952641 () Bool)

(assert (=> start!122090 (=> (not res!952641) (not e!801848))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122090 (= res!952641 (validMask!0 mask!2840))))

(assert (=> start!122090 e!801848))

(assert (=> start!122090 true))

(declare-fun array_inv!35720 (array!96725) Bool)

(assert (=> start!122090 (array_inv!35720 a!2901)))

(declare-fun b!1416764 () Bool)

(declare-fun res!952637 () Bool)

(assert (=> b!1416764 (=> (not res!952637) (not e!801848))))

(declare-datatypes ((List!33211 0))(
  ( (Nil!33208) (Cons!33207 (h!34497 (_ BitVec 64)) (t!47905 List!33211)) )
))
(declare-fun arrayNoDuplicates!0 (array!96725 (_ BitVec 32) List!33211) Bool)

(assert (=> b!1416764 (= res!952637 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33208))))

(declare-fun b!1416765 () Bool)

(declare-fun res!952635 () Bool)

(assert (=> b!1416765 (=> (not res!952635) (not e!801848))))

(assert (=> b!1416765 (= res!952635 (validKeyInArray!0 (select (arr!46692 a!2901) j!112)))))

(assert (= (and start!122090 res!952641) b!1416759))

(assert (= (and b!1416759 res!952639) b!1416760))

(assert (= (and b!1416760 res!952636) b!1416765))

(assert (= (and b!1416765 res!952635) b!1416762))

(assert (= (and b!1416762 res!952640) b!1416764))

(assert (= (and b!1416764 res!952637) b!1416758))

(assert (= (and b!1416758 res!952642) b!1416761))

(assert (= (and b!1416758 (not res!952638)) b!1416763))

(declare-fun m!1307407 () Bool)

(assert (=> b!1416763 m!1307407))

(declare-fun m!1307409 () Bool)

(assert (=> b!1416763 m!1307409))

(assert (=> b!1416763 m!1307409))

(declare-fun m!1307411 () Bool)

(assert (=> b!1416763 m!1307411))

(assert (=> b!1416763 m!1307411))

(assert (=> b!1416763 m!1307409))

(declare-fun m!1307413 () Bool)

(assert (=> b!1416763 m!1307413))

(declare-fun m!1307415 () Bool)

(assert (=> b!1416760 m!1307415))

(assert (=> b!1416760 m!1307415))

(declare-fun m!1307417 () Bool)

(assert (=> b!1416760 m!1307417))

(declare-fun m!1307419 () Bool)

(assert (=> b!1416762 m!1307419))

(declare-fun m!1307421 () Bool)

(assert (=> start!122090 m!1307421))

(declare-fun m!1307423 () Bool)

(assert (=> start!122090 m!1307423))

(declare-fun m!1307425 () Bool)

(assert (=> b!1416764 m!1307425))

(declare-fun m!1307427 () Bool)

(assert (=> b!1416761 m!1307427))

(assert (=> b!1416761 m!1307427))

(declare-fun m!1307429 () Bool)

(assert (=> b!1416761 m!1307429))

(assert (=> b!1416765 m!1307427))

(assert (=> b!1416765 m!1307427))

(declare-fun m!1307431 () Bool)

(assert (=> b!1416765 m!1307431))

(assert (=> b!1416758 m!1307427))

(declare-fun m!1307433 () Bool)

(assert (=> b!1416758 m!1307433))

(assert (=> b!1416758 m!1307427))

(declare-fun m!1307435 () Bool)

(assert (=> b!1416758 m!1307435))

(assert (=> b!1416758 m!1307433))

(assert (=> b!1416758 m!1307427))

(declare-fun m!1307437 () Bool)

(assert (=> b!1416758 m!1307437))

(declare-fun m!1307439 () Bool)

(assert (=> b!1416758 m!1307439))

(check-sat (not b!1416761) (not start!122090) (not b!1416764) (not b!1416760) (not b!1416762) (not b!1416763) (not b!1416758) (not b!1416765))

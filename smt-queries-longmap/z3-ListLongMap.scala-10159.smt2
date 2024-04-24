; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119906 () Bool)

(assert start!119906)

(declare-fun b!1395742 () Bool)

(declare-fun res!934468 () Bool)

(declare-fun e!790315 () Bool)

(assert (=> b!1395742 (=> res!934468 e!790315)))

(declare-datatypes ((array!95510 0))(
  ( (array!95511 (arr!46111 (Array (_ BitVec 32) (_ BitVec 64))) (size!46662 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95510)

(declare-fun lt!612996 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10331 0))(
  ( (MissingZero!10331 (index!43695 (_ BitVec 32))) (Found!10331 (index!43696 (_ BitVec 32))) (Intermediate!10331 (undefined!11143 Bool) (index!43697 (_ BitVec 32)) (x!125514 (_ BitVec 32))) (Undefined!10331) (MissingVacant!10331 (index!43698 (_ BitVec 32))) )
))
(declare-fun lt!612997 () SeekEntryResult!10331)

(assert (=> b!1395742 (= res!934468 (or (bvslt (x!125514 lt!612997) #b00000000000000000000000000000000) (bvsgt (x!125514 lt!612997) #b01111111111111111111111111111110) (bvslt lt!612996 #b00000000000000000000000000000000) (bvsge lt!612996 (size!46662 a!2901)) (bvslt (index!43697 lt!612997) #b00000000000000000000000000000000) (bvsge (index!43697 lt!612997) (size!46662 a!2901)) (not (= lt!612997 (Intermediate!10331 false (index!43697 lt!612997) (x!125514 lt!612997))))))))

(declare-fun b!1395743 () Bool)

(declare-fun res!934473 () Bool)

(declare-fun e!790313 () Bool)

(assert (=> b!1395743 (=> (not res!934473) (not e!790313))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95510 (_ BitVec 32)) Bool)

(assert (=> b!1395743 (= res!934473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1395744 () Bool)

(declare-fun res!934470 () Bool)

(assert (=> b!1395744 (=> (not res!934470) (not e!790313))))

(declare-datatypes ((List!32617 0))(
  ( (Nil!32614) (Cons!32613 (h!33854 (_ BitVec 64)) (t!47303 List!32617)) )
))
(declare-fun arrayNoDuplicates!0 (array!95510 (_ BitVec 32) List!32617) Bool)

(assert (=> b!1395744 (= res!934470 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32614))))

(declare-fun b!1395745 () Bool)

(declare-fun e!790314 () Bool)

(assert (=> b!1395745 (= e!790313 (not e!790314))))

(declare-fun res!934467 () Bool)

(assert (=> b!1395745 (=> res!934467 e!790314)))

(get-info :version)

(assert (=> b!1395745 (= res!934467 (or (not ((_ is Intermediate!10331) lt!612997)) (undefined!11143 lt!612997)))))

(declare-fun lt!612999 () SeekEntryResult!10331)

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1395745 (= lt!612999 (Found!10331 j!112))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95510 (_ BitVec 32)) SeekEntryResult!10331)

(assert (=> b!1395745 (= lt!612999 (seekEntryOrOpen!0 (select (arr!46111 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1395745 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!46693 0))(
  ( (Unit!46694) )
))
(declare-fun lt!612998 () Unit!46693)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95510 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46693)

(assert (=> b!1395745 (= lt!612998 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95510 (_ BitVec 32)) SeekEntryResult!10331)

(assert (=> b!1395745 (= lt!612997 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!612996 (select (arr!46111 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395745 (= lt!612996 (toIndex!0 (select (arr!46111 a!2901) j!112) mask!2840))))

(declare-fun b!1395747 () Bool)

(assert (=> b!1395747 (= e!790314 e!790315)))

(declare-fun res!934466 () Bool)

(assert (=> b!1395747 (=> res!934466 e!790315)))

(declare-fun lt!613001 () (_ BitVec 64))

(declare-fun lt!612995 () array!95510)

(assert (=> b!1395747 (= res!934466 (not (= lt!612997 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613001 mask!2840) lt!613001 lt!612995 mask!2840))))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1395747 (= lt!613001 (select (store (arr!46111 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1395747 (= lt!612995 (array!95511 (store (arr!46111 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46662 a!2901)))))

(declare-fun b!1395748 () Bool)

(declare-fun res!934472 () Bool)

(assert (=> b!1395748 (=> (not res!934472) (not e!790313))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1395748 (= res!934472 (validKeyInArray!0 (select (arr!46111 a!2901) i!1037)))))

(declare-fun b!1395749 () Bool)

(declare-fun res!934474 () Bool)

(assert (=> b!1395749 (=> (not res!934474) (not e!790313))))

(assert (=> b!1395749 (= res!934474 (and (= (size!46662 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46662 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46662 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1395750 () Bool)

(assert (=> b!1395750 (= e!790315 (bvsge mask!2840 #b00000000000000000000000000000000))))

(assert (=> b!1395750 (= lt!612999 (seekEntryOrOpen!0 lt!613001 lt!612995 mask!2840))))

(declare-fun lt!613000 () Unit!46693)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!95510 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46693)

(assert (=> b!1395750 (= lt!613000 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!612996 (x!125514 lt!612997) (index!43697 lt!612997) mask!2840))))

(declare-fun b!1395746 () Bool)

(declare-fun res!934469 () Bool)

(assert (=> b!1395746 (=> (not res!934469) (not e!790313))))

(assert (=> b!1395746 (= res!934469 (validKeyInArray!0 (select (arr!46111 a!2901) j!112)))))

(declare-fun res!934471 () Bool)

(assert (=> start!119906 (=> (not res!934471) (not e!790313))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119906 (= res!934471 (validMask!0 mask!2840))))

(assert (=> start!119906 e!790313))

(assert (=> start!119906 true))

(declare-fun array_inv!35392 (array!95510) Bool)

(assert (=> start!119906 (array_inv!35392 a!2901)))

(assert (= (and start!119906 res!934471) b!1395749))

(assert (= (and b!1395749 res!934474) b!1395748))

(assert (= (and b!1395748 res!934472) b!1395746))

(assert (= (and b!1395746 res!934469) b!1395743))

(assert (= (and b!1395743 res!934473) b!1395744))

(assert (= (and b!1395744 res!934470) b!1395745))

(assert (= (and b!1395745 (not res!934467)) b!1395747))

(assert (= (and b!1395747 (not res!934466)) b!1395742))

(assert (= (and b!1395742 (not res!934468)) b!1395750))

(declare-fun m!1282363 () Bool)

(assert (=> b!1395748 m!1282363))

(assert (=> b!1395748 m!1282363))

(declare-fun m!1282365 () Bool)

(assert (=> b!1395748 m!1282365))

(declare-fun m!1282367 () Bool)

(assert (=> b!1395745 m!1282367))

(declare-fun m!1282369 () Bool)

(assert (=> b!1395745 m!1282369))

(assert (=> b!1395745 m!1282367))

(declare-fun m!1282371 () Bool)

(assert (=> b!1395745 m!1282371))

(declare-fun m!1282373 () Bool)

(assert (=> b!1395745 m!1282373))

(assert (=> b!1395745 m!1282367))

(declare-fun m!1282375 () Bool)

(assert (=> b!1395745 m!1282375))

(assert (=> b!1395745 m!1282367))

(declare-fun m!1282377 () Bool)

(assert (=> b!1395745 m!1282377))

(declare-fun m!1282379 () Bool)

(assert (=> start!119906 m!1282379))

(declare-fun m!1282381 () Bool)

(assert (=> start!119906 m!1282381))

(declare-fun m!1282383 () Bool)

(assert (=> b!1395750 m!1282383))

(declare-fun m!1282385 () Bool)

(assert (=> b!1395750 m!1282385))

(declare-fun m!1282387 () Bool)

(assert (=> b!1395744 m!1282387))

(assert (=> b!1395746 m!1282367))

(assert (=> b!1395746 m!1282367))

(declare-fun m!1282389 () Bool)

(assert (=> b!1395746 m!1282389))

(declare-fun m!1282391 () Bool)

(assert (=> b!1395743 m!1282391))

(declare-fun m!1282393 () Bool)

(assert (=> b!1395747 m!1282393))

(assert (=> b!1395747 m!1282393))

(declare-fun m!1282395 () Bool)

(assert (=> b!1395747 m!1282395))

(declare-fun m!1282397 () Bool)

(assert (=> b!1395747 m!1282397))

(declare-fun m!1282399 () Bool)

(assert (=> b!1395747 m!1282399))

(check-sat (not b!1395750) (not b!1395743) (not b!1395747) (not b!1395745) (not b!1395744) (not start!119906) (not b!1395746) (not b!1395748))
(check-sat)

; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120876 () Bool)

(assert start!120876)

(declare-fun b!1406423 () Bool)

(declare-fun res!944695 () Bool)

(declare-fun e!796036 () Bool)

(assert (=> b!1406423 (=> (not res!944695) (not e!796036))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96136 0))(
  ( (array!96137 (arr!46416 (Array (_ BitVec 32) (_ BitVec 64))) (size!46968 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96136)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1406423 (= res!944695 (and (= (size!46968 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46968 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46968 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1406424 () Bool)

(declare-fun e!796034 () Bool)

(declare-datatypes ((SeekEntryResult!10753 0))(
  ( (MissingZero!10753 (index!45389 (_ BitVec 32))) (Found!10753 (index!45390 (_ BitVec 32))) (Intermediate!10753 (undefined!11565 Bool) (index!45391 (_ BitVec 32)) (x!126981 (_ BitVec 32))) (Undefined!10753) (MissingVacant!10753 (index!45392 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96136 (_ BitVec 32)) SeekEntryResult!10753)

(assert (=> b!1406424 (= e!796034 (= (seekEntryOrOpen!0 (select (arr!46416 a!2901) j!112) a!2901 mask!2840) (Found!10753 j!112)))))

(declare-fun b!1406425 () Bool)

(declare-fun res!944691 () Bool)

(assert (=> b!1406425 (=> (not res!944691) (not e!796036))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96136 (_ BitVec 32)) Bool)

(assert (=> b!1406425 (= res!944691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1406426 () Bool)

(declare-fun res!944696 () Bool)

(assert (=> b!1406426 (=> (not res!944696) (not e!796036))))

(declare-datatypes ((List!33013 0))(
  ( (Nil!33010) (Cons!33009 (h!34263 (_ BitVec 64)) (t!47699 List!33013)) )
))
(declare-fun arrayNoDuplicates!0 (array!96136 (_ BitVec 32) List!33013) Bool)

(assert (=> b!1406426 (= res!944696 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33010))))

(declare-fun b!1406428 () Bool)

(declare-fun e!796037 () Bool)

(assert (=> b!1406428 (= e!796036 (not e!796037))))

(declare-fun res!944694 () Bool)

(assert (=> b!1406428 (=> res!944694 e!796037)))

(declare-fun lt!619219 () SeekEntryResult!10753)

(assert (=> b!1406428 (= res!944694 (or (not (is-Intermediate!10753 lt!619219)) (undefined!11565 lt!619219)))))

(assert (=> b!1406428 e!796034))

(declare-fun res!944698 () Bool)

(assert (=> b!1406428 (=> (not res!944698) (not e!796034))))

(assert (=> b!1406428 (= res!944698 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47323 0))(
  ( (Unit!47324) )
))
(declare-fun lt!619220 () Unit!47323)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96136 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47323)

(assert (=> b!1406428 (= lt!619220 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96136 (_ BitVec 32)) SeekEntryResult!10753)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406428 (= lt!619219 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46416 a!2901) j!112) mask!2840) (select (arr!46416 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406429 () Bool)

(declare-fun res!944697 () Bool)

(assert (=> b!1406429 (=> (not res!944697) (not e!796036))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406429 (= res!944697 (validKeyInArray!0 (select (arr!46416 a!2901) j!112)))))

(declare-fun b!1406430 () Bool)

(assert (=> b!1406430 (= e!796037 true)))

(declare-fun lt!619218 () SeekEntryResult!10753)

(assert (=> b!1406430 (= lt!619218 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46416 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46416 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96137 (store (arr!46416 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46968 a!2901)) mask!2840))))

(declare-fun res!944693 () Bool)

(assert (=> start!120876 (=> (not res!944693) (not e!796036))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120876 (= res!944693 (validMask!0 mask!2840))))

(assert (=> start!120876 e!796036))

(assert (=> start!120876 true))

(declare-fun array_inv!35649 (array!96136) Bool)

(assert (=> start!120876 (array_inv!35649 a!2901)))

(declare-fun b!1406427 () Bool)

(declare-fun res!944692 () Bool)

(assert (=> b!1406427 (=> (not res!944692) (not e!796036))))

(assert (=> b!1406427 (= res!944692 (validKeyInArray!0 (select (arr!46416 a!2901) i!1037)))))

(assert (= (and start!120876 res!944693) b!1406423))

(assert (= (and b!1406423 res!944695) b!1406427))

(assert (= (and b!1406427 res!944692) b!1406429))

(assert (= (and b!1406429 res!944697) b!1406425))

(assert (= (and b!1406425 res!944691) b!1406426))

(assert (= (and b!1406426 res!944696) b!1406428))

(assert (= (and b!1406428 res!944698) b!1406424))

(assert (= (and b!1406428 (not res!944694)) b!1406430))

(declare-fun m!1295139 () Bool)

(assert (=> b!1406428 m!1295139))

(declare-fun m!1295141 () Bool)

(assert (=> b!1406428 m!1295141))

(assert (=> b!1406428 m!1295139))

(declare-fun m!1295143 () Bool)

(assert (=> b!1406428 m!1295143))

(assert (=> b!1406428 m!1295141))

(assert (=> b!1406428 m!1295139))

(declare-fun m!1295145 () Bool)

(assert (=> b!1406428 m!1295145))

(declare-fun m!1295147 () Bool)

(assert (=> b!1406428 m!1295147))

(declare-fun m!1295149 () Bool)

(assert (=> b!1406430 m!1295149))

(declare-fun m!1295151 () Bool)

(assert (=> b!1406430 m!1295151))

(assert (=> b!1406430 m!1295151))

(declare-fun m!1295153 () Bool)

(assert (=> b!1406430 m!1295153))

(assert (=> b!1406430 m!1295153))

(assert (=> b!1406430 m!1295151))

(declare-fun m!1295155 () Bool)

(assert (=> b!1406430 m!1295155))

(declare-fun m!1295157 () Bool)

(assert (=> start!120876 m!1295157))

(declare-fun m!1295159 () Bool)

(assert (=> start!120876 m!1295159))

(declare-fun m!1295161 () Bool)

(assert (=> b!1406427 m!1295161))

(assert (=> b!1406427 m!1295161))

(declare-fun m!1295163 () Bool)

(assert (=> b!1406427 m!1295163))

(declare-fun m!1295165 () Bool)

(assert (=> b!1406425 m!1295165))

(assert (=> b!1406424 m!1295139))

(assert (=> b!1406424 m!1295139))

(declare-fun m!1295167 () Bool)

(assert (=> b!1406424 m!1295167))

(assert (=> b!1406429 m!1295139))

(assert (=> b!1406429 m!1295139))

(declare-fun m!1295169 () Bool)

(assert (=> b!1406429 m!1295169))

(declare-fun m!1295171 () Bool)

(assert (=> b!1406426 m!1295171))

(push 1)

(assert (not b!1406425))

(assert (not b!1406427))

(assert (not b!1406429))

(assert (not b!1406424))

(assert (not b!1406426))

(assert (not start!120876))

(assert (not b!1406430))

(assert (not b!1406428))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


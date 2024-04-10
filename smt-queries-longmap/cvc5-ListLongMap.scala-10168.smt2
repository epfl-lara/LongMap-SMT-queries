; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119880 () Bool)

(assert start!119880)

(declare-fun b!1395830 () Bool)

(declare-fun res!934909 () Bool)

(declare-fun e!790237 () Bool)

(assert (=> b!1395830 (=> (not res!934909) (not e!790237))))

(declare-datatypes ((array!95460 0))(
  ( (array!95461 (arr!46085 (Array (_ BitVec 32) (_ BitVec 64))) (size!46635 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95460)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95460 (_ BitVec 32)) Bool)

(assert (=> b!1395830 (= res!934909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1395831 () Bool)

(declare-fun res!934911 () Bool)

(assert (=> b!1395831 (=> (not res!934911) (not e!790237))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1395831 (= res!934911 (and (= (size!46635 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46635 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46635 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1395832 () Bool)

(declare-fun e!790235 () Bool)

(assert (=> b!1395832 (= e!790237 (not e!790235))))

(declare-fun res!934912 () Bool)

(assert (=> b!1395832 (=> res!934912 e!790235)))

(declare-datatypes ((SeekEntryResult!10402 0))(
  ( (MissingZero!10402 (index!43979 (_ BitVec 32))) (Found!10402 (index!43980 (_ BitVec 32))) (Intermediate!10402 (undefined!11214 Bool) (index!43981 (_ BitVec 32)) (x!125650 (_ BitVec 32))) (Undefined!10402) (MissingVacant!10402 (index!43982 (_ BitVec 32))) )
))
(declare-fun lt!613154 () SeekEntryResult!10402)

(assert (=> b!1395832 (= res!934912 (or (not (is-Intermediate!10402 lt!613154)) (undefined!11214 lt!613154)))))

(declare-fun e!790238 () Bool)

(assert (=> b!1395832 e!790238))

(declare-fun res!934914 () Bool)

(assert (=> b!1395832 (=> (not res!934914) (not e!790238))))

(assert (=> b!1395832 (= res!934914 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46808 0))(
  ( (Unit!46809) )
))
(declare-fun lt!613153 () Unit!46808)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95460 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46808)

(assert (=> b!1395832 (= lt!613153 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95460 (_ BitVec 32)) SeekEntryResult!10402)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395832 (= lt!613154 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46085 a!2901) j!112) mask!2840) (select (arr!46085 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!934910 () Bool)

(assert (=> start!119880 (=> (not res!934910) (not e!790237))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119880 (= res!934910 (validMask!0 mask!2840))))

(assert (=> start!119880 e!790237))

(assert (=> start!119880 true))

(declare-fun array_inv!35113 (array!95460) Bool)

(assert (=> start!119880 (array_inv!35113 a!2901)))

(declare-fun b!1395833 () Bool)

(declare-fun res!934913 () Bool)

(assert (=> b!1395833 (=> (not res!934913) (not e!790237))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1395833 (= res!934913 (validKeyInArray!0 (select (arr!46085 a!2901) j!112)))))

(declare-fun b!1395834 () Bool)

(declare-fun res!934915 () Bool)

(assert (=> b!1395834 (=> (not res!934915) (not e!790237))))

(declare-datatypes ((List!32604 0))(
  ( (Nil!32601) (Cons!32600 (h!33839 (_ BitVec 64)) (t!47298 List!32604)) )
))
(declare-fun arrayNoDuplicates!0 (array!95460 (_ BitVec 32) List!32604) Bool)

(assert (=> b!1395834 (= res!934915 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32601))))

(declare-fun b!1395835 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95460 (_ BitVec 32)) SeekEntryResult!10402)

(assert (=> b!1395835 (= e!790238 (= (seekEntryOrOpen!0 (select (arr!46085 a!2901) j!112) a!2901 mask!2840) (Found!10402 j!112)))))

(declare-fun b!1395836 () Bool)

(assert (=> b!1395836 (= e!790235 true)))

(declare-fun lt!613155 () SeekEntryResult!10402)

(assert (=> b!1395836 (= lt!613155 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46085 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46085 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95461 (store (arr!46085 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46635 a!2901)) mask!2840))))

(declare-fun b!1395837 () Bool)

(declare-fun res!934908 () Bool)

(assert (=> b!1395837 (=> (not res!934908) (not e!790237))))

(assert (=> b!1395837 (= res!934908 (validKeyInArray!0 (select (arr!46085 a!2901) i!1037)))))

(assert (= (and start!119880 res!934910) b!1395831))

(assert (= (and b!1395831 res!934911) b!1395837))

(assert (= (and b!1395837 res!934908) b!1395833))

(assert (= (and b!1395833 res!934913) b!1395830))

(assert (= (and b!1395830 res!934909) b!1395834))

(assert (= (and b!1395834 res!934915) b!1395832))

(assert (= (and b!1395832 res!934914) b!1395835))

(assert (= (and b!1395832 (not res!934912)) b!1395836))

(declare-fun m!1282251 () Bool)

(assert (=> b!1395834 m!1282251))

(declare-fun m!1282253 () Bool)

(assert (=> b!1395836 m!1282253))

(declare-fun m!1282255 () Bool)

(assert (=> b!1395836 m!1282255))

(assert (=> b!1395836 m!1282255))

(declare-fun m!1282257 () Bool)

(assert (=> b!1395836 m!1282257))

(assert (=> b!1395836 m!1282257))

(assert (=> b!1395836 m!1282255))

(declare-fun m!1282259 () Bool)

(assert (=> b!1395836 m!1282259))

(declare-fun m!1282261 () Bool)

(assert (=> b!1395833 m!1282261))

(assert (=> b!1395833 m!1282261))

(declare-fun m!1282263 () Bool)

(assert (=> b!1395833 m!1282263))

(declare-fun m!1282265 () Bool)

(assert (=> b!1395830 m!1282265))

(assert (=> b!1395832 m!1282261))

(declare-fun m!1282267 () Bool)

(assert (=> b!1395832 m!1282267))

(assert (=> b!1395832 m!1282261))

(declare-fun m!1282269 () Bool)

(assert (=> b!1395832 m!1282269))

(assert (=> b!1395832 m!1282267))

(assert (=> b!1395832 m!1282261))

(declare-fun m!1282271 () Bool)

(assert (=> b!1395832 m!1282271))

(declare-fun m!1282273 () Bool)

(assert (=> b!1395832 m!1282273))

(declare-fun m!1282275 () Bool)

(assert (=> start!119880 m!1282275))

(declare-fun m!1282277 () Bool)

(assert (=> start!119880 m!1282277))

(declare-fun m!1282279 () Bool)

(assert (=> b!1395837 m!1282279))

(assert (=> b!1395837 m!1282279))

(declare-fun m!1282281 () Bool)

(assert (=> b!1395837 m!1282281))

(assert (=> b!1395835 m!1282261))

(assert (=> b!1395835 m!1282261))

(declare-fun m!1282283 () Bool)

(assert (=> b!1395835 m!1282283))

(push 1)

(assert (not start!119880))

(assert (not b!1395833))

(assert (not b!1395836))

(assert (not b!1395834))

(assert (not b!1395837))

(assert (not b!1395835))

(assert (not b!1395830))

(assert (not b!1395832))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


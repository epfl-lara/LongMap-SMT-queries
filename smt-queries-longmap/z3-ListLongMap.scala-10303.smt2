; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121142 () Bool)

(assert start!121142)

(declare-fun b!1408550 () Bool)

(declare-fun e!797152 () Bool)

(assert (=> b!1408550 (= e!797152 true)))

(declare-datatypes ((array!96296 0))(
  ( (array!96297 (arr!46491 (Array (_ BitVec 32) (_ BitVec 64))) (size!47041 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96296)

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10802 0))(
  ( (MissingZero!10802 (index!45585 (_ BitVec 32))) (Found!10802 (index!45586 (_ BitVec 32))) (Intermediate!10802 (undefined!11614 Bool) (index!45587 (_ BitVec 32)) (x!127187 (_ BitVec 32))) (Undefined!10802) (MissingVacant!10802 (index!45588 (_ BitVec 32))) )
))
(declare-fun lt!620391 () SeekEntryResult!10802)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96296 (_ BitVec 32)) SeekEntryResult!10802)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408550 (= lt!620391 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46491 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46491 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96297 (store (arr!46491 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47041 a!2901)) mask!2840))))

(declare-fun b!1408551 () Bool)

(declare-fun res!946274 () Bool)

(declare-fun e!797151 () Bool)

(assert (=> b!1408551 (=> (not res!946274) (not e!797151))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408551 (= res!946274 (validKeyInArray!0 (select (arr!46491 a!2901) i!1037)))))

(declare-fun e!797150 () Bool)

(declare-fun b!1408552 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96296 (_ BitVec 32)) SeekEntryResult!10802)

(assert (=> b!1408552 (= e!797150 (= (seekEntryOrOpen!0 (select (arr!46491 a!2901) j!112) a!2901 mask!2840) (Found!10802 j!112)))))

(declare-fun b!1408553 () Bool)

(declare-fun res!946277 () Bool)

(assert (=> b!1408553 (=> (not res!946277) (not e!797151))))

(assert (=> b!1408553 (= res!946277 (and (= (size!47041 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47041 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47041 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1408554 () Bool)

(declare-fun res!946272 () Bool)

(assert (=> b!1408554 (=> (not res!946272) (not e!797151))))

(declare-datatypes ((List!33010 0))(
  ( (Nil!33007) (Cons!33006 (h!34269 (_ BitVec 64)) (t!47704 List!33010)) )
))
(declare-fun arrayNoDuplicates!0 (array!96296 (_ BitVec 32) List!33010) Bool)

(assert (=> b!1408554 (= res!946272 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33007))))

(declare-fun b!1408555 () Bool)

(declare-fun res!946278 () Bool)

(assert (=> b!1408555 (=> (not res!946278) (not e!797151))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96296 (_ BitVec 32)) Bool)

(assert (=> b!1408555 (= res!946278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1408556 () Bool)

(declare-fun res!946273 () Bool)

(assert (=> b!1408556 (=> (not res!946273) (not e!797151))))

(assert (=> b!1408556 (= res!946273 (validKeyInArray!0 (select (arr!46491 a!2901) j!112)))))

(declare-fun res!946275 () Bool)

(assert (=> start!121142 (=> (not res!946275) (not e!797151))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121142 (= res!946275 (validMask!0 mask!2840))))

(assert (=> start!121142 e!797151))

(assert (=> start!121142 true))

(declare-fun array_inv!35519 (array!96296) Bool)

(assert (=> start!121142 (array_inv!35519 a!2901)))

(declare-fun b!1408557 () Bool)

(assert (=> b!1408557 (= e!797151 (not e!797152))))

(declare-fun res!946279 () Bool)

(assert (=> b!1408557 (=> res!946279 e!797152)))

(declare-fun lt!620389 () SeekEntryResult!10802)

(get-info :version)

(assert (=> b!1408557 (= res!946279 (or (not ((_ is Intermediate!10802) lt!620389)) (undefined!11614 lt!620389)))))

(assert (=> b!1408557 e!797150))

(declare-fun res!946276 () Bool)

(assert (=> b!1408557 (=> (not res!946276) (not e!797150))))

(assert (=> b!1408557 (= res!946276 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47578 0))(
  ( (Unit!47579) )
))
(declare-fun lt!620390 () Unit!47578)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96296 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47578)

(assert (=> b!1408557 (= lt!620390 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1408557 (= lt!620389 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46491 a!2901) j!112) mask!2840) (select (arr!46491 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!121142 res!946275) b!1408553))

(assert (= (and b!1408553 res!946277) b!1408551))

(assert (= (and b!1408551 res!946274) b!1408556))

(assert (= (and b!1408556 res!946273) b!1408555))

(assert (= (and b!1408555 res!946278) b!1408554))

(assert (= (and b!1408554 res!946272) b!1408557))

(assert (= (and b!1408557 res!946276) b!1408552))

(assert (= (and b!1408557 (not res!946279)) b!1408550))

(declare-fun m!1297897 () Bool)

(assert (=> b!1408557 m!1297897))

(declare-fun m!1297899 () Bool)

(assert (=> b!1408557 m!1297899))

(assert (=> b!1408557 m!1297897))

(declare-fun m!1297901 () Bool)

(assert (=> b!1408557 m!1297901))

(assert (=> b!1408557 m!1297899))

(assert (=> b!1408557 m!1297897))

(declare-fun m!1297903 () Bool)

(assert (=> b!1408557 m!1297903))

(declare-fun m!1297905 () Bool)

(assert (=> b!1408557 m!1297905))

(declare-fun m!1297907 () Bool)

(assert (=> b!1408555 m!1297907))

(assert (=> b!1408552 m!1297897))

(assert (=> b!1408552 m!1297897))

(declare-fun m!1297909 () Bool)

(assert (=> b!1408552 m!1297909))

(declare-fun m!1297911 () Bool)

(assert (=> b!1408550 m!1297911))

(declare-fun m!1297913 () Bool)

(assert (=> b!1408550 m!1297913))

(assert (=> b!1408550 m!1297913))

(declare-fun m!1297915 () Bool)

(assert (=> b!1408550 m!1297915))

(assert (=> b!1408550 m!1297915))

(assert (=> b!1408550 m!1297913))

(declare-fun m!1297917 () Bool)

(assert (=> b!1408550 m!1297917))

(declare-fun m!1297919 () Bool)

(assert (=> b!1408551 m!1297919))

(assert (=> b!1408551 m!1297919))

(declare-fun m!1297921 () Bool)

(assert (=> b!1408551 m!1297921))

(declare-fun m!1297923 () Bool)

(assert (=> start!121142 m!1297923))

(declare-fun m!1297925 () Bool)

(assert (=> start!121142 m!1297925))

(assert (=> b!1408556 m!1297897))

(assert (=> b!1408556 m!1297897))

(declare-fun m!1297927 () Bool)

(assert (=> b!1408556 m!1297927))

(declare-fun m!1297929 () Bool)

(assert (=> b!1408554 m!1297929))

(check-sat (not b!1408556) (not b!1408551) (not b!1408554) (not start!121142) (not b!1408552) (not b!1408555) (not b!1408557) (not b!1408550))

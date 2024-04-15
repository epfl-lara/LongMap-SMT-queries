; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121448 () Bool)

(assert start!121448)

(declare-fun b!1411066 () Bool)

(declare-fun res!948350 () Bool)

(declare-fun e!798527 () Bool)

(assert (=> b!1411066 (=> (not res!948350) (not e!798527))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96402 0))(
  ( (array!96403 (arr!46540 (Array (_ BitVec 32) (_ BitVec 64))) (size!47092 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96402)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1411066 (= res!948350 (and (= (size!47092 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47092 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47092 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1411067 () Bool)

(declare-fun e!798524 () Bool)

(assert (=> b!1411067 (= e!798524 true)))

(declare-datatypes ((SeekEntryResult!10877 0))(
  ( (MissingZero!10877 (index!45885 (_ BitVec 32))) (Found!10877 (index!45886 (_ BitVec 32))) (Intermediate!10877 (undefined!11689 Bool) (index!45887 (_ BitVec 32)) (x!127477 (_ BitVec 32))) (Undefined!10877) (MissingVacant!10877 (index!45888 (_ BitVec 32))) )
))
(declare-fun lt!621359 () SeekEntryResult!10877)

(declare-fun lt!621357 () SeekEntryResult!10877)

(assert (=> b!1411067 (and (not (undefined!11689 lt!621359)) (= (index!45887 lt!621359) i!1037) (bvslt (x!127477 lt!621359) (x!127477 lt!621357)))))

(declare-fun lt!621356 () (_ BitVec 32))

(declare-datatypes ((Unit!47571 0))(
  ( (Unit!47572) )
))
(declare-fun lt!621355 () Unit!47571)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96402 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47571)

(assert (=> b!1411067 (= lt!621355 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621356 (x!127477 lt!621357) (index!45887 lt!621357) (x!127477 lt!621359) (index!45887 lt!621359) (undefined!11689 lt!621359) mask!2840))))

(declare-fun b!1411068 () Bool)

(declare-fun e!798526 () Bool)

(assert (=> b!1411068 (= e!798527 (not e!798526))))

(declare-fun res!948351 () Bool)

(assert (=> b!1411068 (=> res!948351 e!798526)))

(get-info :version)

(assert (=> b!1411068 (= res!948351 (or (not ((_ is Intermediate!10877) lt!621357)) (undefined!11689 lt!621357)))))

(declare-fun e!798525 () Bool)

(assert (=> b!1411068 e!798525))

(declare-fun res!948349 () Bool)

(assert (=> b!1411068 (=> (not res!948349) (not e!798525))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96402 (_ BitVec 32)) Bool)

(assert (=> b!1411068 (= res!948349 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!621358 () Unit!47571)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96402 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47571)

(assert (=> b!1411068 (= lt!621358 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96402 (_ BitVec 32)) SeekEntryResult!10877)

(assert (=> b!1411068 (= lt!621357 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621356 (select (arr!46540 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411068 (= lt!621356 (toIndex!0 (select (arr!46540 a!2901) j!112) mask!2840))))

(declare-fun b!1411069 () Bool)

(assert (=> b!1411069 (= e!798526 e!798524)))

(declare-fun res!948348 () Bool)

(assert (=> b!1411069 (=> res!948348 e!798524)))

(assert (=> b!1411069 (= res!948348 (or (= lt!621357 lt!621359) (not ((_ is Intermediate!10877) lt!621359))))))

(assert (=> b!1411069 (= lt!621359 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46540 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46540 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96403 (store (arr!46540 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47092 a!2901)) mask!2840))))

(declare-fun b!1411071 () Bool)

(declare-fun res!948345 () Bool)

(assert (=> b!1411071 (=> (not res!948345) (not e!798527))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411071 (= res!948345 (validKeyInArray!0 (select (arr!46540 a!2901) j!112)))))

(declare-fun b!1411072 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96402 (_ BitVec 32)) SeekEntryResult!10877)

(assert (=> b!1411072 (= e!798525 (= (seekEntryOrOpen!0 (select (arr!46540 a!2901) j!112) a!2901 mask!2840) (Found!10877 j!112)))))

(declare-fun b!1411073 () Bool)

(declare-fun res!948352 () Bool)

(assert (=> b!1411073 (=> (not res!948352) (not e!798527))))

(declare-datatypes ((List!33137 0))(
  ( (Nil!33134) (Cons!33133 (h!34405 (_ BitVec 64)) (t!47823 List!33137)) )
))
(declare-fun arrayNoDuplicates!0 (array!96402 (_ BitVec 32) List!33137) Bool)

(assert (=> b!1411073 (= res!948352 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33134))))

(declare-fun b!1411074 () Bool)

(declare-fun res!948344 () Bool)

(assert (=> b!1411074 (=> (not res!948344) (not e!798527))))

(assert (=> b!1411074 (= res!948344 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!948346 () Bool)

(assert (=> start!121448 (=> (not res!948346) (not e!798527))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121448 (= res!948346 (validMask!0 mask!2840))))

(assert (=> start!121448 e!798527))

(assert (=> start!121448 true))

(declare-fun array_inv!35773 (array!96402) Bool)

(assert (=> start!121448 (array_inv!35773 a!2901)))

(declare-fun b!1411070 () Bool)

(declare-fun res!948347 () Bool)

(assert (=> b!1411070 (=> (not res!948347) (not e!798527))))

(assert (=> b!1411070 (= res!948347 (validKeyInArray!0 (select (arr!46540 a!2901) i!1037)))))

(assert (= (and start!121448 res!948346) b!1411066))

(assert (= (and b!1411066 res!948350) b!1411070))

(assert (= (and b!1411070 res!948347) b!1411071))

(assert (= (and b!1411071 res!948345) b!1411074))

(assert (= (and b!1411074 res!948344) b!1411073))

(assert (= (and b!1411073 res!948352) b!1411068))

(assert (= (and b!1411068 res!948349) b!1411072))

(assert (= (and b!1411068 (not res!948351)) b!1411069))

(assert (= (and b!1411069 (not res!948348)) b!1411067))

(declare-fun m!1300357 () Bool)

(assert (=> b!1411072 m!1300357))

(assert (=> b!1411072 m!1300357))

(declare-fun m!1300359 () Bool)

(assert (=> b!1411072 m!1300359))

(declare-fun m!1300361 () Bool)

(assert (=> b!1411073 m!1300361))

(declare-fun m!1300363 () Bool)

(assert (=> b!1411067 m!1300363))

(declare-fun m!1300365 () Bool)

(assert (=> start!121448 m!1300365))

(declare-fun m!1300367 () Bool)

(assert (=> start!121448 m!1300367))

(declare-fun m!1300369 () Bool)

(assert (=> b!1411070 m!1300369))

(assert (=> b!1411070 m!1300369))

(declare-fun m!1300371 () Bool)

(assert (=> b!1411070 m!1300371))

(declare-fun m!1300373 () Bool)

(assert (=> b!1411074 m!1300373))

(assert (=> b!1411071 m!1300357))

(assert (=> b!1411071 m!1300357))

(declare-fun m!1300375 () Bool)

(assert (=> b!1411071 m!1300375))

(assert (=> b!1411068 m!1300357))

(declare-fun m!1300377 () Bool)

(assert (=> b!1411068 m!1300377))

(declare-fun m!1300379 () Bool)

(assert (=> b!1411068 m!1300379))

(declare-fun m!1300381 () Bool)

(assert (=> b!1411068 m!1300381))

(assert (=> b!1411068 m!1300357))

(declare-fun m!1300383 () Bool)

(assert (=> b!1411068 m!1300383))

(assert (=> b!1411068 m!1300357))

(declare-fun m!1300385 () Bool)

(assert (=> b!1411069 m!1300385))

(declare-fun m!1300387 () Bool)

(assert (=> b!1411069 m!1300387))

(assert (=> b!1411069 m!1300387))

(declare-fun m!1300389 () Bool)

(assert (=> b!1411069 m!1300389))

(assert (=> b!1411069 m!1300389))

(assert (=> b!1411069 m!1300387))

(declare-fun m!1300391 () Bool)

(assert (=> b!1411069 m!1300391))

(check-sat (not b!1411074) (not b!1411068) (not b!1411067) (not b!1411073) (not b!1411070) (not b!1411069) (not b!1411072) (not start!121448) (not b!1411071))
(check-sat)

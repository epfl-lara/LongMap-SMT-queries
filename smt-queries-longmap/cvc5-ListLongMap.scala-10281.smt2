; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120846 () Bool)

(assert start!120846)

(declare-fun b!1406063 () Bool)

(declare-fun res!944333 () Bool)

(declare-fun e!795854 () Bool)

(assert (=> b!1406063 (=> (not res!944333) (not e!795854))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96106 0))(
  ( (array!96107 (arr!46401 (Array (_ BitVec 32) (_ BitVec 64))) (size!46953 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96106)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1406063 (= res!944333 (and (= (size!46953 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46953 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46953 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1406064 () Bool)

(declare-fun res!944338 () Bool)

(assert (=> b!1406064 (=> (not res!944338) (not e!795854))))

(declare-datatypes ((List!32998 0))(
  ( (Nil!32995) (Cons!32994 (h!34248 (_ BitVec 64)) (t!47684 List!32998)) )
))
(declare-fun arrayNoDuplicates!0 (array!96106 (_ BitVec 32) List!32998) Bool)

(assert (=> b!1406064 (= res!944338 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32995))))

(declare-fun res!944334 () Bool)

(assert (=> start!120846 (=> (not res!944334) (not e!795854))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120846 (= res!944334 (validMask!0 mask!2840))))

(assert (=> start!120846 e!795854))

(assert (=> start!120846 true))

(declare-fun array_inv!35634 (array!96106) Bool)

(assert (=> start!120846 (array_inv!35634 a!2901)))

(declare-fun b!1406065 () Bool)

(declare-fun res!944336 () Bool)

(assert (=> b!1406065 (=> (not res!944336) (not e!795854))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406065 (= res!944336 (validKeyInArray!0 (select (arr!46401 a!2901) i!1037)))))

(declare-fun b!1406066 () Bool)

(declare-fun e!795855 () Bool)

(assert (=> b!1406066 (= e!795854 (not e!795855))))

(declare-fun res!944332 () Bool)

(assert (=> b!1406066 (=> res!944332 e!795855)))

(declare-datatypes ((SeekEntryResult!10738 0))(
  ( (MissingZero!10738 (index!45329 (_ BitVec 32))) (Found!10738 (index!45330 (_ BitVec 32))) (Intermediate!10738 (undefined!11550 Bool) (index!45331 (_ BitVec 32)) (x!126926 (_ BitVec 32))) (Undefined!10738) (MissingVacant!10738 (index!45332 (_ BitVec 32))) )
))
(declare-fun lt!619083 () SeekEntryResult!10738)

(assert (=> b!1406066 (= res!944332 (or (not (is-Intermediate!10738 lt!619083)) (undefined!11550 lt!619083)))))

(declare-fun e!795856 () Bool)

(assert (=> b!1406066 e!795856))

(declare-fun res!944331 () Bool)

(assert (=> b!1406066 (=> (not res!944331) (not e!795856))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96106 (_ BitVec 32)) Bool)

(assert (=> b!1406066 (= res!944331 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47293 0))(
  ( (Unit!47294) )
))
(declare-fun lt!619084 () Unit!47293)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96106 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47293)

(assert (=> b!1406066 (= lt!619084 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96106 (_ BitVec 32)) SeekEntryResult!10738)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406066 (= lt!619083 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46401 a!2901) j!112) mask!2840) (select (arr!46401 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406067 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96106 (_ BitVec 32)) SeekEntryResult!10738)

(assert (=> b!1406067 (= e!795856 (= (seekEntryOrOpen!0 (select (arr!46401 a!2901) j!112) a!2901 mask!2840) (Found!10738 j!112)))))

(declare-fun b!1406068 () Bool)

(assert (=> b!1406068 (= e!795855 true)))

(declare-fun lt!619085 () SeekEntryResult!10738)

(assert (=> b!1406068 (= lt!619085 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46401 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46401 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96107 (store (arr!46401 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46953 a!2901)) mask!2840))))

(declare-fun b!1406069 () Bool)

(declare-fun res!944337 () Bool)

(assert (=> b!1406069 (=> (not res!944337) (not e!795854))))

(assert (=> b!1406069 (= res!944337 (validKeyInArray!0 (select (arr!46401 a!2901) j!112)))))

(declare-fun b!1406070 () Bool)

(declare-fun res!944335 () Bool)

(assert (=> b!1406070 (=> (not res!944335) (not e!795854))))

(assert (=> b!1406070 (= res!944335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120846 res!944334) b!1406063))

(assert (= (and b!1406063 res!944333) b!1406065))

(assert (= (and b!1406065 res!944336) b!1406069))

(assert (= (and b!1406069 res!944337) b!1406070))

(assert (= (and b!1406070 res!944335) b!1406064))

(assert (= (and b!1406064 res!944338) b!1406066))

(assert (= (and b!1406066 res!944331) b!1406067))

(assert (= (and b!1406066 (not res!944332)) b!1406068))

(declare-fun m!1294629 () Bool)

(assert (=> start!120846 m!1294629))

(declare-fun m!1294631 () Bool)

(assert (=> start!120846 m!1294631))

(declare-fun m!1294633 () Bool)

(assert (=> b!1406068 m!1294633))

(declare-fun m!1294635 () Bool)

(assert (=> b!1406068 m!1294635))

(assert (=> b!1406068 m!1294635))

(declare-fun m!1294637 () Bool)

(assert (=> b!1406068 m!1294637))

(assert (=> b!1406068 m!1294637))

(assert (=> b!1406068 m!1294635))

(declare-fun m!1294639 () Bool)

(assert (=> b!1406068 m!1294639))

(declare-fun m!1294641 () Bool)

(assert (=> b!1406066 m!1294641))

(declare-fun m!1294643 () Bool)

(assert (=> b!1406066 m!1294643))

(assert (=> b!1406066 m!1294641))

(declare-fun m!1294645 () Bool)

(assert (=> b!1406066 m!1294645))

(assert (=> b!1406066 m!1294643))

(assert (=> b!1406066 m!1294641))

(declare-fun m!1294647 () Bool)

(assert (=> b!1406066 m!1294647))

(declare-fun m!1294649 () Bool)

(assert (=> b!1406066 m!1294649))

(assert (=> b!1406067 m!1294641))

(assert (=> b!1406067 m!1294641))

(declare-fun m!1294651 () Bool)

(assert (=> b!1406067 m!1294651))

(assert (=> b!1406069 m!1294641))

(assert (=> b!1406069 m!1294641))

(declare-fun m!1294653 () Bool)

(assert (=> b!1406069 m!1294653))

(declare-fun m!1294655 () Bool)

(assert (=> b!1406065 m!1294655))

(assert (=> b!1406065 m!1294655))

(declare-fun m!1294657 () Bool)

(assert (=> b!1406065 m!1294657))

(declare-fun m!1294659 () Bool)

(assert (=> b!1406064 m!1294659))

(declare-fun m!1294661 () Bool)

(assert (=> b!1406070 m!1294661))

(push 1)

(assert (not b!1406064))

(assert (not b!1406069))

(assert (not b!1406066))

(assert (not b!1406070))

(assert (not b!1406067))

(assert (not start!120846))

(assert (not b!1406065))

(assert (not b!1406068))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


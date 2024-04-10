; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120790 () Bool)

(assert start!120790)

(declare-fun b!1405452 () Bool)

(declare-fun res!943669 () Bool)

(declare-fun e!795561 () Bool)

(assert (=> b!1405452 (=> (not res!943669) (not e!795561))))

(declare-datatypes ((array!96097 0))(
  ( (array!96098 (arr!46396 (Array (_ BitVec 32) (_ BitVec 64))) (size!46946 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96097)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96097 (_ BitVec 32)) Bool)

(assert (=> b!1405452 (= res!943669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405453 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun e!795563 () Bool)

(declare-datatypes ((SeekEntryResult!10707 0))(
  ( (MissingZero!10707 (index!45205 (_ BitVec 32))) (Found!10707 (index!45206 (_ BitVec 32))) (Intermediate!10707 (undefined!11519 Bool) (index!45207 (_ BitVec 32)) (x!126818 (_ BitVec 32))) (Undefined!10707) (MissingVacant!10707 (index!45208 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96097 (_ BitVec 32)) SeekEntryResult!10707)

(assert (=> b!1405453 (= e!795563 (= (seekEntryOrOpen!0 (select (arr!46396 a!2901) j!112) a!2901 mask!2840) (Found!10707 j!112)))))

(declare-fun b!1405455 () Bool)

(declare-fun res!943671 () Bool)

(assert (=> b!1405455 (=> (not res!943671) (not e!795561))))

(declare-datatypes ((List!32915 0))(
  ( (Nil!32912) (Cons!32911 (h!34165 (_ BitVec 64)) (t!47609 List!32915)) )
))
(declare-fun arrayNoDuplicates!0 (array!96097 (_ BitVec 32) List!32915) Bool)

(assert (=> b!1405455 (= res!943671 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32912))))

(declare-fun b!1405456 () Bool)

(declare-fun res!943674 () Bool)

(assert (=> b!1405456 (=> (not res!943674) (not e!795561))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405456 (= res!943674 (validKeyInArray!0 (select (arr!46396 a!2901) i!1037)))))

(declare-fun b!1405454 () Bool)

(declare-fun res!943673 () Bool)

(assert (=> b!1405454 (=> (not res!943673) (not e!795561))))

(assert (=> b!1405454 (= res!943673 (validKeyInArray!0 (select (arr!46396 a!2901) j!112)))))

(declare-fun res!943675 () Bool)

(assert (=> start!120790 (=> (not res!943675) (not e!795561))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120790 (= res!943675 (validMask!0 mask!2840))))

(assert (=> start!120790 e!795561))

(assert (=> start!120790 true))

(declare-fun array_inv!35424 (array!96097) Bool)

(assert (=> start!120790 (array_inv!35424 a!2901)))

(declare-fun b!1405457 () Bool)

(declare-fun res!943672 () Bool)

(assert (=> b!1405457 (=> (not res!943672) (not e!795561))))

(assert (=> b!1405457 (= res!943672 (and (= (size!46946 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46946 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46946 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405458 () Bool)

(assert (=> b!1405458 (= e!795561 (not true))))

(assert (=> b!1405458 e!795563))

(declare-fun res!943670 () Bool)

(assert (=> b!1405458 (=> (not res!943670) (not e!795563))))

(assert (=> b!1405458 (= res!943670 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47388 0))(
  ( (Unit!47389) )
))
(declare-fun lt!619031 () Unit!47388)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96097 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47388)

(assert (=> b!1405458 (= lt!619031 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!619032 () SeekEntryResult!10707)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96097 (_ BitVec 32)) SeekEntryResult!10707)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405458 (= lt!619032 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46396 a!2901) j!112) mask!2840) (select (arr!46396 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!120790 res!943675) b!1405457))

(assert (= (and b!1405457 res!943672) b!1405456))

(assert (= (and b!1405456 res!943674) b!1405454))

(assert (= (and b!1405454 res!943673) b!1405452))

(assert (= (and b!1405452 res!943669) b!1405455))

(assert (= (and b!1405455 res!943671) b!1405458))

(assert (= (and b!1405458 res!943670) b!1405453))

(declare-fun m!1294237 () Bool)

(assert (=> b!1405458 m!1294237))

(declare-fun m!1294239 () Bool)

(assert (=> b!1405458 m!1294239))

(assert (=> b!1405458 m!1294237))

(declare-fun m!1294241 () Bool)

(assert (=> b!1405458 m!1294241))

(assert (=> b!1405458 m!1294239))

(assert (=> b!1405458 m!1294237))

(declare-fun m!1294243 () Bool)

(assert (=> b!1405458 m!1294243))

(declare-fun m!1294245 () Bool)

(assert (=> b!1405458 m!1294245))

(assert (=> b!1405453 m!1294237))

(assert (=> b!1405453 m!1294237))

(declare-fun m!1294247 () Bool)

(assert (=> b!1405453 m!1294247))

(assert (=> b!1405454 m!1294237))

(assert (=> b!1405454 m!1294237))

(declare-fun m!1294249 () Bool)

(assert (=> b!1405454 m!1294249))

(declare-fun m!1294251 () Bool)

(assert (=> b!1405455 m!1294251))

(declare-fun m!1294253 () Bool)

(assert (=> b!1405452 m!1294253))

(declare-fun m!1294255 () Bool)

(assert (=> b!1405456 m!1294255))

(assert (=> b!1405456 m!1294255))

(declare-fun m!1294257 () Bool)

(assert (=> b!1405456 m!1294257))

(declare-fun m!1294259 () Bool)

(assert (=> start!120790 m!1294259))

(declare-fun m!1294261 () Bool)

(assert (=> start!120790 m!1294261))

(push 1)

(assert (not b!1405453))

(assert (not start!120790))

(assert (not b!1405455))

(assert (not b!1405458))

(assert (not b!1405454))

(assert (not b!1405456))

(assert (not b!1405452))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


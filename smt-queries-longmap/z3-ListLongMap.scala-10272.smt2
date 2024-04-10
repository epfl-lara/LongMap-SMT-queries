; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120794 () Bool)

(assert start!120794)

(declare-fun b!1405494 () Bool)

(declare-fun res!943714 () Bool)

(declare-fun e!795579 () Bool)

(assert (=> b!1405494 (=> (not res!943714) (not e!795579))))

(declare-datatypes ((array!96101 0))(
  ( (array!96102 (arr!46398 (Array (_ BitVec 32) (_ BitVec 64))) (size!46948 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96101)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96101 (_ BitVec 32)) Bool)

(assert (=> b!1405494 (= res!943714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405495 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun e!795581 () Bool)

(declare-datatypes ((SeekEntryResult!10709 0))(
  ( (MissingZero!10709 (index!45213 (_ BitVec 32))) (Found!10709 (index!45214 (_ BitVec 32))) (Intermediate!10709 (undefined!11521 Bool) (index!45215 (_ BitVec 32)) (x!126828 (_ BitVec 32))) (Undefined!10709) (MissingVacant!10709 (index!45216 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96101 (_ BitVec 32)) SeekEntryResult!10709)

(assert (=> b!1405495 (= e!795581 (= (seekEntryOrOpen!0 (select (arr!46398 a!2901) j!112) a!2901 mask!2840) (Found!10709 j!112)))))

(declare-fun b!1405496 () Bool)

(declare-fun res!943715 () Bool)

(assert (=> b!1405496 (=> (not res!943715) (not e!795579))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405496 (= res!943715 (validKeyInArray!0 (select (arr!46398 a!2901) i!1037)))))

(declare-fun b!1405498 () Bool)

(declare-fun res!943711 () Bool)

(assert (=> b!1405498 (=> (not res!943711) (not e!795579))))

(assert (=> b!1405498 (= res!943711 (validKeyInArray!0 (select (arr!46398 a!2901) j!112)))))

(declare-fun b!1405499 () Bool)

(declare-fun res!943713 () Bool)

(assert (=> b!1405499 (=> (not res!943713) (not e!795579))))

(declare-datatypes ((List!32917 0))(
  ( (Nil!32914) (Cons!32913 (h!34167 (_ BitVec 64)) (t!47611 List!32917)) )
))
(declare-fun arrayNoDuplicates!0 (array!96101 (_ BitVec 32) List!32917) Bool)

(assert (=> b!1405499 (= res!943713 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32914))))

(declare-fun b!1405500 () Bool)

(declare-fun res!943712 () Bool)

(assert (=> b!1405500 (=> (not res!943712) (not e!795579))))

(assert (=> b!1405500 (= res!943712 (and (= (size!46948 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46948 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46948 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405497 () Bool)

(assert (=> b!1405497 (= e!795579 (not true))))

(assert (=> b!1405497 e!795581))

(declare-fun res!943716 () Bool)

(assert (=> b!1405497 (=> (not res!943716) (not e!795581))))

(assert (=> b!1405497 (= res!943716 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47392 0))(
  ( (Unit!47393) )
))
(declare-fun lt!619044 () Unit!47392)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96101 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47392)

(assert (=> b!1405497 (= lt!619044 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!619043 () SeekEntryResult!10709)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96101 (_ BitVec 32)) SeekEntryResult!10709)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405497 (= lt!619043 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46398 a!2901) j!112) mask!2840) (select (arr!46398 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!943717 () Bool)

(assert (=> start!120794 (=> (not res!943717) (not e!795579))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120794 (= res!943717 (validMask!0 mask!2840))))

(assert (=> start!120794 e!795579))

(assert (=> start!120794 true))

(declare-fun array_inv!35426 (array!96101) Bool)

(assert (=> start!120794 (array_inv!35426 a!2901)))

(assert (= (and start!120794 res!943717) b!1405500))

(assert (= (and b!1405500 res!943712) b!1405496))

(assert (= (and b!1405496 res!943715) b!1405498))

(assert (= (and b!1405498 res!943711) b!1405494))

(assert (= (and b!1405494 res!943714) b!1405499))

(assert (= (and b!1405499 res!943713) b!1405497))

(assert (= (and b!1405497 res!943716) b!1405495))

(declare-fun m!1294289 () Bool)

(assert (=> b!1405499 m!1294289))

(declare-fun m!1294291 () Bool)

(assert (=> start!120794 m!1294291))

(declare-fun m!1294293 () Bool)

(assert (=> start!120794 m!1294293))

(declare-fun m!1294295 () Bool)

(assert (=> b!1405497 m!1294295))

(declare-fun m!1294297 () Bool)

(assert (=> b!1405497 m!1294297))

(assert (=> b!1405497 m!1294295))

(declare-fun m!1294299 () Bool)

(assert (=> b!1405497 m!1294299))

(assert (=> b!1405497 m!1294297))

(assert (=> b!1405497 m!1294295))

(declare-fun m!1294301 () Bool)

(assert (=> b!1405497 m!1294301))

(declare-fun m!1294303 () Bool)

(assert (=> b!1405497 m!1294303))

(declare-fun m!1294305 () Bool)

(assert (=> b!1405494 m!1294305))

(assert (=> b!1405495 m!1294295))

(assert (=> b!1405495 m!1294295))

(declare-fun m!1294307 () Bool)

(assert (=> b!1405495 m!1294307))

(declare-fun m!1294309 () Bool)

(assert (=> b!1405496 m!1294309))

(assert (=> b!1405496 m!1294309))

(declare-fun m!1294311 () Bool)

(assert (=> b!1405496 m!1294311))

(assert (=> b!1405498 m!1294295))

(assert (=> b!1405498 m!1294295))

(declare-fun m!1294313 () Bool)

(assert (=> b!1405498 m!1294313))

(check-sat (not start!120794) (not b!1405495) (not b!1405496) (not b!1405499) (not b!1405498) (not b!1405497) (not b!1405494))

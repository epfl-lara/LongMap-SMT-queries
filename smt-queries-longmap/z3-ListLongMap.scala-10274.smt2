; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120806 () Bool)

(assert start!120806)

(declare-fun b!1405620 () Bool)

(declare-fun e!795633 () Bool)

(assert (=> b!1405620 (= e!795633 (not true))))

(declare-fun e!795635 () Bool)

(assert (=> b!1405620 e!795635))

(declare-fun res!943838 () Bool)

(assert (=> b!1405620 (=> (not res!943838) (not e!795635))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96113 0))(
  ( (array!96114 (arr!46404 (Array (_ BitVec 32) (_ BitVec 64))) (size!46954 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96113)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96113 (_ BitVec 32)) Bool)

(assert (=> b!1405620 (= res!943838 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47404 0))(
  ( (Unit!47405) )
))
(declare-fun lt!619080 () Unit!47404)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96113 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47404)

(assert (=> b!1405620 (= lt!619080 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10715 0))(
  ( (MissingZero!10715 (index!45237 (_ BitVec 32))) (Found!10715 (index!45238 (_ BitVec 32))) (Intermediate!10715 (undefined!11527 Bool) (index!45239 (_ BitVec 32)) (x!126850 (_ BitVec 32))) (Undefined!10715) (MissingVacant!10715 (index!45240 (_ BitVec 32))) )
))
(declare-fun lt!619079 () SeekEntryResult!10715)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96113 (_ BitVec 32)) SeekEntryResult!10715)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405620 (= lt!619079 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46404 a!2901) j!112) mask!2840) (select (arr!46404 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405621 () Bool)

(declare-fun res!943839 () Bool)

(assert (=> b!1405621 (=> (not res!943839) (not e!795633))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405621 (= res!943839 (validKeyInArray!0 (select (arr!46404 a!2901) j!112)))))

(declare-fun res!943837 () Bool)

(assert (=> start!120806 (=> (not res!943837) (not e!795633))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120806 (= res!943837 (validMask!0 mask!2840))))

(assert (=> start!120806 e!795633))

(assert (=> start!120806 true))

(declare-fun array_inv!35432 (array!96113) Bool)

(assert (=> start!120806 (array_inv!35432 a!2901)))

(declare-fun b!1405622 () Bool)

(declare-fun res!943842 () Bool)

(assert (=> b!1405622 (=> (not res!943842) (not e!795633))))

(declare-datatypes ((List!32923 0))(
  ( (Nil!32920) (Cons!32919 (h!34173 (_ BitVec 64)) (t!47617 List!32923)) )
))
(declare-fun arrayNoDuplicates!0 (array!96113 (_ BitVec 32) List!32923) Bool)

(assert (=> b!1405622 (= res!943842 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32920))))

(declare-fun b!1405623 () Bool)

(declare-fun res!943840 () Bool)

(assert (=> b!1405623 (=> (not res!943840) (not e!795633))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1405623 (= res!943840 (and (= (size!46954 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46954 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46954 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405624 () Bool)

(declare-fun res!943841 () Bool)

(assert (=> b!1405624 (=> (not res!943841) (not e!795633))))

(assert (=> b!1405624 (= res!943841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405625 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96113 (_ BitVec 32)) SeekEntryResult!10715)

(assert (=> b!1405625 (= e!795635 (= (seekEntryOrOpen!0 (select (arr!46404 a!2901) j!112) a!2901 mask!2840) (Found!10715 j!112)))))

(declare-fun b!1405626 () Bool)

(declare-fun res!943843 () Bool)

(assert (=> b!1405626 (=> (not res!943843) (not e!795633))))

(assert (=> b!1405626 (= res!943843 (validKeyInArray!0 (select (arr!46404 a!2901) i!1037)))))

(assert (= (and start!120806 res!943837) b!1405623))

(assert (= (and b!1405623 res!943840) b!1405626))

(assert (= (and b!1405626 res!943843) b!1405621))

(assert (= (and b!1405621 res!943839) b!1405624))

(assert (= (and b!1405624 res!943841) b!1405622))

(assert (= (and b!1405622 res!943842) b!1405620))

(assert (= (and b!1405620 res!943838) b!1405625))

(declare-fun m!1294445 () Bool)

(assert (=> b!1405625 m!1294445))

(assert (=> b!1405625 m!1294445))

(declare-fun m!1294447 () Bool)

(assert (=> b!1405625 m!1294447))

(declare-fun m!1294449 () Bool)

(assert (=> b!1405622 m!1294449))

(declare-fun m!1294451 () Bool)

(assert (=> b!1405626 m!1294451))

(assert (=> b!1405626 m!1294451))

(declare-fun m!1294453 () Bool)

(assert (=> b!1405626 m!1294453))

(assert (=> b!1405621 m!1294445))

(assert (=> b!1405621 m!1294445))

(declare-fun m!1294455 () Bool)

(assert (=> b!1405621 m!1294455))

(declare-fun m!1294457 () Bool)

(assert (=> start!120806 m!1294457))

(declare-fun m!1294459 () Bool)

(assert (=> start!120806 m!1294459))

(declare-fun m!1294461 () Bool)

(assert (=> b!1405624 m!1294461))

(assert (=> b!1405620 m!1294445))

(declare-fun m!1294463 () Bool)

(assert (=> b!1405620 m!1294463))

(assert (=> b!1405620 m!1294445))

(declare-fun m!1294465 () Bool)

(assert (=> b!1405620 m!1294465))

(assert (=> b!1405620 m!1294463))

(assert (=> b!1405620 m!1294445))

(declare-fun m!1294467 () Bool)

(assert (=> b!1405620 m!1294467))

(declare-fun m!1294469 () Bool)

(assert (=> b!1405620 m!1294469))

(check-sat (not b!1405624) (not b!1405622) (not b!1405621) (not start!120806) (not b!1405625) (not b!1405626) (not b!1405620))

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120800 () Bool)

(assert start!120800)

(declare-fun b!1405557 () Bool)

(declare-fun res!943780 () Bool)

(declare-fun e!795608 () Bool)

(assert (=> b!1405557 (=> (not res!943780) (not e!795608))))

(declare-datatypes ((array!96107 0))(
  ( (array!96108 (arr!46401 (Array (_ BitVec 32) (_ BitVec 64))) (size!46951 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96107)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96107 (_ BitVec 32)) Bool)

(assert (=> b!1405557 (= res!943780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405558 () Bool)

(declare-fun res!943775 () Bool)

(assert (=> b!1405558 (=> (not res!943775) (not e!795608))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1405558 (= res!943775 (and (= (size!46951 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46951 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46951 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405559 () Bool)

(declare-fun res!943774 () Bool)

(assert (=> b!1405559 (=> (not res!943774) (not e!795608))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405559 (= res!943774 (validKeyInArray!0 (select (arr!46401 a!2901) i!1037)))))

(declare-fun b!1405560 () Bool)

(declare-fun res!943778 () Bool)

(assert (=> b!1405560 (=> (not res!943778) (not e!795608))))

(declare-datatypes ((List!32920 0))(
  ( (Nil!32917) (Cons!32916 (h!34170 (_ BitVec 64)) (t!47614 List!32920)) )
))
(declare-fun arrayNoDuplicates!0 (array!96107 (_ BitVec 32) List!32920) Bool)

(assert (=> b!1405560 (= res!943778 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32917))))

(declare-fun res!943776 () Bool)

(assert (=> start!120800 (=> (not res!943776) (not e!795608))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120800 (= res!943776 (validMask!0 mask!2840))))

(assert (=> start!120800 e!795608))

(assert (=> start!120800 true))

(declare-fun array_inv!35429 (array!96107) Bool)

(assert (=> start!120800 (array_inv!35429 a!2901)))

(declare-fun b!1405561 () Bool)

(declare-fun e!795607 () Bool)

(declare-datatypes ((SeekEntryResult!10712 0))(
  ( (MissingZero!10712 (index!45225 (_ BitVec 32))) (Found!10712 (index!45226 (_ BitVec 32))) (Intermediate!10712 (undefined!11524 Bool) (index!45227 (_ BitVec 32)) (x!126839 (_ BitVec 32))) (Undefined!10712) (MissingVacant!10712 (index!45228 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96107 (_ BitVec 32)) SeekEntryResult!10712)

(assert (=> b!1405561 (= e!795607 (= (seekEntryOrOpen!0 (select (arr!46401 a!2901) j!112) a!2901 mask!2840) (Found!10712 j!112)))))

(declare-fun b!1405562 () Bool)

(assert (=> b!1405562 (= e!795608 (not true))))

(assert (=> b!1405562 e!795607))

(declare-fun res!943779 () Bool)

(assert (=> b!1405562 (=> (not res!943779) (not e!795607))))

(assert (=> b!1405562 (= res!943779 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47398 0))(
  ( (Unit!47399) )
))
(declare-fun lt!619061 () Unit!47398)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96107 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47398)

(assert (=> b!1405562 (= lt!619061 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!619062 () SeekEntryResult!10712)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96107 (_ BitVec 32)) SeekEntryResult!10712)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405562 (= lt!619062 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46401 a!2901) j!112) mask!2840) (select (arr!46401 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405563 () Bool)

(declare-fun res!943777 () Bool)

(assert (=> b!1405563 (=> (not res!943777) (not e!795608))))

(assert (=> b!1405563 (= res!943777 (validKeyInArray!0 (select (arr!46401 a!2901) j!112)))))

(assert (= (and start!120800 res!943776) b!1405558))

(assert (= (and b!1405558 res!943775) b!1405559))

(assert (= (and b!1405559 res!943774) b!1405563))

(assert (= (and b!1405563 res!943777) b!1405557))

(assert (= (and b!1405557 res!943780) b!1405560))

(assert (= (and b!1405560 res!943778) b!1405562))

(assert (= (and b!1405562 res!943779) b!1405561))

(declare-fun m!1294367 () Bool)

(assert (=> b!1405563 m!1294367))

(assert (=> b!1405563 m!1294367))

(declare-fun m!1294369 () Bool)

(assert (=> b!1405563 m!1294369))

(declare-fun m!1294371 () Bool)

(assert (=> start!120800 m!1294371))

(declare-fun m!1294373 () Bool)

(assert (=> start!120800 m!1294373))

(assert (=> b!1405561 m!1294367))

(assert (=> b!1405561 m!1294367))

(declare-fun m!1294375 () Bool)

(assert (=> b!1405561 m!1294375))

(assert (=> b!1405562 m!1294367))

(declare-fun m!1294377 () Bool)

(assert (=> b!1405562 m!1294377))

(assert (=> b!1405562 m!1294367))

(declare-fun m!1294379 () Bool)

(assert (=> b!1405562 m!1294379))

(assert (=> b!1405562 m!1294377))

(assert (=> b!1405562 m!1294367))

(declare-fun m!1294381 () Bool)

(assert (=> b!1405562 m!1294381))

(declare-fun m!1294383 () Bool)

(assert (=> b!1405562 m!1294383))

(declare-fun m!1294385 () Bool)

(assert (=> b!1405560 m!1294385))

(declare-fun m!1294387 () Bool)

(assert (=> b!1405559 m!1294387))

(assert (=> b!1405559 m!1294387))

(declare-fun m!1294389 () Bool)

(assert (=> b!1405559 m!1294389))

(declare-fun m!1294391 () Bool)

(assert (=> b!1405557 m!1294391))

(check-sat (not b!1405563) (not b!1405559) (not b!1405560) (not start!120800) (not b!1405561) (not b!1405562) (not b!1405557))

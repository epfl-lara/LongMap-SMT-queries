; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122196 () Bool)

(assert start!122196)

(declare-fun b!1417533 () Bool)

(declare-fun res!953317 () Bool)

(declare-fun e!802247 () Bool)

(assert (=> b!1417533 (=> (not res!953317) (not e!802247))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96733 0))(
  ( (array!96734 (arr!46695 (Array (_ BitVec 32) (_ BitVec 64))) (size!47247 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96733)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1417533 (= res!953317 (and (= (size!47247 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47247 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47247 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1417534 () Bool)

(declare-fun res!953320 () Bool)

(assert (=> b!1417534 (=> (not res!953320) (not e!802247))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96733 (_ BitVec 32)) Bool)

(assert (=> b!1417534 (= res!953320 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!953316 () Bool)

(assert (=> start!122196 (=> (not res!953316) (not e!802247))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122196 (= res!953316 (validMask!0 mask!2840))))

(assert (=> start!122196 e!802247))

(assert (=> start!122196 true))

(declare-fun array_inv!35928 (array!96733) Bool)

(assert (=> start!122196 (array_inv!35928 a!2901)))

(declare-fun b!1417535 () Bool)

(assert (=> b!1417535 (= e!802247 (not true))))

(declare-fun e!802245 () Bool)

(assert (=> b!1417535 e!802245))

(declare-fun res!953319 () Bool)

(assert (=> b!1417535 (=> (not res!953319) (not e!802245))))

(assert (=> b!1417535 (= res!953319 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47881 0))(
  ( (Unit!47882) )
))
(declare-fun lt!625232 () Unit!47881)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96733 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47881)

(assert (=> b!1417535 (= lt!625232 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!11032 0))(
  ( (MissingZero!11032 (index!46520 (_ BitVec 32))) (Found!11032 (index!46521 (_ BitVec 32))) (Intermediate!11032 (undefined!11844 Bool) (index!46522 (_ BitVec 32)) (x!128112 (_ BitVec 32))) (Undefined!11032) (MissingVacant!11032 (index!46523 (_ BitVec 32))) )
))
(declare-fun lt!625231 () SeekEntryResult!11032)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96733 (_ BitVec 32)) SeekEntryResult!11032)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1417535 (= lt!625231 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46695 a!2901) j!112) mask!2840) (select (arr!46695 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1417536 () Bool)

(declare-fun res!953318 () Bool)

(assert (=> b!1417536 (=> (not res!953318) (not e!802247))))

(declare-datatypes ((List!33292 0))(
  ( (Nil!33289) (Cons!33288 (h!34581 (_ BitVec 64)) (t!47978 List!33292)) )
))
(declare-fun arrayNoDuplicates!0 (array!96733 (_ BitVec 32) List!33292) Bool)

(assert (=> b!1417536 (= res!953318 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33289))))

(declare-fun b!1417537 () Bool)

(declare-fun res!953315 () Bool)

(assert (=> b!1417537 (=> (not res!953315) (not e!802247))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417537 (= res!953315 (validKeyInArray!0 (select (arr!46695 a!2901) j!112)))))

(declare-fun b!1417538 () Bool)

(declare-fun res!953314 () Bool)

(assert (=> b!1417538 (=> (not res!953314) (not e!802247))))

(assert (=> b!1417538 (= res!953314 (validKeyInArray!0 (select (arr!46695 a!2901) i!1037)))))

(declare-fun b!1417539 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96733 (_ BitVec 32)) SeekEntryResult!11032)

(assert (=> b!1417539 (= e!802245 (= (seekEntryOrOpen!0 (select (arr!46695 a!2901) j!112) a!2901 mask!2840) (Found!11032 j!112)))))

(assert (= (and start!122196 res!953316) b!1417533))

(assert (= (and b!1417533 res!953317) b!1417538))

(assert (= (and b!1417538 res!953314) b!1417537))

(assert (= (and b!1417537 res!953315) b!1417534))

(assert (= (and b!1417534 res!953320) b!1417536))

(assert (= (and b!1417536 res!953318) b!1417535))

(assert (= (and b!1417535 res!953319) b!1417539))

(declare-fun m!1307837 () Bool)

(assert (=> b!1417535 m!1307837))

(declare-fun m!1307839 () Bool)

(assert (=> b!1417535 m!1307839))

(assert (=> b!1417535 m!1307837))

(declare-fun m!1307841 () Bool)

(assert (=> b!1417535 m!1307841))

(assert (=> b!1417535 m!1307839))

(assert (=> b!1417535 m!1307837))

(declare-fun m!1307843 () Bool)

(assert (=> b!1417535 m!1307843))

(declare-fun m!1307845 () Bool)

(assert (=> b!1417535 m!1307845))

(declare-fun m!1307847 () Bool)

(assert (=> b!1417536 m!1307847))

(assert (=> b!1417539 m!1307837))

(assert (=> b!1417539 m!1307837))

(declare-fun m!1307849 () Bool)

(assert (=> b!1417539 m!1307849))

(declare-fun m!1307851 () Bool)

(assert (=> b!1417538 m!1307851))

(assert (=> b!1417538 m!1307851))

(declare-fun m!1307853 () Bool)

(assert (=> b!1417538 m!1307853))

(declare-fun m!1307855 () Bool)

(assert (=> start!122196 m!1307855))

(declare-fun m!1307857 () Bool)

(assert (=> start!122196 m!1307857))

(declare-fun m!1307859 () Bool)

(assert (=> b!1417534 m!1307859))

(assert (=> b!1417537 m!1307837))

(assert (=> b!1417537 m!1307837))

(declare-fun m!1307861 () Bool)

(assert (=> b!1417537 m!1307861))

(push 1)

(assert (not b!1417539))

(assert (not b!1417538))

(assert (not start!122196))

(assert (not b!1417536))

(assert (not b!1417535))

(assert (not b!1417534))

(assert (not b!1417537))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


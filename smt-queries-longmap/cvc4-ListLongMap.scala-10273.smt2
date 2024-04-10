; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120802 () Bool)

(assert start!120802)

(declare-fun res!943799 () Bool)

(declare-fun e!795615 () Bool)

(assert (=> start!120802 (=> (not res!943799) (not e!795615))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120802 (= res!943799 (validMask!0 mask!2840))))

(assert (=> start!120802 e!795615))

(assert (=> start!120802 true))

(declare-datatypes ((array!96109 0))(
  ( (array!96110 (arr!46402 (Array (_ BitVec 32) (_ BitVec 64))) (size!46952 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96109)

(declare-fun array_inv!35430 (array!96109) Bool)

(assert (=> start!120802 (array_inv!35430 a!2901)))

(declare-fun b!1405578 () Bool)

(assert (=> b!1405578 (= e!795615 (not true))))

(declare-fun e!795617 () Bool)

(assert (=> b!1405578 e!795617))

(declare-fun res!943798 () Bool)

(assert (=> b!1405578 (=> (not res!943798) (not e!795617))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96109 (_ BitVec 32)) Bool)

(assert (=> b!1405578 (= res!943798 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47400 0))(
  ( (Unit!47401) )
))
(declare-fun lt!619067 () Unit!47400)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96109 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47400)

(assert (=> b!1405578 (= lt!619067 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10713 0))(
  ( (MissingZero!10713 (index!45229 (_ BitVec 32))) (Found!10713 (index!45230 (_ BitVec 32))) (Intermediate!10713 (undefined!11525 Bool) (index!45231 (_ BitVec 32)) (x!126840 (_ BitVec 32))) (Undefined!10713) (MissingVacant!10713 (index!45232 (_ BitVec 32))) )
))
(declare-fun lt!619068 () SeekEntryResult!10713)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96109 (_ BitVec 32)) SeekEntryResult!10713)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405578 (= lt!619068 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46402 a!2901) j!112) mask!2840) (select (arr!46402 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405579 () Bool)

(declare-fun res!943795 () Bool)

(assert (=> b!1405579 (=> (not res!943795) (not e!795615))))

(declare-datatypes ((List!32921 0))(
  ( (Nil!32918) (Cons!32917 (h!34171 (_ BitVec 64)) (t!47615 List!32921)) )
))
(declare-fun arrayNoDuplicates!0 (array!96109 (_ BitVec 32) List!32921) Bool)

(assert (=> b!1405579 (= res!943795 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32918))))

(declare-fun b!1405580 () Bool)

(declare-fun res!943801 () Bool)

(assert (=> b!1405580 (=> (not res!943801) (not e!795615))))

(assert (=> b!1405580 (= res!943801 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405581 () Bool)

(declare-fun res!943800 () Bool)

(assert (=> b!1405581 (=> (not res!943800) (not e!795615))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1405581 (= res!943800 (and (= (size!46952 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46952 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46952 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405582 () Bool)

(declare-fun res!943797 () Bool)

(assert (=> b!1405582 (=> (not res!943797) (not e!795615))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405582 (= res!943797 (validKeyInArray!0 (select (arr!46402 a!2901) j!112)))))

(declare-fun b!1405583 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96109 (_ BitVec 32)) SeekEntryResult!10713)

(assert (=> b!1405583 (= e!795617 (= (seekEntryOrOpen!0 (select (arr!46402 a!2901) j!112) a!2901 mask!2840) (Found!10713 j!112)))))

(declare-fun b!1405584 () Bool)

(declare-fun res!943796 () Bool)

(assert (=> b!1405584 (=> (not res!943796) (not e!795615))))

(assert (=> b!1405584 (= res!943796 (validKeyInArray!0 (select (arr!46402 a!2901) i!1037)))))

(assert (= (and start!120802 res!943799) b!1405581))

(assert (= (and b!1405581 res!943800) b!1405584))

(assert (= (and b!1405584 res!943796) b!1405582))

(assert (= (and b!1405582 res!943797) b!1405580))

(assert (= (and b!1405580 res!943801) b!1405579))

(assert (= (and b!1405579 res!943795) b!1405578))

(assert (= (and b!1405578 res!943798) b!1405583))

(declare-fun m!1294393 () Bool)

(assert (=> b!1405584 m!1294393))

(assert (=> b!1405584 m!1294393))

(declare-fun m!1294395 () Bool)

(assert (=> b!1405584 m!1294395))

(declare-fun m!1294397 () Bool)

(assert (=> b!1405582 m!1294397))

(assert (=> b!1405582 m!1294397))

(declare-fun m!1294399 () Bool)

(assert (=> b!1405582 m!1294399))

(assert (=> b!1405583 m!1294397))

(assert (=> b!1405583 m!1294397))

(declare-fun m!1294401 () Bool)

(assert (=> b!1405583 m!1294401))

(assert (=> b!1405578 m!1294397))

(declare-fun m!1294403 () Bool)

(assert (=> b!1405578 m!1294403))

(assert (=> b!1405578 m!1294397))

(declare-fun m!1294405 () Bool)

(assert (=> b!1405578 m!1294405))

(assert (=> b!1405578 m!1294403))

(assert (=> b!1405578 m!1294397))

(declare-fun m!1294407 () Bool)

(assert (=> b!1405578 m!1294407))

(declare-fun m!1294409 () Bool)

(assert (=> b!1405578 m!1294409))

(declare-fun m!1294411 () Bool)

(assert (=> start!120802 m!1294411))

(declare-fun m!1294413 () Bool)

(assert (=> start!120802 m!1294413))

(declare-fun m!1294415 () Bool)

(assert (=> b!1405580 m!1294415))

(declare-fun m!1294417 () Bool)

(assert (=> b!1405579 m!1294417))

(push 1)

(assert (not b!1405579))

(assert (not b!1405578))

(assert (not b!1405580))

(assert (not b!1405582))

(assert (not start!120802))

(assert (not b!1405584))

(assert (not b!1405583))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


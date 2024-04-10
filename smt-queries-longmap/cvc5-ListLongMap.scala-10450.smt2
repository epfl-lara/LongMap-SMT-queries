; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122862 () Bool)

(assert start!122862)

(declare-fun b!1425048 () Bool)

(declare-fun res!960487 () Bool)

(declare-fun e!805258 () Bool)

(assert (=> b!1425048 (=> (not res!960487) (not e!805258))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97227 0))(
  ( (array!97228 (arr!46931 (Array (_ BitVec 32) (_ BitVec 64))) (size!47481 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97227)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1425048 (= res!960487 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47481 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47481 a!2831))))))

(declare-fun b!1425049 () Bool)

(declare-fun res!960486 () Bool)

(assert (=> b!1425049 (=> (not res!960486) (not e!805258))))

(declare-datatypes ((List!33441 0))(
  ( (Nil!33438) (Cons!33437 (h!34739 (_ BitVec 64)) (t!48135 List!33441)) )
))
(declare-fun arrayNoDuplicates!0 (array!97227 (_ BitVec 32) List!33441) Bool)

(assert (=> b!1425049 (= res!960486 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33438))))

(declare-fun b!1425050 () Bool)

(declare-fun res!960483 () Bool)

(assert (=> b!1425050 (=> (not res!960483) (not e!805258))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97227 (_ BitVec 32)) Bool)

(assert (=> b!1425050 (= res!960483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425051 () Bool)

(declare-fun res!960481 () Bool)

(assert (=> b!1425051 (=> (not res!960481) (not e!805258))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425051 (= res!960481 (validKeyInArray!0 (select (arr!46931 a!2831) i!982)))))

(declare-fun res!960485 () Bool)

(assert (=> start!122862 (=> (not res!960485) (not e!805258))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122862 (= res!960485 (validMask!0 mask!2608))))

(assert (=> start!122862 e!805258))

(assert (=> start!122862 true))

(declare-fun array_inv!35959 (array!97227) Bool)

(assert (=> start!122862 (array_inv!35959 a!2831)))

(declare-fun b!1425052 () Bool)

(declare-fun res!960482 () Bool)

(assert (=> b!1425052 (=> (not res!960482) (not e!805258))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1425052 (= res!960482 (validKeyInArray!0 (select (arr!46931 a!2831) j!81)))))

(declare-fun b!1425053 () Bool)

(assert (=> b!1425053 (= e!805258 false)))

(declare-datatypes ((SeekEntryResult!11210 0))(
  ( (MissingZero!11210 (index!47232 (_ BitVec 32))) (Found!11210 (index!47233 (_ BitVec 32))) (Intermediate!11210 (undefined!12022 Bool) (index!47234 (_ BitVec 32)) (x!128876 (_ BitVec 32))) (Undefined!11210) (MissingVacant!11210 (index!47235 (_ BitVec 32))) )
))
(declare-fun lt!627765 () SeekEntryResult!11210)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97227 (_ BitVec 32)) SeekEntryResult!11210)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425053 (= lt!627765 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46931 a!2831) j!81) mask!2608) (select (arr!46931 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1425054 () Bool)

(declare-fun res!960484 () Bool)

(assert (=> b!1425054 (=> (not res!960484) (not e!805258))))

(assert (=> b!1425054 (= res!960484 (and (= (size!47481 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47481 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47481 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!122862 res!960485) b!1425054))

(assert (= (and b!1425054 res!960484) b!1425051))

(assert (= (and b!1425051 res!960481) b!1425052))

(assert (= (and b!1425052 res!960482) b!1425050))

(assert (= (and b!1425050 res!960483) b!1425049))

(assert (= (and b!1425049 res!960486) b!1425048))

(assert (= (and b!1425048 res!960487) b!1425053))

(declare-fun m!1315605 () Bool)

(assert (=> b!1425049 m!1315605))

(declare-fun m!1315607 () Bool)

(assert (=> b!1425050 m!1315607))

(declare-fun m!1315609 () Bool)

(assert (=> b!1425052 m!1315609))

(assert (=> b!1425052 m!1315609))

(declare-fun m!1315611 () Bool)

(assert (=> b!1425052 m!1315611))

(assert (=> b!1425053 m!1315609))

(assert (=> b!1425053 m!1315609))

(declare-fun m!1315613 () Bool)

(assert (=> b!1425053 m!1315613))

(assert (=> b!1425053 m!1315613))

(assert (=> b!1425053 m!1315609))

(declare-fun m!1315615 () Bool)

(assert (=> b!1425053 m!1315615))

(declare-fun m!1315617 () Bool)

(assert (=> b!1425051 m!1315617))

(assert (=> b!1425051 m!1315617))

(declare-fun m!1315619 () Bool)

(assert (=> b!1425051 m!1315619))

(declare-fun m!1315621 () Bool)

(assert (=> start!122862 m!1315621))

(declare-fun m!1315623 () Bool)

(assert (=> start!122862 m!1315623))

(push 1)

(assert (not start!122862))

(assert (not b!1425049))

(assert (not b!1425052))

(assert (not b!1425051))

(assert (not b!1425053))

(assert (not b!1425050))

(check-sat)

(pop 1)


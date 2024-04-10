; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122602 () Bool)

(assert start!122602)

(declare-fun b!1420031 () Bool)

(declare-fun res!955469 () Bool)

(declare-fun e!803282 () Bool)

(assert (=> b!1420031 (=> (not res!955469) (not e!803282))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(declare-datatypes ((array!96967 0))(
  ( (array!96968 (arr!46801 (Array (_ BitVec 32) (_ BitVec 64))) (size!47351 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96967)

(assert (=> b!1420031 (= res!955469 (and (= (size!47351 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47351 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47351 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420032 () Bool)

(declare-fun res!955464 () Bool)

(assert (=> b!1420032 (=> (not res!955464) (not e!803282))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420032 (= res!955464 (validKeyInArray!0 (select (arr!46801 a!2831) j!81)))))

(declare-fun b!1420033 () Bool)

(declare-fun res!955468 () Bool)

(assert (=> b!1420033 (=> (not res!955468) (not e!803282))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1420033 (= res!955468 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47351 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47351 a!2831))))))

(declare-fun b!1420034 () Bool)

(declare-fun res!955471 () Bool)

(assert (=> b!1420034 (=> (not res!955471) (not e!803282))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96967 (_ BitVec 32)) Bool)

(assert (=> b!1420034 (= res!955471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1420035 () Bool)

(declare-fun res!955466 () Bool)

(assert (=> b!1420035 (=> (not res!955466) (not e!803282))))

(declare-datatypes ((SeekEntryResult!11086 0))(
  ( (MissingZero!11086 (index!46736 (_ BitVec 32))) (Found!11086 (index!46737 (_ BitVec 32))) (Intermediate!11086 (undefined!11898 Bool) (index!46738 (_ BitVec 32)) (x!128400 (_ BitVec 32))) (Undefined!11086) (MissingVacant!11086 (index!46739 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96967 (_ BitVec 32)) SeekEntryResult!11086)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420035 (= res!955466 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46801 a!2831) j!81) mask!2608) (select (arr!46801 a!2831) j!81) a!2831 mask!2608) (Intermediate!11086 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1420036 () Bool)

(assert (=> b!1420036 (= e!803282 false)))

(declare-fun lt!625872 () SeekEntryResult!11086)

(assert (=> b!1420036 (= lt!625872 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46801 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46801 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!96968 (store (arr!46801 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47351 a!2831)) mask!2608))))

(declare-fun b!1420037 () Bool)

(declare-fun res!955467 () Bool)

(assert (=> b!1420037 (=> (not res!955467) (not e!803282))))

(declare-datatypes ((List!33311 0))(
  ( (Nil!33308) (Cons!33307 (h!34609 (_ BitVec 64)) (t!48005 List!33311)) )
))
(declare-fun arrayNoDuplicates!0 (array!96967 (_ BitVec 32) List!33311) Bool)

(assert (=> b!1420037 (= res!955467 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33308))))

(declare-fun b!1420038 () Bool)

(declare-fun res!955470 () Bool)

(assert (=> b!1420038 (=> (not res!955470) (not e!803282))))

(assert (=> b!1420038 (= res!955470 (validKeyInArray!0 (select (arr!46801 a!2831) i!982)))))

(declare-fun res!955465 () Bool)

(assert (=> start!122602 (=> (not res!955465) (not e!803282))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122602 (= res!955465 (validMask!0 mask!2608))))

(assert (=> start!122602 e!803282))

(assert (=> start!122602 true))

(declare-fun array_inv!35829 (array!96967) Bool)

(assert (=> start!122602 (array_inv!35829 a!2831)))

(assert (= (and start!122602 res!955465) b!1420031))

(assert (= (and b!1420031 res!955469) b!1420038))

(assert (= (and b!1420038 res!955470) b!1420032))

(assert (= (and b!1420032 res!955464) b!1420034))

(assert (= (and b!1420034 res!955471) b!1420037))

(assert (= (and b!1420037 res!955467) b!1420033))

(assert (= (and b!1420033 res!955468) b!1420035))

(assert (= (and b!1420035 res!955466) b!1420036))

(declare-fun m!1310513 () Bool)

(assert (=> b!1420037 m!1310513))

(declare-fun m!1310515 () Bool)

(assert (=> b!1420032 m!1310515))

(assert (=> b!1420032 m!1310515))

(declare-fun m!1310517 () Bool)

(assert (=> b!1420032 m!1310517))

(assert (=> b!1420035 m!1310515))

(assert (=> b!1420035 m!1310515))

(declare-fun m!1310519 () Bool)

(assert (=> b!1420035 m!1310519))

(assert (=> b!1420035 m!1310519))

(assert (=> b!1420035 m!1310515))

(declare-fun m!1310521 () Bool)

(assert (=> b!1420035 m!1310521))

(declare-fun m!1310523 () Bool)

(assert (=> b!1420034 m!1310523))

(declare-fun m!1310525 () Bool)

(assert (=> start!122602 m!1310525))

(declare-fun m!1310527 () Bool)

(assert (=> start!122602 m!1310527))

(declare-fun m!1310529 () Bool)

(assert (=> b!1420038 m!1310529))

(assert (=> b!1420038 m!1310529))

(declare-fun m!1310531 () Bool)

(assert (=> b!1420038 m!1310531))

(declare-fun m!1310533 () Bool)

(assert (=> b!1420036 m!1310533))

(declare-fun m!1310535 () Bool)

(assert (=> b!1420036 m!1310535))

(assert (=> b!1420036 m!1310535))

(declare-fun m!1310537 () Bool)

(assert (=> b!1420036 m!1310537))

(assert (=> b!1420036 m!1310537))

(assert (=> b!1420036 m!1310535))

(declare-fun m!1310539 () Bool)

(assert (=> b!1420036 m!1310539))

(push 1)

(assert (not b!1420035))

(assert (not b!1420036))

(assert (not b!1420038))

(assert (not start!122602))

(assert (not b!1420037))

(assert (not b!1420034))

(assert (not b!1420032))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


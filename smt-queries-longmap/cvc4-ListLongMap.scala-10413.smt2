; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122644 () Bool)

(assert start!122644)

(declare-fun b!1420622 () Bool)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97009 0))(
  ( (array!97010 (arr!46822 (Array (_ BitVec 32) (_ BitVec 64))) (size!47372 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97009)

(declare-fun e!803433 () Bool)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420622 (= e!803433 (not (validKeyInArray!0 (select (store (arr!46822 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))))

(declare-fun b!1420623 () Bool)

(declare-fun res!956063 () Bool)

(declare-fun e!803434 () Bool)

(assert (=> b!1420623 (=> (not res!956063) (not e!803434))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97009 (_ BitVec 32)) Bool)

(assert (=> b!1420623 (= res!956063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1420624 () Bool)

(declare-fun res!956055 () Bool)

(assert (=> b!1420624 (=> (not res!956055) (not e!803433))))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11107 0))(
  ( (MissingZero!11107 (index!46820 (_ BitVec 32))) (Found!11107 (index!46821 (_ BitVec 32))) (Intermediate!11107 (undefined!11919 Bool) (index!46822 (_ BitVec 32)) (x!128477 (_ BitVec 32))) (Undefined!11107) (MissingVacant!11107 (index!46823 (_ BitVec 32))) )
))
(declare-fun lt!625935 () SeekEntryResult!11107)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97009 (_ BitVec 32)) SeekEntryResult!11107)

(assert (=> b!1420624 (= res!956055 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46822 a!2831) j!81) a!2831 mask!2608) lt!625935))))

(declare-fun b!1420625 () Bool)

(declare-fun res!956060 () Bool)

(assert (=> b!1420625 (=> (not res!956060) (not e!803434))))

(declare-datatypes ((List!33332 0))(
  ( (Nil!33329) (Cons!33328 (h!34630 (_ BitVec 64)) (t!48026 List!33332)) )
))
(declare-fun arrayNoDuplicates!0 (array!97009 (_ BitVec 32) List!33332) Bool)

(assert (=> b!1420625 (= res!956060 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33329))))

(declare-fun b!1420626 () Bool)

(declare-fun res!956062 () Bool)

(assert (=> b!1420626 (=> (not res!956062) (not e!803434))))

(assert (=> b!1420626 (= res!956062 (validKeyInArray!0 (select (arr!46822 a!2831) i!982)))))

(declare-fun b!1420627 () Bool)

(declare-fun res!956059 () Bool)

(assert (=> b!1420627 (=> (not res!956059) (not e!803433))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420627 (= res!956059 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46822 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46822 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!97010 (store (arr!46822 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47372 a!2831)) mask!2608) (Intermediate!11107 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1420628 () Bool)

(declare-fun res!956064 () Bool)

(assert (=> b!1420628 (=> (not res!956064) (not e!803433))))

(assert (=> b!1420628 (= res!956064 (and (bvsge mask!2608 #b00000000000000000000000000000000) (bvslt index!585 (bvadd #b00000000000000000000000000000001 mask!2608))))))

(declare-fun res!956056 () Bool)

(assert (=> start!122644 (=> (not res!956056) (not e!803434))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122644 (= res!956056 (validMask!0 mask!2608))))

(assert (=> start!122644 e!803434))

(assert (=> start!122644 true))

(declare-fun array_inv!35850 (array!97009) Bool)

(assert (=> start!122644 (array_inv!35850 a!2831)))

(declare-fun b!1420629 () Bool)

(declare-fun res!956057 () Bool)

(assert (=> b!1420629 (=> (not res!956057) (not e!803434))))

(assert (=> b!1420629 (= res!956057 (validKeyInArray!0 (select (arr!46822 a!2831) j!81)))))

(declare-fun b!1420630 () Bool)

(declare-fun res!956058 () Bool)

(assert (=> b!1420630 (=> (not res!956058) (not e!803434))))

(assert (=> b!1420630 (= res!956058 (and (= (size!47372 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47372 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47372 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420631 () Bool)

(declare-fun res!956065 () Bool)

(assert (=> b!1420631 (=> (not res!956065) (not e!803434))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1420631 (= res!956065 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47372 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47372 a!2831))))))

(declare-fun b!1420632 () Bool)

(assert (=> b!1420632 (= e!803434 e!803433)))

(declare-fun res!956061 () Bool)

(assert (=> b!1420632 (=> (not res!956061) (not e!803433))))

(assert (=> b!1420632 (= res!956061 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46822 a!2831) j!81) mask!2608) (select (arr!46822 a!2831) j!81) a!2831 mask!2608) lt!625935))))

(assert (=> b!1420632 (= lt!625935 (Intermediate!11107 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(assert (= (and start!122644 res!956056) b!1420630))

(assert (= (and b!1420630 res!956058) b!1420626))

(assert (= (and b!1420626 res!956062) b!1420629))

(assert (= (and b!1420629 res!956057) b!1420623))

(assert (= (and b!1420623 res!956063) b!1420625))

(assert (= (and b!1420625 res!956060) b!1420631))

(assert (= (and b!1420631 res!956065) b!1420632))

(assert (= (and b!1420632 res!956061) b!1420627))

(assert (= (and b!1420627 res!956059) b!1420624))

(assert (= (and b!1420624 res!956055) b!1420628))

(assert (= (and b!1420628 res!956064) b!1420622))

(declare-fun m!1311139 () Bool)

(assert (=> b!1420624 m!1311139))

(assert (=> b!1420624 m!1311139))

(declare-fun m!1311141 () Bool)

(assert (=> b!1420624 m!1311141))

(assert (=> b!1420632 m!1311139))

(assert (=> b!1420632 m!1311139))

(declare-fun m!1311143 () Bool)

(assert (=> b!1420632 m!1311143))

(assert (=> b!1420632 m!1311143))

(assert (=> b!1420632 m!1311139))

(declare-fun m!1311145 () Bool)

(assert (=> b!1420632 m!1311145))

(declare-fun m!1311147 () Bool)

(assert (=> b!1420626 m!1311147))

(assert (=> b!1420626 m!1311147))

(declare-fun m!1311149 () Bool)

(assert (=> b!1420626 m!1311149))

(declare-fun m!1311151 () Bool)

(assert (=> b!1420623 m!1311151))

(declare-fun m!1311153 () Bool)

(assert (=> b!1420627 m!1311153))

(declare-fun m!1311155 () Bool)

(assert (=> b!1420627 m!1311155))

(assert (=> b!1420627 m!1311155))

(declare-fun m!1311157 () Bool)

(assert (=> b!1420627 m!1311157))

(assert (=> b!1420627 m!1311157))

(assert (=> b!1420627 m!1311155))

(declare-fun m!1311159 () Bool)

(assert (=> b!1420627 m!1311159))

(assert (=> b!1420622 m!1311153))

(assert (=> b!1420622 m!1311155))

(assert (=> b!1420622 m!1311155))

(declare-fun m!1311161 () Bool)

(assert (=> b!1420622 m!1311161))

(declare-fun m!1311163 () Bool)

(assert (=> b!1420625 m!1311163))

(assert (=> b!1420629 m!1311139))

(assert (=> b!1420629 m!1311139))

(declare-fun m!1311165 () Bool)

(assert (=> b!1420629 m!1311165))

(declare-fun m!1311167 () Bool)

(assert (=> start!122644 m!1311167))

(declare-fun m!1311169 () Bool)

(assert (=> start!122644 m!1311169))

(push 1)

(assert (not b!1420627))

(assert (not start!122644))

(assert (not b!1420626))

(assert (not b!1420632))

(assert (not b!1420624))

(assert (not b!1420625))

(assert (not b!1420622))

(assert (not b!1420623))

(assert (not b!1420629))

(check-sat)


; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122948 () Bool)

(assert start!122948)

(declare-fun b!1426237 () Bool)

(declare-fun res!961678 () Bool)

(declare-fun e!805636 () Bool)

(assert (=> b!1426237 (=> (not res!961678) (not e!805636))))

(declare-datatypes ((array!97313 0))(
  ( (array!97314 (arr!46974 (Array (_ BitVec 32) (_ BitVec 64))) (size!47524 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97313)

(declare-datatypes ((List!33484 0))(
  ( (Nil!33481) (Cons!33480 (h!34782 (_ BitVec 64)) (t!48178 List!33484)) )
))
(declare-fun arrayNoDuplicates!0 (array!97313 (_ BitVec 32) List!33484) Bool)

(assert (=> b!1426237 (= res!961678 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33481))))

(declare-fun b!1426238 () Bool)

(declare-fun e!805637 () Bool)

(assert (=> b!1426238 (= e!805636 e!805637)))

(declare-fun res!961671 () Bool)

(assert (=> b!1426238 (=> (not res!961671) (not e!805637))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11253 0))(
  ( (MissingZero!11253 (index!47404 (_ BitVec 32))) (Found!11253 (index!47405 (_ BitVec 32))) (Intermediate!11253 (undefined!12065 Bool) (index!47406 (_ BitVec 32)) (x!129031 (_ BitVec 32))) (Undefined!11253) (MissingVacant!11253 (index!47407 (_ BitVec 32))) )
))
(declare-fun lt!628077 () SeekEntryResult!11253)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97313 (_ BitVec 32)) SeekEntryResult!11253)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1426238 (= res!961671 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46974 a!2831) j!81) mask!2608) (select (arr!46974 a!2831) j!81) a!2831 mask!2608) lt!628077))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1426238 (= lt!628077 (Intermediate!11253 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1426239 () Bool)

(declare-fun res!961672 () Bool)

(declare-fun e!805635 () Bool)

(assert (=> b!1426239 (=> (not res!961672) (not e!805635))))

(declare-fun lt!628079 () array!97313)

(declare-fun lt!628076 () SeekEntryResult!11253)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun lt!628078 () (_ BitVec 64))

(assert (=> b!1426239 (= res!961672 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628078 lt!628079 mask!2608) lt!628076))))

(declare-fun b!1426240 () Bool)

(declare-fun res!961673 () Bool)

(assert (=> b!1426240 (=> (not res!961673) (not e!805636))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1426240 (= res!961673 (validKeyInArray!0 (select (arr!46974 a!2831) i!982)))))

(declare-fun b!1426242 () Bool)

(declare-fun res!961681 () Bool)

(assert (=> b!1426242 (=> (not res!961681) (not e!805636))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97313 (_ BitVec 32)) Bool)

(assert (=> b!1426242 (= res!961681 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1426243 () Bool)

(assert (=> b!1426243 (= e!805637 e!805635)))

(declare-fun res!961679 () Bool)

(assert (=> b!1426243 (=> (not res!961679) (not e!805635))))

(assert (=> b!1426243 (= res!961679 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628078 mask!2608) lt!628078 lt!628079 mask!2608) lt!628076))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1426243 (= lt!628076 (Intermediate!11253 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1426243 (= lt!628078 (select (store (arr!46974 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1426243 (= lt!628079 (array!97314 (store (arr!46974 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47524 a!2831)))))

(declare-fun b!1426244 () Bool)

(declare-fun res!961676 () Bool)

(assert (=> b!1426244 (=> (not res!961676) (not e!805635))))

(assert (=> b!1426244 (= res!961676 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46974 a!2831) j!81) a!2831 mask!2608) lt!628077))))

(declare-fun b!1426245 () Bool)

(declare-fun res!961674 () Bool)

(assert (=> b!1426245 (=> (not res!961674) (not e!805635))))

(assert (=> b!1426245 (= res!961674 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1426246 () Bool)

(declare-fun res!961680 () Bool)

(assert (=> b!1426246 (=> (not res!961680) (not e!805636))))

(assert (=> b!1426246 (= res!961680 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47524 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47524 a!2831))))))

(declare-fun b!1426247 () Bool)

(assert (=> b!1426247 (= e!805635 (not true))))

(assert (=> b!1426247 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-datatypes ((Unit!48252 0))(
  ( (Unit!48253) )
))
(declare-fun lt!628080 () Unit!48252)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97313 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48252)

(assert (=> b!1426247 (= lt!628080 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1426248 () Bool)

(declare-fun res!961675 () Bool)

(assert (=> b!1426248 (=> (not res!961675) (not e!805636))))

(assert (=> b!1426248 (= res!961675 (and (= (size!47524 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47524 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47524 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1426241 () Bool)

(declare-fun res!961670 () Bool)

(assert (=> b!1426241 (=> (not res!961670) (not e!805636))))

(assert (=> b!1426241 (= res!961670 (validKeyInArray!0 (select (arr!46974 a!2831) j!81)))))

(declare-fun res!961677 () Bool)

(assert (=> start!122948 (=> (not res!961677) (not e!805636))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122948 (= res!961677 (validMask!0 mask!2608))))

(assert (=> start!122948 e!805636))

(assert (=> start!122948 true))

(declare-fun array_inv!36002 (array!97313) Bool)

(assert (=> start!122948 (array_inv!36002 a!2831)))

(assert (= (and start!122948 res!961677) b!1426248))

(assert (= (and b!1426248 res!961675) b!1426240))

(assert (= (and b!1426240 res!961673) b!1426241))

(assert (= (and b!1426241 res!961670) b!1426242))

(assert (= (and b!1426242 res!961681) b!1426237))

(assert (= (and b!1426237 res!961678) b!1426246))

(assert (= (and b!1426246 res!961680) b!1426238))

(assert (= (and b!1426238 res!961671) b!1426243))

(assert (= (and b!1426243 res!961679) b!1426244))

(assert (= (and b!1426244 res!961676) b!1426239))

(assert (= (and b!1426239 res!961672) b!1426245))

(assert (= (and b!1426245 res!961674) b!1426247))

(declare-fun m!1316847 () Bool)

(assert (=> b!1426243 m!1316847))

(assert (=> b!1426243 m!1316847))

(declare-fun m!1316849 () Bool)

(assert (=> b!1426243 m!1316849))

(declare-fun m!1316851 () Bool)

(assert (=> b!1426243 m!1316851))

(declare-fun m!1316853 () Bool)

(assert (=> b!1426243 m!1316853))

(declare-fun m!1316855 () Bool)

(assert (=> b!1426247 m!1316855))

(declare-fun m!1316857 () Bool)

(assert (=> b!1426247 m!1316857))

(declare-fun m!1316859 () Bool)

(assert (=> b!1426241 m!1316859))

(assert (=> b!1426241 m!1316859))

(declare-fun m!1316861 () Bool)

(assert (=> b!1426241 m!1316861))

(declare-fun m!1316863 () Bool)

(assert (=> b!1426237 m!1316863))

(assert (=> b!1426244 m!1316859))

(assert (=> b!1426244 m!1316859))

(declare-fun m!1316865 () Bool)

(assert (=> b!1426244 m!1316865))

(declare-fun m!1316867 () Bool)

(assert (=> b!1426239 m!1316867))

(declare-fun m!1316869 () Bool)

(assert (=> b!1426240 m!1316869))

(assert (=> b!1426240 m!1316869))

(declare-fun m!1316871 () Bool)

(assert (=> b!1426240 m!1316871))

(declare-fun m!1316873 () Bool)

(assert (=> b!1426242 m!1316873))

(declare-fun m!1316875 () Bool)

(assert (=> start!122948 m!1316875))

(declare-fun m!1316877 () Bool)

(assert (=> start!122948 m!1316877))

(assert (=> b!1426238 m!1316859))

(assert (=> b!1426238 m!1316859))

(declare-fun m!1316879 () Bool)

(assert (=> b!1426238 m!1316879))

(assert (=> b!1426238 m!1316879))

(assert (=> b!1426238 m!1316859))

(declare-fun m!1316881 () Bool)

(assert (=> b!1426238 m!1316881))

(check-sat (not b!1426244) (not b!1426238) (not b!1426243) (not b!1426241) (not b!1426240) (not b!1426242) (not b!1426237) (not start!122948) (not b!1426247) (not b!1426239))
(check-sat)

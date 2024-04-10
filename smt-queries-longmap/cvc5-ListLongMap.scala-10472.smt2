; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123156 () Bool)

(assert start!123156)

(declare-fun b!1428048 () Bool)

(declare-fun res!962880 () Bool)

(declare-fun e!806536 () Bool)

(assert (=> b!1428048 (=> (not res!962880) (not e!806536))))

(declare-fun lt!628821 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11276 0))(
  ( (MissingZero!11276 (index!47496 (_ BitVec 32))) (Found!11276 (index!47497 (_ BitVec 32))) (Intermediate!11276 (undefined!12088 Bool) (index!47498 (_ BitVec 32)) (x!129136 (_ BitVec 32))) (Undefined!11276) (MissingVacant!11276 (index!47499 (_ BitVec 32))) )
))
(declare-fun lt!628819 () SeekEntryResult!11276)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((array!97368 0))(
  ( (array!97369 (arr!46997 (Array (_ BitVec 32) (_ BitVec 64))) (size!47547 (_ BitVec 32))) )
))
(declare-fun lt!628818 () array!97368)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97368 (_ BitVec 32)) SeekEntryResult!11276)

(assert (=> b!1428048 (= res!962880 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628821 lt!628818 mask!2608) lt!628819))))

(declare-fun b!1428049 () Bool)

(assert (=> b!1428049 (= e!806536 (not true))))

(declare-fun e!806533 () Bool)

(assert (=> b!1428049 e!806533))

(declare-fun res!962886 () Bool)

(assert (=> b!1428049 (=> (not res!962886) (not e!806533))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun a!2831 () array!97368)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97368 (_ BitVec 32)) Bool)

(assert (=> b!1428049 (= res!962886 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48298 0))(
  ( (Unit!48299) )
))
(declare-fun lt!628817 () Unit!48298)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97368 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48298)

(assert (=> b!1428049 (= lt!628817 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1428050 () Bool)

(declare-fun e!806534 () Bool)

(declare-fun e!806537 () Bool)

(assert (=> b!1428050 (= e!806534 e!806537)))

(declare-fun res!962882 () Bool)

(assert (=> b!1428050 (=> (not res!962882) (not e!806537))))

(declare-fun lt!628820 () SeekEntryResult!11276)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1428050 (= res!962882 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46997 a!2831) j!81) mask!2608) (select (arr!46997 a!2831) j!81) a!2831 mask!2608) lt!628820))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1428050 (= lt!628820 (Intermediate!11276 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1428051 () Bool)

(assert (=> b!1428051 (= e!806537 e!806536)))

(declare-fun res!962885 () Bool)

(assert (=> b!1428051 (=> (not res!962885) (not e!806536))))

(assert (=> b!1428051 (= res!962885 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628821 mask!2608) lt!628821 lt!628818 mask!2608) lt!628819))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1428051 (= lt!628819 (Intermediate!11276 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1428051 (= lt!628821 (select (store (arr!46997 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1428051 (= lt!628818 (array!97369 (store (arr!46997 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47547 a!2831)))))

(declare-fun b!1428052 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97368 (_ BitVec 32)) SeekEntryResult!11276)

(assert (=> b!1428052 (= e!806533 (= (seekEntryOrOpen!0 (select (arr!46997 a!2831) j!81) a!2831 mask!2608) (Found!11276 j!81)))))

(declare-fun b!1428053 () Bool)

(declare-fun res!962887 () Bool)

(assert (=> b!1428053 (=> (not res!962887) (not e!806536))))

(assert (=> b!1428053 (= res!962887 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1428054 () Bool)

(declare-fun res!962878 () Bool)

(assert (=> b!1428054 (=> (not res!962878) (not e!806534))))

(declare-datatypes ((List!33507 0))(
  ( (Nil!33504) (Cons!33503 (h!34814 (_ BitVec 64)) (t!48201 List!33507)) )
))
(declare-fun arrayNoDuplicates!0 (array!97368 (_ BitVec 32) List!33507) Bool)

(assert (=> b!1428054 (= res!962878 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33504))))

(declare-fun b!1428055 () Bool)

(declare-fun res!962881 () Bool)

(assert (=> b!1428055 (=> (not res!962881) (not e!806536))))

(assert (=> b!1428055 (= res!962881 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46997 a!2831) j!81) a!2831 mask!2608) lt!628820))))

(declare-fun b!1428056 () Bool)

(declare-fun res!962879 () Bool)

(assert (=> b!1428056 (=> (not res!962879) (not e!806534))))

(assert (=> b!1428056 (= res!962879 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47547 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47547 a!2831))))))

(declare-fun res!962889 () Bool)

(assert (=> start!123156 (=> (not res!962889) (not e!806534))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123156 (= res!962889 (validMask!0 mask!2608))))

(assert (=> start!123156 e!806534))

(assert (=> start!123156 true))

(declare-fun array_inv!36025 (array!97368) Bool)

(assert (=> start!123156 (array_inv!36025 a!2831)))

(declare-fun b!1428057 () Bool)

(declare-fun res!962884 () Bool)

(assert (=> b!1428057 (=> (not res!962884) (not e!806534))))

(assert (=> b!1428057 (= res!962884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1428058 () Bool)

(declare-fun res!962888 () Bool)

(assert (=> b!1428058 (=> (not res!962888) (not e!806534))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1428058 (= res!962888 (validKeyInArray!0 (select (arr!46997 a!2831) i!982)))))

(declare-fun b!1428059 () Bool)

(declare-fun res!962883 () Bool)

(assert (=> b!1428059 (=> (not res!962883) (not e!806534))))

(assert (=> b!1428059 (= res!962883 (validKeyInArray!0 (select (arr!46997 a!2831) j!81)))))

(declare-fun b!1428060 () Bool)

(declare-fun res!962890 () Bool)

(assert (=> b!1428060 (=> (not res!962890) (not e!806534))))

(assert (=> b!1428060 (= res!962890 (and (= (size!47547 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47547 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47547 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!123156 res!962889) b!1428060))

(assert (= (and b!1428060 res!962890) b!1428058))

(assert (= (and b!1428058 res!962888) b!1428059))

(assert (= (and b!1428059 res!962883) b!1428057))

(assert (= (and b!1428057 res!962884) b!1428054))

(assert (= (and b!1428054 res!962878) b!1428056))

(assert (= (and b!1428056 res!962879) b!1428050))

(assert (= (and b!1428050 res!962882) b!1428051))

(assert (= (and b!1428051 res!962885) b!1428055))

(assert (= (and b!1428055 res!962881) b!1428048))

(assert (= (and b!1428048 res!962880) b!1428053))

(assert (= (and b!1428053 res!962887) b!1428049))

(assert (= (and b!1428049 res!962886) b!1428052))

(declare-fun m!1318293 () Bool)

(assert (=> b!1428054 m!1318293))

(declare-fun m!1318295 () Bool)

(assert (=> b!1428049 m!1318295))

(declare-fun m!1318297 () Bool)

(assert (=> b!1428049 m!1318297))

(declare-fun m!1318299 () Bool)

(assert (=> b!1428059 m!1318299))

(assert (=> b!1428059 m!1318299))

(declare-fun m!1318301 () Bool)

(assert (=> b!1428059 m!1318301))

(declare-fun m!1318303 () Bool)

(assert (=> b!1428057 m!1318303))

(declare-fun m!1318305 () Bool)

(assert (=> b!1428051 m!1318305))

(assert (=> b!1428051 m!1318305))

(declare-fun m!1318307 () Bool)

(assert (=> b!1428051 m!1318307))

(declare-fun m!1318309 () Bool)

(assert (=> b!1428051 m!1318309))

(declare-fun m!1318311 () Bool)

(assert (=> b!1428051 m!1318311))

(declare-fun m!1318313 () Bool)

(assert (=> start!123156 m!1318313))

(declare-fun m!1318315 () Bool)

(assert (=> start!123156 m!1318315))

(declare-fun m!1318317 () Bool)

(assert (=> b!1428058 m!1318317))

(assert (=> b!1428058 m!1318317))

(declare-fun m!1318319 () Bool)

(assert (=> b!1428058 m!1318319))

(assert (=> b!1428050 m!1318299))

(assert (=> b!1428050 m!1318299))

(declare-fun m!1318321 () Bool)

(assert (=> b!1428050 m!1318321))

(assert (=> b!1428050 m!1318321))

(assert (=> b!1428050 m!1318299))

(declare-fun m!1318323 () Bool)

(assert (=> b!1428050 m!1318323))

(declare-fun m!1318325 () Bool)

(assert (=> b!1428048 m!1318325))

(assert (=> b!1428055 m!1318299))

(assert (=> b!1428055 m!1318299))

(declare-fun m!1318327 () Bool)

(assert (=> b!1428055 m!1318327))

(assert (=> b!1428052 m!1318299))

(assert (=> b!1428052 m!1318299))

(declare-fun m!1318329 () Bool)

(assert (=> b!1428052 m!1318329))

(push 1)


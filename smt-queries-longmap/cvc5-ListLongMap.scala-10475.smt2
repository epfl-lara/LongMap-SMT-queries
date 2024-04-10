; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123228 () Bool)

(assert start!123228)

(declare-fun b!1428708 () Bool)

(declare-fun res!963340 () Bool)

(declare-fun e!806860 () Bool)

(assert (=> b!1428708 (=> (not res!963340) (not e!806860))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97389 0))(
  ( (array!97390 (arr!47006 (Array (_ BitVec 32) (_ BitVec 64))) (size!47556 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97389)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1428708 (= res!963340 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47556 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47556 a!2831))))))

(declare-fun b!1428709 () Bool)

(declare-fun e!806858 () Bool)

(assert (=> b!1428709 (= e!806858 (not true))))

(declare-fun e!806857 () Bool)

(assert (=> b!1428709 e!806857))

(declare-fun res!963339 () Bool)

(assert (=> b!1428709 (=> (not res!963339) (not e!806857))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97389 (_ BitVec 32)) Bool)

(assert (=> b!1428709 (= res!963339 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48316 0))(
  ( (Unit!48317) )
))
(declare-fun lt!629084 () Unit!48316)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97389 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48316)

(assert (=> b!1428709 (= lt!629084 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1428710 () Bool)

(declare-fun res!963337 () Bool)

(assert (=> b!1428710 (=> (not res!963337) (not e!806860))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1428710 (= res!963337 (validKeyInArray!0 (select (arr!47006 a!2831) i!982)))))

(declare-fun b!1428711 () Bool)

(declare-fun res!963345 () Bool)

(assert (=> b!1428711 (=> (not res!963345) (not e!806860))))

(assert (=> b!1428711 (= res!963345 (validKeyInArray!0 (select (arr!47006 a!2831) j!81)))))

(declare-fun b!1428712 () Bool)

(declare-fun res!963343 () Bool)

(assert (=> b!1428712 (=> (not res!963343) (not e!806858))))

(declare-fun lt!629086 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11285 0))(
  ( (MissingZero!11285 (index!47532 (_ BitVec 32))) (Found!11285 (index!47533 (_ BitVec 32))) (Intermediate!11285 (undefined!12097 Bool) (index!47534 (_ BitVec 32)) (x!129175 (_ BitVec 32))) (Undefined!11285) (MissingVacant!11285 (index!47535 (_ BitVec 32))) )
))
(declare-fun lt!629085 () SeekEntryResult!11285)

(declare-fun lt!629087 () array!97389)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97389 (_ BitVec 32)) SeekEntryResult!11285)

(assert (=> b!1428712 (= res!963343 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629086 lt!629087 mask!2608) lt!629085))))

(declare-fun res!963349 () Bool)

(assert (=> start!123228 (=> (not res!963349) (not e!806860))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123228 (= res!963349 (validMask!0 mask!2608))))

(assert (=> start!123228 e!806860))

(assert (=> start!123228 true))

(declare-fun array_inv!36034 (array!97389) Bool)

(assert (=> start!123228 (array_inv!36034 a!2831)))

(declare-fun b!1428713 () Bool)

(declare-fun res!963348 () Bool)

(assert (=> b!1428713 (=> (not res!963348) (not e!806860))))

(assert (=> b!1428713 (= res!963348 (and (= (size!47556 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47556 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47556 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1428714 () Bool)

(declare-fun res!963347 () Bool)

(assert (=> b!1428714 (=> (not res!963347) (not e!806858))))

(declare-fun lt!629088 () SeekEntryResult!11285)

(assert (=> b!1428714 (= res!963347 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47006 a!2831) j!81) a!2831 mask!2608) lt!629088))))

(declare-fun b!1428715 () Bool)

(declare-fun res!963341 () Bool)

(assert (=> b!1428715 (=> (not res!963341) (not e!806860))))

(assert (=> b!1428715 (= res!963341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1428716 () Bool)

(declare-fun res!963338 () Bool)

(assert (=> b!1428716 (=> (not res!963338) (not e!806860))))

(declare-datatypes ((List!33516 0))(
  ( (Nil!33513) (Cons!33512 (h!34826 (_ BitVec 64)) (t!48210 List!33516)) )
))
(declare-fun arrayNoDuplicates!0 (array!97389 (_ BitVec 32) List!33516) Bool)

(assert (=> b!1428716 (= res!963338 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33513))))

(declare-fun b!1428717 () Bool)

(declare-fun e!806861 () Bool)

(assert (=> b!1428717 (= e!806860 e!806861)))

(declare-fun res!963342 () Bool)

(assert (=> b!1428717 (=> (not res!963342) (not e!806861))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1428717 (= res!963342 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47006 a!2831) j!81) mask!2608) (select (arr!47006 a!2831) j!81) a!2831 mask!2608) lt!629088))))

(assert (=> b!1428717 (= lt!629088 (Intermediate!11285 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1428718 () Bool)

(declare-fun res!963346 () Bool)

(assert (=> b!1428718 (=> (not res!963346) (not e!806858))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1428718 (= res!963346 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1428719 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97389 (_ BitVec 32)) SeekEntryResult!11285)

(assert (=> b!1428719 (= e!806857 (= (seekEntryOrOpen!0 (select (arr!47006 a!2831) j!81) a!2831 mask!2608) (Found!11285 j!81)))))

(declare-fun b!1428720 () Bool)

(assert (=> b!1428720 (= e!806861 e!806858)))

(declare-fun res!963344 () Bool)

(assert (=> b!1428720 (=> (not res!963344) (not e!806858))))

(assert (=> b!1428720 (= res!963344 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629086 mask!2608) lt!629086 lt!629087 mask!2608) lt!629085))))

(assert (=> b!1428720 (= lt!629085 (Intermediate!11285 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1428720 (= lt!629086 (select (store (arr!47006 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1428720 (= lt!629087 (array!97390 (store (arr!47006 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47556 a!2831)))))

(assert (= (and start!123228 res!963349) b!1428713))

(assert (= (and b!1428713 res!963348) b!1428710))

(assert (= (and b!1428710 res!963337) b!1428711))

(assert (= (and b!1428711 res!963345) b!1428715))

(assert (= (and b!1428715 res!963341) b!1428716))

(assert (= (and b!1428716 res!963338) b!1428708))

(assert (= (and b!1428708 res!963340) b!1428717))

(assert (= (and b!1428717 res!963342) b!1428720))

(assert (= (and b!1428720 res!963344) b!1428714))

(assert (= (and b!1428714 res!963347) b!1428712))

(assert (= (and b!1428712 res!963343) b!1428718))

(assert (= (and b!1428718 res!963346) b!1428709))

(assert (= (and b!1428709 res!963339) b!1428719))

(declare-fun m!1318827 () Bool)

(assert (=> b!1428712 m!1318827))

(declare-fun m!1318829 () Bool)

(assert (=> start!123228 m!1318829))

(declare-fun m!1318831 () Bool)

(assert (=> start!123228 m!1318831))

(declare-fun m!1318833 () Bool)

(assert (=> b!1428720 m!1318833))

(assert (=> b!1428720 m!1318833))

(declare-fun m!1318835 () Bool)

(assert (=> b!1428720 m!1318835))

(declare-fun m!1318837 () Bool)

(assert (=> b!1428720 m!1318837))

(declare-fun m!1318839 () Bool)

(assert (=> b!1428720 m!1318839))

(declare-fun m!1318841 () Bool)

(assert (=> b!1428719 m!1318841))

(assert (=> b!1428719 m!1318841))

(declare-fun m!1318843 () Bool)

(assert (=> b!1428719 m!1318843))

(assert (=> b!1428717 m!1318841))

(assert (=> b!1428717 m!1318841))

(declare-fun m!1318845 () Bool)

(assert (=> b!1428717 m!1318845))

(assert (=> b!1428717 m!1318845))

(assert (=> b!1428717 m!1318841))

(declare-fun m!1318847 () Bool)

(assert (=> b!1428717 m!1318847))

(assert (=> b!1428714 m!1318841))

(assert (=> b!1428714 m!1318841))

(declare-fun m!1318849 () Bool)

(assert (=> b!1428714 m!1318849))

(declare-fun m!1318851 () Bool)

(assert (=> b!1428715 m!1318851))

(assert (=> b!1428711 m!1318841))

(assert (=> b!1428711 m!1318841))

(declare-fun m!1318853 () Bool)

(assert (=> b!1428711 m!1318853))

(declare-fun m!1318855 () Bool)

(assert (=> b!1428716 m!1318855))

(declare-fun m!1318857 () Bool)

(assert (=> b!1428709 m!1318857))

(declare-fun m!1318859 () Bool)

(assert (=> b!1428709 m!1318859))

(declare-fun m!1318861 () Bool)

(assert (=> b!1428710 m!1318861))

(assert (=> b!1428710 m!1318861))

(declare-fun m!1318863 () Bool)

(assert (=> b!1428710 m!1318863))

(push 1)


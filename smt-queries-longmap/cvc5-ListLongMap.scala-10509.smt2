; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123870 () Bool)

(assert start!123870)

(declare-fun res!968468 () Bool)

(declare-fun e!810134 () Bool)

(assert (=> start!123870 (=> (not res!968468) (not e!810134))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123870 (= res!968468 (validMask!0 mask!2608))))

(assert (=> start!123870 e!810134))

(assert (=> start!123870 true))

(declare-datatypes ((array!97614 0))(
  ( (array!97615 (arr!47108 (Array (_ BitVec 32) (_ BitVec 64))) (size!47658 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97614)

(declare-fun array_inv!36136 (array!97614) Bool)

(assert (=> start!123870 (array_inv!36136 a!2831)))

(declare-fun b!1435451 () Bool)

(declare-fun e!810140 () Bool)

(declare-fun e!810138 () Bool)

(assert (=> b!1435451 (= e!810140 (not e!810138))))

(declare-fun res!968471 () Bool)

(assert (=> b!1435451 (=> res!968471 e!810138)))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1435451 (= res!968471 (or (= (select (arr!47108 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47108 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47108 a!2831) index!585) (select (arr!47108 a!2831) j!81)) (= (select (store (arr!47108 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!810135 () Bool)

(assert (=> b!1435451 e!810135))

(declare-fun res!968460 () Bool)

(assert (=> b!1435451 (=> (not res!968460) (not e!810135))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97614 (_ BitVec 32)) Bool)

(assert (=> b!1435451 (= res!968460 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48520 0))(
  ( (Unit!48521) )
))
(declare-fun lt!631891 () Unit!48520)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97614 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48520)

(assert (=> b!1435451 (= lt!631891 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1435452 () Bool)

(declare-fun res!968459 () Bool)

(assert (=> b!1435452 (=> (not res!968459) (not e!810134))))

(assert (=> b!1435452 (= res!968459 (and (= (size!47658 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47658 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47658 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1435453 () Bool)

(declare-fun res!968457 () Bool)

(assert (=> b!1435453 (=> (not res!968457) (not e!810140))))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11387 0))(
  ( (MissingZero!11387 (index!47940 (_ BitVec 32))) (Found!11387 (index!47941 (_ BitVec 32))) (Intermediate!11387 (undefined!12199 Bool) (index!47942 (_ BitVec 32)) (x!129609 (_ BitVec 32))) (Undefined!11387) (MissingVacant!11387 (index!47943 (_ BitVec 32))) )
))
(declare-fun lt!631892 () SeekEntryResult!11387)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97614 (_ BitVec 32)) SeekEntryResult!11387)

(assert (=> b!1435453 (= res!968457 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47108 a!2831) j!81) a!2831 mask!2608) lt!631892))))

(declare-fun b!1435454 () Bool)

(declare-fun res!968470 () Bool)

(assert (=> b!1435454 (=> (not res!968470) (not e!810134))))

(assert (=> b!1435454 (= res!968470 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1435455 () Bool)

(declare-fun res!968464 () Bool)

(assert (=> b!1435455 (=> (not res!968464) (not e!810134))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1435455 (= res!968464 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47658 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47658 a!2831))))))

(declare-fun b!1435456 () Bool)

(declare-fun res!968461 () Bool)

(declare-fun e!810137 () Bool)

(assert (=> b!1435456 (=> res!968461 e!810137)))

(declare-fun lt!631889 () SeekEntryResult!11387)

(declare-fun lt!631890 () (_ BitVec 32))

(declare-fun lt!631893 () array!97614)

(declare-fun lt!631888 () (_ BitVec 64))

(assert (=> b!1435456 (= res!968461 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631890 lt!631888 lt!631893 mask!2608) lt!631889)))))

(declare-fun b!1435457 () Bool)

(declare-fun res!968458 () Bool)

(assert (=> b!1435457 (=> res!968458 e!810137)))

(assert (=> b!1435457 (= res!968458 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631890 (select (arr!47108 a!2831) j!81) a!2831 mask!2608) lt!631892)))))

(declare-fun b!1435458 () Bool)

(assert (=> b!1435458 (= e!810138 e!810137)))

(declare-fun res!968466 () Bool)

(assert (=> b!1435458 (=> res!968466 e!810137)))

(assert (=> b!1435458 (= res!968466 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!631890 #b00000000000000000000000000000000) (bvsge lt!631890 (size!47658 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1435458 (= lt!631890 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1435459 () Bool)

(declare-fun res!968469 () Bool)

(assert (=> b!1435459 (=> (not res!968469) (not e!810134))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1435459 (= res!968469 (validKeyInArray!0 (select (arr!47108 a!2831) i!982)))))

(declare-fun b!1435460 () Bool)

(assert (=> b!1435460 (= e!810137 (bvslt (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!605)) (bvsub #b01111111111111111111111111111110 x!605)))))

(declare-fun b!1435461 () Bool)

(declare-fun res!968465 () Bool)

(assert (=> b!1435461 (=> (not res!968465) (not e!810134))))

(assert (=> b!1435461 (= res!968465 (validKeyInArray!0 (select (arr!47108 a!2831) j!81)))))

(declare-fun b!1435462 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97614 (_ BitVec 32)) SeekEntryResult!11387)

(assert (=> b!1435462 (= e!810135 (= (seekEntryOrOpen!0 (select (arr!47108 a!2831) j!81) a!2831 mask!2608) (Found!11387 j!81)))))

(declare-fun b!1435463 () Bool)

(declare-fun res!968473 () Bool)

(assert (=> b!1435463 (=> (not res!968473) (not e!810140))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1435463 (= res!968473 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1435464 () Bool)

(declare-fun res!968462 () Bool)

(assert (=> b!1435464 (=> (not res!968462) (not e!810140))))

(assert (=> b!1435464 (= res!968462 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631888 lt!631893 mask!2608) lt!631889))))

(declare-fun b!1435465 () Bool)

(declare-fun e!810136 () Bool)

(assert (=> b!1435465 (= e!810136 e!810140)))

(declare-fun res!968463 () Bool)

(assert (=> b!1435465 (=> (not res!968463) (not e!810140))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1435465 (= res!968463 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631888 mask!2608) lt!631888 lt!631893 mask!2608) lt!631889))))

(assert (=> b!1435465 (= lt!631889 (Intermediate!11387 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1435465 (= lt!631888 (select (store (arr!47108 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1435465 (= lt!631893 (array!97615 (store (arr!47108 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47658 a!2831)))))

(declare-fun b!1435466 () Bool)

(declare-fun res!968472 () Bool)

(assert (=> b!1435466 (=> (not res!968472) (not e!810134))))

(declare-datatypes ((List!33618 0))(
  ( (Nil!33615) (Cons!33614 (h!34949 (_ BitVec 64)) (t!48312 List!33618)) )
))
(declare-fun arrayNoDuplicates!0 (array!97614 (_ BitVec 32) List!33618) Bool)

(assert (=> b!1435466 (= res!968472 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33615))))

(declare-fun b!1435467 () Bool)

(assert (=> b!1435467 (= e!810134 e!810136)))

(declare-fun res!968467 () Bool)

(assert (=> b!1435467 (=> (not res!968467) (not e!810136))))

(assert (=> b!1435467 (= res!968467 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47108 a!2831) j!81) mask!2608) (select (arr!47108 a!2831) j!81) a!2831 mask!2608) lt!631892))))

(assert (=> b!1435467 (= lt!631892 (Intermediate!11387 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(assert (= (and start!123870 res!968468) b!1435452))

(assert (= (and b!1435452 res!968459) b!1435459))

(assert (= (and b!1435459 res!968469) b!1435461))

(assert (= (and b!1435461 res!968465) b!1435454))

(assert (= (and b!1435454 res!968470) b!1435466))

(assert (= (and b!1435466 res!968472) b!1435455))

(assert (= (and b!1435455 res!968464) b!1435467))

(assert (= (and b!1435467 res!968467) b!1435465))

(assert (= (and b!1435465 res!968463) b!1435453))

(assert (= (and b!1435453 res!968457) b!1435464))

(assert (= (and b!1435464 res!968462) b!1435463))

(assert (= (and b!1435463 res!968473) b!1435451))

(assert (= (and b!1435451 res!968460) b!1435462))

(assert (= (and b!1435451 (not res!968471)) b!1435458))

(assert (= (and b!1435458 (not res!968466)) b!1435457))

(assert (= (and b!1435457 (not res!968458)) b!1435456))

(assert (= (and b!1435456 (not res!968461)) b!1435460))

(declare-fun m!1324809 () Bool)

(assert (=> b!1435454 m!1324809))

(declare-fun m!1324811 () Bool)

(assert (=> b!1435456 m!1324811))

(declare-fun m!1324813 () Bool)

(assert (=> b!1435466 m!1324813))

(declare-fun m!1324815 () Bool)

(assert (=> start!123870 m!1324815))

(declare-fun m!1324817 () Bool)

(assert (=> start!123870 m!1324817))

(declare-fun m!1324819 () Bool)

(assert (=> b!1435462 m!1324819))

(assert (=> b!1435462 m!1324819))

(declare-fun m!1324821 () Bool)

(assert (=> b!1435462 m!1324821))

(assert (=> b!1435453 m!1324819))

(assert (=> b!1435453 m!1324819))

(declare-fun m!1324823 () Bool)

(assert (=> b!1435453 m!1324823))

(declare-fun m!1324825 () Bool)

(assert (=> b!1435464 m!1324825))

(declare-fun m!1324827 () Bool)

(assert (=> b!1435459 m!1324827))

(assert (=> b!1435459 m!1324827))

(declare-fun m!1324829 () Bool)

(assert (=> b!1435459 m!1324829))

(assert (=> b!1435457 m!1324819))

(assert (=> b!1435457 m!1324819))

(declare-fun m!1324831 () Bool)

(assert (=> b!1435457 m!1324831))

(declare-fun m!1324833 () Bool)

(assert (=> b!1435465 m!1324833))

(assert (=> b!1435465 m!1324833))

(declare-fun m!1324835 () Bool)

(assert (=> b!1435465 m!1324835))

(declare-fun m!1324837 () Bool)

(assert (=> b!1435465 m!1324837))

(declare-fun m!1324839 () Bool)

(assert (=> b!1435465 m!1324839))

(assert (=> b!1435451 m!1324837))

(declare-fun m!1324841 () Bool)

(assert (=> b!1435451 m!1324841))

(declare-fun m!1324843 () Bool)

(assert (=> b!1435451 m!1324843))

(declare-fun m!1324845 () Bool)

(assert (=> b!1435451 m!1324845))

(assert (=> b!1435451 m!1324819))

(declare-fun m!1324847 () Bool)

(assert (=> b!1435451 m!1324847))

(declare-fun m!1324849 () Bool)

(assert (=> b!1435458 m!1324849))

(assert (=> b!1435467 m!1324819))

(assert (=> b!1435467 m!1324819))

(declare-fun m!1324851 () Bool)

(assert (=> b!1435467 m!1324851))

(assert (=> b!1435467 m!1324851))

(assert (=> b!1435467 m!1324819))

(declare-fun m!1324853 () Bool)

(assert (=> b!1435467 m!1324853))

(assert (=> b!1435461 m!1324819))

(assert (=> b!1435461 m!1324819))

(declare-fun m!1324855 () Bool)

(assert (=> b!1435461 m!1324855))

(push 1)

(assert (not b!1435451))

(assert (not b!1435459))

(assert (not b!1435457))

(assert (not b!1435467))

(assert (not start!123870))

(assert (not b!1435454))

(assert (not b!1435453))

(assert (not b!1435461))

(assert (not b!1435458))

(assert (not b!1435462))

(assert (not b!1435465))

(assert (not b!1435466))

(assert (not b!1435464))

(assert (not b!1435456))

(check-sat)

(pop 1)

(push 1)

(check-sat)


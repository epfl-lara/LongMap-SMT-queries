; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123234 () Bool)

(assert start!123234)

(declare-fun b!1428825 () Bool)

(declare-fun res!963462 () Bool)

(declare-fun e!806904 () Bool)

(assert (=> b!1428825 (=> (not res!963462) (not e!806904))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97395 0))(
  ( (array!97396 (arr!47009 (Array (_ BitVec 32) (_ BitVec 64))) (size!47559 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97395)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1428825 (= res!963462 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47559 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47559 a!2831))))))

(declare-fun b!1428826 () Bool)

(declare-fun res!963464 () Bool)

(declare-fun e!806903 () Bool)

(assert (=> b!1428826 (=> (not res!963464) (not e!806903))))

(declare-fun lt!629131 () array!97395)

(declare-fun lt!629133 () (_ BitVec 64))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11288 0))(
  ( (MissingZero!11288 (index!47544 (_ BitVec 32))) (Found!11288 (index!47545 (_ BitVec 32))) (Intermediate!11288 (undefined!12100 Bool) (index!47546 (_ BitVec 32)) (x!129186 (_ BitVec 32))) (Undefined!11288) (MissingVacant!11288 (index!47547 (_ BitVec 32))) )
))
(declare-fun lt!629132 () SeekEntryResult!11288)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97395 (_ BitVec 32)) SeekEntryResult!11288)

(assert (=> b!1428826 (= res!963464 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629133 lt!629131 mask!2608) lt!629132))))

(declare-fun b!1428828 () Bool)

(declare-fun e!806902 () Bool)

(assert (=> b!1428828 (= e!806902 e!806903)))

(declare-fun res!963459 () Bool)

(assert (=> b!1428828 (=> (not res!963459) (not e!806903))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1428828 (= res!963459 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629133 mask!2608) lt!629133 lt!629131 mask!2608) lt!629132))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1428828 (= lt!629132 (Intermediate!11288 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1428828 (= lt!629133 (select (store (arr!47009 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1428828 (= lt!629131 (array!97396 (store (arr!47009 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47559 a!2831)))))

(declare-fun b!1428829 () Bool)

(declare-fun res!963454 () Bool)

(assert (=> b!1428829 (=> (not res!963454) (not e!806903))))

(assert (=> b!1428829 (= res!963454 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1428830 () Bool)

(declare-fun res!963460 () Bool)

(assert (=> b!1428830 (=> (not res!963460) (not e!806903))))

(declare-fun lt!629129 () SeekEntryResult!11288)

(assert (=> b!1428830 (= res!963460 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47009 a!2831) j!81) a!2831 mask!2608) lt!629129))))

(declare-fun b!1428831 () Bool)

(assert (=> b!1428831 (= e!806903 (not true))))

(declare-fun e!806906 () Bool)

(assert (=> b!1428831 e!806906))

(declare-fun res!963455 () Bool)

(assert (=> b!1428831 (=> (not res!963455) (not e!806906))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97395 (_ BitVec 32)) Bool)

(assert (=> b!1428831 (= res!963455 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48322 0))(
  ( (Unit!48323) )
))
(declare-fun lt!629130 () Unit!48322)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97395 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48322)

(assert (=> b!1428831 (= lt!629130 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1428832 () Bool)

(declare-fun res!963458 () Bool)

(assert (=> b!1428832 (=> (not res!963458) (not e!806904))))

(assert (=> b!1428832 (= res!963458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1428833 () Bool)

(declare-fun res!963466 () Bool)

(assert (=> b!1428833 (=> (not res!963466) (not e!806904))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1428833 (= res!963466 (validKeyInArray!0 (select (arr!47009 a!2831) j!81)))))

(declare-fun b!1428834 () Bool)

(assert (=> b!1428834 (= e!806904 e!806902)))

(declare-fun res!963463 () Bool)

(assert (=> b!1428834 (=> (not res!963463) (not e!806902))))

(assert (=> b!1428834 (= res!963463 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47009 a!2831) j!81) mask!2608) (select (arr!47009 a!2831) j!81) a!2831 mask!2608) lt!629129))))

(assert (=> b!1428834 (= lt!629129 (Intermediate!11288 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1428835 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97395 (_ BitVec 32)) SeekEntryResult!11288)

(assert (=> b!1428835 (= e!806906 (= (seekEntryOrOpen!0 (select (arr!47009 a!2831) j!81) a!2831 mask!2608) (Found!11288 j!81)))))

(declare-fun b!1428836 () Bool)

(declare-fun res!963465 () Bool)

(assert (=> b!1428836 (=> (not res!963465) (not e!806904))))

(assert (=> b!1428836 (= res!963465 (and (= (size!47559 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47559 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47559 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1428837 () Bool)

(declare-fun res!963457 () Bool)

(assert (=> b!1428837 (=> (not res!963457) (not e!806904))))

(assert (=> b!1428837 (= res!963457 (validKeyInArray!0 (select (arr!47009 a!2831) i!982)))))

(declare-fun res!963461 () Bool)

(assert (=> start!123234 (=> (not res!963461) (not e!806904))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123234 (= res!963461 (validMask!0 mask!2608))))

(assert (=> start!123234 e!806904))

(assert (=> start!123234 true))

(declare-fun array_inv!36037 (array!97395) Bool)

(assert (=> start!123234 (array_inv!36037 a!2831)))

(declare-fun b!1428827 () Bool)

(declare-fun res!963456 () Bool)

(assert (=> b!1428827 (=> (not res!963456) (not e!806904))))

(declare-datatypes ((List!33519 0))(
  ( (Nil!33516) (Cons!33515 (h!34829 (_ BitVec 64)) (t!48213 List!33519)) )
))
(declare-fun arrayNoDuplicates!0 (array!97395 (_ BitVec 32) List!33519) Bool)

(assert (=> b!1428827 (= res!963456 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33516))))

(assert (= (and start!123234 res!963461) b!1428836))

(assert (= (and b!1428836 res!963465) b!1428837))

(assert (= (and b!1428837 res!963457) b!1428833))

(assert (= (and b!1428833 res!963466) b!1428832))

(assert (= (and b!1428832 res!963458) b!1428827))

(assert (= (and b!1428827 res!963456) b!1428825))

(assert (= (and b!1428825 res!963462) b!1428834))

(assert (= (and b!1428834 res!963463) b!1428828))

(assert (= (and b!1428828 res!963459) b!1428830))

(assert (= (and b!1428830 res!963460) b!1428826))

(assert (= (and b!1428826 res!963464) b!1428829))

(assert (= (and b!1428829 res!963454) b!1428831))

(assert (= (and b!1428831 res!963455) b!1428835))

(declare-fun m!1318941 () Bool)

(assert (=> b!1428830 m!1318941))

(assert (=> b!1428830 m!1318941))

(declare-fun m!1318943 () Bool)

(assert (=> b!1428830 m!1318943))

(declare-fun m!1318945 () Bool)

(assert (=> b!1428831 m!1318945))

(declare-fun m!1318947 () Bool)

(assert (=> b!1428831 m!1318947))

(declare-fun m!1318949 () Bool)

(assert (=> b!1428832 m!1318949))

(assert (=> b!1428833 m!1318941))

(assert (=> b!1428833 m!1318941))

(declare-fun m!1318951 () Bool)

(assert (=> b!1428833 m!1318951))

(assert (=> b!1428835 m!1318941))

(assert (=> b!1428835 m!1318941))

(declare-fun m!1318953 () Bool)

(assert (=> b!1428835 m!1318953))

(declare-fun m!1318955 () Bool)

(assert (=> b!1428827 m!1318955))

(declare-fun m!1318957 () Bool)

(assert (=> b!1428837 m!1318957))

(assert (=> b!1428837 m!1318957))

(declare-fun m!1318959 () Bool)

(assert (=> b!1428837 m!1318959))

(assert (=> b!1428834 m!1318941))

(assert (=> b!1428834 m!1318941))

(declare-fun m!1318961 () Bool)

(assert (=> b!1428834 m!1318961))

(assert (=> b!1428834 m!1318961))

(assert (=> b!1428834 m!1318941))

(declare-fun m!1318963 () Bool)

(assert (=> b!1428834 m!1318963))

(declare-fun m!1318965 () Bool)

(assert (=> start!123234 m!1318965))

(declare-fun m!1318967 () Bool)

(assert (=> start!123234 m!1318967))

(declare-fun m!1318969 () Bool)

(assert (=> b!1428826 m!1318969))

(declare-fun m!1318971 () Bool)

(assert (=> b!1428828 m!1318971))

(assert (=> b!1428828 m!1318971))

(declare-fun m!1318973 () Bool)

(assert (=> b!1428828 m!1318973))

(declare-fun m!1318975 () Bool)

(assert (=> b!1428828 m!1318975))

(declare-fun m!1318977 () Bool)

(assert (=> b!1428828 m!1318977))

(push 1)


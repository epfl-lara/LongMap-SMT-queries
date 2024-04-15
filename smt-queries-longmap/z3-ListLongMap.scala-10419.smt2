; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122672 () Bool)

(assert start!122672)

(declare-fun b!1421026 () Bool)

(declare-fun res!956515 () Bool)

(declare-fun e!803587 () Bool)

(assert (=> b!1421026 (=> (not res!956515) (not e!803587))))

(declare-datatypes ((array!96990 0))(
  ( (array!96991 (arr!46813 (Array (_ BitVec 32) (_ BitVec 64))) (size!47365 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96990)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96990 (_ BitVec 32)) Bool)

(assert (=> b!1421026 (= res!956515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1421027 () Bool)

(declare-fun res!956510 () Bool)

(declare-fun e!803586 () Bool)

(assert (=> b!1421027 (=> (not res!956510) (not e!803586))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1421027 (= res!956510 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1421028 () Bool)

(declare-fun e!803585 () Bool)

(assert (=> b!1421028 (= e!803585 e!803586)))

(declare-fun res!956519 () Bool)

(assert (=> b!1421028 (=> (not res!956519) (not e!803586))))

(declare-fun lt!625940 () array!96990)

(declare-fun lt!625938 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11125 0))(
  ( (MissingZero!11125 (index!46892 (_ BitVec 32))) (Found!11125 (index!46893 (_ BitVec 32))) (Intermediate!11125 (undefined!11937 Bool) (index!46894 (_ BitVec 32)) (x!128540 (_ BitVec 32))) (Undefined!11125) (MissingVacant!11125 (index!46895 (_ BitVec 32))) )
))
(declare-fun lt!625936 () SeekEntryResult!11125)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96990 (_ BitVec 32)) SeekEntryResult!11125)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421028 (= res!956519 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!625938 mask!2608) lt!625938 lt!625940 mask!2608) lt!625936))))

(assert (=> b!1421028 (= lt!625936 (Intermediate!11125 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1421028 (= lt!625938 (select (store (arr!46813 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1421028 (= lt!625940 (array!96991 (store (arr!46813 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47365 a!2831)))))

(declare-fun b!1421029 () Bool)

(declare-fun res!956511 () Bool)

(assert (=> b!1421029 (=> (not res!956511) (not e!803587))))

(assert (=> b!1421029 (= res!956511 (and (= (size!47365 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47365 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47365 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1421030 () Bool)

(declare-fun res!956518 () Bool)

(assert (=> b!1421030 (=> (not res!956518) (not e!803586))))

(declare-fun lt!625937 () SeekEntryResult!11125)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1421030 (= res!956518 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46813 a!2831) j!81) a!2831 mask!2608) lt!625937))))

(declare-fun b!1421032 () Bool)

(declare-fun res!956513 () Bool)

(assert (=> b!1421032 (=> (not res!956513) (not e!803587))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421032 (= res!956513 (validKeyInArray!0 (select (arr!46813 a!2831) j!81)))))

(declare-fun b!1421033 () Bool)

(declare-fun res!956516 () Bool)

(assert (=> b!1421033 (=> (not res!956516) (not e!803587))))

(assert (=> b!1421033 (= res!956516 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47365 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47365 a!2831))))))

(declare-fun b!1421034 () Bool)

(declare-fun res!956520 () Bool)

(assert (=> b!1421034 (=> (not res!956520) (not e!803587))))

(declare-datatypes ((List!33401 0))(
  ( (Nil!33398) (Cons!33397 (h!34699 (_ BitVec 64)) (t!48087 List!33401)) )
))
(declare-fun arrayNoDuplicates!0 (array!96990 (_ BitVec 32) List!33401) Bool)

(assert (=> b!1421034 (= res!956520 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33398))))

(declare-fun b!1421035 () Bool)

(declare-fun res!956512 () Bool)

(assert (=> b!1421035 (=> (not res!956512) (not e!803587))))

(assert (=> b!1421035 (= res!956512 (validKeyInArray!0 (select (arr!46813 a!2831) i!982)))))

(declare-fun b!1421031 () Bool)

(declare-fun res!956514 () Bool)

(assert (=> b!1421031 (=> (not res!956514) (not e!803586))))

(assert (=> b!1421031 (= res!956514 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!625938 lt!625940 mask!2608) lt!625936))))

(declare-fun res!956517 () Bool)

(assert (=> start!122672 (=> (not res!956517) (not e!803587))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122672 (= res!956517 (validMask!0 mask!2608))))

(assert (=> start!122672 e!803587))

(assert (=> start!122672 true))

(declare-fun array_inv!36046 (array!96990) Bool)

(assert (=> start!122672 (array_inv!36046 a!2831)))

(declare-fun b!1421036 () Bool)

(assert (=> b!1421036 (= e!803586 (not true))))

(assert (=> b!1421036 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-datatypes ((Unit!47925 0))(
  ( (Unit!47926) )
))
(declare-fun lt!625939 () Unit!47925)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96990 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47925)

(assert (=> b!1421036 (= lt!625939 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1421037 () Bool)

(assert (=> b!1421037 (= e!803587 e!803585)))

(declare-fun res!956521 () Bool)

(assert (=> b!1421037 (=> (not res!956521) (not e!803585))))

(assert (=> b!1421037 (= res!956521 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46813 a!2831) j!81) mask!2608) (select (arr!46813 a!2831) j!81) a!2831 mask!2608) lt!625937))))

(assert (=> b!1421037 (= lt!625937 (Intermediate!11125 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(assert (= (and start!122672 res!956517) b!1421029))

(assert (= (and b!1421029 res!956511) b!1421035))

(assert (= (and b!1421035 res!956512) b!1421032))

(assert (= (and b!1421032 res!956513) b!1421026))

(assert (= (and b!1421026 res!956515) b!1421034))

(assert (= (and b!1421034 res!956520) b!1421033))

(assert (= (and b!1421033 res!956516) b!1421037))

(assert (= (and b!1421037 res!956521) b!1421028))

(assert (= (and b!1421028 res!956519) b!1421030))

(assert (= (and b!1421030 res!956518) b!1421031))

(assert (= (and b!1421031 res!956514) b!1421027))

(assert (= (and b!1421027 res!956510) b!1421036))

(declare-fun m!1311099 () Bool)

(assert (=> b!1421026 m!1311099))

(declare-fun m!1311101 () Bool)

(assert (=> b!1421035 m!1311101))

(assert (=> b!1421035 m!1311101))

(declare-fun m!1311103 () Bool)

(assert (=> b!1421035 m!1311103))

(declare-fun m!1311105 () Bool)

(assert (=> b!1421034 m!1311105))

(declare-fun m!1311107 () Bool)

(assert (=> start!122672 m!1311107))

(declare-fun m!1311109 () Bool)

(assert (=> start!122672 m!1311109))

(declare-fun m!1311111 () Bool)

(assert (=> b!1421036 m!1311111))

(declare-fun m!1311113 () Bool)

(assert (=> b!1421036 m!1311113))

(declare-fun m!1311115 () Bool)

(assert (=> b!1421031 m!1311115))

(declare-fun m!1311117 () Bool)

(assert (=> b!1421028 m!1311117))

(assert (=> b!1421028 m!1311117))

(declare-fun m!1311119 () Bool)

(assert (=> b!1421028 m!1311119))

(declare-fun m!1311121 () Bool)

(assert (=> b!1421028 m!1311121))

(declare-fun m!1311123 () Bool)

(assert (=> b!1421028 m!1311123))

(declare-fun m!1311125 () Bool)

(assert (=> b!1421032 m!1311125))

(assert (=> b!1421032 m!1311125))

(declare-fun m!1311127 () Bool)

(assert (=> b!1421032 m!1311127))

(assert (=> b!1421037 m!1311125))

(assert (=> b!1421037 m!1311125))

(declare-fun m!1311129 () Bool)

(assert (=> b!1421037 m!1311129))

(assert (=> b!1421037 m!1311129))

(assert (=> b!1421037 m!1311125))

(declare-fun m!1311131 () Bool)

(assert (=> b!1421037 m!1311131))

(assert (=> b!1421030 m!1311125))

(assert (=> b!1421030 m!1311125))

(declare-fun m!1311133 () Bool)

(assert (=> b!1421030 m!1311133))

(check-sat (not b!1421034) (not start!122672) (not b!1421037) (not b!1421028) (not b!1421032) (not b!1421026) (not b!1421031) (not b!1421035) (not b!1421030) (not b!1421036))
(check-sat)

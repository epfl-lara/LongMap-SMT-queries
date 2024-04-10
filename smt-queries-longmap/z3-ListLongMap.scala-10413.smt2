; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122642 () Bool)

(assert start!122642)

(declare-fun b!1420589 () Bool)

(declare-fun res!956031 () Bool)

(declare-fun e!803425 () Bool)

(assert (=> b!1420589 (=> (not res!956031) (not e!803425))))

(declare-datatypes ((SeekEntryResult!11106 0))(
  ( (MissingZero!11106 (index!46816 (_ BitVec 32))) (Found!11106 (index!46817 (_ BitVec 32))) (Intermediate!11106 (undefined!11918 Bool) (index!46818 (_ BitVec 32)) (x!128476 (_ BitVec 32))) (Undefined!11106) (MissingVacant!11106 (index!46819 (_ BitVec 32))) )
))
(declare-fun lt!625932 () SeekEntryResult!11106)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97007 0))(
  ( (array!97008 (arr!46821 (Array (_ BitVec 32) (_ BitVec 64))) (size!47371 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97007)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97007 (_ BitVec 32)) SeekEntryResult!11106)

(assert (=> b!1420589 (= res!956031 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46821 a!2831) j!81) a!2831 mask!2608) lt!625932))))

(declare-fun b!1420590 () Bool)

(declare-fun res!956025 () Bool)

(declare-fun e!803424 () Bool)

(assert (=> b!1420590 (=> (not res!956025) (not e!803424))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420590 (= res!956025 (validKeyInArray!0 (select (arr!46821 a!2831) i!982)))))

(declare-fun b!1420591 () Bool)

(declare-fun res!956023 () Bool)

(assert (=> b!1420591 (=> (not res!956023) (not e!803424))))

(declare-datatypes ((List!33331 0))(
  ( (Nil!33328) (Cons!33327 (h!34629 (_ BitVec 64)) (t!48025 List!33331)) )
))
(declare-fun arrayNoDuplicates!0 (array!97007 (_ BitVec 32) List!33331) Bool)

(assert (=> b!1420591 (= res!956023 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33328))))

(declare-fun b!1420592 () Bool)

(assert (=> b!1420592 (= e!803424 e!803425)))

(declare-fun res!956024 () Bool)

(assert (=> b!1420592 (=> (not res!956024) (not e!803425))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420592 (= res!956024 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46821 a!2831) j!81) mask!2608) (select (arr!46821 a!2831) j!81) a!2831 mask!2608) lt!625932))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1420592 (= lt!625932 (Intermediate!11106 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1420593 () Bool)

(declare-fun res!956030 () Bool)

(assert (=> b!1420593 (=> (not res!956030) (not e!803425))))

(assert (=> b!1420593 (= res!956030 (and (bvsge mask!2608 #b00000000000000000000000000000000) (bvslt index!585 (bvadd #b00000000000000000000000000000001 mask!2608))))))

(declare-fun b!1420594 () Bool)

(declare-fun res!956027 () Bool)

(assert (=> b!1420594 (=> (not res!956027) (not e!803424))))

(assert (=> b!1420594 (= res!956027 (and (= (size!47371 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47371 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47371 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!956028 () Bool)

(assert (=> start!122642 (=> (not res!956028) (not e!803424))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122642 (= res!956028 (validMask!0 mask!2608))))

(assert (=> start!122642 e!803424))

(assert (=> start!122642 true))

(declare-fun array_inv!35849 (array!97007) Bool)

(assert (=> start!122642 (array_inv!35849 a!2831)))

(declare-fun b!1420595 () Bool)

(assert (=> b!1420595 (= e!803425 (not (validKeyInArray!0 (select (store (arr!46821 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))))

(declare-fun b!1420596 () Bool)

(declare-fun res!956026 () Bool)

(assert (=> b!1420596 (=> (not res!956026) (not e!803425))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1420596 (= res!956026 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46821 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46821 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!97008 (store (arr!46821 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47371 a!2831)) mask!2608) (Intermediate!11106 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1420597 () Bool)

(declare-fun res!956022 () Bool)

(assert (=> b!1420597 (=> (not res!956022) (not e!803424))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97007 (_ BitVec 32)) Bool)

(assert (=> b!1420597 (= res!956022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1420598 () Bool)

(declare-fun res!956029 () Bool)

(assert (=> b!1420598 (=> (not res!956029) (not e!803424))))

(assert (=> b!1420598 (= res!956029 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47371 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47371 a!2831))))))

(declare-fun b!1420599 () Bool)

(declare-fun res!956032 () Bool)

(assert (=> b!1420599 (=> (not res!956032) (not e!803424))))

(assert (=> b!1420599 (= res!956032 (validKeyInArray!0 (select (arr!46821 a!2831) j!81)))))

(assert (= (and start!122642 res!956028) b!1420594))

(assert (= (and b!1420594 res!956027) b!1420590))

(assert (= (and b!1420590 res!956025) b!1420599))

(assert (= (and b!1420599 res!956032) b!1420597))

(assert (= (and b!1420597 res!956022) b!1420591))

(assert (= (and b!1420591 res!956023) b!1420598))

(assert (= (and b!1420598 res!956029) b!1420592))

(assert (= (and b!1420592 res!956024) b!1420596))

(assert (= (and b!1420596 res!956026) b!1420589))

(assert (= (and b!1420589 res!956031) b!1420593))

(assert (= (and b!1420593 res!956030) b!1420595))

(declare-fun m!1311107 () Bool)

(assert (=> b!1420592 m!1311107))

(assert (=> b!1420592 m!1311107))

(declare-fun m!1311109 () Bool)

(assert (=> b!1420592 m!1311109))

(assert (=> b!1420592 m!1311109))

(assert (=> b!1420592 m!1311107))

(declare-fun m!1311111 () Bool)

(assert (=> b!1420592 m!1311111))

(declare-fun m!1311113 () Bool)

(assert (=> b!1420596 m!1311113))

(declare-fun m!1311115 () Bool)

(assert (=> b!1420596 m!1311115))

(assert (=> b!1420596 m!1311115))

(declare-fun m!1311117 () Bool)

(assert (=> b!1420596 m!1311117))

(assert (=> b!1420596 m!1311117))

(assert (=> b!1420596 m!1311115))

(declare-fun m!1311119 () Bool)

(assert (=> b!1420596 m!1311119))

(assert (=> b!1420589 m!1311107))

(assert (=> b!1420589 m!1311107))

(declare-fun m!1311121 () Bool)

(assert (=> b!1420589 m!1311121))

(assert (=> b!1420599 m!1311107))

(assert (=> b!1420599 m!1311107))

(declare-fun m!1311123 () Bool)

(assert (=> b!1420599 m!1311123))

(declare-fun m!1311125 () Bool)

(assert (=> b!1420591 m!1311125))

(assert (=> b!1420595 m!1311113))

(assert (=> b!1420595 m!1311115))

(assert (=> b!1420595 m!1311115))

(declare-fun m!1311127 () Bool)

(assert (=> b!1420595 m!1311127))

(declare-fun m!1311129 () Bool)

(assert (=> b!1420597 m!1311129))

(declare-fun m!1311131 () Bool)

(assert (=> start!122642 m!1311131))

(declare-fun m!1311133 () Bool)

(assert (=> start!122642 m!1311133))

(declare-fun m!1311135 () Bool)

(assert (=> b!1420590 m!1311135))

(assert (=> b!1420590 m!1311135))

(declare-fun m!1311137 () Bool)

(assert (=> b!1420590 m!1311137))

(check-sat (not b!1420591) (not b!1420595) (not b!1420590) (not b!1420592) (not b!1420597) (not b!1420599) (not start!122642) (not b!1420596) (not b!1420589))
(check-sat)

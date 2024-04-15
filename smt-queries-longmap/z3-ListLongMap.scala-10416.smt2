; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122654 () Bool)

(assert start!122654)

(declare-fun b!1420752 () Bool)

(declare-fun e!803479 () Bool)

(declare-fun e!803477 () Bool)

(assert (=> b!1420752 (= e!803479 e!803477)))

(declare-fun res!956237 () Bool)

(assert (=> b!1420752 (=> (not res!956237) (not e!803477))))

(declare-fun lt!625826 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-datatypes ((array!96972 0))(
  ( (array!96973 (arr!46804 (Array (_ BitVec 32) (_ BitVec 64))) (size!47356 (_ BitVec 32))) )
))
(declare-fun lt!625828 () array!96972)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-datatypes ((SeekEntryResult!11116 0))(
  ( (MissingZero!11116 (index!46856 (_ BitVec 32))) (Found!11116 (index!46857 (_ BitVec 32))) (Intermediate!11116 (undefined!11928 Bool) (index!46858 (_ BitVec 32)) (x!128507 (_ BitVec 32))) (Undefined!11116) (MissingVacant!11116 (index!46859 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96972 (_ BitVec 32)) SeekEntryResult!11116)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420752 (= res!956237 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!625826 mask!2608) lt!625826 lt!625828 mask!2608) (Intermediate!11116 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun a!2831 () array!96972)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1420752 (= lt!625826 (select (store (arr!46804 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1420752 (= lt!625828 (array!96973 (store (arr!46804 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47356 a!2831)))))

(declare-fun b!1420753 () Bool)

(declare-fun res!956239 () Bool)

(declare-fun e!803480 () Bool)

(assert (=> b!1420753 (=> (not res!956239) (not e!803480))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420753 (= res!956239 (validKeyInArray!0 (select (arr!46804 a!2831) j!81)))))

(declare-fun b!1420754 () Bool)

(assert (=> b!1420754 (= e!803477 false)))

(declare-fun lt!625827 () SeekEntryResult!11116)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1420754 (= lt!625827 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!625826 lt!625828 mask!2608))))

(declare-fun b!1420755 () Bool)

(declare-fun res!956240 () Bool)

(assert (=> b!1420755 (=> (not res!956240) (not e!803480))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96972 (_ BitVec 32)) Bool)

(assert (=> b!1420755 (= res!956240 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!956242 () Bool)

(assert (=> start!122654 (=> (not res!956242) (not e!803480))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122654 (= res!956242 (validMask!0 mask!2608))))

(assert (=> start!122654 e!803480))

(assert (=> start!122654 true))

(declare-fun array_inv!36037 (array!96972) Bool)

(assert (=> start!122654 (array_inv!36037 a!2831)))

(declare-fun b!1420756 () Bool)

(declare-fun res!956243 () Bool)

(assert (=> b!1420756 (=> (not res!956243) (not e!803480))))

(assert (=> b!1420756 (= res!956243 (validKeyInArray!0 (select (arr!46804 a!2831) i!982)))))

(declare-fun b!1420757 () Bool)

(declare-fun res!956241 () Bool)

(assert (=> b!1420757 (=> (not res!956241) (not e!803477))))

(declare-fun lt!625829 () SeekEntryResult!11116)

(assert (=> b!1420757 (= res!956241 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46804 a!2831) j!81) a!2831 mask!2608) lt!625829))))

(declare-fun b!1420758 () Bool)

(declare-fun res!956244 () Bool)

(assert (=> b!1420758 (=> (not res!956244) (not e!803480))))

(assert (=> b!1420758 (= res!956244 (and (= (size!47356 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47356 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47356 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420759 () Bool)

(declare-fun res!956245 () Bool)

(assert (=> b!1420759 (=> (not res!956245) (not e!803480))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1420759 (= res!956245 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47356 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47356 a!2831))))))

(declare-fun b!1420760 () Bool)

(assert (=> b!1420760 (= e!803480 e!803479)))

(declare-fun res!956238 () Bool)

(assert (=> b!1420760 (=> (not res!956238) (not e!803479))))

(assert (=> b!1420760 (= res!956238 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46804 a!2831) j!81) mask!2608) (select (arr!46804 a!2831) j!81) a!2831 mask!2608) lt!625829))))

(assert (=> b!1420760 (= lt!625829 (Intermediate!11116 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1420761 () Bool)

(declare-fun res!956236 () Bool)

(assert (=> b!1420761 (=> (not res!956236) (not e!803480))))

(declare-datatypes ((List!33392 0))(
  ( (Nil!33389) (Cons!33388 (h!34690 (_ BitVec 64)) (t!48078 List!33392)) )
))
(declare-fun arrayNoDuplicates!0 (array!96972 (_ BitVec 32) List!33392) Bool)

(assert (=> b!1420761 (= res!956236 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33389))))

(assert (= (and start!122654 res!956242) b!1420758))

(assert (= (and b!1420758 res!956244) b!1420756))

(assert (= (and b!1420756 res!956243) b!1420753))

(assert (= (and b!1420753 res!956239) b!1420755))

(assert (= (and b!1420755 res!956240) b!1420761))

(assert (= (and b!1420761 res!956236) b!1420759))

(assert (= (and b!1420759 res!956245) b!1420760))

(assert (= (and b!1420760 res!956238) b!1420752))

(assert (= (and b!1420752 res!956237) b!1420757))

(assert (= (and b!1420757 res!956241) b!1420754))

(declare-fun m!1310811 () Bool)

(assert (=> b!1420754 m!1310811))

(declare-fun m!1310813 () Bool)

(assert (=> b!1420755 m!1310813))

(declare-fun m!1310815 () Bool)

(assert (=> b!1420760 m!1310815))

(assert (=> b!1420760 m!1310815))

(declare-fun m!1310817 () Bool)

(assert (=> b!1420760 m!1310817))

(assert (=> b!1420760 m!1310817))

(assert (=> b!1420760 m!1310815))

(declare-fun m!1310819 () Bool)

(assert (=> b!1420760 m!1310819))

(assert (=> b!1420753 m!1310815))

(assert (=> b!1420753 m!1310815))

(declare-fun m!1310821 () Bool)

(assert (=> b!1420753 m!1310821))

(declare-fun m!1310823 () Bool)

(assert (=> start!122654 m!1310823))

(declare-fun m!1310825 () Bool)

(assert (=> start!122654 m!1310825))

(declare-fun m!1310827 () Bool)

(assert (=> b!1420756 m!1310827))

(assert (=> b!1420756 m!1310827))

(declare-fun m!1310829 () Bool)

(assert (=> b!1420756 m!1310829))

(assert (=> b!1420757 m!1310815))

(assert (=> b!1420757 m!1310815))

(declare-fun m!1310831 () Bool)

(assert (=> b!1420757 m!1310831))

(declare-fun m!1310833 () Bool)

(assert (=> b!1420752 m!1310833))

(assert (=> b!1420752 m!1310833))

(declare-fun m!1310835 () Bool)

(assert (=> b!1420752 m!1310835))

(declare-fun m!1310837 () Bool)

(assert (=> b!1420752 m!1310837))

(declare-fun m!1310839 () Bool)

(assert (=> b!1420752 m!1310839))

(declare-fun m!1310841 () Bool)

(assert (=> b!1420761 m!1310841))

(check-sat (not b!1420761) (not b!1420752) (not b!1420756) (not b!1420755) (not b!1420760) (not start!122654) (not b!1420757) (not b!1420754) (not b!1420753))
(check-sat)

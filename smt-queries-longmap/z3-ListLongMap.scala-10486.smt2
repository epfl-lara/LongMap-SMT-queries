; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123590 () Bool)

(assert start!123590)

(declare-fun b!1431755 () Bool)

(declare-fun e!808468 () Bool)

(declare-fun e!808469 () Bool)

(assert (=> b!1431755 (= e!808468 e!808469)))

(declare-fun res!965302 () Bool)

(assert (=> b!1431755 (=> (not res!965302) (not e!808469))))

(declare-fun lt!630243 () (_ BitVec 64))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11273 0))(
  ( (MissingZero!11273 (index!47484 (_ BitVec 32))) (Found!11273 (index!47485 (_ BitVec 32))) (Intermediate!11273 (undefined!12085 Bool) (index!47486 (_ BitVec 32)) (x!129282 (_ BitVec 32))) (Undefined!11273) (MissingVacant!11273 (index!47487 (_ BitVec 32))) )
))
(declare-fun lt!630241 () SeekEntryResult!11273)

(declare-datatypes ((array!97571 0))(
  ( (array!97572 (arr!47092 (Array (_ BitVec 32) (_ BitVec 64))) (size!47643 (_ BitVec 32))) )
))
(declare-fun lt!630245 () array!97571)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97571 (_ BitVec 32)) SeekEntryResult!11273)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1431755 (= res!965302 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630243 mask!2608) lt!630243 lt!630245 mask!2608) lt!630241))))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(assert (=> b!1431755 (= lt!630241 (Intermediate!11273 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun a!2831 () array!97571)

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1431755 (= lt!630243 (select (store (arr!47092 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1431755 (= lt!630245 (array!97572 (store (arr!47092 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47643 a!2831)))))

(declare-fun b!1431756 () Bool)

(declare-fun e!808470 () Bool)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1431756 (= e!808470 (or (= (select (arr!47092 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47092 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47092 a!2831) index!585) (select (arr!47092 a!2831) j!81)) (not (= (select (store (arr!47092 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!585 intermediateAfterIndex!13)))))

(declare-fun b!1431757 () Bool)

(declare-fun res!965300 () Bool)

(declare-fun e!808471 () Bool)

(assert (=> b!1431757 (=> (not res!965300) (not e!808471))))

(declare-datatypes ((List!33589 0))(
  ( (Nil!33586) (Cons!33585 (h!34913 (_ BitVec 64)) (t!48275 List!33589)) )
))
(declare-fun arrayNoDuplicates!0 (array!97571 (_ BitVec 32) List!33589) Bool)

(assert (=> b!1431757 (= res!965300 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33586))))

(declare-fun b!1431758 () Bool)

(declare-fun res!965298 () Bool)

(assert (=> b!1431758 (=> (not res!965298) (not e!808469))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun lt!630242 () SeekEntryResult!11273)

(assert (=> b!1431758 (= res!965298 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47092 a!2831) j!81) a!2831 mask!2608) lt!630242))))

(declare-fun b!1431759 () Bool)

(declare-fun res!965303 () Bool)

(assert (=> b!1431759 (=> (not res!965303) (not e!808471))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97571 (_ BitVec 32)) Bool)

(assert (=> b!1431759 (= res!965303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1431760 () Bool)

(assert (=> b!1431760 (= e!808469 (not (or (= (select (arr!47092 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47092 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47092 a!2831) index!585) (select (arr!47092 a!2831) j!81)) (not (= (select (store (arr!47092 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)) (= intermediateAfterIndex!13 i!982))))))

(assert (=> b!1431760 e!808470))

(declare-fun res!965305 () Bool)

(assert (=> b!1431760 (=> (not res!965305) (not e!808470))))

(assert (=> b!1431760 (= res!965305 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48323 0))(
  ( (Unit!48324) )
))
(declare-fun lt!630244 () Unit!48323)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97571 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48323)

(assert (=> b!1431760 (= lt!630244 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1431761 () Bool)

(declare-fun res!965309 () Bool)

(assert (=> b!1431761 (=> (not res!965309) (not e!808471))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1431761 (= res!965309 (validKeyInArray!0 (select (arr!47092 a!2831) i!982)))))

(declare-fun b!1431762 () Bool)

(declare-fun res!965307 () Bool)

(assert (=> b!1431762 (=> (not res!965307) (not e!808471))))

(assert (=> b!1431762 (= res!965307 (and (= (size!47643 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47643 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47643 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1431763 () Bool)

(assert (=> b!1431763 (= e!808471 e!808468)))

(declare-fun res!965311 () Bool)

(assert (=> b!1431763 (=> (not res!965311) (not e!808468))))

(assert (=> b!1431763 (= res!965311 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47092 a!2831) j!81) mask!2608) (select (arr!47092 a!2831) j!81) a!2831 mask!2608) lt!630242))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1431763 (= lt!630242 (Intermediate!11273 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1431764 () Bool)

(declare-fun res!965308 () Bool)

(assert (=> b!1431764 (=> (not res!965308) (not e!808470))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97571 (_ BitVec 32)) SeekEntryResult!11273)

(assert (=> b!1431764 (= res!965308 (= (seekEntryOrOpen!0 (select (arr!47092 a!2831) j!81) a!2831 mask!2608) (Found!11273 j!81)))))

(declare-fun res!965306 () Bool)

(assert (=> start!123590 (=> (not res!965306) (not e!808471))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123590 (= res!965306 (validMask!0 mask!2608))))

(assert (=> start!123590 e!808471))

(assert (=> start!123590 true))

(declare-fun array_inv!36373 (array!97571) Bool)

(assert (=> start!123590 (array_inv!36373 a!2831)))

(declare-fun b!1431765 () Bool)

(declare-fun res!965310 () Bool)

(assert (=> b!1431765 (=> (not res!965310) (not e!808471))))

(assert (=> b!1431765 (= res!965310 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47643 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47643 a!2831))))))

(declare-fun b!1431766 () Bool)

(declare-fun res!965304 () Bool)

(assert (=> b!1431766 (=> (not res!965304) (not e!808469))))

(assert (=> b!1431766 (= res!965304 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1431767 () Bool)

(declare-fun res!965299 () Bool)

(assert (=> b!1431767 (=> (not res!965299) (not e!808469))))

(assert (=> b!1431767 (= res!965299 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630243 lt!630245 mask!2608) lt!630241))))

(declare-fun b!1431768 () Bool)

(declare-fun res!965301 () Bool)

(assert (=> b!1431768 (=> (not res!965301) (not e!808471))))

(assert (=> b!1431768 (= res!965301 (validKeyInArray!0 (select (arr!47092 a!2831) j!81)))))

(assert (= (and start!123590 res!965306) b!1431762))

(assert (= (and b!1431762 res!965307) b!1431761))

(assert (= (and b!1431761 res!965309) b!1431768))

(assert (= (and b!1431768 res!965301) b!1431759))

(assert (= (and b!1431759 res!965303) b!1431757))

(assert (= (and b!1431757 res!965300) b!1431765))

(assert (= (and b!1431765 res!965310) b!1431763))

(assert (= (and b!1431763 res!965311) b!1431755))

(assert (= (and b!1431755 res!965302) b!1431758))

(assert (= (and b!1431758 res!965298) b!1431767))

(assert (= (and b!1431767 res!965299) b!1431766))

(assert (= (and b!1431766 res!965304) b!1431760))

(assert (= (and b!1431760 res!965305) b!1431764))

(assert (= (and b!1431764 res!965308) b!1431756))

(declare-fun m!1321845 () Bool)

(assert (=> b!1431763 m!1321845))

(assert (=> b!1431763 m!1321845))

(declare-fun m!1321847 () Bool)

(assert (=> b!1431763 m!1321847))

(assert (=> b!1431763 m!1321847))

(assert (=> b!1431763 m!1321845))

(declare-fun m!1321849 () Bool)

(assert (=> b!1431763 m!1321849))

(declare-fun m!1321851 () Bool)

(assert (=> b!1431756 m!1321851))

(assert (=> b!1431756 m!1321845))

(declare-fun m!1321853 () Bool)

(assert (=> b!1431756 m!1321853))

(declare-fun m!1321855 () Bool)

(assert (=> b!1431756 m!1321855))

(declare-fun m!1321857 () Bool)

(assert (=> start!123590 m!1321857))

(declare-fun m!1321859 () Bool)

(assert (=> start!123590 m!1321859))

(assert (=> b!1431758 m!1321845))

(assert (=> b!1431758 m!1321845))

(declare-fun m!1321861 () Bool)

(assert (=> b!1431758 m!1321861))

(assert (=> b!1431760 m!1321853))

(assert (=> b!1431760 m!1321855))

(assert (=> b!1431760 m!1321851))

(declare-fun m!1321863 () Bool)

(assert (=> b!1431760 m!1321863))

(assert (=> b!1431760 m!1321845))

(declare-fun m!1321865 () Bool)

(assert (=> b!1431760 m!1321865))

(declare-fun m!1321867 () Bool)

(assert (=> b!1431767 m!1321867))

(declare-fun m!1321869 () Bool)

(assert (=> b!1431757 m!1321869))

(declare-fun m!1321871 () Bool)

(assert (=> b!1431761 m!1321871))

(assert (=> b!1431761 m!1321871))

(declare-fun m!1321873 () Bool)

(assert (=> b!1431761 m!1321873))

(assert (=> b!1431768 m!1321845))

(assert (=> b!1431768 m!1321845))

(declare-fun m!1321875 () Bool)

(assert (=> b!1431768 m!1321875))

(assert (=> b!1431764 m!1321845))

(assert (=> b!1431764 m!1321845))

(declare-fun m!1321877 () Bool)

(assert (=> b!1431764 m!1321877))

(declare-fun m!1321879 () Bool)

(assert (=> b!1431759 m!1321879))

(declare-fun m!1321881 () Bool)

(assert (=> b!1431755 m!1321881))

(assert (=> b!1431755 m!1321881))

(declare-fun m!1321883 () Bool)

(assert (=> b!1431755 m!1321883))

(assert (=> b!1431755 m!1321853))

(declare-fun m!1321885 () Bool)

(assert (=> b!1431755 m!1321885))

(check-sat (not b!1431763) (not b!1431761) (not b!1431755) (not b!1431768) (not b!1431760) (not b!1431759) (not start!123590) (not b!1431757) (not b!1431767) (not b!1431764) (not b!1431758))
(check-sat)

; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122818 () Bool)

(assert start!122818)

(declare-fun b!1424271 () Bool)

(declare-fun res!959718 () Bool)

(declare-fun e!804947 () Bool)

(assert (=> b!1424271 (=> (not res!959718) (not e!804947))))

(declare-datatypes ((array!97183 0))(
  ( (array!97184 (arr!46909 (Array (_ BitVec 32) (_ BitVec 64))) (size!47459 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97183)

(declare-datatypes ((List!33419 0))(
  ( (Nil!33416) (Cons!33415 (h!34717 (_ BitVec 64)) (t!48113 List!33419)) )
))
(declare-fun arrayNoDuplicates!0 (array!97183 (_ BitVec 32) List!33419) Bool)

(assert (=> b!1424271 (= res!959718 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33416))))

(declare-fun b!1424272 () Bool)

(declare-fun res!959717 () Bool)

(assert (=> b!1424272 (=> (not res!959717) (not e!804947))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1424272 (= res!959717 (and (= (size!47459 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47459 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47459 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1424273 () Bool)

(declare-fun res!959710 () Bool)

(assert (=> b!1424273 (=> (not res!959710) (not e!804947))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97183 (_ BitVec 32)) Bool)

(assert (=> b!1424273 (= res!959710 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1424274 () Bool)

(declare-fun e!804943 () Bool)

(declare-fun e!804942 () Bool)

(assert (=> b!1424274 (= e!804943 e!804942)))

(declare-fun res!959709 () Bool)

(assert (=> b!1424274 (=> (not res!959709) (not e!804942))))

(declare-datatypes ((SeekEntryResult!11194 0))(
  ( (MissingZero!11194 (index!47168 (_ BitVec 32))) (Found!11194 (index!47169 (_ BitVec 32))) (Intermediate!11194 (undefined!12006 Bool) (index!47170 (_ BitVec 32)) (x!128796 (_ BitVec 32))) (Undefined!11194) (MissingVacant!11194 (index!47171 (_ BitVec 32))) )
))
(declare-fun lt!627479 () SeekEntryResult!11194)

(declare-fun lt!627480 () array!97183)

(declare-fun lt!627481 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97183 (_ BitVec 32)) SeekEntryResult!11194)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424274 (= res!959709 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627481 mask!2608) lt!627481 lt!627480 mask!2608) lt!627479))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1424274 (= lt!627479 (Intermediate!11194 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1424274 (= lt!627481 (select (store (arr!46909 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1424274 (= lt!627480 (array!97184 (store (arr!46909 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47459 a!2831)))))

(declare-fun b!1424275 () Bool)

(declare-fun res!959704 () Bool)

(assert (=> b!1424275 (=> (not res!959704) (not e!804942))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1424275 (= res!959704 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1424276 () Bool)

(declare-fun res!959714 () Bool)

(assert (=> b!1424276 (=> (not res!959714) (not e!804947))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1424276 (= res!959714 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47459 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47459 a!2831))))))

(declare-fun b!1424277 () Bool)

(declare-fun e!804941 () Bool)

(assert (=> b!1424277 (= e!804941 true)))

(declare-fun lt!627478 () SeekEntryResult!11194)

(declare-fun lt!627482 () (_ BitVec 32))

(assert (=> b!1424277 (= lt!627478 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627482 lt!627481 lt!627480 mask!2608))))

(declare-fun b!1424278 () Bool)

(declare-fun res!959706 () Bool)

(assert (=> b!1424278 (=> (not res!959706) (not e!804947))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1424278 (= res!959706 (validKeyInArray!0 (select (arr!46909 a!2831) i!982)))))

(declare-fun res!959707 () Bool)

(assert (=> start!122818 (=> (not res!959707) (not e!804947))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122818 (= res!959707 (validMask!0 mask!2608))))

(assert (=> start!122818 e!804947))

(assert (=> start!122818 true))

(declare-fun array_inv!35937 (array!97183) Bool)

(assert (=> start!122818 (array_inv!35937 a!2831)))

(declare-fun b!1424279 () Bool)

(declare-fun res!959708 () Bool)

(assert (=> b!1424279 (=> res!959708 e!804941)))

(declare-fun lt!627483 () SeekEntryResult!11194)

(assert (=> b!1424279 (= res!959708 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627482 (select (arr!46909 a!2831) j!81) a!2831 mask!2608) lt!627483)))))

(declare-fun e!804944 () Bool)

(declare-fun b!1424280 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97183 (_ BitVec 32)) SeekEntryResult!11194)

(assert (=> b!1424280 (= e!804944 (= (seekEntryOrOpen!0 (select (arr!46909 a!2831) j!81) a!2831 mask!2608) (Found!11194 j!81)))))

(declare-fun b!1424281 () Bool)

(assert (=> b!1424281 (= e!804947 e!804943)))

(declare-fun res!959711 () Bool)

(assert (=> b!1424281 (=> (not res!959711) (not e!804943))))

(assert (=> b!1424281 (= res!959711 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46909 a!2831) j!81) mask!2608) (select (arr!46909 a!2831) j!81) a!2831 mask!2608) lt!627483))))

(assert (=> b!1424281 (= lt!627483 (Intermediate!11194 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1424282 () Bool)

(declare-fun res!959719 () Bool)

(assert (=> b!1424282 (=> (not res!959719) (not e!804942))))

(assert (=> b!1424282 (= res!959719 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627481 lt!627480 mask!2608) lt!627479))))

(declare-fun b!1424283 () Bool)

(declare-fun res!959716 () Bool)

(assert (=> b!1424283 (=> (not res!959716) (not e!804947))))

(assert (=> b!1424283 (= res!959716 (validKeyInArray!0 (select (arr!46909 a!2831) j!81)))))

(declare-fun b!1424284 () Bool)

(declare-fun res!959715 () Bool)

(assert (=> b!1424284 (=> (not res!959715) (not e!804942))))

(assert (=> b!1424284 (= res!959715 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46909 a!2831) j!81) a!2831 mask!2608) lt!627483))))

(declare-fun b!1424285 () Bool)

(declare-fun e!804946 () Bool)

(assert (=> b!1424285 (= e!804942 (not e!804946))))

(declare-fun res!959712 () Bool)

(assert (=> b!1424285 (=> res!959712 e!804946)))

(assert (=> b!1424285 (= res!959712 (or (= (select (arr!46909 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46909 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46909 a!2831) index!585) (select (arr!46909 a!2831) j!81)) (= (select (store (arr!46909 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1424285 e!804944))

(declare-fun res!959713 () Bool)

(assert (=> b!1424285 (=> (not res!959713) (not e!804944))))

(assert (=> b!1424285 (= res!959713 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48224 0))(
  ( (Unit!48225) )
))
(declare-fun lt!627477 () Unit!48224)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97183 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48224)

(assert (=> b!1424285 (= lt!627477 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1424286 () Bool)

(assert (=> b!1424286 (= e!804946 e!804941)))

(declare-fun res!959705 () Bool)

(assert (=> b!1424286 (=> res!959705 e!804941)))

(assert (=> b!1424286 (= res!959705 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627482 #b00000000000000000000000000000000) (bvsge lt!627482 (size!47459 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424286 (= lt!627482 (nextIndex!0 index!585 x!605 mask!2608))))

(assert (= (and start!122818 res!959707) b!1424272))

(assert (= (and b!1424272 res!959717) b!1424278))

(assert (= (and b!1424278 res!959706) b!1424283))

(assert (= (and b!1424283 res!959716) b!1424273))

(assert (= (and b!1424273 res!959710) b!1424271))

(assert (= (and b!1424271 res!959718) b!1424276))

(assert (= (and b!1424276 res!959714) b!1424281))

(assert (= (and b!1424281 res!959711) b!1424274))

(assert (= (and b!1424274 res!959709) b!1424284))

(assert (= (and b!1424284 res!959715) b!1424282))

(assert (= (and b!1424282 res!959719) b!1424275))

(assert (= (and b!1424275 res!959704) b!1424285))

(assert (= (and b!1424285 res!959713) b!1424280))

(assert (= (and b!1424285 (not res!959712)) b!1424286))

(assert (= (and b!1424286 (not res!959705)) b!1424279))

(assert (= (and b!1424279 (not res!959708)) b!1424277))

(declare-fun m!1314819 () Bool)

(assert (=> b!1424280 m!1314819))

(assert (=> b!1424280 m!1314819))

(declare-fun m!1314821 () Bool)

(assert (=> b!1424280 m!1314821))

(declare-fun m!1314823 () Bool)

(assert (=> b!1424271 m!1314823))

(assert (=> b!1424284 m!1314819))

(assert (=> b!1424284 m!1314819))

(declare-fun m!1314825 () Bool)

(assert (=> b!1424284 m!1314825))

(assert (=> b!1424283 m!1314819))

(assert (=> b!1424283 m!1314819))

(declare-fun m!1314827 () Bool)

(assert (=> b!1424283 m!1314827))

(declare-fun m!1314829 () Bool)

(assert (=> start!122818 m!1314829))

(declare-fun m!1314831 () Bool)

(assert (=> start!122818 m!1314831))

(declare-fun m!1314833 () Bool)

(assert (=> b!1424273 m!1314833))

(declare-fun m!1314835 () Bool)

(assert (=> b!1424278 m!1314835))

(assert (=> b!1424278 m!1314835))

(declare-fun m!1314837 () Bool)

(assert (=> b!1424278 m!1314837))

(declare-fun m!1314839 () Bool)

(assert (=> b!1424286 m!1314839))

(declare-fun m!1314841 () Bool)

(assert (=> b!1424277 m!1314841))

(assert (=> b!1424279 m!1314819))

(assert (=> b!1424279 m!1314819))

(declare-fun m!1314843 () Bool)

(assert (=> b!1424279 m!1314843))

(declare-fun m!1314845 () Bool)

(assert (=> b!1424282 m!1314845))

(declare-fun m!1314847 () Bool)

(assert (=> b!1424285 m!1314847))

(declare-fun m!1314849 () Bool)

(assert (=> b!1424285 m!1314849))

(declare-fun m!1314851 () Bool)

(assert (=> b!1424285 m!1314851))

(declare-fun m!1314853 () Bool)

(assert (=> b!1424285 m!1314853))

(assert (=> b!1424285 m!1314819))

(declare-fun m!1314855 () Bool)

(assert (=> b!1424285 m!1314855))

(declare-fun m!1314857 () Bool)

(assert (=> b!1424274 m!1314857))

(assert (=> b!1424274 m!1314857))

(declare-fun m!1314859 () Bool)

(assert (=> b!1424274 m!1314859))

(assert (=> b!1424274 m!1314847))

(declare-fun m!1314861 () Bool)

(assert (=> b!1424274 m!1314861))

(assert (=> b!1424281 m!1314819))

(assert (=> b!1424281 m!1314819))

(declare-fun m!1314863 () Bool)

(assert (=> b!1424281 m!1314863))

(assert (=> b!1424281 m!1314863))

(assert (=> b!1424281 m!1314819))

(declare-fun m!1314865 () Bool)

(assert (=> b!1424281 m!1314865))

(push 1)


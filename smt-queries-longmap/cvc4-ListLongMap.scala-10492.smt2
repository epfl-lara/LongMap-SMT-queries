; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123532 () Bool)

(assert start!123532)

(declare-fun b!1432025 () Bool)

(declare-fun res!965895 () Bool)

(declare-fun e!808427 () Bool)

(assert (=> b!1432025 (=> (not res!965895) (not e!808427))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97504 0))(
  ( (array!97505 (arr!47059 (Array (_ BitVec 32) (_ BitVec 64))) (size!47609 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97504)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1432025 (= res!965895 (and (= (size!47609 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47609 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47609 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1432026 () Bool)

(declare-fun e!808423 () Bool)

(declare-fun e!808426 () Bool)

(assert (=> b!1432026 (= e!808423 e!808426)))

(declare-fun res!965901 () Bool)

(assert (=> b!1432026 (=> (not res!965901) (not e!808426))))

(declare-datatypes ((SeekEntryResult!11338 0))(
  ( (MissingZero!11338 (index!47744 (_ BitVec 32))) (Found!11338 (index!47745 (_ BitVec 32))) (Intermediate!11338 (undefined!12150 Bool) (index!47746 (_ BitVec 32)) (x!129388 (_ BitVec 32))) (Undefined!11338) (MissingVacant!11338 (index!47747 (_ BitVec 32))) )
))
(declare-fun lt!630419 () SeekEntryResult!11338)

(declare-fun lt!630420 () array!97504)

(declare-fun lt!630415 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97504 (_ BitVec 32)) SeekEntryResult!11338)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432026 (= res!965901 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630415 mask!2608) lt!630415 lt!630420 mask!2608) lt!630419))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1432026 (= lt!630419 (Intermediate!11338 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1432026 (= lt!630415 (select (store (arr!47059 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1432026 (= lt!630420 (array!97505 (store (arr!47059 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47609 a!2831)))))

(declare-fun b!1432027 () Bool)

(declare-fun res!965900 () Bool)

(assert (=> b!1432027 (=> (not res!965900) (not e!808426))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1432027 (= res!965900 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1432028 () Bool)

(declare-fun res!965902 () Bool)

(assert (=> b!1432028 (=> (not res!965902) (not e!808427))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1432028 (= res!965902 (validKeyInArray!0 (select (arr!47059 a!2831) j!81)))))

(declare-fun b!1432029 () Bool)

(declare-fun res!965896 () Bool)

(assert (=> b!1432029 (=> (not res!965896) (not e!808426))))

(declare-fun lt!630416 () SeekEntryResult!11338)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1432029 (= res!965896 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47059 a!2831) j!81) a!2831 mask!2608) lt!630416))))

(declare-fun res!965897 () Bool)

(assert (=> start!123532 (=> (not res!965897) (not e!808427))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123532 (= res!965897 (validMask!0 mask!2608))))

(assert (=> start!123532 e!808427))

(assert (=> start!123532 true))

(declare-fun array_inv!36087 (array!97504) Bool)

(assert (=> start!123532 (array_inv!36087 a!2831)))

(declare-fun b!1432030 () Bool)

(declare-fun e!808425 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97504 (_ BitVec 32)) SeekEntryResult!11338)

(assert (=> b!1432030 (= e!808425 (= (seekEntryOrOpen!0 (select (arr!47059 a!2831) j!81) a!2831 mask!2608) (Found!11338 j!81)))))

(declare-fun b!1432031 () Bool)

(assert (=> b!1432031 (= e!808427 e!808423)))

(declare-fun res!965894 () Bool)

(assert (=> b!1432031 (=> (not res!965894) (not e!808423))))

(assert (=> b!1432031 (= res!965894 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47059 a!2831) j!81) mask!2608) (select (arr!47059 a!2831) j!81) a!2831 mask!2608) lt!630416))))

(assert (=> b!1432031 (= lt!630416 (Intermediate!11338 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1432032 () Bool)

(declare-fun res!965890 () Bool)

(assert (=> b!1432032 (=> (not res!965890) (not e!808427))))

(declare-datatypes ((List!33569 0))(
  ( (Nil!33566) (Cons!33565 (h!34888 (_ BitVec 64)) (t!48263 List!33569)) )
))
(declare-fun arrayNoDuplicates!0 (array!97504 (_ BitVec 32) List!33569) Bool)

(assert (=> b!1432032 (= res!965890 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33566))))

(declare-fun b!1432033 () Bool)

(declare-fun res!965892 () Bool)

(assert (=> b!1432033 (=> (not res!965892) (not e!808426))))

(assert (=> b!1432033 (= res!965892 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630415 lt!630420 mask!2608) lt!630419))))

(declare-fun b!1432034 () Bool)

(declare-fun res!965899 () Bool)

(assert (=> b!1432034 (=> (not res!965899) (not e!808427))))

(assert (=> b!1432034 (= res!965899 (validKeyInArray!0 (select (arr!47059 a!2831) i!982)))))

(declare-fun b!1432035 () Bool)

(declare-fun res!965893 () Bool)

(assert (=> b!1432035 (=> (not res!965893) (not e!808427))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97504 (_ BitVec 32)) Bool)

(assert (=> b!1432035 (= res!965893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1432036 () Bool)

(declare-fun e!808422 () Bool)

(assert (=> b!1432036 (= e!808426 (not e!808422))))

(declare-fun res!965889 () Bool)

(assert (=> b!1432036 (=> res!965889 e!808422)))

(assert (=> b!1432036 (= res!965889 (or (= (select (arr!47059 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47059 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47059 a!2831) index!585) (select (arr!47059 a!2831) j!81)) (= (select (store (arr!47059 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1432036 e!808425))

(declare-fun res!965898 () Bool)

(assert (=> b!1432036 (=> (not res!965898) (not e!808425))))

(assert (=> b!1432036 (= res!965898 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48422 0))(
  ( (Unit!48423) )
))
(declare-fun lt!630418 () Unit!48422)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97504 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48422)

(assert (=> b!1432036 (= lt!630418 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1432037 () Bool)

(declare-fun res!965891 () Bool)

(assert (=> b!1432037 (=> (not res!965891) (not e!808427))))

(assert (=> b!1432037 (= res!965891 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47609 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47609 a!2831))))))

(declare-fun b!1432038 () Bool)

(assert (=> b!1432038 (= e!808422 true)))

(declare-fun lt!630417 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432038 (= lt!630417 (nextIndex!0 index!585 x!605 mask!2608))))

(assert (= (and start!123532 res!965897) b!1432025))

(assert (= (and b!1432025 res!965895) b!1432034))

(assert (= (and b!1432034 res!965899) b!1432028))

(assert (= (and b!1432028 res!965902) b!1432035))

(assert (= (and b!1432035 res!965893) b!1432032))

(assert (= (and b!1432032 res!965890) b!1432037))

(assert (= (and b!1432037 res!965891) b!1432031))

(assert (= (and b!1432031 res!965894) b!1432026))

(assert (= (and b!1432026 res!965901) b!1432029))

(assert (= (and b!1432029 res!965896) b!1432033))

(assert (= (and b!1432033 res!965892) b!1432027))

(assert (= (and b!1432027 res!965900) b!1432036))

(assert (= (and b!1432036 res!965898) b!1432030))

(assert (= (and b!1432036 (not res!965889)) b!1432038))

(declare-fun m!1321813 () Bool)

(assert (=> start!123532 m!1321813))

(declare-fun m!1321815 () Bool)

(assert (=> start!123532 m!1321815))

(declare-fun m!1321817 () Bool)

(assert (=> b!1432035 m!1321817))

(declare-fun m!1321819 () Bool)

(assert (=> b!1432030 m!1321819))

(assert (=> b!1432030 m!1321819))

(declare-fun m!1321821 () Bool)

(assert (=> b!1432030 m!1321821))

(assert (=> b!1432031 m!1321819))

(assert (=> b!1432031 m!1321819))

(declare-fun m!1321823 () Bool)

(assert (=> b!1432031 m!1321823))

(assert (=> b!1432031 m!1321823))

(assert (=> b!1432031 m!1321819))

(declare-fun m!1321825 () Bool)

(assert (=> b!1432031 m!1321825))

(declare-fun m!1321827 () Bool)

(assert (=> b!1432026 m!1321827))

(assert (=> b!1432026 m!1321827))

(declare-fun m!1321829 () Bool)

(assert (=> b!1432026 m!1321829))

(declare-fun m!1321831 () Bool)

(assert (=> b!1432026 m!1321831))

(declare-fun m!1321833 () Bool)

(assert (=> b!1432026 m!1321833))

(assert (=> b!1432028 m!1321819))

(assert (=> b!1432028 m!1321819))

(declare-fun m!1321835 () Bool)

(assert (=> b!1432028 m!1321835))

(assert (=> b!1432036 m!1321831))

(declare-fun m!1321837 () Bool)

(assert (=> b!1432036 m!1321837))

(declare-fun m!1321839 () Bool)

(assert (=> b!1432036 m!1321839))

(declare-fun m!1321841 () Bool)

(assert (=> b!1432036 m!1321841))

(assert (=> b!1432036 m!1321819))

(declare-fun m!1321843 () Bool)

(assert (=> b!1432036 m!1321843))

(declare-fun m!1321845 () Bool)

(assert (=> b!1432034 m!1321845))

(assert (=> b!1432034 m!1321845))

(declare-fun m!1321847 () Bool)

(assert (=> b!1432034 m!1321847))

(declare-fun m!1321849 () Bool)

(assert (=> b!1432032 m!1321849))

(declare-fun m!1321851 () Bool)

(assert (=> b!1432038 m!1321851))

(declare-fun m!1321853 () Bool)

(assert (=> b!1432033 m!1321853))

(assert (=> b!1432029 m!1321819))

(assert (=> b!1432029 m!1321819))

(declare-fun m!1321855 () Bool)

(assert (=> b!1432029 m!1321855))

(push 1)

(assert (not b!1432034))

(assert (not b!1432032))

(assert (not b!1432036))

(assert (not b!1432030))

(assert (not b!1432028))

(assert (not start!123532))

(assert (not b!1432029))

(assert (not b!1432038))

(assert (not b!1432035))

(assert (not b!1432026))

(assert (not b!1432031))

(assert (not b!1432033))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


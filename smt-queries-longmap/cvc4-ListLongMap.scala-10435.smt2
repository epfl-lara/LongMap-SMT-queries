; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122776 () Bool)

(assert start!122776)

(declare-fun b!1423263 () Bool)

(declare-fun e!804502 () Bool)

(declare-fun e!804506 () Bool)

(assert (=> b!1423263 (= e!804502 e!804506)))

(declare-fun res!958700 () Bool)

(assert (=> b!1423263 (=> (not res!958700) (not e!804506))))

(declare-datatypes ((SeekEntryResult!11173 0))(
  ( (MissingZero!11173 (index!47084 (_ BitVec 32))) (Found!11173 (index!47085 (_ BitVec 32))) (Intermediate!11173 (undefined!11985 Bool) (index!47086 (_ BitVec 32)) (x!128719 (_ BitVec 32))) (Undefined!11173) (MissingVacant!11173 (index!47087 (_ BitVec 32))) )
))
(declare-fun lt!627036 () SeekEntryResult!11173)

(declare-fun lt!627042 () (_ BitVec 64))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((array!97141 0))(
  ( (array!97142 (arr!46888 (Array (_ BitVec 32) (_ BitVec 64))) (size!47438 (_ BitVec 32))) )
))
(declare-fun lt!627040 () array!97141)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97141 (_ BitVec 32)) SeekEntryResult!11173)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423263 (= res!958700 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627042 mask!2608) lt!627042 lt!627040 mask!2608) lt!627036))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1423263 (= lt!627036 (Intermediate!11173 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun a!2831 () array!97141)

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1423263 (= lt!627042 (select (store (arr!46888 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1423263 (= lt!627040 (array!97142 (store (arr!46888 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47438 a!2831)))))

(declare-fun b!1423264 () Bool)

(declare-fun res!958707 () Bool)

(assert (=> b!1423264 (=> (not res!958707) (not e!804506))))

(declare-fun lt!627037 () SeekEntryResult!11173)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1423264 (= res!958707 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46888 a!2831) j!81) a!2831 mask!2608) lt!627037))))

(declare-fun b!1423265 () Bool)

(declare-fun res!958703 () Bool)

(declare-fun e!804500 () Bool)

(assert (=> b!1423265 (=> (not res!958703) (not e!804500))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1423265 (= res!958703 (validKeyInArray!0 (select (arr!46888 a!2831) j!81)))))

(declare-fun b!1423266 () Bool)

(declare-fun e!804504 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97141 (_ BitVec 32)) SeekEntryResult!11173)

(assert (=> b!1423266 (= e!804504 (= (seekEntryOrOpen!0 (select (arr!46888 a!2831) j!81) a!2831 mask!2608) (Found!11173 j!81)))))

(declare-fun b!1423267 () Bool)

(declare-fun e!804501 () Bool)

(assert (=> b!1423267 (= e!804501 true)))

(declare-fun lt!627041 () (_ BitVec 32))

(declare-fun lt!627039 () SeekEntryResult!11173)

(assert (=> b!1423267 (= lt!627039 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627041 lt!627042 lt!627040 mask!2608))))

(declare-fun res!958710 () Bool)

(assert (=> start!122776 (=> (not res!958710) (not e!804500))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122776 (= res!958710 (validMask!0 mask!2608))))

(assert (=> start!122776 e!804500))

(assert (=> start!122776 true))

(declare-fun array_inv!35916 (array!97141) Bool)

(assert (=> start!122776 (array_inv!35916 a!2831)))

(declare-fun b!1423268 () Bool)

(declare-fun res!958709 () Bool)

(assert (=> b!1423268 (=> res!958709 e!804501)))

(assert (=> b!1423268 (= res!958709 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627041 (select (arr!46888 a!2831) j!81) a!2831 mask!2608) lt!627037)))))

(declare-fun b!1423269 () Bool)

(declare-fun res!958701 () Bool)

(assert (=> b!1423269 (=> (not res!958701) (not e!804500))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1423269 (= res!958701 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47438 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47438 a!2831))))))

(declare-fun b!1423270 () Bool)

(declare-fun res!958698 () Bool)

(assert (=> b!1423270 (=> (not res!958698) (not e!804500))))

(assert (=> b!1423270 (= res!958698 (and (= (size!47438 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47438 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47438 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1423271 () Bool)

(declare-fun e!804505 () Bool)

(assert (=> b!1423271 (= e!804505 e!804501)))

(declare-fun res!958697 () Bool)

(assert (=> b!1423271 (=> res!958697 e!804501)))

(assert (=> b!1423271 (= res!958697 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627041 #b00000000000000000000000000000000) (bvsge lt!627041 (size!47438 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423271 (= lt!627041 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1423272 () Bool)

(declare-fun res!958702 () Bool)

(assert (=> b!1423272 (=> (not res!958702) (not e!804500))))

(declare-datatypes ((List!33398 0))(
  ( (Nil!33395) (Cons!33394 (h!34696 (_ BitVec 64)) (t!48092 List!33398)) )
))
(declare-fun arrayNoDuplicates!0 (array!97141 (_ BitVec 32) List!33398) Bool)

(assert (=> b!1423272 (= res!958702 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33395))))

(declare-fun b!1423273 () Bool)

(assert (=> b!1423273 (= e!804506 (not e!804505))))

(declare-fun res!958706 () Bool)

(assert (=> b!1423273 (=> res!958706 e!804505)))

(assert (=> b!1423273 (= res!958706 (or (= (select (arr!46888 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46888 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46888 a!2831) index!585) (select (arr!46888 a!2831) j!81)) (= (select (store (arr!46888 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1423273 e!804504))

(declare-fun res!958704 () Bool)

(assert (=> b!1423273 (=> (not res!958704) (not e!804504))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97141 (_ BitVec 32)) Bool)

(assert (=> b!1423273 (= res!958704 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48182 0))(
  ( (Unit!48183) )
))
(declare-fun lt!627038 () Unit!48182)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97141 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48182)

(assert (=> b!1423273 (= lt!627038 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1423274 () Bool)

(assert (=> b!1423274 (= e!804500 e!804502)))

(declare-fun res!958696 () Bool)

(assert (=> b!1423274 (=> (not res!958696) (not e!804502))))

(assert (=> b!1423274 (= res!958696 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46888 a!2831) j!81) mask!2608) (select (arr!46888 a!2831) j!81) a!2831 mask!2608) lt!627037))))

(assert (=> b!1423274 (= lt!627037 (Intermediate!11173 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1423275 () Bool)

(declare-fun res!958705 () Bool)

(assert (=> b!1423275 (=> (not res!958705) (not e!804506))))

(assert (=> b!1423275 (= res!958705 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627042 lt!627040 mask!2608) lt!627036))))

(declare-fun b!1423276 () Bool)

(declare-fun res!958699 () Bool)

(assert (=> b!1423276 (=> (not res!958699) (not e!804500))))

(assert (=> b!1423276 (= res!958699 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1423277 () Bool)

(declare-fun res!958708 () Bool)

(assert (=> b!1423277 (=> (not res!958708) (not e!804500))))

(assert (=> b!1423277 (= res!958708 (validKeyInArray!0 (select (arr!46888 a!2831) i!982)))))

(declare-fun b!1423278 () Bool)

(declare-fun res!958711 () Bool)

(assert (=> b!1423278 (=> (not res!958711) (not e!804506))))

(assert (=> b!1423278 (= res!958711 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(assert (= (and start!122776 res!958710) b!1423270))

(assert (= (and b!1423270 res!958698) b!1423277))

(assert (= (and b!1423277 res!958708) b!1423265))

(assert (= (and b!1423265 res!958703) b!1423276))

(assert (= (and b!1423276 res!958699) b!1423272))

(assert (= (and b!1423272 res!958702) b!1423269))

(assert (= (and b!1423269 res!958701) b!1423274))

(assert (= (and b!1423274 res!958696) b!1423263))

(assert (= (and b!1423263 res!958700) b!1423264))

(assert (= (and b!1423264 res!958707) b!1423275))

(assert (= (and b!1423275 res!958705) b!1423278))

(assert (= (and b!1423278 res!958711) b!1423273))

(assert (= (and b!1423273 res!958704) b!1423266))

(assert (= (and b!1423273 (not res!958706)) b!1423271))

(assert (= (and b!1423271 (not res!958697)) b!1423268))

(assert (= (and b!1423268 (not res!958709)) b!1423267))

(declare-fun m!1313811 () Bool)

(assert (=> b!1423271 m!1313811))

(declare-fun m!1313813 () Bool)

(assert (=> start!122776 m!1313813))

(declare-fun m!1313815 () Bool)

(assert (=> start!122776 m!1313815))

(declare-fun m!1313817 () Bool)

(assert (=> b!1423274 m!1313817))

(assert (=> b!1423274 m!1313817))

(declare-fun m!1313819 () Bool)

(assert (=> b!1423274 m!1313819))

(assert (=> b!1423274 m!1313819))

(assert (=> b!1423274 m!1313817))

(declare-fun m!1313821 () Bool)

(assert (=> b!1423274 m!1313821))

(declare-fun m!1313823 () Bool)

(assert (=> b!1423272 m!1313823))

(declare-fun m!1313825 () Bool)

(assert (=> b!1423275 m!1313825))

(declare-fun m!1313827 () Bool)

(assert (=> b!1423277 m!1313827))

(assert (=> b!1423277 m!1313827))

(declare-fun m!1313829 () Bool)

(assert (=> b!1423277 m!1313829))

(declare-fun m!1313831 () Bool)

(assert (=> b!1423263 m!1313831))

(assert (=> b!1423263 m!1313831))

(declare-fun m!1313833 () Bool)

(assert (=> b!1423263 m!1313833))

(declare-fun m!1313835 () Bool)

(assert (=> b!1423263 m!1313835))

(declare-fun m!1313837 () Bool)

(assert (=> b!1423263 m!1313837))

(assert (=> b!1423264 m!1313817))

(assert (=> b!1423264 m!1313817))

(declare-fun m!1313839 () Bool)

(assert (=> b!1423264 m!1313839))

(assert (=> b!1423273 m!1313835))

(declare-fun m!1313841 () Bool)

(assert (=> b!1423273 m!1313841))

(declare-fun m!1313843 () Bool)

(assert (=> b!1423273 m!1313843))

(declare-fun m!1313845 () Bool)

(assert (=> b!1423273 m!1313845))

(assert (=> b!1423273 m!1313817))

(declare-fun m!1313847 () Bool)

(assert (=> b!1423273 m!1313847))

(declare-fun m!1313849 () Bool)

(assert (=> b!1423267 m!1313849))

(assert (=> b!1423266 m!1313817))

(assert (=> b!1423266 m!1313817))

(declare-fun m!1313851 () Bool)

(assert (=> b!1423266 m!1313851))

(assert (=> b!1423265 m!1313817))

(assert (=> b!1423265 m!1313817))

(declare-fun m!1313853 () Bool)

(assert (=> b!1423265 m!1313853))

(assert (=> b!1423268 m!1313817))

(assert (=> b!1423268 m!1313817))

(declare-fun m!1313855 () Bool)

(assert (=> b!1423268 m!1313855))

(declare-fun m!1313857 () Bool)

(assert (=> b!1423276 m!1313857))

(push 1)


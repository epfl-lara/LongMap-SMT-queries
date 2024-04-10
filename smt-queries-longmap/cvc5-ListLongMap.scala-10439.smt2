; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122796 () Bool)

(assert start!122796)

(declare-fun b!1423743 () Bool)

(declare-fun res!959186 () Bool)

(declare-fun e!804716 () Bool)

(assert (=> b!1423743 (=> (not res!959186) (not e!804716))))

(declare-datatypes ((array!97161 0))(
  ( (array!97162 (arr!46898 (Array (_ BitVec 32) (_ BitVec 64))) (size!47448 (_ BitVec 32))) )
))
(declare-fun lt!627251 () array!97161)

(declare-datatypes ((SeekEntryResult!11183 0))(
  ( (MissingZero!11183 (index!47124 (_ BitVec 32))) (Found!11183 (index!47125 (_ BitVec 32))) (Intermediate!11183 (undefined!11995 Bool) (index!47126 (_ BitVec 32)) (x!128761 (_ BitVec 32))) (Undefined!11183) (MissingVacant!11183 (index!47127 (_ BitVec 32))) )
))
(declare-fun lt!627246 () SeekEntryResult!11183)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun lt!627248 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97161 (_ BitVec 32)) SeekEntryResult!11183)

(assert (=> b!1423743 (= res!959186 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627248 lt!627251 mask!2608) lt!627246))))

(declare-fun b!1423744 () Bool)

(declare-fun res!959189 () Bool)

(declare-fun e!804715 () Bool)

(assert (=> b!1423744 (=> res!959189 e!804715)))

(declare-fun lt!627249 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun a!2831 () array!97161)

(declare-fun lt!627250 () SeekEntryResult!11183)

(assert (=> b!1423744 (= res!959189 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627249 (select (arr!46898 a!2831) j!81) a!2831 mask!2608) lt!627250)))))

(declare-fun b!1423745 () Bool)

(declare-fun e!804710 () Bool)

(assert (=> b!1423745 (= e!804710 e!804715)))

(declare-fun res!959179 () Bool)

(assert (=> b!1423745 (=> res!959179 e!804715)))

(assert (=> b!1423745 (= res!959179 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627249 #b00000000000000000000000000000000) (bvsge lt!627249 (size!47448 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423745 (= lt!627249 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun res!959183 () Bool)

(declare-fun e!804711 () Bool)

(assert (=> start!122796 (=> (not res!959183) (not e!804711))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122796 (= res!959183 (validMask!0 mask!2608))))

(assert (=> start!122796 e!804711))

(assert (=> start!122796 true))

(declare-fun array_inv!35926 (array!97161) Bool)

(assert (=> start!122796 (array_inv!35926 a!2831)))

(declare-fun b!1423746 () Bool)

(declare-fun res!959188 () Bool)

(assert (=> b!1423746 (=> (not res!959188) (not e!804716))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1423746 (= res!959188 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1423747 () Bool)

(declare-fun res!959180 () Bool)

(assert (=> b!1423747 (=> (not res!959180) (not e!804711))))

(assert (=> b!1423747 (= res!959180 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47448 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47448 a!2831))))))

(declare-fun b!1423748 () Bool)

(declare-fun res!959191 () Bool)

(assert (=> b!1423748 (=> (not res!959191) (not e!804711))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97161 (_ BitVec 32)) Bool)

(assert (=> b!1423748 (= res!959191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1423749 () Bool)

(declare-fun res!959178 () Bool)

(assert (=> b!1423749 (=> (not res!959178) (not e!804711))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1423749 (= res!959178 (validKeyInArray!0 (select (arr!46898 a!2831) j!81)))))

(declare-fun b!1423750 () Bool)

(declare-fun e!804712 () Bool)

(assert (=> b!1423750 (= e!804711 e!804712)))

(declare-fun res!959177 () Bool)

(assert (=> b!1423750 (=> (not res!959177) (not e!804712))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423750 (= res!959177 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46898 a!2831) j!81) mask!2608) (select (arr!46898 a!2831) j!81) a!2831 mask!2608) lt!627250))))

(assert (=> b!1423750 (= lt!627250 (Intermediate!11183 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1423751 () Bool)

(declare-fun res!959185 () Bool)

(assert (=> b!1423751 (=> (not res!959185) (not e!804716))))

(assert (=> b!1423751 (= res!959185 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46898 a!2831) j!81) a!2831 mask!2608) lt!627250))))

(declare-fun b!1423752 () Bool)

(declare-fun e!804713 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97161 (_ BitVec 32)) SeekEntryResult!11183)

(assert (=> b!1423752 (= e!804713 (= (seekEntryOrOpen!0 (select (arr!46898 a!2831) j!81) a!2831 mask!2608) (Found!11183 j!81)))))

(declare-fun b!1423753 () Bool)

(assert (=> b!1423753 (= e!804715 true)))

(declare-fun lt!627247 () SeekEntryResult!11183)

(assert (=> b!1423753 (= lt!627247 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627249 lt!627248 lt!627251 mask!2608))))

(declare-fun b!1423754 () Bool)

(declare-fun res!959184 () Bool)

(assert (=> b!1423754 (=> (not res!959184) (not e!804711))))

(declare-datatypes ((List!33408 0))(
  ( (Nil!33405) (Cons!33404 (h!34706 (_ BitVec 64)) (t!48102 List!33408)) )
))
(declare-fun arrayNoDuplicates!0 (array!97161 (_ BitVec 32) List!33408) Bool)

(assert (=> b!1423754 (= res!959184 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33405))))

(declare-fun b!1423755 () Bool)

(declare-fun res!959176 () Bool)

(assert (=> b!1423755 (=> (not res!959176) (not e!804711))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1423755 (= res!959176 (and (= (size!47448 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47448 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47448 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1423756 () Bool)

(assert (=> b!1423756 (= e!804716 (not e!804710))))

(declare-fun res!959181 () Bool)

(assert (=> b!1423756 (=> res!959181 e!804710)))

(assert (=> b!1423756 (= res!959181 (or (= (select (arr!46898 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46898 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46898 a!2831) index!585) (select (arr!46898 a!2831) j!81)) (= (select (store (arr!46898 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1423756 e!804713))

(declare-fun res!959182 () Bool)

(assert (=> b!1423756 (=> (not res!959182) (not e!804713))))

(assert (=> b!1423756 (= res!959182 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48202 0))(
  ( (Unit!48203) )
))
(declare-fun lt!627252 () Unit!48202)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97161 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48202)

(assert (=> b!1423756 (= lt!627252 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1423757 () Bool)

(declare-fun res!959190 () Bool)

(assert (=> b!1423757 (=> (not res!959190) (not e!804711))))

(assert (=> b!1423757 (= res!959190 (validKeyInArray!0 (select (arr!46898 a!2831) i!982)))))

(declare-fun b!1423758 () Bool)

(assert (=> b!1423758 (= e!804712 e!804716)))

(declare-fun res!959187 () Bool)

(assert (=> b!1423758 (=> (not res!959187) (not e!804716))))

(assert (=> b!1423758 (= res!959187 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627248 mask!2608) lt!627248 lt!627251 mask!2608) lt!627246))))

(assert (=> b!1423758 (= lt!627246 (Intermediate!11183 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1423758 (= lt!627248 (select (store (arr!46898 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1423758 (= lt!627251 (array!97162 (store (arr!46898 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47448 a!2831)))))

(assert (= (and start!122796 res!959183) b!1423755))

(assert (= (and b!1423755 res!959176) b!1423757))

(assert (= (and b!1423757 res!959190) b!1423749))

(assert (= (and b!1423749 res!959178) b!1423748))

(assert (= (and b!1423748 res!959191) b!1423754))

(assert (= (and b!1423754 res!959184) b!1423747))

(assert (= (and b!1423747 res!959180) b!1423750))

(assert (= (and b!1423750 res!959177) b!1423758))

(assert (= (and b!1423758 res!959187) b!1423751))

(assert (= (and b!1423751 res!959185) b!1423743))

(assert (= (and b!1423743 res!959186) b!1423746))

(assert (= (and b!1423746 res!959188) b!1423756))

(assert (= (and b!1423756 res!959182) b!1423752))

(assert (= (and b!1423756 (not res!959181)) b!1423745))

(assert (= (and b!1423745 (not res!959179)) b!1423744))

(assert (= (and b!1423744 (not res!959189)) b!1423753))

(declare-fun m!1314291 () Bool)

(assert (=> b!1423744 m!1314291))

(assert (=> b!1423744 m!1314291))

(declare-fun m!1314293 () Bool)

(assert (=> b!1423744 m!1314293))

(declare-fun m!1314295 () Bool)

(assert (=> b!1423748 m!1314295))

(declare-fun m!1314297 () Bool)

(assert (=> b!1423745 m!1314297))

(assert (=> b!1423750 m!1314291))

(assert (=> b!1423750 m!1314291))

(declare-fun m!1314299 () Bool)

(assert (=> b!1423750 m!1314299))

(assert (=> b!1423750 m!1314299))

(assert (=> b!1423750 m!1314291))

(declare-fun m!1314301 () Bool)

(assert (=> b!1423750 m!1314301))

(assert (=> b!1423752 m!1314291))

(assert (=> b!1423752 m!1314291))

(declare-fun m!1314303 () Bool)

(assert (=> b!1423752 m!1314303))

(assert (=> b!1423749 m!1314291))

(assert (=> b!1423749 m!1314291))

(declare-fun m!1314305 () Bool)

(assert (=> b!1423749 m!1314305))

(declare-fun m!1314307 () Bool)

(assert (=> b!1423753 m!1314307))

(declare-fun m!1314309 () Bool)

(assert (=> b!1423754 m!1314309))

(declare-fun m!1314311 () Bool)

(assert (=> b!1423743 m!1314311))

(declare-fun m!1314313 () Bool)

(assert (=> start!122796 m!1314313))

(declare-fun m!1314315 () Bool)

(assert (=> start!122796 m!1314315))

(assert (=> b!1423751 m!1314291))

(assert (=> b!1423751 m!1314291))

(declare-fun m!1314317 () Bool)

(assert (=> b!1423751 m!1314317))

(declare-fun m!1314319 () Bool)

(assert (=> b!1423758 m!1314319))

(assert (=> b!1423758 m!1314319))

(declare-fun m!1314321 () Bool)

(assert (=> b!1423758 m!1314321))

(declare-fun m!1314323 () Bool)

(assert (=> b!1423758 m!1314323))

(declare-fun m!1314325 () Bool)

(assert (=> b!1423758 m!1314325))

(declare-fun m!1314327 () Bool)

(assert (=> b!1423757 m!1314327))

(assert (=> b!1423757 m!1314327))

(declare-fun m!1314329 () Bool)

(assert (=> b!1423757 m!1314329))

(assert (=> b!1423756 m!1314323))

(declare-fun m!1314331 () Bool)

(assert (=> b!1423756 m!1314331))

(declare-fun m!1314333 () Bool)

(assert (=> b!1423756 m!1314333))

(declare-fun m!1314335 () Bool)

(assert (=> b!1423756 m!1314335))

(assert (=> b!1423756 m!1314291))

(declare-fun m!1314337 () Bool)

(assert (=> b!1423756 m!1314337))

(push 1)


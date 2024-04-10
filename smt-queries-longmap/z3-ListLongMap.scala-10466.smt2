; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123014 () Bool)

(assert start!123014)

(declare-fun b!1426767 () Bool)

(declare-fun res!962009 () Bool)

(declare-fun e!805901 () Bool)

(assert (=> b!1426767 (=> (not res!962009) (not e!805901))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97328 0))(
  ( (array!97329 (arr!46980 (Array (_ BitVec 32) (_ BitVec 64))) (size!47530 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97328)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1426767 (= res!962009 (and (= (size!47530 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47530 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47530 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1426768 () Bool)

(declare-fun res!962008 () Bool)

(assert (=> b!1426768 (=> (not res!962008) (not e!805901))))

(declare-datatypes ((List!33490 0))(
  ( (Nil!33487) (Cons!33486 (h!34791 (_ BitVec 64)) (t!48184 List!33490)) )
))
(declare-fun arrayNoDuplicates!0 (array!97328 (_ BitVec 32) List!33490) Bool)

(assert (=> b!1426768 (= res!962008 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33487))))

(declare-fun b!1426769 () Bool)

(declare-fun res!961999 () Bool)

(declare-fun e!805903 () Bool)

(assert (=> b!1426769 (=> (not res!961999) (not e!805903))))

(declare-datatypes ((SeekEntryResult!11259 0))(
  ( (MissingZero!11259 (index!47428 (_ BitVec 32))) (Found!11259 (index!47429 (_ BitVec 32))) (Intermediate!11259 (undefined!12071 Bool) (index!47430 (_ BitVec 32)) (x!129059 (_ BitVec 32))) (Undefined!11259) (MissingVacant!11259 (index!47431 (_ BitVec 32))) )
))
(declare-fun lt!628298 () SeekEntryResult!11259)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97328 (_ BitVec 32)) SeekEntryResult!11259)

(assert (=> b!1426769 (= res!961999 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46980 a!2831) j!81) a!2831 mask!2608) lt!628298))))

(declare-fun res!962010 () Bool)

(assert (=> start!123014 (=> (not res!962010) (not e!805901))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123014 (= res!962010 (validMask!0 mask!2608))))

(assert (=> start!123014 e!805901))

(assert (=> start!123014 true))

(declare-fun array_inv!36008 (array!97328) Bool)

(assert (=> start!123014 (array_inv!36008 a!2831)))

(declare-fun b!1426770 () Bool)

(declare-fun res!962011 () Bool)

(assert (=> b!1426770 (=> (not res!962011) (not e!805901))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1426770 (= res!962011 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47530 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47530 a!2831))))))

(declare-fun b!1426771 () Bool)

(assert (=> b!1426771 (= e!805903 (not true))))

(declare-fun e!805900 () Bool)

(assert (=> b!1426771 e!805900))

(declare-fun res!962002 () Bool)

(assert (=> b!1426771 (=> (not res!962002) (not e!805900))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97328 (_ BitVec 32)) Bool)

(assert (=> b!1426771 (= res!962002 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48264 0))(
  ( (Unit!48265) )
))
(declare-fun lt!628299 () Unit!48264)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97328 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48264)

(assert (=> b!1426771 (= lt!628299 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1426772 () Bool)

(declare-fun res!962001 () Bool)

(assert (=> b!1426772 (=> (not res!962001) (not e!805903))))

(declare-fun lt!628302 () SeekEntryResult!11259)

(declare-fun lt!628301 () array!97328)

(declare-fun lt!628300 () (_ BitVec 64))

(assert (=> b!1426772 (= res!962001 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628300 lt!628301 mask!2608) lt!628302))))

(declare-fun b!1426773 () Bool)

(declare-fun res!962004 () Bool)

(assert (=> b!1426773 (=> (not res!962004) (not e!805901))))

(assert (=> b!1426773 (= res!962004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1426774 () Bool)

(declare-fun res!962003 () Bool)

(assert (=> b!1426774 (=> (not res!962003) (not e!805901))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1426774 (= res!962003 (validKeyInArray!0 (select (arr!46980 a!2831) i!982)))))

(declare-fun b!1426775 () Bool)

(declare-fun e!805902 () Bool)

(assert (=> b!1426775 (= e!805901 e!805902)))

(declare-fun res!962000 () Bool)

(assert (=> b!1426775 (=> (not res!962000) (not e!805902))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1426775 (= res!962000 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46980 a!2831) j!81) mask!2608) (select (arr!46980 a!2831) j!81) a!2831 mask!2608) lt!628298))))

(assert (=> b!1426775 (= lt!628298 (Intermediate!11259 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1426776 () Bool)

(declare-fun res!962007 () Bool)

(assert (=> b!1426776 (=> (not res!962007) (not e!805903))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1426776 (= res!962007 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1426777 () Bool)

(declare-fun res!962005 () Bool)

(assert (=> b!1426777 (=> (not res!962005) (not e!805901))))

(assert (=> b!1426777 (= res!962005 (validKeyInArray!0 (select (arr!46980 a!2831) j!81)))))

(declare-fun b!1426778 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97328 (_ BitVec 32)) SeekEntryResult!11259)

(assert (=> b!1426778 (= e!805900 (= (seekEntryOrOpen!0 (select (arr!46980 a!2831) j!81) a!2831 mask!2608) (Found!11259 j!81)))))

(declare-fun b!1426779 () Bool)

(assert (=> b!1426779 (= e!805902 e!805903)))

(declare-fun res!962006 () Bool)

(assert (=> b!1426779 (=> (not res!962006) (not e!805903))))

(assert (=> b!1426779 (= res!962006 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628300 mask!2608) lt!628300 lt!628301 mask!2608) lt!628302))))

(assert (=> b!1426779 (= lt!628302 (Intermediate!11259 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1426779 (= lt!628300 (select (store (arr!46980 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1426779 (= lt!628301 (array!97329 (store (arr!46980 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47530 a!2831)))))

(assert (= (and start!123014 res!962010) b!1426767))

(assert (= (and b!1426767 res!962009) b!1426774))

(assert (= (and b!1426774 res!962003) b!1426777))

(assert (= (and b!1426777 res!962005) b!1426773))

(assert (= (and b!1426773 res!962004) b!1426768))

(assert (= (and b!1426768 res!962008) b!1426770))

(assert (= (and b!1426770 res!962011) b!1426775))

(assert (= (and b!1426775 res!962000) b!1426779))

(assert (= (and b!1426779 res!962006) b!1426769))

(assert (= (and b!1426769 res!961999) b!1426772))

(assert (= (and b!1426772 res!962001) b!1426776))

(assert (= (and b!1426776 res!962007) b!1426771))

(assert (= (and b!1426771 res!962002) b!1426778))

(declare-fun m!1317263 () Bool)

(assert (=> b!1426768 m!1317263))

(declare-fun m!1317265 () Bool)

(assert (=> b!1426769 m!1317265))

(assert (=> b!1426769 m!1317265))

(declare-fun m!1317267 () Bool)

(assert (=> b!1426769 m!1317267))

(declare-fun m!1317269 () Bool)

(assert (=> b!1426771 m!1317269))

(declare-fun m!1317271 () Bool)

(assert (=> b!1426771 m!1317271))

(declare-fun m!1317273 () Bool)

(assert (=> start!123014 m!1317273))

(declare-fun m!1317275 () Bool)

(assert (=> start!123014 m!1317275))

(assert (=> b!1426777 m!1317265))

(assert (=> b!1426777 m!1317265))

(declare-fun m!1317277 () Bool)

(assert (=> b!1426777 m!1317277))

(assert (=> b!1426778 m!1317265))

(assert (=> b!1426778 m!1317265))

(declare-fun m!1317279 () Bool)

(assert (=> b!1426778 m!1317279))

(declare-fun m!1317281 () Bool)

(assert (=> b!1426773 m!1317281))

(declare-fun m!1317283 () Bool)

(assert (=> b!1426779 m!1317283))

(assert (=> b!1426779 m!1317283))

(declare-fun m!1317285 () Bool)

(assert (=> b!1426779 m!1317285))

(declare-fun m!1317287 () Bool)

(assert (=> b!1426779 m!1317287))

(declare-fun m!1317289 () Bool)

(assert (=> b!1426779 m!1317289))

(assert (=> b!1426775 m!1317265))

(assert (=> b!1426775 m!1317265))

(declare-fun m!1317291 () Bool)

(assert (=> b!1426775 m!1317291))

(assert (=> b!1426775 m!1317291))

(assert (=> b!1426775 m!1317265))

(declare-fun m!1317293 () Bool)

(assert (=> b!1426775 m!1317293))

(declare-fun m!1317295 () Bool)

(assert (=> b!1426772 m!1317295))

(declare-fun m!1317297 () Bool)

(assert (=> b!1426774 m!1317297))

(assert (=> b!1426774 m!1317297))

(declare-fun m!1317299 () Bool)

(assert (=> b!1426774 m!1317299))

(check-sat (not start!123014) (not b!1426773) (not b!1426772) (not b!1426775) (not b!1426769) (not b!1426774) (not b!1426768) (not b!1426778) (not b!1426779) (not b!1426771) (not b!1426777))
(check-sat)

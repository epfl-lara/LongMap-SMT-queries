; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122836 () Bool)

(assert start!122836)

(declare-fun b!1424703 () Bool)

(declare-fun e!805134 () Bool)

(assert (=> b!1424703 (= e!805134 true)))

(declare-datatypes ((SeekEntryResult!11203 0))(
  ( (MissingZero!11203 (index!47204 (_ BitVec 32))) (Found!11203 (index!47205 (_ BitVec 32))) (Intermediate!11203 (undefined!12015 Bool) (index!47206 (_ BitVec 32)) (x!128829 (_ BitVec 32))) (Undefined!11203) (MissingVacant!11203 (index!47207 (_ BitVec 32))) )
))
(declare-fun lt!627671 () SeekEntryResult!11203)

(declare-datatypes ((array!97201 0))(
  ( (array!97202 (arr!46918 (Array (_ BitVec 32) (_ BitVec 64))) (size!47468 (_ BitVec 32))) )
))
(declare-fun lt!627667 () array!97201)

(declare-fun lt!627669 () (_ BitVec 64))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun lt!627672 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97201 (_ BitVec 32)) SeekEntryResult!11203)

(assert (=> b!1424703 (= lt!627671 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627672 lt!627669 lt!627667 mask!2608))))

(declare-fun res!960138 () Bool)

(declare-fun e!805132 () Bool)

(assert (=> start!122836 (=> (not res!960138) (not e!805132))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122836 (= res!960138 (validMask!0 mask!2608))))

(assert (=> start!122836 e!805132))

(assert (=> start!122836 true))

(declare-fun a!2831 () array!97201)

(declare-fun array_inv!35946 (array!97201) Bool)

(assert (=> start!122836 (array_inv!35946 a!2831)))

(declare-fun b!1424704 () Bool)

(declare-fun e!805130 () Bool)

(declare-fun e!805131 () Bool)

(assert (=> b!1424704 (= e!805130 (not e!805131))))

(declare-fun res!960146 () Bool)

(assert (=> b!1424704 (=> res!960146 e!805131)))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1424704 (= res!960146 (or (= (select (arr!46918 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46918 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46918 a!2831) index!585) (select (arr!46918 a!2831) j!81)) (= (select (store (arr!46918 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!805135 () Bool)

(assert (=> b!1424704 e!805135))

(declare-fun res!960139 () Bool)

(assert (=> b!1424704 (=> (not res!960139) (not e!805135))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97201 (_ BitVec 32)) Bool)

(assert (=> b!1424704 (= res!960139 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48242 0))(
  ( (Unit!48243) )
))
(declare-fun lt!627666 () Unit!48242)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97201 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48242)

(assert (=> b!1424704 (= lt!627666 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1424705 () Bool)

(declare-fun res!960137 () Bool)

(assert (=> b!1424705 (=> (not res!960137) (not e!805132))))

(assert (=> b!1424705 (= res!960137 (and (= (size!47468 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47468 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47468 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1424706 () Bool)

(assert (=> b!1424706 (= e!805131 e!805134)))

(declare-fun res!960140 () Bool)

(assert (=> b!1424706 (=> res!960140 e!805134)))

(assert (=> b!1424706 (= res!960140 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627672 #b00000000000000000000000000000000) (bvsge lt!627672 (size!47468 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424706 (= lt!627672 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1424707 () Bool)

(declare-fun res!960148 () Bool)

(assert (=> b!1424707 (=> res!960148 e!805134)))

(declare-fun lt!627670 () SeekEntryResult!11203)

(assert (=> b!1424707 (= res!960148 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627672 (select (arr!46918 a!2831) j!81) a!2831 mask!2608) lt!627670)))))

(declare-fun b!1424708 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97201 (_ BitVec 32)) SeekEntryResult!11203)

(assert (=> b!1424708 (= e!805135 (= (seekEntryOrOpen!0 (select (arr!46918 a!2831) j!81) a!2831 mask!2608) (Found!11203 j!81)))))

(declare-fun b!1424709 () Bool)

(declare-fun e!805136 () Bool)

(assert (=> b!1424709 (= e!805132 e!805136)))

(declare-fun res!960149 () Bool)

(assert (=> b!1424709 (=> (not res!960149) (not e!805136))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424709 (= res!960149 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46918 a!2831) j!81) mask!2608) (select (arr!46918 a!2831) j!81) a!2831 mask!2608) lt!627670))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1424709 (= lt!627670 (Intermediate!11203 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1424710 () Bool)

(declare-fun res!960143 () Bool)

(assert (=> b!1424710 (=> (not res!960143) (not e!805130))))

(assert (=> b!1424710 (= res!960143 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46918 a!2831) j!81) a!2831 mask!2608) lt!627670))))

(declare-fun b!1424711 () Bool)

(declare-fun res!960136 () Bool)

(assert (=> b!1424711 (=> (not res!960136) (not e!805132))))

(assert (=> b!1424711 (= res!960136 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47468 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47468 a!2831))))))

(declare-fun b!1424712 () Bool)

(declare-fun res!960145 () Bool)

(assert (=> b!1424712 (=> (not res!960145) (not e!805130))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1424712 (= res!960145 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1424713 () Bool)

(declare-fun res!960151 () Bool)

(assert (=> b!1424713 (=> (not res!960151) (not e!805132))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1424713 (= res!960151 (validKeyInArray!0 (select (arr!46918 a!2831) j!81)))))

(declare-fun b!1424714 () Bool)

(declare-fun res!960142 () Bool)

(assert (=> b!1424714 (=> (not res!960142) (not e!805132))))

(assert (=> b!1424714 (= res!960142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1424715 () Bool)

(declare-fun res!960147 () Bool)

(assert (=> b!1424715 (=> (not res!960147) (not e!805132))))

(assert (=> b!1424715 (= res!960147 (validKeyInArray!0 (select (arr!46918 a!2831) i!982)))))

(declare-fun b!1424716 () Bool)

(assert (=> b!1424716 (= e!805136 e!805130)))

(declare-fun res!960150 () Bool)

(assert (=> b!1424716 (=> (not res!960150) (not e!805130))))

(declare-fun lt!627668 () SeekEntryResult!11203)

(assert (=> b!1424716 (= res!960150 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627669 mask!2608) lt!627669 lt!627667 mask!2608) lt!627668))))

(assert (=> b!1424716 (= lt!627668 (Intermediate!11203 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1424716 (= lt!627669 (select (store (arr!46918 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1424716 (= lt!627667 (array!97202 (store (arr!46918 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47468 a!2831)))))

(declare-fun b!1424717 () Bool)

(declare-fun res!960141 () Bool)

(assert (=> b!1424717 (=> (not res!960141) (not e!805132))))

(declare-datatypes ((List!33428 0))(
  ( (Nil!33425) (Cons!33424 (h!34726 (_ BitVec 64)) (t!48122 List!33428)) )
))
(declare-fun arrayNoDuplicates!0 (array!97201 (_ BitVec 32) List!33428) Bool)

(assert (=> b!1424717 (= res!960141 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33425))))

(declare-fun b!1424718 () Bool)

(declare-fun res!960144 () Bool)

(assert (=> b!1424718 (=> (not res!960144) (not e!805130))))

(assert (=> b!1424718 (= res!960144 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627669 lt!627667 mask!2608) lt!627668))))

(assert (= (and start!122836 res!960138) b!1424705))

(assert (= (and b!1424705 res!960137) b!1424715))

(assert (= (and b!1424715 res!960147) b!1424713))

(assert (= (and b!1424713 res!960151) b!1424714))

(assert (= (and b!1424714 res!960142) b!1424717))

(assert (= (and b!1424717 res!960141) b!1424711))

(assert (= (and b!1424711 res!960136) b!1424709))

(assert (= (and b!1424709 res!960149) b!1424716))

(assert (= (and b!1424716 res!960150) b!1424710))

(assert (= (and b!1424710 res!960143) b!1424718))

(assert (= (and b!1424718 res!960144) b!1424712))

(assert (= (and b!1424712 res!960145) b!1424704))

(assert (= (and b!1424704 res!960139) b!1424708))

(assert (= (and b!1424704 (not res!960146)) b!1424706))

(assert (= (and b!1424706 (not res!960140)) b!1424707))

(assert (= (and b!1424707 (not res!960148)) b!1424703))

(declare-fun m!1315251 () Bool)

(assert (=> start!122836 m!1315251))

(declare-fun m!1315253 () Bool)

(assert (=> start!122836 m!1315253))

(declare-fun m!1315255 () Bool)

(assert (=> b!1424716 m!1315255))

(assert (=> b!1424716 m!1315255))

(declare-fun m!1315257 () Bool)

(assert (=> b!1424716 m!1315257))

(declare-fun m!1315259 () Bool)

(assert (=> b!1424716 m!1315259))

(declare-fun m!1315261 () Bool)

(assert (=> b!1424716 m!1315261))

(declare-fun m!1315263 () Bool)

(assert (=> b!1424707 m!1315263))

(assert (=> b!1424707 m!1315263))

(declare-fun m!1315265 () Bool)

(assert (=> b!1424707 m!1315265))

(declare-fun m!1315267 () Bool)

(assert (=> b!1424718 m!1315267))

(assert (=> b!1424708 m!1315263))

(assert (=> b!1424708 m!1315263))

(declare-fun m!1315269 () Bool)

(assert (=> b!1424708 m!1315269))

(declare-fun m!1315271 () Bool)

(assert (=> b!1424703 m!1315271))

(assert (=> b!1424710 m!1315263))

(assert (=> b!1424710 m!1315263))

(declare-fun m!1315273 () Bool)

(assert (=> b!1424710 m!1315273))

(declare-fun m!1315275 () Bool)

(assert (=> b!1424717 m!1315275))

(declare-fun m!1315277 () Bool)

(assert (=> b!1424714 m!1315277))

(assert (=> b!1424713 m!1315263))

(assert (=> b!1424713 m!1315263))

(declare-fun m!1315279 () Bool)

(assert (=> b!1424713 m!1315279))

(declare-fun m!1315281 () Bool)

(assert (=> b!1424706 m!1315281))

(assert (=> b!1424709 m!1315263))

(assert (=> b!1424709 m!1315263))

(declare-fun m!1315283 () Bool)

(assert (=> b!1424709 m!1315283))

(assert (=> b!1424709 m!1315283))

(assert (=> b!1424709 m!1315263))

(declare-fun m!1315285 () Bool)

(assert (=> b!1424709 m!1315285))

(assert (=> b!1424704 m!1315259))

(declare-fun m!1315287 () Bool)

(assert (=> b!1424704 m!1315287))

(declare-fun m!1315289 () Bool)

(assert (=> b!1424704 m!1315289))

(declare-fun m!1315291 () Bool)

(assert (=> b!1424704 m!1315291))

(assert (=> b!1424704 m!1315263))

(declare-fun m!1315293 () Bool)

(assert (=> b!1424704 m!1315293))

(declare-fun m!1315295 () Bool)

(assert (=> b!1424715 m!1315295))

(assert (=> b!1424715 m!1315295))

(declare-fun m!1315297 () Bool)

(assert (=> b!1424715 m!1315297))

(push 1)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126548 () Bool)

(assert start!126548)

(declare-fun b!1485052 () Bool)

(declare-fun res!1009776 () Bool)

(declare-fun e!832574 () Bool)

(assert (=> b!1485052 (=> (not res!1009776) (not e!832574))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99510 0))(
  ( (array!99511 (arr!48031 (Array (_ BitVec 32) (_ BitVec 64))) (size!48581 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99510)

(assert (=> b!1485052 (= res!1009776 (and (= (size!48581 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48581 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48581 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1485053 () Bool)

(declare-fun e!832577 () Bool)

(declare-fun e!832568 () Bool)

(assert (=> b!1485053 (= e!832577 e!832568)))

(declare-fun res!1009780 () Bool)

(assert (=> b!1485053 (=> (not res!1009780) (not e!832568))))

(declare-fun lt!647965 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1485053 (= res!1009780 (and (= index!646 intermediateAfterIndex!19) (= lt!647965 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1485054 () Bool)

(declare-fun e!832576 () Bool)

(assert (=> b!1485054 (= e!832576 true)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!647970 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1485054 (= lt!647970 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1485055 () Bool)

(declare-fun res!1009785 () Bool)

(declare-fun e!832571 () Bool)

(assert (=> b!1485055 (=> (not res!1009785) (not e!832571))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1485055 (= res!1009785 (or (= (select (arr!48031 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48031 a!2862) intermediateBeforeIndex!19) (select (arr!48031 a!2862) j!93))))))

(declare-fun b!1485056 () Bool)

(declare-fun res!1009772 () Bool)

(assert (=> b!1485056 (=> (not res!1009772) (not e!832574))))

(declare-datatypes ((List!34532 0))(
  ( (Nil!34529) (Cons!34528 (h!35902 (_ BitVec 64)) (t!49226 List!34532)) )
))
(declare-fun arrayNoDuplicates!0 (array!99510 (_ BitVec 32) List!34532) Bool)

(assert (=> b!1485056 (= res!1009772 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34529))))

(declare-fun b!1485057 () Bool)

(declare-fun res!1009773 () Bool)

(assert (=> b!1485057 (=> (not res!1009773) (not e!832574))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1485057 (= res!1009773 (validKeyInArray!0 (select (arr!48031 a!2862) j!93)))))

(declare-fun res!1009787 () Bool)

(assert (=> start!126548 (=> (not res!1009787) (not e!832574))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126548 (= res!1009787 (validMask!0 mask!2687))))

(assert (=> start!126548 e!832574))

(assert (=> start!126548 true))

(declare-fun array_inv!37059 (array!99510) Bool)

(assert (=> start!126548 (array_inv!37059 a!2862)))

(declare-fun b!1485058 () Bool)

(declare-fun res!1009774 () Bool)

(declare-fun e!832573 () Bool)

(assert (=> b!1485058 (=> (not res!1009774) (not e!832573))))

(declare-fun e!832572 () Bool)

(assert (=> b!1485058 (= res!1009774 e!832572)))

(declare-fun c!137163 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1485058 (= c!137163 (bvsle x!665 intermediateAfterX!19))))

(declare-fun lt!647969 () array!99510)

(declare-fun b!1485059 () Bool)

(declare-fun lt!647968 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12271 0))(
  ( (MissingZero!12271 (index!51476 (_ BitVec 32))) (Found!12271 (index!51477 (_ BitVec 32))) (Intermediate!12271 (undefined!13083 Bool) (index!51478 (_ BitVec 32)) (x!133051 (_ BitVec 32))) (Undefined!12271) (MissingVacant!12271 (index!51479 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99510 (_ BitVec 32)) SeekEntryResult!12271)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99510 (_ BitVec 32)) SeekEntryResult!12271)

(assert (=> b!1485059 (= e!832568 (= (seekEntryOrOpen!0 lt!647968 lt!647969 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647968 lt!647969 mask!2687)))))

(declare-fun b!1485060 () Bool)

(assert (=> b!1485060 (= e!832573 (not e!832576))))

(declare-fun res!1009784 () Bool)

(assert (=> b!1485060 (=> res!1009784 e!832576)))

(assert (=> b!1485060 (= res!1009784 (or (and (= (select (arr!48031 a!2862) index!646) (select (store (arr!48031 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48031 a!2862) index!646) (select (arr!48031 a!2862) j!93))) (= (select (arr!48031 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1485060 e!832571))

(declare-fun res!1009781 () Bool)

(assert (=> b!1485060 (=> (not res!1009781) (not e!832571))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99510 (_ BitVec 32)) Bool)

(assert (=> b!1485060 (= res!1009781 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49882 0))(
  ( (Unit!49883) )
))
(declare-fun lt!647964 () Unit!49882)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99510 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49882)

(assert (=> b!1485060 (= lt!647964 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1485061 () Bool)

(declare-fun e!832575 () Bool)

(assert (=> b!1485061 (= e!832574 e!832575)))

(declare-fun res!1009783 () Bool)

(assert (=> b!1485061 (=> (not res!1009783) (not e!832575))))

(assert (=> b!1485061 (= res!1009783 (= (select (store (arr!48031 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1485061 (= lt!647969 (array!99511 (store (arr!48031 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48581 a!2862)))))

(declare-fun b!1485062 () Bool)

(declare-fun res!1009782 () Bool)

(declare-fun e!832569 () Bool)

(assert (=> b!1485062 (=> (not res!1009782) (not e!832569))))

(declare-fun lt!647966 () SeekEntryResult!12271)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99510 (_ BitVec 32)) SeekEntryResult!12271)

(assert (=> b!1485062 (= res!1009782 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48031 a!2862) j!93) a!2862 mask!2687) lt!647966))))

(declare-fun b!1485063 () Bool)

(declare-fun res!1009786 () Bool)

(assert (=> b!1485063 (=> (not res!1009786) (not e!832573))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1485063 (= res!1009786 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1485064 () Bool)

(assert (=> b!1485064 (= e!832575 e!832569)))

(declare-fun res!1009771 () Bool)

(assert (=> b!1485064 (=> (not res!1009771) (not e!832569))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1485064 (= res!1009771 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48031 a!2862) j!93) mask!2687) (select (arr!48031 a!2862) j!93) a!2862 mask!2687) lt!647966))))

(assert (=> b!1485064 (= lt!647966 (Intermediate!12271 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1485065 () Bool)

(assert (=> b!1485065 (= e!832569 e!832573)))

(declare-fun res!1009788 () Bool)

(assert (=> b!1485065 (=> (not res!1009788) (not e!832573))))

(declare-fun lt!647967 () SeekEntryResult!12271)

(assert (=> b!1485065 (= res!1009788 (= lt!647967 (Intermediate!12271 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1485065 (= lt!647967 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647968 mask!2687) lt!647968 lt!647969 mask!2687))))

(assert (=> b!1485065 (= lt!647968 (select (store (arr!48031 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1485066 () Bool)

(declare-fun res!1009777 () Bool)

(assert (=> b!1485066 (=> (not res!1009777) (not e!832574))))

(assert (=> b!1485066 (= res!1009777 (validKeyInArray!0 (select (arr!48031 a!2862) i!1006)))))

(declare-fun b!1485067 () Bool)

(declare-fun res!1009789 () Bool)

(assert (=> b!1485067 (=> (not res!1009789) (not e!832574))))

(assert (=> b!1485067 (= res!1009789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1485068 () Bool)

(assert (=> b!1485068 (= e!832572 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647968 lt!647969 mask!2687) (seekEntryOrOpen!0 lt!647968 lt!647969 mask!2687)))))

(declare-fun b!1485069 () Bool)

(assert (=> b!1485069 (= e!832571 e!832577)))

(declare-fun res!1009779 () Bool)

(assert (=> b!1485069 (=> res!1009779 e!832577)))

(assert (=> b!1485069 (= res!1009779 (or (and (= (select (arr!48031 a!2862) index!646) lt!647965) (= (select (arr!48031 a!2862) index!646) (select (arr!48031 a!2862) j!93))) (= (select (arr!48031 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1485069 (= lt!647965 (select (store (arr!48031 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1485070 () Bool)

(declare-fun res!1009778 () Bool)

(assert (=> b!1485070 (=> (not res!1009778) (not e!832571))))

(assert (=> b!1485070 (= res!1009778 (= (seekEntryOrOpen!0 (select (arr!48031 a!2862) j!93) a!2862 mask!2687) (Found!12271 j!93)))))

(declare-fun b!1485071 () Bool)

(declare-fun res!1009775 () Bool)

(assert (=> b!1485071 (=> (not res!1009775) (not e!832574))))

(assert (=> b!1485071 (= res!1009775 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48581 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48581 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48581 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1485072 () Bool)

(assert (=> b!1485072 (= e!832572 (= lt!647967 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647968 lt!647969 mask!2687)))))

(assert (= (and start!126548 res!1009787) b!1485052))

(assert (= (and b!1485052 res!1009776) b!1485066))

(assert (= (and b!1485066 res!1009777) b!1485057))

(assert (= (and b!1485057 res!1009773) b!1485067))

(assert (= (and b!1485067 res!1009789) b!1485056))

(assert (= (and b!1485056 res!1009772) b!1485071))

(assert (= (and b!1485071 res!1009775) b!1485061))

(assert (= (and b!1485061 res!1009783) b!1485064))

(assert (= (and b!1485064 res!1009771) b!1485062))

(assert (= (and b!1485062 res!1009782) b!1485065))

(assert (= (and b!1485065 res!1009788) b!1485058))

(assert (= (and b!1485058 c!137163) b!1485072))

(assert (= (and b!1485058 (not c!137163)) b!1485068))

(assert (= (and b!1485058 res!1009774) b!1485063))

(assert (= (and b!1485063 res!1009786) b!1485060))

(assert (= (and b!1485060 res!1009781) b!1485070))

(assert (= (and b!1485070 res!1009778) b!1485055))

(assert (= (and b!1485055 res!1009785) b!1485069))

(assert (= (and b!1485069 (not res!1009779)) b!1485053))

(assert (= (and b!1485053 res!1009780) b!1485059))

(assert (= (and b!1485060 (not res!1009784)) b!1485054))

(declare-fun m!1370253 () Bool)

(assert (=> b!1485055 m!1370253))

(declare-fun m!1370255 () Bool)

(assert (=> b!1485055 m!1370255))

(declare-fun m!1370257 () Bool)

(assert (=> b!1485065 m!1370257))

(assert (=> b!1485065 m!1370257))

(declare-fun m!1370259 () Bool)

(assert (=> b!1485065 m!1370259))

(declare-fun m!1370261 () Bool)

(assert (=> b!1485065 m!1370261))

(declare-fun m!1370263 () Bool)

(assert (=> b!1485065 m!1370263))

(declare-fun m!1370265 () Bool)

(assert (=> b!1485060 m!1370265))

(assert (=> b!1485060 m!1370261))

(declare-fun m!1370267 () Bool)

(assert (=> b!1485060 m!1370267))

(declare-fun m!1370269 () Bool)

(assert (=> b!1485060 m!1370269))

(declare-fun m!1370271 () Bool)

(assert (=> b!1485060 m!1370271))

(assert (=> b!1485060 m!1370255))

(declare-fun m!1370273 () Bool)

(assert (=> b!1485056 m!1370273))

(assert (=> b!1485061 m!1370261))

(declare-fun m!1370275 () Bool)

(assert (=> b!1485061 m!1370275))

(assert (=> b!1485057 m!1370255))

(assert (=> b!1485057 m!1370255))

(declare-fun m!1370277 () Bool)

(assert (=> b!1485057 m!1370277))

(assert (=> b!1485064 m!1370255))

(assert (=> b!1485064 m!1370255))

(declare-fun m!1370279 () Bool)

(assert (=> b!1485064 m!1370279))

(assert (=> b!1485064 m!1370279))

(assert (=> b!1485064 m!1370255))

(declare-fun m!1370281 () Bool)

(assert (=> b!1485064 m!1370281))

(declare-fun m!1370283 () Bool)

(assert (=> b!1485072 m!1370283))

(assert (=> b!1485062 m!1370255))

(assert (=> b!1485062 m!1370255))

(declare-fun m!1370285 () Bool)

(assert (=> b!1485062 m!1370285))

(assert (=> b!1485070 m!1370255))

(assert (=> b!1485070 m!1370255))

(declare-fun m!1370287 () Bool)

(assert (=> b!1485070 m!1370287))

(declare-fun m!1370289 () Bool)

(assert (=> b!1485066 m!1370289))

(assert (=> b!1485066 m!1370289))

(declare-fun m!1370291 () Bool)

(assert (=> b!1485066 m!1370291))

(declare-fun m!1370293 () Bool)

(assert (=> b!1485067 m!1370293))

(declare-fun m!1370295 () Bool)

(assert (=> b!1485068 m!1370295))

(declare-fun m!1370297 () Bool)

(assert (=> b!1485068 m!1370297))

(declare-fun m!1370299 () Bool)

(assert (=> start!126548 m!1370299))

(declare-fun m!1370301 () Bool)

(assert (=> start!126548 m!1370301))

(declare-fun m!1370303 () Bool)

(assert (=> b!1485054 m!1370303))

(assert (=> b!1485059 m!1370297))

(assert (=> b!1485059 m!1370295))

(assert (=> b!1485069 m!1370269))

(assert (=> b!1485069 m!1370255))

(assert (=> b!1485069 m!1370261))

(assert (=> b!1485069 m!1370267))

(push 1)


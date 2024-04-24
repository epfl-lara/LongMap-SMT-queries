; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127188 () Bool)

(assert start!127188)

(declare-fun b!1493090 () Bool)

(declare-fun res!1015170 () Bool)

(declare-fun e!836669 () Bool)

(assert (=> b!1493090 (=> (not res!1015170) (not e!836669))))

(declare-datatypes ((array!99799 0))(
  ( (array!99800 (arr!48166 (Array (_ BitVec 32) (_ BitVec 64))) (size!48717 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99799)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99799 (_ BitVec 32)) Bool)

(assert (=> b!1493090 (= res!1015170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1493091 () Bool)

(declare-fun res!1015168 () Bool)

(declare-fun e!836666 () Bool)

(assert (=> b!1493091 (=> (not res!1015168) (not e!836666))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1493091 (= res!1015168 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1493093 () Bool)

(declare-fun res!1015173 () Bool)

(assert (=> b!1493093 (=> (not res!1015173) (not e!836669))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1493093 (= res!1015173 (and (= (size!48717 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48717 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48717 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1493094 () Bool)

(declare-fun lt!650899 () array!99799)

(declare-fun e!836663 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!650895 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12303 0))(
  ( (MissingZero!12303 (index!51604 (_ BitVec 32))) (Found!12303 (index!51605 (_ BitVec 32))) (Intermediate!12303 (undefined!13115 Bool) (index!51606 (_ BitVec 32)) (x!133376 (_ BitVec 32))) (Undefined!12303) (MissingVacant!12303 (index!51607 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99799 (_ BitVec 32)) SeekEntryResult!12303)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99799 (_ BitVec 32)) SeekEntryResult!12303)

(assert (=> b!1493094 (= e!836663 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650895 lt!650899 mask!2687) (seekEntryOrOpen!0 lt!650895 lt!650899 mask!2687)))))

(declare-fun b!1493095 () Bool)

(declare-fun res!1015181 () Bool)

(declare-fun e!836667 () Bool)

(assert (=> b!1493095 (=> (not res!1015181) (not e!836667))))

(declare-fun lt!650896 () SeekEntryResult!12303)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99799 (_ BitVec 32)) SeekEntryResult!12303)

(assert (=> b!1493095 (= res!1015181 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48166 a!2862) j!93) a!2862 mask!2687) lt!650896))))

(declare-fun lt!650897 () SeekEntryResult!12303)

(declare-fun b!1493096 () Bool)

(assert (=> b!1493096 (= e!836663 (= lt!650897 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650895 lt!650899 mask!2687)))))

(declare-fun b!1493097 () Bool)

(declare-fun e!836670 () Bool)

(assert (=> b!1493097 (= e!836666 (not e!836670))))

(declare-fun res!1015166 () Bool)

(assert (=> b!1493097 (=> res!1015166 e!836670)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1493097 (= res!1015166 (or (and (= (select (arr!48166 a!2862) index!646) (select (store (arr!48166 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48166 a!2862) index!646) (select (arr!48166 a!2862) j!93))) (= (select (arr!48166 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!836665 () Bool)

(assert (=> b!1493097 e!836665))

(declare-fun res!1015175 () Bool)

(assert (=> b!1493097 (=> (not res!1015175) (not e!836665))))

(assert (=> b!1493097 (= res!1015175 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49979 0))(
  ( (Unit!49980) )
))
(declare-fun lt!650894 () Unit!49979)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99799 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49979)

(assert (=> b!1493097 (= lt!650894 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1493098 () Bool)

(declare-fun res!1015171 () Bool)

(assert (=> b!1493098 (=> (not res!1015171) (not e!836669))))

(declare-datatypes ((List!34654 0))(
  ( (Nil!34651) (Cons!34650 (h!36047 (_ BitVec 64)) (t!49340 List!34654)) )
))
(declare-fun arrayNoDuplicates!0 (array!99799 (_ BitVec 32) List!34654) Bool)

(assert (=> b!1493098 (= res!1015171 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34651))))

(declare-fun b!1493099 () Bool)

(declare-fun res!1015172 () Bool)

(assert (=> b!1493099 (=> (not res!1015172) (not e!836665))))

(assert (=> b!1493099 (= res!1015172 (= (seekEntryOrOpen!0 (select (arr!48166 a!2862) j!93) a!2862 mask!2687) (Found!12303 j!93)))))

(declare-fun b!1493100 () Bool)

(declare-fun e!836668 () Bool)

(assert (=> b!1493100 (= e!836668 e!836667)))

(declare-fun res!1015167 () Bool)

(assert (=> b!1493100 (=> (not res!1015167) (not e!836667))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493100 (= res!1015167 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48166 a!2862) j!93) mask!2687) (select (arr!48166 a!2862) j!93) a!2862 mask!2687) lt!650896))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1493100 (= lt!650896 (Intermediate!12303 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1493101 () Bool)

(declare-fun res!1015169 () Bool)

(assert (=> b!1493101 (=> (not res!1015169) (not e!836666))))

(assert (=> b!1493101 (= res!1015169 e!836663)))

(declare-fun c!138499 () Bool)

(assert (=> b!1493101 (= c!138499 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!1015178 () Bool)

(assert (=> start!127188 (=> (not res!1015178) (not e!836669))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127188 (= res!1015178 (validMask!0 mask!2687))))

(assert (=> start!127188 e!836669))

(assert (=> start!127188 true))

(declare-fun array_inv!37447 (array!99799) Bool)

(assert (=> start!127188 (array_inv!37447 a!2862)))

(declare-fun b!1493092 () Bool)

(declare-fun res!1015174 () Bool)

(assert (=> b!1493092 (=> (not res!1015174) (not e!836669))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1493092 (= res!1015174 (validKeyInArray!0 (select (arr!48166 a!2862) j!93)))))

(declare-fun b!1493102 () Bool)

(declare-fun res!1015176 () Bool)

(assert (=> b!1493102 (=> (not res!1015176) (not e!836669))))

(assert (=> b!1493102 (= res!1015176 (validKeyInArray!0 (select (arr!48166 a!2862) i!1006)))))

(declare-fun b!1493103 () Bool)

(assert (=> b!1493103 (= e!836665 (or (= (select (arr!48166 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48166 a!2862) intermediateBeforeIndex!19) (select (arr!48166 a!2862) j!93))))))

(declare-fun b!1493104 () Bool)

(assert (=> b!1493104 (= e!836670 true)))

(declare-fun lt!650898 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493104 (= lt!650898 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1493105 () Bool)

(declare-fun res!1015179 () Bool)

(assert (=> b!1493105 (=> (not res!1015179) (not e!836669))))

(assert (=> b!1493105 (= res!1015179 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48717 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48717 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48717 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1493106 () Bool)

(assert (=> b!1493106 (= e!836669 e!836668)))

(declare-fun res!1015177 () Bool)

(assert (=> b!1493106 (=> (not res!1015177) (not e!836668))))

(assert (=> b!1493106 (= res!1015177 (= (select (store (arr!48166 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1493106 (= lt!650899 (array!99800 (store (arr!48166 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48717 a!2862)))))

(declare-fun b!1493107 () Bool)

(assert (=> b!1493107 (= e!836667 e!836666)))

(declare-fun res!1015180 () Bool)

(assert (=> b!1493107 (=> (not res!1015180) (not e!836666))))

(assert (=> b!1493107 (= res!1015180 (= lt!650897 (Intermediate!12303 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1493107 (= lt!650897 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650895 mask!2687) lt!650895 lt!650899 mask!2687))))

(assert (=> b!1493107 (= lt!650895 (select (store (arr!48166 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!127188 res!1015178) b!1493093))

(assert (= (and b!1493093 res!1015173) b!1493102))

(assert (= (and b!1493102 res!1015176) b!1493092))

(assert (= (and b!1493092 res!1015174) b!1493090))

(assert (= (and b!1493090 res!1015170) b!1493098))

(assert (= (and b!1493098 res!1015171) b!1493105))

(assert (= (and b!1493105 res!1015179) b!1493106))

(assert (= (and b!1493106 res!1015177) b!1493100))

(assert (= (and b!1493100 res!1015167) b!1493095))

(assert (= (and b!1493095 res!1015181) b!1493107))

(assert (= (and b!1493107 res!1015180) b!1493101))

(assert (= (and b!1493101 c!138499) b!1493096))

(assert (= (and b!1493101 (not c!138499)) b!1493094))

(assert (= (and b!1493101 res!1015169) b!1493091))

(assert (= (and b!1493091 res!1015168) b!1493097))

(assert (= (and b!1493097 res!1015175) b!1493099))

(assert (= (and b!1493099 res!1015172) b!1493103))

(assert (= (and b!1493097 (not res!1015166)) b!1493104))

(declare-fun m!1377211 () Bool)

(assert (=> b!1493106 m!1377211))

(declare-fun m!1377213 () Bool)

(assert (=> b!1493106 m!1377213))

(declare-fun m!1377215 () Bool)

(assert (=> start!127188 m!1377215))

(declare-fun m!1377217 () Bool)

(assert (=> start!127188 m!1377217))

(declare-fun m!1377219 () Bool)

(assert (=> b!1493098 m!1377219))

(declare-fun m!1377221 () Bool)

(assert (=> b!1493095 m!1377221))

(assert (=> b!1493095 m!1377221))

(declare-fun m!1377223 () Bool)

(assert (=> b!1493095 m!1377223))

(assert (=> b!1493099 m!1377221))

(assert (=> b!1493099 m!1377221))

(declare-fun m!1377225 () Bool)

(assert (=> b!1493099 m!1377225))

(declare-fun m!1377227 () Bool)

(assert (=> b!1493103 m!1377227))

(assert (=> b!1493103 m!1377221))

(declare-fun m!1377229 () Bool)

(assert (=> b!1493097 m!1377229))

(assert (=> b!1493097 m!1377211))

(declare-fun m!1377231 () Bool)

(assert (=> b!1493097 m!1377231))

(declare-fun m!1377233 () Bool)

(assert (=> b!1493097 m!1377233))

(declare-fun m!1377235 () Bool)

(assert (=> b!1493097 m!1377235))

(assert (=> b!1493097 m!1377221))

(assert (=> b!1493092 m!1377221))

(assert (=> b!1493092 m!1377221))

(declare-fun m!1377237 () Bool)

(assert (=> b!1493092 m!1377237))

(declare-fun m!1377239 () Bool)

(assert (=> b!1493096 m!1377239))

(declare-fun m!1377241 () Bool)

(assert (=> b!1493102 m!1377241))

(assert (=> b!1493102 m!1377241))

(declare-fun m!1377243 () Bool)

(assert (=> b!1493102 m!1377243))

(declare-fun m!1377245 () Bool)

(assert (=> b!1493094 m!1377245))

(declare-fun m!1377247 () Bool)

(assert (=> b!1493094 m!1377247))

(assert (=> b!1493100 m!1377221))

(assert (=> b!1493100 m!1377221))

(declare-fun m!1377249 () Bool)

(assert (=> b!1493100 m!1377249))

(assert (=> b!1493100 m!1377249))

(assert (=> b!1493100 m!1377221))

(declare-fun m!1377251 () Bool)

(assert (=> b!1493100 m!1377251))

(declare-fun m!1377253 () Bool)

(assert (=> b!1493090 m!1377253))

(declare-fun m!1377255 () Bool)

(assert (=> b!1493107 m!1377255))

(assert (=> b!1493107 m!1377255))

(declare-fun m!1377257 () Bool)

(assert (=> b!1493107 m!1377257))

(assert (=> b!1493107 m!1377211))

(declare-fun m!1377259 () Bool)

(assert (=> b!1493107 m!1377259))

(declare-fun m!1377261 () Bool)

(assert (=> b!1493104 m!1377261))

(check-sat (not b!1493095) (not b!1493100) (not b!1493090) (not b!1493107) (not b!1493092) (not b!1493096) (not b!1493098) (not b!1493104) (not b!1493097) (not b!1493099) (not b!1493102) (not start!127188) (not b!1493094))
(check-sat)

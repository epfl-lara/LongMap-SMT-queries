; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124974 () Bool)

(assert start!124974)

(declare-fun b!1448101 () Bool)

(declare-fun e!815681 () Bool)

(assert (=> b!1448101 (= e!815681 true)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11592 0))(
  ( (MissingZero!11592 (index!48760 (_ BitVec 32))) (Found!11592 (index!48761 (_ BitVec 32))) (Intermediate!11592 (undefined!12404 Bool) (index!48762 (_ BitVec 32)) (x!130617 (_ BitVec 32))) (Undefined!11592) (MissingVacant!11592 (index!48763 (_ BitVec 32))) )
))
(declare-fun lt!635396 () SeekEntryResult!11592)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98317 0))(
  ( (array!98318 (arr!47443 (Array (_ BitVec 32) (_ BitVec 64))) (size!47994 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98317)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98317 (_ BitVec 32)) SeekEntryResult!11592)

(assert (=> b!1448101 (= lt!635396 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47443 a!2862) j!93) a!2862 mask!2687))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun b!1448102 () Bool)

(declare-fun e!815680 () Bool)

(assert (=> b!1448102 (= e!815680 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1448103 () Bool)

(declare-fun res!979012 () Bool)

(declare-fun e!815682 () Bool)

(assert (=> b!1448103 (=> (not res!979012) (not e!815682))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1448103 (= res!979012 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1448104 () Bool)

(declare-fun res!979001 () Bool)

(declare-fun e!815678 () Bool)

(assert (=> b!1448104 (=> (not res!979001) (not e!815678))))

(assert (=> b!1448104 (= res!979001 (and (= (size!47994 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47994 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47994 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1448105 () Bool)

(declare-fun res!979000 () Bool)

(assert (=> b!1448105 (=> (not res!979000) (not e!815678))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1448105 (= res!979000 (validKeyInArray!0 (select (arr!47443 a!2862) i!1006)))))

(declare-fun b!1448106 () Bool)

(declare-fun res!979009 () Bool)

(declare-fun e!815676 () Bool)

(assert (=> b!1448106 (=> (not res!979009) (not e!815676))))

(declare-fun lt!635399 () SeekEntryResult!11592)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98317 (_ BitVec 32)) SeekEntryResult!11592)

(assert (=> b!1448106 (= res!979009 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47443 a!2862) j!93) a!2862 mask!2687) lt!635399))))

(declare-fun res!979002 () Bool)

(assert (=> start!124974 (=> (not res!979002) (not e!815678))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124974 (= res!979002 (validMask!0 mask!2687))))

(assert (=> start!124974 e!815678))

(assert (=> start!124974 true))

(declare-fun array_inv!36724 (array!98317) Bool)

(assert (=> start!124974 (array_inv!36724 a!2862)))

(declare-fun e!815677 () Bool)

(declare-fun b!1448107 () Bool)

(declare-fun lt!635400 () SeekEntryResult!11592)

(declare-fun lt!635395 () (_ BitVec 64))

(declare-fun lt!635397 () array!98317)

(assert (=> b!1448107 (= e!815677 (= lt!635400 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635395 lt!635397 mask!2687)))))

(declare-fun b!1448108 () Bool)

(declare-fun e!815679 () Bool)

(assert (=> b!1448108 (= e!815678 e!815679)))

(declare-fun res!979004 () Bool)

(assert (=> b!1448108 (=> (not res!979004) (not e!815679))))

(assert (=> b!1448108 (= res!979004 (= (select (store (arr!47443 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1448108 (= lt!635397 (array!98318 (store (arr!47443 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47994 a!2862)))))

(declare-fun b!1448109 () Bool)

(declare-fun e!815673 () Bool)

(declare-fun e!815674 () Bool)

(assert (=> b!1448109 (= e!815673 e!815674)))

(declare-fun res!978999 () Bool)

(assert (=> b!1448109 (=> res!978999 e!815674)))

(assert (=> b!1448109 (= res!978999 (or (and (= (select (arr!47443 a!2862) index!646) (select (store (arr!47443 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47443 a!2862) index!646) (select (arr!47443 a!2862) j!93))) (not (= (select (arr!47443 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1448110 () Bool)

(assert (=> b!1448110 (= e!815679 e!815676)))

(declare-fun res!979010 () Bool)

(assert (=> b!1448110 (=> (not res!979010) (not e!815676))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1448110 (= res!979010 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47443 a!2862) j!93) mask!2687) (select (arr!47443 a!2862) j!93) a!2862 mask!2687) lt!635399))))

(assert (=> b!1448110 (= lt!635399 (Intermediate!11592 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1448111 () Bool)

(assert (=> b!1448111 (= e!815676 e!815682)))

(declare-fun res!979003 () Bool)

(assert (=> b!1448111 (=> (not res!979003) (not e!815682))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1448111 (= res!979003 (= lt!635400 (Intermediate!11592 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1448111 (= lt!635400 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635395 mask!2687) lt!635395 lt!635397 mask!2687))))

(assert (=> b!1448111 (= lt!635395 (select (store (arr!47443 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1448112 () Bool)

(declare-fun res!979011 () Bool)

(assert (=> b!1448112 (=> (not res!979011) (not e!815678))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98317 (_ BitVec 32)) Bool)

(assert (=> b!1448112 (= res!979011 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1448113 () Bool)

(declare-fun res!978997 () Bool)

(assert (=> b!1448113 (=> (not res!978997) (not e!815678))))

(declare-datatypes ((List!33931 0))(
  ( (Nil!33928) (Cons!33927 (h!35288 (_ BitVec 64)) (t!48617 List!33931)) )
))
(declare-fun arrayNoDuplicates!0 (array!98317 (_ BitVec 32) List!33931) Bool)

(assert (=> b!1448113 (= res!978997 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33928))))

(declare-fun b!1448114 () Bool)

(assert (=> b!1448114 (= e!815682 (not e!815681))))

(declare-fun res!979013 () Bool)

(assert (=> b!1448114 (=> res!979013 e!815681)))

(assert (=> b!1448114 (= res!979013 (or (and (= (select (arr!47443 a!2862) index!646) (select (store (arr!47443 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47443 a!2862) index!646) (select (arr!47443 a!2862) j!93))) (not (= (select (arr!47443 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47443 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1448114 e!815673))

(declare-fun res!979006 () Bool)

(assert (=> b!1448114 (=> (not res!979006) (not e!815673))))

(declare-fun lt!635398 () SeekEntryResult!11592)

(assert (=> b!1448114 (= res!979006 (and (= lt!635398 (Found!11592 j!93)) (or (= (select (arr!47443 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47443 a!2862) intermediateBeforeIndex!19) (select (arr!47443 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98317 (_ BitVec 32)) SeekEntryResult!11592)

(assert (=> b!1448114 (= lt!635398 (seekEntryOrOpen!0 (select (arr!47443 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1448114 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48713 0))(
  ( (Unit!48714) )
))
(declare-fun lt!635401 () Unit!48713)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98317 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48713)

(assert (=> b!1448114 (= lt!635401 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1448115 () Bool)

(declare-fun res!979007 () Bool)

(assert (=> b!1448115 (=> (not res!979007) (not e!815682))))

(assert (=> b!1448115 (= res!979007 e!815677)))

(declare-fun c!134071 () Bool)

(assert (=> b!1448115 (= c!134071 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1448116 () Bool)

(declare-fun res!979008 () Bool)

(assert (=> b!1448116 (=> (not res!979008) (not e!815678))))

(assert (=> b!1448116 (= res!979008 (validKeyInArray!0 (select (arr!47443 a!2862) j!93)))))

(declare-fun b!1448117 () Bool)

(assert (=> b!1448117 (= e!815674 e!815680)))

(declare-fun res!979005 () Bool)

(assert (=> b!1448117 (=> (not res!979005) (not e!815680))))

(assert (=> b!1448117 (= res!979005 (= lt!635398 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47443 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1448118 () Bool)

(declare-fun res!978998 () Bool)

(assert (=> b!1448118 (=> (not res!978998) (not e!815678))))

(assert (=> b!1448118 (= res!978998 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47994 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47994 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47994 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1448119 () Bool)

(assert (=> b!1448119 (= e!815677 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635395 lt!635397 mask!2687) (seekEntryOrOpen!0 lt!635395 lt!635397 mask!2687)))))

(assert (= (and start!124974 res!979002) b!1448104))

(assert (= (and b!1448104 res!979001) b!1448105))

(assert (= (and b!1448105 res!979000) b!1448116))

(assert (= (and b!1448116 res!979008) b!1448112))

(assert (= (and b!1448112 res!979011) b!1448113))

(assert (= (and b!1448113 res!978997) b!1448118))

(assert (= (and b!1448118 res!978998) b!1448108))

(assert (= (and b!1448108 res!979004) b!1448110))

(assert (= (and b!1448110 res!979010) b!1448106))

(assert (= (and b!1448106 res!979009) b!1448111))

(assert (= (and b!1448111 res!979003) b!1448115))

(assert (= (and b!1448115 c!134071) b!1448107))

(assert (= (and b!1448115 (not c!134071)) b!1448119))

(assert (= (and b!1448115 res!979007) b!1448103))

(assert (= (and b!1448103 res!979012) b!1448114))

(assert (= (and b!1448114 res!979006) b!1448109))

(assert (= (and b!1448109 (not res!978999)) b!1448117))

(assert (= (and b!1448117 res!979005) b!1448102))

(assert (= (and b!1448114 (not res!979013)) b!1448101))

(declare-fun m!1337065 () Bool)

(assert (=> b!1448105 m!1337065))

(assert (=> b!1448105 m!1337065))

(declare-fun m!1337067 () Bool)

(assert (=> b!1448105 m!1337067))

(declare-fun m!1337069 () Bool)

(assert (=> b!1448117 m!1337069))

(assert (=> b!1448117 m!1337069))

(declare-fun m!1337071 () Bool)

(assert (=> b!1448117 m!1337071))

(assert (=> b!1448116 m!1337069))

(assert (=> b!1448116 m!1337069))

(declare-fun m!1337073 () Bool)

(assert (=> b!1448116 m!1337073))

(declare-fun m!1337075 () Bool)

(assert (=> b!1448113 m!1337075))

(assert (=> b!1448101 m!1337069))

(assert (=> b!1448101 m!1337069))

(declare-fun m!1337077 () Bool)

(assert (=> b!1448101 m!1337077))

(declare-fun m!1337079 () Bool)

(assert (=> start!124974 m!1337079))

(declare-fun m!1337081 () Bool)

(assert (=> start!124974 m!1337081))

(assert (=> b!1448106 m!1337069))

(assert (=> b!1448106 m!1337069))

(declare-fun m!1337083 () Bool)

(assert (=> b!1448106 m!1337083))

(declare-fun m!1337085 () Bool)

(assert (=> b!1448107 m!1337085))

(declare-fun m!1337087 () Bool)

(assert (=> b!1448109 m!1337087))

(declare-fun m!1337089 () Bool)

(assert (=> b!1448109 m!1337089))

(declare-fun m!1337091 () Bool)

(assert (=> b!1448109 m!1337091))

(assert (=> b!1448109 m!1337069))

(declare-fun m!1337093 () Bool)

(assert (=> b!1448119 m!1337093))

(declare-fun m!1337095 () Bool)

(assert (=> b!1448119 m!1337095))

(declare-fun m!1337097 () Bool)

(assert (=> b!1448114 m!1337097))

(assert (=> b!1448114 m!1337089))

(declare-fun m!1337099 () Bool)

(assert (=> b!1448114 m!1337099))

(assert (=> b!1448114 m!1337091))

(assert (=> b!1448114 m!1337087))

(assert (=> b!1448114 m!1337069))

(declare-fun m!1337101 () Bool)

(assert (=> b!1448114 m!1337101))

(declare-fun m!1337103 () Bool)

(assert (=> b!1448114 m!1337103))

(assert (=> b!1448114 m!1337069))

(declare-fun m!1337105 () Bool)

(assert (=> b!1448111 m!1337105))

(assert (=> b!1448111 m!1337105))

(declare-fun m!1337107 () Bool)

(assert (=> b!1448111 m!1337107))

(assert (=> b!1448111 m!1337089))

(declare-fun m!1337109 () Bool)

(assert (=> b!1448111 m!1337109))

(assert (=> b!1448108 m!1337089))

(declare-fun m!1337111 () Bool)

(assert (=> b!1448108 m!1337111))

(assert (=> b!1448110 m!1337069))

(assert (=> b!1448110 m!1337069))

(declare-fun m!1337113 () Bool)

(assert (=> b!1448110 m!1337113))

(assert (=> b!1448110 m!1337113))

(assert (=> b!1448110 m!1337069))

(declare-fun m!1337115 () Bool)

(assert (=> b!1448110 m!1337115))

(declare-fun m!1337117 () Bool)

(assert (=> b!1448112 m!1337117))

(check-sat (not b!1448111) (not b!1448112) (not b!1448117) (not b!1448114) (not b!1448106) (not b!1448101) (not b!1448107) (not b!1448110) (not b!1448105) (not start!124974) (not b!1448119) (not b!1448113) (not b!1448116))
(check-sat)

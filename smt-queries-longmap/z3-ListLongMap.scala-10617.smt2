; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124810 () Bool)

(assert start!124810)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!815987 () Bool)

(declare-fun lt!635571 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11684 0))(
  ( (MissingZero!11684 (index!49128 (_ BitVec 32))) (Found!11684 (index!49129 (_ BitVec 32))) (Intermediate!11684 (undefined!12496 Bool) (index!49130 (_ BitVec 32)) (x!130792 (_ BitVec 32))) (Undefined!11684) (MissingVacant!11684 (index!49131 (_ BitVec 32))) )
))
(declare-fun lt!635565 () SeekEntryResult!11684)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1448973 () Bool)

(declare-datatypes ((array!98236 0))(
  ( (array!98237 (arr!47407 (Array (_ BitVec 32) (_ BitVec 64))) (size!47959 (_ BitVec 32))) )
))
(declare-fun lt!635567 () array!98236)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98236 (_ BitVec 32)) SeekEntryResult!11684)

(assert (=> b!1448973 (= e!815987 (= lt!635565 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635571 lt!635567 mask!2687)))))

(declare-fun b!1448974 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98236 (_ BitVec 32)) SeekEntryResult!11684)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98236 (_ BitVec 32)) SeekEntryResult!11684)

(assert (=> b!1448974 (= e!815987 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635571 lt!635567 mask!2687) (seekEntryOrOpen!0 lt!635571 lt!635567 mask!2687)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun b!1448975 () Bool)

(declare-fun e!815980 () Bool)

(assert (=> b!1448975 (= e!815980 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1448976 () Bool)

(declare-fun e!815984 () Bool)

(assert (=> b!1448976 (= e!815984 true)))

(declare-fun lt!635570 () SeekEntryResult!11684)

(declare-fun a!2862 () array!98236)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1448976 (= lt!635570 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47407 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1448977 () Bool)

(declare-fun res!980560 () Bool)

(declare-fun e!815983 () Bool)

(assert (=> b!1448977 (=> (not res!980560) (not e!815983))))

(assert (=> b!1448977 (= res!980560 e!815987)))

(declare-fun c!133720 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1448977 (= c!133720 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1448978 () Bool)

(declare-fun res!980573 () Bool)

(declare-fun e!815981 () Bool)

(assert (=> b!1448978 (=> (not res!980573) (not e!815981))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1448978 (= res!980573 (validKeyInArray!0 (select (arr!47407 a!2862) j!93)))))

(declare-fun b!1448979 () Bool)

(declare-fun e!815986 () Bool)

(declare-fun e!815979 () Bool)

(assert (=> b!1448979 (= e!815986 e!815979)))

(declare-fun res!980574 () Bool)

(assert (=> b!1448979 (=> res!980574 e!815979)))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1448979 (= res!980574 (or (and (= (select (arr!47407 a!2862) index!646) (select (store (arr!47407 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47407 a!2862) index!646) (select (arr!47407 a!2862) j!93))) (not (= (select (arr!47407 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1448980 () Bool)

(declare-fun res!980564 () Bool)

(declare-fun e!815985 () Bool)

(assert (=> b!1448980 (=> (not res!980564) (not e!815985))))

(declare-fun lt!635568 () SeekEntryResult!11684)

(assert (=> b!1448980 (= res!980564 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47407 a!2862) j!93) a!2862 mask!2687) lt!635568))))

(declare-fun b!1448982 () Bool)

(declare-fun res!980571 () Bool)

(assert (=> b!1448982 (=> (not res!980571) (not e!815981))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98236 (_ BitVec 32)) Bool)

(assert (=> b!1448982 (= res!980571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1448983 () Bool)

(assert (=> b!1448983 (= e!815979 e!815980)))

(declare-fun res!980572 () Bool)

(assert (=> b!1448983 (=> (not res!980572) (not e!815980))))

(declare-fun lt!635569 () SeekEntryResult!11684)

(assert (=> b!1448983 (= res!980572 (= lt!635569 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47407 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1448984 () Bool)

(assert (=> b!1448984 (= e!815985 e!815983)))

(declare-fun res!980563 () Bool)

(assert (=> b!1448984 (=> (not res!980563) (not e!815983))))

(assert (=> b!1448984 (= res!980563 (= lt!635565 (Intermediate!11684 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1448984 (= lt!635565 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635571 mask!2687) lt!635571 lt!635567 mask!2687))))

(assert (=> b!1448984 (= lt!635571 (select (store (arr!47407 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1448985 () Bool)

(declare-fun res!980566 () Bool)

(assert (=> b!1448985 (=> (not res!980566) (not e!815981))))

(declare-datatypes ((List!33986 0))(
  ( (Nil!33983) (Cons!33982 (h!35332 (_ BitVec 64)) (t!48672 List!33986)) )
))
(declare-fun arrayNoDuplicates!0 (array!98236 (_ BitVec 32) List!33986) Bool)

(assert (=> b!1448985 (= res!980566 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33983))))

(declare-fun b!1448986 () Bool)

(declare-fun res!980568 () Bool)

(assert (=> b!1448986 (=> (not res!980568) (not e!815983))))

(assert (=> b!1448986 (= res!980568 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1448987 () Bool)

(assert (=> b!1448987 (= e!815983 (not e!815984))))

(declare-fun res!980569 () Bool)

(assert (=> b!1448987 (=> res!980569 e!815984)))

(assert (=> b!1448987 (= res!980569 (or (and (= (select (arr!47407 a!2862) index!646) (select (store (arr!47407 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47407 a!2862) index!646) (select (arr!47407 a!2862) j!93))) (not (= (select (arr!47407 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47407 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1448987 e!815986))

(declare-fun res!980565 () Bool)

(assert (=> b!1448987 (=> (not res!980565) (not e!815986))))

(assert (=> b!1448987 (= res!980565 (and (= lt!635569 (Found!11684 j!93)) (or (= (select (arr!47407 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47407 a!2862) intermediateBeforeIndex!19) (select (arr!47407 a!2862) j!93)))))))

(assert (=> b!1448987 (= lt!635569 (seekEntryOrOpen!0 (select (arr!47407 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1448987 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48705 0))(
  ( (Unit!48706) )
))
(declare-fun lt!635566 () Unit!48705)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98236 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48705)

(assert (=> b!1448987 (= lt!635566 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1448988 () Bool)

(declare-fun res!980561 () Bool)

(assert (=> b!1448988 (=> (not res!980561) (not e!815981))))

(assert (=> b!1448988 (= res!980561 (validKeyInArray!0 (select (arr!47407 a!2862) i!1006)))))

(declare-fun b!1448989 () Bool)

(declare-fun e!815982 () Bool)

(assert (=> b!1448989 (= e!815981 e!815982)))

(declare-fun res!980570 () Bool)

(assert (=> b!1448989 (=> (not res!980570) (not e!815982))))

(assert (=> b!1448989 (= res!980570 (= (select (store (arr!47407 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1448989 (= lt!635567 (array!98237 (store (arr!47407 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47959 a!2862)))))

(declare-fun b!1448990 () Bool)

(declare-fun res!980562 () Bool)

(assert (=> b!1448990 (=> (not res!980562) (not e!815981))))

(assert (=> b!1448990 (= res!980562 (and (= (size!47959 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47959 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47959 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1448991 () Bool)

(assert (=> b!1448991 (= e!815982 e!815985)))

(declare-fun res!980559 () Bool)

(assert (=> b!1448991 (=> (not res!980559) (not e!815985))))

(assert (=> b!1448991 (= res!980559 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47407 a!2862) j!93) mask!2687) (select (arr!47407 a!2862) j!93) a!2862 mask!2687) lt!635568))))

(assert (=> b!1448991 (= lt!635568 (Intermediate!11684 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1448981 () Bool)

(declare-fun res!980567 () Bool)

(assert (=> b!1448981 (=> (not res!980567) (not e!815981))))

(assert (=> b!1448981 (= res!980567 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47959 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47959 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47959 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!980575 () Bool)

(assert (=> start!124810 (=> (not res!980575) (not e!815981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124810 (= res!980575 (validMask!0 mask!2687))))

(assert (=> start!124810 e!815981))

(assert (=> start!124810 true))

(declare-fun array_inv!36640 (array!98236) Bool)

(assert (=> start!124810 (array_inv!36640 a!2862)))

(assert (= (and start!124810 res!980575) b!1448990))

(assert (= (and b!1448990 res!980562) b!1448988))

(assert (= (and b!1448988 res!980561) b!1448978))

(assert (= (and b!1448978 res!980573) b!1448982))

(assert (= (and b!1448982 res!980571) b!1448985))

(assert (= (and b!1448985 res!980566) b!1448981))

(assert (= (and b!1448981 res!980567) b!1448989))

(assert (= (and b!1448989 res!980570) b!1448991))

(assert (= (and b!1448991 res!980559) b!1448980))

(assert (= (and b!1448980 res!980564) b!1448984))

(assert (= (and b!1448984 res!980563) b!1448977))

(assert (= (and b!1448977 c!133720) b!1448973))

(assert (= (and b!1448977 (not c!133720)) b!1448974))

(assert (= (and b!1448977 res!980560) b!1448986))

(assert (= (and b!1448986 res!980568) b!1448987))

(assert (= (and b!1448987 res!980565) b!1448979))

(assert (= (and b!1448979 (not res!980574)) b!1448983))

(assert (= (and b!1448983 res!980572) b!1448975))

(assert (= (and b!1448987 (not res!980569)) b!1448976))

(declare-fun m!1337217 () Bool)

(assert (=> b!1448991 m!1337217))

(assert (=> b!1448991 m!1337217))

(declare-fun m!1337219 () Bool)

(assert (=> b!1448991 m!1337219))

(assert (=> b!1448991 m!1337219))

(assert (=> b!1448991 m!1337217))

(declare-fun m!1337221 () Bool)

(assert (=> b!1448991 m!1337221))

(assert (=> b!1448978 m!1337217))

(assert (=> b!1448978 m!1337217))

(declare-fun m!1337223 () Bool)

(assert (=> b!1448978 m!1337223))

(declare-fun m!1337225 () Bool)

(assert (=> b!1448974 m!1337225))

(declare-fun m!1337227 () Bool)

(assert (=> b!1448974 m!1337227))

(declare-fun m!1337229 () Bool)

(assert (=> b!1448979 m!1337229))

(declare-fun m!1337231 () Bool)

(assert (=> b!1448979 m!1337231))

(declare-fun m!1337233 () Bool)

(assert (=> b!1448979 m!1337233))

(assert (=> b!1448979 m!1337217))

(assert (=> b!1448976 m!1337217))

(assert (=> b!1448976 m!1337217))

(declare-fun m!1337235 () Bool)

(assert (=> b!1448976 m!1337235))

(assert (=> b!1448980 m!1337217))

(assert (=> b!1448980 m!1337217))

(declare-fun m!1337237 () Bool)

(assert (=> b!1448980 m!1337237))

(declare-fun m!1337239 () Bool)

(assert (=> b!1448988 m!1337239))

(assert (=> b!1448988 m!1337239))

(declare-fun m!1337241 () Bool)

(assert (=> b!1448988 m!1337241))

(assert (=> b!1448989 m!1337231))

(declare-fun m!1337243 () Bool)

(assert (=> b!1448989 m!1337243))

(declare-fun m!1337245 () Bool)

(assert (=> b!1448973 m!1337245))

(declare-fun m!1337247 () Bool)

(assert (=> b!1448987 m!1337247))

(assert (=> b!1448987 m!1337231))

(declare-fun m!1337249 () Bool)

(assert (=> b!1448987 m!1337249))

(assert (=> b!1448987 m!1337233))

(assert (=> b!1448987 m!1337229))

(assert (=> b!1448987 m!1337217))

(declare-fun m!1337251 () Bool)

(assert (=> b!1448987 m!1337251))

(declare-fun m!1337253 () Bool)

(assert (=> b!1448987 m!1337253))

(assert (=> b!1448987 m!1337217))

(declare-fun m!1337255 () Bool)

(assert (=> b!1448982 m!1337255))

(assert (=> b!1448983 m!1337217))

(assert (=> b!1448983 m!1337217))

(declare-fun m!1337257 () Bool)

(assert (=> b!1448983 m!1337257))

(declare-fun m!1337259 () Bool)

(assert (=> b!1448985 m!1337259))

(declare-fun m!1337261 () Bool)

(assert (=> start!124810 m!1337261))

(declare-fun m!1337263 () Bool)

(assert (=> start!124810 m!1337263))

(declare-fun m!1337265 () Bool)

(assert (=> b!1448984 m!1337265))

(assert (=> b!1448984 m!1337265))

(declare-fun m!1337267 () Bool)

(assert (=> b!1448984 m!1337267))

(assert (=> b!1448984 m!1337231))

(declare-fun m!1337269 () Bool)

(assert (=> b!1448984 m!1337269))

(check-sat (not b!1448980) (not b!1448983) (not start!124810) (not b!1448988) (not b!1448976) (not b!1448984) (not b!1448985) (not b!1448991) (not b!1448987) (not b!1448973) (not b!1448978) (not b!1448974) (not b!1448982))
(check-sat)

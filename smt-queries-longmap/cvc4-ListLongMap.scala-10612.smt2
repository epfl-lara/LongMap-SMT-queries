; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124814 () Bool)

(assert start!124814)

(declare-fun b!1448427 () Bool)

(declare-fun res!979988 () Bool)

(declare-fun e!815712 () Bool)

(assert (=> b!1448427 (=> (not res!979988) (not e!815712))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98262 0))(
  ( (array!98263 (arr!47419 (Array (_ BitVec 32) (_ BitVec 64))) (size!47969 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98262)

(assert (=> b!1448427 (= res!979988 (and (= (size!47969 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47969 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47969 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1448428 () Bool)

(declare-fun e!815707 () Bool)

(declare-fun e!815714 () Bool)

(assert (=> b!1448428 (= e!815707 e!815714)))

(declare-fun res!979982 () Bool)

(assert (=> b!1448428 (=> (not res!979982) (not e!815714))))

(declare-datatypes ((SeekEntryResult!11671 0))(
  ( (MissingZero!11671 (index!49076 (_ BitVec 32))) (Found!11671 (index!49077 (_ BitVec 32))) (Intermediate!11671 (undefined!12483 Bool) (index!49078 (_ BitVec 32)) (x!130744 (_ BitVec 32))) (Undefined!11671) (MissingVacant!11671 (index!49079 (_ BitVec 32))) )
))
(declare-fun lt!635530 () SeekEntryResult!11671)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98262 (_ BitVec 32)) SeekEntryResult!11671)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1448428 (= res!979982 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47419 a!2862) j!93) mask!2687) (select (arr!47419 a!2862) j!93) a!2862 mask!2687) lt!635530))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1448428 (= lt!635530 (Intermediate!11671 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1448429 () Bool)

(declare-fun res!979984 () Bool)

(assert (=> b!1448429 (=> (not res!979984) (not e!815712))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1448429 (= res!979984 (validKeyInArray!0 (select (arr!47419 a!2862) i!1006)))))

(declare-fun b!1448430 () Bool)

(declare-fun res!979975 () Bool)

(declare-fun e!815713 () Bool)

(assert (=> b!1448430 (=> (not res!979975) (not e!815713))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1448430 (= res!979975 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1448431 () Bool)

(declare-fun lt!635531 () (_ BitVec 64))

(declare-fun e!815706 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!635527 () array!98262)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98262 (_ BitVec 32)) SeekEntryResult!11671)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98262 (_ BitVec 32)) SeekEntryResult!11671)

(assert (=> b!1448431 (= e!815706 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635531 lt!635527 mask!2687) (seekEntryOrOpen!0 lt!635531 lt!635527 mask!2687)))))

(declare-fun b!1448432 () Bool)

(declare-fun res!979985 () Bool)

(assert (=> b!1448432 (=> (not res!979985) (not e!815712))))

(declare-datatypes ((List!33920 0))(
  ( (Nil!33917) (Cons!33916 (h!35266 (_ BitVec 64)) (t!48614 List!33920)) )
))
(declare-fun arrayNoDuplicates!0 (array!98262 (_ BitVec 32) List!33920) Bool)

(assert (=> b!1448432 (= res!979985 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33917))))

(declare-fun lt!635532 () SeekEntryResult!11671)

(declare-fun b!1448433 () Bool)

(assert (=> b!1448433 (= e!815706 (= lt!635532 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635531 lt!635527 mask!2687)))))

(declare-fun b!1448434 () Bool)

(declare-fun res!979974 () Bool)

(assert (=> b!1448434 (=> (not res!979974) (not e!815713))))

(assert (=> b!1448434 (= res!979974 e!815706)))

(declare-fun c!133737 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1448434 (= c!133737 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1448435 () Bool)

(declare-fun res!979976 () Bool)

(assert (=> b!1448435 (=> (not res!979976) (not e!815712))))

(assert (=> b!1448435 (= res!979976 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47969 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47969 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47969 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1448437 () Bool)

(declare-fun res!979977 () Bool)

(assert (=> b!1448437 (=> (not res!979977) (not e!815712))))

(assert (=> b!1448437 (= res!979977 (validKeyInArray!0 (select (arr!47419 a!2862) j!93)))))

(declare-fun b!1448438 () Bool)

(declare-fun res!979980 () Bool)

(assert (=> b!1448438 (=> (not res!979980) (not e!815712))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98262 (_ BitVec 32)) Bool)

(assert (=> b!1448438 (= res!979980 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1448439 () Bool)

(declare-fun e!815709 () Bool)

(declare-fun e!815711 () Bool)

(assert (=> b!1448439 (= e!815709 e!815711)))

(declare-fun res!979979 () Bool)

(assert (=> b!1448439 (=> (not res!979979) (not e!815711))))

(declare-fun lt!635526 () SeekEntryResult!11671)

(assert (=> b!1448439 (= res!979979 (= lt!635526 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47419 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1448440 () Bool)

(assert (=> b!1448440 (= e!815711 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1448441 () Bool)

(assert (=> b!1448441 (= e!815714 e!815713)))

(declare-fun res!979987 () Bool)

(assert (=> b!1448441 (=> (not res!979987) (not e!815713))))

(assert (=> b!1448441 (= res!979987 (= lt!635532 (Intermediate!11671 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1448441 (= lt!635532 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635531 mask!2687) lt!635531 lt!635527 mask!2687))))

(assert (=> b!1448441 (= lt!635531 (select (store (arr!47419 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1448442 () Bool)

(declare-fun res!979990 () Bool)

(assert (=> b!1448442 (=> (not res!979990) (not e!815714))))

(assert (=> b!1448442 (= res!979990 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47419 a!2862) j!93) a!2862 mask!2687) lt!635530))))

(declare-fun b!1448443 () Bool)

(declare-fun e!815708 () Bool)

(assert (=> b!1448443 (= e!815713 (not e!815708))))

(declare-fun res!979986 () Bool)

(assert (=> b!1448443 (=> res!979986 e!815708)))

(assert (=> b!1448443 (= res!979986 (or (and (= (select (arr!47419 a!2862) index!646) (select (store (arr!47419 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47419 a!2862) index!646) (select (arr!47419 a!2862) j!93))) (not (= (select (arr!47419 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47419 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!815710 () Bool)

(assert (=> b!1448443 e!815710))

(declare-fun res!979981 () Bool)

(assert (=> b!1448443 (=> (not res!979981) (not e!815710))))

(assert (=> b!1448443 (= res!979981 (and (= lt!635526 (Found!11671 j!93)) (or (= (select (arr!47419 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47419 a!2862) intermediateBeforeIndex!19) (select (arr!47419 a!2862) j!93)))))))

(assert (=> b!1448443 (= lt!635526 (seekEntryOrOpen!0 (select (arr!47419 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1448443 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48838 0))(
  ( (Unit!48839) )
))
(declare-fun lt!635528 () Unit!48838)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98262 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48838)

(assert (=> b!1448443 (= lt!635528 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1448444 () Bool)

(assert (=> b!1448444 (= e!815712 e!815707)))

(declare-fun res!979978 () Bool)

(assert (=> b!1448444 (=> (not res!979978) (not e!815707))))

(assert (=> b!1448444 (= res!979978 (= (select (store (arr!47419 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1448444 (= lt!635527 (array!98263 (store (arr!47419 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47969 a!2862)))))

(declare-fun b!1448445 () Bool)

(assert (=> b!1448445 (= e!815710 e!815709)))

(declare-fun res!979983 () Bool)

(assert (=> b!1448445 (=> res!979983 e!815709)))

(assert (=> b!1448445 (= res!979983 (or (and (= (select (arr!47419 a!2862) index!646) (select (store (arr!47419 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47419 a!2862) index!646) (select (arr!47419 a!2862) j!93))) (not (= (select (arr!47419 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1448436 () Bool)

(assert (=> b!1448436 (= e!815708 true)))

(declare-fun lt!635529 () SeekEntryResult!11671)

(assert (=> b!1448436 (= lt!635529 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47419 a!2862) j!93) a!2862 mask!2687))))

(declare-fun res!979989 () Bool)

(assert (=> start!124814 (=> (not res!979989) (not e!815712))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124814 (= res!979989 (validMask!0 mask!2687))))

(assert (=> start!124814 e!815712))

(assert (=> start!124814 true))

(declare-fun array_inv!36447 (array!98262) Bool)

(assert (=> start!124814 (array_inv!36447 a!2862)))

(assert (= (and start!124814 res!979989) b!1448427))

(assert (= (and b!1448427 res!979988) b!1448429))

(assert (= (and b!1448429 res!979984) b!1448437))

(assert (= (and b!1448437 res!979977) b!1448438))

(assert (= (and b!1448438 res!979980) b!1448432))

(assert (= (and b!1448432 res!979985) b!1448435))

(assert (= (and b!1448435 res!979976) b!1448444))

(assert (= (and b!1448444 res!979978) b!1448428))

(assert (= (and b!1448428 res!979982) b!1448442))

(assert (= (and b!1448442 res!979990) b!1448441))

(assert (= (and b!1448441 res!979987) b!1448434))

(assert (= (and b!1448434 c!133737) b!1448433))

(assert (= (and b!1448434 (not c!133737)) b!1448431))

(assert (= (and b!1448434 res!979974) b!1448430))

(assert (= (and b!1448430 res!979975) b!1448443))

(assert (= (and b!1448443 res!979981) b!1448445))

(assert (= (and b!1448445 (not res!979983)) b!1448439))

(assert (= (and b!1448439 res!979979) b!1448440))

(assert (= (and b!1448443 (not res!979986)) b!1448436))

(declare-fun m!1337191 () Bool)

(assert (=> b!1448443 m!1337191))

(declare-fun m!1337193 () Bool)

(assert (=> b!1448443 m!1337193))

(declare-fun m!1337195 () Bool)

(assert (=> b!1448443 m!1337195))

(declare-fun m!1337197 () Bool)

(assert (=> b!1448443 m!1337197))

(declare-fun m!1337199 () Bool)

(assert (=> b!1448443 m!1337199))

(declare-fun m!1337201 () Bool)

(assert (=> b!1448443 m!1337201))

(declare-fun m!1337203 () Bool)

(assert (=> b!1448443 m!1337203))

(declare-fun m!1337205 () Bool)

(assert (=> b!1448443 m!1337205))

(assert (=> b!1448443 m!1337201))

(declare-fun m!1337207 () Bool)

(assert (=> b!1448433 m!1337207))

(assert (=> b!1448437 m!1337201))

(assert (=> b!1448437 m!1337201))

(declare-fun m!1337209 () Bool)

(assert (=> b!1448437 m!1337209))

(declare-fun m!1337211 () Bool)

(assert (=> b!1448432 m!1337211))

(declare-fun m!1337213 () Bool)

(assert (=> b!1448438 m!1337213))

(assert (=> b!1448442 m!1337201))

(assert (=> b!1448442 m!1337201))

(declare-fun m!1337215 () Bool)

(assert (=> b!1448442 m!1337215))

(declare-fun m!1337217 () Bool)

(assert (=> b!1448431 m!1337217))

(declare-fun m!1337219 () Bool)

(assert (=> b!1448431 m!1337219))

(assert (=> b!1448428 m!1337201))

(assert (=> b!1448428 m!1337201))

(declare-fun m!1337221 () Bool)

(assert (=> b!1448428 m!1337221))

(assert (=> b!1448428 m!1337221))

(assert (=> b!1448428 m!1337201))

(declare-fun m!1337223 () Bool)

(assert (=> b!1448428 m!1337223))

(assert (=> b!1448444 m!1337193))

(declare-fun m!1337225 () Bool)

(assert (=> b!1448444 m!1337225))

(declare-fun m!1337227 () Bool)

(assert (=> start!124814 m!1337227))

(declare-fun m!1337229 () Bool)

(assert (=> start!124814 m!1337229))

(assert (=> b!1448445 m!1337199))

(assert (=> b!1448445 m!1337193))

(assert (=> b!1448445 m!1337197))

(assert (=> b!1448445 m!1337201))

(assert (=> b!1448439 m!1337201))

(assert (=> b!1448439 m!1337201))

(declare-fun m!1337231 () Bool)

(assert (=> b!1448439 m!1337231))

(declare-fun m!1337233 () Bool)

(assert (=> b!1448429 m!1337233))

(assert (=> b!1448429 m!1337233))

(declare-fun m!1337235 () Bool)

(assert (=> b!1448429 m!1337235))

(assert (=> b!1448436 m!1337201))

(assert (=> b!1448436 m!1337201))

(declare-fun m!1337237 () Bool)

(assert (=> b!1448436 m!1337237))

(declare-fun m!1337239 () Bool)

(assert (=> b!1448441 m!1337239))

(assert (=> b!1448441 m!1337239))

(declare-fun m!1337241 () Bool)

(assert (=> b!1448441 m!1337241))

(assert (=> b!1448441 m!1337193))

(declare-fun m!1337243 () Bool)

(assert (=> b!1448441 m!1337243))

(push 1)


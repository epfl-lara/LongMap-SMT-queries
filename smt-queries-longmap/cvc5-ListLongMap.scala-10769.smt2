; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125992 () Bool)

(assert start!125992)

(declare-fun b!1475213 () Bool)

(declare-fun res!1002084 () Bool)

(declare-fun e!827667 () Bool)

(assert (=> b!1475213 (=> (not res!1002084) (not e!827667))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1475213 (= res!1002084 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1475214 () Bool)

(declare-fun res!1002088 () Bool)

(declare-fun e!827669 () Bool)

(assert (=> b!1475214 (=> (not res!1002088) (not e!827669))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((array!99212 0))(
  ( (array!99213 (arr!47888 (Array (_ BitVec 32) (_ BitVec 64))) (size!48438 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99212)

(assert (=> b!1475214 (= res!1002088 (and (= (size!48438 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48438 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48438 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1475215 () Bool)

(declare-fun res!1002081 () Bool)

(assert (=> b!1475215 (=> (not res!1002081) (not e!827669))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1475215 (= res!1002081 (validKeyInArray!0 (select (arr!47888 a!2862) i!1006)))))

(declare-fun b!1475216 () Bool)

(declare-fun res!1002085 () Bool)

(assert (=> b!1475216 (=> (not res!1002085) (not e!827667))))

(declare-fun e!827668 () Bool)

(assert (=> b!1475216 (= res!1002085 e!827668)))

(declare-fun c!136083 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1475216 (= c!136083 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1475217 () Bool)

(declare-fun res!1002080 () Bool)

(assert (=> b!1475217 (=> (not res!1002080) (not e!827669))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1475217 (= res!1002080 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48438 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48438 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48438 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1475218 () Bool)

(declare-fun res!1002087 () Bool)

(assert (=> b!1475218 (=> (not res!1002087) (not e!827669))))

(declare-datatypes ((List!34389 0))(
  ( (Nil!34386) (Cons!34385 (h!35747 (_ BitVec 64)) (t!49083 List!34389)) )
))
(declare-fun arrayNoDuplicates!0 (array!99212 (_ BitVec 32) List!34389) Bool)

(assert (=> b!1475218 (= res!1002087 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34386))))

(declare-fun b!1475219 () Bool)

(declare-fun res!1002089 () Bool)

(assert (=> b!1475219 (=> (not res!1002089) (not e!827669))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99212 (_ BitVec 32)) Bool)

(assert (=> b!1475219 (= res!1002089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!1002082 () Bool)

(assert (=> start!125992 (=> (not res!1002082) (not e!827669))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125992 (= res!1002082 (validMask!0 mask!2687))))

(assert (=> start!125992 e!827669))

(assert (=> start!125992 true))

(declare-fun array_inv!36916 (array!99212) Bool)

(assert (=> start!125992 (array_inv!36916 a!2862)))

(declare-fun b!1475220 () Bool)

(declare-fun e!827670 () Bool)

(declare-fun e!827671 () Bool)

(assert (=> b!1475220 (= e!827670 e!827671)))

(declare-fun res!1002086 () Bool)

(assert (=> b!1475220 (=> (not res!1002086) (not e!827671))))

(declare-datatypes ((SeekEntryResult!12128 0))(
  ( (MissingZero!12128 (index!50904 (_ BitVec 32))) (Found!12128 (index!50905 (_ BitVec 32))) (Intermediate!12128 (undefined!12940 Bool) (index!50906 (_ BitVec 32)) (x!132493 (_ BitVec 32))) (Undefined!12128) (MissingVacant!12128 (index!50907 (_ BitVec 32))) )
))
(declare-fun lt!644541 () SeekEntryResult!12128)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99212 (_ BitVec 32)) SeekEntryResult!12128)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1475220 (= res!1002086 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47888 a!2862) j!93) mask!2687) (select (arr!47888 a!2862) j!93) a!2862 mask!2687) lt!644541))))

(assert (=> b!1475220 (= lt!644541 (Intermediate!12128 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun e!827665 () Bool)

(declare-fun lt!644544 () SeekEntryResult!12128)

(declare-fun b!1475221 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99212 (_ BitVec 32)) SeekEntryResult!12128)

(assert (=> b!1475221 (= e!827665 (= lt!644544 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47888 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1475222 () Bool)

(assert (=> b!1475222 (= e!827671 e!827667)))

(declare-fun res!1002093 () Bool)

(assert (=> b!1475222 (=> (not res!1002093) (not e!827667))))

(declare-fun lt!644543 () SeekEntryResult!12128)

(assert (=> b!1475222 (= res!1002093 (= lt!644543 (Intermediate!12128 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!644539 () (_ BitVec 64))

(declare-fun lt!644540 () array!99212)

(assert (=> b!1475222 (= lt!644543 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644539 mask!2687) lt!644539 lt!644540 mask!2687))))

(assert (=> b!1475222 (= lt!644539 (select (store (arr!47888 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1475223 () Bool)

(assert (=> b!1475223 (= e!827667 (not (or (and (= (select (arr!47888 a!2862) index!646) (select (store (arr!47888 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47888 a!2862) index!646) (select (arr!47888 a!2862) j!93))) (not (= (select (arr!47888 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!646 intermediateBeforeIndex!19))))))

(declare-fun e!827666 () Bool)

(assert (=> b!1475223 e!827666))

(declare-fun res!1002091 () Bool)

(assert (=> b!1475223 (=> (not res!1002091) (not e!827666))))

(assert (=> b!1475223 (= res!1002091 (and (= lt!644544 (Found!12128 j!93)) (or (= (select (arr!47888 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47888 a!2862) intermediateBeforeIndex!19) (select (arr!47888 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99212 (_ BitVec 32)) SeekEntryResult!12128)

(assert (=> b!1475223 (= lt!644544 (seekEntryOrOpen!0 (select (arr!47888 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1475223 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49596 0))(
  ( (Unit!49597) )
))
(declare-fun lt!644542 () Unit!49596)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99212 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49596)

(assert (=> b!1475223 (= lt!644542 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1475224 () Bool)

(assert (=> b!1475224 (= e!827668 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644539 lt!644540 mask!2687) (seekEntryOrOpen!0 lt!644539 lt!644540 mask!2687)))))

(declare-fun b!1475225 () Bool)

(assert (=> b!1475225 (= e!827669 e!827670)))

(declare-fun res!1002094 () Bool)

(assert (=> b!1475225 (=> (not res!1002094) (not e!827670))))

(assert (=> b!1475225 (= res!1002094 (= (select (store (arr!47888 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1475225 (= lt!644540 (array!99213 (store (arr!47888 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48438 a!2862)))))

(declare-fun b!1475226 () Bool)

(declare-fun res!1002092 () Bool)

(assert (=> b!1475226 (=> (not res!1002092) (not e!827671))))

(assert (=> b!1475226 (= res!1002092 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47888 a!2862) j!93) a!2862 mask!2687) lt!644541))))

(declare-fun b!1475227 () Bool)

(assert (=> b!1475227 (= e!827666 e!827665)))

(declare-fun res!1002083 () Bool)

(assert (=> b!1475227 (=> res!1002083 e!827665)))

(assert (=> b!1475227 (= res!1002083 (or (and (= (select (arr!47888 a!2862) index!646) (select (store (arr!47888 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47888 a!2862) index!646) (select (arr!47888 a!2862) j!93))) (not (= (select (arr!47888 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1475228 () Bool)

(assert (=> b!1475228 (= e!827668 (= lt!644543 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644539 lt!644540 mask!2687)))))

(declare-fun b!1475229 () Bool)

(declare-fun res!1002090 () Bool)

(assert (=> b!1475229 (=> (not res!1002090) (not e!827669))))

(assert (=> b!1475229 (= res!1002090 (validKeyInArray!0 (select (arr!47888 a!2862) j!93)))))

(assert (= (and start!125992 res!1002082) b!1475214))

(assert (= (and b!1475214 res!1002088) b!1475215))

(assert (= (and b!1475215 res!1002081) b!1475229))

(assert (= (and b!1475229 res!1002090) b!1475219))

(assert (= (and b!1475219 res!1002089) b!1475218))

(assert (= (and b!1475218 res!1002087) b!1475217))

(assert (= (and b!1475217 res!1002080) b!1475225))

(assert (= (and b!1475225 res!1002094) b!1475220))

(assert (= (and b!1475220 res!1002086) b!1475226))

(assert (= (and b!1475226 res!1002092) b!1475222))

(assert (= (and b!1475222 res!1002093) b!1475216))

(assert (= (and b!1475216 c!136083) b!1475228))

(assert (= (and b!1475216 (not c!136083)) b!1475224))

(assert (= (and b!1475216 res!1002085) b!1475213))

(assert (= (and b!1475213 res!1002084) b!1475223))

(assert (= (and b!1475223 res!1002091) b!1475227))

(assert (= (and b!1475227 (not res!1002083)) b!1475221))

(declare-fun m!1361503 () Bool)

(assert (=> b!1475222 m!1361503))

(assert (=> b!1475222 m!1361503))

(declare-fun m!1361505 () Bool)

(assert (=> b!1475222 m!1361505))

(declare-fun m!1361507 () Bool)

(assert (=> b!1475222 m!1361507))

(declare-fun m!1361509 () Bool)

(assert (=> b!1475222 m!1361509))

(declare-fun m!1361511 () Bool)

(assert (=> b!1475223 m!1361511))

(assert (=> b!1475223 m!1361507))

(declare-fun m!1361513 () Bool)

(assert (=> b!1475223 m!1361513))

(declare-fun m!1361515 () Bool)

(assert (=> b!1475223 m!1361515))

(declare-fun m!1361517 () Bool)

(assert (=> b!1475223 m!1361517))

(declare-fun m!1361519 () Bool)

(assert (=> b!1475223 m!1361519))

(declare-fun m!1361521 () Bool)

(assert (=> b!1475223 m!1361521))

(declare-fun m!1361523 () Bool)

(assert (=> b!1475223 m!1361523))

(assert (=> b!1475223 m!1361519))

(declare-fun m!1361525 () Bool)

(assert (=> b!1475228 m!1361525))

(declare-fun m!1361527 () Bool)

(assert (=> b!1475224 m!1361527))

(declare-fun m!1361529 () Bool)

(assert (=> b!1475224 m!1361529))

(declare-fun m!1361531 () Bool)

(assert (=> b!1475219 m!1361531))

(declare-fun m!1361533 () Bool)

(assert (=> b!1475215 m!1361533))

(assert (=> b!1475215 m!1361533))

(declare-fun m!1361535 () Bool)

(assert (=> b!1475215 m!1361535))

(assert (=> b!1475226 m!1361519))

(assert (=> b!1475226 m!1361519))

(declare-fun m!1361537 () Bool)

(assert (=> b!1475226 m!1361537))

(declare-fun m!1361539 () Bool)

(assert (=> b!1475218 m!1361539))

(assert (=> b!1475220 m!1361519))

(assert (=> b!1475220 m!1361519))

(declare-fun m!1361541 () Bool)

(assert (=> b!1475220 m!1361541))

(assert (=> b!1475220 m!1361541))

(assert (=> b!1475220 m!1361519))

(declare-fun m!1361543 () Bool)

(assert (=> b!1475220 m!1361543))

(assert (=> b!1475227 m!1361517))

(assert (=> b!1475227 m!1361507))

(assert (=> b!1475227 m!1361515))

(assert (=> b!1475227 m!1361519))

(declare-fun m!1361545 () Bool)

(assert (=> start!125992 m!1361545))

(declare-fun m!1361547 () Bool)

(assert (=> start!125992 m!1361547))

(assert (=> b!1475225 m!1361507))

(declare-fun m!1361549 () Bool)

(assert (=> b!1475225 m!1361549))

(assert (=> b!1475221 m!1361519))

(assert (=> b!1475221 m!1361519))

(declare-fun m!1361551 () Bool)

(assert (=> b!1475221 m!1361551))

(assert (=> b!1475229 m!1361519))

(assert (=> b!1475229 m!1361519))

(declare-fun m!1361553 () Bool)

(assert (=> b!1475229 m!1361553))

(push 1)

(assert (not b!1475218))

(assert (not b!1475224))

(assert (not b!1475223))

(assert (not b!1475219))

(assert (not b!1475215))

(assert (not start!125992))

(assert (not b!1475226))

(assert (not b!1475221))

(assert (not b!1475220))

(assert (not b!1475228))

(assert (not b!1475229))

(assert (not b!1475222))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!155787 () Bool)

(assert (=> d!155787 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!125992 d!155787))

(declare-fun d!155799 () Bool)

(assert (=> d!155799 (= (array_inv!36916 a!2862) (bvsge (size!48438 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!125992 d!155799))

(declare-fun b!1475501 () Bool)

(declare-fun lt!644646 () SeekEntryResult!12128)

(assert (=> b!1475501 (and (bvsge (index!50906 lt!644646) #b00000000000000000000000000000000) (bvslt (index!50906 lt!644646) (size!48438 a!2862)))))

(declare-fun res!1002228 () Bool)

(assert (=> b!1475501 (= res!1002228 (= (select (arr!47888 a!2862) (index!50906 lt!644646)) (select (arr!47888 a!2862) j!93)))))

(declare-fun e!827819 () Bool)

(assert (=> b!1475501 (=> res!1002228 e!827819)))

(declare-fun e!827821 () Bool)

(assert (=> b!1475501 (= e!827821 e!827819)))

(declare-fun b!1475502 () Bool)

(declare-fun e!827820 () Bool)

(assert (=> b!1475502 (= e!827820 (bvsge (x!132493 lt!644646) #b01111111111111111111111111111110))))

(declare-fun b!1475503 () Bool)

(assert (=> b!1475503 (= e!827820 e!827821)))

(declare-fun res!1002227 () Bool)

(assert (=> b!1475503 (= res!1002227 (and (is-Intermediate!12128 lt!644646) (not (undefined!12940 lt!644646)) (bvslt (x!132493 lt!644646) #b01111111111111111111111111111110) (bvsge (x!132493 lt!644646) #b00000000000000000000000000000000) (bvsge (x!132493 lt!644646) x!665)))))

(assert (=> b!1475503 (=> (not res!1002227) (not e!827821))))

(declare-fun d!155801 () Bool)

(assert (=> d!155801 e!827820))

(declare-fun c!136155 () Bool)

(assert (=> d!155801 (= c!136155 (and (is-Intermediate!12128 lt!644646) (undefined!12940 lt!644646)))))

(declare-fun e!827818 () SeekEntryResult!12128)

(assert (=> d!155801 (= lt!644646 e!827818)))

(declare-fun c!136154 () Bool)

(assert (=> d!155801 (= c!136154 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!644647 () (_ BitVec 64))

(assert (=> d!155801 (= lt!644647 (select (arr!47888 a!2862) index!646))))

(assert (=> d!155801 (validMask!0 mask!2687)))

(assert (=> d!155801 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47888 a!2862) j!93) a!2862 mask!2687) lt!644646)))

(declare-fun b!1475504 () Bool)

(assert (=> b!1475504 (and (bvsge (index!50906 lt!644646) #b00000000000000000000000000000000) (bvslt (index!50906 lt!644646) (size!48438 a!2862)))))

(declare-fun res!1002229 () Bool)

(assert (=> b!1475504 (= res!1002229 (= (select (arr!47888 a!2862) (index!50906 lt!644646)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1475504 (=> res!1002229 e!827819)))

(declare-fun b!1475505 () Bool)

(declare-fun e!827822 () SeekEntryResult!12128)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1475505 (= e!827822 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!47888 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1475506 () Bool)

(assert (=> b!1475506 (= e!827822 (Intermediate!12128 false index!646 x!665))))

(declare-fun b!1475507 () Bool)

(assert (=> b!1475507 (= e!827818 (Intermediate!12128 true index!646 x!665))))

(declare-fun b!1475508 () Bool)

(assert (=> b!1475508 (and (bvsge (index!50906 lt!644646) #b00000000000000000000000000000000) (bvslt (index!50906 lt!644646) (size!48438 a!2862)))))

(assert (=> b!1475508 (= e!827819 (= (select (arr!47888 a!2862) (index!50906 lt!644646)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1475509 () Bool)

(assert (=> b!1475509 (= e!827818 e!827822)))

(declare-fun c!136156 () Bool)

(assert (=> b!1475509 (= c!136156 (or (= lt!644647 (select (arr!47888 a!2862) j!93)) (= (bvadd lt!644647 lt!644647) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!155801 c!136154) b!1475507))

(assert (= (and d!155801 (not c!136154)) b!1475509))

(assert (= (and b!1475509 c!136156) b!1475506))

(assert (= (and b!1475509 (not c!136156)) b!1475505))

(assert (= (and d!155801 c!136155) b!1475502))

(assert (= (and d!155801 (not c!136155)) b!1475503))

(assert (= (and b!1475503 res!1002227) b!1475501))

(assert (= (and b!1475501 (not res!1002228)) b!1475504))

(assert (= (and b!1475504 (not res!1002229)) b!1475508))

(declare-fun m!1361751 () Bool)

(assert (=> b!1475505 m!1361751))

(assert (=> b!1475505 m!1361751))

(assert (=> b!1475505 m!1361519))

(declare-fun m!1361753 () Bool)

(assert (=> b!1475505 m!1361753))

(declare-fun m!1361755 () Bool)

(assert (=> b!1475508 m!1361755))

(assert (=> b!1475501 m!1361755))

(assert (=> d!155801 m!1361517))

(assert (=> d!155801 m!1361545))

(assert (=> b!1475504 m!1361755))

(assert (=> b!1475226 d!155801))

(declare-fun d!155823 () Bool)

(assert (=> d!155823 (= (validKeyInArray!0 (select (arr!47888 a!2862) i!1006)) (and (not (= (select (arr!47888 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47888 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1475215 d!155823))

(declare-fun b!1475549 () Bool)

(declare-fun e!827845 () SeekEntryResult!12128)

(assert (=> b!1475549 (= e!827845 (Found!12128 index!646))))

(declare-fun b!1475550 () Bool)

(declare-fun e!827846 () SeekEntryResult!12128)

(assert (=> b!1475550 (= e!827846 (MissingVacant!12128 intermediateAfterIndex!19))))

(declare-fun lt!644658 () SeekEntryResult!12128)

(declare-fun d!155825 () Bool)

(assert (=> d!155825 (and (or (is-Undefined!12128 lt!644658) (not (is-Found!12128 lt!644658)) (and (bvsge (index!50905 lt!644658) #b00000000000000000000000000000000) (bvslt (index!50905 lt!644658) (size!48438 lt!644540)))) (or (is-Undefined!12128 lt!644658) (is-Found!12128 lt!644658) (not (is-MissingVacant!12128 lt!644658)) (not (= (index!50907 lt!644658) intermediateAfterIndex!19)) (and (bvsge (index!50907 lt!644658) #b00000000000000000000000000000000) (bvslt (index!50907 lt!644658) (size!48438 lt!644540)))) (or (is-Undefined!12128 lt!644658) (ite (is-Found!12128 lt!644658) (= (select (arr!47888 lt!644540) (index!50905 lt!644658)) lt!644539) (and (is-MissingVacant!12128 lt!644658) (= (index!50907 lt!644658) intermediateAfterIndex!19) (= (select (arr!47888 lt!644540) (index!50907 lt!644658)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!827844 () SeekEntryResult!12128)

(assert (=> d!155825 (= lt!644658 e!827844)))

(declare-fun c!136172 () Bool)

(assert (=> d!155825 (= c!136172 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!644659 () (_ BitVec 64))

(assert (=> d!155825 (= lt!644659 (select (arr!47888 lt!644540) index!646))))

(assert (=> d!155825 (validMask!0 mask!2687)))

(assert (=> d!155825 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644539 lt!644540 mask!2687) lt!644658)))

(declare-fun b!1475551 () Bool)

(declare-fun c!136173 () Bool)

(assert (=> b!1475551 (= c!136173 (= lt!644659 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1475551 (= e!827845 e!827846)))

(declare-fun b!1475552 () Bool)

(assert (=> b!1475552 (= e!827844 Undefined!12128)))

(declare-fun b!1475553 () Bool)

(assert (=> b!1475553 (= e!827844 e!827845)))

(declare-fun c!136174 () Bool)

(assert (=> b!1475553 (= c!136174 (= lt!644659 lt!644539))))

(declare-fun b!1475554 () Bool)

(assert (=> b!1475554 (= e!827846 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!644539 lt!644540 mask!2687))))

(assert (= (and d!155825 c!136172) b!1475552))

(assert (= (and d!155825 (not c!136172)) b!1475553))

(assert (= (and b!1475553 c!136174) b!1475549))

(assert (= (and b!1475553 (not c!136174)) b!1475551))

(assert (= (and b!1475551 c!136173) b!1475550))

(assert (= (and b!1475551 (not c!136173)) b!1475554))

(declare-fun m!1361765 () Bool)

(assert (=> d!155825 m!1361765))

(declare-fun m!1361767 () Bool)

(assert (=> d!155825 m!1361767))

(declare-fun m!1361769 () Bool)

(assert (=> d!155825 m!1361769))

(assert (=> d!155825 m!1361545))

(assert (=> b!1475554 m!1361751))

(assert (=> b!1475554 m!1361751))

(declare-fun m!1361771 () Bool)

(assert (=> b!1475554 m!1361771))

(assert (=> b!1475224 d!155825))

(declare-fun e!827868 () SeekEntryResult!12128)

(declare-fun b!1475591 () Bool)

(declare-fun lt!644681 () SeekEntryResult!12128)

(assert (=> b!1475591 (= e!827868 (seekKeyOrZeroReturnVacant!0 (x!132493 lt!644681) (index!50906 lt!644681) (index!50906 lt!644681) lt!644539 lt!644540 mask!2687))))

(declare-fun b!1475592 () Bool)

(declare-fun c!136192 () Bool)

(declare-fun lt!644680 () (_ BitVec 64))

(assert (=> b!1475592 (= c!136192 (= lt!644680 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!827867 () SeekEntryResult!12128)

(assert (=> b!1475592 (= e!827867 e!827868)))

(declare-fun b!1475593 () Bool)

(assert (=> b!1475593 (= e!827868 (MissingZero!12128 (index!50906 lt!644681)))))

(declare-fun b!1475594 () Bool)

(declare-fun e!827866 () SeekEntryResult!12128)

(assert (=> b!1475594 (= e!827866 e!827867)))

(assert (=> b!1475594 (= lt!644680 (select (arr!47888 lt!644540) (index!50906 lt!644681)))))

(declare-fun c!136191 () Bool)

(assert (=> b!1475594 (= c!136191 (= lt!644680 lt!644539))))

(declare-fun d!155829 () Bool)

(declare-fun lt!644682 () SeekEntryResult!12128)

(assert (=> d!155829 (and (or (is-Undefined!12128 lt!644682) (not (is-Found!12128 lt!644682)) (and (bvsge (index!50905 lt!644682) #b00000000000000000000000000000000) (bvslt (index!50905 lt!644682) (size!48438 lt!644540)))) (or (is-Undefined!12128 lt!644682) (is-Found!12128 lt!644682) (not (is-MissingZero!12128 lt!644682)) (and (bvsge (index!50904 lt!644682) #b00000000000000000000000000000000) (bvslt (index!50904 lt!644682) (size!48438 lt!644540)))) (or (is-Undefined!12128 lt!644682) (is-Found!12128 lt!644682) (is-MissingZero!12128 lt!644682) (not (is-MissingVacant!12128 lt!644682)) (and (bvsge (index!50907 lt!644682) #b00000000000000000000000000000000) (bvslt (index!50907 lt!644682) (size!48438 lt!644540)))) (or (is-Undefined!12128 lt!644682) (ite (is-Found!12128 lt!644682) (= (select (arr!47888 lt!644540) (index!50905 lt!644682)) lt!644539) (ite (is-MissingZero!12128 lt!644682) (= (select (arr!47888 lt!644540) (index!50904 lt!644682)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12128 lt!644682) (= (select (arr!47888 lt!644540) (index!50907 lt!644682)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!155829 (= lt!644682 e!827866)))

(declare-fun c!136190 () Bool)

(assert (=> d!155829 (= c!136190 (and (is-Intermediate!12128 lt!644681) (undefined!12940 lt!644681)))))

(assert (=> d!155829 (= lt!644681 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644539 mask!2687) lt!644539 lt!644540 mask!2687))))

(assert (=> d!155829 (validMask!0 mask!2687)))

(assert (=> d!155829 (= (seekEntryOrOpen!0 lt!644539 lt!644540 mask!2687) lt!644682)))

(declare-fun b!1475595 () Bool)

(assert (=> b!1475595 (= e!827866 Undefined!12128)))

(declare-fun b!1475596 () Bool)

(assert (=> b!1475596 (= e!827867 (Found!12128 (index!50906 lt!644681)))))

(assert (= (and d!155829 c!136190) b!1475595))

(assert (= (and d!155829 (not c!136190)) b!1475594))

(assert (= (and b!1475594 c!136191) b!1475596))

(assert (= (and b!1475594 (not c!136191)) b!1475592))

(assert (= (and b!1475592 c!136192) b!1475593))

(assert (= (and b!1475592 (not c!136192)) b!1475591))

(declare-fun m!1361793 () Bool)

(assert (=> b!1475591 m!1361793))

(declare-fun m!1361795 () Bool)

(assert (=> b!1475594 m!1361795))

(assert (=> d!155829 m!1361503))

(declare-fun m!1361797 () Bool)

(assert (=> d!155829 m!1361797))

(assert (=> d!155829 m!1361545))

(declare-fun m!1361799 () Bool)

(assert (=> d!155829 m!1361799))

(assert (=> d!155829 m!1361503))

(assert (=> d!155829 m!1361505))

(declare-fun m!1361801 () Bool)

(assert (=> d!155829 m!1361801))

(assert (=> b!1475224 d!155829))

(declare-fun lt!644684 () SeekEntryResult!12128)

(declare-fun e!827871 () SeekEntryResult!12128)

(declare-fun b!1475597 () Bool)

(assert (=> b!1475597 (= e!827871 (seekKeyOrZeroReturnVacant!0 (x!132493 lt!644684) (index!50906 lt!644684) (index!50906 lt!644684) (select (arr!47888 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1475598 () Bool)

(declare-fun c!136195 () Bool)

(declare-fun lt!644683 () (_ BitVec 64))

(assert (=> b!1475598 (= c!136195 (= lt!644683 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!827870 () SeekEntryResult!12128)

(assert (=> b!1475598 (= e!827870 e!827871)))

(declare-fun b!1475599 () Bool)

(assert (=> b!1475599 (= e!827871 (MissingZero!12128 (index!50906 lt!644684)))))

(declare-fun b!1475600 () Bool)

(declare-fun e!827869 () SeekEntryResult!12128)

(assert (=> b!1475600 (= e!827869 e!827870)))

(assert (=> b!1475600 (= lt!644683 (select (arr!47888 a!2862) (index!50906 lt!644684)))))

(declare-fun c!136194 () Bool)

(assert (=> b!1475600 (= c!136194 (= lt!644683 (select (arr!47888 a!2862) j!93)))))

(declare-fun d!155843 () Bool)

(declare-fun lt!644685 () SeekEntryResult!12128)

(assert (=> d!155843 (and (or (is-Undefined!12128 lt!644685) (not (is-Found!12128 lt!644685)) (and (bvsge (index!50905 lt!644685) #b00000000000000000000000000000000) (bvslt (index!50905 lt!644685) (size!48438 a!2862)))) (or (is-Undefined!12128 lt!644685) (is-Found!12128 lt!644685) (not (is-MissingZero!12128 lt!644685)) (and (bvsge (index!50904 lt!644685) #b00000000000000000000000000000000) (bvslt (index!50904 lt!644685) (size!48438 a!2862)))) (or (is-Undefined!12128 lt!644685) (is-Found!12128 lt!644685) (is-MissingZero!12128 lt!644685) (not (is-MissingVacant!12128 lt!644685)) (and (bvsge (index!50907 lt!644685) #b00000000000000000000000000000000) (bvslt (index!50907 lt!644685) (size!48438 a!2862)))) (or (is-Undefined!12128 lt!644685) (ite (is-Found!12128 lt!644685) (= (select (arr!47888 a!2862) (index!50905 lt!644685)) (select (arr!47888 a!2862) j!93)) (ite (is-MissingZero!12128 lt!644685) (= (select (arr!47888 a!2862) (index!50904 lt!644685)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12128 lt!644685) (= (select (arr!47888 a!2862) (index!50907 lt!644685)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!155843 (= lt!644685 e!827869)))

(declare-fun c!136193 () Bool)

(assert (=> d!155843 (= c!136193 (and (is-Intermediate!12128 lt!644684) (undefined!12940 lt!644684)))))

(assert (=> d!155843 (= lt!644684 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47888 a!2862) j!93) mask!2687) (select (arr!47888 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!155843 (validMask!0 mask!2687)))

(assert (=> d!155843 (= (seekEntryOrOpen!0 (select (arr!47888 a!2862) j!93) a!2862 mask!2687) lt!644685)))

(declare-fun b!1475601 () Bool)

(assert (=> b!1475601 (= e!827869 Undefined!12128)))

(declare-fun b!1475602 () Bool)

(assert (=> b!1475602 (= e!827870 (Found!12128 (index!50906 lt!644684)))))

(assert (= (and d!155843 c!136193) b!1475601))

(assert (= (and d!155843 (not c!136193)) b!1475600))

(assert (= (and b!1475600 c!136194) b!1475602))

(assert (= (and b!1475600 (not c!136194)) b!1475598))

(assert (= (and b!1475598 c!136195) b!1475599))

(assert (= (and b!1475598 (not c!136195)) b!1475597))

(assert (=> b!1475597 m!1361519))

(declare-fun m!1361803 () Bool)

(assert (=> b!1475597 m!1361803))

(declare-fun m!1361805 () Bool)

(assert (=> b!1475600 m!1361805))

(assert (=> d!155843 m!1361519))

(assert (=> d!155843 m!1361541))

(declare-fun m!1361807 () Bool)

(assert (=> d!155843 m!1361807))

(assert (=> d!155843 m!1361545))

(declare-fun m!1361809 () Bool)

(assert (=> d!155843 m!1361809))

(assert (=> d!155843 m!1361541))

(assert (=> d!155843 m!1361519))

(assert (=> d!155843 m!1361543))

(declare-fun m!1361811 () Bool)

(assert (=> d!155843 m!1361811))

(assert (=> b!1475223 d!155843))

(declare-fun b!1475629 () Bool)

(declare-fun e!827889 () Bool)

(declare-fun call!67790 () Bool)

(assert (=> b!1475629 (= e!827889 call!67790)))

(declare-fun b!1475630 () Bool)

(declare-fun e!827888 () Bool)

(assert (=> b!1475630 (= e!827888 call!67790)))

(declare-fun bm!67787 () Bool)

(assert (=> bm!67787 (= call!67790 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1475632 () Bool)

(assert (=> b!1475632 (= e!827888 e!827889)))

(declare-fun lt!644703 () (_ BitVec 64))

(assert (=> b!1475632 (= lt!644703 (select (arr!47888 a!2862) j!93))))

(declare-fun lt!644701 () Unit!49596)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99212 (_ BitVec 64) (_ BitVec 32)) Unit!49596)

(assert (=> b!1475632 (= lt!644701 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!644703 j!93))))

(declare-fun arrayContainsKey!0 (array!99212 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1475632 (arrayContainsKey!0 a!2862 lt!644703 #b00000000000000000000000000000000)))

(declare-fun lt!644702 () Unit!49596)

(assert (=> b!1475632 (= lt!644702 lt!644701)))

(declare-fun res!1002250 () Bool)

(assert (=> b!1475632 (= res!1002250 (= (seekEntryOrOpen!0 (select (arr!47888 a!2862) j!93) a!2862 mask!2687) (Found!12128 j!93)))))

(assert (=> b!1475632 (=> (not res!1002250) (not e!827889))))

(declare-fun d!155845 () Bool)

(declare-fun res!1002251 () Bool)

(declare-fun e!827887 () Bool)

(assert (=> d!155845 (=> res!1002251 e!827887)))

(assert (=> d!155845 (= res!1002251 (bvsge j!93 (size!48438 a!2862)))))

(assert (=> d!155845 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!827887)))

(declare-fun b!1475631 () Bool)

(assert (=> b!1475631 (= e!827887 e!827888)))

(declare-fun c!136207 () Bool)

(assert (=> b!1475631 (= c!136207 (validKeyInArray!0 (select (arr!47888 a!2862) j!93)))))

(assert (= (and d!155845 (not res!1002251)) b!1475631))

(assert (= (and b!1475631 c!136207) b!1475632))

(assert (= (and b!1475631 (not c!136207)) b!1475630))

(assert (= (and b!1475632 res!1002250) b!1475629))

(assert (= (or b!1475629 b!1475630) bm!67787))

(declare-fun m!1361823 () Bool)

(assert (=> bm!67787 m!1361823))

(assert (=> b!1475632 m!1361519))

(declare-fun m!1361825 () Bool)

(assert (=> b!1475632 m!1361825))

(declare-fun m!1361827 () Bool)

(assert (=> b!1475632 m!1361827))

(assert (=> b!1475632 m!1361519))

(assert (=> b!1475632 m!1361521))

(assert (=> b!1475631 m!1361519))

(assert (=> b!1475631 m!1361519))

(assert (=> b!1475631 m!1361553))

(assert (=> b!1475223 d!155845))

(declare-fun d!155849 () Bool)

(assert (=> d!155849 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!644708 () Unit!49596)

(declare-fun choose!38 (array!99212 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49596)

(assert (=> d!155849 (= lt!644708 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!155849 (validMask!0 mask!2687)))

(assert (=> d!155849 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!644708)))

(declare-fun bs!42576 () Bool)

(assert (= bs!42576 d!155849))

(assert (=> bs!42576 m!1361523))

(declare-fun m!1361837 () Bool)

(assert (=> bs!42576 m!1361837))

(assert (=> bs!42576 m!1361545))

(assert (=> b!1475223 d!155849))

(declare-fun b!1475657 () Bool)

(declare-fun lt!644709 () SeekEntryResult!12128)

(assert (=> b!1475657 (and (bvsge (index!50906 lt!644709) #b00000000000000000000000000000000) (bvslt (index!50906 lt!644709) (size!48438 lt!644540)))))

(declare-fun res!1002265 () Bool)

(assert (=> b!1475657 (= res!1002265 (= (select (arr!47888 lt!644540) (index!50906 lt!644709)) lt!644539))))

(declare-fun e!827908 () Bool)

(assert (=> b!1475657 (=> res!1002265 e!827908)))

(declare-fun e!827910 () Bool)

(assert (=> b!1475657 (= e!827910 e!827908)))

(declare-fun b!1475658 () Bool)

(declare-fun e!827909 () Bool)

(assert (=> b!1475658 (= e!827909 (bvsge (x!132493 lt!644709) #b01111111111111111111111111111110))))

(declare-fun b!1475659 () Bool)

(assert (=> b!1475659 (= e!827909 e!827910)))

(declare-fun res!1002264 () Bool)

(assert (=> b!1475659 (= res!1002264 (and (is-Intermediate!12128 lt!644709) (not (undefined!12940 lt!644709)) (bvslt (x!132493 lt!644709) #b01111111111111111111111111111110) (bvsge (x!132493 lt!644709) #b00000000000000000000000000000000) (bvsge (x!132493 lt!644709) #b00000000000000000000000000000000)))))

(assert (=> b!1475659 (=> (not res!1002264) (not e!827910))))

(declare-fun d!155855 () Bool)

(assert (=> d!155855 e!827909))

(declare-fun c!136215 () Bool)

(assert (=> d!155855 (= c!136215 (and (is-Intermediate!12128 lt!644709) (undefined!12940 lt!644709)))))

(declare-fun e!827907 () SeekEntryResult!12128)

(assert (=> d!155855 (= lt!644709 e!827907)))

(declare-fun c!136214 () Bool)

(assert (=> d!155855 (= c!136214 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!644710 () (_ BitVec 64))

(assert (=> d!155855 (= lt!644710 (select (arr!47888 lt!644540) (toIndex!0 lt!644539 mask!2687)))))

(assert (=> d!155855 (validMask!0 mask!2687)))

(assert (=> d!155855 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644539 mask!2687) lt!644539 lt!644540 mask!2687) lt!644709)))

(declare-fun b!1475660 () Bool)

(assert (=> b!1475660 (and (bvsge (index!50906 lt!644709) #b00000000000000000000000000000000) (bvslt (index!50906 lt!644709) (size!48438 lt!644540)))))

(declare-fun res!1002266 () Bool)

(assert (=> b!1475660 (= res!1002266 (= (select (arr!47888 lt!644540) (index!50906 lt!644709)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1475660 (=> res!1002266 e!827908)))

(declare-fun e!827911 () SeekEntryResult!12128)

(declare-fun b!1475661 () Bool)

(assert (=> b!1475661 (= e!827911 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!644539 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!644539 lt!644540 mask!2687))))

(declare-fun b!1475662 () Bool)

(assert (=> b!1475662 (= e!827911 (Intermediate!12128 false (toIndex!0 lt!644539 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1475663 () Bool)

(assert (=> b!1475663 (= e!827907 (Intermediate!12128 true (toIndex!0 lt!644539 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1475664 () Bool)

(assert (=> b!1475664 (and (bvsge (index!50906 lt!644709) #b00000000000000000000000000000000) (bvslt (index!50906 lt!644709) (size!48438 lt!644540)))))

(assert (=> b!1475664 (= e!827908 (= (select (arr!47888 lt!644540) (index!50906 lt!644709)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1475665 () Bool)

(assert (=> b!1475665 (= e!827907 e!827911)))

(declare-fun c!136216 () Bool)

(assert (=> b!1475665 (= c!136216 (or (= lt!644710 lt!644539) (= (bvadd lt!644710 lt!644710) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!155855 c!136214) b!1475663))

(assert (= (and d!155855 (not c!136214)) b!1475665))

(assert (= (and b!1475665 c!136216) b!1475662))

(assert (= (and b!1475665 (not c!136216)) b!1475661))

(assert (= (and d!155855 c!136215) b!1475658))

(assert (= (and d!155855 (not c!136215)) b!1475659))

(assert (= (and b!1475659 res!1002264) b!1475657))

(assert (= (and b!1475657 (not res!1002265)) b!1475660))

(assert (= (and b!1475660 (not res!1002266)) b!1475664))

(assert (=> b!1475661 m!1361503))

(declare-fun m!1361843 () Bool)

(assert (=> b!1475661 m!1361843))

(assert (=> b!1475661 m!1361843))

(declare-fun m!1361845 () Bool)

(assert (=> b!1475661 m!1361845))

(declare-fun m!1361847 () Bool)

(assert (=> b!1475664 m!1361847))

(assert (=> b!1475657 m!1361847))

(assert (=> d!155855 m!1361503))

(declare-fun m!1361849 () Bool)

(assert (=> d!155855 m!1361849))

(assert (=> d!155855 m!1361545))

(assert (=> b!1475660 m!1361847))

(assert (=> b!1475222 d!155855))

(declare-fun d!155859 () Bool)

(declare-fun lt!644716 () (_ BitVec 32))

(declare-fun lt!644715 () (_ BitVec 32))

(assert (=> d!155859 (= lt!644716 (bvmul (bvxor lt!644715 (bvlshr lt!644715 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155859 (= lt!644715 ((_ extract 31 0) (bvand (bvxor lt!644539 (bvlshr lt!644539 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155859 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1002267 (let ((h!35752 ((_ extract 31 0) (bvand (bvxor lt!644539 (bvlshr lt!644539 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132504 (bvmul (bvxor h!35752 (bvlshr h!35752 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132504 (bvlshr x!132504 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1002267 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1002267 #b00000000000000000000000000000000))))))

(assert (=> d!155859 (= (toIndex!0 lt!644539 mask!2687) (bvand (bvxor lt!644716 (bvlshr lt!644716 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1475222 d!155859))

(declare-fun b!1475670 () Bool)

(declare-fun e!827915 () SeekEntryResult!12128)

(assert (=> b!1475670 (= e!827915 (Found!12128 index!646))))

(declare-fun b!1475671 () Bool)

(declare-fun e!827916 () SeekEntryResult!12128)

(assert (=> b!1475671 (= e!827916 (MissingVacant!12128 index!646))))

(declare-fun d!155861 () Bool)

(declare-fun lt!644717 () SeekEntryResult!12128)

(assert (=> d!155861 (and (or (is-Undefined!12128 lt!644717) (not (is-Found!12128 lt!644717)) (and (bvsge (index!50905 lt!644717) #b00000000000000000000000000000000) (bvslt (index!50905 lt!644717) (size!48438 a!2862)))) (or (is-Undefined!12128 lt!644717) (is-Found!12128 lt!644717) (not (is-MissingVacant!12128 lt!644717)) (not (= (index!50907 lt!644717) index!646)) (and (bvsge (index!50907 lt!644717) #b00000000000000000000000000000000) (bvslt (index!50907 lt!644717) (size!48438 a!2862)))) (or (is-Undefined!12128 lt!644717) (ite (is-Found!12128 lt!644717) (= (select (arr!47888 a!2862) (index!50905 lt!644717)) (select (arr!47888 a!2862) j!93)) (and (is-MissingVacant!12128 lt!644717) (= (index!50907 lt!644717) index!646) (= (select (arr!47888 a!2862) (index!50907 lt!644717)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!827914 () SeekEntryResult!12128)

(assert (=> d!155861 (= lt!644717 e!827914)))

(declare-fun c!136217 () Bool)

(assert (=> d!155861 (= c!136217 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!644718 () (_ BitVec 64))

(assert (=> d!155861 (= lt!644718 (select (arr!47888 a!2862) index!646))))

(assert (=> d!155861 (validMask!0 mask!2687)))

(assert (=> d!155861 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47888 a!2862) j!93) a!2862 mask!2687) lt!644717)))

(declare-fun b!1475672 () Bool)

(declare-fun c!136218 () Bool)

(assert (=> b!1475672 (= c!136218 (= lt!644718 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1475672 (= e!827915 e!827916)))

(declare-fun b!1475673 () Bool)

(assert (=> b!1475673 (= e!827914 Undefined!12128)))

(declare-fun b!1475674 () Bool)

(assert (=> b!1475674 (= e!827914 e!827915)))

(declare-fun c!136219 () Bool)

(assert (=> b!1475674 (= c!136219 (= lt!644718 (select (arr!47888 a!2862) j!93)))))

(declare-fun b!1475675 () Bool)

(assert (=> b!1475675 (= e!827916 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) index!646 (select (arr!47888 a!2862) j!93) a!2862 mask!2687))))

(assert (= (and d!155861 c!136217) b!1475673))

(assert (= (and d!155861 (not c!136217)) b!1475674))

(assert (= (and b!1475674 c!136219) b!1475670))

(assert (= (and b!1475674 (not c!136219)) b!1475672))

(assert (= (and b!1475672 c!136218) b!1475671))

(assert (= (and b!1475672 (not c!136218)) b!1475675))

(declare-fun m!1361851 () Bool)

(assert (=> d!155861 m!1361851))

(declare-fun m!1361853 () Bool)

(assert (=> d!155861 m!1361853))

(assert (=> d!155861 m!1361517))

(assert (=> d!155861 m!1361545))

(assert (=> b!1475675 m!1361751))

(assert (=> b!1475675 m!1361751))

(assert (=> b!1475675 m!1361519))

(declare-fun m!1361855 () Bool)

(assert (=> b!1475675 m!1361855))

(assert (=> b!1475221 d!155861))

(declare-fun b!1475680 () Bool)

(declare-fun lt!644725 () SeekEntryResult!12128)

(assert (=> b!1475680 (and (bvsge (index!50906 lt!644725) #b00000000000000000000000000000000) (bvslt (index!50906 lt!644725) (size!48438 a!2862)))))

(declare-fun res!1002273 () Bool)

(assert (=> b!1475680 (= res!1002273 (= (select (arr!47888 a!2862) (index!50906 lt!644725)) (select (arr!47888 a!2862) j!93)))))

(declare-fun e!827922 () Bool)

(assert (=> b!1475680 (=> res!1002273 e!827922)))

(declare-fun e!827924 () Bool)

(assert (=> b!1475680 (= e!827924 e!827922)))


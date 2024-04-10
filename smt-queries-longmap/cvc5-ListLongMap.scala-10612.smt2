; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124810 () Bool)

(assert start!124810)

(declare-fun b!1448313 () Bool)

(declare-fun e!815650 () Bool)

(declare-fun e!815652 () Bool)

(assert (=> b!1448313 (= e!815650 e!815652)))

(declare-fun res!979877 () Bool)

(assert (=> b!1448313 (=> (not res!979877) (not e!815652))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98258 0))(
  ( (array!98259 (arr!47417 (Array (_ BitVec 32) (_ BitVec 64))) (size!47967 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98258)

(assert (=> b!1448313 (= res!979877 (= (select (store (arr!47417 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!635486 () array!98258)

(assert (=> b!1448313 (= lt!635486 (array!98259 (store (arr!47417 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47967 a!2862)))))

(declare-fun b!1448314 () Bool)

(declare-fun res!979872 () Bool)

(declare-fun e!815653 () Bool)

(assert (=> b!1448314 (=> (not res!979872) (not e!815653))))

(declare-fun e!815649 () Bool)

(assert (=> b!1448314 (= res!979872 e!815649)))

(declare-fun c!133731 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1448314 (= c!133731 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1448315 () Bool)

(declare-fun e!815654 () Bool)

(assert (=> b!1448315 (= e!815654 e!815653)))

(declare-fun res!979886 () Bool)

(assert (=> b!1448315 (=> (not res!979886) (not e!815653))))

(declare-datatypes ((SeekEntryResult!11669 0))(
  ( (MissingZero!11669 (index!49068 (_ BitVec 32))) (Found!11669 (index!49069 (_ BitVec 32))) (Intermediate!11669 (undefined!12481 Bool) (index!49070 (_ BitVec 32)) (x!130742 (_ BitVec 32))) (Undefined!11669) (MissingVacant!11669 (index!49071 (_ BitVec 32))) )
))
(declare-fun lt!635488 () SeekEntryResult!11669)

(assert (=> b!1448315 (= res!979886 (= lt!635488 (Intermediate!11669 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!635490 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98258 (_ BitVec 32)) SeekEntryResult!11669)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1448315 (= lt!635488 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635490 mask!2687) lt!635490 lt!635486 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1448315 (= lt!635490 (select (store (arr!47417 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1448316 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98258 (_ BitVec 32)) SeekEntryResult!11669)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98258 (_ BitVec 32)) SeekEntryResult!11669)

(assert (=> b!1448316 (= e!815649 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635490 lt!635486 mask!2687) (seekEntryOrOpen!0 lt!635490 lt!635486 mask!2687)))))

(declare-fun b!1448317 () Bool)

(declare-fun res!979880 () Bool)

(assert (=> b!1448317 (=> (not res!979880) (not e!815650))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98258 (_ BitVec 32)) Bool)

(assert (=> b!1448317 (= res!979880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1448318 () Bool)

(declare-fun res!979873 () Bool)

(assert (=> b!1448318 (=> (not res!979873) (not e!815650))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1448318 (= res!979873 (validKeyInArray!0 (select (arr!47417 a!2862) i!1006)))))

(declare-fun b!1448319 () Bool)

(declare-fun res!979885 () Bool)

(assert (=> b!1448319 (=> (not res!979885) (not e!815650))))

(assert (=> b!1448319 (= res!979885 (validKeyInArray!0 (select (arr!47417 a!2862) j!93)))))

(declare-fun b!1448320 () Bool)

(declare-fun res!979884 () Bool)

(assert (=> b!1448320 (=> (not res!979884) (not e!815650))))

(declare-datatypes ((List!33918 0))(
  ( (Nil!33915) (Cons!33914 (h!35264 (_ BitVec 64)) (t!48612 List!33918)) )
))
(declare-fun arrayNoDuplicates!0 (array!98258 (_ BitVec 32) List!33918) Bool)

(assert (=> b!1448320 (= res!979884 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33915))))

(declare-fun b!1448321 () Bool)

(declare-fun res!979875 () Bool)

(assert (=> b!1448321 (=> (not res!979875) (not e!815654))))

(declare-fun lt!635487 () SeekEntryResult!11669)

(assert (=> b!1448321 (= res!979875 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47417 a!2862) j!93) a!2862 mask!2687) lt!635487))))

(declare-fun b!1448322 () Bool)

(declare-fun e!815645 () Bool)

(declare-fun e!815646 () Bool)

(assert (=> b!1448322 (= e!815645 e!815646)))

(declare-fun res!979887 () Bool)

(assert (=> b!1448322 (=> res!979887 e!815646)))

(assert (=> b!1448322 (= res!979887 (or (and (= (select (arr!47417 a!2862) index!646) (select (store (arr!47417 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47417 a!2862) index!646) (select (arr!47417 a!2862) j!93))) (not (= (select (arr!47417 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1448323 () Bool)

(declare-fun e!815651 () Bool)

(assert (=> b!1448323 (= e!815653 (not e!815651))))

(declare-fun res!979874 () Bool)

(assert (=> b!1448323 (=> res!979874 e!815651)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1448323 (= res!979874 (or (and (= (select (arr!47417 a!2862) index!646) (select (store (arr!47417 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47417 a!2862) index!646) (select (arr!47417 a!2862) j!93))) (not (= (select (arr!47417 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47417 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1448323 e!815645))

(declare-fun res!979876 () Bool)

(assert (=> b!1448323 (=> (not res!979876) (not e!815645))))

(declare-fun lt!635489 () SeekEntryResult!11669)

(assert (=> b!1448323 (= res!979876 (and (= lt!635489 (Found!11669 j!93)) (or (= (select (arr!47417 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47417 a!2862) intermediateBeforeIndex!19) (select (arr!47417 a!2862) j!93)))))))

(assert (=> b!1448323 (= lt!635489 (seekEntryOrOpen!0 (select (arr!47417 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1448323 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48834 0))(
  ( (Unit!48835) )
))
(declare-fun lt!635485 () Unit!48834)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98258 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48834)

(assert (=> b!1448323 (= lt!635485 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1448324 () Bool)

(declare-fun res!979883 () Bool)

(assert (=> b!1448324 (=> (not res!979883) (not e!815650))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1448324 (= res!979883 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47967 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47967 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47967 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1448325 () Bool)

(declare-fun e!815647 () Bool)

(assert (=> b!1448325 (= e!815646 e!815647)))

(declare-fun res!979879 () Bool)

(assert (=> b!1448325 (=> (not res!979879) (not e!815647))))

(assert (=> b!1448325 (= res!979879 (= lt!635489 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47417 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1448326 () Bool)

(declare-fun res!979882 () Bool)

(assert (=> b!1448326 (=> (not res!979882) (not e!815650))))

(assert (=> b!1448326 (= res!979882 (and (= (size!47967 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47967 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47967 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!979888 () Bool)

(assert (=> start!124810 (=> (not res!979888) (not e!815650))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124810 (= res!979888 (validMask!0 mask!2687))))

(assert (=> start!124810 e!815650))

(assert (=> start!124810 true))

(declare-fun array_inv!36445 (array!98258) Bool)

(assert (=> start!124810 (array_inv!36445 a!2862)))

(declare-fun b!1448327 () Bool)

(declare-fun res!979881 () Bool)

(assert (=> b!1448327 (=> (not res!979881) (not e!815653))))

(assert (=> b!1448327 (= res!979881 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1448328 () Bool)

(assert (=> b!1448328 (= e!815647 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1448329 () Bool)

(assert (=> b!1448329 (= e!815652 e!815654)))

(declare-fun res!979878 () Bool)

(assert (=> b!1448329 (=> (not res!979878) (not e!815654))))

(assert (=> b!1448329 (= res!979878 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47417 a!2862) j!93) mask!2687) (select (arr!47417 a!2862) j!93) a!2862 mask!2687) lt!635487))))

(assert (=> b!1448329 (= lt!635487 (Intermediate!11669 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1448330 () Bool)

(assert (=> b!1448330 (= e!815649 (= lt!635488 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635490 lt!635486 mask!2687)))))

(declare-fun b!1448331 () Bool)

(assert (=> b!1448331 (= e!815651 true)))

(declare-fun lt!635484 () SeekEntryResult!11669)

(assert (=> b!1448331 (= lt!635484 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47417 a!2862) j!93) a!2862 mask!2687))))

(assert (= (and start!124810 res!979888) b!1448326))

(assert (= (and b!1448326 res!979882) b!1448318))

(assert (= (and b!1448318 res!979873) b!1448319))

(assert (= (and b!1448319 res!979885) b!1448317))

(assert (= (and b!1448317 res!979880) b!1448320))

(assert (= (and b!1448320 res!979884) b!1448324))

(assert (= (and b!1448324 res!979883) b!1448313))

(assert (= (and b!1448313 res!979877) b!1448329))

(assert (= (and b!1448329 res!979878) b!1448321))

(assert (= (and b!1448321 res!979875) b!1448315))

(assert (= (and b!1448315 res!979886) b!1448314))

(assert (= (and b!1448314 c!133731) b!1448330))

(assert (= (and b!1448314 (not c!133731)) b!1448316))

(assert (= (and b!1448314 res!979872) b!1448327))

(assert (= (and b!1448327 res!979881) b!1448323))

(assert (= (and b!1448323 res!979876) b!1448322))

(assert (= (and b!1448322 (not res!979887)) b!1448325))

(assert (= (and b!1448325 res!979879) b!1448328))

(assert (= (and b!1448323 (not res!979874)) b!1448331))

(declare-fun m!1337083 () Bool)

(assert (=> b!1448323 m!1337083))

(declare-fun m!1337085 () Bool)

(assert (=> b!1448323 m!1337085))

(declare-fun m!1337087 () Bool)

(assert (=> b!1448323 m!1337087))

(declare-fun m!1337089 () Bool)

(assert (=> b!1448323 m!1337089))

(declare-fun m!1337091 () Bool)

(assert (=> b!1448323 m!1337091))

(declare-fun m!1337093 () Bool)

(assert (=> b!1448323 m!1337093))

(declare-fun m!1337095 () Bool)

(assert (=> b!1448323 m!1337095))

(declare-fun m!1337097 () Bool)

(assert (=> b!1448323 m!1337097))

(assert (=> b!1448323 m!1337093))

(assert (=> b!1448331 m!1337093))

(assert (=> b!1448331 m!1337093))

(declare-fun m!1337099 () Bool)

(assert (=> b!1448331 m!1337099))

(declare-fun m!1337101 () Bool)

(assert (=> b!1448330 m!1337101))

(assert (=> b!1448322 m!1337091))

(assert (=> b!1448322 m!1337085))

(assert (=> b!1448322 m!1337089))

(assert (=> b!1448322 m!1337093))

(declare-fun m!1337103 () Bool)

(assert (=> start!124810 m!1337103))

(declare-fun m!1337105 () Bool)

(assert (=> start!124810 m!1337105))

(declare-fun m!1337107 () Bool)

(assert (=> b!1448320 m!1337107))

(declare-fun m!1337109 () Bool)

(assert (=> b!1448316 m!1337109))

(declare-fun m!1337111 () Bool)

(assert (=> b!1448316 m!1337111))

(assert (=> b!1448319 m!1337093))

(assert (=> b!1448319 m!1337093))

(declare-fun m!1337113 () Bool)

(assert (=> b!1448319 m!1337113))

(assert (=> b!1448329 m!1337093))

(assert (=> b!1448329 m!1337093))

(declare-fun m!1337115 () Bool)

(assert (=> b!1448329 m!1337115))

(assert (=> b!1448329 m!1337115))

(assert (=> b!1448329 m!1337093))

(declare-fun m!1337117 () Bool)

(assert (=> b!1448329 m!1337117))

(assert (=> b!1448313 m!1337085))

(declare-fun m!1337119 () Bool)

(assert (=> b!1448313 m!1337119))

(assert (=> b!1448321 m!1337093))

(assert (=> b!1448321 m!1337093))

(declare-fun m!1337121 () Bool)

(assert (=> b!1448321 m!1337121))

(assert (=> b!1448325 m!1337093))

(assert (=> b!1448325 m!1337093))

(declare-fun m!1337123 () Bool)

(assert (=> b!1448325 m!1337123))

(declare-fun m!1337125 () Bool)

(assert (=> b!1448317 m!1337125))

(declare-fun m!1337127 () Bool)

(assert (=> b!1448318 m!1337127))

(assert (=> b!1448318 m!1337127))

(declare-fun m!1337129 () Bool)

(assert (=> b!1448318 m!1337129))

(declare-fun m!1337131 () Bool)

(assert (=> b!1448315 m!1337131))

(assert (=> b!1448315 m!1337131))

(declare-fun m!1337133 () Bool)

(assert (=> b!1448315 m!1337133))

(assert (=> b!1448315 m!1337085))

(declare-fun m!1337135 () Bool)

(assert (=> b!1448315 m!1337135))

(push 1)


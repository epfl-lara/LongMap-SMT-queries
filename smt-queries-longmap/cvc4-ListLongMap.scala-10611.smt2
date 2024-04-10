; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124808 () Bool)

(assert start!124808)

(declare-fun b!1448256 () Bool)

(declare-fun res!979832 () Bool)

(declare-fun e!815623 () Bool)

(assert (=> b!1448256 (=> (not res!979832) (not e!815623))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11668 0))(
  ( (MissingZero!11668 (index!49064 (_ BitVec 32))) (Found!11668 (index!49065 (_ BitVec 32))) (Intermediate!11668 (undefined!12480 Bool) (index!49066 (_ BitVec 32)) (x!130733 (_ BitVec 32))) (Undefined!11668) (MissingVacant!11668 (index!49067 (_ BitVec 32))) )
))
(declare-fun lt!635468 () SeekEntryResult!11668)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98256 0))(
  ( (array!98257 (arr!47416 (Array (_ BitVec 32) (_ BitVec 64))) (size!47966 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98256)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98256 (_ BitVec 32)) SeekEntryResult!11668)

(assert (=> b!1448256 (= res!979832 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47416 a!2862) j!93) a!2862 mask!2687) lt!635468))))

(declare-fun b!1448257 () Bool)

(declare-fun res!979822 () Bool)

(declare-fun e!815620 () Bool)

(assert (=> b!1448257 (=> (not res!979822) (not e!815620))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98256 (_ BitVec 32)) Bool)

(assert (=> b!1448257 (= res!979822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1448258 () Bool)

(declare-fun e!815615 () Bool)

(assert (=> b!1448258 (= e!815615 e!815623)))

(declare-fun res!979823 () Bool)

(assert (=> b!1448258 (=> (not res!979823) (not e!815623))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1448258 (= res!979823 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47416 a!2862) j!93) mask!2687) (select (arr!47416 a!2862) j!93) a!2862 mask!2687) lt!635468))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1448258 (= lt!635468 (Intermediate!11668 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1448259 () Bool)

(declare-fun res!979833 () Bool)

(assert (=> b!1448259 (=> (not res!979833) (not e!815620))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1448259 (= res!979833 (validKeyInArray!0 (select (arr!47416 a!2862) j!93)))))

(declare-fun b!1448260 () Bool)

(declare-fun e!815618 () Bool)

(assert (=> b!1448260 (= e!815618 true)))

(declare-fun lt!635467 () SeekEntryResult!11668)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98256 (_ BitVec 32)) SeekEntryResult!11668)

(assert (=> b!1448260 (= lt!635467 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47416 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1448261 () Bool)

(declare-fun e!815619 () Bool)

(declare-fun e!815622 () Bool)

(assert (=> b!1448261 (= e!815619 e!815622)))

(declare-fun res!979828 () Bool)

(assert (=> b!1448261 (=> res!979828 e!815622)))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1448261 (= res!979828 (or (and (= (select (arr!47416 a!2862) index!646) (select (store (arr!47416 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47416 a!2862) index!646) (select (arr!47416 a!2862) j!93))) (not (= (select (arr!47416 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1448262 () Bool)

(declare-fun res!979825 () Bool)

(assert (=> b!1448262 (=> (not res!979825) (not e!815620))))

(assert (=> b!1448262 (= res!979825 (validKeyInArray!0 (select (arr!47416 a!2862) i!1006)))))

(declare-fun res!979835 () Bool)

(assert (=> start!124808 (=> (not res!979835) (not e!815620))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124808 (= res!979835 (validMask!0 mask!2687))))

(assert (=> start!124808 e!815620))

(assert (=> start!124808 true))

(declare-fun array_inv!36444 (array!98256) Bool)

(assert (=> start!124808 (array_inv!36444 a!2862)))

(declare-fun b!1448263 () Bool)

(declare-fun res!979836 () Bool)

(assert (=> b!1448263 (=> (not res!979836) (not e!815620))))

(declare-datatypes ((List!33917 0))(
  ( (Nil!33914) (Cons!33913 (h!35263 (_ BitVec 64)) (t!48611 List!33917)) )
))
(declare-fun arrayNoDuplicates!0 (array!98256 (_ BitVec 32) List!33917) Bool)

(assert (=> b!1448263 (= res!979836 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33914))))

(declare-fun lt!635464 () array!98256)

(declare-fun e!815621 () Bool)

(declare-fun lt!635469 () (_ BitVec 64))

(declare-fun b!1448264 () Bool)

(declare-fun lt!635465 () SeekEntryResult!11668)

(assert (=> b!1448264 (= e!815621 (= lt!635465 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635469 lt!635464 mask!2687)))))

(declare-fun b!1448265 () Bool)

(declare-fun res!979829 () Bool)

(declare-fun e!815624 () Bool)

(assert (=> b!1448265 (=> (not res!979829) (not e!815624))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1448265 (= res!979829 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1448266 () Bool)

(declare-fun e!815617 () Bool)

(assert (=> b!1448266 (= e!815622 e!815617)))

(declare-fun res!979834 () Bool)

(assert (=> b!1448266 (=> (not res!979834) (not e!815617))))

(declare-fun lt!635463 () SeekEntryResult!11668)

(assert (=> b!1448266 (= res!979834 (= lt!635463 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47416 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1448267 () Bool)

(declare-fun res!979830 () Bool)

(assert (=> b!1448267 (=> (not res!979830) (not e!815624))))

(assert (=> b!1448267 (= res!979830 e!815621)))

(declare-fun c!133728 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1448267 (= c!133728 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1448268 () Bool)

(declare-fun res!979837 () Bool)

(assert (=> b!1448268 (=> (not res!979837) (not e!815620))))

(assert (=> b!1448268 (= res!979837 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47966 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47966 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47966 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1448269 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98256 (_ BitVec 32)) SeekEntryResult!11668)

(assert (=> b!1448269 (= e!815621 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635469 lt!635464 mask!2687) (seekEntryOrOpen!0 lt!635469 lt!635464 mask!2687)))))

(declare-fun b!1448270 () Bool)

(assert (=> b!1448270 (= e!815623 e!815624)))

(declare-fun res!979827 () Bool)

(assert (=> b!1448270 (=> (not res!979827) (not e!815624))))

(assert (=> b!1448270 (= res!979827 (= lt!635465 (Intermediate!11668 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1448270 (= lt!635465 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635469 mask!2687) lt!635469 lt!635464 mask!2687))))

(assert (=> b!1448270 (= lt!635469 (select (store (arr!47416 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1448271 () Bool)

(assert (=> b!1448271 (= e!815617 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1448272 () Bool)

(assert (=> b!1448272 (= e!815624 (not e!815618))))

(declare-fun res!979831 () Bool)

(assert (=> b!1448272 (=> res!979831 e!815618)))

(assert (=> b!1448272 (= res!979831 (or (and (= (select (arr!47416 a!2862) index!646) (select (store (arr!47416 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47416 a!2862) index!646) (select (arr!47416 a!2862) j!93))) (not (= (select (arr!47416 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47416 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1448272 e!815619))

(declare-fun res!979826 () Bool)

(assert (=> b!1448272 (=> (not res!979826) (not e!815619))))

(assert (=> b!1448272 (= res!979826 (and (= lt!635463 (Found!11668 j!93)) (or (= (select (arr!47416 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47416 a!2862) intermediateBeforeIndex!19) (select (arr!47416 a!2862) j!93)))))))

(assert (=> b!1448272 (= lt!635463 (seekEntryOrOpen!0 (select (arr!47416 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1448272 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48832 0))(
  ( (Unit!48833) )
))
(declare-fun lt!635466 () Unit!48832)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98256 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48832)

(assert (=> b!1448272 (= lt!635466 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1448273 () Bool)

(declare-fun res!979821 () Bool)

(assert (=> b!1448273 (=> (not res!979821) (not e!815620))))

(assert (=> b!1448273 (= res!979821 (and (= (size!47966 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47966 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47966 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1448274 () Bool)

(assert (=> b!1448274 (= e!815620 e!815615)))

(declare-fun res!979824 () Bool)

(assert (=> b!1448274 (=> (not res!979824) (not e!815615))))

(assert (=> b!1448274 (= res!979824 (= (select (store (arr!47416 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1448274 (= lt!635464 (array!98257 (store (arr!47416 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47966 a!2862)))))

(assert (= (and start!124808 res!979835) b!1448273))

(assert (= (and b!1448273 res!979821) b!1448262))

(assert (= (and b!1448262 res!979825) b!1448259))

(assert (= (and b!1448259 res!979833) b!1448257))

(assert (= (and b!1448257 res!979822) b!1448263))

(assert (= (and b!1448263 res!979836) b!1448268))

(assert (= (and b!1448268 res!979837) b!1448274))

(assert (= (and b!1448274 res!979824) b!1448258))

(assert (= (and b!1448258 res!979823) b!1448256))

(assert (= (and b!1448256 res!979832) b!1448270))

(assert (= (and b!1448270 res!979827) b!1448267))

(assert (= (and b!1448267 c!133728) b!1448264))

(assert (= (and b!1448267 (not c!133728)) b!1448269))

(assert (= (and b!1448267 res!979830) b!1448265))

(assert (= (and b!1448265 res!979829) b!1448272))

(assert (= (and b!1448272 res!979826) b!1448261))

(assert (= (and b!1448261 (not res!979828)) b!1448266))

(assert (= (and b!1448266 res!979834) b!1448271))

(assert (= (and b!1448272 (not res!979831)) b!1448260))

(declare-fun m!1337029 () Bool)

(assert (=> b!1448256 m!1337029))

(assert (=> b!1448256 m!1337029))

(declare-fun m!1337031 () Bool)

(assert (=> b!1448256 m!1337031))

(declare-fun m!1337033 () Bool)

(assert (=> b!1448272 m!1337033))

(declare-fun m!1337035 () Bool)

(assert (=> b!1448272 m!1337035))

(declare-fun m!1337037 () Bool)

(assert (=> b!1448272 m!1337037))

(declare-fun m!1337039 () Bool)

(assert (=> b!1448272 m!1337039))

(declare-fun m!1337041 () Bool)

(assert (=> b!1448272 m!1337041))

(assert (=> b!1448272 m!1337029))

(declare-fun m!1337043 () Bool)

(assert (=> b!1448272 m!1337043))

(declare-fun m!1337045 () Bool)

(assert (=> b!1448272 m!1337045))

(assert (=> b!1448272 m!1337029))

(assert (=> b!1448274 m!1337035))

(declare-fun m!1337047 () Bool)

(assert (=> b!1448274 m!1337047))

(declare-fun m!1337049 () Bool)

(assert (=> b!1448263 m!1337049))

(assert (=> b!1448260 m!1337029))

(assert (=> b!1448260 m!1337029))

(declare-fun m!1337051 () Bool)

(assert (=> b!1448260 m!1337051))

(declare-fun m!1337053 () Bool)

(assert (=> b!1448262 m!1337053))

(assert (=> b!1448262 m!1337053))

(declare-fun m!1337055 () Bool)

(assert (=> b!1448262 m!1337055))

(declare-fun m!1337057 () Bool)

(assert (=> b!1448269 m!1337057))

(declare-fun m!1337059 () Bool)

(assert (=> b!1448269 m!1337059))

(declare-fun m!1337061 () Bool)

(assert (=> b!1448257 m!1337061))

(assert (=> b!1448261 m!1337041))

(assert (=> b!1448261 m!1337035))

(assert (=> b!1448261 m!1337039))

(assert (=> b!1448261 m!1337029))

(declare-fun m!1337063 () Bool)

(assert (=> start!124808 m!1337063))

(declare-fun m!1337065 () Bool)

(assert (=> start!124808 m!1337065))

(assert (=> b!1448259 m!1337029))

(assert (=> b!1448259 m!1337029))

(declare-fun m!1337067 () Bool)

(assert (=> b!1448259 m!1337067))

(declare-fun m!1337069 () Bool)

(assert (=> b!1448270 m!1337069))

(assert (=> b!1448270 m!1337069))

(declare-fun m!1337071 () Bool)

(assert (=> b!1448270 m!1337071))

(assert (=> b!1448270 m!1337035))

(declare-fun m!1337073 () Bool)

(assert (=> b!1448270 m!1337073))

(assert (=> b!1448266 m!1337029))

(assert (=> b!1448266 m!1337029))

(declare-fun m!1337075 () Bool)

(assert (=> b!1448266 m!1337075))

(declare-fun m!1337077 () Bool)

(assert (=> b!1448264 m!1337077))

(assert (=> b!1448258 m!1337029))

(assert (=> b!1448258 m!1337029))

(declare-fun m!1337079 () Bool)

(assert (=> b!1448258 m!1337079))

(assert (=> b!1448258 m!1337079))

(assert (=> b!1448258 m!1337029))

(declare-fun m!1337081 () Bool)

(assert (=> b!1448258 m!1337081))

(push 1)


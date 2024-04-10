; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124836 () Bool)

(assert start!124836)

(declare-fun b!1449054 () Bool)

(declare-fun res!980548 () Bool)

(declare-fun e!816041 () Bool)

(assert (=> b!1449054 (=> (not res!980548) (not e!816041))))

(declare-datatypes ((array!98284 0))(
  ( (array!98285 (arr!47430 (Array (_ BitVec 32) (_ BitVec 64))) (size!47980 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98284)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1449054 (= res!980548 (validKeyInArray!0 (select (arr!47430 a!2862) j!93)))))

(declare-fun b!1449055 () Bool)

(declare-fun res!980545 () Bool)

(assert (=> b!1449055 (=> (not res!980545) (not e!816041))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1449055 (= res!980545 (and (= (size!47980 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47980 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47980 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1449056 () Bool)

(declare-fun e!816037 () Bool)

(assert (=> b!1449056 (= e!816041 e!816037)))

(declare-fun res!980546 () Bool)

(assert (=> b!1449056 (=> (not res!980546) (not e!816037))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1449056 (= res!980546 (= (select (store (arr!47430 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!635763 () array!98284)

(assert (=> b!1449056 (= lt!635763 (array!98285 (store (arr!47430 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47980 a!2862)))))

(declare-fun b!1449057 () Bool)

(declare-fun e!816043 () Bool)

(declare-fun e!816040 () Bool)

(assert (=> b!1449057 (= e!816043 e!816040)))

(declare-fun res!980543 () Bool)

(assert (=> b!1449057 (=> (not res!980543) (not e!816040))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11682 0))(
  ( (MissingZero!11682 (index!49120 (_ BitVec 32))) (Found!11682 (index!49121 (_ BitVec 32))) (Intermediate!11682 (undefined!12494 Bool) (index!49122 (_ BitVec 32)) (x!130787 (_ BitVec 32))) (Undefined!11682) (MissingVacant!11682 (index!49123 (_ BitVec 32))) )
))
(declare-fun lt!635762 () SeekEntryResult!11682)

(assert (=> b!1449057 (= res!980543 (= lt!635762 (Intermediate!11682 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!635760 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98284 (_ BitVec 32)) SeekEntryResult!11682)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1449057 (= lt!635762 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635760 mask!2687) lt!635760 lt!635763 mask!2687))))

(assert (=> b!1449057 (= lt!635760 (select (store (arr!47430 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1449058 () Bool)

(declare-fun e!816039 () Bool)

(assert (=> b!1449058 (= e!816040 (not e!816039))))

(declare-fun res!980547 () Bool)

(assert (=> b!1449058 (=> res!980547 e!816039)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1449058 (= res!980547 (or (and (= (select (arr!47430 a!2862) index!646) (select (store (arr!47430 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47430 a!2862) index!646) (select (arr!47430 a!2862) j!93))) (not (= (select (arr!47430 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47430 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!816038 () Bool)

(assert (=> b!1449058 e!816038))

(declare-fun res!980551 () Bool)

(assert (=> b!1449058 (=> (not res!980551) (not e!816038))))

(declare-fun lt!635757 () SeekEntryResult!11682)

(assert (=> b!1449058 (= res!980551 (and (= lt!635757 (Found!11682 j!93)) (or (= (select (arr!47430 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47430 a!2862) intermediateBeforeIndex!19) (select (arr!47430 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98284 (_ BitVec 32)) SeekEntryResult!11682)

(assert (=> b!1449058 (= lt!635757 (seekEntryOrOpen!0 (select (arr!47430 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98284 (_ BitVec 32)) Bool)

(assert (=> b!1449058 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48860 0))(
  ( (Unit!48861) )
))
(declare-fun lt!635761 () Unit!48860)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98284 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48860)

(assert (=> b!1449058 (= lt!635761 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1449059 () Bool)

(declare-fun res!980540 () Bool)

(assert (=> b!1449059 (=> (not res!980540) (not e!816040))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1449059 (= res!980540 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1449060 () Bool)

(assert (=> b!1449060 (= e!816039 true)))

(declare-fun lt!635758 () SeekEntryResult!11682)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98284 (_ BitVec 32)) SeekEntryResult!11682)

(assert (=> b!1449060 (= lt!635758 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47430 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1449061 () Bool)

(assert (=> b!1449061 (= e!816037 e!816043)))

(declare-fun res!980535 () Bool)

(assert (=> b!1449061 (=> (not res!980535) (not e!816043))))

(declare-fun lt!635759 () SeekEntryResult!11682)

(assert (=> b!1449061 (= res!980535 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47430 a!2862) j!93) mask!2687) (select (arr!47430 a!2862) j!93) a!2862 mask!2687) lt!635759))))

(assert (=> b!1449061 (= lt!635759 (Intermediate!11682 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1449062 () Bool)

(declare-fun e!816036 () Bool)

(assert (=> b!1449062 (= e!816036 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635760 lt!635763 mask!2687) (seekEntryOrOpen!0 lt!635760 lt!635763 mask!2687)))))

(declare-fun b!1449063 () Bool)

(declare-fun e!816044 () Bool)

(assert (=> b!1449063 (= e!816044 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1449064 () Bool)

(declare-fun res!980539 () Bool)

(assert (=> b!1449064 (=> (not res!980539) (not e!816041))))

(assert (=> b!1449064 (= res!980539 (validKeyInArray!0 (select (arr!47430 a!2862) i!1006)))))

(declare-fun res!980549 () Bool)

(assert (=> start!124836 (=> (not res!980549) (not e!816041))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124836 (= res!980549 (validMask!0 mask!2687))))

(assert (=> start!124836 e!816041))

(assert (=> start!124836 true))

(declare-fun array_inv!36458 (array!98284) Bool)

(assert (=> start!124836 (array_inv!36458 a!2862)))

(declare-fun b!1449065 () Bool)

(declare-fun e!816035 () Bool)

(assert (=> b!1449065 (= e!816035 e!816044)))

(declare-fun res!980536 () Bool)

(assert (=> b!1449065 (=> (not res!980536) (not e!816044))))

(assert (=> b!1449065 (= res!980536 (= lt!635757 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47430 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1449066 () Bool)

(declare-fun res!980541 () Bool)

(assert (=> b!1449066 (=> (not res!980541) (not e!816041))))

(assert (=> b!1449066 (= res!980541 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1449067 () Bool)

(declare-fun res!980537 () Bool)

(assert (=> b!1449067 (=> (not res!980537) (not e!816041))))

(declare-datatypes ((List!33931 0))(
  ( (Nil!33928) (Cons!33927 (h!35277 (_ BitVec 64)) (t!48625 List!33931)) )
))
(declare-fun arrayNoDuplicates!0 (array!98284 (_ BitVec 32) List!33931) Bool)

(assert (=> b!1449067 (= res!980537 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33928))))

(declare-fun b!1449068 () Bool)

(assert (=> b!1449068 (= e!816036 (= lt!635762 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635760 lt!635763 mask!2687)))))

(declare-fun b!1449069 () Bool)

(assert (=> b!1449069 (= e!816038 e!816035)))

(declare-fun res!980542 () Bool)

(assert (=> b!1449069 (=> res!980542 e!816035)))

(assert (=> b!1449069 (= res!980542 (or (and (= (select (arr!47430 a!2862) index!646) (select (store (arr!47430 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47430 a!2862) index!646) (select (arr!47430 a!2862) j!93))) (not (= (select (arr!47430 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1449070 () Bool)

(declare-fun res!980544 () Bool)

(assert (=> b!1449070 (=> (not res!980544) (not e!816040))))

(assert (=> b!1449070 (= res!980544 e!816036)))

(declare-fun c!133770 () Bool)

(assert (=> b!1449070 (= c!133770 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1449071 () Bool)

(declare-fun res!980550 () Bool)

(assert (=> b!1449071 (=> (not res!980550) (not e!816041))))

(assert (=> b!1449071 (= res!980550 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47980 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47980 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47980 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1449072 () Bool)

(declare-fun res!980538 () Bool)

(assert (=> b!1449072 (=> (not res!980538) (not e!816043))))

(assert (=> b!1449072 (= res!980538 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47430 a!2862) j!93) a!2862 mask!2687) lt!635759))))

(assert (= (and start!124836 res!980549) b!1449055))

(assert (= (and b!1449055 res!980545) b!1449064))

(assert (= (and b!1449064 res!980539) b!1449054))

(assert (= (and b!1449054 res!980548) b!1449066))

(assert (= (and b!1449066 res!980541) b!1449067))

(assert (= (and b!1449067 res!980537) b!1449071))

(assert (= (and b!1449071 res!980550) b!1449056))

(assert (= (and b!1449056 res!980546) b!1449061))

(assert (= (and b!1449061 res!980535) b!1449072))

(assert (= (and b!1449072 res!980538) b!1449057))

(assert (= (and b!1449057 res!980543) b!1449070))

(assert (= (and b!1449070 c!133770) b!1449068))

(assert (= (and b!1449070 (not c!133770)) b!1449062))

(assert (= (and b!1449070 res!980544) b!1449059))

(assert (= (and b!1449059 res!980540) b!1449058))

(assert (= (and b!1449058 res!980551) b!1449069))

(assert (= (and b!1449069 (not res!980542)) b!1449065))

(assert (= (and b!1449065 res!980536) b!1449063))

(assert (= (and b!1449058 (not res!980547)) b!1449060))

(declare-fun m!1337785 () Bool)

(assert (=> b!1449058 m!1337785))

(declare-fun m!1337787 () Bool)

(assert (=> b!1449058 m!1337787))

(declare-fun m!1337789 () Bool)

(assert (=> b!1449058 m!1337789))

(declare-fun m!1337791 () Bool)

(assert (=> b!1449058 m!1337791))

(declare-fun m!1337793 () Bool)

(assert (=> b!1449058 m!1337793))

(declare-fun m!1337795 () Bool)

(assert (=> b!1449058 m!1337795))

(declare-fun m!1337797 () Bool)

(assert (=> b!1449058 m!1337797))

(declare-fun m!1337799 () Bool)

(assert (=> b!1449058 m!1337799))

(assert (=> b!1449058 m!1337795))

(declare-fun m!1337801 () Bool)

(assert (=> b!1449067 m!1337801))

(declare-fun m!1337803 () Bool)

(assert (=> b!1449064 m!1337803))

(assert (=> b!1449064 m!1337803))

(declare-fun m!1337805 () Bool)

(assert (=> b!1449064 m!1337805))

(assert (=> b!1449054 m!1337795))

(assert (=> b!1449054 m!1337795))

(declare-fun m!1337807 () Bool)

(assert (=> b!1449054 m!1337807))

(declare-fun m!1337809 () Bool)

(assert (=> b!1449068 m!1337809))

(declare-fun m!1337811 () Bool)

(assert (=> b!1449057 m!1337811))

(assert (=> b!1449057 m!1337811))

(declare-fun m!1337813 () Bool)

(assert (=> b!1449057 m!1337813))

(assert (=> b!1449057 m!1337787))

(declare-fun m!1337815 () Bool)

(assert (=> b!1449057 m!1337815))

(assert (=> b!1449061 m!1337795))

(assert (=> b!1449061 m!1337795))

(declare-fun m!1337817 () Bool)

(assert (=> b!1449061 m!1337817))

(assert (=> b!1449061 m!1337817))

(assert (=> b!1449061 m!1337795))

(declare-fun m!1337819 () Bool)

(assert (=> b!1449061 m!1337819))

(assert (=> b!1449069 m!1337793))

(assert (=> b!1449069 m!1337787))

(assert (=> b!1449069 m!1337791))

(assert (=> b!1449069 m!1337795))

(declare-fun m!1337821 () Bool)

(assert (=> b!1449062 m!1337821))

(declare-fun m!1337823 () Bool)

(assert (=> b!1449062 m!1337823))

(declare-fun m!1337825 () Bool)

(assert (=> b!1449066 m!1337825))

(declare-fun m!1337827 () Bool)

(assert (=> start!124836 m!1337827))

(declare-fun m!1337829 () Bool)

(assert (=> start!124836 m!1337829))

(assert (=> b!1449056 m!1337787))

(declare-fun m!1337831 () Bool)

(assert (=> b!1449056 m!1337831))

(assert (=> b!1449065 m!1337795))

(assert (=> b!1449065 m!1337795))

(declare-fun m!1337833 () Bool)

(assert (=> b!1449065 m!1337833))

(assert (=> b!1449060 m!1337795))

(assert (=> b!1449060 m!1337795))

(declare-fun m!1337835 () Bool)

(assert (=> b!1449060 m!1337835))

(assert (=> b!1449072 m!1337795))

(assert (=> b!1449072 m!1337795))

(declare-fun m!1337837 () Bool)

(assert (=> b!1449072 m!1337837))

(check-sat (not b!1449067) (not b!1449072) (not b!1449062) (not b!1449054) (not b!1449065) (not b!1449064) (not b!1449058) (not start!124836) (not b!1449068) (not b!1449060) (not b!1449057) (not b!1449066) (not b!1449061))
(check-sat)

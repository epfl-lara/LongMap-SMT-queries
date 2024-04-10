; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127354 () Bool)

(assert start!127354)

(declare-fun lt!652216 () (_ BitVec 64))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!838302 () Bool)

(declare-datatypes ((array!99816 0))(
  ( (array!99817 (arr!48172 (Array (_ BitVec 32) (_ BitVec 64))) (size!48722 (_ BitVec 32))) )
))
(declare-fun lt!652214 () array!99816)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12412 0))(
  ( (MissingZero!12412 (index!52040 (_ BitVec 32))) (Found!12412 (index!52041 (_ BitVec 32))) (Intermediate!12412 (undefined!13224 Bool) (index!52042 (_ BitVec 32)) (x!133662 (_ BitVec 32))) (Undefined!12412) (MissingVacant!12412 (index!52043 (_ BitVec 32))) )
))
(declare-fun lt!652215 () SeekEntryResult!12412)

(declare-fun b!1496801 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99816 (_ BitVec 32)) SeekEntryResult!12412)

(assert (=> b!1496801 (= e!838302 (= lt!652215 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!652216 lt!652214 mask!2687)))))

(declare-fun b!1496802 () Bool)

(declare-fun res!1018081 () Bool)

(declare-fun e!838308 () Bool)

(assert (=> b!1496802 (=> (not res!1018081) (not e!838308))))

(declare-fun lt!652213 () SeekEntryResult!12412)

(declare-fun a!2862 () array!99816)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1496802 (= res!1018081 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48172 a!2862) j!93) a!2862 mask!2687) lt!652213))))

(declare-fun b!1496803 () Bool)

(declare-fun res!1018091 () Bool)

(declare-fun e!838307 () Bool)

(assert (=> b!1496803 (=> (not res!1018091) (not e!838307))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1496803 (= res!1018091 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48722 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48722 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48722 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1496804 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99816 (_ BitVec 32)) SeekEntryResult!12412)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99816 (_ BitVec 32)) SeekEntryResult!12412)

(assert (=> b!1496804 (= e!838302 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!652216 lt!652214 mask!2687) (seekEntryOrOpen!0 lt!652216 lt!652214 mask!2687)))))

(declare-fun b!1496805 () Bool)

(declare-fun e!838309 () Bool)

(assert (=> b!1496805 (= e!838307 e!838309)))

(declare-fun res!1018088 () Bool)

(assert (=> b!1496805 (=> (not res!1018088) (not e!838309))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1496805 (= res!1018088 (= (select (store (arr!48172 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1496805 (= lt!652214 (array!99817 (store (arr!48172 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48722 a!2862)))))

(declare-fun b!1496806 () Bool)

(declare-fun res!1018086 () Bool)

(assert (=> b!1496806 (=> (not res!1018086) (not e!838307))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1496806 (= res!1018086 (validKeyInArray!0 (select (arr!48172 a!2862) i!1006)))))

(declare-fun b!1496807 () Bool)

(declare-fun res!1018082 () Bool)

(assert (=> b!1496807 (=> (not res!1018082) (not e!838307))))

(assert (=> b!1496807 (= res!1018082 (validKeyInArray!0 (select (arr!48172 a!2862) j!93)))))

(declare-fun b!1496808 () Bool)

(declare-fun res!1018092 () Bool)

(declare-fun e!838301 () Bool)

(assert (=> b!1496808 (=> (not res!1018092) (not e!838301))))

(assert (=> b!1496808 (= res!1018092 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1496809 () Bool)

(declare-fun e!838304 () Bool)

(assert (=> b!1496809 (= e!838301 (not e!838304))))

(declare-fun res!1018095 () Bool)

(assert (=> b!1496809 (=> res!1018095 e!838304)))

(assert (=> b!1496809 (= res!1018095 (or (and (= (select (arr!48172 a!2862) index!646) (select (store (arr!48172 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48172 a!2862) index!646) (select (arr!48172 a!2862) j!93))) (= (select (arr!48172 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun lt!652211 () SeekEntryResult!12412)

(assert (=> b!1496809 (and (= lt!652211 (Found!12412 j!93)) (or (= (select (arr!48172 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48172 a!2862) intermediateBeforeIndex!19) (select (arr!48172 a!2862) j!93))))))

(assert (=> b!1496809 (= lt!652211 (seekEntryOrOpen!0 (select (arr!48172 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99816 (_ BitVec 32)) Bool)

(assert (=> b!1496809 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!50164 0))(
  ( (Unit!50165) )
))
(declare-fun lt!652209 () Unit!50164)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99816 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50164)

(assert (=> b!1496809 (= lt!652209 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1496810 () Bool)

(declare-fun res!1018079 () Bool)

(declare-fun e!838306 () Bool)

(assert (=> b!1496810 (=> res!1018079 e!838306)))

(declare-fun lt!652210 () (_ BitVec 32))

(assert (=> b!1496810 (= res!1018079 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652210 (select (arr!48172 a!2862) j!93) a!2862 mask!2687) lt!652213)))))

(declare-fun b!1496812 () Bool)

(declare-fun res!1018083 () Bool)

(assert (=> b!1496812 (=> (not res!1018083) (not e!838307))))

(assert (=> b!1496812 (= res!1018083 (and (= (size!48722 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48722 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48722 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1496813 () Bool)

(assert (=> b!1496813 (= e!838304 e!838306)))

(declare-fun res!1018094 () Bool)

(assert (=> b!1496813 (=> res!1018094 e!838306)))

(assert (=> b!1496813 (= res!1018094 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!652210 #b00000000000000000000000000000000) (bvsge lt!652210 (size!48722 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1496813 (= lt!652210 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1496814 () Bool)

(declare-fun e!838305 () Bool)

(assert (=> b!1496814 (= e!838305 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652210 intermediateAfterIndex!19 lt!652216 lt!652214 mask!2687) (seekEntryOrOpen!0 lt!652216 lt!652214 mask!2687))))))

(declare-fun b!1496815 () Bool)

(assert (=> b!1496815 (= e!838306 true)))

(assert (=> b!1496815 (= lt!652211 (seekEntryOrOpen!0 lt!652216 lt!652214 mask!2687))))

(declare-fun lt!652212 () Unit!50164)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99816 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50164)

(assert (=> b!1496815 (= lt!652212 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!652210 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1496816 () Bool)

(assert (=> b!1496816 (= e!838305 (not (= lt!652215 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652210 lt!652216 lt!652214 mask!2687))))))

(declare-fun b!1496817 () Bool)

(declare-fun res!1018085 () Bool)

(assert (=> b!1496817 (=> res!1018085 e!838306)))

(assert (=> b!1496817 (= res!1018085 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1496818 () Bool)

(declare-fun res!1018096 () Bool)

(assert (=> b!1496818 (=> (not res!1018096) (not e!838307))))

(declare-datatypes ((List!34673 0))(
  ( (Nil!34670) (Cons!34669 (h!36066 (_ BitVec 64)) (t!49367 List!34673)) )
))
(declare-fun arrayNoDuplicates!0 (array!99816 (_ BitVec 32) List!34673) Bool)

(assert (=> b!1496818 (= res!1018096 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34670))))

(declare-fun b!1496819 () Bool)

(declare-fun res!1018080 () Bool)

(assert (=> b!1496819 (=> res!1018080 e!838306)))

(assert (=> b!1496819 (= res!1018080 e!838305)))

(declare-fun c!138896 () Bool)

(assert (=> b!1496819 (= c!138896 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1496820 () Bool)

(declare-fun res!1018087 () Bool)

(assert (=> b!1496820 (=> (not res!1018087) (not e!838307))))

(assert (=> b!1496820 (= res!1018087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1496821 () Bool)

(assert (=> b!1496821 (= e!838308 e!838301)))

(declare-fun res!1018089 () Bool)

(assert (=> b!1496821 (=> (not res!1018089) (not e!838301))))

(assert (=> b!1496821 (= res!1018089 (= lt!652215 (Intermediate!12412 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1496821 (= lt!652215 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!652216 mask!2687) lt!652216 lt!652214 mask!2687))))

(assert (=> b!1496821 (= lt!652216 (select (store (arr!48172 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1496822 () Bool)

(declare-fun res!1018090 () Bool)

(assert (=> b!1496822 (=> (not res!1018090) (not e!838301))))

(assert (=> b!1496822 (= res!1018090 e!838302)))

(declare-fun c!138895 () Bool)

(assert (=> b!1496822 (= c!138895 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1496811 () Bool)

(assert (=> b!1496811 (= e!838309 e!838308)))

(declare-fun res!1018084 () Bool)

(assert (=> b!1496811 (=> (not res!1018084) (not e!838308))))

(assert (=> b!1496811 (= res!1018084 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48172 a!2862) j!93) mask!2687) (select (arr!48172 a!2862) j!93) a!2862 mask!2687) lt!652213))))

(assert (=> b!1496811 (= lt!652213 (Intermediate!12412 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!1018093 () Bool)

(assert (=> start!127354 (=> (not res!1018093) (not e!838307))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127354 (= res!1018093 (validMask!0 mask!2687))))

(assert (=> start!127354 e!838307))

(assert (=> start!127354 true))

(declare-fun array_inv!37200 (array!99816) Bool)

(assert (=> start!127354 (array_inv!37200 a!2862)))

(assert (= (and start!127354 res!1018093) b!1496812))

(assert (= (and b!1496812 res!1018083) b!1496806))

(assert (= (and b!1496806 res!1018086) b!1496807))

(assert (= (and b!1496807 res!1018082) b!1496820))

(assert (= (and b!1496820 res!1018087) b!1496818))

(assert (= (and b!1496818 res!1018096) b!1496803))

(assert (= (and b!1496803 res!1018091) b!1496805))

(assert (= (and b!1496805 res!1018088) b!1496811))

(assert (= (and b!1496811 res!1018084) b!1496802))

(assert (= (and b!1496802 res!1018081) b!1496821))

(assert (= (and b!1496821 res!1018089) b!1496822))

(assert (= (and b!1496822 c!138895) b!1496801))

(assert (= (and b!1496822 (not c!138895)) b!1496804))

(assert (= (and b!1496822 res!1018090) b!1496808))

(assert (= (and b!1496808 res!1018092) b!1496809))

(assert (= (and b!1496809 (not res!1018095)) b!1496813))

(assert (= (and b!1496813 (not res!1018094)) b!1496810))

(assert (= (and b!1496810 (not res!1018079)) b!1496819))

(assert (= (and b!1496819 c!138896) b!1496816))

(assert (= (and b!1496819 (not c!138896)) b!1496814))

(assert (= (and b!1496819 (not res!1018080)) b!1496817))

(assert (= (and b!1496817 (not res!1018085)) b!1496815))

(declare-fun m!1379935 () Bool)

(assert (=> b!1496816 m!1379935))

(declare-fun m!1379937 () Bool)

(assert (=> b!1496811 m!1379937))

(assert (=> b!1496811 m!1379937))

(declare-fun m!1379939 () Bool)

(assert (=> b!1496811 m!1379939))

(assert (=> b!1496811 m!1379939))

(assert (=> b!1496811 m!1379937))

(declare-fun m!1379941 () Bool)

(assert (=> b!1496811 m!1379941))

(declare-fun m!1379943 () Bool)

(assert (=> b!1496813 m!1379943))

(declare-fun m!1379945 () Bool)

(assert (=> b!1496814 m!1379945))

(declare-fun m!1379947 () Bool)

(assert (=> b!1496814 m!1379947))

(declare-fun m!1379949 () Bool)

(assert (=> b!1496804 m!1379949))

(assert (=> b!1496804 m!1379947))

(assert (=> b!1496815 m!1379947))

(declare-fun m!1379951 () Bool)

(assert (=> b!1496815 m!1379951))

(declare-fun m!1379953 () Bool)

(assert (=> b!1496801 m!1379953))

(declare-fun m!1379955 () Bool)

(assert (=> b!1496805 m!1379955))

(declare-fun m!1379957 () Bool)

(assert (=> b!1496805 m!1379957))

(assert (=> b!1496810 m!1379937))

(assert (=> b!1496810 m!1379937))

(declare-fun m!1379959 () Bool)

(assert (=> b!1496810 m!1379959))

(declare-fun m!1379961 () Bool)

(assert (=> b!1496821 m!1379961))

(assert (=> b!1496821 m!1379961))

(declare-fun m!1379963 () Bool)

(assert (=> b!1496821 m!1379963))

(assert (=> b!1496821 m!1379955))

(declare-fun m!1379965 () Bool)

(assert (=> b!1496821 m!1379965))

(assert (=> b!1496807 m!1379937))

(assert (=> b!1496807 m!1379937))

(declare-fun m!1379967 () Bool)

(assert (=> b!1496807 m!1379967))

(declare-fun m!1379969 () Bool)

(assert (=> b!1496818 m!1379969))

(declare-fun m!1379971 () Bool)

(assert (=> b!1496809 m!1379971))

(assert (=> b!1496809 m!1379955))

(declare-fun m!1379973 () Bool)

(assert (=> b!1496809 m!1379973))

(declare-fun m!1379975 () Bool)

(assert (=> b!1496809 m!1379975))

(declare-fun m!1379977 () Bool)

(assert (=> b!1496809 m!1379977))

(assert (=> b!1496809 m!1379937))

(declare-fun m!1379979 () Bool)

(assert (=> b!1496809 m!1379979))

(declare-fun m!1379981 () Bool)

(assert (=> b!1496809 m!1379981))

(assert (=> b!1496809 m!1379937))

(declare-fun m!1379983 () Bool)

(assert (=> b!1496806 m!1379983))

(assert (=> b!1496806 m!1379983))

(declare-fun m!1379985 () Bool)

(assert (=> b!1496806 m!1379985))

(declare-fun m!1379987 () Bool)

(assert (=> b!1496820 m!1379987))

(declare-fun m!1379989 () Bool)

(assert (=> start!127354 m!1379989))

(declare-fun m!1379991 () Bool)

(assert (=> start!127354 m!1379991))

(assert (=> b!1496802 m!1379937))

(assert (=> b!1496802 m!1379937))

(declare-fun m!1379993 () Bool)

(assert (=> b!1496802 m!1379993))

(push 1)


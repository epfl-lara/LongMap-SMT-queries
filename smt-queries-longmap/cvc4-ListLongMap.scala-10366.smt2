; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122014 () Bool)

(assert start!122014)

(declare-fun b!1416201 () Bool)

(declare-fun res!952251 () Bool)

(declare-fun e!801540 () Bool)

(assert (=> b!1416201 (=> (not res!952251) (not e!801540))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96700 0))(
  ( (array!96701 (arr!46681 (Array (_ BitVec 32) (_ BitVec 64))) (size!47231 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96700)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1416201 (= res!952251 (and (= (size!47231 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47231 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47231 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1416202 () Bool)

(declare-fun res!952248 () Bool)

(assert (=> b!1416202 (=> (not res!952248) (not e!801540))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1416202 (= res!952248 (validKeyInArray!0 (select (arr!46681 a!2901) j!112)))))

(declare-fun res!952249 () Bool)

(assert (=> start!122014 (=> (not res!952249) (not e!801540))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122014 (= res!952249 (validMask!0 mask!2840))))

(assert (=> start!122014 e!801540))

(assert (=> start!122014 true))

(declare-fun array_inv!35709 (array!96700) Bool)

(assert (=> start!122014 (array_inv!35709 a!2901)))

(declare-fun b!1416203 () Bool)

(declare-fun res!952252 () Bool)

(declare-fun e!801539 () Bool)

(assert (=> b!1416203 (=> res!952252 e!801539)))

(declare-fun lt!624753 () array!96700)

(declare-datatypes ((SeekEntryResult!10992 0))(
  ( (MissingZero!10992 (index!46360 (_ BitVec 32))) (Found!10992 (index!46361 (_ BitVec 32))) (Intermediate!10992 (undefined!11804 Bool) (index!46362 (_ BitVec 32)) (x!127959 (_ BitVec 32))) (Undefined!10992) (MissingVacant!10992 (index!46363 (_ BitVec 32))) )
))
(declare-fun lt!624756 () SeekEntryResult!10992)

(declare-fun lt!624758 () (_ BitVec 32))

(declare-fun lt!624762 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96700 (_ BitVec 32)) SeekEntryResult!10992)

(assert (=> b!1416203 (= res!952252 (not (= lt!624756 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624758 lt!624762 lt!624753 mask!2840))))))

(declare-fun b!1416204 () Bool)

(declare-fun res!952243 () Bool)

(assert (=> b!1416204 (=> (not res!952243) (not e!801540))))

(declare-datatypes ((List!33200 0))(
  ( (Nil!33197) (Cons!33196 (h!34483 (_ BitVec 64)) (t!47894 List!33200)) )
))
(declare-fun arrayNoDuplicates!0 (array!96700 (_ BitVec 32) List!33200) Bool)

(assert (=> b!1416204 (= res!952243 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33197))))

(declare-fun b!1416205 () Bool)

(assert (=> b!1416205 (= e!801539 true)))

(declare-fun lt!624757 () SeekEntryResult!10992)

(declare-fun lt!624761 () SeekEntryResult!10992)

(assert (=> b!1416205 (= lt!624757 lt!624761)))

(declare-fun lt!624754 () SeekEntryResult!10992)

(declare-datatypes ((Unit!47958 0))(
  ( (Unit!47959) )
))
(declare-fun lt!624759 () Unit!47958)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!96700 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47958)

(assert (=> b!1416205 (= lt!624759 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624758 (x!127959 lt!624754) (index!46362 lt!624754) (x!127959 lt!624756) (index!46362 lt!624756) mask!2840))))

(declare-fun b!1416206 () Bool)

(declare-fun e!801541 () Bool)

(assert (=> b!1416206 (= e!801540 (not e!801541))))

(declare-fun res!952250 () Bool)

(assert (=> b!1416206 (=> res!952250 e!801541)))

(assert (=> b!1416206 (= res!952250 (or (not (is-Intermediate!10992 lt!624754)) (undefined!11804 lt!624754)))))

(assert (=> b!1416206 (= lt!624757 (Found!10992 j!112))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96700 (_ BitVec 32)) SeekEntryResult!10992)

(assert (=> b!1416206 (= lt!624757 (seekEntryOrOpen!0 (select (arr!46681 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96700 (_ BitVec 32)) Bool)

(assert (=> b!1416206 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!624755 () Unit!47958)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96700 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47958)

(assert (=> b!1416206 (= lt!624755 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1416206 (= lt!624754 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624758 (select (arr!46681 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416206 (= lt!624758 (toIndex!0 (select (arr!46681 a!2901) j!112) mask!2840))))

(declare-fun b!1416207 () Bool)

(declare-fun res!952246 () Bool)

(assert (=> b!1416207 (=> (not res!952246) (not e!801540))))

(assert (=> b!1416207 (= res!952246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1416208 () Bool)

(declare-fun res!952245 () Bool)

(assert (=> b!1416208 (=> (not res!952245) (not e!801540))))

(assert (=> b!1416208 (= res!952245 (validKeyInArray!0 (select (arr!46681 a!2901) i!1037)))))

(declare-fun b!1416209 () Bool)

(declare-fun e!801542 () Bool)

(assert (=> b!1416209 (= e!801541 e!801542)))

(declare-fun res!952244 () Bool)

(assert (=> b!1416209 (=> res!952244 e!801542)))

(assert (=> b!1416209 (= res!952244 (or (= lt!624754 lt!624756) (not (is-Intermediate!10992 lt!624756))))))

(assert (=> b!1416209 (= lt!624756 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624762 mask!2840) lt!624762 lt!624753 mask!2840))))

(assert (=> b!1416209 (= lt!624762 (select (store (arr!46681 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1416209 (= lt!624753 (array!96701 (store (arr!46681 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47231 a!2901)))))

(declare-fun b!1416210 () Bool)

(assert (=> b!1416210 (= e!801542 e!801539)))

(declare-fun res!952247 () Bool)

(assert (=> b!1416210 (=> res!952247 e!801539)))

(assert (=> b!1416210 (= res!952247 (or (bvslt (x!127959 lt!624754) #b00000000000000000000000000000000) (bvsgt (x!127959 lt!624754) #b01111111111111111111111111111110) (bvslt (x!127959 lt!624756) #b00000000000000000000000000000000) (bvsgt (x!127959 lt!624756) #b01111111111111111111111111111110) (bvslt lt!624758 #b00000000000000000000000000000000) (bvsge lt!624758 (size!47231 a!2901)) (bvslt (index!46362 lt!624754) #b00000000000000000000000000000000) (bvsge (index!46362 lt!624754) (size!47231 a!2901)) (bvslt (index!46362 lt!624756) #b00000000000000000000000000000000) (bvsge (index!46362 lt!624756) (size!47231 a!2901)) (not (= lt!624754 (Intermediate!10992 false (index!46362 lt!624754) (x!127959 lt!624754)))) (not (= lt!624756 (Intermediate!10992 false (index!46362 lt!624756) (x!127959 lt!624756))))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96700 (_ BitVec 32)) SeekEntryResult!10992)

(assert (=> b!1416210 (= lt!624761 (seekKeyOrZeroReturnVacant!0 (x!127959 lt!624756) (index!46362 lt!624756) (index!46362 lt!624756) (select (arr!46681 a!2901) j!112) lt!624753 mask!2840))))

(assert (=> b!1416210 (= lt!624761 (seekEntryOrOpen!0 lt!624762 lt!624753 mask!2840))))

(assert (=> b!1416210 (and (not (undefined!11804 lt!624756)) (= (index!46362 lt!624756) i!1037) (bvslt (x!127959 lt!624756) (x!127959 lt!624754)) (= (select (store (arr!46681 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46362 lt!624756)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!624760 () Unit!47958)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96700 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47958)

(assert (=> b!1416210 (= lt!624760 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624758 (x!127959 lt!624754) (index!46362 lt!624754) (x!127959 lt!624756) (index!46362 lt!624756) (undefined!11804 lt!624756) mask!2840))))

(assert (= (and start!122014 res!952249) b!1416201))

(assert (= (and b!1416201 res!952251) b!1416208))

(assert (= (and b!1416208 res!952245) b!1416202))

(assert (= (and b!1416202 res!952248) b!1416207))

(assert (= (and b!1416207 res!952246) b!1416204))

(assert (= (and b!1416204 res!952243) b!1416206))

(assert (= (and b!1416206 (not res!952250)) b!1416209))

(assert (= (and b!1416209 (not res!952244)) b!1416210))

(assert (= (and b!1416210 (not res!952247)) b!1416203))

(assert (= (and b!1416203 (not res!952252)) b!1416205))

(declare-fun m!1306799 () Bool)

(assert (=> b!1416210 m!1306799))

(declare-fun m!1306801 () Bool)

(assert (=> b!1416210 m!1306801))

(declare-fun m!1306803 () Bool)

(assert (=> b!1416210 m!1306803))

(declare-fun m!1306805 () Bool)

(assert (=> b!1416210 m!1306805))

(assert (=> b!1416210 m!1306801))

(declare-fun m!1306807 () Bool)

(assert (=> b!1416210 m!1306807))

(declare-fun m!1306809 () Bool)

(assert (=> b!1416210 m!1306809))

(declare-fun m!1306811 () Bool)

(assert (=> b!1416204 m!1306811))

(declare-fun m!1306813 () Bool)

(assert (=> b!1416203 m!1306813))

(declare-fun m!1306815 () Bool)

(assert (=> b!1416208 m!1306815))

(assert (=> b!1416208 m!1306815))

(declare-fun m!1306817 () Bool)

(assert (=> b!1416208 m!1306817))

(declare-fun m!1306819 () Bool)

(assert (=> b!1416205 m!1306819))

(assert (=> b!1416202 m!1306801))

(assert (=> b!1416202 m!1306801))

(declare-fun m!1306821 () Bool)

(assert (=> b!1416202 m!1306821))

(declare-fun m!1306823 () Bool)

(assert (=> start!122014 m!1306823))

(declare-fun m!1306825 () Bool)

(assert (=> start!122014 m!1306825))

(declare-fun m!1306827 () Bool)

(assert (=> b!1416207 m!1306827))

(declare-fun m!1306829 () Bool)

(assert (=> b!1416209 m!1306829))

(assert (=> b!1416209 m!1306829))

(declare-fun m!1306831 () Bool)

(assert (=> b!1416209 m!1306831))

(assert (=> b!1416209 m!1306805))

(declare-fun m!1306833 () Bool)

(assert (=> b!1416209 m!1306833))

(assert (=> b!1416206 m!1306801))

(declare-fun m!1306835 () Bool)

(assert (=> b!1416206 m!1306835))

(assert (=> b!1416206 m!1306801))

(declare-fun m!1306837 () Bool)

(assert (=> b!1416206 m!1306837))

(assert (=> b!1416206 m!1306801))

(declare-fun m!1306839 () Bool)

(assert (=> b!1416206 m!1306839))

(declare-fun m!1306841 () Bool)

(assert (=> b!1416206 m!1306841))

(assert (=> b!1416206 m!1306801))

(declare-fun m!1306843 () Bool)

(assert (=> b!1416206 m!1306843))

(push 1)


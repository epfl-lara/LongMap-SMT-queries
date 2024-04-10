; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125058 () Bool)

(assert start!125058)

(declare-fun b!1455558 () Bool)

(declare-fun res!986201 () Bool)

(declare-fun e!819039 () Bool)

(assert (=> b!1455558 (=> (not res!986201) (not e!819039))))

(declare-datatypes ((array!98506 0))(
  ( (array!98507 (arr!47541 (Array (_ BitVec 32) (_ BitVec 64))) (size!48091 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98506)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98506 (_ BitVec 32)) Bool)

(assert (=> b!1455558 (= res!986201 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1455559 () Bool)

(declare-fun e!819040 () Bool)

(declare-fun e!819033 () Bool)

(assert (=> b!1455559 (= e!819040 e!819033)))

(declare-fun res!986215 () Bool)

(assert (=> b!1455559 (=> (not res!986215) (not e!819033))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11793 0))(
  ( (MissingZero!11793 (index!49564 (_ BitVec 32))) (Found!11793 (index!49565 (_ BitVec 32))) (Intermediate!11793 (undefined!12605 Bool) (index!49566 (_ BitVec 32)) (x!131194 (_ BitVec 32))) (Undefined!11793) (MissingVacant!11793 (index!49567 (_ BitVec 32))) )
))
(declare-fun lt!637995 () SeekEntryResult!11793)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1455559 (= res!986215 (= lt!637995 (Intermediate!11793 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!637996 () array!98506)

(declare-fun lt!637994 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98506 (_ BitVec 32)) SeekEntryResult!11793)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455559 (= lt!637995 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637994 mask!2687) lt!637994 lt!637996 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1455559 (= lt!637994 (select (store (arr!47541 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1455560 () Bool)

(declare-fun res!986206 () Bool)

(assert (=> b!1455560 (=> (not res!986206) (not e!819040))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!638001 () SeekEntryResult!11793)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1455560 (= res!986206 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47541 a!2862) j!93) a!2862 mask!2687) lt!638001))))

(declare-fun b!1455561 () Bool)

(declare-fun res!986218 () Bool)

(assert (=> b!1455561 (=> (not res!986218) (not e!819039))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1455561 (= res!986218 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48091 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48091 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48091 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1455562 () Bool)

(declare-fun res!986216 () Bool)

(assert (=> b!1455562 (=> (not res!986216) (not e!819033))))

(declare-fun e!819041 () Bool)

(assert (=> b!1455562 (= res!986216 e!819041)))

(declare-fun c!134189 () Bool)

(assert (=> b!1455562 (= c!134189 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1455563 () Bool)

(declare-fun e!819034 () Bool)

(assert (=> b!1455563 (= e!819034 (and (or (= (select (arr!47541 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47541 a!2862) intermediateBeforeIndex!19) (select (arr!47541 a!2862) j!93))) (let ((bdg!53164 (select (store (arr!47541 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47541 a!2862) index!646) bdg!53164) (= (select (arr!47541 a!2862) index!646) (select (arr!47541 a!2862) j!93))) (= (select (arr!47541 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53164 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1455564 () Bool)

(declare-fun res!986208 () Bool)

(assert (=> b!1455564 (=> (not res!986208) (not e!819039))))

(assert (=> b!1455564 (= res!986208 (and (= (size!48091 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48091 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48091 a!2862)) (not (= i!1006 j!93))))))

(declare-fun lt!637998 () (_ BitVec 32))

(declare-fun b!1455565 () Bool)

(declare-fun e!819036 () Bool)

(assert (=> b!1455565 (= e!819036 (not (= lt!637995 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637998 lt!637994 lt!637996 mask!2687))))))

(declare-fun b!1455566 () Bool)

(declare-fun e!819035 () Bool)

(assert (=> b!1455566 (= e!819035 true)))

(declare-fun lt!637997 () Bool)

(assert (=> b!1455566 (= lt!637997 e!819036)))

(declare-fun c!134190 () Bool)

(assert (=> b!1455566 (= c!134190 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1455567 () Bool)

(assert (=> b!1455567 (= e!819041 (= lt!637995 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637994 lt!637996 mask!2687)))))

(declare-fun lt!637999 () SeekEntryResult!11793)

(declare-fun b!1455568 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98506 (_ BitVec 32)) SeekEntryResult!11793)

(assert (=> b!1455568 (= e!819036 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637998 intermediateAfterIndex!19 lt!637994 lt!637996 mask!2687) lt!637999)))))

(declare-fun b!1455569 () Bool)

(declare-fun e!819032 () Bool)

(assert (=> b!1455569 (= e!819039 e!819032)))

(declare-fun res!986207 () Bool)

(assert (=> b!1455569 (=> (not res!986207) (not e!819032))))

(assert (=> b!1455569 (= res!986207 (= (select (store (arr!47541 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1455569 (= lt!637996 (array!98507 (store (arr!47541 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48091 a!2862)))))

(declare-fun b!1455570 () Bool)

(declare-fun res!986213 () Bool)

(assert (=> b!1455570 (=> (not res!986213) (not e!819039))))

(declare-datatypes ((List!34042 0))(
  ( (Nil!34039) (Cons!34038 (h!35388 (_ BitVec 64)) (t!48736 List!34042)) )
))
(declare-fun arrayNoDuplicates!0 (array!98506 (_ BitVec 32) List!34042) Bool)

(assert (=> b!1455570 (= res!986213 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34039))))

(declare-fun b!1455571 () Bool)

(declare-fun res!986203 () Bool)

(assert (=> b!1455571 (=> (not res!986203) (not e!819039))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1455571 (= res!986203 (validKeyInArray!0 (select (arr!47541 a!2862) i!1006)))))

(declare-fun b!1455572 () Bool)

(assert (=> b!1455572 (= e!819032 e!819040)))

(declare-fun res!986202 () Bool)

(assert (=> b!1455572 (=> (not res!986202) (not e!819040))))

(assert (=> b!1455572 (= res!986202 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47541 a!2862) j!93) mask!2687) (select (arr!47541 a!2862) j!93) a!2862 mask!2687) lt!638001))))

(assert (=> b!1455572 (= lt!638001 (Intermediate!11793 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1455573 () Bool)

(declare-fun res!986212 () Bool)

(assert (=> b!1455573 (=> (not res!986212) (not e!819034))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98506 (_ BitVec 32)) SeekEntryResult!11793)

(assert (=> b!1455573 (= res!986212 (= (seekEntryOrOpen!0 (select (arr!47541 a!2862) j!93) a!2862 mask!2687) (Found!11793 j!93)))))

(declare-fun b!1455574 () Bool)

(declare-fun res!986211 () Bool)

(assert (=> b!1455574 (=> (not res!986211) (not e!819039))))

(assert (=> b!1455574 (= res!986211 (validKeyInArray!0 (select (arr!47541 a!2862) j!93)))))

(declare-fun b!1455575 () Bool)

(assert (=> b!1455575 (= e!819041 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637994 lt!637996 mask!2687) (seekEntryOrOpen!0 lt!637994 lt!637996 mask!2687)))))

(declare-fun b!1455576 () Bool)

(declare-fun res!986204 () Bool)

(assert (=> b!1455576 (=> res!986204 e!819035)))

(assert (=> b!1455576 (= res!986204 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637998 (select (arr!47541 a!2862) j!93) a!2862 mask!2687) lt!638001)))))

(declare-fun res!986205 () Bool)

(assert (=> start!125058 (=> (not res!986205) (not e!819039))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125058 (= res!986205 (validMask!0 mask!2687))))

(assert (=> start!125058 e!819039))

(assert (=> start!125058 true))

(declare-fun array_inv!36569 (array!98506) Bool)

(assert (=> start!125058 (array_inv!36569 a!2862)))

(declare-fun b!1455577 () Bool)

(declare-fun res!986209 () Bool)

(assert (=> b!1455577 (=> (not res!986209) (not e!819033))))

(assert (=> b!1455577 (= res!986209 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1455578 () Bool)

(declare-fun e!819038 () Bool)

(assert (=> b!1455578 (= e!819038 e!819035)))

(declare-fun res!986217 () Bool)

(assert (=> b!1455578 (=> res!986217 e!819035)))

(assert (=> b!1455578 (= res!986217 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!637998 #b00000000000000000000000000000000) (bvsge lt!637998 (size!48091 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455578 (= lt!637998 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1455578 (= lt!637999 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637994 lt!637996 mask!2687))))

(assert (=> b!1455578 (= lt!637999 (seekEntryOrOpen!0 lt!637994 lt!637996 mask!2687))))

(declare-fun b!1455579 () Bool)

(assert (=> b!1455579 (= e!819033 (not e!819038))))

(declare-fun res!986210 () Bool)

(assert (=> b!1455579 (=> res!986210 e!819038)))

(assert (=> b!1455579 (= res!986210 (or (and (= (select (arr!47541 a!2862) index!646) (select (store (arr!47541 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47541 a!2862) index!646) (select (arr!47541 a!2862) j!93))) (= (select (arr!47541 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1455579 e!819034))

(declare-fun res!986214 () Bool)

(assert (=> b!1455579 (=> (not res!986214) (not e!819034))))

(assert (=> b!1455579 (= res!986214 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49082 0))(
  ( (Unit!49083) )
))
(declare-fun lt!638000 () Unit!49082)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98506 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49082)

(assert (=> b!1455579 (= lt!638000 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!125058 res!986205) b!1455564))

(assert (= (and b!1455564 res!986208) b!1455571))

(assert (= (and b!1455571 res!986203) b!1455574))

(assert (= (and b!1455574 res!986211) b!1455558))

(assert (= (and b!1455558 res!986201) b!1455570))

(assert (= (and b!1455570 res!986213) b!1455561))

(assert (= (and b!1455561 res!986218) b!1455569))

(assert (= (and b!1455569 res!986207) b!1455572))

(assert (= (and b!1455572 res!986202) b!1455560))

(assert (= (and b!1455560 res!986206) b!1455559))

(assert (= (and b!1455559 res!986215) b!1455562))

(assert (= (and b!1455562 c!134189) b!1455567))

(assert (= (and b!1455562 (not c!134189)) b!1455575))

(assert (= (and b!1455562 res!986216) b!1455577))

(assert (= (and b!1455577 res!986209) b!1455579))

(assert (= (and b!1455579 res!986214) b!1455573))

(assert (= (and b!1455573 res!986212) b!1455563))

(assert (= (and b!1455579 (not res!986210)) b!1455578))

(assert (= (and b!1455578 (not res!986217)) b!1455576))

(assert (= (and b!1455576 (not res!986204)) b!1455566))

(assert (= (and b!1455566 c!134190) b!1455565))

(assert (= (and b!1455566 (not c!134190)) b!1455568))

(declare-fun m!1343765 () Bool)

(assert (=> b!1455558 m!1343765))

(declare-fun m!1343767 () Bool)

(assert (=> start!125058 m!1343767))

(declare-fun m!1343769 () Bool)

(assert (=> start!125058 m!1343769))

(declare-fun m!1343771 () Bool)

(assert (=> b!1455572 m!1343771))

(assert (=> b!1455572 m!1343771))

(declare-fun m!1343773 () Bool)

(assert (=> b!1455572 m!1343773))

(assert (=> b!1455572 m!1343773))

(assert (=> b!1455572 m!1343771))

(declare-fun m!1343775 () Bool)

(assert (=> b!1455572 m!1343775))

(declare-fun m!1343777 () Bool)

(assert (=> b!1455568 m!1343777))

(declare-fun m!1343779 () Bool)

(assert (=> b!1455559 m!1343779))

(assert (=> b!1455559 m!1343779))

(declare-fun m!1343781 () Bool)

(assert (=> b!1455559 m!1343781))

(declare-fun m!1343783 () Bool)

(assert (=> b!1455559 m!1343783))

(declare-fun m!1343785 () Bool)

(assert (=> b!1455559 m!1343785))

(declare-fun m!1343787 () Bool)

(assert (=> b!1455579 m!1343787))

(assert (=> b!1455579 m!1343783))

(declare-fun m!1343789 () Bool)

(assert (=> b!1455579 m!1343789))

(declare-fun m!1343791 () Bool)

(assert (=> b!1455579 m!1343791))

(declare-fun m!1343793 () Bool)

(assert (=> b!1455579 m!1343793))

(assert (=> b!1455579 m!1343771))

(assert (=> b!1455569 m!1343783))

(declare-fun m!1343795 () Bool)

(assert (=> b!1455569 m!1343795))

(declare-fun m!1343797 () Bool)

(assert (=> b!1455575 m!1343797))

(declare-fun m!1343799 () Bool)

(assert (=> b!1455575 m!1343799))

(declare-fun m!1343801 () Bool)

(assert (=> b!1455571 m!1343801))

(assert (=> b!1455571 m!1343801))

(declare-fun m!1343803 () Bool)

(assert (=> b!1455571 m!1343803))

(declare-fun m!1343805 () Bool)

(assert (=> b!1455578 m!1343805))

(assert (=> b!1455578 m!1343797))

(assert (=> b!1455578 m!1343799))

(declare-fun m!1343807 () Bool)

(assert (=> b!1455570 m!1343807))

(declare-fun m!1343809 () Bool)

(assert (=> b!1455565 m!1343809))

(declare-fun m!1343811 () Bool)

(assert (=> b!1455567 m!1343811))

(assert (=> b!1455563 m!1343783))

(declare-fun m!1343813 () Bool)

(assert (=> b!1455563 m!1343813))

(assert (=> b!1455563 m!1343789))

(assert (=> b!1455563 m!1343791))

(assert (=> b!1455563 m!1343771))

(assert (=> b!1455576 m!1343771))

(assert (=> b!1455576 m!1343771))

(declare-fun m!1343815 () Bool)

(assert (=> b!1455576 m!1343815))

(assert (=> b!1455573 m!1343771))

(assert (=> b!1455573 m!1343771))

(declare-fun m!1343817 () Bool)

(assert (=> b!1455573 m!1343817))

(assert (=> b!1455560 m!1343771))

(assert (=> b!1455560 m!1343771))

(declare-fun m!1343819 () Bool)

(assert (=> b!1455560 m!1343819))

(assert (=> b!1455574 m!1343771))

(assert (=> b!1455574 m!1343771))

(declare-fun m!1343821 () Bool)

(assert (=> b!1455574 m!1343821))

(check-sat (not b!1455574) (not b!1455570) (not b!1455579) (not b!1455573) (not b!1455559) (not b!1455571) (not b!1455575) (not b!1455578) (not b!1455560) (not b!1455576) (not b!1455567) (not b!1455568) (not b!1455565) (not start!125058) (not b!1455558) (not b!1455572))

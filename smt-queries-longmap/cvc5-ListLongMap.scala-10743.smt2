; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125596 () Bool)

(assert start!125596)

(declare-fun res!998214 () Bool)

(declare-fun e!825100 () Bool)

(assert (=> start!125596 (=> (not res!998214) (not e!825100))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125596 (= res!998214 (validMask!0 mask!2687))))

(assert (=> start!125596 e!825100))

(assert (=> start!125596 true))

(declare-datatypes ((array!99044 0))(
  ( (array!99045 (arr!47810 (Array (_ BitVec 32) (_ BitVec 64))) (size!48360 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99044)

(declare-fun array_inv!36838 (array!99044) Bool)

(assert (=> start!125596 (array_inv!36838 a!2862)))

(declare-fun b!1469766 () Bool)

(declare-fun res!998220 () Bool)

(assert (=> b!1469766 (=> (not res!998220) (not e!825100))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1469766 (= res!998220 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48360 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48360 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48360 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1469767 () Bool)

(declare-fun e!825098 () Bool)

(declare-fun e!825096 () Bool)

(assert (=> b!1469767 (= e!825098 e!825096)))

(declare-fun res!998221 () Bool)

(assert (=> b!1469767 (=> (not res!998221) (not e!825096))))

(declare-datatypes ((SeekEntryResult!12050 0))(
  ( (MissingZero!12050 (index!50592 (_ BitVec 32))) (Found!12050 (index!50593 (_ BitVec 32))) (Intermediate!12050 (undefined!12862 Bool) (index!50594 (_ BitVec 32)) (x!132171 (_ BitVec 32))) (Undefined!12050) (MissingVacant!12050 (index!50595 (_ BitVec 32))) )
))
(declare-fun lt!642666 () SeekEntryResult!12050)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99044 (_ BitVec 32)) SeekEntryResult!12050)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1469767 (= res!998221 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47810 a!2862) j!93) mask!2687) (select (arr!47810 a!2862) j!93) a!2862 mask!2687) lt!642666))))

(assert (=> b!1469767 (= lt!642666 (Intermediate!12050 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1469768 () Bool)

(declare-fun res!998211 () Bool)

(assert (=> b!1469768 (=> (not res!998211) (not e!825096))))

(assert (=> b!1469768 (= res!998211 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47810 a!2862) j!93) a!2862 mask!2687) lt!642666))))

(declare-fun b!1469769 () Bool)

(declare-fun res!998219 () Bool)

(assert (=> b!1469769 (=> (not res!998219) (not e!825100))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469769 (= res!998219 (validKeyInArray!0 (select (arr!47810 a!2862) i!1006)))))

(declare-fun b!1469770 () Bool)

(declare-fun res!998217 () Bool)

(assert (=> b!1469770 (=> (not res!998217) (not e!825100))))

(assert (=> b!1469770 (= res!998217 (validKeyInArray!0 (select (arr!47810 a!2862) j!93)))))

(declare-fun b!1469771 () Bool)

(declare-fun res!998216 () Bool)

(assert (=> b!1469771 (=> (not res!998216) (not e!825100))))

(declare-datatypes ((List!34311 0))(
  ( (Nil!34308) (Cons!34307 (h!35657 (_ BitVec 64)) (t!49005 List!34311)) )
))
(declare-fun arrayNoDuplicates!0 (array!99044 (_ BitVec 32) List!34311) Bool)

(assert (=> b!1469771 (= res!998216 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34308))))

(declare-fun b!1469772 () Bool)

(declare-fun res!998213 () Bool)

(assert (=> b!1469772 (=> (not res!998213) (not e!825100))))

(assert (=> b!1469772 (= res!998213 (and (= (size!48360 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48360 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48360 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1469773 () Bool)

(assert (=> b!1469773 (= e!825100 e!825098)))

(declare-fun res!998215 () Bool)

(assert (=> b!1469773 (=> (not res!998215) (not e!825098))))

(assert (=> b!1469773 (= res!998215 (= (select (store (arr!47810 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!642662 () array!99044)

(assert (=> b!1469773 (= lt!642662 (array!99045 (store (arr!47810 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48360 a!2862)))))

(declare-fun b!1469774 () Bool)

(declare-fun e!825097 () Bool)

(assert (=> b!1469774 (= e!825097 false)))

(declare-fun lt!642663 () Bool)

(declare-fun e!825099 () Bool)

(assert (=> b!1469774 (= lt!642663 e!825099)))

(declare-fun c!135288 () Bool)

(assert (=> b!1469774 (= c!135288 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1469775 () Bool)

(declare-fun res!998218 () Bool)

(assert (=> b!1469775 (=> (not res!998218) (not e!825100))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99044 (_ BitVec 32)) Bool)

(assert (=> b!1469775 (= res!998218 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun lt!642664 () (_ BitVec 64))

(declare-fun b!1469776 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99044 (_ BitVec 32)) SeekEntryResult!12050)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99044 (_ BitVec 32)) SeekEntryResult!12050)

(assert (=> b!1469776 (= e!825099 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642664 lt!642662 mask!2687) (seekEntryOrOpen!0 lt!642664 lt!642662 mask!2687))))))

(declare-fun b!1469777 () Bool)

(declare-fun lt!642665 () SeekEntryResult!12050)

(assert (=> b!1469777 (= e!825099 (not (= lt!642665 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642664 lt!642662 mask!2687))))))

(declare-fun b!1469778 () Bool)

(assert (=> b!1469778 (= e!825096 e!825097)))

(declare-fun res!998212 () Bool)

(assert (=> b!1469778 (=> (not res!998212) (not e!825097))))

(assert (=> b!1469778 (= res!998212 (= lt!642665 (Intermediate!12050 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1469778 (= lt!642665 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642664 mask!2687) lt!642664 lt!642662 mask!2687))))

(assert (=> b!1469778 (= lt!642664 (select (store (arr!47810 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!125596 res!998214) b!1469772))

(assert (= (and b!1469772 res!998213) b!1469769))

(assert (= (and b!1469769 res!998219) b!1469770))

(assert (= (and b!1469770 res!998217) b!1469775))

(assert (= (and b!1469775 res!998218) b!1469771))

(assert (= (and b!1469771 res!998216) b!1469766))

(assert (= (and b!1469766 res!998220) b!1469773))

(assert (= (and b!1469773 res!998215) b!1469767))

(assert (= (and b!1469767 res!998221) b!1469768))

(assert (= (and b!1469768 res!998211) b!1469778))

(assert (= (and b!1469778 res!998212) b!1469774))

(assert (= (and b!1469774 c!135288) b!1469777))

(assert (= (and b!1469774 (not c!135288)) b!1469776))

(declare-fun m!1356919 () Bool)

(assert (=> b!1469775 m!1356919))

(declare-fun m!1356921 () Bool)

(assert (=> b!1469773 m!1356921))

(declare-fun m!1356923 () Bool)

(assert (=> b!1469773 m!1356923))

(declare-fun m!1356925 () Bool)

(assert (=> b!1469769 m!1356925))

(assert (=> b!1469769 m!1356925))

(declare-fun m!1356927 () Bool)

(assert (=> b!1469769 m!1356927))

(declare-fun m!1356929 () Bool)

(assert (=> start!125596 m!1356929))

(declare-fun m!1356931 () Bool)

(assert (=> start!125596 m!1356931))

(declare-fun m!1356933 () Bool)

(assert (=> b!1469778 m!1356933))

(assert (=> b!1469778 m!1356933))

(declare-fun m!1356935 () Bool)

(assert (=> b!1469778 m!1356935))

(assert (=> b!1469778 m!1356921))

(declare-fun m!1356937 () Bool)

(assert (=> b!1469778 m!1356937))

(declare-fun m!1356939 () Bool)

(assert (=> b!1469767 m!1356939))

(assert (=> b!1469767 m!1356939))

(declare-fun m!1356941 () Bool)

(assert (=> b!1469767 m!1356941))

(assert (=> b!1469767 m!1356941))

(assert (=> b!1469767 m!1356939))

(declare-fun m!1356943 () Bool)

(assert (=> b!1469767 m!1356943))

(declare-fun m!1356945 () Bool)

(assert (=> b!1469771 m!1356945))

(declare-fun m!1356947 () Bool)

(assert (=> b!1469777 m!1356947))

(declare-fun m!1356949 () Bool)

(assert (=> b!1469776 m!1356949))

(declare-fun m!1356951 () Bool)

(assert (=> b!1469776 m!1356951))

(assert (=> b!1469768 m!1356939))

(assert (=> b!1469768 m!1356939))

(declare-fun m!1356953 () Bool)

(assert (=> b!1469768 m!1356953))

(assert (=> b!1469770 m!1356939))

(assert (=> b!1469770 m!1356939))

(declare-fun m!1356955 () Bool)

(assert (=> b!1469770 m!1356955))

(push 1)


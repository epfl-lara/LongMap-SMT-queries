; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121984 () Bool)

(assert start!121984)

(declare-fun b!1415732 () Bool)

(declare-fun e!801276 () Bool)

(declare-fun e!801280 () Bool)

(assert (=> b!1415732 (= e!801276 e!801280)))

(declare-fun res!951780 () Bool)

(assert (=> b!1415732 (=> res!951780 e!801280)))

(declare-datatypes ((SeekEntryResult!10977 0))(
  ( (MissingZero!10977 (index!46300 (_ BitVec 32))) (Found!10977 (index!46301 (_ BitVec 32))) (Intermediate!10977 (undefined!11789 Bool) (index!46302 (_ BitVec 32)) (x!127904 (_ BitVec 32))) (Undefined!10977) (MissingVacant!10977 (index!46303 (_ BitVec 32))) )
))
(declare-fun lt!624343 () SeekEntryResult!10977)

(declare-fun lt!624348 () SeekEntryResult!10977)

(assert (=> b!1415732 (= res!951780 (or (= lt!624343 lt!624348) (not (is-Intermediate!10977 lt!624348))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96670 0))(
  ( (array!96671 (arr!46666 (Array (_ BitVec 32) (_ BitVec 64))) (size!47216 (_ BitVec 32))) )
))
(declare-fun lt!624346 () array!96670)

(declare-fun lt!624342 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96670 (_ BitVec 32)) SeekEntryResult!10977)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1415732 (= lt!624348 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624342 mask!2840) lt!624342 lt!624346 mask!2840))))

(declare-fun a!2901 () array!96670)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1415732 (= lt!624342 (select (store (arr!46666 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1415732 (= lt!624346 (array!96671 (store (arr!46666 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47216 a!2901)))))

(declare-fun b!1415734 () Bool)

(declare-fun res!951776 () Bool)

(declare-fun e!801281 () Bool)

(assert (=> b!1415734 (=> (not res!951776) (not e!801281))))

(declare-datatypes ((List!33185 0))(
  ( (Nil!33182) (Cons!33181 (h!34468 (_ BitVec 64)) (t!47879 List!33185)) )
))
(declare-fun arrayNoDuplicates!0 (array!96670 (_ BitVec 32) List!33185) Bool)

(assert (=> b!1415734 (= res!951776 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33182))))

(declare-fun b!1415735 () Bool)

(declare-fun res!951782 () Bool)

(assert (=> b!1415735 (=> (not res!951782) (not e!801281))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96670 (_ BitVec 32)) Bool)

(assert (=> b!1415735 (= res!951782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1415736 () Bool)

(declare-fun e!801278 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96670 (_ BitVec 32)) SeekEntryResult!10977)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96670 (_ BitVec 32)) SeekEntryResult!10977)

(assert (=> b!1415736 (= e!801278 (= (seekEntryOrOpen!0 lt!624342 lt!624346 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127904 lt!624348) (index!46302 lt!624348) (index!46302 lt!624348) (select (arr!46666 a!2901) j!112) lt!624346 mask!2840)))))

(declare-fun b!1415737 () Bool)

(declare-fun res!951778 () Bool)

(assert (=> b!1415737 (=> (not res!951778) (not e!801281))))

(assert (=> b!1415737 (= res!951778 (and (= (size!47216 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47216 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47216 a!2901)) (not (= i!1037 j!112))))))

(declare-fun e!801275 () Bool)

(declare-fun lt!624344 () (_ BitVec 32))

(declare-fun b!1415738 () Bool)

(assert (=> b!1415738 (= e!801275 (= lt!624348 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624344 lt!624342 lt!624346 mask!2840)))))

(declare-fun res!951779 () Bool)

(assert (=> start!121984 (=> (not res!951779) (not e!801281))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121984 (= res!951779 (validMask!0 mask!2840))))

(assert (=> start!121984 e!801281))

(assert (=> start!121984 true))

(declare-fun array_inv!35694 (array!96670) Bool)

(assert (=> start!121984 (array_inv!35694 a!2901)))

(declare-fun b!1415733 () Bool)

(assert (=> b!1415733 (= e!801281 (not e!801276))))

(declare-fun res!951775 () Bool)

(assert (=> b!1415733 (=> res!951775 e!801276)))

(assert (=> b!1415733 (= res!951775 (or (not (is-Intermediate!10977 lt!624343)) (undefined!11789 lt!624343)))))

(declare-fun e!801279 () Bool)

(assert (=> b!1415733 e!801279))

(declare-fun res!951783 () Bool)

(assert (=> b!1415733 (=> (not res!951783) (not e!801279))))

(assert (=> b!1415733 (= res!951783 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47928 0))(
  ( (Unit!47929) )
))
(declare-fun lt!624345 () Unit!47928)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96670 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47928)

(assert (=> b!1415733 (= lt!624345 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1415733 (= lt!624343 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624344 (select (arr!46666 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1415733 (= lt!624344 (toIndex!0 (select (arr!46666 a!2901) j!112) mask!2840))))

(declare-fun b!1415739 () Bool)

(declare-fun res!951774 () Bool)

(assert (=> b!1415739 (=> (not res!951774) (not e!801281))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1415739 (= res!951774 (validKeyInArray!0 (select (arr!46666 a!2901) i!1037)))))

(declare-fun b!1415740 () Bool)

(assert (=> b!1415740 (= e!801280 e!801275)))

(declare-fun res!951784 () Bool)

(assert (=> b!1415740 (=> res!951784 e!801275)))

(assert (=> b!1415740 (= res!951784 (or (bvslt (x!127904 lt!624343) #b00000000000000000000000000000000) (bvsgt (x!127904 lt!624343) #b01111111111111111111111111111110) (bvslt (x!127904 lt!624348) #b00000000000000000000000000000000) (bvsgt (x!127904 lt!624348) #b01111111111111111111111111111110) (bvslt lt!624344 #b00000000000000000000000000000000) (bvsge lt!624344 (size!47216 a!2901)) (bvslt (index!46302 lt!624343) #b00000000000000000000000000000000) (bvsge (index!46302 lt!624343) (size!47216 a!2901)) (bvslt (index!46302 lt!624348) #b00000000000000000000000000000000) (bvsge (index!46302 lt!624348) (size!47216 a!2901)) (not (= lt!624343 (Intermediate!10977 false (index!46302 lt!624343) (x!127904 lt!624343)))) (not (= lt!624348 (Intermediate!10977 false (index!46302 lt!624348) (x!127904 lt!624348))))))))

(assert (=> b!1415740 e!801278))

(declare-fun res!951777 () Bool)

(assert (=> b!1415740 (=> (not res!951777) (not e!801278))))

(assert (=> b!1415740 (= res!951777 (and (not (undefined!11789 lt!624348)) (= (index!46302 lt!624348) i!1037) (bvslt (x!127904 lt!624348) (x!127904 lt!624343)) (= (select (store (arr!46666 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46302 lt!624348)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!624347 () Unit!47928)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96670 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47928)

(assert (=> b!1415740 (= lt!624347 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624344 (x!127904 lt!624343) (index!46302 lt!624343) (x!127904 lt!624348) (index!46302 lt!624348) (undefined!11789 lt!624348) mask!2840))))

(declare-fun b!1415741 () Bool)

(declare-fun res!951781 () Bool)

(assert (=> b!1415741 (=> (not res!951781) (not e!801281))))

(assert (=> b!1415741 (= res!951781 (validKeyInArray!0 (select (arr!46666 a!2901) j!112)))))

(declare-fun b!1415742 () Bool)

(assert (=> b!1415742 (= e!801279 (= (seekEntryOrOpen!0 (select (arr!46666 a!2901) j!112) a!2901 mask!2840) (Found!10977 j!112)))))

(assert (= (and start!121984 res!951779) b!1415737))

(assert (= (and b!1415737 res!951778) b!1415739))

(assert (= (and b!1415739 res!951774) b!1415741))

(assert (= (and b!1415741 res!951781) b!1415735))

(assert (= (and b!1415735 res!951782) b!1415734))

(assert (= (and b!1415734 res!951776) b!1415733))

(assert (= (and b!1415733 res!951783) b!1415742))

(assert (= (and b!1415733 (not res!951775)) b!1415732))

(assert (= (and b!1415732 (not res!951780)) b!1415740))

(assert (= (and b!1415740 res!951777) b!1415736))

(assert (= (and b!1415740 (not res!951784)) b!1415738))

(declare-fun m!1306123 () Bool)

(assert (=> start!121984 m!1306123))

(declare-fun m!1306125 () Bool)

(assert (=> start!121984 m!1306125))

(declare-fun m!1306127 () Bool)

(assert (=> b!1415734 m!1306127))

(declare-fun m!1306129 () Bool)

(assert (=> b!1415741 m!1306129))

(assert (=> b!1415741 m!1306129))

(declare-fun m!1306131 () Bool)

(assert (=> b!1415741 m!1306131))

(assert (=> b!1415742 m!1306129))

(assert (=> b!1415742 m!1306129))

(declare-fun m!1306133 () Bool)

(assert (=> b!1415742 m!1306133))

(assert (=> b!1415733 m!1306129))

(declare-fun m!1306135 () Bool)

(assert (=> b!1415733 m!1306135))

(assert (=> b!1415733 m!1306129))

(assert (=> b!1415733 m!1306129))

(declare-fun m!1306137 () Bool)

(assert (=> b!1415733 m!1306137))

(declare-fun m!1306139 () Bool)

(assert (=> b!1415733 m!1306139))

(declare-fun m!1306141 () Bool)

(assert (=> b!1415733 m!1306141))

(declare-fun m!1306143 () Bool)

(assert (=> b!1415739 m!1306143))

(assert (=> b!1415739 m!1306143))

(declare-fun m!1306145 () Bool)

(assert (=> b!1415739 m!1306145))

(declare-fun m!1306147 () Bool)

(assert (=> b!1415732 m!1306147))

(assert (=> b!1415732 m!1306147))

(declare-fun m!1306149 () Bool)

(assert (=> b!1415732 m!1306149))

(declare-fun m!1306151 () Bool)

(assert (=> b!1415732 m!1306151))

(declare-fun m!1306153 () Bool)

(assert (=> b!1415732 m!1306153))

(declare-fun m!1306155 () Bool)

(assert (=> b!1415736 m!1306155))

(assert (=> b!1415736 m!1306129))

(assert (=> b!1415736 m!1306129))

(declare-fun m!1306157 () Bool)

(assert (=> b!1415736 m!1306157))

(declare-fun m!1306159 () Bool)

(assert (=> b!1415735 m!1306159))

(assert (=> b!1415740 m!1306151))

(declare-fun m!1306161 () Bool)

(assert (=> b!1415740 m!1306161))

(declare-fun m!1306163 () Bool)

(assert (=> b!1415740 m!1306163))

(declare-fun m!1306165 () Bool)

(assert (=> b!1415738 m!1306165))

(push 1)

(assert (not b!1415740))

(assert (not b!1415733))

(assert (not b!1415735))

(assert (not b!1415734))

(assert (not start!121984))

(assert (not b!1415738))

(assert (not b!1415736))

(assert (not b!1415732))

(assert (not b!1415739))

(assert (not b!1415742))

(assert (not b!1415741))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


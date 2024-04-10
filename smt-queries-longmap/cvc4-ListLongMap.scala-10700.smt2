; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125342 () Bool)

(assert start!125342)

(declare-fun b!1464759 () Bool)

(declare-fun e!823126 () Bool)

(declare-fun e!823127 () Bool)

(assert (=> b!1464759 (= e!823126 e!823127)))

(declare-fun res!993772 () Bool)

(assert (=> b!1464759 (=> res!993772 e!823127)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!641189 () (_ BitVec 32))

(declare-datatypes ((array!98790 0))(
  ( (array!98791 (arr!47683 (Array (_ BitVec 32) (_ BitVec 64))) (size!48233 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98790)

(assert (=> b!1464759 (= res!993772 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641189 #b00000000000000000000000000000000) (bvsge lt!641189 (size!48233 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464759 (= lt!641189 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!641191 () (_ BitVec 64))

(declare-fun e!823124 () Bool)

(declare-fun lt!641187 () array!98790)

(declare-fun b!1464760 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11935 0))(
  ( (MissingZero!11935 (index!50132 (_ BitVec 32))) (Found!11935 (index!50133 (_ BitVec 32))) (Intermediate!11935 (undefined!12747 Bool) (index!50134 (_ BitVec 32)) (x!131712 (_ BitVec 32))) (Undefined!11935) (MissingVacant!11935 (index!50135 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98790 (_ BitVec 32)) SeekEntryResult!11935)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98790 (_ BitVec 32)) SeekEntryResult!11935)

(assert (=> b!1464760 (= e!823124 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641189 intermediateAfterIndex!19 lt!641191 lt!641187 mask!2687) (seekEntryOrOpen!0 lt!641191 lt!641187 mask!2687))))))

(declare-fun b!1464761 () Bool)

(declare-fun res!993787 () Bool)

(declare-fun e!823129 () Bool)

(assert (=> b!1464761 (=> (not res!993787) (not e!823129))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98790 (_ BitVec 32)) Bool)

(assert (=> b!1464761 (= res!993787 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1464762 () Bool)

(declare-fun res!993773 () Bool)

(assert (=> b!1464762 (=> (not res!993773) (not e!823129))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1464762 (= res!993773 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48233 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48233 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48233 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!993779 () Bool)

(assert (=> start!125342 (=> (not res!993779) (not e!823129))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125342 (= res!993779 (validMask!0 mask!2687))))

(assert (=> start!125342 e!823129))

(assert (=> start!125342 true))

(declare-fun array_inv!36711 (array!98790) Bool)

(assert (=> start!125342 (array_inv!36711 a!2862)))

(declare-fun lt!641190 () SeekEntryResult!11935)

(declare-fun e!823128 () Bool)

(declare-fun b!1464763 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98790 (_ BitVec 32)) SeekEntryResult!11935)

(assert (=> b!1464763 (= e!823128 (= lt!641190 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641191 lt!641187 mask!2687)))))

(declare-fun b!1464764 () Bool)

(declare-fun e!823130 () Bool)

(declare-fun e!823122 () Bool)

(assert (=> b!1464764 (= e!823130 e!823122)))

(declare-fun res!993786 () Bool)

(assert (=> b!1464764 (=> (not res!993786) (not e!823122))))

(declare-fun lt!641192 () SeekEntryResult!11935)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464764 (= res!993786 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47683 a!2862) j!93) mask!2687) (select (arr!47683 a!2862) j!93) a!2862 mask!2687) lt!641192))))

(assert (=> b!1464764 (= lt!641192 (Intermediate!11935 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1464765 () Bool)

(declare-fun e!823121 () Bool)

(assert (=> b!1464765 (= e!823121 (or (= (select (arr!47683 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47683 a!2862) intermediateBeforeIndex!19) (select (arr!47683 a!2862) j!93))))))

(declare-fun b!1464766 () Bool)

(declare-fun res!993776 () Bool)

(assert (=> b!1464766 (=> (not res!993776) (not e!823129))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1464766 (= res!993776 (validKeyInArray!0 (select (arr!47683 a!2862) i!1006)))))

(declare-fun b!1464767 () Bool)

(assert (=> b!1464767 (= e!823129 e!823130)))

(declare-fun res!993775 () Bool)

(assert (=> b!1464767 (=> (not res!993775) (not e!823130))))

(assert (=> b!1464767 (= res!993775 (= (select (store (arr!47683 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1464767 (= lt!641187 (array!98791 (store (arr!47683 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48233 a!2862)))))

(declare-fun b!1464768 () Bool)

(declare-fun res!993777 () Bool)

(declare-fun e!823123 () Bool)

(assert (=> b!1464768 (=> (not res!993777) (not e!823123))))

(assert (=> b!1464768 (= res!993777 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1464769 () Bool)

(declare-fun res!993778 () Bool)

(assert (=> b!1464769 (=> (not res!993778) (not e!823122))))

(assert (=> b!1464769 (= res!993778 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47683 a!2862) j!93) a!2862 mask!2687) lt!641192))))

(declare-fun b!1464770 () Bool)

(declare-fun res!993771 () Bool)

(assert (=> b!1464770 (=> (not res!993771) (not e!823129))))

(assert (=> b!1464770 (= res!993771 (validKeyInArray!0 (select (arr!47683 a!2862) j!93)))))

(declare-fun b!1464771 () Bool)

(assert (=> b!1464771 (= e!823127 true)))

(declare-fun lt!641188 () Bool)

(assert (=> b!1464771 (= lt!641188 e!823124)))

(declare-fun c!135005 () Bool)

(assert (=> b!1464771 (= c!135005 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1464772 () Bool)

(assert (=> b!1464772 (= e!823122 e!823123)))

(declare-fun res!993781 () Bool)

(assert (=> b!1464772 (=> (not res!993781) (not e!823123))))

(assert (=> b!1464772 (= res!993781 (= lt!641190 (Intermediate!11935 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1464772 (= lt!641190 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641191 mask!2687) lt!641191 lt!641187 mask!2687))))

(assert (=> b!1464772 (= lt!641191 (select (store (arr!47683 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1464773 () Bool)

(assert (=> b!1464773 (= e!823128 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641191 lt!641187 mask!2687) (seekEntryOrOpen!0 lt!641191 lt!641187 mask!2687)))))

(declare-fun b!1464774 () Bool)

(declare-fun res!993784 () Bool)

(assert (=> b!1464774 (=> res!993784 e!823127)))

(assert (=> b!1464774 (= res!993784 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641189 (select (arr!47683 a!2862) j!93) a!2862 mask!2687) lt!641192)))))

(declare-fun b!1464775 () Bool)

(assert (=> b!1464775 (= e!823124 (not (= lt!641190 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641189 lt!641191 lt!641187 mask!2687))))))

(declare-fun b!1464776 () Bool)

(assert (=> b!1464776 (= e!823123 (not e!823126))))

(declare-fun res!993783 () Bool)

(assert (=> b!1464776 (=> res!993783 e!823126)))

(assert (=> b!1464776 (= res!993783 (or (and (= (select (arr!47683 a!2862) index!646) (select (store (arr!47683 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47683 a!2862) index!646) (select (arr!47683 a!2862) j!93))) (= (select (arr!47683 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1464776 e!823121))

(declare-fun res!993780 () Bool)

(assert (=> b!1464776 (=> (not res!993780) (not e!823121))))

(assert (=> b!1464776 (= res!993780 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49366 0))(
  ( (Unit!49367) )
))
(declare-fun lt!641193 () Unit!49366)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98790 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49366)

(assert (=> b!1464776 (= lt!641193 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1464777 () Bool)

(declare-fun res!993774 () Bool)

(assert (=> b!1464777 (=> (not res!993774) (not e!823129))))

(declare-datatypes ((List!34184 0))(
  ( (Nil!34181) (Cons!34180 (h!35530 (_ BitVec 64)) (t!48878 List!34184)) )
))
(declare-fun arrayNoDuplicates!0 (array!98790 (_ BitVec 32) List!34184) Bool)

(assert (=> b!1464777 (= res!993774 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34181))))

(declare-fun b!1464778 () Bool)

(declare-fun res!993782 () Bool)

(assert (=> b!1464778 (=> (not res!993782) (not e!823123))))

(assert (=> b!1464778 (= res!993782 e!823128)))

(declare-fun c!135006 () Bool)

(assert (=> b!1464778 (= c!135006 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1464779 () Bool)

(declare-fun res!993785 () Bool)

(assert (=> b!1464779 (=> (not res!993785) (not e!823129))))

(assert (=> b!1464779 (= res!993785 (and (= (size!48233 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48233 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48233 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1464780 () Bool)

(declare-fun res!993770 () Bool)

(assert (=> b!1464780 (=> (not res!993770) (not e!823121))))

(assert (=> b!1464780 (= res!993770 (= (seekEntryOrOpen!0 (select (arr!47683 a!2862) j!93) a!2862 mask!2687) (Found!11935 j!93)))))

(assert (= (and start!125342 res!993779) b!1464779))

(assert (= (and b!1464779 res!993785) b!1464766))

(assert (= (and b!1464766 res!993776) b!1464770))

(assert (= (and b!1464770 res!993771) b!1464761))

(assert (= (and b!1464761 res!993787) b!1464777))

(assert (= (and b!1464777 res!993774) b!1464762))

(assert (= (and b!1464762 res!993773) b!1464767))

(assert (= (and b!1464767 res!993775) b!1464764))

(assert (= (and b!1464764 res!993786) b!1464769))

(assert (= (and b!1464769 res!993778) b!1464772))

(assert (= (and b!1464772 res!993781) b!1464778))

(assert (= (and b!1464778 c!135006) b!1464763))

(assert (= (and b!1464778 (not c!135006)) b!1464773))

(assert (= (and b!1464778 res!993782) b!1464768))

(assert (= (and b!1464768 res!993777) b!1464776))

(assert (= (and b!1464776 res!993780) b!1464780))

(assert (= (and b!1464780 res!993770) b!1464765))

(assert (= (and b!1464776 (not res!993783)) b!1464759))

(assert (= (and b!1464759 (not res!993772)) b!1464774))

(assert (= (and b!1464774 (not res!993784)) b!1464771))

(assert (= (and b!1464771 c!135005) b!1464775))

(assert (= (and b!1464771 (not c!135005)) b!1464760))

(declare-fun m!1351935 () Bool)

(assert (=> b!1464767 m!1351935))

(declare-fun m!1351937 () Bool)

(assert (=> b!1464767 m!1351937))

(declare-fun m!1351939 () Bool)

(assert (=> b!1464775 m!1351939))

(declare-fun m!1351941 () Bool)

(assert (=> b!1464765 m!1351941))

(declare-fun m!1351943 () Bool)

(assert (=> b!1464765 m!1351943))

(declare-fun m!1351945 () Bool)

(assert (=> start!125342 m!1351945))

(declare-fun m!1351947 () Bool)

(assert (=> start!125342 m!1351947))

(declare-fun m!1351949 () Bool)

(assert (=> b!1464772 m!1351949))

(assert (=> b!1464772 m!1351949))

(declare-fun m!1351951 () Bool)

(assert (=> b!1464772 m!1351951))

(assert (=> b!1464772 m!1351935))

(declare-fun m!1351953 () Bool)

(assert (=> b!1464772 m!1351953))

(assert (=> b!1464769 m!1351943))

(assert (=> b!1464769 m!1351943))

(declare-fun m!1351955 () Bool)

(assert (=> b!1464769 m!1351955))

(declare-fun m!1351957 () Bool)

(assert (=> b!1464761 m!1351957))

(assert (=> b!1464780 m!1351943))

(assert (=> b!1464780 m!1351943))

(declare-fun m!1351959 () Bool)

(assert (=> b!1464780 m!1351959))

(declare-fun m!1351961 () Bool)

(assert (=> b!1464759 m!1351961))

(declare-fun m!1351963 () Bool)

(assert (=> b!1464773 m!1351963))

(declare-fun m!1351965 () Bool)

(assert (=> b!1464773 m!1351965))

(assert (=> b!1464774 m!1351943))

(assert (=> b!1464774 m!1351943))

(declare-fun m!1351967 () Bool)

(assert (=> b!1464774 m!1351967))

(declare-fun m!1351969 () Bool)

(assert (=> b!1464766 m!1351969))

(assert (=> b!1464766 m!1351969))

(declare-fun m!1351971 () Bool)

(assert (=> b!1464766 m!1351971))

(assert (=> b!1464770 m!1351943))

(assert (=> b!1464770 m!1351943))

(declare-fun m!1351973 () Bool)

(assert (=> b!1464770 m!1351973))

(declare-fun m!1351975 () Bool)

(assert (=> b!1464763 m!1351975))

(declare-fun m!1351977 () Bool)

(assert (=> b!1464777 m!1351977))

(assert (=> b!1464764 m!1351943))

(assert (=> b!1464764 m!1351943))

(declare-fun m!1351979 () Bool)

(assert (=> b!1464764 m!1351979))

(assert (=> b!1464764 m!1351979))

(assert (=> b!1464764 m!1351943))

(declare-fun m!1351981 () Bool)

(assert (=> b!1464764 m!1351981))

(declare-fun m!1351983 () Bool)

(assert (=> b!1464776 m!1351983))

(assert (=> b!1464776 m!1351935))

(declare-fun m!1351985 () Bool)

(assert (=> b!1464776 m!1351985))

(declare-fun m!1351987 () Bool)

(assert (=> b!1464776 m!1351987))

(declare-fun m!1351989 () Bool)

(assert (=> b!1464776 m!1351989))

(assert (=> b!1464776 m!1351943))

(declare-fun m!1351991 () Bool)

(assert (=> b!1464760 m!1351991))

(assert (=> b!1464760 m!1351965))

(push 1)

(assert (not b!1464780))

(assert (not b!1464760))

(assert (not b!1464763))

(assert (not b!1464774))

(assert (not b!1464777))

(assert (not b!1464773))

(assert (not b!1464761))

(assert (not b!1464766))

(assert (not b!1464769))

(assert (not start!125342))

(assert (not b!1464772))

(assert (not b!1464764))

(assert (not b!1464770))

(assert (not b!1464776))

(assert (not b!1464775))

(assert (not b!1464759))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


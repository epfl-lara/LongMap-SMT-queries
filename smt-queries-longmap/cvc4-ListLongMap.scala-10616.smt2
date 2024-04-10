; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124838 () Bool)

(assert start!124838)

(declare-fun b!1449111 () Bool)

(declare-fun res!980594 () Bool)

(declare-fun e!816069 () Bool)

(assert (=> b!1449111 (=> (not res!980594) (not e!816069))))

(declare-fun e!816074 () Bool)

(assert (=> b!1449111 (= res!980594 e!816074)))

(declare-fun c!133773 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1449111 (= c!133773 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1449112 () Bool)

(declare-fun res!980596 () Bool)

(declare-fun e!816073 () Bool)

(assert (=> b!1449112 (=> (not res!980596) (not e!816073))))

(declare-datatypes ((array!98286 0))(
  ( (array!98287 (arr!47431 (Array (_ BitVec 32) (_ BitVec 64))) (size!47981 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98286)

(declare-datatypes ((List!33932 0))(
  ( (Nil!33929) (Cons!33928 (h!35278 (_ BitVec 64)) (t!48626 List!33932)) )
))
(declare-fun arrayNoDuplicates!0 (array!98286 (_ BitVec 32) List!33932) Bool)

(assert (=> b!1449112 (= res!980596 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33929))))

(declare-fun b!1449113 () Bool)

(declare-fun res!980591 () Bool)

(assert (=> b!1449113 (=> (not res!980591) (not e!816073))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1449113 (= res!980591 (validKeyInArray!0 (select (arr!47431 a!2862) j!93)))))

(declare-fun b!1449114 () Bool)

(declare-fun lt!635782 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!635780 () array!98286)

(declare-datatypes ((SeekEntryResult!11683 0))(
  ( (MissingZero!11683 (index!49124 (_ BitVec 32))) (Found!11683 (index!49125 (_ BitVec 32))) (Intermediate!11683 (undefined!12495 Bool) (index!49126 (_ BitVec 32)) (x!130788 (_ BitVec 32))) (Undefined!11683) (MissingVacant!11683 (index!49127 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98286 (_ BitVec 32)) SeekEntryResult!11683)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98286 (_ BitVec 32)) SeekEntryResult!11683)

(assert (=> b!1449114 (= e!816074 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635782 lt!635780 mask!2687) (seekEntryOrOpen!0 lt!635782 lt!635780 mask!2687)))))

(declare-fun res!980600 () Bool)

(assert (=> start!124838 (=> (not res!980600) (not e!816073))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124838 (= res!980600 (validMask!0 mask!2687))))

(assert (=> start!124838 e!816073))

(assert (=> start!124838 true))

(declare-fun array_inv!36459 (array!98286) Bool)

(assert (=> start!124838 (array_inv!36459 a!2862)))

(declare-fun b!1449115 () Bool)

(declare-fun e!816066 () Bool)

(declare-fun e!816067 () Bool)

(assert (=> b!1449115 (= e!816066 e!816067)))

(declare-fun res!980602 () Bool)

(assert (=> b!1449115 (=> (not res!980602) (not e!816067))))

(declare-fun lt!635783 () SeekEntryResult!11683)

(assert (=> b!1449115 (= res!980602 (= lt!635783 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47431 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1449116 () Bool)

(declare-fun res!980592 () Bool)

(assert (=> b!1449116 (=> (not res!980592) (not e!816073))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1449116 (= res!980592 (validKeyInArray!0 (select (arr!47431 a!2862) i!1006)))))

(declare-fun b!1449117 () Bool)

(declare-fun e!816070 () Bool)

(assert (=> b!1449117 (= e!816073 e!816070)))

(declare-fun res!980599 () Bool)

(assert (=> b!1449117 (=> (not res!980599) (not e!816070))))

(assert (=> b!1449117 (= res!980599 (= (select (store (arr!47431 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1449117 (= lt!635780 (array!98287 (store (arr!47431 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47981 a!2862)))))

(declare-fun b!1449118 () Bool)

(declare-fun e!816072 () Bool)

(assert (=> b!1449118 (= e!816070 e!816072)))

(declare-fun res!980601 () Bool)

(assert (=> b!1449118 (=> (not res!980601) (not e!816072))))

(declare-fun lt!635778 () SeekEntryResult!11683)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98286 (_ BitVec 32)) SeekEntryResult!11683)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1449118 (= res!980601 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47431 a!2862) j!93) mask!2687) (select (arr!47431 a!2862) j!93) a!2862 mask!2687) lt!635778))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1449118 (= lt!635778 (Intermediate!11683 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1449119 () Bool)

(declare-fun res!980587 () Bool)

(assert (=> b!1449119 (=> (not res!980587) (not e!816069))))

(assert (=> b!1449119 (= res!980587 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1449120 () Bool)

(declare-fun res!980593 () Bool)

(assert (=> b!1449120 (=> (not res!980593) (not e!816073))))

(assert (=> b!1449120 (= res!980593 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47981 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47981 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47981 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1449121 () Bool)

(declare-fun res!980590 () Bool)

(assert (=> b!1449121 (=> (not res!980590) (not e!816073))))

(assert (=> b!1449121 (= res!980590 (and (= (size!47981 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47981 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47981 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1449122 () Bool)

(assert (=> b!1449122 (= e!816072 e!816069)))

(declare-fun res!980597 () Bool)

(assert (=> b!1449122 (=> (not res!980597) (not e!816069))))

(declare-fun lt!635784 () SeekEntryResult!11683)

(assert (=> b!1449122 (= res!980597 (= lt!635784 (Intermediate!11683 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1449122 (= lt!635784 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635782 mask!2687) lt!635782 lt!635780 mask!2687))))

(assert (=> b!1449122 (= lt!635782 (select (store (arr!47431 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1449123 () Bool)

(assert (=> b!1449123 (= e!816067 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1449124 () Bool)

(declare-fun res!980589 () Bool)

(assert (=> b!1449124 (=> (not res!980589) (not e!816072))))

(assert (=> b!1449124 (= res!980589 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47431 a!2862) j!93) a!2862 mask!2687) lt!635778))))

(declare-fun b!1449125 () Bool)

(declare-fun res!980588 () Bool)

(assert (=> b!1449125 (=> (not res!980588) (not e!816073))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98286 (_ BitVec 32)) Bool)

(assert (=> b!1449125 (= res!980588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1449126 () Bool)

(declare-fun e!816068 () Bool)

(assert (=> b!1449126 (= e!816068 true)))

(declare-fun lt!635781 () SeekEntryResult!11683)

(assert (=> b!1449126 (= lt!635781 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47431 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1449127 () Bool)

(declare-fun e!816071 () Bool)

(assert (=> b!1449127 (= e!816071 e!816066)))

(declare-fun res!980586 () Bool)

(assert (=> b!1449127 (=> res!980586 e!816066)))

(assert (=> b!1449127 (= res!980586 (or (and (= (select (arr!47431 a!2862) index!646) (select (store (arr!47431 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47431 a!2862) index!646) (select (arr!47431 a!2862) j!93))) (not (= (select (arr!47431 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1449128 () Bool)

(assert (=> b!1449128 (= e!816074 (= lt!635784 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635782 lt!635780 mask!2687)))))

(declare-fun b!1449129 () Bool)

(assert (=> b!1449129 (= e!816069 (not e!816068))))

(declare-fun res!980598 () Bool)

(assert (=> b!1449129 (=> res!980598 e!816068)))

(assert (=> b!1449129 (= res!980598 (or (and (= (select (arr!47431 a!2862) index!646) (select (store (arr!47431 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47431 a!2862) index!646) (select (arr!47431 a!2862) j!93))) (not (= (select (arr!47431 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47431 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1449129 e!816071))

(declare-fun res!980595 () Bool)

(assert (=> b!1449129 (=> (not res!980595) (not e!816071))))

(assert (=> b!1449129 (= res!980595 (and (= lt!635783 (Found!11683 j!93)) (or (= (select (arr!47431 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47431 a!2862) intermediateBeforeIndex!19) (select (arr!47431 a!2862) j!93)))))))

(assert (=> b!1449129 (= lt!635783 (seekEntryOrOpen!0 (select (arr!47431 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1449129 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48862 0))(
  ( (Unit!48863) )
))
(declare-fun lt!635779 () Unit!48862)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98286 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48862)

(assert (=> b!1449129 (= lt!635779 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!124838 res!980600) b!1449121))

(assert (= (and b!1449121 res!980590) b!1449116))

(assert (= (and b!1449116 res!980592) b!1449113))

(assert (= (and b!1449113 res!980591) b!1449125))

(assert (= (and b!1449125 res!980588) b!1449112))

(assert (= (and b!1449112 res!980596) b!1449120))

(assert (= (and b!1449120 res!980593) b!1449117))

(assert (= (and b!1449117 res!980599) b!1449118))

(assert (= (and b!1449118 res!980601) b!1449124))

(assert (= (and b!1449124 res!980589) b!1449122))

(assert (= (and b!1449122 res!980597) b!1449111))

(assert (= (and b!1449111 c!133773) b!1449128))

(assert (= (and b!1449111 (not c!133773)) b!1449114))

(assert (= (and b!1449111 res!980594) b!1449119))

(assert (= (and b!1449119 res!980587) b!1449129))

(assert (= (and b!1449129 res!980595) b!1449127))

(assert (= (and b!1449127 (not res!980586)) b!1449115))

(assert (= (and b!1449115 res!980602) b!1449123))

(assert (= (and b!1449129 (not res!980598)) b!1449126))

(declare-fun m!1337839 () Bool)

(assert (=> b!1449129 m!1337839))

(declare-fun m!1337841 () Bool)

(assert (=> b!1449129 m!1337841))

(declare-fun m!1337843 () Bool)

(assert (=> b!1449129 m!1337843))

(declare-fun m!1337845 () Bool)

(assert (=> b!1449129 m!1337845))

(declare-fun m!1337847 () Bool)

(assert (=> b!1449129 m!1337847))

(declare-fun m!1337849 () Bool)

(assert (=> b!1449129 m!1337849))

(declare-fun m!1337851 () Bool)

(assert (=> b!1449129 m!1337851))

(declare-fun m!1337853 () Bool)

(assert (=> b!1449129 m!1337853))

(assert (=> b!1449129 m!1337849))

(assert (=> b!1449115 m!1337849))

(assert (=> b!1449115 m!1337849))

(declare-fun m!1337855 () Bool)

(assert (=> b!1449115 m!1337855))

(assert (=> b!1449124 m!1337849))

(assert (=> b!1449124 m!1337849))

(declare-fun m!1337857 () Bool)

(assert (=> b!1449124 m!1337857))

(assert (=> b!1449113 m!1337849))

(assert (=> b!1449113 m!1337849))

(declare-fun m!1337859 () Bool)

(assert (=> b!1449113 m!1337859))

(assert (=> b!1449127 m!1337847))

(assert (=> b!1449127 m!1337841))

(assert (=> b!1449127 m!1337845))

(assert (=> b!1449127 m!1337849))

(declare-fun m!1337861 () Bool)

(assert (=> b!1449125 m!1337861))

(assert (=> b!1449117 m!1337841))

(declare-fun m!1337863 () Bool)

(assert (=> b!1449117 m!1337863))

(declare-fun m!1337865 () Bool)

(assert (=> b!1449116 m!1337865))

(assert (=> b!1449116 m!1337865))

(declare-fun m!1337867 () Bool)

(assert (=> b!1449116 m!1337867))

(assert (=> b!1449126 m!1337849))

(assert (=> b!1449126 m!1337849))

(declare-fun m!1337869 () Bool)

(assert (=> b!1449126 m!1337869))

(declare-fun m!1337871 () Bool)

(assert (=> b!1449122 m!1337871))

(assert (=> b!1449122 m!1337871))

(declare-fun m!1337873 () Bool)

(assert (=> b!1449122 m!1337873))

(assert (=> b!1449122 m!1337841))

(declare-fun m!1337875 () Bool)

(assert (=> b!1449122 m!1337875))

(declare-fun m!1337877 () Bool)

(assert (=> b!1449112 m!1337877))

(declare-fun m!1337879 () Bool)

(assert (=> b!1449128 m!1337879))

(assert (=> b!1449118 m!1337849))

(assert (=> b!1449118 m!1337849))

(declare-fun m!1337881 () Bool)

(assert (=> b!1449118 m!1337881))

(assert (=> b!1449118 m!1337881))

(assert (=> b!1449118 m!1337849))

(declare-fun m!1337883 () Bool)

(assert (=> b!1449118 m!1337883))

(declare-fun m!1337885 () Bool)

(assert (=> b!1449114 m!1337885))

(declare-fun m!1337887 () Bool)

(assert (=> b!1449114 m!1337887))

(declare-fun m!1337889 () Bool)

(assert (=> start!124838 m!1337889))

(declare-fun m!1337891 () Bool)

(assert (=> start!124838 m!1337891))

(push 1)


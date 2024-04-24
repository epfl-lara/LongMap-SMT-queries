; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125040 () Bool)

(assert start!125040)

(declare-fun b!1449982 () Bool)

(declare-fun e!816666 () Bool)

(declare-fun e!816670 () Bool)

(assert (=> b!1449982 (= e!816666 (not e!816670))))

(declare-fun res!980683 () Bool)

(assert (=> b!1449982 (=> res!980683 e!816670)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98383 0))(
  ( (array!98384 (arr!47476 (Array (_ BitVec 32) (_ BitVec 64))) (size!48027 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98383)

(assert (=> b!1449982 (= res!980683 (or (and (= (select (arr!47476 a!2862) index!646) (select (store (arr!47476 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47476 a!2862) index!646) (select (arr!47476 a!2862) j!93))) (not (= (select (arr!47476 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47476 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!816671 () Bool)

(assert (=> b!1449982 e!816671))

(declare-fun res!980693 () Bool)

(assert (=> b!1449982 (=> (not res!980693) (not e!816671))))

(declare-datatypes ((SeekEntryResult!11625 0))(
  ( (MissingZero!11625 (index!48892 (_ BitVec 32))) (Found!11625 (index!48893 (_ BitVec 32))) (Intermediate!11625 (undefined!12437 Bool) (index!48894 (_ BitVec 32)) (x!130738 (_ BitVec 32))) (Undefined!11625) (MissingVacant!11625 (index!48895 (_ BitVec 32))) )
))
(declare-fun lt!636094 () SeekEntryResult!11625)

(assert (=> b!1449982 (= res!980693 (and (= lt!636094 (Found!11625 j!93)) (or (= (select (arr!47476 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47476 a!2862) intermediateBeforeIndex!19) (select (arr!47476 a!2862) j!93)))))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98383 (_ BitVec 32)) SeekEntryResult!11625)

(assert (=> b!1449982 (= lt!636094 (seekEntryOrOpen!0 (select (arr!47476 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98383 (_ BitVec 32)) Bool)

(assert (=> b!1449982 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48779 0))(
  ( (Unit!48780) )
))
(declare-fun lt!636090 () Unit!48779)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98383 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48779)

(assert (=> b!1449982 (= lt!636090 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1449984 () Bool)

(declare-fun res!980682 () Bool)

(declare-fun e!816672 () Bool)

(assert (=> b!1449984 (=> (not res!980682) (not e!816672))))

(assert (=> b!1449984 (= res!980682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1449985 () Bool)

(declare-fun res!980690 () Bool)

(assert (=> b!1449985 (=> (not res!980690) (not e!816672))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1449985 (= res!980690 (validKeyInArray!0 (select (arr!47476 a!2862) i!1006)))))

(declare-fun b!1449986 () Bool)

(declare-fun res!980695 () Bool)

(assert (=> b!1449986 (=> (not res!980695) (not e!816672))))

(assert (=> b!1449986 (= res!980695 (validKeyInArray!0 (select (arr!47476 a!2862) j!93)))))

(declare-fun b!1449987 () Bool)

(declare-fun e!816667 () Bool)

(assert (=> b!1449987 (= e!816671 e!816667)))

(declare-fun res!980696 () Bool)

(assert (=> b!1449987 (=> res!980696 e!816667)))

(assert (=> b!1449987 (= res!980696 (or (and (= (select (arr!47476 a!2862) index!646) (select (store (arr!47476 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47476 a!2862) index!646) (select (arr!47476 a!2862) j!93))) (not (= (select (arr!47476 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1449988 () Bool)

(declare-fun res!980684 () Bool)

(declare-fun e!816663 () Bool)

(assert (=> b!1449988 (=> (not res!980684) (not e!816663))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!636088 () SeekEntryResult!11625)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98383 (_ BitVec 32)) SeekEntryResult!11625)

(assert (=> b!1449988 (= res!980684 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47476 a!2862) j!93) a!2862 mask!2687) lt!636088))))

(declare-fun b!1449989 () Bool)

(declare-fun res!980680 () Bool)

(assert (=> b!1449989 (=> (not res!980680) (not e!816672))))

(declare-datatypes ((List!33964 0))(
  ( (Nil!33961) (Cons!33960 (h!35321 (_ BitVec 64)) (t!48650 List!33964)) )
))
(declare-fun arrayNoDuplicates!0 (array!98383 (_ BitVec 32) List!33964) Bool)

(assert (=> b!1449989 (= res!980680 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33961))))

(declare-fun b!1449990 () Bool)

(declare-fun res!980686 () Bool)

(assert (=> b!1449990 (=> (not res!980686) (not e!816666))))

(declare-fun e!816669 () Bool)

(assert (=> b!1449990 (= res!980686 e!816669)))

(declare-fun c!134170 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1449990 (= c!134170 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1449991 () Bool)

(declare-fun e!816665 () Bool)

(assert (=> b!1449991 (= e!816672 e!816665)))

(declare-fun res!980691 () Bool)

(assert (=> b!1449991 (=> (not res!980691) (not e!816665))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1449991 (= res!980691 (= (select (store (arr!47476 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!636091 () array!98383)

(assert (=> b!1449991 (= lt!636091 (array!98384 (store (arr!47476 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48027 a!2862)))))

(declare-fun b!1449992 () Bool)

(declare-fun res!980694 () Bool)

(assert (=> b!1449992 (=> (not res!980694) (not e!816672))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1449992 (= res!980694 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48027 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48027 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48027 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1449983 () Bool)

(declare-fun res!980688 () Bool)

(assert (=> b!1449983 (=> (not res!980688) (not e!816666))))

(assert (=> b!1449983 (= res!980688 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!980681 () Bool)

(assert (=> start!125040 (=> (not res!980681) (not e!816672))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125040 (= res!980681 (validMask!0 mask!2687))))

(assert (=> start!125040 e!816672))

(assert (=> start!125040 true))

(declare-fun array_inv!36757 (array!98383) Bool)

(assert (=> start!125040 (array_inv!36757 a!2862)))

(declare-fun e!816668 () Bool)

(declare-fun b!1449993 () Bool)

(assert (=> b!1449993 (= e!816668 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun lt!636092 () (_ BitVec 64))

(declare-fun b!1449994 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98383 (_ BitVec 32)) SeekEntryResult!11625)

(assert (=> b!1449994 (= e!816669 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636092 lt!636091 mask!2687) (seekEntryOrOpen!0 lt!636092 lt!636091 mask!2687)))))

(declare-fun b!1449995 () Bool)

(assert (=> b!1449995 (= e!816665 e!816663)))

(declare-fun res!980685 () Bool)

(assert (=> b!1449995 (=> (not res!980685) (not e!816663))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1449995 (= res!980685 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47476 a!2862) j!93) mask!2687) (select (arr!47476 a!2862) j!93) a!2862 mask!2687) lt!636088))))

(assert (=> b!1449995 (= lt!636088 (Intermediate!11625 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1449996 () Bool)

(assert (=> b!1449996 (= e!816663 e!816666)))

(declare-fun res!980692 () Bool)

(assert (=> b!1449996 (=> (not res!980692) (not e!816666))))

(declare-fun lt!636089 () SeekEntryResult!11625)

(assert (=> b!1449996 (= res!980692 (= lt!636089 (Intermediate!11625 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1449996 (= lt!636089 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636092 mask!2687) lt!636092 lt!636091 mask!2687))))

(assert (=> b!1449996 (= lt!636092 (select (store (arr!47476 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1449997 () Bool)

(assert (=> b!1449997 (= e!816670 true)))

(declare-fun lt!636093 () SeekEntryResult!11625)

(assert (=> b!1449997 (= lt!636093 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47476 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1449998 () Bool)

(assert (=> b!1449998 (= e!816669 (= lt!636089 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636092 lt!636091 mask!2687)))))

(declare-fun b!1449999 () Bool)

(declare-fun res!980687 () Bool)

(assert (=> b!1449999 (=> (not res!980687) (not e!816672))))

(assert (=> b!1449999 (= res!980687 (and (= (size!48027 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48027 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48027 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1450000 () Bool)

(assert (=> b!1450000 (= e!816667 e!816668)))

(declare-fun res!980689 () Bool)

(assert (=> b!1450000 (=> (not res!980689) (not e!816668))))

(assert (=> b!1450000 (= res!980689 (= lt!636094 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47476 a!2862) j!93) a!2862 mask!2687)))))

(assert (= (and start!125040 res!980681) b!1449999))

(assert (= (and b!1449999 res!980687) b!1449985))

(assert (= (and b!1449985 res!980690) b!1449986))

(assert (= (and b!1449986 res!980695) b!1449984))

(assert (= (and b!1449984 res!980682) b!1449989))

(assert (= (and b!1449989 res!980680) b!1449992))

(assert (= (and b!1449992 res!980694) b!1449991))

(assert (= (and b!1449991 res!980691) b!1449995))

(assert (= (and b!1449995 res!980685) b!1449988))

(assert (= (and b!1449988 res!980684) b!1449996))

(assert (= (and b!1449996 res!980692) b!1449990))

(assert (= (and b!1449990 c!134170) b!1449998))

(assert (= (and b!1449990 (not c!134170)) b!1449994))

(assert (= (and b!1449990 res!980686) b!1449983))

(assert (= (and b!1449983 res!980688) b!1449982))

(assert (= (and b!1449982 res!980693) b!1449987))

(assert (= (and b!1449987 (not res!980696)) b!1450000))

(assert (= (and b!1450000 res!980689) b!1449993))

(assert (= (and b!1449982 (not res!980683)) b!1449997))

(declare-fun m!1338847 () Bool)

(assert (=> b!1449987 m!1338847))

(declare-fun m!1338849 () Bool)

(assert (=> b!1449987 m!1338849))

(declare-fun m!1338851 () Bool)

(assert (=> b!1449987 m!1338851))

(declare-fun m!1338853 () Bool)

(assert (=> b!1449987 m!1338853))

(declare-fun m!1338855 () Bool)

(assert (=> b!1449984 m!1338855))

(assert (=> b!1449995 m!1338853))

(assert (=> b!1449995 m!1338853))

(declare-fun m!1338857 () Bool)

(assert (=> b!1449995 m!1338857))

(assert (=> b!1449995 m!1338857))

(assert (=> b!1449995 m!1338853))

(declare-fun m!1338859 () Bool)

(assert (=> b!1449995 m!1338859))

(declare-fun m!1338861 () Bool)

(assert (=> b!1449996 m!1338861))

(assert (=> b!1449996 m!1338861))

(declare-fun m!1338863 () Bool)

(assert (=> b!1449996 m!1338863))

(assert (=> b!1449996 m!1338849))

(declare-fun m!1338865 () Bool)

(assert (=> b!1449996 m!1338865))

(declare-fun m!1338867 () Bool)

(assert (=> b!1449985 m!1338867))

(assert (=> b!1449985 m!1338867))

(declare-fun m!1338869 () Bool)

(assert (=> b!1449985 m!1338869))

(assert (=> b!1449991 m!1338849))

(declare-fun m!1338871 () Bool)

(assert (=> b!1449991 m!1338871))

(assert (=> b!1450000 m!1338853))

(assert (=> b!1450000 m!1338853))

(declare-fun m!1338873 () Bool)

(assert (=> b!1450000 m!1338873))

(declare-fun m!1338875 () Bool)

(assert (=> start!125040 m!1338875))

(declare-fun m!1338877 () Bool)

(assert (=> start!125040 m!1338877))

(assert (=> b!1449986 m!1338853))

(assert (=> b!1449986 m!1338853))

(declare-fun m!1338879 () Bool)

(assert (=> b!1449986 m!1338879))

(declare-fun m!1338881 () Bool)

(assert (=> b!1449994 m!1338881))

(declare-fun m!1338883 () Bool)

(assert (=> b!1449994 m!1338883))

(assert (=> b!1449997 m!1338853))

(assert (=> b!1449997 m!1338853))

(declare-fun m!1338885 () Bool)

(assert (=> b!1449997 m!1338885))

(declare-fun m!1338887 () Bool)

(assert (=> b!1449998 m!1338887))

(declare-fun m!1338889 () Bool)

(assert (=> b!1449982 m!1338889))

(assert (=> b!1449982 m!1338849))

(declare-fun m!1338891 () Bool)

(assert (=> b!1449982 m!1338891))

(assert (=> b!1449982 m!1338851))

(assert (=> b!1449982 m!1338847))

(assert (=> b!1449982 m!1338853))

(declare-fun m!1338893 () Bool)

(assert (=> b!1449982 m!1338893))

(declare-fun m!1338895 () Bool)

(assert (=> b!1449982 m!1338895))

(assert (=> b!1449982 m!1338853))

(declare-fun m!1338897 () Bool)

(assert (=> b!1449989 m!1338897))

(assert (=> b!1449988 m!1338853))

(assert (=> b!1449988 m!1338853))

(declare-fun m!1338899 () Bool)

(assert (=> b!1449988 m!1338899))

(check-sat (not b!1449995) (not b!1449982) (not b!1449988) (not b!1449985) (not b!1449986) (not b!1450000) (not b!1449989) (not b!1449994) (not b!1449996) (not start!125040) (not b!1449997) (not b!1449998) (not b!1449984))
(check-sat)

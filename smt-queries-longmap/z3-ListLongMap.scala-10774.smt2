; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126144 () Bool)

(assert start!126144)

(declare-fun b!1476868 () Bool)

(declare-fun res!1003058 () Bool)

(declare-fun e!828559 () Bool)

(assert (=> b!1476868 (=> (not res!1003058) (not e!828559))))

(declare-datatypes ((array!99250 0))(
  ( (array!99251 (arr!47904 (Array (_ BitVec 32) (_ BitVec 64))) (size!48454 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99250)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1476868 (= res!1003058 (validKeyInArray!0 (select (arr!47904 a!2862) j!93)))))

(declare-fun res!1003070 () Bool)

(assert (=> start!126144 (=> (not res!1003070) (not e!828559))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126144 (= res!1003070 (validMask!0 mask!2687))))

(assert (=> start!126144 e!828559))

(assert (=> start!126144 true))

(declare-fun array_inv!36932 (array!99250) Bool)

(assert (=> start!126144 (array_inv!36932 a!2862)))

(declare-fun b!1476869 () Bool)

(declare-fun e!828562 () Bool)

(declare-fun e!828564 () Bool)

(assert (=> b!1476869 (= e!828562 e!828564)))

(declare-fun res!1003057 () Bool)

(assert (=> b!1476869 (=> (not res!1003057) (not e!828564))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12144 0))(
  ( (MissingZero!12144 (index!50968 (_ BitVec 32))) (Found!12144 (index!50969 (_ BitVec 32))) (Intermediate!12144 (undefined!12956 Bool) (index!50970 (_ BitVec 32)) (x!132567 (_ BitVec 32))) (Undefined!12144) (MissingVacant!12144 (index!50971 (_ BitVec 32))) )
))
(declare-fun lt!645160 () SeekEntryResult!12144)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99250 (_ BitVec 32)) SeekEntryResult!12144)

(assert (=> b!1476869 (= res!1003057 (= lt!645160 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47904 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1476870 () Bool)

(declare-fun lt!645158 () (_ BitVec 64))

(declare-fun e!828561 () Bool)

(declare-fun lt!645162 () array!99250)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99250 (_ BitVec 32)) SeekEntryResult!12144)

(assert (=> b!1476870 (= e!828561 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645158 lt!645162 mask!2687) (seekEntryOrOpen!0 lt!645158 lt!645162 mask!2687)))))

(declare-fun b!1476871 () Bool)

(declare-fun e!828563 () Bool)

(assert (=> b!1476871 (= e!828559 e!828563)))

(declare-fun res!1003072 () Bool)

(assert (=> b!1476871 (=> (not res!1003072) (not e!828563))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1476871 (= res!1003072 (= (select (store (arr!47904 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1476871 (= lt!645162 (array!99251 (store (arr!47904 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48454 a!2862)))))

(declare-fun b!1476872 () Bool)

(declare-fun res!1003066 () Bool)

(assert (=> b!1476872 (=> (not res!1003066) (not e!828559))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1476872 (= res!1003066 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48454 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48454 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48454 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1476873 () Bool)

(declare-fun res!1003062 () Bool)

(assert (=> b!1476873 (=> (not res!1003062) (not e!828559))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99250 (_ BitVec 32)) Bool)

(assert (=> b!1476873 (= res!1003062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1476874 () Bool)

(declare-fun e!828566 () Bool)

(assert (=> b!1476874 (= e!828566 (not true))))

(declare-fun e!828558 () Bool)

(assert (=> b!1476874 e!828558))

(declare-fun res!1003067 () Bool)

(assert (=> b!1476874 (=> (not res!1003067) (not e!828558))))

(assert (=> b!1476874 (= res!1003067 (and (= lt!645160 (Found!12144 j!93)) (or (= (select (arr!47904 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47904 a!2862) intermediateBeforeIndex!19) (select (arr!47904 a!2862) j!93)))))))

(assert (=> b!1476874 (= lt!645160 (seekEntryOrOpen!0 (select (arr!47904 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1476874 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49628 0))(
  ( (Unit!49629) )
))
(declare-fun lt!645161 () Unit!49628)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99250 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49628)

(assert (=> b!1476874 (= lt!645161 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1476875 () Bool)

(declare-fun res!1003063 () Bool)

(assert (=> b!1476875 (=> (not res!1003063) (not e!828559))))

(assert (=> b!1476875 (= res!1003063 (validKeyInArray!0 (select (arr!47904 a!2862) i!1006)))))

(declare-fun b!1476876 () Bool)

(declare-fun res!1003060 () Bool)

(assert (=> b!1476876 (=> (not res!1003060) (not e!828559))))

(assert (=> b!1476876 (= res!1003060 (and (= (size!48454 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48454 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48454 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1476877 () Bool)

(declare-fun e!828560 () Bool)

(assert (=> b!1476877 (= e!828560 e!828566)))

(declare-fun res!1003065 () Bool)

(assert (=> b!1476877 (=> (not res!1003065) (not e!828566))))

(declare-fun lt!645157 () SeekEntryResult!12144)

(assert (=> b!1476877 (= res!1003065 (= lt!645157 (Intermediate!12144 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99250 (_ BitVec 32)) SeekEntryResult!12144)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1476877 (= lt!645157 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645158 mask!2687) lt!645158 lt!645162 mask!2687))))

(assert (=> b!1476877 (= lt!645158 (select (store (arr!47904 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1476878 () Bool)

(declare-fun res!1003061 () Bool)

(assert (=> b!1476878 (=> (not res!1003061) (not e!828566))))

(assert (=> b!1476878 (= res!1003061 e!828561)))

(declare-fun c!136425 () Bool)

(assert (=> b!1476878 (= c!136425 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1476879 () Bool)

(declare-fun res!1003069 () Bool)

(assert (=> b!1476879 (=> (not res!1003069) (not e!828566))))

(assert (=> b!1476879 (= res!1003069 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1476880 () Bool)

(assert (=> b!1476880 (= e!828561 (= lt!645157 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645158 lt!645162 mask!2687)))))

(declare-fun b!1476881 () Bool)

(assert (=> b!1476881 (= e!828563 e!828560)))

(declare-fun res!1003059 () Bool)

(assert (=> b!1476881 (=> (not res!1003059) (not e!828560))))

(declare-fun lt!645159 () SeekEntryResult!12144)

(assert (=> b!1476881 (= res!1003059 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47904 a!2862) j!93) mask!2687) (select (arr!47904 a!2862) j!93) a!2862 mask!2687) lt!645159))))

(assert (=> b!1476881 (= lt!645159 (Intermediate!12144 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1476882 () Bool)

(declare-fun res!1003064 () Bool)

(assert (=> b!1476882 (=> (not res!1003064) (not e!828560))))

(assert (=> b!1476882 (= res!1003064 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47904 a!2862) j!93) a!2862 mask!2687) lt!645159))))

(declare-fun b!1476883 () Bool)

(declare-fun res!1003068 () Bool)

(assert (=> b!1476883 (=> (not res!1003068) (not e!828559))))

(declare-datatypes ((List!34405 0))(
  ( (Nil!34402) (Cons!34401 (h!35769 (_ BitVec 64)) (t!49099 List!34405)) )
))
(declare-fun arrayNoDuplicates!0 (array!99250 (_ BitVec 32) List!34405) Bool)

(assert (=> b!1476883 (= res!1003068 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34402))))

(declare-fun b!1476884 () Bool)

(assert (=> b!1476884 (= e!828564 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1476885 () Bool)

(assert (=> b!1476885 (= e!828558 e!828562)))

(declare-fun res!1003071 () Bool)

(assert (=> b!1476885 (=> res!1003071 e!828562)))

(assert (=> b!1476885 (= res!1003071 (or (and (= (select (arr!47904 a!2862) index!646) (select (store (arr!47904 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47904 a!2862) index!646) (select (arr!47904 a!2862) j!93))) (not (= (select (arr!47904 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!126144 res!1003070) b!1476876))

(assert (= (and b!1476876 res!1003060) b!1476875))

(assert (= (and b!1476875 res!1003063) b!1476868))

(assert (= (and b!1476868 res!1003058) b!1476873))

(assert (= (and b!1476873 res!1003062) b!1476883))

(assert (= (and b!1476883 res!1003068) b!1476872))

(assert (= (and b!1476872 res!1003066) b!1476871))

(assert (= (and b!1476871 res!1003072) b!1476881))

(assert (= (and b!1476881 res!1003059) b!1476882))

(assert (= (and b!1476882 res!1003064) b!1476877))

(assert (= (and b!1476877 res!1003065) b!1476878))

(assert (= (and b!1476878 c!136425) b!1476880))

(assert (= (and b!1476878 (not c!136425)) b!1476870))

(assert (= (and b!1476878 res!1003061) b!1476879))

(assert (= (and b!1476879 res!1003069) b!1476874))

(assert (= (and b!1476874 res!1003067) b!1476885))

(assert (= (and b!1476885 (not res!1003071)) b!1476869))

(assert (= (and b!1476869 res!1003057) b!1476884))

(declare-fun m!1362839 () Bool)

(assert (=> b!1476882 m!1362839))

(assert (=> b!1476882 m!1362839))

(declare-fun m!1362841 () Bool)

(assert (=> b!1476882 m!1362841))

(declare-fun m!1362843 () Bool)

(assert (=> b!1476885 m!1362843))

(declare-fun m!1362845 () Bool)

(assert (=> b!1476885 m!1362845))

(declare-fun m!1362847 () Bool)

(assert (=> b!1476885 m!1362847))

(assert (=> b!1476885 m!1362839))

(declare-fun m!1362849 () Bool)

(assert (=> b!1476880 m!1362849))

(declare-fun m!1362851 () Bool)

(assert (=> start!126144 m!1362851))

(declare-fun m!1362853 () Bool)

(assert (=> start!126144 m!1362853))

(declare-fun m!1362855 () Bool)

(assert (=> b!1476875 m!1362855))

(assert (=> b!1476875 m!1362855))

(declare-fun m!1362857 () Bool)

(assert (=> b!1476875 m!1362857))

(assert (=> b!1476868 m!1362839))

(assert (=> b!1476868 m!1362839))

(declare-fun m!1362859 () Bool)

(assert (=> b!1476868 m!1362859))

(assert (=> b!1476869 m!1362839))

(assert (=> b!1476869 m!1362839))

(declare-fun m!1362861 () Bool)

(assert (=> b!1476869 m!1362861))

(declare-fun m!1362863 () Bool)

(assert (=> b!1476873 m!1362863))

(declare-fun m!1362865 () Bool)

(assert (=> b!1476883 m!1362865))

(assert (=> b!1476871 m!1362845))

(declare-fun m!1362867 () Bool)

(assert (=> b!1476871 m!1362867))

(declare-fun m!1362869 () Bool)

(assert (=> b!1476870 m!1362869))

(declare-fun m!1362871 () Bool)

(assert (=> b!1476870 m!1362871))

(assert (=> b!1476881 m!1362839))

(assert (=> b!1476881 m!1362839))

(declare-fun m!1362873 () Bool)

(assert (=> b!1476881 m!1362873))

(assert (=> b!1476881 m!1362873))

(assert (=> b!1476881 m!1362839))

(declare-fun m!1362875 () Bool)

(assert (=> b!1476881 m!1362875))

(declare-fun m!1362877 () Bool)

(assert (=> b!1476877 m!1362877))

(assert (=> b!1476877 m!1362877))

(declare-fun m!1362879 () Bool)

(assert (=> b!1476877 m!1362879))

(assert (=> b!1476877 m!1362845))

(declare-fun m!1362881 () Bool)

(assert (=> b!1476877 m!1362881))

(declare-fun m!1362883 () Bool)

(assert (=> b!1476874 m!1362883))

(declare-fun m!1362885 () Bool)

(assert (=> b!1476874 m!1362885))

(assert (=> b!1476874 m!1362839))

(declare-fun m!1362887 () Bool)

(assert (=> b!1476874 m!1362887))

(declare-fun m!1362889 () Bool)

(assert (=> b!1476874 m!1362889))

(assert (=> b!1476874 m!1362839))

(check-sat (not b!1476868) (not b!1476880) (not b!1476873) (not b!1476869) (not b!1476882) (not b!1476877) (not b!1476875) (not b!1476881) (not b!1476883) (not start!126144) (not b!1476870) (not b!1476874))
(check-sat)

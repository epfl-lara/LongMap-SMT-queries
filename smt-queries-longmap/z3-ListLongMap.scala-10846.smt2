; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126924 () Bool)

(assert start!126924)

(declare-fun b!1491760 () Bool)

(declare-fun res!1014894 () Bool)

(declare-fun e!835772 () Bool)

(assert (=> b!1491760 (=> (not res!1014894) (not e!835772))))

(declare-fun e!835773 () Bool)

(assert (=> b!1491760 (= res!1014894 e!835773)))

(declare-fun c!137961 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1491760 (= c!137961 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1491761 () Bool)

(declare-fun e!835775 () Bool)

(declare-fun e!835768 () Bool)

(assert (=> b!1491761 (= e!835775 e!835768)))

(declare-fun res!1014900 () Bool)

(assert (=> b!1491761 (=> (not res!1014900) (not e!835768))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99697 0))(
  ( (array!99698 (arr!48120 (Array (_ BitVec 32) (_ BitVec 64))) (size!48670 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99697)

(assert (=> b!1491761 (= res!1014900 (= (select (store (arr!48120 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!650387 () array!99697)

(assert (=> b!1491761 (= lt!650387 (array!99698 (store (arr!48120 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48670 a!2862)))))

(declare-fun res!1014907 () Bool)

(assert (=> start!126924 (=> (not res!1014907) (not e!835775))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126924 (= res!1014907 (validMask!0 mask!2687))))

(assert (=> start!126924 e!835775))

(assert (=> start!126924 true))

(declare-fun array_inv!37148 (array!99697) Bool)

(assert (=> start!126924 (array_inv!37148 a!2862)))

(declare-fun b!1491762 () Bool)

(declare-fun res!1014898 () Bool)

(assert (=> b!1491762 (=> (not res!1014898) (not e!835775))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1491762 (= res!1014898 (validKeyInArray!0 (select (arr!48120 a!2862) i!1006)))))

(declare-fun b!1491763 () Bool)

(declare-fun e!835769 () Bool)

(assert (=> b!1491763 (= e!835772 (not e!835769))))

(declare-fun res!1014896 () Bool)

(assert (=> b!1491763 (=> res!1014896 e!835769)))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1491763 (= res!1014896 (or (and (= (select (arr!48120 a!2862) index!646) (select (store (arr!48120 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48120 a!2862) index!646) (select (arr!48120 a!2862) j!93))) (= (select (arr!48120 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!835771 () Bool)

(assert (=> b!1491763 e!835771))

(declare-fun res!1014902 () Bool)

(assert (=> b!1491763 (=> (not res!1014902) (not e!835771))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99697 (_ BitVec 32)) Bool)

(assert (=> b!1491763 (= res!1014902 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50060 0))(
  ( (Unit!50061) )
))
(declare-fun lt!650383 () Unit!50060)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99697 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50060)

(assert (=> b!1491763 (= lt!650383 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1491764 () Bool)

(declare-fun res!1014906 () Bool)

(assert (=> b!1491764 (=> (not res!1014906) (not e!835772))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1491764 (= res!1014906 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1491765 () Bool)

(declare-fun res!1014897 () Bool)

(assert (=> b!1491765 (=> (not res!1014897) (not e!835775))))

(declare-datatypes ((List!34621 0))(
  ( (Nil!34618) (Cons!34617 (h!36000 (_ BitVec 64)) (t!49315 List!34621)) )
))
(declare-fun arrayNoDuplicates!0 (array!99697 (_ BitVec 32) List!34621) Bool)

(assert (=> b!1491765 (= res!1014897 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34618))))

(declare-fun b!1491766 () Bool)

(declare-fun e!835774 () Bool)

(assert (=> b!1491766 (= e!835774 e!835772)))

(declare-fun res!1014905 () Bool)

(assert (=> b!1491766 (=> (not res!1014905) (not e!835772))))

(declare-datatypes ((SeekEntryResult!12360 0))(
  ( (MissingZero!12360 (index!51832 (_ BitVec 32))) (Found!12360 (index!51833 (_ BitVec 32))) (Intermediate!12360 (undefined!13172 Bool) (index!51834 (_ BitVec 32)) (x!133416 (_ BitVec 32))) (Undefined!12360) (MissingVacant!12360 (index!51835 (_ BitVec 32))) )
))
(declare-fun lt!650385 () SeekEntryResult!12360)

(assert (=> b!1491766 (= res!1014905 (= lt!650385 (Intermediate!12360 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!650386 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99697 (_ BitVec 32)) SeekEntryResult!12360)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491766 (= lt!650385 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650386 mask!2687) lt!650386 lt!650387 mask!2687))))

(assert (=> b!1491766 (= lt!650386 (select (store (arr!48120 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1491767 () Bool)

(declare-fun res!1014895 () Bool)

(assert (=> b!1491767 (=> (not res!1014895) (not e!835775))))

(assert (=> b!1491767 (= res!1014895 (and (= (size!48670 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48670 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48670 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1491768 () Bool)

(declare-fun res!1014903 () Bool)

(assert (=> b!1491768 (=> (not res!1014903) (not e!835775))))

(assert (=> b!1491768 (= res!1014903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1491769 () Bool)

(assert (=> b!1491769 (= e!835769 true)))

(declare-fun lt!650388 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491769 (= lt!650388 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1491770 () Bool)

(assert (=> b!1491770 (= e!835768 e!835774)))

(declare-fun res!1014901 () Bool)

(assert (=> b!1491770 (=> (not res!1014901) (not e!835774))))

(declare-fun lt!650384 () SeekEntryResult!12360)

(assert (=> b!1491770 (= res!1014901 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48120 a!2862) j!93) mask!2687) (select (arr!48120 a!2862) j!93) a!2862 mask!2687) lt!650384))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1491770 (= lt!650384 (Intermediate!12360 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1491771 () Bool)

(declare-fun res!1014904 () Bool)

(assert (=> b!1491771 (=> (not res!1014904) (not e!835771))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99697 (_ BitVec 32)) SeekEntryResult!12360)

(assert (=> b!1491771 (= res!1014904 (= (seekEntryOrOpen!0 (select (arr!48120 a!2862) j!93) a!2862 mask!2687) (Found!12360 j!93)))))

(declare-fun b!1491772 () Bool)

(assert (=> b!1491772 (= e!835771 (or (= (select (arr!48120 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48120 a!2862) intermediateBeforeIndex!19) (select (arr!48120 a!2862) j!93))))))

(declare-fun b!1491773 () Bool)

(declare-fun res!1014893 () Bool)

(assert (=> b!1491773 (=> (not res!1014893) (not e!835774))))

(assert (=> b!1491773 (= res!1014893 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48120 a!2862) j!93) a!2862 mask!2687) lt!650384))))

(declare-fun b!1491774 () Bool)

(declare-fun res!1014892 () Bool)

(assert (=> b!1491774 (=> (not res!1014892) (not e!835775))))

(assert (=> b!1491774 (= res!1014892 (validKeyInArray!0 (select (arr!48120 a!2862) j!93)))))

(declare-fun b!1491775 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99697 (_ BitVec 32)) SeekEntryResult!12360)

(assert (=> b!1491775 (= e!835773 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650386 lt!650387 mask!2687) (seekEntryOrOpen!0 lt!650386 lt!650387 mask!2687)))))

(declare-fun b!1491776 () Bool)

(declare-fun res!1014899 () Bool)

(assert (=> b!1491776 (=> (not res!1014899) (not e!835775))))

(assert (=> b!1491776 (= res!1014899 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48670 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48670 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48670 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1491777 () Bool)

(assert (=> b!1491777 (= e!835773 (= lt!650385 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650386 lt!650387 mask!2687)))))

(assert (= (and start!126924 res!1014907) b!1491767))

(assert (= (and b!1491767 res!1014895) b!1491762))

(assert (= (and b!1491762 res!1014898) b!1491774))

(assert (= (and b!1491774 res!1014892) b!1491768))

(assert (= (and b!1491768 res!1014903) b!1491765))

(assert (= (and b!1491765 res!1014897) b!1491776))

(assert (= (and b!1491776 res!1014899) b!1491761))

(assert (= (and b!1491761 res!1014900) b!1491770))

(assert (= (and b!1491770 res!1014901) b!1491773))

(assert (= (and b!1491773 res!1014893) b!1491766))

(assert (= (and b!1491766 res!1014905) b!1491760))

(assert (= (and b!1491760 c!137961) b!1491777))

(assert (= (and b!1491760 (not c!137961)) b!1491775))

(assert (= (and b!1491760 res!1014894) b!1491764))

(assert (= (and b!1491764 res!1014906) b!1491763))

(assert (= (and b!1491763 res!1014902) b!1491771))

(assert (= (and b!1491771 res!1014904) b!1491772))

(assert (= (and b!1491763 (not res!1014896)) b!1491769))

(declare-fun m!1375871 () Bool)

(assert (=> b!1491777 m!1375871))

(declare-fun m!1375873 () Bool)

(assert (=> b!1491762 m!1375873))

(assert (=> b!1491762 m!1375873))

(declare-fun m!1375875 () Bool)

(assert (=> b!1491762 m!1375875))

(declare-fun m!1375877 () Bool)

(assert (=> b!1491773 m!1375877))

(assert (=> b!1491773 m!1375877))

(declare-fun m!1375879 () Bool)

(assert (=> b!1491773 m!1375879))

(assert (=> b!1491770 m!1375877))

(assert (=> b!1491770 m!1375877))

(declare-fun m!1375881 () Bool)

(assert (=> b!1491770 m!1375881))

(assert (=> b!1491770 m!1375881))

(assert (=> b!1491770 m!1375877))

(declare-fun m!1375883 () Bool)

(assert (=> b!1491770 m!1375883))

(declare-fun m!1375885 () Bool)

(assert (=> b!1491768 m!1375885))

(declare-fun m!1375887 () Bool)

(assert (=> b!1491761 m!1375887))

(declare-fun m!1375889 () Bool)

(assert (=> b!1491761 m!1375889))

(declare-fun m!1375891 () Bool)

(assert (=> b!1491766 m!1375891))

(assert (=> b!1491766 m!1375891))

(declare-fun m!1375893 () Bool)

(assert (=> b!1491766 m!1375893))

(assert (=> b!1491766 m!1375887))

(declare-fun m!1375895 () Bool)

(assert (=> b!1491766 m!1375895))

(declare-fun m!1375897 () Bool)

(assert (=> b!1491769 m!1375897))

(declare-fun m!1375899 () Bool)

(assert (=> b!1491765 m!1375899))

(assert (=> b!1491771 m!1375877))

(assert (=> b!1491771 m!1375877))

(declare-fun m!1375901 () Bool)

(assert (=> b!1491771 m!1375901))

(declare-fun m!1375903 () Bool)

(assert (=> b!1491763 m!1375903))

(assert (=> b!1491763 m!1375887))

(declare-fun m!1375905 () Bool)

(assert (=> b!1491763 m!1375905))

(declare-fun m!1375907 () Bool)

(assert (=> b!1491763 m!1375907))

(declare-fun m!1375909 () Bool)

(assert (=> b!1491763 m!1375909))

(assert (=> b!1491763 m!1375877))

(declare-fun m!1375911 () Bool)

(assert (=> b!1491775 m!1375911))

(declare-fun m!1375913 () Bool)

(assert (=> b!1491775 m!1375913))

(declare-fun m!1375915 () Bool)

(assert (=> b!1491772 m!1375915))

(assert (=> b!1491772 m!1375877))

(declare-fun m!1375917 () Bool)

(assert (=> start!126924 m!1375917))

(declare-fun m!1375919 () Bool)

(assert (=> start!126924 m!1375919))

(assert (=> b!1491774 m!1375877))

(assert (=> b!1491774 m!1375877))

(declare-fun m!1375921 () Bool)

(assert (=> b!1491774 m!1375921))

(check-sat (not start!126924) (not b!1491770) (not b!1491763) (not b!1491765) (not b!1491774) (not b!1491777) (not b!1491775) (not b!1491762) (not b!1491766) (not b!1491771) (not b!1491769) (not b!1491768) (not b!1491773))
(check-sat)

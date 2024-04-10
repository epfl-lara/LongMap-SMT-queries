; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125602 () Bool)

(assert start!125602)

(declare-fun b!1469887 () Bool)

(declare-fun e!825152 () Bool)

(declare-fun e!825153 () Bool)

(assert (=> b!1469887 (= e!825152 e!825153)))

(declare-fun res!998324 () Bool)

(assert (=> b!1469887 (=> (not res!998324) (not e!825153))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99050 0))(
  ( (array!99051 (arr!47813 (Array (_ BitVec 32) (_ BitVec 64))) (size!48363 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99050)

(assert (=> b!1469887 (= res!998324 (= (select (store (arr!47813 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!642711 () array!99050)

(assert (=> b!1469887 (= lt!642711 (array!99051 (store (arr!47813 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48363 a!2862)))))

(declare-fun b!1469888 () Bool)

(declare-fun res!998321 () Bool)

(declare-fun e!825155 () Bool)

(assert (=> b!1469888 (=> (not res!998321) (not e!825155))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12053 0))(
  ( (MissingZero!12053 (index!50604 (_ BitVec 32))) (Found!12053 (index!50605 (_ BitVec 32))) (Intermediate!12053 (undefined!12865 Bool) (index!50606 (_ BitVec 32)) (x!132182 (_ BitVec 32))) (Undefined!12053) (MissingVacant!12053 (index!50607 (_ BitVec 32))) )
))
(declare-fun lt!642707 () SeekEntryResult!12053)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99050 (_ BitVec 32)) SeekEntryResult!12053)

(assert (=> b!1469888 (= res!998321 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47813 a!2862) j!93) a!2862 mask!2687) lt!642707))))

(declare-fun res!998316 () Bool)

(assert (=> start!125602 (=> (not res!998316) (not e!825152))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125602 (= res!998316 (validMask!0 mask!2687))))

(assert (=> start!125602 e!825152))

(assert (=> start!125602 true))

(declare-fun array_inv!36841 (array!99050) Bool)

(assert (=> start!125602 (array_inv!36841 a!2862)))

(declare-fun b!1469889 () Bool)

(declare-fun res!998319 () Bool)

(assert (=> b!1469889 (=> (not res!998319) (not e!825152))))

(assert (=> b!1469889 (= res!998319 (and (= (size!48363 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48363 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48363 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1469890 () Bool)

(declare-fun res!998320 () Bool)

(declare-fun e!825151 () Bool)

(assert (=> b!1469890 (=> (not res!998320) (not e!825151))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1469890 (= res!998320 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1469891 () Bool)

(declare-fun res!998326 () Bool)

(assert (=> b!1469891 (=> (not res!998326) (not e!825152))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1469891 (= res!998326 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48363 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48363 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48363 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1469892 () Bool)

(assert (=> b!1469892 (= e!825155 e!825151)))

(declare-fun res!998315 () Bool)

(assert (=> b!1469892 (=> (not res!998315) (not e!825151))))

(declare-fun lt!642710 () SeekEntryResult!12053)

(assert (=> b!1469892 (= res!998315 (= lt!642710 (Intermediate!12053 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!642709 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1469892 (= lt!642710 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642709 mask!2687) lt!642709 lt!642711 mask!2687))))

(assert (=> b!1469892 (= lt!642709 (select (store (arr!47813 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1469893 () Bool)

(declare-fun res!998318 () Bool)

(assert (=> b!1469893 (=> (not res!998318) (not e!825152))))

(declare-datatypes ((List!34314 0))(
  ( (Nil!34311) (Cons!34310 (h!35660 (_ BitVec 64)) (t!49008 List!34314)) )
))
(declare-fun arrayNoDuplicates!0 (array!99050 (_ BitVec 32) List!34314) Bool)

(assert (=> b!1469893 (= res!998318 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34311))))

(declare-fun b!1469894 () Bool)

(assert (=> b!1469894 (= e!825153 e!825155)))

(declare-fun res!998322 () Bool)

(assert (=> b!1469894 (=> (not res!998322) (not e!825155))))

(assert (=> b!1469894 (= res!998322 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47813 a!2862) j!93) mask!2687) (select (arr!47813 a!2862) j!93) a!2862 mask!2687) lt!642707))))

(assert (=> b!1469894 (= lt!642707 (Intermediate!12053 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1469895 () Bool)

(assert (=> b!1469895 (= e!825151 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99050 (_ BitVec 32)) Bool)

(assert (=> b!1469895 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49446 0))(
  ( (Unit!49447) )
))
(declare-fun lt!642708 () Unit!49446)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99050 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49446)

(assert (=> b!1469895 (= lt!642708 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1469896 () Bool)

(declare-fun res!998317 () Bool)

(assert (=> b!1469896 (=> (not res!998317) (not e!825152))))

(assert (=> b!1469896 (= res!998317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun e!825154 () Bool)

(declare-fun b!1469897 () Bool)

(assert (=> b!1469897 (= e!825154 (= lt!642710 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642709 lt!642711 mask!2687)))))

(declare-fun b!1469898 () Bool)

(declare-fun res!998323 () Bool)

(assert (=> b!1469898 (=> (not res!998323) (not e!825151))))

(assert (=> b!1469898 (= res!998323 e!825154)))

(declare-fun c!135297 () Bool)

(assert (=> b!1469898 (= c!135297 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1469899 () Bool)

(declare-fun res!998314 () Bool)

(assert (=> b!1469899 (=> (not res!998314) (not e!825152))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469899 (= res!998314 (validKeyInArray!0 (select (arr!47813 a!2862) j!93)))))

(declare-fun b!1469900 () Bool)

(declare-fun res!998325 () Bool)

(assert (=> b!1469900 (=> (not res!998325) (not e!825152))))

(assert (=> b!1469900 (= res!998325 (validKeyInArray!0 (select (arr!47813 a!2862) i!1006)))))

(declare-fun b!1469901 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99050 (_ BitVec 32)) SeekEntryResult!12053)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99050 (_ BitVec 32)) SeekEntryResult!12053)

(assert (=> b!1469901 (= e!825154 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642709 lt!642711 mask!2687) (seekEntryOrOpen!0 lt!642709 lt!642711 mask!2687)))))

(assert (= (and start!125602 res!998316) b!1469889))

(assert (= (and b!1469889 res!998319) b!1469900))

(assert (= (and b!1469900 res!998325) b!1469899))

(assert (= (and b!1469899 res!998314) b!1469896))

(assert (= (and b!1469896 res!998317) b!1469893))

(assert (= (and b!1469893 res!998318) b!1469891))

(assert (= (and b!1469891 res!998326) b!1469887))

(assert (= (and b!1469887 res!998324) b!1469894))

(assert (= (and b!1469894 res!998322) b!1469888))

(assert (= (and b!1469888 res!998321) b!1469892))

(assert (= (and b!1469892 res!998315) b!1469898))

(assert (= (and b!1469898 c!135297) b!1469897))

(assert (= (and b!1469898 (not c!135297)) b!1469901))

(assert (= (and b!1469898 res!998323) b!1469890))

(assert (= (and b!1469890 res!998320) b!1469895))

(declare-fun m!1357033 () Bool)

(assert (=> b!1469901 m!1357033))

(declare-fun m!1357035 () Bool)

(assert (=> b!1469901 m!1357035))

(declare-fun m!1357037 () Bool)

(assert (=> b!1469893 m!1357037))

(declare-fun m!1357039 () Bool)

(assert (=> b!1469895 m!1357039))

(declare-fun m!1357041 () Bool)

(assert (=> b!1469895 m!1357041))

(declare-fun m!1357043 () Bool)

(assert (=> b!1469896 m!1357043))

(declare-fun m!1357045 () Bool)

(assert (=> b!1469899 m!1357045))

(assert (=> b!1469899 m!1357045))

(declare-fun m!1357047 () Bool)

(assert (=> b!1469899 m!1357047))

(declare-fun m!1357049 () Bool)

(assert (=> start!125602 m!1357049))

(declare-fun m!1357051 () Bool)

(assert (=> start!125602 m!1357051))

(declare-fun m!1357053 () Bool)

(assert (=> b!1469887 m!1357053))

(declare-fun m!1357055 () Bool)

(assert (=> b!1469887 m!1357055))

(assert (=> b!1469888 m!1357045))

(assert (=> b!1469888 m!1357045))

(declare-fun m!1357057 () Bool)

(assert (=> b!1469888 m!1357057))

(declare-fun m!1357059 () Bool)

(assert (=> b!1469892 m!1357059))

(assert (=> b!1469892 m!1357059))

(declare-fun m!1357061 () Bool)

(assert (=> b!1469892 m!1357061))

(assert (=> b!1469892 m!1357053))

(declare-fun m!1357063 () Bool)

(assert (=> b!1469892 m!1357063))

(declare-fun m!1357065 () Bool)

(assert (=> b!1469900 m!1357065))

(assert (=> b!1469900 m!1357065))

(declare-fun m!1357067 () Bool)

(assert (=> b!1469900 m!1357067))

(declare-fun m!1357069 () Bool)

(assert (=> b!1469897 m!1357069))

(assert (=> b!1469894 m!1357045))

(assert (=> b!1469894 m!1357045))

(declare-fun m!1357071 () Bool)

(assert (=> b!1469894 m!1357071))

(assert (=> b!1469894 m!1357071))

(assert (=> b!1469894 m!1357045))

(declare-fun m!1357073 () Bool)

(assert (=> b!1469894 m!1357073))

(push 1)


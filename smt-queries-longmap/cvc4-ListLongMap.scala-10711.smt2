; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125408 () Bool)

(assert start!125408)

(declare-fun b!1466937 () Bool)

(declare-fun res!995565 () Bool)

(declare-fun e!824060 () Bool)

(assert (=> b!1466937 (=> (not res!995565) (not e!824060))))

(declare-datatypes ((array!98856 0))(
  ( (array!98857 (arr!47716 (Array (_ BitVec 32) (_ BitVec 64))) (size!48266 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98856)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98856 (_ BitVec 32)) Bool)

(assert (=> b!1466937 (= res!995565 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1466938 () Bool)

(declare-fun e!824066 () Bool)

(declare-fun e!824061 () Bool)

(assert (=> b!1466938 (= e!824066 e!824061)))

(declare-fun res!995562 () Bool)

(assert (=> b!1466938 (=> (not res!995562) (not e!824061))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11968 0))(
  ( (MissingZero!11968 (index!50264 (_ BitVec 32))) (Found!11968 (index!50265 (_ BitVec 32))) (Intermediate!11968 (undefined!12780 Bool) (index!50266 (_ BitVec 32)) (x!131833 (_ BitVec 32))) (Undefined!11968) (MissingVacant!11968 (index!50267 (_ BitVec 32))) )
))
(declare-fun lt!641939 () SeekEntryResult!11968)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1466938 (= res!995562 (= lt!641939 (Intermediate!11968 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!641934 () (_ BitVec 64))

(declare-fun lt!641940 () array!98856)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98856 (_ BitVec 32)) SeekEntryResult!11968)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466938 (= lt!641939 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641934 mask!2687) lt!641934 lt!641940 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1466938 (= lt!641934 (select (store (arr!47716 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1466939 () Bool)

(declare-fun res!995569 () Bool)

(assert (=> b!1466939 (=> (not res!995569) (not e!824060))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1466939 (= res!995569 (validKeyInArray!0 (select (arr!47716 a!2862) i!1006)))))

(declare-fun b!1466940 () Bool)

(declare-fun e!824065 () Bool)

(assert (=> b!1466940 (= e!824060 e!824065)))

(declare-fun res!995561 () Bool)

(assert (=> b!1466940 (=> (not res!995561) (not e!824065))))

(assert (=> b!1466940 (= res!995561 (= (select (store (arr!47716 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1466940 (= lt!641940 (array!98857 (store (arr!47716 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48266 a!2862)))))

(declare-fun b!1466941 () Bool)

(declare-fun res!995554 () Bool)

(declare-fun e!824062 () Bool)

(assert (=> b!1466941 (=> res!995554 e!824062)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1466941 (= res!995554 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1466942 () Bool)

(declare-fun res!995552 () Bool)

(assert (=> b!1466942 (=> res!995552 e!824062)))

(declare-fun lt!641936 () SeekEntryResult!11968)

(declare-fun lt!641935 () (_ BitVec 32))

(assert (=> b!1466942 (= res!995552 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641935 (select (arr!47716 a!2862) j!93) a!2862 mask!2687) lt!641936)))))

(declare-fun b!1466943 () Bool)

(declare-fun e!824064 () Bool)

(assert (=> b!1466943 (= e!824064 (not (= lt!641939 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641935 lt!641934 lt!641940 mask!2687))))))

(declare-fun b!1466944 () Bool)

(declare-fun res!995566 () Bool)

(assert (=> b!1466944 (=> (not res!995566) (not e!824060))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1466944 (= res!995566 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48266 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48266 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48266 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1466945 () Bool)

(declare-fun res!995558 () Bool)

(assert (=> b!1466945 (=> (not res!995558) (not e!824060))))

(declare-datatypes ((List!34217 0))(
  ( (Nil!34214) (Cons!34213 (h!35563 (_ BitVec 64)) (t!48911 List!34217)) )
))
(declare-fun arrayNoDuplicates!0 (array!98856 (_ BitVec 32) List!34217) Bool)

(assert (=> b!1466945 (= res!995558 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34214))))

(declare-fun b!1466946 () Bool)

(declare-fun res!995557 () Bool)

(assert (=> b!1466946 (=> (not res!995557) (not e!824060))))

(assert (=> b!1466946 (= res!995557 (validKeyInArray!0 (select (arr!47716 a!2862) j!93)))))

(declare-fun b!1466947 () Bool)

(declare-fun res!995559 () Bool)

(assert (=> b!1466947 (=> (not res!995559) (not e!824061))))

(declare-fun e!824058 () Bool)

(assert (=> b!1466947 (= res!995559 e!824058)))

(declare-fun c!135203 () Bool)

(assert (=> b!1466947 (= c!135203 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1466948 () Bool)

(assert (=> b!1466948 (= e!824062 (bvsge mask!2687 #b00000000000000000000000000000000))))

(declare-fun lt!641937 () SeekEntryResult!11968)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98856 (_ BitVec 32)) SeekEntryResult!11968)

(assert (=> b!1466948 (= lt!641937 (seekEntryOrOpen!0 lt!641934 lt!641940 mask!2687))))

(declare-datatypes ((Unit!49432 0))(
  ( (Unit!49433) )
))
(declare-fun lt!641933 () Unit!49432)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98856 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49432)

(assert (=> b!1466948 (= lt!641933 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!641935 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1466949 () Bool)

(declare-fun e!824063 () Bool)

(assert (=> b!1466949 (= e!824063 e!824062)))

(declare-fun res!995567 () Bool)

(assert (=> b!1466949 (=> res!995567 e!824062)))

(assert (=> b!1466949 (= res!995567 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641935 #b00000000000000000000000000000000) (bvsge lt!641935 (size!48266 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466949 (= lt!641935 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1466951 () Bool)

(declare-fun res!995564 () Bool)

(assert (=> b!1466951 (=> (not res!995564) (not e!824061))))

(assert (=> b!1466951 (= res!995564 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1466952 () Bool)

(declare-fun res!995556 () Bool)

(assert (=> b!1466952 (=> (not res!995556) (not e!824066))))

(assert (=> b!1466952 (= res!995556 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47716 a!2862) j!93) a!2862 mask!2687) lt!641936))))

(declare-fun b!1466953 () Bool)

(assert (=> b!1466953 (= e!824065 e!824066)))

(declare-fun res!995555 () Bool)

(assert (=> b!1466953 (=> (not res!995555) (not e!824066))))

(assert (=> b!1466953 (= res!995555 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47716 a!2862) j!93) mask!2687) (select (arr!47716 a!2862) j!93) a!2862 mask!2687) lt!641936))))

(assert (=> b!1466953 (= lt!641936 (Intermediate!11968 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1466954 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98856 (_ BitVec 32)) SeekEntryResult!11968)

(assert (=> b!1466954 (= e!824064 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641935 intermediateAfterIndex!19 lt!641934 lt!641940 mask!2687) (seekEntryOrOpen!0 lt!641934 lt!641940 mask!2687))))))

(declare-fun b!1466955 () Bool)

(declare-fun res!995553 () Bool)

(assert (=> b!1466955 (=> (not res!995553) (not e!824060))))

(assert (=> b!1466955 (= res!995553 (and (= (size!48266 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48266 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48266 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1466956 () Bool)

(assert (=> b!1466956 (= e!824058 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641934 lt!641940 mask!2687) (seekEntryOrOpen!0 lt!641934 lt!641940 mask!2687)))))

(declare-fun b!1466957 () Bool)

(assert (=> b!1466957 (= e!824058 (= lt!641939 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641934 lt!641940 mask!2687)))))

(declare-fun b!1466958 () Bool)

(assert (=> b!1466958 (= e!824061 (not e!824063))))

(declare-fun res!995563 () Bool)

(assert (=> b!1466958 (=> res!995563 e!824063)))

(assert (=> b!1466958 (= res!995563 (or (and (= (select (arr!47716 a!2862) index!646) (select (store (arr!47716 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47716 a!2862) index!646) (select (arr!47716 a!2862) j!93))) (= (select (arr!47716 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1466958 (and (= lt!641937 (Found!11968 j!93)) (or (= (select (arr!47716 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47716 a!2862) intermediateBeforeIndex!19) (select (arr!47716 a!2862) j!93))))))

(assert (=> b!1466958 (= lt!641937 (seekEntryOrOpen!0 (select (arr!47716 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1466958 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!641938 () Unit!49432)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98856 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49432)

(assert (=> b!1466958 (= lt!641938 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!995560 () Bool)

(assert (=> start!125408 (=> (not res!995560) (not e!824060))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125408 (= res!995560 (validMask!0 mask!2687))))

(assert (=> start!125408 e!824060))

(assert (=> start!125408 true))

(declare-fun array_inv!36744 (array!98856) Bool)

(assert (=> start!125408 (array_inv!36744 a!2862)))

(declare-fun b!1466950 () Bool)

(declare-fun res!995568 () Bool)

(assert (=> b!1466950 (=> res!995568 e!824062)))

(assert (=> b!1466950 (= res!995568 e!824064)))

(declare-fun c!135204 () Bool)

(assert (=> b!1466950 (= c!135204 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(assert (= (and start!125408 res!995560) b!1466955))

(assert (= (and b!1466955 res!995553) b!1466939))

(assert (= (and b!1466939 res!995569) b!1466946))

(assert (= (and b!1466946 res!995557) b!1466937))

(assert (= (and b!1466937 res!995565) b!1466945))

(assert (= (and b!1466945 res!995558) b!1466944))

(assert (= (and b!1466944 res!995566) b!1466940))

(assert (= (and b!1466940 res!995561) b!1466953))

(assert (= (and b!1466953 res!995555) b!1466952))

(assert (= (and b!1466952 res!995556) b!1466938))

(assert (= (and b!1466938 res!995562) b!1466947))

(assert (= (and b!1466947 c!135203) b!1466957))

(assert (= (and b!1466947 (not c!135203)) b!1466956))

(assert (= (and b!1466947 res!995559) b!1466951))

(assert (= (and b!1466951 res!995564) b!1466958))

(assert (= (and b!1466958 (not res!995563)) b!1466949))

(assert (= (and b!1466949 (not res!995567)) b!1466942))

(assert (= (and b!1466942 (not res!995552)) b!1466950))

(assert (= (and b!1466950 c!135204) b!1466943))

(assert (= (and b!1466950 (not c!135204)) b!1466954))

(assert (= (and b!1466950 (not res!995568)) b!1466941))

(assert (= (and b!1466941 (not res!995554)) b!1466948))

(declare-fun m!1353883 () Bool)

(assert (=> b!1466957 m!1353883))

(declare-fun m!1353885 () Bool)

(assert (=> b!1466945 m!1353885))

(declare-fun m!1353887 () Bool)

(assert (=> b!1466946 m!1353887))

(assert (=> b!1466946 m!1353887))

(declare-fun m!1353889 () Bool)

(assert (=> b!1466946 m!1353889))

(assert (=> b!1466942 m!1353887))

(assert (=> b!1466942 m!1353887))

(declare-fun m!1353891 () Bool)

(assert (=> b!1466942 m!1353891))

(declare-fun m!1353893 () Bool)

(assert (=> b!1466958 m!1353893))

(declare-fun m!1353895 () Bool)

(assert (=> b!1466958 m!1353895))

(declare-fun m!1353897 () Bool)

(assert (=> b!1466958 m!1353897))

(declare-fun m!1353899 () Bool)

(assert (=> b!1466958 m!1353899))

(declare-fun m!1353901 () Bool)

(assert (=> b!1466958 m!1353901))

(assert (=> b!1466958 m!1353887))

(declare-fun m!1353903 () Bool)

(assert (=> b!1466958 m!1353903))

(declare-fun m!1353905 () Bool)

(assert (=> b!1466958 m!1353905))

(assert (=> b!1466958 m!1353887))

(assert (=> b!1466953 m!1353887))

(assert (=> b!1466953 m!1353887))

(declare-fun m!1353907 () Bool)

(assert (=> b!1466953 m!1353907))

(assert (=> b!1466953 m!1353907))

(assert (=> b!1466953 m!1353887))

(declare-fun m!1353909 () Bool)

(assert (=> b!1466953 m!1353909))

(declare-fun m!1353911 () Bool)

(assert (=> b!1466938 m!1353911))

(assert (=> b!1466938 m!1353911))

(declare-fun m!1353913 () Bool)

(assert (=> b!1466938 m!1353913))

(assert (=> b!1466938 m!1353895))

(declare-fun m!1353915 () Bool)

(assert (=> b!1466938 m!1353915))

(declare-fun m!1353917 () Bool)

(assert (=> start!125408 m!1353917))

(declare-fun m!1353919 () Bool)

(assert (=> start!125408 m!1353919))

(declare-fun m!1353921 () Bool)

(assert (=> b!1466937 m!1353921))

(assert (=> b!1466952 m!1353887))

(assert (=> b!1466952 m!1353887))

(declare-fun m!1353923 () Bool)

(assert (=> b!1466952 m!1353923))

(declare-fun m!1353925 () Bool)

(assert (=> b!1466948 m!1353925))

(declare-fun m!1353927 () Bool)

(assert (=> b!1466948 m!1353927))

(declare-fun m!1353929 () Bool)

(assert (=> b!1466943 m!1353929))

(declare-fun m!1353931 () Bool)

(assert (=> b!1466956 m!1353931))

(assert (=> b!1466956 m!1353925))

(declare-fun m!1353933 () Bool)

(assert (=> b!1466939 m!1353933))

(assert (=> b!1466939 m!1353933))

(declare-fun m!1353935 () Bool)

(assert (=> b!1466939 m!1353935))

(assert (=> b!1466940 m!1353895))

(declare-fun m!1353937 () Bool)

(assert (=> b!1466940 m!1353937))

(declare-fun m!1353939 () Bool)

(assert (=> b!1466954 m!1353939))

(assert (=> b!1466954 m!1353925))

(declare-fun m!1353941 () Bool)

(assert (=> b!1466949 m!1353941))

(push 1)

(assert (not b!1466957))

(assert (not b!1466942))

(assert (not b!1466949))

(assert (not b!1466956))

(assert (not b!1466954))


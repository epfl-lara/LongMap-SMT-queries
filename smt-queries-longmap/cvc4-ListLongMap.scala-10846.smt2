; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126926 () Bool)

(assert start!126926)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12361 0))(
  ( (MissingZero!12361 (index!51836 (_ BitVec 32))) (Found!12361 (index!51837 (_ BitVec 32))) (Intermediate!12361 (undefined!13173 Bool) (index!51838 (_ BitVec 32)) (x!133417 (_ BitVec 32))) (Undefined!12361) (MissingVacant!12361 (index!51839 (_ BitVec 32))) )
))
(declare-fun lt!650401 () SeekEntryResult!12361)

(declare-datatypes ((array!99699 0))(
  ( (array!99700 (arr!48121 (Array (_ BitVec 32) (_ BitVec 64))) (size!48671 (_ BitVec 32))) )
))
(declare-fun lt!650404 () array!99699)

(declare-fun b!1491814 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!835792 () Bool)

(declare-fun lt!650405 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99699 (_ BitVec 32)) SeekEntryResult!12361)

(assert (=> b!1491814 (= e!835792 (= lt!650401 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650405 lt!650404 mask!2687)))))

(declare-fun b!1491815 () Bool)

(declare-fun res!1014948 () Bool)

(declare-fun e!835793 () Bool)

(assert (=> b!1491815 (=> (not res!1014948) (not e!835793))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99699)

(assert (=> b!1491815 (= res!1014948 (and (= (size!48671 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48671 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48671 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1491816 () Bool)

(declare-fun res!1014944 () Bool)

(assert (=> b!1491816 (=> (not res!1014944) (not e!835793))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1491816 (= res!1014944 (validKeyInArray!0 (select (arr!48121 a!2862) i!1006)))))

(declare-fun b!1491817 () Bool)

(declare-fun res!1014949 () Bool)

(assert (=> b!1491817 (=> (not res!1014949) (not e!835793))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1491817 (= res!1014949 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48671 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48671 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48671 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1491818 () Bool)

(declare-fun res!1014951 () Bool)

(assert (=> b!1491818 (=> (not res!1014951) (not e!835793))))

(declare-datatypes ((List!34622 0))(
  ( (Nil!34619) (Cons!34618 (h!36001 (_ BitVec 64)) (t!49316 List!34622)) )
))
(declare-fun arrayNoDuplicates!0 (array!99699 (_ BitVec 32) List!34622) Bool)

(assert (=> b!1491818 (= res!1014951 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34619))))

(declare-fun b!1491819 () Bool)

(declare-fun res!1014947 () Bool)

(declare-fun e!835795 () Bool)

(assert (=> b!1491819 (=> (not res!1014947) (not e!835795))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99699 (_ BitVec 32)) SeekEntryResult!12361)

(assert (=> b!1491819 (= res!1014947 (= (seekEntryOrOpen!0 (select (arr!48121 a!2862) j!93) a!2862 mask!2687) (Found!12361 j!93)))))

(declare-fun b!1491820 () Bool)

(declare-fun e!835798 () Bool)

(assert (=> b!1491820 (= e!835793 e!835798)))

(declare-fun res!1014940 () Bool)

(assert (=> b!1491820 (=> (not res!1014940) (not e!835798))))

(assert (=> b!1491820 (= res!1014940 (= (select (store (arr!48121 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1491820 (= lt!650404 (array!99700 (store (arr!48121 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48671 a!2862)))))

(declare-fun b!1491822 () Bool)

(declare-fun e!835796 () Bool)

(assert (=> b!1491822 (= e!835798 e!835796)))

(declare-fun res!1014955 () Bool)

(assert (=> b!1491822 (=> (not res!1014955) (not e!835796))))

(declare-fun lt!650402 () SeekEntryResult!12361)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491822 (= res!1014955 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48121 a!2862) j!93) mask!2687) (select (arr!48121 a!2862) j!93) a!2862 mask!2687) lt!650402))))

(assert (=> b!1491822 (= lt!650402 (Intermediate!12361 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1491823 () Bool)

(declare-fun res!1014942 () Bool)

(assert (=> b!1491823 (=> (not res!1014942) (not e!835793))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99699 (_ BitVec 32)) Bool)

(assert (=> b!1491823 (= res!1014942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1491824 () Bool)

(declare-fun e!835799 () Bool)

(assert (=> b!1491824 (= e!835799 true)))

(declare-fun lt!650406 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491824 (= lt!650406 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1491825 () Bool)

(declare-fun res!1014952 () Bool)

(declare-fun e!835797 () Bool)

(assert (=> b!1491825 (=> (not res!1014952) (not e!835797))))

(assert (=> b!1491825 (= res!1014952 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1491826 () Bool)

(declare-fun res!1014945 () Bool)

(assert (=> b!1491826 (=> (not res!1014945) (not e!835793))))

(assert (=> b!1491826 (= res!1014945 (validKeyInArray!0 (select (arr!48121 a!2862) j!93)))))

(declare-fun b!1491827 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99699 (_ BitVec 32)) SeekEntryResult!12361)

(assert (=> b!1491827 (= e!835792 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650405 lt!650404 mask!2687) (seekEntryOrOpen!0 lt!650405 lt!650404 mask!2687)))))

(declare-fun b!1491828 () Bool)

(assert (=> b!1491828 (= e!835796 e!835797)))

(declare-fun res!1014954 () Bool)

(assert (=> b!1491828 (=> (not res!1014954) (not e!835797))))

(assert (=> b!1491828 (= res!1014954 (= lt!650401 (Intermediate!12361 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1491828 (= lt!650401 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650405 mask!2687) lt!650405 lt!650404 mask!2687))))

(assert (=> b!1491828 (= lt!650405 (select (store (arr!48121 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1491829 () Bool)

(assert (=> b!1491829 (= e!835795 (or (= (select (arr!48121 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48121 a!2862) intermediateBeforeIndex!19) (select (arr!48121 a!2862) j!93))))))

(declare-fun res!1014941 () Bool)

(assert (=> start!126926 (=> (not res!1014941) (not e!835793))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126926 (= res!1014941 (validMask!0 mask!2687))))

(assert (=> start!126926 e!835793))

(assert (=> start!126926 true))

(declare-fun array_inv!37149 (array!99699) Bool)

(assert (=> start!126926 (array_inv!37149 a!2862)))

(declare-fun b!1491821 () Bool)

(declare-fun res!1014950 () Bool)

(assert (=> b!1491821 (=> (not res!1014950) (not e!835796))))

(assert (=> b!1491821 (= res!1014950 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48121 a!2862) j!93) a!2862 mask!2687) lt!650402))))

(declare-fun b!1491830 () Bool)

(declare-fun res!1014953 () Bool)

(assert (=> b!1491830 (=> (not res!1014953) (not e!835797))))

(assert (=> b!1491830 (= res!1014953 e!835792)))

(declare-fun c!137964 () Bool)

(assert (=> b!1491830 (= c!137964 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1491831 () Bool)

(assert (=> b!1491831 (= e!835797 (not e!835799))))

(declare-fun res!1014946 () Bool)

(assert (=> b!1491831 (=> res!1014946 e!835799)))

(assert (=> b!1491831 (= res!1014946 (or (and (= (select (arr!48121 a!2862) index!646) (select (store (arr!48121 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48121 a!2862) index!646) (select (arr!48121 a!2862) j!93))) (= (select (arr!48121 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1491831 e!835795))

(declare-fun res!1014943 () Bool)

(assert (=> b!1491831 (=> (not res!1014943) (not e!835795))))

(assert (=> b!1491831 (= res!1014943 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50062 0))(
  ( (Unit!50063) )
))
(declare-fun lt!650403 () Unit!50062)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99699 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50062)

(assert (=> b!1491831 (= lt!650403 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!126926 res!1014941) b!1491815))

(assert (= (and b!1491815 res!1014948) b!1491816))

(assert (= (and b!1491816 res!1014944) b!1491826))

(assert (= (and b!1491826 res!1014945) b!1491823))

(assert (= (and b!1491823 res!1014942) b!1491818))

(assert (= (and b!1491818 res!1014951) b!1491817))

(assert (= (and b!1491817 res!1014949) b!1491820))

(assert (= (and b!1491820 res!1014940) b!1491822))

(assert (= (and b!1491822 res!1014955) b!1491821))

(assert (= (and b!1491821 res!1014950) b!1491828))

(assert (= (and b!1491828 res!1014954) b!1491830))

(assert (= (and b!1491830 c!137964) b!1491814))

(assert (= (and b!1491830 (not c!137964)) b!1491827))

(assert (= (and b!1491830 res!1014953) b!1491825))

(assert (= (and b!1491825 res!1014952) b!1491831))

(assert (= (and b!1491831 res!1014943) b!1491819))

(assert (= (and b!1491819 res!1014947) b!1491829))

(assert (= (and b!1491831 (not res!1014946)) b!1491824))

(declare-fun m!1375923 () Bool)

(assert (=> b!1491821 m!1375923))

(assert (=> b!1491821 m!1375923))

(declare-fun m!1375925 () Bool)

(assert (=> b!1491821 m!1375925))

(declare-fun m!1375927 () Bool)

(assert (=> b!1491828 m!1375927))

(assert (=> b!1491828 m!1375927))

(declare-fun m!1375929 () Bool)

(assert (=> b!1491828 m!1375929))

(declare-fun m!1375931 () Bool)

(assert (=> b!1491828 m!1375931))

(declare-fun m!1375933 () Bool)

(assert (=> b!1491828 m!1375933))

(declare-fun m!1375935 () Bool)

(assert (=> start!126926 m!1375935))

(declare-fun m!1375937 () Bool)

(assert (=> start!126926 m!1375937))

(declare-fun m!1375939 () Bool)

(assert (=> b!1491818 m!1375939))

(declare-fun m!1375941 () Bool)

(assert (=> b!1491816 m!1375941))

(assert (=> b!1491816 m!1375941))

(declare-fun m!1375943 () Bool)

(assert (=> b!1491816 m!1375943))

(assert (=> b!1491819 m!1375923))

(assert (=> b!1491819 m!1375923))

(declare-fun m!1375945 () Bool)

(assert (=> b!1491819 m!1375945))

(declare-fun m!1375947 () Bool)

(assert (=> b!1491831 m!1375947))

(assert (=> b!1491831 m!1375931))

(declare-fun m!1375949 () Bool)

(assert (=> b!1491831 m!1375949))

(declare-fun m!1375951 () Bool)

(assert (=> b!1491831 m!1375951))

(declare-fun m!1375953 () Bool)

(assert (=> b!1491831 m!1375953))

(assert (=> b!1491831 m!1375923))

(assert (=> b!1491822 m!1375923))

(assert (=> b!1491822 m!1375923))

(declare-fun m!1375955 () Bool)

(assert (=> b!1491822 m!1375955))

(assert (=> b!1491822 m!1375955))

(assert (=> b!1491822 m!1375923))

(declare-fun m!1375957 () Bool)

(assert (=> b!1491822 m!1375957))

(declare-fun m!1375959 () Bool)

(assert (=> b!1491823 m!1375959))

(declare-fun m!1375961 () Bool)

(assert (=> b!1491814 m!1375961))

(assert (=> b!1491820 m!1375931))

(declare-fun m!1375963 () Bool)

(assert (=> b!1491820 m!1375963))

(declare-fun m!1375965 () Bool)

(assert (=> b!1491824 m!1375965))

(declare-fun m!1375967 () Bool)

(assert (=> b!1491827 m!1375967))

(declare-fun m!1375969 () Bool)

(assert (=> b!1491827 m!1375969))

(declare-fun m!1375971 () Bool)

(assert (=> b!1491829 m!1375971))

(assert (=> b!1491829 m!1375923))

(assert (=> b!1491826 m!1375923))

(assert (=> b!1491826 m!1375923))

(declare-fun m!1375973 () Bool)

(assert (=> b!1491826 m!1375973))

(push 1)


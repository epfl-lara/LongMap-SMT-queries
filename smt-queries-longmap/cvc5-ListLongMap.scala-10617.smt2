; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124840 () Bool)

(assert start!124840)

(declare-fun b!1449168 () Bool)

(declare-fun e!816096 () Bool)

(assert (=> b!1449168 (= e!816096 true)))

(declare-datatypes ((SeekEntryResult!11684 0))(
  ( (MissingZero!11684 (index!49128 (_ BitVec 32))) (Found!11684 (index!49129 (_ BitVec 32))) (Intermediate!11684 (undefined!12496 Bool) (index!49130 (_ BitVec 32)) (x!130797 (_ BitVec 32))) (Undefined!11684) (MissingVacant!11684 (index!49131 (_ BitVec 32))) )
))
(declare-fun lt!635804 () SeekEntryResult!11684)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98288 0))(
  ( (array!98289 (arr!47432 (Array (_ BitVec 32) (_ BitVec 64))) (size!47982 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98288)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98288 (_ BitVec 32)) SeekEntryResult!11684)

(assert (=> b!1449168 (= lt!635804 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47432 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1449169 () Bool)

(declare-fun res!980642 () Bool)

(declare-fun e!816098 () Bool)

(assert (=> b!1449169 (=> (not res!980642) (not e!816098))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98288 (_ BitVec 32)) Bool)

(assert (=> b!1449169 (= res!980642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun e!816099 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun b!1449170 () Bool)

(assert (=> b!1449170 (= e!816099 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1449171 () Bool)

(declare-fun e!816102 () Bool)

(declare-fun e!816101 () Bool)

(assert (=> b!1449171 (= e!816102 e!816101)))

(declare-fun res!980647 () Bool)

(assert (=> b!1449171 (=> (not res!980647) (not e!816101))))

(declare-fun lt!635799 () SeekEntryResult!11684)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1449171 (= res!980647 (= lt!635799 (Intermediate!11684 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!635802 () (_ BitVec 64))

(declare-fun lt!635801 () array!98288)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98288 (_ BitVec 32)) SeekEntryResult!11684)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1449171 (= lt!635799 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635802 mask!2687) lt!635802 lt!635801 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1449171 (= lt!635802 (select (store (arr!47432 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1449172 () Bool)

(declare-fun res!980644 () Bool)

(assert (=> b!1449172 (=> (not res!980644) (not e!816098))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1449172 (= res!980644 (validKeyInArray!0 (select (arr!47432 a!2862) j!93)))))

(declare-fun res!980645 () Bool)

(assert (=> start!124840 (=> (not res!980645) (not e!816098))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124840 (= res!980645 (validMask!0 mask!2687))))

(assert (=> start!124840 e!816098))

(assert (=> start!124840 true))

(declare-fun array_inv!36460 (array!98288) Bool)

(assert (=> start!124840 (array_inv!36460 a!2862)))

(declare-fun b!1449173 () Bool)

(declare-fun e!816103 () Bool)

(declare-fun e!816095 () Bool)

(assert (=> b!1449173 (= e!816103 e!816095)))

(declare-fun res!980650 () Bool)

(assert (=> b!1449173 (=> res!980650 e!816095)))

(assert (=> b!1449173 (= res!980650 (or (and (= (select (arr!47432 a!2862) index!646) (select (store (arr!47432 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47432 a!2862) index!646) (select (arr!47432 a!2862) j!93))) (not (= (select (arr!47432 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1449174 () Bool)

(declare-fun res!980653 () Bool)

(assert (=> b!1449174 (=> (not res!980653) (not e!816098))))

(assert (=> b!1449174 (= res!980653 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47982 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47982 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47982 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1449175 () Bool)

(declare-fun res!980639 () Bool)

(assert (=> b!1449175 (=> (not res!980639) (not e!816098))))

(declare-datatypes ((List!33933 0))(
  ( (Nil!33930) (Cons!33929 (h!35279 (_ BitVec 64)) (t!48627 List!33933)) )
))
(declare-fun arrayNoDuplicates!0 (array!98288 (_ BitVec 32) List!33933) Bool)

(assert (=> b!1449175 (= res!980639 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33930))))

(declare-fun b!1449176 () Bool)

(declare-fun res!980640 () Bool)

(assert (=> b!1449176 (=> (not res!980640) (not e!816101))))

(declare-fun e!816104 () Bool)

(assert (=> b!1449176 (= res!980640 e!816104)))

(declare-fun c!133776 () Bool)

(assert (=> b!1449176 (= c!133776 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1449177 () Bool)

(assert (=> b!1449177 (= e!816101 (not e!816096))))

(declare-fun res!980648 () Bool)

(assert (=> b!1449177 (=> res!980648 e!816096)))

(assert (=> b!1449177 (= res!980648 (or (and (= (select (arr!47432 a!2862) index!646) (select (store (arr!47432 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47432 a!2862) index!646) (select (arr!47432 a!2862) j!93))) (not (= (select (arr!47432 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47432 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1449177 e!816103))

(declare-fun res!980652 () Bool)

(assert (=> b!1449177 (=> (not res!980652) (not e!816103))))

(declare-fun lt!635800 () SeekEntryResult!11684)

(assert (=> b!1449177 (= res!980652 (and (= lt!635800 (Found!11684 j!93)) (or (= (select (arr!47432 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47432 a!2862) intermediateBeforeIndex!19) (select (arr!47432 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98288 (_ BitVec 32)) SeekEntryResult!11684)

(assert (=> b!1449177 (= lt!635800 (seekEntryOrOpen!0 (select (arr!47432 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1449177 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48864 0))(
  ( (Unit!48865) )
))
(declare-fun lt!635803 () Unit!48864)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98288 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48864)

(assert (=> b!1449177 (= lt!635803 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1449178 () Bool)

(assert (=> b!1449178 (= e!816104 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635802 lt!635801 mask!2687) (seekEntryOrOpen!0 lt!635802 lt!635801 mask!2687)))))

(declare-fun b!1449179 () Bool)

(declare-fun e!816097 () Bool)

(assert (=> b!1449179 (= e!816098 e!816097)))

(declare-fun res!980649 () Bool)

(assert (=> b!1449179 (=> (not res!980649) (not e!816097))))

(assert (=> b!1449179 (= res!980649 (= (select (store (arr!47432 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1449179 (= lt!635801 (array!98289 (store (arr!47432 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47982 a!2862)))))

(declare-fun b!1449180 () Bool)

(declare-fun res!980637 () Bool)

(assert (=> b!1449180 (=> (not res!980637) (not e!816098))))

(assert (=> b!1449180 (= res!980637 (validKeyInArray!0 (select (arr!47432 a!2862) i!1006)))))

(declare-fun b!1449181 () Bool)

(assert (=> b!1449181 (= e!816104 (= lt!635799 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635802 lt!635801 mask!2687)))))

(declare-fun b!1449182 () Bool)

(declare-fun res!980646 () Bool)

(assert (=> b!1449182 (=> (not res!980646) (not e!816102))))

(declare-fun lt!635805 () SeekEntryResult!11684)

(assert (=> b!1449182 (= res!980646 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47432 a!2862) j!93) a!2862 mask!2687) lt!635805))))

(declare-fun b!1449183 () Bool)

(assert (=> b!1449183 (= e!816095 e!816099)))

(declare-fun res!980651 () Bool)

(assert (=> b!1449183 (=> (not res!980651) (not e!816099))))

(assert (=> b!1449183 (= res!980651 (= lt!635800 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47432 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1449184 () Bool)

(declare-fun res!980641 () Bool)

(assert (=> b!1449184 (=> (not res!980641) (not e!816101))))

(assert (=> b!1449184 (= res!980641 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1449185 () Bool)

(declare-fun res!980643 () Bool)

(assert (=> b!1449185 (=> (not res!980643) (not e!816098))))

(assert (=> b!1449185 (= res!980643 (and (= (size!47982 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47982 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47982 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1449186 () Bool)

(assert (=> b!1449186 (= e!816097 e!816102)))

(declare-fun res!980638 () Bool)

(assert (=> b!1449186 (=> (not res!980638) (not e!816102))))

(assert (=> b!1449186 (= res!980638 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47432 a!2862) j!93) mask!2687) (select (arr!47432 a!2862) j!93) a!2862 mask!2687) lt!635805))))

(assert (=> b!1449186 (= lt!635805 (Intermediate!11684 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!124840 res!980645) b!1449185))

(assert (= (and b!1449185 res!980643) b!1449180))

(assert (= (and b!1449180 res!980637) b!1449172))

(assert (= (and b!1449172 res!980644) b!1449169))

(assert (= (and b!1449169 res!980642) b!1449175))

(assert (= (and b!1449175 res!980639) b!1449174))

(assert (= (and b!1449174 res!980653) b!1449179))

(assert (= (and b!1449179 res!980649) b!1449186))

(assert (= (and b!1449186 res!980638) b!1449182))

(assert (= (and b!1449182 res!980646) b!1449171))

(assert (= (and b!1449171 res!980647) b!1449176))

(assert (= (and b!1449176 c!133776) b!1449181))

(assert (= (and b!1449176 (not c!133776)) b!1449178))

(assert (= (and b!1449176 res!980640) b!1449184))

(assert (= (and b!1449184 res!980641) b!1449177))

(assert (= (and b!1449177 res!980652) b!1449173))

(assert (= (and b!1449173 (not res!980650)) b!1449183))

(assert (= (and b!1449183 res!980651) b!1449170))

(assert (= (and b!1449177 (not res!980648)) b!1449168))

(declare-fun m!1337893 () Bool)

(assert (=> b!1449175 m!1337893))

(declare-fun m!1337895 () Bool)

(assert (=> b!1449173 m!1337895))

(declare-fun m!1337897 () Bool)

(assert (=> b!1449173 m!1337897))

(declare-fun m!1337899 () Bool)

(assert (=> b!1449173 m!1337899))

(declare-fun m!1337901 () Bool)

(assert (=> b!1449173 m!1337901))

(declare-fun m!1337903 () Bool)

(assert (=> b!1449180 m!1337903))

(assert (=> b!1449180 m!1337903))

(declare-fun m!1337905 () Bool)

(assert (=> b!1449180 m!1337905))

(assert (=> b!1449182 m!1337901))

(assert (=> b!1449182 m!1337901))

(declare-fun m!1337907 () Bool)

(assert (=> b!1449182 m!1337907))

(declare-fun m!1337909 () Bool)

(assert (=> b!1449181 m!1337909))

(assert (=> b!1449183 m!1337901))

(assert (=> b!1449183 m!1337901))

(declare-fun m!1337911 () Bool)

(assert (=> b!1449183 m!1337911))

(assert (=> b!1449179 m!1337897))

(declare-fun m!1337913 () Bool)

(assert (=> b!1449179 m!1337913))

(declare-fun m!1337915 () Bool)

(assert (=> b!1449177 m!1337915))

(assert (=> b!1449177 m!1337897))

(declare-fun m!1337917 () Bool)

(assert (=> b!1449177 m!1337917))

(assert (=> b!1449177 m!1337899))

(assert (=> b!1449177 m!1337895))

(assert (=> b!1449177 m!1337901))

(declare-fun m!1337919 () Bool)

(assert (=> b!1449177 m!1337919))

(declare-fun m!1337921 () Bool)

(assert (=> b!1449177 m!1337921))

(assert (=> b!1449177 m!1337901))

(assert (=> b!1449172 m!1337901))

(assert (=> b!1449172 m!1337901))

(declare-fun m!1337923 () Bool)

(assert (=> b!1449172 m!1337923))

(declare-fun m!1337925 () Bool)

(assert (=> b!1449171 m!1337925))

(assert (=> b!1449171 m!1337925))

(declare-fun m!1337927 () Bool)

(assert (=> b!1449171 m!1337927))

(assert (=> b!1449171 m!1337897))

(declare-fun m!1337929 () Bool)

(assert (=> b!1449171 m!1337929))

(declare-fun m!1337931 () Bool)

(assert (=> b!1449169 m!1337931))

(declare-fun m!1337933 () Bool)

(assert (=> b!1449178 m!1337933))

(declare-fun m!1337935 () Bool)

(assert (=> b!1449178 m!1337935))

(assert (=> b!1449168 m!1337901))

(assert (=> b!1449168 m!1337901))

(declare-fun m!1337937 () Bool)

(assert (=> b!1449168 m!1337937))

(declare-fun m!1337939 () Bool)

(assert (=> start!124840 m!1337939))

(declare-fun m!1337941 () Bool)

(assert (=> start!124840 m!1337941))

(assert (=> b!1449186 m!1337901))

(assert (=> b!1449186 m!1337901))

(declare-fun m!1337943 () Bool)

(assert (=> b!1449186 m!1337943))

(assert (=> b!1449186 m!1337943))

(assert (=> b!1449186 m!1337901))

(declare-fun m!1337945 () Bool)

(assert (=> b!1449186 m!1337945))

(push 1)


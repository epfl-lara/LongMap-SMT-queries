; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124834 () Bool)

(assert start!124834)

(declare-fun b!1449668 () Bool)

(declare-fun res!981199 () Bool)

(declare-fun e!816344 () Bool)

(assert (=> b!1449668 (=> (not res!981199) (not e!816344))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98260 0))(
  ( (array!98261 (arr!47419 (Array (_ BitVec 32) (_ BitVec 64))) (size!47971 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98260)

(assert (=> b!1449668 (= res!981199 (and (= (size!47971 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47971 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47971 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1449669 () Bool)

(declare-fun e!816339 () Bool)

(declare-fun e!816347 () Bool)

(assert (=> b!1449669 (= e!816339 e!816347)))

(declare-fun res!981191 () Bool)

(assert (=> b!1449669 (=> (not res!981191) (not e!816347))))

(declare-datatypes ((SeekEntryResult!11696 0))(
  ( (MissingZero!11696 (index!49176 (_ BitVec 32))) (Found!11696 (index!49177 (_ BitVec 32))) (Intermediate!11696 (undefined!12508 Bool) (index!49178 (_ BitVec 32)) (x!130836 (_ BitVec 32))) (Undefined!11696) (MissingVacant!11696 (index!49179 (_ BitVec 32))) )
))
(declare-fun lt!635834 () SeekEntryResult!11696)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98260 (_ BitVec 32)) SeekEntryResult!11696)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1449669 (= res!981191 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47419 a!2862) j!93) mask!2687) (select (arr!47419 a!2862) j!93) a!2862 mask!2687) lt!635834))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1449669 (= lt!635834 (Intermediate!11696 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1449670 () Bool)

(declare-fun e!816346 () Bool)

(declare-fun e!816341 () Bool)

(assert (=> b!1449670 (= e!816346 (not e!816341))))

(declare-fun res!981189 () Bool)

(assert (=> b!1449670 (=> res!981189 e!816341)))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1449670 (= res!981189 (or (and (= (select (arr!47419 a!2862) index!646) (select (store (arr!47419 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47419 a!2862) index!646) (select (arr!47419 a!2862) j!93))) (not (= (select (arr!47419 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47419 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!816342 () Bool)

(assert (=> b!1449670 e!816342))

(declare-fun res!981196 () Bool)

(assert (=> b!1449670 (=> (not res!981196) (not e!816342))))

(declare-fun lt!635833 () SeekEntryResult!11696)

(declare-fun lt!635831 () SeekEntryResult!11696)

(assert (=> b!1449670 (= res!981196 (and (= lt!635831 lt!635833) (or (= (select (arr!47419 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47419 a!2862) intermediateBeforeIndex!19) (select (arr!47419 a!2862) j!93)))))))

(assert (=> b!1449670 (= lt!635833 (Found!11696 j!93))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98260 (_ BitVec 32)) SeekEntryResult!11696)

(assert (=> b!1449670 (= lt!635831 (seekEntryOrOpen!0 (select (arr!47419 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98260 (_ BitVec 32)) Bool)

(assert (=> b!1449670 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48729 0))(
  ( (Unit!48730) )
))
(declare-fun lt!635835 () Unit!48729)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98260 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48729)

(assert (=> b!1449670 (= lt!635835 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1449671 () Bool)

(assert (=> b!1449671 (= e!816347 e!816346)))

(declare-fun res!981190 () Bool)

(assert (=> b!1449671 (=> (not res!981190) (not e!816346))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!635830 () SeekEntryResult!11696)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1449671 (= res!981190 (= lt!635830 (Intermediate!11696 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!635829 () array!98260)

(declare-fun lt!635828 () (_ BitVec 64))

(assert (=> b!1449671 (= lt!635830 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635828 mask!2687) lt!635828 lt!635829 mask!2687))))

(assert (=> b!1449671 (= lt!635828 (select (store (arr!47419 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1449672 () Bool)

(declare-fun res!981184 () Bool)

(assert (=> b!1449672 (=> (not res!981184) (not e!816344))))

(assert (=> b!1449672 (= res!981184 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1449673 () Bool)

(declare-fun res!981197 () Bool)

(assert (=> b!1449673 (=> (not res!981197) (not e!816347))))

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1449673 (= res!981197 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47419 a!2862) j!93) a!2862 mask!2687) lt!635834))))

(declare-fun b!1449674 () Bool)

(declare-fun res!981194 () Bool)

(assert (=> b!1449674 (=> (not res!981194) (not e!816344))))

(declare-datatypes ((List!33998 0))(
  ( (Nil!33995) (Cons!33994 (h!35344 (_ BitVec 64)) (t!48684 List!33998)) )
))
(declare-fun arrayNoDuplicates!0 (array!98260 (_ BitVec 32) List!33998) Bool)

(assert (=> b!1449674 (= res!981194 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33995))))

(declare-fun res!981195 () Bool)

(assert (=> start!124834 (=> (not res!981195) (not e!816344))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124834 (= res!981195 (validMask!0 mask!2687))))

(assert (=> start!124834 e!816344))

(assert (=> start!124834 true))

(declare-fun array_inv!36652 (array!98260) Bool)

(assert (=> start!124834 (array_inv!36652 a!2862)))

(declare-fun b!1449675 () Bool)

(declare-fun res!981198 () Bool)

(assert (=> b!1449675 (=> (not res!981198) (not e!816344))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1449675 (= res!981198 (validKeyInArray!0 (select (arr!47419 a!2862) j!93)))))

(declare-fun b!1449676 () Bool)

(declare-fun res!981185 () Bool)

(assert (=> b!1449676 (=> (not res!981185) (not e!816346))))

(assert (=> b!1449676 (= res!981185 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun e!816348 () Bool)

(declare-fun b!1449677 () Bool)

(assert (=> b!1449677 (= e!816348 (= lt!635830 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635828 lt!635829 mask!2687)))))

(declare-fun b!1449678 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98260 (_ BitVec 32)) SeekEntryResult!11696)

(assert (=> b!1449678 (= e!816348 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635828 lt!635829 mask!2687) (seekEntryOrOpen!0 lt!635828 lt!635829 mask!2687)))))

(declare-fun e!816345 () Bool)

(declare-fun b!1449679 () Bool)

(assert (=> b!1449679 (= e!816345 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1449680 () Bool)

(assert (=> b!1449680 (= e!816341 (bvsge mask!2687 #b00000000000000000000000000000000))))

(assert (=> b!1449680 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635828 lt!635829 mask!2687) lt!635833)))

(declare-fun lt!635832 () Unit!48729)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!98260 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48729)

(assert (=> b!1449680 (= lt!635832 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1449681 () Bool)

(assert (=> b!1449681 (= e!816344 e!816339)))

(declare-fun res!981183 () Bool)

(assert (=> b!1449681 (=> (not res!981183) (not e!816339))))

(assert (=> b!1449681 (= res!981183 (= (select (store (arr!47419 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1449681 (= lt!635829 (array!98261 (store (arr!47419 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47971 a!2862)))))

(declare-fun b!1449682 () Bool)

(declare-fun res!981188 () Bool)

(assert (=> b!1449682 (=> res!981188 e!816341)))

(assert (=> b!1449682 (= res!981188 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47419 a!2862) j!93) a!2862 mask!2687) lt!635833)))))

(declare-fun b!1449683 () Bool)

(declare-fun e!816340 () Bool)

(assert (=> b!1449683 (= e!816340 e!816345)))

(declare-fun res!981186 () Bool)

(assert (=> b!1449683 (=> (not res!981186) (not e!816345))))

(assert (=> b!1449683 (= res!981186 (= lt!635831 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47419 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1449684 () Bool)

(declare-fun res!981182 () Bool)

(assert (=> b!1449684 (=> (not res!981182) (not e!816344))))

(assert (=> b!1449684 (= res!981182 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47971 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47971 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47971 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1449685 () Bool)

(assert (=> b!1449685 (= e!816342 e!816340)))

(declare-fun res!981193 () Bool)

(assert (=> b!1449685 (=> res!981193 e!816340)))

(assert (=> b!1449685 (= res!981193 (or (and (= (select (arr!47419 a!2862) index!646) (select (store (arr!47419 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47419 a!2862) index!646) (select (arr!47419 a!2862) j!93))) (not (= (select (arr!47419 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1449686 () Bool)

(declare-fun res!981192 () Bool)

(assert (=> b!1449686 (=> (not res!981192) (not e!816344))))

(assert (=> b!1449686 (= res!981192 (validKeyInArray!0 (select (arr!47419 a!2862) i!1006)))))

(declare-fun b!1449687 () Bool)

(declare-fun res!981187 () Bool)

(assert (=> b!1449687 (=> (not res!981187) (not e!816346))))

(assert (=> b!1449687 (= res!981187 e!816348)))

(declare-fun c!133756 () Bool)

(assert (=> b!1449687 (= c!133756 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!124834 res!981195) b!1449668))

(assert (= (and b!1449668 res!981199) b!1449686))

(assert (= (and b!1449686 res!981192) b!1449675))

(assert (= (and b!1449675 res!981198) b!1449672))

(assert (= (and b!1449672 res!981184) b!1449674))

(assert (= (and b!1449674 res!981194) b!1449684))

(assert (= (and b!1449684 res!981182) b!1449681))

(assert (= (and b!1449681 res!981183) b!1449669))

(assert (= (and b!1449669 res!981191) b!1449673))

(assert (= (and b!1449673 res!981197) b!1449671))

(assert (= (and b!1449671 res!981190) b!1449687))

(assert (= (and b!1449687 c!133756) b!1449677))

(assert (= (and b!1449687 (not c!133756)) b!1449678))

(assert (= (and b!1449687 res!981187) b!1449676))

(assert (= (and b!1449676 res!981185) b!1449670))

(assert (= (and b!1449670 res!981196) b!1449685))

(assert (= (and b!1449685 (not res!981193)) b!1449683))

(assert (= (and b!1449683 res!981186) b!1449679))

(assert (= (and b!1449670 (not res!981189)) b!1449682))

(assert (= (and b!1449682 (not res!981188)) b!1449680))

(declare-fun m!1337871 () Bool)

(assert (=> b!1449680 m!1337871))

(declare-fun m!1337873 () Bool)

(assert (=> b!1449680 m!1337873))

(declare-fun m!1337875 () Bool)

(assert (=> b!1449672 m!1337875))

(declare-fun m!1337877 () Bool)

(assert (=> b!1449671 m!1337877))

(assert (=> b!1449671 m!1337877))

(declare-fun m!1337879 () Bool)

(assert (=> b!1449671 m!1337879))

(declare-fun m!1337881 () Bool)

(assert (=> b!1449671 m!1337881))

(declare-fun m!1337883 () Bool)

(assert (=> b!1449671 m!1337883))

(declare-fun m!1337885 () Bool)

(assert (=> b!1449675 m!1337885))

(assert (=> b!1449675 m!1337885))

(declare-fun m!1337887 () Bool)

(assert (=> b!1449675 m!1337887))

(assert (=> b!1449678 m!1337871))

(declare-fun m!1337889 () Bool)

(assert (=> b!1449678 m!1337889))

(assert (=> b!1449673 m!1337885))

(assert (=> b!1449673 m!1337885))

(declare-fun m!1337891 () Bool)

(assert (=> b!1449673 m!1337891))

(declare-fun m!1337893 () Bool)

(assert (=> b!1449686 m!1337893))

(assert (=> b!1449686 m!1337893))

(declare-fun m!1337895 () Bool)

(assert (=> b!1449686 m!1337895))

(declare-fun m!1337897 () Bool)

(assert (=> b!1449685 m!1337897))

(assert (=> b!1449685 m!1337881))

(declare-fun m!1337899 () Bool)

(assert (=> b!1449685 m!1337899))

(assert (=> b!1449685 m!1337885))

(assert (=> b!1449681 m!1337881))

(declare-fun m!1337901 () Bool)

(assert (=> b!1449681 m!1337901))

(declare-fun m!1337903 () Bool)

(assert (=> b!1449677 m!1337903))

(assert (=> b!1449682 m!1337885))

(assert (=> b!1449682 m!1337885))

(declare-fun m!1337905 () Bool)

(assert (=> b!1449682 m!1337905))

(declare-fun m!1337907 () Bool)

(assert (=> start!124834 m!1337907))

(declare-fun m!1337909 () Bool)

(assert (=> start!124834 m!1337909))

(declare-fun m!1337911 () Bool)

(assert (=> b!1449674 m!1337911))

(declare-fun m!1337913 () Bool)

(assert (=> b!1449670 m!1337913))

(assert (=> b!1449670 m!1337881))

(declare-fun m!1337915 () Bool)

(assert (=> b!1449670 m!1337915))

(assert (=> b!1449670 m!1337899))

(assert (=> b!1449670 m!1337897))

(assert (=> b!1449670 m!1337885))

(declare-fun m!1337917 () Bool)

(assert (=> b!1449670 m!1337917))

(declare-fun m!1337919 () Bool)

(assert (=> b!1449670 m!1337919))

(assert (=> b!1449670 m!1337885))

(assert (=> b!1449683 m!1337885))

(assert (=> b!1449683 m!1337885))

(declare-fun m!1337921 () Bool)

(assert (=> b!1449683 m!1337921))

(assert (=> b!1449669 m!1337885))

(assert (=> b!1449669 m!1337885))

(declare-fun m!1337923 () Bool)

(assert (=> b!1449669 m!1337923))

(assert (=> b!1449669 m!1337923))

(assert (=> b!1449669 m!1337885))

(declare-fun m!1337925 () Bool)

(assert (=> b!1449669 m!1337925))

(check-sat (not b!1449669) (not b!1449672) (not b!1449670) (not b!1449677) (not start!124834) (not b!1449682) (not b!1449678) (not b!1449683) (not b!1449680) (not b!1449671) (not b!1449675) (not b!1449673) (not b!1449686) (not b!1449674))
(check-sat)

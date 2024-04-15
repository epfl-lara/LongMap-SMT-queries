; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124630 () Bool)

(assert start!124630)

(declare-fun b!1444075 () Bool)

(declare-fun res!976209 () Bool)

(declare-fun e!813650 () Bool)

(assert (=> b!1444075 (=> (not res!976209) (not e!813650))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98056 0))(
  ( (array!98057 (arr!47317 (Array (_ BitVec 32) (_ BitVec 64))) (size!47869 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98056)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1444075 (= res!976209 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47869 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47869 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47869 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1444076 () Bool)

(declare-fun e!813645 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1444076 (= e!813645 (or (= (select (arr!47317 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47317 a!2862) intermediateBeforeIndex!19) (select (arr!47317 a!2862) j!93))))))

(declare-fun b!1444077 () Bool)

(declare-fun e!813651 () Bool)

(assert (=> b!1444077 (= e!813650 e!813651)))

(declare-fun res!976204 () Bool)

(assert (=> b!1444077 (=> (not res!976204) (not e!813651))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1444077 (= res!976204 (= (select (store (arr!47317 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!633909 () array!98056)

(assert (=> b!1444077 (= lt!633909 (array!98057 (store (arr!47317 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47869 a!2862)))))

(declare-fun b!1444078 () Bool)

(declare-fun e!813647 () Bool)

(assert (=> b!1444078 (= e!813651 e!813647)))

(declare-fun res!976212 () Bool)

(assert (=> b!1444078 (=> (not res!976212) (not e!813647))))

(declare-datatypes ((SeekEntryResult!11594 0))(
  ( (MissingZero!11594 (index!48768 (_ BitVec 32))) (Found!11594 (index!48769 (_ BitVec 32))) (Intermediate!11594 (undefined!12406 Bool) (index!48770 (_ BitVec 32)) (x!130462 (_ BitVec 32))) (Undefined!11594) (MissingVacant!11594 (index!48771 (_ BitVec 32))) )
))
(declare-fun lt!633908 () SeekEntryResult!11594)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98056 (_ BitVec 32)) SeekEntryResult!11594)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1444078 (= res!976212 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47317 a!2862) j!93) mask!2687) (select (arr!47317 a!2862) j!93) a!2862 mask!2687) lt!633908))))

(assert (=> b!1444078 (= lt!633908 (Intermediate!11594 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1444079 () Bool)

(declare-fun res!976203 () Bool)

(assert (=> b!1444079 (=> (not res!976203) (not e!813650))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1444079 (= res!976203 (validKeyInArray!0 (select (arr!47317 a!2862) j!93)))))

(declare-fun b!1444080 () Bool)

(declare-fun res!976208 () Bool)

(assert (=> b!1444080 (=> (not res!976208) (not e!813650))))

(assert (=> b!1444080 (= res!976208 (validKeyInArray!0 (select (arr!47317 a!2862) i!1006)))))

(declare-fun b!1444081 () Bool)

(declare-fun res!976210 () Bool)

(assert (=> b!1444081 (=> (not res!976210) (not e!813647))))

(assert (=> b!1444081 (= res!976210 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47317 a!2862) j!93) a!2862 mask!2687) lt!633908))))

(declare-fun b!1444083 () Bool)

(declare-fun e!813644 () Bool)

(declare-fun lt!633910 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98056 (_ BitVec 32)) SeekEntryResult!11594)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98056 (_ BitVec 32)) SeekEntryResult!11594)

(assert (=> b!1444083 (= e!813644 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633910 lt!633909 mask!2687) (seekEntryOrOpen!0 lt!633910 lt!633909 mask!2687)))))

(declare-fun lt!633907 () SeekEntryResult!11594)

(declare-fun b!1444084 () Bool)

(assert (=> b!1444084 (= e!813644 (= lt!633907 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633910 lt!633909 mask!2687)))))

(declare-fun b!1444085 () Bool)

(declare-fun res!976216 () Bool)

(declare-fun e!813649 () Bool)

(assert (=> b!1444085 (=> (not res!976216) (not e!813649))))

(assert (=> b!1444085 (= res!976216 e!813644)))

(declare-fun c!133450 () Bool)

(assert (=> b!1444085 (= c!133450 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1444086 () Bool)

(declare-fun res!976202 () Bool)

(assert (=> b!1444086 (=> (not res!976202) (not e!813649))))

(assert (=> b!1444086 (= res!976202 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1444087 () Bool)

(declare-fun res!976213 () Bool)

(assert (=> b!1444087 (=> (not res!976213) (not e!813645))))

(assert (=> b!1444087 (= res!976213 (= (seekEntryOrOpen!0 (select (arr!47317 a!2862) j!93) a!2862 mask!2687) (Found!11594 j!93)))))

(declare-fun b!1444088 () Bool)

(declare-fun res!976215 () Bool)

(assert (=> b!1444088 (=> (not res!976215) (not e!813650))))

(assert (=> b!1444088 (= res!976215 (and (= (size!47869 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47869 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47869 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1444089 () Bool)

(declare-fun res!976205 () Bool)

(assert (=> b!1444089 (=> (not res!976205) (not e!813650))))

(declare-datatypes ((List!33896 0))(
  ( (Nil!33893) (Cons!33892 (h!35242 (_ BitVec 64)) (t!48582 List!33896)) )
))
(declare-fun arrayNoDuplicates!0 (array!98056 (_ BitVec 32) List!33896) Bool)

(assert (=> b!1444089 (= res!976205 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33893))))

(declare-fun b!1444090 () Bool)

(declare-fun e!813646 () Bool)

(assert (=> b!1444090 (= e!813649 (not e!813646))))

(declare-fun res!976206 () Bool)

(assert (=> b!1444090 (=> res!976206 e!813646)))

(assert (=> b!1444090 (= res!976206 (or (not (= (select (arr!47317 a!2862) index!646) (select (store (arr!47317 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47317 a!2862) index!646) (select (arr!47317 a!2862) j!93)))))))

(assert (=> b!1444090 e!813645))

(declare-fun res!976214 () Bool)

(assert (=> b!1444090 (=> (not res!976214) (not e!813645))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98056 (_ BitVec 32)) Bool)

(assert (=> b!1444090 (= res!976214 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48525 0))(
  ( (Unit!48526) )
))
(declare-fun lt!633911 () Unit!48525)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98056 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48525)

(assert (=> b!1444090 (= lt!633911 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1444082 () Bool)

(assert (=> b!1444082 (= e!813647 e!813649)))

(declare-fun res!976211 () Bool)

(assert (=> b!1444082 (=> (not res!976211) (not e!813649))))

(assert (=> b!1444082 (= res!976211 (= lt!633907 (Intermediate!11594 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1444082 (= lt!633907 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633910 mask!2687) lt!633910 lt!633909 mask!2687))))

(assert (=> b!1444082 (= lt!633910 (select (store (arr!47317 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!976207 () Bool)

(assert (=> start!124630 (=> (not res!976207) (not e!813650))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124630 (= res!976207 (validMask!0 mask!2687))))

(assert (=> start!124630 e!813650))

(assert (=> start!124630 true))

(declare-fun array_inv!36550 (array!98056) Bool)

(assert (=> start!124630 (array_inv!36550 a!2862)))

(declare-fun b!1444091 () Bool)

(declare-fun res!976201 () Bool)

(assert (=> b!1444091 (=> (not res!976201) (not e!813650))))

(assert (=> b!1444091 (= res!976201 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1444092 () Bool)

(assert (=> b!1444092 (= e!813646 true)))

(declare-fun lt!633912 () SeekEntryResult!11594)

(assert (=> b!1444092 (= lt!633912 (seekEntryOrOpen!0 lt!633910 lt!633909 mask!2687))))

(assert (= (and start!124630 res!976207) b!1444088))

(assert (= (and b!1444088 res!976215) b!1444080))

(assert (= (and b!1444080 res!976208) b!1444079))

(assert (= (and b!1444079 res!976203) b!1444091))

(assert (= (and b!1444091 res!976201) b!1444089))

(assert (= (and b!1444089 res!976205) b!1444075))

(assert (= (and b!1444075 res!976209) b!1444077))

(assert (= (and b!1444077 res!976204) b!1444078))

(assert (= (and b!1444078 res!976212) b!1444081))

(assert (= (and b!1444081 res!976210) b!1444082))

(assert (= (and b!1444082 res!976211) b!1444085))

(assert (= (and b!1444085 c!133450) b!1444084))

(assert (= (and b!1444085 (not c!133450)) b!1444083))

(assert (= (and b!1444085 res!976216) b!1444086))

(assert (= (and b!1444086 res!976202) b!1444090))

(assert (= (and b!1444090 res!976214) b!1444087))

(assert (= (and b!1444087 res!976213) b!1444076))

(assert (= (and b!1444090 (not res!976206)) b!1444092))

(declare-fun m!1332627 () Bool)

(assert (=> b!1444091 m!1332627))

(declare-fun m!1332629 () Bool)

(assert (=> b!1444090 m!1332629))

(declare-fun m!1332631 () Bool)

(assert (=> b!1444090 m!1332631))

(declare-fun m!1332633 () Bool)

(assert (=> b!1444090 m!1332633))

(declare-fun m!1332635 () Bool)

(assert (=> b!1444090 m!1332635))

(declare-fun m!1332637 () Bool)

(assert (=> b!1444090 m!1332637))

(declare-fun m!1332639 () Bool)

(assert (=> b!1444090 m!1332639))

(declare-fun m!1332641 () Bool)

(assert (=> b!1444082 m!1332641))

(assert (=> b!1444082 m!1332641))

(declare-fun m!1332643 () Bool)

(assert (=> b!1444082 m!1332643))

(assert (=> b!1444082 m!1332631))

(declare-fun m!1332645 () Bool)

(assert (=> b!1444082 m!1332645))

(declare-fun m!1332647 () Bool)

(assert (=> b!1444083 m!1332647))

(declare-fun m!1332649 () Bool)

(assert (=> b!1444083 m!1332649))

(assert (=> b!1444092 m!1332649))

(assert (=> b!1444087 m!1332639))

(assert (=> b!1444087 m!1332639))

(declare-fun m!1332651 () Bool)

(assert (=> b!1444087 m!1332651))

(assert (=> b!1444081 m!1332639))

(assert (=> b!1444081 m!1332639))

(declare-fun m!1332653 () Bool)

(assert (=> b!1444081 m!1332653))

(assert (=> b!1444078 m!1332639))

(assert (=> b!1444078 m!1332639))

(declare-fun m!1332655 () Bool)

(assert (=> b!1444078 m!1332655))

(assert (=> b!1444078 m!1332655))

(assert (=> b!1444078 m!1332639))

(declare-fun m!1332657 () Bool)

(assert (=> b!1444078 m!1332657))

(declare-fun m!1332659 () Bool)

(assert (=> b!1444089 m!1332659))

(declare-fun m!1332661 () Bool)

(assert (=> start!124630 m!1332661))

(declare-fun m!1332663 () Bool)

(assert (=> start!124630 m!1332663))

(declare-fun m!1332665 () Bool)

(assert (=> b!1444080 m!1332665))

(assert (=> b!1444080 m!1332665))

(declare-fun m!1332667 () Bool)

(assert (=> b!1444080 m!1332667))

(declare-fun m!1332669 () Bool)

(assert (=> b!1444076 m!1332669))

(assert (=> b!1444076 m!1332639))

(assert (=> b!1444077 m!1332631))

(declare-fun m!1332671 () Bool)

(assert (=> b!1444077 m!1332671))

(assert (=> b!1444079 m!1332639))

(assert (=> b!1444079 m!1332639))

(declare-fun m!1332673 () Bool)

(assert (=> b!1444079 m!1332673))

(declare-fun m!1332675 () Bool)

(assert (=> b!1444084 m!1332675))

(check-sat (not start!124630) (not b!1444083) (not b!1444078) (not b!1444090) (not b!1444084) (not b!1444082) (not b!1444091) (not b!1444079) (not b!1444087) (not b!1444081) (not b!1444080) (not b!1444092) (not b!1444089))
(check-sat)

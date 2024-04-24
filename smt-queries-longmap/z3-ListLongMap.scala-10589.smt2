; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124890 () Bool)

(assert start!124890)

(declare-fun b!1445919 () Bool)

(declare-fun res!977070 () Bool)

(declare-fun e!814733 () Bool)

(assert (=> b!1445919 (=> (not res!977070) (not e!814733))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98233 0))(
  ( (array!98234 (arr!47401 (Array (_ BitVec 32) (_ BitVec 64))) (size!47952 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98233)

(assert (=> b!1445919 (= res!977070 (and (= (size!47952 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47952 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47952 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1445920 () Bool)

(declare-fun res!977067 () Bool)

(assert (=> b!1445920 (=> (not res!977067) (not e!814733))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98233 (_ BitVec 32)) Bool)

(assert (=> b!1445920 (= res!977067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1445921 () Bool)

(declare-fun e!814736 () Bool)

(declare-fun e!814737 () Bool)

(assert (=> b!1445921 (= e!814736 e!814737)))

(declare-fun res!977075 () Bool)

(assert (=> b!1445921 (=> (not res!977075) (not e!814737))))

(declare-datatypes ((SeekEntryResult!11550 0))(
  ( (MissingZero!11550 (index!48592 (_ BitVec 32))) (Found!11550 (index!48593 (_ BitVec 32))) (Intermediate!11550 (undefined!12362 Bool) (index!48594 (_ BitVec 32)) (x!130463 (_ BitVec 32))) (Undefined!11550) (MissingVacant!11550 (index!48595 (_ BitVec 32))) )
))
(declare-fun lt!634725 () SeekEntryResult!11550)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98233 (_ BitVec 32)) SeekEntryResult!11550)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1445921 (= res!977075 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47401 a!2862) j!93) mask!2687) (select (arr!47401 a!2862) j!93) a!2862 mask!2687) lt!634725))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1445921 (= lt!634725 (Intermediate!11550 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun lt!634727 () array!98233)

(declare-fun b!1445922 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!634726 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!814735 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98233 (_ BitVec 32)) SeekEntryResult!11550)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98233 (_ BitVec 32)) SeekEntryResult!11550)

(assert (=> b!1445922 (= e!814735 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634726 lt!634727 mask!2687) (seekEntryOrOpen!0 lt!634726 lt!634727 mask!2687)))))

(declare-fun b!1445923 () Bool)

(declare-fun res!977078 () Bool)

(declare-fun e!814734 () Bool)

(assert (=> b!1445923 (=> (not res!977078) (not e!814734))))

(assert (=> b!1445923 (= res!977078 e!814735)))

(declare-fun c!133945 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1445923 (= c!133945 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1445924 () Bool)

(assert (=> b!1445924 (= e!814733 e!814736)))

(declare-fun res!977077 () Bool)

(assert (=> b!1445924 (=> (not res!977077) (not e!814736))))

(assert (=> b!1445924 (= res!977077 (= (select (store (arr!47401 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1445924 (= lt!634727 (array!98234 (store (arr!47401 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47952 a!2862)))))

(declare-fun b!1445925 () Bool)

(declare-fun res!977071 () Bool)

(declare-fun e!814731 () Bool)

(assert (=> b!1445925 (=> (not res!977071) (not e!814731))))

(assert (=> b!1445925 (= res!977071 (= (seekEntryOrOpen!0 (select (arr!47401 a!2862) j!93) a!2862 mask!2687) (Found!11550 j!93)))))

(declare-fun b!1445926 () Bool)

(declare-fun res!977080 () Bool)

(assert (=> b!1445926 (=> (not res!977080) (not e!814734))))

(assert (=> b!1445926 (= res!977080 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1445927 () Bool)

(declare-fun res!977074 () Bool)

(assert (=> b!1445927 (=> (not res!977074) (not e!814733))))

(assert (=> b!1445927 (= res!977074 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47952 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47952 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47952 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1445929 () Bool)

(assert (=> b!1445929 (= e!814734 (not true))))

(assert (=> b!1445929 e!814731))

(declare-fun res!977073 () Bool)

(assert (=> b!1445929 (=> (not res!977073) (not e!814731))))

(assert (=> b!1445929 (= res!977073 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48629 0))(
  ( (Unit!48630) )
))
(declare-fun lt!634728 () Unit!48629)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98233 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48629)

(assert (=> b!1445929 (= lt!634728 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1445930 () Bool)

(declare-fun lt!634729 () SeekEntryResult!11550)

(assert (=> b!1445930 (= e!814735 (= lt!634729 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634726 lt!634727 mask!2687)))))

(declare-fun b!1445931 () Bool)

(declare-fun res!977068 () Bool)

(assert (=> b!1445931 (=> (not res!977068) (not e!814733))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1445931 (= res!977068 (validKeyInArray!0 (select (arr!47401 a!2862) j!93)))))

(declare-fun b!1445932 () Bool)

(declare-fun res!977072 () Bool)

(assert (=> b!1445932 (=> (not res!977072) (not e!814733))))

(assert (=> b!1445932 (= res!977072 (validKeyInArray!0 (select (arr!47401 a!2862) i!1006)))))

(declare-fun b!1445933 () Bool)

(assert (=> b!1445933 (= e!814737 e!814734)))

(declare-fun res!977076 () Bool)

(assert (=> b!1445933 (=> (not res!977076) (not e!814734))))

(assert (=> b!1445933 (= res!977076 (= lt!634729 (Intermediate!11550 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1445933 (= lt!634729 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634726 mask!2687) lt!634726 lt!634727 mask!2687))))

(assert (=> b!1445933 (= lt!634726 (select (store (arr!47401 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1445934 () Bool)

(declare-fun res!977079 () Bool)

(assert (=> b!1445934 (=> (not res!977079) (not e!814733))))

(declare-datatypes ((List!33889 0))(
  ( (Nil!33886) (Cons!33885 (h!35246 (_ BitVec 64)) (t!48575 List!33889)) )
))
(declare-fun arrayNoDuplicates!0 (array!98233 (_ BitVec 32) List!33889) Bool)

(assert (=> b!1445934 (= res!977079 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33886))))

(declare-fun b!1445935 () Bool)

(declare-fun res!977069 () Bool)

(assert (=> b!1445935 (=> (not res!977069) (not e!814737))))

(assert (=> b!1445935 (= res!977069 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47401 a!2862) j!93) a!2862 mask!2687) lt!634725))))

(declare-fun b!1445928 () Bool)

(assert (=> b!1445928 (= e!814731 (or (= (select (arr!47401 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47401 a!2862) intermediateBeforeIndex!19) (select (arr!47401 a!2862) j!93))))))

(declare-fun res!977081 () Bool)

(assert (=> start!124890 (=> (not res!977081) (not e!814733))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124890 (= res!977081 (validMask!0 mask!2687))))

(assert (=> start!124890 e!814733))

(assert (=> start!124890 true))

(declare-fun array_inv!36682 (array!98233) Bool)

(assert (=> start!124890 (array_inv!36682 a!2862)))

(assert (= (and start!124890 res!977081) b!1445919))

(assert (= (and b!1445919 res!977070) b!1445932))

(assert (= (and b!1445932 res!977072) b!1445931))

(assert (= (and b!1445931 res!977068) b!1445920))

(assert (= (and b!1445920 res!977067) b!1445934))

(assert (= (and b!1445934 res!977079) b!1445927))

(assert (= (and b!1445927 res!977074) b!1445924))

(assert (= (and b!1445924 res!977077) b!1445921))

(assert (= (and b!1445921 res!977075) b!1445935))

(assert (= (and b!1445935 res!977069) b!1445933))

(assert (= (and b!1445933 res!977076) b!1445923))

(assert (= (and b!1445923 c!133945) b!1445930))

(assert (= (and b!1445923 (not c!133945)) b!1445922))

(assert (= (and b!1445923 res!977078) b!1445926))

(assert (= (and b!1445926 res!977080) b!1445929))

(assert (= (and b!1445929 res!977073) b!1445925))

(assert (= (and b!1445925 res!977071) b!1445928))

(declare-fun m!1335049 () Bool)

(assert (=> b!1445921 m!1335049))

(assert (=> b!1445921 m!1335049))

(declare-fun m!1335051 () Bool)

(assert (=> b!1445921 m!1335051))

(assert (=> b!1445921 m!1335051))

(assert (=> b!1445921 m!1335049))

(declare-fun m!1335053 () Bool)

(assert (=> b!1445921 m!1335053))

(declare-fun m!1335055 () Bool)

(assert (=> b!1445933 m!1335055))

(assert (=> b!1445933 m!1335055))

(declare-fun m!1335057 () Bool)

(assert (=> b!1445933 m!1335057))

(declare-fun m!1335059 () Bool)

(assert (=> b!1445933 m!1335059))

(declare-fun m!1335061 () Bool)

(assert (=> b!1445933 m!1335061))

(declare-fun m!1335063 () Bool)

(assert (=> b!1445934 m!1335063))

(declare-fun m!1335065 () Bool)

(assert (=> start!124890 m!1335065))

(declare-fun m!1335067 () Bool)

(assert (=> start!124890 m!1335067))

(declare-fun m!1335069 () Bool)

(assert (=> b!1445928 m!1335069))

(assert (=> b!1445928 m!1335049))

(declare-fun m!1335071 () Bool)

(assert (=> b!1445920 m!1335071))

(declare-fun m!1335073 () Bool)

(assert (=> b!1445929 m!1335073))

(declare-fun m!1335075 () Bool)

(assert (=> b!1445929 m!1335075))

(assert (=> b!1445931 m!1335049))

(assert (=> b!1445931 m!1335049))

(declare-fun m!1335077 () Bool)

(assert (=> b!1445931 m!1335077))

(assert (=> b!1445935 m!1335049))

(assert (=> b!1445935 m!1335049))

(declare-fun m!1335079 () Bool)

(assert (=> b!1445935 m!1335079))

(declare-fun m!1335081 () Bool)

(assert (=> b!1445930 m!1335081))

(assert (=> b!1445925 m!1335049))

(assert (=> b!1445925 m!1335049))

(declare-fun m!1335083 () Bool)

(assert (=> b!1445925 m!1335083))

(declare-fun m!1335085 () Bool)

(assert (=> b!1445932 m!1335085))

(assert (=> b!1445932 m!1335085))

(declare-fun m!1335087 () Bool)

(assert (=> b!1445932 m!1335087))

(declare-fun m!1335089 () Bool)

(assert (=> b!1445922 m!1335089))

(declare-fun m!1335091 () Bool)

(assert (=> b!1445922 m!1335091))

(assert (=> b!1445924 m!1335059))

(declare-fun m!1335093 () Bool)

(assert (=> b!1445924 m!1335093))

(check-sat (not start!124890) (not b!1445930) (not b!1445920) (not b!1445922) (not b!1445929) (not b!1445934) (not b!1445935) (not b!1445932) (not b!1445925) (not b!1445921) (not b!1445931) (not b!1445933))
(check-sat)

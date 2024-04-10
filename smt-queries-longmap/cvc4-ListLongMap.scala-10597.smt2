; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124724 () Bool)

(assert start!124724)

(declare-fun b!1445918 () Bool)

(declare-fun res!977747 () Bool)

(declare-fun e!814444 () Bool)

(assert (=> b!1445918 (=> (not res!977747) (not e!814444))))

(declare-fun e!814439 () Bool)

(assert (=> b!1445918 (= res!977747 e!814439)))

(declare-fun c!133602 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1445918 (= c!133602 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1445919 () Bool)

(declare-fun e!814442 () Bool)

(assert (=> b!1445919 (= e!814442 e!814444)))

(declare-fun res!977749 () Bool)

(assert (=> b!1445919 (=> (not res!977749) (not e!814444))))

(declare-datatypes ((SeekEntryResult!11626 0))(
  ( (MissingZero!11626 (index!48896 (_ BitVec 32))) (Found!11626 (index!48897 (_ BitVec 32))) (Intermediate!11626 (undefined!12438 Bool) (index!48898 (_ BitVec 32)) (x!130579 (_ BitVec 32))) (Undefined!11626) (MissingVacant!11626 (index!48899 (_ BitVec 32))) )
))
(declare-fun lt!634637 () SeekEntryResult!11626)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1445919 (= res!977749 (= lt!634637 (Intermediate!11626 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-datatypes ((array!98172 0))(
  ( (array!98173 (arr!47374 (Array (_ BitVec 32) (_ BitVec 64))) (size!47924 (_ BitVec 32))) )
))
(declare-fun lt!634640 () array!98172)

(declare-fun lt!634638 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98172 (_ BitVec 32)) SeekEntryResult!11626)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1445919 (= lt!634637 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634638 mask!2687) lt!634638 lt!634640 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98172)

(assert (=> b!1445919 (= lt!634638 (select (store (arr!47374 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1445920 () Bool)

(declare-fun res!977746 () Bool)

(declare-fun e!814440 () Bool)

(assert (=> b!1445920 (=> (not res!977746) (not e!814440))))

(assert (=> b!1445920 (= res!977746 (and (= (size!47924 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47924 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47924 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1445921 () Bool)

(declare-fun res!977745 () Bool)

(assert (=> b!1445921 (=> (not res!977745) (not e!814440))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98172 (_ BitVec 32)) Bool)

(assert (=> b!1445921 (= res!977745 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1445922 () Bool)

(declare-fun res!977740 () Bool)

(assert (=> b!1445922 (=> (not res!977740) (not e!814442))))

(declare-fun lt!634639 () SeekEntryResult!11626)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1445922 (= res!977740 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47374 a!2862) j!93) a!2862 mask!2687) lt!634639))))

(declare-fun b!1445923 () Bool)

(declare-fun res!977741 () Bool)

(declare-fun e!814445 () Bool)

(assert (=> b!1445923 (=> (not res!977741) (not e!814445))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98172 (_ BitVec 32)) SeekEntryResult!11626)

(assert (=> b!1445923 (= res!977741 (= (seekEntryOrOpen!0 (select (arr!47374 a!2862) j!93) a!2862 mask!2687) (Found!11626 j!93)))))

(declare-fun b!1445924 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1445924 (= e!814445 (or (= (select (arr!47374 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47374 a!2862) intermediateBeforeIndex!19) (select (arr!47374 a!2862) j!93))))))

(declare-fun b!1445925 () Bool)

(assert (=> b!1445925 (= e!814439 (= lt!634637 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634638 lt!634640 mask!2687)))))

(declare-fun b!1445926 () Bool)

(declare-fun e!814441 () Bool)

(assert (=> b!1445926 (= e!814440 e!814441)))

(declare-fun res!977737 () Bool)

(assert (=> b!1445926 (=> (not res!977737) (not e!814441))))

(assert (=> b!1445926 (= res!977737 (= (select (store (arr!47374 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1445926 (= lt!634640 (array!98173 (store (arr!47374 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47924 a!2862)))))

(declare-fun res!977743 () Bool)

(assert (=> start!124724 (=> (not res!977743) (not e!814440))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124724 (= res!977743 (validMask!0 mask!2687))))

(assert (=> start!124724 e!814440))

(assert (=> start!124724 true))

(declare-fun array_inv!36402 (array!98172) Bool)

(assert (=> start!124724 (array_inv!36402 a!2862)))

(declare-fun b!1445927 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98172 (_ BitVec 32)) SeekEntryResult!11626)

(assert (=> b!1445927 (= e!814439 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634638 lt!634640 mask!2687) (seekEntryOrOpen!0 lt!634638 lt!634640 mask!2687)))))

(declare-fun b!1445928 () Bool)

(declare-fun res!977742 () Bool)

(assert (=> b!1445928 (=> (not res!977742) (not e!814440))))

(declare-datatypes ((List!33875 0))(
  ( (Nil!33872) (Cons!33871 (h!35221 (_ BitVec 64)) (t!48569 List!33875)) )
))
(declare-fun arrayNoDuplicates!0 (array!98172 (_ BitVec 32) List!33875) Bool)

(assert (=> b!1445928 (= res!977742 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33872))))

(declare-fun b!1445929 () Bool)

(declare-fun res!977738 () Bool)

(assert (=> b!1445929 (=> (not res!977738) (not e!814440))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1445929 (= res!977738 (validKeyInArray!0 (select (arr!47374 a!2862) i!1006)))))

(declare-fun b!1445930 () Bool)

(assert (=> b!1445930 (= e!814441 e!814442)))

(declare-fun res!977748 () Bool)

(assert (=> b!1445930 (=> (not res!977748) (not e!814442))))

(assert (=> b!1445930 (= res!977748 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47374 a!2862) j!93) mask!2687) (select (arr!47374 a!2862) j!93) a!2862 mask!2687) lt!634639))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1445930 (= lt!634639 (Intermediate!11626 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1445931 () Bool)

(declare-fun res!977736 () Bool)

(assert (=> b!1445931 (=> (not res!977736) (not e!814440))))

(assert (=> b!1445931 (= res!977736 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47924 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47924 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47924 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1445932 () Bool)

(assert (=> b!1445932 (= e!814444 (not true))))

(assert (=> b!1445932 e!814445))

(declare-fun res!977744 () Bool)

(assert (=> b!1445932 (=> (not res!977744) (not e!814445))))

(assert (=> b!1445932 (= res!977744 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48748 0))(
  ( (Unit!48749) )
))
(declare-fun lt!634641 () Unit!48748)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98172 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48748)

(assert (=> b!1445932 (= lt!634641 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1445933 () Bool)

(declare-fun res!977739 () Bool)

(assert (=> b!1445933 (=> (not res!977739) (not e!814440))))

(assert (=> b!1445933 (= res!977739 (validKeyInArray!0 (select (arr!47374 a!2862) j!93)))))

(declare-fun b!1445934 () Bool)

(declare-fun res!977735 () Bool)

(assert (=> b!1445934 (=> (not res!977735) (not e!814444))))

(assert (=> b!1445934 (= res!977735 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!124724 res!977743) b!1445920))

(assert (= (and b!1445920 res!977746) b!1445929))

(assert (= (and b!1445929 res!977738) b!1445933))

(assert (= (and b!1445933 res!977739) b!1445921))

(assert (= (and b!1445921 res!977745) b!1445928))

(assert (= (and b!1445928 res!977742) b!1445931))

(assert (= (and b!1445931 res!977736) b!1445926))

(assert (= (and b!1445926 res!977737) b!1445930))

(assert (= (and b!1445930 res!977748) b!1445922))

(assert (= (and b!1445922 res!977740) b!1445919))

(assert (= (and b!1445919 res!977749) b!1445918))

(assert (= (and b!1445918 c!133602) b!1445925))

(assert (= (and b!1445918 (not c!133602)) b!1445927))

(assert (= (and b!1445918 res!977747) b!1445934))

(assert (= (and b!1445934 res!977735) b!1445932))

(assert (= (and b!1445932 res!977744) b!1445923))

(assert (= (and b!1445923 res!977741) b!1445924))

(declare-fun m!1334841 () Bool)

(assert (=> b!1445922 m!1334841))

(assert (=> b!1445922 m!1334841))

(declare-fun m!1334843 () Bool)

(assert (=> b!1445922 m!1334843))

(declare-fun m!1334845 () Bool)

(assert (=> b!1445921 m!1334845))

(assert (=> b!1445930 m!1334841))

(assert (=> b!1445930 m!1334841))

(declare-fun m!1334847 () Bool)

(assert (=> b!1445930 m!1334847))

(assert (=> b!1445930 m!1334847))

(assert (=> b!1445930 m!1334841))

(declare-fun m!1334849 () Bool)

(assert (=> b!1445930 m!1334849))

(declare-fun m!1334851 () Bool)

(assert (=> b!1445924 m!1334851))

(assert (=> b!1445924 m!1334841))

(assert (=> b!1445923 m!1334841))

(assert (=> b!1445923 m!1334841))

(declare-fun m!1334853 () Bool)

(assert (=> b!1445923 m!1334853))

(declare-fun m!1334855 () Bool)

(assert (=> start!124724 m!1334855))

(declare-fun m!1334857 () Bool)

(assert (=> start!124724 m!1334857))

(declare-fun m!1334859 () Bool)

(assert (=> b!1445925 m!1334859))

(declare-fun m!1334861 () Bool)

(assert (=> b!1445927 m!1334861))

(declare-fun m!1334863 () Bool)

(assert (=> b!1445927 m!1334863))

(declare-fun m!1334865 () Bool)

(assert (=> b!1445926 m!1334865))

(declare-fun m!1334867 () Bool)

(assert (=> b!1445926 m!1334867))

(declare-fun m!1334869 () Bool)

(assert (=> b!1445928 m!1334869))

(declare-fun m!1334871 () Bool)

(assert (=> b!1445929 m!1334871))

(assert (=> b!1445929 m!1334871))

(declare-fun m!1334873 () Bool)

(assert (=> b!1445929 m!1334873))

(declare-fun m!1334875 () Bool)

(assert (=> b!1445932 m!1334875))

(declare-fun m!1334877 () Bool)

(assert (=> b!1445932 m!1334877))

(assert (=> b!1445933 m!1334841))

(assert (=> b!1445933 m!1334841))

(declare-fun m!1334879 () Bool)

(assert (=> b!1445933 m!1334879))

(declare-fun m!1334881 () Bool)

(assert (=> b!1445919 m!1334881))

(assert (=> b!1445919 m!1334881))

(declare-fun m!1334883 () Bool)

(assert (=> b!1445919 m!1334883))

(assert (=> b!1445919 m!1334865))

(declare-fun m!1334885 () Bool)

(assert (=> b!1445919 m!1334885))

(push 1)

(assert (not b!1445919))


; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124722 () Bool)

(assert start!124722)

(declare-fun b!1445867 () Bool)

(declare-fun res!977701 () Bool)

(declare-fun e!814418 () Bool)

(assert (=> b!1445867 (=> (not res!977701) (not e!814418))))

(declare-fun e!814420 () Bool)

(assert (=> b!1445867 (= res!977701 e!814420)))

(declare-fun c!133599 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1445867 (= c!133599 (bvsle x!665 intermediateAfterX!19))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!814422 () Bool)

(declare-fun b!1445869 () Bool)

(declare-datatypes ((array!98170 0))(
  ( (array!98171 (arr!47373 (Array (_ BitVec 32) (_ BitVec 64))) (size!47923 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98170)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1445869 (= e!814422 (or (= (select (arr!47373 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47373 a!2862) intermediateBeforeIndex!19) (select (arr!47373 a!2862) j!93))))))

(declare-fun b!1445870 () Bool)

(declare-fun res!977696 () Bool)

(declare-fun e!814423 () Bool)

(assert (=> b!1445870 (=> (not res!977696) (not e!814423))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98170 (_ BitVec 32)) Bool)

(assert (=> b!1445870 (= res!977696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1445871 () Bool)

(declare-fun res!977697 () Bool)

(assert (=> b!1445871 (=> (not res!977697) (not e!814423))))

(declare-datatypes ((List!33874 0))(
  ( (Nil!33871) (Cons!33870 (h!35220 (_ BitVec 64)) (t!48568 List!33874)) )
))
(declare-fun arrayNoDuplicates!0 (array!98170 (_ BitVec 32) List!33874) Bool)

(assert (=> b!1445871 (= res!977697 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33871))))

(declare-fun b!1445872 () Bool)

(declare-fun res!977699 () Bool)

(assert (=> b!1445872 (=> (not res!977699) (not e!814423))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1445872 (= res!977699 (validKeyInArray!0 (select (arr!47373 a!2862) i!1006)))))

(declare-datatypes ((SeekEntryResult!11625 0))(
  ( (MissingZero!11625 (index!48892 (_ BitVec 32))) (Found!11625 (index!48893 (_ BitVec 32))) (Intermediate!11625 (undefined!12437 Bool) (index!48894 (_ BitVec 32)) (x!130578 (_ BitVec 32))) (Undefined!11625) (MissingVacant!11625 (index!48895 (_ BitVec 32))) )
))
(declare-fun lt!634623 () SeekEntryResult!11625)

(declare-fun b!1445873 () Bool)

(declare-fun lt!634622 () (_ BitVec 64))

(declare-fun lt!634624 () array!98170)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98170 (_ BitVec 32)) SeekEntryResult!11625)

(assert (=> b!1445873 (= e!814420 (= lt!634623 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634622 lt!634624 mask!2687)))))

(declare-fun b!1445874 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98170 (_ BitVec 32)) SeekEntryResult!11625)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98170 (_ BitVec 32)) SeekEntryResult!11625)

(assert (=> b!1445874 (= e!814420 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634622 lt!634624 mask!2687) (seekEntryOrOpen!0 lt!634622 lt!634624 mask!2687)))))

(declare-fun b!1445875 () Bool)

(declare-fun e!814419 () Bool)

(declare-fun e!814424 () Bool)

(assert (=> b!1445875 (= e!814419 e!814424)))

(declare-fun res!977700 () Bool)

(assert (=> b!1445875 (=> (not res!977700) (not e!814424))))

(declare-fun lt!634625 () SeekEntryResult!11625)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1445875 (= res!977700 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47373 a!2862) j!93) mask!2687) (select (arr!47373 a!2862) j!93) a!2862 mask!2687) lt!634625))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1445875 (= lt!634625 (Intermediate!11625 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1445868 () Bool)

(assert (=> b!1445868 (= e!814423 e!814419)))

(declare-fun res!977702 () Bool)

(assert (=> b!1445868 (=> (not res!977702) (not e!814419))))

(assert (=> b!1445868 (= res!977702 (= (select (store (arr!47373 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1445868 (= lt!634624 (array!98171 (store (arr!47373 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47923 a!2862)))))

(declare-fun res!977694 () Bool)

(assert (=> start!124722 (=> (not res!977694) (not e!814423))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124722 (= res!977694 (validMask!0 mask!2687))))

(assert (=> start!124722 e!814423))

(assert (=> start!124722 true))

(declare-fun array_inv!36401 (array!98170) Bool)

(assert (=> start!124722 (array_inv!36401 a!2862)))

(declare-fun b!1445876 () Bool)

(declare-fun res!977703 () Bool)

(assert (=> b!1445876 (=> (not res!977703) (not e!814424))))

(assert (=> b!1445876 (= res!977703 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47373 a!2862) j!93) a!2862 mask!2687) lt!634625))))

(declare-fun b!1445877 () Bool)

(assert (=> b!1445877 (= e!814418 (not true))))

(assert (=> b!1445877 e!814422))

(declare-fun res!977692 () Bool)

(assert (=> b!1445877 (=> (not res!977692) (not e!814422))))

(assert (=> b!1445877 (= res!977692 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48746 0))(
  ( (Unit!48747) )
))
(declare-fun lt!634626 () Unit!48746)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98170 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48746)

(assert (=> b!1445877 (= lt!634626 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1445878 () Bool)

(declare-fun res!977704 () Bool)

(assert (=> b!1445878 (=> (not res!977704) (not e!814423))))

(assert (=> b!1445878 (= res!977704 (validKeyInArray!0 (select (arr!47373 a!2862) j!93)))))

(declare-fun b!1445879 () Bool)

(assert (=> b!1445879 (= e!814424 e!814418)))

(declare-fun res!977693 () Bool)

(assert (=> b!1445879 (=> (not res!977693) (not e!814418))))

(assert (=> b!1445879 (= res!977693 (= lt!634623 (Intermediate!11625 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1445879 (= lt!634623 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634622 mask!2687) lt!634622 lt!634624 mask!2687))))

(assert (=> b!1445879 (= lt!634622 (select (store (arr!47373 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1445880 () Bool)

(declare-fun res!977698 () Bool)

(assert (=> b!1445880 (=> (not res!977698) (not e!814423))))

(assert (=> b!1445880 (= res!977698 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47923 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47923 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47923 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1445881 () Bool)

(declare-fun res!977691 () Bool)

(assert (=> b!1445881 (=> (not res!977691) (not e!814423))))

(assert (=> b!1445881 (= res!977691 (and (= (size!47923 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47923 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47923 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1445882 () Bool)

(declare-fun res!977695 () Bool)

(assert (=> b!1445882 (=> (not res!977695) (not e!814418))))

(assert (=> b!1445882 (= res!977695 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1445883 () Bool)

(declare-fun res!977690 () Bool)

(assert (=> b!1445883 (=> (not res!977690) (not e!814422))))

(assert (=> b!1445883 (= res!977690 (= (seekEntryOrOpen!0 (select (arr!47373 a!2862) j!93) a!2862 mask!2687) (Found!11625 j!93)))))

(assert (= (and start!124722 res!977694) b!1445881))

(assert (= (and b!1445881 res!977691) b!1445872))

(assert (= (and b!1445872 res!977699) b!1445878))

(assert (= (and b!1445878 res!977704) b!1445870))

(assert (= (and b!1445870 res!977696) b!1445871))

(assert (= (and b!1445871 res!977697) b!1445880))

(assert (= (and b!1445880 res!977698) b!1445868))

(assert (= (and b!1445868 res!977702) b!1445875))

(assert (= (and b!1445875 res!977700) b!1445876))

(assert (= (and b!1445876 res!977703) b!1445879))

(assert (= (and b!1445879 res!977693) b!1445867))

(assert (= (and b!1445867 c!133599) b!1445873))

(assert (= (and b!1445867 (not c!133599)) b!1445874))

(assert (= (and b!1445867 res!977701) b!1445882))

(assert (= (and b!1445882 res!977695) b!1445877))

(assert (= (and b!1445877 res!977692) b!1445883))

(assert (= (and b!1445883 res!977690) b!1445869))

(declare-fun m!1334795 () Bool)

(assert (=> start!124722 m!1334795))

(declare-fun m!1334797 () Bool)

(assert (=> start!124722 m!1334797))

(declare-fun m!1334799 () Bool)

(assert (=> b!1445871 m!1334799))

(declare-fun m!1334801 () Bool)

(assert (=> b!1445870 m!1334801))

(declare-fun m!1334803 () Bool)

(assert (=> b!1445874 m!1334803))

(declare-fun m!1334805 () Bool)

(assert (=> b!1445874 m!1334805))

(declare-fun m!1334807 () Bool)

(assert (=> b!1445883 m!1334807))

(assert (=> b!1445883 m!1334807))

(declare-fun m!1334809 () Bool)

(assert (=> b!1445883 m!1334809))

(assert (=> b!1445876 m!1334807))

(assert (=> b!1445876 m!1334807))

(declare-fun m!1334811 () Bool)

(assert (=> b!1445876 m!1334811))

(declare-fun m!1334813 () Bool)

(assert (=> b!1445879 m!1334813))

(assert (=> b!1445879 m!1334813))

(declare-fun m!1334815 () Bool)

(assert (=> b!1445879 m!1334815))

(declare-fun m!1334817 () Bool)

(assert (=> b!1445879 m!1334817))

(declare-fun m!1334819 () Bool)

(assert (=> b!1445879 m!1334819))

(assert (=> b!1445878 m!1334807))

(assert (=> b!1445878 m!1334807))

(declare-fun m!1334821 () Bool)

(assert (=> b!1445878 m!1334821))

(declare-fun m!1334823 () Bool)

(assert (=> b!1445869 m!1334823))

(assert (=> b!1445869 m!1334807))

(assert (=> b!1445868 m!1334817))

(declare-fun m!1334825 () Bool)

(assert (=> b!1445868 m!1334825))

(declare-fun m!1334827 () Bool)

(assert (=> b!1445873 m!1334827))

(declare-fun m!1334829 () Bool)

(assert (=> b!1445877 m!1334829))

(declare-fun m!1334831 () Bool)

(assert (=> b!1445877 m!1334831))

(assert (=> b!1445875 m!1334807))

(assert (=> b!1445875 m!1334807))

(declare-fun m!1334833 () Bool)

(assert (=> b!1445875 m!1334833))

(assert (=> b!1445875 m!1334833))

(assert (=> b!1445875 m!1334807))

(declare-fun m!1334835 () Bool)

(assert (=> b!1445875 m!1334835))

(declare-fun m!1334837 () Bool)

(assert (=> b!1445872 m!1334837))

(assert (=> b!1445872 m!1334837))

(declare-fun m!1334839 () Bool)

(assert (=> b!1445872 m!1334839))

(check-sat (not b!1445871) (not b!1445883) (not b!1445877) (not b!1445870) (not b!1445874) (not b!1445875) (not b!1445879) (not b!1445878) (not start!124722) (not b!1445876) (not b!1445873) (not b!1445872))
(check-sat)

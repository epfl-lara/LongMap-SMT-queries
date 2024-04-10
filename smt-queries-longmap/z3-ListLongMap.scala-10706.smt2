; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125376 () Bool)

(assert start!125376)

(declare-fun res!994703 () Bool)

(declare-fun e!823630 () Bool)

(assert (=> start!125376 (=> (not res!994703) (not e!823630))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125376 (= res!994703 (validMask!0 mask!2687))))

(assert (=> start!125376 e!823630))

(assert (=> start!125376 true))

(declare-datatypes ((array!98824 0))(
  ( (array!98825 (arr!47700 (Array (_ BitVec 32) (_ BitVec 64))) (size!48250 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98824)

(declare-fun array_inv!36728 (array!98824) Bool)

(assert (=> start!125376 (array_inv!36728 a!2862)))

(declare-fun b!1465881 () Bool)

(declare-fun res!994693 () Bool)

(assert (=> b!1465881 (=> (not res!994693) (not e!823630))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1465881 (= res!994693 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48250 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48250 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48250 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1465882 () Bool)

(declare-fun res!994696 () Bool)

(assert (=> b!1465882 (=> (not res!994696) (not e!823630))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1465882 (= res!994696 (and (= (size!48250 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48250 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48250 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1465883 () Bool)

(declare-fun res!994702 () Bool)

(declare-fun e!823632 () Bool)

(assert (=> b!1465883 (=> res!994702 e!823632)))

(declare-datatypes ((SeekEntryResult!11952 0))(
  ( (MissingZero!11952 (index!50200 (_ BitVec 32))) (Found!11952 (index!50201 (_ BitVec 32))) (Intermediate!11952 (undefined!12764 Bool) (index!50202 (_ BitVec 32)) (x!131777 (_ BitVec 32))) (Undefined!11952) (MissingVacant!11952 (index!50203 (_ BitVec 32))) )
))
(declare-fun lt!641553 () SeekEntryResult!11952)

(declare-fun lt!641556 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98824 (_ BitVec 32)) SeekEntryResult!11952)

(assert (=> b!1465883 (= res!994702 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641556 (select (arr!47700 a!2862) j!93) a!2862 mask!2687) lt!641553)))))

(declare-fun b!1465884 () Bool)

(declare-fun e!823628 () Bool)

(assert (=> b!1465884 (= e!823628 e!823632)))

(declare-fun res!994692 () Bool)

(assert (=> b!1465884 (=> res!994692 e!823632)))

(assert (=> b!1465884 (= res!994692 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641556 #b00000000000000000000000000000000) (bvsge lt!641556 (size!48250 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465884 (= lt!641556 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1465885 () Bool)

(declare-fun res!994704 () Bool)

(assert (=> b!1465885 (=> (not res!994704) (not e!823630))))

(declare-datatypes ((List!34201 0))(
  ( (Nil!34198) (Cons!34197 (h!35547 (_ BitVec 64)) (t!48895 List!34201)) )
))
(declare-fun arrayNoDuplicates!0 (array!98824 (_ BitVec 32) List!34201) Bool)

(assert (=> b!1465885 (= res!994704 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34198))))

(declare-fun b!1465886 () Bool)

(declare-fun res!994699 () Bool)

(declare-fun e!823629 () Bool)

(assert (=> b!1465886 (=> (not res!994699) (not e!823629))))

(declare-fun e!823634 () Bool)

(assert (=> b!1465886 (= res!994699 e!823634)))

(declare-fun c!135108 () Bool)

(assert (=> b!1465886 (= c!135108 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1465887 () Bool)

(declare-fun res!994697 () Bool)

(assert (=> b!1465887 (=> (not res!994697) (not e!823630))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98824 (_ BitVec 32)) Bool)

(assert (=> b!1465887 (= res!994697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun lt!641555 () SeekEntryResult!11952)

(declare-fun b!1465888 () Bool)

(declare-fun e!823631 () Bool)

(declare-fun lt!641549 () array!98824)

(declare-fun lt!641552 () (_ BitVec 64))

(assert (=> b!1465888 (= e!823631 (not (= lt!641555 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641556 lt!641552 lt!641549 mask!2687))))))

(declare-fun b!1465889 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98824 (_ BitVec 32)) SeekEntryResult!11952)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98824 (_ BitVec 32)) SeekEntryResult!11952)

(assert (=> b!1465889 (= e!823631 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641556 intermediateAfterIndex!19 lt!641552 lt!641549 mask!2687) (seekEntryOrOpen!0 lt!641552 lt!641549 mask!2687))))))

(declare-fun b!1465890 () Bool)

(declare-fun res!994694 () Bool)

(assert (=> b!1465890 (=> (not res!994694) (not e!823630))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1465890 (= res!994694 (validKeyInArray!0 (select (arr!47700 a!2862) j!93)))))

(declare-fun b!1465891 () Bool)

(assert (=> b!1465891 (= e!823629 (not e!823628))))

(declare-fun res!994695 () Bool)

(assert (=> b!1465891 (=> res!994695 e!823628)))

(assert (=> b!1465891 (= res!994695 (or (and (= (select (arr!47700 a!2862) index!646) (select (store (arr!47700 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47700 a!2862) index!646) (select (arr!47700 a!2862) j!93))) (= (select (arr!47700 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun lt!641551 () SeekEntryResult!11952)

(assert (=> b!1465891 (and (= lt!641551 (Found!11952 j!93)) (or (= (select (arr!47700 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47700 a!2862) intermediateBeforeIndex!19) (select (arr!47700 a!2862) j!93))))))

(assert (=> b!1465891 (= lt!641551 (seekEntryOrOpen!0 (select (arr!47700 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1465891 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49400 0))(
  ( (Unit!49401) )
))
(declare-fun lt!641550 () Unit!49400)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98824 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49400)

(assert (=> b!1465891 (= lt!641550 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1465892 () Bool)

(declare-fun res!994689 () Bool)

(declare-fun e!823633 () Bool)

(assert (=> b!1465892 (=> (not res!994689) (not e!823633))))

(assert (=> b!1465892 (= res!994689 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47700 a!2862) j!93) a!2862 mask!2687) lt!641553))))

(declare-fun b!1465893 () Bool)

(assert (=> b!1465893 (= e!823633 e!823629)))

(declare-fun res!994690 () Bool)

(assert (=> b!1465893 (=> (not res!994690) (not e!823629))))

(assert (=> b!1465893 (= res!994690 (= lt!641555 (Intermediate!11952 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465893 (= lt!641555 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641552 mask!2687) lt!641552 lt!641549 mask!2687))))

(assert (=> b!1465893 (= lt!641552 (select (store (arr!47700 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1465894 () Bool)

(assert (=> b!1465894 (= e!823634 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641552 lt!641549 mask!2687) (seekEntryOrOpen!0 lt!641552 lt!641549 mask!2687)))))

(declare-fun b!1465895 () Bool)

(declare-fun res!994698 () Bool)

(assert (=> b!1465895 (=> res!994698 e!823632)))

(assert (=> b!1465895 (= res!994698 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1465896 () Bool)

(declare-fun res!994701 () Bool)

(assert (=> b!1465896 (=> (not res!994701) (not e!823630))))

(assert (=> b!1465896 (= res!994701 (validKeyInArray!0 (select (arr!47700 a!2862) i!1006)))))

(declare-fun b!1465897 () Bool)

(assert (=> b!1465897 (= e!823632 true)))

(assert (=> b!1465897 (= lt!641551 (seekEntryOrOpen!0 lt!641552 lt!641549 mask!2687))))

(declare-fun lt!641554 () Unit!49400)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98824 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49400)

(assert (=> b!1465897 (= lt!641554 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!641556 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1465898 () Bool)

(assert (=> b!1465898 (= e!823634 (= lt!641555 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641552 lt!641549 mask!2687)))))

(declare-fun b!1465899 () Bool)

(declare-fun e!823626 () Bool)

(assert (=> b!1465899 (= e!823630 e!823626)))

(declare-fun res!994691 () Bool)

(assert (=> b!1465899 (=> (not res!994691) (not e!823626))))

(assert (=> b!1465899 (= res!994691 (= (select (store (arr!47700 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1465899 (= lt!641549 (array!98825 (store (arr!47700 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48250 a!2862)))))

(declare-fun b!1465900 () Bool)

(assert (=> b!1465900 (= e!823626 e!823633)))

(declare-fun res!994705 () Bool)

(assert (=> b!1465900 (=> (not res!994705) (not e!823633))))

(assert (=> b!1465900 (= res!994705 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47700 a!2862) j!93) mask!2687) (select (arr!47700 a!2862) j!93) a!2862 mask!2687) lt!641553))))

(assert (=> b!1465900 (= lt!641553 (Intermediate!11952 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1465901 () Bool)

(declare-fun res!994688 () Bool)

(assert (=> b!1465901 (=> (not res!994688) (not e!823629))))

(assert (=> b!1465901 (= res!994688 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1465902 () Bool)

(declare-fun res!994700 () Bool)

(assert (=> b!1465902 (=> res!994700 e!823632)))

(assert (=> b!1465902 (= res!994700 e!823631)))

(declare-fun c!135107 () Bool)

(assert (=> b!1465902 (= c!135107 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(assert (= (and start!125376 res!994703) b!1465882))

(assert (= (and b!1465882 res!994696) b!1465896))

(assert (= (and b!1465896 res!994701) b!1465890))

(assert (= (and b!1465890 res!994694) b!1465887))

(assert (= (and b!1465887 res!994697) b!1465885))

(assert (= (and b!1465885 res!994704) b!1465881))

(assert (= (and b!1465881 res!994693) b!1465899))

(assert (= (and b!1465899 res!994691) b!1465900))

(assert (= (and b!1465900 res!994705) b!1465892))

(assert (= (and b!1465892 res!994689) b!1465893))

(assert (= (and b!1465893 res!994690) b!1465886))

(assert (= (and b!1465886 c!135108) b!1465898))

(assert (= (and b!1465886 (not c!135108)) b!1465894))

(assert (= (and b!1465886 res!994699) b!1465901))

(assert (= (and b!1465901 res!994688) b!1465891))

(assert (= (and b!1465891 (not res!994695)) b!1465884))

(assert (= (and b!1465884 (not res!994692)) b!1465883))

(assert (= (and b!1465883 (not res!994702)) b!1465902))

(assert (= (and b!1465902 c!135107) b!1465888))

(assert (= (and b!1465902 (not c!135107)) b!1465889))

(assert (= (and b!1465902 (not res!994700)) b!1465895))

(assert (= (and b!1465895 (not res!994698)) b!1465897))

(declare-fun m!1352923 () Bool)

(assert (=> b!1465893 m!1352923))

(assert (=> b!1465893 m!1352923))

(declare-fun m!1352925 () Bool)

(assert (=> b!1465893 m!1352925))

(declare-fun m!1352927 () Bool)

(assert (=> b!1465893 m!1352927))

(declare-fun m!1352929 () Bool)

(assert (=> b!1465893 m!1352929))

(declare-fun m!1352931 () Bool)

(assert (=> b!1465884 m!1352931))

(declare-fun m!1352933 () Bool)

(assert (=> b!1465889 m!1352933))

(declare-fun m!1352935 () Bool)

(assert (=> b!1465889 m!1352935))

(declare-fun m!1352937 () Bool)

(assert (=> b!1465891 m!1352937))

(assert (=> b!1465891 m!1352927))

(declare-fun m!1352939 () Bool)

(assert (=> b!1465891 m!1352939))

(declare-fun m!1352941 () Bool)

(assert (=> b!1465891 m!1352941))

(declare-fun m!1352943 () Bool)

(assert (=> b!1465891 m!1352943))

(declare-fun m!1352945 () Bool)

(assert (=> b!1465891 m!1352945))

(declare-fun m!1352947 () Bool)

(assert (=> b!1465891 m!1352947))

(declare-fun m!1352949 () Bool)

(assert (=> b!1465891 m!1352949))

(assert (=> b!1465891 m!1352945))

(assert (=> b!1465883 m!1352945))

(assert (=> b!1465883 m!1352945))

(declare-fun m!1352951 () Bool)

(assert (=> b!1465883 m!1352951))

(assert (=> b!1465897 m!1352935))

(declare-fun m!1352953 () Bool)

(assert (=> b!1465897 m!1352953))

(assert (=> b!1465892 m!1352945))

(assert (=> b!1465892 m!1352945))

(declare-fun m!1352955 () Bool)

(assert (=> b!1465892 m!1352955))

(declare-fun m!1352957 () Bool)

(assert (=> b!1465896 m!1352957))

(assert (=> b!1465896 m!1352957))

(declare-fun m!1352959 () Bool)

(assert (=> b!1465896 m!1352959))

(declare-fun m!1352961 () Bool)

(assert (=> b!1465898 m!1352961))

(assert (=> b!1465890 m!1352945))

(assert (=> b!1465890 m!1352945))

(declare-fun m!1352963 () Bool)

(assert (=> b!1465890 m!1352963))

(declare-fun m!1352965 () Bool)

(assert (=> b!1465887 m!1352965))

(assert (=> b!1465900 m!1352945))

(assert (=> b!1465900 m!1352945))

(declare-fun m!1352967 () Bool)

(assert (=> b!1465900 m!1352967))

(assert (=> b!1465900 m!1352967))

(assert (=> b!1465900 m!1352945))

(declare-fun m!1352969 () Bool)

(assert (=> b!1465900 m!1352969))

(declare-fun m!1352971 () Bool)

(assert (=> start!125376 m!1352971))

(declare-fun m!1352973 () Bool)

(assert (=> start!125376 m!1352973))

(declare-fun m!1352975 () Bool)

(assert (=> b!1465885 m!1352975))

(declare-fun m!1352977 () Bool)

(assert (=> b!1465894 m!1352977))

(assert (=> b!1465894 m!1352935))

(declare-fun m!1352979 () Bool)

(assert (=> b!1465888 m!1352979))

(assert (=> b!1465899 m!1352927))

(declare-fun m!1352981 () Bool)

(assert (=> b!1465899 m!1352981))

(check-sat (not b!1465898) (not b!1465884) (not b!1465888) (not b!1465893) (not b!1465889) (not b!1465892) (not b!1465887) (not start!125376) (not b!1465885) (not b!1465900) (not b!1465897) (not b!1465894) (not b!1465883) (not b!1465896) (not b!1465890) (not b!1465891))
(check-sat)

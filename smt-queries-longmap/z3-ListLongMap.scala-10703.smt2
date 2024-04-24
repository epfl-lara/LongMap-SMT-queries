; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125634 () Bool)

(assert start!125634)

(declare-fun b!1466929 () Bool)

(declare-fun res!994766 () Bool)

(declare-fun e!824394 () Bool)

(assert (=> b!1466929 (=> (not res!994766) (not e!824394))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98920 0))(
  ( (array!98921 (arr!47743 (Array (_ BitVec 32) (_ BitVec 64))) (size!48294 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98920)

(assert (=> b!1466929 (= res!994766 (and (= (size!48294 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48294 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48294 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1466930 () Bool)

(declare-fun res!994761 () Bool)

(declare-fun e!824401 () Bool)

(assert (=> b!1466930 (=> (not res!994761) (not e!824401))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11892 0))(
  ( (MissingZero!11892 (index!49960 (_ BitVec 32))) (Found!11892 (index!49961 (_ BitVec 32))) (Intermediate!11892 (undefined!12704 Bool) (index!49962 (_ BitVec 32)) (x!131726 (_ BitVec 32))) (Undefined!11892) (MissingVacant!11892 (index!49963 (_ BitVec 32))) )
))
(declare-fun lt!641971 () SeekEntryResult!11892)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98920 (_ BitVec 32)) SeekEntryResult!11892)

(assert (=> b!1466930 (= res!994761 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47743 a!2862) j!93) a!2862 mask!2687) lt!641971))))

(declare-fun b!1466931 () Bool)

(declare-fun e!824403 () Bool)

(assert (=> b!1466931 (= e!824403 e!824401)))

(declare-fun res!994765 () Bool)

(assert (=> b!1466931 (=> (not res!994765) (not e!824401))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466931 (= res!994765 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47743 a!2862) j!93) mask!2687) (select (arr!47743 a!2862) j!93) a!2862 mask!2687) lt!641971))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1466931 (= lt!641971 (Intermediate!11892 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1466932 () Bool)

(declare-fun res!994768 () Bool)

(assert (=> b!1466932 (=> (not res!994768) (not e!824394))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1466932 (= res!994768 (validKeyInArray!0 (select (arr!47743 a!2862) j!93)))))

(declare-fun e!824398 () Bool)

(declare-fun b!1466933 () Bool)

(assert (=> b!1466933 (= e!824398 (or (= (select (arr!47743 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47743 a!2862) intermediateBeforeIndex!19) (select (arr!47743 a!2862) j!93))))))

(declare-fun b!1466934 () Bool)

(declare-fun res!994772 () Bool)

(assert (=> b!1466934 (=> (not res!994772) (not e!824394))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1466934 (= res!994772 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48294 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48294 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48294 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1466935 () Bool)

(declare-fun res!994759 () Bool)

(assert (=> b!1466935 (=> (not res!994759) (not e!824394))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98920 (_ BitVec 32)) Bool)

(assert (=> b!1466935 (= res!994759 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun lt!641975 () (_ BitVec 32))

(declare-fun lt!641973 () (_ BitVec 64))

(declare-fun lt!641976 () SeekEntryResult!11892)

(declare-fun e!824399 () Bool)

(declare-fun lt!641977 () array!98920)

(declare-fun b!1466936 () Bool)

(assert (=> b!1466936 (= e!824399 (not (= lt!641976 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641975 lt!641973 lt!641977 mask!2687))))))

(declare-fun b!1466937 () Bool)

(declare-fun e!824400 () Bool)

(declare-fun e!824396 () Bool)

(assert (=> b!1466937 (= e!824400 (not e!824396))))

(declare-fun res!994760 () Bool)

(assert (=> b!1466937 (=> res!994760 e!824396)))

(assert (=> b!1466937 (= res!994760 (or (and (= (select (arr!47743 a!2862) index!646) (select (store (arr!47743 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47743 a!2862) index!646) (select (arr!47743 a!2862) j!93))) (= (select (arr!47743 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1466937 e!824398))

(declare-fun res!994775 () Bool)

(assert (=> b!1466937 (=> (not res!994775) (not e!824398))))

(assert (=> b!1466937 (= res!994775 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49313 0))(
  ( (Unit!49314) )
))
(declare-fun lt!641972 () Unit!49313)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98920 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49313)

(assert (=> b!1466937 (= lt!641972 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1466938 () Bool)

(declare-fun res!994758 () Bool)

(assert (=> b!1466938 (=> (not res!994758) (not e!824394))))

(declare-datatypes ((List!34231 0))(
  ( (Nil!34228) (Cons!34227 (h!35591 (_ BitVec 64)) (t!48917 List!34231)) )
))
(declare-fun arrayNoDuplicates!0 (array!98920 (_ BitVec 32) List!34231) Bool)

(assert (=> b!1466938 (= res!994758 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34228))))

(declare-fun res!994764 () Bool)

(assert (=> start!125634 (=> (not res!994764) (not e!824394))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125634 (= res!994764 (validMask!0 mask!2687))))

(assert (=> start!125634 e!824394))

(assert (=> start!125634 true))

(declare-fun array_inv!37024 (array!98920) Bool)

(assert (=> start!125634 (array_inv!37024 a!2862)))

(declare-fun b!1466939 () Bool)

(declare-fun e!824402 () Bool)

(assert (=> b!1466939 (= e!824402 (= lt!641976 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641973 lt!641977 mask!2687)))))

(declare-fun b!1466940 () Bool)

(declare-fun res!994767 () Bool)

(assert (=> b!1466940 (=> (not res!994767) (not e!824400))))

(assert (=> b!1466940 (= res!994767 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1466941 () Bool)

(declare-fun res!994771 () Bool)

(assert (=> b!1466941 (=> (not res!994771) (not e!824394))))

(assert (=> b!1466941 (= res!994771 (validKeyInArray!0 (select (arr!47743 a!2862) i!1006)))))

(declare-fun b!1466942 () Bool)

(assert (=> b!1466942 (= e!824394 e!824403)))

(declare-fun res!994773 () Bool)

(assert (=> b!1466942 (=> (not res!994773) (not e!824403))))

(assert (=> b!1466942 (= res!994773 (= (select (store (arr!47743 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1466942 (= lt!641977 (array!98921 (store (arr!47743 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48294 a!2862)))))

(declare-fun b!1466943 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98920 (_ BitVec 32)) SeekEntryResult!11892)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98920 (_ BitVec 32)) SeekEntryResult!11892)

(assert (=> b!1466943 (= e!824402 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641973 lt!641977 mask!2687) (seekEntryOrOpen!0 lt!641973 lt!641977 mask!2687)))))

(declare-fun b!1466944 () Bool)

(assert (=> b!1466944 (= e!824399 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641975 intermediateAfterIndex!19 lt!641973 lt!641977 mask!2687) (seekEntryOrOpen!0 lt!641973 lt!641977 mask!2687))))))

(declare-fun b!1466945 () Bool)

(declare-fun e!824397 () Bool)

(assert (=> b!1466945 (= e!824397 true)))

(declare-fun lt!641974 () Bool)

(assert (=> b!1466945 (= lt!641974 e!824399)))

(declare-fun c!135606 () Bool)

(assert (=> b!1466945 (= c!135606 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1466946 () Bool)

(declare-fun res!994762 () Bool)

(assert (=> b!1466946 (=> (not res!994762) (not e!824398))))

(assert (=> b!1466946 (= res!994762 (= (seekEntryOrOpen!0 (select (arr!47743 a!2862) j!93) a!2862 mask!2687) (Found!11892 j!93)))))

(declare-fun b!1466947 () Bool)

(assert (=> b!1466947 (= e!824401 e!824400)))

(declare-fun res!994770 () Bool)

(assert (=> b!1466947 (=> (not res!994770) (not e!824400))))

(assert (=> b!1466947 (= res!994770 (= lt!641976 (Intermediate!11892 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1466947 (= lt!641976 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641973 mask!2687) lt!641973 lt!641977 mask!2687))))

(assert (=> b!1466947 (= lt!641973 (select (store (arr!47743 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1466948 () Bool)

(declare-fun res!994769 () Bool)

(assert (=> b!1466948 (=> res!994769 e!824397)))

(assert (=> b!1466948 (= res!994769 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641975 (select (arr!47743 a!2862) j!93) a!2862 mask!2687) lt!641971)))))

(declare-fun b!1466949 () Bool)

(assert (=> b!1466949 (= e!824396 e!824397)))

(declare-fun res!994774 () Bool)

(assert (=> b!1466949 (=> res!994774 e!824397)))

(assert (=> b!1466949 (= res!994774 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641975 #b00000000000000000000000000000000) (bvsge lt!641975 (size!48294 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466949 (= lt!641975 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1466950 () Bool)

(declare-fun res!994763 () Bool)

(assert (=> b!1466950 (=> (not res!994763) (not e!824400))))

(assert (=> b!1466950 (= res!994763 e!824402)))

(declare-fun c!135607 () Bool)

(assert (=> b!1466950 (= c!135607 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!125634 res!994764) b!1466929))

(assert (= (and b!1466929 res!994766) b!1466941))

(assert (= (and b!1466941 res!994771) b!1466932))

(assert (= (and b!1466932 res!994768) b!1466935))

(assert (= (and b!1466935 res!994759) b!1466938))

(assert (= (and b!1466938 res!994758) b!1466934))

(assert (= (and b!1466934 res!994772) b!1466942))

(assert (= (and b!1466942 res!994773) b!1466931))

(assert (= (and b!1466931 res!994765) b!1466930))

(assert (= (and b!1466930 res!994761) b!1466947))

(assert (= (and b!1466947 res!994770) b!1466950))

(assert (= (and b!1466950 c!135607) b!1466939))

(assert (= (and b!1466950 (not c!135607)) b!1466943))

(assert (= (and b!1466950 res!994763) b!1466940))

(assert (= (and b!1466940 res!994767) b!1466937))

(assert (= (and b!1466937 res!994775) b!1466946))

(assert (= (and b!1466946 res!994762) b!1466933))

(assert (= (and b!1466937 (not res!994760)) b!1466949))

(assert (= (and b!1466949 (not res!994774)) b!1466948))

(assert (= (and b!1466948 (not res!994769)) b!1466945))

(assert (= (and b!1466945 c!135606) b!1466936))

(assert (= (and b!1466945 (not c!135606)) b!1466944))

(declare-fun m!1354027 () Bool)

(assert (=> b!1466930 m!1354027))

(assert (=> b!1466930 m!1354027))

(declare-fun m!1354029 () Bool)

(assert (=> b!1466930 m!1354029))

(declare-fun m!1354031 () Bool)

(assert (=> b!1466937 m!1354031))

(declare-fun m!1354033 () Bool)

(assert (=> b!1466937 m!1354033))

(declare-fun m!1354035 () Bool)

(assert (=> b!1466937 m!1354035))

(declare-fun m!1354037 () Bool)

(assert (=> b!1466937 m!1354037))

(declare-fun m!1354039 () Bool)

(assert (=> b!1466937 m!1354039))

(assert (=> b!1466937 m!1354027))

(declare-fun m!1354041 () Bool)

(assert (=> b!1466941 m!1354041))

(assert (=> b!1466941 m!1354041))

(declare-fun m!1354043 () Bool)

(assert (=> b!1466941 m!1354043))

(assert (=> b!1466946 m!1354027))

(assert (=> b!1466946 m!1354027))

(declare-fun m!1354045 () Bool)

(assert (=> b!1466946 m!1354045))

(declare-fun m!1354047 () Bool)

(assert (=> b!1466936 m!1354047))

(declare-fun m!1354049 () Bool)

(assert (=> start!125634 m!1354049))

(declare-fun m!1354051 () Bool)

(assert (=> start!125634 m!1354051))

(declare-fun m!1354053 () Bool)

(assert (=> b!1466947 m!1354053))

(assert (=> b!1466947 m!1354053))

(declare-fun m!1354055 () Bool)

(assert (=> b!1466947 m!1354055))

(assert (=> b!1466947 m!1354033))

(declare-fun m!1354057 () Bool)

(assert (=> b!1466947 m!1354057))

(assert (=> b!1466942 m!1354033))

(declare-fun m!1354059 () Bool)

(assert (=> b!1466942 m!1354059))

(assert (=> b!1466932 m!1354027))

(assert (=> b!1466932 m!1354027))

(declare-fun m!1354061 () Bool)

(assert (=> b!1466932 m!1354061))

(declare-fun m!1354063 () Bool)

(assert (=> b!1466938 m!1354063))

(declare-fun m!1354065 () Bool)

(assert (=> b!1466944 m!1354065))

(declare-fun m!1354067 () Bool)

(assert (=> b!1466944 m!1354067))

(assert (=> b!1466931 m!1354027))

(assert (=> b!1466931 m!1354027))

(declare-fun m!1354069 () Bool)

(assert (=> b!1466931 m!1354069))

(assert (=> b!1466931 m!1354069))

(assert (=> b!1466931 m!1354027))

(declare-fun m!1354071 () Bool)

(assert (=> b!1466931 m!1354071))

(declare-fun m!1354073 () Bool)

(assert (=> b!1466933 m!1354073))

(assert (=> b!1466933 m!1354027))

(assert (=> b!1466948 m!1354027))

(assert (=> b!1466948 m!1354027))

(declare-fun m!1354075 () Bool)

(assert (=> b!1466948 m!1354075))

(declare-fun m!1354077 () Bool)

(assert (=> b!1466935 m!1354077))

(declare-fun m!1354079 () Bool)

(assert (=> b!1466949 m!1354079))

(declare-fun m!1354081 () Bool)

(assert (=> b!1466943 m!1354081))

(assert (=> b!1466943 m!1354067))

(declare-fun m!1354083 () Bool)

(assert (=> b!1466939 m!1354083))

(check-sat (not b!1466941) (not b!1466931) (not b!1466947) (not b!1466938) (not b!1466932) (not b!1466948) (not b!1466930) (not b!1466944) (not b!1466939) (not start!125634) (not b!1466935) (not b!1466949) (not b!1466943) (not b!1466937) (not b!1466936) (not b!1466946))
(check-sat)

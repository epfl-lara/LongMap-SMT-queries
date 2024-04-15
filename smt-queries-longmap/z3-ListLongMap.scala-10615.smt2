; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124798 () Bool)

(assert start!124798)

(declare-fun b!1448631 () Bool)

(declare-fun res!980254 () Bool)

(declare-fun e!815800 () Bool)

(assert (=> b!1448631 (=> (not res!980254) (not e!815800))))

(declare-fun e!815806 () Bool)

(assert (=> b!1448631 (= res!980254 e!815806)))

(declare-fun c!133702 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1448631 (= c!133702 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1448632 () Bool)

(declare-fun res!980259 () Bool)

(declare-fun e!815799 () Bool)

(assert (=> b!1448632 (=> (not res!980259) (not e!815799))))

(declare-datatypes ((array!98224 0))(
  ( (array!98225 (arr!47401 (Array (_ BitVec 32) (_ BitVec 64))) (size!47953 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98224)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98224 (_ BitVec 32)) Bool)

(assert (=> b!1448632 (= res!980259 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1448633 () Bool)

(declare-fun e!815802 () Bool)

(assert (=> b!1448633 (= e!815800 (not e!815802))))

(declare-fun res!980266 () Bool)

(assert (=> b!1448633 (=> res!980266 e!815802)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1448633 (= res!980266 (or (and (= (select (arr!47401 a!2862) index!646) (select (store (arr!47401 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47401 a!2862) index!646) (select (arr!47401 a!2862) j!93))) (not (= (select (arr!47401 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47401 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!815805 () Bool)

(assert (=> b!1448633 e!815805))

(declare-fun res!980258 () Bool)

(assert (=> b!1448633 (=> (not res!980258) (not e!815805))))

(declare-datatypes ((SeekEntryResult!11678 0))(
  ( (MissingZero!11678 (index!49104 (_ BitVec 32))) (Found!11678 (index!49105 (_ BitVec 32))) (Intermediate!11678 (undefined!12490 Bool) (index!49106 (_ BitVec 32)) (x!130770 (_ BitVec 32))) (Undefined!11678) (MissingVacant!11678 (index!49107 (_ BitVec 32))) )
))
(declare-fun lt!635444 () SeekEntryResult!11678)

(assert (=> b!1448633 (= res!980258 (and (= lt!635444 (Found!11678 j!93)) (or (= (select (arr!47401 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47401 a!2862) intermediateBeforeIndex!19) (select (arr!47401 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98224 (_ BitVec 32)) SeekEntryResult!11678)

(assert (=> b!1448633 (= lt!635444 (seekEntryOrOpen!0 (select (arr!47401 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1448633 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48693 0))(
  ( (Unit!48694) )
))
(declare-fun lt!635439 () Unit!48693)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98224 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48693)

(assert (=> b!1448633 (= lt!635439 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1448634 () Bool)

(declare-fun e!815801 () Bool)

(declare-fun e!815808 () Bool)

(assert (=> b!1448634 (= e!815801 e!815808)))

(declare-fun res!980269 () Bool)

(assert (=> b!1448634 (=> (not res!980269) (not e!815808))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98224 (_ BitVec 32)) SeekEntryResult!11678)

(assert (=> b!1448634 (= res!980269 (= lt!635444 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47401 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1448635 () Bool)

(assert (=> b!1448635 (= e!815805 e!815801)))

(declare-fun res!980256 () Bool)

(assert (=> b!1448635 (=> res!980256 e!815801)))

(assert (=> b!1448635 (= res!980256 (or (and (= (select (arr!47401 a!2862) index!646) (select (store (arr!47401 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47401 a!2862) index!646) (select (arr!47401 a!2862) j!93))) (not (= (select (arr!47401 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1448636 () Bool)

(declare-fun e!815804 () Bool)

(assert (=> b!1448636 (= e!815804 e!815800)))

(declare-fun res!980264 () Bool)

(assert (=> b!1448636 (=> (not res!980264) (not e!815800))))

(declare-fun lt!635443 () SeekEntryResult!11678)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1448636 (= res!980264 (= lt!635443 (Intermediate!11678 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!635445 () array!98224)

(declare-fun lt!635440 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98224 (_ BitVec 32)) SeekEntryResult!11678)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1448636 (= lt!635443 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635440 mask!2687) lt!635440 lt!635445 mask!2687))))

(assert (=> b!1448636 (= lt!635440 (select (store (arr!47401 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1448637 () Bool)

(declare-fun e!815803 () Bool)

(assert (=> b!1448637 (= e!815803 e!815804)))

(declare-fun res!980268 () Bool)

(assert (=> b!1448637 (=> (not res!980268) (not e!815804))))

(declare-fun lt!635441 () SeekEntryResult!11678)

(assert (=> b!1448637 (= res!980268 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47401 a!2862) j!93) mask!2687) (select (arr!47401 a!2862) j!93) a!2862 mask!2687) lt!635441))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1448637 (= lt!635441 (Intermediate!11678 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!980265 () Bool)

(assert (=> start!124798 (=> (not res!980265) (not e!815799))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124798 (= res!980265 (validMask!0 mask!2687))))

(assert (=> start!124798 e!815799))

(assert (=> start!124798 true))

(declare-fun array_inv!36634 (array!98224) Bool)

(assert (=> start!124798 (array_inv!36634 a!2862)))

(declare-fun b!1448638 () Bool)

(declare-fun res!980255 () Bool)

(assert (=> b!1448638 (=> (not res!980255) (not e!815799))))

(assert (=> b!1448638 (= res!980255 (and (= (size!47953 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47953 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47953 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1448639 () Bool)

(declare-fun res!980260 () Bool)

(assert (=> b!1448639 (=> (not res!980260) (not e!815799))))

(assert (=> b!1448639 (= res!980260 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47953 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47953 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47953 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1448640 () Bool)

(assert (=> b!1448640 (= e!815806 (= lt!635443 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635440 lt!635445 mask!2687)))))

(declare-fun b!1448641 () Bool)

(assert (=> b!1448641 (= e!815808 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1448642 () Bool)

(declare-fun res!980262 () Bool)

(assert (=> b!1448642 (=> (not res!980262) (not e!815799))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1448642 (= res!980262 (validKeyInArray!0 (select (arr!47401 a!2862) i!1006)))))

(declare-fun b!1448643 () Bool)

(declare-fun res!980257 () Bool)

(assert (=> b!1448643 (=> (not res!980257) (not e!815799))))

(assert (=> b!1448643 (= res!980257 (validKeyInArray!0 (select (arr!47401 a!2862) j!93)))))

(declare-fun b!1448644 () Bool)

(assert (=> b!1448644 (= e!815802 true)))

(declare-fun lt!635442 () SeekEntryResult!11678)

(assert (=> b!1448644 (= lt!635442 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47401 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1448645 () Bool)

(assert (=> b!1448645 (= e!815806 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635440 lt!635445 mask!2687) (seekEntryOrOpen!0 lt!635440 lt!635445 mask!2687)))))

(declare-fun b!1448646 () Bool)

(declare-fun res!980253 () Bool)

(assert (=> b!1448646 (=> (not res!980253) (not e!815799))))

(declare-datatypes ((List!33980 0))(
  ( (Nil!33977) (Cons!33976 (h!35326 (_ BitVec 64)) (t!48666 List!33980)) )
))
(declare-fun arrayNoDuplicates!0 (array!98224 (_ BitVec 32) List!33980) Bool)

(assert (=> b!1448646 (= res!980253 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33977))))

(declare-fun b!1448647 () Bool)

(declare-fun res!980261 () Bool)

(assert (=> b!1448647 (=> (not res!980261) (not e!815804))))

(assert (=> b!1448647 (= res!980261 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47401 a!2862) j!93) a!2862 mask!2687) lt!635441))))

(declare-fun b!1448648 () Bool)

(assert (=> b!1448648 (= e!815799 e!815803)))

(declare-fun res!980263 () Bool)

(assert (=> b!1448648 (=> (not res!980263) (not e!815803))))

(assert (=> b!1448648 (= res!980263 (= (select (store (arr!47401 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1448648 (= lt!635445 (array!98225 (store (arr!47401 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47953 a!2862)))))

(declare-fun b!1448649 () Bool)

(declare-fun res!980267 () Bool)

(assert (=> b!1448649 (=> (not res!980267) (not e!815800))))

(assert (=> b!1448649 (= res!980267 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!124798 res!980265) b!1448638))

(assert (= (and b!1448638 res!980255) b!1448642))

(assert (= (and b!1448642 res!980262) b!1448643))

(assert (= (and b!1448643 res!980257) b!1448632))

(assert (= (and b!1448632 res!980259) b!1448646))

(assert (= (and b!1448646 res!980253) b!1448639))

(assert (= (and b!1448639 res!980260) b!1448648))

(assert (= (and b!1448648 res!980263) b!1448637))

(assert (= (and b!1448637 res!980268) b!1448647))

(assert (= (and b!1448647 res!980261) b!1448636))

(assert (= (and b!1448636 res!980264) b!1448631))

(assert (= (and b!1448631 c!133702) b!1448640))

(assert (= (and b!1448631 (not c!133702)) b!1448645))

(assert (= (and b!1448631 res!980254) b!1448649))

(assert (= (and b!1448649 res!980267) b!1448633))

(assert (= (and b!1448633 res!980258) b!1448635))

(assert (= (and b!1448635 (not res!980256)) b!1448634))

(assert (= (and b!1448634 res!980269) b!1448641))

(assert (= (and b!1448633 (not res!980266)) b!1448644))

(declare-fun m!1336893 () Bool)

(assert (=> b!1448647 m!1336893))

(assert (=> b!1448647 m!1336893))

(declare-fun m!1336895 () Bool)

(assert (=> b!1448647 m!1336895))

(assert (=> b!1448643 m!1336893))

(assert (=> b!1448643 m!1336893))

(declare-fun m!1336897 () Bool)

(assert (=> b!1448643 m!1336897))

(declare-fun m!1336899 () Bool)

(assert (=> b!1448645 m!1336899))

(declare-fun m!1336901 () Bool)

(assert (=> b!1448645 m!1336901))

(assert (=> b!1448634 m!1336893))

(assert (=> b!1448634 m!1336893))

(declare-fun m!1336903 () Bool)

(assert (=> b!1448634 m!1336903))

(declare-fun m!1336905 () Bool)

(assert (=> b!1448646 m!1336905))

(declare-fun m!1336907 () Bool)

(assert (=> b!1448642 m!1336907))

(assert (=> b!1448642 m!1336907))

(declare-fun m!1336909 () Bool)

(assert (=> b!1448642 m!1336909))

(declare-fun m!1336911 () Bool)

(assert (=> b!1448648 m!1336911))

(declare-fun m!1336913 () Bool)

(assert (=> b!1448648 m!1336913))

(declare-fun m!1336915 () Bool)

(assert (=> b!1448635 m!1336915))

(assert (=> b!1448635 m!1336911))

(declare-fun m!1336917 () Bool)

(assert (=> b!1448635 m!1336917))

(assert (=> b!1448635 m!1336893))

(assert (=> b!1448637 m!1336893))

(assert (=> b!1448637 m!1336893))

(declare-fun m!1336919 () Bool)

(assert (=> b!1448637 m!1336919))

(assert (=> b!1448637 m!1336919))

(assert (=> b!1448637 m!1336893))

(declare-fun m!1336921 () Bool)

(assert (=> b!1448637 m!1336921))

(declare-fun m!1336923 () Bool)

(assert (=> start!124798 m!1336923))

(declare-fun m!1336925 () Bool)

(assert (=> start!124798 m!1336925))

(declare-fun m!1336927 () Bool)

(assert (=> b!1448640 m!1336927))

(declare-fun m!1336929 () Bool)

(assert (=> b!1448633 m!1336929))

(assert (=> b!1448633 m!1336911))

(declare-fun m!1336931 () Bool)

(assert (=> b!1448633 m!1336931))

(assert (=> b!1448633 m!1336917))

(assert (=> b!1448633 m!1336915))

(assert (=> b!1448633 m!1336893))

(declare-fun m!1336933 () Bool)

(assert (=> b!1448633 m!1336933))

(declare-fun m!1336935 () Bool)

(assert (=> b!1448633 m!1336935))

(assert (=> b!1448633 m!1336893))

(declare-fun m!1336937 () Bool)

(assert (=> b!1448636 m!1336937))

(assert (=> b!1448636 m!1336937))

(declare-fun m!1336939 () Bool)

(assert (=> b!1448636 m!1336939))

(assert (=> b!1448636 m!1336911))

(declare-fun m!1336941 () Bool)

(assert (=> b!1448636 m!1336941))

(declare-fun m!1336943 () Bool)

(assert (=> b!1448632 m!1336943))

(assert (=> b!1448644 m!1336893))

(assert (=> b!1448644 m!1336893))

(declare-fun m!1336945 () Bool)

(assert (=> b!1448644 m!1336945))

(check-sat (not b!1448647) (not start!124798) (not b!1448637) (not b!1448642) (not b!1448636) (not b!1448643) (not b!1448632) (not b!1448646) (not b!1448634) (not b!1448645) (not b!1448644) (not b!1448640) (not b!1448633))
(check-sat)

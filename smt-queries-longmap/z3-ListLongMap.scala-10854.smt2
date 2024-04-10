; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127104 () Bool)

(assert start!127104)

(declare-fun b!1493818 () Bool)

(declare-fun res!1016262 () Bool)

(declare-fun e!836798 () Bool)

(assert (=> b!1493818 (=> (not res!1016262) (not e!836798))))

(declare-datatypes ((array!99751 0))(
  ( (array!99752 (arr!48144 (Array (_ BitVec 32) (_ BitVec 64))) (size!48694 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99751)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99751 (_ BitVec 32)) Bool)

(assert (=> b!1493818 (= res!1016262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1493819 () Bool)

(declare-fun e!836800 () Bool)

(declare-fun e!836801 () Bool)

(assert (=> b!1493819 (= e!836800 e!836801)))

(declare-fun res!1016266 () Bool)

(assert (=> b!1493819 (=> (not res!1016266) (not e!836801))))

(declare-datatypes ((SeekEntryResult!12384 0))(
  ( (MissingZero!12384 (index!51928 (_ BitVec 32))) (Found!12384 (index!51929 (_ BitVec 32))) (Intermediate!12384 (undefined!13196 Bool) (index!51930 (_ BitVec 32)) (x!133528 (_ BitVec 32))) (Undefined!12384) (MissingVacant!12384 (index!51931 (_ BitVec 32))) )
))
(declare-fun lt!651154 () SeekEntryResult!12384)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1493819 (= res!1016266 (= lt!651154 (Intermediate!12384 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!651152 () array!99751)

(declare-fun lt!651151 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99751 (_ BitVec 32)) SeekEntryResult!12384)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493819 (= lt!651154 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651151 mask!2687) lt!651151 lt!651152 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1493819 (= lt!651151 (select (store (arr!48144 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1493820 () Bool)

(declare-fun res!1016273 () Bool)

(assert (=> b!1493820 (=> (not res!1016273) (not e!836798))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1493820 (= res!1016273 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48694 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48694 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48694 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1493821 () Bool)

(declare-fun res!1016269 () Bool)

(assert (=> b!1493821 (=> (not res!1016269) (not e!836798))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1493821 (= res!1016269 (validKeyInArray!0 (select (arr!48144 a!2862) i!1006)))))

(declare-fun b!1493822 () Bool)

(declare-fun e!836799 () Bool)

(assert (=> b!1493822 (= e!836799 e!836800)))

(declare-fun res!1016263 () Bool)

(assert (=> b!1493822 (=> (not res!1016263) (not e!836800))))

(declare-fun lt!651153 () SeekEntryResult!12384)

(assert (=> b!1493822 (= res!1016263 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48144 a!2862) j!93) mask!2687) (select (arr!48144 a!2862) j!93) a!2862 mask!2687) lt!651153))))

(assert (=> b!1493822 (= lt!651153 (Intermediate!12384 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1493824 () Bool)

(declare-fun e!836795 () Bool)

(assert (=> b!1493824 (= e!836795 true)))

(declare-fun lt!651155 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493824 (= lt!651155 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1493825 () Bool)

(declare-fun res!1016268 () Bool)

(assert (=> b!1493825 (=> (not res!1016268) (not e!836798))))

(declare-datatypes ((List!34645 0))(
  ( (Nil!34642) (Cons!34641 (h!36030 (_ BitVec 64)) (t!49339 List!34645)) )
))
(declare-fun arrayNoDuplicates!0 (array!99751 (_ BitVec 32) List!34645) Bool)

(assert (=> b!1493825 (= res!1016268 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34642))))

(declare-fun b!1493826 () Bool)

(declare-fun e!836797 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99751 (_ BitVec 32)) SeekEntryResult!12384)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99751 (_ BitVec 32)) SeekEntryResult!12384)

(assert (=> b!1493826 (= e!836797 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651151 lt!651152 mask!2687) (seekEntryOrOpen!0 lt!651151 lt!651152 mask!2687)))))

(declare-fun b!1493827 () Bool)

(declare-fun res!1016275 () Bool)

(assert (=> b!1493827 (=> (not res!1016275) (not e!836798))))

(assert (=> b!1493827 (= res!1016275 (validKeyInArray!0 (select (arr!48144 a!2862) j!93)))))

(declare-fun b!1493828 () Bool)

(declare-fun res!1016272 () Bool)

(assert (=> b!1493828 (=> (not res!1016272) (not e!836800))))

(assert (=> b!1493828 (= res!1016272 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48144 a!2862) j!93) a!2862 mask!2687) lt!651153))))

(declare-fun b!1493829 () Bool)

(declare-fun res!1016264 () Bool)

(assert (=> b!1493829 (=> (not res!1016264) (not e!836801))))

(assert (=> b!1493829 (= res!1016264 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1493830 () Bool)

(declare-fun res!1016274 () Bool)

(declare-fun e!836794 () Bool)

(assert (=> b!1493830 (=> (not res!1016274) (not e!836794))))

(assert (=> b!1493830 (= res!1016274 (= (seekEntryOrOpen!0 (select (arr!48144 a!2862) j!93) a!2862 mask!2687) (Found!12384 j!93)))))

(declare-fun b!1493831 () Bool)

(assert (=> b!1493831 (= e!836798 e!836799)))

(declare-fun res!1016270 () Bool)

(assert (=> b!1493831 (=> (not res!1016270) (not e!836799))))

(assert (=> b!1493831 (= res!1016270 (= (select (store (arr!48144 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1493831 (= lt!651152 (array!99752 (store (arr!48144 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48694 a!2862)))))

(declare-fun b!1493832 () Bool)

(assert (=> b!1493832 (= e!836801 (not e!836795))))

(declare-fun res!1016261 () Bool)

(assert (=> b!1493832 (=> res!1016261 e!836795)))

(assert (=> b!1493832 (= res!1016261 (or (and (= (select (arr!48144 a!2862) index!646) (select (store (arr!48144 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48144 a!2862) index!646) (select (arr!48144 a!2862) j!93))) (= (select (arr!48144 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1493832 e!836794))

(declare-fun res!1016260 () Bool)

(assert (=> b!1493832 (=> (not res!1016260) (not e!836794))))

(assert (=> b!1493832 (= res!1016260 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50108 0))(
  ( (Unit!50109) )
))
(declare-fun lt!651156 () Unit!50108)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99751 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50108)

(assert (=> b!1493832 (= lt!651156 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1493833 () Bool)

(declare-fun res!1016271 () Bool)

(assert (=> b!1493833 (=> (not res!1016271) (not e!836798))))

(assert (=> b!1493833 (= res!1016271 (and (= (size!48694 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48694 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48694 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1493834 () Bool)

(declare-fun res!1016267 () Bool)

(assert (=> b!1493834 (=> (not res!1016267) (not e!836801))))

(assert (=> b!1493834 (= res!1016267 e!836797)))

(declare-fun c!138309 () Bool)

(assert (=> b!1493834 (= c!138309 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1493835 () Bool)

(assert (=> b!1493835 (= e!836794 (or (= (select (arr!48144 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48144 a!2862) intermediateBeforeIndex!19) (select (arr!48144 a!2862) j!93))))))

(declare-fun res!1016265 () Bool)

(assert (=> start!127104 (=> (not res!1016265) (not e!836798))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127104 (= res!1016265 (validMask!0 mask!2687))))

(assert (=> start!127104 e!836798))

(assert (=> start!127104 true))

(declare-fun array_inv!37172 (array!99751) Bool)

(assert (=> start!127104 (array_inv!37172 a!2862)))

(declare-fun b!1493823 () Bool)

(assert (=> b!1493823 (= e!836797 (= lt!651154 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651151 lt!651152 mask!2687)))))

(assert (= (and start!127104 res!1016265) b!1493833))

(assert (= (and b!1493833 res!1016271) b!1493821))

(assert (= (and b!1493821 res!1016269) b!1493827))

(assert (= (and b!1493827 res!1016275) b!1493818))

(assert (= (and b!1493818 res!1016262) b!1493825))

(assert (= (and b!1493825 res!1016268) b!1493820))

(assert (= (and b!1493820 res!1016273) b!1493831))

(assert (= (and b!1493831 res!1016270) b!1493822))

(assert (= (and b!1493822 res!1016263) b!1493828))

(assert (= (and b!1493828 res!1016272) b!1493819))

(assert (= (and b!1493819 res!1016266) b!1493834))

(assert (= (and b!1493834 c!138309) b!1493823))

(assert (= (and b!1493834 (not c!138309)) b!1493826))

(assert (= (and b!1493834 res!1016267) b!1493829))

(assert (= (and b!1493829 res!1016264) b!1493832))

(assert (= (and b!1493832 res!1016260) b!1493830))

(assert (= (and b!1493830 res!1016274) b!1493835))

(assert (= (and b!1493832 (not res!1016261)) b!1493824))

(declare-fun m!1377587 () Bool)

(assert (=> b!1493823 m!1377587))

(declare-fun m!1377589 () Bool)

(assert (=> b!1493825 m!1377589))

(declare-fun m!1377591 () Bool)

(assert (=> b!1493828 m!1377591))

(assert (=> b!1493828 m!1377591))

(declare-fun m!1377593 () Bool)

(assert (=> b!1493828 m!1377593))

(declare-fun m!1377595 () Bool)

(assert (=> b!1493826 m!1377595))

(declare-fun m!1377597 () Bool)

(assert (=> b!1493826 m!1377597))

(assert (=> b!1493827 m!1377591))

(assert (=> b!1493827 m!1377591))

(declare-fun m!1377599 () Bool)

(assert (=> b!1493827 m!1377599))

(assert (=> b!1493830 m!1377591))

(assert (=> b!1493830 m!1377591))

(declare-fun m!1377601 () Bool)

(assert (=> b!1493830 m!1377601))

(declare-fun m!1377603 () Bool)

(assert (=> b!1493832 m!1377603))

(declare-fun m!1377605 () Bool)

(assert (=> b!1493832 m!1377605))

(declare-fun m!1377607 () Bool)

(assert (=> b!1493832 m!1377607))

(declare-fun m!1377609 () Bool)

(assert (=> b!1493832 m!1377609))

(declare-fun m!1377611 () Bool)

(assert (=> b!1493832 m!1377611))

(assert (=> b!1493832 m!1377591))

(declare-fun m!1377613 () Bool)

(assert (=> b!1493824 m!1377613))

(declare-fun m!1377615 () Bool)

(assert (=> b!1493821 m!1377615))

(assert (=> b!1493821 m!1377615))

(declare-fun m!1377617 () Bool)

(assert (=> b!1493821 m!1377617))

(declare-fun m!1377619 () Bool)

(assert (=> b!1493819 m!1377619))

(assert (=> b!1493819 m!1377619))

(declare-fun m!1377621 () Bool)

(assert (=> b!1493819 m!1377621))

(assert (=> b!1493819 m!1377605))

(declare-fun m!1377623 () Bool)

(assert (=> b!1493819 m!1377623))

(declare-fun m!1377625 () Bool)

(assert (=> b!1493835 m!1377625))

(assert (=> b!1493835 m!1377591))

(declare-fun m!1377627 () Bool)

(assert (=> start!127104 m!1377627))

(declare-fun m!1377629 () Bool)

(assert (=> start!127104 m!1377629))

(assert (=> b!1493831 m!1377605))

(declare-fun m!1377631 () Bool)

(assert (=> b!1493831 m!1377631))

(assert (=> b!1493822 m!1377591))

(assert (=> b!1493822 m!1377591))

(declare-fun m!1377633 () Bool)

(assert (=> b!1493822 m!1377633))

(assert (=> b!1493822 m!1377633))

(assert (=> b!1493822 m!1377591))

(declare-fun m!1377635 () Bool)

(assert (=> b!1493822 m!1377635))

(declare-fun m!1377637 () Bool)

(assert (=> b!1493818 m!1377637))

(check-sat (not b!1493822) (not b!1493826) (not b!1493821) (not b!1493819) (not start!127104) (not b!1493823) (not b!1493832) (not b!1493825) (not b!1493818) (not b!1493830) (not b!1493827) (not b!1493828) (not b!1493824))
(check-sat)

; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126658 () Bool)

(assert start!126658)

(declare-datatypes ((array!99557 0))(
  ( (array!99558 (arr!48053 (Array (_ BitVec 32) (_ BitVec 64))) (size!48603 (_ BitVec 32))) )
))
(declare-fun lt!648597 () array!99557)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1486819 () Bool)

(declare-fun lt!648600 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun e!833459 () Bool)

(declare-datatypes ((SeekEntryResult!12293 0))(
  ( (MissingZero!12293 (index!51564 (_ BitVec 32))) (Found!12293 (index!51565 (_ BitVec 32))) (Intermediate!12293 (undefined!13105 Bool) (index!51566 (_ BitVec 32)) (x!133149 (_ BitVec 32))) (Undefined!12293) (MissingVacant!12293 (index!51567 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99557 (_ BitVec 32)) SeekEntryResult!12293)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99557 (_ BitVec 32)) SeekEntryResult!12293)

(assert (=> b!1486819 (= e!833459 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648600 lt!648597 mask!2687) (seekEntryOrOpen!0 lt!648600 lt!648597 mask!2687)))))

(declare-fun b!1486820 () Bool)

(declare-fun res!1011147 () Bool)

(declare-fun e!833453 () Bool)

(assert (=> b!1486820 (=> (not res!1011147) (not e!833453))))

(assert (=> b!1486820 (= res!1011147 e!833459)))

(declare-fun c!137367 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1486820 (= c!137367 (bvsle x!665 intermediateAfterX!19))))

(declare-fun lt!648595 () SeekEntryResult!12293)

(declare-fun b!1486821 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99557 (_ BitVec 32)) SeekEntryResult!12293)

(assert (=> b!1486821 (= e!833459 (= lt!648595 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648600 lt!648597 mask!2687)))))

(declare-fun b!1486822 () Bool)

(declare-fun res!1011138 () Bool)

(declare-fun e!833456 () Bool)

(assert (=> b!1486822 (=> (not res!1011138) (not e!833456))))

(declare-fun a!2862 () array!99557)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1486822 (= res!1011138 (validKeyInArray!0 (select (arr!48053 a!2862) j!93)))))

(declare-fun b!1486824 () Bool)

(declare-fun e!833460 () Bool)

(declare-fun e!833454 () Bool)

(assert (=> b!1486824 (= e!833460 e!833454)))

(declare-fun res!1011140 () Bool)

(assert (=> b!1486824 (=> (not res!1011140) (not e!833454))))

(declare-fun lt!648594 () SeekEntryResult!12293)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1486824 (= res!1011140 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48053 a!2862) j!93) mask!2687) (select (arr!48053 a!2862) j!93) a!2862 mask!2687) lt!648594))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1486824 (= lt!648594 (Intermediate!12293 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1486825 () Bool)

(assert (=> b!1486825 (= e!833454 e!833453)))

(declare-fun res!1011135 () Bool)

(assert (=> b!1486825 (=> (not res!1011135) (not e!833453))))

(assert (=> b!1486825 (= res!1011135 (= lt!648595 (Intermediate!12293 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1486825 (= lt!648595 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648600 mask!2687) lt!648600 lt!648597 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1486825 (= lt!648600 (select (store (arr!48053 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1486826 () Bool)

(declare-fun res!1011134 () Bool)

(assert (=> b!1486826 (=> (not res!1011134) (not e!833456))))

(assert (=> b!1486826 (= res!1011134 (and (= (size!48603 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48603 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48603 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1486827 () Bool)

(declare-fun e!833455 () Bool)

(declare-fun e!833462 () Bool)

(assert (=> b!1486827 (= e!833455 e!833462)))

(declare-fun res!1011142 () Bool)

(assert (=> b!1486827 (=> res!1011142 e!833462)))

(declare-fun lt!648599 () (_ BitVec 64))

(assert (=> b!1486827 (= res!1011142 (or (and (= (select (arr!48053 a!2862) index!646) lt!648599) (= (select (arr!48053 a!2862) index!646) (select (arr!48053 a!2862) j!93))) (= (select (arr!48053 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1486827 (= lt!648599 (select (store (arr!48053 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun e!833458 () Bool)

(declare-fun b!1486828 () Bool)

(assert (=> b!1486828 (= e!833458 (= (seekEntryOrOpen!0 lt!648600 lt!648597 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648600 lt!648597 mask!2687)))))

(declare-fun b!1486829 () Bool)

(assert (=> b!1486829 (= e!833456 e!833460)))

(declare-fun res!1011133 () Bool)

(assert (=> b!1486829 (=> (not res!1011133) (not e!833460))))

(assert (=> b!1486829 (= res!1011133 (= (select (store (arr!48053 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1486829 (= lt!648597 (array!99558 (store (arr!48053 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48603 a!2862)))))

(declare-fun res!1011136 () Bool)

(assert (=> start!126658 (=> (not res!1011136) (not e!833456))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126658 (= res!1011136 (validMask!0 mask!2687))))

(assert (=> start!126658 e!833456))

(assert (=> start!126658 true))

(declare-fun array_inv!37081 (array!99557) Bool)

(assert (=> start!126658 (array_inv!37081 a!2862)))

(declare-fun b!1486823 () Bool)

(declare-fun res!1011145 () Bool)

(assert (=> b!1486823 (=> (not res!1011145) (not e!833456))))

(assert (=> b!1486823 (= res!1011145 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48603 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48603 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48603 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1486830 () Bool)

(declare-fun e!833461 () Bool)

(assert (=> b!1486830 (= e!833461 true)))

(declare-fun lt!648596 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1486830 (= lt!648596 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1486831 () Bool)

(declare-fun res!1011141 () Bool)

(assert (=> b!1486831 (=> (not res!1011141) (not e!833456))))

(declare-datatypes ((List!34554 0))(
  ( (Nil!34551) (Cons!34550 (h!35927 (_ BitVec 64)) (t!49248 List!34554)) )
))
(declare-fun arrayNoDuplicates!0 (array!99557 (_ BitVec 32) List!34554) Bool)

(assert (=> b!1486831 (= res!1011141 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34551))))

(declare-fun b!1486832 () Bool)

(declare-fun res!1011143 () Bool)

(assert (=> b!1486832 (=> (not res!1011143) (not e!833456))))

(assert (=> b!1486832 (= res!1011143 (validKeyInArray!0 (select (arr!48053 a!2862) i!1006)))))

(declare-fun b!1486833 () Bool)

(declare-fun res!1011139 () Bool)

(assert (=> b!1486833 (=> (not res!1011139) (not e!833455))))

(assert (=> b!1486833 (= res!1011139 (or (= (select (arr!48053 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48053 a!2862) intermediateBeforeIndex!19) (select (arr!48053 a!2862) j!93))))))

(declare-fun b!1486834 () Bool)

(assert (=> b!1486834 (= e!833453 (not e!833461))))

(declare-fun res!1011137 () Bool)

(assert (=> b!1486834 (=> res!1011137 e!833461)))

(assert (=> b!1486834 (= res!1011137 (or (and (= (select (arr!48053 a!2862) index!646) (select (store (arr!48053 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48053 a!2862) index!646) (select (arr!48053 a!2862) j!93))) (= (select (arr!48053 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1486834 e!833455))

(declare-fun res!1011148 () Bool)

(assert (=> b!1486834 (=> (not res!1011148) (not e!833455))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99557 (_ BitVec 32)) Bool)

(assert (=> b!1486834 (= res!1011148 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49926 0))(
  ( (Unit!49927) )
))
(declare-fun lt!648598 () Unit!49926)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99557 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49926)

(assert (=> b!1486834 (= lt!648598 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1486835 () Bool)

(declare-fun res!1011146 () Bool)

(assert (=> b!1486835 (=> (not res!1011146) (not e!833456))))

(assert (=> b!1486835 (= res!1011146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1486836 () Bool)

(declare-fun res!1011149 () Bool)

(assert (=> b!1486836 (=> (not res!1011149) (not e!833455))))

(assert (=> b!1486836 (= res!1011149 (= (seekEntryOrOpen!0 (select (arr!48053 a!2862) j!93) a!2862 mask!2687) (Found!12293 j!93)))))

(declare-fun b!1486837 () Bool)

(declare-fun res!1011151 () Bool)

(assert (=> b!1486837 (=> (not res!1011151) (not e!833453))))

(assert (=> b!1486837 (= res!1011151 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1486838 () Bool)

(declare-fun res!1011150 () Bool)

(assert (=> b!1486838 (=> (not res!1011150) (not e!833454))))

(assert (=> b!1486838 (= res!1011150 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48053 a!2862) j!93) a!2862 mask!2687) lt!648594))))

(declare-fun b!1486839 () Bool)

(assert (=> b!1486839 (= e!833462 e!833458)))

(declare-fun res!1011144 () Bool)

(assert (=> b!1486839 (=> (not res!1011144) (not e!833458))))

(assert (=> b!1486839 (= res!1011144 (and (= index!646 intermediateAfterIndex!19) (= lt!648599 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!126658 res!1011136) b!1486826))

(assert (= (and b!1486826 res!1011134) b!1486832))

(assert (= (and b!1486832 res!1011143) b!1486822))

(assert (= (and b!1486822 res!1011138) b!1486835))

(assert (= (and b!1486835 res!1011146) b!1486831))

(assert (= (and b!1486831 res!1011141) b!1486823))

(assert (= (and b!1486823 res!1011145) b!1486829))

(assert (= (and b!1486829 res!1011133) b!1486824))

(assert (= (and b!1486824 res!1011140) b!1486838))

(assert (= (and b!1486838 res!1011150) b!1486825))

(assert (= (and b!1486825 res!1011135) b!1486820))

(assert (= (and b!1486820 c!137367) b!1486821))

(assert (= (and b!1486820 (not c!137367)) b!1486819))

(assert (= (and b!1486820 res!1011147) b!1486837))

(assert (= (and b!1486837 res!1011151) b!1486834))

(assert (= (and b!1486834 res!1011148) b!1486836))

(assert (= (and b!1486836 res!1011149) b!1486833))

(assert (= (and b!1486833 res!1011139) b!1486827))

(assert (= (and b!1486827 (not res!1011142)) b!1486839))

(assert (= (and b!1486839 res!1011144) b!1486828))

(assert (= (and b!1486834 (not res!1011137)) b!1486830))

(declare-fun m!1371631 () Bool)

(assert (=> b!1486836 m!1371631))

(assert (=> b!1486836 m!1371631))

(declare-fun m!1371633 () Bool)

(assert (=> b!1486836 m!1371633))

(declare-fun m!1371635 () Bool)

(assert (=> b!1486829 m!1371635))

(declare-fun m!1371637 () Bool)

(assert (=> b!1486829 m!1371637))

(assert (=> b!1486824 m!1371631))

(assert (=> b!1486824 m!1371631))

(declare-fun m!1371639 () Bool)

(assert (=> b!1486824 m!1371639))

(assert (=> b!1486824 m!1371639))

(assert (=> b!1486824 m!1371631))

(declare-fun m!1371641 () Bool)

(assert (=> b!1486824 m!1371641))

(declare-fun m!1371643 () Bool)

(assert (=> b!1486833 m!1371643))

(assert (=> b!1486833 m!1371631))

(declare-fun m!1371645 () Bool)

(assert (=> b!1486819 m!1371645))

(declare-fun m!1371647 () Bool)

(assert (=> b!1486819 m!1371647))

(assert (=> b!1486838 m!1371631))

(assert (=> b!1486838 m!1371631))

(declare-fun m!1371649 () Bool)

(assert (=> b!1486838 m!1371649))

(declare-fun m!1371651 () Bool)

(assert (=> b!1486821 m!1371651))

(declare-fun m!1371653 () Bool)

(assert (=> b!1486834 m!1371653))

(assert (=> b!1486834 m!1371635))

(declare-fun m!1371655 () Bool)

(assert (=> b!1486834 m!1371655))

(declare-fun m!1371657 () Bool)

(assert (=> b!1486834 m!1371657))

(declare-fun m!1371659 () Bool)

(assert (=> b!1486834 m!1371659))

(assert (=> b!1486834 m!1371631))

(declare-fun m!1371661 () Bool)

(assert (=> b!1486835 m!1371661))

(assert (=> b!1486827 m!1371657))

(assert (=> b!1486827 m!1371631))

(assert (=> b!1486827 m!1371635))

(assert (=> b!1486827 m!1371655))

(declare-fun m!1371663 () Bool)

(assert (=> start!126658 m!1371663))

(declare-fun m!1371665 () Bool)

(assert (=> start!126658 m!1371665))

(assert (=> b!1486828 m!1371647))

(assert (=> b!1486828 m!1371645))

(declare-fun m!1371667 () Bool)

(assert (=> b!1486832 m!1371667))

(assert (=> b!1486832 m!1371667))

(declare-fun m!1371669 () Bool)

(assert (=> b!1486832 m!1371669))

(assert (=> b!1486822 m!1371631))

(assert (=> b!1486822 m!1371631))

(declare-fun m!1371671 () Bool)

(assert (=> b!1486822 m!1371671))

(declare-fun m!1371673 () Bool)

(assert (=> b!1486831 m!1371673))

(declare-fun m!1371675 () Bool)

(assert (=> b!1486825 m!1371675))

(assert (=> b!1486825 m!1371675))

(declare-fun m!1371677 () Bool)

(assert (=> b!1486825 m!1371677))

(assert (=> b!1486825 m!1371635))

(declare-fun m!1371679 () Bool)

(assert (=> b!1486825 m!1371679))

(declare-fun m!1371681 () Bool)

(assert (=> b!1486830 m!1371681))

(push 1)


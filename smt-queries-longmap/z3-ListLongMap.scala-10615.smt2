; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124830 () Bool)

(assert start!124830)

(declare-fun b!1448883 () Bool)

(declare-fun e!815945 () Bool)

(declare-fun e!815953 () Bool)

(assert (=> b!1448883 (= e!815945 e!815953)))

(declare-fun res!980388 () Bool)

(assert (=> b!1448883 (=> (not res!980388) (not e!815953))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11679 0))(
  ( (MissingZero!11679 (index!49108 (_ BitVec 32))) (Found!11679 (index!49109 (_ BitVec 32))) (Intermediate!11679 (undefined!12491 Bool) (index!49110 (_ BitVec 32)) (x!130776 (_ BitVec 32))) (Undefined!11679) (MissingVacant!11679 (index!49111 (_ BitVec 32))) )
))
(declare-fun lt!635698 () SeekEntryResult!11679)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1448883 (= res!980388 (= lt!635698 (Intermediate!11679 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-datatypes ((array!98278 0))(
  ( (array!98279 (arr!47427 (Array (_ BitVec 32) (_ BitVec 64))) (size!47977 (_ BitVec 32))) )
))
(declare-fun lt!635699 () array!98278)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!635700 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98278 (_ BitVec 32)) SeekEntryResult!11679)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1448883 (= lt!635698 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635700 mask!2687) lt!635700 lt!635699 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98278)

(assert (=> b!1448883 (= lt!635700 (select (store (arr!47427 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1448884 () Bool)

(declare-fun e!815946 () Bool)

(declare-fun e!815948 () Bool)

(assert (=> b!1448884 (= e!815946 e!815948)))

(declare-fun res!980397 () Bool)

(assert (=> b!1448884 (=> (not res!980397) (not e!815948))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!635696 () SeekEntryResult!11679)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98278 (_ BitVec 32)) SeekEntryResult!11679)

(assert (=> b!1448884 (= res!980397 (= lt!635696 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47427 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1448885 () Bool)

(declare-fun e!815951 () Bool)

(declare-fun e!815950 () Bool)

(assert (=> b!1448885 (= e!815951 e!815950)))

(declare-fun res!980398 () Bool)

(assert (=> b!1448885 (=> (not res!980398) (not e!815950))))

(assert (=> b!1448885 (= res!980398 (= (select (store (arr!47427 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1448885 (= lt!635699 (array!98279 (store (arr!47427 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47977 a!2862)))))

(declare-fun b!1448886 () Bool)

(declare-fun res!980383 () Bool)

(assert (=> b!1448886 (=> (not res!980383) (not e!815951))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98278 (_ BitVec 32)) Bool)

(assert (=> b!1448886 (= res!980383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1448887 () Bool)

(declare-fun res!980386 () Bool)

(assert (=> b!1448887 (=> (not res!980386) (not e!815951))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1448887 (= res!980386 (validKeyInArray!0 (select (arr!47427 a!2862) j!93)))))

(declare-fun b!1448888 () Bool)

(declare-fun res!980389 () Bool)

(assert (=> b!1448888 (=> (not res!980389) (not e!815953))))

(declare-fun e!815947 () Bool)

(assert (=> b!1448888 (= res!980389 e!815947)))

(declare-fun c!133761 () Bool)

(assert (=> b!1448888 (= c!133761 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1448889 () Bool)

(declare-fun res!980390 () Bool)

(assert (=> b!1448889 (=> (not res!980390) (not e!815945))))

(declare-fun lt!635695 () SeekEntryResult!11679)

(assert (=> b!1448889 (= res!980390 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47427 a!2862) j!93) a!2862 mask!2687) lt!635695))))

(declare-fun b!1448890 () Bool)

(declare-fun res!980393 () Bool)

(assert (=> b!1448890 (=> (not res!980393) (not e!815951))))

(declare-datatypes ((List!33928 0))(
  ( (Nil!33925) (Cons!33924 (h!35274 (_ BitVec 64)) (t!48622 List!33928)) )
))
(declare-fun arrayNoDuplicates!0 (array!98278 (_ BitVec 32) List!33928) Bool)

(assert (=> b!1448890 (= res!980393 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33925))))

(declare-fun b!1448891 () Bool)

(declare-fun res!980387 () Bool)

(assert (=> b!1448891 (=> (not res!980387) (not e!815951))))

(assert (=> b!1448891 (= res!980387 (and (= (size!47977 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47977 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47977 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1448892 () Bool)

(assert (=> b!1448892 (= e!815947 (= lt!635698 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635700 lt!635699 mask!2687)))))

(declare-fun b!1448893 () Bool)

(declare-fun e!815949 () Bool)

(assert (=> b!1448893 (= e!815953 (not e!815949))))

(declare-fun res!980385 () Bool)

(assert (=> b!1448893 (=> res!980385 e!815949)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1448893 (= res!980385 (or (and (= (select (arr!47427 a!2862) index!646) (select (store (arr!47427 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47427 a!2862) index!646) (select (arr!47427 a!2862) j!93))) (not (= (select (arr!47427 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47427 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!815952 () Bool)

(assert (=> b!1448893 e!815952))

(declare-fun res!980382 () Bool)

(assert (=> b!1448893 (=> (not res!980382) (not e!815952))))

(assert (=> b!1448893 (= res!980382 (and (= lt!635696 (Found!11679 j!93)) (or (= (select (arr!47427 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47427 a!2862) intermediateBeforeIndex!19) (select (arr!47427 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98278 (_ BitVec 32)) SeekEntryResult!11679)

(assert (=> b!1448893 (= lt!635696 (seekEntryOrOpen!0 (select (arr!47427 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1448893 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48854 0))(
  ( (Unit!48855) )
))
(declare-fun lt!635694 () Unit!48854)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98278 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48854)

(assert (=> b!1448893 (= lt!635694 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1448894 () Bool)

(assert (=> b!1448894 (= e!815949 true)))

(declare-fun lt!635697 () SeekEntryResult!11679)

(assert (=> b!1448894 (= lt!635697 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47427 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1448895 () Bool)

(declare-fun res!980394 () Bool)

(assert (=> b!1448895 (=> (not res!980394) (not e!815951))))

(assert (=> b!1448895 (= res!980394 (validKeyInArray!0 (select (arr!47427 a!2862) i!1006)))))

(declare-fun b!1448896 () Bool)

(assert (=> b!1448896 (= e!815952 e!815946)))

(declare-fun res!980384 () Bool)

(assert (=> b!1448896 (=> res!980384 e!815946)))

(assert (=> b!1448896 (= res!980384 (or (and (= (select (arr!47427 a!2862) index!646) (select (store (arr!47427 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47427 a!2862) index!646) (select (arr!47427 a!2862) j!93))) (not (= (select (arr!47427 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1448897 () Bool)

(assert (=> b!1448897 (= e!815950 e!815945)))

(declare-fun res!980395 () Bool)

(assert (=> b!1448897 (=> (not res!980395) (not e!815945))))

(assert (=> b!1448897 (= res!980395 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47427 a!2862) j!93) mask!2687) (select (arr!47427 a!2862) j!93) a!2862 mask!2687) lt!635695))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1448897 (= lt!635695 (Intermediate!11679 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!980396 () Bool)

(assert (=> start!124830 (=> (not res!980396) (not e!815951))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124830 (= res!980396 (validMask!0 mask!2687))))

(assert (=> start!124830 e!815951))

(assert (=> start!124830 true))

(declare-fun array_inv!36455 (array!98278) Bool)

(assert (=> start!124830 (array_inv!36455 a!2862)))

(declare-fun b!1448898 () Bool)

(assert (=> b!1448898 (= e!815947 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635700 lt!635699 mask!2687) (seekEntryOrOpen!0 lt!635700 lt!635699 mask!2687)))))

(declare-fun b!1448899 () Bool)

(declare-fun res!980391 () Bool)

(assert (=> b!1448899 (=> (not res!980391) (not e!815953))))

(assert (=> b!1448899 (= res!980391 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1448900 () Bool)

(declare-fun res!980392 () Bool)

(assert (=> b!1448900 (=> (not res!980392) (not e!815951))))

(assert (=> b!1448900 (= res!980392 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47977 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47977 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47977 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1448901 () Bool)

(assert (=> b!1448901 (= e!815948 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(assert (= (and start!124830 res!980396) b!1448891))

(assert (= (and b!1448891 res!980387) b!1448895))

(assert (= (and b!1448895 res!980394) b!1448887))

(assert (= (and b!1448887 res!980386) b!1448886))

(assert (= (and b!1448886 res!980383) b!1448890))

(assert (= (and b!1448890 res!980393) b!1448900))

(assert (= (and b!1448900 res!980392) b!1448885))

(assert (= (and b!1448885 res!980398) b!1448897))

(assert (= (and b!1448897 res!980395) b!1448889))

(assert (= (and b!1448889 res!980390) b!1448883))

(assert (= (and b!1448883 res!980388) b!1448888))

(assert (= (and b!1448888 c!133761) b!1448892))

(assert (= (and b!1448888 (not c!133761)) b!1448898))

(assert (= (and b!1448888 res!980389) b!1448899))

(assert (= (and b!1448899 res!980391) b!1448893))

(assert (= (and b!1448893 res!980382) b!1448896))

(assert (= (and b!1448896 (not res!980384)) b!1448884))

(assert (= (and b!1448884 res!980397) b!1448901))

(assert (= (and b!1448893 (not res!980385)) b!1448894))

(declare-fun m!1337623 () Bool)

(assert (=> b!1448898 m!1337623))

(declare-fun m!1337625 () Bool)

(assert (=> b!1448898 m!1337625))

(declare-fun m!1337627 () Bool)

(assert (=> b!1448885 m!1337627))

(declare-fun m!1337629 () Bool)

(assert (=> b!1448885 m!1337629))

(declare-fun m!1337631 () Bool)

(assert (=> b!1448897 m!1337631))

(assert (=> b!1448897 m!1337631))

(declare-fun m!1337633 () Bool)

(assert (=> b!1448897 m!1337633))

(assert (=> b!1448897 m!1337633))

(assert (=> b!1448897 m!1337631))

(declare-fun m!1337635 () Bool)

(assert (=> b!1448897 m!1337635))

(assert (=> b!1448889 m!1337631))

(assert (=> b!1448889 m!1337631))

(declare-fun m!1337637 () Bool)

(assert (=> b!1448889 m!1337637))

(declare-fun m!1337639 () Bool)

(assert (=> b!1448883 m!1337639))

(assert (=> b!1448883 m!1337639))

(declare-fun m!1337641 () Bool)

(assert (=> b!1448883 m!1337641))

(assert (=> b!1448883 m!1337627))

(declare-fun m!1337643 () Bool)

(assert (=> b!1448883 m!1337643))

(declare-fun m!1337645 () Bool)

(assert (=> b!1448893 m!1337645))

(assert (=> b!1448893 m!1337627))

(declare-fun m!1337647 () Bool)

(assert (=> b!1448893 m!1337647))

(declare-fun m!1337649 () Bool)

(assert (=> b!1448893 m!1337649))

(declare-fun m!1337651 () Bool)

(assert (=> b!1448893 m!1337651))

(assert (=> b!1448893 m!1337631))

(declare-fun m!1337653 () Bool)

(assert (=> b!1448893 m!1337653))

(declare-fun m!1337655 () Bool)

(assert (=> b!1448893 m!1337655))

(assert (=> b!1448893 m!1337631))

(assert (=> b!1448884 m!1337631))

(assert (=> b!1448884 m!1337631))

(declare-fun m!1337657 () Bool)

(assert (=> b!1448884 m!1337657))

(declare-fun m!1337659 () Bool)

(assert (=> b!1448890 m!1337659))

(declare-fun m!1337661 () Bool)

(assert (=> start!124830 m!1337661))

(declare-fun m!1337663 () Bool)

(assert (=> start!124830 m!1337663))

(assert (=> b!1448894 m!1337631))

(assert (=> b!1448894 m!1337631))

(declare-fun m!1337665 () Bool)

(assert (=> b!1448894 m!1337665))

(declare-fun m!1337667 () Bool)

(assert (=> b!1448895 m!1337667))

(assert (=> b!1448895 m!1337667))

(declare-fun m!1337669 () Bool)

(assert (=> b!1448895 m!1337669))

(declare-fun m!1337671 () Bool)

(assert (=> b!1448892 m!1337671))

(assert (=> b!1448896 m!1337651))

(assert (=> b!1448896 m!1337627))

(assert (=> b!1448896 m!1337649))

(assert (=> b!1448896 m!1337631))

(declare-fun m!1337673 () Bool)

(assert (=> b!1448886 m!1337673))

(assert (=> b!1448887 m!1337631))

(assert (=> b!1448887 m!1337631))

(declare-fun m!1337675 () Bool)

(assert (=> b!1448887 m!1337675))

(check-sat (not b!1448895) (not b!1448889) (not b!1448886) (not b!1448897) (not b!1448892) (not b!1448893) (not b!1448890) (not b!1448887) (not b!1448883) (not b!1448898) (not b!1448894) (not start!124830) (not b!1448884))
(check-sat)

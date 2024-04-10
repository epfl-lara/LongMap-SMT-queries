; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126136 () Bool)

(assert start!126136)

(declare-fun res!1002876 () Bool)

(declare-fun e!828454 () Bool)

(assert (=> start!126136 (=> (not res!1002876) (not e!828454))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126136 (= res!1002876 (validMask!0 mask!2687))))

(assert (=> start!126136 e!828454))

(assert (=> start!126136 true))

(declare-datatypes ((array!99242 0))(
  ( (array!99243 (arr!47900 (Array (_ BitVec 32) (_ BitVec 64))) (size!48450 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99242)

(declare-fun array_inv!36928 (array!99242) Bool)

(assert (=> start!126136 (array_inv!36928 a!2862)))

(declare-fun b!1476652 () Bool)

(declare-fun res!1002868 () Bool)

(declare-fun e!828457 () Bool)

(assert (=> b!1476652 (=> (not res!1002868) (not e!828457))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12140 0))(
  ( (MissingZero!12140 (index!50952 (_ BitVec 32))) (Found!12140 (index!50953 (_ BitVec 32))) (Intermediate!12140 (undefined!12952 Bool) (index!50954 (_ BitVec 32)) (x!132555 (_ BitVec 32))) (Undefined!12140) (MissingVacant!12140 (index!50955 (_ BitVec 32))) )
))
(declare-fun lt!645090 () SeekEntryResult!12140)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99242 (_ BitVec 32)) SeekEntryResult!12140)

(assert (=> b!1476652 (= res!1002868 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47900 a!2862) j!93) a!2862 mask!2687) lt!645090))))

(declare-fun b!1476653 () Bool)

(declare-fun res!1002871 () Bool)

(declare-fun e!828451 () Bool)

(assert (=> b!1476653 (=> (not res!1002871) (not e!828451))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1476653 (= res!1002871 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1476654 () Bool)

(declare-fun e!828450 () Bool)

(declare-fun e!828455 () Bool)

(assert (=> b!1476654 (= e!828450 e!828455)))

(declare-fun res!1002877 () Bool)

(assert (=> b!1476654 (=> res!1002877 e!828455)))

(assert (=> b!1476654 (= res!1002877 (or (and (= (select (arr!47900 a!2862) index!646) (select (store (arr!47900 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47900 a!2862) index!646) (select (arr!47900 a!2862) j!93))) (not (= (select (arr!47900 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1476655 () Bool)

(declare-fun res!1002870 () Bool)

(assert (=> b!1476655 (=> (not res!1002870) (not e!828454))))

(assert (=> b!1476655 (= res!1002870 (and (= (size!48450 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48450 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48450 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1476656 () Bool)

(declare-fun res!1002875 () Bool)

(assert (=> b!1476656 (=> (not res!1002875) (not e!828454))))

(declare-datatypes ((List!34401 0))(
  ( (Nil!34398) (Cons!34397 (h!35765 (_ BitVec 64)) (t!49095 List!34401)) )
))
(declare-fun arrayNoDuplicates!0 (array!99242 (_ BitVec 32) List!34401) Bool)

(assert (=> b!1476656 (= res!1002875 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34398))))

(declare-fun b!1476657 () Bool)

(declare-fun res!1002880 () Bool)

(assert (=> b!1476657 (=> (not res!1002880) (not e!828454))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1476657 (= res!1002880 (validKeyInArray!0 (select (arr!47900 a!2862) j!93)))))

(declare-fun b!1476658 () Bool)

(assert (=> b!1476658 (= e!828457 e!828451)))

(declare-fun res!1002872 () Bool)

(assert (=> b!1476658 (=> (not res!1002872) (not e!828451))))

(declare-fun lt!645087 () SeekEntryResult!12140)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1476658 (= res!1002872 (= lt!645087 (Intermediate!12140 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!645086 () array!99242)

(declare-fun lt!645085 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1476658 (= lt!645087 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645085 mask!2687) lt!645085 lt!645086 mask!2687))))

(assert (=> b!1476658 (= lt!645085 (select (store (arr!47900 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1476659 () Bool)

(declare-fun res!1002869 () Bool)

(assert (=> b!1476659 (=> (not res!1002869) (not e!828454))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1476659 (= res!1002869 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48450 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48450 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48450 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1476660 () Bool)

(declare-fun e!828458 () Bool)

(assert (=> b!1476660 (= e!828458 e!828457)))

(declare-fun res!1002879 () Bool)

(assert (=> b!1476660 (=> (not res!1002879) (not e!828457))))

(assert (=> b!1476660 (= res!1002879 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47900 a!2862) j!93) mask!2687) (select (arr!47900 a!2862) j!93) a!2862 mask!2687) lt!645090))))

(assert (=> b!1476660 (= lt!645090 (Intermediate!12140 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1476661 () Bool)

(assert (=> b!1476661 (= e!828451 (not true))))

(assert (=> b!1476661 e!828450))

(declare-fun res!1002866 () Bool)

(assert (=> b!1476661 (=> (not res!1002866) (not e!828450))))

(declare-fun lt!645088 () SeekEntryResult!12140)

(assert (=> b!1476661 (= res!1002866 (and (= lt!645088 (Found!12140 j!93)) (or (= (select (arr!47900 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47900 a!2862) intermediateBeforeIndex!19) (select (arr!47900 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99242 (_ BitVec 32)) SeekEntryResult!12140)

(assert (=> b!1476661 (= lt!645088 (seekEntryOrOpen!0 (select (arr!47900 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99242 (_ BitVec 32)) Bool)

(assert (=> b!1476661 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49620 0))(
  ( (Unit!49621) )
))
(declare-fun lt!645089 () Unit!49620)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99242 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49620)

(assert (=> b!1476661 (= lt!645089 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1476662 () Bool)

(declare-fun e!828456 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99242 (_ BitVec 32)) SeekEntryResult!12140)

(assert (=> b!1476662 (= e!828456 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645085 lt!645086 mask!2687) (seekEntryOrOpen!0 lt!645085 lt!645086 mask!2687)))))

(declare-fun b!1476663 () Bool)

(declare-fun res!1002874 () Bool)

(assert (=> b!1476663 (=> (not res!1002874) (not e!828454))))

(assert (=> b!1476663 (= res!1002874 (validKeyInArray!0 (select (arr!47900 a!2862) i!1006)))))

(declare-fun b!1476664 () Bool)

(declare-fun e!828452 () Bool)

(assert (=> b!1476664 (= e!828455 e!828452)))

(declare-fun res!1002878 () Bool)

(assert (=> b!1476664 (=> (not res!1002878) (not e!828452))))

(assert (=> b!1476664 (= res!1002878 (= lt!645088 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47900 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1476665 () Bool)

(assert (=> b!1476665 (= e!828452 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1476666 () Bool)

(declare-fun res!1002867 () Bool)

(assert (=> b!1476666 (=> (not res!1002867) (not e!828454))))

(assert (=> b!1476666 (= res!1002867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1476667 () Bool)

(declare-fun res!1002865 () Bool)

(assert (=> b!1476667 (=> (not res!1002865) (not e!828451))))

(assert (=> b!1476667 (= res!1002865 e!828456)))

(declare-fun c!136413 () Bool)

(assert (=> b!1476667 (= c!136413 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1476668 () Bool)

(assert (=> b!1476668 (= e!828456 (= lt!645087 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645085 lt!645086 mask!2687)))))

(declare-fun b!1476669 () Bool)

(assert (=> b!1476669 (= e!828454 e!828458)))

(declare-fun res!1002873 () Bool)

(assert (=> b!1476669 (=> (not res!1002873) (not e!828458))))

(assert (=> b!1476669 (= res!1002873 (= (select (store (arr!47900 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1476669 (= lt!645086 (array!99243 (store (arr!47900 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48450 a!2862)))))

(assert (= (and start!126136 res!1002876) b!1476655))

(assert (= (and b!1476655 res!1002870) b!1476663))

(assert (= (and b!1476663 res!1002874) b!1476657))

(assert (= (and b!1476657 res!1002880) b!1476666))

(assert (= (and b!1476666 res!1002867) b!1476656))

(assert (= (and b!1476656 res!1002875) b!1476659))

(assert (= (and b!1476659 res!1002869) b!1476669))

(assert (= (and b!1476669 res!1002873) b!1476660))

(assert (= (and b!1476660 res!1002879) b!1476652))

(assert (= (and b!1476652 res!1002868) b!1476658))

(assert (= (and b!1476658 res!1002872) b!1476667))

(assert (= (and b!1476667 c!136413) b!1476668))

(assert (= (and b!1476667 (not c!136413)) b!1476662))

(assert (= (and b!1476667 res!1002865) b!1476653))

(assert (= (and b!1476653 res!1002871) b!1476661))

(assert (= (and b!1476661 res!1002866) b!1476654))

(assert (= (and b!1476654 (not res!1002877)) b!1476664))

(assert (= (and b!1476664 res!1002878) b!1476665))

(declare-fun m!1362631 () Bool)

(assert (=> b!1476652 m!1362631))

(assert (=> b!1476652 m!1362631))

(declare-fun m!1362633 () Bool)

(assert (=> b!1476652 m!1362633))

(declare-fun m!1362635 () Bool)

(assert (=> b!1476668 m!1362635))

(declare-fun m!1362637 () Bool)

(assert (=> b!1476654 m!1362637))

(declare-fun m!1362639 () Bool)

(assert (=> b!1476654 m!1362639))

(declare-fun m!1362641 () Bool)

(assert (=> b!1476654 m!1362641))

(assert (=> b!1476654 m!1362631))

(assert (=> b!1476657 m!1362631))

(assert (=> b!1476657 m!1362631))

(declare-fun m!1362643 () Bool)

(assert (=> b!1476657 m!1362643))

(declare-fun m!1362645 () Bool)

(assert (=> start!126136 m!1362645))

(declare-fun m!1362647 () Bool)

(assert (=> start!126136 m!1362647))

(assert (=> b!1476660 m!1362631))

(assert (=> b!1476660 m!1362631))

(declare-fun m!1362649 () Bool)

(assert (=> b!1476660 m!1362649))

(assert (=> b!1476660 m!1362649))

(assert (=> b!1476660 m!1362631))

(declare-fun m!1362651 () Bool)

(assert (=> b!1476660 m!1362651))

(declare-fun m!1362653 () Bool)

(assert (=> b!1476656 m!1362653))

(declare-fun m!1362655 () Bool)

(assert (=> b!1476662 m!1362655))

(declare-fun m!1362657 () Bool)

(assert (=> b!1476662 m!1362657))

(declare-fun m!1362659 () Bool)

(assert (=> b!1476666 m!1362659))

(assert (=> b!1476669 m!1362639))

(declare-fun m!1362661 () Bool)

(assert (=> b!1476669 m!1362661))

(declare-fun m!1362663 () Bool)

(assert (=> b!1476658 m!1362663))

(assert (=> b!1476658 m!1362663))

(declare-fun m!1362665 () Bool)

(assert (=> b!1476658 m!1362665))

(assert (=> b!1476658 m!1362639))

(declare-fun m!1362667 () Bool)

(assert (=> b!1476658 m!1362667))

(assert (=> b!1476664 m!1362631))

(assert (=> b!1476664 m!1362631))

(declare-fun m!1362669 () Bool)

(assert (=> b!1476664 m!1362669))

(declare-fun m!1362671 () Bool)

(assert (=> b!1476663 m!1362671))

(assert (=> b!1476663 m!1362671))

(declare-fun m!1362673 () Bool)

(assert (=> b!1476663 m!1362673))

(declare-fun m!1362675 () Bool)

(assert (=> b!1476661 m!1362675))

(declare-fun m!1362677 () Bool)

(assert (=> b!1476661 m!1362677))

(assert (=> b!1476661 m!1362631))

(declare-fun m!1362679 () Bool)

(assert (=> b!1476661 m!1362679))

(declare-fun m!1362681 () Bool)

(assert (=> b!1476661 m!1362681))

(assert (=> b!1476661 m!1362631))

(push 1)


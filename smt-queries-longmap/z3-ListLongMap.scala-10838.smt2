; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126876 () Bool)

(assert start!126876)

(declare-fun b!1490464 () Bool)

(declare-fun res!1013747 () Bool)

(declare-fun e!835192 () Bool)

(assert (=> b!1490464 (=> (not res!1013747) (not e!835192))))

(declare-datatypes ((array!99649 0))(
  ( (array!99650 (arr!48096 (Array (_ BitVec 32) (_ BitVec 64))) (size!48646 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99649)

(declare-datatypes ((List!34597 0))(
  ( (Nil!34594) (Cons!34593 (h!35976 (_ BitVec 64)) (t!49291 List!34597)) )
))
(declare-fun arrayNoDuplicates!0 (array!99649 (_ BitVec 32) List!34597) Bool)

(assert (=> b!1490464 (= res!1013747 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34594))))

(declare-fun b!1490465 () Bool)

(declare-fun res!1013749 () Bool)

(declare-fun e!835199 () Bool)

(assert (=> b!1490465 (=> (not res!1013749) (not e!835199))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12336 0))(
  ( (MissingZero!12336 (index!51736 (_ BitVec 32))) (Found!12336 (index!51737 (_ BitVec 32))) (Intermediate!12336 (undefined!13148 Bool) (index!51738 (_ BitVec 32)) (x!133328 (_ BitVec 32))) (Undefined!12336) (MissingVacant!12336 (index!51739 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99649 (_ BitVec 32)) SeekEntryResult!12336)

(assert (=> b!1490465 (= res!1013749 (= (seekEntryOrOpen!0 (select (arr!48096 a!2862) j!93) a!2862 mask!2687) (Found!12336 j!93)))))

(declare-fun b!1490466 () Bool)

(declare-fun res!1013746 () Bool)

(declare-fun e!835196 () Bool)

(assert (=> b!1490466 (=> (not res!1013746) (not e!835196))))

(declare-fun e!835193 () Bool)

(assert (=> b!1490466 (= res!1013746 e!835193)))

(declare-fun c!137889 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1490466 (= c!137889 (bvsle x!665 intermediateAfterX!19))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1490467 () Bool)

(assert (=> b!1490467 (= e!835199 (or (= (select (arr!48096 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48096 a!2862) intermediateBeforeIndex!19) (select (arr!48096 a!2862) j!93))))))

(declare-fun b!1490468 () Bool)

(declare-fun e!835197 () Bool)

(assert (=> b!1490468 (= e!835197 e!835196)))

(declare-fun res!1013751 () Bool)

(assert (=> b!1490468 (=> (not res!1013751) (not e!835196))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!649955 () SeekEntryResult!12336)

(assert (=> b!1490468 (= res!1013751 (= lt!649955 (Intermediate!12336 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!649956 () (_ BitVec 64))

(declare-fun lt!649952 () array!99649)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99649 (_ BitVec 32)) SeekEntryResult!12336)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490468 (= lt!649955 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649956 mask!2687) lt!649956 lt!649952 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1490468 (= lt!649956 (select (store (arr!48096 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1490469 () Bool)

(declare-fun e!835194 () Bool)

(assert (=> b!1490469 (= e!835192 e!835194)))

(declare-fun res!1013748 () Bool)

(assert (=> b!1490469 (=> (not res!1013748) (not e!835194))))

(assert (=> b!1490469 (= res!1013748 (= (select (store (arr!48096 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1490469 (= lt!649952 (array!99650 (store (arr!48096 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48646 a!2862)))))

(declare-fun b!1490470 () Bool)

(assert (=> b!1490470 (= e!835194 e!835197)))

(declare-fun res!1013743 () Bool)

(assert (=> b!1490470 (=> (not res!1013743) (not e!835197))))

(declare-fun lt!649953 () SeekEntryResult!12336)

(assert (=> b!1490470 (= res!1013743 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48096 a!2862) j!93) mask!2687) (select (arr!48096 a!2862) j!93) a!2862 mask!2687) lt!649953))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1490470 (= lt!649953 (Intermediate!12336 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1490471 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99649 (_ BitVec 32)) SeekEntryResult!12336)

(assert (=> b!1490471 (= e!835193 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649956 lt!649952 mask!2687) (seekEntryOrOpen!0 lt!649956 lt!649952 mask!2687)))))

(declare-fun b!1490472 () Bool)

(declare-fun res!1013744 () Bool)

(assert (=> b!1490472 (=> (not res!1013744) (not e!835196))))

(assert (=> b!1490472 (= res!1013744 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1490473 () Bool)

(declare-fun res!1013740 () Bool)

(assert (=> b!1490473 (=> (not res!1013740) (not e!835192))))

(assert (=> b!1490473 (= res!1013740 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48646 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48646 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48646 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!1013753 () Bool)

(assert (=> start!126876 (=> (not res!1013753) (not e!835192))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126876 (= res!1013753 (validMask!0 mask!2687))))

(assert (=> start!126876 e!835192))

(assert (=> start!126876 true))

(declare-fun array_inv!37124 (array!99649) Bool)

(assert (=> start!126876 (array_inv!37124 a!2862)))

(declare-fun b!1490474 () Bool)

(assert (=> b!1490474 (= e!835193 (= lt!649955 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649956 lt!649952 mask!2687)))))

(declare-fun b!1490475 () Bool)

(declare-fun e!835195 () Bool)

(assert (=> b!1490475 (= e!835196 (not e!835195))))

(declare-fun res!1013745 () Bool)

(assert (=> b!1490475 (=> res!1013745 e!835195)))

(assert (=> b!1490475 (= res!1013745 (or (and (= (select (arr!48096 a!2862) index!646) (select (store (arr!48096 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48096 a!2862) index!646) (select (arr!48096 a!2862) j!93))) (= (select (arr!48096 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1490475 e!835199))

(declare-fun res!1013741 () Bool)

(assert (=> b!1490475 (=> (not res!1013741) (not e!835199))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99649 (_ BitVec 32)) Bool)

(assert (=> b!1490475 (= res!1013741 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50012 0))(
  ( (Unit!50013) )
))
(declare-fun lt!649954 () Unit!50012)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99649 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50012)

(assert (=> b!1490475 (= lt!649954 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1490476 () Bool)

(assert (=> b!1490476 (= e!835195 true)))

(declare-fun lt!649951 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490476 (= lt!649951 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1490477 () Bool)

(declare-fun res!1013750 () Bool)

(assert (=> b!1490477 (=> (not res!1013750) (not e!835192))))

(assert (=> b!1490477 (= res!1013750 (and (= (size!48646 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48646 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48646 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1490478 () Bool)

(declare-fun res!1013742 () Bool)

(assert (=> b!1490478 (=> (not res!1013742) (not e!835192))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1490478 (= res!1013742 (validKeyInArray!0 (select (arr!48096 a!2862) j!93)))))

(declare-fun b!1490479 () Bool)

(declare-fun res!1013752 () Bool)

(assert (=> b!1490479 (=> (not res!1013752) (not e!835192))))

(assert (=> b!1490479 (= res!1013752 (validKeyInArray!0 (select (arr!48096 a!2862) i!1006)))))

(declare-fun b!1490480 () Bool)

(declare-fun res!1013755 () Bool)

(assert (=> b!1490480 (=> (not res!1013755) (not e!835192))))

(assert (=> b!1490480 (= res!1013755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1490481 () Bool)

(declare-fun res!1013754 () Bool)

(assert (=> b!1490481 (=> (not res!1013754) (not e!835197))))

(assert (=> b!1490481 (= res!1013754 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48096 a!2862) j!93) a!2862 mask!2687) lt!649953))))

(assert (= (and start!126876 res!1013753) b!1490477))

(assert (= (and b!1490477 res!1013750) b!1490479))

(assert (= (and b!1490479 res!1013752) b!1490478))

(assert (= (and b!1490478 res!1013742) b!1490480))

(assert (= (and b!1490480 res!1013755) b!1490464))

(assert (= (and b!1490464 res!1013747) b!1490473))

(assert (= (and b!1490473 res!1013740) b!1490469))

(assert (= (and b!1490469 res!1013748) b!1490470))

(assert (= (and b!1490470 res!1013743) b!1490481))

(assert (= (and b!1490481 res!1013754) b!1490468))

(assert (= (and b!1490468 res!1013751) b!1490466))

(assert (= (and b!1490466 c!137889) b!1490474))

(assert (= (and b!1490466 (not c!137889)) b!1490471))

(assert (= (and b!1490466 res!1013746) b!1490472))

(assert (= (and b!1490472 res!1013744) b!1490475))

(assert (= (and b!1490475 res!1013741) b!1490465))

(assert (= (and b!1490465 res!1013749) b!1490467))

(assert (= (and b!1490475 (not res!1013745)) b!1490476))

(declare-fun m!1374623 () Bool)

(assert (=> start!126876 m!1374623))

(declare-fun m!1374625 () Bool)

(assert (=> start!126876 m!1374625))

(declare-fun m!1374627 () Bool)

(assert (=> b!1490474 m!1374627))

(declare-fun m!1374629 () Bool)

(assert (=> b!1490475 m!1374629))

(declare-fun m!1374631 () Bool)

(assert (=> b!1490475 m!1374631))

(declare-fun m!1374633 () Bool)

(assert (=> b!1490475 m!1374633))

(declare-fun m!1374635 () Bool)

(assert (=> b!1490475 m!1374635))

(declare-fun m!1374637 () Bool)

(assert (=> b!1490475 m!1374637))

(declare-fun m!1374639 () Bool)

(assert (=> b!1490475 m!1374639))

(declare-fun m!1374641 () Bool)

(assert (=> b!1490464 m!1374641))

(declare-fun m!1374643 () Bool)

(assert (=> b!1490468 m!1374643))

(assert (=> b!1490468 m!1374643))

(declare-fun m!1374645 () Bool)

(assert (=> b!1490468 m!1374645))

(assert (=> b!1490468 m!1374631))

(declare-fun m!1374647 () Bool)

(assert (=> b!1490468 m!1374647))

(assert (=> b!1490470 m!1374639))

(assert (=> b!1490470 m!1374639))

(declare-fun m!1374649 () Bool)

(assert (=> b!1490470 m!1374649))

(assert (=> b!1490470 m!1374649))

(assert (=> b!1490470 m!1374639))

(declare-fun m!1374651 () Bool)

(assert (=> b!1490470 m!1374651))

(assert (=> b!1490469 m!1374631))

(declare-fun m!1374653 () Bool)

(assert (=> b!1490469 m!1374653))

(declare-fun m!1374655 () Bool)

(assert (=> b!1490471 m!1374655))

(declare-fun m!1374657 () Bool)

(assert (=> b!1490471 m!1374657))

(declare-fun m!1374659 () Bool)

(assert (=> b!1490480 m!1374659))

(declare-fun m!1374661 () Bool)

(assert (=> b!1490476 m!1374661))

(declare-fun m!1374663 () Bool)

(assert (=> b!1490479 m!1374663))

(assert (=> b!1490479 m!1374663))

(declare-fun m!1374665 () Bool)

(assert (=> b!1490479 m!1374665))

(assert (=> b!1490478 m!1374639))

(assert (=> b!1490478 m!1374639))

(declare-fun m!1374667 () Bool)

(assert (=> b!1490478 m!1374667))

(assert (=> b!1490465 m!1374639))

(assert (=> b!1490465 m!1374639))

(declare-fun m!1374669 () Bool)

(assert (=> b!1490465 m!1374669))

(declare-fun m!1374671 () Bool)

(assert (=> b!1490467 m!1374671))

(assert (=> b!1490467 m!1374639))

(assert (=> b!1490481 m!1374639))

(assert (=> b!1490481 m!1374639))

(declare-fun m!1374673 () Bool)

(assert (=> b!1490481 m!1374673))

(check-sat (not b!1490474) (not b!1490481) (not b!1490471) (not b!1490478) (not start!126876) (not b!1490464) (not b!1490480) (not b!1490465) (not b!1490475) (not b!1490479) (not b!1490468) (not b!1490476) (not b!1490470))
(check-sat)

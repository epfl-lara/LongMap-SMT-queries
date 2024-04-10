; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125262 () Bool)

(assert start!125262)

(declare-fun lt!640347 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!821929 () Bool)

(declare-fun b!1462119 () Bool)

(declare-datatypes ((array!98710 0))(
  ( (array!98711 (arr!47643 (Array (_ BitVec 32) (_ BitVec 64))) (size!48193 (_ BitVec 32))) )
))
(declare-fun lt!640351 () array!98710)

(declare-fun lt!640352 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11895 0))(
  ( (MissingZero!11895 (index!49972 (_ BitVec 32))) (Found!11895 (index!49973 (_ BitVec 32))) (Intermediate!11895 (undefined!12707 Bool) (index!49974 (_ BitVec 32)) (x!131568 (_ BitVec 32))) (Undefined!11895) (MissingVacant!11895 (index!49975 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98710 (_ BitVec 32)) SeekEntryResult!11895)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98710 (_ BitVec 32)) SeekEntryResult!11895)

(assert (=> b!1462119 (= e!821929 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640347 intermediateAfterIndex!19 lt!640352 lt!640351 mask!2687) (seekEntryOrOpen!0 lt!640352 lt!640351 mask!2687))))))

(declare-fun b!1462120 () Bool)

(declare-fun e!821921 () Bool)

(declare-fun e!821930 () Bool)

(assert (=> b!1462120 (= e!821921 e!821930)))

(declare-fun res!991614 () Bool)

(assert (=> b!1462120 (=> (not res!991614) (not e!821930))))

(declare-fun lt!640353 () SeekEntryResult!11895)

(declare-fun a!2862 () array!98710)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98710 (_ BitVec 32)) SeekEntryResult!11895)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462120 (= res!991614 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47643 a!2862) j!93) mask!2687) (select (arr!47643 a!2862) j!93) a!2862 mask!2687) lt!640353))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1462120 (= lt!640353 (Intermediate!11895 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1462121 () Bool)

(declare-fun res!991616 () Bool)

(declare-fun e!821924 () Bool)

(assert (=> b!1462121 (=> (not res!991616) (not e!821924))))

(declare-datatypes ((List!34144 0))(
  ( (Nil!34141) (Cons!34140 (h!35490 (_ BitVec 64)) (t!48838 List!34144)) )
))
(declare-fun arrayNoDuplicates!0 (array!98710 (_ BitVec 32) List!34144) Bool)

(assert (=> b!1462121 (= res!991616 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34141))))

(declare-fun res!991624 () Bool)

(assert (=> start!125262 (=> (not res!991624) (not e!821924))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125262 (= res!991624 (validMask!0 mask!2687))))

(assert (=> start!125262 e!821924))

(assert (=> start!125262 true))

(declare-fun array_inv!36671 (array!98710) Bool)

(assert (=> start!125262 (array_inv!36671 a!2862)))

(declare-fun b!1462122 () Bool)

(declare-fun e!821926 () Bool)

(assert (=> b!1462122 (= e!821930 e!821926)))

(declare-fun res!991612 () Bool)

(assert (=> b!1462122 (=> (not res!991612) (not e!821926))))

(declare-fun lt!640350 () SeekEntryResult!11895)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1462122 (= res!991612 (= lt!640350 (Intermediate!11895 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1462122 (= lt!640350 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640352 mask!2687) lt!640352 lt!640351 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1462122 (= lt!640352 (select (store (arr!47643 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1462123 () Bool)

(declare-fun res!991621 () Bool)

(assert (=> b!1462123 (=> (not res!991621) (not e!821926))))

(assert (=> b!1462123 (= res!991621 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1462124 () Bool)

(assert (=> b!1462124 (= e!821929 (not (= lt!640350 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640347 lt!640352 lt!640351 mask!2687))))))

(declare-fun b!1462125 () Bool)

(declare-fun res!991619 () Bool)

(assert (=> b!1462125 (=> (not res!991619) (not e!821924))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1462125 (= res!991619 (validKeyInArray!0 (select (arr!47643 a!2862) i!1006)))))

(declare-fun b!1462126 () Bool)

(declare-fun res!991618 () Bool)

(assert (=> b!1462126 (=> (not res!991618) (not e!821924))))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1462126 (= res!991618 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48193 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48193 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48193 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1462127 () Bool)

(declare-fun res!991622 () Bool)

(assert (=> b!1462127 (=> (not res!991622) (not e!821926))))

(declare-fun e!821922 () Bool)

(assert (=> b!1462127 (= res!991622 e!821922)))

(declare-fun c!134765 () Bool)

(assert (=> b!1462127 (= c!134765 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1462128 () Bool)

(declare-fun res!991623 () Bool)

(declare-fun e!821923 () Bool)

(assert (=> b!1462128 (=> res!991623 e!821923)))

(assert (=> b!1462128 (= res!991623 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640347 (select (arr!47643 a!2862) j!93) a!2862 mask!2687) lt!640353)))))

(declare-fun b!1462129 () Bool)

(declare-fun res!991627 () Bool)

(assert (=> b!1462129 (=> (not res!991627) (not e!821930))))

(assert (=> b!1462129 (= res!991627 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47643 a!2862) j!93) a!2862 mask!2687) lt!640353))))

(declare-fun b!1462130 () Bool)

(declare-fun e!821927 () Bool)

(assert (=> b!1462130 (= e!821926 (not e!821927))))

(declare-fun res!991615 () Bool)

(assert (=> b!1462130 (=> res!991615 e!821927)))

(assert (=> b!1462130 (= res!991615 (or (and (= (select (arr!47643 a!2862) index!646) (select (store (arr!47643 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47643 a!2862) index!646) (select (arr!47643 a!2862) j!93))) (= (select (arr!47643 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!821928 () Bool)

(assert (=> b!1462130 e!821928))

(declare-fun res!991617 () Bool)

(assert (=> b!1462130 (=> (not res!991617) (not e!821928))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98710 (_ BitVec 32)) Bool)

(assert (=> b!1462130 (= res!991617 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49286 0))(
  ( (Unit!49287) )
))
(declare-fun lt!640349 () Unit!49286)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98710 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49286)

(assert (=> b!1462130 (= lt!640349 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1462131 () Bool)

(assert (=> b!1462131 (= e!821927 e!821923)))

(declare-fun res!991626 () Bool)

(assert (=> b!1462131 (=> res!991626 e!821923)))

(assert (=> b!1462131 (= res!991626 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640347 #b00000000000000000000000000000000) (bvsge lt!640347 (size!48193 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462131 (= lt!640347 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1462132 () Bool)

(assert (=> b!1462132 (= e!821924 e!821921)))

(declare-fun res!991625 () Bool)

(assert (=> b!1462132 (=> (not res!991625) (not e!821921))))

(assert (=> b!1462132 (= res!991625 (= (select (store (arr!47643 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1462132 (= lt!640351 (array!98711 (store (arr!47643 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48193 a!2862)))))

(declare-fun b!1462133 () Bool)

(declare-fun res!991611 () Bool)

(assert (=> b!1462133 (=> (not res!991611) (not e!821924))))

(assert (=> b!1462133 (= res!991611 (and (= (size!48193 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48193 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48193 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1462134 () Bool)

(assert (=> b!1462134 (= e!821922 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640352 lt!640351 mask!2687) (seekEntryOrOpen!0 lt!640352 lt!640351 mask!2687)))))

(declare-fun b!1462135 () Bool)

(assert (=> b!1462135 (= e!821928 (or (= (select (arr!47643 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47643 a!2862) intermediateBeforeIndex!19) (select (arr!47643 a!2862) j!93))))))

(declare-fun b!1462136 () Bool)

(declare-fun res!991610 () Bool)

(assert (=> b!1462136 (=> (not res!991610) (not e!821924))))

(assert (=> b!1462136 (= res!991610 (validKeyInArray!0 (select (arr!47643 a!2862) j!93)))))

(declare-fun b!1462137 () Bool)

(assert (=> b!1462137 (= e!821922 (= lt!640350 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640352 lt!640351 mask!2687)))))

(declare-fun b!1462138 () Bool)

(declare-fun res!991613 () Bool)

(assert (=> b!1462138 (=> (not res!991613) (not e!821924))))

(assert (=> b!1462138 (= res!991613 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1462139 () Bool)

(assert (=> b!1462139 (= e!821923 true)))

(declare-fun lt!640348 () Bool)

(assert (=> b!1462139 (= lt!640348 e!821929)))

(declare-fun c!134766 () Bool)

(assert (=> b!1462139 (= c!134766 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1462140 () Bool)

(declare-fun res!991620 () Bool)

(assert (=> b!1462140 (=> (not res!991620) (not e!821928))))

(assert (=> b!1462140 (= res!991620 (= (seekEntryOrOpen!0 (select (arr!47643 a!2862) j!93) a!2862 mask!2687) (Found!11895 j!93)))))

(assert (= (and start!125262 res!991624) b!1462133))

(assert (= (and b!1462133 res!991611) b!1462125))

(assert (= (and b!1462125 res!991619) b!1462136))

(assert (= (and b!1462136 res!991610) b!1462138))

(assert (= (and b!1462138 res!991613) b!1462121))

(assert (= (and b!1462121 res!991616) b!1462126))

(assert (= (and b!1462126 res!991618) b!1462132))

(assert (= (and b!1462132 res!991625) b!1462120))

(assert (= (and b!1462120 res!991614) b!1462129))

(assert (= (and b!1462129 res!991627) b!1462122))

(assert (= (and b!1462122 res!991612) b!1462127))

(assert (= (and b!1462127 c!134765) b!1462137))

(assert (= (and b!1462127 (not c!134765)) b!1462134))

(assert (= (and b!1462127 res!991622) b!1462123))

(assert (= (and b!1462123 res!991621) b!1462130))

(assert (= (and b!1462130 res!991617) b!1462140))

(assert (= (and b!1462140 res!991620) b!1462135))

(assert (= (and b!1462130 (not res!991615)) b!1462131))

(assert (= (and b!1462131 (not res!991626)) b!1462128))

(assert (= (and b!1462128 (not res!991623)) b!1462139))

(assert (= (and b!1462139 c!134766) b!1462124))

(assert (= (and b!1462139 (not c!134766)) b!1462119))

(declare-fun m!1349615 () Bool)

(assert (=> b!1462120 m!1349615))

(assert (=> b!1462120 m!1349615))

(declare-fun m!1349617 () Bool)

(assert (=> b!1462120 m!1349617))

(assert (=> b!1462120 m!1349617))

(assert (=> b!1462120 m!1349615))

(declare-fun m!1349619 () Bool)

(assert (=> b!1462120 m!1349619))

(declare-fun m!1349621 () Bool)

(assert (=> b!1462132 m!1349621))

(declare-fun m!1349623 () Bool)

(assert (=> b!1462132 m!1349623))

(declare-fun m!1349625 () Bool)

(assert (=> b!1462125 m!1349625))

(assert (=> b!1462125 m!1349625))

(declare-fun m!1349627 () Bool)

(assert (=> b!1462125 m!1349627))

(declare-fun m!1349629 () Bool)

(assert (=> b!1462138 m!1349629))

(declare-fun m!1349631 () Bool)

(assert (=> b!1462122 m!1349631))

(assert (=> b!1462122 m!1349631))

(declare-fun m!1349633 () Bool)

(assert (=> b!1462122 m!1349633))

(assert (=> b!1462122 m!1349621))

(declare-fun m!1349635 () Bool)

(assert (=> b!1462122 m!1349635))

(declare-fun m!1349637 () Bool)

(assert (=> b!1462135 m!1349637))

(assert (=> b!1462135 m!1349615))

(declare-fun m!1349639 () Bool)

(assert (=> b!1462121 m!1349639))

(assert (=> b!1462128 m!1349615))

(assert (=> b!1462128 m!1349615))

(declare-fun m!1349641 () Bool)

(assert (=> b!1462128 m!1349641))

(declare-fun m!1349643 () Bool)

(assert (=> b!1462119 m!1349643))

(declare-fun m!1349645 () Bool)

(assert (=> b!1462119 m!1349645))

(declare-fun m!1349647 () Bool)

(assert (=> b!1462131 m!1349647))

(declare-fun m!1349649 () Bool)

(assert (=> b!1462134 m!1349649))

(assert (=> b!1462134 m!1349645))

(declare-fun m!1349651 () Bool)

(assert (=> b!1462137 m!1349651))

(assert (=> b!1462136 m!1349615))

(assert (=> b!1462136 m!1349615))

(declare-fun m!1349653 () Bool)

(assert (=> b!1462136 m!1349653))

(declare-fun m!1349655 () Bool)

(assert (=> b!1462124 m!1349655))

(declare-fun m!1349657 () Bool)

(assert (=> b!1462130 m!1349657))

(assert (=> b!1462130 m!1349621))

(declare-fun m!1349659 () Bool)

(assert (=> b!1462130 m!1349659))

(declare-fun m!1349661 () Bool)

(assert (=> b!1462130 m!1349661))

(declare-fun m!1349663 () Bool)

(assert (=> b!1462130 m!1349663))

(assert (=> b!1462130 m!1349615))

(assert (=> b!1462140 m!1349615))

(assert (=> b!1462140 m!1349615))

(declare-fun m!1349665 () Bool)

(assert (=> b!1462140 m!1349665))

(declare-fun m!1349667 () Bool)

(assert (=> start!125262 m!1349667))

(declare-fun m!1349669 () Bool)

(assert (=> start!125262 m!1349669))

(assert (=> b!1462129 m!1349615))

(assert (=> b!1462129 m!1349615))

(declare-fun m!1349671 () Bool)

(assert (=> b!1462129 m!1349671))

(check-sat (not b!1462121) (not b!1462136) (not b!1462128) (not b!1462130) (not b!1462125) (not b!1462138) (not b!1462120) (not b!1462131) (not start!125262) (not b!1462134) (not b!1462124) (not b!1462119) (not b!1462140) (not b!1462137) (not b!1462129) (not b!1462122))

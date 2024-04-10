; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126174 () Bool)

(assert start!126174)

(declare-fun b!1477678 () Bool)

(declare-fun res!1003785 () Bool)

(declare-fun e!828965 () Bool)

(assert (=> b!1477678 (=> (not res!1003785) (not e!828965))))

(declare-datatypes ((array!99280 0))(
  ( (array!99281 (arr!47919 (Array (_ BitVec 32) (_ BitVec 64))) (size!48469 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99280)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1477678 (= res!1003785 (validKeyInArray!0 (select (arr!47919 a!2862) i!1006)))))

(declare-fun b!1477679 () Bool)

(declare-fun res!1003780 () Bool)

(assert (=> b!1477679 (=> (not res!1003780) (not e!828965))))

(declare-datatypes ((List!34420 0))(
  ( (Nil!34417) (Cons!34416 (h!35784 (_ BitVec 64)) (t!49114 List!34420)) )
))
(declare-fun arrayNoDuplicates!0 (array!99280 (_ BitVec 32) List!34420) Bool)

(assert (=> b!1477679 (= res!1003780 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34417))))

(declare-fun b!1477680 () Bool)

(declare-fun e!828964 () Bool)

(declare-fun e!828967 () Bool)

(assert (=> b!1477680 (= e!828964 e!828967)))

(declare-fun res!1003784 () Bool)

(assert (=> b!1477680 (=> res!1003784 e!828967)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1477680 (= res!1003784 (or (and (= (select (arr!47919 a!2862) index!646) (select (store (arr!47919 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47919 a!2862) index!646) (select (arr!47919 a!2862) j!93))) (not (= (select (arr!47919 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1477681 () Bool)

(declare-fun e!828970 () Bool)

(declare-fun e!828963 () Bool)

(assert (=> b!1477681 (= e!828970 e!828963)))

(declare-fun res!1003788 () Bool)

(assert (=> b!1477681 (=> (not res!1003788) (not e!828963))))

(declare-datatypes ((SeekEntryResult!12159 0))(
  ( (MissingZero!12159 (index!51028 (_ BitVec 32))) (Found!12159 (index!51029 (_ BitVec 32))) (Intermediate!12159 (undefined!12971 Bool) (index!51030 (_ BitVec 32)) (x!132622 (_ BitVec 32))) (Undefined!12159) (MissingVacant!12159 (index!51031 (_ BitVec 32))) )
))
(declare-fun lt!645428 () SeekEntryResult!12159)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1477681 (= res!1003788 (= lt!645428 (Intermediate!12159 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!645427 () array!99280)

(declare-fun lt!645429 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99280 (_ BitVec 32)) SeekEntryResult!12159)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1477681 (= lt!645428 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645429 mask!2687) lt!645429 lt!645427 mask!2687))))

(assert (=> b!1477681 (= lt!645429 (select (store (arr!47919 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1477683 () Bool)

(declare-fun e!828968 () Bool)

(assert (=> b!1477683 (= e!828968 (= lt!645428 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645429 lt!645427 mask!2687)))))

(declare-fun b!1477684 () Bool)

(declare-fun res!1003777 () Bool)

(assert (=> b!1477684 (=> (not res!1003777) (not e!828965))))

(assert (=> b!1477684 (= res!1003777 (and (= (size!48469 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48469 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48469 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1477685 () Bool)

(declare-fun e!828969 () Bool)

(assert (=> b!1477685 (= e!828967 e!828969)))

(declare-fun res!1003782 () Bool)

(assert (=> b!1477685 (=> (not res!1003782) (not e!828969))))

(declare-fun lt!645430 () SeekEntryResult!12159)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99280 (_ BitVec 32)) SeekEntryResult!12159)

(assert (=> b!1477685 (= res!1003782 (= lt!645430 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47919 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1477686 () Bool)

(declare-fun e!828966 () Bool)

(assert (=> b!1477686 (= e!828965 e!828966)))

(declare-fun res!1003787 () Bool)

(assert (=> b!1477686 (=> (not res!1003787) (not e!828966))))

(assert (=> b!1477686 (= res!1003787 (= (select (store (arr!47919 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1477686 (= lt!645427 (array!99281 (store (arr!47919 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48469 a!2862)))))

(declare-fun b!1477687 () Bool)

(declare-fun res!1003789 () Bool)

(assert (=> b!1477687 (=> (not res!1003789) (not e!828963))))

(assert (=> b!1477687 (= res!1003789 e!828968)))

(declare-fun c!136470 () Bool)

(assert (=> b!1477687 (= c!136470 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1477688 () Bool)

(declare-fun res!1003783 () Bool)

(assert (=> b!1477688 (=> (not res!1003783) (not e!828970))))

(declare-fun lt!645432 () SeekEntryResult!12159)

(assert (=> b!1477688 (= res!1003783 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47919 a!2862) j!93) a!2862 mask!2687) lt!645432))))

(declare-fun res!1003778 () Bool)

(assert (=> start!126174 (=> (not res!1003778) (not e!828965))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126174 (= res!1003778 (validMask!0 mask!2687))))

(assert (=> start!126174 e!828965))

(assert (=> start!126174 true))

(declare-fun array_inv!36947 (array!99280) Bool)

(assert (=> start!126174 (array_inv!36947 a!2862)))

(declare-fun b!1477682 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99280 (_ BitVec 32)) SeekEntryResult!12159)

(assert (=> b!1477682 (= e!828968 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645429 lt!645427 mask!2687) (seekEntryOrOpen!0 lt!645429 lt!645427 mask!2687)))))

(declare-fun b!1477689 () Bool)

(declare-fun res!1003779 () Bool)

(assert (=> b!1477689 (=> (not res!1003779) (not e!828965))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99280 (_ BitVec 32)) Bool)

(assert (=> b!1477689 (= res!1003779 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1477690 () Bool)

(declare-fun res!1003790 () Bool)

(assert (=> b!1477690 (=> (not res!1003790) (not e!828965))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1477690 (= res!1003790 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48469 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48469 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48469 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1477691 () Bool)

(assert (=> b!1477691 (= e!828969 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1477692 () Bool)

(assert (=> b!1477692 (= e!828963 (not true))))

(assert (=> b!1477692 e!828964))

(declare-fun res!1003781 () Bool)

(assert (=> b!1477692 (=> (not res!1003781) (not e!828964))))

(assert (=> b!1477692 (= res!1003781 (and (= lt!645430 (Found!12159 j!93)) (or (= (select (arr!47919 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47919 a!2862) intermediateBeforeIndex!19) (select (arr!47919 a!2862) j!93)))))))

(assert (=> b!1477692 (= lt!645430 (seekEntryOrOpen!0 (select (arr!47919 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1477692 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49658 0))(
  ( (Unit!49659) )
))
(declare-fun lt!645431 () Unit!49658)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99280 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49658)

(assert (=> b!1477692 (= lt!645431 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1477693 () Bool)

(declare-fun res!1003786 () Bool)

(assert (=> b!1477693 (=> (not res!1003786) (not e!828963))))

(assert (=> b!1477693 (= res!1003786 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1477694 () Bool)

(declare-fun res!1003792 () Bool)

(assert (=> b!1477694 (=> (not res!1003792) (not e!828965))))

(assert (=> b!1477694 (= res!1003792 (validKeyInArray!0 (select (arr!47919 a!2862) j!93)))))

(declare-fun b!1477695 () Bool)

(assert (=> b!1477695 (= e!828966 e!828970)))

(declare-fun res!1003791 () Bool)

(assert (=> b!1477695 (=> (not res!1003791) (not e!828970))))

(assert (=> b!1477695 (= res!1003791 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47919 a!2862) j!93) mask!2687) (select (arr!47919 a!2862) j!93) a!2862 mask!2687) lt!645432))))

(assert (=> b!1477695 (= lt!645432 (Intermediate!12159 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!126174 res!1003778) b!1477684))

(assert (= (and b!1477684 res!1003777) b!1477678))

(assert (= (and b!1477678 res!1003785) b!1477694))

(assert (= (and b!1477694 res!1003792) b!1477689))

(assert (= (and b!1477689 res!1003779) b!1477679))

(assert (= (and b!1477679 res!1003780) b!1477690))

(assert (= (and b!1477690 res!1003790) b!1477686))

(assert (= (and b!1477686 res!1003787) b!1477695))

(assert (= (and b!1477695 res!1003791) b!1477688))

(assert (= (and b!1477688 res!1003783) b!1477681))

(assert (= (and b!1477681 res!1003788) b!1477687))

(assert (= (and b!1477687 c!136470) b!1477683))

(assert (= (and b!1477687 (not c!136470)) b!1477682))

(assert (= (and b!1477687 res!1003789) b!1477693))

(assert (= (and b!1477693 res!1003786) b!1477692))

(assert (= (and b!1477692 res!1003781) b!1477680))

(assert (= (and b!1477680 (not res!1003784)) b!1477685))

(assert (= (and b!1477685 res!1003782) b!1477691))

(declare-fun m!1363619 () Bool)

(assert (=> b!1477686 m!1363619))

(declare-fun m!1363621 () Bool)

(assert (=> b!1477686 m!1363621))

(declare-fun m!1363623 () Bool)

(assert (=> b!1477692 m!1363623))

(declare-fun m!1363625 () Bool)

(assert (=> b!1477692 m!1363625))

(declare-fun m!1363627 () Bool)

(assert (=> b!1477692 m!1363627))

(declare-fun m!1363629 () Bool)

(assert (=> b!1477692 m!1363629))

(declare-fun m!1363631 () Bool)

(assert (=> b!1477692 m!1363631))

(assert (=> b!1477692 m!1363627))

(declare-fun m!1363633 () Bool)

(assert (=> b!1477678 m!1363633))

(assert (=> b!1477678 m!1363633))

(declare-fun m!1363635 () Bool)

(assert (=> b!1477678 m!1363635))

(assert (=> b!1477685 m!1363627))

(assert (=> b!1477685 m!1363627))

(declare-fun m!1363637 () Bool)

(assert (=> b!1477685 m!1363637))

(assert (=> b!1477694 m!1363627))

(assert (=> b!1477694 m!1363627))

(declare-fun m!1363639 () Bool)

(assert (=> b!1477694 m!1363639))

(assert (=> b!1477688 m!1363627))

(assert (=> b!1477688 m!1363627))

(declare-fun m!1363641 () Bool)

(assert (=> b!1477688 m!1363641))

(declare-fun m!1363643 () Bool)

(assert (=> b!1477689 m!1363643))

(declare-fun m!1363645 () Bool)

(assert (=> b!1477681 m!1363645))

(assert (=> b!1477681 m!1363645))

(declare-fun m!1363647 () Bool)

(assert (=> b!1477681 m!1363647))

(assert (=> b!1477681 m!1363619))

(declare-fun m!1363649 () Bool)

(assert (=> b!1477681 m!1363649))

(declare-fun m!1363651 () Bool)

(assert (=> start!126174 m!1363651))

(declare-fun m!1363653 () Bool)

(assert (=> start!126174 m!1363653))

(declare-fun m!1363655 () Bool)

(assert (=> b!1477679 m!1363655))

(declare-fun m!1363657 () Bool)

(assert (=> b!1477682 m!1363657))

(declare-fun m!1363659 () Bool)

(assert (=> b!1477682 m!1363659))

(declare-fun m!1363661 () Bool)

(assert (=> b!1477680 m!1363661))

(assert (=> b!1477680 m!1363619))

(declare-fun m!1363663 () Bool)

(assert (=> b!1477680 m!1363663))

(assert (=> b!1477680 m!1363627))

(declare-fun m!1363665 () Bool)

(assert (=> b!1477683 m!1363665))

(assert (=> b!1477695 m!1363627))

(assert (=> b!1477695 m!1363627))

(declare-fun m!1363667 () Bool)

(assert (=> b!1477695 m!1363667))

(assert (=> b!1477695 m!1363667))

(assert (=> b!1477695 m!1363627))

(declare-fun m!1363669 () Bool)

(assert (=> b!1477695 m!1363669))

(check-sat (not b!1477695) (not b!1477681) (not b!1477692) (not b!1477682) (not b!1477694) (not b!1477689) (not b!1477678) (not b!1477685) (not start!126174) (not b!1477688) (not b!1477683) (not b!1477679))
(check-sat)

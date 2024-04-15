; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126698 () Bool)

(assert start!126698)

(declare-fun b!1487634 () Bool)

(declare-fun res!1011809 () Bool)

(declare-fun e!833843 () Bool)

(assert (=> b!1487634 (=> (not res!1011809) (not e!833843))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99532 0))(
  ( (array!99533 (arr!48040 (Array (_ BitVec 32) (_ BitVec 64))) (size!48592 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99532)

(assert (=> b!1487634 (= res!1011809 (and (= (size!48592 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48592 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48592 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1487635 () Bool)

(declare-fun res!1011806 () Bool)

(assert (=> b!1487635 (=> (not res!1011806) (not e!833843))))

(declare-datatypes ((List!34619 0))(
  ( (Nil!34616) (Cons!34615 (h!35995 (_ BitVec 64)) (t!49305 List!34619)) )
))
(declare-fun arrayNoDuplicates!0 (array!99532 (_ BitVec 32) List!34619) Bool)

(assert (=> b!1487635 (= res!1011806 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34616))))

(declare-fun b!1487636 () Bool)

(declare-fun res!1011818 () Bool)

(declare-fun e!833844 () Bool)

(assert (=> b!1487636 (=> (not res!1011818) (not e!833844))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1487636 (= res!1011818 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1487637 () Bool)

(declare-fun e!833852 () Bool)

(assert (=> b!1487637 (= e!833852 e!833844)))

(declare-fun res!1011808 () Bool)

(assert (=> b!1487637 (=> (not res!1011808) (not e!833844))))

(declare-datatypes ((SeekEntryResult!12305 0))(
  ( (MissingZero!12305 (index!51612 (_ BitVec 32))) (Found!12305 (index!51613 (_ BitVec 32))) (Intermediate!12305 (undefined!13117 Bool) (index!51614 (_ BitVec 32)) (x!133198 (_ BitVec 32))) (Undefined!12305) (MissingVacant!12305 (index!51615 (_ BitVec 32))) )
))
(declare-fun lt!648725 () SeekEntryResult!12305)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1487637 (= res!1011808 (= lt!648725 (Intermediate!12305 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!648730 () (_ BitVec 64))

(declare-fun lt!648726 () array!99532)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99532 (_ BitVec 32)) SeekEntryResult!12305)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1487637 (= lt!648725 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648730 mask!2687) lt!648730 lt!648726 mask!2687))))

(assert (=> b!1487637 (= lt!648730 (select (store (arr!48040 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1487638 () Bool)

(declare-fun e!833847 () Bool)

(declare-fun e!833850 () Bool)

(assert (=> b!1487638 (= e!833847 e!833850)))

(declare-fun res!1011817 () Bool)

(assert (=> b!1487638 (=> res!1011817 e!833850)))

(declare-fun lt!648731 () (_ BitVec 32))

(assert (=> b!1487638 (= res!1011817 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!648731 #b00000000000000000000000000000000) (bvsge lt!648731 (size!48592 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1487638 (= lt!648731 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!648727 () SeekEntryResult!12305)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99532 (_ BitVec 32)) SeekEntryResult!12305)

(assert (=> b!1487638 (= lt!648727 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648730 lt!648726 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99532 (_ BitVec 32)) SeekEntryResult!12305)

(assert (=> b!1487638 (= lt!648727 (seekEntryOrOpen!0 lt!648730 lt!648726 mask!2687))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1487639 () Bool)

(declare-fun e!833851 () Bool)

(assert (=> b!1487639 (= e!833851 (and (or (= (select (arr!48040 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48040 a!2862) intermediateBeforeIndex!19) (select (arr!48040 a!2862) j!93))) (let ((bdg!54636 (select (store (arr!48040 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48040 a!2862) index!646) bdg!54636) (= (select (arr!48040 a!2862) index!646) (select (arr!48040 a!2862) j!93))) (= (select (arr!48040 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54636 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1487640 () Bool)

(declare-fun e!833849 () Bool)

(assert (=> b!1487640 (= e!833843 e!833849)))

(declare-fun res!1011821 () Bool)

(assert (=> b!1487640 (=> (not res!1011821) (not e!833849))))

(assert (=> b!1487640 (= res!1011821 (= (select (store (arr!48040 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487640 (= lt!648726 (array!99533 (store (arr!48040 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48592 a!2862)))))

(declare-fun b!1487641 () Bool)

(declare-fun res!1011812 () Bool)

(assert (=> b!1487641 (=> (not res!1011812) (not e!833843))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1487641 (= res!1011812 (validKeyInArray!0 (select (arr!48040 a!2862) j!93)))))

(declare-fun b!1487642 () Bool)

(declare-fun e!833845 () Bool)

(assert (=> b!1487642 (= e!833850 e!833845)))

(declare-fun c!137443 () Bool)

(assert (=> b!1487642 (= c!137443 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1487644 () Bool)

(declare-fun res!1011819 () Bool)

(assert (=> b!1487644 (=> (not res!1011819) (not e!833851))))

(assert (=> b!1487644 (= res!1011819 (= (seekEntryOrOpen!0 (select (arr!48040 a!2862) j!93) a!2862 mask!2687) (Found!12305 j!93)))))

(declare-fun b!1487645 () Bool)

(declare-fun res!1011814 () Bool)

(assert (=> b!1487645 (=> (not res!1011814) (not e!833844))))

(declare-fun e!833846 () Bool)

(assert (=> b!1487645 (= res!1011814 e!833846)))

(declare-fun c!137442 () Bool)

(assert (=> b!1487645 (= c!137442 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1487646 () Bool)

(assert (=> b!1487646 (= e!833845 (= lt!648725 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!648731 lt!648730 lt!648726 mask!2687)))))

(declare-fun b!1487647 () Bool)

(assert (=> b!1487647 (= e!833849 e!833852)))

(declare-fun res!1011807 () Bool)

(assert (=> b!1487647 (=> (not res!1011807) (not e!833852))))

(declare-fun lt!648728 () SeekEntryResult!12305)

(assert (=> b!1487647 (= res!1011807 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48040 a!2862) j!93) mask!2687) (select (arr!48040 a!2862) j!93) a!2862 mask!2687) lt!648728))))

(assert (=> b!1487647 (= lt!648728 (Intermediate!12305 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1487648 () Bool)

(declare-fun res!1011822 () Bool)

(assert (=> b!1487648 (=> res!1011822 e!833850)))

(assert (=> b!1487648 (= res!1011822 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!648731 (select (arr!48040 a!2862) j!93) a!2862 mask!2687) lt!648728)))))

(declare-fun b!1487649 () Bool)

(assert (=> b!1487649 (= e!833844 (not e!833847))))

(declare-fun res!1011810 () Bool)

(assert (=> b!1487649 (=> res!1011810 e!833847)))

(assert (=> b!1487649 (= res!1011810 (or (and (= (select (arr!48040 a!2862) index!646) (select (store (arr!48040 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48040 a!2862) index!646) (select (arr!48040 a!2862) j!93))) (= (select (arr!48040 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1487649 e!833851))

(declare-fun res!1011823 () Bool)

(assert (=> b!1487649 (=> (not res!1011823) (not e!833851))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99532 (_ BitVec 32)) Bool)

(assert (=> b!1487649 (= res!1011823 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49791 0))(
  ( (Unit!49792) )
))
(declare-fun lt!648729 () Unit!49791)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99532 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49791)

(assert (=> b!1487649 (= lt!648729 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1487650 () Bool)

(assert (=> b!1487650 (= e!833846 (= lt!648725 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648730 lt!648726 mask!2687)))))

(declare-fun b!1487651 () Bool)

(assert (=> b!1487651 (= e!833846 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648730 lt!648726 mask!2687) (seekEntryOrOpen!0 lt!648730 lt!648726 mask!2687)))))

(declare-fun b!1487652 () Bool)

(declare-fun res!1011815 () Bool)

(assert (=> b!1487652 (=> (not res!1011815) (not e!833843))))

(assert (=> b!1487652 (= res!1011815 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48592 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48592 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48592 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1487653 () Bool)

(declare-fun res!1011816 () Bool)

(assert (=> b!1487653 (=> (not res!1011816) (not e!833843))))

(assert (=> b!1487653 (= res!1011816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1487654 () Bool)

(declare-fun res!1011820 () Bool)

(assert (=> b!1487654 (=> (not res!1011820) (not e!833843))))

(assert (=> b!1487654 (= res!1011820 (validKeyInArray!0 (select (arr!48040 a!2862) i!1006)))))

(declare-fun b!1487655 () Bool)

(assert (=> b!1487655 (= e!833845 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!648731 intermediateAfterIndex!19 lt!648730 lt!648726 mask!2687) lt!648727))))

(declare-fun res!1011811 () Bool)

(assert (=> start!126698 (=> (not res!1011811) (not e!833843))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126698 (= res!1011811 (validMask!0 mask!2687))))

(assert (=> start!126698 e!833843))

(assert (=> start!126698 true))

(declare-fun array_inv!37273 (array!99532) Bool)

(assert (=> start!126698 (array_inv!37273 a!2862)))

(declare-fun b!1487643 () Bool)

(declare-fun res!1011813 () Bool)

(assert (=> b!1487643 (=> (not res!1011813) (not e!833852))))

(assert (=> b!1487643 (= res!1011813 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48040 a!2862) j!93) a!2862 mask!2687) lt!648728))))

(assert (= (and start!126698 res!1011811) b!1487634))

(assert (= (and b!1487634 res!1011809) b!1487654))

(assert (= (and b!1487654 res!1011820) b!1487641))

(assert (= (and b!1487641 res!1011812) b!1487653))

(assert (= (and b!1487653 res!1011816) b!1487635))

(assert (= (and b!1487635 res!1011806) b!1487652))

(assert (= (and b!1487652 res!1011815) b!1487640))

(assert (= (and b!1487640 res!1011821) b!1487647))

(assert (= (and b!1487647 res!1011807) b!1487643))

(assert (= (and b!1487643 res!1011813) b!1487637))

(assert (= (and b!1487637 res!1011808) b!1487645))

(assert (= (and b!1487645 c!137442) b!1487650))

(assert (= (and b!1487645 (not c!137442)) b!1487651))

(assert (= (and b!1487645 res!1011814) b!1487636))

(assert (= (and b!1487636 res!1011818) b!1487649))

(assert (= (and b!1487649 res!1011823) b!1487644))

(assert (= (and b!1487644 res!1011819) b!1487639))

(assert (= (and b!1487649 (not res!1011810)) b!1487638))

(assert (= (and b!1487638 (not res!1011817)) b!1487648))

(assert (= (and b!1487648 (not res!1011822)) b!1487642))

(assert (= (and b!1487642 c!137443) b!1487646))

(assert (= (and b!1487642 (not c!137443)) b!1487655))

(declare-fun m!1371621 () Bool)

(assert (=> b!1487647 m!1371621))

(assert (=> b!1487647 m!1371621))

(declare-fun m!1371623 () Bool)

(assert (=> b!1487647 m!1371623))

(assert (=> b!1487647 m!1371623))

(assert (=> b!1487647 m!1371621))

(declare-fun m!1371625 () Bool)

(assert (=> b!1487647 m!1371625))

(declare-fun m!1371627 () Bool)

(assert (=> start!126698 m!1371627))

(declare-fun m!1371629 () Bool)

(assert (=> start!126698 m!1371629))

(declare-fun m!1371631 () Bool)

(assert (=> b!1487640 m!1371631))

(declare-fun m!1371633 () Bool)

(assert (=> b!1487640 m!1371633))

(assert (=> b!1487644 m!1371621))

(assert (=> b!1487644 m!1371621))

(declare-fun m!1371635 () Bool)

(assert (=> b!1487644 m!1371635))

(assert (=> b!1487643 m!1371621))

(assert (=> b!1487643 m!1371621))

(declare-fun m!1371637 () Bool)

(assert (=> b!1487643 m!1371637))

(declare-fun m!1371639 () Bool)

(assert (=> b!1487650 m!1371639))

(declare-fun m!1371641 () Bool)

(assert (=> b!1487638 m!1371641))

(declare-fun m!1371643 () Bool)

(assert (=> b!1487638 m!1371643))

(declare-fun m!1371645 () Bool)

(assert (=> b!1487638 m!1371645))

(declare-fun m!1371647 () Bool)

(assert (=> b!1487653 m!1371647))

(assert (=> b!1487648 m!1371621))

(assert (=> b!1487648 m!1371621))

(declare-fun m!1371649 () Bool)

(assert (=> b!1487648 m!1371649))

(assert (=> b!1487641 m!1371621))

(assert (=> b!1487641 m!1371621))

(declare-fun m!1371651 () Bool)

(assert (=> b!1487641 m!1371651))

(assert (=> b!1487639 m!1371631))

(declare-fun m!1371653 () Bool)

(assert (=> b!1487639 m!1371653))

(declare-fun m!1371655 () Bool)

(assert (=> b!1487639 m!1371655))

(declare-fun m!1371657 () Bool)

(assert (=> b!1487639 m!1371657))

(assert (=> b!1487639 m!1371621))

(declare-fun m!1371659 () Bool)

(assert (=> b!1487655 m!1371659))

(declare-fun m!1371661 () Bool)

(assert (=> b!1487654 m!1371661))

(assert (=> b!1487654 m!1371661))

(declare-fun m!1371663 () Bool)

(assert (=> b!1487654 m!1371663))

(declare-fun m!1371665 () Bool)

(assert (=> b!1487635 m!1371665))

(declare-fun m!1371667 () Bool)

(assert (=> b!1487646 m!1371667))

(declare-fun m!1371669 () Bool)

(assert (=> b!1487637 m!1371669))

(assert (=> b!1487637 m!1371669))

(declare-fun m!1371671 () Bool)

(assert (=> b!1487637 m!1371671))

(assert (=> b!1487637 m!1371631))

(declare-fun m!1371673 () Bool)

(assert (=> b!1487637 m!1371673))

(assert (=> b!1487651 m!1371643))

(assert (=> b!1487651 m!1371645))

(declare-fun m!1371675 () Bool)

(assert (=> b!1487649 m!1371675))

(assert (=> b!1487649 m!1371631))

(assert (=> b!1487649 m!1371655))

(assert (=> b!1487649 m!1371657))

(declare-fun m!1371677 () Bool)

(assert (=> b!1487649 m!1371677))

(assert (=> b!1487649 m!1371621))

(check-sat (not b!1487646) (not b!1487644) (not b!1487649) (not b!1487643) (not b!1487650) (not b!1487635) (not b!1487653) (not b!1487638) (not b!1487648) (not start!126698) (not b!1487637) (not b!1487647) (not b!1487651) (not b!1487655) (not b!1487641) (not b!1487654))
(check-sat)
(get-model)

(declare-fun d!156393 () Bool)

(declare-fun e!833924 () Bool)

(assert (=> d!156393 e!833924))

(declare-fun c!137464 () Bool)

(declare-fun lt!648778 () SeekEntryResult!12305)

(get-info :version)

(assert (=> d!156393 (= c!137464 (and ((_ is Intermediate!12305) lt!648778) (undefined!13117 lt!648778)))))

(declare-fun e!833926 () SeekEntryResult!12305)

(assert (=> d!156393 (= lt!648778 e!833926)))

(declare-fun c!137462 () Bool)

(assert (=> d!156393 (= c!137462 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!648779 () (_ BitVec 64))

(assert (=> d!156393 (= lt!648779 (select (arr!48040 lt!648726) (toIndex!0 lt!648730 mask!2687)))))

(assert (=> d!156393 (validMask!0 mask!2687)))

(assert (=> d!156393 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648730 mask!2687) lt!648730 lt!648726 mask!2687) lt!648778)))

(declare-fun b!1487806 () Bool)

(assert (=> b!1487806 (and (bvsge (index!51614 lt!648778) #b00000000000000000000000000000000) (bvslt (index!51614 lt!648778) (size!48592 lt!648726)))))

(declare-fun res!1011939 () Bool)

(assert (=> b!1487806 (= res!1011939 (= (select (arr!48040 lt!648726) (index!51614 lt!648778)) lt!648730))))

(declare-fun e!833927 () Bool)

(assert (=> b!1487806 (=> res!1011939 e!833927)))

(declare-fun e!833923 () Bool)

(assert (=> b!1487806 (= e!833923 e!833927)))

(declare-fun b!1487807 () Bool)

(assert (=> b!1487807 (= e!833924 (bvsge (x!133198 lt!648778) #b01111111111111111111111111111110))))

(declare-fun e!833925 () SeekEntryResult!12305)

(declare-fun b!1487808 () Bool)

(assert (=> b!1487808 (= e!833925 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!648730 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!648730 lt!648726 mask!2687))))

(declare-fun b!1487809 () Bool)

(assert (=> b!1487809 (= e!833926 (Intermediate!12305 true (toIndex!0 lt!648730 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1487810 () Bool)

(assert (=> b!1487810 (= e!833926 e!833925)))

(declare-fun c!137463 () Bool)

(assert (=> b!1487810 (= c!137463 (or (= lt!648779 lt!648730) (= (bvadd lt!648779 lt!648779) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1487811 () Bool)

(assert (=> b!1487811 (and (bvsge (index!51614 lt!648778) #b00000000000000000000000000000000) (bvslt (index!51614 lt!648778) (size!48592 lt!648726)))))

(assert (=> b!1487811 (= e!833927 (= (select (arr!48040 lt!648726) (index!51614 lt!648778)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1487812 () Bool)

(assert (=> b!1487812 (= e!833925 (Intermediate!12305 false (toIndex!0 lt!648730 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1487813 () Bool)

(assert (=> b!1487813 (= e!833924 e!833923)))

(declare-fun res!1011940 () Bool)

(assert (=> b!1487813 (= res!1011940 (and ((_ is Intermediate!12305) lt!648778) (not (undefined!13117 lt!648778)) (bvslt (x!133198 lt!648778) #b01111111111111111111111111111110) (bvsge (x!133198 lt!648778) #b00000000000000000000000000000000) (bvsge (x!133198 lt!648778) #b00000000000000000000000000000000)))))

(assert (=> b!1487813 (=> (not res!1011940) (not e!833923))))

(declare-fun b!1487814 () Bool)

(assert (=> b!1487814 (and (bvsge (index!51614 lt!648778) #b00000000000000000000000000000000) (bvslt (index!51614 lt!648778) (size!48592 lt!648726)))))

(declare-fun res!1011938 () Bool)

(assert (=> b!1487814 (= res!1011938 (= (select (arr!48040 lt!648726) (index!51614 lt!648778)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487814 (=> res!1011938 e!833927)))

(assert (= (and d!156393 c!137462) b!1487809))

(assert (= (and d!156393 (not c!137462)) b!1487810))

(assert (= (and b!1487810 c!137463) b!1487812))

(assert (= (and b!1487810 (not c!137463)) b!1487808))

(assert (= (and d!156393 c!137464) b!1487807))

(assert (= (and d!156393 (not c!137464)) b!1487813))

(assert (= (and b!1487813 res!1011940) b!1487806))

(assert (= (and b!1487806 (not res!1011939)) b!1487814))

(assert (= (and b!1487814 (not res!1011938)) b!1487811))

(assert (=> d!156393 m!1371669))

(declare-fun m!1371795 () Bool)

(assert (=> d!156393 m!1371795))

(assert (=> d!156393 m!1371627))

(declare-fun m!1371797 () Bool)

(assert (=> b!1487811 m!1371797))

(assert (=> b!1487814 m!1371797))

(assert (=> b!1487808 m!1371669))

(declare-fun m!1371799 () Bool)

(assert (=> b!1487808 m!1371799))

(assert (=> b!1487808 m!1371799))

(declare-fun m!1371801 () Bool)

(assert (=> b!1487808 m!1371801))

(assert (=> b!1487806 m!1371797))

(assert (=> b!1487637 d!156393))

(declare-fun d!156395 () Bool)

(declare-fun lt!648785 () (_ BitVec 32))

(declare-fun lt!648784 () (_ BitVec 32))

(assert (=> d!156395 (= lt!648785 (bvmul (bvxor lt!648784 (bvlshr lt!648784 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156395 (= lt!648784 ((_ extract 31 0) (bvand (bvxor lt!648730 (bvlshr lt!648730 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156395 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1011941 (let ((h!35998 ((_ extract 31 0) (bvand (bvxor lt!648730 (bvlshr lt!648730 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133202 (bvmul (bvxor h!35998 (bvlshr h!35998 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133202 (bvlshr x!133202 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1011941 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1011941 #b00000000000000000000000000000000))))))

(assert (=> d!156395 (= (toIndex!0 lt!648730 mask!2687) (bvand (bvxor lt!648785 (bvlshr lt!648785 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1487637 d!156395))

(declare-fun d!156397 () Bool)

(declare-fun e!833929 () Bool)

(assert (=> d!156397 e!833929))

(declare-fun c!137467 () Bool)

(declare-fun lt!648786 () SeekEntryResult!12305)

(assert (=> d!156397 (= c!137467 (and ((_ is Intermediate!12305) lt!648786) (undefined!13117 lt!648786)))))

(declare-fun e!833931 () SeekEntryResult!12305)

(assert (=> d!156397 (= lt!648786 e!833931)))

(declare-fun c!137465 () Bool)

(assert (=> d!156397 (= c!137465 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!648787 () (_ BitVec 64))

(assert (=> d!156397 (= lt!648787 (select (arr!48040 a!2862) (toIndex!0 (select (arr!48040 a!2862) j!93) mask!2687)))))

(assert (=> d!156397 (validMask!0 mask!2687)))

(assert (=> d!156397 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48040 a!2862) j!93) mask!2687) (select (arr!48040 a!2862) j!93) a!2862 mask!2687) lt!648786)))

(declare-fun b!1487815 () Bool)

(assert (=> b!1487815 (and (bvsge (index!51614 lt!648786) #b00000000000000000000000000000000) (bvslt (index!51614 lt!648786) (size!48592 a!2862)))))

(declare-fun res!1011943 () Bool)

(assert (=> b!1487815 (= res!1011943 (= (select (arr!48040 a!2862) (index!51614 lt!648786)) (select (arr!48040 a!2862) j!93)))))

(declare-fun e!833932 () Bool)

(assert (=> b!1487815 (=> res!1011943 e!833932)))

(declare-fun e!833928 () Bool)

(assert (=> b!1487815 (= e!833928 e!833932)))

(declare-fun b!1487816 () Bool)

(assert (=> b!1487816 (= e!833929 (bvsge (x!133198 lt!648786) #b01111111111111111111111111111110))))

(declare-fun e!833930 () SeekEntryResult!12305)

(declare-fun b!1487817 () Bool)

(assert (=> b!1487817 (= e!833930 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48040 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!48040 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1487818 () Bool)

(assert (=> b!1487818 (= e!833931 (Intermediate!12305 true (toIndex!0 (select (arr!48040 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1487819 () Bool)

(assert (=> b!1487819 (= e!833931 e!833930)))

(declare-fun c!137466 () Bool)

(assert (=> b!1487819 (= c!137466 (or (= lt!648787 (select (arr!48040 a!2862) j!93)) (= (bvadd lt!648787 lt!648787) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1487820 () Bool)

(assert (=> b!1487820 (and (bvsge (index!51614 lt!648786) #b00000000000000000000000000000000) (bvslt (index!51614 lt!648786) (size!48592 a!2862)))))

(assert (=> b!1487820 (= e!833932 (= (select (arr!48040 a!2862) (index!51614 lt!648786)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1487821 () Bool)

(assert (=> b!1487821 (= e!833930 (Intermediate!12305 false (toIndex!0 (select (arr!48040 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1487822 () Bool)

(assert (=> b!1487822 (= e!833929 e!833928)))

(declare-fun res!1011944 () Bool)

(assert (=> b!1487822 (= res!1011944 (and ((_ is Intermediate!12305) lt!648786) (not (undefined!13117 lt!648786)) (bvslt (x!133198 lt!648786) #b01111111111111111111111111111110) (bvsge (x!133198 lt!648786) #b00000000000000000000000000000000) (bvsge (x!133198 lt!648786) #b00000000000000000000000000000000)))))

(assert (=> b!1487822 (=> (not res!1011944) (not e!833928))))

(declare-fun b!1487823 () Bool)

(assert (=> b!1487823 (and (bvsge (index!51614 lt!648786) #b00000000000000000000000000000000) (bvslt (index!51614 lt!648786) (size!48592 a!2862)))))

(declare-fun res!1011942 () Bool)

(assert (=> b!1487823 (= res!1011942 (= (select (arr!48040 a!2862) (index!51614 lt!648786)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487823 (=> res!1011942 e!833932)))

(assert (= (and d!156397 c!137465) b!1487818))

(assert (= (and d!156397 (not c!137465)) b!1487819))

(assert (= (and b!1487819 c!137466) b!1487821))

(assert (= (and b!1487819 (not c!137466)) b!1487817))

(assert (= (and d!156397 c!137467) b!1487816))

(assert (= (and d!156397 (not c!137467)) b!1487822))

(assert (= (and b!1487822 res!1011944) b!1487815))

(assert (= (and b!1487815 (not res!1011943)) b!1487823))

(assert (= (and b!1487823 (not res!1011942)) b!1487820))

(assert (=> d!156397 m!1371623))

(declare-fun m!1371803 () Bool)

(assert (=> d!156397 m!1371803))

(assert (=> d!156397 m!1371627))

(declare-fun m!1371805 () Bool)

(assert (=> b!1487820 m!1371805))

(assert (=> b!1487823 m!1371805))

(assert (=> b!1487817 m!1371623))

(declare-fun m!1371807 () Bool)

(assert (=> b!1487817 m!1371807))

(assert (=> b!1487817 m!1371807))

(assert (=> b!1487817 m!1371621))

(declare-fun m!1371809 () Bool)

(assert (=> b!1487817 m!1371809))

(assert (=> b!1487815 m!1371805))

(assert (=> b!1487647 d!156397))

(declare-fun d!156399 () Bool)

(declare-fun lt!648789 () (_ BitVec 32))

(declare-fun lt!648788 () (_ BitVec 32))

(assert (=> d!156399 (= lt!648789 (bvmul (bvxor lt!648788 (bvlshr lt!648788 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156399 (= lt!648788 ((_ extract 31 0) (bvand (bvxor (select (arr!48040 a!2862) j!93) (bvlshr (select (arr!48040 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156399 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1011941 (let ((h!35998 ((_ extract 31 0) (bvand (bvxor (select (arr!48040 a!2862) j!93) (bvlshr (select (arr!48040 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133202 (bvmul (bvxor h!35998 (bvlshr h!35998 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133202 (bvlshr x!133202 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1011941 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1011941 #b00000000000000000000000000000000))))))

(assert (=> d!156399 (= (toIndex!0 (select (arr!48040 a!2862) j!93) mask!2687) (bvand (bvxor lt!648789 (bvlshr lt!648789 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1487647 d!156399))

(declare-fun d!156401 () Bool)

(declare-fun e!833934 () Bool)

(assert (=> d!156401 e!833934))

(declare-fun c!137470 () Bool)

(declare-fun lt!648790 () SeekEntryResult!12305)

(assert (=> d!156401 (= c!137470 (and ((_ is Intermediate!12305) lt!648790) (undefined!13117 lt!648790)))))

(declare-fun e!833936 () SeekEntryResult!12305)

(assert (=> d!156401 (= lt!648790 e!833936)))

(declare-fun c!137468 () Bool)

(assert (=> d!156401 (= c!137468 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(declare-fun lt!648791 () (_ BitVec 64))

(assert (=> d!156401 (= lt!648791 (select (arr!48040 lt!648726) lt!648731))))

(assert (=> d!156401 (validMask!0 mask!2687)))

(assert (=> d!156401 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!648731 lt!648730 lt!648726 mask!2687) lt!648790)))

(declare-fun b!1487824 () Bool)

(assert (=> b!1487824 (and (bvsge (index!51614 lt!648790) #b00000000000000000000000000000000) (bvslt (index!51614 lt!648790) (size!48592 lt!648726)))))

(declare-fun res!1011946 () Bool)

(assert (=> b!1487824 (= res!1011946 (= (select (arr!48040 lt!648726) (index!51614 lt!648790)) lt!648730))))

(declare-fun e!833937 () Bool)

(assert (=> b!1487824 (=> res!1011946 e!833937)))

(declare-fun e!833933 () Bool)

(assert (=> b!1487824 (= e!833933 e!833937)))

(declare-fun b!1487825 () Bool)

(assert (=> b!1487825 (= e!833934 (bvsge (x!133198 lt!648790) #b01111111111111111111111111111110))))

(declare-fun b!1487826 () Bool)

(declare-fun e!833935 () SeekEntryResult!12305)

(assert (=> b!1487826 (= e!833935 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!648731 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) lt!648730 lt!648726 mask!2687))))

(declare-fun b!1487827 () Bool)

(assert (=> b!1487827 (= e!833936 (Intermediate!12305 true lt!648731 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1487828 () Bool)

(assert (=> b!1487828 (= e!833936 e!833935)))

(declare-fun c!137469 () Bool)

(assert (=> b!1487828 (= c!137469 (or (= lt!648791 lt!648730) (= (bvadd lt!648791 lt!648791) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1487829 () Bool)

(assert (=> b!1487829 (and (bvsge (index!51614 lt!648790) #b00000000000000000000000000000000) (bvslt (index!51614 lt!648790) (size!48592 lt!648726)))))

(assert (=> b!1487829 (= e!833937 (= (select (arr!48040 lt!648726) (index!51614 lt!648790)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1487830 () Bool)

(assert (=> b!1487830 (= e!833935 (Intermediate!12305 false lt!648731 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1487831 () Bool)

(assert (=> b!1487831 (= e!833934 e!833933)))

(declare-fun res!1011947 () Bool)

(assert (=> b!1487831 (= res!1011947 (and ((_ is Intermediate!12305) lt!648790) (not (undefined!13117 lt!648790)) (bvslt (x!133198 lt!648790) #b01111111111111111111111111111110) (bvsge (x!133198 lt!648790) #b00000000000000000000000000000000) (bvsge (x!133198 lt!648790) (bvadd #b00000000000000000000000000000001 x!665))))))

(assert (=> b!1487831 (=> (not res!1011947) (not e!833933))))

(declare-fun b!1487832 () Bool)

(assert (=> b!1487832 (and (bvsge (index!51614 lt!648790) #b00000000000000000000000000000000) (bvslt (index!51614 lt!648790) (size!48592 lt!648726)))))

(declare-fun res!1011945 () Bool)

(assert (=> b!1487832 (= res!1011945 (= (select (arr!48040 lt!648726) (index!51614 lt!648790)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487832 (=> res!1011945 e!833937)))

(assert (= (and d!156401 c!137468) b!1487827))

(assert (= (and d!156401 (not c!137468)) b!1487828))

(assert (= (and b!1487828 c!137469) b!1487830))

(assert (= (and b!1487828 (not c!137469)) b!1487826))

(assert (= (and d!156401 c!137470) b!1487825))

(assert (= (and d!156401 (not c!137470)) b!1487831))

(assert (= (and b!1487831 res!1011947) b!1487824))

(assert (= (and b!1487824 (not res!1011946)) b!1487832))

(assert (= (and b!1487832 (not res!1011945)) b!1487829))

(declare-fun m!1371811 () Bool)

(assert (=> d!156401 m!1371811))

(assert (=> d!156401 m!1371627))

(declare-fun m!1371813 () Bool)

(assert (=> b!1487829 m!1371813))

(assert (=> b!1487832 m!1371813))

(declare-fun m!1371815 () Bool)

(assert (=> b!1487826 m!1371815))

(assert (=> b!1487826 m!1371815))

(declare-fun m!1371817 () Bool)

(assert (=> b!1487826 m!1371817))

(assert (=> b!1487824 m!1371813))

(assert (=> b!1487646 d!156401))

(declare-fun d!156403 () Bool)

(assert (=> d!156403 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!126698 d!156403))

(declare-fun d!156405 () Bool)

(assert (=> d!156405 (= (array_inv!37273 a!2862) (bvsge (size!48592 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!126698 d!156405))

(declare-fun b!1487843 () Bool)

(declare-fun e!833946 () Bool)

(declare-fun e!833947 () Bool)

(assert (=> b!1487843 (= e!833946 e!833947)))

(declare-fun res!1011954 () Bool)

(assert (=> b!1487843 (=> (not res!1011954) (not e!833947))))

(declare-fun e!833948 () Bool)

(assert (=> b!1487843 (= res!1011954 (not e!833948))))

(declare-fun res!1011955 () Bool)

(assert (=> b!1487843 (=> (not res!1011955) (not e!833948))))

(assert (=> b!1487843 (= res!1011955 (validKeyInArray!0 (select (arr!48040 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1487844 () Bool)

(declare-fun e!833949 () Bool)

(assert (=> b!1487844 (= e!833947 e!833949)))

(declare-fun c!137473 () Bool)

(assert (=> b!1487844 (= c!137473 (validKeyInArray!0 (select (arr!48040 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!156407 () Bool)

(declare-fun res!1011956 () Bool)

(assert (=> d!156407 (=> res!1011956 e!833946)))

(assert (=> d!156407 (= res!1011956 (bvsge #b00000000000000000000000000000000 (size!48592 a!2862)))))

(assert (=> d!156407 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34616) e!833946)))

(declare-fun b!1487845 () Bool)

(declare-fun contains!9887 (List!34619 (_ BitVec 64)) Bool)

(assert (=> b!1487845 (= e!833948 (contains!9887 Nil!34616 (select (arr!48040 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1487846 () Bool)

(declare-fun call!67883 () Bool)

(assert (=> b!1487846 (= e!833949 call!67883)))

(declare-fun bm!67880 () Bool)

(assert (=> bm!67880 (= call!67883 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!137473 (Cons!34615 (select (arr!48040 a!2862) #b00000000000000000000000000000000) Nil!34616) Nil!34616)))))

(declare-fun b!1487847 () Bool)

(assert (=> b!1487847 (= e!833949 call!67883)))

(assert (= (and d!156407 (not res!1011956)) b!1487843))

(assert (= (and b!1487843 res!1011955) b!1487845))

(assert (= (and b!1487843 res!1011954) b!1487844))

(assert (= (and b!1487844 c!137473) b!1487846))

(assert (= (and b!1487844 (not c!137473)) b!1487847))

(assert (= (or b!1487846 b!1487847) bm!67880))

(declare-fun m!1371819 () Bool)

(assert (=> b!1487843 m!1371819))

(assert (=> b!1487843 m!1371819))

(declare-fun m!1371821 () Bool)

(assert (=> b!1487843 m!1371821))

(assert (=> b!1487844 m!1371819))

(assert (=> b!1487844 m!1371819))

(assert (=> b!1487844 m!1371821))

(assert (=> b!1487845 m!1371819))

(assert (=> b!1487845 m!1371819))

(declare-fun m!1371823 () Bool)

(assert (=> b!1487845 m!1371823))

(assert (=> bm!67880 m!1371819))

(declare-fun m!1371825 () Bool)

(assert (=> bm!67880 m!1371825))

(assert (=> b!1487635 d!156407))

(declare-fun d!156409 () Bool)

(declare-fun e!833951 () Bool)

(assert (=> d!156409 e!833951))

(declare-fun c!137476 () Bool)

(declare-fun lt!648792 () SeekEntryResult!12305)

(assert (=> d!156409 (= c!137476 (and ((_ is Intermediate!12305) lt!648792) (undefined!13117 lt!648792)))))

(declare-fun e!833953 () SeekEntryResult!12305)

(assert (=> d!156409 (= lt!648792 e!833953)))

(declare-fun c!137474 () Bool)

(assert (=> d!156409 (= c!137474 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!648793 () (_ BitVec 64))

(assert (=> d!156409 (= lt!648793 (select (arr!48040 lt!648726) index!646))))

(assert (=> d!156409 (validMask!0 mask!2687)))

(assert (=> d!156409 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648730 lt!648726 mask!2687) lt!648792)))

(declare-fun b!1487848 () Bool)

(assert (=> b!1487848 (and (bvsge (index!51614 lt!648792) #b00000000000000000000000000000000) (bvslt (index!51614 lt!648792) (size!48592 lt!648726)))))

(declare-fun res!1011958 () Bool)

(assert (=> b!1487848 (= res!1011958 (= (select (arr!48040 lt!648726) (index!51614 lt!648792)) lt!648730))))

(declare-fun e!833954 () Bool)

(assert (=> b!1487848 (=> res!1011958 e!833954)))

(declare-fun e!833950 () Bool)

(assert (=> b!1487848 (= e!833950 e!833954)))

(declare-fun b!1487849 () Bool)

(assert (=> b!1487849 (= e!833951 (bvsge (x!133198 lt!648792) #b01111111111111111111111111111110))))

(declare-fun e!833952 () SeekEntryResult!12305)

(declare-fun b!1487850 () Bool)

(assert (=> b!1487850 (= e!833952 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!648730 lt!648726 mask!2687))))

(declare-fun b!1487851 () Bool)

(assert (=> b!1487851 (= e!833953 (Intermediate!12305 true index!646 x!665))))

(declare-fun b!1487852 () Bool)

(assert (=> b!1487852 (= e!833953 e!833952)))

(declare-fun c!137475 () Bool)

(assert (=> b!1487852 (= c!137475 (or (= lt!648793 lt!648730) (= (bvadd lt!648793 lt!648793) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1487853 () Bool)

(assert (=> b!1487853 (and (bvsge (index!51614 lt!648792) #b00000000000000000000000000000000) (bvslt (index!51614 lt!648792) (size!48592 lt!648726)))))

(assert (=> b!1487853 (= e!833954 (= (select (arr!48040 lt!648726) (index!51614 lt!648792)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1487854 () Bool)

(assert (=> b!1487854 (= e!833952 (Intermediate!12305 false index!646 x!665))))

(declare-fun b!1487855 () Bool)

(assert (=> b!1487855 (= e!833951 e!833950)))

(declare-fun res!1011959 () Bool)

(assert (=> b!1487855 (= res!1011959 (and ((_ is Intermediate!12305) lt!648792) (not (undefined!13117 lt!648792)) (bvslt (x!133198 lt!648792) #b01111111111111111111111111111110) (bvsge (x!133198 lt!648792) #b00000000000000000000000000000000) (bvsge (x!133198 lt!648792) x!665)))))

(assert (=> b!1487855 (=> (not res!1011959) (not e!833950))))

(declare-fun b!1487856 () Bool)

(assert (=> b!1487856 (and (bvsge (index!51614 lt!648792) #b00000000000000000000000000000000) (bvslt (index!51614 lt!648792) (size!48592 lt!648726)))))

(declare-fun res!1011957 () Bool)

(assert (=> b!1487856 (= res!1011957 (= (select (arr!48040 lt!648726) (index!51614 lt!648792)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487856 (=> res!1011957 e!833954)))

(assert (= (and d!156409 c!137474) b!1487851))

(assert (= (and d!156409 (not c!137474)) b!1487852))

(assert (= (and b!1487852 c!137475) b!1487854))

(assert (= (and b!1487852 (not c!137475)) b!1487850))

(assert (= (and d!156409 c!137476) b!1487849))

(assert (= (and d!156409 (not c!137476)) b!1487855))

(assert (= (and b!1487855 res!1011959) b!1487848))

(assert (= (and b!1487848 (not res!1011958)) b!1487856))

(assert (= (and b!1487856 (not res!1011957)) b!1487853))

(declare-fun m!1371827 () Bool)

(assert (=> d!156409 m!1371827))

(assert (=> d!156409 m!1371627))

(declare-fun m!1371829 () Bool)

(assert (=> b!1487853 m!1371829))

(assert (=> b!1487856 m!1371829))

(assert (=> b!1487850 m!1371641))

(assert (=> b!1487850 m!1371641))

(declare-fun m!1371831 () Bool)

(assert (=> b!1487850 m!1371831))

(assert (=> b!1487848 m!1371829))

(assert (=> b!1487650 d!156409))

(declare-fun d!156411 () Bool)

(declare-fun res!1011965 () Bool)

(declare-fun e!833962 () Bool)

(assert (=> d!156411 (=> res!1011965 e!833962)))

(assert (=> d!156411 (= res!1011965 (bvsge j!93 (size!48592 a!2862)))))

(assert (=> d!156411 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!833962)))

(declare-fun call!67886 () Bool)

(declare-fun bm!67883 () Bool)

(assert (=> bm!67883 (= call!67886 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1487865 () Bool)

(declare-fun e!833963 () Bool)

(assert (=> b!1487865 (= e!833962 e!833963)))

(declare-fun c!137479 () Bool)

(assert (=> b!1487865 (= c!137479 (validKeyInArray!0 (select (arr!48040 a!2862) j!93)))))

(declare-fun b!1487866 () Bool)

(assert (=> b!1487866 (= e!833963 call!67886)))

(declare-fun b!1487867 () Bool)

(declare-fun e!833961 () Bool)

(assert (=> b!1487867 (= e!833961 call!67886)))

(declare-fun b!1487868 () Bool)

(assert (=> b!1487868 (= e!833963 e!833961)))

(declare-fun lt!648801 () (_ BitVec 64))

(assert (=> b!1487868 (= lt!648801 (select (arr!48040 a!2862) j!93))))

(declare-fun lt!648802 () Unit!49791)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99532 (_ BitVec 64) (_ BitVec 32)) Unit!49791)

(assert (=> b!1487868 (= lt!648802 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!648801 j!93))))

(declare-fun arrayContainsKey!0 (array!99532 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1487868 (arrayContainsKey!0 a!2862 lt!648801 #b00000000000000000000000000000000)))

(declare-fun lt!648800 () Unit!49791)

(assert (=> b!1487868 (= lt!648800 lt!648802)))

(declare-fun res!1011964 () Bool)

(assert (=> b!1487868 (= res!1011964 (= (seekEntryOrOpen!0 (select (arr!48040 a!2862) j!93) a!2862 mask!2687) (Found!12305 j!93)))))

(assert (=> b!1487868 (=> (not res!1011964) (not e!833961))))

(assert (= (and d!156411 (not res!1011965)) b!1487865))

(assert (= (and b!1487865 c!137479) b!1487868))

(assert (= (and b!1487865 (not c!137479)) b!1487866))

(assert (= (and b!1487868 res!1011964) b!1487867))

(assert (= (or b!1487867 b!1487866) bm!67883))

(declare-fun m!1371833 () Bool)

(assert (=> bm!67883 m!1371833))

(assert (=> b!1487865 m!1371621))

(assert (=> b!1487865 m!1371621))

(assert (=> b!1487865 m!1371651))

(assert (=> b!1487868 m!1371621))

(declare-fun m!1371835 () Bool)

(assert (=> b!1487868 m!1371835))

(declare-fun m!1371837 () Bool)

(assert (=> b!1487868 m!1371837))

(assert (=> b!1487868 m!1371621))

(assert (=> b!1487868 m!1371635))

(assert (=> b!1487649 d!156411))

(declare-fun d!156413 () Bool)

(assert (=> d!156413 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!648805 () Unit!49791)

(declare-fun choose!38 (array!99532 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49791)

(assert (=> d!156413 (= lt!648805 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!156413 (validMask!0 mask!2687)))

(assert (=> d!156413 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!648805)))

(declare-fun bs!42748 () Bool)

(assert (= bs!42748 d!156413))

(assert (=> bs!42748 m!1371677))

(declare-fun m!1371839 () Bool)

(assert (=> bs!42748 m!1371839))

(assert (=> bs!42748 m!1371627))

(assert (=> b!1487649 d!156413))

(declare-fun d!156415 () Bool)

(declare-fun lt!648808 () (_ BitVec 32))

(assert (=> d!156415 (and (bvsge lt!648808 #b00000000000000000000000000000000) (bvslt lt!648808 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!156415 (= lt!648808 (choose!52 index!646 x!665 mask!2687))))

(assert (=> d!156415 (validMask!0 mask!2687)))

(assert (=> d!156415 (= (nextIndex!0 index!646 x!665 mask!2687) lt!648808)))

(declare-fun bs!42749 () Bool)

(assert (= bs!42749 d!156415))

(declare-fun m!1371841 () Bool)

(assert (=> bs!42749 m!1371841))

(assert (=> bs!42749 m!1371627))

(assert (=> b!1487638 d!156415))

(declare-fun b!1487896 () Bool)

(declare-fun e!833983 () SeekEntryResult!12305)

(assert (=> b!1487896 (= e!833983 (MissingVacant!12305 intermediateAfterIndex!19))))

(declare-fun b!1487897 () Bool)

(declare-fun e!833982 () SeekEntryResult!12305)

(assert (=> b!1487897 (= e!833982 (Found!12305 index!646))))

(declare-fun b!1487898 () Bool)

(assert (=> b!1487898 (= e!833983 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!648730 lt!648726 mask!2687))))

(declare-fun b!1487899 () Bool)

(declare-fun c!137490 () Bool)

(declare-fun lt!648814 () (_ BitVec 64))

(assert (=> b!1487899 (= c!137490 (= lt!648814 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487899 (= e!833982 e!833983)))

(declare-fun d!156419 () Bool)

(declare-fun lt!648813 () SeekEntryResult!12305)

(assert (=> d!156419 (and (or ((_ is Undefined!12305) lt!648813) (not ((_ is Found!12305) lt!648813)) (and (bvsge (index!51613 lt!648813) #b00000000000000000000000000000000) (bvslt (index!51613 lt!648813) (size!48592 lt!648726)))) (or ((_ is Undefined!12305) lt!648813) ((_ is Found!12305) lt!648813) (not ((_ is MissingVacant!12305) lt!648813)) (not (= (index!51615 lt!648813) intermediateAfterIndex!19)) (and (bvsge (index!51615 lt!648813) #b00000000000000000000000000000000) (bvslt (index!51615 lt!648813) (size!48592 lt!648726)))) (or ((_ is Undefined!12305) lt!648813) (ite ((_ is Found!12305) lt!648813) (= (select (arr!48040 lt!648726) (index!51613 lt!648813)) lt!648730) (and ((_ is MissingVacant!12305) lt!648813) (= (index!51615 lt!648813) intermediateAfterIndex!19) (= (select (arr!48040 lt!648726) (index!51615 lt!648813)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!833984 () SeekEntryResult!12305)

(assert (=> d!156419 (= lt!648813 e!833984)))

(declare-fun c!137489 () Bool)

(assert (=> d!156419 (= c!137489 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156419 (= lt!648814 (select (arr!48040 lt!648726) index!646))))

(assert (=> d!156419 (validMask!0 mask!2687)))

(assert (=> d!156419 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648730 lt!648726 mask!2687) lt!648813)))

(declare-fun b!1487900 () Bool)

(assert (=> b!1487900 (= e!833984 e!833982)))

(declare-fun c!137491 () Bool)

(assert (=> b!1487900 (= c!137491 (= lt!648814 lt!648730))))

(declare-fun b!1487901 () Bool)

(assert (=> b!1487901 (= e!833984 Undefined!12305)))

(assert (= (and d!156419 c!137489) b!1487901))

(assert (= (and d!156419 (not c!137489)) b!1487900))

(assert (= (and b!1487900 c!137491) b!1487897))

(assert (= (and b!1487900 (not c!137491)) b!1487899))

(assert (= (and b!1487899 c!137490) b!1487896))

(assert (= (and b!1487899 (not c!137490)) b!1487898))

(assert (=> b!1487898 m!1371641))

(assert (=> b!1487898 m!1371641))

(declare-fun m!1371851 () Bool)

(assert (=> b!1487898 m!1371851))

(declare-fun m!1371853 () Bool)

(assert (=> d!156419 m!1371853))

(declare-fun m!1371855 () Bool)

(assert (=> d!156419 m!1371855))

(assert (=> d!156419 m!1371827))

(assert (=> d!156419 m!1371627))

(assert (=> b!1487638 d!156419))

(declare-fun b!1487968 () Bool)

(declare-fun e!834021 () SeekEntryResult!12305)

(declare-fun lt!648839 () SeekEntryResult!12305)

(assert (=> b!1487968 (= e!834021 (Found!12305 (index!51614 lt!648839)))))

(declare-fun b!1487969 () Bool)

(declare-fun e!834023 () SeekEntryResult!12305)

(assert (=> b!1487969 (= e!834023 (MissingZero!12305 (index!51614 lt!648839)))))

(declare-fun b!1487970 () Bool)

(declare-fun c!137517 () Bool)

(declare-fun lt!648841 () (_ BitVec 64))

(assert (=> b!1487970 (= c!137517 (= lt!648841 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487970 (= e!834021 e!834023)))

(declare-fun b!1487971 () Bool)

(assert (=> b!1487971 (= e!834023 (seekKeyOrZeroReturnVacant!0 (x!133198 lt!648839) (index!51614 lt!648839) (index!51614 lt!648839) lt!648730 lt!648726 mask!2687))))

(declare-fun d!156425 () Bool)

(declare-fun lt!648840 () SeekEntryResult!12305)

(assert (=> d!156425 (and (or ((_ is Undefined!12305) lt!648840) (not ((_ is Found!12305) lt!648840)) (and (bvsge (index!51613 lt!648840) #b00000000000000000000000000000000) (bvslt (index!51613 lt!648840) (size!48592 lt!648726)))) (or ((_ is Undefined!12305) lt!648840) ((_ is Found!12305) lt!648840) (not ((_ is MissingZero!12305) lt!648840)) (and (bvsge (index!51612 lt!648840) #b00000000000000000000000000000000) (bvslt (index!51612 lt!648840) (size!48592 lt!648726)))) (or ((_ is Undefined!12305) lt!648840) ((_ is Found!12305) lt!648840) ((_ is MissingZero!12305) lt!648840) (not ((_ is MissingVacant!12305) lt!648840)) (and (bvsge (index!51615 lt!648840) #b00000000000000000000000000000000) (bvslt (index!51615 lt!648840) (size!48592 lt!648726)))) (or ((_ is Undefined!12305) lt!648840) (ite ((_ is Found!12305) lt!648840) (= (select (arr!48040 lt!648726) (index!51613 lt!648840)) lt!648730) (ite ((_ is MissingZero!12305) lt!648840) (= (select (arr!48040 lt!648726) (index!51612 lt!648840)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12305) lt!648840) (= (select (arr!48040 lt!648726) (index!51615 lt!648840)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!834022 () SeekEntryResult!12305)

(assert (=> d!156425 (= lt!648840 e!834022)))

(declare-fun c!137516 () Bool)

(assert (=> d!156425 (= c!137516 (and ((_ is Intermediate!12305) lt!648839) (undefined!13117 lt!648839)))))

(assert (=> d!156425 (= lt!648839 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648730 mask!2687) lt!648730 lt!648726 mask!2687))))

(assert (=> d!156425 (validMask!0 mask!2687)))

(assert (=> d!156425 (= (seekEntryOrOpen!0 lt!648730 lt!648726 mask!2687) lt!648840)))

(declare-fun b!1487972 () Bool)

(assert (=> b!1487972 (= e!834022 Undefined!12305)))

(declare-fun b!1487973 () Bool)

(assert (=> b!1487973 (= e!834022 e!834021)))

(assert (=> b!1487973 (= lt!648841 (select (arr!48040 lt!648726) (index!51614 lt!648839)))))

(declare-fun c!137518 () Bool)

(assert (=> b!1487973 (= c!137518 (= lt!648841 lt!648730))))

(assert (= (and d!156425 c!137516) b!1487972))

(assert (= (and d!156425 (not c!137516)) b!1487973))

(assert (= (and b!1487973 c!137518) b!1487968))

(assert (= (and b!1487973 (not c!137518)) b!1487970))

(assert (= (and b!1487970 c!137517) b!1487969))

(assert (= (and b!1487970 (not c!137517)) b!1487971))

(declare-fun m!1371869 () Bool)

(assert (=> b!1487971 m!1371869))

(declare-fun m!1371871 () Bool)

(assert (=> d!156425 m!1371871))

(declare-fun m!1371873 () Bool)

(assert (=> d!156425 m!1371873))

(declare-fun m!1371875 () Bool)

(assert (=> d!156425 m!1371875))

(assert (=> d!156425 m!1371669))

(assert (=> d!156425 m!1371669))

(assert (=> d!156425 m!1371671))

(assert (=> d!156425 m!1371627))

(declare-fun m!1371877 () Bool)

(assert (=> b!1487973 m!1371877))

(assert (=> b!1487638 d!156425))

(declare-fun d!156435 () Bool)

(declare-fun e!834033 () Bool)

(assert (=> d!156435 e!834033))

(declare-fun c!137524 () Bool)

(declare-fun lt!648844 () SeekEntryResult!12305)

(assert (=> d!156435 (= c!137524 (and ((_ is Intermediate!12305) lt!648844) (undefined!13117 lt!648844)))))

(declare-fun e!834036 () SeekEntryResult!12305)

(assert (=> d!156435 (= lt!648844 e!834036)))

(declare-fun c!137522 () Bool)

(assert (=> d!156435 (= c!137522 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(declare-fun lt!648845 () (_ BitVec 64))

(assert (=> d!156435 (= lt!648845 (select (arr!48040 a!2862) lt!648731))))

(assert (=> d!156435 (validMask!0 mask!2687)))

(assert (=> d!156435 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!648731 (select (arr!48040 a!2862) j!93) a!2862 mask!2687) lt!648844)))

(declare-fun b!1487989 () Bool)

(assert (=> b!1487989 (and (bvsge (index!51614 lt!648844) #b00000000000000000000000000000000) (bvslt (index!51614 lt!648844) (size!48592 a!2862)))))

(declare-fun res!1012000 () Bool)

(assert (=> b!1487989 (= res!1012000 (= (select (arr!48040 a!2862) (index!51614 lt!648844)) (select (arr!48040 a!2862) j!93)))))

(declare-fun e!834037 () Bool)

(assert (=> b!1487989 (=> res!1012000 e!834037)))

(declare-fun e!834031 () Bool)

(assert (=> b!1487989 (= e!834031 e!834037)))

(declare-fun b!1487990 () Bool)

(assert (=> b!1487990 (= e!834033 (bvsge (x!133198 lt!648844) #b01111111111111111111111111111110))))

(declare-fun b!1487991 () Bool)

(declare-fun e!834035 () SeekEntryResult!12305)

(assert (=> b!1487991 (= e!834035 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!648731 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) (select (arr!48040 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1487992 () Bool)

(assert (=> b!1487992 (= e!834036 (Intermediate!12305 true lt!648731 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1487993 () Bool)

(assert (=> b!1487993 (= e!834036 e!834035)))

(declare-fun c!137523 () Bool)

(assert (=> b!1487993 (= c!137523 (or (= lt!648845 (select (arr!48040 a!2862) j!93)) (= (bvadd lt!648845 lt!648845) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1487994 () Bool)

(assert (=> b!1487994 (and (bvsge (index!51614 lt!648844) #b00000000000000000000000000000000) (bvslt (index!51614 lt!648844) (size!48592 a!2862)))))

(assert (=> b!1487994 (= e!834037 (= (select (arr!48040 a!2862) (index!51614 lt!648844)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1487995 () Bool)

(assert (=> b!1487995 (= e!834035 (Intermediate!12305 false lt!648731 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1487996 () Bool)

(assert (=> b!1487996 (= e!834033 e!834031)))

(declare-fun res!1012001 () Bool)

(assert (=> b!1487996 (= res!1012001 (and ((_ is Intermediate!12305) lt!648844) (not (undefined!13117 lt!648844)) (bvslt (x!133198 lt!648844) #b01111111111111111111111111111110) (bvsge (x!133198 lt!648844) #b00000000000000000000000000000000) (bvsge (x!133198 lt!648844) (bvadd #b00000000000000000000000000000001 x!665))))))

(assert (=> b!1487996 (=> (not res!1012001) (not e!834031))))

(declare-fun b!1487997 () Bool)

(assert (=> b!1487997 (and (bvsge (index!51614 lt!648844) #b00000000000000000000000000000000) (bvslt (index!51614 lt!648844) (size!48592 a!2862)))))

(declare-fun res!1011999 () Bool)

(assert (=> b!1487997 (= res!1011999 (= (select (arr!48040 a!2862) (index!51614 lt!648844)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1487997 (=> res!1011999 e!834037)))

(assert (= (and d!156435 c!137522) b!1487992))

(assert (= (and d!156435 (not c!137522)) b!1487993))

(assert (= (and b!1487993 c!137523) b!1487995))

(assert (= (and b!1487993 (not c!137523)) b!1487991))

(assert (= (and d!156435 c!137524) b!1487990))

(assert (= (and d!156435 (not c!137524)) b!1487996))

(assert (= (and b!1487996 res!1012001) b!1487989))

(assert (= (and b!1487989 (not res!1012000)) b!1487997))

(assert (= (and b!1487997 (not res!1011999)) b!1487994))

(declare-fun m!1371887 () Bool)

(assert (=> d!156435 m!1371887))

(assert (=> d!156435 m!1371627))

(declare-fun m!1371889 () Bool)

(assert (=> b!1487994 m!1371889))

(assert (=> b!1487997 m!1371889))

(assert (=> b!1487991 m!1371815))

(assert (=> b!1487991 m!1371815))

(assert (=> b!1487991 m!1371621))

(declare-fun m!1371891 () Bool)

(assert (=> b!1487991 m!1371891))

(assert (=> b!1487989 m!1371889))

(assert (=> b!1487648 d!156435))

(declare-fun d!156441 () Bool)

(declare-fun res!1012008 () Bool)

(declare-fun e!834046 () Bool)

(assert (=> d!156441 (=> res!1012008 e!834046)))

(assert (=> d!156441 (= res!1012008 (bvsge #b00000000000000000000000000000000 (size!48592 a!2862)))))

(assert (=> d!156441 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!834046)))

(declare-fun bm!67889 () Bool)

(declare-fun call!67892 () Bool)

(assert (=> bm!67889 (= call!67892 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1488009 () Bool)

(declare-fun e!834047 () Bool)

(assert (=> b!1488009 (= e!834046 e!834047)))

(declare-fun c!137530 () Bool)

(assert (=> b!1488009 (= c!137530 (validKeyInArray!0 (select (arr!48040 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1488010 () Bool)

(assert (=> b!1488010 (= e!834047 call!67892)))

(declare-fun b!1488011 () Bool)

(declare-fun e!834045 () Bool)

(assert (=> b!1488011 (= e!834045 call!67892)))

(declare-fun b!1488012 () Bool)

(assert (=> b!1488012 (= e!834047 e!834045)))

(declare-fun lt!648857 () (_ BitVec 64))

(assert (=> b!1488012 (= lt!648857 (select (arr!48040 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!648858 () Unit!49791)

(assert (=> b!1488012 (= lt!648858 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!648857 #b00000000000000000000000000000000))))

(assert (=> b!1488012 (arrayContainsKey!0 a!2862 lt!648857 #b00000000000000000000000000000000)))

(declare-fun lt!648856 () Unit!49791)

(assert (=> b!1488012 (= lt!648856 lt!648858)))

(declare-fun res!1012007 () Bool)

(assert (=> b!1488012 (= res!1012007 (= (seekEntryOrOpen!0 (select (arr!48040 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12305 #b00000000000000000000000000000000)))))

(assert (=> b!1488012 (=> (not res!1012007) (not e!834045))))

(assert (= (and d!156441 (not res!1012008)) b!1488009))

(assert (= (and b!1488009 c!137530) b!1488012))

(assert (= (and b!1488009 (not c!137530)) b!1488010))

(assert (= (and b!1488012 res!1012007) b!1488011))

(assert (= (or b!1488011 b!1488010) bm!67889))

(declare-fun m!1371895 () Bool)

(assert (=> bm!67889 m!1371895))

(assert (=> b!1488009 m!1371819))

(assert (=> b!1488009 m!1371819))

(assert (=> b!1488009 m!1371821))

(assert (=> b!1488012 m!1371819))

(declare-fun m!1371901 () Bool)

(assert (=> b!1488012 m!1371901))

(declare-fun m!1371903 () Bool)

(assert (=> b!1488012 m!1371903))

(assert (=> b!1488012 m!1371819))

(declare-fun m!1371905 () Bool)

(assert (=> b!1488012 m!1371905))

(assert (=> b!1487653 d!156441))

(declare-fun d!156445 () Bool)

(assert (=> d!156445 (= (validKeyInArray!0 (select (arr!48040 a!2862) j!93)) (and (not (= (select (arr!48040 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48040 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1487641 d!156445))

(assert (=> b!1487651 d!156419))

(assert (=> b!1487651 d!156425))

(declare-fun b!1488013 () Bool)

(declare-fun e!834049 () SeekEntryResult!12305)

(assert (=> b!1488013 (= e!834049 (MissingVacant!12305 intermediateAfterIndex!19))))

(declare-fun b!1488014 () Bool)

(declare-fun e!834048 () SeekEntryResult!12305)

(assert (=> b!1488014 (= e!834048 (Found!12305 lt!648731))))

(declare-fun b!1488015 () Bool)

(assert (=> b!1488015 (= e!834049 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!648731 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) intermediateAfterIndex!19 lt!648730 lt!648726 mask!2687))))

(declare-fun b!1488016 () Bool)

(declare-fun c!137532 () Bool)

(declare-fun lt!648860 () (_ BitVec 64))

(assert (=> b!1488016 (= c!137532 (= lt!648860 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1488016 (= e!834048 e!834049)))

(declare-fun lt!648859 () SeekEntryResult!12305)

(declare-fun d!156447 () Bool)

(assert (=> d!156447 (and (or ((_ is Undefined!12305) lt!648859) (not ((_ is Found!12305) lt!648859)) (and (bvsge (index!51613 lt!648859) #b00000000000000000000000000000000) (bvslt (index!51613 lt!648859) (size!48592 lt!648726)))) (or ((_ is Undefined!12305) lt!648859) ((_ is Found!12305) lt!648859) (not ((_ is MissingVacant!12305) lt!648859)) (not (= (index!51615 lt!648859) intermediateAfterIndex!19)) (and (bvsge (index!51615 lt!648859) #b00000000000000000000000000000000) (bvslt (index!51615 lt!648859) (size!48592 lt!648726)))) (or ((_ is Undefined!12305) lt!648859) (ite ((_ is Found!12305) lt!648859) (= (select (arr!48040 lt!648726) (index!51613 lt!648859)) lt!648730) (and ((_ is MissingVacant!12305) lt!648859) (= (index!51615 lt!648859) intermediateAfterIndex!19) (= (select (arr!48040 lt!648726) (index!51615 lt!648859)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!834050 () SeekEntryResult!12305)

(assert (=> d!156447 (= lt!648859 e!834050)))

(declare-fun c!137531 () Bool)

(assert (=> d!156447 (= c!137531 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(assert (=> d!156447 (= lt!648860 (select (arr!48040 lt!648726) lt!648731))))

(assert (=> d!156447 (validMask!0 mask!2687)))

(assert (=> d!156447 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!648731 intermediateAfterIndex!19 lt!648730 lt!648726 mask!2687) lt!648859)))

(declare-fun b!1488017 () Bool)

(assert (=> b!1488017 (= e!834050 e!834048)))

(declare-fun c!137533 () Bool)

(assert (=> b!1488017 (= c!137533 (= lt!648860 lt!648730))))

(declare-fun b!1488018 () Bool)

(assert (=> b!1488018 (= e!834050 Undefined!12305)))

(assert (= (and d!156447 c!137531) b!1488018))

(assert (= (and d!156447 (not c!137531)) b!1488017))

(assert (= (and b!1488017 c!137533) b!1488014))

(assert (= (and b!1488017 (not c!137533)) b!1488016))

(assert (= (and b!1488016 c!137532) b!1488013))

(assert (= (and b!1488016 (not c!137532)) b!1488015))

(assert (=> b!1488015 m!1371815))

(assert (=> b!1488015 m!1371815))

(declare-fun m!1371913 () Bool)

(assert (=> b!1488015 m!1371913))

(declare-fun m!1371917 () Bool)

(assert (=> d!156447 m!1371917))

(declare-fun m!1371919 () Bool)

(assert (=> d!156447 m!1371919))

(assert (=> d!156447 m!1371811))

(assert (=> d!156447 m!1371627))

(assert (=> b!1487655 d!156447))

(declare-fun b!1488027 () Bool)

(declare-fun e!834057 () SeekEntryResult!12305)

(declare-fun lt!648867 () SeekEntryResult!12305)

(assert (=> b!1488027 (= e!834057 (Found!12305 (index!51614 lt!648867)))))

(declare-fun b!1488028 () Bool)

(declare-fun e!834059 () SeekEntryResult!12305)

(assert (=> b!1488028 (= e!834059 (MissingZero!12305 (index!51614 lt!648867)))))

(declare-fun b!1488029 () Bool)

(declare-fun c!137537 () Bool)

(declare-fun lt!648869 () (_ BitVec 64))

(assert (=> b!1488029 (= c!137537 (= lt!648869 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1488029 (= e!834057 e!834059)))

(declare-fun b!1488030 () Bool)

(assert (=> b!1488030 (= e!834059 (seekKeyOrZeroReturnVacant!0 (x!133198 lt!648867) (index!51614 lt!648867) (index!51614 lt!648867) (select (arr!48040 a!2862) j!93) a!2862 mask!2687))))

(declare-fun d!156451 () Bool)

(declare-fun lt!648868 () SeekEntryResult!12305)

(assert (=> d!156451 (and (or ((_ is Undefined!12305) lt!648868) (not ((_ is Found!12305) lt!648868)) (and (bvsge (index!51613 lt!648868) #b00000000000000000000000000000000) (bvslt (index!51613 lt!648868) (size!48592 a!2862)))) (or ((_ is Undefined!12305) lt!648868) ((_ is Found!12305) lt!648868) (not ((_ is MissingZero!12305) lt!648868)) (and (bvsge (index!51612 lt!648868) #b00000000000000000000000000000000) (bvslt (index!51612 lt!648868) (size!48592 a!2862)))) (or ((_ is Undefined!12305) lt!648868) ((_ is Found!12305) lt!648868) ((_ is MissingZero!12305) lt!648868) (not ((_ is MissingVacant!12305) lt!648868)) (and (bvsge (index!51615 lt!648868) #b00000000000000000000000000000000) (bvslt (index!51615 lt!648868) (size!48592 a!2862)))) (or ((_ is Undefined!12305) lt!648868) (ite ((_ is Found!12305) lt!648868) (= (select (arr!48040 a!2862) (index!51613 lt!648868)) (select (arr!48040 a!2862) j!93)) (ite ((_ is MissingZero!12305) lt!648868) (= (select (arr!48040 a!2862) (index!51612 lt!648868)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12305) lt!648868) (= (select (arr!48040 a!2862) (index!51615 lt!648868)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!834058 () SeekEntryResult!12305)

(assert (=> d!156451 (= lt!648868 e!834058)))

(declare-fun c!137536 () Bool)

(assert (=> d!156451 (= c!137536 (and ((_ is Intermediate!12305) lt!648867) (undefined!13117 lt!648867)))))

(assert (=> d!156451 (= lt!648867 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48040 a!2862) j!93) mask!2687) (select (arr!48040 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!156451 (validMask!0 mask!2687)))

(assert (=> d!156451 (= (seekEntryOrOpen!0 (select (arr!48040 a!2862) j!93) a!2862 mask!2687) lt!648868)))

(declare-fun b!1488031 () Bool)

(assert (=> b!1488031 (= e!834058 Undefined!12305)))

(declare-fun b!1488032 () Bool)

(assert (=> b!1488032 (= e!834058 e!834057)))

(assert (=> b!1488032 (= lt!648869 (select (arr!48040 a!2862) (index!51614 lt!648867)))))

(declare-fun c!137538 () Bool)

(assert (=> b!1488032 (= c!137538 (= lt!648869 (select (arr!48040 a!2862) j!93)))))

(assert (= (and d!156451 c!137536) b!1488031))

(assert (= (and d!156451 (not c!137536)) b!1488032))

(assert (= (and b!1488032 c!137538) b!1488027))

(assert (= (and b!1488032 (not c!137538)) b!1488029))

(assert (= (and b!1488029 c!137537) b!1488028))

(assert (= (and b!1488029 (not c!137537)) b!1488030))

(assert (=> b!1488030 m!1371621))

(declare-fun m!1371927 () Bool)

(assert (=> b!1488030 m!1371927))

(declare-fun m!1371929 () Bool)

(assert (=> d!156451 m!1371929))

(declare-fun m!1371931 () Bool)

(assert (=> d!156451 m!1371931))

(declare-fun m!1371933 () Bool)

(assert (=> d!156451 m!1371933))

(assert (=> d!156451 m!1371621))

(assert (=> d!156451 m!1371623))

(assert (=> d!156451 m!1371623))

(assert (=> d!156451 m!1371621))

(assert (=> d!156451 m!1371625))

(assert (=> d!156451 m!1371627))

(declare-fun m!1371935 () Bool)

(assert (=> b!1488032 m!1371935))

(assert (=> b!1487644 d!156451))

(declare-fun d!156455 () Bool)

(assert (=> d!156455 (= (validKeyInArray!0 (select (arr!48040 a!2862) i!1006)) (and (not (= (select (arr!48040 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48040 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1487654 d!156455))

(declare-fun d!156457 () Bool)

(declare-fun e!834061 () Bool)

(assert (=> d!156457 e!834061))

(declare-fun c!137541 () Bool)

(declare-fun lt!648870 () SeekEntryResult!12305)

(assert (=> d!156457 (= c!137541 (and ((_ is Intermediate!12305) lt!648870) (undefined!13117 lt!648870)))))

(declare-fun e!834063 () SeekEntryResult!12305)

(assert (=> d!156457 (= lt!648870 e!834063)))

(declare-fun c!137539 () Bool)

(assert (=> d!156457 (= c!137539 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!648871 () (_ BitVec 64))

(assert (=> d!156457 (= lt!648871 (select (arr!48040 a!2862) index!646))))

(assert (=> d!156457 (validMask!0 mask!2687)))

(assert (=> d!156457 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48040 a!2862) j!93) a!2862 mask!2687) lt!648870)))

(declare-fun b!1488033 () Bool)

(assert (=> b!1488033 (and (bvsge (index!51614 lt!648870) #b00000000000000000000000000000000) (bvslt (index!51614 lt!648870) (size!48592 a!2862)))))

(declare-fun res!1012014 () Bool)

(assert (=> b!1488033 (= res!1012014 (= (select (arr!48040 a!2862) (index!51614 lt!648870)) (select (arr!48040 a!2862) j!93)))))

(declare-fun e!834064 () Bool)

(assert (=> b!1488033 (=> res!1012014 e!834064)))

(declare-fun e!834060 () Bool)

(assert (=> b!1488033 (= e!834060 e!834064)))

(declare-fun b!1488034 () Bool)

(assert (=> b!1488034 (= e!834061 (bvsge (x!133198 lt!648870) #b01111111111111111111111111111110))))

(declare-fun b!1488035 () Bool)

(declare-fun e!834062 () SeekEntryResult!12305)

(assert (=> b!1488035 (= e!834062 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!48040 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1488036 () Bool)

(assert (=> b!1488036 (= e!834063 (Intermediate!12305 true index!646 x!665))))

(declare-fun b!1488037 () Bool)

(assert (=> b!1488037 (= e!834063 e!834062)))

(declare-fun c!137540 () Bool)

(assert (=> b!1488037 (= c!137540 (or (= lt!648871 (select (arr!48040 a!2862) j!93)) (= (bvadd lt!648871 lt!648871) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1488038 () Bool)

(assert (=> b!1488038 (and (bvsge (index!51614 lt!648870) #b00000000000000000000000000000000) (bvslt (index!51614 lt!648870) (size!48592 a!2862)))))

(assert (=> b!1488038 (= e!834064 (= (select (arr!48040 a!2862) (index!51614 lt!648870)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1488039 () Bool)

(assert (=> b!1488039 (= e!834062 (Intermediate!12305 false index!646 x!665))))

(declare-fun b!1488040 () Bool)

(assert (=> b!1488040 (= e!834061 e!834060)))

(declare-fun res!1012015 () Bool)

(assert (=> b!1488040 (= res!1012015 (and ((_ is Intermediate!12305) lt!648870) (not (undefined!13117 lt!648870)) (bvslt (x!133198 lt!648870) #b01111111111111111111111111111110) (bvsge (x!133198 lt!648870) #b00000000000000000000000000000000) (bvsge (x!133198 lt!648870) x!665)))))

(assert (=> b!1488040 (=> (not res!1012015) (not e!834060))))

(declare-fun b!1488041 () Bool)

(assert (=> b!1488041 (and (bvsge (index!51614 lt!648870) #b00000000000000000000000000000000) (bvslt (index!51614 lt!648870) (size!48592 a!2862)))))

(declare-fun res!1012013 () Bool)

(assert (=> b!1488041 (= res!1012013 (= (select (arr!48040 a!2862) (index!51614 lt!648870)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1488041 (=> res!1012013 e!834064)))

(assert (= (and d!156457 c!137539) b!1488036))

(assert (= (and d!156457 (not c!137539)) b!1488037))

(assert (= (and b!1488037 c!137540) b!1488039))

(assert (= (and b!1488037 (not c!137540)) b!1488035))

(assert (= (and d!156457 c!137541) b!1488034))

(assert (= (and d!156457 (not c!137541)) b!1488040))

(assert (= (and b!1488040 res!1012015) b!1488033))

(assert (= (and b!1488033 (not res!1012014)) b!1488041))

(assert (= (and b!1488041 (not res!1012013)) b!1488038))

(assert (=> d!156457 m!1371657))

(assert (=> d!156457 m!1371627))

(declare-fun m!1371937 () Bool)

(assert (=> b!1488038 m!1371937))

(assert (=> b!1488041 m!1371937))

(assert (=> b!1488035 m!1371641))

(assert (=> b!1488035 m!1371641))

(assert (=> b!1488035 m!1371621))

(declare-fun m!1371939 () Bool)

(assert (=> b!1488035 m!1371939))

(assert (=> b!1488033 m!1371937))

(assert (=> b!1487643 d!156457))

(check-sat (not d!156457) (not d!156415) (not b!1487843) (not b!1487808) (not d!156413) (not b!1487865) (not b!1487868) (not bm!67889) (not d!156451) (not b!1487826) (not d!156409) (not b!1487898) (not b!1487817) (not b!1488035) (not b!1488012) (not d!156401) (not d!156435) (not b!1487844) (not b!1487971) (not b!1487850) (not d!156397) (not b!1488009) (not b!1488030) (not b!1488015) (not d!156447) (not b!1487991) (not bm!67883) (not d!156419) (not b!1487845) (not bm!67880) (not d!156393) (not d!156425))
(check-sat)

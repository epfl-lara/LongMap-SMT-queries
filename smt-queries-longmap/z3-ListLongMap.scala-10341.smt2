; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121598 () Bool)

(assert start!121598)

(declare-datatypes ((array!96536 0))(
  ( (array!96537 (arr!46605 (Array (_ BitVec 32) (_ BitVec 64))) (size!47155 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96536)

(declare-fun lt!622440 () (_ BitVec 64))

(declare-fun e!799389 () Bool)

(declare-fun b!1412586 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lt!622438 () array!96536)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10916 0))(
  ( (MissingZero!10916 (index!46044 (_ BitVec 32))) (Found!10916 (index!46045 (_ BitVec 32))) (Intermediate!10916 (undefined!11728 Bool) (index!46046 (_ BitVec 32)) (x!127635 (_ BitVec 32))) (Undefined!10916) (MissingVacant!10916 (index!46047 (_ BitVec 32))) )
))
(declare-fun lt!622437 () SeekEntryResult!10916)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96536 (_ BitVec 32)) SeekEntryResult!10916)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96536 (_ BitVec 32)) SeekEntryResult!10916)

(assert (=> b!1412586 (= e!799389 (= (seekEntryOrOpen!0 lt!622440 lt!622438 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127635 lt!622437) (index!46046 lt!622437) (index!46046 lt!622437) (select (arr!46605 a!2901) j!112) lt!622438 mask!2840)))))

(declare-fun res!949577 () Bool)

(declare-fun e!799394 () Bool)

(assert (=> start!121598 (=> (not res!949577) (not e!799394))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121598 (= res!949577 (validMask!0 mask!2840))))

(assert (=> start!121598 e!799394))

(assert (=> start!121598 true))

(declare-fun array_inv!35633 (array!96536) Bool)

(assert (=> start!121598 (array_inv!35633 a!2901)))

(declare-fun b!1412587 () Bool)

(declare-fun res!949579 () Bool)

(assert (=> b!1412587 (=> (not res!949579) (not e!799394))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96536 (_ BitVec 32)) Bool)

(assert (=> b!1412587 (= res!949579 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1412588 () Bool)

(declare-fun e!799391 () Bool)

(declare-fun e!799390 () Bool)

(assert (=> b!1412588 (= e!799391 e!799390)))

(declare-fun res!949583 () Bool)

(assert (=> b!1412588 (=> res!949583 e!799390)))

(declare-fun lt!622441 () SeekEntryResult!10916)

(get-info :version)

(assert (=> b!1412588 (= res!949583 (or (= lt!622441 lt!622437) (not ((_ is Intermediate!10916) lt!622437))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96536 (_ BitVec 32)) SeekEntryResult!10916)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412588 (= lt!622437 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622440 mask!2840) lt!622440 lt!622438 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1412588 (= lt!622440 (select (store (arr!46605 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1412588 (= lt!622438 (array!96537 (store (arr!46605 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47155 a!2901)))))

(declare-fun b!1412589 () Bool)

(declare-fun res!949576 () Bool)

(assert (=> b!1412589 (=> (not res!949576) (not e!799394))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1412589 (= res!949576 (validKeyInArray!0 (select (arr!46605 a!2901) i!1037)))))

(declare-fun e!799392 () Bool)

(declare-fun b!1412590 () Bool)

(assert (=> b!1412590 (= e!799392 (= (seekEntryOrOpen!0 (select (arr!46605 a!2901) j!112) a!2901 mask!2840) (Found!10916 j!112)))))

(declare-fun b!1412591 () Bool)

(declare-fun res!949582 () Bool)

(assert (=> b!1412591 (=> (not res!949582) (not e!799394))))

(assert (=> b!1412591 (= res!949582 (and (= (size!47155 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47155 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47155 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1412592 () Bool)

(declare-fun res!949581 () Bool)

(assert (=> b!1412592 (=> (not res!949581) (not e!799394))))

(assert (=> b!1412592 (= res!949581 (validKeyInArray!0 (select (arr!46605 a!2901) j!112)))))

(declare-fun b!1412593 () Bool)

(declare-fun res!949585 () Bool)

(assert (=> b!1412593 (=> (not res!949585) (not e!799394))))

(declare-datatypes ((List!33124 0))(
  ( (Nil!33121) (Cons!33120 (h!34395 (_ BitVec 64)) (t!47818 List!33124)) )
))
(declare-fun arrayNoDuplicates!0 (array!96536 (_ BitVec 32) List!33124) Bool)

(assert (=> b!1412593 (= res!949585 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33121))))

(declare-fun b!1412594 () Bool)

(assert (=> b!1412594 (= e!799390 true)))

(assert (=> b!1412594 e!799389))

(declare-fun res!949584 () Bool)

(assert (=> b!1412594 (=> (not res!949584) (not e!799389))))

(assert (=> b!1412594 (= res!949584 (and (not (undefined!11728 lt!622437)) (= (index!46046 lt!622437) i!1037) (bvslt (x!127635 lt!622437) (x!127635 lt!622441)) (= (select (store (arr!46605 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46046 lt!622437)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!622439 () (_ BitVec 32))

(declare-datatypes ((Unit!47806 0))(
  ( (Unit!47807) )
))
(declare-fun lt!622443 () Unit!47806)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96536 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47806)

(assert (=> b!1412594 (= lt!622443 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622439 (x!127635 lt!622441) (index!46046 lt!622441) (x!127635 lt!622437) (index!46046 lt!622437) (undefined!11728 lt!622437) mask!2840))))

(declare-fun b!1412595 () Bool)

(assert (=> b!1412595 (= e!799394 (not e!799391))))

(declare-fun res!949578 () Bool)

(assert (=> b!1412595 (=> res!949578 e!799391)))

(assert (=> b!1412595 (= res!949578 (or (not ((_ is Intermediate!10916) lt!622441)) (undefined!11728 lt!622441)))))

(assert (=> b!1412595 e!799392))

(declare-fun res!949580 () Bool)

(assert (=> b!1412595 (=> (not res!949580) (not e!799392))))

(assert (=> b!1412595 (= res!949580 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!622442 () Unit!47806)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96536 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47806)

(assert (=> b!1412595 (= lt!622442 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1412595 (= lt!622441 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622439 (select (arr!46605 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1412595 (= lt!622439 (toIndex!0 (select (arr!46605 a!2901) j!112) mask!2840))))

(assert (= (and start!121598 res!949577) b!1412591))

(assert (= (and b!1412591 res!949582) b!1412589))

(assert (= (and b!1412589 res!949576) b!1412592))

(assert (= (and b!1412592 res!949581) b!1412587))

(assert (= (and b!1412587 res!949579) b!1412593))

(assert (= (and b!1412593 res!949585) b!1412595))

(assert (= (and b!1412595 res!949580) b!1412590))

(assert (= (and b!1412595 (not res!949578)) b!1412588))

(assert (= (and b!1412588 (not res!949583)) b!1412594))

(assert (= (and b!1412594 res!949584) b!1412586))

(declare-fun m!1302669 () Bool)

(assert (=> b!1412595 m!1302669))

(declare-fun m!1302671 () Bool)

(assert (=> b!1412595 m!1302671))

(assert (=> b!1412595 m!1302669))

(declare-fun m!1302673 () Bool)

(assert (=> b!1412595 m!1302673))

(assert (=> b!1412595 m!1302669))

(declare-fun m!1302675 () Bool)

(assert (=> b!1412595 m!1302675))

(declare-fun m!1302677 () Bool)

(assert (=> b!1412595 m!1302677))

(declare-fun m!1302679 () Bool)

(assert (=> b!1412589 m!1302679))

(assert (=> b!1412589 m!1302679))

(declare-fun m!1302681 () Bool)

(assert (=> b!1412589 m!1302681))

(declare-fun m!1302683 () Bool)

(assert (=> b!1412594 m!1302683))

(declare-fun m!1302685 () Bool)

(assert (=> b!1412594 m!1302685))

(declare-fun m!1302687 () Bool)

(assert (=> b!1412594 m!1302687))

(declare-fun m!1302689 () Bool)

(assert (=> b!1412587 m!1302689))

(assert (=> b!1412592 m!1302669))

(assert (=> b!1412592 m!1302669))

(declare-fun m!1302691 () Bool)

(assert (=> b!1412592 m!1302691))

(declare-fun m!1302693 () Bool)

(assert (=> b!1412593 m!1302693))

(assert (=> b!1412590 m!1302669))

(assert (=> b!1412590 m!1302669))

(declare-fun m!1302695 () Bool)

(assert (=> b!1412590 m!1302695))

(declare-fun m!1302697 () Bool)

(assert (=> start!121598 m!1302697))

(declare-fun m!1302699 () Bool)

(assert (=> start!121598 m!1302699))

(declare-fun m!1302701 () Bool)

(assert (=> b!1412588 m!1302701))

(assert (=> b!1412588 m!1302701))

(declare-fun m!1302703 () Bool)

(assert (=> b!1412588 m!1302703))

(assert (=> b!1412588 m!1302683))

(declare-fun m!1302705 () Bool)

(assert (=> b!1412588 m!1302705))

(declare-fun m!1302707 () Bool)

(assert (=> b!1412586 m!1302707))

(assert (=> b!1412586 m!1302669))

(assert (=> b!1412586 m!1302669))

(declare-fun m!1302709 () Bool)

(assert (=> b!1412586 m!1302709))

(check-sat (not b!1412586) (not b!1412587) (not b!1412589) (not start!121598) (not b!1412594) (not b!1412590) (not b!1412593) (not b!1412595) (not b!1412588) (not b!1412592))
(check-sat)

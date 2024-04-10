; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120452 () Bool)

(assert start!120452)

(declare-fun b!1402443 () Bool)

(declare-fun res!940954 () Bool)

(declare-fun e!794140 () Bool)

(assert (=> b!1402443 (=> (not res!940954) (not e!794140))))

(declare-datatypes ((array!95861 0))(
  ( (array!95862 (arr!46281 (Array (_ BitVec 32) (_ BitVec 64))) (size!46831 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95861)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402443 (= res!940954 (validKeyInArray!0 (select (arr!46281 a!2901) j!112)))))

(declare-fun b!1402444 () Bool)

(declare-fun res!940955 () Bool)

(assert (=> b!1402444 (=> (not res!940955) (not e!794140))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95861 (_ BitVec 32)) Bool)

(assert (=> b!1402444 (= res!940955 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!940962 () Bool)

(assert (=> start!120452 (=> (not res!940962) (not e!794140))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120452 (= res!940962 (validMask!0 mask!2840))))

(assert (=> start!120452 e!794140))

(assert (=> start!120452 true))

(declare-fun array_inv!35309 (array!95861) Bool)

(assert (=> start!120452 (array_inv!35309 a!2901)))

(declare-fun b!1402445 () Bool)

(declare-fun e!794141 () Bool)

(assert (=> b!1402445 (= e!794141 true)))

(declare-datatypes ((SeekEntryResult!10598 0))(
  ( (MissingZero!10598 (index!44769 (_ BitVec 32))) (Found!10598 (index!44770 (_ BitVec 32))) (Intermediate!10598 (undefined!11410 Bool) (index!44771 (_ BitVec 32)) (x!126393 (_ BitVec 32))) (Undefined!10598) (MissingVacant!10598 (index!44772 (_ BitVec 32))) )
))
(declare-fun lt!617733 () SeekEntryResult!10598)

(declare-fun lt!617725 () SeekEntryResult!10598)

(assert (=> b!1402445 (= lt!617733 lt!617725)))

(declare-fun lt!617727 () (_ BitVec 32))

(declare-fun lt!617724 () SeekEntryResult!10598)

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((Unit!47200 0))(
  ( (Unit!47201) )
))
(declare-fun lt!617726 () Unit!47200)

(declare-fun lt!617729 () SeekEntryResult!10598)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!95861 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47200)

(assert (=> b!1402445 (= lt!617726 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617727 (x!126393 lt!617729) (index!44771 lt!617729) (x!126393 lt!617724) (index!44771 lt!617724) mask!2840))))

(declare-fun b!1402446 () Bool)

(declare-fun res!940957 () Bool)

(assert (=> b!1402446 (=> (not res!940957) (not e!794140))))

(assert (=> b!1402446 (= res!940957 (validKeyInArray!0 (select (arr!46281 a!2901) i!1037)))))

(declare-fun b!1402447 () Bool)

(declare-fun res!940960 () Bool)

(assert (=> b!1402447 (=> (not res!940960) (not e!794140))))

(assert (=> b!1402447 (= res!940960 (and (= (size!46831 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46831 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46831 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1402448 () Bool)

(declare-fun e!794142 () Bool)

(assert (=> b!1402448 (= e!794142 e!794141)))

(declare-fun res!940963 () Bool)

(assert (=> b!1402448 (=> res!940963 e!794141)))

(assert (=> b!1402448 (= res!940963 (or (bvslt (x!126393 lt!617729) #b00000000000000000000000000000000) (bvsgt (x!126393 lt!617729) #b01111111111111111111111111111110) (bvslt (x!126393 lt!617724) #b00000000000000000000000000000000) (bvsgt (x!126393 lt!617724) #b01111111111111111111111111111110) (bvslt lt!617727 #b00000000000000000000000000000000) (bvsge lt!617727 (size!46831 a!2901)) (bvslt (index!44771 lt!617729) #b00000000000000000000000000000000) (bvsge (index!44771 lt!617729) (size!46831 a!2901)) (bvslt (index!44771 lt!617724) #b00000000000000000000000000000000) (bvsge (index!44771 lt!617724) (size!46831 a!2901)) (not (= lt!617729 (Intermediate!10598 false (index!44771 lt!617729) (x!126393 lt!617729)))) (not (= lt!617724 (Intermediate!10598 false (index!44771 lt!617724) (x!126393 lt!617724))))))))

(declare-fun lt!617731 () array!95861)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95861 (_ BitVec 32)) SeekEntryResult!10598)

(assert (=> b!1402448 (= lt!617725 (seekKeyOrZeroReturnVacant!0 (x!126393 lt!617724) (index!44771 lt!617724) (index!44771 lt!617724) (select (arr!46281 a!2901) j!112) lt!617731 mask!2840))))

(declare-fun lt!617732 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95861 (_ BitVec 32)) SeekEntryResult!10598)

(assert (=> b!1402448 (= lt!617725 (seekEntryOrOpen!0 lt!617732 lt!617731 mask!2840))))

(assert (=> b!1402448 (and (not (undefined!11410 lt!617724)) (= (index!44771 lt!617724) i!1037) (bvslt (x!126393 lt!617724) (x!126393 lt!617729)) (= (select (store (arr!46281 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44771 lt!617724)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!617728 () Unit!47200)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95861 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47200)

(assert (=> b!1402448 (= lt!617728 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617727 (x!126393 lt!617729) (index!44771 lt!617729) (x!126393 lt!617724) (index!44771 lt!617724) (undefined!11410 lt!617724) mask!2840))))

(declare-fun b!1402449 () Bool)

(declare-fun e!794144 () Bool)

(assert (=> b!1402449 (= e!794144 e!794142)))

(declare-fun res!940959 () Bool)

(assert (=> b!1402449 (=> res!940959 e!794142)))

(get-info :version)

(assert (=> b!1402449 (= res!940959 (or (= lt!617729 lt!617724) (not ((_ is Intermediate!10598) lt!617724))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95861 (_ BitVec 32)) SeekEntryResult!10598)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402449 (= lt!617724 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617732 mask!2840) lt!617732 lt!617731 mask!2840))))

(assert (=> b!1402449 (= lt!617732 (select (store (arr!46281 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402449 (= lt!617731 (array!95862 (store (arr!46281 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46831 a!2901)))))

(declare-fun b!1402450 () Bool)

(assert (=> b!1402450 (= e!794140 (not e!794144))))

(declare-fun res!940958 () Bool)

(assert (=> b!1402450 (=> res!940958 e!794144)))

(assert (=> b!1402450 (= res!940958 (or (not ((_ is Intermediate!10598) lt!617729)) (undefined!11410 lt!617729)))))

(assert (=> b!1402450 (= lt!617733 (Found!10598 j!112))))

(assert (=> b!1402450 (= lt!617733 (seekEntryOrOpen!0 (select (arr!46281 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1402450 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!617730 () Unit!47200)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95861 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47200)

(assert (=> b!1402450 (= lt!617730 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1402450 (= lt!617729 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617727 (select (arr!46281 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1402450 (= lt!617727 (toIndex!0 (select (arr!46281 a!2901) j!112) mask!2840))))

(declare-fun b!1402451 () Bool)

(declare-fun res!940961 () Bool)

(assert (=> b!1402451 (=> (not res!940961) (not e!794140))))

(declare-datatypes ((List!32800 0))(
  ( (Nil!32797) (Cons!32796 (h!34044 (_ BitVec 64)) (t!47494 List!32800)) )
))
(declare-fun arrayNoDuplicates!0 (array!95861 (_ BitVec 32) List!32800) Bool)

(assert (=> b!1402451 (= res!940961 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32797))))

(declare-fun b!1402452 () Bool)

(declare-fun res!940956 () Bool)

(assert (=> b!1402452 (=> res!940956 e!794141)))

(assert (=> b!1402452 (= res!940956 (not (= lt!617724 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617727 lt!617732 lt!617731 mask!2840))))))

(assert (= (and start!120452 res!940962) b!1402447))

(assert (= (and b!1402447 res!940960) b!1402446))

(assert (= (and b!1402446 res!940957) b!1402443))

(assert (= (and b!1402443 res!940954) b!1402444))

(assert (= (and b!1402444 res!940955) b!1402451))

(assert (= (and b!1402451 res!940961) b!1402450))

(assert (= (and b!1402450 (not res!940958)) b!1402449))

(assert (= (and b!1402449 (not res!940959)) b!1402448))

(assert (= (and b!1402448 (not res!940963)) b!1402452))

(assert (= (and b!1402452 (not res!940956)) b!1402445))

(declare-fun m!1290607 () Bool)

(assert (=> b!1402446 m!1290607))

(assert (=> b!1402446 m!1290607))

(declare-fun m!1290609 () Bool)

(assert (=> b!1402446 m!1290609))

(declare-fun m!1290611 () Bool)

(assert (=> b!1402452 m!1290611))

(declare-fun m!1290613 () Bool)

(assert (=> b!1402444 m!1290613))

(declare-fun m!1290615 () Bool)

(assert (=> b!1402449 m!1290615))

(assert (=> b!1402449 m!1290615))

(declare-fun m!1290617 () Bool)

(assert (=> b!1402449 m!1290617))

(declare-fun m!1290619 () Bool)

(assert (=> b!1402449 m!1290619))

(declare-fun m!1290621 () Bool)

(assert (=> b!1402449 m!1290621))

(declare-fun m!1290623 () Bool)

(assert (=> b!1402451 m!1290623))

(declare-fun m!1290625 () Bool)

(assert (=> b!1402448 m!1290625))

(declare-fun m!1290627 () Bool)

(assert (=> b!1402448 m!1290627))

(declare-fun m!1290629 () Bool)

(assert (=> b!1402448 m!1290629))

(assert (=> b!1402448 m!1290627))

(declare-fun m!1290631 () Bool)

(assert (=> b!1402448 m!1290631))

(declare-fun m!1290633 () Bool)

(assert (=> b!1402448 m!1290633))

(assert (=> b!1402448 m!1290619))

(declare-fun m!1290635 () Bool)

(assert (=> b!1402445 m!1290635))

(assert (=> b!1402443 m!1290627))

(assert (=> b!1402443 m!1290627))

(declare-fun m!1290637 () Bool)

(assert (=> b!1402443 m!1290637))

(assert (=> b!1402450 m!1290627))

(declare-fun m!1290639 () Bool)

(assert (=> b!1402450 m!1290639))

(assert (=> b!1402450 m!1290627))

(declare-fun m!1290641 () Bool)

(assert (=> b!1402450 m!1290641))

(assert (=> b!1402450 m!1290627))

(declare-fun m!1290643 () Bool)

(assert (=> b!1402450 m!1290643))

(assert (=> b!1402450 m!1290627))

(declare-fun m!1290645 () Bool)

(assert (=> b!1402450 m!1290645))

(declare-fun m!1290647 () Bool)

(assert (=> b!1402450 m!1290647))

(declare-fun m!1290649 () Bool)

(assert (=> start!120452 m!1290649))

(declare-fun m!1290651 () Bool)

(assert (=> start!120452 m!1290651))

(check-sat (not b!1402445) (not start!120452) (not b!1402448) (not b!1402452) (not b!1402450) (not b!1402443) (not b!1402451) (not b!1402446) (not b!1402449) (not b!1402444))
(check-sat)

; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120454 () Bool)

(assert start!120454)

(declare-fun b!1402473 () Bool)

(declare-fun res!940989 () Bool)

(declare-fun e!794159 () Bool)

(assert (=> b!1402473 (=> (not res!940989) (not e!794159))))

(declare-datatypes ((array!95863 0))(
  ( (array!95864 (arr!46282 (Array (_ BitVec 32) (_ BitVec 64))) (size!46832 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95863)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95863 (_ BitVec 32)) Bool)

(assert (=> b!1402473 (= res!940989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1402474 () Bool)

(declare-fun res!940986 () Bool)

(declare-fun e!794155 () Bool)

(assert (=> b!1402474 (=> res!940986 e!794155)))

(declare-datatypes ((SeekEntryResult!10599 0))(
  ( (MissingZero!10599 (index!44773 (_ BitVec 32))) (Found!10599 (index!44774 (_ BitVec 32))) (Intermediate!10599 (undefined!11411 Bool) (index!44775 (_ BitVec 32)) (x!126394 (_ BitVec 32))) (Undefined!10599) (MissingVacant!10599 (index!44776 (_ BitVec 32))) )
))
(declare-fun lt!617759 () SeekEntryResult!10599)

(declare-fun lt!617763 () (_ BitVec 64))

(declare-fun lt!617756 () array!95863)

(declare-fun lt!617755 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95863 (_ BitVec 32)) SeekEntryResult!10599)

(assert (=> b!1402474 (= res!940986 (not (= lt!617759 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617755 lt!617763 lt!617756 mask!2840))))))

(declare-fun b!1402475 () Bool)

(declare-fun res!940985 () Bool)

(assert (=> b!1402475 (=> (not res!940985) (not e!794159))))

(declare-datatypes ((List!32801 0))(
  ( (Nil!32798) (Cons!32797 (h!34045 (_ BitVec 64)) (t!47495 List!32801)) )
))
(declare-fun arrayNoDuplicates!0 (array!95863 (_ BitVec 32) List!32801) Bool)

(assert (=> b!1402475 (= res!940985 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32798))))

(declare-fun res!940984 () Bool)

(assert (=> start!120454 (=> (not res!940984) (not e!794159))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120454 (= res!940984 (validMask!0 mask!2840))))

(assert (=> start!120454 e!794159))

(assert (=> start!120454 true))

(declare-fun array_inv!35310 (array!95863) Bool)

(assert (=> start!120454 (array_inv!35310 a!2901)))

(declare-fun b!1402476 () Bool)

(declare-fun e!794158 () Bool)

(assert (=> b!1402476 (= e!794158 e!794155)))

(declare-fun res!940993 () Bool)

(assert (=> b!1402476 (=> res!940993 e!794155)))

(declare-fun lt!617758 () SeekEntryResult!10599)

(assert (=> b!1402476 (= res!940993 (or (bvslt (x!126394 lt!617758) #b00000000000000000000000000000000) (bvsgt (x!126394 lt!617758) #b01111111111111111111111111111110) (bvslt (x!126394 lt!617759) #b00000000000000000000000000000000) (bvsgt (x!126394 lt!617759) #b01111111111111111111111111111110) (bvslt lt!617755 #b00000000000000000000000000000000) (bvsge lt!617755 (size!46832 a!2901)) (bvslt (index!44775 lt!617758) #b00000000000000000000000000000000) (bvsge (index!44775 lt!617758) (size!46832 a!2901)) (bvslt (index!44775 lt!617759) #b00000000000000000000000000000000) (bvsge (index!44775 lt!617759) (size!46832 a!2901)) (not (= lt!617758 (Intermediate!10599 false (index!44775 lt!617758) (x!126394 lt!617758)))) (not (= lt!617759 (Intermediate!10599 false (index!44775 lt!617759) (x!126394 lt!617759))))))))

(declare-fun lt!617754 () SeekEntryResult!10599)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95863 (_ BitVec 32)) SeekEntryResult!10599)

(assert (=> b!1402476 (= lt!617754 (seekKeyOrZeroReturnVacant!0 (x!126394 lt!617759) (index!44775 lt!617759) (index!44775 lt!617759) (select (arr!46282 a!2901) j!112) lt!617756 mask!2840))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95863 (_ BitVec 32)) SeekEntryResult!10599)

(assert (=> b!1402476 (= lt!617754 (seekEntryOrOpen!0 lt!617763 lt!617756 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1402476 (and (not (undefined!11411 lt!617759)) (= (index!44775 lt!617759) i!1037) (bvslt (x!126394 lt!617759) (x!126394 lt!617758)) (= (select (store (arr!46282 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44775 lt!617759)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!47202 0))(
  ( (Unit!47203) )
))
(declare-fun lt!617762 () Unit!47202)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95863 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47202)

(assert (=> b!1402476 (= lt!617762 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617755 (x!126394 lt!617758) (index!44775 lt!617758) (x!126394 lt!617759) (index!44775 lt!617759) (undefined!11411 lt!617759) mask!2840))))

(declare-fun b!1402477 () Bool)

(declare-fun e!794156 () Bool)

(assert (=> b!1402477 (= e!794156 e!794158)))

(declare-fun res!940991 () Bool)

(assert (=> b!1402477 (=> res!940991 e!794158)))

(assert (=> b!1402477 (= res!940991 (or (= lt!617758 lt!617759) (not (is-Intermediate!10599 lt!617759))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402477 (= lt!617759 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617763 mask!2840) lt!617763 lt!617756 mask!2840))))

(assert (=> b!1402477 (= lt!617763 (select (store (arr!46282 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402477 (= lt!617756 (array!95864 (store (arr!46282 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46832 a!2901)))))

(declare-fun b!1402478 () Bool)

(assert (=> b!1402478 (= e!794159 (not e!794156))))

(declare-fun res!940990 () Bool)

(assert (=> b!1402478 (=> res!940990 e!794156)))

(assert (=> b!1402478 (= res!940990 (or (not (is-Intermediate!10599 lt!617758)) (undefined!11411 lt!617758)))))

(declare-fun lt!617760 () SeekEntryResult!10599)

(assert (=> b!1402478 (= lt!617760 (Found!10599 j!112))))

(assert (=> b!1402478 (= lt!617760 (seekEntryOrOpen!0 (select (arr!46282 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1402478 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!617761 () Unit!47202)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95863 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47202)

(assert (=> b!1402478 (= lt!617761 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1402478 (= lt!617758 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617755 (select (arr!46282 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1402478 (= lt!617755 (toIndex!0 (select (arr!46282 a!2901) j!112) mask!2840))))

(declare-fun b!1402479 () Bool)

(declare-fun res!940987 () Bool)

(assert (=> b!1402479 (=> (not res!940987) (not e!794159))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402479 (= res!940987 (validKeyInArray!0 (select (arr!46282 a!2901) i!1037)))))

(declare-fun b!1402480 () Bool)

(assert (=> b!1402480 (= e!794155 true)))

(assert (=> b!1402480 (= lt!617760 lt!617754)))

(declare-fun lt!617757 () Unit!47202)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!95863 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47202)

(assert (=> b!1402480 (= lt!617757 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617755 (x!126394 lt!617758) (index!44775 lt!617758) (x!126394 lt!617759) (index!44775 lt!617759) mask!2840))))

(declare-fun b!1402481 () Bool)

(declare-fun res!940992 () Bool)

(assert (=> b!1402481 (=> (not res!940992) (not e!794159))))

(assert (=> b!1402481 (= res!940992 (validKeyInArray!0 (select (arr!46282 a!2901) j!112)))))

(declare-fun b!1402482 () Bool)

(declare-fun res!940988 () Bool)

(assert (=> b!1402482 (=> (not res!940988) (not e!794159))))

(assert (=> b!1402482 (= res!940988 (and (= (size!46832 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46832 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46832 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120454 res!940984) b!1402482))

(assert (= (and b!1402482 res!940988) b!1402479))

(assert (= (and b!1402479 res!940987) b!1402481))

(assert (= (and b!1402481 res!940992) b!1402473))

(assert (= (and b!1402473 res!940989) b!1402475))

(assert (= (and b!1402475 res!940985) b!1402478))

(assert (= (and b!1402478 (not res!940990)) b!1402477))

(assert (= (and b!1402477 (not res!940991)) b!1402476))

(assert (= (and b!1402476 (not res!940993)) b!1402474))

(assert (= (and b!1402474 (not res!940986)) b!1402480))

(declare-fun m!1290653 () Bool)

(assert (=> b!1402475 m!1290653))

(declare-fun m!1290655 () Bool)

(assert (=> b!1402476 m!1290655))

(declare-fun m!1290657 () Bool)

(assert (=> b!1402476 m!1290657))

(declare-fun m!1290659 () Bool)

(assert (=> b!1402476 m!1290659))

(declare-fun m!1290661 () Bool)

(assert (=> b!1402476 m!1290661))

(assert (=> b!1402476 m!1290659))

(declare-fun m!1290663 () Bool)

(assert (=> b!1402476 m!1290663))

(declare-fun m!1290665 () Bool)

(assert (=> b!1402476 m!1290665))

(declare-fun m!1290667 () Bool)

(assert (=> b!1402473 m!1290667))

(assert (=> b!1402481 m!1290659))

(assert (=> b!1402481 m!1290659))

(declare-fun m!1290669 () Bool)

(assert (=> b!1402481 m!1290669))

(declare-fun m!1290671 () Bool)

(assert (=> b!1402474 m!1290671))

(declare-fun m!1290673 () Bool)

(assert (=> start!120454 m!1290673))

(declare-fun m!1290675 () Bool)

(assert (=> start!120454 m!1290675))

(declare-fun m!1290677 () Bool)

(assert (=> b!1402479 m!1290677))

(assert (=> b!1402479 m!1290677))

(declare-fun m!1290679 () Bool)

(assert (=> b!1402479 m!1290679))

(declare-fun m!1290681 () Bool)

(assert (=> b!1402480 m!1290681))

(declare-fun m!1290683 () Bool)

(assert (=> b!1402477 m!1290683))

(assert (=> b!1402477 m!1290683))

(declare-fun m!1290685 () Bool)

(assert (=> b!1402477 m!1290685))

(assert (=> b!1402477 m!1290665))

(declare-fun m!1290687 () Bool)

(assert (=> b!1402477 m!1290687))

(assert (=> b!1402478 m!1290659))

(declare-fun m!1290689 () Bool)

(assert (=> b!1402478 m!1290689))

(assert (=> b!1402478 m!1290659))

(assert (=> b!1402478 m!1290659))

(declare-fun m!1290691 () Bool)

(assert (=> b!1402478 m!1290691))

(declare-fun m!1290693 () Bool)

(assert (=> b!1402478 m!1290693))

(assert (=> b!1402478 m!1290659))

(declare-fun m!1290695 () Bool)

(assert (=> b!1402478 m!1290695))

(declare-fun m!1290697 () Bool)

(assert (=> b!1402478 m!1290697))

(push 1)


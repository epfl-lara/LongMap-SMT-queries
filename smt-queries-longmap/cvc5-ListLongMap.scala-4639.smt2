; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64534 () Bool)

(assert start!64534)

(declare-fun b!726703 () Bool)

(declare-fun e!406858 () Bool)

(declare-fun e!406855 () Bool)

(assert (=> b!726703 (= e!406858 e!406855)))

(declare-fun res!487659 () Bool)

(assert (=> b!726703 (=> (not res!487659) (not e!406855))))

(declare-datatypes ((SeekEntryResult!7247 0))(
  ( (MissingZero!7247 (index!31356 (_ BitVec 32))) (Found!7247 (index!31357 (_ BitVec 32))) (Intermediate!7247 (undefined!8059 Bool) (index!31358 (_ BitVec 32)) (x!62345 (_ BitVec 32))) (Undefined!7247) (MissingVacant!7247 (index!31359 (_ BitVec 32))) )
))
(declare-fun lt!321829 () SeekEntryResult!7247)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!726703 (= res!487659 (or (= lt!321829 (MissingZero!7247 i!1173)) (= lt!321829 (MissingVacant!7247 i!1173))))))

(declare-datatypes ((array!41052 0))(
  ( (array!41053 (arr!19647 (Array (_ BitVec 32) (_ BitVec 64))) (size!20068 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41052)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41052 (_ BitVec 32)) SeekEntryResult!7247)

(assert (=> b!726703 (= lt!321829 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!726704 () Bool)

(declare-fun res!487669 () Bool)

(declare-fun e!406853 () Bool)

(assert (=> b!726704 (=> (not res!487669) (not e!406853))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!726704 (= res!487669 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19647 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!726705 () Bool)

(declare-fun e!406854 () Bool)

(assert (=> b!726705 (= e!406853 e!406854)))

(declare-fun res!487667 () Bool)

(assert (=> b!726705 (=> (not res!487667) (not e!406854))))

(declare-fun lt!321836 () SeekEntryResult!7247)

(declare-fun lt!321830 () SeekEntryResult!7247)

(assert (=> b!726705 (= res!487667 (= lt!321836 lt!321830))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!321832 () array!41052)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!321831 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41052 (_ BitVec 32)) SeekEntryResult!7247)

(assert (=> b!726705 (= lt!321830 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321831 lt!321832 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!726705 (= lt!321836 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321831 mask!3328) lt!321831 lt!321832 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!726705 (= lt!321831 (select (store (arr!19647 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!726705 (= lt!321832 (array!41053 (store (arr!19647 a!3186) i!1173 k!2102) (size!20068 a!3186)))))

(declare-fun e!406859 () Bool)

(declare-fun b!726706 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41052 (_ BitVec 32)) SeekEntryResult!7247)

(assert (=> b!726706 (= e!406859 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19647 a!3186) j!159) a!3186 mask!3328) (Found!7247 j!159)))))

(declare-fun b!726707 () Bool)

(declare-fun res!487655 () Bool)

(assert (=> b!726707 (=> (not res!487655) (not e!406855))))

(declare-datatypes ((List!13649 0))(
  ( (Nil!13646) (Cons!13645 (h!14702 (_ BitVec 64)) (t!19964 List!13649)) )
))
(declare-fun arrayNoDuplicates!0 (array!41052 (_ BitVec 32) List!13649) Bool)

(assert (=> b!726707 (= res!487655 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13646))))

(declare-fun b!726708 () Bool)

(declare-fun res!487661 () Bool)

(assert (=> b!726708 (=> (not res!487661) (not e!406855))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!726708 (= res!487661 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20068 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20068 a!3186))))))

(declare-fun b!726709 () Bool)

(declare-fun res!487658 () Bool)

(assert (=> b!726709 (=> (not res!487658) (not e!406858))))

(declare-fun arrayContainsKey!0 (array!41052 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!726709 (= res!487658 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!726710 () Bool)

(declare-fun e!406852 () Bool)

(declare-fun lt!321835 () SeekEntryResult!7247)

(assert (=> b!726710 (= e!406852 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19647 a!3186) j!159) a!3186 mask!3328) lt!321835))))

(declare-fun b!726711 () Bool)

(declare-fun lt!321828 () SeekEntryResult!7247)

(assert (=> b!726711 (= e!406859 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19647 a!3186) j!159) a!3186 mask!3328) lt!321828))))

(declare-fun b!726712 () Bool)

(declare-fun res!487670 () Bool)

(assert (=> b!726712 (=> (not res!487670) (not e!406858))))

(assert (=> b!726712 (= res!487670 (and (= (size!20068 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20068 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20068 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!726713 () Bool)

(declare-fun res!487668 () Bool)

(assert (=> b!726713 (=> (not res!487668) (not e!406855))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41052 (_ BitVec 32)) Bool)

(assert (=> b!726713 (= res!487668 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!726715 () Bool)

(assert (=> b!726715 (= e!406855 e!406853)))

(declare-fun res!487664 () Bool)

(assert (=> b!726715 (=> (not res!487664) (not e!406853))))

(assert (=> b!726715 (= res!487664 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19647 a!3186) j!159) mask!3328) (select (arr!19647 a!3186) j!159) a!3186 mask!3328) lt!321828))))

(assert (=> b!726715 (= lt!321828 (Intermediate!7247 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!726716 () Bool)

(declare-fun res!487665 () Bool)

(assert (=> b!726716 (=> (not res!487665) (not e!406853))))

(assert (=> b!726716 (= res!487665 e!406859)))

(declare-fun c!79897 () Bool)

(assert (=> b!726716 (= c!79897 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!726717 () Bool)

(declare-fun e!406851 () Bool)

(assert (=> b!726717 (= e!406851 true)))

(declare-fun lt!321834 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!726717 (= lt!321834 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!726718 () Bool)

(declare-fun res!487666 () Bool)

(assert (=> b!726718 (=> (not res!487666) (not e!406858))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!726718 (= res!487666 (validKeyInArray!0 (select (arr!19647 a!3186) j!159)))))

(declare-fun b!726719 () Bool)

(assert (=> b!726719 (= e!406854 (not e!406851))))

(declare-fun res!487663 () Bool)

(assert (=> b!726719 (=> res!487663 e!406851)))

(assert (=> b!726719 (= res!487663 (or (not (is-Intermediate!7247 lt!321830)) (bvsge x!1131 (x!62345 lt!321830))))))

(declare-fun e!406856 () Bool)

(assert (=> b!726719 e!406856))

(declare-fun res!487662 () Bool)

(assert (=> b!726719 (=> (not res!487662) (not e!406856))))

(assert (=> b!726719 (= res!487662 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24812 0))(
  ( (Unit!24813) )
))
(declare-fun lt!321833 () Unit!24812)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41052 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24812)

(assert (=> b!726719 (= lt!321833 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!726720 () Bool)

(assert (=> b!726720 (= e!406856 e!406852)))

(declare-fun res!487656 () Bool)

(assert (=> b!726720 (=> (not res!487656) (not e!406852))))

(assert (=> b!726720 (= res!487656 (= (seekEntryOrOpen!0 (select (arr!19647 a!3186) j!159) a!3186 mask!3328) lt!321835))))

(assert (=> b!726720 (= lt!321835 (Found!7247 j!159))))

(declare-fun b!726714 () Bool)

(declare-fun res!487657 () Bool)

(assert (=> b!726714 (=> (not res!487657) (not e!406858))))

(assert (=> b!726714 (= res!487657 (validKeyInArray!0 k!2102))))

(declare-fun res!487660 () Bool)

(assert (=> start!64534 (=> (not res!487660) (not e!406858))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64534 (= res!487660 (validMask!0 mask!3328))))

(assert (=> start!64534 e!406858))

(assert (=> start!64534 true))

(declare-fun array_inv!15443 (array!41052) Bool)

(assert (=> start!64534 (array_inv!15443 a!3186)))

(assert (= (and start!64534 res!487660) b!726712))

(assert (= (and b!726712 res!487670) b!726718))

(assert (= (and b!726718 res!487666) b!726714))

(assert (= (and b!726714 res!487657) b!726709))

(assert (= (and b!726709 res!487658) b!726703))

(assert (= (and b!726703 res!487659) b!726713))

(assert (= (and b!726713 res!487668) b!726707))

(assert (= (and b!726707 res!487655) b!726708))

(assert (= (and b!726708 res!487661) b!726715))

(assert (= (and b!726715 res!487664) b!726704))

(assert (= (and b!726704 res!487669) b!726716))

(assert (= (and b!726716 c!79897) b!726711))

(assert (= (and b!726716 (not c!79897)) b!726706))

(assert (= (and b!726716 res!487665) b!726705))

(assert (= (and b!726705 res!487667) b!726719))

(assert (= (and b!726719 res!487662) b!726720))

(assert (= (and b!726720 res!487656) b!726710))

(assert (= (and b!726719 (not res!487663)) b!726717))

(declare-fun m!680737 () Bool)

(assert (=> b!726711 m!680737))

(assert (=> b!726711 m!680737))

(declare-fun m!680739 () Bool)

(assert (=> b!726711 m!680739))

(assert (=> b!726706 m!680737))

(assert (=> b!726706 m!680737))

(declare-fun m!680741 () Bool)

(assert (=> b!726706 m!680741))

(assert (=> b!726715 m!680737))

(assert (=> b!726715 m!680737))

(declare-fun m!680743 () Bool)

(assert (=> b!726715 m!680743))

(assert (=> b!726715 m!680743))

(assert (=> b!726715 m!680737))

(declare-fun m!680745 () Bool)

(assert (=> b!726715 m!680745))

(declare-fun m!680747 () Bool)

(assert (=> b!726705 m!680747))

(declare-fun m!680749 () Bool)

(assert (=> b!726705 m!680749))

(declare-fun m!680751 () Bool)

(assert (=> b!726705 m!680751))

(declare-fun m!680753 () Bool)

(assert (=> b!726705 m!680753))

(assert (=> b!726705 m!680751))

(declare-fun m!680755 () Bool)

(assert (=> b!726705 m!680755))

(declare-fun m!680757 () Bool)

(assert (=> b!726704 m!680757))

(assert (=> b!726720 m!680737))

(assert (=> b!726720 m!680737))

(declare-fun m!680759 () Bool)

(assert (=> b!726720 m!680759))

(declare-fun m!680761 () Bool)

(assert (=> b!726713 m!680761))

(assert (=> b!726710 m!680737))

(assert (=> b!726710 m!680737))

(declare-fun m!680763 () Bool)

(assert (=> b!726710 m!680763))

(declare-fun m!680765 () Bool)

(assert (=> b!726703 m!680765))

(declare-fun m!680767 () Bool)

(assert (=> b!726714 m!680767))

(declare-fun m!680769 () Bool)

(assert (=> b!726719 m!680769))

(declare-fun m!680771 () Bool)

(assert (=> b!726719 m!680771))

(declare-fun m!680773 () Bool)

(assert (=> b!726709 m!680773))

(declare-fun m!680775 () Bool)

(assert (=> b!726717 m!680775))

(declare-fun m!680777 () Bool)

(assert (=> start!64534 m!680777))

(declare-fun m!680779 () Bool)

(assert (=> start!64534 m!680779))

(declare-fun m!680781 () Bool)

(assert (=> b!726707 m!680781))

(assert (=> b!726718 m!680737))

(assert (=> b!726718 m!680737))

(declare-fun m!680783 () Bool)

(assert (=> b!726718 m!680783))

(push 1)


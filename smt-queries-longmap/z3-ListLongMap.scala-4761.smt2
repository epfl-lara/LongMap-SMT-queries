; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65606 () Bool)

(assert start!65606)

(declare-fun b!750785 () Bool)

(declare-fun res!506883 () Bool)

(declare-fun e!418833 () Bool)

(assert (=> b!750785 (=> (not res!506883) (not e!418833))))

(declare-datatypes ((array!41796 0))(
  ( (array!41797 (arr!20012 (Array (_ BitVec 32) (_ BitVec 64))) (size!20433 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41796)

(declare-datatypes ((List!14053 0))(
  ( (Nil!14050) (Cons!14049 (h!15121 (_ BitVec 64)) (t!20359 List!14053)) )
))
(declare-fun arrayNoDuplicates!0 (array!41796 (_ BitVec 32) List!14053) Bool)

(assert (=> b!750785 (= res!506883 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14050))))

(declare-fun b!750786 () Bool)

(declare-fun res!506880 () Bool)

(declare-fun e!418843 () Bool)

(assert (=> b!750786 (=> (not res!506880) (not e!418843))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!750786 (= res!506880 (validKeyInArray!0 (select (arr!20012 a!3186) j!159)))))

(declare-fun b!750787 () Bool)

(declare-fun e!418838 () Bool)

(declare-fun e!418836 () Bool)

(assert (=> b!750787 (= e!418838 (not e!418836))))

(declare-fun res!506877 () Bool)

(assert (=> b!750787 (=> res!506877 e!418836)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7609 0))(
  ( (MissingZero!7609 (index!32804 (_ BitVec 32))) (Found!7609 (index!32805 (_ BitVec 32))) (Intermediate!7609 (undefined!8421 Bool) (index!32806 (_ BitVec 32)) (x!63738 (_ BitVec 32))) (Undefined!7609) (MissingVacant!7609 (index!32807 (_ BitVec 32))) )
))
(declare-fun lt!333746 () SeekEntryResult!7609)

(declare-fun index!1321 () (_ BitVec 32))

(get-info :version)

(assert (=> b!750787 (= res!506877 (or (not ((_ is Intermediate!7609) lt!333746)) (bvslt x!1131 (x!63738 lt!333746)) (not (= x!1131 (x!63738 lt!333746))) (not (= index!1321 (index!32806 lt!333746)))))))

(declare-fun e!418835 () Bool)

(assert (=> b!750787 e!418835))

(declare-fun res!506874 () Bool)

(assert (=> b!750787 (=> (not res!506874) (not e!418835))))

(declare-fun lt!333745 () SeekEntryResult!7609)

(declare-fun lt!333744 () SeekEntryResult!7609)

(assert (=> b!750787 (= res!506874 (= lt!333745 lt!333744))))

(assert (=> b!750787 (= lt!333744 (Found!7609 j!159))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41796 (_ BitVec 32)) SeekEntryResult!7609)

(assert (=> b!750787 (= lt!333745 (seekEntryOrOpen!0 (select (arr!20012 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41796 (_ BitVec 32)) Bool)

(assert (=> b!750787 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25796 0))(
  ( (Unit!25797) )
))
(declare-fun lt!333748 () Unit!25796)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41796 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25796)

(assert (=> b!750787 (= lt!333748 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!750788 () Bool)

(declare-fun e!418842 () Bool)

(assert (=> b!750788 (= e!418833 e!418842)))

(declare-fun res!506884 () Bool)

(assert (=> b!750788 (=> (not res!506884) (not e!418842))))

(declare-fun lt!333740 () SeekEntryResult!7609)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41796 (_ BitVec 32)) SeekEntryResult!7609)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!750788 (= res!506884 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20012 a!3186) j!159) mask!3328) (select (arr!20012 a!3186) j!159) a!3186 mask!3328) lt!333740))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!750788 (= lt!333740 (Intermediate!7609 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!750789 () Bool)

(declare-fun res!506882 () Bool)

(assert (=> b!750789 (=> (not res!506882) (not e!418843))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!750789 (= res!506882 (validKeyInArray!0 k0!2102))))

(declare-fun b!750790 () Bool)

(declare-fun e!418841 () Unit!25796)

(declare-fun Unit!25798 () Unit!25796)

(assert (=> b!750790 (= e!418841 Unit!25798)))

(assert (=> b!750790 false))

(declare-fun b!750791 () Bool)

(assert (=> b!750791 (= e!418843 e!418833)))

(declare-fun res!506885 () Bool)

(assert (=> b!750791 (=> (not res!506885) (not e!418833))))

(declare-fun lt!333747 () SeekEntryResult!7609)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!750791 (= res!506885 (or (= lt!333747 (MissingZero!7609 i!1173)) (= lt!333747 (MissingVacant!7609 i!1173))))))

(assert (=> b!750791 (= lt!333747 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!750793 () Bool)

(declare-fun res!506888 () Bool)

(assert (=> b!750793 (=> (not res!506888) (not e!418833))))

(assert (=> b!750793 (= res!506888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!750794 () Bool)

(declare-fun res!506875 () Bool)

(assert (=> b!750794 (=> (not res!506875) (not e!418842))))

(assert (=> b!750794 (= res!506875 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20012 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!750795 () Bool)

(declare-fun res!506872 () Bool)

(assert (=> b!750795 (=> res!506872 e!418836)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41796 (_ BitVec 32)) SeekEntryResult!7609)

(assert (=> b!750795 (= res!506872 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20012 a!3186) j!159) a!3186 mask!3328) lt!333744)))))

(declare-fun e!418837 () Bool)

(declare-fun b!750796 () Bool)

(assert (=> b!750796 (= e!418837 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20012 a!3186) j!159) a!3186 mask!3328) lt!333740))))

(declare-fun b!750797 () Bool)

(declare-fun res!506878 () Bool)

(assert (=> b!750797 (=> (not res!506878) (not e!418842))))

(assert (=> b!750797 (= res!506878 e!418837)))

(declare-fun c!82337 () Bool)

(assert (=> b!750797 (= c!82337 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!750798 () Bool)

(assert (=> b!750798 (= e!418837 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20012 a!3186) j!159) a!3186 mask!3328) (Found!7609 j!159)))))

(declare-fun b!750799 () Bool)

(declare-fun res!506876 () Bool)

(assert (=> b!750799 (=> (not res!506876) (not e!418833))))

(assert (=> b!750799 (= res!506876 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20433 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20433 a!3186))))))

(declare-fun b!750800 () Bool)

(assert (=> b!750800 (= e!418842 e!418838)))

(declare-fun res!506889 () Bool)

(assert (=> b!750800 (=> (not res!506889) (not e!418838))))

(declare-fun lt!333749 () SeekEntryResult!7609)

(assert (=> b!750800 (= res!506889 (= lt!333749 lt!333746))))

(declare-fun lt!333739 () (_ BitVec 64))

(declare-fun lt!333743 () array!41796)

(assert (=> b!750800 (= lt!333746 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333739 lt!333743 mask!3328))))

(assert (=> b!750800 (= lt!333749 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333739 mask!3328) lt!333739 lt!333743 mask!3328))))

(assert (=> b!750800 (= lt!333739 (select (store (arr!20012 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!750800 (= lt!333743 (array!41797 (store (arr!20012 a!3186) i!1173 k0!2102) (size!20433 a!3186)))))

(declare-fun b!750801 () Bool)

(declare-fun e!418839 () Bool)

(assert (=> b!750801 (= e!418839 (= (seekEntryOrOpen!0 lt!333739 lt!333743 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!333739 lt!333743 mask!3328)))))

(declare-fun b!750802 () Bool)

(assert (=> b!750802 (= e!418835 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20012 a!3186) j!159) a!3186 mask!3328) lt!333744))))

(declare-fun b!750803 () Bool)

(declare-fun res!506881 () Bool)

(assert (=> b!750803 (=> (not res!506881) (not e!418843))))

(assert (=> b!750803 (= res!506881 (and (= (size!20433 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20433 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20433 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!750804 () Bool)

(declare-fun e!418840 () Bool)

(assert (=> b!750804 (= e!418836 e!418840)))

(declare-fun res!506879 () Bool)

(assert (=> b!750804 (=> res!506879 e!418840)))

(declare-fun lt!333741 () (_ BitVec 64))

(assert (=> b!750804 (= res!506879 (= lt!333741 lt!333739))))

(assert (=> b!750804 (= lt!333741 (select (store (arr!20012 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun res!506886 () Bool)

(assert (=> start!65606 (=> (not res!506886) (not e!418843))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65606 (= res!506886 (validMask!0 mask!3328))))

(assert (=> start!65606 e!418843))

(assert (=> start!65606 true))

(declare-fun array_inv!15895 (array!41796) Bool)

(assert (=> start!65606 (array_inv!15895 a!3186)))

(declare-fun b!750792 () Bool)

(declare-fun Unit!25799 () Unit!25796)

(assert (=> b!750792 (= e!418841 Unit!25799)))

(declare-fun b!750805 () Bool)

(declare-fun res!506873 () Bool)

(assert (=> b!750805 (=> (not res!506873) (not e!418843))))

(declare-fun arrayContainsKey!0 (array!41796 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!750805 (= res!506873 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!750806 () Bool)

(assert (=> b!750806 (= e!418840 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvslt resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(assert (=> b!750806 e!418839))

(declare-fun res!506887 () Bool)

(assert (=> b!750806 (=> (not res!506887) (not e!418839))))

(assert (=> b!750806 (= res!506887 (= lt!333741 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!333742 () Unit!25796)

(assert (=> b!750806 (= lt!333742 e!418841)))

(declare-fun c!82338 () Bool)

(assert (=> b!750806 (= c!82338 (= lt!333741 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!65606 res!506886) b!750803))

(assert (= (and b!750803 res!506881) b!750786))

(assert (= (and b!750786 res!506880) b!750789))

(assert (= (and b!750789 res!506882) b!750805))

(assert (= (and b!750805 res!506873) b!750791))

(assert (= (and b!750791 res!506885) b!750793))

(assert (= (and b!750793 res!506888) b!750785))

(assert (= (and b!750785 res!506883) b!750799))

(assert (= (and b!750799 res!506876) b!750788))

(assert (= (and b!750788 res!506884) b!750794))

(assert (= (and b!750794 res!506875) b!750797))

(assert (= (and b!750797 c!82337) b!750796))

(assert (= (and b!750797 (not c!82337)) b!750798))

(assert (= (and b!750797 res!506878) b!750800))

(assert (= (and b!750800 res!506889) b!750787))

(assert (= (and b!750787 res!506874) b!750802))

(assert (= (and b!750787 (not res!506877)) b!750795))

(assert (= (and b!750795 (not res!506872)) b!750804))

(assert (= (and b!750804 (not res!506879)) b!750806))

(assert (= (and b!750806 c!82338) b!750790))

(assert (= (and b!750806 (not c!82338)) b!750792))

(assert (= (and b!750806 res!506887) b!750801))

(declare-fun m!699545 () Bool)

(assert (=> b!750785 m!699545))

(declare-fun m!699547 () Bool)

(assert (=> b!750798 m!699547))

(assert (=> b!750798 m!699547))

(declare-fun m!699549 () Bool)

(assert (=> b!750798 m!699549))

(declare-fun m!699551 () Bool)

(assert (=> b!750794 m!699551))

(assert (=> b!750788 m!699547))

(assert (=> b!750788 m!699547))

(declare-fun m!699553 () Bool)

(assert (=> b!750788 m!699553))

(assert (=> b!750788 m!699553))

(assert (=> b!750788 m!699547))

(declare-fun m!699555 () Bool)

(assert (=> b!750788 m!699555))

(declare-fun m!699557 () Bool)

(assert (=> b!750791 m!699557))

(declare-fun m!699559 () Bool)

(assert (=> b!750793 m!699559))

(declare-fun m!699561 () Bool)

(assert (=> b!750800 m!699561))

(declare-fun m!699563 () Bool)

(assert (=> b!750800 m!699563))

(declare-fun m!699565 () Bool)

(assert (=> b!750800 m!699565))

(assert (=> b!750800 m!699561))

(declare-fun m!699567 () Bool)

(assert (=> b!750800 m!699567))

(declare-fun m!699569 () Bool)

(assert (=> b!750800 m!699569))

(declare-fun m!699571 () Bool)

(assert (=> b!750789 m!699571))

(declare-fun m!699573 () Bool)

(assert (=> b!750805 m!699573))

(assert (=> b!750795 m!699547))

(assert (=> b!750795 m!699547))

(assert (=> b!750795 m!699549))

(assert (=> b!750796 m!699547))

(assert (=> b!750796 m!699547))

(declare-fun m!699575 () Bool)

(assert (=> b!750796 m!699575))

(declare-fun m!699577 () Bool)

(assert (=> start!65606 m!699577))

(declare-fun m!699579 () Bool)

(assert (=> start!65606 m!699579))

(declare-fun m!699581 () Bool)

(assert (=> b!750801 m!699581))

(declare-fun m!699583 () Bool)

(assert (=> b!750801 m!699583))

(assert (=> b!750804 m!699565))

(declare-fun m!699585 () Bool)

(assert (=> b!750804 m!699585))

(assert (=> b!750787 m!699547))

(assert (=> b!750787 m!699547))

(declare-fun m!699587 () Bool)

(assert (=> b!750787 m!699587))

(declare-fun m!699589 () Bool)

(assert (=> b!750787 m!699589))

(declare-fun m!699591 () Bool)

(assert (=> b!750787 m!699591))

(assert (=> b!750802 m!699547))

(assert (=> b!750802 m!699547))

(declare-fun m!699593 () Bool)

(assert (=> b!750802 m!699593))

(assert (=> b!750786 m!699547))

(assert (=> b!750786 m!699547))

(declare-fun m!699595 () Bool)

(assert (=> b!750786 m!699595))

(check-sat (not b!750801) (not b!750796) (not b!750805) (not b!750791) (not b!750787) (not b!750802) (not b!750785) (not b!750788) (not b!750800) (not b!750786) (not b!750795) (not b!750798) (not b!750789) (not b!750793) (not start!65606))
(check-sat)

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65838 () Bool)

(assert start!65838)

(declare-fun b!754653 () Bool)

(declare-fun res!509656 () Bool)

(declare-fun e!420953 () Bool)

(assert (=> b!754653 (=> (not res!509656) (not e!420953))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41881 0))(
  ( (array!41882 (arr!20050 (Array (_ BitVec 32) (_ BitVec 64))) (size!20470 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41881)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!754653 (= res!509656 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20470 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20470 a!3186))))))

(declare-fun b!754654 () Bool)

(declare-fun res!509673 () Bool)

(declare-fun e!420958 () Bool)

(assert (=> b!754654 (=> (not res!509673) (not e!420958))))

(declare-fun e!420959 () Bool)

(assert (=> b!754654 (= res!509673 e!420959)))

(declare-fun c!82883 () Bool)

(assert (=> b!754654 (= c!82883 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!754655 () Bool)

(declare-fun e!420961 () Bool)

(declare-fun e!420962 () Bool)

(assert (=> b!754655 (= e!420961 e!420962)))

(declare-fun res!509666 () Bool)

(assert (=> b!754655 (=> res!509666 e!420962)))

(declare-datatypes ((SeekEntryResult!7606 0))(
  ( (MissingZero!7606 (index!32792 (_ BitVec 32))) (Found!7606 (index!32793 (_ BitVec 32))) (Intermediate!7606 (undefined!8418 Bool) (index!32794 (_ BitVec 32)) (x!63864 (_ BitVec 32))) (Undefined!7606) (MissingVacant!7606 (index!32795 (_ BitVec 32))) )
))
(declare-fun lt!335785 () SeekEntryResult!7606)

(declare-fun lt!335781 () SeekEntryResult!7606)

(assert (=> b!754655 (= res!509666 (not (= lt!335785 lt!335781)))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41881 (_ BitVec 32)) SeekEntryResult!7606)

(assert (=> b!754655 (= lt!335785 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20050 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!754656 () Bool)

(declare-fun res!509663 () Bool)

(declare-fun e!420956 () Bool)

(assert (=> b!754656 (=> (not res!509663) (not e!420956))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!754656 (= res!509663 (and (= (size!20470 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20470 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20470 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!754657 () Bool)

(assert (=> b!754657 (= e!420956 e!420953)))

(declare-fun res!509674 () Bool)

(assert (=> b!754657 (=> (not res!509674) (not e!420953))))

(declare-fun lt!335790 () SeekEntryResult!7606)

(assert (=> b!754657 (= res!509674 (or (= lt!335790 (MissingZero!7606 i!1173)) (= lt!335790 (MissingVacant!7606 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41881 (_ BitVec 32)) SeekEntryResult!7606)

(assert (=> b!754657 (= lt!335790 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!754658 () Bool)

(declare-fun e!420955 () Bool)

(assert (=> b!754658 (= e!420955 true)))

(declare-fun e!420952 () Bool)

(assert (=> b!754658 e!420952))

(declare-fun res!509672 () Bool)

(assert (=> b!754658 (=> (not res!509672) (not e!420952))))

(declare-fun lt!335780 () (_ BitVec 64))

(assert (=> b!754658 (= res!509672 (= lt!335780 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!25981 0))(
  ( (Unit!25982) )
))
(declare-fun lt!335782 () Unit!25981)

(declare-fun e!420963 () Unit!25981)

(assert (=> b!754658 (= lt!335782 e!420963)))

(declare-fun c!82882 () Bool)

(assert (=> b!754658 (= c!82882 (= lt!335780 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!754659 () Bool)

(declare-fun e!420957 () Bool)

(assert (=> b!754659 (= e!420958 e!420957)))

(declare-fun res!509658 () Bool)

(assert (=> b!754659 (=> (not res!509658) (not e!420957))))

(declare-fun lt!335786 () SeekEntryResult!7606)

(declare-fun lt!335783 () SeekEntryResult!7606)

(assert (=> b!754659 (= res!509658 (= lt!335786 lt!335783))))

(declare-fun lt!335784 () array!41881)

(declare-fun lt!335788 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41881 (_ BitVec 32)) SeekEntryResult!7606)

(assert (=> b!754659 (= lt!335783 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335788 lt!335784 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!754659 (= lt!335786 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335788 mask!3328) lt!335788 lt!335784 mask!3328))))

(assert (=> b!754659 (= lt!335788 (select (store (arr!20050 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!754659 (= lt!335784 (array!41882 (store (arr!20050 a!3186) i!1173 k0!2102) (size!20470 a!3186)))))

(declare-fun b!754660 () Bool)

(declare-fun res!509659 () Bool)

(assert (=> b!754660 (=> (not res!509659) (not e!420953))))

(declare-datatypes ((List!13959 0))(
  ( (Nil!13956) (Cons!13955 (h!15033 (_ BitVec 64)) (t!20266 List!13959)) )
))
(declare-fun arrayNoDuplicates!0 (array!41881 (_ BitVec 32) List!13959) Bool)

(assert (=> b!754660 (= res!509659 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13956))))

(declare-fun b!754661 () Bool)

(assert (=> b!754661 (= e!420953 e!420958)))

(declare-fun res!509657 () Bool)

(assert (=> b!754661 (=> (not res!509657) (not e!420958))))

(declare-fun lt!335787 () SeekEntryResult!7606)

(assert (=> b!754661 (= res!509657 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20050 a!3186) j!159) mask!3328) (select (arr!20050 a!3186) j!159) a!3186 mask!3328) lt!335787))))

(assert (=> b!754661 (= lt!335787 (Intermediate!7606 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!754662 () Bool)

(declare-fun res!509667 () Bool)

(assert (=> b!754662 (=> (not res!509667) (not e!420956))))

(declare-fun arrayContainsKey!0 (array!41881 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!754662 (= res!509667 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!754663 () Bool)

(assert (=> b!754663 (= e!420959 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20050 a!3186) j!159) a!3186 mask!3328) lt!335787))))

(declare-fun res!509661 () Bool)

(assert (=> start!65838 (=> (not res!509661) (not e!420956))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65838 (= res!509661 (validMask!0 mask!3328))))

(assert (=> start!65838 e!420956))

(assert (=> start!65838 true))

(declare-fun array_inv!15909 (array!41881) Bool)

(assert (=> start!65838 (array_inv!15909 a!3186)))

(declare-fun b!754664 () Bool)

(declare-fun e!420960 () Bool)

(assert (=> b!754664 (= e!420960 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20050 a!3186) j!159) a!3186 mask!3328) lt!335781))))

(declare-fun b!754665 () Bool)

(declare-fun Unit!25983 () Unit!25981)

(assert (=> b!754665 (= e!420963 Unit!25983)))

(assert (=> b!754665 false))

(declare-fun b!754666 () Bool)

(declare-fun res!509670 () Bool)

(assert (=> b!754666 (=> (not res!509670) (not e!420958))))

(assert (=> b!754666 (= res!509670 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20050 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!754667 () Bool)

(declare-fun res!509664 () Bool)

(assert (=> b!754667 (=> (not res!509664) (not e!420952))))

(assert (=> b!754667 (= res!509664 (= (seekEntryOrOpen!0 lt!335788 lt!335784 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335788 lt!335784 mask!3328)))))

(declare-fun b!754668 () Bool)

(assert (=> b!754668 (= e!420959 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20050 a!3186) j!159) a!3186 mask!3328) (Found!7606 j!159)))))

(declare-fun b!754669 () Bool)

(declare-fun res!509668 () Bool)

(assert (=> b!754669 (=> (not res!509668) (not e!420953))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41881 (_ BitVec 32)) Bool)

(assert (=> b!754669 (= res!509668 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!754670 () Bool)

(declare-fun res!509669 () Bool)

(assert (=> b!754670 (=> (not res!509669) (not e!420956))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!754670 (= res!509669 (validKeyInArray!0 k0!2102))))

(declare-fun b!754671 () Bool)

(declare-fun res!509665 () Bool)

(assert (=> b!754671 (=> (not res!509665) (not e!420956))))

(assert (=> b!754671 (= res!509665 (validKeyInArray!0 (select (arr!20050 a!3186) j!159)))))

(declare-fun b!754672 () Bool)

(assert (=> b!754672 (= e!420962 e!420955)))

(declare-fun res!509662 () Bool)

(assert (=> b!754672 (=> res!509662 e!420955)))

(assert (=> b!754672 (= res!509662 (= lt!335780 lt!335788))))

(assert (=> b!754672 (= lt!335780 (select (store (arr!20050 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!754673 () Bool)

(assert (=> b!754673 (= e!420957 (not e!420961))))

(declare-fun res!509660 () Bool)

(assert (=> b!754673 (=> res!509660 e!420961)))

(get-info :version)

(assert (=> b!754673 (= res!509660 (or (not ((_ is Intermediate!7606) lt!335783)) (bvslt x!1131 (x!63864 lt!335783)) (not (= x!1131 (x!63864 lt!335783))) (not (= index!1321 (index!32794 lt!335783)))))))

(assert (=> b!754673 e!420960))

(declare-fun res!509671 () Bool)

(assert (=> b!754673 (=> (not res!509671) (not e!420960))))

(declare-fun lt!335779 () SeekEntryResult!7606)

(assert (=> b!754673 (= res!509671 (= lt!335779 lt!335781))))

(assert (=> b!754673 (= lt!335781 (Found!7606 j!159))))

(assert (=> b!754673 (= lt!335779 (seekEntryOrOpen!0 (select (arr!20050 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!754673 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!335789 () Unit!25981)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41881 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25981)

(assert (=> b!754673 (= lt!335789 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!754674 () Bool)

(assert (=> b!754674 (= e!420952 (= lt!335779 lt!335785))))

(declare-fun b!754675 () Bool)

(declare-fun Unit!25984 () Unit!25981)

(assert (=> b!754675 (= e!420963 Unit!25984)))

(assert (= (and start!65838 res!509661) b!754656))

(assert (= (and b!754656 res!509663) b!754671))

(assert (= (and b!754671 res!509665) b!754670))

(assert (= (and b!754670 res!509669) b!754662))

(assert (= (and b!754662 res!509667) b!754657))

(assert (= (and b!754657 res!509674) b!754669))

(assert (= (and b!754669 res!509668) b!754660))

(assert (= (and b!754660 res!509659) b!754653))

(assert (= (and b!754653 res!509656) b!754661))

(assert (= (and b!754661 res!509657) b!754666))

(assert (= (and b!754666 res!509670) b!754654))

(assert (= (and b!754654 c!82883) b!754663))

(assert (= (and b!754654 (not c!82883)) b!754668))

(assert (= (and b!754654 res!509673) b!754659))

(assert (= (and b!754659 res!509658) b!754673))

(assert (= (and b!754673 res!509671) b!754664))

(assert (= (and b!754673 (not res!509660)) b!754655))

(assert (= (and b!754655 (not res!509666)) b!754672))

(assert (= (and b!754672 (not res!509662)) b!754658))

(assert (= (and b!754658 c!82882) b!754665))

(assert (= (and b!754658 (not c!82882)) b!754675))

(assert (= (and b!754658 res!509672) b!754667))

(assert (= (and b!754667 res!509664) b!754674))

(declare-fun m!703647 () Bool)

(assert (=> b!754667 m!703647))

(declare-fun m!703649 () Bool)

(assert (=> b!754667 m!703649))

(declare-fun m!703651 () Bool)

(assert (=> b!754671 m!703651))

(assert (=> b!754671 m!703651))

(declare-fun m!703653 () Bool)

(assert (=> b!754671 m!703653))

(declare-fun m!703655 () Bool)

(assert (=> start!65838 m!703655))

(declare-fun m!703657 () Bool)

(assert (=> start!65838 m!703657))

(assert (=> b!754668 m!703651))

(assert (=> b!754668 m!703651))

(declare-fun m!703659 () Bool)

(assert (=> b!754668 m!703659))

(assert (=> b!754664 m!703651))

(assert (=> b!754664 m!703651))

(declare-fun m!703661 () Bool)

(assert (=> b!754664 m!703661))

(assert (=> b!754673 m!703651))

(assert (=> b!754673 m!703651))

(declare-fun m!703663 () Bool)

(assert (=> b!754673 m!703663))

(declare-fun m!703665 () Bool)

(assert (=> b!754673 m!703665))

(declare-fun m!703667 () Bool)

(assert (=> b!754673 m!703667))

(declare-fun m!703669 () Bool)

(assert (=> b!754662 m!703669))

(declare-fun m!703671 () Bool)

(assert (=> b!754659 m!703671))

(declare-fun m!703673 () Bool)

(assert (=> b!754659 m!703673))

(assert (=> b!754659 m!703671))

(declare-fun m!703675 () Bool)

(assert (=> b!754659 m!703675))

(declare-fun m!703677 () Bool)

(assert (=> b!754659 m!703677))

(declare-fun m!703679 () Bool)

(assert (=> b!754659 m!703679))

(assert (=> b!754672 m!703677))

(declare-fun m!703681 () Bool)

(assert (=> b!754672 m!703681))

(declare-fun m!703683 () Bool)

(assert (=> b!754660 m!703683))

(declare-fun m!703685 () Bool)

(assert (=> b!754657 m!703685))

(assert (=> b!754663 m!703651))

(assert (=> b!754663 m!703651))

(declare-fun m!703687 () Bool)

(assert (=> b!754663 m!703687))

(declare-fun m!703689 () Bool)

(assert (=> b!754666 m!703689))

(assert (=> b!754661 m!703651))

(assert (=> b!754661 m!703651))

(declare-fun m!703691 () Bool)

(assert (=> b!754661 m!703691))

(assert (=> b!754661 m!703691))

(assert (=> b!754661 m!703651))

(declare-fun m!703693 () Bool)

(assert (=> b!754661 m!703693))

(declare-fun m!703695 () Bool)

(assert (=> b!754669 m!703695))

(assert (=> b!754655 m!703651))

(assert (=> b!754655 m!703651))

(assert (=> b!754655 m!703659))

(declare-fun m!703697 () Bool)

(assert (=> b!754670 m!703697))

(check-sat (not b!754673) (not b!754660) (not b!754664) (not b!754663) (not b!754668) (not b!754669) (not b!754659) (not b!754655) (not b!754667) (not b!754657) (not b!754661) (not b!754670) (not b!754662) (not b!754671) (not start!65838))
(check-sat)

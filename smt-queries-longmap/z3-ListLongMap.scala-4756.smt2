; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65724 () Bool)

(assert start!65724)

(declare-fun b!750790 () Bool)

(declare-fun res!506487 () Bool)

(declare-fun e!418975 () Bool)

(assert (=> b!750790 (=> (not res!506487) (not e!418975))))

(declare-datatypes ((array!41767 0))(
  ( (array!41768 (arr!19993 (Array (_ BitVec 32) (_ BitVec 64))) (size!20413 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41767)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41767 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!750790 (= res!506487 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!750791 () Bool)

(declare-fun e!418978 () Bool)

(declare-fun e!418974 () Bool)

(assert (=> b!750791 (= e!418978 (not e!418974))))

(declare-fun res!506484 () Bool)

(assert (=> b!750791 (=> res!506484 e!418974)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7549 0))(
  ( (MissingZero!7549 (index!32564 (_ BitVec 32))) (Found!7549 (index!32565 (_ BitVec 32))) (Intermediate!7549 (undefined!8361 Bool) (index!32566 (_ BitVec 32)) (x!63655 (_ BitVec 32))) (Undefined!7549) (MissingVacant!7549 (index!32567 (_ BitVec 32))) )
))
(declare-fun lt!333807 () SeekEntryResult!7549)

(get-info :version)

(assert (=> b!750791 (= res!506484 (or (not ((_ is Intermediate!7549) lt!333807)) (bvslt x!1131 (x!63655 lt!333807)) (not (= x!1131 (x!63655 lt!333807))) (not (= index!1321 (index!32566 lt!333807)))))))

(declare-fun e!418980 () Bool)

(assert (=> b!750791 e!418980))

(declare-fun res!506486 () Bool)

(assert (=> b!750791 (=> (not res!506486) (not e!418980))))

(declare-fun lt!333800 () SeekEntryResult!7549)

(declare-fun lt!333806 () SeekEntryResult!7549)

(assert (=> b!750791 (= res!506486 (= lt!333800 lt!333806))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!750791 (= lt!333806 (Found!7549 j!159))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41767 (_ BitVec 32)) SeekEntryResult!7549)

(assert (=> b!750791 (= lt!333800 (seekEntryOrOpen!0 (select (arr!19993 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41767 (_ BitVec 32)) Bool)

(assert (=> b!750791 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25753 0))(
  ( (Unit!25754) )
))
(declare-fun lt!333798 () Unit!25753)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41767 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25753)

(assert (=> b!750791 (= lt!333798 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!750792 () Bool)

(declare-fun e!418973 () Bool)

(declare-fun e!418972 () Bool)

(assert (=> b!750792 (= e!418973 e!418972)))

(declare-fun res!506491 () Bool)

(assert (=> b!750792 (=> (not res!506491) (not e!418972))))

(declare-fun lt!333805 () SeekEntryResult!7549)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41767 (_ BitVec 32)) SeekEntryResult!7549)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!750792 (= res!506491 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19993 a!3186) j!159) mask!3328) (select (arr!19993 a!3186) j!159) a!3186 mask!3328) lt!333805))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!750792 (= lt!333805 (Intermediate!7549 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!750793 () Bool)

(assert (=> b!750793 (= e!418975 e!418973)))

(declare-fun res!506492 () Bool)

(assert (=> b!750793 (=> (not res!506492) (not e!418973))))

(declare-fun lt!333797 () SeekEntryResult!7549)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!750793 (= res!506492 (or (= lt!333797 (MissingZero!7549 i!1173)) (= lt!333797 (MissingVacant!7549 i!1173))))))

(assert (=> b!750793 (= lt!333797 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!506489 () Bool)

(assert (=> start!65724 (=> (not res!506489) (not e!418975))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65724 (= res!506489 (validMask!0 mask!3328))))

(assert (=> start!65724 e!418975))

(assert (=> start!65724 true))

(declare-fun array_inv!15852 (array!41767) Bool)

(assert (=> start!65724 (array_inv!15852 a!3186)))

(declare-fun b!750794 () Bool)

(declare-fun res!506490 () Bool)

(assert (=> b!750794 (=> (not res!506490) (not e!418972))))

(declare-fun e!418970 () Bool)

(assert (=> b!750794 (= res!506490 e!418970)))

(declare-fun c!82541 () Bool)

(assert (=> b!750794 (= c!82541 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!750795 () Bool)

(declare-fun e!418971 () Unit!25753)

(declare-fun Unit!25755 () Unit!25753)

(assert (=> b!750795 (= e!418971 Unit!25755)))

(assert (=> b!750795 false))

(declare-fun b!750796 () Bool)

(declare-fun Unit!25756 () Unit!25753)

(assert (=> b!750796 (= e!418971 Unit!25756)))

(declare-fun b!750797 () Bool)

(declare-fun e!418977 () Bool)

(assert (=> b!750797 (= e!418974 e!418977)))

(declare-fun res!506478 () Bool)

(assert (=> b!750797 (=> res!506478 e!418977)))

(declare-fun lt!333801 () (_ BitVec 64))

(declare-fun lt!333799 () (_ BitVec 64))

(assert (=> b!750797 (= res!506478 (= lt!333801 lt!333799))))

(assert (=> b!750797 (= lt!333801 (select (store (arr!19993 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!750798 () Bool)

(declare-fun res!506479 () Bool)

(assert (=> b!750798 (=> (not res!506479) (not e!418975))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!750798 (= res!506479 (validKeyInArray!0 k0!2102))))

(declare-fun b!750799 () Bool)

(declare-fun res!506488 () Bool)

(assert (=> b!750799 (=> (not res!506488) (not e!418973))))

(assert (=> b!750799 (= res!506488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!750800 () Bool)

(assert (=> b!750800 (= e!418977 true)))

(declare-fun e!418976 () Bool)

(assert (=> b!750800 e!418976))

(declare-fun res!506480 () Bool)

(assert (=> b!750800 (=> (not res!506480) (not e!418976))))

(assert (=> b!750800 (= res!506480 (= lt!333801 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!333803 () Unit!25753)

(assert (=> b!750800 (= lt!333803 e!418971)))

(declare-fun c!82540 () Bool)

(assert (=> b!750800 (= c!82540 (= lt!333801 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!750801 () Bool)

(declare-fun res!506483 () Bool)

(assert (=> b!750801 (=> (not res!506483) (not e!418973))))

(assert (=> b!750801 (= res!506483 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20413 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20413 a!3186))))))

(declare-fun b!750802 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41767 (_ BitVec 32)) SeekEntryResult!7549)

(assert (=> b!750802 (= e!418980 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19993 a!3186) j!159) a!3186 mask!3328) lt!333806))))

(declare-fun b!750803 () Bool)

(assert (=> b!750803 (= e!418970 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19993 a!3186) j!159) a!3186 mask!3328) lt!333805))))

(declare-fun lt!333802 () array!41767)

(declare-fun b!750804 () Bool)

(assert (=> b!750804 (= e!418976 (= (seekEntryOrOpen!0 lt!333799 lt!333802 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!333799 lt!333802 mask!3328)))))

(declare-fun b!750805 () Bool)

(declare-fun res!506482 () Bool)

(assert (=> b!750805 (=> (not res!506482) (not e!418975))))

(assert (=> b!750805 (= res!506482 (and (= (size!20413 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20413 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20413 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!750806 () Bool)

(declare-fun res!506493 () Bool)

(assert (=> b!750806 (=> res!506493 e!418974)))

(assert (=> b!750806 (= res!506493 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19993 a!3186) j!159) a!3186 mask!3328) lt!333806)))))

(declare-fun b!750807 () Bool)

(declare-fun res!506481 () Bool)

(assert (=> b!750807 (=> (not res!506481) (not e!418972))))

(assert (=> b!750807 (= res!506481 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19993 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!750808 () Bool)

(assert (=> b!750808 (= e!418970 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19993 a!3186) j!159) a!3186 mask!3328) (Found!7549 j!159)))))

(declare-fun b!750809 () Bool)

(declare-fun res!506477 () Bool)

(assert (=> b!750809 (=> (not res!506477) (not e!418973))))

(declare-datatypes ((List!13902 0))(
  ( (Nil!13899) (Cons!13898 (h!14976 (_ BitVec 64)) (t!20209 List!13902)) )
))
(declare-fun arrayNoDuplicates!0 (array!41767 (_ BitVec 32) List!13902) Bool)

(assert (=> b!750809 (= res!506477 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13899))))

(declare-fun b!750810 () Bool)

(declare-fun res!506485 () Bool)

(assert (=> b!750810 (=> (not res!506485) (not e!418975))))

(assert (=> b!750810 (= res!506485 (validKeyInArray!0 (select (arr!19993 a!3186) j!159)))))

(declare-fun b!750811 () Bool)

(assert (=> b!750811 (= e!418972 e!418978)))

(declare-fun res!506494 () Bool)

(assert (=> b!750811 (=> (not res!506494) (not e!418978))))

(declare-fun lt!333804 () SeekEntryResult!7549)

(assert (=> b!750811 (= res!506494 (= lt!333804 lt!333807))))

(assert (=> b!750811 (= lt!333807 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333799 lt!333802 mask!3328))))

(assert (=> b!750811 (= lt!333804 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333799 mask!3328) lt!333799 lt!333802 mask!3328))))

(assert (=> b!750811 (= lt!333799 (select (store (arr!19993 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!750811 (= lt!333802 (array!41768 (store (arr!19993 a!3186) i!1173 k0!2102) (size!20413 a!3186)))))

(assert (= (and start!65724 res!506489) b!750805))

(assert (= (and b!750805 res!506482) b!750810))

(assert (= (and b!750810 res!506485) b!750798))

(assert (= (and b!750798 res!506479) b!750790))

(assert (= (and b!750790 res!506487) b!750793))

(assert (= (and b!750793 res!506492) b!750799))

(assert (= (and b!750799 res!506488) b!750809))

(assert (= (and b!750809 res!506477) b!750801))

(assert (= (and b!750801 res!506483) b!750792))

(assert (= (and b!750792 res!506491) b!750807))

(assert (= (and b!750807 res!506481) b!750794))

(assert (= (and b!750794 c!82541) b!750803))

(assert (= (and b!750794 (not c!82541)) b!750808))

(assert (= (and b!750794 res!506490) b!750811))

(assert (= (and b!750811 res!506494) b!750791))

(assert (= (and b!750791 res!506486) b!750802))

(assert (= (and b!750791 (not res!506484)) b!750806))

(assert (= (and b!750806 (not res!506493)) b!750797))

(assert (= (and b!750797 (not res!506478)) b!750800))

(assert (= (and b!750800 c!82540) b!750795))

(assert (= (and b!750800 (not c!82540)) b!750796))

(assert (= (and b!750800 res!506480) b!750804))

(declare-fun m!700683 () Bool)

(assert (=> b!750808 m!700683))

(assert (=> b!750808 m!700683))

(declare-fun m!700685 () Bool)

(assert (=> b!750808 m!700685))

(declare-fun m!700687 () Bool)

(assert (=> b!750793 m!700687))

(declare-fun m!700689 () Bool)

(assert (=> b!750790 m!700689))

(assert (=> b!750810 m!700683))

(assert (=> b!750810 m!700683))

(declare-fun m!700691 () Bool)

(assert (=> b!750810 m!700691))

(declare-fun m!700693 () Bool)

(assert (=> b!750807 m!700693))

(declare-fun m!700695 () Bool)

(assert (=> b!750799 m!700695))

(assert (=> b!750802 m!700683))

(assert (=> b!750802 m!700683))

(declare-fun m!700697 () Bool)

(assert (=> b!750802 m!700697))

(declare-fun m!700699 () Bool)

(assert (=> b!750804 m!700699))

(declare-fun m!700701 () Bool)

(assert (=> b!750804 m!700701))

(declare-fun m!700703 () Bool)

(assert (=> b!750809 m!700703))

(declare-fun m!700705 () Bool)

(assert (=> b!750798 m!700705))

(assert (=> b!750806 m!700683))

(assert (=> b!750806 m!700683))

(assert (=> b!750806 m!700685))

(declare-fun m!700707 () Bool)

(assert (=> start!65724 m!700707))

(declare-fun m!700709 () Bool)

(assert (=> start!65724 m!700709))

(declare-fun m!700711 () Bool)

(assert (=> b!750811 m!700711))

(declare-fun m!700713 () Bool)

(assert (=> b!750811 m!700713))

(assert (=> b!750811 m!700711))

(declare-fun m!700715 () Bool)

(assert (=> b!750811 m!700715))

(declare-fun m!700717 () Bool)

(assert (=> b!750811 m!700717))

(declare-fun m!700719 () Bool)

(assert (=> b!750811 m!700719))

(assert (=> b!750791 m!700683))

(assert (=> b!750791 m!700683))

(declare-fun m!700721 () Bool)

(assert (=> b!750791 m!700721))

(declare-fun m!700723 () Bool)

(assert (=> b!750791 m!700723))

(declare-fun m!700725 () Bool)

(assert (=> b!750791 m!700725))

(assert (=> b!750792 m!700683))

(assert (=> b!750792 m!700683))

(declare-fun m!700727 () Bool)

(assert (=> b!750792 m!700727))

(assert (=> b!750792 m!700727))

(assert (=> b!750792 m!700683))

(declare-fun m!700729 () Bool)

(assert (=> b!750792 m!700729))

(assert (=> b!750803 m!700683))

(assert (=> b!750803 m!700683))

(declare-fun m!700731 () Bool)

(assert (=> b!750803 m!700731))

(assert (=> b!750797 m!700717))

(declare-fun m!700733 () Bool)

(assert (=> b!750797 m!700733))

(check-sat (not start!65724) (not b!750810) (not b!750811) (not b!750792) (not b!750806) (not b!750790) (not b!750802) (not b!750808) (not b!750804) (not b!750798) (not b!750793) (not b!750803) (not b!750809) (not b!750799) (not b!750791))
(check-sat)

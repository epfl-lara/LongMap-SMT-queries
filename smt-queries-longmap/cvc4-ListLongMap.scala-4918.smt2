; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67756 () Bool)

(assert start!67756)

(declare-fun b!786794 () Bool)

(declare-fun res!532792 () Bool)

(declare-fun e!437363 () Bool)

(assert (=> b!786794 (=> (not res!532792) (not e!437363))))

(declare-fun e!437364 () Bool)

(assert (=> b!786794 (= res!532792 e!437364)))

(declare-fun c!87414 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!786794 (= c!87414 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!786795 () Bool)

(declare-fun res!532791 () Bool)

(declare-fun e!437369 () Bool)

(assert (=> b!786795 (=> (not res!532791) (not e!437369))))

(declare-fun lt!350923 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((array!42796 0))(
  ( (array!42797 (arr!20486 (Array (_ BitVec 32) (_ BitVec 64))) (size!20907 (_ BitVec 32))) )
))
(declare-fun lt!350920 () array!42796)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8086 0))(
  ( (MissingZero!8086 (index!34712 (_ BitVec 32))) (Found!8086 (index!34713 (_ BitVec 32))) (Intermediate!8086 (undefined!8898 Bool) (index!34714 (_ BitVec 32)) (x!65650 (_ BitVec 32))) (Undefined!8086) (MissingVacant!8086 (index!34715 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42796 (_ BitVec 32)) SeekEntryResult!8086)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42796 (_ BitVec 32)) SeekEntryResult!8086)

(assert (=> b!786795 (= res!532791 (= (seekEntryOrOpen!0 lt!350923 lt!350920 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350923 lt!350920 mask!3328)))))

(declare-fun b!786796 () Bool)

(declare-fun e!437366 () Bool)

(assert (=> b!786796 (= e!437363 e!437366)))

(declare-fun res!532796 () Bool)

(assert (=> b!786796 (=> (not res!532796) (not e!437366))))

(declare-fun lt!350913 () SeekEntryResult!8086)

(declare-fun lt!350921 () SeekEntryResult!8086)

(assert (=> b!786796 (= res!532796 (= lt!350913 lt!350921))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42796 (_ BitVec 32)) SeekEntryResult!8086)

(assert (=> b!786796 (= lt!350921 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350923 lt!350920 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!786796 (= lt!350913 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350923 mask!3328) lt!350923 lt!350920 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun a!3186 () array!42796)

(assert (=> b!786796 (= lt!350923 (select (store (arr!20486 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!786796 (= lt!350920 (array!42797 (store (arr!20486 a!3186) i!1173 k!2102) (size!20907 a!3186)))))

(declare-fun b!786797 () Bool)

(declare-fun res!532788 () Bool)

(assert (=> b!786797 (=> (not res!532788) (not e!437363))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!786797 (= res!532788 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20486 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!786798 () Bool)

(declare-fun res!532785 () Bool)

(declare-fun e!437370 () Bool)

(assert (=> b!786798 (=> (not res!532785) (not e!437370))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!786798 (= res!532785 (validKeyInArray!0 k!2102))))

(declare-fun b!786799 () Bool)

(declare-fun e!437368 () Bool)

(declare-fun e!437367 () Bool)

(assert (=> b!786799 (= e!437368 e!437367)))

(declare-fun res!532783 () Bool)

(assert (=> b!786799 (=> res!532783 e!437367)))

(declare-fun lt!350915 () SeekEntryResult!8086)

(declare-fun lt!350918 () SeekEntryResult!8086)

(assert (=> b!786799 (= res!532783 (not (= lt!350915 lt!350918)))))

(assert (=> b!786799 (= lt!350915 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20486 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!786800 () Bool)

(declare-fun res!532786 () Bool)

(assert (=> b!786800 (=> (not res!532786) (not e!437370))))

(assert (=> b!786800 (= res!532786 (and (= (size!20907 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20907 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20907 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!786801 () Bool)

(declare-fun e!437361 () Bool)

(assert (=> b!786801 (= e!437361 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20486 a!3186) j!159) a!3186 mask!3328) lt!350918))))

(declare-fun b!786802 () Bool)

(declare-datatypes ((Unit!27232 0))(
  ( (Unit!27233) )
))
(declare-fun e!437365 () Unit!27232)

(declare-fun Unit!27234 () Unit!27232)

(assert (=> b!786802 (= e!437365 Unit!27234)))

(assert (=> b!786802 false))

(declare-fun res!532784 () Bool)

(assert (=> start!67756 (=> (not res!532784) (not e!437370))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67756 (= res!532784 (validMask!0 mask!3328))))

(assert (=> start!67756 e!437370))

(assert (=> start!67756 true))

(declare-fun array_inv!16282 (array!42796) Bool)

(assert (=> start!67756 (array_inv!16282 a!3186)))

(declare-fun b!786803 () Bool)

(declare-fun Unit!27235 () Unit!27232)

(assert (=> b!786803 (= e!437365 Unit!27235)))

(declare-fun b!786804 () Bool)

(declare-fun e!437362 () Bool)

(assert (=> b!786804 (= e!437367 e!437362)))

(declare-fun res!532789 () Bool)

(assert (=> b!786804 (=> res!532789 e!437362)))

(declare-fun lt!350917 () (_ BitVec 64))

(assert (=> b!786804 (= res!532789 (= lt!350917 lt!350923))))

(assert (=> b!786804 (= lt!350917 (select (store (arr!20486 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!786805 () Bool)

(assert (=> b!786805 (= e!437366 (not e!437368))))

(declare-fun res!532797 () Bool)

(assert (=> b!786805 (=> res!532797 e!437368)))

(assert (=> b!786805 (= res!532797 (or (not (is-Intermediate!8086 lt!350921)) (bvslt x!1131 (x!65650 lt!350921)) (not (= x!1131 (x!65650 lt!350921))) (not (= index!1321 (index!34714 lt!350921)))))))

(assert (=> b!786805 e!437361))

(declare-fun res!532799 () Bool)

(assert (=> b!786805 (=> (not res!532799) (not e!437361))))

(declare-fun lt!350922 () SeekEntryResult!8086)

(assert (=> b!786805 (= res!532799 (= lt!350922 lt!350918))))

(assert (=> b!786805 (= lt!350918 (Found!8086 j!159))))

(assert (=> b!786805 (= lt!350922 (seekEntryOrOpen!0 (select (arr!20486 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42796 (_ BitVec 32)) Bool)

(assert (=> b!786805 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!350924 () Unit!27232)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42796 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27232)

(assert (=> b!786805 (= lt!350924 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!786806 () Bool)

(assert (=> b!786806 (= e!437364 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20486 a!3186) j!159) a!3186 mask!3328) (Found!8086 j!159)))))

(declare-fun lt!350916 () SeekEntryResult!8086)

(declare-fun b!786807 () Bool)

(assert (=> b!786807 (= e!437364 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20486 a!3186) j!159) a!3186 mask!3328) lt!350916))))

(declare-fun b!786808 () Bool)

(declare-fun e!437372 () Bool)

(assert (=> b!786808 (= e!437372 e!437363)))

(declare-fun res!532795 () Bool)

(assert (=> b!786808 (=> (not res!532795) (not e!437363))))

(assert (=> b!786808 (= res!532795 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20486 a!3186) j!159) mask!3328) (select (arr!20486 a!3186) j!159) a!3186 mask!3328) lt!350916))))

(assert (=> b!786808 (= lt!350916 (Intermediate!8086 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!786809 () Bool)

(assert (=> b!786809 (= e!437370 e!437372)))

(declare-fun res!532790 () Bool)

(assert (=> b!786809 (=> (not res!532790) (not e!437372))))

(declare-fun lt!350919 () SeekEntryResult!8086)

(assert (=> b!786809 (= res!532790 (or (= lt!350919 (MissingZero!8086 i!1173)) (= lt!350919 (MissingVacant!8086 i!1173))))))

(assert (=> b!786809 (= lt!350919 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!786810 () Bool)

(assert (=> b!786810 (= e!437369 (= lt!350922 lt!350915))))

(declare-fun b!786811 () Bool)

(declare-fun res!532793 () Bool)

(assert (=> b!786811 (=> (not res!532793) (not e!437370))))

(declare-fun arrayContainsKey!0 (array!42796 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!786811 (= res!532793 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!786812 () Bool)

(declare-fun res!532782 () Bool)

(assert (=> b!786812 (=> (not res!532782) (not e!437372))))

(assert (=> b!786812 (= res!532782 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20907 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20907 a!3186))))))

(declare-fun b!786813 () Bool)

(declare-fun res!532787 () Bool)

(assert (=> b!786813 (=> (not res!532787) (not e!437372))))

(declare-datatypes ((List!14488 0))(
  ( (Nil!14485) (Cons!14484 (h!15607 (_ BitVec 64)) (t!20803 List!14488)) )
))
(declare-fun arrayNoDuplicates!0 (array!42796 (_ BitVec 32) List!14488) Bool)

(assert (=> b!786813 (= res!532787 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14485))))

(declare-fun b!786814 () Bool)

(assert (=> b!786814 (= e!437362 true)))

(assert (=> b!786814 e!437369))

(declare-fun res!532798 () Bool)

(assert (=> b!786814 (=> (not res!532798) (not e!437369))))

(assert (=> b!786814 (= res!532798 (= lt!350917 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!350914 () Unit!27232)

(assert (=> b!786814 (= lt!350914 e!437365)))

(declare-fun c!87415 () Bool)

(assert (=> b!786814 (= c!87415 (= lt!350917 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!786815 () Bool)

(declare-fun res!532781 () Bool)

(assert (=> b!786815 (=> (not res!532781) (not e!437372))))

(assert (=> b!786815 (= res!532781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!786816 () Bool)

(declare-fun res!532794 () Bool)

(assert (=> b!786816 (=> (not res!532794) (not e!437370))))

(assert (=> b!786816 (= res!532794 (validKeyInArray!0 (select (arr!20486 a!3186) j!159)))))

(assert (= (and start!67756 res!532784) b!786800))

(assert (= (and b!786800 res!532786) b!786816))

(assert (= (and b!786816 res!532794) b!786798))

(assert (= (and b!786798 res!532785) b!786811))

(assert (= (and b!786811 res!532793) b!786809))

(assert (= (and b!786809 res!532790) b!786815))

(assert (= (and b!786815 res!532781) b!786813))

(assert (= (and b!786813 res!532787) b!786812))

(assert (= (and b!786812 res!532782) b!786808))

(assert (= (and b!786808 res!532795) b!786797))

(assert (= (and b!786797 res!532788) b!786794))

(assert (= (and b!786794 c!87414) b!786807))

(assert (= (and b!786794 (not c!87414)) b!786806))

(assert (= (and b!786794 res!532792) b!786796))

(assert (= (and b!786796 res!532796) b!786805))

(assert (= (and b!786805 res!532799) b!786801))

(assert (= (and b!786805 (not res!532797)) b!786799))

(assert (= (and b!786799 (not res!532783)) b!786804))

(assert (= (and b!786804 (not res!532789)) b!786814))

(assert (= (and b!786814 c!87415) b!786802))

(assert (= (and b!786814 (not c!87415)) b!786803))

(assert (= (and b!786814 res!532798) b!786795))

(assert (= (and b!786795 res!532791) b!786810))

(declare-fun m!728533 () Bool)

(assert (=> b!786798 m!728533))

(declare-fun m!728535 () Bool)

(assert (=> b!786809 m!728535))

(declare-fun m!728537 () Bool)

(assert (=> b!786806 m!728537))

(assert (=> b!786806 m!728537))

(declare-fun m!728539 () Bool)

(assert (=> b!786806 m!728539))

(declare-fun m!728541 () Bool)

(assert (=> b!786815 m!728541))

(declare-fun m!728543 () Bool)

(assert (=> b!786804 m!728543))

(declare-fun m!728545 () Bool)

(assert (=> b!786804 m!728545))

(assert (=> b!786807 m!728537))

(assert (=> b!786807 m!728537))

(declare-fun m!728547 () Bool)

(assert (=> b!786807 m!728547))

(declare-fun m!728549 () Bool)

(assert (=> b!786813 m!728549))

(declare-fun m!728551 () Bool)

(assert (=> b!786795 m!728551))

(declare-fun m!728553 () Bool)

(assert (=> b!786795 m!728553))

(declare-fun m!728555 () Bool)

(assert (=> b!786797 m!728555))

(assert (=> b!786801 m!728537))

(assert (=> b!786801 m!728537))

(declare-fun m!728557 () Bool)

(assert (=> b!786801 m!728557))

(declare-fun m!728559 () Bool)

(assert (=> b!786811 m!728559))

(declare-fun m!728561 () Bool)

(assert (=> b!786796 m!728561))

(declare-fun m!728563 () Bool)

(assert (=> b!786796 m!728563))

(assert (=> b!786796 m!728543))

(declare-fun m!728565 () Bool)

(assert (=> b!786796 m!728565))

(assert (=> b!786796 m!728563))

(declare-fun m!728567 () Bool)

(assert (=> b!786796 m!728567))

(assert (=> b!786799 m!728537))

(assert (=> b!786799 m!728537))

(assert (=> b!786799 m!728539))

(assert (=> b!786808 m!728537))

(assert (=> b!786808 m!728537))

(declare-fun m!728569 () Bool)

(assert (=> b!786808 m!728569))

(assert (=> b!786808 m!728569))

(assert (=> b!786808 m!728537))

(declare-fun m!728571 () Bool)

(assert (=> b!786808 m!728571))

(declare-fun m!728573 () Bool)

(assert (=> start!67756 m!728573))

(declare-fun m!728575 () Bool)

(assert (=> start!67756 m!728575))

(assert (=> b!786816 m!728537))

(assert (=> b!786816 m!728537))

(declare-fun m!728577 () Bool)

(assert (=> b!786816 m!728577))

(assert (=> b!786805 m!728537))

(assert (=> b!786805 m!728537))

(declare-fun m!728579 () Bool)

(assert (=> b!786805 m!728579))

(declare-fun m!728581 () Bool)

(assert (=> b!786805 m!728581))

(declare-fun m!728583 () Bool)

(assert (=> b!786805 m!728583))

(push 1)


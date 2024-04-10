; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65110 () Bool)

(assert start!65110)

(declare-fun b!734820 () Bool)

(declare-fun res!493683 () Bool)

(declare-fun e!411163 () Bool)

(assert (=> b!734820 (=> (not res!493683) (not e!411163))))

(declare-fun e!411159 () Bool)

(assert (=> b!734820 (= res!493683 e!411159)))

(declare-fun c!80956 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!734820 (= c!80956 (bvsle x!1131 resIntermediateX!5))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41283 0))(
  ( (array!41284 (arr!19755 (Array (_ BitVec 32) (_ BitVec 64))) (size!20176 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41283)

(declare-datatypes ((SeekEntryResult!7355 0))(
  ( (MissingZero!7355 (index!31788 (_ BitVec 32))) (Found!7355 (index!31789 (_ BitVec 32))) (Intermediate!7355 (undefined!8167 Bool) (index!31790 (_ BitVec 32)) (x!62801 (_ BitVec 32))) (Undefined!7355) (MissingVacant!7355 (index!31791 (_ BitVec 32))) )
))
(declare-fun lt!325677 () SeekEntryResult!7355)

(declare-fun b!734821 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!411158 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41283 (_ BitVec 32)) SeekEntryResult!7355)

(assert (=> b!734821 (= e!411158 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19755 a!3186) j!159) a!3186 mask!3328) lt!325677))))

(declare-fun b!734822 () Bool)

(declare-fun res!493670 () Bool)

(declare-fun e!411162 () Bool)

(assert (=> b!734822 (=> (not res!493670) (not e!411162))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!734822 (= res!493670 (validKeyInArray!0 (select (arr!19755 a!3186) j!159)))))

(declare-fun b!734824 () Bool)

(declare-fun res!493679 () Bool)

(assert (=> b!734824 (=> (not res!493679) (not e!411162))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41283 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!734824 (= res!493679 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!734825 () Bool)

(declare-fun res!493681 () Bool)

(declare-fun e!411161 () Bool)

(assert (=> b!734825 (=> (not res!493681) (not e!411161))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41283 (_ BitVec 32)) Bool)

(assert (=> b!734825 (= res!493681 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!734826 () Bool)

(assert (=> b!734826 (= e!411162 e!411161)))

(declare-fun res!493682 () Bool)

(assert (=> b!734826 (=> (not res!493682) (not e!411161))))

(declare-fun lt!325675 () SeekEntryResult!7355)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!734826 (= res!493682 (or (= lt!325675 (MissingZero!7355 i!1173)) (= lt!325675 (MissingVacant!7355 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41283 (_ BitVec 32)) SeekEntryResult!7355)

(assert (=> b!734826 (= lt!325675 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!734827 () Bool)

(declare-fun e!411157 () Bool)

(declare-fun e!411160 () Bool)

(assert (=> b!734827 (= e!411157 (not e!411160))))

(declare-fun res!493685 () Bool)

(assert (=> b!734827 (=> res!493685 e!411160)))

(declare-fun lt!325679 () SeekEntryResult!7355)

(assert (=> b!734827 (= res!493685 (or (not (is-Intermediate!7355 lt!325679)) (bvsge x!1131 (x!62801 lt!325679))))))

(declare-fun e!411164 () Bool)

(assert (=> b!734827 e!411164))

(declare-fun res!493672 () Bool)

(assert (=> b!734827 (=> (not res!493672) (not e!411164))))

(assert (=> b!734827 (= res!493672 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25028 0))(
  ( (Unit!25029) )
))
(declare-fun lt!325676 () Unit!25028)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41283 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25028)

(assert (=> b!734827 (= lt!325676 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!325670 () SeekEntryResult!7355)

(declare-fun b!734828 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41283 (_ BitVec 32)) SeekEntryResult!7355)

(assert (=> b!734828 (= e!411159 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19755 a!3186) j!159) a!3186 mask!3328) lt!325670))))

(declare-fun b!734829 () Bool)

(declare-fun res!493680 () Bool)

(assert (=> b!734829 (=> (not res!493680) (not e!411161))))

(declare-datatypes ((List!13757 0))(
  ( (Nil!13754) (Cons!13753 (h!14825 (_ BitVec 64)) (t!20072 List!13757)) )
))
(declare-fun arrayNoDuplicates!0 (array!41283 (_ BitVec 32) List!13757) Bool)

(assert (=> b!734829 (= res!493680 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13754))))

(declare-fun b!734830 () Bool)

(declare-fun e!411155 () Bool)

(assert (=> b!734830 (= e!411160 e!411155)))

(declare-fun res!493669 () Bool)

(assert (=> b!734830 (=> res!493669 e!411155)))

(assert (=> b!734830 (= res!493669 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!325678 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!734830 (= lt!325678 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun res!493671 () Bool)

(assert (=> start!65110 (=> (not res!493671) (not e!411162))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65110 (= res!493671 (validMask!0 mask!3328))))

(assert (=> start!65110 e!411162))

(assert (=> start!65110 true))

(declare-fun array_inv!15551 (array!41283) Bool)

(assert (=> start!65110 (array_inv!15551 a!3186)))

(declare-fun b!734823 () Bool)

(assert (=> b!734823 (= e!411164 e!411158)))

(declare-fun res!493684 () Bool)

(assert (=> b!734823 (=> (not res!493684) (not e!411158))))

(assert (=> b!734823 (= res!493684 (= (seekEntryOrOpen!0 (select (arr!19755 a!3186) j!159) a!3186 mask!3328) lt!325677))))

(assert (=> b!734823 (= lt!325677 (Found!7355 j!159))))

(declare-fun b!734831 () Bool)

(assert (=> b!734831 (= e!411161 e!411163)))

(declare-fun res!493673 () Bool)

(assert (=> b!734831 (=> (not res!493673) (not e!411163))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!734831 (= res!493673 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19755 a!3186) j!159) mask!3328) (select (arr!19755 a!3186) j!159) a!3186 mask!3328) lt!325670))))

(assert (=> b!734831 (= lt!325670 (Intermediate!7355 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!734832 () Bool)

(declare-fun res!493677 () Bool)

(assert (=> b!734832 (=> (not res!493677) (not e!411162))))

(assert (=> b!734832 (= res!493677 (and (= (size!20176 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20176 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20176 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!734833 () Bool)

(assert (=> b!734833 (= e!411163 e!411157)))

(declare-fun res!493678 () Bool)

(assert (=> b!734833 (=> (not res!493678) (not e!411157))))

(declare-fun lt!325674 () SeekEntryResult!7355)

(assert (=> b!734833 (= res!493678 (= lt!325674 lt!325679))))

(declare-fun lt!325672 () (_ BitVec 64))

(declare-fun lt!325673 () array!41283)

(assert (=> b!734833 (= lt!325679 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!325672 lt!325673 mask!3328))))

(assert (=> b!734833 (= lt!325674 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!325672 mask!3328) lt!325672 lt!325673 mask!3328))))

(assert (=> b!734833 (= lt!325672 (select (store (arr!19755 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!734833 (= lt!325673 (array!41284 (store (arr!19755 a!3186) i!1173 k!2102) (size!20176 a!3186)))))

(declare-fun b!734834 () Bool)

(declare-fun res!493676 () Bool)

(assert (=> b!734834 (=> (not res!493676) (not e!411161))))

(assert (=> b!734834 (= res!493676 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20176 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20176 a!3186))))))

(declare-fun b!734835 () Bool)

(declare-fun res!493674 () Bool)

(assert (=> b!734835 (=> (not res!493674) (not e!411162))))

(assert (=> b!734835 (= res!493674 (validKeyInArray!0 k!2102))))

(declare-fun b!734836 () Bool)

(declare-fun res!493675 () Bool)

(assert (=> b!734836 (=> (not res!493675) (not e!411163))))

(assert (=> b!734836 (= res!493675 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19755 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!734837 () Bool)

(assert (=> b!734837 (= e!411155 true)))

(declare-fun lt!325671 () SeekEntryResult!7355)

(assert (=> b!734837 (= lt!325671 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19755 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!734838 () Bool)

(assert (=> b!734838 (= e!411159 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19755 a!3186) j!159) a!3186 mask!3328) (Found!7355 j!159)))))

(assert (= (and start!65110 res!493671) b!734832))

(assert (= (and b!734832 res!493677) b!734822))

(assert (= (and b!734822 res!493670) b!734835))

(assert (= (and b!734835 res!493674) b!734824))

(assert (= (and b!734824 res!493679) b!734826))

(assert (= (and b!734826 res!493682) b!734825))

(assert (= (and b!734825 res!493681) b!734829))

(assert (= (and b!734829 res!493680) b!734834))

(assert (= (and b!734834 res!493676) b!734831))

(assert (= (and b!734831 res!493673) b!734836))

(assert (= (and b!734836 res!493675) b!734820))

(assert (= (and b!734820 c!80956) b!734828))

(assert (= (and b!734820 (not c!80956)) b!734838))

(assert (= (and b!734820 res!493683) b!734833))

(assert (= (and b!734833 res!493678) b!734827))

(assert (= (and b!734827 res!493672) b!734823))

(assert (= (and b!734823 res!493684) b!734821))

(assert (= (and b!734827 (not res!493685)) b!734830))

(assert (= (and b!734830 (not res!493669)) b!734837))

(declare-fun m!687331 () Bool)

(assert (=> b!734824 m!687331))

(declare-fun m!687333 () Bool)

(assert (=> b!734833 m!687333))

(declare-fun m!687335 () Bool)

(assert (=> b!734833 m!687335))

(declare-fun m!687337 () Bool)

(assert (=> b!734833 m!687337))

(declare-fun m!687339 () Bool)

(assert (=> b!734833 m!687339))

(assert (=> b!734833 m!687337))

(declare-fun m!687341 () Bool)

(assert (=> b!734833 m!687341))

(declare-fun m!687343 () Bool)

(assert (=> b!734835 m!687343))

(declare-fun m!687345 () Bool)

(assert (=> b!734827 m!687345))

(declare-fun m!687347 () Bool)

(assert (=> b!734827 m!687347))

(declare-fun m!687349 () Bool)

(assert (=> b!734831 m!687349))

(assert (=> b!734831 m!687349))

(declare-fun m!687351 () Bool)

(assert (=> b!734831 m!687351))

(assert (=> b!734831 m!687351))

(assert (=> b!734831 m!687349))

(declare-fun m!687353 () Bool)

(assert (=> b!734831 m!687353))

(assert (=> b!734828 m!687349))

(assert (=> b!734828 m!687349))

(declare-fun m!687355 () Bool)

(assert (=> b!734828 m!687355))

(assert (=> b!734838 m!687349))

(assert (=> b!734838 m!687349))

(declare-fun m!687357 () Bool)

(assert (=> b!734838 m!687357))

(declare-fun m!687359 () Bool)

(assert (=> b!734830 m!687359))

(declare-fun m!687361 () Bool)

(assert (=> b!734836 m!687361))

(declare-fun m!687363 () Bool)

(assert (=> b!734825 m!687363))

(assert (=> b!734837 m!687349))

(assert (=> b!734837 m!687349))

(assert (=> b!734837 m!687357))

(declare-fun m!687365 () Bool)

(assert (=> start!65110 m!687365))

(declare-fun m!687367 () Bool)

(assert (=> start!65110 m!687367))

(declare-fun m!687369 () Bool)

(assert (=> b!734829 m!687369))

(assert (=> b!734822 m!687349))

(assert (=> b!734822 m!687349))

(declare-fun m!687371 () Bool)

(assert (=> b!734822 m!687371))

(assert (=> b!734823 m!687349))

(assert (=> b!734823 m!687349))

(declare-fun m!687373 () Bool)

(assert (=> b!734823 m!687373))

(assert (=> b!734821 m!687349))

(assert (=> b!734821 m!687349))

(declare-fun m!687375 () Bool)

(assert (=> b!734821 m!687375))

(declare-fun m!687377 () Bool)

(assert (=> b!734826 m!687377))

(push 1)


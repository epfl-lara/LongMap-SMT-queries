; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65674 () Bool)

(assert start!65674)

(declare-fun b!752666 () Bool)

(declare-fun res!508334 () Bool)

(declare-fun e!419836 () Bool)

(assert (=> b!752666 (=> (not res!508334) (not e!419836))))

(declare-datatypes ((array!41847 0))(
  ( (array!41848 (arr!20037 (Array (_ BitVec 32) (_ BitVec 64))) (size!20458 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41847)

(declare-datatypes ((List!14039 0))(
  ( (Nil!14036) (Cons!14035 (h!15107 (_ BitVec 64)) (t!20354 List!14039)) )
))
(declare-fun arrayNoDuplicates!0 (array!41847 (_ BitVec 32) List!14039) Bool)

(assert (=> b!752666 (= res!508334 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14036))))

(declare-fun b!752667 () Bool)

(declare-fun res!508331 () Bool)

(declare-fun e!419833 () Bool)

(assert (=> b!752667 (=> (not res!508331) (not e!419833))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!334826 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!334820 () array!41847)

(declare-datatypes ((SeekEntryResult!7637 0))(
  ( (MissingZero!7637 (index!32916 (_ BitVec 32))) (Found!7637 (index!32917 (_ BitVec 32))) (Intermediate!7637 (undefined!8449 Bool) (index!32918 (_ BitVec 32)) (x!63835 (_ BitVec 32))) (Undefined!7637) (MissingVacant!7637 (index!32919 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41847 (_ BitVec 32)) SeekEntryResult!7637)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41847 (_ BitVec 32)) SeekEntryResult!7637)

(assert (=> b!752667 (= res!508331 (= (seekEntryOrOpen!0 lt!334826 lt!334820 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334826 lt!334820 mask!3328)))))

(declare-fun lt!334824 () SeekEntryResult!7637)

(declare-fun e!419827 () Bool)

(declare-fun b!752668 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41847 (_ BitVec 32)) SeekEntryResult!7637)

(assert (=> b!752668 (= e!419827 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20037 a!3186) j!159) a!3186 mask!3328) lt!334824))))

(declare-fun res!508343 () Bool)

(declare-fun e!419834 () Bool)

(assert (=> start!65674 (=> (not res!508343) (not e!419834))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65674 (= res!508343 (validMask!0 mask!3328))))

(assert (=> start!65674 e!419834))

(assert (=> start!65674 true))

(declare-fun array_inv!15833 (array!41847) Bool)

(assert (=> start!65674 (array_inv!15833 a!3186)))

(declare-fun b!752669 () Bool)

(declare-fun e!419826 () Bool)

(declare-fun e!419829 () Bool)

(assert (=> b!752669 (= e!419826 e!419829)))

(declare-fun res!508340 () Bool)

(assert (=> b!752669 (=> res!508340 e!419829)))

(declare-fun lt!334828 () SeekEntryResult!7637)

(declare-fun lt!334829 () SeekEntryResult!7637)

(assert (=> b!752669 (= res!508340 (not (= lt!334828 lt!334829)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!752669 (= lt!334828 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20037 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!752670 () Bool)

(declare-fun res!508337 () Bool)

(assert (=> b!752670 (=> (not res!508337) (not e!419834))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!752670 (= res!508337 (validKeyInArray!0 (select (arr!20037 a!3186) j!159)))))

(declare-fun b!752671 () Bool)

(declare-fun res!508341 () Bool)

(assert (=> b!752671 (=> (not res!508341) (not e!419834))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41847 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!752671 (= res!508341 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!752672 () Bool)

(declare-datatypes ((Unit!25928 0))(
  ( (Unit!25929) )
))
(declare-fun e!419832 () Unit!25928)

(declare-fun Unit!25930 () Unit!25928)

(assert (=> b!752672 (= e!419832 Unit!25930)))

(assert (=> b!752672 false))

(declare-fun b!752673 () Bool)

(declare-fun Unit!25931 () Unit!25928)

(assert (=> b!752673 (= e!419832 Unit!25931)))

(declare-fun e!419830 () Bool)

(declare-fun b!752674 () Bool)

(assert (=> b!752674 (= e!419830 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvslt resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(assert (=> b!752674 e!419833))

(declare-fun res!508328 () Bool)

(assert (=> b!752674 (=> (not res!508328) (not e!419833))))

(declare-fun lt!334822 () (_ BitVec 64))

(assert (=> b!752674 (= res!508328 (= lt!334822 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!334819 () Unit!25928)

(assert (=> b!752674 (= lt!334819 e!419832)))

(declare-fun c!82552 () Bool)

(assert (=> b!752674 (= c!82552 (= lt!334822 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!752675 () Bool)

(declare-fun res!508336 () Bool)

(assert (=> b!752675 (=> (not res!508336) (not e!419834))))

(assert (=> b!752675 (= res!508336 (validKeyInArray!0 k!2102))))

(declare-fun b!752676 () Bool)

(assert (=> b!752676 (= e!419829 e!419830)))

(declare-fun res!508326 () Bool)

(assert (=> b!752676 (=> res!508326 e!419830)))

(assert (=> b!752676 (= res!508326 (= lt!334822 lt!334826))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!752676 (= lt!334822 (select (store (arr!20037 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!752677 () Bool)

(declare-fun res!508338 () Bool)

(declare-fun e!419835 () Bool)

(assert (=> b!752677 (=> (not res!508338) (not e!419835))))

(assert (=> b!752677 (= res!508338 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20037 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!752678 () Bool)

(declare-fun e!419831 () Bool)

(assert (=> b!752678 (= e!419835 e!419831)))

(declare-fun res!508342 () Bool)

(assert (=> b!752678 (=> (not res!508342) (not e!419831))))

(declare-fun lt!334821 () SeekEntryResult!7637)

(declare-fun lt!334823 () SeekEntryResult!7637)

(assert (=> b!752678 (= res!508342 (= lt!334821 lt!334823))))

(assert (=> b!752678 (= lt!334823 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334826 lt!334820 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!752678 (= lt!334821 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334826 mask!3328) lt!334826 lt!334820 mask!3328))))

(assert (=> b!752678 (= lt!334826 (select (store (arr!20037 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!752678 (= lt!334820 (array!41848 (store (arr!20037 a!3186) i!1173 k!2102) (size!20458 a!3186)))))

(declare-fun b!752679 () Bool)

(assert (=> b!752679 (= e!419827 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20037 a!3186) j!159) a!3186 mask!3328) (Found!7637 j!159)))))

(declare-fun b!752680 () Bool)

(declare-fun res!508339 () Bool)

(assert (=> b!752680 (=> (not res!508339) (not e!419834))))

(assert (=> b!752680 (= res!508339 (and (= (size!20458 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20458 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20458 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!752681 () Bool)

(assert (=> b!752681 (= e!419831 (not e!419826))))

(declare-fun res!508333 () Bool)

(assert (=> b!752681 (=> res!508333 e!419826)))

(assert (=> b!752681 (= res!508333 (or (not (is-Intermediate!7637 lt!334823)) (bvslt x!1131 (x!63835 lt!334823)) (not (= x!1131 (x!63835 lt!334823))) (not (= index!1321 (index!32918 lt!334823)))))))

(declare-fun e!419837 () Bool)

(assert (=> b!752681 e!419837))

(declare-fun res!508325 () Bool)

(assert (=> b!752681 (=> (not res!508325) (not e!419837))))

(declare-fun lt!334818 () SeekEntryResult!7637)

(assert (=> b!752681 (= res!508325 (= lt!334818 lt!334829))))

(assert (=> b!752681 (= lt!334829 (Found!7637 j!159))))

(assert (=> b!752681 (= lt!334818 (seekEntryOrOpen!0 (select (arr!20037 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41847 (_ BitVec 32)) Bool)

(assert (=> b!752681 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!334825 () Unit!25928)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41847 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25928)

(assert (=> b!752681 (= lt!334825 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!752682 () Bool)

(declare-fun res!508332 () Bool)

(assert (=> b!752682 (=> (not res!508332) (not e!419836))))

(assert (=> b!752682 (= res!508332 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!752683 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!752683 (= e!419837 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20037 a!3186) j!159) a!3186 mask!3328) lt!334829))))

(declare-fun b!752684 () Bool)

(declare-fun res!508330 () Bool)

(assert (=> b!752684 (=> (not res!508330) (not e!419836))))

(assert (=> b!752684 (= res!508330 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20458 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20458 a!3186))))))

(declare-fun b!752685 () Bool)

(assert (=> b!752685 (= e!419834 e!419836)))

(declare-fun res!508327 () Bool)

(assert (=> b!752685 (=> (not res!508327) (not e!419836))))

(declare-fun lt!334827 () SeekEntryResult!7637)

(assert (=> b!752685 (= res!508327 (or (= lt!334827 (MissingZero!7637 i!1173)) (= lt!334827 (MissingVacant!7637 i!1173))))))

(assert (=> b!752685 (= lt!334827 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!752686 () Bool)

(declare-fun res!508335 () Bool)

(assert (=> b!752686 (=> (not res!508335) (not e!419835))))

(assert (=> b!752686 (= res!508335 e!419827)))

(declare-fun c!82551 () Bool)

(assert (=> b!752686 (= c!82551 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!752687 () Bool)

(assert (=> b!752687 (= e!419836 e!419835)))

(declare-fun res!508329 () Bool)

(assert (=> b!752687 (=> (not res!508329) (not e!419835))))

(assert (=> b!752687 (= res!508329 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20037 a!3186) j!159) mask!3328) (select (arr!20037 a!3186) j!159) a!3186 mask!3328) lt!334824))))

(assert (=> b!752687 (= lt!334824 (Intermediate!7637 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!752688 () Bool)

(assert (=> b!752688 (= e!419833 (= lt!334818 lt!334828))))

(assert (= (and start!65674 res!508343) b!752680))

(assert (= (and b!752680 res!508339) b!752670))

(assert (= (and b!752670 res!508337) b!752675))

(assert (= (and b!752675 res!508336) b!752671))

(assert (= (and b!752671 res!508341) b!752685))

(assert (= (and b!752685 res!508327) b!752682))

(assert (= (and b!752682 res!508332) b!752666))

(assert (= (and b!752666 res!508334) b!752684))

(assert (= (and b!752684 res!508330) b!752687))

(assert (= (and b!752687 res!508329) b!752677))

(assert (= (and b!752677 res!508338) b!752686))

(assert (= (and b!752686 c!82551) b!752668))

(assert (= (and b!752686 (not c!82551)) b!752679))

(assert (= (and b!752686 res!508335) b!752678))

(assert (= (and b!752678 res!508342) b!752681))

(assert (= (and b!752681 res!508325) b!752683))

(assert (= (and b!752681 (not res!508333)) b!752669))

(assert (= (and b!752669 (not res!508340)) b!752676))

(assert (= (and b!752676 (not res!508326)) b!752674))

(assert (= (and b!752674 c!82552) b!752672))

(assert (= (and b!752674 (not c!82552)) b!752673))

(assert (= (and b!752674 res!508328) b!752667))

(assert (= (and b!752667 res!508331) b!752688))

(declare-fun m!701551 () Bool)

(assert (=> start!65674 m!701551))

(declare-fun m!701553 () Bool)

(assert (=> start!65674 m!701553))

(declare-fun m!701555 () Bool)

(assert (=> b!752679 m!701555))

(assert (=> b!752679 m!701555))

(declare-fun m!701557 () Bool)

(assert (=> b!752679 m!701557))

(declare-fun m!701559 () Bool)

(assert (=> b!752682 m!701559))

(assert (=> b!752683 m!701555))

(assert (=> b!752683 m!701555))

(declare-fun m!701561 () Bool)

(assert (=> b!752683 m!701561))

(assert (=> b!752681 m!701555))

(assert (=> b!752681 m!701555))

(declare-fun m!701563 () Bool)

(assert (=> b!752681 m!701563))

(declare-fun m!701565 () Bool)

(assert (=> b!752681 m!701565))

(declare-fun m!701567 () Bool)

(assert (=> b!752681 m!701567))

(assert (=> b!752687 m!701555))

(assert (=> b!752687 m!701555))

(declare-fun m!701569 () Bool)

(assert (=> b!752687 m!701569))

(assert (=> b!752687 m!701569))

(assert (=> b!752687 m!701555))

(declare-fun m!701571 () Bool)

(assert (=> b!752687 m!701571))

(declare-fun m!701573 () Bool)

(assert (=> b!752678 m!701573))

(declare-fun m!701575 () Bool)

(assert (=> b!752678 m!701575))

(declare-fun m!701577 () Bool)

(assert (=> b!752678 m!701577))

(declare-fun m!701579 () Bool)

(assert (=> b!752678 m!701579))

(declare-fun m!701581 () Bool)

(assert (=> b!752678 m!701581))

(assert (=> b!752678 m!701577))

(declare-fun m!701583 () Bool)

(assert (=> b!752666 m!701583))

(assert (=> b!752668 m!701555))

(assert (=> b!752668 m!701555))

(declare-fun m!701585 () Bool)

(assert (=> b!752668 m!701585))

(declare-fun m!701587 () Bool)

(assert (=> b!752677 m!701587))

(declare-fun m!701589 () Bool)

(assert (=> b!752671 m!701589))

(assert (=> b!752676 m!701581))

(declare-fun m!701591 () Bool)

(assert (=> b!752676 m!701591))

(assert (=> b!752669 m!701555))

(assert (=> b!752669 m!701555))

(assert (=> b!752669 m!701557))

(declare-fun m!701593 () Bool)

(assert (=> b!752675 m!701593))

(assert (=> b!752670 m!701555))

(assert (=> b!752670 m!701555))

(declare-fun m!701595 () Bool)

(assert (=> b!752670 m!701595))

(declare-fun m!701597 () Bool)

(assert (=> b!752685 m!701597))

(declare-fun m!701599 () Bool)

(assert (=> b!752667 m!701599))

(declare-fun m!701601 () Bool)

(assert (=> b!752667 m!701601))

(push 1)

(assert (not b!752683))

(assert (not b!752666))

(assert (not b!752685))

(assert (not b!752669))

(assert (not b!752667))

(assert (not b!752668))

(assert (not start!65674))

(assert (not b!752678))

(assert (not b!752671))

(assert (not b!752670))

(assert (not b!752687))

(assert (not b!752681))

(assert (not b!752679))

(assert (not b!752675))

(assert (not b!752682))

(check-sat)

(pop 1)

(push 1)

(check-sat)


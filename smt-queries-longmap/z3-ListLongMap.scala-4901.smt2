; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67628 () Bool)

(assert start!67628)

(declare-fun b!782912 () Bool)

(declare-fun res!529681 () Bool)

(declare-fun e!435322 () Bool)

(assert (=> b!782912 (=> (not res!529681) (not e!435322))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42687 0))(
  ( (array!42688 (arr!20432 (Array (_ BitVec 32) (_ BitVec 64))) (size!20853 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42687)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!782912 (= res!529681 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20853 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20853 a!3186))))))

(declare-fun b!782913 () Bool)

(declare-fun res!529682 () Bool)

(declare-fun e!435316 () Bool)

(assert (=> b!782913 (=> (not res!529682) (not e!435316))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!782913 (= res!529682 (and (= (size!20853 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20853 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20853 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!782915 () Bool)

(declare-fun e!435321 () Bool)

(assert (=> b!782915 (= e!435322 e!435321)))

(declare-fun res!529684 () Bool)

(assert (=> b!782915 (=> (not res!529684) (not e!435321))))

(declare-datatypes ((SeekEntryResult!8029 0))(
  ( (MissingZero!8029 (index!34484 (_ BitVec 32))) (Found!8029 (index!34485 (_ BitVec 32))) (Intermediate!8029 (undefined!8841 Bool) (index!34486 (_ BitVec 32)) (x!65452 (_ BitVec 32))) (Undefined!8029) (MissingVacant!8029 (index!34487 (_ BitVec 32))) )
))
(declare-fun lt!348790 () SeekEntryResult!8029)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42687 (_ BitVec 32)) SeekEntryResult!8029)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!782915 (= res!529684 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20432 a!3186) j!159) mask!3328) (select (arr!20432 a!3186) j!159) a!3186 mask!3328) lt!348790))))

(assert (=> b!782915 (= lt!348790 (Intermediate!8029 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!782916 () Bool)

(declare-fun res!529675 () Bool)

(assert (=> b!782916 (=> (not res!529675) (not e!435321))))

(declare-fun e!435325 () Bool)

(assert (=> b!782916 (= res!529675 e!435325)))

(declare-fun c!87027 () Bool)

(assert (=> b!782916 (= c!87027 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!782917 () Bool)

(declare-fun res!529691 () Bool)

(declare-fun e!435320 () Bool)

(assert (=> b!782917 (=> res!529691 e!435320)))

(declare-fun lt!348787 () SeekEntryResult!8029)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42687 (_ BitVec 32)) SeekEntryResult!8029)

(assert (=> b!782917 (= res!529691 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20432 a!3186) j!159) a!3186 mask!3328) lt!348787)))))

(declare-fun b!782918 () Bool)

(declare-fun res!529683 () Bool)

(assert (=> b!782918 (=> (not res!529683) (not e!435316))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!782918 (= res!529683 (validKeyInArray!0 (select (arr!20432 a!3186) j!159)))))

(declare-fun b!782919 () Bool)

(declare-fun e!435318 () Bool)

(assert (=> b!782919 (= e!435318 (not e!435320))))

(declare-fun res!529680 () Bool)

(assert (=> b!782919 (=> res!529680 e!435320)))

(declare-fun lt!348782 () SeekEntryResult!8029)

(get-info :version)

(assert (=> b!782919 (= res!529680 (or (not ((_ is Intermediate!8029) lt!348782)) (bvslt x!1131 (x!65452 lt!348782)) (not (= x!1131 (x!65452 lt!348782))) (not (= index!1321 (index!34486 lt!348782)))))))

(declare-fun e!435319 () Bool)

(assert (=> b!782919 e!435319))

(declare-fun res!529687 () Bool)

(assert (=> b!782919 (=> (not res!529687) (not e!435319))))

(declare-fun lt!348783 () SeekEntryResult!8029)

(assert (=> b!782919 (= res!529687 (= lt!348783 lt!348787))))

(assert (=> b!782919 (= lt!348787 (Found!8029 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42687 (_ BitVec 32)) SeekEntryResult!8029)

(assert (=> b!782919 (= lt!348783 (seekEntryOrOpen!0 (select (arr!20432 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42687 (_ BitVec 32)) Bool)

(assert (=> b!782919 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26984 0))(
  ( (Unit!26985) )
))
(declare-fun lt!348785 () Unit!26984)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42687 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26984)

(assert (=> b!782919 (= lt!348785 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!782920 () Bool)

(assert (=> b!782920 (= e!435316 e!435322)))

(declare-fun res!529678 () Bool)

(assert (=> b!782920 (=> (not res!529678) (not e!435322))))

(declare-fun lt!348789 () SeekEntryResult!8029)

(assert (=> b!782920 (= res!529678 (or (= lt!348789 (MissingZero!8029 i!1173)) (= lt!348789 (MissingVacant!8029 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!782920 (= lt!348789 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!782921 () Bool)

(declare-fun res!529685 () Bool)

(assert (=> b!782921 (=> (not res!529685) (not e!435322))))

(assert (=> b!782921 (= res!529685 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!782922 () Bool)

(assert (=> b!782922 (= e!435319 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20432 a!3186) j!159) a!3186 mask!3328) lt!348787))))

(declare-fun e!435323 () Bool)

(declare-fun lt!348784 () (_ BitVec 64))

(declare-fun b!782923 () Bool)

(declare-fun lt!348791 () array!42687)

(assert (=> b!782923 (= e!435323 (= (seekEntryOrOpen!0 lt!348784 lt!348791 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!348784 lt!348791 mask!3328)))))

(declare-fun b!782924 () Bool)

(assert (=> b!782924 (= e!435325 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20432 a!3186) j!159) a!3186 mask!3328) lt!348790))))

(declare-fun b!782925 () Bool)

(declare-fun res!529676 () Bool)

(assert (=> b!782925 (=> (not res!529676) (not e!435316))))

(assert (=> b!782925 (= res!529676 (validKeyInArray!0 k0!2102))))

(declare-fun b!782926 () Bool)

(declare-fun res!529686 () Bool)

(assert (=> b!782926 (=> (not res!529686) (not e!435321))))

(assert (=> b!782926 (= res!529686 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20432 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!782927 () Bool)

(declare-fun res!529679 () Bool)

(assert (=> b!782927 (=> (not res!529679) (not e!435316))))

(declare-fun arrayContainsKey!0 (array!42687 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!782927 (= res!529679 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!782914 () Bool)

(declare-fun res!529690 () Bool)

(assert (=> b!782914 (=> (not res!529690) (not e!435322))))

(declare-datatypes ((List!14473 0))(
  ( (Nil!14470) (Cons!14469 (h!15592 (_ BitVec 64)) (t!20779 List!14473)) )
))
(declare-fun arrayNoDuplicates!0 (array!42687 (_ BitVec 32) List!14473) Bool)

(assert (=> b!782914 (= res!529690 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14470))))

(declare-fun res!529688 () Bool)

(assert (=> start!67628 (=> (not res!529688) (not e!435316))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67628 (= res!529688 (validMask!0 mask!3328))))

(assert (=> start!67628 e!435316))

(assert (=> start!67628 true))

(declare-fun array_inv!16315 (array!42687) Bool)

(assert (=> start!67628 (array_inv!16315 a!3186)))

(declare-fun b!782928 () Bool)

(assert (=> b!782928 (= e!435325 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20432 a!3186) j!159) a!3186 mask!3328) (Found!8029 j!159)))))

(declare-fun b!782929 () Bool)

(assert (=> b!782929 (= e!435321 e!435318)))

(declare-fun res!529692 () Bool)

(assert (=> b!782929 (=> (not res!529692) (not e!435318))))

(declare-fun lt!348781 () SeekEntryResult!8029)

(assert (=> b!782929 (= res!529692 (= lt!348781 lt!348782))))

(assert (=> b!782929 (= lt!348782 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!348784 lt!348791 mask!3328))))

(assert (=> b!782929 (= lt!348781 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348784 mask!3328) lt!348784 lt!348791 mask!3328))))

(assert (=> b!782929 (= lt!348784 (select (store (arr!20432 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!782929 (= lt!348791 (array!42688 (store (arr!20432 a!3186) i!1173 k0!2102) (size!20853 a!3186)))))

(declare-fun b!782930 () Bool)

(declare-fun e!435317 () Bool)

(assert (=> b!782930 (= e!435317 true)))

(assert (=> b!782930 e!435323))

(declare-fun res!529677 () Bool)

(assert (=> b!782930 (=> (not res!529677) (not e!435323))))

(declare-fun lt!348786 () (_ BitVec 64))

(assert (=> b!782930 (= res!529677 (= lt!348786 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!348788 () Unit!26984)

(declare-fun e!435315 () Unit!26984)

(assert (=> b!782930 (= lt!348788 e!435315)))

(declare-fun c!87026 () Bool)

(assert (=> b!782930 (= c!87026 (= lt!348786 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!782931 () Bool)

(declare-fun Unit!26986 () Unit!26984)

(assert (=> b!782931 (= e!435315 Unit!26986)))

(declare-fun b!782932 () Bool)

(declare-fun Unit!26987 () Unit!26984)

(assert (=> b!782932 (= e!435315 Unit!26987)))

(assert (=> b!782932 false))

(declare-fun b!782933 () Bool)

(assert (=> b!782933 (= e!435320 e!435317)))

(declare-fun res!529689 () Bool)

(assert (=> b!782933 (=> res!529689 e!435317)))

(assert (=> b!782933 (= res!529689 (= lt!348786 lt!348784))))

(assert (=> b!782933 (= lt!348786 (select (store (arr!20432 a!3186) i!1173 k0!2102) index!1321))))

(assert (= (and start!67628 res!529688) b!782913))

(assert (= (and b!782913 res!529682) b!782918))

(assert (= (and b!782918 res!529683) b!782925))

(assert (= (and b!782925 res!529676) b!782927))

(assert (= (and b!782927 res!529679) b!782920))

(assert (= (and b!782920 res!529678) b!782921))

(assert (= (and b!782921 res!529685) b!782914))

(assert (= (and b!782914 res!529690) b!782912))

(assert (= (and b!782912 res!529681) b!782915))

(assert (= (and b!782915 res!529684) b!782926))

(assert (= (and b!782926 res!529686) b!782916))

(assert (= (and b!782916 c!87027) b!782924))

(assert (= (and b!782916 (not c!87027)) b!782928))

(assert (= (and b!782916 res!529675) b!782929))

(assert (= (and b!782929 res!529692) b!782919))

(assert (= (and b!782919 res!529687) b!782922))

(assert (= (and b!782919 (not res!529680)) b!782917))

(assert (= (and b!782917 (not res!529691)) b!782933))

(assert (= (and b!782933 (not res!529689)) b!782930))

(assert (= (and b!782930 c!87026) b!782932))

(assert (= (and b!782930 (not c!87026)) b!782931))

(assert (= (and b!782930 res!529677) b!782923))

(declare-fun m!725019 () Bool)

(assert (=> b!782914 m!725019))

(declare-fun m!725021 () Bool)

(assert (=> b!782921 m!725021))

(declare-fun m!725023 () Bool)

(assert (=> b!782918 m!725023))

(assert (=> b!782918 m!725023))

(declare-fun m!725025 () Bool)

(assert (=> b!782918 m!725025))

(declare-fun m!725027 () Bool)

(assert (=> b!782926 m!725027))

(assert (=> b!782917 m!725023))

(assert (=> b!782917 m!725023))

(declare-fun m!725029 () Bool)

(assert (=> b!782917 m!725029))

(declare-fun m!725031 () Bool)

(assert (=> b!782927 m!725031))

(declare-fun m!725033 () Bool)

(assert (=> start!67628 m!725033))

(declare-fun m!725035 () Bool)

(assert (=> start!67628 m!725035))

(declare-fun m!725037 () Bool)

(assert (=> b!782925 m!725037))

(declare-fun m!725039 () Bool)

(assert (=> b!782933 m!725039))

(declare-fun m!725041 () Bool)

(assert (=> b!782933 m!725041))

(assert (=> b!782919 m!725023))

(assert (=> b!782919 m!725023))

(declare-fun m!725043 () Bool)

(assert (=> b!782919 m!725043))

(declare-fun m!725045 () Bool)

(assert (=> b!782919 m!725045))

(declare-fun m!725047 () Bool)

(assert (=> b!782919 m!725047))

(declare-fun m!725049 () Bool)

(assert (=> b!782929 m!725049))

(assert (=> b!782929 m!725039))

(declare-fun m!725051 () Bool)

(assert (=> b!782929 m!725051))

(assert (=> b!782929 m!725049))

(declare-fun m!725053 () Bool)

(assert (=> b!782929 m!725053))

(declare-fun m!725055 () Bool)

(assert (=> b!782929 m!725055))

(assert (=> b!782928 m!725023))

(assert (=> b!782928 m!725023))

(assert (=> b!782928 m!725029))

(assert (=> b!782924 m!725023))

(assert (=> b!782924 m!725023))

(declare-fun m!725057 () Bool)

(assert (=> b!782924 m!725057))

(declare-fun m!725059 () Bool)

(assert (=> b!782920 m!725059))

(assert (=> b!782922 m!725023))

(assert (=> b!782922 m!725023))

(declare-fun m!725061 () Bool)

(assert (=> b!782922 m!725061))

(declare-fun m!725063 () Bool)

(assert (=> b!782923 m!725063))

(declare-fun m!725065 () Bool)

(assert (=> b!782923 m!725065))

(assert (=> b!782915 m!725023))

(assert (=> b!782915 m!725023))

(declare-fun m!725067 () Bool)

(assert (=> b!782915 m!725067))

(assert (=> b!782915 m!725067))

(assert (=> b!782915 m!725023))

(declare-fun m!725069 () Bool)

(assert (=> b!782915 m!725069))

(check-sat (not start!67628) (not b!782921) (not b!782915) (not b!782914) (not b!782924) (not b!782920) (not b!782918) (not b!782917) (not b!782922) (not b!782927) (not b!782928) (not b!782929) (not b!782925) (not b!782923) (not b!782919))
(check-sat)

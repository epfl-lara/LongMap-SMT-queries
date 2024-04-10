; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65790 () Bool)

(assert start!65790)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41963 0))(
  ( (array!41964 (arr!20095 (Array (_ BitVec 32) (_ BitVec 64))) (size!20516 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41963)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!756668 () Bool)

(declare-fun e!421920 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7695 0))(
  ( (MissingZero!7695 (index!33148 (_ BitVec 32))) (Found!7695 (index!33149 (_ BitVec 32))) (Intermediate!7695 (undefined!8507 Bool) (index!33150 (_ BitVec 32)) (x!64045 (_ BitVec 32))) (Undefined!7695) (MissingVacant!7695 (index!33151 (_ BitVec 32))) )
))
(declare-fun lt!336910 () SeekEntryResult!7695)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41963 (_ BitVec 32)) SeekEntryResult!7695)

(assert (=> b!756668 (= e!421920 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20095 a!3186) j!159) a!3186 mask!3328) lt!336910))))

(declare-fun b!756669 () Bool)

(declare-fun e!421922 () Bool)

(assert (=> b!756669 (= e!421922 true)))

(declare-fun e!421919 () Bool)

(assert (=> b!756669 e!421919))

(declare-fun res!511648 () Bool)

(assert (=> b!756669 (=> (not res!511648) (not e!421919))))

(declare-fun lt!336915 () (_ BitVec 64))

(assert (=> b!756669 (= res!511648 (= lt!336915 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!26160 0))(
  ( (Unit!26161) )
))
(declare-fun lt!336917 () Unit!26160)

(declare-fun e!421925 () Unit!26160)

(assert (=> b!756669 (= lt!336917 e!421925)))

(declare-fun c!82899 () Bool)

(assert (=> b!756669 (= c!82899 (= lt!336915 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!756670 () Bool)

(declare-fun res!511644 () Bool)

(declare-fun e!421917 () Bool)

(assert (=> b!756670 (=> (not res!511644) (not e!421917))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41963 (_ BitVec 32)) Bool)

(assert (=> b!756670 (= res!511644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!756671 () Bool)

(declare-fun res!511635 () Bool)

(assert (=> b!756671 (=> (not res!511635) (not e!421917))))

(declare-datatypes ((List!14097 0))(
  ( (Nil!14094) (Cons!14093 (h!15165 (_ BitVec 64)) (t!20412 List!14097)) )
))
(declare-fun arrayNoDuplicates!0 (array!41963 (_ BitVec 32) List!14097) Bool)

(assert (=> b!756671 (= res!511635 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14094))))

(declare-fun b!756673 () Bool)

(declare-fun e!421924 () Bool)

(assert (=> b!756673 (= e!421924 e!421922)))

(declare-fun res!511647 () Bool)

(assert (=> b!756673 (=> res!511647 e!421922)))

(declare-fun lt!336913 () (_ BitVec 64))

(assert (=> b!756673 (= res!511647 (= lt!336915 lt!336913))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!756673 (= lt!336915 (select (store (arr!20095 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!756674 () Bool)

(declare-fun e!421915 () Bool)

(assert (=> b!756674 (= e!421915 e!421917)))

(declare-fun res!511643 () Bool)

(assert (=> b!756674 (=> (not res!511643) (not e!421917))))

(declare-fun lt!336911 () SeekEntryResult!7695)

(assert (=> b!756674 (= res!511643 (or (= lt!336911 (MissingZero!7695 i!1173)) (= lt!336911 (MissingVacant!7695 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41963 (_ BitVec 32)) SeekEntryResult!7695)

(assert (=> b!756674 (= lt!336911 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!756675 () Bool)

(declare-fun e!421921 () Bool)

(declare-fun e!421916 () Bool)

(assert (=> b!756675 (= e!421921 e!421916)))

(declare-fun res!511640 () Bool)

(assert (=> b!756675 (=> (not res!511640) (not e!421916))))

(declare-fun lt!336914 () SeekEntryResult!7695)

(declare-fun lt!336906 () SeekEntryResult!7695)

(assert (=> b!756675 (= res!511640 (= lt!336914 lt!336906))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!336908 () array!41963)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41963 (_ BitVec 32)) SeekEntryResult!7695)

(assert (=> b!756675 (= lt!336906 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336913 lt!336908 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!756675 (= lt!336914 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336913 mask!3328) lt!336913 lt!336908 mask!3328))))

(assert (=> b!756675 (= lt!336913 (select (store (arr!20095 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!756675 (= lt!336908 (array!41964 (store (arr!20095 a!3186) i!1173 k0!2102) (size!20516 a!3186)))))

(declare-fun b!756676 () Bool)

(declare-fun e!421923 () Bool)

(declare-fun lt!336909 () SeekEntryResult!7695)

(assert (=> b!756676 (= e!421923 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20095 a!3186) j!159) a!3186 mask!3328) lt!336909))))

(declare-fun b!756677 () Bool)

(declare-fun res!511649 () Bool)

(assert (=> b!756677 (=> (not res!511649) (not e!421915))))

(assert (=> b!756677 (= res!511649 (and (= (size!20516 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20516 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20516 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!756678 () Bool)

(declare-fun res!511634 () Bool)

(assert (=> b!756678 (=> (not res!511634) (not e!421917))))

(assert (=> b!756678 (= res!511634 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20516 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20516 a!3186))))))

(declare-fun b!756679 () Bool)

(declare-fun lt!336916 () SeekEntryResult!7695)

(declare-fun lt!336912 () SeekEntryResult!7695)

(assert (=> b!756679 (= e!421919 (= lt!336916 lt!336912))))

(declare-fun b!756680 () Bool)

(declare-fun res!511638 () Bool)

(assert (=> b!756680 (=> (not res!511638) (not e!421915))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!756680 (= res!511638 (validKeyInArray!0 (select (arr!20095 a!3186) j!159)))))

(declare-fun b!756681 () Bool)

(declare-fun res!511631 () Bool)

(assert (=> b!756681 (=> (not res!511631) (not e!421915))))

(assert (=> b!756681 (= res!511631 (validKeyInArray!0 k0!2102))))

(declare-fun b!756682 () Bool)

(declare-fun res!511633 () Bool)

(assert (=> b!756682 (=> (not res!511633) (not e!421921))))

(assert (=> b!756682 (= res!511633 e!421923)))

(declare-fun c!82900 () Bool)

(assert (=> b!756682 (= c!82900 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!756683 () Bool)

(declare-fun e!421914 () Bool)

(assert (=> b!756683 (= e!421916 (not e!421914))))

(declare-fun res!511639 () Bool)

(assert (=> b!756683 (=> res!511639 e!421914)))

(get-info :version)

(assert (=> b!756683 (= res!511639 (or (not ((_ is Intermediate!7695) lt!336906)) (bvslt x!1131 (x!64045 lt!336906)) (not (= x!1131 (x!64045 lt!336906))) (not (= index!1321 (index!33150 lt!336906)))))))

(assert (=> b!756683 e!421920))

(declare-fun res!511637 () Bool)

(assert (=> b!756683 (=> (not res!511637) (not e!421920))))

(assert (=> b!756683 (= res!511637 (= lt!336916 lt!336910))))

(assert (=> b!756683 (= lt!336910 (Found!7695 j!159))))

(assert (=> b!756683 (= lt!336916 (seekEntryOrOpen!0 (select (arr!20095 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!756683 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!336907 () Unit!26160)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41963 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26160)

(assert (=> b!756683 (= lt!336907 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!756684 () Bool)

(declare-fun Unit!26162 () Unit!26160)

(assert (=> b!756684 (= e!421925 Unit!26162)))

(assert (=> b!756684 false))

(declare-fun b!756685 () Bool)

(assert (=> b!756685 (= e!421923 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20095 a!3186) j!159) a!3186 mask!3328) (Found!7695 j!159)))))

(declare-fun b!756686 () Bool)

(declare-fun res!511632 () Bool)

(assert (=> b!756686 (=> (not res!511632) (not e!421915))))

(declare-fun arrayContainsKey!0 (array!41963 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!756686 (= res!511632 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!511636 () Bool)

(assert (=> start!65790 (=> (not res!511636) (not e!421915))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65790 (= res!511636 (validMask!0 mask!3328))))

(assert (=> start!65790 e!421915))

(assert (=> start!65790 true))

(declare-fun array_inv!15891 (array!41963) Bool)

(assert (=> start!65790 (array_inv!15891 a!3186)))

(declare-fun b!756672 () Bool)

(declare-fun res!511642 () Bool)

(assert (=> b!756672 (=> (not res!511642) (not e!421919))))

(assert (=> b!756672 (= res!511642 (= (seekEntryOrOpen!0 lt!336913 lt!336908 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336913 lt!336908 mask!3328)))))

(declare-fun b!756687 () Bool)

(assert (=> b!756687 (= e!421917 e!421921)))

(declare-fun res!511641 () Bool)

(assert (=> b!756687 (=> (not res!511641) (not e!421921))))

(assert (=> b!756687 (= res!511641 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20095 a!3186) j!159) mask!3328) (select (arr!20095 a!3186) j!159) a!3186 mask!3328) lt!336909))))

(assert (=> b!756687 (= lt!336909 (Intermediate!7695 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!756688 () Bool)

(declare-fun res!511645 () Bool)

(assert (=> b!756688 (=> (not res!511645) (not e!421921))))

(assert (=> b!756688 (= res!511645 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20095 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!756689 () Bool)

(assert (=> b!756689 (= e!421914 e!421924)))

(declare-fun res!511646 () Bool)

(assert (=> b!756689 (=> res!511646 e!421924)))

(assert (=> b!756689 (= res!511646 (not (= lt!336912 lt!336910)))))

(assert (=> b!756689 (= lt!336912 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20095 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!756690 () Bool)

(declare-fun Unit!26163 () Unit!26160)

(assert (=> b!756690 (= e!421925 Unit!26163)))

(assert (= (and start!65790 res!511636) b!756677))

(assert (= (and b!756677 res!511649) b!756680))

(assert (= (and b!756680 res!511638) b!756681))

(assert (= (and b!756681 res!511631) b!756686))

(assert (= (and b!756686 res!511632) b!756674))

(assert (= (and b!756674 res!511643) b!756670))

(assert (= (and b!756670 res!511644) b!756671))

(assert (= (and b!756671 res!511635) b!756678))

(assert (= (and b!756678 res!511634) b!756687))

(assert (= (and b!756687 res!511641) b!756688))

(assert (= (and b!756688 res!511645) b!756682))

(assert (= (and b!756682 c!82900) b!756676))

(assert (= (and b!756682 (not c!82900)) b!756685))

(assert (= (and b!756682 res!511633) b!756675))

(assert (= (and b!756675 res!511640) b!756683))

(assert (= (and b!756683 res!511637) b!756668))

(assert (= (and b!756683 (not res!511639)) b!756689))

(assert (= (and b!756689 (not res!511646)) b!756673))

(assert (= (and b!756673 (not res!511647)) b!756669))

(assert (= (and b!756669 c!82899) b!756684))

(assert (= (and b!756669 (not c!82899)) b!756690))

(assert (= (and b!756669 res!511648) b!756672))

(assert (= (and b!756672 res!511642) b!756679))

(declare-fun m!704567 () Bool)

(assert (=> b!756668 m!704567))

(assert (=> b!756668 m!704567))

(declare-fun m!704569 () Bool)

(assert (=> b!756668 m!704569))

(assert (=> b!756685 m!704567))

(assert (=> b!756685 m!704567))

(declare-fun m!704571 () Bool)

(assert (=> b!756685 m!704571))

(declare-fun m!704573 () Bool)

(assert (=> b!756688 m!704573))

(declare-fun m!704575 () Bool)

(assert (=> b!756675 m!704575))

(declare-fun m!704577 () Bool)

(assert (=> b!756675 m!704577))

(assert (=> b!756675 m!704575))

(declare-fun m!704579 () Bool)

(assert (=> b!756675 m!704579))

(declare-fun m!704581 () Bool)

(assert (=> b!756675 m!704581))

(declare-fun m!704583 () Bool)

(assert (=> b!756675 m!704583))

(declare-fun m!704585 () Bool)

(assert (=> b!756672 m!704585))

(declare-fun m!704587 () Bool)

(assert (=> b!756672 m!704587))

(declare-fun m!704589 () Bool)

(assert (=> b!756671 m!704589))

(assert (=> b!756687 m!704567))

(assert (=> b!756687 m!704567))

(declare-fun m!704591 () Bool)

(assert (=> b!756687 m!704591))

(assert (=> b!756687 m!704591))

(assert (=> b!756687 m!704567))

(declare-fun m!704593 () Bool)

(assert (=> b!756687 m!704593))

(declare-fun m!704595 () Bool)

(assert (=> b!756686 m!704595))

(declare-fun m!704597 () Bool)

(assert (=> start!65790 m!704597))

(declare-fun m!704599 () Bool)

(assert (=> start!65790 m!704599))

(declare-fun m!704601 () Bool)

(assert (=> b!756681 m!704601))

(declare-fun m!704603 () Bool)

(assert (=> b!756670 m!704603))

(assert (=> b!756680 m!704567))

(assert (=> b!756680 m!704567))

(declare-fun m!704605 () Bool)

(assert (=> b!756680 m!704605))

(declare-fun m!704607 () Bool)

(assert (=> b!756674 m!704607))

(assert (=> b!756673 m!704577))

(declare-fun m!704609 () Bool)

(assert (=> b!756673 m!704609))

(assert (=> b!756676 m!704567))

(assert (=> b!756676 m!704567))

(declare-fun m!704611 () Bool)

(assert (=> b!756676 m!704611))

(assert (=> b!756689 m!704567))

(assert (=> b!756689 m!704567))

(assert (=> b!756689 m!704571))

(assert (=> b!756683 m!704567))

(assert (=> b!756683 m!704567))

(declare-fun m!704613 () Bool)

(assert (=> b!756683 m!704613))

(declare-fun m!704615 () Bool)

(assert (=> b!756683 m!704615))

(declare-fun m!704617 () Bool)

(assert (=> b!756683 m!704617))

(check-sat (not b!756685) (not b!756680) (not b!756670) (not b!756674) (not b!756686) (not b!756681) (not b!756676) (not b!756689) (not start!65790) (not b!756672) (not b!756683) (not b!756668) (not b!756671) (not b!756687) (not b!756675))
(check-sat)

; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67108 () Bool)

(assert start!67108)

(declare-fun b!774672 () Bool)

(declare-fun res!523795 () Bool)

(declare-fun e!431213 () Bool)

(assert (=> b!774672 (=> (not res!523795) (not e!431213))))

(declare-fun e!431205 () Bool)

(assert (=> b!774672 (= res!523795 e!431205)))

(declare-fun c!85841 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!774672 (= c!85841 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!774673 () Bool)

(declare-fun res!523804 () Bool)

(declare-fun e!431209 () Bool)

(assert (=> b!774673 (=> (not res!523804) (not e!431209))))

(declare-datatypes ((array!42463 0))(
  ( (array!42464 (arr!20327 (Array (_ BitVec 32) (_ BitVec 64))) (size!20748 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42463)

(declare-datatypes ((List!14329 0))(
  ( (Nil!14326) (Cons!14325 (h!15433 (_ BitVec 64)) (t!20644 List!14329)) )
))
(declare-fun arrayNoDuplicates!0 (array!42463 (_ BitVec 32) List!14329) Bool)

(assert (=> b!774673 (= res!523804 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14326))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!774674 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7927 0))(
  ( (MissingZero!7927 (index!34076 (_ BitVec 32))) (Found!7927 (index!34077 (_ BitVec 32))) (Intermediate!7927 (undefined!8739 Bool) (index!34078 (_ BitVec 32)) (x!65022 (_ BitVec 32))) (Undefined!7927) (MissingVacant!7927 (index!34079 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42463 (_ BitVec 32)) SeekEntryResult!7927)

(assert (=> b!774674 (= e!431205 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20327 a!3186) j!159) a!3186 mask!3328) (Found!7927 j!159)))))

(declare-fun b!774675 () Bool)

(declare-fun res!523799 () Bool)

(declare-fun e!431207 () Bool)

(assert (=> b!774675 (=> res!523799 e!431207)))

(declare-fun lt!345012 () (_ BitVec 64))

(declare-fun lt!345010 () (_ BitVec 32))

(declare-fun lt!345005 () SeekEntryResult!7927)

(declare-fun lt!345016 () array!42463)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42463 (_ BitVec 32)) SeekEntryResult!7927)

(assert (=> b!774675 (= res!523799 (not (= lt!345005 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345010 lt!345012 lt!345016 mask!3328))))))

(declare-fun b!774676 () Bool)

(declare-datatypes ((Unit!26722 0))(
  ( (Unit!26723) )
))
(declare-fun e!431210 () Unit!26722)

(declare-fun Unit!26724 () Unit!26722)

(assert (=> b!774676 (= e!431210 Unit!26724)))

(declare-fun lt!345008 () SeekEntryResult!7927)

(assert (=> b!774676 (= lt!345008 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20327 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!345007 () SeekEntryResult!7927)

(assert (=> b!774676 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345010 resIntermediateIndex!5 (select (arr!20327 a!3186) j!159) a!3186 mask!3328) lt!345007)))

(declare-fun b!774677 () Bool)

(assert (=> b!774677 (= e!431209 e!431213)))

(declare-fun res!523806 () Bool)

(assert (=> b!774677 (=> (not res!523806) (not e!431213))))

(declare-fun lt!345014 () SeekEntryResult!7927)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!774677 (= res!523806 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20327 a!3186) j!159) mask!3328) (select (arr!20327 a!3186) j!159) a!3186 mask!3328) lt!345014))))

(assert (=> b!774677 (= lt!345014 (Intermediate!7927 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!774678 () Bool)

(assert (=> b!774678 (= e!431207 (bvslt (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!1131)) (bvsub #b01111111111111111111111111111110 x!1131)))))

(declare-fun e!431216 () Bool)

(declare-fun b!774679 () Bool)

(assert (=> b!774679 (= e!431216 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345010 (select (arr!20327 a!3186) j!159) a!3186 mask!3328) lt!345014)))))

(declare-fun b!774680 () Bool)

(declare-fun e!431215 () Bool)

(assert (=> b!774680 (= e!431215 e!431209)))

(declare-fun res!523805 () Bool)

(assert (=> b!774680 (=> (not res!523805) (not e!431209))))

(declare-fun lt!345009 () SeekEntryResult!7927)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!774680 (= res!523805 (or (= lt!345009 (MissingZero!7927 i!1173)) (= lt!345009 (MissingVacant!7927 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42463 (_ BitVec 32)) SeekEntryResult!7927)

(assert (=> b!774680 (= lt!345009 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!774681 () Bool)

(assert (=> b!774681 (= e!431216 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345010 resIntermediateIndex!5 (select (arr!20327 a!3186) j!159) a!3186 mask!3328) lt!345007)))))

(declare-fun b!774682 () Bool)

(declare-fun res!523796 () Bool)

(assert (=> b!774682 (=> (not res!523796) (not e!431215))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!774682 (= res!523796 (validKeyInArray!0 (select (arr!20327 a!3186) j!159)))))

(declare-fun b!774683 () Bool)

(declare-fun e!431212 () Bool)

(declare-fun e!431206 () Bool)

(assert (=> b!774683 (= e!431212 e!431206)))

(declare-fun res!523803 () Bool)

(assert (=> b!774683 (=> (not res!523803) (not e!431206))))

(declare-fun lt!345011 () SeekEntryResult!7927)

(assert (=> b!774683 (= res!523803 (= (seekEntryOrOpen!0 (select (arr!20327 a!3186) j!159) a!3186 mask!3328) lt!345011))))

(assert (=> b!774683 (= lt!345011 (Found!7927 j!159))))

(declare-fun b!774684 () Bool)

(declare-fun res!523808 () Bool)

(assert (=> b!774684 (=> (not res!523808) (not e!431215))))

(assert (=> b!774684 (= res!523808 (and (= (size!20748 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20748 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20748 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!774685 () Bool)

(declare-fun res!523802 () Bool)

(assert (=> b!774685 (=> (not res!523802) (not e!431213))))

(assert (=> b!774685 (= res!523802 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20327 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!774686 () Bool)

(declare-fun res!523801 () Bool)

(assert (=> b!774686 (=> res!523801 e!431207)))

(assert (=> b!774686 (= res!523801 e!431216)))

(declare-fun c!85843 () Bool)

(declare-fun lt!345015 () Bool)

(assert (=> b!774686 (= c!85843 lt!345015)))

(declare-fun b!774687 () Bool)

(declare-fun e!431208 () Bool)

(assert (=> b!774687 (= e!431208 e!431207)))

(declare-fun res!523790 () Bool)

(assert (=> b!774687 (=> res!523790 e!431207)))

(assert (=> b!774687 (= res!523790 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!345010 #b00000000000000000000000000000000) (bvsge lt!345010 (size!20748 a!3186))))))

(declare-fun lt!345006 () Unit!26722)

(assert (=> b!774687 (= lt!345006 e!431210)))

(declare-fun c!85842 () Bool)

(assert (=> b!774687 (= c!85842 lt!345015)))

(assert (=> b!774687 (= lt!345015 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!774687 (= lt!345010 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!774688 () Bool)

(declare-fun Unit!26725 () Unit!26722)

(assert (=> b!774688 (= e!431210 Unit!26725)))

(assert (=> b!774688 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345010 (select (arr!20327 a!3186) j!159) a!3186 mask!3328) lt!345014)))

(declare-fun b!774689 () Bool)

(declare-fun e!431211 () Bool)

(assert (=> b!774689 (= e!431211 (not e!431208))))

(declare-fun res!523793 () Bool)

(assert (=> b!774689 (=> res!523793 e!431208)))

(declare-fun lt!345017 () SeekEntryResult!7927)

(assert (=> b!774689 (= res!523793 (or (not (is-Intermediate!7927 lt!345017)) (bvsge x!1131 (x!65022 lt!345017))))))

(assert (=> b!774689 (= lt!345007 (Found!7927 j!159))))

(assert (=> b!774689 e!431212))

(declare-fun res!523807 () Bool)

(assert (=> b!774689 (=> (not res!523807) (not e!431212))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42463 (_ BitVec 32)) Bool)

(assert (=> b!774689 (= res!523807 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!345013 () Unit!26722)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42463 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26722)

(assert (=> b!774689 (= lt!345013 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!774690 () Bool)

(declare-fun res!523792 () Bool)

(assert (=> b!774690 (=> (not res!523792) (not e!431215))))

(assert (=> b!774690 (= res!523792 (validKeyInArray!0 k!2102))))

(declare-fun b!774691 () Bool)

(assert (=> b!774691 (= e!431213 e!431211)))

(declare-fun res!523794 () Bool)

(assert (=> b!774691 (=> (not res!523794) (not e!431211))))

(assert (=> b!774691 (= res!523794 (= lt!345005 lt!345017))))

(assert (=> b!774691 (= lt!345017 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345012 lt!345016 mask!3328))))

(assert (=> b!774691 (= lt!345005 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345012 mask!3328) lt!345012 lt!345016 mask!3328))))

(assert (=> b!774691 (= lt!345012 (select (store (arr!20327 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!774691 (= lt!345016 (array!42464 (store (arr!20327 a!3186) i!1173 k!2102) (size!20748 a!3186)))))

(declare-fun res!523800 () Bool)

(assert (=> start!67108 (=> (not res!523800) (not e!431215))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67108 (= res!523800 (validMask!0 mask!3328))))

(assert (=> start!67108 e!431215))

(assert (=> start!67108 true))

(declare-fun array_inv!16123 (array!42463) Bool)

(assert (=> start!67108 (array_inv!16123 a!3186)))

(declare-fun b!774692 () Bool)

(declare-fun res!523797 () Bool)

(assert (=> b!774692 (=> (not res!523797) (not e!431215))))

(declare-fun arrayContainsKey!0 (array!42463 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!774692 (= res!523797 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!774693 () Bool)

(assert (=> b!774693 (= e!431206 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20327 a!3186) j!159) a!3186 mask!3328) lt!345011))))

(declare-fun b!774694 () Bool)

(declare-fun res!523791 () Bool)

(assert (=> b!774694 (=> (not res!523791) (not e!431209))))

(assert (=> b!774694 (= res!523791 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20748 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20748 a!3186))))))

(declare-fun b!774695 () Bool)

(declare-fun res!523798 () Bool)

(assert (=> b!774695 (=> (not res!523798) (not e!431209))))

(assert (=> b!774695 (= res!523798 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!774696 () Bool)

(assert (=> b!774696 (= e!431205 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20327 a!3186) j!159) a!3186 mask!3328) lt!345014))))

(assert (= (and start!67108 res!523800) b!774684))

(assert (= (and b!774684 res!523808) b!774682))

(assert (= (and b!774682 res!523796) b!774690))

(assert (= (and b!774690 res!523792) b!774692))

(assert (= (and b!774692 res!523797) b!774680))

(assert (= (and b!774680 res!523805) b!774695))

(assert (= (and b!774695 res!523798) b!774673))

(assert (= (and b!774673 res!523804) b!774694))

(assert (= (and b!774694 res!523791) b!774677))

(assert (= (and b!774677 res!523806) b!774685))

(assert (= (and b!774685 res!523802) b!774672))

(assert (= (and b!774672 c!85841) b!774696))

(assert (= (and b!774672 (not c!85841)) b!774674))

(assert (= (and b!774672 res!523795) b!774691))

(assert (= (and b!774691 res!523794) b!774689))

(assert (= (and b!774689 res!523807) b!774683))

(assert (= (and b!774683 res!523803) b!774693))

(assert (= (and b!774689 (not res!523793)) b!774687))

(assert (= (and b!774687 c!85842) b!774688))

(assert (= (and b!774687 (not c!85842)) b!774676))

(assert (= (and b!774687 (not res!523790)) b!774686))

(assert (= (and b!774686 c!85843) b!774679))

(assert (= (and b!774686 (not c!85843)) b!774681))

(assert (= (and b!774686 (not res!523801)) b!774675))

(assert (= (and b!774675 (not res!523799)) b!774678))

(declare-fun m!719075 () Bool)

(assert (=> b!774696 m!719075))

(assert (=> b!774696 m!719075))

(declare-fun m!719077 () Bool)

(assert (=> b!774696 m!719077))

(assert (=> b!774674 m!719075))

(assert (=> b!774674 m!719075))

(declare-fun m!719079 () Bool)

(assert (=> b!774674 m!719079))

(declare-fun m!719081 () Bool)

(assert (=> b!774690 m!719081))

(assert (=> b!774683 m!719075))

(assert (=> b!774683 m!719075))

(declare-fun m!719083 () Bool)

(assert (=> b!774683 m!719083))

(assert (=> b!774688 m!719075))

(assert (=> b!774688 m!719075))

(declare-fun m!719085 () Bool)

(assert (=> b!774688 m!719085))

(assert (=> b!774677 m!719075))

(assert (=> b!774677 m!719075))

(declare-fun m!719087 () Bool)

(assert (=> b!774677 m!719087))

(assert (=> b!774677 m!719087))

(assert (=> b!774677 m!719075))

(declare-fun m!719089 () Bool)

(assert (=> b!774677 m!719089))

(declare-fun m!719091 () Bool)

(assert (=> b!774680 m!719091))

(assert (=> b!774681 m!719075))

(assert (=> b!774681 m!719075))

(declare-fun m!719093 () Bool)

(assert (=> b!774681 m!719093))

(declare-fun m!719095 () Bool)

(assert (=> b!774675 m!719095))

(assert (=> b!774676 m!719075))

(assert (=> b!774676 m!719075))

(assert (=> b!774676 m!719079))

(assert (=> b!774676 m!719075))

(assert (=> b!774676 m!719093))

(declare-fun m!719097 () Bool)

(assert (=> b!774692 m!719097))

(assert (=> b!774693 m!719075))

(assert (=> b!774693 m!719075))

(declare-fun m!719099 () Bool)

(assert (=> b!774693 m!719099))

(declare-fun m!719101 () Bool)

(assert (=> b!774689 m!719101))

(declare-fun m!719103 () Bool)

(assert (=> b!774689 m!719103))

(declare-fun m!719105 () Bool)

(assert (=> b!774687 m!719105))

(declare-fun m!719107 () Bool)

(assert (=> b!774673 m!719107))

(declare-fun m!719109 () Bool)

(assert (=> b!774691 m!719109))

(declare-fun m!719111 () Bool)

(assert (=> b!774691 m!719111))

(declare-fun m!719113 () Bool)

(assert (=> b!774691 m!719113))

(declare-fun m!719115 () Bool)

(assert (=> b!774691 m!719115))

(assert (=> b!774691 m!719111))

(declare-fun m!719117 () Bool)

(assert (=> b!774691 m!719117))

(declare-fun m!719119 () Bool)

(assert (=> b!774685 m!719119))

(declare-fun m!719121 () Bool)

(assert (=> start!67108 m!719121))

(declare-fun m!719123 () Bool)

(assert (=> start!67108 m!719123))

(assert (=> b!774679 m!719075))

(assert (=> b!774679 m!719075))

(assert (=> b!774679 m!719085))

(declare-fun m!719125 () Bool)

(assert (=> b!774695 m!719125))

(assert (=> b!774682 m!719075))

(assert (=> b!774682 m!719075))

(declare-fun m!719127 () Bool)

(assert (=> b!774682 m!719127))

(push 1)

(assert (not b!774682))

(assert (not b!774679))

(assert (not b!774675))

(assert (not b!774696))

(assert (not b!774689))

(assert (not b!774680))

(assert (not b!774681))

(assert (not b!774688))

(assert (not b!774674))

(assert (not b!774676))

(assert (not b!774693))

(assert (not b!774692))

(assert (not b!774673))

(assert (not b!774677))

(assert (not b!774691))

(assert (not start!67108))

(assert (not b!774690))

(assert (not b!774687))

(assert (not b!774695))

(assert (not b!774683))

(check-sat)

(pop 1)

(push 1)

(check-sat)


; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65570 () Bool)

(assert start!65570)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41760 0))(
  ( (array!41761 (arr!19994 (Array (_ BitVec 32) (_ BitVec 64))) (size!20415 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41760)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!749597 () Bool)

(declare-fun e!418240 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7591 0))(
  ( (MissingZero!7591 (index!32732 (_ BitVec 32))) (Found!7591 (index!32733 (_ BitVec 32))) (Intermediate!7591 (undefined!8403 Bool) (index!32734 (_ BitVec 32)) (x!63672 (_ BitVec 32))) (Undefined!7591) (MissingVacant!7591 (index!32735 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41760 (_ BitVec 32)) SeekEntryResult!7591)

(assert (=> b!749597 (= e!418240 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19994 a!3186) j!159) a!3186 mask!3328) (Found!7591 j!159)))))

(declare-fun b!749598 () Bool)

(declare-fun res!505902 () Bool)

(declare-fun e!418249 () Bool)

(assert (=> b!749598 (=> (not res!505902) (not e!418249))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!749598 (= res!505902 (validKeyInArray!0 (select (arr!19994 a!3186) j!159)))))

(declare-fun b!749599 () Bool)

(declare-datatypes ((Unit!25724 0))(
  ( (Unit!25725) )
))
(declare-fun e!418243 () Unit!25724)

(declare-fun Unit!25726 () Unit!25724)

(assert (=> b!749599 (= e!418243 Unit!25726)))

(assert (=> b!749599 false))

(declare-fun lt!333152 () SeekEntryResult!7591)

(declare-fun b!749600 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41760 (_ BitVec 32)) SeekEntryResult!7591)

(assert (=> b!749600 (= e!418240 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19994 a!3186) j!159) a!3186 mask!3328) lt!333152))))

(declare-fun b!749601 () Bool)

(declare-fun e!418248 () Bool)

(declare-fun e!418244 () Bool)

(assert (=> b!749601 (= e!418248 (not e!418244))))

(declare-fun res!505909 () Bool)

(assert (=> b!749601 (=> res!505909 e!418244)))

(declare-fun lt!333149 () SeekEntryResult!7591)

(get-info :version)

(assert (=> b!749601 (= res!505909 (or (not ((_ is Intermediate!7591) lt!333149)) (bvslt x!1131 (x!63672 lt!333149)) (not (= x!1131 (x!63672 lt!333149))) (not (= index!1321 (index!32734 lt!333149)))))))

(declare-fun e!418239 () Bool)

(assert (=> b!749601 e!418239))

(declare-fun res!505908 () Bool)

(assert (=> b!749601 (=> (not res!505908) (not e!418239))))

(declare-fun lt!333153 () SeekEntryResult!7591)

(declare-fun lt!333148 () SeekEntryResult!7591)

(assert (=> b!749601 (= res!505908 (= lt!333153 lt!333148))))

(assert (=> b!749601 (= lt!333148 (Found!7591 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41760 (_ BitVec 32)) SeekEntryResult!7591)

(assert (=> b!749601 (= lt!333153 (seekEntryOrOpen!0 (select (arr!19994 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41760 (_ BitVec 32)) Bool)

(assert (=> b!749601 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!333151 () Unit!25724)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41760 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25724)

(assert (=> b!749601 (= lt!333151 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!749602 () Bool)

(declare-fun res!505901 () Bool)

(assert (=> b!749602 (=> (not res!505901) (not e!418249))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!749602 (= res!505901 (and (= (size!20415 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20415 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20415 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!749603 () Bool)

(declare-fun res!505900 () Bool)

(declare-fun e!418247 () Bool)

(assert (=> b!749603 (=> (not res!505900) (not e!418247))))

(declare-datatypes ((List!14035 0))(
  ( (Nil!14032) (Cons!14031 (h!15103 (_ BitVec 64)) (t!20341 List!14035)) )
))
(declare-fun arrayNoDuplicates!0 (array!41760 (_ BitVec 32) List!14035) Bool)

(assert (=> b!749603 (= res!505900 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14032))))

(declare-fun b!749604 () Bool)

(declare-fun res!505916 () Bool)

(declare-fun e!418242 () Bool)

(assert (=> b!749604 (=> (not res!505916) (not e!418242))))

(assert (=> b!749604 (= res!505916 e!418240)))

(declare-fun c!82229 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!749604 (= c!82229 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!505915 () Bool)

(assert (=> start!65570 (=> (not res!505915) (not e!418249))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65570 (= res!505915 (validMask!0 mask!3328))))

(assert (=> start!65570 e!418249))

(assert (=> start!65570 true))

(declare-fun array_inv!15877 (array!41760) Bool)

(assert (=> start!65570 (array_inv!15877 a!3186)))

(declare-fun b!749605 () Bool)

(declare-fun res!505907 () Bool)

(assert (=> b!749605 (=> res!505907 e!418244)))

(assert (=> b!749605 (= res!505907 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19994 a!3186) j!159) a!3186 mask!3328) lt!333148)))))

(declare-fun b!749606 () Bool)

(assert (=> b!749606 (= e!418242 e!418248)))

(declare-fun res!505914 () Bool)

(assert (=> b!749606 (=> (not res!505914) (not e!418248))))

(declare-fun lt!333146 () SeekEntryResult!7591)

(assert (=> b!749606 (= res!505914 (= lt!333146 lt!333149))))

(declare-fun lt!333155 () array!41760)

(declare-fun lt!333154 () (_ BitVec 64))

(assert (=> b!749606 (= lt!333149 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333154 lt!333155 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!749606 (= lt!333146 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333154 mask!3328) lt!333154 lt!333155 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!749606 (= lt!333154 (select (store (arr!19994 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!749606 (= lt!333155 (array!41761 (store (arr!19994 a!3186) i!1173 k0!2102) (size!20415 a!3186)))))

(declare-fun b!749607 () Bool)

(assert (=> b!749607 (= e!418239 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19994 a!3186) j!159) a!3186 mask!3328) lt!333148))))

(declare-fun b!749608 () Bool)

(assert (=> b!749608 (= e!418247 e!418242)))

(declare-fun res!505913 () Bool)

(assert (=> b!749608 (=> (not res!505913) (not e!418242))))

(assert (=> b!749608 (= res!505913 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19994 a!3186) j!159) mask!3328) (select (arr!19994 a!3186) j!159) a!3186 mask!3328) lt!333152))))

(assert (=> b!749608 (= lt!333152 (Intermediate!7591 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!749609 () Bool)

(declare-fun res!505906 () Bool)

(assert (=> b!749609 (=> (not res!505906) (not e!418249))))

(assert (=> b!749609 (= res!505906 (validKeyInArray!0 k0!2102))))

(declare-fun b!749610 () Bool)

(declare-fun res!505912 () Bool)

(assert (=> b!749610 (=> (not res!505912) (not e!418249))))

(declare-fun arrayContainsKey!0 (array!41760 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!749610 (= res!505912 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!749611 () Bool)

(declare-fun res!505911 () Bool)

(assert (=> b!749611 (=> (not res!505911) (not e!418242))))

(assert (=> b!749611 (= res!505911 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19994 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!749612 () Bool)

(declare-fun Unit!25727 () Unit!25724)

(assert (=> b!749612 (= e!418243 Unit!25727)))

(declare-fun b!749613 () Bool)

(declare-fun e!418246 () Bool)

(assert (=> b!749613 (= e!418244 e!418246)))

(declare-fun res!505910 () Bool)

(assert (=> b!749613 (=> res!505910 e!418246)))

(declare-fun lt!333150 () (_ BitVec 64))

(assert (=> b!749613 (= res!505910 (= lt!333150 lt!333154))))

(assert (=> b!749613 (= lt!333150 (select (store (arr!19994 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!749614 () Bool)

(declare-fun res!505904 () Bool)

(assert (=> b!749614 (=> (not res!505904) (not e!418247))))

(assert (=> b!749614 (= res!505904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!749615 () Bool)

(assert (=> b!749615 (= e!418246 true)))

(declare-fun e!418245 () Bool)

(assert (=> b!749615 e!418245))

(declare-fun res!505905 () Bool)

(assert (=> b!749615 (=> (not res!505905) (not e!418245))))

(assert (=> b!749615 (= res!505905 (= lt!333150 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!333145 () Unit!25724)

(assert (=> b!749615 (= lt!333145 e!418243)))

(declare-fun c!82230 () Bool)

(assert (=> b!749615 (= c!82230 (= lt!333150 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!749616 () Bool)

(declare-fun res!505917 () Bool)

(assert (=> b!749616 (=> (not res!505917) (not e!418247))))

(assert (=> b!749616 (= res!505917 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20415 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20415 a!3186))))))

(declare-fun b!749617 () Bool)

(assert (=> b!749617 (= e!418245 (= (seekEntryOrOpen!0 lt!333154 lt!333155 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!333154 lt!333155 mask!3328)))))

(declare-fun b!749618 () Bool)

(assert (=> b!749618 (= e!418249 e!418247)))

(declare-fun res!505903 () Bool)

(assert (=> b!749618 (=> (not res!505903) (not e!418247))))

(declare-fun lt!333147 () SeekEntryResult!7591)

(assert (=> b!749618 (= res!505903 (or (= lt!333147 (MissingZero!7591 i!1173)) (= lt!333147 (MissingVacant!7591 i!1173))))))

(assert (=> b!749618 (= lt!333147 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!65570 res!505915) b!749602))

(assert (= (and b!749602 res!505901) b!749598))

(assert (= (and b!749598 res!505902) b!749609))

(assert (= (and b!749609 res!505906) b!749610))

(assert (= (and b!749610 res!505912) b!749618))

(assert (= (and b!749618 res!505903) b!749614))

(assert (= (and b!749614 res!505904) b!749603))

(assert (= (and b!749603 res!505900) b!749616))

(assert (= (and b!749616 res!505917) b!749608))

(assert (= (and b!749608 res!505913) b!749611))

(assert (= (and b!749611 res!505911) b!749604))

(assert (= (and b!749604 c!82229) b!749600))

(assert (= (and b!749604 (not c!82229)) b!749597))

(assert (= (and b!749604 res!505916) b!749606))

(assert (= (and b!749606 res!505914) b!749601))

(assert (= (and b!749601 res!505908) b!749607))

(assert (= (and b!749601 (not res!505909)) b!749605))

(assert (= (and b!749605 (not res!505907)) b!749613))

(assert (= (and b!749613 (not res!505910)) b!749615))

(assert (= (and b!749615 c!82230) b!749599))

(assert (= (and b!749615 (not c!82230)) b!749612))

(assert (= (and b!749615 res!505905) b!749617))

(declare-fun m!698609 () Bool)

(assert (=> b!749598 m!698609))

(assert (=> b!749598 m!698609))

(declare-fun m!698611 () Bool)

(assert (=> b!749598 m!698611))

(assert (=> b!749601 m!698609))

(assert (=> b!749601 m!698609))

(declare-fun m!698613 () Bool)

(assert (=> b!749601 m!698613))

(declare-fun m!698615 () Bool)

(assert (=> b!749601 m!698615))

(declare-fun m!698617 () Bool)

(assert (=> b!749601 m!698617))

(assert (=> b!749605 m!698609))

(assert (=> b!749605 m!698609))

(declare-fun m!698619 () Bool)

(assert (=> b!749605 m!698619))

(assert (=> b!749600 m!698609))

(assert (=> b!749600 m!698609))

(declare-fun m!698621 () Bool)

(assert (=> b!749600 m!698621))

(assert (=> b!749607 m!698609))

(assert (=> b!749607 m!698609))

(declare-fun m!698623 () Bool)

(assert (=> b!749607 m!698623))

(declare-fun m!698625 () Bool)

(assert (=> start!65570 m!698625))

(declare-fun m!698627 () Bool)

(assert (=> start!65570 m!698627))

(declare-fun m!698629 () Bool)

(assert (=> b!749609 m!698629))

(declare-fun m!698631 () Bool)

(assert (=> b!749617 m!698631))

(declare-fun m!698633 () Bool)

(assert (=> b!749617 m!698633))

(declare-fun m!698635 () Bool)

(assert (=> b!749618 m!698635))

(declare-fun m!698637 () Bool)

(assert (=> b!749611 m!698637))

(declare-fun m!698639 () Bool)

(assert (=> b!749614 m!698639))

(declare-fun m!698641 () Bool)

(assert (=> b!749603 m!698641))

(declare-fun m!698643 () Bool)

(assert (=> b!749610 m!698643))

(declare-fun m!698645 () Bool)

(assert (=> b!749613 m!698645))

(declare-fun m!698647 () Bool)

(assert (=> b!749613 m!698647))

(assert (=> b!749606 m!698645))

(declare-fun m!698649 () Bool)

(assert (=> b!749606 m!698649))

(declare-fun m!698651 () Bool)

(assert (=> b!749606 m!698651))

(declare-fun m!698653 () Bool)

(assert (=> b!749606 m!698653))

(assert (=> b!749606 m!698653))

(declare-fun m!698655 () Bool)

(assert (=> b!749606 m!698655))

(assert (=> b!749597 m!698609))

(assert (=> b!749597 m!698609))

(assert (=> b!749597 m!698619))

(assert (=> b!749608 m!698609))

(assert (=> b!749608 m!698609))

(declare-fun m!698657 () Bool)

(assert (=> b!749608 m!698657))

(assert (=> b!749608 m!698657))

(assert (=> b!749608 m!698609))

(declare-fun m!698659 () Bool)

(assert (=> b!749608 m!698659))

(check-sat (not b!749608) (not b!749607) (not b!749601) (not b!749617) (not start!65570) (not b!749603) (not b!749598) (not b!749605) (not b!749618) (not b!749606) (not b!749610) (not b!749597) (not b!749614) (not b!749609) (not b!749600))
(check-sat)

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65586 () Bool)

(assert start!65586)

(declare-fun e!418330 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7593 0))(
  ( (MissingZero!7593 (index!32740 (_ BitVec 32))) (Found!7593 (index!32741 (_ BitVec 32))) (Intermediate!7593 (undefined!8405 Bool) (index!32742 (_ BitVec 32)) (x!63671 (_ BitVec 32))) (Undefined!7593) (MissingVacant!7593 (index!32743 (_ BitVec 32))) )
))
(declare-fun lt!333321 () SeekEntryResult!7593)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!41759 0))(
  ( (array!41760 (arr!19993 (Array (_ BitVec 32) (_ BitVec 64))) (size!20414 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41759)

(declare-fun b!749715 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41759 (_ BitVec 32)) SeekEntryResult!7593)

(assert (=> b!749715 (= e!418330 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19993 a!3186) j!159) a!3186 mask!3328) lt!333321))))

(declare-fun b!749716 () Bool)

(declare-fun e!418334 () Bool)

(declare-fun e!418333 () Bool)

(assert (=> b!749716 (= e!418334 e!418333)))

(declare-fun res!505904 () Bool)

(assert (=> b!749716 (=> (not res!505904) (not e!418333))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!749716 (= res!505904 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19993 a!3186) j!159) mask!3328) (select (arr!19993 a!3186) j!159) a!3186 mask!3328) lt!333321))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!749716 (= lt!333321 (Intermediate!7593 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!749717 () Bool)

(declare-fun res!505912 () Bool)

(assert (=> b!749717 (=> (not res!505912) (not e!418334))))

(assert (=> b!749717 (= res!505912 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20414 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20414 a!3186))))))

(declare-fun b!749718 () Bool)

(declare-fun e!418328 () Bool)

(declare-fun e!418329 () Bool)

(assert (=> b!749718 (= e!418328 e!418329)))

(declare-fun res!505915 () Bool)

(assert (=> b!749718 (=> res!505915 e!418329)))

(declare-fun lt!333325 () (_ BitVec 64))

(declare-fun lt!333329 () (_ BitVec 64))

(assert (=> b!749718 (= res!505915 (= lt!333325 lt!333329))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!749718 (= lt!333325 (select (store (arr!19993 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!749719 () Bool)

(declare-fun e!418335 () Bool)

(assert (=> b!749719 (= e!418335 (not e!418328))))

(declare-fun res!505918 () Bool)

(assert (=> b!749719 (=> res!505918 e!418328)))

(declare-fun lt!333320 () SeekEntryResult!7593)

(get-info :version)

(assert (=> b!749719 (= res!505918 (or (not ((_ is Intermediate!7593) lt!333320)) (bvslt x!1131 (x!63671 lt!333320)) (not (= x!1131 (x!63671 lt!333320))) (not (= index!1321 (index!32742 lt!333320)))))))

(declare-fun e!418332 () Bool)

(assert (=> b!749719 e!418332))

(declare-fun res!505902 () Bool)

(assert (=> b!749719 (=> (not res!505902) (not e!418332))))

(declare-fun lt!333322 () SeekEntryResult!7593)

(declare-fun lt!333328 () SeekEntryResult!7593)

(assert (=> b!749719 (= res!505902 (= lt!333322 lt!333328))))

(assert (=> b!749719 (= lt!333328 (Found!7593 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41759 (_ BitVec 32)) SeekEntryResult!7593)

(assert (=> b!749719 (= lt!333322 (seekEntryOrOpen!0 (select (arr!19993 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41759 (_ BitVec 32)) Bool)

(assert (=> b!749719 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25752 0))(
  ( (Unit!25753) )
))
(declare-fun lt!333324 () Unit!25752)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41759 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25752)

(assert (=> b!749719 (= lt!333324 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!505917 () Bool)

(declare-fun e!418336 () Bool)

(assert (=> start!65586 (=> (not res!505917) (not e!418336))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65586 (= res!505917 (validMask!0 mask!3328))))

(assert (=> start!65586 e!418336))

(assert (=> start!65586 true))

(declare-fun array_inv!15789 (array!41759) Bool)

(assert (=> start!65586 (array_inv!15789 a!3186)))

(declare-fun b!749720 () Bool)

(declare-fun res!505916 () Bool)

(assert (=> b!749720 (=> (not res!505916) (not e!418334))))

(declare-datatypes ((List!13995 0))(
  ( (Nil!13992) (Cons!13991 (h!15063 (_ BitVec 64)) (t!20310 List!13995)) )
))
(declare-fun arrayNoDuplicates!0 (array!41759 (_ BitVec 32) List!13995) Bool)

(assert (=> b!749720 (= res!505916 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13992))))

(declare-fun b!749721 () Bool)

(assert (=> b!749721 (= e!418336 e!418334)))

(declare-fun res!505906 () Bool)

(assert (=> b!749721 (=> (not res!505906) (not e!418334))))

(declare-fun lt!333323 () SeekEntryResult!7593)

(assert (=> b!749721 (= res!505906 (or (= lt!333323 (MissingZero!7593 i!1173)) (= lt!333323 (MissingVacant!7593 i!1173))))))

(assert (=> b!749721 (= lt!333323 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!749722 () Bool)

(declare-fun e!418331 () Unit!25752)

(declare-fun Unit!25754 () Unit!25752)

(assert (=> b!749722 (= e!418331 Unit!25754)))

(assert (=> b!749722 false))

(declare-fun b!749723 () Bool)

(declare-fun res!505913 () Bool)

(assert (=> b!749723 (=> (not res!505913) (not e!418333))))

(assert (=> b!749723 (= res!505913 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19993 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!749724 () Bool)

(declare-fun res!505914 () Bool)

(assert (=> b!749724 (=> (not res!505914) (not e!418336))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!749724 (= res!505914 (validKeyInArray!0 (select (arr!19993 a!3186) j!159)))))

(declare-fun b!749725 () Bool)

(declare-fun res!505910 () Bool)

(assert (=> b!749725 (=> (not res!505910) (not e!418336))))

(assert (=> b!749725 (= res!505910 (validKeyInArray!0 k0!2102))))

(declare-fun lt!333326 () array!41759)

(declare-fun e!418337 () Bool)

(declare-fun b!749726 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41759 (_ BitVec 32)) SeekEntryResult!7593)

(assert (=> b!749726 (= e!418337 (= (seekEntryOrOpen!0 lt!333329 lt!333326 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!333329 lt!333326 mask!3328)))))

(declare-fun b!749727 () Bool)

(declare-fun res!505907 () Bool)

(assert (=> b!749727 (=> (not res!505907) (not e!418336))))

(declare-fun arrayContainsKey!0 (array!41759 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!749727 (= res!505907 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!749728 () Bool)

(declare-fun res!505911 () Bool)

(assert (=> b!749728 (=> res!505911 e!418328)))

(assert (=> b!749728 (= res!505911 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19993 a!3186) j!159) a!3186 mask!3328) lt!333328)))))

(declare-fun b!749729 () Bool)

(declare-fun res!505909 () Bool)

(assert (=> b!749729 (=> (not res!505909) (not e!418333))))

(assert (=> b!749729 (= res!505909 e!418330)))

(declare-fun c!82287 () Bool)

(assert (=> b!749729 (= c!82287 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!749730 () Bool)

(declare-fun Unit!25755 () Unit!25752)

(assert (=> b!749730 (= e!418331 Unit!25755)))

(declare-fun b!749731 () Bool)

(declare-fun res!505903 () Bool)

(assert (=> b!749731 (=> (not res!505903) (not e!418334))))

(assert (=> b!749731 (= res!505903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!749732 () Bool)

(declare-fun res!505919 () Bool)

(assert (=> b!749732 (=> (not res!505919) (not e!418336))))

(assert (=> b!749732 (= res!505919 (and (= (size!20414 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20414 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20414 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!749733 () Bool)

(assert (=> b!749733 (= e!418329 true)))

(assert (=> b!749733 e!418337))

(declare-fun res!505908 () Bool)

(assert (=> b!749733 (=> (not res!505908) (not e!418337))))

(assert (=> b!749733 (= res!505908 (= lt!333325 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!333327 () Unit!25752)

(assert (=> b!749733 (= lt!333327 e!418331)))

(declare-fun c!82288 () Bool)

(assert (=> b!749733 (= c!82288 (= lt!333325 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!749734 () Bool)

(assert (=> b!749734 (= e!418332 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19993 a!3186) j!159) a!3186 mask!3328) lt!333328))))

(declare-fun b!749735 () Bool)

(assert (=> b!749735 (= e!418333 e!418335)))

(declare-fun res!505905 () Bool)

(assert (=> b!749735 (=> (not res!505905) (not e!418335))))

(declare-fun lt!333319 () SeekEntryResult!7593)

(assert (=> b!749735 (= res!505905 (= lt!333319 lt!333320))))

(assert (=> b!749735 (= lt!333320 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333329 lt!333326 mask!3328))))

(assert (=> b!749735 (= lt!333319 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333329 mask!3328) lt!333329 lt!333326 mask!3328))))

(assert (=> b!749735 (= lt!333329 (select (store (arr!19993 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!749735 (= lt!333326 (array!41760 (store (arr!19993 a!3186) i!1173 k0!2102) (size!20414 a!3186)))))

(declare-fun b!749736 () Bool)

(assert (=> b!749736 (= e!418330 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19993 a!3186) j!159) a!3186 mask!3328) (Found!7593 j!159)))))

(assert (= (and start!65586 res!505917) b!749732))

(assert (= (and b!749732 res!505919) b!749724))

(assert (= (and b!749724 res!505914) b!749725))

(assert (= (and b!749725 res!505910) b!749727))

(assert (= (and b!749727 res!505907) b!749721))

(assert (= (and b!749721 res!505906) b!749731))

(assert (= (and b!749731 res!505903) b!749720))

(assert (= (and b!749720 res!505916) b!749717))

(assert (= (and b!749717 res!505912) b!749716))

(assert (= (and b!749716 res!505904) b!749723))

(assert (= (and b!749723 res!505913) b!749729))

(assert (= (and b!749729 c!82287) b!749715))

(assert (= (and b!749729 (not c!82287)) b!749736))

(assert (= (and b!749729 res!505909) b!749735))

(assert (= (and b!749735 res!505905) b!749719))

(assert (= (and b!749719 res!505902) b!749734))

(assert (= (and b!749719 (not res!505918)) b!749728))

(assert (= (and b!749728 (not res!505911)) b!749718))

(assert (= (and b!749718 (not res!505915)) b!749733))

(assert (= (and b!749733 c!82288) b!749722))

(assert (= (and b!749733 (not c!82288)) b!749730))

(assert (= (and b!749733 res!505908) b!749726))

(declare-fun m!699263 () Bool)

(assert (=> b!749720 m!699263))

(declare-fun m!699265 () Bool)

(assert (=> b!749725 m!699265))

(declare-fun m!699267 () Bool)

(assert (=> b!749715 m!699267))

(assert (=> b!749715 m!699267))

(declare-fun m!699269 () Bool)

(assert (=> b!749715 m!699269))

(declare-fun m!699271 () Bool)

(assert (=> b!749721 m!699271))

(declare-fun m!699273 () Bool)

(assert (=> b!749727 m!699273))

(assert (=> b!749736 m!699267))

(assert (=> b!749736 m!699267))

(declare-fun m!699275 () Bool)

(assert (=> b!749736 m!699275))

(declare-fun m!699277 () Bool)

(assert (=> start!65586 m!699277))

(declare-fun m!699279 () Bool)

(assert (=> start!65586 m!699279))

(assert (=> b!749728 m!699267))

(assert (=> b!749728 m!699267))

(assert (=> b!749728 m!699275))

(assert (=> b!749716 m!699267))

(assert (=> b!749716 m!699267))

(declare-fun m!699281 () Bool)

(assert (=> b!749716 m!699281))

(assert (=> b!749716 m!699281))

(assert (=> b!749716 m!699267))

(declare-fun m!699283 () Bool)

(assert (=> b!749716 m!699283))

(declare-fun m!699285 () Bool)

(assert (=> b!749726 m!699285))

(declare-fun m!699287 () Bool)

(assert (=> b!749726 m!699287))

(declare-fun m!699289 () Bool)

(assert (=> b!749718 m!699289))

(declare-fun m!699291 () Bool)

(assert (=> b!749718 m!699291))

(declare-fun m!699293 () Bool)

(assert (=> b!749723 m!699293))

(assert (=> b!749719 m!699267))

(assert (=> b!749719 m!699267))

(declare-fun m!699295 () Bool)

(assert (=> b!749719 m!699295))

(declare-fun m!699297 () Bool)

(assert (=> b!749719 m!699297))

(declare-fun m!699299 () Bool)

(assert (=> b!749719 m!699299))

(assert (=> b!749734 m!699267))

(assert (=> b!749734 m!699267))

(declare-fun m!699301 () Bool)

(assert (=> b!749734 m!699301))

(declare-fun m!699303 () Bool)

(assert (=> b!749731 m!699303))

(declare-fun m!699305 () Bool)

(assert (=> b!749735 m!699305))

(declare-fun m!699307 () Bool)

(assert (=> b!749735 m!699307))

(assert (=> b!749735 m!699289))

(assert (=> b!749735 m!699305))

(declare-fun m!699309 () Bool)

(assert (=> b!749735 m!699309))

(declare-fun m!699311 () Bool)

(assert (=> b!749735 m!699311))

(assert (=> b!749724 m!699267))

(assert (=> b!749724 m!699267))

(declare-fun m!699313 () Bool)

(assert (=> b!749724 m!699313))

(check-sat (not b!749725) (not start!65586) (not b!749735) (not b!749734) (not b!749728) (not b!749724) (not b!749727) (not b!749721) (not b!749716) (not b!749726) (not b!749719) (not b!749715) (not b!749736) (not b!749731) (not b!749720))
(check-sat)

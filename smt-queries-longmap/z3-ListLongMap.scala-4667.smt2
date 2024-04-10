; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64920 () Bool)

(assert start!64920)

(declare-fun b!732639 () Bool)

(declare-fun e!409969 () Bool)

(declare-fun e!409966 () Bool)

(assert (=> b!732639 (= e!409969 e!409966)))

(declare-fun res!492212 () Bool)

(assert (=> b!732639 (=> (not res!492212) (not e!409966))))

(declare-datatypes ((array!41231 0))(
  ( (array!41232 (arr!19732 (Array (_ BitVec 32) (_ BitVec 64))) (size!20153 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41231)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7332 0))(
  ( (MissingZero!7332 (index!31696 (_ BitVec 32))) (Found!7332 (index!31697 (_ BitVec 32))) (Intermediate!7332 (undefined!8144 Bool) (index!31698 (_ BitVec 32)) (x!62690 (_ BitVec 32))) (Undefined!7332) (MissingVacant!7332 (index!31699 (_ BitVec 32))) )
))
(declare-fun lt!324671 () SeekEntryResult!7332)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41231 (_ BitVec 32)) SeekEntryResult!7332)

(assert (=> b!732639 (= res!492212 (= (seekEntryOrOpen!0 (select (arr!19732 a!3186) j!159) a!3186 mask!3328) lt!324671))))

(assert (=> b!732639 (= lt!324671 (Found!7332 j!159))))

(declare-fun res!492223 () Bool)

(declare-fun e!409963 () Bool)

(assert (=> start!64920 (=> (not res!492223) (not e!409963))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64920 (= res!492223 (validMask!0 mask!3328))))

(assert (=> start!64920 e!409963))

(assert (=> start!64920 true))

(declare-fun array_inv!15528 (array!41231) Bool)

(assert (=> start!64920 (array_inv!15528 a!3186)))

(declare-fun b!732640 () Bool)

(declare-fun res!492215 () Bool)

(assert (=> b!732640 (=> (not res!492215) (not e!409963))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!732640 (= res!492215 (validKeyInArray!0 k0!2102))))

(declare-fun b!732641 () Bool)

(declare-fun res!492209 () Bool)

(declare-fun e!409970 () Bool)

(assert (=> b!732641 (=> (not res!492209) (not e!409970))))

(declare-datatypes ((List!13734 0))(
  ( (Nil!13731) (Cons!13730 (h!14796 (_ BitVec 64)) (t!20049 List!13734)) )
))
(declare-fun arrayNoDuplicates!0 (array!41231 (_ BitVec 32) List!13734) Bool)

(assert (=> b!732641 (= res!492209 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13731))))

(declare-fun b!732642 () Bool)

(declare-fun e!409965 () Bool)

(assert (=> b!732642 (= e!409965 true)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!324676 () SeekEntryResult!7332)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41231 (_ BitVec 32)) SeekEntryResult!7332)

(assert (=> b!732642 (= lt!324676 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19732 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!732643 () Bool)

(declare-fun e!409964 () Bool)

(assert (=> b!732643 (= e!409964 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19732 a!3186) j!159) a!3186 mask!3328) (Found!7332 j!159)))))

(declare-fun b!732644 () Bool)

(declare-fun res!492220 () Bool)

(assert (=> b!732644 (=> (not res!492220) (not e!409970))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41231 (_ BitVec 32)) Bool)

(assert (=> b!732644 (= res!492220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!732645 () Bool)

(declare-fun res!492211 () Bool)

(assert (=> b!732645 (=> (not res!492211) (not e!409963))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!732645 (= res!492211 (and (= (size!20153 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20153 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20153 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!732646 () Bool)

(declare-fun e!409967 () Bool)

(assert (=> b!732646 (= e!409967 e!409965)))

(declare-fun res!492210 () Bool)

(assert (=> b!732646 (=> res!492210 e!409965)))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!732646 (= res!492210 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!324674 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!732646 (= lt!324674 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!732647 () Bool)

(declare-fun e!409961 () Bool)

(assert (=> b!732647 (= e!409961 (not e!409967))))

(declare-fun res!492222 () Bool)

(assert (=> b!732647 (=> res!492222 e!409967)))

(declare-fun lt!324677 () SeekEntryResult!7332)

(get-info :version)

(assert (=> b!732647 (= res!492222 (or (not ((_ is Intermediate!7332) lt!324677)) (bvsge x!1131 (x!62690 lt!324677))))))

(assert (=> b!732647 e!409969))

(declare-fun res!492219 () Bool)

(assert (=> b!732647 (=> (not res!492219) (not e!409969))))

(assert (=> b!732647 (= res!492219 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24982 0))(
  ( (Unit!24983) )
))
(declare-fun lt!324675 () Unit!24982)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41231 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24982)

(assert (=> b!732647 (= lt!324675 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!732648 () Bool)

(declare-fun e!409968 () Bool)

(assert (=> b!732648 (= e!409970 e!409968)))

(declare-fun res!492221 () Bool)

(assert (=> b!732648 (=> (not res!492221) (not e!409968))))

(declare-fun lt!324669 () SeekEntryResult!7332)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41231 (_ BitVec 32)) SeekEntryResult!7332)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!732648 (= res!492221 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19732 a!3186) j!159) mask!3328) (select (arr!19732 a!3186) j!159) a!3186 mask!3328) lt!324669))))

(assert (=> b!732648 (= lt!324669 (Intermediate!7332 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!732649 () Bool)

(assert (=> b!732649 (= e!409968 e!409961)))

(declare-fun res!492214 () Bool)

(assert (=> b!732649 (=> (not res!492214) (not e!409961))))

(declare-fun lt!324672 () SeekEntryResult!7332)

(assert (=> b!732649 (= res!492214 (= lt!324672 lt!324677))))

(declare-fun lt!324673 () (_ BitVec 64))

(declare-fun lt!324670 () array!41231)

(assert (=> b!732649 (= lt!324677 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!324673 lt!324670 mask!3328))))

(assert (=> b!732649 (= lt!324672 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!324673 mask!3328) lt!324673 lt!324670 mask!3328))))

(assert (=> b!732649 (= lt!324673 (select (store (arr!19732 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!732649 (= lt!324670 (array!41232 (store (arr!19732 a!3186) i!1173 k0!2102) (size!20153 a!3186)))))

(declare-fun b!732650 () Bool)

(declare-fun res!492213 () Bool)

(assert (=> b!732650 (=> (not res!492213) (not e!409968))))

(assert (=> b!732650 (= res!492213 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19732 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!732651 () Bool)

(declare-fun res!492217 () Bool)

(assert (=> b!732651 (=> (not res!492217) (not e!409963))))

(assert (=> b!732651 (= res!492217 (validKeyInArray!0 (select (arr!19732 a!3186) j!159)))))

(declare-fun b!732652 () Bool)

(declare-fun res!492208 () Bool)

(assert (=> b!732652 (=> (not res!492208) (not e!409968))))

(assert (=> b!732652 (= res!492208 e!409964)))

(declare-fun c!80593 () Bool)

(assert (=> b!732652 (= c!80593 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!732653 () Bool)

(declare-fun res!492216 () Bool)

(assert (=> b!732653 (=> (not res!492216) (not e!409970))))

(assert (=> b!732653 (= res!492216 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20153 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20153 a!3186))))))

(declare-fun b!732654 () Bool)

(assert (=> b!732654 (= e!409966 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19732 a!3186) j!159) a!3186 mask!3328) lt!324671))))

(declare-fun b!732655 () Bool)

(declare-fun res!492224 () Bool)

(assert (=> b!732655 (=> (not res!492224) (not e!409963))))

(declare-fun arrayContainsKey!0 (array!41231 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!732655 (= res!492224 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!732656 () Bool)

(assert (=> b!732656 (= e!409963 e!409970)))

(declare-fun res!492218 () Bool)

(assert (=> b!732656 (=> (not res!492218) (not e!409970))))

(declare-fun lt!324668 () SeekEntryResult!7332)

(assert (=> b!732656 (= res!492218 (or (= lt!324668 (MissingZero!7332 i!1173)) (= lt!324668 (MissingVacant!7332 i!1173))))))

(assert (=> b!732656 (= lt!324668 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!732657 () Bool)

(assert (=> b!732657 (= e!409964 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19732 a!3186) j!159) a!3186 mask!3328) lt!324669))))

(assert (= (and start!64920 res!492223) b!732645))

(assert (= (and b!732645 res!492211) b!732651))

(assert (= (and b!732651 res!492217) b!732640))

(assert (= (and b!732640 res!492215) b!732655))

(assert (= (and b!732655 res!492224) b!732656))

(assert (= (and b!732656 res!492218) b!732644))

(assert (= (and b!732644 res!492220) b!732641))

(assert (= (and b!732641 res!492209) b!732653))

(assert (= (and b!732653 res!492216) b!732648))

(assert (= (and b!732648 res!492221) b!732650))

(assert (= (and b!732650 res!492213) b!732652))

(assert (= (and b!732652 c!80593) b!732657))

(assert (= (and b!732652 (not c!80593)) b!732643))

(assert (= (and b!732652 res!492208) b!732649))

(assert (= (and b!732649 res!492214) b!732647))

(assert (= (and b!732647 res!492219) b!732639))

(assert (= (and b!732639 res!492212) b!732654))

(assert (= (and b!732647 (not res!492222)) b!732646))

(assert (= (and b!732646 (not res!492210)) b!732642))

(declare-fun m!685663 () Bool)

(assert (=> b!732643 m!685663))

(assert (=> b!732643 m!685663))

(declare-fun m!685665 () Bool)

(assert (=> b!732643 m!685665))

(declare-fun m!685667 () Bool)

(assert (=> b!732641 m!685667))

(declare-fun m!685669 () Bool)

(assert (=> b!732644 m!685669))

(assert (=> b!732642 m!685663))

(assert (=> b!732642 m!685663))

(assert (=> b!732642 m!685665))

(assert (=> b!732651 m!685663))

(assert (=> b!732651 m!685663))

(declare-fun m!685671 () Bool)

(assert (=> b!732651 m!685671))

(declare-fun m!685673 () Bool)

(assert (=> b!732650 m!685673))

(assert (=> b!732654 m!685663))

(assert (=> b!732654 m!685663))

(declare-fun m!685675 () Bool)

(assert (=> b!732654 m!685675))

(assert (=> b!732648 m!685663))

(assert (=> b!732648 m!685663))

(declare-fun m!685677 () Bool)

(assert (=> b!732648 m!685677))

(assert (=> b!732648 m!685677))

(assert (=> b!732648 m!685663))

(declare-fun m!685679 () Bool)

(assert (=> b!732648 m!685679))

(assert (=> b!732639 m!685663))

(assert (=> b!732639 m!685663))

(declare-fun m!685681 () Bool)

(assert (=> b!732639 m!685681))

(assert (=> b!732657 m!685663))

(assert (=> b!732657 m!685663))

(declare-fun m!685683 () Bool)

(assert (=> b!732657 m!685683))

(declare-fun m!685685 () Bool)

(assert (=> b!732646 m!685685))

(declare-fun m!685687 () Bool)

(assert (=> b!732656 m!685687))

(declare-fun m!685689 () Bool)

(assert (=> b!732640 m!685689))

(declare-fun m!685691 () Bool)

(assert (=> start!64920 m!685691))

(declare-fun m!685693 () Bool)

(assert (=> start!64920 m!685693))

(declare-fun m!685695 () Bool)

(assert (=> b!732655 m!685695))

(declare-fun m!685697 () Bool)

(assert (=> b!732649 m!685697))

(declare-fun m!685699 () Bool)

(assert (=> b!732649 m!685699))

(declare-fun m!685701 () Bool)

(assert (=> b!732649 m!685701))

(declare-fun m!685703 () Bool)

(assert (=> b!732649 m!685703))

(declare-fun m!685705 () Bool)

(assert (=> b!732649 m!685705))

(assert (=> b!732649 m!685697))

(declare-fun m!685707 () Bool)

(assert (=> b!732647 m!685707))

(declare-fun m!685709 () Bool)

(assert (=> b!732647 m!685709))

(check-sat (not b!732646) (not b!732639) (not b!732644) (not b!732640) (not b!732656) (not b!732641) (not b!732657) (not b!732654) (not b!732642) (not start!64920) (not b!732648) (not b!732655) (not b!732647) (not b!732649) (not b!732643) (not b!732651))
(check-sat)

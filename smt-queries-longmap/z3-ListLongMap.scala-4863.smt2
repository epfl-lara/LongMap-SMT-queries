; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67022 () Bool)

(assert start!67022)

(declare-fun b!773675 () Bool)

(declare-fun e!430668 () Bool)

(declare-fun e!430667 () Bool)

(assert (=> b!773675 (= e!430668 e!430667)))

(declare-fun res!523273 () Bool)

(assert (=> b!773675 (=> (not res!523273) (not e!430667))))

(declare-datatypes ((SeekEntryResult!7920 0))(
  ( (MissingZero!7920 (index!34048 (_ BitVec 32))) (Found!7920 (index!34049 (_ BitVec 32))) (Intermediate!7920 (undefined!8732 Bool) (index!34050 (_ BitVec 32)) (x!64987 (_ BitVec 32))) (Undefined!7920) (MissingVacant!7920 (index!34051 (_ BitVec 32))) )
))
(declare-fun lt!344542 () SeekEntryResult!7920)

(declare-fun lt!344552 () SeekEntryResult!7920)

(assert (=> b!773675 (= res!523273 (= lt!344542 lt!344552))))

(declare-fun lt!344543 () (_ BitVec 64))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((array!42446 0))(
  ( (array!42447 (arr!20320 (Array (_ BitVec 32) (_ BitVec 64))) (size!20741 (_ BitVec 32))) )
))
(declare-fun lt!344540 () array!42446)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42446 (_ BitVec 32)) SeekEntryResult!7920)

(assert (=> b!773675 (= lt!344552 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!344543 lt!344540 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!773675 (= lt!344542 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!344543 mask!3328) lt!344543 lt!344540 mask!3328))))

(declare-fun a!3186 () array!42446)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!773675 (= lt!344543 (select (store (arr!20320 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!773675 (= lt!344540 (array!42447 (store (arr!20320 a!3186) i!1173 k0!2102) (size!20741 a!3186)))))

(declare-fun b!773676 () Bool)

(declare-fun e!430663 () Bool)

(declare-fun e!430669 () Bool)

(assert (=> b!773676 (= e!430663 e!430669)))

(declare-fun res!523271 () Bool)

(assert (=> b!773676 (=> (not res!523271) (not e!430669))))

(declare-fun lt!344547 () SeekEntryResult!7920)

(assert (=> b!773676 (= res!523271 (or (= lt!344547 (MissingZero!7920 i!1173)) (= lt!344547 (MissingVacant!7920 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42446 (_ BitVec 32)) SeekEntryResult!7920)

(assert (=> b!773676 (= lt!344547 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!773677 () Bool)

(declare-fun res!523276 () Bool)

(assert (=> b!773677 (=> (not res!523276) (not e!430663))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!773677 (= res!523276 (validKeyInArray!0 (select (arr!20320 a!3186) j!159)))))

(declare-fun b!773678 () Bool)

(assert (=> b!773678 (= e!430669 e!430668)))

(declare-fun res!523265 () Bool)

(assert (=> b!773678 (=> (not res!523265) (not e!430668))))

(declare-fun lt!344550 () SeekEntryResult!7920)

(assert (=> b!773678 (= res!523265 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20320 a!3186) j!159) mask!3328) (select (arr!20320 a!3186) j!159) a!3186 mask!3328) lt!344550))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!773678 (= lt!344550 (Intermediate!7920 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!773679 () Bool)

(declare-datatypes ((Unit!26694 0))(
  ( (Unit!26695) )
))
(declare-fun e!430666 () Unit!26694)

(declare-fun Unit!26696 () Unit!26694)

(assert (=> b!773679 (= e!430666 Unit!26696)))

(declare-fun lt!344549 () (_ BitVec 32))

(assert (=> b!773679 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344549 (select (arr!20320 a!3186) j!159) a!3186 mask!3328) lt!344550)))

(declare-fun e!430672 () Bool)

(declare-fun b!773680 () Bool)

(assert (=> b!773680 (= e!430672 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20320 a!3186) j!159) a!3186 mask!3328) lt!344550))))

(declare-fun b!773681 () Bool)

(declare-fun e!430664 () Bool)

(declare-fun e!430670 () Bool)

(assert (=> b!773681 (= e!430664 e!430670)))

(declare-fun res!523275 () Bool)

(assert (=> b!773681 (=> (not res!523275) (not e!430670))))

(declare-fun lt!344546 () SeekEntryResult!7920)

(assert (=> b!773681 (= res!523275 (= (seekEntryOrOpen!0 (select (arr!20320 a!3186) j!159) a!3186 mask!3328) lt!344546))))

(assert (=> b!773681 (= lt!344546 (Found!7920 j!159))))

(declare-fun b!773682 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42446 (_ BitVec 32)) SeekEntryResult!7920)

(assert (=> b!773682 (= e!430670 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20320 a!3186) j!159) a!3186 mask!3328) lt!344546))))

(declare-fun b!773683 () Bool)

(declare-fun res!523280 () Bool)

(assert (=> b!773683 (=> (not res!523280) (not e!430669))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42446 (_ BitVec 32)) Bool)

(assert (=> b!773683 (= res!523280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!773684 () Bool)

(assert (=> b!773684 (= e!430672 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20320 a!3186) j!159) a!3186 mask!3328) (Found!7920 j!159)))))

(declare-fun b!773686 () Bool)

(declare-fun res!523274 () Bool)

(assert (=> b!773686 (=> (not res!523274) (not e!430663))))

(declare-fun arrayContainsKey!0 (array!42446 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!773686 (= res!523274 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!773687 () Bool)

(declare-fun res!523269 () Bool)

(assert (=> b!773687 (=> (not res!523269) (not e!430663))))

(assert (=> b!773687 (= res!523269 (validKeyInArray!0 k0!2102))))

(declare-fun b!773688 () Bool)

(declare-fun e!430665 () Bool)

(assert (=> b!773688 (= e!430665 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344549 (select (arr!20320 a!3186) j!159) a!3186 mask!3328) lt!344550))))

(declare-fun b!773689 () Bool)

(declare-fun res!523278 () Bool)

(assert (=> b!773689 (=> (not res!523278) (not e!430669))))

(declare-datatypes ((List!14322 0))(
  ( (Nil!14319) (Cons!14318 (h!15423 (_ BitVec 64)) (t!20637 List!14322)) )
))
(declare-fun arrayNoDuplicates!0 (array!42446 (_ BitVec 32) List!14322) Bool)

(assert (=> b!773689 (= res!523278 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14319))))

(declare-fun b!773690 () Bool)

(declare-fun res!523270 () Bool)

(assert (=> b!773690 (=> (not res!523270) (not e!430668))))

(assert (=> b!773690 (= res!523270 e!430672)))

(declare-fun c!85605 () Bool)

(assert (=> b!773690 (= c!85605 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!773691 () Bool)

(declare-fun res!523267 () Bool)

(assert (=> b!773691 (=> (not res!523267) (not e!430668))))

(assert (=> b!773691 (= res!523267 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20320 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!344548 () SeekEntryResult!7920)

(declare-fun b!773692 () Bool)

(assert (=> b!773692 (= e!430665 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344549 resIntermediateIndex!5 (select (arr!20320 a!3186) j!159) a!3186 mask!3328) lt!344548))))

(declare-fun b!773693 () Bool)

(declare-fun e!430673 () Bool)

(declare-fun e!430671 () Bool)

(assert (=> b!773693 (= e!430673 e!430671)))

(declare-fun res!523264 () Bool)

(assert (=> b!773693 (=> res!523264 e!430671)))

(assert (=> b!773693 (= res!523264 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!344549 #b00000000000000000000000000000000) (bvsge lt!344549 (size!20741 a!3186))))))

(declare-fun lt!344541 () Unit!26694)

(assert (=> b!773693 (= lt!344541 e!430666)))

(declare-fun c!85606 () Bool)

(declare-fun lt!344551 () Bool)

(assert (=> b!773693 (= c!85606 lt!344551)))

(assert (=> b!773693 (= lt!344551 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!773693 (= lt!344549 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!773694 () Bool)

(declare-fun res!523266 () Bool)

(assert (=> b!773694 (=> (not res!523266) (not e!430669))))

(assert (=> b!773694 (= res!523266 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20741 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20741 a!3186))))))

(declare-fun b!773695 () Bool)

(assert (=> b!773695 (= e!430667 (not e!430673))))

(declare-fun res!523279 () Bool)

(assert (=> b!773695 (=> res!523279 e!430673)))

(get-info :version)

(assert (=> b!773695 (= res!523279 (or (not ((_ is Intermediate!7920) lt!344552)) (bvsge x!1131 (x!64987 lt!344552))))))

(assert (=> b!773695 (= lt!344548 (Found!7920 j!159))))

(assert (=> b!773695 e!430664))

(declare-fun res!523268 () Bool)

(assert (=> b!773695 (=> (not res!523268) (not e!430664))))

(assert (=> b!773695 (= res!523268 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!344545 () Unit!26694)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42446 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26694)

(assert (=> b!773695 (= lt!344545 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!773696 () Bool)

(declare-fun Unit!26697 () Unit!26694)

(assert (=> b!773696 (= e!430666 Unit!26697)))

(declare-fun lt!344544 () SeekEntryResult!7920)

(assert (=> b!773696 (= lt!344544 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20320 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!773696 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344549 resIntermediateIndex!5 (select (arr!20320 a!3186) j!159) a!3186 mask!3328) lt!344548)))

(declare-fun b!773697 () Bool)

(assert (=> b!773697 (= e!430671 e!430665)))

(declare-fun c!85604 () Bool)

(assert (=> b!773697 (= c!85604 lt!344551)))

(declare-fun b!773685 () Bool)

(declare-fun res!523272 () Bool)

(assert (=> b!773685 (=> (not res!523272) (not e!430663))))

(assert (=> b!773685 (= res!523272 (and (= (size!20741 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20741 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20741 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!523277 () Bool)

(assert (=> start!67022 (=> (not res!523277) (not e!430663))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67022 (= res!523277 (validMask!0 mask!3328))))

(assert (=> start!67022 e!430663))

(assert (=> start!67022 true))

(declare-fun array_inv!16116 (array!42446) Bool)

(assert (=> start!67022 (array_inv!16116 a!3186)))

(assert (= (and start!67022 res!523277) b!773685))

(assert (= (and b!773685 res!523272) b!773677))

(assert (= (and b!773677 res!523276) b!773687))

(assert (= (and b!773687 res!523269) b!773686))

(assert (= (and b!773686 res!523274) b!773676))

(assert (= (and b!773676 res!523271) b!773683))

(assert (= (and b!773683 res!523280) b!773689))

(assert (= (and b!773689 res!523278) b!773694))

(assert (= (and b!773694 res!523266) b!773678))

(assert (= (and b!773678 res!523265) b!773691))

(assert (= (and b!773691 res!523267) b!773690))

(assert (= (and b!773690 c!85605) b!773680))

(assert (= (and b!773690 (not c!85605)) b!773684))

(assert (= (and b!773690 res!523270) b!773675))

(assert (= (and b!773675 res!523273) b!773695))

(assert (= (and b!773695 res!523268) b!773681))

(assert (= (and b!773681 res!523275) b!773682))

(assert (= (and b!773695 (not res!523279)) b!773693))

(assert (= (and b!773693 c!85606) b!773679))

(assert (= (and b!773693 (not c!85606)) b!773696))

(assert (= (and b!773693 (not res!523264)) b!773697))

(assert (= (and b!773697 c!85604) b!773688))

(assert (= (and b!773697 (not c!85604)) b!773692))

(declare-fun m!718359 () Bool)

(assert (=> b!773692 m!718359))

(assert (=> b!773692 m!718359))

(declare-fun m!718361 () Bool)

(assert (=> b!773692 m!718361))

(assert (=> b!773688 m!718359))

(assert (=> b!773688 m!718359))

(declare-fun m!718363 () Bool)

(assert (=> b!773688 m!718363))

(assert (=> b!773680 m!718359))

(assert (=> b!773680 m!718359))

(declare-fun m!718365 () Bool)

(assert (=> b!773680 m!718365))

(declare-fun m!718367 () Bool)

(assert (=> b!773695 m!718367))

(declare-fun m!718369 () Bool)

(assert (=> b!773695 m!718369))

(declare-fun m!718371 () Bool)

(assert (=> b!773676 m!718371))

(assert (=> b!773677 m!718359))

(assert (=> b!773677 m!718359))

(declare-fun m!718373 () Bool)

(assert (=> b!773677 m!718373))

(assert (=> b!773696 m!718359))

(assert (=> b!773696 m!718359))

(declare-fun m!718375 () Bool)

(assert (=> b!773696 m!718375))

(assert (=> b!773696 m!718359))

(assert (=> b!773696 m!718361))

(assert (=> b!773678 m!718359))

(assert (=> b!773678 m!718359))

(declare-fun m!718377 () Bool)

(assert (=> b!773678 m!718377))

(assert (=> b!773678 m!718377))

(assert (=> b!773678 m!718359))

(declare-fun m!718379 () Bool)

(assert (=> b!773678 m!718379))

(assert (=> b!773679 m!718359))

(assert (=> b!773679 m!718359))

(assert (=> b!773679 m!718363))

(declare-fun m!718381 () Bool)

(assert (=> b!773683 m!718381))

(assert (=> b!773681 m!718359))

(assert (=> b!773681 m!718359))

(declare-fun m!718383 () Bool)

(assert (=> b!773681 m!718383))

(declare-fun m!718385 () Bool)

(assert (=> b!773693 m!718385))

(declare-fun m!718387 () Bool)

(assert (=> start!67022 m!718387))

(declare-fun m!718389 () Bool)

(assert (=> start!67022 m!718389))

(assert (=> b!773682 m!718359))

(assert (=> b!773682 m!718359))

(declare-fun m!718391 () Bool)

(assert (=> b!773682 m!718391))

(declare-fun m!718393 () Bool)

(assert (=> b!773675 m!718393))

(declare-fun m!718395 () Bool)

(assert (=> b!773675 m!718395))

(declare-fun m!718397 () Bool)

(assert (=> b!773675 m!718397))

(assert (=> b!773675 m!718397))

(declare-fun m!718399 () Bool)

(assert (=> b!773675 m!718399))

(declare-fun m!718401 () Bool)

(assert (=> b!773675 m!718401))

(declare-fun m!718403 () Bool)

(assert (=> b!773687 m!718403))

(declare-fun m!718405 () Bool)

(assert (=> b!773686 m!718405))

(assert (=> b!773684 m!718359))

(assert (=> b!773684 m!718359))

(assert (=> b!773684 m!718375))

(declare-fun m!718407 () Bool)

(assert (=> b!773689 m!718407))

(declare-fun m!718409 () Bool)

(assert (=> b!773691 m!718409))

(check-sat (not b!773681) (not b!773682) (not b!773686) (not b!773696) (not b!773684) (not b!773687) (not b!773688) (not b!773695) (not b!773677) (not b!773689) (not b!773678) (not b!773692) (not start!67022) (not b!773675) (not b!773683) (not b!773676) (not b!773679) (not b!773680) (not b!773693))
(check-sat)

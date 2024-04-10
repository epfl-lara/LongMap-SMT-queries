; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65436 () Bool)

(assert start!65436)

(declare-fun b!745227 () Bool)

(declare-fun e!416245 () Bool)

(declare-fun e!416240 () Bool)

(assert (=> b!745227 (= e!416245 e!416240)))

(declare-fun res!502141 () Bool)

(assert (=> b!745227 (=> (not res!502141) (not e!416240))))

(declare-datatypes ((SeekEntryResult!7518 0))(
  ( (MissingZero!7518 (index!32440 (_ BitVec 32))) (Found!7518 (index!32441 (_ BitVec 32))) (Intermediate!7518 (undefined!8330 Bool) (index!32442 (_ BitVec 32)) (x!63396 (_ BitVec 32))) (Undefined!7518) (MissingVacant!7518 (index!32443 (_ BitVec 32))) )
))
(declare-fun lt!331076 () SeekEntryResult!7518)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!745227 (= res!502141 (or (= lt!331076 (MissingZero!7518 i!1173)) (= lt!331076 (MissingVacant!7518 i!1173))))))

(declare-datatypes ((array!41609 0))(
  ( (array!41610 (arr!19918 (Array (_ BitVec 32) (_ BitVec 64))) (size!20339 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41609)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41609 (_ BitVec 32)) SeekEntryResult!7518)

(assert (=> b!745227 (= lt!331076 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!745228 () Bool)

(declare-fun res!502139 () Bool)

(assert (=> b!745228 (=> (not res!502139) (not e!416245))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!745228 (= res!502139 (validKeyInArray!0 (select (arr!19918 a!3186) j!159)))))

(declare-fun b!745229 () Bool)

(declare-fun res!502127 () Bool)

(declare-fun e!416244 () Bool)

(assert (=> b!745229 (=> (not res!502127) (not e!416244))))

(declare-fun e!416241 () Bool)

(assert (=> b!745229 (= res!502127 e!416241)))

(declare-fun c!81931 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!745229 (= c!81931 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!745230 () Bool)

(declare-fun res!502137 () Bool)

(assert (=> b!745230 (=> (not res!502137) (not e!416245))))

(assert (=> b!745230 (= res!502137 (and (= (size!20339 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20339 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20339 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!745231 () Bool)

(declare-fun res!502135 () Bool)

(assert (=> b!745231 (=> (not res!502135) (not e!416240))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!745231 (= res!502135 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20339 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20339 a!3186))))))

(declare-fun b!745232 () Bool)

(declare-fun res!502138 () Bool)

(assert (=> b!745232 (=> (not res!502138) (not e!416240))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41609 (_ BitVec 32)) Bool)

(assert (=> b!745232 (= res!502138 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!745233 () Bool)

(declare-fun res!502134 () Bool)

(assert (=> b!745233 (=> (not res!502134) (not e!416240))))

(declare-datatypes ((List!13920 0))(
  ( (Nil!13917) (Cons!13916 (h!14988 (_ BitVec 64)) (t!20235 List!13920)) )
))
(declare-fun arrayNoDuplicates!0 (array!41609 (_ BitVec 32) List!13920) Bool)

(assert (=> b!745233 (= res!502134 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13917))))

(declare-fun b!745234 () Bool)

(declare-fun e!416243 () Bool)

(declare-fun e!416246 () Bool)

(assert (=> b!745234 (= e!416243 (not e!416246))))

(declare-fun res!502133 () Bool)

(assert (=> b!745234 (=> res!502133 e!416246)))

(declare-fun lt!331078 () SeekEntryResult!7518)

(get-info :version)

(assert (=> b!745234 (= res!502133 (or (not ((_ is Intermediate!7518) lt!331078)) (bvslt x!1131 (x!63396 lt!331078)) (not (= x!1131 (x!63396 lt!331078))) (not (= index!1321 (index!32442 lt!331078)))))))

(declare-fun e!416238 () Bool)

(assert (=> b!745234 e!416238))

(declare-fun res!502132 () Bool)

(assert (=> b!745234 (=> (not res!502132) (not e!416238))))

(assert (=> b!745234 (= res!502132 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25516 0))(
  ( (Unit!25517) )
))
(declare-fun lt!331073 () Unit!25516)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41609 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25516)

(assert (=> b!745234 (= lt!331073 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!745235 () Bool)

(declare-fun res!502129 () Bool)

(assert (=> b!745235 (=> res!502129 e!416246)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41609 (_ BitVec 32)) SeekEntryResult!7518)

(assert (=> b!745235 (= res!502129 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19918 a!3186) j!159) a!3186 mask!3328) (Found!7518 j!159))))))

(declare-fun b!745236 () Bool)

(declare-fun res!502140 () Bool)

(assert (=> b!745236 (=> (not res!502140) (not e!416244))))

(assert (=> b!745236 (= res!502140 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19918 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!745237 () Bool)

(declare-fun res!502128 () Bool)

(assert (=> b!745237 (=> (not res!502128) (not e!416245))))

(declare-fun arrayContainsKey!0 (array!41609 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!745237 (= res!502128 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!745239 () Bool)

(assert (=> b!745239 (= e!416241 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19918 a!3186) j!159) a!3186 mask!3328) (Found!7518 j!159)))))

(declare-fun b!745240 () Bool)

(assert (=> b!745240 (= e!416244 e!416243)))

(declare-fun res!502130 () Bool)

(assert (=> b!745240 (=> (not res!502130) (not e!416243))))

(declare-fun lt!331075 () SeekEntryResult!7518)

(assert (=> b!745240 (= res!502130 (= lt!331075 lt!331078))))

(declare-fun lt!331079 () array!41609)

(declare-fun lt!331072 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41609 (_ BitVec 32)) SeekEntryResult!7518)

(assert (=> b!745240 (= lt!331078 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331072 lt!331079 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!745240 (= lt!331075 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331072 mask!3328) lt!331072 lt!331079 mask!3328))))

(assert (=> b!745240 (= lt!331072 (select (store (arr!19918 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!745240 (= lt!331079 (array!41610 (store (arr!19918 a!3186) i!1173 k0!2102) (size!20339 a!3186)))))

(declare-fun b!745241 () Bool)

(declare-fun lt!331074 () SeekEntryResult!7518)

(declare-fun e!416239 () Bool)

(assert (=> b!745241 (= e!416239 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19918 a!3186) j!159) a!3186 mask!3328) lt!331074))))

(declare-fun b!745242 () Bool)

(assert (=> b!745242 (= e!416246 (or (= (select (store (arr!19918 a!3186) i!1173 k0!2102) index!1321) lt!331072) (not (= (select (store (arr!19918 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvslt resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun b!745243 () Bool)

(assert (=> b!745243 (= e!416240 e!416244)))

(declare-fun res!502136 () Bool)

(assert (=> b!745243 (=> (not res!502136) (not e!416244))))

(declare-fun lt!331077 () SeekEntryResult!7518)

(assert (=> b!745243 (= res!502136 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19918 a!3186) j!159) mask!3328) (select (arr!19918 a!3186) j!159) a!3186 mask!3328) lt!331077))))

(assert (=> b!745243 (= lt!331077 (Intermediate!7518 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!745244 () Bool)

(assert (=> b!745244 (= e!416241 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19918 a!3186) j!159) a!3186 mask!3328) lt!331077))))

(declare-fun b!745245 () Bool)

(declare-fun res!502142 () Bool)

(assert (=> b!745245 (=> (not res!502142) (not e!416245))))

(assert (=> b!745245 (= res!502142 (validKeyInArray!0 k0!2102))))

(declare-fun res!502131 () Bool)

(assert (=> start!65436 (=> (not res!502131) (not e!416245))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65436 (= res!502131 (validMask!0 mask!3328))))

(assert (=> start!65436 e!416245))

(assert (=> start!65436 true))

(declare-fun array_inv!15714 (array!41609) Bool)

(assert (=> start!65436 (array_inv!15714 a!3186)))

(declare-fun b!745238 () Bool)

(assert (=> b!745238 (= e!416238 e!416239)))

(declare-fun res!502126 () Bool)

(assert (=> b!745238 (=> (not res!502126) (not e!416239))))

(assert (=> b!745238 (= res!502126 (= (seekEntryOrOpen!0 (select (arr!19918 a!3186) j!159) a!3186 mask!3328) lt!331074))))

(assert (=> b!745238 (= lt!331074 (Found!7518 j!159))))

(assert (= (and start!65436 res!502131) b!745230))

(assert (= (and b!745230 res!502137) b!745228))

(assert (= (and b!745228 res!502139) b!745245))

(assert (= (and b!745245 res!502142) b!745237))

(assert (= (and b!745237 res!502128) b!745227))

(assert (= (and b!745227 res!502141) b!745232))

(assert (= (and b!745232 res!502138) b!745233))

(assert (= (and b!745233 res!502134) b!745231))

(assert (= (and b!745231 res!502135) b!745243))

(assert (= (and b!745243 res!502136) b!745236))

(assert (= (and b!745236 res!502140) b!745229))

(assert (= (and b!745229 c!81931) b!745244))

(assert (= (and b!745229 (not c!81931)) b!745239))

(assert (= (and b!745229 res!502127) b!745240))

(assert (= (and b!745240 res!502130) b!745234))

(assert (= (and b!745234 res!502132) b!745238))

(assert (= (and b!745238 res!502126) b!745241))

(assert (= (and b!745234 (not res!502133)) b!745235))

(assert (= (and b!745235 (not res!502129)) b!745242))

(declare-fun m!695635 () Bool)

(assert (=> b!745234 m!695635))

(declare-fun m!695637 () Bool)

(assert (=> b!745234 m!695637))

(declare-fun m!695639 () Bool)

(assert (=> b!745236 m!695639))

(declare-fun m!695641 () Bool)

(assert (=> start!65436 m!695641))

(declare-fun m!695643 () Bool)

(assert (=> start!65436 m!695643))

(declare-fun m!695645 () Bool)

(assert (=> b!745241 m!695645))

(assert (=> b!745241 m!695645))

(declare-fun m!695647 () Bool)

(assert (=> b!745241 m!695647))

(assert (=> b!745244 m!695645))

(assert (=> b!745244 m!695645))

(declare-fun m!695649 () Bool)

(assert (=> b!745244 m!695649))

(assert (=> b!745239 m!695645))

(assert (=> b!745239 m!695645))

(declare-fun m!695651 () Bool)

(assert (=> b!745239 m!695651))

(declare-fun m!695653 () Bool)

(assert (=> b!745242 m!695653))

(declare-fun m!695655 () Bool)

(assert (=> b!745242 m!695655))

(assert (=> b!745243 m!695645))

(assert (=> b!745243 m!695645))

(declare-fun m!695657 () Bool)

(assert (=> b!745243 m!695657))

(assert (=> b!745243 m!695657))

(assert (=> b!745243 m!695645))

(declare-fun m!695659 () Bool)

(assert (=> b!745243 m!695659))

(declare-fun m!695661 () Bool)

(assert (=> b!745245 m!695661))

(declare-fun m!695663 () Bool)

(assert (=> b!745232 m!695663))

(declare-fun m!695665 () Bool)

(assert (=> b!745237 m!695665))

(assert (=> b!745228 m!695645))

(assert (=> b!745228 m!695645))

(declare-fun m!695667 () Bool)

(assert (=> b!745228 m!695667))

(assert (=> b!745238 m!695645))

(assert (=> b!745238 m!695645))

(declare-fun m!695669 () Bool)

(assert (=> b!745238 m!695669))

(declare-fun m!695671 () Bool)

(assert (=> b!745227 m!695671))

(assert (=> b!745235 m!695645))

(assert (=> b!745235 m!695645))

(assert (=> b!745235 m!695651))

(declare-fun m!695673 () Bool)

(assert (=> b!745233 m!695673))

(assert (=> b!745240 m!695653))

(declare-fun m!695675 () Bool)

(assert (=> b!745240 m!695675))

(declare-fun m!695677 () Bool)

(assert (=> b!745240 m!695677))

(assert (=> b!745240 m!695677))

(declare-fun m!695679 () Bool)

(assert (=> b!745240 m!695679))

(declare-fun m!695681 () Bool)

(assert (=> b!745240 m!695681))

(check-sat (not b!745235) (not b!745245) (not b!745228) (not b!745227) (not b!745233) (not start!65436) (not b!745240) (not b!745238) (not b!745232) (not b!745239) (not b!745234) (not b!745243) (not b!745244) (not b!745241) (not b!745237))
(check-sat)

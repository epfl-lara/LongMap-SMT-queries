; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64170 () Bool)

(assert start!64170)

(declare-fun b!720504 () Bool)

(declare-fun e!404171 () Bool)

(declare-fun e!404170 () Bool)

(assert (=> b!720504 (= e!404171 e!404170)))

(declare-fun res!482732 () Bool)

(assert (=> b!720504 (=> (not res!482732) (not e!404170))))

(declare-datatypes ((SeekEntryResult!7078 0))(
  ( (MissingZero!7078 (index!30680 (_ BitVec 32))) (Found!7078 (index!30681 (_ BitVec 32))) (Intermediate!7078 (undefined!7890 Bool) (index!30682 (_ BitVec 32)) (x!61832 (_ BitVec 32))) (Undefined!7078) (MissingVacant!7078 (index!30683 (_ BitVec 32))) )
))
(declare-fun lt!319850 () SeekEntryResult!7078)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!720504 (= res!482732 (or (= lt!319850 (MissingZero!7078 i!1173)) (= lt!319850 (MissingVacant!7078 i!1173))))))

(declare-datatypes ((array!40798 0))(
  ( (array!40799 (arr!19522 (Array (_ BitVec 32) (_ BitVec 64))) (size!19942 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40798)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40798 (_ BitVec 32)) SeekEntryResult!7078)

(assert (=> b!720504 (= lt!319850 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!720505 () Bool)

(declare-fun res!482734 () Bool)

(assert (=> b!720505 (=> (not res!482734) (not e!404171))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!720505 (= res!482734 (validKeyInArray!0 k0!2102))))

(declare-fun b!720506 () Bool)

(declare-fun res!482735 () Bool)

(assert (=> b!720506 (=> (not res!482735) (not e!404171))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!720506 (= res!482735 (and (= (size!19942 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19942 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19942 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!720507 () Bool)

(declare-fun e!404172 () Bool)

(assert (=> b!720507 (= e!404170 e!404172)))

(declare-fun res!482736 () Bool)

(assert (=> b!720507 (=> (not res!482736) (not e!404172))))

(declare-fun lt!319851 () SeekEntryResult!7078)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40798 (_ BitVec 32)) SeekEntryResult!7078)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!720507 (= res!482736 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19522 a!3186) j!159) mask!3328) (select (arr!19522 a!3186) j!159) a!3186 mask!3328) lt!319851))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!720507 (= lt!319851 (Intermediate!7078 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!482733 () Bool)

(assert (=> start!64170 (=> (not res!482733) (not e!404171))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64170 (= res!482733 (validMask!0 mask!3328))))

(assert (=> start!64170 e!404171))

(assert (=> start!64170 true))

(declare-fun array_inv!15381 (array!40798) Bool)

(assert (=> start!64170 (array_inv!15381 a!3186)))

(declare-fun b!720508 () Bool)

(declare-fun res!482730 () Bool)

(assert (=> b!720508 (=> (not res!482730) (not e!404172))))

(declare-fun e!404168 () Bool)

(assert (=> b!720508 (= res!482730 e!404168)))

(declare-fun c!79259 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!720508 (= c!79259 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!720509 () Bool)

(declare-fun res!482726 () Bool)

(assert (=> b!720509 (=> (not res!482726) (not e!404170))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40798 (_ BitVec 32)) Bool)

(assert (=> b!720509 (= res!482726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!720510 () Bool)

(assert (=> b!720510 (= e!404172 (and (bvsge mask!3328 #b00000000000000000000000000000000) (bvsgt mask!3328 #b00111111111111111111111111111111)))))

(declare-fun b!720511 () Bool)

(declare-fun res!482737 () Bool)

(assert (=> b!720511 (=> (not res!482737) (not e!404170))))

(declare-datatypes ((List!13431 0))(
  ( (Nil!13428) (Cons!13427 (h!14478 (_ BitVec 64)) (t!19738 List!13431)) )
))
(declare-fun arrayNoDuplicates!0 (array!40798 (_ BitVec 32) List!13431) Bool)

(assert (=> b!720511 (= res!482737 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13428))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!720512 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40798 (_ BitVec 32)) SeekEntryResult!7078)

(assert (=> b!720512 (= e!404168 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19522 a!3186) j!159) a!3186 mask!3328) (Found!7078 j!159)))))

(declare-fun b!720513 () Bool)

(declare-fun res!482728 () Bool)

(assert (=> b!720513 (=> (not res!482728) (not e!404170))))

(assert (=> b!720513 (= res!482728 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19942 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19942 a!3186))))))

(declare-fun b!720514 () Bool)

(declare-fun res!482727 () Bool)

(assert (=> b!720514 (=> (not res!482727) (not e!404171))))

(assert (=> b!720514 (= res!482727 (validKeyInArray!0 (select (arr!19522 a!3186) j!159)))))

(declare-fun b!720515 () Bool)

(declare-fun res!482729 () Bool)

(assert (=> b!720515 (=> (not res!482729) (not e!404172))))

(assert (=> b!720515 (= res!482729 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19522 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!720516 () Bool)

(declare-fun res!482731 () Bool)

(assert (=> b!720516 (=> (not res!482731) (not e!404171))))

(declare-fun arrayContainsKey!0 (array!40798 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!720516 (= res!482731 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!720517 () Bool)

(assert (=> b!720517 (= e!404168 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19522 a!3186) j!159) a!3186 mask!3328) lt!319851))))

(assert (= (and start!64170 res!482733) b!720506))

(assert (= (and b!720506 res!482735) b!720514))

(assert (= (and b!720514 res!482727) b!720505))

(assert (= (and b!720505 res!482734) b!720516))

(assert (= (and b!720516 res!482731) b!720504))

(assert (= (and b!720504 res!482732) b!720509))

(assert (= (and b!720509 res!482726) b!720511))

(assert (= (and b!720511 res!482737) b!720513))

(assert (= (and b!720513 res!482728) b!720507))

(assert (= (and b!720507 res!482736) b!720515))

(assert (= (and b!720515 res!482729) b!720508))

(assert (= (and b!720508 c!79259) b!720517))

(assert (= (and b!720508 (not c!79259)) b!720512))

(assert (= (and b!720508 res!482730) b!720510))

(declare-fun m!676263 () Bool)

(assert (=> b!720504 m!676263))

(declare-fun m!676265 () Bool)

(assert (=> start!64170 m!676265))

(declare-fun m!676267 () Bool)

(assert (=> start!64170 m!676267))

(declare-fun m!676269 () Bool)

(assert (=> b!720517 m!676269))

(assert (=> b!720517 m!676269))

(declare-fun m!676271 () Bool)

(assert (=> b!720517 m!676271))

(assert (=> b!720512 m!676269))

(assert (=> b!720512 m!676269))

(declare-fun m!676273 () Bool)

(assert (=> b!720512 m!676273))

(declare-fun m!676275 () Bool)

(assert (=> b!720505 m!676275))

(assert (=> b!720507 m!676269))

(assert (=> b!720507 m!676269))

(declare-fun m!676277 () Bool)

(assert (=> b!720507 m!676277))

(assert (=> b!720507 m!676277))

(assert (=> b!720507 m!676269))

(declare-fun m!676279 () Bool)

(assert (=> b!720507 m!676279))

(declare-fun m!676281 () Bool)

(assert (=> b!720515 m!676281))

(assert (=> b!720514 m!676269))

(assert (=> b!720514 m!676269))

(declare-fun m!676283 () Bool)

(assert (=> b!720514 m!676283))

(declare-fun m!676285 () Bool)

(assert (=> b!720516 m!676285))

(declare-fun m!676287 () Bool)

(assert (=> b!720509 m!676287))

(declare-fun m!676289 () Bool)

(assert (=> b!720511 m!676289))

(check-sat (not b!720511) (not b!720512) (not b!720516) (not b!720507) (not b!720505) (not b!720514) (not b!720504) (not b!720509) (not b!720517) (not start!64170))
(check-sat)
(get-model)

(declare-fun d!99295 () Bool)

(declare-fun lt!319869 () SeekEntryResult!7078)

(get-info :version)

(assert (=> d!99295 (and (or ((_ is Undefined!7078) lt!319869) (not ((_ is Found!7078) lt!319869)) (and (bvsge (index!30681 lt!319869) #b00000000000000000000000000000000) (bvslt (index!30681 lt!319869) (size!19942 a!3186)))) (or ((_ is Undefined!7078) lt!319869) ((_ is Found!7078) lt!319869) (not ((_ is MissingVacant!7078) lt!319869)) (not (= (index!30683 lt!319869) resIntermediateIndex!5)) (and (bvsge (index!30683 lt!319869) #b00000000000000000000000000000000) (bvslt (index!30683 lt!319869) (size!19942 a!3186)))) (or ((_ is Undefined!7078) lt!319869) (ite ((_ is Found!7078) lt!319869) (= (select (arr!19522 a!3186) (index!30681 lt!319869)) (select (arr!19522 a!3186) j!159)) (and ((_ is MissingVacant!7078) lt!319869) (= (index!30683 lt!319869) resIntermediateIndex!5) (= (select (arr!19522 a!3186) (index!30683 lt!319869)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!404221 () SeekEntryResult!7078)

(assert (=> d!99295 (= lt!319869 e!404221)))

(declare-fun c!79276 () Bool)

(assert (=> d!99295 (= c!79276 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!319868 () (_ BitVec 64))

(assert (=> d!99295 (= lt!319868 (select (arr!19522 a!3186) index!1321))))

(assert (=> d!99295 (validMask!0 mask!3328)))

(assert (=> d!99295 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19522 a!3186) j!159) a!3186 mask!3328) lt!319869)))

(declare-fun b!720629 () Bool)

(declare-fun c!79277 () Bool)

(assert (=> b!720629 (= c!79277 (= lt!319868 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!404223 () SeekEntryResult!7078)

(declare-fun e!404222 () SeekEntryResult!7078)

(assert (=> b!720629 (= e!404223 e!404222)))

(declare-fun b!720630 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!720630 (= e!404222 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!19522 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!720631 () Bool)

(assert (=> b!720631 (= e!404221 Undefined!7078)))

(declare-fun b!720632 () Bool)

(assert (=> b!720632 (= e!404223 (Found!7078 index!1321))))

(declare-fun b!720633 () Bool)

(assert (=> b!720633 (= e!404222 (MissingVacant!7078 resIntermediateIndex!5))))

(declare-fun b!720634 () Bool)

(assert (=> b!720634 (= e!404221 e!404223)))

(declare-fun c!79275 () Bool)

(assert (=> b!720634 (= c!79275 (= lt!319868 (select (arr!19522 a!3186) j!159)))))

(assert (= (and d!99295 c!79276) b!720631))

(assert (= (and d!99295 (not c!79276)) b!720634))

(assert (= (and b!720634 c!79275) b!720632))

(assert (= (and b!720634 (not c!79275)) b!720629))

(assert (= (and b!720629 c!79277) b!720633))

(assert (= (and b!720629 (not c!79277)) b!720630))

(declare-fun m!676355 () Bool)

(assert (=> d!99295 m!676355))

(declare-fun m!676357 () Bool)

(assert (=> d!99295 m!676357))

(declare-fun m!676359 () Bool)

(assert (=> d!99295 m!676359))

(assert (=> d!99295 m!676265))

(declare-fun m!676361 () Bool)

(assert (=> b!720630 m!676361))

(assert (=> b!720630 m!676361))

(assert (=> b!720630 m!676269))

(declare-fun m!676363 () Bool)

(assert (=> b!720630 m!676363))

(assert (=> b!720512 d!99295))

(declare-fun b!720674 () Bool)

(declare-fun e!404252 () SeekEntryResult!7078)

(assert (=> b!720674 (= e!404252 (Intermediate!7078 false index!1321 x!1131))))

(declare-fun b!720675 () Bool)

(declare-fun e!404254 () SeekEntryResult!7078)

(assert (=> b!720675 (= e!404254 (Intermediate!7078 true index!1321 x!1131))))

(declare-fun b!720676 () Bool)

(declare-fun lt!319875 () SeekEntryResult!7078)

(assert (=> b!720676 (and (bvsge (index!30682 lt!319875) #b00000000000000000000000000000000) (bvslt (index!30682 lt!319875) (size!19942 a!3186)))))

(declare-fun res!482842 () Bool)

(assert (=> b!720676 (= res!482842 (= (select (arr!19522 a!3186) (index!30682 lt!319875)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!404255 () Bool)

(assert (=> b!720676 (=> res!482842 e!404255)))

(declare-fun b!720677 () Bool)

(assert (=> b!720677 (= e!404254 e!404252)))

(declare-fun c!79289 () Bool)

(declare-fun lt!319874 () (_ BitVec 64))

(assert (=> b!720677 (= c!79289 (or (= lt!319874 (select (arr!19522 a!3186) j!159)) (= (bvadd lt!319874 lt!319874) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!720678 () Bool)

(assert (=> b!720678 (and (bvsge (index!30682 lt!319875) #b00000000000000000000000000000000) (bvslt (index!30682 lt!319875) (size!19942 a!3186)))))

(declare-fun res!482840 () Bool)

(assert (=> b!720678 (= res!482840 (= (select (arr!19522 a!3186) (index!30682 lt!319875)) (select (arr!19522 a!3186) j!159)))))

(assert (=> b!720678 (=> res!482840 e!404255)))

(declare-fun e!404256 () Bool)

(assert (=> b!720678 (= e!404256 e!404255)))

(declare-fun b!720679 () Bool)

(declare-fun e!404253 () Bool)

(assert (=> b!720679 (= e!404253 (bvsge (x!61832 lt!319875) #b01111111111111111111111111111110))))

(declare-fun b!720680 () Bool)

(assert (=> b!720680 (and (bvsge (index!30682 lt!319875) #b00000000000000000000000000000000) (bvslt (index!30682 lt!319875) (size!19942 a!3186)))))

(assert (=> b!720680 (= e!404255 (= (select (arr!19522 a!3186) (index!30682 lt!319875)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!99303 () Bool)

(assert (=> d!99303 e!404253))

(declare-fun c!79288 () Bool)

(assert (=> d!99303 (= c!79288 (and ((_ is Intermediate!7078) lt!319875) (undefined!7890 lt!319875)))))

(assert (=> d!99303 (= lt!319875 e!404254)))

(declare-fun c!79287 () Bool)

(assert (=> d!99303 (= c!79287 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!99303 (= lt!319874 (select (arr!19522 a!3186) index!1321))))

(assert (=> d!99303 (validMask!0 mask!3328)))

(assert (=> d!99303 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19522 a!3186) j!159) a!3186 mask!3328) lt!319875)))

(declare-fun b!720681 () Bool)

(assert (=> b!720681 (= e!404252 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) (select (arr!19522 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!720682 () Bool)

(assert (=> b!720682 (= e!404253 e!404256)))

(declare-fun res!482841 () Bool)

(assert (=> b!720682 (= res!482841 (and ((_ is Intermediate!7078) lt!319875) (not (undefined!7890 lt!319875)) (bvslt (x!61832 lt!319875) #b01111111111111111111111111111110) (bvsge (x!61832 lt!319875) #b00000000000000000000000000000000) (bvsge (x!61832 lt!319875) x!1131)))))

(assert (=> b!720682 (=> (not res!482841) (not e!404256))))

(assert (= (and d!99303 c!79287) b!720675))

(assert (= (and d!99303 (not c!79287)) b!720677))

(assert (= (and b!720677 c!79289) b!720674))

(assert (= (and b!720677 (not c!79289)) b!720681))

(assert (= (and d!99303 c!79288) b!720679))

(assert (= (and d!99303 (not c!79288)) b!720682))

(assert (= (and b!720682 res!482841) b!720678))

(assert (= (and b!720678 (not res!482840)) b!720676))

(assert (= (and b!720676 (not res!482842)) b!720680))

(declare-fun m!676375 () Bool)

(assert (=> b!720680 m!676375))

(assert (=> b!720678 m!676375))

(assert (=> b!720676 m!676375))

(assert (=> d!99303 m!676359))

(assert (=> d!99303 m!676265))

(assert (=> b!720681 m!676361))

(assert (=> b!720681 m!676361))

(assert (=> b!720681 m!676269))

(declare-fun m!676377 () Bool)

(assert (=> b!720681 m!676377))

(assert (=> b!720517 d!99303))

(declare-fun e!404257 () SeekEntryResult!7078)

(declare-fun b!720683 () Bool)

(assert (=> b!720683 (= e!404257 (Intermediate!7078 false (toIndex!0 (select (arr!19522 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!720684 () Bool)

(declare-fun e!404259 () SeekEntryResult!7078)

(assert (=> b!720684 (= e!404259 (Intermediate!7078 true (toIndex!0 (select (arr!19522 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!720685 () Bool)

(declare-fun lt!319877 () SeekEntryResult!7078)

(assert (=> b!720685 (and (bvsge (index!30682 lt!319877) #b00000000000000000000000000000000) (bvslt (index!30682 lt!319877) (size!19942 a!3186)))))

(declare-fun res!482845 () Bool)

(assert (=> b!720685 (= res!482845 (= (select (arr!19522 a!3186) (index!30682 lt!319877)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!404260 () Bool)

(assert (=> b!720685 (=> res!482845 e!404260)))

(declare-fun b!720686 () Bool)

(assert (=> b!720686 (= e!404259 e!404257)))

(declare-fun lt!319876 () (_ BitVec 64))

(declare-fun c!79292 () Bool)

(assert (=> b!720686 (= c!79292 (or (= lt!319876 (select (arr!19522 a!3186) j!159)) (= (bvadd lt!319876 lt!319876) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!720687 () Bool)

(assert (=> b!720687 (and (bvsge (index!30682 lt!319877) #b00000000000000000000000000000000) (bvslt (index!30682 lt!319877) (size!19942 a!3186)))))

(declare-fun res!482843 () Bool)

(assert (=> b!720687 (= res!482843 (= (select (arr!19522 a!3186) (index!30682 lt!319877)) (select (arr!19522 a!3186) j!159)))))

(assert (=> b!720687 (=> res!482843 e!404260)))

(declare-fun e!404261 () Bool)

(assert (=> b!720687 (= e!404261 e!404260)))

(declare-fun b!720688 () Bool)

(declare-fun e!404258 () Bool)

(assert (=> b!720688 (= e!404258 (bvsge (x!61832 lt!319877) #b01111111111111111111111111111110))))

(declare-fun b!720689 () Bool)

(assert (=> b!720689 (and (bvsge (index!30682 lt!319877) #b00000000000000000000000000000000) (bvslt (index!30682 lt!319877) (size!19942 a!3186)))))

(assert (=> b!720689 (= e!404260 (= (select (arr!19522 a!3186) (index!30682 lt!319877)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!99315 () Bool)

(assert (=> d!99315 e!404258))

(declare-fun c!79291 () Bool)

(assert (=> d!99315 (= c!79291 (and ((_ is Intermediate!7078) lt!319877) (undefined!7890 lt!319877)))))

(assert (=> d!99315 (= lt!319877 e!404259)))

(declare-fun c!79290 () Bool)

(assert (=> d!99315 (= c!79290 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!99315 (= lt!319876 (select (arr!19522 a!3186) (toIndex!0 (select (arr!19522 a!3186) j!159) mask!3328)))))

(assert (=> d!99315 (validMask!0 mask!3328)))

(assert (=> d!99315 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19522 a!3186) j!159) mask!3328) (select (arr!19522 a!3186) j!159) a!3186 mask!3328) lt!319877)))

(declare-fun b!720690 () Bool)

(assert (=> b!720690 (= e!404257 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!19522 a!3186) j!159) mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) (select (arr!19522 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!720691 () Bool)

(assert (=> b!720691 (= e!404258 e!404261)))

(declare-fun res!482844 () Bool)

(assert (=> b!720691 (= res!482844 (and ((_ is Intermediate!7078) lt!319877) (not (undefined!7890 lt!319877)) (bvslt (x!61832 lt!319877) #b01111111111111111111111111111110) (bvsge (x!61832 lt!319877) #b00000000000000000000000000000000) (bvsge (x!61832 lt!319877) #b00000000000000000000000000000000)))))

(assert (=> b!720691 (=> (not res!482844) (not e!404261))))

(assert (= (and d!99315 c!79290) b!720684))

(assert (= (and d!99315 (not c!79290)) b!720686))

(assert (= (and b!720686 c!79292) b!720683))

(assert (= (and b!720686 (not c!79292)) b!720690))

(assert (= (and d!99315 c!79291) b!720688))

(assert (= (and d!99315 (not c!79291)) b!720691))

(assert (= (and b!720691 res!482844) b!720687))

(assert (= (and b!720687 (not res!482843)) b!720685))

(assert (= (and b!720685 (not res!482845)) b!720689))

(declare-fun m!676379 () Bool)

(assert (=> b!720689 m!676379))

(assert (=> b!720687 m!676379))

(assert (=> b!720685 m!676379))

(assert (=> d!99315 m!676277))

(declare-fun m!676381 () Bool)

(assert (=> d!99315 m!676381))

(assert (=> d!99315 m!676265))

(assert (=> b!720690 m!676277))

(declare-fun m!676383 () Bool)

(assert (=> b!720690 m!676383))

(assert (=> b!720690 m!676383))

(assert (=> b!720690 m!676269))

(declare-fun m!676385 () Bool)

(assert (=> b!720690 m!676385))

(assert (=> b!720507 d!99315))

(declare-fun d!99317 () Bool)

(declare-fun lt!319887 () (_ BitVec 32))

(declare-fun lt!319886 () (_ BitVec 32))

(assert (=> d!99317 (= lt!319887 (bvmul (bvxor lt!319886 (bvlshr lt!319886 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99317 (= lt!319886 ((_ extract 31 0) (bvand (bvxor (select (arr!19522 a!3186) j!159) (bvlshr (select (arr!19522 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99317 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!482846 (let ((h!14481 ((_ extract 31 0) (bvand (bvxor (select (arr!19522 a!3186) j!159) (bvlshr (select (arr!19522 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!61838 (bvmul (bvxor h!14481 (bvlshr h!14481 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!61838 (bvlshr x!61838 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!482846 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!482846 #b00000000000000000000000000000000))))))

(assert (=> d!99317 (= (toIndex!0 (select (arr!19522 a!3186) j!159) mask!3328) (bvand (bvxor lt!319887 (bvlshr lt!319887 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!720507 d!99317))

(declare-fun d!99319 () Bool)

(declare-fun res!482867 () Bool)

(declare-fun e!404291 () Bool)

(assert (=> d!99319 (=> res!482867 e!404291)))

(assert (=> d!99319 (= res!482867 (= (select (arr!19522 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!99319 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!404291)))

(declare-fun b!720741 () Bool)

(declare-fun e!404292 () Bool)

(assert (=> b!720741 (= e!404291 e!404292)))

(declare-fun res!482868 () Bool)

(assert (=> b!720741 (=> (not res!482868) (not e!404292))))

(assert (=> b!720741 (= res!482868 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19942 a!3186)))))

(declare-fun b!720742 () Bool)

(assert (=> b!720742 (= e!404292 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!99319 (not res!482867)) b!720741))

(assert (= (and b!720741 res!482868) b!720742))

(declare-fun m!676395 () Bool)

(assert (=> d!99319 m!676395))

(declare-fun m!676397 () Bool)

(assert (=> b!720742 m!676397))

(assert (=> b!720516 d!99319))

(declare-fun d!99323 () Bool)

(assert (=> d!99323 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!720505 d!99323))

(declare-fun b!720768 () Bool)

(declare-fun e!404315 () Bool)

(declare-fun e!404312 () Bool)

(assert (=> b!720768 (= e!404315 e!404312)))

(declare-fun c!79313 () Bool)

(assert (=> b!720768 (= c!79313 (validKeyInArray!0 (select (arr!19522 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!720769 () Bool)

(declare-fun call!34767 () Bool)

(assert (=> b!720769 (= e!404312 call!34767)))

(declare-fun d!99325 () Bool)

(declare-fun res!482884 () Bool)

(declare-fun e!404313 () Bool)

(assert (=> d!99325 (=> res!482884 e!404313)))

(assert (=> d!99325 (= res!482884 (bvsge #b00000000000000000000000000000000 (size!19942 a!3186)))))

(assert (=> d!99325 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13428) e!404313)))

(declare-fun b!720770 () Bool)

(assert (=> b!720770 (= e!404312 call!34767)))

(declare-fun bm!34764 () Bool)

(assert (=> bm!34764 (= call!34767 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!79313 (Cons!13427 (select (arr!19522 a!3186) #b00000000000000000000000000000000) Nil!13428) Nil!13428)))))

(declare-fun b!720771 () Bool)

(declare-fun e!404314 () Bool)

(declare-fun contains!4020 (List!13431 (_ BitVec 64)) Bool)

(assert (=> b!720771 (= e!404314 (contains!4020 Nil!13428 (select (arr!19522 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!720772 () Bool)

(assert (=> b!720772 (= e!404313 e!404315)))

(declare-fun res!482886 () Bool)

(assert (=> b!720772 (=> (not res!482886) (not e!404315))))

(assert (=> b!720772 (= res!482886 (not e!404314))))

(declare-fun res!482885 () Bool)

(assert (=> b!720772 (=> (not res!482885) (not e!404314))))

(assert (=> b!720772 (= res!482885 (validKeyInArray!0 (select (arr!19522 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!99325 (not res!482884)) b!720772))

(assert (= (and b!720772 res!482885) b!720771))

(assert (= (and b!720772 res!482886) b!720768))

(assert (= (and b!720768 c!79313) b!720769))

(assert (= (and b!720768 (not c!79313)) b!720770))

(assert (= (or b!720769 b!720770) bm!34764))

(assert (=> b!720768 m!676395))

(assert (=> b!720768 m!676395))

(declare-fun m!676409 () Bool)

(assert (=> b!720768 m!676409))

(assert (=> bm!34764 m!676395))

(declare-fun m!676411 () Bool)

(assert (=> bm!34764 m!676411))

(assert (=> b!720771 m!676395))

(assert (=> b!720771 m!676395))

(declare-fun m!676413 () Bool)

(assert (=> b!720771 m!676413))

(assert (=> b!720772 m!676395))

(assert (=> b!720772 m!676395))

(assert (=> b!720772 m!676409))

(assert (=> b!720511 d!99325))

(declare-fun d!99337 () Bool)

(assert (=> d!99337 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!64170 d!99337))

(declare-fun d!99339 () Bool)

(assert (=> d!99339 (= (array_inv!15381 a!3186) (bvsge (size!19942 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!64170 d!99339))

(declare-fun b!720845 () Bool)

(declare-fun e!404356 () SeekEntryResult!7078)

(declare-fun lt!319936 () SeekEntryResult!7078)

(assert (=> b!720845 (= e!404356 (seekKeyOrZeroReturnVacant!0 (x!61832 lt!319936) (index!30682 lt!319936) (index!30682 lt!319936) k0!2102 a!3186 mask!3328))))

(declare-fun b!720846 () Bool)

(declare-fun e!404357 () SeekEntryResult!7078)

(assert (=> b!720846 (= e!404357 (Found!7078 (index!30682 lt!319936)))))

(declare-fun d!99341 () Bool)

(declare-fun lt!319937 () SeekEntryResult!7078)

(assert (=> d!99341 (and (or ((_ is Undefined!7078) lt!319937) (not ((_ is Found!7078) lt!319937)) (and (bvsge (index!30681 lt!319937) #b00000000000000000000000000000000) (bvslt (index!30681 lt!319937) (size!19942 a!3186)))) (or ((_ is Undefined!7078) lt!319937) ((_ is Found!7078) lt!319937) (not ((_ is MissingZero!7078) lt!319937)) (and (bvsge (index!30680 lt!319937) #b00000000000000000000000000000000) (bvslt (index!30680 lt!319937) (size!19942 a!3186)))) (or ((_ is Undefined!7078) lt!319937) ((_ is Found!7078) lt!319937) ((_ is MissingZero!7078) lt!319937) (not ((_ is MissingVacant!7078) lt!319937)) (and (bvsge (index!30683 lt!319937) #b00000000000000000000000000000000) (bvslt (index!30683 lt!319937) (size!19942 a!3186)))) (or ((_ is Undefined!7078) lt!319937) (ite ((_ is Found!7078) lt!319937) (= (select (arr!19522 a!3186) (index!30681 lt!319937)) k0!2102) (ite ((_ is MissingZero!7078) lt!319937) (= (select (arr!19522 a!3186) (index!30680 lt!319937)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7078) lt!319937) (= (select (arr!19522 a!3186) (index!30683 lt!319937)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!404355 () SeekEntryResult!7078)

(assert (=> d!99341 (= lt!319937 e!404355)))

(declare-fun c!79347 () Bool)

(assert (=> d!99341 (= c!79347 (and ((_ is Intermediate!7078) lt!319936) (undefined!7890 lt!319936)))))

(assert (=> d!99341 (= lt!319936 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!99341 (validMask!0 mask!3328)))

(assert (=> d!99341 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!319937)))

(declare-fun b!720847 () Bool)

(assert (=> b!720847 (= e!404355 Undefined!7078)))

(declare-fun b!720848 () Bool)

(assert (=> b!720848 (= e!404355 e!404357)))

(declare-fun lt!319938 () (_ BitVec 64))

(assert (=> b!720848 (= lt!319938 (select (arr!19522 a!3186) (index!30682 lt!319936)))))

(declare-fun c!79349 () Bool)

(assert (=> b!720848 (= c!79349 (= lt!319938 k0!2102))))

(declare-fun b!720849 () Bool)

(assert (=> b!720849 (= e!404356 (MissingZero!7078 (index!30682 lt!319936)))))

(declare-fun b!720850 () Bool)

(declare-fun c!79348 () Bool)

(assert (=> b!720850 (= c!79348 (= lt!319938 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!720850 (= e!404357 e!404356)))

(assert (= (and d!99341 c!79347) b!720847))

(assert (= (and d!99341 (not c!79347)) b!720848))

(assert (= (and b!720848 c!79349) b!720846))

(assert (= (and b!720848 (not c!79349)) b!720850))

(assert (= (and b!720850 c!79348) b!720849))

(assert (= (and b!720850 (not c!79348)) b!720845))

(declare-fun m!676447 () Bool)

(assert (=> b!720845 m!676447))

(declare-fun m!676449 () Bool)

(assert (=> d!99341 m!676449))

(declare-fun m!676451 () Bool)

(assert (=> d!99341 m!676451))

(assert (=> d!99341 m!676265))

(assert (=> d!99341 m!676449))

(declare-fun m!676453 () Bool)

(assert (=> d!99341 m!676453))

(declare-fun m!676455 () Bool)

(assert (=> d!99341 m!676455))

(declare-fun m!676457 () Bool)

(assert (=> d!99341 m!676457))

(declare-fun m!676459 () Bool)

(assert (=> b!720848 m!676459))

(assert (=> b!720504 d!99341))

(declare-fun b!720874 () Bool)

(declare-fun e!404372 () Bool)

(declare-fun e!404373 () Bool)

(assert (=> b!720874 (= e!404372 e!404373)))

(declare-fun lt!319955 () (_ BitVec 64))

(assert (=> b!720874 (= lt!319955 (select (arr!19522 a!3186) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!24649 0))(
  ( (Unit!24650) )
))
(declare-fun lt!319953 () Unit!24649)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!40798 (_ BitVec 64) (_ BitVec 32)) Unit!24649)

(assert (=> b!720874 (= lt!319953 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!319955 #b00000000000000000000000000000000))))

(assert (=> b!720874 (arrayContainsKey!0 a!3186 lt!319955 #b00000000000000000000000000000000)))

(declare-fun lt!319954 () Unit!24649)

(assert (=> b!720874 (= lt!319954 lt!319953)))

(declare-fun res!482902 () Bool)

(assert (=> b!720874 (= res!482902 (= (seekEntryOrOpen!0 (select (arr!19522 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7078 #b00000000000000000000000000000000)))))

(assert (=> b!720874 (=> (not res!482902) (not e!404373))))

(declare-fun b!720875 () Bool)

(declare-fun call!34773 () Bool)

(assert (=> b!720875 (= e!404373 call!34773)))

(declare-fun bm!34770 () Bool)

(assert (=> bm!34770 (= call!34773 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!720876 () Bool)

(declare-fun e!404374 () Bool)

(assert (=> b!720876 (= e!404374 e!404372)))

(declare-fun c!79358 () Bool)

(assert (=> b!720876 (= c!79358 (validKeyInArray!0 (select (arr!19522 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!99349 () Bool)

(declare-fun res!482901 () Bool)

(assert (=> d!99349 (=> res!482901 e!404374)))

(assert (=> d!99349 (= res!482901 (bvsge #b00000000000000000000000000000000 (size!19942 a!3186)))))

(assert (=> d!99349 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!404374)))

(declare-fun b!720877 () Bool)

(assert (=> b!720877 (= e!404372 call!34773)))

(assert (= (and d!99349 (not res!482901)) b!720876))

(assert (= (and b!720876 c!79358) b!720874))

(assert (= (and b!720876 (not c!79358)) b!720877))

(assert (= (and b!720874 res!482902) b!720875))

(assert (= (or b!720875 b!720877) bm!34770))

(assert (=> b!720874 m!676395))

(declare-fun m!676475 () Bool)

(assert (=> b!720874 m!676475))

(declare-fun m!676477 () Bool)

(assert (=> b!720874 m!676477))

(assert (=> b!720874 m!676395))

(declare-fun m!676479 () Bool)

(assert (=> b!720874 m!676479))

(declare-fun m!676481 () Bool)

(assert (=> bm!34770 m!676481))

(assert (=> b!720876 m!676395))

(assert (=> b!720876 m!676395))

(assert (=> b!720876 m!676409))

(assert (=> b!720509 d!99349))

(declare-fun d!99361 () Bool)

(assert (=> d!99361 (= (validKeyInArray!0 (select (arr!19522 a!3186) j!159)) (and (not (= (select (arr!19522 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19522 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!720514 d!99361))

(check-sat (not b!720772) (not b!720771) (not b!720742) (not b!720681) (not b!720768) (not b!720630) (not b!720874) (not bm!34770) (not d!99315) (not d!99303) (not bm!34764) (not b!720845) (not b!720690) (not d!99295) (not b!720876) (not d!99341))
(check-sat)

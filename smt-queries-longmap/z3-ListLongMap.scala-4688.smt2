; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65168 () Bool)

(assert start!65168)

(declare-fun b!737298 () Bool)

(declare-fun res!495653 () Bool)

(declare-fun e!412383 () Bool)

(assert (=> b!737298 (=> (not res!495653) (not e!412383))))

(declare-datatypes ((array!41358 0))(
  ( (array!41359 (arr!19793 (Array (_ BitVec 32) (_ BitVec 64))) (size!20214 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41358)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41358 (_ BitVec 32)) Bool)

(assert (=> b!737298 (= res!495653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!737299 () Bool)

(declare-fun res!495651 () Bool)

(declare-fun e!412375 () Bool)

(assert (=> b!737299 (=> (not res!495651) (not e!412375))))

(declare-fun e!412378 () Bool)

(assert (=> b!737299 (= res!495651 e!412378)))

(declare-fun c!81207 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!737299 (= c!81207 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!495666 () Bool)

(declare-fun e!412374 () Bool)

(assert (=> start!65168 (=> (not res!495666) (not e!412374))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65168 (= res!495666 (validMask!0 mask!3328))))

(assert (=> start!65168 e!412374))

(assert (=> start!65168 true))

(declare-fun array_inv!15676 (array!41358) Bool)

(assert (=> start!65168 (array_inv!15676 a!3186)))

(declare-fun b!737300 () Bool)

(declare-fun res!495652 () Bool)

(assert (=> b!737300 (=> (not res!495652) (not e!412383))))

(declare-datatypes ((List!13834 0))(
  ( (Nil!13831) (Cons!13830 (h!14902 (_ BitVec 64)) (t!20140 List!13834)) )
))
(declare-fun arrayNoDuplicates!0 (array!41358 (_ BitVec 32) List!13834) Bool)

(assert (=> b!737300 (= res!495652 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13831))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7390 0))(
  ( (MissingZero!7390 (index!31928 (_ BitVec 32))) (Found!7390 (index!31929 (_ BitVec 32))) (Intermediate!7390 (undefined!8202 Bool) (index!31930 (_ BitVec 32)) (x!62935 (_ BitVec 32))) (Undefined!7390) (MissingVacant!7390 (index!31931 (_ BitVec 32))) )
))
(declare-fun lt!327012 () SeekEntryResult!7390)

(declare-fun b!737301 () Bool)

(declare-fun e!412377 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41358 (_ BitVec 32)) SeekEntryResult!7390)

(assert (=> b!737301 (= e!412377 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19793 a!3186) j!159) a!3186 mask!3328) lt!327012))))

(declare-fun b!737302 () Bool)

(declare-datatypes ((Unit!25136 0))(
  ( (Unit!25137) )
))
(declare-fun e!412380 () Unit!25136)

(declare-fun Unit!25138 () Unit!25136)

(assert (=> b!737302 (= e!412380 Unit!25138)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!327011 () SeekEntryResult!7390)

(assert (=> b!737302 (= lt!327011 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19793 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!327004 () (_ BitVec 32))

(declare-fun lt!327009 () SeekEntryResult!7390)

(assert (=> b!737302 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327004 resIntermediateIndex!5 (select (arr!19793 a!3186) j!159) a!3186 mask!3328) lt!327009)))

(declare-fun b!737303 () Bool)

(assert (=> b!737303 (= e!412383 e!412375)))

(declare-fun res!495663 () Bool)

(assert (=> b!737303 (=> (not res!495663) (not e!412375))))

(declare-fun lt!327010 () SeekEntryResult!7390)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41358 (_ BitVec 32)) SeekEntryResult!7390)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737303 (= res!495663 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19793 a!3186) j!159) mask!3328) (select (arr!19793 a!3186) j!159) a!3186 mask!3328) lt!327010))))

(assert (=> b!737303 (= lt!327010 (Intermediate!7390 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!737304 () Bool)

(declare-fun e!412376 () Bool)

(assert (=> b!737304 (= e!412376 true)))

(declare-fun lt!327017 () array!41358)

(declare-fun lt!327005 () (_ BitVec 64))

(declare-fun lt!327008 () SeekEntryResult!7390)

(assert (=> b!737304 (= lt!327008 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327004 lt!327005 lt!327017 mask!3328))))

(declare-fun b!737305 () Bool)

(declare-fun Unit!25139 () Unit!25136)

(assert (=> b!737305 (= e!412380 Unit!25139)))

(assert (=> b!737305 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327004 (select (arr!19793 a!3186) j!159) a!3186 mask!3328) lt!327010)))

(declare-fun b!737306 () Bool)

(declare-fun e!412382 () Bool)

(declare-fun e!412379 () Bool)

(assert (=> b!737306 (= e!412382 (not e!412379))))

(declare-fun res!495660 () Bool)

(assert (=> b!737306 (=> res!495660 e!412379)))

(declare-fun lt!327006 () SeekEntryResult!7390)

(get-info :version)

(assert (=> b!737306 (= res!495660 (or (not ((_ is Intermediate!7390) lt!327006)) (bvsge x!1131 (x!62935 lt!327006))))))

(assert (=> b!737306 (= lt!327009 (Found!7390 j!159))))

(declare-fun e!412373 () Bool)

(assert (=> b!737306 e!412373))

(declare-fun res!495658 () Bool)

(assert (=> b!737306 (=> (not res!495658) (not e!412373))))

(assert (=> b!737306 (= res!495658 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!327014 () Unit!25136)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41358 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25136)

(assert (=> b!737306 (= lt!327014 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!737307 () Bool)

(declare-fun res!495657 () Bool)

(assert (=> b!737307 (=> (not res!495657) (not e!412383))))

(assert (=> b!737307 (= res!495657 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20214 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20214 a!3186))))))

(declare-fun b!737308 () Bool)

(assert (=> b!737308 (= e!412375 e!412382)))

(declare-fun res!495655 () Bool)

(assert (=> b!737308 (=> (not res!495655) (not e!412382))))

(declare-fun lt!327015 () SeekEntryResult!7390)

(assert (=> b!737308 (= res!495655 (= lt!327015 lt!327006))))

(assert (=> b!737308 (= lt!327006 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!327005 lt!327017 mask!3328))))

(assert (=> b!737308 (= lt!327015 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!327005 mask!3328) lt!327005 lt!327017 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!737308 (= lt!327005 (select (store (arr!19793 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!737308 (= lt!327017 (array!41359 (store (arr!19793 a!3186) i!1173 k0!2102) (size!20214 a!3186)))))

(declare-fun b!737309 () Bool)

(declare-fun e!412381 () Bool)

(assert (=> b!737309 (= e!412381 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327004 (select (arr!19793 a!3186) j!159) a!3186 mask!3328) lt!327010)))))

(declare-fun b!737310 () Bool)

(assert (=> b!737310 (= e!412374 e!412383)))

(declare-fun res!495656 () Bool)

(assert (=> b!737310 (=> (not res!495656) (not e!412383))))

(declare-fun lt!327007 () SeekEntryResult!7390)

(assert (=> b!737310 (= res!495656 (or (= lt!327007 (MissingZero!7390 i!1173)) (= lt!327007 (MissingVacant!7390 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41358 (_ BitVec 32)) SeekEntryResult!7390)

(assert (=> b!737310 (= lt!327007 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!737311 () Bool)

(declare-fun res!495661 () Bool)

(assert (=> b!737311 (=> res!495661 e!412376)))

(assert (=> b!737311 (= res!495661 e!412381)))

(declare-fun c!81205 () Bool)

(declare-fun lt!327013 () Bool)

(assert (=> b!737311 (= c!81205 lt!327013)))

(declare-fun b!737312 () Bool)

(declare-fun res!495649 () Bool)

(assert (=> b!737312 (=> (not res!495649) (not e!412374))))

(declare-fun arrayContainsKey!0 (array!41358 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!737312 (= res!495649 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!737313 () Bool)

(declare-fun res!495650 () Bool)

(assert (=> b!737313 (=> (not res!495650) (not e!412374))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!737313 (= res!495650 (validKeyInArray!0 k0!2102))))

(declare-fun b!737314 () Bool)

(declare-fun res!495659 () Bool)

(assert (=> b!737314 (=> (not res!495659) (not e!412374))))

(assert (=> b!737314 (= res!495659 (validKeyInArray!0 (select (arr!19793 a!3186) j!159)))))

(declare-fun b!737315 () Bool)

(assert (=> b!737315 (= e!412373 e!412377)))

(declare-fun res!495665 () Bool)

(assert (=> b!737315 (=> (not res!495665) (not e!412377))))

(assert (=> b!737315 (= res!495665 (= (seekEntryOrOpen!0 (select (arr!19793 a!3186) j!159) a!3186 mask!3328) lt!327012))))

(assert (=> b!737315 (= lt!327012 (Found!7390 j!159))))

(declare-fun b!737316 () Bool)

(assert (=> b!737316 (= e!412381 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327004 resIntermediateIndex!5 (select (arr!19793 a!3186) j!159) a!3186 mask!3328) lt!327009)))))

(declare-fun b!737317 () Bool)

(declare-fun res!495662 () Bool)

(assert (=> b!737317 (=> (not res!495662) (not e!412375))))

(assert (=> b!737317 (= res!495662 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19793 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!737318 () Bool)

(declare-fun res!495664 () Bool)

(assert (=> b!737318 (=> (not res!495664) (not e!412374))))

(assert (=> b!737318 (= res!495664 (and (= (size!20214 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20214 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20214 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!737319 () Bool)

(assert (=> b!737319 (= e!412378 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19793 a!3186) j!159) a!3186 mask!3328) (Found!7390 j!159)))))

(declare-fun b!737320 () Bool)

(assert (=> b!737320 (= e!412379 e!412376)))

(declare-fun res!495654 () Bool)

(assert (=> b!737320 (=> res!495654 e!412376)))

(assert (=> b!737320 (= res!495654 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!327004 #b00000000000000000000000000000000) (bvsge lt!327004 (size!20214 a!3186))))))

(declare-fun lt!327016 () Unit!25136)

(assert (=> b!737320 (= lt!327016 e!412380)))

(declare-fun c!81206 () Bool)

(assert (=> b!737320 (= c!81206 lt!327013)))

(assert (=> b!737320 (= lt!327013 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737320 (= lt!327004 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!737321 () Bool)

(assert (=> b!737321 (= e!412378 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19793 a!3186) j!159) a!3186 mask!3328) lt!327010))))

(assert (= (and start!65168 res!495666) b!737318))

(assert (= (and b!737318 res!495664) b!737314))

(assert (= (and b!737314 res!495659) b!737313))

(assert (= (and b!737313 res!495650) b!737312))

(assert (= (and b!737312 res!495649) b!737310))

(assert (= (and b!737310 res!495656) b!737298))

(assert (= (and b!737298 res!495653) b!737300))

(assert (= (and b!737300 res!495652) b!737307))

(assert (= (and b!737307 res!495657) b!737303))

(assert (= (and b!737303 res!495663) b!737317))

(assert (= (and b!737317 res!495662) b!737299))

(assert (= (and b!737299 c!81207) b!737321))

(assert (= (and b!737299 (not c!81207)) b!737319))

(assert (= (and b!737299 res!495651) b!737308))

(assert (= (and b!737308 res!495655) b!737306))

(assert (= (and b!737306 res!495658) b!737315))

(assert (= (and b!737315 res!495665) b!737301))

(assert (= (and b!737306 (not res!495660)) b!737320))

(assert (= (and b!737320 c!81206) b!737305))

(assert (= (and b!737320 (not c!81206)) b!737302))

(assert (= (and b!737320 (not res!495654)) b!737311))

(assert (= (and b!737311 c!81205) b!737309))

(assert (= (and b!737311 (not c!81205)) b!737316))

(assert (= (and b!737311 (not res!495661)) b!737304))

(declare-fun m!688643 () Bool)

(assert (=> b!737314 m!688643))

(assert (=> b!737314 m!688643))

(declare-fun m!688645 () Bool)

(assert (=> b!737314 m!688645))

(declare-fun m!688647 () Bool)

(assert (=> b!737310 m!688647))

(assert (=> b!737302 m!688643))

(assert (=> b!737302 m!688643))

(declare-fun m!688649 () Bool)

(assert (=> b!737302 m!688649))

(assert (=> b!737302 m!688643))

(declare-fun m!688651 () Bool)

(assert (=> b!737302 m!688651))

(assert (=> b!737315 m!688643))

(assert (=> b!737315 m!688643))

(declare-fun m!688653 () Bool)

(assert (=> b!737315 m!688653))

(assert (=> b!737303 m!688643))

(assert (=> b!737303 m!688643))

(declare-fun m!688655 () Bool)

(assert (=> b!737303 m!688655))

(assert (=> b!737303 m!688655))

(assert (=> b!737303 m!688643))

(declare-fun m!688657 () Bool)

(assert (=> b!737303 m!688657))

(assert (=> b!737301 m!688643))

(assert (=> b!737301 m!688643))

(declare-fun m!688659 () Bool)

(assert (=> b!737301 m!688659))

(declare-fun m!688661 () Bool)

(assert (=> b!737320 m!688661))

(declare-fun m!688663 () Bool)

(assert (=> b!737308 m!688663))

(declare-fun m!688665 () Bool)

(assert (=> b!737308 m!688665))

(declare-fun m!688667 () Bool)

(assert (=> b!737308 m!688667))

(declare-fun m!688669 () Bool)

(assert (=> b!737308 m!688669))

(declare-fun m!688671 () Bool)

(assert (=> b!737308 m!688671))

(assert (=> b!737308 m!688663))

(assert (=> b!737305 m!688643))

(assert (=> b!737305 m!688643))

(declare-fun m!688673 () Bool)

(assert (=> b!737305 m!688673))

(assert (=> b!737319 m!688643))

(assert (=> b!737319 m!688643))

(assert (=> b!737319 m!688649))

(declare-fun m!688675 () Bool)

(assert (=> b!737306 m!688675))

(declare-fun m!688677 () Bool)

(assert (=> b!737306 m!688677))

(declare-fun m!688679 () Bool)

(assert (=> b!737300 m!688679))

(assert (=> b!737316 m!688643))

(assert (=> b!737316 m!688643))

(assert (=> b!737316 m!688651))

(declare-fun m!688681 () Bool)

(assert (=> b!737317 m!688681))

(declare-fun m!688683 () Bool)

(assert (=> b!737304 m!688683))

(declare-fun m!688685 () Bool)

(assert (=> start!65168 m!688685))

(declare-fun m!688687 () Bool)

(assert (=> start!65168 m!688687))

(assert (=> b!737309 m!688643))

(assert (=> b!737309 m!688643))

(assert (=> b!737309 m!688673))

(declare-fun m!688689 () Bool)

(assert (=> b!737298 m!688689))

(declare-fun m!688691 () Bool)

(assert (=> b!737313 m!688691))

(declare-fun m!688693 () Bool)

(assert (=> b!737312 m!688693))

(assert (=> b!737321 m!688643))

(assert (=> b!737321 m!688643))

(declare-fun m!688695 () Bool)

(assert (=> b!737321 m!688695))

(check-sat (not b!737305) (not b!737302) (not b!737312) (not b!737308) (not b!737315) (not b!737321) (not b!737304) (not b!737310) (not b!737319) (not b!737306) (not b!737303) (not b!737320) (not b!737300) (not b!737316) (not b!737298) (not b!737301) (not b!737314) (not start!65168) (not b!737313) (not b!737309))
(check-sat)

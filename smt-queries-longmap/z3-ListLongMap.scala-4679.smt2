; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65262 () Bool)

(assert start!65262)

(declare-fun b!736350 () Bool)

(declare-fun e!412043 () Bool)

(declare-fun e!412041 () Bool)

(assert (=> b!736350 (= e!412043 e!412041)))

(declare-fun res!494609 () Bool)

(assert (=> b!736350 (=> (not res!494609) (not e!412041))))

(declare-datatypes ((array!41305 0))(
  ( (array!41306 (arr!19762 (Array (_ BitVec 32) (_ BitVec 64))) (size!20182 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41305)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7318 0))(
  ( (MissingZero!7318 (index!31640 (_ BitVec 32))) (Found!7318 (index!31641 (_ BitVec 32))) (Intermediate!7318 (undefined!8130 Bool) (index!31642 (_ BitVec 32)) (x!62808 (_ BitVec 32))) (Undefined!7318) (MissingVacant!7318 (index!31643 (_ BitVec 32))) )
))
(declare-fun lt!326435 () SeekEntryResult!7318)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41305 (_ BitVec 32)) SeekEntryResult!7318)

(assert (=> b!736350 (= res!494609 (= (seekEntryOrOpen!0 (select (arr!19762 a!3186) j!159) a!3186 mask!3328) lt!326435))))

(assert (=> b!736350 (= lt!326435 (Found!7318 j!159))))

(declare-fun b!736351 () Bool)

(declare-fun res!494618 () Bool)

(declare-fun e!412033 () Bool)

(assert (=> b!736351 (=> res!494618 e!412033)))

(declare-fun e!412044 () Bool)

(assert (=> b!736351 (= res!494618 e!412044)))

(declare-fun c!81255 () Bool)

(declare-fun lt!326423 () Bool)

(assert (=> b!736351 (= c!81255 lt!326423)))

(declare-fun b!736352 () Bool)

(declare-fun e!412039 () Bool)

(declare-fun e!412034 () Bool)

(assert (=> b!736352 (= e!412039 e!412034)))

(declare-fun res!494620 () Bool)

(assert (=> b!736352 (=> (not res!494620) (not e!412034))))

(declare-fun lt!326430 () SeekEntryResult!7318)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!736352 (= res!494620 (or (= lt!326430 (MissingZero!7318 i!1173)) (= lt!326430 (MissingVacant!7318 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!736352 (= lt!326430 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!736353 () Bool)

(declare-fun e!412036 () Bool)

(declare-fun e!412040 () Bool)

(assert (=> b!736353 (= e!412036 e!412040)))

(declare-fun res!494621 () Bool)

(assert (=> b!736353 (=> (not res!494621) (not e!412040))))

(declare-fun lt!326431 () SeekEntryResult!7318)

(declare-fun lt!326429 () SeekEntryResult!7318)

(assert (=> b!736353 (= res!494621 (= lt!326431 lt!326429))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!326436 () array!41305)

(declare-fun lt!326432 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41305 (_ BitVec 32)) SeekEntryResult!7318)

(assert (=> b!736353 (= lt!326429 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!326432 lt!326436 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736353 (= lt!326431 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!326432 mask!3328) lt!326432 lt!326436 mask!3328))))

(assert (=> b!736353 (= lt!326432 (select (store (arr!19762 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!736353 (= lt!326436 (array!41306 (store (arr!19762 a!3186) i!1173 k0!2102) (size!20182 a!3186)))))

(declare-fun b!736354 () Bool)

(declare-fun res!494611 () Bool)

(assert (=> b!736354 (=> (not res!494611) (not e!412036))))

(declare-fun e!412035 () Bool)

(assert (=> b!736354 (= res!494611 e!412035)))

(declare-fun c!81256 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!736354 (= c!81256 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!736355 () Bool)

(declare-fun res!494617 () Bool)

(assert (=> b!736355 (=> (not res!494617) (not e!412036))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!736355 (= res!494617 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19762 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!736356 () Bool)

(declare-fun res!494614 () Bool)

(assert (=> b!736356 (=> (not res!494614) (not e!412034))))

(declare-datatypes ((List!13671 0))(
  ( (Nil!13668) (Cons!13667 (h!14745 (_ BitVec 64)) (t!19978 List!13671)) )
))
(declare-fun arrayNoDuplicates!0 (array!41305 (_ BitVec 32) List!13671) Bool)

(assert (=> b!736356 (= res!494614 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13668))))

(declare-fun lt!326424 () (_ BitVec 32))

(declare-fun lt!326428 () SeekEntryResult!7318)

(declare-fun b!736357 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41305 (_ BitVec 32)) SeekEntryResult!7318)

(assert (=> b!736357 (= e!412044 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326424 resIntermediateIndex!5 (select (arr!19762 a!3186) j!159) a!3186 mask!3328) lt!326428)))))

(declare-fun b!736358 () Bool)

(declare-datatypes ((Unit!25045 0))(
  ( (Unit!25046) )
))
(declare-fun e!412042 () Unit!25045)

(declare-fun Unit!25047 () Unit!25045)

(assert (=> b!736358 (= e!412042 Unit!25047)))

(declare-fun lt!326425 () SeekEntryResult!7318)

(assert (=> b!736358 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326424 (select (arr!19762 a!3186) j!159) a!3186 mask!3328) lt!326425)))

(declare-fun b!736359 () Bool)

(declare-fun res!494610 () Bool)

(assert (=> b!736359 (=> (not res!494610) (not e!412039))))

(assert (=> b!736359 (= res!494610 (and (= (size!20182 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20182 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20182 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!736360 () Bool)

(declare-fun res!494612 () Bool)

(assert (=> b!736360 (=> (not res!494612) (not e!412039))))

(declare-fun arrayContainsKey!0 (array!41305 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!736360 (= res!494612 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!736361 () Bool)

(assert (=> b!736361 (= e!412033 true)))

(declare-fun lt!326433 () SeekEntryResult!7318)

(assert (=> b!736361 (= lt!326433 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326424 lt!326432 lt!326436 mask!3328))))

(declare-fun b!736349 () Bool)

(assert (=> b!736349 (= e!412041 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19762 a!3186) j!159) a!3186 mask!3328) lt!326435))))

(declare-fun res!494623 () Bool)

(assert (=> start!65262 (=> (not res!494623) (not e!412039))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65262 (= res!494623 (validMask!0 mask!3328))))

(assert (=> start!65262 e!412039))

(assert (=> start!65262 true))

(declare-fun array_inv!15621 (array!41305) Bool)

(assert (=> start!65262 (array_inv!15621 a!3186)))

(declare-fun b!736362 () Bool)

(assert (=> b!736362 (= e!412035 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19762 a!3186) j!159) a!3186 mask!3328) (Found!7318 j!159)))))

(declare-fun b!736363 () Bool)

(declare-fun res!494608 () Bool)

(assert (=> b!736363 (=> (not res!494608) (not e!412034))))

(assert (=> b!736363 (= res!494608 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20182 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20182 a!3186))))))

(declare-fun b!736364 () Bool)

(assert (=> b!736364 (= e!412044 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326424 (select (arr!19762 a!3186) j!159) a!3186 mask!3328) lt!326425)))))

(declare-fun b!736365 () Bool)

(assert (=> b!736365 (= e!412034 e!412036)))

(declare-fun res!494619 () Bool)

(assert (=> b!736365 (=> (not res!494619) (not e!412036))))

(assert (=> b!736365 (= res!494619 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19762 a!3186) j!159) mask!3328) (select (arr!19762 a!3186) j!159) a!3186 mask!3328) lt!326425))))

(assert (=> b!736365 (= lt!326425 (Intermediate!7318 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!736366 () Bool)

(declare-fun res!494616 () Bool)

(assert (=> b!736366 (=> (not res!494616) (not e!412039))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!736366 (= res!494616 (validKeyInArray!0 (select (arr!19762 a!3186) j!159)))))

(declare-fun b!736367 () Bool)

(declare-fun e!412038 () Bool)

(assert (=> b!736367 (= e!412040 (not e!412038))))

(declare-fun res!494615 () Bool)

(assert (=> b!736367 (=> res!494615 e!412038)))

(get-info :version)

(assert (=> b!736367 (= res!494615 (or (not ((_ is Intermediate!7318) lt!326429)) (bvsge x!1131 (x!62808 lt!326429))))))

(assert (=> b!736367 (= lt!326428 (Found!7318 j!159))))

(assert (=> b!736367 e!412043))

(declare-fun res!494606 () Bool)

(assert (=> b!736367 (=> (not res!494606) (not e!412043))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41305 (_ BitVec 32)) Bool)

(assert (=> b!736367 (= res!494606 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!326434 () Unit!25045)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41305 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25045)

(assert (=> b!736367 (= lt!326434 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!736368 () Bool)

(assert (=> b!736368 (= e!412038 e!412033)))

(declare-fun res!494613 () Bool)

(assert (=> b!736368 (=> res!494613 e!412033)))

(assert (=> b!736368 (= res!494613 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!326424 #b00000000000000000000000000000000) (bvsge lt!326424 (size!20182 a!3186))))))

(declare-fun lt!326426 () Unit!25045)

(assert (=> b!736368 (= lt!326426 e!412042)))

(declare-fun c!81257 () Bool)

(assert (=> b!736368 (= c!81257 lt!326423)))

(assert (=> b!736368 (= lt!326423 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736368 (= lt!326424 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!736369 () Bool)

(declare-fun Unit!25048 () Unit!25045)

(assert (=> b!736369 (= e!412042 Unit!25048)))

(declare-fun lt!326427 () SeekEntryResult!7318)

(assert (=> b!736369 (= lt!326427 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19762 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!736369 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326424 resIntermediateIndex!5 (select (arr!19762 a!3186) j!159) a!3186 mask!3328) lt!326428)))

(declare-fun b!736370 () Bool)

(declare-fun res!494607 () Bool)

(assert (=> b!736370 (=> (not res!494607) (not e!412034))))

(assert (=> b!736370 (= res!494607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!736371 () Bool)

(assert (=> b!736371 (= e!412035 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19762 a!3186) j!159) a!3186 mask!3328) lt!326425))))

(declare-fun b!736372 () Bool)

(declare-fun res!494622 () Bool)

(assert (=> b!736372 (=> (not res!494622) (not e!412039))))

(assert (=> b!736372 (= res!494622 (validKeyInArray!0 k0!2102))))

(assert (= (and start!65262 res!494623) b!736359))

(assert (= (and b!736359 res!494610) b!736366))

(assert (= (and b!736366 res!494616) b!736372))

(assert (= (and b!736372 res!494622) b!736360))

(assert (= (and b!736360 res!494612) b!736352))

(assert (= (and b!736352 res!494620) b!736370))

(assert (= (and b!736370 res!494607) b!736356))

(assert (= (and b!736356 res!494614) b!736363))

(assert (= (and b!736363 res!494608) b!736365))

(assert (= (and b!736365 res!494619) b!736355))

(assert (= (and b!736355 res!494617) b!736354))

(assert (= (and b!736354 c!81256) b!736371))

(assert (= (and b!736354 (not c!81256)) b!736362))

(assert (= (and b!736354 res!494611) b!736353))

(assert (= (and b!736353 res!494621) b!736367))

(assert (= (and b!736367 res!494606) b!736350))

(assert (= (and b!736350 res!494609) b!736349))

(assert (= (and b!736367 (not res!494615)) b!736368))

(assert (= (and b!736368 c!81257) b!736358))

(assert (= (and b!736368 (not c!81257)) b!736369))

(assert (= (and b!736368 (not res!494613)) b!736351))

(assert (= (and b!736351 c!81255) b!736364))

(assert (= (and b!736351 (not c!81255)) b!736357))

(assert (= (and b!736351 (not res!494618)) b!736361))

(declare-fun m!689103 () Bool)

(assert (=> b!736365 m!689103))

(assert (=> b!736365 m!689103))

(declare-fun m!689105 () Bool)

(assert (=> b!736365 m!689105))

(assert (=> b!736365 m!689105))

(assert (=> b!736365 m!689103))

(declare-fun m!689107 () Bool)

(assert (=> b!736365 m!689107))

(assert (=> b!736369 m!689103))

(assert (=> b!736369 m!689103))

(declare-fun m!689109 () Bool)

(assert (=> b!736369 m!689109))

(assert (=> b!736369 m!689103))

(declare-fun m!689111 () Bool)

(assert (=> b!736369 m!689111))

(assert (=> b!736358 m!689103))

(assert (=> b!736358 m!689103))

(declare-fun m!689113 () Bool)

(assert (=> b!736358 m!689113))

(declare-fun m!689115 () Bool)

(assert (=> b!736367 m!689115))

(declare-fun m!689117 () Bool)

(assert (=> b!736367 m!689117))

(assert (=> b!736349 m!689103))

(assert (=> b!736349 m!689103))

(declare-fun m!689119 () Bool)

(assert (=> b!736349 m!689119))

(assert (=> b!736350 m!689103))

(assert (=> b!736350 m!689103))

(declare-fun m!689121 () Bool)

(assert (=> b!736350 m!689121))

(declare-fun m!689123 () Bool)

(assert (=> b!736356 m!689123))

(declare-fun m!689125 () Bool)

(assert (=> b!736352 m!689125))

(declare-fun m!689127 () Bool)

(assert (=> start!65262 m!689127))

(declare-fun m!689129 () Bool)

(assert (=> start!65262 m!689129))

(assert (=> b!736357 m!689103))

(assert (=> b!736357 m!689103))

(assert (=> b!736357 m!689111))

(assert (=> b!736364 m!689103))

(assert (=> b!736364 m!689103))

(assert (=> b!736364 m!689113))

(assert (=> b!736371 m!689103))

(assert (=> b!736371 m!689103))

(declare-fun m!689131 () Bool)

(assert (=> b!736371 m!689131))

(declare-fun m!689133 () Bool)

(assert (=> b!736355 m!689133))

(assert (=> b!736366 m!689103))

(assert (=> b!736366 m!689103))

(declare-fun m!689135 () Bool)

(assert (=> b!736366 m!689135))

(declare-fun m!689137 () Bool)

(assert (=> b!736368 m!689137))

(declare-fun m!689139 () Bool)

(assert (=> b!736370 m!689139))

(declare-fun m!689141 () Bool)

(assert (=> b!736361 m!689141))

(declare-fun m!689143 () Bool)

(assert (=> b!736372 m!689143))

(declare-fun m!689145 () Bool)

(assert (=> b!736353 m!689145))

(declare-fun m!689147 () Bool)

(assert (=> b!736353 m!689147))

(declare-fun m!689149 () Bool)

(assert (=> b!736353 m!689149))

(declare-fun m!689151 () Bool)

(assert (=> b!736353 m!689151))

(assert (=> b!736353 m!689145))

(declare-fun m!689153 () Bool)

(assert (=> b!736353 m!689153))

(assert (=> b!736362 m!689103))

(assert (=> b!736362 m!689103))

(assert (=> b!736362 m!689109))

(declare-fun m!689155 () Bool)

(assert (=> b!736360 m!689155))

(check-sat (not b!736366) (not b!736368) (not b!736350) (not b!736349) (not b!736357) (not b!736367) (not b!736356) (not b!736362) (not b!736352) (not b!736371) (not b!736370) (not b!736364) (not b!736360) (not b!736372) (not b!736361) (not b!736365) (not start!65262) (not b!736353) (not b!736369) (not b!736358))
(check-sat)

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64814 () Bool)

(assert start!64814)

(declare-fun b!731557 () Bool)

(declare-fun res!491599 () Bool)

(declare-fun e!409348 () Bool)

(assert (=> b!731557 (=> (not res!491599) (not e!409348))))

(declare-datatypes ((array!41211 0))(
  ( (array!41212 (arr!19724 (Array (_ BitVec 32) (_ BitVec 64))) (size!20145 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41211)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41211 (_ BitVec 32)) Bool)

(assert (=> b!731557 (= res!491599 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!491611 () Bool)

(declare-fun e!409349 () Bool)

(assert (=> start!64814 (=> (not res!491611) (not e!409349))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64814 (= res!491611 (validMask!0 mask!3328))))

(assert (=> start!64814 e!409349))

(assert (=> start!64814 true))

(declare-fun array_inv!15607 (array!41211) Bool)

(assert (=> start!64814 (array_inv!15607 a!3186)))

(declare-fun b!731558 () Bool)

(declare-fun res!491605 () Bool)

(assert (=> b!731558 (=> (not res!491605) (not e!409349))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41211 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!731558 (= res!491605 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!731559 () Bool)

(declare-fun e!409352 () Bool)

(declare-fun e!409350 () Bool)

(assert (=> b!731559 (= e!409352 e!409350)))

(declare-fun res!491609 () Bool)

(assert (=> b!731559 (=> (not res!491609) (not e!409350))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7321 0))(
  ( (MissingZero!7321 (index!31652 (_ BitVec 32))) (Found!7321 (index!31653 (_ BitVec 32))) (Intermediate!7321 (undefined!8133 Bool) (index!31654 (_ BitVec 32)) (x!62646 (_ BitVec 32))) (Undefined!7321) (MissingVacant!7321 (index!31655 (_ BitVec 32))) )
))
(declare-fun lt!324063 () SeekEntryResult!7321)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41211 (_ BitVec 32)) SeekEntryResult!7321)

(assert (=> b!731559 (= res!491609 (= (seekEntryOrOpen!0 (select (arr!19724 a!3186) j!159) a!3186 mask!3328) lt!324063))))

(assert (=> b!731559 (= lt!324063 (Found!7321 j!159))))

(declare-fun b!731560 () Bool)

(declare-fun e!409354 () Bool)

(assert (=> b!731560 (= e!409348 e!409354)))

(declare-fun res!491603 () Bool)

(assert (=> b!731560 (=> (not res!491603) (not e!409354))))

(declare-fun lt!324068 () SeekEntryResult!7321)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41211 (_ BitVec 32)) SeekEntryResult!7321)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!731560 (= res!491603 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19724 a!3186) j!159) mask!3328) (select (arr!19724 a!3186) j!159) a!3186 mask!3328) lt!324068))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!731560 (= lt!324068 (Intermediate!7321 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!731561 () Bool)

(declare-fun res!491616 () Bool)

(assert (=> b!731561 (=> (not res!491616) (not e!409348))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!731561 (= res!491616 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20145 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20145 a!3186))))))

(declare-fun b!731562 () Bool)

(declare-fun res!491615 () Bool)

(declare-fun e!409351 () Bool)

(assert (=> b!731562 (=> res!491615 e!409351)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41211 (_ BitVec 32)) SeekEntryResult!7321)

(assert (=> b!731562 (= res!491615 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19724 a!3186) j!159) a!3186 mask!3328) (Found!7321 j!159))))))

(declare-fun b!731563 () Bool)

(assert (=> b!731563 (= e!409350 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19724 a!3186) j!159) a!3186 mask!3328) lt!324063))))

(declare-fun b!731564 () Bool)

(declare-fun e!409345 () Bool)

(assert (=> b!731564 (= e!409354 e!409345)))

(declare-fun res!491601 () Bool)

(assert (=> b!731564 (=> (not res!491601) (not e!409345))))

(declare-fun lt!324060 () SeekEntryResult!7321)

(declare-fun lt!324066 () SeekEntryResult!7321)

(assert (=> b!731564 (= res!491601 (= lt!324060 lt!324066))))

(declare-fun lt!324061 () (_ BitVec 64))

(declare-fun lt!324064 () array!41211)

(assert (=> b!731564 (= lt!324066 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!324061 lt!324064 mask!3328))))

(assert (=> b!731564 (= lt!324060 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!324061 mask!3328) lt!324061 lt!324064 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!731564 (= lt!324061 (select (store (arr!19724 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!731564 (= lt!324064 (array!41212 (store (arr!19724 a!3186) i!1173 k0!2102) (size!20145 a!3186)))))

(declare-fun b!731565 () Bool)

(declare-fun e!409346 () Bool)

(assert (=> b!731565 (= e!409346 e!409351)))

(declare-fun res!491606 () Bool)

(assert (=> b!731565 (=> res!491606 e!409351)))

(assert (=> b!731565 (= res!491606 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!324067 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!731565 (= lt!324067 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!731566 () Bool)

(assert (=> b!731566 (= e!409351 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt lt!324067 #b00000000000000000000000000000000) (bvsge lt!324067 (bvadd #b00000000000000000000000000000001 mask!3328)) (and (bvsle (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000))))))

(declare-fun b!731567 () Bool)

(assert (=> b!731567 (= e!409349 e!409348)))

(declare-fun res!491612 () Bool)

(assert (=> b!731567 (=> (not res!491612) (not e!409348))))

(declare-fun lt!324065 () SeekEntryResult!7321)

(assert (=> b!731567 (= res!491612 (or (= lt!324065 (MissingZero!7321 i!1173)) (= lt!324065 (MissingVacant!7321 i!1173))))))

(assert (=> b!731567 (= lt!324065 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!731568 () Bool)

(declare-fun res!491613 () Bool)

(assert (=> b!731568 (=> (not res!491613) (not e!409349))))

(assert (=> b!731568 (= res!491613 (and (= (size!20145 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20145 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20145 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!731569 () Bool)

(assert (=> b!731569 (= e!409345 (not e!409346))))

(declare-fun res!491608 () Bool)

(assert (=> b!731569 (=> res!491608 e!409346)))

(get-info :version)

(assert (=> b!731569 (= res!491608 (or (not ((_ is Intermediate!7321) lt!324066)) (bvsge x!1131 (x!62646 lt!324066))))))

(assert (=> b!731569 e!409352))

(declare-fun res!491614 () Bool)

(assert (=> b!731569 (=> (not res!491614) (not e!409352))))

(assert (=> b!731569 (= res!491614 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24932 0))(
  ( (Unit!24933) )
))
(declare-fun lt!324062 () Unit!24932)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41211 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24932)

(assert (=> b!731569 (= lt!324062 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!731570 () Bool)

(declare-fun res!491610 () Bool)

(assert (=> b!731570 (=> (not res!491610) (not e!409348))))

(declare-datatypes ((List!13765 0))(
  ( (Nil!13762) (Cons!13761 (h!14824 (_ BitVec 64)) (t!20071 List!13765)) )
))
(declare-fun arrayNoDuplicates!0 (array!41211 (_ BitVec 32) List!13765) Bool)

(assert (=> b!731570 (= res!491610 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13762))))

(declare-fun b!731571 () Bool)

(declare-fun e!409353 () Bool)

(assert (=> b!731571 (= e!409353 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19724 a!3186) j!159) a!3186 mask!3328) (Found!7321 j!159)))))

(declare-fun b!731572 () Bool)

(declare-fun res!491607 () Bool)

(assert (=> b!731572 (=> (not res!491607) (not e!409354))))

(assert (=> b!731572 (= res!491607 e!409353)))

(declare-fun c!80355 () Bool)

(assert (=> b!731572 (= c!80355 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!731573 () Bool)

(assert (=> b!731573 (= e!409353 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19724 a!3186) j!159) a!3186 mask!3328) lt!324068))))

(declare-fun b!731574 () Bool)

(declare-fun res!491604 () Bool)

(assert (=> b!731574 (=> (not res!491604) (not e!409354))))

(assert (=> b!731574 (= res!491604 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19724 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!731575 () Bool)

(declare-fun res!491600 () Bool)

(assert (=> b!731575 (=> (not res!491600) (not e!409349))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!731575 (= res!491600 (validKeyInArray!0 (select (arr!19724 a!3186) j!159)))))

(declare-fun b!731576 () Bool)

(declare-fun res!491602 () Bool)

(assert (=> b!731576 (=> (not res!491602) (not e!409349))))

(assert (=> b!731576 (= res!491602 (validKeyInArray!0 k0!2102))))

(assert (= (and start!64814 res!491611) b!731568))

(assert (= (and b!731568 res!491613) b!731575))

(assert (= (and b!731575 res!491600) b!731576))

(assert (= (and b!731576 res!491602) b!731558))

(assert (= (and b!731558 res!491605) b!731567))

(assert (= (and b!731567 res!491612) b!731557))

(assert (= (and b!731557 res!491599) b!731570))

(assert (= (and b!731570 res!491610) b!731561))

(assert (= (and b!731561 res!491616) b!731560))

(assert (= (and b!731560 res!491603) b!731574))

(assert (= (and b!731574 res!491604) b!731572))

(assert (= (and b!731572 c!80355) b!731573))

(assert (= (and b!731572 (not c!80355)) b!731571))

(assert (= (and b!731572 res!491607) b!731564))

(assert (= (and b!731564 res!491601) b!731569))

(assert (= (and b!731569 res!491614) b!731559))

(assert (= (and b!731559 res!491609) b!731563))

(assert (= (and b!731569 (not res!491608)) b!731565))

(assert (= (and b!731565 (not res!491606)) b!731562))

(assert (= (and b!731562 (not res!491615)) b!731566))

(declare-fun m!684287 () Bool)

(assert (=> b!731565 m!684287))

(declare-fun m!684289 () Bool)

(assert (=> b!731563 m!684289))

(assert (=> b!731563 m!684289))

(declare-fun m!684291 () Bool)

(assert (=> b!731563 m!684291))

(assert (=> b!731571 m!684289))

(assert (=> b!731571 m!684289))

(declare-fun m!684293 () Bool)

(assert (=> b!731571 m!684293))

(declare-fun m!684295 () Bool)

(assert (=> b!731570 m!684295))

(assert (=> b!731560 m!684289))

(assert (=> b!731560 m!684289))

(declare-fun m!684297 () Bool)

(assert (=> b!731560 m!684297))

(assert (=> b!731560 m!684297))

(assert (=> b!731560 m!684289))

(declare-fun m!684299 () Bool)

(assert (=> b!731560 m!684299))

(declare-fun m!684301 () Bool)

(assert (=> b!731567 m!684301))

(assert (=> b!731562 m!684289))

(assert (=> b!731562 m!684289))

(assert (=> b!731562 m!684293))

(declare-fun m!684303 () Bool)

(assert (=> b!731558 m!684303))

(declare-fun m!684305 () Bool)

(assert (=> b!731576 m!684305))

(declare-fun m!684307 () Bool)

(assert (=> start!64814 m!684307))

(declare-fun m!684309 () Bool)

(assert (=> start!64814 m!684309))

(declare-fun m!684311 () Bool)

(assert (=> b!731574 m!684311))

(declare-fun m!684313 () Bool)

(assert (=> b!731557 m!684313))

(assert (=> b!731559 m!684289))

(assert (=> b!731559 m!684289))

(declare-fun m!684315 () Bool)

(assert (=> b!731559 m!684315))

(declare-fun m!684317 () Bool)

(assert (=> b!731564 m!684317))

(declare-fun m!684319 () Bool)

(assert (=> b!731564 m!684319))

(declare-fun m!684321 () Bool)

(assert (=> b!731564 m!684321))

(declare-fun m!684323 () Bool)

(assert (=> b!731564 m!684323))

(assert (=> b!731564 m!684323))

(declare-fun m!684325 () Bool)

(assert (=> b!731564 m!684325))

(assert (=> b!731575 m!684289))

(assert (=> b!731575 m!684289))

(declare-fun m!684327 () Bool)

(assert (=> b!731575 m!684327))

(assert (=> b!731573 m!684289))

(assert (=> b!731573 m!684289))

(declare-fun m!684329 () Bool)

(assert (=> b!731573 m!684329))

(declare-fun m!684331 () Bool)

(assert (=> b!731569 m!684331))

(declare-fun m!684333 () Bool)

(assert (=> b!731569 m!684333))

(check-sat (not b!731557) (not start!64814) (not b!731573) (not b!731569) (not b!731565) (not b!731570) (not b!731575) (not b!731567) (not b!731560) (not b!731559) (not b!731563) (not b!731576) (not b!731562) (not b!731571) (not b!731564) (not b!731558))
(check-sat)
(get-model)

(declare-fun b!731709 () Bool)

(declare-fun c!80368 () Bool)

(declare-fun lt!324131 () (_ BitVec 64))

(assert (=> b!731709 (= c!80368 (= lt!324131 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!409421 () SeekEntryResult!7321)

(declare-fun e!409422 () SeekEntryResult!7321)

(assert (=> b!731709 (= e!409421 e!409422)))

(declare-fun b!731710 () Bool)

(declare-fun e!409423 () SeekEntryResult!7321)

(assert (=> b!731710 (= e!409423 e!409421)))

(declare-fun lt!324130 () SeekEntryResult!7321)

(assert (=> b!731710 (= lt!324131 (select (arr!19724 a!3186) (index!31654 lt!324130)))))

(declare-fun c!80369 () Bool)

(assert (=> b!731710 (= c!80369 (= lt!324131 k0!2102))))

(declare-fun d!99539 () Bool)

(declare-fun lt!324129 () SeekEntryResult!7321)

(assert (=> d!99539 (and (or ((_ is Undefined!7321) lt!324129) (not ((_ is Found!7321) lt!324129)) (and (bvsge (index!31653 lt!324129) #b00000000000000000000000000000000) (bvslt (index!31653 lt!324129) (size!20145 a!3186)))) (or ((_ is Undefined!7321) lt!324129) ((_ is Found!7321) lt!324129) (not ((_ is MissingZero!7321) lt!324129)) (and (bvsge (index!31652 lt!324129) #b00000000000000000000000000000000) (bvslt (index!31652 lt!324129) (size!20145 a!3186)))) (or ((_ is Undefined!7321) lt!324129) ((_ is Found!7321) lt!324129) ((_ is MissingZero!7321) lt!324129) (not ((_ is MissingVacant!7321) lt!324129)) (and (bvsge (index!31655 lt!324129) #b00000000000000000000000000000000) (bvslt (index!31655 lt!324129) (size!20145 a!3186)))) (or ((_ is Undefined!7321) lt!324129) (ite ((_ is Found!7321) lt!324129) (= (select (arr!19724 a!3186) (index!31653 lt!324129)) k0!2102) (ite ((_ is MissingZero!7321) lt!324129) (= (select (arr!19724 a!3186) (index!31652 lt!324129)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7321) lt!324129) (= (select (arr!19724 a!3186) (index!31655 lt!324129)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!99539 (= lt!324129 e!409423)))

(declare-fun c!80370 () Bool)

(assert (=> d!99539 (= c!80370 (and ((_ is Intermediate!7321) lt!324130) (undefined!8133 lt!324130)))))

(assert (=> d!99539 (= lt!324130 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!99539 (validMask!0 mask!3328)))

(assert (=> d!99539 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!324129)))

(declare-fun b!731711 () Bool)

(assert (=> b!731711 (= e!409423 Undefined!7321)))

(declare-fun b!731712 () Bool)

(assert (=> b!731712 (= e!409422 (MissingZero!7321 (index!31654 lt!324130)))))

(declare-fun b!731713 () Bool)

(assert (=> b!731713 (= e!409421 (Found!7321 (index!31654 lt!324130)))))

(declare-fun b!731714 () Bool)

(assert (=> b!731714 (= e!409422 (seekKeyOrZeroReturnVacant!0 (x!62646 lt!324130) (index!31654 lt!324130) (index!31654 lt!324130) k0!2102 a!3186 mask!3328))))

(assert (= (and d!99539 c!80370) b!731711))

(assert (= (and d!99539 (not c!80370)) b!731710))

(assert (= (and b!731710 c!80369) b!731713))

(assert (= (and b!731710 (not c!80369)) b!731709))

(assert (= (and b!731709 c!80368) b!731712))

(assert (= (and b!731709 (not c!80368)) b!731714))

(declare-fun m!684431 () Bool)

(assert (=> b!731710 m!684431))

(assert (=> d!99539 m!684307))

(declare-fun m!684433 () Bool)

(assert (=> d!99539 m!684433))

(declare-fun m!684435 () Bool)

(assert (=> d!99539 m!684435))

(declare-fun m!684437 () Bool)

(assert (=> d!99539 m!684437))

(declare-fun m!684439 () Bool)

(assert (=> d!99539 m!684439))

(declare-fun m!684441 () Bool)

(assert (=> d!99539 m!684441))

(assert (=> d!99539 m!684437))

(declare-fun m!684443 () Bool)

(assert (=> b!731714 m!684443))

(assert (=> b!731567 d!99539))

(declare-fun b!731723 () Bool)

(declare-fun e!409431 () Bool)

(declare-fun e!409430 () Bool)

(assert (=> b!731723 (= e!409431 e!409430)))

(declare-fun lt!324140 () (_ BitVec 64))

(assert (=> b!731723 (= lt!324140 (select (arr!19724 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!324139 () Unit!24932)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!41211 (_ BitVec 64) (_ BitVec 32)) Unit!24932)

(assert (=> b!731723 (= lt!324139 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!324140 #b00000000000000000000000000000000))))

(assert (=> b!731723 (arrayContainsKey!0 a!3186 lt!324140 #b00000000000000000000000000000000)))

(declare-fun lt!324138 () Unit!24932)

(assert (=> b!731723 (= lt!324138 lt!324139)))

(declare-fun res!491729 () Bool)

(assert (=> b!731723 (= res!491729 (= (seekEntryOrOpen!0 (select (arr!19724 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7321 #b00000000000000000000000000000000)))))

(assert (=> b!731723 (=> (not res!491729) (not e!409430))))

(declare-fun d!99541 () Bool)

(declare-fun res!491730 () Bool)

(declare-fun e!409432 () Bool)

(assert (=> d!99541 (=> res!491730 e!409432)))

(assert (=> d!99541 (= res!491730 (bvsge #b00000000000000000000000000000000 (size!20145 a!3186)))))

(assert (=> d!99541 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!409432)))

(declare-fun b!731724 () Bool)

(assert (=> b!731724 (= e!409432 e!409431)))

(declare-fun c!80373 () Bool)

(assert (=> b!731724 (= c!80373 (validKeyInArray!0 (select (arr!19724 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!34822 () Bool)

(declare-fun call!34825 () Bool)

(assert (=> bm!34822 (= call!34825 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!731725 () Bool)

(assert (=> b!731725 (= e!409430 call!34825)))

(declare-fun b!731726 () Bool)

(assert (=> b!731726 (= e!409431 call!34825)))

(assert (= (and d!99541 (not res!491730)) b!731724))

(assert (= (and b!731724 c!80373) b!731723))

(assert (= (and b!731724 (not c!80373)) b!731726))

(assert (= (and b!731723 res!491729) b!731725))

(assert (= (or b!731725 b!731726) bm!34822))

(declare-fun m!684445 () Bool)

(assert (=> b!731723 m!684445))

(declare-fun m!684447 () Bool)

(assert (=> b!731723 m!684447))

(declare-fun m!684449 () Bool)

(assert (=> b!731723 m!684449))

(assert (=> b!731723 m!684445))

(declare-fun m!684451 () Bool)

(assert (=> b!731723 m!684451))

(assert (=> b!731724 m!684445))

(assert (=> b!731724 m!684445))

(declare-fun m!684453 () Bool)

(assert (=> b!731724 m!684453))

(declare-fun m!684455 () Bool)

(assert (=> bm!34822 m!684455))

(assert (=> b!731557 d!99541))

(declare-fun d!99543 () Bool)

(declare-fun res!491735 () Bool)

(declare-fun e!409437 () Bool)

(assert (=> d!99543 (=> res!491735 e!409437)))

(assert (=> d!99543 (= res!491735 (= (select (arr!19724 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!99543 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!409437)))

(declare-fun b!731731 () Bool)

(declare-fun e!409438 () Bool)

(assert (=> b!731731 (= e!409437 e!409438)))

(declare-fun res!491736 () Bool)

(assert (=> b!731731 (=> (not res!491736) (not e!409438))))

(assert (=> b!731731 (= res!491736 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20145 a!3186)))))

(declare-fun b!731732 () Bool)

(assert (=> b!731732 (= e!409438 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!99543 (not res!491735)) b!731731))

(assert (= (and b!731731 res!491736) b!731732))

(assert (=> d!99543 m!684445))

(declare-fun m!684457 () Bool)

(assert (=> b!731732 m!684457))

(assert (=> b!731558 d!99543))

(declare-fun b!731733 () Bool)

(declare-fun e!409440 () Bool)

(declare-fun e!409439 () Bool)

(assert (=> b!731733 (= e!409440 e!409439)))

(declare-fun lt!324143 () (_ BitVec 64))

(assert (=> b!731733 (= lt!324143 (select (arr!19724 a!3186) j!159))))

(declare-fun lt!324142 () Unit!24932)

(assert (=> b!731733 (= lt!324142 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!324143 j!159))))

(assert (=> b!731733 (arrayContainsKey!0 a!3186 lt!324143 #b00000000000000000000000000000000)))

(declare-fun lt!324141 () Unit!24932)

(assert (=> b!731733 (= lt!324141 lt!324142)))

(declare-fun res!491737 () Bool)

(assert (=> b!731733 (= res!491737 (= (seekEntryOrOpen!0 (select (arr!19724 a!3186) j!159) a!3186 mask!3328) (Found!7321 j!159)))))

(assert (=> b!731733 (=> (not res!491737) (not e!409439))))

(declare-fun d!99545 () Bool)

(declare-fun res!491738 () Bool)

(declare-fun e!409441 () Bool)

(assert (=> d!99545 (=> res!491738 e!409441)))

(assert (=> d!99545 (= res!491738 (bvsge j!159 (size!20145 a!3186)))))

(assert (=> d!99545 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!409441)))

(declare-fun b!731734 () Bool)

(assert (=> b!731734 (= e!409441 e!409440)))

(declare-fun c!80374 () Bool)

(assert (=> b!731734 (= c!80374 (validKeyInArray!0 (select (arr!19724 a!3186) j!159)))))

(declare-fun bm!34823 () Bool)

(declare-fun call!34826 () Bool)

(assert (=> bm!34823 (= call!34826 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!731735 () Bool)

(assert (=> b!731735 (= e!409439 call!34826)))

(declare-fun b!731736 () Bool)

(assert (=> b!731736 (= e!409440 call!34826)))

(assert (= (and d!99545 (not res!491738)) b!731734))

(assert (= (and b!731734 c!80374) b!731733))

(assert (= (and b!731734 (not c!80374)) b!731736))

(assert (= (and b!731733 res!491737) b!731735))

(assert (= (or b!731735 b!731736) bm!34823))

(assert (=> b!731733 m!684289))

(declare-fun m!684459 () Bool)

(assert (=> b!731733 m!684459))

(declare-fun m!684461 () Bool)

(assert (=> b!731733 m!684461))

(assert (=> b!731733 m!684289))

(assert (=> b!731733 m!684315))

(assert (=> b!731734 m!684289))

(assert (=> b!731734 m!684289))

(assert (=> b!731734 m!684327))

(declare-fun m!684463 () Bool)

(assert (=> bm!34823 m!684463))

(assert (=> b!731569 d!99545))

(declare-fun d!99547 () Bool)

(assert (=> d!99547 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!324146 () Unit!24932)

(declare-fun choose!38 (array!41211 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24932)

(assert (=> d!99547 (= lt!324146 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!99547 (validMask!0 mask!3328)))

(assert (=> d!99547 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!324146)))

(declare-fun bs!20913 () Bool)

(assert (= bs!20913 d!99547))

(assert (=> bs!20913 m!684331))

(declare-fun m!684465 () Bool)

(assert (=> bs!20913 m!684465))

(assert (=> bs!20913 m!684307))

(assert (=> b!731569 d!99547))

(declare-fun d!99551 () Bool)

(assert (=> d!99551 (= (validKeyInArray!0 (select (arr!19724 a!3186) j!159)) (and (not (= (select (arr!19724 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19724 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!731575 d!99551))

(declare-fun d!99553 () Bool)

(assert (=> d!99553 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!731576 d!99553))

(declare-fun d!99555 () Bool)

(declare-fun lt!324149 () (_ BitVec 32))

(assert (=> d!99555 (and (bvsge lt!324149 #b00000000000000000000000000000000) (bvslt lt!324149 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!99555 (= lt!324149 (choose!52 index!1321 x!1131 mask!3328))))

(assert (=> d!99555 (validMask!0 mask!3328)))

(assert (=> d!99555 (= (nextIndex!0 index!1321 x!1131 mask!3328) lt!324149)))

(declare-fun bs!20914 () Bool)

(assert (= bs!20914 d!99555))

(declare-fun m!684467 () Bool)

(assert (=> bs!20914 m!684467))

(assert (=> bs!20914 m!684307))

(assert (=> b!731565 d!99555))

(declare-fun e!409459 () SeekEntryResult!7321)

(declare-fun b!731763 () Bool)

(assert (=> b!731763 (= e!409459 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!19724 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!731764 () Bool)

(declare-fun e!409457 () SeekEntryResult!7321)

(declare-fun e!409458 () SeekEntryResult!7321)

(assert (=> b!731764 (= e!409457 e!409458)))

(declare-fun lt!324167 () (_ BitVec 64))

(declare-fun c!80384 () Bool)

(assert (=> b!731764 (= c!80384 (= lt!324167 (select (arr!19724 a!3186) j!159)))))

(declare-fun b!731765 () Bool)

(declare-fun c!80385 () Bool)

(assert (=> b!731765 (= c!80385 (= lt!324167 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!731765 (= e!409458 e!409459)))

(declare-fun b!731766 () Bool)

(assert (=> b!731766 (= e!409457 Undefined!7321)))

(declare-fun b!731767 () Bool)

(assert (=> b!731767 (= e!409459 (MissingVacant!7321 resIntermediateIndex!5))))

(declare-fun b!731768 () Bool)

(assert (=> b!731768 (= e!409458 (Found!7321 index!1321))))

(declare-fun lt!324168 () SeekEntryResult!7321)

(declare-fun d!99559 () Bool)

(assert (=> d!99559 (and (or ((_ is Undefined!7321) lt!324168) (not ((_ is Found!7321) lt!324168)) (and (bvsge (index!31653 lt!324168) #b00000000000000000000000000000000) (bvslt (index!31653 lt!324168) (size!20145 a!3186)))) (or ((_ is Undefined!7321) lt!324168) ((_ is Found!7321) lt!324168) (not ((_ is MissingVacant!7321) lt!324168)) (not (= (index!31655 lt!324168) resIntermediateIndex!5)) (and (bvsge (index!31655 lt!324168) #b00000000000000000000000000000000) (bvslt (index!31655 lt!324168) (size!20145 a!3186)))) (or ((_ is Undefined!7321) lt!324168) (ite ((_ is Found!7321) lt!324168) (= (select (arr!19724 a!3186) (index!31653 lt!324168)) (select (arr!19724 a!3186) j!159)) (and ((_ is MissingVacant!7321) lt!324168) (= (index!31655 lt!324168) resIntermediateIndex!5) (= (select (arr!19724 a!3186) (index!31655 lt!324168)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!99559 (= lt!324168 e!409457)))

(declare-fun c!80386 () Bool)

(assert (=> d!99559 (= c!80386 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!99559 (= lt!324167 (select (arr!19724 a!3186) index!1321))))

(assert (=> d!99559 (validMask!0 mask!3328)))

(assert (=> d!99559 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19724 a!3186) j!159) a!3186 mask!3328) lt!324168)))

(assert (= (and d!99559 c!80386) b!731766))

(assert (= (and d!99559 (not c!80386)) b!731764))

(assert (= (and b!731764 c!80384) b!731768))

(assert (= (and b!731764 (not c!80384)) b!731765))

(assert (= (and b!731765 c!80385) b!731767))

(assert (= (and b!731765 (not c!80385)) b!731763))

(assert (=> b!731763 m!684287))

(assert (=> b!731763 m!684287))

(assert (=> b!731763 m!684289))

(declare-fun m!684481 () Bool)

(assert (=> b!731763 m!684481))

(declare-fun m!684483 () Bool)

(assert (=> d!99559 m!684483))

(declare-fun m!684485 () Bool)

(assert (=> d!99559 m!684485))

(declare-fun m!684487 () Bool)

(assert (=> d!99559 m!684487))

(assert (=> d!99559 m!684307))

(assert (=> b!731562 d!99559))

(declare-fun b!731846 () Bool)

(declare-fun e!409507 () Bool)

(declare-fun lt!324189 () SeekEntryResult!7321)

(assert (=> b!731846 (= e!409507 (bvsge (x!62646 lt!324189) #b01111111111111111111111111111110))))

(declare-fun b!731848 () Bool)

(assert (=> b!731848 (and (bvsge (index!31654 lt!324189) #b00000000000000000000000000000000) (bvslt (index!31654 lt!324189) (size!20145 a!3186)))))

(declare-fun res!491761 () Bool)

(assert (=> b!731848 (= res!491761 (= (select (arr!19724 a!3186) (index!31654 lt!324189)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!409504 () Bool)

(assert (=> b!731848 (=> res!491761 e!409504)))

(declare-fun b!731849 () Bool)

(assert (=> b!731849 (and (bvsge (index!31654 lt!324189) #b00000000000000000000000000000000) (bvslt (index!31654 lt!324189) (size!20145 a!3186)))))

(declare-fun res!491760 () Bool)

(assert (=> b!731849 (= res!491760 (= (select (arr!19724 a!3186) (index!31654 lt!324189)) (select (arr!19724 a!3186) j!159)))))

(assert (=> b!731849 (=> res!491760 e!409504)))

(declare-fun e!409508 () Bool)

(assert (=> b!731849 (= e!409508 e!409504)))

(declare-fun b!731850 () Bool)

(assert (=> b!731850 (and (bvsge (index!31654 lt!324189) #b00000000000000000000000000000000) (bvslt (index!31654 lt!324189) (size!20145 a!3186)))))

(assert (=> b!731850 (= e!409504 (= (select (arr!19724 a!3186) (index!31654 lt!324189)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!409506 () SeekEntryResult!7321)

(declare-fun b!731851 () Bool)

(assert (=> b!731851 (= e!409506 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!19724 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!731852 () Bool)

(declare-fun e!409505 () SeekEntryResult!7321)

(assert (=> b!731852 (= e!409505 (Intermediate!7321 true index!1321 x!1131))))

(declare-fun b!731853 () Bool)

(assert (=> b!731853 (= e!409507 e!409508)))

(declare-fun res!491762 () Bool)

(assert (=> b!731853 (= res!491762 (and ((_ is Intermediate!7321) lt!324189) (not (undefined!8133 lt!324189)) (bvslt (x!62646 lt!324189) #b01111111111111111111111111111110) (bvsge (x!62646 lt!324189) #b00000000000000000000000000000000) (bvsge (x!62646 lt!324189) x!1131)))))

(assert (=> b!731853 (=> (not res!491762) (not e!409508))))

(declare-fun b!731854 () Bool)

(assert (=> b!731854 (= e!409505 e!409506)))

(declare-fun lt!324188 () (_ BitVec 64))

(declare-fun c!80420 () Bool)

(assert (=> b!731854 (= c!80420 (or (= lt!324188 (select (arr!19724 a!3186) j!159)) (= (bvadd lt!324188 lt!324188) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!99563 () Bool)

(assert (=> d!99563 e!409507))

(declare-fun c!80419 () Bool)

(assert (=> d!99563 (= c!80419 (and ((_ is Intermediate!7321) lt!324189) (undefined!8133 lt!324189)))))

(assert (=> d!99563 (= lt!324189 e!409505)))

(declare-fun c!80418 () Bool)

(assert (=> d!99563 (= c!80418 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!99563 (= lt!324188 (select (arr!19724 a!3186) index!1321))))

(assert (=> d!99563 (validMask!0 mask!3328)))

(assert (=> d!99563 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19724 a!3186) j!159) a!3186 mask!3328) lt!324189)))

(declare-fun b!731847 () Bool)

(assert (=> b!731847 (= e!409506 (Intermediate!7321 false index!1321 x!1131))))

(assert (= (and d!99563 c!80418) b!731852))

(assert (= (and d!99563 (not c!80418)) b!731854))

(assert (= (and b!731854 c!80420) b!731847))

(assert (= (and b!731854 (not c!80420)) b!731851))

(assert (= (and d!99563 c!80419) b!731846))

(assert (= (and d!99563 (not c!80419)) b!731853))

(assert (= (and b!731853 res!491762) b!731849))

(assert (= (and b!731849 (not res!491760)) b!731848))

(assert (= (and b!731848 (not res!491761)) b!731850))

(assert (=> d!99563 m!684487))

(assert (=> d!99563 m!684307))

(declare-fun m!684519 () Bool)

(assert (=> b!731849 m!684519))

(assert (=> b!731851 m!684287))

(assert (=> b!731851 m!684287))

(assert (=> b!731851 m!684289))

(declare-fun m!684521 () Bool)

(assert (=> b!731851 m!684521))

(assert (=> b!731850 m!684519))

(assert (=> b!731848 m!684519))

(assert (=> b!731573 d!99563))

(declare-fun b!731863 () Bool)

(declare-fun e!409517 () SeekEntryResult!7321)

(assert (=> b!731863 (= e!409517 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!19724 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!731864 () Bool)

(declare-fun e!409515 () SeekEntryResult!7321)

(declare-fun e!409516 () SeekEntryResult!7321)

(assert (=> b!731864 (= e!409515 e!409516)))

(declare-fun c!80423 () Bool)

(declare-fun lt!324190 () (_ BitVec 64))

(assert (=> b!731864 (= c!80423 (= lt!324190 (select (arr!19724 a!3186) j!159)))))

(declare-fun b!731865 () Bool)

(declare-fun c!80424 () Bool)

(assert (=> b!731865 (= c!80424 (= lt!324190 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!731865 (= e!409516 e!409517)))

(declare-fun b!731866 () Bool)

(assert (=> b!731866 (= e!409515 Undefined!7321)))

(declare-fun b!731867 () Bool)

(assert (=> b!731867 (= e!409517 (MissingVacant!7321 resIntermediateIndex!5))))

(declare-fun b!731868 () Bool)

(assert (=> b!731868 (= e!409516 (Found!7321 resIntermediateIndex!5))))

(declare-fun lt!324191 () SeekEntryResult!7321)

(declare-fun d!99571 () Bool)

(assert (=> d!99571 (and (or ((_ is Undefined!7321) lt!324191) (not ((_ is Found!7321) lt!324191)) (and (bvsge (index!31653 lt!324191) #b00000000000000000000000000000000) (bvslt (index!31653 lt!324191) (size!20145 a!3186)))) (or ((_ is Undefined!7321) lt!324191) ((_ is Found!7321) lt!324191) (not ((_ is MissingVacant!7321) lt!324191)) (not (= (index!31655 lt!324191) resIntermediateIndex!5)) (and (bvsge (index!31655 lt!324191) #b00000000000000000000000000000000) (bvslt (index!31655 lt!324191) (size!20145 a!3186)))) (or ((_ is Undefined!7321) lt!324191) (ite ((_ is Found!7321) lt!324191) (= (select (arr!19724 a!3186) (index!31653 lt!324191)) (select (arr!19724 a!3186) j!159)) (and ((_ is MissingVacant!7321) lt!324191) (= (index!31655 lt!324191) resIntermediateIndex!5) (= (select (arr!19724 a!3186) (index!31655 lt!324191)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!99571 (= lt!324191 e!409515)))

(declare-fun c!80425 () Bool)

(assert (=> d!99571 (= c!80425 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!99571 (= lt!324190 (select (arr!19724 a!3186) resIntermediateIndex!5))))

(assert (=> d!99571 (validMask!0 mask!3328)))

(assert (=> d!99571 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19724 a!3186) j!159) a!3186 mask!3328) lt!324191)))

(assert (= (and d!99571 c!80425) b!731866))

(assert (= (and d!99571 (not c!80425)) b!731864))

(assert (= (and b!731864 c!80423) b!731868))

(assert (= (and b!731864 (not c!80423)) b!731865))

(assert (= (and b!731865 c!80424) b!731867))

(assert (= (and b!731865 (not c!80424)) b!731863))

(declare-fun m!684523 () Bool)

(assert (=> b!731863 m!684523))

(assert (=> b!731863 m!684523))

(assert (=> b!731863 m!684289))

(declare-fun m!684525 () Bool)

(assert (=> b!731863 m!684525))

(declare-fun m!684527 () Bool)

(assert (=> d!99571 m!684527))

(declare-fun m!684529 () Bool)

(assert (=> d!99571 m!684529))

(assert (=> d!99571 m!684311))

(assert (=> d!99571 m!684307))

(assert (=> b!731563 d!99571))

(declare-fun b!731869 () Bool)

(declare-fun e!409521 () Bool)

(declare-fun lt!324193 () SeekEntryResult!7321)

(assert (=> b!731869 (= e!409521 (bvsge (x!62646 lt!324193) #b01111111111111111111111111111110))))

(declare-fun b!731871 () Bool)

(assert (=> b!731871 (and (bvsge (index!31654 lt!324193) #b00000000000000000000000000000000) (bvslt (index!31654 lt!324193) (size!20145 lt!324064)))))

(declare-fun res!491770 () Bool)

(assert (=> b!731871 (= res!491770 (= (select (arr!19724 lt!324064) (index!31654 lt!324193)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!409518 () Bool)

(assert (=> b!731871 (=> res!491770 e!409518)))

(declare-fun b!731872 () Bool)

(assert (=> b!731872 (and (bvsge (index!31654 lt!324193) #b00000000000000000000000000000000) (bvslt (index!31654 lt!324193) (size!20145 lt!324064)))))

(declare-fun res!491769 () Bool)

(assert (=> b!731872 (= res!491769 (= (select (arr!19724 lt!324064) (index!31654 lt!324193)) lt!324061))))

(assert (=> b!731872 (=> res!491769 e!409518)))

(declare-fun e!409522 () Bool)

(assert (=> b!731872 (= e!409522 e!409518)))

(declare-fun b!731873 () Bool)

(assert (=> b!731873 (and (bvsge (index!31654 lt!324193) #b00000000000000000000000000000000) (bvslt (index!31654 lt!324193) (size!20145 lt!324064)))))

(assert (=> b!731873 (= e!409518 (= (select (arr!19724 lt!324064) (index!31654 lt!324193)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!731874 () Bool)

(declare-fun e!409520 () SeekEntryResult!7321)

(assert (=> b!731874 (= e!409520 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!324061 lt!324064 mask!3328))))

(declare-fun b!731875 () Bool)

(declare-fun e!409519 () SeekEntryResult!7321)

(assert (=> b!731875 (= e!409519 (Intermediate!7321 true index!1321 x!1131))))

(declare-fun b!731876 () Bool)

(assert (=> b!731876 (= e!409521 e!409522)))

(declare-fun res!491771 () Bool)

(assert (=> b!731876 (= res!491771 (and ((_ is Intermediate!7321) lt!324193) (not (undefined!8133 lt!324193)) (bvslt (x!62646 lt!324193) #b01111111111111111111111111111110) (bvsge (x!62646 lt!324193) #b00000000000000000000000000000000) (bvsge (x!62646 lt!324193) x!1131)))))

(assert (=> b!731876 (=> (not res!491771) (not e!409522))))

(declare-fun b!731877 () Bool)

(assert (=> b!731877 (= e!409519 e!409520)))

(declare-fun c!80428 () Bool)

(declare-fun lt!324192 () (_ BitVec 64))

(assert (=> b!731877 (= c!80428 (or (= lt!324192 lt!324061) (= (bvadd lt!324192 lt!324192) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!99573 () Bool)

(assert (=> d!99573 e!409521))

(declare-fun c!80427 () Bool)

(assert (=> d!99573 (= c!80427 (and ((_ is Intermediate!7321) lt!324193) (undefined!8133 lt!324193)))))

(assert (=> d!99573 (= lt!324193 e!409519)))

(declare-fun c!80426 () Bool)

(assert (=> d!99573 (= c!80426 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!99573 (= lt!324192 (select (arr!19724 lt!324064) index!1321))))

(assert (=> d!99573 (validMask!0 mask!3328)))

(assert (=> d!99573 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!324061 lt!324064 mask!3328) lt!324193)))

(declare-fun b!731870 () Bool)

(assert (=> b!731870 (= e!409520 (Intermediate!7321 false index!1321 x!1131))))

(assert (= (and d!99573 c!80426) b!731875))

(assert (= (and d!99573 (not c!80426)) b!731877))

(assert (= (and b!731877 c!80428) b!731870))

(assert (= (and b!731877 (not c!80428)) b!731874))

(assert (= (and d!99573 c!80427) b!731869))

(assert (= (and d!99573 (not c!80427)) b!731876))

(assert (= (and b!731876 res!491771) b!731872))

(assert (= (and b!731872 (not res!491769)) b!731871))

(assert (= (and b!731871 (not res!491770)) b!731873))

(declare-fun m!684531 () Bool)

(assert (=> d!99573 m!684531))

(assert (=> d!99573 m!684307))

(declare-fun m!684533 () Bool)

(assert (=> b!731872 m!684533))

(assert (=> b!731874 m!684287))

(assert (=> b!731874 m!684287))

(declare-fun m!684535 () Bool)

(assert (=> b!731874 m!684535))

(assert (=> b!731873 m!684533))

(assert (=> b!731871 m!684533))

(assert (=> b!731564 d!99573))

(declare-fun b!731878 () Bool)

(declare-fun e!409526 () Bool)

(declare-fun lt!324195 () SeekEntryResult!7321)

(assert (=> b!731878 (= e!409526 (bvsge (x!62646 lt!324195) #b01111111111111111111111111111110))))

(declare-fun b!731880 () Bool)

(assert (=> b!731880 (and (bvsge (index!31654 lt!324195) #b00000000000000000000000000000000) (bvslt (index!31654 lt!324195) (size!20145 lt!324064)))))

(declare-fun res!491773 () Bool)

(assert (=> b!731880 (= res!491773 (= (select (arr!19724 lt!324064) (index!31654 lt!324195)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!409523 () Bool)

(assert (=> b!731880 (=> res!491773 e!409523)))

(declare-fun b!731881 () Bool)

(assert (=> b!731881 (and (bvsge (index!31654 lt!324195) #b00000000000000000000000000000000) (bvslt (index!31654 lt!324195) (size!20145 lt!324064)))))

(declare-fun res!491772 () Bool)

(assert (=> b!731881 (= res!491772 (= (select (arr!19724 lt!324064) (index!31654 lt!324195)) lt!324061))))

(assert (=> b!731881 (=> res!491772 e!409523)))

(declare-fun e!409527 () Bool)

(assert (=> b!731881 (= e!409527 e!409523)))

(declare-fun b!731882 () Bool)

(assert (=> b!731882 (and (bvsge (index!31654 lt!324195) #b00000000000000000000000000000000) (bvslt (index!31654 lt!324195) (size!20145 lt!324064)))))

(assert (=> b!731882 (= e!409523 (= (select (arr!19724 lt!324064) (index!31654 lt!324195)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!731883 () Bool)

(declare-fun e!409525 () SeekEntryResult!7321)

(assert (=> b!731883 (= e!409525 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!324061 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!324061 lt!324064 mask!3328))))

(declare-fun b!731884 () Bool)

(declare-fun e!409524 () SeekEntryResult!7321)

(assert (=> b!731884 (= e!409524 (Intermediate!7321 true (toIndex!0 lt!324061 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!731885 () Bool)

(assert (=> b!731885 (= e!409526 e!409527)))

(declare-fun res!491774 () Bool)

(assert (=> b!731885 (= res!491774 (and ((_ is Intermediate!7321) lt!324195) (not (undefined!8133 lt!324195)) (bvslt (x!62646 lt!324195) #b01111111111111111111111111111110) (bvsge (x!62646 lt!324195) #b00000000000000000000000000000000) (bvsge (x!62646 lt!324195) #b00000000000000000000000000000000)))))

(assert (=> b!731885 (=> (not res!491774) (not e!409527))))

(declare-fun b!731886 () Bool)

(assert (=> b!731886 (= e!409524 e!409525)))

(declare-fun c!80431 () Bool)

(declare-fun lt!324194 () (_ BitVec 64))

(assert (=> b!731886 (= c!80431 (or (= lt!324194 lt!324061) (= (bvadd lt!324194 lt!324194) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!99575 () Bool)

(assert (=> d!99575 e!409526))

(declare-fun c!80430 () Bool)

(assert (=> d!99575 (= c!80430 (and ((_ is Intermediate!7321) lt!324195) (undefined!8133 lt!324195)))))

(assert (=> d!99575 (= lt!324195 e!409524)))

(declare-fun c!80429 () Bool)

(assert (=> d!99575 (= c!80429 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!99575 (= lt!324194 (select (arr!19724 lt!324064) (toIndex!0 lt!324061 mask!3328)))))

(assert (=> d!99575 (validMask!0 mask!3328)))

(assert (=> d!99575 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!324061 mask!3328) lt!324061 lt!324064 mask!3328) lt!324195)))

(declare-fun b!731879 () Bool)

(assert (=> b!731879 (= e!409525 (Intermediate!7321 false (toIndex!0 lt!324061 mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!99575 c!80429) b!731884))

(assert (= (and d!99575 (not c!80429)) b!731886))

(assert (= (and b!731886 c!80431) b!731879))

(assert (= (and b!731886 (not c!80431)) b!731883))

(assert (= (and d!99575 c!80430) b!731878))

(assert (= (and d!99575 (not c!80430)) b!731885))

(assert (= (and b!731885 res!491774) b!731881))

(assert (= (and b!731881 (not res!491772)) b!731880))

(assert (= (and b!731880 (not res!491773)) b!731882))

(assert (=> d!99575 m!684323))

(declare-fun m!684537 () Bool)

(assert (=> d!99575 m!684537))

(assert (=> d!99575 m!684307))

(declare-fun m!684539 () Bool)

(assert (=> b!731881 m!684539))

(assert (=> b!731883 m!684323))

(declare-fun m!684541 () Bool)

(assert (=> b!731883 m!684541))

(assert (=> b!731883 m!684541))

(declare-fun m!684543 () Bool)

(assert (=> b!731883 m!684543))

(assert (=> b!731882 m!684539))

(assert (=> b!731880 m!684539))

(assert (=> b!731564 d!99575))

(declare-fun d!99577 () Bool)

(declare-fun lt!324209 () (_ BitVec 32))

(declare-fun lt!324208 () (_ BitVec 32))

(assert (=> d!99577 (= lt!324209 (bvmul (bvxor lt!324208 (bvlshr lt!324208 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99577 (= lt!324208 ((_ extract 31 0) (bvand (bvxor lt!324061 (bvlshr lt!324061 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99577 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!491778 (let ((h!14827 ((_ extract 31 0) (bvand (bvxor lt!324061 (bvlshr lt!324061 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!62654 (bvmul (bvxor h!14827 (bvlshr h!14827 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!62654 (bvlshr x!62654 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!491778 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!491778 #b00000000000000000000000000000000))))))

(assert (=> d!99577 (= (toIndex!0 lt!324061 mask!3328) (bvand (bvxor lt!324209 (bvlshr lt!324209 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!731564 d!99577))

(declare-fun b!731942 () Bool)

(declare-fun e!409563 () Bool)

(declare-fun call!34835 () Bool)

(assert (=> b!731942 (= e!409563 call!34835)))

(declare-fun b!731943 () Bool)

(assert (=> b!731943 (= e!409563 call!34835)))

(declare-fun b!731944 () Bool)

(declare-fun e!409564 () Bool)

(declare-fun e!409561 () Bool)

(assert (=> b!731944 (= e!409564 e!409561)))

(declare-fun res!491800 () Bool)

(assert (=> b!731944 (=> (not res!491800) (not e!409561))))

(declare-fun e!409562 () Bool)

(assert (=> b!731944 (= res!491800 (not e!409562))))

(declare-fun res!491799 () Bool)

(assert (=> b!731944 (=> (not res!491799) (not e!409562))))

(assert (=> b!731944 (= res!491799 (validKeyInArray!0 (select (arr!19724 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!731945 () Bool)

(declare-fun contains!4038 (List!13765 (_ BitVec 64)) Bool)

(assert (=> b!731945 (= e!409562 (contains!4038 Nil!13762 (select (arr!19724 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!99583 () Bool)

(declare-fun res!491801 () Bool)

(assert (=> d!99583 (=> res!491801 e!409564)))

(assert (=> d!99583 (= res!491801 (bvsge #b00000000000000000000000000000000 (size!20145 a!3186)))))

(assert (=> d!99583 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13762) e!409564)))

(declare-fun b!731946 () Bool)

(assert (=> b!731946 (= e!409561 e!409563)))

(declare-fun c!80449 () Bool)

(assert (=> b!731946 (= c!80449 (validKeyInArray!0 (select (arr!19724 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!34832 () Bool)

(assert (=> bm!34832 (= call!34835 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!80449 (Cons!13761 (select (arr!19724 a!3186) #b00000000000000000000000000000000) Nil!13762) Nil!13762)))))

(assert (= (and d!99583 (not res!491801)) b!731944))

(assert (= (and b!731944 res!491799) b!731945))

(assert (= (and b!731944 res!491800) b!731946))

(assert (= (and b!731946 c!80449) b!731942))

(assert (= (and b!731946 (not c!80449)) b!731943))

(assert (= (or b!731942 b!731943) bm!34832))

(assert (=> b!731944 m!684445))

(assert (=> b!731944 m!684445))

(assert (=> b!731944 m!684453))

(assert (=> b!731945 m!684445))

(assert (=> b!731945 m!684445))

(declare-fun m!684567 () Bool)

(assert (=> b!731945 m!684567))

(assert (=> b!731946 m!684445))

(assert (=> b!731946 m!684445))

(assert (=> b!731946 m!684453))

(assert (=> bm!34832 m!684445))

(declare-fun m!684569 () Bool)

(assert (=> bm!34832 m!684569))

(assert (=> b!731570 d!99583))

(declare-fun b!731947 () Bool)

(declare-fun c!80450 () Bool)

(declare-fun lt!324220 () (_ BitVec 64))

(assert (=> b!731947 (= c!80450 (= lt!324220 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!409565 () SeekEntryResult!7321)

(declare-fun e!409566 () SeekEntryResult!7321)

(assert (=> b!731947 (= e!409565 e!409566)))

(declare-fun b!731948 () Bool)

(declare-fun e!409567 () SeekEntryResult!7321)

(assert (=> b!731948 (= e!409567 e!409565)))

(declare-fun lt!324219 () SeekEntryResult!7321)

(assert (=> b!731948 (= lt!324220 (select (arr!19724 a!3186) (index!31654 lt!324219)))))

(declare-fun c!80451 () Bool)

(assert (=> b!731948 (= c!80451 (= lt!324220 (select (arr!19724 a!3186) j!159)))))

(declare-fun d!99589 () Bool)

(declare-fun lt!324218 () SeekEntryResult!7321)

(assert (=> d!99589 (and (or ((_ is Undefined!7321) lt!324218) (not ((_ is Found!7321) lt!324218)) (and (bvsge (index!31653 lt!324218) #b00000000000000000000000000000000) (bvslt (index!31653 lt!324218) (size!20145 a!3186)))) (or ((_ is Undefined!7321) lt!324218) ((_ is Found!7321) lt!324218) (not ((_ is MissingZero!7321) lt!324218)) (and (bvsge (index!31652 lt!324218) #b00000000000000000000000000000000) (bvslt (index!31652 lt!324218) (size!20145 a!3186)))) (or ((_ is Undefined!7321) lt!324218) ((_ is Found!7321) lt!324218) ((_ is MissingZero!7321) lt!324218) (not ((_ is MissingVacant!7321) lt!324218)) (and (bvsge (index!31655 lt!324218) #b00000000000000000000000000000000) (bvslt (index!31655 lt!324218) (size!20145 a!3186)))) (or ((_ is Undefined!7321) lt!324218) (ite ((_ is Found!7321) lt!324218) (= (select (arr!19724 a!3186) (index!31653 lt!324218)) (select (arr!19724 a!3186) j!159)) (ite ((_ is MissingZero!7321) lt!324218) (= (select (arr!19724 a!3186) (index!31652 lt!324218)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7321) lt!324218) (= (select (arr!19724 a!3186) (index!31655 lt!324218)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!99589 (= lt!324218 e!409567)))

(declare-fun c!80452 () Bool)

(assert (=> d!99589 (= c!80452 (and ((_ is Intermediate!7321) lt!324219) (undefined!8133 lt!324219)))))

(assert (=> d!99589 (= lt!324219 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19724 a!3186) j!159) mask!3328) (select (arr!19724 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!99589 (validMask!0 mask!3328)))

(assert (=> d!99589 (= (seekEntryOrOpen!0 (select (arr!19724 a!3186) j!159) a!3186 mask!3328) lt!324218)))

(declare-fun b!731949 () Bool)

(assert (=> b!731949 (= e!409567 Undefined!7321)))

(declare-fun b!731950 () Bool)

(assert (=> b!731950 (= e!409566 (MissingZero!7321 (index!31654 lt!324219)))))

(declare-fun b!731951 () Bool)

(assert (=> b!731951 (= e!409565 (Found!7321 (index!31654 lt!324219)))))

(declare-fun b!731952 () Bool)

(assert (=> b!731952 (= e!409566 (seekKeyOrZeroReturnVacant!0 (x!62646 lt!324219) (index!31654 lt!324219) (index!31654 lt!324219) (select (arr!19724 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!99589 c!80452) b!731949))

(assert (= (and d!99589 (not c!80452)) b!731948))

(assert (= (and b!731948 c!80451) b!731951))

(assert (= (and b!731948 (not c!80451)) b!731947))

(assert (= (and b!731947 c!80450) b!731950))

(assert (= (and b!731947 (not c!80450)) b!731952))

(declare-fun m!684571 () Bool)

(assert (=> b!731948 m!684571))

(assert (=> d!99589 m!684307))

(declare-fun m!684573 () Bool)

(assert (=> d!99589 m!684573))

(declare-fun m!684575 () Bool)

(assert (=> d!99589 m!684575))

(assert (=> d!99589 m!684297))

(assert (=> d!99589 m!684289))

(assert (=> d!99589 m!684299))

(declare-fun m!684577 () Bool)

(assert (=> d!99589 m!684577))

(assert (=> d!99589 m!684289))

(assert (=> d!99589 m!684297))

(assert (=> b!731952 m!684289))

(declare-fun m!684579 () Bool)

(assert (=> b!731952 m!684579))

(assert (=> b!731559 d!99589))

(declare-fun b!731953 () Bool)

(declare-fun e!409571 () Bool)

(declare-fun lt!324226 () SeekEntryResult!7321)

(assert (=> b!731953 (= e!409571 (bvsge (x!62646 lt!324226) #b01111111111111111111111111111110))))

(declare-fun b!731955 () Bool)

(assert (=> b!731955 (and (bvsge (index!31654 lt!324226) #b00000000000000000000000000000000) (bvslt (index!31654 lt!324226) (size!20145 a!3186)))))

(declare-fun res!491803 () Bool)

(assert (=> b!731955 (= res!491803 (= (select (arr!19724 a!3186) (index!31654 lt!324226)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!409568 () Bool)

(assert (=> b!731955 (=> res!491803 e!409568)))

(declare-fun b!731956 () Bool)

(assert (=> b!731956 (and (bvsge (index!31654 lt!324226) #b00000000000000000000000000000000) (bvslt (index!31654 lt!324226) (size!20145 a!3186)))))

(declare-fun res!491802 () Bool)

(assert (=> b!731956 (= res!491802 (= (select (arr!19724 a!3186) (index!31654 lt!324226)) (select (arr!19724 a!3186) j!159)))))

(assert (=> b!731956 (=> res!491802 e!409568)))

(declare-fun e!409572 () Bool)

(assert (=> b!731956 (= e!409572 e!409568)))

(declare-fun b!731957 () Bool)

(assert (=> b!731957 (and (bvsge (index!31654 lt!324226) #b00000000000000000000000000000000) (bvslt (index!31654 lt!324226) (size!20145 a!3186)))))

(assert (=> b!731957 (= e!409568 (= (select (arr!19724 a!3186) (index!31654 lt!324226)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!409570 () SeekEntryResult!7321)

(declare-fun b!731958 () Bool)

(assert (=> b!731958 (= e!409570 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!19724 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!19724 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!731959 () Bool)

(declare-fun e!409569 () SeekEntryResult!7321)

(assert (=> b!731959 (= e!409569 (Intermediate!7321 true (toIndex!0 (select (arr!19724 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!731960 () Bool)

(assert (=> b!731960 (= e!409571 e!409572)))

(declare-fun res!491804 () Bool)

(assert (=> b!731960 (= res!491804 (and ((_ is Intermediate!7321) lt!324226) (not (undefined!8133 lt!324226)) (bvslt (x!62646 lt!324226) #b01111111111111111111111111111110) (bvsge (x!62646 lt!324226) #b00000000000000000000000000000000) (bvsge (x!62646 lt!324226) #b00000000000000000000000000000000)))))

(assert (=> b!731960 (=> (not res!491804) (not e!409572))))

(declare-fun b!731961 () Bool)

(assert (=> b!731961 (= e!409569 e!409570)))

(declare-fun c!80455 () Bool)

(declare-fun lt!324225 () (_ BitVec 64))

(assert (=> b!731961 (= c!80455 (or (= lt!324225 (select (arr!19724 a!3186) j!159)) (= (bvadd lt!324225 lt!324225) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!99591 () Bool)

(assert (=> d!99591 e!409571))

(declare-fun c!80454 () Bool)

(assert (=> d!99591 (= c!80454 (and ((_ is Intermediate!7321) lt!324226) (undefined!8133 lt!324226)))))

(assert (=> d!99591 (= lt!324226 e!409569)))

(declare-fun c!80453 () Bool)

(assert (=> d!99591 (= c!80453 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!99591 (= lt!324225 (select (arr!19724 a!3186) (toIndex!0 (select (arr!19724 a!3186) j!159) mask!3328)))))

(assert (=> d!99591 (validMask!0 mask!3328)))

(assert (=> d!99591 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19724 a!3186) j!159) mask!3328) (select (arr!19724 a!3186) j!159) a!3186 mask!3328) lt!324226)))

(declare-fun b!731954 () Bool)

(assert (=> b!731954 (= e!409570 (Intermediate!7321 false (toIndex!0 (select (arr!19724 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!99591 c!80453) b!731959))

(assert (= (and d!99591 (not c!80453)) b!731961))

(assert (= (and b!731961 c!80455) b!731954))

(assert (= (and b!731961 (not c!80455)) b!731958))

(assert (= (and d!99591 c!80454) b!731953))

(assert (= (and d!99591 (not c!80454)) b!731960))

(assert (= (and b!731960 res!491804) b!731956))

(assert (= (and b!731956 (not res!491802)) b!731955))

(assert (= (and b!731955 (not res!491803)) b!731957))

(assert (=> d!99591 m!684297))

(declare-fun m!684581 () Bool)

(assert (=> d!99591 m!684581))

(assert (=> d!99591 m!684307))

(declare-fun m!684583 () Bool)

(assert (=> b!731956 m!684583))

(assert (=> b!731958 m!684297))

(declare-fun m!684585 () Bool)

(assert (=> b!731958 m!684585))

(assert (=> b!731958 m!684585))

(assert (=> b!731958 m!684289))

(declare-fun m!684587 () Bool)

(assert (=> b!731958 m!684587))

(assert (=> b!731957 m!684583))

(assert (=> b!731955 m!684583))

(assert (=> b!731560 d!99591))

(declare-fun d!99595 () Bool)

(declare-fun lt!324230 () (_ BitVec 32))

(declare-fun lt!324229 () (_ BitVec 32))

(assert (=> d!99595 (= lt!324230 (bvmul (bvxor lt!324229 (bvlshr lt!324229 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99595 (= lt!324229 ((_ extract 31 0) (bvand (bvxor (select (arr!19724 a!3186) j!159) (bvlshr (select (arr!19724 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99595 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!491778 (let ((h!14827 ((_ extract 31 0) (bvand (bvxor (select (arr!19724 a!3186) j!159) (bvlshr (select (arr!19724 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!62654 (bvmul (bvxor h!14827 (bvlshr h!14827 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!62654 (bvlshr x!62654 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!491778 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!491778 #b00000000000000000000000000000000))))))

(assert (=> d!99595 (= (toIndex!0 (select (arr!19724 a!3186) j!159) mask!3328) (bvand (bvxor lt!324230 (bvlshr lt!324230 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!731560 d!99595))

(assert (=> b!731571 d!99559))

(declare-fun d!99597 () Bool)

(assert (=> d!99597 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!64814 d!99597))

(declare-fun d!99611 () Bool)

(assert (=> d!99611 (= (array_inv!15607 a!3186) (bvsge (size!20145 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!64814 d!99611))

(check-sat (not d!99589) (not bm!34823) (not b!731724) (not d!99555) (not d!99575) (not d!99563) (not b!731874) (not d!99571) (not b!731952) (not b!731958) (not bm!34832) (not b!731734) (not d!99547) (not b!731863) (not b!731945) (not b!731763) (not b!731733) (not d!99591) (not b!731851) (not d!99573) (not bm!34822) (not d!99559) (not b!731944) (not d!99539) (not b!731714) (not b!731723) (not b!731946) (not b!731732) (not b!731883))
(check-sat)

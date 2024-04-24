; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64440 () Bool)

(assert start!64440)

(declare-fun b!724369 () Bool)

(declare-fun res!485721 () Bool)

(declare-fun e!405786 () Bool)

(assert (=> b!724369 (=> (not res!485721) (not e!405786))))

(declare-datatypes ((array!40954 0))(
  ( (array!40955 (arr!19597 (Array (_ BitVec 32) (_ BitVec 64))) (size!20017 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40954)

(declare-datatypes ((List!13506 0))(
  ( (Nil!13503) (Cons!13502 (h!14559 (_ BitVec 64)) (t!19813 List!13506)) )
))
(declare-fun arrayNoDuplicates!0 (array!40954 (_ BitVec 32) List!13506) Bool)

(assert (=> b!724369 (= res!485721 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13503))))

(declare-fun e!405787 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7153 0))(
  ( (MissingZero!7153 (index!30980 (_ BitVec 32))) (Found!7153 (index!30981 (_ BitVec 32))) (Intermediate!7153 (undefined!7965 Bool) (index!30982 (_ BitVec 32)) (x!62125 (_ BitVec 32))) (Undefined!7153) (MissingVacant!7153 (index!30983 (_ BitVec 32))) )
))
(declare-fun lt!320991 () SeekEntryResult!7153)

(declare-fun b!724370 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40954 (_ BitVec 32)) SeekEntryResult!7153)

(assert (=> b!724370 (= e!405787 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19597 a!3186) j!159) a!3186 mask!3328) lt!320991))))

(declare-fun b!724371 () Bool)

(declare-fun e!405791 () Bool)

(declare-fun e!405792 () Bool)

(assert (=> b!724371 (= e!405791 e!405792)))

(declare-fun res!485719 () Bool)

(assert (=> b!724371 (=> (not res!485719) (not e!405792))))

(declare-fun lt!320993 () array!40954)

(declare-fun lt!320990 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!724371 (= res!485719 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320990 mask!3328) lt!320990 lt!320993 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320990 lt!320993 mask!3328)))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!724371 (= lt!320990 (select (store (arr!19597 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!724371 (= lt!320993 (array!40955 (store (arr!19597 a!3186) i!1173 k0!2102) (size!20017 a!3186)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!724372 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40954 (_ BitVec 32)) SeekEntryResult!7153)

(assert (=> b!724372 (= e!405787 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19597 a!3186) j!159) a!3186 mask!3328) (Found!7153 j!159)))))

(declare-fun b!724373 () Bool)

(declare-fun res!485717 () Bool)

(assert (=> b!724373 (=> (not res!485717) (not e!405791))))

(assert (=> b!724373 (= res!485717 e!405787)))

(declare-fun c!79700 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!724373 (= c!79700 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!724374 () Bool)

(assert (=> b!724374 (= e!405792 (not (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(declare-fun e!405788 () Bool)

(assert (=> b!724374 e!405788))

(declare-fun res!485716 () Bool)

(assert (=> b!724374 (=> (not res!485716) (not e!405788))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40954 (_ BitVec 32)) Bool)

(assert (=> b!724374 (= res!485716 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24703 0))(
  ( (Unit!24704) )
))
(declare-fun lt!320992 () Unit!24703)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40954 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24703)

(assert (=> b!724374 (= lt!320992 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!724375 () Bool)

(assert (=> b!724375 (= e!405786 e!405791)))

(declare-fun res!485718 () Bool)

(assert (=> b!724375 (=> (not res!485718) (not e!405791))))

(assert (=> b!724375 (= res!485718 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19597 a!3186) j!159) mask!3328) (select (arr!19597 a!3186) j!159) a!3186 mask!3328) lt!320991))))

(assert (=> b!724375 (= lt!320991 (Intermediate!7153 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!724376 () Bool)

(declare-fun res!485726 () Bool)

(declare-fun e!405790 () Bool)

(assert (=> b!724376 (=> (not res!485726) (not e!405790))))

(assert (=> b!724376 (= res!485726 (and (= (size!20017 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20017 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20017 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!485720 () Bool)

(assert (=> start!64440 (=> (not res!485720) (not e!405790))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64440 (= res!485720 (validMask!0 mask!3328))))

(assert (=> start!64440 e!405790))

(assert (=> start!64440 true))

(declare-fun array_inv!15456 (array!40954) Bool)

(assert (=> start!64440 (array_inv!15456 a!3186)))

(declare-fun b!724377 () Bool)

(declare-fun res!485725 () Bool)

(assert (=> b!724377 (=> (not res!485725) (not e!405790))))

(declare-fun arrayContainsKey!0 (array!40954 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!724377 (= res!485725 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!724378 () Bool)

(declare-fun res!485728 () Bool)

(assert (=> b!724378 (=> (not res!485728) (not e!405786))))

(assert (=> b!724378 (= res!485728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!724379 () Bool)

(declare-fun res!485727 () Bool)

(assert (=> b!724379 (=> (not res!485727) (not e!405791))))

(assert (=> b!724379 (= res!485727 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19597 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!724380 () Bool)

(declare-fun res!485715 () Bool)

(assert (=> b!724380 (=> (not res!485715) (not e!405790))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!724380 (= res!485715 (validKeyInArray!0 k0!2102))))

(declare-fun b!724381 () Bool)

(declare-fun res!485724 () Bool)

(assert (=> b!724381 (=> (not res!485724) (not e!405786))))

(assert (=> b!724381 (= res!485724 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20017 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20017 a!3186))))))

(declare-fun b!724382 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40954 (_ BitVec 32)) SeekEntryResult!7153)

(assert (=> b!724382 (= e!405788 (= (seekEntryOrOpen!0 (select (arr!19597 a!3186) j!159) a!3186 mask!3328) (Found!7153 j!159)))))

(declare-fun b!724383 () Bool)

(declare-fun res!485723 () Bool)

(assert (=> b!724383 (=> (not res!485723) (not e!405790))))

(assert (=> b!724383 (= res!485723 (validKeyInArray!0 (select (arr!19597 a!3186) j!159)))))

(declare-fun b!724384 () Bool)

(assert (=> b!724384 (= e!405790 e!405786)))

(declare-fun res!485722 () Bool)

(assert (=> b!724384 (=> (not res!485722) (not e!405786))))

(declare-fun lt!320994 () SeekEntryResult!7153)

(assert (=> b!724384 (= res!485722 (or (= lt!320994 (MissingZero!7153 i!1173)) (= lt!320994 (MissingVacant!7153 i!1173))))))

(assert (=> b!724384 (= lt!320994 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!64440 res!485720) b!724376))

(assert (= (and b!724376 res!485726) b!724383))

(assert (= (and b!724383 res!485723) b!724380))

(assert (= (and b!724380 res!485715) b!724377))

(assert (= (and b!724377 res!485725) b!724384))

(assert (= (and b!724384 res!485722) b!724378))

(assert (= (and b!724378 res!485728) b!724369))

(assert (= (and b!724369 res!485721) b!724381))

(assert (= (and b!724381 res!485724) b!724375))

(assert (= (and b!724375 res!485718) b!724379))

(assert (= (and b!724379 res!485727) b!724373))

(assert (= (and b!724373 c!79700) b!724370))

(assert (= (and b!724373 (not c!79700)) b!724372))

(assert (= (and b!724373 res!485717) b!724371))

(assert (= (and b!724371 res!485719) b!724374))

(assert (= (and b!724374 res!485716) b!724382))

(declare-fun m!679281 () Bool)

(assert (=> b!724377 m!679281))

(declare-fun m!679283 () Bool)

(assert (=> b!724383 m!679283))

(assert (=> b!724383 m!679283))

(declare-fun m!679285 () Bool)

(assert (=> b!724383 m!679285))

(declare-fun m!679287 () Bool)

(assert (=> b!724379 m!679287))

(assert (=> b!724375 m!679283))

(assert (=> b!724375 m!679283))

(declare-fun m!679289 () Bool)

(assert (=> b!724375 m!679289))

(assert (=> b!724375 m!679289))

(assert (=> b!724375 m!679283))

(declare-fun m!679291 () Bool)

(assert (=> b!724375 m!679291))

(declare-fun m!679293 () Bool)

(assert (=> b!724378 m!679293))

(assert (=> b!724382 m!679283))

(assert (=> b!724382 m!679283))

(declare-fun m!679295 () Bool)

(assert (=> b!724382 m!679295))

(declare-fun m!679297 () Bool)

(assert (=> b!724380 m!679297))

(declare-fun m!679299 () Bool)

(assert (=> start!64440 m!679299))

(declare-fun m!679301 () Bool)

(assert (=> start!64440 m!679301))

(declare-fun m!679303 () Bool)

(assert (=> b!724371 m!679303))

(declare-fun m!679305 () Bool)

(assert (=> b!724371 m!679305))

(declare-fun m!679307 () Bool)

(assert (=> b!724371 m!679307))

(assert (=> b!724371 m!679305))

(declare-fun m!679309 () Bool)

(assert (=> b!724371 m!679309))

(declare-fun m!679311 () Bool)

(assert (=> b!724371 m!679311))

(declare-fun m!679313 () Bool)

(assert (=> b!724384 m!679313))

(assert (=> b!724372 m!679283))

(assert (=> b!724372 m!679283))

(declare-fun m!679315 () Bool)

(assert (=> b!724372 m!679315))

(declare-fun m!679317 () Bool)

(assert (=> b!724374 m!679317))

(declare-fun m!679319 () Bool)

(assert (=> b!724374 m!679319))

(declare-fun m!679321 () Bool)

(assert (=> b!724369 m!679321))

(assert (=> b!724370 m!679283))

(assert (=> b!724370 m!679283))

(declare-fun m!679323 () Bool)

(assert (=> b!724370 m!679323))

(check-sat (not b!724370) (not b!724378) (not b!724383) (not start!64440) (not b!724375) (not b!724371) (not b!724369) (not b!724374) (not b!724377) (not b!724382) (not b!724372) (not b!724384) (not b!724380))
(check-sat)

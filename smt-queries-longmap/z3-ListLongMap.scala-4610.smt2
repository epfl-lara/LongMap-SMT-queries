; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64356 () Bool)

(assert start!64356)

(declare-fun b!722509 () Bool)

(declare-fun res!484111 () Bool)

(declare-fun e!405064 () Bool)

(assert (=> b!722509 (=> (not res!484111) (not e!405064))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!40870 0))(
  ( (array!40871 (arr!19555 (Array (_ BitVec 32) (_ BitVec 64))) (size!19975 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40870)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!722509 (= res!484111 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19975 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19975 a!3186))))))

(declare-fun b!722510 () Bool)

(declare-fun res!484113 () Bool)

(declare-fun e!405062 () Bool)

(assert (=> b!722510 (=> (not res!484113) (not e!405062))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40870 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!722510 (= res!484113 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!722511 () Bool)

(assert (=> b!722511 (= e!405062 e!405064)))

(declare-fun res!484114 () Bool)

(assert (=> b!722511 (=> (not res!484114) (not e!405064))))

(declare-datatypes ((SeekEntryResult!7111 0))(
  ( (MissingZero!7111 (index!30812 (_ BitVec 32))) (Found!7111 (index!30813 (_ BitVec 32))) (Intermediate!7111 (undefined!7923 Bool) (index!30814 (_ BitVec 32)) (x!61971 (_ BitVec 32))) (Undefined!7111) (MissingVacant!7111 (index!30815 (_ BitVec 32))) )
))
(declare-fun lt!320356 () SeekEntryResult!7111)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!722511 (= res!484114 (or (= lt!320356 (MissingZero!7111 i!1173)) (= lt!320356 (MissingVacant!7111 i!1173))))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40870 (_ BitVec 32)) SeekEntryResult!7111)

(assert (=> b!722511 (= lt!320356 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!722512 () Bool)

(declare-fun e!405066 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!320357 () SeekEntryResult!7111)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40870 (_ BitVec 32)) SeekEntryResult!7111)

(assert (=> b!722512 (= e!405066 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19555 a!3186) j!159) a!3186 mask!3328) lt!320357)))))

(declare-fun res!484112 () Bool)

(assert (=> start!64356 (=> (not res!484112) (not e!405062))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64356 (= res!484112 (validMask!0 mask!3328))))

(assert (=> start!64356 e!405062))

(assert (=> start!64356 true))

(declare-fun array_inv!15414 (array!40870) Bool)

(assert (=> start!64356 (array_inv!15414 a!3186)))

(declare-fun b!722513 () Bool)

(declare-fun e!405063 () Bool)

(assert (=> b!722513 (= e!405064 e!405063)))

(declare-fun res!484116 () Bool)

(assert (=> b!722513 (=> (not res!484116) (not e!405063))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!722513 (= res!484116 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19555 a!3186) j!159) mask!3328) (select (arr!19555 a!3186) j!159) a!3186 mask!3328) lt!320357))))

(assert (=> b!722513 (= lt!320357 (Intermediate!7111 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!722514 () Bool)

(declare-fun res!484115 () Bool)

(assert (=> b!722514 (=> (not res!484115) (not e!405064))))

(declare-datatypes ((List!13464 0))(
  ( (Nil!13461) (Cons!13460 (h!14517 (_ BitVec 64)) (t!19771 List!13464)) )
))
(declare-fun arrayNoDuplicates!0 (array!40870 (_ BitVec 32) List!13464) Bool)

(assert (=> b!722514 (= res!484115 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13461))))

(declare-fun b!722515 () Bool)

(assert (=> b!722515 (= e!405063 false)))

(declare-fun lt!320358 () Bool)

(assert (=> b!722515 (= lt!320358 e!405066)))

(declare-fun c!79574 () Bool)

(assert (=> b!722515 (= c!79574 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!722516 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40870 (_ BitVec 32)) SeekEntryResult!7111)

(assert (=> b!722516 (= e!405066 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19555 a!3186) j!159) a!3186 mask!3328) (Found!7111 j!159))))))

(declare-fun b!722517 () Bool)

(declare-fun res!484107 () Bool)

(assert (=> b!722517 (=> (not res!484107) (not e!405062))))

(assert (=> b!722517 (= res!484107 (and (= (size!19975 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19975 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19975 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!722518 () Bool)

(declare-fun res!484117 () Bool)

(assert (=> b!722518 (=> (not res!484117) (not e!405064))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40870 (_ BitVec 32)) Bool)

(assert (=> b!722518 (= res!484117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!722519 () Bool)

(declare-fun res!484109 () Bool)

(assert (=> b!722519 (=> (not res!484109) (not e!405062))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!722519 (= res!484109 (validKeyInArray!0 k0!2102))))

(declare-fun b!722520 () Bool)

(declare-fun res!484110 () Bool)

(assert (=> b!722520 (=> (not res!484110) (not e!405062))))

(assert (=> b!722520 (= res!484110 (validKeyInArray!0 (select (arr!19555 a!3186) j!159)))))

(declare-fun b!722521 () Bool)

(declare-fun res!484108 () Bool)

(assert (=> b!722521 (=> (not res!484108) (not e!405063))))

(assert (=> b!722521 (= res!484108 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19555 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!64356 res!484112) b!722517))

(assert (= (and b!722517 res!484107) b!722520))

(assert (= (and b!722520 res!484110) b!722519))

(assert (= (and b!722519 res!484109) b!722510))

(assert (= (and b!722510 res!484113) b!722511))

(assert (= (and b!722511 res!484114) b!722518))

(assert (= (and b!722518 res!484117) b!722514))

(assert (= (and b!722514 res!484115) b!722509))

(assert (= (and b!722509 res!484111) b!722513))

(assert (= (and b!722513 res!484116) b!722521))

(assert (= (and b!722521 res!484108) b!722515))

(assert (= (and b!722515 c!79574) b!722512))

(assert (= (and b!722515 (not c!79574)) b!722516))

(declare-fun m!677625 () Bool)

(assert (=> b!722512 m!677625))

(assert (=> b!722512 m!677625))

(declare-fun m!677627 () Bool)

(assert (=> b!722512 m!677627))

(declare-fun m!677629 () Bool)

(assert (=> b!722510 m!677629))

(declare-fun m!677631 () Bool)

(assert (=> b!722519 m!677631))

(declare-fun m!677633 () Bool)

(assert (=> b!722521 m!677633))

(assert (=> b!722513 m!677625))

(assert (=> b!722513 m!677625))

(declare-fun m!677635 () Bool)

(assert (=> b!722513 m!677635))

(assert (=> b!722513 m!677635))

(assert (=> b!722513 m!677625))

(declare-fun m!677637 () Bool)

(assert (=> b!722513 m!677637))

(declare-fun m!677639 () Bool)

(assert (=> b!722518 m!677639))

(declare-fun m!677641 () Bool)

(assert (=> start!64356 m!677641))

(declare-fun m!677643 () Bool)

(assert (=> start!64356 m!677643))

(assert (=> b!722516 m!677625))

(assert (=> b!722516 m!677625))

(declare-fun m!677645 () Bool)

(assert (=> b!722516 m!677645))

(assert (=> b!722520 m!677625))

(assert (=> b!722520 m!677625))

(declare-fun m!677647 () Bool)

(assert (=> b!722520 m!677647))

(declare-fun m!677649 () Bool)

(assert (=> b!722511 m!677649))

(declare-fun m!677651 () Bool)

(assert (=> b!722514 m!677651))

(check-sat (not b!722514) (not b!722512) (not b!722519) (not b!722518) (not b!722516) (not b!722520) (not b!722510) (not start!64356) (not b!722511) (not b!722513))
(check-sat)

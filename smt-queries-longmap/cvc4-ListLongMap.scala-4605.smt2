; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64268 () Bool)

(assert start!64268)

(declare-fun b!721654 () Bool)

(declare-fun e!404644 () Bool)

(declare-fun e!404641 () Bool)

(assert (=> b!721654 (= e!404644 e!404641)))

(declare-fun res!483484 () Bool)

(assert (=> b!721654 (=> (not res!483484) (not e!404641))))

(declare-datatypes ((array!40849 0))(
  ( (array!40850 (arr!19547 (Array (_ BitVec 32) (_ BitVec 64))) (size!19968 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40849)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7147 0))(
  ( (MissingZero!7147 (index!30956 (_ BitVec 32))) (Found!7147 (index!30957 (_ BitVec 32))) (Intermediate!7147 (undefined!7959 Bool) (index!30958 (_ BitVec 32)) (x!61964 (_ BitVec 32))) (Undefined!7147) (MissingVacant!7147 (index!30959 (_ BitVec 32))) )
))
(declare-fun lt!320128 () SeekEntryResult!7147)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40849 (_ BitVec 32)) SeekEntryResult!7147)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!721654 (= res!483484 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19547 a!3186) j!159) mask!3328) (select (arr!19547 a!3186) j!159) a!3186 mask!3328) lt!320128))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!721654 (= lt!320128 (Intermediate!7147 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!483487 () Bool)

(declare-fun e!404640 () Bool)

(assert (=> start!64268 (=> (not res!483487) (not e!404640))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64268 (= res!483487 (validMask!0 mask!3328))))

(assert (=> start!64268 e!404640))

(assert (=> start!64268 true))

(declare-fun array_inv!15343 (array!40849) Bool)

(assert (=> start!64268 (array_inv!15343 a!3186)))

(declare-fun b!721655 () Bool)

(declare-fun res!483483 () Bool)

(assert (=> b!721655 (=> (not res!483483) (not e!404640))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!721655 (= res!483483 (validKeyInArray!0 k!2102))))

(declare-fun e!404645 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun b!721656 () Bool)

(assert (=> b!721656 (= e!404645 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19547 a!3186) j!159) a!3186 mask!3328) lt!320128))))

(declare-fun b!721657 () Bool)

(declare-fun res!483488 () Bool)

(assert (=> b!721657 (=> (not res!483488) (not e!404641))))

(assert (=> b!721657 (= res!483488 e!404645)))

(declare-fun c!79459 () Bool)

(assert (=> b!721657 (= c!79459 (bvsle x!1131 resIntermediateX!5))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun b!721658 () Bool)

(declare-fun e!404643 () Bool)

(assert (=> b!721658 (= e!404643 (not (validKeyInArray!0 (select (store (arr!19547 a!3186) i!1173 k!2102) j!159))))))

(declare-fun b!721659 () Bool)

(declare-fun res!483491 () Bool)

(assert (=> b!721659 (=> (not res!483491) (not e!404640))))

(assert (=> b!721659 (= res!483491 (and (= (size!19968 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19968 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19968 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!721660 () Bool)

(declare-fun res!483479 () Bool)

(assert (=> b!721660 (=> (not res!483479) (not e!404644))))

(declare-datatypes ((List!13549 0))(
  ( (Nil!13546) (Cons!13545 (h!14599 (_ BitVec 64)) (t!19864 List!13549)) )
))
(declare-fun arrayNoDuplicates!0 (array!40849 (_ BitVec 32) List!13549) Bool)

(assert (=> b!721660 (= res!483479 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13546))))

(declare-fun b!721661 () Bool)

(declare-fun res!483482 () Bool)

(assert (=> b!721661 (=> (not res!483482) (not e!404644))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40849 (_ BitVec 32)) Bool)

(assert (=> b!721661 (= res!483482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!721662 () Bool)

(declare-fun res!483480 () Bool)

(assert (=> b!721662 (=> (not res!483480) (not e!404640))))

(declare-fun arrayContainsKey!0 (array!40849 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!721662 (= res!483480 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!721663 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40849 (_ BitVec 32)) SeekEntryResult!7147)

(assert (=> b!721663 (= e!404645 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19547 a!3186) j!159) a!3186 mask!3328) (Found!7147 j!159)))))

(declare-fun b!721664 () Bool)

(declare-fun res!483481 () Bool)

(assert (=> b!721664 (=> (not res!483481) (not e!404641))))

(assert (=> b!721664 (= res!483481 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19547 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!721665 () Bool)

(declare-fun res!483486 () Bool)

(assert (=> b!721665 (=> (not res!483486) (not e!404644))))

(assert (=> b!721665 (= res!483486 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19968 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19968 a!3186))))))

(declare-fun b!721666 () Bool)

(assert (=> b!721666 (= e!404640 e!404644)))

(declare-fun res!483489 () Bool)

(assert (=> b!721666 (=> (not res!483489) (not e!404644))))

(declare-fun lt!320129 () SeekEntryResult!7147)

(assert (=> b!721666 (= res!483489 (or (= lt!320129 (MissingZero!7147 i!1173)) (= lt!320129 (MissingVacant!7147 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40849 (_ BitVec 32)) SeekEntryResult!7147)

(assert (=> b!721666 (= lt!320129 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!721667 () Bool)

(declare-fun res!483485 () Bool)

(assert (=> b!721667 (=> (not res!483485) (not e!404640))))

(assert (=> b!721667 (= res!483485 (validKeyInArray!0 (select (arr!19547 a!3186) j!159)))))

(declare-fun b!721668 () Bool)

(assert (=> b!721668 (= e!404641 e!404643)))

(declare-fun res!483490 () Bool)

(assert (=> b!721668 (=> (not res!483490) (not e!404643))))

(declare-fun lt!320127 () (_ BitVec 32))

(assert (=> b!721668 (= res!483490 (and (bvsge mask!3328 #b00000000000000000000000000000000) (bvsge lt!320127 #b00000000000000000000000000000000) (bvslt lt!320127 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(assert (=> b!721668 (= lt!320127 (toIndex!0 (select (store (arr!19547 a!3186) i!1173 k!2102) j!159) mask!3328))))

(assert (= (and start!64268 res!483487) b!721659))

(assert (= (and b!721659 res!483491) b!721667))

(assert (= (and b!721667 res!483485) b!721655))

(assert (= (and b!721655 res!483483) b!721662))

(assert (= (and b!721662 res!483480) b!721666))

(assert (= (and b!721666 res!483489) b!721661))

(assert (= (and b!721661 res!483482) b!721660))

(assert (= (and b!721660 res!483479) b!721665))

(assert (= (and b!721665 res!483486) b!721654))

(assert (= (and b!721654 res!483484) b!721664))

(assert (= (and b!721664 res!483481) b!721657))

(assert (= (and b!721657 c!79459) b!721656))

(assert (= (and b!721657 (not c!79459)) b!721663))

(assert (= (and b!721657 res!483488) b!721668))

(assert (= (and b!721668 res!483490) b!721658))

(declare-fun m!676405 () Bool)

(assert (=> b!721667 m!676405))

(assert (=> b!721667 m!676405))

(declare-fun m!676407 () Bool)

(assert (=> b!721667 m!676407))

(declare-fun m!676409 () Bool)

(assert (=> start!64268 m!676409))

(declare-fun m!676411 () Bool)

(assert (=> start!64268 m!676411))

(declare-fun m!676413 () Bool)

(assert (=> b!721668 m!676413))

(declare-fun m!676415 () Bool)

(assert (=> b!721668 m!676415))

(assert (=> b!721668 m!676415))

(declare-fun m!676417 () Bool)

(assert (=> b!721668 m!676417))

(declare-fun m!676419 () Bool)

(assert (=> b!721660 m!676419))

(declare-fun m!676421 () Bool)

(assert (=> b!721666 m!676421))

(declare-fun m!676423 () Bool)

(assert (=> b!721661 m!676423))

(assert (=> b!721654 m!676405))

(assert (=> b!721654 m!676405))

(declare-fun m!676425 () Bool)

(assert (=> b!721654 m!676425))

(assert (=> b!721654 m!676425))

(assert (=> b!721654 m!676405))

(declare-fun m!676427 () Bool)

(assert (=> b!721654 m!676427))

(declare-fun m!676429 () Bool)

(assert (=> b!721662 m!676429))

(declare-fun m!676431 () Bool)

(assert (=> b!721664 m!676431))

(assert (=> b!721658 m!676413))

(assert (=> b!721658 m!676415))

(assert (=> b!721658 m!676415))

(declare-fun m!676433 () Bool)

(assert (=> b!721658 m!676433))

(assert (=> b!721656 m!676405))

(assert (=> b!721656 m!676405))

(declare-fun m!676435 () Bool)

(assert (=> b!721656 m!676435))

(assert (=> b!721663 m!676405))

(assert (=> b!721663 m!676405))

(declare-fun m!676437 () Bool)

(assert (=> b!721663 m!676437))

(declare-fun m!676439 () Bool)

(assert (=> b!721655 m!676439))

(push 1)

(assert (not b!721656))

(assert (not b!721661))

(assert (not b!721655))

(assert (not b!721663))

(assert (not b!721662))

(assert (not b!721668))

(assert (not b!721667))

(assert (not b!721658))

(assert (not start!64268))

(assert (not b!721654))

(assert (not b!721666))


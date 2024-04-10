; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64324 () Bool)

(assert start!64324)

(declare-datatypes ((array!40905 0))(
  ( (array!40906 (arr!19575 (Array (_ BitVec 32) (_ BitVec 64))) (size!19996 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40905)

(declare-fun b!722813 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!405062 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7175 0))(
  ( (MissingZero!7175 (index!31068 (_ BitVec 32))) (Found!7175 (index!31069 (_ BitVec 32))) (Intermediate!7175 (undefined!7987 Bool) (index!31070 (_ BitVec 32)) (x!62072 (_ BitVec 32))) (Undefined!7175) (MissingVacant!7175 (index!31071 (_ BitVec 32))) )
))
(declare-fun lt!320441 () SeekEntryResult!7175)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40905 (_ BitVec 32)) SeekEntryResult!7175)

(assert (=> b!722813 (= e!405062 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19575 a!3186) j!159) a!3186 mask!3328) lt!320441))))

(declare-fun b!722814 () Bool)

(declare-fun res!484471 () Bool)

(declare-fun e!405061 () Bool)

(assert (=> b!722814 (=> (not res!484471) (not e!405061))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!722814 (= res!484471 (validKeyInArray!0 k!2102))))

(declare-fun b!722815 () Bool)

(declare-fun res!484470 () Bool)

(assert (=> b!722815 (=> (not res!484470) (not e!405061))))

(declare-fun arrayContainsKey!0 (array!40905 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!722815 (= res!484470 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!722816 () Bool)

(declare-fun res!484476 () Bool)

(assert (=> b!722816 (=> (not res!484476) (not e!405061))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!722816 (= res!484476 (and (= (size!19996 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19996 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19996 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!722817 () Bool)

(declare-fun res!484480 () Bool)

(declare-fun e!405063 () Bool)

(assert (=> b!722817 (=> (not res!484480) (not e!405063))))

(assert (=> b!722817 (= res!484480 e!405062)))

(declare-fun c!79543 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!722817 (= c!79543 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!484472 () Bool)

(assert (=> start!64324 (=> (not res!484472) (not e!405061))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64324 (= res!484472 (validMask!0 mask!3328))))

(assert (=> start!64324 e!405061))

(assert (=> start!64324 true))

(declare-fun array_inv!15371 (array!40905) Bool)

(assert (=> start!64324 (array_inv!15371 a!3186)))

(declare-fun b!722818 () Bool)

(assert (=> b!722818 (= e!405063 false)))

(declare-fun lt!320442 () (_ BitVec 64))

(declare-fun lt!320443 () SeekEntryResult!7175)

(declare-fun lt!320440 () array!40905)

(assert (=> b!722818 (= lt!320443 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320442 lt!320440 mask!3328))))

(declare-fun lt!320444 () SeekEntryResult!7175)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!722818 (= lt!320444 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320442 mask!3328) lt!320442 lt!320440 mask!3328))))

(assert (=> b!722818 (= lt!320442 (select (store (arr!19575 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!722818 (= lt!320440 (array!40906 (store (arr!19575 a!3186) i!1173 k!2102) (size!19996 a!3186)))))

(declare-fun b!722819 () Bool)

(declare-fun res!484479 () Bool)

(declare-fun e!405065 () Bool)

(assert (=> b!722819 (=> (not res!484479) (not e!405065))))

(declare-datatypes ((List!13577 0))(
  ( (Nil!13574) (Cons!13573 (h!14627 (_ BitVec 64)) (t!19892 List!13577)) )
))
(declare-fun arrayNoDuplicates!0 (array!40905 (_ BitVec 32) List!13577) Bool)

(assert (=> b!722819 (= res!484479 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13574))))

(declare-fun b!722820 () Bool)

(declare-fun res!484477 () Bool)

(assert (=> b!722820 (=> (not res!484477) (not e!405065))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!722820 (= res!484477 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19996 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19996 a!3186))))))

(declare-fun b!722821 () Bool)

(assert (=> b!722821 (= e!405065 e!405063)))

(declare-fun res!484473 () Bool)

(assert (=> b!722821 (=> (not res!484473) (not e!405063))))

(assert (=> b!722821 (= res!484473 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19575 a!3186) j!159) mask!3328) (select (arr!19575 a!3186) j!159) a!3186 mask!3328) lt!320441))))

(assert (=> b!722821 (= lt!320441 (Intermediate!7175 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!722822 () Bool)

(declare-fun res!484481 () Bool)

(assert (=> b!722822 (=> (not res!484481) (not e!405065))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40905 (_ BitVec 32)) Bool)

(assert (=> b!722822 (= res!484481 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!722823 () Bool)

(declare-fun res!484475 () Bool)

(assert (=> b!722823 (=> (not res!484475) (not e!405061))))

(assert (=> b!722823 (= res!484475 (validKeyInArray!0 (select (arr!19575 a!3186) j!159)))))

(declare-fun b!722824 () Bool)

(assert (=> b!722824 (= e!405061 e!405065)))

(declare-fun res!484478 () Bool)

(assert (=> b!722824 (=> (not res!484478) (not e!405065))))

(declare-fun lt!320439 () SeekEntryResult!7175)

(assert (=> b!722824 (= res!484478 (or (= lt!320439 (MissingZero!7175 i!1173)) (= lt!320439 (MissingVacant!7175 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40905 (_ BitVec 32)) SeekEntryResult!7175)

(assert (=> b!722824 (= lt!320439 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!722825 () Bool)

(declare-fun res!484474 () Bool)

(assert (=> b!722825 (=> (not res!484474) (not e!405063))))

(assert (=> b!722825 (= res!484474 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19575 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!722826 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40905 (_ BitVec 32)) SeekEntryResult!7175)

(assert (=> b!722826 (= e!405062 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19575 a!3186) j!159) a!3186 mask!3328) (Found!7175 j!159)))))

(assert (= (and start!64324 res!484472) b!722816))

(assert (= (and b!722816 res!484476) b!722823))

(assert (= (and b!722823 res!484475) b!722814))

(assert (= (and b!722814 res!484471) b!722815))

(assert (= (and b!722815 res!484470) b!722824))

(assert (= (and b!722824 res!484478) b!722822))

(assert (= (and b!722822 res!484481) b!722819))

(assert (= (and b!722819 res!484479) b!722820))

(assert (= (and b!722820 res!484477) b!722821))

(assert (= (and b!722821 res!484473) b!722825))

(assert (= (and b!722825 res!484474) b!722817))

(assert (= (and b!722817 c!79543) b!722813))

(assert (= (and b!722817 (not c!79543)) b!722826))

(assert (= (and b!722817 res!484480) b!722818))

(declare-fun m!677305 () Bool)

(assert (=> b!722826 m!677305))

(assert (=> b!722826 m!677305))

(declare-fun m!677307 () Bool)

(assert (=> b!722826 m!677307))

(assert (=> b!722821 m!677305))

(assert (=> b!722821 m!677305))

(declare-fun m!677309 () Bool)

(assert (=> b!722821 m!677309))

(assert (=> b!722821 m!677309))

(assert (=> b!722821 m!677305))

(declare-fun m!677311 () Bool)

(assert (=> b!722821 m!677311))

(declare-fun m!677313 () Bool)

(assert (=> b!722819 m!677313))

(declare-fun m!677315 () Bool)

(assert (=> b!722818 m!677315))

(declare-fun m!677317 () Bool)

(assert (=> b!722818 m!677317))

(declare-fun m!677319 () Bool)

(assert (=> b!722818 m!677319))

(assert (=> b!722818 m!677315))

(declare-fun m!677321 () Bool)

(assert (=> b!722818 m!677321))

(declare-fun m!677323 () Bool)

(assert (=> b!722818 m!677323))

(declare-fun m!677325 () Bool)

(assert (=> b!722814 m!677325))

(declare-fun m!677327 () Bool)

(assert (=> b!722815 m!677327))

(declare-fun m!677329 () Bool)

(assert (=> start!64324 m!677329))

(declare-fun m!677331 () Bool)

(assert (=> start!64324 m!677331))

(declare-fun m!677333 () Bool)

(assert (=> b!722825 m!677333))

(assert (=> b!722813 m!677305))

(assert (=> b!722813 m!677305))

(declare-fun m!677335 () Bool)

(assert (=> b!722813 m!677335))

(declare-fun m!677337 () Bool)

(assert (=> b!722822 m!677337))

(declare-fun m!677339 () Bool)

(assert (=> b!722824 m!677339))

(assert (=> b!722823 m!677305))

(assert (=> b!722823 m!677305))

(declare-fun m!677341 () Bool)

(assert (=> b!722823 m!677341))

(push 1)


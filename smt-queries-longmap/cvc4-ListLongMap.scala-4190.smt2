; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57120 () Bool)

(assert start!57120)

(declare-fun b!632532 () Bool)

(declare-fun res!409120 () Bool)

(declare-fun e!361623 () Bool)

(assert (=> b!632532 (=> (not res!409120) (not e!361623))))

(declare-datatypes ((array!38139 0))(
  ( (array!38140 (arr!18302 (Array (_ BitVec 32) (_ BitVec 64))) (size!18666 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38139)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38139 (_ BitVec 32)) Bool)

(assert (=> b!632532 (= res!409120 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!632533 () Bool)

(declare-fun e!361619 () Bool)

(declare-fun e!361626 () Bool)

(assert (=> b!632533 (= e!361619 (not e!361626))))

(declare-fun res!409122 () Bool)

(assert (=> b!632533 (=> res!409122 e!361626)))

(declare-datatypes ((SeekEntryResult!6742 0))(
  ( (MissingZero!6742 (index!29261 (_ BitVec 32))) (Found!6742 (index!29262 (_ BitVec 32))) (Intermediate!6742 (undefined!7554 Bool) (index!29263 (_ BitVec 32)) (x!57993 (_ BitVec 32))) (Undefined!6742) (MissingVacant!6742 (index!29264 (_ BitVec 32))) )
))
(declare-fun lt!292346 () SeekEntryResult!6742)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!632533 (= res!409122 (not (= lt!292346 (Found!6742 index!984))))))

(declare-datatypes ((Unit!21302 0))(
  ( (Unit!21303) )
))
(declare-fun lt!292352 () Unit!21302)

(declare-fun e!361622 () Unit!21302)

(assert (=> b!632533 (= lt!292352 e!361622)))

(declare-fun c!72074 () Bool)

(assert (=> b!632533 (= c!72074 (= lt!292346 Undefined!6742))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!292348 () array!38139)

(declare-fun lt!292349 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38139 (_ BitVec 32)) SeekEntryResult!6742)

(assert (=> b!632533 (= lt!292346 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292349 lt!292348 mask!3053))))

(declare-fun e!361620 () Bool)

(assert (=> b!632533 e!361620))

(declare-fun res!409118 () Bool)

(assert (=> b!632533 (=> (not res!409118) (not e!361620))))

(declare-fun lt!292353 () (_ BitVec 32))

(declare-fun lt!292354 () SeekEntryResult!6742)

(assert (=> b!632533 (= res!409118 (= lt!292354 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292353 vacantSpotIndex!68 lt!292349 lt!292348 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!632533 (= lt!292354 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292353 vacantSpotIndex!68 (select (arr!18302 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!632533 (= lt!292349 (select (store (arr!18302 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!292351 () Unit!21302)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38139 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21302)

(assert (=> b!632533 (= lt!292351 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292353 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!632533 (= lt!292353 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!632534 () Bool)

(assert (=> b!632534 (= e!361626 (or (not (= (select (arr!18302 a!2986) j!136) lt!292349)) (bvslt index!984 (size!18666 a!2986))))))

(assert (=> b!632534 (= (select (store (arr!18302 a!2986) i!1108 k!1786) index!984) (select (arr!18302 a!2986) j!136))))

(declare-fun b!632535 () Bool)

(declare-fun res!409124 () Bool)

(declare-fun e!361621 () Bool)

(assert (=> b!632535 (=> (not res!409124) (not e!361621))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!632535 (= res!409124 (validKeyInArray!0 k!1786))))

(declare-fun b!632536 () Bool)

(declare-fun lt!292347 () SeekEntryResult!6742)

(assert (=> b!632536 (= e!361620 (= lt!292347 lt!292354))))

(declare-fun b!632537 () Bool)

(declare-fun res!409128 () Bool)

(assert (=> b!632537 (=> (not res!409128) (not e!361621))))

(assert (=> b!632537 (= res!409128 (and (= (size!18666 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18666 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18666 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!632538 () Bool)

(declare-fun e!361625 () Bool)

(assert (=> b!632538 (= e!361623 e!361625)))

(declare-fun res!409130 () Bool)

(assert (=> b!632538 (=> (not res!409130) (not e!361625))))

(assert (=> b!632538 (= res!409130 (= (select (store (arr!18302 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!632538 (= lt!292348 (array!38140 (store (arr!18302 a!2986) i!1108 k!1786) (size!18666 a!2986)))))

(declare-fun b!632539 () Bool)

(assert (=> b!632539 (= e!361621 e!361623)))

(declare-fun res!409129 () Bool)

(assert (=> b!632539 (=> (not res!409129) (not e!361623))))

(declare-fun lt!292350 () SeekEntryResult!6742)

(assert (=> b!632539 (= res!409129 (or (= lt!292350 (MissingZero!6742 i!1108)) (= lt!292350 (MissingVacant!6742 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38139 (_ BitVec 32)) SeekEntryResult!6742)

(assert (=> b!632539 (= lt!292350 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!632540 () Bool)

(assert (=> b!632540 (= e!361625 e!361619)))

(declare-fun res!409121 () Bool)

(assert (=> b!632540 (=> (not res!409121) (not e!361619))))

(assert (=> b!632540 (= res!409121 (and (= lt!292347 (Found!6742 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18302 a!2986) index!984) (select (arr!18302 a!2986) j!136))) (not (= (select (arr!18302 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!632540 (= lt!292347 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18302 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!632541 () Bool)

(declare-fun res!409126 () Bool)

(assert (=> b!632541 (=> (not res!409126) (not e!361621))))

(assert (=> b!632541 (= res!409126 (validKeyInArray!0 (select (arr!18302 a!2986) j!136)))))

(declare-fun b!632542 () Bool)

(declare-fun res!409123 () Bool)

(assert (=> b!632542 (=> (not res!409123) (not e!361621))))

(declare-fun arrayContainsKey!0 (array!38139 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!632542 (= res!409123 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!632543 () Bool)

(declare-fun res!409119 () Bool)

(assert (=> b!632543 (=> (not res!409119) (not e!361623))))

(declare-datatypes ((List!12343 0))(
  ( (Nil!12340) (Cons!12339 (h!13384 (_ BitVec 64)) (t!18571 List!12343)) )
))
(declare-fun arrayNoDuplicates!0 (array!38139 (_ BitVec 32) List!12343) Bool)

(assert (=> b!632543 (= res!409119 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12340))))

(declare-fun b!632544 () Bool)

(declare-fun Unit!21304 () Unit!21302)

(assert (=> b!632544 (= e!361622 Unit!21304)))

(assert (=> b!632544 false))

(declare-fun b!632545 () Bool)

(declare-fun res!409125 () Bool)

(assert (=> b!632545 (=> (not res!409125) (not e!361623))))

(assert (=> b!632545 (= res!409125 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18302 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!409127 () Bool)

(assert (=> start!57120 (=> (not res!409127) (not e!361621))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57120 (= res!409127 (validMask!0 mask!3053))))

(assert (=> start!57120 e!361621))

(assert (=> start!57120 true))

(declare-fun array_inv!14098 (array!38139) Bool)

(assert (=> start!57120 (array_inv!14098 a!2986)))

(declare-fun b!632546 () Bool)

(declare-fun Unit!21305 () Unit!21302)

(assert (=> b!632546 (= e!361622 Unit!21305)))

(assert (= (and start!57120 res!409127) b!632537))

(assert (= (and b!632537 res!409128) b!632541))

(assert (= (and b!632541 res!409126) b!632535))

(assert (= (and b!632535 res!409124) b!632542))

(assert (= (and b!632542 res!409123) b!632539))

(assert (= (and b!632539 res!409129) b!632532))

(assert (= (and b!632532 res!409120) b!632543))

(assert (= (and b!632543 res!409119) b!632545))

(assert (= (and b!632545 res!409125) b!632538))

(assert (= (and b!632538 res!409130) b!632540))

(assert (= (and b!632540 res!409121) b!632533))

(assert (= (and b!632533 res!409118) b!632536))

(assert (= (and b!632533 c!72074) b!632544))

(assert (= (and b!632533 (not c!72074)) b!632546))

(assert (= (and b!632533 (not res!409122)) b!632534))

(declare-fun m!607353 () Bool)

(assert (=> start!57120 m!607353))

(declare-fun m!607355 () Bool)

(assert (=> start!57120 m!607355))

(declare-fun m!607357 () Bool)

(assert (=> b!632542 m!607357))

(declare-fun m!607359 () Bool)

(assert (=> b!632533 m!607359))

(declare-fun m!607361 () Bool)

(assert (=> b!632533 m!607361))

(declare-fun m!607363 () Bool)

(assert (=> b!632533 m!607363))

(declare-fun m!607365 () Bool)

(assert (=> b!632533 m!607365))

(declare-fun m!607367 () Bool)

(assert (=> b!632533 m!607367))

(declare-fun m!607369 () Bool)

(assert (=> b!632533 m!607369))

(declare-fun m!607371 () Bool)

(assert (=> b!632533 m!607371))

(assert (=> b!632533 m!607367))

(declare-fun m!607373 () Bool)

(assert (=> b!632533 m!607373))

(declare-fun m!607375 () Bool)

(assert (=> b!632543 m!607375))

(declare-fun m!607377 () Bool)

(assert (=> b!632535 m!607377))

(assert (=> b!632538 m!607363))

(declare-fun m!607379 () Bool)

(assert (=> b!632538 m!607379))

(declare-fun m!607381 () Bool)

(assert (=> b!632540 m!607381))

(assert (=> b!632540 m!607367))

(assert (=> b!632540 m!607367))

(declare-fun m!607383 () Bool)

(assert (=> b!632540 m!607383))

(declare-fun m!607385 () Bool)

(assert (=> b!632545 m!607385))

(assert (=> b!632534 m!607367))

(assert (=> b!632534 m!607363))

(declare-fun m!607387 () Bool)

(assert (=> b!632534 m!607387))

(declare-fun m!607389 () Bool)

(assert (=> b!632532 m!607389))

(assert (=> b!632541 m!607367))

(assert (=> b!632541 m!607367))

(declare-fun m!607391 () Bool)

(assert (=> b!632541 m!607391))

(declare-fun m!607393 () Bool)

(assert (=> b!632539 m!607393))

(push 1)

(assert (not b!632540))

(assert (not b!632535))

(assert (not b!632543))

(assert (not b!632533))

(assert (not b!632539))

(assert (not b!632542))

(assert (not b!632541))

(assert (not b!632532))

(assert (not start!57120))

(check-sat)

(pop 1)

(push 1)

(check-sat)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56820 () Bool)

(assert start!56820)

(declare-fun b!629357 () Bool)

(declare-fun res!406752 () Bool)

(declare-fun e!359966 () Bool)

(assert (=> b!629357 (=> (not res!406752) (not e!359966))))

(declare-datatypes ((array!38010 0))(
  ( (array!38011 (arr!18242 (Array (_ BitVec 32) (_ BitVec 64))) (size!18606 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38010)

(declare-datatypes ((List!12283 0))(
  ( (Nil!12280) (Cons!12279 (h!13324 (_ BitVec 64)) (t!18511 List!12283)) )
))
(declare-fun arrayNoDuplicates!0 (array!38010 (_ BitVec 32) List!12283) Bool)

(assert (=> b!629357 (= res!406752 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12280))))

(declare-fun b!629358 () Bool)

(declare-fun e!359968 () Bool)

(assert (=> b!629358 (= e!359966 e!359968)))

(declare-fun res!406753 () Bool)

(assert (=> b!629358 (=> (not res!406753) (not e!359968))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6682 0))(
  ( (MissingZero!6682 (index!29012 (_ BitVec 32))) (Found!6682 (index!29013 (_ BitVec 32))) (Intermediate!6682 (undefined!7494 Bool) (index!29014 (_ BitVec 32)) (x!57746 (_ BitVec 32))) (Undefined!6682) (MissingVacant!6682 (index!29015 (_ BitVec 32))) )
))
(declare-fun lt!290731 () SeekEntryResult!6682)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38010 (_ BitVec 32)) SeekEntryResult!6682)

(assert (=> b!629358 (= res!406753 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18242 a!2986) j!136) a!2986 mask!3053) lt!290731))))

(assert (=> b!629358 (= lt!290731 (Found!6682 j!136))))

(declare-fun b!629360 () Bool)

(declare-fun e!359969 () Bool)

(assert (=> b!629360 (= e!359968 e!359969)))

(declare-fun res!406761 () Bool)

(assert (=> b!629360 (=> (not res!406761) (not e!359969))))

(declare-fun lt!290729 () (_ BitVec 32))

(assert (=> b!629360 (= res!406761 (and (bvsge lt!290729 #b00000000000000000000000000000000) (bvslt lt!290729 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!629360 (= lt!290729 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!629361 () Bool)

(declare-fun res!406759 () Bool)

(assert (=> b!629361 (=> (not res!406759) (not e!359968))))

(assert (=> b!629361 (= res!406759 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18242 a!2986) index!984) (select (arr!18242 a!2986) j!136))) (not (= (select (arr!18242 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!629362 () Bool)

(declare-fun res!406763 () Bool)

(declare-fun e!359967 () Bool)

(assert (=> b!629362 (=> (not res!406763) (not e!359967))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!629362 (= res!406763 (validKeyInArray!0 k!1786))))

(declare-fun b!629363 () Bool)

(declare-fun res!406755 () Bool)

(assert (=> b!629363 (=> (not res!406755) (not e!359966))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38010 (_ BitVec 32)) Bool)

(assert (=> b!629363 (= res!406755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!629364 () Bool)

(assert (=> b!629364 (= e!359969 (bvsge (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!910)) (bvsub #b01111111111111111111111111111110 x!910)))))

(declare-fun b!629365 () Bool)

(declare-fun res!406751 () Bool)

(assert (=> b!629365 (=> (not res!406751) (not e!359966))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!629365 (= res!406751 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18242 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18242 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!629366 () Bool)

(assert (=> b!629366 (= e!359967 e!359966)))

(declare-fun res!406756 () Bool)

(assert (=> b!629366 (=> (not res!406756) (not e!359966))))

(declare-fun lt!290730 () SeekEntryResult!6682)

(assert (=> b!629366 (= res!406756 (or (= lt!290730 (MissingZero!6682 i!1108)) (= lt!290730 (MissingVacant!6682 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38010 (_ BitVec 32)) SeekEntryResult!6682)

(assert (=> b!629366 (= lt!290730 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!629367 () Bool)

(declare-fun res!406757 () Bool)

(assert (=> b!629367 (=> (not res!406757) (not e!359969))))

(assert (=> b!629367 (= res!406757 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290729 vacantSpotIndex!68 (select (arr!18242 a!2986) j!136) a!2986 mask!3053) lt!290731))))

(declare-fun b!629359 () Bool)

(declare-fun res!406754 () Bool)

(assert (=> b!629359 (=> (not res!406754) (not e!359967))))

(assert (=> b!629359 (= res!406754 (validKeyInArray!0 (select (arr!18242 a!2986) j!136)))))

(declare-fun res!406760 () Bool)

(assert (=> start!56820 (=> (not res!406760) (not e!359967))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56820 (= res!406760 (validMask!0 mask!3053))))

(assert (=> start!56820 e!359967))

(assert (=> start!56820 true))

(declare-fun array_inv!14038 (array!38010) Bool)

(assert (=> start!56820 (array_inv!14038 a!2986)))

(declare-fun b!629368 () Bool)

(declare-fun res!406762 () Bool)

(assert (=> b!629368 (=> (not res!406762) (not e!359967))))

(declare-fun arrayContainsKey!0 (array!38010 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!629368 (= res!406762 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!629369 () Bool)

(declare-fun res!406758 () Bool)

(assert (=> b!629369 (=> (not res!406758) (not e!359967))))

(assert (=> b!629369 (= res!406758 (and (= (size!18606 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18606 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18606 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!56820 res!406760) b!629369))

(assert (= (and b!629369 res!406758) b!629359))

(assert (= (and b!629359 res!406754) b!629362))

(assert (= (and b!629362 res!406763) b!629368))

(assert (= (and b!629368 res!406762) b!629366))

(assert (= (and b!629366 res!406756) b!629363))

(assert (= (and b!629363 res!406755) b!629357))

(assert (= (and b!629357 res!406752) b!629365))

(assert (= (and b!629365 res!406751) b!629358))

(assert (= (and b!629358 res!406753) b!629361))

(assert (= (and b!629361 res!406759) b!629360))

(assert (= (and b!629360 res!406761) b!629367))

(assert (= (and b!629367 res!406757) b!629364))

(declare-fun m!604357 () Bool)

(assert (=> b!629358 m!604357))

(assert (=> b!629358 m!604357))

(declare-fun m!604359 () Bool)

(assert (=> b!629358 m!604359))

(declare-fun m!604361 () Bool)

(assert (=> b!629365 m!604361))

(declare-fun m!604363 () Bool)

(assert (=> b!629365 m!604363))

(declare-fun m!604365 () Bool)

(assert (=> b!629365 m!604365))

(declare-fun m!604367 () Bool)

(assert (=> b!629362 m!604367))

(declare-fun m!604369 () Bool)

(assert (=> b!629368 m!604369))

(declare-fun m!604371 () Bool)

(assert (=> b!629363 m!604371))

(declare-fun m!604373 () Bool)

(assert (=> b!629360 m!604373))

(assert (=> b!629359 m!604357))

(assert (=> b!629359 m!604357))

(declare-fun m!604375 () Bool)

(assert (=> b!629359 m!604375))

(assert (=> b!629367 m!604357))

(assert (=> b!629367 m!604357))

(declare-fun m!604377 () Bool)

(assert (=> b!629367 m!604377))

(declare-fun m!604379 () Bool)

(assert (=> b!629366 m!604379))

(declare-fun m!604381 () Bool)

(assert (=> b!629361 m!604381))

(assert (=> b!629361 m!604357))

(declare-fun m!604383 () Bool)

(assert (=> start!56820 m!604383))

(declare-fun m!604385 () Bool)

(assert (=> start!56820 m!604385))

(declare-fun m!604387 () Bool)

(assert (=> b!629357 m!604387))

(push 1)

(assert (not b!629366))

(assert (not b!629357))

(assert (not b!629358))

(assert (not b!629362))

(assert (not b!629367))

(assert (not b!629368))

(assert (not b!629359))

(assert (not start!56820))

(assert (not b!629360))

(assert (not b!629363))

(check-sat)

(pop 1)

(push 1)

(check-sat)


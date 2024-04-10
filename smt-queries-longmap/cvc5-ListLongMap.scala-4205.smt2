; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57518 () Bool)

(assert start!57518)

(declare-fun b!636323 () Bool)

(declare-fun e!364015 () Bool)

(declare-fun e!364020 () Bool)

(assert (=> b!636323 (= e!364015 e!364020)))

(declare-fun res!411680 () Bool)

(assert (=> b!636323 (=> (not res!411680) (not e!364020))))

(declare-datatypes ((List!12386 0))(
  ( (Nil!12383) (Cons!12382 (h!13427 (_ BitVec 64)) (t!18614 List!12386)) )
))
(declare-fun contains!3100 (List!12386 (_ BitVec 64)) Bool)

(assert (=> b!636323 (= res!411680 (not (contains!3100 Nil!12383 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!636324 () Bool)

(assert (=> b!636324 (= e!364020 (not (contains!3100 Nil!12383 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!636325 () Bool)

(declare-fun e!364026 () Bool)

(declare-fun e!364025 () Bool)

(assert (=> b!636325 (= e!364026 e!364025)))

(declare-fun res!411685 () Bool)

(assert (=> b!636325 (=> (not res!411685) (not e!364025))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38239 0))(
  ( (array!38240 (arr!18345 (Array (_ BitVec 32) (_ BitVec 64))) (size!18709 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38239)

(assert (=> b!636325 (= res!411685 (= (select (store (arr!18345 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!294245 () array!38239)

(assert (=> b!636325 (= lt!294245 (array!38240 (store (arr!18345 a!2986) i!1108 k!1786) (size!18709 a!2986)))))

(declare-fun b!636326 () Bool)

(declare-datatypes ((Unit!21474 0))(
  ( (Unit!21475) )
))
(declare-fun e!364018 () Unit!21474)

(declare-fun Unit!21476 () Unit!21474)

(assert (=> b!636326 (= e!364018 Unit!21476)))

(declare-fun b!636327 () Bool)

(declare-fun res!411671 () Bool)

(declare-fun e!364021 () Bool)

(assert (=> b!636327 (=> (not res!411671) (not e!364021))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!636327 (= res!411671 (validKeyInArray!0 (select (arr!18345 a!2986) j!136)))))

(declare-fun b!636328 () Bool)

(declare-fun res!411679 () Bool)

(assert (=> b!636328 (=> (not res!411679) (not e!364026))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!636328 (= res!411679 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18345 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!636329 () Bool)

(declare-fun e!364023 () Bool)

(declare-fun e!364014 () Bool)

(assert (=> b!636329 (= e!364023 (not e!364014))))

(declare-fun res!411674 () Bool)

(assert (=> b!636329 (=> res!411674 e!364014)))

(declare-datatypes ((SeekEntryResult!6785 0))(
  ( (MissingZero!6785 (index!29448 (_ BitVec 32))) (Found!6785 (index!29449 (_ BitVec 32))) (Intermediate!6785 (undefined!7597 Bool) (index!29450 (_ BitVec 32)) (x!58201 (_ BitVec 32))) (Undefined!6785) (MissingVacant!6785 (index!29451 (_ BitVec 32))) )
))
(declare-fun lt!294240 () SeekEntryResult!6785)

(assert (=> b!636329 (= res!411674 (not (= lt!294240 (Found!6785 index!984))))))

(declare-fun lt!294244 () Unit!21474)

(assert (=> b!636329 (= lt!294244 e!364018)))

(declare-fun c!72695 () Bool)

(assert (=> b!636329 (= c!72695 (= lt!294240 Undefined!6785))))

(declare-fun lt!294243 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38239 (_ BitVec 32)) SeekEntryResult!6785)

(assert (=> b!636329 (= lt!294240 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!294243 lt!294245 mask!3053))))

(declare-fun e!364022 () Bool)

(assert (=> b!636329 e!364022))

(declare-fun res!411669 () Bool)

(assert (=> b!636329 (=> (not res!411669) (not e!364022))))

(declare-fun lt!294241 () (_ BitVec 32))

(declare-fun lt!294249 () SeekEntryResult!6785)

(assert (=> b!636329 (= res!411669 (= lt!294249 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294241 vacantSpotIndex!68 lt!294243 lt!294245 mask!3053)))))

(assert (=> b!636329 (= lt!294249 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294241 vacantSpotIndex!68 (select (arr!18345 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!636329 (= lt!294243 (select (store (arr!18345 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!294248 () Unit!21474)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38239 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21474)

(assert (=> b!636329 (= lt!294248 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294241 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!636329 (= lt!294241 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!636330 () Bool)

(declare-fun e!364017 () Bool)

(assert (=> b!636330 (= e!364014 e!364017)))

(declare-fun res!411668 () Bool)

(assert (=> b!636330 (=> res!411668 e!364017)))

(declare-fun lt!294250 () (_ BitVec 64))

(assert (=> b!636330 (= res!411668 (or (not (= (select (arr!18345 a!2986) j!136) lt!294243)) (not (= (select (arr!18345 a!2986) j!136) lt!294250)) (bvsge j!136 index!984)))))

(declare-fun e!364024 () Bool)

(assert (=> b!636330 e!364024))

(declare-fun res!411678 () Bool)

(assert (=> b!636330 (=> (not res!411678) (not e!364024))))

(assert (=> b!636330 (= res!411678 (= lt!294250 (select (arr!18345 a!2986) j!136)))))

(assert (=> b!636330 (= lt!294250 (select (store (arr!18345 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!636331 () Bool)

(declare-fun e!364013 () Bool)

(declare-fun arrayContainsKey!0 (array!38239 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!636331 (= e!364013 (arrayContainsKey!0 lt!294245 (select (arr!18345 a!2986) j!136) index!984))))

(declare-fun b!636332 () Bool)

(declare-fun lt!294247 () SeekEntryResult!6785)

(assert (=> b!636332 (= e!364022 (= lt!294247 lt!294249))))

(declare-fun b!636333 () Bool)

(declare-fun Unit!21477 () Unit!21474)

(assert (=> b!636333 (= e!364018 Unit!21477)))

(assert (=> b!636333 false))

(declare-fun b!636334 () Bool)

(declare-fun e!364016 () Bool)

(assert (=> b!636334 (= e!364016 e!364013)))

(declare-fun res!411677 () Bool)

(assert (=> b!636334 (=> (not res!411677) (not e!364013))))

(assert (=> b!636334 (= res!411677 (arrayContainsKey!0 lt!294245 (select (arr!18345 a!2986) j!136) j!136))))

(declare-fun b!636335 () Bool)

(declare-fun res!411681 () Bool)

(assert (=> b!636335 (=> (not res!411681) (not e!364021))))

(assert (=> b!636335 (= res!411681 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!636336 () Bool)

(declare-fun res!411676 () Bool)

(assert (=> b!636336 (=> res!411676 e!364015)))

(declare-fun noDuplicate!378 (List!12386) Bool)

(assert (=> b!636336 (= res!411676 (not (noDuplicate!378 Nil!12383)))))

(declare-fun b!636337 () Bool)

(assert (=> b!636337 (= e!364024 e!364016)))

(declare-fun res!411670 () Bool)

(assert (=> b!636337 (=> res!411670 e!364016)))

(assert (=> b!636337 (= res!411670 (or (not (= (select (arr!18345 a!2986) j!136) lt!294243)) (not (= (select (arr!18345 a!2986) j!136) lt!294250)) (bvsge j!136 index!984)))))

(declare-fun b!636338 () Bool)

(declare-fun res!411672 () Bool)

(assert (=> b!636338 (=> (not res!411672) (not e!364026))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38239 (_ BitVec 32)) Bool)

(assert (=> b!636338 (= res!411672 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!636339 () Bool)

(declare-fun res!411675 () Bool)

(assert (=> b!636339 (=> (not res!411675) (not e!364026))))

(declare-fun arrayNoDuplicates!0 (array!38239 (_ BitVec 32) List!12386) Bool)

(assert (=> b!636339 (= res!411675 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12383))))

(declare-fun b!636340 () Bool)

(assert (=> b!636340 (= e!364021 e!364026)))

(declare-fun res!411673 () Bool)

(assert (=> b!636340 (=> (not res!411673) (not e!364026))))

(declare-fun lt!294242 () SeekEntryResult!6785)

(assert (=> b!636340 (= res!411673 (or (= lt!294242 (MissingZero!6785 i!1108)) (= lt!294242 (MissingVacant!6785 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38239 (_ BitVec 32)) SeekEntryResult!6785)

(assert (=> b!636340 (= lt!294242 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!636341 () Bool)

(assert (=> b!636341 (= e!364025 e!364023)))

(declare-fun res!411686 () Bool)

(assert (=> b!636341 (=> (not res!411686) (not e!364023))))

(assert (=> b!636341 (= res!411686 (and (= lt!294247 (Found!6785 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18345 a!2986) index!984) (select (arr!18345 a!2986) j!136))) (not (= (select (arr!18345 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!636341 (= lt!294247 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18345 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!636342 () Bool)

(declare-fun res!411684 () Bool)

(assert (=> b!636342 (=> (not res!411684) (not e!364021))))

(assert (=> b!636342 (= res!411684 (validKeyInArray!0 k!1786))))

(declare-fun b!636343 () Bool)

(declare-fun res!411683 () Bool)

(assert (=> b!636343 (=> (not res!411683) (not e!364021))))

(assert (=> b!636343 (= res!411683 (and (= (size!18709 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18709 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18709 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!636344 () Bool)

(assert (=> b!636344 (= e!364017 e!364015)))

(declare-fun res!411682 () Bool)

(assert (=> b!636344 (=> res!411682 e!364015)))

(assert (=> b!636344 (= res!411682 (or (bvsge (size!18709 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18709 a!2986))))))

(assert (=> b!636344 (arrayContainsKey!0 lt!294245 (select (arr!18345 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!294246 () Unit!21474)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38239 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21474)

(assert (=> b!636344 (= lt!294246 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!294245 (select (arr!18345 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun res!411667 () Bool)

(assert (=> start!57518 (=> (not res!411667) (not e!364021))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57518 (= res!411667 (validMask!0 mask!3053))))

(assert (=> start!57518 e!364021))

(assert (=> start!57518 true))

(declare-fun array_inv!14141 (array!38239) Bool)

(assert (=> start!57518 (array_inv!14141 a!2986)))

(assert (= (and start!57518 res!411667) b!636343))

(assert (= (and b!636343 res!411683) b!636327))

(assert (= (and b!636327 res!411671) b!636342))

(assert (= (and b!636342 res!411684) b!636335))

(assert (= (and b!636335 res!411681) b!636340))

(assert (= (and b!636340 res!411673) b!636338))

(assert (= (and b!636338 res!411672) b!636339))

(assert (= (and b!636339 res!411675) b!636328))

(assert (= (and b!636328 res!411679) b!636325))

(assert (= (and b!636325 res!411685) b!636341))

(assert (= (and b!636341 res!411686) b!636329))

(assert (= (and b!636329 res!411669) b!636332))

(assert (= (and b!636329 c!72695) b!636333))

(assert (= (and b!636329 (not c!72695)) b!636326))

(assert (= (and b!636329 (not res!411674)) b!636330))

(assert (= (and b!636330 res!411678) b!636337))

(assert (= (and b!636337 (not res!411670)) b!636334))

(assert (= (and b!636334 res!411677) b!636331))

(assert (= (and b!636330 (not res!411668)) b!636344))

(assert (= (and b!636344 (not res!411682)) b!636336))

(assert (= (and b!636336 (not res!411676)) b!636323))

(assert (= (and b!636323 res!411680) b!636324))

(declare-fun m!610553 () Bool)

(assert (=> b!636330 m!610553))

(declare-fun m!610555 () Bool)

(assert (=> b!636330 m!610555))

(declare-fun m!610557 () Bool)

(assert (=> b!636330 m!610557))

(declare-fun m!610559 () Bool)

(assert (=> b!636329 m!610559))

(assert (=> b!636329 m!610553))

(declare-fun m!610561 () Bool)

(assert (=> b!636329 m!610561))

(assert (=> b!636329 m!610553))

(declare-fun m!610563 () Bool)

(assert (=> b!636329 m!610563))

(declare-fun m!610565 () Bool)

(assert (=> b!636329 m!610565))

(declare-fun m!610567 () Bool)

(assert (=> b!636329 m!610567))

(declare-fun m!610569 () Bool)

(assert (=> b!636329 m!610569))

(assert (=> b!636329 m!610555))

(assert (=> b!636344 m!610553))

(assert (=> b!636344 m!610553))

(declare-fun m!610571 () Bool)

(assert (=> b!636344 m!610571))

(assert (=> b!636344 m!610553))

(declare-fun m!610573 () Bool)

(assert (=> b!636344 m!610573))

(declare-fun m!610575 () Bool)

(assert (=> b!636338 m!610575))

(declare-fun m!610577 () Bool)

(assert (=> start!57518 m!610577))

(declare-fun m!610579 () Bool)

(assert (=> start!57518 m!610579))

(assert (=> b!636334 m!610553))

(assert (=> b!636334 m!610553))

(declare-fun m!610581 () Bool)

(assert (=> b!636334 m!610581))

(declare-fun m!610583 () Bool)

(assert (=> b!636341 m!610583))

(assert (=> b!636341 m!610553))

(assert (=> b!636341 m!610553))

(declare-fun m!610585 () Bool)

(assert (=> b!636341 m!610585))

(assert (=> b!636337 m!610553))

(declare-fun m!610587 () Bool)

(assert (=> b!636342 m!610587))

(assert (=> b!636327 m!610553))

(assert (=> b!636327 m!610553))

(declare-fun m!610589 () Bool)

(assert (=> b!636327 m!610589))

(declare-fun m!610591 () Bool)

(assert (=> b!636340 m!610591))

(declare-fun m!610593 () Bool)

(assert (=> b!636339 m!610593))

(declare-fun m!610595 () Bool)

(assert (=> b!636323 m!610595))

(declare-fun m!610597 () Bool)

(assert (=> b!636335 m!610597))

(declare-fun m!610599 () Bool)

(assert (=> b!636324 m!610599))

(declare-fun m!610601 () Bool)

(assert (=> b!636336 m!610601))

(assert (=> b!636331 m!610553))

(assert (=> b!636331 m!610553))

(declare-fun m!610603 () Bool)

(assert (=> b!636331 m!610603))

(declare-fun m!610605 () Bool)

(assert (=> b!636328 m!610605))

(assert (=> b!636325 m!610555))

(declare-fun m!610607 () Bool)

(assert (=> b!636325 m!610607))

(push 1)

(assert (not b!636344))

(assert (not b!636342))

(assert (not b!636338))

(assert (not b!636331))

(assert (not b!636341))

(assert (not b!636340))

(assert (not b!636329))

(assert (not start!57518))

(assert (not b!636334))

(assert (not b!636339))

(assert (not b!636327))

(assert (not b!636323))

(assert (not b!636324))

(assert (not b!636335))

(assert (not b!636336))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!89963 () Bool)

(declare-fun res!411844 () Bool)

(declare-fun e!364169 () Bool)

(assert (=> d!89963 (=> res!411844 e!364169)))

(assert (=> d!89963 (= res!411844 (is-Nil!12383 Nil!12383))))

(assert (=> d!89963 (= (noDuplicate!378 Nil!12383) e!364169)))

(declare-fun b!636556 () Bool)

(declare-fun e!364170 () Bool)

(assert (=> b!636556 (= e!364169 e!364170)))

(declare-fun res!411845 () Bool)

(assert (=> b!636556 (=> (not res!411845) (not e!364170))))

(assert (=> b!636556 (= res!411845 (not (contains!3100 (t!18614 Nil!12383) (h!13427 Nil!12383))))))

(declare-fun b!636557 () Bool)

(assert (=> b!636557 (= e!364170 (noDuplicate!378 (t!18614 Nil!12383)))))

(assert (= (and d!89963 (not res!411844)) b!636556))

(assert (= (and b!636556 res!411845) b!636557))

(declare-fun m!610771 () Bool)

(assert (=> b!636556 m!610771))

(declare-fun m!610773 () Bool)

(assert (=> b!636557 m!610773))

(assert (=> b!636336 d!89963))

(declare-fun d!89969 () Bool)

(declare-fun lt!294343 () Bool)

(declare-fun content!243 (List!12386) (Set (_ BitVec 64)))

(assert (=> d!89969 (= lt!294343 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!243 Nil!12383)))))

(declare-fun e!364177 () Bool)

(assert (=> d!89969 (= lt!294343 e!364177)))

(declare-fun res!411852 () Bool)

(assert (=> d!89969 (=> (not res!411852) (not e!364177))))

(assert (=> d!89969 (= res!411852 (is-Cons!12382 Nil!12383))))

(assert (=> d!89969 (= (contains!3100 Nil!12383 #b1000000000000000000000000000000000000000000000000000000000000000) lt!294343)))

(declare-fun b!636564 () Bool)

(declare-fun e!364178 () Bool)

(assert (=> b!636564 (= e!364177 e!364178)))

(declare-fun res!411853 () Bool)

(assert (=> b!636564 (=> res!411853 e!364178)))

(assert (=> b!636564 (= res!411853 (= (h!13427 Nil!12383) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!636565 () Bool)

(assert (=> b!636565 (= e!364178 (contains!3100 (t!18614 Nil!12383) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!89969 res!411852) b!636564))

(assert (= (and b!636564 (not res!411853)) b!636565))

(declare-fun m!610779 () Bool)

(assert (=> d!89969 m!610779))

(declare-fun m!610781 () Bool)

(assert (=> d!89969 m!610781))

(declare-fun m!610783 () Bool)

(assert (=> b!636565 m!610783))

(assert (=> b!636324 d!89969))

(declare-fun d!89973 () Bool)

(declare-fun res!411864 () Bool)

(declare-fun e!364189 () Bool)

(assert (=> d!89973 (=> res!411864 e!364189)))

(assert (=> d!89973 (= res!411864 (= (select (arr!18345 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!89973 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!364189)))

(declare-fun b!636576 () Bool)

(declare-fun e!364190 () Bool)

(assert (=> b!636576 (= e!364189 e!364190)))

(declare-fun res!411865 () Bool)

(assert (=> b!636576 (=> (not res!411865) (not e!364190))))

(assert (=> b!636576 (= res!411865 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18709 a!2986)))))

(declare-fun b!636577 () Bool)

(assert (=> b!636577 (= e!364190 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!89973 (not res!411864)) b!636576))

(assert (= (and b!636576 res!411865) b!636577))

(declare-fun m!610789 () Bool)

(assert (=> d!89973 m!610789))

(declare-fun m!610791 () Bool)

(assert (=> b!636577 m!610791))

(assert (=> b!636335 d!89973))

(declare-fun d!89983 () Bool)

(declare-fun res!411866 () Bool)

(declare-fun e!364191 () Bool)

(assert (=> d!89983 (=> res!411866 e!364191)))

(assert (=> d!89983 (= res!411866 (= (select (arr!18345 lt!294245) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18345 a!2986) j!136)))))

(assert (=> d!89983 (= (arrayContainsKey!0 lt!294245 (select (arr!18345 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!364191)))

(declare-fun b!636578 () Bool)

(declare-fun e!364192 () Bool)

(assert (=> b!636578 (= e!364191 e!364192)))

(declare-fun res!411867 () Bool)

(assert (=> b!636578 (=> (not res!411867) (not e!364192))))

(assert (=> b!636578 (= res!411867 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18709 lt!294245)))))

(declare-fun b!636579 () Bool)

(assert (=> b!636579 (= e!364192 (arrayContainsKey!0 lt!294245 (select (arr!18345 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!89983 (not res!411866)) b!636578))

(assert (= (and b!636578 res!411867) b!636579))

(declare-fun m!610793 () Bool)

(assert (=> d!89983 m!610793))

(assert (=> b!636579 m!610553))

(declare-fun m!610795 () Bool)

(assert (=> b!636579 m!610795))

(assert (=> b!636344 d!89983))

(declare-fun d!89985 () Bool)

(assert (=> d!89985 (arrayContainsKey!0 lt!294245 (select (arr!18345 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!294346 () Unit!21474)

(declare-fun choose!114 (array!38239 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21474)

(assert (=> d!89985 (= lt!294346 (choose!114 lt!294245 (select (arr!18345 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!89985 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!89985 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!294245 (select (arr!18345 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!294346)))

(declare-fun bs!19115 () Bool)

(assert (= bs!19115 d!89985))

(assert (=> bs!19115 m!610553))

(assert (=> bs!19115 m!610571))

(assert (=> bs!19115 m!610553))

(declare-fun m!610801 () Bool)

(assert (=> bs!19115 m!610801))

(assert (=> b!636344 d!89985))

(declare-fun d!89989 () Bool)

(declare-fun lt!294347 () Bool)

(assert (=> d!89989 (= lt!294347 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!243 Nil!12383)))))

(declare-fun e!364199 () Bool)

(assert (=> d!89989 (= lt!294347 e!364199)))

(declare-fun res!411874 () Bool)

(assert (=> d!89989 (=> (not res!411874) (not e!364199))))

(assert (=> d!89989 (= res!411874 (is-Cons!12382 Nil!12383))))

(assert (=> d!89989 (= (contains!3100 Nil!12383 #b0000000000000000000000000000000000000000000000000000000000000000) lt!294347)))

(declare-fun b!636586 () Bool)

(declare-fun e!364200 () Bool)

(assert (=> b!636586 (= e!364199 e!364200)))

(declare-fun res!411875 () Bool)

(assert (=> b!636586 (=> res!411875 e!364200)))

(assert (=> b!636586 (= res!411875 (= (h!13427 Nil!12383) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!636587 () Bool)

(assert (=> b!636587 (= e!364200 (contains!3100 (t!18614 Nil!12383) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!89989 res!411874) b!636586))

(assert (= (and b!636586 (not res!411875)) b!636587))

(assert (=> d!89989 m!610779))

(declare-fun m!610803 () Bool)

(assert (=> d!89989 m!610803))

(declare-fun m!610805 () Bool)

(assert (=> b!636587 m!610805))

(assert (=> b!636323 d!89989))

(declare-fun d!89991 () Bool)

(declare-fun res!411876 () Bool)

(declare-fun e!364201 () Bool)

(assert (=> d!89991 (=> res!411876 e!364201)))

(assert (=> d!89991 (= res!411876 (= (select (arr!18345 lt!294245) j!136) (select (arr!18345 a!2986) j!136)))))

(assert (=> d!89991 (= (arrayContainsKey!0 lt!294245 (select (arr!18345 a!2986) j!136) j!136) e!364201)))

(declare-fun b!636588 () Bool)

(declare-fun e!364202 () Bool)

(assert (=> b!636588 (= e!364201 e!364202)))

(declare-fun res!411877 () Bool)

(assert (=> b!636588 (=> (not res!411877) (not e!364202))))

(assert (=> b!636588 (= res!411877 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18709 lt!294245)))))

(declare-fun b!636589 () Bool)

(assert (=> b!636589 (= e!364202 (arrayContainsKey!0 lt!294245 (select (arr!18345 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!89991 (not res!411876)) b!636588))

(assert (= (and b!636588 res!411877) b!636589))

(declare-fun m!610807 () Bool)

(assert (=> d!89991 m!610807))

(assert (=> b!636589 m!610553))

(declare-fun m!610809 () Bool)

(assert (=> b!636589 m!610809))

(assert (=> b!636334 d!89991))

(declare-fun d!89993 () Bool)


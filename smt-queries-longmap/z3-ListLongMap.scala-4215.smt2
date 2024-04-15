; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57794 () Bool)

(assert start!57794)

(declare-fun b!638952 () Bool)

(declare-fun e!365651 () Bool)

(declare-fun e!365654 () Bool)

(assert (=> b!638952 (= e!365651 e!365654)))

(declare-fun res!413683 () Bool)

(assert (=> b!638952 (=> res!413683 e!365654)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!295435 () (_ BitVec 64))

(declare-fun lt!295442 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38307 0))(
  ( (array!38308 (arr!18374 (Array (_ BitVec 32) (_ BitVec 64))) (size!18739 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38307)

(assert (=> b!638952 (= res!413683 (or (not (= (select (arr!18374 a!2986) j!136) lt!295435)) (not (= (select (arr!18374 a!2986) j!136) lt!295442)) (bvsge j!136 index!984)))))

(declare-fun e!365656 () Bool)

(assert (=> b!638952 e!365656))

(declare-fun res!413680 () Bool)

(assert (=> b!638952 (=> (not res!413680) (not e!365656))))

(assert (=> b!638952 (= res!413680 (= lt!295442 (select (arr!18374 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!638952 (= lt!295442 (select (store (arr!18374 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!638953 () Bool)

(declare-datatypes ((Unit!21572 0))(
  ( (Unit!21573) )
))
(declare-fun e!365659 () Unit!21572)

(declare-fun Unit!21574 () Unit!21572)

(assert (=> b!638953 (= e!365659 Unit!21574)))

(assert (=> b!638953 false))

(declare-fun b!638954 () Bool)

(declare-fun e!365653 () Bool)

(declare-fun e!365652 () Bool)

(assert (=> b!638954 (= e!365653 e!365652)))

(declare-fun res!413689 () Bool)

(assert (=> b!638954 (=> (not res!413689) (not e!365652))))

(declare-fun lt!295445 () array!38307)

(declare-fun arrayContainsKey!0 (array!38307 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!638954 (= res!413689 (arrayContainsKey!0 lt!295445 (select (arr!18374 a!2986) j!136) j!136))))

(declare-fun b!638955 () Bool)

(declare-fun e!365650 () Bool)

(declare-fun e!365658 () Bool)

(assert (=> b!638955 (= e!365650 e!365658)))

(declare-fun res!413682 () Bool)

(assert (=> b!638955 (=> (not res!413682) (not e!365658))))

(declare-datatypes ((SeekEntryResult!6811 0))(
  ( (MissingZero!6811 (index!29561 (_ BitVec 32))) (Found!6811 (index!29562 (_ BitVec 32))) (Intermediate!6811 (undefined!7623 Bool) (index!29563 (_ BitVec 32)) (x!58329 (_ BitVec 32))) (Undefined!6811) (MissingVacant!6811 (index!29564 (_ BitVec 32))) )
))
(declare-fun lt!295438 () SeekEntryResult!6811)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!638955 (= res!413682 (and (= lt!295438 (Found!6811 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18374 a!2986) index!984) (select (arr!18374 a!2986) j!136))) (not (= (select (arr!18374 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38307 (_ BitVec 32)) SeekEntryResult!6811)

(assert (=> b!638955 (= lt!295438 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18374 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!638956 () Bool)

(assert (=> b!638956 (= e!365658 (not e!365651))))

(declare-fun res!413691 () Bool)

(assert (=> b!638956 (=> res!413691 e!365651)))

(declare-fun lt!295440 () SeekEntryResult!6811)

(assert (=> b!638956 (= res!413691 (not (= lt!295440 (Found!6811 index!984))))))

(declare-fun lt!295436 () Unit!21572)

(assert (=> b!638956 (= lt!295436 e!365659)))

(declare-fun c!73005 () Bool)

(assert (=> b!638956 (= c!73005 (= lt!295440 Undefined!6811))))

(assert (=> b!638956 (= lt!295440 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!295435 lt!295445 mask!3053))))

(declare-fun e!365655 () Bool)

(assert (=> b!638956 e!365655))

(declare-fun res!413687 () Bool)

(assert (=> b!638956 (=> (not res!413687) (not e!365655))))

(declare-fun lt!295439 () SeekEntryResult!6811)

(declare-fun lt!295443 () (_ BitVec 32))

(assert (=> b!638956 (= res!413687 (= lt!295439 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295443 vacantSpotIndex!68 lt!295435 lt!295445 mask!3053)))))

(assert (=> b!638956 (= lt!295439 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295443 vacantSpotIndex!68 (select (arr!18374 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!638956 (= lt!295435 (select (store (arr!18374 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!295444 () Unit!21572)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38307 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21572)

(assert (=> b!638956 (= lt!295444 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295443 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!638956 (= lt!295443 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!638957 () Bool)

(assert (=> b!638957 (= e!365654 (or (bvsge (size!18739 a!2986) #b01111111111111111111111111111111) (bvsle #b00000000000000000000000000000000 (size!18739 a!2986))))))

(declare-datatypes ((List!12454 0))(
  ( (Nil!12451) (Cons!12450 (h!13495 (_ BitVec 64)) (t!18673 List!12454)) )
))
(declare-fun arrayNoDuplicates!0 (array!38307 (_ BitVec 32) List!12454) Bool)

(assert (=> b!638957 (arrayNoDuplicates!0 lt!295445 #b00000000000000000000000000000000 Nil!12451)))

(declare-fun lt!295441 () Unit!21572)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38307 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12454) Unit!21572)

(assert (=> b!638957 (= lt!295441 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12451))))

(assert (=> b!638957 (arrayContainsKey!0 lt!295445 (select (arr!18374 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!295437 () Unit!21572)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38307 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21572)

(assert (=> b!638957 (= lt!295437 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!295445 (select (arr!18374 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!638958 () Bool)

(declare-fun res!413676 () Bool)

(declare-fun e!365660 () Bool)

(assert (=> b!638958 (=> (not res!413676) (not e!365660))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!638958 (= res!413676 (validKeyInArray!0 k0!1786))))

(declare-fun b!638959 () Bool)

(declare-fun e!365657 () Bool)

(assert (=> b!638959 (= e!365657 e!365650)))

(declare-fun res!413684 () Bool)

(assert (=> b!638959 (=> (not res!413684) (not e!365650))))

(assert (=> b!638959 (= res!413684 (= (select (store (arr!18374 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!638959 (= lt!295445 (array!38308 (store (arr!18374 a!2986) i!1108 k0!1786) (size!18739 a!2986)))))

(declare-fun b!638960 () Bool)

(declare-fun res!413688 () Bool)

(assert (=> b!638960 (=> (not res!413688) (not e!365657))))

(assert (=> b!638960 (= res!413688 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12451))))

(declare-fun b!638961 () Bool)

(declare-fun res!413686 () Bool)

(assert (=> b!638961 (=> (not res!413686) (not e!365657))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38307 (_ BitVec 32)) Bool)

(assert (=> b!638961 (= res!413686 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!638962 () Bool)

(assert (=> b!638962 (= e!365655 (= lt!295438 lt!295439))))

(declare-fun res!413685 () Bool)

(assert (=> start!57794 (=> (not res!413685) (not e!365660))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57794 (= res!413685 (validMask!0 mask!3053))))

(assert (=> start!57794 e!365660))

(assert (=> start!57794 true))

(declare-fun array_inv!14257 (array!38307) Bool)

(assert (=> start!57794 (array_inv!14257 a!2986)))

(declare-fun b!638963 () Bool)

(declare-fun res!413690 () Bool)

(assert (=> b!638963 (=> (not res!413690) (not e!365660))))

(assert (=> b!638963 (= res!413690 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!638964 () Bool)

(assert (=> b!638964 (= e!365656 e!365653)))

(declare-fun res!413692 () Bool)

(assert (=> b!638964 (=> res!413692 e!365653)))

(assert (=> b!638964 (= res!413692 (or (not (= (select (arr!18374 a!2986) j!136) lt!295435)) (not (= (select (arr!18374 a!2986) j!136) lt!295442)) (bvsge j!136 index!984)))))

(declare-fun b!638965 () Bool)

(assert (=> b!638965 (= e!365652 (arrayContainsKey!0 lt!295445 (select (arr!18374 a!2986) j!136) index!984))))

(declare-fun b!638966 () Bool)

(assert (=> b!638966 (= e!365660 e!365657)))

(declare-fun res!413677 () Bool)

(assert (=> b!638966 (=> (not res!413677) (not e!365657))))

(declare-fun lt!295446 () SeekEntryResult!6811)

(assert (=> b!638966 (= res!413677 (or (= lt!295446 (MissingZero!6811 i!1108)) (= lt!295446 (MissingVacant!6811 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38307 (_ BitVec 32)) SeekEntryResult!6811)

(assert (=> b!638966 (= lt!295446 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!638967 () Bool)

(declare-fun Unit!21575 () Unit!21572)

(assert (=> b!638967 (= e!365659 Unit!21575)))

(declare-fun b!638968 () Bool)

(declare-fun res!413681 () Bool)

(assert (=> b!638968 (=> (not res!413681) (not e!365660))))

(assert (=> b!638968 (= res!413681 (validKeyInArray!0 (select (arr!18374 a!2986) j!136)))))

(declare-fun b!638969 () Bool)

(declare-fun res!413678 () Bool)

(assert (=> b!638969 (=> (not res!413678) (not e!365657))))

(assert (=> b!638969 (= res!413678 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18374 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!638970 () Bool)

(declare-fun res!413679 () Bool)

(assert (=> b!638970 (=> (not res!413679) (not e!365660))))

(assert (=> b!638970 (= res!413679 (and (= (size!18739 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18739 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18739 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!57794 res!413685) b!638970))

(assert (= (and b!638970 res!413679) b!638968))

(assert (= (and b!638968 res!413681) b!638958))

(assert (= (and b!638958 res!413676) b!638963))

(assert (= (and b!638963 res!413690) b!638966))

(assert (= (and b!638966 res!413677) b!638961))

(assert (= (and b!638961 res!413686) b!638960))

(assert (= (and b!638960 res!413688) b!638969))

(assert (= (and b!638969 res!413678) b!638959))

(assert (= (and b!638959 res!413684) b!638955))

(assert (= (and b!638955 res!413682) b!638956))

(assert (= (and b!638956 res!413687) b!638962))

(assert (= (and b!638956 c!73005) b!638953))

(assert (= (and b!638956 (not c!73005)) b!638967))

(assert (= (and b!638956 (not res!413691)) b!638952))

(assert (= (and b!638952 res!413680) b!638964))

(assert (= (and b!638964 (not res!413692)) b!638954))

(assert (= (and b!638954 res!413689) b!638965))

(assert (= (and b!638952 (not res!413683)) b!638957))

(declare-fun m!612339 () Bool)

(assert (=> b!638960 m!612339))

(declare-fun m!612341 () Bool)

(assert (=> b!638964 m!612341))

(declare-fun m!612343 () Bool)

(assert (=> b!638959 m!612343))

(declare-fun m!612345 () Bool)

(assert (=> b!638959 m!612345))

(assert (=> b!638954 m!612341))

(assert (=> b!638954 m!612341))

(declare-fun m!612347 () Bool)

(assert (=> b!638954 m!612347))

(declare-fun m!612349 () Bool)

(assert (=> b!638963 m!612349))

(assert (=> b!638965 m!612341))

(assert (=> b!638965 m!612341))

(declare-fun m!612351 () Bool)

(assert (=> b!638965 m!612351))

(declare-fun m!612353 () Bool)

(assert (=> b!638966 m!612353))

(declare-fun m!612355 () Bool)

(assert (=> b!638958 m!612355))

(assert (=> b!638952 m!612341))

(assert (=> b!638952 m!612343))

(declare-fun m!612357 () Bool)

(assert (=> b!638952 m!612357))

(declare-fun m!612359 () Bool)

(assert (=> b!638961 m!612359))

(declare-fun m!612361 () Bool)

(assert (=> start!57794 m!612361))

(declare-fun m!612363 () Bool)

(assert (=> start!57794 m!612363))

(declare-fun m!612365 () Bool)

(assert (=> b!638969 m!612365))

(declare-fun m!612367 () Bool)

(assert (=> b!638956 m!612367))

(declare-fun m!612369 () Bool)

(assert (=> b!638956 m!612369))

(assert (=> b!638956 m!612341))

(assert (=> b!638956 m!612343))

(assert (=> b!638956 m!612341))

(declare-fun m!612371 () Bool)

(assert (=> b!638956 m!612371))

(declare-fun m!612373 () Bool)

(assert (=> b!638956 m!612373))

(declare-fun m!612375 () Bool)

(assert (=> b!638956 m!612375))

(declare-fun m!612377 () Bool)

(assert (=> b!638956 m!612377))

(assert (=> b!638957 m!612341))

(assert (=> b!638957 m!612341))

(declare-fun m!612379 () Bool)

(assert (=> b!638957 m!612379))

(declare-fun m!612381 () Bool)

(assert (=> b!638957 m!612381))

(assert (=> b!638957 m!612341))

(declare-fun m!612383 () Bool)

(assert (=> b!638957 m!612383))

(declare-fun m!612385 () Bool)

(assert (=> b!638957 m!612385))

(declare-fun m!612387 () Bool)

(assert (=> b!638955 m!612387))

(assert (=> b!638955 m!612341))

(assert (=> b!638955 m!612341))

(declare-fun m!612389 () Bool)

(assert (=> b!638955 m!612389))

(assert (=> b!638968 m!612341))

(assert (=> b!638968 m!612341))

(declare-fun m!612391 () Bool)

(assert (=> b!638968 m!612391))

(check-sat (not b!638968) (not b!638956) (not b!638961) (not b!638960) (not b!638963) (not b!638958) (not start!57794) (not b!638965) (not b!638966) (not b!638955) (not b!638957) (not b!638954))
(check-sat)

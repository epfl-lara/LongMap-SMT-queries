; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56718 () Bool)

(assert start!56718)

(declare-fun b!628350 () Bool)

(declare-fun res!405948 () Bool)

(declare-fun e!359575 () Bool)

(assert (=> b!628350 (=> (not res!405948) (not e!359575))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37953 0))(
  ( (array!37954 (arr!18214 (Array (_ BitVec 32) (_ BitVec 64))) (size!18578 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37953)

(declare-datatypes ((SeekEntryResult!6610 0))(
  ( (MissingZero!6610 (index!28724 (_ BitVec 32))) (Found!6610 (index!28725 (_ BitVec 32))) (Intermediate!6610 (undefined!7422 Bool) (index!28726 (_ BitVec 32)) (x!57609 (_ BitVec 32))) (Undefined!6610) (MissingVacant!6610 (index!28727 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37953 (_ BitVec 32)) SeekEntryResult!6610)

(assert (=> b!628350 (= res!405948 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18214 a!2986) j!136) a!2986 mask!3053) (Found!6610 j!136)))))

(declare-fun b!628351 () Bool)

(declare-fun res!405955 () Bool)

(assert (=> b!628351 (=> (not res!405955) (not e!359575))))

(assert (=> b!628351 (= res!405955 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18214 a!2986) index!984) (select (arr!18214 a!2986) j!136))) (not (= (select (arr!18214 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!628352 () Bool)

(declare-fun e!359577 () Bool)

(assert (=> b!628352 (= e!359577 e!359575)))

(declare-fun res!405951 () Bool)

(assert (=> b!628352 (=> (not res!405951) (not e!359575))))

(declare-fun lt!290508 () SeekEntryResult!6610)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!628352 (= res!405951 (or (= lt!290508 (MissingZero!6610 i!1108)) (= lt!290508 (MissingVacant!6610 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37953 (_ BitVec 32)) SeekEntryResult!6610)

(assert (=> b!628352 (= lt!290508 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!628353 () Bool)

(declare-fun res!405946 () Bool)

(assert (=> b!628353 (=> (not res!405946) (not e!359575))))

(declare-datatypes ((List!12162 0))(
  ( (Nil!12159) (Cons!12158 (h!13206 (_ BitVec 64)) (t!18382 List!12162)) )
))
(declare-fun arrayNoDuplicates!0 (array!37953 (_ BitVec 32) List!12162) Bool)

(assert (=> b!628353 (= res!405946 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12159))))

(declare-fun b!628354 () Bool)

(assert (=> b!628354 (= e!359575 false)))

(declare-fun lt!290509 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!628354 (= lt!290509 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!628355 () Bool)

(declare-fun res!405945 () Bool)

(assert (=> b!628355 (=> (not res!405945) (not e!359575))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37953 (_ BitVec 32)) Bool)

(assert (=> b!628355 (= res!405945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!628356 () Bool)

(declare-fun res!405947 () Bool)

(assert (=> b!628356 (=> (not res!405947) (not e!359577))))

(assert (=> b!628356 (= res!405947 (and (= (size!18578 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18578 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18578 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!628357 () Bool)

(declare-fun res!405952 () Bool)

(assert (=> b!628357 (=> (not res!405952) (not e!359575))))

(assert (=> b!628357 (= res!405952 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18214 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18214 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!628358 () Bool)

(declare-fun res!405950 () Bool)

(assert (=> b!628358 (=> (not res!405950) (not e!359577))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!628358 (= res!405950 (validKeyInArray!0 k0!1786))))

(declare-fun b!628360 () Bool)

(declare-fun res!405954 () Bool)

(assert (=> b!628360 (=> (not res!405954) (not e!359577))))

(assert (=> b!628360 (= res!405954 (validKeyInArray!0 (select (arr!18214 a!2986) j!136)))))

(declare-fun b!628359 () Bool)

(declare-fun res!405953 () Bool)

(assert (=> b!628359 (=> (not res!405953) (not e!359577))))

(declare-fun arrayContainsKey!0 (array!37953 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!628359 (= res!405953 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!405949 () Bool)

(assert (=> start!56718 (=> (not res!405949) (not e!359577))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56718 (= res!405949 (validMask!0 mask!3053))))

(assert (=> start!56718 e!359577))

(assert (=> start!56718 true))

(declare-fun array_inv!14073 (array!37953) Bool)

(assert (=> start!56718 (array_inv!14073 a!2986)))

(assert (= (and start!56718 res!405949) b!628356))

(assert (= (and b!628356 res!405947) b!628360))

(assert (= (and b!628360 res!405954) b!628358))

(assert (= (and b!628358 res!405950) b!628359))

(assert (= (and b!628359 res!405953) b!628352))

(assert (= (and b!628352 res!405951) b!628355))

(assert (= (and b!628355 res!405945) b!628353))

(assert (= (and b!628353 res!405946) b!628357))

(assert (= (and b!628357 res!405952) b!628350))

(assert (= (and b!628350 res!405948) b!628351))

(assert (= (and b!628351 res!405955) b!628354))

(declare-fun m!603877 () Bool)

(assert (=> b!628358 m!603877))

(declare-fun m!603879 () Bool)

(assert (=> b!628350 m!603879))

(assert (=> b!628350 m!603879))

(declare-fun m!603881 () Bool)

(assert (=> b!628350 m!603881))

(declare-fun m!603883 () Bool)

(assert (=> b!628353 m!603883))

(declare-fun m!603885 () Bool)

(assert (=> b!628352 m!603885))

(declare-fun m!603887 () Bool)

(assert (=> b!628351 m!603887))

(assert (=> b!628351 m!603879))

(assert (=> b!628360 m!603879))

(assert (=> b!628360 m!603879))

(declare-fun m!603889 () Bool)

(assert (=> b!628360 m!603889))

(declare-fun m!603891 () Bool)

(assert (=> b!628354 m!603891))

(declare-fun m!603893 () Bool)

(assert (=> b!628355 m!603893))

(declare-fun m!603895 () Bool)

(assert (=> b!628357 m!603895))

(declare-fun m!603897 () Bool)

(assert (=> b!628357 m!603897))

(declare-fun m!603899 () Bool)

(assert (=> b!628357 m!603899))

(declare-fun m!603901 () Bool)

(assert (=> start!56718 m!603901))

(declare-fun m!603903 () Bool)

(assert (=> start!56718 m!603903))

(declare-fun m!603905 () Bool)

(assert (=> b!628359 m!603905))

(check-sat (not b!628360) (not start!56718) (not b!628352) (not b!628354) (not b!628355) (not b!628350) (not b!628358) (not b!628359) (not b!628353))
(check-sat)

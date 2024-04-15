; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53868 () Bool)

(assert start!53868)

(declare-fun res!375323 () Bool)

(declare-fun e!335561 () Bool)

(assert (=> start!53868 (=> (not res!375323) (not e!335561))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53868 (= res!375323 (validMask!0 mask!3053))))

(assert (=> start!53868 e!335561))

(assert (=> start!53868 true))

(declare-datatypes ((array!36726 0))(
  ( (array!36727 (arr!17636 (Array (_ BitVec 32) (_ BitVec 64))) (size!18001 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36726)

(declare-fun array_inv!13519 (array!36726) Bool)

(assert (=> start!53868 (array_inv!13519 a!2986)))

(declare-fun b!587541 () Bool)

(declare-fun res!375320 () Bool)

(assert (=> b!587541 (=> (not res!375320) (not e!335561))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!587541 (= res!375320 (validKeyInArray!0 k0!1786))))

(declare-fun b!587542 () Bool)

(declare-fun res!375329 () Bool)

(assert (=> b!587542 (=> (not res!375329) (not e!335561))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!587542 (= res!375329 (and (= (size!18001 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18001 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18001 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!587543 () Bool)

(declare-fun res!375327 () Bool)

(declare-fun e!335562 () Bool)

(assert (=> b!587543 (=> (not res!375327) (not e!335562))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!587543 (= res!375327 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17636 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17636 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!587544 () Bool)

(declare-fun res!375328 () Bool)

(assert (=> b!587544 (=> (not res!375328) (not e!335562))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36726 (_ BitVec 32)) Bool)

(assert (=> b!587544 (= res!375328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!587545 () Bool)

(declare-fun e!335563 () Bool)

(assert (=> b!587545 (= e!335562 e!335563)))

(declare-fun res!375321 () Bool)

(assert (=> b!587545 (=> (not res!375321) (not e!335563))))

(declare-datatypes ((SeekEntryResult!6073 0))(
  ( (MissingZero!6073 (index!26522 (_ BitVec 32))) (Found!6073 (index!26523 (_ BitVec 32))) (Intermediate!6073 (undefined!6885 Bool) (index!26524 (_ BitVec 32)) (x!55338 (_ BitVec 32))) (Undefined!6073) (MissingVacant!6073 (index!26525 (_ BitVec 32))) )
))
(declare-fun lt!266275 () SeekEntryResult!6073)

(assert (=> b!587545 (= res!375321 (and (= lt!266275 (Found!6073 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17636 a!2986) index!984) (select (arr!17636 a!2986) j!136))) (not (= (select (arr!17636 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36726 (_ BitVec 32)) SeekEntryResult!6073)

(assert (=> b!587545 (= lt!266275 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17636 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!587546 () Bool)

(declare-fun e!335565 () Bool)

(declare-fun lt!266272 () SeekEntryResult!6073)

(assert (=> b!587546 (= e!335565 (= lt!266275 lt!266272))))

(declare-fun b!587547 () Bool)

(assert (=> b!587547 (= e!335563 (not true))))

(assert (=> b!587547 e!335565))

(declare-fun res!375322 () Bool)

(assert (=> b!587547 (=> (not res!375322) (not e!335565))))

(declare-fun lt!266271 () (_ BitVec 32))

(assert (=> b!587547 (= res!375322 (= lt!266272 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266271 vacantSpotIndex!68 (select (store (arr!17636 a!2986) i!1108 k0!1786) j!136) (array!36727 (store (arr!17636 a!2986) i!1108 k0!1786) (size!18001 a!2986)) mask!3053)))))

(assert (=> b!587547 (= lt!266272 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266271 vacantSpotIndex!68 (select (arr!17636 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!18252 0))(
  ( (Unit!18253) )
))
(declare-fun lt!266274 () Unit!18252)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36726 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18252)

(assert (=> b!587547 (= lt!266274 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266271 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!587547 (= lt!266271 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!587548 () Bool)

(declare-fun res!375319 () Bool)

(assert (=> b!587548 (=> (not res!375319) (not e!335561))))

(assert (=> b!587548 (= res!375319 (validKeyInArray!0 (select (arr!17636 a!2986) j!136)))))

(declare-fun b!587549 () Bool)

(declare-fun res!375325 () Bool)

(assert (=> b!587549 (=> (not res!375325) (not e!335561))))

(declare-fun arrayContainsKey!0 (array!36726 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!587549 (= res!375325 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!587550 () Bool)

(declare-fun res!375324 () Bool)

(assert (=> b!587550 (=> (not res!375324) (not e!335562))))

(declare-datatypes ((List!11716 0))(
  ( (Nil!11713) (Cons!11712 (h!12757 (_ BitVec 64)) (t!17935 List!11716)) )
))
(declare-fun arrayNoDuplicates!0 (array!36726 (_ BitVec 32) List!11716) Bool)

(assert (=> b!587550 (= res!375324 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11713))))

(declare-fun b!587551 () Bool)

(assert (=> b!587551 (= e!335561 e!335562)))

(declare-fun res!375326 () Bool)

(assert (=> b!587551 (=> (not res!375326) (not e!335562))))

(declare-fun lt!266273 () SeekEntryResult!6073)

(assert (=> b!587551 (= res!375326 (or (= lt!266273 (MissingZero!6073 i!1108)) (= lt!266273 (MissingVacant!6073 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36726 (_ BitVec 32)) SeekEntryResult!6073)

(assert (=> b!587551 (= lt!266273 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!53868 res!375323) b!587542))

(assert (= (and b!587542 res!375329) b!587548))

(assert (= (and b!587548 res!375319) b!587541))

(assert (= (and b!587541 res!375320) b!587549))

(assert (= (and b!587549 res!375325) b!587551))

(assert (= (and b!587551 res!375326) b!587544))

(assert (= (and b!587544 res!375328) b!587550))

(assert (= (and b!587550 res!375324) b!587543))

(assert (= (and b!587543 res!375327) b!587545))

(assert (= (and b!587545 res!375321) b!587547))

(assert (= (and b!587547 res!375322) b!587546))

(declare-fun m!565483 () Bool)

(assert (=> b!587544 m!565483))

(declare-fun m!565485 () Bool)

(assert (=> b!587549 m!565485))

(declare-fun m!565487 () Bool)

(assert (=> b!587551 m!565487))

(declare-fun m!565489 () Bool)

(assert (=> b!587547 m!565489))

(declare-fun m!565491 () Bool)

(assert (=> b!587547 m!565491))

(declare-fun m!565493 () Bool)

(assert (=> b!587547 m!565493))

(declare-fun m!565495 () Bool)

(assert (=> b!587547 m!565495))

(assert (=> b!587547 m!565489))

(declare-fun m!565497 () Bool)

(assert (=> b!587547 m!565497))

(declare-fun m!565499 () Bool)

(assert (=> b!587547 m!565499))

(assert (=> b!587547 m!565491))

(declare-fun m!565501 () Bool)

(assert (=> b!587547 m!565501))

(declare-fun m!565503 () Bool)

(assert (=> b!587543 m!565503))

(assert (=> b!587543 m!565493))

(declare-fun m!565505 () Bool)

(assert (=> b!587543 m!565505))

(assert (=> b!587548 m!565491))

(assert (=> b!587548 m!565491))

(declare-fun m!565507 () Bool)

(assert (=> b!587548 m!565507))

(declare-fun m!565509 () Bool)

(assert (=> start!53868 m!565509))

(declare-fun m!565511 () Bool)

(assert (=> start!53868 m!565511))

(declare-fun m!565513 () Bool)

(assert (=> b!587550 m!565513))

(declare-fun m!565515 () Bool)

(assert (=> b!587541 m!565515))

(declare-fun m!565517 () Bool)

(assert (=> b!587545 m!565517))

(assert (=> b!587545 m!565491))

(assert (=> b!587545 m!565491))

(declare-fun m!565519 () Bool)

(assert (=> b!587545 m!565519))

(check-sat (not b!587550) (not b!587547) (not b!587548) (not b!587549) (not start!53868) (not b!587551) (not b!587545) (not b!587541) (not b!587544))
(check-sat)

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54498 () Bool)

(assert start!54498)

(declare-fun b!594550 () Bool)

(declare-fun res!380521 () Bool)

(declare-fun e!339711 () Bool)

(assert (=> b!594550 (=> (not res!380521) (not e!339711))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!36958 0))(
  ( (array!36959 (arr!17743 (Array (_ BitVec 32) (_ BitVec 64))) (size!18107 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36958)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!594550 (= res!380521 (and (= (size!18107 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18107 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18107 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!594551 () Bool)

(declare-fun e!339702 () Bool)

(declare-fun e!339704 () Bool)

(assert (=> b!594551 (= e!339702 e!339704)))

(declare-fun res!380507 () Bool)

(assert (=> b!594551 (=> (not res!380507) (not e!339704))))

(declare-datatypes ((SeekEntryResult!6183 0))(
  ( (MissingZero!6183 (index!26980 (_ BitVec 32))) (Found!6183 (index!26981 (_ BitVec 32))) (Intermediate!6183 (undefined!6995 Bool) (index!26982 (_ BitVec 32)) (x!55787 (_ BitVec 32))) (Undefined!6183) (MissingVacant!6183 (index!26983 (_ BitVec 32))) )
))
(declare-fun lt!269917 () SeekEntryResult!6183)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!594551 (= res!380507 (and (= lt!269917 (Found!6183 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17743 a!2986) index!984) (select (arr!17743 a!2986) j!136))) (not (= (select (arr!17743 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36958 (_ BitVec 32)) SeekEntryResult!6183)

(assert (=> b!594551 (= lt!269917 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17743 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!594552 () Bool)

(declare-fun e!339705 () Bool)

(declare-fun e!339707 () Bool)

(assert (=> b!594552 (= e!339705 e!339707)))

(declare-fun res!380517 () Bool)

(assert (=> b!594552 (=> res!380517 e!339707)))

(declare-fun lt!269916 () (_ BitVec 64))

(declare-fun lt!269914 () (_ BitVec 64))

(assert (=> b!594552 (= res!380517 (or (not (= (select (arr!17743 a!2986) j!136) lt!269914)) (not (= (select (arr!17743 a!2986) j!136) lt!269916)) (bvsge j!136 index!984)))))

(declare-fun b!594553 () Bool)

(declare-fun res!380520 () Bool)

(assert (=> b!594553 (=> (not res!380520) (not e!339711))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!594553 (= res!380520 (validKeyInArray!0 k0!1786))))

(declare-fun b!594554 () Bool)

(declare-datatypes ((Unit!18650 0))(
  ( (Unit!18651) )
))
(declare-fun e!339710 () Unit!18650)

(declare-fun Unit!18652 () Unit!18650)

(assert (=> b!594554 (= e!339710 Unit!18652)))

(declare-fun b!594555 () Bool)

(declare-fun e!339706 () Bool)

(assert (=> b!594555 (= e!339711 e!339706)))

(declare-fun res!380515 () Bool)

(assert (=> b!594555 (=> (not res!380515) (not e!339706))))

(declare-fun lt!269910 () SeekEntryResult!6183)

(assert (=> b!594555 (= res!380515 (or (= lt!269910 (MissingZero!6183 i!1108)) (= lt!269910 (MissingVacant!6183 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36958 (_ BitVec 32)) SeekEntryResult!6183)

(assert (=> b!594555 (= lt!269910 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!594556 () Bool)

(declare-fun res!380504 () Bool)

(declare-fun e!339708 () Bool)

(assert (=> b!594556 (=> res!380504 e!339708)))

(declare-datatypes ((List!11784 0))(
  ( (Nil!11781) (Cons!11780 (h!12825 (_ BitVec 64)) (t!18012 List!11784)) )
))
(declare-fun contains!2919 (List!11784 (_ BitVec 64)) Bool)

(assert (=> b!594556 (= res!380504 (contains!2919 Nil!11781 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!594557 () Bool)

(declare-fun res!380509 () Bool)

(assert (=> b!594557 (=> (not res!380509) (not e!339706))))

(assert (=> b!594557 (= res!380509 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17743 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!594558 () Bool)

(declare-fun res!380514 () Bool)

(assert (=> b!594558 (=> (not res!380514) (not e!339706))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36958 (_ BitVec 32)) Bool)

(assert (=> b!594558 (= res!380514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!594559 () Bool)

(declare-fun res!380512 () Bool)

(assert (=> b!594559 (=> (not res!380512) (not e!339706))))

(declare-fun arrayNoDuplicates!0 (array!36958 (_ BitVec 32) List!11784) Bool)

(assert (=> b!594559 (= res!380512 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11781))))

(declare-fun b!594560 () Bool)

(declare-fun e!339703 () Bool)

(declare-fun lt!269913 () SeekEntryResult!6183)

(assert (=> b!594560 (= e!339703 (= lt!269917 lt!269913))))

(declare-fun b!594561 () Bool)

(declare-fun e!339700 () Bool)

(assert (=> b!594561 (= e!339707 e!339700)))

(declare-fun res!380518 () Bool)

(assert (=> b!594561 (=> (not res!380518) (not e!339700))))

(declare-fun lt!269915 () array!36958)

(declare-fun arrayContainsKey!0 (array!36958 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!594561 (= res!380518 (arrayContainsKey!0 lt!269915 (select (arr!17743 a!2986) j!136) j!136))))

(declare-fun b!594562 () Bool)

(assert (=> b!594562 (= e!339700 (arrayContainsKey!0 lt!269915 (select (arr!17743 a!2986) j!136) index!984))))

(declare-fun res!380513 () Bool)

(assert (=> start!54498 (=> (not res!380513) (not e!339711))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54498 (= res!380513 (validMask!0 mask!3053))))

(assert (=> start!54498 e!339711))

(assert (=> start!54498 true))

(declare-fun array_inv!13539 (array!36958) Bool)

(assert (=> start!54498 (array_inv!13539 a!2986)))

(declare-fun b!594563 () Bool)

(declare-fun res!380508 () Bool)

(assert (=> b!594563 (=> (not res!380508) (not e!339711))))

(assert (=> b!594563 (= res!380508 (validKeyInArray!0 (select (arr!17743 a!2986) j!136)))))

(declare-fun b!594564 () Bool)

(assert (=> b!594564 (= e!339708 true)))

(declare-fun lt!269908 () Bool)

(assert (=> b!594564 (= lt!269908 (contains!2919 Nil!11781 k0!1786))))

(declare-fun b!594565 () Bool)

(declare-fun e!339709 () Bool)

(assert (=> b!594565 (= e!339704 (not e!339709))))

(declare-fun res!380506 () Bool)

(assert (=> b!594565 (=> res!380506 e!339709)))

(declare-fun lt!269907 () SeekEntryResult!6183)

(assert (=> b!594565 (= res!380506 (not (= lt!269907 (Found!6183 index!984))))))

(declare-fun lt!269909 () Unit!18650)

(assert (=> b!594565 (= lt!269909 e!339710)))

(declare-fun c!67391 () Bool)

(assert (=> b!594565 (= c!67391 (= lt!269907 Undefined!6183))))

(assert (=> b!594565 (= lt!269907 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!269914 lt!269915 mask!3053))))

(assert (=> b!594565 e!339703))

(declare-fun res!380516 () Bool)

(assert (=> b!594565 (=> (not res!380516) (not e!339703))))

(declare-fun lt!269912 () (_ BitVec 32))

(assert (=> b!594565 (= res!380516 (= lt!269913 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269912 vacantSpotIndex!68 lt!269914 lt!269915 mask!3053)))))

(assert (=> b!594565 (= lt!269913 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269912 vacantSpotIndex!68 (select (arr!17743 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!594565 (= lt!269914 (select (store (arr!17743 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!269906 () Unit!18650)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36958 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18650)

(assert (=> b!594565 (= lt!269906 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269912 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!594565 (= lt!269912 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!594566 () Bool)

(declare-fun e!339701 () Bool)

(assert (=> b!594566 (= e!339701 e!339708)))

(declare-fun res!380505 () Bool)

(assert (=> b!594566 (=> res!380505 e!339708)))

(assert (=> b!594566 (= res!380505 (or (bvsge (size!18107 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18107 a!2986))))))

(assert (=> b!594566 (arrayContainsKey!0 lt!269915 (select (arr!17743 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!269911 () Unit!18650)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36958 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18650)

(assert (=> b!594566 (= lt!269911 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!269915 (select (arr!17743 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!594567 () Bool)

(declare-fun res!380522 () Bool)

(assert (=> b!594567 (=> (not res!380522) (not e!339711))))

(assert (=> b!594567 (= res!380522 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!594568 () Bool)

(assert (=> b!594568 (= e!339709 e!339701)))

(declare-fun res!380503 () Bool)

(assert (=> b!594568 (=> res!380503 e!339701)))

(assert (=> b!594568 (= res!380503 (or (not (= (select (arr!17743 a!2986) j!136) lt!269914)) (not (= (select (arr!17743 a!2986) j!136) lt!269916)) (bvsge j!136 index!984)))))

(assert (=> b!594568 e!339705))

(declare-fun res!380519 () Bool)

(assert (=> b!594568 (=> (not res!380519) (not e!339705))))

(assert (=> b!594568 (= res!380519 (= lt!269916 (select (arr!17743 a!2986) j!136)))))

(assert (=> b!594568 (= lt!269916 (select (store (arr!17743 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!594569 () Bool)

(declare-fun res!380502 () Bool)

(assert (=> b!594569 (=> res!380502 e!339708)))

(declare-fun noDuplicate!238 (List!11784) Bool)

(assert (=> b!594569 (= res!380502 (not (noDuplicate!238 Nil!11781)))))

(declare-fun b!594570 () Bool)

(assert (=> b!594570 (= e!339706 e!339702)))

(declare-fun res!380510 () Bool)

(assert (=> b!594570 (=> (not res!380510) (not e!339702))))

(assert (=> b!594570 (= res!380510 (= (select (store (arr!17743 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!594570 (= lt!269915 (array!36959 (store (arr!17743 a!2986) i!1108 k0!1786) (size!18107 a!2986)))))

(declare-fun b!594571 () Bool)

(declare-fun Unit!18653 () Unit!18650)

(assert (=> b!594571 (= e!339710 Unit!18653)))

(assert (=> b!594571 false))

(declare-fun b!594572 () Bool)

(declare-fun res!380511 () Bool)

(assert (=> b!594572 (=> res!380511 e!339708)))

(assert (=> b!594572 (= res!380511 (contains!2919 Nil!11781 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!54498 res!380513) b!594550))

(assert (= (and b!594550 res!380521) b!594563))

(assert (= (and b!594563 res!380508) b!594553))

(assert (= (and b!594553 res!380520) b!594567))

(assert (= (and b!594567 res!380522) b!594555))

(assert (= (and b!594555 res!380515) b!594558))

(assert (= (and b!594558 res!380514) b!594559))

(assert (= (and b!594559 res!380512) b!594557))

(assert (= (and b!594557 res!380509) b!594570))

(assert (= (and b!594570 res!380510) b!594551))

(assert (= (and b!594551 res!380507) b!594565))

(assert (= (and b!594565 res!380516) b!594560))

(assert (= (and b!594565 c!67391) b!594571))

(assert (= (and b!594565 (not c!67391)) b!594554))

(assert (= (and b!594565 (not res!380506)) b!594568))

(assert (= (and b!594568 res!380519) b!594552))

(assert (= (and b!594552 (not res!380517)) b!594561))

(assert (= (and b!594561 res!380518) b!594562))

(assert (= (and b!594568 (not res!380503)) b!594566))

(assert (= (and b!594566 (not res!380505)) b!594569))

(assert (= (and b!594569 (not res!380502)) b!594556))

(assert (= (and b!594556 (not res!380504)) b!594572))

(assert (= (and b!594572 (not res!380511)) b!594564))

(declare-fun m!572343 () Bool)

(assert (=> b!594551 m!572343))

(declare-fun m!572345 () Bool)

(assert (=> b!594551 m!572345))

(assert (=> b!594551 m!572345))

(declare-fun m!572347 () Bool)

(assert (=> b!594551 m!572347))

(declare-fun m!572349 () Bool)

(assert (=> b!594553 m!572349))

(declare-fun m!572351 () Bool)

(assert (=> b!594567 m!572351))

(declare-fun m!572353 () Bool)

(assert (=> b!594558 m!572353))

(declare-fun m!572355 () Bool)

(assert (=> b!594569 m!572355))

(declare-fun m!572357 () Bool)

(assert (=> b!594555 m!572357))

(assert (=> b!594566 m!572345))

(assert (=> b!594566 m!572345))

(declare-fun m!572359 () Bool)

(assert (=> b!594566 m!572359))

(assert (=> b!594566 m!572345))

(declare-fun m!572361 () Bool)

(assert (=> b!594566 m!572361))

(assert (=> b!594563 m!572345))

(assert (=> b!594563 m!572345))

(declare-fun m!572363 () Bool)

(assert (=> b!594563 m!572363))

(declare-fun m!572365 () Bool)

(assert (=> b!594559 m!572365))

(declare-fun m!572367 () Bool)

(assert (=> b!594565 m!572367))

(declare-fun m!572369 () Bool)

(assert (=> b!594565 m!572369))

(assert (=> b!594565 m!572345))

(declare-fun m!572371 () Bool)

(assert (=> b!594565 m!572371))

(assert (=> b!594565 m!572345))

(declare-fun m!572373 () Bool)

(assert (=> b!594565 m!572373))

(declare-fun m!572375 () Bool)

(assert (=> b!594565 m!572375))

(declare-fun m!572377 () Bool)

(assert (=> b!594565 m!572377))

(declare-fun m!572379 () Bool)

(assert (=> b!594565 m!572379))

(declare-fun m!572381 () Bool)

(assert (=> start!54498 m!572381))

(declare-fun m!572383 () Bool)

(assert (=> start!54498 m!572383))

(declare-fun m!572385 () Bool)

(assert (=> b!594572 m!572385))

(declare-fun m!572387 () Bool)

(assert (=> b!594556 m!572387))

(declare-fun m!572389 () Bool)

(assert (=> b!594564 m!572389))

(assert (=> b!594561 m!572345))

(assert (=> b!594561 m!572345))

(declare-fun m!572391 () Bool)

(assert (=> b!594561 m!572391))

(assert (=> b!594552 m!572345))

(assert (=> b!594570 m!572371))

(declare-fun m!572393 () Bool)

(assert (=> b!594570 m!572393))

(assert (=> b!594562 m!572345))

(assert (=> b!594562 m!572345))

(declare-fun m!572395 () Bool)

(assert (=> b!594562 m!572395))

(assert (=> b!594568 m!572345))

(assert (=> b!594568 m!572371))

(declare-fun m!572397 () Bool)

(assert (=> b!594568 m!572397))

(declare-fun m!572399 () Bool)

(assert (=> b!594557 m!572399))

(check-sat (not b!594569) (not b!594561) (not b!594556) (not b!594559) (not b!594551) (not b!594572) (not b!594558) (not b!594565) (not b!594563) (not b!594553) (not b!594562) (not b!594567) (not b!594566) (not b!594564) (not start!54498) (not b!594555))
(check-sat)

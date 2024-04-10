; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53972 () Bool)

(assert start!53972)

(declare-fun b!589459 () Bool)

(declare-fun e!336530 () Bool)

(declare-fun e!336534 () Bool)

(assert (=> b!589459 (= e!336530 e!336534)))

(declare-fun res!376971 () Bool)

(assert (=> b!589459 (=> (not res!376971) (not e!336534))))

(declare-datatypes ((SeekEntryResult!6121 0))(
  ( (MissingZero!6121 (index!26714 (_ BitVec 32))) (Found!6121 (index!26715 (_ BitVec 32))) (Intermediate!6121 (undefined!6933 Bool) (index!26716 (_ BitVec 32)) (x!55503 (_ BitVec 32))) (Undefined!6121) (MissingVacant!6121 (index!26717 (_ BitVec 32))) )
))
(declare-fun lt!267355 () SeekEntryResult!6121)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!589459 (= res!376971 (or (= lt!267355 (MissingZero!6121 i!1108)) (= lt!267355 (MissingVacant!6121 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!36816 0))(
  ( (array!36817 (arr!17681 (Array (_ BitVec 32) (_ BitVec 64))) (size!18045 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36816)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36816 (_ BitVec 32)) SeekEntryResult!6121)

(assert (=> b!589459 (= lt!267355 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!589460 () Bool)

(declare-fun res!376974 () Bool)

(assert (=> b!589460 (=> (not res!376974) (not e!336534))))

(declare-datatypes ((List!11722 0))(
  ( (Nil!11719) (Cons!11718 (h!12763 (_ BitVec 64)) (t!17950 List!11722)) )
))
(declare-fun arrayNoDuplicates!0 (array!36816 (_ BitVec 32) List!11722) Bool)

(assert (=> b!589460 (= res!376974 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11719))))

(declare-fun b!589461 () Bool)

(declare-fun e!336532 () Bool)

(assert (=> b!589461 (= e!336534 e!336532)))

(declare-fun res!376980 () Bool)

(assert (=> b!589461 (=> (not res!376980) (not e!336532))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!589461 (= res!376980 (= (select (store (arr!17681 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!267357 () array!36816)

(assert (=> b!589461 (= lt!267357 (array!36817 (store (arr!17681 a!2986) i!1108 k!1786) (size!18045 a!2986)))))

(declare-fun b!589463 () Bool)

(declare-datatypes ((Unit!18402 0))(
  ( (Unit!18403) )
))
(declare-fun e!336533 () Unit!18402)

(declare-fun Unit!18404 () Unit!18402)

(assert (=> b!589463 (= e!336533 Unit!18404)))

(declare-fun b!589464 () Bool)

(declare-fun res!376976 () Bool)

(assert (=> b!589464 (=> (not res!376976) (not e!336530))))

(declare-fun arrayContainsKey!0 (array!36816 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!589464 (= res!376976 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!589465 () Bool)

(declare-fun res!376978 () Bool)

(assert (=> b!589465 (=> (not res!376978) (not e!336534))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36816 (_ BitVec 32)) Bool)

(assert (=> b!589465 (= res!376978 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!589466 () Bool)

(declare-fun res!376977 () Bool)

(assert (=> b!589466 (=> (not res!376977) (not e!336530))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!589466 (= res!376977 (validKeyInArray!0 (select (arr!17681 a!2986) j!136)))))

(declare-fun b!589467 () Bool)

(declare-fun res!376981 () Bool)

(assert (=> b!589467 (=> (not res!376981) (not e!336530))))

(assert (=> b!589467 (= res!376981 (and (= (size!18045 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18045 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18045 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!589468 () Bool)

(declare-fun res!376982 () Bool)

(assert (=> b!589468 (=> (not res!376982) (not e!336534))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!589468 (= res!376982 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17681 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!589469 () Bool)

(declare-fun e!336529 () Bool)

(assert (=> b!589469 (= e!336532 e!336529)))

(declare-fun res!376973 () Bool)

(assert (=> b!589469 (=> (not res!376973) (not e!336529))))

(declare-fun lt!267352 () SeekEntryResult!6121)

(assert (=> b!589469 (= res!376973 (and (= lt!267352 (Found!6121 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17681 a!2986) index!984) (select (arr!17681 a!2986) j!136))) (not (= (select (arr!17681 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36816 (_ BitVec 32)) SeekEntryResult!6121)

(assert (=> b!589469 (= lt!267352 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17681 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!589470 () Bool)

(assert (=> b!589470 (= e!336529 (not true))))

(declare-fun lt!267358 () Unit!18402)

(assert (=> b!589470 (= lt!267358 e!336533)))

(declare-fun lt!267353 () (_ BitVec 64))

(declare-fun c!66611 () Bool)

(assert (=> b!589470 (= c!66611 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267353 lt!267357 mask!3053) Undefined!6121))))

(declare-fun e!336531 () Bool)

(assert (=> b!589470 e!336531))

(declare-fun res!376975 () Bool)

(assert (=> b!589470 (=> (not res!376975) (not e!336531))))

(declare-fun lt!267356 () (_ BitVec 32))

(declare-fun lt!267351 () SeekEntryResult!6121)

(assert (=> b!589470 (= res!376975 (= lt!267351 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267356 vacantSpotIndex!68 lt!267353 lt!267357 mask!3053)))))

(assert (=> b!589470 (= lt!267351 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267356 vacantSpotIndex!68 (select (arr!17681 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!589470 (= lt!267353 (select (store (arr!17681 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!267354 () Unit!18402)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36816 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18402)

(assert (=> b!589470 (= lt!267354 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267356 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!589470 (= lt!267356 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!589462 () Bool)

(declare-fun Unit!18405 () Unit!18402)

(assert (=> b!589462 (= e!336533 Unit!18405)))

(assert (=> b!589462 false))

(declare-fun res!376972 () Bool)

(assert (=> start!53972 (=> (not res!376972) (not e!336530))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53972 (= res!376972 (validMask!0 mask!3053))))

(assert (=> start!53972 e!336530))

(assert (=> start!53972 true))

(declare-fun array_inv!13477 (array!36816) Bool)

(assert (=> start!53972 (array_inv!13477 a!2986)))

(declare-fun b!589471 () Bool)

(assert (=> b!589471 (= e!336531 (= lt!267352 lt!267351))))

(declare-fun b!589472 () Bool)

(declare-fun res!376979 () Bool)

(assert (=> b!589472 (=> (not res!376979) (not e!336530))))

(assert (=> b!589472 (= res!376979 (validKeyInArray!0 k!1786))))

(assert (= (and start!53972 res!376972) b!589467))

(assert (= (and b!589467 res!376981) b!589466))

(assert (= (and b!589466 res!376977) b!589472))

(assert (= (and b!589472 res!376979) b!589464))

(assert (= (and b!589464 res!376976) b!589459))

(assert (= (and b!589459 res!376971) b!589465))

(assert (= (and b!589465 res!376978) b!589460))

(assert (= (and b!589460 res!376974) b!589468))

(assert (= (and b!589468 res!376982) b!589461))

(assert (= (and b!589461 res!376980) b!589469))

(assert (= (and b!589469 res!376973) b!589470))

(assert (= (and b!589470 res!376975) b!589471))

(assert (= (and b!589470 c!66611) b!589462))

(assert (= (and b!589470 (not c!66611)) b!589463))

(declare-fun m!567987 () Bool)

(assert (=> b!589459 m!567987))

(declare-fun m!567989 () Bool)

(assert (=> start!53972 m!567989))

(declare-fun m!567991 () Bool)

(assert (=> start!53972 m!567991))

(declare-fun m!567993 () Bool)

(assert (=> b!589470 m!567993))

(declare-fun m!567995 () Bool)

(assert (=> b!589470 m!567995))

(declare-fun m!567997 () Bool)

(assert (=> b!589470 m!567997))

(declare-fun m!567999 () Bool)

(assert (=> b!589470 m!567999))

(declare-fun m!568001 () Bool)

(assert (=> b!589470 m!568001))

(declare-fun m!568003 () Bool)

(assert (=> b!589470 m!568003))

(assert (=> b!589470 m!567999))

(declare-fun m!568005 () Bool)

(assert (=> b!589470 m!568005))

(declare-fun m!568007 () Bool)

(assert (=> b!589470 m!568007))

(assert (=> b!589461 m!568001))

(declare-fun m!568009 () Bool)

(assert (=> b!589461 m!568009))

(assert (=> b!589466 m!567999))

(assert (=> b!589466 m!567999))

(declare-fun m!568011 () Bool)

(assert (=> b!589466 m!568011))

(declare-fun m!568013 () Bool)

(assert (=> b!589468 m!568013))

(declare-fun m!568015 () Bool)

(assert (=> b!589465 m!568015))

(declare-fun m!568017 () Bool)

(assert (=> b!589464 m!568017))

(declare-fun m!568019 () Bool)

(assert (=> b!589469 m!568019))

(assert (=> b!589469 m!567999))

(assert (=> b!589469 m!567999))

(declare-fun m!568021 () Bool)

(assert (=> b!589469 m!568021))

(declare-fun m!568023 () Bool)

(assert (=> b!589472 m!568023))

(declare-fun m!568025 () Bool)

(assert (=> b!589460 m!568025))

(push 1)


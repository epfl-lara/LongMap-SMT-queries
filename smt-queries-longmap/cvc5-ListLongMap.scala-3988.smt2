; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54058 () Bool)

(assert start!54058)

(declare-fun b!590317 () Bool)

(declare-fun e!337021 () Bool)

(assert (=> b!590317 (= e!337021 true)))

(declare-fun e!337022 () Bool)

(assert (=> b!590317 e!337022))

(declare-fun res!377561 () Bool)

(assert (=> b!590317 (=> (not res!377561) (not e!337022))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36845 0))(
  ( (array!36846 (arr!17694 (Array (_ BitVec 32) (_ BitVec 64))) (size!18058 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36845)

(assert (=> b!590317 (= res!377561 (= (select (store (arr!17694 a!2986) i!1108 k!1786) index!984) (select (arr!17694 a!2986) j!136)))))

(declare-fun b!590318 () Bool)

(declare-fun e!337019 () Bool)

(declare-fun e!337017 () Bool)

(assert (=> b!590318 (= e!337019 e!337017)))

(declare-fun res!377557 () Bool)

(assert (=> b!590318 (=> (not res!377557) (not e!337017))))

(declare-datatypes ((SeekEntryResult!6134 0))(
  ( (MissingZero!6134 (index!26769 (_ BitVec 32))) (Found!6134 (index!26770 (_ BitVec 32))) (Intermediate!6134 (undefined!6946 Bool) (index!26771 (_ BitVec 32)) (x!55565 (_ BitVec 32))) (Undefined!6134) (MissingVacant!6134 (index!26772 (_ BitVec 32))) )
))
(declare-fun lt!267808 () SeekEntryResult!6134)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!590318 (= res!377557 (and (= lt!267808 (Found!6134 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17694 a!2986) index!984) (select (arr!17694 a!2986) j!136))) (not (= (select (arr!17694 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36845 (_ BitVec 32)) SeekEntryResult!6134)

(assert (=> b!590318 (= lt!267808 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17694 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!590319 () Bool)

(declare-fun e!337016 () Bool)

(assert (=> b!590319 (= e!337016 e!337019)))

(declare-fun res!377558 () Bool)

(assert (=> b!590319 (=> (not res!377558) (not e!337019))))

(assert (=> b!590319 (= res!377558 (= (select (store (arr!17694 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!267807 () array!36845)

(assert (=> b!590319 (= lt!267807 (array!36846 (store (arr!17694 a!2986) i!1108 k!1786) (size!18058 a!2986)))))

(declare-fun b!590320 () Bool)

(declare-fun e!337014 () Bool)

(assert (=> b!590320 (= e!337014 e!337016)))

(declare-fun res!377555 () Bool)

(assert (=> b!590320 (=> (not res!377555) (not e!337016))))

(declare-fun lt!267802 () SeekEntryResult!6134)

(assert (=> b!590320 (= res!377555 (or (= lt!267802 (MissingZero!6134 i!1108)) (= lt!267802 (MissingVacant!6134 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36845 (_ BitVec 32)) SeekEntryResult!6134)

(assert (=> b!590320 (= lt!267802 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!590321 () Bool)

(declare-fun res!377559 () Bool)

(assert (=> b!590321 (=> (not res!377559) (not e!337014))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!590321 (= res!377559 (validKeyInArray!0 k!1786))))

(declare-fun e!337023 () Bool)

(declare-fun b!590322 () Bool)

(declare-fun arrayContainsKey!0 (array!36845 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!590322 (= e!337023 (arrayContainsKey!0 lt!267807 (select (arr!17694 a!2986) j!136) j!136))))

(declare-fun b!590323 () Bool)

(declare-datatypes ((Unit!18454 0))(
  ( (Unit!18455) )
))
(declare-fun e!337018 () Unit!18454)

(declare-fun Unit!18456 () Unit!18454)

(assert (=> b!590323 (= e!337018 Unit!18456)))

(assert (=> b!590323 false))

(declare-fun b!590324 () Bool)

(declare-fun Unit!18457 () Unit!18454)

(assert (=> b!590324 (= e!337018 Unit!18457)))

(declare-fun b!590325 () Bool)

(declare-fun res!377562 () Bool)

(assert (=> b!590325 (=> (not res!377562) (not e!337016))))

(declare-datatypes ((List!11735 0))(
  ( (Nil!11732) (Cons!11731 (h!12776 (_ BitVec 64)) (t!17963 List!11735)) )
))
(declare-fun arrayNoDuplicates!0 (array!36845 (_ BitVec 32) List!11735) Bool)

(assert (=> b!590325 (= res!377562 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11732))))

(declare-fun res!377553 () Bool)

(assert (=> start!54058 (=> (not res!377553) (not e!337014))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54058 (= res!377553 (validMask!0 mask!3053))))

(assert (=> start!54058 e!337014))

(assert (=> start!54058 true))

(declare-fun array_inv!13490 (array!36845) Bool)

(assert (=> start!54058 (array_inv!13490 a!2986)))

(declare-fun b!590326 () Bool)

(declare-fun res!377565 () Bool)

(assert (=> b!590326 (=> (not res!377565) (not e!337016))))

(assert (=> b!590326 (= res!377565 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17694 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!590327 () Bool)

(declare-fun res!377564 () Bool)

(assert (=> b!590327 (=> (not res!377564) (not e!337014))))

(assert (=> b!590327 (= res!377564 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!590328 () Bool)

(declare-fun res!377556 () Bool)

(assert (=> b!590328 (=> (not res!377556) (not e!337016))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36845 (_ BitVec 32)) Bool)

(assert (=> b!590328 (= res!377556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!590329 () Bool)

(declare-fun e!337020 () Bool)

(declare-fun lt!267805 () SeekEntryResult!6134)

(assert (=> b!590329 (= e!337020 (= lt!267808 lt!267805))))

(declare-fun b!590330 () Bool)

(assert (=> b!590330 (= e!337022 e!337023)))

(declare-fun res!377554 () Bool)

(assert (=> b!590330 (=> res!377554 e!337023)))

(declare-fun lt!267806 () (_ BitVec 64))

(assert (=> b!590330 (= res!377554 (or (not (= (select (arr!17694 a!2986) j!136) lt!267806)) (not (= (select (arr!17694 a!2986) j!136) (select (store (arr!17694 a!2986) i!1108 k!1786) index!984))) (bvsge j!136 index!984)))))

(declare-fun b!590331 () Bool)

(declare-fun res!377566 () Bool)

(assert (=> b!590331 (=> (not res!377566) (not e!337014))))

(assert (=> b!590331 (= res!377566 (and (= (size!18058 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18058 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18058 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!590332 () Bool)

(declare-fun res!377560 () Bool)

(assert (=> b!590332 (=> (not res!377560) (not e!337014))))

(assert (=> b!590332 (= res!377560 (validKeyInArray!0 (select (arr!17694 a!2986) j!136)))))

(declare-fun b!590333 () Bool)

(assert (=> b!590333 (= e!337017 (not e!337021))))

(declare-fun res!377567 () Bool)

(assert (=> b!590333 (=> res!377567 e!337021)))

(declare-fun lt!267800 () SeekEntryResult!6134)

(assert (=> b!590333 (= res!377567 (not (= lt!267800 (Found!6134 index!984))))))

(declare-fun lt!267803 () Unit!18454)

(assert (=> b!590333 (= lt!267803 e!337018)))

(declare-fun c!66749 () Bool)

(assert (=> b!590333 (= c!66749 (= lt!267800 Undefined!6134))))

(assert (=> b!590333 (= lt!267800 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267806 lt!267807 mask!3053))))

(assert (=> b!590333 e!337020))

(declare-fun res!377563 () Bool)

(assert (=> b!590333 (=> (not res!377563) (not e!337020))))

(declare-fun lt!267804 () (_ BitVec 32))

(assert (=> b!590333 (= res!377563 (= lt!267805 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267804 vacantSpotIndex!68 lt!267806 lt!267807 mask!3053)))))

(assert (=> b!590333 (= lt!267805 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267804 vacantSpotIndex!68 (select (arr!17694 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!590333 (= lt!267806 (select (store (arr!17694 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!267801 () Unit!18454)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36845 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18454)

(assert (=> b!590333 (= lt!267801 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267804 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!590333 (= lt!267804 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!54058 res!377553) b!590331))

(assert (= (and b!590331 res!377566) b!590332))

(assert (= (and b!590332 res!377560) b!590321))

(assert (= (and b!590321 res!377559) b!590327))

(assert (= (and b!590327 res!377564) b!590320))

(assert (= (and b!590320 res!377555) b!590328))

(assert (= (and b!590328 res!377556) b!590325))

(assert (= (and b!590325 res!377562) b!590326))

(assert (= (and b!590326 res!377565) b!590319))

(assert (= (and b!590319 res!377558) b!590318))

(assert (= (and b!590318 res!377557) b!590333))

(assert (= (and b!590333 res!377563) b!590329))

(assert (= (and b!590333 c!66749) b!590323))

(assert (= (and b!590333 (not c!66749)) b!590324))

(assert (= (and b!590333 (not res!377567)) b!590317))

(assert (= (and b!590317 res!377561) b!590330))

(assert (= (and b!590330 (not res!377554)) b!590322))

(declare-fun m!568741 () Bool)

(assert (=> b!590330 m!568741))

(declare-fun m!568743 () Bool)

(assert (=> b!590330 m!568743))

(declare-fun m!568745 () Bool)

(assert (=> b!590330 m!568745))

(declare-fun m!568747 () Bool)

(assert (=> b!590327 m!568747))

(declare-fun m!568749 () Bool)

(assert (=> b!590325 m!568749))

(assert (=> b!590322 m!568741))

(assert (=> b!590322 m!568741))

(declare-fun m!568751 () Bool)

(assert (=> b!590322 m!568751))

(assert (=> b!590332 m!568741))

(assert (=> b!590332 m!568741))

(declare-fun m!568753 () Bool)

(assert (=> b!590332 m!568753))

(assert (=> b!590319 m!568743))

(declare-fun m!568755 () Bool)

(assert (=> b!590319 m!568755))

(declare-fun m!568757 () Bool)

(assert (=> b!590318 m!568757))

(assert (=> b!590318 m!568741))

(assert (=> b!590318 m!568741))

(declare-fun m!568759 () Bool)

(assert (=> b!590318 m!568759))

(declare-fun m!568761 () Bool)

(assert (=> b!590321 m!568761))

(declare-fun m!568763 () Bool)

(assert (=> b!590333 m!568763))

(declare-fun m!568765 () Bool)

(assert (=> b!590333 m!568765))

(assert (=> b!590333 m!568741))

(assert (=> b!590333 m!568743))

(assert (=> b!590333 m!568741))

(declare-fun m!568767 () Bool)

(assert (=> b!590333 m!568767))

(declare-fun m!568769 () Bool)

(assert (=> b!590333 m!568769))

(declare-fun m!568771 () Bool)

(assert (=> b!590333 m!568771))

(declare-fun m!568773 () Bool)

(assert (=> b!590333 m!568773))

(declare-fun m!568775 () Bool)

(assert (=> b!590320 m!568775))

(declare-fun m!568777 () Bool)

(assert (=> b!590326 m!568777))

(declare-fun m!568779 () Bool)

(assert (=> start!54058 m!568779))

(declare-fun m!568781 () Bool)

(assert (=> start!54058 m!568781))

(declare-fun m!568783 () Bool)

(assert (=> b!590328 m!568783))

(assert (=> b!590317 m!568743))

(assert (=> b!590317 m!568745))

(assert (=> b!590317 m!568741))

(push 1)


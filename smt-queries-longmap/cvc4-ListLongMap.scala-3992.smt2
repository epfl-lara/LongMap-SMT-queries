; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54146 () Bool)

(assert start!54146)

(declare-fun b!591324 () Bool)

(declare-fun e!337634 () Bool)

(declare-fun e!337630 () Bool)

(assert (=> b!591324 (= e!337634 e!337630)))

(declare-fun res!378278 () Bool)

(assert (=> b!591324 (=> (not res!378278) (not e!337630))))

(declare-datatypes ((SeekEntryResult!6148 0))(
  ( (MissingZero!6148 (index!26828 (_ BitVec 32))) (Found!6148 (index!26829 (_ BitVec 32))) (Intermediate!6148 (undefined!6960 Bool) (index!26830 (_ BitVec 32)) (x!55620 (_ BitVec 32))) (Undefined!6148) (MissingVacant!6148 (index!26831 (_ BitVec 32))) )
))
(declare-fun lt!268304 () SeekEntryResult!6148)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!591324 (= res!378278 (or (= lt!268304 (MissingZero!6148 i!1108)) (= lt!268304 (MissingVacant!6148 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!36876 0))(
  ( (array!36877 (arr!17708 (Array (_ BitVec 32) (_ BitVec 64))) (size!18072 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36876)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36876 (_ BitVec 32)) SeekEntryResult!6148)

(assert (=> b!591324 (= lt!268304 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!378284 () Bool)

(assert (=> start!54146 (=> (not res!378284) (not e!337634))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54146 (= res!378284 (validMask!0 mask!3053))))

(assert (=> start!54146 e!337634))

(assert (=> start!54146 true))

(declare-fun array_inv!13504 (array!36876) Bool)

(assert (=> start!54146 (array_inv!13504 a!2986)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!591325 () Bool)

(declare-fun e!337637 () Bool)

(declare-fun lt!268310 () array!36876)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!36876 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!591325 (= e!337637 (arrayContainsKey!0 lt!268310 (select (arr!17708 a!2986) j!136) index!984))))

(declare-fun b!591326 () Bool)

(declare-fun res!378293 () Bool)

(assert (=> b!591326 (=> (not res!378293) (not e!337634))))

(assert (=> b!591326 (= res!378293 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!591327 () Bool)

(declare-datatypes ((Unit!18510 0))(
  ( (Unit!18511) )
))
(declare-fun e!337635 () Unit!18510)

(declare-fun Unit!18512 () Unit!18510)

(assert (=> b!591327 (= e!337635 Unit!18512)))

(declare-fun b!591328 () Bool)

(declare-fun res!378292 () Bool)

(assert (=> b!591328 (=> (not res!378292) (not e!337634))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!591328 (= res!378292 (validKeyInArray!0 k!1786))))

(declare-fun b!591329 () Bool)

(declare-fun e!337636 () Bool)

(declare-fun e!337629 () Bool)

(assert (=> b!591329 (= e!337636 (not e!337629))))

(declare-fun res!378288 () Bool)

(assert (=> b!591329 (=> res!378288 e!337629)))

(declare-fun lt!268308 () SeekEntryResult!6148)

(assert (=> b!591329 (= res!378288 (not (= lt!268308 (Found!6148 index!984))))))

(declare-fun lt!268312 () Unit!18510)

(assert (=> b!591329 (= lt!268312 e!337635)))

(declare-fun c!66890 () Bool)

(assert (=> b!591329 (= c!66890 (= lt!268308 Undefined!6148))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!268309 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36876 (_ BitVec 32)) SeekEntryResult!6148)

(assert (=> b!591329 (= lt!268308 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268309 lt!268310 mask!3053))))

(declare-fun e!337638 () Bool)

(assert (=> b!591329 e!337638))

(declare-fun res!378282 () Bool)

(assert (=> b!591329 (=> (not res!378282) (not e!337638))))

(declare-fun lt!268303 () SeekEntryResult!6148)

(declare-fun lt!268305 () (_ BitVec 32))

(assert (=> b!591329 (= res!378282 (= lt!268303 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268305 vacantSpotIndex!68 lt!268309 lt!268310 mask!3053)))))

(assert (=> b!591329 (= lt!268303 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268305 vacantSpotIndex!68 (select (arr!17708 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!591329 (= lt!268309 (select (store (arr!17708 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!268307 () Unit!18510)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36876 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18510)

(assert (=> b!591329 (= lt!268307 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268305 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!591329 (= lt!268305 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!591330 () Bool)

(declare-fun res!378291 () Bool)

(assert (=> b!591330 (=> (not res!378291) (not e!337630))))

(declare-datatypes ((List!11749 0))(
  ( (Nil!11746) (Cons!11745 (h!12790 (_ BitVec 64)) (t!17977 List!11749)) )
))
(declare-fun arrayNoDuplicates!0 (array!36876 (_ BitVec 32) List!11749) Bool)

(assert (=> b!591330 (= res!378291 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11746))))

(declare-fun b!591331 () Bool)

(declare-fun res!378287 () Bool)

(assert (=> b!591331 (=> (not res!378287) (not e!337634))))

(assert (=> b!591331 (= res!378287 (validKeyInArray!0 (select (arr!17708 a!2986) j!136)))))

(declare-fun b!591332 () Bool)

(declare-fun Unit!18513 () Unit!18510)

(assert (=> b!591332 (= e!337635 Unit!18513)))

(assert (=> b!591332 false))

(declare-fun b!591333 () Bool)

(declare-fun e!337631 () Bool)

(assert (=> b!591333 (= e!337631 e!337637)))

(declare-fun res!378283 () Bool)

(assert (=> b!591333 (=> (not res!378283) (not e!337637))))

(assert (=> b!591333 (= res!378283 (arrayContainsKey!0 lt!268310 (select (arr!17708 a!2986) j!136) j!136))))

(declare-fun b!591334 () Bool)

(declare-fun res!378281 () Bool)

(assert (=> b!591334 (=> (not res!378281) (not e!337634))))

(assert (=> b!591334 (= res!378281 (and (= (size!18072 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18072 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18072 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!591335 () Bool)

(declare-fun res!378280 () Bool)

(assert (=> b!591335 (=> (not res!378280) (not e!337630))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36876 (_ BitVec 32)) Bool)

(assert (=> b!591335 (= res!378280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!591336 () Bool)

(declare-fun e!337633 () Bool)

(assert (=> b!591336 (= e!337630 e!337633)))

(declare-fun res!378289 () Bool)

(assert (=> b!591336 (=> (not res!378289) (not e!337633))))

(assert (=> b!591336 (= res!378289 (= (select (store (arr!17708 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!591336 (= lt!268310 (array!36877 (store (arr!17708 a!2986) i!1108 k!1786) (size!18072 a!2986)))))

(declare-fun b!591337 () Bool)

(assert (=> b!591337 (= e!337629 true)))

(declare-fun e!337628 () Bool)

(assert (=> b!591337 e!337628))

(declare-fun res!378290 () Bool)

(assert (=> b!591337 (=> (not res!378290) (not e!337628))))

(declare-fun lt!268306 () (_ BitVec 64))

(assert (=> b!591337 (= res!378290 (= lt!268306 (select (arr!17708 a!2986) j!136)))))

(assert (=> b!591337 (= lt!268306 (select (store (arr!17708 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!591338 () Bool)

(assert (=> b!591338 (= e!337628 e!337631)))

(declare-fun res!378286 () Bool)

(assert (=> b!591338 (=> res!378286 e!337631)))

(assert (=> b!591338 (= res!378286 (or (not (= (select (arr!17708 a!2986) j!136) lt!268309)) (not (= (select (arr!17708 a!2986) j!136) lt!268306)) (bvsge j!136 index!984)))))

(declare-fun b!591339 () Bool)

(declare-fun res!378285 () Bool)

(assert (=> b!591339 (=> (not res!378285) (not e!337630))))

(assert (=> b!591339 (= res!378285 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17708 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!591340 () Bool)

(assert (=> b!591340 (= e!337633 e!337636)))

(declare-fun res!378279 () Bool)

(assert (=> b!591340 (=> (not res!378279) (not e!337636))))

(declare-fun lt!268311 () SeekEntryResult!6148)

(assert (=> b!591340 (= res!378279 (and (= lt!268311 (Found!6148 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17708 a!2986) index!984) (select (arr!17708 a!2986) j!136))) (not (= (select (arr!17708 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!591340 (= lt!268311 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17708 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!591341 () Bool)

(assert (=> b!591341 (= e!337638 (= lt!268311 lt!268303))))

(assert (= (and start!54146 res!378284) b!591334))

(assert (= (and b!591334 res!378281) b!591331))

(assert (= (and b!591331 res!378287) b!591328))

(assert (= (and b!591328 res!378292) b!591326))

(assert (= (and b!591326 res!378293) b!591324))

(assert (= (and b!591324 res!378278) b!591335))

(assert (= (and b!591335 res!378280) b!591330))

(assert (= (and b!591330 res!378291) b!591339))

(assert (= (and b!591339 res!378285) b!591336))

(assert (= (and b!591336 res!378289) b!591340))

(assert (= (and b!591340 res!378279) b!591329))

(assert (= (and b!591329 res!378282) b!591341))

(assert (= (and b!591329 c!66890) b!591332))

(assert (= (and b!591329 (not c!66890)) b!591327))

(assert (= (and b!591329 (not res!378288)) b!591337))

(assert (= (and b!591337 res!378290) b!591338))

(assert (= (and b!591338 (not res!378286)) b!591333))

(assert (= (and b!591333 res!378283) b!591325))

(declare-fun m!569589 () Bool)

(assert (=> b!591340 m!569589))

(declare-fun m!569591 () Bool)

(assert (=> b!591340 m!569591))

(assert (=> b!591340 m!569591))

(declare-fun m!569593 () Bool)

(assert (=> b!591340 m!569593))

(assert (=> b!591338 m!569591))

(declare-fun m!569595 () Bool)

(assert (=> b!591330 m!569595))

(declare-fun m!569597 () Bool)

(assert (=> b!591335 m!569597))

(assert (=> b!591333 m!569591))

(assert (=> b!591333 m!569591))

(declare-fun m!569599 () Bool)

(assert (=> b!591333 m!569599))

(assert (=> b!591331 m!569591))

(assert (=> b!591331 m!569591))

(declare-fun m!569601 () Bool)

(assert (=> b!591331 m!569601))

(declare-fun m!569603 () Bool)

(assert (=> b!591336 m!569603))

(declare-fun m!569605 () Bool)

(assert (=> b!591336 m!569605))

(assert (=> b!591337 m!569591))

(assert (=> b!591337 m!569603))

(declare-fun m!569607 () Bool)

(assert (=> b!591337 m!569607))

(declare-fun m!569609 () Bool)

(assert (=> b!591339 m!569609))

(declare-fun m!569611 () Bool)

(assert (=> b!591329 m!569611))

(declare-fun m!569613 () Bool)

(assert (=> b!591329 m!569613))

(assert (=> b!591329 m!569591))

(assert (=> b!591329 m!569603))

(assert (=> b!591329 m!569591))

(declare-fun m!569615 () Bool)

(assert (=> b!591329 m!569615))

(declare-fun m!569617 () Bool)

(assert (=> b!591329 m!569617))

(declare-fun m!569619 () Bool)

(assert (=> b!591329 m!569619))

(declare-fun m!569621 () Bool)

(assert (=> b!591329 m!569621))

(declare-fun m!569623 () Bool)

(assert (=> b!591324 m!569623))

(declare-fun m!569625 () Bool)

(assert (=> start!54146 m!569625))

(declare-fun m!569627 () Bool)

(assert (=> start!54146 m!569627))

(declare-fun m!569629 () Bool)

(assert (=> b!591326 m!569629))

(assert (=> b!591325 m!569591))

(assert (=> b!591325 m!569591))

(declare-fun m!569631 () Bool)

(assert (=> b!591325 m!569631))

(declare-fun m!569633 () Bool)

(assert (=> b!591328 m!569633))

(push 1)


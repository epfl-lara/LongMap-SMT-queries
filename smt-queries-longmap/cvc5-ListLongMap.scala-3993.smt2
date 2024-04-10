; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54148 () Bool)

(assert start!54148)

(declare-fun b!591378 () Bool)

(declare-fun res!378336 () Bool)

(declare-fun e!337665 () Bool)

(assert (=> b!591378 (=> (not res!378336) (not e!337665))))

(declare-datatypes ((array!36878 0))(
  ( (array!36879 (arr!17709 (Array (_ BitVec 32) (_ BitVec 64))) (size!18073 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36878)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36878 (_ BitVec 32)) Bool)

(assert (=> b!591378 (= res!378336 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!591379 () Bool)

(declare-fun e!337670 () Bool)

(declare-fun e!337663 () Bool)

(assert (=> b!591379 (= e!337670 e!337663)))

(declare-fun res!378335 () Bool)

(assert (=> b!591379 (=> (not res!378335) (not e!337663))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!268342 () array!36878)

(declare-fun arrayContainsKey!0 (array!36878 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!591379 (= res!378335 (arrayContainsKey!0 lt!268342 (select (arr!17709 a!2986) j!136) j!136))))

(declare-fun b!591380 () Bool)

(declare-fun res!378329 () Bool)

(declare-fun e!337666 () Bool)

(assert (=> b!591380 (=> (not res!378329) (not e!337666))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!591380 (= res!378329 (validKeyInArray!0 (select (arr!17709 a!2986) j!136)))))

(declare-fun b!591381 () Bool)

(declare-fun e!337667 () Bool)

(declare-fun e!337669 () Bool)

(assert (=> b!591381 (= e!337667 (not e!337669))))

(declare-fun res!378326 () Bool)

(assert (=> b!591381 (=> res!378326 e!337669)))

(declare-datatypes ((SeekEntryResult!6149 0))(
  ( (MissingZero!6149 (index!26832 (_ BitVec 32))) (Found!6149 (index!26833 (_ BitVec 32))) (Intermediate!6149 (undefined!6961 Bool) (index!26834 (_ BitVec 32)) (x!55629 (_ BitVec 32))) (Undefined!6149) (MissingVacant!6149 (index!26835 (_ BitVec 32))) )
))
(declare-fun lt!268340 () SeekEntryResult!6149)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!591381 (= res!378326 (not (= lt!268340 (Found!6149 index!984))))))

(declare-datatypes ((Unit!18514 0))(
  ( (Unit!18515) )
))
(declare-fun lt!268337 () Unit!18514)

(declare-fun e!337661 () Unit!18514)

(assert (=> b!591381 (= lt!268337 e!337661)))

(declare-fun c!66893 () Bool)

(assert (=> b!591381 (= c!66893 (= lt!268340 Undefined!6149))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!268333 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36878 (_ BitVec 32)) SeekEntryResult!6149)

(assert (=> b!591381 (= lt!268340 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268333 lt!268342 mask!3053))))

(declare-fun e!337662 () Bool)

(assert (=> b!591381 e!337662))

(declare-fun res!378339 () Bool)

(assert (=> b!591381 (=> (not res!378339) (not e!337662))))

(declare-fun lt!268338 () (_ BitVec 32))

(declare-fun lt!268334 () SeekEntryResult!6149)

(assert (=> b!591381 (= res!378339 (= lt!268334 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268338 vacantSpotIndex!68 lt!268333 lt!268342 mask!3053)))))

(assert (=> b!591381 (= lt!268334 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268338 vacantSpotIndex!68 (select (arr!17709 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!591381 (= lt!268333 (select (store (arr!17709 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!268341 () Unit!18514)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36878 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18514)

(assert (=> b!591381 (= lt!268341 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268338 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!591381 (= lt!268338 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!591382 () Bool)

(assert (=> b!591382 (= e!337666 e!337665)))

(declare-fun res!378332 () Bool)

(assert (=> b!591382 (=> (not res!378332) (not e!337665))))

(declare-fun lt!268336 () SeekEntryResult!6149)

(assert (=> b!591382 (= res!378332 (or (= lt!268336 (MissingZero!6149 i!1108)) (= lt!268336 (MissingVacant!6149 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36878 (_ BitVec 32)) SeekEntryResult!6149)

(assert (=> b!591382 (= lt!268336 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!591384 () Bool)

(declare-fun Unit!18516 () Unit!18514)

(assert (=> b!591384 (= e!337661 Unit!18516)))

(declare-fun b!591385 () Bool)

(declare-fun res!378328 () Bool)

(assert (=> b!591385 (=> (not res!378328) (not e!337666))))

(assert (=> b!591385 (= res!378328 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!591386 () Bool)

(declare-fun e!337671 () Bool)

(assert (=> b!591386 (= e!337671 e!337670)))

(declare-fun res!378333 () Bool)

(assert (=> b!591386 (=> res!378333 e!337670)))

(declare-fun lt!268339 () (_ BitVec 64))

(assert (=> b!591386 (= res!378333 (or (not (= (select (arr!17709 a!2986) j!136) lt!268333)) (not (= (select (arr!17709 a!2986) j!136) lt!268339)) (bvsge j!136 index!984)))))

(declare-fun b!591387 () Bool)

(declare-fun e!337668 () Bool)

(assert (=> b!591387 (= e!337668 e!337667)))

(declare-fun res!378341 () Bool)

(assert (=> b!591387 (=> (not res!378341) (not e!337667))))

(declare-fun lt!268335 () SeekEntryResult!6149)

(assert (=> b!591387 (= res!378341 (and (= lt!268335 (Found!6149 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17709 a!2986) index!984) (select (arr!17709 a!2986) j!136))) (not (= (select (arr!17709 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!591387 (= lt!268335 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17709 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!591388 () Bool)

(declare-fun res!378340 () Bool)

(assert (=> b!591388 (=> (not res!378340) (not e!337665))))

(assert (=> b!591388 (= res!378340 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17709 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!591389 () Bool)

(assert (=> b!591389 (= e!337669 true)))

(assert (=> b!591389 e!337671))

(declare-fun res!378331 () Bool)

(assert (=> b!591389 (=> (not res!378331) (not e!337671))))

(assert (=> b!591389 (= res!378331 (= lt!268339 (select (arr!17709 a!2986) j!136)))))

(assert (=> b!591389 (= lt!268339 (select (store (arr!17709 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!591390 () Bool)

(assert (=> b!591390 (= e!337665 e!337668)))

(declare-fun res!378338 () Bool)

(assert (=> b!591390 (=> (not res!378338) (not e!337668))))

(assert (=> b!591390 (= res!378338 (= (select (store (arr!17709 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!591390 (= lt!268342 (array!36879 (store (arr!17709 a!2986) i!1108 k!1786) (size!18073 a!2986)))))

(declare-fun b!591391 () Bool)

(declare-fun Unit!18517 () Unit!18514)

(assert (=> b!591391 (= e!337661 Unit!18517)))

(assert (=> b!591391 false))

(declare-fun b!591392 () Bool)

(assert (=> b!591392 (= e!337663 (arrayContainsKey!0 lt!268342 (select (arr!17709 a!2986) j!136) index!984))))

(declare-fun b!591393 () Bool)

(declare-fun res!378327 () Bool)

(assert (=> b!591393 (=> (not res!378327) (not e!337665))))

(declare-datatypes ((List!11750 0))(
  ( (Nil!11747) (Cons!11746 (h!12791 (_ BitVec 64)) (t!17978 List!11750)) )
))
(declare-fun arrayNoDuplicates!0 (array!36878 (_ BitVec 32) List!11750) Bool)

(assert (=> b!591393 (= res!378327 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11747))))

(declare-fun b!591383 () Bool)

(declare-fun res!378334 () Bool)

(assert (=> b!591383 (=> (not res!378334) (not e!337666))))

(assert (=> b!591383 (= res!378334 (and (= (size!18073 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18073 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18073 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!378337 () Bool)

(assert (=> start!54148 (=> (not res!378337) (not e!337666))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54148 (= res!378337 (validMask!0 mask!3053))))

(assert (=> start!54148 e!337666))

(assert (=> start!54148 true))

(declare-fun array_inv!13505 (array!36878) Bool)

(assert (=> start!54148 (array_inv!13505 a!2986)))

(declare-fun b!591394 () Bool)

(declare-fun res!378330 () Bool)

(assert (=> b!591394 (=> (not res!378330) (not e!337666))))

(assert (=> b!591394 (= res!378330 (validKeyInArray!0 k!1786))))

(declare-fun b!591395 () Bool)

(assert (=> b!591395 (= e!337662 (= lt!268335 lt!268334))))

(assert (= (and start!54148 res!378337) b!591383))

(assert (= (and b!591383 res!378334) b!591380))

(assert (= (and b!591380 res!378329) b!591394))

(assert (= (and b!591394 res!378330) b!591385))

(assert (= (and b!591385 res!378328) b!591382))

(assert (= (and b!591382 res!378332) b!591378))

(assert (= (and b!591378 res!378336) b!591393))

(assert (= (and b!591393 res!378327) b!591388))

(assert (= (and b!591388 res!378340) b!591390))

(assert (= (and b!591390 res!378338) b!591387))

(assert (= (and b!591387 res!378341) b!591381))

(assert (= (and b!591381 res!378339) b!591395))

(assert (= (and b!591381 c!66893) b!591391))

(assert (= (and b!591381 (not c!66893)) b!591384))

(assert (= (and b!591381 (not res!378326)) b!591389))

(assert (= (and b!591389 res!378331) b!591386))

(assert (= (and b!591386 (not res!378333)) b!591379))

(assert (= (and b!591379 res!378335) b!591392))

(declare-fun m!569635 () Bool)

(assert (=> b!591385 m!569635))

(declare-fun m!569637 () Bool)

(assert (=> b!591380 m!569637))

(assert (=> b!591380 m!569637))

(declare-fun m!569639 () Bool)

(assert (=> b!591380 m!569639))

(declare-fun m!569641 () Bool)

(assert (=> b!591393 m!569641))

(declare-fun m!569643 () Bool)

(assert (=> b!591388 m!569643))

(assert (=> b!591389 m!569637))

(declare-fun m!569645 () Bool)

(assert (=> b!591389 m!569645))

(declare-fun m!569647 () Bool)

(assert (=> b!591389 m!569647))

(declare-fun m!569649 () Bool)

(assert (=> b!591381 m!569649))

(declare-fun m!569651 () Bool)

(assert (=> b!591381 m!569651))

(assert (=> b!591381 m!569637))

(assert (=> b!591381 m!569645))

(assert (=> b!591381 m!569637))

(declare-fun m!569653 () Bool)

(assert (=> b!591381 m!569653))

(declare-fun m!569655 () Bool)

(assert (=> b!591381 m!569655))

(declare-fun m!569657 () Bool)

(assert (=> b!591381 m!569657))

(declare-fun m!569659 () Bool)

(assert (=> b!591381 m!569659))

(assert (=> b!591392 m!569637))

(assert (=> b!591392 m!569637))

(declare-fun m!569661 () Bool)

(assert (=> b!591392 m!569661))

(declare-fun m!569663 () Bool)

(assert (=> b!591378 m!569663))

(assert (=> b!591390 m!569645))

(declare-fun m!569665 () Bool)

(assert (=> b!591390 m!569665))

(assert (=> b!591379 m!569637))

(assert (=> b!591379 m!569637))

(declare-fun m!569667 () Bool)

(assert (=> b!591379 m!569667))

(declare-fun m!569669 () Bool)

(assert (=> b!591394 m!569669))

(declare-fun m!569671 () Bool)

(assert (=> start!54148 m!569671))

(declare-fun m!569673 () Bool)

(assert (=> start!54148 m!569673))

(declare-fun m!569675 () Bool)

(assert (=> b!591382 m!569675))

(declare-fun m!569677 () Bool)

(assert (=> b!591387 m!569677))

(assert (=> b!591387 m!569637))

(assert (=> b!591387 m!569637))

(declare-fun m!569679 () Bool)

(assert (=> b!591387 m!569679))

(assert (=> b!591386 m!569637))

(push 1)


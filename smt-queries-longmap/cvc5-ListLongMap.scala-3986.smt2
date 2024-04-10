; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53986 () Bool)

(assert start!53986)

(declare-fun b!589773 () Bool)

(declare-fun e!336700 () Bool)

(declare-fun e!336701 () Bool)

(assert (=> b!589773 (= e!336700 e!336701)))

(declare-fun res!377246 () Bool)

(assert (=> b!589773 (=> (not res!377246) (not e!336701))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6128 0))(
  ( (MissingZero!6128 (index!26742 (_ BitVec 32))) (Found!6128 (index!26743 (_ BitVec 32))) (Intermediate!6128 (undefined!6940 Bool) (index!26744 (_ BitVec 32)) (x!55534 (_ BitVec 32))) (Undefined!6128) (MissingVacant!6128 (index!26745 (_ BitVec 32))) )
))
(declare-fun lt!267534 () SeekEntryResult!6128)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36830 0))(
  ( (array!36831 (arr!17688 (Array (_ BitVec 32) (_ BitVec 64))) (size!18052 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36830)

(assert (=> b!589773 (= res!377246 (and (= lt!267534 (Found!6128 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17688 a!2986) index!984) (select (arr!17688 a!2986) j!136))) (not (= (select (arr!17688 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36830 (_ BitVec 32)) SeekEntryResult!6128)

(assert (=> b!589773 (= lt!267534 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17688 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!589774 () Bool)

(declare-fun res!377254 () Bool)

(declare-fun e!336697 () Bool)

(assert (=> b!589774 (=> (not res!377254) (not e!336697))))

(assert (=> b!589774 (= res!377254 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17688 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!589775 () Bool)

(declare-fun res!377249 () Bool)

(assert (=> b!589775 (=> (not res!377249) (not e!336697))))

(declare-datatypes ((List!11729 0))(
  ( (Nil!11726) (Cons!11725 (h!12770 (_ BitVec 64)) (t!17957 List!11729)) )
))
(declare-fun arrayNoDuplicates!0 (array!36830 (_ BitVec 32) List!11729) Bool)

(assert (=> b!589775 (= res!377249 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11726))))

(declare-fun b!589776 () Bool)

(declare-fun e!336696 () Bool)

(assert (=> b!589776 (= e!336696 e!336697)))

(declare-fun res!377244 () Bool)

(assert (=> b!589776 (=> (not res!377244) (not e!336697))))

(declare-fun lt!267538 () SeekEntryResult!6128)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!589776 (= res!377244 (or (= lt!267538 (MissingZero!6128 i!1108)) (= lt!267538 (MissingVacant!6128 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36830 (_ BitVec 32)) SeekEntryResult!6128)

(assert (=> b!589776 (= lt!267538 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!589777 () Bool)

(declare-fun res!377253 () Bool)

(assert (=> b!589777 (=> (not res!377253) (not e!336696))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!589777 (= res!377253 (validKeyInArray!0 (select (arr!17688 a!2986) j!136)))))

(declare-fun b!589778 () Bool)

(declare-fun e!336698 () Bool)

(declare-fun lt!267536 () SeekEntryResult!6128)

(assert (=> b!589778 (= e!336698 (= lt!267534 lt!267536))))

(declare-fun b!589779 () Bool)

(declare-fun res!377251 () Bool)

(assert (=> b!589779 (=> (not res!377251) (not e!336696))))

(assert (=> b!589779 (= res!377251 (and (= (size!18052 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18052 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18052 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!589780 () Bool)

(declare-fun e!336699 () Bool)

(assert (=> b!589780 (= e!336699 true)))

(assert (=> b!589780 (= (select (store (arr!17688 a!2986) i!1108 k!1786) index!984) (select (arr!17688 a!2986) j!136))))

(declare-fun b!589781 () Bool)

(assert (=> b!589781 (= e!336697 e!336700)))

(declare-fun res!377255 () Bool)

(assert (=> b!589781 (=> (not res!377255) (not e!336700))))

(assert (=> b!589781 (= res!377255 (= (select (store (arr!17688 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!267537 () array!36830)

(assert (=> b!589781 (= lt!267537 (array!36831 (store (arr!17688 a!2986) i!1108 k!1786) (size!18052 a!2986)))))

(declare-fun b!589782 () Bool)

(declare-fun res!377248 () Bool)

(assert (=> b!589782 (=> (not res!377248) (not e!336696))))

(assert (=> b!589782 (= res!377248 (validKeyInArray!0 k!1786))))

(declare-fun res!377243 () Bool)

(assert (=> start!53986 (=> (not res!377243) (not e!336696))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53986 (= res!377243 (validMask!0 mask!3053))))

(assert (=> start!53986 e!336696))

(assert (=> start!53986 true))

(declare-fun array_inv!13484 (array!36830) Bool)

(assert (=> start!53986 (array_inv!13484 a!2986)))

(declare-fun b!589783 () Bool)

(declare-datatypes ((Unit!18430 0))(
  ( (Unit!18431) )
))
(declare-fun e!336702 () Unit!18430)

(declare-fun Unit!18432 () Unit!18430)

(assert (=> b!589783 (= e!336702 Unit!18432)))

(declare-fun b!589784 () Bool)

(assert (=> b!589784 (= e!336701 (not e!336699))))

(declare-fun res!377245 () Bool)

(assert (=> b!589784 (=> res!377245 e!336699)))

(declare-fun lt!267533 () SeekEntryResult!6128)

(assert (=> b!589784 (= res!377245 (not (= lt!267533 (Found!6128 index!984))))))

(declare-fun lt!267532 () Unit!18430)

(assert (=> b!589784 (= lt!267532 e!336702)))

(declare-fun c!66632 () Bool)

(assert (=> b!589784 (= c!66632 (= lt!267533 Undefined!6128))))

(declare-fun lt!267535 () (_ BitVec 64))

(assert (=> b!589784 (= lt!267533 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267535 lt!267537 mask!3053))))

(assert (=> b!589784 e!336698))

(declare-fun res!377247 () Bool)

(assert (=> b!589784 (=> (not res!377247) (not e!336698))))

(declare-fun lt!267530 () (_ BitVec 32))

(assert (=> b!589784 (= res!377247 (= lt!267536 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267530 vacantSpotIndex!68 lt!267535 lt!267537 mask!3053)))))

(assert (=> b!589784 (= lt!267536 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267530 vacantSpotIndex!68 (select (arr!17688 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!589784 (= lt!267535 (select (store (arr!17688 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!267531 () Unit!18430)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36830 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18430)

(assert (=> b!589784 (= lt!267531 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267530 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!589784 (= lt!267530 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!589785 () Bool)

(declare-fun res!377250 () Bool)

(assert (=> b!589785 (=> (not res!377250) (not e!336697))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36830 (_ BitVec 32)) Bool)

(assert (=> b!589785 (= res!377250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!589786 () Bool)

(declare-fun Unit!18433 () Unit!18430)

(assert (=> b!589786 (= e!336702 Unit!18433)))

(assert (=> b!589786 false))

(declare-fun b!589787 () Bool)

(declare-fun res!377252 () Bool)

(assert (=> b!589787 (=> (not res!377252) (not e!336696))))

(declare-fun arrayContainsKey!0 (array!36830 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!589787 (= res!377252 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53986 res!377243) b!589779))

(assert (= (and b!589779 res!377251) b!589777))

(assert (= (and b!589777 res!377253) b!589782))

(assert (= (and b!589782 res!377248) b!589787))

(assert (= (and b!589787 res!377252) b!589776))

(assert (= (and b!589776 res!377244) b!589785))

(assert (= (and b!589785 res!377250) b!589775))

(assert (= (and b!589775 res!377249) b!589774))

(assert (= (and b!589774 res!377254) b!589781))

(assert (= (and b!589781 res!377255) b!589773))

(assert (= (and b!589773 res!377246) b!589784))

(assert (= (and b!589784 res!377247) b!589778))

(assert (= (and b!589784 c!66632) b!589786))

(assert (= (and b!589784 (not c!66632)) b!589783))

(assert (= (and b!589784 (not res!377245)) b!589780))

(declare-fun m!568279 () Bool)

(assert (=> b!589775 m!568279))

(declare-fun m!568281 () Bool)

(assert (=> b!589777 m!568281))

(assert (=> b!589777 m!568281))

(declare-fun m!568283 () Bool)

(assert (=> b!589777 m!568283))

(declare-fun m!568285 () Bool)

(assert (=> b!589776 m!568285))

(declare-fun m!568287 () Bool)

(assert (=> b!589780 m!568287))

(declare-fun m!568289 () Bool)

(assert (=> b!589780 m!568289))

(assert (=> b!589780 m!568281))

(declare-fun m!568291 () Bool)

(assert (=> b!589782 m!568291))

(declare-fun m!568293 () Bool)

(assert (=> b!589773 m!568293))

(assert (=> b!589773 m!568281))

(assert (=> b!589773 m!568281))

(declare-fun m!568295 () Bool)

(assert (=> b!589773 m!568295))

(declare-fun m!568297 () Bool)

(assert (=> start!53986 m!568297))

(declare-fun m!568299 () Bool)

(assert (=> start!53986 m!568299))

(declare-fun m!568301 () Bool)

(assert (=> b!589785 m!568301))

(declare-fun m!568303 () Bool)

(assert (=> b!589774 m!568303))

(assert (=> b!589781 m!568287))

(declare-fun m!568305 () Bool)

(assert (=> b!589781 m!568305))

(declare-fun m!568307 () Bool)

(assert (=> b!589787 m!568307))

(declare-fun m!568309 () Bool)

(assert (=> b!589784 m!568309))

(declare-fun m!568311 () Bool)

(assert (=> b!589784 m!568311))

(declare-fun m!568313 () Bool)

(assert (=> b!589784 m!568313))

(assert (=> b!589784 m!568281))

(declare-fun m!568315 () Bool)

(assert (=> b!589784 m!568315))

(assert (=> b!589784 m!568287))

(declare-fun m!568317 () Bool)

(assert (=> b!589784 m!568317))

(assert (=> b!589784 m!568281))

(declare-fun m!568319 () Bool)

(assert (=> b!589784 m!568319))

(push 1)


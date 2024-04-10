; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54136 () Bool)

(assert start!54136)

(declare-fun b!591054 () Bool)

(declare-fun res!378044 () Bool)

(declare-fun e!337467 () Bool)

(assert (=> b!591054 (=> (not res!378044) (not e!337467))))

(declare-datatypes ((array!36866 0))(
  ( (array!36867 (arr!17703 (Array (_ BitVec 32) (_ BitVec 64))) (size!18067 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36866)

(declare-datatypes ((List!11744 0))(
  ( (Nil!11741) (Cons!11740 (h!12785 (_ BitVec 64)) (t!17972 List!11744)) )
))
(declare-fun arrayNoDuplicates!0 (array!36866 (_ BitVec 32) List!11744) Bool)

(assert (=> b!591054 (= res!378044 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11741))))

(declare-fun b!591055 () Bool)

(declare-fun e!337470 () Bool)

(declare-fun e!337469 () Bool)

(assert (=> b!591055 (= e!337470 e!337469)))

(declare-fun res!378042 () Bool)

(assert (=> b!591055 (=> res!378042 e!337469)))

(declare-fun lt!268159 () (_ BitVec 64))

(declare-fun lt!268157 () (_ BitVec 64))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!591055 (= res!378042 (or (not (= (select (arr!17703 a!2986) j!136) lt!268157)) (not (= (select (arr!17703 a!2986) j!136) lt!268159)) (bvsge j!136 index!984)))))

(declare-fun res!378050 () Bool)

(declare-fun e!337463 () Bool)

(assert (=> start!54136 (=> (not res!378050) (not e!337463))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54136 (= res!378050 (validMask!0 mask!3053))))

(assert (=> start!54136 e!337463))

(assert (=> start!54136 true))

(declare-fun array_inv!13499 (array!36866) Bool)

(assert (=> start!54136 (array_inv!13499 a!2986)))

(declare-fun b!591056 () Bool)

(declare-datatypes ((Unit!18490 0))(
  ( (Unit!18491) )
))
(declare-fun e!337471 () Unit!18490)

(declare-fun Unit!18492 () Unit!18490)

(assert (=> b!591056 (= e!337471 Unit!18492)))

(assert (=> b!591056 false))

(declare-fun b!591057 () Bool)

(declare-fun e!337465 () Bool)

(declare-fun e!337468 () Bool)

(assert (=> b!591057 (= e!337465 e!337468)))

(declare-fun res!378039 () Bool)

(assert (=> b!591057 (=> (not res!378039) (not e!337468))))

(declare-datatypes ((SeekEntryResult!6143 0))(
  ( (MissingZero!6143 (index!26808 (_ BitVec 32))) (Found!6143 (index!26809 (_ BitVec 32))) (Intermediate!6143 (undefined!6955 Bool) (index!26810 (_ BitVec 32)) (x!55607 (_ BitVec 32))) (Undefined!6143) (MissingVacant!6143 (index!26811 (_ BitVec 32))) )
))
(declare-fun lt!268155 () SeekEntryResult!6143)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!591057 (= res!378039 (and (= lt!268155 (Found!6143 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17703 a!2986) index!984) (select (arr!17703 a!2986) j!136))) (not (= (select (arr!17703 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36866 (_ BitVec 32)) SeekEntryResult!6143)

(assert (=> b!591057 (= lt!268155 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17703 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!591058 () Bool)

(assert (=> b!591058 (= e!337463 e!337467)))

(declare-fun res!378041 () Bool)

(assert (=> b!591058 (=> (not res!378041) (not e!337467))))

(declare-fun lt!268153 () SeekEntryResult!6143)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!591058 (= res!378041 (or (= lt!268153 (MissingZero!6143 i!1108)) (= lt!268153 (MissingVacant!6143 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36866 (_ BitVec 32)) SeekEntryResult!6143)

(assert (=> b!591058 (= lt!268153 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!591059 () Bool)

(declare-fun e!337466 () Bool)

(declare-fun lt!268161 () array!36866)

(declare-fun arrayContainsKey!0 (array!36866 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!591059 (= e!337466 (arrayContainsKey!0 lt!268161 (select (arr!17703 a!2986) j!136) index!984))))

(declare-fun b!591060 () Bool)

(declare-fun res!378045 () Bool)

(assert (=> b!591060 (=> (not res!378045) (not e!337463))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!591060 (= res!378045 (validKeyInArray!0 (select (arr!17703 a!2986) j!136)))))

(declare-fun b!591061 () Bool)

(assert (=> b!591061 (= e!337469 e!337466)))

(declare-fun res!378046 () Bool)

(assert (=> b!591061 (=> (not res!378046) (not e!337466))))

(assert (=> b!591061 (= res!378046 (arrayContainsKey!0 lt!268161 (select (arr!17703 a!2986) j!136) j!136))))

(declare-fun b!591062 () Bool)

(declare-fun res!378040 () Bool)

(assert (=> b!591062 (=> (not res!378040) (not e!337463))))

(assert (=> b!591062 (= res!378040 (validKeyInArray!0 k!1786))))

(declare-fun b!591063 () Bool)

(declare-fun res!378043 () Bool)

(assert (=> b!591063 (=> (not res!378043) (not e!337463))))

(assert (=> b!591063 (= res!378043 (and (= (size!18067 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18067 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18067 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!591064 () Bool)

(declare-fun res!378048 () Bool)

(assert (=> b!591064 (=> (not res!378048) (not e!337467))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36866 (_ BitVec 32)) Bool)

(assert (=> b!591064 (= res!378048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!591065 () Bool)

(declare-fun Unit!18493 () Unit!18490)

(assert (=> b!591065 (= e!337471 Unit!18493)))

(declare-fun b!591066 () Bool)

(declare-fun res!378053 () Bool)

(assert (=> b!591066 (=> (not res!378053) (not e!337463))))

(assert (=> b!591066 (= res!378053 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!591067 () Bool)

(declare-fun res!378049 () Bool)

(assert (=> b!591067 (=> (not res!378049) (not e!337467))))

(assert (=> b!591067 (= res!378049 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17703 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!591068 () Bool)

(assert (=> b!591068 (= e!337467 e!337465)))

(declare-fun res!378038 () Bool)

(assert (=> b!591068 (=> (not res!378038) (not e!337465))))

(assert (=> b!591068 (= res!378038 (= (select (store (arr!17703 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!591068 (= lt!268161 (array!36867 (store (arr!17703 a!2986) i!1108 k!1786) (size!18067 a!2986)))))

(declare-fun b!591069 () Bool)

(declare-fun e!337472 () Bool)

(declare-fun lt!268156 () SeekEntryResult!6143)

(assert (=> b!591069 (= e!337472 (= lt!268155 lt!268156))))

(declare-fun b!591070 () Bool)

(declare-fun e!337464 () Bool)

(assert (=> b!591070 (= e!337468 (not e!337464))))

(declare-fun res!378051 () Bool)

(assert (=> b!591070 (=> res!378051 e!337464)))

(declare-fun lt!268158 () SeekEntryResult!6143)

(assert (=> b!591070 (= res!378051 (not (= lt!268158 (Found!6143 index!984))))))

(declare-fun lt!268154 () Unit!18490)

(assert (=> b!591070 (= lt!268154 e!337471)))

(declare-fun c!66875 () Bool)

(assert (=> b!591070 (= c!66875 (= lt!268158 Undefined!6143))))

(assert (=> b!591070 (= lt!268158 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268157 lt!268161 mask!3053))))

(assert (=> b!591070 e!337472))

(declare-fun res!378047 () Bool)

(assert (=> b!591070 (=> (not res!378047) (not e!337472))))

(declare-fun lt!268160 () (_ BitVec 32))

(assert (=> b!591070 (= res!378047 (= lt!268156 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268160 vacantSpotIndex!68 lt!268157 lt!268161 mask!3053)))))

(assert (=> b!591070 (= lt!268156 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268160 vacantSpotIndex!68 (select (arr!17703 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!591070 (= lt!268157 (select (store (arr!17703 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!268162 () Unit!18490)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36866 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18490)

(assert (=> b!591070 (= lt!268162 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268160 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!591070 (= lt!268160 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!591071 () Bool)

(assert (=> b!591071 (= e!337464 true)))

(assert (=> b!591071 e!337470))

(declare-fun res!378052 () Bool)

(assert (=> b!591071 (=> (not res!378052) (not e!337470))))

(assert (=> b!591071 (= res!378052 (= lt!268159 (select (arr!17703 a!2986) j!136)))))

(assert (=> b!591071 (= lt!268159 (select (store (arr!17703 a!2986) i!1108 k!1786) index!984))))

(assert (= (and start!54136 res!378050) b!591063))

(assert (= (and b!591063 res!378043) b!591060))

(assert (= (and b!591060 res!378045) b!591062))

(assert (= (and b!591062 res!378040) b!591066))

(assert (= (and b!591066 res!378053) b!591058))

(assert (= (and b!591058 res!378041) b!591064))

(assert (= (and b!591064 res!378048) b!591054))

(assert (= (and b!591054 res!378044) b!591067))

(assert (= (and b!591067 res!378049) b!591068))

(assert (= (and b!591068 res!378038) b!591057))

(assert (= (and b!591057 res!378039) b!591070))

(assert (= (and b!591070 res!378047) b!591069))

(assert (= (and b!591070 c!66875) b!591056))

(assert (= (and b!591070 (not c!66875)) b!591065))

(assert (= (and b!591070 (not res!378051)) b!591071))

(assert (= (and b!591071 res!378052) b!591055))

(assert (= (and b!591055 (not res!378042)) b!591061))

(assert (= (and b!591061 res!378046) b!591059))

(declare-fun m!569359 () Bool)

(assert (=> b!591055 m!569359))

(declare-fun m!569361 () Bool)

(assert (=> b!591058 m!569361))

(declare-fun m!569363 () Bool)

(assert (=> start!54136 m!569363))

(declare-fun m!569365 () Bool)

(assert (=> start!54136 m!569365))

(declare-fun m!569367 () Bool)

(assert (=> b!591064 m!569367))

(declare-fun m!569369 () Bool)

(assert (=> b!591066 m!569369))

(assert (=> b!591071 m!569359))

(declare-fun m!569371 () Bool)

(assert (=> b!591071 m!569371))

(declare-fun m!569373 () Bool)

(assert (=> b!591071 m!569373))

(declare-fun m!569375 () Bool)

(assert (=> b!591062 m!569375))

(assert (=> b!591068 m!569371))

(declare-fun m!569377 () Bool)

(assert (=> b!591068 m!569377))

(declare-fun m!569379 () Bool)

(assert (=> b!591054 m!569379))

(assert (=> b!591061 m!569359))

(assert (=> b!591061 m!569359))

(declare-fun m!569381 () Bool)

(assert (=> b!591061 m!569381))

(declare-fun m!569383 () Bool)

(assert (=> b!591070 m!569383))

(declare-fun m!569385 () Bool)

(assert (=> b!591070 m!569385))

(assert (=> b!591070 m!569359))

(assert (=> b!591070 m!569371))

(declare-fun m!569387 () Bool)

(assert (=> b!591070 m!569387))

(declare-fun m!569389 () Bool)

(assert (=> b!591070 m!569389))

(declare-fun m!569391 () Bool)

(assert (=> b!591070 m!569391))

(assert (=> b!591070 m!569359))

(declare-fun m!569393 () Bool)

(assert (=> b!591070 m!569393))

(assert (=> b!591059 m!569359))

(assert (=> b!591059 m!569359))

(declare-fun m!569395 () Bool)

(assert (=> b!591059 m!569395))

(assert (=> b!591060 m!569359))

(assert (=> b!591060 m!569359))

(declare-fun m!569397 () Bool)

(assert (=> b!591060 m!569397))

(declare-fun m!569399 () Bool)

(assert (=> b!591067 m!569399))

(declare-fun m!569401 () Bool)

(assert (=> b!591057 m!569401))

(assert (=> b!591057 m!569359))

(assert (=> b!591057 m!569359))

(declare-fun m!569403 () Bool)

(assert (=> b!591057 m!569403))

(push 1)


; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54216 () Bool)

(assert start!54216)

(declare-fun res!378871 () Bool)

(declare-fun e!338092 () Bool)

(assert (=> start!54216 (=> (not res!378871) (not e!338092))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54216 (= res!378871 (validMask!0 mask!3053))))

(assert (=> start!54216 e!338092))

(assert (=> start!54216 true))

(declare-datatypes ((array!36891 0))(
  ( (array!36892 (arr!17713 (Array (_ BitVec 32) (_ BitVec 64))) (size!18077 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36891)

(declare-fun array_inv!13572 (array!36891) Bool)

(assert (=> start!54216 (array_inv!13572 a!2986)))

(declare-fun b!592073 () Bool)

(declare-fun e!338088 () Bool)

(declare-fun e!338089 () Bool)

(assert (=> b!592073 (= e!338088 e!338089)))

(declare-fun res!378864 () Bool)

(assert (=> b!592073 (=> (not res!378864) (not e!338089))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!592073 (= res!378864 (= (select (store (arr!17713 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!268714 () array!36891)

(assert (=> b!592073 (= lt!268714 (array!36892 (store (arr!17713 a!2986) i!1108 k0!1786) (size!18077 a!2986)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!592074 () Bool)

(declare-fun e!338094 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!36891 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!592074 (= e!338094 (arrayContainsKey!0 lt!268714 (select (arr!17713 a!2986) j!136) index!984))))

(declare-fun b!592075 () Bool)

(declare-fun e!338087 () Bool)

(assert (=> b!592075 (= e!338089 e!338087)))

(declare-fun res!378865 () Bool)

(assert (=> b!592075 (=> (not res!378865) (not e!338087))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6109 0))(
  ( (MissingZero!6109 (index!26672 (_ BitVec 32))) (Found!6109 (index!26673 (_ BitVec 32))) (Intermediate!6109 (undefined!6921 Bool) (index!26674 (_ BitVec 32)) (x!55616 (_ BitVec 32))) (Undefined!6109) (MissingVacant!6109 (index!26675 (_ BitVec 32))) )
))
(declare-fun lt!268709 () SeekEntryResult!6109)

(assert (=> b!592075 (= res!378865 (and (= lt!268709 (Found!6109 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17713 a!2986) index!984) (select (arr!17713 a!2986) j!136))) (not (= (select (arr!17713 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36891 (_ BitVec 32)) SeekEntryResult!6109)

(assert (=> b!592075 (= lt!268709 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17713 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!592076 () Bool)

(declare-fun res!378868 () Bool)

(assert (=> b!592076 (=> (not res!378868) (not e!338092))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!592076 (= res!378868 (validKeyInArray!0 k0!1786))))

(declare-fun b!592077 () Bool)

(declare-fun res!378863 () Bool)

(assert (=> b!592077 (=> (not res!378863) (not e!338092))))

(assert (=> b!592077 (= res!378863 (validKeyInArray!0 (select (arr!17713 a!2986) j!136)))))

(declare-fun b!592078 () Bool)

(declare-fun e!338096 () Bool)

(declare-fun lt!268706 () SeekEntryResult!6109)

(assert (=> b!592078 (= e!338096 (= lt!268709 lt!268706))))

(declare-fun b!592079 () Bool)

(declare-fun res!378875 () Bool)

(assert (=> b!592079 (=> (not res!378875) (not e!338088))))

(declare-datatypes ((List!11661 0))(
  ( (Nil!11658) (Cons!11657 (h!12705 (_ BitVec 64)) (t!17881 List!11661)) )
))
(declare-fun arrayNoDuplicates!0 (array!36891 (_ BitVec 32) List!11661) Bool)

(assert (=> b!592079 (= res!378875 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11658))))

(declare-fun b!592080 () Bool)

(declare-fun res!378877 () Bool)

(assert (=> b!592080 (=> (not res!378877) (not e!338092))))

(assert (=> b!592080 (= res!378877 (and (= (size!18077 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18077 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18077 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!592081 () Bool)

(declare-fun e!338091 () Bool)

(assert (=> b!592081 (= e!338087 (not e!338091))))

(declare-fun res!378867 () Bool)

(assert (=> b!592081 (=> res!378867 e!338091)))

(declare-fun lt!268708 () SeekEntryResult!6109)

(assert (=> b!592081 (= res!378867 (not (= lt!268708 (Found!6109 index!984))))))

(declare-datatypes ((Unit!18529 0))(
  ( (Unit!18530) )
))
(declare-fun lt!268712 () Unit!18529)

(declare-fun e!338090 () Unit!18529)

(assert (=> b!592081 (= lt!268712 e!338090)))

(declare-fun c!66974 () Bool)

(assert (=> b!592081 (= c!66974 (= lt!268708 Undefined!6109))))

(declare-fun lt!268710 () (_ BitVec 64))

(assert (=> b!592081 (= lt!268708 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268710 lt!268714 mask!3053))))

(assert (=> b!592081 e!338096))

(declare-fun res!378873 () Bool)

(assert (=> b!592081 (=> (not res!378873) (not e!338096))))

(declare-fun lt!268705 () (_ BitVec 32))

(assert (=> b!592081 (= res!378873 (= lt!268706 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268705 vacantSpotIndex!68 lt!268710 lt!268714 mask!3053)))))

(assert (=> b!592081 (= lt!268706 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268705 vacantSpotIndex!68 (select (arr!17713 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!592081 (= lt!268710 (select (store (arr!17713 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!268711 () Unit!18529)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36891 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18529)

(assert (=> b!592081 (= lt!268711 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268705 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!592081 (= lt!268705 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!592082 () Bool)

(assert (=> b!592082 (= e!338091 true)))

(declare-fun e!338095 () Bool)

(assert (=> b!592082 e!338095))

(declare-fun res!378870 () Bool)

(assert (=> b!592082 (=> (not res!378870) (not e!338095))))

(declare-fun lt!268707 () (_ BitVec 64))

(assert (=> b!592082 (= res!378870 (= lt!268707 (select (arr!17713 a!2986) j!136)))))

(assert (=> b!592082 (= lt!268707 (select (store (arr!17713 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!592083 () Bool)

(declare-fun Unit!18531 () Unit!18529)

(assert (=> b!592083 (= e!338090 Unit!18531)))

(declare-fun b!592084 () Bool)

(declare-fun res!378876 () Bool)

(assert (=> b!592084 (=> (not res!378876) (not e!338092))))

(assert (=> b!592084 (= res!378876 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!592085 () Bool)

(declare-fun e!338097 () Bool)

(assert (=> b!592085 (= e!338095 e!338097)))

(declare-fun res!378874 () Bool)

(assert (=> b!592085 (=> res!378874 e!338097)))

(assert (=> b!592085 (= res!378874 (or (not (= (select (arr!17713 a!2986) j!136) lt!268710)) (not (= (select (arr!17713 a!2986) j!136) lt!268707)) (bvsge j!136 index!984)))))

(declare-fun b!592086 () Bool)

(assert (=> b!592086 (= e!338097 e!338094)))

(declare-fun res!378872 () Bool)

(assert (=> b!592086 (=> (not res!378872) (not e!338094))))

(assert (=> b!592086 (= res!378872 (arrayContainsKey!0 lt!268714 (select (arr!17713 a!2986) j!136) j!136))))

(declare-fun b!592087 () Bool)

(declare-fun Unit!18532 () Unit!18529)

(assert (=> b!592087 (= e!338090 Unit!18532)))

(assert (=> b!592087 false))

(declare-fun b!592088 () Bool)

(declare-fun res!378862 () Bool)

(assert (=> b!592088 (=> (not res!378862) (not e!338088))))

(assert (=> b!592088 (= res!378862 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17713 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!592089 () Bool)

(declare-fun res!378866 () Bool)

(assert (=> b!592089 (=> (not res!378866) (not e!338088))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36891 (_ BitVec 32)) Bool)

(assert (=> b!592089 (= res!378866 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!592090 () Bool)

(assert (=> b!592090 (= e!338092 e!338088)))

(declare-fun res!378869 () Bool)

(assert (=> b!592090 (=> (not res!378869) (not e!338088))))

(declare-fun lt!268713 () SeekEntryResult!6109)

(assert (=> b!592090 (= res!378869 (or (= lt!268713 (MissingZero!6109 i!1108)) (= lt!268713 (MissingVacant!6109 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36891 (_ BitVec 32)) SeekEntryResult!6109)

(assert (=> b!592090 (= lt!268713 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!54216 res!378871) b!592080))

(assert (= (and b!592080 res!378877) b!592077))

(assert (= (and b!592077 res!378863) b!592076))

(assert (= (and b!592076 res!378868) b!592084))

(assert (= (and b!592084 res!378876) b!592090))

(assert (= (and b!592090 res!378869) b!592089))

(assert (= (and b!592089 res!378866) b!592079))

(assert (= (and b!592079 res!378875) b!592088))

(assert (= (and b!592088 res!378862) b!592073))

(assert (= (and b!592073 res!378864) b!592075))

(assert (= (and b!592075 res!378865) b!592081))

(assert (= (and b!592081 res!378873) b!592078))

(assert (= (and b!592081 c!66974) b!592087))

(assert (= (and b!592081 (not c!66974)) b!592083))

(assert (= (and b!592081 (not res!378867)) b!592082))

(assert (= (and b!592082 res!378870) b!592085))

(assert (= (and b!592085 (not res!378874)) b!592086))

(assert (= (and b!592086 res!378872) b!592074))

(declare-fun m!570425 () Bool)

(assert (=> b!592089 m!570425))

(declare-fun m!570427 () Bool)

(assert (=> b!592081 m!570427))

(declare-fun m!570429 () Bool)

(assert (=> b!592081 m!570429))

(declare-fun m!570431 () Bool)

(assert (=> b!592081 m!570431))

(declare-fun m!570433 () Bool)

(assert (=> b!592081 m!570433))

(declare-fun m!570435 () Bool)

(assert (=> b!592081 m!570435))

(declare-fun m!570437 () Bool)

(assert (=> b!592081 m!570437))

(assert (=> b!592081 m!570431))

(declare-fun m!570439 () Bool)

(assert (=> b!592081 m!570439))

(declare-fun m!570441 () Bool)

(assert (=> b!592081 m!570441))

(assert (=> b!592073 m!570433))

(declare-fun m!570443 () Bool)

(assert (=> b!592073 m!570443))

(declare-fun m!570445 () Bool)

(assert (=> b!592090 m!570445))

(declare-fun m!570447 () Bool)

(assert (=> b!592076 m!570447))

(assert (=> b!592077 m!570431))

(assert (=> b!592077 m!570431))

(declare-fun m!570449 () Bool)

(assert (=> b!592077 m!570449))

(declare-fun m!570451 () Bool)

(assert (=> b!592079 m!570451))

(declare-fun m!570453 () Bool)

(assert (=> start!54216 m!570453))

(declare-fun m!570455 () Bool)

(assert (=> start!54216 m!570455))

(declare-fun m!570457 () Bool)

(assert (=> b!592075 m!570457))

(assert (=> b!592075 m!570431))

(assert (=> b!592075 m!570431))

(declare-fun m!570459 () Bool)

(assert (=> b!592075 m!570459))

(assert (=> b!592085 m!570431))

(declare-fun m!570461 () Bool)

(assert (=> b!592084 m!570461))

(declare-fun m!570463 () Bool)

(assert (=> b!592088 m!570463))

(assert (=> b!592074 m!570431))

(assert (=> b!592074 m!570431))

(declare-fun m!570465 () Bool)

(assert (=> b!592074 m!570465))

(assert (=> b!592086 m!570431))

(assert (=> b!592086 m!570431))

(declare-fun m!570467 () Bool)

(assert (=> b!592086 m!570467))

(assert (=> b!592082 m!570431))

(assert (=> b!592082 m!570433))

(declare-fun m!570469 () Bool)

(assert (=> b!592082 m!570469))

(check-sat (not b!592079) (not b!592075) (not b!592077) (not b!592081) (not b!592089) (not start!54216) (not b!592074) (not b!592086) (not b!592084) (not b!592090) (not b!592076))
(check-sat)

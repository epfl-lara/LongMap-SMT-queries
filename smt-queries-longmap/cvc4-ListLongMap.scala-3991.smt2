; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54140 () Bool)

(assert start!54140)

(declare-fun b!591162 () Bool)

(declare-fun res!378134 () Bool)

(declare-fun e!337532 () Bool)

(assert (=> b!591162 (=> (not res!378134) (not e!337532))))

(declare-datatypes ((array!36870 0))(
  ( (array!36871 (arr!17705 (Array (_ BitVec 32) (_ BitVec 64))) (size!18069 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36870)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36870 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!591162 (= res!378134 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!591163 () Bool)

(declare-datatypes ((Unit!18498 0))(
  ( (Unit!18499) )
))
(declare-fun e!337538 () Unit!18498)

(declare-fun Unit!18500 () Unit!18498)

(assert (=> b!591163 (= e!337538 Unit!18500)))

(assert (=> b!591163 false))

(declare-fun b!591164 () Bool)

(declare-fun res!378149 () Bool)

(assert (=> b!591164 (=> (not res!378149) (not e!337532))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!591164 (= res!378149 (validKeyInArray!0 (select (arr!17705 a!2986) j!136)))))

(declare-fun b!591165 () Bool)

(declare-fun e!337539 () Bool)

(declare-fun e!337537 () Bool)

(assert (=> b!591165 (= e!337539 e!337537)))

(declare-fun res!378143 () Bool)

(assert (=> b!591165 (=> (not res!378143) (not e!337537))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!591165 (= res!378143 (= (select (store (arr!17705 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!268220 () array!36870)

(assert (=> b!591165 (= lt!268220 (array!36871 (store (arr!17705 a!2986) i!1108 k!1786) (size!18069 a!2986)))))

(declare-fun b!591166 () Bool)

(declare-fun res!378142 () Bool)

(assert (=> b!591166 (=> (not res!378142) (not e!337532))))

(assert (=> b!591166 (= res!378142 (validKeyInArray!0 k!1786))))

(declare-fun b!591167 () Bool)

(declare-fun e!337536 () Bool)

(declare-fun e!337533 () Bool)

(assert (=> b!591167 (= e!337536 e!337533)))

(declare-fun res!378140 () Bool)

(assert (=> b!591167 (=> (not res!378140) (not e!337533))))

(assert (=> b!591167 (= res!378140 (arrayContainsKey!0 lt!268220 (select (arr!17705 a!2986) j!136) j!136))))

(declare-fun res!378144 () Bool)

(assert (=> start!54140 (=> (not res!378144) (not e!337532))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54140 (= res!378144 (validMask!0 mask!3053))))

(assert (=> start!54140 e!337532))

(assert (=> start!54140 true))

(declare-fun array_inv!13501 (array!36870) Bool)

(assert (=> start!54140 (array_inv!13501 a!2986)))

(declare-fun b!591168 () Bool)

(declare-fun e!337529 () Bool)

(assert (=> b!591168 (= e!337529 true)))

(declare-fun e!337531 () Bool)

(assert (=> b!591168 e!337531))

(declare-fun res!378145 () Bool)

(assert (=> b!591168 (=> (not res!378145) (not e!337531))))

(declare-fun lt!268216 () (_ BitVec 64))

(assert (=> b!591168 (= res!378145 (= lt!268216 (select (arr!17705 a!2986) j!136)))))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!591168 (= lt!268216 (select (store (arr!17705 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!591169 () Bool)

(declare-fun Unit!18501 () Unit!18498)

(assert (=> b!591169 (= e!337538 Unit!18501)))

(declare-fun b!591170 () Bool)

(declare-fun res!378137 () Bool)

(assert (=> b!591170 (=> (not res!378137) (not e!337539))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36870 (_ BitVec 32)) Bool)

(assert (=> b!591170 (= res!378137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!591171 () Bool)

(declare-fun e!337530 () Bool)

(assert (=> b!591171 (= e!337537 e!337530)))

(declare-fun res!378147 () Bool)

(assert (=> b!591171 (=> (not res!378147) (not e!337530))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6145 0))(
  ( (MissingZero!6145 (index!26816 (_ BitVec 32))) (Found!6145 (index!26817 (_ BitVec 32))) (Intermediate!6145 (undefined!6957 Bool) (index!26818 (_ BitVec 32)) (x!55609 (_ BitVec 32))) (Undefined!6145) (MissingVacant!6145 (index!26819 (_ BitVec 32))) )
))
(declare-fun lt!268213 () SeekEntryResult!6145)

(assert (=> b!591171 (= res!378147 (and (= lt!268213 (Found!6145 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17705 a!2986) index!984) (select (arr!17705 a!2986) j!136))) (not (= (select (arr!17705 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36870 (_ BitVec 32)) SeekEntryResult!6145)

(assert (=> b!591171 (= lt!268213 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17705 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!591172 () Bool)

(assert (=> b!591172 (= e!337532 e!337539)))

(declare-fun res!378141 () Bool)

(assert (=> b!591172 (=> (not res!378141) (not e!337539))))

(declare-fun lt!268218 () SeekEntryResult!6145)

(assert (=> b!591172 (= res!378141 (or (= lt!268218 (MissingZero!6145 i!1108)) (= lt!268218 (MissingVacant!6145 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36870 (_ BitVec 32)) SeekEntryResult!6145)

(assert (=> b!591172 (= lt!268218 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!591173 () Bool)

(assert (=> b!591173 (= e!337531 e!337536)))

(declare-fun res!378148 () Bool)

(assert (=> b!591173 (=> res!378148 e!337536)))

(declare-fun lt!268217 () (_ BitVec 64))

(assert (=> b!591173 (= res!378148 (or (not (= (select (arr!17705 a!2986) j!136) lt!268217)) (not (= (select (arr!17705 a!2986) j!136) lt!268216)) (bvsge j!136 index!984)))))

(declare-fun b!591174 () Bool)

(assert (=> b!591174 (= e!337530 (not e!337529))))

(declare-fun res!378135 () Bool)

(assert (=> b!591174 (=> res!378135 e!337529)))

(declare-fun lt!268222 () SeekEntryResult!6145)

(assert (=> b!591174 (= res!378135 (not (= lt!268222 (Found!6145 index!984))))))

(declare-fun lt!268219 () Unit!18498)

(assert (=> b!591174 (= lt!268219 e!337538)))

(declare-fun c!66881 () Bool)

(assert (=> b!591174 (= c!66881 (= lt!268222 Undefined!6145))))

(assert (=> b!591174 (= lt!268222 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268217 lt!268220 mask!3053))))

(declare-fun e!337534 () Bool)

(assert (=> b!591174 e!337534))

(declare-fun res!378139 () Bool)

(assert (=> b!591174 (=> (not res!378139) (not e!337534))))

(declare-fun lt!268214 () (_ BitVec 32))

(declare-fun lt!268221 () SeekEntryResult!6145)

(assert (=> b!591174 (= res!378139 (= lt!268221 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268214 vacantSpotIndex!68 lt!268217 lt!268220 mask!3053)))))

(assert (=> b!591174 (= lt!268221 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268214 vacantSpotIndex!68 (select (arr!17705 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!591174 (= lt!268217 (select (store (arr!17705 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!268215 () Unit!18498)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36870 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18498)

(assert (=> b!591174 (= lt!268215 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268214 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!591174 (= lt!268214 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!591175 () Bool)

(assert (=> b!591175 (= e!337533 (arrayContainsKey!0 lt!268220 (select (arr!17705 a!2986) j!136) index!984))))

(declare-fun b!591176 () Bool)

(declare-fun res!378146 () Bool)

(assert (=> b!591176 (=> (not res!378146) (not e!337532))))

(assert (=> b!591176 (= res!378146 (and (= (size!18069 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18069 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18069 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!591177 () Bool)

(assert (=> b!591177 (= e!337534 (= lt!268213 lt!268221))))

(declare-fun b!591178 () Bool)

(declare-fun res!378138 () Bool)

(assert (=> b!591178 (=> (not res!378138) (not e!337539))))

(declare-datatypes ((List!11746 0))(
  ( (Nil!11743) (Cons!11742 (h!12787 (_ BitVec 64)) (t!17974 List!11746)) )
))
(declare-fun arrayNoDuplicates!0 (array!36870 (_ BitVec 32) List!11746) Bool)

(assert (=> b!591178 (= res!378138 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11743))))

(declare-fun b!591179 () Bool)

(declare-fun res!378136 () Bool)

(assert (=> b!591179 (=> (not res!378136) (not e!337539))))

(assert (=> b!591179 (= res!378136 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17705 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!54140 res!378144) b!591176))

(assert (= (and b!591176 res!378146) b!591164))

(assert (= (and b!591164 res!378149) b!591166))

(assert (= (and b!591166 res!378142) b!591162))

(assert (= (and b!591162 res!378134) b!591172))

(assert (= (and b!591172 res!378141) b!591170))

(assert (= (and b!591170 res!378137) b!591178))

(assert (= (and b!591178 res!378138) b!591179))

(assert (= (and b!591179 res!378136) b!591165))

(assert (= (and b!591165 res!378143) b!591171))

(assert (= (and b!591171 res!378147) b!591174))

(assert (= (and b!591174 res!378139) b!591177))

(assert (= (and b!591174 c!66881) b!591163))

(assert (= (and b!591174 (not c!66881)) b!591169))

(assert (= (and b!591174 (not res!378135)) b!591168))

(assert (= (and b!591168 res!378145) b!591173))

(assert (= (and b!591173 (not res!378148)) b!591167))

(assert (= (and b!591167 res!378140) b!591175))

(declare-fun m!569451 () Bool)

(assert (=> b!591175 m!569451))

(assert (=> b!591175 m!569451))

(declare-fun m!569453 () Bool)

(assert (=> b!591175 m!569453))

(declare-fun m!569455 () Bool)

(assert (=> b!591165 m!569455))

(declare-fun m!569457 () Bool)

(assert (=> b!591165 m!569457))

(declare-fun m!569459 () Bool)

(assert (=> b!591162 m!569459))

(declare-fun m!569461 () Bool)

(assert (=> b!591172 m!569461))

(assert (=> b!591168 m!569451))

(assert (=> b!591168 m!569455))

(declare-fun m!569463 () Bool)

(assert (=> b!591168 m!569463))

(declare-fun m!569465 () Bool)

(assert (=> b!591171 m!569465))

(assert (=> b!591171 m!569451))

(assert (=> b!591171 m!569451))

(declare-fun m!569467 () Bool)

(assert (=> b!591171 m!569467))

(declare-fun m!569469 () Bool)

(assert (=> start!54140 m!569469))

(declare-fun m!569471 () Bool)

(assert (=> start!54140 m!569471))

(declare-fun m!569473 () Bool)

(assert (=> b!591170 m!569473))

(declare-fun m!569475 () Bool)

(assert (=> b!591179 m!569475))

(assert (=> b!591173 m!569451))

(declare-fun m!569477 () Bool)

(assert (=> b!591166 m!569477))

(assert (=> b!591167 m!569451))

(assert (=> b!591167 m!569451))

(declare-fun m!569479 () Bool)

(assert (=> b!591167 m!569479))

(declare-fun m!569481 () Bool)

(assert (=> b!591174 m!569481))

(declare-fun m!569483 () Bool)

(assert (=> b!591174 m!569483))

(declare-fun m!569485 () Bool)

(assert (=> b!591174 m!569485))

(assert (=> b!591174 m!569451))

(declare-fun m!569487 () Bool)

(assert (=> b!591174 m!569487))

(assert (=> b!591174 m!569451))

(declare-fun m!569489 () Bool)

(assert (=> b!591174 m!569489))

(declare-fun m!569491 () Bool)

(assert (=> b!591174 m!569491))

(assert (=> b!591174 m!569455))

(assert (=> b!591164 m!569451))

(assert (=> b!591164 m!569451))

(declare-fun m!569493 () Bool)

(assert (=> b!591164 m!569493))

(declare-fun m!569495 () Bool)

(assert (=> b!591178 m!569495))

(push 1)


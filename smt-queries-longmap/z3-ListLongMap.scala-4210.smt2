; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57762 () Bool)

(assert start!57762)

(declare-fun b!638241 () Bool)

(declare-fun res!413008 () Bool)

(declare-fun e!365216 () Bool)

(assert (=> b!638241 (=> res!413008 e!365216)))

(declare-datatypes ((List!12303 0))(
  ( (Nil!12300) (Cons!12299 (h!13347 (_ BitVec 64)) (t!18523 List!12303)) )
))
(declare-fun contains!3095 (List!12303 (_ BitVec 64)) Bool)

(assert (=> b!638241 (= res!413008 (contains!3095 Nil!12300 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!638242 () Bool)

(declare-fun res!412999 () Bool)

(declare-fun e!365221 () Bool)

(assert (=> b!638242 (=> (not res!412999) (not e!365221))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38271 0))(
  ( (array!38272 (arr!18355 (Array (_ BitVec 32) (_ BitVec 64))) (size!18719 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38271)

(assert (=> b!638242 (= res!412999 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18355 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!638243 () Bool)

(declare-fun res!413006 () Bool)

(assert (=> b!638243 (=> (not res!413006) (not e!365221))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38271 (_ BitVec 32)) Bool)

(assert (=> b!638243 (= res!413006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!638244 () Bool)

(declare-fun res!412996 () Bool)

(declare-fun e!365222 () Bool)

(assert (=> b!638244 (=> (not res!412996) (not e!365222))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!638244 (= res!412996 (validKeyInArray!0 (select (arr!18355 a!2986) j!136)))))

(declare-fun b!638245 () Bool)

(declare-fun e!365215 () Bool)

(declare-fun e!365217 () Bool)

(assert (=> b!638245 (= e!365215 (not e!365217))))

(declare-fun res!413004 () Bool)

(assert (=> b!638245 (=> res!413004 e!365217)))

(declare-datatypes ((SeekEntryResult!6751 0))(
  ( (MissingZero!6751 (index!29318 (_ BitVec 32))) (Found!6751 (index!29319 (_ BitVec 32))) (Intermediate!6751 (undefined!7563 Bool) (index!29320 (_ BitVec 32)) (x!58228 (_ BitVec 32))) (Undefined!6751) (MissingVacant!6751 (index!29321 (_ BitVec 32))) )
))
(declare-fun lt!295136 () SeekEntryResult!6751)

(assert (=> b!638245 (= res!413004 (not (= lt!295136 (Found!6751 index!984))))))

(declare-datatypes ((Unit!21513 0))(
  ( (Unit!21514) )
))
(declare-fun lt!295127 () Unit!21513)

(declare-fun e!365220 () Unit!21513)

(assert (=> b!638245 (= lt!295127 e!365220)))

(declare-fun c!72995 () Bool)

(assert (=> b!638245 (= c!72995 (= lt!295136 Undefined!6751))))

(declare-fun lt!295133 () (_ BitVec 64))

(declare-fun lt!295129 () array!38271)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38271 (_ BitVec 32)) SeekEntryResult!6751)

(assert (=> b!638245 (= lt!295136 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!295133 lt!295129 mask!3053))))

(declare-fun e!365226 () Bool)

(assert (=> b!638245 e!365226))

(declare-fun res!412988 () Bool)

(assert (=> b!638245 (=> (not res!412988) (not e!365226))))

(declare-fun lt!295132 () SeekEntryResult!6751)

(declare-fun lt!295130 () (_ BitVec 32))

(assert (=> b!638245 (= res!412988 (= lt!295132 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295130 vacantSpotIndex!68 lt!295133 lt!295129 mask!3053)))))

(assert (=> b!638245 (= lt!295132 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295130 vacantSpotIndex!68 (select (arr!18355 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!638245 (= lt!295133 (select (store (arr!18355 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!295134 () Unit!21513)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38271 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21513)

(assert (=> b!638245 (= lt!295134 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295130 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!638245 (= lt!295130 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!638246 () Bool)

(declare-fun res!412997 () Bool)

(assert (=> b!638246 (=> (not res!412997) (not e!365222))))

(assert (=> b!638246 (= res!412997 (validKeyInArray!0 k0!1786))))

(declare-fun b!638247 () Bool)

(declare-fun e!365225 () Bool)

(declare-fun arrayContainsKey!0 (array!38271 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!638247 (= e!365225 (arrayContainsKey!0 lt!295129 (select (arr!18355 a!2986) j!136) index!984))))

(declare-fun b!638248 () Bool)

(assert (=> b!638248 (= e!365216 true)))

(declare-fun lt!295138 () Bool)

(assert (=> b!638248 (= lt!295138 (contains!3095 Nil!12300 k0!1786))))

(declare-fun b!638249 () Bool)

(declare-fun e!365224 () Bool)

(assert (=> b!638249 (= e!365221 e!365224)))

(declare-fun res!413003 () Bool)

(assert (=> b!638249 (=> (not res!413003) (not e!365224))))

(assert (=> b!638249 (= res!413003 (= (select (store (arr!18355 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!638249 (= lt!295129 (array!38272 (store (arr!18355 a!2986) i!1108 k0!1786) (size!18719 a!2986)))))

(declare-fun b!638250 () Bool)

(assert (=> b!638250 (= e!365224 e!365215)))

(declare-fun res!412992 () Bool)

(assert (=> b!638250 (=> (not res!412992) (not e!365215))))

(declare-fun lt!295137 () SeekEntryResult!6751)

(assert (=> b!638250 (= res!412992 (and (= lt!295137 (Found!6751 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18355 a!2986) index!984) (select (arr!18355 a!2986) j!136))) (not (= (select (arr!18355 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!638250 (= lt!295137 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18355 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!638251 () Bool)

(declare-fun res!412998 () Bool)

(assert (=> b!638251 (=> (not res!412998) (not e!365222))))

(assert (=> b!638251 (= res!412998 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!638252 () Bool)

(declare-fun res!412993 () Bool)

(assert (=> b!638252 (=> (not res!412993) (not e!365221))))

(declare-fun arrayNoDuplicates!0 (array!38271 (_ BitVec 32) List!12303) Bool)

(assert (=> b!638252 (= res!412993 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12300))))

(declare-fun b!638254 () Bool)

(declare-fun e!365223 () Bool)

(assert (=> b!638254 (= e!365223 e!365216)))

(declare-fun res!413005 () Bool)

(assert (=> b!638254 (=> res!413005 e!365216)))

(assert (=> b!638254 (= res!413005 (or (bvsge (size!18719 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18719 a!2986))))))

(assert (=> b!638254 (arrayContainsKey!0 lt!295129 (select (arr!18355 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!295135 () Unit!21513)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38271 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21513)

(assert (=> b!638254 (= lt!295135 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!295129 (select (arr!18355 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!638255 () Bool)

(declare-fun res!412991 () Bool)

(assert (=> b!638255 (=> res!412991 e!365216)))

(assert (=> b!638255 (= res!412991 (contains!3095 Nil!12300 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!638256 () Bool)

(declare-fun res!413001 () Bool)

(assert (=> b!638256 (=> res!413001 e!365216)))

(declare-fun noDuplicate!397 (List!12303) Bool)

(assert (=> b!638256 (= res!413001 (not (noDuplicate!397 Nil!12300)))))

(declare-fun b!638257 () Bool)

(declare-fun Unit!21515 () Unit!21513)

(assert (=> b!638257 (= e!365220 Unit!21515)))

(declare-fun b!638258 () Bool)

(assert (=> b!638258 (= e!365222 e!365221)))

(declare-fun res!413002 () Bool)

(assert (=> b!638258 (=> (not res!413002) (not e!365221))))

(declare-fun lt!295128 () SeekEntryResult!6751)

(assert (=> b!638258 (= res!413002 (or (= lt!295128 (MissingZero!6751 i!1108)) (= lt!295128 (MissingVacant!6751 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38271 (_ BitVec 32)) SeekEntryResult!6751)

(assert (=> b!638258 (= lt!295128 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!638259 () Bool)

(assert (=> b!638259 (= e!365217 e!365223)))

(declare-fun res!412989 () Bool)

(assert (=> b!638259 (=> res!412989 e!365223)))

(declare-fun lt!295131 () (_ BitVec 64))

(assert (=> b!638259 (= res!412989 (or (not (= (select (arr!18355 a!2986) j!136) lt!295133)) (not (= (select (arr!18355 a!2986) j!136) lt!295131)) (bvsge j!136 index!984)))))

(declare-fun e!365214 () Bool)

(assert (=> b!638259 e!365214))

(declare-fun res!412995 () Bool)

(assert (=> b!638259 (=> (not res!412995) (not e!365214))))

(assert (=> b!638259 (= res!412995 (= lt!295131 (select (arr!18355 a!2986) j!136)))))

(assert (=> b!638259 (= lt!295131 (select (store (arr!18355 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!638260 () Bool)

(assert (=> b!638260 (= e!365226 (= lt!295137 lt!295132))))

(declare-fun b!638261 () Bool)

(declare-fun e!365218 () Bool)

(assert (=> b!638261 (= e!365214 e!365218)))

(declare-fun res!412994 () Bool)

(assert (=> b!638261 (=> res!412994 e!365218)))

(assert (=> b!638261 (= res!412994 (or (not (= (select (arr!18355 a!2986) j!136) lt!295133)) (not (= (select (arr!18355 a!2986) j!136) lt!295131)) (bvsge j!136 index!984)))))

(declare-fun b!638262 () Bool)

(declare-fun res!413000 () Bool)

(assert (=> b!638262 (=> (not res!413000) (not e!365222))))

(assert (=> b!638262 (= res!413000 (and (= (size!18719 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18719 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18719 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!638263 () Bool)

(declare-fun Unit!21516 () Unit!21513)

(assert (=> b!638263 (= e!365220 Unit!21516)))

(assert (=> b!638263 false))

(declare-fun b!638253 () Bool)

(assert (=> b!638253 (= e!365218 e!365225)))

(declare-fun res!412990 () Bool)

(assert (=> b!638253 (=> (not res!412990) (not e!365225))))

(assert (=> b!638253 (= res!412990 (arrayContainsKey!0 lt!295129 (select (arr!18355 a!2986) j!136) j!136))))

(declare-fun res!413007 () Bool)

(assert (=> start!57762 (=> (not res!413007) (not e!365222))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57762 (= res!413007 (validMask!0 mask!3053))))

(assert (=> start!57762 e!365222))

(assert (=> start!57762 true))

(declare-fun array_inv!14214 (array!38271) Bool)

(assert (=> start!57762 (array_inv!14214 a!2986)))

(assert (= (and start!57762 res!413007) b!638262))

(assert (= (and b!638262 res!413000) b!638244))

(assert (= (and b!638244 res!412996) b!638246))

(assert (= (and b!638246 res!412997) b!638251))

(assert (= (and b!638251 res!412998) b!638258))

(assert (= (and b!638258 res!413002) b!638243))

(assert (= (and b!638243 res!413006) b!638252))

(assert (= (and b!638252 res!412993) b!638242))

(assert (= (and b!638242 res!412999) b!638249))

(assert (= (and b!638249 res!413003) b!638250))

(assert (= (and b!638250 res!412992) b!638245))

(assert (= (and b!638245 res!412988) b!638260))

(assert (= (and b!638245 c!72995) b!638263))

(assert (= (and b!638245 (not c!72995)) b!638257))

(assert (= (and b!638245 (not res!413004)) b!638259))

(assert (= (and b!638259 res!412995) b!638261))

(assert (= (and b!638261 (not res!412994)) b!638253))

(assert (= (and b!638253 res!412990) b!638247))

(assert (= (and b!638259 (not res!412989)) b!638254))

(assert (= (and b!638254 (not res!413005)) b!638256))

(assert (= (and b!638256 (not res!413001)) b!638241))

(assert (= (and b!638241 (not res!413008)) b!638255))

(assert (= (and b!638255 (not res!412991)) b!638248))

(declare-fun m!612595 () Bool)

(assert (=> b!638247 m!612595))

(assert (=> b!638247 m!612595))

(declare-fun m!612597 () Bool)

(assert (=> b!638247 m!612597))

(declare-fun m!612599 () Bool)

(assert (=> b!638255 m!612599))

(assert (=> b!638261 m!612595))

(assert (=> b!638253 m!612595))

(assert (=> b!638253 m!612595))

(declare-fun m!612601 () Bool)

(assert (=> b!638253 m!612601))

(declare-fun m!612603 () Bool)

(assert (=> b!638241 m!612603))

(declare-fun m!612605 () Bool)

(assert (=> b!638243 m!612605))

(declare-fun m!612607 () Bool)

(assert (=> b!638250 m!612607))

(assert (=> b!638250 m!612595))

(assert (=> b!638250 m!612595))

(declare-fun m!612609 () Bool)

(assert (=> b!638250 m!612609))

(assert (=> b!638244 m!612595))

(assert (=> b!638244 m!612595))

(declare-fun m!612611 () Bool)

(assert (=> b!638244 m!612611))

(declare-fun m!612613 () Bool)

(assert (=> b!638252 m!612613))

(declare-fun m!612615 () Bool)

(assert (=> b!638248 m!612615))

(declare-fun m!612617 () Bool)

(assert (=> start!57762 m!612617))

(declare-fun m!612619 () Bool)

(assert (=> start!57762 m!612619))

(declare-fun m!612621 () Bool)

(assert (=> b!638242 m!612621))

(declare-fun m!612623 () Bool)

(assert (=> b!638256 m!612623))

(declare-fun m!612625 () Bool)

(assert (=> b!638246 m!612625))

(declare-fun m!612627 () Bool)

(assert (=> b!638249 m!612627))

(declare-fun m!612629 () Bool)

(assert (=> b!638249 m!612629))

(assert (=> b!638259 m!612595))

(assert (=> b!638259 m!612627))

(declare-fun m!612631 () Bool)

(assert (=> b!638259 m!612631))

(assert (=> b!638254 m!612595))

(assert (=> b!638254 m!612595))

(declare-fun m!612633 () Bool)

(assert (=> b!638254 m!612633))

(assert (=> b!638254 m!612595))

(declare-fun m!612635 () Bool)

(assert (=> b!638254 m!612635))

(declare-fun m!612637 () Bool)

(assert (=> b!638258 m!612637))

(declare-fun m!612639 () Bool)

(assert (=> b!638245 m!612639))

(declare-fun m!612641 () Bool)

(assert (=> b!638245 m!612641))

(assert (=> b!638245 m!612595))

(assert (=> b!638245 m!612627))

(declare-fun m!612643 () Bool)

(assert (=> b!638245 m!612643))

(declare-fun m!612645 () Bool)

(assert (=> b!638245 m!612645))

(assert (=> b!638245 m!612595))

(declare-fun m!612647 () Bool)

(assert (=> b!638245 m!612647))

(declare-fun m!612649 () Bool)

(assert (=> b!638245 m!612649))

(declare-fun m!612651 () Bool)

(assert (=> b!638251 m!612651))

(check-sat (not b!638248) (not b!638251) (not b!638253) (not b!638254) (not b!638245) (not b!638243) (not b!638255) (not b!638246) (not b!638252) (not start!57762) (not b!638247) (not b!638256) (not b!638258) (not b!638241) (not b!638250) (not b!638244))
(check-sat)

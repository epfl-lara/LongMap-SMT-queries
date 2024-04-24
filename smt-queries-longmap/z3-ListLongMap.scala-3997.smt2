; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54222 () Bool)

(assert start!54222)

(declare-fun b!592237 () Bool)

(declare-fun e!338196 () Bool)

(declare-fun e!338192 () Bool)

(assert (=> b!592237 (= e!338196 e!338192)))

(declare-fun res!379014 () Bool)

(assert (=> b!592237 (=> (not res!379014) (not e!338192))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!36897 0))(
  ( (array!36898 (arr!17716 (Array (_ BitVec 32) (_ BitVec 64))) (size!18080 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36897)

(assert (=> b!592237 (= res!379014 (= (select (store (arr!17716 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!268801 () array!36897)

(assert (=> b!592237 (= lt!268801 (array!36898 (store (arr!17716 a!2986) i!1108 k0!1786) (size!18080 a!2986)))))

(declare-fun b!592238 () Bool)

(declare-fun e!338198 () Bool)

(declare-fun e!338199 () Bool)

(assert (=> b!592238 (= e!338198 e!338199)))

(declare-fun res!379010 () Bool)

(assert (=> b!592238 (=> res!379010 e!338199)))

(declare-fun lt!268799 () (_ BitVec 64))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!268806 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!592238 (= res!379010 (or (not (= (select (arr!17716 a!2986) j!136) lt!268806)) (not (= (select (arr!17716 a!2986) j!136) lt!268799)) (bvsge j!136 index!984)))))

(declare-fun b!592239 () Bool)

(declare-datatypes ((Unit!18541 0))(
  ( (Unit!18542) )
))
(declare-fun e!338193 () Unit!18541)

(declare-fun Unit!18543 () Unit!18541)

(assert (=> b!592239 (= e!338193 Unit!18543)))

(assert (=> b!592239 false))

(declare-fun b!592240 () Bool)

(declare-fun res!379009 () Bool)

(declare-fun e!338194 () Bool)

(assert (=> b!592240 (=> (not res!379009) (not e!338194))))

(declare-fun arrayContainsKey!0 (array!36897 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!592240 (= res!379009 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!592241 () Bool)

(declare-fun e!338197 () Bool)

(declare-fun e!338195 () Bool)

(assert (=> b!592241 (= e!338197 e!338195)))

(declare-fun res!379024 () Bool)

(assert (=> b!592241 (=> res!379024 e!338195)))

(assert (=> b!592241 (= res!379024 (or (not (= (select (arr!17716 a!2986) j!136) lt!268806)) (not (= (select (arr!17716 a!2986) j!136) lt!268799)) (bvsge j!136 index!984)))))

(assert (=> b!592241 e!338198))

(declare-fun res!379021 () Bool)

(assert (=> b!592241 (=> (not res!379021) (not e!338198))))

(assert (=> b!592241 (= res!379021 (= lt!268799 (select (arr!17716 a!2986) j!136)))))

(assert (=> b!592241 (= lt!268799 (select (store (arr!17716 a!2986) i!1108 k0!1786) index!984))))

(declare-fun res!379023 () Bool)

(assert (=> start!54222 (=> (not res!379023) (not e!338194))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54222 (= res!379023 (validMask!0 mask!3053))))

(assert (=> start!54222 e!338194))

(assert (=> start!54222 true))

(declare-fun array_inv!13575 (array!36897) Bool)

(assert (=> start!54222 (array_inv!13575 a!2986)))

(declare-fun b!592242 () Bool)

(declare-fun res!379016 () Bool)

(assert (=> b!592242 (=> (not res!379016) (not e!338196))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36897 (_ BitVec 32)) Bool)

(assert (=> b!592242 (= res!379016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!592243 () Bool)

(declare-fun res!379008 () Bool)

(assert (=> b!592243 (=> (not res!379008) (not e!338194))))

(assert (=> b!592243 (= res!379008 (and (= (size!18080 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18080 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18080 a!2986)) (not (= i!1108 j!136))))))

(declare-fun e!338188 () Bool)

(declare-fun b!592244 () Bool)

(assert (=> b!592244 (= e!338188 (arrayContainsKey!0 lt!268801 (select (arr!17716 a!2986) j!136) index!984))))

(declare-fun b!592245 () Bool)

(declare-fun e!338191 () Bool)

(declare-datatypes ((SeekEntryResult!6112 0))(
  ( (MissingZero!6112 (index!26684 (_ BitVec 32))) (Found!6112 (index!26685 (_ BitVec 32))) (Intermediate!6112 (undefined!6924 Bool) (index!26686 (_ BitVec 32)) (x!55627 (_ BitVec 32))) (Undefined!6112) (MissingVacant!6112 (index!26687 (_ BitVec 32))) )
))
(declare-fun lt!268805 () SeekEntryResult!6112)

(declare-fun lt!268797 () SeekEntryResult!6112)

(assert (=> b!592245 (= e!338191 (= lt!268805 lt!268797))))

(declare-fun b!592246 () Bool)

(declare-fun res!379022 () Bool)

(assert (=> b!592246 (=> (not res!379022) (not e!338196))))

(declare-datatypes ((List!11664 0))(
  ( (Nil!11661) (Cons!11660 (h!12708 (_ BitVec 64)) (t!17884 List!11664)) )
))
(declare-fun arrayNoDuplicates!0 (array!36897 (_ BitVec 32) List!11664) Bool)

(assert (=> b!592246 (= res!379022 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11661))))

(declare-fun b!592247 () Bool)

(declare-fun res!379017 () Bool)

(assert (=> b!592247 (=> (not res!379017) (not e!338194))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!592247 (= res!379017 (validKeyInArray!0 (select (arr!17716 a!2986) j!136)))))

(declare-fun b!592248 () Bool)

(assert (=> b!592248 (= e!338199 e!338188)))

(declare-fun res!379018 () Bool)

(assert (=> b!592248 (=> (not res!379018) (not e!338188))))

(assert (=> b!592248 (= res!379018 (arrayContainsKey!0 lt!268801 (select (arr!17716 a!2986) j!136) j!136))))

(declare-fun b!592249 () Bool)

(declare-fun res!379019 () Bool)

(assert (=> b!592249 (=> (not res!379019) (not e!338194))))

(assert (=> b!592249 (= res!379019 (validKeyInArray!0 k0!1786))))

(declare-fun b!592250 () Bool)

(declare-fun e!338189 () Bool)

(assert (=> b!592250 (= e!338192 e!338189)))

(declare-fun res!379011 () Bool)

(assert (=> b!592250 (=> (not res!379011) (not e!338189))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!592250 (= res!379011 (and (= lt!268805 (Found!6112 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17716 a!2986) index!984) (select (arr!17716 a!2986) j!136))) (not (= (select (arr!17716 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36897 (_ BitVec 32)) SeekEntryResult!6112)

(assert (=> b!592250 (= lt!268805 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17716 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!592251 () Bool)

(assert (=> b!592251 (= e!338194 e!338196)))

(declare-fun res!379013 () Bool)

(assert (=> b!592251 (=> (not res!379013) (not e!338196))))

(declare-fun lt!268798 () SeekEntryResult!6112)

(assert (=> b!592251 (= res!379013 (or (= lt!268798 (MissingZero!6112 i!1108)) (= lt!268798 (MissingVacant!6112 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36897 (_ BitVec 32)) SeekEntryResult!6112)

(assert (=> b!592251 (= lt!268798 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!592252 () Bool)

(assert (=> b!592252 (= e!338195 (bvsge (bvadd #b00000000000000000000000000000001 j!136) #b00000000000000000000000000000000))))

(assert (=> b!592252 (arrayContainsKey!0 lt!268801 (select (arr!17716 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!268803 () Unit!18541)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36897 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18541)

(assert (=> b!592252 (= lt!268803 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!268801 (select (arr!17716 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!592253 () Bool)

(declare-fun Unit!18544 () Unit!18541)

(assert (=> b!592253 (= e!338193 Unit!18544)))

(declare-fun b!592254 () Bool)

(assert (=> b!592254 (= e!338189 (not e!338197))))

(declare-fun res!379015 () Bool)

(assert (=> b!592254 (=> res!379015 e!338197)))

(declare-fun lt!268800 () SeekEntryResult!6112)

(assert (=> b!592254 (= res!379015 (not (= lt!268800 (Found!6112 index!984))))))

(declare-fun lt!268807 () Unit!18541)

(assert (=> b!592254 (= lt!268807 e!338193)))

(declare-fun c!66983 () Bool)

(assert (=> b!592254 (= c!66983 (= lt!268800 Undefined!6112))))

(assert (=> b!592254 (= lt!268800 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268806 lt!268801 mask!3053))))

(assert (=> b!592254 e!338191))

(declare-fun res!379012 () Bool)

(assert (=> b!592254 (=> (not res!379012) (not e!338191))))

(declare-fun lt!268802 () (_ BitVec 32))

(assert (=> b!592254 (= res!379012 (= lt!268797 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268802 vacantSpotIndex!68 lt!268806 lt!268801 mask!3053)))))

(assert (=> b!592254 (= lt!268797 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268802 vacantSpotIndex!68 (select (arr!17716 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!592254 (= lt!268806 (select (store (arr!17716 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!268804 () Unit!18541)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36897 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18541)

(assert (=> b!592254 (= lt!268804 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268802 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!592254 (= lt!268802 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!592255 () Bool)

(declare-fun res!379020 () Bool)

(assert (=> b!592255 (=> (not res!379020) (not e!338196))))

(assert (=> b!592255 (= res!379020 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17716 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!54222 res!379023) b!592243))

(assert (= (and b!592243 res!379008) b!592247))

(assert (= (and b!592247 res!379017) b!592249))

(assert (= (and b!592249 res!379019) b!592240))

(assert (= (and b!592240 res!379009) b!592251))

(assert (= (and b!592251 res!379013) b!592242))

(assert (= (and b!592242 res!379016) b!592246))

(assert (= (and b!592246 res!379022) b!592255))

(assert (= (and b!592255 res!379020) b!592237))

(assert (= (and b!592237 res!379014) b!592250))

(assert (= (and b!592250 res!379011) b!592254))

(assert (= (and b!592254 res!379012) b!592245))

(assert (= (and b!592254 c!66983) b!592239))

(assert (= (and b!592254 (not c!66983)) b!592253))

(assert (= (and b!592254 (not res!379015)) b!592241))

(assert (= (and b!592241 res!379021) b!592238))

(assert (= (and b!592238 (not res!379010)) b!592248))

(assert (= (and b!592248 res!379018) b!592244))

(assert (= (and b!592241 (not res!379024)) b!592252))

(declare-fun m!570563 () Bool)

(assert (=> start!54222 m!570563))

(declare-fun m!570565 () Bool)

(assert (=> start!54222 m!570565))

(declare-fun m!570567 () Bool)

(assert (=> b!592248 m!570567))

(assert (=> b!592248 m!570567))

(declare-fun m!570569 () Bool)

(assert (=> b!592248 m!570569))

(declare-fun m!570571 () Bool)

(assert (=> b!592242 m!570571))

(assert (=> b!592238 m!570567))

(declare-fun m!570573 () Bool)

(assert (=> b!592249 m!570573))

(declare-fun m!570575 () Bool)

(assert (=> b!592246 m!570575))

(declare-fun m!570577 () Bool)

(assert (=> b!592251 m!570577))

(declare-fun m!570579 () Bool)

(assert (=> b!592254 m!570579))

(declare-fun m!570581 () Bool)

(assert (=> b!592254 m!570581))

(declare-fun m!570583 () Bool)

(assert (=> b!592254 m!570583))

(assert (=> b!592254 m!570567))

(assert (=> b!592254 m!570567))

(declare-fun m!570585 () Bool)

(assert (=> b!592254 m!570585))

(declare-fun m!570587 () Bool)

(assert (=> b!592254 m!570587))

(declare-fun m!570589 () Bool)

(assert (=> b!592254 m!570589))

(declare-fun m!570591 () Bool)

(assert (=> b!592254 m!570591))

(assert (=> b!592241 m!570567))

(assert (=> b!592241 m!570589))

(declare-fun m!570593 () Bool)

(assert (=> b!592241 m!570593))

(assert (=> b!592244 m!570567))

(assert (=> b!592244 m!570567))

(declare-fun m!570595 () Bool)

(assert (=> b!592244 m!570595))

(declare-fun m!570597 () Bool)

(assert (=> b!592255 m!570597))

(declare-fun m!570599 () Bool)

(assert (=> b!592250 m!570599))

(assert (=> b!592250 m!570567))

(assert (=> b!592250 m!570567))

(declare-fun m!570601 () Bool)

(assert (=> b!592250 m!570601))

(assert (=> b!592247 m!570567))

(assert (=> b!592247 m!570567))

(declare-fun m!570603 () Bool)

(assert (=> b!592247 m!570603))

(assert (=> b!592237 m!570589))

(declare-fun m!570605 () Bool)

(assert (=> b!592237 m!570605))

(declare-fun m!570607 () Bool)

(assert (=> b!592240 m!570607))

(assert (=> b!592252 m!570567))

(assert (=> b!592252 m!570567))

(declare-fun m!570609 () Bool)

(assert (=> b!592252 m!570609))

(assert (=> b!592252 m!570567))

(declare-fun m!570611 () Bool)

(assert (=> b!592252 m!570611))

(check-sat (not b!592242) (not b!592248) (not b!592254) (not b!592251) (not start!54222) (not b!592252) (not b!592244) (not b!592240) (not b!592247) (not b!592246) (not b!592250) (not b!592249))
(check-sat)

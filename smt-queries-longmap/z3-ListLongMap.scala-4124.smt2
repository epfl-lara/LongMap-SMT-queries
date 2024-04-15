; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56274 () Bool)

(assert start!56274)

(declare-fun b!623819 () Bool)

(declare-fun res!402128 () Bool)

(declare-fun e!357765 () Bool)

(assert (=> b!623819 (=> (not res!402128) (not e!357765))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37713 0))(
  ( (array!37714 (arr!18101 (Array (_ BitVec 32) (_ BitVec 64))) (size!18466 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37713)

(assert (=> b!623819 (= res!402128 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18101 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!623820 () Bool)

(declare-fun e!357763 () Bool)

(assert (=> b!623820 (= e!357763 e!357765)))

(declare-fun res!402131 () Bool)

(assert (=> b!623820 (=> (not res!402131) (not e!357765))))

(declare-datatypes ((SeekEntryResult!6538 0))(
  ( (MissingZero!6538 (index!28436 (_ BitVec 32))) (Found!6538 (index!28437 (_ BitVec 32))) (Intermediate!6538 (undefined!7350 Bool) (index!28438 (_ BitVec 32)) (x!57208 (_ BitVec 32))) (Undefined!6538) (MissingVacant!6538 (index!28439 (_ BitVec 32))) )
))
(declare-fun lt!289254 () SeekEntryResult!6538)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!623820 (= res!402131 (or (= lt!289254 (MissingZero!6538 i!1108)) (= lt!289254 (MissingVacant!6538 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37713 (_ BitVec 32)) SeekEntryResult!6538)

(assert (=> b!623820 (= lt!289254 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!623821 () Bool)

(declare-fun e!357761 () Bool)

(declare-fun e!357767 () Bool)

(assert (=> b!623821 (= e!357761 (not e!357767))))

(declare-fun res!402132 () Bool)

(assert (=> b!623821 (=> res!402132 e!357767)))

(declare-fun lt!289258 () SeekEntryResult!6538)

(assert (=> b!623821 (= res!402132 (not (= lt!289258 (Found!6538 index!984))))))

(declare-datatypes ((Unit!21052 0))(
  ( (Unit!21053) )
))
(declare-fun lt!289257 () Unit!21052)

(declare-fun e!357768 () Unit!21052)

(assert (=> b!623821 (= lt!289257 e!357768)))

(declare-fun c!71214 () Bool)

(assert (=> b!623821 (= c!71214 (= lt!289258 Undefined!6538))))

(declare-fun lt!289260 () (_ BitVec 64))

(declare-fun lt!289255 () array!37713)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37713 (_ BitVec 32)) SeekEntryResult!6538)

(assert (=> b!623821 (= lt!289258 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!289260 lt!289255 mask!3053))))

(declare-fun e!357764 () Bool)

(assert (=> b!623821 e!357764))

(declare-fun res!402126 () Bool)

(assert (=> b!623821 (=> (not res!402126) (not e!357764))))

(declare-fun lt!289259 () SeekEntryResult!6538)

(declare-fun lt!289256 () (_ BitVec 32))

(assert (=> b!623821 (= res!402126 (= lt!289259 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!289256 vacantSpotIndex!68 lt!289260 lt!289255 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!623821 (= lt!289259 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!289256 vacantSpotIndex!68 (select (arr!18101 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!623821 (= lt!289260 (select (store (arr!18101 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!289261 () Unit!21052)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37713 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21052)

(assert (=> b!623821 (= lt!289261 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!289256 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!623821 (= lt!289256 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!623823 () Bool)

(declare-fun res!402130 () Bool)

(assert (=> b!623823 (=> (not res!402130) (not e!357765))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37713 (_ BitVec 32)) Bool)

(assert (=> b!623823 (= res!402130 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!623824 () Bool)

(declare-fun Unit!21054 () Unit!21052)

(assert (=> b!623824 (= e!357768 Unit!21054)))

(assert (=> b!623824 false))

(declare-fun b!623825 () Bool)

(declare-fun e!357762 () Bool)

(assert (=> b!623825 (= e!357762 e!357761)))

(declare-fun res!402127 () Bool)

(assert (=> b!623825 (=> (not res!402127) (not e!357761))))

(declare-fun lt!289253 () SeekEntryResult!6538)

(assert (=> b!623825 (= res!402127 (and (= lt!289253 (Found!6538 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18101 a!2986) index!984) (select (arr!18101 a!2986) j!136))) (not (= (select (arr!18101 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!623825 (= lt!289253 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18101 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!623822 () Bool)

(declare-fun res!402136 () Bool)

(assert (=> b!623822 (=> (not res!402136) (not e!357763))))

(assert (=> b!623822 (= res!402136 (and (= (size!18466 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18466 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18466 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!402137 () Bool)

(assert (=> start!56274 (=> (not res!402137) (not e!357763))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56274 (= res!402137 (validMask!0 mask!3053))))

(assert (=> start!56274 e!357763))

(assert (=> start!56274 true))

(declare-fun array_inv!13984 (array!37713) Bool)

(assert (=> start!56274 (array_inv!13984 a!2986)))

(declare-fun b!623826 () Bool)

(declare-fun res!402135 () Bool)

(assert (=> b!623826 (=> (not res!402135) (not e!357763))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!623826 (= res!402135 (validKeyInArray!0 (select (arr!18101 a!2986) j!136)))))

(declare-fun b!623827 () Bool)

(declare-fun res!402133 () Bool)

(assert (=> b!623827 (=> (not res!402133) (not e!357765))))

(declare-datatypes ((List!12181 0))(
  ( (Nil!12178) (Cons!12177 (h!13222 (_ BitVec 64)) (t!18400 List!12181)) )
))
(declare-fun arrayNoDuplicates!0 (array!37713 (_ BitVec 32) List!12181) Bool)

(assert (=> b!623827 (= res!402133 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12178))))

(declare-fun b!623828 () Bool)

(assert (=> b!623828 (= e!357767 (or (not (= (select (arr!18101 a!2986) j!136) lt!289260)) (= (select (arr!18101 a!2986) j!136) (select (store (arr!18101 a!2986) i!1108 k0!1786) index!984))))))

(assert (=> b!623828 (= (select (store (arr!18101 a!2986) i!1108 k0!1786) index!984) (select (arr!18101 a!2986) j!136))))

(declare-fun b!623829 () Bool)

(declare-fun Unit!21055 () Unit!21052)

(assert (=> b!623829 (= e!357768 Unit!21055)))

(declare-fun b!623830 () Bool)

(assert (=> b!623830 (= e!357765 e!357762)))

(declare-fun res!402125 () Bool)

(assert (=> b!623830 (=> (not res!402125) (not e!357762))))

(assert (=> b!623830 (= res!402125 (= (select (store (arr!18101 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!623830 (= lt!289255 (array!37714 (store (arr!18101 a!2986) i!1108 k0!1786) (size!18466 a!2986)))))

(declare-fun b!623831 () Bool)

(assert (=> b!623831 (= e!357764 (= lt!289253 lt!289259))))

(declare-fun b!623832 () Bool)

(declare-fun res!402134 () Bool)

(assert (=> b!623832 (=> (not res!402134) (not e!357763))))

(declare-fun arrayContainsKey!0 (array!37713 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!623832 (= res!402134 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!623833 () Bool)

(declare-fun res!402129 () Bool)

(assert (=> b!623833 (=> (not res!402129) (not e!357763))))

(assert (=> b!623833 (= res!402129 (validKeyInArray!0 k0!1786))))

(assert (= (and start!56274 res!402137) b!623822))

(assert (= (and b!623822 res!402136) b!623826))

(assert (= (and b!623826 res!402135) b!623833))

(assert (= (and b!623833 res!402129) b!623832))

(assert (= (and b!623832 res!402134) b!623820))

(assert (= (and b!623820 res!402131) b!623823))

(assert (= (and b!623823 res!402130) b!623827))

(assert (= (and b!623827 res!402133) b!623819))

(assert (= (and b!623819 res!402128) b!623830))

(assert (= (and b!623830 res!402125) b!623825))

(assert (= (and b!623825 res!402127) b!623821))

(assert (= (and b!623821 res!402126) b!623831))

(assert (= (and b!623821 c!71214) b!623824))

(assert (= (and b!623821 (not c!71214)) b!623829))

(assert (= (and b!623821 (not res!402132)) b!623828))

(declare-fun m!599059 () Bool)

(assert (=> b!623826 m!599059))

(assert (=> b!623826 m!599059))

(declare-fun m!599061 () Bool)

(assert (=> b!623826 m!599061))

(assert (=> b!623828 m!599059))

(declare-fun m!599063 () Bool)

(assert (=> b!623828 m!599063))

(declare-fun m!599065 () Bool)

(assert (=> b!623828 m!599065))

(declare-fun m!599067 () Bool)

(assert (=> b!623819 m!599067))

(declare-fun m!599069 () Bool)

(assert (=> b!623821 m!599069))

(declare-fun m!599071 () Bool)

(assert (=> b!623821 m!599071))

(assert (=> b!623821 m!599059))

(assert (=> b!623821 m!599063))

(assert (=> b!623821 m!599059))

(declare-fun m!599073 () Bool)

(assert (=> b!623821 m!599073))

(declare-fun m!599075 () Bool)

(assert (=> b!623821 m!599075))

(declare-fun m!599077 () Bool)

(assert (=> b!623821 m!599077))

(declare-fun m!599079 () Bool)

(assert (=> b!623821 m!599079))

(declare-fun m!599081 () Bool)

(assert (=> b!623827 m!599081))

(declare-fun m!599083 () Bool)

(assert (=> b!623825 m!599083))

(assert (=> b!623825 m!599059))

(assert (=> b!623825 m!599059))

(declare-fun m!599085 () Bool)

(assert (=> b!623825 m!599085))

(declare-fun m!599087 () Bool)

(assert (=> b!623833 m!599087))

(declare-fun m!599089 () Bool)

(assert (=> b!623820 m!599089))

(declare-fun m!599091 () Bool)

(assert (=> b!623823 m!599091))

(declare-fun m!599093 () Bool)

(assert (=> start!56274 m!599093))

(declare-fun m!599095 () Bool)

(assert (=> start!56274 m!599095))

(declare-fun m!599097 () Bool)

(assert (=> b!623832 m!599097))

(assert (=> b!623830 m!599063))

(declare-fun m!599099 () Bool)

(assert (=> b!623830 m!599099))

(check-sat (not b!623833) (not b!623826) (not start!56274) (not b!623827) (not b!623825) (not b!623823) (not b!623821) (not b!623832) (not b!623820))
(check-sat)

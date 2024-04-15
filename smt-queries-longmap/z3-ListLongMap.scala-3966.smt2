; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53850 () Bool)

(assert start!53850)

(declare-fun b!587244 () Bool)

(declare-fun res!375022 () Bool)

(declare-fun e!335478 () Bool)

(assert (=> b!587244 (=> (not res!375022) (not e!335478))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36708 0))(
  ( (array!36709 (arr!17627 (Array (_ BitVec 32) (_ BitVec 64))) (size!17992 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36708)

(assert (=> b!587244 (= res!375022 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17627 a!2986) index!984) (select (arr!17627 a!2986) j!136))) (not (= (select (arr!17627 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!587245 () Bool)

(declare-fun res!375026 () Bool)

(assert (=> b!587245 (=> (not res!375026) (not e!335478))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36708 (_ BitVec 32)) Bool)

(assert (=> b!587245 (= res!375026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!587246 () Bool)

(declare-fun res!375025 () Bool)

(assert (=> b!587246 (=> (not res!375025) (not e!335478))))

(declare-datatypes ((List!11707 0))(
  ( (Nil!11704) (Cons!11703 (h!12748 (_ BitVec 64)) (t!17926 List!11707)) )
))
(declare-fun arrayNoDuplicates!0 (array!36708 (_ BitVec 32) List!11707) Bool)

(assert (=> b!587246 (= res!375025 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11704))))

(declare-fun res!375032 () Bool)

(declare-fun e!335476 () Bool)

(assert (=> start!53850 (=> (not res!375032) (not e!335476))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53850 (= res!375032 (validMask!0 mask!3053))))

(assert (=> start!53850 e!335476))

(assert (=> start!53850 true))

(declare-fun array_inv!13510 (array!36708) Bool)

(assert (=> start!53850 (array_inv!13510 a!2986)))

(declare-fun b!587247 () Bool)

(declare-fun res!375029 () Bool)

(assert (=> b!587247 (=> (not res!375029) (not e!335476))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!587247 (= res!375029 (validKeyInArray!0 k0!1786))))

(declare-fun b!587248 () Bool)

(assert (=> b!587248 (= e!335478 (not true))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!266188 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6064 0))(
  ( (MissingZero!6064 (index!26486 (_ BitVec 32))) (Found!6064 (index!26487 (_ BitVec 32))) (Intermediate!6064 (undefined!6876 Bool) (index!26488 (_ BitVec 32)) (x!55305 (_ BitVec 32))) (Undefined!6064) (MissingVacant!6064 (index!26489 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36708 (_ BitVec 32)) SeekEntryResult!6064)

(assert (=> b!587248 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266188 vacantSpotIndex!68 (select (arr!17627 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266188 vacantSpotIndex!68 (select (store (arr!17627 a!2986) i!1108 k0!1786) j!136) (array!36709 (store (arr!17627 a!2986) i!1108 k0!1786) (size!17992 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18234 0))(
  ( (Unit!18235) )
))
(declare-fun lt!266187 () Unit!18234)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36708 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18234)

(assert (=> b!587248 (= lt!266187 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266188 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!587248 (= lt!266188 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!587249 () Bool)

(declare-fun res!375024 () Bool)

(assert (=> b!587249 (=> (not res!375024) (not e!335476))))

(assert (=> b!587249 (= res!375024 (and (= (size!17992 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17992 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17992 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!587250 () Bool)

(declare-fun res!375023 () Bool)

(assert (=> b!587250 (=> (not res!375023) (not e!335476))))

(declare-fun arrayContainsKey!0 (array!36708 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!587250 (= res!375023 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!587251 () Bool)

(assert (=> b!587251 (= e!335476 e!335478)))

(declare-fun res!375027 () Bool)

(assert (=> b!587251 (=> (not res!375027) (not e!335478))))

(declare-fun lt!266186 () SeekEntryResult!6064)

(assert (=> b!587251 (= res!375027 (or (= lt!266186 (MissingZero!6064 i!1108)) (= lt!266186 (MissingVacant!6064 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36708 (_ BitVec 32)) SeekEntryResult!6064)

(assert (=> b!587251 (= lt!266186 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!587252 () Bool)

(declare-fun res!375030 () Bool)

(assert (=> b!587252 (=> (not res!375030) (not e!335478))))

(assert (=> b!587252 (= res!375030 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17627 a!2986) j!136) a!2986 mask!3053) (Found!6064 j!136)))))

(declare-fun b!587253 () Bool)

(declare-fun res!375031 () Bool)

(assert (=> b!587253 (=> (not res!375031) (not e!335478))))

(assert (=> b!587253 (= res!375031 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17627 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17627 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!587254 () Bool)

(declare-fun res!375028 () Bool)

(assert (=> b!587254 (=> (not res!375028) (not e!335476))))

(assert (=> b!587254 (= res!375028 (validKeyInArray!0 (select (arr!17627 a!2986) j!136)))))

(assert (= (and start!53850 res!375032) b!587249))

(assert (= (and b!587249 res!375024) b!587254))

(assert (= (and b!587254 res!375028) b!587247))

(assert (= (and b!587247 res!375029) b!587250))

(assert (= (and b!587250 res!375023) b!587251))

(assert (= (and b!587251 res!375027) b!587245))

(assert (= (and b!587245 res!375026) b!587246))

(assert (= (and b!587246 res!375025) b!587253))

(assert (= (and b!587253 res!375031) b!587252))

(assert (= (and b!587252 res!375030) b!587244))

(assert (= (and b!587244 res!375022) b!587248))

(declare-fun m!565141 () Bool)

(assert (=> b!587251 m!565141))

(declare-fun m!565143 () Bool)

(assert (=> b!587254 m!565143))

(assert (=> b!587254 m!565143))

(declare-fun m!565145 () Bool)

(assert (=> b!587254 m!565145))

(declare-fun m!565147 () Bool)

(assert (=> b!587246 m!565147))

(declare-fun m!565149 () Bool)

(assert (=> start!53850 m!565149))

(declare-fun m!565151 () Bool)

(assert (=> start!53850 m!565151))

(assert (=> b!587252 m!565143))

(assert (=> b!587252 m!565143))

(declare-fun m!565153 () Bool)

(assert (=> b!587252 m!565153))

(declare-fun m!565155 () Bool)

(assert (=> b!587253 m!565155))

(declare-fun m!565157 () Bool)

(assert (=> b!587253 m!565157))

(declare-fun m!565159 () Bool)

(assert (=> b!587253 m!565159))

(declare-fun m!565161 () Bool)

(assert (=> b!587247 m!565161))

(declare-fun m!565163 () Bool)

(assert (=> b!587248 m!565163))

(declare-fun m!565165 () Bool)

(assert (=> b!587248 m!565165))

(declare-fun m!565167 () Bool)

(assert (=> b!587248 m!565167))

(assert (=> b!587248 m!565143))

(declare-fun m!565169 () Bool)

(assert (=> b!587248 m!565169))

(assert (=> b!587248 m!565143))

(assert (=> b!587248 m!565157))

(assert (=> b!587248 m!565167))

(declare-fun m!565171 () Bool)

(assert (=> b!587248 m!565171))

(declare-fun m!565173 () Bool)

(assert (=> b!587244 m!565173))

(assert (=> b!587244 m!565143))

(declare-fun m!565175 () Bool)

(assert (=> b!587250 m!565175))

(declare-fun m!565177 () Bool)

(assert (=> b!587245 m!565177))

(check-sat (not b!587250) (not start!53850) (not b!587254) (not b!587248) (not b!587251) (not b!587247) (not b!587246) (not b!587245) (not b!587252))
(check-sat)

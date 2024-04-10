; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54178 () Bool)

(assert start!54178)

(declare-fun b!592199 () Bool)

(declare-fun res!379059 () Bool)

(declare-fun e!338167 () Bool)

(assert (=> b!592199 (=> (not res!379059) (not e!338167))))

(declare-datatypes ((array!36908 0))(
  ( (array!36909 (arr!17724 (Array (_ BitVec 32) (_ BitVec 64))) (size!18088 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36908)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36908 (_ BitVec 32)) Bool)

(assert (=> b!592199 (= res!379059 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!592200 () Bool)

(declare-fun res!379066 () Bool)

(declare-fun e!338168 () Bool)

(assert (=> b!592200 (=> (not res!379066) (not e!338168))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36908 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!592200 (= res!379066 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!592201 () Bool)

(declare-fun res!379057 () Bool)

(assert (=> b!592201 (=> (not res!379057) (not e!338168))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!592201 (= res!379057 (validKeyInArray!0 k!1786))))

(declare-fun b!592202 () Bool)

(declare-fun e!338171 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!592202 (= e!338171 (or (bvslt (bvadd #b00000000000000000000000000000001 j!136) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 j!136) (size!18088 a!2986))))))

(declare-fun lt!268802 () array!36908)

(assert (=> b!592202 (arrayContainsKey!0 lt!268802 (select (arr!17724 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-datatypes ((Unit!18574 0))(
  ( (Unit!18575) )
))
(declare-fun lt!268795 () Unit!18574)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36908 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18574)

(assert (=> b!592202 (= lt!268795 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!268802 (select (arr!17724 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!592203 () Bool)

(declare-fun e!338173 () Bool)

(declare-fun e!338170 () Bool)

(assert (=> b!592203 (= e!338173 e!338170)))

(declare-fun res!379065 () Bool)

(assert (=> b!592203 (=> res!379065 e!338170)))

(declare-fun lt!268804 () (_ BitVec 64))

(declare-fun lt!268797 () (_ BitVec 64))

(assert (=> b!592203 (= res!379065 (or (not (= (select (arr!17724 a!2986) j!136) lt!268804)) (not (= (select (arr!17724 a!2986) j!136) lt!268797)) (bvsge j!136 index!984)))))

(declare-fun b!592204 () Bool)

(declare-fun e!338172 () Bool)

(assert (=> b!592204 (= e!338170 e!338172)))

(declare-fun res!379067 () Bool)

(assert (=> b!592204 (=> (not res!379067) (not e!338172))))

(assert (=> b!592204 (= res!379067 (arrayContainsKey!0 lt!268802 (select (arr!17724 a!2986) j!136) j!136))))

(declare-fun b!592205 () Bool)

(declare-fun e!338176 () Bool)

(declare-fun e!338178 () Bool)

(assert (=> b!592205 (= e!338176 (not e!338178))))

(declare-fun res!379071 () Bool)

(assert (=> b!592205 (=> res!379071 e!338178)))

(declare-datatypes ((SeekEntryResult!6164 0))(
  ( (MissingZero!6164 (index!26892 (_ BitVec 32))) (Found!6164 (index!26893 (_ BitVec 32))) (Intermediate!6164 (undefined!6976 Bool) (index!26894 (_ BitVec 32)) (x!55684 (_ BitVec 32))) (Undefined!6164) (MissingVacant!6164 (index!26895 (_ BitVec 32))) )
))
(declare-fun lt!268794 () SeekEntryResult!6164)

(assert (=> b!592205 (= res!379071 (not (= lt!268794 (Found!6164 index!984))))))

(declare-fun lt!268803 () Unit!18574)

(declare-fun e!338174 () Unit!18574)

(assert (=> b!592205 (= lt!268803 e!338174)))

(declare-fun c!66938 () Bool)

(assert (=> b!592205 (= c!66938 (= lt!268794 Undefined!6164))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36908 (_ BitVec 32)) SeekEntryResult!6164)

(assert (=> b!592205 (= lt!268794 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268804 lt!268802 mask!3053))))

(declare-fun e!338177 () Bool)

(assert (=> b!592205 e!338177))

(declare-fun res!379061 () Bool)

(assert (=> b!592205 (=> (not res!379061) (not e!338177))))

(declare-fun lt!268796 () SeekEntryResult!6164)

(declare-fun lt!268801 () (_ BitVec 32))

(assert (=> b!592205 (= res!379061 (= lt!268796 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268801 vacantSpotIndex!68 lt!268804 lt!268802 mask!3053)))))

(assert (=> b!592205 (= lt!268796 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268801 vacantSpotIndex!68 (select (arr!17724 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!592205 (= lt!268804 (select (store (arr!17724 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!268798 () Unit!18574)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36908 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18574)

(assert (=> b!592205 (= lt!268798 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268801 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!592205 (= lt!268801 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!379062 () Bool)

(assert (=> start!54178 (=> (not res!379062) (not e!338168))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54178 (= res!379062 (validMask!0 mask!3053))))

(assert (=> start!54178 e!338168))

(assert (=> start!54178 true))

(declare-fun array_inv!13520 (array!36908) Bool)

(assert (=> start!54178 (array_inv!13520 a!2986)))

(declare-fun b!592206 () Bool)

(declare-fun e!338175 () Bool)

(assert (=> b!592206 (= e!338175 e!338176)))

(declare-fun res!379060 () Bool)

(assert (=> b!592206 (=> (not res!379060) (not e!338176))))

(declare-fun lt!268799 () SeekEntryResult!6164)

(assert (=> b!592206 (= res!379060 (and (= lt!268799 (Found!6164 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17724 a!2986) index!984) (select (arr!17724 a!2986) j!136))) (not (= (select (arr!17724 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!592206 (= lt!268799 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17724 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!592207 () Bool)

(declare-fun Unit!18576 () Unit!18574)

(assert (=> b!592207 (= e!338174 Unit!18576)))

(declare-fun b!592208 () Bool)

(declare-fun res!379058 () Bool)

(assert (=> b!592208 (=> (not res!379058) (not e!338167))))

(declare-datatypes ((List!11765 0))(
  ( (Nil!11762) (Cons!11761 (h!12806 (_ BitVec 64)) (t!17993 List!11765)) )
))
(declare-fun arrayNoDuplicates!0 (array!36908 (_ BitVec 32) List!11765) Bool)

(assert (=> b!592208 (= res!379058 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11762))))

(declare-fun b!592209 () Bool)

(assert (=> b!592209 (= e!338177 (= lt!268799 lt!268796))))

(declare-fun b!592210 () Bool)

(declare-fun res!379069 () Bool)

(assert (=> b!592210 (=> (not res!379069) (not e!338168))))

(assert (=> b!592210 (= res!379069 (and (= (size!18088 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18088 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18088 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!592211 () Bool)

(declare-fun res!379072 () Bool)

(assert (=> b!592211 (=> (not res!379072) (not e!338167))))

(assert (=> b!592211 (= res!379072 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17724 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!592212 () Bool)

(assert (=> b!592212 (= e!338172 (arrayContainsKey!0 lt!268802 (select (arr!17724 a!2986) j!136) index!984))))

(declare-fun b!592213 () Bool)

(assert (=> b!592213 (= e!338168 e!338167)))

(declare-fun res!379070 () Bool)

(assert (=> b!592213 (=> (not res!379070) (not e!338167))))

(declare-fun lt!268800 () SeekEntryResult!6164)

(assert (=> b!592213 (= res!379070 (or (= lt!268800 (MissingZero!6164 i!1108)) (= lt!268800 (MissingVacant!6164 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36908 (_ BitVec 32)) SeekEntryResult!6164)

(assert (=> b!592213 (= lt!268800 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!592214 () Bool)

(declare-fun Unit!18577 () Unit!18574)

(assert (=> b!592214 (= e!338174 Unit!18577)))

(assert (=> b!592214 false))

(declare-fun b!592215 () Bool)

(assert (=> b!592215 (= e!338178 e!338171)))

(declare-fun res!379068 () Bool)

(assert (=> b!592215 (=> res!379068 e!338171)))

(assert (=> b!592215 (= res!379068 (or (not (= (select (arr!17724 a!2986) j!136) lt!268804)) (not (= (select (arr!17724 a!2986) j!136) lt!268797)) (bvsge j!136 index!984)))))

(assert (=> b!592215 e!338173))

(declare-fun res!379064 () Bool)

(assert (=> b!592215 (=> (not res!379064) (not e!338173))))

(assert (=> b!592215 (= res!379064 (= lt!268797 (select (arr!17724 a!2986) j!136)))))

(assert (=> b!592215 (= lt!268797 (select (store (arr!17724 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!592216 () Bool)

(declare-fun res!379063 () Bool)

(assert (=> b!592216 (=> (not res!379063) (not e!338168))))

(assert (=> b!592216 (= res!379063 (validKeyInArray!0 (select (arr!17724 a!2986) j!136)))))

(declare-fun b!592217 () Bool)

(assert (=> b!592217 (= e!338167 e!338175)))

(declare-fun res!379073 () Bool)

(assert (=> b!592217 (=> (not res!379073) (not e!338175))))

(assert (=> b!592217 (= res!379073 (= (select (store (arr!17724 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!592217 (= lt!268802 (array!36909 (store (arr!17724 a!2986) i!1108 k!1786) (size!18088 a!2986)))))

(assert (= (and start!54178 res!379062) b!592210))

(assert (= (and b!592210 res!379069) b!592216))

(assert (= (and b!592216 res!379063) b!592201))

(assert (= (and b!592201 res!379057) b!592200))

(assert (= (and b!592200 res!379066) b!592213))

(assert (= (and b!592213 res!379070) b!592199))

(assert (= (and b!592199 res!379059) b!592208))

(assert (= (and b!592208 res!379058) b!592211))

(assert (= (and b!592211 res!379072) b!592217))

(assert (= (and b!592217 res!379073) b!592206))

(assert (= (and b!592206 res!379060) b!592205))

(assert (= (and b!592205 res!379061) b!592209))

(assert (= (and b!592205 c!66938) b!592214))

(assert (= (and b!592205 (not c!66938)) b!592207))

(assert (= (and b!592205 (not res!379071)) b!592215))

(assert (= (and b!592215 res!379064) b!592203))

(assert (= (and b!592203 (not res!379065)) b!592204))

(assert (= (and b!592204 res!379067) b!592212))

(assert (= (and b!592215 (not res!379068)) b!592202))

(declare-fun m!570337 () Bool)

(assert (=> b!592199 m!570337))

(declare-fun m!570339 () Bool)

(assert (=> b!592203 m!570339))

(declare-fun m!570341 () Bool)

(assert (=> b!592205 m!570341))

(assert (=> b!592205 m!570339))

(declare-fun m!570343 () Bool)

(assert (=> b!592205 m!570343))

(declare-fun m!570345 () Bool)

(assert (=> b!592205 m!570345))

(declare-fun m!570347 () Bool)

(assert (=> b!592205 m!570347))

(declare-fun m!570349 () Bool)

(assert (=> b!592205 m!570349))

(assert (=> b!592205 m!570339))

(declare-fun m!570351 () Bool)

(assert (=> b!592205 m!570351))

(declare-fun m!570353 () Bool)

(assert (=> b!592205 m!570353))

(assert (=> b!592216 m!570339))

(assert (=> b!592216 m!570339))

(declare-fun m!570355 () Bool)

(assert (=> b!592216 m!570355))

(declare-fun m!570357 () Bool)

(assert (=> start!54178 m!570357))

(declare-fun m!570359 () Bool)

(assert (=> start!54178 m!570359))

(assert (=> b!592217 m!570345))

(declare-fun m!570361 () Bool)

(assert (=> b!592217 m!570361))

(declare-fun m!570363 () Bool)

(assert (=> b!592200 m!570363))

(declare-fun m!570365 () Bool)

(assert (=> b!592208 m!570365))

(assert (=> b!592212 m!570339))

(assert (=> b!592212 m!570339))

(declare-fun m!570367 () Bool)

(assert (=> b!592212 m!570367))

(declare-fun m!570369 () Bool)

(assert (=> b!592201 m!570369))

(assert (=> b!592215 m!570339))

(assert (=> b!592215 m!570345))

(declare-fun m!570371 () Bool)

(assert (=> b!592215 m!570371))

(assert (=> b!592204 m!570339))

(assert (=> b!592204 m!570339))

(declare-fun m!570373 () Bool)

(assert (=> b!592204 m!570373))

(declare-fun m!570375 () Bool)

(assert (=> b!592213 m!570375))

(declare-fun m!570377 () Bool)

(assert (=> b!592206 m!570377))

(assert (=> b!592206 m!570339))

(assert (=> b!592206 m!570339))

(declare-fun m!570379 () Bool)

(assert (=> b!592206 m!570379))

(assert (=> b!592202 m!570339))

(assert (=> b!592202 m!570339))

(declare-fun m!570381 () Bool)

(assert (=> b!592202 m!570381))

(assert (=> b!592202 m!570339))

(declare-fun m!570383 () Bool)

(assert (=> b!592202 m!570383))

(declare-fun m!570385 () Bool)

(assert (=> b!592211 m!570385))

(push 1)

(assert (not b!592206))

(assert (not b!592204))

(assert (not b!592200))

(assert (not b!592208))

(assert (not b!592205))

(assert (not b!592212))

(assert (not b!592213))

(assert (not b!592199))

(assert (not b!592202))

(assert (not start!54178))

(assert (not b!592201))

(assert (not b!592216))

(check-sat)

(pop 1)

(push 1)

(check-sat)


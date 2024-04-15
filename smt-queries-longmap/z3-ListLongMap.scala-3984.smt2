; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53958 () Bool)

(assert start!53958)

(declare-fun b!589232 () Bool)

(declare-fun e!336378 () Bool)

(declare-fun e!336384 () Bool)

(assert (=> b!589232 (= e!336378 (not e!336384))))

(declare-fun res!376884 () Bool)

(assert (=> b!589232 (=> res!376884 e!336384)))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!589232 (= res!376884 (bvslt mask!3053 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!18384 0))(
  ( (Unit!18385) )
))
(declare-fun lt!267143 () Unit!18384)

(declare-fun e!336377 () Unit!18384)

(assert (=> b!589232 (= lt!267143 e!336377)))

(declare-fun c!66543 () Bool)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!36816 0))(
  ( (array!36817 (arr!17681 (Array (_ BitVec 32) (_ BitVec 64))) (size!18046 (_ BitVec 32))) )
))
(declare-fun lt!267147 () array!36816)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lt!267146 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!6118 0))(
  ( (MissingZero!6118 (index!26702 (_ BitVec 32))) (Found!6118 (index!26703 (_ BitVec 32))) (Intermediate!6118 (undefined!6930 Bool) (index!26704 (_ BitVec 32)) (x!55503 (_ BitVec 32))) (Undefined!6118) (MissingVacant!6118 (index!26705 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36816 (_ BitVec 32)) SeekEntryResult!6118)

(assert (=> b!589232 (= c!66543 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267146 lt!267147 mask!3053) Undefined!6118))))

(declare-fun e!336382 () Bool)

(assert (=> b!589232 e!336382))

(declare-fun res!376890 () Bool)

(assert (=> b!589232 (=> (not res!376890) (not e!336382))))

(declare-fun lt!267141 () SeekEntryResult!6118)

(declare-fun lt!267142 () (_ BitVec 32))

(assert (=> b!589232 (= res!376890 (= lt!267141 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267142 vacantSpotIndex!68 lt!267146 lt!267147 mask!3053)))))

(declare-fun a!2986 () array!36816)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!589232 (= lt!267141 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267142 vacantSpotIndex!68 (select (arr!17681 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!589232 (= lt!267146 (select (store (arr!17681 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!267145 () Unit!18384)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36816 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18384)

(assert (=> b!589232 (= lt!267145 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267142 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!589232 (= lt!267142 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!589233 () Bool)

(declare-fun e!336379 () Bool)

(declare-fun e!336383 () Bool)

(assert (=> b!589233 (= e!336379 e!336383)))

(declare-fun res!376891 () Bool)

(assert (=> b!589233 (=> (not res!376891) (not e!336383))))

(assert (=> b!589233 (= res!376891 (= (select (store (arr!17681 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!589233 (= lt!267147 (array!36817 (store (arr!17681 a!2986) i!1108 k0!1786) (size!18046 a!2986)))))

(declare-fun b!589234 () Bool)

(declare-fun res!376885 () Bool)

(declare-fun e!336381 () Bool)

(assert (=> b!589234 (=> (not res!376885) (not e!336381))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!589234 (= res!376885 (validKeyInArray!0 (select (arr!17681 a!2986) j!136)))))

(declare-fun b!589235 () Bool)

(declare-fun res!376886 () Bool)

(assert (=> b!589235 (=> (not res!376886) (not e!336379))))

(declare-datatypes ((List!11761 0))(
  ( (Nil!11758) (Cons!11757 (h!12802 (_ BitVec 64)) (t!17980 List!11761)) )
))
(declare-fun arrayNoDuplicates!0 (array!36816 (_ BitVec 32) List!11761) Bool)

(assert (=> b!589235 (= res!376886 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11758))))

(declare-fun b!589236 () Bool)

(declare-fun lt!267144 () SeekEntryResult!6118)

(assert (=> b!589236 (= e!336382 (= lt!267144 lt!267141))))

(declare-fun b!589237 () Bool)

(assert (=> b!589237 (= e!336384 (validKeyInArray!0 lt!267146))))

(declare-fun b!589238 () Bool)

(declare-fun res!376883 () Bool)

(assert (=> b!589238 (=> (not res!376883) (not e!336381))))

(assert (=> b!589238 (= res!376883 (and (= (size!18046 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18046 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18046 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!376887 () Bool)

(assert (=> start!53958 (=> (not res!376887) (not e!336381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53958 (= res!376887 (validMask!0 mask!3053))))

(assert (=> start!53958 e!336381))

(assert (=> start!53958 true))

(declare-fun array_inv!13564 (array!36816) Bool)

(assert (=> start!53958 (array_inv!13564 a!2986)))

(declare-fun b!589239 () Bool)

(declare-fun res!376889 () Bool)

(assert (=> b!589239 (=> (not res!376889) (not e!336381))))

(assert (=> b!589239 (= res!376889 (validKeyInArray!0 k0!1786))))

(declare-fun b!589240 () Bool)

(declare-fun Unit!18386 () Unit!18384)

(assert (=> b!589240 (= e!336377 Unit!18386)))

(declare-fun b!589241 () Bool)

(declare-fun res!376881 () Bool)

(assert (=> b!589241 (=> (not res!376881) (not e!336379))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36816 (_ BitVec 32)) Bool)

(assert (=> b!589241 (= res!376881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!589242 () Bool)

(assert (=> b!589242 (= e!336383 e!336378)))

(declare-fun res!376888 () Bool)

(assert (=> b!589242 (=> (not res!376888) (not e!336378))))

(assert (=> b!589242 (= res!376888 (and (= lt!267144 (Found!6118 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17681 a!2986) index!984) (select (arr!17681 a!2986) j!136))) (not (= (select (arr!17681 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!589242 (= lt!267144 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17681 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!589243 () Bool)

(declare-fun Unit!18387 () Unit!18384)

(assert (=> b!589243 (= e!336377 Unit!18387)))

(assert (=> b!589243 false))

(declare-fun b!589244 () Bool)

(declare-fun res!376892 () Bool)

(assert (=> b!589244 (=> (not res!376892) (not e!336381))))

(declare-fun arrayContainsKey!0 (array!36816 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!589244 (= res!376892 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!589245 () Bool)

(declare-fun res!376882 () Bool)

(assert (=> b!589245 (=> (not res!376882) (not e!336379))))

(assert (=> b!589245 (= res!376882 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17681 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!589246 () Bool)

(assert (=> b!589246 (= e!336381 e!336379)))

(declare-fun res!376880 () Bool)

(assert (=> b!589246 (=> (not res!376880) (not e!336379))))

(declare-fun lt!267148 () SeekEntryResult!6118)

(assert (=> b!589246 (= res!376880 (or (= lt!267148 (MissingZero!6118 i!1108)) (= lt!267148 (MissingVacant!6118 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36816 (_ BitVec 32)) SeekEntryResult!6118)

(assert (=> b!589246 (= lt!267148 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!53958 res!376887) b!589238))

(assert (= (and b!589238 res!376883) b!589234))

(assert (= (and b!589234 res!376885) b!589239))

(assert (= (and b!589239 res!376889) b!589244))

(assert (= (and b!589244 res!376892) b!589246))

(assert (= (and b!589246 res!376880) b!589241))

(assert (= (and b!589241 res!376881) b!589235))

(assert (= (and b!589235 res!376886) b!589245))

(assert (= (and b!589245 res!376882) b!589233))

(assert (= (and b!589233 res!376891) b!589242))

(assert (= (and b!589242 res!376888) b!589232))

(assert (= (and b!589232 res!376890) b!589236))

(assert (= (and b!589232 c!66543) b!589243))

(assert (= (and b!589232 (not c!66543)) b!589240))

(assert (= (and b!589232 (not res!376884)) b!589237))

(declare-fun m!567241 () Bool)

(assert (=> b!589233 m!567241))

(declare-fun m!567243 () Bool)

(assert (=> b!589233 m!567243))

(declare-fun m!567245 () Bool)

(assert (=> b!589232 m!567245))

(declare-fun m!567247 () Bool)

(assert (=> b!589232 m!567247))

(declare-fun m!567249 () Bool)

(assert (=> b!589232 m!567249))

(assert (=> b!589232 m!567241))

(declare-fun m!567251 () Bool)

(assert (=> b!589232 m!567251))

(declare-fun m!567253 () Bool)

(assert (=> b!589232 m!567253))

(assert (=> b!589232 m!567249))

(declare-fun m!567255 () Bool)

(assert (=> b!589232 m!567255))

(declare-fun m!567257 () Bool)

(assert (=> b!589232 m!567257))

(declare-fun m!567259 () Bool)

(assert (=> b!589245 m!567259))

(declare-fun m!567261 () Bool)

(assert (=> b!589244 m!567261))

(declare-fun m!567263 () Bool)

(assert (=> b!589237 m!567263))

(declare-fun m!567265 () Bool)

(assert (=> b!589235 m!567265))

(declare-fun m!567267 () Bool)

(assert (=> b!589239 m!567267))

(declare-fun m!567269 () Bool)

(assert (=> start!53958 m!567269))

(declare-fun m!567271 () Bool)

(assert (=> start!53958 m!567271))

(declare-fun m!567273 () Bool)

(assert (=> b!589241 m!567273))

(assert (=> b!589234 m!567249))

(assert (=> b!589234 m!567249))

(declare-fun m!567275 () Bool)

(assert (=> b!589234 m!567275))

(declare-fun m!567277 () Bool)

(assert (=> b!589246 m!567277))

(declare-fun m!567279 () Bool)

(assert (=> b!589242 m!567279))

(assert (=> b!589242 m!567249))

(assert (=> b!589242 m!567249))

(declare-fun m!567281 () Bool)

(assert (=> b!589242 m!567281))

(check-sat (not b!589235) (not b!589239) (not b!589241) (not b!589234) (not start!53958) (not b!589232) (not b!589242) (not b!589237) (not b!589246) (not b!589244))
(check-sat)

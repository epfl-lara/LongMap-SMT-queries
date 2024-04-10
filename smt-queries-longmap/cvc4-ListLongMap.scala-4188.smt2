; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57108 () Bool)

(assert start!57108)

(declare-fun b!632262 () Bool)

(declare-fun res!408888 () Bool)

(declare-fun e!361478 () Bool)

(assert (=> b!632262 (=> (not res!408888) (not e!361478))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!632262 (= res!408888 (validKeyInArray!0 k!1786))))

(declare-fun b!632263 () Bool)

(declare-fun res!408892 () Bool)

(assert (=> b!632263 (=> (not res!408892) (not e!361478))))

(declare-datatypes ((array!38127 0))(
  ( (array!38128 (arr!18296 (Array (_ BitVec 32) (_ BitVec 64))) (size!18660 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38127)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!632263 (= res!408892 (validKeyInArray!0 (select (arr!18296 a!2986) j!136)))))

(declare-fun b!632264 () Bool)

(declare-fun e!361475 () Bool)

(declare-fun e!361479 () Bool)

(assert (=> b!632264 (= e!361475 e!361479)))

(declare-fun res!408887 () Bool)

(assert (=> b!632264 (=> (not res!408887) (not e!361479))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6736 0))(
  ( (MissingZero!6736 (index!29237 (_ BitVec 32))) (Found!6736 (index!29238 (_ BitVec 32))) (Intermediate!6736 (undefined!7548 Bool) (index!29239 (_ BitVec 32)) (x!57971 (_ BitVec 32))) (Undefined!6736) (MissingVacant!6736 (index!29240 (_ BitVec 32))) )
))
(declare-fun lt!292185 () SeekEntryResult!6736)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!632264 (= res!408887 (and (= lt!292185 (Found!6736 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18296 a!2986) index!984) (select (arr!18296 a!2986) j!136))) (not (= (select (arr!18296 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38127 (_ BitVec 32)) SeekEntryResult!6736)

(assert (=> b!632264 (= lt!292185 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18296 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!632265 () Bool)

(declare-fun e!361481 () Bool)

(assert (=> b!632265 (= e!361478 e!361481)))

(declare-fun res!408885 () Bool)

(assert (=> b!632265 (=> (not res!408885) (not e!361481))))

(declare-fun lt!292188 () SeekEntryResult!6736)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!632265 (= res!408885 (or (= lt!292188 (MissingZero!6736 i!1108)) (= lt!292188 (MissingVacant!6736 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38127 (_ BitVec 32)) SeekEntryResult!6736)

(assert (=> b!632265 (= lt!292188 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!632266 () Bool)

(declare-fun res!408886 () Bool)

(assert (=> b!632266 (=> (not res!408886) (not e!361478))))

(declare-fun arrayContainsKey!0 (array!38127 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!632266 (= res!408886 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!632267 () Bool)

(assert (=> b!632267 (= e!361481 e!361475)))

(declare-fun res!408890 () Bool)

(assert (=> b!632267 (=> (not res!408890) (not e!361475))))

(assert (=> b!632267 (= res!408890 (= (select (store (arr!18296 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!292184 () array!38127)

(assert (=> b!632267 (= lt!292184 (array!38128 (store (arr!18296 a!2986) i!1108 k!1786) (size!18660 a!2986)))))

(declare-fun b!632268 () Bool)

(declare-fun res!408896 () Bool)

(assert (=> b!632268 (=> (not res!408896) (not e!361481))))

(assert (=> b!632268 (= res!408896 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18296 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!632270 () Bool)

(declare-fun res!408891 () Bool)

(assert (=> b!632270 (=> (not res!408891) (not e!361478))))

(assert (=> b!632270 (= res!408891 (and (= (size!18660 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18660 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18660 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!632271 () Bool)

(declare-fun e!361476 () Bool)

(declare-fun lt!292192 () SeekEntryResult!6736)

(assert (=> b!632271 (= e!361476 (= lt!292185 lt!292192))))

(declare-fun b!632272 () Bool)

(declare-datatypes ((Unit!21278 0))(
  ( (Unit!21279) )
))
(declare-fun e!361480 () Unit!21278)

(declare-fun Unit!21280 () Unit!21278)

(assert (=> b!632272 (= e!361480 Unit!21280)))

(assert (=> b!632272 false))

(declare-fun b!632273 () Bool)

(declare-fun Unit!21281 () Unit!21278)

(assert (=> b!632273 (= e!361480 Unit!21281)))

(declare-fun b!632274 () Bool)

(declare-fun res!408893 () Bool)

(assert (=> b!632274 (=> (not res!408893) (not e!361481))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38127 (_ BitVec 32)) Bool)

(assert (=> b!632274 (= res!408893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!632269 () Bool)

(declare-fun res!408884 () Bool)

(assert (=> b!632269 (=> (not res!408884) (not e!361481))))

(declare-datatypes ((List!12337 0))(
  ( (Nil!12334) (Cons!12333 (h!13378 (_ BitVec 64)) (t!18565 List!12337)) )
))
(declare-fun arrayNoDuplicates!0 (array!38127 (_ BitVec 32) List!12337) Bool)

(assert (=> b!632269 (= res!408884 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12334))))

(declare-fun res!408895 () Bool)

(assert (=> start!57108 (=> (not res!408895) (not e!361478))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57108 (= res!408895 (validMask!0 mask!3053))))

(assert (=> start!57108 e!361478))

(assert (=> start!57108 true))

(declare-fun array_inv!14092 (array!38127) Bool)

(assert (=> start!57108 (array_inv!14092 a!2986)))

(declare-fun b!632275 () Bool)

(declare-fun e!361477 () Bool)

(assert (=> b!632275 (= e!361479 (not e!361477))))

(declare-fun res!408889 () Bool)

(assert (=> b!632275 (=> res!408889 e!361477)))

(declare-fun lt!292189 () SeekEntryResult!6736)

(assert (=> b!632275 (= res!408889 (not (= lt!292189 (Found!6736 index!984))))))

(declare-fun lt!292187 () Unit!21278)

(assert (=> b!632275 (= lt!292187 e!361480)))

(declare-fun c!72056 () Bool)

(assert (=> b!632275 (= c!72056 (= lt!292189 Undefined!6736))))

(declare-fun lt!292186 () (_ BitVec 64))

(assert (=> b!632275 (= lt!292189 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292186 lt!292184 mask!3053))))

(assert (=> b!632275 e!361476))

(declare-fun res!408894 () Bool)

(assert (=> b!632275 (=> (not res!408894) (not e!361476))))

(declare-fun lt!292191 () (_ BitVec 32))

(assert (=> b!632275 (= res!408894 (= lt!292192 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292191 vacantSpotIndex!68 lt!292186 lt!292184 mask!3053)))))

(assert (=> b!632275 (= lt!292192 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292191 vacantSpotIndex!68 (select (arr!18296 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!632275 (= lt!292186 (select (store (arr!18296 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!292190 () Unit!21278)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38127 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21278)

(assert (=> b!632275 (= lt!292190 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292191 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!632275 (= lt!292191 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!632276 () Bool)

(assert (=> b!632276 (= e!361477 true)))

(assert (=> b!632276 (= (select (store (arr!18296 a!2986) i!1108 k!1786) index!984) (select (arr!18296 a!2986) j!136))))

(assert (= (and start!57108 res!408895) b!632270))

(assert (= (and b!632270 res!408891) b!632263))

(assert (= (and b!632263 res!408892) b!632262))

(assert (= (and b!632262 res!408888) b!632266))

(assert (= (and b!632266 res!408886) b!632265))

(assert (= (and b!632265 res!408885) b!632274))

(assert (= (and b!632274 res!408893) b!632269))

(assert (= (and b!632269 res!408884) b!632268))

(assert (= (and b!632268 res!408896) b!632267))

(assert (= (and b!632267 res!408890) b!632264))

(assert (= (and b!632264 res!408887) b!632275))

(assert (= (and b!632275 res!408894) b!632271))

(assert (= (and b!632275 c!72056) b!632272))

(assert (= (and b!632275 (not c!72056)) b!632273))

(assert (= (and b!632275 (not res!408889)) b!632276))

(declare-fun m!607101 () Bool)

(assert (=> b!632265 m!607101))

(declare-fun m!607103 () Bool)

(assert (=> b!632267 m!607103))

(declare-fun m!607105 () Bool)

(assert (=> b!632267 m!607105))

(declare-fun m!607107 () Bool)

(assert (=> start!57108 m!607107))

(declare-fun m!607109 () Bool)

(assert (=> start!57108 m!607109))

(declare-fun m!607111 () Bool)

(assert (=> b!632274 m!607111))

(declare-fun m!607113 () Bool)

(assert (=> b!632263 m!607113))

(assert (=> b!632263 m!607113))

(declare-fun m!607115 () Bool)

(assert (=> b!632263 m!607115))

(declare-fun m!607117 () Bool)

(assert (=> b!632262 m!607117))

(declare-fun m!607119 () Bool)

(assert (=> b!632268 m!607119))

(declare-fun m!607121 () Bool)

(assert (=> b!632266 m!607121))

(assert (=> b!632276 m!607103))

(declare-fun m!607123 () Bool)

(assert (=> b!632276 m!607123))

(assert (=> b!632276 m!607113))

(declare-fun m!607125 () Bool)

(assert (=> b!632269 m!607125))

(declare-fun m!607127 () Bool)

(assert (=> b!632275 m!607127))

(declare-fun m!607129 () Bool)

(assert (=> b!632275 m!607129))

(assert (=> b!632275 m!607113))

(assert (=> b!632275 m!607103))

(declare-fun m!607131 () Bool)

(assert (=> b!632275 m!607131))

(declare-fun m!607133 () Bool)

(assert (=> b!632275 m!607133))

(declare-fun m!607135 () Bool)

(assert (=> b!632275 m!607135))

(assert (=> b!632275 m!607113))

(declare-fun m!607137 () Bool)

(assert (=> b!632275 m!607137))

(declare-fun m!607139 () Bool)

(assert (=> b!632264 m!607139))

(assert (=> b!632264 m!607113))

(assert (=> b!632264 m!607113))

(declare-fun m!607141 () Bool)

(assert (=> b!632264 m!607141))

(push 1)


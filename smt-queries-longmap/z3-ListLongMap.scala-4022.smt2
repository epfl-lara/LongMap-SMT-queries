; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54840 () Bool)

(assert start!54840)

(declare-fun b!599036 () Bool)

(declare-datatypes ((Unit!18866 0))(
  ( (Unit!18867) )
))
(declare-fun e!342457 () Unit!18866)

(declare-fun Unit!18868 () Unit!18866)

(assert (=> b!599036 (= e!342457 Unit!18868)))

(assert (=> b!599036 false))

(declare-fun b!599037 () Bool)

(declare-fun res!384058 () Bool)

(declare-fun e!342455 () Bool)

(assert (=> b!599037 (=> (not res!384058) (not e!342455))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37075 0))(
  ( (array!37076 (arr!17797 (Array (_ BitVec 32) (_ BitVec 64))) (size!18161 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37075)

(assert (=> b!599037 (= res!384058 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17797 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!599038 () Bool)

(declare-fun e!342464 () Bool)

(assert (=> b!599038 (= e!342464 e!342455)))

(declare-fun res!384064 () Bool)

(assert (=> b!599038 (=> (not res!384064) (not e!342455))))

(declare-datatypes ((SeekEntryResult!6237 0))(
  ( (MissingZero!6237 (index!27205 (_ BitVec 32))) (Found!6237 (index!27206 (_ BitVec 32))) (Intermediate!6237 (undefined!7049 Bool) (index!27207 (_ BitVec 32)) (x!56012 (_ BitVec 32))) (Undefined!6237) (MissingVacant!6237 (index!27208 (_ BitVec 32))) )
))
(declare-fun lt!272243 () SeekEntryResult!6237)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!599038 (= res!384064 (or (= lt!272243 (MissingZero!6237 i!1108)) (= lt!272243 (MissingVacant!6237 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37075 (_ BitVec 32)) SeekEntryResult!6237)

(assert (=> b!599038 (= lt!272243 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!342463 () Bool)

(declare-fun b!599039 () Bool)

(declare-fun lt!272250 () array!37075)

(declare-fun arrayContainsKey!0 (array!37075 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!599039 (= e!342463 (arrayContainsKey!0 lt!272250 (select (arr!17797 a!2986) j!136) index!984))))

(declare-fun b!599040 () Bool)

(declare-fun e!342465 () Bool)

(declare-fun e!342459 () Bool)

(assert (=> b!599040 (= e!342465 e!342459)))

(declare-fun res!384056 () Bool)

(assert (=> b!599040 (=> res!384056 e!342459)))

(declare-fun lt!272245 () (_ BitVec 64))

(declare-fun lt!272241 () (_ BitVec 64))

(assert (=> b!599040 (= res!384056 (or (not (= (select (arr!17797 a!2986) j!136) lt!272241)) (not (= (select (arr!17797 a!2986) j!136) lt!272245)) (bvsge j!136 index!984)))))

(declare-fun e!342458 () Bool)

(assert (=> b!599040 e!342458))

(declare-fun res!384067 () Bool)

(assert (=> b!599040 (=> (not res!384067) (not e!342458))))

(assert (=> b!599040 (= res!384067 (= lt!272245 (select (arr!17797 a!2986) j!136)))))

(assert (=> b!599040 (= lt!272245 (select (store (arr!17797 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!599041 () Bool)

(declare-fun e!342454 () Bool)

(assert (=> b!599041 (= e!342458 e!342454)))

(declare-fun res!384065 () Bool)

(assert (=> b!599041 (=> res!384065 e!342454)))

(assert (=> b!599041 (= res!384065 (or (not (= (select (arr!17797 a!2986) j!136) lt!272241)) (not (= (select (arr!17797 a!2986) j!136) lt!272245)) (bvsge j!136 index!984)))))

(declare-fun b!599042 () Bool)

(declare-fun res!384059 () Bool)

(assert (=> b!599042 (=> (not res!384059) (not e!342455))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37075 (_ BitVec 32)) Bool)

(assert (=> b!599042 (= res!384059 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!599043 () Bool)

(declare-fun res!384068 () Bool)

(assert (=> b!599043 (=> (not res!384068) (not e!342464))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!599043 (= res!384068 (validKeyInArray!0 (select (arr!17797 a!2986) j!136)))))

(declare-fun b!599044 () Bool)

(assert (=> b!599044 (= e!342459 true)))

(declare-datatypes ((List!11838 0))(
  ( (Nil!11835) (Cons!11834 (h!12879 (_ BitVec 64)) (t!18066 List!11838)) )
))
(declare-fun arrayNoDuplicates!0 (array!37075 (_ BitVec 32) List!11838) Bool)

(assert (=> b!599044 (arrayNoDuplicates!0 lt!272250 #b00000000000000000000000000000000 Nil!11835)))

(declare-fun lt!272240 () Unit!18866)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37075 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11838) Unit!18866)

(assert (=> b!599044 (= lt!272240 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11835))))

(assert (=> b!599044 (arrayContainsKey!0 lt!272250 (select (arr!17797 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!272248 () Unit!18866)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37075 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18866)

(assert (=> b!599044 (= lt!272248 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!272250 (select (arr!17797 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!599045 () Bool)

(declare-fun res!384054 () Bool)

(assert (=> b!599045 (=> (not res!384054) (not e!342464))))

(assert (=> b!599045 (= res!384054 (validKeyInArray!0 k0!1786))))

(declare-fun b!599046 () Bool)

(assert (=> b!599046 (= e!342454 e!342463)))

(declare-fun res!384055 () Bool)

(assert (=> b!599046 (=> (not res!384055) (not e!342463))))

(assert (=> b!599046 (= res!384055 (arrayContainsKey!0 lt!272250 (select (arr!17797 a!2986) j!136) j!136))))

(declare-fun b!599047 () Bool)

(declare-fun res!384057 () Bool)

(assert (=> b!599047 (=> (not res!384057) (not e!342464))))

(assert (=> b!599047 (= res!384057 (and (= (size!18161 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18161 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18161 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!599048 () Bool)

(declare-fun e!342462 () Bool)

(declare-fun e!342461 () Bool)

(assert (=> b!599048 (= e!342462 e!342461)))

(declare-fun res!384066 () Bool)

(assert (=> b!599048 (=> (not res!384066) (not e!342461))))

(declare-fun lt!272246 () SeekEntryResult!6237)

(assert (=> b!599048 (= res!384066 (and (= lt!272246 (Found!6237 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17797 a!2986) index!984) (select (arr!17797 a!2986) j!136))) (not (= (select (arr!17797 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37075 (_ BitVec 32)) SeekEntryResult!6237)

(assert (=> b!599048 (= lt!272246 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17797 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!599049 () Bool)

(assert (=> b!599049 (= e!342461 (not e!342465))))

(declare-fun res!384060 () Bool)

(assert (=> b!599049 (=> res!384060 e!342465)))

(declare-fun lt!272247 () SeekEntryResult!6237)

(assert (=> b!599049 (= res!384060 (not (= lt!272247 (Found!6237 index!984))))))

(declare-fun lt!272242 () Unit!18866)

(assert (=> b!599049 (= lt!272242 e!342457)))

(declare-fun c!67859 () Bool)

(assert (=> b!599049 (= c!67859 (= lt!272247 Undefined!6237))))

(assert (=> b!599049 (= lt!272247 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!272241 lt!272250 mask!3053))))

(declare-fun e!342460 () Bool)

(assert (=> b!599049 e!342460))

(declare-fun res!384063 () Bool)

(assert (=> b!599049 (=> (not res!384063) (not e!342460))))

(declare-fun lt!272249 () SeekEntryResult!6237)

(declare-fun lt!272251 () (_ BitVec 32))

(assert (=> b!599049 (= res!384063 (= lt!272249 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272251 vacantSpotIndex!68 lt!272241 lt!272250 mask!3053)))))

(assert (=> b!599049 (= lt!272249 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272251 vacantSpotIndex!68 (select (arr!17797 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!599049 (= lt!272241 (select (store (arr!17797 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!272244 () Unit!18866)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37075 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18866)

(assert (=> b!599049 (= lt!272244 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!272251 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!599049 (= lt!272251 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!599050 () Bool)

(declare-fun res!384052 () Bool)

(assert (=> b!599050 (=> (not res!384052) (not e!342464))))

(assert (=> b!599050 (= res!384052 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!599051 () Bool)

(assert (=> b!599051 (= e!342460 (= lt!272246 lt!272249))))

(declare-fun b!599052 () Bool)

(declare-fun res!384062 () Bool)

(assert (=> b!599052 (=> (not res!384062) (not e!342455))))

(assert (=> b!599052 (= res!384062 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11835))))

(declare-fun b!599053 () Bool)

(assert (=> b!599053 (= e!342455 e!342462)))

(declare-fun res!384053 () Bool)

(assert (=> b!599053 (=> (not res!384053) (not e!342462))))

(assert (=> b!599053 (= res!384053 (= (select (store (arr!17797 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!599053 (= lt!272250 (array!37076 (store (arr!17797 a!2986) i!1108 k0!1786) (size!18161 a!2986)))))

(declare-fun res!384061 () Bool)

(assert (=> start!54840 (=> (not res!384061) (not e!342464))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54840 (= res!384061 (validMask!0 mask!3053))))

(assert (=> start!54840 e!342464))

(assert (=> start!54840 true))

(declare-fun array_inv!13593 (array!37075) Bool)

(assert (=> start!54840 (array_inv!13593 a!2986)))

(declare-fun b!599054 () Bool)

(declare-fun Unit!18869 () Unit!18866)

(assert (=> b!599054 (= e!342457 Unit!18869)))

(assert (= (and start!54840 res!384061) b!599047))

(assert (= (and b!599047 res!384057) b!599043))

(assert (= (and b!599043 res!384068) b!599045))

(assert (= (and b!599045 res!384054) b!599050))

(assert (= (and b!599050 res!384052) b!599038))

(assert (= (and b!599038 res!384064) b!599042))

(assert (= (and b!599042 res!384059) b!599052))

(assert (= (and b!599052 res!384062) b!599037))

(assert (= (and b!599037 res!384058) b!599053))

(assert (= (and b!599053 res!384053) b!599048))

(assert (= (and b!599048 res!384066) b!599049))

(assert (= (and b!599049 res!384063) b!599051))

(assert (= (and b!599049 c!67859) b!599036))

(assert (= (and b!599049 (not c!67859)) b!599054))

(assert (= (and b!599049 (not res!384060)) b!599040))

(assert (= (and b!599040 res!384067) b!599041))

(assert (= (and b!599041 (not res!384065)) b!599046))

(assert (= (and b!599046 res!384055) b!599039))

(assert (= (and b!599040 (not res!384056)) b!599044))

(declare-fun m!576311 () Bool)

(assert (=> b!599041 m!576311))

(assert (=> b!599044 m!576311))

(declare-fun m!576313 () Bool)

(assert (=> b!599044 m!576313))

(assert (=> b!599044 m!576311))

(declare-fun m!576315 () Bool)

(assert (=> b!599044 m!576315))

(assert (=> b!599044 m!576311))

(declare-fun m!576317 () Bool)

(assert (=> b!599044 m!576317))

(declare-fun m!576319 () Bool)

(assert (=> b!599044 m!576319))

(declare-fun m!576321 () Bool)

(assert (=> b!599042 m!576321))

(assert (=> b!599039 m!576311))

(assert (=> b!599039 m!576311))

(declare-fun m!576323 () Bool)

(assert (=> b!599039 m!576323))

(declare-fun m!576325 () Bool)

(assert (=> b!599050 m!576325))

(assert (=> b!599043 m!576311))

(assert (=> b!599043 m!576311))

(declare-fun m!576327 () Bool)

(assert (=> b!599043 m!576327))

(declare-fun m!576329 () Bool)

(assert (=> b!599048 m!576329))

(assert (=> b!599048 m!576311))

(assert (=> b!599048 m!576311))

(declare-fun m!576331 () Bool)

(assert (=> b!599048 m!576331))

(declare-fun m!576333 () Bool)

(assert (=> b!599037 m!576333))

(assert (=> b!599040 m!576311))

(declare-fun m!576335 () Bool)

(assert (=> b!599040 m!576335))

(declare-fun m!576337 () Bool)

(assert (=> b!599040 m!576337))

(assert (=> b!599046 m!576311))

(assert (=> b!599046 m!576311))

(declare-fun m!576339 () Bool)

(assert (=> b!599046 m!576339))

(declare-fun m!576341 () Bool)

(assert (=> b!599049 m!576341))

(declare-fun m!576343 () Bool)

(assert (=> b!599049 m!576343))

(declare-fun m!576345 () Bool)

(assert (=> b!599049 m!576345))

(declare-fun m!576347 () Bool)

(assert (=> b!599049 m!576347))

(assert (=> b!599049 m!576311))

(assert (=> b!599049 m!576335))

(assert (=> b!599049 m!576311))

(declare-fun m!576349 () Bool)

(assert (=> b!599049 m!576349))

(declare-fun m!576351 () Bool)

(assert (=> b!599049 m!576351))

(declare-fun m!576353 () Bool)

(assert (=> b!599052 m!576353))

(assert (=> b!599053 m!576335))

(declare-fun m!576355 () Bool)

(assert (=> b!599053 m!576355))

(declare-fun m!576357 () Bool)

(assert (=> b!599038 m!576357))

(declare-fun m!576359 () Bool)

(assert (=> b!599045 m!576359))

(declare-fun m!576361 () Bool)

(assert (=> start!54840 m!576361))

(declare-fun m!576363 () Bool)

(assert (=> start!54840 m!576363))

(check-sat (not b!599046) (not b!599045) (not b!599052) (not b!599042) (not b!599043) (not b!599049) (not b!599038) (not b!599044) (not start!54840) (not b!599039) (not b!599050) (not b!599048))
(check-sat)

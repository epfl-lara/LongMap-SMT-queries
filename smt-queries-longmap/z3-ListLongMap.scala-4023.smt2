; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54894 () Bool)

(assert start!54894)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!599359 () Bool)

(declare-datatypes ((array!37074 0))(
  ( (array!37075 (arr!17794 (Array (_ BitVec 32) (_ BitVec 64))) (size!18158 (_ BitVec 32))) )
))
(declare-fun lt!272423 () array!37074)

(declare-fun e!342655 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37074)

(declare-fun arrayContainsKey!0 (array!37074 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!599359 (= e!342655 (arrayContainsKey!0 lt!272423 (select (arr!17794 a!2986) j!136) index!984))))

(declare-fun b!599360 () Bool)

(declare-fun e!342663 () Bool)

(declare-fun e!342665 () Bool)

(assert (=> b!599360 (= e!342663 e!342665)))

(declare-fun res!384273 () Bool)

(assert (=> b!599360 (=> res!384273 e!342665)))

(declare-fun lt!272420 () (_ BitVec 64))

(declare-fun lt!272415 () (_ BitVec 64))

(assert (=> b!599360 (= res!384273 (or (not (= (select (arr!17794 a!2986) j!136) lt!272415)) (not (= (select (arr!17794 a!2986) j!136) lt!272420)) (bvsge j!136 index!984)))))

(declare-fun b!599361 () Bool)

(declare-fun res!384272 () Bool)

(declare-fun e!342662 () Bool)

(assert (=> b!599361 (=> (not res!384272) (not e!342662))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37074 (_ BitVec 32)) Bool)

(assert (=> b!599361 (= res!384272 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!384260 () Bool)

(declare-fun e!342658 () Bool)

(assert (=> start!54894 (=> (not res!384260) (not e!342658))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54894 (= res!384260 (validMask!0 mask!3053))))

(assert (=> start!54894 e!342658))

(assert (=> start!54894 true))

(declare-fun array_inv!13653 (array!37074) Bool)

(assert (=> start!54894 (array_inv!13653 a!2986)))

(declare-fun b!599362 () Bool)

(declare-fun e!342657 () Bool)

(assert (=> b!599362 (= e!342662 e!342657)))

(declare-fun res!384270 () Bool)

(assert (=> b!599362 (=> (not res!384270) (not e!342657))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!599362 (= res!384270 (= (select (store (arr!17794 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!599362 (= lt!272423 (array!37075 (store (arr!17794 a!2986) i!1108 k0!1786) (size!18158 a!2986)))))

(declare-fun b!599363 () Bool)

(declare-fun res!384266 () Bool)

(assert (=> b!599363 (=> (not res!384266) (not e!342662))))

(declare-datatypes ((List!11742 0))(
  ( (Nil!11739) (Cons!11738 (h!12786 (_ BitVec 64)) (t!17962 List!11742)) )
))
(declare-fun arrayNoDuplicates!0 (array!37074 (_ BitVec 32) List!11742) Bool)

(assert (=> b!599363 (= res!384266 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11739))))

(declare-fun b!599364 () Bool)

(declare-datatypes ((Unit!18853 0))(
  ( (Unit!18854) )
))
(declare-fun e!342664 () Unit!18853)

(declare-fun Unit!18855 () Unit!18853)

(assert (=> b!599364 (= e!342664 Unit!18855)))

(declare-fun b!599365 () Bool)

(declare-fun res!384263 () Bool)

(assert (=> b!599365 (=> (not res!384263) (not e!342658))))

(assert (=> b!599365 (= res!384263 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!599366 () Bool)

(declare-fun res!384258 () Bool)

(assert (=> b!599366 (=> (not res!384258) (not e!342658))))

(assert (=> b!599366 (= res!384258 (and (= (size!18158 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18158 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18158 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!599367 () Bool)

(declare-fun e!342660 () Bool)

(assert (=> b!599367 (= e!342657 e!342660)))

(declare-fun res!384262 () Bool)

(assert (=> b!599367 (=> (not res!384262) (not e!342660))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6190 0))(
  ( (MissingZero!6190 (index!27017 (_ BitVec 32))) (Found!6190 (index!27018 (_ BitVec 32))) (Intermediate!6190 (undefined!7002 Bool) (index!27019 (_ BitVec 32)) (x!55976 (_ BitVec 32))) (Undefined!6190) (MissingVacant!6190 (index!27020 (_ BitVec 32))) )
))
(declare-fun lt!272416 () SeekEntryResult!6190)

(assert (=> b!599367 (= res!384262 (and (= lt!272416 (Found!6190 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17794 a!2986) index!984) (select (arr!17794 a!2986) j!136))) (not (= (select (arr!17794 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37074 (_ BitVec 32)) SeekEntryResult!6190)

(assert (=> b!599367 (= lt!272416 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17794 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!599368 () Bool)

(declare-fun res!384268 () Bool)

(assert (=> b!599368 (=> (not res!384268) (not e!342658))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!599368 (= res!384268 (validKeyInArray!0 k0!1786))))

(declare-fun b!599369 () Bool)

(declare-fun Unit!18856 () Unit!18853)

(assert (=> b!599369 (= e!342664 Unit!18856)))

(assert (=> b!599369 false))

(declare-fun b!599370 () Bool)

(declare-fun e!342656 () Bool)

(declare-fun e!342666 () Bool)

(assert (=> b!599370 (= e!342656 e!342666)))

(declare-fun res!384264 () Bool)

(assert (=> b!599370 (=> res!384264 e!342666)))

(assert (=> b!599370 (= res!384264 (or (not (= (select (arr!17794 a!2986) j!136) lt!272415)) (not (= (select (arr!17794 a!2986) j!136) lt!272420)) (bvsge j!136 index!984)))))

(assert (=> b!599370 e!342663))

(declare-fun res!384261 () Bool)

(assert (=> b!599370 (=> (not res!384261) (not e!342663))))

(assert (=> b!599370 (= res!384261 (= lt!272420 (select (arr!17794 a!2986) j!136)))))

(assert (=> b!599370 (= lt!272420 (select (store (arr!17794 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!599371 () Bool)

(declare-fun res!384267 () Bool)

(assert (=> b!599371 (=> (not res!384267) (not e!342662))))

(assert (=> b!599371 (= res!384267 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17794 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!599372 () Bool)

(declare-fun e!342661 () Bool)

(declare-fun lt!272419 () SeekEntryResult!6190)

(assert (=> b!599372 (= e!342661 (= lt!272416 lt!272419))))

(declare-fun b!599373 () Bool)

(assert (=> b!599373 (= e!342665 e!342655)))

(declare-fun res!384259 () Bool)

(assert (=> b!599373 (=> (not res!384259) (not e!342655))))

(assert (=> b!599373 (= res!384259 (arrayContainsKey!0 lt!272423 (select (arr!17794 a!2986) j!136) j!136))))

(declare-fun b!599374 () Bool)

(assert (=> b!599374 (= e!342660 (not e!342656))))

(declare-fun res!384265 () Bool)

(assert (=> b!599374 (=> res!384265 e!342656)))

(declare-fun lt!272418 () SeekEntryResult!6190)

(assert (=> b!599374 (= res!384265 (not (= lt!272418 (Found!6190 index!984))))))

(declare-fun lt!272424 () Unit!18853)

(assert (=> b!599374 (= lt!272424 e!342664)))

(declare-fun c!67919 () Bool)

(assert (=> b!599374 (= c!67919 (= lt!272418 Undefined!6190))))

(assert (=> b!599374 (= lt!272418 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!272415 lt!272423 mask!3053))))

(assert (=> b!599374 e!342661))

(declare-fun res!384269 () Bool)

(assert (=> b!599374 (=> (not res!384269) (not e!342661))))

(declare-fun lt!272421 () (_ BitVec 32))

(assert (=> b!599374 (= res!384269 (= lt!272419 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272421 vacantSpotIndex!68 lt!272415 lt!272423 mask!3053)))))

(assert (=> b!599374 (= lt!272419 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272421 vacantSpotIndex!68 (select (arr!17794 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!599374 (= lt!272415 (select (store (arr!17794 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!272422 () Unit!18853)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37074 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18853)

(assert (=> b!599374 (= lt!272422 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!272421 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!599374 (= lt!272421 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!599375 () Bool)

(declare-fun res!384271 () Bool)

(assert (=> b!599375 (=> (not res!384271) (not e!342658))))

(assert (=> b!599375 (= res!384271 (validKeyInArray!0 (select (arr!17794 a!2986) j!136)))))

(declare-fun b!599376 () Bool)

(assert (=> b!599376 (= e!342658 e!342662)))

(declare-fun res!384274 () Bool)

(assert (=> b!599376 (=> (not res!384274) (not e!342662))))

(declare-fun lt!272414 () SeekEntryResult!6190)

(assert (=> b!599376 (= res!384274 (or (= lt!272414 (MissingZero!6190 i!1108)) (= lt!272414 (MissingVacant!6190 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37074 (_ BitVec 32)) SeekEntryResult!6190)

(assert (=> b!599376 (= lt!272414 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!599377 () Bool)

(assert (=> b!599377 (= e!342666 true)))

(assert (=> b!599377 (arrayNoDuplicates!0 lt!272423 #b00000000000000000000000000000000 Nil!11739)))

(declare-fun lt!272425 () Unit!18853)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37074 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11742) Unit!18853)

(assert (=> b!599377 (= lt!272425 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11739))))

(assert (=> b!599377 (arrayContainsKey!0 lt!272423 (select (arr!17794 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!272417 () Unit!18853)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37074 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18853)

(assert (=> b!599377 (= lt!272417 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!272423 (select (arr!17794 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (= (and start!54894 res!384260) b!599366))

(assert (= (and b!599366 res!384258) b!599375))

(assert (= (and b!599375 res!384271) b!599368))

(assert (= (and b!599368 res!384268) b!599365))

(assert (= (and b!599365 res!384263) b!599376))

(assert (= (and b!599376 res!384274) b!599361))

(assert (= (and b!599361 res!384272) b!599363))

(assert (= (and b!599363 res!384266) b!599371))

(assert (= (and b!599371 res!384267) b!599362))

(assert (= (and b!599362 res!384270) b!599367))

(assert (= (and b!599367 res!384262) b!599374))

(assert (= (and b!599374 res!384269) b!599372))

(assert (= (and b!599374 c!67919) b!599369))

(assert (= (and b!599374 (not c!67919)) b!599364))

(assert (= (and b!599374 (not res!384265)) b!599370))

(assert (= (and b!599370 res!384261) b!599360))

(assert (= (and b!599360 (not res!384273)) b!599373))

(assert (= (and b!599373 res!384259) b!599359))

(assert (= (and b!599370 (not res!384264)) b!599377))

(declare-fun m!576851 () Bool)

(assert (=> b!599375 m!576851))

(assert (=> b!599375 m!576851))

(declare-fun m!576853 () Bool)

(assert (=> b!599375 m!576853))

(assert (=> b!599377 m!576851))

(declare-fun m!576855 () Bool)

(assert (=> b!599377 m!576855))

(assert (=> b!599377 m!576851))

(declare-fun m!576857 () Bool)

(assert (=> b!599377 m!576857))

(assert (=> b!599377 m!576851))

(declare-fun m!576859 () Bool)

(assert (=> b!599377 m!576859))

(declare-fun m!576861 () Bool)

(assert (=> b!599377 m!576861))

(declare-fun m!576863 () Bool)

(assert (=> b!599371 m!576863))

(assert (=> b!599373 m!576851))

(assert (=> b!599373 m!576851))

(declare-fun m!576865 () Bool)

(assert (=> b!599373 m!576865))

(declare-fun m!576867 () Bool)

(assert (=> b!599363 m!576867))

(assert (=> b!599360 m!576851))

(declare-fun m!576869 () Bool)

(assert (=> b!599374 m!576869))

(declare-fun m!576871 () Bool)

(assert (=> b!599374 m!576871))

(assert (=> b!599374 m!576851))

(declare-fun m!576873 () Bool)

(assert (=> b!599374 m!576873))

(declare-fun m!576875 () Bool)

(assert (=> b!599374 m!576875))

(assert (=> b!599374 m!576851))

(declare-fun m!576877 () Bool)

(assert (=> b!599374 m!576877))

(declare-fun m!576879 () Bool)

(assert (=> b!599374 m!576879))

(declare-fun m!576881 () Bool)

(assert (=> b!599374 m!576881))

(declare-fun m!576883 () Bool)

(assert (=> start!54894 m!576883))

(declare-fun m!576885 () Bool)

(assert (=> start!54894 m!576885))

(declare-fun m!576887 () Bool)

(assert (=> b!599376 m!576887))

(declare-fun m!576889 () Bool)

(assert (=> b!599365 m!576889))

(declare-fun m!576891 () Bool)

(assert (=> b!599368 m!576891))

(assert (=> b!599359 m!576851))

(assert (=> b!599359 m!576851))

(declare-fun m!576893 () Bool)

(assert (=> b!599359 m!576893))

(assert (=> b!599370 m!576851))

(assert (=> b!599370 m!576873))

(declare-fun m!576895 () Bool)

(assert (=> b!599370 m!576895))

(assert (=> b!599362 m!576873))

(declare-fun m!576897 () Bool)

(assert (=> b!599362 m!576897))

(declare-fun m!576899 () Bool)

(assert (=> b!599367 m!576899))

(assert (=> b!599367 m!576851))

(assert (=> b!599367 m!576851))

(declare-fun m!576901 () Bool)

(assert (=> b!599367 m!576901))

(declare-fun m!576903 () Bool)

(assert (=> b!599361 m!576903))

(check-sat (not b!599368) (not b!599367) (not b!599365) (not b!599373) (not b!599377) (not b!599363) (not b!599361) (not b!599375) (not b!599359) (not b!599374) (not b!599376) (not start!54894))
(check-sat)

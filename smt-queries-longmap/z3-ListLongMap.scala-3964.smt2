; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53844 () Bool)

(assert start!53844)

(declare-fun b!587274 () Bool)

(declare-fun e!335564 () Bool)

(declare-fun e!335565 () Bool)

(assert (=> b!587274 (= e!335564 e!335565)))

(declare-fun res!374986 () Bool)

(assert (=> b!587274 (=> (not res!374986) (not e!335565))))

(declare-datatypes ((SeekEntryResult!6013 0))(
  ( (MissingZero!6013 (index!26279 (_ BitVec 32))) (Found!6013 (index!26280 (_ BitVec 32))) (Intermediate!6013 (undefined!6825 Bool) (index!26281 (_ BitVec 32)) (x!55237 (_ BitVec 32))) (Undefined!6013) (MissingVacant!6013 (index!26282 (_ BitVec 32))) )
))
(declare-fun lt!266366 () SeekEntryResult!6013)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!587274 (= res!374986 (or (= lt!266366 (MissingZero!6013 i!1108)) (= lt!266366 (MissingVacant!6013 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!36690 0))(
  ( (array!36691 (arr!17617 (Array (_ BitVec 32) (_ BitVec 64))) (size!17981 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36690)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36690 (_ BitVec 32)) SeekEntryResult!6013)

(assert (=> b!587274 (= lt!266366 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!587275 () Bool)

(declare-fun res!374993 () Bool)

(assert (=> b!587275 (=> (not res!374993) (not e!335565))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!587275 (= res!374993 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17617 a!2986) index!984) (select (arr!17617 a!2986) j!136))) (not (= (select (arr!17617 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!587276 () Bool)

(declare-fun res!374990 () Bool)

(assert (=> b!587276 (=> (not res!374990) (not e!335565))))

(declare-datatypes ((List!11565 0))(
  ( (Nil!11562) (Cons!11561 (h!12609 (_ BitVec 64)) (t!17785 List!11565)) )
))
(declare-fun arrayNoDuplicates!0 (array!36690 (_ BitVec 32) List!11565) Bool)

(assert (=> b!587276 (= res!374990 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11562))))

(declare-fun b!587277 () Bool)

(declare-fun res!374994 () Bool)

(assert (=> b!587277 (=> (not res!374994) (not e!335565))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36690 (_ BitVec 32)) Bool)

(assert (=> b!587277 (= res!374994 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!587278 () Bool)

(declare-fun res!374992 () Bool)

(assert (=> b!587278 (=> (not res!374992) (not e!335564))))

(declare-fun arrayContainsKey!0 (array!36690 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!587278 (= res!374992 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!587280 () Bool)

(declare-fun res!374989 () Bool)

(assert (=> b!587280 (=> (not res!374989) (not e!335565))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!587280 (= res!374989 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17617 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17617 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!587281 () Bool)

(declare-fun res!374995 () Bool)

(assert (=> b!587281 (=> (not res!374995) (not e!335565))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36690 (_ BitVec 32)) SeekEntryResult!6013)

(assert (=> b!587281 (= res!374995 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17617 a!2986) j!136) a!2986 mask!3053) (Found!6013 j!136)))))

(declare-fun b!587282 () Bool)

(declare-fun res!374988 () Bool)

(assert (=> b!587282 (=> (not res!374988) (not e!335564))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!587282 (= res!374988 (validKeyInArray!0 (select (arr!17617 a!2986) j!136)))))

(declare-fun b!587283 () Bool)

(declare-fun res!374991 () Bool)

(assert (=> b!587283 (=> (not res!374991) (not e!335564))))

(assert (=> b!587283 (= res!374991 (and (= (size!17981 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17981 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17981 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!587284 () Bool)

(declare-fun lt!266367 () (_ BitVec 32))

(assert (=> b!587284 (= e!335565 (not (or (bvslt mask!3053 #b00000000000000000000000000000000) (and (bvsge lt!266367 #b00000000000000000000000000000000) (bvslt lt!266367 (bvadd #b00000000000000000000000000000001 mask!3053))))))))

(assert (=> b!587284 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266367 vacantSpotIndex!68 (select (arr!17617 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266367 vacantSpotIndex!68 (select (store (arr!17617 a!2986) i!1108 k0!1786) j!136) (array!36691 (store (arr!17617 a!2986) i!1108 k0!1786) (size!17981 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18223 0))(
  ( (Unit!18224) )
))
(declare-fun lt!266368 () Unit!18223)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36690 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18223)

(assert (=> b!587284 (= lt!266368 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266367 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!587284 (= lt!266367 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun res!374985 () Bool)

(assert (=> start!53844 (=> (not res!374985) (not e!335564))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53844 (= res!374985 (validMask!0 mask!3053))))

(assert (=> start!53844 e!335564))

(assert (=> start!53844 true))

(declare-fun array_inv!13476 (array!36690) Bool)

(assert (=> start!53844 (array_inv!13476 a!2986)))

(declare-fun b!587279 () Bool)

(declare-fun res!374987 () Bool)

(assert (=> b!587279 (=> (not res!374987) (not e!335564))))

(assert (=> b!587279 (= res!374987 (validKeyInArray!0 k0!1786))))

(assert (= (and start!53844 res!374985) b!587283))

(assert (= (and b!587283 res!374991) b!587282))

(assert (= (and b!587282 res!374988) b!587279))

(assert (= (and b!587279 res!374987) b!587278))

(assert (= (and b!587278 res!374992) b!587274))

(assert (= (and b!587274 res!374986) b!587277))

(assert (= (and b!587277 res!374994) b!587276))

(assert (= (and b!587276 res!374990) b!587280))

(assert (= (and b!587280 res!374989) b!587281))

(assert (= (and b!587281 res!374995) b!587275))

(assert (= (and b!587275 res!374993) b!587284))

(declare-fun m!565877 () Bool)

(assert (=> b!587282 m!565877))

(assert (=> b!587282 m!565877))

(declare-fun m!565879 () Bool)

(assert (=> b!587282 m!565879))

(declare-fun m!565881 () Bool)

(assert (=> b!587277 m!565881))

(declare-fun m!565883 () Bool)

(assert (=> b!587276 m!565883))

(declare-fun m!565885 () Bool)

(assert (=> b!587278 m!565885))

(declare-fun m!565887 () Bool)

(assert (=> b!587280 m!565887))

(declare-fun m!565889 () Bool)

(assert (=> b!587280 m!565889))

(declare-fun m!565891 () Bool)

(assert (=> b!587280 m!565891))

(assert (=> b!587281 m!565877))

(assert (=> b!587281 m!565877))

(declare-fun m!565893 () Bool)

(assert (=> b!587281 m!565893))

(declare-fun m!565895 () Bool)

(assert (=> b!587275 m!565895))

(assert (=> b!587275 m!565877))

(declare-fun m!565897 () Bool)

(assert (=> b!587274 m!565897))

(declare-fun m!565899 () Bool)

(assert (=> b!587279 m!565899))

(declare-fun m!565901 () Bool)

(assert (=> start!53844 m!565901))

(declare-fun m!565903 () Bool)

(assert (=> start!53844 m!565903))

(declare-fun m!565905 () Bool)

(assert (=> b!587284 m!565905))

(declare-fun m!565907 () Bool)

(assert (=> b!587284 m!565907))

(assert (=> b!587284 m!565877))

(assert (=> b!587284 m!565889))

(declare-fun m!565909 () Bool)

(assert (=> b!587284 m!565909))

(assert (=> b!587284 m!565907))

(declare-fun m!565911 () Bool)

(assert (=> b!587284 m!565911))

(assert (=> b!587284 m!565877))

(declare-fun m!565913 () Bool)

(assert (=> b!587284 m!565913))

(check-sat (not start!53844) (not b!587278) (not b!587282) (not b!587284) (not b!587279) (not b!587276) (not b!587274) (not b!587277) (not b!587281))
(check-sat)
(get-model)

(declare-fun b!587363 () Bool)

(declare-fun e!335591 () SeekEntryResult!6013)

(assert (=> b!587363 (= e!335591 (MissingVacant!6013 vacantSpotIndex!68))))

(declare-fun b!587364 () Bool)

(declare-fun c!66520 () Bool)

(declare-fun lt!266392 () (_ BitVec 64))

(assert (=> b!587364 (= c!66520 (= lt!266392 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!335592 () SeekEntryResult!6013)

(assert (=> b!587364 (= e!335592 e!335591)))

(declare-fun lt!266391 () SeekEntryResult!6013)

(declare-fun d!86015 () Bool)

(get-info :version)

(assert (=> d!86015 (and (or ((_ is Undefined!6013) lt!266391) (not ((_ is Found!6013) lt!266391)) (and (bvsge (index!26280 lt!266391) #b00000000000000000000000000000000) (bvslt (index!26280 lt!266391) (size!17981 a!2986)))) (or ((_ is Undefined!6013) lt!266391) ((_ is Found!6013) lt!266391) (not ((_ is MissingVacant!6013) lt!266391)) (not (= (index!26282 lt!266391) vacantSpotIndex!68)) (and (bvsge (index!26282 lt!266391) #b00000000000000000000000000000000) (bvslt (index!26282 lt!266391) (size!17981 a!2986)))) (or ((_ is Undefined!6013) lt!266391) (ite ((_ is Found!6013) lt!266391) (= (select (arr!17617 a!2986) (index!26280 lt!266391)) (select (arr!17617 a!2986) j!136)) (and ((_ is MissingVacant!6013) lt!266391) (= (index!26282 lt!266391) vacantSpotIndex!68) (= (select (arr!17617 a!2986) (index!26282 lt!266391)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!335590 () SeekEntryResult!6013)

(assert (=> d!86015 (= lt!266391 e!335590)))

(declare-fun c!66519 () Bool)

(assert (=> d!86015 (= c!66519 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!86015 (= lt!266392 (select (arr!17617 a!2986) lt!266367))))

(assert (=> d!86015 (validMask!0 mask!3053)))

(assert (=> d!86015 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266367 vacantSpotIndex!68 (select (arr!17617 a!2986) j!136) a!2986 mask!3053) lt!266391)))

(declare-fun b!587365 () Bool)

(assert (=> b!587365 (= e!335591 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!266367 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!17617 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!587366 () Bool)

(assert (=> b!587366 (= e!335592 (Found!6013 lt!266367))))

(declare-fun b!587367 () Bool)

(assert (=> b!587367 (= e!335590 Undefined!6013)))

(declare-fun b!587368 () Bool)

(assert (=> b!587368 (= e!335590 e!335592)))

(declare-fun c!66521 () Bool)

(assert (=> b!587368 (= c!66521 (= lt!266392 (select (arr!17617 a!2986) j!136)))))

(assert (= (and d!86015 c!66519) b!587367))

(assert (= (and d!86015 (not c!66519)) b!587368))

(assert (= (and b!587368 c!66521) b!587366))

(assert (= (and b!587368 (not c!66521)) b!587364))

(assert (= (and b!587364 c!66520) b!587363))

(assert (= (and b!587364 (not c!66520)) b!587365))

(declare-fun m!565991 () Bool)

(assert (=> d!86015 m!565991))

(declare-fun m!565993 () Bool)

(assert (=> d!86015 m!565993))

(declare-fun m!565995 () Bool)

(assert (=> d!86015 m!565995))

(assert (=> d!86015 m!565901))

(declare-fun m!565997 () Bool)

(assert (=> b!587365 m!565997))

(assert (=> b!587365 m!565997))

(assert (=> b!587365 m!565877))

(declare-fun m!565999 () Bool)

(assert (=> b!587365 m!565999))

(assert (=> b!587284 d!86015))

(declare-fun b!587369 () Bool)

(declare-fun e!335594 () SeekEntryResult!6013)

(assert (=> b!587369 (= e!335594 (MissingVacant!6013 vacantSpotIndex!68))))

(declare-fun b!587370 () Bool)

(declare-fun c!66523 () Bool)

(declare-fun lt!266394 () (_ BitVec 64))

(assert (=> b!587370 (= c!66523 (= lt!266394 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!335595 () SeekEntryResult!6013)

(assert (=> b!587370 (= e!335595 e!335594)))

(declare-fun lt!266393 () SeekEntryResult!6013)

(declare-fun d!86017 () Bool)

(assert (=> d!86017 (and (or ((_ is Undefined!6013) lt!266393) (not ((_ is Found!6013) lt!266393)) (and (bvsge (index!26280 lt!266393) #b00000000000000000000000000000000) (bvslt (index!26280 lt!266393) (size!17981 (array!36691 (store (arr!17617 a!2986) i!1108 k0!1786) (size!17981 a!2986)))))) (or ((_ is Undefined!6013) lt!266393) ((_ is Found!6013) lt!266393) (not ((_ is MissingVacant!6013) lt!266393)) (not (= (index!26282 lt!266393) vacantSpotIndex!68)) (and (bvsge (index!26282 lt!266393) #b00000000000000000000000000000000) (bvslt (index!26282 lt!266393) (size!17981 (array!36691 (store (arr!17617 a!2986) i!1108 k0!1786) (size!17981 a!2986)))))) (or ((_ is Undefined!6013) lt!266393) (ite ((_ is Found!6013) lt!266393) (= (select (arr!17617 (array!36691 (store (arr!17617 a!2986) i!1108 k0!1786) (size!17981 a!2986))) (index!26280 lt!266393)) (select (store (arr!17617 a!2986) i!1108 k0!1786) j!136)) (and ((_ is MissingVacant!6013) lt!266393) (= (index!26282 lt!266393) vacantSpotIndex!68) (= (select (arr!17617 (array!36691 (store (arr!17617 a!2986) i!1108 k0!1786) (size!17981 a!2986))) (index!26282 lt!266393)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!335593 () SeekEntryResult!6013)

(assert (=> d!86017 (= lt!266393 e!335593)))

(declare-fun c!66522 () Bool)

(assert (=> d!86017 (= c!66522 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!86017 (= lt!266394 (select (arr!17617 (array!36691 (store (arr!17617 a!2986) i!1108 k0!1786) (size!17981 a!2986))) lt!266367))))

(assert (=> d!86017 (validMask!0 mask!3053)))

(assert (=> d!86017 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266367 vacantSpotIndex!68 (select (store (arr!17617 a!2986) i!1108 k0!1786) j!136) (array!36691 (store (arr!17617 a!2986) i!1108 k0!1786) (size!17981 a!2986)) mask!3053) lt!266393)))

(declare-fun b!587371 () Bool)

(assert (=> b!587371 (= e!335594 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!266367 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (store (arr!17617 a!2986) i!1108 k0!1786) j!136) (array!36691 (store (arr!17617 a!2986) i!1108 k0!1786) (size!17981 a!2986)) mask!3053))))

(declare-fun b!587372 () Bool)

(assert (=> b!587372 (= e!335595 (Found!6013 lt!266367))))

(declare-fun b!587373 () Bool)

(assert (=> b!587373 (= e!335593 Undefined!6013)))

(declare-fun b!587374 () Bool)

(assert (=> b!587374 (= e!335593 e!335595)))

(declare-fun c!66524 () Bool)

(assert (=> b!587374 (= c!66524 (= lt!266394 (select (store (arr!17617 a!2986) i!1108 k0!1786) j!136)))))

(assert (= (and d!86017 c!66522) b!587373))

(assert (= (and d!86017 (not c!66522)) b!587374))

(assert (= (and b!587374 c!66524) b!587372))

(assert (= (and b!587374 (not c!66524)) b!587370))

(assert (= (and b!587370 c!66523) b!587369))

(assert (= (and b!587370 (not c!66523)) b!587371))

(declare-fun m!566001 () Bool)

(assert (=> d!86017 m!566001))

(declare-fun m!566003 () Bool)

(assert (=> d!86017 m!566003))

(declare-fun m!566005 () Bool)

(assert (=> d!86017 m!566005))

(assert (=> d!86017 m!565901))

(assert (=> b!587371 m!565997))

(assert (=> b!587371 m!565997))

(assert (=> b!587371 m!565907))

(declare-fun m!566007 () Bool)

(assert (=> b!587371 m!566007))

(assert (=> b!587284 d!86017))

(declare-fun d!86019 () Bool)

(declare-fun e!335606 () Bool)

(assert (=> d!86019 e!335606))

(declare-fun res!375070 () Bool)

(assert (=> d!86019 (=> (not res!375070) (not e!335606))))

(assert (=> d!86019 (= res!375070 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!17981 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17981 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!17981 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17981 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17981 a!2986))))))

(declare-fun lt!266397 () Unit!18223)

(declare-fun choose!9 (array!36690 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18223)

(assert (=> d!86019 (= lt!266397 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266367 vacantSpotIndex!68 mask!3053))))

(assert (=> d!86019 (validMask!0 mask!3053)))

(assert (=> d!86019 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266367 vacantSpotIndex!68 mask!3053) lt!266397)))

(declare-fun b!587387 () Bool)

(assert (=> b!587387 (= e!335606 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266367 vacantSpotIndex!68 (select (arr!17617 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266367 vacantSpotIndex!68 (select (store (arr!17617 a!2986) i!1108 k0!1786) j!136) (array!36691 (store (arr!17617 a!2986) i!1108 k0!1786) (size!17981 a!2986)) mask!3053)))))

(assert (= (and d!86019 res!375070) b!587387))

(declare-fun m!566009 () Bool)

(assert (=> d!86019 m!566009))

(assert (=> d!86019 m!565901))

(assert (=> b!587387 m!565889))

(assert (=> b!587387 m!565877))

(assert (=> b!587387 m!565913))

(assert (=> b!587387 m!565907))

(assert (=> b!587387 m!565877))

(assert (=> b!587387 m!565907))

(assert (=> b!587387 m!565911))

(assert (=> b!587284 d!86019))

(declare-fun d!86023 () Bool)

(declare-fun lt!266400 () (_ BitVec 32))

(assert (=> d!86023 (and (bvsge lt!266400 #b00000000000000000000000000000000) (bvslt lt!266400 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86023 (= lt!266400 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!86023 (validMask!0 mask!3053)))

(assert (=> d!86023 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!266400)))

(declare-fun bs!18194 () Bool)

(assert (= bs!18194 d!86023))

(declare-fun m!566019 () Bool)

(assert (=> bs!18194 m!566019))

(assert (=> bs!18194 m!565901))

(assert (=> b!587284 d!86023))

(declare-fun b!587411 () Bool)

(declare-fun e!335625 () SeekEntryResult!6013)

(declare-fun lt!266408 () SeekEntryResult!6013)

(assert (=> b!587411 (= e!335625 (MissingZero!6013 (index!26281 lt!266408)))))

(declare-fun d!86027 () Bool)

(declare-fun lt!266409 () SeekEntryResult!6013)

(assert (=> d!86027 (and (or ((_ is Undefined!6013) lt!266409) (not ((_ is Found!6013) lt!266409)) (and (bvsge (index!26280 lt!266409) #b00000000000000000000000000000000) (bvslt (index!26280 lt!266409) (size!17981 a!2986)))) (or ((_ is Undefined!6013) lt!266409) ((_ is Found!6013) lt!266409) (not ((_ is MissingZero!6013) lt!266409)) (and (bvsge (index!26279 lt!266409) #b00000000000000000000000000000000) (bvslt (index!26279 lt!266409) (size!17981 a!2986)))) (or ((_ is Undefined!6013) lt!266409) ((_ is Found!6013) lt!266409) ((_ is MissingZero!6013) lt!266409) (not ((_ is MissingVacant!6013) lt!266409)) (and (bvsge (index!26282 lt!266409) #b00000000000000000000000000000000) (bvslt (index!26282 lt!266409) (size!17981 a!2986)))) (or ((_ is Undefined!6013) lt!266409) (ite ((_ is Found!6013) lt!266409) (= (select (arr!17617 a!2986) (index!26280 lt!266409)) k0!1786) (ite ((_ is MissingZero!6013) lt!266409) (= (select (arr!17617 a!2986) (index!26279 lt!266409)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6013) lt!266409) (= (select (arr!17617 a!2986) (index!26282 lt!266409)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!335624 () SeekEntryResult!6013)

(assert (=> d!86027 (= lt!266409 e!335624)))

(declare-fun c!66536 () Bool)

(assert (=> d!86027 (= c!66536 (and ((_ is Intermediate!6013) lt!266408) (undefined!6825 lt!266408)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36690 (_ BitVec 32)) SeekEntryResult!6013)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86027 (= lt!266408 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!86027 (validMask!0 mask!3053)))

(assert (=> d!86027 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!266409)))

(declare-fun b!587412 () Bool)

(declare-fun e!335623 () SeekEntryResult!6013)

(assert (=> b!587412 (= e!335624 e!335623)))

(declare-fun lt!266407 () (_ BitVec 64))

(assert (=> b!587412 (= lt!266407 (select (arr!17617 a!2986) (index!26281 lt!266408)))))

(declare-fun c!66535 () Bool)

(assert (=> b!587412 (= c!66535 (= lt!266407 k0!1786))))

(declare-fun b!587413 () Bool)

(assert (=> b!587413 (= e!335624 Undefined!6013)))

(declare-fun b!587414 () Bool)

(declare-fun c!66534 () Bool)

(assert (=> b!587414 (= c!66534 (= lt!266407 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!587414 (= e!335623 e!335625)))

(declare-fun b!587415 () Bool)

(assert (=> b!587415 (= e!335625 (seekKeyOrZeroReturnVacant!0 (x!55237 lt!266408) (index!26281 lt!266408) (index!26281 lt!266408) k0!1786 a!2986 mask!3053))))

(declare-fun b!587416 () Bool)

(assert (=> b!587416 (= e!335623 (Found!6013 (index!26281 lt!266408)))))

(assert (= (and d!86027 c!66536) b!587413))

(assert (= (and d!86027 (not c!66536)) b!587412))

(assert (= (and b!587412 c!66535) b!587416))

(assert (= (and b!587412 (not c!66535)) b!587414))

(assert (= (and b!587414 c!66534) b!587411))

(assert (= (and b!587414 (not c!66534)) b!587415))

(declare-fun m!566023 () Bool)

(assert (=> d!86027 m!566023))

(declare-fun m!566025 () Bool)

(assert (=> d!86027 m!566025))

(declare-fun m!566027 () Bool)

(assert (=> d!86027 m!566027))

(declare-fun m!566029 () Bool)

(assert (=> d!86027 m!566029))

(assert (=> d!86027 m!566027))

(assert (=> d!86027 m!565901))

(declare-fun m!566031 () Bool)

(assert (=> d!86027 m!566031))

(declare-fun m!566033 () Bool)

(assert (=> b!587412 m!566033))

(declare-fun m!566035 () Bool)

(assert (=> b!587415 m!566035))

(assert (=> b!587274 d!86027))

(declare-fun d!86035 () Bool)

(assert (=> d!86035 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!587279 d!86035))

(declare-fun d!86039 () Bool)

(assert (=> d!86039 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!53844 d!86039))

(declare-fun d!86047 () Bool)

(assert (=> d!86047 (= (array_inv!13476 a!2986) (bvsge (size!17981 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!53844 d!86047))

(declare-fun b!587472 () Bool)

(declare-fun e!335667 () Bool)

(declare-fun e!335664 () Bool)

(assert (=> b!587472 (= e!335667 e!335664)))

(declare-fun c!66554 () Bool)

(assert (=> b!587472 (= c!66554 (validKeyInArray!0 (select (arr!17617 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!587473 () Bool)

(declare-fun e!335666 () Bool)

(assert (=> b!587473 (= e!335666 e!335667)))

(declare-fun res!375103 () Bool)

(assert (=> b!587473 (=> (not res!375103) (not e!335667))))

(declare-fun e!335665 () Bool)

(assert (=> b!587473 (= res!375103 (not e!335665))))

(declare-fun res!375102 () Bool)

(assert (=> b!587473 (=> (not res!375102) (not e!335665))))

(assert (=> b!587473 (= res!375102 (validKeyInArray!0 (select (arr!17617 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!32790 () Bool)

(declare-fun call!32793 () Bool)

(assert (=> bm!32790 (= call!32793 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!66554 (Cons!11561 (select (arr!17617 a!2986) #b00000000000000000000000000000000) Nil!11562) Nil!11562)))))

(declare-fun b!587474 () Bool)

(declare-fun contains!2877 (List!11565 (_ BitVec 64)) Bool)

(assert (=> b!587474 (= e!335665 (contains!2877 Nil!11562 (select (arr!17617 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!587475 () Bool)

(assert (=> b!587475 (= e!335664 call!32793)))

(declare-fun d!86051 () Bool)

(declare-fun res!375101 () Bool)

(assert (=> d!86051 (=> res!375101 e!335666)))

(assert (=> d!86051 (= res!375101 (bvsge #b00000000000000000000000000000000 (size!17981 a!2986)))))

(assert (=> d!86051 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11562) e!335666)))

(declare-fun b!587476 () Bool)

(assert (=> b!587476 (= e!335664 call!32793)))

(assert (= (and d!86051 (not res!375101)) b!587473))

(assert (= (and b!587473 res!375102) b!587474))

(assert (= (and b!587473 res!375103) b!587472))

(assert (= (and b!587472 c!66554) b!587475))

(assert (= (and b!587472 (not c!66554)) b!587476))

(assert (= (or b!587475 b!587476) bm!32790))

(declare-fun m!566063 () Bool)

(assert (=> b!587472 m!566063))

(assert (=> b!587472 m!566063))

(declare-fun m!566067 () Bool)

(assert (=> b!587472 m!566067))

(assert (=> b!587473 m!566063))

(assert (=> b!587473 m!566063))

(assert (=> b!587473 m!566067))

(assert (=> bm!32790 m!566063))

(declare-fun m!566071 () Bool)

(assert (=> bm!32790 m!566071))

(assert (=> b!587474 m!566063))

(assert (=> b!587474 m!566063))

(declare-fun m!566073 () Bool)

(assert (=> b!587474 m!566073))

(assert (=> b!587276 d!86051))

(declare-fun b!587477 () Bool)

(declare-fun e!335669 () SeekEntryResult!6013)

(assert (=> b!587477 (= e!335669 (MissingVacant!6013 vacantSpotIndex!68))))

(declare-fun b!587478 () Bool)

(declare-fun c!66556 () Bool)

(declare-fun lt!266429 () (_ BitVec 64))

(assert (=> b!587478 (= c!66556 (= lt!266429 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!335670 () SeekEntryResult!6013)

(assert (=> b!587478 (= e!335670 e!335669)))

(declare-fun lt!266428 () SeekEntryResult!6013)

(declare-fun d!86055 () Bool)

(assert (=> d!86055 (and (or ((_ is Undefined!6013) lt!266428) (not ((_ is Found!6013) lt!266428)) (and (bvsge (index!26280 lt!266428) #b00000000000000000000000000000000) (bvslt (index!26280 lt!266428) (size!17981 a!2986)))) (or ((_ is Undefined!6013) lt!266428) ((_ is Found!6013) lt!266428) (not ((_ is MissingVacant!6013) lt!266428)) (not (= (index!26282 lt!266428) vacantSpotIndex!68)) (and (bvsge (index!26282 lt!266428) #b00000000000000000000000000000000) (bvslt (index!26282 lt!266428) (size!17981 a!2986)))) (or ((_ is Undefined!6013) lt!266428) (ite ((_ is Found!6013) lt!266428) (= (select (arr!17617 a!2986) (index!26280 lt!266428)) (select (arr!17617 a!2986) j!136)) (and ((_ is MissingVacant!6013) lt!266428) (= (index!26282 lt!266428) vacantSpotIndex!68) (= (select (arr!17617 a!2986) (index!26282 lt!266428)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!335668 () SeekEntryResult!6013)

(assert (=> d!86055 (= lt!266428 e!335668)))

(declare-fun c!66555 () Bool)

(assert (=> d!86055 (= c!66555 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!86055 (= lt!266429 (select (arr!17617 a!2986) index!984))))

(assert (=> d!86055 (validMask!0 mask!3053)))

(assert (=> d!86055 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17617 a!2986) j!136) a!2986 mask!3053) lt!266428)))

(declare-fun b!587479 () Bool)

(assert (=> b!587479 (= e!335669 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!17617 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!587480 () Bool)

(assert (=> b!587480 (= e!335670 (Found!6013 index!984))))

(declare-fun b!587481 () Bool)

(assert (=> b!587481 (= e!335668 Undefined!6013)))

(declare-fun b!587482 () Bool)

(assert (=> b!587482 (= e!335668 e!335670)))

(declare-fun c!66557 () Bool)

(assert (=> b!587482 (= c!66557 (= lt!266429 (select (arr!17617 a!2986) j!136)))))

(assert (= (and d!86055 c!66555) b!587481))

(assert (= (and d!86055 (not c!66555)) b!587482))

(assert (= (and b!587482 c!66557) b!587480))

(assert (= (and b!587482 (not c!66557)) b!587478))

(assert (= (and b!587478 c!66556) b!587477))

(assert (= (and b!587478 (not c!66556)) b!587479))

(declare-fun m!566075 () Bool)

(assert (=> d!86055 m!566075))

(declare-fun m!566077 () Bool)

(assert (=> d!86055 m!566077))

(assert (=> d!86055 m!565895))

(assert (=> d!86055 m!565901))

(declare-fun m!566079 () Bool)

(assert (=> b!587479 m!566079))

(assert (=> b!587479 m!566079))

(assert (=> b!587479 m!565877))

(declare-fun m!566081 () Bool)

(assert (=> b!587479 m!566081))

(assert (=> b!587281 d!86055))

(declare-fun d!86057 () Bool)

(assert (=> d!86057 (= (validKeyInArray!0 (select (arr!17617 a!2986) j!136)) (and (not (= (select (arr!17617 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17617 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!587282 d!86057))

(declare-fun b!587521 () Bool)

(declare-fun e!335694 () Bool)

(declare-fun e!335692 () Bool)

(assert (=> b!587521 (= e!335694 e!335692)))

(declare-fun c!66575 () Bool)

(assert (=> b!587521 (= c!66575 (validKeyInArray!0 (select (arr!17617 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!587523 () Bool)

(declare-fun e!335693 () Bool)

(declare-fun call!32796 () Bool)

(assert (=> b!587523 (= e!335693 call!32796)))

(declare-fun bm!32793 () Bool)

(assert (=> bm!32793 (= call!32796 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!587524 () Bool)

(assert (=> b!587524 (= e!335692 call!32796)))

(declare-fun d!86059 () Bool)

(declare-fun res!375109 () Bool)

(assert (=> d!86059 (=> res!375109 e!335694)))

(assert (=> d!86059 (= res!375109 (bvsge #b00000000000000000000000000000000 (size!17981 a!2986)))))

(assert (=> d!86059 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!335694)))

(declare-fun b!587522 () Bool)

(assert (=> b!587522 (= e!335692 e!335693)))

(declare-fun lt!266446 () (_ BitVec 64))

(assert (=> b!587522 (= lt!266446 (select (arr!17617 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!266447 () Unit!18223)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!36690 (_ BitVec 64) (_ BitVec 32)) Unit!18223)

(assert (=> b!587522 (= lt!266447 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!266446 #b00000000000000000000000000000000))))

(assert (=> b!587522 (arrayContainsKey!0 a!2986 lt!266446 #b00000000000000000000000000000000)))

(declare-fun lt!266448 () Unit!18223)

(assert (=> b!587522 (= lt!266448 lt!266447)))

(declare-fun res!375108 () Bool)

(assert (=> b!587522 (= res!375108 (= (seekEntryOrOpen!0 (select (arr!17617 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6013 #b00000000000000000000000000000000)))))

(assert (=> b!587522 (=> (not res!375108) (not e!335693))))

(assert (= (and d!86059 (not res!375109)) b!587521))

(assert (= (and b!587521 c!66575) b!587522))

(assert (= (and b!587521 (not c!66575)) b!587524))

(assert (= (and b!587522 res!375108) b!587523))

(assert (= (or b!587523 b!587524) bm!32793))

(assert (=> b!587521 m!566063))

(assert (=> b!587521 m!566063))

(assert (=> b!587521 m!566067))

(declare-fun m!566109 () Bool)

(assert (=> bm!32793 m!566109))

(assert (=> b!587522 m!566063))

(declare-fun m!566111 () Bool)

(assert (=> b!587522 m!566111))

(declare-fun m!566113 () Bool)

(assert (=> b!587522 m!566113))

(assert (=> b!587522 m!566063))

(declare-fun m!566115 () Bool)

(assert (=> b!587522 m!566115))

(assert (=> b!587277 d!86059))

(declare-fun d!86067 () Bool)

(declare-fun res!375114 () Bool)

(declare-fun e!335705 () Bool)

(assert (=> d!86067 (=> res!375114 e!335705)))

(assert (=> d!86067 (= res!375114 (= (select (arr!17617 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!86067 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!335705)))

(declare-fun b!587541 () Bool)

(declare-fun e!335706 () Bool)

(assert (=> b!587541 (= e!335705 e!335706)))

(declare-fun res!375115 () Bool)

(assert (=> b!587541 (=> (not res!375115) (not e!335706))))

(assert (=> b!587541 (= res!375115 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17981 a!2986)))))

(declare-fun b!587542 () Bool)

(assert (=> b!587542 (= e!335706 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!86067 (not res!375114)) b!587541))

(assert (= (and b!587541 res!375115) b!587542))

(assert (=> d!86067 m!566063))

(declare-fun m!566117 () Bool)

(assert (=> b!587542 m!566117))

(assert (=> b!587278 d!86067))

(check-sat (not d!86015) (not bm!32790) (not b!587521) (not b!587415) (not bm!32793) (not d!86019) (not b!587371) (not d!86055) (not b!587522) (not b!587474) (not b!587472) (not d!86023) (not d!86017) (not b!587479) (not b!587542) (not b!587387) (not b!587473) (not b!587365) (not d!86027))
(check-sat)

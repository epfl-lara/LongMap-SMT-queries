; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55606 () Bool)

(assert start!55606)

(declare-fun b!609718 () Bool)

(declare-fun res!392201 () Bool)

(declare-fun e!349212 () Bool)

(assert (=> b!609718 (=> (not res!392201) (not e!349212))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!609718 (= res!392201 (validKeyInArray!0 k!1786))))

(declare-fun b!609719 () Bool)

(declare-fun res!392208 () Bool)

(declare-fun e!349214 () Bool)

(assert (=> b!609719 (=> (not res!392208) (not e!349214))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37337 0))(
  ( (array!37338 (arr!17919 (Array (_ BitVec 32) (_ BitVec 64))) (size!18283 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37337)

(assert (=> b!609719 (= res!392208 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17919 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!609720 () Bool)

(declare-fun res!392211 () Bool)

(assert (=> b!609720 (=> (not res!392211) (not e!349212))))

(declare-fun arrayContainsKey!0 (array!37337 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!609720 (= res!392211 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!609721 () Bool)

(declare-fun e!349207 () Bool)

(declare-datatypes ((SeekEntryResult!6359 0))(
  ( (MissingZero!6359 (index!27711 (_ BitVec 32))) (Found!6359 (index!27712 (_ BitVec 32))) (Intermediate!6359 (undefined!7171 Bool) (index!27713 (_ BitVec 32)) (x!56516 (_ BitVec 32))) (Undefined!6359) (MissingVacant!6359 (index!27714 (_ BitVec 32))) )
))
(declare-fun lt!278765 () SeekEntryResult!6359)

(declare-fun lt!278763 () SeekEntryResult!6359)

(assert (=> b!609721 (= e!349207 (= lt!278765 lt!278763))))

(declare-fun b!609722 () Bool)

(declare-fun e!349205 () Bool)

(declare-fun e!349209 () Bool)

(assert (=> b!609722 (= e!349205 e!349209)))

(declare-fun res!392214 () Bool)

(assert (=> b!609722 (=> (not res!392214) (not e!349209))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!609722 (= res!392214 (and (= lt!278765 (Found!6359 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17919 a!2986) index!984) (select (arr!17919 a!2986) j!136))) (not (= (select (arr!17919 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37337 (_ BitVec 32)) SeekEntryResult!6359)

(assert (=> b!609722 (= lt!278765 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17919 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!609723 () Bool)

(declare-fun e!349217 () Bool)

(declare-fun e!349216 () Bool)

(assert (=> b!609723 (= e!349217 e!349216)))

(declare-fun res!392216 () Bool)

(assert (=> b!609723 (=> res!392216 e!349216)))

(declare-fun lt!278775 () (_ BitVec 64))

(declare-fun lt!278778 () (_ BitVec 64))

(assert (=> b!609723 (= res!392216 (or (not (= (select (arr!17919 a!2986) j!136) lt!278775)) (not (= (select (arr!17919 a!2986) j!136) lt!278778)) (bvsge j!136 index!984)))))

(declare-fun res!392206 () Bool)

(assert (=> start!55606 (=> (not res!392206) (not e!349212))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55606 (= res!392206 (validMask!0 mask!3053))))

(assert (=> start!55606 e!349212))

(assert (=> start!55606 true))

(declare-fun array_inv!13715 (array!37337) Bool)

(assert (=> start!55606 (array_inv!13715 a!2986)))

(declare-fun b!609724 () Bool)

(declare-fun res!392198 () Bool)

(assert (=> b!609724 (=> (not res!392198) (not e!349212))))

(assert (=> b!609724 (= res!392198 (validKeyInArray!0 (select (arr!17919 a!2986) j!136)))))

(declare-fun b!609725 () Bool)

(declare-fun e!349210 () Bool)

(assert (=> b!609725 (= e!349216 e!349210)))

(declare-fun res!392209 () Bool)

(assert (=> b!609725 (=> (not res!392209) (not e!349210))))

(declare-fun lt!278768 () array!37337)

(assert (=> b!609725 (= res!392209 (arrayContainsKey!0 lt!278768 (select (arr!17919 a!2986) j!136) j!136))))

(declare-fun b!609726 () Bool)

(declare-datatypes ((Unit!19534 0))(
  ( (Unit!19535) )
))
(declare-fun e!349204 () Unit!19534)

(declare-fun Unit!19536 () Unit!19534)

(assert (=> b!609726 (= e!349204 Unit!19536)))

(assert (=> b!609726 false))

(declare-fun b!609727 () Bool)

(assert (=> b!609727 (= e!349212 e!349214)))

(declare-fun res!392200 () Bool)

(assert (=> b!609727 (=> (not res!392200) (not e!349214))))

(declare-fun lt!278766 () SeekEntryResult!6359)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!609727 (= res!392200 (or (= lt!278766 (MissingZero!6359 i!1108)) (= lt!278766 (MissingVacant!6359 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37337 (_ BitVec 32)) SeekEntryResult!6359)

(assert (=> b!609727 (= lt!278766 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!609728 () Bool)

(declare-fun res!392199 () Bool)

(assert (=> b!609728 (=> (not res!392199) (not e!349212))))

(assert (=> b!609728 (= res!392199 (and (= (size!18283 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18283 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18283 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!609729 () Bool)

(declare-fun res!392212 () Bool)

(assert (=> b!609729 (=> (not res!392212) (not e!349214))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37337 (_ BitVec 32)) Bool)

(assert (=> b!609729 (= res!392212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun e!349211 () Bool)

(declare-fun b!609730 () Bool)

(assert (=> b!609730 (= e!349211 (arrayContainsKey!0 lt!278768 (select (arr!17919 a!2986) j!136) index!984))))

(declare-fun b!609731 () Bool)

(assert (=> b!609731 (= e!349214 e!349205)))

(declare-fun res!392203 () Bool)

(assert (=> b!609731 (=> (not res!392203) (not e!349205))))

(assert (=> b!609731 (= res!392203 (= (select (store (arr!17919 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!609731 (= lt!278768 (array!37338 (store (arr!17919 a!2986) i!1108 k!1786) (size!18283 a!2986)))))

(declare-fun b!609732 () Bool)

(declare-fun e!349218 () Unit!19534)

(declare-fun Unit!19537 () Unit!19534)

(assert (=> b!609732 (= e!349218 Unit!19537)))

(declare-fun b!609733 () Bool)

(declare-fun e!349206 () Bool)

(declare-fun e!349213 () Bool)

(assert (=> b!609733 (= e!349206 e!349213)))

(declare-fun res!392207 () Bool)

(assert (=> b!609733 (=> res!392207 e!349213)))

(assert (=> b!609733 (= res!392207 (bvsge index!984 j!136))))

(declare-fun lt!278777 () Unit!19534)

(assert (=> b!609733 (= lt!278777 e!349218)))

(declare-fun c!69127 () Bool)

(assert (=> b!609733 (= c!69127 (bvslt j!136 index!984))))

(declare-fun b!609734 () Bool)

(declare-fun Unit!19538 () Unit!19534)

(assert (=> b!609734 (= e!349204 Unit!19538)))

(declare-fun b!609735 () Bool)

(declare-fun e!349208 () Bool)

(assert (=> b!609735 (= e!349208 e!349206)))

(declare-fun res!392210 () Bool)

(assert (=> b!609735 (=> res!392210 e!349206)))

(assert (=> b!609735 (= res!392210 (or (not (= (select (arr!17919 a!2986) j!136) lt!278775)) (not (= (select (arr!17919 a!2986) j!136) lt!278778))))))

(assert (=> b!609735 e!349217))

(declare-fun res!392202 () Bool)

(assert (=> b!609735 (=> (not res!392202) (not e!349217))))

(assert (=> b!609735 (= res!392202 (= lt!278778 (select (arr!17919 a!2986) j!136)))))

(assert (=> b!609735 (= lt!278778 (select (store (arr!17919 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!609736 () Bool)

(declare-fun Unit!19539 () Unit!19534)

(assert (=> b!609736 (= e!349218 Unit!19539)))

(declare-fun lt!278776 () Unit!19534)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37337 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19534)

(assert (=> b!609736 (= lt!278776 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278768 (select (arr!17919 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!609736 (arrayContainsKey!0 lt!278768 (select (arr!17919 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!278771 () Unit!19534)

(declare-datatypes ((List!11960 0))(
  ( (Nil!11957) (Cons!11956 (h!13001 (_ BitVec 64)) (t!18188 List!11960)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37337 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11960) Unit!19534)

(assert (=> b!609736 (= lt!278771 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11957))))

(declare-fun arrayNoDuplicates!0 (array!37337 (_ BitVec 32) List!11960) Bool)

(assert (=> b!609736 (arrayNoDuplicates!0 lt!278768 #b00000000000000000000000000000000 Nil!11957)))

(declare-fun lt!278767 () Unit!19534)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37337 (_ BitVec 32) (_ BitVec 32)) Unit!19534)

(assert (=> b!609736 (= lt!278767 (lemmaNoDuplicateFromThenFromBigger!0 lt!278768 #b00000000000000000000000000000000 j!136))))

(assert (=> b!609736 (arrayNoDuplicates!0 lt!278768 j!136 Nil!11957)))

(declare-fun lt!278774 () Unit!19534)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37337 (_ BitVec 64) (_ BitVec 32) List!11960) Unit!19534)

(assert (=> b!609736 (= lt!278774 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!278768 (select (arr!17919 a!2986) j!136) j!136 Nil!11957))))

(assert (=> b!609736 false))

(declare-fun b!609737 () Bool)

(assert (=> b!609737 (= e!349213 (bvsle #b00000000000000000000000000000000 (size!18283 a!2986)))))

(assert (=> b!609737 (arrayNoDuplicates!0 lt!278768 #b00000000000000000000000000000000 Nil!11957)))

(declare-fun lt!278770 () Unit!19534)

(assert (=> b!609737 (= lt!278770 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11957))))

(assert (=> b!609737 (arrayContainsKey!0 lt!278768 (select (arr!17919 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!278779 () Unit!19534)

(assert (=> b!609737 (= lt!278779 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278768 (select (arr!17919 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!609737 e!349211))

(declare-fun res!392204 () Bool)

(assert (=> b!609737 (=> (not res!392204) (not e!349211))))

(assert (=> b!609737 (= res!392204 (arrayContainsKey!0 lt!278768 (select (arr!17919 a!2986) j!136) j!136))))

(declare-fun b!609738 () Bool)

(assert (=> b!609738 (= e!349209 (not e!349208))))

(declare-fun res!392213 () Bool)

(assert (=> b!609738 (=> res!392213 e!349208)))

(declare-fun lt!278764 () SeekEntryResult!6359)

(assert (=> b!609738 (= res!392213 (not (= lt!278764 (Found!6359 index!984))))))

(declare-fun lt!278769 () Unit!19534)

(assert (=> b!609738 (= lt!278769 e!349204)))

(declare-fun c!69128 () Bool)

(assert (=> b!609738 (= c!69128 (= lt!278764 Undefined!6359))))

(assert (=> b!609738 (= lt!278764 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!278775 lt!278768 mask!3053))))

(assert (=> b!609738 e!349207))

(declare-fun res!392215 () Bool)

(assert (=> b!609738 (=> (not res!392215) (not e!349207))))

(declare-fun lt!278772 () (_ BitVec 32))

(assert (=> b!609738 (= res!392215 (= lt!278763 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278772 vacantSpotIndex!68 lt!278775 lt!278768 mask!3053)))))

(assert (=> b!609738 (= lt!278763 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278772 vacantSpotIndex!68 (select (arr!17919 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!609738 (= lt!278775 (select (store (arr!17919 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!278773 () Unit!19534)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37337 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19534)

(assert (=> b!609738 (= lt!278773 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!278772 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!609738 (= lt!278772 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!609739 () Bool)

(declare-fun res!392205 () Bool)

(assert (=> b!609739 (=> (not res!392205) (not e!349214))))

(assert (=> b!609739 (= res!392205 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11957))))

(declare-fun b!609740 () Bool)

(assert (=> b!609740 (= e!349210 (arrayContainsKey!0 lt!278768 (select (arr!17919 a!2986) j!136) index!984))))

(assert (= (and start!55606 res!392206) b!609728))

(assert (= (and b!609728 res!392199) b!609724))

(assert (= (and b!609724 res!392198) b!609718))

(assert (= (and b!609718 res!392201) b!609720))

(assert (= (and b!609720 res!392211) b!609727))

(assert (= (and b!609727 res!392200) b!609729))

(assert (= (and b!609729 res!392212) b!609739))

(assert (= (and b!609739 res!392205) b!609719))

(assert (= (and b!609719 res!392208) b!609731))

(assert (= (and b!609731 res!392203) b!609722))

(assert (= (and b!609722 res!392214) b!609738))

(assert (= (and b!609738 res!392215) b!609721))

(assert (= (and b!609738 c!69128) b!609726))

(assert (= (and b!609738 (not c!69128)) b!609734))

(assert (= (and b!609738 (not res!392213)) b!609735))

(assert (= (and b!609735 res!392202) b!609723))

(assert (= (and b!609723 (not res!392216)) b!609725))

(assert (= (and b!609725 res!392209) b!609740))

(assert (= (and b!609735 (not res!392210)) b!609733))

(assert (= (and b!609733 c!69127) b!609736))

(assert (= (and b!609733 (not c!69127)) b!609732))

(assert (= (and b!609733 (not res!392207)) b!609737))

(assert (= (and b!609737 res!392204) b!609730))

(declare-fun m!586211 () Bool)

(assert (=> b!609724 m!586211))

(assert (=> b!609724 m!586211))

(declare-fun m!586213 () Bool)

(assert (=> b!609724 m!586213))

(declare-fun m!586215 () Bool)

(assert (=> b!609722 m!586215))

(assert (=> b!609722 m!586211))

(assert (=> b!609722 m!586211))

(declare-fun m!586217 () Bool)

(assert (=> b!609722 m!586217))

(declare-fun m!586219 () Bool)

(assert (=> b!609729 m!586219))

(assert (=> b!609735 m!586211))

(declare-fun m!586221 () Bool)

(assert (=> b!609735 m!586221))

(declare-fun m!586223 () Bool)

(assert (=> b!609735 m!586223))

(declare-fun m!586225 () Bool)

(assert (=> b!609739 m!586225))

(assert (=> b!609736 m!586211))

(declare-fun m!586227 () Bool)

(assert (=> b!609736 m!586227))

(assert (=> b!609736 m!586211))

(assert (=> b!609736 m!586211))

(declare-fun m!586229 () Bool)

(assert (=> b!609736 m!586229))

(assert (=> b!609736 m!586211))

(declare-fun m!586231 () Bool)

(assert (=> b!609736 m!586231))

(declare-fun m!586233 () Bool)

(assert (=> b!609736 m!586233))

(declare-fun m!586235 () Bool)

(assert (=> b!609736 m!586235))

(declare-fun m!586237 () Bool)

(assert (=> b!609736 m!586237))

(declare-fun m!586239 () Bool)

(assert (=> b!609736 m!586239))

(assert (=> b!609723 m!586211))

(declare-fun m!586241 () Bool)

(assert (=> b!609738 m!586241))

(declare-fun m!586243 () Bool)

(assert (=> b!609738 m!586243))

(declare-fun m!586245 () Bool)

(assert (=> b!609738 m!586245))

(assert (=> b!609738 m!586211))

(assert (=> b!609738 m!586221))

(declare-fun m!586247 () Bool)

(assert (=> b!609738 m!586247))

(declare-fun m!586249 () Bool)

(assert (=> b!609738 m!586249))

(assert (=> b!609738 m!586211))

(declare-fun m!586251 () Bool)

(assert (=> b!609738 m!586251))

(assert (=> b!609740 m!586211))

(assert (=> b!609740 m!586211))

(declare-fun m!586253 () Bool)

(assert (=> b!609740 m!586253))

(assert (=> b!609725 m!586211))

(assert (=> b!609725 m!586211))

(declare-fun m!586255 () Bool)

(assert (=> b!609725 m!586255))

(declare-fun m!586257 () Bool)

(assert (=> b!609720 m!586257))

(assert (=> b!609737 m!586211))

(assert (=> b!609737 m!586255))

(assert (=> b!609737 m!586211))

(declare-fun m!586259 () Bool)

(assert (=> b!609737 m!586259))

(assert (=> b!609737 m!586211))

(assert (=> b!609737 m!586239))

(assert (=> b!609737 m!586235))

(assert (=> b!609737 m!586211))

(declare-fun m!586261 () Bool)

(assert (=> b!609737 m!586261))

(declare-fun m!586263 () Bool)

(assert (=> b!609718 m!586263))

(declare-fun m!586265 () Bool)

(assert (=> start!55606 m!586265))

(declare-fun m!586267 () Bool)

(assert (=> start!55606 m!586267))

(declare-fun m!586269 () Bool)

(assert (=> b!609719 m!586269))

(assert (=> b!609731 m!586221))

(declare-fun m!586271 () Bool)

(assert (=> b!609731 m!586271))

(assert (=> b!609730 m!586211))

(assert (=> b!609730 m!586211))

(assert (=> b!609730 m!586253))

(declare-fun m!586273 () Bool)

(assert (=> b!609727 m!586273))

(push 1)


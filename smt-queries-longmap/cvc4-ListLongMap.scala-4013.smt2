; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54554 () Bool)

(assert start!54554)

(declare-fun b!596482 () Bool)

(declare-fun e!340796 () Bool)

(declare-datatypes ((SeekEntryResult!6211 0))(
  ( (MissingZero!6211 (index!27092 (_ BitVec 32))) (Found!6211 (index!27093 (_ BitVec 32))) (Intermediate!6211 (undefined!7023 Bool) (index!27094 (_ BitVec 32)) (x!55887 (_ BitVec 32))) (Undefined!6211) (MissingVacant!6211 (index!27095 (_ BitVec 32))) )
))
(declare-fun lt!270925 () SeekEntryResult!6211)

(declare-fun lt!270915 () SeekEntryResult!6211)

(assert (=> b!596482 (= e!340796 (= lt!270925 lt!270915))))

(declare-fun b!596483 () Bool)

(declare-fun e!340803 () Bool)

(declare-fun e!340798 () Bool)

(assert (=> b!596483 (= e!340803 e!340798)))

(declare-fun res!382282 () Bool)

(assert (=> b!596483 (=> (not res!382282) (not e!340798))))

(declare-datatypes ((array!37014 0))(
  ( (array!37015 (arr!17771 (Array (_ BitVec 32) (_ BitVec 64))) (size!18135 (_ BitVec 32))) )
))
(declare-fun lt!270919 () array!37014)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!37014)

(declare-fun arrayContainsKey!0 (array!37014 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!596483 (= res!382282 (arrayContainsKey!0 lt!270919 (select (arr!17771 a!2986) j!136) j!136))))

(declare-fun b!596484 () Bool)

(declare-fun res!382281 () Bool)

(declare-fun e!340797 () Bool)

(assert (=> b!596484 (=> res!382281 e!340797)))

(declare-datatypes ((List!11812 0))(
  ( (Nil!11809) (Cons!11808 (h!12853 (_ BitVec 64)) (t!18040 List!11812)) )
))
(declare-fun contains!2947 (List!11812 (_ BitVec 64)) Bool)

(assert (=> b!596484 (= res!382281 (contains!2947 Nil!11809 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!382285 () Bool)

(declare-fun e!340792 () Bool)

(assert (=> start!54554 (=> (not res!382285) (not e!340792))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54554 (= res!382285 (validMask!0 mask!3053))))

(assert (=> start!54554 e!340792))

(assert (=> start!54554 true))

(declare-fun array_inv!13567 (array!37014) Bool)

(assert (=> start!54554 (array_inv!13567 a!2986)))

(declare-fun b!596485 () Bool)

(declare-fun res!382286 () Bool)

(assert (=> b!596485 (=> (not res!382286) (not e!340792))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!596485 (= res!382286 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!596486 () Bool)

(declare-fun e!340800 () Bool)

(assert (=> b!596486 (= e!340800 e!340797)))

(declare-fun res!382280 () Bool)

(assert (=> b!596486 (=> res!382280 e!340797)))

(assert (=> b!596486 (= res!382280 (or (bvsge (size!18135 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18135 a!2986))))))

(assert (=> b!596486 (arrayContainsKey!0 lt!270919 (select (arr!17771 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-datatypes ((Unit!18762 0))(
  ( (Unit!18763) )
))
(declare-fun lt!270923 () Unit!18762)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37014 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18762)

(assert (=> b!596486 (= lt!270923 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270919 (select (arr!17771 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!596487 () Bool)

(declare-fun e!340793 () Bool)

(assert (=> b!596487 (= e!340793 e!340803)))

(declare-fun res!382273 () Bool)

(assert (=> b!596487 (=> res!382273 e!340803)))

(declare-fun lt!270924 () (_ BitVec 64))

(declare-fun lt!270922 () (_ BitVec 64))

(assert (=> b!596487 (= res!382273 (or (not (= (select (arr!17771 a!2986) j!136) lt!270922)) (not (= (select (arr!17771 a!2986) j!136) lt!270924)) (bvsge j!136 index!984)))))

(declare-fun b!596488 () Bool)

(declare-fun e!340801 () Bool)

(declare-fun e!340795 () Bool)

(assert (=> b!596488 (= e!340801 (not e!340795))))

(declare-fun res!382283 () Bool)

(assert (=> b!596488 (=> res!382283 e!340795)))

(declare-fun lt!270916 () SeekEntryResult!6211)

(assert (=> b!596488 (= res!382283 (not (= lt!270916 (Found!6211 index!984))))))

(declare-fun lt!270920 () Unit!18762)

(declare-fun e!340802 () Unit!18762)

(assert (=> b!596488 (= lt!270920 e!340802)))

(declare-fun c!67475 () Bool)

(assert (=> b!596488 (= c!67475 (= lt!270916 Undefined!6211))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37014 (_ BitVec 32)) SeekEntryResult!6211)

(assert (=> b!596488 (= lt!270916 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270922 lt!270919 mask!3053))))

(assert (=> b!596488 e!340796))

(declare-fun res!382275 () Bool)

(assert (=> b!596488 (=> (not res!382275) (not e!340796))))

(declare-fun lt!270917 () (_ BitVec 32))

(assert (=> b!596488 (= res!382275 (= lt!270915 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270917 vacantSpotIndex!68 lt!270922 lt!270919 mask!3053)))))

(assert (=> b!596488 (= lt!270915 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270917 vacantSpotIndex!68 (select (arr!17771 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!596488 (= lt!270922 (select (store (arr!17771 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!270914 () Unit!18762)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37014 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18762)

(assert (=> b!596488 (= lt!270914 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270917 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!596488 (= lt!270917 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!596489 () Bool)

(declare-fun e!340794 () Bool)

(declare-fun e!340799 () Bool)

(assert (=> b!596489 (= e!340794 e!340799)))

(declare-fun res!382279 () Bool)

(assert (=> b!596489 (=> (not res!382279) (not e!340799))))

(assert (=> b!596489 (= res!382279 (= (select (store (arr!17771 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!596489 (= lt!270919 (array!37015 (store (arr!17771 a!2986) i!1108 k!1786) (size!18135 a!2986)))))

(declare-fun b!596490 () Bool)

(assert (=> b!596490 (= e!340797 true)))

(declare-fun lt!270918 () Bool)

(assert (=> b!596490 (= lt!270918 (contains!2947 Nil!11809 k!1786))))

(declare-fun b!596491 () Bool)

(declare-fun res!382271 () Bool)

(assert (=> b!596491 (=> (not res!382271) (not e!340794))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37014 (_ BitVec 32)) Bool)

(assert (=> b!596491 (= res!382271 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!596492 () Bool)

(declare-fun Unit!18764 () Unit!18762)

(assert (=> b!596492 (= e!340802 Unit!18764)))

(assert (=> b!596492 false))

(declare-fun b!596493 () Bool)

(assert (=> b!596493 (= e!340799 e!340801)))

(declare-fun res!382278 () Bool)

(assert (=> b!596493 (=> (not res!382278) (not e!340801))))

(assert (=> b!596493 (= res!382278 (and (= lt!270925 (Found!6211 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17771 a!2986) index!984) (select (arr!17771 a!2986) j!136))) (not (= (select (arr!17771 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!596493 (= lt!270925 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17771 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!596494 () Bool)

(declare-fun res!382274 () Bool)

(assert (=> b!596494 (=> (not res!382274) (not e!340792))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!596494 (= res!382274 (validKeyInArray!0 k!1786))))

(declare-fun b!596495 () Bool)

(assert (=> b!596495 (= e!340798 (arrayContainsKey!0 lt!270919 (select (arr!17771 a!2986) j!136) index!984))))

(declare-fun b!596496 () Bool)

(assert (=> b!596496 (= e!340792 e!340794)))

(declare-fun res!382276 () Bool)

(assert (=> b!596496 (=> (not res!382276) (not e!340794))))

(declare-fun lt!270921 () SeekEntryResult!6211)

(assert (=> b!596496 (= res!382276 (or (= lt!270921 (MissingZero!6211 i!1108)) (= lt!270921 (MissingVacant!6211 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37014 (_ BitVec 32)) SeekEntryResult!6211)

(assert (=> b!596496 (= lt!270921 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!596497 () Bool)

(declare-fun res!382270 () Bool)

(assert (=> b!596497 (=> (not res!382270) (not e!340792))))

(assert (=> b!596497 (= res!382270 (and (= (size!18135 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18135 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18135 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!596498 () Bool)

(declare-fun res!382277 () Bool)

(assert (=> b!596498 (=> res!382277 e!340797)))

(declare-fun noDuplicate!266 (List!11812) Bool)

(assert (=> b!596498 (= res!382277 (not (noDuplicate!266 Nil!11809)))))

(declare-fun b!596499 () Bool)

(declare-fun res!382272 () Bool)

(assert (=> b!596499 (=> res!382272 e!340797)))

(assert (=> b!596499 (= res!382272 (contains!2947 Nil!11809 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!596500 () Bool)

(declare-fun res!382266 () Bool)

(assert (=> b!596500 (=> (not res!382266) (not e!340792))))

(assert (=> b!596500 (= res!382266 (validKeyInArray!0 (select (arr!17771 a!2986) j!136)))))

(declare-fun b!596501 () Bool)

(declare-fun res!382269 () Bool)

(assert (=> b!596501 (=> (not res!382269) (not e!340794))))

(declare-fun arrayNoDuplicates!0 (array!37014 (_ BitVec 32) List!11812) Bool)

(assert (=> b!596501 (= res!382269 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11809))))

(declare-fun b!596502 () Bool)

(declare-fun Unit!18765 () Unit!18762)

(assert (=> b!596502 (= e!340802 Unit!18765)))

(declare-fun b!596503 () Bool)

(assert (=> b!596503 (= e!340795 e!340800)))

(declare-fun res!382284 () Bool)

(assert (=> b!596503 (=> res!382284 e!340800)))

(assert (=> b!596503 (= res!382284 (or (not (= (select (arr!17771 a!2986) j!136) lt!270922)) (not (= (select (arr!17771 a!2986) j!136) lt!270924)) (bvsge j!136 index!984)))))

(assert (=> b!596503 e!340793))

(declare-fun res!382267 () Bool)

(assert (=> b!596503 (=> (not res!382267) (not e!340793))))

(assert (=> b!596503 (= res!382267 (= lt!270924 (select (arr!17771 a!2986) j!136)))))

(assert (=> b!596503 (= lt!270924 (select (store (arr!17771 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!596504 () Bool)

(declare-fun res!382268 () Bool)

(assert (=> b!596504 (=> (not res!382268) (not e!340794))))

(assert (=> b!596504 (= res!382268 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17771 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!54554 res!382285) b!596497))

(assert (= (and b!596497 res!382270) b!596500))

(assert (= (and b!596500 res!382266) b!596494))

(assert (= (and b!596494 res!382274) b!596485))

(assert (= (and b!596485 res!382286) b!596496))

(assert (= (and b!596496 res!382276) b!596491))

(assert (= (and b!596491 res!382271) b!596501))

(assert (= (and b!596501 res!382269) b!596504))

(assert (= (and b!596504 res!382268) b!596489))

(assert (= (and b!596489 res!382279) b!596493))

(assert (= (and b!596493 res!382278) b!596488))

(assert (= (and b!596488 res!382275) b!596482))

(assert (= (and b!596488 c!67475) b!596492))

(assert (= (and b!596488 (not c!67475)) b!596502))

(assert (= (and b!596488 (not res!382283)) b!596503))

(assert (= (and b!596503 res!382267) b!596487))

(assert (= (and b!596487 (not res!382273)) b!596483))

(assert (= (and b!596483 res!382282) b!596495))

(assert (= (and b!596503 (not res!382284)) b!596486))

(assert (= (and b!596486 (not res!382280)) b!596498))

(assert (= (and b!596498 (not res!382277)) b!596484))

(assert (= (and b!596484 (not res!382281)) b!596499))

(assert (= (and b!596499 (not res!382272)) b!596490))

(declare-fun m!573967 () Bool)

(assert (=> b!596501 m!573967))

(declare-fun m!573969 () Bool)

(assert (=> b!596504 m!573969))

(declare-fun m!573971 () Bool)

(assert (=> b!596496 m!573971))

(declare-fun m!573973 () Bool)

(assert (=> b!596488 m!573973))

(declare-fun m!573975 () Bool)

(assert (=> b!596488 m!573975))

(declare-fun m!573977 () Bool)

(assert (=> b!596488 m!573977))

(declare-fun m!573979 () Bool)

(assert (=> b!596488 m!573979))

(declare-fun m!573981 () Bool)

(assert (=> b!596488 m!573981))

(declare-fun m!573983 () Bool)

(assert (=> b!596488 m!573983))

(declare-fun m!573985 () Bool)

(assert (=> b!596488 m!573985))

(assert (=> b!596488 m!573975))

(declare-fun m!573987 () Bool)

(assert (=> b!596488 m!573987))

(declare-fun m!573989 () Bool)

(assert (=> b!596498 m!573989))

(declare-fun m!573991 () Bool)

(assert (=> b!596499 m!573991))

(assert (=> b!596489 m!573977))

(declare-fun m!573993 () Bool)

(assert (=> b!596489 m!573993))

(assert (=> b!596487 m!573975))

(declare-fun m!573995 () Bool)

(assert (=> b!596491 m!573995))

(declare-fun m!573997 () Bool)

(assert (=> b!596493 m!573997))

(assert (=> b!596493 m!573975))

(assert (=> b!596493 m!573975))

(declare-fun m!573999 () Bool)

(assert (=> b!596493 m!573999))

(assert (=> b!596486 m!573975))

(assert (=> b!596486 m!573975))

(declare-fun m!574001 () Bool)

(assert (=> b!596486 m!574001))

(assert (=> b!596486 m!573975))

(declare-fun m!574003 () Bool)

(assert (=> b!596486 m!574003))

(declare-fun m!574005 () Bool)

(assert (=> b!596484 m!574005))

(declare-fun m!574007 () Bool)

(assert (=> b!596485 m!574007))

(declare-fun m!574009 () Bool)

(assert (=> b!596494 m!574009))

(assert (=> b!596500 m!573975))

(assert (=> b!596500 m!573975))

(declare-fun m!574011 () Bool)

(assert (=> b!596500 m!574011))

(assert (=> b!596483 m!573975))

(assert (=> b!596483 m!573975))

(declare-fun m!574013 () Bool)

(assert (=> b!596483 m!574013))

(assert (=> b!596495 m!573975))

(assert (=> b!596495 m!573975))

(declare-fun m!574015 () Bool)

(assert (=> b!596495 m!574015))

(assert (=> b!596503 m!573975))

(assert (=> b!596503 m!573977))

(declare-fun m!574017 () Bool)

(assert (=> b!596503 m!574017))

(declare-fun m!574019 () Bool)

(assert (=> start!54554 m!574019))

(declare-fun m!574021 () Bool)

(assert (=> start!54554 m!574021))

(declare-fun m!574023 () Bool)

(assert (=> b!596490 m!574023))

(push 1)


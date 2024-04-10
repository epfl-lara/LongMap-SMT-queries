; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55586 () Bool)

(assert start!55586)

(declare-fun b!608916 () Bool)

(declare-fun e!348731 () Bool)

(declare-fun e!348734 () Bool)

(assert (=> b!608916 (= e!348731 e!348734)))

(declare-fun res!391533 () Bool)

(assert (=> b!608916 (=> (not res!391533) (not e!348734))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6349 0))(
  ( (MissingZero!6349 (index!27671 (_ BitVec 32))) (Found!6349 (index!27672 (_ BitVec 32))) (Intermediate!6349 (undefined!7161 Bool) (index!27673 (_ BitVec 32)) (x!56474 (_ BitVec 32))) (Undefined!6349) (MissingVacant!6349 (index!27674 (_ BitVec 32))) )
))
(declare-fun lt!278265 () SeekEntryResult!6349)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37317 0))(
  ( (array!37318 (arr!17909 (Array (_ BitVec 32) (_ BitVec 64))) (size!18273 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37317)

(assert (=> b!608916 (= res!391533 (and (= lt!278265 (Found!6349 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17909 a!2986) index!984) (select (arr!17909 a!2986) j!136))) (not (= (select (arr!17909 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37317 (_ BitVec 32)) SeekEntryResult!6349)

(assert (=> b!608916 (= lt!278265 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17909 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!608917 () Bool)

(declare-fun e!348733 () Bool)

(declare-fun lt!278254 () SeekEntryResult!6349)

(assert (=> b!608917 (= e!348733 (= lt!278265 lt!278254))))

(declare-fun res!391526 () Bool)

(declare-fun e!348741 () Bool)

(assert (=> start!55586 (=> (not res!391526) (not e!348741))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55586 (= res!391526 (validMask!0 mask!3053))))

(assert (=> start!55586 e!348741))

(assert (=> start!55586 true))

(declare-fun array_inv!13705 (array!37317) Bool)

(assert (=> start!55586 (array_inv!13705 a!2986)))

(declare-fun b!608918 () Bool)

(declare-datatypes ((Unit!19474 0))(
  ( (Unit!19475) )
))
(declare-fun e!348727 () Unit!19474)

(declare-fun Unit!19476 () Unit!19474)

(assert (=> b!608918 (= e!348727 Unit!19476)))

(declare-fun b!608919 () Bool)

(declare-fun res!391528 () Bool)

(assert (=> b!608919 (=> (not res!391528) (not e!348741))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37317 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!608919 (= res!391528 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun lt!278258 () array!37317)

(declare-fun b!608920 () Bool)

(declare-fun e!348740 () Bool)

(assert (=> b!608920 (= e!348740 (arrayContainsKey!0 lt!278258 (select (arr!17909 a!2986) j!136) index!984))))

(declare-fun b!608921 () Bool)

(declare-fun e!348730 () Bool)

(assert (=> b!608921 (= e!348730 true)))

(declare-fun lt!278262 () Bool)

(declare-datatypes ((List!11950 0))(
  ( (Nil!11947) (Cons!11946 (h!12991 (_ BitVec 64)) (t!18178 List!11950)) )
))
(declare-fun contains!3026 (List!11950 (_ BitVec 64)) Bool)

(assert (=> b!608921 (= lt!278262 (contains!3026 Nil!11947 k!1786))))

(declare-fun b!608922 () Bool)

(declare-fun e!348729 () Bool)

(assert (=> b!608922 (= e!348729 e!348731)))

(declare-fun res!391524 () Bool)

(assert (=> b!608922 (=> (not res!391524) (not e!348731))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!608922 (= res!391524 (= (select (store (arr!17909 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!608922 (= lt!278258 (array!37318 (store (arr!17909 a!2986) i!1108 k!1786) (size!18273 a!2986)))))

(declare-fun b!608923 () Bool)

(declare-fun res!391520 () Bool)

(assert (=> b!608923 (=> res!391520 e!348730)))

(assert (=> b!608923 (= res!391520 (contains!3026 Nil!11947 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!608924 () Bool)

(declare-fun e!348738 () Bool)

(declare-fun e!348726 () Bool)

(assert (=> b!608924 (= e!348738 e!348726)))

(declare-fun res!391521 () Bool)

(assert (=> b!608924 (=> res!391521 e!348726)))

(declare-fun lt!278259 () (_ BitVec 64))

(declare-fun lt!278255 () (_ BitVec 64))

(assert (=> b!608924 (= res!391521 (or (not (= (select (arr!17909 a!2986) j!136) lt!278255)) (not (= (select (arr!17909 a!2986) j!136) lt!278259))))))

(declare-fun e!348737 () Bool)

(assert (=> b!608924 e!348737))

(declare-fun res!391525 () Bool)

(assert (=> b!608924 (=> (not res!391525) (not e!348737))))

(assert (=> b!608924 (= res!391525 (= lt!278259 (select (arr!17909 a!2986) j!136)))))

(assert (=> b!608924 (= lt!278259 (select (store (arr!17909 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!608925 () Bool)

(assert (=> b!608925 (= e!348741 e!348729)))

(declare-fun res!391519 () Bool)

(assert (=> b!608925 (=> (not res!391519) (not e!348729))))

(declare-fun lt!278267 () SeekEntryResult!6349)

(assert (=> b!608925 (= res!391519 (or (= lt!278267 (MissingZero!6349 i!1108)) (= lt!278267 (MissingVacant!6349 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37317 (_ BitVec 32)) SeekEntryResult!6349)

(assert (=> b!608925 (= lt!278267 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!608926 () Bool)

(declare-fun res!391516 () Bool)

(assert (=> b!608926 (=> (not res!391516) (not e!348729))))

(declare-fun arrayNoDuplicates!0 (array!37317 (_ BitVec 32) List!11950) Bool)

(assert (=> b!608926 (= res!391516 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11947))))

(declare-fun b!608927 () Bool)

(declare-fun Unit!19477 () Unit!19474)

(assert (=> b!608927 (= e!348727 Unit!19477)))

(declare-fun lt!278268 () Unit!19474)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37317 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19474)

(assert (=> b!608927 (= lt!278268 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278258 (select (arr!17909 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!608927 (arrayContainsKey!0 lt!278258 (select (arr!17909 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!278253 () Unit!19474)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37317 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11950) Unit!19474)

(assert (=> b!608927 (= lt!278253 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11947))))

(assert (=> b!608927 (arrayNoDuplicates!0 lt!278258 #b00000000000000000000000000000000 Nil!11947)))

(declare-fun lt!278256 () Unit!19474)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37317 (_ BitVec 32) (_ BitVec 32)) Unit!19474)

(assert (=> b!608927 (= lt!278256 (lemmaNoDuplicateFromThenFromBigger!0 lt!278258 #b00000000000000000000000000000000 j!136))))

(assert (=> b!608927 (arrayNoDuplicates!0 lt!278258 j!136 Nil!11947)))

(declare-fun lt!278257 () Unit!19474)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37317 (_ BitVec 64) (_ BitVec 32) List!11950) Unit!19474)

(assert (=> b!608927 (= lt!278257 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!278258 (select (arr!17909 a!2986) j!136) j!136 Nil!11947))))

(assert (=> b!608927 false))

(declare-fun b!608928 () Bool)

(declare-fun res!391532 () Bool)

(assert (=> b!608928 (=> (not res!391532) (not e!348741))))

(assert (=> b!608928 (= res!391532 (and (= (size!18273 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18273 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18273 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!608929 () Bool)

(declare-fun res!391536 () Bool)

(assert (=> b!608929 (=> (not res!391536) (not e!348741))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!608929 (= res!391536 (validKeyInArray!0 (select (arr!17909 a!2986) j!136)))))

(declare-fun b!608930 () Bool)

(declare-fun e!348739 () Bool)

(assert (=> b!608930 (= e!348739 e!348730)))

(declare-fun res!391534 () Bool)

(assert (=> b!608930 (=> res!391534 e!348730)))

(assert (=> b!608930 (= res!391534 (or (bvsge (size!18273 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18273 a!2986))))))

(assert (=> b!608930 (arrayContainsKey!0 lt!278258 (select (arr!17909 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!278261 () Unit!19474)

(assert (=> b!608930 (= lt!278261 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278258 (select (arr!17909 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!348735 () Bool)

(assert (=> b!608930 e!348735))

(declare-fun res!391522 () Bool)

(assert (=> b!608930 (=> (not res!391522) (not e!348735))))

(assert (=> b!608930 (= res!391522 (arrayContainsKey!0 lt!278258 (select (arr!17909 a!2986) j!136) j!136))))

(declare-fun b!608931 () Bool)

(declare-fun e!348732 () Unit!19474)

(declare-fun Unit!19478 () Unit!19474)

(assert (=> b!608931 (= e!348732 Unit!19478)))

(assert (=> b!608931 false))

(declare-fun b!608932 () Bool)

(assert (=> b!608932 (= e!348726 e!348739)))

(declare-fun res!391517 () Bool)

(assert (=> b!608932 (=> res!391517 e!348739)))

(assert (=> b!608932 (= res!391517 (bvsge index!984 j!136))))

(declare-fun lt!278263 () Unit!19474)

(assert (=> b!608932 (= lt!278263 e!348727)))

(declare-fun c!69067 () Bool)

(assert (=> b!608932 (= c!69067 (bvslt j!136 index!984))))

(declare-fun b!608933 () Bool)

(declare-fun e!348736 () Bool)

(assert (=> b!608933 (= e!348737 e!348736)))

(declare-fun res!391530 () Bool)

(assert (=> b!608933 (=> res!391530 e!348736)))

(assert (=> b!608933 (= res!391530 (or (not (= (select (arr!17909 a!2986) j!136) lt!278255)) (not (= (select (arr!17909 a!2986) j!136) lt!278259)) (bvsge j!136 index!984)))))

(declare-fun b!608934 () Bool)

(declare-fun res!391531 () Bool)

(assert (=> b!608934 (=> (not res!391531) (not e!348741))))

(assert (=> b!608934 (= res!391531 (validKeyInArray!0 k!1786))))

(declare-fun b!608935 () Bool)

(declare-fun res!391535 () Bool)

(assert (=> b!608935 (=> (not res!391535) (not e!348729))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37317 (_ BitVec 32)) Bool)

(assert (=> b!608935 (= res!391535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!608936 () Bool)

(assert (=> b!608936 (= e!348735 (arrayContainsKey!0 lt!278258 (select (arr!17909 a!2986) j!136) index!984))))

(declare-fun b!608937 () Bool)

(declare-fun res!391518 () Bool)

(assert (=> b!608937 (=> (not res!391518) (not e!348729))))

(assert (=> b!608937 (= res!391518 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17909 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!608938 () Bool)

(declare-fun res!391523 () Bool)

(assert (=> b!608938 (=> res!391523 e!348730)))

(assert (=> b!608938 (= res!391523 (contains!3026 Nil!11947 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!608939 () Bool)

(declare-fun res!391527 () Bool)

(assert (=> b!608939 (=> res!391527 e!348730)))

(declare-fun noDuplicate!332 (List!11950) Bool)

(assert (=> b!608939 (= res!391527 (not (noDuplicate!332 Nil!11947)))))

(declare-fun b!608940 () Bool)

(assert (=> b!608940 (= e!348736 e!348740)))

(declare-fun res!391537 () Bool)

(assert (=> b!608940 (=> (not res!391537) (not e!348740))))

(assert (=> b!608940 (= res!391537 (arrayContainsKey!0 lt!278258 (select (arr!17909 a!2986) j!136) j!136))))

(declare-fun b!608941 () Bool)

(declare-fun Unit!19479 () Unit!19474)

(assert (=> b!608941 (= e!348732 Unit!19479)))

(declare-fun b!608942 () Bool)

(assert (=> b!608942 (= e!348734 (not e!348738))))

(declare-fun res!391529 () Bool)

(assert (=> b!608942 (=> res!391529 e!348738)))

(declare-fun lt!278260 () SeekEntryResult!6349)

(assert (=> b!608942 (= res!391529 (not (= lt!278260 (Found!6349 index!984))))))

(declare-fun lt!278264 () Unit!19474)

(assert (=> b!608942 (= lt!278264 e!348732)))

(declare-fun c!69068 () Bool)

(assert (=> b!608942 (= c!69068 (= lt!278260 Undefined!6349))))

(assert (=> b!608942 (= lt!278260 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!278255 lt!278258 mask!3053))))

(assert (=> b!608942 e!348733))

(declare-fun res!391538 () Bool)

(assert (=> b!608942 (=> (not res!391538) (not e!348733))))

(declare-fun lt!278269 () (_ BitVec 32))

(assert (=> b!608942 (= res!391538 (= lt!278254 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278269 vacantSpotIndex!68 lt!278255 lt!278258 mask!3053)))))

(assert (=> b!608942 (= lt!278254 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278269 vacantSpotIndex!68 (select (arr!17909 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!608942 (= lt!278255 (select (store (arr!17909 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!278266 () Unit!19474)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37317 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19474)

(assert (=> b!608942 (= lt!278266 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!278269 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!608942 (= lt!278269 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!55586 res!391526) b!608928))

(assert (= (and b!608928 res!391532) b!608929))

(assert (= (and b!608929 res!391536) b!608934))

(assert (= (and b!608934 res!391531) b!608919))

(assert (= (and b!608919 res!391528) b!608925))

(assert (= (and b!608925 res!391519) b!608935))

(assert (= (and b!608935 res!391535) b!608926))

(assert (= (and b!608926 res!391516) b!608937))

(assert (= (and b!608937 res!391518) b!608922))

(assert (= (and b!608922 res!391524) b!608916))

(assert (= (and b!608916 res!391533) b!608942))

(assert (= (and b!608942 res!391538) b!608917))

(assert (= (and b!608942 c!69068) b!608931))

(assert (= (and b!608942 (not c!69068)) b!608941))

(assert (= (and b!608942 (not res!391529)) b!608924))

(assert (= (and b!608924 res!391525) b!608933))

(assert (= (and b!608933 (not res!391530)) b!608940))

(assert (= (and b!608940 res!391537) b!608920))

(assert (= (and b!608924 (not res!391521)) b!608932))

(assert (= (and b!608932 c!69067) b!608927))

(assert (= (and b!608932 (not c!69067)) b!608918))

(assert (= (and b!608932 (not res!391517)) b!608930))

(assert (= (and b!608930 res!391522) b!608936))

(assert (= (and b!608930 (not res!391534)) b!608939))

(assert (= (and b!608939 (not res!391527)) b!608938))

(assert (= (and b!608938 (not res!391523)) b!608923))

(assert (= (and b!608923 (not res!391520)) b!608921))

(declare-fun m!585491 () Bool)

(assert (=> b!608933 m!585491))

(assert (=> b!608920 m!585491))

(assert (=> b!608920 m!585491))

(declare-fun m!585493 () Bool)

(assert (=> b!608920 m!585493))

(declare-fun m!585495 () Bool)

(assert (=> b!608939 m!585495))

(declare-fun m!585497 () Bool)

(assert (=> b!608937 m!585497))

(assert (=> b!608940 m!585491))

(assert (=> b!608940 m!585491))

(declare-fun m!585499 () Bool)

(assert (=> b!608940 m!585499))

(declare-fun m!585501 () Bool)

(assert (=> b!608923 m!585501))

(declare-fun m!585503 () Bool)

(assert (=> b!608921 m!585503))

(declare-fun m!585505 () Bool)

(assert (=> b!608922 m!585505))

(declare-fun m!585507 () Bool)

(assert (=> b!608922 m!585507))

(assert (=> b!608929 m!585491))

(assert (=> b!608929 m!585491))

(declare-fun m!585509 () Bool)

(assert (=> b!608929 m!585509))

(declare-fun m!585511 () Bool)

(assert (=> b!608926 m!585511))

(assert (=> b!608924 m!585491))

(assert (=> b!608924 m!585505))

(declare-fun m!585513 () Bool)

(assert (=> b!608924 m!585513))

(declare-fun m!585515 () Bool)

(assert (=> b!608942 m!585515))

(assert (=> b!608942 m!585491))

(declare-fun m!585517 () Bool)

(assert (=> b!608942 m!585517))

(assert (=> b!608942 m!585491))

(declare-fun m!585519 () Bool)

(assert (=> b!608942 m!585519))

(assert (=> b!608942 m!585505))

(declare-fun m!585521 () Bool)

(assert (=> b!608942 m!585521))

(declare-fun m!585523 () Bool)

(assert (=> b!608942 m!585523))

(declare-fun m!585525 () Bool)

(assert (=> b!608942 m!585525))

(declare-fun m!585527 () Bool)

(assert (=> b!608938 m!585527))

(declare-fun m!585529 () Bool)

(assert (=> b!608935 m!585529))

(declare-fun m!585531 () Bool)

(assert (=> b!608919 m!585531))

(assert (=> b!608927 m!585491))

(declare-fun m!585533 () Bool)

(assert (=> b!608927 m!585533))

(assert (=> b!608927 m!585491))

(declare-fun m!585535 () Bool)

(assert (=> b!608927 m!585535))

(declare-fun m!585537 () Bool)

(assert (=> b!608927 m!585537))

(assert (=> b!608927 m!585491))

(assert (=> b!608927 m!585491))

(declare-fun m!585539 () Bool)

(assert (=> b!608927 m!585539))

(declare-fun m!585541 () Bool)

(assert (=> b!608927 m!585541))

(declare-fun m!585543 () Bool)

(assert (=> b!608927 m!585543))

(declare-fun m!585545 () Bool)

(assert (=> b!608927 m!585545))

(assert (=> b!608930 m!585491))

(assert (=> b!608930 m!585491))

(declare-fun m!585547 () Bool)

(assert (=> b!608930 m!585547))

(assert (=> b!608930 m!585491))

(declare-fun m!585549 () Bool)

(assert (=> b!608930 m!585549))

(assert (=> b!608930 m!585491))

(assert (=> b!608930 m!585499))

(declare-fun m!585551 () Bool)

(assert (=> start!55586 m!585551))

(declare-fun m!585553 () Bool)

(assert (=> start!55586 m!585553))

(declare-fun m!585555 () Bool)

(assert (=> b!608934 m!585555))

(assert (=> b!608936 m!585491))

(assert (=> b!608936 m!585491))

(assert (=> b!608936 m!585493))

(declare-fun m!585557 () Bool)

(assert (=> b!608925 m!585557))

(declare-fun m!585559 () Bool)

(assert (=> b!608916 m!585559))

(assert (=> b!608916 m!585491))

(assert (=> b!608916 m!585491))

(declare-fun m!585561 () Bool)

(assert (=> b!608916 m!585561))

(push 1)


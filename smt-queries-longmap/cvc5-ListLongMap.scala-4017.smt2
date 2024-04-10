; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54646 () Bool)

(assert start!54646)

(declare-fun b!597406 () Bool)

(declare-fun e!341380 () Bool)

(declare-fun e!341385 () Bool)

(assert (=> b!597406 (= e!341380 e!341385)))

(declare-fun res!382943 () Bool)

(assert (=> b!597406 (=> (not res!382943) (not e!341385))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37037 0))(
  ( (array!37038 (arr!17781 (Array (_ BitVec 32) (_ BitVec 64))) (size!18145 (_ BitVec 32))) )
))
(declare-fun lt!271407 () array!37037)

(declare-fun a!2986 () array!37037)

(declare-fun arrayContainsKey!0 (array!37037 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!597406 (= res!382943 (arrayContainsKey!0 lt!271407 (select (arr!17781 a!2986) j!136) j!136))))

(declare-fun b!597407 () Bool)

(declare-fun e!341379 () Bool)

(declare-fun e!341375 () Bool)

(assert (=> b!597407 (= e!341379 e!341375)))

(declare-fun res!382941 () Bool)

(assert (=> b!597407 (=> (not res!382941) (not e!341375))))

(declare-datatypes ((SeekEntryResult!6221 0))(
  ( (MissingZero!6221 (index!27135 (_ BitVec 32))) (Found!6221 (index!27136 (_ BitVec 32))) (Intermediate!6221 (undefined!7033 Bool) (index!27137 (_ BitVec 32)) (x!55938 (_ BitVec 32))) (Undefined!6221) (MissingVacant!6221 (index!27138 (_ BitVec 32))) )
))
(declare-fun lt!271408 () SeekEntryResult!6221)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!597407 (= res!382941 (or (= lt!271408 (MissingZero!6221 i!1108)) (= lt!271408 (MissingVacant!6221 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37037 (_ BitVec 32)) SeekEntryResult!6221)

(assert (=> b!597407 (= lt!271408 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!382931 () Bool)

(assert (=> start!54646 (=> (not res!382931) (not e!341379))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54646 (= res!382931 (validMask!0 mask!3053))))

(assert (=> start!54646 e!341379))

(assert (=> start!54646 true))

(declare-fun array_inv!13577 (array!37037) Bool)

(assert (=> start!54646 (array_inv!13577 a!2986)))

(declare-fun b!597408 () Bool)

(declare-fun e!341382 () Bool)

(declare-datatypes ((List!11822 0))(
  ( (Nil!11819) (Cons!11818 (h!12863 (_ BitVec 64)) (t!18050 List!11822)) )
))
(declare-fun noDuplicate!270 (List!11822) Bool)

(assert (=> b!597408 (= e!341382 (noDuplicate!270 Nil!11819))))

(declare-fun b!597409 () Bool)

(declare-fun res!382937 () Bool)

(assert (=> b!597409 (=> (not res!382937) (not e!341379))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!597409 (= res!382937 (validKeyInArray!0 k!1786))))

(declare-fun b!597410 () Bool)

(declare-fun e!341373 () Bool)

(assert (=> b!597410 (= e!341373 e!341382)))

(declare-fun res!382940 () Bool)

(assert (=> b!597410 (=> res!382940 e!341382)))

(assert (=> b!597410 (= res!382940 (or (bvsgt #b00000000000000000000000000000000 (size!18145 a!2986)) (bvsge (size!18145 a!2986) #b01111111111111111111111111111111)))))

(declare-fun arrayNoDuplicates!0 (array!37037 (_ BitVec 32) List!11822) Bool)

(assert (=> b!597410 (arrayNoDuplicates!0 lt!271407 #b00000000000000000000000000000000 Nil!11819)))

(declare-datatypes ((Unit!18802 0))(
  ( (Unit!18803) )
))
(declare-fun lt!271406 () Unit!18802)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37037 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11822) Unit!18802)

(assert (=> b!597410 (= lt!271406 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11819))))

(assert (=> b!597410 (arrayContainsKey!0 lt!271407 (select (arr!17781 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!271404 () Unit!18802)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37037 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18802)

(assert (=> b!597410 (= lt!271404 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!271407 (select (arr!17781 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!597411 () Bool)

(declare-fun res!382933 () Bool)

(assert (=> b!597411 (=> (not res!382933) (not e!341379))))

(assert (=> b!597411 (= res!382933 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!597412 () Bool)

(declare-fun e!341376 () Unit!18802)

(declare-fun Unit!18804 () Unit!18802)

(assert (=> b!597412 (= e!341376 Unit!18804)))

(declare-fun b!597413 () Bool)

(declare-fun Unit!18805 () Unit!18802)

(assert (=> b!597413 (= e!341376 Unit!18805)))

(assert (=> b!597413 false))

(declare-fun b!597414 () Bool)

(declare-fun e!341381 () Bool)

(assert (=> b!597414 (= e!341381 e!341380)))

(declare-fun res!382928 () Bool)

(assert (=> b!597414 (=> res!382928 e!341380)))

(declare-fun lt!271402 () (_ BitVec 64))

(declare-fun lt!271400 () (_ BitVec 64))

(assert (=> b!597414 (= res!382928 (or (not (= (select (arr!17781 a!2986) j!136) lt!271400)) (not (= (select (arr!17781 a!2986) j!136) lt!271402)) (bvsge j!136 index!984)))))

(declare-fun b!597415 () Bool)

(declare-fun e!341378 () Bool)

(declare-fun e!341383 () Bool)

(assert (=> b!597415 (= e!341378 (not e!341383))))

(declare-fun res!382936 () Bool)

(assert (=> b!597415 (=> res!382936 e!341383)))

(declare-fun lt!271401 () SeekEntryResult!6221)

(assert (=> b!597415 (= res!382936 (not (= lt!271401 (Found!6221 index!984))))))

(declare-fun lt!271405 () Unit!18802)

(assert (=> b!597415 (= lt!271405 e!341376)))

(declare-fun c!67607 () Bool)

(assert (=> b!597415 (= c!67607 (= lt!271401 Undefined!6221))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37037 (_ BitVec 32)) SeekEntryResult!6221)

(assert (=> b!597415 (= lt!271401 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!271400 lt!271407 mask!3053))))

(declare-fun e!341377 () Bool)

(assert (=> b!597415 e!341377))

(declare-fun res!382938 () Bool)

(assert (=> b!597415 (=> (not res!382938) (not e!341377))))

(declare-fun lt!271409 () SeekEntryResult!6221)

(declare-fun lt!271411 () (_ BitVec 32))

(assert (=> b!597415 (= res!382938 (= lt!271409 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271411 vacantSpotIndex!68 lt!271400 lt!271407 mask!3053)))))

(assert (=> b!597415 (= lt!271409 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271411 vacantSpotIndex!68 (select (arr!17781 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!597415 (= lt!271400 (select (store (arr!17781 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!271410 () Unit!18802)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37037 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18802)

(assert (=> b!597415 (= lt!271410 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271411 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!597415 (= lt!271411 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!597416 () Bool)

(assert (=> b!597416 (= e!341385 (arrayContainsKey!0 lt!271407 (select (arr!17781 a!2986) j!136) index!984))))

(declare-fun b!597417 () Bool)

(declare-fun res!382939 () Bool)

(assert (=> b!597417 (=> (not res!382939) (not e!341379))))

(assert (=> b!597417 (= res!382939 (validKeyInArray!0 (select (arr!17781 a!2986) j!136)))))

(declare-fun b!597418 () Bool)

(declare-fun res!382930 () Bool)

(assert (=> b!597418 (=> (not res!382930) (not e!341375))))

(assert (=> b!597418 (= res!382930 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11819))))

(declare-fun b!597419 () Bool)

(declare-fun e!341384 () Bool)

(assert (=> b!597419 (= e!341375 e!341384)))

(declare-fun res!382934 () Bool)

(assert (=> b!597419 (=> (not res!382934) (not e!341384))))

(assert (=> b!597419 (= res!382934 (= (select (store (arr!17781 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!597419 (= lt!271407 (array!37038 (store (arr!17781 a!2986) i!1108 k!1786) (size!18145 a!2986)))))

(declare-fun b!597420 () Bool)

(declare-fun lt!271403 () SeekEntryResult!6221)

(assert (=> b!597420 (= e!341377 (= lt!271403 lt!271409))))

(declare-fun b!597421 () Bool)

(declare-fun res!382926 () Bool)

(assert (=> b!597421 (=> (not res!382926) (not e!341375))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37037 (_ BitVec 32)) Bool)

(assert (=> b!597421 (= res!382926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!597422 () Bool)

(declare-fun res!382935 () Bool)

(assert (=> b!597422 (=> (not res!382935) (not e!341379))))

(assert (=> b!597422 (= res!382935 (and (= (size!18145 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18145 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18145 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!597423 () Bool)

(assert (=> b!597423 (= e!341383 e!341373)))

(declare-fun res!382929 () Bool)

(assert (=> b!597423 (=> res!382929 e!341373)))

(assert (=> b!597423 (= res!382929 (or (not (= (select (arr!17781 a!2986) j!136) lt!271400)) (not (= (select (arr!17781 a!2986) j!136) lt!271402)) (bvsge j!136 index!984)))))

(assert (=> b!597423 e!341381))

(declare-fun res!382927 () Bool)

(assert (=> b!597423 (=> (not res!382927) (not e!341381))))

(assert (=> b!597423 (= res!382927 (= lt!271402 (select (arr!17781 a!2986) j!136)))))

(assert (=> b!597423 (= lt!271402 (select (store (arr!17781 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!597424 () Bool)

(declare-fun res!382942 () Bool)

(assert (=> b!597424 (=> (not res!382942) (not e!341375))))

(assert (=> b!597424 (= res!382942 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17781 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!597425 () Bool)

(assert (=> b!597425 (= e!341384 e!341378)))

(declare-fun res!382932 () Bool)

(assert (=> b!597425 (=> (not res!382932) (not e!341378))))

(assert (=> b!597425 (= res!382932 (and (= lt!271403 (Found!6221 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17781 a!2986) index!984) (select (arr!17781 a!2986) j!136))) (not (= (select (arr!17781 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!597425 (= lt!271403 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17781 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!54646 res!382931) b!597422))

(assert (= (and b!597422 res!382935) b!597417))

(assert (= (and b!597417 res!382939) b!597409))

(assert (= (and b!597409 res!382937) b!597411))

(assert (= (and b!597411 res!382933) b!597407))

(assert (= (and b!597407 res!382941) b!597421))

(assert (= (and b!597421 res!382926) b!597418))

(assert (= (and b!597418 res!382930) b!597424))

(assert (= (and b!597424 res!382942) b!597419))

(assert (= (and b!597419 res!382934) b!597425))

(assert (= (and b!597425 res!382932) b!597415))

(assert (= (and b!597415 res!382938) b!597420))

(assert (= (and b!597415 c!67607) b!597413))

(assert (= (and b!597415 (not c!67607)) b!597412))

(assert (= (and b!597415 (not res!382936)) b!597423))

(assert (= (and b!597423 res!382927) b!597414))

(assert (= (and b!597414 (not res!382928)) b!597406))

(assert (= (and b!597406 res!382943) b!597416))

(assert (= (and b!597423 (not res!382929)) b!597410))

(assert (= (and b!597410 (not res!382940)) b!597408))

(declare-fun m!574805 () Bool)

(assert (=> b!597423 m!574805))

(declare-fun m!574807 () Bool)

(assert (=> b!597423 m!574807))

(declare-fun m!574809 () Bool)

(assert (=> b!597423 m!574809))

(declare-fun m!574811 () Bool)

(assert (=> b!597409 m!574811))

(declare-fun m!574813 () Bool)

(assert (=> b!597418 m!574813))

(declare-fun m!574815 () Bool)

(assert (=> b!597421 m!574815))

(assert (=> b!597417 m!574805))

(assert (=> b!597417 m!574805))

(declare-fun m!574817 () Bool)

(assert (=> b!597417 m!574817))

(assert (=> b!597414 m!574805))

(declare-fun m!574819 () Bool)

(assert (=> b!597415 m!574819))

(declare-fun m!574821 () Bool)

(assert (=> b!597415 m!574821))

(declare-fun m!574823 () Bool)

(assert (=> b!597415 m!574823))

(declare-fun m!574825 () Bool)

(assert (=> b!597415 m!574825))

(assert (=> b!597415 m!574805))

(declare-fun m!574827 () Bool)

(assert (=> b!597415 m!574827))

(assert (=> b!597415 m!574807))

(assert (=> b!597415 m!574805))

(declare-fun m!574829 () Bool)

(assert (=> b!597415 m!574829))

(declare-fun m!574831 () Bool)

(assert (=> b!597424 m!574831))

(declare-fun m!574833 () Bool)

(assert (=> b!597407 m!574833))

(declare-fun m!574835 () Bool)

(assert (=> b!597411 m!574835))

(declare-fun m!574837 () Bool)

(assert (=> b!597408 m!574837))

(declare-fun m!574839 () Bool)

(assert (=> b!597425 m!574839))

(assert (=> b!597425 m!574805))

(assert (=> b!597425 m!574805))

(declare-fun m!574841 () Bool)

(assert (=> b!597425 m!574841))

(declare-fun m!574843 () Bool)

(assert (=> start!54646 m!574843))

(declare-fun m!574845 () Bool)

(assert (=> start!54646 m!574845))

(declare-fun m!574847 () Bool)

(assert (=> b!597410 m!574847))

(assert (=> b!597410 m!574805))

(assert (=> b!597410 m!574805))

(declare-fun m!574849 () Bool)

(assert (=> b!597410 m!574849))

(assert (=> b!597410 m!574805))

(declare-fun m!574851 () Bool)

(assert (=> b!597410 m!574851))

(declare-fun m!574853 () Bool)

(assert (=> b!597410 m!574853))

(assert (=> b!597406 m!574805))

(assert (=> b!597406 m!574805))

(declare-fun m!574855 () Bool)

(assert (=> b!597406 m!574855))

(assert (=> b!597416 m!574805))

(assert (=> b!597416 m!574805))

(declare-fun m!574857 () Bool)

(assert (=> b!597416 m!574857))

(assert (=> b!597419 m!574807))

(declare-fun m!574859 () Bool)

(assert (=> b!597419 m!574859))

(push 1)

(assert (not b!597411))

(assert (not b!597425))

(assert (not b!597415))

(assert (not b!597416))

(assert (not b!597421))

(assert (not b!597417))

(assert (not b!597408))

(assert (not b!597410))

(assert (not b!597409))

(assert (not b!597406))

(assert (not b!597418))

(assert (not start!54646))

(assert (not b!597407))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86851 () Bool)

(assert (=> d!86851 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!597409 d!86851))

(declare-fun d!86855 () Bool)

(declare-fun res!383071 () Bool)

(declare-fun e!341498 () Bool)

(assert (=> d!86855 (=> res!383071 e!341498)))

(assert (=> d!86855 (= res!383071 (is-Nil!11819 Nil!11819))))

(assert (=> d!86855 (= (noDuplicate!270 Nil!11819) e!341498)))

(declare-fun b!597595 () Bool)

(declare-fun e!341499 () Bool)

(assert (=> b!597595 (= e!341498 e!341499)))

(declare-fun res!383072 () Bool)

(assert (=> b!597595 (=> (not res!383072) (not e!341499))))

(declare-fun contains!2955 (List!11822 (_ BitVec 64)) Bool)

(assert (=> b!597595 (= res!383072 (not (contains!2955 (t!18050 Nil!11819) (h!12863 Nil!11819))))))

(declare-fun b!597596 () Bool)

(assert (=> b!597596 (= e!341499 (noDuplicate!270 (t!18050 Nil!11819)))))

(assert (= (and d!86855 (not res!383071)) b!597595))

(assert (= (and b!597595 res!383072) b!597596))

(declare-fun m!575005 () Bool)

(assert (=> b!597595 m!575005))

(declare-fun m!575007 () Bool)

(assert (=> b!597596 m!575007))

(assert (=> b!597408 d!86855))

(declare-fun b!597610 () Bool)

(declare-fun e!341512 () Bool)

(declare-fun e!341511 () Bool)

(assert (=> b!597610 (= e!341512 e!341511)))

(declare-fun res!383084 () Bool)

(assert (=> b!597610 (=> (not res!383084) (not e!341511))))

(declare-fun e!341514 () Bool)

(assert (=> b!597610 (= res!383084 (not e!341514))))

(declare-fun res!383082 () Bool)

(assert (=> b!597610 (=> (not res!383082) (not e!341514))))

(assert (=> b!597610 (= res!383082 (validKeyInArray!0 (select (arr!17781 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!86857 () Bool)

(declare-fun res!383083 () Bool)

(assert (=> d!86857 (=> res!383083 e!341512)))

(assert (=> d!86857 (= res!383083 (bvsge #b00000000000000000000000000000000 (size!18145 a!2986)))))

(assert (=> d!86857 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11819) e!341512)))

(declare-fun bm!32927 () Bool)

(declare-fun call!32930 () Bool)

(declare-fun c!67631 () Bool)

(assert (=> bm!32927 (= call!32930 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!67631 (Cons!11818 (select (arr!17781 a!2986) #b00000000000000000000000000000000) Nil!11819) Nil!11819)))))

(declare-fun b!597611 () Bool)

(declare-fun e!341513 () Bool)

(assert (=> b!597611 (= e!341513 call!32930)))

(declare-fun b!597612 () Bool)

(assert (=> b!597612 (= e!341514 (contains!2955 Nil!11819 (select (arr!17781 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!597613 () Bool)

(assert (=> b!597613 (= e!341513 call!32930)))

(declare-fun b!597614 () Bool)

(assert (=> b!597614 (= e!341511 e!341513)))

(assert (=> b!597614 (= c!67631 (validKeyInArray!0 (select (arr!17781 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!86857 (not res!383083)) b!597610))

(assert (= (and b!597610 res!383082) b!597612))

(assert (= (and b!597610 res!383084) b!597614))

(assert (= (and b!597614 c!67631) b!597613))

(assert (= (and b!597614 (not c!67631)) b!597611))

(assert (= (or b!597613 b!597611) bm!32927))

(declare-fun m!575013 () Bool)

(assert (=> b!597610 m!575013))

(assert (=> b!597610 m!575013))

(declare-fun m!575015 () Bool)

(assert (=> b!597610 m!575015))

(assert (=> bm!32927 m!575013))

(declare-fun m!575017 () Bool)

(assert (=> bm!32927 m!575017))

(assert (=> b!597612 m!575013))

(assert (=> b!597612 m!575013))

(declare-fun m!575021 () Bool)

(assert (=> b!597612 m!575021))

(assert (=> b!597614 m!575013))

(assert (=> b!597614 m!575013))

(assert (=> b!597614 m!575015))

(assert (=> b!597418 d!86857))

(declare-fun b!597669 () Bool)

(declare-fun e!341550 () SeekEntryResult!6221)

(declare-fun lt!271521 () SeekEntryResult!6221)

(assert (=> b!597669 (= e!341550 (Found!6221 (index!27137 lt!271521)))))

(declare-fun b!597670 () Bool)

(declare-fun e!341549 () SeekEntryResult!6221)

(assert (=> b!597670 (= e!341549 (seekKeyOrZeroReturnVacant!0 (x!55938 lt!271521) (index!27137 lt!271521) (index!27137 lt!271521) k!1786 a!2986 mask!3053))))

(declare-fun b!597672 () Bool)

(declare-fun c!67655 () Bool)

(declare-fun lt!271523 () (_ BitVec 64))

(assert (=> b!597672 (= c!67655 (= lt!271523 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!597672 (= e!341550 e!341549)))

(declare-fun b!597673 () Bool)

(declare-fun e!341548 () SeekEntryResult!6221)

(assert (=> b!597673 (= e!341548 e!341550)))

(assert (=> b!597673 (= lt!271523 (select (arr!17781 a!2986) (index!27137 lt!271521)))))

(declare-fun c!67654 () Bool)

(assert (=> b!597673 (= c!67654 (= lt!271523 k!1786))))

(declare-fun b!597674 () Bool)

(assert (=> b!597674 (= e!341549 (MissingZero!6221 (index!27137 lt!271521)))))

(declare-fun b!597671 () Bool)

(assert (=> b!597671 (= e!341548 Undefined!6221)))

(declare-fun d!86861 () Bool)

(declare-fun lt!271522 () SeekEntryResult!6221)

(assert (=> d!86861 (and (or (is-Undefined!6221 lt!271522) (not (is-Found!6221 lt!271522)) (and (bvsge (index!27136 lt!271522) #b00000000000000000000000000000000) (bvslt (index!27136 lt!271522) (size!18145 a!2986)))) (or (is-Undefined!6221 lt!271522) (is-Found!6221 lt!271522) (not (is-MissingZero!6221 lt!271522)) (and (bvsge (index!27135 lt!271522) #b00000000000000000000000000000000) (bvslt (index!27135 lt!271522) (size!18145 a!2986)))) (or (is-Undefined!6221 lt!271522) (is-Found!6221 lt!271522) (is-MissingZero!6221 lt!271522) (not (is-MissingVacant!6221 lt!271522)) (and (bvsge (index!27138 lt!271522) #b00000000000000000000000000000000) (bvslt (index!27138 lt!271522) (size!18145 a!2986)))) (or (is-Undefined!6221 lt!271522) (ite (is-Found!6221 lt!271522) (= (select (arr!17781 a!2986) (index!27136 lt!271522)) k!1786) (ite (is-MissingZero!6221 lt!271522) (= (select (arr!17781 a!2986) (index!27135 lt!271522)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6221 lt!271522) (= (select (arr!17781 a!2986) (index!27138 lt!271522)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!86861 (= lt!271522 e!341548)))

(declare-fun c!67653 () Bool)

(assert (=> d!86861 (= c!67653 (and (is-Intermediate!6221 lt!271521) (undefined!7033 lt!271521)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37037 (_ BitVec 32)) SeekEntryResult!6221)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86861 (= lt!271521 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!86861 (validMask!0 mask!3053)))

(assert (=> d!86861 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!271522)))

(assert (= (and d!86861 c!67653) b!597671))

(assert (= (and d!86861 (not c!67653)) b!597673))

(assert (= (and b!597673 c!67654) b!597669))

(assert (= (and b!597673 (not c!67654)) b!597672))

(assert (= (and b!597672 c!67655) b!597674))

(assert (= (and b!597672 (not c!67655)) b!597670))

(declare-fun m!575045 () Bool)

(assert (=> b!597670 m!575045))

(declare-fun m!575047 () Bool)

(assert (=> b!597673 m!575047))

(declare-fun m!575049 () Bool)

(assert (=> d!86861 m!575049))

(declare-fun m!575051 () Bool)

(assert (=> d!86861 m!575051))

(declare-fun m!575053 () Bool)

(assert (=> d!86861 m!575053))

(declare-fun m!575055 () Bool)

(assert (=> d!86861 m!575055))

(assert (=> d!86861 m!574843))

(assert (=> d!86861 m!575049))

(declare-fun m!575057 () Bool)

(assert (=> d!86861 m!575057))

(assert (=> b!597407 d!86861))

(declare-fun d!86873 () Bool)

(declare-fun res!383101 () Bool)

(declare-fun e!341561 () Bool)

(assert (=> d!86873 (=> res!383101 e!341561)))

(assert (=> d!86873 (= res!383101 (= (select (arr!17781 lt!271407) j!136) (select (arr!17781 a!2986) j!136)))))

(assert (=> d!86873 (= (arrayContainsKey!0 lt!271407 (select (arr!17781 a!2986) j!136) j!136) e!341561)))

(declare-fun b!597691 () Bool)

(declare-fun e!341562 () Bool)

(assert (=> b!597691 (= e!341561 e!341562)))

(declare-fun res!383102 () Bool)

(assert (=> b!597691 (=> (not res!383102) (not e!341562))))

(assert (=> b!597691 (= res!383102 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18145 lt!271407)))))

(declare-fun b!597692 () Bool)

(assert (=> b!597692 (= e!341562 (arrayContainsKey!0 lt!271407 (select (arr!17781 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86873 (not res!383101)) b!597691))

(assert (= (and b!597691 res!383102) b!597692))

(declare-fun m!575059 () Bool)

(assert (=> d!86873 m!575059))

(assert (=> b!597692 m!574805))

(declare-fun m!575061 () Bool)

(assert (=> b!597692 m!575061))

(assert (=> b!597406 d!86873))

(declare-fun d!86879 () Bool)

(assert (=> d!86879 (= (validKeyInArray!0 (select (arr!17781 a!2986) j!136)) (and (not (= (select (arr!17781 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17781 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!597417 d!86879))

(declare-fun d!86881 () Bool)

(declare-fun res!383103 () Bool)

(declare-fun e!341563 () Bool)

(assert (=> d!86881 (=> res!383103 e!341563)))

(assert (=> d!86881 (= res!383103 (= (select (arr!17781 lt!271407) index!984) (select (arr!17781 a!2986) j!136)))))

(assert (=> d!86881 (= (arrayContainsKey!0 lt!271407 (select (arr!17781 a!2986) j!136) index!984) e!341563)))

(declare-fun b!597693 () Bool)

(declare-fun e!341564 () Bool)

(assert (=> b!597693 (= e!341563 e!341564)))

(declare-fun res!383104 () Bool)

(assert (=> b!597693 (=> (not res!383104) (not e!341564))))

(assert (=> b!597693 (= res!383104 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18145 lt!271407)))))

(declare-fun b!597694 () Bool)

(assert (=> b!597694 (= e!341564 (arrayContainsKey!0 lt!271407 (select (arr!17781 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!86881 (not res!383103)) b!597693))

(assert (= (and b!597693 res!383104) b!597694))

(declare-fun m!575063 () Bool)

(assert (=> d!86881 m!575063))

(assert (=> b!597694 m!574805))

(declare-fun m!575065 () Bool)

(assert (=> b!597694 m!575065))

(assert (=> b!597416 d!86881))

(declare-fun d!86883 () Bool)

(declare-fun lt!271555 () SeekEntryResult!6221)

(assert (=> d!86883 (and (or (is-Undefined!6221 lt!271555) (not (is-Found!6221 lt!271555)) (and (bvsge (index!27136 lt!271555) #b00000000000000000000000000000000) (bvslt (index!27136 lt!271555) (size!18145 lt!271407)))) (or (is-Undefined!6221 lt!271555) (is-Found!6221 lt!271555) (not (is-MissingVacant!6221 lt!271555)) (not (= (index!27138 lt!271555) vacantSpotIndex!68)) (and (bvsge (index!27138 lt!271555) #b00000000000000000000000000000000) (bvslt (index!27138 lt!271555) (size!18145 lt!271407)))) (or (is-Undefined!6221 lt!271555) (ite (is-Found!6221 lt!271555) (= (select (arr!17781 lt!271407) (index!27136 lt!271555)) lt!271400) (and (is-MissingVacant!6221 lt!271555) (= (index!27138 lt!271555) vacantSpotIndex!68) (= (select (arr!17781 lt!271407) (index!27138 lt!271555)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!341591 () SeekEntryResult!6221)

(assert (=> d!86883 (= lt!271555 e!341591)))

(declare-fun c!67682 () Bool)

(assert (=> d!86883 (= c!67682 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!271556 () (_ BitVec 64))

(assert (=> d!86883 (= lt!271556 (select (arr!17781 lt!271407) lt!271411))))

(assert (=> d!86883 (validMask!0 mask!3053)))

(assert (=> d!86883 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271411 vacantSpotIndex!68 lt!271400 lt!271407 mask!3053) lt!271555)))

(declare-fun e!341589 () SeekEntryResult!6221)

(declare-fun b!597737 () Bool)

(assert (=> b!597737 (= e!341589 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!271411 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!271400 lt!271407 mask!3053))))

(declare-fun b!597738 () Bool)

(assert (=> b!597738 (= e!341591 Undefined!6221)))

(declare-fun b!597739 () Bool)

(declare-fun c!67681 () Bool)

(assert (=> b!597739 (= c!67681 (= lt!271556 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!341590 () SeekEntryResult!6221)

(assert (=> b!597739 (= e!341590 e!341589)))

(declare-fun b!597740 () Bool)

(assert (=> b!597740 (= e!341590 (Found!6221 lt!271411))))

(declare-fun b!597741 () Bool)

(assert (=> b!597741 (= e!341589 (MissingVacant!6221 vacantSpotIndex!68))))

(declare-fun b!597742 () Bool)

(assert (=> b!597742 (= e!341591 e!341590)))

(declare-fun c!67680 () Bool)

(assert (=> b!597742 (= c!67680 (= lt!271556 lt!271400))))

(assert (= (and d!86883 c!67682) b!597738))

(assert (= (and d!86883 (not c!67682)) b!597742))

(assert (= (and b!597742 c!67680) b!597740))

(assert (= (and b!597742 (not c!67680)) b!597739))

(assert (= (and b!597739 c!67681) b!597741))

(assert (= (and b!597739 (not c!67681)) b!597737))

(declare-fun m!575095 () Bool)

(assert (=> d!86883 m!575095))

(declare-fun m!575097 () Bool)

(assert (=> d!86883 m!575097))

(declare-fun m!575099 () Bool)

(assert (=> d!86883 m!575099))

(assert (=> d!86883 m!574843))

(declare-fun m!575101 () Bool)

(assert (=> b!597737 m!575101))

(assert (=> b!597737 m!575101))

(declare-fun m!575103 () Bool)

(assert (=> b!597737 m!575103))

(assert (=> b!597415 d!86883))

(declare-fun d!86893 () Bool)

(declare-fun lt!271559 () (_ BitVec 32))

(assert (=> d!86893 (and (bvsge lt!271559 #b00000000000000000000000000000000) (bvslt lt!271559 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86893 (= lt!271559 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!86893 (validMask!0 mask!3053)))

(assert (=> d!86893 (= (nextIndex!0 index!984 x!910 mask!3053) lt!271559)))

(declare-fun bs!18375 () Bool)

(assert (= bs!18375 d!86893))

(declare-fun m!575105 () Bool)

(assert (=> bs!18375 m!575105))

(assert (=> bs!18375 m!574843))

(assert (=> b!597415 d!86893))

(declare-fun lt!271563 () SeekEntryResult!6221)

(declare-fun d!86895 () Bool)

(assert (=> d!86895 (and (or (is-Undefined!6221 lt!271563) (not (is-Found!6221 lt!271563)) (and (bvsge (index!27136 lt!271563) #b00000000000000000000000000000000) (bvslt (index!27136 lt!271563) (size!18145 a!2986)))) (or (is-Undefined!6221 lt!271563) (is-Found!6221 lt!271563) (not (is-MissingVacant!6221 lt!271563)) (not (= (index!27138 lt!271563) vacantSpotIndex!68)) (and (bvsge (index!27138 lt!271563) #b00000000000000000000000000000000) (bvslt (index!27138 lt!271563) (size!18145 a!2986)))) (or (is-Undefined!6221 lt!271563) (ite (is-Found!6221 lt!271563) (= (select (arr!17781 a!2986) (index!27136 lt!271563)) (select (arr!17781 a!2986) j!136)) (and (is-MissingVacant!6221 lt!271563) (= (index!27138 lt!271563) vacantSpotIndex!68) (= (select (arr!17781 a!2986) (index!27138 lt!271563)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!341597 () SeekEntryResult!6221)

(assert (=> d!86895 (= lt!271563 e!341597)))

(declare-fun c!67688 () Bool)

(assert (=> d!86895 (= c!67688 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!271564 () (_ BitVec 64))

(assert (=> d!86895 (= lt!271564 (select (arr!17781 a!2986) lt!271411))))

(assert (=> d!86895 (validMask!0 mask!3053)))

(assert (=> d!86895 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271411 vacantSpotIndex!68 (select (arr!17781 a!2986) j!136) a!2986 mask!3053) lt!271563)))

(declare-fun e!341595 () SeekEntryResult!6221)

(declare-fun b!597749 () Bool)

(assert (=> b!597749 (= e!341595 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!271411 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17781 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!597750 () Bool)

(assert (=> b!597750 (= e!341597 Undefined!6221)))

(declare-fun b!597751 () Bool)

(declare-fun c!67687 () Bool)

(assert (=> b!597751 (= c!67687 (= lt!271564 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!341596 () SeekEntryResult!6221)

(assert (=> b!597751 (= e!341596 e!341595)))

(declare-fun b!597752 () Bool)

(assert (=> b!597752 (= e!341596 (Found!6221 lt!271411))))

(declare-fun b!597753 () Bool)

(assert (=> b!597753 (= e!341595 (MissingVacant!6221 vacantSpotIndex!68))))

(declare-fun b!597754 () Bool)

(assert (=> b!597754 (= e!341597 e!341596)))

(declare-fun c!67686 () Bool)

(assert (=> b!597754 (= c!67686 (= lt!271564 (select (arr!17781 a!2986) j!136)))))

(assert (= (and d!86895 c!67688) b!597750))

(assert (= (and d!86895 (not c!67688)) b!597754))

(assert (= (and b!597754 c!67686) b!597752))

(assert (= (and b!597754 (not c!67686)) b!597751))

(assert (= (and b!597751 c!67687) b!597753))

(assert (= (and b!597751 (not c!67687)) b!597749))

(declare-fun m!575117 () Bool)

(assert (=> d!86895 m!575117))

(declare-fun m!575121 () Bool)

(assert (=> d!86895 m!575121))

(declare-fun m!575124 () Bool)

(assert (=> d!86895 m!575124))

(assert (=> d!86895 m!574843))

(assert (=> b!597749 m!575101))

(assert (=> b!597749 m!575101))

(assert (=> b!597749 m!574805))

(declare-fun m!575127 () Bool)

(assert (=> b!597749 m!575127))

(assert (=> b!597415 d!86895))

(declare-fun lt!271565 () SeekEntryResult!6221)

(declare-fun d!86899 () Bool)

(assert (=> d!86899 (and (or (is-Undefined!6221 lt!271565) (not (is-Found!6221 lt!271565)) (and (bvsge (index!27136 lt!271565) #b00000000000000000000000000000000) (bvslt (index!27136 lt!271565) (size!18145 lt!271407)))) (or (is-Undefined!6221 lt!271565) (is-Found!6221 lt!271565) (not (is-MissingVacant!6221 lt!271565)) (not (= (index!27138 lt!271565) vacantSpotIndex!68)) (and (bvsge (index!27138 lt!271565) #b00000000000000000000000000000000) (bvslt (index!27138 lt!271565) (size!18145 lt!271407)))) (or (is-Undefined!6221 lt!271565) (ite (is-Found!6221 lt!271565) (= (select (arr!17781 lt!271407) (index!27136 lt!271565)) lt!271400) (and (is-MissingVacant!6221 lt!271565) (= (index!27138 lt!271565) vacantSpotIndex!68) (= (select (arr!17781 lt!271407) (index!27138 lt!271565)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!341602 () SeekEntryResult!6221)

(assert (=> d!86899 (= lt!271565 e!341602)))

(declare-fun c!67691 () Bool)

(assert (=> d!86899 (= c!67691 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!271566 () (_ BitVec 64))

(assert (=> d!86899 (= lt!271566 (select (arr!17781 lt!271407) index!984))))

(assert (=> d!86899 (validMask!0 mask!3053)))

(assert (=> d!86899 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!271400 lt!271407 mask!3053) lt!271565)))

(declare-fun b!597757 () Bool)

(declare-fun e!341600 () SeekEntryResult!6221)

(assert (=> b!597757 (= e!341600 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!271400 lt!271407 mask!3053))))

(declare-fun b!597758 () Bool)

(assert (=> b!597758 (= e!341602 Undefined!6221)))

(declare-fun b!597759 () Bool)

(declare-fun c!67690 () Bool)

(assert (=> b!597759 (= c!67690 (= lt!271566 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!341601 () SeekEntryResult!6221)

(assert (=> b!597759 (= e!341601 e!341600)))

(declare-fun b!597760 () Bool)

(assert (=> b!597760 (= e!341601 (Found!6221 index!984))))

(declare-fun b!597761 () Bool)

(assert (=> b!597761 (= e!341600 (MissingVacant!6221 vacantSpotIndex!68))))

(declare-fun b!597762 () Bool)

(assert (=> b!597762 (= e!341602 e!341601)))

(declare-fun c!67689 () Bool)

(assert (=> b!597762 (= c!67689 (= lt!271566 lt!271400))))

(assert (= (and d!86899 c!67691) b!597758))

(assert (= (and d!86899 (not c!67691)) b!597762))

(assert (= (and b!597762 c!67689) b!597760))

(assert (= (and b!597762 (not c!67689)) b!597759))

(assert (= (and b!597759 c!67690) b!597761))

(assert (= (and b!597759 (not c!67690)) b!597757))

(declare-fun m!575133 () Bool)

(assert (=> d!86899 m!575133))

(declare-fun m!575135 () Bool)

(assert (=> d!86899 m!575135))

(assert (=> d!86899 m!575063))

(assert (=> d!86899 m!574843))

(assert (=> b!597757 m!574821))

(assert (=> b!597757 m!574821))

(declare-fun m!575139 () Bool)

(assert (=> b!597757 m!575139))

(assert (=> b!597415 d!86899))

(declare-fun d!86907 () Bool)

(declare-fun e!341631 () Bool)

(assert (=> d!86907 e!341631))

(declare-fun res!383128 () Bool)

(assert (=> d!86907 (=> (not res!383128) (not e!341631))))

(assert (=> d!86907 (= res!383128 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18145 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18145 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18145 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18145 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18145 a!2986))))))

(declare-fun lt!271586 () Unit!18802)

(declare-fun choose!9 (array!37037 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18802)

(assert (=> d!86907 (= lt!271586 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271411 vacantSpotIndex!68 mask!3053))))

(assert (=> d!86907 (validMask!0 mask!3053)))

(assert (=> d!86907 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271411 vacantSpotIndex!68 mask!3053) lt!271586)))

(declare-fun b!597804 () Bool)

(assert (=> b!597804 (= e!341631 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271411 vacantSpotIndex!68 (select (arr!17781 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271411 vacantSpotIndex!68 (select (store (arr!17781 a!2986) i!1108 k!1786) j!136) (array!37038 (store (arr!17781 a!2986) i!1108 k!1786) (size!18145 a!2986)) mask!3053)))))

(assert (= (and d!86907 res!383128) b!597804))

(declare-fun m!575195 () Bool)

(assert (=> d!86907 m!575195))

(assert (=> d!86907 m!574843))

(assert (=> b!597804 m!574805))

(assert (=> b!597804 m!574823))

(declare-fun m!575197 () Bool)

(assert (=> b!597804 m!575197))

(assert (=> b!597804 m!574805))

(assert (=> b!597804 m!574829))

(assert (=> b!597804 m!574823))

(assert (=> b!597804 m!574807))

(assert (=> b!597415 d!86907))

(declare-fun d!86925 () Bool)

(declare-fun lt!271587 () SeekEntryResult!6221)

(assert (=> d!86925 (and (or (is-Undefined!6221 lt!271587) (not (is-Found!6221 lt!271587)) (and (bvsge (index!27136 lt!271587) #b00000000000000000000000000000000) (bvslt (index!27136 lt!271587) (size!18145 a!2986)))) (or (is-Undefined!6221 lt!271587) (is-Found!6221 lt!271587) (not (is-MissingVacant!6221 lt!271587)) (not (= (index!27138 lt!271587) vacantSpotIndex!68)) (and (bvsge (index!27138 lt!271587) #b00000000000000000000000000000000) (bvslt (index!27138 lt!271587) (size!18145 a!2986)))) (or (is-Undefined!6221 lt!271587) (ite (is-Found!6221 lt!271587) (= (select (arr!17781 a!2986) (index!27136 lt!271587)) (select (arr!17781 a!2986) j!136)) (and (is-MissingVacant!6221 lt!271587) (= (index!27138 lt!271587) vacantSpotIndex!68) (= (select (arr!17781 a!2986) (index!27138 lt!271587)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!341634 () SeekEntryResult!6221)

(assert (=> d!86925 (= lt!271587 e!341634)))

(declare-fun c!67707 () Bool)

(assert (=> d!86925 (= c!67707 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!271588 () (_ BitVec 64))

(assert (=> d!86925 (= lt!271588 (select (arr!17781 a!2986) index!984))))

(assert (=> d!86925 (validMask!0 mask!3053)))

(assert (=> d!86925 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17781 a!2986) j!136) a!2986 mask!3053) lt!271587)))

(declare-fun b!597805 () Bool)

(declare-fun e!341632 () SeekEntryResult!6221)

(assert (=> b!597805 (= e!341632 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17781 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!597806 () Bool)

(assert (=> b!597806 (= e!341634 Undefined!6221)))

(declare-fun b!597807 () Bool)

(declare-fun c!67706 () Bool)

(assert (=> b!597807 (= c!67706 (= lt!271588 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!341633 () SeekEntryResult!6221)

(assert (=> b!597807 (= e!341633 e!341632)))

(declare-fun b!597808 () Bool)

(assert (=> b!597808 (= e!341633 (Found!6221 index!984))))

(declare-fun b!597809 () Bool)

(assert (=> b!597809 (= e!341632 (MissingVacant!6221 vacantSpotIndex!68))))

(declare-fun b!597810 () Bool)

(assert (=> b!597810 (= e!341634 e!341633)))

(declare-fun c!67705 () Bool)

(assert (=> b!597810 (= c!67705 (= lt!271588 (select (arr!17781 a!2986) j!136)))))

(assert (= (and d!86925 c!67707) b!597806))

(assert (= (and d!86925 (not c!67707)) b!597810))

(assert (= (and b!597810 c!67705) b!597808))

(assert (= (and b!597810 (not c!67705)) b!597807))

(assert (= (and b!597807 c!67706) b!597809))

(assert (= (and b!597807 (not c!67706)) b!597805))

(declare-fun m!575199 () Bool)

(assert (=> d!86925 m!575199))

(declare-fun m!575201 () Bool)

(assert (=> d!86925 m!575201))

(assert (=> d!86925 m!574839))

(assert (=> d!86925 m!574843))

(assert (=> b!597805 m!574821))

(assert (=> b!597805 m!574821))

(assert (=> b!597805 m!574805))

(declare-fun m!575203 () Bool)

(assert (=> b!597805 m!575203))

(assert (=> b!597425 d!86925))

(declare-fun d!86927 () Bool)

(assert (=> d!86927 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!54646 d!86927))

(declare-fun d!86935 () Bool)

(assert (=> d!86935 (= (array_inv!13577 a!2986) (bvsge (size!18145 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!54646 d!86935))

(declare-fun d!86937 () Bool)

(declare-fun res!383135 () Bool)

(declare-fun e!341641 () Bool)

(assert (=> d!86937 (=> res!383135 e!341641)))

(assert (=> d!86937 (= res!383135 (= (select (arr!17781 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!86937 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!341641)))

(declare-fun b!597817 () Bool)

(declare-fun e!341642 () Bool)

(assert (=> b!597817 (= e!341641 e!341642)))

(declare-fun res!383136 () Bool)

(assert (=> b!597817 (=> (not res!383136) (not e!341642))))

(assert (=> b!597817 (= res!383136 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18145 a!2986)))))

(declare-fun b!597818 () Bool)

(assert (=> b!597818 (= e!341642 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!86937 (not res!383135)) b!597817))

(assert (= (and b!597817 res!383136) b!597818))

(assert (=> d!86937 m!575013))

(declare-fun m!575209 () Bool)

(assert (=> b!597818 m!575209))

(assert (=> b!597411 d!86937))

(declare-fun b!597819 () Bool)

(declare-fun e!341644 () Bool)

(declare-fun e!341643 () Bool)

(assert (=> b!597819 (= e!341644 e!341643)))

(declare-fun res!383139 () Bool)

(assert (=> b!597819 (=> (not res!383139) (not e!341643))))

(declare-fun e!341646 () Bool)

(assert (=> b!597819 (= res!383139 (not e!341646))))

(declare-fun res!383137 () Bool)

(assert (=> b!597819 (=> (not res!383137) (not e!341646))))

(assert (=> b!597819 (= res!383137 (validKeyInArray!0 (select (arr!17781 lt!271407) #b00000000000000000000000000000000)))))

(declare-fun d!86939 () Bool)

(declare-fun res!383138 () Bool)

(assert (=> d!86939 (=> res!383138 e!341644)))

(assert (=> d!86939 (= res!383138 (bvsge #b00000000000000000000000000000000 (size!18145 lt!271407)))))

(assert (=> d!86939 (= (arrayNoDuplicates!0 lt!271407 #b00000000000000000000000000000000 Nil!11819) e!341644)))

(declare-fun bm!32935 () Bool)

(declare-fun call!32938 () Bool)

(declare-fun c!67708 () Bool)

(assert (=> bm!32935 (= call!32938 (arrayNoDuplicates!0 lt!271407 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!67708 (Cons!11818 (select (arr!17781 lt!271407) #b00000000000000000000000000000000) Nil!11819) Nil!11819)))))

(declare-fun b!597820 () Bool)

(declare-fun e!341645 () Bool)

(assert (=> b!597820 (= e!341645 call!32938)))

(declare-fun b!597821 () Bool)

(assert (=> b!597821 (= e!341646 (contains!2955 Nil!11819 (select (arr!17781 lt!271407) #b00000000000000000000000000000000)))))

(declare-fun b!597822 () Bool)

(assert (=> b!597822 (= e!341645 call!32938)))

(declare-fun b!597823 () Bool)

(assert (=> b!597823 (= e!341643 e!341645)))

(assert (=> b!597823 (= c!67708 (validKeyInArray!0 (select (arr!17781 lt!271407) #b00000000000000000000000000000000)))))

(assert (= (and d!86939 (not res!383138)) b!597819))

(assert (= (and b!597819 res!383137) b!597821))

(assert (= (and b!597819 res!383139) b!597823))

(assert (= (and b!597823 c!67708) b!597822))

(assert (= (and b!597823 (not c!67708)) b!597820))

(assert (= (or b!597822 b!597820) bm!32935))

(declare-fun m!575211 () Bool)

(assert (=> b!597819 m!575211))

(assert (=> b!597819 m!575211))

(declare-fun m!575213 () Bool)

(assert (=> b!597819 m!575213))

(assert (=> bm!32935 m!575211))

(declare-fun m!575215 () Bool)

(assert (=> bm!32935 m!575215))

(assert (=> b!597821 m!575211))

(assert (=> b!597821 m!575211))

(declare-fun m!575217 () Bool)

(assert (=> b!597821 m!575217))

(assert (=> b!597823 m!575211))

(assert (=> b!597823 m!575211))

(assert (=> b!597823 m!575213))

(assert (=> b!597410 d!86939))

(declare-fun d!86941 () Bool)

(declare-fun e!341661 () Bool)

(assert (=> d!86941 e!341661))

(declare-fun res!383151 () Bool)

(assert (=> d!86941 (=> (not res!383151) (not e!341661))))

(assert (=> d!86941 (= res!383151 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18145 a!2986))))))

(declare-fun lt!271591 () Unit!18802)

(declare-fun choose!41 (array!37037 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11822) Unit!18802)

(assert (=> d!86941 (= lt!271591 (choose!41 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11819))))

(assert (=> d!86941 (bvslt (size!18145 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!86941 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11819) lt!271591)))

(declare-fun b!597841 () Bool)

(assert (=> b!597841 (= e!341661 (arrayNoDuplicates!0 (array!37038 (store (arr!17781 a!2986) i!1108 k!1786) (size!18145 a!2986)) #b00000000000000000000000000000000 Nil!11819))))

(assert (= (and d!86941 res!383151) b!597841))

(declare-fun m!575225 () Bool)

(assert (=> d!86941 m!575225))

(assert (=> b!597841 m!574807))

(declare-fun m!575229 () Bool)

(assert (=> b!597841 m!575229))

(assert (=> b!597410 d!86941))

(declare-fun d!86945 () Bool)

(declare-fun res!383152 () Bool)

(declare-fun e!341662 () Bool)

(assert (=> d!86945 (=> res!383152 e!341662)))

(assert (=> d!86945 (= res!383152 (= (select (arr!17781 lt!271407) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17781 a!2986) j!136)))))

(assert (=> d!86945 (= (arrayContainsKey!0 lt!271407 (select (arr!17781 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!341662)))

(declare-fun b!597842 () Bool)

(declare-fun e!341663 () Bool)

(assert (=> b!597842 (= e!341662 e!341663)))

(declare-fun res!383153 () Bool)

(assert (=> b!597842 (=> (not res!383153) (not e!341663))))

(assert (=> b!597842 (= res!383153 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18145 lt!271407)))))

(declare-fun b!597843 () Bool)

(assert (=> b!597843 (= e!341663 (arrayContainsKey!0 lt!271407 (select (arr!17781 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86945 (not res!383152)) b!597842))

(assert (= (and b!597842 res!383153) b!597843))

(declare-fun m!575231 () Bool)

(assert (=> d!86945 m!575231))

(assert (=> b!597843 m!574805))

(declare-fun m!575233 () Bool)

(assert (=> b!597843 m!575233))

(assert (=> b!597410 d!86945))

(declare-fun d!86947 () Bool)

(assert (=> d!86947 (arrayContainsKey!0 lt!271407 (select (arr!17781 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!271594 () Unit!18802)

(declare-fun choose!114 (array!37037 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18802)

(assert (=> d!86947 (= lt!271594 (choose!114 lt!271407 (select (arr!17781 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!86947 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!86947 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!271407 (select (arr!17781 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!271594)))

(declare-fun bs!18377 () Bool)

(assert (= bs!18377 d!86947))

(assert (=> bs!18377 m!574805))

(assert (=> bs!18377 m!574851))

(assert (=> bs!18377 m!574805))

(declare-fun m!575235 () Bool)

(assert (=> bs!18377 m!575235))

(assert (=> b!597410 d!86947))

(declare-fun b!597872 () Bool)

(declare-fun e!341690 () Bool)

(declare-fun call!32945 () Bool)

(assert (=> b!597872 (= e!341690 call!32945)))

(declare-fun d!86949 () Bool)

(declare-fun res!383176 () Bool)

(declare-fun e!341691 () Bool)

(assert (=> d!86949 (=> res!383176 e!341691)))

(assert (=> d!86949 (= res!383176 (bvsge #b00000000000000000000000000000000 (size!18145 a!2986)))))

(assert (=> d!86949 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!341691)))

(declare-fun b!597873 () Bool)

(declare-fun e!341689 () Bool)

(assert (=> b!597873 (= e!341690 e!341689)))

(declare-fun lt!271609 () (_ BitVec 64))

(assert (=> b!597873 (= lt!271609 (select (arr!17781 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!271608 () Unit!18802)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37037 (_ BitVec 64) (_ BitVec 32)) Unit!18802)

(assert (=> b!597873 (= lt!271608 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!271609 #b00000000000000000000000000000000))))

(assert (=> b!597873 (arrayContainsKey!0 a!2986 lt!271609 #b00000000000000000000000000000000)))

(declare-fun lt!271607 () Unit!18802)

(assert (=> b!597873 (= lt!271607 lt!271608)))

(declare-fun res!383177 () Bool)

(assert (=> b!597873 (= res!383177 (= (seekEntryOrOpen!0 (select (arr!17781 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6221 #b00000000000000000000000000000000)))))

(assert (=> b!597873 (=> (not res!383177) (not e!341689))))

(declare-fun bm!32942 () Bool)


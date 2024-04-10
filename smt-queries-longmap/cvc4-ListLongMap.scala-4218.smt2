; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57828 () Bool)

(assert start!57828)

(declare-fun b!639876 () Bool)

(declare-fun res!414379 () Bool)

(declare-fun e!366243 () Bool)

(assert (=> b!639876 (=> (not res!414379) (not e!366243))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38330 0))(
  ( (array!38331 (arr!18386 (Array (_ BitVec 32) (_ BitVec 64))) (size!18750 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38330)

(assert (=> b!639876 (= res!414379 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18386 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!639877 () Bool)

(declare-fun e!366236 () Bool)

(declare-fun e!366239 () Bool)

(assert (=> b!639877 (= e!366236 e!366239)))

(declare-fun res!414385 () Bool)

(assert (=> b!639877 (=> (not res!414385) (not e!366239))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!296097 () array!38330)

(declare-fun arrayContainsKey!0 (array!38330 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!639877 (= res!414385 (arrayContainsKey!0 lt!296097 (select (arr!18386 a!2986) j!136) j!136))))

(declare-fun b!639878 () Bool)

(declare-fun e!366245 () Bool)

(assert (=> b!639878 (= e!366245 e!366243)))

(declare-fun res!414388 () Bool)

(assert (=> b!639878 (=> (not res!414388) (not e!366243))))

(declare-datatypes ((SeekEntryResult!6826 0))(
  ( (MissingZero!6826 (index!29621 (_ BitVec 32))) (Found!6826 (index!29622 (_ BitVec 32))) (Intermediate!6826 (undefined!7638 Bool) (index!29623 (_ BitVec 32)) (x!58373 (_ BitVec 32))) (Undefined!6826) (MissingVacant!6826 (index!29624 (_ BitVec 32))) )
))
(declare-fun lt!296106 () SeekEntryResult!6826)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!639878 (= res!414388 (or (= lt!296106 (MissingZero!6826 i!1108)) (= lt!296106 (MissingVacant!6826 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38330 (_ BitVec 32)) SeekEntryResult!6826)

(assert (=> b!639878 (= lt!296106 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!639879 () Bool)

(declare-datatypes ((Unit!21638 0))(
  ( (Unit!21639) )
))
(declare-fun e!366235 () Unit!21638)

(declare-fun Unit!21640 () Unit!21638)

(assert (=> b!639879 (= e!366235 Unit!21640)))

(assert (=> b!639879 false))

(declare-fun b!639880 () Bool)

(declare-fun e!366237 () Bool)

(declare-fun e!366241 () Bool)

(assert (=> b!639880 (= e!366237 e!366241)))

(declare-fun res!414374 () Bool)

(assert (=> b!639880 (=> res!414374 e!366241)))

(declare-fun lt!296103 () (_ BitVec 64))

(declare-fun lt!296096 () (_ BitVec 64))

(assert (=> b!639880 (= res!414374 (or (not (= (select (arr!18386 a!2986) j!136) lt!296103)) (not (= (select (arr!18386 a!2986) j!136) lt!296096)) (bvsge j!136 index!984)))))

(declare-fun e!366240 () Bool)

(assert (=> b!639880 e!366240))

(declare-fun res!414373 () Bool)

(assert (=> b!639880 (=> (not res!414373) (not e!366240))))

(assert (=> b!639880 (= res!414373 (= lt!296096 (select (arr!18386 a!2986) j!136)))))

(assert (=> b!639880 (= lt!296096 (select (store (arr!18386 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!639881 () Bool)

(declare-fun res!414375 () Bool)

(assert (=> b!639881 (=> (not res!414375) (not e!366245))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!639881 (= res!414375 (validKeyInArray!0 (select (arr!18386 a!2986) j!136)))))

(declare-fun b!639882 () Bool)

(declare-fun e!366246 () Bool)

(assert (=> b!639882 (= e!366243 e!366246)))

(declare-fun res!414383 () Bool)

(assert (=> b!639882 (=> (not res!414383) (not e!366246))))

(assert (=> b!639882 (= res!414383 (= (select (store (arr!18386 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!639882 (= lt!296097 (array!38331 (store (arr!18386 a!2986) i!1108 k!1786) (size!18750 a!2986)))))

(declare-fun b!639883 () Bool)

(declare-fun res!414380 () Bool)

(assert (=> b!639883 (=> (not res!414380) (not e!366245))))

(assert (=> b!639883 (= res!414380 (validKeyInArray!0 k!1786))))

(declare-fun b!639884 () Bool)

(assert (=> b!639884 (= e!366241 (bvslt (size!18750 a!2986) #b01111111111111111111111111111111))))

(declare-datatypes ((List!12427 0))(
  ( (Nil!12424) (Cons!12423 (h!13468 (_ BitVec 64)) (t!18655 List!12427)) )
))
(declare-fun arrayNoDuplicates!0 (array!38330 (_ BitVec 32) List!12427) Bool)

(assert (=> b!639884 (arrayNoDuplicates!0 lt!296097 j!136 Nil!12424)))

(declare-fun lt!296104 () Unit!21638)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38330 (_ BitVec 32) (_ BitVec 32)) Unit!21638)

(assert (=> b!639884 (= lt!296104 (lemmaNoDuplicateFromThenFromBigger!0 lt!296097 #b00000000000000000000000000000000 j!136))))

(assert (=> b!639884 (arrayNoDuplicates!0 lt!296097 #b00000000000000000000000000000000 Nil!12424)))

(declare-fun lt!296100 () Unit!21638)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38330 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12427) Unit!21638)

(assert (=> b!639884 (= lt!296100 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12424))))

(assert (=> b!639884 (arrayContainsKey!0 lt!296097 (select (arr!18386 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!296098 () Unit!21638)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38330 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21638)

(assert (=> b!639884 (= lt!296098 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!296097 (select (arr!18386 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!639885 () Bool)

(declare-fun e!366244 () Bool)

(assert (=> b!639885 (= e!366244 (not e!366237))))

(declare-fun res!414386 () Bool)

(assert (=> b!639885 (=> res!414386 e!366237)))

(declare-fun lt!296105 () SeekEntryResult!6826)

(assert (=> b!639885 (= res!414386 (not (= lt!296105 (Found!6826 index!984))))))

(declare-fun lt!296102 () Unit!21638)

(assert (=> b!639885 (= lt!296102 e!366235)))

(declare-fun c!73118 () Bool)

(assert (=> b!639885 (= c!73118 (= lt!296105 Undefined!6826))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38330 (_ BitVec 32)) SeekEntryResult!6826)

(assert (=> b!639885 (= lt!296105 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!296103 lt!296097 mask!3053))))

(declare-fun e!366242 () Bool)

(assert (=> b!639885 e!366242))

(declare-fun res!414382 () Bool)

(assert (=> b!639885 (=> (not res!414382) (not e!366242))))

(declare-fun lt!296107 () SeekEntryResult!6826)

(declare-fun lt!296095 () (_ BitVec 32))

(assert (=> b!639885 (= res!414382 (= lt!296107 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296095 vacantSpotIndex!68 lt!296103 lt!296097 mask!3053)))))

(assert (=> b!639885 (= lt!296107 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296095 vacantSpotIndex!68 (select (arr!18386 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!639885 (= lt!296103 (select (store (arr!18386 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!296099 () Unit!21638)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38330 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21638)

(assert (=> b!639885 (= lt!296099 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296095 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!639885 (= lt!296095 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!639875 () Bool)

(assert (=> b!639875 (= e!366240 e!366236)))

(declare-fun res!414378 () Bool)

(assert (=> b!639875 (=> res!414378 e!366236)))

(assert (=> b!639875 (= res!414378 (or (not (= (select (arr!18386 a!2986) j!136) lt!296103)) (not (= (select (arr!18386 a!2986) j!136) lt!296096)) (bvsge j!136 index!984)))))

(declare-fun res!414376 () Bool)

(assert (=> start!57828 (=> (not res!414376) (not e!366245))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57828 (= res!414376 (validMask!0 mask!3053))))

(assert (=> start!57828 e!366245))

(assert (=> start!57828 true))

(declare-fun array_inv!14182 (array!38330) Bool)

(assert (=> start!57828 (array_inv!14182 a!2986)))

(declare-fun b!639886 () Bool)

(declare-fun lt!296101 () SeekEntryResult!6826)

(assert (=> b!639886 (= e!366242 (= lt!296101 lt!296107))))

(declare-fun b!639887 () Bool)

(assert (=> b!639887 (= e!366239 (arrayContainsKey!0 lt!296097 (select (arr!18386 a!2986) j!136) index!984))))

(declare-fun b!639888 () Bool)

(declare-fun Unit!21641 () Unit!21638)

(assert (=> b!639888 (= e!366235 Unit!21641)))

(declare-fun b!639889 () Bool)

(assert (=> b!639889 (= e!366246 e!366244)))

(declare-fun res!414384 () Bool)

(assert (=> b!639889 (=> (not res!414384) (not e!366244))))

(assert (=> b!639889 (= res!414384 (and (= lt!296101 (Found!6826 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18386 a!2986) index!984) (select (arr!18386 a!2986) j!136))) (not (= (select (arr!18386 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!639889 (= lt!296101 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18386 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!639890 () Bool)

(declare-fun res!414381 () Bool)

(assert (=> b!639890 (=> (not res!414381) (not e!366243))))

(assert (=> b!639890 (= res!414381 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12424))))

(declare-fun b!639891 () Bool)

(declare-fun res!414389 () Bool)

(assert (=> b!639891 (=> (not res!414389) (not e!366245))))

(assert (=> b!639891 (= res!414389 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!639892 () Bool)

(declare-fun res!414387 () Bool)

(assert (=> b!639892 (=> (not res!414387) (not e!366245))))

(assert (=> b!639892 (= res!414387 (and (= (size!18750 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18750 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18750 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!639893 () Bool)

(declare-fun res!414377 () Bool)

(assert (=> b!639893 (=> (not res!414377) (not e!366243))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38330 (_ BitVec 32)) Bool)

(assert (=> b!639893 (= res!414377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!57828 res!414376) b!639892))

(assert (= (and b!639892 res!414387) b!639881))

(assert (= (and b!639881 res!414375) b!639883))

(assert (= (and b!639883 res!414380) b!639891))

(assert (= (and b!639891 res!414389) b!639878))

(assert (= (and b!639878 res!414388) b!639893))

(assert (= (and b!639893 res!414377) b!639890))

(assert (= (and b!639890 res!414381) b!639876))

(assert (= (and b!639876 res!414379) b!639882))

(assert (= (and b!639882 res!414383) b!639889))

(assert (= (and b!639889 res!414384) b!639885))

(assert (= (and b!639885 res!414382) b!639886))

(assert (= (and b!639885 c!73118) b!639879))

(assert (= (and b!639885 (not c!73118)) b!639888))

(assert (= (and b!639885 (not res!414386)) b!639880))

(assert (= (and b!639880 res!414373) b!639875))

(assert (= (and b!639875 (not res!414378)) b!639877))

(assert (= (and b!639877 res!414385) b!639887))

(assert (= (and b!639880 (not res!414374)) b!639884))

(declare-fun m!613723 () Bool)

(assert (=> b!639877 m!613723))

(assert (=> b!639877 m!613723))

(declare-fun m!613725 () Bool)

(assert (=> b!639877 m!613725))

(assert (=> b!639887 m!613723))

(assert (=> b!639887 m!613723))

(declare-fun m!613727 () Bool)

(assert (=> b!639887 m!613727))

(declare-fun m!613729 () Bool)

(assert (=> b!639878 m!613729))

(assert (=> b!639884 m!613723))

(assert (=> b!639884 m!613723))

(declare-fun m!613731 () Bool)

(assert (=> b!639884 m!613731))

(declare-fun m!613733 () Bool)

(assert (=> b!639884 m!613733))

(declare-fun m!613735 () Bool)

(assert (=> b!639884 m!613735))

(assert (=> b!639884 m!613723))

(declare-fun m!613737 () Bool)

(assert (=> b!639884 m!613737))

(declare-fun m!613739 () Bool)

(assert (=> b!639884 m!613739))

(declare-fun m!613741 () Bool)

(assert (=> b!639884 m!613741))

(declare-fun m!613743 () Bool)

(assert (=> b!639889 m!613743))

(assert (=> b!639889 m!613723))

(assert (=> b!639889 m!613723))

(declare-fun m!613745 () Bool)

(assert (=> b!639889 m!613745))

(declare-fun m!613747 () Bool)

(assert (=> b!639891 m!613747))

(declare-fun m!613749 () Bool)

(assert (=> start!57828 m!613749))

(declare-fun m!613751 () Bool)

(assert (=> start!57828 m!613751))

(declare-fun m!613753 () Bool)

(assert (=> b!639890 m!613753))

(declare-fun m!613755 () Bool)

(assert (=> b!639885 m!613755))

(assert (=> b!639885 m!613723))

(declare-fun m!613757 () Bool)

(assert (=> b!639885 m!613757))

(declare-fun m!613759 () Bool)

(assert (=> b!639885 m!613759))

(declare-fun m!613761 () Bool)

(assert (=> b!639885 m!613761))

(declare-fun m!613763 () Bool)

(assert (=> b!639885 m!613763))

(declare-fun m!613765 () Bool)

(assert (=> b!639885 m!613765))

(assert (=> b!639885 m!613723))

(declare-fun m!613767 () Bool)

(assert (=> b!639885 m!613767))

(assert (=> b!639875 m!613723))

(assert (=> b!639882 m!613757))

(declare-fun m!613769 () Bool)

(assert (=> b!639882 m!613769))

(assert (=> b!639881 m!613723))

(assert (=> b!639881 m!613723))

(declare-fun m!613771 () Bool)

(assert (=> b!639881 m!613771))

(declare-fun m!613773 () Bool)

(assert (=> b!639876 m!613773))

(assert (=> b!639880 m!613723))

(assert (=> b!639880 m!613757))

(declare-fun m!613775 () Bool)

(assert (=> b!639880 m!613775))

(declare-fun m!613777 () Bool)

(assert (=> b!639883 m!613777))

(declare-fun m!613779 () Bool)

(assert (=> b!639893 m!613779))

(push 1)

(assert (not b!639883))

(assert (not b!639887))

(assert (not start!57828))

(assert (not b!639889))

(assert (not b!639893))

(assert (not b!639881))

(assert (not b!639878))

(assert (not b!639877))

(assert (not b!639891))

(assert (not b!639890))

(assert (not b!639884))

(assert (not b!639885))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!639959 () Bool)

(declare-fun e!366290 () Bool)

(declare-fun e!366289 () Bool)

(assert (=> b!639959 (= e!366290 e!366289)))

(declare-fun lt!296130 () (_ BitVec 64))

(assert (=> b!639959 (= lt!296130 (select (arr!18386 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!296129 () Unit!21638)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38330 (_ BitVec 64) (_ BitVec 32)) Unit!21638)

(assert (=> b!639959 (= lt!296129 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!296130 #b00000000000000000000000000000000))))

(assert (=> b!639959 (arrayContainsKey!0 a!2986 lt!296130 #b00000000000000000000000000000000)))

(declare-fun lt!296131 () Unit!21638)

(assert (=> b!639959 (= lt!296131 lt!296129)))

(declare-fun res!414410 () Bool)

(assert (=> b!639959 (= res!414410 (= (seekEntryOrOpen!0 (select (arr!18386 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6826 #b00000000000000000000000000000000)))))

(assert (=> b!639959 (=> (not res!414410) (not e!366289))))

(declare-fun b!639960 () Bool)

(declare-fun call!33494 () Bool)

(assert (=> b!639960 (= e!366290 call!33494)))

(declare-fun b!639961 () Bool)

(assert (=> b!639961 (= e!366289 call!33494)))

(declare-fun b!639962 () Bool)

(declare-fun e!366291 () Bool)

(assert (=> b!639962 (= e!366291 e!366290)))

(declare-fun c!73142 () Bool)

(assert (=> b!639962 (= c!73142 (validKeyInArray!0 (select (arr!18386 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!90353 () Bool)

(declare-fun res!414409 () Bool)

(assert (=> d!90353 (=> res!414409 e!366291)))

(assert (=> d!90353 (= res!414409 (bvsge #b00000000000000000000000000000000 (size!18750 a!2986)))))

(assert (=> d!90353 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!366291)))

(declare-fun bm!33491 () Bool)

(assert (=> bm!33491 (= call!33494 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(assert (= (and d!90353 (not res!414409)) b!639962))

(assert (= (and b!639962 c!73142) b!639959))

(assert (= (and b!639962 (not c!73142)) b!639960))

(assert (= (and b!639959 res!414410) b!639961))

(assert (= (or b!639961 b!639960) bm!33491))

(declare-fun m!613809 () Bool)

(assert (=> b!639959 m!613809))

(declare-fun m!613811 () Bool)

(assert (=> b!639959 m!613811))

(declare-fun m!613813 () Bool)

(assert (=> b!639959 m!613813))

(assert (=> b!639959 m!613809))

(declare-fun m!613815 () Bool)

(assert (=> b!639959 m!613815))

(assert (=> b!639962 m!613809))

(assert (=> b!639962 m!613809))

(declare-fun m!613817 () Bool)

(assert (=> b!639962 m!613817))

(declare-fun m!613819 () Bool)

(assert (=> bm!33491 m!613819))

(assert (=> b!639893 d!90353))

(declare-fun d!90361 () Bool)

(assert (=> d!90361 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!639883 d!90361))

(declare-fun b!639996 () Bool)

(declare-fun e!366323 () Bool)

(declare-fun contains!3126 (List!12427 (_ BitVec 64)) Bool)

(assert (=> b!639996 (= e!366323 (contains!3126 Nil!12424 (select (arr!18386 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!90367 () Bool)

(declare-fun res!414435 () Bool)

(declare-fun e!366322 () Bool)

(assert (=> d!90367 (=> res!414435 e!366322)))

(assert (=> d!90367 (= res!414435 (bvsge #b00000000000000000000000000000000 (size!18750 a!2986)))))

(assert (=> d!90367 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12424) e!366322)))

(declare-fun b!639997 () Bool)

(declare-fun e!366320 () Bool)

(assert (=> b!639997 (= e!366322 e!366320)))

(declare-fun res!414436 () Bool)

(assert (=> b!639997 (=> (not res!414436) (not e!366320))))

(assert (=> b!639997 (= res!414436 (not e!366323))))

(declare-fun res!414434 () Bool)

(assert (=> b!639997 (=> (not res!414434) (not e!366323))))

(assert (=> b!639997 (= res!414434 (validKeyInArray!0 (select (arr!18386 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33497 () Bool)

(declare-fun call!33500 () Bool)

(declare-fun c!73148 () Bool)

(assert (=> bm!33497 (= call!33500 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73148 (Cons!12423 (select (arr!18386 a!2986) #b00000000000000000000000000000000) Nil!12424) Nil!12424)))))

(declare-fun b!639998 () Bool)

(declare-fun e!366321 () Bool)

(assert (=> b!639998 (= e!366320 e!366321)))

(assert (=> b!639998 (= c!73148 (validKeyInArray!0 (select (arr!18386 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!639999 () Bool)

(assert (=> b!639999 (= e!366321 call!33500)))

(declare-fun b!640000 () Bool)

(assert (=> b!640000 (= e!366321 call!33500)))

(assert (= (and d!90367 (not res!414435)) b!639997))

(assert (= (and b!639997 res!414434) b!639996))

(assert (= (and b!639997 res!414436) b!639998))

(assert (= (and b!639998 c!73148) b!639999))

(assert (= (and b!639998 (not c!73148)) b!640000))

(assert (= (or b!639999 b!640000) bm!33497))

(assert (=> b!639996 m!613809))

(assert (=> b!639996 m!613809))

(declare-fun m!613841 () Bool)

(assert (=> b!639996 m!613841))

(assert (=> b!639997 m!613809))

(assert (=> b!639997 m!613809))

(assert (=> b!639997 m!613817))

(assert (=> bm!33497 m!613809))

(declare-fun m!613843 () Bool)

(assert (=> bm!33497 m!613843))

(assert (=> b!639998 m!613809))

(assert (=> b!639998 m!613809))

(assert (=> b!639998 m!613817))

(assert (=> b!639890 d!90367))

(declare-fun d!90375 () Bool)

(assert (=> d!90375 (= (validKeyInArray!0 (select (arr!18386 a!2986) j!136)) (and (not (= (select (arr!18386 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18386 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!639881 d!90375))

(declare-fun d!90377 () Bool)

(declare-fun res!414450 () Bool)

(declare-fun e!366341 () Bool)

(assert (=> d!90377 (=> res!414450 e!366341)))

(assert (=> d!90377 (= res!414450 (= (select (arr!18386 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!90377 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!366341)))

(declare-fun b!640022 () Bool)

(declare-fun e!366342 () Bool)

(assert (=> b!640022 (= e!366341 e!366342)))

(declare-fun res!414451 () Bool)

(assert (=> b!640022 (=> (not res!414451) (not e!366342))))

(assert (=> b!640022 (= res!414451 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18750 a!2986)))))

(declare-fun b!640023 () Bool)

(assert (=> b!640023 (= e!366342 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!90377 (not res!414450)) b!640022))

(assert (= (and b!640022 res!414451) b!640023))

(assert (=> d!90377 m!613809))

(declare-fun m!613853 () Bool)

(assert (=> b!640023 m!613853))

(assert (=> b!639891 d!90377))

(declare-fun d!90381 () Bool)

(declare-fun res!414452 () Bool)

(declare-fun e!366343 () Bool)

(assert (=> d!90381 (=> res!414452 e!366343)))

(assert (=> d!90381 (= res!414452 (= (select (arr!18386 lt!296097) j!136) (select (arr!18386 a!2986) j!136)))))

(assert (=> d!90381 (= (arrayContainsKey!0 lt!296097 (select (arr!18386 a!2986) j!136) j!136) e!366343)))

(declare-fun b!640024 () Bool)

(declare-fun e!366344 () Bool)

(assert (=> b!640024 (= e!366343 e!366344)))

(declare-fun res!414453 () Bool)

(assert (=> b!640024 (=> (not res!414453) (not e!366344))))

(assert (=> b!640024 (= res!414453 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18750 lt!296097)))))

(declare-fun b!640025 () Bool)

(assert (=> b!640025 (= e!366344 (arrayContainsKey!0 lt!296097 (select (arr!18386 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90381 (not res!414452)) b!640024))

(assert (= (and b!640024 res!414453) b!640025))

(declare-fun m!613863 () Bool)

(assert (=> d!90381 m!613863))

(assert (=> b!640025 m!613723))

(declare-fun m!613865 () Bool)

(assert (=> b!640025 m!613865))

(assert (=> b!639877 d!90381))

(declare-fun d!90385 () Bool)

(assert (=> d!90385 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!57828 d!90385))

(declare-fun d!90405 () Bool)

(assert (=> d!90405 (= (array_inv!14182 a!2986) (bvsge (size!18750 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!57828 d!90405))

(declare-fun d!90407 () Bool)

(declare-fun res!414467 () Bool)

(declare-fun e!366359 () Bool)

(assert (=> d!90407 (=> res!414467 e!366359)))

(assert (=> d!90407 (= res!414467 (= (select (arr!18386 lt!296097) index!984) (select (arr!18386 a!2986) j!136)))))

(assert (=> d!90407 (= (arrayContainsKey!0 lt!296097 (select (arr!18386 a!2986) j!136) index!984) e!366359)))

(declare-fun b!640041 () Bool)

(declare-fun e!366360 () Bool)

(assert (=> b!640041 (= e!366359 e!366360)))

(declare-fun res!414468 () Bool)

(assert (=> b!640041 (=> (not res!414468) (not e!366360))))

(assert (=> b!640041 (= res!414468 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18750 lt!296097)))))

(declare-fun b!640042 () Bool)

(assert (=> b!640042 (= e!366360 (arrayContainsKey!0 lt!296097 (select (arr!18386 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!90407 (not res!414467)) b!640041))

(assert (= (and b!640041 res!414468) b!640042))

(declare-fun m!613895 () Bool)

(assert (=> d!90407 m!613895))

(assert (=> b!640042 m!613723))

(declare-fun m!613897 () Bool)

(assert (=> b!640042 m!613897))

(assert (=> b!639887 d!90407))

(declare-fun b!640087 () Bool)

(declare-fun e!366393 () SeekEntryResult!6826)

(assert (=> b!640087 (= e!366393 (MissingVacant!6826 vacantSpotIndex!68))))

(declare-fun b!640088 () Bool)

(declare-fun e!366392 () SeekEntryResult!6826)

(declare-fun e!366391 () SeekEntryResult!6826)

(assert (=> b!640088 (= e!366392 e!366391)))

(declare-fun lt!296175 () (_ BitVec 64))

(declare-fun c!73169 () Bool)

(assert (=> b!640088 (= c!73169 (= lt!296175 (select (arr!18386 a!2986) j!136)))))

(declare-fun d!90409 () Bool)

(declare-fun lt!296174 () SeekEntryResult!6826)

(assert (=> d!90409 (and (or (is-Undefined!6826 lt!296174) (not (is-Found!6826 lt!296174)) (and (bvsge (index!29622 lt!296174) #b00000000000000000000000000000000) (bvslt (index!29622 lt!296174) (size!18750 a!2986)))) (or (is-Undefined!6826 lt!296174) (is-Found!6826 lt!296174) (not (is-MissingVacant!6826 lt!296174)) (not (= (index!29624 lt!296174) vacantSpotIndex!68)) (and (bvsge (index!29624 lt!296174) #b00000000000000000000000000000000) (bvslt (index!29624 lt!296174) (size!18750 a!2986)))) (or (is-Undefined!6826 lt!296174) (ite (is-Found!6826 lt!296174) (= (select (arr!18386 a!2986) (index!29622 lt!296174)) (select (arr!18386 a!2986) j!136)) (and (is-MissingVacant!6826 lt!296174) (= (index!29624 lt!296174) vacantSpotIndex!68) (= (select (arr!18386 a!2986) (index!29624 lt!296174)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90409 (= lt!296174 e!366392)))

(declare-fun c!73170 () Bool)

(assert (=> d!90409 (= c!73170 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!90409 (= lt!296175 (select (arr!18386 a!2986) index!984))))

(assert (=> d!90409 (validMask!0 mask!3053)))

(assert (=> d!90409 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18386 a!2986) j!136) a!2986 mask!3053) lt!296174)))

(declare-fun b!640089 () Bool)

(assert (=> b!640089 (= e!366393 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18386 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!640090 () Bool)

(assert (=> b!640090 (= e!366391 (Found!6826 index!984))))

(declare-fun b!640091 () Bool)

(assert (=> b!640091 (= e!366392 Undefined!6826)))

(declare-fun b!640092 () Bool)

(declare-fun c!73168 () Bool)

(assert (=> b!640092 (= c!73168 (= lt!296175 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!640092 (= e!366391 e!366393)))

(assert (= (and d!90409 c!73170) b!640091))

(assert (= (and d!90409 (not c!73170)) b!640088))

(assert (= (and b!640088 c!73169) b!640090))

(assert (= (and b!640088 (not c!73169)) b!640092))

(assert (= (and b!640092 c!73168) b!640087))

(assert (= (and b!640092 (not c!73168)) b!640089))

(declare-fun m!613937 () Bool)

(assert (=> d!90409 m!613937))

(declare-fun m!613939 () Bool)

(assert (=> d!90409 m!613939))

(assert (=> d!90409 m!613743))

(assert (=> d!90409 m!613749))

(assert (=> b!640089 m!613765))

(assert (=> b!640089 m!613765))

(assert (=> b!640089 m!613723))

(declare-fun m!613941 () Bool)

(assert (=> b!640089 m!613941))

(assert (=> b!639889 d!90409))

(declare-fun b!640140 () Bool)

(declare-fun e!366420 () SeekEntryResult!6826)

(assert (=> b!640140 (= e!366420 Undefined!6826)))

(declare-fun b!640141 () Bool)

(declare-fun lt!296200 () SeekEntryResult!6826)

(declare-fun e!366422 () SeekEntryResult!6826)

(assert (=> b!640141 (= e!366422 (seekKeyOrZeroReturnVacant!0 (x!58373 lt!296200) (index!29623 lt!296200) (index!29623 lt!296200) k!1786 a!2986 mask!3053))))

(declare-fun d!90431 () Bool)

(declare-fun lt!296198 () SeekEntryResult!6826)

(assert (=> d!90431 (and (or (is-Undefined!6826 lt!296198) (not (is-Found!6826 lt!296198)) (and (bvsge (index!29622 lt!296198) #b00000000000000000000000000000000) (bvslt (index!29622 lt!296198) (size!18750 a!2986)))) (or (is-Undefined!6826 lt!296198) (is-Found!6826 lt!296198) (not (is-MissingZero!6826 lt!296198)) (and (bvsge (index!29621 lt!296198) #b00000000000000000000000000000000) (bvslt (index!29621 lt!296198) (size!18750 a!2986)))) (or (is-Undefined!6826 lt!296198) (is-Found!6826 lt!296198) (is-MissingZero!6826 lt!296198) (not (is-MissingVacant!6826 lt!296198)) (and (bvsge (index!29624 lt!296198) #b00000000000000000000000000000000) (bvslt (index!29624 lt!296198) (size!18750 a!2986)))) (or (is-Undefined!6826 lt!296198) (ite (is-Found!6826 lt!296198) (= (select (arr!18386 a!2986) (index!29622 lt!296198)) k!1786) (ite (is-MissingZero!6826 lt!296198) (= (select (arr!18386 a!2986) (index!29621 lt!296198)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6826 lt!296198) (= (select (arr!18386 a!2986) (index!29624 lt!296198)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!90431 (= lt!296198 e!366420)))

(declare-fun c!73192 () Bool)

(assert (=> d!90431 (= c!73192 (and (is-Intermediate!6826 lt!296200) (undefined!7638 lt!296200)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38330 (_ BitVec 32)) SeekEntryResult!6826)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90431 (= lt!296200 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!90431 (validMask!0 mask!3053)))

(assert (=> d!90431 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!296198)))

(declare-fun b!640142 () Bool)

(declare-fun e!366421 () SeekEntryResult!6826)

(assert (=> b!640142 (= e!366420 e!366421)))

(declare-fun lt!296199 () (_ BitVec 64))

(assert (=> b!640142 (= lt!296199 (select (arr!18386 a!2986) (index!29623 lt!296200)))))

(declare-fun c!73194 () Bool)

(assert (=> b!640142 (= c!73194 (= lt!296199 k!1786))))

(declare-fun b!640143 () Bool)

(assert (=> b!640143 (= e!366422 (MissingZero!6826 (index!29623 lt!296200)))))

(declare-fun b!640144 () Bool)

(declare-fun c!73193 () Bool)

(assert (=> b!640144 (= c!73193 (= lt!296199 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!640144 (= e!366421 e!366422)))

(declare-fun b!640145 () Bool)

(assert (=> b!640145 (= e!366421 (Found!6826 (index!29623 lt!296200)))))

(assert (= (and d!90431 c!73192) b!640140))

(assert (= (and d!90431 (not c!73192)) b!640142))

(assert (= (and b!640142 c!73194) b!640145))

(assert (= (and b!640142 (not c!73194)) b!640144))

(assert (= (and b!640144 c!73193) b!640143))

(assert (= (and b!640144 (not c!73193)) b!640141))

(declare-fun m!613973 () Bool)

(assert (=> b!640141 m!613973))

(declare-fun m!613975 () Bool)

(assert (=> d!90431 m!613975))

(assert (=> d!90431 m!613749))

(declare-fun m!613977 () Bool)

(assert (=> d!90431 m!613977))

(declare-fun m!613979 () Bool)

(assert (=> d!90431 m!613979))

(declare-fun m!613981 () Bool)

(assert (=> d!90431 m!613981))

(assert (=> d!90431 m!613975))

(declare-fun m!613983 () Bool)

(assert (=> d!90431 m!613983))

(declare-fun m!613985 () Bool)

(assert (=> b!640142 m!613985))

(assert (=> b!639878 d!90431))

(declare-fun b!640146 () Bool)

(declare-fun e!366427 () SeekEntryResult!6826)

(assert (=> b!640146 (= e!366427 (MissingVacant!6826 vacantSpotIndex!68))))

(declare-fun b!640147 () Bool)

(declare-fun e!366426 () SeekEntryResult!6826)

(declare-fun e!366425 () SeekEntryResult!6826)

(assert (=> b!640147 (= e!366426 e!366425)))

(declare-fun c!73196 () Bool)

(declare-fun lt!296204 () (_ BitVec 64))

(assert (=> b!640147 (= c!73196 (= lt!296204 lt!296103))))

(declare-fun lt!296203 () SeekEntryResult!6826)

(declare-fun d!90443 () Bool)

(assert (=> d!90443 (and (or (is-Undefined!6826 lt!296203) (not (is-Found!6826 lt!296203)) (and (bvsge (index!29622 lt!296203) #b00000000000000000000000000000000) (bvslt (index!29622 lt!296203) (size!18750 lt!296097)))) (or (is-Undefined!6826 lt!296203) (is-Found!6826 lt!296203) (not (is-MissingVacant!6826 lt!296203)) (not (= (index!29624 lt!296203) vacantSpotIndex!68)) (and (bvsge (index!29624 lt!296203) #b00000000000000000000000000000000) (bvslt (index!29624 lt!296203) (size!18750 lt!296097)))) (or (is-Undefined!6826 lt!296203) (ite (is-Found!6826 lt!296203) (= (select (arr!18386 lt!296097) (index!29622 lt!296203)) lt!296103) (and (is-MissingVacant!6826 lt!296203) (= (index!29624 lt!296203) vacantSpotIndex!68) (= (select (arr!18386 lt!296097) (index!29624 lt!296203)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90443 (= lt!296203 e!366426)))

(declare-fun c!73197 () Bool)

(assert (=> d!90443 (= c!73197 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!90443 (= lt!296204 (select (arr!18386 lt!296097) lt!296095))))

(assert (=> d!90443 (validMask!0 mask!3053)))

(assert (=> d!90443 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296095 vacantSpotIndex!68 lt!296103 lt!296097 mask!3053) lt!296203)))

(declare-fun b!640148 () Bool)

(assert (=> b!640148 (= e!366427 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!296095 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!296103 lt!296097 mask!3053))))

(declare-fun b!640149 () Bool)

(assert (=> b!640149 (= e!366425 (Found!6826 lt!296095))))

(declare-fun b!640150 () Bool)

(assert (=> b!640150 (= e!366426 Undefined!6826)))

(declare-fun b!640151 () Bool)

(declare-fun c!73195 () Bool)

(assert (=> b!640151 (= c!73195 (= lt!296204 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!640151 (= e!366425 e!366427)))

(assert (= (and d!90443 c!73197) b!640150))

(assert (= (and d!90443 (not c!73197)) b!640147))

(assert (= (and b!640147 c!73196) b!640149))

(assert (= (and b!640147 (not c!73196)) b!640151))

(assert (= (and b!640151 c!73195) b!640146))

(assert (= (and b!640151 (not c!73195)) b!640148))

(declare-fun m!613987 () Bool)

(assert (=> d!90443 m!613987))

(declare-fun m!613989 () Bool)


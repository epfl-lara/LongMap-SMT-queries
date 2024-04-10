; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55704 () Bool)

(assert start!55704)

(declare-fun res!392733 () Bool)

(declare-fun e!349765 () Bool)

(assert (=> start!55704 (=> (not res!392733) (not e!349765))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55704 (= res!392733 (validMask!0 mask!3053))))

(assert (=> start!55704 e!349765))

(assert (=> start!55704 true))

(declare-datatypes ((array!37354 0))(
  ( (array!37355 (arr!17926 (Array (_ BitVec 32) (_ BitVec 64))) (size!18290 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37354)

(declare-fun array_inv!13722 (array!37354) Bool)

(assert (=> start!55704 (array_inv!13722 a!2986)))

(declare-fun b!610539 () Bool)

(declare-fun e!349766 () Bool)

(declare-datatypes ((SeekEntryResult!6366 0))(
  ( (MissingZero!6366 (index!27742 (_ BitVec 32))) (Found!6366 (index!27743 (_ BitVec 32))) (Intermediate!6366 (undefined!7178 Bool) (index!27744 (_ BitVec 32)) (x!56548 (_ BitVec 32))) (Undefined!6366) (MissingVacant!6366 (index!27745 (_ BitVec 32))) )
))
(declare-fun lt!279268 () SeekEntryResult!6366)

(declare-fun lt!279279 () SeekEntryResult!6366)

(assert (=> b!610539 (= e!349766 (= lt!279268 lt!279279))))

(declare-fun b!610540 () Bool)

(declare-fun e!349760 () Bool)

(declare-fun e!349758 () Bool)

(assert (=> b!610540 (= e!349760 e!349758)))

(declare-fun res!392730 () Bool)

(assert (=> b!610540 (=> res!392730 e!349758)))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!610540 (= res!392730 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!19576 0))(
  ( (Unit!19577) )
))
(declare-fun lt!279278 () Unit!19576)

(declare-fun e!349755 () Unit!19576)

(assert (=> b!610540 (= lt!279278 e!349755)))

(declare-fun c!69275 () Bool)

(assert (=> b!610540 (= c!69275 (bvslt j!136 index!984))))

(declare-fun b!610541 () Bool)

(declare-fun res!392743 () Bool)

(assert (=> b!610541 (=> (not res!392743) (not e!349765))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!610541 (= res!392743 (and (= (size!18290 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18290 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18290 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!610542 () Bool)

(declare-fun e!349762 () Bool)

(declare-fun lt!279281 () array!37354)

(declare-fun arrayContainsKey!0 (array!37354 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!610542 (= e!349762 (arrayContainsKey!0 lt!279281 (select (arr!17926 a!2986) j!136) index!984))))

(declare-fun b!610543 () Bool)

(declare-fun res!392731 () Bool)

(declare-fun e!349764 () Bool)

(assert (=> b!610543 (=> (not res!392731) (not e!349764))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37354 (_ BitVec 32)) Bool)

(assert (=> b!610543 (= res!392731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!610544 () Bool)

(declare-fun res!392744 () Bool)

(assert (=> b!610544 (=> (not res!392744) (not e!349764))))

(declare-datatypes ((List!11967 0))(
  ( (Nil!11964) (Cons!11963 (h!13008 (_ BitVec 64)) (t!18195 List!11967)) )
))
(declare-fun arrayNoDuplicates!0 (array!37354 (_ BitVec 32) List!11967) Bool)

(assert (=> b!610544 (= res!392744 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11964))))

(declare-fun b!610545 () Bool)

(declare-fun res!392728 () Bool)

(assert (=> b!610545 (=> (not res!392728) (not e!349765))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!610545 (= res!392728 (validKeyInArray!0 k0!1786))))

(declare-fun b!610546 () Bool)

(declare-fun e!349752 () Unit!19576)

(declare-fun Unit!19578 () Unit!19576)

(assert (=> b!610546 (= e!349752 Unit!19578)))

(assert (=> b!610546 false))

(declare-fun b!610547 () Bool)

(declare-fun e!349754 () Bool)

(declare-fun e!349761 () Bool)

(assert (=> b!610547 (= e!349754 e!349761)))

(declare-fun res!392735 () Bool)

(assert (=> b!610547 (=> res!392735 e!349761)))

(declare-fun lt!279271 () (_ BitVec 64))

(declare-fun lt!279276 () (_ BitVec 64))

(assert (=> b!610547 (= res!392735 (or (not (= (select (arr!17926 a!2986) j!136) lt!279276)) (not (= (select (arr!17926 a!2986) j!136) lt!279271)) (bvsge j!136 index!984)))))

(declare-fun b!610548 () Bool)

(declare-fun e!349767 () Bool)

(assert (=> b!610548 (= e!349761 e!349767)))

(declare-fun res!392738 () Bool)

(assert (=> b!610548 (=> (not res!392738) (not e!349767))))

(assert (=> b!610548 (= res!392738 (arrayContainsKey!0 lt!279281 (select (arr!17926 a!2986) j!136) j!136))))

(declare-fun b!610549 () Bool)

(declare-fun e!349757 () Bool)

(declare-fun e!349759 () Bool)

(assert (=> b!610549 (= e!349757 e!349759)))

(declare-fun res!392740 () Bool)

(assert (=> b!610549 (=> (not res!392740) (not e!349759))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!610549 (= res!392740 (and (= lt!279268 (Found!6366 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17926 a!2986) index!984) (select (arr!17926 a!2986) j!136))) (not (= (select (arr!17926 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37354 (_ BitVec 32)) SeekEntryResult!6366)

(assert (=> b!610549 (= lt!279268 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17926 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!610550 () Bool)

(declare-fun res!392734 () Bool)

(assert (=> b!610550 (=> (not res!392734) (not e!349764))))

(assert (=> b!610550 (= res!392734 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17926 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!610551 () Bool)

(declare-fun res!392739 () Bool)

(assert (=> b!610551 (=> (not res!392739) (not e!349765))))

(assert (=> b!610551 (= res!392739 (validKeyInArray!0 (select (arr!17926 a!2986) j!136)))))

(declare-fun b!610552 () Bool)

(assert (=> b!610552 (= e!349764 e!349757)))

(declare-fun res!392727 () Bool)

(assert (=> b!610552 (=> (not res!392727) (not e!349757))))

(assert (=> b!610552 (= res!392727 (= (select (store (arr!17926 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!610552 (= lt!279281 (array!37355 (store (arr!17926 a!2986) i!1108 k0!1786) (size!18290 a!2986)))))

(declare-fun b!610553 () Bool)

(declare-fun Unit!19579 () Unit!19576)

(assert (=> b!610553 (= e!349755 Unit!19579)))

(declare-fun b!610554 () Bool)

(declare-fun res!392725 () Bool)

(assert (=> b!610554 (=> (not res!392725) (not e!349765))))

(assert (=> b!610554 (= res!392725 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!610555 () Bool)

(declare-fun Unit!19580 () Unit!19576)

(assert (=> b!610555 (= e!349752 Unit!19580)))

(declare-fun b!610556 () Bool)

(declare-fun e!349753 () Bool)

(assert (=> b!610556 (= e!349753 e!349760)))

(declare-fun res!392742 () Bool)

(assert (=> b!610556 (=> res!392742 e!349760)))

(assert (=> b!610556 (= res!392742 (or (not (= (select (arr!17926 a!2986) j!136) lt!279276)) (not (= (select (arr!17926 a!2986) j!136) lt!279271))))))

(assert (=> b!610556 e!349754))

(declare-fun res!392736 () Bool)

(assert (=> b!610556 (=> (not res!392736) (not e!349754))))

(assert (=> b!610556 (= res!392736 (= lt!279271 (select (arr!17926 a!2986) j!136)))))

(assert (=> b!610556 (= lt!279271 (select (store (arr!17926 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!610557 () Bool)

(assert (=> b!610557 (= e!349767 (arrayContainsKey!0 lt!279281 (select (arr!17926 a!2986) j!136) index!984))))

(declare-fun b!610558 () Bool)

(declare-fun Unit!19581 () Unit!19576)

(assert (=> b!610558 (= e!349755 Unit!19581)))

(declare-fun lt!279282 () Unit!19576)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37354 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19576)

(assert (=> b!610558 (= lt!279282 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279281 (select (arr!17926 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!610558 (arrayContainsKey!0 lt!279281 (select (arr!17926 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!279277 () Unit!19576)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37354 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11967) Unit!19576)

(assert (=> b!610558 (= lt!279277 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11964))))

(assert (=> b!610558 (arrayNoDuplicates!0 lt!279281 #b00000000000000000000000000000000 Nil!11964)))

(declare-fun lt!279283 () Unit!19576)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37354 (_ BitVec 32) (_ BitVec 32)) Unit!19576)

(assert (=> b!610558 (= lt!279283 (lemmaNoDuplicateFromThenFromBigger!0 lt!279281 #b00000000000000000000000000000000 j!136))))

(assert (=> b!610558 (arrayNoDuplicates!0 lt!279281 j!136 Nil!11964)))

(declare-fun lt!279267 () Unit!19576)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37354 (_ BitVec 64) (_ BitVec 32) List!11967) Unit!19576)

(assert (=> b!610558 (= lt!279267 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!279281 (select (arr!17926 a!2986) j!136) j!136 Nil!11964))))

(assert (=> b!610558 false))

(declare-fun b!610559 () Bool)

(assert (=> b!610559 (= e!349759 (not e!349753))))

(declare-fun res!392732 () Bool)

(assert (=> b!610559 (=> res!392732 e!349753)))

(declare-fun lt!279275 () SeekEntryResult!6366)

(assert (=> b!610559 (= res!392732 (not (= lt!279275 (Found!6366 index!984))))))

(declare-fun lt!279272 () Unit!19576)

(assert (=> b!610559 (= lt!279272 e!349752)))

(declare-fun c!69274 () Bool)

(assert (=> b!610559 (= c!69274 (= lt!279275 Undefined!6366))))

(assert (=> b!610559 (= lt!279275 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!279276 lt!279281 mask!3053))))

(assert (=> b!610559 e!349766))

(declare-fun res!392729 () Bool)

(assert (=> b!610559 (=> (not res!392729) (not e!349766))))

(declare-fun lt!279274 () (_ BitVec 32))

(assert (=> b!610559 (= res!392729 (= lt!279279 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279274 vacantSpotIndex!68 lt!279276 lt!279281 mask!3053)))))

(assert (=> b!610559 (= lt!279279 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279274 vacantSpotIndex!68 (select (arr!17926 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!610559 (= lt!279276 (select (store (arr!17926 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!279273 () Unit!19576)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37354 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19576)

(assert (=> b!610559 (= lt!279273 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!279274 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!610559 (= lt!279274 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!610560 () Bool)

(declare-fun e!349756 () Bool)

(assert (=> b!610560 (= e!349758 e!349756)))

(declare-fun res!392726 () Bool)

(assert (=> b!610560 (=> res!392726 e!349756)))

(assert (=> b!610560 (= res!392726 (or (bvsgt #b00000000000000000000000000000000 (size!18290 a!2986)) (bvsge (size!18290 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!610560 (arrayNoDuplicates!0 lt!279281 #b00000000000000000000000000000000 Nil!11964)))

(declare-fun lt!279280 () Unit!19576)

(assert (=> b!610560 (= lt!279280 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11964))))

(assert (=> b!610560 (arrayContainsKey!0 lt!279281 (select (arr!17926 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!279269 () Unit!19576)

(assert (=> b!610560 (= lt!279269 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279281 (select (arr!17926 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!610560 e!349762))

(declare-fun res!392737 () Bool)

(assert (=> b!610560 (=> (not res!392737) (not e!349762))))

(assert (=> b!610560 (= res!392737 (arrayContainsKey!0 lt!279281 (select (arr!17926 a!2986) j!136) j!136))))

(declare-fun b!610561 () Bool)

(declare-fun noDuplicate!343 (List!11967) Bool)

(assert (=> b!610561 (= e!349756 (noDuplicate!343 Nil!11964))))

(declare-fun b!610562 () Bool)

(assert (=> b!610562 (= e!349765 e!349764)))

(declare-fun res!392741 () Bool)

(assert (=> b!610562 (=> (not res!392741) (not e!349764))))

(declare-fun lt!279270 () SeekEntryResult!6366)

(assert (=> b!610562 (= res!392741 (or (= lt!279270 (MissingZero!6366 i!1108)) (= lt!279270 (MissingVacant!6366 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37354 (_ BitVec 32)) SeekEntryResult!6366)

(assert (=> b!610562 (= lt!279270 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!55704 res!392733) b!610541))

(assert (= (and b!610541 res!392743) b!610551))

(assert (= (and b!610551 res!392739) b!610545))

(assert (= (and b!610545 res!392728) b!610554))

(assert (= (and b!610554 res!392725) b!610562))

(assert (= (and b!610562 res!392741) b!610543))

(assert (= (and b!610543 res!392731) b!610544))

(assert (= (and b!610544 res!392744) b!610550))

(assert (= (and b!610550 res!392734) b!610552))

(assert (= (and b!610552 res!392727) b!610549))

(assert (= (and b!610549 res!392740) b!610559))

(assert (= (and b!610559 res!392729) b!610539))

(assert (= (and b!610559 c!69274) b!610546))

(assert (= (and b!610559 (not c!69274)) b!610555))

(assert (= (and b!610559 (not res!392732)) b!610556))

(assert (= (and b!610556 res!392736) b!610547))

(assert (= (and b!610547 (not res!392735)) b!610548))

(assert (= (and b!610548 res!392738) b!610557))

(assert (= (and b!610556 (not res!392742)) b!610540))

(assert (= (and b!610540 c!69275) b!610558))

(assert (= (and b!610540 (not c!69275)) b!610553))

(assert (= (and b!610540 (not res!392730)) b!610560))

(assert (= (and b!610560 res!392737) b!610542))

(assert (= (and b!610560 (not res!392726)) b!610561))

(declare-fun m!586991 () Bool)

(assert (=> b!610557 m!586991))

(assert (=> b!610557 m!586991))

(declare-fun m!586993 () Bool)

(assert (=> b!610557 m!586993))

(declare-fun m!586995 () Bool)

(assert (=> b!610543 m!586995))

(declare-fun m!586997 () Bool)

(assert (=> b!610550 m!586997))

(declare-fun m!586999 () Bool)

(assert (=> b!610545 m!586999))

(assert (=> b!610551 m!586991))

(assert (=> b!610551 m!586991))

(declare-fun m!587001 () Bool)

(assert (=> b!610551 m!587001))

(assert (=> b!610542 m!586991))

(assert (=> b!610542 m!586991))

(assert (=> b!610542 m!586993))

(assert (=> b!610547 m!586991))

(declare-fun m!587003 () Bool)

(assert (=> b!610549 m!587003))

(assert (=> b!610549 m!586991))

(assert (=> b!610549 m!586991))

(declare-fun m!587005 () Bool)

(assert (=> b!610549 m!587005))

(declare-fun m!587007 () Bool)

(assert (=> b!610562 m!587007))

(declare-fun m!587009 () Bool)

(assert (=> b!610554 m!587009))

(assert (=> b!610548 m!586991))

(assert (=> b!610548 m!586991))

(declare-fun m!587011 () Bool)

(assert (=> b!610548 m!587011))

(declare-fun m!587013 () Bool)

(assert (=> b!610544 m!587013))

(declare-fun m!587015 () Bool)

(assert (=> start!55704 m!587015))

(declare-fun m!587017 () Bool)

(assert (=> start!55704 m!587017))

(declare-fun m!587019 () Bool)

(assert (=> b!610558 m!587019))

(assert (=> b!610558 m!586991))

(declare-fun m!587021 () Bool)

(assert (=> b!610558 m!587021))

(assert (=> b!610558 m!586991))

(declare-fun m!587023 () Bool)

(assert (=> b!610558 m!587023))

(assert (=> b!610558 m!586991))

(declare-fun m!587025 () Bool)

(assert (=> b!610558 m!587025))

(declare-fun m!587027 () Bool)

(assert (=> b!610558 m!587027))

(assert (=> b!610558 m!586991))

(declare-fun m!587029 () Bool)

(assert (=> b!610558 m!587029))

(declare-fun m!587031 () Bool)

(assert (=> b!610558 m!587031))

(assert (=> b!610556 m!586991))

(declare-fun m!587033 () Bool)

(assert (=> b!610556 m!587033))

(declare-fun m!587035 () Bool)

(assert (=> b!610556 m!587035))

(declare-fun m!587037 () Bool)

(assert (=> b!610561 m!587037))

(assert (=> b!610552 m!587033))

(declare-fun m!587039 () Bool)

(assert (=> b!610552 m!587039))

(declare-fun m!587041 () Bool)

(assert (=> b!610559 m!587041))

(declare-fun m!587043 () Bool)

(assert (=> b!610559 m!587043))

(declare-fun m!587045 () Bool)

(assert (=> b!610559 m!587045))

(declare-fun m!587047 () Bool)

(assert (=> b!610559 m!587047))

(assert (=> b!610559 m!586991))

(assert (=> b!610559 m!586991))

(declare-fun m!587049 () Bool)

(assert (=> b!610559 m!587049))

(declare-fun m!587051 () Bool)

(assert (=> b!610559 m!587051))

(assert (=> b!610559 m!587033))

(assert (=> b!610560 m!586991))

(assert (=> b!610560 m!586991))

(assert (=> b!610560 m!587011))

(assert (=> b!610560 m!586991))

(declare-fun m!587053 () Bool)

(assert (=> b!610560 m!587053))

(assert (=> b!610560 m!587027))

(assert (=> b!610560 m!586991))

(declare-fun m!587055 () Bool)

(assert (=> b!610560 m!587055))

(assert (=> b!610560 m!587031))

(check-sat (not b!610545) (not b!610561) (not b!610549) (not b!610557) (not b!610543) (not b!610551) (not b!610558) (not b!610559) (not b!610554) (not b!610560) (not b!610548) (not b!610544) (not b!610542) (not start!55704) (not b!610562))
(check-sat)
(get-model)

(declare-fun bm!33134 () Bool)

(declare-fun call!33137 () Bool)

(assert (=> bm!33134 (= call!33137 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!610643 () Bool)

(declare-fun e!349823 () Bool)

(assert (=> b!610643 (= e!349823 call!33137)))

(declare-fun b!610645 () Bool)

(declare-fun e!349824 () Bool)

(assert (=> b!610645 (= e!349823 e!349824)))

(declare-fun lt!279341 () (_ BitVec 64))

(assert (=> b!610645 (= lt!279341 (select (arr!17926 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!279343 () Unit!19576)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37354 (_ BitVec 64) (_ BitVec 32)) Unit!19576)

(assert (=> b!610645 (= lt!279343 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!279341 #b00000000000000000000000000000000))))

(assert (=> b!610645 (arrayContainsKey!0 a!2986 lt!279341 #b00000000000000000000000000000000)))

(declare-fun lt!279342 () Unit!19576)

(assert (=> b!610645 (= lt!279342 lt!279343)))

(declare-fun res!392809 () Bool)

(assert (=> b!610645 (= res!392809 (= (seekEntryOrOpen!0 (select (arr!17926 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6366 #b00000000000000000000000000000000)))))

(assert (=> b!610645 (=> (not res!392809) (not e!349824))))

(declare-fun b!610646 () Bool)

(declare-fun e!349822 () Bool)

(assert (=> b!610646 (= e!349822 e!349823)))

(declare-fun c!69284 () Bool)

(assert (=> b!610646 (= c!69284 (validKeyInArray!0 (select (arr!17926 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!610644 () Bool)

(assert (=> b!610644 (= e!349824 call!33137)))

(declare-fun d!88247 () Bool)

(declare-fun res!392810 () Bool)

(assert (=> d!88247 (=> res!392810 e!349822)))

(assert (=> d!88247 (= res!392810 (bvsge #b00000000000000000000000000000000 (size!18290 a!2986)))))

(assert (=> d!88247 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!349822)))

(assert (= (and d!88247 (not res!392810)) b!610646))

(assert (= (and b!610646 c!69284) b!610645))

(assert (= (and b!610646 (not c!69284)) b!610643))

(assert (= (and b!610645 res!392809) b!610644))

(assert (= (or b!610644 b!610643) bm!33134))

(declare-fun m!587123 () Bool)

(assert (=> bm!33134 m!587123))

(declare-fun m!587125 () Bool)

(assert (=> b!610645 m!587125))

(declare-fun m!587127 () Bool)

(assert (=> b!610645 m!587127))

(declare-fun m!587129 () Bool)

(assert (=> b!610645 m!587129))

(assert (=> b!610645 m!587125))

(declare-fun m!587131 () Bool)

(assert (=> b!610645 m!587131))

(assert (=> b!610646 m!587125))

(assert (=> b!610646 m!587125))

(declare-fun m!587133 () Bool)

(assert (=> b!610646 m!587133))

(assert (=> b!610543 d!88247))

(declare-fun d!88249 () Bool)

(declare-fun res!392815 () Bool)

(declare-fun e!349829 () Bool)

(assert (=> d!88249 (=> res!392815 e!349829)))

(assert (=> d!88249 (= res!392815 (= (select (arr!17926 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!88249 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!349829)))

(declare-fun b!610651 () Bool)

(declare-fun e!349830 () Bool)

(assert (=> b!610651 (= e!349829 e!349830)))

(declare-fun res!392816 () Bool)

(assert (=> b!610651 (=> (not res!392816) (not e!349830))))

(assert (=> b!610651 (= res!392816 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18290 a!2986)))))

(declare-fun b!610652 () Bool)

(assert (=> b!610652 (= e!349830 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!88249 (not res!392815)) b!610651))

(assert (= (and b!610651 res!392816) b!610652))

(assert (=> d!88249 m!587125))

(declare-fun m!587135 () Bool)

(assert (=> b!610652 m!587135))

(assert (=> b!610554 d!88249))

(declare-fun d!88251 () Bool)

(declare-fun res!392817 () Bool)

(declare-fun e!349831 () Bool)

(assert (=> d!88251 (=> res!392817 e!349831)))

(assert (=> d!88251 (= res!392817 (= (select (arr!17926 lt!279281) index!984) (select (arr!17926 a!2986) j!136)))))

(assert (=> d!88251 (= (arrayContainsKey!0 lt!279281 (select (arr!17926 a!2986) j!136) index!984) e!349831)))

(declare-fun b!610653 () Bool)

(declare-fun e!349832 () Bool)

(assert (=> b!610653 (= e!349831 e!349832)))

(declare-fun res!392818 () Bool)

(assert (=> b!610653 (=> (not res!392818) (not e!349832))))

(assert (=> b!610653 (= res!392818 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18290 lt!279281)))))

(declare-fun b!610654 () Bool)

(assert (=> b!610654 (= e!349832 (arrayContainsKey!0 lt!279281 (select (arr!17926 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!88251 (not res!392817)) b!610653))

(assert (= (and b!610653 res!392818) b!610654))

(declare-fun m!587137 () Bool)

(assert (=> d!88251 m!587137))

(assert (=> b!610654 m!586991))

(declare-fun m!587139 () Bool)

(assert (=> b!610654 m!587139))

(assert (=> b!610542 d!88251))

(declare-fun d!88253 () Bool)

(declare-fun res!392823 () Bool)

(declare-fun e!349837 () Bool)

(assert (=> d!88253 (=> res!392823 e!349837)))

(get-info :version)

(assert (=> d!88253 (= res!392823 ((_ is Nil!11964) Nil!11964))))

(assert (=> d!88253 (= (noDuplicate!343 Nil!11964) e!349837)))

(declare-fun b!610659 () Bool)

(declare-fun e!349838 () Bool)

(assert (=> b!610659 (= e!349837 e!349838)))

(declare-fun res!392824 () Bool)

(assert (=> b!610659 (=> (not res!392824) (not e!349838))))

(declare-fun contains!3039 (List!11967 (_ BitVec 64)) Bool)

(assert (=> b!610659 (= res!392824 (not (contains!3039 (t!18195 Nil!11964) (h!13008 Nil!11964))))))

(declare-fun b!610660 () Bool)

(assert (=> b!610660 (= e!349838 (noDuplicate!343 (t!18195 Nil!11964)))))

(assert (= (and d!88253 (not res!392823)) b!610659))

(assert (= (and b!610659 res!392824) b!610660))

(declare-fun m!587141 () Bool)

(assert (=> b!610659 m!587141))

(declare-fun m!587143 () Bool)

(assert (=> b!610660 m!587143))

(assert (=> b!610561 d!88253))

(declare-fun b!610673 () Bool)

(declare-fun e!349845 () SeekEntryResult!6366)

(declare-fun lt!279352 () SeekEntryResult!6366)

(assert (=> b!610673 (= e!349845 (Found!6366 (index!27744 lt!279352)))))

(declare-fun d!88255 () Bool)

(declare-fun lt!279351 () SeekEntryResult!6366)

(assert (=> d!88255 (and (or ((_ is Undefined!6366) lt!279351) (not ((_ is Found!6366) lt!279351)) (and (bvsge (index!27743 lt!279351) #b00000000000000000000000000000000) (bvslt (index!27743 lt!279351) (size!18290 a!2986)))) (or ((_ is Undefined!6366) lt!279351) ((_ is Found!6366) lt!279351) (not ((_ is MissingZero!6366) lt!279351)) (and (bvsge (index!27742 lt!279351) #b00000000000000000000000000000000) (bvslt (index!27742 lt!279351) (size!18290 a!2986)))) (or ((_ is Undefined!6366) lt!279351) ((_ is Found!6366) lt!279351) ((_ is MissingZero!6366) lt!279351) (not ((_ is MissingVacant!6366) lt!279351)) (and (bvsge (index!27745 lt!279351) #b00000000000000000000000000000000) (bvslt (index!27745 lt!279351) (size!18290 a!2986)))) (or ((_ is Undefined!6366) lt!279351) (ite ((_ is Found!6366) lt!279351) (= (select (arr!17926 a!2986) (index!27743 lt!279351)) k0!1786) (ite ((_ is MissingZero!6366) lt!279351) (= (select (arr!17926 a!2986) (index!27742 lt!279351)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6366) lt!279351) (= (select (arr!17926 a!2986) (index!27745 lt!279351)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!349846 () SeekEntryResult!6366)

(assert (=> d!88255 (= lt!279351 e!349846)))

(declare-fun c!69291 () Bool)

(assert (=> d!88255 (= c!69291 (and ((_ is Intermediate!6366) lt!279352) (undefined!7178 lt!279352)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37354 (_ BitVec 32)) SeekEntryResult!6366)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88255 (= lt!279352 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!88255 (validMask!0 mask!3053)))

(assert (=> d!88255 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!279351)))

(declare-fun b!610674 () Bool)

(assert (=> b!610674 (= e!349846 Undefined!6366)))

(declare-fun b!610675 () Bool)

(declare-fun e!349847 () SeekEntryResult!6366)

(assert (=> b!610675 (= e!349847 (MissingZero!6366 (index!27744 lt!279352)))))

(declare-fun b!610676 () Bool)

(declare-fun c!69292 () Bool)

(declare-fun lt!279350 () (_ BitVec 64))

(assert (=> b!610676 (= c!69292 (= lt!279350 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!610676 (= e!349845 e!349847)))

(declare-fun b!610677 () Bool)

(assert (=> b!610677 (= e!349847 (seekKeyOrZeroReturnVacant!0 (x!56548 lt!279352) (index!27744 lt!279352) (index!27744 lt!279352) k0!1786 a!2986 mask!3053))))

(declare-fun b!610678 () Bool)

(assert (=> b!610678 (= e!349846 e!349845)))

(assert (=> b!610678 (= lt!279350 (select (arr!17926 a!2986) (index!27744 lt!279352)))))

(declare-fun c!69293 () Bool)

(assert (=> b!610678 (= c!69293 (= lt!279350 k0!1786))))

(assert (= (and d!88255 c!69291) b!610674))

(assert (= (and d!88255 (not c!69291)) b!610678))

(assert (= (and b!610678 c!69293) b!610673))

(assert (= (and b!610678 (not c!69293)) b!610676))

(assert (= (and b!610676 c!69292) b!610675))

(assert (= (and b!610676 (not c!69292)) b!610677))

(declare-fun m!587145 () Bool)

(assert (=> d!88255 m!587145))

(declare-fun m!587147 () Bool)

(assert (=> d!88255 m!587147))

(declare-fun m!587149 () Bool)

(assert (=> d!88255 m!587149))

(declare-fun m!587151 () Bool)

(assert (=> d!88255 m!587151))

(assert (=> d!88255 m!587147))

(declare-fun m!587153 () Bool)

(assert (=> d!88255 m!587153))

(assert (=> d!88255 m!587015))

(declare-fun m!587155 () Bool)

(assert (=> b!610677 m!587155))

(declare-fun m!587157 () Bool)

(assert (=> b!610678 m!587157))

(assert (=> b!610562 d!88255))

(declare-fun d!88261 () Bool)

(assert (=> d!88261 (= (validKeyInArray!0 (select (arr!17926 a!2986) j!136)) (and (not (= (select (arr!17926 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17926 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!610551 d!88261))

(declare-fun d!88263 () Bool)

(declare-fun res!392825 () Bool)

(declare-fun e!349848 () Bool)

(assert (=> d!88263 (=> res!392825 e!349848)))

(assert (=> d!88263 (= res!392825 (= (select (arr!17926 lt!279281) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!17926 a!2986) j!136)))))

(assert (=> d!88263 (= (arrayContainsKey!0 lt!279281 (select (arr!17926 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!349848)))

(declare-fun b!610679 () Bool)

(declare-fun e!349849 () Bool)

(assert (=> b!610679 (= e!349848 e!349849)))

(declare-fun res!392826 () Bool)

(assert (=> b!610679 (=> (not res!392826) (not e!349849))))

(assert (=> b!610679 (= res!392826 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18290 lt!279281)))))

(declare-fun b!610680 () Bool)

(assert (=> b!610680 (= e!349849 (arrayContainsKey!0 lt!279281 (select (arr!17926 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!88263 (not res!392825)) b!610679))

(assert (= (and b!610679 res!392826) b!610680))

(declare-fun m!587159 () Bool)

(assert (=> d!88263 m!587159))

(assert (=> b!610680 m!586991))

(declare-fun m!587161 () Bool)

(assert (=> b!610680 m!587161))

(assert (=> b!610560 d!88263))

(declare-fun d!88265 () Bool)

(assert (=> d!88265 (arrayContainsKey!0 lt!279281 (select (arr!17926 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!279355 () Unit!19576)

(declare-fun choose!114 (array!37354 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19576)

(assert (=> d!88265 (= lt!279355 (choose!114 lt!279281 (select (arr!17926 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!88265 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!88265 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279281 (select (arr!17926 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!279355)))

(declare-fun bs!18628 () Bool)

(assert (= bs!18628 d!88265))

(assert (=> bs!18628 m!586991))

(assert (=> bs!18628 m!587053))

(assert (=> bs!18628 m!586991))

(declare-fun m!587163 () Bool)

(assert (=> bs!18628 m!587163))

(assert (=> b!610560 d!88265))

(declare-fun b!610712 () Bool)

(declare-fun e!349878 () Bool)

(declare-fun e!349877 () Bool)

(assert (=> b!610712 (= e!349878 e!349877)))

(declare-fun c!69299 () Bool)

(assert (=> b!610712 (= c!69299 (validKeyInArray!0 (select (arr!17926 lt!279281) #b00000000000000000000000000000000)))))

(declare-fun d!88267 () Bool)

(declare-fun res!392848 () Bool)

(declare-fun e!349879 () Bool)

(assert (=> d!88267 (=> res!392848 e!349879)))

(assert (=> d!88267 (= res!392848 (bvsge #b00000000000000000000000000000000 (size!18290 lt!279281)))))

(assert (=> d!88267 (= (arrayNoDuplicates!0 lt!279281 #b00000000000000000000000000000000 Nil!11964) e!349879)))

(declare-fun b!610713 () Bool)

(assert (=> b!610713 (= e!349879 e!349878)))

(declare-fun res!392850 () Bool)

(assert (=> b!610713 (=> (not res!392850) (not e!349878))))

(declare-fun e!349876 () Bool)

(assert (=> b!610713 (= res!392850 (not e!349876))))

(declare-fun res!392849 () Bool)

(assert (=> b!610713 (=> (not res!392849) (not e!349876))))

(assert (=> b!610713 (= res!392849 (validKeyInArray!0 (select (arr!17926 lt!279281) #b00000000000000000000000000000000)))))

(declare-fun bm!33140 () Bool)

(declare-fun call!33143 () Bool)

(assert (=> bm!33140 (= call!33143 (arrayNoDuplicates!0 lt!279281 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!69299 (Cons!11963 (select (arr!17926 lt!279281) #b00000000000000000000000000000000) Nil!11964) Nil!11964)))))

(declare-fun b!610714 () Bool)

(assert (=> b!610714 (= e!349877 call!33143)))

(declare-fun b!610715 () Bool)

(assert (=> b!610715 (= e!349877 call!33143)))

(declare-fun b!610716 () Bool)

(assert (=> b!610716 (= e!349876 (contains!3039 Nil!11964 (select (arr!17926 lt!279281) #b00000000000000000000000000000000)))))

(assert (= (and d!88267 (not res!392848)) b!610713))

(assert (= (and b!610713 res!392849) b!610716))

(assert (= (and b!610713 res!392850) b!610712))

(assert (= (and b!610712 c!69299) b!610715))

(assert (= (and b!610712 (not c!69299)) b!610714))

(assert (= (or b!610715 b!610714) bm!33140))

(declare-fun m!587177 () Bool)

(assert (=> b!610712 m!587177))

(assert (=> b!610712 m!587177))

(declare-fun m!587179 () Bool)

(assert (=> b!610712 m!587179))

(assert (=> b!610713 m!587177))

(assert (=> b!610713 m!587177))

(assert (=> b!610713 m!587179))

(assert (=> bm!33140 m!587177))

(declare-fun m!587181 () Bool)

(assert (=> bm!33140 m!587181))

(assert (=> b!610716 m!587177))

(assert (=> b!610716 m!587177))

(declare-fun m!587183 () Bool)

(assert (=> b!610716 m!587183))

(assert (=> b!610560 d!88267))

(declare-fun d!88275 () Bool)

(declare-fun e!349882 () Bool)

(assert (=> d!88275 e!349882))

(declare-fun res!392853 () Bool)

(assert (=> d!88275 (=> (not res!392853) (not e!349882))))

(assert (=> d!88275 (= res!392853 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18290 a!2986))))))

(declare-fun lt!279363 () Unit!19576)

(declare-fun choose!41 (array!37354 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11967) Unit!19576)

(assert (=> d!88275 (= lt!279363 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11964))))

(assert (=> d!88275 (bvslt (size!18290 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!88275 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11964) lt!279363)))

(declare-fun b!610719 () Bool)

(assert (=> b!610719 (= e!349882 (arrayNoDuplicates!0 (array!37355 (store (arr!17926 a!2986) i!1108 k0!1786) (size!18290 a!2986)) #b00000000000000000000000000000000 Nil!11964))))

(assert (= (and d!88275 res!392853) b!610719))

(declare-fun m!587187 () Bool)

(assert (=> d!88275 m!587187))

(assert (=> b!610719 m!587033))

(declare-fun m!587191 () Bool)

(assert (=> b!610719 m!587191))

(assert (=> b!610560 d!88275))

(declare-fun d!88279 () Bool)

(declare-fun res!392854 () Bool)

(declare-fun e!349883 () Bool)

(assert (=> d!88279 (=> res!392854 e!349883)))

(assert (=> d!88279 (= res!392854 (= (select (arr!17926 lt!279281) j!136) (select (arr!17926 a!2986) j!136)))))

(assert (=> d!88279 (= (arrayContainsKey!0 lt!279281 (select (arr!17926 a!2986) j!136) j!136) e!349883)))

(declare-fun b!610720 () Bool)

(declare-fun e!349884 () Bool)

(assert (=> b!610720 (= e!349883 e!349884)))

(declare-fun res!392855 () Bool)

(assert (=> b!610720 (=> (not res!392855) (not e!349884))))

(assert (=> b!610720 (= res!392855 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18290 lt!279281)))))

(declare-fun b!610721 () Bool)

(assert (=> b!610721 (= e!349884 (arrayContainsKey!0 lt!279281 (select (arr!17926 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!88279 (not res!392854)) b!610720))

(assert (= (and b!610720 res!392855) b!610721))

(declare-fun m!587195 () Bool)

(assert (=> d!88279 m!587195))

(assert (=> b!610721 m!586991))

(declare-fun m!587197 () Bool)

(assert (=> b!610721 m!587197))

(assert (=> b!610560 d!88279))

(declare-fun b!610794 () Bool)

(declare-fun e!349935 () SeekEntryResult!6366)

(declare-fun e!349936 () SeekEntryResult!6366)

(assert (=> b!610794 (= e!349935 e!349936)))

(declare-fun lt!279391 () (_ BitVec 64))

(declare-fun c!69324 () Bool)

(assert (=> b!610794 (= c!69324 (= lt!279391 (select (arr!17926 a!2986) j!136)))))

(declare-fun b!610795 () Bool)

(declare-fun e!349937 () SeekEntryResult!6366)

(assert (=> b!610795 (= e!349937 (MissingVacant!6366 vacantSpotIndex!68))))

(declare-fun b!610797 () Bool)

(assert (=> b!610797 (= e!349935 Undefined!6366)))

(declare-fun lt!279390 () SeekEntryResult!6366)

(declare-fun d!88283 () Bool)

(assert (=> d!88283 (and (or ((_ is Undefined!6366) lt!279390) (not ((_ is Found!6366) lt!279390)) (and (bvsge (index!27743 lt!279390) #b00000000000000000000000000000000) (bvslt (index!27743 lt!279390) (size!18290 a!2986)))) (or ((_ is Undefined!6366) lt!279390) ((_ is Found!6366) lt!279390) (not ((_ is MissingVacant!6366) lt!279390)) (not (= (index!27745 lt!279390) vacantSpotIndex!68)) (and (bvsge (index!27745 lt!279390) #b00000000000000000000000000000000) (bvslt (index!27745 lt!279390) (size!18290 a!2986)))) (or ((_ is Undefined!6366) lt!279390) (ite ((_ is Found!6366) lt!279390) (= (select (arr!17926 a!2986) (index!27743 lt!279390)) (select (arr!17926 a!2986) j!136)) (and ((_ is MissingVacant!6366) lt!279390) (= (index!27745 lt!279390) vacantSpotIndex!68) (= (select (arr!17926 a!2986) (index!27745 lt!279390)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!88283 (= lt!279390 e!349935)))

(declare-fun c!69322 () Bool)

(assert (=> d!88283 (= c!69322 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!88283 (= lt!279391 (select (arr!17926 a!2986) index!984))))

(assert (=> d!88283 (validMask!0 mask!3053)))

(assert (=> d!88283 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17926 a!2986) j!136) a!2986 mask!3053) lt!279390)))

(declare-fun b!610796 () Bool)

(declare-fun c!69323 () Bool)

(assert (=> b!610796 (= c!69323 (= lt!279391 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!610796 (= e!349936 e!349937)))

(declare-fun b!610798 () Bool)

(assert (=> b!610798 (= e!349937 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17926 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!610799 () Bool)

(assert (=> b!610799 (= e!349936 (Found!6366 index!984))))

(assert (= (and d!88283 c!69322) b!610797))

(assert (= (and d!88283 (not c!69322)) b!610794))

(assert (= (and b!610794 c!69324) b!610799))

(assert (= (and b!610794 (not c!69324)) b!610796))

(assert (= (and b!610796 c!69323) b!610795))

(assert (= (and b!610796 (not c!69323)) b!610798))

(declare-fun m!587245 () Bool)

(assert (=> d!88283 m!587245))

(declare-fun m!587247 () Bool)

(assert (=> d!88283 m!587247))

(assert (=> d!88283 m!587003))

(assert (=> d!88283 m!587015))

(assert (=> b!610798 m!587041))

(assert (=> b!610798 m!587041))

(assert (=> b!610798 m!586991))

(declare-fun m!587249 () Bool)

(assert (=> b!610798 m!587249))

(assert (=> b!610549 d!88283))

(declare-fun d!88299 () Bool)

(assert (=> d!88299 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!55704 d!88299))

(declare-fun d!88313 () Bool)

(assert (=> d!88313 (= (array_inv!13722 a!2986) (bvsge (size!18290 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!55704 d!88313))

(assert (=> b!610548 d!88279))

(declare-fun b!610816 () Bool)

(declare-fun e!349952 () SeekEntryResult!6366)

(declare-fun e!349953 () SeekEntryResult!6366)

(assert (=> b!610816 (= e!349952 e!349953)))

(declare-fun c!69329 () Bool)

(declare-fun lt!279402 () (_ BitVec 64))

(assert (=> b!610816 (= c!69329 (= lt!279402 lt!279276))))

(declare-fun b!610817 () Bool)

(declare-fun e!349954 () SeekEntryResult!6366)

(assert (=> b!610817 (= e!349954 (MissingVacant!6366 vacantSpotIndex!68))))

(declare-fun b!610819 () Bool)

(assert (=> b!610819 (= e!349952 Undefined!6366)))

(declare-fun lt!279401 () SeekEntryResult!6366)

(declare-fun d!88315 () Bool)

(assert (=> d!88315 (and (or ((_ is Undefined!6366) lt!279401) (not ((_ is Found!6366) lt!279401)) (and (bvsge (index!27743 lt!279401) #b00000000000000000000000000000000) (bvslt (index!27743 lt!279401) (size!18290 lt!279281)))) (or ((_ is Undefined!6366) lt!279401) ((_ is Found!6366) lt!279401) (not ((_ is MissingVacant!6366) lt!279401)) (not (= (index!27745 lt!279401) vacantSpotIndex!68)) (and (bvsge (index!27745 lt!279401) #b00000000000000000000000000000000) (bvslt (index!27745 lt!279401) (size!18290 lt!279281)))) (or ((_ is Undefined!6366) lt!279401) (ite ((_ is Found!6366) lt!279401) (= (select (arr!17926 lt!279281) (index!27743 lt!279401)) lt!279276) (and ((_ is MissingVacant!6366) lt!279401) (= (index!27745 lt!279401) vacantSpotIndex!68) (= (select (arr!17926 lt!279281) (index!27745 lt!279401)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!88315 (= lt!279401 e!349952)))

(declare-fun c!69327 () Bool)

(assert (=> d!88315 (= c!69327 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!88315 (= lt!279402 (select (arr!17926 lt!279281) lt!279274))))

(assert (=> d!88315 (validMask!0 mask!3053)))

(assert (=> d!88315 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279274 vacantSpotIndex!68 lt!279276 lt!279281 mask!3053) lt!279401)))

(declare-fun b!610818 () Bool)

(declare-fun c!69328 () Bool)

(assert (=> b!610818 (= c!69328 (= lt!279402 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!610818 (= e!349953 e!349954)))

(declare-fun b!610820 () Bool)

(assert (=> b!610820 (= e!349954 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!279274 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!279276 lt!279281 mask!3053))))

(declare-fun b!610821 () Bool)

(assert (=> b!610821 (= e!349953 (Found!6366 lt!279274))))

(assert (= (and d!88315 c!69327) b!610819))

(assert (= (and d!88315 (not c!69327)) b!610816))

(assert (= (and b!610816 c!69329) b!610821))

(assert (= (and b!610816 (not c!69329)) b!610818))

(assert (= (and b!610818 c!69328) b!610817))

(assert (= (and b!610818 (not c!69328)) b!610820))

(declare-fun m!587279 () Bool)

(assert (=> d!88315 m!587279))

(declare-fun m!587281 () Bool)

(assert (=> d!88315 m!587281))

(declare-fun m!587283 () Bool)

(assert (=> d!88315 m!587283))

(assert (=> d!88315 m!587015))

(declare-fun m!587285 () Bool)

(assert (=> b!610820 m!587285))

(assert (=> b!610820 m!587285))

(declare-fun m!587287 () Bool)

(assert (=> b!610820 m!587287))

(assert (=> b!610559 d!88315))

(declare-fun b!610822 () Bool)

(declare-fun e!349955 () SeekEntryResult!6366)

(declare-fun e!349956 () SeekEntryResult!6366)

(assert (=> b!610822 (= e!349955 e!349956)))

(declare-fun lt!279406 () (_ BitVec 64))

(declare-fun c!69332 () Bool)

(assert (=> b!610822 (= c!69332 (= lt!279406 (select (arr!17926 a!2986) j!136)))))

(declare-fun b!610823 () Bool)

(declare-fun e!349957 () SeekEntryResult!6366)

(assert (=> b!610823 (= e!349957 (MissingVacant!6366 vacantSpotIndex!68))))

(declare-fun b!610825 () Bool)

(assert (=> b!610825 (= e!349955 Undefined!6366)))

(declare-fun lt!279405 () SeekEntryResult!6366)

(declare-fun d!88317 () Bool)

(assert (=> d!88317 (and (or ((_ is Undefined!6366) lt!279405) (not ((_ is Found!6366) lt!279405)) (and (bvsge (index!27743 lt!279405) #b00000000000000000000000000000000) (bvslt (index!27743 lt!279405) (size!18290 a!2986)))) (or ((_ is Undefined!6366) lt!279405) ((_ is Found!6366) lt!279405) (not ((_ is MissingVacant!6366) lt!279405)) (not (= (index!27745 lt!279405) vacantSpotIndex!68)) (and (bvsge (index!27745 lt!279405) #b00000000000000000000000000000000) (bvslt (index!27745 lt!279405) (size!18290 a!2986)))) (or ((_ is Undefined!6366) lt!279405) (ite ((_ is Found!6366) lt!279405) (= (select (arr!17926 a!2986) (index!27743 lt!279405)) (select (arr!17926 a!2986) j!136)) (and ((_ is MissingVacant!6366) lt!279405) (= (index!27745 lt!279405) vacantSpotIndex!68) (= (select (arr!17926 a!2986) (index!27745 lt!279405)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!88317 (= lt!279405 e!349955)))

(declare-fun c!69330 () Bool)

(assert (=> d!88317 (= c!69330 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!88317 (= lt!279406 (select (arr!17926 a!2986) lt!279274))))

(assert (=> d!88317 (validMask!0 mask!3053)))

(assert (=> d!88317 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279274 vacantSpotIndex!68 (select (arr!17926 a!2986) j!136) a!2986 mask!3053) lt!279405)))

(declare-fun b!610824 () Bool)

(declare-fun c!69331 () Bool)

(assert (=> b!610824 (= c!69331 (= lt!279406 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!610824 (= e!349956 e!349957)))

(declare-fun b!610826 () Bool)

(assert (=> b!610826 (= e!349957 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!279274 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17926 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!610827 () Bool)

(assert (=> b!610827 (= e!349956 (Found!6366 lt!279274))))

(assert (= (and d!88317 c!69330) b!610825))

(assert (= (and d!88317 (not c!69330)) b!610822))

(assert (= (and b!610822 c!69332) b!610827))

(assert (= (and b!610822 (not c!69332)) b!610824))

(assert (= (and b!610824 c!69331) b!610823))

(assert (= (and b!610824 (not c!69331)) b!610826))

(declare-fun m!587291 () Bool)

(assert (=> d!88317 m!587291))

(declare-fun m!587293 () Bool)

(assert (=> d!88317 m!587293))

(declare-fun m!587295 () Bool)

(assert (=> d!88317 m!587295))

(assert (=> d!88317 m!587015))

(assert (=> b!610826 m!587285))

(assert (=> b!610826 m!587285))

(assert (=> b!610826 m!586991))

(declare-fun m!587299 () Bool)

(assert (=> b!610826 m!587299))

(assert (=> b!610559 d!88317))

(declare-fun d!88323 () Bool)

(declare-fun lt!279413 () (_ BitVec 32))

(assert (=> d!88323 (and (bvsge lt!279413 #b00000000000000000000000000000000) (bvslt lt!279413 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88323 (= lt!279413 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!88323 (validMask!0 mask!3053)))

(assert (=> d!88323 (= (nextIndex!0 index!984 x!910 mask!3053) lt!279413)))

(declare-fun bs!18635 () Bool)

(assert (= bs!18635 d!88323))

(declare-fun m!587301 () Bool)

(assert (=> bs!18635 m!587301))

(assert (=> bs!18635 m!587015))

(assert (=> b!610559 d!88323))

(declare-fun d!88325 () Bool)

(declare-fun e!349985 () Bool)

(assert (=> d!88325 e!349985))

(declare-fun res!392914 () Bool)

(assert (=> d!88325 (=> (not res!392914) (not e!349985))))

(assert (=> d!88325 (= res!392914 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18290 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18290 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18290 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18290 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18290 a!2986))))))

(declare-fun lt!279426 () Unit!19576)

(declare-fun choose!9 (array!37354 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19576)

(assert (=> d!88325 (= lt!279426 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!279274 vacantSpotIndex!68 mask!3053))))

(assert (=> d!88325 (validMask!0 mask!3053)))

(assert (=> d!88325 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!279274 vacantSpotIndex!68 mask!3053) lt!279426)))

(declare-fun b!610864 () Bool)

(assert (=> b!610864 (= e!349985 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279274 vacantSpotIndex!68 (select (arr!17926 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279274 vacantSpotIndex!68 (select (store (arr!17926 a!2986) i!1108 k0!1786) j!136) (array!37355 (store (arr!17926 a!2986) i!1108 k0!1786) (size!18290 a!2986)) mask!3053)))))

(assert (= (and d!88325 res!392914) b!610864))

(declare-fun m!587333 () Bool)

(assert (=> d!88325 m!587333))

(assert (=> d!88325 m!587015))

(assert (=> b!610864 m!586991))

(assert (=> b!610864 m!587033))

(assert (=> b!610864 m!587043))

(declare-fun m!587335 () Bool)

(assert (=> b!610864 m!587335))

(assert (=> b!610864 m!586991))

(assert (=> b!610864 m!587049))

(assert (=> b!610864 m!587043))

(assert (=> b!610559 d!88325))

(declare-fun b!610865 () Bool)

(declare-fun e!349986 () SeekEntryResult!6366)

(declare-fun e!349987 () SeekEntryResult!6366)

(assert (=> b!610865 (= e!349986 e!349987)))

(declare-fun c!69344 () Bool)

(declare-fun lt!279428 () (_ BitVec 64))

(assert (=> b!610865 (= c!69344 (= lt!279428 lt!279276))))

(declare-fun b!610866 () Bool)

(declare-fun e!349988 () SeekEntryResult!6366)

(assert (=> b!610866 (= e!349988 (MissingVacant!6366 vacantSpotIndex!68))))

(declare-fun b!610868 () Bool)

(assert (=> b!610868 (= e!349986 Undefined!6366)))

(declare-fun lt!279427 () SeekEntryResult!6366)

(declare-fun d!88343 () Bool)

(assert (=> d!88343 (and (or ((_ is Undefined!6366) lt!279427) (not ((_ is Found!6366) lt!279427)) (and (bvsge (index!27743 lt!279427) #b00000000000000000000000000000000) (bvslt (index!27743 lt!279427) (size!18290 lt!279281)))) (or ((_ is Undefined!6366) lt!279427) ((_ is Found!6366) lt!279427) (not ((_ is MissingVacant!6366) lt!279427)) (not (= (index!27745 lt!279427) vacantSpotIndex!68)) (and (bvsge (index!27745 lt!279427) #b00000000000000000000000000000000) (bvslt (index!27745 lt!279427) (size!18290 lt!279281)))) (or ((_ is Undefined!6366) lt!279427) (ite ((_ is Found!6366) lt!279427) (= (select (arr!17926 lt!279281) (index!27743 lt!279427)) lt!279276) (and ((_ is MissingVacant!6366) lt!279427) (= (index!27745 lt!279427) vacantSpotIndex!68) (= (select (arr!17926 lt!279281) (index!27745 lt!279427)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!88343 (= lt!279427 e!349986)))

(declare-fun c!69342 () Bool)

(assert (=> d!88343 (= c!69342 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!88343 (= lt!279428 (select (arr!17926 lt!279281) index!984))))

(assert (=> d!88343 (validMask!0 mask!3053)))

(assert (=> d!88343 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!279276 lt!279281 mask!3053) lt!279427)))

(declare-fun b!610867 () Bool)

(declare-fun c!69343 () Bool)

(assert (=> b!610867 (= c!69343 (= lt!279428 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!610867 (= e!349987 e!349988)))

(declare-fun b!610869 () Bool)

(assert (=> b!610869 (= e!349988 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!279276 lt!279281 mask!3053))))

(declare-fun b!610870 () Bool)

(assert (=> b!610870 (= e!349987 (Found!6366 index!984))))

(assert (= (and d!88343 c!69342) b!610868))

(assert (= (and d!88343 (not c!69342)) b!610865))

(assert (= (and b!610865 c!69344) b!610870))

(assert (= (and b!610865 (not c!69344)) b!610867))

(assert (= (and b!610867 c!69343) b!610866))

(assert (= (and b!610867 (not c!69343)) b!610869))

(declare-fun m!587337 () Bool)

(assert (=> d!88343 m!587337))

(declare-fun m!587339 () Bool)

(assert (=> d!88343 m!587339))

(assert (=> d!88343 m!587137))

(assert (=> d!88343 m!587015))

(assert (=> b!610869 m!587041))

(assert (=> b!610869 m!587041))

(declare-fun m!587341 () Bool)

(assert (=> b!610869 m!587341))

(assert (=> b!610559 d!88343))

(assert (=> b!610557 d!88251))

(declare-fun d!88347 () Bool)

(declare-fun res!392915 () Bool)

(declare-fun e!349989 () Bool)

(assert (=> d!88347 (=> res!392915 e!349989)))

(assert (=> d!88347 (= res!392915 (= (select (arr!17926 lt!279281) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17926 a!2986) j!136)))))

(assert (=> d!88347 (= (arrayContainsKey!0 lt!279281 (select (arr!17926 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!349989)))

(declare-fun b!610871 () Bool)

(declare-fun e!349990 () Bool)

(assert (=> b!610871 (= e!349989 e!349990)))

(declare-fun res!392916 () Bool)

(assert (=> b!610871 (=> (not res!392916) (not e!349990))))

(assert (=> b!610871 (= res!392916 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18290 lt!279281)))))

(declare-fun b!610872 () Bool)

(assert (=> b!610872 (= e!349990 (arrayContainsKey!0 lt!279281 (select (arr!17926 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!88347 (not res!392915)) b!610871))

(assert (= (and b!610871 res!392916) b!610872))

(declare-fun m!587343 () Bool)

(assert (=> d!88347 m!587343))

(assert (=> b!610872 m!586991))

(declare-fun m!587345 () Bool)

(assert (=> b!610872 m!587345))

(assert (=> b!610558 d!88347))

(declare-fun b!610873 () Bool)

(declare-fun e!349993 () Bool)

(declare-fun e!349992 () Bool)

(assert (=> b!610873 (= e!349993 e!349992)))

(declare-fun c!69345 () Bool)

(assert (=> b!610873 (= c!69345 (validKeyInArray!0 (select (arr!17926 lt!279281) j!136)))))

(declare-fun d!88349 () Bool)

(declare-fun res!392917 () Bool)

(declare-fun e!349994 () Bool)

(assert (=> d!88349 (=> res!392917 e!349994)))

(assert (=> d!88349 (= res!392917 (bvsge j!136 (size!18290 lt!279281)))))

(assert (=> d!88349 (= (arrayNoDuplicates!0 lt!279281 j!136 Nil!11964) e!349994)))

(declare-fun b!610874 () Bool)

(assert (=> b!610874 (= e!349994 e!349993)))

(declare-fun res!392919 () Bool)

(assert (=> b!610874 (=> (not res!392919) (not e!349993))))

(declare-fun e!349991 () Bool)

(assert (=> b!610874 (= res!392919 (not e!349991))))

(declare-fun res!392918 () Bool)

(assert (=> b!610874 (=> (not res!392918) (not e!349991))))

(assert (=> b!610874 (= res!392918 (validKeyInArray!0 (select (arr!17926 lt!279281) j!136)))))

(declare-fun call!33153 () Bool)

(declare-fun bm!33150 () Bool)

(assert (=> bm!33150 (= call!33153 (arrayNoDuplicates!0 lt!279281 (bvadd j!136 #b00000000000000000000000000000001) (ite c!69345 (Cons!11963 (select (arr!17926 lt!279281) j!136) Nil!11964) Nil!11964)))))

(declare-fun b!610875 () Bool)

(assert (=> b!610875 (= e!349992 call!33153)))

(declare-fun b!610876 () Bool)

(assert (=> b!610876 (= e!349992 call!33153)))

(declare-fun b!610877 () Bool)

(assert (=> b!610877 (= e!349991 (contains!3039 Nil!11964 (select (arr!17926 lt!279281) j!136)))))

(assert (= (and d!88349 (not res!392917)) b!610874))

(assert (= (and b!610874 res!392918) b!610877))

(assert (= (and b!610874 res!392919) b!610873))

(assert (= (and b!610873 c!69345) b!610876))

(assert (= (and b!610873 (not c!69345)) b!610875))

(assert (= (or b!610876 b!610875) bm!33150))

(assert (=> b!610873 m!587195))

(assert (=> b!610873 m!587195))

(declare-fun m!587347 () Bool)

(assert (=> b!610873 m!587347))

(assert (=> b!610874 m!587195))

(assert (=> b!610874 m!587195))

(assert (=> b!610874 m!587347))

(assert (=> bm!33150 m!587195))

(declare-fun m!587349 () Bool)

(assert (=> bm!33150 m!587349))

(assert (=> b!610877 m!587195))

(assert (=> b!610877 m!587195))

(declare-fun m!587351 () Bool)

(assert (=> b!610877 m!587351))

(assert (=> b!610558 d!88349))

(declare-fun d!88351 () Bool)

(assert (=> d!88351 (arrayContainsKey!0 lt!279281 (select (arr!17926 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!279429 () Unit!19576)

(assert (=> d!88351 (= lt!279429 (choose!114 lt!279281 (select (arr!17926 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!88351 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!88351 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279281 (select (arr!17926 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!279429)))

(declare-fun bs!18637 () Bool)

(assert (= bs!18637 d!88351))

(assert (=> bs!18637 m!586991))

(assert (=> bs!18637 m!587025))

(assert (=> bs!18637 m!586991))

(declare-fun m!587353 () Bool)

(assert (=> bs!18637 m!587353))

(assert (=> b!610558 d!88351))

(declare-fun d!88353 () Bool)

(assert (=> d!88353 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18290 lt!279281)) (not (= (select (arr!17926 lt!279281) j!136) (select (arr!17926 a!2986) j!136))))))

(declare-fun lt!279438 () Unit!19576)

(declare-fun choose!21 (array!37354 (_ BitVec 64) (_ BitVec 32) List!11967) Unit!19576)

(assert (=> d!88353 (= lt!279438 (choose!21 lt!279281 (select (arr!17926 a!2986) j!136) j!136 Nil!11964))))

(assert (=> d!88353 (bvslt (size!18290 lt!279281) #b01111111111111111111111111111111)))

(assert (=> d!88353 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!279281 (select (arr!17926 a!2986) j!136) j!136 Nil!11964) lt!279438)))

(declare-fun bs!18638 () Bool)

(assert (= bs!18638 d!88353))

(assert (=> bs!18638 m!587195))

(assert (=> bs!18638 m!586991))

(declare-fun m!587355 () Bool)

(assert (=> bs!18638 m!587355))

(assert (=> b!610558 d!88353))

(assert (=> b!610558 d!88267))

(assert (=> b!610558 d!88275))

(declare-fun d!88355 () Bool)

(assert (=> d!88355 (arrayNoDuplicates!0 lt!279281 j!136 Nil!11964)))

(declare-fun lt!279441 () Unit!19576)

(declare-fun choose!39 (array!37354 (_ BitVec 32) (_ BitVec 32)) Unit!19576)

(assert (=> d!88355 (= lt!279441 (choose!39 lt!279281 #b00000000000000000000000000000000 j!136))))

(assert (=> d!88355 (bvslt (size!18290 lt!279281) #b01111111111111111111111111111111)))

(assert (=> d!88355 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!279281 #b00000000000000000000000000000000 j!136) lt!279441)))

(declare-fun bs!18639 () Bool)

(assert (= bs!18639 d!88355))

(assert (=> bs!18639 m!587023))

(declare-fun m!587357 () Bool)

(assert (=> bs!18639 m!587357))

(assert (=> b!610558 d!88355))

(declare-fun d!88357 () Bool)

(assert (=> d!88357 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!610545 d!88357))

(declare-fun b!610890 () Bool)

(declare-fun e!350006 () Bool)

(declare-fun e!350005 () Bool)

(assert (=> b!610890 (= e!350006 e!350005)))

(declare-fun c!69349 () Bool)

(assert (=> b!610890 (= c!69349 (validKeyInArray!0 (select (arr!17926 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!88359 () Bool)

(declare-fun res!392926 () Bool)

(declare-fun e!350007 () Bool)

(assert (=> d!88359 (=> res!392926 e!350007)))

(assert (=> d!88359 (= res!392926 (bvsge #b00000000000000000000000000000000 (size!18290 a!2986)))))

(assert (=> d!88359 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11964) e!350007)))

(declare-fun b!610891 () Bool)

(assert (=> b!610891 (= e!350007 e!350006)))

(declare-fun res!392928 () Bool)

(assert (=> b!610891 (=> (not res!392928) (not e!350006))))

(declare-fun e!350004 () Bool)

(assert (=> b!610891 (= res!392928 (not e!350004))))

(declare-fun res!392927 () Bool)

(assert (=> b!610891 (=> (not res!392927) (not e!350004))))

(assert (=> b!610891 (= res!392927 (validKeyInArray!0 (select (arr!17926 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33154 () Bool)

(declare-fun call!33157 () Bool)

(assert (=> bm!33154 (= call!33157 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!69349 (Cons!11963 (select (arr!17926 a!2986) #b00000000000000000000000000000000) Nil!11964) Nil!11964)))))

(declare-fun b!610892 () Bool)

(assert (=> b!610892 (= e!350005 call!33157)))

(declare-fun b!610893 () Bool)

(assert (=> b!610893 (= e!350005 call!33157)))

(declare-fun b!610894 () Bool)

(assert (=> b!610894 (= e!350004 (contains!3039 Nil!11964 (select (arr!17926 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!88359 (not res!392926)) b!610891))

(assert (= (and b!610891 res!392927) b!610894))

(assert (= (and b!610891 res!392928) b!610890))

(assert (= (and b!610890 c!69349) b!610893))

(assert (= (and b!610890 (not c!69349)) b!610892))

(assert (= (or b!610893 b!610892) bm!33154))

(assert (=> b!610890 m!587125))

(assert (=> b!610890 m!587125))

(assert (=> b!610890 m!587133))

(assert (=> b!610891 m!587125))

(assert (=> b!610891 m!587125))

(assert (=> b!610891 m!587133))

(assert (=> bm!33154 m!587125))

(declare-fun m!587371 () Bool)

(assert (=> bm!33154 m!587371))

(assert (=> b!610894 m!587125))

(assert (=> b!610894 m!587125))

(declare-fun m!587373 () Bool)

(assert (=> b!610894 m!587373))

(assert (=> b!610544 d!88359))

(check-sat (not b!610872) (not b!610659) (not b!610873) (not b!610869) (not d!88255) (not d!88265) (not d!88323) (not b!610660) (not b!610677) (not b!610877) (not bm!33140) (not b!610713) (not d!88353) (not d!88325) (not d!88317) (not bm!33134) (not d!88283) (not b!610645) (not d!88315) (not b!610826) (not d!88355) (not b!610820) (not b!610890) (not b!610721) (not d!88343) (not b!610654) (not b!610874) (not bm!33150) (not b!610894) (not b!610716) (not b!610798) (not bm!33154) (not d!88351) (not b!610680) (not b!610864) (not b!610646) (not d!88275) (not b!610652) (not b!610719) (not b!610891) (not b!610712))
(check-sat)

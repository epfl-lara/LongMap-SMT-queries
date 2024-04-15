; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55110 () Bool)

(assert start!55110)

(declare-fun res!387507 () Bool)

(declare-fun e!345097 () Bool)

(assert (=> start!55110 (=> (not res!387507) (not e!345097))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55110 (= res!387507 (validMask!0 mask!3053))))

(assert (=> start!55110 e!345097))

(assert (=> start!55110 true))

(declare-datatypes ((array!37197 0))(
  ( (array!37198 (arr!17855 (Array (_ BitVec 32) (_ BitVec 64))) (size!18220 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37197)

(declare-fun array_inv!13738 (array!37197) Bool)

(assert (=> start!55110 (array_inv!13738 a!2986)))

(declare-fun b!603276 () Bool)

(declare-fun res!387505 () Bool)

(declare-fun e!345105 () Bool)

(assert (=> b!603276 (=> (not res!387505) (not e!345105))))

(declare-datatypes ((List!11935 0))(
  ( (Nil!11932) (Cons!11931 (h!12976 (_ BitVec 64)) (t!18154 List!11935)) )
))
(declare-fun arrayNoDuplicates!0 (array!37197 (_ BitVec 32) List!11935) Bool)

(assert (=> b!603276 (= res!387505 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11932))))

(declare-fun b!603277 () Bool)

(declare-datatypes ((Unit!19134 0))(
  ( (Unit!19135) )
))
(declare-fun e!345100 () Unit!19134)

(declare-fun Unit!19136 () Unit!19134)

(assert (=> b!603277 (= e!345100 Unit!19136)))

(declare-fun e!345098 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!603278 () Bool)

(declare-fun lt!274829 () array!37197)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37197 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!603278 (= e!345098 (arrayContainsKey!0 lt!274829 (select (arr!17855 a!2986) j!136) index!984))))

(declare-fun b!603279 () Bool)

(declare-fun res!387500 () Bool)

(assert (=> b!603279 (=> (not res!387500) (not e!345097))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!603279 (= res!387500 (and (= (size!18220 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18220 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18220 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!603280 () Bool)

(declare-fun res!387494 () Bool)

(assert (=> b!603280 (=> (not res!387494) (not e!345105))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37197 (_ BitVec 32)) Bool)

(assert (=> b!603280 (= res!387494 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!603281 () Bool)

(declare-fun e!345111 () Unit!19134)

(declare-fun Unit!19137 () Unit!19134)

(assert (=> b!603281 (= e!345111 Unit!19137)))

(declare-fun b!603282 () Bool)

(assert (=> b!603282 (= e!345097 e!345105)))

(declare-fun res!387496 () Bool)

(assert (=> b!603282 (=> (not res!387496) (not e!345105))))

(declare-datatypes ((SeekEntryResult!6292 0))(
  ( (MissingZero!6292 (index!27431 (_ BitVec 32))) (Found!6292 (index!27432 (_ BitVec 32))) (Intermediate!6292 (undefined!7104 Bool) (index!27433 (_ BitVec 32)) (x!56240 (_ BitVec 32))) (Undefined!6292) (MissingVacant!6292 (index!27434 (_ BitVec 32))) )
))
(declare-fun lt!274831 () SeekEntryResult!6292)

(assert (=> b!603282 (= res!387496 (or (= lt!274831 (MissingZero!6292 i!1108)) (= lt!274831 (MissingVacant!6292 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37197 (_ BitVec 32)) SeekEntryResult!6292)

(assert (=> b!603282 (= lt!274831 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!603283 () Bool)

(declare-fun Unit!19138 () Unit!19134)

(assert (=> b!603283 (= e!345111 Unit!19138)))

(assert (=> b!603283 false))

(declare-fun b!603284 () Bool)

(declare-fun e!345109 () Bool)

(declare-fun e!345099 () Bool)

(assert (=> b!603284 (= e!345109 (not e!345099))))

(declare-fun res!387495 () Bool)

(assert (=> b!603284 (=> res!387495 e!345099)))

(declare-fun lt!274839 () SeekEntryResult!6292)

(assert (=> b!603284 (= res!387495 (not (= lt!274839 (Found!6292 index!984))))))

(declare-fun lt!274833 () Unit!19134)

(assert (=> b!603284 (= lt!274833 e!345111)))

(declare-fun c!68258 () Bool)

(assert (=> b!603284 (= c!68258 (= lt!274839 Undefined!6292))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!274842 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37197 (_ BitVec 32)) SeekEntryResult!6292)

(assert (=> b!603284 (= lt!274839 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!274842 lt!274829 mask!3053))))

(declare-fun e!345102 () Bool)

(assert (=> b!603284 e!345102))

(declare-fun res!387506 () Bool)

(assert (=> b!603284 (=> (not res!387506) (not e!345102))))

(declare-fun lt!274830 () (_ BitVec 32))

(declare-fun lt!274843 () SeekEntryResult!6292)

(assert (=> b!603284 (= res!387506 (= lt!274843 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274830 vacantSpotIndex!68 lt!274842 lt!274829 mask!3053)))))

(assert (=> b!603284 (= lt!274843 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274830 vacantSpotIndex!68 (select (arr!17855 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!603284 (= lt!274842 (select (store (arr!17855 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!274834 () Unit!19134)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37197 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19134)

(assert (=> b!603284 (= lt!274834 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!274830 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!603284 (= lt!274830 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!603285 () Bool)

(declare-fun lt!274832 () SeekEntryResult!6292)

(assert (=> b!603285 (= e!345102 (= lt!274832 lt!274843))))

(declare-fun b!603286 () Bool)

(declare-fun e!345108 () Bool)

(assert (=> b!603286 (= e!345105 e!345108)))

(declare-fun res!387499 () Bool)

(assert (=> b!603286 (=> (not res!387499) (not e!345108))))

(assert (=> b!603286 (= res!387499 (= (select (store (arr!17855 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!603286 (= lt!274829 (array!37198 (store (arr!17855 a!2986) i!1108 k0!1786) (size!18220 a!2986)))))

(declare-fun b!603287 () Bool)

(assert (=> b!603287 (= e!345108 e!345109)))

(declare-fun res!387502 () Bool)

(assert (=> b!603287 (=> (not res!387502) (not e!345109))))

(assert (=> b!603287 (= res!387502 (and (= lt!274832 (Found!6292 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17855 a!2986) index!984) (select (arr!17855 a!2986) j!136))) (not (= (select (arr!17855 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!603287 (= lt!274832 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17855 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!603288 () Bool)

(declare-fun res!387497 () Bool)

(assert (=> b!603288 (=> (not res!387497) (not e!345097))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!603288 (= res!387497 (validKeyInArray!0 (select (arr!17855 a!2986) j!136)))))

(declare-fun b!603289 () Bool)

(declare-fun res!387511 () Bool)

(assert (=> b!603289 (=> (not res!387511) (not e!345105))))

(assert (=> b!603289 (= res!387511 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17855 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!603290 () Bool)

(declare-fun e!345101 () Bool)

(assert (=> b!603290 (= e!345099 e!345101)))

(declare-fun res!387501 () Bool)

(assert (=> b!603290 (=> res!387501 e!345101)))

(declare-fun lt!274836 () (_ BitVec 64))

(assert (=> b!603290 (= res!387501 (or (not (= (select (arr!17855 a!2986) j!136) lt!274842)) (not (= (select (arr!17855 a!2986) j!136) lt!274836))))))

(declare-fun e!345103 () Bool)

(assert (=> b!603290 e!345103))

(declare-fun res!387498 () Bool)

(assert (=> b!603290 (=> (not res!387498) (not e!345103))))

(assert (=> b!603290 (= res!387498 (= lt!274836 (select (arr!17855 a!2986) j!136)))))

(assert (=> b!603290 (= lt!274836 (select (store (arr!17855 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!603291 () Bool)

(declare-fun e!345107 () Bool)

(declare-fun e!345106 () Bool)

(assert (=> b!603291 (= e!345107 e!345106)))

(declare-fun res!387504 () Bool)

(assert (=> b!603291 (=> (not res!387504) (not e!345106))))

(assert (=> b!603291 (= res!387504 (arrayContainsKey!0 lt!274829 (select (arr!17855 a!2986) j!136) j!136))))

(declare-fun b!603292 () Bool)

(assert (=> b!603292 (= e!345103 e!345107)))

(declare-fun res!387512 () Bool)

(assert (=> b!603292 (=> res!387512 e!345107)))

(assert (=> b!603292 (= res!387512 (or (not (= (select (arr!17855 a!2986) j!136) lt!274842)) (not (= (select (arr!17855 a!2986) j!136) lt!274836)) (bvsge j!136 index!984)))))

(declare-fun b!603293 () Bool)

(declare-fun res!387509 () Bool)

(assert (=> b!603293 (=> (not res!387509) (not e!345097))))

(assert (=> b!603293 (= res!387509 (validKeyInArray!0 k0!1786))))

(declare-fun b!603294 () Bool)

(declare-fun e!345104 () Bool)

(assert (=> b!603294 (= e!345101 e!345104)))

(declare-fun res!387503 () Bool)

(assert (=> b!603294 (=> res!387503 e!345104)))

(assert (=> b!603294 (= res!387503 (bvsge index!984 j!136))))

(declare-fun lt!274837 () Unit!19134)

(assert (=> b!603294 (= lt!274837 e!345100)))

(declare-fun c!68259 () Bool)

(assert (=> b!603294 (= c!68259 (bvslt j!136 index!984))))

(declare-fun b!603295 () Bool)

(assert (=> b!603295 (= e!345106 (arrayContainsKey!0 lt!274829 (select (arr!17855 a!2986) j!136) index!984))))

(declare-fun b!603296 () Bool)

(assert (=> b!603296 (= e!345104 true)))

(assert (=> b!603296 e!345098))

(declare-fun res!387510 () Bool)

(assert (=> b!603296 (=> (not res!387510) (not e!345098))))

(assert (=> b!603296 (= res!387510 (arrayContainsKey!0 lt!274829 (select (arr!17855 a!2986) j!136) j!136))))

(declare-fun b!603297 () Bool)

(declare-fun res!387508 () Bool)

(assert (=> b!603297 (=> (not res!387508) (not e!345097))))

(assert (=> b!603297 (= res!387508 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!603298 () Bool)

(declare-fun Unit!19139 () Unit!19134)

(assert (=> b!603298 (= e!345100 Unit!19139)))

(declare-fun lt!274840 () Unit!19134)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37197 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19134)

(assert (=> b!603298 (= lt!274840 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!274829 (select (arr!17855 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!603298 (arrayContainsKey!0 lt!274829 (select (arr!17855 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!274838 () Unit!19134)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37197 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11935) Unit!19134)

(assert (=> b!603298 (= lt!274838 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11932))))

(assert (=> b!603298 (arrayNoDuplicates!0 lt!274829 #b00000000000000000000000000000000 Nil!11932)))

(declare-fun lt!274835 () Unit!19134)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37197 (_ BitVec 32) (_ BitVec 32)) Unit!19134)

(assert (=> b!603298 (= lt!274835 (lemmaNoDuplicateFromThenFromBigger!0 lt!274829 #b00000000000000000000000000000000 j!136))))

(assert (=> b!603298 (arrayNoDuplicates!0 lt!274829 j!136 Nil!11932)))

(declare-fun lt!274841 () Unit!19134)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37197 (_ BitVec 64) (_ BitVec 32) List!11935) Unit!19134)

(assert (=> b!603298 (= lt!274841 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!274829 (select (arr!17855 a!2986) j!136) j!136 Nil!11932))))

(assert (=> b!603298 false))

(assert (= (and start!55110 res!387507) b!603279))

(assert (= (and b!603279 res!387500) b!603288))

(assert (= (and b!603288 res!387497) b!603293))

(assert (= (and b!603293 res!387509) b!603297))

(assert (= (and b!603297 res!387508) b!603282))

(assert (= (and b!603282 res!387496) b!603280))

(assert (= (and b!603280 res!387494) b!603276))

(assert (= (and b!603276 res!387505) b!603289))

(assert (= (and b!603289 res!387511) b!603286))

(assert (= (and b!603286 res!387499) b!603287))

(assert (= (and b!603287 res!387502) b!603284))

(assert (= (and b!603284 res!387506) b!603285))

(assert (= (and b!603284 c!68258) b!603283))

(assert (= (and b!603284 (not c!68258)) b!603281))

(assert (= (and b!603284 (not res!387495)) b!603290))

(assert (= (and b!603290 res!387498) b!603292))

(assert (= (and b!603292 (not res!387512)) b!603291))

(assert (= (and b!603291 res!387504) b!603295))

(assert (= (and b!603290 (not res!387501)) b!603294))

(assert (= (and b!603294 c!68259) b!603298))

(assert (= (and b!603294 (not c!68259)) b!603277))

(assert (= (and b!603294 (not res!387503)) b!603296))

(assert (= (and b!603296 res!387510) b!603278))

(declare-fun m!579781 () Bool)

(assert (=> b!603287 m!579781))

(declare-fun m!579783 () Bool)

(assert (=> b!603287 m!579783))

(assert (=> b!603287 m!579783))

(declare-fun m!579785 () Bool)

(assert (=> b!603287 m!579785))

(declare-fun m!579787 () Bool)

(assert (=> b!603282 m!579787))

(declare-fun m!579789 () Bool)

(assert (=> b!603284 m!579789))

(declare-fun m!579791 () Bool)

(assert (=> b!603284 m!579791))

(declare-fun m!579793 () Bool)

(assert (=> b!603284 m!579793))

(assert (=> b!603284 m!579783))

(declare-fun m!579795 () Bool)

(assert (=> b!603284 m!579795))

(declare-fun m!579797 () Bool)

(assert (=> b!603284 m!579797))

(declare-fun m!579799 () Bool)

(assert (=> b!603284 m!579799))

(assert (=> b!603284 m!579783))

(declare-fun m!579801 () Bool)

(assert (=> b!603284 m!579801))

(declare-fun m!579803 () Bool)

(assert (=> b!603276 m!579803))

(assert (=> b!603295 m!579783))

(assert (=> b!603295 m!579783))

(declare-fun m!579805 () Bool)

(assert (=> b!603295 m!579805))

(declare-fun m!579807 () Bool)

(assert (=> start!55110 m!579807))

(declare-fun m!579809 () Bool)

(assert (=> start!55110 m!579809))

(assert (=> b!603291 m!579783))

(assert (=> b!603291 m!579783))

(declare-fun m!579811 () Bool)

(assert (=> b!603291 m!579811))

(assert (=> b!603278 m!579783))

(assert (=> b!603278 m!579783))

(assert (=> b!603278 m!579805))

(assert (=> b!603288 m!579783))

(assert (=> b!603288 m!579783))

(declare-fun m!579813 () Bool)

(assert (=> b!603288 m!579813))

(declare-fun m!579815 () Bool)

(assert (=> b!603298 m!579815))

(declare-fun m!579817 () Bool)

(assert (=> b!603298 m!579817))

(assert (=> b!603298 m!579783))

(declare-fun m!579819 () Bool)

(assert (=> b!603298 m!579819))

(declare-fun m!579821 () Bool)

(assert (=> b!603298 m!579821))

(assert (=> b!603298 m!579783))

(assert (=> b!603298 m!579783))

(declare-fun m!579823 () Bool)

(assert (=> b!603298 m!579823))

(declare-fun m!579825 () Bool)

(assert (=> b!603298 m!579825))

(assert (=> b!603298 m!579783))

(declare-fun m!579827 () Bool)

(assert (=> b!603298 m!579827))

(declare-fun m!579829 () Bool)

(assert (=> b!603297 m!579829))

(assert (=> b!603296 m!579783))

(assert (=> b!603296 m!579783))

(assert (=> b!603296 m!579811))

(declare-fun m!579831 () Bool)

(assert (=> b!603280 m!579831))

(assert (=> b!603292 m!579783))

(assert (=> b!603286 m!579795))

(declare-fun m!579833 () Bool)

(assert (=> b!603286 m!579833))

(declare-fun m!579835 () Bool)

(assert (=> b!603289 m!579835))

(assert (=> b!603290 m!579783))

(assert (=> b!603290 m!579795))

(declare-fun m!579837 () Bool)

(assert (=> b!603290 m!579837))

(declare-fun m!579839 () Bool)

(assert (=> b!603293 m!579839))

(check-sat (not b!603287) (not b!603284) (not b!603293) (not b!603295) (not b!603282) (not b!603278) (not b!603297) (not b!603298) (not b!603296) (not b!603288) (not start!55110) (not b!603291) (not b!603280) (not b!603276))
(check-sat)

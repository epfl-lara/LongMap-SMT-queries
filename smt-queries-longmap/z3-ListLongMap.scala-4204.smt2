; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57442 () Bool)

(assert start!57442)

(declare-fun b!635893 () Bool)

(declare-fun e!363726 () Bool)

(declare-fun e!363733 () Bool)

(assert (=> b!635893 (= e!363726 e!363733)))

(declare-fun res!411457 () Bool)

(assert (=> b!635893 (=> (not res!411457) (not e!363733))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38232 0))(
  ( (array!38233 (arr!18343 (Array (_ BitVec 32) (_ BitVec 64))) (size!18707 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38232)

(assert (=> b!635893 (= res!411457 (= (select (store (arr!18343 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!294065 () array!38232)

(assert (=> b!635893 (= lt!294065 (array!38233 (store (arr!18343 a!2986) i!1108 k0!1786) (size!18707 a!2986)))))

(declare-fun b!635894 () Bool)

(declare-fun e!363728 () Bool)

(declare-fun e!363729 () Bool)

(assert (=> b!635894 (= e!363728 (not e!363729))))

(declare-fun res!411453 () Bool)

(assert (=> b!635894 (=> res!411453 e!363729)))

(declare-datatypes ((SeekEntryResult!6783 0))(
  ( (MissingZero!6783 (index!29437 (_ BitVec 32))) (Found!6783 (index!29438 (_ BitVec 32))) (Intermediate!6783 (undefined!7595 Bool) (index!29439 (_ BitVec 32)) (x!58182 (_ BitVec 32))) (Undefined!6783) (MissingVacant!6783 (index!29440 (_ BitVec 32))) )
))
(declare-fun lt!294057 () SeekEntryResult!6783)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!635894 (= res!411453 (not (= lt!294057 (Found!6783 index!984))))))

(declare-datatypes ((Unit!21466 0))(
  ( (Unit!21467) )
))
(declare-fun lt!294064 () Unit!21466)

(declare-fun e!363737 () Unit!21466)

(assert (=> b!635894 (= lt!294064 e!363737)))

(declare-fun c!72590 () Bool)

(assert (=> b!635894 (= c!72590 (= lt!294057 Undefined!6783))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!294059 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38232 (_ BitVec 32)) SeekEntryResult!6783)

(assert (=> b!635894 (= lt!294057 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!294059 lt!294065 mask!3053))))

(declare-fun e!363734 () Bool)

(assert (=> b!635894 e!363734))

(declare-fun res!411449 () Bool)

(assert (=> b!635894 (=> (not res!411449) (not e!363734))))

(declare-fun lt!294060 () SeekEntryResult!6783)

(declare-fun lt!294063 () (_ BitVec 32))

(assert (=> b!635894 (= res!411449 (= lt!294060 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294063 vacantSpotIndex!68 lt!294059 lt!294065 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!635894 (= lt!294060 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294063 vacantSpotIndex!68 (select (arr!18343 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!635894 (= lt!294059 (select (store (arr!18343 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!294061 () Unit!21466)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38232 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21466)

(assert (=> b!635894 (= lt!294061 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294063 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!635894 (= lt!294063 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!635895 () Bool)

(declare-fun res!411460 () Bool)

(assert (=> b!635895 (=> (not res!411460) (not e!363726))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38232 (_ BitVec 32)) Bool)

(assert (=> b!635895 (= res!411460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!635896 () Bool)

(declare-fun e!363735 () Bool)

(declare-datatypes ((List!12384 0))(
  ( (Nil!12381) (Cons!12380 (h!13425 (_ BitVec 64)) (t!18612 List!12384)) )
))
(declare-fun noDuplicate!376 (List!12384) Bool)

(assert (=> b!635896 (= e!363735 (noDuplicate!376 Nil!12381))))

(declare-fun b!635897 () Bool)

(declare-fun res!411447 () Bool)

(declare-fun e!363732 () Bool)

(assert (=> b!635897 (=> (not res!411447) (not e!363732))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!635897 (= res!411447 (validKeyInArray!0 (select (arr!18343 a!2986) j!136)))))

(declare-fun b!635898 () Bool)

(declare-fun res!411451 () Bool)

(assert (=> b!635898 (=> (not res!411451) (not e!363726))))

(declare-fun arrayNoDuplicates!0 (array!38232 (_ BitVec 32) List!12384) Bool)

(assert (=> b!635898 (= res!411451 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12381))))

(declare-fun b!635899 () Bool)

(declare-fun e!363727 () Bool)

(assert (=> b!635899 (= e!363727 e!363735)))

(declare-fun res!411464 () Bool)

(assert (=> b!635899 (=> res!411464 e!363735)))

(assert (=> b!635899 (= res!411464 (or (bvsge (size!18707 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18707 a!2986))))))

(declare-fun arrayContainsKey!0 (array!38232 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!635899 (arrayContainsKey!0 lt!294065 (select (arr!18343 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!294058 () Unit!21466)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38232 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21466)

(assert (=> b!635899 (= lt!294058 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!294065 (select (arr!18343 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!635900 () Bool)

(declare-fun e!363730 () Bool)

(assert (=> b!635900 (= e!363730 (arrayContainsKey!0 lt!294065 (select (arr!18343 a!2986) j!136) index!984))))

(declare-fun b!635901 () Bool)

(declare-fun res!411459 () Bool)

(assert (=> b!635901 (=> (not res!411459) (not e!363726))))

(assert (=> b!635901 (= res!411459 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18343 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!635902 () Bool)

(declare-fun res!411455 () Bool)

(assert (=> b!635902 (=> (not res!411455) (not e!363732))))

(assert (=> b!635902 (= res!411455 (validKeyInArray!0 k0!1786))))

(declare-fun b!635903 () Bool)

(declare-fun e!363736 () Bool)

(declare-fun e!363731 () Bool)

(assert (=> b!635903 (= e!363736 e!363731)))

(declare-fun res!411448 () Bool)

(assert (=> b!635903 (=> res!411448 e!363731)))

(declare-fun lt!294067 () (_ BitVec 64))

(assert (=> b!635903 (= res!411448 (or (not (= (select (arr!18343 a!2986) j!136) lt!294059)) (not (= (select (arr!18343 a!2986) j!136) lt!294067)) (bvsge j!136 index!984)))))

(declare-fun b!635904 () Bool)

(assert (=> b!635904 (= e!363731 e!363730)))

(declare-fun res!411456 () Bool)

(assert (=> b!635904 (=> (not res!411456) (not e!363730))))

(assert (=> b!635904 (= res!411456 (arrayContainsKey!0 lt!294065 (select (arr!18343 a!2986) j!136) j!136))))

(declare-fun b!635905 () Bool)

(declare-fun res!411452 () Bool)

(assert (=> b!635905 (=> (not res!411452) (not e!363732))))

(assert (=> b!635905 (= res!411452 (and (= (size!18707 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18707 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18707 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!635906 () Bool)

(declare-fun Unit!21468 () Unit!21466)

(assert (=> b!635906 (= e!363737 Unit!21468)))

(declare-fun b!635907 () Bool)

(assert (=> b!635907 (= e!363732 e!363726)))

(declare-fun res!411454 () Bool)

(assert (=> b!635907 (=> (not res!411454) (not e!363726))))

(declare-fun lt!294066 () SeekEntryResult!6783)

(assert (=> b!635907 (= res!411454 (or (= lt!294066 (MissingZero!6783 i!1108)) (= lt!294066 (MissingVacant!6783 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38232 (_ BitVec 32)) SeekEntryResult!6783)

(assert (=> b!635907 (= lt!294066 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!635908 () Bool)

(assert (=> b!635908 (= e!363733 e!363728)))

(declare-fun res!411462 () Bool)

(assert (=> b!635908 (=> (not res!411462) (not e!363728))))

(declare-fun lt!294062 () SeekEntryResult!6783)

(assert (=> b!635908 (= res!411462 (and (= lt!294062 (Found!6783 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18343 a!2986) index!984) (select (arr!18343 a!2986) j!136))) (not (= (select (arr!18343 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!635908 (= lt!294062 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18343 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!635909 () Bool)

(declare-fun Unit!21469 () Unit!21466)

(assert (=> b!635909 (= e!363737 Unit!21469)))

(assert (=> b!635909 false))

(declare-fun b!635910 () Bool)

(assert (=> b!635910 (= e!363734 (= lt!294062 lt!294060))))

(declare-fun res!411463 () Bool)

(assert (=> start!57442 (=> (not res!411463) (not e!363732))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57442 (= res!411463 (validMask!0 mask!3053))))

(assert (=> start!57442 e!363732))

(assert (=> start!57442 true))

(declare-fun array_inv!14139 (array!38232) Bool)

(assert (=> start!57442 (array_inv!14139 a!2986)))

(declare-fun b!635911 () Bool)

(declare-fun res!411450 () Bool)

(assert (=> b!635911 (=> (not res!411450) (not e!363732))))

(assert (=> b!635911 (= res!411450 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!635912 () Bool)

(assert (=> b!635912 (= e!363729 e!363727)))

(declare-fun res!411458 () Bool)

(assert (=> b!635912 (=> res!411458 e!363727)))

(assert (=> b!635912 (= res!411458 (or (not (= (select (arr!18343 a!2986) j!136) lt!294059)) (not (= (select (arr!18343 a!2986) j!136) lt!294067)) (bvsge j!136 index!984)))))

(assert (=> b!635912 e!363736))

(declare-fun res!411461 () Bool)

(assert (=> b!635912 (=> (not res!411461) (not e!363736))))

(assert (=> b!635912 (= res!411461 (= lt!294067 (select (arr!18343 a!2986) j!136)))))

(assert (=> b!635912 (= lt!294067 (select (store (arr!18343 a!2986) i!1108 k0!1786) index!984))))

(assert (= (and start!57442 res!411463) b!635905))

(assert (= (and b!635905 res!411452) b!635897))

(assert (= (and b!635897 res!411447) b!635902))

(assert (= (and b!635902 res!411455) b!635911))

(assert (= (and b!635911 res!411450) b!635907))

(assert (= (and b!635907 res!411454) b!635895))

(assert (= (and b!635895 res!411460) b!635898))

(assert (= (and b!635898 res!411451) b!635901))

(assert (= (and b!635901 res!411459) b!635893))

(assert (= (and b!635893 res!411457) b!635908))

(assert (= (and b!635908 res!411462) b!635894))

(assert (= (and b!635894 res!411449) b!635910))

(assert (= (and b!635894 c!72590) b!635909))

(assert (= (and b!635894 (not c!72590)) b!635906))

(assert (= (and b!635894 (not res!411453)) b!635912))

(assert (= (and b!635912 res!411461) b!635903))

(assert (= (and b!635903 (not res!411448)) b!635904))

(assert (= (and b!635904 res!411456) b!635900))

(assert (= (and b!635912 (not res!411458)) b!635899))

(assert (= (and b!635899 (not res!411464)) b!635896))

(declare-fun m!610191 () Bool)

(assert (=> b!635899 m!610191))

(assert (=> b!635899 m!610191))

(declare-fun m!610193 () Bool)

(assert (=> b!635899 m!610193))

(assert (=> b!635899 m!610191))

(declare-fun m!610195 () Bool)

(assert (=> b!635899 m!610195))

(declare-fun m!610197 () Bool)

(assert (=> b!635895 m!610197))

(assert (=> b!635897 m!610191))

(assert (=> b!635897 m!610191))

(declare-fun m!610199 () Bool)

(assert (=> b!635897 m!610199))

(assert (=> b!635912 m!610191))

(declare-fun m!610201 () Bool)

(assert (=> b!635912 m!610201))

(declare-fun m!610203 () Bool)

(assert (=> b!635912 m!610203))

(declare-fun m!610205 () Bool)

(assert (=> b!635896 m!610205))

(assert (=> b!635904 m!610191))

(assert (=> b!635904 m!610191))

(declare-fun m!610207 () Bool)

(assert (=> b!635904 m!610207))

(declare-fun m!610209 () Bool)

(assert (=> b!635901 m!610209))

(declare-fun m!610211 () Bool)

(assert (=> start!57442 m!610211))

(declare-fun m!610213 () Bool)

(assert (=> start!57442 m!610213))

(declare-fun m!610215 () Bool)

(assert (=> b!635907 m!610215))

(declare-fun m!610217 () Bool)

(assert (=> b!635894 m!610217))

(declare-fun m!610219 () Bool)

(assert (=> b!635894 m!610219))

(assert (=> b!635894 m!610191))

(assert (=> b!635894 m!610191))

(declare-fun m!610221 () Bool)

(assert (=> b!635894 m!610221))

(assert (=> b!635894 m!610201))

(declare-fun m!610223 () Bool)

(assert (=> b!635894 m!610223))

(declare-fun m!610225 () Bool)

(assert (=> b!635894 m!610225))

(declare-fun m!610227 () Bool)

(assert (=> b!635894 m!610227))

(declare-fun m!610229 () Bool)

(assert (=> b!635898 m!610229))

(assert (=> b!635900 m!610191))

(assert (=> b!635900 m!610191))

(declare-fun m!610231 () Bool)

(assert (=> b!635900 m!610231))

(assert (=> b!635903 m!610191))

(declare-fun m!610233 () Bool)

(assert (=> b!635911 m!610233))

(declare-fun m!610235 () Bool)

(assert (=> b!635908 m!610235))

(assert (=> b!635908 m!610191))

(assert (=> b!635908 m!610191))

(declare-fun m!610237 () Bool)

(assert (=> b!635908 m!610237))

(assert (=> b!635893 m!610201))

(declare-fun m!610239 () Bool)

(assert (=> b!635893 m!610239))

(declare-fun m!610241 () Bool)

(assert (=> b!635902 m!610241))

(check-sat (not b!635908) (not b!635895) (not b!635898) (not b!635907) (not b!635902) (not start!57442) (not b!635897) (not b!635899) (not b!635904) (not b!635911) (not b!635896) (not b!635894) (not b!635900))
(check-sat)
(get-model)

(declare-fun d!89823 () Bool)

(assert (=> d!89823 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!57442 d!89823))

(declare-fun d!89825 () Bool)

(assert (=> d!89825 (= (array_inv!14139 a!2986) (bvsge (size!18707 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!57442 d!89825))

(declare-fun e!363786 () SeekEntryResult!6783)

(declare-fun b!635985 () Bool)

(assert (=> b!635985 (= e!363786 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!294063 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18343 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!635986 () Bool)

(assert (=> b!635986 (= e!363786 (MissingVacant!6783 vacantSpotIndex!68))))

(declare-fun b!635987 () Bool)

(declare-fun e!363785 () SeekEntryResult!6783)

(assert (=> b!635987 (= e!363785 Undefined!6783)))

(declare-fun b!635988 () Bool)

(declare-fun e!363784 () SeekEntryResult!6783)

(assert (=> b!635988 (= e!363785 e!363784)))

(declare-fun lt!294106 () (_ BitVec 64))

(declare-fun c!72601 () Bool)

(assert (=> b!635988 (= c!72601 (= lt!294106 (select (arr!18343 a!2986) j!136)))))

(declare-fun d!89827 () Bool)

(declare-fun lt!294105 () SeekEntryResult!6783)

(get-info :version)

(assert (=> d!89827 (and (or ((_ is Undefined!6783) lt!294105) (not ((_ is Found!6783) lt!294105)) (and (bvsge (index!29438 lt!294105) #b00000000000000000000000000000000) (bvslt (index!29438 lt!294105) (size!18707 a!2986)))) (or ((_ is Undefined!6783) lt!294105) ((_ is Found!6783) lt!294105) (not ((_ is MissingVacant!6783) lt!294105)) (not (= (index!29440 lt!294105) vacantSpotIndex!68)) (and (bvsge (index!29440 lt!294105) #b00000000000000000000000000000000) (bvslt (index!29440 lt!294105) (size!18707 a!2986)))) (or ((_ is Undefined!6783) lt!294105) (ite ((_ is Found!6783) lt!294105) (= (select (arr!18343 a!2986) (index!29438 lt!294105)) (select (arr!18343 a!2986) j!136)) (and ((_ is MissingVacant!6783) lt!294105) (= (index!29440 lt!294105) vacantSpotIndex!68) (= (select (arr!18343 a!2986) (index!29440 lt!294105)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89827 (= lt!294105 e!363785)))

(declare-fun c!72600 () Bool)

(assert (=> d!89827 (= c!72600 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89827 (= lt!294106 (select (arr!18343 a!2986) lt!294063))))

(assert (=> d!89827 (validMask!0 mask!3053)))

(assert (=> d!89827 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294063 vacantSpotIndex!68 (select (arr!18343 a!2986) j!136) a!2986 mask!3053) lt!294105)))

(declare-fun b!635989 () Bool)

(declare-fun c!72602 () Bool)

(assert (=> b!635989 (= c!72602 (= lt!294106 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!635989 (= e!363784 e!363786)))

(declare-fun b!635990 () Bool)

(assert (=> b!635990 (= e!363784 (Found!6783 lt!294063))))

(assert (= (and d!89827 c!72600) b!635987))

(assert (= (and d!89827 (not c!72600)) b!635988))

(assert (= (and b!635988 c!72601) b!635990))

(assert (= (and b!635988 (not c!72601)) b!635989))

(assert (= (and b!635989 c!72602) b!635986))

(assert (= (and b!635989 (not c!72602)) b!635985))

(declare-fun m!610295 () Bool)

(assert (=> b!635985 m!610295))

(assert (=> b!635985 m!610295))

(assert (=> b!635985 m!610191))

(declare-fun m!610297 () Bool)

(assert (=> b!635985 m!610297))

(declare-fun m!610299 () Bool)

(assert (=> d!89827 m!610299))

(declare-fun m!610301 () Bool)

(assert (=> d!89827 m!610301))

(declare-fun m!610303 () Bool)

(assert (=> d!89827 m!610303))

(assert (=> d!89827 m!610211))

(assert (=> b!635894 d!89827))

(declare-fun e!363789 () SeekEntryResult!6783)

(declare-fun b!635991 () Bool)

(assert (=> b!635991 (= e!363789 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!294063 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!294059 lt!294065 mask!3053))))

(declare-fun b!635992 () Bool)

(assert (=> b!635992 (= e!363789 (MissingVacant!6783 vacantSpotIndex!68))))

(declare-fun b!635993 () Bool)

(declare-fun e!363788 () SeekEntryResult!6783)

(assert (=> b!635993 (= e!363788 Undefined!6783)))

(declare-fun b!635994 () Bool)

(declare-fun e!363787 () SeekEntryResult!6783)

(assert (=> b!635994 (= e!363788 e!363787)))

(declare-fun c!72604 () Bool)

(declare-fun lt!294108 () (_ BitVec 64))

(assert (=> b!635994 (= c!72604 (= lt!294108 lt!294059))))

(declare-fun lt!294107 () SeekEntryResult!6783)

(declare-fun d!89829 () Bool)

(assert (=> d!89829 (and (or ((_ is Undefined!6783) lt!294107) (not ((_ is Found!6783) lt!294107)) (and (bvsge (index!29438 lt!294107) #b00000000000000000000000000000000) (bvslt (index!29438 lt!294107) (size!18707 lt!294065)))) (or ((_ is Undefined!6783) lt!294107) ((_ is Found!6783) lt!294107) (not ((_ is MissingVacant!6783) lt!294107)) (not (= (index!29440 lt!294107) vacantSpotIndex!68)) (and (bvsge (index!29440 lt!294107) #b00000000000000000000000000000000) (bvslt (index!29440 lt!294107) (size!18707 lt!294065)))) (or ((_ is Undefined!6783) lt!294107) (ite ((_ is Found!6783) lt!294107) (= (select (arr!18343 lt!294065) (index!29438 lt!294107)) lt!294059) (and ((_ is MissingVacant!6783) lt!294107) (= (index!29440 lt!294107) vacantSpotIndex!68) (= (select (arr!18343 lt!294065) (index!29440 lt!294107)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89829 (= lt!294107 e!363788)))

(declare-fun c!72603 () Bool)

(assert (=> d!89829 (= c!72603 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89829 (= lt!294108 (select (arr!18343 lt!294065) lt!294063))))

(assert (=> d!89829 (validMask!0 mask!3053)))

(assert (=> d!89829 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294063 vacantSpotIndex!68 lt!294059 lt!294065 mask!3053) lt!294107)))

(declare-fun b!635995 () Bool)

(declare-fun c!72605 () Bool)

(assert (=> b!635995 (= c!72605 (= lt!294108 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!635995 (= e!363787 e!363789)))

(declare-fun b!635996 () Bool)

(assert (=> b!635996 (= e!363787 (Found!6783 lt!294063))))

(assert (= (and d!89829 c!72603) b!635993))

(assert (= (and d!89829 (not c!72603)) b!635994))

(assert (= (and b!635994 c!72604) b!635996))

(assert (= (and b!635994 (not c!72604)) b!635995))

(assert (= (and b!635995 c!72605) b!635992))

(assert (= (and b!635995 (not c!72605)) b!635991))

(assert (=> b!635991 m!610295))

(assert (=> b!635991 m!610295))

(declare-fun m!610305 () Bool)

(assert (=> b!635991 m!610305))

(declare-fun m!610307 () Bool)

(assert (=> d!89829 m!610307))

(declare-fun m!610309 () Bool)

(assert (=> d!89829 m!610309))

(declare-fun m!610311 () Bool)

(assert (=> d!89829 m!610311))

(assert (=> d!89829 m!610211))

(assert (=> b!635894 d!89829))

(declare-fun d!89831 () Bool)

(declare-fun lt!294111 () (_ BitVec 32))

(assert (=> d!89831 (and (bvsge lt!294111 #b00000000000000000000000000000000) (bvslt lt!294111 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89831 (= lt!294111 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!89831 (validMask!0 mask!3053)))

(assert (=> d!89831 (= (nextIndex!0 index!984 x!910 mask!3053) lt!294111)))

(declare-fun bs!19105 () Bool)

(assert (= bs!19105 d!89831))

(declare-fun m!610313 () Bool)

(assert (=> bs!19105 m!610313))

(assert (=> bs!19105 m!610211))

(assert (=> b!635894 d!89831))

(declare-fun d!89833 () Bool)

(declare-fun e!363792 () Bool)

(assert (=> d!89833 e!363792))

(declare-fun res!411521 () Bool)

(assert (=> d!89833 (=> (not res!411521) (not e!363792))))

(assert (=> d!89833 (= res!411521 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18707 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18707 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18707 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18707 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18707 a!2986))))))

(declare-fun lt!294114 () Unit!21466)

(declare-fun choose!9 (array!38232 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21466)

(assert (=> d!89833 (= lt!294114 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294063 vacantSpotIndex!68 mask!3053))))

(assert (=> d!89833 (validMask!0 mask!3053)))

(assert (=> d!89833 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294063 vacantSpotIndex!68 mask!3053) lt!294114)))

(declare-fun b!635999 () Bool)

(assert (=> b!635999 (= e!363792 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294063 vacantSpotIndex!68 (select (arr!18343 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294063 vacantSpotIndex!68 (select (store (arr!18343 a!2986) i!1108 k0!1786) j!136) (array!38233 (store (arr!18343 a!2986) i!1108 k0!1786) (size!18707 a!2986)) mask!3053)))))

(assert (= (and d!89833 res!411521) b!635999))

(declare-fun m!610315 () Bool)

(assert (=> d!89833 m!610315))

(assert (=> d!89833 m!610211))

(assert (=> b!635999 m!610219))

(assert (=> b!635999 m!610201))

(assert (=> b!635999 m!610191))

(assert (=> b!635999 m!610191))

(assert (=> b!635999 m!610221))

(assert (=> b!635999 m!610219))

(declare-fun m!610317 () Bool)

(assert (=> b!635999 m!610317))

(assert (=> b!635894 d!89833))

(declare-fun b!636000 () Bool)

(declare-fun e!363795 () SeekEntryResult!6783)

(assert (=> b!636000 (= e!363795 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!294059 lt!294065 mask!3053))))

(declare-fun b!636001 () Bool)

(assert (=> b!636001 (= e!363795 (MissingVacant!6783 vacantSpotIndex!68))))

(declare-fun b!636002 () Bool)

(declare-fun e!363794 () SeekEntryResult!6783)

(assert (=> b!636002 (= e!363794 Undefined!6783)))

(declare-fun b!636003 () Bool)

(declare-fun e!363793 () SeekEntryResult!6783)

(assert (=> b!636003 (= e!363794 e!363793)))

(declare-fun c!72607 () Bool)

(declare-fun lt!294116 () (_ BitVec 64))

(assert (=> b!636003 (= c!72607 (= lt!294116 lt!294059))))

(declare-fun d!89835 () Bool)

(declare-fun lt!294115 () SeekEntryResult!6783)

(assert (=> d!89835 (and (or ((_ is Undefined!6783) lt!294115) (not ((_ is Found!6783) lt!294115)) (and (bvsge (index!29438 lt!294115) #b00000000000000000000000000000000) (bvslt (index!29438 lt!294115) (size!18707 lt!294065)))) (or ((_ is Undefined!6783) lt!294115) ((_ is Found!6783) lt!294115) (not ((_ is MissingVacant!6783) lt!294115)) (not (= (index!29440 lt!294115) vacantSpotIndex!68)) (and (bvsge (index!29440 lt!294115) #b00000000000000000000000000000000) (bvslt (index!29440 lt!294115) (size!18707 lt!294065)))) (or ((_ is Undefined!6783) lt!294115) (ite ((_ is Found!6783) lt!294115) (= (select (arr!18343 lt!294065) (index!29438 lt!294115)) lt!294059) (and ((_ is MissingVacant!6783) lt!294115) (= (index!29440 lt!294115) vacantSpotIndex!68) (= (select (arr!18343 lt!294065) (index!29440 lt!294115)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89835 (= lt!294115 e!363794)))

(declare-fun c!72606 () Bool)

(assert (=> d!89835 (= c!72606 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89835 (= lt!294116 (select (arr!18343 lt!294065) index!984))))

(assert (=> d!89835 (validMask!0 mask!3053)))

(assert (=> d!89835 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!294059 lt!294065 mask!3053) lt!294115)))

(declare-fun b!636004 () Bool)

(declare-fun c!72608 () Bool)

(assert (=> b!636004 (= c!72608 (= lt!294116 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!636004 (= e!363793 e!363795)))

(declare-fun b!636005 () Bool)

(assert (=> b!636005 (= e!363793 (Found!6783 index!984))))

(assert (= (and d!89835 c!72606) b!636002))

(assert (= (and d!89835 (not c!72606)) b!636003))

(assert (= (and b!636003 c!72607) b!636005))

(assert (= (and b!636003 (not c!72607)) b!636004))

(assert (= (and b!636004 c!72608) b!636001))

(assert (= (and b!636004 (not c!72608)) b!636000))

(assert (=> b!636000 m!610217))

(assert (=> b!636000 m!610217))

(declare-fun m!610319 () Bool)

(assert (=> b!636000 m!610319))

(declare-fun m!610321 () Bool)

(assert (=> d!89835 m!610321))

(declare-fun m!610323 () Bool)

(assert (=> d!89835 m!610323))

(declare-fun m!610325 () Bool)

(assert (=> d!89835 m!610325))

(assert (=> d!89835 m!610211))

(assert (=> b!635894 d!89835))

(declare-fun d!89837 () Bool)

(declare-fun res!411526 () Bool)

(declare-fun e!363800 () Bool)

(assert (=> d!89837 (=> res!411526 e!363800)))

(assert (=> d!89837 (= res!411526 (= (select (arr!18343 lt!294065) j!136) (select (arr!18343 a!2986) j!136)))))

(assert (=> d!89837 (= (arrayContainsKey!0 lt!294065 (select (arr!18343 a!2986) j!136) j!136) e!363800)))

(declare-fun b!636010 () Bool)

(declare-fun e!363801 () Bool)

(assert (=> b!636010 (= e!363800 e!363801)))

(declare-fun res!411527 () Bool)

(assert (=> b!636010 (=> (not res!411527) (not e!363801))))

(assert (=> b!636010 (= res!411527 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18707 lt!294065)))))

(declare-fun b!636011 () Bool)

(assert (=> b!636011 (= e!363801 (arrayContainsKey!0 lt!294065 (select (arr!18343 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!89837 (not res!411526)) b!636010))

(assert (= (and b!636010 res!411527) b!636011))

(declare-fun m!610327 () Bool)

(assert (=> d!89837 m!610327))

(assert (=> b!636011 m!610191))

(declare-fun m!610329 () Bool)

(assert (=> b!636011 m!610329))

(assert (=> b!635904 d!89837))

(declare-fun d!89839 () Bool)

(assert (=> d!89839 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!635902 d!89839))

(declare-fun d!89841 () Bool)

(declare-fun res!411528 () Bool)

(declare-fun e!363802 () Bool)

(assert (=> d!89841 (=> res!411528 e!363802)))

(assert (=> d!89841 (= res!411528 (= (select (arr!18343 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!89841 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!363802)))

(declare-fun b!636012 () Bool)

(declare-fun e!363803 () Bool)

(assert (=> b!636012 (= e!363802 e!363803)))

(declare-fun res!411529 () Bool)

(assert (=> b!636012 (=> (not res!411529) (not e!363803))))

(assert (=> b!636012 (= res!411529 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18707 a!2986)))))

(declare-fun b!636013 () Bool)

(assert (=> b!636013 (= e!363803 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!89841 (not res!411528)) b!636012))

(assert (= (and b!636012 res!411529) b!636013))

(declare-fun m!610331 () Bool)

(assert (=> d!89841 m!610331))

(declare-fun m!610333 () Bool)

(assert (=> b!636013 m!610333))

(assert (=> b!635911 d!89841))

(declare-fun d!89845 () Bool)

(declare-fun res!411530 () Bool)

(declare-fun e!363804 () Bool)

(assert (=> d!89845 (=> res!411530 e!363804)))

(assert (=> d!89845 (= res!411530 (= (select (arr!18343 lt!294065) index!984) (select (arr!18343 a!2986) j!136)))))

(assert (=> d!89845 (= (arrayContainsKey!0 lt!294065 (select (arr!18343 a!2986) j!136) index!984) e!363804)))

(declare-fun b!636014 () Bool)

(declare-fun e!363805 () Bool)

(assert (=> b!636014 (= e!363804 e!363805)))

(declare-fun res!411531 () Bool)

(assert (=> b!636014 (=> (not res!411531) (not e!363805))))

(assert (=> b!636014 (= res!411531 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18707 lt!294065)))))

(declare-fun b!636015 () Bool)

(assert (=> b!636015 (= e!363805 (arrayContainsKey!0 lt!294065 (select (arr!18343 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!89845 (not res!411530)) b!636014))

(assert (= (and b!636014 res!411531) b!636015))

(assert (=> d!89845 m!610325))

(assert (=> b!636015 m!610191))

(declare-fun m!610335 () Bool)

(assert (=> b!636015 m!610335))

(assert (=> b!635900 d!89845))

(declare-fun d!89849 () Bool)

(declare-fun res!411532 () Bool)

(declare-fun e!363806 () Bool)

(assert (=> d!89849 (=> res!411532 e!363806)))

(assert (=> d!89849 (= res!411532 (= (select (arr!18343 lt!294065) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18343 a!2986) j!136)))))

(assert (=> d!89849 (= (arrayContainsKey!0 lt!294065 (select (arr!18343 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!363806)))

(declare-fun b!636016 () Bool)

(declare-fun e!363807 () Bool)

(assert (=> b!636016 (= e!363806 e!363807)))

(declare-fun res!411533 () Bool)

(assert (=> b!636016 (=> (not res!411533) (not e!363807))))

(assert (=> b!636016 (= res!411533 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18707 lt!294065)))))

(declare-fun b!636017 () Bool)

(assert (=> b!636017 (= e!363807 (arrayContainsKey!0 lt!294065 (select (arr!18343 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!89849 (not res!411532)) b!636016))

(assert (= (and b!636016 res!411533) b!636017))

(declare-fun m!610337 () Bool)

(assert (=> d!89849 m!610337))

(assert (=> b!636017 m!610191))

(declare-fun m!610339 () Bool)

(assert (=> b!636017 m!610339))

(assert (=> b!635899 d!89849))

(declare-fun d!89853 () Bool)

(assert (=> d!89853 (arrayContainsKey!0 lt!294065 (select (arr!18343 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!294119 () Unit!21466)

(declare-fun choose!114 (array!38232 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21466)

(assert (=> d!89853 (= lt!294119 (choose!114 lt!294065 (select (arr!18343 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!89853 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!89853 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!294065 (select (arr!18343 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!294119)))

(declare-fun bs!19106 () Bool)

(assert (= bs!19106 d!89853))

(assert (=> bs!19106 m!610191))

(assert (=> bs!19106 m!610193))

(assert (=> bs!19106 m!610191))

(declare-fun m!610341 () Bool)

(assert (=> bs!19106 m!610341))

(assert (=> b!635899 d!89853))

(declare-fun b!636036 () Bool)

(declare-fun e!363823 () Bool)

(declare-fun e!363822 () Bool)

(assert (=> b!636036 (= e!363823 e!363822)))

(declare-fun res!411546 () Bool)

(assert (=> b!636036 (=> (not res!411546) (not e!363822))))

(declare-fun e!363824 () Bool)

(assert (=> b!636036 (= res!411546 (not e!363824))))

(declare-fun res!411544 () Bool)

(assert (=> b!636036 (=> (not res!411544) (not e!363824))))

(assert (=> b!636036 (= res!411544 (validKeyInArray!0 (select (arr!18343 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!636037 () Bool)

(declare-fun e!363825 () Bool)

(declare-fun call!33418 () Bool)

(assert (=> b!636037 (= e!363825 call!33418)))

(declare-fun d!89855 () Bool)

(declare-fun res!411545 () Bool)

(assert (=> d!89855 (=> res!411545 e!363823)))

(assert (=> d!89855 (= res!411545 (bvsge #b00000000000000000000000000000000 (size!18707 a!2986)))))

(assert (=> d!89855 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12381) e!363823)))

(declare-fun b!636038 () Bool)

(assert (=> b!636038 (= e!363822 e!363825)))

(declare-fun c!72613 () Bool)

(assert (=> b!636038 (= c!72613 (validKeyInArray!0 (select (arr!18343 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33415 () Bool)

(assert (=> bm!33415 (= call!33418 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!72613 (Cons!12380 (select (arr!18343 a!2986) #b00000000000000000000000000000000) Nil!12381) Nil!12381)))))

(declare-fun b!636039 () Bool)

(declare-fun contains!3097 (List!12384 (_ BitVec 64)) Bool)

(assert (=> b!636039 (= e!363824 (contains!3097 Nil!12381 (select (arr!18343 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!636040 () Bool)

(assert (=> b!636040 (= e!363825 call!33418)))

(assert (= (and d!89855 (not res!411545)) b!636036))

(assert (= (and b!636036 res!411544) b!636039))

(assert (= (and b!636036 res!411546) b!636038))

(assert (= (and b!636038 c!72613) b!636040))

(assert (= (and b!636038 (not c!72613)) b!636037))

(assert (= (or b!636040 b!636037) bm!33415))

(assert (=> b!636036 m!610331))

(assert (=> b!636036 m!610331))

(declare-fun m!610343 () Bool)

(assert (=> b!636036 m!610343))

(assert (=> b!636038 m!610331))

(assert (=> b!636038 m!610331))

(assert (=> b!636038 m!610343))

(assert (=> bm!33415 m!610331))

(declare-fun m!610345 () Bool)

(assert (=> bm!33415 m!610345))

(assert (=> b!636039 m!610331))

(assert (=> b!636039 m!610331))

(declare-fun m!610347 () Bool)

(assert (=> b!636039 m!610347))

(assert (=> b!635898 d!89855))

(declare-fun d!89857 () Bool)

(assert (=> d!89857 (= (validKeyInArray!0 (select (arr!18343 a!2986) j!136)) (and (not (= (select (arr!18343 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18343 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!635897 d!89857))

(declare-fun e!363831 () SeekEntryResult!6783)

(declare-fun b!636045 () Bool)

(assert (=> b!636045 (= e!363831 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18343 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!636046 () Bool)

(assert (=> b!636046 (= e!363831 (MissingVacant!6783 vacantSpotIndex!68))))

(declare-fun b!636047 () Bool)

(declare-fun e!363830 () SeekEntryResult!6783)

(assert (=> b!636047 (= e!363830 Undefined!6783)))

(declare-fun b!636048 () Bool)

(declare-fun e!363829 () SeekEntryResult!6783)

(assert (=> b!636048 (= e!363830 e!363829)))

(declare-fun lt!294130 () (_ BitVec 64))

(declare-fun c!72616 () Bool)

(assert (=> b!636048 (= c!72616 (= lt!294130 (select (arr!18343 a!2986) j!136)))))

(declare-fun lt!294129 () SeekEntryResult!6783)

(declare-fun d!89859 () Bool)

(assert (=> d!89859 (and (or ((_ is Undefined!6783) lt!294129) (not ((_ is Found!6783) lt!294129)) (and (bvsge (index!29438 lt!294129) #b00000000000000000000000000000000) (bvslt (index!29438 lt!294129) (size!18707 a!2986)))) (or ((_ is Undefined!6783) lt!294129) ((_ is Found!6783) lt!294129) (not ((_ is MissingVacant!6783) lt!294129)) (not (= (index!29440 lt!294129) vacantSpotIndex!68)) (and (bvsge (index!29440 lt!294129) #b00000000000000000000000000000000) (bvslt (index!29440 lt!294129) (size!18707 a!2986)))) (or ((_ is Undefined!6783) lt!294129) (ite ((_ is Found!6783) lt!294129) (= (select (arr!18343 a!2986) (index!29438 lt!294129)) (select (arr!18343 a!2986) j!136)) (and ((_ is MissingVacant!6783) lt!294129) (= (index!29440 lt!294129) vacantSpotIndex!68) (= (select (arr!18343 a!2986) (index!29440 lt!294129)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89859 (= lt!294129 e!363830)))

(declare-fun c!72615 () Bool)

(assert (=> d!89859 (= c!72615 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89859 (= lt!294130 (select (arr!18343 a!2986) index!984))))

(assert (=> d!89859 (validMask!0 mask!3053)))

(assert (=> d!89859 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18343 a!2986) j!136) a!2986 mask!3053) lt!294129)))

(declare-fun b!636049 () Bool)

(declare-fun c!72617 () Bool)

(assert (=> b!636049 (= c!72617 (= lt!294130 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!636049 (= e!363829 e!363831)))

(declare-fun b!636050 () Bool)

(assert (=> b!636050 (= e!363829 (Found!6783 index!984))))

(assert (= (and d!89859 c!72615) b!636047))

(assert (= (and d!89859 (not c!72615)) b!636048))

(assert (= (and b!636048 c!72616) b!636050))

(assert (= (and b!636048 (not c!72616)) b!636049))

(assert (= (and b!636049 c!72617) b!636046))

(assert (= (and b!636049 (not c!72617)) b!636045))

(assert (=> b!636045 m!610217))

(assert (=> b!636045 m!610217))

(assert (=> b!636045 m!610191))

(declare-fun m!610361 () Bool)

(assert (=> b!636045 m!610361))

(declare-fun m!610363 () Bool)

(assert (=> d!89859 m!610363))

(declare-fun m!610365 () Bool)

(assert (=> d!89859 m!610365))

(assert (=> d!89859 m!610235))

(assert (=> d!89859 m!610211))

(assert (=> b!635908 d!89859))

(declare-fun b!636105 () Bool)

(declare-fun e!363873 () SeekEntryResult!6783)

(declare-fun lt!294151 () SeekEntryResult!6783)

(assert (=> b!636105 (= e!363873 (MissingZero!6783 (index!29439 lt!294151)))))

(declare-fun b!636106 () Bool)

(declare-fun e!363871 () SeekEntryResult!6783)

(declare-fun e!363872 () SeekEntryResult!6783)

(assert (=> b!636106 (= e!363871 e!363872)))

(declare-fun lt!294149 () (_ BitVec 64))

(assert (=> b!636106 (= lt!294149 (select (arr!18343 a!2986) (index!29439 lt!294151)))))

(declare-fun c!72634 () Bool)

(assert (=> b!636106 (= c!72634 (= lt!294149 k0!1786))))

(declare-fun d!89863 () Bool)

(declare-fun lt!294150 () SeekEntryResult!6783)

(assert (=> d!89863 (and (or ((_ is Undefined!6783) lt!294150) (not ((_ is Found!6783) lt!294150)) (and (bvsge (index!29438 lt!294150) #b00000000000000000000000000000000) (bvslt (index!29438 lt!294150) (size!18707 a!2986)))) (or ((_ is Undefined!6783) lt!294150) ((_ is Found!6783) lt!294150) (not ((_ is MissingZero!6783) lt!294150)) (and (bvsge (index!29437 lt!294150) #b00000000000000000000000000000000) (bvslt (index!29437 lt!294150) (size!18707 a!2986)))) (or ((_ is Undefined!6783) lt!294150) ((_ is Found!6783) lt!294150) ((_ is MissingZero!6783) lt!294150) (not ((_ is MissingVacant!6783) lt!294150)) (and (bvsge (index!29440 lt!294150) #b00000000000000000000000000000000) (bvslt (index!29440 lt!294150) (size!18707 a!2986)))) (or ((_ is Undefined!6783) lt!294150) (ite ((_ is Found!6783) lt!294150) (= (select (arr!18343 a!2986) (index!29438 lt!294150)) k0!1786) (ite ((_ is MissingZero!6783) lt!294150) (= (select (arr!18343 a!2986) (index!29437 lt!294150)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6783) lt!294150) (= (select (arr!18343 a!2986) (index!29440 lt!294150)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!89863 (= lt!294150 e!363871)))

(declare-fun c!72633 () Bool)

(assert (=> d!89863 (= c!72633 (and ((_ is Intermediate!6783) lt!294151) (undefined!7595 lt!294151)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38232 (_ BitVec 32)) SeekEntryResult!6783)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89863 (= lt!294151 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!89863 (validMask!0 mask!3053)))

(assert (=> d!89863 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!294150)))

(declare-fun b!636107 () Bool)

(declare-fun c!72635 () Bool)

(assert (=> b!636107 (= c!72635 (= lt!294149 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!636107 (= e!363872 e!363873)))

(declare-fun b!636108 () Bool)

(assert (=> b!636108 (= e!363871 Undefined!6783)))

(declare-fun b!636109 () Bool)

(assert (=> b!636109 (= e!363873 (seekKeyOrZeroReturnVacant!0 (x!58182 lt!294151) (index!29439 lt!294151) (index!29439 lt!294151) k0!1786 a!2986 mask!3053))))

(declare-fun b!636110 () Bool)

(assert (=> b!636110 (= e!363872 (Found!6783 (index!29439 lt!294151)))))

(assert (= (and d!89863 c!72633) b!636108))

(assert (= (and d!89863 (not c!72633)) b!636106))

(assert (= (and b!636106 c!72634) b!636110))

(assert (= (and b!636106 (not c!72634)) b!636107))

(assert (= (and b!636107 c!72635) b!636105))

(assert (= (and b!636107 (not c!72635)) b!636109))

(declare-fun m!610405 () Bool)

(assert (=> b!636106 m!610405))

(declare-fun m!610407 () Bool)

(assert (=> d!89863 m!610407))

(assert (=> d!89863 m!610211))

(declare-fun m!610409 () Bool)

(assert (=> d!89863 m!610409))

(declare-fun m!610411 () Bool)

(assert (=> d!89863 m!610411))

(assert (=> d!89863 m!610411))

(declare-fun m!610413 () Bool)

(assert (=> d!89863 m!610413))

(declare-fun m!610415 () Bool)

(assert (=> d!89863 m!610415))

(declare-fun m!610417 () Bool)

(assert (=> b!636109 m!610417))

(assert (=> b!635907 d!89863))

(declare-fun d!89887 () Bool)

(declare-fun res!411577 () Bool)

(declare-fun e!363878 () Bool)

(assert (=> d!89887 (=> res!411577 e!363878)))

(assert (=> d!89887 (= res!411577 ((_ is Nil!12381) Nil!12381))))

(assert (=> d!89887 (= (noDuplicate!376 Nil!12381) e!363878)))

(declare-fun b!636115 () Bool)

(declare-fun e!363879 () Bool)

(assert (=> b!636115 (= e!363878 e!363879)))

(declare-fun res!411578 () Bool)

(assert (=> b!636115 (=> (not res!411578) (not e!363879))))

(assert (=> b!636115 (= res!411578 (not (contains!3097 (t!18612 Nil!12381) (h!13425 Nil!12381))))))

(declare-fun b!636116 () Bool)

(assert (=> b!636116 (= e!363879 (noDuplicate!376 (t!18612 Nil!12381)))))

(assert (= (and d!89887 (not res!411577)) b!636115))

(assert (= (and b!636115 res!411578) b!636116))

(declare-fun m!610419 () Bool)

(assert (=> b!636115 m!610419))

(declare-fun m!610421 () Bool)

(assert (=> b!636116 m!610421))

(assert (=> b!635896 d!89887))

(declare-fun d!89889 () Bool)

(declare-fun res!411583 () Bool)

(declare-fun e!363901 () Bool)

(assert (=> d!89889 (=> res!411583 e!363901)))

(assert (=> d!89889 (= res!411583 (bvsge #b00000000000000000000000000000000 (size!18707 a!2986)))))

(assert (=> d!89889 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!363901)))

(declare-fun b!636155 () Bool)

(declare-fun e!363903 () Bool)

(assert (=> b!636155 (= e!363901 e!363903)))

(declare-fun c!72653 () Bool)

(assert (=> b!636155 (= c!72653 (validKeyInArray!0 (select (arr!18343 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!636156 () Bool)

(declare-fun call!33422 () Bool)

(assert (=> b!636156 (= e!363903 call!33422)))

(declare-fun b!636157 () Bool)

(declare-fun e!363902 () Bool)

(assert (=> b!636157 (= e!363902 call!33422)))

(declare-fun bm!33419 () Bool)

(assert (=> bm!33419 (= call!33422 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!636158 () Bool)

(assert (=> b!636158 (= e!363903 e!363902)))

(declare-fun lt!294172 () (_ BitVec 64))

(assert (=> b!636158 (= lt!294172 (select (arr!18343 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!294170 () Unit!21466)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38232 (_ BitVec 64) (_ BitVec 32)) Unit!21466)

(assert (=> b!636158 (= lt!294170 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!294172 #b00000000000000000000000000000000))))

(assert (=> b!636158 (arrayContainsKey!0 a!2986 lt!294172 #b00000000000000000000000000000000)))

(declare-fun lt!294171 () Unit!21466)

(assert (=> b!636158 (= lt!294171 lt!294170)))

(declare-fun res!411584 () Bool)

(assert (=> b!636158 (= res!411584 (= (seekEntryOrOpen!0 (select (arr!18343 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6783 #b00000000000000000000000000000000)))))

(assert (=> b!636158 (=> (not res!411584) (not e!363902))))

(assert (= (and d!89889 (not res!411583)) b!636155))

(assert (= (and b!636155 c!72653) b!636158))

(assert (= (and b!636155 (not c!72653)) b!636156))

(assert (= (and b!636158 res!411584) b!636157))

(assert (= (or b!636157 b!636156) bm!33419))

(assert (=> b!636155 m!610331))

(assert (=> b!636155 m!610331))

(assert (=> b!636155 m!610343))

(declare-fun m!610433 () Bool)

(assert (=> bm!33419 m!610433))

(assert (=> b!636158 m!610331))

(declare-fun m!610435 () Bool)

(assert (=> b!636158 m!610435))

(declare-fun m!610437 () Bool)

(assert (=> b!636158 m!610437))

(assert (=> b!636158 m!610331))

(declare-fun m!610439 () Bool)

(assert (=> b!636158 m!610439))

(assert (=> b!635895 d!89889))

(check-sat (not bm!33415) (not b!636109) (not bm!33419) (not b!636115) (not b!636045) (not d!89833) (not b!636158) (not b!636013) (not b!636116) (not b!636039) (not d!89859) (not b!635991) (not d!89827) (not d!89863) (not b!636017) (not d!89835) (not b!635999) (not b!636011) (not d!89829) (not b!636000) (not b!636015) (not b!635985) (not d!89831) (not b!636038) (not b!636036) (not b!636155) (not d!89853))
(check-sat)

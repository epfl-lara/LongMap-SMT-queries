; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58332 () Bool)

(assert start!58332)

(declare-fun b!644212 () Bool)

(declare-fun e!369079 () Bool)

(declare-datatypes ((SeekEntryResult!6868 0))(
  ( (MissingZero!6868 (index!29804 (_ BitVec 32))) (Found!6868 (index!29805 (_ BitVec 32))) (Intermediate!6868 (undefined!7680 Bool) (index!29806 (_ BitVec 32)) (x!58572 (_ BitVec 32))) (Undefined!6868) (MissingVacant!6868 (index!29807 (_ BitVec 32))) )
))
(declare-fun lt!298567 () SeekEntryResult!6868)

(declare-fun lt!298563 () SeekEntryResult!6868)

(assert (=> b!644212 (= e!369079 (= lt!298567 lt!298563))))

(declare-fun e!369080 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!644213 () Bool)

(declare-datatypes ((array!38429 0))(
  ( (array!38430 (arr!18428 (Array (_ BitVec 32) (_ BitVec 64))) (size!18792 (_ BitVec 32))) )
))
(declare-fun lt!298555 () array!38429)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38429)

(declare-fun arrayContainsKey!0 (array!38429 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!644213 (= e!369080 (arrayContainsKey!0 lt!298555 (select (arr!18428 a!2986) j!136) index!984))))

(declare-fun b!644214 () Bool)

(declare-fun e!369090 () Bool)

(assert (=> b!644214 (= e!369090 e!369080)))

(declare-fun res!417333 () Bool)

(assert (=> b!644214 (=> (not res!417333) (not e!369080))))

(assert (=> b!644214 (= res!417333 (arrayContainsKey!0 lt!298555 (select (arr!18428 a!2986) j!136) j!136))))

(declare-fun b!644215 () Bool)

(declare-datatypes ((Unit!21834 0))(
  ( (Unit!21835) )
))
(declare-fun e!369081 () Unit!21834)

(declare-fun Unit!21836 () Unit!21834)

(assert (=> b!644215 (= e!369081 Unit!21836)))

(declare-fun b!644216 () Bool)

(declare-fun res!417322 () Bool)

(declare-fun e!369077 () Bool)

(assert (=> b!644216 (=> (not res!417322) (not e!369077))))

(declare-datatypes ((List!12469 0))(
  ( (Nil!12466) (Cons!12465 (h!13510 (_ BitVec 64)) (t!18697 List!12469)) )
))
(declare-fun arrayNoDuplicates!0 (array!38429 (_ BitVec 32) List!12469) Bool)

(assert (=> b!644216 (= res!417322 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12466))))

(declare-fun b!644217 () Bool)

(declare-fun Unit!21837 () Unit!21834)

(assert (=> b!644217 (= e!369081 Unit!21837)))

(declare-fun lt!298564 () Unit!21834)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38429 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21834)

(assert (=> b!644217 (= lt!298564 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!298555 (select (arr!18428 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!644217 (arrayContainsKey!0 lt!298555 (select (arr!18428 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!298554 () Unit!21834)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38429 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12469) Unit!21834)

(assert (=> b!644217 (= lt!298554 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12466))))

(assert (=> b!644217 (arrayNoDuplicates!0 lt!298555 #b00000000000000000000000000000000 Nil!12466)))

(declare-fun lt!298557 () Unit!21834)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38429 (_ BitVec 32) (_ BitVec 32)) Unit!21834)

(assert (=> b!644217 (= lt!298557 (lemmaNoDuplicateFromThenFromBigger!0 lt!298555 #b00000000000000000000000000000000 j!136))))

(assert (=> b!644217 (arrayNoDuplicates!0 lt!298555 j!136 Nil!12466)))

(declare-fun lt!298559 () Unit!21834)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38429 (_ BitVec 64) (_ BitVec 32) List!12469) Unit!21834)

(assert (=> b!644217 (= lt!298559 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!298555 (select (arr!18428 a!2986) j!136) j!136 Nil!12466))))

(assert (=> b!644217 false))

(declare-fun b!644218 () Bool)

(declare-fun e!369083 () Unit!21834)

(declare-fun Unit!21838 () Unit!21834)

(assert (=> b!644218 (= e!369083 Unit!21838)))

(declare-fun b!644219 () Bool)

(declare-fun e!369085 () Bool)

(declare-fun e!369088 () Bool)

(assert (=> b!644219 (= e!369085 e!369088)))

(declare-fun res!417334 () Bool)

(assert (=> b!644219 (=> res!417334 e!369088)))

(declare-fun lt!298561 () (_ BitVec 64))

(declare-fun lt!298553 () (_ BitVec 64))

(assert (=> b!644219 (= res!417334 (or (not (= (select (arr!18428 a!2986) j!136) lt!298553)) (not (= (select (arr!18428 a!2986) j!136) lt!298561))))))

(declare-fun e!369086 () Bool)

(assert (=> b!644219 e!369086))

(declare-fun res!417326 () Bool)

(assert (=> b!644219 (=> (not res!417326) (not e!369086))))

(assert (=> b!644219 (= res!417326 (= lt!298561 (select (arr!18428 a!2986) j!136)))))

(assert (=> b!644219 (= lt!298561 (select (store (arr!18428 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!644220 () Bool)

(declare-fun e!369089 () Bool)

(declare-fun e!369087 () Bool)

(assert (=> b!644220 (= e!369089 e!369087)))

(declare-fun res!417331 () Bool)

(assert (=> b!644220 (=> (not res!417331) (not e!369087))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!644220 (= res!417331 (and (= lt!298567 (Found!6868 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18428 a!2986) index!984) (select (arr!18428 a!2986) j!136))) (not (= (select (arr!18428 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38429 (_ BitVec 32)) SeekEntryResult!6868)

(assert (=> b!644220 (= lt!298567 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18428 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!644221 () Bool)

(declare-fun res!417321 () Bool)

(assert (=> b!644221 (=> (not res!417321) (not e!369077))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38429 (_ BitVec 32)) Bool)

(assert (=> b!644221 (= res!417321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!644222 () Bool)

(declare-fun res!417325 () Bool)

(declare-fun e!369084 () Bool)

(assert (=> b!644222 (=> (not res!417325) (not e!369084))))

(assert (=> b!644222 (= res!417325 (and (= (size!18792 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18792 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18792 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!644223 () Bool)

(assert (=> b!644223 (= e!369086 e!369090)))

(declare-fun res!417332 () Bool)

(assert (=> b!644223 (=> res!417332 e!369090)))

(assert (=> b!644223 (= res!417332 (or (not (= (select (arr!18428 a!2986) j!136) lt!298553)) (not (= (select (arr!18428 a!2986) j!136) lt!298561)) (bvsge j!136 index!984)))))

(declare-fun res!417337 () Bool)

(assert (=> start!58332 (=> (not res!417337) (not e!369084))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58332 (= res!417337 (validMask!0 mask!3053))))

(assert (=> start!58332 e!369084))

(assert (=> start!58332 true))

(declare-fun array_inv!14224 (array!38429) Bool)

(assert (=> start!58332 (array_inv!14224 a!2986)))

(declare-fun e!369076 () Bool)

(declare-fun b!644224 () Bool)

(assert (=> b!644224 (= e!369076 (arrayContainsKey!0 lt!298555 (select (arr!18428 a!2986) j!136) index!984))))

(declare-fun b!644225 () Bool)

(declare-fun e!369082 () Bool)

(assert (=> b!644225 (= e!369088 e!369082)))

(declare-fun res!417324 () Bool)

(assert (=> b!644225 (=> res!417324 e!369082)))

(assert (=> b!644225 (= res!417324 (bvsge index!984 j!136))))

(declare-fun lt!298562 () Unit!21834)

(assert (=> b!644225 (= lt!298562 e!369081)))

(declare-fun c!73813 () Bool)

(assert (=> b!644225 (= c!73813 (bvslt j!136 index!984))))

(declare-fun b!644226 () Bool)

(declare-fun res!417320 () Bool)

(assert (=> b!644226 (=> (not res!417320) (not e!369084))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!644226 (= res!417320 (validKeyInArray!0 (select (arr!18428 a!2986) j!136)))))

(declare-fun b!644227 () Bool)

(assert (=> b!644227 (= e!369087 (not e!369085))))

(declare-fun res!417327 () Bool)

(assert (=> b!644227 (=> res!417327 e!369085)))

(declare-fun lt!298558 () SeekEntryResult!6868)

(assert (=> b!644227 (= res!417327 (not (= lt!298558 (Found!6868 index!984))))))

(declare-fun lt!298565 () Unit!21834)

(assert (=> b!644227 (= lt!298565 e!369083)))

(declare-fun c!73814 () Bool)

(assert (=> b!644227 (= c!73814 (= lt!298558 Undefined!6868))))

(assert (=> b!644227 (= lt!298558 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!298553 lt!298555 mask!3053))))

(assert (=> b!644227 e!369079))

(declare-fun res!417329 () Bool)

(assert (=> b!644227 (=> (not res!417329) (not e!369079))))

(declare-fun lt!298560 () (_ BitVec 32))

(assert (=> b!644227 (= res!417329 (= lt!298563 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298560 vacantSpotIndex!68 lt!298553 lt!298555 mask!3053)))))

(assert (=> b!644227 (= lt!298563 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298560 vacantSpotIndex!68 (select (arr!18428 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!644227 (= lt!298553 (select (store (arr!18428 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!298556 () Unit!21834)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38429 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21834)

(assert (=> b!644227 (= lt!298556 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!298560 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!644227 (= lt!298560 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!644228 () Bool)

(declare-fun res!417338 () Bool)

(assert (=> b!644228 (=> (not res!417338) (not e!369077))))

(assert (=> b!644228 (= res!417338 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18428 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!644229 () Bool)

(assert (=> b!644229 (= e!369082 (bvsge (bvadd #b00000000000000000000000000000001 index!984) #b00000000000000000000000000000000))))

(assert (=> b!644229 e!369076))

(declare-fun res!417323 () Bool)

(assert (=> b!644229 (=> (not res!417323) (not e!369076))))

(assert (=> b!644229 (= res!417323 (arrayContainsKey!0 lt!298555 (select (arr!18428 a!2986) j!136) j!136))))

(declare-fun b!644230 () Bool)

(declare-fun res!417336 () Bool)

(assert (=> b!644230 (=> (not res!417336) (not e!369084))))

(assert (=> b!644230 (= res!417336 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!644231 () Bool)

(assert (=> b!644231 (= e!369084 e!369077)))

(declare-fun res!417330 () Bool)

(assert (=> b!644231 (=> (not res!417330) (not e!369077))))

(declare-fun lt!298566 () SeekEntryResult!6868)

(assert (=> b!644231 (= res!417330 (or (= lt!298566 (MissingZero!6868 i!1108)) (= lt!298566 (MissingVacant!6868 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38429 (_ BitVec 32)) SeekEntryResult!6868)

(assert (=> b!644231 (= lt!298566 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!644232 () Bool)

(assert (=> b!644232 (= e!369077 e!369089)))

(declare-fun res!417335 () Bool)

(assert (=> b!644232 (=> (not res!417335) (not e!369089))))

(assert (=> b!644232 (= res!417335 (= (select (store (arr!18428 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!644232 (= lt!298555 (array!38430 (store (arr!18428 a!2986) i!1108 k!1786) (size!18792 a!2986)))))

(declare-fun b!644233 () Bool)

(declare-fun res!417328 () Bool)

(assert (=> b!644233 (=> (not res!417328) (not e!369084))))

(assert (=> b!644233 (= res!417328 (validKeyInArray!0 k!1786))))

(declare-fun b!644234 () Bool)

(declare-fun Unit!21839 () Unit!21834)

(assert (=> b!644234 (= e!369083 Unit!21839)))

(assert (=> b!644234 false))

(assert (= (and start!58332 res!417337) b!644222))

(assert (= (and b!644222 res!417325) b!644226))

(assert (= (and b!644226 res!417320) b!644233))

(assert (= (and b!644233 res!417328) b!644230))

(assert (= (and b!644230 res!417336) b!644231))

(assert (= (and b!644231 res!417330) b!644221))

(assert (= (and b!644221 res!417321) b!644216))

(assert (= (and b!644216 res!417322) b!644228))

(assert (= (and b!644228 res!417338) b!644232))

(assert (= (and b!644232 res!417335) b!644220))

(assert (= (and b!644220 res!417331) b!644227))

(assert (= (and b!644227 res!417329) b!644212))

(assert (= (and b!644227 c!73814) b!644234))

(assert (= (and b!644227 (not c!73814)) b!644218))

(assert (= (and b!644227 (not res!417327)) b!644219))

(assert (= (and b!644219 res!417326) b!644223))

(assert (= (and b!644223 (not res!417332)) b!644214))

(assert (= (and b!644214 res!417333) b!644213))

(assert (= (and b!644219 (not res!417334)) b!644225))

(assert (= (and b!644225 c!73813) b!644217))

(assert (= (and b!644225 (not c!73813)) b!644215))

(assert (= (and b!644225 (not res!417324)) b!644229))

(assert (= (and b!644229 res!417323) b!644224))

(declare-fun m!617849 () Bool)

(assert (=> b!644219 m!617849))

(declare-fun m!617851 () Bool)

(assert (=> b!644219 m!617851))

(declare-fun m!617853 () Bool)

(assert (=> b!644219 m!617853))

(assert (=> b!644229 m!617849))

(assert (=> b!644229 m!617849))

(declare-fun m!617855 () Bool)

(assert (=> b!644229 m!617855))

(assert (=> b!644232 m!617851))

(declare-fun m!617857 () Bool)

(assert (=> b!644232 m!617857))

(assert (=> b!644213 m!617849))

(assert (=> b!644213 m!617849))

(declare-fun m!617859 () Bool)

(assert (=> b!644213 m!617859))

(assert (=> b!644217 m!617849))

(declare-fun m!617861 () Bool)

(assert (=> b!644217 m!617861))

(assert (=> b!644217 m!617849))

(declare-fun m!617863 () Bool)

(assert (=> b!644217 m!617863))

(assert (=> b!644217 m!617849))

(declare-fun m!617865 () Bool)

(assert (=> b!644217 m!617865))

(declare-fun m!617867 () Bool)

(assert (=> b!644217 m!617867))

(declare-fun m!617869 () Bool)

(assert (=> b!644217 m!617869))

(declare-fun m!617871 () Bool)

(assert (=> b!644217 m!617871))

(assert (=> b!644217 m!617849))

(declare-fun m!617873 () Bool)

(assert (=> b!644217 m!617873))

(declare-fun m!617875 () Bool)

(assert (=> b!644228 m!617875))

(declare-fun m!617877 () Bool)

(assert (=> b!644220 m!617877))

(assert (=> b!644220 m!617849))

(assert (=> b!644220 m!617849))

(declare-fun m!617879 () Bool)

(assert (=> b!644220 m!617879))

(declare-fun m!617881 () Bool)

(assert (=> b!644233 m!617881))

(assert (=> b!644214 m!617849))

(assert (=> b!644214 m!617849))

(assert (=> b!644214 m!617855))

(declare-fun m!617883 () Bool)

(assert (=> b!644230 m!617883))

(declare-fun m!617885 () Bool)

(assert (=> b!644231 m!617885))

(declare-fun m!617887 () Bool)

(assert (=> start!58332 m!617887))

(declare-fun m!617889 () Bool)

(assert (=> start!58332 m!617889))

(declare-fun m!617891 () Bool)

(assert (=> b!644227 m!617891))

(declare-fun m!617893 () Bool)

(assert (=> b!644227 m!617893))

(assert (=> b!644227 m!617849))

(assert (=> b!644227 m!617849))

(declare-fun m!617895 () Bool)

(assert (=> b!644227 m!617895))

(declare-fun m!617897 () Bool)

(assert (=> b!644227 m!617897))

(declare-fun m!617899 () Bool)

(assert (=> b!644227 m!617899))

(assert (=> b!644227 m!617851))

(declare-fun m!617901 () Bool)

(assert (=> b!644227 m!617901))

(declare-fun m!617903 () Bool)

(assert (=> b!644221 m!617903))

(declare-fun m!617905 () Bool)

(assert (=> b!644216 m!617905))

(assert (=> b!644223 m!617849))

(assert (=> b!644224 m!617849))

(assert (=> b!644224 m!617849))

(assert (=> b!644224 m!617859))

(assert (=> b!644226 m!617849))

(assert (=> b!644226 m!617849))

(declare-fun m!617907 () Bool)

(assert (=> b!644226 m!617907))

(push 1)


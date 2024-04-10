; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58450 () Bool)

(assert start!58450)

(declare-fun b!645712 () Bool)

(declare-fun e!370064 () Bool)

(declare-fun e!370074 () Bool)

(assert (=> b!645712 (= e!370064 e!370074)))

(declare-fun res!418416 () Bool)

(assert (=> b!645712 (=> (not res!418416) (not e!370074))))

(declare-datatypes ((SeekEntryResult!6885 0))(
  ( (MissingZero!6885 (index!29875 (_ BitVec 32))) (Found!6885 (index!29876 (_ BitVec 32))) (Intermediate!6885 (undefined!7697 Bool) (index!29877 (_ BitVec 32)) (x!58646 (_ BitVec 32))) (Undefined!6885) (MissingVacant!6885 (index!29878 (_ BitVec 32))) )
))
(declare-fun lt!299488 () SeekEntryResult!6885)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!645712 (= res!418416 (or (= lt!299488 (MissingZero!6885 i!1108)) (= lt!299488 (MissingVacant!6885 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!38466 0))(
  ( (array!38467 (arr!18445 (Array (_ BitVec 32) (_ BitVec 64))) (size!18809 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38466)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38466 (_ BitVec 32)) SeekEntryResult!6885)

(assert (=> b!645712 (= lt!299488 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!645713 () Bool)

(declare-fun e!370063 () Bool)

(declare-fun e!370067 () Bool)

(assert (=> b!645713 (= e!370063 e!370067)))

(declare-fun res!418424 () Bool)

(assert (=> b!645713 (=> res!418424 e!370067)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!299492 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lt!299491 () (_ BitVec 64))

(assert (=> b!645713 (= res!418424 (or (not (= (select (arr!18445 a!2986) j!136) lt!299491)) (not (= (select (arr!18445 a!2986) j!136) lt!299492)) (bvsge j!136 index!984)))))

(declare-fun b!645714 () Bool)

(declare-fun e!370065 () Bool)

(declare-fun e!370075 () Bool)

(assert (=> b!645714 (= e!370065 e!370075)))

(declare-fun res!418420 () Bool)

(assert (=> b!645714 (=> res!418420 e!370075)))

(assert (=> b!645714 (= res!418420 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!21936 0))(
  ( (Unit!21937) )
))
(declare-fun lt!299486 () Unit!21936)

(declare-fun e!370077 () Unit!21936)

(assert (=> b!645714 (= lt!299486 e!370077)))

(declare-fun c!74021 () Bool)

(assert (=> b!645714 (= c!74021 (bvslt j!136 index!984))))

(declare-fun b!645715 () Bool)

(declare-fun Unit!21938 () Unit!21936)

(assert (=> b!645715 (= e!370077 Unit!21938)))

(declare-fun lt!299485 () array!38466)

(declare-fun lt!299489 () Unit!21936)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38466 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21936)

(assert (=> b!645715 (= lt!299489 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299485 (select (arr!18445 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!38466 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!645715 (arrayContainsKey!0 lt!299485 (select (arr!18445 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!299487 () Unit!21936)

(declare-datatypes ((List!12486 0))(
  ( (Nil!12483) (Cons!12482 (h!13527 (_ BitVec 64)) (t!18714 List!12486)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38466 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12486) Unit!21936)

(assert (=> b!645715 (= lt!299487 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12483))))

(declare-fun arrayNoDuplicates!0 (array!38466 (_ BitVec 32) List!12486) Bool)

(assert (=> b!645715 (arrayNoDuplicates!0 lt!299485 #b00000000000000000000000000000000 Nil!12483)))

(declare-fun lt!299494 () Unit!21936)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38466 (_ BitVec 32) (_ BitVec 32)) Unit!21936)

(assert (=> b!645715 (= lt!299494 (lemmaNoDuplicateFromThenFromBigger!0 lt!299485 #b00000000000000000000000000000000 j!136))))

(assert (=> b!645715 (arrayNoDuplicates!0 lt!299485 j!136 Nil!12483)))

(declare-fun lt!299500 () Unit!21936)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38466 (_ BitVec 64) (_ BitVec 32) List!12486) Unit!21936)

(assert (=> b!645715 (= lt!299500 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!299485 (select (arr!18445 a!2986) j!136) j!136 Nil!12483))))

(assert (=> b!645715 false))

(declare-fun res!418419 () Bool)

(assert (=> start!58450 (=> (not res!418419) (not e!370064))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58450 (= res!418419 (validMask!0 mask!3053))))

(assert (=> start!58450 e!370064))

(assert (=> start!58450 true))

(declare-fun array_inv!14241 (array!38466) Bool)

(assert (=> start!58450 (array_inv!14241 a!2986)))

(declare-fun b!645716 () Bool)

(declare-fun e!370071 () Bool)

(declare-fun e!370076 () Bool)

(assert (=> b!645716 (= e!370071 e!370076)))

(declare-fun res!418414 () Bool)

(assert (=> b!645716 (=> (not res!418414) (not e!370076))))

(declare-fun lt!299497 () SeekEntryResult!6885)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!645716 (= res!418414 (and (= lt!299497 (Found!6885 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18445 a!2986) index!984) (select (arr!18445 a!2986) j!136))) (not (= (select (arr!18445 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38466 (_ BitVec 32)) SeekEntryResult!6885)

(assert (=> b!645716 (= lt!299497 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18445 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!645717 () Bool)

(declare-fun e!370066 () Unit!21936)

(declare-fun Unit!21939 () Unit!21936)

(assert (=> b!645717 (= e!370066 Unit!21939)))

(assert (=> b!645717 false))

(declare-fun b!645718 () Bool)

(declare-fun res!418413 () Bool)

(assert (=> b!645718 (=> (not res!418413) (not e!370074))))

(assert (=> b!645718 (= res!418413 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12483))))

(declare-fun b!645719 () Bool)

(assert (=> b!645719 (= e!370075 (bvslt (size!18809 a!2986) #b01111111111111111111111111111111))))

(assert (=> b!645719 (arrayContainsKey!0 lt!299485 (select (arr!18445 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!299499 () Unit!21936)

(assert (=> b!645719 (= lt!299499 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299485 (select (arr!18445 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!370072 () Bool)

(assert (=> b!645719 e!370072))

(declare-fun res!418410 () Bool)

(assert (=> b!645719 (=> (not res!418410) (not e!370072))))

(assert (=> b!645719 (= res!418410 (arrayContainsKey!0 lt!299485 (select (arr!18445 a!2986) j!136) j!136))))

(declare-fun b!645720 () Bool)

(declare-fun Unit!21940 () Unit!21936)

(assert (=> b!645720 (= e!370066 Unit!21940)))

(declare-fun b!645721 () Bool)

(assert (=> b!645721 (= e!370072 (arrayContainsKey!0 lt!299485 (select (arr!18445 a!2986) j!136) index!984))))

(declare-fun b!645722 () Bool)

(declare-fun res!418422 () Bool)

(assert (=> b!645722 (=> (not res!418422) (not e!370064))))

(assert (=> b!645722 (= res!418422 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!645723 () Bool)

(declare-fun e!370068 () Bool)

(assert (=> b!645723 (= e!370068 (arrayContainsKey!0 lt!299485 (select (arr!18445 a!2986) j!136) index!984))))

(declare-fun b!645724 () Bool)

(declare-fun e!370070 () Bool)

(assert (=> b!645724 (= e!370076 (not e!370070))))

(declare-fun res!418407 () Bool)

(assert (=> b!645724 (=> res!418407 e!370070)))

(declare-fun lt!299498 () SeekEntryResult!6885)

(assert (=> b!645724 (= res!418407 (not (= lt!299498 (Found!6885 index!984))))))

(declare-fun lt!299490 () Unit!21936)

(assert (=> b!645724 (= lt!299490 e!370066)))

(declare-fun c!74020 () Bool)

(assert (=> b!645724 (= c!74020 (= lt!299498 Undefined!6885))))

(assert (=> b!645724 (= lt!299498 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!299491 lt!299485 mask!3053))))

(declare-fun e!370069 () Bool)

(assert (=> b!645724 e!370069))

(declare-fun res!418415 () Bool)

(assert (=> b!645724 (=> (not res!418415) (not e!370069))))

(declare-fun lt!299495 () SeekEntryResult!6885)

(declare-fun lt!299496 () (_ BitVec 32))

(assert (=> b!645724 (= res!418415 (= lt!299495 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299496 vacantSpotIndex!68 lt!299491 lt!299485 mask!3053)))))

(assert (=> b!645724 (= lt!299495 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299496 vacantSpotIndex!68 (select (arr!18445 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!645724 (= lt!299491 (select (store (arr!18445 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!299493 () Unit!21936)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38466 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21936)

(assert (=> b!645724 (= lt!299493 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!299496 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!645724 (= lt!299496 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!645725 () Bool)

(declare-fun Unit!21941 () Unit!21936)

(assert (=> b!645725 (= e!370077 Unit!21941)))

(declare-fun b!645726 () Bool)

(declare-fun res!418421 () Bool)

(assert (=> b!645726 (=> (not res!418421) (not e!370064))))

(assert (=> b!645726 (= res!418421 (and (= (size!18809 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18809 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18809 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!645727 () Bool)

(assert (=> b!645727 (= e!370074 e!370071)))

(declare-fun res!418418 () Bool)

(assert (=> b!645727 (=> (not res!418418) (not e!370071))))

(assert (=> b!645727 (= res!418418 (= (select (store (arr!18445 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!645727 (= lt!299485 (array!38467 (store (arr!18445 a!2986) i!1108 k0!1786) (size!18809 a!2986)))))

(declare-fun b!645728 () Bool)

(assert (=> b!645728 (= e!370070 e!370065)))

(declare-fun res!418409 () Bool)

(assert (=> b!645728 (=> res!418409 e!370065)))

(assert (=> b!645728 (= res!418409 (or (not (= (select (arr!18445 a!2986) j!136) lt!299491)) (not (= (select (arr!18445 a!2986) j!136) lt!299492))))))

(assert (=> b!645728 e!370063))

(declare-fun res!418408 () Bool)

(assert (=> b!645728 (=> (not res!418408) (not e!370063))))

(assert (=> b!645728 (= res!418408 (= lt!299492 (select (arr!18445 a!2986) j!136)))))

(assert (=> b!645728 (= lt!299492 (select (store (arr!18445 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!645729 () Bool)

(declare-fun res!418423 () Bool)

(assert (=> b!645729 (=> (not res!418423) (not e!370064))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!645729 (= res!418423 (validKeyInArray!0 k0!1786))))

(declare-fun b!645730 () Bool)

(assert (=> b!645730 (= e!370067 e!370068)))

(declare-fun res!418412 () Bool)

(assert (=> b!645730 (=> (not res!418412) (not e!370068))))

(assert (=> b!645730 (= res!418412 (arrayContainsKey!0 lt!299485 (select (arr!18445 a!2986) j!136) j!136))))

(declare-fun b!645731 () Bool)

(declare-fun res!418406 () Bool)

(assert (=> b!645731 (=> (not res!418406) (not e!370074))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38466 (_ BitVec 32)) Bool)

(assert (=> b!645731 (= res!418406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!645732 () Bool)

(declare-fun res!418417 () Bool)

(assert (=> b!645732 (=> (not res!418417) (not e!370074))))

(assert (=> b!645732 (= res!418417 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18445 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!645733 () Bool)

(assert (=> b!645733 (= e!370069 (= lt!299497 lt!299495))))

(declare-fun b!645734 () Bool)

(declare-fun res!418411 () Bool)

(assert (=> b!645734 (=> (not res!418411) (not e!370064))))

(assert (=> b!645734 (= res!418411 (validKeyInArray!0 (select (arr!18445 a!2986) j!136)))))

(assert (= (and start!58450 res!418419) b!645726))

(assert (= (and b!645726 res!418421) b!645734))

(assert (= (and b!645734 res!418411) b!645729))

(assert (= (and b!645729 res!418423) b!645722))

(assert (= (and b!645722 res!418422) b!645712))

(assert (= (and b!645712 res!418416) b!645731))

(assert (= (and b!645731 res!418406) b!645718))

(assert (= (and b!645718 res!418413) b!645732))

(assert (= (and b!645732 res!418417) b!645727))

(assert (= (and b!645727 res!418418) b!645716))

(assert (= (and b!645716 res!418414) b!645724))

(assert (= (and b!645724 res!418415) b!645733))

(assert (= (and b!645724 c!74020) b!645717))

(assert (= (and b!645724 (not c!74020)) b!645720))

(assert (= (and b!645724 (not res!418407)) b!645728))

(assert (= (and b!645728 res!418408) b!645713))

(assert (= (and b!645713 (not res!418424)) b!645730))

(assert (= (and b!645730 res!418412) b!645723))

(assert (= (and b!645728 (not res!418409)) b!645714))

(assert (= (and b!645714 c!74021) b!645715))

(assert (= (and b!645714 (not c!74021)) b!645725))

(assert (= (and b!645714 (not res!418420)) b!645719))

(assert (= (and b!645719 res!418410) b!645721))

(declare-fun m!619209 () Bool)

(assert (=> b!645734 m!619209))

(assert (=> b!645734 m!619209))

(declare-fun m!619211 () Bool)

(assert (=> b!645734 m!619211))

(assert (=> b!645728 m!619209))

(declare-fun m!619213 () Bool)

(assert (=> b!645728 m!619213))

(declare-fun m!619215 () Bool)

(assert (=> b!645728 m!619215))

(declare-fun m!619217 () Bool)

(assert (=> start!58450 m!619217))

(declare-fun m!619219 () Bool)

(assert (=> start!58450 m!619219))

(assert (=> b!645730 m!619209))

(assert (=> b!645730 m!619209))

(declare-fun m!619221 () Bool)

(assert (=> b!645730 m!619221))

(assert (=> b!645719 m!619209))

(assert (=> b!645719 m!619209))

(declare-fun m!619223 () Bool)

(assert (=> b!645719 m!619223))

(assert (=> b!645719 m!619209))

(declare-fun m!619225 () Bool)

(assert (=> b!645719 m!619225))

(assert (=> b!645719 m!619209))

(assert (=> b!645719 m!619221))

(declare-fun m!619227 () Bool)

(assert (=> b!645716 m!619227))

(assert (=> b!645716 m!619209))

(assert (=> b!645716 m!619209))

(declare-fun m!619229 () Bool)

(assert (=> b!645716 m!619229))

(assert (=> b!645713 m!619209))

(declare-fun m!619231 () Bool)

(assert (=> b!645722 m!619231))

(assert (=> b!645721 m!619209))

(assert (=> b!645721 m!619209))

(declare-fun m!619233 () Bool)

(assert (=> b!645721 m!619233))

(assert (=> b!645723 m!619209))

(assert (=> b!645723 m!619209))

(assert (=> b!645723 m!619233))

(declare-fun m!619235 () Bool)

(assert (=> b!645718 m!619235))

(declare-fun m!619237 () Bool)

(assert (=> b!645731 m!619237))

(assert (=> b!645715 m!619209))

(declare-fun m!619239 () Bool)

(assert (=> b!645715 m!619239))

(assert (=> b!645715 m!619209))

(declare-fun m!619241 () Bool)

(assert (=> b!645715 m!619241))

(declare-fun m!619243 () Bool)

(assert (=> b!645715 m!619243))

(declare-fun m!619245 () Bool)

(assert (=> b!645715 m!619245))

(declare-fun m!619247 () Bool)

(assert (=> b!645715 m!619247))

(assert (=> b!645715 m!619209))

(declare-fun m!619249 () Bool)

(assert (=> b!645715 m!619249))

(assert (=> b!645715 m!619209))

(declare-fun m!619251 () Bool)

(assert (=> b!645715 m!619251))

(declare-fun m!619253 () Bool)

(assert (=> b!645712 m!619253))

(assert (=> b!645727 m!619213))

(declare-fun m!619255 () Bool)

(assert (=> b!645727 m!619255))

(declare-fun m!619257 () Bool)

(assert (=> b!645729 m!619257))

(declare-fun m!619259 () Bool)

(assert (=> b!645724 m!619259))

(declare-fun m!619261 () Bool)

(assert (=> b!645724 m!619261))

(assert (=> b!645724 m!619209))

(assert (=> b!645724 m!619209))

(declare-fun m!619263 () Bool)

(assert (=> b!645724 m!619263))

(assert (=> b!645724 m!619213))

(declare-fun m!619265 () Bool)

(assert (=> b!645724 m!619265))

(declare-fun m!619267 () Bool)

(assert (=> b!645724 m!619267))

(declare-fun m!619269 () Bool)

(assert (=> b!645724 m!619269))

(declare-fun m!619271 () Bool)

(assert (=> b!645732 m!619271))

(check-sat (not b!645715) (not start!58450) (not b!645721) (not b!645730) (not b!645729) (not b!645731) (not b!645712) (not b!645716) (not b!645724) (not b!645719) (not b!645723) (not b!645722) (not b!645718) (not b!645734))
(check-sat)
(get-model)

(declare-fun d!91217 () Bool)

(assert (=> d!91217 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!645729 d!91217))

(declare-fun b!645814 () Bool)

(declare-fun e!370132 () Bool)

(declare-fun contains!3148 (List!12486 (_ BitVec 64)) Bool)

(assert (=> b!645814 (= e!370132 (contains!3148 Nil!12483 (select (arr!18445 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33632 () Bool)

(declare-fun call!33635 () Bool)

(declare-fun c!74030 () Bool)

(assert (=> bm!33632 (= call!33635 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74030 (Cons!12482 (select (arr!18445 a!2986) #b00000000000000000000000000000000) Nil!12483) Nil!12483)))))

(declare-fun d!91219 () Bool)

(declare-fun res!418490 () Bool)

(declare-fun e!370133 () Bool)

(assert (=> d!91219 (=> res!418490 e!370133)))

(assert (=> d!91219 (= res!418490 (bvsge #b00000000000000000000000000000000 (size!18809 a!2986)))))

(assert (=> d!91219 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12483) e!370133)))

(declare-fun b!645815 () Bool)

(declare-fun e!370134 () Bool)

(assert (=> b!645815 (= e!370134 call!33635)))

(declare-fun b!645816 () Bool)

(declare-fun e!370131 () Bool)

(assert (=> b!645816 (= e!370133 e!370131)))

(declare-fun res!418488 () Bool)

(assert (=> b!645816 (=> (not res!418488) (not e!370131))))

(assert (=> b!645816 (= res!418488 (not e!370132))))

(declare-fun res!418489 () Bool)

(assert (=> b!645816 (=> (not res!418489) (not e!370132))))

(assert (=> b!645816 (= res!418489 (validKeyInArray!0 (select (arr!18445 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!645817 () Bool)

(assert (=> b!645817 (= e!370131 e!370134)))

(assert (=> b!645817 (= c!74030 (validKeyInArray!0 (select (arr!18445 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!645818 () Bool)

(assert (=> b!645818 (= e!370134 call!33635)))

(assert (= (and d!91219 (not res!418490)) b!645816))

(assert (= (and b!645816 res!418489) b!645814))

(assert (= (and b!645816 res!418488) b!645817))

(assert (= (and b!645817 c!74030) b!645818))

(assert (= (and b!645817 (not c!74030)) b!645815))

(assert (= (or b!645818 b!645815) bm!33632))

(declare-fun m!619337 () Bool)

(assert (=> b!645814 m!619337))

(assert (=> b!645814 m!619337))

(declare-fun m!619339 () Bool)

(assert (=> b!645814 m!619339))

(assert (=> bm!33632 m!619337))

(declare-fun m!619341 () Bool)

(assert (=> bm!33632 m!619341))

(assert (=> b!645816 m!619337))

(assert (=> b!645816 m!619337))

(declare-fun m!619343 () Bool)

(assert (=> b!645816 m!619343))

(assert (=> b!645817 m!619337))

(assert (=> b!645817 m!619337))

(assert (=> b!645817 m!619343))

(assert (=> b!645718 d!91219))

(declare-fun b!645854 () Bool)

(declare-fun e!370163 () SeekEntryResult!6885)

(assert (=> b!645854 (= e!370163 (Found!6885 index!984))))

(declare-fun b!645855 () Bool)

(declare-fun e!370162 () SeekEntryResult!6885)

(assert (=> b!645855 (= e!370162 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18445 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!645856 () Bool)

(declare-fun e!370161 () SeekEntryResult!6885)

(assert (=> b!645856 (= e!370161 e!370163)))

(declare-fun lt!299553 () (_ BitVec 64))

(declare-fun c!74041 () Bool)

(assert (=> b!645856 (= c!74041 (= lt!299553 (select (arr!18445 a!2986) j!136)))))

(declare-fun b!645857 () Bool)

(declare-fun c!74042 () Bool)

(assert (=> b!645857 (= c!74042 (= lt!299553 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!645857 (= e!370163 e!370162)))

(declare-fun b!645858 () Bool)

(assert (=> b!645858 (= e!370161 Undefined!6885)))

(declare-fun d!91221 () Bool)

(declare-fun lt!299554 () SeekEntryResult!6885)

(get-info :version)

(assert (=> d!91221 (and (or ((_ is Undefined!6885) lt!299554) (not ((_ is Found!6885) lt!299554)) (and (bvsge (index!29876 lt!299554) #b00000000000000000000000000000000) (bvslt (index!29876 lt!299554) (size!18809 a!2986)))) (or ((_ is Undefined!6885) lt!299554) ((_ is Found!6885) lt!299554) (not ((_ is MissingVacant!6885) lt!299554)) (not (= (index!29878 lt!299554) vacantSpotIndex!68)) (and (bvsge (index!29878 lt!299554) #b00000000000000000000000000000000) (bvslt (index!29878 lt!299554) (size!18809 a!2986)))) (or ((_ is Undefined!6885) lt!299554) (ite ((_ is Found!6885) lt!299554) (= (select (arr!18445 a!2986) (index!29876 lt!299554)) (select (arr!18445 a!2986) j!136)) (and ((_ is MissingVacant!6885) lt!299554) (= (index!29878 lt!299554) vacantSpotIndex!68) (= (select (arr!18445 a!2986) (index!29878 lt!299554)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91221 (= lt!299554 e!370161)))

(declare-fun c!74040 () Bool)

(assert (=> d!91221 (= c!74040 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!91221 (= lt!299553 (select (arr!18445 a!2986) index!984))))

(assert (=> d!91221 (validMask!0 mask!3053)))

(assert (=> d!91221 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18445 a!2986) j!136) a!2986 mask!3053) lt!299554)))

(declare-fun b!645859 () Bool)

(assert (=> b!645859 (= e!370162 (MissingVacant!6885 vacantSpotIndex!68))))

(assert (= (and d!91221 c!74040) b!645858))

(assert (= (and d!91221 (not c!74040)) b!645856))

(assert (= (and b!645856 c!74041) b!645854))

(assert (= (and b!645856 (not c!74041)) b!645857))

(assert (= (and b!645857 c!74042) b!645859))

(assert (= (and b!645857 (not c!74042)) b!645855))

(assert (=> b!645855 m!619259))

(assert (=> b!645855 m!619259))

(assert (=> b!645855 m!619209))

(declare-fun m!619361 () Bool)

(assert (=> b!645855 m!619361))

(declare-fun m!619363 () Bool)

(assert (=> d!91221 m!619363))

(declare-fun m!619365 () Bool)

(assert (=> d!91221 m!619365))

(assert (=> d!91221 m!619227))

(assert (=> d!91221 m!619217))

(assert (=> b!645716 d!91221))

(declare-fun d!91235 () Bool)

(assert (=> d!91235 (arrayNoDuplicates!0 lt!299485 j!136 Nil!12483)))

(declare-fun lt!299557 () Unit!21936)

(declare-fun choose!39 (array!38466 (_ BitVec 32) (_ BitVec 32)) Unit!21936)

(assert (=> d!91235 (= lt!299557 (choose!39 lt!299485 #b00000000000000000000000000000000 j!136))))

(assert (=> d!91235 (bvslt (size!18809 lt!299485) #b01111111111111111111111111111111)))

(assert (=> d!91235 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!299485 #b00000000000000000000000000000000 j!136) lt!299557)))

(declare-fun bs!19294 () Bool)

(assert (= bs!19294 d!91235))

(assert (=> bs!19294 m!619241))

(declare-fun m!619367 () Bool)

(assert (=> bs!19294 m!619367))

(assert (=> b!645715 d!91235))

(declare-fun d!91237 () Bool)

(assert (=> d!91237 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18809 lt!299485)) (not (= (select (arr!18445 lt!299485) j!136) (select (arr!18445 a!2986) j!136))))))

(declare-fun lt!299560 () Unit!21936)

(declare-fun choose!21 (array!38466 (_ BitVec 64) (_ BitVec 32) List!12486) Unit!21936)

(assert (=> d!91237 (= lt!299560 (choose!21 lt!299485 (select (arr!18445 a!2986) j!136) j!136 Nil!12483))))

(assert (=> d!91237 (bvslt (size!18809 lt!299485) #b01111111111111111111111111111111)))

(assert (=> d!91237 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!299485 (select (arr!18445 a!2986) j!136) j!136 Nil!12483) lt!299560)))

(declare-fun bs!19295 () Bool)

(assert (= bs!19295 d!91237))

(declare-fun m!619369 () Bool)

(assert (=> bs!19295 m!619369))

(assert (=> bs!19295 m!619209))

(declare-fun m!619371 () Bool)

(assert (=> bs!19295 m!619371))

(assert (=> b!645715 d!91237))

(declare-fun d!91241 () Bool)

(declare-fun res!418520 () Bool)

(declare-fun e!370176 () Bool)

(assert (=> d!91241 (=> res!418520 e!370176)))

(assert (=> d!91241 (= res!418520 (= (select (arr!18445 lt!299485) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18445 a!2986) j!136)))))

(assert (=> d!91241 (= (arrayContainsKey!0 lt!299485 (select (arr!18445 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!370176)))

(declare-fun b!645872 () Bool)

(declare-fun e!370177 () Bool)

(assert (=> b!645872 (= e!370176 e!370177)))

(declare-fun res!418521 () Bool)

(assert (=> b!645872 (=> (not res!418521) (not e!370177))))

(assert (=> b!645872 (= res!418521 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18809 lt!299485)))))

(declare-fun b!645873 () Bool)

(assert (=> b!645873 (= e!370177 (arrayContainsKey!0 lt!299485 (select (arr!18445 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91241 (not res!418520)) b!645872))

(assert (= (and b!645872 res!418521) b!645873))

(declare-fun m!619377 () Bool)

(assert (=> d!91241 m!619377))

(assert (=> b!645873 m!619209))

(declare-fun m!619379 () Bool)

(assert (=> b!645873 m!619379))

(assert (=> b!645715 d!91241))

(declare-fun b!645874 () Bool)

(declare-fun e!370181 () Bool)

(assert (=> b!645874 (= e!370181 (contains!3148 Nil!12483 (select (arr!18445 lt!299485) j!136)))))

(declare-fun call!33639 () Bool)

(declare-fun bm!33636 () Bool)

(declare-fun c!74043 () Bool)

(assert (=> bm!33636 (= call!33639 (arrayNoDuplicates!0 lt!299485 (bvadd j!136 #b00000000000000000000000000000001) (ite c!74043 (Cons!12482 (select (arr!18445 lt!299485) j!136) Nil!12483) Nil!12483)))))

(declare-fun d!91245 () Bool)

(declare-fun res!418526 () Bool)

(declare-fun e!370182 () Bool)

(assert (=> d!91245 (=> res!418526 e!370182)))

(assert (=> d!91245 (= res!418526 (bvsge j!136 (size!18809 lt!299485)))))

(assert (=> d!91245 (= (arrayNoDuplicates!0 lt!299485 j!136 Nil!12483) e!370182)))

(declare-fun b!645875 () Bool)

(declare-fun e!370183 () Bool)

(assert (=> b!645875 (= e!370183 call!33639)))

(declare-fun b!645876 () Bool)

(declare-fun e!370180 () Bool)

(assert (=> b!645876 (= e!370182 e!370180)))

(declare-fun res!418524 () Bool)

(assert (=> b!645876 (=> (not res!418524) (not e!370180))))

(assert (=> b!645876 (= res!418524 (not e!370181))))

(declare-fun res!418525 () Bool)

(assert (=> b!645876 (=> (not res!418525) (not e!370181))))

(assert (=> b!645876 (= res!418525 (validKeyInArray!0 (select (arr!18445 lt!299485) j!136)))))

(declare-fun b!645877 () Bool)

(assert (=> b!645877 (= e!370180 e!370183)))

(assert (=> b!645877 (= c!74043 (validKeyInArray!0 (select (arr!18445 lt!299485) j!136)))))

(declare-fun b!645878 () Bool)

(assert (=> b!645878 (= e!370183 call!33639)))

(assert (= (and d!91245 (not res!418526)) b!645876))

(assert (= (and b!645876 res!418525) b!645874))

(assert (= (and b!645876 res!418524) b!645877))

(assert (= (and b!645877 c!74043) b!645878))

(assert (= (and b!645877 (not c!74043)) b!645875))

(assert (= (or b!645878 b!645875) bm!33636))

(assert (=> b!645874 m!619369))

(assert (=> b!645874 m!619369))

(declare-fun m!619381 () Bool)

(assert (=> b!645874 m!619381))

(assert (=> bm!33636 m!619369))

(declare-fun m!619383 () Bool)

(assert (=> bm!33636 m!619383))

(assert (=> b!645876 m!619369))

(assert (=> b!645876 m!619369))

(declare-fun m!619385 () Bool)

(assert (=> b!645876 m!619385))

(assert (=> b!645877 m!619369))

(assert (=> b!645877 m!619369))

(assert (=> b!645877 m!619385))

(assert (=> b!645715 d!91245))

(declare-fun d!91247 () Bool)

(declare-fun e!370197 () Bool)

(assert (=> d!91247 e!370197))

(declare-fun res!418537 () Bool)

(assert (=> d!91247 (=> (not res!418537) (not e!370197))))

(assert (=> d!91247 (= res!418537 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18809 a!2986))))))

(declare-fun lt!299566 () Unit!21936)

(declare-fun choose!41 (array!38466 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12486) Unit!21936)

(assert (=> d!91247 (= lt!299566 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12483))))

(assert (=> d!91247 (bvslt (size!18809 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!91247 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12483) lt!299566)))

(declare-fun b!645897 () Bool)

(assert (=> b!645897 (= e!370197 (arrayNoDuplicates!0 (array!38467 (store (arr!18445 a!2986) i!1108 k0!1786) (size!18809 a!2986)) #b00000000000000000000000000000000 Nil!12483))))

(assert (= (and d!91247 res!418537) b!645897))

(declare-fun m!619399 () Bool)

(assert (=> d!91247 m!619399))

(assert (=> b!645897 m!619213))

(declare-fun m!619401 () Bool)

(assert (=> b!645897 m!619401))

(assert (=> b!645715 d!91247))

(declare-fun b!645898 () Bool)

(declare-fun e!370199 () Bool)

(assert (=> b!645898 (= e!370199 (contains!3148 Nil!12483 (select (arr!18445 lt!299485) #b00000000000000000000000000000000)))))

(declare-fun bm!33640 () Bool)

(declare-fun call!33643 () Bool)

(declare-fun c!74047 () Bool)

(assert (=> bm!33640 (= call!33643 (arrayNoDuplicates!0 lt!299485 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74047 (Cons!12482 (select (arr!18445 lt!299485) #b00000000000000000000000000000000) Nil!12483) Nil!12483)))))

(declare-fun d!91257 () Bool)

(declare-fun res!418540 () Bool)

(declare-fun e!370200 () Bool)

(assert (=> d!91257 (=> res!418540 e!370200)))

(assert (=> d!91257 (= res!418540 (bvsge #b00000000000000000000000000000000 (size!18809 lt!299485)))))

(assert (=> d!91257 (= (arrayNoDuplicates!0 lt!299485 #b00000000000000000000000000000000 Nil!12483) e!370200)))

(declare-fun b!645899 () Bool)

(declare-fun e!370201 () Bool)

(assert (=> b!645899 (= e!370201 call!33643)))

(declare-fun b!645900 () Bool)

(declare-fun e!370198 () Bool)

(assert (=> b!645900 (= e!370200 e!370198)))

(declare-fun res!418538 () Bool)

(assert (=> b!645900 (=> (not res!418538) (not e!370198))))

(assert (=> b!645900 (= res!418538 (not e!370199))))

(declare-fun res!418539 () Bool)

(assert (=> b!645900 (=> (not res!418539) (not e!370199))))

(assert (=> b!645900 (= res!418539 (validKeyInArray!0 (select (arr!18445 lt!299485) #b00000000000000000000000000000000)))))

(declare-fun b!645901 () Bool)

(assert (=> b!645901 (= e!370198 e!370201)))

(assert (=> b!645901 (= c!74047 (validKeyInArray!0 (select (arr!18445 lt!299485) #b00000000000000000000000000000000)))))

(declare-fun b!645902 () Bool)

(assert (=> b!645902 (= e!370201 call!33643)))

(assert (= (and d!91257 (not res!418540)) b!645900))

(assert (= (and b!645900 res!418539) b!645898))

(assert (= (and b!645900 res!418538) b!645901))

(assert (= (and b!645901 c!74047) b!645902))

(assert (= (and b!645901 (not c!74047)) b!645899))

(assert (= (or b!645902 b!645899) bm!33640))

(declare-fun m!619405 () Bool)

(assert (=> b!645898 m!619405))

(assert (=> b!645898 m!619405))

(declare-fun m!619407 () Bool)

(assert (=> b!645898 m!619407))

(assert (=> bm!33640 m!619405))

(declare-fun m!619409 () Bool)

(assert (=> bm!33640 m!619409))

(assert (=> b!645900 m!619405))

(assert (=> b!645900 m!619405))

(declare-fun m!619411 () Bool)

(assert (=> b!645900 m!619411))

(assert (=> b!645901 m!619405))

(assert (=> b!645901 m!619405))

(assert (=> b!645901 m!619411))

(assert (=> b!645715 d!91257))

(declare-fun d!91261 () Bool)

(assert (=> d!91261 (arrayContainsKey!0 lt!299485 (select (arr!18445 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!299572 () Unit!21936)

(declare-fun choose!114 (array!38466 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21936)

(assert (=> d!91261 (= lt!299572 (choose!114 lt!299485 (select (arr!18445 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!91261 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!91261 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299485 (select (arr!18445 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!299572)))

(declare-fun bs!19297 () Bool)

(assert (= bs!19297 d!91261))

(assert (=> bs!19297 m!619209))

(assert (=> bs!19297 m!619251))

(assert (=> bs!19297 m!619209))

(declare-fun m!619413 () Bool)

(assert (=> bs!19297 m!619413))

(assert (=> b!645715 d!91261))

(declare-fun d!91263 () Bool)

(declare-fun e!370230 () Bool)

(assert (=> d!91263 e!370230))

(declare-fun res!418545 () Bool)

(assert (=> d!91263 (=> (not res!418545) (not e!370230))))

(assert (=> d!91263 (= res!418545 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18809 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18809 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18809 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18809 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18809 a!2986))))))

(declare-fun lt!299597 () Unit!21936)

(declare-fun choose!9 (array!38466 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21936)

(assert (=> d!91263 (= lt!299597 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!299496 vacantSpotIndex!68 mask!3053))))

(assert (=> d!91263 (validMask!0 mask!3053)))

(assert (=> d!91263 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!299496 vacantSpotIndex!68 mask!3053) lt!299597)))

(declare-fun b!645955 () Bool)

(assert (=> b!645955 (= e!370230 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299496 vacantSpotIndex!68 (select (arr!18445 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299496 vacantSpotIndex!68 (select (store (arr!18445 a!2986) i!1108 k0!1786) j!136) (array!38467 (store (arr!18445 a!2986) i!1108 k0!1786) (size!18809 a!2986)) mask!3053)))))

(assert (= (and d!91263 res!418545) b!645955))

(declare-fun m!619453 () Bool)

(assert (=> d!91263 m!619453))

(assert (=> d!91263 m!619217))

(assert (=> b!645955 m!619213))

(assert (=> b!645955 m!619261))

(declare-fun m!619455 () Bool)

(assert (=> b!645955 m!619455))

(assert (=> b!645955 m!619209))

(assert (=> b!645955 m!619261))

(assert (=> b!645955 m!619209))

(assert (=> b!645955 m!619263))

(assert (=> b!645724 d!91263))

(declare-fun d!91279 () Bool)

(declare-fun lt!299603 () (_ BitVec 32))

(assert (=> d!91279 (and (bvsge lt!299603 #b00000000000000000000000000000000) (bvslt lt!299603 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91279 (= lt!299603 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!91279 (validMask!0 mask!3053)))

(assert (=> d!91279 (= (nextIndex!0 index!984 x!910 mask!3053) lt!299603)))

(declare-fun bs!19301 () Bool)

(assert (= bs!19301 d!91279))

(declare-fun m!619465 () Bool)

(assert (=> bs!19301 m!619465))

(assert (=> bs!19301 m!619217))

(assert (=> b!645724 d!91279))

(declare-fun b!645961 () Bool)

(declare-fun e!370237 () SeekEntryResult!6885)

(assert (=> b!645961 (= e!370237 (Found!6885 lt!299496))))

(declare-fun e!370236 () SeekEntryResult!6885)

(declare-fun b!645962 () Bool)

(assert (=> b!645962 (= e!370236 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!299496 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18445 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!645963 () Bool)

(declare-fun e!370235 () SeekEntryResult!6885)

(assert (=> b!645963 (= e!370235 e!370237)))

(declare-fun lt!299604 () (_ BitVec 64))

(declare-fun c!74074 () Bool)

(assert (=> b!645963 (= c!74074 (= lt!299604 (select (arr!18445 a!2986) j!136)))))

(declare-fun b!645964 () Bool)

(declare-fun c!74075 () Bool)

(assert (=> b!645964 (= c!74075 (= lt!299604 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!645964 (= e!370237 e!370236)))

(declare-fun b!645965 () Bool)

(assert (=> b!645965 (= e!370235 Undefined!6885)))

(declare-fun lt!299605 () SeekEntryResult!6885)

(declare-fun d!91285 () Bool)

(assert (=> d!91285 (and (or ((_ is Undefined!6885) lt!299605) (not ((_ is Found!6885) lt!299605)) (and (bvsge (index!29876 lt!299605) #b00000000000000000000000000000000) (bvslt (index!29876 lt!299605) (size!18809 a!2986)))) (or ((_ is Undefined!6885) lt!299605) ((_ is Found!6885) lt!299605) (not ((_ is MissingVacant!6885) lt!299605)) (not (= (index!29878 lt!299605) vacantSpotIndex!68)) (and (bvsge (index!29878 lt!299605) #b00000000000000000000000000000000) (bvslt (index!29878 lt!299605) (size!18809 a!2986)))) (or ((_ is Undefined!6885) lt!299605) (ite ((_ is Found!6885) lt!299605) (= (select (arr!18445 a!2986) (index!29876 lt!299605)) (select (arr!18445 a!2986) j!136)) (and ((_ is MissingVacant!6885) lt!299605) (= (index!29878 lt!299605) vacantSpotIndex!68) (= (select (arr!18445 a!2986) (index!29878 lt!299605)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91285 (= lt!299605 e!370235)))

(declare-fun c!74073 () Bool)

(assert (=> d!91285 (= c!74073 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!91285 (= lt!299604 (select (arr!18445 a!2986) lt!299496))))

(assert (=> d!91285 (validMask!0 mask!3053)))

(assert (=> d!91285 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299496 vacantSpotIndex!68 (select (arr!18445 a!2986) j!136) a!2986 mask!3053) lt!299605)))

(declare-fun b!645966 () Bool)

(assert (=> b!645966 (= e!370236 (MissingVacant!6885 vacantSpotIndex!68))))

(assert (= (and d!91285 c!74073) b!645965))

(assert (= (and d!91285 (not c!74073)) b!645963))

(assert (= (and b!645963 c!74074) b!645961))

(assert (= (and b!645963 (not c!74074)) b!645964))

(assert (= (and b!645964 c!74075) b!645966))

(assert (= (and b!645964 (not c!74075)) b!645962))

(declare-fun m!619467 () Bool)

(assert (=> b!645962 m!619467))

(assert (=> b!645962 m!619467))

(assert (=> b!645962 m!619209))

(declare-fun m!619469 () Bool)

(assert (=> b!645962 m!619469))

(declare-fun m!619471 () Bool)

(assert (=> d!91285 m!619471))

(declare-fun m!619473 () Bool)

(assert (=> d!91285 m!619473))

(declare-fun m!619475 () Bool)

(assert (=> d!91285 m!619475))

(assert (=> d!91285 m!619217))

(assert (=> b!645724 d!91285))

(declare-fun b!645967 () Bool)

(declare-fun e!370242 () SeekEntryResult!6885)

(assert (=> b!645967 (= e!370242 (Found!6885 lt!299496))))

(declare-fun e!370241 () SeekEntryResult!6885)

(declare-fun b!645968 () Bool)

(assert (=> b!645968 (= e!370241 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!299496 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!299491 lt!299485 mask!3053))))

(declare-fun b!645969 () Bool)

(declare-fun e!370240 () SeekEntryResult!6885)

(assert (=> b!645969 (= e!370240 e!370242)))

(declare-fun c!74077 () Bool)

(declare-fun lt!299608 () (_ BitVec 64))

(assert (=> b!645969 (= c!74077 (= lt!299608 lt!299491))))

(declare-fun b!645970 () Bool)

(declare-fun c!74078 () Bool)

(assert (=> b!645970 (= c!74078 (= lt!299608 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!645970 (= e!370242 e!370241)))

(declare-fun b!645971 () Bool)

(assert (=> b!645971 (= e!370240 Undefined!6885)))

(declare-fun lt!299609 () SeekEntryResult!6885)

(declare-fun d!91287 () Bool)

(assert (=> d!91287 (and (or ((_ is Undefined!6885) lt!299609) (not ((_ is Found!6885) lt!299609)) (and (bvsge (index!29876 lt!299609) #b00000000000000000000000000000000) (bvslt (index!29876 lt!299609) (size!18809 lt!299485)))) (or ((_ is Undefined!6885) lt!299609) ((_ is Found!6885) lt!299609) (not ((_ is MissingVacant!6885) lt!299609)) (not (= (index!29878 lt!299609) vacantSpotIndex!68)) (and (bvsge (index!29878 lt!299609) #b00000000000000000000000000000000) (bvslt (index!29878 lt!299609) (size!18809 lt!299485)))) (or ((_ is Undefined!6885) lt!299609) (ite ((_ is Found!6885) lt!299609) (= (select (arr!18445 lt!299485) (index!29876 lt!299609)) lt!299491) (and ((_ is MissingVacant!6885) lt!299609) (= (index!29878 lt!299609) vacantSpotIndex!68) (= (select (arr!18445 lt!299485) (index!29878 lt!299609)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91287 (= lt!299609 e!370240)))

(declare-fun c!74076 () Bool)

(assert (=> d!91287 (= c!74076 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!91287 (= lt!299608 (select (arr!18445 lt!299485) lt!299496))))

(assert (=> d!91287 (validMask!0 mask!3053)))

(assert (=> d!91287 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299496 vacantSpotIndex!68 lt!299491 lt!299485 mask!3053) lt!299609)))

(declare-fun b!645972 () Bool)

(assert (=> b!645972 (= e!370241 (MissingVacant!6885 vacantSpotIndex!68))))

(assert (= (and d!91287 c!74076) b!645971))

(assert (= (and d!91287 (not c!74076)) b!645969))

(assert (= (and b!645969 c!74077) b!645967))

(assert (= (and b!645969 (not c!74077)) b!645970))

(assert (= (and b!645970 c!74078) b!645972))

(assert (= (and b!645970 (not c!74078)) b!645968))

(assert (=> b!645968 m!619467))

(assert (=> b!645968 m!619467))

(declare-fun m!619477 () Bool)

(assert (=> b!645968 m!619477))

(declare-fun m!619479 () Bool)

(assert (=> d!91287 m!619479))

(declare-fun m!619481 () Bool)

(assert (=> d!91287 m!619481))

(declare-fun m!619483 () Bool)

(assert (=> d!91287 m!619483))

(assert (=> d!91287 m!619217))

(assert (=> b!645724 d!91287))

(declare-fun b!645975 () Bool)

(declare-fun e!370245 () SeekEntryResult!6885)

(assert (=> b!645975 (= e!370245 (Found!6885 index!984))))

(declare-fun e!370244 () SeekEntryResult!6885)

(declare-fun b!645976 () Bool)

(assert (=> b!645976 (= e!370244 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!299491 lt!299485 mask!3053))))

(declare-fun b!645977 () Bool)

(declare-fun e!370243 () SeekEntryResult!6885)

(assert (=> b!645977 (= e!370243 e!370245)))

(declare-fun c!74080 () Bool)

(declare-fun lt!299610 () (_ BitVec 64))

(assert (=> b!645977 (= c!74080 (= lt!299610 lt!299491))))

(declare-fun b!645978 () Bool)

(declare-fun c!74081 () Bool)

(assert (=> b!645978 (= c!74081 (= lt!299610 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!645978 (= e!370245 e!370244)))

(declare-fun b!645979 () Bool)

(assert (=> b!645979 (= e!370243 Undefined!6885)))

(declare-fun d!91289 () Bool)

(declare-fun lt!299611 () SeekEntryResult!6885)

(assert (=> d!91289 (and (or ((_ is Undefined!6885) lt!299611) (not ((_ is Found!6885) lt!299611)) (and (bvsge (index!29876 lt!299611) #b00000000000000000000000000000000) (bvslt (index!29876 lt!299611) (size!18809 lt!299485)))) (or ((_ is Undefined!6885) lt!299611) ((_ is Found!6885) lt!299611) (not ((_ is MissingVacant!6885) lt!299611)) (not (= (index!29878 lt!299611) vacantSpotIndex!68)) (and (bvsge (index!29878 lt!299611) #b00000000000000000000000000000000) (bvslt (index!29878 lt!299611) (size!18809 lt!299485)))) (or ((_ is Undefined!6885) lt!299611) (ite ((_ is Found!6885) lt!299611) (= (select (arr!18445 lt!299485) (index!29876 lt!299611)) lt!299491) (and ((_ is MissingVacant!6885) lt!299611) (= (index!29878 lt!299611) vacantSpotIndex!68) (= (select (arr!18445 lt!299485) (index!29878 lt!299611)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91289 (= lt!299611 e!370243)))

(declare-fun c!74079 () Bool)

(assert (=> d!91289 (= c!74079 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!91289 (= lt!299610 (select (arr!18445 lt!299485) index!984))))

(assert (=> d!91289 (validMask!0 mask!3053)))

(assert (=> d!91289 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!299491 lt!299485 mask!3053) lt!299611)))

(declare-fun b!645980 () Bool)

(assert (=> b!645980 (= e!370244 (MissingVacant!6885 vacantSpotIndex!68))))

(assert (= (and d!91289 c!74079) b!645979))

(assert (= (and d!91289 (not c!74079)) b!645977))

(assert (= (and b!645977 c!74080) b!645975))

(assert (= (and b!645977 (not c!74080)) b!645978))

(assert (= (and b!645978 c!74081) b!645980))

(assert (= (and b!645978 (not c!74081)) b!645976))

(assert (=> b!645976 m!619259))

(assert (=> b!645976 m!619259))

(declare-fun m!619489 () Bool)

(assert (=> b!645976 m!619489))

(declare-fun m!619491 () Bool)

(assert (=> d!91289 m!619491))

(declare-fun m!619493 () Bool)

(assert (=> d!91289 m!619493))

(declare-fun m!619495 () Bool)

(assert (=> d!91289 m!619495))

(assert (=> d!91289 m!619217))

(assert (=> b!645724 d!91289))

(declare-fun d!91293 () Bool)

(assert (=> d!91293 (= (validKeyInArray!0 (select (arr!18445 a!2986) j!136)) (and (not (= (select (arr!18445 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18445 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!645734 d!91293))

(declare-fun d!91295 () Bool)

(declare-fun res!418554 () Bool)

(declare-fun e!370249 () Bool)

(assert (=> d!91295 (=> res!418554 e!370249)))

(assert (=> d!91295 (= res!418554 (= (select (arr!18445 lt!299485) index!984) (select (arr!18445 a!2986) j!136)))))

(assert (=> d!91295 (= (arrayContainsKey!0 lt!299485 (select (arr!18445 a!2986) j!136) index!984) e!370249)))

(declare-fun b!645984 () Bool)

(declare-fun e!370250 () Bool)

(assert (=> b!645984 (= e!370249 e!370250)))

(declare-fun res!418555 () Bool)

(assert (=> b!645984 (=> (not res!418555) (not e!370250))))

(assert (=> b!645984 (= res!418555 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18809 lt!299485)))))

(declare-fun b!645985 () Bool)

(assert (=> b!645985 (= e!370250 (arrayContainsKey!0 lt!299485 (select (arr!18445 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91295 (not res!418554)) b!645984))

(assert (= (and b!645984 res!418555) b!645985))

(assert (=> d!91295 m!619495))

(assert (=> b!645985 m!619209))

(declare-fun m!619497 () Bool)

(assert (=> b!645985 m!619497))

(assert (=> b!645723 d!91295))

(declare-fun b!646063 () Bool)

(declare-fun e!370306 () SeekEntryResult!6885)

(declare-fun lt!299657 () SeekEntryResult!6885)

(assert (=> b!646063 (= e!370306 (MissingZero!6885 (index!29877 lt!299657)))))

(declare-fun d!91297 () Bool)

(declare-fun lt!299656 () SeekEntryResult!6885)

(assert (=> d!91297 (and (or ((_ is Undefined!6885) lt!299656) (not ((_ is Found!6885) lt!299656)) (and (bvsge (index!29876 lt!299656) #b00000000000000000000000000000000) (bvslt (index!29876 lt!299656) (size!18809 a!2986)))) (or ((_ is Undefined!6885) lt!299656) ((_ is Found!6885) lt!299656) (not ((_ is MissingZero!6885) lt!299656)) (and (bvsge (index!29875 lt!299656) #b00000000000000000000000000000000) (bvslt (index!29875 lt!299656) (size!18809 a!2986)))) (or ((_ is Undefined!6885) lt!299656) ((_ is Found!6885) lt!299656) ((_ is MissingZero!6885) lt!299656) (not ((_ is MissingVacant!6885) lt!299656)) (and (bvsge (index!29878 lt!299656) #b00000000000000000000000000000000) (bvslt (index!29878 lt!299656) (size!18809 a!2986)))) (or ((_ is Undefined!6885) lt!299656) (ite ((_ is Found!6885) lt!299656) (= (select (arr!18445 a!2986) (index!29876 lt!299656)) k0!1786) (ite ((_ is MissingZero!6885) lt!299656) (= (select (arr!18445 a!2986) (index!29875 lt!299656)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6885) lt!299656) (= (select (arr!18445 a!2986) (index!29878 lt!299656)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!370305 () SeekEntryResult!6885)

(assert (=> d!91297 (= lt!299656 e!370305)))

(declare-fun c!74108 () Bool)

(assert (=> d!91297 (= c!74108 (and ((_ is Intermediate!6885) lt!299657) (undefined!7697 lt!299657)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38466 (_ BitVec 32)) SeekEntryResult!6885)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91297 (= lt!299657 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!91297 (validMask!0 mask!3053)))

(assert (=> d!91297 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!299656)))

(declare-fun b!646064 () Bool)

(assert (=> b!646064 (= e!370306 (seekKeyOrZeroReturnVacant!0 (x!58646 lt!299657) (index!29877 lt!299657) (index!29877 lt!299657) k0!1786 a!2986 mask!3053))))

(declare-fun b!646065 () Bool)

(declare-fun e!370304 () SeekEntryResult!6885)

(assert (=> b!646065 (= e!370304 (Found!6885 (index!29877 lt!299657)))))

(declare-fun b!646066 () Bool)

(assert (=> b!646066 (= e!370305 e!370304)))

(declare-fun lt!299658 () (_ BitVec 64))

(assert (=> b!646066 (= lt!299658 (select (arr!18445 a!2986) (index!29877 lt!299657)))))

(declare-fun c!74106 () Bool)

(assert (=> b!646066 (= c!74106 (= lt!299658 k0!1786))))

(declare-fun b!646067 () Bool)

(assert (=> b!646067 (= e!370305 Undefined!6885)))

(declare-fun b!646068 () Bool)

(declare-fun c!74107 () Bool)

(assert (=> b!646068 (= c!74107 (= lt!299658 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!646068 (= e!370304 e!370306)))

(assert (= (and d!91297 c!74108) b!646067))

(assert (= (and d!91297 (not c!74108)) b!646066))

(assert (= (and b!646066 c!74106) b!646065))

(assert (= (and b!646066 (not c!74106)) b!646068))

(assert (= (and b!646068 c!74107) b!646063))

(assert (= (and b!646068 (not c!74107)) b!646064))

(declare-fun m!619597 () Bool)

(assert (=> d!91297 m!619597))

(declare-fun m!619599 () Bool)

(assert (=> d!91297 m!619599))

(declare-fun m!619601 () Bool)

(assert (=> d!91297 m!619601))

(declare-fun m!619603 () Bool)

(assert (=> d!91297 m!619603))

(declare-fun m!619605 () Bool)

(assert (=> d!91297 m!619605))

(assert (=> d!91297 m!619217))

(assert (=> d!91297 m!619597))

(declare-fun m!619607 () Bool)

(assert (=> b!646064 m!619607))

(declare-fun m!619609 () Bool)

(assert (=> b!646066 m!619609))

(assert (=> b!645712 d!91297))

(declare-fun d!91345 () Bool)

(assert (=> d!91345 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!58450 d!91345))

(declare-fun d!91351 () Bool)

(assert (=> d!91351 (= (array_inv!14241 a!2986) (bvsge (size!18809 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!58450 d!91351))

(declare-fun d!91353 () Bool)

(declare-fun res!418585 () Bool)

(declare-fun e!370307 () Bool)

(assert (=> d!91353 (=> res!418585 e!370307)))

(assert (=> d!91353 (= res!418585 (= (select (arr!18445 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!91353 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!370307)))

(declare-fun b!646069 () Bool)

(declare-fun e!370308 () Bool)

(assert (=> b!646069 (= e!370307 e!370308)))

(declare-fun res!418586 () Bool)

(assert (=> b!646069 (=> (not res!418586) (not e!370308))))

(assert (=> b!646069 (= res!418586 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18809 a!2986)))))

(declare-fun b!646070 () Bool)

(assert (=> b!646070 (= e!370308 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!91353 (not res!418585)) b!646069))

(assert (= (and b!646069 res!418586) b!646070))

(assert (=> d!91353 m!619337))

(declare-fun m!619611 () Bool)

(assert (=> b!646070 m!619611))

(assert (=> b!645722 d!91353))

(assert (=> b!645721 d!91295))

(declare-fun bm!33650 () Bool)

(declare-fun call!33653 () Bool)

(assert (=> bm!33650 (= call!33653 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!646111 () Bool)

(declare-fun e!370333 () Bool)

(assert (=> b!646111 (= e!370333 call!33653)))

(declare-fun b!646112 () Bool)

(declare-fun e!370334 () Bool)

(assert (=> b!646112 (= e!370333 e!370334)))

(declare-fun lt!299680 () (_ BitVec 64))

(assert (=> b!646112 (= lt!299680 (select (arr!18445 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!299681 () Unit!21936)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38466 (_ BitVec 64) (_ BitVec 32)) Unit!21936)

(assert (=> b!646112 (= lt!299681 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!299680 #b00000000000000000000000000000000))))

(assert (=> b!646112 (arrayContainsKey!0 a!2986 lt!299680 #b00000000000000000000000000000000)))

(declare-fun lt!299682 () Unit!21936)

(assert (=> b!646112 (= lt!299682 lt!299681)))

(declare-fun res!418594 () Bool)

(assert (=> b!646112 (= res!418594 (= (seekEntryOrOpen!0 (select (arr!18445 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6885 #b00000000000000000000000000000000)))))

(assert (=> b!646112 (=> (not res!418594) (not e!370334))))

(declare-fun b!646113 () Bool)

(assert (=> b!646113 (= e!370334 call!33653)))

(declare-fun b!646114 () Bool)

(declare-fun e!370332 () Bool)

(assert (=> b!646114 (= e!370332 e!370333)))

(declare-fun c!74126 () Bool)

(assert (=> b!646114 (= c!74126 (validKeyInArray!0 (select (arr!18445 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!91355 () Bool)

(declare-fun res!418593 () Bool)

(assert (=> d!91355 (=> res!418593 e!370332)))

(assert (=> d!91355 (= res!418593 (bvsge #b00000000000000000000000000000000 (size!18809 a!2986)))))

(assert (=> d!91355 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!370332)))

(assert (= (and d!91355 (not res!418593)) b!646114))

(assert (= (and b!646114 c!74126) b!646112))

(assert (= (and b!646114 (not c!74126)) b!646111))

(assert (= (and b!646112 res!418594) b!646113))

(assert (= (or b!646113 b!646111) bm!33650))

(declare-fun m!619629 () Bool)

(assert (=> bm!33650 m!619629))

(assert (=> b!646112 m!619337))

(declare-fun m!619631 () Bool)

(assert (=> b!646112 m!619631))

(declare-fun m!619633 () Bool)

(assert (=> b!646112 m!619633))

(assert (=> b!646112 m!619337))

(declare-fun m!619635 () Bool)

(assert (=> b!646112 m!619635))

(assert (=> b!646114 m!619337))

(assert (=> b!646114 m!619337))

(assert (=> b!646114 m!619343))

(assert (=> b!645731 d!91355))

(declare-fun d!91359 () Bool)

(declare-fun res!418595 () Bool)

(declare-fun e!370335 () Bool)

(assert (=> d!91359 (=> res!418595 e!370335)))

(assert (=> d!91359 (= res!418595 (= (select (arr!18445 lt!299485) j!136) (select (arr!18445 a!2986) j!136)))))

(assert (=> d!91359 (= (arrayContainsKey!0 lt!299485 (select (arr!18445 a!2986) j!136) j!136) e!370335)))

(declare-fun b!646115 () Bool)

(declare-fun e!370336 () Bool)

(assert (=> b!646115 (= e!370335 e!370336)))

(declare-fun res!418596 () Bool)

(assert (=> b!646115 (=> (not res!418596) (not e!370336))))

(assert (=> b!646115 (= res!418596 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18809 lt!299485)))))

(declare-fun b!646116 () Bool)

(assert (=> b!646116 (= e!370336 (arrayContainsKey!0 lt!299485 (select (arr!18445 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91359 (not res!418595)) b!646115))

(assert (= (and b!646115 res!418596) b!646116))

(assert (=> d!91359 m!619369))

(assert (=> b!646116 m!619209))

(declare-fun m!619637 () Bool)

(assert (=> b!646116 m!619637))

(assert (=> b!645730 d!91359))

(declare-fun d!91361 () Bool)

(declare-fun res!418597 () Bool)

(declare-fun e!370337 () Bool)

(assert (=> d!91361 (=> res!418597 e!370337)))

(assert (=> d!91361 (= res!418597 (= (select (arr!18445 lt!299485) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18445 a!2986) j!136)))))

(assert (=> d!91361 (= (arrayContainsKey!0 lt!299485 (select (arr!18445 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!370337)))

(declare-fun b!646117 () Bool)

(declare-fun e!370338 () Bool)

(assert (=> b!646117 (= e!370337 e!370338)))

(declare-fun res!418598 () Bool)

(assert (=> b!646117 (=> (not res!418598) (not e!370338))))

(assert (=> b!646117 (= res!418598 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18809 lt!299485)))))

(declare-fun b!646118 () Bool)

(assert (=> b!646118 (= e!370338 (arrayContainsKey!0 lt!299485 (select (arr!18445 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91361 (not res!418597)) b!646117))

(assert (= (and b!646117 res!418598) b!646118))

(declare-fun m!619639 () Bool)

(assert (=> d!91361 m!619639))

(assert (=> b!646118 m!619209))

(declare-fun m!619641 () Bool)

(assert (=> b!646118 m!619641))

(assert (=> b!645719 d!91361))

(declare-fun d!91363 () Bool)

(assert (=> d!91363 (arrayContainsKey!0 lt!299485 (select (arr!18445 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!299683 () Unit!21936)

(assert (=> d!91363 (= lt!299683 (choose!114 lt!299485 (select (arr!18445 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!91363 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!91363 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299485 (select (arr!18445 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!299683)))

(declare-fun bs!19308 () Bool)

(assert (= bs!19308 d!91363))

(assert (=> bs!19308 m!619209))

(assert (=> bs!19308 m!619223))

(assert (=> bs!19308 m!619209))

(declare-fun m!619643 () Bool)

(assert (=> bs!19308 m!619643))

(assert (=> b!645719 d!91363))

(assert (=> b!645719 d!91359))

(check-sat (not d!91285) (not b!646116) (not b!646114) (not bm!33640) (not b!645876) (not b!645976) (not b!646112) (not b!645814) (not b!646070) (not b!646118) (not d!91261) (not d!91263) (not b!645901) (not b!645898) (not b!645985) (not b!645962) (not b!645873) (not d!91235) (not b!645855) (not b!645816) (not b!645877) (not b!645968) (not b!645900) (not d!91279) (not b!646064) (not b!645897) (not b!645874) (not d!91289) (not b!645817) (not d!91287) (not d!91247) (not d!91237) (not bm!33632) (not d!91297) (not bm!33636) (not d!91221) (not b!645955) (not d!91363) (not bm!33650))
(check-sat)

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57506 () Bool)

(assert start!57506)

(declare-fun b!636027 () Bool)

(declare-fun e!363827 () Bool)

(declare-fun e!363829 () Bool)

(assert (=> b!636027 (= e!363827 e!363829)))

(declare-fun res!411531 () Bool)

(assert (=> b!636027 (=> res!411531 e!363829)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!293992 () (_ BitVec 64))

(declare-fun lt!293985 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38238 0))(
  ( (array!38239 (arr!18344 (Array (_ BitVec 32) (_ BitVec 64))) (size!18709 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38238)

(assert (=> b!636027 (= res!411531 (or (not (= (select (arr!18344 a!2986) j!136) lt!293992)) (not (= (select (arr!18344 a!2986) j!136) lt!293985)) (bvsge j!136 index!984)))))

(declare-fun b!636028 () Bool)

(declare-fun e!363834 () Bool)

(declare-datatypes ((SeekEntryResult!6781 0))(
  ( (MissingZero!6781 (index!29432 (_ BitVec 32))) (Found!6781 (index!29433 (_ BitVec 32))) (Intermediate!6781 (undefined!7593 Bool) (index!29434 (_ BitVec 32)) (x!58192 (_ BitVec 32))) (Undefined!6781) (MissingVacant!6781 (index!29435 (_ BitVec 32))) )
))
(declare-fun lt!293993 () SeekEntryResult!6781)

(declare-fun lt!293984 () SeekEntryResult!6781)

(assert (=> b!636028 (= e!363834 (= lt!293993 lt!293984))))

(declare-fun b!636029 () Bool)

(declare-datatypes ((Unit!21452 0))(
  ( (Unit!21453) )
))
(declare-fun e!363832 () Unit!21452)

(declare-fun Unit!21454 () Unit!21452)

(assert (=> b!636029 (= e!363832 Unit!21454)))

(declare-fun b!636030 () Bool)

(declare-fun Unit!21455 () Unit!21452)

(assert (=> b!636030 (= e!363832 Unit!21455)))

(assert (=> b!636030 false))

(declare-fun b!636031 () Bool)

(declare-fun res!411548 () Bool)

(declare-fun e!363830 () Bool)

(assert (=> b!636031 (=> (not res!411548) (not e!363830))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!636031 (= res!411548 (and (= (size!18709 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18709 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18709 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!636032 () Bool)

(declare-fun res!411538 () Bool)

(declare-fun e!363828 () Bool)

(assert (=> b!636032 (=> (not res!411538) (not e!363828))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38238 (_ BitVec 32)) Bool)

(assert (=> b!636032 (= res!411538 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!636034 () Bool)

(declare-fun e!363825 () Bool)

(declare-fun e!363836 () Bool)

(assert (=> b!636034 (= e!363825 (not e!363836))))

(declare-fun res!411544 () Bool)

(assert (=> b!636034 (=> res!411544 e!363836)))

(declare-fun lt!293988 () SeekEntryResult!6781)

(assert (=> b!636034 (= res!411544 (not (= lt!293988 (Found!6781 index!984))))))

(declare-fun lt!293989 () Unit!21452)

(assert (=> b!636034 (= lt!293989 e!363832)))

(declare-fun c!72615 () Bool)

(assert (=> b!636034 (= c!72615 (= lt!293988 Undefined!6781))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!293986 () array!38238)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38238 (_ BitVec 32)) SeekEntryResult!6781)

(assert (=> b!636034 (= lt!293988 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293992 lt!293986 mask!3053))))

(assert (=> b!636034 e!363834))

(declare-fun res!411541 () Bool)

(assert (=> b!636034 (=> (not res!411541) (not e!363834))))

(declare-fun lt!293990 () (_ BitVec 32))

(assert (=> b!636034 (= res!411541 (= lt!293984 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293990 vacantSpotIndex!68 lt!293992 lt!293986 mask!3053)))))

(assert (=> b!636034 (= lt!293984 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293990 vacantSpotIndex!68 (select (arr!18344 a!2986) j!136) a!2986 mask!3053))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!636034 (= lt!293992 (select (store (arr!18344 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!293987 () Unit!21452)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38238 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21452)

(assert (=> b!636034 (= lt!293987 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293990 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!636034 (= lt!293990 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!636035 () Bool)

(declare-fun e!363826 () Bool)

(assert (=> b!636035 (= e!363828 e!363826)))

(declare-fun res!411545 () Bool)

(assert (=> b!636035 (=> (not res!411545) (not e!363826))))

(assert (=> b!636035 (= res!411545 (= (select (store (arr!18344 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!636035 (= lt!293986 (array!38239 (store (arr!18344 a!2986) i!1108 k0!1786) (size!18709 a!2986)))))

(declare-fun b!636036 () Bool)

(declare-fun res!411543 () Bool)

(assert (=> b!636036 (=> (not res!411543) (not e!363830))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!636036 (= res!411543 (validKeyInArray!0 k0!1786))))

(declare-fun b!636037 () Bool)

(declare-fun e!363831 () Bool)

(assert (=> b!636037 (= e!363829 e!363831)))

(declare-fun res!411539 () Bool)

(assert (=> b!636037 (=> (not res!411539) (not e!363831))))

(declare-fun arrayContainsKey!0 (array!38238 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!636037 (= res!411539 (arrayContainsKey!0 lt!293986 (select (arr!18344 a!2986) j!136) j!136))))

(declare-fun b!636038 () Bool)

(declare-fun e!363835 () Bool)

(declare-fun e!363823 () Bool)

(assert (=> b!636038 (= e!363835 e!363823)))

(declare-fun res!411532 () Bool)

(assert (=> b!636038 (=> (not res!411532) (not e!363823))))

(declare-datatypes ((List!12424 0))(
  ( (Nil!12421) (Cons!12420 (h!13465 (_ BitVec 64)) (t!18643 List!12424)) )
))
(declare-fun contains!3084 (List!12424 (_ BitVec 64)) Bool)

(assert (=> b!636038 (= res!411532 (not (contains!3084 Nil!12421 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!636039 () Bool)

(declare-fun res!411550 () Bool)

(assert (=> b!636039 (=> res!411550 e!363835)))

(declare-fun noDuplicate!383 (List!12424) Bool)

(assert (=> b!636039 (= res!411550 (not (noDuplicate!383 Nil!12421)))))

(declare-fun b!636040 () Bool)

(assert (=> b!636040 (= e!363823 (not (contains!3084 Nil!12421 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!636041 () Bool)

(assert (=> b!636041 (= e!363831 (arrayContainsKey!0 lt!293986 (select (arr!18344 a!2986) j!136) index!984))))

(declare-fun b!636042 () Bool)

(declare-fun res!411537 () Bool)

(assert (=> b!636042 (=> (not res!411537) (not e!363830))))

(assert (=> b!636042 (= res!411537 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!636043 () Bool)

(declare-fun e!363833 () Bool)

(assert (=> b!636043 (= e!363833 e!363835)))

(declare-fun res!411547 () Bool)

(assert (=> b!636043 (=> res!411547 e!363835)))

(assert (=> b!636043 (= res!411547 (or (bvsge (size!18709 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18709 a!2986))))))

(assert (=> b!636043 (arrayContainsKey!0 lt!293986 (select (arr!18344 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!293994 () Unit!21452)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38238 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21452)

(assert (=> b!636043 (= lt!293994 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!293986 (select (arr!18344 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!636044 () Bool)

(assert (=> b!636044 (= e!363826 e!363825)))

(declare-fun res!411534 () Bool)

(assert (=> b!636044 (=> (not res!411534) (not e!363825))))

(assert (=> b!636044 (= res!411534 (and (= lt!293993 (Found!6781 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18344 a!2986) index!984) (select (arr!18344 a!2986) j!136))) (not (= (select (arr!18344 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!636044 (= lt!293993 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18344 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!636033 () Bool)

(declare-fun res!411549 () Bool)

(assert (=> b!636033 (=> (not res!411549) (not e!363828))))

(assert (=> b!636033 (= res!411549 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18344 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!411536 () Bool)

(assert (=> start!57506 (=> (not res!411536) (not e!363830))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57506 (= res!411536 (validMask!0 mask!3053))))

(assert (=> start!57506 e!363830))

(assert (=> start!57506 true))

(declare-fun array_inv!14227 (array!38238) Bool)

(assert (=> start!57506 (array_inv!14227 a!2986)))

(declare-fun b!636045 () Bool)

(declare-fun res!411535 () Bool)

(assert (=> b!636045 (=> (not res!411535) (not e!363830))))

(assert (=> b!636045 (= res!411535 (validKeyInArray!0 (select (arr!18344 a!2986) j!136)))))

(declare-fun b!636046 () Bool)

(assert (=> b!636046 (= e!363830 e!363828)))

(declare-fun res!411542 () Bool)

(assert (=> b!636046 (=> (not res!411542) (not e!363828))))

(declare-fun lt!293991 () SeekEntryResult!6781)

(assert (=> b!636046 (= res!411542 (or (= lt!293991 (MissingZero!6781 i!1108)) (= lt!293991 (MissingVacant!6781 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38238 (_ BitVec 32)) SeekEntryResult!6781)

(assert (=> b!636046 (= lt!293991 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!636047 () Bool)

(assert (=> b!636047 (= e!363836 e!363833)))

(declare-fun res!411540 () Bool)

(assert (=> b!636047 (=> res!411540 e!363833)))

(assert (=> b!636047 (= res!411540 (or (not (= (select (arr!18344 a!2986) j!136) lt!293992)) (not (= (select (arr!18344 a!2986) j!136) lt!293985)) (bvsge j!136 index!984)))))

(assert (=> b!636047 e!363827))

(declare-fun res!411533 () Bool)

(assert (=> b!636047 (=> (not res!411533) (not e!363827))))

(assert (=> b!636047 (= res!411533 (= lt!293985 (select (arr!18344 a!2986) j!136)))))

(assert (=> b!636047 (= lt!293985 (select (store (arr!18344 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!636048 () Bool)

(declare-fun res!411546 () Bool)

(assert (=> b!636048 (=> (not res!411546) (not e!363828))))

(declare-fun arrayNoDuplicates!0 (array!38238 (_ BitVec 32) List!12424) Bool)

(assert (=> b!636048 (= res!411546 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12421))))

(assert (= (and start!57506 res!411536) b!636031))

(assert (= (and b!636031 res!411548) b!636045))

(assert (= (and b!636045 res!411535) b!636036))

(assert (= (and b!636036 res!411543) b!636042))

(assert (= (and b!636042 res!411537) b!636046))

(assert (= (and b!636046 res!411542) b!636032))

(assert (= (and b!636032 res!411538) b!636048))

(assert (= (and b!636048 res!411546) b!636033))

(assert (= (and b!636033 res!411549) b!636035))

(assert (= (and b!636035 res!411545) b!636044))

(assert (= (and b!636044 res!411534) b!636034))

(assert (= (and b!636034 res!411541) b!636028))

(assert (= (and b!636034 c!72615) b!636030))

(assert (= (and b!636034 (not c!72615)) b!636029))

(assert (= (and b!636034 (not res!411544)) b!636047))

(assert (= (and b!636047 res!411533) b!636027))

(assert (= (and b!636027 (not res!411531)) b!636037))

(assert (= (and b!636037 res!411539) b!636041))

(assert (= (and b!636047 (not res!411540)) b!636043))

(assert (= (and b!636043 (not res!411547)) b!636039))

(assert (= (and b!636039 (not res!411550)) b!636038))

(assert (= (and b!636038 res!411532) b!636040))

(declare-fun m!609771 () Bool)

(assert (=> b!636042 m!609771))

(declare-fun m!609773 () Bool)

(assert (=> b!636034 m!609773))

(declare-fun m!609775 () Bool)

(assert (=> b!636034 m!609775))

(declare-fun m!609777 () Bool)

(assert (=> b!636034 m!609777))

(declare-fun m!609779 () Bool)

(assert (=> b!636034 m!609779))

(declare-fun m!609781 () Bool)

(assert (=> b!636034 m!609781))

(declare-fun m!609783 () Bool)

(assert (=> b!636034 m!609783))

(assert (=> b!636034 m!609777))

(declare-fun m!609785 () Bool)

(assert (=> b!636034 m!609785))

(declare-fun m!609787 () Bool)

(assert (=> b!636034 m!609787))

(declare-fun m!609789 () Bool)

(assert (=> b!636038 m!609789))

(declare-fun m!609791 () Bool)

(assert (=> b!636048 m!609791))

(assert (=> b!636037 m!609777))

(assert (=> b!636037 m!609777))

(declare-fun m!609793 () Bool)

(assert (=> b!636037 m!609793))

(declare-fun m!609795 () Bool)

(assert (=> b!636046 m!609795))

(declare-fun m!609797 () Bool)

(assert (=> start!57506 m!609797))

(declare-fun m!609799 () Bool)

(assert (=> start!57506 m!609799))

(declare-fun m!609801 () Bool)

(assert (=> b!636044 m!609801))

(assert (=> b!636044 m!609777))

(assert (=> b!636044 m!609777))

(declare-fun m!609803 () Bool)

(assert (=> b!636044 m!609803))

(assert (=> b!636047 m!609777))

(assert (=> b!636047 m!609779))

(declare-fun m!609805 () Bool)

(assert (=> b!636047 m!609805))

(declare-fun m!609807 () Bool)

(assert (=> b!636036 m!609807))

(declare-fun m!609809 () Bool)

(assert (=> b!636033 m!609809))

(assert (=> b!636043 m!609777))

(assert (=> b!636043 m!609777))

(declare-fun m!609811 () Bool)

(assert (=> b!636043 m!609811))

(assert (=> b!636043 m!609777))

(declare-fun m!609813 () Bool)

(assert (=> b!636043 m!609813))

(declare-fun m!609815 () Bool)

(assert (=> b!636040 m!609815))

(assert (=> b!636045 m!609777))

(assert (=> b!636045 m!609777))

(declare-fun m!609817 () Bool)

(assert (=> b!636045 m!609817))

(assert (=> b!636027 m!609777))

(assert (=> b!636035 m!609779))

(declare-fun m!609819 () Bool)

(assert (=> b!636035 m!609819))

(declare-fun m!609821 () Bool)

(assert (=> b!636032 m!609821))

(declare-fun m!609823 () Bool)

(assert (=> b!636039 m!609823))

(assert (=> b!636041 m!609777))

(assert (=> b!636041 m!609777))

(declare-fun m!609825 () Bool)

(assert (=> b!636041 m!609825))

(check-sat (not b!636040) (not b!636042) (not b!636043) (not b!636034) (not b!636039) (not b!636046) (not b!636032) (not b!636038) (not b!636041) (not b!636037) (not b!636044) (not b!636045) (not b!636048) (not b!636036) (not start!57506))
(check-sat)
(get-model)

(declare-fun b!636189 () Bool)

(declare-fun e!363929 () Bool)

(declare-fun e!363928 () Bool)

(assert (=> b!636189 (= e!363929 e!363928)))

(declare-fun lt!294069 () (_ BitVec 64))

(assert (=> b!636189 (= lt!294069 (select (arr!18344 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!294067 () Unit!21452)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38238 (_ BitVec 64) (_ BitVec 32)) Unit!21452)

(assert (=> b!636189 (= lt!294067 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!294069 #b00000000000000000000000000000000))))

(assert (=> b!636189 (arrayContainsKey!0 a!2986 lt!294069 #b00000000000000000000000000000000)))

(declare-fun lt!294068 () Unit!21452)

(assert (=> b!636189 (= lt!294068 lt!294067)))

(declare-fun res!411676 () Bool)

(assert (=> b!636189 (= res!411676 (= (seekEntryOrOpen!0 (select (arr!18344 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6781 #b00000000000000000000000000000000)))))

(assert (=> b!636189 (=> (not res!411676) (not e!363928))))

(declare-fun b!636190 () Bool)

(declare-fun e!363927 () Bool)

(assert (=> b!636190 (= e!363927 e!363929)))

(declare-fun c!72624 () Bool)

(assert (=> b!636190 (= c!72624 (validKeyInArray!0 (select (arr!18344 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!89723 () Bool)

(declare-fun res!411675 () Bool)

(assert (=> d!89723 (=> res!411675 e!363927)))

(assert (=> d!89723 (= res!411675 (bvsge #b00000000000000000000000000000000 (size!18709 a!2986)))))

(assert (=> d!89723 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!363927)))

(declare-fun b!636191 () Bool)

(declare-fun call!33406 () Bool)

(assert (=> b!636191 (= e!363928 call!33406)))

(declare-fun bm!33403 () Bool)

(assert (=> bm!33403 (= call!33406 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!636192 () Bool)

(assert (=> b!636192 (= e!363929 call!33406)))

(assert (= (and d!89723 (not res!411675)) b!636190))

(assert (= (and b!636190 c!72624) b!636189))

(assert (= (and b!636190 (not c!72624)) b!636192))

(assert (= (and b!636189 res!411676) b!636191))

(assert (= (or b!636191 b!636192) bm!33403))

(declare-fun m!609939 () Bool)

(assert (=> b!636189 m!609939))

(declare-fun m!609941 () Bool)

(assert (=> b!636189 m!609941))

(declare-fun m!609943 () Bool)

(assert (=> b!636189 m!609943))

(assert (=> b!636189 m!609939))

(declare-fun m!609945 () Bool)

(assert (=> b!636189 m!609945))

(assert (=> b!636190 m!609939))

(assert (=> b!636190 m!609939))

(declare-fun m!609947 () Bool)

(assert (=> b!636190 m!609947))

(declare-fun m!609949 () Bool)

(assert (=> bm!33403 m!609949))

(assert (=> b!636032 d!89723))

(declare-fun d!89725 () Bool)

(declare-fun res!411681 () Bool)

(declare-fun e!363934 () Bool)

(assert (=> d!89725 (=> res!411681 e!363934)))

(assert (=> d!89725 (= res!411681 (= (select (arr!18344 lt!293986) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18344 a!2986) j!136)))))

(assert (=> d!89725 (= (arrayContainsKey!0 lt!293986 (select (arr!18344 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!363934)))

(declare-fun b!636197 () Bool)

(declare-fun e!363935 () Bool)

(assert (=> b!636197 (= e!363934 e!363935)))

(declare-fun res!411682 () Bool)

(assert (=> b!636197 (=> (not res!411682) (not e!363935))))

(assert (=> b!636197 (= res!411682 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18709 lt!293986)))))

(declare-fun b!636198 () Bool)

(assert (=> b!636198 (= e!363935 (arrayContainsKey!0 lt!293986 (select (arr!18344 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!89725 (not res!411681)) b!636197))

(assert (= (and b!636197 res!411682) b!636198))

(declare-fun m!609951 () Bool)

(assert (=> d!89725 m!609951))

(assert (=> b!636198 m!609777))

(declare-fun m!609953 () Bool)

(assert (=> b!636198 m!609953))

(assert (=> b!636043 d!89725))

(declare-fun d!89727 () Bool)

(assert (=> d!89727 (arrayContainsKey!0 lt!293986 (select (arr!18344 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!294072 () Unit!21452)

(declare-fun choose!114 (array!38238 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21452)

(assert (=> d!89727 (= lt!294072 (choose!114 lt!293986 (select (arr!18344 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!89727 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!89727 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!293986 (select (arr!18344 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!294072)))

(declare-fun bs!19083 () Bool)

(assert (= bs!19083 d!89727))

(assert (=> bs!19083 m!609777))

(assert (=> bs!19083 m!609811))

(assert (=> bs!19083 m!609777))

(declare-fun m!609955 () Bool)

(assert (=> bs!19083 m!609955))

(assert (=> b!636043 d!89727))

(declare-fun d!89729 () Bool)

(declare-fun res!411683 () Bool)

(declare-fun e!363936 () Bool)

(assert (=> d!89729 (=> res!411683 e!363936)))

(assert (=> d!89729 (= res!411683 (= (select (arr!18344 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!89729 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!363936)))

(declare-fun b!636199 () Bool)

(declare-fun e!363937 () Bool)

(assert (=> b!636199 (= e!363936 e!363937)))

(declare-fun res!411684 () Bool)

(assert (=> b!636199 (=> (not res!411684) (not e!363937))))

(assert (=> b!636199 (= res!411684 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18709 a!2986)))))

(declare-fun b!636200 () Bool)

(assert (=> b!636200 (= e!363937 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!89729 (not res!411683)) b!636199))

(assert (= (and b!636199 res!411684) b!636200))

(assert (=> d!89729 m!609939))

(declare-fun m!609957 () Bool)

(assert (=> b!636200 m!609957))

(assert (=> b!636042 d!89729))

(declare-fun d!89731 () Bool)

(declare-fun res!411685 () Bool)

(declare-fun e!363938 () Bool)

(assert (=> d!89731 (=> res!411685 e!363938)))

(assert (=> d!89731 (= res!411685 (= (select (arr!18344 lt!293986) index!984) (select (arr!18344 a!2986) j!136)))))

(assert (=> d!89731 (= (arrayContainsKey!0 lt!293986 (select (arr!18344 a!2986) j!136) index!984) e!363938)))

(declare-fun b!636201 () Bool)

(declare-fun e!363939 () Bool)

(assert (=> b!636201 (= e!363938 e!363939)))

(declare-fun res!411686 () Bool)

(assert (=> b!636201 (=> (not res!411686) (not e!363939))))

(assert (=> b!636201 (= res!411686 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18709 lt!293986)))))

(declare-fun b!636202 () Bool)

(assert (=> b!636202 (= e!363939 (arrayContainsKey!0 lt!293986 (select (arr!18344 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!89731 (not res!411685)) b!636201))

(assert (= (and b!636201 res!411686) b!636202))

(declare-fun m!609959 () Bool)

(assert (=> d!89731 m!609959))

(assert (=> b!636202 m!609777))

(declare-fun m!609961 () Bool)

(assert (=> b!636202 m!609961))

(assert (=> b!636041 d!89731))

(declare-fun d!89733 () Bool)

(declare-fun lt!294075 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!240 (List!12424) (InoxSet (_ BitVec 64)))

(assert (=> d!89733 (= lt!294075 (select (content!240 Nil!12421) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!363944 () Bool)

(assert (=> d!89733 (= lt!294075 e!363944)))

(declare-fun res!411692 () Bool)

(assert (=> d!89733 (=> (not res!411692) (not e!363944))))

(get-info :version)

(assert (=> d!89733 (= res!411692 ((_ is Cons!12420) Nil!12421))))

(assert (=> d!89733 (= (contains!3084 Nil!12421 #b1000000000000000000000000000000000000000000000000000000000000000) lt!294075)))

(declare-fun b!636207 () Bool)

(declare-fun e!363945 () Bool)

(assert (=> b!636207 (= e!363944 e!363945)))

(declare-fun res!411691 () Bool)

(assert (=> b!636207 (=> res!411691 e!363945)))

(assert (=> b!636207 (= res!411691 (= (h!13465 Nil!12421) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!636208 () Bool)

(assert (=> b!636208 (= e!363945 (contains!3084 (t!18643 Nil!12421) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!89733 res!411692) b!636207))

(assert (= (and b!636207 (not res!411691)) b!636208))

(declare-fun m!609963 () Bool)

(assert (=> d!89733 m!609963))

(declare-fun m!609965 () Bool)

(assert (=> d!89733 m!609965))

(declare-fun m!609967 () Bool)

(assert (=> b!636208 m!609967))

(assert (=> b!636040 d!89733))

(declare-fun d!89735 () Bool)

(declare-fun res!411697 () Bool)

(declare-fun e!363950 () Bool)

(assert (=> d!89735 (=> res!411697 e!363950)))

(assert (=> d!89735 (= res!411697 ((_ is Nil!12421) Nil!12421))))

(assert (=> d!89735 (= (noDuplicate!383 Nil!12421) e!363950)))

(declare-fun b!636213 () Bool)

(declare-fun e!363951 () Bool)

(assert (=> b!636213 (= e!363950 e!363951)))

(declare-fun res!411698 () Bool)

(assert (=> b!636213 (=> (not res!411698) (not e!363951))))

(assert (=> b!636213 (= res!411698 (not (contains!3084 (t!18643 Nil!12421) (h!13465 Nil!12421))))))

(declare-fun b!636214 () Bool)

(assert (=> b!636214 (= e!363951 (noDuplicate!383 (t!18643 Nil!12421)))))

(assert (= (and d!89735 (not res!411697)) b!636213))

(assert (= (and b!636213 res!411698) b!636214))

(declare-fun m!609969 () Bool)

(assert (=> b!636213 m!609969))

(declare-fun m!609971 () Bool)

(assert (=> b!636214 m!609971))

(assert (=> b!636039 d!89735))

(declare-fun d!89737 () Bool)

(declare-fun lt!294076 () Bool)

(assert (=> d!89737 (= lt!294076 (select (content!240 Nil!12421) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!363952 () Bool)

(assert (=> d!89737 (= lt!294076 e!363952)))

(declare-fun res!411700 () Bool)

(assert (=> d!89737 (=> (not res!411700) (not e!363952))))

(assert (=> d!89737 (= res!411700 ((_ is Cons!12420) Nil!12421))))

(assert (=> d!89737 (= (contains!3084 Nil!12421 #b0000000000000000000000000000000000000000000000000000000000000000) lt!294076)))

(declare-fun b!636215 () Bool)

(declare-fun e!363953 () Bool)

(assert (=> b!636215 (= e!363952 e!363953)))

(declare-fun res!411699 () Bool)

(assert (=> b!636215 (=> res!411699 e!363953)))

(assert (=> b!636215 (= res!411699 (= (h!13465 Nil!12421) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!636216 () Bool)

(assert (=> b!636216 (= e!363953 (contains!3084 (t!18643 Nil!12421) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!89737 res!411700) b!636215))

(assert (= (and b!636215 (not res!411699)) b!636216))

(assert (=> d!89737 m!609963))

(declare-fun m!609973 () Bool)

(assert (=> d!89737 m!609973))

(declare-fun m!609975 () Bool)

(assert (=> b!636216 m!609975))

(assert (=> b!636038 d!89737))

(declare-fun b!636227 () Bool)

(declare-fun e!363964 () Bool)

(declare-fun call!33409 () Bool)

(assert (=> b!636227 (= e!363964 call!33409)))

(declare-fun b!636228 () Bool)

(declare-fun e!363963 () Bool)

(assert (=> b!636228 (= e!363963 e!363964)))

(declare-fun c!72627 () Bool)

(assert (=> b!636228 (= c!72627 (validKeyInArray!0 (select (arr!18344 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!636229 () Bool)

(declare-fun e!363965 () Bool)

(assert (=> b!636229 (= e!363965 (contains!3084 Nil!12421 (select (arr!18344 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33406 () Bool)

(assert (=> bm!33406 (= call!33409 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!72627 (Cons!12420 (select (arr!18344 a!2986) #b00000000000000000000000000000000) Nil!12421) Nil!12421)))))

(declare-fun d!89739 () Bool)

(declare-fun res!411708 () Bool)

(declare-fun e!363962 () Bool)

(assert (=> d!89739 (=> res!411708 e!363962)))

(assert (=> d!89739 (= res!411708 (bvsge #b00000000000000000000000000000000 (size!18709 a!2986)))))

(assert (=> d!89739 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12421) e!363962)))

(declare-fun b!636230 () Bool)

(assert (=> b!636230 (= e!363964 call!33409)))

(declare-fun b!636231 () Bool)

(assert (=> b!636231 (= e!363962 e!363963)))

(declare-fun res!411709 () Bool)

(assert (=> b!636231 (=> (not res!411709) (not e!363963))))

(assert (=> b!636231 (= res!411709 (not e!363965))))

(declare-fun res!411707 () Bool)

(assert (=> b!636231 (=> (not res!411707) (not e!363965))))

(assert (=> b!636231 (= res!411707 (validKeyInArray!0 (select (arr!18344 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!89739 (not res!411708)) b!636231))

(assert (= (and b!636231 res!411707) b!636229))

(assert (= (and b!636231 res!411709) b!636228))

(assert (= (and b!636228 c!72627) b!636227))

(assert (= (and b!636228 (not c!72627)) b!636230))

(assert (= (or b!636227 b!636230) bm!33406))

(assert (=> b!636228 m!609939))

(assert (=> b!636228 m!609939))

(assert (=> b!636228 m!609947))

(assert (=> b!636229 m!609939))

(assert (=> b!636229 m!609939))

(declare-fun m!609977 () Bool)

(assert (=> b!636229 m!609977))

(assert (=> bm!33406 m!609939))

(declare-fun m!609979 () Bool)

(assert (=> bm!33406 m!609979))

(assert (=> b!636231 m!609939))

(assert (=> b!636231 m!609939))

(assert (=> b!636231 m!609947))

(assert (=> b!636048 d!89739))

(declare-fun d!89741 () Bool)

(declare-fun res!411710 () Bool)

(declare-fun e!363966 () Bool)

(assert (=> d!89741 (=> res!411710 e!363966)))

(assert (=> d!89741 (= res!411710 (= (select (arr!18344 lt!293986) j!136) (select (arr!18344 a!2986) j!136)))))

(assert (=> d!89741 (= (arrayContainsKey!0 lt!293986 (select (arr!18344 a!2986) j!136) j!136) e!363966)))

(declare-fun b!636232 () Bool)

(declare-fun e!363967 () Bool)

(assert (=> b!636232 (= e!363966 e!363967)))

(declare-fun res!411711 () Bool)

(assert (=> b!636232 (=> (not res!411711) (not e!363967))))

(assert (=> b!636232 (= res!411711 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18709 lt!293986)))))

(declare-fun b!636233 () Bool)

(assert (=> b!636233 (= e!363967 (arrayContainsKey!0 lt!293986 (select (arr!18344 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!89741 (not res!411710)) b!636232))

(assert (= (and b!636232 res!411711) b!636233))

(declare-fun m!609981 () Bool)

(assert (=> d!89741 m!609981))

(assert (=> b!636233 m!609777))

(declare-fun m!609983 () Bool)

(assert (=> b!636233 m!609983))

(assert (=> b!636037 d!89741))

(declare-fun d!89743 () Bool)

(assert (=> d!89743 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!636036 d!89743))

(declare-fun d!89745 () Bool)

(assert (=> d!89745 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!57506 d!89745))

(declare-fun d!89747 () Bool)

(assert (=> d!89747 (= (array_inv!14227 a!2986) (bvsge (size!18709 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!57506 d!89747))

(declare-fun b!636268 () Bool)

(declare-fun e!363997 () SeekEntryResult!6781)

(declare-fun lt!294094 () SeekEntryResult!6781)

(assert (=> b!636268 (= e!363997 (Found!6781 (index!29434 lt!294094)))))

(declare-fun e!363998 () SeekEntryResult!6781)

(declare-fun b!636269 () Bool)

(assert (=> b!636269 (= e!363998 (seekKeyOrZeroReturnVacant!0 (x!58192 lt!294094) (index!29434 lt!294094) (index!29434 lt!294094) k0!1786 a!2986 mask!3053))))

(declare-fun b!636270 () Bool)

(declare-fun e!363996 () SeekEntryResult!6781)

(assert (=> b!636270 (= e!363996 e!363997)))

(declare-fun lt!294092 () (_ BitVec 64))

(assert (=> b!636270 (= lt!294092 (select (arr!18344 a!2986) (index!29434 lt!294094)))))

(declare-fun c!72635 () Bool)

(assert (=> b!636270 (= c!72635 (= lt!294092 k0!1786))))

(declare-fun b!636271 () Bool)

(assert (=> b!636271 (= e!363996 Undefined!6781)))

(declare-fun b!636272 () Bool)

(assert (=> b!636272 (= e!363998 (MissingZero!6781 (index!29434 lt!294094)))))

(declare-fun b!636273 () Bool)

(declare-fun c!72634 () Bool)

(assert (=> b!636273 (= c!72634 (= lt!294092 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!636273 (= e!363997 e!363998)))

(declare-fun d!89749 () Bool)

(declare-fun lt!294093 () SeekEntryResult!6781)

(assert (=> d!89749 (and (or ((_ is Undefined!6781) lt!294093) (not ((_ is Found!6781) lt!294093)) (and (bvsge (index!29433 lt!294093) #b00000000000000000000000000000000) (bvslt (index!29433 lt!294093) (size!18709 a!2986)))) (or ((_ is Undefined!6781) lt!294093) ((_ is Found!6781) lt!294093) (not ((_ is MissingZero!6781) lt!294093)) (and (bvsge (index!29432 lt!294093) #b00000000000000000000000000000000) (bvslt (index!29432 lt!294093) (size!18709 a!2986)))) (or ((_ is Undefined!6781) lt!294093) ((_ is Found!6781) lt!294093) ((_ is MissingZero!6781) lt!294093) (not ((_ is MissingVacant!6781) lt!294093)) (and (bvsge (index!29435 lt!294093) #b00000000000000000000000000000000) (bvslt (index!29435 lt!294093) (size!18709 a!2986)))) (or ((_ is Undefined!6781) lt!294093) (ite ((_ is Found!6781) lt!294093) (= (select (arr!18344 a!2986) (index!29433 lt!294093)) k0!1786) (ite ((_ is MissingZero!6781) lt!294093) (= (select (arr!18344 a!2986) (index!29432 lt!294093)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6781) lt!294093) (= (select (arr!18344 a!2986) (index!29435 lt!294093)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!89749 (= lt!294093 e!363996)))

(declare-fun c!72636 () Bool)

(assert (=> d!89749 (= c!72636 (and ((_ is Intermediate!6781) lt!294094) (undefined!7593 lt!294094)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38238 (_ BitVec 32)) SeekEntryResult!6781)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89749 (= lt!294094 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!89749 (validMask!0 mask!3053)))

(assert (=> d!89749 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!294093)))

(assert (= (and d!89749 c!72636) b!636271))

(assert (= (and d!89749 (not c!72636)) b!636270))

(assert (= (and b!636270 c!72635) b!636268))

(assert (= (and b!636270 (not c!72635)) b!636273))

(assert (= (and b!636273 c!72634) b!636272))

(assert (= (and b!636273 (not c!72634)) b!636269))

(declare-fun m!610011 () Bool)

(assert (=> b!636269 m!610011))

(declare-fun m!610013 () Bool)

(assert (=> b!636270 m!610013))

(declare-fun m!610015 () Bool)

(assert (=> d!89749 m!610015))

(assert (=> d!89749 m!610015))

(declare-fun m!610017 () Bool)

(assert (=> d!89749 m!610017))

(assert (=> d!89749 m!609797))

(declare-fun m!610019 () Bool)

(assert (=> d!89749 m!610019))

(declare-fun m!610021 () Bool)

(assert (=> d!89749 m!610021))

(declare-fun m!610023 () Bool)

(assert (=> d!89749 m!610023))

(assert (=> b!636046 d!89749))

(declare-fun b!636310 () Bool)

(declare-fun e!364018 () SeekEntryResult!6781)

(assert (=> b!636310 (= e!364018 Undefined!6781)))

(declare-fun b!636311 () Bool)

(declare-fun e!364019 () SeekEntryResult!6781)

(assert (=> b!636311 (= e!364019 (MissingVacant!6781 vacantSpotIndex!68))))

(declare-fun b!636312 () Bool)

(declare-fun e!364017 () SeekEntryResult!6781)

(assert (=> b!636312 (= e!364018 e!364017)))

(declare-fun c!72655 () Bool)

(declare-fun lt!294112 () (_ BitVec 64))

(assert (=> b!636312 (= c!72655 (= lt!294112 lt!293992))))

(declare-fun d!89769 () Bool)

(declare-fun lt!294111 () SeekEntryResult!6781)

(assert (=> d!89769 (and (or ((_ is Undefined!6781) lt!294111) (not ((_ is Found!6781) lt!294111)) (and (bvsge (index!29433 lt!294111) #b00000000000000000000000000000000) (bvslt (index!29433 lt!294111) (size!18709 lt!293986)))) (or ((_ is Undefined!6781) lt!294111) ((_ is Found!6781) lt!294111) (not ((_ is MissingVacant!6781) lt!294111)) (not (= (index!29435 lt!294111) vacantSpotIndex!68)) (and (bvsge (index!29435 lt!294111) #b00000000000000000000000000000000) (bvslt (index!29435 lt!294111) (size!18709 lt!293986)))) (or ((_ is Undefined!6781) lt!294111) (ite ((_ is Found!6781) lt!294111) (= (select (arr!18344 lt!293986) (index!29433 lt!294111)) lt!293992) (and ((_ is MissingVacant!6781) lt!294111) (= (index!29435 lt!294111) vacantSpotIndex!68) (= (select (arr!18344 lt!293986) (index!29435 lt!294111)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89769 (= lt!294111 e!364018)))

(declare-fun c!72656 () Bool)

(assert (=> d!89769 (= c!72656 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89769 (= lt!294112 (select (arr!18344 lt!293986) lt!293990))))

(assert (=> d!89769 (validMask!0 mask!3053)))

(assert (=> d!89769 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293990 vacantSpotIndex!68 lt!293992 lt!293986 mask!3053) lt!294111)))

(declare-fun b!636313 () Bool)

(assert (=> b!636313 (= e!364019 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!293990 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!293992 lt!293986 mask!3053))))

(declare-fun b!636314 () Bool)

(declare-fun c!72657 () Bool)

(assert (=> b!636314 (= c!72657 (= lt!294112 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!636314 (= e!364017 e!364019)))

(declare-fun b!636315 () Bool)

(assert (=> b!636315 (= e!364017 (Found!6781 lt!293990))))

(assert (= (and d!89769 c!72656) b!636310))

(assert (= (and d!89769 (not c!72656)) b!636312))

(assert (= (and b!636312 c!72655) b!636315))

(assert (= (and b!636312 (not c!72655)) b!636314))

(assert (= (and b!636314 c!72657) b!636311))

(assert (= (and b!636314 (not c!72657)) b!636313))

(declare-fun m!610025 () Bool)

(assert (=> d!89769 m!610025))

(declare-fun m!610027 () Bool)

(assert (=> d!89769 m!610027))

(declare-fun m!610029 () Bool)

(assert (=> d!89769 m!610029))

(assert (=> d!89769 m!609797))

(declare-fun m!610031 () Bool)

(assert (=> b!636313 m!610031))

(assert (=> b!636313 m!610031))

(declare-fun m!610033 () Bool)

(assert (=> b!636313 m!610033))

(assert (=> b!636034 d!89769))

(declare-fun b!636322 () Bool)

(declare-fun e!364024 () SeekEntryResult!6781)

(assert (=> b!636322 (= e!364024 Undefined!6781)))

(declare-fun b!636323 () Bool)

(declare-fun e!364025 () SeekEntryResult!6781)

(assert (=> b!636323 (= e!364025 (MissingVacant!6781 vacantSpotIndex!68))))

(declare-fun b!636324 () Bool)

(declare-fun e!364023 () SeekEntryResult!6781)

(assert (=> b!636324 (= e!364024 e!364023)))

(declare-fun c!72661 () Bool)

(declare-fun lt!294117 () (_ BitVec 64))

(assert (=> b!636324 (= c!72661 (= lt!294117 lt!293992))))

(declare-fun lt!294116 () SeekEntryResult!6781)

(declare-fun d!89771 () Bool)

(assert (=> d!89771 (and (or ((_ is Undefined!6781) lt!294116) (not ((_ is Found!6781) lt!294116)) (and (bvsge (index!29433 lt!294116) #b00000000000000000000000000000000) (bvslt (index!29433 lt!294116) (size!18709 lt!293986)))) (or ((_ is Undefined!6781) lt!294116) ((_ is Found!6781) lt!294116) (not ((_ is MissingVacant!6781) lt!294116)) (not (= (index!29435 lt!294116) vacantSpotIndex!68)) (and (bvsge (index!29435 lt!294116) #b00000000000000000000000000000000) (bvslt (index!29435 lt!294116) (size!18709 lt!293986)))) (or ((_ is Undefined!6781) lt!294116) (ite ((_ is Found!6781) lt!294116) (= (select (arr!18344 lt!293986) (index!29433 lt!294116)) lt!293992) (and ((_ is MissingVacant!6781) lt!294116) (= (index!29435 lt!294116) vacantSpotIndex!68) (= (select (arr!18344 lt!293986) (index!29435 lt!294116)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89771 (= lt!294116 e!364024)))

(declare-fun c!72662 () Bool)

(assert (=> d!89771 (= c!72662 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89771 (= lt!294117 (select (arr!18344 lt!293986) index!984))))

(assert (=> d!89771 (validMask!0 mask!3053)))

(assert (=> d!89771 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293992 lt!293986 mask!3053) lt!294116)))

(declare-fun b!636325 () Bool)

(assert (=> b!636325 (= e!364025 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!293992 lt!293986 mask!3053))))

(declare-fun b!636326 () Bool)

(declare-fun c!72663 () Bool)

(assert (=> b!636326 (= c!72663 (= lt!294117 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!636326 (= e!364023 e!364025)))

(declare-fun b!636327 () Bool)

(assert (=> b!636327 (= e!364023 (Found!6781 index!984))))

(assert (= (and d!89771 c!72662) b!636322))

(assert (= (and d!89771 (not c!72662)) b!636324))

(assert (= (and b!636324 c!72661) b!636327))

(assert (= (and b!636324 (not c!72661)) b!636326))

(assert (= (and b!636326 c!72663) b!636323))

(assert (= (and b!636326 (not c!72663)) b!636325))

(declare-fun m!610045 () Bool)

(assert (=> d!89771 m!610045))

(declare-fun m!610049 () Bool)

(assert (=> d!89771 m!610049))

(assert (=> d!89771 m!609959))

(assert (=> d!89771 m!609797))

(assert (=> b!636325 m!609773))

(assert (=> b!636325 m!609773))

(declare-fun m!610053 () Bool)

(assert (=> b!636325 m!610053))

(assert (=> b!636034 d!89771))

(declare-fun d!89775 () Bool)

(declare-fun e!364044 () Bool)

(assert (=> d!89775 e!364044))

(declare-fun res!411746 () Bool)

(assert (=> d!89775 (=> (not res!411746) (not e!364044))))

(assert (=> d!89775 (= res!411746 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18709 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18709 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18709 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18709 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18709 a!2986))))))

(declare-fun lt!294133 () Unit!21452)

(declare-fun choose!9 (array!38238 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21452)

(assert (=> d!89775 (= lt!294133 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293990 vacantSpotIndex!68 mask!3053))))

(assert (=> d!89775 (validMask!0 mask!3053)))

(assert (=> d!89775 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293990 vacantSpotIndex!68 mask!3053) lt!294133)))

(declare-fun b!636352 () Bool)

(assert (=> b!636352 (= e!364044 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293990 vacantSpotIndex!68 (select (arr!18344 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293990 vacantSpotIndex!68 (select (store (arr!18344 a!2986) i!1108 k0!1786) j!136) (array!38239 (store (arr!18344 a!2986) i!1108 k0!1786) (size!18709 a!2986)) mask!3053)))))

(assert (= (and d!89775 res!411746) b!636352))

(declare-fun m!610087 () Bool)

(assert (=> d!89775 m!610087))

(assert (=> d!89775 m!609797))

(assert (=> b!636352 m!609777))

(assert (=> b!636352 m!609785))

(assert (=> b!636352 m!609777))

(assert (=> b!636352 m!609775))

(declare-fun m!610089 () Bool)

(assert (=> b!636352 m!610089))

(assert (=> b!636352 m!609779))

(assert (=> b!636352 m!609775))

(assert (=> b!636034 d!89775))

(declare-fun d!89791 () Bool)

(declare-fun lt!294136 () (_ BitVec 32))

(assert (=> d!89791 (and (bvsge lt!294136 #b00000000000000000000000000000000) (bvslt lt!294136 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89791 (= lt!294136 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!89791 (validMask!0 mask!3053)))

(assert (=> d!89791 (= (nextIndex!0 index!984 x!910 mask!3053) lt!294136)))

(declare-fun bs!19086 () Bool)

(assert (= bs!19086 d!89791))

(declare-fun m!610091 () Bool)

(assert (=> bs!19086 m!610091))

(assert (=> bs!19086 m!609797))

(assert (=> b!636034 d!89791))

(declare-fun b!636353 () Bool)

(declare-fun e!364046 () SeekEntryResult!6781)

(assert (=> b!636353 (= e!364046 Undefined!6781)))

(declare-fun b!636354 () Bool)

(declare-fun e!364047 () SeekEntryResult!6781)

(assert (=> b!636354 (= e!364047 (MissingVacant!6781 vacantSpotIndex!68))))

(declare-fun b!636355 () Bool)

(declare-fun e!364045 () SeekEntryResult!6781)

(assert (=> b!636355 (= e!364046 e!364045)))

(declare-fun c!72670 () Bool)

(declare-fun lt!294138 () (_ BitVec 64))

(assert (=> b!636355 (= c!72670 (= lt!294138 (select (arr!18344 a!2986) j!136)))))

(declare-fun d!89793 () Bool)

(declare-fun lt!294137 () SeekEntryResult!6781)

(assert (=> d!89793 (and (or ((_ is Undefined!6781) lt!294137) (not ((_ is Found!6781) lt!294137)) (and (bvsge (index!29433 lt!294137) #b00000000000000000000000000000000) (bvslt (index!29433 lt!294137) (size!18709 a!2986)))) (or ((_ is Undefined!6781) lt!294137) ((_ is Found!6781) lt!294137) (not ((_ is MissingVacant!6781) lt!294137)) (not (= (index!29435 lt!294137) vacantSpotIndex!68)) (and (bvsge (index!29435 lt!294137) #b00000000000000000000000000000000) (bvslt (index!29435 lt!294137) (size!18709 a!2986)))) (or ((_ is Undefined!6781) lt!294137) (ite ((_ is Found!6781) lt!294137) (= (select (arr!18344 a!2986) (index!29433 lt!294137)) (select (arr!18344 a!2986) j!136)) (and ((_ is MissingVacant!6781) lt!294137) (= (index!29435 lt!294137) vacantSpotIndex!68) (= (select (arr!18344 a!2986) (index!29435 lt!294137)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89793 (= lt!294137 e!364046)))

(declare-fun c!72671 () Bool)

(assert (=> d!89793 (= c!72671 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89793 (= lt!294138 (select (arr!18344 a!2986) lt!293990))))

(assert (=> d!89793 (validMask!0 mask!3053)))

(assert (=> d!89793 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293990 vacantSpotIndex!68 (select (arr!18344 a!2986) j!136) a!2986 mask!3053) lt!294137)))

(declare-fun b!636356 () Bool)

(assert (=> b!636356 (= e!364047 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!293990 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18344 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!636357 () Bool)

(declare-fun c!72672 () Bool)

(assert (=> b!636357 (= c!72672 (= lt!294138 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!636357 (= e!364045 e!364047)))

(declare-fun b!636358 () Bool)

(assert (=> b!636358 (= e!364045 (Found!6781 lt!293990))))

(assert (= (and d!89793 c!72671) b!636353))

(assert (= (and d!89793 (not c!72671)) b!636355))

(assert (= (and b!636355 c!72670) b!636358))

(assert (= (and b!636355 (not c!72670)) b!636357))

(assert (= (and b!636357 c!72672) b!636354))

(assert (= (and b!636357 (not c!72672)) b!636356))

(declare-fun m!610093 () Bool)

(assert (=> d!89793 m!610093))

(declare-fun m!610095 () Bool)

(assert (=> d!89793 m!610095))

(declare-fun m!610097 () Bool)

(assert (=> d!89793 m!610097))

(assert (=> d!89793 m!609797))

(assert (=> b!636356 m!610031))

(assert (=> b!636356 m!610031))

(assert (=> b!636356 m!609777))

(declare-fun m!610099 () Bool)

(assert (=> b!636356 m!610099))

(assert (=> b!636034 d!89793))

(declare-fun d!89795 () Bool)

(assert (=> d!89795 (= (validKeyInArray!0 (select (arr!18344 a!2986) j!136)) (and (not (= (select (arr!18344 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18344 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!636045 d!89795))

(declare-fun b!636359 () Bool)

(declare-fun e!364049 () SeekEntryResult!6781)

(assert (=> b!636359 (= e!364049 Undefined!6781)))

(declare-fun b!636360 () Bool)

(declare-fun e!364050 () SeekEntryResult!6781)

(assert (=> b!636360 (= e!364050 (MissingVacant!6781 vacantSpotIndex!68))))

(declare-fun b!636361 () Bool)

(declare-fun e!364048 () SeekEntryResult!6781)

(assert (=> b!636361 (= e!364049 e!364048)))

(declare-fun c!72673 () Bool)

(declare-fun lt!294140 () (_ BitVec 64))

(assert (=> b!636361 (= c!72673 (= lt!294140 (select (arr!18344 a!2986) j!136)))))

(declare-fun lt!294139 () SeekEntryResult!6781)

(declare-fun d!89797 () Bool)

(assert (=> d!89797 (and (or ((_ is Undefined!6781) lt!294139) (not ((_ is Found!6781) lt!294139)) (and (bvsge (index!29433 lt!294139) #b00000000000000000000000000000000) (bvslt (index!29433 lt!294139) (size!18709 a!2986)))) (or ((_ is Undefined!6781) lt!294139) ((_ is Found!6781) lt!294139) (not ((_ is MissingVacant!6781) lt!294139)) (not (= (index!29435 lt!294139) vacantSpotIndex!68)) (and (bvsge (index!29435 lt!294139) #b00000000000000000000000000000000) (bvslt (index!29435 lt!294139) (size!18709 a!2986)))) (or ((_ is Undefined!6781) lt!294139) (ite ((_ is Found!6781) lt!294139) (= (select (arr!18344 a!2986) (index!29433 lt!294139)) (select (arr!18344 a!2986) j!136)) (and ((_ is MissingVacant!6781) lt!294139) (= (index!29435 lt!294139) vacantSpotIndex!68) (= (select (arr!18344 a!2986) (index!29435 lt!294139)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89797 (= lt!294139 e!364049)))

(declare-fun c!72674 () Bool)

(assert (=> d!89797 (= c!72674 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89797 (= lt!294140 (select (arr!18344 a!2986) index!984))))

(assert (=> d!89797 (validMask!0 mask!3053)))

(assert (=> d!89797 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18344 a!2986) j!136) a!2986 mask!3053) lt!294139)))

(declare-fun b!636362 () Bool)

(assert (=> b!636362 (= e!364050 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18344 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!636363 () Bool)

(declare-fun c!72675 () Bool)

(assert (=> b!636363 (= c!72675 (= lt!294140 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!636363 (= e!364048 e!364050)))

(declare-fun b!636364 () Bool)

(assert (=> b!636364 (= e!364048 (Found!6781 index!984))))

(assert (= (and d!89797 c!72674) b!636359))

(assert (= (and d!89797 (not c!72674)) b!636361))

(assert (= (and b!636361 c!72673) b!636364))

(assert (= (and b!636361 (not c!72673)) b!636363))

(assert (= (and b!636363 c!72675) b!636360))

(assert (= (and b!636363 (not c!72675)) b!636362))

(declare-fun m!610101 () Bool)

(assert (=> d!89797 m!610101))

(declare-fun m!610103 () Bool)

(assert (=> d!89797 m!610103))

(assert (=> d!89797 m!609801))

(assert (=> d!89797 m!609797))

(assert (=> b!636362 m!609773))

(assert (=> b!636362 m!609773))

(assert (=> b!636362 m!609777))

(declare-fun m!610105 () Bool)

(assert (=> b!636362 m!610105))

(assert (=> b!636044 d!89797))

(check-sat (not d!89727) (not d!89797) (not d!89733) (not b!636190) (not b!636229) (not b!636214) (not b!636313) (not d!89749) (not d!89793) (not d!89769) (not b!636356) (not b!636189) (not d!89771) (not b!636198) (not d!89791) (not bm!33406) (not b!636208) (not d!89737) (not bm!33403) (not b!636200) (not b!636362) (not d!89775) (not b!636325) (not b!636216) (not b!636269) (not b!636213) (not b!636352) (not b!636228) (not b!636202) (not b!636233) (not b!636231))
(check-sat)

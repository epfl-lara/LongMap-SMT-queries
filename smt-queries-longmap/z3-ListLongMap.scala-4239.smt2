; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58526 () Bool)

(assert start!58526)

(declare-fun b!645887 () Bool)

(declare-fun e!370195 () Bool)

(declare-fun e!370192 () Bool)

(assert (=> b!645887 (= e!370195 (not e!370192))))

(declare-fun res!418508 () Bool)

(assert (=> b!645887 (=> res!418508 e!370192)))

(declare-datatypes ((SeekEntryResult!6883 0))(
  ( (MissingZero!6883 (index!29870 (_ BitVec 32))) (Found!6883 (index!29871 (_ BitVec 32))) (Intermediate!6883 (undefined!7695 Bool) (index!29872 (_ BitVec 32)) (x!58656 (_ BitVec 32))) (Undefined!6883) (MissingVacant!6883 (index!29873 (_ BitVec 32))) )
))
(declare-fun lt!299486 () SeekEntryResult!6883)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!645887 (= res!418508 (not (= lt!299486 (Found!6883 index!984))))))

(declare-datatypes ((Unit!21926 0))(
  ( (Unit!21927) )
))
(declare-fun lt!299479 () Unit!21926)

(declare-fun e!370200 () Unit!21926)

(assert (=> b!645887 (= lt!299479 e!370200)))

(declare-fun c!74057 () Bool)

(assert (=> b!645887 (= c!74057 (= lt!299486 Undefined!6883))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!38472 0))(
  ( (array!38473 (arr!18446 (Array (_ BitVec 32) (_ BitVec 64))) (size!18811 (_ BitVec 32))) )
))
(declare-fun lt!299476 () array!38472)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!299485 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38472 (_ BitVec 32)) SeekEntryResult!6883)

(assert (=> b!645887 (= lt!299486 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!299485 lt!299476 mask!3053))))

(declare-fun e!370198 () Bool)

(assert (=> b!645887 e!370198))

(declare-fun res!418522 () Bool)

(assert (=> b!645887 (=> (not res!418522) (not e!370198))))

(declare-fun lt!299482 () (_ BitVec 32))

(declare-fun lt!299487 () SeekEntryResult!6883)

(assert (=> b!645887 (= res!418522 (= lt!299487 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299482 vacantSpotIndex!68 lt!299485 lt!299476 mask!3053)))))

(declare-fun a!2986 () array!38472)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!645887 (= lt!299487 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299482 vacantSpotIndex!68 (select (arr!18446 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!645887 (= lt!299485 (select (store (arr!18446 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!299477 () Unit!21926)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38472 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21926)

(assert (=> b!645887 (= lt!299477 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!299482 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!645887 (= lt!299482 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!645888 () Bool)

(declare-fun res!418509 () Bool)

(declare-fun e!370199 () Bool)

(assert (=> b!645888 (=> (not res!418509) (not e!370199))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!645888 (= res!418509 (validKeyInArray!0 (select (arr!18446 a!2986) j!136)))))

(declare-fun res!418519 () Bool)

(assert (=> start!58526 (=> (not res!418519) (not e!370199))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58526 (= res!418519 (validMask!0 mask!3053))))

(assert (=> start!58526 e!370199))

(assert (=> start!58526 true))

(declare-fun array_inv!14329 (array!38472) Bool)

(assert (=> start!58526 (array_inv!14329 a!2986)))

(declare-fun b!645889 () Bool)

(declare-fun res!418517 () Bool)

(assert (=> b!645889 (=> (not res!418517) (not e!370199))))

(assert (=> b!645889 (= res!418517 (and (= (size!18811 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18811 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18811 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!645890 () Bool)

(declare-fun lt!299480 () SeekEntryResult!6883)

(assert (=> b!645890 (= e!370198 (= lt!299480 lt!299487))))

(declare-fun b!645891 () Bool)

(declare-fun e!370196 () Bool)

(declare-fun e!370197 () Bool)

(assert (=> b!645891 (= e!370196 e!370197)))

(declare-fun res!418511 () Bool)

(assert (=> b!645891 (=> res!418511 e!370197)))

(assert (=> b!645891 (= res!418511 (bvsge index!984 j!136))))

(declare-fun lt!299475 () Unit!21926)

(declare-fun e!370201 () Unit!21926)

(assert (=> b!645891 (= lt!299475 e!370201)))

(declare-fun c!74058 () Bool)

(assert (=> b!645891 (= c!74058 (bvslt j!136 index!984))))

(declare-fun e!370205 () Bool)

(declare-fun b!645892 () Bool)

(declare-fun arrayContainsKey!0 (array!38472 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!645892 (= e!370205 (arrayContainsKey!0 lt!299476 (select (arr!18446 a!2986) j!136) index!984))))

(declare-fun b!645893 () Bool)

(declare-fun res!418512 () Bool)

(assert (=> b!645893 (=> (not res!418512) (not e!370199))))

(assert (=> b!645893 (= res!418512 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!645894 () Bool)

(declare-fun res!418507 () Bool)

(declare-fun e!370193 () Bool)

(assert (=> b!645894 (=> (not res!418507) (not e!370193))))

(assert (=> b!645894 (= res!418507 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18446 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!645895 () Bool)

(declare-fun Unit!21928 () Unit!21926)

(assert (=> b!645895 (= e!370201 Unit!21928)))

(declare-fun b!645896 () Bool)

(assert (=> b!645896 (= e!370192 e!370196)))

(declare-fun res!418523 () Bool)

(assert (=> b!645896 (=> res!418523 e!370196)))

(declare-fun lt!299481 () (_ BitVec 64))

(assert (=> b!645896 (= res!418523 (or (not (= (select (arr!18446 a!2986) j!136) lt!299485)) (not (= (select (arr!18446 a!2986) j!136) lt!299481))))))

(declare-fun e!370203 () Bool)

(assert (=> b!645896 e!370203))

(declare-fun res!418520 () Bool)

(assert (=> b!645896 (=> (not res!418520) (not e!370203))))

(assert (=> b!645896 (= res!418520 (= lt!299481 (select (arr!18446 a!2986) j!136)))))

(assert (=> b!645896 (= lt!299481 (select (store (arr!18446 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!645897 () Bool)

(declare-fun e!370194 () Bool)

(assert (=> b!645897 (= e!370194 e!370195)))

(declare-fun res!418515 () Bool)

(assert (=> b!645897 (=> (not res!418515) (not e!370195))))

(assert (=> b!645897 (= res!418515 (and (= lt!299480 (Found!6883 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18446 a!2986) index!984) (select (arr!18446 a!2986) j!136))) (not (= (select (arr!18446 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!645897 (= lt!299480 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18446 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!645898 () Bool)

(declare-fun res!418513 () Bool)

(assert (=> b!645898 (=> (not res!418513) (not e!370193))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38472 (_ BitVec 32)) Bool)

(assert (=> b!645898 (= res!418513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!645899 () Bool)

(assert (=> b!645899 (= e!370197 true)))

(assert (=> b!645899 (arrayContainsKey!0 lt!299476 (select (arr!18446 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!299478 () Unit!21926)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38472 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21926)

(assert (=> b!645899 (= lt!299478 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299476 (select (arr!18446 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!370204 () Bool)

(assert (=> b!645899 e!370204))

(declare-fun res!418524 () Bool)

(assert (=> b!645899 (=> (not res!418524) (not e!370204))))

(assert (=> b!645899 (= res!418524 (arrayContainsKey!0 lt!299476 (select (arr!18446 a!2986) j!136) j!136))))

(declare-fun b!645900 () Bool)

(declare-fun res!418521 () Bool)

(assert (=> b!645900 (=> (not res!418521) (not e!370193))))

(declare-datatypes ((List!12526 0))(
  ( (Nil!12523) (Cons!12522 (h!13567 (_ BitVec 64)) (t!18745 List!12526)) )
))
(declare-fun arrayNoDuplicates!0 (array!38472 (_ BitVec 32) List!12526) Bool)

(assert (=> b!645900 (= res!418521 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12523))))

(declare-fun b!645901 () Bool)

(assert (=> b!645901 (= e!370204 (arrayContainsKey!0 lt!299476 (select (arr!18446 a!2986) j!136) index!984))))

(declare-fun b!645902 () Bool)

(declare-fun e!370202 () Bool)

(assert (=> b!645902 (= e!370202 e!370205)))

(declare-fun res!418518 () Bool)

(assert (=> b!645902 (=> (not res!418518) (not e!370205))))

(assert (=> b!645902 (= res!418518 (arrayContainsKey!0 lt!299476 (select (arr!18446 a!2986) j!136) j!136))))

(declare-fun b!645903 () Bool)

(assert (=> b!645903 (= e!370203 e!370202)))

(declare-fun res!418510 () Bool)

(assert (=> b!645903 (=> res!418510 e!370202)))

(assert (=> b!645903 (= res!418510 (or (not (= (select (arr!18446 a!2986) j!136) lt!299485)) (not (= (select (arr!18446 a!2986) j!136) lt!299481)) (bvsge j!136 index!984)))))

(declare-fun b!645904 () Bool)

(declare-fun res!418516 () Bool)

(assert (=> b!645904 (=> (not res!418516) (not e!370199))))

(assert (=> b!645904 (= res!418516 (validKeyInArray!0 k0!1786))))

(declare-fun b!645905 () Bool)

(assert (=> b!645905 (= e!370199 e!370193)))

(declare-fun res!418525 () Bool)

(assert (=> b!645905 (=> (not res!418525) (not e!370193))))

(declare-fun lt!299473 () SeekEntryResult!6883)

(assert (=> b!645905 (= res!418525 (or (= lt!299473 (MissingZero!6883 i!1108)) (= lt!299473 (MissingVacant!6883 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38472 (_ BitVec 32)) SeekEntryResult!6883)

(assert (=> b!645905 (= lt!299473 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!645906 () Bool)

(declare-fun Unit!21929 () Unit!21926)

(assert (=> b!645906 (= e!370200 Unit!21929)))

(assert (=> b!645906 false))

(declare-fun b!645907 () Bool)

(declare-fun Unit!21930 () Unit!21926)

(assert (=> b!645907 (= e!370200 Unit!21930)))

(declare-fun b!645908 () Bool)

(assert (=> b!645908 (= e!370193 e!370194)))

(declare-fun res!418514 () Bool)

(assert (=> b!645908 (=> (not res!418514) (not e!370194))))

(assert (=> b!645908 (= res!418514 (= (select (store (arr!18446 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!645908 (= lt!299476 (array!38473 (store (arr!18446 a!2986) i!1108 k0!1786) (size!18811 a!2986)))))

(declare-fun b!645909 () Bool)

(declare-fun Unit!21931 () Unit!21926)

(assert (=> b!645909 (= e!370201 Unit!21931)))

(declare-fun lt!299484 () Unit!21926)

(assert (=> b!645909 (= lt!299484 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299476 (select (arr!18446 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!645909 (arrayContainsKey!0 lt!299476 (select (arr!18446 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!299474 () Unit!21926)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38472 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12526) Unit!21926)

(assert (=> b!645909 (= lt!299474 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12523))))

(assert (=> b!645909 (arrayNoDuplicates!0 lt!299476 #b00000000000000000000000000000000 Nil!12523)))

(declare-fun lt!299472 () Unit!21926)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38472 (_ BitVec 32) (_ BitVec 32)) Unit!21926)

(assert (=> b!645909 (= lt!299472 (lemmaNoDuplicateFromThenFromBigger!0 lt!299476 #b00000000000000000000000000000000 j!136))))

(assert (=> b!645909 (arrayNoDuplicates!0 lt!299476 j!136 Nil!12523)))

(declare-fun lt!299483 () Unit!21926)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38472 (_ BitVec 64) (_ BitVec 32) List!12526) Unit!21926)

(assert (=> b!645909 (= lt!299483 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!299476 (select (arr!18446 a!2986) j!136) j!136 Nil!12523))))

(assert (=> b!645909 false))

(assert (= (and start!58526 res!418519) b!645889))

(assert (= (and b!645889 res!418517) b!645888))

(assert (= (and b!645888 res!418509) b!645904))

(assert (= (and b!645904 res!418516) b!645893))

(assert (= (and b!645893 res!418512) b!645905))

(assert (= (and b!645905 res!418525) b!645898))

(assert (= (and b!645898 res!418513) b!645900))

(assert (= (and b!645900 res!418521) b!645894))

(assert (= (and b!645894 res!418507) b!645908))

(assert (= (and b!645908 res!418514) b!645897))

(assert (= (and b!645897 res!418515) b!645887))

(assert (= (and b!645887 res!418522) b!645890))

(assert (= (and b!645887 c!74057) b!645906))

(assert (= (and b!645887 (not c!74057)) b!645907))

(assert (= (and b!645887 (not res!418508)) b!645896))

(assert (= (and b!645896 res!418520) b!645903))

(assert (= (and b!645903 (not res!418510)) b!645902))

(assert (= (and b!645902 res!418518) b!645892))

(assert (= (and b!645896 (not res!418523)) b!645891))

(assert (= (and b!645891 c!74058) b!645909))

(assert (= (and b!645891 (not c!74058)) b!645895))

(assert (= (and b!645891 (not res!418511)) b!645899))

(assert (= (and b!645899 res!418524) b!645901))

(declare-fun m!618885 () Bool)

(assert (=> b!645887 m!618885))

(declare-fun m!618887 () Bool)

(assert (=> b!645887 m!618887))

(declare-fun m!618889 () Bool)

(assert (=> b!645887 m!618889))

(declare-fun m!618891 () Bool)

(assert (=> b!645887 m!618891))

(declare-fun m!618893 () Bool)

(assert (=> b!645887 m!618893))

(declare-fun m!618895 () Bool)

(assert (=> b!645887 m!618895))

(declare-fun m!618897 () Bool)

(assert (=> b!645887 m!618897))

(assert (=> b!645887 m!618889))

(declare-fun m!618899 () Bool)

(assert (=> b!645887 m!618899))

(declare-fun m!618901 () Bool)

(assert (=> b!645898 m!618901))

(declare-fun m!618903 () Bool)

(assert (=> start!58526 m!618903))

(declare-fun m!618905 () Bool)

(assert (=> start!58526 m!618905))

(declare-fun m!618907 () Bool)

(assert (=> b!645904 m!618907))

(declare-fun m!618909 () Bool)

(assert (=> b!645894 m!618909))

(assert (=> b!645896 m!618889))

(assert (=> b!645896 m!618891))

(declare-fun m!618911 () Bool)

(assert (=> b!645896 m!618911))

(assert (=> b!645903 m!618889))

(assert (=> b!645901 m!618889))

(assert (=> b!645901 m!618889))

(declare-fun m!618913 () Bool)

(assert (=> b!645901 m!618913))

(declare-fun m!618915 () Bool)

(assert (=> b!645897 m!618915))

(assert (=> b!645897 m!618889))

(assert (=> b!645897 m!618889))

(declare-fun m!618917 () Bool)

(assert (=> b!645897 m!618917))

(assert (=> b!645902 m!618889))

(assert (=> b!645902 m!618889))

(declare-fun m!618919 () Bool)

(assert (=> b!645902 m!618919))

(declare-fun m!618921 () Bool)

(assert (=> b!645893 m!618921))

(declare-fun m!618923 () Bool)

(assert (=> b!645905 m!618923))

(assert (=> b!645908 m!618891))

(declare-fun m!618925 () Bool)

(assert (=> b!645908 m!618925))

(assert (=> b!645899 m!618889))

(assert (=> b!645899 m!618889))

(declare-fun m!618927 () Bool)

(assert (=> b!645899 m!618927))

(assert (=> b!645899 m!618889))

(declare-fun m!618929 () Bool)

(assert (=> b!645899 m!618929))

(assert (=> b!645899 m!618889))

(assert (=> b!645899 m!618919))

(assert (=> b!645888 m!618889))

(assert (=> b!645888 m!618889))

(declare-fun m!618931 () Bool)

(assert (=> b!645888 m!618931))

(declare-fun m!618933 () Bool)

(assert (=> b!645900 m!618933))

(assert (=> b!645892 m!618889))

(assert (=> b!645892 m!618889))

(assert (=> b!645892 m!618913))

(assert (=> b!645909 m!618889))

(declare-fun m!618935 () Bool)

(assert (=> b!645909 m!618935))

(declare-fun m!618937 () Bool)

(assert (=> b!645909 m!618937))

(assert (=> b!645909 m!618889))

(declare-fun m!618939 () Bool)

(assert (=> b!645909 m!618939))

(assert (=> b!645909 m!618889))

(declare-fun m!618941 () Bool)

(assert (=> b!645909 m!618941))

(declare-fun m!618943 () Bool)

(assert (=> b!645909 m!618943))

(declare-fun m!618945 () Bool)

(assert (=> b!645909 m!618945))

(declare-fun m!618947 () Bool)

(assert (=> b!645909 m!618947))

(assert (=> b!645909 m!618889))

(check-sat (not b!645905) (not start!58526) (not b!645897) (not b!645892) (not b!645904) (not b!645898) (not b!645893) (not b!645887) (not b!645888) (not b!645909) (not b!645901) (not b!645900) (not b!645899) (not b!645902))
(check-sat)
